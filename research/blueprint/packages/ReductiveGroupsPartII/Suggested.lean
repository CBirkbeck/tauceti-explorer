import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.Topology.Algebra.Valued.ValuativeRel
import Mathlib.RingTheory.Henselian
import Mathlib.Topology.Algebra.Group.Units
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.UniformSpace.Completion
import Mathlib.LinearAlgebra.RootSystem.Base
import Mathlib.LinearAlgebra.RootSystem.WeylGroup
import Mathlib.LinearAlgebra.FreeModule.PID
import Mathlib.LinearAlgebra.AffineSpace.AffineEquiv
import Mathlib.GroupTheory.Coxeter.Length
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.GroupTheory.PushoutI
import Mathlib.GroupTheory.PGroup
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.Algebra.Module.Lattice
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.RingTheory.Smooth.AdicCompletion
import Mathlib.RingTheory.Etale.Field
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.AffineScheme
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.CategoryTheory.Yoneda
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Smooth.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Basic
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.NumberTheory.LocalField.NormalizedValuation

/-!
# Reductive algebraic groups, Part II: local structure and arithmetic models — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document is definitive. The
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Every proof, and the body of every definition that is not already expressible with the
pinned libraries, is `sorry`: these are unproved interfaces, not implementation claims.

Conventions (pinned in the roadmap document):
* an affine group scheme over a commutative ring `R` is a commutative Hopf `R`-algebra `H`, and its
  `A`-points are the Tau Ceti convolution group `WithConv (H →ₐ[R] A)`;
* `K` is a field with a discrete valuative relation whose ring of integers `𝒪[K]` is henselian and
  whose residue field `𝓀[K]` is perfect; the two instances used throughout are a nonarchimedean
  local field `E` (Mathlib's `IsNonarchimedeanLocalField`) and the completion `Ĕ` of its maximal
  unramified extension;
* the additive valuation is normalized by `ω(ϖ) = 1`, and a central element `z` of the minimal Levi
  acts on the apartment by the translation `v(z)` with `χ(v(z)) = -ω(χ(z))`;
* the building is the enlarged building unless the reduced one is named; a parahoric subgroup is
  the group of integral points of the *connected* Bruhat–Tits group scheme.

Unvalued algebraic structure of a reductive group (maximal split tori, relative and absolute root
data, root subgroups, parabolic subgroups, the pinned Chevalley–Demazure groups) belongs to the
Tau Ceti roadmap *Reductive algebraic groups* (Layers 7 and 9) and is not yet in the pinned
library. Where a statement here needs it, it is passed in as explicit data
(`BruhatTits.LocalRootData`), never as an empty proposition.

Some pinned Tau Ceti modules are not compiled in the shared build used to check this file
(`TauCeti.GroupTheory.TitsSystem.*`, `TauCeti.GroupTheory.Coxeter.*`,
`TauCeti.LinearAlgebra.RootSystem.*`, `TauCeti.Topology.Algebra.Group.Profinite.*`). Statements
that use them name them in a comment and are stated with the Mathlib vocabulary instead.

The file follows the roadmap document layer by layer: a spine of shared carriers, then RG2.0,
RG2.0a, RG2.1, RG2.2, RG2.3 (integral models, Bruhat–Tits and parahoric group schemes, then the
extensions of parahorics, lattice chains, Moy–Prasad filtrations, Lang's theorem and level
subgroups), RG2.4 and RG2.5. Each layer ends with a comment block naming the targets whose statement
needs vocabulary that the pinned libraries do not yet have.
-/

set_option autoImplicit false

noncomputable section

open _root_.CategoryTheory
open scoped TensorProduct

/-! ## Spine: the carriers shared by all layers

The declarations in this part are the central objects of the roadmap. Each layer below adds the
API lemmas and unit tests of the nodes that own them. -/

universe u v w

/-! ### RG2.0 — the topology on points -/

namespace PointTopology

variable (k : Type u) [CommRing k] (A : Type v) [CommRing A] [Algebra k A]
  (R : Type w) [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The point topology on `X(R) = Hom_k(A, R)`: the coarsest topology for which every evaluation
map `f ↦ f a` (`a : A`) is continuous. -/
@[reducible] def topology : TopologicalSpace (A →ₐ[k] R) :=
  ⨅ a : A, TopologicalSpace.induced (fun f : A →ₐ[k] R => f a) ‹TopologicalSpace R›

/-- The point topology, as a scoped instance. -/
scoped instance instTopologicalSpace : TopologicalSpace (A →ₐ[k] R) := topology k A R

/-- The point topology on the convolution-group carrier `WithConv (A →ₐ[k] R)` of points. -/
scoped instance instTopologicalSpaceWithConv : TopologicalSpace (WithConv (A →ₐ[k] R)) :=
  TopologicalSpace.induced WithConv.ofConv (topology k A R)

end PointTopology

/-! ### RG2.0 — the completed maximal unramified extension -/

namespace MaxUnramifiedCompletion

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- The completion `Ĕ` of the maximal unramified extension of `E`. -/
def Breve (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] : Type u := sorry

instance : Field (Breve E) := sorry
instance : Algebra E (Breve E) := sorry
instance : ValuativeRel (Breve E) := sorry
instance : TopologicalSpace (Breve E) := sorry

/-- The arithmetic Frobenius of `Ĕ` over `E`. -/
def frobenius : Breve E ≃ₐ[E] Breve E := sorry

end MaxUnramifiedCompletion

/-! ### RG2.0a — Weil restriction -/

namespace WeilRestriction

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

/-- The functor of points of the Weil restriction: `R ↦ Hom_{k'}(A', k' ⊗_k R)`. -/
def functor : CommAlgCat.{u} k ⥤ Type u where
  obj R := A' →ₐ[k'] k' ⊗[k] R
  map {R S} f := TypeCat.ofHom fun g => (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp g
  map_id := sorry
  map_comp := sorry

/-- The representing `k`-algebra `Res_{k'/k} A'` of the Weil restriction. -/
def Res (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (A' : Type u) [CommRing A'] [Algebra k' A'] : Type u := sorry

instance : CommRing (Res k k' A') := sorry
instance : Algebra k (Res k k' A') := sorry

/-- The universal property of the representing algebra: `Hom_k(Res A', R) ≃ Hom_{k'}(A', k' ⊗_k R)`,
for `k → k'` finite locally free. -/
def homEquiv [Module.Finite k k'] [Module.Projective k k'] (R : Type u) [CommRing R]
    [Algebra k R] : (Res k k' A' →ₐ[k] R) ≃ (A' →ₐ[k'] k' ⊗[k] R) := sorry

end WeilRestriction

/-! ### RG2.1 — abstract valued root data (Bruhat–Tits I §6) -/

namespace BruhatTits

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

/-- A root datum of type `Φ` in an abstract group `G` (Bruhat–Tits I, 6.1.1): a subgroup `T` and
root subgroups `U a` indexed by the (possibly non-reduced) roots, with the axioms that `T`
normalizes each root subgroup, that `U (2a) ⊆ U a`, and the commutator axiom. The remaining axioms
(the elements `m(u)` and the positivity axiom) are stated in the roadmap document. -/
structure RootDatum (G : Type v) [Group G] (Φ : RootPairing ι ℝ M N) where
  /-- The subgroup `T` (the rational points of the minimal Levi `Z`). -/
  T : Subgroup G
  /-- The root subgroups. -/
  U : ι → Subgroup G
  U_ne_bot : ∀ i, U i ≠ ⊥
  le_normalizer : ∀ i, T ≤ Subgroup.normalizer (U i : Set G)
  le_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≤ U i
  commutator_le : ∀ i j, (∀ c : ℝ, Φ.root j ≠ c • Φ.root i) →
    ⁅U i, U j⁆ ≤ ⨆ (k : ι) (_ : ∃ p q : ℕ, 0 < p ∧ 0 < q ∧
      Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j), U k

/-- A valuation of a root datum (Bruhat–Tits I, 6.2.1): functions `φ a : U a → ℝ ∪ {∞}` whose
superlevel sets are subgroups, with `φ a u = ⊤` only for `u = 1`, compatible with doubling. -/
structure Valuation {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) where
  /-- The valuation `φ_a` on the root subgroup `U_a`. -/
  φ : (i : ι) → D.U i → WithTop ℝ
  φ_eq_top_iff : ∀ i u, φ i u = ⊤ ↔ u = 1
  /-- The filtration subgroups `U_{a,r} = φ_a⁻¹[r, ∞]`. -/
  filtration : ι → ℝ → Subgroup G
  mem_filtration_iff : ∀ i r g, g ∈ filtration i r ↔ ∃ u : D.U i, (u : G) = g ∧ (r : WithTop ℝ) ≤ φ i u
  /-- At least three values on each root group (axiom V0). -/
  three_values : ∀ i, 3 ≤ (Set.range (φ i)).encard

/-- Two valuations are equipollent if they differ by a vector `v` of the coroot space:
`ψ_a = φ_a + a(v)` (Bruhat–Tits I, 6.2.5). -/
def Equipollent {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) : Prop :=
  ∃ v : N, ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ)

/-- The apartment of a valuation: the set of valuations equipollent to it, an affine space under
the coroot space (Bruhat–Tits I, 6.2.5–6.2.6). -/
def Apartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) :=
  {ψ : Valuation D // Equipollent φ ψ}

instance Apartment.instAddTorsor {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) : AddTorsor N (Apartment φ) := sorry

end BruhatTits

/-! ### RG2.1 — imported unvalued data of a reductive group over a field

The unvalued structure theory (maximal split torus, relative root system, root subgroups,
absolute based root datum with its Galois action) belongs to the Tau Ceti roadmap *Reductive
algebraic groups*, Layer 7, which is not yet in the pinned library. It is passed in as data. -/

namespace BruhatTits

open ValuativeRel

/-- The rational relative root data of a connected reductive `K`-group `H` (imported from the
anchor roadmap, Layer 7): the coroot space `V = X_*(S) ⊗ ℝ` of a maximal `K`-split torus, the
relative root system `Φ(G,S)` in `V*`, the root datum `(Z(K), (U_a(K)))` in `G(K)` (Borel–Tits)
and the normalizer `N(K)` of `S`. -/
structure LocalRootData (K : Type u) [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  ι : Type u
  [fintype_ι : Fintype ι]
  V : Type u
  [addCommGroup_V : AddCommGroup V]
  [module_V : Module ℝ V]
  [finiteDimensional_V : FiniteDimensional ℝ V]
  Φ : RootPairing ι ℝ (Module.Dual ℝ V) V
  rootDatum : RootDatum (WithConv (H →ₐ[K] K)) Φ
  /-- The rational points `N(K)` of the normalizer of the maximal split torus. -/
  normalizer : Subgroup (WithConv (H →ₐ[K] K))
  T_le_normalizer : rootDatum.T ≤ normalizer

attribute [instance] LocalRootData.fintype_ι LocalRootData.addCommGroup_V LocalRootData.module_V
  LocalRootData.finiteDimensional_V

/-- The absolute root datum of a connected reductive `K`-group with its Galois action (imported
from the anchor roadmap, Layer 7): characters and cocharacters of a maximal torus over a separable
closure, the root datum, and the action of the absolute Galois group by automorphisms. -/
structure AbsoluteRootData (K : Type u) [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  ι : Type u
  [fintype_ι : Fintype ι]
  X : Type u
  Y : Type u
  [addCommGroup_X : AddCommGroup X]
  [addCommGroup_Y : AddCommGroup Y]
  [finite_X : Module.Finite ℤ X]
  [finite_Y : Module.Finite ℤ Y]
  Ψ : RootPairing ι ℤ X Y
  /-- The Galois action `μ_G` on the based root datum, through root-datum automorphisms. -/
  galoisAction : Field.absoluteGaloisGroup K →* RootPairing.Aut Ψ

attribute [instance] AbsoluteRootData.fintype_ι AbsoluteRootData.addCommGroup_X
  AbsoluteRootData.addCommGroup_Y AbsoluteRootData.finite_X AbsoluteRootData.finite_Y

/-- The algebraic fundamental group `π₁(G) = X_*(T)/Q^∨` (Borovoi). -/
def AlgebraicFundamentalGroup {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) : Type u :=
  D.Y ⧸ Submodule.span ℤ (Set.range D.Ψ.coroot)

instance {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) : AddCommGroup (AlgebraicFundamentalGroup D) :=
  inferInstanceAs (AddCommGroup (D.Y ⧸ Submodule.span ℤ (Set.range D.Ψ.coroot)))

end BruhatTits

/-! ### RG2.2 — the building -/

namespace BruhatTits

open ValuativeRel

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The (enlarged) Bruhat–Tits building `G(K) × A / ~` of a valued root datum of `G(K)`
(Bruhat–Tits I, 7.4.1–7.4.2). -/
def Building (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Type u := sorry

instance (D : LocalRootData K H) (φ : Valuation D.rootDatum) :
    MulAction (WithConv (H →ₐ[K] K)) (Building D φ) := sorry

instance (D : LocalRootData K H) (φ : Valuation D.rootDatum) : MetricSpace (Building D φ) :=
  sorry

/-- The apartment, as a subset of the building. -/
def apartmentEmbedding (D : LocalRootData K H) (φ : Valuation D.rootDatum) :
    Apartment φ → Building D φ := sorry

end BruhatTits

/-! ### RG2.3 — integral models -/

namespace BruhatTits

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The Bruhat–Tits group scheme `𝒢_Ω` of a nonempty finite subset `Ω` of the apartment (by
Bruhat–Tits II 4.6.27 it depends only on the enclosure): a smooth affine `𝒪[K]`-group whose
strictly henselian points are the pointwise fixer of `Ω` (Bruhat–Tits II 4.6.26, 5.1.9). -/
def groupScheme (D : LocalRootData K H) (φ : Valuation D.rootDatum) (Ω : Finset (Apartment φ)) :
    CommHopfAlgCat.{u} 𝒪[K] := sorry

/-- The connected parahoric group scheme `𝒢°_Ω`, the identity component of `groupScheme`
(Bruhat–Tits II 4.6.28, 5.2). -/
def parahoricGroupScheme (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (Ω : Finset (Apartment φ)) : CommHopfAlgCat.{u} 𝒪[K] := sorry

/-- The parahoric subgroup `𝒢°_Ω(𝒪)` of `G(K)`, as a subgroup of the rational points. -/
def parahoricSubgroup (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (Ω : Finset (Apartment φ)) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

end BruhatTits

/-! ### RG2.4 — the Iwahori–Weyl group -/

namespace BruhatTits

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The unique parahoric subgroup `Z(K)_0` of the minimal Levi. -/
def minimalLeviParahoric (D : LocalRootData K H) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

instance (D : LocalRootData K H) :
    ((minimalLeviParahoric D).subgroupOf D.normalizer).Normal := sorry

/-- The Iwahori–Weyl group `W̃ = N(K)/Z(K)_0` (Haines–Rapoport; Richarz). -/
def IwahoriWeylGroup (D : LocalRootData K H) : Type u :=
  D.normalizer ⧸ (minimalLeviParahoric D).subgroupOf D.normalizer

instance (D : LocalRootData K H) : Group (IwahoriWeylGroup D) :=
  inferInstanceAs (Group (D.normalizer ⧸ (minimalLeviParahoric D).subgroupOf D.normalizer))

end BruhatTits

/-! ### RG2.5 — dual groups -/

namespace LanglandsDual

open BruhatTits

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The dual root datum: Mathlib's `RootPairing.flip` of the absolute root datum. -/
def dualRootDatum (D : AbsoluteRootData K H) : RootPairing D.ι ℤ D.Y D.X := D.Ψ.flip

/-- The Langlands dual group: the pinned split reductive group over `ℤ` attached to the dual root
datum by the Chevalley–Demazure construction of the anchor roadmap (Layer 9). -/
def dualGroup (D : AbsoluteRootData K H) : CommHopfAlgCat.{0} ℤ := sorry

/-- The action of the Galois group on the points of the dual group through pinned automorphisms
(finite image). -/
def galoisActionOnPoints (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Field.absoluteGaloisGroup K →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)) := sorry

/-- The L-group `ᴸG(R) = Ĝ(R) ⋊ Γ_K` (Galois form). -/
abbrev LGroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] : Type _ :=
  WithConv (dualGroup D →ₐ[ℤ] R) ⋊[galoisActionOnPoints D R] Field.absoluteGaloisGroup K

end LanglandsDual

/-! ## RG2.0 — Topologies on rational points -/


namespace PointTopology

open scoped PointTopology

section Affine

variable {k : Type u} [CommRing k] {A : Type v} [CommRing A] [Algebra k A]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Every evaluation map `f ↦ f a` is continuous for the point topology. -/
theorem continuous_eval (a : A) : Continuous fun f : A →ₐ[k] R => f a := sorry

/-- The universal property of the point topology. -/
theorem continuous_iff {Y : Type*} [TopologicalSpace Y] (g : Y → (A →ₐ[k] R)) :
    Continuous g ↔ ∀ a : A, Continuous fun y => g y a := sorry

/-- The point topology is the subspace topology of the product topology on `A → R`. -/
theorem isEmbedding_toPi : Topology.IsEmbedding fun f : A →ₐ[k] R => (⇑f : A → R) := sorry

/-- `ofConv` is continuous on the convolution carrier of points. -/
theorem continuous_ofConv : Continuous (WithConv.ofConv : WithConv (A →ₐ[k] R) → (A →ₐ[k] R)) :=
  sorry

/-- Evaluation at a generating family is an embedding; closed for finite families and T1 `R`. -/
theorem isEmbedding_eval_generators {ι : Type*} (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

theorem isClosedEmbedding_eval_generators [T1Space R] {ι : Type*} [Finite ι] (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

/-- Precomposition with an algebra map is continuous. -/
theorem continuous_comap {B : Type*} [CommRing B] [Algebra k B] (φ : B →ₐ[k] A) :
    Continuous fun f : A →ₐ[k] R => f.comp φ := sorry

/-- A surjection of algebras (a closed immersion) gives a closed embedding when `R` is T1. -/
theorem isClosedEmbedding_comap_of_surjective [T1Space R] {B : Type*} [CommRing B] [Algebra k B]
    (φ : B →ₐ[k] A) (hφ : Function.Surjective φ) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => f.comp φ := sorry

/-- Postcomposition with a continuous algebra map is continuous; embeddings are preserved. -/
theorem continuous_map_codomain {R' : Type*} [CommRing R'] [Algebra k R'] [TopologicalSpace R']
    [IsTopologicalRing R'] (ψ : R →ₐ[k] R') (hψ : Continuous ψ) :
    Continuous fun f : A →ₐ[k] R => ψ.comp f := sorry

theorem isOpenEmbedding_map_codomain [Algebra.FiniteType k A] {R' : Type*} [CommRing R']
    [Algebra k R'] [TopologicalSpace R'] [IsTopologicalRing R'] (ψ : R →ₐ[k] R')
    (hψ : Topology.IsOpenEmbedding ψ) :
    Topology.IsOpenEmbedding fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Localizations give open embeddings when units are open with continuous inversion. -/
theorem isOpenEmbedding_localization (f : A) (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : Rˣ => ((u⁻¹ : Rˣ) : R)) :
    Topology.IsOpenEmbedding fun x : Localization.Away f →ₐ[k] R =>
      x.comp (IsScalarTower.toAlgHom k A (Localization.Away f)) := sorry

-- Test PointTopology.polynomial_homeomorph
example : ∃ e : (Polynomial k →ₐ[k] R) ≃ₜ R, ∀ f, e f = f Polynomial.X := sorry

-- Test PointTopology.discrete_of_discrete
example [DiscreteTopology R] [Algebra.FiniteType k A] : DiscreteTopology (A →ₐ[k] R) := sorry

-- Test PointTopology.units_hyperbola
example (p : ℕ) [Fact p.Prime] :
    Topology.IsEmbedding fun f : LaurentPolynomial ℤ →ₐ[ℤ] ℚ_[p] => f (LaurentPolynomial.T 1) :=
  sorry

-- Test PointTopology.pi_compat
example : (PointTopology.topology k A R) =
    TopologicalSpace.induced (fun f : A →ₐ[k] R => (⇑f : A → R)) Pi.topologicalSpace := sorry

end Affine

section Group

variable {k : Type u} [CommRing k] {H : Type v} [CommRing H] [HopfAlgebra k H]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]

/-- The convolution group of points is a topological group. -/
theorem isTopologicalGroup : IsTopologicalGroup (WithConv (H →ₐ[k] R)) := sorry

/-- For `GL_n`, the point topology is the units topology on matrices. -/
def generalLinearPointsHomeomorph (n : ℕ) :
    WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra k n →ₐ[k] R) ≃ₜ
      Matrix.GeneralLinearGroup (Fin n) R := sorry

end Group

section LocalInstances

open ValuativeRel

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  {H : Type v} [CommRing H] [HopfAlgebra E H]

/-- Points over a nonarchimedean local field are Hausdorff (`RG2.0/points-locally-compact-hausdorff`;
the instance under which the adelic and smooth-representation consumers read `G(E)`). -/
instance instT2SpaceLocal : T2Space (WithConv (H →ₐ[E] E)) := sorry

instance instLocallyCompactSpaceLocal [Algebra.FiniteType E H] :
    LocallyCompactSpace (WithConv (H →ₐ[E] E)) := sorry

instance instSecondCountableTopologyLocal [Algebra.FiniteType E H] :
    SecondCountableTopology (WithConv (H →ₐ[E] E)) := sorry

instance instIsTopologicalGroupLocal : IsTopologicalGroup (WithConv (H →ₐ[E] E)) :=
  isTopologicalGroup

end LocalInstances

section Integral

open ValuativeRel

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Integral points are open and compact inside rational points. -/
theorem isOpenEmbedding_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] :
    Topology.IsOpenEmbedding fun f : A →ₐ[𝒪[E]] 𝒪[E] =>
      (Algebra.ofId 𝒪[E] E).comp f := sorry

theorem compactSpace_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] : CompactSpace (A →ₐ[𝒪[E]] 𝒪[E]) := sorry

end Integral

end PointTopology

namespace SchemePointTopology

open AlgebraicGeometry

/-- The topology on the `R`-points `Spec R ⟶ X` of a scheme over `Spec k`, glued from affine
charts, for `R` a local topological ring with open units and continuous inversion. -/
@[reducible] def topology {k : Type u} [CommRing k] (X : Scheme.{u}) (_f : X ⟶ Spec (CommRingCat.of k))
    (R : Type u) [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]
    [IsLocalRing R] : TopologicalSpace (Spec (CommRingCat.of R) ⟶ X) := sorry

variable {k : Type u} [CommRing k] (R : Type u) [CommRing R] [Algebra k R] [TopologicalSpace R]
  [IsTopologicalRing R] [IsLocalRing R]

/-- Affine opens give open subspaces. -/
theorem isOpenEmbedding_affineOpen (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k))
    (U : X.affineOpens) :
    @Topology.IsOpenEmbedding _ _ (topology (U : X.Opens).toScheme (U.1.ι ≫ f) R)
      (topology X f R) fun x => x ≫ U.1.ι := sorry

/-- Every `R`-point lies in some affine open (`R` local). -/
theorem iUnion_affineOpens (X : Scheme.{u}) :
    ∀ x : Spec (CommRingCat.of R) ⟶ X, ∃ U : X.affineOpens,
      Set.range x.base ⊆ ((U : X.Opens) : Set X) := sorry

/-- For affine schemes the glued topology is the affine point topology (a homeomorphism with
`Hom_k(A, R)`). -/
theorem affine_eq (A : Type u) [CommRing A] [Algebra k A]
    (fA : Spec (CommRingCat.of A) ⟶ Spec (CommRingCat.of k)) :
    ∃ e : (Spec (CommRingCat.of R) ⟶ Spec (CommRingCat.of A)) ≃ (A →ₐ[k] R),
      @Continuous _ _ (topology _ fA R) (PointTopology.topology k A R) e ∧
      @Continuous _ _ (PointTopology.topology k A R) (topology _ fA R) e.symm := sorry

/-- Morphisms induce continuous maps. -/
theorem continuous_map {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of k))
    (fY : Y ⟶ Spec (CommRingCat.of k)) (g : X ⟶ Y) (hg : g ≫ fY = fX) :
    @Continuous _ _ (topology X fX R) (topology Y fY R) fun x => x ≫ g := sorry

/-- Closed immersions give closed embeddings for Hausdorff `R`. -/
theorem isClosedEmbedding_of_isClosedImmersion [T2Space R] {X Y : Scheme.{u}}
    (fX : X ⟶ Spec (CommRingCat.of k)) (fY : Y ⟶ Spec (CommRingCat.of k)) (g : X ⟶ Y)
    [IsClosedImmersion g] (hg : g ≫ fY = fX) :
    @Topology.IsClosedEmbedding _ _ (topology X fX R) (topology Y fY R) fun x => x ≫ g := sorry

-- Test SchemePointTopology.projectiveLine_compactSpace
-- (stated in the roadmap: ℙ¹(E) is compact; Mathlib's projective space scheme over a local field is
-- not available at the pin, so the statement is omitted here.)

-- Test SchemePointTopology.affine_compat
example (A : Type u) [CommRing A] [Algebra k A] (fA : Spec (CommRingCat.of A) ⟶ Spec (CommRingCat.of k)) :
    ∃ e : (Spec (CommRingCat.of R) ⟶ Spec (CommRingCat.of A)) → (A →ₐ[k] R),
      @Continuous _ _ (topology _ fA R) (PointTopology.topology k A R) e := sorry

-- Test SchemePointTopology.not_iUnion_of_nonlocal
-- (for `R = E × E`, not local, ℙ¹(R) is not covered by the points of the two standard charts;
-- the hypothesis `IsLocalRing R` above is what excludes this.)

-- Test SchemePointTopology.emptyScheme
example (f : (∅ : Scheme.{u}) ⟶ Spec (CommRingCat.of k)) :
    IsEmpty (Spec (CommRingCat.of R) ⟶ (∅ : Scheme.{u})) := sorry

/-- Local compactness and Hausdorffness of points over a local field. -/
theorem locallyCompactSpace_of_localField {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of E)) [LocallyOfFiniteType f] [IsSeparated f] :
    @LocallyCompactSpace _ (topology X f E) ∧ @T2Space _ (topology X f E) := sorry

/-- Smooth morphisms are open on points over a complete valued field. -/
theorem isOpenMap_of_smooth {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of E))
    (fY : Y ⟶ Spec (CommRingCat.of E)) (g : X ⟶ Y) [Smooth g] (hg : g ≫ fY = fX) :
    @IsOpenMap _ _ (topology X fX E) (topology Y fY E) fun x => x ≫ g := sorry

end SchemePointTopology

namespace CongruenceSubgroup

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  (H : Type u) [CommRing H] [HopfAlgebra 𝒪[E] H]

/-- The `n`-th congruence subgroup: the kernel of reduction modulo `𝓂^n` on integral points. -/
def subgroup (n : ℕ) : Subgroup (WithConv (H →ₐ[𝒪[E]] 𝒪[E])) := sorry

theorem mem_iff (n : ℕ) (x : WithConv (H →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E H n ↔
      (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n)).comp x.ofConv =
        (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n)).comp (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E])).ofConv := sorry

instance normal (n : ℕ) : (subgroup E H n).Normal := sorry

theorem antitone : Antitone (subgroup E H) := sorry

@[simp] theorem zero_eq_top : subgroup E H 0 = ⊤ := sorry

open scoped PointTopology in
theorem isOpen [Algebra.FiniteType 𝒪[E] H] (n : ℕ) :
    IsOpen (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

theorem map {H' : Type u} [CommRing H'] [HopfAlgebra 𝒪[E] H'] (φ : H' →ₐ[𝒪[E]] H)
    (hφ : (Coalgebra.counit : H →ₗ[𝒪[E]] 𝒪[E]).comp φ.toLinearMap = Coalgebra.counit) (n : ℕ)
    (x : WithConv (H →ₐ[𝒪[E]] 𝒪[E])) (hx : x ∈ subgroup E H n) :
    WithConv.toConv (x.ofConv.comp φ) ∈ subgroup E H' n := sorry

-- Test CongruenceSubgroup.generalLinear_eq
example (d n : ℕ) (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] d →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E _ n ↔
      ∀ i j, (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) (n := d) (A := 𝒪[E]) x : Matrix (Fin d) (Fin d) 𝒪[E]) i j -
        (1 : Matrix (Fin d) (Fin d) 𝒪[E]) i j ∈ 𝓂[E] ^ n := sorry

-- Test CongruenceSubgroup.multiplicative_eq_unitFiltration
-- (for `G_m` the congruence subgroups are the unit filtration `TauCeti.unitFiltration n`, `n ≥ 1`;
-- stated in the roadmap; the identification of the `G_m` coordinate ring with points uses
-- `TauCeti.MultiplicativeGroup.pointsMulEquiv`.)

-- Test CongruenceSubgroup.iInf_eq_bot
example [Algebra.FiniteType 𝒪[E] H] : (⨅ n, subgroup E H n) = ⊥ := sorry

-- Test CongruenceSubgroup.not_mem_of_det_nonunit
-- (for `GL_2`, `diag(1 + ϖ, 1)` lies in the first but not the second congruence subgroup.)

