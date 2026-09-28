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
# Anabelian geometry and nonabelian Chabauty — suggested declarations (NC.3, first checkpoint)

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

/-- NC.3/exact-sequence (a), exactness at `H¹(G, A)` for a closed `G`-stable subgroup `A ↪ B`
(not necessarily normal): a class dies in `H¹(G, B)` iff it is the connecting image
`[g ↦ b⁻¹ · g • b]` of a `G`-invariant coset `bA`. -/
theorem exact_H1_of_subgroup (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (x : H1 G A) :
    H1.map i hi.continuous hG x = 1 ↔
      ∃ (b : B) (c : Z1 G A), x = H1.mk c ∧ ∀ g : G, i (c g) = b⁻¹ * (g • b) := by sorry

/-- NC.3/exact-sequence (a), exactness at the invariant cosets: the connecting class of `bA` is
trivial iff `bA` contains a `G`-invariant element. -/
theorem connecting_eq_one_iff (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B) (c : Z1 G A)
    (hc : ∀ g : G, i (c g) = b⁻¹ * (g • b)) :
    H1.mk c = 1 ↔ ∃ a : A, ∀ g : G, g • (b * i a) = b * i a := by sorry

/-- NC.3/exact-sequence (b), exactness at `H¹(G, B)` for `1 → A → B → C → 1` with `A` normal
and `B → C` a continuous open surjection: a class dies in `H¹(G, C)` iff it comes from
`H¹(G, A)`. No continuous section is needed. -/
theorem exact_H1_of_normal (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (π : B →* C) (hπ : Continuous π) (hπo : IsOpenMap π) (hπs : Function.Surjective π)
    (hπG : ∀ (g : G) (b : B), π (g • b) = g • π b) (hker : π.ker = i.range) (y : H1 G B) :
    H1.map π hπ hπG y = 1 ↔ y ∈ Set.range (H1.map i hi.continuous hiG) := by sorry

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

end TauCeti.NonabelianCohomology
