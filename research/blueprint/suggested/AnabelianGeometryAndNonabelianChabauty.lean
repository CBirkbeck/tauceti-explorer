import Mathlib.CategoryTheory.Limits.Types.Filtered
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.GroupTheory.GroupAction.OfQuotient
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.Tactic.Group
import Mathlib.GroupTheory.GroupAction.ConjAct
import Mathlib.Data.Fintype.Card
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Data.ZMod.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Shapiro
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Algebra.Group.Action.End
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.MulAction
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree

/-!
# Anabelian geometry and nonabelian Chabauty — suggested declarations (partial NC.0/NC.3 continuation)

This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline.

The component is nonabelian continuous cohomology `H⁰(G, U)`, `H¹(G, U)` of a topological
group `G` acting continuously by automorphisms on a topological group `U`, following
Kim, *The motivic fundamental group of P¹ ∖ {0,1,∞} and the theorem of Siegel*, §1.
-/

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

@[ext] theorem ext {c c' : Z1 G U} (h : ∀ g, c g = c' g) : c = c' := by sorry

theorem continuous (c : Z1 G U) : Continuous (c : G → U) := c.2.1

theorem map_mul (c : Z1 G U) (g h : G) : c (g * h) = c g * g • c h := c.2.2 g h

/-- The trivial cocycle, the base point. -/
instance : One (Z1 G U) := ⟨⟨fun _ => 1, continuous_const, by sorry⟩⟩

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

def Twist.toOriginal (c : Z1 G U) : Twist c ≃* U := by sorry

/-- The twisted action `g ⋆ u = c(g) · (g • u) · c(g)⁻¹`. -/
instance (c : Z1 G U) : MulDistribMulAction G (Twist c) := sorry
instance (c : Z1 G U) : ContinuousSMul G (Twist c) := sorry

theorem Twist.smul_def (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (show Twist c from c g * (g • (show U from x)) * (c g)⁻¹) := by sorry

/-- NC.3/twisting: `c' ↦ c' · c`. -/
def Z1.twistEquiv (c : Z1 G U) : Z1 G (Twist c) ≃ Z1 G U := sorry

def H1.twistEquiv (c : Z1 G U) : H1 G (Twist c) ≃ H1 G U := sorry

theorem H1.twistEquiv_one (c : Z1 G U) : H1.twistEquiv c 1 = H1.mk c := by sorry

end Twisting

section Torsor
variable (G : Type u) [Group G] [TopologicalSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U] [MulDistribMulAction G U]
  [ContinuousSMul G U]

/-- NC.3/torsor-classification: a `(G, U)`-torsor. -/
structure Torsor where
  carrier : Type (max u v)
  [top : TopologicalSpace carrier]
  [nonempty : Nonempty carrier]
  [rightAction : MulAction Uᵐᵒᵖ carrier]
  [leftAction : MulAction G carrier]
  continuous_right : Continuous fun p : carrier × Uᵐᵒᵖ => p.2 • p.1
  continuous_left : Continuous fun p : G × carrier => p.1 • p.2
  isHomeomorph_orbit : ∀ p : carrier, IsHomeomorph fun x : U => (MulOpposite.op x) • p
  compat : ∀ (g : G) (p : carrier) (x : U),
    g • ((MulOpposite.op x) • p) = (MulOpposite.op (g • x)) • (g • p)

attribute [instance] Torsor.top Torsor.nonempty Torsor.rightAction Torsor.leftAction

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

end Torsor

/-! ## Unit tests -/

-- TauCeti.NonabelianCohomology.tests.trivial_group
example [TopologicalSpace (Multiplicative (ZMod 1))]
    (U : Type) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction (Multiplicative (ZMod 1)) U]
    [ContinuousSMul (Multiplicative (ZMod 1)) U] :
    Subsingleton (Z1 (Multiplicative (ZMod 1)) U) := by sorry

-- TauCeti.NonabelianCohomology.tests.factor_order
example : ∃ c : Equiv.Perm (Fin 3) → Equiv.Perm (Fin 3),
    (∀ g h, c (g * h) = c g * c h) ∧ ¬ ∀ g h, c (g * h) = c h * c g := by sorry

-- TauCeti.NonabelianCohomology.tests.h1_S3 and .not_coboundary_quotient: with `G = Multiplicative
--   (ZMod 2)` acting trivially on `Equiv.Perm (Fin 3)` (discrete), `Nat.card (Z1 G U) = 4` and
--   `Nat.card (H1 G U) = 2`; the trivial action needs a `MulDistribMulAction` instance.

-- Discrete cocycle descent continuation.
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

-- Quotient cocycle descent continuation, Codex codex-a71f92.
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

-- Actual H¹ inflation continuation — Codex codex-rtOQ9t.
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

/-!
## Native carrier smoke forms (not K(π,1) tests)
These forms consume only declarations personally read at the Mathlib pin. They neither
construct the missing geometric π/sheaf/comparison bridge nor claim elaboration.
-/

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

/-
Exact NC.0 omission ledger — these are NOT Lean signatures or typed tests.

The actual profinite fundamental group of a non-affine scheme, its finite continuous
coefficient/sheaf dictionary and canonical all-degree ε are not provided at the pins.
No stand-in Prop field, invented type or arbitrary assumed comparison is inserted.
Every entry gives the exact intended mathematical contract; the owner must supply the
missing carriers/maps before a signature can honestly be written.

OMITTED TauCeti.EtaleKPiOne.Is
Node: AnabelianGeometryAndNonabelianChabauty:key/etale-k-pi-1
Contract: Let X be a connected locally noetherian scheme with geometric point x. Put π = π₁ᵉᵗ(X,x), the profinite SGA fundamental group. Let C specify an isomorphism-invariant class of finite discrete abelian groups with continuous π-action, transported along pointed fundamental-group isomorphisms. Define Is(X,x;C) to mean that, for every M in C and every integer n ≥ 0, the canonical comparison εⁿ_M : Hⁿ_cont(π,M) → Hⁿ_et(X,L_x(M)) is an isomorphism of abelian groups. L_x(M) is the finite locally constant étale sheaf corresponding to M, not an arbitrary constructible sheaf. The default full property uses all finite continuous π-modules. The p-primary property uses those whose underlying finite group has p-power order, with p prime; the constant-Fₚ comparison is a separately named specialization, not the definition of either full property. None of these coefficient restrictions changes π to its maximal pro-p quotient.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.Is.edgeIso
API (projection): From Is(X,x;C), for M in C and n ≥ 0, obtain the inverse of the canonical εⁿ_M with both inverse identities; it is natural in equivariant coefficient homomorphisms.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.iff_all_comparisons
API (characterisation): Is(X,x;C) holds exactly when εⁿ_M is an isomorphism for every M in C and every n ≥ 0; checking only n ≤ 1 is not sufficient.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.of_subclass
API (functoriality): If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.pointedIso_iff
API (functoriality): For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.basePoint_iff
API (compatibility): For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.zero_coefficients
API (simp): For the class containing only the zero π-module, every comparison is 0 → 0 and Is(X,x;C) holds; this case is not evidence for the full property.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.Is.constantFp_edgeIso
API (compatibility): For p prime, the full or p-primary property supplies Hⁿ_cont(π,Fₚ) ≅ Hⁿ_et(X,Fₚ) via ε in every degree, with trivial π-action; the group in the source is still π.
Missing: the key definition's genuine coefficient/sheaf/ε carriers; no independent assumed proposition.

OMITTED TauCeti.EtaleKPiOne.tests.field
Test (degenerate): For every field K and separable geometric point, Is(Spec K,x;all finite coefficients) holds and π identifies with Gal(K_sep/K), with ε equal to the Galois-cohomology comparison.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.projective_line_degree_two
Test (non-example): For algebraically closed k and prime ℓ invertible in k, π₁ᵉᵗ(P¹_k)=1 and H²_et(P¹_k,Z/ℓ) ≅ Z/ℓ is nonzero, while H²_cont(1,Z/ℓ)=0; hence the full property and the ℓ-primary property both fail although degrees zero and one agree.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.affine_curve
Test (characterisation): For a geometrically connected smooth affine curve over a characteristic-zero field, including Gₘ and P¹ minus {0,1,∞}, the full finite-coefficient property holds; no claim that every open immersion preserves it is involved.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.positive_genus
Test (characterisation): For a geometrically connected smooth proper curve of genus at least one over a characteristic-zero field, the full property holds. Nonzero H²_et of an elliptic curve does not contradict it: its profinite fundamental group need not have vanishing H².
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.product_char_zero
Test (compatibility): For two geometrically connected geometrically unibranch characteristic-zero varieties with the full property, their product has it; over a non-algebraically-closed field the arithmetic π₁ of the product is the fibre product over Gal(k_sep/k), not the ordinary product.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.artin_tower
Test (characterisation): A finite characteristic-zero tower of smooth elementary curve fibrations ending in Spec k has the full property; this includes M₀,n for n ≥ 4 after importing its moduli construction and forgetting-mark fibrations.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.pro_p_not_coefficient_restriction
Test (non-example): The finite group C₂ acts on F₃ by negation. This is a 3-primary continuous coefficient with invariants 0. Its action does not descend to the trivial maximal pro-3 quotient of C₂; putting F₃ with trivial action on that quotient gives invariants F₃ instead. A p-primary coefficient restriction is not a licence to replace π by π^(p).
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.tests.zero_class
Test (degenerate): The zero-coefficient class passes on P¹, whereas the full and invertible-prime primary classes fail there. The class argument must not be erased.
Missing: the key definition's carriers plus the precise geometric example/obstruction inputs listed in the packet. This comment is not an example declaration.

OMITTED TauCeti.EtaleKPiOne.Is.of_subclass
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/coefficient-restriction
Contract: If C′ ⊆ C, then Is(X,x;C) implies Is(X,x;C′); in particular full finite coefficients imply p-primary coefficients and constant-Fₚ comparison.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.Is.pointedIso_iff
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/pointed-isomorphism
Contract: For a pointed scheme isomorphism f:(X,x) ≅ (Y,y), Is(X,x;f*D) iff Is(Y,y;D), using transported coefficients and the natural comparison square.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.Is.basePoint_iff
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/basepoint-transport
Contract: For geometric points x,y and an étale path between their finite-étale fibre functors, Is(X,x;C) iff Is(X,y;transport C); full and p-primary classes are invariant under every such transport.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.iff_finiteCover_effacement
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-cover-effacement
Contract: For a connected noetherian scheme X with geometric point x and a set of primes P, Is(X,x;P-supported finite coefficients) holds iff, for every connected finite étale cover Y→X, every finite abelian group A whose order has prime factors in P, every q≥2 and α∈H^q_et(Y,A) for the constant sheaf A, there exists a finite étale surjective Z→Y killing α. All primes recover the previous full-coefficient criterion for geometrically unibranch varieties. Every finite cover Y is quantified; constant coefficients only on X are insufficient.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.iff_raw_etale_aspherical
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/raw-homotopy-comparison
Contract: For a connected geometrically unibranch variety X with geometric point x, the full finite-coefficient property agrees with the raw étale K(π,1) condition π⁽raw⁾ₙ(X_et,x_et)=0 for every n ≥ 2, equivalently the canonical classifying morphism X_et → Bπ₁(X_et,x_et) is an isomorphism in Ho(pro-ss_*). Here π₁(X_et,x_et) is profinite in this scope and identified with the SGA finite-étale π used by the cohomological definition. This equivalence is not asserted for an arbitrary non-geometrically-unibranch locally noetherian scheme.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; add raw pro-space, classifying map and higher homotopy/fibration carriers described by the packet gaps.

OMITTED TauCeti.EtaleKPiOne.field
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/field
Contract: For every field K, with a separable geometric point x of Spec K, Is(Spec K,x;all finite coefficients) holds. Under π ≅ Gal(K_sep/K), its comparison εⁿ_M is the canonical Galois-cohomology isomorphism in every degree and for every finite discrete continuous Galois module M.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.not_projectiveLine
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/projective-line-obstruction
Contract: For algebraically closed k and prime ℓ invertible in k, P¹_k does not have the full finite-coefficient property, and does not have the ℓ-primary property. For M=Z/ℓ with trivial action, ε²_M has source zero and target isomorphic to Z/ℓ; it is not an isomorphism.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.smooth_curve_charZero
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve
Contract: For a geometrically connected smooth curve C over a characteristic-zero field k, if C is affine or its smooth proper model has genus at least one, then Is(C,x;all finite coefficients) holds for every geometric point x.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.product_charZero
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/products
Contract: Over a characteristic-zero field k, a finite product of geometrically connected geometrically unibranch k-varieties having the full finite-coefficient property again has that property.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

OMITTED TauCeti.EtaleKPiOne.elementary_fibration_charZero
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/elementary-fibration
Contract: Let f:X→Y be an elementary fibration of smooth connected varieties over a characteristic-zero field: X is the complement of a divisor D, finite étale over Y, in a smooth proper geometrically connected curve family X̄→Y, and each fibre of X→Y is a nonempty affine curve. If Y has the full finite-coefficient property, then X has it.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; add raw pro-space, classifying map and higher homotopy/fibration carriers described by the packet gaps.

OMITTED TauCeti.EtaleKPiOne.artin_tower_charZero
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/artin-neighbourhood
Contract: For a finite tower X=X_r→⋯→X₀=Spec k of smooth connected characteristic-zero varieties with each arrow an elementary curve fibration as specified in elementary-fibration, X has the full finite-coefficient property. In particular this applies to strongly hyperbolic Artin neighbourhoods of Schmidt–Stix Definition 6.1, whose additional product-embedding condition must not be omitted when naming that stronger notion.
Missing: actual geometric π, finite coefficient/sheaf dictionary and canonical ε; use the exact supplier requests and source-proof gaps of this node.

-/

/-
Inherited NC.3 exact-name audit — native prototypes are retained, not recompiled.
An existing prototype may represent only one part of a bundled node. Exact names absent
from declaration forms, and comment-only tests, remain explicit omissions rather than
being counted as typed API coverage. The mathematical roadmap remains definitive.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1
API: The type of continuous maps c : G → U with c(gh) = c(g)·g•c(h).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H0
API: H⁰(G, U) = FixedPoints.subgroup G U, the subgroup of G-invariant elements.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.Z1.mem_iff
API: c ∈ Z¹ iff c is continuous and satisfies the cocycle identity.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.Z1.one
API: The trivial cocycle g ↦ 1, the base point.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.map_one
API: c(1) = 1 for every cocycle.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.map_inv
API: c(g⁻¹) = g⁻¹•(c(g)⁻¹).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.coboundary
API: For u ∈ U, the cocycle g ↦ u·(g•u)⁻¹.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.equivContinuousMonoidHomOfTrivial
API: If G acts trivially, Z¹(G, U) ≃ (G →ₜ* U), continuous homomorphisms.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.ext
API: Two cocycles are equal iff they agree at every g.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.tests.trivial_group
test: If G is the trivial group, Z¹(G, U) = {1}.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.tests.trivial_action_hom
test: For G = ℤ/2 (discrete) acting trivially on the symmetric group S₃ (discrete), Z¹(G, S₃) has exactly 4 elements: the trivial map and the three maps sending the generator to a transposition.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.tests.factor_order
test: For G = U = S₃ with the trivial action, the identity map satisfies c(gh) = c(g)·(g•c(h)) but not c(gh) = (g•c(h))·c(g) (it is a homomorphism, not an anti-homomorphism): the factor order of the cocycle condition matters for nonabelian U.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.tests.invariants
test: For G = ℤ/2 acting on U = ℤ by negation, H⁰(G, U) = {0}; for the trivial action H⁰ = U.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.continuity
test: For G = ∏_{n ∈ ℕ} ℤ/2 (profinite) acting trivially on U = ℤ/2 (discrete), Z¹(G, U) is countable (continuous characters factor through finitely many coordinates), whereas the abstract homomorphisms G → ℤ/2 are uncountable: dropping continuity changes Z¹.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1
API: H¹(G, U) = MulAction.orbitRel.Quotient U (Z¹ G U).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.Z1.instMulAction
API: The action (u·c)(g) = u·c(g)·(g•u)⁻¹ of U on Z¹(G, U).
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.mk
API: The class map Z¹(G, U) → H¹(G, U).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.mk_surjective
API: Every class has a representing cocycle.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.mk_eq_mk_iff
API: mk c = mk c′ iff c′ = u·c for some u ∈ U.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.H1.instOne
API: The base point, the class of the trivial cocycle.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.mk_eq_one_iff
API: mk c = 1 iff there is u ∈ U with c(g) = u·(g•u)⁻¹ for all g.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.H1.equivOfTrivial
API: For trivial action, H¹(G, U) ≃ (G →ₜ* U) modulo conjugation by U.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.h1_trivial_group
test: If G is the trivial group, H¹(G, U) is a single point.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.h1_S3
test: For G = ℤ/2 acting trivially on S₃ (both discrete), H¹(G, S₃) has exactly 2 elements: the base point and the class of the transpositions.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.not_coboundary_quotient
test: In the same example, identifying cocycles c, c′ when c′(g) = c(g)·u(g•u)⁻¹ for some u gives 4 classes (the action is trivial, so every such b is trivial), not 2: the correct relation is twisted conjugation.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.h1_abelian
test: For G = ℤ/2 acting on U = ℤ/3 (additive, discrete) by negation, H¹ is a single point, agreeing with Tau Ceti's ContCohomology.H1 (the orders are coprime).
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.map
API: The map H¹(G, U) → H¹(G, U′) induced by a continuous equivariant homomorphism.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.map_one
API: H1.map f sends the base point to the base point.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.map_id
API: H1.map id = id.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.H1.map_comp
API: H1.map (f′ ∘ f) = H1.map f′ ∘ H1.map f.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.res
API: The restriction H¹(G, U) → H¹(G′, U) along a continuous homomorphism G′ → G.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

NOW TYPED BELOW: TauCeti.NonabelianCohomology.H1.res_comp
API: Restriction along a composite is the composite of restrictions.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H0.map
API: The homomorphism of invariants induced by an equivariant homomorphism.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.equivContCohomology
API: H¹(G, Multiplicative M) ≃ ContCohomology.H1 G M, compatible with the class maps.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.instMulDistribMulActionMultiplicative
API: A DistribMulAction of G on the additive group M induces a MulDistribMulAction of G on Multiplicative M (not an instance in Mathlib at the pin), and continuity of the action transfers.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.Z1.equivContCohomology
API: Z¹(G, Multiplicative M) ≃ ContCohomology.Z1 G M, the identity on underlying functions.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.equivContCohomology_one
API: The base point goes to 0.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.H0.equivContCohomology
API: H⁰(G, Multiplicative M) corresponds to ContCohomology.H0 G M.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.exact_H1_of_subgroup
node: Let A ≤ B be a closed subgroup of a topological group B stable under a continuous action of G by automorphisms, and B/A the coset space with the induced (continuous) G-action. (a) The sequence of pointed sets 1 → A^G → B^G → (B/A)^G →δ H¹(G, A) → H¹(G, B) is exact (at each term the image of the incoming map is the preimage of the base point), where δ(bA) is the class of the continuous cocycle g ↦ b⁻¹·(g•b); moreover δ(x) = δ(y) iff x and y lie in one B^G-orbit of (B/A)^G. (b) If A is normal, B/A is a topological group with continuous G-action, and the sequence continues exactly with → H¹(G, B/A): a class of H¹(G, B) maps to the base point of H¹(G, B/A) iff it comes from H¹(G, A). No continuous section of B → B/A is needed.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.map_eq_map_iff_central
node: Let Z ≤ B be a closed G-stable subgroup contained in the centre of B, and C := B/Z. (a) The abelian group H¹(G, Z) (NC.3/abelian-comparison) acts on H¹(G, B) by [z]·[c] := [g ↦ z(g)c(g)], and the fibres of H¹(G, B) → H¹(G, C) are exactly the orbits of this action. (b) Suppose the projection B → C has a continuous (set-theoretic) section s. Then there is a connecting map δ² : H¹(G, C) → H²(G, Z), Tau Ceti's explicit continuous H² (ContCohomology.H2 of Z written additively), sending the class of c̄ to the class of the 2-cocycle (g, h) ↦ c(g)·(g•c(h))·c(gh)⁻¹ for the continuous lift c = s ∘ c̄; and the image of H¹(G, B) → H¹(G, C) is δ²⁻¹(0). (c) If, for every c ∈ Z¹(G, B), the group C twisted by the image of c (NC.3/twisting) has only the trivial G-invariant element, then the action in (a) is free, so each nonempty fibre is a principal homogeneous space of H¹(G, Z).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Twist
API: The type synonym ₍c₎U of U with the twisted action g ⋆ u = c(g)(g•u)c(g)⁻¹.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Twist.smul_def
API: g ⋆ u = c(g)·(g•u)·c(g)⁻¹.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.Twist.continuousSMul
API: The twisted action is continuous.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Z1.twistEquiv
API: The bijection Z¹(G, ₍c₎U) ≃ Z¹(G, U), c′ ↦ c′·c.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.twistEquiv
API: The induced bijection H¹(G, ₍c₎U) ≃ H¹(G, U).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.H1.twistEquiv_one
API: twistEquiv sends the base point to the class of c.
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