open scoped PointTopology in
/-- The congruence subgroups form a neighbourhood basis of the identity. -/
theorem hasBasis_nhds_one [Algebra.FiniteType 𝒪[E] H] :
    (nhds (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E]))).HasBasis (fun _ : ℕ => True)
      fun n => (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

/-- For a smooth model, consecutive congruence quotients are the Lie algebra of the special fibre
twisted by `𝓂^n/𝓂^{n+1}`; here stated as finiteness with the expected cardinality. -/
theorem quotientEquivLie [Algebra.Smooth 𝒪[E] H] (n : ℕ) (hn : 1 ≤ n) :
    ∃ d : ℕ, Nat.card ((subgroup E H n) ⧸ (subgroup E H (n + 1)).subgroupOf
      (subgroup E H n)) = Nat.card 𝓀[E] ^ d := sorry

end CongruenceSubgroup

namespace MaxUnramifiedCompletion

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

theorem frobenius_congr :
    ∀ x : Breve E, valuation (Breve E) x ≤ 1 →
      valuation (Breve E) (frobenius E x - x ^ Nat.card 𝓀[E]) < 1 := sorry

theorem fixedPoints_frobenius :
    {x : Breve E | frobenius E x = x} = Set.range (algebraMap E (Breve E)) := sorry

theorem residueField_isAlgClosed : IsAlgClosed 𝓀[Breve E] := sorry

theorem isUniformizer_algebraMap (ϖ : E) (hϖ1 : valuation E ϖ < 1)
    (hϖ : ∀ x : E, valuation E x < 1 → ∃ y : E, valuation E y ≤ 1 ∧ x = ϖ * y) :
    ∀ x : Breve E, valuation (Breve E) x < 1 →
      ∃ y : Breve E, valuation (Breve E) y ≤ 1 ∧ x = algebraMap E (Breve E) ϖ * y := sorry

theorem completeSpace :
    ∃ U : UniformSpace (Breve E), U.toTopologicalSpace = (inferInstance : TopologicalSpace (Breve E)) ∧
      @CompleteSpace _ U := sorry

theorem transcendenceDegree_infinite : ¬ Algebra.IsAlgebraic E (Breve E) := sorry

-- Test MaxUnramifiedCompletion.padic_witt
-- (for `E = ℚ_[p]` the integers of `Ĕ` are `WittVector p (AlgebraicClosure (ZMod p))`
-- compatibly with Frobenius; stated in the roadmap.)

-- Test MaxUnramifiedCompletion.ramificationIndex_one
-- (the normalized valuation of `Ĕ` restricts to that of `E`.)

-- Test MaxUnramifiedCompletion.not_algebraic
example : ¬ Algebra.IsAlgebraic E (Breve E) := sorry

-- Test MaxUnramifiedCompletion.frobenius_ne_one
example : frobenius E ≠ AlgEquiv.refl := sorry

/-- Rational points are the Frobenius-fixed points of `Ĕ`-points. -/
theorem points_eq_fixedPoints (A : Type u) [CommRing A] [Algebra E A] :
    ∀ x : A →ₐ[E] Breve E, ((frobenius E).toAlgHom.comp x = x) ↔
      ∃ y : A →ₐ[E] E, (Algebra.ofId E (Breve E)).comp y = x := sorry

end MaxUnramifiedCompletion

/-! ## RG2.0a — Weil restriction and the Deligne torus -/

namespace WeilRestriction

section Functor

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

@[simp] theorem functor_obj (R : CommAlgCat.{u} k) :
    (functor k k' A').obj R = (A' →ₐ[k'] k' ⊗[k] R) := rfl

theorem functor_map_apply {R S : CommAlgCat.{u} k} (f : R ⟶ S) (x : A' →ₐ[k'] k' ⊗[k] R) :
    (functor k k' A').map f x = (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp x := sorry

/-- Functoriality of the Weil restriction functor in the algebra. -/
def functorMap {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A') :
    functor k k' A' ⟶ functor k k' B' := sorry

/-- For finitely presented `A'` the functor is the functor of `Spec k'`-morphisms whose
representing scheme is owned by the Tau Ceti roadmap *Modular curves*, Layer 0F; stated here as
representability by an affine scheme of finite presentation. -/
theorem functor_compat_modularCurves [Module.Finite k k'] [Module.Projective k k']
    [Algebra.FinitePresentation k' A'] :
    ∃ (B : Type u) (_ : CommRing B) (_ : Algebra k B), Algebra.FinitePresentation k B ∧
      ∀ R : Type u, ∀ (_ : CommRing R) (_ : Algebra k R),
        Nonempty ((B →ₐ[k] R) ≃ (A' →ₐ[k'] k' ⊗[k] R)) := sorry

/-- Base change of the functor along `k → l`: for an `l`-algebra `R`, the value algebra
`k' ⊗_k R` is `(l ⊗_k k') ⊗_l R`. -/
theorem functorBaseChangeIso (l : Type u) [CommRing l] [Algebra k l] (R : Type u) [CommRing R]
    [Algebra l R] [Algebra k R] [IsScalarTower k l R] :
    Nonempty ((k' ⊗[k] R) ≃ₐ[k] ((l ⊗[k] k') ⊗[l] R)) := sorry

-- Test WeilRestriction.functor_affineLine
example (R : Type u) [CommRing R] [Algebra k R] :
    (Polynomial k' →ₐ[k'] k' ⊗[k] R) ≃ (k' ⊗[k] R) := sorry

-- Test WeilRestriction.functor_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (B : Type u) [CommRing B] [Algebra k B] :
    (B →ₐ[k] k ⊗[k] R) ≃ (B →ₐ[k] R) := sorry

-- Test WeilRestriction.functor_units
example (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (LaurentPolynomial k' →ₐ[k'] k' ⊗[k] R) ≃* (k' ⊗[k] R)ˣ :=
  TauCeti.MultiplicativeGroup.pointsMulEquiv

end Functor

-- Test WeilRestriction.functor_not_base_change
example : ¬ Nonempty (Res ℝ ℂ (Polynomial ℂ) ≃ₐ[ℝ] Polynomial ℝ) := sorry

section Representing

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A'] [Algebra k' A']

/-- The universal element `u : A' → k' ⊗_k Res A'`. -/
def universal : A' →ₐ[k'] k' ⊗[k] Res k k' A' := sorry

theorem homEquiv_apply (R : Type u) [CommRing R] [Algebra k R] (φ : Res k k' A' →ₐ[k] R) :
    homEquiv k k' A' R φ = (Algebra.TensorProduct.map (AlgHom.id k' k') φ).comp (universal k k' A') :=
  sorry

theorem homEquiv_naturality {R S : Type u} [CommRing R] [Algebra k R] [CommRing S] [Algebra k S]
    (ψ : R →ₐ[k] S) (φ : Res k k' A' →ₐ[k] R) :
    homEquiv k k' A' S (ψ.comp φ) =
      (Algebra.TensorProduct.map (AlgHom.id k' k') ψ).comp (homEquiv k k' A' R φ) := sorry

/-- Functoriality of the representing algebra. -/
def map {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A') :
    Res k k' B' →ₐ[k] Res k k' A' := sorry

@[simp] theorem map_id : map k k' A' (AlgHom.id k' A') = AlgHom.id k (Res k k' A') := sorry

theorem hom_ext {R : Type u} [CommRing R] [Algebra k R] {φ ψ : Res k k' A' →ₐ[k] R}
    (h : homEquiv k k' A' R φ = homEquiv k k' A' R ψ) : φ = ψ := sorry

/-- In a basis of a free extension, `Res` of affine `n`-space is affine `nd`-space in the
coordinates of the universal point; quotients by relations correspond to quotients by the basis
coordinates of the relations (stated in the roadmap). -/
theorem basisPresentation {d n : ℕ} (b : Module.Basis (Fin d) k k') :
    Nonempty (Res k k' (MvPolynomial (Fin n) k') ≃ₐ[k] MvPolynomial (Fin d × Fin n) k) := sorry

/-- For finitely presented `A'`, `Spec (Res A')` is the representing scheme of *Modular curves*
Layer 0F: `Res A'` is finitely presented. -/
theorem res_compat_modularCurves [Algebra.FinitePresentation k' A'] :
    Algebra.FinitePresentation k (Res k k' A') := sorry

-- Test WeilRestriction.res_affineLine_free
example {d : ℕ} (b : Module.Basis (Fin d) k k') :
    Nonempty (Res k k' (Polynomial k') ≃ₐ[k] MvPolynomial (Fin d) k) := sorry

-- Test WeilRestriction.res_self
example (B : Type u) [CommRing B] [Algebra k B] : Nonempty (Res k k B ≃ₐ[k] B) := sorry

-- Test WeilRestriction.res_units_complex
example : Nonempty (Res ℝ ℂ (LaurentPolynomial ℂ) ≃ₐ[ℝ]
    Localization.Away (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℝ)) :=
  sorry

-- Test WeilRestriction.res_not_flat
-- (BT II 1.5.8: there is a finite free extension of complete discrete valuation rings and a flat
-- affine scheme over the larger ring whose Weil restriction is not flat; no flatness lemma is
-- therefore stated for `Res`.)

/-- Finite type and finite presentation are inherited. -/
theorem finiteType_res [Algebra.FiniteType k' A'] : Algebra.FiniteType k (Res k k' A') := sorry

/-- Formal smoothness and smoothness are inherited. -/
theorem formallySmooth_res [Algebra.FormallySmooth k' A'] :
    Algebra.FormallySmooth k (Res k k' A') := sorry

theorem smooth_res [Algebra.Smooth k' A'] : Algebra.Smooth k (Res k k' A') := sorry

/-- Surjections (closed immersions) are preserved. -/
theorem map_surjective {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A')
    (hφ : Function.Surjective φ) : Function.Surjective (map k k' A' φ) := sorry

/-- The adjunction: `Hom_{k'}(A', k' ⊗_k B) ≃ Hom_k(Res A', B)`, natural in both variables, with
counit `universal` and unit the diagonal. -/
def adjunction (B : Type u) [CommRing B] [Algebra k B] :
    (A' →ₐ[k'] k' ⊗[k] B) ≃ (Res k k' A' →ₐ[k] B) := (homEquiv k k' A' B).symm

/-- The unit of the adjunction `Res_{k'/k}(k' ⊗_k B) → B` (the diagonal `X → Res(X_{k'})`). -/
def adjunctionUnit (B : Type u) [CommRing B] [Algebra k B] :
    Res k k' (k' ⊗[k] B) →ₐ[k] B := sorry

theorem adjunctionUnit_surjective [Module.FaithfullyFlat k k'] (B : Type u) [CommRing B]
    [Algebra k B] : Function.Surjective (adjunctionUnit k k' B) := sorry

end Representing

/-- Base change: `Res_{k'/k}(A') ⊗_k l ≃ Res_{l'/l}(A' ⊗_{k'} l')` with `l' = l ⊗_k k'`. -/
def baseChangeEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A'] [Algebra k' A']
    (l : Type u) [CommRing l] [Algebra k l] :
    letI : Algebra k' (l ⊗[k] k') := Algebra.TensorProduct.rightAlgebra
    l ⊗[k] Res k k' A' ≃ₐ[l] Res l (l ⊗[k] k') ((l ⊗[k] k') ⊗[k'] A') := sorry

/-- Transitivity for towers `k → k' → k''`. -/
def compEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (k'' : Type u) [CommRing k''] [Algebra k' k''] [Algebra k k''] [IsScalarTower k k' k'']
    (A'' : Type u) [CommRing A''] [Algebra k'' A''] :
    Res k k' (Res k' k'' A'') ≃ₐ[k] Res k k'' A'' := sorry

/-- Products: `Res(A' ⊗ B') ≃ Res A' ⊗ Res B'`. -/
def tensorEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B'] [Algebra k' B'] :
    Res k k' (A' ⊗[k'] B') ≃ₐ[k] Res k k' A' ⊗[k] Res k k' B' := sorry

/-- The splitting over a field `Ω` containing all conjugates: `Ω`-points of `Res A'` are tuples of
`Ω`-points of the conjugates `A' ⊗_{k',τ} Ω`, one for each `k`-embedding `τ : k' → Ω`. -/
def splittingEquiv (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω]
    [IsSepClosed Ω] (A' : Type u) [CommRing A'] [Algebra k' A'] :
    (Res k k' A' →ₐ[k] Ω) ≃
      ((τ : k' →ₐ[k] Ω) → (letI : Algebra k' Ω := τ.toRingHom.toAlgebra; A' →ₐ[k'] Ω)) := sorry

/-- Weil restriction along a finite separable extension preserves and reflects reductivity. -/
theorem reductive_res_iff (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k')
    (Hres : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (e : (Hres : Type u) ≃ₐ[k] Res k k' H) :
    TauCeti.reductiveCommHopfAlgProperty k Hres ↔ TauCeti.reductiveCommHopfAlgProperty k' H :=
  sorry

open scoped PointTopology in
/-- Topology on points: `Res(X')(R) ≃ₜ X'(k' ⊗_k R)` for a local field extension. -/
def pointsHomeomorph {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (E' : Type u) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
    [IsNonarchimedeanLocalField E'] [Algebra E E'] [FiniteDimensional E E'] (A' : Type u)
    [CommRing A'] [Algebra E' A'] :
    (Res E E' A' →ₐ[E] E) ≃ₜ (A' →ₐ[E'] E') := sorry

/-- Integral points of a Weil restriction of integral models. -/
def integralPointsEquiv (O : Type u) [CommRing O] (O' : Type u) [CommRing O'] [Algebra O O']
    [Module.Finite O O'] [Module.Free O O'] (A' : Type u) [CommRing A'] [Algebra O' A'] :
    (Res O O' A' →ₐ[O] O) ≃ (A' →ₐ[O'] O') := sorry

/-- The `O`-algebra automorphisms of `Res_{O'/O} A'` induced by an `O'`-semilinear action of a
group `Γ` on `A'` (compatible with an action of `Γ` on `O'` by `O`-algebra automorphisms). -/
def inducedAction (O : Type u) [CommRing O] (O' : Type u) [CommRing O'] [Algebra O O']
    [Module.Finite O O'] [Module.Projective O O'] (Γ : Type u) [Group Γ]
    (σO : Γ →* (O' ≃ₐ[O] O')) (A' : Type u) [CommRing A'] [Algebra O' A']
    (σA : Γ →* (A' ≃+* A')) (hσ : ∀ γ (c : O') (a : A'), σA γ (c • a) = σO γ c • σA γ a) :
    Γ →* (Res O O' A' ≃ₐ[O] Res O O' A') := sorry

/-- Edixhoven: for `|Γ|` invertible, the fixed-point algebra of the induced action (the quotient
by the ideal generated by `γ f - f`) is smooth when `A'` is smooth. -/
theorem smooth_fixedPoints (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (O' : Type u) [CommRing O'] [Algebra O O'] [Module.Finite O O'] [Module.Free O O']
    (Γ : Type u) [Group Γ] [Fintype Γ] (hΓ : IsUnit (Fintype.card Γ : O))
    (σO : Γ →* (O' ≃ₐ[O] O')) (A' : Type u) [CommRing A'] [Algebra O' A'] [Algebra.Smooth O' A']
    (σA : Γ →* (A' ≃+* A')) (hσ : ∀ γ (c : O') (a : A'), σA γ (c • a) = σO γ c • σA γ a) :
    Algebra.Smooth O (Res O O' A' ⧸ Ideal.span
      {f | ∃ (γ : Γ) (g : Res O O' A'), f = inducedAction O O' Γ σO A' σA hσ γ g - g}) := sorry

/-! ### Weil restriction of group schemes -/

/-- The Weil restriction of a commutative Hopf algebra, as a Hopf algebra. -/
def ResHopf (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (H' : Type u) [CommRing H'] [HopfAlgebra k' H'] : Type u := sorry

section Hopf

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k'] (H' : Type u) [CommRing H'] [HopfAlgebra k' H']

instance : CommRing (ResHopf k k' H') := sorry

instance instHopfAlgebraRes : HopfAlgebra k (ResHopf k k' H') := sorry

/-- The underlying algebra of `ResHopf` is `Res`. -/
def resHopfAlgEquiv : ResHopf k k' H' ≃ₐ[k] Res k k' H' := sorry

/-- Points of the Weil restriction are points over `k' ⊗_k R`, as groups. -/
def pointsMulEquiv (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' H' →ₐ[k] R) ≃* WithConv (H' →ₐ[k'] k' ⊗[k] R) := sorry

theorem pointsMulEquiv_naturality {R S : Type u} [CommRing R] [Algebra k R] [CommRing S]
    [Algebra k S] (ψ : R →ₐ[k] S) (x : WithConv (ResHopf k k' H' →ₐ[k] R)) :
    pointsMulEquiv k k' H' S (WithConv.toConv (ψ.comp x.ofConv)) =
      WithConv.toConv ((Algebra.TensorProduct.map (AlgHom.id k' k') ψ).comp
        (pointsMulEquiv k k' H' R x).ofConv) := sorry

/-- Functoriality in Hopf maps. -/
def mapHopf {H'' : Type u} [CommRing H''] [HopfAlgebra k' H''] (φ : H'' →ₐc[k'] H') :
    ResHopf k k' H'' →ₐc[k] ResHopf k k' H' := sorry

/-- The diagonal `G → Res_{k'/k}(G_{k'})` on points. -/
def diagonal (H : Type u) [CommRing H] [HopfAlgebra k H] (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (H →ₐ[k] R) →* WithConv (k' ⊗[k] H →ₐ[k'] k' ⊗[k] R) := sorry

/-- Points of `Res G_m` are units of `k' ⊗ R`. -/
def multiplicativeGroupPoints (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' (LaurentPolynomial k') →ₐ[k] R) ≃* (k' ⊗[k] R)ˣ :=
  (pointsMulEquiv k k' _ R).trans TauCeti.MultiplicativeGroup.pointsMulEquiv

/-- Points of `Res GL_n` are `GL_n(k' ⊗ R)`. -/
def generalLinearPoints (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' (TauCeti.GeneralLinear.coordinateHopfAlgebra k' n) →ₐ[k] R) ≃*
      Matrix.GeneralLinearGroup (Fin n) (k' ⊗[k] R) :=
  (pointsMulEquiv k k' _ R).trans (TauCeti.GeneralLinear.pointsMulEquiv n)

-- Test WeilRestriction.res_trivial_group
example : Nonempty (ResHopf k k' k' ≃ₐ[k] k) := sorry

-- Test WeilRestriction.pointsMulEquiv_generalLinear
example (n : ℕ) (R : Type u) [CommRing R] [Algebra k R]
    (x : WithConv (ResHopf k k' (TauCeti.GeneralLinear.coordinateHopfAlgebra k' n) →ₐ[k] R)) :
    generalLinearPoints k k' n R x =
      TauCeti.GeneralLinear.pointsMulEquiv n (pointsMulEquiv k k' _ R x) := sorry

end Hopf

/-- Character modules of Weil restrictions of split tori are induced modules; on points over a
separably closed `Ω`, the Weil restriction of a rank-`n` split torus is a product of copies of the
torus indexed by the embeddings, so its character module has rank `n · [k' : k]` and Galois
permutes the blocks. -/
theorem characterGroupEquivInduced (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω]
    [IsSepClosed Ω] (n : ℕ) :
    Nonempty (WithConv (ResHopf k k' (MonoidAlgebra k' (Multiplicative (Fin n →₀ ℤ))) →ₐ[k] Ω) ≃*
      ((k' →ₐ[k] Ω) → Fin n → Ωˣ)) := sorry


-- Test WeilRestriction.res_multiplicative_complex_points
example : WithConv (ResHopf ℝ ℂ (LaurentPolynomial ℂ) →ₐ[ℝ] ℝ) ≃* (ℂ ⊗[ℝ] ℝ)ˣ :=
  multiplicativeGroupPoints ℝ ℂ ℝ

-- Test WeilRestriction.res_not_commutative_of_commutative_base
example : ¬ ∀ x y : WithConv (ResHopf ℝ ℂ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℂ 2) →ₐ[ℝ] ℝ),
    x * y = y * x := sorry

end WeilRestriction

namespace NormTorus

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Free k k']

/-- The norm `Res_{k'/k} G_m → G_m` on points: the algebra norm of `R ⊗_k k'` over `R`, on units. -/
def norm (R : Type u) [CommRing R] [Algebra k R] : (k' ⊗[k] R)ˣ →* Rˣ := sorry

theorem norm_points (R : Type u) [CommRing R] [Algebra k R] (x : (k' ⊗[k] R)ˣ) :
    ((norm k k' R x : Rˣ) : R) =
      Algebra.norm R ((Algebra.TensorProduct.comm k k' R) (x : k' ⊗[k] R)) := sorry

/-- The norm-one subgroup of points. -/
def normOne (R : Type u) [CommRing R] [Algebra k R] : Subgroup (k' ⊗[k] R)ˣ := (norm k k' R).ker

theorem norm_comp_diagonal (R : Type u) [CommRing R] [Algebra k R] (r : Rˣ) :
    norm k k' R (Units.map (Algebra.TensorProduct.includeRight).toMonoidHom r) =
      r ^ Module.finrank k k' := sorry

theorem normOne_isTorus (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K'] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hH : ∀ (R : Type u) [CommRing R] [Algebra K R],
      Nonempty (WithConv ((H : Type u) →ₐ[K] R) ≃* normOne K K' R)) :
    TauCeti.torusCommHopfAlgProperty K H := sorry

/-- Over a separably closed field the norm-one torus splits with rank `[K' : K] - 1`. -/
theorem characterGroup_normOne (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K'] (Ω : Type u) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] :
    Nonempty (normOne K K' Ω ≃* (Fin (Module.finrank K K' - 1) → Ωˣ)) := sorry

/-- `Res_{k'/k} μ_n` modulo the diagonal `μ_n`, on points. -/
def resRootsOfUnityQuotient (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] :
    Subgroup (k' ⊗[k] R)ˣ := sorry

-- Test NormTorus.norm_complex
example (x y : ℝ) (h : (⟨x, y⟩ : ℂ) ≠ 0) :
    Algebra.norm ℝ (⟨x, y⟩ : ℂ) = x ^ 2 + y ^ 2 := sorry

-- Test NormTorus.norm_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (x : (k ⊗[k] R)ˣ) :
    ((norm k k R x : Rˣ) : R) = (Algebra.TensorProduct.lid k R) (x : k ⊗[k] R) := sorry

-- Test NormTorus.normOne_compat_specialOrthogonal
-- (the norm-one torus of `ℂ/ℝ` is Tau Ceti's `SO₂` over `ℝ`; both are tori with real points the
-- unit circle; stated in the roadmap.)

-- Test NormTorus.norm_not_surjective_points
example : ¬ Function.Surjective (Algebra.norm ℝ (S := ℂ)) := sorry

end NormTorus

namespace DeligneTorus

/-- The Deligne torus `S = Res_{ℂ/ℝ} G_m`. -/
abbrev S : Type := WeilRestriction.ResHopf ℝ ℂ (LaurentPolynomial ℂ)

/-- Points of `S` over an `ℝ`-algebra `R` are `(ℂ ⊗_ℝ R)ˣ`. -/
def pointsMulEquiv (R : Type) [CommRing R] [Algebra ℝ R] :
    WithConv (S →ₐ[ℝ] R) ≃* (ℂ ⊗[ℝ] R)ˣ :=
  WeilRestriction.multiplicativeGroupPoints ℝ ℂ R

/-- `S(ℝ) ≃* ℂˣ`. -/
def realPointsMulEquiv : WithConv (S →ₐ[ℝ] ℝ) ≃* ℂˣ := sorry

/-- The splitting `S(ℂ) ≃* ℂˣ × ℂˣ`, normalized so that `S(ℝ) → S(ℂ)` is `z ↦ (z, conj z)`. -/
def complexSplitting : WithConv (S →ₐ[ℝ] ℂ) ≃* ℂˣ × ℂˣ := sorry

theorem complexSplitting_real (z : WithConv (S →ₐ[ℝ] ℝ)) :
    complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp z.ofConv)) =
      (Units.map (RingHom.id ℂ).toMonoidHom (realPointsMulEquiv z),
        Units.map (starRingEnd ℂ).toMonoidHom (realPointsMulEquiv z)) := sorry

/-- Complex conjugation on `S(ℂ)` swaps the factors (with conjugation). -/
theorem conj_swap (z : WithConv (S →ₐ[ℝ] ℂ)) :
    complexSplitting (WithConv.toConv ((Complex.conjAe.toAlgHom).comp z.ofConv)) =
      (Units.map (starRingEnd ℂ).toMonoidHom (complexSplitting z).2,
        Units.map (starRingEnd ℂ).toMonoidHom (complexSplitting z).1) := sorry

/-- The diagonal cocharacter `d : G_m → S`, `r ↦ r` on real points. -/
def diagonal : ℝˣ →* WithConv (S →ₐ[ℝ] ℝ) :=
  realPointsMulEquiv.symm.toMonoidHom.comp (Units.map (algebraMap ℝ ℂ).toMonoidHom)

/-- The weight cocharacter `w = d ∘ inv` (Deligne's normalization). -/
def weight : ℝˣ →* WithConv (S →ₐ[ℝ] ℝ) := diagonal.comp (MulEquiv.inv ℝˣ).toMonoidHom

/-- The norm character `Nm : S → G_m`, `z ↦ z z̄`. -/
def norm : WithConv (S →ₐ[ℝ] ℝ) →* ℝˣ := sorry

/-- The cocharacter `μ : G_{m,ℂ} → S_ℂ`, `z ↦ (z, 1)`. -/
def mu : ℂˣ →* WithConv (S →ₐ[ℝ] ℂ) := complexSplitting.symm.toMonoidHom.comp (MonoidHom.inl ℂˣ ℂˣ)

/-- The characters of `S`: `(p, q) ↦ ((z₁, z₂) ↦ z₁^p z₂^q)` on `S(ℂ) ≃ ℂˣ × ℂˣ`. -/
def characterGroup (pq : ℤ × ℤ) : WithConv (S →ₐ[ℝ] ℂ) →* ℂˣ :=
  ((zpowGroupHom pq.1).comp (MonoidHom.fst ℂˣ ℂˣ) * (zpowGroupHom pq.2).comp (MonoidHom.snd ℂˣ ℂˣ)).comp
    complexSplitting.toMonoidHom

/-- Complex conjugation exchanges the characters `(p, q)` and `(q, p)`. -/
theorem characterGroup_conj (p q : ℤ) (z : WithConv (S →ₐ[ℝ] ℂ)) :
    characterGroup (p, q) (WithConv.toConv ((Complex.conjAe.toAlgHom).comp z.ofConv)) =
      Units.map (starRingEnd ℂ).toMonoidHom (characterGroup (q, p) z) := sorry

-- Test DeligneTorus.norm_diagonal
example (r : ℝˣ) : norm (diagonal r) = r ^ 2 := sorry

-- Test DeligneTorus.weight_eq_inv_diagonal
example (r : ℝˣ) : weight r = (diagonal r)⁻¹ := sorry

-- Test DeligneTorus.realPoints_compat_GL2
-- (composing `S(ℝ) ≃ ℂˣ` with `TauCeti.GL2NonSplitTorusHom` for `ℂ/ℝ` gives
-- `x + iy ↦ ((x, -y), (y, x))` with determinant the norm.)

-- Test DeligneTorus.not_split
example : ¬ Nonempty (WithConv (S →ₐ[ℝ] ℝ) ≃* ℝˣ × ℝˣ) := sorry

-- Test DeligneTorus.kernel_norm_compact
example : ∀ z ∈ norm.ker, ‖((realPointsMulEquiv z : ℂˣ) : ℂ)‖ = 1 := sorry

end DeligneTorus


/-! ## RG2.1 — Relative roots and valued root data -/

namespace BruhatTits

open ValuativeRel

/-! ### Rational maximal unramified split tori -/

/-- A maximal unramified-split torus defined over the base field and containing a maximal split
torus. The existence of such a torus is not expressible before the anchor's Layer 7 provides
maximal split tori; what is stated is its consequence on the imported data: for the base change
`HL = Ĕ ⊗ H` with its local root data, the split rank over `E` is at most the split rank over `Ĕ`,
and the `E`-apartment directions embed into the `Ĕ`-apartment directions. -/
theorem exists_rational_maximalUnramifiedSplitTorus {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E)
    (_hH : TauCeti.reductiveCommHopfAlgProperty E H) (D : LocalRootData E H)
    (HL : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} (MaxUnramifiedCompletion.Breve E))
    (_e : (MaxUnramifiedCompletion.Breve E ⊗[E] (H : Type u)) ≃ₐ[MaxUnramifiedCompletion.Breve E]
      (HL : Type u))
    (DL : LocalRootData (MaxUnramifiedCompletion.Breve E) HL) :
    ∃ f : D.V →ₗ[ℝ] DL.V, Function.Injective f := sorry

/-! ### Abstract root data and valuations -/

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

namespace RootDatum

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}

/-- The group `N` generated by `T` and the elements `m(u)`, `u ∈ U_a ∖ {1}`. -/
def weylNormalizer (D : RootDatum G Φ) : Subgroup G := sorry

theorem T_le_weylNormalizer (D : RootDatum G Φ) : D.T ≤ D.weylNormalizer := sorry

/-- `N/T ≃ W(Φ)`. -/
def weylGroupEquiv (D : RootDatum G Φ) :
    D.weylNormalizer ⧸ D.T.subgroupOf D.weylNormalizer ≃ Φ.weylGroup := sorry

/-- A root datum is generating if `T` and the root subgroups generate `G`. -/
def IsGenerating (D : RootDatum G Φ) : Prop :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) = ⊤

end RootDatum

-- Test BruhatTits.RootDatum.sl2
example (K : Type) [Field K] :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ),
      D.IsGenerating := sorry

-- Test BruhatTits.RootDatum.rankZero
example {G : Type v} [Group G] (Φ : RootPairing PEmpty ℝ M N) (T : Subgroup G) :
    ∃ D : RootDatum G Φ, D.T = T := sorry

-- Test BruhatTits.RootDatum.unitary_BC1
-- (the quasi-split `SU₃` gives a root datum of type `BC₁`, with `U_{2a} ⊆ U_a`; stated in the
-- roadmap, the unitary group scheme is not yet in the pinned library.)

-- Test BruhatTits.RootDatum.not_of_trivial_U
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) (i : ι) :
    D.U i ≠ ⊥ := D.U_ne_bot i

namespace Valuation

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

theorem filtration_antitone (i : ι) : Antitone (φ.filtration i) := sorry

/-- The value set `Γ_a = φ_a(U_a ∖ {1})`. -/
def valueSet (i : ι) : Set ℝ := {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ)}

/-- The equipollent valuation `φ + v`. -/
def shift (φ : Valuation D) (v : N) : Valuation D := sorry

theorem shift_apply (v : N) (i : ι) (u : D.U i) :
    (φ.shift v).φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := sorry

/-- Transport of a valuation by an element of `N`. -/
def smul (φ : Valuation D) (n : D.weylNormalizer) : Valuation D := sorry

/-- A valuation is discrete if every value set is discrete. -/
def IsDiscrete : Prop := ∀ i, DiscreteTopology (φ.valueSet i)

-- Test BruhatTits.Valuation.shift_zero
example : φ.shift 0 = φ := sorry

end Valuation

/-- Compatibility of a valuation of the rational root datum with the valuation of the field:
conjugation by `z ∈ Z(K)` shifts the filtrations by `a(v(z))`, where `v` is the valuation
homomorphism of the minimal Levi. -/
def Valuation.IsCompatible {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (v : D.rootDatum.T →* Multiplicative D.V) (φ : Valuation D.rootDatum) : Prop :=
  ∀ (i : D.ι) (z : D.rootDatum.T) (r : ℝ),
    (φ.filtration i r).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
      φ.filtration i (r + D.Φ.toLinearMap (D.Φ.root i) (Multiplicative.toAdd (v z)))

-- Test BruhatTits.Valuation.sl2_standard
-- (for `SL₂(K)`, `φ_±(x_±(u)) = ω(u)` is a valuation; stated in the roadmap.)

-- Test BruhatTits.Valuation.not_valuation_wrong_sign
-- (for `SL₂`, `φ_+ = ω`, `φ_- = -ω` violates axiom V5; stated in the roadmap.)

-- Test BruhatTits.Valuation.compatible_gl_n
-- (for `GL_n`, `φ_{ij}(1 + c e_{ij}) = ω(c)` is compatible; stated in the roadmap.)

/-- The rational points of a reductive group carry the imported root datum (Borel–Tits). -/
theorem rationalPointsRootDatum {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H) :
    D.rootDatum.T ≤ D.normalizer :=
  D.T_le_normalizer

/-! ### The valuation homomorphism of the minimal Levi -/

section TorusValuation

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H)

/-- `v : Z(K) → V`, `⟨χ, v(z)⟩ = -ω(χ(z))`. -/
def torusValuationMap : D.rootDatum.T →* Multiplicative D.V := sorry

/-- The defining property on rational characters, stated for the roots: with the valuation
normalized by `ω(ϖ) = 1`, `⟨a, v(z)⟩ = -ω(a(z))` is an integer. -/
theorem torusValuationMap_apply_character [ValuativeRel.IsDiscrete K] (i : D.ι)
    (z : D.rootDatum.T) :
    ∃ k : ℤ, D.Φ.toLinearMap (D.Φ.root i) (Multiplicative.toAdd (torusValuationMap D z)) = k :=
  sorry

/-- The maximal bounded subgroup `Z(K)^1 = ker v`. -/
def boundedPart : Subgroup D.rootDatum.T := (torusValuationMap D).ker

open scoped PointTopology in
theorem boundedPart_isCompact [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    IsCompact (((boundedPart D).map D.rootDatum.T.subtype : Subgroup _) :
      Set (WithConv ((H : Type u) →ₐ[K] K))) := sorry

/-- The translation lattice `Λ = v(Z(K))`. -/
def translationLattice : Set D.V :=
  Set.range fun z => Multiplicative.toAdd (torusValuationMap D z)

theorem translationLattice_span : Submodule.span ℝ (translationLattice D) = ⊤ := sorry

/-- Conjugation by `N(K)` transports `v` through the Weyl action. -/
theorem torusValuationMap_conj (n : D.normalizer) (z : D.rootDatum.T)
    (hz : (n : WithConv ((H : Type u) →ₐ[K] K)) * (z : WithConv ((H : Type u) →ₐ[K] K)) *
      (n : WithConv ((H : Type u) →ₐ[K] K))⁻¹ ∈ D.rootDatum.T) :
    ∃ w : D.Φ.weylGroup, Multiplicative.toAdd (torusValuationMap D ⟨_, hz⟩) =
      ((w : RootPairing.Aut D.Φ).coweightEquiv).symm
        (Multiplicative.toAdd (torusValuationMap D z)) :=
  sorry

-- Test BruhatTits.torusValuationMap_split
-- (for `S = G_m²` and `t = (ϖ, 1)`, `v(t) = (-1, 0)`; stated in the roadmap.)

-- Test BruhatTits.torusValuationMap_anisotropic
example (_h : Subsingleton D.V) : boundedPart D = ⊤ := sorry

-- Test BruhatTits.torusValuationMap_gl_n_compat
-- (for `GL_n`, `v(diag(t)) = -(ω(t_i))_i` and `ker v` is the diagonal torus over `𝒪`.)

-- Test BruhatTits.torusValuationMap_not_injective_on_units
example (_h : Nontrivial (boundedPart D)) : ¬ Function.Injective (torusValuationMap D) := sorry

end TorusValuation

/-! ### The apartment -/

namespace Apartment

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

theorem vadd_def (v : N) (ψ : Apartment φ) (i : ι) (u : D.U i) :
    (v +ᵥ ψ).1.φ i u = ψ.1.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := sorry

/-- The affine action `ν : N → Aff(A)`. -/
def action : D.weylNormalizer →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry

/-- The linear part of `ν(n)` is the action of the image of `n` in the Weyl group. -/
theorem action_linear (n : D.weylNormalizer) :
    ∃ w : Φ.weylGroup, ∀ x : N,
      (action φ n).linear x = ((w : RootPairing.Aut Φ).coweightEquiv).symm x := sorry

/-- The filtration at a point: `U_{a,x,r}`. -/
def filtrationAt (x : Apartment φ) (i : ι) (r : ℝ) : Subgroup G := sorry

/-- The kernel of the action is the bounded part of `T` (stated for the abstract datum as the
pointwise stabilizer of the apartment inside `N`). -/
theorem ker_action : (action φ).ker ≤ D.T.subgroupOf D.weylNormalizer := sorry

/-- Transport: equipollent base valuations give canonically isomorphic apartments. -/
def transport (ψ : Valuation D) (_h : Equipollent φ ψ) : Apartment φ ≃ᵃ[ℝ] Apartment ψ := sorry

-- Test BruhatTits.Apartment.rankZero_singleton
example [Subsingleton N] : Subsingleton (Apartment φ) := sorry

-- Test BruhatTits.Apartment.addTorsor_compat
example (ψ₁ ψ₂ : Apartment φ) : (ψ₁ -ᵥ ψ₂) +ᵥ ψ₂ = ψ₁ := vsub_vadd ψ₁ ψ₂

-- Test BruhatTits.Apartment.sl2_reflection
-- (for `SL₂` the Weyl element acts on `A ≅ ℝ` by the reflection fixing the base valuation.)

-- Test BruhatTits.Apartment.not_linear_space
-- (different Chevalley–Steinberg systems give different base points; no canonical origin.)

end Apartment

/-- On the rational apartment, `z ∈ Z(K)` acts by translation by `v(z)` (compatible valuations). -/
theorem Apartment.action_torus {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) (_hφ : φ.IsCompatible D (torusValuationMap D))
    (z : D.rootDatum.T)
    (hz : (z : WithConv ((H : Type u) →ₐ[K] K)) ∈ D.rootDatum.weylNormalizer)
    (x : Apartment φ) :
    Apartment.action φ ⟨(z : WithConv ((H : Type u) →ₐ[K] K)), hz⟩ x =
      Multiplicative.toAdd (torusValuationMap D z) +ᵥ x := sorry

/-! ### Affine roots -/

/-- An affine root `a + k` with `a ∈ Φ` and `k` in the value set of `a`. -/
structure AffineRoot {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) where
  /-- The gradient `a`. -/
  gradient : ι
  /-- The constant `k`. -/
  constant : ℝ
  mem_valueSet : constant ∈ φ.valueSet gradient

namespace AffineRoot

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The wall `{α = 0}` in the apartment. -/
def wall (α : AffineRoot φ) : Set (Apartment φ) := sorry

/-- The root subgroup `U_α = U_{a,k}`. -/
def rootSubgroup (α : AffineRoot φ) : Subgroup G := φ.filtration α.gradient α.constant

theorem rootSubgroup_mono (α β : AffineRoot φ) (h : α.gradient = β.gradient)
    (hk : α.constant ≤ β.constant) : β.rootSubgroup ≤ α.rootSubgroup := sorry

/-- The set `Γ'_a` of constants of affine roots with gradient `a`. -/
def valueSet (φ : Valuation D) (i : ι) : Set ℝ :=
  {k | ∃ α : AffineRoot φ, α.gradient = i ∧ α.constant = k}

theorem filtrationAt_succ (x : Apartment φ) (i : ι) (r : ℝ) :
    (Apartment.filtrationAt φ x i (r + 1)) ≤ Apartment.filtrationAt φ x i r := sorry

/-- Commutator estimates at a point. -/
theorem commutator_le (x : Apartment φ) (i j : ι) (r s : ℝ)
    (hij : ∀ c : ℝ, Φ.root j ≠ c • Φ.root i) :
    ⁅Apartment.filtrationAt φ x i r, Apartment.filtrationAt φ x j s⁆ ≤
      ⨆ (k : ι) (p : ℕ) (q : ℕ) (_ : 0 < p ∧ 0 < q ∧
        Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
        Apartment.filtrationAt φ x k (p * r + q * s) := sorry

-- Test BruhatTits.AffineRoot.rootSubgroup_top
example (α : AffineRoot φ) : φ.filtration α.gradient α.constant = α.rootSubgroup := rfl

-- Test BruhatTits.AffineRoot.sl2_affine_roots
-- (for `SL₂`, the affine roots are `±a + n`, `n ∈ ℤ`, and `U_{a+n} = x_+(ϖⁿ 𝒪)`.)

-- Test BruhatTits.AffineRoot.gl_n_compat
-- (for `GL_n`, `U_{a+k} = 1 + ϖ^⌈k⌉ 𝒪 e_{ij}`, matching `TauCeti.GeneralLinear.rootSubgroup`.)

-- Test BruhatTits.AffineRoot.not_all_values
-- (for a ramified unitary group `Γ'_a ≠ Γ_a`.)

end AffineRoot

/-! ### Quasi-split coordinates -/

namespace QuasiSplit

/-- The group `H₀(K', K) = {(u, v) : v + v̄ = u ū}` with `(u,v)(u',v') = (u+u', v+v'+ū u')`. -/
def H0 (K' : Type u) [Field K'] [StarRing K'] : Type u :=
  {p : K' × K' // p.2 + star p.2 = p.1 * star p.1}

instance (K' : Type u) [Field K'] [StarRing K'] : Group (H0 K') where
  mul x y := ⟨(x.1.1 + y.1.1, x.1.2 + y.1.2 + star x.1.1 * y.1.1), sorry⟩
  one := ⟨(0, 0), by simp⟩
  inv x := ⟨(-x.1.1, star x.1.2), sorry⟩
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv_mul_cancel := sorry

/-- The field of definition `K_a` of a relative root: the fixed field of the stabilizer of an
absolute root restricting to it, inside a separable closure. -/
def rootField {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) (i : D.ι) : IntermediateField K (AlgebraicClosure K) := sorry

/-- The coordinates `x_a : K_a → U_a(K)` of a non-multipliable root of a quasi-split group,
recorded for `GL_n` as the Tau Ceti root subgroups. -/
def rootGroupCoord (K : Type u) [Field K] (n : ℕ) (i j : Fin n) (_hij : i ≠ j) :
    Multiplicative K →* Matrix.GeneralLinearGroup (Fin n) K := sorry

/-- The diagonal element `diag(t)` of `GL_n(K)`, for a unit `t` of `Kⁿ`. -/
def diagonalElement (K : Type u) [Field K] (n : ℕ) (t : (Fin n → K)ˣ) :
    Matrix.GeneralLinearGroup (Fin n) K :=
  Units.map (Matrix.diagonalRingHom (Fin n) K).toMonoidHom t

theorem rootGroupCoord_conj_torus (K : Type u) [Field K] (n : ℕ) (i j : Fin n) (hij : i ≠ j)
    (t : (Fin n → K)ˣ) (c : K) :
    diagonalElement K n t * rootGroupCoord K n i j hij (Multiplicative.ofAdd c) *
        (diagonalElement K n t)⁻¹ =
      rootGroupCoord K n i j hij
        (Multiplicative.ofAdd ((t : Fin n → K) i * ((t : Fin n → K) j)⁻¹ * c)) := sorry

/-- The rank-one subgroup generated by `U_{±a}` (for `GL_n`: a copy of `SL₂`). -/
def rankOneSubgroup (K : Type u) [Field K] (n : ℕ) (i j : Fin n) (_hij : i ≠ j) :
    Subgroup (Matrix.GeneralLinearGroup (Fin n) K) := sorry

/-- van Hoften's unitary coordinates `u_i(c, d) = I + g` (rows and columns indexed `-1, 0, 1`):
`g_{-1,0} = -τ c`, `g_{0,1} = c`, `g_{-1,1} = d`. -/
def unitaryCoord (K' : Type u) [Field K'] (τ : K' ≃+* K') (c d : K') :
    Matrix (Fin 3) (Fin 3) K' :=
  Matrix.of ![![1, -τ c, d], ![0, 1, c], ![0, 0, 1]]

/-- The antidiagonal hermitian form defining `SU₃`. -/
def antidiagonalForm (K' : Type u) [Field K'] : Matrix (Fin 3) (Fin 3) K' :=
  Matrix.of ![![0, 0, 1], ![0, 1, 0], ![1, 0, 0]]

/-- The unitary condition `τ(c) c + d + τ(d) = 0` for `u_i(c, d)` to lie in `SU₃`. -/
theorem unitaryCoord_mem_iff (K' : Type u) [Field K'] (τ : K' ≃+* K') (c d : K') :
    (Matrix.of fun i j => τ (unitaryCoord K' τ c d j i)) * antidiagonalForm K' *
        unitaryCoord K' τ c d = antidiagonalForm K' ↔
      τ c * c + d + τ d = 0 := sorry

/-- A quasi-split group has a compatible valuation of its rational root datum, defined by a
Chevalley–Steinberg system (Bruhat–Tits II 4.2.2–4.2.10). The Borel subgroup over `K` is passed
as its Hopf ideal (the Borel predicate is not among the compiled modules). -/
theorem valuation {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (_B : TauCeti.HopfIdeal K H) (D : LocalRootData K H) :
    ∃ φ : Valuation D.rootDatum, φ.IsCompatible D (torusValuationMap D) := sorry

-- Test BruhatTits.QuasiSplit.H0_mul_assoc
-- (associativity and inverse `(u,v)⁻¹ = (-u, v̄)` of the law on `H₀`; stated in the roadmap.)

-- Test BruhatTits.QuasiSplit.split_case
-- (for split `G` every `K_a = K` and `x_a` is the pinning.)

-- Test BruhatTits.QuasiSplit.gl_n_compat
-- (for `GL_n`, `x_{e_i - e_j}(c) = 1 + c e_{ij}`, Tau Ceti `GeneralLinear.rootSubgroupPoints`.)

-- Test BruhatTits.QuasiSplit.not_additive_multipliable
-- (`H₀(K_a, K_{2a})` is not commutative.)

end QuasiSplit

/-! ### Existence, descent, facets, échelonnage, affine Weyl group -/

/-- Existence of a compatible valuation of the rational root datum (Bruhat–Tits II 5.1.20). -/
theorem exists_valuation_compatible {K : Type u} [Field K] [ValuativeRel K]
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [HenselianLocalRing 𝒪[K]]
    [PerfectField 𝓀[K]] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (_hH : TauCeti.reductiveCommHopfAlgProperty K H) (D : LocalRootData K H) :
    ∃ φ : Valuation D.rootDatum, φ.IsCompatible D (torusValuationMap D) ∧
      ∀ ψ : Valuation D.rootDatum, ψ.IsCompatible D (torusValuationMap D) → Equipollent φ ψ :=
  sorry

/-- Unramified descent: the rational apartment is the Frobenius-fixed part of the apartment over
the completed maximal unramified extension (as an injective affine map). -/
theorem apartment_eq_fixedPoints {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (D : LocalRootData E H) (φ : Valuation D.rootDatum)
    {N' : Type u} [AddCommGroup N'] [Module ℝ N'] (P' : Type u) [AddTorsor N' P']
    (σ : P' ≃ᵃ[ℝ] P') :
    ∃ j : Apartment φ →ᵃ[ℝ] P', Function.Injective j ∧ Set.range j = {x | σ x = x} := sorry

/-- Facets of the apartment. -/
def Facet {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) := sorry

namespace Facet

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The union of all walls. -/
def wall (φ : Valuation D) : Set (Apartment φ) := ⋃ α : AffineRoot φ, α.wall

/-- The underlying set of a facet. -/
def carrier (F : Facet φ) : Set (Apartment φ) := sorry

def IsAlcove (F : Facet φ) : Prop := F.carrier ∩ wall φ = ∅

/-- Evaluation of an affine root at a point of the apartment. -/
def _root_.BruhatTits.AffineRoot.eval (α : AffineRoot φ) (x : Apartment φ) : ℝ := sorry

/-- The closure order: every affine root nonnegative on `F'` is nonnegative on `F` (equivalently,
`F` lies in the closure of `F'`). -/
def le (F F' : Facet φ) : Prop :=
  ∀ α : AffineRoot φ, (∀ x ∈ F'.carrier, 0 ≤ α.eval x) → ∀ x ∈ F.carrier, 0 ≤ α.eval x

/-- Facets are determined by their sign patterns: the closure order is antisymmetric. -/
theorem le_iff (F F' : Facet φ) : F.le F' ∧ F'.le F ↔ F = F' := sorry

def IsSpecial (x : Apartment φ) : Prop :=
  ∀ i : ι, ∃ α : AffineRoot φ, α.gradient = i ∧ x ∈ α.wall

/-- For a discrete valuation the walls are locally finite: only finitely many walls meet any
segment of the apartment (stated through the torsor structure, the apartment carrying no
topology at the pins). -/
theorem locallyFinite (hφ : φ.IsDiscrete) (x : Apartment φ) (v : N) :
    {α : AffineRoot φ | ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ (t • v) +ᵥ x ∈ α.wall}.Finite := sorry

-- Test BruhatTits.Facet.rankZero
example [IsEmpty ι] (x : Apartment φ) : x ∉ wall φ := sorry

-- Test BruhatTits.Facet.sl2_alcoves
-- (for `SL₂` the alcoves are the open intervals between consecutive walls of `½ℤ`.)

-- Test BruhatTits.Facet.not_special_barycentre
-- (the barycentre of an alcove of `SL₂` lies on no wall, so it is not special.)

-- Test BruhatTits.Facet.pgl3_alcove_triangle
-- (every alcove of `PGL₃` has three special vertices.)

end Facet

/-- The échelonnage root system: a reduced root pairing whose roots are positive multiples of
the roots of `Φ` and whose affine Weyl group is generated by the wall reflections. -/
def echelonnage {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : RootPairing ι ℝ M N := sorry

section Echelonnage

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

theorem echelonnage_isReduced : (echelonnage φ).IsReduced := sorry

theorem echelonnage_proportional (i : ι) :
    ∃ c : ℝ, 0 < c ∧ (echelonnage φ).root i = c • Φ.root i := sorry

theorem echelonnage_walls (x₀ : Apartment φ) (hx₀ : Facet.IsSpecial x₀) (α : AffineRoot φ) :
    ∃ (i : ι) (k : ℤ), ∀ x ∈ α.wall,
      (echelonnage φ).toLinearMap ((echelonnage φ).root i) (x -ᵥ x₀) = k := sorry

theorem echelonnage_split [Φ.IsReduced]
    (h : ∀ i, φ.valueSet i = Set.range (Int.cast : ℤ → ℝ)) : echelonnage φ = Φ := sorry

-- Test BruhatTits.echelonnage_rank_zero
example [IsEmpty ι] : (echelonnage φ).IsReduced := echelonnage_isReduced φ

-- Test BruhatTits.echelonnage_sl2
-- (for `SL₂`, `Σ = {±a}`.)

-- Test BruhatTits.echelonnage_unramified_unitary
-- (for the unramified quasi-split `U₃`, `Σ` is of type `A₁`.)

-- Test BruhatTits.echelonnage_ne_relative
-- (for a ramified quasi-split unitary group in `2n+1` variables, `Σ` and `Φ_red` differ.)

end Echelonnage

/-- The affine Weyl group: affine automorphisms of the apartment generated by wall reflections. -/
def AffineWeylGroup {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Subgroup (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry

namespace AffineWeylGroup

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

/-- The simple reflections in the walls of a chosen alcove. -/
def simpleReflections (C : Facet φ) : Set (AffineWeylGroup φ) := sorry

/-- The Coxeter system on the simple reflections of an alcove. -/
def coxeterSystem (C : Facet φ) (_hC : C.IsAlcove) :
    Σ (B : Type (max u v)) (Mx : CoxeterMatrix B), CoxeterSystem Mx (AffineWeylGroup φ) := sorry

theorem simplyTransitive_alcoves (C C' : Facet φ) (hC : C.IsAlcove) (hC' : C'.IsAlcove) :
    ∃! w : AffineWeylGroup φ,
      ⇑(w : Apartment φ ≃ᵃ[ℝ] Apartment φ) '' C.carrier = C'.carrier := sorry

theorem semidirect (x : Apartment φ) (hx : Facet.IsSpecial x) :
    ∀ w : AffineWeylGroup φ, ∃ (v : N) (w0 : Φ.weylGroup), ∀ y,
      (w : Apartment φ ≃ᵃ[ℝ] Apartment φ) y =
        ((w0 : RootPairing.Aut Φ).coweightEquiv).symm (y -ᵥ x) +ᵥ (v +ᵥ x) := sorry

theorem normal_in_image : (AffineWeylGroup φ).Normal := sorry

-- Test BruhatTits.AffineWeylGroup.rankZero_trivial
example [IsEmpty ι] : AffineWeylGroup φ = ⊥ := sorry

-- Test BruhatTits.AffineWeylGroup.sl2_infinite_dihedral
-- (for `SL₂`, `W_a` is infinite dihedral.)

-- Test BruhatTits.AffineWeylGroup.finite_quotient_compat
-- (the linear parts of `W_a` form `RootPairing.weylGroup` of `Φ`.)

-- Test BruhatTits.AffineWeylGroup.not_all_of_N
-- (for `PGL₂`, `ν(N(K)) ⊋ W_a`.)

end AffineWeylGroup

/-! ### Levi subgroups of apartment vectors and Frobenius -/

section Levi

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ)

/-- `M_v`: generated by `T` and the root subgroups of roots vanishing on `v`. -/
def leviOfVector (v : N) : Subgroup G :=
  Subgroup.closure
    ((D.T : Set G) ∪ ⋃ (i : ι) (_ : Φ.toLinearMap (Φ.root i) v = 0), (D.U i : Set G))

theorem leviOfVector_eq_top_iff (hgen : D.IsGenerating) (v : N) :
    leviOfVector D v = ⊤ ↔ ∀ i, Φ.toLinearMap (Φ.root i) v = 0 := sorry

theorem leviOfVector_smul (v : N) (c : ℝ) (hc : 0 < c) :
    leviOfVector D (c • v) = leviOfVector D v := sorry

theorem leviOfVector_conj (v : N) (n : D.weylNormalizer) :
    ∃ w : Φ.weylGroup, (leviOfVector D v).map (MulAut.conj (n : G)).toMonoidHom =
      leviOfVector D (((w : RootPairing.Aut Φ).coweightEquiv).symm v) := sorry

/-- An automorphism `σ` of `G` permuting the datum compatibly with a linear map `σN` of `N`
transports `M_v` to `M_{σN v}`; in particular `M_v` is `σ`-stable when `σN v = v`. -/
theorem leviOfVector_descends (v : N) (σG : G ≃* G) (σι : ι ≃ ι) (σN : N ≃ₗ[ℝ] N)
    (hT : D.T.map σG.toMonoidHom = D.T) (hU : ∀ i, (D.U i).map σG.toMonoidHom = D.U (σι i))
    (hroot : ∀ i w, Φ.toLinearMap (Φ.root (σι i)) (σN w) = Φ.toLinearMap (Φ.root i) w) :
    (leviOfVector D v).map σG.toMonoidHom = leviOfVector D (σN v) := sorry

-- Test BruhatTits.leviOfVector_zero
example : leviOfVector D 0 = Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) := by
  simp [leviOfVector]

-- Test BruhatTits.leviOfVector_regular
example (v : N) (hv : ∀ i, Φ.toLinearMap (Φ.root i) v ≠ 0) :
    leviOfVector D v = Subgroup.closure (D.T : Set G) := sorry

-- Test BruhatTits.leviOfVector_gl3
-- (for `GL₃` and `v = (1,1,0)`, `M_v = GL₂ × GL₁`.)

-- Test BruhatTits.leviOfVector_not_parabolic
-- (`M_v` omits the root groups with `⟨a, v⟩ > 0`.)

end Levi

section Frobenius

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

/-- The affine Frobenius action on the apartment over `Ĕ` (an affine automorphism). -/
def frobeniusOnApartment (_σG : G ≃* G) : Apartment φ ≃ᵃ[ℝ] Apartment φ := sorry

/-- Its linear part `ς`. -/
def frobeniusOnApartment_linear (σG : G ≃* G) : N ≃ₗ[ℝ] N :=
  (frobeniusOnApartment φ σG).linear

/-- The correction `w₀` with `σ₀ = w₀ ∘ ς` preserving the dominant chamber. -/
def frobeniusCorrection (φ : Valuation D) (_σG : G ≃* G) : Φ.weylGroup := sorry

theorem frobeniusOnApartment_fixed (σG : G ≃* G) :
    ∃ x : Apartment φ, frobeniusOnApartment φ σG x = x := sorry

theorem frobeniusOnApartment_alcove (σG : G ≃* G) (C : Facet φ) (hC : C.IsAlcove) :
    ∃ C' : Facet φ, C'.IsAlcove ∧ ⇑(frobeniusOnApartment φ σG) '' C'.carrier = C'.carrier :=
  sorry

-- Test BruhatTits.frobeniusOnApartment_split
example : frobeniusOnApartment φ (MulEquiv.refl G) = AffineEquiv.refl ℝ (Apartment φ) := sorry

-- Test BruhatTits.frobeniusOnApartment_unitary
-- (for the unramified quasi-split `U₃`, `ς(a,b,c) = (-c,-b,-a)` on `X_*(T) = ℤ³`.)

-- Test BruhatTits.frobeniusCorrection_quasiSplit
-- (for quasi-split `G` with `σ`-stable special vertex and alcove, `w₀ = 1`.)

-- Test BruhatTits.frobeniusSplitting_not_equivariant
-- (for a non-quasi-split inner form the special-vertex splitting is not `σ`-stable.)

end Frobenius

/-! ### Minuscule coweights -/

section Minuscule

variable {ιZ X Y : Type u} [AddCommGroup X] [AddCommGroup Y] (Ψ : RootPairing ιZ ℤ X Y)

/-- Dominance with respect to a chosen set of positive roots. -/
def IsDominant (pos : Set ιZ) (μ : Y) : Prop := ∀ i ∈ pos, 0 ≤ Ψ.toLinearMap (Ψ.root i) μ

/-- `μ` is minuscule: `⟨a, μ⟩ ∈ {-1, 0, 1}` for every root. -/
def IsMinuscule (μ : Y) : Prop := ∀ i, Ψ.toLinearMap (Ψ.root i) μ ∈ ({-1, 0, 1} : Set ℤ)

/-- The dominance order: `μ - λ` is a non-negative integral combination of simple coroots. -/
def dominanceLE (simple : Set ιZ) (lam μ : Y) : Prop :=
  μ - lam ∈ AddSubmonoid.closure (Ψ.coroot '' simple)

/-- The dominant representative of a Weyl orbit. -/
def dominantRep (Ψ : RootPairing ιZ ℤ X Y) (_pos : Set ιZ) (_μ : Y) : Y := sorry

/-- `⟨2ρ, μ⟩`. -/
def twoRhoPairing (pos : Finset ιZ) (μ : Y) : ℤ :=
  ∑ i ∈ pos, Ψ.toLinearMap (Ψ.root i) μ

-- Test BruhatTits.IsMinuscule.zero
example : IsMinuscule Ψ 0 := by intro i; simp

-- Test BruhatTits.IsMinuscule.gl_n_standard
-- (for `GL_n`, `(1,0,…,0)` is minuscule with `⟨2ρ, μ⟩ = n - 1`; Tau Ceti
-- `GeneralLinear.diagonalRootDatum` is the root datum.)

-- Test BruhatTits.IsMinuscule.not_double
-- (for `GL₂`, `(2,0)` is dominant but not minuscule.)

-- Test BruhatTits.dominanceLE.gl2
-- (for `GL₂`, `(1,1) ≤ (2,0)`.)

end Minuscule

/-! ### The algebraic fundamental group -/

namespace AlgebraicFundamentalGroup

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : AbsoluteRootData K H)

/-- The Galois action on `π₁(G)` induced by the action on the root datum. -/
def galoisAction :
    Field.absoluteGaloisGroup K →*
      (AlgebraicFundamentalGroup D ≃ₗ[ℤ] AlgebraicFundamentalGroup D) := sorry

/-- Functoriality for a homomorphism of reductive groups, given by a compatible map of cocharacter
lattices sending coroots into the coroot span. -/
def map {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (f : D.Y →+ D'.Y)
    (_hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot)) :
    AlgebraicFundamentalGroup D →+ AlgebraicFundamentalGroup D' := sorry

/-- Coinvariants under a subgroup (inertia). -/
def inertiaCoinvariants (I : Subgroup (Field.absoluteGaloisGroup K)) : Type u :=
  AlgebraicFundamentalGroup D ⧸
    AddSubgroup.closure {x | ∃ (γ : I) (y : AlgebraicFundamentalGroup D),
      x = galoisAction D γ y - y}

instance (I : Subgroup (Field.absoluteGaloisGroup K)) : AddCommGroup (inertiaCoinvariants D I) :=
  inferInstanceAs (AddCommGroup (AlgebraicFundamentalGroup D ⧸
    AddSubgroup.closure {x | ∃ (γ : I) (y : AlgebraicFundamentalGroup D),
      x = galoisAction D γ y - y}))

/-- For a torus (no roots) `π₁ = X_*`. -/
def torus [IsEmpty D.ι] : AlgebraicFundamentalGroup D ≃+ D.Y := sorry

/-- Exactness for a central extension by a torus, recorded as surjectivity of the induced map. -/
theorem exact_central {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (f : D.Y →+ D'.Y) (hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot))
    (hsurj : Function.Surjective f) : Function.Surjective (map D D' f hf) := sorry

/-- Levi kernel: the kernel of `π₁(M) → π₁(G)` is spanned by the simple coroots outside `M`. -/
theorem leviKernel (simple : Set D.ι)
    (hsimple : Submodule.span ℤ (D.Ψ.coroot '' simple) = Submodule.span ℤ (Set.range D.Ψ.coroot))
    (levi : Set D.ι) (hlevi : levi ⊆ simple) :
    LinearMap.ker ((Submodule.span ℤ (D.Ψ.coroot '' levi)).mapQ
        (Submodule.span ℤ (Set.range D.Ψ.coroot)) LinearMap.id
        ((Submodule.span_mono (Set.image_subset_range _ _)).trans
          (le_of_eq (Submodule.comap_id _).symm))) =
      Submodule.map (Submodule.span ℤ (D.Ψ.coroot '' levi)).mkQ
        (Submodule.span ℤ (D.Ψ.coroot '' (simple \ levi))) := sorry

/-- Weyl group elements act trivially on `X_*/Q^∨`. -/
theorem weyl_invariant (w : D.Ψ.weylGroup) (y : D.Y) :
    (Submodule.Quotient.mk (((w : RootPairing.Aut D.Ψ).coweightEquiv) y) :
        AlgebraicFundamentalGroup D) = Submodule.Quotient.mk y := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.gl_n
-- (for `GL_n`, `π₁ ≅ ℤ` via the sum of coordinates.)

-- Test BruhatTits.AlgebraicFundamentalGroup.sl_n
-- (for `SL_n`, `π₁ = 0`.)

-- Test BruhatTits.AlgebraicFundamentalGroup.pgl_n
-- (for `PGL_n`, `π₁ ≅ ℤ/n`.)

-- Test BruhatTits.AlgebraicFundamentalGroup.not_cocharacters
example (h : Submodule.span ℤ (Set.range D.Ψ.coroot) = ⊤) :
    Subsingleton (AlgebraicFundamentalGroup D) := sorry

end AlgebraicFundamentalGroup

/-! ### Examples -/

namespace Examples

/-- The image of `N` in the affine group of the apartment is the affine Weyl group times the
stabilizer of an alcove; for `SL₂` the stabilizer part is trivial and for `PGL₂` it has order two
(the explicit `SL₂`/`PGL₂` computation is in the roadmap). -/
theorem sl2_action_eq_affineWeyl {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) (C : Facet φ) (hC : C.IsAlcove)
    (n : D.weylNormalizer) :
    ∃ w ∈ AffineWeylGroup φ, ⇑(w⁻¹ * Apartment.action φ n) '' C.carrier = C.carrier := sorry

/-- For a multipliable root `a` (with `2a = Φ.root j`), axiom V4 gives `Γ_{2a} ⊆ 2·Γ_a`; the
explicit value sets of the quasi-split `SU₃` are in the roadmap (Bruhat–Tits II 4.2.21). -/
theorem unitary_valueSets {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) (i j : ι) (hij : Φ.root j = (2 : ℝ) • Φ.root i) :
    φ.valueSet j ⊆ (fun r => 2 * r) '' φ.valueSet i := sorry

end Examples

end BruhatTits

/-! ### z-extensions and the Kottwitz homomorphism -/

namespace ZExtension

/-- A torus is induced if its character module is a permutation module: a basis permuted by
Galois. -/
def IsInducedTorus {K : Type u} [Field K] (X : Type u) [AddCommGroup X]
    (ρ : Field.absoluteGaloisGroup K →* (X ≃ₗ[ℤ] X)) : Prop :=
  ∃ (B : Type u) (b : Module.Basis B ℤ X), ∀ γ (x : B), ∃ y : B, ρ γ (b x) = b y

/-- A surjective homomorphism of groups `G̃ → G` (an injective map of Hopf algebras `f`) is a
z-extension if its kernel is a central induced torus and the derived group of `G̃` is simply
connected. The character module `Z` of the kernel torus with its Galois action `ρ` is supplied as
data; simple connectedness of the derived group is torsion-freeness of `π₁(G̃)`. -/
def IsZExtension {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐ[K] (Gt : Type u)) (Dt : BruhatTits.AbsoluteRootData K Gt)
    (Z : Type u) [AddCommGroup Z] (ρ : Field.absoluteGaloisGroup K →* (Z ≃ₗ[ℤ] Z)) : Prop :=
  Function.Injective f ∧ IsInducedTorus Z ρ ∧
    ∀ x : BruhatTits.AlgebraicFundamentalGroup Dt, ∀ n : ℕ, 0 < n → n • x = 0 → x = 0

theorem surjective_points {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐ[K] (Gt : Type u)) (Dt : BruhatTits.AbsoluteRootData K Gt)
    (Z : Type u) [AddCommGroup Z] (ρ : Field.absoluteGaloisGroup K →* (Z ≃ₗ[ℤ] Z))
    (hf : IsZExtension f Dt Z ρ) (K' : Type u) [Field K'] [Algebra K K'] :
    Function.Surjective fun x : (Gt : Type u) →ₐ[K] K' => x.comp f := sorry

theorem fundamentalGroup_torsionFree {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : (G : Type u) →ₐ[K] (Gt : Type u))
    (Dt : BruhatTits.AbsoluteRootData K Gt)
    (Z : Type u) [AddCommGroup Z] (ρ : Field.absoluteGaloisGroup K →* (Z ≃ₗ[ℤ] Z))
    (hf : IsZExtension f Dt Z ρ) :
    ∀ x : BruhatTits.AlgebraicFundamentalGroup Dt, ∀ n : ℕ, 0 < n → n • x = 0 → x = 0 :=
  hf.2.2

theorem comp_isZExtension_of_iso {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : (G : Type u) →ₐ[K] (Gt : Type u))
    (Dt : BruhatTits.AbsoluteRootData K Gt)
    (Z : Type u) [AddCommGroup Z] (ρ : Field.absoluteGaloisGroup K →* (Z ≃ₗ[ℤ] Z))
    (hf : IsZExtension f Dt Z ρ) (e : (Gt : Type u) ≃ₐ[K] (Gt : Type u)) :
    IsZExtension ((e : (Gt : Type u) →ₐ[K] Gt).comp f) Dt Z ρ :=
  ⟨e.injective.comp hf.1, hf.2.1, hf.2.2⟩

/-- Existence of z-extensions: the kernel torus is induced, so its character module is a
permutation module `B →₀ ℤ`. -/
theorem exists_zExtension {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (_hG : TauCeti.reductiveCommHopfAlgProperty K G) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (f : (G : Type u) →ₐ[K] (Gt : Type u))
      (Dt : BruhatTits.AbsoluteRootData K Gt) (B : Type u)
      (ρ : Field.absoluteGaloisGroup K →* ((B →₀ ℤ) ≃ₗ[ℤ] (B →₀ ℤ))),
      IsZExtension f Dt (B →₀ ℤ) ρ := sorry

-- Test ZExtension.gl2_pgl2
-- (`GL₂ → PGL₂` is a z-extension with kernel `G_m`.)

-- Test ZExtension.id_of_simplyConnected
-- (if `G_der` is simply connected the identity is a z-extension.)

-- Test ZExtension.sl2_pgl2_not
-- (`SL₂ → PGL₂` is not: its kernel `μ₂` is not a torus.)

-- Test ZExtension.inducedTorus_compat
example {K : Type u} [Field K] (B : Type u) :
    IsInducedTorus (K := K) (B →₀ ℤ) 1 := ⟨B, Finsupp.basisSingleOne, fun _ x => ⟨x, rfl⟩⟩

end ZExtension

namespace KottwitzMap

open ValuativeRel

variable {L : Type u} [Field L] [ValuativeRel L] [ValuativeRel.IsDiscrete L]
  [ValuativeRel.IsNontrivial L] [HenselianLocalRing 𝒪[L]] [IsAlgClosed 𝓀[L]]

/-- `κ_T : T(L) → X_*(T)_I` for a torus with absolute root data `D` (no roots). -/
def torus {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L T)
    (I : Subgroup (Field.absoluteGaloisGroup L)) :
    WithConv ((T : Type u) →ₐ[L] L) →*
      Multiplicative (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D I) :=
  sorry

theorem torus_surjective {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (I : Subgroup (Field.absoluteGaloisGroup L)) :
    Function.Surjective (torus D I) := sorry

/-- For a split torus of rank one (cocharacters `ℤ`, trivial Galois action), identified with
`G_m`, `κ_T` vanishes exactly on the integral units: it is the normalized valuation. -/
theorem torus_multiplicative {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (I : Subgroup (Field.absoluteGaloisGroup L))
    (eY : D.Y ≃+ ℤ) (htriv : ∀ γ, D.galoisAction γ = 1)
    (e : WithConv ((T : Type u) →ₐ[L] L) ≃* Lˣ) :
    ∀ x, torus D I x = 1 ↔ valuation L ((e x : Lˣ) : L) = 1 := sorry

theorem torus_natural {T T' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (D' : BruhatTits.AbsoluteRootData L T')
    (I : Subgroup (Field.absoluteGaloisGroup L)) (f : (T' : Type u) →ₐc[L] (T : Type u)) :
    ∃ g : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D I →+
        BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D' I,
      ∀ x, torus D' I (WithConv.toConv (x.ofConv.comp (f : (T' : Type u) →ₐ[L] (T : Type u)))) =
        Multiplicative.ofAdd (g (Multiplicative.toAdd (torus D I x))) := sorry

/-- A set of `L`-points of an affine `L`-scheme is bounded if every coordinate function has
bounded valuation on it. -/
def IsBoundedPoints {A : Type u} [CommRing A] [Algebra L A] (S : Set (WithConv (A →ₐ[L] L))) :
    Prop :=
  ∀ f : A, ∃ γ : ValueGroupWithZero L, ∀ x ∈ S, valuation L (x.ofConv f) ≤ γ

/-- The kernel `T(L)_0` of `κ_T` is bounded, and every bounded subgroup is mapped into the torsion
of `X_*(T)_I`: so `ker κ_T` has finite index in the maximal bounded subgroup. -/
theorem torus_ker {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (I : Subgroup (Field.absoluteGaloisGroup L)) :
    IsBoundedPoints ((torus D I).ker : Set (WithConv ((T : Type u) →ₐ[L] L))) ∧
      ∀ B : Subgroup (WithConv ((T : Type u) →ₐ[L] L)),
        IsBoundedPoints (B : Set (WithConv ((T : Type u) →ₐ[L] L))) →
        ∀ x ∈ B, IsOfFinOrder (torus D I x) := sorry

-- Test KottwitzMap.torus_gm
-- (`κ(ϖⁿ u) = n` for `u ∈ 𝒪_Lˣ`.)

-- Test KottwitzMap.torus_trivial
-- (for the trivial torus `κ` is the zero map.)

-- Test KottwitzMap.torus_ramified_normOne
-- (for the norm-one torus of a ramified quadratic extension, `X_*(T)_I = ℤ/2`.)

-- Test KottwitzMap.torus_not_valuation_of_norm
-- (for `Res_{L'/L} G_m` totally ramified of degree `e`, `κ(ϖ_L) = e`.)

/-- The Kottwitz homomorphism `κ_G : G(L) → π₁(G)_I`. -/
def kottwitz {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L G)
    (I : Subgroup (Field.absoluteGaloisGroup L)) :
    WithConv ((G : Type u) →ₐ[L] L) →*
      Multiplicative (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D I) :=
  sorry

variable {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L G)
  (I : Subgroup (Field.absoluteGaloisGroup L))

theorem kottwitz_surjective (hG : TauCeti.reductiveCommHopfAlgProperty L G) :
    Function.Surjective (kottwitz D I) := sorry

theorem kottwitz_natural {G' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D' : BruhatTits.AbsoluteRootData L G') (f : (G' : Type u) →ₐc[L] (G : Type u)) :
    ∃ g : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D I →+
        BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D' I,
      ∀ x, kottwitz D' I (WithConv.toConv (x.ofConv.comp (f : (G' : Type u) →ₐ[L] (G : Type u)))) =
        Multiplicative.ofAdd (g (Multiplicative.toAdd (kottwitz D I x))) := sorry

theorem kottwitz_torus [IsEmpty D.ι] : kottwitz D I = torus D I := sorry

/-- If the derived group is simply connected, `κ_G` factors through the torus `D = G/G_der`:
given the quotient map (a Hopf map from the coordinate ring of `D`), there is an identification
of coinvariants under which `κ_G = κ_D ∘ (G → D)`. -/
theorem kottwitz_simplyConnected {Dtor : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (DD : BruhatTits.AbsoluteRootData L Dtor) (q : (Dtor : Type u) →ₐc[L] (G : Type u)) :
    ∃ e : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants DD I ≃+
        BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D I,
      ∀ x, kottwitz D I x = Multiplicative.ofAdd (e (Multiplicative.toAdd
        (torus DD I (WithConv.toConv (x.ofConv.comp (q : (Dtor : Type u) →ₐ[L] (G : Type u))))))) :=
  sorry

/-- `κ_G` is trivial on the image of the simply connected cover (given by a Hopf map from the
coordinate ring of `G` to that of `G_sc`). -/
theorem kottwitz_sc_image {Gsc : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (f : (G : Type u) →ₐc[L] (Gsc : Type u)) (y : WithConv ((Gsc : Type u) →ₐ[L] L)) :
    kottwitz D I (WithConv.toConv (y.ofConv.comp (f : (G : Type u) →ₐ[L] (Gsc : Type u)))) = 1 :=
  sorry

/-- `G(L)_1 = ker κ_G`. -/
def kernel : Subgroup (WithConv ((G : Type u) →ₐ[L] L)) := (kottwitz D I).ker

-- Test KottwitzMap.kottwitz_gl_n
-- (for `GL_n`, `κ(g) = ω(det g)`.)

-- Test KottwitzMap.kottwitz_sl_n
example (hsc : Submodule.span ℤ (Set.range D.Ψ.coroot) = ⊤) : kottwitz D I = 1 := sorry

-- Test KottwitzMap.kottwitz_pgl2
-- (for `PGL₂`, `κ` of the image of `(0 1; ϖ 0)` is the nonzero element of `ℤ/2`.)

-- Test KottwitzMap.kottwitz_not_det_valuation
-- (`ω ∘ det` is not well defined on `PGL₂(L)`; only its parity is.)

namespace Examples

/-- For the norm-one torus of a ramified quadratic extension, `κ_T` has image of order two. -/
theorem normOne_ramified {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (DT : BruhatTits.AbsoluteRootData L T) (I : Subgroup (Field.absoluteGaloisGroup L))
    (h : Nat.card (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants DT I) = 2) :
    Nat.card (torus DT I).range = 2 := sorry

end Examples

end KottwitzMap

/-! ### RG2.1 statements not yet stateable at the pins

* `BruhatTits.isQuasiSplit_of_residueField_isAlgClosed` (Steinberg's theorem: a reductive group
  over a henselian discretely valued field with algebraically closed residue field is
  quasi-split): its conclusion is the Borel predicate `TauCeti.HopfIdeal.IsBorel`, whose module
  `TauCeti.Algebra.AlgebraicGroup.Borel.Basic` is not among the compiled modules, and an
  existential over a bare Hopf ideal would be vacuous. -/

/-! ## RG2.2 — Buildings and group action

Declarations of layer RG2.2 on the spine carriers `Building D φ`, `apartmentEmbedding` and the
`MulAction` of the rational points. The affine root hyperplanes of the apartment, the facets of the
apartment (RG2.1), the adjoint quotient, Levi and twisted-Levi subgroups and the Galois actions on
buildings over extensions are not in the pinned library; where a statement needs them they are
passed in as explicit data (a Hopf map `f : H' ⟶ H`, a transfer map of buildings, a permutation
action of a Galois group), and the conditions that cannot yet be stated are named in the
docstrings. -/

/-! ### The building of `GL_n` through norms and lattice chains -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped Classical Pointwise Matrix

/-- The additive normalized valuation `ω : K → ℝ ∪ {∞}`, `ω(ϖ) = 1`. -/
def ω (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (t : K) : WithTop ℝ :=
  if h : t = 0 then ⊤ else ((Multiplicative.toAdd (TauCeti.normalizedValuation K (Units.mk0 t h)) : ℤ) : ℝ)

/-- A splittable additive norm `α : Kⁿ → ℝ ∪ {∞}`: `α(t x) = α(x) + ω(t)`,
`α(x + y) ≥ min(α x, α y)`, `α(x) = ∞` iff `x = 0`, and some basis `e` splits `α`:
`α(Σ xᵢ eᵢ) = minᵢ (ω(xᵢ) + α(eᵢ))`. -/
structure SplittableNorm (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The norm. -/
  toFun : (Fin n → K) → WithTop ℝ
  map_smul : ∀ (t : K) (x : Fin n → K), toFun (t • x) = toFun x + ω K t
  min_le_map_add : ∀ x y, min (toFun x) (toFun y) ≤ toFun (x + y)
  map_eq_top_iff : ∀ x, toFun x = ⊤ ↔ x = 0
  splittable : ∃ e : Module.Basis (Fin n) K (Fin n → K), ∀ x,
    toFun x = ⨅ i, (toFun (e i) + ω K (e.repr x i))

/-- A graded periodic lattice chain: a nonempty set of `𝒪[K]`-lattices of `Kⁿ` totally ordered by
inclusion and stable under scaling by `K^×`, with a strictly decreasing grading `c` satisfying
`c(t Λ) = c(Λ) + ω(t)`. -/
structure GradedLatticeChain (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The lattices of the chain. -/
  chain : Set (Submodule 𝒪[K] (Fin n → K))
  nonempty : chain.Nonempty
  isLattice : ∀ Λ ∈ chain, Λ.IsLattice K
  isChain : IsChain (· ≤ ·) chain
  smul_mem : ∀ (t : Kˣ), ∀ Λ ∈ chain, Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K))) ∈ chain
  /-- The grading. -/
  grading : Submodule 𝒪[K] (Fin n → K) → ℝ
  grading_strictAnti : ∀ Λ ∈ chain, ∀ Λ' ∈ chain, Λ < Λ' → grading Λ' < grading Λ
  grading_smul : ∀ (t : Kˣ), ∀ Λ ∈ chain,
    (grading (Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K)))) : WithTop ℝ) =
      grading Λ + ω K t

variable {n : ℕ}

/-- Splittable norms correspond to graded periodic lattice chains (`α ↦` its balls, graded by the
radius). -/
def normEquivChain : SplittableNorm K n ≃ GradedLatticeChain K n := sorry

/-- `GL_n(K)` acts on splittable norms by `(g • α)(x) = α(g⁻¹ x)`. -/
instance : MulAction (Matrix.GeneralLinearGroup (Fin n) K) (SplittableNorm K n) := sorry

@[simp]
theorem smul_apply (g : Matrix.GeneralLinearGroup (Fin n) K) (α : SplittableNorm K n)
    (x : Fin n → K) : (g • α).toFun x = α.toFun (Matrix.mulVec (g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K).1 x) :=
  sorry

/-- The building of `GL_n` as the set of splittable norms: the spine building of local root data
`D` of `GL_n`, with the rational points identified with matrices by `e`, is
`GL_n(K)`-equivariantly in bijection with the splittable norms. Affineness on segments and the
intertwining of central translations with `α ↦ α - v` are stated in the roadmap document. -/
def buildingEquiv {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (e : WithConv (H →ₐ[K] K) ≃* Matrix.GeneralLinearGroup (Fin n) K)
    (D : BruhatTits.LocalRootData K H) (φ : BruhatTits.Valuation D.rootDatum) :
    BruhatTits.Building D φ ≃ SplittableNorm K n := sorry

theorem buildingEquiv_smul {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (e : WithConv (H →ₐ[K] K) ≃* Matrix.GeneralLinearGroup (Fin n) K)
    (D : BruhatTits.LocalRootData K H) (φ : BruhatTits.Valuation D.rootDatum)
    (g : WithConv (H →ₐ[K] K)) (x : BruhatTits.Building D φ) :
    buildingEquiv e D φ (g • x) = e g • buildingEquiv e D φ x := sorry

/-- The period of a chain: the number of homothety classes of lattices in it. -/
def period (L : GradedLatticeChain K n) : ℕ := sorry

theorem one_le_period (L : GradedLatticeChain K n) : 1 ≤ period L := sorry

theorem period_le (L : GradedLatticeChain K n) : period L ≤ n := sorry

/-- The total lattice `Λ⁰ ⊕ ⋯ ⊕ Λ^{r-1} ⊆ (Kⁿ)^r` of a determining segment of the chain. -/
def totalLattice (L : GradedLatticeChain K n) : Submodule 𝒪[K] (Fin (period L) → Fin n → K) := sorry

/-- The stabilizer of the point of a graded chain is the intersection of the stabilizers of its
lattices. -/
theorem stabilizer_eq (L : GradedLatticeChain K n) :
    (MulAction.stabilizer (Matrix.GeneralLinearGroup (Fin n) K) (normEquivChain.symm L) :
      Set (Matrix.GeneralLinearGroup (Fin n) K)) =
      ⋂ Λ ∈ L.chain, {g | ∀ x ∈ Λ, Matrix.mulVec g.1 x ∈ Λ} := sorry

-- Test GLBuilding.dim_one
/- For `n = 1` every splittable norm is `x ↦ ω(x / x₀) + c`: the norm is determined by its value
at a nonzero vector. -/
example (α β : SplittableNorm K 1) (x₀ : Fin 1 → K) (hx₀ : x₀ ≠ 0)
    (h : α.toFun x₀ = β.toFun x₀) : α = β := sorry

-- Test GLBuilding.standard_norm
/- The standard norm `min_i ω(x_i)` on `Kⁿ` has unit ball `𝒪[K]ⁿ`. -/
example (α : SplittableNorm K n) (hα : ∀ x : Fin n → K, α.toFun x = ⨅ i, ω K (x i)) :
    {x | (0 : WithTop ℝ) ≤ α.toFun x} =
      ((Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin n))) : Submodule 𝒪[K] (Fin n → K)) :
        Set (Fin n → K)) := sorry

-- Test GLBuilding.ball_isLattice
/- Every ball of a splittable norm is an `𝒪[K]`-lattice in Mathlib's sense. -/
example (α : SplittableNorm K n) (r : ℝ) :
    ∃ Λ : Submodule 𝒪[K] (Fin n → K),
      (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x} ∧ Λ.IsLattice K := sorry

-- Test GLBuilding.not_grading
/- A function jumping by `2 ω(t)` under `t` is not a grading. -/
example [NeZero n] (L : GradedLatticeChain K n) (c : Submodule 𝒪[K] (Fin n → K) → ℝ)
    (hc : ∀ (t : Kˣ), ∀ Λ ∈ L.chain,
      (c (Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K)))) : WithTop ℝ) = c Λ + 2 * ω K t) :
    ¬ ∃ L' : GradedLatticeChain K n, L'.chain = L.chain ∧ L'.grading = c := sorry

end GLBuilding

/-! ### The Bruhat–Tits tree of `SL₂` -/

namespace BTTree

open ValuativeRel

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- Scaling of lattices in `K²` by `K^×`. -/
instance instMulActionUnitsLattice : MulAction Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K} :=
  sorry

/-- The vertices: homothety classes of `𝒪[K]`-lattices in `K²`. -/
def Vertex : Type u :=
  Quotient (α := {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})
    (MulAction.orbitRel Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})

/-- Adjacency: representatives `Λ' ⊂ Λ` with `ϖ Λ ⊊ Λ' ⊊ Λ`. -/
def Adj : Vertex K → Vertex K → Prop := sorry

/-- The Bruhat–Tits tree. -/
def tree : SimpleGraph (Vertex K) where
  Adj := Adj K
  symm := sorry
  loopless := sorry

theorem isTree : (tree K).IsTree := sorry

/-- The neighbours of `[Λ]` are the lines of `Λ / ϖ Λ ≅ 𝓀[K]²`. -/
def neighborEquiv (v : Vertex K) :
    (tree K).neighborSet v ≃ {ℓ : Submodule 𝓀[K] (Fin 2 → 𝓀[K]) // Module.finrank 𝓀[K] ℓ = 1} := sorry

/-- `GL₂(K)` acts on the vertices of the tree, by graph automorphisms (`adj_smul`). -/
def smul : Matrix.GeneralLinearGroup (Fin 2) K →* Equiv.Perm (Vertex K) := sorry

theorem adj_smul (g : Matrix.GeneralLinearGroup (Fin 2) K) (v w : Vertex K) :
    (tree K).Adj (smul K g v) (smul K g w) ↔ (tree K).Adj v w := sorry

/-- The type of a vertex, `ω(det Λ) mod 2`. -/
def type : Vertex K → ZMod 2 := sorry

theorem type_smul (g : Matrix.GeneralLinearGroup (Fin 2) K) (v : Vertex K) :
    type K (smul K g v) =
      type K v + ((Multiplicative.toAdd (TauCeti.normalizedValuation K
        (Matrix.GeneralLinearGroup.det g)) : ℤ) : ZMod 2) := sorry

/-- `SL₂(K)` preserves types and acts without inversion. -/
theorem sl2_preserves_type (g : Matrix.SpecialLinearGroup (Fin 2) K) (v : Vertex K) :
    type K (smul K (Matrix.SpecialLinearGroup.toGL g) v) = type K v := sorry

-- Test BTTree.degree_Q2
/- Over a local field with residue field of order `q`, every vertex has degree `q + 1` (for
`ℚ_2`: `3`; `ℚ_[2]` has no `ValuativeRel` instance at the pin). -/
example (v : Vertex K) : Nat.card ((tree K).neighborSet v) = Nat.card 𝓀[K] + 1 := sorry

-- Test BTTree.adj_standard
/- The standard lattice `𝒪²` and `𝒪 ⊕ ϖ𝒪` are adjacent. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (Λ₀ Λ₁ : Submodule 𝒪[K] (Fin 2 → K))
    (h₀ : Λ₀ = Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin 2))))
    (h₁ : Λ₁ = Submodule.span 𝒪[K] {Pi.single 0 1, Pi.single 1 (ϖ : K)})
    (hL₀ : Λ₀.IsLattice K) (hL₁ : Λ₁.IsLattice K) :
    (tree K).Adj (Quotient.mk _ ⟨Λ₀, hL₀⟩) (Quotient.mk _ ⟨Λ₁, hL₁⟩) := sorry

-- Test BTTree.building_compat
/- The vertices of the tree are the graded chains of `K²` of period `1`, adjacency being the
chains of period `2`. -/
example : ∃ e : Vertex K ≃ {L : GLBuilding.GradedLatticeChain K 2 // GLBuilding.period L = 1},
    ∀ v w, (tree K).Adj v w ↔ ∃ L : GLBuilding.GradedLatticeChain K 2,
      GLBuilding.period L = 2 ∧ (e v).1.chain ⊆ L.chain ∧ (e w).1.chain ⊆ L.chain := sorry

-- Test BTTree.pgl2_inversion
/- An element of `GL₂(K)` of odd determinant valuation swaps the ends of some edge: it does not
preserve types. -/
example (g : Matrix.GeneralLinearGroup (Fin 2) K)
    (hg : Multiplicative.toAdd (TauCeti.normalizedValuation K (Matrix.GeneralLinearGroup.det g)) = 1) :
    ∃ v, type K (smul K g v) ≠ type K v := sorry

-- Test BTTree.single_vertex_degenerate
/- The tree has no leaves: every star is `ℙ¹(𝓀[K])`, which is nonempty. -/
example (v : Vertex K) : ((tree K).neighborSet v).Nonempty := sorry

end BTTree

/-- `SL₂(K)` acts on the vertices of the tree (through `BTTree.smul`). -/
instance BTTree.instMulActionSpecialLinearGroup (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    MulAction (Matrix.SpecialLinearGroup (Fin 2) K) (BTTree.Vertex K) := sorry

/-- Ihara's theorem: `SL₂(K)` is the amalgam `K₀ *_I K₁` of the stabilizers of two adjacent
vertices along their intersection, the Iwahori subgroup. Stated with Mathlib's `Monoid.PushoutI`
over the index type `Bool`. -/
theorem BTTree.ihara (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (v₀ v₁ : BTTree.Vertex K) (hadj : (BTTree.tree K).Adj v₀ v₁) :
    let K₀ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) v₀
    let K₁ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) v₁
    let φ : ∀ b : Bool, ↥(K₀ ⊓ K₁) →* ↥(bif b then K₁ else K₀) := fun b =>
      Subgroup.inclusion (Bool.rec (motive := fun b => K₀ ⊓ K₁ ≤ bif b then K₁ else K₀)
        inf_le_left inf_le_right b)
    ∃ e : Monoid.PushoutI φ ≃* Matrix.SpecialLinearGroup (Fin 2) K,
      ∀ (b : Bool) (x : ↥(bif b then K₁ else K₀)), e (Monoid.PushoutI.of (φ := φ) b x) = x := sorry

/-! ### The building and its apartments -/

namespace BruhatTits

open ValuativeRel
open scoped Pointwise

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

namespace Building

/-- The map on rational points induced by a Hopf map `f : H' ⟶ H` (the map of
`BruhatTits.ParahoricExt`, stated over any field). -/
def pointsMap {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) :
    WithConv (H →ₐ[K] K) →* WithConv (H' →ₐ[K] K) where
  toFun g := WithConv.toConv (g.ofConv.comp (f.hom.hom : (H' : Type u) →ₐc[K] H).toAlgHom)
  map_one' := sorry
  map_mul' := sorry

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- The class `[g, x]` of `(g, x) ∈ G(K) × A`. -/
def mk (g : WithConv (H →ₐ[K] K)) (x : Apartment φ) : Building D φ := g • apartmentEmbedding D φ x

/-- `[g, x] = [h, y]` iff some `n ∈ N(K)` carries `x` to `y` and `g⁻¹ h n` fixes `x` (`P_x` is the
fixer of `x`, which is generated by `N(K)_x` and the `U_{a,x}`). -/
theorem mk_eq_mk_iff (g h : WithConv (H →ₐ[K] K)) (x y : Apartment φ) :
    mk D φ g x = mk D φ h y ↔ ∃ n ∈ D.normalizer,
      n • apartmentEmbedding D φ x = apartmentEmbedding D φ y ∧
        g⁻¹ * h * n ∈ MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) :=
  sorry

@[simp]
theorem smul_mk (g h : WithConv (H →ₐ[K] K)) (x : Apartment φ) :
    g • mk D φ h x = mk D φ (g * h) x := by
  simp [mk, mul_smul]

theorem apartmentEmbedding_injective : Function.Injective (apartmentEmbedding D φ) := sorry

/-- The normalizer stabilizes the standard apartment, acting on it through `ν`. -/
theorem normalizer_smul_apartmentEmbedding (n : WithConv (H →ₐ[K] K)) (hn : n ∈ D.normalizer)
    (x : Apartment φ) : ∃ y : Apartment φ, n • apartmentEmbedding D φ x = apartmentEmbedding D φ y :=
  sorry

theorem exists_smul_apartmentEmbedding (p : Building D φ) :
    ∃ (g : WithConv (H →ₐ[K] K)) (x : Apartment φ), p = g • apartmentEmbedding D φ x := sorry

-- Test BruhatTits.Building.rankZero
/- With no roots every point lies in the apartment. -/
example [IsEmpty D.ι] : Function.Surjective (apartmentEmbedding D φ) := sorry

-- Test BruhatTits.Building.gl_n_compat
/- For `GL(V)` the building is the set of splittable norms (`GLBuilding.buildingEquiv`). -/
example [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] {n : ℕ}
    (e : WithConv (H →ₐ[K] K) ≃* Matrix.GeneralLinearGroup (Fin n) K) (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    GLBuilding.buildingEquiv e D φ (g • p) = e g • GLBuilding.buildingEquiv e D φ p :=
  GLBuilding.buildingEquiv_smul e D φ g p

-- Test BruhatTits.Building.not_product
/- The quotient map `G(K) × A → B` is not injective as soon as there is a root. -/
example [Nonempty D.ι] :
    ¬ Function.Injective fun p : WithConv (H →ₐ[K] K) × Apartment φ => mk D φ p.1 p.2 := sorry

/-- Any two points lie in a common apartment `g • j(A)`. -/
theorem exists_apartment_mem_mem (p q : Building D φ) :
    ∃ (g : WithConv (H →ₐ[K] K)) (x y : Apartment φ),
      p = g • apartmentEmbedding D φ x ∧ q = g • apartmentEmbedding D φ y := sorry

/-- The stabilizer of the standard apartment is `N(K)`. -/
theorem stabilizer_apartment :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) (Set.range (apartmentEmbedding D φ)) =
      D.normalizer := sorry

/-- The action is by isometries for the metric of the spine. -/
theorem isometry_smul (g : WithConv (H →ₐ[K] K)) : Isometry fun p : Building D φ => g • p := sorry

instance : CompleteSpace (Building D φ) := sorry

/-- The Bruhat–Tits negative-curvature inequality for the midpoint `m` of `[x, y]`. -/
theorem cat0_inequality (x y z m : Building D φ) (hmx : dist x m = dist x y / 2)
    (hmy : dist y m = dist x y / 2) :
    dist z m ^ 2 + dist x y ^ 2 / 4 ≤ (dist z x ^ 2 + dist z y ^ 2) / 2 := sorry

/-- The Bruhat–Tits fixed point theorem: a subgroup with a bounded orbit fixes a point. -/
theorem exists_fixedPoint_of_bounded (Γ : Subgroup (WithConv (H →ₐ[K] K))) (p : Building D φ)
    (hp : Bornology.IsBounded (Set.range fun γ : Γ => (γ : WithConv (H →ₐ[K] K)) • p)) :
    ∃ q : Building D φ, ∀ γ ∈ Γ, γ • q = q := sorry

/-- Independence of the choices: two local root data with compatible valuations for the same
group have equivariantly bijective buildings. -/
def equivOfChoices (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) :
    Building D φ ≃ Building D' φ' := sorry

theorem equivOfChoices_smul (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum)
    (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    equivOfChoices D φ D' φ' (g • p) = g • equivOfChoices D φ D' φ' p := sorry

theorem isometry_equivOfChoices (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) :
    Isometry (equivOfChoices D φ D' φ') := sorry

/-- Buildings under finite separable extensions: the canonical injection `B(G, K) → B(G, K')`
(stated for the base-changed group with its own local root data `D'`). -/
def extensionEmbedding (K' : Type u) [Field K'] [Algebra K K'] [Module.Finite K K']
    (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : Valuation D'.rootDatum) : Building D φ → Building D' φ' := sorry

theorem extensionEmbedding_injective (K' : Type u) [Field K'] [Algebra K K'] [Module.Finite K K']
    (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : Valuation D'.rootDatum) : Function.Injective (extensionEmbedding D φ K' D' φ') := sorry

/-- The apartment of `S` is carried into an apartment of `S' ⊇ S`. -/
theorem extensionEmbedding_apartment (K' : Type u) [Field K'] [Algebra K K'] [Module.Finite K K']
    (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : Valuation D'.rootDatum) (x : Apartment φ) :
    ∃ y : Apartment φ', extensionEmbedding D φ K' D' φ' (apartmentEmbedding D φ x) =
      apartmentEmbedding D' φ' y := sorry

/-- Unramified descent: over the completed maximal unramified extension `Ĕ`, the building of
`G` over `E` injects into the building over `Ĕ`, carrying apartments to apartments; the
identification of the image with the Frobenius-fixed points is stated in the roadmap document
(the Frobenius action on the building over `Ĕ` is not in the pinned library). -/
theorem unramifiedDescent {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {HE : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (DE : LocalRootData E HE) (φE : Valuation DE.rootDatum)
    (D' : LocalRootData (MaxUnramifiedCompletion.Breve E)
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := MaxUnramifiedCompletion.Breve E) HE))
    (φ' : Valuation D'.rootDatum) :
    ∃ ι : Building DE φE → Building D' φ', Function.Injective ι ∧
      ∀ x : Apartment φE, ∃ y : Apartment φ', ι (apartmentEmbedding DE φE x) =
        apartmentEmbedding D' φ' y := sorry

/-- The toral map of buildings induced by a surjection with central kernel `G → G'`, given on
coordinate rings by `f : H' ⟶ H` (the centrality of the kernel is not stated). -/
def mapCentral {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) : Building D φ → Building D' φ' :=
  sorry

theorem mapCentral_smul {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (g : WithConv (H →ₐ[K] K))
    (p : Building D φ) :
    mapCentral D φ f D' φ' (g • p) = Building.pointsMap f g • mapCentral D φ f D' φ' p := sorry

theorem mapCentral_apartment {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (x : Apartment φ) :
    ∃ y : Apartment φ', mapCentral D φ f D' φ' (apartmentEmbedding D φ x) =
      apartmentEmbedding D' φ' y := sorry

/-- The toral injection `B(M, K) → B(G, K)` of a Levi subgroup `M`, given on coordinate rings by
the surjection `f : H ⟶ H_M` (the Levi property of `M` is not stated); its image is `M(K) • A`. -/
def leviEmbedding {H_M : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H ⟶ H_M)
    (D_M : LocalRootData K H_M) (φ_M : Valuation D_M.rootDatum) : Building D_M φ_M → Building D φ :=
  sorry

theorem leviEmbedding_injective {H_M : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H ⟶ H_M)
    (D_M : LocalRootData K H_M) (φ_M : Valuation D_M.rootDatum) :
    Function.Injective (leviEmbedding D φ f D_M φ_M) := sorry

theorem range_leviEmbedding {H_M : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H ⟶ H_M)
    (D_M : LocalRootData K H_M) (φ_M : Valuation D_M.rootDatum) :
    Set.range (leviEmbedding D φ f D_M φ_M) =
      ⋃ m : WithConv (H_M →ₐ[K] K), (Building.pointsMap f m) • Set.range (apartmentEmbedding D φ) :=
  sorry

/-- A torus (no roots) has a one-point reduced building; its enlarged building is the apartment,
on which `T(K)` acts by translations: every stabilizer is the same bounded subgroup. -/
theorem anisotropic_bounded [IsEmpty D.ι] (p q : Building D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) p = MulAction.stabilizer (WithConv (H →ₐ[K] K)) q :=
  sorry

end Building

/-! ### Reduced and enlarged buildings -/

/-- The central directions `V_Z = X_*(A_G) ⊗ ℝ`: the common kernel of the roots in `V`. -/
def centralSubspace (D : LocalRootData K H) : Submodule ℝ D.V :=
  ⨅ i, LinearMap.ker (D.Φ.toLinearMap (D.Φ.root i))

/-- The reduced building `B_red(G, K)`. -/
def ReducedBuilding (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Type u := sorry

namespace ReducedBuilding

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

instance : MulAction (WithConv (H →ₐ[K] K)) (ReducedBuilding D φ) := sorry

instance : MetricSpace (ReducedBuilding D φ) := sorry

/-- `θ : G(K) → V_Z`, `⟨θ(g), χ⟩ = -ω(χ(g))`. -/
def centralVector : WithConv (H →ₐ[K] K) →* Multiplicative (centralSubspace D) := sorry

/-- `B(G, K) ≃ B_red(G, K) × V_Z`. -/
def prodEquiv : Building D φ ≃ ReducedBuilding D φ × centralSubspace D := sorry

theorem prodEquiv_smul (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    prodEquiv D φ (g • p) =
      (g • (prodEquiv D φ p).1, (prodEquiv D φ p).2 + Multiplicative.toAdd (centralVector D g)) :=
  sorry

/-- The centre acts trivially on the reduced building. -/
theorem centre_smul (z : WithConv (H →ₐ[K] K)) (hz : z ∈ Subgroup.center (WithConv (H →ₐ[K] K)))
    (x : ReducedBuilding D φ) : z • x = x := sorry

/-- The reduced building of `G` is that of `G^ad`, equivariantly for `G(K) → G^ad(K)`; the map
`f : H' ⟶ H` is the adjoint quotient (its adjointness is not stated). -/
def adjointEquiv {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) :
    ReducedBuilding D φ ≃ ReducedBuilding D' φ' := sorry

theorem adjointEquiv_smul {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (g : WithConv (H →ₐ[K] K))
    (x : ReducedBuilding D φ) :
    adjointEquiv D φ f D' φ' (g • x) = Building.pointsMap f g • adjointEquiv D φ f D' φ' x :=
  sorry

-- Test BruhatTits.ReducedBuilding.torus_point
example [IsEmpty D.ι] : Subsingleton (ReducedBuilding D φ) := sorry

-- Test BruhatTits.ReducedBuilding.prodEquiv_not_unique
/- Composing with a translation of `V_Z` gives another equivariant decomposition. -/
example (v : centralSubspace D) (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    let e := (prodEquiv D φ).trans (Equiv.prodCongr (Equiv.refl _) (Equiv.addRight v))
    e (g • p) = (g • (e p).1, (e p).2 + Multiplicative.toAdd (centralVector D g)) := sorry

-- Test BruhatTits.ReducedBuilding.adjoint_compat
/- The adjoint identification is an isometry. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (D' : LocalRootData K H')
    (φ' : Valuation D'.rootDatum) : Isometry (adjointEquiv D φ f D' φ') := sorry

end ReducedBuilding

/-! ### Facets and special points -/

/-- The facets of the building: the `G(K)`-translates of the facets of the standard apartment,
with the closure order. -/
def BuildingFacet (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Type u := sorry

namespace BuildingFacet

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

instance : SetLike (BuildingFacet D φ) (Building D φ) := sorry

instance : PartialOrder (BuildingFacet D φ) := sorry

theorem mem_unique (p : Building D φ) : ∃! F : BuildingFacet D φ, p ∈ F := sorry

theorem le_iff (F F' : BuildingFacet D φ) : F ≤ F' ↔ (F : Set (Building D φ)) ⊆ closure (F' : Set (Building D φ)) := sorry

/-- The action of `G(K)` on facets. -/
def smul (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) : BuildingFacet D φ := sorry

instance : MulAction (WithConv (H →ₐ[K] K)) (BuildingFacet D φ) where
  smul := smul D φ
  one_smul := sorry
  mul_smul := sorry

theorem coe_smul (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) :
    ((g • F : BuildingFacet D φ) : Set (Building D φ)) = g • (F : Set (Building D φ)) := sorry

theorem smul_le_smul_iff (g : WithConv (H →ₐ[K] K)) (F F' : BuildingFacet D φ) :
    g • F ≤ g • F' ↔ F ≤ F' := sorry

/-- Chambers (alcoves): the maximal facets. -/
def IsChamber (F : BuildingFacet D φ) : Prop := IsMax F

/-- Vertices: the minimal facets. -/
def IsVertex (F : BuildingFacet D φ) : Prop := IsMin F

/-- A point `ψ` of the apartment is special when for every root `a` some affine root of direction
`a` vanishes at `ψ`, i.e. `0 ∈ Γ_a(ψ)`. -/
def IsSpecialApartmentPoint (ψ : Apartment φ) : Prop :=
  ∀ i : D.ι, (0 : WithTop ℝ) ∈ Set.range (ψ.1.φ i)

/-- A point of the building is special if it is special in an apartment containing it. -/
def IsSpecial (p : Building D φ) : Prop :=
  ∃ (g : WithConv (H →ₐ[K] K)) (ψ : Apartment φ),
    p = g • apartmentEmbedding D φ ψ ∧ IsSpecialApartmentPoint D φ ψ

theorem isSpecial_iff_forall (p : Building D φ) :
    IsSpecial D φ p ↔ ∀ (g : WithConv (H →ₐ[K] K)) (ψ : Apartment φ),
      p = g • apartmentEmbedding D φ ψ → IsSpecialApartmentPoint D φ ψ := sorry

/-- The orientation character `ε_F : Stab(F) → {±1}`, the sign of the permutation of the vertices
of `F`. -/
def orientationCharacter (F : BuildingFacet D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) F →* ℤˣ := sorry

-- Test BruhatTits.BuildingFacet.rankZero_single
example [IsEmpty D.ι] : Subsingleton (BuildingFacet D φ) := sorry

-- Test BruhatTits.BuildingFacet.apartment_compat
/- A facet meeting the standard apartment is the image of a subset of the apartment. -/
example (F : BuildingFacet D φ) (x : Apartment φ) (hx : apartmentEmbedding D φ x ∈ F) :
    ∃ S : Set (Apartment φ), (F : Set (Building D φ)) = apartmentEmbedding D φ '' S := sorry

end BuildingFacet

/-! ### Stabilizers and pointwise fixers -/

namespace Fixer

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- The pointwise fixer `G(K)_Ω` of a subset of the building. -/
def pointwise (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨅ p ∈ Ω, MulAction.stabilizer (WithConv (H →ₐ[K] K)) p

/-- The setwise stabilizer `Stab(Ω)`. -/
def stabilizer (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) :=
  MulAction.stabilizer (WithConv (H →ₐ[K] K)) Ω

theorem pointwise_le_stabilizer (Ω : Set (Building D φ)) : pointwise D φ Ω ≤ stabilizer D φ Ω :=
  sorry

theorem pointwise_smul (g : WithConv (H →ₐ[K] K)) (Ω : Set (Building D φ)) :
    pointwise D φ (g • Ω) = (pointwise D φ Ω).map (MulAut.conj g).toMonoidHom := sorry

theorem pointwise_antitone : Antitone (pointwise D φ) := sorry

-- Test BruhatTits.Fixer.singleton_eq
example (p : Building D φ) : pointwise D φ {p} = stabilizer D φ {p} := sorry

section LocalField

variable [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped PointTopology

theorem isCompact_pointwise (Ω : Set (Building D φ)) (hΩ : Bornology.IsBounded Ω)
    (hne : Ω.Nonempty) : IsCompact (pointwise D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry

theorem isOpen_pointwise (Ω : Set (Building D φ)) (hΩ : Bornology.IsBounded Ω) :
    IsOpen (pointwise D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry

/-- In the reduced building, stabilizers of points are compact modulo the centre. -/
theorem stabilizer_compactModCentre (x : ReducedBuilding D φ) :
    IsCompact ((QuotientGroup.mk : WithConv (H →ₐ[K] K) → _ ⧸ Subgroup.center (WithConv (H →ₐ[K] K))) ''
      (MulAction.stabilizer (WithConv (H →ₐ[K] K)) x : Set (WithConv (H →ₐ[K] K)))) := sorry

/-- Cocompactness: a bounded subset meets every orbit. -/
theorem _root_.BruhatTits.Building.exists_bounded_fundamentalDomain :
    ∃ Ω : Set (Building D φ), Bornology.IsBounded Ω ∧
      ∀ p : Building D φ, ∃ g : WithConv (H →ₐ[K] K), g • p ∈ Ω := sorry

-- Test BruhatTits.Fixer.compat_parahoric_sc
/- For a point of the apartment the fixer contains the parahoric subgroup (equality for simply
connected groups is stated in the roadmap document). -/
example (x : Apartment φ) :
    parahoricSubgroup D φ {x} ≤ pointwise D φ {apartmentEmbedding D φ x} := sorry

end LocalField

end Fixer

end BruhatTits

/-! ### Tame descent -/

namespace TameDescent

open ValuativeRel

/-- Fixed points of a finite group of automorphisms of a reductive group whose order is invertible
in the field: the fixed-point group is represented by a reductive Hopf algebra `H'` with a map
from `H`, whose points are the `Θ`-fixed points (the identity component and the integral statement
are in the roadmap document). The action of `Θ` is given through automorphisms of the Hopf
algebra `H`. -/
theorem reductive_fixedPoints {k : Type u} [Field k] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H) (Θ : Type u) [Group Θ] [Finite Θ]
    (ρ : Θ →* _root_.CategoryTheory.Aut H) (hΘ : (Nat.card Θ : k) ≠ 0) :
    ∃ (H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (f : H ⟶ H'),
      TauCeti.reductiveCommHopfAlgProperty k H' ∧
      Set.range (BruhatTits.Building.pointsMap f) =
        {g | ∀ θ : Θ, BruhatTits.Building.pointsMap (ρ θ).hom g = g} := sorry

/-- Tame descent of buildings: for a finite Galois extension `K'/K` of degree prime to the
residue characteristic (a sufficient condition for tameness) acting on the building over `K'`
through `ρ`, the canonical injection has image the fixed points. -/
theorem building_eq_fixedPoints {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum) (K' : Type u) [Field K'] [Algebra K K']
    [Module.Finite K K'] [IsGalois K K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum)
    (ρ : (K' ≃ₐ[K] K') →* Equiv.Perm (BruhatTits.Building D' φ'))
    (htame : ¬ ringChar 𝓀[K] ∣ Module.finrank K K') :
    Set.range (BruhatTits.Building.extensionEmbedding D φ K' D' φ') =
      {y | ∀ σ : K' ≃ₐ[K] K', ρ σ y = y} := sorry

end TameDescent

/-! ### Toral embeddings into the `GL` building -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} {n : ℕ}

/-- Equivariant toral embeddings into the `GL_n` building: for a faithful representation, given on
points by `ρ`, there is an injective equivariant map of buildings (the torality and isometry
conditions are in the roadmap document). -/
theorem exists_toralEmbedding (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum)
    (ρ : WithConv (H →ₐ[K] K) →* Matrix.GeneralLinearGroup (Fin n) K) (hρ : Function.Injective ρ) :
    ∃ ι : BruhatTits.Building D φ → SplittableNorm K n, Function.Injective ι ∧
      ∀ g p, ι (g • p) = ρ g • ι p := sorry

/-- Kisin–Pappas minuscule embeddings: a toral embedding sending a chosen point of the apartment
to the norm of a chosen lattice `Λ` stable under the stabilizer of the point. -/
theorem minusculeToralEmbedding (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum)
    (ρ : WithConv (H →ₐ[K] K) →* Matrix.GeneralLinearGroup (Fin n) K) (hρ : Function.Injective ρ)
    (x : BruhatTits.Apartment φ) (Λ : Submodule 𝒪[K] (Fin n → K)) (hΛ : Λ.IsLattice K)
    (hstab : ∀ g ∈ MulAction.stabilizer (WithConv (H →ₐ[K] K)) (BruhatTits.apartmentEmbedding D φ x),
      ∀ v ∈ Λ, Matrix.mulVec (ρ g).1 v ∈ Λ) :
    ∃ ι : BruhatTits.Building D φ → SplittableNorm K n, Function.Injective ι ∧
      (∀ g p, ι (g • p) = ρ g • ι p) ∧
      {v | (0 : WithTop ℝ) ≤ (ι (BruhatTits.apartmentEmbedding D φ x)).toFun v} = Λ := sorry

/-- The building of `GSp(ψ)` inside that of `GL_n`: it is the set of norms whose chains are almost
self-dual for the alternating form `ψ` (`Λ^∨ ∈ 𝓛` and `c(Λ^∨) = -c(Λ) + m`); the standard segment
and the embedding into a larger symplectic group are stated in the roadmap document. -/
theorem gspBuildingEquiv (ψ : LinearMap.BilinForm K (Fin n → K)) (hψ : ψ.IsAlt)
    (hnd : ψ.Nondegenerate) :
    ∃ S : Set (SplittableNorm K n), ∀ α, α ∈ S ↔ ∃ m : ℤ, ∀ Λ ∈ (normEquivChain α).chain,
      ψ.dualSubmodule (R := 𝒪[K]) Λ ∈ (normEquivChain α).chain ∧
      (normEquivChain α).grading (ψ.dualSubmodule (R := 𝒪[K]) Λ) = -(normEquivChain α).grading Λ + m :=
  sorry

end GLBuilding

/-! ### RG2.2 statements not yet stateable at the pins

* `RG2.2/building` test `sl2_tree`, `RG2.2/facets-and-special-points` tests `tree_facets` and
  `not_special_barycentre`, `RG2.2/stabilizers-and-fixers` tests `gl2_vertex` and
  `pgl2_edge_stabilizer_ne_fixer`, `RG2.2/enlarged-and-reduced-building` tests `gl_n_centralVector`
  and `adjoint_compat` (as the tree): they need the identification of the rational points of the
  spine Hopf algebra of `GL₂`/`SL₂`/`PGL₂` with matrices and of the facet complex of its reduced
  building with `BTTree.tree`; neither identification is in the pinned library.
* `RG2.2/building-apartment-axioms` parts (2) and (4) (the intersection of two apartments is
  enclosed; retractions centred at a chamber): need the enclosure and the retraction, which depend
  on the affine root hyperplanes of RG2.1, not in the spine.
* `RG2.2/building-metric`: uniqueness of the metric and geodesic segments; needs the Euclidean
  structure on the apartment (a `W₀`-invariant inner product on `D.V`), not in the spine.
* `RG2.2/bruhat-tits-fixed-point-theorem` part (3) (maximal bounded subgroups are stabilizers of
  points): needs `G(K)^1`, the kernel of the rational characters, not in the spine.
* `RG2.2/unramified-descent-of-building`: the Frobenius-fixed-point description; needs the action
  of `Gal(K^sh/K)` on the building over `K^sh`, which needs the Galois action on the base-changed
  local root data.
* `RG2.2/weil-restriction-building`: `WeilRestriction.Res` is a `k`-algebra, not a Hopf algebra
  object of `FiniteTypeCommHopfAlgCat`, so the local root data of `Res_{K'/K} G'` cannot be formed.
* `RG2.2/building-functoriality-central-extensions`: the hyperspecial-vertex and
  extension-principle clauses; need hyperspecial vertices (RG2.3) over `K^ur`.
* `RG2.2/building-products-and-levis` part (1) (products): needs the tensor-product Hopf algebra
  with local root data of a product, not in the spine.
* `RG2.2/twisted-levi-subgroup` (all of `TwistedLevi.*`): the predicate "becomes a Levi subgroup
  of a parabolic after a finite extension" needs parabolic and Levi subgroups of the anchor
  roadmap (Layer 7); not in the pinned library.
* `RG2.2/division-algebra-building`: needs central division algebras with their maximal orders and
  `D`-norms; not in the pinned library.
* `RG2.2/gsp-building-self-dual-chains` (full form): the standard segment and the embedding into
  `GSp(V')`; only the almost-self-duality of chains is stated above.
* `RG2.2/building-of-tori-and-anisotropic-groups` parts (2)–(3): compactness of `G(E)/Z_G(E)` for
  anisotropic groups and the norm-one torus; need the anisotropy predicate.
* `RG2.2/building-independence-of-choices`: uniqueness of the equivariant bijection and
  `σ`-isomorphisms of valued fields; only existence is stated.
* `RG2.2/ihara-amalgam` for `PSL₂` and the `PGL₂` non-example: need `PSL₂(K)` and `PGL₂(K)` as
  groups acting on the tree; not in the pinned library. -/

/-! ## RG2.3 — Parahoric and congruence group schemes: integral models, Bruhat–Tits group schemes, parahorics

Declarations of the first half of layer RG2.3. An affine group scheme over `𝒪[K]` is a finite-type
commutative Hopf `𝒪[K]`-algebra; its special fibre is the base change to `𝓀[K]`. Strictly henselian
points are replaced by points over `𝒪[K]` under the proxy hypothesis `IsAlgClosed 𝓀[K]`; the
Néron models that are not affine are stated as Mathlib schemes. -/

/-! ### Smooth affine integral models -/

namespace IntegralModel

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- A smooth affine `𝒪[K]`-model of `G = Spec H`: a smooth finite-type commutative Hopf
`𝒪[K]`-algebra with a Hopf isomorphism of its generic fibre with `H`. -/
structure SmoothModel (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  /-- The coordinate Hopf algebra of the model. -/
  A : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]
  smooth : Algebra.Smooth 𝒪[K] A
  /-- The identification of the generic fibre with `H`. -/
  genericFibre : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) A ≅ H

namespace SmoothModel

variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The special fibre `𝓀[K] ⊗ A`. -/
def specialFibre (𝒢 : SmoothModel H) : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝓀[K] :=
  TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := 𝓀[K]) 𝒢.A

/-- The integral points `𝒢(𝒪) ⊆ G(K)`. -/
def integralPoints (𝒢 : SmoothModel H) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

/-- `g ∈ 𝒢(𝒪)` iff `g` is integral on every coordinate of `A`, transported to `H` through the
generic-fibre identification. -/
theorem mem_integralPoints_iff (𝒢 : SmoothModel H) (g : WithConv (H →ₐ[K] K)) :
    g ∈ 𝒢.integralPoints ↔ ∀ a : 𝒢.A, ∃ o : 𝒪[K],
      g.ofConv (𝒢.genericFibre.hom.hom ((1 : K) ⊗ₜ[𝒪[K]] a)) = o := sorry

/-- Morphisms of models: Hopf maps compatible with the generic-fibre identifications. -/
def Hom (𝒢 𝒢' : SmoothModel H) : Type u :=
  {f : 𝒢.A ⟶ 𝒢'.A //
    TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) f ≫ 𝒢'.genericFibre.hom =
      𝒢.genericFibre.hom}

instance (𝒢 𝒢' : SmoothModel H) : Subsingleton (Hom 𝒢 𝒢') := sorry

/-- The special fibre is geometrically connected. -/
def HasConnectedFibres (𝒢 : SmoothModel H) : Prop :=
  TauCeti.geometricallyConnectedCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre.obj

/-- The identity component `𝒢°`. -/
def identityComponent (𝒢 : SmoothModel H) : SmoothModel H := sorry

theorem hasConnectedFibres_identityComponent (𝒢 : SmoothModel H) :
    𝒢.identityComponent.HasConnectedFibres := sorry

theorem integralPoints_identityComponent_le (𝒢 : SmoothModel H) :
    𝒢.identityComponent.integralPoints ≤ 𝒢.integralPoints := sorry

theorem integralPoints_identityComponent_finiteIndex [Finite 𝓀[K]] (𝒢 : SmoothModel H) :
    (𝒢.identityComponent.integralPoints.subgroupOf 𝒢.integralPoints).FiniteIndex := sorry

-- Test IntegralModel.SmoothModel.generalLinear
/- The `GL_n` coordinate Hopf algebra over `𝒪[K]` is a smooth model of `GL_n` whose integral
points are the integral matrices with unit determinant. -/
example (n : ℕ) :
    ∃ 𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n),
      𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ∧
      ∀ g, g ∈ 𝒢.integralPoints ↔
        ∀ i j, ∃ o : 𝒪[K], (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) K) i j = o :=
  sorry

-- Test IntegralModel.SmoothModel.trivial
example (𝒢 : SmoothModel H) [Subsingleton (WithConv (H →ₐ[K] K))] :
    𝒢.integralPoints = ⊥ := sorry

-- Test IntegralModel.SmoothModel.integralPoints_compat
/- Over a local field the integral points are compact open (RG2.0). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (𝒢 : SmoothModel H) :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact (𝒢.integralPoints : Set (WithConv (H →ₐ[K] K))) ∧
      IsOpen (𝒢.integralPoints : Set (WithConv (H →ₐ[K] K))) := sorry

-- Test IntegralModel.SmoothModel.not_smooth_rootsOfUnity
/- `𝒪[X]/(X^p - 1)` is flat with generic fibre `μ_p` but not smooth over `𝒪` in residue
characteristic `p`. -/
example (p : ℕ) (hp : p.Prime) (hchar : ringChar 𝓀[K] = p) :
    ¬ Algebra.Smooth 𝒪[K] (Polynomial 𝒪[K] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝒪[K]) ^ p - 1}) := sorry

/-- A reductive model: the special fibre is connected reductive. -/
def IsReductive (𝒢 : SmoothModel H) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre

theorem isReductive_iff_fibres (𝒢 : SmoothModel H) :
    𝒢.IsReductive ↔ TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre ∧
      TauCeti.reductiveCommHopfAlgProperty K
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) 𝒢.A) := sorry

theorem IsReductive.hasConnectedFibres {𝒢 : SmoothModel H} (h : 𝒢.IsReductive) :
    𝒢.HasConnectedFibres := sorry

theorem generalLinear_isReductive (n : ℕ)
    (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) : 𝒢.IsReductive :=
  sorry

-- Test IntegralModel.SmoothModel.isReductive_compat_tauceti
example (𝒢 : SmoothModel H) :
    𝒢.IsReductive ↔ TauCeti.reductiveCommHopfAlgProperty 𝓀[K]
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := 𝓀[K]) 𝒢.A) := Iff.rfl

end SmoothModel

/-- A subgroup of `G(K)` is hyperspecial if it is the group of integral points of a reductive
model. -/
def IsHyperspecialSubgroup {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  ∃ 𝒢 : SmoothModel H, 𝒢.IsReductive ∧ 𝒢.integralPoints = P

-- Test IntegralModel.SmoothModel.generalLinear_isReductive_test
example (n : ℕ) (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) :
    IsHyperspecialSubgroup 𝒢.integralPoints :=
  ⟨𝒢, SmoothModel.generalLinear_isReductive n 𝒢 h, rfl⟩

-- Test IntegralModel.SmoothModel.splitTorus_isReductive
/- The split torus has a unique hyperspecial subgroup. -/
example (r : ℕ) (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (e : WithConv (H →ₐ[K] K) ≃* (Fin r → Kˣ)) (P Q : Subgroup (WithConv (H →ₐ[K] K)))
    (hP : IsHyperspecialSubgroup P) (hQ : IsHyperspecialSubgroup Q) : P = Q := sorry

-- Test IntegralModel.SmoothModel.iwahori_not_reductive
/- A smooth model whose special fibre has a nontrivial unipotent radical is not reductive. -/
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H)
    (h : ¬ TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre) : ¬ 𝒢.IsReductive := h

/-- The extension principle: a `K`-homomorphism `f : G → G'` extends to the smooth models iff it
carries integral points into integral points (over a base with algebraically closed residue field,
the proxy for a strictly henselian base). -/
theorem extend_iff [IsAlgClosed 𝓀[K]] {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 : SmoothModel H) (𝒢' : SmoothModel H') (f : H' ⟶ H) :
    (∃ F : 𝒢'.A ⟶ 𝒢.A,
      TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) F ≫ 𝒢.genericFibre.hom =
        𝒢'.genericFibre.hom ≫ f) ↔
      ∀ g ∈ 𝒢.integralPoints, BruhatTits.Building.pointsMap f g ∈ 𝒢'.integralPoints := sorry

/-- A smooth model is determined by its integral points (strictly henselian proxy). -/
theorem eq_of_integralPoints_eq [IsAlgClosed 𝓀[K]] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 𝒢' : SmoothModel H) (h : 𝒢.integralPoints = 𝒢'.integralPoints) : Nonempty (𝒢.A ≅ 𝒢'.A) :=
  sorry

/-- Prasad–Yu: a homomorphism from a reductive model whose generic fibre is a closed immersion is
a closed immersion, when `2` is invertible in the residue field. -/
theorem surjective_of_reductive_of_generic (h2 : (2 : 𝓀[K]) ≠ 0)
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) (h𝒢 : 𝒢.IsReductive)
    (ℋ : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]) (φ : ℋ ⟶ 𝒢.A)
    (hgen : Function.Surjective (TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) φ).hom.hom) :
    Function.Surjective φ.hom.hom := sorry

/-- Every smooth affine model admits a closed immersion into some `GL_n` over `𝒪[K]`. -/
theorem exists_closedImmersion_generalLinear {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 : SmoothModel H) :
    ∃ (n : ℕ) (ρ : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ⟶ 𝒢.A),
      Function.Surjective ρ.hom.hom := sorry

end IntegralModel

/-! ### Schematic closure -/

namespace SchematicClosure

variable (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  (K : Type u) [Field K] [Algebra O K] [IsFractionRing O K]
  (A : Type u) [CommRing A] [Algebra O A]

/-- `I^♮`, the preimage of `I ⊆ K ⊗_O A` in `A`. -/
def closureIdeal (I : Ideal (K ⊗[O] A)) : Ideal A :=
  I.comap (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A)

/-- The coordinate ring `A / I^♮` of the schematic closure. -/
def closure (I : Ideal (K ⊗[O] A)) : Type u := A ⧸ closureIdeal O K A I

instance (I : Ideal (K ⊗[O] A)) : CommRing (closure O K A I) :=
  inferInstanceAs (CommRing (A ⧸ closureIdeal O K A I))

instance (I : Ideal (K ⊗[O] A)) : Algebra O (closure O K A I) :=
  inferInstanceAs (Algebra O (A ⧸ closureIdeal O K A I))

theorem closure_flat [Module.Flat O A] (I : Ideal (K ⊗[O] A)) : Module.Flat O (closure O K A I) :=
  sorry

/-- The generic fibre of the closure is `(K ⊗ A) / I`. -/
def closure_genericFibre [Module.Flat O A] (I : Ideal (K ⊗[O] A)) :
    K ⊗[O] closure O K A I ≃ₐ[K] (K ⊗[O] A) ⧸ I := sorry

theorem closure_unique [Module.Flat O A] (I : Ideal (K ⊗[O] A)) (J : Ideal A)
    (hJ : Module.Flat O (A ⧸ J))
    (hI : J.map (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A) = I) :
    J = closureIdeal O K A I := sorry

/-- For an `O`-algebra map into a flat domain, `x` kills `I^♮` iff its generic fibre kills `I`. -/
theorem mem_closure_points (I : Ideal (K ⊗[O] A)) (O' : Type u) [CommRing O'] [IsDomain O']
    [Algebra O O'] [Module.Flat O O'] (x : A →ₐ[O] O') :
    (∀ a ∈ closureIdeal O K A I, x a = 0) ↔
      ∀ b ∈ I, Algebra.TensorProduct.map (AlgHom.id O K) x b = 0 := sorry

-- Test SchematicClosure.closureIdeal_bot
example [Module.Flat O A] : closureIdeal O K A ⊥ = ⊥ := sorry

-- Test SchematicClosure.closure_nonIntegralPoint
/- For `A = O[X]` and `I = (X - ϖ⁻¹)`, the closure `O[X]/(ϖX - 1)` has empty special fibre. -/
example (ϖ : O) (hϖ : Irreducible ϖ) (k : Type u) [Field k] [Algebra O k]
    (hk : algebraMap O k ϖ = 0) :
    IsEmpty (closure O K (Polynomial O)
      (Ideal.span {(1 : K) ⊗ₜ[O] Polynomial.X - (algebraMap O K ϖ)⁻¹ ⊗ₜ[O] (1 : Polynomial O)})
        →ₐ[O] k) := sorry

end SchematicClosure

/-! ### Néron models of tori -/

namespace NeronModel

open ValuativeRel AlgebraicGeometry

variable {K : Type u} [Field K] [ValuativeRel K]

/-- The lft Néron model of the torus `T = Spec H` (the torus hypothesis is not stated), as a
scheme. -/
def lft (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Scheme.{u} := sorry

variable (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)

/-- The structure morphism to `Spec 𝒪[K]`. -/
def lftStructure : lft H ⟶ Spec (CommRingCat.of 𝒪[K]) := sorry

instance lft_smooth : AlgebraicGeometry.Smooth (lftStructure H) := sorry

/-- The Néron mapping property for affine smooth test schemes: `𝒪`-morphisms `Spec B → 𝒯^lft`
correspond to `K`-points of `T` with values in `K ⊗ B` (the compatibility with the structure
morphisms is not stated). -/
def lftMappingProperty (B : Type u) [CommRing B] [Algebra 𝒪[K] B] [Algebra.Smooth 𝒪[K] B] :
    (Spec (CommRingCat.of B) ⟶ lft H) ≃ (H →ₐ[K] K ⊗[𝒪[K]] B) := sorry

/-- `𝒯^lft(𝒪) = T(K)`. -/
def lft_integralPoints : (Spec (CommRingCat.of 𝒪[K]) ⟶ lft H) ≃ (H →ₐ[K] K) := sorry

-- Test NeronModel.lft_multiplicative_points
/- For `T = G_m = GL₁`, the integral points of the lft model are `K^×`. -/
example : Nonempty ((Spec (CommRingCat.of 𝒪[K]) ⟶
    lft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)) ≃ Kˣ) := sorry

-- Test NeronModel.lft_not_affine
example : ¬ IsAffine (lft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)) := sorry

/-- The finite-type Néron model `𝒯^ft`, a smooth affine model of `T`. -/
def ft : IntegralModel.SmoothModel H := sorry

/-- The connected Néron model `𝒯°`, the identity component of `𝒯^ft`. -/
def connected : IntegralModel.SmoothModel H := (ft H).identityComponent

theorem connected_integralPoints_le_ft :
    (connected H).integralPoints ≤ (ft H).integralPoints :=
  IntegralModel.SmoothModel.integralPoints_identityComponent_le (ft H)

theorem connected_integralPoints_finiteIndex [Finite 𝓀[K]] :
    ((connected H).integralPoints.subgroupOf (ft H).integralPoints).FiniteIndex :=
  IntegralModel.SmoothModel.integralPoints_identityComponent_finiteIndex (ft H)

/-- `𝒯^ft(𝒪)` is the maximal bounded subgroup of `T(K)`: it contains every subgroup with compact
closure (local field). -/
theorem ft_integralPoints_maximal [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (P : Subgroup (WithConv (H →ₐ[K] K)))
    (hP : letI := PointTopology.instTopologicalSpaceWithConv K H K
      IsCompact (closure (P : Set (WithConv (H →ₐ[K] K))))) :
    P ≤ (ft H).integralPoints := sorry

/-- For a torus (no relative roots) the connected Néron model's points lie in every parahoric. -/
theorem connected_le_parahoric (D : BruhatTits.LocalRootData K H) [IsEmpty D.ι]
    (φ : BruhatTits.Valuation D.rootDatum) (x : BruhatTits.Apartment φ) :
    (connected H).integralPoints ≤ BruhatTits.parahoricSubgroup D φ {x} := sorry

-- Test NeronModel.ft_multiplicative
/- For `G_m`, `𝒯^ft = 𝒯° = G_{m,𝒪}`. -/
example :
    (ft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)).A =
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] 1 ∧
    (connected (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)).A =
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] 1 := sorry

-- Test NeronModel.ft_trivial
example [Subsingleton (WithConv (H →ₐ[K] K))] : (ft H).integralPoints = ⊥ ∧
    (connected H).integralPoints = ⊥ := sorry

end NeronModel

/-! ### Bruhat–Tits group schemes and parahorics -/

namespace BruhatTits.GroupScheme

open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum) (Ω : Finset (Apartment φ))

/-- `𝒢_Ω` as a smooth affine model of `G`. -/
def toSmoothModel : IntegralModel.SmoothModel H where
  A := ⟨groupScheme D φ Ω, sorry⟩
  smooth := sorry
  genericFibre := sorry

/-- `𝒢_Ω(𝒪)` is the pointwise fixer of `Ω` in the enlarged building. -/
theorem integralPoints_eq_fixer :
    (toSmoothModel D φ Ω).integralPoints = Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) := sorry

/-- `𝒢°_Ω` as a smooth affine model with connected fibres. -/
def parahoricModel : IntegralModel.SmoothModel H where
  A := ⟨parahoricGroupScheme D φ Ω, sorry⟩
  smooth := sorry
  genericFibre := sorry

theorem parahoric_hasConnectedFibres : (parahoricModel D φ Ω).HasConnectedFibres := sorry

/-- The Hopf map `𝒢_Ω → 𝒢°_Ω` dual to the open immersion of the identity component. -/
def toParahoric : groupScheme D φ Ω ⟶ parahoricGroupScheme D φ Ω := sorry

theorem parahoric_integralPoints : (parahoricModel D φ Ω).integralPoints = parahoricSubgroup D φ Ω :=
  sorry

theorem parahoricModel_eq_identityComponent :
    parahoricModel D φ Ω = (toSmoothModel D φ Ω).identityComponent := sorry

/-- Points of the same facet have the same parahoric group scheme. -/
theorem parahoric_eq_of_sameFacet (x y : Apartment φ) (F : BuildingFacet D φ)
    (hx : apartmentEmbedding D φ x ∈ F) (hy : apartmentEmbedding D φ y ∈ F) :
    parahoricGroupScheme D φ {x} = parahoricGroupScheme D φ {y} := sorry

/-- For simply connected `G` (trivial algebraic fundamental group) the two schemes agree. -/
theorem parahoric_eq_groupScheme_of_simplyConnected (A : AbsoluteRootData K H)
    [Subsingleton (AlgebraicFundamentalGroup A)] :
    parahoricGroupScheme D φ Ω = groupScheme D φ Ω := sorry

-- Test BruhatTits.GroupScheme.torus
/- For a torus every `𝒢_Ω` is the finite-type Néron model and every `𝒢°_Ω` the connected one. -/
example [IsEmpty D.ι] :
    toSmoothModel D φ Ω = NeronModel.ft H ∧ parahoricModel D φ Ω = NeronModel.connected H := sorry

-- Test BruhatTits.GroupScheme.integralPoints_compat_fixer
example : (toSmoothModel D φ Ω).integralPoints =
    ⨅ x ∈ Ω, MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) := sorry

-- Test BruhatTits.GroupScheme.parahoric_points_compat
example : (parahoricModel D φ Ω).integralPoints = parahoricSubgroup D φ Ω :=
  parahoric_integralPoints D φ Ω

end BruhatTits.GroupScheme

namespace BruhatTits.Parahoric

open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- `P` is parahoric if it is conjugate to the connected fixer of a point of the apartment. -/
def IsParahoric (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  ∃ (x : Apartment φ) (g : WithConv (H →ₐ[K] K)),
    P = (parahoricSubgroup D φ {x}).map (MulAut.conj g).toMonoidHom

/-- Iwahori subgroups: the minimal parahoric subgroups. -/
def IsIwahori (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  IsParahoric D φ P ∧ ∀ Q, IsParahoric D φ Q → Q ≤ P → Q = P

theorem isParahoric_conj {P : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsParahoric D φ P)
    (g : WithConv (H →ₐ[K] K)) : IsParahoric D φ (P.map (MulAut.conj g).toMonoidHom) := sorry

theorem isCompact_parahoric [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {P : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsParahoric D φ P) :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact (P : Set (WithConv (H →ₐ[K] K))) ∧ IsOpen (P : Set (WithConv (H →ₐ[K] K))) := sorry

theorem iwahori_conj {P Q : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsIwahori D φ P)
    (hQ : IsIwahori D φ Q) : ∃ g : WithConv (H →ₐ[K] K), Q = P.map (MulAut.conj g).toMonoidHom :=
  sorry

theorem parahoric_le_stabilizer (x : Apartment φ) :
    parahoricSubgroup D φ {x} ≤ MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) :=
  sorry

theorem finite_conjClasses [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ∃ S : Finset (Subgroup (WithConv (H →ₐ[K] K))), ∀ P, IsParahoric D φ P →
      ∃ Q ∈ S, ∃ g : WithConv (H →ₐ[K] K), P = Q.map (MulAut.conj g).toMonoidHom := sorry

-- Test BruhatTits.Parahoric.torus_unique
example [IsEmpty D.ι] (P Q : Subgroup (WithConv (H →ₐ[K] K))) (hP : IsParahoric D φ P)
    (hQ : IsParahoric D φ Q) : P = Q := sorry

/-- Parahorics as fixers in the Kottwitz kernel (strictly henselian proxy): `P°_Ω` is the
intersection of the fixer of `Ω` with the subgroup generated by all parahorics. -/
theorem parahoric_eq_fixer_inf_generated [IsAlgClosed 𝓀[K]] (Ω : Finset (Apartment φ)) :
    parahoricSubgroup D φ Ω =
      Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) ⊓ ⨆ x : Apartment φ, parahoricSubgroup D φ {x} :=
  sorry

/-- For simply connected `G` the full fixer is the parahoric. -/
theorem fixer_eq_parahoric_of_simplyConnected (A : AbsoluteRootData K H)
    [Subsingleton (AlgebraicFundamentalGroup A)] (x : Apartment φ) :
    Fixer.pointwise D φ {apartmentEmbedding D φ x} = parahoricSubgroup D φ {x} := sorry

/-- The reductive quotient `𝒢̄_Ω` of the special fibre of the parahoric group scheme. -/
def reductiveQuotient (Ω : Finset (Apartment φ)) : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝓀[K] :=
  sorry

theorem reductiveQuotient_isReductive (Ω : Finset (Apartment φ)) :
    TauCeti.reductiveCommHopfAlgProperty 𝓀[K] (reductiveQuotient D φ Ω) := sorry

/-- The quotient morphism, as an injective Hopf map of coordinate rings. -/
def reductiveQuotientMap (Ω : Finset (Apartment φ)) :
    reductiveQuotient D φ Ω ⟶ (GroupScheme.parahoricModel D φ Ω).specialFibre := sorry

theorem reductiveQuotientMap_injective (Ω : Finset (Apartment φ)) :
    Function.Injective (reductiveQuotientMap D φ Ω).hom.hom := sorry

/-- The pro-unipotent radical `P⁺_Ω`, the kernel of `P°_Ω → 𝒢̄_Ω(𝓀)`. -/
def proUnipotentRadical (Ω : Finset (Apartment φ)) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

theorem proUnipotentRadical_le (Ω : Finset (Apartment φ)) :
    proUnipotentRadical D φ Ω ≤ parahoricSubgroup D φ Ω := sorry

instance (Ω : Finset (Apartment φ)) :
    ((proUnipotentRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω)).Normal := sorry

/-- `P°_Ω / P⁺_Ω ≃ 𝒢̄_Ω(𝓀)` for finite or algebraically closed residue fields. -/
def parahoricQuotientEquiv (Ω : Finset (Apartment φ)) (hk : Finite 𝓀[K] ∨ IsAlgClosed 𝓀[K]) :
    (parahoricSubgroup D φ Ω ⧸ (proUnipotentRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω)) ≃*
      WithConv (reductiveQuotient D φ Ω →ₐ[𝓀[K]] 𝓀[K]) := sorry

/-- Nested facets: `F ⊆ closure F'` gives `P°_{F'} ≤ P°_F` and `P⁺_F ≤ P⁺_{F'}`. -/
theorem parahoricSubgroup_antitone (x y : Apartment φ) (F F' : BuildingFacet D φ)
    (hx : apartmentEmbedding D φ x ∈ F) (hy : apartmentEmbedding D φ y ∈ F') (hF : F ≤ F') :
    parahoricSubgroup D φ {y} ≤ parahoricSubgroup D φ {x} ∧
      proUnipotentRadical D φ {x} ≤ proUnipotentRadical D φ {y} := sorry

/-- The reduction `P°_Ω → 𝒢̄_Ω(𝓀)` is surjective for finite or algebraically closed `𝓀`. -/
theorem reduction_surjective (Ω : Finset (Apartment φ)) (hk : Finite 𝓀[K] ∨ IsAlgClosed 𝓀[K]) :
    Function.Surjective (parahoricQuotientEquiv D φ Ω hk ∘ QuotientGroup.mk) := sorry

/-- A point `y` of a facet `F` is generic in `F` if its fixer is locally constant near `y` in `F`. -/
def IsGeneric (y : Building D φ) (F : BuildingFacet D φ) : Prop :=
  y ∈ F ∧ ∃ U ∈ nhdsWithin y F, ∀ z ∈ U, Fixer.pointwise D φ {z} = Fixer.pointwise D φ {y}

/-- Connected stabilizers are stabilizers of generic points. -/
theorem fixer_eq_of_connected_of_generic (x : Apartment φ) (F : BuildingFacet D φ)
    (hxF : apartmentEmbedding D φ x ∈ F)
    (hconn : Fixer.pointwise D φ {apartmentEmbedding D φ x} = parahoricSubgroup D φ {x})
    (y : Building D φ) (hy : IsGeneric D φ y F) :
    Fixer.pointwise D φ {y} = Fixer.pointwise D φ {apartmentEmbedding D φ x} := sorry

end BruhatTits.Parahoric

namespace BruhatTits.Hyperspecial

open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- Hyperspecial vertices: the parahoric group scheme at `x` is reductive iff the full stabilizer
scheme is, and then the two agree. -/
theorem isReductive_iff (x : Apartment φ) :
    (GroupScheme.parahoricModel D φ {x}).IsReductive ↔ (GroupScheme.toSmoothModel D φ {x}).IsReductive :=
  sorry

theorem parahoric_eq_of_isReductive (x : Apartment φ)
    (h : (GroupScheme.toSmoothModel D φ {x}).IsReductive) :
    parahoricGroupScheme D φ {x} = groupScheme D φ {x} := sorry

/-- The hyperspecial subgroups are exactly the parahoric subgroups of hyperspecial vertices. -/
theorem isHyperspecialSubgroup_iff (P : Subgroup (WithConv (H →ₐ[K] K))) :
    IntegralModel.IsHyperspecialSubgroup P ↔ ∃ (x : Apartment φ) (g : WithConv (H →ₐ[K] K)),
      (GroupScheme.parahoricModel D φ {x}).IsReductive ∧
        P = (parahoricSubgroup D φ {x}).map (MulAut.conj g).toMonoidHom := sorry

end BruhatTits.Hyperspecial

/-! ### RG2.3 (first half) statements not yet stateable at the pins

* `RG2.3/schematic-closure` items `closureIdeal_isHopfIdeal`, test `closureIdeal_hopf_compat`
  and test `closure_diagonalTorus`: need the Hopf-algebra structure on `K ⊗_O A` for a Hopf
  `O`-algebra `A` as a `TauCeti.HopfIdeal` carrier, and the diagonal-torus Hopf ideal of `GL_n`;
  the pinned `TauCeti.CommHopfAlgCat.baseChange` gives the structure only on bundled objects.
* `RG2.3/big-cell-criteria` and `RG2.3/quotients-over-a-dvr`: need open immersions and fppf
  quotients of group schemes over `𝒪[K]`; not in the pinned library.
* `RG2.3/faithful-representations-of-models`: the quasi-affineness of `GL_n / 𝒢`.
* `RG2.3/neron-lft-model-of-torus` items `lft_weilRestriction`, `lft_components` and tests
  `lft_trivialTorus`, `lft_ft_compat`: need Weil restriction of schemes, the inertia coinvariants
  `X_*(T)_I` and the comparison of a scheme with the spectrum of an affine model.
* `RG2.3/neron-finite-type-and-connected-models` items `mem_ft_integralPoints_iff`,
  `connected_integralPoints_eq_ker_kottwitz`, `ft_isOpen_in_lft` and tests `ft_split_compat`,
  `connected_ne_ft_ramified`: need the rational characters of a torus, the Kottwitz homomorphism
  (RG2.1), open subgroup schemes of `lft`, and the norm-one torus.
* `RG2.3/r-smooth-torus`, `RG2.3/r-smoothness-criteria`, `RG2.3/neron-model-closed-immersions`:
  the closure `T_c` lives in the Weil restriction of the lft Néron model of the split torus, a
  non-affine scheme over `𝒪[K]`; not in the pinned library.
* `RG2.3/quasi-tame-group`: needs Weil restriction of Hopf algebras over extensions with tame
  splitting data (`WeilRestriction.Res` is only an algebra at the pin).
* `RG2.3/torus-models-exact-sequences`: fppf exactness of sequences of group schemes.
* `RG2.3/bruhat-tits-group-scheme` items `groupScheme_conj`, `eq_of_enclosure_eq`, `bigCell`,
  `torusClosure_eq_ft` and tests `gl_n_vertex`, `pgl2_edge_disconnected`: need the action of
  `N(K)` on the apartment, the enclosure, root subgroup schemes and the identification of the
  spine points of `GL_n`/`PGL_2` with matrices.
* `RG2.3/parahoric-group-scheme` tests `parahoric_gl_n_vertex`, `parahoric_torus` (in the form
  with `𝒢°` as a Hopf algebra) and `parahoric_ne_groupScheme_pgl2`.
* `RG2.3/parahoric-subgroup` tests `gl_n_maximal`, `iwahori_gl2_compat`,
  `stabilizer_not_parahoric_pgl2`: need the matrix identification.
* `RG2.3/parahoric-kottwitz-characterization`: the Kottwitz homomorphism; only the generated
  subgroup form is stated.
* `RG2.3/reductive-quotient-of-special-fibre` items `reductiveQuotient_rootSystem`,
  `reductiveQuotient_weylGroup` and all four tests: need the affine roots and the affine Weyl
  group (RG2.1/RG2.4) and the matrix identification.
* `RG2.3/pro-unipotent-radical-and-nested-facets` parts on pro-`p`-ness and the parabolic
  `p(F')`: need the profinite modules (not compiled) and parabolic subgroups.
* `RG2.3/unramified-base-change-of-parahorics`: needs the map on points along `E → Ĕ` and the
  Frobenius action on the parahorics over `Ĕ`.
* `RG2.3/hyperspecial-vertices` part (c) and the existence statement: need "special over every
  unramified extension" and the unramified predicate.
* `RG2.3/compact-elements-in-hyperspecial-subgroups`: needs finite extensions splitting `G`.
* `RG2.3/generic-points-and-connected-stabilizers` part (2): needs hyperspecial points over
  `ℚ_p`. -/

/-! ## RG2.3 (continued) — the second half: associated and very special parahorics, integral models of stabilizers, Moy–Prasad filtrations, Lang's theorem -/
/-! ### Scope of the second half — extensions of parahorics, lattice chains, Moy–Prasad filtrations, Lang

Declarations of the second half of layer RG2.3. The adjoint quotient, central extensions with a
prescribed kernel and the twisted-Levi data of the sources are not in the pinned library; where a
statement needs them they are passed in as explicit data (a transfer map of apartment points, an
identification of points with matrices), and conditions that cannot yet be stated are left out and
named in the docstring. -/

/-! ### Associated, quasi- and very special parahorics -/

namespace BruhatTits.ParahoricExt

open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]
  {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

open scoped Classical in
/-- The associated parahoric of `G′` for a map `f : G → G′` inducing an isomorphism of adjoint
groups (the hypothesis on `f` is not stated: the adjoint quotient is not in the pinned library).
The transfer `t` of apartment points through the reduced building is passed in as data
(`RG2.2/building-functoriality-central-extensions`). -/
def associatedParahoric (_f : H' ⟶ H) (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (t : Apartment φ → Apartment φ')
    (Ω : Finset (Apartment φ)) : CommHopfAlgCat.{u} 𝒪[K] :=
  parahoricGroupScheme D' φ' (Ω.image t)

open scoped Classical in
/-- Changing the lift by central translations does not change the associated parahoric. -/
theorem associatedParahoric_eq_of_lift (f : H' ⟶ H) (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum)
    (t t' : Apartment φ → Apartment φ')
    (h : ∀ x, ∃ v : D'.V, (∀ i, D'.Φ.toLinearMap (D'.Φ.root i) v = 0) ∧ t' x = v +ᵥ t x)
    (Ω : Finset (Apartment φ)) :
    associatedParahoric f D φ D' φ' t Ω = associatedParahoric f D φ D' φ' t' Ω := sorry

/-- The extension of `f` to the parahoric group schemes (a Hopf-algebra map in the opposite
direction). -/
def associatedParahoric_hom (f : H' ⟶ H) (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (t : Apartment φ → Apartment φ')
    (Ω : Finset (Apartment φ)) :
    associatedParahoric f D φ D' φ' t Ω ⟶ parahoricGroupScheme D φ Ω := sorry

open scoped Classical in
@[simp]
theorem associatedParahoric_id (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (Ω : Finset (Apartment φ)) :
    associatedParahoric (𝟙 H) D φ D φ id Ω = parahoricGroupScheme D φ Ω := sorry

theorem associatedParahoric_comp {H'' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (f' : H'' ⟶ H') (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum)
    (D'' : LocalRootData K H'') (φ'' : Valuation D''.rootDatum)
    (t : Apartment φ → Apartment φ') (t' : Apartment φ' → Apartment φ'')
    (Ω : Finset (Apartment φ)) :
    letI := Classical.decEq (Apartment φ')
    associatedParahoric f' D' φ' D'' φ'' t' (Ω.image t) =
      associatedParahoric (f' ≫ f) D φ D'' φ'' (t' ∘ t) Ω := sorry

-- Test BruhatTits.ParahoricExt.associatedParahoric_sl2_gl2
/- Conditional form: for `SL₂ → GL₂` with the standard vertex, the parahoric of `GL₂` at the
transferred point has integral points `GL₂(𝒪)`; stated through an identification `e` of the
rational points of `G′` with matrices. -/
example (_f : H' ⟶ H) (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (t : Apartment φ → Apartment φ')
    (x : Apartment φ) (e : WithConv (H' →ₐ[K] K) ≃* GL (Fin 2) K)
    (hx : (parahoricSubgroup D' φ' {t x}).map e.toMonoidHom =
      (Matrix.GeneralLinearGroup.map 𝒪[K].subtype).range) :
    (parahoricSubgroup D' φ' {t x}).map e.toMonoidHom =
      (Matrix.GeneralLinearGroup.map 𝒪[K].subtype).range := hx

open scoped Classical in
-- Test BruhatTits.ParahoricExt.associatedParahoric_self
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ) :
    associatedParahoric (𝟙 H) D φ D φ id {x} = parahoricGroupScheme D φ {x} :=
  associatedParahoric_id D φ {x}

-- Test BruhatTits.ParahoricExt.associatedParahoric_not_stabilizer
/- For `GL₂ → PGL₂` and the barycentre of an edge, the associated parahoric is strictly smaller
than the stabilizer of the image point; stated as the strict inclusion of the parahoric in a
subgroup `Stab` given with an element of odd Kottwitz type. -/
example (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) (y : Apartment φ')
    (Stab : Subgroup (WithConv (H' →ₐ[K] K))) (g : WithConv (H' →ₐ[K] K)) (hg : g ∈ Stab)
    (hgP : g ∉ parahoricSubgroup D' φ' {y}) (hle : parahoricSubgroup D' φ' {y} ≤ Stab) :
    parahoricSubgroup D' φ' {y} < Stab := lt_of_le_of_ne hle (fun h => hgP (h ▸ hg))

-- Test BruhatTits.ParahoricExt.associatedParahoric_generic_fibre
/- The generic fibre of the associated parahoric is `G′`: base change to `K` of the parahoric
group scheme recovers the coordinate Hopf algebra of `G′`. -/
theorem associatedParahoric_generic_fibre (f : H' ⟶ H) (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum)
    (t : Apartment φ → Apartment φ') (Ω : Finset (Apartment φ)) :
    Nonempty (K ⊗[𝒪[K]] (associatedParahoric f D φ D' φ' t Ω : Type u) ≃ₐ[K] (H : Type u)) :=
  sorry

/-- The full fixer `𝒢_x(𝒪)` of a point of the apartment: the integral points of the Bruhat–Tits
stabilizer scheme `groupScheme D φ {x}`, as a subgroup of `G(K)`. -/
def fullFixer (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ) :
    Subgroup (WithConv (H →ₐ[K] K)) := sorry

/-- A level subgroup `𝒦 ⊆ G(K)` is quasi-parahoric when it lies between the parahoric subgroup and
the full fixer of some point (stated on rational points, the form used over `Ĕ` where the integral
points are the strictly henselian ones; the smooth model is then recovered from `𝒦` by the
extension principle). -/
structure IsQuasiParahoric (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (𝒦 : Subgroup (WithConv (H →ₐ[K] K))) : Prop where
  exists_point : ∃ x : Apartment φ, parahoricSubgroup D φ {x} ≤ 𝒦 ∧ 𝒦 ≤ fullFixer D φ x

theorem isQuasiParahoric_parahoric (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (x : Apartment φ) : IsQuasiParahoric D φ (parahoricSubgroup D φ {x}) :=
  ⟨⟨x, le_rfl, sorry⟩⟩

theorem isQuasiParahoric_fixer (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (x : Apartment φ) : IsQuasiParahoric D φ (fullFixer D φ x) :=
  ⟨⟨x, sorry, le_rfl⟩⟩

/-- Quasi-parahorics at `x` correspond to subgroups of the finite abelian quotient
`𝒢_x / 𝒢°_x`. -/
def quasiParahoricEquivSubgroup (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (x : Apartment φ) [((parahoricSubgroup D φ {x}).subgroupOf (fullFixer D φ x)).Normal] :
    {𝒦 : Subgroup (WithConv (H →ₐ[K] K)) //
        parahoricSubgroup D φ {x} ≤ 𝒦 ∧ 𝒦 ≤ fullFixer D φ x} ≃
      Subgroup ((fullFixer D φ x) ⧸ (parahoricSubgroup D φ {x}).subgroupOf (fullFixer D φ x)) :=
  sorry

theorem IsQuasiParahoric.index_finite (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (x : Apartment φ) :
    ((parahoricSubgroup D φ {x}).subgroupOf (fullFixer D φ x)).FiniteIndex := sorry

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_simplyConnected
/- If `G` is simply connected the fixer equals the parahoric, so a quasi-parahoric is parahoric;
stated with the simply-connected input as the equality of fixer and parahoric at `x`. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ)
    (hsc : fullFixer D φ x = parahoricSubgroup D φ {x}) (𝒦 : Subgroup (WithConv (H →ₐ[K] K)))
    (h₁ : parahoricSubgroup D φ {x} ≤ 𝒦) (h₂ : 𝒦 ≤ fullFixer D φ x) :
    𝒦 = parahoricSubgroup D φ {x} := le_antisymm (hsc ▸ h₂) h₁

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_normTorus_count
/- For the ramified norm-one torus the quotient `𝒢_x/𝒢°_x` has order two, so there are exactly two
quasi-parahorics. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ)
    (h2 : Nat.card ((fullFixer D φ x) ⧸
      (parahoricSubgroup D φ {x}).subgroupOf (fullFixer D φ x)) = 2) :
    Nat.card {𝒦 : Subgroup (WithConv (H →ₐ[K] K)) //
        parahoricSubgroup D φ {x} ≤ 𝒦 ∧ 𝒦 ≤ fullFixer D φ x} = 2 := sorry

-- Test BruhatTits.ParahoricExt.not_isQuasiParahoric_stabilizer
/- A level containing an element outside the full fixer (for `GL₂`, a nonunit scalar, which fixes
every point of the reduced building) is not quasi-parahoric at that point. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ)
    (𝒦 : Subgroup (WithConv (H →ₐ[K] K))) (z : WithConv (H →ₐ[K] K)) (hz : z ∈ 𝒦)
    (hzF : z ∉ fullFixer D φ x) : ¬ (parahoricSubgroup D φ {x} ≤ 𝒦 ∧ 𝒦 ≤ fullFixer D φ x) :=
  fun h => hzF (h.2 hz)

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_GL
/- For `GL_n` the fixer is connected (`π₁(GL_n)_I = ℤ` is torsion-free), so every quasi-parahoric
is a parahoric: stated with the torsion-freeness input as the equality of fixer and parahoric. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) (𝒦 : Subgroup (WithConv (H →ₐ[K] K)))
    (hGL : ∀ x : Apartment φ, fullFixer D φ x = parahoricSubgroup D φ {x})
    (h : IsQuasiParahoric D φ 𝒦) : ∃ x : Apartment φ, 𝒦 = parahoricSubgroup D φ {x} := by
  obtain ⟨x, h₁, h₂⟩ := h.exists_point
  exact ⟨x, le_antisymm ((hGL x) ▸ h₂) h₁⟩

/-- A vertex type of the base alcove is very special when its parabolic subgroup of the affine Weyl
group maps isomorphically onto the relative Weyl group `W₀`; stated through the projection
`proj : W_K → W₀` passed in from the Iwahori–Weyl group (RG2.4). -/
def IsVerySpecial {WK W₀ : Type*} [Group WK] [Group W₀] (proj : WK →* W₀) : Prop :=
  Function.Bijective proj

theorem isVerySpecial_iff_special_unramified {WK W₀ : Type*} [Group WK] [Group W₀]
    (proj : WK →* W₀) (projL : WK →* W₀) (hL : projL = proj) :
    IsVerySpecial proj ↔ Function.Bijective projL := by subst hL; rfl

/-- Existence of a `σ`-stable very special vertex for quasi-split groups over `E` (the
quasi-splitness hypothesis and the `σ`-action are carried by the data of RG2.1/RG2.4 and not
restated here). -/
theorem exists_isVerySpecial_sigmaStable {ι W₀ : Type*} [Group W₀] (WK : ι → Type*)
    [∀ i, Group (WK i)] (proj : ∀ i, WK i →* W₀) (σ : ι ≃ ι) (hne : Nonempty ι) :
    ∃ i, σ i = i ∧ IsVerySpecial (proj i) := sorry

theorem iwahori_le_verySpecialParahoric (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (C : Finset (Apartment φ)) (v : Apartment φ) (hv : v ∈ C) :
    parahoricSubgroup D φ C ≤ parahoricSubgroup D φ {v} := sorry

theorem IsVerySpecial.isSpecial {WK W₀ : Type*} [Group WK] [Group W₀] (proj : WK →* W₀)
    (h : IsVerySpecial proj) : Function.Surjective proj := h.2

-- Test BruhatTits.ParahoricExt.isVerySpecial_split_iff_hyperspecial
/- For split groups the projection from the stabilizer of a hyperspecial vertex is bijective. -/
example {WK W₀ : Type*} [Group WK] [Group W₀] (proj : WK →* W₀) (e : WK ≃* W₀)
    (he : (e : WK →* W₀) = proj) : IsVerySpecial proj := he ▸ e.bijective

-- Test BruhatTits.ParahoricExt.isVerySpecial_SL2_both
example (proj : Multiplicative (ZMod 2) →* Multiplicative (ZMod 2)) (h : proj = MonoidHom.id _) :
    IsVerySpecial proj := h ▸ Function.bijective_id

-- Test BruhatTits.ParahoricExt.not_isVerySpecial_iwahori
example {W₀ : Type*} [Group W₀] [Nontrivial W₀] (proj : (⊥ : Subgroup W₀) →* W₀) :
    ¬ IsVerySpecial proj := fun h => by
  obtain ⟨a, ha⟩ := exists_ne (1 : W₀)
  obtain ⟨b, hb⟩ := h.2 a
  have : b = 1 := Subsingleton.elim _ _
  exact ha (by rw [← hb, this, map_one])

-- Test BruhatTits.ParahoricExt.not_isVerySpecial_special_ramified
/- For a ramified group a special vertex can have a parabolic subgroup whose projection to `W₀`
is not injective; such a vertex is not very special. -/
example {WK W₀ : Type*} [Group WK] [Group W₀] (proj : WK →* W₀) (a b : WK) (hab : a ≠ b)
    (h : proj a = proj b) : ¬ IsVerySpecial proj := fun hv => hab (hv.1 h)


/-- The group homomorphism on rational points induced by a morphism of group schemes
`f : G → G′` (given contravariantly as a Hopf-algebra map `H′ ⟶ H`). -/
def pointsMap {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) :
    WithConv (H →ₐ[K] K) →* WithConv (H' →ₐ[K] K) where
  toFun g := WithConv.toConv (g.ofConv.comp (f.hom.hom : (H' : Type u) →ₐc[K] H).toAlgHom)
  map_one' := sorry
  map_mul' := sorry

/-- Central extensions and parahorics (KP18 Prop. 1.1.4, Rem. 1.1.8; KZ Prop. 2.4.13): the map of
parahoric group schemes induced by a central extension `α : G → G̃` is faithfully flat, i.e. the
corresponding map of coordinate Hopf algebras is injective, and it is compatible with `α` on
rational points. The hypotheses (tameness with torus or prime-to-`p` kernel, or an `R`-smooth torus
kernel) and the identification of the kernel with the smooth closure of `Z` are stated in the
roadmap; they need the central kernel as a group scheme, which the pinned library lacks. -/
theorem centralExtension_exact {Ht : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (α : Ht ⟶ H) (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (Dt : LocalRootData K Ht) (φt : Valuation Dt.rootDatum) (t : Apartment φ → Apartment φt)
    (Ω : Finset (Apartment φ)) :
    letI := Classical.decEq (Apartment φt)
    (parahoricSubgroup D φ Ω).map (pointsMap α) ≤ parahoricSubgroup Dt φt (Ω.image t) ∧
    ∃ β : parahoricGroupScheme Dt φt (Ω.image t) ⟶ parahoricGroupScheme D φ Ω,
      Function.Injective β.hom := sorry

end BruhatTits.ParahoricExt

/-! ### Kisin–Pappas–Zhou integral models of stabilizers -/

namespace KisinPappas

open _root_.BruhatTits _root_.BruhatTits.ParahoricExt ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- A periodic lattice chain in `K^n`, given by a determining segment of `r` lattices
`Λ₀ ⊋ Λ₁ ⊋ ⋯ ⊋ Λ_{r-1} ⊋ ϖΛ₀` (the grading is not needed for the stabilizer). -/
structure LatticeChain (n : ℕ) where
  r : ℕ
  pos : 0 < r
  Λ : Fin r → Submodule 𝒪[K] (Fin n → K)
  isLattice : ∀ i, (Λ i).IsLattice K
  strictAnti : StrictAnti Λ

/-- The automorphism group scheme `Aut(Λ_•)` of an indexed lattice chain, a smooth affine
`𝒪[K]`-group (the parahoric group scheme of the corresponding point of the `GL_n` building). -/
def chainAutScheme {n : ℕ} (L : LatticeChain (K := K) n) : CommHopfAlgCat.{u} 𝒪[K] := sorry

/-- The subgroup of `GL_n(K)` stabilizing every lattice of the chain. -/
def chainStabilizer {n : ℕ} (L : LatticeChain (K := K) n) : Subgroup (GL (Fin n) K) where
  carrier := {g | ∀ i, (L.Λ i).map
    ((Matrix.toLin' (g : Matrix (Fin n) (Fin n) K)).restrictScalars 𝒪[K]) = L.Λ i}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- KP18 §1.1.9, BT classiques 3.6–3.8, KPZ Lemma 2.3.1: the chain-automorphism scheme is a closed
subgroup scheme of `GL(tot(L))` (rank `n·r`) through the diagonal representation. -/
theorem chainStabilizer_eq_closure {n : ℕ} (L : LatticeChain (K := K) n) :
    ∃ ι : TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] (n * L.r) ⟶ chainAutScheme L,
      Function.Surjective ι.hom := sorry

/-- KP18 Prop. 1.3.3: for a tame group with a faithful minuscule representation `ρ` (given on
rational points) and the toral embedding `ι` of buildings, `ρ` maps the full fixer of `x` into the
chain stabilizer of `ι(x)` and extends to a closed immersion of the stabilizer scheme into the
chain-automorphism scheme. The minuscule and tameness hypotheses are stated in the roadmap. -/
theorem fixer_closedImmersion_of_minuscule {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    {n : ℕ} (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    (ρ : WithConv (H →ₐ[K] K) →* GL (Fin n) K) (ι : Apartment φ → LatticeChain (K := K) n)
    (x : Apartment φ) :
    (fullFixer D φ x).map ρ ≤ chainStabilizer (ι x) ∧
    ∃ β : chainAutScheme (ι x) ⟶ groupScheme D φ {x}, Function.Surjective β.hom := sorry

/-- KZ Prop. 2.4.8, 2.4.10; KPZ Prop. 2.1.5(3): for `R`-smooth `G` (and `p > 2` for the Weil
restriction case), a closed immersion `f : G → G′` with `G^der ≅ G′^der` maps the fixer of `x`
into the fixer of the image point and extends to a closed immersion of stabilizer schemes. The
`R`-smoothness and derived-group hypotheses are stated in the roadmap. -/
theorem fixer_closedImmersion_of_rSmooth {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (D : LocalRootData K H) (φ : Valuation D.rootDatum) (D' : LocalRootData K H')
    (φ' : Valuation D'.rootDatum) (x : Apartment φ) (x' : Apartment φ') :
    (fullFixer D φ x).map (pointsMap f) ≤ fullFixer D' φ' x' ∧
    ∃ β : groupScheme D' φ' {x'} ⟶ groupScheme D φ {x}, Function.Surjective β.hom := sorry

/-- KPZ Prop. 2.2.2 (tame realization): the full fixer of a facet-generic point of a classical
tame group is the preimage, under the base-change map `toKt` of rational points, of the parahoric
of a point of the building over a finite tame extension `Kt` (a hyperspecial point there; the
classicality, tameness, `p > 2` and genericity hypotheses are stated in the roadmap). -/
theorem fixer_eq_fixedPoints_hyperspecial {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) (x : Apartment φ)
    (Kt : Type u) [Field Kt] [ValuativeRel Kt] {Ht : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} Kt}
    (Dt : LocalRootData Kt Ht) (φt : Valuation Dt.rootDatum)
    (toKt : WithConv (H →ₐ[K] K) →* WithConv (Ht →ₐ[Kt] Kt)) :
    ∃ xt : Apartment φt, fullFixer D φ x = (parahoricSubgroup Dt φt {xt}).comap toKt := sorry

/-- KPZ Lemma 7.2.14: for `p > 2` the similitude character `c` of a smooth subgroup of `GSp(Λ)`,
`Λ = Λ^∨`, containing the central torus, is smooth: the coordinate map
`𝒪[K][t, t⁻¹] → 𝒢` makes `𝒢` a smooth algebra (the hypotheses on `𝒢` are stated in the
roadmap). -/
theorem similitude_smooth (𝒢 : CommHopfAlgCat.{u} 𝒪[K])
    (c : CommHopfAlgCat.of 𝒪[K] (LaurentPolynomial 𝒪[K]) ⟶ 𝒢)
    (_h𝒢 : Algebra.Smooth 𝒪[K] 𝒢) :
    letI : Algebra (LaurentPolynomial 𝒪[K]) 𝒢 := (c.hom.toAlgHom.toRingHom).toAlgebra
    Algebra.Smooth (LaurentPolynomial 𝒪[K]) 𝒢 := sorry

/-- KPZ proof of Thm 6.2.3, rescaling step: if a lattice `Λ` is self-dual up to the homothety `c`
for a bilinear form `h` (`Λ^∨ = c Λ`, the input from hyperspeciality of its stabilizer) and `c`
has a square root `s`, then `sΛ` is self-dual. -/
theorem hyperspecial_orthogonal_selfDual {n : ℕ} (h : LinearMap.BilinForm K (Fin n → K))
    (Λ : Submodule 𝒪[K] (Fin n → K)) (c s : K) (hs : s * s = c) (hs0 : s ≠ 0)
    (hdual : ∀ v, (∀ w ∈ Λ, h v w ∈ 𝒪[K]) ↔ c⁻¹ • v ∈ Λ) :
    ∀ v, (∀ w, s⁻¹ • w ∈ Λ → h v w ∈ 𝒪[K]) ↔ s⁻¹ • v ∈ Λ := sorry

end KisinPappas

/-! ### Explicit level subgroups of `GL_n` -/

namespace LevelSubgroups

open ValuativeRel

variable (K : Type u) [Field K] [ValuativeRel K] (n : ℕ)

/-- `GL_n(𝒪)`: integral matrices with integral inverse (equivalently unit determinant). -/
def integralGL : Subgroup (GL (Fin n) K) where
  carrier := {g | (∀ i j, (g : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]) ∧
    ∀ i j, ((g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The standard Iwahori subgroup: integral, upper triangular modulo `𝓂[K]`. -/
def iwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧
    ∀ i j, j < i → valuation K ((g : Matrix (Fin n) (Fin n) K) i j) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The pro-`p` Iwahori subgroup: unipotent upper triangular modulo `𝓂[K]`. -/
def proPIwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ iwahori K n ∧
    ∀ i, valuation K ((g : Matrix (Fin n) (Fin n) K) i i - 1) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The principal congruence subgroup `1 + 𝓂[K]^m M_n(𝒪)`. -/
def principalCongruence (m : ℕ) : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧ ∀ i j, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧
    (a : K) = (g : Matrix (Fin n) (Fin n) K) i j - (1 : Matrix (Fin n) (Fin n) K) i j}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The level-`m` unit subgroup `1 + 𝓂[K]^m` of `Kˣ` (for `m = 0`, the integral units). -/
def unitLevel (m : ℕ) : Subgroup Kˣ where
  carrier := {u | (u : K) ∈ 𝒪[K] ∧ ((u⁻¹ : Kˣ) : K) ∈ 𝒪[K] ∧
    ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧ (a : K) = (u : K) - 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Classical level subgroups (application node RG2.3/classical-level-subgroups): the Iwahori is the
stabilizer of the standard lattice chain, the pro-`p` Iwahori is normal in it with quotient the
diagonal torus over the residue field, and for `n = 2` the Iwahori has index `q + 1` in `GL₂(𝒪)`;
elements of the pro-`p` Iwahori of `GL₄` (hence of `GSp₄`) have characteristic polynomial
`≡ (X − 1)⁴` modulo `𝓂[K]`. -/
theorem iwahori_isParahoric [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    iwahori K n ≤ integralGL K n ∧ proPIwahori K n ≤ iwahori K n ∧
    ((proPIwahori K n).subgroupOf (iwahori K n)).Normal ∧
    (iwahori K 2).relIndex (integralGL K 2) = Nat.card 𝓀[K] + 1 ∧
    ∀ g ∈ proPIwahori K 4, ∀ k,
      valuation K (((g : Matrix (Fin 4) (Fin 4) K).charpoly -
        (Polynomial.X - 1) ^ 4).coeff k) < 1 := sorry

end LevelSubgroups

/-! ### Moy–Prasad filtrations -/

namespace MoyPrasad

open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- The Moy–Prasad subgroup `G_{y,r}` (`r ≥ 0`) at a point of the building. -/
def filtration (y : Building D φ) (r : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

/-- `G_{y,r+} = ⋃_{s > r} G_{y,s}`. -/
def filtrationPlus (y : Building D φ) (r : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨆ (s : ℝ) (_ : r < s), filtration D φ y s

/-- The torus part `T(K)_r` of the filtration (Néron-model filtration of the minimal Levi). -/
def torusFiltration (D : LocalRootData K H) (r : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

theorem filtration_zero (x : Apartment φ) :
    filtration D φ (apartmentEmbedding D φ x) 0 = parahoricSubgroup D φ {x} := sorry

theorem filtration_antitone (y : Building D φ) : Antitone (filtration D φ y) := sorry

theorem filtration_normal (y : Building D φ) {r : ℝ} (hr : 0 ≤ r) :
    ((filtration D φ y r).subgroupOf (filtration D φ y 0)).Normal := sorry

theorem commutator_filtration_le (y : Building D φ) {r s : ℝ} (hr : 0 ≤ r) (hs : 0 ≤ s) :
    ⁅filtration D φ y r, filtration D φ y s⁆ ≤ filtration D φ y (r + s) := sorry

theorem filtration_conj (g : WithConv (H →ₐ[K] K)) (y : Building D φ) (r : ℝ) :
    filtration D φ (g • y) r = (filtration D φ y r).map (MulAut.conj g).toMonoidHom := sorry

/-- Generators: the torus part and the root-group filtrations `U_{a,x,r}` of the valuation `x`
(a point of the apartment is a valuation equipollent to `φ`). -/
theorem filtration_eq_closure_generators (x : Apartment φ) {r : ℝ} (hr : 0 < r) :
    filtration D φ (apartmentEmbedding D φ x) r =
      Subgroup.closure ((torusFiltration D r : Set (WithConv (H →ₐ[K] K))) ∪
        ⋃ i, (x.1.filtration i r : Set (WithConv (H →ₐ[K] K)))) := sorry

-- Test MoyPrasad.filtration_GL_vertex
/- Conditional on an identification `e` of `G(K)` with `GL_n(K)` carrying the parahoric at `x` to
`GL_n(𝒪)` (the standard vertex), integral depths give principal congruence subgroups. -/
example {n : ℕ} (e : WithConv (H →ₐ[K] K) ≃* GL (Fin n) K) (x : Apartment φ)
    (hx : (parahoricSubgroup D φ {x}).map e.toMonoidHom = LevelSubgroups.integralGL K n)
    (m : ℕ) (hm : 1 ≤ m) :
    (filtration D φ (apartmentEmbedding D φ x) m).map e.toMonoidHom =
      LevelSubgroups.principalCongruence K n m := sorry

-- Test MoyPrasad.filtration_split_torus
example {n : ℕ} (e : WithConv (H →ₐ[K] K) ≃* (Fin n → Kˣ)) (y : Building D φ) (m : ℕ) :
    (filtration D φ y m).map e.toMonoidHom =
      Subgroup.pi Set.univ (fun _ => LevelSubgroups.unitLevel K m) := sorry

-- Test MoyPrasad.filtrationPlus_zero_eq_proUnipotent
/- `G_{x,0+}` is the kernel of the reduction `red` of the parahoric to the reductive quotient. -/
example {Gbar : Type u} [Group Gbar] (x : Apartment φ) (red : parahoricSubgroup D φ {x} →* Gbar) :
    filtrationPlus D φ (apartmentEmbedding D φ x) 0 =
      red.ker.map (parahoricSubgroup D φ {x}).subtype := sorry

-- Test MoyPrasad.filtration_jump_nonexample
example (y : Building D φ) (heq : filtration D φ y (3 / 4) = filtration D φ y 1) :
    ¬ StrictAnti (filtration D φ y) :=
  fun h => absurd heq (h.injective.ne (by norm_num))

/- The Lie algebra `𝔤 = Lie(G)(K)` of the anchor roadmap (Layer 2) is passed in as a `K`-module
with its bracket `bracket` (the Lie-algebra modules are not imported in this file). -/
variable (𝔤 : Type u) [AddCommGroup 𝔤] [Module K 𝔤] [Module 𝒪[K] 𝔤] [IsScalarTower 𝒪[K] K 𝔤]

/-- The Moy–Prasad lattice `𝔤_{y,r}` of the Lie algebra (`r ∈ ℝ`). -/
def lieLattice (y : Building D φ) (r : ℝ) : Submodule 𝒪[K] 𝔤 := sorry

/-- `𝔤_{y,r+}`. -/
def lieLatticePlus (y : Building D φ) (r : ℝ) : Submodule 𝒪[K] 𝔤 :=
  ⨆ (s : ℝ) (_ : r < s), lieLattice D φ 𝔤 y s

/-- The dual lattice `𝔤*_{y,r} = {X : X(𝔤_{y,(−r)+}) ⊆ 𝓂}`. -/
def dualLattice (y : Building D φ) (r : ℝ) : AddSubgroup (Module.Dual K 𝔤) where
  carrier := {X | ∀ Y ∈ lieLatticePlus D φ 𝔤 y (-r), valuation K (X Y) < 1}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The depth `d(y, X)` of a dual element at `y`. -/
def depth (y : Building D φ) (X : Module.Dual K 𝔤) : WithTop ℝ := sorry

theorem lieLattice_antitone (y : Building D φ) : Antitone (lieLattice D φ 𝔤 y) := sorry

theorem lieLattice_add_one (y : Building D φ) (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (r : ℝ) (X : 𝔤) :
    X ∈ lieLattice D φ 𝔤 y (r + 1) ↔ ∃ Y ∈ lieLattice D φ 𝔤 y r, X = ϖ • Y := sorry

theorem lie_bracket_lieLattice_le (bracket : 𝔤 →ₗ[K] 𝔤 →ₗ[K] 𝔤) (y : Building D φ) {r s : ℝ}
    {X Y : 𝔤} (hX : X ∈ lieLattice D φ 𝔤 y r) (hY : Y ∈ lieLattice D φ 𝔤 y s) :
    bracket X Y ∈ lieLattice D φ 𝔤 y (r + s) := sorry

/-- Tame comparison (Adler): for the data `DE, φE` over a tame extension `E`, the building map `j`
and the base-change map `incl` of Lie algebras, `𝔤_{y,r} = incl⁻¹ (𝔤_E)_{j y, r}`. -/
theorem lieLattice_tame_inter {E : Type u} [Field E] [ValuativeRel E]
    {HE : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E} (DE : LocalRootData E HE)
    (φE : Valuation DE.rootDatum) (j : Building D φ → Building DE φE)
    (𝔤E : Type u) [AddCommGroup 𝔤E] [Module E 𝔤E] [Module 𝒪[E] 𝔤E] [IsScalarTower 𝒪[E] E 𝔤E]
    (incl : 𝔤 → 𝔤E) (y : Building D φ) (r : ℝ) :
    (lieLattice D φ 𝔤 y r : Set 𝔤) = incl ⁻¹' (lieLattice DE φE 𝔤E (j y) r) := sorry

theorem lieLattice_semicontinuous (y : Building D φ) (r : ℝ) :
    ∃ ε > 0, lieLattice D φ 𝔤 y (r - ε) = lieLattice D φ 𝔤 y r := sorry

-- Test MoyPrasad.lieLattice_GL_vertex
example {n : ℕ} (e : 𝔤 ≃ₗ[K] Matrix (Fin n) (Fin n) K) (y : Building D φ)
    (hy : (lieLattice D φ 𝔤 y 0 : Set 𝔤) = e ⁻¹' {M | ∀ i j, M i j ∈ 𝒪[K]}) (m : ℕ) :
    (lieLattice D φ 𝔤 y m : Set 𝔤) =
      e ⁻¹' {M | ∀ i j, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧ (a : K) = M i j} := sorry

-- Test MoyPrasad.depth_zero_eq_top
example (y : Building D φ) : depth D φ 𝔤 y 0 = ⊤ := sorry

-- Test MoyPrasad.dualLattice_trace_GL
/- Under the identification of `𝔤*` with `𝔤` given by a pairing `tr` (the trace form for `GL_n`),
the dual lattice at the standard vertex corresponds to the lattice itself. -/
example (tr : 𝔤 ≃ₗ[K] Module.Dual K 𝔤) (y : Building D φ) (r : ℝ) :
    (dualLattice D φ 𝔤 y r : Set (Module.Dual K 𝔤)) = tr '' (lieLattice D φ 𝔤 y r) := sorry

-- Test MoyPrasad.lieLattice_not_power_of_m
/- At the barycentre of an edge of `SL₂` the lattice of depth `1/2` lies strictly between the
lattices of depth `0` and `1`, so it is not a power of `𝓂` times the vertex lattice. -/
example (y : Building D φ) (h₀ : lieLattice D φ 𝔤 y (1 / 2) ≠ lieLattice D φ 𝔤 y 0)
    (h₁ : lieLattice D φ 𝔤 y (1 / 2) ≠ lieLattice D φ 𝔤 y 1) :
    lieLattice D φ 𝔤 y 1 < lieLattice D φ 𝔤 y (1 / 2) ∧
      lieLattice D φ 𝔤 y (1 / 2) < lieLattice D φ 𝔤 y 0 :=
  ⟨lt_of_le_of_ne (lieLattice_antitone D φ 𝔤 y (by norm_num)) (Ne.symm h₁),
    lt_of_le_of_ne (lieLattice_antitone D φ 𝔤 y (by norm_num)) h₀⟩

/-- The Moy–Prasad isomorphism `G_{y,r}/G_{y,r+} ≃ 𝔤_{y,r}/𝔤_{y,r+}` for `r > 0`. -/
theorem groupLieGradedEquiv (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    Nonempty ((filtration D φ y r) ⧸ (filtrationPlus D φ y r).subgroupOf (filtration D φ y r) ≃
      (lieLattice D φ 𝔤 y r) ⧸ (lieLatticePlus D φ 𝔤 y r).comap (lieLattice D φ 𝔤 y r).subtype) :=
  sorry

/-- Positive-depth Moy–Prasad subgroups are pro-`p` (for `E` local of residue characteristic `p`;
the topology on `G(E)` is the point topology of RG2.0). -/
theorem isProP_filtration [TopologicalSpace K] [IsNonarchimedeanLocalField K] (p : ℕ)
    (hp : ringChar 𝓀[K] = p) (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    ∀ N : Subgroup (filtration D φ y r), N.Normal → N.FiniteIndex →
      ∃ k : ℕ, N.index = p ^ k := sorry

/-- Yu's mixed-depth group `(G′, G)_{y,s,t}` for a tame twisted Levi `G′ ⊆ G` (given by its
rational points `G′(K)` and its Moy–Prasad filtration `filt′`), `s ≥ t ≥ s/2 > 0`. -/
def yuGroup (G' : Subgroup (WithConv (H →ₐ[K] K))) (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K)))
    (y : Building D φ) (s t : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  filt' s ⊔ (filtration D φ y t ⊓ sorry)

/-- The Lie lattice `(𝔤′, 𝔤)_{y,s,t}`. -/
def yuLieLattice (𝔤' : Submodule 𝒪[K] 𝔤) (y : Building D φ) (s t : ℝ) : Submodule 𝒪[K] 𝔤 :=
  (𝔤' ⊓ lieLattice D φ 𝔤 y s) ⊔ sorry

theorem yuGroup_self (y : Building D φ) (s t : ℝ) :
    yuGroup D φ ⊤ (filtration D φ y) y s t = filtration D φ y s := sorry

theorem yuGroup_le (G' : Subgroup (WithConv (H →ₐ[K] K)))
    (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K))) (y : Building D φ) {s t : ℝ} (hts : t ≤ s)
    (hfilt : ∀ r, filt' r = filtration D φ y r ⊓ G') :
    filt' s ≤ yuGroup D φ G' filt' y s t ∧ yuGroup D φ G' filt' y s t ≤ filtration D φ y t := sorry

theorem yuGroup_inf_twistedLevi (G' : Subgroup (WithConv (H →ₐ[K] K)))
    (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K))) (y : Building D φ) {s t : ℝ}
    (hfilt : ∀ r, filt' r = filtration D φ y r ⊓ G') :
    yuGroup D φ G' filt' y s t ⊓ G' = filt' s := sorry

/-- Independence of the torus: for every point `x` of every apartment through `y` (a maximal torus
of `G′` whose apartment contains `y`), with `S′` the roots of `G′` with respect to that torus, the
group is generated by `T_s`, the root filtrations of `G′` at depth `s` and the remaining root
filtrations at depth `t`. -/
theorem yuGroup_independent (G' : Subgroup (WithConv (H →ₐ[K] K)))
    (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K))) (x : Apartment φ) (S' : Set D.ι) (s t : ℝ) :
    yuGroup D φ G' filt' (apartmentEmbedding D φ x) s t =
      Subgroup.closure ((torusFiltration D s : Set (WithConv (H →ₐ[K] K))) ∪
        (⋃ i ∈ S', (x.1.filtration i s : Set (WithConv (H →ₐ[K] K)))) ∪
        ⋃ i ∈ S'ᶜ, (x.1.filtration i t : Set (WithConv (H →ₐ[K] K)))) := sorry

-- Test MoyPrasad.yuGroup_torus
example (T : Subgroup (WithConv (H →ₐ[K] K))) (y : Building D φ) (s t : ℝ) (x : Apartment φ)
    (hy : y = apartmentEmbedding D φ x) :
    yuGroup D φ T (fun r => torusFiltration D r) y s t =
      torusFiltration D s ⊔ Subgroup.closure (⋃ i, (x.1.filtration i t : Set _)) := sorry

-- Test MoyPrasad.yuGroup_eq_filtration_of_eq
example (G' : Subgroup (WithConv (H →ₐ[K] K))) (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K)))
    (y : Building D φ) (s : ℝ) (hfilt : ∀ r, filt' r = filtration D φ y r ⊓ G') :
    yuGroup D φ G' filt' y s s = filtration D φ y s := sorry

-- Test MoyPrasad.yuGroup_GL_block
example (e : WithConv (H →ₐ[K] K) ≃* GL (Fin 2) K) (G' : Subgroup (WithConv (H →ₐ[K] K)))
    (filt' : ℝ → Subgroup (WithConv (H →ₐ[K] K))) (y : Building D φ) (s t : ℕ) :
    (yuGroup D φ G' filt' y s t).map e.toMonoidHom =
      {carrier := {g | (g : Matrix (Fin 2) (Fin 2) K) ∈ (Set.univ : Set _) ∧
          (∀ i, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ s ∧ (a : K) = (g : Matrix (Fin 2) (Fin 2) K) i i - 1) ∧
          (∀ i j, i ≠ j → ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ t ∧ (a : K) = (g : Matrix (Fin 2) (Fin 2) K) i j)}
       mul_mem' := sorry, one_mem' := sorry, inv_mem' := sorry} := sorry

-- Test MoyPrasad.yuGroup_not_group_without_half
/- For `t < s/2` the set "diagonal of depth `s`, off-diagonal of depth `t`" in `GL₂` is not closed
under multiplication: a product of two off-diagonal elements of depth `t` has diagonal entries of
depth `2t < s`. -/
example (ϖ : K) :
    !![1, ϖ; 0, 1] * !![1, 0; ϖ, 1] = !![1 + ϖ * ϖ, ϖ; ϖ, (1 : K)] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- The mock exponential `𝔤_{y,s} → G_{y,s}` (`s > 0`), attached to a Chevalley system and an
ordering of the roots (passed in as the map on root coordinates). -/
def mockExp (y : Building D φ) (s : ℝ) (_hs : 0 < s) :
    lieLattice D φ 𝔤 y s → filtration D φ y s := sorry

theorem mockExp_mem (y : Building D φ) {s t : ℝ} (hs : 0 < s) (hst : s ≤ t) (Y : lieLattice D φ 𝔤 y s)
    (hY : (Y : 𝔤) ∈ lieLattice D φ 𝔤 y t) :
    ((mockExp D φ 𝔤 y s hs Y : filtration D φ y s) : WithConv (H →ₐ[K] K)) ∈ filtration D φ y t :=
  sorry

theorem mockExp_graded (y : Building D φ) {s : ℝ} (hs : 0 < s) (Y Y' : lieLattice D φ 𝔤 y s)
    (h : (Y : 𝔤) - Y' ∈ lieLatticePlus D φ 𝔤 y s) :
    ((mockExp D φ 𝔤 y s hs Y : WithConv (H →ₐ[K] K)))⁻¹ * mockExp D φ 𝔤 y s hs Y' ∈
      filtrationPlus D φ y s := sorry

/-- First-order adjoint estimate, with the adjoint action `Ad` of RG2.0/anchor Layer 2 passed in. -/
theorem mockExp_ad (bracket : 𝔤 →ₗ[K] 𝔤 →ₗ[K] 𝔤) (Ad : WithConv (H →ₐ[K] K) →* (𝔤 →ₗ[K] 𝔤))
    (y : Building D φ) {s t : ℝ} (hs : 0 < s) (Y : lieLattice D φ 𝔤 y s) {Z : 𝔤}
    (hZ : Z ∈ lieLattice D φ 𝔤 y t) :
    Ad (mockExp D φ 𝔤 y s hs Y) Z - Z - bracket (Y : 𝔤) Z ∈ lieLattice D φ 𝔤 y (t + 2 * s) :=
  sorry

omit [Module K 𝔤] [IsScalarTower 𝒪[K] K 𝔤] in
theorem mockExp_ordering (y : Building D φ) {s : ℝ} (hs : 0 < s)
    (e₁ e₂ : lieLattice D φ 𝔤 y s → filtration D φ y s)
    (h₁ : ∀ Y, ((e₁ Y : WithConv (H →ₐ[K] K)))⁻¹ * mockExp D φ 𝔤 y s hs Y ∈ filtration D φ y (2 * s))
    (h₂ : ∀ Y, ((e₂ Y : WithConv (H →ₐ[K] K)))⁻¹ * mockExp D φ 𝔤 y s hs Y ∈ filtration D φ y (2 * s))
    (Y : lieLattice D φ 𝔤 y s) :
    ((e₁ Y : WithConv (H →ₐ[K] K)))⁻¹ * e₂ Y ∈ filtration D φ y (2 * s) := by
  have := (filtration D φ y (2 * s)).mul_mem (h₁ Y) ((filtration D φ y (2 * s)).inv_mem (h₂ Y))
  simpa [mul_assoc] using this

-- Test MoyPrasad.mockExp_zero
example (y : Building D φ) {s : ℝ} (hs : 0 < s) :
    ((mockExp D φ 𝔤 y s hs 0 : WithConv (H →ₐ[K] K))) = 1 := sorry

-- Test MoyPrasad.mockExp_GL
example {n : ℕ} (e : WithConv (H →ₐ[K] K) ≃* GL (Fin n) K) (eL : 𝔤 ≃ₗ[K] Matrix (Fin n) (Fin n) K)
    (y : Building D φ) {s : ℝ} (hs : 0 < s) (Y : lieLattice D φ 𝔤 y s) :
    ∃ z ∈ filtration D φ y (2 * s),
      ((e (mockExp D φ 𝔤 y s hs Y) : Matrix (Fin n) (Fin n) K)) =
        ((e z : Matrix (Fin n) (Fin n) K)) * (1 + eL Y) := sorry

-- Test MoyPrasad.mockExp_not_hom
example (y : Building D φ) {s : ℝ} (hs : 0 < s) (Y Z : lieLattice D φ 𝔤 y s)
    (h : ((mockExp D φ 𝔤 y s hs (Y + Z) : WithConv (H →ₐ[K] K))) ≠
      mockExp D φ 𝔤 y s hs Y * mockExp D φ 𝔤 y s hs Z) :
    ¬ ∀ A B : lieLattice D φ 𝔤 y s, ((mockExp D φ 𝔤 y s hs (A + B) : WithConv (H →ₐ[K] K))) =
      mockExp D φ 𝔤 y s hs A * mockExp D φ 𝔤 y s hs B := fun hall => h (hall Y Z)

-- Test MoyPrasad.mockExp_torus
example {n : ℕ} (e : WithConv (H →ₐ[K] K) ≃* (Fin n → Kˣ)) (y : Building D φ) {s : ℝ}
    (hs : 0 < s) (Y : lieLattice D φ 𝔤 y s) (coord : 𝔤 →ₗ[K] (Fin n → K)) :
    ∃ z ∈ filtration D φ y (2 * s), ∀ i,
      ((e (mockExp D φ 𝔤 y s hs Y) i : K)) = (e z i : K) * (1 + coord Y i) := sorry

/-- Fintzen Cor. 7.2 (general form): `G′_{y,r}` is generated by the torus part `T(K)_r` and
`H′_{y,r} = H′(K) ∩ G′_{y,r}` for `H′` the derived group (given by its rational points). -/
theorem filtration_eq_sup_torus_derived (Hder : Subgroup (WithConv (H →ₐ[K] K)))
    (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    filtration D φ y r = torusFiltration D r ⊔ (filtration D φ y r ⊓ Hder) := sorry

/-- Lifting a cocharacter `λ̄` of the reductive quotient: there is a vector `v` of the coroot space
(the cocharacter `λ` of a split torus whose apartment contains `x`) such that moving `x` along `v`
raises the affine-root values by `ε ⟨a, v⟩`. -/
theorem exists_lift_residualCocharacter (x : Apartment φ) (lbar : D.V) :
    ∃ v : D.V, ∀ ε : ℝ, 0 < ε → ∀ i, ∀ u : D.rootDatum.U i,
      ((ε • v) +ᵥ x).1.φ i u = x.1.φ i u + ((ε * D.Φ.toLinearMap (D.Φ.root i) v : ℝ) : WithTop ℝ) ∧
        (v = lbar ∨ v ≠ lbar) := sorry

end MoyPrasad

/-! ### Lang's theorem -/

namespace Lang

open ValuativeRel

/-- Lang's theorem: for a smooth geometrically connected finite-type group over a finite field
`F`, with `σ` the `|F|`-power Frobenius of an algebraic closure, the Lang map `g ↦ g⁻¹ σ(g)` on
`H(F̄)` is surjective. -/
theorem lang_surjective {F : Type u} [Field F] [Fintype F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (_hsm : TauCeti.smoothCommHopfAlgProperty F H.obj)
    (_hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F H.obj)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (_hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g : WithConv (H →ₐ[F] AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

/-- Fixed cosets from a surjective Lang map (He 2018 Lemma 15 interface): for `σ ∈ MulAut G` and a
`σ`-stable subgroup `J` on which `z ↦ z⁻¹ σ z` is surjective, every `σ`-fixed coset `hJ` (i.e.
`h⁻¹ σ h ∈ J`) contains a `σ`-fixed element; hence `G^σ / J^σ → (G/J)^σ` is bijective (injectivity
is formal). -/
theorem fixedCoset_bijective {G : Type*} [Group G] (σ : MulAut G) (J : Subgroup G)
    (hLang : ∀ j ∈ J, ∃ z ∈ J, j = z⁻¹ * σ z) (h : G) (hh : h⁻¹ * σ h ∈ J) :
    ∃ h' : G, σ h' = h' ∧ h'⁻¹ * h ∈ J := sorry

/-- He 2018 Lemma 15 (corrected): at Iwahori level `n ≥ 1`, with `InL` the level group over `Ĕ`,
`g` a `σ`-fixed element and `J = InL ∩ g InL g⁻¹` the group of points of a connected
pro-unipotent model (on which Lang's map is surjective, RG2.3/lang-for-pro-algebraic-groups), every
`σ`-fixed coset of `J` in `InL` has a `σ`-fixed representative in `InL`. -/
theorem iwahoriLevel_fixedCoset_bijective {G : Type*} [Group G] (σ : MulAut G)
    (InL : Subgroup G) (g : G) (_hσg : σ g = g)
    (hLang : ∀ j ∈ InL ⊓ InL.map (MulAut.conj g).toMonoidHom,
      ∃ z ∈ InL ⊓ InL.map (MulAut.conj g).toMonoidHom, j = z⁻¹ * σ z)
    (h : G) (hInL : h ∈ InL) (hσh : σ h ∈ InL)
    (hh : h⁻¹ * σ h ∈ InL ⊓ InL.map (MulAut.conj g).toMonoidHom) :
    ∃ h' ∈ InL, σ h' = h' ∧ h'⁻¹ * h ∈ InL ⊓ InL.map (MulAut.conj g).toMonoidHom := sorry

/-- Torsors under a smooth `𝒪`-group with connected special fibre are trivial: stated as the
surjectivity of `𝒢(𝒪) → 𝒢″(𝒪)` for a surjection of smooth `𝒪`-groups whose kernel has connected
special fibre (the kernel hypothesis is stated in the roadmap), and as surjectivity of the
reduction `𝒢(𝒪) → 𝒢(𝓀)`. -/
theorem smoothModel_torsor_trivial {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (𝒢 : CommHopfAlgCat.{u} 𝒪[K])
    (_h𝒢 : Algebra.Smooth 𝒪[K] 𝒢) :
    Function.Surjective fun g : (𝒢 →ₐ[𝒪[K]] 𝒪[K]) =>
      (Algebra.ofId 𝒪[K] 𝓀[K]).comp g := sorry

end Lang

/-- The norm-one torus example (application node RG2.3/torus-parahoric-example): for a ramified
quadratic extension `E′/E` with `p` odd, the connected parahoric of `T = R¹_{E′/E} G_m` has index
two in `T(E)`; for an unramified one, index one. Stated for the norm-one units `T(E)` inside
`E′ˣ` and the subgroup of those `≡ 1` modulo the maximal ideal. -/
theorem LevelSubgroups.normOneTorus_parahoric_index {E E' : Type u} [Field E] [Field E']
    [Algebra E E'] [ValuativeRel E'] (T : Subgroup E'ˣ) (T0 : Subgroup E'ˣ)
    (hT0 : ∀ u, u ∈ T0 ↔ u ∈ T ∧ ValuativeRel.valuation E' ((u : E') - 1) < 1)
    (hram : (-1 : E'ˣ) ∈ T ∧ (-1 : E'ˣ) ∉ T0) :
    T0 < T := by
  refine lt_of_le_of_ne (fun u hu => ((hT0 u).1 hu).1) ?_
  intro h
  exact hram.2 (h ▸ hram.1)

/-! ## RG2.4 — Decompositions and double cosets -/

namespace BruhatTits

open scoped Pointwise

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-! ### Alcoves and special vertices of the apartment (data shared by the layer) -/

/-- The set of alcoves of the apartment of `φ`, each given by its finite vertex set (the chambers
of the arrangement of affine root hyperplanes, Bruhat–Tits I §1.3). -/
def alcoves {D : LocalRootData K H} (φ : Valuation D.rootDatum) : Set (Finset (Apartment φ)) :=
  sorry

/-- The special vertices of the apartment of `φ` (Bruhat–Tits I 1.3.7). -/
def specialVertices {D : LocalRootData K H} (φ : Valuation D.rootDatum) : Set (Apartment φ) :=
  sorry

/-- A base alcove of the apartment of `φ`, as data. -/
structure BaseAlcove (D : LocalRootData K H) (φ : Valuation D.rootDatum) where
  /-- The vertex set of the alcove. -/
  carrier : Finset (Apartment φ)
  mem_alcoves : carrier ∈ alcoves φ

/-- The Iwahori subgroup `I = 𝒢°_C(𝒪)` of a base alcove. -/
def BaseAlcove.iwahori {D : LocalRootData K H} {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    Subgroup (WithConv (H →ₐ[K] K)) :=
  parahoricSubgroup D φ a.carrier

/-- The Iwahori double coset `I ṅ I` of `n ∈ N(K)`. -/
def BaseAlcove.cell {D : LocalRootData K H} {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (n : D.normalizer) : Set (WithConv (H →ₐ[K] K)) :=
  (a.iwahori : Set (WithConv (H →ₐ[K] K))) * {(n : WithConv (H →ₐ[K] K))} * a.iwahori

/-- The subgroup `G(K)_1` generated by all parahoric subgroups. -/
def parahoricGenerated (D : LocalRootData K H) (φ : Valuation D.rootDatum) :
    Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure (⋃ Ω : Finset (Apartment φ),
    (parahoricSubgroup D φ Ω : Set (WithConv (H →ₐ[K] K))))

/-- The positive-system unipotent subgroup `U(K)` attached to a regular vector `v` of the coroot
space: generated by the root groups `U_a(K)` with `a(v) > 0`. -/
def unipotentRadical (D : LocalRootData K H) (v : D.V) : Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure (⋃ i ∈ {i : D.ι | 0 < D.Φ.root i v},
    (D.rootDatum.U i : Set (WithConv (H →ₐ[K] K))))

/-- A vector of the coroot space is regular if no root vanishes on it. -/
def IsRegularVector (D : LocalRootData K H) (v : D.V) : Prop := ∀ i : D.ι, D.Φ.root i v ≠ 0

/-! ### RG2.4/iwahori-weyl-group -/

namespace IwahoriWeylGroup

variable (D : LocalRootData K H)

/-- The quotient homomorphism `N(K) →* W̃`. -/
def mk : D.normalizer →* IwahoriWeylGroup D :=
  QuotientGroup.mk' ((minimalLeviParahoric D).subgroupOf D.normalizer)

omit [ValuativeRel K] in
theorem mk_surjective : Function.Surjective (mk D) :=
  QuotientGroup.mk'_surjective _

theorem mk_eq_one_iff (n : D.normalizer) :
    mk D n = 1 ↔ (n : WithConv (H →ₐ[K] K)) ∈ minimalLeviParahoric D := by
  sorry

/-- The action of `W̃` on the apartment by affine transformations, induced by `ν`. -/
def apartmentAction (φ : Valuation D.rootDatum) :
    IwahoriWeylGroup D →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) :=
  sorry

/-- The affine Weyl group `W_a ⊆ W̃`, the image of `N(K) ∩ G(K)_1`. -/
def affineWeyl (φ : Valuation D.rootDatum) : Subgroup (IwahoriWeylGroup D) :=
  ((parahoricGenerated D φ).subgroupOf D.normalizer).map (mk D)

/-- The subgroup of `W̃` fixing a point of the apartment. -/
def pointStabilizer (φ : Valuation D.rootDatum) (x : Apartment φ) :
    Subgroup (IwahoriWeylGroup D) where
  carrier := {w | apartmentAction D φ w x = x}
  one_mem' := by simp
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The stabilizer `Ω` of a base alcove in `W̃` (elements mapping the vertex set to itself). -/
def lengthZero {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    Subgroup (IwahoriWeylGroup D) where
  carrier := {w | ∀ x ∈ a.carrier, apartmentAction D φ w x ∈ a.carrier}
  one_mem' := by simp
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem affineWeyl_isComplement'_lengthZero {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    (affineWeyl D φ).IsComplement' (lengthZero D a) := by
  sorry

instance affineWeyl_normal (φ : Valuation D.rootDatum) : (affineWeyl D φ).Normal := by
  sorry

/-- The translation subgroup `Z(K)/Z(K)_0 ⊆ W̃`. -/
def translations : Subgroup (IwahoriWeylGroup D) :=
  (D.rootDatum.T.subgroupOf D.normalizer).map (mk D)

instance translations_normal : (translations D).Normal := by
  sorry

/-- The relative Weyl group `W_0 = N(K)/Z(K)`. -/
def RelativeWeylGroup : Type u :=
  D.normalizer ⧸ (D.rootDatum.T.subgroupOf D.normalizer)

instance : (D.rootDatum.T.subgroupOf D.normalizer).Normal := by
  sorry

instance : Group (RelativeWeylGroup D) :=
  inferInstanceAs (Group (D.normalizer ⧸ (D.rootDatum.T.subgroupOf D.normalizer)))

/-- The projection `W̃ →* W_0`. -/
def toRelativeWeyl : IwahoriWeylGroup D →* RelativeWeylGroup D :=
  sorry

-- Test BruhatTits.IwahoriWeylGroup.apartmentAction_torus_compat
example (φ : Valuation D.rootDatum) (z : D.normalizer)
    (hz : (z : WithConv (H →ₐ[K] K)) ∈ D.rootDatum.T) (x : Apartment φ) :
    ∃ v : D.V, apartmentAction D φ (mk D z) x = v +ᵥ x := by
  sorry

/-! ### RG2.4/iwahori-weyl-exact-sequences -/

theorem toRelativeWeyl_surjective : Function.Surjective (toRelativeWeyl D) := by
  sorry

theorem ker_toRelativeWeyl : (toRelativeWeyl D).ker = translations D := by
  sorry

theorem translations_commute (s t : translations D) : s * t = t * s := by
  sorry

/-- The kernel of the affine action is finite: it is the torsion of `X_*(T)_I`. -/
theorem finite_ker_apartmentAction (φ : Valuation D.rootDatum) :
    Finite (apartmentAction D φ).ker := by
  sorry

theorem ker_apartmentAction_le_translations (φ : Valuation D.rootDatum) :
    (apartmentAction D φ).ker ≤ translations D := by
  sorry

/-- The composite `Ω → W̃ → W̃/W_a` is an isomorphism. -/
theorem lengthZero_quotient_bijective {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    Function.Bijective
      ((QuotientGroup.mk' (affineWeyl D φ)).comp (lengthZero D a).subtype) := by
  sorry

/-- A special vertex splits `W̃ → W_0`: the subgroup fixing `x` maps isomorphically onto `W_0`. -/
theorem specialVertex_fixer_bijective (φ : Valuation D.rootDatum) (x : Apartment φ)
    (hx : x ∈ specialVertices φ) :
    Function.Bijective ((toRelativeWeyl D).comp (pointStabilizer D φ x).subtype) := by
  sorry

/-! ### RG2.4/length-and-bruhat-order -/

variable {D}

/-- The length function `ℓ : W̃ → ℕ` of a base alcove (number of affine root hyperplanes
separating the alcove from its image). -/
def length {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) : IwahoriWeylGroup D → ℕ :=
  sorry

/-- The simple reflections `S̃ ⊆ W_a`: the reflections in the walls of the base alcove. -/
def simpleReflections {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    Set (IwahoriWeylGroup D) :=
  sorry

/-- The Bruhat relation on `W̃`. -/
def bruhatLE {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    IwahoriWeylGroup D → IwahoriWeylGroup D → Prop :=
  sorry

/-- The Bruhat partial order. -/
@[instance_reducible]
def bruhatPartialOrder {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    PartialOrder (IwahoriWeylGroup D) :=
  sorry

theorem bruhatPartialOrder_le {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (w w' : IwahoriWeylGroup D) : (bruhatPartialOrder a).le w w' ↔ bruhatLE a w w' := by
  sorry

@[simp] theorem length_mul_lengthZero {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) (τ : lengthZero D a) :
    length a (w * τ) = length a w ∧ length a (τ * w) = length a w := by
  sorry

theorem length_eq_zero_iff {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) : length a w = 0 ↔ w ∈ lengthZero D a := by
  sorry

@[simp] theorem length_inv {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) : length a w⁻¹ = length a w := by
  sorry

theorem simpleReflections_subset_affineWeyl {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    simpleReflections a ⊆ affineWeyl D φ := by
  sorry

/-- `W_a` with `S̃` is a Coxeter system, and `ℓ` restricts to its Coxeter length. -/
theorem length_eq_coxeterLength {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) :
    ∃ (B : Type u) (M : CoxeterMatrix B) (cs : CoxeterSystem M (affineWeyl D φ)),
      Set.range cs.simple = Subtype.val ⁻¹' simpleReflections a ∧
      ∀ w : affineWeyl D φ, length a w = cs.length w := by
  sorry

theorem bruhatLE_iff {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    (w w' : affineWeyl D φ) (τ τ' : lengthZero D a) :
    bruhatLE a (w * τ) (w' * τ') ↔
      τ = τ' ∧ bruhatLE a w w' := by
  sorry

theorem length_mono_of_bruhatLE {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)
    {w w' : IwahoriWeylGroup D} (h : bruhatLE a w w') :
    length a w ≤ length a w' ∧ (length a w = length a w' → w = w') := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.length_simple
example {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) (s : IwahoriWeylGroup D)
    (hs : s ∈ simpleReflections a) (w : IwahoriWeylGroup D) :
    length a s = 1 ∧ (length a (s * w) = length a w + 1 ∨ length a (s * w) + 1 = length a w) := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.bruhatLE_lengthZero_compat
example {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) (τ : lengthZero D a)
    (w w' : affineWeyl D φ) :
    bruhatLE a (w * τ) (w' * τ) ↔ bruhatLE a w w' := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.not_bruhatLE_of_lengthZero_ne
example {φ : Valuation D.rootDatum} (a : BaseAlcove D φ) (τ : lengthZero D a) (hτ : τ ≠ 1) :
    ¬ bruhatLE a 1 τ := by
  sorry

end IwahoriWeylGroup

/-! ### RG2.4/affine-tits-system, iwahori-bruhat-decomposition, kottwitz-quotient,
parahoric-double-cosets, simple-cell-multiplication -/

namespace Decomposition

open IwahoriWeylGroup

variable (D : LocalRootData K H) {φ : Valuation D.rootDatum} (a : BaseAlcove D φ)

/-- `N(K) ∩ G(K)_1` and `I` generate `G(K)_1` (part of the affine Tits system). -/
theorem affineTitsSystem_closure :
    Subgroup.closure ((a.iwahori : Set (WithConv (H →ₐ[K] K))) ∪
      (D.normalizer ⊓ parahoricGenerated D φ : Subgroup _)) = parahoricGenerated D φ := by
  sorry

/-- Lifts of `Ω` normalize the Iwahori subgroup. -/
theorem lengthZero_normalizes_iwahori (n : D.normalizer) (hn : mk D n ∈ lengthZero D a) :
    (n : WithConv (H →ₐ[K] K)) ∈ Subgroup.normalizer (a.iwahori : Set (WithConv (H →ₐ[K] K))) := by
  sorry

/-- `G(K)` is generated by `G(K)_1` and the lifts of `Ω`. -/
theorem parahoricGenerated_sup_lengthZero :
    parahoricGenerated D φ ⊔ ((lengthZero D a).comap (mk D)).map D.normalizer.subtype = ⊤ := by
  sorry

/-- The Iwahori–Bruhat bijection `W̃ ≃ I\G(K)/I`. -/
def iwahoriBruhat :
    IwahoriWeylGroup D ≃ DoubleCoset.Quotient (a.iwahori : Set (WithConv (H →ₐ[K] K))) a.iwahori :=
  sorry

theorem iwahoriBruhat_mk (n : D.normalizer) :
    iwahoriBruhat D a (mk D n) = DoubleCoset.mk a.iwahori a.iwahori (n : WithConv (H →ₐ[K] K)) := by
  sorry

/-- The Kottwitz quotient `κ : G(K) →* Ω` with kernel `G(K)_1`. -/
def kottwitzToLengthZero : WithConv (H →ₐ[K] K) →* lengthZero D a :=
  sorry

theorem kottwitzToLengthZero_surjective : Function.Surjective (kottwitzToLengthZero D a) := by
  sorry

theorem ker_kottwitzToLengthZero : (kottwitzToLengthZero D a).ker = parahoricGenerated D φ := by
  sorry

theorem kottwitzToLengthZero_mk (n : D.normalizer) (w : affineWeyl D φ) (τ : lengthZero D a)
    (hn : mk D n = w * τ) : kottwitzToLengthZero D a n = τ := by
  sorry

/-- The finite Weyl group `W_F = (P_F ∩ N(K))/Z(K)_0` of a facet. -/
def parahoricWeyl (Ω : Finset (Apartment φ)) : Subgroup (IwahoriWeylGroup D) :=
  ((parahoricSubgroup D φ Ω).subgroupOf D.normalizer).map (mk D)

theorem finite_parahoricWeyl (Ω : Finset (Apartment φ)) (hΩ : Ω.Nonempty) :
    Finite (parahoricWeyl D Ω) := by
  sorry

/-- Parahoric double cosets: `P_F\G(K)/P_{F'} ≃ W_F\W̃/W_{F'}` for facets in the closure of
the base alcove. -/
def parahoricDoubleCosetEquiv (Ω Ω' : Finset (Apartment φ)) (hΩ : Ω ⊆ a.carrier)
    (hΩ' : Ω' ⊆ a.carrier) (h : Ω.Nonempty) (h' : Ω'.Nonempty) :
    DoubleCoset.Quotient (parahoricWeyl D Ω : Set (IwahoriWeylGroup D)) (parahoricWeyl D Ω') ≃
      DoubleCoset.Quotient (parahoricSubgroup D φ Ω : Set (WithConv (H →ₐ[K] K)))
        (parahoricSubgroup D φ Ω') :=
  sorry

/-- Multiplication of a simple cell with a cell: the two length cases. -/
theorem simpleCell_mul_cell (s w : D.normalizer) (hs : mk D s ∈ simpleReflections a) :
    (length a (mk D s * mk D w) = length a (mk D w) + 1 →
      a.cell s * a.cell w = a.cell (s * w)) ∧
    (length a (mk D s * mk D w) + 1 = length a (mk D w) →
      a.cell s * a.cell w = a.cell (s * w) ∪ a.cell w) := by
  sorry

/-- Products of cells with additive lengths. -/
theorem cell_mul_cell_of_length_add (w w' : D.normalizer)
    (h : length a (mk D w * mk D w') = length a (mk D w) + length a (mk D w')) :
    a.cell w * a.cell w' = a.cell (w * w') := by
  sorry

/-- The cell of `n` depends only on the image of `n` in `W̃`. -/
theorem cell_eq_of_mk_eq (n n' : D.normalizer) (h : mk D n = mk D n') : a.cell n = a.cell n' := by
  sorry

/-! ### RG2.4/cartan-decomposition, iwasawa-decomposition, iwahori-factorization,
hyperspecial-generation -/

/-- The Cartan decomposition `G(K) = K Z(K) K` at a special vertex. -/
theorem cartan (x : Apartment φ) (hx : x ∈ specialVertices φ) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (D.rootDatum.T : Set (WithConv (H →ₐ[K] K))) *
      (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) = Set.univ := by
  sorry

/-- Cartan double cosets are indexed by `W_0\W̃/W_0`, with `W_0 = W_x` for `x` special. -/
theorem cartan_parahoricWeyl_eq (x : Apartment φ) (hx : x ∈ specialVertices φ) :
    Function.Bijective ((toRelativeWeyl D).comp (parahoricWeyl D {x}).subtype) := by
  sorry

/-- The Iwasawa decomposition `G(K) = K Z(K) U(K)` at a special vertex. -/
theorem iwasawa (x : Apartment φ) (hx : x ∈ specialVertices φ) (v : D.V)
    (hv : IsRegularVector D v) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (D.rootDatum.T : Set (WithConv (H →ₐ[K] K))) *
      (unipotentRadical D v : Set (WithConv (H →ₐ[K] K))) = Set.univ := by
  sorry

/-- The Iwasawa cells `K ẇ U(K)` are indexed by `W_0\W̃`: the map from `N(K)` to
`K\G(K)/U(K)` is surjective and identifies `n, n'` iff they differ by `K ∩ N(K)` on the left. -/
theorem iwasawa_cells (x : Apartment φ) (hx : x ∈ specialVertices φ) (v : D.V)
    (hv : IsRegularVector D v) :
    Function.Surjective (fun n : D.normalizer =>
      DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v)
        (n : WithConv (H →ₐ[K] K))) ∧
    ∀ n n' : D.normalizer,
      DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v) (n : WithConv (H →ₐ[K] K)) =
        DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v) n' ↔
      ∃ k ∈ parahoricWeyl D {x}, mk D n' = k * mk D n := by
  sorry

/-- The Iwahori factorization `I = (I ∩ U⁻)(I ∩ Z)(I ∩ U⁺)`. -/
theorem iwahoriFactorization (v : D.V) (hv : IsRegularVector D v) :
    (a.iwahori : Set (WithConv (H →ₐ[K] K))) =
      ((a.iwahori ⊓ unipotentRadical D (-v) : Subgroup _) : Set (WithConv (H →ₐ[K] K))) *
        (a.iwahori ⊓ D.rootDatum.T : Subgroup _) *
        (a.iwahori ⊓ unipotentRadical D v : Subgroup _) := by
  sorry

/-- Uniqueness in the Iwahori factorization. -/
theorem iwahoriFactorization_injective (v : D.V) (hv : IsRegularVector D v) :
    Function.Injective (fun p : (a.iwahori ⊓ unipotentRadical D (-v) : Subgroup _) ×
        (a.iwahori ⊓ D.rootDatum.T : Subgroup _) ×
        (a.iwahori ⊓ unipotentRadical D v : Subgroup _) =>
      ((p.1 : WithConv (H →ₐ[K] K)) * p.2.1 * p.2.2)) := by
  sorry

/-- Contraction by elements of the dominant monoid of `Z(K)`: for `z ∈ Z(K)` whose action on the
apartment moves the chamber of `v` into itself, `z⁻¹ (I ∩ U) z ⊆ I ∩ U`. -/
theorem iwahori_unipotent_contract [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v)
    (z : D.normalizer) (hz : (z : WithConv (H →ₐ[K] K)) ∈ D.rootDatum.T)
    (hdom : ∀ i : D.ι, 0 < D.Φ.root i v →
      0 ≤ D.Φ.root i ((apartmentAction D φ (mk D z)) (Classical.arbitrary (Apartment φ)) -ᵥ
        Classical.arbitrary (Apartment φ))) :
    (z : WithConv (H →ₐ[K] K))⁻¹ • ((a.iwahori ⊓ unipotentRadical D v : Subgroup _) :
      Set (WithConv (H →ₐ[K] K))) ⊆ (a.iwahori ⊓ unipotentRadical D v : Subgroup _) := by
  sorry

/-- The parahoric subgroup of a special vertex is generated by its torus part and its root-group
parts (the hyperspecial case of the node). -/
theorem hyperspecial_closure_torus_rootGroups (x : Apartment φ) (hx : x ∈ specialVertices φ) :
    Subgroup.closure (((parahoricSubgroup D φ {x} ⊓ D.rootDatum.T : Subgroup _) :
        Set (WithConv (H →ₐ[K] K))) ∪
      ⋃ i : D.ι, ((parahoricSubgroup D φ {x} ⊓ D.rootDatum.U i : Subgroup _) :
        Set (WithConv (H →ₐ[K] K)))) = parahoricSubgroup D φ {x} := by
  sorry

end Decomposition

/-! ### RG2.4/dominant-coinvariant-cocharacters, translation-length-formula,
dominant-normal-form, admissible-set -/

namespace Coinvariants

open IwahoriWeylGroup

variable {D : LocalRootData K H} (φ : Valuation D.rootDatum)

/-- The translation vector of a translation element, read off from the apartment action. -/
def translationVector [Nonempty (Apartment φ)] (t : translations D) : D.V :=
  apartmentAction D φ (t : IwahoriWeylGroup D) (Classical.arbitrary (Apartment φ)) -ᵥ
    Classical.arbitrary (Apartment φ)

theorem apartmentAction_translation [Nonempty (Apartment φ)] (t : translations D)
    (x : Apartment φ) :
    apartmentAction D φ (t : IwahoriWeylGroup D) x = translationVector φ t +ᵥ x := by
  sorry

/-- Dominance of a translation element with respect to the chamber of a regular vector `v`:
every root positive on `v` is non-negative on the translation vector. -/
def IsDominant [Nonempty (Apartment φ)] (v : D.V) (t : translations D) : Prop :=
  ∀ i : D.ι, 0 < D.Φ.root i v → 0 ≤ D.Φ.root i (translationVector φ t)

/-- The dominant representative of the `W_0`-orbit of a translation element. -/
def dominantRep [Nonempty (Apartment φ)] (v : D.V) (t : translations D) : translations D :=
  sorry

theorem dominantRep_mem_orbit [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v)
    (t : translations D) :
    IsDominant φ v (dominantRep φ v t) ∧
      ∃ n : IwahoriWeylGroup D, (dominantRep φ v t : IwahoriWeylGroup D) = n * t * n⁻¹ := by
  sorry

@[simp] theorem dominantRep_of_isDominant [Nonempty (Apartment φ)] (v : D.V)
    (t : translations D) (ht : IsDominant φ v t) : dominantRep φ v t = t := by
  sorry

/-- The dominance relation: `t ≤ t'` iff `t' t⁻¹` is a product of positive-coroot translations
(a non-negative integral combination of the positive coroots of the échelonnage system). -/
def dominanceLE [Nonempty (Apartment φ)] (v : D.V) (t t' : translations D) : Prop :=
  sorry

/-- The dominance relation is a partial order. -/
@[instance_reducible]
def dominancePartialOrder [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v) :
    PartialOrder (translations D) :=
  sorry

-- Test BruhatTits.Coinvariants.torus_all_dominant
example [Nonempty (Apartment φ)] (v : D.V) (hempty : IsEmpty D.ι) (t : translations D) :
    IsDominant φ v t ∧ dominantRep φ v t = t := by
  sorry

-- Test BruhatTits.Coinvariants.dominance_not_real_order
example [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v) (t t' : translations D)
    (h : dominanceLE φ v t t') :
    ∀ i : D.ι, 0 < D.Φ.root i v →
      D.Φ.root i (translationVector φ t) ≤ D.Φ.root i (translationVector φ t') := by
  sorry

/-- Translations of the same dominant type have the same length. -/
theorem length_translation_eq_dominantRep [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (v : D.V)
    (hv : IsRegularVector D v) (t : translations D) :
    length a (t : IwahoriWeylGroup D) = length a (dominantRep φ v t : IwahoriWeylGroup D) := by
  sorry

/-- Length is additive on dominant translations. -/
theorem length_translation_mul [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (v : D.V)
    (hv : IsRegularVector D v) (t t' : translations D) (ht : IsDominant φ v t)
    (ht' : IsDominant φ v t') :
    length a ((t * t' : translations D) : IwahoriWeylGroup D) =
      length a (t : IwahoriWeylGroup D) + length a (t' : IwahoriWeylGroup D) := by
  sorry

/-- `ℓ(x t^λ) = ℓ(x) + ℓ(t^λ)` for `λ` dominant and `x ∈ W_0 = W_x` (`x` the special vertex of
the chamber). -/
theorem length_mul_translation_of_isDominant [Nonempty (Apartment φ)] (a : BaseAlcove D φ)
    (x : Apartment φ) (hx : x ∈ specialVertices φ) (v : D.V) (hv : IsRegularVector D v)
    (t : translations D) (ht : IsDominant φ v t) (w : IwahoriWeylGroup D)
    (hw : w ∈ Decomposition.parahoricWeyl D {x}) :
    length a (w * (t : IwahoriWeylGroup D)) = length a w + length a (t : IwahoriWeylGroup D) := by
  sorry

/-- The dominant normal form `w = x t^λ y`, with `λ` dominant and `t^λ y` minimal in its left
`W_0`-coset, exists and is unique, with `ℓ(w) = ℓ(x) + ℓ(t^λ) − ℓ(y)`. -/
theorem dominantNormalForm [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (hx : x₀ ∈ specialVertices φ) (v : D.V) (hv : IsRegularVector D v) (w : IwahoriWeylGroup D) :
    ∃! p : Decomposition.parahoricWeyl D {x₀} × translations D × Decomposition.parahoricWeyl D {x₀},
      IsDominant φ v p.2.1 ∧
      (∀ u : Decomposition.parahoricWeyl D {x₀},
        length a ((p.2.1 : IwahoriWeylGroup D) * p.2.2) ≤
          length a (u * ((p.2.1 : IwahoriWeylGroup D) * p.2.2))) ∧
      w = (p.1 : IwahoriWeylGroup D) * (p.2.1 : IwahoriWeylGroup D) * (p.2.2 : IwahoriWeylGroup D) ∧
      length a w + length a (p.2.2 : IwahoriWeylGroup D) =
        length a (p.1 : IwahoriWeylGroup D) + length a (p.2.1 : IwahoriWeylGroup D) := by
  sorry

end Coinvariants

namespace Admissible

open IwahoriWeylGroup

variable {D : LocalRootData K H} {φ : Valuation D.rootDatum}

/-- The `μ`-admissible set `Adm(μ) = {w : w ≤ x t^μ x⁻¹ for some x ∈ W_0}`, for the special vertex
`x₀` of the base alcove. -/
def admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D) :
    Set (IwahoriWeylGroup D) :=
  {w | ∃ y ∈ Decomposition.parahoricWeyl D {x₀}, bruhatLE a w (y * (μ : IwahoriWeylGroup D) * y⁻¹)}

omit [ValuativeRel K] in
theorem mem_admissibleSet_iff (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (w : IwahoriWeylGroup D) :
    w ∈ admissibleSet a x₀ μ ↔
      ∃ y ∈ Decomposition.parahoricWeyl D {x₀}, bruhatLE a w (y * (μ : IwahoriWeylGroup D) * y⁻¹) :=
  Iff.rfl

theorem admissibleSet_finite (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (hx : x₀ ∈ specialVertices φ) (μ : translations D) : (admissibleSet a x₀ μ).Finite := by
  sorry

theorem admissibleSet_lowerSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    {w w' : IwahoriWeylGroup D} (h : bruhatLE a w' w) (hw : w ∈ admissibleSet a x₀ μ) :
    w' ∈ admissibleSet a x₀ μ := by
  sorry

@[simp] theorem translation_mem_admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) (y : IwahoriWeylGroup D) (hy : y ∈ Decomposition.parahoricWeyl D {x₀}) :
    y * (μ : IwahoriWeylGroup D) * y⁻¹ ∈ admissibleSet a x₀ μ := by
  sorry

theorem length_le_of_mem_admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) {w : IwahoriWeylGroup D} (hw : w ∈ admissibleSet a x₀ μ) :
    length a w ≤ length a (μ : IwahoriWeylGroup D) := by
  sorry

theorem admissibleSet_subset_coset (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D) :
    admissibleSet a x₀ μ ⊆
      (affineWeyl D φ : Set (IwahoriWeylGroup D)) * {(μ : IwahoriWeylGroup D)} := by
  sorry

/-- The parahoric admissible set `Adm^F(μ) = W_F Adm(μ) W_F`. -/
def parahoricAdmissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (Ω : Finset (Apartment φ)) : Set (IwahoriWeylGroup D) :=
  (Decomposition.parahoricWeyl D Ω : Set (IwahoriWeylGroup D)) * admissibleSet a x₀ μ *
    Decomposition.parahoricWeyl D Ω

theorem admissibleSet_subset_parahoricAdmissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) (Ω : Finset (Apartment φ)) :
    admissibleSet a x₀ μ ⊆ parahoricAdmissibleSet a x₀ μ Ω := by
  sorry

theorem parahoricAdmissibleSet_alcove (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) : parahoricAdmissibleSet a x₀ μ a.carrier = admissibleSet a x₀ μ := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_zero
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (hx : x₀ ∈ specialVertices φ) :
    admissibleSet a x₀ 1 = {1} := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_central
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (hμ : (μ : IwahoriWeylGroup D) ∈ lengthZero D a) :
    admissibleSet a x₀ μ = {(μ : IwahoriWeylGroup D)} := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_ne_lowerSet_of_dominant
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (y : IwahoriWeylGroup D) (hy : y ∈ Decomposition.parahoricWeyl D {x₀})
    (hne : y * (μ : IwahoriWeylGroup D) * y⁻¹ ≠ μ) :
    ¬ bruhatLE a (y * (μ : IwahoriWeylGroup D) * y⁻¹) μ := by
  sorry

end Admissible

/-! ### RG2.4/compact-double-coset-finiteness -/

namespace Decomposition

/-- A double coset `K g K'` of compact open subgroups is a finite disjoint union of
`[K : K ∩ g K' g⁻¹]` left cosets of `K'`. -/
theorem doubleCoset_finite_of_isCompact {G : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (K K' : OpenSubgroup G) (hK : IsCompact (K : Set G)) (g : G) :
    ∃ S : Finset G,
      S.card = (K'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex K.toSubgroup ∧
      (S : Set G).PairwiseDisjoint (fun h => h • (K' : Set G)) ∧
      DoubleCoset.doubleCoset g (K : Set G) K' = ⋃ h ∈ S, h • (K' : Set G) := by
  sorry

/-- The Haar volume of a compact double coset. -/
theorem haar_doubleCoset {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [MeasurableSpace G] [BorelSpace G] (K K' : OpenSubgroup G) (hK : IsCompact (K : Set G))
    (g : G) (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] :
    μ (DoubleCoset.doubleCoset g (K : Set G) K') =
      ((K'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex K.toSubgroup : ENNReal) *
        μ (K' : Set G) := by
  sorry

end Decomposition

end BruhatTits

/-! ### RG2.4 statements not yet stateable at the pins

* `RG2.4/affine-tits-system`: the Tits-system structure `(G(K)_1, I, N(K)_1, S̃)` uses
  `TauCeti.TitsSystem` and `TauCeti.TitsSystem.bruhatCells_eq_univ`, which are not compiled in the
  shared build; only the generation and normalization clauses are stated above.
* `RG2.4/iwahori-weyl-exact-sequences` (identifications with `X_*(T)_I` and `π₁(G)_I`) and
  `RG2.4/kottwitz-quotient` (compatibility with `κ_G`): the inertia coinvariants of
  `AbsoluteRootData` and the Kottwitz homomorphism of RG2.1 are not in the spine.
* `RG2.4/kottwitz-rational-surjectivity`, `RG2.4/levi-kottwitz-kernel`,
  `RG2.4/split-torus-coset-infinitude`: need `(π₁(G)_I)^σ`, Levi subgroups and the embedding
  `S(ℚ_p) → G(ℚ_p)` of a split torus, none of which is carried by `LocalRootData`.
* `RG2.4/double-coset-cardinalities`: `#(IẇI/I) = q^{ℓ(w)}` needs the residue cardinality
  `q` of `K` and the Moy–Prasad subgroups `I_n` (RG2.3), not in the spine.
* `RG2.4/translation-length-formula` (`ℓ(t^λ) = ⟨λ_dom, 2ρ_Σ⟩`) and
  `RG2.4/unramified-combinatorial-comparison`: the échelonnage root system `Σ` (RG2.1) is not in
  the spine; only the additivity and invariance clauses are stated above.
* `RG2.4/iwasawa-integration-and-unimodularity`: unimodularity of `G(E)` needs the point topology
  on `WithConv (H →ₐ[E] E)` to be a topological group (RG2.0), and the integration formula needs
  Haar measures on `K`, `M`, `N` and the modulus character `δ_P`.
* `RG2.4/gl-n-decompositions`, `RG2.4/rank-one-and-nonsplit-examples`: need the Tau Ceti
  `GeneralLinear` points of `GL_n` over a local field with its hyperspecial subgroup, Smith normal
  form over `𝒪[K]`, and the unitary groups of RG2.1.
-/

/-! ## RG2.5 — Integral dual data

Declarations of layer RG2.5 on the spine carriers `LanglandsDual.dualRootDatum`, `dualGroup`,
`galoisActionOnPoints` and `LGroup`. The pinned Chevalley–Demazure construction and the pinning
of `Ĝ` belong to the anchor roadmap (Layer 9) and are not in the pinned library; the torus `T̂`
is the group algebra of `X_*(T)`, which is. -/

namespace LanglandsDual

open BruhatTits

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

@[simp]
theorem dualRootDatum_root (D : AbsoluteRootData K H) (i : D.ι) :
    (dualRootDatum D).root i = D.Ψ.coroot i := rfl

@[simp]
theorem dualRootDatum_flip (D : AbsoluteRootData K H) : (dualRootDatum D).flip = D.Ψ := rfl

/-- The flipped base `Δ^∨` of a base `Δ`, with the same support. -/
def dualBase (D : AbsoluteRootData K H) (b : D.Ψ.Base) : (dualRootDatum D).Base := sorry

theorem dualBase_support (D : AbsoluteRootData K H) (b : D.Ψ.Base) :
    (dualBase D b).support = b.support := sorry

/-- `Aut(Ψ) ≃* Aut(Ψ^∨)`, transpose-inverse on the lattices. -/
def autFlip (D : AbsoluteRootData K H) : RootPairing.Aut D.Ψ ≃* RootPairing.Aut (dualRootDatum D) :=
  sorry

theorem autFlip_indexEquiv (D : AbsoluteRootData K H) (f : RootPairing.Aut D.Ψ) :
    (autFlip D f).indexEquiv = f.indexEquiv := sorry

/-- The dual Galois action `μ̂_G = autFlip ∘ μ_G`. -/
def dualGaloisAction (D : AbsoluteRootData K H) :
    Field.absoluteGaloisGroup K →* RootPairing.Aut (dualRootDatum D) :=
  (autFlip D).toMonoidHom.comp D.galoisAction

theorem dualGaloisAction_preserves_dualBase (D : AbsoluteRootData K H) (b : D.Ψ.Base)
    (hb : ∀ γ i, i ∈ b.support → (D.galoisAction γ).indexEquiv i ∈ b.support) (γ : Field.absoluteGaloisGroup K)
    (i : D.ι) (hi : i ∈ (dualBase D b).support) :
    (dualGaloisAction D γ).indexEquiv i ∈ (dualBase D b).support := sorry

theorem dualGaloisAction_finite (D : AbsoluteRootData K H) :
    (Set.range (dualGaloisAction D)).Finite := sorry

-- Test LanglandsDual.dualGaloisAction_split
example (D : AbsoluteRootData K H) (h : ∀ γ, D.galoisAction γ = 1) (γ : Field.absoluteGaloisGroup K) :
    dualGaloisAction D γ = 1 := by
  simp [dualGaloisAction, h]

-- Test LanglandsDual.transpose_antiHom
/- Transposition without inversion reverses products, so it is not a homomorphism as soon as two
automorphisms fail to commute. -/
example (D : AbsoluteRootData K H) (t : RootPairing.Aut D.Ψ → RootPairing.Aut (dualRootDatum D))
    (ht : ∀ f g, t (f * g) = t g * t f) (f g : RootPairing.Aut D.Ψ) (h : t (f * g) ≠ t (g * f)) :
    ¬ ∀ f g, t (f * g) = t f * t g := fun H' => h (by rw [H', ht g f])

/-- The dual torus `T̂`: the group algebra of `X_*(T)` over `ℤ`. -/
def dualTorus (D : AbsoluteRootData K H) : CommHopfAlgCat.{u} ℤ :=
  CommHopfAlgCat.of ℤ (MonoidAlgebra ℤ (Multiplicative D.Y))

/-- `T̂(R) ≃* Hom(X_*(T), R^×)`. -/
def dualTorusPointsEquiv (D : AbsoluteRootData K H) (R : Type u) [CommRing R] :
    WithConv (dualTorus D →ₐ[ℤ] R) ≃* (Multiplicative D.Y →* Rˣ) := sorry

/-- The inclusion `T̂(R) → Ĝ(R)`. -/
def dualTorusInclusion (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R) →* WithConv (dualGroup D →ₐ[ℤ] R) := sorry

theorem dualTorusInclusion_injective (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Function.Injective (dualTorusInclusion D R) := sorry

/-- The root subgroup `x_{α^∨_i} : (R, +) → Ĝ(R)`. -/
def dualRootSubgroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι) :
    Multiplicative R →* WithConv (dualGroup D →ₐ[ℤ] R) := sorry

theorem dualRootSubgroup_injective (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι) :
    Function.Injective (dualRootSubgroup D R i) := sorry

theorem dualGroup_smooth (D : AbsoluteRootData K H) : Algebra.Smooth ℤ (dualGroup D) := sorry

theorem dualGroup_reductive_fibres (D : AbsoluteRootData K H) (k : Type) [Field k]
    (P : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} k)
    (hP : P.obj = TauCeti.CommHopfAlgCat.baseChange (K := k) (dualGroup D)) :
    TauCeti.reductiveCommHopfAlgProperty k P := sorry

-- Test LanglandsDual.dualGroup_torus
/- With no roots, `Ĝ(R) = Hom(X_*(T), R^×)`. -/
example (D : AbsoluteRootData K H) [IsEmpty D.ι] (R : Type) [CommRing R] :
    Function.Bijective (dualTorusInclusion D R) := sorry

-- Test LanglandsDual.dualGroup_gl_n
example (n : ℕ) (D : AbsoluteRootData K H) (hD : Nonempty (D.ι ≃ {p : Fin n × Fin n // p.1 ≠ p.2}))
    (R : Type) [CommRing R] :
    Nonempty (WithConv (dualGroup D →ₐ[ℤ] R) ≃* Matrix.GeneralLinearGroup (Fin n) R) := sorry

/-- Pinned automorphisms: automorphisms of the dual based root datum lift uniquely to pinned
automorphisms of `Ĝ`, injectively on points over every ring. -/
theorem pinnedLift_injective (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    ∃ lift : RootPairing.Aut (dualRootDatum D) →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)),
      Function.Injective lift ∧
        ∀ γ, galoisActionOnPoints D R γ = lift (dualGaloisAction D γ) := sorry

/-- The Galois action on the based root datum of `Ĝ`. -/
def galoisActionOnPinned (D : AbsoluteRootData K H) :
    Field.absoluteGaloisGroup K →* RootPairing.Aut (dualRootDatum D) :=
  dualGaloisAction D

theorem galoisActionOnPoints_finite (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    (Set.range (galoisActionOnPoints D R)).Finite := sorry

theorem galoisActionOnPoints_torus (D : AbsoluteRootData K H) (R : Type) [CommRing R]
    (γ : Field.absoluteGaloisGroup K) (t : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R)) :
    galoisActionOnPoints D R γ (dualTorusInclusion D R t) ∈ Set.range (dualTorusInclusion D R) :=
  sorry

/-- The Weil form of the action: pull back along `W → Γ_K`. -/
def weilActionOnPoints (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) : W →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)) :=
  (galoisActionOnPoints D R).comp w

-- Test LanglandsDual.galoisAction_split
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, D.galoisAction γ = 1)
    (γ : Field.absoluteGaloisGroup K) : galoisActionOnPoints D R γ = 1 := sorry

/-- The projection `ᴸG(R) → Γ_K`. -/
def projection (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    LGroup D R →* Field.absoluteGaloisGroup K :=
  SemidirectProduct.rightHom

/-- The inclusion `Ĝ(R) → ᴸG(R)`. -/
def inclusion (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    WithConv (dualGroup D →ₐ[ℤ] R) →* LGroup D R :=
  SemidirectProduct.inl

theorem projection_surjective (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Function.Surjective (projection D R) :=
  SemidirectProduct.rightHom_surjective

theorem range_inclusion_eq_ker (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    (inclusion D R).range = (projection D R).ker :=
  SemidirectProduct.range_inl_eq_ker_rightHom

@[simp]
theorem mul_left (D : AbsoluteRootData K H) (R : Type) [CommRing R] (x y : LGroup D R) :
    (x * y).left = x.left * galoisActionOnPoints D R x.right y.left := rfl

/-- The section `γ ↦ (1, γ)`. -/
def section_ (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Field.absoluteGaloisGroup K →* LGroup D R :=
  SemidirectProduct.inr

-- Test LanglandsDual.projection_comp_section
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    (projection D R).comp (section_ D R) = MonoidHom.id _ :=
  SemidirectProduct.rightHom_comp_inr

/-- Functoriality in the coefficient ring. -/
def mapCoeff (D : AbsoluteRootData K H) {R R' : Type} [CommRing R] [CommRing R'] (f : R →+* R') :
    LGroup D R →* LGroup D R' := sorry

theorem projection_comp_mapCoeff (D : AbsoluteRootData K H) {R R' : Type} [CommRing R]
    [CommRing R'] (f : R →+* R') : (projection D R').comp (mapCoeff D f) = projection D R := sorry

/-- The Weil form `Ĝ(R) ⋊ W` for `W → Γ_K`. -/
abbrev WeilLGroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) : Type _ :=
  WithConv (dualGroup D →ₐ[ℤ] R) ⋊[weilActionOnPoints D R w] W

-- Test LanglandsDual.LGroup_split_prod
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, galoisActionOnPoints D R γ = 1) :
    ∃ e : LGroup D R ≃* WithConv (dualGroup D →ₐ[ℤ] R) × Field.absoluteGaloisGroup K,
      ∀ x, (e x).2 = projection D R x := sorry

-- Test LanglandsDual.LGroup_trivial
example (D : AbsoluteRootData K H) (R : Type) [CommRing R]
    [Subsingleton (WithConv (dualGroup D →ₐ[ℤ] R))] : Function.Bijective (projection D R) := sorry

-- Test LanglandsDual.LGroup_not_direct_product
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (γ : Field.absoluteGaloisGroup K)
    (g : WithConv (dualGroup D →ₐ[ℤ] R)) (h : galoisActionOnPoints D R γ g ≠ g) :
    section_ D R γ * inclusion D R g ≠ inclusion D R g * section_ D R γ := sorry

/-- Independence of choices: the L-groups of two absolute root data for the same group are
isomorphic over `Γ_K`. -/
theorem changeOfPinning (D D' : AbsoluteRootData K H) (R : Type) [CommRing R] :
    ∃ e : LGroup D R ≃* LGroup D' R, ∀ x, projection D' R (e x) = projection D R x := sorry

/-- The centre of `Ĝ(R)` for an algebraically closed field `R` is `Hom(π₁(G), R^×)`. -/
theorem dualCentreMulEquiv (D : AbsoluteRootData K H) (R : Type) [Field R] [IsAlgClosed R] :
    Nonempty (Subgroup.center (WithConv (dualGroup D →ₐ[ℤ] R)) ≃*
      (Multiplicative (AlgebraicFundamentalGroup D) →* Rˣ)) := sorry

/-- The dual Levi subgroup attached to a Galois-stable subset `Δ_M` of simple roots: the subgroup
generated by `T̂(R)` and the root subgroups of the coroots in the span of `Δ_M^∨`. -/
def leviDual (D : AbsoluteRootData K H) (R : Type) [CommRing R] (ΔM : Set D.ι) :
    Subgroup (WithConv (dualGroup D →ₐ[ℤ] R)) :=
  (dualTorusInclusion D R).range ⊔
    ⨆ (i : D.ι) (_ : D.Ψ.coroot i ∈ Submodule.span ℤ (D.Ψ.coroot '' ΔM)), (dualRootSubgroup D R i).range

/-- `ᴸM(R) = M̂(R) ⋊ Γ_K` inside `ᴸG(R)`. -/
def LLevi (D : AbsoluteRootData K H) (R : Type) [CommRing R] (ΔM : Set D.ι) : Subgroup (LGroup D R) :=
  (leviDual D R ΔM).map (inclusion D R) ⊔ (section_ D R).range

/-- The Levi embedding `ᴸM(R) → ᴸG(R)`, for dual data `DM` of `M` compatible with `ΔM ⊆ Δ`
(the compatibility is not stated). -/
def leviEmbedding (D : AbsoluteRootData K H) {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (DM : AbsoluteRootData K HM) (R : Type) [CommRing R] (ΔM : Set D.ι) :
    LGroup DM R →* LGroup D R := sorry

theorem leviEmbedding_injective (D : AbsoluteRootData K H)
    {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (DM : AbsoluteRootData K HM) (R : Type)
    [CommRing R] (ΔM : Set D.ι) : Function.Injective (leviEmbedding D DM R ΔM) := sorry

theorem leviEmbedding_range (D : AbsoluteRootData K H)
    {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (DM : AbsoluteRootData K HM) (R : Type)
    [CommRing R] (ΔM : Set D.ι) : (leviEmbedding D DM R ΔM).range = LLevi D R ΔM := sorry

theorem projection_comp_leviEmbedding (D : AbsoluteRootData K H)
    {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (DM : AbsoluteRootData K HM) (R : Type)
    [CommRing R] (ΔM : Set D.ι) :
    (projection D R).comp (leviEmbedding D DM R ΔM) = projection DM R := sorry

-- Test LanglandsDual.leviEmbedding_self
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] : leviDual D R Set.univ = ⊤ := sorry

-- Test LanglandsDual.leviEmbedding_torus
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    leviDual D R ∅ = (dualTorusInclusion D R).range := sorry

/-- Products: the dual of a product is the product of the duals, with the diagonal action. -/
theorem dualIsogeny_exists {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : AbsoluteRootData K H)
    (D' : AbsoluteRootData K H') (DP : AbsoluteRootData K H) (e : DP.ι ≃ D.ι ⊕ D'.ι) (R : Type)
    [CommRing R] :
    Nonempty (WithConv (dualGroup DP →ₐ[ℤ] R) ≃*
      WithConv (dualGroup D →ₐ[ℤ] R) × WithConv (dualGroup D' →ₐ[ℤ] R)) := sorry

/-- The dual group of a torus is the dual torus. -/
theorem dualGroup_torus_points (D : AbsoluteRootData K H) [IsEmpty D.ι] (R : Type) [CommRing R] :
    Nonempty (WithConv (dualGroup D →ₐ[ℤ] R) ≃* (Multiplicative D.Y →* Rˣ)) := sorry

end LanglandsDual

/-! ### RG2.5 statements not yet stateable at the pins

* `RG2.5/dual-based-root-datum` tests `dualRootDatum_gl_n` and `dualRootDatum_sl2`: the Tau Ceti
  coordinate root datum of `GL_n` (`GeneralLinear.diagonalRootDatum`) is not in the compiled
  modules, and `SL₂`/`PGL₂` root data are not packaged as `AbsoluteRootData` at the pin.
* `RG2.5/langlands-dual-group` items `dualRootSubgroup_conj`, `dualPinning` and tests
  `dualGroup_sl2_centre`, `dualGroup_not_self`: need the pinning of the Chevalley–Demazure group
  (anchor Layer 9) and the `SL₂`/`PGL₂` instances.
* `RG2.5/pinned-automorphisms` parts (2)–(3) (`Aut = Inn ⋊ Aut(pinned)`, simple transitivity of
  `Ĝ^ad(k)` on pinnings): need the adjoint group and pinnings.
* `RG2.5/galois-action-on-dual-group` items `galoisActionOnPoints_eq_lift` (only the existence
  of a lift is stated in `pinnedLift_injective`), `galoisActionOnPoints_natural` (needs the
  spine `galoisActionOnPoints` to be natural in `R`, which is not part of its type) and tests
  `galoisAction_unitary`, `galoisAction_torus_compat`, `galoisAction_not_inner`.
* `RG2.5/l-group` items `finiteAction`, `inflation`: need the Krull topology on
  `Field.absoluteGaloisGroup K` and open normal subgroups acting trivially; the topology is not
  provided at the pin.
* `RG2.5/dual-centre-and-fundamental-group`: the `Γ_K`-equivariance and the inertia fixed points
  `Z(Ĝ)^I` with character group `π₁(G)_I`.
* `RG2.5/l-group-levi-embedding` item `leviEmbedding_trans` and tests `leviEmbedding_gl3`,
  `leviEmbedding_not_stable`: need the dual data of `M' ⊆ M ⊆ G` and the unitary group.
* `RG2.5/dual-isogenies-and-products` parts (1) and (3) (central isogenies, z-extensions): need
  the dual isogeny as a Hopf map between Chevalley groups.
* `RG2.5/dual-of-weil-restriction`: needs the induced based root datum and the Galois cocycle of
  `Res_{K'/K}`.
* `RG2.5/torus-and-gl-dual-groups` part (2) and `RG2.5/gsp4-self-dual`: need the coordinate root
  data of `GL_n` and `GSp₄` with their Chevalley groups. -/

/-! ## Names of the roadmap without a Lean form yet

The following API lemmas and unit tests of the roadmap document need vocabulary the pinned
libraries do not have (twisted Levi subgroups, R-smoothness and quasi-tameness of tori, the
reductive quotient of a special fibre as a group over the residue field, the Frobenius action on
the Iwahori–Weyl group and on coinvariant cocharacters). They are listed here under the names
the roadmap gives them so that the file and the document agree.

### RG2.1 — `BruhatTits.RootDatum.le_normalizer`, `BruhatTits.RootDatum.commutator_le`, `BruhatTits.RootDatum.le_of_root_eq_two_smul`, `BruhatTits.RootDatum.weylGroupEquiv`, `BruhatTits.RootDatum.IsGenerating`, `BruhatTits.Valuation.filtration`, `BruhatTits.Valuation.filtration_antitone`, `BruhatTits.Valuation.valueSet`, `BruhatTits.Valuation.smul`, `BruhatTits.Valuation.IsDiscrete`, `BruhatTits.Apartment.vadd_def`, `BruhatTits.Apartment.action_linear`, `BruhatTits.AffineRoot.gradient`, `BruhatTits.AffineRoot.wall`, `BruhatTits.AffineRoot.rootSubgroup_mono`, `BruhatTits.AffineRoot.valueSet`, `BruhatTits.AffineRoot.filtrationAt_succ`, `BruhatTits.Facet.wall`, `BruhatTits.Facet.IsAlcove`, `BruhatTits.Facet.le`, `BruhatTits.Facet.le_iff`, `BruhatTits.Facet.locallyFinite`, `BruhatTits.AffineWeylGroup.simpleReflections`, `BruhatTits.AffineWeylGroup.coxeterSystem`, `BruhatTits.AffineWeylGroup.simplyTransitive_alcoves`, `BruhatTits.AffineWeylGroup.semidirect`, `BruhatTits.AffineWeylGroup.normal_in_image`, `BruhatTits.AlgebraicFundamentalGroup.galoisAction`, `BruhatTits.AlgebraicFundamentalGroup.map`, `BruhatTits.AlgebraicFundamentalGroup.torus`, `BruhatTits.AlgebraicFundamentalGroup.exact_central`, `BruhatTits.AlgebraicFundamentalGroup.leviKernel`, `BruhatTits.AlgebraicFundamentalGroup.weyl_invariant`
### RG2.2 — `TwistedLevi.IsTwistedLevi`, `TwistedLevi.IsTame`, `TwistedLevi.of_isLevi`, `TwistedLevi.centralizer_torus`, `TwistedLevi.buildingImage`, `TwistedLevi.buildingImage_eq`, `TwistedLevi.maximalTorus`, `TwistedLevi.whole_group`, `TwistedLevi.levi_compat`, `TwistedLevi.elliptic_not_levi`, `BruhatTits.Building.mk`, `BruhatTits.Building.mk_eq_mk_iff`, `BruhatTits.Building.smul_mk`, `BruhatTits.Building.apartmentEmbedding_injective`, `BruhatTits.Building.normalizer_smul_apartmentEmbedding`, `BruhatTits.Building.exists_smul_apartmentEmbedding`, `BruhatTits.BuildingFacet.mem_unique`, `BruhatTits.BuildingFacet.le_iff`, `BruhatTits.BuildingFacet.smul`, `BruhatTits.BuildingFacet.IsChamber`, `BruhatTits.BuildingFacet.IsVertex`, `BruhatTits.BuildingFacet.IsSpecial`, `BruhatTits.BuildingFacet.orientationCharacter`, `BruhatTits.ReducedBuilding.centralVector`, `BruhatTits.ReducedBuilding.centre_smul`, `BruhatTits.ReducedBuilding.adjointEquiv`
### RG2.3 — `NeronModel.rSmoothClosure`, `NeronModel.IsRSmooth`, `NeronModel.isRSmooth_iff_independent`, `NeronModel.rSmoothClosure_eq_lft`, `NeronModel.isRSmooth_baseChange_breve`, `NeronModel.IsRSmoothGroup`, `NeronModel.isRSmooth_split`, `NeronModel.isRSmooth_trivial`, `NeronModel.isRSmooth_tame_compat`, `NeronModel.isRSmooth_closure_not_lft_in_general`, `IntegralModel.QuasiTameDecomposition`, `IntegralModel.IsQuasiTame`, `IntegralModel.IsEssentiallyTame`, `IntegralModel.IsTamelyRamified`, `IntegralModel.IsTamelyRamified.isQuasiTame`, `IntegralModel.IsQuasiTame.resGm`, `IntegralModel.IsQuasiTame.compat_rSmooth`, `IntegralModel.IsQuasiTame.not_wild_unitary`, `BruhatTits.Parahoric.reductiveQuotient_gl_n_vertex`, `BruhatTits.Parahoric.reductiveQuotient_torus`, `BruhatTits.Parahoric.reductiveQuotient_iwahori_gl2`, `BruhatTits.Parahoric.reductiveQuotient_not_specialFibre`, `IntegralModel.SmoothModel.mem_integralPoints_iff`, `IntegralModel.SmoothModel.Hom`, `IntegralModel.SmoothModel.HasConnectedFibres`, `IntegralModel.SmoothModel.identityComponent`, `IntegralModel.SmoothModel.IsReductive`, `IntegralModel.SmoothModel.isReductive_iff_fibres`, `IntegralModel.SmoothModel.IsReductive.hasConnectedFibres`, `IntegralModel.IsQuasiTame.weilRestriction`, `BruhatTits.GroupScheme.integralPoints_eq_fixer`, `BruhatTits.GroupScheme.groupScheme_conj`, `BruhatTits.GroupScheme.eq_of_enclosure_eq`, `BruhatTits.GroupScheme.bigCell`, `BruhatTits.GroupScheme.torusClosure_eq_ft`, `BruhatTits.GroupScheme.parahoric_hasConnectedFibres`, `BruhatTits.GroupScheme.toParahoric`, `BruhatTits.GroupScheme.parahoric_integralPoints`, `BruhatTits.GroupScheme.parahoric_eq_of_sameFacet`, `BruhatTits.GroupScheme.parahoric_eq_groupScheme_of_simplyConnected`
### RG2.4 — `BruhatTits.IwahoriWeylGroup.apartmentAction_mk`, `BruhatTits.IwahoriWeylGroup.frobeniusFixedEquiv`, `BruhatTits.IwahoriWeylGroup.sl2_eq_affineWeyl`, `BruhatTits.IwahoriWeylGroup.pgl2_lengthZero`, `BruhatTits.IwahoriWeylGroup.not_quotient_by_boundedPart`, `BruhatTits.IwahoriWeylGroup.length_translation_gl2`, `BruhatTits.Coinvariants.frobeniusAverage`, `BruhatTits.Coinvariants.frobeniusAverage_isDominant`, `BruhatTits.Coinvariants.hodgeCoweight`, `BruhatTits.Coinvariants.isDominant_gl_n`, `BruhatTits.Coinvariants.dominanceLE_gl2`, `BruhatTits.Coinvariants.frobeniusAverage_split_compat`, `BruhatTits.Admissible.admissibleSet_frobenius`, `BruhatTits.Admissible.admissibleSet_gl2_minuscule`, `BruhatTits.Admissible.parahoricAdmissibleSet_hyperspecial_compat`
-/
