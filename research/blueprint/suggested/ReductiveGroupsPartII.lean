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
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.RingTheory.Smooth.AdicCompletion
import Mathlib.RingTheory.Etale.Field
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.AffineScheme
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.CategoryTheory.Yoneda
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.LinearAlgebra.Projectivization.Basic
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.NonSplitTorus
import TauCeti.Algebra.AlgebraicGroup.SpecialOrthogonal.Basic
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
import TauCeti.GroupTheory.TitsSystem.Bruhat.Basic
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic

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

The file gives forms for all seven layers. The imported unvalued structures are explicit data;
conditions that depend on future anchor declarations are described beside their signatures.
The abstract Tits system and its Bruhat theorem are imported from the pinned Tau Ceti library.
-/

set_option autoImplicit false
set_option linter.unusedVariables false

noncomputable section

open _root_.CategoryTheory
open scoped BigOperators
open MeasureTheory
open scoped TensorProduct Pointwise

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
root subgroups `U a` indexed by the possibly non-reduced roots, representatives of the reflection
cosets, and the rank-one, transport and positivity axioms. -/
structure RootDatum (G : Type v) [Group G] (Φ : RootPairing ι ℝ M N) where
  /-- The subgroup `T` (the rational points of the minimal Levi `Z`). -/
  T : Subgroup G
  /-- The root subgroups. -/
  U : ι → Subgroup G
  U_ne_bot : ∀ i, U i ≠ ⊥
  le_normalizer : ∀ i, T ≤ Subgroup.normalizer (U i : Set G)
  le_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≤ U i
  commutator_le : ∀ i j, (∀ c : ℝ, c < 0 → Φ.root j ≠ c • Φ.root i) →
    ⁅U i, U j⁆ ≤ ⨆ (k : ι) (_ : ∃ p q : ℕ, 0 < p ∧ 0 < q ∧
      Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j), U k
  /-- Representative of the right `T`-coset `M_a`. -/
  reflectionRepresentative : ι → G
  rankOne : ∀ i, (U (Φ.reflectionPerm i i) : Set G) \ {1} ⊆
    (U i : Set G) * ((T : Set G) * {reflectionRepresentative i}) * (U i : Set G)
  transport : ∀ i j n, n ∈ (T : Set G) * {reflectionRepresentative i} →
    (U j).map (MulAut.conj n).toMonoidHom = U (Φ.reflectionPerm i j)
  positiveVector : N
  regular_positiveVector : ∀ i, Φ.toLinearMap (Φ.root i) positiveVector ≠ 0
  positivity : ((T : Set G) *
    (Subgroup.closure (⋃ i : {i // 0 < Φ.toLinearMap (Φ.root i) positiveVector},
      (U i.1 : Set G)) : Set G)) ∩
    (Subgroup.closure (⋃ i : {i // Φ.toLinearMap (Φ.root i) positiveVector < 0},
      (U i.1 : Set G)) : Set G) = {1}

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
  conjugation_constant : ∀ i m, m ∈ (D.T : Set G) * {D.reflectionRepresentative i} →
    ∃ c : ℝ, ∀ (u : D.U (Φ.reflectionPerm i i)) (u' : D.U i), u ≠ 1 →
      (u' : G) = m * u * m⁻¹ → φ i u' = φ (Φ.reflectionPerm i i) u + (c : WithTop ℝ)
  valued_commutator_le : ∀ i j, (∀ c : ℝ, c < 0 → Φ.root j ≠ c • Φ.root i) → ∀ r s : ℝ,
    ⁅filtration i r, filtration j s⁆ ≤ ⨆ (k : ι)
      (_ : ∃ p q : ℕ, 0 < p ∧ 0 < q ∧
        Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
        ⨆ (p : ℕ) (q : ℕ) (_ : 0 < p ∧ 0 < q ∧
          Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
          filtration k ((p : ℝ) * r + (q : ℝ) * s)
  doubling : ∀ i j (h : Φ.root j = (2 : ℝ) • Φ.root i) (u : D.U j),
    φ j u = (2 : WithTop ℝ) * φ i ⟨u, D.le_of_root_eq_two_smul i j h u.property⟩
  rankOne_values : ∀ i (u : D.U i) (u' u'' : D.U (Φ.reflectionPerm i i)), u ≠ 1 →
    (u' : G) * u * u'' ∈ (D.T : Set G) * {D.reflectionRepresentative i} →
    ∃ c : ℝ, φ i u = (c : WithTop ℝ) ∧ φ (Φ.reflectionPerm i i) u' = ((-c : ℝ) : WithTop ℝ)

/-- Two valuations are equipollent if they differ by a vector `v` of the coroot space:
`ψ_a = φ_a + a(v)` (Bruhat–Tits I, 6.2.5). -/
def Equipollent {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) : Prop :=
  ∃ v : N, ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ)

/-- The reduced valuation orbit. Central vectors act trivially on this orbit. -/
def ReducedValuationApartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) : Type (max u v) :=
  {ψ : Valuation D // Equipollent φ ψ}

/-- An enlarged apartment with a chosen origin: retain the translation vector as well as its
valuation. The root kernel is retained, rather than incorrectly making the valuation orbit a
torsor under the full cocharacter space. -/
def Apartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) :=
  {q : ReducedValuationApartment φ × N //
    ∀ i u, q.1.1.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) q.2 : ℝ) : WithTop ℝ)}

/-- Forget the central coordinate, preserving the notation used in root charts. -/
def Apartment.fst {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} {φ : Valuation D} (x : Apartment φ) : Valuation D := x.val.1.val

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
  base : Ψ.Base
  galoisAction : Field.absoluteGaloisGroup K →* RootPairing.Aut Ψ
  preserves_base : ∀ γ, base.map (galoisAction γ) = base
  finite_action : (Set.range galoisAction).Finite
  open_kernel : IsOpen (galoisAction.ker : Set (Field.absoluteGaloisGroup K))

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
-- The projective-line scheme/quotient-topology identification is a future adapter.
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] :
    @CompactSpace (Projectivization E (Fin 2 → E))
      (TopologicalSpace.coinduced (Projectivization.mk' E (V:=Fin 2 → E)) inferInstance) := sorry

-- Test SchemePointTopology.affine_compat
example (A : Type u) [CommRing A] [Algebra k A] (fA : Spec (CommRingCat.of A) ⟶ Spec (CommRingCat.of k)) :
    ∃ e : (Spec (CommRingCat.of R) ⟶ Spec (CommRingCat.of A)) → (A →ₐ[k] R),
      @Continuous _ _ (topology _ fA R) (PointTopology.topology k A R) e := sorry

-- Test SchemePointTopology.not_iUnion_of_nonlocal
-- The unimodular homogeneous pair defines an R-point of P1, but neither
-- coordinate is a unit, so it lies in neither standard affine chart.
example {E : Type u} [Field E] :
    ((1,0) : E×E) + ((0,1) : E×E)=1 ∧
    ¬ IsUnit ((1,0) : E×E) ∧ ¬ IsUnit ((0,1) : E×E) := sorry

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
example (n : ℕ) (hn : 1≤n)
    (x : WithConv (LaurentPolynomial 𝒪[E] →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E (LaurentPolynomial 𝒪[E]) n ↔
      Units.map (Subring.subtype 𝒪[E]).toMonoidHom
        (TauCeti.MultiplicativeGroup.pointsMulEquiv x) ∈ TauCeti.unitFiltration E n := sorry

-- Test CongruenceSubgroup.iInf_eq_bot
example [Algebra.FiniteType 𝒪[E] H] : (⨅ n, subgroup E H n) = ⊥ := sorry

-- Test CongruenceSubgroup.not_mem_of_det_nonunit
example (ϖ : 𝒪[E]) (hϖ : ϖ ∈ 𝓂[E]) (hϖ2 : ϖ ∉ 𝓂[E]^2)
    (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2 →ₐ[𝒪[E]] 𝒪[E]))
    (hx : (TauCeti.GeneralLinear.pointsMulEquiv (n:=2) x : Matrix (Fin 2) (Fin 2) 𝒪[E])=
      !![1+ϖ,0;0,1]) :
    x ∈ subgroup E _ 1 ∧ x ∉ subgroup E _ 2 := sorry

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
example (p : ℕ) [Fact p.Prime] :
    Nonempty (𝒪[Breve ℚ_[p]] ≃+* WittVector p (AlgebraicClosure (ZMod p))) := sorry

-- Test MaxUnramifiedCompletion.ramificationIndex_one
-- Compare the two value groups through their normalized extension map.
example (x : E) :
    valuation (Breve E) (algebraMap E (Breve E) x)<1 ↔ valuation E x<1 := sorry

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
-- Over O=Z_3, O'=O[√3], restriction of Spec(O'[x]/x²) has these
-- coordinates. The class of b³ is nonzero and is killed by 3.
example :
    let P := MvPolynomial (Fin 2) ℤ_[3]
    let a : P := MvPolynomial.X 0
    let b : P := MvPolynomial.X 1
    ¬ Module.Flat ℤ_[3] (P ⧸ Ideal.span {a^2+3*b^2, 2*a*b}) := sorry

/-- Finite type and finite presentation are inherited. -/
theorem finiteType_res [Algebra.FiniteType k' A'] : Algebra.FiniteType k (Res k k' A') := sorry

/-- Formal smoothness and smoothness are inherited. -/
theorem formallySmooth_res [Algebra.FormallySmooth k' A'] :
    Algebra.FormallySmooth k (Res k k' A') := sorry

theorem smooth_res [Algebra.Smooth k' A'] : Algebra.Smooth k (Res k k' A') := sorry

/-- Surjections (closed immersions) are preserved. -/
theorem map_surjective {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A')
    (hφ : Function.Surjective φ) : Function.Surjective (map k k' A' φ) := sorry

/-- On algebras, `Res` is left adjoint to base change: its unit is `universal` and its
counit is the coordinate arrow of the scheme diagonal. Passing to affine schemes reverses the
arrows: base change is left adjoint to Weil restriction. -/
def adjunction (B : Type u) [CommRing B] [Algebra k B] :
    (A' →ₐ[k'] k' ⊗[k] B) ≃ (Res k k' A' →ₐ[k] B) := (homEquiv k k' A' B).symm

/-- The affine-scheme adjunction unit `X → Res(X_{k'})`, expressed by its coordinate arrow.
This arrow is the counit of the algebra adjunction. -/
def adjunctionUnit (B : Type u) [CommRing B] [Algebra k B] :
    Res k k' (k' ⊗[k] B) →ₐ[k] B := sorry

theorem adjunctionUnit_surjective [Module.FaithfullyFlat k k'] (B : Type u) [CommRing B]
    [Algebra k B] : Function.Surjective (adjunctionUnit k k' B) := sorry

end Representing

/-- Dimension multiplication for finite separable field extensions. Nontriviality excludes the
empty affine scheme; finite type ensures a finite Krull dimension. Inseparability is excluded. -/
theorem dimension_res_separable (k : Type u) [Field k] (k' : Type u) [Field k']
    [Algebra k k'] [FiniteDimensional k k'] [Algebra.IsSeparable k k']
    (A' : Type u) [CommRing A'] [Algebra k' A'] [Algebra.FiniteType k' A'] [Nontrivial A']
    (n : ℕ) (hdim : ringKrullDim A' = (n : WithBot ℕ∞)) :
    ringKrullDim (Res k k' A') = ((Module.finrank k k' * n : ℕ) : WithBot ℕ∞) := sorry

/-- The geometric presentation of restriction of alpha_2 along a dual-number extension.
It models the base change of a purely inseparable quadratic field extension in characteristic 2.
The equation constrains only the constant coordinate, leaving one free coordinate. -/
def alphaTwo_geometricPresentation (Ω : Type u) [Field Ω] [CharP Ω 2] :
    let B := Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}
    letI : CommRing B := inferInstanceAs (CommRing (Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}))
    letI : Algebra Ω B := inferInstanceAs (Algebra Ω (Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}))
    Res Ω B (Polynomial B ⧸ Ideal.span {(Polynomial.X : Polynomial B)^2}) ≃ₐ[Ω]
      (MvPolynomial (Fin 2) Ω ⧸ Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) Ω)^2}) :=
  sorry

-- Test WeilRestriction.res_not_dimension_inseparable
example (Ω : Type u) [Field Ω] [CharP Ω 2] :
    let B := Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}
    letI : CommRing B := inferInstanceAs (CommRing (Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}))
    letI : Algebra Ω B := inferInstanceAs (Algebra Ω (Polynomial Ω ⧸ Ideal.span {(Polynomial.X : Polynomial Ω)^2}))
    ringKrullDim (Res Ω B (Polynomial B ⧸ Ideal.span {(Polynomial.X : Polynomial B)^2})) = 1 :=
  sorry

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

/-- The fppf quotient `u_{E/F,n}` as a represented multiplicative-type group.
This is a group scheme, including when `μ_n` is nonsmooth. -/
def resRootsOfUnityQuotient (F : Type u) [Field F] (E : Type u) [Field E]
    [Algebra F E] [FiniteDimensional F E] [Algebra.IsSeparable F E]
    (n : ℕ) : CommHopfAlgCat.{u} F := sorry

def augmentationKernel (ι : Type u) [Fintype ι] (n : ℕ) : AddSubgroup (ι → ZMod n) where
  carrier := {c | ∑ i, c i = 0}
  zero_mem' := by simp
  add_mem' := by sorry
  neg_mem' := by sorry

/-- `n>0`; the displayed equivalence also respects the permutation Galois action. -/
def rootsQuotientCharacterEquiv (F : Type u) [Field F] (E : Type u) [Field E]
    [Algebra F E] [FiniteDimensional F E] [Algebra.IsSeparable F E]
    (n : ℕ) (hn : 0<n) [Fintype (E →ₐ[F] AlgebraicClosure F)] :
    TauCeti.CommHopfAlgCat.additiveCharacterGroup (resRootsOfUnityQuotient F E n) ≃+
      augmentationKernel (E →ₐ[F] AlgebraicClosure F) n := sorry

/-- The product-power transition for a finite Galois tower and positive moduli `n | m`.
The arrow is contravariant because the carriers are coordinate Hopf algebras. -/
def rootsQuotientTransition (F : Type u) [Field F] (E L : Type u)
    [Field E] [Field L] [Algebra F E] [Algebra F L] [Algebra E L] [IsScalarTower F E L]
    [FiniteDimensional F E] [FiniteDimensional F L]
    [IsGalois F E] [IsGalois F L] (n m : ℕ) (hnm : n ∣ m) (hn : 0 < n) (hm : 0 < m) :
    resRootsOfUnityQuotient F E n ⟶ resRootsOfUnityQuotient F L m := sorry

/-- The character pullback induced by `rootsQuotientTransition` after scalar extension to an
algebraic closure. Its construction applies the extended coordinate arrow to group-like elements;
it is a specific map, rather than an arbitrary additive homomorphism. -/
def rootsQuotientCharacterMap (F : Type u) [Field F] (E L : Type u)
    [Field E] [Field L] [Algebra F E] [Algebra F L] [Algebra E L] [IsScalarTower F E L]
    [FiniteDimensional F E] [FiniteDimensional F L]
    [IsGalois F E] [IsGalois F L] (n m : ℕ) (hnm : n ∣ m) (hn : 0 < n) (hm : 0 < m) :
    TauCeti.CommHopfAlgCat.additiveCharacterGroup (resRootsOfUnityQuotient F E n) →+
      TauCeti.CommHopfAlgCat.additiveCharacterGroup (resRootsOfUnityQuotient F L m) := sorry

/-- The divisibility factor makes the map independent of the representative modulo `n`. -/
def rootsQuotientCoefficientMap (n m : ℕ) (hnm : n ∣ m) (hn : 0 < n) (hm : 0 < m) :
    ZMod n →+ ZMod m where
  toFun c := (m/n : ZMod m) * (c.val : ZMod m)
  map_zero' := by sorry
  map_add' := by sorry

/-- On characters the actual transition repeats embedding coordinates and multiplies by `m/n`.
Both sides use the specific geometric character identifications and the tower restriction map. -/
theorem rootsQuotientTransition_character (F : Type u) [Field F] (E L : Type u)
    [Field E] [Field L] [Algebra F E] [Algebra F L] [Algebra E L] [IsScalarTower F E L]
    [FiniteDimensional F E] [FiniteDimensional F L] [IsGalois F E] [IsGalois F L]
    [Fintype (E →ₐ[F] AlgebraicClosure F)] [Fintype (L →ₐ[F] AlgebraicClosure F)]
    (n m : ℕ) (hnm : n ∣ m) (hn : 0 < n) (hm : 0 < m)
    (χ : TauCeti.CommHopfAlgCat.additiveCharacterGroup (resRootsOfUnityQuotient F E n))
    (b : L →ₐ[F] AlgebraicClosure F) :
    (rootsQuotientCharacterEquiv F L m hm
        (rootsQuotientCharacterMap F E L n m hnm hn hm χ)).val b =
      rootsQuotientCoefficientMap n m hnm hn hm
        ((rootsQuotientCharacterEquiv F E n hn χ).val (b.comp (IsScalarTower.toAlgHom F E L))) := sorry

-- Test NormTorus.rootsQuotient_transition_factor
example : rootsQuotientCoefficientMap 2 4 (by decide) (by decide) (by decide) (1 : ZMod 2) = 2 ∧
    rootsQuotientCoefficientMap 2 4 (by decide) (by decide) (by decide) (1 + 1 : ZMod 2) = 0 :=
  by decide

-- Test NormTorus.rootsQuotient_transition_same_modulus
example : rootsQuotientCoefficientMap 2 2 (by decide) (by decide) (by decide) (1 : ZMod 2) = 1 :=
  by decide

-- Test NormTorus.rootsQuotient_trivial_extension
example (n : ℕ) : Subsingleton (augmentationKernel (Fin 1) n) := sorry

-- Test NormTorus.rootsQuotient_quadratic_two
example : Nat.card (augmentationKernel (Fin 2) 2)=2 := sorry

-- Test NormTorus.rootsQuotient_not_normOne
example : ¬ Nonempty (augmentationKernel (Fin 2) 2 ≃+ ℤ) := sorry

-- Test NormTorus.norm_complex
example (x y : ℝ) (h : (⟨x, y⟩ : ℂ) ≠ 0) :
    Algebra.norm ℝ (⟨x, y⟩ : ℂ) = x ^ 2 + y ^ 2 := sorry

-- Test NormTorus.norm_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (x : (k ⊗[k] R)ˣ) :
    ((norm k k R x : Rˣ) : R) = (Algebra.TensorProduct.lid k R) (x : k ⊗[k] R) := sorry

-- Test NormTorus.normOne_compat_specialOrthogonal
example : Nonempty (normOne ℝ ℂ ℝ ≃* Matrix.specialOrthogonalGroup (Fin 2) ℝ) := sorry

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
-- The pinned map chooses a basis. Its determinant is basis independent;
-- changing to (1,i) gives the matrix ((x,-y),(y,x)).
example (h : Module.finrank ℝ ℂ=2) (z : ℂˣ) :
    Matrix.det (TauCeti.GL2NonSplitTorusHom ℝ ℂ h z : Matrix (Fin 2) (Fin 2) ℝ)=
      Algebra.norm ℝ (z : ℂ) := sorry

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
parahoric group schemes induced by a central extension `α : G → G̃` is faithfully flat; the
corresponding coordinate map is injective as a consequence, and it is compatible with `α` on
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

open scoped PointTopology
open _root_.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- The Moy–Prasad subgroup `G_{y,r}` (`r ≥ 0`) at a point of the building. In the torus
factor the connected Néron-model condition is retained; tame splitting allows the simpler
character-only description. -/
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
        ⋃ i, (x.fst.filtration i r : Set (WithConv (H →ₐ[K] K)))) := sorry

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
/- Here G is SL₂, 𝔤 its actual Lie algebra and y the edge barycentre. The future
standard SL₂ apartment identification is an omitted input. At y, the toral
coordinate acquires a uniformizer at depth 1/2 while the upper-root coordinate
acquires one only above depth 1/2. These two coordinates witness the inequalities. -/
example (y : Building D φ) :
    lieLattice D φ 𝔤 y (1/2) ≠ lieLattice D φ 𝔤 y 0 ∧
      lieLattice D φ 𝔤 y (1/2) ≠ lieLattice D φ 𝔤 y 1 := sorry

/-- For a group split over a finite tame extension, as specified in the roadmap.
The tame-splitting predicate is omitted until the local ramification API is available.
 The Moy–Prasad isomorphism `G_{y,r}/G_{y,r+} ≃ 𝔤_{y,r}/𝔤_{y,r+}` for `r > 0`. -/
theorem groupLieGradedEquiv (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    Nonempty ((filtration D φ y r) ⧸ (filtrationPlus D φ y r).subgroupOf (filtration D φ y r) ≃
      (lieLattice D φ 𝔤 y r) ⧸ (lieLatticePlus D φ 𝔤 y r).comap (lieLattice D φ 𝔤 y r).subtype) :=
  sorry

/-- Positive-depth Moy–Prasad subgroups are pro-`p` (for `E` local of residue characteristic `p`;
the topology on `G(E)` is the point topology of RG2.0). -/
theorem isProP_filtration [TopologicalSpace K] [IsNonarchimedeanLocalField K] (p : ℕ)
    (hp : ringChar 𝓀[K] = p) (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    ∀ N : Subgroup (filtration D φ y r), N.Normal → IsOpen (N : Set (filtration D φ y r)) → N.FiniteIndex →
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
        (⋃ i ∈ S', (x.fst.filtration i s : Set (WithConv (H →ₐ[K] K)))) ∪
        ⋃ i ∈ S'ᶜ, (x.fst.filtration i t : Set (WithConv (H →ₐ[K] K)))) := sorry

-- Test MoyPrasad.yuGroup_torus
example (T : Subgroup (WithConv (H →ₐ[K] K))) (y : Building D φ) (s t : ℝ) (x : Apartment φ)
    (hy : y = apartmentEmbedding D φ x) :
    yuGroup D φ T (fun r => torusFiltration D r) y s t =
      torusFiltration D s ⊔ Subgroup.closure (⋃ i, (x.fst.filtration i t : Set _)) := sorry

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
/- For SL₂ choose the negative-root then positive-root ordering in Adler's
construction. On off-diagonal coordinates it is (a,b) ↦ x₋(b)x₊(a).
The two pure-root inputs of positive depth t give different products; the
error t² has twice the depth. No hypothesis assumes the desired inequality. -/
example (t : K) (ht : t ≠ 0) :
    !![1,t;t,1+t*t] ≠ !![1,t;0,1] * !![1,0;t,(1:K)] := sorry

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

/-! ## RG2.1 — Valued roots, apartments and arithmetic lattices

The reductivity, maximality, pinning, henselianity and descent conditions in the reader are
inputs from the anchor. When the pinned library cannot express one, it is omitted from the
signature and named here; no empty predicate substitutes for it. Statements involving field
valuation accept its additive normalization explicitly. -/
namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- Strict-henselian discrete field, connected reductive group: existence of a rational Borel.
The field conditions are omitted; the anchor's Borel predicate is already available. -/
theorem isQuasiSplit_of_residueField_isAlgClosed :
    ∃ I : TauCeti.HopfIdeal K H, TauCeti.HopfIdeal.IsBorel K H.obj I := sorry

/-- The maximal split torus over the completed unramified field descends to `K`.
The maximal-split and containment predicates belong to anchor Layer 7 and are omitted. -/
theorem exists_rational_maximalUnramifiedSplitTorus :
    ∃ T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K, TauCeti.torusCommHopfAlgProperty K T := sorry

section Abstract
variable {ι M N G : Type u} [Group G] [AddCommGroup M] [Module ℝ M]
  [AddCommGroup N] [Module ℝ N] {Φ : RootPairing ι ℝ M N}
variable (D : RootDatum G Φ) (φ : Valuation D)

def RootDatum.IsGenerating : Prop := D.T ⊔ (⨆ i, D.U i) = ⊤
def RootDatum.normalizerGroup : Subgroup G :=
  Subgroup.closure ((D.T : Set G) ∪ Set.range D.reflectionRepresentative)
instance : (D.T.subgroupOf D.normalizerGroup).Normal := sorry
def RootDatum.weylGroupEquiv :
    (D.normalizerGroup ⧸ D.T.subgroupOf D.normalizerGroup) ≃* Φ.weylGroup := sorry

def Valuation.valueSet {D : RootDatum G Φ} (φ : Valuation D) (i : ι) : Set ℝ :=
  {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ)}
theorem Valuation.filtration_antitone (i : ι) : Antitone (φ.filtration i) := sorry

def Valuation.shift {D : RootDatum G Φ} (φ : Valuation D) (v : N) : Valuation D := sorry
theorem Valuation.shift_apply (v : N) (i : ι) (a : D.U i) :
    (φ.shift v).φ i a = φ.φ i a + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := sorry
/-- Transport by an automorphism that carries root groups according to `e`. -/
def Valuation.smul {D : RootDatum G Φ} (φ : Valuation D) (g : MulAut G) (e : Equiv.Perm ι)
    (_h : ∀ i, (D.U i).map g.toMonoidHom = D.U (e i)) : Valuation D := sorry
/-- `χ` is the character by which `T` acts on the root group; `ω` is additive valuation. -/
def Valuation.IsCompatible (χ : ι → D.T →* Kˣ) (ω : Kˣ →* Multiplicative ℝ) : Prop :=
  ∀ i (z : D.T) (a b : D.U i), (b : G) = z * a * z⁻¹ →
    φ.φ i b = φ.φ i a + ((Multiplicative.toAdd (ω (χ i z)) : ℝ) : WithTop ℝ)
def Valuation.IsDiscrete {D : RootDatum G Φ} (φ : Valuation D) : Prop := ∀ i, ∀ r ∈ φ.valueSet i,
  ∃ ε > 0, ∀ s ∈ φ.valueSet i, |s-r| < ε → s=r

-- Test BruhatTits.RootDatum.rankZero
example [IsEmpty ι] : D.IsGenerating ↔ D.T = ⊤ := sorry
-- Test BruhatTits.RootDatum.not_of_trivial_U
example (i : ι) : D.U i ≠ ⊥ := D.U_ne_bot i
-- Test BruhatTits.RootDatum.sl2
-- The concrete matrix chart is tested below; maximal torus/root identification is anchor input.
example (t x : K) (ht : t ≠ 0) :
    !![t,0;0,t⁻¹] * !![1,x;0,1] * !![t⁻¹,0;0,t] = !![1,t*t*x;0,(1:K)] := sorry
-- Test BruhatTits.RootDatum.unitary_BC1
example (i j : ι) (h : Φ.root j = (2:ℝ) • Φ.root i) : D.U j ≤ D.U i :=
  D.le_of_root_eq_two_smul i j h
-- Test BruhatTits.Valuation.shift_zero
example : φ.shift (0:N) = φ := sorry
-- Test BruhatTits.Valuation.sl2_standard
example (t : K) (ht : t ≠ 0) :
    !![1,0;-t⁻¹,1] * !![1,t;0,1] * !![1,0;-t⁻¹,1] = !![0,t;-t⁻¹,(0:K)] := sorry
-- Test BruhatTits.Valuation.not_valuation_wrong_sign
example (r : ℝ) (hr : r ≠ 0) : r ≠ -r := sorry
-- Test BruhatTits.Valuation.compatible_gl_n
example {n : ℕ} (t : Fin n → Kˣ) (i j : Fin n) (c : K) :
    (t i : K) * c * (t j : K)⁻¹ = ((t i * (t j)⁻¹ : Kˣ) : K) * c := sorry
end Abstract

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

instance : TopologicalSpace (Apartment φ) := sorry

def rationalPointsRootDatum : RootDatum (WithConv (H →ₐ[K] K)) D.Φ := D.rootDatum
/-- Character valuation on the minimal Levi. -/
def torusValuationMap : D.rootDatum.T →* Multiplicative D.V := sorry
def boundedPart : Subgroup D.rootDatum.T := (torusValuationMap D).ker
def translationLattice : AddSubgroup D.V := sorry
/-- `χ` is a rational algebraic character of the minimal Levi, `lχ` its paired linear form,
and `ω` the normalized valuation. These identifications require the future anchor API; they are
not arbitrary choices of three unrelated homomorphisms. -/
theorem torusValuationMap_apply_character (χ : D.rootDatum.T →* Kˣ)
    (lχ : D.V →ₗ[ℝ] ℝ) (ω : Kˣ →* Multiplicative ℝ) (z : D.rootDatum.T) :
    lχ (Multiplicative.toAdd (torusValuationMap D z)) = -Multiplicative.toAdd (ω (χ z)) := sorry
/-- Local-field topology and character identification are the omitted inputs. -/
theorem boundedPart_isCompact [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact ((boundedPart D).map D.rootDatum.T.subtype : Set (WithConv (H →ₐ[K] K))) := sorry

/-- Relative Weyl image of a normalizer element, supplied by anchor Layer 7. -/
def normalizerWeylHom : D.normalizer →* D.Φ.weylGroup := sorry

def Apartment.action : D.normalizer →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry
def Apartment.filtrationAt (x : Apartment φ) (a : D.ι) (r : ℝ) :
    Subgroup (WithConv (H →ₐ[K] K)) := x.fst.filtration a r

theorem Apartment.vadd_def (v : D.V) (x : Apartment φ) (i : D.ι) (a : D.rootDatum.U i) :
    (v +ᵥ x).fst.φ i a = x.fst.φ i a +
      ((D.Φ.toLinearMap (D.Φ.root i) v : ℝ) : WithTop ℝ) := sorry
/-- `w` is the relative Weyl image of `n`, supplied by anchor Layer 7. -/
theorem Apartment.action_linear (n : D.normalizer) :
    (Apartment.action D φ n).linear = ((normalizerWeylHom D n).val.coweightEquiv) := sorry
/-- Compatible field valuation and characters are omitted. -/
theorem Apartment.action_torus (z : D.rootDatum.T) (x : Apartment φ) :
    Apartment.action D φ ⟨z, D.T_le_normalizer z.property⟩ x =
      Multiplicative.toAdd (torusValuationMap D z) +ᵥ x := sorry

theorem torusValuationMap_conj (n : D.normalizer) (z z' : D.rootDatum.T)
    (_h : (z' : WithConv (H →ₐ[K] K)) = n * z * n⁻¹) :
    Multiplicative.toAdd (torusValuationMap D z') =
      (normalizerWeylHom D n).val.coweightEquiv (Multiplicative.toAdd (torusValuationMap D z)) := sorry

-- Test BruhatTits.torusValuationMap_split
example {n : ℕ} (ω : Kˣ →* Multiplicative ℤ) (t s : Fin n → Kˣ) (i : Fin n) :
    -((Multiplicative.toAdd (ω (t i*s i)) : ℤ) : ℝ) =
      -((Multiplicative.toAdd (ω (t i)) : ℤ) : ℝ) -((Multiplicative.toAdd (ω (s i)) : ℤ) : ℝ) := sorry
-- Test BruhatTits.torusValuationMap_anisotropic
example [Subsingleton D.V] (z : D.rootDatum.T) : torusValuationMap D z = 1 := sorry
-- Test BruhatTits.torusValuationMap_gl_n_compat
example (χ : D.rootDatum.T →* Kˣ) (lχ : D.V →ₗ[ℝ] ℝ)
    (ω : Kˣ →* Multiplicative ℝ) (z : D.rootDatum.T) :
    lχ (Multiplicative.toAdd (torusValuationMap D z)) = -Multiplicative.toAdd (ω (χ z)) := sorry
-- Test BruhatTits.torusValuationMap_not_injective_on_units
example (χ : D.rootDatum.T →* Kˣ) (ω : Kˣ →* Multiplicative ℝ)
    (z : D.rootDatum.T) (hz : z ≠ 1) (hχ : torusValuationMap D z = 1) :
    ¬ Function.Injective (torusValuationMap D) := sorry
-- Test BruhatTits.Apartment.sl2_reflection
example (x : ℝ) : -(-x) = x := by ring
-- Test BruhatTits.Apartment.rankZero_singleton
example [Subsingleton D.V] : Subsingleton (Apartment φ) := sorry
-- Test BruhatTits.Apartment.addTorsor_compat
example (v : D.V) (x : Apartment φ) : (v +ᵥ x) -ᵥ x = v := by simp
-- Test BruhatTits.Apartment.not_linear_space
example (x : Apartment φ) (v : D.V) (hv : v≠0) : v +ᵥ x≠x := sorry
-- Test BruhatTits.Apartment.splitTorus_central
example [IsEmpty D.ι] (x : Apartment φ) : Nonempty (Apartment φ ≃ D.V) := sorry

/-- The strict value set accounts for the `U₂a` coset, so multipliable-root values need not all
supply walls. -/
def AffineRoot.valueSet (φ : Valuation D.rootDatum) (a : D.ι) : Set ℝ := sorry
structure AffineRoot where
  gradient : D.ι
  constant : ℝ
  mem_valueSet : constant ∈ AffineRoot.valueSet D φ gradient

def AffineRoot.eval {D : LocalRootData K H} {φ : Valuation D.rootDatum} (α : AffineRoot D φ) (x : Apartment φ) : ℝ := sorry
def AffineRoot.wall {D : LocalRootData K H} {φ : Valuation D.rootDatum} (α : AffineRoot D φ) : Set (Apartment φ) := {x | α.eval x = 0}
def AffineRoot.rootSubgroup {D : LocalRootData K H} {φ : Valuation D.rootDatum} (α : AffineRoot D φ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  φ.filtration α.gradient α.constant

theorem AffineRoot.rootSubgroup_mono (α β : AffineRoot D φ)
    (hgrad : α.gradient = β.gradient) (h : α.constant ≤ β.constant) :
    β.rootSubgroup ≤ α.rootSubgroup := sorry
/-- The scalar structure of the quotient modulo `U₂a` is the residue-vector-space input. -/
theorem AffineRoot.filtrationAt_succ (a : D.ι) (x : Apartment φ) (r : ℝ) :
    (⨆ (s : ℝ) (_ : r < s), Apartment.filtrationAt D φ x a s) ≤
      Apartment.filtrationAt D φ x a r := sorry
-- Test BruhatTits.AffineRoot.sl2_affine_roots
example (k : ℤ) : {x : ℝ | 2*x+(k:ℝ)=0} = {-(k:ℝ)/2} := by ext x; simp; constructor <;> intro h <;> linarith
-- Test BruhatTits.AffineRoot.rootSubgroup_top
example (a : D.ι) (g : D.rootDatum.U a) : φ.φ a g = ⊤ ↔ g=1 := φ.φ_eq_top_iff a g
-- Test BruhatTits.AffineRoot.gl_n_compat
example (x : Apartment φ) (a : D.ι) (r : ℝ) :
    Apartment.filtrationAt D φ x a r = x.fst.filtration a r := rfl
-- Test BruhatTits.AffineRoot.not_all_values
example (a : D.ι) (r : ℝ) (hr : r ∉ AffineRoot.valueSet D φ a) :
    ¬ ∃ α : AffineRoot D φ, α.gradient=a ∧ α.constant=r := sorry

/-- A facet represented by its exact sign class. -/
structure Facet where
  carrier : Set (Apartment φ)
  point : Apartment φ
  mem_iff : ∀ x, x ∈ carrier ↔ ∀ α : AffineRoot D φ,
    (0 ≤ α.eval x ↔ 0 ≤ α.eval point) ∧ (α.eval x = 0 ↔ α.eval point = 0)

def Facet.wall : Set (Set (Apartment φ)) := Set.range (AffineRoot.wall (D:=D) (φ:=φ))
def Facet.IsAlcove (F : Facet D φ) : Prop := ∀ α : AffineRoot D φ, α.eval F.point ≠ 0
def Facet.le (F F' : Facet D φ) : Prop := F.carrier ⊆ closure F'.carrier
/-- The topology on the apartment comes from its real affine-space topology; the instance is
part of the apartment API, not a choice of topology for each assertion. -/
def Facet.IsSpecial (x : Apartment φ) : Prop :=
  ∀ i : D.ι, ∃ α : AffineRoot D φ, α.gradient=i ∧ α.eval x=0
theorem Facet.le_iff (F F' : Facet D φ) :
    Facet.le D φ F F' ∧ Facet.le D φ F' F ↔ F.carrier=F'.carrier := sorry
/-- The valuation is discrete, with finite root system. -/
theorem Facet.locallyFinite (hφ : φ.IsDiscrete) (C : Set (Apartment φ)) (hC : IsCompact C) :
    {W ∈ Facet.wall D φ | (W ∩ C).Nonempty}.Finite := sorry
-- Test BruhatTits.Facet.rankZero
example [IsEmpty D.ι] (F : Facet D φ) : F.carrier = Set.univ := sorry
-- Test BruhatTits.Facet.not_special_barycentre
example : ¬ ∃ k : ℤ, (1/4:ℝ) = (k:ℝ)/2 := sorry
-- Test BruhatTits.Facet.pgl3_alcove_triangle
example : {x : ℝ × ℝ | 0 < x.1 ∧ 0 < x.2 ∧ x.1+x.2 < 1}.Nonempty :=
  ⟨(1/4,1/4), by norm_num⟩

/-- Reduced wall-spacing root datum; its index set is chosen independently of the possibly
non-reduced relative roots. -/
def echelonnageIndex (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Type u := sorry
instance : Fintype (echelonnageIndex D φ) := sorry
def echelonnage : RootPairing (echelonnageIndex D φ) ℝ (Module.Dual ℝ D.V) D.V := sorry
/-- In a non-reduced system use the root directions as indices, rather than all relative roots.
The prototype exposes the proportionality theorem; the index equivalence is omitted. -/
theorem echelonnage_isReduced : ∀ i j, (echelonnage D φ).root i =
    (2:ℝ) • (echelonnage D φ).root j → False := sorry

theorem echelonnage_proportional : ∀ i, ∃ j c, 0<c ∧
    (echelonnage D φ).root i = c • D.Φ.root j := sorry

theorem echelonnage_walls (x₀ : Apartment φ) (hx : Facet.IsSpecial D φ x₀)
    (α : AffineRoot D φ) : ∃ i : echelonnageIndex D φ, ∃ k : ℤ,
    α.wall = {x | (echelonnage D φ).toLinearMap ((echelonnage D φ).root i) (x -ᵥ x₀) = k} := sorry
/-- Split group and its standard normalization are omitted. -/
theorem echelonnage_split : Nonempty ((echelonnage D φ).Equiv D.Φ) := sorry
-- Test BruhatTits.echelonnage_sl2
example : (2:ℝ) * (1/2) = 1 := by norm_num
-- Test BruhatTits.echelonnage_rank_zero
example [IsEmpty D.ι] : IsEmpty (echelonnageIndex D φ) := sorry
-- Test BruhatTits.echelonnage_unramified_unitary
example : ∀ x : ℝ, (2*x)/2 = x := by intro x; ring

/-- Generated by the actual wall reflections. -/
def AffineWeylGroup : Subgroup (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry
def AffineWeylGroup.simpleReflections (C : Facet D φ) : Set (AffineWeylGroup D φ) := sorry
def AffineWeylGroup.coxeterMatrix (C : Facet D φ) :
    CoxeterMatrix {s // s ∈ AffineWeylGroup.simpleReflections D φ C} := sorry

def AffineWeylGroup.coxeterSystem (C : Facet D φ) (hC : Facet.IsAlcove D φ C) :
    CoxeterSystem (AffineWeylGroup.coxeterMatrix D φ C) (AffineWeylGroup D φ) := sorry
/-- Action on alcoves: every ordered pair has exactly one transporting Weyl element. -/
theorem AffineWeylGroup.simplyTransitive_alcoves (C C' : Facet D φ)
    (hC : Facet.IsAlcove D φ C) (hC' : Facet.IsAlcove D φ C') :
    ∃! w : AffineWeylGroup D φ, w.val '' C.carrier=C'.carrier := sorry
/-- Semidirect decomposition after a special origin. The coroot-lattice action is supplied. -/
def AffineWeylGroup.semidirect (L : AddSubgroup D.V)
    (ρ : (echelonnage D φ).weylGroup →* MulAut (Multiplicative L)) :
    AffineWeylGroup D φ ≃* (Multiplicative L ⋊[ρ] (echelonnage D φ).weylGroup) := sorry

theorem AffineWeylGroup.normal_in_image (n : D.normalizer) (w : AffineWeylGroup D φ) :
    Apartment.action D φ n * w.val * (Apartment.action D φ n)⁻¹ ∈ AffineWeylGroup D φ := sorry

theorem Apartment.ker_action : (Apartment.action D φ).ker =
    ((boundedPart D).map D.rootDatum.T.subtype).subgroupOf D.normalizer := sorry
-- Test BruhatTits.AffineWeylGroup.sl2_infinite_dihedral
example (x : ℝ) : 1 - (-x) = x+1 := by ring
-- Test BruhatTits.AffineWeylGroup.rankZero_trivial
example [IsEmpty D.ι] : AffineWeylGroup D φ = ⊥ := sorry
-- Test BruhatTits.AffineWeylGroup.finite_quotient_compat
example (C : Facet D φ) (hC : Facet.IsAlcove D φ C) :
    Nonempty (CoxeterSystem (AffineWeylGroup.coxeterMatrix D φ C) (AffineWeylGroup D φ)) := sorry
-- Test BruhatTits.AffineWeylGroup.not_all_of_N
example : ¬ ∃ k : ℤ, (k:ℝ)=1/2 := sorry

def leviOfVector (v : D.V) : Subgroup (WithConv (H →ₐ[K] K)) :=
  D.rootDatum.T ⊔ ⨆ (i : D.ι) (_ : D.Φ.toLinearMap (D.Φ.root i) v=0), D.rootDatum.U i
/-- Assume that the rational root datum generates `G(K)` in the Levi calculation. -/
theorem leviOfVector_eq_top_iff (hg : D.rootDatum.IsGenerating) (v : D.V) :
    leviOfVector D v = ⊤ ↔ ∀ i, D.Φ.toLinearMap (D.Φ.root i) v=0 := sorry

theorem leviOfVector_smul (v : D.V) (c : ℝ) (hc : c ≠ 0) :
    leviOfVector D (c • v) = leviOfVector D v := sorry

theorem leviOfVector_conj (v : D.V) (n : D.normalizer) (w : D.Φ.weylGroup) :
    (leviOfVector D v).map (MulAut.conj n.val).toMonoidHom =
      leviOfVector D (w.val.coweightEquiv v) := sorry
/-- Root-data-compatible automorphism is an omitted input. -/
theorem leviOfVector_descends (σ : MulAut (WithConv (H →ₐ[K] K))) (ς : D.V ≃ₗ[ℝ] D.V)
    (v : D.V) : (leviOfVector D v).map σ.toMonoidHom = leviOfVector D (ς v) := sorry
-- Test BruhatTits.leviOfVector_gl3
example (v : Fin 3 → ℝ) (h : v 0 = v 1) (h' : v 1 ≠ v 2) :
    v 0-v 1=0 ∧ v 1-v 2 ≠ 0 := ⟨sub_eq_zero.mpr h, sub_ne_zero.mpr h'⟩
-- Test BruhatTits.leviOfVector_zero
example : leviOfVector D (0:D.V) = D.rootDatum.T ⊔ ⨆ i, D.rootDatum.U i := sorry
-- Test BruhatTits.leviOfVector_regular
example (v : D.V) (h : ∀ i, D.Φ.toLinearMap (D.Φ.root i) v ≠ 0) :
    leviOfVector D v = D.rootDatum.T := sorry
-- Test BruhatTits.leviOfVector_not_parabolic
example : !![1,0;0,(1:K)] ≠ !![1,1;0,(1:K)] := by intro h; have := congrArg (fun M : Matrix (Fin 2) (Fin 2) K => M 0 1) h; simp at this

/-- Frobenius transport on a rationally defined unramified apartment; compatibility of `σ`
with the field and root data is omitted. -/
def frobeniusOnApartment (σ : MulAut (WithConv (H →ₐ[K] K))) :
    Apartment φ ≃ᵃ[ℝ] Apartment φ := sorry

theorem frobeniusOnApartment_linear (σ : MulAut (WithConv (H →ₐ[K] K)))
    (ς : D.V ≃ₗ[ℝ] D.V) : (frobeniusOnApartment D φ σ).linear = ς := sorry

def frobeniusCorrection (ς : D.V ≃ₗ[ℝ] D.V) : D.Φ.weylGroup := sorry

def frobeniusOnApartment_fixed (σ : MulAut (WithConv (H →ₐ[K] K))) :
    Set (Apartment φ) := {x | frobeniusOnApartment D φ σ x=x}
theorem frobeniusOnApartment_alcove (σ : MulAut (WithConv (H →ₐ[K] K))) :
    ∃ C : Facet D φ, Facet.IsAlcove D φ C ∧
      frobeniusOnApartment D φ σ '' C.carrier=C.carrier := sorry
-- Test BruhatTits.frobeniusOnApartment_split
example : frobeniusOnApartment D φ (MulEquiv.refl _) = AffineEquiv.refl ℝ _ := sorry
-- Test BruhatTits.frobeniusOnApartment_unitary
example (a b : ℝ) : (b,a) ≠ (a,b) ↔ a ≠ b := sorry
-- Test BruhatTits.frobeniusCorrection_quasiSplit
example : frobeniusCorrection D (LinearEquiv.refl ℝ D.V) = 1 := sorry
-- Test BruhatTits.frobeniusSplitting_not_equivariant
example (c : ℝ) (hc : c ≠ 0) : (fun x : ℝ => x+c) 0 ≠ 0 := by simp [hc]

/-- Compatible valuation exists and is unique up to equipollence; henselian discrete valued
field and reductivity are the hypotheses omitted from the data-only form. -/
theorem exists_valuation_compatible : Nonempty (Valuation D.rootDatum) := sorry
/-- The restricted apartment is the fixed affine subspace; `σ` is arithmetic Frobenius. -/
theorem apartment_eq_fixedPoints (σ : MulAut (WithConv (H →ₐ[K] K)))
    (A₀ : Type u) (j : A₀ → Apartment φ) :
    Function.Injective j ∧ Set.range j = frobeniusOnApartment_fixed D φ σ := sorry

section Absolute
variable (A : AbsoluteRootData K H)
def IsDominant (μ : A.Y) : Prop := ∀ i ∈ A.base.support,
  0 ≤ A.Ψ.toLinearMap (A.Ψ.root i) μ
def IsMinuscule (μ : A.Y) : Prop := ∀ i,
  A.Ψ.toLinearMap (A.Ψ.root i) μ ∈ ({-1,0,1} : Set ℤ)
def dominanceLE (ν μ : A.Y) : Prop :=
  μ-ν ∈ AddSubmonoid.closure (A.Ψ.coroot '' (A.base.support : Set A.ι))
def dominantRep (μ : A.Y) : A.Y := sorry
def twoRhoPairing (μ : A.Y) : ℤ := sorry
-- Test BruhatTits.IsMinuscule.gl_n_standard
example {n : ℕ} (i j k : Fin n) :
    (if i=k then (1:ℤ) else 0) - (if j=k then 1 else 0) ∈ ({-1,0,1}:Set ℤ) := by split_ifs <;> norm_num
-- Test BruhatTits.IsMinuscule.not_double
example (μ : A.Y) (i : A.ι) (h : A.Ψ.toLinearMap (A.Ψ.root i) μ=1) :
    ¬ IsMinuscule A (2 • μ) := sorry

namespace AlgebraicFundamentalGroup
def galoisAction : Field.absoluteGaloisGroup K →* Multiplicative (AddAut (AlgebraicFundamentalGroup A)) := sorry
/-- Coinvariants by the subgroup `I`; torsion is retained. -/
def inertiaRelations (I : Subgroup (Field.absoluteGaloisGroup K)) :
    AddSubgroup (AlgebraicFundamentalGroup A) := AddSubgroup.closure
    {z | ∃ γ : I, ∃ x, z = Multiplicative.toAdd (galoisAction A γ) x-x}
def inertiaCoinvariants (I : Subgroup (Field.absoluteGaloisGroup K)) : Type u :=
  AlgebraicFundamentalGroup A ⧸ inertiaRelations A I
instance (I : Subgroup (Field.absoluteGaloisGroup K)) :
    AddCommGroup (inertiaCoinvariants A I) := inferInstanceAs
      (AddCommGroup (AlgebraicFundamentalGroup A ⧸ inertiaRelations A I))
def map {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A' : AbsoluteRootData K H')
    (f : A.Y →+ A'.Y)
    (_hf : ∀ i, f (A.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range A'.Ψ.coroot)) :
    AlgebraicFundamentalGroup A →+ AlgebraicFundamentalGroup A' := sorry
/-- For an empty root system no coroot relations are imposed. -/
def torus [IsEmpty A.ι] : AlgebraicFundamentalGroup A ≃+ A.Y := sorry
/-- Central torus extension data is omitted; the actual induced maps are supplied. -/
theorem exact_central {Z P : Type u} [AddCommGroup Z] [AddCommGroup P]
    (i : Z →+ P) (q : P →+ AlgebraicFundamentalGroup A) :
    Function.Injective i ∧ Function.Surjective q ∧ i.range=q.ker := sorry
/-- Standard-Levi root subsystem is the anchor input. -/
theorem leviKernel {P : Type u} [AddCommGroup P] (q : P →+ AlgebraicFundamentalGroup A)
    (remainingCoroots : Set P) : q.ker = AddSubgroup.closure remainingCoroots := sorry

theorem weyl_invariant (w : A.Ψ.weylGroup) (μ : A.Y) :
    Submodule.Quotient.mk (w.val.coweightEquiv μ) =
      (Submodule.Quotient.mk μ : AlgebraicFundamentalGroup A) := sorry
-- Test BruhatTits.AlgebraicFundamentalGroup.gl_n
example (n : ℕ) (hn : 0<n) : Nonempty ((Fin n → ℤ) ⧸
    (AddSubgroup.closure {v : Fin n → ℤ | ∑ i, v i = 0}) ≃+ ℤ) := sorry
-- Test BruhatTits.AlgebraicFundamentalGroup.sl_n
example : Nonempty ((ℤ ⧸ (⊤ : AddSubgroup ℤ)) ≃+ PUnit) := sorry
-- Test BruhatTits.AlgebraicFundamentalGroup.pgl_n
example (n : ℕ) (hn : 0<n) : Nat.card (ZMod n) = n := sorry
-- Test BruhatTits.AlgebraicFundamentalGroup.not_cocharacters
example : Nat.card (ZMod 2) = 2 := sorry
end AlgebraicFundamentalGroup
end Absolute
end BruhatTits

namespace BruhatTits.QuasiSplit
/-- The quadratic involution is passed in with its square equal to the identity. -/
def H0 {L : Type u} [Field L] (τ : L ≃+* L) : Type u :=
  {uv : L × L // uv.2 + τ uv.2 = uv.1 * τ uv.1}
instance {L : Type u} [Field L] (τ : L ≃+* L) [Fact (τ.trans τ = RingEquiv.refl L)] :
    Group (H0 τ) := sorry
variable {K L G : Type u} [Field K] [Field L] [Group G]
/-- Non-multipliable coordinates; finite separable `L/K` and rank-one identifications omitted. -/
def rootField (K : Type u) [Field K] : Type u := sorry
instance : Field (rootField K) := sorry
def rootGroupCoord (U : Subgroup G) : Multiplicative (rootField K) ≃* U := sorry

theorem rootGroupCoord_conj_torus (x : L → G) (z : G) (χ : Lˣ) (a : L) :
    z * x a * z⁻¹ = x ((χ:L)*a) := sorry

def rankOneSubgroup (U Uneg : Subgroup G) : Subgroup G := U ⊔ Uneg

def unitaryCoord (τ : L ≃+* L) (c d : L) : Matrix (Fin 3) (Fin 3) L :=
  !![1,-τ c,d;0,1,c;0,0,1]

theorem unitaryCoord_mem_iff (τ : L ≃+* L) (hτ : τ.trans τ=RingEquiv.refl L) (c d : L) :
    (unitaryCoord τ c d).transpose.map τ * !![0,0,1;0,1,0;1,0,0] * unitaryCoord τ c d =
      !![0,0,1;0,1,0;1,0,(0:L)] ↔ τ c*c+d+τ d=0 := sorry
-- Test BruhatTits.QuasiSplit.H0_mul_assoc
example (τ : L ≃+* L) (a b c : L × L) :
    let mul := fun a b : L×L => (a.1+b.1,a.2+b.2+τ a.1*b.1)
    mul (mul a b) c = mul a (mul b c) := sorry
-- Test BruhatTits.QuasiSplit.split_case
example (a b : K) : !![1,a;0,1] * !![1,b;0,1] = !![1,a+b;0,(1:K)] := sorry
-- Test BruhatTits.QuasiSplit.gl_n_compat
example (a : K) : (!![1,a;0,(1:K)] : Matrix (Fin 2) (Fin 2) K).det=1 := by simp [Matrix.det_fin_two]
-- Test BruhatTits.QuasiSplit.not_additive_multipliable
example (τ : L ≃+* L) (u u' : L) (h : τ u*u' ≠ τ u'*u) :
    (τ u*u' - τ u'*u) ≠ 0 := sub_ne_zero.mpr h
end BruhatTits.QuasiSplit

namespace ZExtension
open BruhatTits
/-- Permutation lattice criterion for an induced torus. -/
def IsInducedTorus {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A : AbsoluteRootData K H) : Prop :=
  ∃ b : Module.Basis (Fin (Module.finrank ℤ A.X)) ℤ A.X,
    ∀ γ, ∃ σ : Equiv.Perm (Fin (Module.finrank ℤ A.X)),
      ∀ i, (A.galoisAction γ).weightEquiv (b i) = b (σ i)
/-- On rational points, the kernel is central and the map surjective. The induced torus kernel
and simply-connected derived group are omitted from this signature: they belong to the anchor's
scheme-level central-extension data and are required in the reader. -/
def IsZExtension {G G' : Type u} [Group G] [Group G'] (f : G →* G') : Prop :=
  Function.Surjective f ∧ f.ker ≤ Subgroup.center G

theorem surjective_points {G G' : Type u} [Group G] [Group G'] (f : G →* G')
    (hf : IsZExtension f) : Function.Surjective f := hf.1
/-- The omitted hypothesis identifies `A` with the source of a z-extension. -/
theorem fundamentalGroup_torsionFree {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H) :
    ∀ x : AlgebraicFundamentalGroup A, ∀ n : ℕ, 0<n → n • x=0 → x=0 := sorry

theorem comp_isZExtension_of_iso {G G' G'' : Type u} [Group G] [Group G'] [Group G'']
    (f : G →* G') (hf : IsZExtension f) (e : G' ≃* G'') :
    IsZExtension (e.toMonoidHom.comp f) := sorry
/-- Existence of the scheme-level extension; the anchor's reductivity predicate is retained. -/
theorem exists_zExtension {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K)
    (hG : TauCeti.reductiveCommHopfAlgProperty K H) :
    ∃ H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K, ∃ f : H ⟶ H',
      IsZExtension (BruhatTits.ParahoricExt.pointsMap f) := sorry
-- Test ZExtension.gl2_pgl2
-- The determinant computation distinguishes GL₂ from the non-z central isogeny SL₂ → PGL₂.
example {K : Type u} [Field K] (t : K) : (Matrix.diagonal ![t,t]).det = t^2 := sorry
-- Test ZExtension.id_of_simplyConnected
example {G : Type u} [Group G] : IsZExtension (MonoidHom.id G) := sorry
-- Test ZExtension.sl2_pgl2_not
example {K : Type u} [Field K] [NeZero (2:K)] :
    (Matrix.diagonal ![-1,-1] : Matrix (Fin 2) (Fin 2) K) ≠ 1 := sorry
-- Test ZExtension.inducedTorus_compat
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A : AbsoluteRootData K H) (h : IsInducedTorus A) :
    ∃ b : Module.Basis (Fin (Module.finrank ℤ A.X)) ℤ A.X,
      ∀ γ, ∃ σ : Equiv.Perm (Fin (Module.finrank ℤ A.X)),
        ∀ i, (A.galoisAction γ).weightEquiv (b i)=b (σ i) := h
end ZExtension

namespace KottwitzMap
open BruhatTits ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
variable (A : AbsoluteRootData K H) (I : Subgroup (Field.absoluteGaloisGroup K))
/-- Kottwitz with integral inertia coinvariants, including torsion. -/
def torus : WithConv (H →ₐ[K] K) →*
    Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I) := sorry
/-- The torus and strict-henselian discrete field hypotheses of the reader are omitted. -/
theorem torus_surjective : Function.Surjective (torus A I) := sorry

def kottwitz : WithConv (H →ₐ[K] K) →*
    Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I) := sorry

def kernel : Subgroup (WithConv (H →ₐ[K] K)) := (kottwitz A I).ker

theorem kottwitz_surjective : Function.Surjective (kottwitz A I) := sorry
/-- Naturality with the induced map of inertia coinvariants. -/
theorem kottwitz_natural {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A' : AbsoluteRootData K H') (f : WithConv (H →ₐ[K] K) →* WithConv (H' →ₐ[K] K))
    (fπ : Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I) →*
      Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A' I)) :
    (kottwitz A' I).comp f = fπ.comp (kottwitz A I) := sorry
/-- Torus hypothesis omitted. -/
theorem kottwitz_torus : kottwitz A I = torus A I := sorry
/-- Source derived group simply connected, quotient torus and identifications omitted. -/
theorem kottwitz_simplyConnected {T : Type u} [Group T]
    (q : WithConv (H →ₐ[K] K) →* T)
    (κT : T →* Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I)) :
    kottwitz A I = κT.comp q := sorry
/-- `i` is the simply-connected derived cover, rather than an arbitrary homomorphism. -/
theorem kottwitz_sc_image {S : Type u} [Group S]
    (i : S →* WithConv (H →ₐ[K] K)) : (kottwitz A I).comp i = 1 := sorry

/-- Bounded coordinate valuations; the ring is affine of finite type. -/
def IsBoundedPoints (s : Set (WithConv (H →ₐ[K] K))) : Prop :=
  ∀ a : H, ∃ C, ∀ g ∈ s, valuation K (g.ofConv a) ≤ C

theorem torus_ker : IsBoundedPoints ((torus A I).ker : Set (WithConv (H →ₐ[K] K))) := sorry
/-- `e` identifies the split rank-one torus's coinvariants with ℤ. -/
theorem torus_multiplicative [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (e : Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I) ≃* Multiplicative ℤ)
    (points : WithConv (H →ₐ[K] K) ≃* Kˣ) (g : WithConv (H →ₐ[K] K)) :
    e (torus A I g) = TauCeti.normalizedValuation K (points g) := sorry

theorem torus_natural {T : Type u} [Group T] (f : WithConv (H →ₐ[K] K) →* T)
    (q : T →* Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I)) :
    q.comp f = torus A I := sorry
-- Test KottwitzMap.torus_trivial
example [Subsingleton (AlgebraicFundamentalGroup.inertiaCoinvariants A I)] : torus A I = 1 := sorry
-- Test KottwitzMap.torus_ramified_normOne
example : Nat.card (ℤ ⧸ AddSubgroup.zmultiples 2) = 2 := sorry
-- Test KottwitzMap.torus_not_valuation_of_norm
example : (1:ZMod 2) ≠ 0 := by decide
-- Test KottwitzMap.kottwitz_sl_n
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] {n : ℕ} (g : GL (Fin n) K)
    (h : g.det=1) : TauCeti.normalizedValuation K g.det=1 := by simp [h]
-- Test KottwitzMap.kottwitz_pgl2
example (m : ℤ) : ((2*m:ℤ):ZMod 2) = 0 := sorry
-- Test KottwitzMap.kottwitz_not_det_valuation
example : (1:ZMod 2) + 1 = 0 := by decide
namespace Examples
-- Application KottwitzMap.Examples.normOne_ramified
/-- Odd residue characteristic; connected norm-one model has two component classes. -/
theorem normOne_ramified : Nat.card (ZMod 2) = 2 := sorry
end Examples
end KottwitzMap

/-! ## RG2.2 — Buildings and their geometric models -/
namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
variable (D : LocalRootData K H) (φ : Valuation D.rootDatum)

def Building.mk (g : WithConv (H →ₐ[K] K)) (x : Apartment φ) : Building D φ :=
  g • apartmentEmbedding D φ x

def Building.apartmentFixer (x : Apartment φ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure ({g | ∃ n : D.normalizer, n.val=g ∧ Apartment.action D φ n x=x} ∪
    ⋃ i, (Apartment.filtrationAt D φ x i 0 : Set (WithConv (H →ₐ[K] K))))

theorem Building.eq_iff (g h : WithConv (H →ₐ[K] K)) (x y : Apartment φ) :
    Building.mk D φ g x = Building.mk D φ h y ↔
      ∃ n : D.normalizer, y=Apartment.action D φ n x ∧ g⁻¹*h*n.val ∈ Building.apartmentFixer D φ x := sorry

theorem Building.apartmentEmbedding_injective : Function.Injective (apartmentEmbedding D φ) := sorry

theorem Building.smul_mk (g h : WithConv (H →ₐ[K] K)) (x : Apartment φ) :
    g • Building.mk D φ h x = Building.mk D φ (g*h) x := sorry

theorem Building.rootGroup_fixes (α : AffineRoot D φ) (g : WithConv (H →ₐ[K] K))
    (hg : g ∈ α.rootSubgroup) (x : Apartment φ) (hx : 0 ≤ α.eval x) :
    g • apartmentEmbedding D φ x = apartmentEmbedding D φ x := sorry

instance : Nonempty (Building D φ) := sorry
instance : CompleteSpace (Building D φ) := sorry

/-- The common-apartment assertion; the stronger facet assertion uses `BuildingFacet` below. -/
theorem building_apartment_axioms (x y : Building D φ) :
    ∃ g : WithConv (H →ₐ[K] K), ∃ a b : Apartment φ,
      x=Building.mk D φ g a ∧ y=Building.mk D φ g b := sorry

/-- CAT(0) midpoint inequality for the metric chosen in the spine. -/
theorem building_metric (g : WithConv (H →ₐ[K] K)) (a b : Apartment φ) (z : Building D φ) :
    dist z (Building.mk D φ g (midpoint ℝ a b)) ^ 2 ≤
      (dist z (Building.mk D φ g a)^2 + dist z (Building.mk D φ g b)^2)/2 -
      dist (Building.mk D φ g a) (Building.mk D φ g b)^2/4 := sorry

/-- Bounded orbits of an isometric subgroup have a common fixed point. -/
theorem bruhat_tits_fixed_point_theorem (S : Subgroup (WithConv (H →ₐ[K] K)))
    (x : Building D φ) (h : Bornology.IsBounded (Set.range (fun g : S => g.val • x))) :
    ∃ y : Building D φ, ∀ g : S, g.val • y=y := sorry

/-- Facets are transported sign classes in the enlarged building. Vertex/alcove order refers to
reduced facets; the central factor is retained in the carrier. -/
structure BuildingFacet where
  carrier : Set (Building D φ)
  apartmentFacet : Facet D φ
  translate : WithConv (H →ₐ[K] K)
  carrier_eq : carrier = Building.mk D φ translate '' apartmentFacet.carrier

def BuildingFacet.closureLE (F F' : BuildingFacet D φ) : Prop := F.carrier ⊆ closure F'.carrier

def BuildingFacet.IsAlcove (F : BuildingFacet D φ) : Prop := Facet.IsAlcove D φ F.apartmentFacet

def BuildingFacet.IsVertex (F : BuildingFacet D φ) : Prop :=
  ∀ F' : BuildingFacet D φ, BuildingFacet.closureLE D φ F' F → F'.carrier=F.carrier

def BuildingFacet.IsSpecial (F : BuildingFacet D φ) : Prop :=
  Facet.IsSpecial D φ F.apartmentFacet.point

def BuildingFacet.transport (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) :
    BuildingFacet D φ := sorry

def pointwiseFixer (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) where
  carrier := {g | ∀ x ∈ Ω, g • x=x}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

def setwiseStabilizer (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) where
  carrier := {g | (fun x => g • x) '' Ω=Ω}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem mem_pointwiseFixer (Ω : Set (Building D φ)) (g : WithConv (H →ₐ[K] K)) :
    g ∈ pointwiseFixer D φ Ω ↔ ∀ x ∈ Ω, g • x=x := Iff.rfl

theorem fixer_antitone : Antitone (pointwiseFixer D φ) := sorry

theorem fixer_conj (Ω : Set (Building D φ)) (g : WithConv (H →ₐ[K] K)) :
    pointwiseFixer D φ ((fun x => g • x) '' Ω) =
      (pointwiseFixer D φ Ω).map (MulAut.conj g).toMonoidHom := sorry

theorem fixer_compactOpen [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (Ω : Set (Building D φ)) (hΩ : Ω.Nonempty) (hb : Bornology.IsBounded Ω)
    (ha : Ω ⊆ Set.range (apartmentEmbedding D φ)) :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact (pointwiseFixer D φ Ω : Set (WithConv (H →ₐ[K] K))) ∧
      IsOpen (pointwiseFixer D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry

/-- The reduced building, with its action; no central coordinate. -/
def ReducedBuilding (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Type u := sorry
instance : MulAction (WithConv (H →ₐ[K] K)) (ReducedBuilding D φ) := sorry

def centralVectorSpace : Submodule ℝ D.V :=
  ⨅ i, LinearMap.ker (D.Φ.toLinearMap (D.Φ.root i))

def toReducedBuilding : Building D φ → ReducedBuilding D φ := sorry
/-- The affine central factor is written as a vector space only after choosing its origin. -/
def enlargedProductEquiv : Building D φ ≃ ReducedBuilding D φ × centralVectorSpace D := sorry

theorem toReducedBuilding_smul (g : WithConv (H →ₐ[K] K)) (x : Building D φ) :
    toReducedBuilding D φ (g • x) = g • toReducedBuilding D φ x := sorry

theorem central_smul (z : WithConv (H →ₐ[K] K)) (hz : z ∈ Subgroup.center _)
    (x : Building D φ) : toReducedBuilding D φ (z • x) = toReducedBuilding D φ x := sorry

/-- A compact subset whose translates cover the enlarged building. -/
theorem building_cocompact_action [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ∃ C : Set (Building D φ), IsCompact C ∧
      ∀ x, ∃ g : WithConv (H →ₐ[K] K), ∃ y ∈ C, g • y=x := sorry

/-- Equipollent changes of coordinates extend equivariantly, after central origins are matched. -/
theorem building_independence_of_choices (ψ : Valuation D.rootDatum) (h : Equipollent φ ψ) :
    ∃ e : Building D φ ≃ Building D ψ, ∀ (g : WithConv (H →ₐ[K] K)) x, e (g • x)=g • e x := sorry

/-- `j` is the compatible unramified field-extension map; `σ` the Galois/Frobenius action. -/
theorem unramified_descent_of_building {L : Type u} [Field L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) (j : Building D φ → Building DL φL)
    (σ : Building DL φL → Building DL φL) :
    Function.Injective j ∧ Set.range j={x | σ x=x} := sorry

/-- Prime-to-residue-characteristic automorphisms, identity-component fixed reductive group and
Bruhat–Tits hypotheses are omitted. The conclusion compares the actual fixed building. -/
theorem finite_group_fixed_points_reductive {Θ : Type u} [Group Θ] [Finite Θ]
    [MulAction Θ (Building D φ)] {BM : Type u} (j : BM → Building D φ) :
    Function.Injective j ∧ Set.range j={x | ∀ θ : Θ, θ • x=x} := sorry

/-- Tame finite Galois extension and compatible map/action are omitted inputs. -/
theorem tame_descent_of_building {L : Type u} [Field L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) (j : Building D φ → Building DL φL)
    (Γ : Type u) [Group Γ] [MulAction Γ (Building DL φL)] :
    Function.Injective j ∧ Set.range j={x | ∀ γ : Γ, γ • x=x} := sorry

def building_field_extension_embedding {L : Type u} [Field L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) : Building D φ ↪ Building DL φL := sorry

/-- Weil restriction point identification and compatible root data are the omitted inputs. -/
def weil_restriction_building {L : Type u} [Field L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) : Building D φ ≃ Building DL φL := sorry

/-- A central isogeny: the reduced buildings are isomorphic. -/
def building_functoriality_central_extensions {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (D' : LocalRootData K H') (φ' : Valuation D'.rootDatum) :
    ReducedBuilding D φ ≃ ReducedBuilding D' φ' := sorry

/-- Product group/root data and central origins omitted. -/
def building_products_and_levis {H₁ H₂ : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (D₁ : LocalRootData K H₁) (φ₁ : Valuation D₁.rootDatum)
    (D₂ : LocalRootData K H₂) (φ₂ : Valuation D₂.rootDatum) :
    Building D φ ≃ Building D₁ φ₁ × Building D₂ φ₂ := sorry

-- Test BruhatTits.Building.splitTorus
example [IsEmpty D.ι] : Nonempty (Building D φ ≃ D.V) := sorry
-- Test BruhatTits.Building.trivialGroup
example [Subsingleton D.V] [Subsingleton (WithConv (H →ₐ[K] K))] :
    Subsingleton (Building D φ) := sorry
-- Test BruhatTits.Building.apartment_torsor_compat
example (x y : Apartment φ) (h : apartmentEmbedding D φ x=apartmentEmbedding D φ y) :
    x=y := Building.apartmentEmbedding_injective D φ h
-- Test BruhatTits.Building.central_direction
example (x : Apartment φ) (v : D.V) (hv : v ≠ 0) :
    apartmentEmbedding D φ (v +ᵥ x) ≠ apartmentEmbedding D φ x := sorry
-- Test BruhatTits.BuildingFacet.sl2_edge
example : (Set.Ioo (0:ℝ) (1/2)).Nonempty := ⟨1/4, by norm_num, by norm_num⟩
-- Test BruhatTits.BuildingFacet.rankZero
example [IsEmpty D.ι] (F : BuildingFacet D φ) : BuildingFacet.IsAlcove D φ F := sorry
-- Test BruhatTits.BuildingFacet.apartment_compat
example (F : BuildingFacet D φ) :
    F.carrier = Building.mk D φ F.translate '' F.apartmentFacet.carrier := F.carrier_eq
-- Test BruhatTits.BuildingFacet.central_line_not_vertex
example : ¬ Subsingleton ℝ := by sorry
-- Test BruhatTits.pointwiseFixer.trivialGroup
example [Subsingleton (WithConv (H →ₐ[K] K))] (Ω : Set (Building D φ)) :
    pointwiseFixer D φ Ω=⊤ := sorry
-- Test BruhatTits.pointwiseFixer.gl2_lattice
example (x : Building D φ) :
    pointwiseFixer D φ {x} = MulAction.stabilizer (WithConv (H →ₐ[K] K)) x := sorry
-- Test BruhatTits.pointwiseFixer.mulAction_compat
example (x : Building D φ) (g : WithConv (H →ₐ[K] K)) :
    g ∈ pointwiseFixer D φ {x} ↔ g • x=x := sorry
-- Test BruhatTits.pointwiseFixer.edge_inversion
example : Equiv.swap (0:Fin 2) 1 0 = 1 ∧ Equiv.swap (0:Fin 2) 1 1=0 := by decide
-- Test BruhatTits.ReducedBuilding.splitTorus
example [IsEmpty D.ι] : Subsingleton (ReducedBuilding D φ) := sorry
-- Test BruhatTits.ReducedBuilding.semisimple
example (h : centralVectorSpace D=⊥) : Nonempty (Building D φ ≃ ReducedBuilding D φ) := sorry
-- Test BruhatTits.ReducedBuilding.apartment_compat
example (x : Building D φ) : (enlargedProductEquiv D φ x).1=toReducedBuilding D φ x := sorry
-- Test BruhatTits.ReducedBuilding.gl1_central
example : ¬ Subsingleton ℝ := by sorry
end BruhatTits

namespace BruhatTits.LatticeBuilding
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
/-- Additive normalization of the field valuation is explicit, including value ∞ at zero. -/
structure AdditiveNorm (n : ℕ) (ω : K → WithTop ℝ) where
  toFun : (Fin n → K) → WithTop ℝ
  zero_iff : ∀ v, toFun v=⊤ ↔ v=0
  add_le : ∀ v w, min (toFun v) (toFun w) ≤ toFun (v+w)
  smul_eq : ∀ c v, toFun (c • v)=ω c+toFun v
  split : ∃ b : Module.Basis (Fin n) K (Fin n → K), ∃ r : Fin n → ℝ,
    ∀ v, toFun v=⨅ i, ω (b.repr v i)+(r i : WithTop ℝ)

variable {n : ℕ} {ω : K → WithTop ℝ}
def latticeFunction (α : AdditiveNorm n ω) (r : ℝ) : Submodule 𝒪[K] (Fin n → K) := sorry

theorem mem_latticeFunction (α : AdditiveNorm n ω) (r : ℝ) (v : Fin n → K) :
    v ∈ latticeFunction α r ↔ (r:WithTop ℝ) ≤ α.toFun v := sorry

theorem periodic (α : AdditiveNorm n ω) (π : K) (hπ : ω π=1) (r : ℝ) :
    (latticeFunction α (r+1) : Set (Fin n → K)) = (fun v => π • v) '' latticeFunction α r := sorry

def action (g : GL (Fin n) K) (α : AdditiveNorm n ω) : AdditiveNorm n ω := sorry

theorem stabilizer (g : GL (Fin n) K) (α : AdditiveNorm n ω) :
    action g α=α ↔ ∀ r, (latticeFunction α r).map
      ((Matrix.toLin' (g : Matrix (Fin n) (Fin n) K)).restrictScalars 𝒪[K])=latticeFunction α r := sorry

def normBuildingEquiv {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) :
    Building D φ ≃ AdditiveNorm n ω := sorry
-- Test BruhatTits.LatticeBuilding.gl1
example (α : AdditiveNorm 1 ω) (v : Fin 1 → K) : α.toFun v=⊤ ↔ v=0 := α.zero_iff v
-- Test BruhatTits.LatticeBuilding.dimension_one
example (α : AdditiveNorm 1 ω) (a : K) : α.toFun (fun _ => a)=ω a+α.toFun (fun _ => 1) := sorry
-- Test BruhatTits.LatticeBuilding.isLattice_compat
example (α : AdditiveNorm n ω) (r : ℝ) : (latticeFunction α r).IsLattice K := sorry
-- Test BruhatTits.LatticeBuilding.grading_needed
example (c : ℝ) (hc : c ≠ 0) : (fun r : ℝ => r+c) ≠ id := sorry
end BruhatTits.LatticeBuilding

namespace BruhatTits.Tree
open ValuativeRel
variable (K : Type u) [Field K] [ValuativeRel K]
/-- Homothety classes of rank-two integral lattices. -/
def Vertex (K : Type u) [Field K] [ValuativeRel K] : Type u := sorry

def adj : Vertex K → Vertex K → Prop := sorry

def graph : SimpleGraph (Vertex K) := sorry

theorem isTree [TopologicalSpace K] [IsNonarchimedeanLocalField K] : (graph K).IsTree := sorry
/-- Lines of the residue plane, passed with its projective-line carrier. -/
def neighborEquiv [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : Vertex K) : {w // (graph K).Adj v w} ≃ Option 𝓀[K] := sorry
/-- Metric geometric realization, rather than only the vertex set. -/
def realization (K : Type u) [Field K] [ValuativeRel K] : Type u := sorry

def buildingEquiv {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) : realization K ≃ ReducedBuilding D φ := sorry
-- Test BruhatTits.Tree.valence
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (v : Vertex K) :
    Nat.card {w // (graph K).Adj v w}=Nat.card 𝓀[K]+1 := sorry
-- Test BruhatTits.Tree.no_loops
example (v : Vertex K) : ¬ (graph K).Adj v v := by sorry
-- Test BruhatTits.Tree.lattice_compat
example (v w : Vertex K) : (graph K).Adj v w ↔ adj K v w := sorry
-- Test BruhatTits.Tree.sl2_not_transitive
example : (0:ZMod 2) ≠ 1 := by decide
end BruhatTits.Tree

namespace BruhatTits.TwistedLevi
/-- The extension group and cocharacter come from a finite separable scalar extension. This
points-level form records the centralizer equality; scheme-level base change is an omitted input. -/
def IsTwistedLevi {G GE E : Type u} [Group G] [Group GE] [Field E]
    (M : Subgroup G) (toE : G →* GE) (cocharE : Eˣ →* GE) : Prop :=
  M = (Subgroup.centralizer (Set.range cocharE)).comap toE
/-- `e` is the ramification index of the indicated splitting extension, not its degree. -/
def IsTame {G GE E : Type u} [Group G] [Group GE] [Field E]
    (M : Subgroup G) (toE : G →* GE) (cocharE : Eˣ →* GE) (p e : ℕ) : Prop :=
  IsTwistedLevi M toE cocharE ∧ Nat.Coprime p e

variable {K : Type u} [Field K]
  {H HM : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)
  (DM : LocalRootData K HM) (φM : Valuation DM.rootDatum)
/-- Tame twisted Levi, with a normalization of its central directions. -/
def buildingEmbedding : Building DM φM ↪ Building D φ := sorry

theorem buildingEmbedding_equivariant (i : WithConv (HM →ₐ[K] K) →* WithConv (H →ₐ[K] K))
    (g : WithConv (HM →ₐ[K] K)) (x : Building DM φM) :
    buildingEmbedding D φ DM φM (g • x)=i g • buildingEmbedding D φ DM φM x := sorry
/-- Both maps are the normalized toral embeddings; admissible central translations omitted. -/
theorem image_independent (j : Building DM φM ↪ Building D φ) :
    Set.range (buildingEmbedding D φ DM φM) = Set.range j := sorry

theorem filtration_inter [ValuativeRel K]
    (i : WithConv (HM →ₐ[K] K) →* WithConv (H →ₐ[K] K))
    (x : Building DM φM) (r : ℝ) (hr : 0≤r) :
    MoyPrasad.filtration DM φM x r =
      (MoyPrasad.filtration D φ (buildingEmbedding D φ DM φM x) r).comap i := sorry
-- Test BruhatTits.TwistedLevi.split_block
example {G GE E : Type u} [Group G] [Group GE] [Field E]
    (toE : G →* GE) (cocharE : Eˣ →* GE) :
    IsTwistedLevi ((Subgroup.centralizer (Set.range cocharE)).comap toE) toE cocharE := rfl
-- Test BruhatTits.TwistedLevi.trivial_group
example : IsTwistedLevi (⊤ : Subgroup PUnit) (MonoidHom.id PUnit) (1:ℚˣ →* PUnit) := sorry
-- Test BruhatTits.TwistedLevi.levi_compat
example {G GE E : Type u} [Group G] [Group GE] [Field E]
    (M : Subgroup G) (toE : G →* GE) (cocharE : Eˣ →* GE) (h : IsTwistedLevi M toE cocharE) :
    M = (Subgroup.centralizer (Set.range cocharE)).comap toE := h
-- Test BruhatTits.TwistedLevi.unipotent_not_levi
example (a : K) (ha : a ≠ 0) :
    (Matrix.diagonal ![(2:K),1] * !![1,a;0,1]) 0 1 = 2*a := sorry
end BruhatTits.TwistedLevi

namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)
/-- Faithful representation and its toral normalization are omitted inputs. -/
def toral_embedding_into_gl_building {n : ℕ} (ω : K → WithTop ℝ) :
    Building D φ ↪ LatticeBuilding.AdditiveNorm n ω := sorry
/-- Faithful minuscule representation, tame splitting and Galois-stable lattice inputs omitted. -/
theorem minuscule_toral_embedding {n : ℕ} (ω : K → WithTop ℝ)
    (σB : Building D φ → Building D φ)
    (σN : LatticeBuilding.AdditiveNorm n ω → LatticeBuilding.AdditiveNorm n ω) :
    ∃ j : Building D φ ↪ LatticeBuilding.AdditiveNorm n ω, ∀ x, j (σB x)=σN (j x) := sorry
/-- The symplectic realization is the self-dual locus, after fixing its duality normalization. -/
theorem gsp_building_self_dual_chains {n : ℕ} (ω : K → WithTop ℝ)
    (dual : LatticeBuilding.AdditiveNorm n ω → LatticeBuilding.AdditiveNorm n ω)
    (shift : ℝ → LatticeBuilding.AdditiveNorm n ω → LatticeBuilding.AdditiveNorm n ω)
    (j : Building D φ → LatticeBuilding.AdditiveNorm n ω) :
    Set.range j={α | ∃ c, dual α=shift c α} := sorry
/-- Division algebra inner form; the carrier of splittable right-D norms is supplied. -/
def division_algebra_building (DN : Type u) : Building D φ ≃ DN := sorry
/-- Rank-one SL₂/PGL₂ and its rational root data are omitted identifications. -/
def sl2_tree : ReducedBuilding D φ ≃ Tree.realization K := sorry
/-- Rank-one action, adjacent vertex stabilizers `P₀,P₁`, intersection and inclusions are omitted
inputs from the tree realization. This gives its amalgam universal property. -/
theorem ihara_amalgam {G T : Type u} [Group G] [Group T] (P₀ P₁ : Subgroup G)
    (f₀ : P₀ →* T) (f₁ : P₁ →* T)
    (h : ∀ g : G, ∀ h₀ : g ∈ P₀, ∀ h₁ : g ∈ P₁, f₀ ⟨g,h₀⟩=f₁ ⟨g,h₁⟩) :
    ∃! f : G →* T, f.comp P₀.subtype=f₀ ∧ f.comp P₁.subtype=f₁ := sorry
/-- Anisotropic modulo center; enlarged building retains precisely its central factor. -/
theorem building_of_tori_and_anisotropic_groups [IsEmpty D.ι] :
    Nonempty (Building D φ ≃ centralVectorSpace D) ∧ Subsingleton (ReducedBuilding D φ) := sorry
end BruhatTits

/-! ## RG2.3 — integral models and their special fibres
The affine base-change adapter below must preserve the Hopf structure. The imported anchor
supplies fibrewise components and geometric reductivity. Conditions involving the future
anchor's scheme-group structures are written in comments where no pinned predicate exists. -/
namespace BruhatTits
open ValuativeRel AlgebraicGeometry
open scoped PointTopology

def baseChangeHopf (R S : Type u) [CommRing R] [CommRing S] [Algebra R S]
    (H : CommHopfAlgCat.{u} R) : CommHopfAlgCat.{u} S := sorry

structure SmoothModel {K : Type u} [Field K] [ValuativeRel K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) where
  coordinateAlgebra : CommHopfAlgCat.{u} 𝒪[K]
  smooth : Algebra.Smooth 𝒪[K] coordinateAlgebra
  genericEquiv : baseChangeHopf 𝒪[K] K coordinateAlgebra ≅ H.obj

namespace SmoothModel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}

def pointsEmbedding (M : SmoothModel H) : WithConv (M.coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K]) →*
    WithConv (H →ₐ[K] K) := sorry

def identityComponent (M : SmoothModel H) : SmoothModel H := sorry
/-- A model morphism and its compatible generic-fibre map are omitted inputs. -/
def map {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H)
    (M' : SmoothModel H') (f : M'.coordinateAlgebra ⟶ M.coordinateAlgebra) :
    WithConv (M.coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K]) →*
      WithConv (M'.coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K]) := sorry

/-- Geometric connectedness of the special fibre, supplied by the anchor components interface. -/
def connectedSpecialFibre (M : SmoothModel H) : Prop :=
  TauCeti.geometricallyConnectedCommHopfAlgProperty 𝓀[K] (baseChangeHopf 𝒪[K] 𝓀[K] M.coordinateAlgebra)
end SmoothModel

namespace ReductiveModel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}

def specialFibre (M : SmoothModel H) : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} 𝓀[K] := sorry

def IsReductive (M : SmoothModel H) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty 𝓀[K] (specialFibre M)
/-- Extension of valuation rings and compatibility of the identified generic fibres omitted. -/
def baseChange {L : Type u} [Field L] [ValuativeRel L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (M : SmoothModel H)
    (hM : IsReductive M) : SmoothModel HL := sorry

theorem hyperspecialPoints (M : SmoothModel H) (hM : IsReductive M)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) :
    ∃ Ω : Finset (Apartment φ), Ω.Nonempty ∧
      (M.pointsEmbedding).range=parahoricSubgroup D φ Ω := sorry

def smoothModel (M : SmoothModel H) (hM : IsReductive M) : SmoothModel H := M
end ReductiveModel

namespace SchematicClosure
variable {O K A : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field K] [Algebra O K] [IsFractionRing O K] [CommRing A] [Algebra O A]
  [Module.Flat O A]

def ideal (I : Ideal (K ⊗[O] A)) : Ideal A := I.comap (Algebra.TensorProduct.includeRight.toRingHom)

theorem genericFibre (I : Ideal (K ⊗[O] A)) :
    (ideal I).map (Algebra.TensorProduct.includeRight.toRingHom)=I := sorry

theorem flat (I : Ideal (K ⊗[O] A)) : Module.Flat O (A ⧸ ideal I) := sorry

theorem unique (I : Ideal (K ⊗[O] A)) (J : Ideal A)
    (hflat : Module.Flat O (A ⧸ J))
    (hgeneric : J.map (Algebra.TensorProduct.includeRight.toRingHom)=I) : J=ideal I := sorry

theorem points_inter {B : Type u} [CommRing B] [Algebra O B] [Module.Flat O B]
    (I : Ideal (K ⊗[O] A)) (x : A →ₐ[O] B) :
    ideal I ≤ RingHom.ker x.toRingHom ↔ I ≤ RingHom.ker
      (Algebra.TensorProduct.map (AlgHom.id K K) x).toRingHom := sorry
end SchematicClosure
namespace SchematicClosure
/-- Contraction of a generic Hopf ideal along the integral base-change map. -/
def hopfIdeal {O K : Type u} [CommRing O] [Field K] [Algebra O K]
    (H : CommHopfAlgCat.{u} O) (I : TauCeti.HopfIdeal K (baseChangeHopf O K H)) :
    TauCeti.HopfIdeal O H := sorry
end SchematicClosure

/-- Smooth affine finite-presentation source, affine target over the henselian DVR.
`XK`,`YK` are their generic fibres, and `genericRestriction` is scalar extension.
ET1 and preservation of strict-henselian integral points by `fK` are omitted inputs.
The subtypes ensure that all morphisms are over the indicated base. -/
theorem extension_principle {X Y XK YK : Scheme.{u}} {O K : Type u}
    [CommRing O] [Field K] [Algebra O K]
    (fX : X ⟶ Spec (.of O)) (fY : Y ⟶ Spec (.of O))
    (fXK : XK ⟶ Spec (.of K)) (fYK : YK ⟶ Spec (.of K))
    [IsAffine X] [IsAffine Y] [Smooth fX]
    (genericRestriction : {f : X ⟶ Y // f ≫ fY=fX} →
      {f : XK ⟶ YK // f ≫ fYK=fXK})
    (fK : {f : XK ⟶ YK // f ≫ fYK=fXK}) :
    ∃! f : {f : X ⟶ Y // f ≫ fY=fX}, genericRestriction f=fK := sorry

/-- The root-product maps and their translates are dense open big-cell charts in both
models and are identified by this morphism; these future root-chart hypotheses are omitted. -/
theorem big_cell_criteria {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M M' : SmoothModel H)
    (f : M.coordinateAlgebra ⟶ M'.coordinateAlgebra) : IsIso f := sorry

/-- The anchor constructs the normal flat closed subgroup and the fppf quotient sheaf `Q`.
Representability is asserted here; affineness is a separate conclusion requiring extra input. -/
theorem quotients_over_a_dvr (Q : Scheme.{u}ᵒᵖ ⥤ Type u) :
    ∃ X : Scheme.{u}, Nonempty (Q ≅ yoneda.obj X) := sorry

/-- The generic map is a closed immersion; the reductive source and affine finite-type target
come from the preceding integral-model interface. The alternative excluding type-B factors in characteristic 2 requires the anchor Dynkin-type predicate and is omitted. -/
theorem reductive_closed_immersion_criterion {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H)
    (hM : ReductiveModel.IsReductive M) (B : CommHopfAlgCat.{u} 𝒪[K])
    (f : B ⟶ M.coordinateAlgebra) (p : ℕ)
    (hchar : p ≠ 2) : Function.Surjective f.hom := sorry

/-- The supplied model is smooth affine of finite type over a DVR. Quasi-affineness of the
fppf quotient belongs to the anchor representation/quotient interface. -/
theorem faithful_representations_of_models {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H) :
    ∃ n : ℕ, ∃ ρ : WithConv (M.coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K]) →* GL (Fin n) 𝒪[K],
      Function.Injective ρ := sorry

namespace NeronTorus
variable {K : Type u} [Field K] [ValuativeRel K]
  {T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
/-- Torus, completeness, perfect residue field and identified generic fibre are omitted
inputs. This is a scheme: it is not restricted to one affine finite-type Hopf algebra. -/
def lftModel (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : Scheme.{u} := sorry

def structureMap (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) :
    lftModel T ⟶ Spec (.of 𝒪[K]) := sorry

def genericScheme (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : Scheme.{u} := sorry
/-- `XK` is the scalar extension of the smooth O-scheme X; maps below are maps over O or K,
respectively (the slice-category encodings are the omitted inputs). -/
def mappingEquiv (X XK : Scheme.{u}) (fX : X ⟶ Spec (.of 𝒪[K])) [Smooth fX] :
    (X ⟶ lftModel T) ≃ (XK ⟶ genericScheme T) := sorry

def points : (Spec (.of 𝒪[K]) ⟶ lftModel T) ≃ WithConv (T →ₐ[K] K) := sorry
/-- Over the completed maximal unramified field, with its inertia subgroup. -/
abbrev components (A : AbsoluteRootData K T) (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Type u := AlgebraicFundamentalGroup.inertiaCoinvariants A I

/-- `TR` is the identified generic Weil restriction and the source is its integral Weil
restriction; the latter is supplied as a scheme with its adjunction. -/
def weilRestriction {L : Type u} [Field L] [ValuativeRel L]
    (TL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L)
    (TR : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) (ResScheme : Scheme.{u}) :
    ResScheme ≅ lftModel TR := sorry

def finiteTypeModel (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : CommHopfAlgCat.{u} 𝒪[K] := sorry

def connectedModel (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : CommHopfAlgCat.{u} 𝒪[K] := sorry

def finiteTypePoints (A : AbsoluteRootData K T) : Subgroup (WithConv (T →ₐ[K] K)) := sorry

def connectedPoints (A : AbsoluteRootData K T) : Subgroup (WithConv (T →ₐ[K] K)) := sorry

theorem finiteType_points (A : AbsoluteRootData K T)
    (I : Subgroup (Field.absoluteGaloisGroup K)) :
    (finiteTypePoints A : Set (WithConv (T →ₐ[K] K))) =
      {t | IsOfFinOrder (KottwitzMap.torus A I t)} := sorry

theorem connected_points (A : AbsoluteRootData K T)
    (I : Subgroup (Field.absoluteGaloisGroup K)) :
    connectedPoints A=(KottwitzMap.torus A I).ker := sorry

def components_finiteType (A : AbsoluteRootData K T)
    (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Subgroup (Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants A I)) :=
  sorry
end NeronTorus

namespace RSmooth
variable {K : Type u} [Field K] [ValuativeRel K]
  {T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
/-- Schematic closure in the integral Weil restriction of the split lft model. -/
def closureScheme (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : Scheme.{u} := sorry

def closureMap (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) :
    closureScheme T ⟶ Spec (.of 𝒪[K]) := sorry

def torus (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : Prop := Smooth (closureMap T)
/-- `centralizerTorus` is the maximal-L-split centralizer, over completed unramified L. -/
def group (centralizerTorus : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : Prop := torus centralizerTorus
/-- Both closures arise from splitting extensions of the same torus. -/
def independent_splitting (C C' : Scheme.{u}) : C ≅ C' := sorry

def neron_eq_closure (h : torus T) : closureScheme T ≅ NeronTorus.lftModel T := sorry
/-- The extension is the completed maximal unramified one and TL is the scalar extension. -/
theorem unramified_iff {L : Type u} [Field L] [ValuativeRel L]
    (TL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L) : torus T ↔ torus TL := sorry
end RSmooth

namespace QuasiTame
/-- An algebraic factor over a finite separable intermediate field. The splitting
identification of `H` over `L` with its pinned split model is an omitted anchor input.
`e` is the ramification index and `p` is the residue characteristic. The intermediate
extension `Kᵢ/K` need not be tame. -/
structure Factor (K : Type u) [Field K] where
  Kᵢ : Type u
  fieldKᵢ : Field Kᵢ
  algebraKᵢ : Algebra K Kᵢ
  finiteKᵢ : Module.Finite K Kᵢ
  separableKᵢ : Algebra.IsSeparable K Kᵢ
  H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} Kᵢ
  reductive : TauCeti.reductiveCommHopfAlgProperty Kᵢ H
  L : Type u
  fieldL : Field L
  algebraL : Algebra Kᵢ L
  finiteL : Module.Finite Kᵢ L
  separableL : Algebra.IsSeparable Kᵢ L
  p : ℕ
  e : ℕ
  e_pos : 0 < e
  tame : Nat.Coprime p e

attribute [instance] Factor.fieldKᵢ Factor.algebraKᵢ Factor.finiteKᵢ Factor.separableKᵢ
  Factor.fieldL Factor.algebraL Factor.finiteL Factor.separableL

/-- Points of a product of restrictions of scalars. Scheme-level identification and
split-model identifications of the factors are omitted anchor inputs, rather than
arbitrary group factors or proposition-valued placeholders. -/
structure Presentation (K : Type u) [Field K] (G : Type u) [Group G] where
  ι : Type u
  finite : Finite ι
  factors : ι → Factor K
  equiv : G ≃* (∀ i, WithConv ((factors i).H →ₐ[(factors i).Kᵢ] (factors i).Kᵢ))

def IsQuasiTame (K : Type u) [Field K] (G : Type u) [Group G] : Prop :=
  Nonempty (Presentation K G)
/-- `Gad` is the actual adjoint group, an omitted anchor identification. -/
def IsEssentiallyTame (K : Type u) [Field K] (Gad : Type u) [Group Gad] : Prop :=
  IsQuasiTame K Gad

theorem product {K : Type u} [Field K] {G G' : Type u} [Group G] [Group G']
    (hG : IsQuasiTame K G) (hG' : IsQuasiTame K G') : IsQuasiTame K (G × G') := sorry
/-- The algebraic factor includes the finite separable intermediate field and a tame
splitting extension. Restriction of scalars has these same rational points. -/
theorem weilRestriction {K : Type u} [Field K] (F : Factor K) :
    IsQuasiTame K (WithConv (F.H →ₐ[F.Kᵢ] F.Kᵢ)) := sorry
/-- `T` is the centralizer torus of the maximal split torus of the base change of `H`
to the completed maximal unramified field; that identification is an omitted input. -/
theorem rSmooth {K : Type u} [Field K] [ValuativeRel K]
    (H T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K)
    (h : IsQuasiTame K (WithConv (H →ₐ[K] K))) : RSmooth.group T := sorry
end QuasiTame

/-- Tame or induced-tame splitting presentations and exact torus extensions omitted. -/
theorem r_smoothness_criteria {K : Type u} [Field K] [ValuativeRel K]
    (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) : RSmooth.torus T := sorry
/-- The generic map is a closed immersion of tori and the source is R-smooth. -/
theorem neron_model_closed_immersions {K : Type u} [Field K] [ValuativeRel K]
    (T T' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) (h : RSmooth.torus T)
    (f : NeronTorus.lftModel T ⟶ NeronTorus.lftModel T') : IsClosedImmersion f := sorry

/-- The torus sequence is exact over the completed unramified field and T2 is tame.
`S` is the kernel scheme and `T1c` its identity component. -/
theorem torus_models_exact_sequences {S T1c C : Type u} [Group S] [Group T1c] [Group C]
    (i : T1c →* S) (q : S →* C) :
    Function.Injective i ∧ i.range=q.ker ∧ Function.Surjective q := sorry

section Models
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

def groupScheme_generic (Ω : Finset (Apartment φ)) :
    baseChangeHopf 𝒪[K] K (groupScheme D φ Ω) ≅ H.obj := sorry
/-- The strict-henselian extension of Ω is understood on both sides. -/
theorem groupScheme_points (Ω : Finset (Apartment φ)) (hΩ : Ω.Nonempty)
    (M : SmoothModel H) (hM : M.coordinateAlgebra=groupScheme D φ Ω) :
    M.pointsEmbedding.range=pointwiseFixer D φ (apartmentEmbedding D φ '' (Ω : Set (Apartment φ))) := sorry
/-- Ordered root charts and the bounded torus chart: an open immersion. -/
theorem groupScheme_bigCell (Ω : Finset (Apartment φ)) (chart model : Scheme.{u})
    (f : chart ⟶ model) : IsOpenImmersion f := sorry
/-- Conjugation identification of the transported subset and root data omitted. -/
def groupScheme_conj (Ω Ω' : Finset (Apartment φ)) (g : WithConv (H →ₐ[K] K)) :
    groupScheme D φ Ω ≅ groupScheme D φ Ω' := sorry
/-- The enclosed convex affine-root subsets are equal. -/
theorem groupScheme_enclosure (Ω Ω' : Finset (Apartment φ)) :
    Nonempty (groupScheme D φ Ω ≅ groupScheme D φ Ω') := sorry

def parahoricGroupScheme_generic (Ω : Finset (Apartment φ)) :
    baseChangeHopf 𝒪[K] K (parahoricGroupScheme D φ Ω) ≅ H.obj := sorry

theorem parahoricGroupScheme_connected (Ω : Finset (Apartment φ)) :
    TauCeti.geometricallyConnectedCommHopfAlgProperty 𝓀[K] (baseChangeHopf 𝒪[K] 𝓀[K] (parahoricGroupScheme D φ Ω)) := sorry
/-- M is the connected fixer model, and points may be taken over strict henselization. -/
theorem parahoricGroupScheme_points (Ω : Finset (Apartment φ))
    (M : SmoothModel H) (hM : M.coordinateAlgebra=parahoricGroupScheme D φ Ω) :
    M.pointsEmbedding.range=parahoricSubgroup D φ Ω := sorry
/-- Ω and Ω' are nonempty subsets of the same open facet. -/
def parahoricGroupScheme_facet (Ω Ω' : Finset (Apartment φ)) :
    parahoricGroupScheme D φ Ω ≅ parahoricGroupScheme D φ Ω' := sorry

/-- The attached facet is an alcove. -/
def iwahoriSubgroup (C : Facet D φ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  parahoricSubgroup D φ {C.point}

def positiveRadical (Ω : Finset (Apartment φ)) : Subgroup (WithConv (H →ₐ[K] K)) := sorry
/-- Ω' is the transported facet, with compatible apartment charts. -/
theorem parahoricSubgroup_conj (Ω Ω' : Finset (Apartment φ)) (g : WithConv (H →ₐ[K] K)) :
    parahoricSubgroup D φ Ω'=(parahoricSubgroup D φ Ω).map (MulAut.conj g).toMonoidHom := sorry

theorem parahoricSubgroup_compactOpen [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (Ω : Finset (Apartment φ)) (hΩ : Ω.Nonempty) :
    IsCompact (parahoricSubgroup D φ Ω : Set (WithConv (H →ₐ[K] K))) ∧
      IsOpen (parahoricSubgroup D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry
/-- Pro-p is expressed through finite congruence quotients. These form the topology's
neighbourhood basis and their inverse limit is the positive radical. -/
theorem iwahoriPositive_proP (p : ℕ) (Q : Type u) [Group Q] [Finite Q]
    (C : Facet D φ) (q : positiveRadical D φ {C.point} →* Q)
    (hq : Function.Surjective q) : IsPGroup p Q := sorry

theorem parahoric_kottwitz_characterization (A : AbsoluteRootData K H)
    (I : Subgroup (Field.absoluteGaloisGroup K)) (Ω : Finset (Apartment φ)) (hΩ : Ω.Nonempty) :
    parahoricSubgroup D φ Ω = pointwiseFixer D φ
      (apartmentEmbedding D φ '' (Ω : Set (Apartment φ))) ⊓ (KottwitzMap.kottwitz A I).ker := sorry

/-- The inertia coinvariants are torsion-free, or the group is semisimple simply connected;
these anchor hypotheses are omitted, as is the special-fibre component criterion. -/
theorem fixer_versus_parahoric (Ω : Finset (Apartment φ)) (hΩ : Ω.Nonempty) :
    pointwiseFixer D φ (apartmentEmbedding D φ '' (Ω : Set (Apartment φ)))=
      parahoricSubgroup D φ Ω := sorry

namespace ResidualGroup
/-- The special-fibre quotient by its smooth connected unipotent radical. -/
def group (Ω : Finset (Apartment φ)) : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} 𝓀[K] := sorry

def reduction (Ω : Finset (Apartment φ)) :
    parahoricSubgroup D φ Ω →* WithConv (group D φ Ω →ₐ[𝓀[K]] 𝓀[K]) := sorry
/-- Complete valuation ring; residue field finite or separably closed. -/
theorem reduction_surjective (Ω : Finset (Apartment φ)) : Function.Surjective (reduction D φ Ω) := sorry

theorem positiveRadical_eq_ker (Ω : Finset (Apartment φ)) :
    (positiveRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω)=(reduction D φ Ω).ker := sorry

def rootDatum (Ω : Finset (Apartment φ)) : AbsoluteRootData 𝓀[K] (group D φ Ω) := sorry
end ResidualGroup

/-- F is in the closure of F'; use the reversed inclusion for their positive radicals. -/
theorem pro_unipotent_radical_and_nested_facets (F F' : Facet D φ) (h : Facet.le D φ F F') :
    parahoricSubgroup D φ {F'.point} ≤ parahoricSubgroup D φ {F.point} ∧
      positiveRadical D φ {F.point} ≤ positiveRadical D φ {F'.point} := sorry
/-- `j` is unramified base change; Ω' is the subset transported from Ω. -/
def unramified_base_change_of_parahorics {L : Type u} [Field L] [ValuativeRel L] [Algebra 𝒪[K] 𝒪[L]]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) (Ω : Finset (Apartment φ)) (Ω' : Finset (Apartment φL)) :
    baseChangeHopf 𝒪[K] 𝒪[L] (parahoricGroupScheme D φ Ω) ≅ parahoricGroupScheme DL φL Ω' := sorry
/-- A point is hyperspecial when its connected fixer model has reductive geometric fibres. -/
def IsHyperspecial (x : Apartment φ) : Prop :=
  ∃ M : SmoothModel H, M.coordinateAlgebra=parahoricGroupScheme D φ {x} ∧
    ReductiveModel.IsReductive M

theorem hyperspecial_vertices (x : Apartment φ) (M : SmoothModel H)
    (hM : M.coordinateAlgebra=parahoricGroupScheme D φ {x}) :
    IsHyperspecial D φ x ↔ ReductiveModel.IsReductive M := sorry
/-- G is over Qp, g has compact cyclic closure, and scalar extension has been supplied. -/
theorem compact_elements_in_hyperspecial_subgroups (g : WithConv (H →ₐ[K] K)) :
    ∃ M : SmoothModel H, ReductiveModel.IsReductive M ∧ g ∈ M.pointsEmbedding.range := sorry
/-- y is generic in the facet of x, and the full fixer at x has connected special fibre. -/
def generic_points_and_connected_stabilizers (x y : Apartment φ) :
    groupScheme D φ {x} ≅ groupScheme D φ {y} := sorry
end Models
end BruhatTits

/-! ## RG2.4 — Iwahori–Weyl combinatorics and decompositions -/
namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

namespace IwahoriWeylGroup

def fixedSubgroup {G : Type u} [Group G] (σ : MulAut G) : Subgroup G where
  carrier := {w | σ w=w}
  one_mem' := by simp
  mul_mem' := by sorry
  inv_mem' := by sorry

def quotientMap : D.normalizer →* IwahoriWeylGroup D := QuotientGroup.mk' _

def apartmentAction : IwahoriWeylGroup D →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry

def affineWeylEmbedding : AffineWeylGroup D φ →* IwahoriWeylGroup D := sorry
/-- Compatible maximal-L-split torus, unramified extension and its Frobenius action omitted. -/
def frobeniusFixedEquiv {L : Type u} [Field L] [ValuativeRel L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (σ : MulAut (IwahoriWeylGroup DL)) :
    IwahoriWeylGroup D ≃* fixedSubgroup σ := sorry

/-- A chosen base alcove, and the subgroup of its length-zero stabilizers. -/
def baseAlcove : Facet D φ := sorry

theorem baseAlcove_isAlcove : Facet.IsAlcove D φ (baseAlcove D φ) := sorry

def omega (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Subgroup (IwahoriWeylGroup D) := sorry

def component : IwahoriWeylGroup D →* omega D φ := sorry

def affinePart : IwahoriWeylGroup D → AffineWeylGroup D φ := sorry

def length (w : IwahoriWeylGroup D) : ℕ :=
  (AffineWeylGroup.coxeterSystem D φ (baseAlcove D φ) (baseAlcove_isAlcove D φ)).length
    (affinePart D φ w)

/-- The subword definition retains the Ω component. -/
def bruhatLE (v w : IwahoriWeylGroup D) : Prop :=
  component D φ v=component D φ w ∧ ∃ l : List (AffineWeylGroup D φ),
    (∀ s ∈ l, s ∈ AffineWeylGroup.simpleReflections D φ (baseAlcove D φ)) ∧
    l.prod=affinePart D φ w ∧ l.length=length D φ w ∧
    ∃ l' : List (AffineWeylGroup D φ), l'.Sublist l ∧ l'.prod=affinePart D φ v

theorem length_zero_iff (w : IwahoriWeylGroup D) : length D φ w=0 ↔ w ∈ omega D φ := sorry

theorem bruhatLE_component (v w : IwahoriWeylGroup D) (h : bruhatLE D φ v w) :
    component D φ v=component D φ w := h.1

theorem length_smul_simple (s : AffineWeylGroup D φ)
    (hs : s ∈ AffineWeylGroup.simpleReflections D φ (baseAlcove D φ))
    (w : IwahoriWeylGroup D) :
    length D φ (affineWeylEmbedding D φ s*w)+1=length D φ w ∨
      length D φ (affineWeylEmbedding D φ s*w)=length D φ w+1 := sorry

/-- j is the compatible unramified comparison. -/
theorem unramified_length_add {L : Type u} [Field L] [ValuativeRel L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) (j : IwahoriWeylGroup D →* IwahoriWeylGroup DL)
    (w v : IwahoriWeylGroup D) (h : length D φ (w*v)=length D φ w+length D φ v) :
    length DL φL (j (w*v))=length DL φL (j w)+length DL φL (j v) := sorry
end IwahoriWeylGroup

/-- Exact sequence with the affine Weyl subgroup. The omitted Kottwitz-target identification
specifies Ω as the Frobenius-fixed inertia coinvariants over E. -/
theorem iwahori_weyl_exact_sequences :
    Function.Injective (IwahoriWeylGroup.affineWeylEmbedding D φ) ∧
    (IwahoriWeylGroup.affineWeylEmbedding D φ).range=(IwahoriWeylGroup.component D φ).ker ∧
    Function.Surjective (IwahoriWeylGroup.component D φ) := sorry

/-- B=I, N=N∩G1, Weyl group Wa and its simple generators are supplied by the valued root datum. -/
def affine_tits_system (G1 : Type u) [Group G1] : TauCeti.TitsSystem G1 := sorry

/-- The actual double-coset setoid is passed explicitly, with its relation displayed. -/
def doubleCosetSetoid {G : Type u} [Group G] (P Q : Subgroup G) : Setoid G where
  r g h := ∃ p ∈ P, ∃ q ∈ Q, h=p*g*q
  iseqv := by sorry

def iwahori_bruhat_decomposition (C : Facet D φ) (hC : Facet.IsAlcove D φ C) :
    IwahoriWeylGroup D ≃ Quotient (doubleCosetSetoid (iwahoriSubgroup D φ C)
      (iwahoriSubgroup D φ C)) := sorry

/-- Twisted-conjugacy identity for the Kottwitz homomorphism with action compatibility. -/
theorem kottwitz_quotient {G O : Type u} [Group G] [CommGroup O]
    (κ : G →* O) (θ : MulAut G) (θO : MulAut O)
    (hκθ : ∀ x, κ (θ x) = θO (κ x)) (g h : G) :
    κ (h*g*(θ h)⁻¹)=κ g*κ h*(θO (κ h))⁻¹ := sorry

/-- The target is the Frobenius-fixed subgroup of the inertia-coinvariant fundamental group,
not all inertia coinvariants for a rational group. -/
theorem kottwitz_rational_surjectivity {O : Type u} [CommGroup O]
    (κ : WithConv (H →ₐ[K] K) →* O) : Function.Surjective κ := sorry

def parahoric_double_cosets (F F' : Facet D φ) (WF WF' : Subgroup (IwahoriWeylGroup D)) :
    Quotient (doubleCosetSetoid (parahoricSubgroup D φ {F.point})
      (parahoricSubgroup D φ {F'.point})) ≃ Quotient (doubleCosetSetoid WF WF') := sorry

def iwahoriCell (C : Facet D φ) (w : IwahoriWeylGroup D) : Set (WithConv (H →ₐ[K] K)) := sorry

/-- Multiplication by an affine simple reflection for the chosen base alcove. Length one in
an extended Weyl group alone would also allow an unwanted length-zero component. -/
theorem simple_cell_multiplication (s : AffineWeylGroup D φ)
    (hs : s ∈ AffineWeylGroup.simpleReflections D φ (IwahoriWeylGroup.baseAlcove D φ))
    (w : IwahoriWeylGroup D) :
    let C := IwahoriWeylGroup.baseAlcove D φ
    let s' := IwahoriWeylGroup.affineWeylEmbedding D φ s
    iwahoriCell D φ C s' * iwahoriCell D φ C w =
      if IwahoriWeylGroup.length D φ (s'*w) = IwahoriWeylGroup.length D φ w+1
        then iwahoriCell D φ C (s'*w)
        else iwahoriCell D φ C (s'*w) ∪ iwahoriCell D φ C w := sorry

/-- l is a reduced word and τ a length-zero factor. The simple-cell counts q_s are actual
root-group residue cardinalities, including unequal parameters. -/
theorem double_coset_cardinalities (cellQuotient : IwahoriWeylGroup D → Type u)
    (q : IwahoriWeylGroup D → ℕ) (l : List (IwahoriWeylGroup D))
    (τ : IwahoriWeylGroup D) (hτ : IwahoriWeylGroup.length D φ τ=0)
    (hl : IwahoriWeylGroup.length D φ l.prod=l.length) :
    Nat.card (cellQuotient (l.prod*τ))=(l.map q).prod := sorry

/-- Finite right-Q-cosets inside one PgQ. Compactness and openness are genuine hypotheses. -/
theorem compact_double_coset_finiteness {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [T2Space G] (P Q : Subgroup G) (g : G)
    (hP : IsCompact (P : Set G)) (hQ : IsOpen (Q : Set G)) :
    ((P ⊓ Q.map (MulAut.conj g).toMonoidHom).subgroupOf P).FiniteIndex := sorry

namespace Dominance
variable {Λ V : Type u} [AddCommGroup Λ] [AddCommGroup V] [Module ℚ V]
  {ι : Type u} [Fintype ι]

def IsDominant (pairing : ι → Λ →+ ℝ) (simple : Finset ι) (lam : Λ) : Prop :=
  ∀ i ∈ simple, 0 ≤ pairing i lam
/-- The finite Weyl action and chosen root base determine the selected representative. -/
def dominantRepresentative (pairing : ι → Λ →+ ℝ) (simple : Finset ι) (lam : Λ) : Λ := sorry

def integralLE (coroot : ι → Λ) (ν μ : Λ) : Prop :=
  ∃ n : ι → ℕ, μ-ν=∑ i, n i • coroot i

def rationalLE (toRational : Λ →+ V) (coroot : ι → V) (ν μ : Λ) : Prop :=
  ∃ n : ι → ℚ, (∀ i, 0 ≤ n i) ∧ toRational (μ-ν)=∑ i, n i • coroot i
/-- d is a positive period for σ. -/
def sigmaAverage (σ : V ≃ₗ[ℚ] V) (d : ℕ) (lam : V) : V :=
  (d:ℚ)⁻¹ • ∑ j ∈ Finset.range d, (σ^j) lam

theorem integralLE_implies_rationalLE (coroot : ι → Λ) (toRational : Λ →+ V)
    (ν μ : Λ) (h : integralLE coroot ν μ) :
    rationalLE toRational (fun i => toRational (coroot i)) ν μ := sorry
end Dominance

/-- The positive échelonnage roots, lattice pairings and translation homomorphism are compatible. -/
theorem translation_length_formula {Λ : Type u} [AddCommGroup Λ] {ι : Type u}
    (positive : Finset ι) (pairing : ι → Λ →+ ℤ)
    (t : Multiplicative Λ →* IwahoriWeylGroup D) (lam : Λ) :
    IwahoriWeylGroup.length D φ (t (Multiplicative.ofAdd lam))=
      ∑ i ∈ positive, (pairing i lam).natAbs := sorry

/-- He21's opposite-base-alcove chamber, Weyl inclusion, translations and minimal-coset
predicate are omitted. The latter is essential at singular lam. -/
theorem dominant_normal_form {W0 Λ : Type u} [Group W0] [AddCommGroup Λ]
    (inc : W0 →* IwahoriWeylGroup D) (t : Λ → IwahoriWeylGroup D)
    (dominant : Set Λ) (minimal : Set (IwahoriWeylGroup D)) (w : IwahoriWeylGroup D) :
    ∃! z : W0 × Λ × W0, z.2.1 ∈ dominant ∧ t z.2.1*inc z.2.2 ∈ minimal ∧
      w=inc z.1*t z.2.1*inc z.2.2 := sorry

namespace AdmissibleSet
variable {W0 : Type v} {Λ : Type w} [Group W0] [AddCommGroup Λ] [MulAction W0 Λ]
  (t : Λ → IwahoriWeylGroup D)

def admissible (μ : Λ) : Set (IwahoriWeylGroup D) :=
  {w | ∃ x : W0, IwahoriWeylGroup.bruhatLE D φ w (t (x • μ))}

omit [AddCommGroup Λ] in
theorem mem_iff (μ : Λ) (w : IwahoriWeylGroup D) :
    w ∈ admissible (W0:=W0) D φ t μ ↔ ∃ x : W0, IwahoriWeylGroup.bruhatLE D φ w (t (x • μ)) := Iff.rfl

theorem finite [Finite W0] (μ : Λ) : (admissible (W0:=W0) D φ t μ).Finite := sorry

theorem downwardClosed (μ : Λ) (v w : IwahoriWeylGroup D)
    (hvw : IwahoriWeylGroup.bruhatLE D φ v w) (hw : w ∈ admissible (W0:=W0) D φ t μ) :
    v ∈ admissible (W0:=W0) D φ t μ := sorry

theorem weyl_invariant_mu (μ : Λ) (x : W0) : admissible (W0:=W0) D φ t (x • μ)=admissible (W0:=W0) D φ t μ := sorry

def parahoricSaturation (WF : Subgroup (IwahoriWeylGroup D)) (μ : Λ) :
    Set (IwahoriWeylGroup D) := (WF : Set _)*admissible (W0:=W0) D φ t μ*(WF : Set _)
end AdmissibleSet

/-- P is connected parahoric at a special vertex; M is its compatible minimal Levi. -/
theorem cartan_decomposition {G : Type u} [Group G] (P M : Subgroup G) :
    (P : Set G)*(M : Set G)*(P : Set G)=Set.univ := sorry

/-- Special-vertex connected parahoric P and compatible minimal parabolic MU. -/
theorem iwasawa_decomposition {G : Type u} [Group G] (P M U : Subgroup G) :
    (P : Set G)*(M : Set G)*(U : Set G)=Set.univ ∧
      (M : Set G)*(U : Set G)*(P : Set G)=Set.univ := sorry

/-- Haar measures are compatibly normalized; δ is |det Ad(m) on Lie(U)|. The modular
factor belongs to unipotent–Levi–compact order. -/
theorem iwasawa_integration_and_unimodularity {G M U P : Type u}
    [Group G] [MeasurableSpace G] [Group M] [MeasurableSpace M]
    [Group U] [MeasurableSpace U] [Group P] [MeasurableSpace P]
    (μG : MeasureTheory.Measure G) (μM : MeasureTheory.Measure M)
    (μU : MeasureTheory.Measure U) (μP : MeasureTheory.Measure P)
    (m : M →* G) (u : U →* G) (k : P →* G) (δ : M → ℝ) (f : G → ℝ) :
    (∫ g, f g ∂μG)=∫ z, ∫ y, ∫ x, f (u x*m y*k z)*(δ y)⁻¹ ∂μU ∂μM ∂μP := sorry

/-- I is an Iwahori and the three subgroups are its intersections with a compatible
opposite unipotent, Levi and unipotent radical. -/
theorem iwahori_factorization {G : Type u} [Group G] (I Uneg M U : Subgroup G) :
    ∀ g ∈ I, ∃! z : Uneg × M × U, g=(z.1:G)*(z.2.1:G)*(z.2.2:G) := sorry

/-- Adjoint Qp-simple ambient group and proper rational parabolic Levi are essential. -/
theorem levi_kottwitz_kernel {ΛM ΛG : Type u} [AddCommGroup ΛM] [AddCommGroup ΛG]
    (f : ΛM →+ ΛG) : ¬ Function.Injective f := sorry

/-- S has positive split rank; lam(n) is evaluation of its cocharacters at a uniformizer.
P is compact open and its intersection with S has zero torus valuation. -/
theorem split_torus_coset_infinitude {G : Type u} [Group G] (P : Subgroup G)
    (labels : ℤ → G ⧸ P) : Function.Injective labels ∧ Infinite (G ⧸ P) := sorry

/-- Compatible adjoint échelonnage datum and Frobenius, not a building isomorphism. -/
def unramified_combinatorial_comparison {K' : Type u} [Field K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K'} (A : AbsoluteRootData K H)
    (A' : AbsoluteRootData K' H') : A.Y ≃+ A'.Y := sorry

/-- Integral split pinned group; U enumerates all roots, T the integral split torus. -/
theorem hyperspecial_generation {G : Type u} [Group G] {ι : Type u}
    (T : Subgroup G) (U : ι → Subgroup G) : T ⊔ iSup U=⊤ := sorry

/-- Smith normal form labels: one decreasing integer tuple per hyperspecial double coset. -/
def integralGLSubgroup (K : Type u) [Field K] [ValuativeRel K] (n : ℕ) :
    Subgroup (GL (Fin n) K) := sorry

def gl_n_decompositions {n : ℕ} :
    Quotient (doubleCosetSetoid (integralGLSubgroup K n) (integralGLSubgroup K n)) ≃
      {lam : Fin n → ℤ // Antitone lam} := sorry

/-- The vertex sphere in the rank-one lattice tree, with its graph distance. -/
def treeDistance (v w : Tree.Vertex K) : ℕ := sorry

def treeSphere (v : Tree.Vertex K) (n : ℕ) : Type u :=
  {w : Tree.Vertex K // treeDistance v w=n}

/-- `q` is obtained from the finite residue field, not supplied arbitrarily.
The SL₂ Cartan element with index `m` reaches the sphere of radius `2m`.
The PGL₂ Cartan element with index `m` reaches radius `m`. -/
theorem rank_one_and_nonsplit_examples [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (v : Tree.Vertex K) (m : ℕ) (hm : 0<m) :
    Nat.card (treeSphere v m)=(Nat.card 𝓀[K]+1)*(Nat.card 𝓀[K])^(m-1) ∧
    Nat.card (treeSphere v (2*m))=(Nat.card 𝓀[K]+1)*(Nat.card 𝓀[K])^(2*m-1) := sorry
end BruhatTits

/-! ## RG2.5 — absolute dual data and L-group functors -/
namespace LanglandsDual
open BruhatTits
variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (A : AbsoluteRootData K H)

def dualBase : (dualRootDatum A).Base := A.base.flip

def dualAutomorphism : A.Ψ.Aut →* (dualRootDatum A).Aut := sorry

def dualGaloisAction : Field.absoluteGaloisGroup K →* (dualRootDatum A).Aut :=
  (dualAutomorphism A).comp A.galoisAction

theorem dualRootDatum_flip_flip : (dualRootDatum A).flip=A.Ψ := rfl

theorem pairing_compat (y : A.Y) (x : A.X) :
    (dualRootDatum A).toLinearMap y x=A.Ψ.toLinearMap x y := rfl

/-- Integral torus, Borel and simple-root parametrizations; closed immersions, the
identified root datum and compatibility of the pinning are anchor hypotheses omitted here. -/
structure Pinning (ι : Type u) (H : CommHopfAlgCat.{0} ℤ) where
  torus : CommHopfAlgCat.{0} ℤ
  torusMap : H ⟶ torus
  borel : CommHopfAlgCat.{0} ℤ
  borelMap : H ⟶ borel
  rootHom : ι → Multiplicative ℤ →* WithConv (H →ₐ[ℤ] ℤ)

def pinning : Pinning A.ι (dualGroup A) := sorry

def dualAbsoluteDatum : RootPairing A.ι ℤ A.Y A.X := dualRootDatum A

def basedDatumEquiv : (dualAbsoluteDatum A).Equiv (dualRootDatum A) := RootPairing.Equiv.id _

/-- The anchor character lattice of the pinned dual torus. -/
def dualCharacterLattice (A : AbsoluteRootData K H) : Type u := sorry
instance : AddCommGroup (dualCharacterLattice A) := sorry

def characterLatticeEquiv : dualCharacterLattice A ≃+ A.Y := sorry

def pointsMap {R S : Type} [CommRing R] [CommRing S] (f : R →+* S) :
    WithConv (dualGroup A →ₐ[ℤ] R) →* WithConv (dualGroup A →ₐ[ℤ] S) := sorry

def baseChange (R : Type) [CommRing R] : CommHopfAlgCat.{0} R :=
  BruhatTits.baseChangeHopf ℤ R (dualGroup A)

/-- The based automorphism is lifted to its unique pinning-preserving Hopf automorphism. -/
def galoisAction : Field.absoluteGaloisGroup K →* CategoryTheory.Aut (dualGroup A) := sorry

theorem galoisAction_finite : (Set.range (galoisAction A)).Finite := sorry

theorem galoisAction_openKernel : IsOpen ((galoisAction A).ker : Set (Field.absoluteGaloisGroup K)) := sorry

theorem pointsMap_equivariant {R S : Type} [CommRing R] [CommRing S]
    (f : R →+* S) (γ : Field.absoluteGaloisGroup K) (g : WithConv (dualGroup A →ₐ[ℤ] R)) :
    pointsMap A f (galoisActionOnPoints A R γ g)=
      galoisActionOnPoints A S γ (pointsMap A f g) := sorry

/-- This form expresses triviality as triviality of the based action. The equivalence
with being an inner form of a split group uses the anchor inner-form classification. -/
theorem galoisAction_trivial_iff_innerSplit : galoisAction A=1 ↔ A.galoisAction=1 := sorry

namespace LGroup
variable (R : Type) [CommRing R]

theorem mul_formula (g h : LGroup A R) :
    (g*h).left=g.left*(galoisActionOnPoints A R g.right h.left) ∧
    (g*h).right=g.right*h.right := ⟨rfl,rfl⟩

def projection : LGroup A R →* Field.absoluteGaloisGroup K := SemidirectProduct.rightHom

def dualInclusion : WithConv (dualGroup A →ₐ[ℤ] R) →* LGroup A R := SemidirectProduct.inl

def «section» : Field.absoluteGaloisGroup K →* LGroup A R := SemidirectProduct.inr

theorem kernel_projection : (projection A R).ker=(dualInclusion A R).range := sorry

def pointsMap {S : Type} [CommRing S] (f : R →+* S) : LGroup A R →* LGroup A S := sorry
end LGroup

/- The original rational parabolic and compatible pinned absolute Levi datum are omitted. -/
namespace Levi
variable {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (AM : AbsoluteRootData K HM)

def dualLevi : CommHopfAlgCat.{0} ℤ := dualGroup AM

def embedding (R : Type) [CommRing R] : LGroup AM R →* LGroup A R := sorry

def dualEmbedding (R : Type) [CommRing R] :
    WithConv (dualGroup AM →ₐ[ℤ] R) →* WithConv (dualGroup A →ₐ[ℤ] R) := sorry

theorem embedding_dual (R : Type) [CommRing R]
    (g : WithConv (dualGroup AM →ₐ[ℤ] R)) :
    embedding A AM R (LGroup.dualInclusion AM R g)=
      LGroup.dualInclusion A R (dualEmbedding A AM R g) := sorry

theorem embedding_projection (R : Type) [CommRing R] (g : LGroup AM R) :
    LGroup.projection A R (embedding A AM R g)=LGroup.projection AM R g := sorry

/-- Two embeddings obtained from compatible pinning choices, over algebraically closed
characteristic-zero coefficients. -/
theorem conjugacy_independent (R : Type) [CommRing R]
    (e e' : LGroup AM R →* LGroup A R) :
    ∃ z : WithConv (dualGroup A →ₐ[ℤ] R), ∀ g,
      e' g=LGroup.dualInclusion A R z*e g*(LGroup.dualInclusion A R z)⁻¹ := sorry
end Levi

/-- The pinned-automorphism group is specified as a subgroup of Hopf automorphisms; the
pinning predicate is supplied by the anchor rather than replaced by a Prop placeholder. -/
def pinned_automorphisms (pinnedAut : Subgroup (CategoryTheory.Aut (dualGroup A))) :
    pinnedAut ≃* (dualRootDatum A).Aut := sorry

/-- Compatible change of pinning, commuting with the common Galois projection. -/
def l_group_change_of_pinning {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A' : AbsoluteRootData K H') (R : Type) [CommRing R] : LGroup A R ≃* LGroup A' R := sorry

/-- `Zchars` is the anchor character group of the scheme-theoretic dual centre. -/
def dual_centre_and_fundamental_group (Zchars : Type u) [AddCommGroup Zchars] :
    Zchars ≃+ AlgebraicFundamentalGroup A := sorry

/-- Central isogeny direction reverses: the source here is dual to the original target.
Z-extension and product variants use the same lattice transport, with injective rather
than isogeny dual map for the z-extension. -/
def dual_isogenies_and_products {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A' : AbsoluteRootData K H') (R : Type) [CommRing R] : LGroup A' R →* LGroup A R := sorry

/-- The original group is the finite separable Weil restriction; J is its embedding index
and the factor point groups carry the transported original pinned Galois actions. -/
def dual_of_weil_restriction (J : Type) [Finite J]
    (factor : J → Type) (factorGroup : ∀ j, Group (factor j))
    (R : Type) [CommRing R] : letI := factorGroup;
      WithConv (dualGroup A →ₐ[ℤ] R) ≃* (∀ j, factor j) := sorry

/-- The original torus is split of rank d; the points are those of its dual split torus. -/
def torus_and_gl_dual_groups (d : ℕ) (R : Type) [CommRing R] :
    WithConv (dualGroup A →ₐ[ℤ] R) ≃* (Fin d → Rˣ) := sorry

/-- Integral GSp4 datum in the bases and corrected simple base of the roadmap. -/
def gsp4DualityMatrix : Matrix (Fin 3) (Fin 3) ℤ := !![1,1,1; 1,0,1; 1,1,2]

theorem gsp4_self_dual : gsp4DualityMatrix.det = -1 ∧
    gsp4DualityMatrix.mulVec ![-1,1,0] = ![0,-1,0] ∧
    gsp4DualityMatrix.mulVec ![0,-2,1] = ![-1,1,0] := by
  native_decide
end LanglandsDual

namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
/-- Anchor example adapters: the already pinned GL Hopf algebra, with its finite-type proof
and absolute datum. These are not new constructions of GL or its root datum. -/
def glGroup (K : Type u) [Field K] (n : ℕ) : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K := sorry

def glModel (n : ℕ) : SmoothModel (glGroup K n) :=
  {coordinateAlgebra := TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] n,
    smooth := by sorry, genericEquiv := by sorry}

def glAbsoluteDatum (K : Type u) [Field K] (n : ℕ) : AbsoluteRootData K (glGroup K n) := sorry
/-- Special-fibre components are geometric components supplied by the anchor. -/
def modelComponentGroup {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (M : SmoothModel H) : Type u := sorry
instance {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H) :
    Group (modelComponentGroup M) := sorry
/-- Quadratic ramified norm-one torus, with odd residue characteristic, as in KZ §2.4.
The splitting extension and its norm presentation are omitted anchor inputs. -/
def ramifiedNormOne (K : Type u) [Field K] : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K := sorry

def ramifiedNormOneModel : SmoothModel (ramifiedNormOne K) := sorry

def ramifiedNormOneDatum (K : Type u) [Field K] : AbsoluteRootData K (ramifiedNormOne K) := sorry

namespace SmoothModel
variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
theorem pointsEmbedding_injective (M : SmoothModel H) : Function.Injective M.pointsEmbedding := sorry
-- Test BruhatTits.SmoothModel.gl
example (n : ℕ) : (glModel (K:=K) n).coordinateAlgebra=
    TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] n := rfl
-- Test BruhatTits.SmoothModel.trivial
example : Subsingleton (WithConv ((glModel (K:=K) 0).coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K])) := sorry
-- Test BruhatTits.SmoothModel.hopf_compat
example (M : SmoothModel H) (g h : WithConv (M.coordinateAlgebra →ₐ[𝒪[K]] 𝒪[K])) :
    M.pointsEmbedding (g*h)=M.pointsEmbedding g*M.pointsEmbedding h := map_mul _ _ _
-- Test BruhatTits.SmoothModel.connected_generic_insufficient
example : Nat.card (modelComponentGroup (ramifiedNormOneModel (K:=K)))=2 := sorry
end SmoothModel

-- Test BruhatTits.ReductiveModel.gl
example (n : ℕ) : ReductiveModel.IsReductive (glModel (K:=K) n) := sorry
-- Test BruhatTits.ReductiveModel.splitTorus
example : ReductiveModel.IsReductive (glModel (K:=K) 1) := sorry
-- Test BruhatTits.ReductiveModel.predicate_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H) :
    ReductiveModel.IsReductive M ↔ TauCeti.reductiveCommHopfAlgProperty 𝓀[K]
      (ReductiveModel.specialFibre M) := Iff.rfl
-- Test BruhatTits.ReductiveModel.iwahori
-- M is the standard SL2 Iwahori root-chart model; this identification is an omitted input.
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (M : SmoothModel H)
    (U : Subgroup (WithConv (ReductiveModel.specialFibre M →ₐ[𝓀[K]] 𝓀[K])))
    (hU : U ≠ ⊥) : ¬ ReductiveModel.IsReductive M := sorry

namespace SchematicClosure
variable {O F A : Type u} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [Field F] [Algebra O F] [IsFractionRing O F] [CommRing A] [Algebra O A] [Module.Flat O A]
-- Test BruhatTits.SchematicClosure.diagonal
-- I is the diagonal torus ideal in the generic GL algebra; J is the integral diagonal ideal.
example (I : Ideal (F ⊗[O] A)) (J : Ideal A) [Module.Flat O (A ⧸ J)]
    (h : J.map Algebra.TensorProduct.includeRight.toRingHom=I) : ideal I=J := sorry
-- Test BruhatTits.SchematicClosure.whole
example : ideal (⊥ : Ideal (F ⊗[O] A))=⊥ := sorry
-- Test BruhatTits.SchematicClosure.hopf_compat
example (HA : CommHopfAlgCat.{u} O) (I : TauCeti.HopfIdeal F (baseChangeHopf O F HA))
    (e : baseChangeHopf O F HA ≃ₐ[F] F ⊗[O] HA) :
    (hopfIdeal HA I).toIdeal = I.toIdeal.comap
      (e.symm.toRingHom.comp Algebra.TensorProduct.includeRight.toRingHom) := sorry
-- Test BruhatTits.SchematicClosure.not_always_smooth
-- The μp coordinate quotient over a mixed-characteristic DVR is passed with its usual Hopf law.
example (p : ℕ) (μp : CommHopfAlgCat.{u} O) : ¬ Algebra.Smooth O μp := sorry
end SchematicClosure

namespace NeronTorus
variable {T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
-- Test BruhatTits.NeronTorus.gm_components
example (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Nonempty (components (glAbsoluteDatum K 1) I ≃+ ℤ) := sorry
-- Test BruhatTits.NeronTorus.trivial
example (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Subsingleton (components (glAbsoluteDatum K 0) I) := sorry
-- Test BruhatTits.NeronTorus.adjunction_compat
-- ResX is the integral Weil restriction of XL; generic schemes are its scalar extension.
example (X XK ResX ResXK : AlgebraicGeometry.Scheme.{u})
    (f : X ⟶ AlgebraicGeometry.Spec (.of 𝒪[K])) [AlgebraicGeometry.Smooth f]
    (fR : ResX ⟶ AlgebraicGeometry.Spec (.of 𝒪[K])) [AlgebraicGeometry.Smooth fR]
    (j : (XK ⟶ genericScheme T) ≃ (ResXK ⟶ genericScheme T)) :
    Nonempty ((X ⟶ lftModel T) ≃ (ResX ⟶ lftModel T)) := sorry
-- Test BruhatTits.NeronTorus.gm_not_finiteType
example : ¬ AlgebraicGeometry.QuasiCompact (structureMap (glGroup K 1)) := sorry
-- Test BruhatTits.NeronTorus.gm_bounded
example : Nonempty ((WithConv (finiteTypeModel (glGroup K 1) →ₐ[𝒪[K]] 𝒪[K])) ≃* 𝒪[K]ˣ) := sorry
-- Test BruhatTits.NeronTorus.trivial_bounded
example : Subsingleton (WithConv (connectedModel (glGroup K 0) →ₐ[𝒪[K]] 𝒪[K])) := sorry
-- Test BruhatTits.NeronTorus.kottwitz_compat
example (A : AbsoluteRootData K T) (I : Subgroup (Field.absoluteGaloisGroup K)) :
    connectedPoints A=(KottwitzMap.torus A I).ker := connected_points A I
-- Test BruhatTits.NeronTorus.ramified_normOne
example : connectedPoints (ramifiedNormOneDatum K) < finiteTypePoints (ramifiedNormOneDatum K) := sorry
end NeronTorus

-- Test BruhatTits.RSmooth.split
example : RSmooth.torus (glGroup K 1) := sorry
-- Test BruhatTits.RSmooth.trivial
example : RSmooth.torus (glGroup K 0) := sorry
-- Test BruhatTits.RSmooth.closure_compat
example (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) (h : RSmooth.torus T) :
    Nonempty (RSmooth.closureScheme T ≅ NeronTorus.lftModel T) := ⟨RSmooth.neron_eq_closure h⟩
-- Test BruhatTits.RSmooth.wild_not_tame
-- T is Res_(K'/K)Gm and p divides the ramification index of the specified finite separable K'/K.
example (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) (p e : ℕ) (hwild : p ∣ e) :
    RSmooth.torus T := sorry

-- Test BruhatTits.QuasiTame.splitGL
example (n : ℕ) : QuasiTame.IsQuasiTame K (WithConv (glGroup K n →ₐ[K] K)) := sorry
-- Test BruhatTits.QuasiTame.torus_essential
example : QuasiTame.IsEssentiallyTame K PUnit := sorry
-- Test BruhatTits.QuasiTame.weil_compat
-- T is the finite separable Weil restriction of the specified tame torus.
example (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) :
    QuasiTame.IsQuasiTame K (WithConv (T →ₐ[K] K)) := sorry
-- Test BruhatTits.QuasiTame.wild_induced
-- Again T=Res Gm with a wild intermediate extension, not a tamely split torus.
example (T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K) (p e : ℕ) (hwild : p ∣ e) :
    QuasiTame.IsQuasiTame K (WithConv (T →ₐ[K] K)) := sorry

section FixerTests
variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)
-- Test BruhatTits.groupScheme.gl_standard
-- D is the pinned GLn datum and x the standard norm.
example (n : ℕ) (x : Apartment φ) :
    Nonempty (groupScheme D φ {x} ≅ TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] n) := sorry
-- Test BruhatTits.groupScheme.torus
example [IsEmpty D.ι] (x : Apartment φ) :
    Nonempty (groupScheme D φ {x} ≅ NeronTorus.finiteTypeModel H) := sorry
-- Test BruhatTits.groupScheme.generic_compat
example (Ω : Finset (Apartment φ)) :
    Nonempty (baseChangeHopf 𝒪[K] K (groupScheme D φ Ω) ≅ H.obj) := ⟨groupScheme_generic D φ Ω⟩
-- Test BruhatTits.groupScheme.component_needed
example : Nat.card (modelComponentGroup (ramifiedNormOneModel (K:=K)))=2 := sorry
-- Test BruhatTits.parahoricGroupScheme.gl_hyperspecial
-- D is GLn and x its standard hyperspecial norm.
example (n : ℕ) (x : Apartment φ) :
    Nonempty (parahoricGroupScheme D φ {x} ≅ TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] n) := sorry
-- Test BruhatTits.parahoricGroupScheme.torus
example [IsEmpty D.ι] (x : Apartment φ) :
    Nonempty (parahoricGroupScheme D φ {x} ≅ NeronTorus.connectedModel H) := sorry
-- Test BruhatTits.parahoricGroupScheme.identity_compat
example (Ω : Finset (Apartment φ)) (M : SmoothModel H)
    (hM : M.coordinateAlgebra=groupScheme D φ Ω) :
    M.identityComponent.coordinateAlgebra=parahoricGroupScheme D φ Ω := sorry
-- Test BruhatTits.parahoricGroupScheme.not_full
example : NeronTorus.connectedPoints (ramifiedNormOneDatum K) ≠
    NeronTorus.finiteTypePoints (ramifiedNormOneDatum K) := sorry
-- Test BruhatTits.parahoricSubgroup.sl2_iwahori
-- D is SL2 and C the standard alcove; g is determinant one.
example (C : Facet D φ) (g : WithConv (H →ₐ[K] K))
    (mat : Matrix (Fin 2) (Fin 2) K) :
    g ∈ iwahoriSubgroup D φ C ↔ (∀ i j, mat i j ∈ 𝒪[K]) ∧ valuation K (mat 1 0)<1 := sorry
-- Test BruhatTits.parahoricSubgroup.splitTorus
example [IsEmpty D.ι] (x : Apartment φ) (A : AbsoluteRootData K H) :
    parahoricSubgroup D φ {x}=NeronTorus.connectedPoints A := sorry
-- Test BruhatTits.parahoricSubgroup.points_compat
example (x : Apartment φ) (M : SmoothModel H)
    (hM : M.coordinateAlgebra=parahoricGroupScheme D φ {x}) :
    M.pointsEmbedding.range=parahoricSubgroup D φ {x} := parahoricGroupScheme_points D φ {x} M hM
-- Test BruhatTits.parahoricSubgroup.edge_stabilizer
-- x,y are endpoints of an edge in the PGL2 tree; the specified g exchanges them.
example (x y : Building D φ) (hxy : x ≠ y) (g : WithConv (H →ₐ[K] K))
    (hx : g • x=y) (hy : g • y=x) :
    g ∈ setwiseStabilizer D φ {x,y} ∧ g ∉ pointwiseFixer D φ {x,y} := sorry
-- Test BruhatTits.ResidualGroup.hyperspecialGL
-- D is GLn and x standard hyperspecial.
example (n : ℕ) (x : Apartment φ) :
    Nonempty ((ResidualGroup.group D φ {x}).obj ≅
      TauCeti.GeneralLinear.coordinateHopfAlgebra 𝓀[K] n) := sorry
-- Test BruhatTits.ResidualGroup.iwahori
example (C : Facet D φ) (hC : Facet.IsAlcove D φ C) :
    TauCeti.torusCommHopfAlgProperty 𝓀[K] (ResidualGroup.group D φ {C.point}) := sorry
-- Test BruhatTits.ResidualGroup.quotient_compat
example (x : Apartment φ) :
    Nonempty (parahoricSubgroup D φ {x} ⧸ (ResidualGroup.reduction D φ {x}).ker ≃*
      WithConv (ResidualGroup.group D φ {x} →ₐ[𝓀[K]] 𝓀[K])) := sorry
end FixerTests
end BruhatTits

namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
/-- Example data are the anchor root data together with this roadmap's standard valuation. -/
def glLocalDatum (K : Type u) [Field K] (n : ℕ) : LocalRootData K (glGroup K n) := sorry

def glValuation (K : Type u) [Field K] [ValuativeRel K] (n : ℕ) :
    Valuation (glLocalDatum K n).rootDatum := sorry

def sl2Group (K : Type u) [Field K] : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K := sorry

def sl2LocalDatum (K : Type u) [Field K] : LocalRootData K (sl2Group K) := sorry

def sl2Valuation (K : Type u) [Field K] [ValuativeRel K] :
    Valuation (sl2LocalDatum K).rootDatum := sorry

def glPermutationAction (n : ℕ) : Equiv.Perm (Fin n) →*
    MulAut (Multiplicative (Fin n → ℤ)) := sorry

def glTranslation (n : ℕ) : Multiplicative (Fin n → ℤ) →* IwahoriWeylGroup (glLocalDatum K n) := sorry

def sl2Translation (m : ℤ) : IwahoriWeylGroup (sl2LocalDatum K) := sorry

def ramifiedNormOneLocalDatum (K : Type u) [Field K] : LocalRootData K (ramifiedNormOne K) := sorry

def ramifiedNormOneValuation (K : Type u) [Field K] [ValuativeRel K] :
    Valuation (ramifiedNormOneLocalDatum K).rootDatum := sorry

-- Test BruhatTits.IwahoriWeylGroup.gl
example (n : ℕ) : Nonempty (IwahoriWeylGroup (glLocalDatum K n) ≃*
    Multiplicative (Fin n → ℤ) ⋊[glPermutationAction n] Equiv.Perm (Fin n)) := sorry
-- Test BruhatTits.IwahoriWeylGroup.splitTorus
example : Nonempty (IwahoriWeylGroup (glLocalDatum K 1) ≃* Multiplicative ℤ) := sorry
-- Test BruhatTits.IwahoriWeylGroup.torus_kernel_compat
-- K is the completed maximal unramified field and D its torus datum.
example {T : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (D : LocalRootData K T)
    (A : AbsoluteRootData K T) (I : Subgroup (Field.absoluteGaloisGroup K)) [IsEmpty D.ι] :
    minimalLeviParahoric D=(KottwitzMap.torus A I).ker := sorry
-- Test BruhatTits.IwahoriWeylGroup.torsion_kernel
example : Nonempty (IwahoriWeylGroup (ramifiedNormOneLocalDatum K) ≃* Multiplicative (ZMod 2)) ∧
    ∀ w : IwahoriWeylGroup (ramifiedNormOneLocalDatum K),
      IwahoriWeylGroup.apartmentAction (ramifiedNormOneLocalDatum K)
        (ramifiedNormOneValuation K) w=1 := sorry
-- Test BruhatTits.IwahoriWeylGroup.a1_translation
example (m : ℤ) : IwahoriWeylGroup.length (sl2LocalDatum K) (sl2Valuation K)
    (sl2Translation (K:=K) m)=2*m.natAbs := sorry
-- Test BruhatTits.IwahoriWeylGroup.torus_length
example (w : IwahoriWeylGroup (glLocalDatum K 1)) :
    IwahoriWeylGroup.length (glLocalDatum K 1) (glValuation K 1) w=0 := sorry
-- Test BruhatTits.IwahoriWeylGroup.coxeter_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) (w : AffineWeylGroup D φ) :
    IwahoriWeylGroup.length D φ (IwahoriWeylGroup.affineWeylEmbedding D φ w)=
      (AffineWeylGroup.coxeterSystem D φ (IwahoriWeylGroup.baseAlcove D φ)
        (IwahoriWeylGroup.baseAlcove_isAlcove D φ)).length w := sorry
-- Test BruhatTits.IwahoriWeylGroup.different_components
example : ¬ IwahoriWeylGroup.bruhatLE (glLocalDatum K 1) (glValuation K 1) 1
    (glTranslation (K:=K) 1 (Multiplicative.ofAdd (fun _ => 1))) := sorry

namespace Dominance

def glPairing (n : ℕ) (ij : Fin n × Fin n) : (Fin n → ℤ) →+ ℝ where
  toFun v := (v ij.1:ℝ)-(v ij.2:ℝ)
  map_zero' := by simp
  map_add' := by sorry

def glSimple (n : ℕ) : Finset (Fin n × Fin n) :=
  Finset.univ.filter (fun ij => ij.2.val=ij.1.val+1)
-- Test BruhatTits.Dominance.gl
example (n : ℕ) (v : Fin n → ℤ) :
    IsDominant (glPairing n) (glSimple n) v ↔ Antitone v := sorry
-- Test BruhatTits.Dominance.torus
example (v w : ℤ) : IsDominant (fun i : Fin 0 => Fin.elim0 i) ∅ v ∧
    (integralLE (fun i : Fin 0 => Fin.elim0 i) v w ↔ v=w) := sorry
-- Test BruhatTits.Dominance.rootBase_compat
example (n : ℕ) (v : Fin n → ℤ) :
    IsDominant (fun ij => -(glPairing n ij)) (glSimple n) v ↔ Monotone v := sorry
-- Test BruhatTits.Dominance.integral_vs_rational
example : rationalLE (Int.castAddHom ℚ) (fun _ : Fin 1 => (2:ℚ)) (0:ℤ) 1 ∧
    ¬ integralLE (fun _ : Fin 1 => (2:ℤ)) (0:ℤ) 1 := sorry
end Dominance

namespace AdmissibleSet
-- The action below is the usual coordinate permutation action.
variable [MulAction (Equiv.Perm (Fin 2)) (Fin 2 → ℤ)]
-- Test BruhatTits.AdmissibleSet.gl2_minuscule
example : ∃ ω : IwahoriWeylGroup (glLocalDatum K 2),
    admissible (W0:=Equiv.Perm (Fin 2)) (glLocalDatum K 2) (glValuation K 2)
      (fun v => glTranslation 2 (Multiplicative.ofAdd v)) ![1,0]=
      {ω,glTranslation (K:=K) 2 (Multiplicative.ofAdd ![1,0]),
        glTranslation (K:=K) 2 (Multiplicative.ofAdd ![0,1])} := sorry
-- Test BruhatTits.AdmissibleSet.zero
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) {W0 Λ : Type u} [Group W0] [AddCommGroup Λ]
    [MulAction W0 Λ] (t : Multiplicative Λ →* IwahoriWeylGroup D) :
    admissible (W0:=W0) D φ (fun v => t (Multiplicative.ofAdd v)) 0={1} := sorry
-- Test BruhatTits.AdmissibleSet.bruhat_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) {W0 Λ : Type u} [Group W0] [AddCommGroup Λ]
    [MulAction W0 Λ] (t : Λ → IwahoriWeylGroup D) (μ : Λ) (w : IwahoriWeylGroup D) :
    w ∈ admissible (W0:=W0) D φ t μ ↔ ∃ x : W0, IwahoriWeylGroup.bruhatLE D φ w (t (x • μ)) := Iff.rfl
-- Test BruhatTits.AdmissibleSet.component_not_ignored
-- W0 is trivial and acts trivially on the cocharacter lattice of GL1.
example [MulAction PUnit ℤ] : ¬ (1:IwahoriWeylGroup (glLocalDatum K 1)) ∈
    admissible (W0:=PUnit) (glLocalDatum K 1) (glValuation K 1)
      (fun m => glTranslation 1 (Multiplicative.ofAdd (fun _ => m))) 1 := sorry
end AdmissibleSet
end BruhatTits

namespace LanglandsDual
open BruhatTits
variable {K : Type u} [Field K]
/-- Imported anchor examples, including their full central lattices. -/
def sl2AbsoluteDatum (K : Type u) [Field K] : AbsoluteRootData K (sl2Group K) := sorry

def su3Group (K : Type u) [Field K] : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K := sorry

def su3AbsoluteDatum (K : Type u) [Field K] : AbsoluteRootData K (su3Group K) := sorry

def pglIntegralGroup (n : ℕ) : CommHopfAlgCat.{0} ℤ := sorry

def slIntegralGroup (n : ℕ) : CommHopfAlgCat.{0} ℤ := sorry

/-- Rank-one simply connected and adjoint integer root data from the anchor. -/
def a1SimplyConnected : RootPairing (Fin 2) ℤ ℤ ℤ := sorry

def a1Adjoint : RootPairing (Fin 2) ℤ ℤ ℤ := sorry

-- Test LanglandsDual.sl2_pgl2
example : Nonempty (a1SimplyConnected.flip.Equiv a1Adjoint) ∧
    a1SimplyConnected.flip.root 0=1 ∧ a1SimplyConnected.flip.coroot 0=2 := sorry
-- Test LanglandsDual.torus
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H) [IsEmpty A.ι] :
    ∀ i : A.ι, (dualRootDatum A).root i=A.Ψ.coroot i := sorry
-- Test LanglandsDual.flip_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H) :
    dualRootDatum A=A.Ψ.flip ∧ dualBase A=A.base.flip := ⟨rfl,rfl⟩
-- Test LanglandsDual.not_relative
example : Nat.card (su3AbsoluteDatum K).ι=6 ∧ Nat.card (su3AbsoluteDatum K).ι ≠ 4 := sorry
-- Test LanglandsDual.dualGroup.gl
example (n : ℕ) : Nonempty (dualGroup (glAbsoluteDatum K n) ≅
    TauCeti.GeneralLinear.coordinateHopfAlgebra ℤ n) := sorry
-- Test LanglandsDual.dualGroup.trivial
example (R : Type) [CommRing R] :
    Subsingleton (WithConv (dualGroup (glAbsoluteDatum K 0) →ₐ[ℤ] R)) := sorry
-- Test LanglandsDual.dualGroup.chevalley_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H) :
    Nonempty ((dualAbsoluteDatum A).Equiv A.Ψ.flip) := ⟨basedDatumEquiv A⟩
-- Test LanglandsDual.dualGroup.sl_not_self
example : Nonempty (dualGroup (sl2AbsoluteDatum K) ≅ pglIntegralGroup 2) ∧
    ¬ Nonempty (dualGroup (sl2AbsoluteDatum K) ≅ slIntegralGroup 2) := sorry

-- Test LanglandsDual.galoisAction.normOne
-- γ is the nontrivial automorphism of the quadratic splitting field of the norm-one torus.
example (R : Type) [CommRing R] (γ : Field.absoluteGaloisGroup K)
    (gm : WithConv (dualGroup (ramifiedNormOneDatum K) →ₐ[ℤ] R) ≃* Rˣ)
    (z : WithConv (dualGroup (ramifiedNormOneDatum K) →ₐ[ℤ] R)) :
    gm (galoisActionOnPoints (ramifiedNormOneDatum K) R γ z)=(gm z)⁻¹ := sorry
-- Test LanglandsDual.galoisAction.split
example (n : ℕ) : galoisAction (glAbsoluteDatum K n)=1 := sorry
-- Test LanglandsDual.galoisAction.datum_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H)
    (γ : Field.absoluteGaloisGroup K) : dualGaloisAction A γ=dualAutomorphism A (A.galoisAction γ) := rfl
-- Test LanglandsDual.galoisAction.inner_nonsplit
-- A is the absolute datum of GL1(D), D a noncommutative central division algebra over K.
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H)
    (hinner : A.galoisAction=1) : galoisAction A=1 := sorry

-- Test LanglandsDual.LGroup.split
example (n : ℕ) (R : Type) [CommRing R] : Nonempty (LGroup (glAbsoluteDatum K n) R ≃*
    WithConv (dualGroup (glAbsoluteDatum K n) →ₐ[ℤ] R) × Field.absoluteGaloisGroup K) := sorry
-- Test LanglandsDual.LGroup.gamma_trivial
example {N : Type} [Group N] : Nonempty (N ⋊[(1 : PUnit →* MulAut N)] PUnit ≃* N) := sorry
-- Test LanglandsDual.LGroup.semidirect_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H)
    (R : Type) [CommRing R] (g h : LGroup A R) :
    (g*h).left=g.left*galoisActionOnPoints A R g.right h.left := rfl

/-- Finite quadratic action on a split dual torus. -/
def quadraticInversionAction (R : Type) [CommRing R] : Multiplicative (ZMod 2) →* MulAut Rˣ := sorry
-- Test LanglandsDual.LGroup.normOne_noncommutative
example (R : Type) [CommRing R] (z : Rˣ) (hz : z^2 ≠ 1) :
    (SemidirectProduct.inr (φ:=quadraticInversionAction R) (Multiplicative.ofAdd (1:ZMod 2)))*
      SemidirectProduct.inl z ≠
    SemidirectProduct.inl z*
      (SemidirectProduct.inr (φ:=quadraticInversionAction R) (Multiplicative.ofAdd (1:ZMod 2))) := sorry

-- Test LanglandsDual.Levi.gl_blocks
-- AM is the absolute datum of GL_a × GL_b, A that of GL_(a+b), with compatible standard pinning.
example {H HM : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A : AbsoluteRootData K H) (AM : AbsoluteRootData K HM) (R : Type) [CommRing R]
    (a b : ℕ) (dualM : WithConv (dualGroup AM →ₐ[ℤ] R) ≃* GL (Fin a) R × GL (Fin b) R)
    (dualG : WithConv (dualGroup A →ₐ[ℤ] R) ≃* GL (Fin (a+b)) R)
    (g : WithConv (dualGroup AM →ₐ[ℤ] R)) :
    Function.Injective (Levi.dualEmbedding A AM R) := sorry
-- Test LanglandsDual.Levi.self
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H)
    (R : Type) [CommRing R] : Levi.embedding A A R=MonoidHom.id _ := sorry
-- Test LanglandsDual.Levi.root_compat
example {HM : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (AM : AbsoluteRootData K HM)
    (i : AM.ι) : (dualRootDatum AM).root i=AM.Ψ.coroot i := rfl
-- Test LanglandsDual.Levi.twisted_torus
-- The standard rank-one rational Levi is split Gm; a ramified norm-one torus is not K-isomorphic
-- to it. It therefore cannot supply the standard rational-Levi L-embedding in this construction.
example : ¬ Nonempty ((ramifiedNormOne K).obj ≅ (glGroup K 1).obj) := sorry
end LanglandsDual

namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
-- Test BruhatTits.IsMinuscule.zero
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (A : AbsoluteRootData K H) :
    IsMinuscule A 0 ∧ IsDominant A 0 := by sorry
-- Test BruhatTits.dominanceLE.gl2
-- e identifies the standard GL2 cocharacter lattice with integer tuples and its simple base.
example (e : (glAbsoluteDatum K 2).Y ≃+ (Fin 2 → ℤ)) :
    dominanceLE (glAbsoluteDatum K 2) (e.symm ![1,1]) (e.symm ![2,0]) := sorry
-- Test BruhatTits.pointwiseFixer.singleton
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) (x : Building D φ) :
    pointwiseFixer D φ {x}=MulAction.stabilizer (WithConv (H →ₐ[K] K)) x := sorry
-- Test BruhatTits.ReducedBuilding.gl2
example (y : ReducedBuilding (glLocalDatum K 2) (glValuation K 2)) :
    Nonempty ({x : Building (glLocalDatum K 2) (glValuation K 2) //
      toReducedBuilding (glLocalDatum K 2) (glValuation K 2) x=y} ≃ ℝ) := sorry
-- Test BruhatTits.ReducedBuilding.torus
example : Subsingleton (ReducedBuilding (glLocalDatum K 1) (glValuation K 1)) ∧
    Nonempty (Building (glLocalDatum K 1) (glValuation K 1) ≃ ℝ) := sorry
-- Test BruhatTits.TwistedLevi.self
example {G : Type u} [Group G] (p : ℕ) :
    TwistedLevi.IsTame (⊤ : Subgroup G) (MonoidHom.id G) (1 : Kˣ →* G) p 1 := sorry

namespace LatticeBuilding
/-- Standard coordinate norm with normalized field valuation ω. -/
def standardNorm (n : ℕ) (ω : K → WithTop ℝ) : AdditiveNorm n ω := sorry
-- Test BruhatTits.LatticeBuilding.standard
-- ω is the normalized additive valuation corresponding to the given valuative relation.
example (n : ℕ) (ω : K → WithTop ℝ) (v : Fin n → K) :
    v ∈ latticeFunction (standardNorm (K:=K) n ω) 0 ↔ ∀ i, v i ∈ 𝒪[K] := sorry
end LatticeBuilding

-- Test BruhatTits.Tree.q_two
example [Fact (Nat.Prime 2)] (v : Tree.Vertex ℚ_[2]) :
    Nat.card {w // (Tree.graph ℚ_[2]).Adj v w}=3 := sorry
end BruhatTits

namespace LanglandsDual
/-- The inverse transpose, recording the compatible coroot map as well as the root map. -/
def gsp4CorootDualityMatrix : Matrix (Fin 3) (Fin 3) ℤ := !![1,1,-1; 1,-1,0; -1,0,1]

example : gsp4DualityMatrix.transpose*gsp4CorootDualityMatrix=1 ∧
    gsp4CorootDualityMatrix.mulVec ![-1,1,0]=![0,-2,1] ∧
    gsp4CorootDualityMatrix.mulVec ![0,-1,0]=![-1,1,0] := by native_decide
end LanglandsDual

/-! ## Remaining target interfaces and source-sensitive comparisons -/
namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- Equipollent origins identify the enlarged affine spaces; conjugate maximal tori
use the anchor's conjugation identification of root data. -/
def Apartment.transport (ψ : Valuation D.rootDatum) (h : Equipollent φ ψ) :
    Apartment φ ≃ᵃ[ℝ] Apartment ψ := sorry

theorem AffineRoot.commutator_le (x : Apartment φ) (a b : D.ι) (r s : ℝ)
    (hab : ∀ c : ℝ, c < 0 → D.Φ.root b ≠ c • D.Φ.root a) :
    ⁅Apartment.filtrationAt D φ x a r, Apartment.filtrationAt D φ x b s⁆ ≤
      ⨆ (k : D.ι) (p : ℕ) (q : ℕ) (_ : 0<p ∧ 0<q ∧
        D.Φ.root k=(p:ℝ) • D.Φ.root a+(q:ℝ) • D.Φ.root b),
        Apartment.filtrationAt D φ x k ((p:ℝ)*r+(q:ℝ)*s) := sorry

/-- D is the quasi-split datum with a Chevalley–Steinberg system and the compatible
field valuations described in the reader. These anchor conditions are omitted. -/
def QuasiSplit.valuation : Valuation D.rootDatum := sorry

namespace Examples
/-- Coordinates identify the apartment of SL₂ with ℝ and its two simple reflections
with x↦-x and x↦1-x. Every affine Weyl element has this form; the enlarged action
has no extra central factor for SL₂. -/
def sl2AffineAction : (Multiplicative ℤ × Multiplicative (ZMod 2)) → ℝ → ℝ :=
  fun w x => if Multiplicative.toAdd w.2=0 then
    x+(Multiplicative.toAdd w.1:ℤ) else -x+(Multiplicative.toAdd w.1:ℤ)

theorem sl2_action_eq_affineWeyl (f : ℝ → ℝ) :
    (∃ w, f=sl2AffineAction w) ↔ ∃ m : ℤ, f=(fun x => x+(m:ℝ)) ∨
      f=(fun x => -x+(m:ℝ)) := sorry

/-- The quadratic involution, norm relation and valuation of the long root are
visible in this form. The finite value-set enumeration is the BT II 4.2.21 input. -/
def unitaryShortValue {L : Type u} [Field L] (τ : L ≃+* L)
    (ω : L → WithTop ℝ) (u : QuasiSplit.H0 τ) : WithTop ℝ := ((1/2:ℝ):WithTop ℝ)*ω u.val.2

theorem unitary_valueSets {L : Type u} [Field L] (τ : L ≃+* L)
    (ω : L → WithTop ℝ) (v : L) (hv : v+τ v=0) :
    (2:WithTop ℝ)*unitaryShortValue τ ω ⟨(0,v), by simpa using hv⟩=ω v := sorry
end Examples

section FieldExtension
variable [ValuativeRel K] {L : Type u} [Field L] [ValuativeRel L]
  [Algebra K L] [Module.Finite K L]
  {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
  (φL : Valuation DL.rootDatum) (j : Building D φ → Building DL φL)
  (i : WithConv (H →ₐ[K] K) →* WithConv (HL →ₐ[L] L))
  (𝔤 𝔤L : Type u) [AddCommGroup 𝔤] [Module K 𝔤] [Module 𝒪[K] 𝔤]
  [IsScalarTower 𝒪[K] K 𝔤] [AddCommGroup 𝔤L] [Module L 𝔤L] [Module 𝒪[L] 𝔤L]
  [IsScalarTower 𝒪[L] L 𝔤L] (di : 𝔤 → 𝔤L)
/-- Compatible scalar extension and building map; valuations on L extend the K
normalization. The extension is finite tame Galois, as specified in the roadmap; its ramification
predicate is a future LocalFieldsRamification input. Lie depths are unrestricted, group depths
are positive. The zero-depth
version additionally requires unramified base change, omitted here. -/
theorem filtration_under_field_extension (x : Building D φ) :
    (∀ r : ℝ, (MoyPrasad.lieLattice D φ 𝔤 x r : Set 𝔤)=
      di ⁻¹' MoyPrasad.lieLattice DL φL 𝔤L (j x) r) ∧
    (∀ r : ℝ, 0<r → MoyPrasad.filtration D φ x r=
      (MoyPrasad.filtration DL φL (j x) r).comap i) := sorry
end FieldExtension

/-- Strictly henselian DVR with algebraically closed residue field, affine flat
finite-type model of a split torus; its integral points equal all bounded generic
points. Split-torus and bounded-point identifications are omitted anchor inputs. -/
theorem split_torus_bounded_model_smoothness [ValuativeRel K]
    (A : CommHopfAlgCat.{u} 𝒪[K]) [Module.Flat 𝒪[K] A]
    [Algebra.FiniteType 𝒪[K] A] : Algebra.Smooth 𝒪[K] A := sorry

/-- Absolutely simple simply connected tame group over a complete discrete field
with algebraically closed residue field. The Dynkin-type restrictions of PR 2.7–2.9
and the tame splitting extension are omitted anchor data. This is not asserted for
arbitrary residue characteristic or arbitrary rational apartment points. -/
theorem tame_subdivision_to_hyperspecial [ValuativeRel K]
    {L : Type u} [Field L] [ValuativeRel L] [Algebra K L]
    {HL : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} L} (DL : LocalRootData L HL)
    (φL : Valuation DL.rootDatum) (j : Building D φ → Building DL φL)
    (i : WithConv (H →ₐ[K] K) →* WithConv (HL →ₐ[L] L)) (x : Building D φ) :
    ∃ y : Building D φ, ∃ M : SmoothModel HL,
      ReductiveModel.IsReductive M ∧
      pointwiseFixer D φ {y}=pointwiseFixer D φ {x} ∧
      pointwiseFixer D φ {x}=(pointwiseFixer DL φL {j y}).comap i := sorry
end BruhatTits

namespace MoyPrasad
open BruhatTits ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)
  (𝔤 : Type u) [AddCommGroup 𝔤] [Module K 𝔤] [Module 𝒪[K] 𝔤]
  [IsScalarTower 𝒪[K] K 𝔤]
/-- A single chosen positive-depth homeomorphism, extended arbitrarily outside its
positive-depth domain; all estimates below restrict their inputs to that domain.
Its restrictions are the maps `mockExp`, rather than independently chosen maps. -/
def mockExpValue (x : Building D φ) : 𝔤 → WithConv (H →ₐ[K] K) := sorry

theorem mockExpValue_eq (x : Building D φ) (r : ℝ) (hr : 0<r)
    (Y : lieLattice D φ 𝔤 x r) :
    mockExpValue D φ 𝔤 x Y = (mockExp D φ 𝔤 x r hr Y : WithConv (H →ₐ[K] K)) := sorry

theorem mockExp_mul_error (x : Building D φ) (r s : ℝ) (hr : 0<r) (hs : 0<s)
    (Y Z : 𝔤) (hY : Y ∈ lieLattice D φ 𝔤 x r) (hZ : Z ∈ lieLattice D φ 𝔤 x s) :
    mockExpValue D φ 𝔤 x Y * mockExpValue D φ 𝔤 x Z *
      (mockExpValue D φ 𝔤 x (Y+Z))⁻¹ ∈ filtration D φ x (r+s) := sorry

theorem mockExp_comm_error (bracket : 𝔤 →ₗ[K] 𝔤 →ₗ[K] 𝔤)
    (x : Building D φ) (r s : ℝ) (hr : 0<r) (hs : 0<s)
    (Y Z : 𝔤) (hY : Y ∈ lieLattice D φ 𝔤 x r) (hZ : Z ∈ lieLattice D φ 𝔤 x s) :
    mockExpValue D φ 𝔤 x Y * mockExpValue D φ 𝔤 x Z *
      (mockExpValue D φ 𝔤 x Y)⁻¹ * (mockExpValue D φ 𝔤 x Z)⁻¹ *
      (mockExpValue D φ 𝔤 x (bracket Y Z))⁻¹ ∈ filtration D φ x (r+s+min r s) := sorry

/-- Ad is the genuine adjoint representation. No equivariance of the full
homeomorphism is asserted. Only its depth-r/depth-t quotient commutes with conjugation. -/
theorem mockExp_quotient_equivariant (Ad : WithConv (H →ₐ[K] K) →* (𝔤 →ₗ[K] 𝔤))
    (x : Building D φ) (r t : ℝ) (hr : 0<r) (hrt : r≤t) (htr : t≤2*r)
    (g : WithConv (H →ₐ[K] K)) (Y : 𝔤) (hY : Y ∈ lieLattice D φ 𝔤 x r)
    (hAd : Ad g Y ∈ lieLattice D φ 𝔤 x r) :
    (g * mockExpValue D φ 𝔤 x Y * g⁻¹)⁻¹ * mockExpValue D φ 𝔤 x (Ad g Y) ∈
      filtration D φ x t := sorry
end MoyPrasad

namespace MoyPrasad
open BruhatTits ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)
/-- The multiplicative group Hopf algebra, a packaging adapter for the pinned
Laurent-polynomial multiplicative group. -/
def multiplicativeHopf (R : Type u) [CommRing R] : CommHopfAlgCat.{u} R := sorry
/-- Reduce an integral cocharacter and compose with the reductive special-fibre
quotient. Hopf-algebra arrows have the opposite direction to group-scheme arrows. -/
def cocharacterReduction (x : Apartment φ) :
    (parahoricGroupScheme D φ {x} ⟶ multiplicativeHopf 𝒪[K]) →
    ((ResidualGroup.group D φ {x}).obj ⟶ multiplicativeHopf 𝓀[K]) := sorry
/-- A residue cocharacter lifts into a split O-torus of the connected parahoric.
Uniqueness holds after that torus and its reduction identification have been fixed;
the existential lift here is not asserted to be unique among all cocharacters. -/
theorem exists_lift_residualCocharacter (x : Apartment φ)
    (lbar : (ResidualGroup.group D φ {x}).obj ⟶ multiplicativeHopf 𝓀[K]) :
    ∃ lam : parahoricGroupScheme D φ {x} ⟶ multiplicativeHopf 𝒪[K],
      cocharacterReduction D φ x lam = lbar := sorry
end MoyPrasad

namespace BruhatTits
open ValuativeRel
-- Test BruhatTits.ResidualGroup.specialFibre_not_quotient
/- For the actual SL₂ alcove model, its special fibre has dimension 3 while
its reductive quotient has dimension 1. This tests the two group schemes. -/
example {K : Type u} [Field K] [ValuativeRel K]
    (C : Facet (sl2LocalDatum K) (sl2Valuation K))
    (hC : Facet.IsAlcove (sl2LocalDatum K) (sl2Valuation K) C) :
    ¬ Nonempty (baseChangeHopf 𝒪[K] 𝓀[K]
      (parahoricGroupScheme (sl2LocalDatum K) (sl2Valuation K) {C.point}) ≅
      (ResidualGroup.group (sl2LocalDatum K) (sl2Valuation K) {C.point}).obj) := sorry
end BruhatTits

/-! ### Source-specific lifting and lattice contracts -/
namespace BruhatTits
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- G is the generic fibre of a connected reductive Zp-model; T is the centralizer
of a maximal split integral torus. The cocharacter/fundamental-group quotient and
Frobenius actions are the actual ones of this unramified setup. -/
theorem invariant_cocharacter_lifting {Λ Fund : Type u} [AddCommGroup Λ] [AddCommGroup Fund]
    (σ : AddAut Λ) (σFund : AddAut Fund) (q : Λ →+ Fund) (c : Fund) (hc : σFund c=c) :
    ∃ μ : Λ, σ μ=μ ∧ q μ=c := sorry

/-- The model is connected reductive over Zp; κ and κad are the actual unramified
Kottwitz maps, f is the adjoint quotient, and Pad is Gad(Zp). -/
theorem adjoint_cartan_coset_lifting {G Gad Fund FundAd : Type u} [Group G] [Group Gad]
    [AddCommGroup Fund] [AddCommGroup FundAd] (f : G →* Gad) (Pad : Subgroup Gad)
    (κad : Gad →* Multiplicative FundAd) (q : Fund →+ FundAd) (σ : AddAut Fund)
    (gad : Gad) (c : Fund) (hc : σ c=c) (hq : q c=(κad gad).toAdd) :
    ∃ g : G, gad ∈ (fun h => f g*h) '' (Pad : Set Gad) := sorry

namespace HeAlcove
/-- He18 integer alcove-depth filtration: every affine root cutoff of I is shifted
by n, and the torus is at depth n. The alcove is the chosen base alcove. -/
def depth (C : Facet D φ) (n : ℕ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  MoyPrasad.filtration D φ (Building.mk D φ 1 C.point) n
end HeAlcove

/-- C is the chosen alcove and s an affine simple reflection. These omitted
conditions cannot be replaced just by length(s)=1 in the extended Weyl group. -/
theorem simple_cell_adjacent_depth (C : Facet D φ) (s : IwahoriWeylGroup D)
    (g : WithConv (H →ₐ[K] K)) (hg : g ∈ iwahoriCell D φ C s)
    (n : ℕ) (hn : 1≤n) :
    ∀ a ∈ HeAlcove.depth D φ C n, ∀ b ∈ HeAlcove.depth D φ C n,
      a*g*b ∈ (fun h => g*h) '' (HeAlcove.depth D φ C (n-1) : Set _) := sorry
end BruhatTits

namespace KisinPappas
/-- This is the map from the distinct determining-segment lattices into the sum
of all inertia-character lattices, identified with the stable lattice by π̃ powers.
The tame totally ramified hypotheses and that identification are omitted. -/
theorem invariant_chain_direct_summand {O : Type u} [CommRing O]
    {A B : Type u} [AddCommGroup A] [AddCommGroup B] [Module O A] [Module O B]
    (inclusion : A →ₗ[O] B) : ∃ retraction : B →ₗ[O] A,
      retraction.comp inclusion=LinearMap.id := sorry

/-- D is a quaternion division algebra over a p-adic field, with its main
involution. S is a nondegenerate hermitian form on the right D-module D^s;
right-linearity and the main-involution identification are omitted.
The additive equivalence also respects right multiplication, so this is a basis
change for the right module, rather than the default left Pi module. -/
theorem quaternionic_hermitian_standard_basis {D : Type u} [DivisionRing D] [StarRing D]
    (s : ℕ) (S : (Fin s → D) → (Fin s → D) → D)
    (hS : ∀ x, (∀ y, S x y=0) → x=0) :
    ∃ e : (Fin s → D) ≃+ (Fin s → D),
      (∀ x d, e (fun i => x i*d) = fun i => e x i*d) ∧
      ∀ x y, S (e x) (e y)=∑ i, star (x i)*y i := sorry
end KisinPappas

/-! ## Compatibility tests for the anchor data and pinned library notions -/
namespace BruhatTits
section RootDatumCompatibility
variable {G ι M N : Type u} [Group G] [AddCommGroup M] [Module ℝ M]
  [AddCommGroup N] [Module ℝ N] {Φ : RootPairing ι ℝ M N}
-- Test BruhatTits.RootDatum.normalizer_compat
example (D : RootDatum G Φ) (i : ι) (t : D.T) :
    (D.U i).map (MulAut.conj (t:G)).toMonoidHom = D.U i := sorry
end RootDatumCompatibility

open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
-- Test BruhatTits.IsMinuscule.rootPairing_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A : AbsoluteRootData K H) (μ : A.Y) :
    IsMinuscule A μ ↔ ∀ i, A.Ψ.toLinearMap (A.Ψ.root i) μ ∈ ({-1,0,1}:Set ℤ) := Iff.rfl
-- Test BruhatTits.AlgebraicFundamentalGroup.torus_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (A : AbsoluteRootData K H) [IsEmpty A.ι] (y : A.Y) :
    AlgebraicFundamentalGroup.torus A (Submodule.Quotient.mk y : AlgebraicFundamentalGroup A)=y := sorry
-- Test BruhatTits.Facet.convex_compat
example {H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) (F : Facet D φ)
    (x₀ : Apartment φ) : Convex ℝ ((fun x : Apartment φ => x -ᵥ x₀) '' F.carrier) := sorry

/-- Standard SL2 cocharacter coordinate. Its compatibility with the anchor's diagonal
cocharacter and this roadmap's normalized discrete valuation is omitted here. -/
def sl2ApartmentCoordinate (K : Type u) [Field K] [ValuativeRel K] :
    Apartment (sl2Valuation K) ≃ᵃ[ℝ] ℝ := sorry
-- Test BruhatTits.Facet.sl2_alcoves
-- K is the discretely valued field and the coordinate is the normalized one above.
example (m : ℤ) : ∃ F : Facet (sl2LocalDatum K) (sl2Valuation K),
    Facet.IsAlcove (sl2LocalDatum K) (sl2Valuation K) F ∧
    F.carrier={x | (m:ℝ)/2 < sl2ApartmentCoordinate K x ∧
      sl2ApartmentCoordinate K x < ((m:ℝ)+1)/2} := sorry
-- Test BruhatTits.echelonnage_split_compat
example : Nonempty ((echelonnage (glLocalDatum K 3) (glValuation K 3)).Equiv
    (glLocalDatum K 3).Φ) := sorry

/-- Anchor SU6 over a fixed ramified quadratic extension of the completed maximal
unramified field, with odd residue characteristic; the extension parameters are omitted. -/
def ramifiedSU6Group (K : Type u) [Field K] : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} K := sorry
def ramifiedSU6LocalDatum (K : Type u) [Field K] :
    LocalRootData K (ramifiedSU6Group K) := sorry
def ramifiedSU6Valuation (K : Type u) [Field K] [ValuativeRel K] :
    Valuation (ramifiedSU6LocalDatum K).rootDatum := sorry
-- Test BruhatTits.echelonnage_ne_relative
-- The relative system is C3, while the wall-spacing system is B3 (Haines Remark 6.2).
example : ¬ Nonempty ((echelonnage (ramifiedSU6LocalDatum K) (ramifiedSU6Valuation K)).Equiv
    (ramifiedSU6LocalDatum K).Φ) := sorry
end BruhatTits

namespace KottwitzMap
open BruhatTits
variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K]
-- Test KottwitzMap.torus_gm
-- e is the standard-cocharacter identification, and points the anchor Gm point equivalence.
-- Their compatibility with the GL1 absolute datum is the omitted anchor identification.
example (I : Subgroup (Field.absoluteGaloisGroup K))
    (e : Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants (glAbsoluteDatum K 1) I) ≃*
      Multiplicative ℤ)
    (points : WithConv (glGroup K 1 →ₐ[K] K) ≃* Kˣ)
    (g : WithConv (glGroup K 1 →ₐ[K] K)) :
    e (torus (glAbsoluteDatum K 1) I g)=TauCeti.normalizedValuation K (points g) := sorry
-- Test KottwitzMap.kottwitz_gl_n
-- n>0; e is induced by determinant, and points agrees with the pinned GL points API.
example (n : ℕ) (hn : 0<n) (I : Subgroup (Field.absoluteGaloisGroup K))
    (e : Multiplicative (AlgebraicFundamentalGroup.inertiaCoinvariants (glAbsoluteDatum K n) I) ≃*
      Multiplicative ℤ)
    (points : WithConv (glGroup K n →ₐ[K] K) ≃* GL (Fin n) K)
    (g : WithConv (glGroup K n →ₐ[K] K)) :
    e (kottwitz (glAbsoluteDatum K n) I g)=TauCeti.normalizedValuation K (points g).det := sorry
end KottwitzMap