OMITTED TauCeti.NonabelianCohomology.Twist.self
API: Twisting by the trivial cocycle is the original action.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.twist_trivial
test: Twisting by the trivial cocycle gives back U with its action, and twistEquiv is the identity.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.twist_abelian
test: For U commutative, g ⋆ u = g•u for every c, and twistEquiv is translation by c.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.twist_S3
test: For G = ℤ/2 acting trivially on S₃ and c sending the generator to a transposition τ, the twisted action is conjugation by τ, whose invariants form the subgroup {1, τ} of order 2.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

OMITTED TauCeti.NonabelianCohomology.tests.twist_changes_invariants
test: A twist need not be isomorphic to U as a G-group: for G = ℤ/2 acting trivially on S₃ and c(σ) = τ a transposition, H⁰(G, ₍c₎S₃) = {1, τ} has order 2 while H⁰(G, S₃) = S₃ has order 6; and twistEquiv sends the base point to [c], not to the base point.
Reason: no exact named declaration/typed example was found in the inherited suggested file. Required NC.3 API needs native action/orbit/torsor/continuous-H² packaging and granular statements; finite-cardinality tests also need explicit discrete trivial-action instances. Keep this omission open, do not infer a signature from a name in a comment.

EXISTING PARTIAL PROTOTYPE TauCeti.NonabelianCohomology.Torsor.classOf
node: A (G, U)-torsor is a topological space P with a continuous right action of U that is free and transitive, such that for one (equivalently every) p ∈ P the orbit map U → P, u ↦ p·u, is a homeomorphism, together with a continuous left action of G satisfying g•(p·u) = (g•p)·(g•u). For p ∈ P let c_p(g) ∈ U be the unique element with g•p = p·c_p(g). Then c_p ∈ Z¹(G, U), c_{p·u} = u⁻¹·c_p under the twisted-conjugation action, so [P] := [c_p] ∈ H¹(G, U) is independent of p and of the isomorphism class of P; P ↦ [P] is a bijection from isomorphism classes of (G, U)-torsors to H¹(G, U), the trivial torsor U corresponds to the base point, and P has a G-fixed point iff [P] is the base point. The inverse sends [c] to U with the twisted G-action g ∗ u := c(g)·(g•u).
Status: exact-name prototype retained, unproved and uncompiled. It is not a certificate that the full bundled node/API contract or all instance hypotheses are supplied.

-/

/-
# NC.0 finite-cover assembly — mathematical omission contracts

OMITTED TauCeti.EtaleKPiOne.effacement_of_finiteEtale
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-finite-cover-transfer
Contract: Assume every positive-degree étale cohomology class on X with every allowed coefficient can be killed by some finite étale surjective cover of X. For a finite étale map f:Y→X, any allowed coefficient F on Y, q>0 and α∈H^q_et(Y,F), there exists a finite étale surjective g:X′→X such that its base change g′:Y×_X X′→Y kills α. Y need not be connected and f need not be normal or surjective. The specified equality is g′* μ_f(α′)=μ_f′(bc_*(g*α′)), where μ_f:H^q_et(X,f_*F)→H^q_et(Y,F) is the pullback/counit isomorphism and α′=μ_f⁻¹(α).
Missing: actual finite-étale fundamental group, finite coefficient/sheaf dictionary and canonical ε; μ_f, base change, ρ/Leray and coefficient long exact sequence maps in the exact supplier requests. No surrogate Prop field or arbitrary cohomology carrier is introduced.

OMITTED TauCeti.EtaleKPiOne.iff_allCoefficient_effacement
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/all-coefficient-effacement
Contract: Is(X,x;P-supported finite coefficients) holds iff for every allowed finite locally constant abelian sheaf F, every q>0 and every α∈H^q_et(X,F), some finite étale surjective g:X′→X satisfies g*α=0. The K(π,1) side uses the canonical ε^q, all nonnegative degrees and the full π; the killing cover may depend on F,q,α. This equivalence is asserted for connected noetherian schemes without a geometric-unibranch restriction.
Missing: actual finite-étale fundamental group, finite coefficient/sheaf dictionary and canonical ε; μ_f, base change, ρ/Leray and coefficient long exact sequence maps in the exact supplier requests. No surrogate Prop field or arbitrary cohomology carrier is introduced.

OMITTED TauCeti.EtaleKPiOne.finiteEtale_iff
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/finite-etale-invariance
Contract: For f:Y→X finite étale surjective, Is(X,x;P-supported finite coefficients) holds iff every connected component of Y has the corresponding property at any geometric point above it. This includes full and p-primary coefficients. It is not asserted for an arbitrary coefficient class lacking closure under finite-étale direct image and pullback; Y may be disconnected.
Missing: actual finite-étale fundamental group, finite coefficient/sheaf dictionary and canonical ε; μ_f, base change, ρ/Leray and coefficient long exact sequence maps in the exact supplier requests. No surrogate Prop field or arbitrary cohomology carrier is introduced.

OMITTED TauCeti.EtaleKPiOne.effacement_of_shortExact
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/effacement-extension
Contract: Let 0→F′→F→F″→0 be a short exact sequence of allowed finite locally constant abelian sheaves on X. Assume that for every finite étale Y→X and every q>0 every class with coefficients F′|Y and every class with coefficients F″|Y dies after a finite étale surjective cover of Y. Then the same property holds for F|Y. No filtration by trivial one-dimensional π-modules is assumed.
Missing: actual finite-étale fundamental group, finite coefficient/sheaf dictionary and canonical ε; μ_f, base change, ρ/Leray and coefficient long exact sequence maps in the exact supplier requests. No surrogate Prop field or arbitrary cohomology carrier is introduced.

OMITTED TauCeti.EtaleKPiOne.tests.constantFp_not_pro_p_cohomology
Contract: For S₃ with trivial F₃ coefficients the maximal pro-3 quotient is trivial, yet H³(S₃,F₃) is nonzero: the explicit normalized bar 3-cocycle c and cycle z in the reader pair to 1 mod 3. Even constant F_p coefficients in positive degrees do not generally permit replacing the full group by its maximal pro-p quotient. This is a group-cohomology boundary test, not a claim that a scheme with fundamental group S₃ is K(π,1).
Missing: the native finite S₃ representation and explicit normalized degree-three cocycle/cycle-to-groupCohomology bridge. The finite Python regression and reader give the exact formula; this entry is not a Lean test or a geometric theorem.
-/


/- Existing discrete Shapiro carriers only. These are baseline compatibility
smoke forms, not proposed geometric declarations or a full-file compilation. -/
noncomputable section
open CategoryTheory Rep
universe u
variable {k G : Type u} [CommRing k] [Group G] {H : Subgroup G} (A : Rep k H) (n : ℕ)
example : groupCohomology (coind H.subtype A) n ≅ groupCohomology A n := by sorry
example : (groupCohomology.coindIso A n).hom ≫ (groupCohomology.coindIso A n).inv = 𝟙 _ := by sorry
example : (groupCohomology.coindIso A n).inv ≫ (groupCohomology.coindIso A n).hom = 𝟙 _ := by sorry

/-
OMITTED TauCeti.EtaleKPiOne.iff_primeField_effacement
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-field-effacement
Contract: For a connected noetherian scheme X with geometric point x and a set of primes P, Is(X,x;P-supported finite coefficients) holds iff for every connected finite étale cover Y→X, every p∈P, every q≥2 and every α∈H^q_et(Y,F_p) with constant coefficients, there is a finite étale surjective Z→Y killing α. The prime-field and cover quantifiers are both essential. No assumption of a composition series of trivial π-modules is made.
Missing: actual finite-cover/coefficient/sheaf and canonical cohomology maps, coefficient filtration and finite-sum comparisons from the precise supplier interfaces. No empty predicate or artificial carrier is introduced.
-/

/-
# NC.0 smooth-curve and separable-descent mathematical omission contracts

OMITTED TauCeti.EtaleKPiOne.exists_connected_primeDegree_cover
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/connected-prime-degree-cover
Contract: For a connected smooth projective curve C of genus g≥1 over an algebraically closed characteristic-zero field k and a prime p, there exists a connected finite étale surjective k-morphism f:D→C of degree exactly p. The cover can be chosen to be a torsor under the constant additive group F_p; its translation action is induced by a nonzero continuous character of the full π₁ᵉᵗ(C,x).
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.primeDegree_cover_kills_H2
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-cover-degree-two-killing
Contract: Let f:D→C be a connected finite étale cover of degree p between connected smooth projective curves over an algebraically closed characteristic-zero field, with p prime. Then f*:H²_et(C,μ_p)→H²_et(D,μ_p) is the zero homomorphism. After choosing one primitive pth root on the common base field, the same holds for constant F_p coefficients. This conclusion does not require genus≥1 once the cover is given.
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.exists_primePower_cover_kills_H2
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/prime-power-degree-two-killing
Contract: For C a connected smooth projective curve of genus g≥1 over an algebraically closed characteristic-zero field k, a prime p and a≥0, there exists a connected finite étale surjective f:D→C of degree p^a, given by a tower of a connected degree-p covers, such that f*:H²_et(C,μ_(p^a))→H²_et(D,μ_(p^a)) is zero. For a=0 the identity cover and the zero coefficient μ_1 give the assertion. The composite cover need not be Galois over C.
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.smooth_curve_algebraicallyClosed
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-smooth-curve
Contract: For a connected smooth separated finite-type curve C over an algebraically closed characteristic-zero field, if C is affine or its smooth projective compactification has genus≥1, then Is(C,x;all finite coefficients) holds at every geometric point x. More explicitly, on every connected finite étale Y→C every class α∈H^q_et(Y,F_p), p prime and q≥2, dies on a finite étale surjective cover of Y. In the affine case and in degrees q≥3 the identity cover suffices.
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.descend_separable_killing_cover
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/separable-killing-descent
Contract: Let k have characteristic zero with fixed separable closure k_s, X a separated finite-type k-scheme, F a finite locally constant abelian étale sheaf, q>0 and α∈H^q_et(X,F). If a finite étale surjective cover h_s:Z_s→X_(k_s) kills α_(k_s), then there exist a finite separable k⊆k′⊆k_s and a finite étale surjective h′:Z′→X_(k′), whose base change is h_s up to X_(k_s)-isomorphism after a possible further finite extension, such that h′*α_(k′)=0. Thus the composite Z′→X is finite étale surjective and kills α. Neither Z_s nor Z′ is required to be connected.
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.separableClosure_iff
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/separable-base-change
Contract: For a geometrically connected separated finite-type scheme X over a characteristic-zero field k, with separable closure k_s and a geometric point x over k_s, Is(X,x;all finite coefficients) holds iff Is(X_(k_s),x;all finite coefficients) holds. Both sides use their own full profinite fundamental groups and their canonical ε maps; their étale cohomology groups are not asserted to be equal.
Missing: the actual finite-cover/coefficient/ε interfaces from IG.0/SF.2, curve Picard/degree/genus data from SF.3, and canonical Kummer or affine-transition limit maps specified in the packet requests. No dummy predicate, artificial carrier or geometric theorem signature is introduced.

OMITTED TauCeti.EtaleKPiOne.tests.prime_degree_cover
Test: For a smooth projective genus-one curve over algebraically closed characteristic-zero k and prime p=3, a nonzero character π₁→F₃ gives a connected degree-3 étale cover; the zero character gives three disconnected copies. Multiplication-by-3 on an elliptic curve has degree 9, not 3.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

OMITTED TauCeti.EtaleKPiOne.tests.prime_to_degree_does_not_kill
Test: For a smooth projective elliptic curve over algebraically closed characteristic-zero k, multiplication-by-2 has degree 4 and induces multiplication by 4=1 on H²_et(E,μ₃)≅Z/3. Thus this finite étale cover does not kill a nonzero degree-two class.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

OMITTED TauCeti.EtaleKPiOne.tests.prime_power_tower
Test: For genus≥1, p=3,a=2, a degree-3 étale cover multiplies H²(μ₉) by 3 and does not kill the generator; a tower of two connected degree-3 covers has degree 9 and kills all H²(μ₉) classes.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

OMITTED TauCeti.EtaleKPiOne.tests.tower_exponent_zero
Test: At a=0 the prime-power tower is the identity, coefficient μ₁ is zero and H²(C,μ₁)=0. This boundary is not the infinite coefficient n=0.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

OMITTED TauCeti.EtaleKPiOne.tests.genus_after_prime_cover
Test: For a connected étale degree-3 cover of a smooth projective genus-2 curve over an algebraically closed characteristic-zero field, unramified Riemann–Hurwitz gives genus 4; a second degree-3 step gives genus 10. For genus one every such step retains genus one.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

OMITTED TauCeti.EtaleKPiOne.tests.arithmetic_restriction_not_injective
Test: For k=R, k_s=C and X=Spec R with constant Z/2 coefficients, H²_et(X,Z/2)≅Z/2 but H²_et(Spec C,Z/2)=0. Both spectra have the full K(π,1) property. Separable-closure invariance is not injectivity of cohomology restriction; the finite cover Spec C→Spec R kills the nonzero class.
Missing: genuine geometric cover, curve cohomology and canonical restriction-map carriers. Arithmetic checks below are not replacements for this exact test.

REFINED TauCeti.EtaleKPiOne.smooth_curve_charZero
Contract: For a geometrically connected smooth curve C over a characteristic-zero field k, if C is affine or its smooth proper model has genus at least one, then Is(C,x;all finite coefficients) holds for every geometric point x.
Proof route: connected prime-degree curve cover, degree-two killing, prime-field criterion on all finite covers, then separable-closure invariance. The inherited statement is unchanged; raw-homotopy-comparison is no longer a prerequisite. Its actual geometric signature is still omitted.
-/


/- Arithmetic smoke examples only. No geometric statement is represented. -/
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


/-
# NC.0 product proof — mathematical omission contracts

OMITTED TauCeti.EtaleKPiOne.exists_connected_cover_kills_finiteFamily
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/positive-family-effacement
Contract: Let W be a connected noetherian scheme with a geometric point and the full finite-coefficient étale K(π,1) property. For any finite index set I, primes p_i, positive degrees q_i and classes a_i in H^{q_i}_et(W,F_{p_i}), with constant coefficients, there is a pointed connected finite étale surjective f:W′→W such that f*a_i=0 for every i. The cover may depend on the entire finite family.
Missing: the actual pointed finite-cover/coefficient/sheaf interfaces, canonical pullbacks and external products from the exact IG.0/SF.2 requests. These are mathematical plans, not fabricated Prop fields or substituted group fixtures.

OMITTED TauCeti.EtaleKPiOne.exists_product_refinement_kills_primeField_class
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/product-cover-effacement
Contract: Let X,Y be geometrically connected geometrically unibranch varieties over an algebraically closed characteristic-zero field k, each with the full finite-coefficient étale K(π,1) property. For a pointed connected finite étale cover Z→X×_kY, a prime p, q>0 and c∈H^q_et(Z,F_p), there are pointed connected finite étale covers X″→X and Y″→Y and a finite étale surjective map h:X″×_kY″→Z over X×_kY such that h*c=0. The two covers may depend on Z,p,q,c; Z itself need not be a product or a Galois cover.
Missing: the actual pointed finite-cover/coefficient/sheaf interfaces, canonical pullbacks and external products from the exact IG.0/SF.2 requests. These are mathematical plans, not fabricated Prop fields or substituted group fixtures.

OMITTED TauCeti.EtaleKPiOne.product_algebraicallyClosed
Node: AnabelianGeometryAndNonabelianChabauty:NC.0/geometric-product
Contract: Over an algebraically closed characteristic-zero field k, the product X×_kY of two geometrically connected geometrically unibranch k-varieties with the full finite-coefficient étale K(π,1) property has that full property, defined by the canonical comparisons in all degrees and with its full profinite fundamental group.
Missing: the actual pointed finite-cover/coefficient/sheaf interfaces, canonical pullbacks and external products from the exact IG.0/SF.2 requests. These are mathematical plans, not fabricated Prop fields or substituted group fixtures.

REFINED TauCeti.EtaleKPiOne.product_charZero
Contract: Over a characteristic-zero field k, a finite product of geometrically connected geometrically unibranch k-varieties having the full finite-coefficient property again has that property.
Route: separableClosure_iff, product_algebraicallyClosed, finite induction with the empty-field instance, then descent. All finite coefficients and the original public hypotheses are retained. Its genuine geometric signature remains omitted.
-/
/- BEGIN PRODUCT BASELINE SMOKE
Existing group carriers and finite algebra only. None of these examples is a
signature of a geometric cover or of the canonical étale comparison.
-/
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

-- TauCeti.EtaleKPiOne.ProductSmoke.diagonal_C2
example :
    let C := Multiplicative (ZMod 2)
    let D := (MonoidHom.fst C C).eqLocus (MonoidHom.snd C C)
    Nat.card ((C × C) ⧸ D) = 2 ∧
      (D.comap (MonoidHom.inl C C)).prod (D.comap (MonoidHom.inr C C)) = ⊥ ∧
      Nat.card ((C × C) ⧸ (⊥ : Subgroup (C × C))) = 4 := by sorry

-- TauCeti.EtaleKPiOne.ProductSmoke.diagonal_S3_nonnormal
example :
    let S := Equiv.Perm (Fin 3)
    let D := (MonoidHom.fst S S).eqLocus (MonoidHom.snd S S)
    ¬ D.Normal ∧ Finite ((S × S) ⧸ D) := by sorry

-- TauCeti.EtaleKPiOne.ProductSmoke.mixed_degree_one
-- Coordinates (0,2), (1,1), (2,0) of total degree two.
example :
    let killHigher := (![0, 1, 0] : Fin 3 → ZMod 2)
    (fun j : Fin 3 => killHigher j * (![0, 1, 0] : Fin 3 → ZMod 2) j) =
      (![0, 1, 0] : Fin 3 → ZMod 2) ∧
      (![0, 1, 0] : Fin 3 → ZMod 2) ≠ 0 := by sorry

-- TauCeti.EtaleKPiOne.ProductSmoke.nonfield_canonical_map
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
/- END PRODUCT BASELINE SMOKE -/


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

/- BEGIN NATIVE QUOTIENT FIXED CONTINUITY AND NEUTRAL EQUIVALENCE -/
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
/- END NATIVE QUOTIENT FIXED CONTINUITY AND NEUTRAL EQUIVALENCE -/

/-! Native reverse-inclusion transitions and the compact/discrete inflation colimit.
Functor/cocone data remain transparent; all new proof obligations are admitted. -/
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

/-! Coefficient functoriality continuation, Codex codex-J6LwjP. -/
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

/- Continuous source restriction and coefficient compatibility. -/
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
section TwistingContinuation
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

end TwistingContinuation
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

/- BEGIN GAUGE REPRESENTATIVE TRANSPORT -/
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
/- END GAUGE REPRESENTATIVE TRANSPORT -/

/- BEGIN TWISTED SOURCE NATURALITY -/

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
/- END TWISTED SOURCE NATURALITY -/

/- BEGIN TWISTED KERNELS 63 -/

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
/- END TWISTED KERNELS 63 -/

