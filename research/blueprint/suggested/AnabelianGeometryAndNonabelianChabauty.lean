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

/-- NC.3/functoriality (b): restriction along `φ : G' → G`, with `G'` acting through `φ`. -/
def H1.res {G' : Type*} [Group G'] [TopologicalSpace G'] [MulDistribMulAction G' U]
    [ContinuousSMul G' U] (φ : G' →* G) (hφ : Continuous φ)
    (hact : ∀ (g' : G') (x : U), g' • x = φ g' • x) : H1 G U → H1 G' U := sorry

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
example (K : Subgroup (Equiv.Perm (Fin 3)))
    [MulDistribMulAction (Multiplicative (ZMod 2)) K]
    [MulDistribMulAction (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))]
    (hK : ∀ b : Equiv.Perm (Fin 3), b ∈ K ↔ b = 1 ∨ b = Equiv.swap 0 1)
    (hA : ∀ (g : Multiplicative (ZMod 2)) (a : K), g • a = a)
    (hB : ∀ (g : Multiplicative (ZMod 2)) (b : Equiv.Perm (Fin 3)), g • b = b)
    (hG : ∀ (g : Multiplicative (ZMod 2)) (a : K), K.subtype (g • a) = g • K.subtype a) :
    Nat.card (InvariantCosets K.subtype hG) = 3 := by sorry

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
    [MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))]
    [MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))]
    [ContinuousSMul (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))]
    [ContinuousSMul (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))]
    (i : Multiplicative (ZMod 2) →* Multiplicative (ZMod 4))
    (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g a : Multiplicative (ZMod 2)), i (g • a) = g • i a)
    (hi2 : ∀ a : Multiplicative (ZMod 2), (i a).toAdd = 2 * (a.toAdd.val : ZMod 4))
    (hA : ∀ g a : Multiplicative (ZMod 2), g • a = a)
    (hB : ∀ (g : Multiplicative (ZMod 2)) (b : Multiplicative (ZMod 4)),
      (g • b).toAdd = if g.toAdd = 0 then b.toAdd else -b.toAdd)
    (q : InvariantCosets i hG)
    (hq : q.val = (QuotientGroup.mk (Multiplicative.ofAdd (1 : ZMod 4)) :
      Multiplicative (ZMod 4) ⧸ i.range)) : connecting i hi hG q ≠ 1 := by sorry


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

/-- The twisted action `g ⋆ u = c(g) · (g • u) · c(g)⁻¹`. -/
instance (c : Z1 G U) : MulDistribMulAction G (Twist c) := sorry
instance (c : Z1 G U) : ContinuousSMul G (Twist c) := sorry

theorem Twist.smul_def (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (c g * (g • (x : U)) * (c g)⁻¹ : U) := by sorry

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

/-- The cocycle of a point, `g • p = p · c_p(g)`. -/
def Torsor.cocycle {G U} (P : Torsor G U) (p : P.carrier) : Z1 G U := sorry

/-- The classification: isomorphism classes of torsors are in bijection with `H¹(G, U)`;
stated as the class map and its bijectivity on isomorphism classes. -/
def Torsor.classOf {G U} (P : Torsor G U) : H1 G U := sorry

theorem Torsor.classOf_eq_one_iff {G U} (P : Torsor G U) :
    P.classOf = 1 ↔ ∃ p : P.carrier, ∀ g : G, g • p = p := by sorry

theorem Torsor.classOf_surjective :
    Function.Surjective (Torsor.classOf : Torsor G U → H1 G U) := by sorry

end Torsor

/-! ## Unit tests -/

-- TauCeti.NonabelianCohomology.tests.trivial_group
example (U : Type) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
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

OMITTED TauCeti.NonabelianCohomology.H1.res_comp
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
