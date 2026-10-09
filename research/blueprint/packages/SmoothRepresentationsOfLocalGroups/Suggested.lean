/-
This file is not the roadmap and is not exhaustive. The README of this folder is definitive.
These statements suggest Lean forms so that contributors and reviewers converge on names and
signatures. Proofs are deliberately omitted; nothing here is an implementation.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369 (one module imported, for the
double-coset Hecke ring).

The first part states the general locally profinite theory (smooth representations, invariants,
admissibility, Hecke algebras, induction, Jacquet modules) over any commutative ring. The second
part states the spherical, integral-family and integral-finiteness targets. Local reductive
carriers (parabolic subgroups of `G(F)`, Iwahori decompositions, the Satake integral, integral
Bernstein blocks, the geometric Hecke action) are not available at the pins, so the targets that
need them are listed by name in the comment block at the end rather than replaced by an assumed
`Prop`-valued field.
-/
import Mathlib.RepresentationTheory.Coinvariants
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.FiniteType
import Mathlib.CategoryTheory.Center.Linear
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.FreeGroup.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Ideal
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.RepresentationTheory.Stabilizer
import Mathlib.RepresentationTheory.Coinduced
import Mathlib.RepresentationTheory.Intertwining
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Algebra.Nonarchimedean.Basic
import Mathlib.Topology.Sets.Compacts
import Mathlib.NumberTheory.HeckeRing.Defs
import Mathlib.CategoryTheory.Abelian.GrothendieckCategory.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.PGroup
import TauCeti.NumberTheory.HeckeRing.Associativity

noncomputable section
open scoped BigOperators TensorProduct MonoidAlgebra
open CategoryTheory Polynomial
namespace SRPlan
local instance (X : Type*) : DecidableEq X := Classical.decEq X
universe u v w

/-! ## SR.0, SR.1, SR.0:derived-extension and SR.2: the general locally profinite theory

Suggested forms for the targets stated over an arbitrary topological group `G` and an
arbitrary commutative ring `A`. Reductive statements (Iwahori decompositions, parabolic
induction, the geometric lemma, cuspidal theory, uniform admissibility, the Bernstein
decomposition and centre, second adjointness) need the carriers of `ReductiveGroupsPartII`
and are listed by name in the comment block at the end of the file. -/

section SmoothCategory
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G]

/-- van Dantzig: in a locally compact totally disconnected Hausdorff group every
neighbourhood of `1` contains a compact open subgroup. -/
theorem exists_compactOpenSubgroup_le [IsTopologicalGroup G] [LocallyCompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] {U : Set G} (hU : U ∈ nhds (1 : G)) :
    ∃ K : OpenSubgroup G, IsCompact (K : Set G) ∧ (K : Set G) ⊆ U := by sorry

namespace Representation

section Monoid
variable {V : Type*} [AddCommMonoid V] [Module A V] (ρ : Representation A G V)

/-- A representation on an `A`-module (no topology on `V`) is smooth when every vector has
an open stabiliser. -/
def IsSmooth : Prop := ∀ v : V, IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)

/-- Change of coefficients along `A → B`. -/
def baseChange (B : Type*) [CommRing B] [Algebra A B] : Representation B G (B ⊗[A] V) where
  toFun g := (ρ g).baseChange B
  map_one' := by sorry
  map_mul' := by sorry

/-- Whittaker functionals: linear forms transforming by the character `ψ` of `U`. -/
def whittakerFunctionals (U : Subgroup G) (ψ : U →* Aˣ) : Submodule A (V →ₗ[A] A) where
  carrier := {ℓ | ∀ (u : U) (v : V), ℓ (ρ u v) = (ψ u : A) * ℓ v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem isSmooth_iff_exists_openSubgroup [NonarchimedeanGroup G] :
    IsSmooth ρ ↔ ∀ v : V, ∃ U : OpenSubgroup G, ∀ g ∈ U, ρ g v = v := by sorry
theorem IsSmooth.subrepresentation (h : IsSmooth ρ) (S : Subrepresentation ρ) :
    IsSmooth S.toRepresentation := by sorry
theorem IsSmooth.comp_continuous {H : Type*} [Group H] [TopologicalSpace H] (h : IsSmooth ρ)
    (f : H →* G) (hf : Continuous f) : IsSmooth (ρ.comp f) := by sorry
theorem isSmooth_ofMulAction_quotient (U : Subgroup G) (hU : IsOpen (U : Set G)) :
    IsSmooth (Representation.ofMulAction A G (G ⧸ U)) := by sorry
theorem isSmooth_baseChange (B : Type*) [CommRing B] [Algebra A B] (h : IsSmooth ρ) :
    IsSmooth (baseChange ρ B) := by sorry
theorem whittakerFunctionals_trivial_of_ne_one (U : Subgroup G) (ψ : U →* Aˣ) [IsDomain A]
    (hψ : ∃ u : U, (ψ u : A) ≠ 1) :
    whittakerFunctionals (Representation.trivial A G V) U ψ = ⊥ := by sorry

-- Representation.isSmooth_trivial
example : IsSmooth (Representation.trivial A G V) := by sorry
-- Representation.isSmooth_of_discreteTopology
example [DiscreteTopology G] : IsSmooth ρ := by sorry
-- Representation.isSmooth_ofMulAction_zmod
example (U : OpenSubgroup G) : IsSmooth (Representation.ofMulAction A G (G ⧸ U.toSubgroup)) := by sorry
-- Representation.not_isSmooth_leftRegular
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmooth (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p])) := by sorry

end Monoid

section Group
variable {V : Type*} [AddCommGroup V] [Module A V] (ρ : Representation A G V)

/-- The smooth vectors: those with open stabiliser. They form a subrepresentation. -/
def smoothVectors : Subrepresentation ρ where
  toSubmodule :=
    { carrier := {v | IsOpen ((ρ.stabilizer v : Subgroup G) : Set G)}
      zero_mem' := by sorry
      add_mem' := by sorry
      smul_mem' := by sorry }
  apply_mem_toSubmodule := by sorry

/-- The invariants under a subgroup `U`, as the invariants of the restriction. -/
abbrev invariantsOf (U : Subgroup G) : Submodule A V := Representation.invariants (ρ.comp U.subtype)

/-- Admissible: smooth, and the invariants of every compact open subgroup are finitely generated
over `A` (no dimension condition over a general ring). -/
def IsAdmissible : Prop :=
  IsSmooth ρ ∧ ∀ U : OpenSubgroup G, IsCompact (U : Set G) → Module.Finite A (invariantsOf ρ U.toSubgroup)

/-- The smooth contragredient: the smooth vectors of the full algebraic dual. -/
noncomputable def smoothDual : Subrepresentation ρ.dual := smoothVectors ρ.dual

/-- The Jacquet module along a subgroup `N`: coinvariants of the restriction. -/
abbrev jacquetModule (N : Subgroup G) := Representation.Coinvariants (ρ.comp N.subtype)

theorem mem_smoothVectors_iff (v : V) :
    v ∈ (smoothVectors ρ).toSubmodule ↔ IsOpen ((ρ.stabilizer v : Subgroup G) : Set G) := by sorry
theorem smoothVectors_isSmooth : IsSmooth (smoothVectors ρ).toRepresentation := by sorry
theorem smoothVectors_eq_top_iff : (smoothVectors ρ).toSubmodule = ⊤ ↔ IsSmooth ρ := by sorry
theorem invariantsOf_mono {U U' : Subgroup G} (h : U' ≤ U) : invariantsOf ρ U ≤ invariantsOf ρ U' := by sorry
theorem iSup_invariantsOf_compactOpen_eq_top [NonarchimedeanGroup G] (h : IsSmooth ρ) :
    ⨆ U : {U : OpenSubgroup G // IsCompact (U : Set G)}, invariantsOf ρ U.1.toSubgroup = ⊤ := by sorry
theorem IsAdmissible.isSmooth (h : IsAdmissible ρ) : IsSmooth ρ := h.1
theorem isSmooth_smoothDual : IsSmooth (smoothDual ρ).toRepresentation := by sorry

-- Representation.smoothVectors_leftRegular_eq_bot (for the compact group `ℤ_p`, not discrete)
example (p : ℕ) [Fact p.Prime] :
    (Representation.smoothVectors (Representation.ofMulAction ℤ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p]))).toSubmodule = ⊥ := by sorry
-- Representation.isAdmissible_ofMulAction_compact
example (p : ℕ) [Fact p.Prime] (U : OpenSubgroup (Multiplicative ℤ_[p])) :
    IsAdmissible (Representation.ofMulAction ℚ (Multiplicative ℤ_[p]) (Multiplicative ℤ_[p] ⧸ U.toSubgroup)) := by sorry
-- Representation.smoothDual_finite (finite free smooth representations are reflexive)
example [Module.Finite A V] [Module.Free A V] (h : IsSmooth ρ) :
    (smoothDual ρ).toSubmodule = ⊤ := by sorry
-- Representation.jacquetModule_trivial
example (N : Subgroup G) : Nonempty (jacquetModule (Representation.trivial A G V) N ≃ₗ[A] V) := by sorry

end Group

end Representation

/-- A compact subgroup `K` has pro-order invertible in `A` when the order of each of its finite
continuous quotients is a unit of `A`. -/
def HasUnitProOrder (A : Type*) [CommRing A] (K : Subgroup G) : Prop :=
  ∀ U : OpenNormalSubgroup K, IsUnit ((Nat.card (K ⧸ U.toSubgroup) : ℕ) : A)