/- BEGIN ARCHIVED CHECKED TWISTED KERNELS 63
import Mathlib.CategoryTheory.Limits.Types.Filtered
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.Tactic.Group
import Mathlib.GroupTheory.GroupAction.ConjAct
import Mathlib.Data.Fintype.Card
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Data.ZMod.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Shapiro
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Algebra.Group.Action.End
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.MulAction
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.GroupTheory.GroupAction.OfQuotient
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

@[ext] theorem ext {c c' : Z1 G U} (h : ∀ g, c g = c' g) : c = c' := Subtype.ext (funext h)

theorem continuous (c : Z1 G U) : Continuous (c : G → U) := c.2.1

theorem map_mul (c : Z1 G U) (g h : G) : c (g * h) = c g * g • c h := c.2.2 g h

/-- The trivial cocycle, the base point. -/
instance : One (Z1 G U) := ⟨⟨fun _ => 1, continuous_const, by intro g h; simp⟩⟩

theorem map_one (c : Z1 G U) : c 1 = 1 := by
  have h := c.map_mul 1 1
  simp only [one_mul, one_smul] at h
  exact (mul_eq_left.mp h.symm)

theorem map_inv (c : Z1 G U) (g : G) : c g⁻¹ = g⁻¹ • (c g)⁻¹ := by
  have h := c.map_mul g⁻¹ g
  rw [inv_mul_cancel, c.map_one] at h
  rw [smul_inv']
  exact mul_eq_one_iff_eq_inv.mp h.symm


variable [IsTopologicalGroup U] [ContinuousSMul G U]

instance instMulAction : MulAction U (Z1 G U) where
  smul u c := ⟨fun g => u * c g * (g • u)⁻¹,
    (continuous_const.mul c.continuous).mul (continuous_id.smul continuous_const).inv,
    by
      intro g h
      simp only [c.map_mul, smul_mul', smul_inv', mul_smul]
      group⟩
  one_smul c := by
    ext g
    change (1 : U) * c g * (g • (1 : U))⁻¹ = c g
    simp
  mul_smul u v c := by
    ext g
    change (u * v) * c g * (g • (u * v))⁻¹ =
      u * (v * c g * (g • v)⁻¹) * (g • u)⁻¹
    rw [smul_mul', mul_inv_rev]
    group

theorem smul_apply (u : U) (c : Z1 G U) (g : G) :
    (u • c) g = u * c g * (g • u)⁻¹ := rfl

def coboundary (u : U) : Z1 G U := u • (1 : Z1 G U)

end Z1
variable [IsTopologicalGroup U] [ContinuousSMul G U]

def H1 : Type (max u v) := MulAction.orbitRel.Quotient U (Z1 G U)
namespace H1
variable {G U}

def mk (c : Z1 G U) : H1 G U := Quotient.mk'' c

theorem mk_surjective : Function.Surjective (mk : Z1 G U → H1 G U) :=
  Quotient.mk''_surjective

theorem mk_eq_mk_iff {c c' : Z1 G U} : mk c = mk c' ↔ ∃ x : U, x • c = c' := by
  change Quotient.mk'' c = Quotient.mk'' c' ↔ _
  rw [eq_comm, Quotient.eq'', MulAction.orbitRel_apply, MulAction.mem_orbit_iff]

instance instOne : One (H1 G U) := ⟨mk 1⟩

theorem mk_eq_one_iff (c : Z1 G U) :
    mk c = 1 ↔ ∃ x : U, ∀ g, c g = x * (g • x)⁻¹ := by
  change mk c = mk (1 : Z1 G U) ↔ _
  rw [eq_comm, mk_eq_mk_iff]
  constructor
  · rintro ⟨x,hx⟩
    refine ⟨x,fun g => ?_⟩
    have he := congrArg (fun d : Z1 G U => d g) hx
    change x * (1 : U) * (g • x)⁻¹ = c g at he
    simpa only [mul_one] using he.symm
  · rintro ⟨x,hx⟩
    refine ⟨x, ?_⟩
    ext g
    change x * (1 : U) * (g • x)⁻¹ = c g
    simpa only [mul_one] using (hx g).symm

end H1
end Basic

-- Discrete cocycle descent continuation.
namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]

-- node: NC.3/cocycle-one-fibre
/-- A subgroup, not the kernel of a group homomorphism in general. -/
def oneFibre (c : Z1 G U) : Subgroup G where
  carrier := {g | c g = 1}
  one_mem' := c.map_one
  mul_mem' := by
    intro g h hg hh
    change c (g * h) = 1
    rw [c.map_mul, hg, hh, smul_one, mul_one]
  inv_mem' := by
    intro g hg
    change c g⁻¹ = 1
    rw [c.map_inv, hg, inv_one, smul_one]

lemma mem_oneFibre (c : Z1 G U) (g : G) : g ∈ c.oneFibre ↔ c g = 1 := Iff.rfl

lemma oneFibre_eq_ker (c : Z1 G U) (f : G →* U) (hf : ∀ g, c g = f g) :
    c.oneFibre = f.ker := by
  ext g
  change c g = 1 ↔ f g = 1
  rw [hf g]

-- node: NC.3/cocycle-one-fibre-clopen
lemma oneFibre_isClopen [DiscreteTopology U] (c : Z1 G U) :
    IsClopen (c.oneFibre : Set G) :=
  (isClopen_discrete ({1} : Set U)).preimage c.continuous

-- node: NC.3/discrete-normal-killing
lemma exists_openNormal_killing [IsTopologicalGroup G] [CompactSpace G]
    [DiscreteTopology U] (c : Z1 G U) :
    ∃ N : OpenNormalSubgroup G, ∀ n ∈ N, c n = 1 := by
  obtain ⟨N, hN⟩ := IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one
    c.oneFibre_isClopen c.oneFibre.one_mem
  exact ⟨N, fun n hn => hN hn⟩

-- node: NC.3/cocycle-right-cosets
lemma mul_right_eq_of_trivial (c : Z1 G U) (N : Subgroup G)
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : c (g * n) = c g := by
  rw [c.map_mul, hc n hn, smul_one, mul_one]

-- node: NC.3/cocycle-left-cosets
lemma mul_left_eq_of_trivial (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : c (n * g) = c g := by
  have he : n * g = g * (g⁻¹ * n * g) := by group
  rw [he, c.mul_right_eq_of_trivial N hc]
  exact Subgroup.Normal.conj_mem' inferInstance n hn g

-- node: NC.3/cocycle-values-fixed
lemma values_fixed_of_trivial (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : n • c g = c g := by
  have h := c.map_mul n g
  rw [hc n hn, one_mul, c.mul_left_eq_of_trivial N hc g n hn] at h
  exact h.symm

-- node: NC.3/gauge-witness-fixed
lemma gauge_witness_fixed (c d : Z1 G U) (N : Subgroup G)
    (hc : ∀ n ∈ N, c n = 1) (hd : ∀ n ∈ N, d n = 1) (x : U)
    (h : ∀ g, d g = x * c g * (g • x)⁻¹) :
    ∀ n ∈ N, n • x = x := by
  intro n hn
  have he := h n
  rw [hc n hn, hd n hn, mul_one] at he
  exact (mul_inv_eq_one.mp he.symm).symm

-- node: NC.3/finite-family-normal-killing
lemma exists_openNormal_killing_family [IsTopologicalGroup G] [CompactSpace G]
    {ι : Type w} [Finite ι] (V : ι → Type v) [∀ i, Group (V i)]
    [∀ i, TopologicalSpace (V i)] [∀ i, DiscreteTopology (V i)]
    [∀ i, MulDistribMulAction G (V i)] (c : ∀ i, Z1 G (V i)) :
    ∃ N : OpenNormalSubgroup G, ∀ i n, n ∈ N → c i n = 1 := by
  let W : Set G := ⋂ i, ((c i).oneFibre : Set G)
  have hW : IsClopen W := isClopen_iInter_of_finite (fun i => (c i).oneFibre_isClopen)
  have h1 : (1 : G) ∈ W := by simp only [W, Set.mem_iInter]; exact fun i => (c i).map_one
  obtain ⟨N, hN⟩ := IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one hW h1
  exact ⟨N, fun i n hn => Set.mem_iInter.mp (hN hn) i⟩
end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]

-- node: NC.3/cocycle-values-invariants
lemma values_mem_fixedPoints (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g : G) : c g ∈ FixedPoints.subgroup N U := by
  rw [FixedPoints.mem_subgroup]
  intro n
  exact c.values_fixed_of_trivial N hc g n n.property

lemma oneFibre_eq_top (c : Z1 G U) (hc : ∀ g, c g = 1) : c.oneFibre = ⊤ := by
  ext g
  simp only [mem_oneFibre, Subgroup.mem_top, iff_true]
  exact hc g

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_trivial
example : (1 : Z1 G U).oneFibre = ⊤ := by
  apply oneFibre_eq_top
  intro g
  rfl

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_native_kernel
example (f : G →* U) (hf : Continuous f) (htriv : ∀ (g : G) (x : U), g • x = x) :
    oneFibre (⟨f, hf, by intro g h; rw [f.map_mul, htriv]⟩ : Z1 G U) = f.ker := by
  apply oneFibre_eq_ker
  intro g
  rfl

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_nonnormal
example [TopologicalSpace (ConjAct (Equiv.Perm (Fin 3)))]
    [TopologicalSpace (Equiv.Perm (Fin 3))]
    (c : Z1 (ConjAct (Equiv.Perm (Fin 3))) (Equiv.Perm (Fin 3)))
    (hc : ∀ g, c g = Equiv.swap (0 : Fin 3) 1 *
      (g • Equiv.swap (0 : Fin 3) 1)⁻¹) : ¬ c.oneFibre.Normal := by
  intro hn
  have ht : ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1) ∈ c.oneFibre := by
    rw [mem_oneFibre, hc]
    decide
  have hk := hn.conj_mem _ ht (ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2))
  rw [mem_oneFibre, hc] at hk
  have hbad : Equiv.swap (0 : Fin 3) 1 *
      ((ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2) *
        ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1) *
        (ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2))⁻¹) •
          Equiv.swap (0 : Fin 3) 1)⁻¹ ≠ 1 := by decide
  exact hbad hk

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_empty
example [IsTopologicalGroup G] [CompactSpace G] :
    ∃ N : OpenNormalSubgroup G, ∀ _i : Fin 0, ∀ n : G, n ∈ N → True := by
  obtain ⟨N, _⟩ := IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one
    (G := G) isClopen_univ (Set.mem_univ 1)
  exact ⟨N, fun i => Fin.elim0 i⟩

-- test: TauCeti.NonabelianCohomology.Z1.values_mem_fixedPoints.test_top_trivial
example (g : G) : (1 : Z1 G U) g ∈ FixedPoints.subgroup (⊤ : Subgroup G) U := by
  change (1 : U) ∈ _
  exact Subgroup.one_mem _

-- test: TauCeti.NonabelianCohomology.Z1.gauge_witness_fixed.test_full_subgroup
example (x : U) (h : ∀ g : G, (1 : U) = x * (g • x)⁻¹) :
    x ∈ FixedPoints.subgroup G U := by
  rw [FixedPoints.mem_subgroup]
  intro g
  exact (mul_inv_eq_one.mp (h g).symm).symm
end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [DiscreteTopology U] [MulDistribMulAction G U]

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing.test_finite_quotient
example (N : OpenNormalSubgroup G) : Finite (G ⧸ N.toSubgroup) :=
  Subgroup.quotient_finite_of_isOpen N.toSubgroup N.isOpen

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_single
example (c : Z1 G U) : ∃ N : OpenNormalSubgroup G, ∀ n ∈ N, c n = 1 := by
  obtain ⟨N, hN⟩ := exists_openNormal_killing_family (fun _ : Fin 1 => U) (fun _ => c)
  exact ⟨N, fun n hn => hN 0 n hn⟩
end Z1

-- Quotient cocycle descent continuation, Codex codex-a71f92.
namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

def descend (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) :
    Z1 (G ⧸ N) (FixedPoints.subgroup N U) := by
  let f : G ⧸ N → FixedPoints.subgroup N U :=
    Quotient.lift (fun g => ⟨c g, c.values_mem_fixedPoints N hc g⟩)
      (by
        intro a b hab
        apply Subtype.ext
        have hn : a⁻¹ * b ∈ N := QuotientGroup.leftRel_apply.mp hab
        have he := c.mul_right_eq_of_trivial N hc a (a⁻¹ * b) hn
        simpa only [mul_inv_cancel_left] using he.symm)
  refine ⟨f, ?_, ?_⟩
  · exact (QuotientGroup.isQuotientMap_mk N).continuous_iff.mpr
      (c.continuous.subtype_mk (fun g => c.values_mem_fixedPoints N hc g))
  · intro q r
    induction q using QuotientGroup.induction_on with | H g =>
      induction r using QuotientGroup.induction_on with | H h =>
        apply Subtype.ext
        change c (g * h) = c g * g • c h
        exact c.map_mul g h

lemma descend_apply (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) (g : G) :
    (descend N c hc (QuotientGroup.mk g)).val = c g := rfl

lemma descend_unique (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (hd : ∀ g : G, (d (QuotientGroup.mk g)).val = c g) : d = descend N c hc := by
  apply Z1.ext
  intro q
  induction q using QuotientGroup.induction_on with | H g =>
    apply Subtype.ext
    exact hd g

def inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) : Z1 G U := by
  refine ⟨fun g => (d (QuotientGroup.mk g)).val, ?_, ?_⟩
  · exact continuous_subtype_val.comp (d.continuous.comp QuotientGroup.continuous_mk)
  · intro g h
    have he := congrArg Subtype.val (d.map_mul (QuotientGroup.mk g) (QuotientGroup.mk h))
    exact he

