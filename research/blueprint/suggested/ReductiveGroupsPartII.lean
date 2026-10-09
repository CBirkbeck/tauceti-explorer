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

This file gives suggested forms for layers RG2.0, RG2.0a and the second half of RG2.3 (integral-model
results, Moy–Prasad filtrations, Lang's theorem, level subgroups). Layers RG2.1, RG2.2, the first half
of RG2.3, RG2.4 and RG2.5 are not yet given suggested forms here.
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

/-! ## RG2.3 (continued) — extensions of parahorics, lattice chains, Moy–Prasad filtrations, Lang

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