theorem hasUnitProOrder_of_le {K K' : Subgroup G} (h : K' ≤ K) (hK : IsOpen (K' : Set G))
    (hU : HasUnitProOrder A K) : HasUnitProOrder A K' := by sorry
theorem hasUnitProOrder_of_proP (p : ℕ) (K : Subgroup G) (hp : IsUnit (p : A))
    (hK : ∀ U : OpenNormalSubgroup K, IsPGroup p (K ⧸ U.toSubgroup)) : HasUnitProOrder A K := by sorry

-- HasUnitProOrder.zp_rat
example (p : ℕ) [Fact p.Prime] : HasUnitProOrder ℚ (⊤ : Subgroup (Multiplicative ℤ_[p])) := by sorry
-- HasUnitProOrder.not_zp_zmod
example (p : ℕ) [Fact p.Prime] : ¬ HasUnitProOrder (ZMod p) (⊤ : Subgroup (Multiplicative ℤ_[p])) := by sorry
-- HasUnitProOrder.finite
example (K : Subgroup G) [Finite K] (h : IsUnit ((Nat.card K : ℕ) : A)) : HasUnitProOrder A K := by sorry

section Averaging
variable {V : Type*} [AddCommGroup V] [Module A V]

/-- The averaging projector onto `U`-invariants, for compact open `U` of invertible pro-order. -/
noncomputable def Representation.averaging (ρ : Representation A G V) (U : OpenSubgroup G)
    (_hc : IsCompact (U : Set G)) (_hU : HasUnitProOrder A U.toSubgroup) : V →ₗ[A] V := sorry

theorem Representation.averaging_mem (ρ : Representation A G V) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup) (v : V) :
    Representation.averaging ρ U hc hU v ∈ Representation.invariantsOf ρ U.toSubgroup := by sorry
theorem Representation.averaging_of_mem (ρ : Representation A G V) (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) (hU : HasUnitProOrder A U.toSubgroup) {v : V}
    (hv : v ∈ Representation.invariantsOf ρ U.toSubgroup) : Representation.averaging ρ U hc hU v = v := by sorry

end Averaging

/-- A smooth character is a homomorphism to the units with open kernel. -/
def IsSmoothCharacter (χ : G →* Aˣ) : Prop := IsOpen ((χ.ker : Subgroup G) : Set G)

/-- The one-dimensional representation attached to a character. -/
def Representation.ofCharacter (χ : G →* Aˣ) : Representation A G A where
  toFun g := (χ g : A) • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

theorem isSmoothCharacter_iff_isSmooth (χ : G →* Aˣ) :
    IsSmoothCharacter χ ↔ Representation.IsSmooth (Representation.ofCharacter χ) := by sorry
-- IsSmoothCharacter.one
example : IsSmoothCharacter (1 : G →* Aˣ) := by sorry
-- IsSmoothCharacter.mul
example (χ χ' : G →* Aˣ) (h : IsSmoothCharacter χ) (h' : IsSmoothCharacter χ') :
    IsSmoothCharacter (χ * χ') := by sorry
-- IsSmoothCharacter.of_discrete
example [DiscreteTopology G] (χ : G →* Aˣ) : IsSmoothCharacter χ := by sorry

end SmoothCategory

section SmoothRepCategory
variable (A G : Type u) [CommRing A] [Group G] [TopologicalSpace G]

/-- The category of smooth representations: the full subcategory of `Rep A G` on the smooth
objects. -/
abbrev SmoothRep : Type _ :=
  ObjectProperty.FullSubcategory (fun X : Rep A G => Representation.IsSmooth X.ρ)

/-- The inclusion into `Rep A G`. -/
abbrev SmoothRep.ι : SmoothRep A G ⥤ Rep A G :=
  ObjectProperty.ι (fun X : Rep A G => Representation.IsSmooth X.ρ)

/-- Smooth representations form an abelian category (kernels, cokernels and sums of smooth
representations are smooth). -/
noncomputable instance SmoothRep.instAbelian : Abelian (SmoothRep A G) := sorry

/-- The smooth-part functor, right adjoint to the inclusion. -/
noncomputable def SmoothRep.smoothPart : Rep A G ⥤ SmoothRep A G := sorry

/-- `ι ⊣ smoothPart`: the smooth category is coreflective in `Rep A G`. -/
noncomputable def SmoothRep.smoothPartAdjunction : SmoothRep.ι A G ⊣ SmoothRep.smoothPart A G := sorry

/-- The centre of the smooth category, `End (𝟭 _)`. -/
abbrev SmoothCentre := CatCenter (SmoothRep A G)

/-- The smooth category is Grothendieck abelian (filtered colimits are exact and the permutation
modules `A[G/U]` form a family of generators). -/
noncomputable instance SmoothRep.instIsGrothendieckAbelian :
    IsGrothendieckAbelian.{u} (SmoothRep A G) := sorry

-- SmoothRep.abelian_test
example : Abelian (SmoothRep A G) := inferInstance
-- SmoothCentre.commutative
example : IsMulCommutative (SmoothCentre A G) := inferInstance
-- SmoothRep.ι_faithful
example : (SmoothRep.ι A G).Faithful := inferInstance

end SmoothRepCategory

section HeckeAlgebras
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G]

/-- Locally constant functions `G → A` with compact support. -/
structure LocallyConstantCompact (G A : Type*) [TopologicalSpace G] [Zero A] where
  toFun : LocallyConstant G A
  isCompact_closure_support : IsCompact (closure (Function.support ⇑toFun))

/-- An `A`-valued Haar measure: a finitely additive left-invariant function on compact opens. -/
structure HaarMeasureWithValues (G A : Type*) [Group G] [TopologicalSpace G] [AddCommMonoid A] where
  vol : TopologicalSpace.CompactOpens G → A
  vol_sup_of_disjoint (K L : TopologicalSpace.CompactOpens G) :
    Disjoint (K : Set G) (L : Set G) → vol (K ⊔ L) = vol K + vol L
  vol_translate (g : G) (K L : TopologicalSpace.CompactOpens G) :
    (L : Set G) = (g * ·) '' (K : Set G) → vol L = vol K

/-- The Hecke algebra `H(G, A)`: compactly supported locally constant functions with the
convolution of the measure `μ`. -/
def HeckeAlgebra (_μ : HaarMeasureWithValues G A) : Type _ := LocallyConstantCompact G A

noncomputable instance (μ : HaarMeasureWithValues G A) : NonUnitalRing (HeckeAlgebra μ) := sorry
noncomputable instance (μ : HaarMeasureWithValues G A) : Module A (HeckeAlgebra μ) := sorry

/-- The normalised idempotent `e_U = μ(U)⁻¹ 1_U`, defined when `μ(U)` is a unit. -/
noncomputable def HeckeAlgebra.idempotent (μ : HaarMeasureWithValues G A)
    (U : TopologicalSpace.CompactOpens G) (_h : IsUnit (μ.vol U)) : HeckeAlgebra μ := sorry

theorem HeckeAlgebra.idempotent_mul_self (μ : HaarMeasureWithValues G A)
    (U : TopologicalSpace.CompactOpens G) (h : IsUnit (μ.vol U)) :
    HeckeAlgebra.idempotent μ U h * HeckeAlgebra.idempotent μ U h = HeckeAlgebra.idempotent μ U h := by sorry

/-- The Hecke algebra of level `U` over any ring: endomorphisms of the permutation module
`A[G/U]` as an `A[G]`-module. -/
abbrev HeckeAlgebraLevel (A G : Type u) [CommRing A] [Group G] (U : Subgroup G) :=
  Module.End (MonoidAlgebra A G) (Representation.ofMulAction A G (G ⧸ U)).asModule

/-- Compact open subgroups form Hecke pairs with the whole group. -/
theorem isHeckeTriple_compactOpen [IsTopologicalGroup G] (U : OpenSubgroup G)
    (hc : IsCompact (U : Set G)) :
    IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup := by sorry

/-- The level-`U` Hecke algebra is the double-coset Hecke ring of Mathlib and Tau Ceti. -/
noncomputable def HeckeAlgebraLevel.equivHeckeRing {A G : Type u} [CommRing A] [Group G]
    [TopologicalSpace G] (U : OpenSubgroup G)
    [IsHeckeTriple (⊤ : Submonoid G) U.toSubgroup U.toSubgroup] :
    HeckeAlgebraLevel A G U.toSubgroup ≃+* HeckeRing (⊤ : Submonoid G) U.toSubgroup A := sorry

-- HeckeAlgebraLevel.ring_test
example {A G : Type u} [CommRing A] [Group G] (U : Subgroup G) : Ring (HeckeAlgebraLevel A G U) := inferInstance
-- HeckeAlgebraLevel.top
example {A G : Type u} [CommRing A] [Group G] :
    Nonempty (HeckeAlgebraLevel A G (⊤ : Subgroup G) ≃+* A) := by sorry
-- HeckeAlgebraLevel.bot_discrete
example {A G : Type u} [CommRing A] [Group G] :
    Nonempty (HeckeAlgebraLevel A G (⊥ : Subgroup G) ≃+* (MonoidAlgebra A G)ᵐᵒᵖ) := by sorry
-- LocallyConstantCompact.zero
example [Zero A] : Nonempty (LocallyConstantCompact G A) := by sorry

end HeckeAlgebras

section Induction
variable {A : Type*} [CommRing A] {G : Type*} [Group G] [TopologicalSpace G]
variable {V W : Type*} [AddCommGroup V] [Module A V] [AddCommGroup W] [Module A W]

/-- Smooth induction from a subgroup `H`: the smooth vectors of algebraic coinduction. -/
noncomputable def Representation.ind (H : Subgroup G) (σ : Representation A H W) :
    Subrepresentation (Representation.coind H.subtype σ) :=
  Representation.smoothVectors (Representation.coind H.subtype σ)

/-- Frobenius reciprocity for smooth induction: `Res ⊣ Ind`. -/
noncomputable def Representation.indResEquiv (H : Subgroup G) (π : Representation A G V)
    (σ : Representation A H W) (_hπ : Representation.IsSmooth π) (_hσ : Representation.IsSmooth σ) :
    Representation.IntertwiningMap π (Representation.ind H σ).toRepresentation ≃
      Representation.IntertwiningMap (π.comp H.subtype) σ := sorry

theorem Representation.ind_isSmooth (H : Subgroup G) (σ : Representation A H W) :
    Representation.IsSmooth (Representation.ind H σ).toRepresentation := by sorry

-- Representation.ind_top
example (σ : Representation A (⊤ : Subgroup G) W) :
    Nonempty (Representation.IntertwiningMap (Representation.ind ⊤ σ).toRepresentation
      (σ.comp (Subgroup.topEquiv).symm.toMonoidHom)) := by sorry
-- Representation.ind_trivial_bot
example [DiscreteTopology G] [Finite G] :
    Nonempty (Representation.IntertwiningMap
      (Representation.ind (⊥ : Subgroup G) (Representation.trivial A (⊥ : Subgroup G) A)).toRepresentation
      (Representation.ofMulAction A G G)) := by sorry
-- Representation.jacquetModule_bot
example (ρ : Representation A G V) : Nonempty (Representation.jacquetModule ρ ⊥ ≃ₗ[A] V) := by sorry

end Induction


section FiniteSums
variable {A D E L : Type*} [CommRing A]
/-- Finite-sum interface for the actual N-integral coefficients.
The coefficient construction, reductivity and hyperspecial hypotheses are omitted
here; this is not the full Satake isomorphism. -/
def satakeTransform (c : D → L →₀ A) : (D →₀ A) →ₗ[A] (L →₀ A) :=
  Finsupp.linearCombination A c
namespace satakeTransform
lemma coefficient (c : D → L →₀ A) (d : D) (a : A) :
    satakeTransform c (Finsupp.single d a) = a • c d := by sorry
lemma support (c : D → L →₀ A) (f : D →₀ A) :
    (satakeTransform c f).support ⊆ f.support.biUnion (fun d => (c d).support) := by sorry
lemma baseChange {B : Type*} [CommRing B] (φ : A →+* B) (c : D → L →₀ A)
    (f : D →₀ A) :
    (satakeTransform c f).mapRange φ φ.map_zero =
      satakeTransform (fun d => (c d).mapRange φ φ.map_zero)
        (f.mapRange φ φ.map_zero) := by sorry
lemma torus (f : L →₀ A) : satakeTransform (fun l => Finsupp.single l 1) f = f := by sorry
lemma unit (c : D → L →₀ A) (d0 : D) (l0 : L)
    (h : c d0 = Finsupp.single l0 1) :
    satakeTransform c (Finsupp.single d0 1) = Finsupp.single l0 1 := by sorry
lemma gl2 (qHalf : A) :
    satakeTransform (fun _ : Unit => Finsupp.single (0 : Fin 2) qHalf +
      Finsupp.single (1 : Fin 2) qHalf) (Finsupp.single () 1) =
      Finsupp.single (0 : Fin 2) qHalf + Finsupp.single (1 : Fin 2) qHalf := by sorry
example (f : L →₀ A) : satakeTransform (fun l => Finsupp.single l 1) f = f := by sorry
example (l0 : L) : satakeTransform (fun _ : Unit => Finsupp.single l0 (1 : A))
    (Finsupp.single () 1) = Finsupp.single l0 1 := by sorry
example (qHalf : A) :
    satakeTransform (fun _ : Unit => Finsupp.single (0 : Fin 2) qHalf +
      Finsupp.single (1 : Fin 2) qHalf) (Finsupp.single () 1) =
      Finsupp.single (0 : Fin 2) qHalf + Finsupp.single (1 : Fin 2) qHalf := by sorry
end satakeTransform

/-- Finite-coset coefficient interface; actual geometric descent coefficients
are omitted until the local reductive carrier exists. -/
def parabolicDescent (c : D → E →₀ A) : (D →₀ A) →ₗ[A] (E →₀ A) :=
  Finsupp.linearCombination A c
namespace parabolicDescent
lemma support (c : D → E →₀ A) (f : D →₀ A) :
    (parabolicDescent c f).support ⊆ f.support.biUnion (fun d => (c d).support) := by sorry
lemma stages (c : D → E →₀ A) (b : E → L →₀ A) :
    (parabolicDescent b).comp (parabolicDescent c) =
      parabolicDescent (fun d => parabolicDescent b (c d)) := by sorry
/-- A basis-level constant-term computation suffices to give the whole square. -/
lemma satake (c : D → E →₀ A) (sG : D → L →₀ A) (sM : E → L →₀ A)
    (h : ∀ d, satakeTransform sM (c d) = sG d) :
    (satakeTransform sM).comp (parabolicDescent c) = satakeTransform sG := by sorry
lemma wholeGroup (f : D →₀ A) :
    parabolicDescent (fun d => Finsupp.single d 1) f = f := by sorry
lemma torus (c : D → E →₀ A) : parabolicDescent c = satakeTransform c := by sorry
-- xiVariables: the dual-Levi and determinant-twist signature is omitted;
-- it needs the actual lattice identifications, not a freely chosen matrix.
example (f : D →₀ A) : parabolicDescent (fun d => Finsupp.single d 1) f = f := by sorry
example (c : D → E →₀ A) : parabolicDescent c = satakeTransform c := by sorry
end parabolicDescent
end FiniteSums

section Pseudoroot
variable {W H : Type*} [Group W] [CommGroup H]
/-- Both the square and twisted fixed-point conditions are required. -/
def Pseudoroot (a : W →* MulAut H) (twist : W → H) (sigmaQ x : H) : Prop :=
  x * x = sigmaQ ∧ ∀ w, a w x * twist w = x
namespace Pseudoroot
lemma square (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) : x * x = s := by sorry
lemma fixed (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) : a w x * d w = x := by sorry
lemma translate (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := by sorry
lemma even (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := by sorry
lemma trivial (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
-- The residue characteristic-two q=1 calculation is represented by this
-- identity case; the construction of Sigma*(q) is omitted with dual root data.
lemma characteristicTwo (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
example (a : W →* MulAut H) : Pseudoroot a (fun _ => 1) 1 1 := by sorry
example (a : W →* MulAut H) (d : W → H) (x : H)
    (h : ∀ w, a w x * d w = x) : Pseudoroot a d (x * x) x := by sorry
example (a : W →* MulAut H) (d : W → H) (s x : H)
    (h : Pseudoroot a d s x) (w : W) (y : H) :
    a w (y * x) * d w = a w y * x := by sorry
end Pseudoroot
end Pseudoroot

section Parameters
variable {A : Type*} [CommRing A]
structure PairedParameter (n : ℕ) where
  alpha : Fin n → Aˣ
  paired : ∀ i, alpha i * alpha i.rev = 1
  middle : ∀ i, 2 * i.val + 1 = n → alpha i = 1
namespace PairedParameter
def polynomial {n : ℕ} (a : PairedParameter (A := A) n) : A[X] :=
  ∏ i, (X - C (a.alpha i : A))
lemma reciprocal {n : ℕ} (a : PairedParameter (A := A) n) :
    a.polynomial.reverse = C ((-1 : A) ^ n) * a.polynomial := by sorry
lemma weyl {n : ℕ} (a : PairedParameter (A := A) n) (σ : Equiv.Perm (Fin n)) :
    (∏ i, (X - C (a.alpha (σ i) : A))) = a.polynomial := by sorry
lemma rankOne (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := by sorry
lemma rankTwo (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := by sorry
lemma productRing :
    let a : Fin 3 → ZMod 5 × ZMod 5 := ![(1,2), (2,1), (3,3)]
    let P : (ZMod 5 × ZMod 5)[X] := ∏ i, (X - C (a i))
    P.reverse = -P ∧ ∀ i, (a i)^2 ≠ 1 := by sorry
example (a : PairedParameter (A := A) 1) : a.alpha 0 = 1 := by sorry
example (a : Aˣ) :
    (X - C (a : A)) * (X - C ((a⁻¹ : Aˣ) : A)) =
      X^2 - C ((a : A) + ((a⁻¹ : Aˣ) : A)) * X + 1 := by sorry
example :
    let a : Fin 3 → ZMod 5 × ZMod 5 := ![(1,2), (2,1), (3,3)]
    let P : (ZMod 5 × ZMod 5)[X] := ∏ i, (X - C (a i))
    P.reverse = -P ∧ ∀ i, (a i)^2 ≠ 1 := by sorry
end PairedParameter

inductive GenericityKind | oddTate | oddIntertwining | evenRaising | evenIntertwining
/-- Parity is a property of the input rank, not hidden in these four predicates. -/
def UnitaryGenericity (kind : GenericityKind) (P : A[X]) (q : A) : Prop :=
  match kind with
  | .oddTate => IsUnit (P.derivative.eval 1)
  | .oddIntertwining => IsUnit (P.eval (-q))
  | .evenRaising => P.eval q = 0 ∧ IsUnit (P.derivative.eval q)
  | .evenIntertwining => IsUnit (P.eval (-1))
namespace UnitaryGenericity
lemma oddTate (P : A[X]) (q : A) :
    UnitaryGenericity .oddTate P q ↔ IsUnit (P.derivative.eval 1) := by sorry
lemma evenRaising (P : A[X]) (q : A) :
    UnitaryGenericity .evenRaising P q ↔ P.eval q = 0 ∧ IsUnit (P.derivative.eval q) := by sorry
lemma baseChange {B : Type*} [CommRing B] (φ : A →+* B) (k : GenericityKind)
    (P : A[X]) (q : A) (h : UnitaryGenericity k P q) :
    UnitaryGenericity k (P.map φ) (φ q) := by sorry
lemma doubleRoot [Nontrivial A] :
    ¬ UnitaryGenericity .evenRaising ((X - C (1 : A))^2) 1 := by sorry
lemma oddOne : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := by sorry
lemma collision [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := by sorry
example [Nontrivial A] :
    ¬ UnitaryGenericity .evenRaising ((X - C (1 : A))^2) 1 := by sorry
example : UnitaryGenericity .oddTate (X - C (1 : A)) 1 := by sorry
example [Nontrivial A] :
    ¬ UnitaryGenericity .oddIntertwining (X - C (1 : A)) (-1) := by sorry
end UnitaryGenericity

def SpinPolynomial (q T0 T1 T2 : A) : A[X] :=
  1 - C T2 * X + C (q * (T1 + (q^2 + 1) * T0)) * X^2 -
    C (q^3 * T2 * T0) * X^3 + C (q^6 * T0^2) * X^4
namespace SpinPolynomial
lemma constant (q T0 T1 T2 : A) : (SpinPolynomial q T0 T1 T2).eval 0 = 1 := by sorry
lemma coefficients (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 4 = q^6 * T0^2 ∧
    (SpinPolynomial q T0 T1 T2).coeff 1 = -T2 := by sorry
lemma reciprocal (q T0 T1 T2 : A) :
    Polynomial.reflect 4 (SpinPolynomial q T0 T1 T2) =
      X^4 - C T2 * X^3 + C (q*T1+(q^3+q)*T0)*X^2 -
        C (q^3*T2*T0)*X + C (q^6*T0^2) := by sorry
lemma rankFour (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := by sorry
lemma similitude (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := by sorry
lemma centralScaling (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := by sorry
example (q T0 T1 T2 : A) :
    (SpinPolynomial q T0 T1 T2).coeff 2 = q*T1+(q^3+q)*T0 := by sorry
example (q T0 : A) (a b c d : A) (hq : IsUnit q)
    (hab : a*d=b*c) (hT0 : q^3*T0=a*d) : q^6*T0^2=a*b*c*d := by sorry
example (q T0 T1 T2 z : A) (j : ℕ) :
    (SpinPolynomial q (z^2*T0) (z^2*T1) (z*T2)).coeff j =
      z^j * (SpinPolynomial q T0 T1 T2).coeff j := by sorry
end SpinPolynomial
end Parameters

section HallLittlewood
variable {K : Type*} [Field K]
def inversionLength {n : ℕ} (w : Equiv.Perm (Fin n)) : ℕ :=
  (Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2 ∧ w ij.2 < w ij.1)).card
def hallNormalizer {n : ℕ} (lam : Fin n → ℤ) (t : K) : K :=
  ∑ w ∈ Finset.univ.filter (fun w : Equiv.Perm (Fin n) => ∀ i, lam (w i) = lam i),
    t ^ inversionLength w
/-- Rational evaluation only. Pole cancellation and the universal integral
Laurent polynomial specialization are not implemented. -/
def HallLittlewood {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K) : K :=
  (∑ w : Equiv.Perm (Fin n), (∏ i, x (w i) ^ lam i) *
    ∏ ij ∈ Finset.univ.filter (fun ij : Fin n × Fin n => ij.1 < ij.2),
      (x (w ij.1) - t * x (w ij.2)) / (x (w ij.1) - x (w ij.2))) /
    hallNormalizer lam t
namespace HallLittlewood
lemma symmetric {n : ℕ} (lam : Fin n → ℤ) (t : K) (x : Fin n → K)
    (w : Equiv.Perm (Fin n)) : HallLittlewood lam t (x ∘ w) = HallLittlewood lam t x := by sorry
lemma homogeneous {n : ℕ} (lam : Fin n → ℤ) (t z : K) (hz : z ≠ 0)
    (x : Fin n → K) :
    HallLittlewood lam t (fun i => z * x i) = z ^ (∑ i, lam i) * HallLittlewood lam t x := by sorry
/-- This states integral polynomiality in the dominant nonnegative case.
For negative coweights the Laurent-shift version is omitted with the Hall–Littlewood count. -/
lemma integral [CharZero K] {n : ℕ} (lam : Fin n → ℤ)
    (hdom : ∀ i j, i ≤ j → lam j ≤ lam i) (hpos : ∀ i, 0 ≤ lam i) :
    ∃ P : MvPolynomial (Option (Fin n)) ℤ, ∀ (t : K) (x : Fin n → K),
      Function.Injective x → hallNormalizer lam t ≠ 0 →
      HallLittlewood lam t x = MvPolynomial.eval₂ (Int.castRingHom K) (fun j => match j with | none => t | some i => x i) P := by sorry
lemma rankOne (m : ℤ) (t x : K) :
    HallLittlewood (fun _ : Fin 1 => m) t (fun _ => x) = x^m := by sorry
lemma zero {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    HallLittlewood (fun _ : Fin n => 0) t x = 1 := by sorry
lemma minuscule {n r : ℕ} (hr : r ≤ n) (t : K) (x : Fin n → K)
    (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin n => if i.val < r then 1 else 0) t ≠ 0) :
    HallLittlewood (fun i : Fin n => if i.val < r then 1 else 0) t x =
      ∑ s ∈ (Finset.univ : Finset (Fin n)).powersetCard r, ∏ i ∈ s, x i := by sorry
example (m : ℤ) (t x : K) :
    HallLittlewood (fun _ : Fin 1 => m) t (fun _ => x) = x^m := by sorry
example {n : ℕ} (t : K) (x : Fin n → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun _ : Fin n => 0) t ≠ 0) :
    HallLittlewood (fun _ : Fin n => 0) t x = 1 := by sorry
example (t : K) (x : Fin 2 → K) (hx : Function.Injective x)
    (ht : hallNormalizer (fun i : Fin 2 => if i.val < 1 then 1 else 0) t ≠ 0) :
    HallLittlewood (fun i : Fin 2 => if i.val < 1 then 1 else 0) t x = x 0 + x 1 := by sorry
end HallLittlewood
end HallLittlewood

section Whittaker
variable {A U V : Type*} [CommRing A] [Group U] [AddCommGroup V] [Module A V]
/-- Untwist and reuse ordinary Mathlib coinvariants. -/
def untwist (rho : Representation A U V) (psi : U →* Aˣ) : Representation A U V where
  toFun u := (((psi u)⁻¹ : Aˣ) : A) • rho u
  map_one' := by sorry
  map_mul' := by sorry
-- Inverse character values remain units; no division operation on A is used.
abbrev WhittakerCoinvariants (rho : Representation A U V) (psi : U →* Aˣ) :=
  Representation.Coinvariants (untwist rho psi)
namespace WhittakerCoinvariants
abbrev mk (rho : Representation A U V) (psi : U →* Aˣ) :
    V →ₗ[A] WhittakerCoinvariants rho psi := Representation.Coinvariants.mk _
lemma relation (rho : Representation A U V) (psi : U →* Aˣ) (u : U) (v : V) :
    mk rho psi (rho u v) = (psi u : A) • mk rho psi v := by sorry
lemma lift {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) (f : V →ₗ[A] M)
    (hf : ∀ u v, f (rho u v) = (psi u : A) • f v) :
    ∃! b : WhittakerCoinvariants rho psi →ₗ[A] M, b.comp (mk rho psi) = f := by sorry
/-- The tensor relation quotient is explicit, so no flatness is assumed. -/
lemma tensor {M : Type*} [AddCommGroup M] [Module A M]
    (rho : Representation A U V) (psi : U →* Aˣ) :
    Nonempty ((M ⊗[A] WhittakerCoinvariants rho psi) ≃ₗ[A]
      (M ⊗[A] V) ⧸ Submodule.span A
        {z | ∃ (u : U) (m : M) (v : V),
          z = m ⊗ₜ[A] rho u v - (psi u : A) • (m ⊗ₜ[A] v)}) := by sorry
lemma trivialCharacter (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := by sorry
lemma trivialGroup (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := by sorry
lemma incompatibleCharacter (psi : U →* Aˣ) (u : U)
    (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := by sorry
example (rho : Representation A U V) :
    Nonempty (WhittakerCoinvariants rho (1 : U →* Aˣ) ≃ₗ[A]
      Representation.Coinvariants rho) := by sorry
example (rho : Representation A Unit V) (psi : Unit →* Aˣ) :
    Function.Bijective (mk rho psi) := by sorry
example (psi : U →* Aˣ) (u : U) (h : IsUnit ((psi u : A) - 1)) :
    Subsingleton (WhittakerCoinvariants (Representation.trivial A U A) psi) := by sorry
end WhittakerCoinvariants
end Whittaker


section AIG
variable {k G V : Type u} [Field k] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module k V]
-- Algebraic absolute simplicity plus smoothness, with scalar extensions stated
-- explicitly. This is not the weaker End(V)=k condition.
def AbsolutelyIrreducible (rho : Representation k G V) : Prop :=
  ∀ (L : Type u) (hL : Field L) (hAlg : Algebra k L),
    letI := hL
    letI := hAlg
    Representation.IsIrreducible (Representation.baseChange rho L)
def Generic (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Nontrivial (WhittakerCoinvariants (rho.comp U.subtype) psi)
def finiteLength (rho : Representation k G V) : Prop :=
  IsNoetherian k[G] rho.asModule ∧ IsArtinian k[G] rho.asModule
def quotientRepresentation (rho : Representation k G V) (S : Subrepresentation rho) :
    Representation k G (V ⧸ S.toSubmodule) :=
  rho.quotient S.toSubmodule (fun g => S.apply_mem_toSubmodule g)
/-- The existential S is the socle: absolute simplicity and containing every
simple subrepresentation identify it without introducing an opaque socle field. -/
def EssentiallyAIG (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ) : Prop :=
  Representation.IsSmooth rho ∧ ∃ S : Subrepresentation rho,
    AbsolutelyIrreducible S.toRepresentation ∧ Generic S.toRepresentation U psi ∧
    (∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S) ∧
    Subsingleton (WhittakerCoinvariants ((quotientRepresentation rho S).comp U.subtype) psi) ∧
    ∀ v : V, ∃ T : Subrepresentation rho, v ∈ T ∧ finiteLength T.toRepresentation
namespace EssentiallyAIG
lemma socle (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Generic S.toRepresentation U psi ∧
      ∀ T : Subrepresentation rho, Representation.IsIrreducible T.toRepresentation → T ≤ S := by sorry
lemma quotient (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (h : EssentiallyAIG rho U psi) :
    ∃ S : Subrepresentation rho, AbsolutelyIrreducible S.toRepresentation ∧
      Subsingleton (WhittakerCoinvariants ((quotientRepresentation rho S).comp U.subtype) psi) := by sorry
-- endomorphisms: scalarity uses the GL_n generic uniqueness and derivative
-- exactness package; its group-specific hypotheses cannot yet be typed.
lemma genericSimple (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Representation.IsSmooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := by sorry
lemma twoGeneric {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := by sorry
example {W : Type u} [AddCommGroup W] [Module k W]
    (rho : Representation k G V) (sigma : Representation k G W)
    (U : Subgroup G) (psi : U →* kˣ)
    (hi : Representation.IsIrreducible rho) (hj : Representation.IsIrreducible sigma)
    (hg : Generic rho U psi) (hh : Generic sigma U psi) :
    ¬ EssentiallyAIG (rho.prod sigma) U psi := by sorry
lemma zero (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := by sorry
example (rho : Representation k G V) (U : Subgroup G) (psi : U →* kˣ)
    (hs : Representation.IsSmooth rho) (hi : AbsolutelyIrreducible rho) (hg : Generic rho U psi) :
    EssentiallyAIG rho U psi := by sorry
example (U : Subgroup G) (psi : U →* kˣ) :
    ¬ EssentiallyAIG (Representation.trivial k G (Fin 0 → k)) U psi := by sorry
end EssentiallyAIG
end AIG

section Families
variable {A G V : Type u} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [AddCommGroup V] [Module A V]
/-- The specified U,psi are to be the GL_n generic data in the roadmap.
The formula itself includes every prime, with no minimal-prime shortcut. -/
def CoWhittaker (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ) : Prop :=
  Representation.IsSmooth rho ∧ Representation.IsAdmissible rho ∧
  Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) ∧
  ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (Representation.smoothVectors (Representation.dual (Representation.baseChange rho P.ResidueField))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi)
namespace CoWhittaker
lemma derivative (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    Nonempty (WhittakerCoinvariants (rho.comp U.subtype) psi ≃ₗ[A] A) := by sorry
lemma fibers (rho : Representation A G V) (U : Subgroup G) (psi : U →* Aˣ)
    (h : CoWhittaker rho U psi) :
    ∀ (P : Ideal A) (hP : P.IsPrime),
    letI := hP
    letI : CommRing P.ResidueField := Field.toCommRing
    EssentiallyAIG
      (Representation.smoothVectors (Representation.dual (Representation.baseChange rho P.ResidueField))).toRepresentation
      U ((Units.map (algebraMap A P.ResidueField).toMonoidHom).comp psi) := by sorry
-- scalars and field: the GL_n generic/finite-length cosocle hypotheses are
-- omitted rather than stated for arbitrary groups.
lemma twoCopies [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := by sorry
example [Nontrivial A] (rho : Representation A G V)
    (U : Subgroup G) (psi : U →* Aˣ) (h : CoWhittaker rho U psi) :
    ¬ CoWhittaker (rho.prod rho) U psi := by sorry
lemma nongeneric [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := by sorry
example [Nontrivial A] (rho : Representation A G V) (U : Subgroup G)
    (psi : U →* Aˣ) [Subsingleton (WhittakerCoinvariants (rho.comp U.subtype) psi)] :
    ¬ CoWhittaker rho U psi := by sorry
end CoWhittaker
end Families

section DerivativeInterfaces
variable {C : Type u} [Category.{v} C]
/-- An endofunctor adapter after embedding all mirabolic ranks in a common
carrier. Actual rank-changing Phi/Psi functors and their descent are omitted
until SR.2 and the integral type envelopes exist. This formula fixes iteration order. -/
def iterateFunctor (F : C ⥤ C) : ℕ → C ⥤ C
  | 0 => 𝟭 C
  | r+1 => F ⋙ iterateFunctor F r
def BZDerivative (Phi Psi : C ⥤ C) : ℕ → C ⥤ C
  | 0 => 𝟭 C
  | r+1 => (iterateFunctor Phi r) ⋙ Psi
namespace BZDerivative
lemma zero (Phi Psi : C ⥤ C) : BZDerivative Phi Psi 0 = 𝟭 C := by sorry
lemma top (Phi Psi : C ⥤ C) (n : ℕ) :
    BZDerivative Phi Psi (n+1) = (iterateFunctor Phi n) ⋙ Psi := by sorry
lemma baseChange (Phi Psi B : C ⥤ C)
    (hPhi : Phi ⋙ B ≅ B ⋙ Phi) (hPsi : Psi ⋙ B ≅ B ⋙ Psi) (r : ℕ) :
    Nonempty (BZDerivative Phi Psi r ⋙ B ≅ B ⋙ BZDerivative Phi Psi r) := by sorry
lemma rankOne (Psi : C ⥤ C) : Nonempty (BZDerivative (𝟭 C) Psi 1 ≅ Psi) := by sorry
lemma range (Phi Psi : C ⥤ C) : Nonempty (BZDerivative Phi Psi 2 ≅ Phi ⋙ Psi) := by sorry
-- induced: the genuine normalized-parabolic top-derivative tensor signature
-- needs the GL_n and mirabolic carrier; it is not asserted for arbitrary C.
example (Psi : C ⥤ C) : Nonempty (BZDerivative (𝟭 C) Psi 1 ≅ Psi) := by sorry
example (Phi Psi : C ⥤ C) : Nonempty (BZDerivative Phi Psi 2 ≅ Phi ⋙ Psi) := by sorry
example (Phi Psi : C ⥤ C) : BZDerivative Phi Psi 0 = 𝟭 C := by sorry
end BZDerivative
end DerivativeInterfaces

section SchwartzInterface
variable {A M V : Type*} [CommRing A] [AddCommGroup M] [Module A M]
  [AddCommGroup V] [Module A V]
/-- Range of the canonical mirabolic map. Its construction from Phi/Psi,
injectivity and group-specific derivative are omitted in this interface. -/
def SchwartzSubmodule (iota : M →ₗ[A] V) : Submodule A V := LinearMap.range iota
namespace SchwartzSubmodule
lemma injective (iota : M →ₗ[A] V) (h : Function.Injective iota) :
    Nonempty (M ≃ₗ[A] SchwartzSubmodule iota) := by sorry
-- derivative and endomorphisms: actual mirabolic functors and canonical map
-- are needed; the formula range(iota) cannot prove these statements by itself.
lemma rankOne : SchwartzSubmodule (LinearMap.id : V →ₗ[A] V) = ⊤ := by sorry
lemma zeroDerivative : SchwartzSubmodule (0 : M →ₗ[A] V) = ⊥ := by sorry
-- tensor: the canonical-map tensor signature awaits the actual derivative.
example : SchwartzSubmodule (LinearMap.id : V →ₗ[A] V) = ⊤ := by sorry
example : SchwartzSubmodule (0 : M →ₗ[A] V) = ⊥ := by sorry
end SchwartzSubmodule
end SchwartzInterface

section CompactInductionInterface
variable {A G : Type*} [CommRing A] [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G]
/-- Function-space part of c-Ind_U^G psi. For closed U, local constancy makes
its quotient support closed; compact support modulo U is expressed by a
compact set of representatives. The block projector is omitted. -/
def UniversalWhittaker (U : Subgroup G) (psi : U →* Aˣ) : Submodule A (G → A) where
  carrier := {f | IsLocallyConstant f ∧
    (∀ (u : U) (g : G), f (u * g) = (psi u : A) * f g) ∧
    ∃ C : Set G, IsCompact C ∧ ∀ g, f g ≠ 0 → ∃ (u : U) (c : G), c ∈ C ∧ g = u * c}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry
namespace UniversalWhittaker
-- represents, center, line, nongeneric, genericSimple, baseChange: the actual
-- GL_n, nondegenerate-character and integral-block projective carrier is
-- needed for these six signatures. They are omitted,
-- rather than falsely asserted for arbitrary closed subgroups U.
end UniversalWhittaker
end CompactInductionInterface

section Cocycle
variable {Gamma H : Type*} [Group Gamma] [Group H]
structure CrossedCocycle (action : Gamma →* MulAut H) where
  value : Gamma → H
  cocycle : ∀ g h, value (g*h) = value g * action g (value h)
namespace CrossedCocycle
lemma one (action : Gamma →* MulAut H) (c : CrossedCocycle action) : c.value 1 = 1 := by sorry
def gauge (action : Gamma →* MulAut H) (h : H) (c : CrossedCocycle action) :
    CrossedCocycle action where
  value g := h * c.value g * (action g h)⁻¹
  cocycle := by sorry
def map {J : Type*} [Group J] (a : Gamma →* MulAut H) (b : Gamma →* MulAut J)
    (f : H →* J) (hf : ∀ g x, f (a g x) = b g (f x)) (c : CrossedCocycle a) :
    CrossedCocycle b where
  value g := f (c.value g)
  cocycle := by sorry
lemma trivialAction (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := by sorry
def identityCocycle (a : Gamma →* MulAut H) : CrossedCocycle a where
  value _ := 1
  cocycle := by sorry
lemma coboundary (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := by sorry
example (c : CrossedCocycle (1 : Gamma →* MulAut H)) (g h : Gamma) :
    c.value (g*h) = c.value g * c.value h := by sorry
example (a : Gamma →* MulAut H) (g : Gamma) : (identityCocycle a).value g = 1 := by sorry
example (a : Gamma →* MulAut H) (h : H) (g : Gamma) :
    (gauge a h (identityCocycle a)).value g = h * (a g h)⁻¹ := by sorry
end CrossedCocycle
end Cocycle

section Excursions
variable {A H I V : Type*} [CommRing A] [Group H] [AddCommGroup V] [Module A V]
/-- Concrete matrix-coefficient data, not an assumed geometric Hecke action.
The full finite Weil-action component and colimit algebra are omitted. -/
structure ExcursionDatum (A H I V : Type*) [CommRing A] [Group H]
    [AddCommGroup V] [Module A V] where
  rho : Representation A (I → H) V
  alpha : V
  beta : V →ₗ[A] A
  alpha_fixed : ∀ h : H, rho (fun _ => h) alpha = alpha
  beta_fixed : ∀ h : H, ∀ v, beta (rho (fun _ => h) v) = beta v
namespace ExcursionDatum
def matrixCoefficient (D : ExcursionDatum A H I V) (h : I → H) : A := D.beta (D.rho h D.alpha)
lemma diagonalInvariant (D : ExcursionDatum A H I V) (k : H) (h : I → H) :
    D.matrixCoefficient (fun i => k * h i * k⁻¹) = D.matrixCoefficient h := by sorry
/-- Matrix-coefficient product only; the finite Weil-action exterior datum
and its geometric operator comparison remain omitted. -/
lemma tensorProduct {W : Type*} [AddCommGroup W] [Module A W]
    (D : ExcursionDatum A H I V) (E : ExcursionDatum A H I W)
    (b : (V ⊗[A] W) →ₗ[A] A)
    (hb : ∀ v w, b (v ⊗ₜ[A] w) = D.beta v * E.beta w) (h : I → H) :
    b ((D.rho.tprod E.rho) h (D.alpha ⊗ₜ[A] E.alpha)) =
      D.matrixCoefficient h * E.matrixCoefficient h := by sorry
lemma unit (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) :
    D.matrixCoefficient h = 1 := by sorry
lemma zeroAnnihilation (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) :
    D.matrixCoefficient h = 0 := by sorry
lemma singleton (D : ExcursionDatum A H Unit V) (h : Unit → H) :
    D.matrixCoefficient h = D.beta D.alpha := by sorry
example (D : ExcursionDatum A H I A) (hrho : D.rho = Representation.trivial A (I → H) A)
    (ha : D.alpha = 1) (hb : D.beta = LinearMap.id) (h : I → H) : D.matrixCoefficient h = 1 := by sorry
example (D : ExcursionDatum A H I V) (hb : D.beta = 0) (h : I → H) : D.matrixCoefficient h = 0 := by sorry
example (D : ExcursionDatum A H Unit V) (h : Unit → H) : D.matrixCoefficient h = D.beta D.alpha := by sorry
end ExcursionDatum
end Excursions

section CenterFiniteness
variable {R Z G V : Type*} [CommRing R] [CommRing Z] [Algebra R Z]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [AddCommGroup V] [Module Z V]
/-- Z is to be the actual image of the smooth categorical center. This
predicate separates its finite type from finite invariant modules.
The categorical image construction is omitted until SR.0 provides its carrier. -/
def ZFinite (rho : Representation Z G V) : Prop :=
  Algebra.FiniteType R Z ∧ ∀ K : Subgroup G, IsOpen (K : Set G) → IsCompact (K : Set G) →
    Module.Finite Z (Representation.invariants (rho.comp K.subtype))
namespace ZFinite
-- image and subquotient: the smooth-category center-image and subquotient
-- signatures are omitted; an arbitrary chosen commutative action is not that image.
lemma invariants (rho : Representation Z G V) (h : ZFinite (R := R) rho)
    (K : Subgroup G) (ho : IsOpen (K : Set G)) (hc : IsCompact (K : Set G)) :
    Module.Finite Z (Representation.invariants (rho.comp K.subtype)) := by sorry
lemma zero [Algebra.FiniteType R Z] :
    ZFinite (R := R) (Representation.trivial Z G (Fin 0 → Z)) := by sorry
lemma scalarFinite (rho : Representation R G (Fin 2 → R)) (h : Representation.IsAdmissible rho) :
    ZFinite (R := R) rho := by sorry
-- infiniteDirectSum: omitted actual center-image computation; it is not enough
-- to assert an infinite invariant module is infinite over every possible Z.
example [Algebra.FiniteType R Z] :
    ZFinite (R := R) (Representation.trivial Z G (Fin 0 → Z)) := by sorry
example (rho : Representation R G (Fin 2 → R)) (h : Representation.IsAdmissible rho) :
    ZFinite (R := R) rho := by sorry
end ZFinite
end CenterFiniteness

section Stability
variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
/-- Explicit nilpotent/invertible decomposition; no “stable : Prop” field. -/
def StableOperator (T : Module.End R M) : Prop :=
  ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧
    IsCompl (LinearMap.ker (T^c)) I ∧
    (∀ x ∈ I, T x ∈ I) ∧
    (∀ y ∈ I, ∃! x : I, T x = y)
namespace StableOperator
lemma split (T : Module.End R M) (h : StableOperator T) :
    ∃ (c : ℕ) (I : Submodule R M), 0 < c ∧ IsCompl (LinearMap.ker (T^c)) I := by sorry
-- invertiblePart: the localization and contracting Hecke/Jacquet identification
-- are omitted until SR.2 and the depth generators exist.
-- dual: injective-cogenerator dual, not the ordinary scalar Hom dual, is needed.
lemma nilpotent (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator T := by sorry
lemma automorphism (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := by sorry
lemma mixed {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := by sorry
example (T : Module.End R M) (c : ℕ) (hc : 0 < c) (h : T^c = 0) : StableOperator T := by sorry
example (e : M ≃ₗ[R] M) : StableOperator e.toLinearMap := by sorry
example {N : Type*} [AddCommGroup N] [Module R N]
    (T : Module.End R M) (e : N ≃ₗ[R] N) (c : ℕ) (hc : 0 < c) (h : T^c = 0) :
    StableOperator (LinearMap.prodMap T e.toLinearMap) := by sorry
end StableOperator
end Stability

/- Named theorem signatures requiring unavailable carriers are omitted: the classical Satake
isomorphism and the canonical c-group fibre (local reductive carrier); the Macdonald and unitary
triangular counts; universal domination and minimal-prime reconstruction (integral type
envelopes); the conditional interpolation of the local Langlands correspondence; the finite
integral cocycle quotients; the geometric Hecke action and its compatibility theorems; and
bounded-depth centre finiteness with integral second adjointness (depth generators). The README
holds their full statements and proof routes. -/
end SRPlan



/- Planned signature inventory — NOT elaborated declarations.
The following names and mathematical signatures need the carriers or hypotheses
identified in the README. They are omitted from executable Lean,
not assumed as axioms. A successful lean-check does not validate these signatures.

SRPlan.twistedWeylInvariance [theorem]
Let W0=N_G(A)/Z_G(A) for the maximal F-split torus A and let Sigma* be the sum of positive dual coroots. S* lands in functions invariant for w*a=w(a)((Sigma*-w Sigma*)/2)(q). The difference is even, so this action is integral without a square root of q. Normalized S lands in the ordinary W0 invariants.

SRPlan.satakeIsomorphism [theorem]
Over Z[q^-1], S* identifies the spherical Hecke algebra with the twisted W0-invariant lattice algebra. After adjoining a specified q-half, S identifies it with ordinary W0 invariants. Coefficient versions use the integral triangular orbit-sum basis, including when the coefficient characteristic divides the order of W0.

SRPlan.torusCharacterDictionary [theorem]
Over an algebraically closed field with p invertible, unramified characters of T(F) are points of the Frobenius-coinvariant dual torus. This is the character-lattice dictionary, including nonsplit unramified tori.

SRPlan.frobeniusComponentInvariants [theorem]
Restriction from the dual group Frobenius component H semidirect Fr to the dual torus identifies conjugation-invariant regular functions with W0-invariant regular functions on the relative dual torus, over the fields and integral forms of TV §7.3. Closed conjugacy orbits are semisimple unramified parameters.

SRPlan.sphericalParameter [theorem]
For an algebraically closed coefficient field of characteristic different from p, a spherical Hecke character determines a semisimple unramified parameter. The K-fixed line in unnormalized Ind_P^G(theta) has character f mapped to theta(S*f) and parameter t_theta a0^-1 semidirect Fr; normalized induction has parameter t_chi semidirect Fr.

SRPlan.cGroupFormulation [theorem]
In the earlier TV formulation and coefficient characteristic different from two, the c-group is (L-group times G_m)/the central order-two subgroup generated by (Sigma*(-1),-1). Its Frobenius fiber at the local cyclotomic value gives a canonical Satake invariant algebra, independent of q-half. The characteristic-two case retains the preceding pseudoroot formulation.

SRPlan.glnGenerators [theorem]
For GL_n(F), S([K diag(varpi repeated r,1 repeated n-r) K])=q^(r(n-r)/2) e_r(X_1,...,X_n). The scalar coset is invertible, and the target is the symmetric Laurent polynomial ring. Reuse the existing arithmetic GL_n Hecke algebra and central-coset localization comparison, rather than defining another multiplication.

SRPlan.macdonaldFormula [theorem]
For GL_n(E), with E/F unramified quadratic and q=card(k_F), S(1_lambda)=q^<lambda,2 rho> P_lambda(X;q^-2). Hall–Littlewood branching separates n=a+b variables into bidegrees with |alpha|+|beta|=|lambda|.

SRPlan.parabolicDescent.xiVariables [tests]
xi_(a,b) replaces the first a variables by q^-b X_i and the last b by q^-a Y_j.

SRPlan.unitaryWeylTraces [theorem]
For the unramified unitary rank-N dual group GL_N semidirect the pinned transpose-inverse involution, invariant lattice coordinates are the elementary symmetric functions in mu_i=x_i/x_(N+1-i)+x_(N+1-i)/x_i. The extended exterior-power tensor-dual representation has Frobenius-component trace equal to the subset sum of the products x_i/x_(N+1-i), with cardinality delta.

SRPlan.unitaryTriangularTransform [theorem]
For t_delta=(1 repeated delta,0 repeated N-2delta,-1 repeated delta), write T_delta for its hyperspecial double coset. Then q^(delta(N-delta)) trace(rho_(N,delta)) = sum_(i=0)^delta GaussianBinomial(N-2i,delta-i;-q) S(T_i). The matrix is unitriangular and gives an integral algorithm for all spherical calculations in Appendix B.

SRPlan.unitaryIsotropicCounts [theorem]
The product I of the two neighboring unitary lattice correspondences has coefficient at T_delta equal to the number of maximal isotropic subspaces in a residual hermitian space of dimension N-2delta. In even dimension 2k this is product_(i=1)^k(q^(2i-1)+1); in odd dimension 2k+1 it is product_(i=1)^k(q^(2i+1)+1). These coefficients define its hyperspecial spherical image.

SRPlan.unitaryEvenFormulas [theorem]
For N=2r, S(I)=q^(r^2) product_i(mu_i+2) and S((q+1)R-I)=-q^(r^2) product_i(mu_i-q-q^-1). Moreover S(R+(q+1)T)=-(q^(r^2+1)-q^(r^2-1)) sum_j product_(i not j)(mu_i-q-q^-1). R is the linear combination of T_delta with coefficient ((1-(-q)^(r-delta))/(q+1)) product_(i=1)^(r-delta)(q^(2i-1)+1); all apparent quotients are universal polynomials.

SRPlan.unitaryOddFormulas [theorem]
For N=2r+1, S(I)=q^(r^2+r) product_i(mu_i+q+q^-1) and S(T)=q^(r^2+r) product_i(mu_i-2). Here T=sum_delta d_(r-delta,q) T_delta and d_(k,q)=sum_(j=0)^k (-1)^j(2j+1) q^(j(j+1)) GaussianBinomial(2k+1,k-j;-q). Even-rank T uses d_bullet_(k,q)=(d_(k,q)+(((-q)^(k+1)-1)/(q+1)) product_(i=1)^k(q^(2i-1)+1))/(q+1), again evaluated as a polynomial.

SRPlan.gsp4GaloisComparison [comparison]
Under the q^-3/2 similitude twist convention, Q(X)=product_(xi=alpha,beta,gamma,delta)(1-xi X), with alpha delta=beta gamma, T0=q^-3 alpha delta and the generator evaluations of Pilloni §5.1.4. Substitution Tx1=T2, Tx2=T1, Sx=T0 identifies the reciprocal polynomial with Calegari–Geraghty Definition 6.7. This is a local normalization comparison, not a construction of global Galois representations.

SRPlan.derivedSatake [theorem]
For split G, S=Z/ell^r, q congruent to 1 modulo ell^r and ell not dividing |W|, derived spherical restriction gives a graded algebra isomorphism with (S[Lambda] tensor H*(T(k_F),S))^W. Its degree-zero map is the classical Satake specialization. The Iwahori-to-spherical Morita comparison is restricted to the etale locus of Spec S[Lambda] over Spec S[Lambda]^W.

SRPlan.unitaryIwahoriCenter [comparison]
In the unitary odd-rank Iwahori examples of Clozel–Thorne §2.1, the Bernstein presentation identifies the center with the relative-Weyl invariant lattice algebra; its hyperspecial comparison uses the same Satake normalization. The integral quadratic relation is (T_s+1)(T_s-q_s)=0. Over integral coefficients the generators use the positive braid monoid; the braid group becomes available only after the q_s are units.

SRPlan.geometricTraceContract [comparison]
Export the normalized Satake isomorphism, dominant-coweight basis and Weyl-module trace functions with explicit q-half and Frobenius. A downstream geometric Satake trace comparison must use these same functions and normalizations. The geometric equivalence is not used to prove SR.4.

SRPlan.BZDerivative.induced [tests]
The top derivative of a normalized parabolic induction is the tensor product of the top derivatives of its Levi factors.

SRPlan.derivativeExactness [theorem]
If p is a unit in A and the required character is defined or descended, Psi^-, Phi^-, their induction partners and all derivatives are exact. The standard adjunctions, Psi^- Psi^+=Id, Phi^- Phi^+=Id, mixed vanishings, and 0 to Phi^+Phi^- to Id to Psi^+Psi^- to 0 hold in the smooth mirabolic category. Derivatives commute with arbitrary A-module tensoring.

SRPlan.SchwartzSubmodule.derivative [api]
J(V) has the same top derivative as V.

SRPlan.SchwartzSubmodule.endomorphisms [api]
Restriction identifies End_(P_n)(J(V)) with End_A(V^(n)).

SRPlan.SchwartzSubmodule.tensor [tests]
J(M tensor V)=M tensor J(V), for an arbitrary coefficient module M.

SRPlan.EssentiallyAIG.endomorphisms [api]
Every equivariant endomorphism is scalar.

SRPlan.integralBlocks [theorem]
For algebraically closed k of characteristic ell different from p, the smooth W(k)[GL_n(F)] category decomposes by mod-ell inertial supercuspidal support. Each block center A_[L,pi] is a reduced, ell-torsion-free finite-type W(k)-algebra. Its k-points classify exact supercuspidal supports of simple representations in that block. This center specializes the existing abstract CatCenter, not a new abstract center construction.

SRPlan.typeProjectives [theorem]
For a maximal distinguished cuspidal k-type (K,tau), the compactly induced projective envelope P_(K,tau) has commutative endomorphism ring E_(K,tau), is E-admissible, and its top derivative is locally free of rank one over E. Every prime fiber has absolutely irreducible generic cosocle and essentially AIG smooth dual.

SRPlan.UniversalWhittaker.represents [api]
Hom_G(W_[L,pi],V) is naturally the top derivative of the block part of V.

SRPlan.UniversalWhittaker.center [api]
End_G(W_[L,pi]) is the integral block center.

SRPlan.UniversalWhittaker.line [api]
The top derivative is free of rank one over the center.

SRPlan.UniversalWhittaker.nongeneric [tests]
Hom_G(W,V)=0 for a representation with zero top derivative.

SRPlan.UniversalWhittaker.genericSimple [tests]
A generic simple fiber is a nonzero quotient of the corresponding universal fiber.

SRPlan.UniversalWhittaker.baseChange [tests]
After a center map to A, the top derivative of W tensor A is A.

SRPlan.CoWhittaker.scalars [api]
The natural A to End_(A[G])(V) map is an isomorphism.

SRPlan.CoWhittaker.field [tests]
Over a field a finite-length admissible family is co-Whittaker exactly when its cosocle is absolutely irreducible generic and its top derivative has dimension one.

SRPlan.universalDomination [theorem]
For any Noetherian A and center map A_[L,pi] to A, W_[L,pi] tensor A is co-Whittaker and surjects onto every co-Whittaker A-family with that center character. A co-Whittaker family has a uniquely determined center character through its scalar endomorphisms. Domination does not assert that every quotient is isomorphic to the universal object.

SRPlan.reducedFamilyReconstruction [theorem]
Let A be a reduced Noetherian algebra over the block center and choose nonzero generic-cosocle quotients V_a of the universal fibers at its finitely many minimal primes. The image of the diagonal universal map in the product of V_a is co-Whittaker, A-torsion-free and uniquely determined by these generic fibers in the sense of Helm Lemma 6.4.

SRPlan.llcFamilyConditional [theorem]
In Helm arXiv v1, for a complete reduced ell-torsion-free Noetherian local W(k)-algebra A and a Galois family rho, existence of the desired pi(rho) follows from the conjectural integral Bernstein-center interpolation map of Conjecture 7.4. Uniqueness, when a family with the stated generic fibers exists, is the Emerton–Helm theorem. This source does not prove the interpolation conjecture in general.

SRPlan.tensorEndomorphisms [theorem]
For a co-Whittaker GL_2(Q_l) family V over a Noetherian Z_p-algebra A, p different from l, and any A-module M, End_A(M) to End_(A[G])(M tensor_A V) is an isomorphism. After renaming local residue characteristic to p and coefficient characteristic to ell, the Schwartz proof extends to GL_n with the preceding derivative package; the generalization is a planned proof, not a misquotation of Proposition B.10.

SRPlan.invariantsDualityBaseChange [comparison]
For a ring map A to B there is a natural map B tensor_A V^K to (B tensor_A V)^K. It is an isomorphism under an available averaging projector with invertible pro-order, and otherwise only with separately proved hypotheses; it is not asserted for arbitrary hyperspecial K or arbitrary base change. Smooth duality over fields and its base-change compatibility for admissible finite-dimensional invariant modules are kept separate from injective-cogenerator duality.

SRPlan.extSupportOrthogonality [theorem]
For irreducible admissible representations of GL_n or its Levi over a field of characteristic different from p, nonzero Ext^i implies the same exact supercuspidal support. In a supercuspidal block the Laurent-coordinate maximal ideals kill Ext, so distinct unramified twists have zero Ext; inertial equivalence alone is insufficient for nonvanishing.

SRPlan.cgDistinctBlock [theorem]
In the Calegari–Geraghty setup, A=O/varpi^k, q congruent to 1 modulo ell and residual unramified Frobenius eigenvalues distinct. There is a unique irreducible unramified principal series pi attached to the residual semisimple parameter. The locally admissible category with every irreducible subquotient pi is equivalent to the direct-limit finite-length module category of the completed ordered-character deformation algebra: independent pro-ell residual-unit cyclic variables of order d and independent formal unramified variables X_i.

SRPlan.cgDerivedProjector [theorem]
In that distinct residual-eigenvalue block, projection e_alpha to a chosen simple Frobenius root induces an isomorphism from hyperspecial invariants to the distinguished line-parahoric invariants, and an isomorphism on all their right derived functors. The projector is the stabilized Q(V)^(n!) construction of CG, with Q isolating the chosen residual root; the result is specific to this local block.

SRPlan.highestDerivativeAdapter [comparison]
For the characteristic-zero GL_n multisegment convention used by Atobe–Kondo–Yasuda, the highest nonzero normalized derivative is irreducible and is obtained by the corresponding endpoint shortening. Their iterated highest-derivative notation is distinguished from the fixed-order D^r functors above. The local-conductor/newvector application belongs to its established GL_2 owner.

SRPlan.essentialVectorContract [application]
Export Whittaker representability, derivative base change, Schwartz generation, co-Whittaker domination and the correctly conditioned invariant and duality maps for integral essential-vector applications. A canonical GL_n essential vector over arbitrary nonreduced A is not deduced from rank-one derivatives alone. The field GL_2 conductor/newvector theory and the Fouquet–Wan minimal-lift line keep their assigned owners under RS-21.

SRPlan.finiteWildDiscretization [theorem]
Choose arithmetic Frobenius Fr and a compatible tame generator s. W_F^0 is the preimage of Z[1/q] semidirect Fr^Z inside W_F; Fr s Fr^-1=s^q. For a normal open finite-action-compatible wild subgroup P_F^e, W_F^0/P_F^e is finitely presented. Its topology keeps the wild subgroup profinite and the tame–Frobenius quotient discrete.

SRPlan.finiteWildRepresentability [theorem]
For the pinned split dual group H over Z[1/p] with finite Weil action, the cocycle functor on W_F^0/P_F^e is represented by a finite-presentation affine scheme, realized as the closed relation locus in H^r for a finite presentation of the group. Construct this scheme once over Z[1/p]; its Z_ell models are base changes, not independent schemes. The expected fiber dimension is dim(H over the base), while the total dimension over Z[1/p] includes the base dimension.

SRPlan.ellAdicExtension [theorem]
After base change to Z_ell, ell different from p, the universal finite-wild cocycle extends continuously to W_F/P_F^e in the relative discrete ell-adic sense of DHKM. Changes of tame generator and Frobenius give canonical ell-adic functor comparisons; the integral discretized schemes are not thereby identified over Z[1/p].

SRPlan.wildStrata [theorem]
Over the algebraic integral base used by DHKM, wild cocycles have finitely many H-conjugacy classes; their centralizers have reductive connected components. The finite-wild scheme decomposes into induced tame cocycle strata for the centralizers, after choosing extensions of the wild cocycle that normalize a Borel pair.

SRPlan.twistedComponentFiniteness [theorem]
If H is a closed reductive subgroup of a reductive G over the integral base of DHKM and is stable under Int(g) theta, the induced map from the relevant H g theta component quotient to the G theta component quotient is finite. The construction descends from the algebraic integral base after the finite scalar extensions used in §2.

SRPlan.tameTorusEngine [theorem]
For a tame stratum with semisimple inertia s and a normalizer representative n, the equation n Fr(t) n^-1 t^-q=s^q(n)n^-1 lies in the maximal fixed subtorus T^(s,0). The torus endomorphism n Fr-q is an isogeny, giving a finite map to the allowed normalizer components. Closed orbits are reached by this torus locus.

SRPlan.frobeniusQuotientFinite [theorem]
The Frobenius evaluation Z^1(W_F^0/P_F^e,H)//H to the twisted Frobenius component H semidirect Fr//H is finite over Z[1/p]. After restriction to a Weil-stable closed reductive subgroup, the induced cocycle quotient map is also finite.

SRPlan.excursionInvariantComparison [theorem]
The excursion algebra maps to the finite-wild invariant cocycle ring by a universal homeomorphism, becomes an isomorphism after inverting ell and has nilpotent ell-torsion. The strong integral isomorphism requires ell not dividing the torsion order of the dual fundamental group. The reduced excursion algebra has finite Frobenius/reductive-subgroup restriction maps without that good-prime assumption.

SRPlan.geometricHeckeAction [theorem]
For the Fargues–Scholze lisse derived category on Bun_G over ell-adic coefficients with the specified q-half, construct the exact monoidal, finite-set-compatible Hecke action with W_F^I descent, preservation of compact/ULA objects and a uniform finite-wild bound on each compact object. Its restriction to the trivial G-bundle stratum yields the smooth representation action used by DHKM. This is an actual geometric construction, not a tuple of assumed functors.

SRPlan.excursionCenterAction [theorem]
The finite-set Hecke action gives a ring map Exc(W,H) to the categorical center by S_(I,V,alpha,beta,gamma)=T_beta gamma T_alpha. The maps satisfy the free-group excursion relations, and every finitely generated smooth representation is acted on through some finite-wild quotient. No strong spectral-center/invariant-ring isomorphism is needed.

SRPlan.torusCentralCompatibility [theorem]
The excursion action for a torus agrees with the local class-field character action. The action is compatible with products, Weil restriction and homomorphisms inducing an adjoint-group isomorphism. In particular its restriction to the maximal split connected center of G agrees with the central character of a smooth cuspidal representation.

SRPlan.parabolicExcursionCompatibility [theorem]
For normalized parabolic induction, the excursion action commutes with the dual-Levi restriction map. For unnormalized induction the ratio of the rho_G and rho_M cyclotomic twists is retained. The chosen delta_P^(1/2) normalization cancels that ratio in the normalized statement.

SRPlan.ZFinite.image [api]
Z_V is the image subalgebra in equivariant endomorphisms.

SRPlan.ZFinite.subquotient [api]
Over a Noetherian base, Z-finiteness passes to subquotients.

SRPlan.ZFinite.infiniteDirectSum [tests]
An infinite direct sum of the trivial representation over a field is not Z-finite.

SRPlan.depthGenerators [theorem]
A bounded-depth smooth block over p-invertible coefficients has a finitely generated projective generator built from compact pro-p induction. Z-finiteness of all finitely generated objects is equivalent to finite-over-finite-type-center behavior of the corresponding Hecke corners. The depth splitting and these generators are the integral Dat inputs; the compact-open corner comparison is supplied by SR.1.

SRPlan.cuspidalEmbedding [theorem]
A finitely generated projective smooth representation over the algebraic ell-adic coefficient base embeds into a finite direct sum of normalized parabolic inductions of finitely generated ell-torsion-free cuspidal Levi modules. This is proved by characteristic-zero cuspidal-support theory and stable lattices; it is not integral supercuspidal classification by assertion.

SRPlan.cuspidalExcursionFiniteness [theorem]
For a finitely generated ell-torsion-free cuspidal lattice, the excursion action factors through the reduced finite-wild algebra: nilpotent ell-torsion acts trivially. Torus/central compatibility makes the lattice admissible over the relevant central-character excursion algebra. Reductive-subgroup restriction finiteness then transfers this finite-module property to parabolic inductions.

SRPlan.integralCenterFiniteness [theorem]
If R is a Noetherian Z_ell-algebra with ell different from p, every finitely generated smooth R[G(F)] representation is Z-finite, and each Hecke algebra R[K backslash G(F) slash K] is a finite module over its finite-type R-center. Bounded-depth centers are finite over the corresponding reduced finite-wild excursion algebras.

SRPlan.parabolicCenterMap [theorem]
For a Noetherian flat Z[1/p]-algebra R, there is a unique map Z_R(G) to Z_R(M) intertwining unnormalized parabolic induction. On bounded-depth centers over Z_ell, the Levi center is finite over the induced G-center action, with arbitrary Noetherian Z_ell coefficient extension as in DHKM §4.1.

SRPlan.StableOperator.invertiblePart [api]
The stable image identifies with the localization M[T^-1].

SRPlan.StableOperator.dual [api]
Stability passes to the injective-cogenerator dual with adjoint operator.

SRPlan.ellAdicStability [theorem]
Finite-center control makes the Jacquet module of a bounded-depth compact pro-p projective generator admissible over the G-center. Consequently every such generator is K,P-stable. The nilpotence bound may be chosen independently of ell different from p by comparing its torsion-free characteristic-zero Hecke operator with the complex operator.

SRPlan.cogenerators [theorem]
The smooth dual Hom_Zell(V,Q_ell/Z_ell) of a compact pro-p projective generator is an injective cogenerator for the appropriate ell-primary smooth category. Every simple Z[1/p] smooth representation embeds into one of these cogenerators; arbitrary objects admit resolutions by products across ell different from p. These duals use injective coefficient modules, not ordinary scalar duals.

SRPlan.jacquetCogeneratorDuality [theorem]
For the smooth dual V-vee=Hom_Z[1/p](V,Q/Z[1/p])^smooth, stability gives R_P(V-vee) isomorphic to (R_oppositeP V)-vee. The pairing on compact-open invariants descends to the mutually adjoint invertible Hecke summands, and the isomorphism is natural.

SRPlan.integralSecondAdjointness [theorem]
For every commutative Z[1/p]-algebra R, unnormalized I_P is left adjoint to delta_P R_oppositeP. If a specified square root delta_P^(1/2) exists, normalized i_P is left adjoint to normalized r_oppositeP. Construct the natural Hom equivalence, its unit and counit and both triangle identities. No Noetherian or Z_ell-algebra hypothesis is imposed on this final adjunction.

SRPlan.integralNoetherianConsequences [theorem]
For a Noetherian Z[1/p]-algebra R, the relevant Hecke algebras are Noetherian, induction preserves projectives and finite generation, and Jacquet functors preserve admissibility. An irreducible Qbar_ell representation is integral exactly when its supercuspidal support is integral. Finite-over-center remains the stronger Z_ell-algebra theorem already stated.

SRPlan.cuspidalReductionConsequences [theorem]
For an irreducible integral ell-adic representation, cuspidality of its reduction implies cuspidality of the characteristic-zero representation. For an irreducible cuspidal Levi representation, induction is irreducible on a nonempty open set of unramified characters in the coefficient setting of DHKM Corollary 4.12, and the associated parabolic inductions have the stated common Grothendieck-class comparison.

## SR.0–SR.3a targets not elaborated above (local reductive carriers needed)

Representation.IsSmooth [definition]
Let G be a topological group, A a commutative ring and ρ : Representation A G V a representation on an A-module V (no topology on V). The representation is smooth if for every v ∈ V the stabiliser {g ∈ G | ρ g v = v} is open in G. For a locally profinite G this is equivalent to: every v is fixed by some compact open subgroup, i.e. V = ⋃_U V^U over compact open U.

Representation.IsSmooth [api]
IsSmooth ρ :⇔ ∀ v, IsOpen {g | ρ g v = v}.

Representation.isSmooth_iff_exists_openSubgroup [api]
For a NonarchimedeanGroup G: smooth iff every v is fixed by some open subgroup; for a locally profinite G: iff every v is fixed by some compact open subgroup.

Representation.IsSmooth.subrepresentation [api]
A subrepresentation of a smooth representation is smooth.

Representation.IsSmooth.quotient [api]
A quotient representation of a smooth representation is smooth.

Representation.IsSmooth.directSum [api]
Arbitrary direct sums and filtered colimits of smooth representations are smooth (a vector lies in finitely many summands).

Representation.IsSmooth.tprod [api]
The tensor product over A of two smooth representations is smooth.

Representation.IsSmooth.comp_continuous [api]
Restriction along a continuous homomorphism H →* G preserves smoothness; inflation along a continuous open surjection G → G/N preserves smoothness.

Representation.isSmooth_ofMulAction_quotient [api]
A[G ⧸ U] is smooth when U is open.

Representation.isSmooth_iff_isSmoothDiscrete [api]
For A with the discrete topology, IsSmooth ρ ↔ TauCeti.IsSmoothDiscrete of the object of TopRep A G with discrete underlying module.

Representation.isSmooth_iff_isSmoothDiscrete_test [test]
For ZMod 3 acting trivially on itself, IsSmooth holds and agrees with TauCeti.IsSmoothDiscrete; for (ZMod 3)ˣ with the indiscrete topology acting by multiplication both fail (TauCeti.not_isSmoothDiscrete_ofDiscreteModule_units_zmod).

Representation.smoothVectors [construction]
For a topological group G and any representation ρ : Representation A G V, the smooth vectors V^∞ = {v ∈ V | the stabiliser of v is open} form a subrepresentation, and V^∞ = ⋃_U V^U over compact open U when G is locally profinite. The assignment V ↦ V^∞ is a functor smoothPart : Rep A G ⥤ SmoothRep A G which is right adjoint to the inclusion ι : SmoothRep A G ⥤ Rep A G; the counit ι(V^∞) → V is the inclusion and is an isomorphism exactly when V is smooth, so SmoothRep A G is a coreflective full subcategory of Rep A G.

Representation.smoothVectors [api]
The subrepresentation V^∞ of a representation of a topological group.

Representation.mem_smoothVectors_iff [api]
v ∈ V^∞ ↔ IsOpen (stabiliser of v); for locally profinite G ↔ ∃ compact open U, v ∈ V^U.

Representation.smoothVectors_isSmooth [api]
The restriction of ρ to V^∞ is smooth.

Representation.smoothVectors_eq_top_iff [api]
V^∞ = ⊤ iff ρ is smooth.

SmoothRep.coreflective [api]
The inclusion ι is Coreflective (fully faithful with right adjoint smoothPart).

SmoothRep.smoothPart_preservesLimits [api]
smoothPart preserves all limits; products in SmoothRep A G are smooth parts of products of representations.

Representation.smoothVectors_product_ne_top [test]
For G = ℤ_p, the product over n of ℤ[ℤ_p ⧸ p^n ℤ_p] is not smooth: the family of basepoints is not a smooth vector.

Representation.smoothVectors_of_discreteTopology [test]
For G discrete, V^∞ = ⊤ for every representation.

Representation.smoothVectors_functions_eq_locallyConstant [test]
For G = ℤ_p acting on all functions ℤ_p → ℤ by translation, the smooth vectors are exactly the locally constant functions.

SmoothRep.of [api]
Bundles a smooth representation ρ with a proof of smoothness as an object.

SmoothRep.hom_ext [api]
Two morphisms are equal iff their underlying A-linear maps are equal.

SmoothRep.instLinear [api]
SmoothRep A G is A-linear.

SmoothRep.instHasColimits [api]
SmoothRep A G has all colimits and ι preserves them.

SmoothRep.instHasLimits [api]
SmoothRep A G has all limits, given by smoothPart of the limit in Rep A G.

SmoothRep.res [api]
Restriction along a continuous group homomorphism H → G as a functor SmoothRep A G ⥤ SmoothRep A H, exact, with resId and resComp.

SmoothRep.inflation [api]
For a closed normal subgroup N with G → G/N open (quotient topology), inflation SmoothRep A (G ⧸ N) ⥤ SmoothRep A G, fully faithful and exact.

SmoothRep.equivalence_of_discrete [test]
For G with the discrete topology, ι is an equivalence SmoothRep A G ≌ Rep A G.

SmoothRep.end_trivial [test]
The endomorphism algebra of the trivial object A of SmoothRep A G is A.

SmoothRep.not_closed_under_extensions [test]
For G = ℤ_p and A = ℚ, a non-continuous ℚ-linear map ℚ_p → ℚ defines an extension of the trivial representation by itself in Rep ℚ ℤ_p whose middle term is not smooth: SmoothRep is not a Serre subcategory of Rep.

SmoothRep.res_of_open_equiv [test]
For an open subgroup U ≤ G, res U of the permutation module A[G/V] (V ≤ U open) is a direct sum of permutation modules A[U/(U ∩ gVg⁻¹)] over the double cosets U\G/V (Tau Ceti's Mackey decomposition for algebraic induction).

SmoothRep.equivSmoothDiscreteTopRep [comparison]
Give A the discrete topology. Sending a smooth representation (V, ρ) to the object of TopRep A G with the discrete topology on V defines an equivalence between SmoothRep A G and Tau Ceti's SmoothDiscreteTopRep A G (objects of TopRep A G with discrete underlying module and open point stabilisers), compatible with forgetting to A-modules. On a discrete module, smoothness is equivalent to joint continuity of G × V → V (TauCeti.isSmoothDiscrete_iff_continuousSMul). Under this equivalence the closure of smooth objects under subobjects, quotients, finite products and restriction along continuous homomorphisms, proved for SmoothDiscreteTopRep by ProfiniteCohomology Layer 1, matches the closure statements of smooth-rep-abelian; nothing is re-proved on the TopRep side.

SmoothRep.invariantsFunctor [construction]
For a locally profinite G, a commutative ring A and a compact open subgroup U ≤ G, the U-invariants of a smooth representation V are Mathlib's invariants of the restriction, V^U = (ρ.comp U.subtype).invariants, an A-submodule of V. This gives an A-linear functor invariantsFunctor U : SmoothRep A G ⥤ ModuleCat A, left exact. It satisfies: restriction V^U ≤ V^{U'} for U' ≤ U; conjugation ρ(g) : V^U ≅ V^{gUg⁻¹}; for U' ≤ U open normal, V^U = (V^{U'})^{U/U'}; and the union description: V is smooth iff V = ⨆_U V^U, the supremum running over any neighbourhood basis of 1 consisting of compact open subgroups, and that family is directed. This extends Tau Ceti's profinite exhaustion iSup_fixedPoints_openNormal_eq_top (ProfiniteCohomology Layer 0) from open normal subgroups of a profinite group to the compact open subgroups of a locally profinite group.

SmoothRep.invariants [api]
V^U as an A-submodule of V for a compact open (or any) subgroup U.

SmoothRep.invariantsFunctor [api]
The A-linear functor V ↦ V^U, SmoothRep A G ⥤ ModuleCat A, with its action on morphisms by restriction.

SmoothRep.invariants_antitone [api]
U' ≤ U implies V^U ≤ V^{U'}.

SmoothRep.invariants_conj [api]
ρ(g) maps V^U isomorphically onto V^{gUg⁻¹}.

SmoothRep.iSup_invariants_eq_top [api]
For a locally profinite G and a smooth V, ⨆ over compact open U of V^U = ⊤; conversely this equality implies smoothness.

SmoothRep.directed_invariants [api]
The family U ↦ V^U over compact open subgroups is directed.

SmoothRep.invariantsFunctor_preservesFiniteLimits [api]
invariantsFunctor U is left exact.

SmoothRep.invariants_eq_fixedPoints [api]
For G compact and U open normal, V^U equals Tau Ceti's FixedPoints.addSubgroup U V used by ProfiniteCohomology Layer 0.

SmoothRep.invariants_permutation_gl2 [test]
For G = GL_2(ℚ_p) and U = GL_2(ℤ_p), the U-invariants of ℤ[G/U] are free on the double cosets of diag(p^a,p^b), a ≥ b.

SmoothRep.invariants_top_of_trivial [test]
For the trivial representation, V^U = V for every U.

SmoothRep.invariants_not_exact_fp [test]
For G = ℤ/p (discrete) and A = F_p, the U = G invariants of F_p[G] → F_p (augmentation) are not surjective: invariantsFunctor is not right exact without invertibility of |U|.

SmoothRep.iSup_invariants_compat_profinite [test]
For G = ℤ_p the supremum over compact open subgroups equals the supremum over open normal subgroups of Tau Ceti's iSup_fixedPoints_openNormal_eq_top.

HasUnitProOrder.of_le [api]
Inherited by closed (in particular open) subgroups.

HasUnitProOrder.of_isProP [api]
A pro-p group (Tau Ceti's IsProP p U) has invertible pro-order in any A with IsUnit (p : A).

HasUnitProOrder.map [api]
Inherited along ring homomorphisms A → B.

hasUnitProOrder_iff_profiniteOrder [api]
Equivalent to invertibility of every prime p with TauCeti.profiniteOrder U p ≠ 0 (the supernatural order of ProfiniteProPGroups Layer 1).

HasCofinalUnitProOrder [api]
For locally profinite G: every neighbourhood of 1 contains a compact open subgroup U with HasUnitProOrder A U.

hasUnitProOrder_padicInt_iff [test]
HasUnitProOrder A ℤ_p ↔ IsUnit (p : A) (for A nonzero).

hasUnitProOrder_finite_iff [test]
For a finite discrete group U, HasUnitProOrder A U ↔ IsUnit (Nat.card U : A).

hasUnitProOrder_trivial [test]
The trivial group has invertible pro-order in every A.

not_hasUnitProOrder_padicInt_zmod_p [test]
ℤ_p does not have invertible pro-order in F_p.

SmoothRep.averaging [construction]
Let U be a compact open subgroup of a locally profinite G with pro-order invertible in A, and V a smooth A[G]-module. For v ∈ V choose an open normal subgroup U' ≤ U fixing v and set e_U v = [U : U']⁻¹ Σ_{u ∈ U/U'} ρ(u) v. This is independent of U', A-linear, natural in V, idempotent, has image V^U and commutes with every U-equivariant map; it extends Mathlib's Representation.averageMap from finite groups. For U' ≤ U, e_U e_{U'} = e_{U'} e_U = e_U. Its kernel is the span of {ρ(u)v − v : u ∈ U}.

SmoothRep.averaging [api]
e_U : V →ₗ[A] V for a smooth V and U with HasUnitProOrder A U.

SmoothRep.averaging_apply [api]
e_U v = [U:U']⁻¹ Σ_{u∈U/U'} ρ u v for any open normal U' ≤ U fixing v.

SmoothRep.averaging_idem [api]
e_U ∘ e_U = e_U.

SmoothRep.range_averaging [api]
range e_U = V^U.

SmoothRep.ker_averaging [api]
ker e_U = span{ρ u v − v}.

SmoothRep.averaging_naturality [api]
f ∘ e_U = e_U ∘ f for every U-equivariant A-linear f between smooth representations.

SmoothRep.averaging_comp_of_le [api]
e_U ∘ e_{U'} = e_{U'} ∘ e_U = e_U for U' ≤ U.

SmoothRep.averaging_eq_averageMap [api]
On V^{U'} with U' open normal in U, e_U is Mathlib's Representation.averageMap of the finite group U/U'.

SmoothRep.averaging_sign [test]
For U = ℤ/2 acting by −1 on ℤ[1/2], e_U = 0.

SmoothRep.averaging_trivial [test]
On the trivial representation e_U = id.

SmoothRep.averaging_eq_averageMap_test [test]
For G finite discrete and U = G with |G| invertible, e_G = Representation.averageMap.

SmoothRep.averaging_requires_unit [test]
For U = ℤ/p over F_p no A-linear idempotent onto V^U commuting with U exists on F_p[U] (the invariants F_p·N are not a direct summand as an F_p[U]-module).

SmoothRep.invariantsFunctor_exact [theorem]
If U is a compact open subgroup of a locally profinite G with pro-order invertible in A, then invariantsFunctor U : SmoothRep A G ⥤ ModuleCat A is exact, commutes with arbitrary direct sums and filtered colimits, and V^U is a natural direct summand of V as an A[U]-module. Without the hypothesis exactness fails: for U = ℤ/p and A = F_p the U-invariants of F_p[U] → F_p are not surjective.

Representation.IsAdmissible [definition]
A smooth representation V of a locally profinite group G over a commutative ring A is admissible if for every compact open subgroup U the A-module V^U is finitely generated. Over a field this says dim V^U < ∞ (Casselman's definition). It suffices to check U in any neighbourhood basis of compact open subgroups when these have pro-order invertible in A, since then V^{U} is a direct summand of V^{U'} for U' ≤ U. Finite direct sums of admissible representations are admissible; over a noetherian A subrepresentations are admissible; quotients are admissible when invariants are exact (invariants-exact).

Representation.IsAdmissible [api]
IsAdmissible ρ :⇔ IsSmooth ρ ∧ ∀ U compact open, Module.Finite A (V^U).

Representation.isAdmissible_iff_basis [api]
Under HasCofinalUnitProOrder, it suffices to check U in a neighbourhood basis.

Representation.IsAdmissible.subrepresentation [api]
Over a noetherian A, subrepresentations of admissible representations are admissible.

Representation.IsAdmissible.quotient [api]
Quotients of admissible representations are admissible when every compact open subgroup has invertible pro-order.

Representation.IsAdmissible.prod [api]
Finite direct sums of admissible representations are admissible.

Representation.IsAdmissible.baseChange [api]
Admissibility is preserved by base change A → B when the coefficient-change map on invariants is an isomorphism (coefficient-change).

Representation.isAdmissible_iff_finiteDimensional [api]
Over a field k, admissible iff every V^U is finite-dimensional.

Representation.isAdmissible_of_finite [api]
Finite-dimensional smooth representations over a field are admissible.

Representation.isAdmissible_quotient_compact [test]
For G = ℤ_p and A = ℚ, ℚ[ℤ_p ⧸ p^n ℤ_p] is admissible with (·)^{ℤ_p} of dimension 1.

Representation.not_isAdmissible_cInd_qp [test]
For G = ℚ_p and A = ℚ, ℚ[ℚ_p ⧸ ℤ_p] is smooth but not admissible.

Representation.isAdmissible_zero [test]
The zero representation is admissible.

Representation.isAdmissible_iff_casselman [test]
Over ℂ, IsAdmissible agrees with Casselman's definition: smooth and dim_ℂ V^K < ∞ for every open compact K.

Representation.IsLocallyAdmissible [definition]
Two finiteness conditions are kept separate from admissibility. A smooth representation V is finitely generated if ρ.asModule is a finitely generated A[G]-module (Mathlib's Module.Finite over MonoidAlgebra A G). V is locally admissible if every v ∈ V generates an admissible subrepresentation A[G]·v. Admissible ⇒ locally admissible over a noetherian A; finitely generated and locally admissible ⇒ admissible over a noetherian A; neither admissibility nor finite generation implies the other.

Representation.IsLocallyAdmissible [api]
Every vector generates an admissible subrepresentation.

Representation.IsAdmissible.isLocallyAdmissible [api]
Admissible ⇒ locally admissible over a noetherian ring.

Representation.isAdmissible_of_fg_of_locallyAdmissible [api]
Finitely generated and locally admissible ⇒ admissible over a noetherian ring with invertible pro-orders.

Representation.fg_iff_module_finite [api]
Finite generation is Module.Finite (MonoidAlgebra A G) ρ.asModule; equivalently V is a quotient of ⊕_{i≤n} A[G/U_i] for compact open U_i.

Representation.IsLocallyAdmissible.subrepresentation [api]
Subrepresentations and quotients (with exact invariants) of locally admissible representations are locally admissible.

Representation.fg_not_admissible [test]
ℚ[ℚ_p ⧸ ℤ_p] is finitely generated and not admissible.

Representation.admissible_not_fg [test]
⊕_{n≥1} of characters of ℤ_p of exact conductor p^n (over ℚ(μ_{p^∞})) is admissible and not finitely generated.

Representation.isLocallyAdmissible_trivial [test]
The trivial representation is locally admissible and finitely generated.

Representation.fg_iff_quotient_permutation [test]
A smooth representation is finitely generated iff it is a quotient of a finite direct sum of permutation modules A[G/U] with U compact open.

SmoothRep.ofCharacter [api]
The smooth rank-one representation A(χ).

SmoothRep.twist [api]
The exact autoequivalence V ↦ V ⊗ χ with twist χ ∘ twist χ⁻¹ ≅ id and twist (χψ) ≅ twist χ ∘ twist ψ.

SmoothRep.invariants_twist [api]
(V ⊗ χ)^U = V^U for U ≤ ker χ.

isSmoothCharacter_unramified [test]
x ↦ t^{v_p(x)} on ℚ_p^× is a smooth character for any t ∈ Aˣ.

isSmoothCharacter_one [test]
The trivial character is smooth and twisting by it is the identity.

not_isSmoothCharacter_padicExp [test]
x ↦ (1+p)^x, ℤ_p → ℤ_p^×, is not smooth with ℤ_p^× discrete.

SmoothRep.twist_ofCharacter [test]
A(χ) ⊗ ψ = A(χψ).

SmoothRep.smoothDual [construction]
For a smooth representation (ρ, V) over A, the smooth dual (contragredient) is Ṽ = (Hom_A(V, A))^∞, the smooth part of Mathlib's algebraic dual representation Representation.dual ((g·λ)(v) = λ(ρ(g)⁻¹ v)). This is a contravariant A-linear functor SmoothRep A G ⥤ (SmoothRep A G)ᵒᵖ with: (1) Hom_G(V, W̃) ≅ Hom_G(W, Ṽ) naturally (both are the G-invariant bilinear pairings V × W → A); (2) a natural evaluation map V → Ṽ̃; (3) when U has invertible pro-order, (Ṽ)^U = Hom_A(V^U, A) via e_U; (4) over a field k in which all compact open subgroups have invertible pro-order, V ↦ Ṽ is exact and V → Ṽ̃ is injective, and it is an isomorphism iff V is admissible.

SmoothRep.smoothDual [api]
Ṽ := smoothPart (Representation.dual ρ).

SmoothRep.smoothDualFunctor [api]
The contravariant A-linear functor V ↦ Ṽ.

SmoothRep.homSmoothDualEquiv [api]
Hom_G(V, W̃) ≃ₗ[A] Hom_G(W, Ṽ), natural in V and W.

SmoothRep.toDoubleDual [api]
The natural map V → Ṽ̃.

SmoothRep.invariants_smoothDual [api]
(Ṽ)^U ≃ Hom_A(V^U, A) when HasUnitProOrder A U.

SmoothRep.toDoubleDual_bijective_iff [api]
Over a field with invertible pro-orders, V → Ṽ̃ is bijective iff V is admissible.

SmoothRep.smoothDual_exact [api]
Over a field with invertible pro-orders, smooth duality is exact.

SmoothRep.smoothDual_eq_dual [api]
For G discrete finite with invertible order, Ṽ = Representation.dual ρ.

SmoothRep.smoothDual_character [test]
The smooth dual of A(χ) is A(χ⁻¹).

SmoothRep.smoothDual_zero [test]
The smooth dual of 0 is 0.

SmoothRep.toDoubleDual_not_surjective [test]
For G = ℚ_p, k = ℚ and V = ℚ[ℚ_p/ℤ_p], V → Ṽ̃ is not surjective.

SmoothRep.smoothDual_eq_dual_test [test]
For G = ℤ/2 discrete and k = ℚ, the smooth dual of the sign representation is Representation.dual of it.

SmoothRep.baseChange [construction]
For a homomorphism of commutative rings A → B, base change V ↦ B ⊗_A V (Tau Ceti's Representation.baseChange) preserves smoothness and defines an additive functor SmoothRep A G ⥤ SmoothRep B G, left adjoint to restriction of scalars SmoothRep B G ⥤ SmoothRep A G. For a compact open U there is a natural B-linear map B ⊗_A V^U → (B ⊗_A V)^U. It is an isomorphism if B is flat over A or if U has pro-order invertible in A; it is not an isomorphism in general. A ring automorphism σ of A (for instance σ ∈ Aut(ℂ)) gives the σ-twist V ↦ A ⊗_{A,σ} V, an autoequivalence preserving admissibility and irreducibility.

SmoothRep.baseChange [api]
The functor SmoothRep A G ⥤ SmoothRep B G, V ↦ B ⊗_A V, with baseChange_id and baseChange_comp.

SmoothRep.restrictScalars [api]
Restriction of scalars SmoothRep B G ⥤ SmoothRep A G.

SmoothRep.baseChangeAdjunction [api]
baseChange ⊣ restrictScalars.

SmoothRep.baseChangeInvariants [api]
The natural map B ⊗_A V^U → (B ⊗_A V)^U.

SmoothRep.baseChangeInvariants_bijective_of_flat [api]
An isomorphism when B is flat over A.

SmoothRep.baseChangeInvariants_bijective_of_unit [api]
An isomorphism when HasUnitProOrder A U.

SmoothRep.twistRingAut [api]
The σ-twist for a ring automorphism σ of A, preserving admissibility and irreducibility.

SmoothRep.baseChange_eq_representation_baseChange [api]
On underlying representations, baseChange is Tau Ceti's Representation.baseChange.

SmoothRep.baseChangeInvariants_sign_not_surjective [test]
For U = ℤ/2 acting by sign on ℤ and B = F_2 the map 0 → F_2 is not surjective.

SmoothRep.baseChange_id [test]
Base change along the identity is naturally the identity functor.

SmoothRep.baseChangeInvariants_permutation [test]
For V = A[G/U'] and U compact open, B ⊗ V^U → (B ⊗ V)^U is an isomorphism (both free on the U-orbits of G/U').

SmoothRep.baseChange_compat_test [test]
The underlying representation of baseChange A B V is Representation.baseChange.

SmoothCentre.app [api]
The action z_V ∈ End_G(V).

SmoothCentre.naturality [api]
f ∘ z_V = z_W ∘ f for every G-map f : V → W.

SmoothCentre.ext [api]
z = z' iff z_V = z'_V for all V (equivalently for all V in a generating family, e.g. the A[G/U]).

SmoothCentre.algebraMap [api]
The ring map A → SmoothCentre A G (Linear.toCatCenter).

SmoothCentre.instCommRing [api]
A commutative ring structure (multiplication commutative by IsMulCommutative (CatCenter C)).

SmoothCentre.equivLimitOfCommutative [api]
For abelian G with HasCofinalUnitProOrder: SmoothCentre A G ≅ lim_U A[G/U].

SmoothCentre.trivialGroup [test]
For G trivial, SmoothCentre A G ≅ A.

SmoothCentre.finite_eq_center [test]
For G finite discrete, SmoothCentre A G ≅ the centre of A[G] (Mathlib Subring.center of MonoidAlgebra).

SmoothCentre.int_discrete [test]
For G = ℤ discrete and A a field, SmoothCentre A G ≅ A[t, t⁻¹].

SmoothCentre.padicInt_ne_groupRing [test]
For G = ℤ_p and A = ℚ(μ_{p^∞}), the map ℚ(μ_{p^∞})[ℤ_p] → SmoothCentre is not surjective (the idempotent of a single character is central but not in the group ring).

SmoothRep.DerivedCat [definition]
D(G, A) := DerivedCategory (SmoothRep A G), the unbounded derived category of the Grothendieck abelian category of smooth representations, with its bounded-below part D⁺(G, A) = DerivedCategory.Plus, localisation functor Q, the fully faithful embedding of SmoothRep A G in degree 0, and Ext^n_G(V, W) = Hom_{D(G,A)}(V, W[n]) (Mathlib's Abelian.Ext). For G finite discrete D(G, A) ≃ D(A[G]); for an open subgroup U, restriction and algebraic induction are exact and induce an adjunction on derived categories.

SmoothRep.DerivedCat [api]
D(G, A) := DerivedCategory (SmoothRep A G), triangulated.

SmoothRep.DerivedCatPlus [api]
The bounded-below part D⁺(G, A).

SmoothRep.singleFunctor_fullyFaithful [api]
SmoothRep A G embeds fully faithfully in degree 0 (heart of the canonical t-structure).

SmoothRep.ext [api]
Ext^n_G(V, W) as Abelian.Ext in SmoothRep A G, with Yoneda composition and long exact sequences.

SmoothRep.ext_zero [api]
Ext⁰_G(V, W) ≃ Hom_G(V, W) (Ext.addEquiv₀).

SmoothRep.resDerived [api]
Restriction to an open subgroup U and algebraic induction extend to an adjunction D(U, A) ⇄ D(G, A).

SmoothRep.inflationDerived [api]
Inflation from G/N for N closed normal extends to derived categories.

SmoothRep.ext_one_padicInt_fp [test]
Ext¹ of the trivial representation of ℤ_p over F_p with itself is one-dimensional.

SmoothRep.ext_pos_padicInt_fl [test]
For ℓ ≠ p, Ext^i of smooth F_ℓ-representations of ℤ_p vanishes for i > 0.

SmoothRep.ext_zero_test [test]
Ext⁰ of the trivial representation with itself is A.

SmoothRep.derived_discrete_compat [test]
For G finite discrete, Ext^n in SmoothRep A G agrees with Ext^n in Rep A G (Rep.equivalenceModuleMonoidAlgebra).

SmoothRep.derivedInvariants [construction]
For a compact open subgroup U, RΓ(U, −) : D⁺(G, A) → D⁺(A) is the right derived functor of invariantsFunctor U (Mathlib's rightDerivedFunctorPlus), naturally isomorphic to RHom_G(A[G/U], −). Its cohomology on a smooth V is the continuous cohomology of the profinite group U with coefficients in the discrete module V: H^i(RΓ(U, V)) ≅ H^i_cont(U, V) (Mathlib's continuousCohomology, ProfiniteCohomology Layer 10). It commutes with filtered colimits. If U has pro-order invertible in A, RΓ(U, −) = Γ(U, −) (no higher cohomology). For a closed normal subgroup N of U, RΓ(U, −) ≅ RΓ(U/N, RΓ(N, −)).

SmoothRep.derivedInvariants [api]
RΓ(U, −) : D⁺(G, A) ⥤ D⁺(A), the right derived functor of invariantsFunctor U.

SmoothRep.derivedInvariants_iso_rHom [api]
RΓ(U, −) ≅ RHom_G(A[G/U], −).

SmoothRep.homology_derivedInvariants_iso_continuousCohomology [api]
H^i(RΓ(U, V)) ≅ H^i_cont(U, V) for smooth V (V given the discrete topology), naturally in V.

SmoothRep.res_preserves_injective [api]
Restriction to a compact open U preserves injective objects.

SmoothRep.derivedInvariants_of_unit [api]
If HasUnitProOrder A U then R^iΓ(U, −) = 0 for i > 0.

SmoothRep.derivedInvariants_filteredColimit [api]
R^iΓ(U, −) commutes with filtered colimits.

SmoothRep.derivedInvariants_comp_normal [api]
For N ⊴ U closed, RΓ(U, −) ≅ RΓ(U/N, −) ∘ RΓ(N, −) on D⁺ (Hochschild–Serre).

SmoothRep.derivedInvariants_zero [api]
H⁰(RΓ(U, V)) ≅ V^U.

SmoothRep.derivedInvariants_padicInt_fp [test]
For G = U = ℤ_p and A = F_p: H¹(RΓ(U, F_p)) ≅ F_p, H²(RΓ(U, F_p)) = 0.

SmoothRep.derivedInvariants_trivial_group [test]
For U trivial (G discrete), RΓ(U, V) = V.

SmoothRep.derivedInvariants_unit_test [test]
For U = ℤ/3 discrete and A = ℤ[1/3], RΓ(U, V) = V^U for all V, matching Representation.averageMap.

SmoothRep.derivedInvariants_not_exact [test]
For U = ℤ/p and A = F_p, H¹(RΓ(U, F_p)) ≠ 0, so U-invariants are not exact.

CategoryTheory.IsGrothendieckAbelian.exists_kInjective_resolution [theorem]
In a Grothendieck abelian category 𝒜 every (unbounded) cochain complex X admits a quasi-isomorphism X → I to a K-injective complex I (Mathlib's CochainComplex.IsKInjective). Consequently every additive functor F : 𝒜 → ℬ has a total right derived functor RF : D(𝒜) → D(ℬ) computed by K-injective resolutions, and RHom(X, Y) := HomComplex(X, I_Y) computes Hom_{D(𝒜)}(X, Y[n]) in degree n. Applied to 𝒜 = SmoothRep A G this gives unbounded derived invariants RΓ(U, −) : D(G, A) → D(A) and derived Hom complexes.

SmoothRep.rHom [construction]
The derived smooth category is enhanced by the dg category whose objects are K-injective complexes of smooth representations and whose Hom complexes are Mathlib's CochainComplex.HomComplex. Its homotopy category is equivalent to D(G, A). For complexes V, W of smooth representations, RHom_G(V, W) := HomComplex(V, I_W) with I_W a K-injective resolution is a complex of A-modules, functorial in both variables up to homotopy, with H^n RHom_G(V, W) = Hom_{D(G,A)}(V, W[n]). The forgetful functor to complexes of A-modules, restriction to open subgroups, derived invariants and derived tensor products over A are dg functors or are computed by K-flat/K-injective replacements in this model.

SmoothRep.rHom [api]
RHom_G(V, W) as a complex of A-modules, via HomComplex into a K-injective resolution.

SmoothRep.homology_rHom [api]
H^n RHom_G(V, W) ≅ Hom_{D(G,A)}(V, W[n]).

SmoothRep.rHom_functorial [api]
RHom_G is functorial in both variables on D(G, A), contravariant in the first.

SmoothRep.rHom_permutation [api]
RHom_G(A[G/U], W) ≅ RΓ(U, W) for U compact open.

SmoothRep.derivedTensor [api]
The derived tensor product over A of complexes of smooth representations (diagonal action), via K-flat replacement.

SmoothRep.rHom_tensor_adjunction [api]
RHom_G(B ⊗^L V, W) ≅ RHom_G(B, RHom_A(V, W)^sm), the derived version of the tensor–Hom adjunction.

SmoothRep.homology_rHom_zero [test]
H⁰ RHom_G(A, A) = A for the trivial representation of any G.

SmoothRep.rHom_padicInt_fp [test]
For G = ℤ_p and A = F_p, H¹ RHom_G(F_p, F_p) = F_p.

SmoothRep.rHom_discrete_compat [test]
For G finite discrete, RHom_G agrees with RHom over A[G] after Rep.equivalenceModuleMonoidAlgebra.

SmoothRep.rHom_semisimple [test]
For G = ℤ_p and A = F_ℓ (ℓ ≠ p), H^n RHom_G(V, W) = 0 for n ≠ 0.

SmoothRep.isCompact_permutation [theorem]
Let G be locally profinite with a cofinal family 𝒦 of compact open subgroups of pro-order invertible in A (for a locally pro-p group: p ∈ A^×). For K ∈ 𝒦 the permutation module A[G/K] = c-Ind_K^G A is projective in SmoothRep A G, RHom_G(A[G/K], V) = V^K, and A[G/K] is a compact object of D(G, A) (Hom out of it commutes with arbitrary direct sums). The family {A[G/K]}_{K ∈ 𝒦} generates D(G, A): a complex V with V^K acyclic for all K ∈ 𝒦 is 0. Hence D(G, A) is compactly generated, and the thick subcategory generated by these objects consists of compact objects (for Λ a ℤ_ℓ-algebra with ℓ ≠ p it is exactly the compact objects, as Fargues–Scholze state).

SmoothRep.derivedSmoothDual [construction]
On D(G, A) the derived smooth dual is the right derived functor of the left exact functor V ↦ (V*)^sm = smooth part of Hom_A(V, A): 𝔻(V) := R((−)*)^sm (V), characterised by Hom_{D(G,A)}(B, 𝔻(V)) ≅ Hom_{D(G,A)}(B ⊗^L_A V, A) for all B. A complex V is admissible if V^K is a perfect complex of A-modules for every K in a cofinal family of compact open subgroups of invertible pro-order. For such K, 𝔻(V)^K ≅ RHom_A(V^K, A); hence the dual of an admissible complex is admissible, and the natural map V → 𝔻𝔻(V) is an isomorphism for admissible V.

SmoothRep.derivedSmoothDual [api]
𝔻 : D(G, A)ᵒᵖ ⥤ D(G, A), the derived functor of V ↦ (V*)^sm.

SmoothRep.hom_derivedSmoothDual [api]
Hom(B, 𝔻V) ≅ Hom(B ⊗^L_A V, A), natural in B and V.

SmoothRep.IsAdmissibleComplex [api]
V^K is perfect over A for every K in the cofinal family.

SmoothRep.invariants_derivedSmoothDual [api]
𝔻(V)^K ≅ RHom_A(V^K, A) for K of invertible pro-order.

SmoothRep.IsAdmissibleComplex.derivedSmoothDual [api]
The dual of an admissible complex is admissible.

SmoothRep.toDoubleDual_isIso [api]
V → 𝔻𝔻V is an isomorphism for admissible V.

SmoothRep.derivedSmoothDual_heart [api]
On an admissible representation over a field in degree 0, 𝔻V is the smooth contragredient Ṽ in degree 0.

SmoothRep.derivedSmoothDual_character [test]
𝔻(A(χ)) ≅ A(χ⁻¹) in degree 0.

SmoothRep.derivedSmoothDual_zero [test]
𝔻(0) = 0.

SmoothRep.not_isAdmissibleComplex_cInd [test]
For G = ℚ_p and A = F_ℓ (ℓ ≠ p), F_ℓ[ℚ_p/ℤ_p] in degree 0 is not an admissible complex.

SmoothRep.derivedSmoothDual_compat_smoothDual [test]
For G = ℤ_p, A = F_ℓ (ℓ ≠ p) and V finite, 𝔻V agrees with the smooth contragredient of smooth-dual.

SmoothRep.ext_eq_zero_of_centre [theorem]
Let z ∈ Z(G, A) (smooth-centre) act on smooth V by a scalar a and on W by a scalar b. Then (a − b) annihilates Ext^n_G(V, W) for every n; in particular if a − b ∈ A^× all Ext^n_G(V, W) vanish. For an abelian locally profinite group T and smooth characters χ, χ' with χ(t) − χ'(t) ∈ A^× for some t ∈ T, Ext^n_T(A(χ), A(χ')) = 0 for all n ≥ 0.

SmoothRep.derivedHecke [construction]
For a compact open U ≤ G and a commutative ring S, the derived Hecke algebra is the graded S-algebra H*(G, U; S) := Ext*_{SmoothRep S G}(S[G/U], S[G/U]) under Yoneda composition (opposite convention as in Venkatesh). It acts on the derived invariants H*(U, V) = Ext*_G(S[G/U], V) of every smooth V. Its degree-zero part is the Hecke algebra End_G(S[G/U]) (SR.1 permutation-hecke-algebra). Shapiro's lemma gives the invariant-function model H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules, with product given by restriction, conjugation and corestriction along double cosets (the double-coset model). More generally, for compact open U₁, U₂ the derived bimodules Ext*(S[G/U₁], S[G/U₂]) make H*(G, U₁) and H*(G, U₂) act compatibly, as for the derived Iwahori–Hecke algebra and its spherical bimodules.

SmoothRep.derivedHecke [api]
H*(G, U; S) := Ext*_G(S[G/U], S[G/U]) with Yoneda product.

SmoothRep.derivedHecke_zero [api]
The degree-zero part is End_G(S[G/U]), the Hecke algebra of SR.1.

SmoothRep.derivedHeckeAction [api]
The graded action of H*(G, U; S) on H*(U, V) = Ext*_G(S[G/U], V), natural in V.

SmoothRep.derivedHecke_equiv_doubleCoset [api]
H*(G, U; S) ≅ ⊕_{x ∈ U\G/U} H*(U ∩ xUx⁻¹, S) as graded S-modules (Shapiro).

SmoothRep.derivedHecke_mul_doubleCoset [api]
The product in the double-coset model is a sum over double cosets of restriction, conjugation and corestriction (Venkatesh §2.4, (25)).

SmoothRep.derivedBimodule [api]
Ext*_G(S[G/U₁], S[G/U₂]) as an (H*(G,U₂), H*(G,U₁))-bimodule; at U₁ = U₂ it is derivedHecke.

SmoothRep.derivedHecke_of_unit [api]
If HasUnitProOrder S U the derived Hecke algebra is concentrated in degree 0.

SmoothRep.derivedHecke_padicInt [test]
For G = U = ℤ_p and S = F_p, H¹(G, U; F_p) ≅ F_p and H^i = 0 for i ≥ 2.

SmoothRep.derivedHecke_unit_degree_zero [test]
For U of invertible pro-order in S, H^i(G, U; S) = 0 for i > 0.

SmoothRep.derivedHecke_zero_compat [test]
H⁰(G, U; S) is the double-coset Hecke ring 𝕋 of the Hecke pair (U, G) over S (via SR.1 hecke-ring-comparison).

SmoothRep.derivedHecke_normal [test]
For U normal in G, H*(G, U; S) is the twisted tensor product of H*(U, S) with S[G/U] (crossed product).

LocallyConstantCompact.coeFn [api]
Coercion to functions X → M, injective.

LocallyConstantCompact.ext [api]
f = g iff f x = g x for all x.

LocallyConstantCompact.indicator [api]
1_K · m for K a compact open subset and m ∈ M.

LocallyConstantCompact.span_indicator [api]
C_c^∞(X, M) is spanned by the 1_K · m.

LocallyConstantCompact.exists_disjoint_presentation [api]
Every f is Σ m_i 1_{K_i} with pairwise disjoint compact open K_i; two presentations have a common refinement (finite clopen refinement).

LocallyConstantCompact.exists_rightStable [api]
Every compact open U ⊆ G is right-stable under some compact open subgroup K (UK = U); hence every clopen subset of G is admissible: its intersection with each compact open set is right-stable under some compact open subgroup.

LocallyConstantCompact.cosheaf [api]
For an open cover (U_i) of X, ⊕_{i,j} C_c^∞(U_i ∩ U_j, M) → ⊕_i C_c^∞(U_i, M) → C_c^∞(X, M) → 0 is exact (extension by zero; surjectivity and exactness in the middle from the finite clopen refinement).

LocallyConstantCompact.translate [api]
Left and right translation actions of G on C_c^∞(G, M), both smooth representations.

LocallyConstantCompact.exists_biinvariant [api]
Every f ∈ C_c^∞(G, M) is bi-invariant under some compact open subgroup.

LocallyConstantCompact.equivFinsuppQuotient [api]
Right-U-invariant elements of C_c^∞(G, M) ≃ (G ⧸ U →₀ M), equivariantly for left translation.

LocallyConstantCompact.tensorEquiv [api]
C_c^∞(X × Y, A) ≃ C_c^∞(X, A) ⊗_A C_c^∞(Y, A).

LocallyConstantCompact.equivCompactlySupported [api]
For M with the discrete topology, C_c^∞(X, M) ≃ Mathlib's CompactlySupportedContinuousMap X M.

LocallyConstantCompact.finite_eq_pi [test]
For X = Fin 3 discrete, C_c^∞(X, ℤ) ≃ Fin 3 → ℤ.

LocallyConstantCompact.empty [test]
For X empty, C_c^∞(X, M) = 0.

LocallyConstantCompact.real_eq_zero [test]
For X = ℝ with its usual topology, every locally constant compactly supported f : ℝ → ℤ is 0.

LocallyConstantCompact.compat_discrete [test]
For X = ℤ_p and M = ℤ with the discrete topology, C_c^∞(X, ℤ) agrees with CompactlySupportedContinuousMap ℤ_p ℤ.

LocallyConstantCompact.shortExact_open_closed [theorem]
For an l-space X, an open subset U and its closed complement Z = X ∖ U, extension by zero and restriction give a short exact sequence of A-modules 0 → C_c^∞(U, M) → C_c^∞(X, M) → C_c^∞(Z, M) → 0. If a locally profinite group acts continuously on X preserving U, the sequence is one of smooth representations. Iterating along a finite filtration of X by open subsets gives the filtration used in the Mackey and geometric lemmas.

HaarMeasureWithValues.normalized [api]
The unique measure with μ(U₀) = 1 for U₀ of invertible pro-order.

HaarMeasureWithValues.ext [api]
Two measures agreeing on one compact open subgroup U₀ of invertible pro-order agree.

HaarMeasureWithValues.apply_subgroup [api]
μ(U) = [U : U ∩ U₀]·[U₀ : U ∩ U₀]⁻¹ for the normalised measure.

HaarMeasureWithValues.isUnit_apply_iff [api]
μ(U) ∈ Aˣ iff HasUnitProOrder A U (for the normalised measure).

HaarMeasureWithValues.map [api]
Base change along a ring homomorphism A → B; the normalised measure over ℤ[1/p] base-changes to the normalised measure over any ℤ[1/p]-algebra.

HaarMeasureWithValues.modularCharacter [api]
Δ_μ : G → Aˣ with μ(Kg) = Δ_μ(g)μ(K) when μ takes unit values on a basis of subgroups; Δ_μ = 1 iff G is unimodular.

HaarMeasureWithValues.eq_haarMeasure [api]
For A = ℝ, μ(K) = (haarMeasure K₀ K)/(haarMeasure K₀ U₀) for compact open K.

HaarMeasureWithValues.padic_apply [test]
For G = ℚ_p, U₀ = ℤ_p over ℤ[1/p], μ(p^n ℤ_p) = p^{−n} for all n ∈ ℤ.

HaarMeasureWithValues.finite_counting [test]
For G finite discrete normalised at {1}, μ(K) = |K|.

HaarMeasureWithValues.no_fp_measure [test]
There is no F_p-valued Haar measure on ℤ_p with μ(ℤ_p) = 1.

HaarMeasureWithValues.real_compat [test]
For G = ℚ_p, A = ℝ, μ(p^n ℤ_p) equals Mathlib's Haar measure normalised on ℤ_p.

LocallyConstantCompact.integral [construction]
For an A-valued Haar measure μ on G and an A-module M, integration ∫ : C_c^∞(G, M) → M is the A-linear map ∫ f dμ = Σ_{gU} μ(gU) f(g), summed over the finitely many left cosets of a compact open subgroup U such that f is right U-invariant (when μ(gU) is defined, e.g. U ≤ U₀). It is independent of U, left invariant, satisfies ∫ 1_K m = μ(K) m, commutes with A-linear maps M → M', and with base change. The same formula defines integration of locally constant compactly supported functions on G × G and gives Fubini.

LocallyConstantCompact.integral [api]
∫ : C_c^∞(G, M) →ₗ[A] M for an A-valued Haar measure.

LocallyConstantCompact.integral_indicator [api]
∫ 1_K · m = μ(K) · m.

LocallyConstantCompact.integral_translate [api]
Left invariance ∫ f(g·) = ∫ f.

LocallyConstantCompact.integral_map [api]
∫ (φ ∘ f) = φ(∫ f) for A-linear φ : M → M'.

LocallyConstantCompact.integral_prod [api]
Fubini for C_c^∞(G × G, M).

LocallyConstantCompact.integral_baseChange [api]
Integration commutes with base change along A → B.

LocallyConstantCompact.integral_padic [test]
∫_{ℚ_p} 1_{p^n ℤ_p} = p^{−n} over ℤ[1/p].

LocallyConstantCompact.integral_zero [test]
∫ 0 = 0.

LocallyConstantCompact.integral_finite_sum [test]
For G finite discrete and counting measure, ∫ f = Σ_g f g (Finset.sum).

LocallyConstantCompact.integral_right_invariant_unimodular [test]
For a unimodular G, ∫ f(·g) = ∫ f.

HeckeAlgebra.instNonUnitalRing [api]
An associative non-unital A-algebra.

HeckeAlgebra.mul_apply [api]
(f₁ * f₂)(x) = ∫ f₁(y) f₂(y⁻¹x) dμ(y).

HeckeAlgebra.support_mul_subset [api]
supp(f₁ * f₂) ⊆ supp f₁ · supp f₂.

HeckeAlgebra.indicator_mul_indicator [api]
1_U * 1_U = μ(U) 1_U for a compact open subgroup U.

HeckeAlgebra.involution [api]
f ↦ f^∨, f^∨(g) = f(g⁻¹)Δ(g⁻¹), an anti-automorphism; for unimodular G simply f(g⁻¹).

HeckeAlgebra.smul [api]
The action f·v = ∫ f(g) ρ(g) v dμ(g) on a smooth representation, natural in V.

HeckeAlgebra.baseChangeEquiv [api]
H(G, A) ⊗_A B ≃ H(G, B) for the base-changed measure.

HeckeAlgebra.equivMonoidAlgebra [api]
For G finite discrete with counting measure, H(G, A) ≃ MonoidAlgebra A G as algebras.

HeckeAlgebra.withCentralCharacter [api]
For a closed central subgroup Z and a smooth character ω of Z, the variant of functions compactly supported modulo Z with f(zg) = ω(z)⁻¹f(g), with the same convolution over G/Z.

HeckeAlgebra.finite_compat [test]
For G = ZMod 3 discrete with counting measure, H(G, ℤ) ≃ ℤ[ZMod 3].

HeckeAlgebra.indicator_padic [test]
In H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, 1_{pℤ_p} * 1_{pℤ_p} = p⁻¹ • 1_{pℤ_p}.

HeckeAlgebra.no_one [test]
H(ℚ_p, ℚ) has no multiplicative identity.

HeckeAlgebra.trivial_group [test]
For G trivial, H(G, A) ≃ A.

HeckeAlgebra.idempotent_mul_of_le [api]
e_U * e_{U'} = e_{U'} * e_U = e_U for U' ≤ U.

HeckeAlgebra.idempotent_mul_eq_iff [api]
e_U * f = f iff f is left U-invariant; f * e_U = f iff right U-invariant.

HeckeAlgebra.idempotent_smul [api]
e_U acts on a smooth V as SR.0's averaging projector; e_U·V = V^U.

HeckeAlgebra.isLocallyUnital [api]
If units-volume subgroups are cofinal, H(G, A) is locally unital with local units e_U.

HeckeAlgebra.idempotent_finite [test]
For G = ZMod 2 discrete and A = ℤ[1/2], e_G = (1/2)(δ_0 + δ_1).

HeckeAlgebra.idempotent_padic [test]
In H(ℚ_p, ℤ[1/p]) normalised on ℤ_p, e_{pℤ_p} = p • 1_{pℤ_p}.

HeckeAlgebra.idempotent_top [test]
For G compact open in itself and U = G of invertible pro-order, e_G * f = (∫ f) e_G.

HeckeAlgebra.no_idempotent_fp [test]
In H(ℤ_p, F_p) there is no normalised idempotent supported on ℤ_p (no F_p-valued measure with μ(ℤ_p) a unit).

FunG [api]
Fun_G(S × S, A) with the matrix product.

FunG.actPermutation [api]
The left action on A[S], h * s = Σ_t h(t, s) t.

FunG.equivEnd [api]
For S with finitely many G-orbits, Fun_G(S × S, A) ≃ End_G(A[S]) as A-algebras.

HeckeAlgebraLevel.doubleCoset [api]
The basis element [UgU].

HeckeAlgebraLevel.basis [api]
{[UgU]} over U\G/U is an A-basis.

SmoothRep.invariantsHeckeModule [api]
The right H(G, U; A)-module structure on V^U, v * h = Σ_{Ug ∈ U\G} h(U, gU) ρ(g)⁻¹ v.

SmoothRep.invariantsHeckeModule_natural [api]
G-maps V → W induce H(G, U; A)-linear maps V^U → W^U.

SmoothRep.traceLevel [api]
tr_{U/U'} : V^{U'} → V^U, v ↦ Σ_{u ∈ U/U'} ρ(u) v, with tr ∘ incl = [U : U'] and transitivity for U'' ≤ U' ≤ U.

HeckeAlgebraLevel.opposite [api]
The anti-involution [UgU] ↦ [Ug⁻¹U], an isomorphism H(G, U; A) ≃ H(G, U; A)ᵐᵒᵖ.

HeckeAlgebraLevel.baseChange [api]
H(G, U; A) ⊗_A B ≃ H(G, U; B).

HeckeAlgebraLevel.gl2_tp_card [test]
For G = GL_2(ℚ_p), U = GL_2(ℤ_p), [U diag(p,1) U] is the sum of p + 1 left cosets.

HeckeAlgebraLevel.normal_eq_groupAlgebra [test]
For U normal in G, H(G, U; A) ≃ MonoidAlgebra A (G ⧸ U).

SmoothRep.traceLevel_comp_incl [test]
tr_{U/U'} ∘ incl = [U : U'] • id on V^U.

HeckeAlgebraLevel.fp_defined [test]
For G = ℚ_p and U = ℤ_p, H(G, U; F_p) ≅ F_p[ℚ_p/ℤ_p] is defined although there is no F_p-valued Haar measure normalised on ℤ_p, so no convolution model over F_p exists.

NondegMod [definition]
An A-algebra H (not necessarily unital) is idempotented (locally unital) if every finite subset {x_i} admits an idempotent e with e x_i = x_i = x_i e; then H = ⋃_e eHe. A left H-module M is nondegenerate if HM = M, equivalently M = ⋃_e eM. The nondegenerate modules form a full abelian subcategory NondegMod H of H-modules, closed under subquotients, direct sums and filtered colimits, with projective generators He (Hom_H(He, M) = eM), products given by nondegenerate parts of products, and a centre identified with the bimodule endomorphisms of H.

IsIdempotented [api]
Every finite subset is fixed on both sides by an idempotent.

NondegMod [api]
The full subcategory of H-modules with HM = M.

NondegMod.instAbelian [api]
NondegMod H is abelian with exact filtered colimits.

NondegMod.homProjEquiv [api]
Hom_H(He, M) ≃ eM; He is a finitely generated projective object.

NondegMod.nondegPart [api]
The right adjoint M ↦ HM to the inclusion into all H-modules; products are nondegenerate parts of products.

NondegMod.centreEquiv [api]
CatCenter (NondegMod H) ≃ the H-bimodule endomorphisms of H; for unital H, the centre of H.

NondegMod.equivOfUnital [api]
For unital H, NondegMod H ≌ ModuleCat H.

NondegMod.unital_equiv [test]
For H = A (unital), NondegMod H ≌ ModuleCat A.

IsIdempotented.directSum [test]
⊕_{n ∈ ℕ} A with componentwise product is idempotented, and ∏_n A is not a nondegenerate module.

IsIdempotented.not_zeroMul [test]
A with the zero multiplication is not idempotented (for A ≠ 0).

NondegMod.centre_unital [test]
For H = Matrix (Fin 2) (Fin 2) A the centre of NondegMod H is A (Subring.center).

SmoothRep.equivNondegMod [theorem]
Let G be locally profinite and A a commutative ring such that G has a cofinal family of compact open subgroups of pro-order invertible in A, and fix an A-valued Haar measure normalised on one of them. Then H(G, A) is idempotented with local units e_U, and V ↦ (V, f·v = ∫ f(g) ρ(g) v dμ) is an equivalence of categories SmoothRep A G ≌ NondegMod H(G, A), with V^U = e_U·V. The inverse sends M to M with g·m = (δ_g * e_U)·m for m ∈ e_U M, where δ_g * e_U = μ(U)⁻¹ 1_{gU}. The equivalence is A-linear, compatible with base change, and preserves the centre. It does not extend to coefficient rings in which the pro-orders are not invertible (e.g. F_p-representations of a p-adic group): there SmoothRep is used directly, with the integral operators of permutation-hecke-algebra.

SmoothRep.invariants_simple_iff [theorem]
Let U be a compact open subgroup with μ(U) ∈ Aˣ. The functor V ↦ V^U = e_U V from SmoothRep A G to right (or, through the anti-involution, left) H(G, U; A)-modules is exact and has a left adjoint M ↦ H(G, A)e_U ⊗_{e_U H e_U} M = c-Ind_U^G A ⊗_{H(G,U)} M; the counit identifies e_U of the adjoint with M. Over a field A = k: V irreducible implies V^U is 0 or a simple H(G, U; k)-module; every simple H(G, U; k)-module arises from a unique (up to isomorphism) irreducible smooth V with V^U ≠ 0; and two irreducibles with nonzero U-invariants are isomorphic iff their U-invariants are isomorphic H(G, U; k)-modules. If U splits the category (the subcategory generated by U-invariants is a direct factor), V ↦ V^U is an equivalence between that factor and H(G, U; k)-modules.

SmoothCentre.equivLimCornerCentre [theorem]
Let G be locally profinite with a cofinal family 𝒦 of compact open subgroups of pro-order invertible in the commutative ring Λ (for G locally pro-p: the open pro-p subgroups, with p ∈ Λˣ). Restricting z ∈ Z(G, Λ) = CatCenter(SmoothRep Λ G) (SR.0 smooth-centre) to the generators Λ[G/K] gives Z(G, Λ) ≅ lim_{K ∈ 𝒦} Z(H(G, K; Λ)), the transition map for K' ≤ K being z ↦ e_K z (Z(H(G,K'; Λ)) → Z(H(G,K; Λ))). The isomorphism is compatible with coefficient change: for Λ → Λ' there is a natural ring map Z(G, Λ) → Z(G, Λ') induced by Z(H(G,K;Λ)) ⊗ Λ' → Z(H(G,K;Λ')). For G abelian, Z(G, Λ) ≅ lim_K Λ[G/K]. This is the Λ-linear Bernstein centre of Fargues–Scholze (Definition I.9.2) for Λ a ℤ_ℓ[√q]-algebra, ℓ ≠ p.

SmoothCentre.equivLimCornerCentre [api]
SmoothCentre Λ G ≃+* lim_{K ∈ 𝒦} Subring.center (HeckeAlgebraLevel G K Λ).

SmoothCentre.cornerCentreTransition [api]
For K' ≤ K in 𝒦, z ↦ e_K z : Z(H(G,K';Λ)) → Z(H(G,K;Λ)).

SmoothCentre.coeffChange [api]
The ring map Z(G, Λ) → Z(G, Λ') for Λ → Λ', compatible with the actions on base-changed representations.

SmoothCentre.equivLimGroupRing [api]
For G abelian, Z(G, Λ) ≃ lim_K Λ[G/K].

SmoothCentre.app_permutation [api]
The action of z on Λ[G/K] is right multiplication by its K-component.

SmoothCentre.ladic_separated [theorem]
Let Λ be a noetherian ℓ-adically separated domain in which the pro-orders of a cofinal family 𝒦 of compact open subgroups are invertible (for example Λ = ℤ_ℓ[√q] with ℓ ≠ p and 𝒦 the pro-p subgroups of a p-adic group). Then each Hecke algebra H(G, K; Λ) and its centre are ℓ-adically separated, and so is Z(G, Λ) ≅ lim_K Z(H(G, K; Λ)): ⋂_n ℓ^n Z(G, Λ) = 0. In particular two elements of Z(G, Λ) agreeing modulo ℓ^n for every n are equal.

HasIwahoriDecomposition [definition]
Let P = M ⋉ N and P̄ = M ⋉ N̄ be closed subgroups of a locally profinite G with P ∩ N̄ = 1 and N̄MN open in G (a parabolic pair, as for opposite parabolic subgroups of a reductive group, supplied by Tau Ceti ReductiveGroups Layer 7 and ReductiveGroupsPartII RG2.3). A compact open subgroup U has an Iwahori decomposition with respect to (P, P̄) if multiplication U_{N̄} × U_M × U_N → U is bijective, where U_X = U ∩ X. An element m ∈ M is U-positive if m U_N m⁻¹ ⊆ U_N and m⁻¹ U_{N̄} m ⊆ U_{N̄}; the U-positive elements form a monoid Δ_M⁺ containing U_M, and Δ⁺ := U_N Δ_M⁺ U_{N̄}. A central z ∈ Z(M) ∩ Δ_M⁺ is strongly positive if for all compact open H₁, H₂ ⊆ N there is n ≥ 0 with z^n H₁ z^{−n} ⊆ H₂, and for all compact open K₁, K₂ ⊆ N̄ there is n ≥ 0 with z^{−n} K₁ z^n ⊆ K₂ (so ⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄).

HasIwahoriDecomposition [api]
U = U_{N̄} U_M U_N with bijective multiplication, for a parabolic pair (P, P̄).

positiveMonoid [api]
Δ_M⁺ := {m ∈ M | m U_N m⁻¹ ⊆ U_N, m⁻¹ U_{N̄} m ⊆ U_{N̄}} as a Submonoid M.

IsStronglyPositive [api]
Central z ∈ Δ_M⁺ contracting N under conjugation by z and N̄ under z⁻¹, in the sense of the statement.

HasIwahoriDecomposition.mul_mem_iff [api]
Every u ∈ U is uniquely ū m n with ū ∈ U_{N̄}, m ∈ U_M, n ∈ U_N, and also uniquely n m ū.

positiveMonoid.mul_mem [api]
Δ_M⁺ is a submonoid containing U_M.

IsStronglyPositive.iUnion_conj [api]
⋃_n z^{−n} U_N z^n = N and ⋃_n z^n U_{N̄} z^{−n} = N̄.

HasIwahoriDecomposition.conj [api]
Conjugation by g ∈ G transports Iwahori decompositions with respect to (P, P̄) to (gPg⁻¹, gP̄g⁻¹).

HasIwahoriDecomposition.gl2_iwahori [test]
The Iwahori subgroup of GL_2(ℚ_p) has an Iwahori decomposition with respect to the upper and lower Borels.

not_hasIwahoriDecomposition_gl2_maximal [test]
GL_2(ℤ_p) has no Iwahori decomposition with respect to (B, B̄).

IsStronglyPositive.gl2_diag [test]
diag(p, 1) is strongly positive for (B, B̄) and the Iwahori subgroup.

HasIwahoriDecomposition.trivial_parabolic [test]
With P = G, every compact open U has an Iwahori decomposition and positiveMonoid = ⊤.

positiveHeckeHom [theorem]
Let U have an Iwahori decomposition with respect to (P, P̄) and let H(Δ_M⁺, U_M) ⊆ H(M, U_M) and H(Δ⁺, U) ⊆ H(G, U) be the ℤ-spans of the double cosets [U_M m U_M] (m ∈ Δ_M⁺) and [U δ U] (δ ∈ Δ⁺). Then: (1) for m, m' ∈ Δ_M⁺, U m U m' U = U m m' U and [U m U][U m' U] = [U m m' U] in H(G, U; ℤ); (2) the ℤ-linear map t : H(Δ_M⁺, U_M) → H(Δ⁺, U), [U_M m U_M] ↦ [U m U], is an injective ring homomorphism; (3) with 𝒮 = r_M ∘ r_P the restriction–integration map, t ∘ 𝒮 and 𝒮 ∘ t multiply [U m U], resp. [U_M m U_M], by |δ_P(m)|⁻¹ = #(U_N / m U_N m⁻¹). In particular the span of {[U m U] : m in a commutative submonoid of Δ_M⁺} is a commutative subalgebra of H(G, U; ℤ). For M = T a maximal torus of a split group, U = K_p with an Iwahori decomposition relative to (B, B̄) and T⁺ the monoid of t with t U_{K_p} t⁻¹ ⊆ U_{K_p} and t⁻¹ Ū_{K_p} t ⊆ Ū_{K_p}, t ↦ [K_p t K_p] is an algebra homomorphism ℤ[T⁺/T_{K_p}] → H(G, K_p; ℤ). The two contraction conditions are needed: the product decomposition alone does not make t ↦ [K_p t K_p] multiplicative.

positiveHeckeHom [api]
t : H(Δ_M⁺, U_M; ℤ) →+* H(Δ⁺, U; ℤ), [U_M m U_M] ↦ [U m U].

positiveHeckeHom_injective [api]
t is injective.

doubleCoset_mul_of_positive [api]
[U m U][U m' U] = [U m m' U] for m, m' ∈ Δ_M⁺.

positiveHeckeHom_comp_restrict [api]
t ∘ 𝒮 = |δ_P|⁻¹ · and 𝒮 ∘ t = |δ_P|⁻¹ · on basis elements.

positiveHeckeHom_localization [theorem]
In the setting of positive-hecke-homomorphism let z ∈ Z(M) be strongly positive. Then [U_M z U_M] is central and invertible in H(M, U_M; ℤ), every [U_M m U_M] times a power of [U_M z U_M] lies in H(Δ_M⁺, U_M), and H(Δ_M⁺, U_M)[[U_M z U_M]⁻¹] = H(M, U_M; ℤ). If R is a ring in which q (the residue cardinality, so that |δ_P|⁻¹ is a power of q) is a unit and [UzU] is invertible in H(G, U) ⊗ R, then t ⊗ R and 𝒮 ⊗ R extend uniquely to algebra isomorphisms between H(M, U_M) ⊗ R and (H(Δ⁺, U) ⊗ R)[[UzU]⁻¹], inverse to each other up to the twist by |δ_P|.

proIwahoriTorusHom [application]
Let G be a split reductive group over the ring of integers O_v of a nonarchimedean local field F_v with residue field k(v) of characteristic p, B = TU a Borel, Iw(v) and Iw₁(v) the preimages of B(k(v)) and U(k(v)) under G(O_v) → G(k(v)), O a ring containing q_v^{1/2}, and H₁ = O[Iw₁(v)\G(F_v)/Iw₁(v)]. For x, y in the positive monoid T(F_v)⁺ = {t : α(t) ∈ O_v for every simple root α}, [Iw₁ x Iw₁][Iw₁ y Iw₁] = [Iw₁ xy Iw₁], and [Iw₁ x Iw₁] is a unit of H₁[1/p] (of H₁ when p is invertible in O). Writing t = x y⁻¹ with x, y positive, t ↦ δ_B^{1/2}(t)[Iw₁ x Iw₁][Iw₁ y Iw₁]⁻¹ is a well-defined homomorphism T(F_v) → (H₁[1/p])ˣ with kernel T(O_v)₁ = ker(T(O_v) → T(k(v))); the Iwahori analogue embeds O[X_*(T)] ⊗ O[1/p] into O[Iw(v)\G(F_v)/Iw(v)][1/p].

klingenPositiveHecke_isPolynomial [application]
Let ℓ be a prime, J = (0 A; −A 0) with A the 2 × 2 antidiagonal matrix of ones, GSp_4(ℚ_ℓ) = {g ∈ GL_4(ℚ_ℓ) : gᵀ J g = ν(g) J, ν(g) ∈ ℚ_ℓ^×}, and Kli(ℓ) ⊆ GSp_4(ℤ_ℓ) the Klingen parahoric, the elements whose reduction mod ℓ stabilises the line F_ℓ e₁. Let U₀ = [Kli ℓ·1 Kli], U₁ = [Kli diag(ℓ², ℓ, ℓ, 1) Kli] and U₂ = [Kli diag(ℓ, ℓ, 1, 1) Kli] in H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ). Then U₀, U₁, U₂ commute and the ring map ℤ[X₀, X₁, X₂] → H(GSp_4(ℚ_ℓ), Kli(ℓ); ℤ), X_i ↦ U_i, is injective: the subring H⁺_Kli they generate is a polynomial ring in U₀, U₁, U₂.

IwahoriHecke.iwahoriMatsumoto [theorem]
Let G be a split connected reductive group over a nonarchimedean local field F with residue cardinality q, I an Iwahori subgroup, and W̃ = N_G(T)(F)/T(O_F) the extended affine Weyl group, W̃ = W_aff ⋊ Ω with W_aff a Coxeter group on the simple affine reflections S_aff and Ω the length-zero elements. Then G = ⊔_{w ∈ W̃} IwI, [IwI : I] = q^{ℓ(w)}, and H(G, I; ℤ) is free over ℤ on T_w = [IwI] (w ∈ W̃) with: T_w T_{w'} = T_{ww'} when ℓ(ww') = ℓ(w) + ℓ(w'); (T_s − q)(T_s + 1) = 0 for s ∈ S_aff; T_ω T_w = T_{ωw} for ω ∈ Ω. These relations (quadratic, braid and length-zero) present H(G, I; ℤ) ≅ ℤ[Ω] ⊗̃ H_aff. Base change gives H(G, I; A) for every A; each T_w is invertible once q ∈ Aˣ; if q = 1 in A then H(G, I; A) ≅ A[W̃].

IwahoriHecke.bernsteinPresentation [theorem]
In the setting of iwahori-matsumoto let A be a ring containing an inverse square root q^{−1/2} of q. For a dominant cocharacter λ set θ_λ = q^{−ℓ(λ)/2} T_{λ(ϖ)}, and θ_{λ−μ} = θ_λ θ_μ⁻¹ for λ, μ dominant. Then λ ↦ θ_λ is a well-defined injective algebra homomorphism A[X_*(T)] → H(G, I; A); multiplication gives an A-module isomorphism A[X_*(T)] ⊗_A H(K, I; A) ≅ H(G, I; A), where H(K, I; A) is the finite Hecke algebra of K = G(O_F), with basis T_w (w ∈ W); and for a simple reflection s = s_α ∈ W the Bernstein relation T_s θ_λ − θ_{s(λ)} T_s = (q − 1)(θ_λ − θ_{s(λ)})/(1 − θ_{−α^∨}) holds (the right side lies in A[X_*(T)]). The same holds for the generic affine Hecke algebra over ℤ[v, v⁻¹], which specialises to H(G, I; A) by v ↦ q^{1/2}.

IwahoriHecke.center_eq_invariants [theorem]
With A ∋ q^{±1/2} a domain (or any ring after base change from ℤ[v, v⁻¹]), the centre of H(G, I; A) is θ(A[X_*(T)])^W = θ(A[X_*(T)]^W), free over A on the orbit sums z_λ = Σ_{μ ∈ Wλ} θ_μ for λ dominant. H(G, I; A) is free of rank |W| over θ(A[X_*(T)]), which is finite over the centre, so H(G, I; A) is a finitely generated module over its centre. For q = 1 in A the centre of A[X_*(T) ⋊ W] is again A[X_*(T)]^W, W acting faithfully on X_*(T). The comparison of this centre with the spherical Hecke algebra (z ↦ e_K z, the Satake isomorphism) is an SR.4 target, not part of this node.

SmoothRep.ind [construction]
Let H be a closed subgroup of a locally profinite G and (σ, W) a smooth representation of H over A. Ind_H^G σ is the space of functions f : G → W with f(hg) = σ(h) f(g) (h ∈ H) that are right invariant under some compact open subgroup of G, with G acting by right translation. Equivalently it is the smooth part (SR.0 smooth-vectors) of Mathlib's algebraic coinduction Representation.coind along H ↪ G. It is an A-linear functor SmoothRep A H ⥤ SmoothRep A G (unnormalised: no modulus character).

SmoothRep.ind [api]
Ind_H^G σ: right-smooth f : G → W with f(hg) = σ(h)f(g), right translation action.

SmoothRep.indFunctor [api]
The A-linear functor SmoothRep A H ⥤ SmoothRep A G, with map_id and map_comp.

SmoothRep.ind_apply_mul [api]
f(hg) = σ(h) f(g) and (g'·f)(g) = f(g g').

SmoothRep.indEval [api]
Evaluation at 1, an H-map Ind_H^G σ → σ; surjective; nonzero on every nonzero G-subrepresentation.

SmoothRep.ind_eq_smoothVectors_coind [api]
Ind_H^G σ is the smooth part of Mathlib's Representation.coind along H.subtype.

SmoothRep.ind_twist [api]
Ind_H^G(σ ⊗ χ|_H) ≅ (Ind_H^G σ) ⊗ χ for a smooth character χ of G.

SmoothRep.ind_self [test]
Ind_G^G σ ≅ σ.

SmoothRep.ind_bot_padicInt [test]
For G = ℤ_p and H = ⊥, Ind_H^G A ≅ LocallyConstant ℤ_p A with translation.

SmoothRep.ind_ne_coind [test]
For G = ℤ_p, H = ⊥ and A = ℤ, Ind_H^G ℤ ≠ coind (the characteristic function of a non-open set is in coind but not smooth).

SmoothRep.ind_borel_gl2 [test]
For G = GL_2(ℚ_p) and H = B, Ind_B^G 1 ≅ locally constant functions on ℙ¹(ℚ_p).

SmoothRep.cInd [construction]
For H closed in G and σ smooth on H, c-Ind_H^G σ ⊆ Ind_H^G σ is the subrepresentation of functions whose support is compact modulo H (has compact image in H\G). If H\G is compact, c-Ind = Ind. If H is open, f ↦ Σ_{gH ∈ G/H} g ⊗ f(g⁻¹) identifies c-Ind_H^G σ with Mathlib's algebraic induction Rep.ind along H.subtype (A[G] ⊗_{A[H]} σ); in particular c-Ind_U^G A = A[G/U] for a compact open U (Tau Ceti's indTrivialIso), and c-Ind_U^G A is generated by the characteristic function of U.

SmoothRep.cInd [api]
c-Ind_H^G σ ⊆ Ind_H^G σ: support compact modulo H.

SmoothRep.cIndFunctor [api]
The A-linear functor SmoothRep A H ⥤ SmoothRep A G.

SmoothRep.cInd_eq_ind_of_compact [api]
If H\G is compact, c-Ind_H^G = Ind_H^G.

SmoothRep.cIndIsoInd [api]
For H open, c-Ind_H^G σ ≅ Rep.ind H.subtype σ (Mathlib's algebraic induction), naturally in σ.

SmoothRep.cInd_trivial_eq_permutation [api]
c-Ind_U^G A ≅ A[G/U] for U open (via Tau Ceti's indTrivialIso).

SmoothRep.cInd_mem_iff_support [api]
f ∈ c-Ind iff f ∈ Ind and the image of supp f in H\G is compact.

SmoothRep.cInd_padic [test]
c-Ind_{ℤ_p}^{ℚ_p} A ≅ A[ℚ_p ⧸ ℤ_p].

SmoothRep.cInd_self [test]
c-Ind_G^G σ ≅ σ.

SmoothRep.cInd_ne_ind [test]
For G = ℚ_p and H = {0}, the constant function 1 lies in Ind but not in c-Ind.

SmoothRep.cInd_open_compat [test]
For G = ZMod 4 (discrete) and H = {0, 2}, c-Ind_H^G agrees with Rep.ind H.subtype.

SmoothRep.indResAdjunction [theorem]
For H closed in G, a smooth G-representation π and a smooth H-representation σ over any commutative A, composition with evaluation at 1 gives a natural isomorphism Hom_G(π, Ind_H^G σ) ≅ Hom_H(π|_H, σ): smooth induction is right adjoint to restriction. For H open, compact induction is left adjoint to restriction, Hom_G(c-Ind_H^G σ, π) ≅ Hom_H(σ, π|_H), and under compact-induction's comparison this is Mathlib's Rep.indResAdjunction; in particular Hom_G(A[G/U], π) ≅ π^U. For H closed but not open, c-Ind_H^G is not in general left adjoint to restriction.

SmoothRep.cIndFunctor_exact [theorem]
For H closed in G and any commutative A: (a) c-Ind_H^G is exact; (b) Ind_H^G is exact if H\G is compact; (c) Ind_H^G is exact when every compact open subgroup of H has invertible pro-order in A (e.g. complex coefficients). In general Ind_H^G is left exact (as a right adjoint) and preserves products, and c-Ind_H^G preserves direct sums. For H\G compact both preserve admissibility.

SmoothRep.indIndIso [theorem]
For closed subgroups K ≤ H ≤ G there are natural isomorphisms Ind_H^G ∘ Ind_K^H ≅ Ind_K^G and c-Ind_H^G ∘ c-Ind_K^H ≅ c-Ind_K^G, given by f ↦ (g ↦ f(g)(1)). For open subgroups the compact version agrees, under compact-induction's comparison, with Tau Ceti's transitivity of algebraic induction (indFunctorCompIso, InductionRestriction Layer 0), and the projection formula c-Ind_H^G(σ ⊗ π|_H) ≅ c-Ind_H^G σ ⊗ π holds (Tau Ceti's indProjection for open H).

SmoothRep.invariants_ind_equiv [theorem]
For H closed, σ smooth on H and K compact open in G, evaluation at representatives gives (Ind_H^G σ)^K ≅ ∏_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹} and (c-Ind_H^G σ)^K ≅ ⊕_{x ∈ H\G/K} σ^{H ∩ xKx⁻¹}. In particular, if G = H K then (Ind_H^G σ)^K ≅ σ^{H ∩ K}; and for a parabolic P = MN and K with an Iwahori decomposition, (Ind_P^G σ)^K ≅ ⊕_{x ∈ P\G/K} σ^{pr_M(P ∩ xKx⁻¹)} (M-components, N acting trivially).

SmoothRep.indSheaf [construction]
For H closed in G and σ smooth on H, there is a G-equivariant sheaf 𝓕_σ of A-modules on the l-space X = H\G (an l-sheaf: stalk σ at the base point) such that Ind_H^G σ is its space of smooth sections and c-Ind_H^G σ its space of compactly supported sections. For an open G'-stable (for G' ≤ G closed) subset Y ⊆ X with closed complement Z, restriction gives a short exact sequence of G'-representations 0 → Γ_c(Y, 𝓕_σ) → c-Ind_H^G σ → Γ_c(Z, 𝓕_σ) → 0. The functor σ ↦ 𝓕_σ is an equivalence between smooth H-representations and G-equivariant l-sheaves on H\G.

SmoothRep.indSheaf [api]
The G-equivariant l-sheaf 𝓕_σ on H\G.

SmoothRep.ind_equiv_sections [api]
Ind_H^G σ ≃ smooth sections, c-Ind_H^G σ ≃ compactly supported sections.

SmoothRep.cInd_shortExact_open [api]
For Y ⊆ H\G open and G'-stable: 0 → Γ_c(Y) → c-Ind → Γ_c(Z) → 0 exact.

SmoothRep.indSheafEquiv [api]
σ ↦ 𝓕_σ is an equivalence SmoothRep A H ≌ G-equivariant l-sheaves on H\G (G countable at infinity).

SmoothRep.indSheaf_stalk [api]
The stalk of 𝓕_σ at the base point is σ.

SmoothRep.indSheaf_point [test]
For H = G, sections over the point are σ.

SmoothRep.cInd_shortExact_gl2 [test]
For GL_2(ℚ_p), B and Y = big cell: the kernel term is C_c^∞(ℚ_p, A) twisted by χ, the quotient is one-dimensional.

SmoothRep.indSheaf_trivial_subgroup [test]
For H = ⊥, compactly supported sections are C_c^∞(G, W) of SR.1.

SmoothRep.indSheaf_not_open_sections [test]
Sections over Z = {∞} are not a subrepresentation of i_B χ but a quotient: the sequence does not split as B-representations for χ = δ_B^{1/2}.

SmoothRep.mackeyFiltration [theorem]
Let H, Q be closed subgroups of G such that Q has finitely many orbits on X = H\G, each locally closed, numbered Z₁, …, Z_k so that Y_i = Z₁ ∪ … ∪ Z_i is open. Then the restriction to Q of c-Ind_H^G σ has a Q-stable filtration 0 = F₀ ⊆ F₁ ⊆ … ⊆ F_k with F_i/F_{i−1} ≅ c-Ind_{Q ∩ x_i⁻¹Hx_i}^Q (x_i⁻¹ · σ), x_i ∈ G a representative of Z_i. For H, Q open (in particular G finite) this is the Mackey decomposition, a direct sum (Tau Ceti's Rep.mackeyDecomposition).

modulusCharacter [definition]
For a closed subgroup N of G normalised by m ∈ G, the module mod_N(m) is the factor by which conjugation u ↦ m u m⁻¹ scales a Haar measure of N; for a compact open N₀ ⊆ N it is [mN₀m⁻¹ : mN₀m⁻¹ ∩ N₀]/[N₀ : mN₀m⁻¹ ∩ N₀] ∈ ℚ_{>0}. For a parabolic pair P = M ⋉ N of a reductive group over F with residue cardinality q, δ_P := mod_N : P → q^ℤ ⊆ ℤ[1/q]^×, trivial on N, equals |det(Ad(p)|Lie N)|_F and equals Mathlib's modular character of P (μ(E p⁻¹)/μ(E) for a left Haar measure μ of P). As a smooth character it has values in any A ∋ q⁻¹. A square root δ_P^{1/2} : P → Aˣ is fixed by choosing q^{1/2} ∈ Aˣ, which is a choice of coefficients, not part of the group data.

modulus [api]
mod_N : normaliser of N → ℚ_{>0}, defined by index ratios of compact open subgroups of N.

modulus_mul [api]
mod_N(mm') = mod_N(m) mod_N(m').

modulus_eq_index [api]
mod_N(m) = [mN₀m⁻¹ : N₀] when mN₀m⁻¹ ⊇ N₀.

modulusCharacter [api]
δ_P : P →* Aˣ for A ∋ q⁻¹, trivial on N; IsSmoothCharacter δ_P.

modulusCharacter_eq_modularCharacter [api]
(δ_P(p) : ℝ) = MeasureTheory.Measure.modularCharacter p for the locally compact group P.

sqrtModulusCharacter [api]
δ_P^{1/2} : P →* Aˣ determined by a chosen q^{1/2} ∈ Aˣ, with (δ_P^{1/2})² = δ_P.

modulusCharacter_opposite [api]
δ_{P̄} = δ_P⁻¹ on M.

modulusCharacter_gl2_borel [test]
For GL_2(ℚ_p) and B upper triangular, δ_B(diag(a,d)) = |a/d|_p.

modulusCharacter_trivial_parabolic [test]
For P = G (N = 1), δ_P = 1.

modulusCharacter_eq_modularCharacter_test [test]
For P = B ⊆ GL_2(ℚ_p), δ_B equals Mathlib's modularCharacter of B (as an ℝ≥0-valued character).

modulusCharacter_ne_one_on_center_free [test]
δ_B is not trivial on T: δ_B(diag(p,1)) ≠ 1, so B is not unimodular.

SmoothRep.jacquetFunctor [construction]
Let P = M ⋉ N be closed subgroups of G (N normal in P). For a smooth P-representation (in particular the restriction of a G-representation) V, the Jacquet module V_N = V/V(N), V(N) = span{ρ(n)v − v : n ∈ N, v ∈ V}, is Mathlib's coinvariants (Representation.Coinvariants of the restriction to N) with the induced smooth M-action; this is the unnormalised Jacquet functor (−)_N : SmoothRep A G ⥤ SmoothRep A M. The normalised Jacquet functor is r_P(V) = δ_P^{−1/2} ⊗ V_N (given q^{1/2} ∈ Aˣ). (−)_N is right exact over any A, commutes with direct sums, colimits and base change, satisfies transitivity (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁} for P₁ ⊆ P₂, and sends finitely generated G-representations to finitely generated M-representations when G = P K₀ with K₀ compact.

SmoothRep.jacquet [api]
V_N := Representation.Coinvariants of the restriction of V to N, with its M-action.

SmoothRep.jacquetFunctor [api]
(−)_N : SmoothRep A G ⥤ SmoothRep A M, A-linear, right exact, preserving colimits.

SmoothRep.normalizedJacquet [api]
r_P(V) := δ_P^{−1/2} ⊗ V_N.

SmoothRep.jacquet_mk_surjective [api]
The projection V → V_N is an M-equivariant surjection with kernel V(N).

SmoothRep.jacquet_lift [api]
Hom_M(V_N, W) ≃ Hom_P(V, infl W) for W an M-representation with N acting trivially.

SmoothRep.jacquet_trans [api]
Transitivity for P₁ ⊆ P₂: (V_{N₂})_{N₁ ∩ M₂} ≅ V_{N₁}, and r_{P₁∩M₂}^{M₂} ∘ r_{P₂} ≅ r_{P₁}.

SmoothRep.jacquet_fg [api]
If G = P K₀ with K₀ compact, V finitely generated ⇒ V_N finitely generated.

SmoothRep.jacquet_baseChange [api]
(B ⊗_A V)_N ≅ B ⊗_A V_N.

SmoothRep.jacquet_eq_coinvariants [api]
The underlying A-module of V_N is Mathlib's Representation.Coinvariants of ρ restricted to N.

SmoothRep.jacquet_trivial_gl2 [test]
For G = GL_2(ℚ_p), the Jacquet module of the trivial representation along N is the trivial character of T.

SmoothRep.jacquet_N_trivial [test]
If N = ⊥ then V_N ≅ V.

SmoothRep.jacquet_eq_coinvariants_test [test]
For G finite discrete and N a subgroup, V_N is Representation.Coinvariants (ρ.comp N.subtype).

SmoothRep.jacquet_not_left_exact_fp [test]
For P = N = ℤ_p (M trivial) and A = F_p, (−)_N is not left exact: the augmentation ideal I ⊆ F_p[ℤ/p] has I_N = F_p mapping to 0 in (F_p[ℤ/p])_N.

SmoothRep.jacquetFunctor_exact [theorem]
Let N be a union of an increasing sequence of compact open subgroups N₀ ⊆ N₁ ⊆ … each of pro-order invertible in A (e.g. N the unipotent radical of a parabolic of a p-adic group and p ∈ Aˣ). For every smooth N-representation V: V(N) = ⋃_i ker(e_{N_i}) = {v : ∫_{N_i} ρ(n)v dn = 0 for some i}, and (−)_N is exact. In characteristic-p coefficients for a pro-p N the functor is right exact but not left exact; no characteristic-p exactness is asserted.

SmoothRep.parabolicInd [construction]
For a parabolic subgroup P = M ⋉ N of a reductive p-adic group G (or a parabolic pair in a locally profinite G with P\G compact) and A ∋ q^{±1/2}, normalised parabolic induction is i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl_M^P σ), an exact functor SmoothRep A M ⥤ SmoothRep A G (P\G is compact, so Ind = c-Ind). Unnormalised induction Ind_P^G ∘ infl is available over every A. It satisfies transitivity i_P^G ∘ i_{Q ∩ M}^M ≅ i_Q^G for Q ⊆ P, preserves admissibility and finite generation, and is compatible with twisting by unramified characters of M and with base change.

SmoothRep.parabolicInd [api]
i_P^G σ := Ind_P^G(δ_P^{1/2} ⊗ infl σ).

SmoothRep.unnormalizedParabolicInd [api]
Ind_P^G ∘ infl, over any A.

SmoothRep.parabolicInd_exact [api]
i_P^G is exact (any A ∋ q^{±1/2}).

SmoothRep.parabolicInd_trans [api]
i_P^G ∘ i_{Q∩M}^M ≅ i_Q^G for parabolics Q ⊆ P.

SmoothRep.parabolicInd_admissible [api]
i_P^G preserves admissibility and finite generation.

SmoothRep.parabolicInd_twist [api]
i_P^G(σ ⊗ χ|_M) ≅ i_P^G σ ⊗ χ for a smooth character χ of G.

SmoothRep.parabolicInd_eq_unnormalized [api]
i_P^G σ = Ind_P^G(δ_P^{1/2}σ); the two conventions differ by the twist δ_P^{1/2}.

SmoothRep.parabolicInd_gl2_apply [test]
For GL_2(ℚ_p), f ∈ i_B(χ₁ ⊗ χ₂) satisfies f((a b; 0 d)g) = χ₁(a)χ₂(d)|a/d|^{1/2} f(g).

SmoothRep.parabolicInd_self [test]
i_G^G σ ≅ σ.

SmoothRep.trivial_sub_parabolicInd [test]
The trivial representation of GL_2(ℚ_p) embeds in i_B(δ_B^{−1/2}).

SmoothRep.parabolicInd_not_unnormalized [test]
i_B 1 ≠ Ind_B^G 1 for GL_2(ℚ_p): the latter contains the trivial representation, the former does not.

SmoothRep.jacquetParabolicIndAdjunction [theorem]
For a parabolic P = M ⋉ N, a smooth G-representation V and a smooth M-representation σ over A: Hom_G(V, Ind_P^G infl σ) ≅ Hom_M(V_N, σ), and in normalised form Hom_G(V, i_P^G σ) ≅ Hom_M(r_P V, σ) (A ∋ q^{±1/2}): the Jacquet functor r_P is left adjoint to i_P^G. Consequently i_P^G preserves injectives when r_P is exact, and r_P preserves projectives when i_P is exact.

SmoothRep.smoothDual_parabolicInd [theorem]
For H closed in a unimodular G, σ smooth on H over a field k in which the compact open subgroups have invertible pro-order (e.g. k = ℂ): (c-Ind_H^G σ)~ ≅ Ind_H^G(σ̃ ⊗ δ_H), δ_H the modulus character of H, via the G-invariant functional on c-Ind_H^G δ_H given by integration over H\G. For a parabolic P = M ⋉ N (P\G compact): (i_P^G σ)~ ≅ i_P^G σ̃ naturally in σ (normalised induction is compatible with smooth duality), and the pairing i_P σ × i_P σ̃ → k is f ⊗ f' ↦ ∮_{P\G} ⟨f, f'⟩.

SmoothRep.geometricLemma [theorem]
Let G be a connected reductive group over F, P = MN and Q = LV standard parabolic subgroups, W the Weyl group and W^{M,L} the set of minimal-length representatives of W_L\W/W_M. For every smooth σ of M (complex coefficients, or any A ∋ q^{±1/2} with p ∈ Aˣ), r_Q ∘ i_P (σ) has a filtration, natural in σ, whose graded pieces are F_w(σ) = i^L_{L ∩ wPw⁻¹}(w · r^M_{M ∩ w⁻¹Qw}(σ)), w ∈ W^{M,L}, in an order compatible with the closure order on the double cosets PwQ (open orbits give subfunctors, closed orbits quotients). More generally, for an l-group G with closed subgroups P = MU, Q = NV satisfying Bernstein–Zelevinsky's conditions (finitely many Q-orbits on P\G, U and V unions of compact subgroups, decomposability), r_{V} ∘ i_{U} is glued from functors indexed by the Q-orbits on P\G.

SmoothRep.jacquet_principalSeries [theorem]
Let B = TU be a minimal parabolic (Borel, for split G) and χ a smooth character of T over ℂ. Then r_B(i_B χ) has a filtration with graded pieces the Weyl conjugates wχ (w ∈ W), so its semisimplification is ⊕_{w ∈ W} wχ; if χ is regular (wχ ≠ χ for w ≠ 1) the filtration splits. Consequently every irreducible subquotient π of i_B χ has r_B(π) ≠ 0, its semisimplified Jacquet module is a sub-sum of ⊕ wχ, and π embeds in i_B(wχ) for some w; i_B χ has length ≤ |W|.

SmoothRep.casselmanPairing [theorem]
Let V be an admissible complex representation of a reductive p-adic G, P = MN a parabolic with opposite P̄ = MN̄. There is a unique bilinear pairing ⟨ , ⟩_N : V_N × (Ṽ)_{N̄} → ℂ such that for v ∈ V, ṽ ∈ Ṽ with images u, ũ there is ε > 0 with ⟨π(a)v, ṽ⟩ = ⟨π_N(a)u, ũ⟩_N for all a in the ε-contracting part A⁻(ε) of the split centre of M. It is M-invariant and nondegenerate, so (V_N)~ ≅ (Ṽ)_{N̄} and, normalised, r_{P̄}(Ṽ) ≅ (r_P V)~. This is the compatibility of Jacquet functors with smooth duality on admissible representations; the extension to all smooth representations is jacquet-duality (SR.2a).

SmoothRep.invariants_jacquet_surjective [theorem]
Let K₀ be a compact open subgroup with an Iwahori decomposition K₀ = N̄₀M₀N₀ with respect to (P, P̄), V an admissible representation over ℂ (or over a field with invertible pro-orders). Then: (1) the projection V^{K₀} → (V_N)^{M₀} is surjective; (2) for a ∈ M contracting N (a N₀ a⁻¹ ⊆ N₀, a ∈ A⁻), the Hecke operator [K₀aK₀] on V^{K₀} lifts δ_P(a)⁻¹ π_N(a) on V_N, i.e. projection intertwines [K₀aK₀] with δ_P⁻¹(a) a; (3) for a sufficiently contracting, the subspaces V^{K₀}_a = [K₀aK₀] V^{K₀} are all equal to a space V^{K₀}_{A⁻} on which every [K₀aK₀] (a ∈ A⁻) is invertible, and the projection V^{K₀}_{A⁻} → (V_N)^{M₀} is an isomorphism (its inverse is Casselman's canonical lifting); the kernel of the projection is the generalised null space of [K₀aK₀]. Over a ring R with p ∈ Rˣ the same surjectivity holds for all smooth V once [K₀aK₀] is invertible in H(G, K₀) ⊗ R (Bushnell–Kutzko).

SmoothRep.iwahoriInvariants_equiv_jacquet [theorem]
Let G be connected reductive over F with minimal parabolic P = MN, B an Iwahori subgroup in good position (B = N̄₀M₀N₀) and V an admissible complex representation. Then the projection V → V_N induces an isomorphism V^B ≅ (V_N)^{M₀}, and for m in the contracting cone M⁻ the operator [BmB] on V^B corresponds to meas(BmB)·π_N(m) = δ_P(m)⁻¹ π_N(m). For split G and the pro-p Iwahori Iw₁ the same holds with (V_N)^{T(O)₁} and the normalised Jacquet module, compatibly with the action of T(F) on H(G, Iw₁)[1/p] (pro-iwahori-torus).

SmoothRep.whittakerFunctionals [definition]
Let G be quasi-split over F with Borel B = TU and ψ : U → Aˣ a smooth character that is generic (nontrivial on every simple root subgroup and trivial on the derived subgroup [U, U]). A Whittaker functional on a smooth representation V is an element of Hom_U(V, ψ); by Frobenius reciprocity Hom_U(V, ψ) ≅ Hom_G(V, Ind_U^G ψ), and V is ψ-generic if this is nonzero. The Gelfand–Graev representation is c-Ind_U^G ψ. Whittaker data (B, ψ) are acted on by T(F) and conjugation, and genericity depends only on the T(F)-orbit of ψ; the twisted Jacquet module V_{U,ψ} = V/span{ρ(u)v − ψ(u)v} is dual to Whittaker functionals. Uniqueness of Whittaker models is not part of this node.

IsGenericCharacter [api]
ψ : U →* Aˣ smooth, nontrivial on each simple root subgroup, trivial on [U, U].

SmoothRep.whittakerFunctionals [api]
Hom_U(V, ψ) for a smooth G-representation V.

SmoothRep.whittakerFunctionals_equiv_hom_ind [api]
Hom_U(V, ψ) ≃ Hom_G(V, Ind_U^G ψ).

SmoothRep.twistedJacquet [api]
V_{U,ψ} := V/span{ρ(u)v − ψ(u)v}, with (V_{U,ψ})* ≃ Hom_U(V, ψ).

SmoothRep.IsGeneric [api]
Hom_U(V, ψ) ≠ 0.

SmoothRep.isGeneric_conj [api]
Genericity depends only on the T(F)-orbit of ψ.

SmoothRep.gelfandGraev [api]
c-Ind_U^G ψ.

SmoothRep.isGeneric_principalSeries_gl2 [test]
For GL_2(ℚ_p) and any smooth χ, i_B χ is ψ-generic.

SmoothRep.not_isGeneric_trivial_gl2 [test]
The trivial representation of GL_2(ℚ_p) is not generic.

SmoothRep.whittaker_torus [test]
For G = T (U = ⊥), Hom_U(V, ψ) = Hom_A(V, A).

SmoothRep.twistedJacquet_one [test]
For ψ = 1, V_{U,1} is the Jacquet module V_U of jacquet-module.

SmoothRep.compact_splits [theorem]
Let G be unimodular, locally profinite and countable at infinity, with complex coefficients. A smooth V is compact if for every v and compact open K the function g ↦ e_K π(g⁻¹) v has compact support; equivalently all matrix coefficients ⟨ṽ, π(g⁻¹)v⟩ are compactly supported. Then: a finitely generated compact representation is admissible; an irreducible compact W has a nonzero formal degree d(W) and a central idempotent-type element E_{W,K} ∈ H(G) acting by the identity on W^K and by 0 on every irreducible not isomorphic to W; consequently {W} splits SmoothRep ℂ G: every smooth V is V_W ⊕ V_W^⊥ with V_W a direct sum of copies of W and no subquotient of V_W^⊥ isomorphic to W. In particular W is projective and injective, and the subcategory of compact representations is semisimple.

SmoothRep.IsQuasiCuspidal [definition]
Let G be the F-points of a connected reductive group over a nonarchimedean local field F (topology from ReductiveGroupsPartII RG2.0) and V a smooth complex representation. V is quasi-cuspidal if r_P(V) = 0 (equivalently V_N = 0) for every proper parabolic subgroup P = MN of G defined over F; it suffices to check maximal standard parabolics. V is cuspidal if it is quasi-cuspidal and finitely generated. For complex coefficients an irreducible cuspidal representation is called supercuspidal; quasi-cuspidal representations are closed under subquotients, direct sums and twists by characters, and V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and all σ.

SmoothRep.IsQuasiCuspidal [api]
∀ proper parabolic P = MN, V_N = 0.

SmoothRep.IsCuspidal [api]
Quasi-cuspidal and finitely generated.

SmoothRep.isQuasiCuspidal_iff_maximal [api]
It suffices to check maximal standard parabolics.

SmoothRep.isQuasiCuspidal_iff_hom [api]
V is quasi-cuspidal iff Hom_G(V, i_P σ) = 0 for all proper P and smooth σ.

SmoothRep.IsQuasiCuspidal.quotient [api]
Closed under subrepresentations, quotients, direct sums and twists.

SmoothRep.isQuasiCuspidal_iff_compact_mod_centre [api]
Matrix-coefficient criterion (harish-chandra-compactness).

SmoothRep.isQuasiCuspidal_torus [test]
Every smooth representation of a torus T(F) is quasi-cuspidal.

SmoothRep.not_isQuasiCuspidal_principalSeries [test]
For GL_2(ℚ_p) and any smooth χ, i_B χ is not quasi-cuspidal.

SmoothRep.isCuspidal_depthZero_gl2 [test]
The compact induction from ℚ_p^× GL_2(ℤ_p) of an inflated cuspidal representation of GL_2(F_p) is irreducible and cuspidal.

SmoothRep.not_isQuasiCuspidal_trivial [test]
The trivial representation of GL_2(ℚ_p) is not quasi-cuspidal (its Jacquet module along N is the trivial character).

SmoothRep.isQuasiCuspidal_iff_compact_mod_centre [theorem]
For G reductive over F and a smooth complex representation V, the following are equivalent: (1) V is quasi-cuspidal; (2) for every v ∈ V and compact open K, g ↦ e_K π(g⁻¹) v has support compact modulo the centre Z(G); (3) the restriction of V to G° (the subgroup generated by compact subgroups, open with compact centre) is compact. For admissible V this is equivalent to all matrix coefficients being compactly supported modulo Z(G), and to the same property for Ṽ. Consequently every irreducible cuspidal representation is admissible.

SmoothRep.exists_embedding_parabolicInd_cuspidal [theorem]
Every irreducible smooth complex representation V of G embeds into i_P σ for some parabolic P = MN and some irreducible cuspidal representation σ of M. One may take M minimal among standard Levi subgroups with r_P V ≠ 0, and σ any irreducible quotient of r_P V.

SmoothRep.isAdmissible_of_irreducible [theorem]
Every irreducible smooth complex representation V of G(F) is admissible: dim V^K < ∞ for every compact open K. Consequently (Schur) End_G(V) = ℂ, V has a central character ω_V : Z(G) → ℂ^×, Ṽ is irreducible and V ≅ Ṽ̃, and V^K is a simple H(G, K; ℂ)-module or 0. Classification of irreducibles is not used. Schur's lemma End_G(V) = ℂ also holds for any irreducible smooth V of a locally profinite group countable at infinity by the countable-dimension argument.

SmoothRep.heckeAlgebra_decomposition [theorem]
Let G be reductive over F, K₀ a special maximal compact subgroup and K ⊆ K₀ a congruence subgroup normal in K₀ with an Iwahori decomposition with respect to every standard parabolic (Bruhat). Let Λ⁺ be the dominant part of the lattice of a maximal split torus (with a finite set of representatives of Λ/Λ⁺-type corrections). Then H(G, K; ℂ) = H₀ · D · C · H₀ where H₀ = H(K₀, K) and D are finite-dimensional subspaces spanned by double-coset elements, and C = span{[KλK] : λ ∈ Λ⁺} is a commutative subalgebra, finitely generated as an algebra. In particular H(G, K) is a finite sum Σ u_i C v_j.

finrank_commSubalgebra_le [theorem]
Let V be an m-dimensional complex vector space and R ⊆ End(V) a commutative subalgebra generated (with 1) by l elements. Then dim R ≤ m^{2 − 2^{1−l}}.

SmoothRep.uniform_admissibility [theorem]
Let G be reductive over F and K a compact open subgroup. There is a constant c(G, K) such that dim_ℂ V^K ≤ c(G, K) for every irreducible smooth complex representation V; equivalently every simple H(G, K; ℂ)-module has dimension ≤ c(G, K). One can take c = d^{2^l} where H(G, K) = Σ_{i,j ≤ d} u_i C v_j with C commutative generated by l elements. The bound is uniform in V, not merely finiteness for each V. It is not asserted for characteristic-p coefficients or for integral coefficient rings.

SmoothRep.finite_cuspidal_components_at_level [theorem]
Let K be a compact open subgroup of G. There is a subset Ω(G, K) ⊆ G° compact such that every K-bi-invariant matrix coefficient g ↦ e_K π(g⁻¹)ξ of every irreducible cuspidal representation of G° is supported in Ω(G, K). Consequently only finitely many isomorphism classes of irreducible cuspidal representations of G° have nonzero K-fixed vectors, and only finitely many cuspidal components of G (unramified-twist classes of irreducible cuspidals) have K-fixed vectors.

SmoothRep.unramifiedCharacters [definition]
For G reductive over F let G° be the subgroup generated by all compact subgroups; it is open and normal, G/G° = Λ(G) is a lattice of rank equal to the split rank of the centre, and Z(G)G° has finite index. An unramified character of G is a smooth character trivial on G°; they form the complex algebraic torus Ψ(G) = Hom(Λ(G), ℂ^×), with coordinate ring ℂ[Λ(G)]. Ψ(G) acts on irreducible representations by twisting. For a Levi M this gives Ψ(M), which acts on cuspidal representations of M.

SmoothRep.compactlyGeneratedSubgroup [api]
G° as an open normal subgroup.

SmoothRep.unramifiedCharacters [api]
Ψ(G) = Hom(G/G°, ℂ^×), a complex torus with coordinate ring ℂ[G/G°].

SmoothRep.unramifiedCharacters_isSmoothCharacter [api]
Every element of Ψ(G) is a smooth character.

SmoothRep.finiteIndex_center_mul [api]
Z(G)G° has finite index in G.

SmoothRep.twistUnramified [api]
The action of Ψ(G) on SmoothRep ℂ G by twisting.

SmoothRep.unramifiedCharacters_gl1 [test]
For G = ℚ_p^×, Ψ(G) ≅ ℂ^× via χ ↦ χ(p).

SmoothRep.unramifiedCharacters_sl2 [test]
For SL_2(ℚ_p), G° = G and Ψ(G) is trivial.

SmoothRep.not_unramified_ramified [test]
A character of ℚ_p^× nontrivial on ℤ_p^× is smooth but not unramified.

SmoothRep.unramified_eq_isSmoothCharacter_trivial_on [test]
An unramified character is a smooth character (SR.0 smooth-character) trivial on G°.

SmoothRep.cuspidalSupport [definition]
A cuspidal datum of G is a pair (M, σ) of a Levi subgroup M (of a parabolic of G) and an irreducible cuspidal representation σ of M, up to G-conjugacy. Every irreducible V is a subquotient of i_P σ for some cuspidal datum (M, σ) (jacquet-subrepresentation), and the datum is unique up to G-conjugacy: the cuspidal support scs(V). Each cuspidal datum is the support of finitely many irreducibles, namely the irreducible subquotients of i_P σ, independent of the parabolic P with Levi M; every irreducible subquotient of i_P σ embeds into i_P(wσ) for some w ∈ W(M) = N_G(M)/M.

SmoothRep.CuspidalDatum [api]
Pairs (M, σ) with M a Levi and σ irreducible cuspidal, modulo G-conjugacy.

SmoothRep.cuspidalSupport [api]
scs : Irr G → CuspidalDatum G.

SmoothRep.cuspidalSupport_spec [api]
V is a subquotient of i_P σ iff scs(V) = [M, σ].

SmoothRep.cuspidalSupport_unique [api]
Uniqueness up to G-conjugacy.

SmoothRep.cuspidalSupport_fiber_finite [api]
Each fibre of scs is finite.

SmoothRep.embedding_weyl_translate [api]
Every irreducible subquotient of i_P σ embeds in i_P(wσ) for some w ∈ W(M).

SmoothRep.cuspidalSupport_trivial_gl2 [test]
scs(1_{GL_2(ℚ_p)}) = [T, |·|^{−1/2} ⊗ |·|^{1/2}].

SmoothRep.cuspidalSupport_supercuspidal [test]
scs(V) = [G, V] for V irreducible cuspidal.

SmoothRep.cuspidalSupport_steinberg_gl2 [test]
The Steinberg representation of GL_2(ℚ_p) has the same cuspidal support as the trivial representation.

SmoothRep.cuspidalSupport_ne_twist [test]
For GL_2(ℚ_p), i_B(1 ⊗ 1) and i_B(|·| ⊗ 1) have different cuspidal supports.

SmoothRep.finiteLength_parabolicInd [theorem]
(1) If σ is an admissible representation of finite length of a Levi M, then i_P σ has finite length; for σ irreducible cuspidal its length is at most |W(M)|. (2) Every finitely generated admissible complex representation of G has finite length (Howe). (3) A smooth V all of whose irreducible subquotients are non-cuspidal has finite length if r_P V has finite length for every maximal standard parabolic P; length(V) ≤ Σ_P length(r_P V).

SmoothRep.parabolicInd_irreducible_generic [theorem]
Let σ be an irreducible cuspidal (more generally discrete series) representation of a Levi M and P = MN. For ψ in a nonempty Zariski-open subset of the torus Ψ(M), i_P(ψσ) is irreducible. In particular every element z of the centre acts on i_P(ψσ) by a scalar z(ψσ), and ψ ↦ z(ψσ) is a regular function on Ψ(M).

SmoothRep.InertialClass [definition]
Two cuspidal data (M, σ), (M', σ') are inertially equivalent if there are g ∈ G and ψ ∈ Ψ(M') with gMg⁻¹ = M' and gσ ≅ ψσ'. The inertial classes s = [M, σ]_G form the set B(G). For s = [M, σ] the cuspidal component D = Ψ(M)·σ ⊆ Irr_cusp(M) is a quotient of the torus Ψ(M) by the finite stabiliser of σ, and W_s = W(M, D) = {w ∈ N_G(M)/M : wD = D}. The variety of cuspidal data Ω(G) = ⊔_s D_s/W_s, and the inertial support of an irreducible V is the class of its cuspidal support. The full subcategory Rep_s(G) consists of smooth V all of whose irreducible subquotients have inertial support s.

SmoothRep.InertialClass [api]
B(G): cuspidal data modulo G-conjugacy and unramified twist.

SmoothRep.inertialSupport [api]
Irr G → B(G), the class of the cuspidal support.

SmoothRep.cuspidalComponent [api]
D_s = Ψ(M)·σ with its structure of a quotient torus.

SmoothRep.bernsteinWeylGroup [api]
W_s = W(M, D), finite.

SmoothRep.blockSubcategory [api]
Rep_s(G): smooth representations whose irreducible subquotients all have inertial support s.

SmoothRep.varietyCuspidalData [api]
Ω(G) = ⊔_s D_s/W_s.

SmoothRep.inertialClass_gl1 [test]
For ℚ_p^×, inertial classes correspond to characters of ℤ_p^×.

SmoothRep.inertialSupport_trivial_steinberg [test]
The trivial and Steinberg representations of GL_2(ℚ_p) have the same inertial support [T, 1].

SmoothRep.bernsteinWeylGroup_supercuspidal [test]
For s = [G, σ], W_s is trivial.

SmoothRep.inertialSupport_ne_ramified [test]
i_B(χ ⊗ 1) with χ ramified on ℤ_p^× is not in the unramified block [T, 1].

SmoothRep.cuspidalComponent_splits [theorem]
Each cuspidal component D of G (an unramified-twist class of irreducible cuspidal representations) splits SmoothRep ℂ G, and so does the set of all irreducible cuspidals: SmoothRep ℂ G = M_cusp × M_ind with M_cusp = ∏_D M(D). For D = Ψ(G)ρ, Π(D) = c-Ind_{G°}^G(ρ|_{G°}) ≅ ℂ[Λ(G)] ⊗ ρ is a finitely generated projective generator of M(D), and M(D) is equivalent to modules over End(Π(D))ᵒᵖ, a twisted group algebra of the finite stabiliser of ρ over ℂ[Ψ(G)].

SmoothRep.bernsteinDecomposition [theorem]
SmoothRep ℂ G is the product of the full subcategories Rep_s(G) over the inertial classes s ∈ B(G): every smooth V decomposes uniquely as V = ⊕_s V_s with V_s ∈ Rep_s(G), naturally in V, and Hom between different blocks vanishes. For each compact open K only finitely many s have Rep_s(G)^K ≠ 0. The cuspidal blocks are those of cuspidal-splitting.

SmoothRep.isNoetherian_of_fg [theorem]
SmoothRep ℂ G is locally noetherian: every subrepresentation of a finitely generated smooth representation is finitely generated. The functors i_P and r_P preserve finite generation, and finitely generated representations are admissible over the Bernstein centre (their K-invariants are finitely generated Z(G)-modules).

SmoothRep.bernsteinCentreEquiv [theorem]
The centre Z(G) = CatCenter(SmoothRep ℂ G) of SR.0 is the product over inertial classes of the centres Z_s of the blocks, and Z_s ≅ ℂ[D_s]^{W_s}, the ring of W_s-invariant regular functions on the cuspidal component D_s; hence Z(G) is the ring of regular functions on Ω(G) = ⊔_s D_s/W_s. An element z acts on every i_P(π), π ∈ D_s, by the scalar z(π), and on every irreducible V by z(scs V). The action on every object is the SR.0 action; on the generators ℂ[G/K] it is the SR.1 description Z(G) ≅ lim_K Z(H(G, K)).

SmoothRep.heckeLevel_finite_over_centre [theorem]
For every compact open K: (1) only finitely many inertial classes s have blocks with nonzero K-invariants; (2) every finitely generated smooth representation is Z(G)-admissible; (3) H(G, K; ℂ) is a finitely generated module over the image of Z(G), so it is finite over its own centre, which is a finitely generated ℂ-algebra; (4) for each s, the corner e_K H e_K restricted to Rep_s(G) is a finite module over Z_s. Coefficient specialisation: for ψ ∈ D_s, the specialisation of the universal family at ψ recovers i_P(ψσ).

SmoothRep.universalUnramifiedTwist [construction]
For a parabolic P = MN and a smooth σ of M, let ℂ[Λ(M)] = ℂ[M/M°] with the tautological unramified character χ_univ : M → ℂ[Λ(M)]^×. The universal twist i_P(σ ⊗ χ_univ) is a smooth (G, ℂ[Λ(M)])-module, and for every ψ ∈ Ψ(M), specialisation at ψ gives i_P(σ ⊗ χ_univ) ⊗_{ℂ[Λ(M)], ψ} ℂ ≅ i_P(σ ⊗ ψ). If σ is admissible, its K-invariants are finitely generated projective ℂ[Λ(M)]-modules (free for the unramified principal series), compatibly with specialisation. For σ cuspidal and P = G this is Π(D) of cuspidal-splitting; for the unramified principal series it is c-Ind_{T(O)N}^G 1.

SmoothRep.universalUnramifiedTwist [api]
i_P(σ ⊗ χ_univ) as a smooth (G, ℂ[Λ(M)])-module.

SmoothRep.universalUnramifiedTwist_specialize [api]
Specialisation at ψ is i_P(σ ⊗ ψ).

SmoothRep.universalUnramifiedTwist_invariants_projective [api]
For σ admissible, K-invariants are finitely generated projective over ℂ[Λ(M)].

SmoothRep.universalUnramifiedTwist_principal [api]
For M = T and σ = 1: i_B(χ_univ) ≅ c-Ind_{T(O)N}^G 1.

SmoothRep.universalUnramifiedTwist_gl1 [test]
For G = M = ℚ_p^× and σ = 1, the universal twist is ℂ[t^{±1}] with p acting by t.

SmoothRep.universalUnramifiedTwist_trivial_levi [test]
For M = M° (for instance M = G = SL_2(ℚ_p), where Λ(M) = 0), ℂ[Λ(M)] = ℂ and the universal twist is i_P σ itself.

SmoothRep.universalUnramifiedTwist_iwahori_free [test]
For split G, (i_B χ_univ)^I is free of rank one over H(G, I) (Haines–Kottwitz–Prasad Lemma 1.6.1).

SmoothRep.universalUnramifiedTwist_special_reducible [test]
For GL_2, the specialisation at ψ = |·|^{1/2} ⊗ |·|^{−1/2} is reducible.

SmoothRep.bernsteinCentre_conj_eq_id [theorem]
(1) Inner automorphisms act trivially on Z(G): for g ∈ G the autoequivalence V ↦ V^{Int g} is isomorphic to the identity via ρ(g), so the induced automorphism of Z(G) is the identity; an isomorphism of groups G ≅ G' induces Z(G) ≅ Z(G') depending only on its G'(F)-conjugacy class. (2) For G = G₁ × G₂, B(G) = B(G₁) × B(G₂) and Z_{(s₁,s₂)} ≅ Z_{s₁} ⊗ Z_{s₂}, so Z(G) = ∏_{s₁,s₂} Z_{s₁} ⊗ Z_{s₂}; irreducibles of G₁ × G₂ are external tensor products.

SmoothRep.IsTempered [definition]
Let V be an admissible complex representation of G with central character ω. V is square-integrable modulo the centre (discrete series) if ω is unitary and every matrix coefficient g ↦ ⟨ṽ, π(g)v⟩ has |c|² integrable on G/Z(G) (with Mathlib's Lp and the quotient Haar measure); V is tempered if ω is unitary and every matrix coefficient lies in L^{2+ε}(G/Z) for all ε > 0. Equivalently (Casselman's criterion) in terms of the exponents: the central characters χ of A_M on the Jacquet modules r_P(V) satisfy |χ(a)| < 1 (resp. ≤ 1) on the strictly negative cone. An irreducible square-integrable V is unitary and has a formal degree.

SmoothRep.IsSquareIntegrable [api]
Unitary central character and matrix coefficients in L²(G/Z).

SmoothRep.IsTempered [api]
Unitary central character and matrix coefficients in L^{2+ε}(G/Z) for every ε > 0.

SmoothRep.centralExponents [api]
The characters of the split centre A_M occurring in r_P(V).

SmoothRep.IsSquareIntegrable.isTempered [api]
Square-integrable ⇒ tempered.

SmoothRep.IsSquareIntegrable.unitary [api]
An irreducible square-integrable representation is unitarisable.

SmoothRep.isSquareIntegrable_of_cuspidal [api]
A cuspidal representation with unitary central character is square-integrable.

SmoothRep.isSquareIntegrable_steinberg_gl2 [test]
The Steinberg representation of GL_2(ℚ_p) is square-integrable modulo the centre.

SmoothRep.isTempered_unitary_principal [test]
i_B(χ₁ ⊗ χ₂) with χ_i unitary is tempered.

SmoothRep.not_isTempered_trivial [test]
The trivial representation of GL_2(ℚ_p) is not tempered.

SmoothRep.isSquareIntegrable_compact [test]
For G compact every irreducible representation is square-integrable.

SmoothRep.isSquareIntegrable_iff_exponents [theorem]
An admissible complex representation V of finite length with unitary central character is square-integrable modulo the centre iff for every standard parabolic P = MN and every central exponent χ of r_P(V) (normalised Jacquet module) one has |χ(a)| < 1 for all a in the strictly negative part of A_M modulo A_G; it is tempered iff |χ(a)| ≤ 1 there. It suffices to check the parabolics associate to the cuspidal support.

SmoothRep.langlandsClassification [theorem]
(1) Every irreducible tempered representation is a direct summand of i_P σ for a parabolic P = MN and a square-integrable σ of M, unique up to conjugacy. (2) For a standard parabolic P = MN, an irreducible tempered τ of M and ν in the open positive chamber a_P^{*,+} (|χ_ν| = q^{⟨ν, H_M⟩}), the standard module i_P(τ ⊗ χ_ν) has a unique irreducible quotient J_P(τ, ν) (the Langlands quotient). Every irreducible admissible V is isomorphic to some J_P(τ, ν), and the triple (P, τ, ν) is unique up to W-conjugacy. V is tempered iff P = G and ν = 0.

SmoothRep.iwahoriBlockEquiv [theorem]
Let G be connected reductive over F (split, or more generally with an Iwahori subgroup I in good position) and complex coefficients. The Iwahori subgroup splits SmoothRep ℂ G: the full subcategory of representations generated by their I-fixed vectors is the block of the unramified principal series [T, 1] (T a minimal Levi), and V ↦ V^I is an equivalence between this block and the category of modules over H(G, I; ℂ). An irreducible V has V^I ≠ 0 iff V is a subquotient (equivalently a subrepresentation) of an unramified principal series i_B χ. For admissible V generated by V^I, V^I is a finite-dimensional H(G, I)-module and the subcategory is closed under subobjects.

SmoothRep.steinberg [definition]
For a split reductive G with Borel B, the Steinberg representation is St_G = C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G), the quotient of the smooth functions on the flag variety by the sum of those pulled back from the partial flag varieties of the parabolics strictly containing B. It is irreducible, square-integrable modulo the centre, its normalised Jacquet module along B is δ_B^{1/2} and its Iwahori invariants are one-dimensional. For GL_2: 0 → 1 → Ind_B^G 1 → St → 0 (unnormalised), i.e. St is the irreducible subrepresentation of i_B(δ_B^{1/2}).

SmoothRep.steinberg [api]
St_G := C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G).

SmoothRep.steinberg_irreducible [api]
St_G is irreducible.

SmoothRep.jacquet_steinberg [api]
r_B(St_G) ≅ δ_B^{1/2}.

SmoothRep.steinberg_isSquareIntegrable [api]
St_G is square-integrable modulo the centre.

SmoothRep.steinberg_iwahori [api]
dim St_G^I = 1 and St_G^{K₀} = 0.

SmoothRep.steinberg_gl2_exact [test]
For GL_2(ℚ_p): 0 → 1 → Ind_B^G 1 → St → 0 is exact.

SmoothRep.steinberg_torus [test]
For G = T a split torus, St_T is the trivial representation.

SmoothRep.steinberg_ne_trivial [test]
For GL_2(ℚ_p), St ≇ 1 (r_B differ).

SmoothRep.steinberg_spherical_zero [test]
St^{GL_2(ℤ_p)} = 0 for GL_2(ℚ_p).

SmoothRep.isotypicQuotient_regular [theorem]
Let σ be an irreducible smooth complex representation of G. The map C_c^∞(G) → End(σ)^∞ = σ ⊗ σ̃, f ↦ σ(f), is surjective and G × G-equivariant (left and right translation), and the maximal σ-isotypic quotient of C_c^∞(G) for the right translation action is σ̃ ⊗ σ (σ̃ for the left action). For σ compact (e.g. cuspidal with compact centre) the map splits and C_c^∞(G) = (σ ⊗ σ̃) ⊕ (complement), giving the formal degree.

SmoothRep.stabilization [theorem]
Let G be reductive over F, (P, P̄) a parabolic pair with Levi M, K a compact open subgroup in good position (K = K₋K_MK₊ with respect to (P, P̄)) and a ∈ Z(M) strictly dominant with respect to (P, P̄, K); put h = [KaK] ∈ H(G, K; ℂ). Then for every smooth complex representation V (no admissibility assumed) and every n ≥ c(G, K), the uniform-admissibility constant: V^K = ker hⁿ ⊕ im hⁿ, h acts invertibly on V^K_* := im hⁿ, and V^K_0 := ker hⁿ, V^K_* do not depend on n or on a. Moreover V^K_0 = V^K ∩ ker e_C and V^K_* = e_K e_{C̄} V for sufficiently large compact open C ⊆ N, C̄ ⊆ N̄, and the projection V^K → (V_N)^{K_M} has kernel V^K_0 and restricts to an isomorphism V^K_* ≅ (V_N)^{K_M}.

SmoothRep.invariants_jacquet_surjective_of_smooth [theorem]
For every smooth complex representation V of G and K, P = MN in good position, the projection V^K → (V_N)^{K_M} is surjective, and it has a natural section (Bernstein's canonical lifting) identifying (V_N)^{K_M} with the direct summand V^K_* of V^K, functorially in V. The section is independent of the strictly dominant element used to define it, and compatible with shrinking K.

SmoothRep.jacquet_smoothDual_opposite [theorem]
For every smooth complex representation V of G and opposite parabolics P = MN, P̄ = MN̄ there is a unique nondegenerate M-equivariant pairing (Ṽ)_{N̄} × V_N → ℂ such that for ṽ ∈ Ṽ, v ∈ V and a strictly dominant central a, ⟨ṽ, π(aⁱ)v⟩ = ⟨p̄(ṽ), π_N(aⁱ)p(v)⟩ for i ≫ 0. It identifies (Ṽ)_{N̄} with the full smooth contragredient of V_N; with normalised functors (using δ_{P̄} = δ_P⁻¹ on M): r_{P̄}(Ṽ) ≅ (r_P V)~ naturally in V. For admissible V this is Casselman's pairing (casselman-pairing).

SmoothRep.secondAdjunctionUnit [construction]
For opposite parabolics P = MN and P̄ = MN̄ and complex coefficients, the unit of the second adjunction is the natural embedding η_τ : τ ↪ r_{P̄}(i_P τ) given by the open orbit P·P̄ of P̄ on P\G: functions in i_P τ supported in the big cell P N̄ form the bottom piece of the geometric-lemma filtration of r_{P̄} i_P, isomorphic to τ. The counit ε_π : i_P(r_{P̄} π) → π is the map corresponding, under the Hom isomorphism of second-adjointness, to the identity of r_{P̄} π; explicitly it is described by Bezrukavnikov–Kazhdan's asymptotic (co-specialisation) map. The triangle identities r_{P̄}(ε) ∘ η_{r_{P̄}} = id and ε_{i_P} ∘ i_P(η) = id hold, and the unit agrees with the geometric-lemma map of Bernstein's β.

SmoothRep.secondAdjunctionUnit [api]
η : 𝟭 ⟶ i_P ⋙ r_{P̄}, the big-cell embedding.

SmoothRep.secondAdjunctionCounit [api]
ε : r_{P̄} ⋙ i_P ⟶ 𝟭.

SmoothRep.secondAdjunction_left_triangle [api]
r_{P̄}(ε_π) ∘ η_{r_{P̄}π} = id.

SmoothRep.secondAdjunction_right_triangle [api]
ε_{i_P τ} ∘ i_P(η_τ) = id.

SmoothRep.secondAdjunctionUnit_eq_geometricLemma [api]
η is the open-orbit piece of the geometric-lemma filtration of r_{P̄} ∘ i_P.

SmoothRep.secondAdjunctionUnit_gl2 [test]
For GL_2 and τ = χ, η_χ identifies χ with the subrepresentation of r_{B̄}(i_B χ) coming from functions supported on B N̄.

SmoothRep.secondAdjunctionUnit_trivial_parabolic [test]
For P = G, η and ε are identities.

SmoothRep.secondAdjunctionUnit_injective [test]
η_τ is injective for every τ.

SmoothRep.firstAdjunctionUnit_ne_second [test]
The unit of the first adjunction r_P ⊣ i_P is π → i_P(r_P π) (closed orbit, a quotient piece), not η: the two adjunctions use opposite parabolics.

SmoothRep.secondAdjunction [theorem]
For a connected reductive group G over a nonarchimedean local field F, opposite parabolics P = MN and P̄ = MN̄, and complex coefficients: normalised parabolic induction i_P is left adjoint to the normalised Jacquet functor r_{P̄} along the opposite parabolic, Hom_G(i_P τ, π) ≅ Hom_M(τ, r_{P̄} π) naturally in τ and π, with unit and counit those of second-adjunction-unit. This is separate from the first adjunction r_P ⊣ i_P. Consequences: r_{P̄} commutes with arbitrary products; i_P preserves projective objects; for admissible π, Hom_G(i_P τ, π̃) ≅ Hom_M(τ, (r_P π)~), compatibly with Casselman's pairing. In unnormalised terms the right adjoint of Ind_P^G ∘ infl is δ_P⁻¹ ⊗ (−)_{N̄}.

-/