lemma inflate_apply (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    inflate N d g = (d (QuotientGroup.mk g)).val := rfl

lemma inflate_trivialOn (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (n : G) (hn : n ∈ N) : inflate N d n = 1 := by
  rw [inflate_apply, (QuotientGroup.eq_one_iff n).mpr hn, d.map_one]
  rfl

lemma inflate_descend (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) :
    inflate N (descend N c hc) = c := by
  apply Z1.ext
  intro g
  rfl

lemma descend_inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descend N (inflate N d) (inflate_trivialOn N d) = d := by
  symm
  apply descend_unique
  intro g
  rfl

lemma descend_one (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descend N (1 : Z1 G U) hc = 1 := by
  symm
  apply descend_unique
  intro g
  rfl

lemma inflate_one : inflate N (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by
  apply Z1.ext
  intro g
  rfl

def descendEquiv :
    {c : Z1 G U // ∀ n ∈ N, c n = 1} ≃ Z1 (G ⧸ N) (FixedPoints.subgroup N U) where
  toFun c := descend N c.val c.property
  invFun d := ⟨inflate N d, inflate_trivialOn N d⟩
  left_inv c := Subtype.ext (inflate_descend N c.val c.property)
  right_inv d := descend_inflate N d

lemma descendEquiv_apply (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    descendEquiv N c = descend N c.val c.property := rfl

lemma descendEquiv_symm_apply (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    ((descendEquiv N).symm d).val = inflate N d := rfl

lemma descend_proof_independent (c : Z1 G U) (hc hc' : ∀ n ∈ N, c n = 1) :
    descend N c hc = descend N c hc' := rfl

lemma descend_gauge_iff (c d : Z1 G U) (hc : ∀ n ∈ N, c n = 1)
    (hd : ∀ n ∈ N, d n = 1) :
    (∃ x : U, ∀ g, d g = x * c g * (g • x)⁻¹) ↔
      ∃ x : FixedPoints.subgroup N U, ∀ q : G ⧸ N,
        descend N d hd q = x * descend N c hc q * (q • x)⁻¹ := by
  constructor
  · rintro ⟨x,hx⟩
    have hfixed : x ∈ FixedPoints.subgroup N U := by
      rw [FixedPoints.mem_subgroup]
      intro n
      exact gauge_witness_fixed c d N hc hd x hx n n.property
    refine ⟨⟨x,hfixed⟩, ?_⟩
    intro q
    induction q using QuotientGroup.induction_on with | H g =>
      apply Subtype.ext
      exact hx g
  · rintro ⟨x,hx⟩
    refine ⟨x.val, ?_⟩
    intro g
    exact congrArg Subtype.val (hx (QuotientGroup.mk g))
lemma inflate_injective : Function.Injective (inflate N : Z1 (G ⧸ N) (FixedPoints.subgroup N U) → Z1 G U) := by
  intro d e h
  apply Z1.ext
  intro q
  induction q using QuotientGroup.induction_on with | H g =>
    apply Subtype.ext
    exact congrArg (fun c : Z1 G U => c g) h

lemma descendEquiv_left_inv (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    (descendEquiv N).symm (descendEquiv N c) = c := (descendEquiv N).left_inv c

lemma descendEquiv_right_inv (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descendEquiv N ((descendEquiv N).symm d) = d := (descendEquiv N).right_inv d

lemma descendEquiv_one (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descendEquiv N ⟨1,hc⟩ = 1 := descend_one N hc

end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

-- Descent: degenerate cocycle.
-- test: TauCeti.NonabelianCohomology.Z1.descend.test_one
example (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descend N (1 : Z1 G U) hc = 1 := descend_one N hc

-- Descent: representative compatibility on the actual quotient.
-- test: TauCeti.NonabelianCohomology.Z1.descend.test_representative
example (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) :
    descend N c hc (QuotientGroup.mk (g * n)) = descend N c hc (QuotientGroup.mk g) := by
  apply Subtype.ext
  exact c.mul_right_eq_of_trivial N hc g n hn

-- Descent: the prescribed target is strictly smaller than U in this nonabelian case.
-- test: TauCeti.NonabelianCohomology.Z1.descend.test_proper_invariants
example :
    Equiv.swap (0 : Fin 3) 1 ∉
      FixedPoints.subgroup (⊤ : Subgroup (ConjAct (Equiv.Perm (Fin 3))))
        (Equiv.Perm (Fin 3)) := by
  intro h
  rw [FixedPoints.mem_subgroup] at h
  have he := h
    ⟨ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2), Subgroup.mem_top _⟩
  have hn : ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2) •
      Equiv.swap (0 : Fin 3) 1 ≠ Equiv.swap (0 : Fin 3) 1 := by decide
  exact hn he

-- Inflation: base-point preservation.
-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_one
example : inflate N (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := inflate_one N

-- Inflation: exact cocycle pullback along the native quotient projection.
-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_native_projection
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    inflate N d g = (d (QuotientGroup.mk g)).val := rfl

-- Inflation: it is necessarily trivial on N.
-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_subgroup
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (n : G) (hn : n ∈ N) :
    inflate N d n = 1 := inflate_trivialOn N d n hn

-- Equivalence: actual recovery of the original cocycle.
-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_left_inverse
example (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    (descendEquiv N).symm (descendEquiv N c) = c := (descendEquiv N).left_inv c

-- Equivalence: actual recovery of every quotient cocycle.
-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_right_inverse
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descendEquiv N ((descendEquiv N).symm d) = d := (descendEquiv N).right_inv d

-- Equivalence: proof of triviality does not alter the actual descended cocycle.
-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_proof_irrelevance
example (c : Z1 G U) (hc hc' : ∀ n ∈ N, c n = 1) :
    descendEquiv N ⟨c,hc⟩ = descendEquiv N ⟨c,hc'⟩ := rfl
end Z1

section QuotientH1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [IsTopologicalGroup U] [ContinuousSMul G U]
  (N : Subgroup G) [N.Normal]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]

lemma Z1.inflate_smul (x : FixedPoints.subgroup N U)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.inflate N (x • d) = x.val • Z1.inflate N d := by
  apply Z1.ext
  intro g
  rfl

lemma Z1.inflate_gauge_iff (d e : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (∃ x : U, x • Z1.inflate N d = Z1.inflate N e) ↔
      ∃ x : FixedPoints.subgroup N U, x • d = e := by
  constructor
  · rintro ⟨x,hx⟩
    have hp : ∀ g, Z1.inflate N e g =
        x * Z1.inflate N d g * (g • x)⁻¹ := by
      intro g
      exact (congrArg (fun c : Z1 G U => c g) hx).symm
    have hfixed : x ∈ FixedPoints.subgroup N U := by
      rw [FixedPoints.mem_subgroup]
      intro n
      exact Z1.gauge_witness_fixed (Z1.inflate N d) (Z1.inflate N e) N
        (Z1.inflate_trivialOn N d) (Z1.inflate_trivialOn N e) x hp n n.property
    refine ⟨⟨x,hfixed⟩, ?_⟩
    apply Z1.ext
    intro q
    induction q using QuotientGroup.induction_on with | H g =>
      apply Subtype.ext
      exact congrArg (fun c : Z1 G U => c g) hx
  · rintro ⟨x,hx⟩
    refine ⟨x.val, ?_⟩
    rw [← Z1.inflate_smul, hx]

namespace H1

def inflate : H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 G U :=
  Quotient.lift (fun d => mk (Z1.inflate N d)) (by
    intro d e h
    apply mk_eq_mk_iff.mpr
    obtain ⟨x,hx⟩ := MulAction.mem_orbit_iff.mp (MulAction.orbitRel_apply.mp h)
    refine ⟨x.val⁻¹, ?_⟩
    rw [← hx, Z1.inflate_smul, inv_smul_smul])

lemma inflate_mk (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    inflate N (mk d) = mk (Z1.inflate N d) := rfl

lemma inflate_one : inflate N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by
  change mk (Z1.inflate N 1) = mk 1
  rw [Z1.inflate_one]

lemma inflate_injective :
    Function.Injective (inflate N : H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 G U) := by
  intro a b h
  induction a using Quotient.inductionOn with | h d =>
    induction b using Quotient.inductionOn with | h e =>
      apply mk_eq_mk_iff.mpr
      apply (Z1.inflate_gauge_iff N d e).mp
      exact mk_eq_mk_iff.mp h

lemma inflate_eq_one_iff (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    inflate N a = 1 ↔ a = 1 := by
  rw [← inflate_one (N := N)]
  exact (inflate_injective N).eq_iff

end H1
-- test: TauCeti.NonabelianCohomology.H1.inflate.test_one
example : H1.inflate N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 :=
  H1.inflate_one N

-- test: TauCeti.NonabelianCohomology.H1.inflate.test_gauge
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (x : FixedPoints.subgroup N U) :
    H1.inflate N (H1.mk (x • d)) = H1.inflate N (H1.mk d) := by
  apply congrArg (H1.inflate N)
  symm
  exact H1.mk_eq_mk_iff.mpr ⟨x,rfl⟩

-- test: TauCeti.NonabelianCohomology.H1.inflate.test_neutral_reflection
example (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.inflate N a = 1 ↔ a = 1 := H1.inflate_eq_one_iff N a

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
      continuous_of_discreteTopology, by decide⟩
    let d := Z1.descend N c (by
      intro n hn
      have he : n = 1 := Subgroup.mem_bot.mp hn
      rw [he]
      exact Z1.map_one c)
    H1.inflate N (H1.mk d) ≠ 1 := by
  intro G U N c d h
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  let : ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U) :=
    ⟨continuous_of_discreteTopology⟩
  rw [H1.inflate_mk, Z1.inflate_descend] at h
  obtain ⟨x,hx⟩ := H1.mk_eq_one_iff _ |>.mp h
  have he := hx (Equiv.swap (0 : Fin 2) 1)
  change Equiv.swap (0 : Fin 3) 1 = x * x⁻¹ at he
  rw [mul_inv_cancel] at he
  exact (by decide : Equiv.swap (0 : Fin 3) 1 ≠ 1) he

end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Z1.descend
#print axioms TauCeti.NonabelianCohomology.Z1.descend_apply
#print axioms TauCeti.NonabelianCohomology.Z1.descend_unique
#print axioms TauCeti.NonabelianCohomology.Z1.inflate
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_apply
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_trivialOn
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_descend
#print axioms TauCeti.NonabelianCohomology.Z1.descend_inflate
#print axioms TauCeti.NonabelianCohomology.Z1.descend_one
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_one
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv_apply
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv_symm_apply
#print axioms TauCeti.NonabelianCohomology.Z1.descend_proof_independent
#print axioms TauCeti.NonabelianCohomology.Z1.descend_gauge_iff
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_injective
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv_left_inv
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv_right_inv
#print axioms TauCeti.NonabelianCohomology.Z1.descendEquiv_one

#print axioms TauCeti.NonabelianCohomology.Z1.instMulAction
#print axioms TauCeti.NonabelianCohomology.Z1.smul_apply
#print axioms TauCeti.NonabelianCohomology.Z1.coboundary
#print axioms TauCeti.NonabelianCohomology.H1.mk
#print axioms TauCeti.NonabelianCohomology.H1.mk_surjective
#print axioms TauCeti.NonabelianCohomology.H1.mk_eq_mk_iff
#print axioms TauCeti.NonabelianCohomology.H1.instOne
#print axioms TauCeti.NonabelianCohomology.H1.mk_eq_one_iff
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_smul
#print axioms TauCeti.NonabelianCohomology.Z1.inflate_gauge_iff
#print axioms TauCeti.NonabelianCohomology.H1.inflate
#print axioms TauCeti.NonabelianCohomology.H1.inflate_mk
#print axioms TauCeti.NonabelianCohomology.H1.inflate_one
#print axioms TauCeti.NonabelianCohomology.H1.inflate_injective
#print axioms TauCeti.NonabelianCohomology.H1.inflate_eq_one_iff

namespace TauCeti.NonabelianCohomology
universe u v

section Restriction
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G)

namespace Z1
def restrict (c : Z1 G U) : Z1 N U :=
  ⟨fun n => c n.val, c.continuous.comp continuous_subtype_val,
    fun n m => c.map_mul n.val m.val⟩

lemma restrict_apply (c : Z1 G U) (n : N) : restrict N c n = c n.val := rfl

lemma restrict_one : restrict N (1 : Z1 G U) = 1 := rfl

variable [IsTopologicalGroup U] [ContinuousSMul G U]

lemma restrict_smul (x : U) (c : Z1 G U) :
    restrict N (x • c) = x • restrict N c := rfl

lemma normalize_trivialOn (c : Z1 G U) (x : U)
    (hx : ∀ n : N, c n.val = x * (n.val • x)⁻¹) :
    ∀ n ∈ N, (x⁻¹ • c) n = 1 := by
  intro n hn
  rw [smul_apply, hx ⟨n,hn⟩, smul_inv', inv_inv]
  group
end Z1

variable [IsTopologicalGroup U] [ContinuousSMul G U]

namespace H1
lemma mk_smul (x : U) (c : Z1 G U) : mk (x • c) = mk c := by
  symm
  exact mk_eq_mk_iff.mpr ⟨x,rfl⟩

def restrict : H1 G U → H1 N U :=
  Quotient.lift (fun c => mk (Z1.restrict N c)) (by
    intro c d h
    obtain ⟨x,hx⟩ := MulAction.mem_orbit_iff.mp (MulAction.orbitRel_apply.mp h)
    rw [← hx, Z1.restrict_smul, mk_smul])

lemma restrict_mk (c : Z1 G U) : restrict N (mk c) = mk (Z1.restrict N c) := rfl

lemma restrict_one : restrict N (1 : H1 G U) = 1 := by
  change mk (Z1.restrict N 1) = mk 1
  rw [Z1.restrict_one]

lemma restrict_mk_eq_one_iff (c : Z1 G U) :
    restrict N (mk c) = 1 ↔ ∃ x : U, ∀ n : N, c n.val = x * (n.val • x)⁻¹ := by
  rw [restrict_mk, mk_eq_one_iff]
  rfl
end H1
end Restriction

section Exactness
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

lemma Z1.restrict_inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.restrict N (Z1.inflate N d) = 1 := by
  apply Z1.ext
  intro n
  exact Z1.inflate_trivialOn N d n.val n.property

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]

namespace H1
lemma restrict_inflate (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    restrict N (inflate N a) = 1 := by
  induction a using Quotient.inductionOn with | h d =>
    change restrict N (inflate N (mk d)) = 1
    rw [inflate_mk, restrict_mk, Z1.restrict_inflate]
    rfl

theorem mem_range_inflate_iff_restrict_eq_one (a : H1 G U) :
    a ∈ Set.range (inflate N) ↔ restrict N a = 1 := by
  constructor
  · rintro ⟨b,rfl⟩
    exact restrict_inflate N b
  · induction a using Quotient.inductionOn with | h c =>
      intro h
      change restrict N (mk c) = 1 at h
      change mk c ∈ Set.range (inflate N)
      rw [restrict_mk, mk_eq_one_iff] at h
      obtain ⟨x,hx⟩ := h
      have hc : ∀ n ∈ N, (x⁻¹ • c) n = 1 := Z1.normalize_trivialOn N c x hx
      refine ⟨mk (Z1.descend N (x⁻¹ • c) hc), ?_⟩
      rw [inflate_mk, Z1.inflate_descend, mk_smul]

theorem existsUnique_inflate_of_restrict_eq_one (a : H1 G U) (ha : restrict N a = 1) :
    ∃! b : H1 (G ⧸ N) (FixedPoints.subgroup N U), inflate N b = a := by
  obtain ⟨b,hb⟩ := (mem_range_inflate_iff_restrict_eq_one N a).mpr ha
  exact ⟨b,hb,fun d hd => inflate_injective N (hd.trans hb.symm)⟩
end H1
end Exactness

section RestrictionTests
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G)

-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_one
example : Z1.restrict N (1 : Z1 G U) = 1 := Z1.restrict_one N
-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_subgroup_value
example (c : Z1 G U) (n : N) : Z1.restrict N c n = c n.val := rfl
-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_bottom
example (c : Z1 G U) : Z1.restrict (⊥ : Subgroup G) c = 1 := by
  ext n
  change c n.val = 1
  rw [Subgroup.mem_bot.mp n.property, Z1.map_one]

variable [IsTopologicalGroup U] [ContinuousSMul G U]
-- test: TauCeti.NonabelianCohomology.H1.restrict.test_one
example : H1.restrict N (1 : H1 G U) = 1 := H1.restrict_one N
-- test: TauCeti.NonabelianCohomology.H1.restrict.test_gauge
example (x : U) (c : Z1 G U) : H1.restrict N (H1.mk (x • c)) = H1.restrict N (H1.mk c) := by
  rw [H1.mk_smul]
-- test: TauCeti.NonabelianCohomology.H1.restrict.test_bottom
example (a : H1 G U) : H1.restrict (⊥ : Subgroup G) a = 1 := by
  induction a using Quotient.inductionOn with | h c =>
    change H1.restrict (⊥ : Subgroup G) (H1.mk c) = 1
    rw [H1.restrict_mk]
    have hc : Z1.restrict (⊥ : Subgroup G) c = 1 := by
      ext n
      change c n.val = 1
      rw [Subgroup.mem_bot.mp n.property, Z1.map_one]
    rw [hc]
    rfl
-- test: TauCeti.NonabelianCohomology.H1.restrict.test_top_detects
example (a : H1 G U) : H1.restrict (⊤ : Subgroup G) a = 1 ↔ a = 1 := by
  induction a using Quotient.inductionOn with | h c =>
    change H1.restrict (⊤ : Subgroup G) (H1.mk c) = 1 ↔ H1.mk c = 1
    rw [H1.restrict_mk, H1.mk_eq_one_iff, H1.mk_eq_one_iff]
    constructor
    · rintro ⟨x,hx⟩
      exact ⟨x,fun g => hx ⟨g,Subgroup.mem_top g⟩⟩
    · rintro ⟨x,hx⟩
      exact ⟨x,fun n => hx n.val⟩
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
    (x⁻¹ • c = 1) ∧ (x • c ≠ 1) := by
  intro U G x c
  let : TopologicalSpace U := ⊥
  let : TopologicalSpace G := ⊥
  let : DiscreteTopology U := ⟨rfl⟩
  let : DiscreteTopology G := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
  constructor
  · exact inv_smul_smul x (1 : Z1 G U)
  · intro h
    have he := congrArg (fun d : Z1 G U => d (ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1))) h
    exact (by decide :
      x * (x * (1 : U) * (ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1) • x)⁻¹) *
        (ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1) • x)⁻¹ ≠ 1) he

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
      Z1.restrict (⊤ : Subgroup G) c ≠ 1 := by
  intro U G x c
  let : TopologicalSpace U := ⊥
  let : TopologicalSpace G := ⊥
  let : DiscreteTopology U := ⟨rfl⟩
  let : DiscreteTopology G := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
  constructor
  · change H1.restrict (⊤ : Subgroup G) (H1.mk (x • 1)) = 1
    rw [H1.mk_smul]
    exact H1.restrict_one (⊤ : Subgroup G)
  · intro h
    have he := congrArg (fun d : Z1 (⊤ : Subgroup G) U =>
      d ⟨ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1), Subgroup.mem_top _⟩) h
    exact (by decide :
      x * (1 : U) * (ConjAct.toConjAct (Equiv.swap (0 : Fin 3) 1) • x)⁻¹ ≠ 1) he

end TauCeti.NonabelianCohomology

#print axioms TauCeti.NonabelianCohomology.Z1.restrict
#print axioms TauCeti.NonabelianCohomology.Z1.restrict_apply
#print axioms TauCeti.NonabelianCohomology.Z1.restrict_one
#print axioms TauCeti.NonabelianCohomology.Z1.restrict_smul
#print axioms TauCeti.NonabelianCohomology.Z1.normalize_trivialOn
#print axioms TauCeti.NonabelianCohomology.H1.mk_smul
#print axioms TauCeti.NonabelianCohomology.H1.restrict
#print axioms TauCeti.NonabelianCohomology.H1.restrict_mk
#print axioms TauCeti.NonabelianCohomology.H1.restrict_one
#print axioms TauCeti.NonabelianCohomology.H1.restrict_mk_eq_one_iff
#print axioms TauCeti.NonabelianCohomology.Z1.restrict_inflate
#print axioms TauCeti.NonabelianCohomology.H1.restrict_inflate
#print axioms TauCeti.NonabelianCohomology.H1.mem_range_inflate_iff_restrict_eq_one
#print axioms TauCeti.NonabelianCohomology.H1.existsUnique_inflate_of_restrict_eq_one
namespace TauCeti.NonabelianCohomology
universe u v
section QuotientActionContinuity
variable {G : Type u} [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [ContinuousSMul G U]

lemma quotientFixedContinuousSMul (N : Subgroup G) [N.Normal] :
    ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U) where
  continuous_smul := by
    apply (QuotientGroup.isOpenQuotientMap_mk.prodMap IsOpenQuotientMap.id).continuous_comp_iff.mp
    rw [continuous_induced_rng]
    change Continuous (fun p : G × FixedPoints.subgroup N U => p.1 • p.2.val)
    exact continuous_fst.smul (continuous_subtype_val.comp continuous_snd)

end QuotientActionContinuity
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.quotientFixedContinuousSMul
namespace TauCeti.NonabelianCohomology
universe u v
section NeutralEquivalence
variable {G : Type u} [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  {U : Type v} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  (N : Subgroup G) [N.Normal]

attribute [local instance] quotientFixedContinuousSMul

def H1.inflateNeutralEquiv :
    H1 (G ⧸ N) (FixedPoints.subgroup N U) ≃
      {a : H1 G U // H1.restrict N a = 1} := by
  classical
  refine Equiv.ofBijective
    (fun a => (⟨H1.inflate N a, H1.restrict_inflate N a⟩ :
      {a : H1 G U // H1.restrict N a = 1})) ⟨?_, ?_⟩
  · intro a b h
    exact H1.inflate_injective N (congrArg Subtype.val h)
  · rintro ⟨a, ha⟩
    obtain ⟨b, hb⟩ := (H1.mem_range_inflate_iff_restrict_eq_one N a).mpr ha
    exact ⟨b, Subtype.ext hb⟩

lemma H1.inflateNeutralEquiv_apply
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (inflateNeutralEquiv N a).val = inflate N a := rfl

lemma H1.inflateNeutralEquiv_symm_inflate
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (inflateNeutralEquiv N).symm ⟨inflate N a, restrict_inflate N a⟩ = a :=
  (inflateNeutralEquiv N).symm_apply_apply a

lemma H1.inflateNeutralEquiv_apply_symm
    (a : {a : H1 G U // H1.restrict N a = 1}) :
    inflate N ((inflateNeutralEquiv N).symm a) = a.val :=
  congrArg Subtype.val ((inflateNeutralEquiv N).apply_symm_apply a)

lemma H1.inflateNeutralEquiv_one :
    inflateNeutralEquiv N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) =
      ⟨1, restrict_one N⟩ := Subtype.ext (inflate_one N)

-- TauCeti.NonabelianCohomology.quotientFixedContinuousSMul.test_joint
example : Continuous (fun p : (G ⧸ N) × FixedPoints.subgroup N U => p.1 • p.2) :=
  (quotientFixedContinuousSMul (U := U) N).continuous_smul

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_one
example : H1.inflateNeutralEquiv N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) =
    ⟨1, H1.restrict_one N⟩ := H1.inflateNeutralEquiv_one N

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_representative
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (H1.inflateNeutralEquiv N (H1.mk d)).val = H1.mk (Z1.inflate N d) := rfl

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_target_round_trip
example (a : H1 G U) (ha : H1.restrict N a = 1) :
    H1.inflate N ((H1.inflateNeutralEquiv N).symm ⟨a, ha⟩) = a :=
  H1.inflateNeutralEquiv_apply_symm N ⟨a, ha⟩

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_nonneutral
example (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) (ha : a ≠ 1) :
    (H1.inflateNeutralEquiv N a).val ≠ 1 := by
  intro h
  change H1.inflate N a = 1 at h
  rw [← H1.inflate_one N] at h
  exact ha (H1.inflate_injective N h)

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_gauge_neutral
example (x : U) :
    (H1.inflateNeutralEquiv N).symm
      ⟨H1.mk (x • (1 : Z1 G U)), by
        rw [H1.mk_smul]
        exact H1.restrict_one N⟩ = 1 := by
  apply (H1.inflateNeutralEquiv N).injective
  rw [H1.inflateNeutralEquiv_one]
  apply Subtype.ext
  exact (congrArg Subtype.val ((H1.inflateNeutralEquiv N).apply_symm_apply
    ⟨H1.mk (x • (1 : Z1 G U)), by
      rw [H1.mk_smul]
      exact H1.restrict_one N⟩)).trans (H1.mk_smul x 1)

end NeutralEquivalence
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv
#print axioms TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_apply
#print axioms TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_symm_inflate
#print axioms TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_apply_symm
#print axioms TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv_one
namespace TauCeti.NonabelianCohomology
section Transitions
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {M N P : Subgroup G} [M.Normal] [N.Normal] [P.Normal]

/-- Reverse-inclusion transition: descend the same inflated cocycle to the smaller subgroup. -/
def Z1.transition (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1 (G ⧸ M) (FixedPoints.subgroup M U) :=
  Z1.descend M (Z1.inflate N d) (fun n hn => Z1.inflate_trivialOn N d n (h hn))

lemma Z1.transition_apply (h : M ≤ N)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    (Z1.transition h d (QuotientGroup.mk g)).val = (d (QuotientGroup.mk g)).val := rfl

lemma Z1.inflate_transition (h : M ≤ N)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.inflate M (Z1.transition h d) = Z1.inflate N d := Z1.inflate_descend _ _ _

lemma Z1.transition_refl (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition (le_refl N) d = d := Z1.descend_inflate N d

lemma Z1.transition_trans (h : M ≤ N) (k : P ≤ M)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition k (Z1.transition h d) = Z1.transition (k.trans h) d := by
  apply Z1.inflate_injective P
  rw [Z1.inflate_transition, Z1.inflate_transition, Z1.inflate_transition]

lemma Z1.transition_one (h : M ≤ N) :
    Z1.transition h (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by
  apply Z1.inflate_injective M
  rw [Z1.inflate_transition, Z1.inflate_one, Z1.inflate_one]

lemma Z1.transition_injective (h : M ≤ N) :
    Function.Injective (Z1.transition (U := U) h) := by
  intro d e he
  apply Z1.inflate_injective N
  simpa only [Z1.inflate_transition] using congrArg (Z1.inflate M) he

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ M) (FixedPoints.subgroup M U)]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]
  [ContinuousSMul (G ⧸ P) (FixedPoints.subgroup P U)]

/-- Transitions on the actual native gauge-orbit pointed sets. -/
def H1.transition (h : M ≤ N) :
    H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 (G ⧸ M) (FixedPoints.subgroup M U) :=
  Quotient.lift (fun d => H1.mk (Z1.transition h d)) (by
    intro d e he
    apply H1.inflate_injective M
    rw [H1.inflate_mk, H1.inflate_mk, Z1.inflate_transition, Z1.inflate_transition]
    exact congrArg (H1.inflate N) (Quotient.sound he))

lemma H1.transition_mk (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition h (H1.mk d) = H1.mk (Z1.transition h d) := rfl

lemma H1.inflate_transition (h : M ≤ N) (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.inflate M (H1.transition h a) = H1.inflate N a := by
  induction a using Quotient.inductionOn with | h d =>
    change H1.mk (Z1.inflate M (Z1.transition h d)) = H1.mk (Z1.inflate N d)
    rw [Z1.inflate_transition]

lemma H1.transition_refl (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition (le_refl N) a = a := by
  apply H1.inflate_injective N
  rw [H1.inflate_transition]

lemma H1.transition_trans (h : M ≤ N) (k : P ≤ M)
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition k (H1.transition h a) = H1.transition (k.trans h) a := by
  apply H1.inflate_injective P
  rw [H1.inflate_transition, H1.inflate_transition, H1.inflate_transition]

lemma H1.transition_one (h : M ≤ N) :
    H1.transition h (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by
  apply H1.inflate_injective M
  rw [H1.inflate_transition, H1.inflate_one, H1.inflate_one]

lemma H1.transition_injective (h : M ≤ N) :
    Function.Injective (H1.transition (U := U) h) := by
  intro a b he
  apply H1.inflate_injective N
  simpa only [H1.inflate_transition] using congrArg (H1.inflate M) he

end Transitions
end TauCeti.NonabelianCohomology

#print axioms TauCeti.NonabelianCohomology.Z1.transition
#print axioms TauCeti.NonabelianCohomology.H1.transition
#print axioms TauCeti.NonabelianCohomology.H1.inflate_transition
#print axioms TauCeti.NonabelianCohomology.H1.transition_trans
#print axioms TauCeti.NonabelianCohomology.H1.transition_injective

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
  map_id N := by
    ext a
    exact H1.transition_refl a
  map_comp {M N P} f g := by
    ext a
    exact (H1.transition_trans (M := (OrderDual.ofDual N).toSubgroup) (N := (OrderDual.ofDual M).toSubgroup) (P := (OrderDual.ofDual P).toSubgroup) (leOfHom f) (leOfHom g) a).symm

/-- The native inflation maps form a cocone of pointed sets in the category of types. -/
def H1.inflationCocone : Cocone (H1.quotientDiagram G U) where
  pt := H1 G U
  ι := {
    app N := ↾(H1.inflate (OrderDual.ofDual N).toSubgroup)
    naturality := by
      intro M N f
      ext a
      exact H1.inflate_transition (show (OrderDual.ofDual N).toSubgroup ≤ (OrderDual.ofDual M).toSubgroup from leOfHom f) a }

lemma H1.quotientDiagram_map_apply {M N : OrderDual (OpenNormalSubgroup G)}
    (f : M ⟶ N) (a : (H1.quotientDiagram G U).obj M) :
    (H1.quotientDiagram G U).map f a = H1.transition (M := (OrderDual.ofDual N).toSubgroup) (N := (OrderDual.ofDual M).toSubgroup) (show _ ≤ _ from leOfHom f) a := rfl

lemma H1.inflationCocone_app (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.inflationCocone G U).ι.app N a = H1.inflate (OrderDual.ofDual N).toSubgroup a := rfl


lemma H1.quotientDiagram_obj (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.quotientDiagram G U).obj N =
      H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U) := rfl

lemma H1.quotientDiagram_map_id (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.quotientDiagram G U).map (𝟙 N) a = a := H1.transition_refl a

lemma H1.inflationCocone_pt : (H1.inflationCocone G U).pt = H1 G U := rfl

lemma H1.inflationCocone_naturality {M N : OrderDual (OpenNormalSubgroup G)}
    (f : M ⟶ N) (a : (H1.quotientDiagram G U).obj M) :
    (H1.inflationCocone G U).ι.app N ((H1.quotientDiagram G U).map f a) =
      (H1.inflationCocone G U).ι.app M a :=
  H1.inflate_transition (M := (OrderDual.ofDual N).toSubgroup)
    (N := (OrderDual.ofDual M).toSubgroup) (leOfHom f) a

end QuotientDiagram

section CompactDiscreteColimit
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [DiscreteTopology U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul

/-- Every class is inflated from a genuinely descended cocycle on an open normal quotient. -/
theorem H1.exists_quotient_class (a : H1 G U) :
    ∃ (N : OpenNormalSubgroup G) (b : H1 (G ⧸ N.toSubgroup) (FixedPoints.subgroup N.toSubgroup U)),
      H1.inflate N.toSubgroup b = a := by
  obtain ⟨c, rfl⟩ := H1.mk_surjective a
  obtain ⟨N, hc⟩ := Z1.exists_openNormal_killing c
  refine ⟨N, H1.mk (Z1.descend N.toSubgroup c hc), ?_⟩
  rw [H1.inflate_mk, Z1.inflate_descend]

/-- Inflation realizes the native filtered colimit, with equality detected on intersections. -/
noncomputable def H1.inflationCoconeIsColimit : IsColimit (H1.inflationCocone G U) :=
  Types.FilteredColimit.isColimitOf _ _ (by
    intro a
    obtain ⟨N, b, hb⟩ := H1.exists_quotient_class G U a
    exact ⟨OrderDual.toDual N, b, hb.symm⟩) (by
    intro M N a b hab
    let K : OpenNormalSubgroup G := OrderDual.ofDual M ⊓ OrderDual.ofDual N
    refine ⟨OrderDual.toDual K, homOfLE (show K ≤ OrderDual.ofDual M from inf_le_left), homOfLE (show K ≤ OrderDual.ofDual N from inf_le_right), ?_⟩
    apply H1.inflate_injective K.toSubgroup
    change H1.inflate K.toSubgroup (H1.transition _ a) =
      H1.inflate K.toSubgroup (H1.transition _ b)
    change H1.inflate (OrderDual.ofDual M).toSubgroup a =
      H1.inflate (OrderDual.ofDual N).toSubgroup b at hab
    exact (H1.inflate_transition (M := K.toSubgroup) (N := (OrderDual.ofDual M).toSubgroup) inf_le_left a).trans
      (hab.trans (H1.inflate_transition (M := K.toSubgroup) (N := (OrderDual.ofDual N).toSubgroup) inf_le_right b).symm))


omit [IsTopologicalGroup G] [CompactSpace G] in
/-- The indexing category is filtered: intersections refine any two subgroups. -/
theorem H1.quotientIndex_isFiltered : IsFiltered (OrderDual (OpenNormalSubgroup G)) := by
  let : Nonempty (OpenNormalSubgroup G) := ⟨⟨⊤, (show (⊤ : Subgroup G).Normal from inferInstance)⟩⟩
  infer_instance

/-- The chosen native colimit is identified with H¹ by inflation. -/
noncomputable def H1.finiteQuotientColimitEquiv :
    colimit (H1.quotientDiagram G U) ≃ H1 G U :=
  (IsColimit.coconePointUniqueUpToIso (colimit.isColimit _) (H1.inflationCoconeIsColimit G U)).toEquiv

lemma H1.finiteQuotientColimitEquiv_ι (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N a) =
      H1.inflate (OrderDual.ofDual N).toSubgroup a := by
  exact congrArg (fun f : (H1.quotientDiagram G U).obj N ⟶ H1 G U => f a)
    (IsColimit.comp_coconePointUniqueUpToIso_hom (colimit.isColimit _)
      (H1.inflationCoconeIsColimit G U) N)

lemma H1.finiteQuotientColimitEquiv_symm_inflate (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.finiteQuotientColimitEquiv G U).symm (H1.inflate (OrderDual.ofDual N).toSubgroup a) =
      colimit.ι (H1.quotientDiagram G U) N a := by
  rw [← H1.finiteQuotientColimitEquiv_ι G U N a, Equiv.symm_apply_apply]

lemma H1.finiteQuotientColimitEquiv_one (N : OrderDual (OpenNormalSubgroup G)) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))) = 1 := by
  exact (H1.finiteQuotientColimitEquiv_ι G U N _).trans (H1.inflate_one _)

end CompactDiscreteColimit
end TauCeti.NonabelianCohomology

#print axioms TauCeti.NonabelianCohomology.H1.quotientDiagram
#print axioms TauCeti.NonabelianCohomology.H1.inflationCocone
#print axioms TauCeti.NonabelianCohomology.H1.exists_quotient_class
#print axioms TauCeti.NonabelianCohomology.H1.inflationCoconeIsColimit

#print axioms TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv
#print axioms TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv_ι

namespace TauCeti.NonabelianCohomology
open CategoryTheory CategoryTheory.Limits
section TransitionTests
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {M N : Subgroup G} [M.Normal] [N.Normal]

-- test: TauCeti.NonabelianCohomology.Z1.transition.test_one
example (h : M ≤ N) : Z1.transition h (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 :=
  Z1.transition_one h
-- test: TauCeti.NonabelianCohomology.Z1.transition.test_value
example (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    (Z1.transition h d (QuotientGroup.mk g)).val = (d (QuotientGroup.mk g)).val :=
  Z1.transition_apply h d g
-- test: TauCeti.NonabelianCohomology.Z1.transition.test_identity
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition (le_refl N) d = d := Z1.transition_refl d

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ M) (FixedPoints.subgroup M U)]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]
-- test: TauCeti.NonabelianCohomology.H1.transition.test_one
example (h : M ≤ N) : H1.transition h (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 :=
  H1.transition_one h
-- test: TauCeti.NonabelianCohomology.H1.transition.test_gauge
example (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (x : FixedPoints.subgroup N U) :
    H1.transition h (H1.mk (x • d)) = H1.mk (Z1.transition h d) := by
  rw [H1.mk_smul, H1.transition_mk]
-- test: TauCeti.NonabelianCohomology.H1.transition.test_nonneutral
example (h : M ≤ N) (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) (ha : a ≠ 1) :
    H1.transition h a ≠ 1 := by
  intro he
  apply ha
  apply H1.transition_injective h
  exact he.trans (H1.transition_one h).symm
end TransitionTests

section DiagramTests
variable (G : Type u) [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul
-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_identity
example (N : OrderDual (OpenNormalSubgroup G)) (a : (H1.quotientDiagram G U).obj N) :
    (H1.quotientDiagram G U).map (𝟙 N) a = a := by
  exact H1.transition_refl a
-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_composition
example {M N P : OrderDual (OpenNormalSubgroup G)} (f : M ⟶ N) (g : N ⟶ P)
    (a : (H1.quotientDiagram G U).obj M) :
    (H1.quotientDiagram G U).map (f ≫ g) a =
      (H1.quotientDiagram G U).map g ((H1.quotientDiagram G U).map f a) := by
  exact congrArg (fun q : (H1.quotientDiagram G U).obj M ⟶ (H1.quotientDiagram G U).obj P => q a)
    ((H1.quotientDiagram G U).map_comp f g)
-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_coefficients
example (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.quotientDiagram G U).obj N =
      H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U) := rfl
-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_representative
example (N : OrderDual (OpenNormalSubgroup G))
    (d : Z1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U)) :
    (H1.inflationCocone G U).ι.app N (H1.mk d) = H1.mk (Z1.inflate (OrderDual.ofDual N).toSubgroup d) := rfl
-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_one
example (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.inflationCocone G U).ι.app N
      (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U)) = (1 : H1 G U) :=
  H1.inflate_one _
-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_commutes
example {M N : OrderDual (OpenNormalSubgroup G)} (f : M ⟶ N)
    (a : (H1.quotientDiagram G U).obj M) :
    (H1.inflationCocone G U).ι.app N ((H1.quotientDiagram G U).map f a) =
      (H1.inflationCocone G U).ι.app M a :=
  H1.inflate_transition (M := (OrderDual.ofDual N).toSubgroup)
    (N := (OrderDual.ofDual M).toSubgroup) (leOfHom f) a
end DiagramTests

section ColimitTests
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [DiscreteTopology U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_target_round_trip
example (a : H1 G U) :
    H1.finiteQuotientColimitEquiv G U ((H1.finiteQuotientColimitEquiv G U).symm a) = a :=
  Equiv.apply_symm_apply _ a
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_one
example (N : OrderDual (OpenNormalSubgroup G)) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N
      (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))) = 1 :=
  H1.finiteQuotientColimitEquiv_one G U N
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_inflated_inverse
example (N : OrderDual (OpenNormalSubgroup G)) (a : (H1.quotientDiagram G U).obj N) :
    (H1.finiteQuotientColimitEquiv G U).symm (H1.inflate (OrderDual.ofDual N).toSubgroup a) =
      colimit.ι (H1.quotientDiagram G U) N a :=
  H1.finiteQuotientColimitEquiv_symm_inflate G U N a
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_nonneutral
example (N : OrderDual (OpenNormalSubgroup G))
    (a : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))
    (ha : a ≠ 1) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N a) ≠ 1 := by
  intro he
  apply ha
  exact (H1.inflate_eq_one_iff (OrderDual.ofDual N).toSubgroup a).mp
    ((H1.finiteQuotientColimitEquiv_ι G U N a).symm.trans he)
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
      (H1.finiteQuotientColimitEquiv G U).symm 1 := by
  intro G U c h
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  have h := (H1.finiteQuotientColimitEquiv G U).symm.injective h
  obtain ⟨x,hx⟩ := H1.mk_eq_one_iff _ |>.mp h
  have he := hx (Equiv.swap (0 : Fin 2) 1)
  change Equiv.swap (0 : Fin 3) 1 = x * x⁻¹ at he
  rw [mul_inv_cancel] at he
  exact (by decide : Equiv.swap (0 : Fin 3) 1 ≠ 1) he

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section CoefficientMaps
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [TopologicalSpace U'] [MulDistribMulAction G U']
  {U'' : Type*} [Group U''] [TopologicalSpace U''] [MulDistribMulAction G U'']

def Z1.map (f : U →* U') (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Z1 G U → Z1 G U' := fun c => ⟨fun g => f (c g), hf.comp c.continuous, by
      intro g h
      exact (congrArg f (c.map_mul g h)).trans ((_root_.map_mul f _ _).trans (congrArg (fun z => f (c g) * z) (hG g (c h))))⟩

lemma Z1.map_apply (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (g : G) :
    Z1.map f hf hG c g = f (c g) := rfl

lemma Z1.map_trivial (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Z1.map f hf hG (1 : Z1 G U) = 1 := by
  apply Z1.ext
  intro g
  exact _root_.map_one f

lemma Z1.map_id : Z1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) = id := rfl

lemma Z1.map_comp (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    Z1.map (f'.comp f) (hf'.comp hf) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      Z1.map f' hf' hG' ∘ Z1.map f hf hG := rfl

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [IsTopologicalGroup U'] [ContinuousSMul G U']
  [IsTopologicalGroup U''] [ContinuousSMul G U'']

lemma Z1.map_smul (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : U) (c : Z1 G U) :
    Z1.map f hf hG (x • c) = f x • Z1.map f hf hG c := by
  apply Z1.ext
  intro g
  simp only [Z1.map_apply, Z1.smul_apply, _root_.map_mul, _root_.map_inv, hG]

def H1.map (f : U →* U') (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1 G U → H1 G U' :=
  Quotient.lift (fun c => H1.mk (Z1.map f hf hG c)) (by
    intro c d h
    obtain ⟨x,hx⟩ := MulAction.orbitRel_apply.mp h
    apply H1.mk_eq_mk_iff.mpr
    exact ⟨(f x)⁻¹, by rw [← hx, Z1.map_smul, inv_smul_smul]⟩)

theorem H1.map_mk (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) :
    H1.map f hf hG (H1.mk c) = H1.mk (Z1.map f hf hG c) := rfl

theorem H1.map_one (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H1.map f hf hG 1 = 1 := by
  change H1.mk (Z1.map f hf hG (1 : Z1 G U)) = H1.mk 1
  rw [Z1.map_trivial]

theorem H1.map_id : H1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) = id := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl

lemma H1.map_comp (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    H1.map (f'.comp f) (hf'.comp hf) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      H1.map f' hf' hG' ∘ H1.map f hf hG := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl

end CoefficientMaps
section InvariantCoefficientMaps
variable {G : Type u} [Group G]
  {U : Type v} [Group U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [MulDistribMulAction G U']
  {U'' : Type*} [Group U''] [MulDistribMulAction G U'']

def H0.map (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H0 G U →* H0 G U' where
  toFun x := ⟨f x, fun g => (hG g x).symm.trans (congrArg f (x.property g))⟩
  map_one' := Subtype.ext (_root_.map_one f)
  map_mul' x y := Subtype.ext (_root_.map_mul f x.val y.val)

lemma H0.map_apply (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : H0 G U) :
    (H0.map f hG x).val = f x := rfl

lemma H0.map_id : H0.map (MonoidHom.id U) (fun (_ : G) _ => rfl) = MonoidHom.id (H0 G U) := rfl

lemma H0.map_comp (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    H0.map (f'.comp f) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      (H0.map f' hG').comp (H0.map f hG) := rfl

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
example (c : Z1 G U) : Z1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) c = c := rfl
-- test: coefficientCocyclesTests.constant
example (c : Z1 G U) :
    Z1.map (1 : U →* U') continuous_const
      (fun g x => by simp only [MonoidHom.one_apply, smul_one]) c = 1 := by
  apply Z1.ext
  intro g
  rfl
-- test: coefficientCocyclesTests.value
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (g : G) :
    Z1.map f hf hG c g = f (c g) := rfl
-- test: coefficientClassesTests.identity
example (a : H1 G U) : H1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) a = a := by
  exact congrFun H1.map_id a
-- test: coefficientClassesTests.gauge
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (x : U) :
    H1.map f hf hG (H1.mk (x • c)) = H1.mk (Z1.map f hf hG c) := by
  rw [H1.mk_smul, H1.map_mk]
-- test: coefficientClassesTests.one
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H1.map f hf hG 1 = 1 := H1.map_one f hf hG
end CoefficientTests
section InvariantTests
variable {G : Type u} [Group G]
  {U : Type v} [Group U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [MulDistribMulAction G U']
-- test: invariantCoefficientsTests.identity
example (x : H0 G U) : H0.map (MonoidHom.id U) (fun (_ : G) _ => rfl) x = x := rfl
-- test: invariantCoefficientsTests.constant
example (x : H0 G U) :
    H0.map (1 : U →* U') (fun g x => by simp only [MonoidHom.one_apply, smul_one]) x = 1 := rfl
-- test: invariantCoefficientsTests.value
example (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : H0 G U) :
    (H0.map f hG x).val = f x := rfl
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
  intro G U c
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  constructor
  · intro h
    obtain ⟨x,hx⟩ := H1.mk_eq_one_iff _ |>.mp h
    have he := hx (Equiv.swap (0 : Fin 2) 1)
    change Equiv.swap (0 : Fin 3) 1 = x * x⁻¹ at he
    rw [mul_inv_cancel] at he
    exact (by decide : Equiv.swap (0 : Fin 3) 1 ≠ 1) he
  · change H1.mk (Z1.map _ _ _ c) = H1.mk 1
    rfl
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
  intro G U c
  rfl
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
  intro G U
  rfl
end TauCeti.NonabelianCohomology

#print axioms TauCeti.NonabelianCohomology.Z1.map
#print axioms TauCeti.NonabelianCohomology.Z1.map_apply
#print axioms TauCeti.NonabelianCohomology.Z1.map_smul
#print axioms TauCeti.NonabelianCohomology.Z1.map_trivial
#print axioms TauCeti.NonabelianCohomology.Z1.map_id
#print axioms TauCeti.NonabelianCohomology.Z1.map_comp
#print axioms TauCeti.NonabelianCohomology.H1.map
#print axioms TauCeti.NonabelianCohomology.H1.map_mk
#print axioms TauCeti.NonabelianCohomology.H1.map_one
#print axioms TauCeti.NonabelianCohomology.H1.map_id
#print axioms TauCeti.NonabelianCohomology.H1.map_comp
#print axioms TauCeti.NonabelianCohomology.H0.map
#print axioms TauCeti.NonabelianCohomology.H0.map_apply
#print axioms TauCeti.NonabelianCohomology.H0.map_id
#print axioms TauCeti.NonabelianCohomology.H0.map_comp

/- Continuous source restriction and coefficient compatibility. -/
namespace TauCeti.NonabelianCohomology
section SourceRestriction
variable {G : Type*} [Group G] [TopologicalSpace G]
  {H : Type*} [Group H] [TopologicalSpace H]
  {K : Type*} [Group K] [TopologicalSpace K]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U] [MulDistribMulAction H U] [MulDistribMulAction K U]

def Z1.res (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : Z1 G U → Z1 H U :=
  fun c => ⟨fun h => c (φ h), c.continuous.comp hφ, by
    intro h k
    change c (φ (h * k)) = c (φ h) * h • c (φ k)
    rw [_root_.map_mul, c.map_mul, hact]⟩

lemma Z1.res_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (h : H) :
    Z1.res φ hφ hact c h = c (φ h) := rfl

lemma Z1.res_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    Z1.res φ hφ hact (1 : Z1 G U) = 1 := rfl

lemma Z1.res_id : Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) =
    (id : Z1 G U → Z1 G U) := rfl

lemma Z1.res_comp (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hψ : Continuous ψ)
    (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    Z1.res (φ.comp ψ) (hφ.comp hψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      Z1.res ψ hψ hact' ∘ Z1.res φ hφ hact := rfl

lemma Z1.res_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) : Function.Injective (Z1.res φ hφ hact) := by
  intro c d hcd
  apply Z1.ext
  intro g
  obtain ⟨h,rfl⟩ := hsur g
  exact congrArg (fun z : Z1 H U => z h) hcd

lemma Z1.res_subgroup (N : Subgroup G) :
    Z1.res N.subtype continuous_subtype_val (fun _ _ => rfl) =
      (Z1.restrict N : Z1 G U → Z1 N U) := rfl

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
  [ContinuousSMul K U]

lemma Z1.res_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : U) (c : Z1 G U) :
    Z1.res φ hφ hact (x • c) = x • Z1.res φ hφ hact c := by
  apply Z1.ext
  intro h
  simp only [Z1.res_apply, Z1.smul_apply, hact]

def H1.res (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : H1 G U → H1 H U :=
  Quotient.lift (fun c => H1.mk (Z1.res φ hφ hact c)) (by
    intro c d h
    obtain ⟨x,hx⟩ := MulAction.mem_orbit_iff.mp (MulAction.orbitRel_apply.mp h)
    rw [← hx, Z1.res_smul, H1.mk_smul])

lemma H1.res_mk (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.res φ hφ hact (H1.mk c) = H1.mk (Z1.res φ hφ hact c) := rfl

lemma H1.res_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H1.res φ hφ hact (1 : H1 G U) = 1 := rfl

lemma H1.res_id : H1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) =
    (id : H1 G U → H1 G U) := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl

lemma H1.res_comp (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hψ : Continuous ψ)
    (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    H1.res (φ.comp ψ) (hφ.comp hψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      H1.res ψ hψ hact' ∘ H1.res φ hφ hact := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl

lemma H1.res_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) : Function.Injective (H1.res φ hφ hact) := by
  intro a b hab
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  obtain ⟨d,rfl⟩ := H1.mk_surjective b
  obtain ⟨x,hx⟩ := H1.mk_eq_mk_iff.mp hab
  apply H1.mk_eq_mk_iff.mpr
  refine ⟨x, Z1.res_injective φ hφ hact hsur ?_⟩
  rw [Z1.res_smul]
  exact hx

lemma H1.res_subgroup (N : Subgroup G) :
    H1.res N.subtype continuous_subtype_val (fun _ _ => rfl) =
      (H1.restrict N : H1 G U → H1 N U) := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl
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
      Z1.map f hf (fun h x => by rw [hU, heq, hV]) ∘ Z1.res φ hφ hU := rfl

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
  [IsTopologicalGroup V] [ContinuousSMul G V] [ContinuousSMul H V]

lemma H1.res_map (φ : H →* G) (hφ : Continuous φ)
    (hU : ∀ (h : H) (x : U), h • x = φ h • x)
    (hV : ∀ (h : H) (x : V), h • x = φ h • x)
    (f : U →* V) (hf : Continuous f)
    (heq : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.res φ hφ hV ∘ H1.map f hf heq =
      H1.map f hf (fun h x => by rw [hU, heq, hV]) ∘ H1.res φ hφ hU := by
  funext a
  obtain ⟨c,rfl⟩ := H1.mk_surjective a
  rfl
end SourceCoefficientCompatibility

section SourceInvariants
variable {G : Type*} [Group G] {H : Type*} [Group H] {K : Type*} [Group K]
  {U : Type*} [Group U]
  [MulDistribMulAction G U] [MulDistribMulAction H U] [MulDistribMulAction K U]

def H0.res (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : H0 G U →* H0 H U where
  toFun x := ⟨x.val, fun h => by rw [hact]; exact x.property (φ h)⟩
  map_one' := rfl
  map_mul' _ _ := rfl

lemma H0.res_apply (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : H0 G U) :
    (H0.res φ hact x : U) = x := rfl

lemma H0.res_id : H0.res (MonoidHom.id G) (fun _ _ => rfl) =
    MonoidHom.id (H0 G U) := rfl

lemma H0.res_comp (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    H0.res (φ.comp ψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      (H0.res ψ hact').comp (H0.res φ hact) := rfl

lemma H0.res_injective (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    Function.Injective (H0.res φ hact) := by
  intro x y h
  exact Subtype.ext (congrArg (fun z : H0 H U => (z : U)) h)

variable {V : Type*} [Group V] [MulDistribMulAction G V] [MulDistribMulAction H V]
lemma H0.res_map (φ : H →* G)
    (hU : ∀ (h : H) (x : U), h • x = φ h • x)
    (hV : ∀ (h : H) (x : V), h • x = φ h • x)
    (f : U →* V) (heq : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (H0.res φ hV).comp (H0.map f heq) =
      (H0.map f (fun h x => by rw [hU, heq, hV])).comp (H0.res φ hU) := rfl
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
    Z1.res φ hφ hact c h = c (φ h) := rfl
-- test: sourceCocyclesTests.identity
example (c : Z1 G U) : Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c = c := rfl
-- test: sourceCocyclesTests.constantSource
example (hact : ∀ (h : H) (x : U), h • x = (1 : H →* G) h • x) (c : Z1 G U) :
    Z1.res (1 : H →* G) continuous_const hact c = 1 := by
  apply Z1.ext
  intro h
  exact c.map_one
-- test: sourceCocyclesTests.subgroup
example (N : Subgroup G) (c : Z1 G U) :
    Z1.res N.subtype continuous_subtype_val (fun _ _ => rfl) c = Z1.restrict N c := rfl

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
-- test: sourceClassesTests.one
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H1.res φ hφ hact (1 : H1 G U) = 1 := rfl
-- test: sourceClassesTests.gauge
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : U) :
    H1.res φ hφ hact (H1.mk (x • c)) = H1.mk (Z1.res φ hφ hact c) := by
  rw [H1.mk_smul, H1.res_mk]
-- test: sourceClassesTests.subgroup
example (N : Subgroup G) (a : H1 G U) :
    H1.res N.subtype continuous_subtype_val (fun _ _ => rfl) a = H1.restrict N a :=
  congrFun (H1.res_subgroup N) a
-- test: sourceClassesTests.surjectiveReflection
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) (a : H1 G U) :
    H1.res φ hφ hact a = 1 ↔ a = 1 := by
  constructor
  · intro h
    apply H1.res_injective φ hφ hact hsur
    exact h
  · rintro rfl
    rfl
end SourceRestrictionTests
section SourceInvariantTests
variable {G : Type*} [Group G] {H : Type*} [Group H]
  {U : Type*} [Group U] [MulDistribMulAction G U] [MulDistribMulAction H U]
-- test: sourceInvariantsTests.one
example (φ : H →* G) (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H0.res φ hact (1 : H0 G U) = 1 := rfl
-- test: sourceInvariantsTests.identity
example (x : H0 G U) : H0.res (MonoidHom.id G) (fun _ _ => rfl) x = x := rfl
-- test: sourceInvariantsTests.value
example (φ : H →* G) (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : H0 G U) :
    (H0.res φ hact x : U) = x := rfl
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
  intro G U c
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  constructor
  · intro h
    obtain ⟨x,hx⟩ := H1.mk_eq_one_iff _ |>.mp h
    have he := hx (Equiv.swap (0 : Fin 2) 1)
    change Equiv.swap (0 : Fin 3) 1 = x * x⁻¹ at he
    rw [mul_inv_cancel] at he
    exact (by decide : Equiv.swap (0 : Fin 3) 1 ≠ 1) he
  · change H1.mk (Z1.res _ _ _ c) = H1.mk 1
    rfl
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
  rfl
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Z1.res
#print axioms TauCeti.NonabelianCohomology.Z1.res_apply
#print axioms TauCeti.NonabelianCohomology.Z1.res_one
#print axioms TauCeti.NonabelianCohomology.Z1.res_id
#print axioms TauCeti.NonabelianCohomology.Z1.res_comp
#print axioms TauCeti.NonabelianCohomology.Z1.res_injective
#print axioms TauCeti.NonabelianCohomology.Z1.res_subgroup
#print axioms TauCeti.NonabelianCohomology.Z1.res_smul
#print axioms TauCeti.NonabelianCohomology.H1.res
#print axioms TauCeti.NonabelianCohomology.H1.res_mk
#print axioms TauCeti.NonabelianCohomology.H1.res_one
#print axioms TauCeti.NonabelianCohomology.H1.res_id
#print axioms TauCeti.NonabelianCohomology.H1.res_comp
#print axioms TauCeti.NonabelianCohomology.H1.res_injective
#print axioms TauCeti.NonabelianCohomology.H1.res_subgroup
#print axioms TauCeti.NonabelianCohomology.Z1.res_map
#print axioms TauCeti.NonabelianCohomology.H1.res_map
#print axioms TauCeti.NonabelianCohomology.H0.res
#print axioms TauCeti.NonabelianCohomology.H0.res_apply
#print axioms TauCeti.NonabelianCohomology.H0.res_id
#print axioms TauCeti.NonabelianCohomology.H0.res_comp
#print axioms TauCeti.NonabelianCohomology.H0.res_injective
#print axioms TauCeti.NonabelianCohomology.H0.res_map

namespace TauCeti.NonabelianCohomology
section TwistingProof
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

def Twist (_c : Z1 G U) : Type _ := U
instance (c : Z1 G U) : Group (Twist c) := inferInstanceAs (Group U)
instance (c : Z1 G U) : TopologicalSpace (Twist c) := inferInstanceAs (TopologicalSpace U)
instance (c : Z1 G U) : IsTopologicalGroup (Twist c) := inferInstanceAs (IsTopologicalGroup U)

/-- The actual underlying group identification of the twist synonym. -/
def Twist.toOriginal (c : Z1 G U) : Twist c ≃* U := MulEquiv.refl U

instance (c : Z1 G U) : MulDistribMulAction G (Twist c) where
  smul g x := c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹
  one_smul x := by
    apply (Twist.toOriginal c).injective
    change c 1 * ((1 : G) • (Twist.toOriginal c x)) * (c 1)⁻¹ = Twist.toOriginal c x
    simp [c.map_one]
  mul_smul g h x := by
    change c (g*h) * ((g*h) • (Twist.toOriginal c x)) * (c (g*h))⁻¹ =
      c g * (g • (c h * (h • (Twist.toOriginal c x)) * (c h)⁻¹)) * (c g)⁻¹
    with_unfolding_all rw [c.map_mul, mul_smul, smul_mul', smul_mul', smul_inv']

    with_unfolding_all group
  smul_one g := by change c g * (g • (1 : U)) * (c g)⁻¹ = 1; simp
  smul_mul g x y := by
    change c g * (g • ((Twist.toOriginal c x) * (Twist.toOriginal c y))) * (c g)⁻¹ =
      (c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹) *
        (c g * (g • (Twist.toOriginal c y)) * (c g)⁻¹)
    with_unfolding_all rw [smul_mul']

    with_unfolding_all group

instance (c : Z1 G U) : ContinuousSMul G (Twist c) where
  continuous_smul :=
    ((c.continuous.comp continuous_fst).mul
      (continuous_fst.smul continuous_snd)).mul (c.continuous.comp continuous_fst).inv

theorem Twist.smul_def (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (show Twist c from c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹) := rfl

def Z1.twistEquiv (c : Z1 G U) : Z1 G (Twist c) ≃ Z1 G U where
  toFun d := ⟨fun g => (Twist.toOriginal c (d g)) * c g, d.continuous.mul c.continuous, by
    intro g h
    have hd := d.map_mul g h
    change (Twist.toOriginal c (d (g*h))) = (Twist.toOriginal c (d g)) *
      (c g * (g • (Twist.toOriginal c (d h))) * (c g)⁻¹) at hd
    change (Twist.toOriginal c (d (g*h))) * c (g*h) =
      ((Twist.toOriginal c (d g)) * c g) * (g • ((Twist.toOriginal c (d h)) * c h))
    with_unfolding_all rw [hd, c.map_mul, smul_mul']

    with_unfolding_all group⟩
  invFun d := ⟨fun g => d g * (c g)⁻¹, d.continuous.mul c.continuous.inv, by
    intro g h
    change d (g*h) * (c (g*h))⁻¹ =
      (d g * (c g)⁻¹) * (c g * (g • (d h * (c h)⁻¹)) * (c g)⁻¹)
    with_unfolding_all rw [d.map_mul, c.map_mul, smul_mul', smul_inv']

    with_unfolding_all group⟩
  left_inv d := by
    apply Z1.ext
    intro g
    apply (Twist.toOriginal c).injective
    change ((Twist.toOriginal c (d g)) * c g) * (c g)⁻¹ = Twist.toOriginal c (d g)
    simp [mul_assoc]
  right_inv d := by apply Z1.ext; intro g; change (d g * (c g)⁻¹) * c g = d g; with_unfolding_all group

lemma Z1.twistEquiv_apply (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    Z1.twistEquiv c d g = (Twist.toOriginal c (d g)) * c g := rfl

lemma Z1.twistEquiv_symm_apply (c : Z1 G U) (d : Z1 G U) (g : G) :
    (Z1.twistEquiv c).symm d g = (show Twist c from d g * (c g)⁻¹) := rfl

lemma Z1.twistEquiv_smul (c : Z1 G U) (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistEquiv c (x • d) = (Twist.toOriginal c x) • Z1.twistEquiv c d := by
  apply Z1.ext
  intro g
  change ((Twist.toOriginal c x) * (Twist.toOriginal c (d g)) *
    (c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹)⁻¹) * c g =
      (Twist.toOriginal c x) * ((Twist.toOriginal c (d g)) * c g) * (g • (Twist.toOriginal c x))⁻¹

  with_unfolding_all group

def H1.twistEquiv (c : Z1 G U) : H1 G (Twist c) ≃ H1 G U :=
  Quotient.congr (Z1.twistEquiv c) (by
    intro a b
    with_unfolding_all rw [MulAction.orbitRel_apply, MulAction.orbitRel_apply]
    constructor
    · rintro ⟨x,hx⟩
      exact ⟨(Twist.toOriginal c x), by rw [← hx, Z1.twistEquiv_smul]⟩
    · rintro ⟨x,hx⟩
      refine ⟨(show Twist c from x), ?_⟩
      apply (Z1.twistEquiv c).injective
      with_unfolding_all rw [Z1.twistEquiv_smul]
      exact hx)

lemma H1.twistEquiv_mk (c : Z1 G U) (d : Z1 G (Twist c)) :
    H1.twistEquiv c (H1.mk d) = H1.mk (Z1.twistEquiv c d) := rfl

theorem H1.twistEquiv_one (c : Z1 G U) : H1.twistEquiv c 1 = H1.mk c := by
  change H1.mk (Z1.twistEquiv c 1) = H1.mk c
  congr 1
  apply Z1.ext
  intro g
  exact one_mul (c g)

lemma H1.twistEquiv_eq_class_iff (c : Z1 G U) (a : H1 G (Twist c)) :
    H1.twistEquiv c a = H1.mk c ↔ a = 1 := by
  with_unfolding_all rw [← H1.twistEquiv_one c]
  exact (H1.twistEquiv c).injective.eq_iff

lemma Twist.mem_fixed_iff (c : Z1 G U) (x : Twist c) :
    x ∈ H0 G (Twist c) ↔ ∀ g : G, c g * (g • (Twist.toOriginal c x)) = (Twist.toOriginal c x) * c g := by
  change (∀ g : G, g • x = x) ↔ _
  constructor
  · intro h g
    have hg := congrArg (Twist.toOriginal c) (h g)
    change c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹ = Twist.toOriginal c x at hg
    calc c g * (g • (Twist.toOriginal c x)) =
      (c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹) * c g := by group
      _ = (Twist.toOriginal c x) * c g := by rw [hg]
  · intro h g
    apply (Twist.toOriginal c).injective
    change c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹ = Twist.toOriginal c x
    rw [h g]
    group

-- test: TauCeti.NonabelianCohomology.tests.twist_unit_value
example (c : Z1 G U) (g : G) : Z1.twistEquiv c 1 g = c g := one_mul _

-- test: TauCeti.NonabelianCohomology.tests.twist_untwist
example (c d : Z1 G U) : Z1.twistEquiv c ((Z1.twistEquiv c).symm d) = d :=
  (Z1.twistEquiv c).apply_symm_apply d

-- test: TauCeti.NonabelianCohomology.tests.twist_neutral_fibre
example (c : Z1 G U) : (H1.twistEquiv c).symm (H1.mk c) = 1 := by
  apply (H1.twistEquiv c).injective
  simp [H1.twistEquiv_one]

-- test: TauCeti.NonabelianCohomology.tests.twist_commutative_action
example (hcomm : ∀ x y : U, x * y = y * x) (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (show Twist c from g • (Twist.toOriginal c x)) := by
  with_unfolding_all rw [Twist.smul_def]
  change c g * (g • (Twist.toOriginal c x)) * (c g)⁻¹ = _
  with_unfolding_all rw [hcomm (c g), mul_assoc, mul_inv_cancel, mul_one]

-- test: TauCeti.NonabelianCohomology.tests.twist_translation_order
example (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    (Z1.twistEquiv c).symm (Z1.twistEquiv c d) g = d g := by
  exact congrArg (fun a : Z1 G (Twist c) => a g) ((Z1.twistEquiv c).symm_apply_apply d)

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
      x = 1 ∨ x = Equiv.swap 0 1 := by
  intro G U c
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  intro x
  rw [Twist.mem_fixed_iff]
  change (∀ g : G, c g * x = x * c g) ↔ x = 1 ∨ x = Equiv.swap 0 1
  revert x
  decide

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
    H1.twistEquiv c 1 ≠ 1 := by
  intro G U c
  let : TopologicalSpace G := ⊥
  let : TopologicalSpace U := ⊥
  let : DiscreteTopology G := ⟨rfl⟩
  let : DiscreteTopology U := ⟨rfl⟩
  let : IsTopologicalGroup U := inferInstance
  let : MulDistribMulAction G U := {
    smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
  let : ContinuousSMul G U := ⟨continuous_snd⟩
  rw [H1.twistEquiv_one]
  intro h
  obtain ⟨x,hx⟩ := H1.mk_eq_one_iff _ |>.mp h
  have he := hx (Equiv.swap (0 : Fin 2) 1)
  change Equiv.swap (0 : Fin 3) 1 = x * x⁻¹ at he
  rw [mul_inv_cancel] at he
  exact (by decide : Equiv.swap (0 : Fin 3) 1 ≠ 1) he

-- test: TauCeti.NonabelianCohomology.tests.twist_class_representative
example (c : Z1 G U) (d : Z1 G (Twist c)) :
    H1.twistEquiv c (H1.mk d) = H1.mk (Z1.twistEquiv c d) := rfl

end TwistingProof
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Twist
#print axioms TauCeti.NonabelianCohomology.Twist.smul_def
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_apply
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_symm_apply
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_smul
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_mk
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_one
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_eq_class_iff
#print axioms TauCeti.NonabelianCohomology.Twist.mem_fixed_iff

#print axioms TauCeti.NonabelianCohomology.Twist.toOriginal

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
    Twist c →* Twist (Z1.map f hf hG c) := f

lemma Twist.map_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c) (Twist.map c f hf hG x) =
      f (Twist.toOriginal c x) := rfl

lemma Twist.map_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.map c f hf hG) := hf

lemma Twist.map_smul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (g : G) (x : Twist c) :
    Twist.map c f hf hG (g • x) = g • Twist.map c f hf hG x := by
  apply (Twist.toOriginal (Z1.map f hf hG c)).injective
  change f (c g * (g • Twist.toOriginal c x) * (c g)⁻¹) =
    f (c g) * (g • f (Twist.toOriginal c x)) * (f (c g))⁻¹
  rw [_root_.map_mul, _root_.map_mul, _root_.map_inv, hG]

lemma Twist.map_id (c : Z1 G U) :
    Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) =
      MonoidHom.id (Twist c) := rfl

lemma Twist.map_comp (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : V →* W) (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : V), f' (g • x) = g • f' x) :
    Twist.map c (f'.comp f) (hf'.comp hf)
      (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
        (Twist.map (Z1.map f hf hG c) f' hf' hG').comp (Twist.map c f hf hG) := rfl

lemma Z1.twistEquiv_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.map f hf hG c)
      (Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) d) =
          Z1.map f hf hG (Z1.twistEquiv c d) := by
  apply Z1.ext
  intro g
  simp only [Z1.twistEquiv_apply, Z1.map_apply, Twist.map_apply, _root_.map_mul]

lemma Z1.twistEquiv_symm_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (e : Z1 G U) :
    (Z1.twistEquiv (Z1.map f hf hG c)).symm (Z1.map f hf hG e) =
      Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) ((Z1.twistEquiv c).symm e) := by
  apply (Z1.twistEquiv (Z1.map f hf hG c)).injective
  rw [Equiv.apply_symm_apply, Z1.twistEquiv_map, Equiv.apply_symm_apply]

lemma H1.twistEquiv_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.map f hf hG c)
      (H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a) =
          H1.map f hf hG (H1.twistEquiv c a) := by
  obtain ⟨d,rfl⟩ := H1.mk_surjective a
  rw [H1.map_mk, H1.twistEquiv_mk, H1.twistEquiv_mk, H1.map_mk, Z1.twistEquiv_map]

lemma H1.twistEquiv_symm_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G U) :
    (H1.twistEquiv (Z1.map f hf hG c)).symm (H1.map f hf hG a) =
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) ((H1.twistEquiv c).symm a) := by
  apply (H1.twistEquiv (Z1.map f hf hG c)).injective
  rw [Equiv.apply_symm_apply, H1.twistEquiv_map, Equiv.apply_symm_apply]

lemma H1.twistEquiv_map_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.map f hf hG (H1.twistEquiv c 1) = H1.mk (Z1.map f hf hG c) := by
  rw [H1.twistEquiv_one, H1.map_mk]

lemma H1.twistEquiv_map_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G (Twist c)) :
    H1.map f hf hG (H1.twistEquiv c a) = H1.mk (Z1.map f hf hG c) ↔
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a = 1 := by
  rw [← H1.twistEquiv_map, H1.twistEquiv_eq_class_iff]

-- test: twistCoefficientTests.value
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c) (Twist.map c f hf hG x) =
      f (Twist.toOriginal c x) := by
  exact Twist.map_apply c f hf hG x

-- test: twistCoefficientTests.identity
example (c : Z1 G U) (x : Twist c) :
    Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) x = x := rfl

-- test: twistCoefficientTests.constant
example (c : Z1 G U) (x : Twist c) :
    Twist.map c (1 : U →* V) continuous_const (fun (_ : G) _ => (smul_one _).symm) x = 1 := rfl

-- test: twistCoefficientTests.cocycle_square
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    Z1.map f hf hG (Z1.twistEquiv c d) =
      Z1.twistEquiv (Z1.map f hf hG c)
        (Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
          (Twist.map_smul c f hf hG) d) := by
  exact (Z1.twistEquiv_map c f hf hG d).symm

-- test: twistCoefficientTests.repointed_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.map f hf hG (H1.twistEquiv c 1) = H1.mk (Z1.map f hf hG c) := by
  exact H1.twistEquiv_map_one c f hf hG

end CoefficientTwisting
end TauCeti.NonabelianCohomology

#print axioms TauCeti.NonabelianCohomology.Twist.map
#print axioms TauCeti.NonabelianCohomology.Twist.map_apply
#print axioms TauCeti.NonabelianCohomology.Twist.map_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.map_smul
#print axioms TauCeti.NonabelianCohomology.Twist.map_id
#print axioms TauCeti.NonabelianCohomology.Twist.map_comp
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_map
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_symm_map
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_map
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_symm_map
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_map_one
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_map_fibre
namespace TauCeti.NonabelianCohomology
section GaugeTransport
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

def Twist.gaugeEquiv (c : Z1 G U) (b : U) : Twist c ≃* Twist (b • c) :=
  MulAut.conj b

lemma Twist.gaugeEquiv_apply (c : Z1 G U) (b : U) (x : Twist c) :
    Twist.toOriginal (b • c) (Twist.gaugeEquiv c b x) =
      b * Twist.toOriginal c x * b⁻¹ := rfl

lemma Twist.gaugeEquiv_symm_apply (c : Z1 G U) (b : U) (y : Twist (b • c)) :
    Twist.toOriginal c ((Twist.gaugeEquiv c b).symm y) =
      b⁻¹ * Twist.toOriginal (b • c) y * b := rfl

lemma Twist.gaugeEquiv_continuous (c : Z1 G U) (b : U) :
    Continuous (Twist.gaugeEquiv c b).toMonoidHom :=
  (continuous_const.mul continuous_id).mul continuous_const

lemma Twist.gaugeEquiv_symm_continuous (c : Z1 G U) (b : U) :
    Continuous (Twist.gaugeEquiv c b).symm := by
  change Continuous (fun x : U => b⁻¹ * x * b)
  exact (continuous_const.mul continuous_id).mul continuous_const

lemma Twist.gaugeEquiv_smul (c : Z1 G U) (b : U) (g : G) (x : Twist c) :
    Twist.gaugeEquiv c b (g • x) = g • Twist.gaugeEquiv c b x := by
  change b * (c g * (g • Twist.toOriginal c x) * (c g)⁻¹) * b⁻¹ =
    (b * c g * (g • b)⁻¹) * (g • (b * Twist.toOriginal c x * b⁻¹)) *
      (b * c g * (g • b)⁻¹)⁻¹
  rw [smul_mul', smul_mul', smul_inv']
  group

lemma Twist.gaugeEquiv_one (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (1 • c) (Twist.gaugeEquiv c 1 x) = Twist.toOriginal c x := by
  simp [Twist.gaugeEquiv_apply]

lemma Twist.gaugeEquiv_comp (c : Z1 G U) (b a : U) (x : Twist c) :
    Twist.toOriginal (a • (b • c))
      (Twist.gaugeEquiv (b • c) a (Twist.gaugeEquiv c b x)) =
        Twist.toOriginal ((a * b) • c) (Twist.gaugeEquiv c (a * b) x) := by
  simp only [Twist.gaugeEquiv_apply]
  group

lemma Z1.twistEquiv_gaugeMap (c : Z1 G U) (b : U) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (b • c)
      (Z1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) d) = b • Z1.twistEquiv c d := by
  apply Z1.ext
  intro g
  change (b * Twist.toOriginal c (d g) * b⁻¹) * (b * c g * (g • b)⁻¹) =
    b * (Twist.toOriginal c (d g) * c g) * (g • b)⁻¹
  group

lemma H1.twistEquiv_gaugeMap (c : Z1 G U) (b : U) (a : H1 G (Twist c)) :
    H1.twistEquiv (b • c)
      (H1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) a) = H1.twistEquiv c a := by
  obtain ⟨d,rfl⟩ := H1.mk_surjective a
  change H1.mk (Z1.twistEquiv (b • c)
    (Z1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
      (Twist.gaugeEquiv_smul c b) d)) = H1.mk (Z1.twistEquiv c d)
  rw [Z1.twistEquiv_gaugeMap, H1.mk_smul]

def H1.changeRepresentative (c d : Z1 G U) (_h : H1.mk c = H1.mk d) :
    H1 G (Twist c) ≃ H1 G (Twist d) :=
  (H1.twistEquiv c).trans (H1.twistEquiv d).symm

lemma H1.changeRepresentative_apply (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (a : H1 G (Twist c)) :
    H1.changeRepresentative c d h a =
      (H1.twistEquiv d).symm (H1.twistEquiv c a) := rfl

lemma H1.changeRepresentative_one (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    H1.changeRepresentative c d h 1 = 1 := by
  apply (H1.twistEquiv d).injective
  rw [H1.changeRepresentative_apply, Equiv.apply_symm_apply,
    H1.twistEquiv_one, H1.twistEquiv_one, h]

lemma H1.changeRepresentative_gauge (c : Z1 G U) (b : U) :
    H1.changeRepresentative c (b • c) (H1.mk_smul b c).symm =
      H1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) := by
  funext a
  apply (H1.twistEquiv (b • c)).injective
  rw [H1.changeRepresentative_apply, Equiv.apply_symm_apply, H1.twistEquiv_gaugeMap]

lemma H1.changeRepresentative_id (c : Z1 G U) :
    H1.changeRepresentative c c rfl = Equiv.refl (H1 G (Twist c)) := by
  ext a
  exact (H1.twistEquiv c).symm_apply_apply a

lemma H1.changeRepresentative_comp (c d e : Z1 G U)
    (hcd : H1.mk c = H1.mk d) (hde : H1.mk d = H1.mk e) :
    (H1.changeRepresentative c d hcd).trans (H1.changeRepresentative d e hde) =
      H1.changeRepresentative c e (hcd.trans hde) := by
  ext a
  change (H1.twistEquiv e).symm
    (H1.twistEquiv d ((H1.twistEquiv d).symm (H1.twistEquiv c a))) =
      (H1.twistEquiv e).symm (H1.twistEquiv c a)
  rw [Equiv.apply_symm_apply]

lemma H1.changeRepresentative_symm (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    (H1.changeRepresentative c d h).symm = H1.changeRepresentative d c h.symm := rfl

lemma H1.changeRepresentative_twistEquiv (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (a : H1 G (Twist c)) :
    H1.twistEquiv d (H1.changeRepresentative c d h a) = H1.twistEquiv c a := by
  exact (H1.twistEquiv d).apply_symm_apply _

lemma H1.changeRepresentative_eq_map (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (f : Twist c →* Twist d) (hf : Continuous f)
    (hG : ∀ (g : G) (x : Twist c), f (g • x) = g • f x)
    (he : ∀ a, H1.twistEquiv d (H1.map f hf hG a) = H1.twistEquiv c a) :
    H1.changeRepresentative c d h = H1.map f hf hG := by
  funext a
  apply (H1.twistEquiv d).injective
  rw [H1.changeRepresentative_twistEquiv, he]

-- test: Twist.gaugeEquiv.test_inverse
theorem GaugeTransportTests.inverse (c : Z1 G U) (b : U) (x : Twist c) :
    (Twist.gaugeEquiv c b).symm (Twist.gaugeEquiv c b x) = x := by
  exact (Twist.gaugeEquiv c b).symm_apply_apply x

-- test: Twist.gaugeEquiv.test_identity
theorem GaugeTransportTests.identity (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (1 • c) (Twist.gaugeEquiv c 1 x) = Twist.toOriginal c x := by
  exact Twist.gaugeEquiv_one c x

-- test: Twist.gaugeEquiv.test_noncommutative_direction
theorem GaugeTransportTests.noncommutative_direction :
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
      b⁻¹ * Equiv.swap 0 1 * b ≠ Equiv.swap 1 2 := by
  decide

-- test: H1.changeRepresentative.test_neutral
theorem GaugeTransportTests.neutral (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    H1.changeRepresentative c d h 1 = 1 := by
  exact H1.changeRepresentative_one c d h

-- test: H1.changeRepresentative.test_nonneutral
theorem GaugeTransportTests.nonneutral (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (hc : H1.mk c ≠ 1) :
    H1.changeRepresentative c d h ((H1.twistEquiv c).symm 1) ≠ 1 ∧
      H1.twistEquiv d (H1.changeRepresentative c d h ((H1.twistEquiv c).symm 1)) = 1 := by
  have he : H1.twistEquiv d
      (H1.changeRepresentative c d h ((H1.twistEquiv c).symm 1)) = 1 := by
    rw [H1.changeRepresentative_twistEquiv, Equiv.apply_symm_apply]
  refine ⟨?_,he⟩
  intro ha
  rw [ha, H1.twistEquiv_one, ← h] at he
  exact hc he

-- test: H1.changeRepresentative.test_class_hypothesis
theorem GaugeTransportTests.class_hypothesis (c : Z1 G U) (hc : H1.mk c ≠ 1) :
    (H1.twistEquiv (1 : Z1 G U)).symm (H1.twistEquiv c 1) ≠ 1 := by
  intro h
  have he := congrArg (H1.twistEquiv (1 : Z1 G U)) h
  rw [Equiv.apply_symm_apply, H1.twistEquiv_one, H1.twistEquiv_one] at he
  exact hc he

end GaugeTransport
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_apply
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_symm_apply
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_symm_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_smul
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_one
#print axioms TauCeti.NonabelianCohomology.Twist.gaugeEquiv_comp
#print axioms TauCeti.NonabelianCohomology.Z1.twistEquiv_gaugeMap
#print axioms TauCeti.NonabelianCohomology.H1.twistEquiv_gaugeMap
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_apply
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_one
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_gauge
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_id
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_comp
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_symm
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_twistEquiv
#print axioms TauCeti.NonabelianCohomology.H1.changeRepresentative_eq_map
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.inverse
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.identity
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.noncommutative_direction
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.neutral
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.nonneutral
#print axioms TauCeti.NonabelianCohomology.GaugeTransportTests.class_hypothesis

namespace TauCeti.NonabelianCohomology
section TwistedSourceRestriction
variable {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  [MulDistribMulAction H U] [ContinuousSMul H U]

def Twist.sourceEquiv (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Twist c ≃* Twist (Z1.res φ hφ hact c) :=
  (Twist.toOriginal c).trans (Twist.toOriginal (Z1.res φ hφ hact c)).symm

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact c) (Twist.sourceEquiv φ hφ hact c x) =
      Twist.toOriginal c x := rfl

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_symm_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist (Z1.res φ hφ hact c)) :
    Twist.toOriginal c ((Twist.sourceEquiv φ hφ hact c).symm x) =
      Twist.toOriginal (Z1.res φ hφ hact c) x := rfl

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_continuous (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Continuous (Twist.sourceEquiv φ hφ hact c) := continuous_id

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_symm_continuous (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Continuous (Twist.sourceEquiv φ hφ hact c).symm := continuous_id

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (h : H) (x : Twist c) :
    Twist.sourceEquiv φ hφ hact c (φ h • x) = h • Twist.sourceEquiv φ hφ hact c x := by
  apply (Twist.toOriginal (Z1.res φ hφ hact c)).injective
  change c (φ h) * (φ h • (Twist.toOriginal c x)) * (c (φ h))⁻¹ =
    c (φ h) * (h • (Twist.toOriginal c x)) * (c (φ h))⁻¹
  rw [hact]

def Z1.twistRes (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Z1 G (Twist c) → Z1 H (Twist (Z1.res φ hφ hact c)) := fun d =>
  ⟨fun h => Twist.sourceEquiv φ hφ hact c (d (φ h)),
    (Twist.sourceEquiv_continuous φ hφ hact c).comp (d.continuous.comp hφ), by
      intro h k
      exact (congrArg (fun g => Twist.sourceEquiv φ hφ hact c (d g))
        (φ.map_mul h k)).trans
        ((congrArg (Twist.sourceEquiv φ hφ hact c) (d.map_mul (φ h) (φ k))).trans
          (((Twist.sourceEquiv φ hφ hact c).map_mul (d (φ h)) (φ h • d (φ k))).trans
            (congrArg (fun y => Twist.sourceEquiv φ hφ hact c (d (φ h)) * y)
              (Twist.sourceEquiv_smul φ hφ hact c h (d (φ k))))))⟩

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Z1.twistRes_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) (h : H) :
    Z1.twistRes φ hφ hact c d h = Twist.sourceEquiv φ hφ hact c (d (φ h)) := rfl

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Z1.twistRes_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Z1.twistRes φ hφ hact c 1 = 1 := by
  apply Z1.ext
  intro h
  exact (Twist.sourceEquiv φ hφ hact c).map_one

lemma Z1.twistRes_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistRes φ hφ hact c (x • d) =
      Twist.sourceEquiv φ hφ hact c x • Z1.twistRes φ hφ hact c d := by
  apply Z1.ext
  intro h
  simp only [Z1.twistRes_apply, Z1.smul_apply, _root_.map_mul, _root_.map_inv,
    Twist.sourceEquiv_smul]

lemma Z1.twistRes_translation (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.res φ hφ hact c) (Z1.twistRes φ hφ hact c d) =
      Z1.res φ hφ hact (Z1.twistEquiv c d) := by
  apply Z1.ext
  intro h
  rw [Z1.twistEquiv_apply, Z1.twistRes_apply, Twist.sourceEquiv_apply,
    Z1.res_apply, Z1.res_apply, Z1.twistEquiv_apply]

def H1.twistRes (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1 G (Twist c) → H1 H (Twist (Z1.res φ hφ hact c)) :=
  Quotient.lift (fun d => H1.mk (Z1.twistRes φ hφ hact c d)) (by
    intro a b hab
    obtain ⟨x,hx⟩ := MulAction.mem_orbit_iff.mp (MulAction.orbitRel_apply.mp hab)
    rw [← hx, Z1.twistRes_smul, H1.mk_smul])

lemma H1.twistRes_mk (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) :
    H1.twistRes φ hφ hact c (H1.mk d) = H1.mk (Z1.twistRes φ hφ hact c d) := rfl

lemma H1.twistRes_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.twistRes φ hφ hact c 1 = 1 := by
  change H1.mk (Z1.twistRes φ hφ hact c 1) = H1.mk 1
  rw [Z1.twistRes_one]

lemma H1.twistRes_translation (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.res φ hφ hact c) (H1.twistRes φ hφ hact c a) =
      H1.res φ hφ hact (H1.twistEquiv c a) := by
  obtain ⟨d,rfl⟩ := H1.mk_surjective a
  rw [H1.twistRes_mk, H1.twistEquiv_mk, H1.twistEquiv_mk, H1.res_mk,
    Z1.twistRes_translation]


lemma Twist.sourceEquiv_gauge (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (b : U) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact (b • c))
      (Twist.sourceEquiv φ hφ hact (b • c) (Twist.gaugeEquiv c b x)) =
    Twist.toOriginal (b • Z1.res φ hφ hact c)
      (Twist.gaugeEquiv (Z1.res φ hφ hact c) b (Twist.sourceEquiv φ hφ hact c x)) := rfl

lemma Z1.twistRes_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) : Function.Injective (Z1.twistRes φ hφ hact c) := by
  intro d e hde
  apply (Z1.twistEquiv c).injective
  apply Z1.res_injective φ hφ hact hsur
  rw [← Z1.twistRes_translation, ← Z1.twistRes_translation, hde]

lemma H1.twistRes_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) : Function.Injective (H1.twistRes φ hφ hact c) := by
  intro a b hab
  apply (H1.twistEquiv c).injective
  apply H1.res_injective φ hφ hact hsur
  rw [← H1.twistRes_translation, ← H1.twistRes_translation, hab]

lemma H1.twistRes_representative (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c d : Z1 G U)
    (hcd : H1.mk c = H1.mk d) (a : H1 G (Twist c)) :
    H1.twistRes φ hφ hact d (H1.changeRepresentative c d hcd a) =
      H1.changeRepresentative (Z1.res φ hφ hact c) (Z1.res φ hφ hact d)
        (by rw [← H1.res_mk, ← H1.res_mk, hcd]) (H1.twistRes φ hφ hact c a) := by
  apply (H1.twistEquiv (Z1.res φ hφ hact d)).injective
  rw [H1.twistRes_translation, H1.changeRepresentative_twistEquiv,
    H1.changeRepresentative_twistEquiv, H1.twistRes_translation]

lemma H1.twistRes_identity_translation (c : Z1 G U) (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (H1.twistRes (MonoidHom.id G) continuous_id (fun _ _ => rfl) c a) =
        H1.twistEquiv c a := by
  rw [H1.twistRes_translation, H1.res_id]
  rfl

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
  rw [H1.twistRes_translation, H1.twistRes_translation, H1.res_comp]
  rfl

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
theorem TwistedSourceTests.inverse (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : Twist c) :
    (Twist.sourceEquiv φ hφ hact c).symm (Twist.sourceEquiv φ hφ hact c x) = x := by
  exact (Twist.sourceEquiv φ hφ hact c).symm_apply_apply x

-- test: Twist.sourceEquiv.test_semilinear
omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
theorem TwistedSourceTests.semilinear (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (h : H) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact c) (h • Twist.sourceEquiv φ hφ hact c x) =
      c (φ h) * (φ h • Twist.toOriginal c x) * (c (φ h))⁻¹ := by
  change c (φ h) * (h • Twist.toOriginal c x) * (c (φ h))⁻¹ = _
  rw [hact]

-- test: Twist.sourceEquiv.test_noncommutative_action
theorem TwistedSourceTests.noncommutative_action :
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
  decide

-- test: Z1.twistRes.test_identity
omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
theorem TwistedSourceTests.cocycle_identity (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    Twist.toOriginal (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (Z1.twistRes (MonoidHom.id G) continuous_id (fun _ _ => rfl) c d g) =
        Twist.toOriginal c (d g) := rfl

-- test: Z1.twistRes.test_gauge_translation
theorem TwistedSourceTests.cocycle_gauge (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.res φ hφ hact c) (Z1.twistRes φ hφ hact c (x • d)) =
      Twist.toOriginal c x • Z1.res φ hφ hact (Z1.twistEquiv c d) := by
  rw [Z1.twistRes_translation, Z1.twistEquiv_smul, Z1.res_smul]

-- test: Z1.twistRes.test_surjective_detection
theorem TwistedSourceTests.cocycle_detection (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) (d : Z1 G (Twist c)) :
    Z1.twistRes φ hφ hact c d = 1 ↔ d = 1 := by
  constructor
  · intro h
    exact Z1.twistRes_injective φ hφ hact c hsur (h.trans (Z1.twistRes_one φ hφ hact c).symm)
  · rintro rfl
    exact Z1.twistRes_one φ hφ hact c

-- test: H1.twistRes.test_neutral
theorem TwistedSourceTests.neutral (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.twistEquiv (Z1.res φ hφ hact c) (H1.twistRes φ hφ hact c 1) =
      H1.mk (Z1.res φ hφ hact c) := by
  rw [H1.twistRes_one, H1.twistEquiv_one]

-- test: H1.twistRes.test_gauge_classes
theorem TwistedSourceTests.gauge_classes (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    H1.twistRes φ hφ hact c (H1.mk (x • d)) = H1.twistRes φ hφ hact c (H1.mk d) := by
  rw [H1.mk_smul]

-- test: H1.twistRes.test_surjective_reflection
theorem TwistedSourceTests.class_detection (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) (a : H1 G (Twist c)) :
    H1.twistRes φ hφ hact c a = 1 ↔ a = 1 := by
  constructor
  · intro h
    exact H1.twistRes_injective φ hφ hact c hsur (h.trans (H1.twistRes_one φ hφ hact c).symm)
  · rintro rfl
    exact H1.twistRes_one φ hφ hact c

-- test: H1.twistRes.test_nonsurjective_loss
theorem TwistedSourceTests.nonsurjective_loss (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (hzero : ∀ h, φ h = 1)
    (c : Z1 G U) (hc : H1.mk c ≠ 1) :
    (H1.twistEquiv c).symm 1 ≠ 1 ∧
      H1.twistRes φ hφ hact c ((H1.twistEquiv c).symm 1) = 1 := by
  constructor
  · intro h
    have he := congrArg (H1.twistEquiv c) h
    rw [Equiv.apply_symm_apply, H1.twistEquiv_one] at he
    exact hc he.symm
  · apply (H1.twistEquiv (Z1.res φ hφ hact c)).injective
    rw [H1.twistRes_translation, Equiv.apply_symm_apply, H1.res_one, H1.twistEquiv_one]
    have he : Z1.res φ hφ hact c = 1 := by
      apply Z1.ext
      intro h
      change c (φ h) = 1
      rw [hzero, c.map_one]
    rw [he]
    rfl

end TwistedSourceTests
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_apply
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_apply
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_symm_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_smul
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes_apply
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes_one
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes_smul
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes_translation
#print axioms TauCeti.NonabelianCohomology.H1.twistRes
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_mk
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_one
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_translation
#print axioms TauCeti.NonabelianCohomology.Twist.sourceEquiv_gauge
#print axioms TauCeti.NonabelianCohomology.Z1.twistRes_injective
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_injective
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_representative
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_identity_translation
#print axioms TauCeti.NonabelianCohomology.H1.twistRes_comp_translation
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.inverse
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.semilinear
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.noncommutative_action
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.cocycle_identity
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.cocycle_gauge
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.cocycle_detection
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.neutral
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.gauge_classes
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.class_detection
#print axioms TauCeti.NonabelianCohomology.TwistedSourceTests.nonsurjective_loss

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
    x ∈ (Twist.map c f hf hG).ker ↔ f (Twist.toOriginal c x) = 1 := Iff.rfl

lemma Twist.kernel_stable (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G)
    {x : Twist c} (hx : x ∈ (Twist.map c f hf hG).ker) :
    g • x ∈ (Twist.map c f hf hG).ker := by
  rw [MonoidHom.mem_ker, Twist.map_smul, MonoidHom.mem_ker.mp hx, smul_one]

def Twist.kernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (Twist.map c f hf hG).ker ≃* f.ker where
  toFun x := ⟨Twist.toOriginal c x.val, (Twist.kernel_mem c f hf hG x.val).mp x.property⟩
  invFun x := ⟨(Twist.toOriginal c).symm x.val, x.property⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl

lemma Twist.kernelEquiv_value (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (x : (Twist.map c f hf hG).ker) :
    (Twist.kernelEquiv c f hf hG x).val = Twist.toOriginal c x.val := rfl

lemma Twist.kernelEquiv_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.kernelEquiv c f hf hG) :=
  continuous_subtype_val.subtype_mk _

lemma Twist.kernelEquiv_symm_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.kernelEquiv c f hf hG).symm :=
  continuous_subtype_val.subtype_mk _

@[instance_reducible]
def Twist.kernelAction (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    MulDistribMulAction G (Twist.map c f hf hG).ker where
  smul g x := ⟨g • x.val, Twist.kernel_stable c f hf hG g x.property⟩
  one_smul x := Subtype.ext (one_smul G x.val)
  mul_smul g h x := Subtype.ext (mul_smul g h x.val)
  smul_one g := Subtype.ext (smul_one g)
  smul_mul g x y := Subtype.ext (smul_mul' g x.val y.val)

lemma Twist.kernelAction_value (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G)
    (x : (Twist.map c f hf hG).ker) :
    (letI := Twist.kernelAction c f hf hG
     (g • x).val = g • x.val) := rfl

lemma Twist.kernelContinuousSMul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     ContinuousSMul G (Twist.map c f hf hG).ker) := by
  let := Twist.kernelAction c f hf hG
  exact ⟨(continuous_fst.smul (continuous_subtype_val.comp continuous_snd)).subtype_mk _⟩

def H1.twistedKernelInclusion (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1 G (Twist.map c f hf hG).ker → H1 G (Twist c)) := by
  letI := Twist.kernelAction c f hf hG
  letI := Twist.kernelContinuousSMul c f hf hG
  exact H1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val (fun _ _ => rfl)

lemma H1.twistedKernelInclusion_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ d : Z1 G (Twist.map c f hf hG).ker,
     H1.twistedKernelInclusion c f hf hG (H1.mk d) =
       H1.mk (Z1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val
         (fun g x => Twist.kernelAction_value c f hf hG g x) d)) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  intro d
  rfl

lemma H1.twistedKernelInclusion_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.twistedKernelInclusion c f hf hG 1 = 1) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  rfl

lemma H1.twistedKernelInclusion_image (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
       (Twist.map_smul c f hf hG) (H1.twistedKernelInclusion c f hf hG a) = 1) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  intro a
  obtain ⟨d, rfl⟩ := H1.mk_surjective a
  rw [H1.twistedKernelInclusion_mk, H1.map_mk]
  have hd : Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
      (Twist.map_smul c f hf hG)
      (Z1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val
        (fun _ _ => rfl) d) = 1 := by
    apply Z1.ext
    intro g
    exact (d g).property
  rw [hd]
  rfl

lemma H1.twistedKernelInclusion_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map f hf hG (H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) =
       H1.mk (Z1.map f hf hG c)) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  intro a
  exact (H1.twistEquiv_map_fibre c f hf hG _).mpr
    (H1.twistedKernelInclusion_image c f hf hG a)

lemma Twist.map_surjective (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) : Function.Surjective (Twist.map c f hf hG) := hsur

def Twist.quotientEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Twist c ⧸ (Twist.map c f hf hG).ker ≃* Twist (Z1.map f hf hG c) :=
  QuotientGroup.quotientKerEquivOfSurjective (Twist.map c f hf hG)
    (Twist.map_surjective c f hf hG hsur)

lemma Twist.quotientEquiv_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (x : Twist c) :
    Twist.quotientEquiv c f hf hG hsur (QuotientGroup.mk x) = Twist.map c f hf hG x := rfl

lemma Twist.quotientEquiv_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur) := by
  apply (QuotientGroup.isQuotientMap_mk (Twist.map c f hf hG).ker).continuous_iff.mpr
  exact Twist.map_continuous c f hf hG

lemma Twist.quotientEquiv_symm_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur).symm := by
  have hq : Topology.IsQuotientMap (Twist.map c f hf hG) := hquot
  apply hq.continuous_iff.mpr
  have hh : (Twist.quotientEquiv c f hf hG hsur).symm ∘ Twist.map c f hf hG =
      (QuotientGroup.mk : Twist c → Twist c ⧸ (Twist.map c f hf hG).ker) := by
    funext x
    rw [Function.comp_apply, ← Twist.quotientEquiv_mk c f hf hG hsur x,
      MulEquiv.symm_apply_apply]
  rw [hh]
  exact QuotientGroup.continuous_mk

def Twist.quotientHomeomorph (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    Twist c ⧸ (Twist.map c f hf hG).ker ≃ₜ Twist (Z1.map f hf hG c) where
  toEquiv := (Twist.quotientEquiv c f hf hG hsur).toEquiv
  continuous_toFun := Twist.quotientEquiv_continuous c f hf hG hsur
  continuous_invFun := Twist.quotientEquiv_symm_continuous c f hf hG hsur hquot

lemma Twist.quotientHomeomorph_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) (x : Twist c) :
    Twist.quotientHomeomorph c f hf hG hsur hquot (QuotientGroup.mk x) =
      Twist.map c f hf hG x := rfl

lemma Twist.quotientHomeomorph_toEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (Twist.quotientHomeomorph c f hf hG hsur hquot).toEquiv =
      (Twist.quotientEquiv c f hf hG hsur).toEquiv := rfl

lemma Twist.quotientHomeomorph_mul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (x y : Twist c ⧸ (Twist.map c f hf hG).ker) :
    Twist.quotientHomeomorph c f hf hG hsur hquot (x*y) =
      Twist.quotientHomeomorph c f hf hG hsur hquot x *
        Twist.quotientHomeomorph c f hf hG hsur hquot y :=
  (Twist.quotientEquiv c f hf hG hsur).map_mul x y

lemma Twist.quotientEquiv_symm_continuous_iff (c : Z1 G U) (f : U →* V)
    (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur).symm ↔ Topology.IsQuotientMap f := by
  constructor
  · intro hi
    let e : Twist c ⧸ (Twist.map c f hf hG).ker ≃ₜ Twist (Z1.map f hf hG c) := {
      toEquiv := (Twist.quotientEquiv c f hf hG hsur).toEquiv
      continuous_toFun := Twist.quotientEquiv_continuous c f hf hG hsur
      continuous_invFun := hi }
    exact e.isQuotientMap.comp (QuotientGroup.isQuotientMap_mk (Twist.map c f hf hG).ker)
  · exact Twist.quotientEquiv_symm_continuous c f hf hG hsur

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
theorem TwistedKernelTests.kernel_inverse (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (x : (Twist.map c f hf hG).ker) :
    (Twist.kernelEquiv c f hf hG).symm (Twist.kernelEquiv c f hf hG x) = x := by
  exact (Twist.kernelEquiv c f hf hG).symm_apply_apply x

-- test: Twist.kernelEquiv.test_identity_kernel
theorem TwistedKernelTests.identity_kernel (c : Z1 G U)
    (x : (Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl)).ker) :
    (Twist.kernelEquiv c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) x).val = 1 := by
  exact x.property

-- test: Twist.kernelEquiv.test_constant_kernel
theorem TwistedKernelTests.constant_kernel (c : Z1 G U) (x : Twist c) :
    (Twist.kernelEquiv c (1 : U →* V) continuous_const
      (fun (_ : G) _ => (smul_one _).symm)
      ⟨x, (Twist.kernel_mem c (1 : U →* V) continuous_const
        (fun (_ : G) _ => (smul_one _).symm) x).mpr rfl⟩).val = Twist.toOriginal c x := rfl

-- test: Twist.kernelAction.test_unit
theorem TwistedKernelTests.action_unit (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     ∀ g : G, g • (1 : (Twist.map c f hf hG).ker) = 1) := by
  let := Twist.kernelAction c f hf hG
  intro g
  exact smul_one g

-- test: Twist.kernelAction.test_joint_continuity
theorem TwistedKernelTests.action_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     Continuous (fun p : G × (Twist.map c f hf hG).ker => p.1 • p.2)) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  exact continuous_smul

-- test: Twist.kernelAction.test_noncommutative_action
theorem TwistedKernelTests.action_noncommutative :
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
  decide

-- test: H1.twistedKernelInclusion.test_neutral
theorem TwistedKernelTests.inclusion_neutral (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.twistedKernelInclusion c f hf hG 1 = 1) := by
  exact H1.twistedKernelInclusion_one c f hf hG

-- test: H1.twistedKernelInclusion.test_gauge_classes
theorem TwistedKernelTests.inclusion_gauge (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ (x : (Twist.map c f hf hG).ker) (d : Z1 G (Twist.map c f hf hG).ker),
     H1.twistedKernelInclusion c f hf hG (H1.mk (x • d)) =
       H1.twistedKernelInclusion c f hf hG (H1.mk d)) := by
  let := Twist.kernelAction c f hf hG
  let := Twist.kernelContinuousSMul c f hf hG
  intro x d
  rw [H1.mk_smul]

-- test: H1.twistedKernelInclusion.test_repointed_fibre
theorem TwistedKernelTests.inclusion_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map f hf hG (H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) =
       H1.mk (Z1.map f hf hG c)) := by
  exact H1.twistedKernelInclusion_fibre c f hf hG

-- test: Twist.quotientEquiv.test_native_comparison
theorem TwistedKernelTests.quotient_native (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) :
    Twist.quotientEquiv c f hf hG hsur =
      QuotientGroup.quotientKerEquivOfSurjective (Twist.map c f hf hG)
        (Twist.map_surjective c f hf hG hsur) := rfl

-- test: Twist.quotientEquiv.test_inverse
theorem TwistedKernelTests.quotient_inverse (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (x : Twist c ⧸ (Twist.map c f hf hG).ker) :
    (Twist.quotientEquiv c f hf hG hsur).symm
      (Twist.quotientEquiv c f hf hG hsur x) = x := by
  exact (Twist.quotientEquiv c f hf hG hsur).symm_apply_apply x

-- test: Twist.quotientEquiv.test_nonsurjective_constant
theorem TwistedKernelTests.quotient_nonsurjective (c : Z1 G U) (v : V) (hv : v ≠ 1) :
    ¬ Function.Surjective (Twist.map c (1 : U →* V) continuous_const
      (fun (_ : G) _ => (smul_one _).symm)) := by
  intro h
  obtain ⟨x, hx⟩ := h v
  exact hv hx.symm

-- test: Twist.quotientHomeomorph.test_native_value
theorem TwistedKernelTests.homeomorph_value (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (hquot : Topology.IsQuotientMap f) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c)
      (Twist.quotientHomeomorph c f hf hG hsur hquot (QuotientGroup.mk x)) =
        f (Twist.toOriginal c x) := rfl

-- test: Twist.quotientHomeomorph.test_inverse
theorem TwistedKernelTests.homeomorph_inverse (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (hquot : Topology.IsQuotientMap f) (x : Twist c ⧸ (Twist.map c f hf hG).ker) :
    (Twist.quotientHomeomorph c f hf hG hsur hquot).symm
      (Twist.quotientHomeomorph c f hf hG hsur hquot x) = x := by
  exact (Twist.quotientHomeomorph c f hf hG hsur hquot).symm_apply_apply x

-- test: Twist.quotientHomeomorph.test_quotient_topology_required
theorem TwistedKernelTests.homeomorph_topology_required (c : Z1 G U) (f : U →* V)
    (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hnq : ¬ Topology.IsQuotientMap f) :
    ¬ Continuous (Twist.quotientEquiv c f hf hG hsur).symm := by
  intro h
  exact hnq ((Twist.quotientEquiv_symm_continuous_iff c f hf hG hsur).mp h)

end TwistedKernelTests
end TauCeti.NonabelianCohomology
#print axioms TauCeti.NonabelianCohomology.Twist.kernel_mem
#print axioms TauCeti.NonabelianCohomology.Twist.kernel_stable
#print axioms TauCeti.NonabelianCohomology.Twist.kernelEquiv
#print axioms TauCeti.NonabelianCohomology.Twist.kernelEquiv_value
#print axioms TauCeti.NonabelianCohomology.Twist.kernelEquiv_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.kernelEquiv_symm_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.kernelAction
#print axioms TauCeti.NonabelianCohomology.Twist.kernelAction_value
#print axioms TauCeti.NonabelianCohomology.Twist.kernelContinuousSMul
#print axioms TauCeti.NonabelianCohomology.H1.twistedKernelInclusion
#print axioms TauCeti.NonabelianCohomology.H1.twistedKernelInclusion_mk
#print axioms TauCeti.NonabelianCohomology.H1.twistedKernelInclusion_one
#print axioms TauCeti.NonabelianCohomology.H1.twistedKernelInclusion_image
#print axioms TauCeti.NonabelianCohomology.H1.twistedKernelInclusion_fibre
#print axioms TauCeti.NonabelianCohomology.Twist.map_surjective
#print axioms TauCeti.NonabelianCohomology.Twist.quotientEquiv
#print axioms TauCeti.NonabelianCohomology.Twist.quotientEquiv_mk
#print axioms TauCeti.NonabelianCohomology.Twist.quotientEquiv_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.quotientEquiv_symm_continuous
#print axioms TauCeti.NonabelianCohomology.Twist.quotientHomeomorph
#print axioms TauCeti.NonabelianCohomology.Twist.quotientHomeomorph_mk
#print axioms TauCeti.NonabelianCohomology.Twist.quotientHomeomorph_toEquiv
#print axioms TauCeti.NonabelianCohomology.Twist.quotientHomeomorph_mul
#print axioms TauCeti.NonabelianCohomology.Twist.quotientEquiv_symm_continuous_iff
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.kernel_inverse
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.identity_kernel
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.constant_kernel
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.action_unit
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.action_continuous
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.action_noncommutative
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.inclusion_neutral
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.inclusion_gauge
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.inclusion_fibre
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.quotient_native
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.quotient_inverse
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.quotient_nonsurjective
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.homeomorph_value
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.homeomorph_inverse
#print axioms TauCeti.NonabelianCohomology.TwistedKernelTests.homeomorph_topology_required

END ARCHIVED CHECKED TWISTED KERNELS 63 -/
