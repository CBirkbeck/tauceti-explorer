/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/ArithmeticGaloisRepresentations.md) is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. No implementation is claimed: every proof is `sorry`,
and data whose construction is a roadmap target is `sorry` as well.

Conventions pinned here (see the roadmap's Conventions section): the carrier of a
continuous representation is a finite projective module with the module topology
and a jointly continuous action; Frobenius is arithmetic unless named `Geom`; the
Weil–Deligne relation is `r(w) ∘ N = q^{deg w} • (N ∘ r(w))` with `deg` of an
arithmetic Frobenius lift equal to `1`.
-/
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Algebra.Module.Projective
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Coinduced
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Instances.ZMod
import Mathlib.Topology.Algebra.Valued.ValuativeRel
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.GroupTheory.Complement
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.Transfer
import Mathlib.LinearAlgebra.Matrix.Basis
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.RingTheory.Ideal.Pointwise
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.DirichletDensity
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.Reduction
import Mathlib.RepresentationTheory.Induced
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.LinearAlgebra.Eigenspace.Semisimple
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.Algebra.Group.AddChar
import Mathlib.LinearAlgebra.Charpoly.BaseChange
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.Algebra.BrauerGroup.Defs
import Mathlib.Algebra.Central.Basic
import Mathlib.Algebra.Quaternion
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.RingTheory.SimpleRing.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.LinearAlgebra.Matrix.ProjectiveSpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Determinant
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.SpecificGroups.Dihedral
import Mathlib.GroupTheory.SpecificGroups.Alternating
import Mathlib.GroupTheory.SpecificGroups.Quaternion
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.PGroup
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.Basic
import Mathlib.RingTheory.Frobenius
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.LinearAlgebra.TensorPower.Symmetric
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Trace.Basic
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.FieldTheory.Separable
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Data.Finset.Sym
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Algebra.Module.Basic
import Mathlib.RingTheory.Nilpotent.Exp

noncomputable section

open scoped TensorProduct

namespace TauCeti

universe u u' v w w'

/-! ## Shared carriers (R01.1) -/

/-- A continuous representation of `Γ` on the finite projective `A`-module `M` carrying the
module topology: a linear representation whose action map `Γ × M → M` is jointly continuous
(Mathlib's `ContRepresentation` only asks each operator to be continuous). -/
structure ContinuousRep (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (A : Type v) [CommRing A] [TopologicalSpace A]
    (M : Type w) [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] where
  /-- The underlying linear representation. -/
  toRepresentation : Representation A Γ M
  /-- Joint continuity of the action map. -/
  continuous_action : Continuous fun p : Γ × M => toRepresentation p.1 p.2

namespace ContinuousRep

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
  {A : Type v} [CommRing A] [TopologicalSpace A]
  {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]
  {N : Type w'} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
  [TopologicalSpace N] [IsModuleTopology A N]

instance : CoeFun (ContinuousRep Γ A M) (fun _ => Γ → M →ₗ[A] M) :=
  ⟨fun ρ g => ρ.toRepresentation g⟩

/-- Morphisms of continuous representations: `Γ`-equivariant `A`-linear maps (automatically
continuous for the module topologies). -/
structure Hom (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear map. -/
  toLinearMap : M →ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ g : Γ, toLinearMap ∘ₗ ρ g = σ g ∘ₗ toLinearMap

/-- Isomorphisms of continuous representations. -/
structure Iso (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) where
  /-- The underlying linear equivalence. -/
  toLinearEquiv : M ≃ₗ[A] N
  /-- Equivariance. -/
  comm : ∀ (g : Γ) (m : M), toLinearEquiv (ρ g m) = σ g (toLinearEquiv m)

/-- The characteristic polynomial of `ρ(g)` (for free carriers). -/
def charpoly [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) : Polynomial A :=
  (ρ g).charpoly

/-- The determinant character `Γ →* Aˣ`, the action on the top exterior power for a carrier of
constant rank (`LinearMap.det ∘ ρ` when the carrier is free). -/
def det (ρ : ContinuousRep Γ A M) : Γ →* Aˣ := sorry

/-- The rank-one representation `A(χ)` of a continuous character. -/
def ofCharacter [IsTopologicalRing A] (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A A := sorry

/-- The trivial representation on `M`. -/
def trivial : ContinuousRep Γ A M := ⟨Representation.trivial A Γ M, sorry⟩

/-- Restriction along a continuous homomorphism `φ : Γ' → Γ` (open or closed subgroups,
decomposition groups). -/
def res {Γ' : Type u'} [Group Γ'] [TopologicalSpace Γ'] (φ : Γ' →ₜ* Γ)
    (ρ : ContinuousRep Γ A M) : ContinuousRep Γ' A M :=
  ⟨ρ.toRepresentation.comp φ.toMonoidHom, sorry⟩

/-- A continuous representation together with its carrier, for constructions whose carrier is
not given in advance (semisimplification, base change, induction). -/
structure Bundled (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (A : Type v) [CommRing A] [TopologicalSpace A] where
  /-- The carrier module. -/
  carrier : Type w
  [isAddCommGroup : AddCommGroup carrier]
  [isModule : Module A carrier]
  [isFinite : Module.Finite A carrier]
  [isProjective : Module.Projective A carrier]
  [isTopologicalSpace : TopologicalSpace carrier]
  [isModuleTopology : IsModuleTopology A carrier]
  /-- The representation. -/
  rep : ContinuousRep Γ A carrier

section FieldCoefficients

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
  {K : Type v} [Field K] [TopologicalSpace K]
  {M : Type w} [AddCommGroup M] [Module K M] [Module.Finite K M] [Module.Projective K M]
  [TopologicalSpace M] [IsModuleTopology K M]

/-- Absolute irreducibility over a field of coefficients, in Burnside's form: the carrier is
nonzero and the operators `ρ(g)` span `End_K(M)`; equivalent to irreducibility after every
field extension. -/
def IsAbsolutelyIrreducible (ρ : ContinuousRep Γ K M) : Prop :=
  Nontrivial M ∧ Submodule.span K (Set.range fun g : Γ => ρ g) = ⊤

/-- The semisimplification over a field of coefficients: the direct sum of the factors of a
composition series (Jordan–Hölder), well defined up to isomorphism. -/
def semisimplification (ρ : ContinuousRep Γ K M) : Bundled.{u, v, w} Γ K := sorry

end FieldCoefficients

end ContinuousRep

/-- A `Γ`-stable lattice in a representation over a field `E` with ring of integers `O`:
a finitely generated `O`-submodule, stable under `Γ`, spanning `V` over `E`. -/
structure GaloisLattice.IntegralModel {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
    (O : Type v) [CommRing O] {E : Type v} [Field E] [TopologicalSpace E] [Algebra O E]
    {V : Type w} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
    (ρ : ContinuousRep Γ E V) where
  /-- The lattice. -/
  lattice : Submodule O V
  /-- Stability under the group. -/
  stable : ∀ (g : Γ) (x : V), x ∈ lattice → ρ g x ∈ lattice
  /-- Finite generation over `O`. -/
  fg : lattice.FG
  /-- The lattice spans the representation. -/
  span_eq_top : Submodule.span E (lattice : Set V) = ⊤

/-! ## Shared arithmetic carriers (R01.2) -/

namespace GaloisRep

/-- The map `G_{F_v} → G_F` determined by an embedding of algebraic closures over `F → F_v`
(Mathlib's `Field.absoluteGaloisGroup.mapOfAlgebra`); changing the embedding conjugates it. -/
def localEmbeddingMap (K L : Type*) [Field K] [Field L] [Algebra K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] :
    Field.absoluteGaloisGroup L →ₜ* Field.absoluteGaloisGroup K :=
  Field.absoluteGaloisGroup.mapOfAlgebra K L

/-- The inertia subgroup of `G_K` for a nonarchimedean local field `K` (Tau Ceti
LocalFieldsRamification layer 4). -/
def inertiaGroup (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Subgroup (Field.absoluteGaloisGroup K) := sorry

/-- A chosen arithmetic Frobenius lift in `G_K`; well defined modulo inertia. -/
def arithFrobLift (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Field.absoluteGaloisGroup K := sorry

/-- A representation of `G_K` is unramified when inertia acts trivially. -/
def IsUnramified {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    {A : Type v} [CommRing A] [TopologicalSpace A]
    {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) : Prop :=
  ∀ g ∈ inertiaGroup K, ρ g = LinearMap.id

/-- The Frobenius characteristic polynomial `det(X − ρ(Frob))` of an unramified representation
(arithmetic Frobenius; independent of the lift because inertia acts trivially). -/
def frobCharpoly {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K]
    {A : Type v} [CommRing A] [TopologicalSpace A]
    {M : Type w} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [Module.Free A M] [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) : Polynomial A :=
  ρ.charpoly (arithFrobLift K)

/-- A complex conjugation in `G_F` at a real place `v` of a number field (well defined up to
conjugacy). -/
def complexConjugation (F : Type*) [Field F] [NumberField F] (v : NumberField.InfinitePlace F)
    (_hv : v.IsReal) : Field.absoluteGaloisGroup F := sorry

/-- The `ℓ`-adic cyclotomic character of `G_F` (Mathlib's `cyclotomicCharacter` on the
algebraic closure). -/
def cyclotomicCharacter (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] :
    Field.absoluteGaloisGroup F →* ℤ_[ℓ]ˣ where
  toFun g := _root_.cyclotomicCharacter (AlgebraicClosure F) ℓ g.toRingEquiv
  map_one' := sorry
  map_mul' := sorry

end GaloisRep

/-- A Weil–Deligne representation over a field `Ω` of characteristic zero: a representation `r`
of the Weil group `W` (with degree map `deg`, `deg` of an arithmetic Frobenius lift `= 1`)
that is trivial on an open subgroup, and a nilpotent `N` with
`r(w) ∘ N = q^{deg w} • (N ∘ r(w))` (Deligne 1973, (8.4.1.1)). -/
structure WeilDeligneRep (W : Type u) [Group W] [TopologicalSpace W]
    (deg : W →* Multiplicative ℤ) (q : ℕ) (Ω : Type v) [Field Ω]
    (V : Type w) [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V] where
  /-- The Weil group representation. -/
  r : Representation Ω W V
  /-- Smoothness: the kernel is open. -/
  isOpen_ker : IsOpen {w : W | r w = LinearMap.id}
  /-- The monodromy operator. -/
  N : Module.End Ω V
  /-- `N` is nilpotent. -/
  isNilpotent_N : IsNilpotent N
  /-- Deligne's relation in the arithmetic normalisation. -/
  conj_monodromy : ∀ w : W, r w ∘ₗ N = ((q : Ω) ^ Multiplicative.toAdd (deg w)) • (N ∘ₗ r w)

end TauCeti

/-! # The declarations of layer R01.1 -/
namespace TauCeti

universe uΓ uΓ' uA uB uC uM uN

open scoped TensorProduct

namespace ContinuousRep

attribute [local instance] Bundled.isAddCommGroup Bundled.isModule Bundled.isFinite
  Bundled.isProjective Bundled.isTopologicalSpace Bundled.isModuleTopology

/-- The `ℓ`-adic cyclotomic character of `G_F` as a continuous character (the preamble's
`GaloisRep.cyclotomicCharacter` with its continuity for the Krull and `ℓ`-adic topologies).
Used by the Tate-twist node (R01.1/tate-twist) and by unit tests of earlier nodes. -/
def TateTwist.cyclotomicChar (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] :
    Field.absoluteGaloisGroup F →ₜ* ℤ_[ℓ]ˣ :=
  { GaloisRep.cyclotomicCharacter F ℓ with continuous_toFun := sorry }

/-! ### Continuous representations on finite projective modules
(ArithmeticGaloisRepresentations:R01.1/continuous-representation) -/

-- `TauCeti.ContinuousRep` (the structure), its projection
-- `TauCeti.ContinuousRep.continuous_action`, `TauCeti.ContinuousRep.Hom`,
-- `TauCeti.ContinuousRep.ofCharacter`, `TauCeti.ContinuousRep.det` and
-- `TauCeti.ContinuousRep.trivial` are declared in the preamble.

section Basic

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]
  {M : Type uM} [AddCommGroup M] [Module A M] [hMfin : Module.Finite A M]
  [hMproj : Module.Projective A M] [TopologicalSpace M] [hMtop : IsModuleTopology A M]
  {N : Type uN} [AddCommGroup N] [Module A N] [hNfin : Module.Finite A N]
  [hNproj : Module.Projective A N] [TopologicalSpace N] [hNtop : IsModuleTopology A N]

/-- Build a continuous representation from a linear representation on a finite projective module
with the module topology and a proof of joint continuity of `(g, m) ↦ ρ(g) m`. -/
def mk'
    (ρ : Representation A Γ M) (h : Continuous fun p : Γ × M => ρ p.1 p.2) :
    ContinuousRep Γ A M := by
  have _ := hMfin; have _ := hMproj; have _ := hMtop
  exact ⟨ρ, h⟩

/-- The underlying Mathlib `ContRepresentation`: each `ρ(g)` is a continuous linear map for the
module topology. -/
def toContRepresentation [IsTopologicalRing A] [IsTopologicalAddGroup M]
    (ρ : ContinuousRep Γ A M) : ContRepresentation A Γ M := by
  have _ := hMtop
  exact sorry

theorem toContRepresentation_toRepresentation [IsTopologicalRing A] [IsTopologicalAddGroup M]
    (ρ : ContinuousRep Γ A M) :
    ρ.toContRepresentation.toRepresentation = ρ.toRepresentation := by
  sorry

/-- Every morphism of continuous representations is continuous (module topologies). -/
theorem Hom.continuous [IsTopologicalRing A] {ρ : ContinuousRep Γ A M} {σ : ContinuousRep Γ A N}
    (f : ρ.Hom σ) : Continuous f.toLinearMap := by
  sorry

/-- Extensionality: two continuous representations on the same carrier agree when their
operators agree. -/
theorem ext {ρ ρ' : ContinuousRep Γ A M} (h : ∀ (g : Γ) (m : M), ρ g m = ρ' g m) : ρ = ρ' := by
  sorry

/-- For a carrier with a finite basis, joint continuity is continuity of the matrix
coefficients `Γ → M_n(A)`. -/
theorem continuous_iff_matrixCoeff [IsTopologicalRing A] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι A M) (ρ : Representation A Γ M) :
    (Continuous fun p : Γ × M => ρ p.1 p.2) ↔ Continuous fun g => LinearMap.toMatrix b b (ρ g) := by
  sorry

/-- Joint continuity is continuity of all the orbit maps `g ↦ ρ(g) m` (carrier finite projective
with the module topology); it suffices to test `m` in a finite generating family. -/
theorem continuous_iff_orbit [IsTopologicalRing A] (ρ : Representation A Γ M) :
    (Continuous fun p : Γ × M => ρ p.1 p.2) ↔ ∀ m : M, Continuous fun g : Γ => ρ g m := by
  sorry

/-- For a free carrier, the determinant is `LinearMap.det ∘ ρ`. -/
theorem det_eq_linearMap_det [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) :
    (ρ.det g : A) = LinearMap.det (ρ g) := by
  sorry

/-- The determinant character is continuous. -/
theorem continuous_det [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) :
    Continuous fun g => (ρ.det g : A) := by
  sorry

theorem det_trivial : (ContinuousRep.trivial : ContinuousRep Γ A M).det = 1 := by
  sorry

/-- The absolute Galois group `Field.absoluteGaloisGroup F` is profinite: compact, Hausdorff and
totally disconnected. Mathlib gives this group only its group structure, its topology and
`IsTopologicalGroup`; the three properties are transported along Tau Ceti's
`TauCeti.absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup F ≃ₜ* Gal(F^sep/F)`, where
Mathlib's instances for the Krull topology of a Galois extension apply. (For imperfect `F` the
fixed field of this group in the algebraic closure is the perfect closure of `F`.) -/
theorem absoluteGaloisGroup_profinite (F : Type*) [Field F] :
    CompactSpace (Field.absoluteGaloisGroup F) ∧ T2Space (Field.absoluteGaloisGroup F) ∧
      TotallyDisconnectedSpace (Field.absoluteGaloisGroup F) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.not_of_discrete_padic_character.
Over a field `K` with the discrete topology (e.g. `ℚ_ℓ` made discrete), a faithful
representation of `ℤ_ℓ` (e.g. `a ↦ (1 + ℓ)^a` on `K`) has each `ρ(g)` continuous, but is not a
`ContinuousRep`: its kernel `{0}` is not open in `ℤ_ℓ`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (K : Type) [Field K] [TopologicalSpace K] [DiscreteTopology K]
    (ρ : Representation K (Multiplicative ℤ_[ℓ]) K) (hρ : Function.Injective ρ) :
    ¬ ∃ r : ContinuousRep (Multiplicative ℤ_[ℓ]) K K, r.toRepresentation = ρ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.det_cyclotomic. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    (ofCharacter (TateTwist.cyclotomicChar ℚ ℓ)).det =
        (TateTwist.cyclotomicChar ℚ ℓ).toMonoidHom ∧
      ∀ (v : NumberField.InfinitePlace ℚ) (hv : v.IsReal),
        (ofCharacter (TateTwist.cyclotomicChar ℚ ℓ)).det
          (GaloisRep.complexConjugation ℚ v hv) = -1 := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.zero. -/
example : Module.finrank A (Fin 0 → A) = 0 ∧
    (ContinuousRep.trivial : ContinuousRep Γ A (Fin 0 → A)).det = 1 := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.toContRepresentation_injective. -/
example [IsTopologicalRing A] [IsTopologicalAddGroup M] :
    Function.Injective (toContRepresentation : ContinuousRep Γ A M → ContRepresentation A Γ M) ∧
      Set.range (toContRepresentation : ContinuousRep Γ A M → ContRepresentation A Γ M) =
        {π | Continuous fun p : Γ × M => π p.1 p.2} := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.continuous_iff_matrixCoeff. -/
example [IsTopologicalRing A] (n : ℕ) (ρ : Representation A Γ (Fin n → A)) :
    (∃ r : ContinuousRep Γ A (Fin n → A), r.toRepresentation = ρ) ↔
      Continuous fun g => LinearMap.toMatrix' (ρ g) := by
  sorry

end Basic

/-! ### Exterior powers of finite projective modules
(ArithmeticGaloisRepresentations:R01.1/exterior-powers-of-finite-projective-modules) -/

/-- ArithmeticGaloisRepresentations:R01.1/exterior-powers-of-finite-projective-modules, part (a):
exterior powers commute with base change, for every module. (The formula on generators,
`b ⊗ (m₁ ∧ ⋯ ∧ m_r) ↦ b • ((1 ⊗ m₁) ∧ ⋯ ∧ (1 ⊗ m_r))`, and the compatibility with `⋀^r` of linear
maps are not restated.) -/
theorem _root_.TauCeti.exteriorPower_baseChange (A : Type*) [CommRing A] (M : Type*)
    [AddCommGroup M] [Module A M] (B : Type*) [CommRing B] [Algebra A B] (r : ℕ) :
    Nonempty ((B ⊗[A] (⋀[A]^r M)) ≃ₗ[B] (⋀[B]^r (B ⊗[A] M))) := by
  sorry

/-- Part (b): the exterior powers of a finitely generated projective module are finitely
generated projective. -/
theorem _root_.TauCeti.exteriorPower_finite_projective (A : Type*) [CommRing A] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M] (r : ℕ) :
    Module.Finite A (⋀[A]^r M) ∧ Module.Projective A (⋀[A]^r M) := by
  sorry

/-- Part (c): if `M` is finitely generated projective of constant rank `n`, then `⋀^r M` has
constant rank `n.choose r`; in particular `⋀^n M` has rank one. -/
theorem _root_.TauCeti.exteriorPower_rankAtStalk (A : Type*) [CommRing A] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M] (n r : ℕ)
    (h : ∀ p : PrimeSpectrum A, Module.rankAtStalk M p = n) (p : PrimeSpectrum A) :
    Module.rankAtStalk (⋀[A]^r M) p = n.choose r := by
  sorry

/-! ### Projective modules of rank one are invertible
(ArithmeticGaloisRepresentations:R01.1/rank-one-projective-modules-are-invertible) -/

/-- ArithmeticGaloisRepresentations:R01.1/rank-one-projective-modules-are-invertible.
For `L` finitely generated projective of constant rank one, `A → End_A(L)` is bijective: every
endomorphism of `L` is multiplication by a unique scalar. (The node also states that `L` is
invertible in the sense of Mathlib's `Module.Invertible`, defined in
`Mathlib.RingTheory.PicardGroup`, which this file does not import; the bijectivity is Mathlib's
`Module.Invertible.toModuleEnd_bijective` applied to it.) -/
theorem _root_.TauCeti.toModuleEnd_bijective_of_rankAtStalk_eq_one (A : Type*) [CommRing A]
    (L : Type*) [AddCommGroup L] [Module A L] [Module.Finite A L] [Module.Projective A L]
    (h : ∀ p : PrimeSpectrum A, Module.rankAtStalk L p = 1) :
    Function.Bijective (Module.toModuleEnd A (S := A) L) := by
  sorry

/-! ### The determinant of an endomorphism of a projective module through a complement
(ArithmeticGaloisRepresentations:R01.1/determinant-through-a-complement) -/

/-- ArithmeticGaloisRepresentations:R01.1/determinant-through-a-complement. For `M` finitely
generated projective of constant rank `r` and `N` with `M × N` free of finite rank, `⋀^r u` is
multiplication by `LinearMap.det (u × id_N)` on `⋀^r M`. (The consequences listed in the node,
multiplicativity, base change, agreement with `LinearMap.det` for free `M` and the formula
`det(e ∘ u ∘ s + 1 − e ∘ s)`, are not restated.) -/
theorem _root_.TauCeti.exteriorPower_map_eq_det_prodMap_smul (A : Type*) [CommRing A]
    (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    (N : Type*) [AddCommGroup N] [Module A N] [Module.Free A (M × N)] [Module.Finite A (M × N)]
    (r : ℕ) (h : ∀ p : PrimeSpectrum A, Module.rankAtStalk M p = r) (u : M →ₗ[A] M) :
    exteriorPower.map r u =
      LinearMap.det (u.prodMap (LinearMap.id : N →ₗ[A] N)) •
        (LinearMap.id : (⋀[A]^r M) →ₗ[A] (⋀[A]^r M)) := by
  sorry

/-! ### Framed continuous representations Γ → GL_n(A)
(ArithmeticGaloisRepresentations:R01.1/framed-representation) -/

section Framed

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]
  {M : Type uM} [AddCommGroup M] [Module A M] [hMfin : Module.Finite A M]
  [hMproj : Module.Projective A M] [TopologicalSpace M] [hMtop : IsModuleTopology A M]

/-- The continuous representation on `A^n` attached to a continuous homomorphism
`ρ : Γ → GL_n(A)` (units topology). -/
def ofFramed [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) : ContinuousRep Γ A (Fin n → A) :=
  ⟨(Matrix.toLinAlgEquiv'.toRingEquiv.toMonoidHom :
      Matrix (Fin n) (Fin n) A →* Module.End A (Fin n → A)).comp
      ((Units.coeHom _).comp ρ.toMonoidHom), sorry⟩

/-- The framed representation `frame_b ρ : Γ → GL_n(A)` of a continuous representation in the
basis `b` (its matrices are `LinearMap.toMatrix b b (ρ g)`). -/
def frame [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) :
    Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A := by
  have _ := hMtop
  exact sorry

theorem coe_frame [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) (g : Γ) :
    (frame b ρ g : Matrix (Fin n) (Fin n) A) = LinearMap.toMatrix b b (ρ g) := by
  sorry

/-- `ofFramed (frame b ρ) ≅ ρ`. -/
def frameIso [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) : Iso (ofFramed (frame b ρ)) ρ :=
  sorry

/-- Change of frame: `frame b' ρ = P⁻¹ (frame b ρ) P` with `P = b.toMatrix b'`. -/
theorem frame_basis_change [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ}
    (b b' : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) (g : Γ) :
    (frame b' ρ g : Matrix (Fin n) (Fin n) A) =
      b'.toMatrix b * (frame b ρ g : Matrix (Fin n) (Fin n) A) * b.toMatrix b' := by
  sorry

/-- Framed representations give isomorphic continuous representations iff they are
`GL_n(A)`-conjugate (conjugacy over `A` itself, not over a larger ring). -/
theorem ofFramed_iso_iff [IsTopologicalRing A] {n : ℕ}
    (ρ ρ' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    Nonempty (Iso (ofFramed ρ) (ofFramed ρ')) ↔
      ∃ P : Matrix.GeneralLinearGroup (Fin n) A, ∀ h : Γ, ρ' h = P * ρ h * P⁻¹ := by
  sorry

namespace Framed

/-- Change of coefficients of a framed representation along a continuous ring homomorphism
(entrywise). -/
def map {B : Type uB} [CommRing B] [TopologicalSpace B] (f : A →+* B) (hf : Continuous f)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) B :=
  { (Matrix.GeneralLinearGroup.map f).comp ρ.toMonoidHom with continuous_toFun := sorry }

theorem coe_map {B : Type uB} [CommRing B] [TopologicalSpace B] (f : A →+* B) (hf : Continuous f)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    (map f hf ρ g : Matrix (Fin n) (Fin n) B) = (ρ g : Matrix (Fin n) (Fin n) A).map f := by
  sorry

/-- A homomorphism into `GL_n(A)` is continuous for the units topology iff its composite with
`GL_n(A) → M_n(A)` is continuous. -/
theorem continuous_iff_coe [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin n) A) :
    Continuous ρ ↔ Continuous fun g => (ρ g : Matrix (Fin n) (Fin n) A) := by
  sorry

end Framed

/-- `det (ofFramed ρ) = Matrix.det ∘ ρ`. -/
theorem det_ofFramed [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    (ofFramed ρ).det = Matrix.GeneralLinearGroup.det.comp ρ.toMonoidHom := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Framed.conj_not_integral. -/
example (ℓ : ℕ) [Fact ℓ.Prime]
    (ρ₁ ρ₂ : Multiplicative ℤ_[ℓ] →ₜ* Matrix.GeneralLinearGroup (Fin 2) ℤ_[ℓ])
    (h₁ : ∀ a, (ρ₁ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]) = !![1, Multiplicative.toAdd a; 0, 1])
    (h₂ : ∀ a, (ρ₂ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]) =
      !![1, (ℓ : ℤ_[ℓ]) * Multiplicative.toAdd a; 0, 1]) :
    (∃ P : Matrix.GeneralLinearGroup (Fin 2) ℚ_[ℓ], ∀ a,
      (ρ₂ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]).map ((↑) : ℤ_[ℓ] → ℚ_[ℓ]) =
        (P : Matrix (Fin 2) (Fin 2) ℚ_[ℓ]) *
          (ρ₁ a : Matrix (Fin 2) (Fin 2) ℤ_[ℓ]).map ((↑) : ℤ_[ℓ] → ℚ_[ℓ]) *
          ((P⁻¹ : Matrix.GeneralLinearGroup (Fin 2) ℚ_[ℓ]) : Matrix (Fin 2) (Fin 2) ℚ_[ℓ])) ∧
      ¬ ∃ P : Matrix.GeneralLinearGroup (Fin 2) ℤ_[ℓ], ∀ a, ρ₂ a = P * ρ₁ a * P⁻¹ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Framed.rank_one. -/
example [IsTopologicalRing A] (χ : Γ →ₜ* Aˣ)
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) A)
    (h : ∀ g, (ρ g : Matrix (Fin 1) (Fin 1) A) 0 0 = χ g) :
    Nonempty (Iso (ofFramed ρ) (ofCharacter χ)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Framed.rank_zero. -/
example [IsTopologicalRing A] (ρ ρ' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 0) A) :
    ρ = ρ' ∧ ofFramed ρ = ContinuousRep.trivial := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Framed.continuous_iff_coe. -/
example [IsTopologicalGroup Γ] [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin n) A) :
    Continuous ρ ↔ Continuous fun g => (ρ g : Matrix (Fin n) (Fin n) A) :=
  Framed.continuous_iff_coe ρ

end Framed

/-! ### Extension of coefficients
(ArithmeticGaloisRepresentations:R01.1/coefficient-extension) -/

section BaseChange

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]
  {M : Type uM} [AddCommGroup M] [Module A M] [hMfin : Module.Finite A M]
  [hMproj : Module.Projective A M] [TopologicalSpace M] [hMtop : IsModuleTopology A M]

/-- The linear representation `g ↦ id_B ⊗ ρ(g)` on `B ⊗_A M`: the algebraic base change, with no
topology involved. It is Tau Ceti's `Representation.baseChange`, restated here because this file
imports only Mathlib. -/
def baseChangeRepresentation (B : Type uB) [CommRing B] [Algebra A B]
    (ρ : Representation A Γ M) : Representation B Γ (B ⊗[A] M) where
  toFun g := (ρ g).baseChange B
  map_one' := sorry
  map_mul' := sorry

/-- Base change `M_B := B ⊗_A M` along a continuous ring homomorphism `A → B` (an `A`-algebra
`B` with continuous scalar multiplication), with the module topology over `B`. -/
def baseChange [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (B : Type uB) [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    ContinuousRep Γ B (B ⊗[A] M) :=
  ⟨baseChangeRepresentation B ρ.toRepresentation, by have _ := hMtop; sorry⟩

variable (B : Type uB) [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
  [ContinuousSMul A B]

theorem baseChange_apply_tmul [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] (g : Γ) (b : B) (m : M) :
    ρ.baseChange B g (b ⊗ₜ m) = b ⊗ₜ ρ g m := by
  sorry

/-- The underlying linear representation of `baseChange` is the algebraic base change
(Tau Ceti's `Representation.baseChange`, here `baseChangeRepresentation`). -/
theorem baseChange_toRepresentation [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    (ρ.baseChange B).toRepresentation = baseChangeRepresentation B ρ.toRepresentation := by
  sorry

/-- Transitivity `(M_B)_C ≅ M_C` for `A → B → C`. -/
def baseChangeComp [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (B : Type uB) [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B]
    (C : Type uC) [CommRing C] [TopologicalSpace C] [IsTopologicalRing C] [Algebra B C]
    [Algebra A C] [IsScalarTower A B C] [ContinuousSMul B C] [ContinuousSMul A C]
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)]
    [TopologicalSpace (C ⊗[B] (B ⊗[A] M))] [IsModuleTopology C (C ⊗[B] (B ⊗[A] M))]
    [TopologicalSpace (C ⊗[A] M)] [IsModuleTopology C (C ⊗[A] M)] :
    Iso ((ρ.baseChange B).baseChange C) (ρ.baseChange C) :=
  sorry

/-- `det (M_B) = f ∘ det M`. -/
theorem det_baseChange [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    (ρ.baseChange B).det = (Units.map (algebraMap A B).toMonoidHom).comp ρ.det := by
  sorry

/-- For free `M`: `charpoly ρ_B(g) = (charpoly ρ(g)).map f`. -/
theorem charpoly_baseChange [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] (g : Γ) :
    (ρ.baseChange B).charpoly g = (ρ.charpoly g).map (algebraMap A B) := by
  sorry

/-- For every extension of (topological) fields `K ⊂ K'`: `(V_{K'})^Γ = K' ⊗_K V^Γ`. The statement
is algebraic and holds for the underlying representations of any monoid over any field
extension. -/
theorem invariants_baseChange {K : Type uA} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
    {V : Type uM} [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
    [IsModuleTopology K V] (ρ : ContinuousRep Γ K V)
    (K' : Type uB) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    Nonempty ((ρ.baseChange K').toRepresentation.invariants ≃ₗ[K']
      K' ⊗[K] ρ.toRepresentation.invariants) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.baseChange_cyclotomic.
(`ContinuousSMul ℤ_[ℓ] ℚ_[ℓ]` is not yet a Mathlib instance, so it is a hypothesis here.) -/
example (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [ContinuousSMul ℤ_[ℓ] ℚ_[ℓ]]
    [TopologicalSpace (ℚ_[ℓ] ⊗[ℤ_[ℓ]] ℤ_[ℓ])] [IsModuleTopology ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] ℤ_[ℓ])]
    (ψ : Field.absoluteGaloisGroup F →ₜ* ℚ_[ℓ]ˣ)
    (hψ : ∀ g, (ψ g : ℚ_[ℓ]) = ((TateTwist.cyclotomicChar F ℓ g : ℤ_[ℓ]) : ℚ_[ℓ])) :
    Nonempty (Iso ((ofCharacter (TateTwist.cyclotomicChar F ℓ)).baseChange ℚ_[ℓ])
      (ofCharacter ψ)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.baseChange_id. -/
example [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) [TopologicalSpace (A ⊗[A] M)]
    [IsModuleTopology A (A ⊗[A] M)] : Nonempty (Iso (ρ.baseChange A) ρ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.baseChange_discontinuous.
Along `ℚ_ℓ → B` with `B` discrete (e.g. `ℚ_ℓ` with the discrete topology; the map is not
continuous), the base change of `ℚ_ℓ(1)` is not a `ContinuousRep`: its kernel is not open. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (B : Type) [Field B] [TopologicalSpace B] [DiscreteTopology B]
    [Algebra ℚ_[ℓ] B] :
    ¬ ∃ r : ContinuousRep (Field.absoluteGaloisGroup ℚ) B B, ∀ g b,
      r g b = algebraMap ℚ_[ℓ] B ((TateTwist.cyclotomicChar ℚ ℓ g : ℤ_[ℓ]) : ℚ_[ℓ]) * b := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.finrank_hom_baseChange. -/
example {K : Type uA} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
    {V : Type uM} [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
    [IsModuleTopology K V] {W : Type uM} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    [TopologicalSpace W] [IsModuleTopology K W] (ρ : ContinuousRep Γ K V) (σ : ContinuousRep Γ K W)
    (K' : Type uB) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)]
    [TopologicalSpace (K' ⊗[K] W)] [IsModuleTopology K' (K' ⊗[K] W)] :
    Module.finrank K' ((ρ.baseChange K').toRepresentation.IntertwiningMap
        (σ.baseChange K').toRepresentation) =
      Module.finrank K (ρ.toRepresentation.IntertwiningMap σ.toRepresentation) := by
  sorry

end BaseChange

/-! ### Restriction, duals, tensor products, Hom and twists
(ArithmeticGaloisRepresentations:R01.1/restriction-dual-tensor-twist) -/

-- `TauCeti.ContinuousRep.res` is declared in the preamble.

section Operations

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]
  {M : Type uM} [AddCommGroup M] [Module A M] [hMfin : Module.Finite A M]
  [hMproj : Module.Projective A M] [TopologicalSpace M] [hMtop : IsModuleTopology A M]
  {N : Type uN} [AddCommGroup N] [Module A N] [hNfin : Module.Finite A N]
  [hNproj : Module.Projective A N] [TopologicalSpace N] [hNtop : IsModuleTopology A N]

theorem res_id (ρ : ContinuousRep Γ A M) : ρ.res (ContinuousMonoidHom.id Γ) = ρ := by
  sorry

/-- The tensor product `M ⊗_A N` with the diagonal action. -/
def tensor [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)] :
    ContinuousRep Γ A (M ⊗[A] N) :=
  ⟨ρ.toRepresentation.tprod σ.toRepresentation, by have _ := hMtop; have _ := hNtop; sorry⟩

theorem tensor_apply_tmul [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N) [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)]
    (g : Γ) (m : M) (n : N) : ρ.tensor σ g (m ⊗ₜ n) = ρ g m ⊗ₜ σ g n := by
  sorry

/-- The dual `M^∨ = Hom_A(M, A)` with the inverse-transpose action `(g λ)(m) = λ(g⁻¹ m)`. -/
def dual [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)]
    [IsModuleTopology A (Module.Dual A M)] : ContinuousRep Γ A (Module.Dual A M) :=
  ⟨ρ.toRepresentation.dual, by have _ := hMfin; have _ := hMproj; have _ := hMtop; sorry⟩

theorem dual_apply [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    (g : Γ) (f : Module.Dual A M) (m : M) : ρ.dual g f m = f (ρ g⁻¹ m) := by
  sorry

/-- The internal Hom `Hom_A(M, N)` with `g · f = ρ_N(g) ∘ f ∘ ρ_M(g)⁻¹`. -/
def hom [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    ContinuousRep Γ A (M →ₗ[A] N) :=
  ⟨ρ.toRepresentation.linHom σ.toRepresentation, by have _ := hMtop; have _ := hNtop; sorry⟩

/-- `Hom_A(M, N) ≅ M^∨ ⊗_A N`. -/
def homEquivDualTensor [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)]
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    [TopologicalSpace (Module.Dual A M ⊗[A] N)] [IsModuleTopology A (Module.Dual A M ⊗[A] N)] :
    Iso (ρ.hom σ) (ρ.dual.tensor σ) :=
  sorry

/-- The twist `M(χ) := M ⊗_A A(χ)` by a continuous character, realised on the carrier `M`
(through `M ⊗_A A ≅ M`) with action `g ↦ χ(g) ρ(g)`; see `twistIsoTensor`. -/
def twist [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ) : ContinuousRep Γ A M :=
  ⟨{ toFun g := (χ g : A) • ρ g
     map_one' := sorry
     map_mul' := sorry }, by have _ := hMtop; sorry⟩

/-- The twist agrees with `M ⊗_A A(χ)`. -/
def twistIsoTensor [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ)
    [TopologicalSpace (M ⊗[A] A)] [IsModuleTopology A (M ⊗[A] A)] :
    Iso (ρ.twist χ) (ρ.tensor (ofCharacter χ)) :=
  sorry

theorem twist_twist [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) (χ ψ : Γ →ₜ* Aˣ)
    (χψ : Γ →ₜ* Aˣ) (h : ∀ g, χψ g = χ g * ψ g) : (ρ.twist χ).twist ψ = ρ.twist χψ := by
  sorry

/-- The direct sum `M ⊕ N` (as `M × N`); inclusions and projections are morphisms. -/
def directSum (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) : ContinuousRep Γ A (M × N) :=
  ⟨ρ.toRepresentation.prod σ.toRepresentation, sorry⟩

/-- `det (M ⊗ N) = (det M)^{rank N} (det N)^{rank M}` for free carriers. -/
theorem det_tensor [IsTopologicalRing A] [Module.Free A M] [Module.Free A N]
    (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)] :
    (ρ.tensor σ).det = ρ.det ^ Module.finrank A N * σ.det ^ Module.finrank A M := by
  sorry

theorem det_twist [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M)
    (χ : Γ →ₜ* Aˣ) : (ρ.twist χ).det = ρ.det * χ.toMonoidHom ^ Module.finrank A M := by
  sorry

theorem det_res {Γ' : Type uΓ'} [Group Γ'] [TopologicalSpace Γ'] (φ : Γ' →ₜ* Γ)
    (ρ : ContinuousRep Γ A M) : (ρ.res φ).det = ρ.det.comp φ.toMonoidHom := by
  sorry

theorem det_directSum (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) :
    (ρ.directSum σ).det = ρ.det * σ.det := by
  sorry

/-- `Hom_A(M, N)^Γ = Hom_Γ(M, N)`: a linear map is invariant iff it is equivariant. -/
theorem invariants_hom [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] (f : M →ₗ[A] N) :
    f ∈ (ρ.hom σ).toRepresentation.invariants ↔ ∀ g : Γ, f ∘ₗ ρ g = σ g ∘ₗ f := by
  sorry

/-- Restriction commutes with coefficient extension (and with `tensor`, `dual`, `twist`). -/
theorem res_baseChange [IsTopologicalRing A] {Γ' : Type uΓ'} [Group Γ'] [TopologicalSpace Γ']
    (φ : Γ' →ₜ* Γ) (ρ : ContinuousRep Γ A M)
    (B : Type uB) [CommRing B] [TopologicalSpace B] [IsTopologicalRing B] [Algebra A B]
    [ContinuousSMul A B] [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)] :
    (ρ.baseChange B).res φ = (ρ.res φ).baseChange B := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.det_dual. -/
example [IsTopologicalGroup Γ] [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    [TopologicalSpace (Module.Dual A A)] [IsModuleTopology A (Module.Dual A A)]
    (χ ψ : Γ →ₜ* Aˣ) (hψ : ∀ g, ψ g = (χ g)⁻¹) :
    ρ.dual.det = ρ.det⁻¹ ∧ Nonempty (Iso (ofCharacter χ).dual (ofCharacter ψ)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.twist_one. -/
example [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) :
    ρ.twist 1 = ρ ∧ Subsingleton ((Fin 0 → A) →ₗ[A] N) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.dual_action_inverse_transpose.
For `Γ = GL_2(F_2) ≅ S_3`, `g ↦ ρ(g)ᵀ` is not multiplicative (it is an anti-homomorphism). -/
example : ¬ ∀ g h : Matrix.GeneralLinearGroup (Fin 2) (ZMod 2),
    Matrix.transpose ((g * h : Matrix.GeneralLinearGroup (Fin 2) (ZMod 2)) :
        Matrix (Fin 2) (Fin 2) (ZMod 2)) =
      Matrix.transpose (g : Matrix (Fin 2) (Fin 2) (ZMod 2)) *
        Matrix.transpose (h : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.invariants_hom. -/
example [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    Nonempty ((ρ.hom σ).toRepresentation.invariants ≃ₗ[A]
      ρ.toRepresentation.IntertwiningMap σ.toRepresentation) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.linHom_compat.
The Tau Ceti `ContRepresentation.linHom` is not in Mathlib. For a complete normed coefficient
field and finite-dimensional `V`, `W` with norms inducing their module topologies, Tau Ceti's
`ContRepresentation.conj_linHom` says that `Representation.linHom`, transported along
`LinearMap.toContinuousLinearMap`, is `ContRepresentation.linHom`. What is checked here is the
Mathlib half of that comparison: `hom` carries Mathlib's `Representation.linHom`. -/
example [IsTopologicalGroup Γ] [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    (ρ.hom σ).toRepresentation = ρ.toRepresentation.linHom σ.toRepresentation :=
  rfl

end Operations

/-! ### The Tate module Z_ℓ(1) and Tate twists
(ArithmeticGaloisRepresentations:R01.1/tate-twist) -/

namespace TateTwist

/-- `ℤ_ℓ(1) := ofCharacter χ_ℓ`, for `ℓ ≠ char F`. -/
def zlOne (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    ContinuousRep (Field.absoluteGaloisGroup F) ℤ_[ℓ] ℤ_[ℓ] :=
  ofCharacter (cyclotomicChar F ℓ)

theorem zlOne_apply (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)]
    (σ : Field.absoluteGaloisGroup F) (x : ℤ_[ℓ]) :
    zlOne F ℓ σ x = (cyclotomicChar F ℓ σ : ℤ_[ℓ]) * x := by
  sorry

variable {F : Type*} [Field F] {A : Type uA} [CommRing A] [TopologicalSpace A]
  {M : Type uM} [AddCommGroup M] [Module A M] [hMfin : Module.Finite A M]
  [hMproj : Module.Projective A M] [TopologicalSpace M] [hMtop : IsModuleTopology A M]

/-- The Tate twist `M(n) := M ⊗_{ℤ_ℓ} ℤ_ℓ(n) = M(χ_ℓ^n)` of a representation over a topological
`ℤ_ℓ`-algebra `A`, realised on `M` (see `tateTwist_apply`). -/
def tateTwist (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] [IsTopologicalRing A] [Algebra ℤ_[ℓ] A]
    [ContinuousSMul ℤ_[ℓ] A] (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ) :
    ContinuousRep (Field.absoluteGaloisGroup F) A M := by
  have _ := hMtop
  exact sorry

variable (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] [IsTopologicalRing A] [Algebra ℤ_[ℓ] A]
  [ContinuousSMul ℤ_[ℓ] A]

theorem tateTwist_apply (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ)
    (g : Field.absoluteGaloisGroup F) (m : M) :
    tateTwist ℓ ρ n g m =
      ((Units.map (algebraMap ℤ_[ℓ] A).toMonoidHom (cyclotomicChar F ℓ g) ^ n : Aˣ) : A) •
        ρ g m := by
  sorry

theorem tateTwist_add (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (m n : ℤ) :
    tateTwist ℓ (tateTwist ℓ ρ m) n = tateTwist ℓ ρ (m + n) := by
  sorry

theorem tateTwist_zero (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    tateTwist ℓ ρ 0 = ρ := by
  sorry

/-- `ℤ_ℓ(1) ≅ lim_n μ_{ℓ^n}(F̄)` (transition maps `ζ ↦ ζ^ℓ`), after a choice of compatible
system of roots of unity; Galois equivariance is `zlOneEquivLimRootsOfUnity_galois`. -/
def zlOneEquivLimRootsOfUnity (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    {x : ℕ → (AlgebraicClosure F)ˣ // ∀ n, x n ^ (ℓ ^ n) = 1 ∧ x (n + 1) ^ ℓ = x n} ≃ ℤ_[ℓ] :=
  sorry

theorem zlOneEquivLimRootsOfUnity_galois (σ : Field.absoluteGaloisGroup F)
    (x y : {x : ℕ → (AlgebraicClosure F)ˣ // ∀ n, x n ^ (ℓ ^ n) = 1 ∧ x (n + 1) ^ ℓ = x n})
    (hxy : ∀ n, y.1 n = Units.map σ.toRingEquiv.toMonoidHom (x.1 n)) :
    zlOneEquivLimRootsOfUnity F ℓ y = zlOne F ℓ σ (zlOneEquivLimRootsOfUnity F ℓ x) := by
  sorry

/-- `Res_{G_{F'}} ℤ_ℓ(1)_F ≅ ℤ_ℓ(1)_{F'}` for a finite extension `F'/F`. -/
theorem res_zlOne (F' : Type*) [Field F'] [Algebra F F'] [FiniteDimensional F F'] [NeZero (ℓ : F')]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure F')]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure F')] :
    Nonempty (Iso ((zlOne F ℓ).res (GaloisRep.localEmbeddingMap F F')) (zlOne F' ℓ)) := by
  sorry

/-- `M(n)^∨ ≅ M^∨(−n)`. -/
theorem dual_tateTwist (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)] :
    Nonempty (Iso (tateTwist ℓ ρ n).dual (tateTwist ℓ ρ.dual (-n))) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.TateTwist.complexConj. -/
example (v : NumberField.InfinitePlace ℚ) (hv : v.IsReal) (x : ℤ_[ℓ]) :
    zlOne ℚ ℓ (GaloisRep.complexConjugation ℚ v hv) x = -x := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.TateTwist.zero. -/
example (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    tateTwist ℓ (zlOne F ℓ) (-1) = ContinuousRep.trivial ∧ tateTwist ℓ ρ 0 = ρ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.TateTwist.charEll_excluded.
In characteristic `ℓ` Mathlib's cyclotomic character is trivial, while `lim μ_{ℓ^n}(F̄) = 0`. -/
example (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [CharP F ℓ] :
    (∀ g, GaloisRep.cyclotomicCharacter F ℓ g = 1) ∧
      ∀ x : ℕ → (AlgebraicClosure F)ˣ, (∀ n, x n ^ (ℓ ^ n) = 1) → x = 1 := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.TateTwist.mod_pow_iso_rootsOfUnity. -/
example (n : ℕ) :
    ∃ e : ZMod (ℓ ^ n) ≃+ Additive (rootsOfUnity (ℓ ^ n) (AlgebraicClosure F)),
      ∀ (σ : Field.absoluteGaloisGroup F) (a : ZMod (ℓ ^ n)),
        ((Additive.toMul (e (PadicInt.toZModPow n (cyclotomicChar F ℓ σ : ℤ_[ℓ]) * a)) :
            rootsOfUnity (ℓ ^ n) (AlgebraicClosure F)) : (AlgebraicClosure F)ˣ) =
          Units.map σ.toRingEquiv.toMonoidHom
            ((Additive.toMul (e a) : rootsOfUnity (ℓ ^ n) (AlgebraicClosure F)) :
              (AlgebraicClosure F)ˣ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.TateTwist.det. -/
example [Module.Free A M] (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (n : ℤ) :
    (tateTwist ℓ ρ n).det = ρ.det *
      ((Units.map (algebraMap ℤ_[ℓ] A).toMonoidHom).comp (cyclotomicChar F ℓ).toMonoidHom) ^
        (n * (Module.finrank A M : ℤ)) := by
  sorry

end TateTwist

/-! ### Induction from open subgroups
(ArithmeticGaloisRepresentations:R01.1/continuous-induction) -/

section Induction

-- `Γ` is a topological group throughout this section: an open subgroup of a compact group has
-- finite index, and conjugation is continuous, only when the translations of `Γ` are continuous.
variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]
  {U : Type uM} [AddCommGroup U] [Module A U] [hUfin : Module.Finite A U]
  [hUproj : Module.Projective A U] [TopologicalSpace U] [hUtop : IsModuleTopology A U]
  {M : Type uN} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- The inclusion of an open subgroup as a continuous homomorphism. -/
def openSubtype (H : OpenSubgroup Γ) : H →ₜ* Γ where
  toFun x := x.1
  map_one' := rfl
  map_mul' _ _ := rfl
  continuous_toFun := continuous_subtype_val

/-- The carrier of `Ind_H^Γ U`: the functions `f : Γ → U` with `f (h x) = σ(h) (f x)`, i.e.
Mathlib's `Representation.coindV` along `H → Γ`, with the subspace topology of `Γ → U`. -/
abbrev IndV (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) : Type _ :=
  Representation.coindV (openSubtype H).toMonoidHom σ.toRepresentation

instance [CompactSpace Γ] (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    Module.Finite A (IndV H σ) := by
  have _ := hUfin
  sorry

instance [CompactSpace Γ] (H : OpenSubgroup Γ)
    (σ : ContinuousRep H A U) : Module.Projective A (IndV H σ) := by
  have _ := hUfin; have _ := hUproj
  sorry

instance [CompactSpace Γ] [IsTopologicalRing A] (H : OpenSubgroup Γ)
    (σ : ContinuousRep H A U) : IsModuleTopology A (IndV H σ) := by
  have _ := hUtop
  sorry

/-- The induced representation `Ind_H^Γ U` from an open subgroup, `(g f)(x) = f(x g)`. -/
def ind [CompactSpace Γ] [IsTopologicalRing A] (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    ContinuousRep Γ A (IndV H σ) :=
  ⟨Representation.coind (openSubtype H).toMonoidHom σ.toRepresentation,
    by have _ := hUfin; have _ := hUproj; have _ := hUtop; sorry⟩

variable [CompactSpace Γ] [IsTopologicalRing A]

theorem ind_apply (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) (g : Γ) (f : IndV H σ) (x : Γ) :
    ((ind H σ g f : IndV H σ) : Γ → U) x = (f : Γ → U) (x * g) := by
  sorry

/-- For a right transversal `(t_i)` of `H` in `Γ` (`Γ = ⊔ H t_i`), `f ↦ (f(t_i))_i`. -/
def indEquivPi (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) {m : ℕ}
    (t : {t : Fin m → Γ // Function.Injective t ∧
      Subgroup.IsComplement (H : Set Γ) (Set.range t)}) :
    IndV H σ ≃ₗ[A] (Fin m → U) :=
  sorry

/-- Frobenius reciprocity: `Hom_Γ(M, Ind U) ≃ Hom_H(Res M, U)` and
`Hom_Γ(Ind U, M) ≃ Hom_H(U, Res M)`. -/
def indResEquiv (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) (ρ : ContinuousRep Γ A M) :
    (ρ.Hom (ind H σ) ≃ (ρ.res (openSubtype H)).Hom σ) ×
      ((ind H σ).Hom ρ ≃ σ.Hom (ρ.res (openSubtype H))) :=
  sorry

/-- Shapiro on invariants: `(Ind_H^Γ U)^Γ ≃ U^H`, `f ↦ f(1)`. -/
def invariantsIndEquiv (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    (ind H σ).toRepresentation.invariants ≃ₗ[A] σ.toRepresentation.invariants :=
  sorry

/-- An open subgroup `K ≤ H` viewed as an open subgroup of `H`. -/
def openSubgroupIn (K H : OpenSubgroup Γ) : OpenSubgroup H :=
  K.comap (openSubtype H).toMonoidHom (openSubtype H).continuous

/-- The identification `K ∩ H = K` for `K ≤ H`, as a continuous isomorphism onto `K`. -/
def openSubgroupInHom {K H : OpenSubgroup Γ} (hKH : K ≤ H) : openSubgroupIn K H →ₜ* K where
  toFun x := ⟨(x.1 : Γ), x.2⟩
  map_one' := rfl
  map_mul' _ _ := rfl
  continuous_toFun := sorry

/-- Transitivity: `Ind_H^Γ Ind_K^H W ≅ Ind_K^Γ W` for open `K ≤ H ≤ Γ`, `f ↦ (x ↦ f(x)(1))`. -/
def indInd {W : Type uM} [AddCommGroup W] [Module A W] [Module.Finite A W] [Module.Projective A W]
    [TopologicalSpace W] [IsModuleTopology A W] {K H : OpenSubgroup Γ} [CompactSpace H]
    (hKH : K ≤ H) (τ : ContinuousRep K A W) :
    Iso (ind H (ind (openSubgroupIn K H) (τ.res (openSubgroupInHom hKH)))) (ind K τ) :=
  sorry

/-- The projection formula `Ind(Res M ⊗ U) ≅ M ⊗ Ind U`. -/
def indTensorRes (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (M ⊗[A] U)] [IsModuleTopology A (M ⊗[A] U)]
    [TopologicalSpace (M ⊗[A] IndV H σ)] [IsModuleTopology A (M ⊗[A] IndV H σ)] :
    Iso (ind H ((ρ.res (openSubtype H)).tensor σ)) (ρ.tensor (ind H σ)) :=
  sorry

/-- The underlying representation of `Ind_H^Γ U` is Mathlib's `Representation.coind` along
`H → Γ`. The node's item says more: the underlying `ContRepresentation` is isomorphic
(`ContRepresentation.Equiv`) to Mathlib's `ContRepresentation.coind` along `H → Γ`, whose carrier
is a submodule of `C(Γ, U)` with the compact-open topology; that comparison of topologies is
`continuous_of_equivariant` and `exists_homeomorph_equivariant_continuousMap` below, and the
resulting isomorphism of `ContRepresentation`s is not restated. -/
theorem ind_toContRepresentation (H : OpenSubgroup Γ) (σ : ContinuousRep H A U)
    [IsTopologicalAddGroup (IndV H σ)] :
    (ind H σ).toContRepresentation.toRepresentation =
      Representation.coind (openSubtype H).toMonoidHom σ.toRepresentation := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Ind.rank.
(The permutation-representation description of `Ind_H^Γ 1` is not restated.) -/
example [Module.Free A U] (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    Module.finrank A (IndV H σ) = (H : Subgroup Γ).index * Module.finrank A U := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Ind.self. -/
example (ρ : ContinuousRep Γ A M) : Nonempty (Iso (ind ⊤ (ρ.res (openSubtype ⊤))) ρ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Ind.closed_infinite_index.
For the closed subgroup `{0}` of `ℤ_ℓ` the module of all functions `ℤ_ℓ → K` is not finitely
generated, so the construction needs `H` open. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (K : Type) [Field K] :
    ¬ Module.Finite K (Multiplicative ℤ_[ℓ] → K) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Ind.invariants. -/
example (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    ∃ e : (ind H σ).toRepresentation.invariants ≃ₗ[A] σ.toRepresentation.invariants,
      ∀ f, ((e f : U)) = ((f : IndV H σ) : Γ → U) 1 := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Ind.compat_coind.
(The isomorphism of the underlying `ContRepresentation` with Mathlib's `ContRepresentation.coind`
and the comparison with `Representation.ind` through `Rep.indCoindIso` are not restated; this
checks the underlying representation.) -/
example (H : OpenSubgroup Γ) (σ : ContinuousRep H A U) :
    (ind H σ).toRepresentation =
      Representation.coind (openSubtype H).toMonoidHom σ.toRepresentation :=
  rfl

/-! ### The topology of the induced module: evaluation at a transversal
(ArithmeticGaloisRepresentations:R01.1/evaluation-at-a-transversal-is-a-homeomorphism) -/

/-- ArithmeticGaloisRepresentations:R01.1/evaluation-at-a-transversal-is-a-homeomorphism,
part (a): a function `Γ → U` that is equivariant for an open subgroup `H` acting through a
`ContinuousRep` is continuous. -/
theorem continuous_of_equivariant (H : OpenSubgroup Γ)
    (σ : ContinuousRep H A U) (f : Γ → U)
    (hf : ∀ (h : H) (x : Γ), f ((h : Γ) * x) = σ h (f x)) : Continuous f := by
  sorry

/-- Part (b): on the equivariant functions in `C(Γ, U)` (compact-open topology), evaluation at a
right transversal is a homeomorphism onto `U^m`. Part (c), that the module of `ind` is therefore
isomorphic as a `ContRepresentation` to Mathlib's `ContRepresentation.coind` along `H → Γ`, is
not restated. -/
theorem exists_homeomorph_equivariant_continuousMap (H : OpenSubgroup Γ)
    (σ : ContinuousRep H A U) {m : ℕ}
    (t : {t : Fin m → Γ // Function.Injective t ∧
      Subgroup.IsComplement (H : Set Γ) (Set.range t)}) :
    ∃ e : {f : ContinuousMap Γ U // ∀ (h : H) (x : Γ), f ((h : Γ) * x) = σ h (f x)} ≃ₜ
        (Fin m → U),
      ∀ f i, e f i = (f : ContinuousMap Γ U) (t.1 i) := by
  sorry

/-! ### The Mackey decomposition (ArithmeticGaloisRepresentations:R01.1/mackey-decomposition) -/

/-- `D_s := D ∩ s⁻¹ H s` as an open subgroup of `D`. -/
def mackeySubgroup (H : OpenSubgroup Γ) (D : Subgroup Γ) (s : Γ) : OpenSubgroup D :=
  H.comap ((MulAut.conj s).toMonoidHom.comp D.subtype) sorry

/-- `y ↦ s y s⁻¹ : D_s → H`, along which `U^s` is the restriction of `U`. -/
def mackeyConj (H : OpenSubgroup Γ) (D : Subgroup Γ) (s : Γ) : mackeySubgroup H D s →ₜ* H where
  toFun y := ⟨s * ((y : D) : Γ) * s⁻¹, sorry⟩
  map_one' := sorry
  map_mul' := sorry
  continuous_toFun := sorry

/-- ArithmeticGaloisRepresentations:R01.1/mackey-decomposition. For `H` open and `D` closed,
`H\Γ/D` is finite, and for any choice of representatives `s` of the double cosets there is a
`D`-equivariant isomorphism `Res_D Ind_H^Γ U ≅ ⊕_{HsD} Ind_{D_s}^D (Res U^s)` (the summand
for `s` being the functions supported on `HsD`, sent to `d ↦ f(s d)`). The isomorphism of the
underlying abstract representations is Tau Ceti's `Rep.mackeyDecomposition` (arbitrary subgroups
of an abstract group, coinvariant model `Rep.ind`); this is its form in the function model, for
an open and a closed subgroup of a compact group, with the finiteness of the double cosets. -/
theorem mackey_decomposition (H : OpenSubgroup Γ) (D : Subgroup Γ) (hD : IsClosed (D : Set Γ))
    [CompactSpace D] (σ : ContinuousRep H A U) (s : DoubleCoset.Quotient (H : Set Γ) (D : Set Γ) → Γ)
    (hs : ∀ q, DoubleCoset.mk (H : Subgroup Γ) D (s q) = q) :
    Finite (DoubleCoset.Quotient (H : Set Γ) (D : Set Γ)) ∧
      ∃ e : IndV H σ ≃ₗ[A] ((q : DoubleCoset.Quotient (H : Set Γ) (D : Set Γ)) →
          IndV (mackeySubgroup H D (s q)) (σ.res (mackeyConj H D (s q)))),
        ∀ (d : D) (f : IndV H σ) (q : DoubleCoset.Quotient (H : Set Γ) (D : Set Γ)),
          e (ind H σ (d : Γ) f) q =
            ind (mackeySubgroup H D (s q)) (σ.res (mackeyConj H D (s q))) d (e f q) := by
  sorry

/-! ### The determinant of an induced representation
(ArithmeticGaloisRepresentations:R01.1/determinant-of-induced-representation) -/

/-- ArithmeticGaloisRepresentations:R01.1/determinant-of-induced-representation.
`det Ind_H^Γ U = sgn_{Γ/H}^r · (det U ∘ Ver_{Γ→H})` for `U` free of rank `r`, with the sign of the
permutation action of `Γ` on `Γ/H` and Mathlib's transfer `MonoidHom.transfer`. (The node allows
`U` projective of constant rank `r`; this is the free case, to which the general one reduces by
localisation.) -/
theorem det_ind [Module.Free A U] (H : OpenSubgroup Γ) [(H : Subgroup Γ).FiniteIndex]
    [Fintype (Γ ⧸ (H : Subgroup Γ))] [DecidableEq (Γ ⧸ (H : Subgroup Γ))]
    (σ : ContinuousRep H A U) (g : Γ) :
    (ind H σ).det g =
      Units.map (Int.castRingHom A).toMonoidHom
          (Equiv.Perm.sign (MulAction.toPermHom Γ (Γ ⧸ (H : Subgroup Γ)) g)) ^
          Module.finrank A U *
        MonoidHom.transfer (H := (H : Subgroup Γ)) σ.det g := by
  sorry

end Induction

/-! ### Discrete coefficients, open kernels and finite Galois quotients
(ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients) -/

/-- ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients.
For discrete `A`, joint continuity ⇔ open stabilisers ⇔ open kernel ⇔ factorisation through a
finite quotient by an open normal subgroup; the image is then finite (for every discrete `A`); and
(Artin representations) every continuous `Γ → GL_n(ℂ)` has open kernel and finite image.
(The Galois form, factorisation through `Gal(L/F)` for finite Galois `L/F`, is the case
`Γ = G_F` of (iv) and is not restated.) -/
theorem continuous_iff_isOpen_ker {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
    {A : Type uA} [CommRing A] [TopologicalSpace A] [DiscreteTopology A]
    {M : Type uM} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] (ρ : Representation A Γ M) :
    List.TFAE
        [∃ r : ContinuousRep Γ A M, r.toRepresentation = ρ,
          ∀ m : M, IsOpen {g : Γ | ρ g m = m},
          IsOpen (ρ.ker : Set Γ),
          ∃ N : Subgroup Γ, N.Normal ∧ IsOpen (N : Set Γ) ∧ N ≤ ρ.ker] ∧
      (IsOpen (ρ.ker : Set Γ) → (Set.range ρ).Finite) ∧
      ∀ (n : ℕ) (r : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) ℂ),
        IsOpen (r.toMonoidHom.ker : Set Γ) ∧ (Set.range r).Finite := by
  sorry

/-! ### No small subgroups in the unit group of a real normed algebra
(ArithmeticGaloisRepresentations:R01.1/no-small-subgroups-in-a-normed-algebra) -/

/-- ArithmeticGaloisRepresentations:R01.1/no-small-subgroups-in-a-normed-algebra. In a real
normed algebra, a subgroup of the units all of whose elements are within `r < 1` of `1` is
trivial. (For `M_n(ℂ)` with an operator norm this is the absence of small subgroups in
`GL_n(ℂ)`, used for Artin representations in `continuous_iff_isOpen_ker`.) -/
theorem _root_.TauCeti.subgroup_units_eq_bot_of_norm_sub_one_le {R : Type*} [NormedRing R]
    [NormedAlgebra ℝ R] (G : Subgroup Rˣ) (r : ℝ) (hr : r < 1)
    (h : ∀ g ∈ G, ‖((g : Rˣ) : R) - 1‖ ≤ r) : G = ⊥ := by
  sorry

/-! ### Descent of residual representations to a finite field
(ArithmeticGaloisRepresentations:R01.1/residual-descent-to-a-finite-field) -/

/-- ArithmeticGaloisRepresentations:R01.1/residual-descent-to-a-finite-field.
A continuous `ρ : Γ → GL_n(F̄_p)` (discrete topology) has finite image, and its matrix entries
generate a finite subfield `k`, so `ρ` takes values in `GL_n(k)`. -/
theorem residual_descent_finite_field {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
    [CompactSpace Γ] (p : ℕ) [Fact p.Prime] [TopologicalSpace (AlgebraicClosure (ZMod p))]
    [DiscreteTopology (AlgebraicClosure (ZMod p))] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (AlgebraicClosure (ZMod p))) :
    (Set.range ρ).Finite ∧ ∃ k : Subfield (AlgebraicClosure (ZMod p)), Finite k ∧
      ∀ (g : Γ) (i j : Fin n),
        (ρ g : Matrix (Fin n) (Fin n) (AlgebraicClosure (ZMod p))) i j ∈ k := by
  sorry

/-! ### Baire descent of ℓ-adic representations to a coefficient field
(ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field) -/

/-- ArithmeticGaloisRepresentations:R01.1/baire-descent-to-a-finite-coefficient-field.
A continuous `ρ : Γ → GL_n(Q̄_ℓ)` from a compact Hausdorff group takes values in `GL_n(E)` for a
subfield `E ⊂ Q̄_ℓ` finite over `ℚ_ℓ`. -/
theorem baire_descent {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [CompactSpace Γ] [T2Space Γ]
    (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
    ∃ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E ∧
      ∀ (g : Γ) (i j : Fin n), (ρ g : Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E := by
  sorry

/-! ### The finite extensions of Q_ℓ inside Q̄_ℓ are countably many and closed
(ArithmeticGaloisRepresentations:R01.1/countably-many-coefficient-fields) -/

/-- ArithmeticGaloisRepresentations:R01.1/countably-many-coefficient-fields. The subfields of
`Q̄_ℓ` finite over `ℚ_ℓ` form a countable set; each is closed; and each is generated over `ℚ_ℓ` by
an element algebraic over `ℚ`. -/
theorem _root_.TauCeti.countable_coefficientFields (ℓ : ℕ) [Fact ℓ.Prime] :
    {E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ) | FiniteDimensional ℚ_[ℓ] E}.Countable ∧
      (∀ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E →
        IsClosed (E : Set (PadicAlgCl ℓ))) ∧
      ∀ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), FiniteDimensional ℚ_[ℓ] E →
        ∃ β : PadicAlgCl ℓ, IsAlgebraic ℚ β ∧ E = IntermediateField.adjoin ℚ_[ℓ] {β} := by
  sorry

/-! ### Compact subgroups stabilise lattices
(ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices) -/

open ValuativeRel in
/-- ArithmeticGaloisRepresentations:R01.1/compact-subgroups-stabilise-lattices.
(b) A subgroup of `GL_n(E)` stabilises an `O_E`-lattice iff its closure is compact; (c) a
continuous representation of a compact group over `E` has an integral model.
(Part (a), compactness of lattices and of `GL(Λ)`, is not restated.) -/
theorem exists_stable_lattice {E : Type uA} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ) :
    (∀ K : Subgroup (Matrix.GeneralLinearGroup (Fin n) E),
      IsCompact (closure (K : Set (Matrix.GeneralLinearGroup (Fin n) E))) ↔
        ∃ L : Submodule 𝒪[E] (Fin n → E), L.FG ∧ Submodule.span E (L : Set (Fin n → E)) = ⊤ ∧
          ∀ k ∈ K, ∀ x ∈ L, (k : Matrix (Fin n) (Fin n) E).mulVec x ∈ L) ∧
      ∀ {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [CompactSpace Γ]
        (ρ : ContinuousRep Γ E (Fin n → E)), Nonempty (GaloisLattice.IntegralModel 𝒪[E] ρ) := by
  sorry

end ContinuousRep

namespace GaloisLattice

namespace IntegralModel

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

/-! ### Integral models: Γ-stable lattices (ArithmeticGaloisRepresentations:R01.1/integral-model) -/

-- `TauCeti.GaloisLattice.IntegralModel` (the structure) is declared in the preamble.

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {O : Type uA} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type uA} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type uM} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [hVtop : IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}

instance (Λ : IntegralModel O ρ) : Module.Finite O Λ.lattice :=
  Module.Finite.iff_fg.mpr Λ.fg

instance (Λ : IntegralModel O ρ) : Module.Free O Λ.lattice := by
  sorry

/-- The lattice `(Λ, ρ|_Λ)` as a continuous representation over `O` (subspace topology). -/
def toContinuousRep (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] :
    ContinuousRep Γ O Λ.lattice :=
  sorry

theorem toContinuousRep_apply (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] (g : Γ)
    (x : Λ.lattice) :
    ((Λ.toContinuousRep g x : Λ.lattice) : V) = ρ g x := by
  sorry

/-- The generic fibre: `E ⊗_O Λ ≅ V` as continuous representations. -/
def genericFibreEquiv [IsTopologicalRing O] [IsTopologicalRing E] [ContinuousSMul O E]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] [TopologicalSpace (E ⊗[O] Λ.lattice)]
    [IsModuleTopology E (E ⊗[O] Λ.lattice)] :
    ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ :=
  sorry

/-- Homothety: `c Λ` for `c ∈ E^×`. -/
def smul (c : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel O ρ where
  lattice := Λ.lattice.map (((c : E) • LinearMap.id : V →ₗ[E] V).restrictScalars O)
  stable := sorry
  fg := sorry
  span_eq_top := sorry

theorem smul_smul (c d : Eˣ) (Λ : IntegralModel O ρ) : IntegralModel.smul (c * d) Λ = IntegralModel.smul c (IntegralModel.smul d Λ) := by
  sorry

/-- Integral models ordered by inclusion form a lattice: `Λ ⊔ Λ' = Λ + Λ'`,
`Λ ⊓ Λ' = Λ ∩ Λ'` (see `sup_lattice`, `inf_lattice`). -/
instance instLattice : Lattice (IntegralModel O ρ) :=
  sorry

theorem sup_lattice (Λ Λ' : IntegralModel O ρ) : (Λ ⊔ Λ').lattice = Λ.lattice ⊔ Λ'.lattice := by
  sorry

theorem inf_lattice (Λ Λ' : IntegralModel O ρ) : (Λ ⊓ Λ').lattice = Λ.lattice ⊓ Λ'.lattice := by
  sorry

/-- Existence of integral models (R01.1/compact-subgroups-stabilise-lattices), for `Γ`
compact and `O` the compact open valuation ring of the local field `E`. -/
theorem «exists» [CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]
    (hO : Topology.IsOpenEmbedding (algebraMap O E)) : Nonempty (IntegralModel O ρ) := by
  sorry

/-- Saturation `W ∩ Λ`, an `O`-lattice in a `Γ`-stable subspace `W`. This definition gives only
the `O`-submodule `W ∩ Λ` of `W`; that it is an integral model of the subrepresentation `W`, and
the quotient lattice `Λ/(W ∩ Λ)` as an integral model of `V/W`, are part of the node and are not
constructed here. -/
def saturation (Λ : IntegralModel O ρ) (W : Submodule E V) : Submodule O W :=
  Λ.lattice.comap (W.subtype.restrictScalars O)

/-- The dual lattice `Λ^∨ = {λ ∈ V^∨ : λ(Λ) ⊂ O}`, an integral model of `V^∨`. -/
def dual [IsTopologicalGroup Γ] [IsTopologicalRing E] [TopologicalSpace (Module.Dual E V)]
    [IsModuleTopology E (Module.Dual E V)] (Λ : IntegralModel O ρ) : IntegralModel O ρ.dual :=
  sorry

theorem mem_dual [IsTopologicalGroup Γ] [IsTopologicalRing E] [TopologicalSpace (Module.Dual E V)]
    [IsModuleTopology E (Module.Dual E V)] (Λ : IntegralModel O ρ) (f : Module.Dual E V) :
    f ∈ Λ.dual.lattice ↔ ∀ x ∈ Λ.lattice, f x ∈ Set.range (algebraMap O E) := by
  sorry

/-- Any two lattices are commensurable: `ϖ^a Λ ⊂ Λ' ⊂ ϖ^{-a} Λ` for some `a`. -/
theorem exists_pow_le (Λ Λ' : IntegralModel O ρ) :
    ∃ a : ℕ, (IsLocalRing.maximalIdeal O ^ a) • Λ.lattice ≤ Λ'.lattice ∧
      (IsLocalRing.maximalIdeal O ^ a) • Λ'.lattice ≤ Λ.lattice := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.IntegralModel.rank_one_unique. -/
example (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime]
    (ψ : Field.absoluteGaloisGroup F →ₜ* ℚ_[ℓ]ˣ)
    (hψ : ∀ g, (ψ g : ℚ_[ℓ]) =
      ((ContinuousRep.TateTwist.cyclotomicChar F ℓ g : ℤ_[ℓ]) : ℚ_[ℓ]))
    (Λ : IntegralModel ℤ_[ℓ] (ContinuousRep.ofCharacter ψ)) :
    ∃! k : ℤ, Λ.lattice = Submodule.span ℤ_[ℓ] {(ℓ : ℚ_[ℓ]) ^ k} := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.IntegralModel.zero. -/
example [Subsingleton V] (Λ : IntegralModel O ρ) : Λ.lattice = ⊥ := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.IntegralModel.not_unique. -/
example (ℓ : ℕ) [Fact ℓ.Prime]
    (ρ : ContinuousRep (Multiplicative ℤ_[ℓ]) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) = !![1, ((Multiplicative.toAdd a : ℤ_[ℓ]) : ℚ_[ℓ]); 0, 1])
    (Λ₁ Λ₂ : IntegralModel ℤ_[ℓ] ρ)
    (h₁ : Λ₁.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 1})
    (h₂ : Λ₂.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 (ℓ : ℚ_[ℓ])}) :
    ∀ c : ℚ_[ℓ]ˣ, (IntegralModel.smul c Λ₁).lattice ≠ Λ₂.lattice := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.IntegralModel.generic_fibre. -/
example [IsTopologicalRing O] [IsTopologicalRing E] [ContinuousSMul O E]
    (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice] [TopologicalSpace (E ⊗[O] Λ.lattice)]
    [IsModuleTopology E (E ⊗[O] Λ.lattice)] :
    Nonempty (ContinuousRep.Iso (Λ.toContinuousRep.baseChange E) ρ) :=
  ⟨Λ.genericFibreEquiv⟩

/-- Unit test: TauCeti.GaloisLattice.IntegralModel.not_lattice_E.
(For `E` a local field with valuation ring `O`, compact and open in `E`.) -/
example [CompactSpace Γ] [CompactSpace O] [IsTopologicalRing E]
    (hO : Topology.IsOpenEmbedding (algebraMap O E))
    (L : Submodule O V) (hL : ∀ (g : Γ) (x : V), x ∈ L → ρ g x ∈ L) :
    ((∃ Λ : IntegralModel O ρ, Λ.lattice = L) ↔
        IsCompact (L : Set V) ∧ IsOpen (L : Set V) ∧ Submodule.span E (L : Set V) = ⊤) ∧
      ([Nontrivial V] → ¬ ∃ Λ : IntegralModel O ρ, Λ.lattice = ⊤) := by
  sorry

end IntegralModel

end GaloisLattice

namespace ContinuousRep

attribute [local instance] Bundled.isAddCommGroup Bundled.isModule Bundled.isFinite
  Bundled.isProjective Bundled.isTopologicalSpace Bundled.isModuleTopology

section FieldCoefficients

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {K : Type uA} [Field K] [TopologicalSpace K]
  {V : Type uM} [AddCommGroup V] [Module K V] [FiniteDimensional K V]
  [TopologicalSpace V] [hVtop : IsModuleTopology K V]

/-! ### Semisimplification over a field (ArithmeticGaloisRepresentations:R01.1/semisimplification) -/

-- `TauCeti.ContinuousRep.semisimplification` is declared in the preamble.

/-- A `Γ`-stable subspace `W`, with the subspace topology, is a continuous representation. -/
def subrep [IsTopologicalRing K] (ρ : ContinuousRep Γ K V) (W : Submodule K V)
    [IsModuleTopology K W] (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) : ContinuousRep Γ K W :=
  ⟨{ toFun g := (ρ g).restrict (hW g)
     map_one' := sorry
     map_mul' := sorry }, by have _ := hVtop; sorry⟩

/-- The quotient `V/W` by a `Γ`-stable subspace, with the quotient topology. -/
def quotientRep [IsTopologicalRing K] (ρ : ContinuousRep Γ K V) (W : Submodule K V)
    (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) : ContinuousRep Γ K (V ⧸ W) :=
  ⟨ρ.toRepresentation.quotient W hW, by have _ := hVtop; sorry⟩

/-- The composition factors with multiplicities (each well defined up to isomorphism). -/
def compositionFactors (ρ : ContinuousRep Γ K V) : Multiset (Bundled.{uΓ, uA, uM} Γ K) :=
  sorry

theorem compositionFactors_ss (ρ : ContinuousRep Γ K V) :
    Multiset.Rel (fun X Y : Bundled.{uΓ, uA, uM} Γ K => Nonempty (Iso X.rep Y.rep))
      ρ.semisimplification.rep.compositionFactors ρ.compositionFactors := by
  sorry

/-- `V^ss ≅ V` iff `V` is semisimple. -/
theorem ss_iso_self_iff (ρ : ContinuousRep Γ K V) :
    Nonempty (Iso ρ.semisimplification.rep ρ) ↔
      Representation.IsSemisimpleRepresentation ρ.toRepresentation := by
  sorry

/-- `V^ss ≅ W^ss ⊕ (V/W)^ss` for a `Γ`-stable subspace `W`. -/
theorem ss_exact [IsTopologicalRing K] (ρ : ContinuousRep Γ K V) (W : Submodule K V)
    [IsModuleTopology K W] (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) :
    Nonempty (Iso ρ.semisimplification.rep
      ((ρ.subrep W hW).semisimplification.rep.directSum
        (ρ.quotientRep W hW).semisimplification.rep)) := by
  sorry

/-- The semisimplification has the same characteristic polynomials (and determinant). -/
theorem charpoly_ss (ρ : ContinuousRep Γ K V) (g : Γ) :
    ρ.semisimplification.rep.charpoly g = ρ.charpoly g := by
  sorry

theorem det_ss (ρ : ContinuousRep Γ K V) : ρ.semisimplification.rep.det = ρ.det := by
  sorry

/-- `(V ⊗ K')^ss ≅ (V^ss ⊗ K')^ss`. -/
theorem ss_baseChange [IsTopologicalRing K] (ρ : ContinuousRep Γ K V)
    (K' : Type uA) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)]
    [TopologicalSpace (K' ⊗[K] ρ.semisimplification.carrier)]
    [IsModuleTopology K' (K' ⊗[K] ρ.semisimplification.carrier)] :
    Nonempty (Iso (ρ.baseChange K').semisimplification.rep
      (ρ.semisimplification.rep.baseChange K').semisimplification.rep) := by
  sorry

/-- Over a perfect field, `V^ss ⊗ K'` is already semisimple. -/
theorem isSemisimple_ss_baseChange [IsTopologicalRing K] [PerfectField K]
    (ρ : ContinuousRep Γ K V)
    (K' : Type uA) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] ρ.semisimplification.carrier)]
    [IsModuleTopology K' (K' ⊗[K] ρ.semisimplification.carrier)] :
    Representation.IsSemisimpleRepresentation (ρ.semisimplification.rep.baseChange K').toRepresentation := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ss_unipotent. -/
example (p : ℕ) [Fact p.Prime]
    (ρ : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) (Fin 2 → ZMod p))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) = !![1, PadicInt.toZMod (Multiplicative.toAdd a); 0, 1]) :
    Nonempty (Iso ρ.semisimplification.rep
        (ContinuousRep.trivial : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) (Fin 2 → ZMod p))) ∧
      IsEmpty (Iso ρ
        (ContinuousRep.trivial : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) (Fin 2 → ZMod p))) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ss_irreducible. -/
example (ρ : ContinuousRep Γ K V) :
    (Representation.IsIrreducible ρ.toRepresentation →
        Nonempty (Iso ρ.semisimplification.rep ρ)) ∧
      (Subsingleton V → Subsingleton ρ.semisimplification.carrier) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ss_not_socle_sum.
For the `3`-dimensional unipotent Jordan block of `ℤ_p` over `F_p` (`p ≥ 3`), with socle
`W = V^Γ`, the sum `soc(V) ⊕ V/soc(V)` is not semisimple. -/
example (p : ℕ) [Fact p.Prime] (hp : 3 ≤ p)
    (ρ : ContinuousRep (Multiplicative ℤ_[p]) (ZMod p) (Fin 3 → ZMod p))
    (hρ : LinearMap.toMatrix' (ρ (Multiplicative.ofAdd 1)) = !![1, 1, 0; 0, 1, 1; 0, 0, 1])
    (W : Submodule (ZMod p) (Fin 3 → ZMod p)) [IsModuleTopology (ZMod p) W]
    (hW₁ : W = ρ.toRepresentation.invariants)
    (hW : ∀ g, W ≤ W.comap (ρ g)) :
    ¬ Representation.IsSemisimpleRepresentation ((ρ.subrep W hW).directSum (ρ.quotientRep W hW)).toRepresentation := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.charpoly_ss. -/
example (ρ : ContinuousRep Γ K V) (g : Γ) :
    (ρ.semisimplification.rep g).charpoly = (ρ g).charpoly := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ss_exact. -/
example [IsTopologicalRing K] (ρ : ContinuousRep Γ K V) (W : Submodule K V)
    [IsModuleTopology K W] (hW : ∀ g : Γ, W ≤ W.comap (ρ g)) :
    Nonempty (Iso ρ.semisimplification.rep
      ((ρ.subrep W hW).semisimplification.rep.directSum
        (ρ.quotientRep W hW).semisimplification.rep)) :=
  ss_exact ρ W hW

/-! ### Semisimple representations over a perfect field stay semisimple after extension of scalars
(ArithmeticGaloisRepresentations:R01.1/semisimple-representations-over-perfect-fields) -/

/-- ArithmeticGaloisRepresentations:R01.1/semisimple-representations-over-perfect-fields, in the
carrier of this file: over a perfect field `K`, the base change of a semisimple representation
to any extension field `K'` is semisimple. (The node is algebraic: it holds for representations
of a monoid over `K` and any field extension, with no topology; and it fails for imperfect `K`.) -/
theorem isSemisimple_baseChange_of_perfectField [IsTopologicalRing K] [PerfectField K]
    (ρ : ContinuousRep Γ K V)
    (hρ : Representation.IsSemisimpleRepresentation ρ.toRepresentation)
    (K' : Type uB) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    Representation.IsSemisimpleRepresentation (ρ.baseChange K').toRepresentation := by
  sorry

/-! ### Absolutely irreducible representations
(ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible) -/

-- `TauCeti.ContinuousRep.IsAbsolutelyIrreducible` is declared in the preamble (Burnside's form).
-- Its definition includes `V ≠ 0` (as `Nontrivial V`), so the span criterion below assumes
-- `[Nontrivial V]`.

/-- Burnside: for `V ≠ 0`, absolute irreducibility is `span_K ρ(Γ) = End_K(V)`. -/
theorem isAbsolutelyIrreducible_iff_span [Nontrivial V] (ρ : ContinuousRep Γ K V) :
    ρ.IsAbsolutelyIrreducible ↔ Submodule.span K (Set.range fun g : Γ => ρ g) = ⊤ := by
  sorry

/-- For `V ≠ 0`: absolutely irreducible iff the algebraic base change `K̄ ⊗_K V` of the underlying
representation is irreducible. No topology on the algebraic closure is used (it has none in
general), so the base change is `baseChangeRepresentation`, not `baseChange`. -/
theorem isAbsolutelyIrreducible_iff_algebraicClosure [Nontrivial V] (ρ : ContinuousRep Γ K V) :
    ρ.IsAbsolutelyIrreducible ↔
      Representation.IsIrreducible
        (baseChangeRepresentation (AlgebraicClosure K) ρ.toRepresentation) := by
  sorry

/-- Invariance under field extension `K ⊂ K'`, in the form available for `ContinuousRep`
(topological fields with continuous inclusion); the statement is algebraic and holds for every
field extension. -/
theorem isAbsolutelyIrreducible_baseChange_iff [IsTopologicalRing K] (ρ : ContinuousRep Γ K V)
    (K' : Type uB) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)] :
    (ρ.baseChange K').IsAbsolutelyIrreducible ↔ ρ.IsAbsolutelyIrreducible := by
  sorry

namespace IsAbsolutelyIrreducible

/-- Absolutely irreducible (and nonzero) implies irreducible. -/
theorem isIrreducible [Nontrivial V] {ρ : ContinuousRep Γ K V}
    (h : ρ.IsAbsolutelyIrreducible) : Representation.IsIrreducible ρ.toRepresentation := by
  sorry

/-- Schur: the `Γ`-endomorphisms of an absolutely irreducible representation are scalars. -/
theorem end_eq_scalars {ρ : ContinuousRep Γ K V}
    (h : ρ.IsAbsolutelyIrreducible) (f : ρ.Hom ρ) : ∃ c : K, f.toLinearMap = c • LinearMap.id := by
  sorry

end IsAbsolutelyIrreducible

theorem isAbsolutelyIrreducible_of_finrank_one (ρ : ContinuousRep Γ K V)
    (h : Module.finrank K V = 1) : ρ.IsAbsolutelyIrreducible := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.absIrr_rank_one. -/
example (ρ : ContinuousRep Γ K V) (h : Module.finrank K V = 1) : ρ.IsAbsolutelyIrreducible :=
  isAbsolutelyIrreducible_of_finrank_one ρ h

/-- Unit test: TauCeti.ContinuousRep.not_absIrr_zero.
The zero representation is neither absolutely irreducible nor irreducible. -/
example [Subsingleton V] (ρ : ContinuousRep Γ K V) :
    ¬ ρ.IsAbsolutelyIrreducible ∧ ¬ Representation.IsIrreducible ρ.toRepresentation := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.rotation_not_absIrr.
The rotation representation of a cyclic group of order `4` on `ℚ²` (generator acting by
`!![0, -1; 1, 0]`) is irreducible but not absolutely irreducible. (The `F_{p²}^×` example is not
restated.) -/
example {Γ : Type} [Group Γ] [TopologicalSpace Γ] (γ : Γ) (hγ : ∀ x : Γ, ∃ n : ℕ, x = γ ^ n)
    (ρ : ContinuousRep Γ ℚ (Fin 2 → ℚ)) (hρ : LinearMap.toMatrix' (ρ γ) = !![0, -1; 1, 0]) :
    Representation.IsIrreducible ρ.toRepresentation ∧ ¬ ρ.IsAbsolutelyIrreducible := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.absIrr_baseChange_iff. -/
example [IsTopologicalRing K] [Finite K] (ρ : ContinuousRep Γ K V)
    (K' : Type uB) [Field K'] [Finite K'] [TopologicalSpace K'] [IsTopologicalRing K']
    [Algebra K K'] [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)]
    [IsModuleTopology K' (K' ⊗[K] V)] :
    (ρ.baseChange K').IsAbsolutelyIrreducible ↔ ρ.IsAbsolutelyIrreducible :=
  isAbsolutelyIrreducible_baseChange_iff ρ K'

/-- Unit test: TauCeti.ContinuousRep.absIrr_iff_span. -/
example [Nontrivial V] (ρ : ContinuousRep Γ K V) :
    ρ.IsAbsolutelyIrreducible ↔ Submodule.span K (Set.range fun g : Γ => ρ g) = ⊤ :=
  isAbsolutelyIrreducible_iff_span ρ

/-! ### Brauer–Nesbitt over an algebraically closed field
(ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed) -/

/-- ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-algebraically-closed, part (i): for
semisimple finite-dimensional representations over an algebraically closed field with equal
traces, the multiplicities of every irreducible representation `τ` agree modulo the
characteristic (they are equal in characteristic `0`). The multiplicity of `τ` in a semisimple
`ρ` is written as the dimension of the space of intertwining maps `τ → ρ`, and the congruence as
an equality in `k`. (The node allows a monoid; Tau Ceti's `jordanHolderMultiplicity` is the
multiplicity meant.) -/
theorem _root_.TauCeti.finrank_intertwiningMap_eq_of_trace_eq {k : Type*} [Field k]
    [IsAlgClosed k] {G : Type*} [Group G]
    {X : Type*} [AddCommGroup X] [Module k X] [FiniteDimensional k X]
    {Y : Type*} [AddCommGroup Y] [Module k Y] [FiniteDimensional k Y]
    {T : Type*} [AddCommGroup T] [Module k T] [FiniteDimensional k T]
    (ρ : Representation k G X) (σ : Representation k G Y)
    (hρ : Representation.IsSemisimpleRepresentation ρ)
    (hσ : Representation.IsSemisimpleRepresentation σ)
    (h : ∀ g : G, LinearMap.trace k X (ρ g) = LinearMap.trace k Y (σ g))
    (τ : Representation k G T) (hτ : Representation.IsIrreducible τ) :
    ((Module.finrank k (τ.IntertwiningMap ρ) : ℕ) : k) =
      ((Module.finrank k (τ.IntertwiningMap σ) : ℕ) : k) := by
  sorry

/-- Part (ii): semisimple finite-dimensional representations over an algebraically closed field
with the same characteristic polynomials at every group element are isomorphic. -/
theorem _root_.TauCeti.brauerNesbitt_of_isAlgClosed {k : Type*} [Field k] [IsAlgClosed k]
    {G : Type*} [Group G]
    {X : Type*} [AddCommGroup X] [Module k X] [FiniteDimensional k X]
    {Y : Type*} [AddCommGroup Y] [Module k Y] [FiniteDimensional k Y]
    (ρ : Representation k G X) (σ : Representation k G Y)
    (hρ : Representation.IsSemisimpleRepresentation ρ)
    (hσ : Representation.IsSemisimpleRepresentation σ)
    (h : ∀ g : G, (ρ g).charpoly = (σ g).charpoly) :
    ∃ e : X ≃ₗ[k] Y, ∀ (g : G) (x : X), e (ρ g x) = σ g (e x) := by
  sorry

/-! ### Semisimplifications are detected after extension of scalars
(ArithmeticGaloisRepresentations:R01.1/semisimplification-detected-after-field-extension) -/

/-- ArithmeticGaloisRepresentations:R01.1/semisimplification-detected-after-field-extension, in
the carrier of this file: if the semisimplifications of the base changes to an extension field
`K'` are isomorphic, so are the semisimplifications over `K`. No hypothesis on `K` (perfect or
not). (The node is algebraic: representations of a monoid, any field extension, no topology.) -/
theorem ss_iso_of_ss_baseChange_iso [IsTopologicalRing K]
    {W : Type uM} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    [TopologicalSpace W] [IsModuleTopology K W] (ρ : ContinuousRep Γ K V)
    (σ : ContinuousRep Γ K W)
    (K' : Type uA) [Field K'] [TopologicalSpace K'] [IsTopologicalRing K'] [Algebra K K']
    [ContinuousSMul K K'] [TopologicalSpace (K' ⊗[K] V)] [IsModuleTopology K' (K' ⊗[K] V)]
    [TopologicalSpace (K' ⊗[K] W)] [IsModuleTopology K' (K' ⊗[K] W)]
    (h : Nonempty (Iso (ρ.baseChange K').semisimplification.rep
      (σ.baseChange K').semisimplification.rep)) :
    Nonempty (Iso ρ.semisimplification.rep σ.semisimplification.rep) := by
  sorry

/-! ### The Brauer–Nesbitt theorem (ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt) -/

/-- ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt. (a) Representations with equal
characteristic polynomials at every group element have isomorphic semisimplifications; (c) the
isomorphism is one of continuous representations (`Iso`). The node is stated for an arbitrary
group and field without topology; the trace version is `brauer_nesbitt_traces`. -/
theorem brauer_nesbitt {W : Type uM} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    [TopologicalSpace W] [IsModuleTopology K W] (ρ : ContinuousRep Γ K V)
    (σ : ContinuousRep Γ K W) (h : ∀ g : Γ, ρ.charpoly g = σ.charpoly g) :
    Nonempty (Iso ρ.semisimplification.rep σ.semisimplification.rep) := by
  sorry

/-! ### Brauer–Nesbitt with traces when (dim V)! is invertible
(ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces) -/

/-- ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt-traces. If `char K = 0` or
`char K > dim V = dim W`, representations with equal traces at every group element have
isomorphic semisimplifications. For `0 < char K ≤ dim V` this can fail (`1^{⊕p}` and `χ^{⊕p}` for
a nontrivial character `χ`), though not in every case (`K = F_2`, dimension `2`). -/
theorem brauer_nesbitt_traces {W : Type uM} [AddCommGroup W] [Module K W] [FiniteDimensional K W]
    [TopologicalSpace W] [IsModuleTopology K W] (ρ : ContinuousRep Γ K V)
    (σ : ContinuousRep Γ K W)
    (hchar : ringChar K = 0 ∨ Module.finrank K V < ringChar K)
    (hdim : Module.finrank K V = Module.finrank K W)
    (h : ∀ g : Γ, LinearMap.trace K V (ρ g) = LinearMap.trace K W (σ g)) :
    Nonempty (Iso ρ.semisimplification.rep σ.semisimplification.rep) := by
  sorry

/-! ### The residue field of Q̄_ℓ
(ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell) -/

/-- ArithmeticGaloisRepresentations:R01.1/residue-field-of-the-algebraic-closure-of-q-ell,
part (a): the residue field of the valuation ring of `Q̄_ℓ = PadicAlgCl ℓ` is algebraically
closed, of characteristic `ℓ`, and algebraic over its prime field (every element lies in a finite
subfield). Parts (b) (roots of unity of order prime to `ℓ` reduce bijectively) and (c) (residue
fields of coefficient fields exhaust it) are not restated. -/
theorem _root_.TauCeti.residueField_padicAlgCl (ℓ : ℕ) [Fact ℓ.Prime] :
    IsAlgClosed (IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring)) ∧
      ringChar (IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring)) = ℓ ∧
      ∀ x : IsLocalRing.ResidueField ((PadicAlgCl.valued ℓ).v.valuationSubring),
        ∃ n : ℕ, 0 < n ∧ x ^ (ℓ ^ n) = x := by
  sorry

end FieldCoefficients

end ContinuousRep

/-! ### Reduction of an integral model and the residual semisimplification
(ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification) -/

namespace ContinuousRep

/-- Reduction `M ⊗_A k_A` of a representation over a topological local ring whose maximal ideal
is open (so the residue field `k_A` is discrete). -/
def reduceLocal {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
    {A : Type uA} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsLocalRing A]
    {M : Type uM} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (hm : IsOpen (IsLocalRing.maximalIdeal A : Set A))
    [TopologicalSpace (IsLocalRing.ResidueField A)] [DiscreteTopology (IsLocalRing.ResidueField A)]
    [TopologicalSpace (IsLocalRing.ResidueField A ⊗[A] M)]
    [IsModuleTopology (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] M)]
    (ρ : ContinuousRep Γ A M) :
    ContinuousRep Γ (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] M) :=
  ⟨baseChangeRepresentation (IsLocalRing.ResidueField A) ρ.toRepresentation, sorry⟩

end ContinuousRep

namespace GaloisLattice

namespace IntegralModel

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {O : Type uA} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type uA} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type uM} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [hVtop : IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}
  [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]
  [ContinuousSMul O (IsLocalRing.ResidueField O)]

-- The topologies of `O` and `E` are parameters of this section. Two hypotheses tie them to the
-- valuation: `ContinuousSMul O k` with `k` discrete says that `O → k` is continuous, i.e. that
-- the maximal ideal is open; and `IsModuleTopology O Λ.lattice` says that the topology induced on
-- `Λ` by `V` is its `O`-module topology. Both hold for the valuation ring of a local field `E`
-- (if they hold for one lattice of `V`, the second holds for every lattice of `V`); without them
-- the action on `Λ/ϖΛ` need not be continuous.

/-- The reduction `ρ̄_Λ := Λ/ϖΛ = k_E ⊗_{O_E} Λ`, a continuous representation over the residue
field (discrete). -/
def reduction (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)] :
    ContinuousRep Γ (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice) :=
  ⟨ContinuousRep.baseChangeRepresentation (IsLocalRing.ResidueField O)
    { toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
      map_one' := sorry
      map_mul' := sorry }, by have _ := hVtop; sorry⟩

/-- The residual semisimplification `ρ̄_Λ^ss` attached to `Λ`. (Over `Q̄_ℓ` the residual
representation `(ρ̄_Λ ⊗ F̄_ℓ)^ss` is obtained after descent to a coefficient field; it is not
restated here.) -/
def residualSS (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)] :
    ContinuousRep.Bundled.{uΓ, uA, max uA uM} Γ (IsLocalRing.ResidueField O) :=
  Λ.reduction.semisimplification

variable (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
  [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
  [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]

/-- `charpoly ρ̄_Λ(g)` is the reduction of `charpoly ρ(g) ∈ (Polynomial O)`. -/
theorem charpoly_reduction (g : Γ) :
    Λ.reduction.charpoly g =
      (Λ.toContinuousRep.charpoly g).map (IsLocalRing.residue O) := by
  sorry

/- TauCeti.GaloisLattice.IntegralModel.reduction_baseChange: for coefficient fields
`E ⊂ E'` and the integral model `Λ ⊗ O_{E'}` of `V ⊗ E'`, its reduction is
`ρ̄_Λ ⊗_{k_E} k_{E'}`. (Comment only: stating it needs the residue-field extension
`k_E → k_{E'}` and the lattice `Λ ⊗ O_{E'}` inside `E' ⊗_E V`.) -/

/- TauCeti.GaloisLattice.IntegralModel.reduction_tensor: reduction commutes with `⊗`, duals
(`Λ^∨/ϖΛ^∨ ≅ (Λ/ϖΛ)^∨`), twists, restriction and `⊕`. (Comment only: each needs the
corresponding integral model of the construction, which is not built here.) -/

/-- The reduction has open kernel and finite image (finite residue field). -/
theorem finite_image_reduction [Finite (IsLocalRing.ResidueField O)] :
    IsOpen {g : Γ | Λ.reduction g = LinearMap.id} ∧
      (Set.range fun g : Γ => Λ.reduction g).Finite := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.charpoly_reduction. -/
example (g : Γ) :
    Λ.reduction.charpoly g = (Λ.toContinuousRep.charpoly g).map (IsLocalRing.residue O) :=
  charpoly_reduction Λ g

/-- Unit test: TauCeti.GaloisLattice.det_reduction. -/
example : Λ.reduction.det =
    (Units.map (IsLocalRing.residue O).toMonoidHom).comp Λ.toContinuousRep.det := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.reduction_zero. -/
example : (Subsingleton V → Subsingleton (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)) ∧
    ((∀ g : Γ, ρ g = LinearMap.id) → ∀ g : Γ, Λ.reduction g = LinearMap.id) := by
  sorry

end IntegralModel

/-- Unit test: TauCeti.GaloisLattice.reduction_cyclotomic.
The reduction of `ℤ_ℓ(1)` (any integral model of `ℚ_ℓ(1)`) is the mod `ℓ` cyclotomic
character. -/
example (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ])]
    [DiscreteTopology (IsLocalRing.ResidueField ℤ_[ℓ])]
    [ContinuousSMul ℤ_[ℓ] (IsLocalRing.ResidueField ℤ_[ℓ])]
    (ψ : Field.absoluteGaloisGroup F →ₜ* ℚ_[ℓ]ˣ)
    (hψ : ∀ g, (ψ g : ℚ_[ℓ]) =
      ((ContinuousRep.TateTwist.cyclotomicChar F ℓ g : ℤ_[ℓ]) : ℚ_[ℓ]))
    (Λ : IntegralModel ℤ_[ℓ] (ContinuousRep.ofCharacter ψ)) [IsModuleTopology ℤ_[ℓ] Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField ℤ_[ℓ])
      (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ.lattice)]
    (g : Field.absoluteGaloisGroup F) (x : IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ.lattice) :
    Λ.reduction g x =
      IsLocalRing.residue ℤ_[ℓ] (ContinuousRep.TateTwist.cyclotomicChar F ℓ g : ℤ_[ℓ]) • x := by
  sorry

/-- Unit test: TauCeti.GaloisLattice.reduction_depends_on_lattice. -/
example (ℓ : ℕ) [Fact ℓ.Prime] [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ])]
    [DiscreteTopology (IsLocalRing.ResidueField ℤ_[ℓ])]
    [ContinuousSMul ℤ_[ℓ] (IsLocalRing.ResidueField ℤ_[ℓ])]
    (ρ : ContinuousRep (Multiplicative ℤ_[ℓ]) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (hρ : ∀ a, LinearMap.toMatrix' (ρ a) = !![1, ((Multiplicative.toAdd a : ℤ_[ℓ]) : ℚ_[ℓ]); 0, 1])
    (Λ₁ Λ₂ : IntegralModel ℤ_[ℓ] ρ)
    (h₁ : Λ₁.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 1})
    (h₂ : Λ₂.lattice = Submodule.span ℤ_[ℓ] {Pi.single 0 1, Pi.single 1 (ℓ : ℚ_[ℓ])})
    [IsModuleTopology ℤ_[ℓ] Λ₁.lattice] [IsModuleTopology ℤ_[ℓ] Λ₂.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₁.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField ℤ_[ℓ])
      (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₁.lattice)]
    [TopologicalSpace (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₂.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField ℤ_[ℓ])
      (IsLocalRing.ResidueField ℤ_[ℓ] ⊗[ℤ_[ℓ]] Λ₂.lattice)] :
    IsEmpty (ContinuousRep.Iso Λ₁.reduction Λ₂.reduction) := by
  sorry

/-! ### Lattice independence of the residual semisimplification
(ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence) -/

namespace IntegralModel

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {O : Type uA} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type uA} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type uM} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [hVtop : IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}
  [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]
  [ContinuousSMul O (IsLocalRing.ResidueField O)]

/-- ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence.
For any two integral models `Λ, Λ'` (which exist for compact `Γ`, `IntegralModel.exists`),
`(Λ/ϖΛ)^ss ≅ (Λ'/ϖΛ')^ss`; the reductions themselves may differ. (Parts (c), (d) — independence
of the coefficient field over `Q̄_ℓ` — are not restated.) -/
theorem residualSS_iso (Λ Λ' : IntegralModel O ρ)
    [IsModuleTopology O Λ.lattice] [IsModuleTopology O Λ'.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ'.lattice)] :
    Nonempty (ContinuousRep.Iso Λ.residualSS.rep Λ'.residualSS.rep) := by
  sorry

end IntegralModel

end GaloisLattice

/-! ### Twisting coefficients by field automorphisms; the residual coefficient Frobenius
(ArithmeticGaloisRepresentations:R01.1/coefficient-frobenius-twist) -/

namespace ContinuousRep

section CoeffTwist

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A]

/-- The coefficient twist `ρ^σ` of a framed representation by a continuous ring automorphism
`σ` of `A`: `ρ^σ(g) = σ(ρ(g))` entrywise (the framed form of `baseChange` along `σ`). -/
def coeffTwist (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A :=
  Framed.map (σ : A →+* A) hσ ρ

theorem coeffTwist_apply (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A) = (ρ g : Matrix (Fin n) (Fin n) A).map σ := by
  sorry

theorem coeffTwist_comp (σ τ : A ≃+* A) (hσ : Continuous σ) (hτ : Continuous τ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    coeffTwist σ hσ (coeffTwist τ hτ ρ) = coeffTwist (τ.trans σ) (hσ.comp hτ) ρ := by
  sorry

theorem coeffTwist_id {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    coeffTwist (RingEquiv.refl A) continuous_id ρ = ρ := by
  sorry

/-- Characteristic polynomials and determinants transform by `σ`. -/
theorem charpoly_coeffTwist (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).charpoly =
        (ρ g : Matrix (Fin n) (Fin n) A).charpoly.map (σ : A →+* A) ∧
      (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).det =
        σ (ρ g : Matrix (Fin n) (Fin n) A).det := by
  sorry

/-- The residual coefficient Frobenius twist `ρ̄^{(p)} := ρ̄^{Frob_p}` over a perfect field of
characteristic `p` with the discrete topology (`frobeniusEquiv`). -/
def frobTwist (p : ℕ) [Fact p.Prime] {k : Type uA} [Field k] [CharP k p] [PerfectRing k p]
    [TopologicalSpace k] [DiscreteTopology k] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k) : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k :=
  coeffTwist (frobeniusEquiv k p) continuous_of_discreteTopology ρ

/- TauCeti.ContinuousRep.residual_coeffTwist: for `γ ∈ G_{ℚ_ℓ}` acting on `Q̄_ℓ` and `V` over
`Q̄_ℓ`, `residual (V^γ) ≅ (residual V)^{γ̄}` with `γ̄ ∈ Gal(F̄_ℓ/F_ℓ)` the image of `γ`;
`residual_coeffTwist_of_mem_inertia`, `residual_coeffTwist_frobeniusLift`. (Comment only: the
residual representation over `F̄_ℓ` of a representation over `Q̄_ℓ` is not constructed in this
file.) -/

variable (p : ℕ) [Fact p.Prime] {k : Type uA} [Field k] [CharP k p] [PerfectRing k p]
  [TopologicalSpace k] [DiscreteTopology k]

/-- Unit test: TauCeti.ContinuousRep.frobTwist_order.
For a character `χ̄ : Γ → GL_1(F_{p²})`, the Frobenius twist is `χ̄^p`, which differs from `χ̄`
when `χ̄` has an element of order `p² − 1` in its image. -/
example [TopologicalSpace (GaloisField p 2)] [DiscreteTopology (GaloisField p 2)]
    (χ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) (GaloisField p 2)) :
    (∀ g, frobTwist p χ g = χ g ^ p) ∧
      ((∃ g, orderOf (χ g) = p ^ 2 - 1) → frobTwist p χ ≠ χ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.frobTwist_Fp. -/
example {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (ZMod p))
    (ρ' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    frobTwist p ρ = ρ ∧ coeffTwist (RingEquiv.refl A) continuous_id ρ' = ρ' := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.frobTwist_ne_conj.
Conjugating the argument of a character (here any `χ̄ : Γ → GL_1(F_{p²})` with an element of
order `p² − 1` in its image, e.g. a character of `G_ℚ` through `(ℤ/N)^×`) returns `χ̄`, whereas the
coefficient Frobenius twist does not. -/
example [TopologicalSpace (GaloisField p 2)] [DiscreteTopology (GaloisField p 2)]
    (χ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) (GaloisField p 2))
    (hχ : ∃ g, orderOf (χ g) = p ^ 2 - 1) :
    (∀ φ g : Γ, χ (φ * g * φ⁻¹) = χ g) ∧ frobTwist p χ ≠ χ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.charpoly_coeffTwist. -/
example (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).charpoly =
      (ρ g : Matrix (Fin n) (Fin n) A).charpoly.map (σ : A →+* A) :=
  (charpoly_coeffTwist σ hσ ρ g).1

/- Unit test: TauCeti.ContinuousRep.residual_coeffTwist_inertia: for `γ ∈ I_{ℚ_ℓ}`,
`residual (V^γ) ≅ residual V`; for `γ` an arithmetic Frobenius lift,
`residual (V^γ) ≅ (residual V)^{(ℓ)}`. (Comment only, as for `residual_coeffTwist`.) -/

end CoeffTwist

/-! ### Teichmüller lifts of residual characters
(ArithmeticGaloisRepresentations:R01.1/teichmuller-lift-of-a-residual-character) -/

namespace Teichmuller

-- `Γ` is a topological group: a character with open kernel is then locally constant, which is
-- what makes its Teichmüller lift continuous.
variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {O : Type uA} [CommRing O] [TopologicalSpace O] [IsTopologicalRing O] [IsLocalRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]

/-- The Teichmüller lift `[ψ̄] := teichmuller ∘ ψ̄ : Γ → O^×` of a residual character with open
kernel (continuous for the discrete topology on `k^×`). -/
def lift (ψ : Γ →* (IsLocalRing.ResidueField O)ˣ)
    (hψ : IsOpen (ψ.ker : Set Γ)) : Γ →ₜ* Oˣ :=
  sorry

variable (ψ φ : Γ →* (IsLocalRing.ResidueField O)ˣ) (hψ : IsOpen (ψ.ker : Set Γ))
  (hφ : IsOpen (φ.ker : Set Γ))

/-- `[ψ̄] mod ϖ = ψ̄`. -/
theorem residue_lift (g : Γ) :
    Units.map (IsLocalRing.residue O).toMonoidHom (lift ψ hψ g) = ψ g := by
  sorry

/-- `[ψ̄ φ̄] = [ψ̄][φ̄]`. -/
theorem lift_mul (hψφ : IsOpen ((ψ * φ).ker : Set Γ)) (g : Γ) :
    lift (ψ * φ) hψφ g = lift ψ hψ g * lift φ hφ g := by
  sorry

/-- Uniqueness among lifts with values in `μ_{q−1}(O)`. -/
theorem eq_lift (χ : Γ →ₜ* Oˣ) (h1 : ∀ g, χ g ^ (Nat.card (IsLocalRing.ResidueField O) - 1) = 1)
    (h2 : ∀ g, Units.map (IsLocalRing.residue O).toMonoidHom (χ g) = ψ g) : χ = lift ψ hψ := by
  sorry

/-- Independence of the coefficient field: for a local extension `O → O'`, the lift over `O'`
of `ψ̄` (pushed to `k'^×`) is the image of the lift over `O`. -/
theorem lift_baseChange {O' : Type uB} [CommRing O'] [TopologicalSpace O'] [IsTopologicalRing O']
    [IsLocalRing O'] [IsAdicComplete (IsLocalRing.maximalIdeal O') O']
    [Finite (IsLocalRing.ResidueField O')] [Algebra O O'] [IsLocalHom (algebraMap O O')]
    (hψ' : IsOpen (((Units.map (IsLocalRing.ResidueField.map (algebraMap O O')).toMonoidHom).comp
      ψ).ker : Set Γ)) (g : Γ) :
    Units.map (algebraMap O O').toMonoidHom (lift ψ hψ g) =
      lift ((Units.map (IsLocalRing.ResidueField.map (algebraMap O O')).toMonoidHom).comp ψ)
        hψ' g := by
  sorry

theorem orderOf_lift (g : Γ) : orderOf (lift ψ hψ g) = orderOf (ψ g) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Teichmuller.cyclotomic. -/
example (p : ℕ) [Fact p.Prime] [Finite (IsLocalRing.ResidueField ℤ_[p])]
    (ψ : Field.absoluteGaloisGroup ℚ →* (IsLocalRing.ResidueField ℤ_[p])ˣ)
    (hψχ : ∀ g, ψ g = Units.map (IsLocalRing.residue ℤ_[p]).toMonoidHom
      (TateTwist.cyclotomicChar ℚ p g)) (hψ : IsOpen (ψ.ker : Set (Field.absoluteGaloisGroup ℚ))) :
    (∃ g, orderOf (lift ψ hψ g) = p - 1) ∧ ∀ g,
      Units.map (IsLocalRing.residue ℤ_[p]).toMonoidHom (lift ψ hψ g) =
        Units.map (IsLocalRing.residue ℤ_[p]).toMonoidHom (TateTwist.cyclotomicChar ℚ p g) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Teichmuller.trivial. -/
example (h1 : IsOpen ((1 : Γ →* (IsLocalRing.ResidueField O)ˣ).ker : Set Γ)) (g : Γ) :
    lift (1 : Γ →* (IsLocalRing.ResidueField O)ˣ) h1 g = 1 := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Teichmuller.not_cyclotomic_itself. -/
example (p : ℕ) [Fact p.Prime] [Finite (IsLocalRing.ResidueField ℤ_[p])]
    (ψ : Field.absoluteGaloisGroup ℚ →* (IsLocalRing.ResidueField ℤ_[p])ˣ)
    (hψχ : ∀ g, ψ g = Units.map (IsLocalRing.residue ℤ_[p]).toMonoidHom
      (TateTwist.cyclotomicChar ℚ p g)) (hψ : IsOpen (ψ.ker : Set (Field.absoluteGaloisGroup ℚ))) :
    (∃ g, ¬ IsOfFinOrder (TateTwist.cyclotomicChar ℚ p g)) ∧
      (∀ g, lift ψ hψ g ^ (p - 1) = 1) ∧ TateTwist.cyclotomicChar ℚ p ≠ lift ψ hψ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.Teichmuller.baseChange. -/
example {O' : Type uB} [CommRing O'] [TopologicalSpace O'] [IsTopologicalRing O']
    [IsLocalRing O'] [IsAdicComplete (IsLocalRing.maximalIdeal O') O']
    [Finite (IsLocalRing.ResidueField O')] [Algebra O O'] [IsLocalHom (algebraMap O O')]
    (hψ' : IsOpen (((Units.map (IsLocalRing.ResidueField.map (algebraMap O O')).toMonoidHom).comp
      ψ).ker : Set Γ)) (g : Γ) :
    Units.map (algebraMap O O').toMonoidHom (lift ψ hψ g) =
      lift ((Units.map (IsLocalRing.ResidueField.map (algebraMap O O')).toMonoidHom).comp ψ)
        hψ' g :=
  lift_baseChange ψ hψ hψ' g

/-- Unit test: TauCeti.ContinuousRep.Teichmuller.unique. -/
example (χ : Γ →ₜ* Oˣ) (h1 : ∀ g, χ g ^ (Nat.card (IsLocalRing.ResidueField O) - 1) = 1)
    (h2 : ∀ g, Units.map (IsLocalRing.residue O).toMonoidHom (χ g) = ψ g) : χ = lift ψ hψ :=
  eq_lift ψ hψ χ h1 h2

end Teichmuller

end ContinuousRep

/-! ### Ribet's lemma: a lattice with nonsplit reduction
(ArithmeticGaloisRepresentations:R01.1/ribet-nonsplit-lattice) -/

namespace GaloisLattice

namespace IntegralModel

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ]
  {O : Type uA} [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
  {E : Type uA} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
  {V : Type uM} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [hVtop : IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
  {ρ : ContinuousRep Γ E V}
  [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]
  [ContinuousSMul O (IsLocalRing.ResidueField O)]

/-- ArithmeticGaloisRepresentations:R01.1/ribet-nonsplit-lattice. Let `V` be two-dimensional and
irreducible over `E` (`O` complete), and suppose a reduction has characteristic polynomials
`(X − φ₁(g))(X − φ₂(g))` (so its semisimplification is `φ₁ ⊕ φ₂`). Then some integral model
`L` has reduction containing the line `φ₁` and not semisimple, i.e. a nonsplit extension
`0 → φ₁ → L/ϖL → φ₂ → 0`. -/
theorem exists_nonsplit_reduction [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (h2 : Module.finrank E V = 2) (hirr : Representation.IsIrreducible ρ.toRepresentation)
    (Λ₀ : IntegralModel O ρ) [IsModuleTopology O Λ₀.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ₀.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ₀.lattice)]
    (φ₁ φ₂ : Γ →* (IsLocalRing.ResidueField O)ˣ)
    (hφ : ∀ g, Λ₀.reduction.charpoly g =
      (Polynomial.X - Polynomial.C (φ₁ g : IsLocalRing.ResidueField O)) *
        (Polynomial.X - Polynomial.C (φ₂ g : IsLocalRing.ResidueField O))) :
    ∃ (L : IntegralModel O ρ) (_ : IsModuleTopology O L.lattice)
      (_ : TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] L.lattice))
      (_ : IsModuleTopology (IsLocalRing.ResidueField O)
        (IsLocalRing.ResidueField O ⊗[O] L.lattice)),
      ¬ Representation.IsSemisimpleRepresentation L.reduction.toRepresentation ∧
        ∃ x : IsLocalRing.ResidueField O ⊗[O] L.lattice, x ≠ 0 ∧
          ∀ g, L.reduction g x = (φ₁ g : IsLocalRing.ResidueField O) • x := by
  sorry

/-! ### Self-dual integral models when the residual representation is irreducible
(ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual) -/

/-- ArithmeticGaloisRepresentations:R01.1/self-dual-lattice-for-absolutely-irreducible-residual.
If the reduction of one (hence every) integral model is irreducible: (a) the integral models
form one homothety class `{ϖ^k Λ₀}`; (b) for a perfect symmetric or alternating pairing with
similitude character `µ`, `µ` is `O^×`-valued and some integral model is self-dual for `c ⟨ , ⟩`
with `c ∈ {1, ϖ}`. (Part (c), the symplectic basis and `GSp_{2g}(O)`-valued form, is omitted:
Mathlib has no `GSp`.) -/
theorem integralModel_unique_and_selfDual [CompactSpace Γ] (ϖ : O) (hϖ : Irreducible ϖ)
    (Λ₀ : IntegralModel O ρ) [IsModuleTopology O Λ₀.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ₀.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ₀.lattice)]
    (hirr : Representation.IsIrreducible Λ₀.reduction.toRepresentation) :
    (∀ Λ : IntegralModel O ρ, ∃ k : ℤ, Λ.lattice =
      Λ₀.lattice.map ((((algebraMap O E ϖ) ^ k) • LinearMap.id : V →ₗ[E] V).restrictScalars O)) ∧
    ∀ (B : LinearMap.BilinForm E V), B.Nondegenerate → (B.IsSymm ∨ B.IsAlt) →
      ∀ μ : Γ →ₜ* Eˣ, (∀ g x y, B (ρ g x) (ρ g y) = (μ g : E) * B x y) →
        (∀ g, ∃ u : Oˣ, algebraMap O E u = μ g) ∧
        ∃ (Λ : IntegralModel O ρ) (c : O), (c = 1 ∨ c = ϖ) ∧
          ∀ y : V, y ∈ Λ.lattice ↔
            ∀ x ∈ Λ.lattice, algebraMap O E c * B x y ∈ Set.range (algebraMap O E) := by
  sorry

end IntegralModel

end GaloisLattice

/-! ### Semisimplicity under restriction and induction
(ArithmeticGaloisRepresentations:R01.1/semisimplicity-under-restriction-and-induction) -/

namespace ContinuousRep

/-- ArithmeticGaloisRepresentations:R01.1/semisimplicity-under-restriction-and-induction.
With `N` the normal core of the open subgroup `H`: (a) Clifford: `H` normal and `V` semisimple
give `Res_H V` semisimple; (b) `[Γ : H]` invertible and `Res_H V` semisimple give `V`
semisimple; (c) `[H : N]` invertible and `V` semisimple give `Res_H V` semisimple; (d) `[Γ : N]`
invertible and `U` semisimple give `Ind_H^Γ U` semisimple. (Clifford's description of
`Res_H V` for irreducible `V` is not restated.) -/
theorem isSemisimple_res_ind {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ]
    {K : Type uA} [Field K] [TopologicalSpace K] [IsTopologicalRing K]
    {V : Type uM} [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
    [IsModuleTopology K V]
    {U : Type uM} [AddCommGroup U] [Module K U] [FiniteDimensional K U] [TopologicalSpace U]
    [IsModuleTopology K U]
    (H : OpenSubgroup Γ) (ρ : ContinuousRep Γ K V) (σ : ContinuousRep H K U) :
    (((H : Subgroup Γ).Normal → Representation.IsSemisimpleRepresentation ρ.toRepresentation →
        Representation.IsSemisimpleRepresentation (ρ.res (openSubtype H)).toRepresentation) ∧
      (IsUnit ((H : Subgroup Γ).index : K) →
        Representation.IsSemisimpleRepresentation (ρ.res (openSubtype H)).toRepresentation →
        Representation.IsSemisimpleRepresentation ρ.toRepresentation) ∧
      (IsUnit (((H : Subgroup Γ).normalCore.relIndex (H : Subgroup Γ) : ℕ) : K) →
        Representation.IsSemisimpleRepresentation ρ.toRepresentation →
        Representation.IsSemisimpleRepresentation (ρ.res (openSubtype H)).toRepresentation) ∧
      (IsUnit ((H : Subgroup Γ).normalCore.index : K) →
        Representation.IsSemisimpleRepresentation σ.toRepresentation →
        Representation.IsSemisimpleRepresentation (ind H σ).toRepresentation)) := by
  sorry

/-! ### Integral models and reduction for Ĝ-valued representations
(ArithmeticGaloisRepresentations:R01.1/reductive-integral-models) -/

/-- ArithmeticGaloisRepresentations:R01.1/reductive-integral-models, in the case `Ĝ = GL_n`
(part (iii)): a continuous `ρ : Γ → GL_n(Q̄_ℓ)` is conjugate to a representation with values in
`GL_n(O_E)` for a coefficient field `E ⊂ Q̄_ℓ` (entries in `E` of norm `≤ 1`). The statements for
a general split reductive `Ĝ` over `ℤ` and `Ĝ`-semisimplification are omitted: Mathlib has no
reductive group schemes. -/
theorem exists_integral_conj_GL {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [CompactSpace Γ]
    [T2Space Γ] (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
    ∃ (E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ)) (P : Matrix.GeneralLinearGroup (Fin n)
        (PadicAlgCl ℓ)),
      FiniteDimensional ℚ_[ℓ] E ∧ ∀ (g : Γ) (i j : Fin n),
        ((P * ρ g * P⁻¹ : Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
          Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E ∧
        ‖((P * ρ g * P⁻¹ : Matrix.GeneralLinearGroup (Fin n) (PadicAlgCl ℓ)) :
          Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j‖ ≤ 1 := by
  sorry

end ContinuousRep

end TauCeti

/-! # The declarations of layers R01.2 and R01.3 -/
/-! # Section L2: local arithmetic of Galois representations (R01.2) and conductors (R01.3)

Conventions of this section. A nonarchimedean local field `K` is given by
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` (as in the
preamble). The local Weil group is not in Mathlib: Weil–Deligne statements use an abstract
topological group `W` with a degree map `deg : W →* Multiplicative ℤ` (so `deg.ker` plays `I_K`,
an arithmetic Frobenius lift has degree `ofAdd 1`, a geometric one `ofAdd (-1)`), exactly as the
preamble's `WeilDeligneRep`; the comparison of `W` with `G_K` (ClassFieldTheory layer 9) is a
hypothesis-free input that consumers supply. Places of `F̄` above a finite place are maximal
ideals of `𝓞 F̄` with the pointwise action of `G_F`. -/

open scoped Pointwise ValuativeRel
open NumberField IsDedekindDomain Polynomial

namespace TauCeti

namespace GaloisRep

/-- `G_F` acts on `F̄` (unfolding `Field.absoluteGaloisGroup`); this induces the actions on
`𝓞 F̄` and, pointwise, on its ideals. -/
instance instMulSemiringActionAbsoluteGaloisGroup (F : Type*) [Field F] :
    MulSemiringAction (Field.absoluteGaloisGroup F) (AlgebraicClosure F) :=
  inferInstanceAs (MulSemiringAction (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F) _)

/-! ### Decomposition, inertia and wild inertia groups at a place of a number field (ArithmeticGaloisRepresentations:R01.2/decomposition-group-at-a-place) -/

section Decomposition

variable (F : Type*) [Field F]

/-- The decomposition group `D_{w̄} = MulAction.stabilizer G_F w̄` of a place `w̄` of `F̄`
(a maximal ideal of `𝓞 F̄`). -/
def decompositionGroup (w : Ideal (𝓞 (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) :=
  MulAction.stabilizer (Field.absoluteGaloisGroup F) w

/-- The global inertia group `I_{w̄} = {σ : σx − x ∈ w̄ for all x ∈ 𝓞 F̄}` (Mathlib's
`AddSubgroup.inertia`). The packet's api name `TauCeti.GaloisRep.inertiaGroup` is the preamble's
local inertia group `I_K`; the global one is named `globalInertiaGroup` here. -/
def globalInertiaGroup (w : Ideal (𝓞 (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) :=
  AddSubgroup.inertia w.toAddSubgroup (Field.absoluteGaloisGroup F)

theorem inertiaGroup_le_decompositionGroup (w : Ideal (𝓞 (AlgebraicClosure F))) [w.IsMaximal] :
    globalInertiaGroup F w ≤ decompositionGroup F w := by sorry

/-- The global wild inertia group `P_{w̄}`: the largest closed normal pro-`p` subgroup of `I_{w̄}`
(`p` the residue characteristic), defined inside `G_F`. It is the unique pro-`p` Sylow subgroup of
`I_{w̄}`, and it is the image of `P_{F_v}` under `ι^*` (`map_inertia_localEmbeddingMap`). -/
def wildInertiaGroup (w : Ideal (𝓞 (AlgebraicClosure F))) :
    Subgroup (Field.absoluteGaloisGroup F) := sorry

/-- An arithmetic Frobenius lift at `w̄`: `σ x ≡ x ^ q_v mod w̄` for all `x ∈ 𝓞 F̄`, where
`q_v = #(𝓞 F ⧸ (w̄ ∩ 𝓞 F))`. -/
def IsArithFrobLift (w : Ideal (𝓞 (AlgebraicClosure F))) (σ : Field.absoluteGaloisGroup F) :
    Prop :=
  ∀ x : 𝓞 (AlgebraicClosure F), σ • x - x ^ Nat.card (𝓞 F ⧸ w.comap (algebraMap (𝓞 F) _)) ∈ w

theorem decompositionGroup_smul (w : Ideal (𝓞 (AlgebraicClosure F)))
    (σ : Field.absoluteGaloisGroup F) :
    decompositionGroup F (σ • w) = (decompositionGroup F w).map (MulAut.conj σ).toMonoidHom ∧
      globalInertiaGroup F (σ • w) = (globalInertiaGroup F w).map (MulAut.conj σ).toMonoidHom := by
  sorry

theorem exists_isArithFrobAt [NumberField F] (w : Ideal (𝓞 (AlgebraicClosure F))) [w.IsMaximal]
    (hw : w ≠ ⊥) :
    (∃ σ ∈ decompositionGroup F w, IsArithFrobLift F w σ) ∧
      ∀ σ σ', IsArithFrobLift F w σ →
        (IsArithFrobLift F w σ' ↔ σ' * σ⁻¹ ∈ globalInertiaGroup F w) := by sorry

/-- `D_{w̄}/I_{w̄} ≅ Gal(k̄_v/k_v)`: the action on the residue field `𝓞 F̄ ⧸ w̄` has kernel `I_{w̄}`
and sends Frobenius lifts to `x ↦ x ^ q_v` (the identification with `Ẑ` is then by `Frob ↦ 1`).
Not stated here: that the image is all of `Gal(k̄_v/k_v)`, and the identification with `Ẑ`. -/
theorem decompositionGroup_quotient_inertia [NumberField F] (w : Ideal (𝓞 (AlgebraicClosure F)))
    [w.IsMaximal] (hw : w ≠ ⊥) :
    ∃ f : decompositionGroup F w →* ((𝓞 (AlgebraicClosure F) ⧸ w) ≃+* (𝓞 (AlgebraicClosure F) ⧸ w)),
      f.ker = (globalInertiaGroup F w).subgroupOf (decompositionGroup F w) ∧
      ∀ σ : decompositionGroup F w, IsArithFrobLift F w σ →
        ∀ x, f σ x = x ^ Nat.card (𝓞 F ⧸ w.comap (algebraMap (𝓞 F) _)) := by sorry

theorem restrict_decompositionGroup [NumberField F] (L : IntermediateField F (AlgebraicClosure F))
    [FiniteDimensional F L] [IsGalois F L] (w : Ideal (𝓞 (AlgebraicClosure F))) [w.IsMaximal] :
    (decompositionGroup F w).map (AlgEquiv.restrictNormalHom L) =
      MulAction.stabilizer (L ≃ₐ[F] L) (w.comap (algebraMap (𝓞 L) (𝓞 (AlgebraicClosure F)))) := by
  sorry

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The local wild inertia group `P_K ⊆ I_K` (Tau Ceti LocalFieldsRamification layer 4). -/
def localWildInertiaGroup : Subgroup (Field.absoluteGaloisGroup K) := sorry

variable [Algebra F K] [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
  [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)]

/-- The place `w̄(ι)` of `F̄` pulled back along the embedding `ι : F̄ → K̄` (given by the algebra
structure) from the maximal ideal of the integral closure of `𝒪[K]` in `K̄`. -/
def placeOfEmbedding (F K : Type*) [Field F] [Field K] [Algebra F K]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure K)] : Ideal (𝓞 (AlgebraicClosure F)) := sorry

/-- `range ι^* = D_{w̄(ι)}`, `ι^*` is injective and a closed embedding, when `F` is dense in `K`
(i.e. `K = F_v`). -/
theorem range_localEmbeddingMap [NumberField F] (hK : DenseRange (algebraMap F K)) :
    (localEmbeddingMap F K).toMonoidHom.range = decompositionGroup F (placeOfEmbedding F K) ∧
      Topology.IsClosedEmbedding (localEmbeddingMap F K) := by sorry

theorem map_inertia_localEmbeddingMap [NumberField F] (hK : DenseRange (algebraMap F K)) :
    (inertiaGroup K).map (localEmbeddingMap F K).toMonoidHom =
        globalInertiaGroup F (placeOfEmbedding F K) ∧
      (localWildInertiaGroup K).map (localEmbeddingMap F K).toMonoidHom =
        wildInertiaGroup F (placeOfEmbedding F K) := by sorry

/- TauCeti.GaloisRep.localEmbeddingMap_comp: (ι∘σ)^* = σ^{-1}·ι^*·σ for σ ∈ G_F, and
(τ_0∘ι)^* = ι^*∘(conj τ_0^{-1}) for τ_0 ∈ G_{F_v}. (Comment-block fallback: the embedding `ι` is
an instance argument of `localEmbeddingMap`, so comparing two embeddings needs instance surgery;
the conjugated forms are used directly in `localRestrictionIsoOfConj`/`OfLocal` below.) -/

/-- Unit test: TauCeti.GaloisRep.decompositionGroup_gaussian. -/
example (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [FiniteDimensional ℚ L] [IsGalois ℚ L]
    (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1) (hL : L = IntermediateField.adjoin ℚ {i})
    (p : ℕ) (hp : p.Prime) (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal]
    (hw : (p : 𝓞 (AlgebraicClosure ℚ)) ∈ w) :
    Nat.card ((decompositionGroup ℚ w).map (AlgEquiv.restrictNormalHom L)) =
      if p % 4 = 1 then 1 else 2 := by sorry

/-- Unit test: TauCeti.GaloisRep.inertiaGroup_gaussian. -/
example (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [FiniteDimensional ℚ L] [IsGalois ℚ L]
    (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1) (hL : L = IntermediateField.adjoin ℚ {i})
    (p : ℕ) (hp : p.Prime) (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal]
    (hw : (p : 𝓞 (AlgebraicClosure ℚ)) ∈ w) :
    (globalInertiaGroup ℚ w).map (AlgEquiv.restrictNormalHom L) ≠ ⊥ ↔ p = 2 := by sorry

/-- Unit test: TauCeti.GaloisRep.decompositionGroup_not_normal. -/
example (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal]
    (hw : (5 : 𝓞 (AlgebraicClosure ℚ)) ∈ w) : ¬ (decompositionGroup ℚ w).Normal := by sorry

/-- Unit test: TauCeti.GaloisRep.localEmbeddingMap_eq_map. `ι^*` is Mathlib's `mapOfAlgebra` for
the algebra structure given by `ι` (true by definition here). Mathlib's
`Field.absoluteGaloisGroup.map (algebraMap F K)` is the special case of the embedding chosen by
`IsAlgClosed.lift`; it cannot be given a prescribed `ι`, so that half of the test is not a Lean
statement about an arbitrary instance. -/
example : localEmbeddingMap F K = Field.absoluteGaloisGroup.mapOfAlgebra F K := rfl

/-- Unit test: TauCeti.GaloisRep.isArithFrobAt_mul_inv_mem_inertiaGroup. -/
example [NumberField F] (w : Ideal (𝓞 (AlgebraicClosure F))) [w.IsMaximal] (hw : w ≠ ⊥)
    (σ σ' : Field.absoluteGaloisGroup F) (h : IsArithFrobLift F w σ)
    (h' : IsArithFrobLift F w σ') :
    σ * σ'⁻¹ ∈ globalInertiaGroup F w ∧ ¬ IsArithFrobLift F w σ⁻¹ := by sorry

end Decomposition

/-! ### The algebraic closure of F_v is generated by F_v and the algebraic closure of F (ArithmeticGaloisRepresentations:R01.2/algebraic-closure-of-a-completion-is-generated-by-the-global-closure) -/

/-- ArithmeticGaloisRepresentations:R01.2/algebraic-closure-of-a-completion-is-generated-by-the-global-closure:
`F̄_v = F_v · ι(F̄)` for a number field `F` dense in the local field `K = F_v` and an embedding
`ι : F̄ → K̄` (the algebra structure). The proof applies Mathlib's `IsKrasner.krasner` to the
spectral norm on `K̄`, after approximating a minimal polynomial over `K` by a polynomial over `F`. -/
theorem adjoin_range_closureEmbedding_eq_top (F K : Type*) [Field F] [NumberField F] [Field K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Algebra F K]
    (hK : DenseRange (algebraMap F K)) [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)] :
    IntermediateField.adjoin K
      (Set.range (algebraMap (AlgebraicClosure F) (AlgebraicClosure K))) = ⊤ := by sorry

/-- Consequence (a) of the same node: an element of `G_{F_v}` that fixes `ι(F̄)` pointwise is
trivial, i.e. `ι^*` is injective. -/
theorem localEmbeddingMap_injective (F K : Type*) [Field F] [NumberField F] [Field K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Algebra F K]
    (hK : DenseRange (algebraMap F K)) [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)] :
    Function.Injective (localEmbeddingMap F K) := by sorry

/-- Consequence (b) of the same node: every finite extension of `F_v` inside `F̄_v` is
`F_v(ι(β))` for some `β ∈ F̄` (hence the completion of the number field `F(β)` at the place
induced by `ι`; that identification is not stated here). -/
theorem exists_adjoin_closureEmbedding_eq (F K : Type*) [Field F] [NumberField F] [Field K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [Algebra F K]
    (hK : DenseRange (algebraMap F K)) [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)]
    (L : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K L] :
    ∃ β : AlgebraicClosure F, L = IntermediateField.adjoin K
      {algebraMap (AlgebraicClosure F) (AlgebraicClosure K) β} := by sorry

/-! ### Restriction of a global representation to a decomposition group, and its independence of the embedding (ArithmeticGaloisRepresentations:R01.2/local-restriction) -/

section LocalRestriction

/-- Conjugation `x ↦ σ x σ⁻¹` as a continuous homomorphism of `G_F`. -/
def conjHom {F : Type*} [Field F] (σ : Field.absoluteGaloisGroup F) :
    Field.absoluteGaloisGroup F →ₜ* Field.absoluteGaloisGroup F :=
  ⟨(MulAut.conj σ).toMonoidHom, by sorry⟩

variable (F K : Type*) [Field F] [Field K] [Algebra F K]
  [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
  [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- The local restriction `ρ_ι = ρ ∘ ι^*` of a continuous representation of `G_F`. -/
def localRestriction (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    ContinuousRep (Field.absoluteGaloisGroup K) A M :=
  ρ.res (localEmbeddingMap F K)

/-- `ρ(σ) : ρ_{ι∘σ} ≅ ρ_ι`, where `(ι∘σ)^* = conj(σ⁻¹) ∘ ι^*`. -/
def localRestrictionIsoOfConj (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (σ : Field.absoluteGaloisGroup F) :
    ContinuousRep.Iso (ρ.res ((conjHom σ⁻¹).comp (localEmbeddingMap F K)))
      (localRestriction F K ρ) := sorry

/-- `ρ_ι(τ₀) : ρ_{τ₀∘ι} ≅ ρ_ι`, where `(τ₀∘ι)^* = ι^* ∘ conj(τ₀⁻¹)`. -/
def localRestrictionIsoOfLocal (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (τ₀ : Field.absoluteGaloisGroup K) :
    ContinuousRep.Iso (ρ.res ((localEmbeddingMap F K).comp (conjHom τ₀⁻¹)))
      (localRestriction F K ρ) := sorry

/-- The isomorphism of `localRestrictionIsoOfConj` is `ρ(σ)` itself. -/
theorem localRestrictionIsoOfConj_apply (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (σ : Field.absoluteGaloisGroup F) (m : M) :
    (localRestrictionIsoOfConj F K ρ σ).toLinearEquiv m = ρ σ m := by sorry

/-- The isomorphism of `localRestrictionIsoOfLocal` is `ρ_ι(τ₀) = ρ(ι^* τ₀)`. -/
theorem localRestrictionIsoOfLocal_apply (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (τ₀ : Field.absoluteGaloisGroup K) (m : M) :
    (localRestrictionIsoOfLocal F K ρ τ₀).toLinearEquiv m = ρ (localEmbeddingMap F K τ₀) m := by
  sorry

/-- Any two embeddings over `v` differ by `σ ∈ G_F` and `τ₀ ∈ G_{F_v}`, and the local
restrictions are isomorphic. The isomorphism obtained by composing the two above is `ρ(g)` with
`g = ι⁻¹ ∘ ι'` (for `ι' = τ₀ ∘ ι ∘ σ`, `g = ι^*(τ₀) σ`): it depends only on the two embeddings,
not on `σ`, `τ₀`, and these isomorphisms compose; it is not the identity of `M` in general. (The
embedding is instance data here, so this cannot be stated for two arbitrary embeddings.) -/
theorem nonempty_localRestriction_iso (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (σ : Field.absoluteGaloisGroup F) (τ₀ : Field.absoluteGaloisGroup K) :
    Nonempty (ContinuousRep.Iso
      (ρ.res ((conjHom σ).comp ((localEmbeddingMap F K).comp (conjHom τ₀))))
      (localRestriction F K ρ)) := by sorry

theorem localRestriction_tensor {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup F) A N) :
    Representation.tprod (localRestriction F K ρ).toRepresentation
        (localRestriction F K ρ').toRepresentation =
      (Representation.tprod ρ.toRepresentation ρ'.toRepresentation).comp
        (localEmbeddingMap F K).toMonoidHom ∧
    (localRestriction F K ρ).toRepresentation.dual =
      ρ.toRepresentation.dual.comp (localEmbeddingMap F K).toMonoidHom := by sorry

/- TauCeti.GaloisRep.localRestriction_restrict: (ρ|_{G_L})_ι = (ρ_ι)|_{G_{L_w}} for L/F finite and
w = w̄(ι) ∩ O_L. (Comment-block fallback: needs a commuting square of four closure embeddings as
instance data.) -/

/- TauCeti.GaloisRep.localRestriction_induced: (Ind_{G_L}^{G_F} ρ)_ι ≅ ⊕_{w|v}
Ind_{G_{L_w}}^{G_{F_v}} ρ_{ι_w}. (Comment-block fallback: continuous induction is R01.1's
carrier and the index set is the set of places of L above v.) -/

/- TauCeti.GaloisRep.localRestriction_kernelField: for finite image, ρ_ι factors through an
injective Gal(K_{ρ,𝔭}/F_v) → Aut_A(M) carrying inertia and wild inertia onto ρ(I_{w̄}) and
ρ(P_{w̄}). (Comment-block fallback: the completion of the kernel field at 𝔭 is not a Mathlib
object.) -/

/-- Unit test: TauCeti.GaloisRep.localRestriction_cyclotomic. -/
example (ℓ p : ℕ) [Fact ℓ.Prime] [Fact p.Prime] (hpℓ : p ≠ ℓ)
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    (σ : Field.absoluteGaloisGroup ℚ_[p]) (hσ : σ * (arithFrobLift ℚ_[p])⁻¹ ∈ inertiaGroup ℚ_[p]) :
    (cyclotomicCharacter ℚ ℓ (localEmbeddingMap ℚ ℚ_[p] σ) : ℤ_[ℓ]) = p := by sorry

/-- Unit test: TauCeti.GaloisRep.localRestriction_induced_gaussian. Stated over `ℚ` (where `2`
is invertible, so that `Ind 1 = 1 ⊕ ε_{−4}`; over `𝔽₂` or `ℤ₂` the induced representation is not a
sum of two characters) through the characteristic polynomial of Frobenius of the local
restriction. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) ℚ (Fin 2 → ℚ))
    (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1)
    (hρ₁ : ∀ σ : Field.absoluteGaloisGroup ℚ, σ • i = i → ρ σ = LinearMap.id)
    (hρ₂ : ∀ σ : Field.absoluteGaloisGroup ℚ, σ • i ≠ i → ρ σ = Matrix.toLin' !![(0 : ℚ), 1; 1, 0]) :
    (localRestriction ℚ ℚ_[p] ρ).charpoly (arithFrobLift ℚ_[p]) =
      if p % 4 = 1 then (X - 1) ^ 2 else (X - 1) * (X + 1) := by sorry

/-- Unit test: TauCeti.GaloisRep.localRestriction_trivial. -/
example : localRestriction F K (ContinuousRep.trivial : ContinuousRep _ A M) =
    ContinuousRep.trivial := by sorry

/-- Unit test: TauCeti.GaloisRep.localRestriction_iso_not_canonical. For `p ≡ 1 mod 4` the
restrictions `ρ_ι` and `ρ_{ι∘c}` are equal as homomorphisms (both are trivial, because `i ∈ ℚ_p`),
but the comparison isomorphism `ρ(c)` of `localRestrictionIsoOfConj` is not the identity: it must
be carried, and may not be replaced by the identity of `M`. -/
example (p : ℕ) [Fact p.Prime] (hp : p % 4 = 1)
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) ℚ (Fin 2 → ℚ))
    (i : AlgebraicClosure ℚ) (hi : i ^ 2 = -1)
    (hρ₁ : ∀ σ : Field.absoluteGaloisGroup ℚ, σ • i = i → ρ σ = LinearMap.id)
    (hρ₂ : ∀ σ : Field.absoluteGaloisGroup ℚ, σ • i ≠ i → ρ σ = Matrix.toLin' !![(0 : ℚ), 1; 1, 0])
    (c : Field.absoluteGaloisGroup ℚ) (hc : c • i = -i) :
    ρ.res ((conjHom c⁻¹).comp (localEmbeddingMap ℚ ℚ_[p])) = localRestriction ℚ ℚ_[p] ρ ∧
      (localRestrictionIsoOfConj ℚ ℚ_[p] ρ c).toLinearEquiv ≠
        LinearEquiv.refl ℚ (Fin 2 → ℚ) := by sorry

/-- Unit test: TauCeti.GaloisRep.localRestriction_depends_on_embedding. For `ρ` the faithful
two-dimensional representation of `Gal(ℚ(∛2, ζ₃)/ℚ) ≅ S₃` and `p = 5`, changing the embedding by a
suitable `σ` changes the homomorphism `ρ_ι` (the two Frobenius images are different
transpositions), although the two restrictions are isomorphic. -/
example (p : ℕ) [Fact p.Prime] (hp : p = 5)
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) ℚ (Fin 2 → ℚ))
    (hρ : ∀ σ : Field.absoluteGaloisGroup ℚ, ρ σ = LinearMap.id ↔
      ∀ x : AlgebraicClosure ℚ, x ^ 3 = 2 → σ • x = x) :
    ∃ σ : Field.absoluteGaloisGroup ℚ,
      ρ.res ((conjHom σ⁻¹).comp (localEmbeddingMap ℚ ℚ_[p])) ≠ localRestriction ℚ ℚ_[p] ρ := by
  sorry

end LocalRestriction

/-! ### Unramified and tamely ramified representations, and the ramification set (ArithmeticGaloisRepresentations:R01.2/unramified-and-ramification-set) -/

section Ramification

/-- The representation of `Γ` on `A` given by a character `χ : Γ →* Aˣ` (no topology). -/
def characterRep {Γ A : Type*} [Group Γ] [CommRing A] (χ : Γ →* Aˣ) : Representation A Γ A where
  toFun g := (χ g : A) • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

theorem isUnramified_iff_inertia_le_ker (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    IsUnramified ρ ↔ inertiaGroup K ≤ ρ.toRepresentation.ker := by sorry

/-- `ρ` is tamely ramified when wild inertia acts trivially. -/
def IsTamelyRamified (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) : Prop :=
  ∀ g ∈ localWildInertiaGroup K, ρ g = LinearMap.id

theorem IsUnramified.isTamelyRamified {ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M}
    (h : IsUnramified ρ) : IsTamelyRamified ρ := by sorry

variable (F : Type*) [Field F] [NumberField F]
variable {V : Type*} [AddCommGroup V] [Module A V]

/-- `ρ` is unramified at the finite place `v`: every `I_{w̄}` with `w̄ | v` acts trivially. -/
def IsUnramifiedAt (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  ∀ w : Ideal (𝓞 (AlgebraicClosure F)), w.IsMaximal →
    w.comap (algebraMap (𝓞 F) (𝓞 (AlgebraicClosure F))) = v.asIdeal →
      ∀ g ∈ globalInertiaGroup F w, ρ g = LinearMap.id

theorem isUnramifiedAt_iff_forall (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (v : HeightOneSpectrum (𝓞 F)) :
    IsUnramifiedAt F ρ v ↔ ∀ w : Ideal (𝓞 (AlgebraicClosure F)), w.IsMaximal →
      w.comap (algebraMap (𝓞 F) (𝓞 (AlgebraicClosure F))) = v.asIdeal →
        globalInertiaGroup F w ≤ ρ.ker := by sorry

theorem isUnramifiedAt_iff_exists (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (v : HeightOneSpectrum (𝓞 F)) :
    IsUnramifiedAt F ρ v ↔ ∃ w : Ideal (𝓞 (AlgebraicClosure F)), w.IsMaximal ∧
      w.comap (algebraMap (𝓞 F) (𝓞 (AlgebraicClosure F))) = v.asIdeal ∧
        globalInertiaGroup F w ≤ ρ.ker := by sorry

/-- The ramification set `Ram(ρ)` (finite places only). -/
def ramificationSet (ρ : Representation A (Field.absoluteGaloisGroup F) V) :
    Set (HeightOneSpectrum (𝓞 F)) :=
  {v | ¬ IsUnramifiedAt F ρ v}

/-- `Ram^{(p)}(ρ)`: the ramification set with the places above `p` removed. -/
def ramificationSetAway (ρ : Representation A (Field.absoluteGaloisGroup F) V) (p : ℕ) :
    Set (HeightOneSpectrum (𝓞 F)) :=
  ramificationSet F ρ \ {v | (p : 𝓞 F) ∈ v.asIdeal}

/-- `ρ` is unramified outside `S`: `Ram(ρ) ⊆ S`. -/
def IsUnramifiedOutside (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (S : Set (HeightOneSpectrum (𝓞 F))) : Prop :=
  ramificationSet F ρ ⊆ S

/-- `Ram(ρ) ⊆ S` iff `ρ` factors through `G_{F,S} = Gal(F_S/F)`, i.e. is trivial on the inertia
groups of all places of `F̄` above finite places outside `S`. Here `F_S` is the maximal extension
unramified at the finite places outside `S`, with no condition at the archimedean places (`S` is a
set of finite places); the closed normal subgroup generated by these inertia groups is
`Gal(F̄/F_S)`. -/
theorem isUnramifiedOutside_iff_factors (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    IsUnramifiedOutside F ρ S ↔
      Subgroup.normalClosure (⋃ (w : Ideal (𝓞 (AlgebraicClosure F))) (_ : w.IsMaximal)
        (_ : ∀ v ∈ S, w.comap (algebraMap (𝓞 F) (𝓞 (AlgebraicClosure F))) ≠ v.asIdeal),
          (globalInertiaGroup F w : Set (Field.absoluteGaloisGroup F))) ≤ ρ.ker := by sorry

/-- A continuous representation with finite image has finite `Ram(ρ)`: it is the set of primes
ramified in the kernel field `K_ρ`, Tau Ceti's `NumberField.Chebotarev.ramifiedPrimes F K_ρ` (a
`Finset`, outside the Mathlib-only build). `ρ` is a bare `Representation` here, so the hypothesis
is that its kernel is open (for a Hausdorff target this is: continuous with finite image; it
implies finite image because `G_F` is compact). Finiteness of the image alone is not enough: a
discontinuous character of order `2` of `Gal(ℚ(√p : p prime)/ℚ) ≅ ∏_p ℤ/2` that is nontrivial on
every factor is ramified at every odd prime. -/
theorem finite_ramificationSet_of_finite_image
    (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (hρ : IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F))) :
    (ramificationSet F ρ).Finite := by sorry

/-- `Ram(ρ ⊗ ρ') ⊆ Ram ρ ∪ Ram ρ'` and `Ram(ρ^∨) ⊆ Ram ρ`. Not stated here: the equality
`Ram(ρ ⊕ ρ') = Ram ρ ∪ Ram ρ'`, the equality `Ram(ρ^∨) = Ram ρ` (for `V` finite projective), and
`Ram` of subquotients. -/
theorem ramificationSet_tensor {V' : Type*} [AddCommGroup V'] [Module A V']
    (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (ρ' : Representation A (Field.absoluteGaloisGroup F) V') :
    ramificationSet F (ρ.tprod ρ') ⊆ ramificationSet F ρ ∪ ramificationSet F ρ' ∧
      ramificationSet F ρ.dual ⊆ ramificationSet F ρ := by sorry

/-- Restriction: `Ram(ρ|_{G_L})` lies above `Ram(ρ)`. (The induction half,
`Ram(Ind ρ) ⊆ (places below Ram ρ) ∪ Ram(L/F)`, is omitted: continuous induction is R01.1's.) -/
theorem ramificationSet_restrict_induced (L : Type*) [Field L] [NumberField L] [Algebra F L]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)]
    (ρ : Representation A (Field.absoluteGaloisGroup F) V) :
    ∀ w ∈ ramificationSet L (ρ.comp (localEmbeddingMap F L).toMonoidHom),
      ∃ v ∈ ramificationSet F ρ, w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 L)) = v.asIdeal := by
  sorry

/-- Reduction (any equivariant quotient, e.g. `Λ → Λ/𝔪Λ`) of a representation unramified at `v`
is unramified at `v`. -/
theorem isUnramifiedAt_reduction {N : Type*} [AddCommGroup N] [Module A N]
    (ρ : Representation A (Field.absoluteGaloisGroup F) V)
    (ρ' : Representation A (Field.absoluteGaloisGroup F) N) (f : V →ₗ[A] N)
    (hf : Function.Surjective f) (hfρ : ∀ g, f ∘ₗ ρ g = ρ' g ∘ₗ f)
    (v : HeightOneSpectrum (𝓞 F)) (h : IsUnramifiedAt F ρ v) : IsUnramifiedAt F ρ' v := by sorry

/-- Unit test: TauCeti.GaloisRep.ramificationSet_cyclotomic. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ramificationSet ℚ (characterRep (cyclotomicCharacter ℚ ℓ)) =
      {v | (ℓ : 𝓞 ℚ) ∈ v.asIdeal} := by sorry

/- TauCeti.GaloisRep.ramificationSet_dirichlet: stated after `dirichletCharacterToGalois`
below (cyclotomic-and-dirichlet-characters), which it uses. -/

/-- Unit test: TauCeti.GaloisRep.ramificationSet_trivial. -/
example : ramificationSet F (Representation.trivial A (Field.absoluteGaloisGroup F) V) = ∅ := by
  sorry

/- TauCeti.GaloisRep.isUnramifiedAt_not_of_reduction: there are ρ and v with ρ̄ unramified at v
and ρ ramified at v (Tate curve at a split multiplicative prime with ℓ | v(q)). (Comment-block
fallback: the Tate curve's Tate module is owned by EllipticCurves layer 4 / R01.6.) -/

/-- Unit test: TauCeti.GaloisRep.isUnramifiedAt_iff_kernelField. -/
example (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] [IsGalois F L]
    (ρ₀ : Representation A (L ≃ₐ[F] L) V) (hρ₀ : Function.Injective ρ₀)
    (v : HeightOneSpectrum (𝓞 F)) :
    IsUnramifiedAt F (ρ₀.comp (AlgEquiv.restrictNormalHom L)) v ↔
      ∀ P : Ideal (𝓞 L), P.IsMaximal → P.comap (algebraMap (𝓞 F) (𝓞 L)) = v.asIdeal →
        AddSubgroup.inertia P.toAddSubgroup (L ≃ₐ[F] L) = ⊥ := by sorry

end Ramification


/-! ### The Frobenius characteristic polynomial P_v(ρ, X) at an unramified place (ArithmeticGaloisRepresentations:R01.2/frobenius-characteristic-polynomial) -/

section FrobCharpoly

/- The main declaration `TauCeti.GaloisRep.frobCharpoly` is the preamble's (local form,
`P(ρ, X) = charpoly ρ(Frob_K)`); the global `P_v(ρ, X)` is `frobCharpoly` of the local
restriction `localRestriction F F_v ρ`. -/

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [Module.Free A M] [TopologicalSpace M] [IsModuleTopology A M]

theorem frobCharpoly_eq_charpoly (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M)
    (hρ : IsUnramified ρ) (σ : Field.absoluteGaloisGroup K)
    (hσ : σ * (arithFrobLift K)⁻¹ ∈ inertiaGroup K) :
    frobCharpoly ρ = (ρ σ).charpoly := by sorry

/-- `P(ρ, X)` is monic of degree `n = rank M`, its second-highest coefficient is `−tr ρ(Frob)`
and its constant term is `(−1)^n det ρ(Frob)`. The trace clause uses `Polynomial.nextCoeff`, which
is `0` in degree `0`: for `n = 0` the polynomial is `1`, and `coeff (n − 1)` (with `0 − 1 = 0` in
`ℕ`) would be its constant term `1`, not `−tr = 0`. -/
theorem frobCharpoly_monic [Nontrivial A] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    (frobCharpoly ρ).Monic ∧ (frobCharpoly ρ).natDegree = Module.finrank A M ∧
      (frobCharpoly ρ).nextCoeff =
        -LinearMap.trace A M (ρ (arithFrobLift K)) ∧
      (frobCharpoly ρ).coeff 0 =
        (-1) ^ Module.finrank A M * LinearMap.det (ρ (arithFrobLift K)) := by sorry

/-- `P(ρ^∨, X) = P^{geom}(ρ, X) = det(X − ρ(Frob⁻¹))`. -/
theorem frobCharpoly_dual (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    (ρ.toRepresentation.dual (arithFrobLift K)).charpoly = (ρ (arithFrobLift K)⁻¹).charpoly := by
  sorry

theorem frobCharpoly_directSum {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [Module.Free A N] [TopologicalSpace N] [IsModuleTopology A N]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) A N) :
    (LinearMap.prodMap (ρ (arithFrobLift K)) (ρ' (arithFrobLift K))).charpoly =
      frobCharpoly ρ * frobCharpoly ρ' := by sorry

theorem frobCharpoly_twist (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M)
    (χ : Field.absoluteGaloisGroup K →* Aˣ) (hχ : ∀ g ∈ inertiaGroup K, χ g = 1) :
    (((χ (arithFrobLift K) : Aˣ) : A) • ρ (arithFrobLift K)).charpoly =
      C ((χ (arithFrobLift K) : A) ^ Module.finrank A M) *
        (frobCharpoly ρ).comp (C ((χ (arithFrobLift K))⁻¹ : Aˣ).val * X) := by sorry

theorem frobCharpoly_map {B : Type*} [CommRing B] [Algebra A B]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    (frobCharpoly ρ).map (algebraMap A B) = ((ρ (arithFrobLift K)).baseChange B).charpoly := by
  sorry

/-- For `L/K` finite with residue degree `f`, `P(ρ|_{G_L}, X)` is the characteristic polynomial
of `ρ(Frob_K)^f` (an identity of polynomials over any coefficient ring; over a field its roots are
the `f`-th powers of the roots of `P(ρ, X)`, with multiplicities). -/
theorem frobCharpoly_restrict (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) (hρ : IsUnramified ρ) :
    frobCharpoly (ρ.res (localEmbeddingMap K L)) = ((ρ (arithFrobLift K)) ^ f).charpoly := by
  sorry

/-- `L(ρ, X) = det(1 − X ρ(Frob⁻¹)) = reverse (P(ρ^∨, X))` at an unramified place (the
`localEulerFactor` form is `localEulerFactor_unramified` below). -/
theorem localEulerFactor_eq_reverse_frobCharpoly_dual
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) A M) :
    ((ρ.toRepresentation.dual (arithFrobLift K)).charpoly).reverse =
      LinearMap.det (1 - (X : (Polynomial A)) • ((ρ (arithFrobLift K)⁻¹).baseChange (Polynomial A))) := by sorry

/-- The continuous `ℓ`-adic cyclotomic character (the preamble's `cyclotomicCharacter` with its
continuity). -/
def cyclotomicCharacterCont (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] :
    Field.absoluteGaloisGroup F →ₜ* ℤ_[ℓ]ˣ :=
  ⟨cyclotomicCharacter F ℓ, by sorry⟩

/-- Unit test: TauCeti.GaloisRep.frobCharpoly_cyclotomic. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) :
    frobCharpoly (ContinuousRep.ofCharacter (cyclotomicCharacterCont K ℓ)) =
      X - C (Nat.card 𝓀[K] : ℤ_[ℓ]) := by sorry

/-- Unit test: TauCeti.GaloisRep.frobCharpoly_trivial. -/
example [Nontrivial A] [IsTopologicalRing A] (n : ℕ) :
    frobCharpoly (ContinuousRep.trivial :
      ContinuousRep (Field.absoluteGaloisGroup K) A (Fin n → A)) = ((X : (Polynomial A)) - 1) ^ n := by
  sorry

/-- Unit test: TauCeti.GaloisRep.frobCharpoly_cyclotomic_not_geometric. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) (u : ℤ_[ℓ])
    (hu : u * (Nat.card 𝓀[K] : ℤ_[ℓ]) = 1) :
    frobCharpoly (ContinuousRep.ofCharacter (cyclotomicCharacterCont K ℓ)) ≠ X - C u := by sorry

/-- Unit test: TauCeti.GaloisRep.frobCharpoly_semisimplification. -/
example {E : Type*} [Field E] [TopologicalSpace E] {V : Type*} [AddCommGroup V] [Module E V]
    [Module.Finite E V] [TopologicalSpace V] [IsModuleTopology E V]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) :
    letI := ρ.semisimplification.isAddCommGroup
    letI := ρ.semisimplification.isModule
    haveI := ρ.semisimplification.isFinite
    frobCharpoly ρ = (ρ.semisimplification.rep (arithFrobLift K)).charpoly := by sorry

end FrobCharpoly

/-! ### Unramified characters λ(α) with prescribed Frobenius value, and the geometric variant (ArithmeticGaloisRepresentations:R01.2/unramified-character-lambda) -/

section UnramifiedCharacter

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  (R : Type*) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- The unramified character `λ(α) : G_K → R^×` with `λ(α)(Frob) = α` (arithmetic Frobenius),
defined when the closure of `α^ℤ` in `R^×` is profinite (compact and totally disconnected). In
general `λ(α)` exists iff `n ↦ α^n` extends to a continuous homomorphism `Ẑ → R^×`; continuity of
`n ↦ α^n` for the profinite topology of `ℤ` is necessary but not sufficient when `R^×` is not
complete, and uniqueness needs `R` Hausdorff (`unramifiedCharacter_unique`). -/
def unramifiedCharacter (α : Rˣ)
    (hα : IsCompact (closure ((Subgroup.zpowers α : Subgroup Rˣ) : Set Rˣ)) ∧
      IsTotallyDisconnected (closure ((Subgroup.zpowers α : Subgroup Rˣ) : Set Rˣ))) :
    Field.absoluteGaloisGroup K →ₜ* Rˣ := sorry

variable {K R}

theorem unramifiedCharacter_frob (α : Rˣ) (hα) (σ : Field.absoluteGaloisGroup K)
    (hσ : σ * (arithFrobLift K)⁻¹ ∈ inertiaGroup K) :
    unramifiedCharacter K R α hα σ = α ∧
      ∀ τ ∈ inertiaGroup K, unramifiedCharacter K R α hα τ = 1 := by sorry

theorem unramifiedCharacter_unique [T2Space R] (χ₁ χ₂ : Field.absoluteGaloisGroup K →ₜ* Rˣ)
    (h₁ : ∀ τ ∈ inertiaGroup K, χ₁ τ = 1) (h₂ : ∀ τ ∈ inertiaGroup K, χ₂ τ = 1)
    (h : χ₁ (arithFrobLift K) = χ₂ (arithFrobLift K)) : χ₁ = χ₂ := by sorry

/-- For `E` finite over `ℚ_ℓ`, `λ(α)` exists iff `α ∈ O_E^×`. -/
theorem exists_unramifiedCharacter_iff (ℓ : ℕ) [Fact ℓ.Prime] {E : Type*}
    [NontriviallyNormedField E] [NormedAlgebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E] (α : Eˣ) :
    (∃ χ : Field.absoluteGaloisGroup K →ₜ* Eˣ,
      (∀ τ ∈ inertiaGroup K, χ τ = 1) ∧ χ (arithFrobLift K) = α) ↔ ‖(α : E)‖ = 1 := by sorry

/-- Second case of the api item `exists_unramifiedCharacter_iff`: for `R = ℂ`, `λ(α)` exists iff
`α` is a root of unity. -/
theorem exists_unramifiedCharacter_iff_complex (α : ℂˣ) :
    (∃ χ : Field.absoluteGaloisGroup K →ₜ* ℂˣ,
      (∀ τ ∈ inertiaGroup K, χ τ = 1) ∧ χ (arithFrobLift K) = α) ↔ ∃ n : ℕ, 0 < n ∧ α ^ n = 1 := by
  sorry

theorem unramifiedCharacter_mul (α β : Rˣ) (hα hβ hαβ) (g : Field.absoluteGaloisGroup K) :
    unramifiedCharacter K R (α * β) hαβ g =
      unramifiedCharacter K R α hα g * unramifiedCharacter K R β hβ g := by sorry

theorem unramifiedCharacter_map {S : Type*} [CommRing S] [TopologicalSpace S] [IsTopologicalRing S]
    (f : R →+* S) (hf : Continuous f) (α : Rˣ) (hα hfα) (g : Field.absoluteGaloisGroup K) :
    Units.map (f : R →* S) (unramifiedCharacter K R α hα g) =
      unramifiedCharacter K S (Units.map (f : R →* S) α) hfα g := by sorry

variable (K R) in
/-- The geometric variant `λ^{geom}(γ) = λ(γ⁻¹)`, sending a geometric Frobenius to `γ`. -/
def unramifiedCharacterGeom (γ : Rˣ)
    (hγ : IsCompact (closure ((Subgroup.zpowers γ⁻¹ : Subgroup Rˣ) : Set Rˣ)) ∧
      IsTotallyDisconnected (closure ((Subgroup.zpowers γ⁻¹ : Subgroup Rˣ) : Set Rˣ))) :
    Field.absoluteGaloisGroup K →ₜ* Rˣ :=
  unramifiedCharacter K R γ⁻¹ hγ

theorem unramifiedCharacter_restrict (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f) (α : Rˣ) (hα hαf) :
    (unramifiedCharacter K R α hα).comp (localEmbeddingMap K L) =
      unramifiedCharacter L R (α ^ f) hαf := by sorry

/-- The unramified character `λ_W(α)(w) = α ^ deg w` of a Weil group `W` (any `α ∈ R^×`). -/
def weilUnramifiedCharacter {W : Type*} [Group W] (deg : W →* Multiplicative ℤ) {R : Type*}
    [CommRing R] (α : Rˣ) : W →* Rˣ :=
  (zpowersHom Rˣ α).comp deg

theorem weilUnramifiedCharacter_apply {W : Type*} [Group W] (deg : W →* Multiplicative ℤ)
    {R : Type*} [CommRing R] (α : Rˣ) (w : W) :
    weilUnramifiedCharacter deg α w = α ^ Multiplicative.toAdd (deg w) := by sorry

/-- Unit test: TauCeti.GaloisRep.unramifiedCharacter_q_eq_cyclotomic. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) (q : ℤ_[ℓ]ˣ)
    (hq : (q : ℤ_[ℓ]) = Nat.card 𝓀[K]) (hα) (g : Field.absoluteGaloisGroup K) :
    unramifiedCharacter K ℤ_[ℓ] q hα g = cyclotomicCharacter K ℓ g := by sorry

/-- Unit test: TauCeti.GaloisRep.unramifiedCharacter_one. -/
example (h) : unramifiedCharacter K R 1 h = 1 := by sorry

/-- Unit test: TauCeti.GaloisRep.not_exists_unramifiedCharacter_ell. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ ∃ χ : Field.absoluteGaloisGroup K →ₜ* ℚ_[ℓ]ˣ,
      (∀ τ ∈ inertiaGroup K, χ τ = 1) ∧ (χ (arithFrobLift K) : ℚ_[ℓ]) = ℓ := by sorry

/-- Unit test: TauCeti.GaloisRep.unramifiedCharacterGeom_frob. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) (q : ℤ_[ℓ]ˣ)
    (hq : (q : ℤ_[ℓ]) = Nat.card 𝓀[K]) (h) :
    unramifiedCharacterGeom K ℤ_[ℓ] q h (arithFrobLift K) = q⁻¹ ∧
      unramifiedCharacterGeom K ℤ_[ℓ] q h (arithFrobLift K) ≠
        cyclotomicCharacter K ℓ (arithFrobLift K) := by sorry

/-- Unit test: TauCeti.GaloisRep.unramifiedCharacter_reduction. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (α : ℤ_[ℓ]ˣ) (hα hα') (g : Field.absoluteGaloisGroup K) :
    Units.map (PadicInt.toZMod : ℤ_[ℓ] →+* ZMod ℓ).toMonoidHom
        (unramifiedCharacter K ℤ_[ℓ] α hα g) =
      unramifiedCharacter K (ZMod ℓ) (Units.map (PadicInt.toZMod : ℤ_[ℓ] →+* ZMod ℓ).toMonoidHom α)
        hα' g := by sorry

end UnramifiedCharacter

/-! ### The ℓ-adic cyclotomic character, Dirichlet characters as Galois characters, and their Frobenius values (ArithmeticGaloisRepresentations:R01.2/cyclotomic-and-dirichlet-characters) -/

section Cyclotomic

/- The main declaration `TauCeti.GaloisRep.cyclotomicCharacter` is the preamble's; its continuous
form is `cyclotomicCharacterCont` above. -/

theorem cyclotomicCharacter_spec (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime]
    (g : Field.absoluteGaloisGroup F) (n : ℕ) (ζ : AlgebraicClosure F) (hζ : ζ ^ ℓ ^ n = 1) :
    g • ζ = ζ ^ ((cyclotomicCharacter F ℓ g : ℤ_[ℓ]).toZModPow n).val := by sorry

theorem cyclotomicCharacter_frob (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0)
    (σ : Field.absoluteGaloisGroup K) (hσ : σ * (arithFrobLift K)⁻¹ ∈ inertiaGroup K) :
    (cyclotomicCharacter K ℓ σ : ℤ_[ℓ]) = Nat.card 𝓀[K] := by sorry

theorem cyclotomicCharacter_restrict (F L : Type*) [Field F] [Field L] [Algebra F L]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)] (ℓ : ℕ) [Fact ℓ.Prime]
    (g : Field.absoluteGaloisGroup L) :
    cyclotomicCharacter F ℓ (localEmbeddingMap F L g) = cyclotomicCharacter L ℓ g := by sorry

/-- The Galois character `ε_Gal = ε ∘ galEquivZMod ∘ (G_ℚ ↠ Gal(ℚ(ζ_N)/ℚ))` of a Dirichlet
character `ε` of level `N` (arithmetic Frobenius normalisation: `ε_Gal(Frob_p) = ε(p)`). -/
def dirichletCharacterToGalois {R : Type*} [CommRing R] {N : ℕ} (ε : DirichletCharacter R N) :
    Field.absoluteGaloisGroup ℚ →* Rˣ := sorry

theorem dirichletCharacterToGalois_frob {R : Type*} [CommRing R] {N : ℕ}
    (ε : DirichletCharacter R N) (p : ℕ) (hp : p.Prime) (hpN : p.Coprime N)
    (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal] (hw : (p : 𝓞 (AlgebraicClosure ℚ)) ∈ w)
    (σ : Field.absoluteGaloisGroup ℚ) (hσ : IsArithFrobLift ℚ w σ) :
    (dirichletCharacterToGalois ε σ : R) = ε p := by sorry

theorem dirichletCharacterToGalois_complexConjugation {R : Type*} [CommRing R] {N : ℕ}
    (ε : DirichletCharacter R N) (v : NumberField.InfinitePlace ℚ) (hv : v.IsReal) :
    (dirichletCharacterToGalois ε (complexConjugation ℚ v hv) : R) = ε (-1) := by sorry

theorem dirichletCharacterToGalois_changeLevel {R : Type*} [CommRing R] {N N' : ℕ}
    (hNN' : N ∣ N') (ε : DirichletCharacter R N) :
    dirichletCharacterToGalois (DirichletCharacter.changeLevel hNN' ε) =
      dirichletCharacterToGalois ε := by sorry

/-- Kronecker–Weber: every character of `G_ℚ` with open kernel is `ε_Gal` for a unique primitive
`ε` (unique level, and unique character of that level). Stated for continuous characters of finite
order with values in `ℂˣ`: the elements of order dividing `n` of `ℂˣ` form a finite set, so such a
character has finite image, and its kernel, closed of finite index, is open. For a general
coefficient ring `R` finite order is not enough, also when `R` is Hausdorff: the hypothesis must be
an open kernel (equivalently, for Hausdorff `R`, continuity and finite image); a continuous
character of order `2` with values in `𝔽₂⟦t⟧[η]/(η²)` can have infinite image `1 + η𝔽₂⟦t⟧`. -/
theorem exists_dirichletCharacter_of_finite_order (χ : Field.absoluteGaloisGroup ℚ →ₜ* ℂˣ)
    (hχ : ∃ n, 0 < n ∧ ∀ g, χ g ^ n = 1) :
    (∃ (N : ℕ) (ε : DirichletCharacter ℂ N), ε.IsPrimitive ∧
      dirichletCharacterToGalois ε = χ.toMonoidHom) ∧
    ∀ (N N' : ℕ) (ε : DirichletCharacter ℂ N) (ε' : DirichletCharacter ℂ N'),
      ε.IsPrimitive → ε'.IsPrimitive → dirichletCharacterToGalois ε = χ.toMonoidHom →
        dirichletCharacterToGalois ε' = χ.toMonoidHom → N = N' ∧ HEq ε ε' := by sorry

/-- `χ_p = ω_p · ⟨χ_p⟩` with `ω_p` of order dividing `p − 1` (the Teichmüller lift of `χ̄_p`) and
`⟨χ_p⟩` valued in `1 + pℤ_p` (odd `p`). For `p = 2` the Teichmüller character of `ℚ₂` is trivial
and the node uses `ω₂ = χ₂ mod 4` with `⟨χ₂⟩` valued in `1 + 4ℤ₂`; that case is not stated here.
Tau Ceti's `teichmuller ℚ_p` has values in `𝒪[ℚ_p]ˣ`; the identification with `ℤ_pˣ` and the
splitting `ℤ_pˣ = μ_{p−1} × (1 + pℤ_p)` are part of the node. -/
theorem cyclotomicCharacter_eq_teichmuller_mul (F : Type*) [Field F] (p : ℕ) [Fact p.Prime]
    (hp : p ≠ 2) :
    ∃ ω ψ : Field.absoluteGaloisGroup F →* ℤ_[p]ˣ, (∀ g, ω g ^ (p - 1) = 1) ∧
      (∀ g, ‖(ψ g : ℤ_[p]) - 1‖ < 1) ∧ ∀ g, cyclotomicCharacter F p g = ω g * ψ g := by sorry

/-- Unit test: TauCeti.GaloisRep.ramificationSet_dirichlet (of the node
R01.2/unramified-and-ramification-set; placed here because it uses `dirichletCharacterToGalois`). -/
example (ε : DirichletCharacter ℂ 4) (hε : ε ≠ 1) :
    ramificationSet ℚ (characterRep (dirichletCharacterToGalois ε)) =
      {v | (2 : 𝓞 ℚ) ∈ v.asIdeal} := by sorry

/-- Unit test: TauCeti.GaloisRep.frobCharpoly_dirichlet (of the node
R01.2/frobenius-characteristic-polynomial; placed here because it uses
`dirichletCharacterToGalois`). -/
example {R : Type*} [CommRing R] [Nontrivial R] {N : ℕ} (ε : DirichletCharacter R N) (p : ℕ)
    (hp : p.Prime) (hpN : p.Coprime N) (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal]
    (hw : (p : 𝓞 (AlgebraicClosure ℚ)) ∈ w) (σ : Field.absoluteGaloisGroup ℚ)
    (hσ : IsArithFrobLift ℚ w σ) :
    (characterRep (dirichletCharacterToGalois ε) σ).charpoly = X - C (ε p) := by sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicCharacter_frob_rat. -/
example (ℓ p : ℕ) [Fact ℓ.Prime] (hp : p.Prime) (hpℓ : p ≠ ℓ)
    (w : Ideal (𝓞 (AlgebraicClosure ℚ))) [w.IsMaximal] (hw : (p : 𝓞 (AlgebraicClosure ℚ)) ∈ w)
    (σ : Field.absoluteGaloisGroup ℚ) (hσ : IsArithFrobLift ℚ w σ) :
    (cyclotomicCharacter ℚ ℓ σ : ℤ_[ℓ]) = p := by sorry

/-- Unit test: TauCeti.GaloisRep.dirichletCharacterToGalois_chi4. -/
example (ε : DirichletCharacter ℤ 4) (hε : ε ≠ 1)
    (w₅ w₃ : Ideal (𝓞 (AlgebraicClosure ℚ))) [w₅.IsMaximal] [w₃.IsMaximal]
    (h₅ : (5 : 𝓞 (AlgebraicClosure ℚ)) ∈ w₅) (h₃ : (3 : 𝓞 (AlgebraicClosure ℚ)) ∈ w₃)
    (σ₅ σ₃ : Field.absoluteGaloisGroup ℚ) (hσ₅ : IsArithFrobLift ℚ w₅ σ₅)
    (hσ₃ : IsArithFrobLift ℚ w₃ σ₃) (v : NumberField.InfinitePlace ℚ) (hv : v.IsReal) :
    (dirichletCharacterToGalois ε σ₅ : ℤ) = 1 ∧ (dirichletCharacterToGalois ε σ₃ : ℤ) = -1 ∧
      (dirichletCharacterToGalois ε (complexConjugation ℚ v hv) : ℤ) = -1 := by sorry

/-- Unit test: TauCeti.GaloisRep.dirichletCharacterToGalois_one. -/
example {R : Type*} [CommRing R] :
    dirichletCharacterToGalois (1 : DirichletCharacter R 1) = 1 := by sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicCharacter_ramified_at_ell. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (v : HeightOneSpectrum (𝓞 ℚ)) (hv : (ℓ : 𝓞 ℚ) ∈ v.asIdeal) :
    ¬ IsUnramifiedAt ℚ (characterRep (cyclotomicCharacter ℚ ℓ)) v := by sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicCharacter_eq_galEquivZMod. The reduction of `χ_ℓ`
mod `ℓ^n` factors through `Gal(ℚ(ζ_{ℓ^n})/ℚ)`, where it is the cyclotomic character
`σ(ζ) = ζ^{a(σ)}` (Mathlib's `galEquivZMod`). -/
example (ℓ n : ℕ) [Fact ℓ.Prime] (L : IntermediateField ℚ (AlgebraicClosure ℚ)) [IsGalois ℚ L]
    [IsCyclotomicExtension {ℓ ^ n} ℚ L] (ζ : L) (hζ : IsPrimitiveRoot ζ (ℓ ^ n))
    (g : Field.absoluteGaloisGroup ℚ) :
    AlgEquiv.restrictNormalHom L g ζ =
      ζ ^ ((cyclotomicCharacter ℚ ℓ g : ℤ_[ℓ]).toZModPow n).val := by sorry

end Cyclotomic

/-! ### The ℓ-adic tame character t_ℓ : I_K → Z_ℓ(1) (ArithmeticGaloisRepresentations:R01.2/ell-adic-tame-character) -/

section TameCharacter

/-- `ℤ_ℓ(1)` of a field `L`, as the group of compatible systems `(ζ_n)_n` of `ℓ^n`-th roots of
unity (`ζ_{n+1}^ℓ = ζ_n`), written multiplicatively. -/
def rootsOfUnityTateModule (L : Type*) [Field L] (ℓ : ℕ) : Subgroup (ℕ → Lˣ) where
  carrier := {ζ | ∀ n, ζ n ^ ℓ ^ n = 1 ∧ ζ (n + 1) ^ ℓ = ζ n}
  mul_mem' := by sorry
  one_mem' := by sorry
  inv_mem' := by sorry

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  (ℓ : ℕ) [Fact ℓ.Prime]

/-- The `ℓ`-adic tame character `t_ℓ : I_K → ℤ_ℓ(1)`,
`t_ℓ(σ) = (σ(π^{1/ℓ^n}) / π^{1/ℓ^n})_n` (`ℓ ≠ p`). Continuity (for the inverse-limit topology on
`ℤ_ℓ(1)`, not available on this carrier) is omitted. -/
def tameCharacter : inertiaGroup K →* rootsOfUnityTateModule (AlgebraicClosure K) ℓ := sorry

theorem tameCharacter_surjective (hℓ : (ℓ : 𝓀[K]) ≠ 0) :
    Function.Surjective (tameCharacter K ℓ) ∧
      ∀ σ (hσ : σ ∈ inertiaGroup K), σ ∈ localWildInertiaGroup K →
        tameCharacter K ℓ ⟨σ, hσ⟩ = 1 := by sorry

theorem tameCharacter_apply_uniformizer (hℓ : (ℓ : 𝓀[K]) ≠ 0) (π : 𝒪[K]) (hπ : Irreducible π)
    (n : ℕ) (r : AlgebraicClosure K) (hr : r ^ ℓ ^ n = algebraMap K _ (π : K))
    (σ : inertiaGroup K) :
    (((tameCharacter K ℓ σ : ℕ → (AlgebraicClosure K)ˣ) n : (AlgebraicClosure K))) * r =
      (σ : Field.absoluteGaloisGroup K) • r := by sorry

theorem tameCharacter_conj (hℓ : (ℓ : 𝓀[K]) ≠ 0) (w σ : Field.absoluteGaloisGroup K)
    (hσ : σ ∈ inertiaGroup K) (hwσ : w * σ * w⁻¹ ∈ inertiaGroup K) (n : ℕ) :
    (tameCharacter K ℓ ⟨w * σ * w⁻¹, hwσ⟩ : ℕ → (AlgebraicClosure K)ˣ) n =
      ((tameCharacter K ℓ ⟨σ, hσ⟩ : ℕ → (AlgebraicClosure K)ˣ) n) ^
        ((cyclotomicCharacter K ℓ w : ℤ_[ℓ]).toZModPow n).val := by sorry

/-- Every continuous homomorphism from `I_K` to a finite `ℓ`-group (hence to a pro-`ℓ` group)
factors through `t_ℓ` (the same holds for open subgroups `J ≤ I_K` with `t_ℓ|_J`). -/
theorem tameCharacter_factor_of_proEll (hℓ : (ℓ : 𝓀[K]) ≠ 0) (P : Type*) [Group P] [Finite P]
    (hP : IsPGroup ℓ P) (f : inertiaGroup K →* P) (hf : IsOpen (f.ker : Set (inertiaGroup K))) :
    ∃! g : rootsOfUnityTateModule (AlgebraicClosure K) ℓ →* P, f = g.comp (tameCharacter K ℓ) := by
  sorry

/- TauCeti.GaloisRep.tameCharacter_restrict: t_{ℓ,K}|_{I_L} = e(L/K)·t_{ℓ,L}. (Comment-block
fallback: the two characters land in the Tate modules of different algebraic closures, compared
through the closure embedding K̄ → L̄, and e(L/K) is a LocalFieldsRamification invariant.) -/

/-- `T ∘ t_ℓ : I_K → ℤ_ℓ` for a trivialisation `T : ℤ_ℓ(1) ≅ ℤ_ℓ`. -/
def tameCharacterTriv (T : rootsOfUnityTateModule (AlgebraicClosure K) ℓ ≃* Multiplicative ℤ_[ℓ]) :
    inertiaGroup K →* Multiplicative ℤ_[ℓ] :=
  T.toMonoidHom.comp (tameCharacter K ℓ)

theorem tameCharacterTriv_smul
    (T T' : rootsOfUnityTateModule (AlgebraicClosure K) ℓ ≃* Multiplicative ℤ_[ℓ]) :
    ∃ a : ℤ_[ℓ]ˣ, ∀ σ, Multiplicative.toAdd (tameCharacterTriv K ℓ T' σ) =
      a * Multiplicative.toAdd (tameCharacterTriv K ℓ T σ) := by sorry

/- TauCeti.GaloisRep.tameCharacter_eq_tame: t_ℓ is the ℓ-component of LocalFieldsRamification
layer 4's I_K/P_K ≅ Ẑ^{(p')}(1). (Comment-block fallback: that isomorphism is a Tau Ceti
declaration outside the Mathlib-only build.) -/

/-- Unit test: TauCeti.GaloisRep.tameCharacter_mod_ell_Qp. -/
example (p : ℕ) [Fact p.Prime] (hℓp : ℓ ≠ p) (r : AlgebraicClosure ℚ_[p])
    (hr : r ^ ℓ = algebraMap ℚ_[p] _ p) (σ : inertiaGroup ℚ_[p]) :
    (((tameCharacter ℚ_[p] ℓ σ : ℕ → (AlgebraicClosure ℚ_[p])ˣ) 1 : AlgebraicClosure ℚ_[p])) * r =
      (σ : Field.absoluteGaloisGroup ℚ_[p]) • r := by sorry

/-- Unit test: TauCeti.GaloisRep.tameCharacter_wild. -/
example (σ : Field.absoluteGaloisGroup K) (hσ : σ ∈ inertiaGroup K)
    (hP : σ ∈ localWildInertiaGroup K) : tameCharacter K ℓ ⟨σ, hσ⟩ = 1 := by sorry

/-- Unit test: TauCeti.GaloisRep.tameCharacter_not_extend. -/
example (hℓ : (ℓ : 𝓀[K]) ≠ 0) :
    ¬ ∃ f : Field.absoluteGaloisGroup K →* rootsOfUnityTateModule (AlgebraicClosure K) ℓ,
      ∀ σ (hσ : σ ∈ inertiaGroup K), f σ = tameCharacter K ℓ ⟨σ, hσ⟩ := by sorry

/-- Unit test: TauCeti.GaloisRep.unique_quotient_order_ell. Every continuous surjection
`I_K → ℤ/ℓ` has the kernel of `t_ℓ mod ℓ`, i.e. is a unit multiple of it. -/
example (hℓ : (ℓ : 𝓀[K]) ≠ 0) (f : inertiaGroup K →* Multiplicative (ZMod ℓ))
    (hf : Function.Surjective f) (hfo : IsOpen (f.ker : Set (inertiaGroup K))) :
    f.ker = ((Pi.evalMonoidHom (fun _ : ℕ => (AlgebraicClosure K)ˣ) 1).comp
      ((rootsOfUnityTateModule (AlgebraicClosure K) ℓ).subtype.comp (tameCharacter K ℓ))).ker := by
  sorry

/- TauCeti.GaloisRep.tameCharacter_restrict_ramified: for L = K(π^{1/e}) with p ∤ e,
t_{ℓ,K}|_{I_L} = e·t_{ℓ,L}. (Comment-block fallback, as for tameCharacter_restrict.) -/

end TameCharacter

/-! ### Tame inertia, the level of a character, and the fundamental characters of levels one and two (ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters) -/

section Fundamental

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  (p : ℕ) [Fact p.Prime]

/-- The fundamental character of level `n`, `θ_{p^n−1} : I_K → μ_{p^n−1}(K̄)`,
`σ ↦ σ(π^{1/(p^n−1)})/π^{1/(p^n−1)}` (`p` the residue characteristic); it is trivial on `P_K`, so
it is a character of `I_t = I_K/P_K`, and `μ_{p^n−1}(K̄) ≅ F_{p^n}^×` by reduction. -/
def fundamentalCharacter (n : ℕ) : inertiaGroup K →* rootsOfUnity (p ^ n - 1) (AlgebraicClosure K) :=
  sorry

theorem fundamentalCharacter_indep (hp : ringChar 𝓀[K] = p) (n : ℕ) (π : 𝒪[K])
    (hπ : Irreducible π) (r : AlgebraicClosure K)
    (hr : r ^ (p ^ n - 1) = algebraMap K _ (π : K)) (σ : inertiaGroup K) :
    (((fundamentalCharacter K p n σ : (AlgebraicClosure K)ˣ) : AlgebraicClosure K)) * r =
      (σ : Field.absoluteGaloisGroup K) • r := by sorry

/-- The norm relation `θ_{p^{nm}−1}^{(p^{nm}−1)/(p^n−1)} = θ_{p^n−1}` for `n, m ≥ 1` (for `m = 0`
the left side is `1`). -/
theorem fundamentalCharacter_norm (hp : ringChar 𝓀[K] = p) (n m : ℕ) (hn : 0 < n) (hm : 0 < m)
    (σ : inertiaGroup K) :
    (fundamentalCharacter K p (n * m) σ : (AlgebraicClosure K)ˣ) ^
        ((p ^ (n * m) - 1) / (p ^ n - 1)) =
      (fundamentalCharacter K p n σ : (AlgebraicClosure K)ˣ) := by sorry

theorem fundamentalCharacter_conj (hp : ringChar 𝓀[K] = p) (n : ℕ) (hn : 0 < n)
    (σ : inertiaGroup K)
    (h : arithFrobLift K * (σ : Field.absoluteGaloisGroup K) * (arithFrobLift K)⁻¹ ∈
      inertiaGroup K) :
    fundamentalCharacter K p n ⟨_, h⟩ = fundamentalCharacter K p n σ ^ Nat.card 𝓀[K] := by sorry

/-- A character `χ : I_K → k₁^×` (`k₁` of characteristic `p`) is fundamental of level `n ≥ 1` if
it is `θ_{p^n−1}` followed by the reduction `μ_{p^n−1}(K̄) ≅ F_{p^n}^×` and an embedding
`F_{p^n} ↪ k₁`. Here `B` is the subring of `K̄` generated by the `(p^n − 1)`-th roots of unity, and
`χ = φ ∘ θ_{p^n−1}` for a ring homomorphism `φ : B → k₁` that vanishes on the non-units of
`𝒪_{K̄}` lying in `B` (the `x` whose inverse is not integral over `𝒪[K]`): these form a maximal
ideal of `B` with residue field `F_{p^n}`, so `φ` is the reduction followed by an embedding of
`F_{p^n}`. Without the vanishing condition `φ` could factor through another prime of `B` above `p`
and give `θ^j` for any `j` prime to `p^n − 1`; a ring homomorphism from the whole integral closure
of `𝒪[K]` in `K̄` would need an embedding of `k̄` into `k₁`, which no finite `k₁` has. -/
def IsFundamentalOfLevel (k₁ : Type*) [Field k₁] [CharP k₁ p] (χ : inertiaGroup K →* k₁ˣ)
    (n : ℕ) : Prop :=
  0 < n ∧ ∃ φ : Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1} →+* k₁,
    (∀ x : Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1},
      ¬ IsIntegral 𝒪[K] ((x : AlgebraicClosure K)⁻¹) → φ x = 0) ∧
    ∀ σ (h : ((fundamentalCharacter K p n σ : (AlgebraicClosure K)ˣ) : AlgebraicClosure K) ∈
      Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1}), (χ σ : k₁) = φ ⟨_, h⟩

/-- The level of a character of `I_t` of finite order prime to `p`: the least `n ≥ 1` such that
it factors through `θ_{p^n−1}`. -/
def level (k₁ : Type*) [Field k₁] (χ : inertiaGroup K →* k₁ˣ) : ℕ :=
  sInf {n | 0 < n ∧ ∃ f : rootsOfUnity (p ^ n - 1) (AlgebraicClosure K) →* k₁ˣ,
    χ = f.comp (fundamentalCharacter K p n)}

theorem level_dvd_iff_factors (hp : ringChar 𝓀[K] = p) (k₁ : Type*) [Field k₁]
    (χ : inertiaGroup K →* k₁ˣ) (m : ℕ) (hm : 0 < m) :
    level K p k₁ χ ∣ m ↔ ∃ f : rootsOfUnity (p ^ m - 1) (AlgebraicClosure K) →* k₁ˣ,
      χ = f.comp (fundamentalCharacter K p m) := by sorry

/- TauCeti.GaloisRep.fundamentalCharacter_one_eq_cyclotomic: θ_{p−1}^{e(K/Q_p)} = χ̄_p|_{I_K}.
(Comment-block fallback: comparing μ_{p−1}(K̄) with F_p^× needs the reduction map of 𝒪_{K̄} and the
absolute ramification index, LocalFieldsRamification data.) -/

/-- For `K = ℚ_p`: `ω₂ · ω₂^p = ω` (stated for every `K`, where it is the norm relation from
level 2 to level 1). -/
theorem fundamentalCharacter_two_mul_pow (hp : ringChar 𝓀[K] = p) (σ : inertiaGroup K) :
    (fundamentalCharacter K p 2 σ : (AlgebraicClosure K)ˣ) *
        (fundamentalCharacter K p 2 σ : (AlgebraicClosure K)ˣ) ^ p =
      (fundamentalCharacter K p 1 σ : (AlgebraicClosure K)ˣ) := by sorry

/- TauCeti.GaloisRep.fundamentalCharacter_restrict: for L/K finite with ramification index e, θ^K
restricted along I_{t,L} → I_{t,K} is (θ^L)^e. (Comment-block fallback: as for
tameCharacter_restrict, the values live in μ(K̄) and μ(L̄).) -/

/-- The Teichmüller lift `[θ_{p^n−1}] : I_K → μ_{p^n−1}(W(F_{p^n})) ⊂ W(F_{p^n})^×` (the unit
group of the Witt vectors is larger than the roots of unity), a declaration distinct from
`θ_{p^n−1}` itself. In the packet the target is `𝒪[K_n]ˣ` for the unramified extension `K_n` of
`ℚ_p` with residue field `F_{p^n}` (`TauCeti.teichmuller`); it is typed here with Mathlib's Witt
vectors `W(F_{p^n}) = 𝒪[K_n]`, an identification that is not in the libraries. -/
def teichmullerFundamentalCharacter (n : ℕ) :
    inertiaGroup K →* (WittVector p (GaloisField p n))ˣ := sorry

/-- Unit test: TauCeti.GaloisRep.fundamentalCharacter_two_mul_conj. -/
example (hp : ringChar 𝓀[K] = p) (σ : inertiaGroup K) :
    (fundamentalCharacter K p 2 σ : (AlgebraicClosure K)ˣ) ^ (p + 1) =
      (fundamentalCharacter K p 1 σ : (AlgebraicClosure K)ˣ) := by sorry

/-- Unit test: TauCeti.GaloisRep.level_trivial. -/
example (k₁ : Type*) [Field k₁] : level K p k₁ 1 = 1 := by sorry

/-- Unit test: TauCeti.GaloisRep.fundamentalCharacter_two_not_extend. -/
example (hp : ringChar 𝓀[K] = p) (hk : Nat.card 𝓀[K] = p) :
    ¬ ∃ χ : Field.absoluteGaloisGroup K →* (AlgebraicClosure K)ˣ,
      ∀ σ : inertiaGroup K, χ σ = fundamentalCharacter K p 2 σ := by sorry

/- TauCeti.GaloisRep.fundamentalCharacter_one_Qp: for K = Q_p, θ_{p−1} = χ̄_p|_{I_{Q_p}}.
(Comment-block fallback, as for fundamentalCharacter_one_eq_cyclotomic.) -/

/- TauCeti.GaloisRep.fundamentalCharacter_teichmuller: reducing [θ_{p^n−1}] modulo p gives
θ_{p^n−1} (TauCeti.residue_teichmuller). (Comment-block fallback: TauCeti.residue_teichmuller and
the identification μ_{p^n−1}(K̄) ≅ F_{p^n}^× are outside the Mathlib-only build.) -/

end Fundamental

/-- Semisimplicity of a representation: every invariant subspace has an invariant complement. -/
def IsSemisimpleRep {k G V : Type*} [Field k] [Group G] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : Prop :=
  ∀ U : Submodule k V, (∀ g, U ≤ U.comap (ρ g)) →
    ∃ U' : Submodule k V, IsCompl U U' ∧ ∀ g, U' ≤ U'.comap (ρ g)

/-! ### Semisimple residual local representations are tame; levels and induced representations in dimension two (ArithmeticGaloisRepresentations:R01.2/tame-semisimple-residual-local-representations) -/

/-- ArithmeticGaloisRepresentations:R01.2/tame-semisimple-residual-local-representations, part
(a): a semisimple residual representation (coefficients of characteristic `p`, the residue
characteristic) is tamely ramified, and inertia acts through a cyclic group of order prime to `p`.
Parts (b)–(d) (levels and inductions in dimension two over `ℚ_p`) are not restated; in (d), for
`(p + 1) ∣ j` the induced representation is `χ̃ ⊗ Ind 1`, which is `χ̃ ⊕ χ̃η` for odd `p` and a
non-split self-extension of `χ̃` for `p = 2`. -/
theorem tame_of_semisimple_residual (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime] (hp : ringChar 𝓀[K] = p)
    (k₁ : Type*) [Field k₁] [CharP k₁ p] [TopologicalSpace k₁] [DiscreteTopology k₁]
    {V : Type*} [AddCommGroup V] [Module k₁ V] [Module.Finite k₁ V] [TopologicalSpace V]
    [IsModuleTopology k₁ V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) k₁ V)
    (hρ : IsSemisimpleRep ρ.toRepresentation) :
    IsTamelyRamified ρ ∧
      (∃ g₀ ∈ inertiaGroup K, ∀ σ ∈ inertiaGroup K, ∃ n : ℕ, ρ σ = ρ g₀ ^ n) ∧
      ∃ m : ℕ, 0 < m ∧ m.Coprime p ∧ ∀ σ ∈ inertiaGroup K, ρ σ ^ m = 1 := by sorry

/-! ### The exponential of nilpotent elements and the logarithm of unipotent elements are inverse to each other (ArithmeticGaloisRepresentations:R01.2/nilpotent-exponential-and-unipotent-logarithm) -/

section UnipotentLog

variable {A : Type*} [Ring A] [Algebra ℚ A]

/-- The logarithm `log u = Σ_{i ≥ 1} (−1)^{i+1} (u − 1)^i / i` of a unipotent element, a finite sum
when `u − 1` is nilpotent. Mathlib has `IsNilpotent.exp` and no logarithm. -/
def _root_.TauCeti.IsUnipotent.log (u : A) : A :=
  ∑ i ∈ Finset.range (nilpotencyClass (u - 1)),
    ((-1 : ℚ) ^ i / ((i : ℚ) + 1)) • (u - 1) ^ (i + 1)

/-- (i): the logarithm of a unipotent element is nilpotent (the other half, `exp N − 1` nilpotent,
is Mathlib's `IsNilpotent.isNilpotent_exp_sub_one`). -/
theorem _root_.TauCeti.IsUnipotent.isNilpotent_log {u : A} (hu : IsNilpotent (u - 1)) :
    IsNilpotent (TauCeti.IsUnipotent.log u) := by sorry

/-- (ii), first half: `log (exp N) = N` for nilpotent `N`. -/
theorem _root_.TauCeti.IsUnipotent.log_exp {N : A} (hN : IsNilpotent N) :
    TauCeti.IsUnipotent.log (IsNilpotent.exp N) = N := by sorry

/-- (ii), second half: `exp (log u) = u` for unipotent `u`. -/
theorem _root_.TauCeti.IsUnipotent.exp_log {u : A} (hu : IsNilpotent (u - 1)) :
    IsNilpotent.exp (TauCeti.IsUnipotent.log u) = u := by sorry

/-- (ii): `exp` is injective on nilpotent elements. -/
theorem _root_.TauCeti.IsUnipotent.exp_injOn :
    Set.InjOn (IsNilpotent.exp : A → A) {N | IsNilpotent N} := by sorry

/-- (iii): `log` commutes with ring homomorphisms of `ℚ`-algebras (in particular with conjugation
by a unit); for `exp` this is Mathlib's `IsNilpotent.map_exp`. -/
theorem _root_.TauCeti.IsUnipotent.map_log {B : Type*} [Ring B] [Algebra ℚ B] (f : A →+* B)
    {u : A} (hu : IsNilpotent (u - 1)) :
    f (TauCeti.IsUnipotent.log u) = TauCeti.IsUnipotent.log (f u) := by sorry

/-- (iv): `log (u ^ m) = m • log u`, for `m ∈ ℕ`. Not stated here: the case `m ∈ ℤ` and
`exp (m • N) = exp N ^ m`. -/
theorem _root_.TauCeti.IsUnipotent.log_pow {u : A} (hu : IsNilpotent (u - 1)) (m : ℕ) :
    TauCeti.IsUnipotent.log (u ^ m) = (m : ℚ) • TauCeti.IsUnipotent.log u := by sorry

/-- (iv): the unipotent `m`-th root of a unipotent element is unique and equals
`exp (m⁻¹ • log u)`, a polynomial in `u`. -/
theorem _root_.TauCeti.IsUnipotent.eq_exp_of_pow_eq {u v : A} (hu : IsNilpotent (u - 1))
    (hv : IsNilpotent (v - 1)) (m : ℕ) (hm : 0 < m) (h : v ^ m = u) :
    v = IsNilpotent.exp ((m : ℚ)⁻¹ • TauCeti.IsUnipotent.log u) := by sorry

/-- (v), stated for matrices over `ℚ_ℓ` (the node allows a finite extension `E` of `ℚ_ℓ` and
`GL(V)`): a continuous homomorphism `h : ℤ_ℓ → GL_n(ℚ_ℓ)` with `h(1)` unipotent is
`x ↦ exp (x • log h(1))`. -/
theorem _root_.TauCeti.IsUnipotent.apply_eq_exp_smul_log (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (h : Multiplicative ℤ_[ℓ] →* Matrix (Fin n) (Fin n) ℚ_[ℓ]) (hc : Continuous h)
    (hu : IsNilpotent (h (Multiplicative.ofAdd 1) - 1)) (x : ℤ_[ℓ]) :
    h (Multiplicative.ofAdd x) =
      IsNilpotent.exp ((x : ℚ_[ℓ]) • TauCeti.IsUnipotent.log (h (Multiplicative.ofAdd 1))) := by
  sorry

end UnipotentLog

/-! ### Grothendieck's ℓ-adic monodromy theorem (arithmetic quasi-unipotence) (ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence) -/

/-- ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence (stated for continuous
representations of `G_K`; the Weil-group form is the same with `W_K`): there are a nilpotent `N`
and a subgroup `J` of `I_K`, open in `I_K`, with `ρ(σ) = exp(t(σ) N)` on `J`, where `t = T ∘ t_ℓ`,
and `ρ(w) N ρ(w)⁻¹ = χ_ℓ(w) N`. `E` carries its `ℓ`-adic topology (`IsModuleTopology ℚ_ℓ E`):
for another topology on `E` the statement is false. `J` is open in the subspace topology of `I_K`;
no subgroup of `I_K` is open in `G_K`. Only finite residue fields are treated (the general
hypothesis of Serre–Tate is not). -/
theorem grothendieck_quasiUnipotent (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0)
    (T : rootsOfUnityTateModule (AlgebraicClosure K) ℓ ≃* Multiplicative ℤ_[ℓ])
    {E : Type*} [Field E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [IsModuleTopology ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) :
    ∃ N : Module.End E V, IsNilpotent N ∧
      (∀ w, ρ w ∘ₗ N =
        algebraMap ℚ_[ℓ] E ((cyclotomicCharacter K ℓ w : ℤ_[ℓ]) : ℚ_[ℓ]) • (N ∘ₗ ρ w)) ∧
      ∃ J : Subgroup (inertiaGroup K), IsOpen (J : Set (inertiaGroup K)) ∧ ∀ σ ∈ J,
          ρ (σ : Field.absoluteGaloisGroup K) = ∑ i ∈ Finset.range (Module.finrank E V),
            ((i.factorial : E)⁻¹ * (algebraMap ℚ_[ℓ] E
              ((Multiplicative.toAdd (tameCharacterTriv K ℓ T σ) : ℤ_[ℓ]) : ℚ_[ℓ])) ^ i) •
              N ^ i := by
  sorry

/-- Uniqueness in ArithmeticGaloisRepresentations:R01.2/grothendieck-quasi-unipotence: two
nilpotent endomorphisms that both express `ρ` on open subgroups of `I_K` are equal. -/
theorem grothendieck_quasiUnipotent_unique (K : Type*) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[K]) ≠ 0)
    (T : rootsOfUnityTateModule (AlgebraicClosure K) ℓ ≃* Multiplicative ℤ_[ℓ])
    {E : Type*} [Field E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [IsModuleTopology ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V)
    (N N' : Module.End E V) (hN : IsNilpotent N) (hN' : IsNilpotent N')
    (J J' : Subgroup (inertiaGroup K)) (hJ : IsOpen (J : Set (inertiaGroup K)))
    (hJ' : IsOpen (J' : Set (inertiaGroup K)))
    (h : ∀ σ ∈ J, ρ (σ : Field.absoluteGaloisGroup K) =
      ∑ i ∈ Finset.range (Module.finrank E V), ((i.factorial : E)⁻¹ * (algebraMap ℚ_[ℓ] E
        ((Multiplicative.toAdd (tameCharacterTriv K ℓ T σ) : ℤ_[ℓ]) : ℚ_[ℓ])) ^ i) • N ^ i)
    (h' : ∀ σ ∈ J', ρ (σ : Field.absoluteGaloisGroup K) =
      ∑ i ∈ Finset.range (Module.finrank E V), ((i.factorial : E)⁻¹ * (algebraMap ℚ_[ℓ] E
        ((Multiplicative.toAdd (tameCharacterTriv K ℓ T σ) : ℤ_[ℓ]) : ℚ_[ℓ])) ^ i) • N' ^ i) :
    N = N' := by
  sorry

end GaloisRep


/-! ### Weil–Deligne representations of a local Weil group (arithmetic normalisation) (ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation) -/

/- The main declaration `TauCeti.WeilDeligneRep` is the preamble's structure. -/

namespace WeilDeligneRep

section Basic

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {Ω : Type*} [Field Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
  {V' : Type*} [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']

/-- Morphisms of Weil–Deligne representations: linear maps commuting with `r` and `N`. -/
structure Hom (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') where
  /-- The underlying linear map. -/
  toLinearMap : V →ₗ[Ω] V'
  /-- Equivariance for the Weil group. -/
  comm_r : ∀ w, toLinearMap ∘ₗ D.r w = D'.r w ∘ₗ toLinearMap
  /-- Compatibility with the monodromy operators. -/
  comm_N : toLinearMap ∘ₗ D.N = D'.N ∘ₗ toLinearMap

/-- Isomorphisms of Weil–Deligne representations. -/
structure Iso (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') where
  /-- The underlying linear equivalence. -/
  toLinearEquiv : V ≃ₗ[Ω] V'
  /-- Equivariance for the Weil group. -/
  comm_r : ∀ w, (toLinearEquiv : V →ₗ[Ω] V') ∘ₗ D.r w = D'.r w ∘ₗ toLinearEquiv
  /-- Compatibility with the monodromy operators. -/
  comm_N : (toLinearEquiv : V →ₗ[Ω] V') ∘ₗ D.N = D'.N ∘ₗ toLinearEquiv

theorem conj_monodromy_arith (D : WeilDeligneRep W deg q Ω V) (Φ : W)
    (hΦ : deg Φ = Multiplicative.ofAdd 1) :
    D.r Φ ∘ₗ D.N ∘ₗ D.r Φ⁻¹ = (q : Ω) • D.N := by sorry

theorem conj_monodromy_geom (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    D.r F ∘ₗ D.N ∘ₗ D.r F⁻¹ = (q : Ω)⁻¹ • D.N := by sorry

/-- Tensor product `(r ⊗ r', N ⊗ 1 + 1 ⊗ N')`. -/
def tensor (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') :
    WeilDeligneRep W deg q Ω (V ⊗[Ω] V') where
  r := D.r.tprod D'.r
  isOpen_ker := sorry
  N := TensorProduct.map D.N LinearMap.id + TensorProduct.map LinearMap.id D'.N
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- Direct sum `(r ⊕ r', N ⊕ N')`. -/
def prod (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') :
    WeilDeligneRep W deg q Ω (V × V') where
  r := { toFun := fun w => LinearMap.prodMap (D.r w) (D'.r w), map_one' := sorry,
         map_mul' := sorry }
  isOpen_ker := sorry
  N := LinearMap.prodMap D.N D'.N
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- Dual `(r^∨, −N^∨)`. -/
def dual (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω (Module.Dual Ω V) where
  r := D.r.dual
  isOpen_ker := sorry
  N := -D.N.dualMap
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- Determinant `(det r, 0)` on `Ω`. -/
def det (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω Ω where
  r := { toFun := fun w => LinearMap.det (D.r w) • LinearMap.id, map_one' := sorry,
         map_mul' := sorry }
  isOpen_ker := sorry
  N := 0
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- The one-dimensional Weil–Deligne representation `(χ, 0)` of a character with open kernel. -/
def ofCharacter (χ : W →* Ωˣ) (hχ : IsOpen {w | χ w = 1}) : WeilDeligneRep W deg q Ω Ω where
  r := { toFun := fun w => (χ w : Ω) • LinearMap.id, map_one' := sorry, map_mul' := sorry }
  isOpen_ker := sorry
  N := 0
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- Twist `(r ⊗ χ, N)` by a character `χ : W → Ω^×` with open kernel. -/
def twist (D : WeilDeligneRep W deg q Ω V) (χ : W →* Ωˣ) (hχ : IsOpen {w | χ w = 1}) :
    WeilDeligneRep W deg q Ω V where
  r := { toFun := fun w => (χ w : Ω) • D.r w, map_one' := sorry, map_mul' := sorry }
  isOpen_ker := sorry
  N := D.N
  isNilpotent_N := D.isNilpotent_N
  conj_monodromy := sorry

variable (deg) in
/-- The unramified character `ω(w) = q^{deg w}` (`ω(Φ) = q` for arithmetic `Φ`), Deligne's `ω₁`. -/
def omega (hq : (q : Ω) ≠ 0) : W →* Ωˣ :=
  (zpowersHom Ωˣ (Units.mk0 (q : Ω) hq)).comp deg

/-- The special representation `Sp(n)`: basis `e_0, …, e_{n−1}`, `r(w) e_i = ω(w)^i e_i`,
`N e_i = e_{i+1}`, `N e_{n−1} = 0`. -/
def special (n : ℕ) (hq : (q : Ω) ≠ 0) : WeilDeligneRep W deg q Ω (Fin n → Ω) := sorry

theorem special_dual (n : ℕ) (hq : (q : Ω) ≠ 0) (h) :
    Nonempty (Iso (dual (special (W := W) (deg := deg) n hq))
      (twist (special n hq) (omega deg hq ^ (1 - (n : ℤ))) h)) := by sorry

/-- Restriction to `W_L` along `φ : W_L → W_K`, with `deg_K ∘ φ = f · deg_L` and `q_L = q^f`. -/
def restrict {W' : Type*} [Group W'] [TopologicalSpace W'] {deg' : W' →* Multiplicative ℤ}
    (D : WeilDeligneRep W deg q Ω V) (φ : W' →ₜ* W) (f : ℕ)
    (hdeg : ∀ w, deg (φ w) = deg' w ^ f) : WeilDeligneRep W' deg' (q ^ f) Ω V where
  r := D.r.comp φ.toMonoidHom
  isOpen_ker := sorry
  N := D.N
  isNilpotent_N := D.isNilpotent_N
  conj_monodromy := sorry

/-- Induction from `W_L` (index `m`), realised on `V^m` through a choice of coset
representatives `g_i`. The monodromy is `N_Ind(g ⊗ v) = q^{−deg g} • (g ⊗ N v)`, i.e. on the summand
of `g_i` it is `q^{−deg g_i} N`, not `N`: the plain coset-wise operator does not satisfy the
relation unless the representatives have degree `0`. -/
def induced {W' : Type*} [Group W'] [TopologicalSpace W'] {deg' : W' →* Multiplicative ℤ} {q' : ℕ}
    (φ : W' →ₜ* W) (m : ℕ) (hm : φ.toMonoidHom.range.index = m)
    (D : WeilDeligneRep W' deg' q' Ω V) : WeilDeligneRep W deg q Ω (Fin m → V) := sorry

/-- `(V, r, aN)` for `a ≠ 0`. -/
def smulMonodromy (D : WeilDeligneRep W deg q Ω V) (a : Ω) (ha : a ≠ 0) :
    WeilDeligneRep W deg q Ω V where
  r := D.r
  isOpen_ker := D.isOpen_ker
  N := a • D.N
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- `(V, r, N) ≅ (V, r, aN)` for `a ≠ 0`: the lemma
ArithmeticGaloisRepresentations:R01.2/rescaling-the-monodromy-operator (`rescaling_monodromy`
below). The hypotheses are those of a local Weil group that the proof uses: characteristic `0`,
`q ≥ 2`, and finite image of inertia (`ker deg`); without them the statement is false on this
abstract structure (for `q = 1` and `r(F) = 1 + N` nothing commuting with `r` rescales `N`). -/
theorem iso_smul_monodromy [CharZero Ω] (hq : 1 < q) (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (a : Ω) (ha : a ≠ 0) :
    Nonempty (Iso D (D.smulMonodromy a ha)) := by sorry

/-- The inertial type: `r|_{I_K}` (`I_K = ker deg`), up to isomorphism. -/
def inertialType (D : WeilDeligneRep W deg q Ω V) : Representation Ω deg.ker V :=
  D.r.comp deg.ker.subtype

/-- Coefficient extension along `Ω → Ω'`. -/
def baseChange (Ω' : Type*) [Field Ω'] [Algebra Ω Ω'] (D : WeilDeligneRep W deg q Ω V) :
    WeilDeligneRep W deg q Ω' (Ω' ⊗[Ω] V) where
  r := { toFun := fun w => (D.r w).baseChange Ω', map_one' := sorry, map_mul' := sorry }
  isOpen_ker := sorry
  N := D.N.baseChange Ω'
  isNilpotent_N := sorry
  conj_monodromy := sorry

/-- Unit test: TauCeti.WeilDeligneRep.special_two_relation. -/
example (hq : (q : Ω) ≠ 0) (Φ : W) (hΦ : deg Φ = Multiplicative.ofAdd 1) :
    (special (W := W) (deg := deg) 2 hq).r Φ ∘ₗ (special (W := W) (deg := deg) 2 hq).N ∘ₗ
      (special (W := W) (deg := deg) 2 hq).r Φ⁻¹ =
        (q : Ω) • (special (W := W) (deg := deg) 2 hq).N := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.geometric_copy_fails. The two sides are `N` and `q² N`, so
the hypothesis is `q² ≠ 1` in `Ω` (`Ω` is an arbitrary field in this section; `q ≠ 1` would allow
`q = −1`, e.g. `Ω = 𝔽₃`, `q = 2`). -/
example (hq : (q : Ω) ≠ 0) (hq1 : (q : Ω) ^ 2 ≠ 1) (Φ : W) (hΦ : deg Φ = Multiplicative.ofAdd 1) :
    Matrix.toLin' (Matrix.diagonal ![((omega deg hq Φ : Ωˣ) : Ω), 1]) ∘ₗ
        Matrix.toLin' !![(0 : Ω), 0; 1, 0] ≠
      (q : Ω) • (Matrix.toLin' !![(0 : Ω), 0; 1, 0] ∘ₗ
        Matrix.toLin' (Matrix.diagonal ![((omega deg hq Φ : Ωˣ) : Ω), 1])) := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.monodromy_zero. -/
example (r : Representation Ω W V) (hr : IsOpen {w | r w = LinearMap.id}) :
    ∃ D : WeilDeligneRep W deg q Ω V, D.r = r ∧ D.N = 0 := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.iso_smul_monodromy_special. -/
example [CharZero Ω] (hq : (q : Ω) ≠ 0) :
    ∃ e : Iso (special (W := W) (deg := deg) 2 hq)
      ((special (W := W) (deg := deg) 2 hq).smulMonodromy 2 two_ne_zero),
      (e.toLinearEquiv : (Fin 2 → Ω) →ₗ[Ω] (Fin 2 → Ω)) = Matrix.toLin' (Matrix.diagonal ![1, 2]) := by
  sorry

/-- Unit test: TauCeti.WeilDeligneRep.dual_special_two. -/
example (hq : (q : Ω) ≠ 0) (h) :
    Nonempty (Iso (dual (special (W := W) (deg := deg) 2 hq))
      (twist (special 2 hq) (omega deg hq)⁻¹ h)) ∧
    ∀ w, LinearMap.det ((special (W := W) (deg := deg) 2 hq).r w) = omega deg hq w := by sorry

end Basic

/-! ### Rescaling the monodromy operator: (V, r, N) ≅ (V, r, aN) for a ≠ 0 (ArithmeticGaloisRepresentations:R01.2/rescaling-the-monodromy-operator) -/

/-- ArithmeticGaloisRepresentations:R01.2/rescaling-the-monodromy-operator (Deligne, proof of
Lemme 8.4.3): for `a ≠ 0` there is an automorphism `A` of `V` commuting with `r(W)` such that
`A ∘ N = (aN) ∘ A`. Hypotheses of a local Weil group used by the proof: characteristic `0`,
`q ≥ 2`, finite image of inertia. `A` is a scalar on each primary component of a central power of
Frobenius. -/
theorem rescaling_monodromy {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} {Ω : Type*} [Field Ω] [CharZero Ω]
    {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V] (hq : 1 < q)
    (D : WeilDeligneRep W deg q Ω V) (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite)
    (a : Ω) (ha : a ≠ 0) :
    ∃ A : V ≃ₗ[Ω] V, (∀ w, (A : V →ₗ[Ω] V) ∘ₗ D.r w = D.r w ∘ₗ (A : V →ₗ[Ω] V)) ∧
      (A : V →ₗ[Ω] V) ∘ₗ D.N = (a • D.N) ∘ₗ (A : V →ₗ[Ω] V) := by sorry

/-! ### The Weil–Deligne representation of an ℓ-adic representation and its independence of choices (ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor) -/

section OfEllAdic

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E]
  {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V]

/-- The exponential `exp(N) = Σ N^i/i!` of a nilpotent endomorphism (a finite sum). -/
def expNilpotent {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [Module.Finite E V]
    (N : Module.End E V) : Module.End E V :=
  ∑ i ∈ Finset.range (Module.finrank E V + 1), (i.factorial : E)⁻¹ • N ^ i

/-- The properties of `(W_K, weilDegree, q_K, T ∘ t_ℓ)` that the construction of Deligne 8.4 uses,
as hypotheses on the abstract carrier `(W, deg, q)` and on `t : ker deg → ℤ_ℓ`: `q ≥ 2`; inertia
`ker deg` is open in `W` and compact; `t` is continuous and surjective; `t(w σ w⁻¹) = q^{deg w} t(σ)`
(R01.2/ell-adic-tame-character (iii); in particular `q` is an `ℓ`-adic unit); and every homomorphism
with open kernel from an open subgroup `J` of inertia to a finite `ℓ`-group factors through `t|_J`
(the same node, (iv)). They hold for `W = W_K` with the Weil topology and `t = T ∘ t_ℓ`, `ℓ ≠ p`,
and they are what the proof of quasi-unipotence and of 8.4.2–8.4.3 uses. Without them the
statements below are false: for `W = ℤ_ℓ × ℤ`, `deg` the second projection, `t = 1` and
`ρ(x, n) = exp(x N₀)` with `N₀ ≠ 0` nilpotent, no nilpotent `N'` has `ρ = exp(t N')` on an open
subgroup of `ker deg`. -/
structure IsTameCharacter (deg : W →* Multiplicative ℤ) (q : ℕ)
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) : Prop where
  /-- The residue cardinality is at least `2`. -/
  one_lt : 1 < q
  /-- Inertia is open in the Weil group. -/
  isOpen_ker : IsOpen (deg.ker : Set W)
  /-- Inertia is compact. -/
  isCompact_ker : IsCompact (deg.ker : Set W)
  /-- `t` is continuous. -/
  continuous : Continuous t
  /-- `t` is surjective. -/
  surjective : Function.Surjective t
  /-- Equivariance: `t(w σ w⁻¹) = q^{deg w} t(σ)` (in `ℚ_ℓ`). -/
  conj : ∀ (w : W) (σ : deg.ker) (h : w * σ * w⁻¹ ∈ deg.ker),
    ((Multiplicative.toAdd (t ⟨w * σ * w⁻¹, h⟩) : ℤ_[ℓ]) : ℚ_[ℓ]) =
      (q : ℚ_[ℓ]) ^ Multiplicative.toAdd (deg w) *
        ((Multiplicative.toAdd (t σ) : ℤ_[ℓ]) : ℚ_[ℓ])
  /-- Homomorphisms with open kernel from open subgroups of inertia to finite `ℓ`-groups factor
  through `t`. -/
  factors : ∀ J : Subgroup deg.ker, IsOpen (J : Set deg.ker) →
    ∀ (P : Type) [Group P] [Finite P], IsPGroup ℓ P → ∀ f : J →* P,
      IsOpen (f.ker : Set J) → (t.comp J.subtype).ker ≤ f.ker

/-- `WD_{F,T}(ρ) = (V, ρ', N')` for a continuous `ℓ`-adic representation `ρ` of the Weil group,
a geometric Frobenius lift `F` and `t = T ∘ t_ℓ : I_K → ℤ_ℓ` (a trivialisation `T` of `ℤ_ℓ(1)`);
`ρ'(F^n σ) = ρ(F^n σ) exp(−t(σ) N)` (Deligne 8.4.2). The construction is made for `E` finite over
`ℚ_ℓ` with its `ℓ`-adic topology and for `t` satisfying `IsTameCharacter deg q t`; every statement
about it below carries these hypotheses. -/
def ofEllAdic (ρ : ContinuousRep W E V) (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) : WeilDeligneRep W deg q E V := sorry

variable [CharZero E] [FiniteDimensional ℚ_[ℓ] E] [IsModuleTopology ℚ_[ℓ] E]

/-- The monodromy of `WD_{F,T}(ρ)` is `T(N)`: the nilpotent `N'` with `ρ(σ) = exp(t(σ) N')` on
an open subgroup of inertia. -/
theorem ofEllAdic_monodromy (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    ∃ J : Subgroup deg.ker, IsOpen (J : Set deg.ker) ∧ ∀ σ ∈ J,
      ρ σ = expNilpotent (algebraMap ℚ_[ℓ] E ((Multiplicative.toAdd (t σ) : ℤ_[ℓ]) : ℚ_[ℓ]) •
        (ofEllAdic (q := q) ρ F hF t).N) := by sorry

/-- Change of the geometric Frobenius lift `F ↦ Fτ` (`τ ∈ I_K`): `ρ'_{Fτ} = A ρ'_F A⁻¹` with
`A = exp((q − 1)⁻¹ t(τ) N)`, i.e. `A` is an isomorphism `WD_{F,T}(ρ) → WD_{Fτ,T}(ρ)`. (For `F ↦ τF`
the constant is `(1 − q⁻¹)⁻¹`, the one printed in Deligne's proof of Lemme 8.4.3 for `Fτ`.) -/
theorem ofEllAdic_iso_frobenius (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) (τ : deg.ker)
    (hFτ : deg (F * τ) = Multiplicative.ofAdd (-1)) :
    ∃ e : Iso (ofEllAdic (q := q) ρ F hF t) (ofEllAdic (q := q) ρ (F * τ) hFτ t),
      (e.toLinearEquiv : V →ₗ[E] V) =
        expNilpotent ((((q : E) - 1)⁻¹ *
          algebraMap ℚ_[ℓ] E ((Multiplicative.toAdd (t τ) : ℤ_[ℓ]) : ℚ_[ℓ])) •
            (ofEllAdic (q := q) ρ F hF t).N) := by sorry

/-- Change of the trivialisation: `t' = a·t` gives an isomorphic Weil–Deligne representation
(`ρ'` is unchanged and `N'` is multiplied by `a⁻¹`, because `exp(t'(σ) N')` must remain `ρ(σ)`;
the isomorphism is `rescaling_monodromy`). The trivialised tame characters are `ℤ_ℓ`-valued here,
so `a ∈ ℤ_ℓˣ`; in the packet `T : ℚ_ℓ(1) ≅ ℚ_ℓ` and `a ∈ ℚ_ℓˣ`. -/
theorem ofEllAdic_iso_triv (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t t' : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) (a : ℤ_[ℓ]ˣ) (ht : ∀ σ, Multiplicative.toAdd (t' σ) = a * Multiplicative.toAdd (t σ)) :
    Nonempty (Iso (ofEllAdic (q := q) ρ F hF t') (ofEllAdic (q := q) ρ F hF t)) := by sorry

/-- `WD(ρ ⊗ ρ') ≅ WD(ρ) ⊗ WD(ρ')`, for any continuous representation `σ` identified with
`ρ ⊗ ρ'` by an equivariant isomorphism `e` (duals, det, sums and twists likewise). -/
theorem ofEllAdic_tensor
    {V' : Type*} [AddCommGroup V'] [Module E V'] [Module.Finite E V'] [Module.Projective E V']
    [TopologicalSpace V'] [IsModuleTopology E V']
    {V'' : Type*} [AddCommGroup V''] [Module E V''] [Module.Finite E V''] [Module.Projective E V'']
    [TopologicalSpace V''] [IsModuleTopology E V'']
    (ρ : ContinuousRep W E V) (ρ' : ContinuousRep W E V') (σ : ContinuousRep W E V'')
    (e : V ⊗[E] V' ≃ₗ[E] V'')
    (he : ∀ g, (e : V ⊗[E] V' →ₗ[E] V'') ∘ₗ ρ.toRepresentation.tprod ρ'.toRepresentation g =
      σ g ∘ₗ e)
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    Nonempty (Iso (ofEllAdic (q := q) σ F hF t)
      (tensor (ofEllAdic (q := q) ρ F hF t) (ofEllAdic (q := q) ρ' F hF t))) := by sorry

/- TauCeti.WeilDeligneRep.ofEllAdic_restrict: WD(ρ|_{W_L}) ≅ WD(ρ)|_{W_L}. (Comment-block
fallback: relating the tame characters t_{ℓ,K}|_{I_L} = e·t_{ℓ,L} and the Frobenius lifts of K and L
needs the ramification index and residue degree of L/K as data on the abstract Weil groups.) -/

/- TauCeti.WeilDeligneRep.ofEllAdic_induced: WD(Ind_{W_L}^{W_K} ρ) ≅ Ind WD(ρ). (Comment-block
fallback, as for ofEllAdic_restrict, plus continuous induction from R01.1.) -/

theorem ofEllAdic_invariants (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    {v : V | ∀ σ ∈ deg.ker, ρ σ v = v} =
      {v : V | (ofEllAdic (q := q) ρ F hF t).N v = 0 ∧
        ∀ σ ∈ deg.ker, (ofEllAdic (q := q) ρ F hF t).r σ v = v} := by sorry

theorem ofEllAdic_monodromy_eq_zero_iff (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    ((ofEllAdic (q := q) ρ F hF t).N = 0 ↔ (Set.range fun σ : deg.ker => ρ σ).Finite) ∧
      ((ofEllAdic (q := q) ρ F hF t).N = 0 →
        (ofEllAdic (q := q) ρ F hF t).r = ρ.toRepresentation) := by sorry

theorem ofEllAdic_semisimple (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) (hρ : GaloisRep.IsSemisimpleRep ρ.toRepresentation) :
    (ofEllAdic (q := q) ρ F hF t).N = 0 := by sorry

/-- Deligne 8.3.7/8.4: `ρ ↦ WD(ρ)` is a bijection on isomorphism classes (for `W = W_K` and `t`
the trivialised tame character; what is used of these identifications is the hypothesis `ht`). The
inverse is the node
ArithmeticGaloisRepresentations:R01.2/ell-adic-representation-of-a-weil-deligne-representation
(`existsUnique_ellAdic_of_weilDeligne` below). -/
theorem ofEllAdic_bijective (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) (ht : IsTameCharacter deg q t) :
    (∀ ρ ρ' : ContinuousRep W E V, Nonempty (Iso (ofEllAdic (q := q) ρ F hF t)
        (ofEllAdic (q := q) ρ' F hF t)) → Nonempty (ContinuousRep.Iso ρ ρ')) ∧
      ∀ D : WeilDeligneRep W deg q E V, ∃ ρ : ContinuousRep W E V,
        Nonempty (Iso (ofEllAdic (q := q) ρ F hF t) D) := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.ofEllAdic_cyclotomic. -/
example (χ : W →ₜ* ℚ_[ℓ]ˣ)
    (hχ : ∀ w, (χ w : ℚ_[ℓ]) = (q : ℚ_[ℓ]) ^ Multiplicative.toAdd (deg w)) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    (ofEllAdic (q := q) (ContinuousRep.ofCharacter χ) F hF t).N = 0 ∧
      ∀ w, (ofEllAdic (q := q) (ContinuousRep.ofCharacter χ) F hF t).r w =
        ((q : ℚ_[ℓ]) ^ Multiplicative.toAdd (deg w)) • LinearMap.id := by sorry

/- TauCeti.WeilDeligneRep.ofEllAdic_tateCurve: WD(V_ℓE_q) ≅ Sp(2) for a Tate curve over K, and
≅ Sp(2) ⊗ η for the non-split twist. (Comment-block fallback: the Tate curve's Tate module is
owned by EllipticCurves layer 4 / R01.6.) -/

/-- Unit test: TauCeti.WeilDeligneRep.ofEllAdic_unramified. -/
example (ρ : ContinuousRep W E V) (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) (ht : IsTameCharacter deg q t)
    (hρ : ∀ σ ∈ deg.ker, ρ σ = LinearMap.id) :
    (ofEllAdic (q := q) ρ F hF t).N = 0 ∧
      (ofEllAdic (q := q) ρ F hF t).r = ρ.toRepresentation := by sorry

/- TauCeti.WeilDeligneRep.ofEllAdic_not_semisimplification: WD(V_ℓE_q) is not
WD((V_ℓE_q)^{ss}) = (1 ⊕ ω, 0). (Comment-block fallback, as for ofEllAdic_tateCurve.) -/

/-- Unit test: TauCeti.WeilDeligneRep.ofEllAdic_finite_image. -/
example (ρ : ContinuousRep W E V) (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) (ht : IsTameCharacter deg q t)
    (hfin : (Set.range fun σ : deg.ker => ρ σ).Finite) :
    (ofEllAdic (q := q) ρ F hF t).N = 0 ∧
      (ofEllAdic (q := q) ρ F hF t).r = ρ.toRepresentation := by sorry

end OfEllAdic

/-! ### The ℓ-adic representation of the Weil group attached to a Weil–Deligne representation (ArithmeticGaloisRepresentations:R01.2/ell-adic-representation-of-a-weil-deligne-representation) -/

/-- ArithmeticGaloisRepresentations:R01.2/ell-adic-representation-of-a-weil-deligne-representation:
every Weil–Deligne representation `D = (V, r, N')` over `E` is `WD_{F,T}(ρ)` for exactly one
continuous `ℓ`-adic representation `ρ` of the Weil group (for `W = W_K` and `t = T ∘ t_ℓ`; what is
used of these identifications is the hypothesis `ht`, as for `ofEllAdic`). -/
theorem existsUnique_ellAdic_of_weilDeligne {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E]
    [CharZero E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [IsModuleTopology ℚ_[ℓ] E] {V : Type*} [AddCommGroup V] [Module E V]
    [Module.Finite E V] [Module.Projective E V] [TopologicalSpace V] [IsModuleTopology E V]
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) (D : WeilDeligneRep W deg q E V) :
    ∃! ρ : ContinuousRep W E V, ofEllAdic (q := q) ρ F hF t = D := by sorry

/-- The formula of the same node: `ρ(F^n σ) = r(F^n σ) exp(t(σ) N')`. -/
theorem ellAdic_of_weilDeligne_apply {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E]
    [CharZero E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [IsModuleTopology ℚ_[ℓ] E] {V : Type*} [AddCommGroup V] [Module E V]
    [Module.Finite E V] [Module.Projective E V] [TopologicalSpace V] [IsModuleTopology E V]
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) (D : WeilDeligneRep W deg q E V) (ρ : ContinuousRep W E V)
    (h : ofEllAdic (q := q) ρ F hF t = D) (n : ℤ) (σ : deg.ker) :
    ρ (F ^ n * σ) = D.r (F ^ n * σ) ∘ₗ
      expNilpotent (algebraMap ℚ_[ℓ] E ((Multiplicative.toAdd (t σ) : ℤ_[ℓ]) : ℚ_[ℓ]) • D.N) := by
  sorry

/-! ### Frobenius semisimplification, semisimplification, and the three objects attached to a Weil–Deligne representation (ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification) -/

section FrobeniusSemisimple

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {Ω : Type*} [Field Ω] [CharZero Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
  {V' : Type*} [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']

/-- The Frobenius semisimplification `(V, r^{F-ss}, N)`, `r^{F-ss}(F^n σ) = r(F^n σ) u^{-n}` with
`r(F) = s u` the multiplicative Jordan–Chevalley decomposition (Deligne (8.5.1)). The construction
needs `r(ker deg)` finite (then a power of `r(F)` is central and `u` commutes with `r(W)`); this
holds for a local Weil group, where `ker deg = I_K` is compact, but it is not part of the abstract
structure, in which `ker deg` need not be compact. When `r(ker deg)` is infinite the value is `D`
itself, and the lemmas that are false without finiteness carry the hypothesis `hfin`: for `W = ℤ²`
discrete, `deg` the second projection, `N = 0`, `r(1, 0)` a nontrivial unipotent and `r(0, 1) = 1`,
the unipotent part of `r(F)` depends on the lift `F`. -/
def frobeniusSemisimplification (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) : WeilDeligneRep W deg q Ω V := sorry

theorem frobeniusSemisimplification_indep (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (F F' : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (hF' : deg F' = Multiplicative.ofAdd (-1)) :
    frobeniusSemisimplification D F hF = frobeniusSemisimplification D F' hF' := by sorry

/-- Frobenius-semisimple: `r(w)` is semisimple for every `w ∉ I_K`. -/
def IsFrobeniusSemisimple (D : WeilDeligneRep W deg q Ω V) : Prop :=
  ∀ w, deg w ≠ 1 → Module.End.IsSemisimple (D.r w)

theorem isFrobeniusSemisimple_iff_eq (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsFrobeniusSemisimple D ↔ frobeniusSemisimplification D F hF = D := by sorry

/-- `r^{F-ss}(F)` is the semisimple part of `r(F)`. -/
theorem frobeniusSemisimplification_frob (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    Module.End.IsSemisimple ((frobeniusSemisimplification D F hF).r F) ∧
      ∃ u : Module.End Ω V, IsNilpotent (u - 1) ∧
        Commute ((frobeniusSemisimplification D F hF).r F) u ∧
        D.r F = (frobeniusSemisimplification D F hF).r F * u := by sorry

theorem frobeniusSemisimplification_monodromy (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    (frobeniusSemisimplification D F hF).N = D.N := by sorry

theorem frobeniusSemisimplification_idem (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    frobeniusSemisimplification (frobeniusSemisimplification D F hF) F hF =
        frobeniusSemisimplification D F hF ∧
      (IsFrobeniusSemisimple D → frobeniusSemisimplification D F hF = D) := by sorry

theorem frobeniusSemisimplification_tensor (D : WeilDeligneRep W deg q Ω V)
    (D' : WeilDeligneRep W deg q Ω V') (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite)
    (hfin' : (Set.range fun σ : deg.ker => D'.r σ).Finite) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    frobeniusSemisimplification (tensor D D') F hF =
        tensor (frobeniusSemisimplification D F hF) (frobeniusSemisimplification D' F hF) ∧
      frobeniusSemisimplification (dual D) F hF = dual (frobeniusSemisimplification D F hF) ∧
      frobeniusSemisimplification (prod D D') F hF =
        prod (frobeniusSemisimplification D F hF) (frobeniusSemisimplification D' F hF) := by sorry

/-- The semisimplification `(V^{ss}, r^{ss}, 0)` in `WD_Ω(K)`, realised on `V` (it has the same
dimension), well defined up to isomorphism; its monodromy is `0`. -/
def semisimplification (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω V := sorry

theorem semisimplification_monodromy (D : WeilDeligneRep W deg q Ω V) :
    (semisimplification D).N = 0 ∧ GaloisRep.IsSemisimpleRep (semisimplification D).r := by sorry

theorem charpoly_frobeniusSemisimplification (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    ((frobeniusSemisimplification D F hF).r F).charpoly = (D.r F).charpoly := by sorry

/- TauCeti.WeilDeligneRep.indecomposable_iso_tensor_special: over algebraically closed Ω, an
F-semisimple indecomposable object is r_0 ⊗ Sp(n) with r_0 irreducible. (Comment-block fallback:
the statement quantifies over the carrier type of r_0 and needs indecomposability in the abelian
category WD_Ω(K), which is not built here. The statement is a recorded gap of the packet: none of the
cited sources states it, and its proof is not planned.) -/

/-- Unit test: TauCeti.WeilDeligneRep.frobeniusSemisimplification_jordan. -/
example (D : WeilDeligneRep W deg q Ω (Fin 2 → Ω)) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (hN : D.N = 0)
    (hI : ∀ σ ∈ deg.ker, D.r σ = LinearMap.id) (hr : D.r F = Matrix.toLin' !![1, 1; 0, 1]) :
    ∀ w, (frobeniusSemisimplification D F hF).r w = LinearMap.id := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.frobeniusSemisimplification_special. -/
example (n : ℕ) (hq : (q : Ω) ≠ 0) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsFrobeniusSemisimple (special (W := W) (deg := deg) n hq) ∧
      frobeniusSemisimplification (special n hq) F hF = special n hq := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.special_not_semisimple. -/
example (hq : (q : Ω) ≠ 0) :
    ¬ Nonempty (Iso (special (W := W) (deg := deg) 2 hq) (semisimplification (special 2 hq))) := by
  sorry

/- TauCeti.WeilDeligneRep.three_objects_differ: for Sp(2) ⊕ (unramified Jordan block), the full
object, its Frobenius semisimplification and its semisimplification are pairwise non-isomorphic.
(Comment-block fallback: needs an explicit unramified Jordan-block object on the abstract `W`.) -/

/-- Unit test: TauCeti.WeilDeligneRep.frobeniusSemisimplification_eq_jordanDecomposition. -/
example (D : WeilDeligneRep W deg q Ω V) (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite)
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (s u : Module.End Ω V) (hs : s.IsSemisimple) (hu : IsNilpotent (u - 1)) (hsu : Commute s u)
    (h : D.r F = s * u) : (frobeniusSemisimplification D F hF).r F = s := by sorry

end FrobeniusSemisimple

/-! ### The local Euler factor of a Weil–Deligne or ℓ-adic representation (geometric Frobenius) (ArithmeticGaloisRepresentations:R01.2/local-euler-factor) -/

section LocalFactor

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {Ω : Type*} [Field Ω] [CharZero Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
  {V' : Type*} [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']
  {V'' : Type*} [AddCommGroup V''] [Module Ω V''] [FiniteDimensional Ω V'']

/-- `L(V, X) = det(1 − X r(F) | (ker N)^{r(I_K)})` for a geometric Frobenius lift `F` (`F = Φ⁻¹`
with `Φ` an arithmetic lift, the letter used in the packet). This is the Euler polynomial; Deligne's
`Z(V; t)` is `L(V, t^d)⁻¹`. -/
def localFactor (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) : (Polynomial Ω) := sorry

theorem localFactor_indep (D : WeilDeligneRep W deg q Ω V) (F F' : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (hF' : deg F' = Multiplicative.ofAdd (-1)) :
    localFactor D F hF = localFactor D F' hF' := by sorry

theorem localFactor_directSum (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V')
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor (prod D D') F hF = localFactor D F hF * localFactor D' F hF := by sorry

theorem localFactor_iso (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V')
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    (Nonempty (Iso D D') → localFactor D F hF = localFactor D' F hF) ∧
      localFactor (frobeniusSemisimplification D F hF) F hF = localFactor D F hF := by sorry

theorem localFactor_unramified_twist (D : WeilDeligneRep W deg q Ω V) (α : Ωˣ) (h)
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor (twist D (GaloisRep.weilUnramifiedCharacter deg α) h) F hF =
      (localFactor D F hF).comp (C ((α⁻¹ : Ωˣ) : Ω) * X) := by sorry

/-- On short exact sequences `0 → D' → D → D'' → 0` with `N = 0`, `L` is multiplicative: taking
invariants under the finite group `r(ker deg)` is exact in characteristic `0`. Finiteness of
`r(ker deg)` is a hypothesis on the abstract carrier (see `frobeniusSemisimplification`); without
it, `W = ℤ²` with `r(1, 0)` a unipotent Jordan block on `Ω²` and `r(0, 1) = 1` has
`L(D) = 1 − X` and `L(D') L(D'') = (1 − X)²`. -/
theorem localFactor_exact_monodromy_zero (D' : WeilDeligneRep W deg q Ω V')
    (D : WeilDeligneRep W deg q Ω V) (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite)
    (D'' : WeilDeligneRep W deg q Ω V'')
    (f : Hom D' D) (g : Hom D D'') (hf : Function.Injective f.toLinearMap)
    (hg : Function.Surjective g.toLinearMap)
    (hfg : LinearMap.range f.toLinearMap = LinearMap.ker g.toLinearMap)
    (hN : D.N = 0) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor D F hF = localFactor D' F hF * localFactor D'' F hF := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.localFactor_omega. -/
example (hq : (q : Ω) ≠ 0) (h) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor (ofCharacter (deg := deg) (q := q) (omega deg hq) h) F hF =
      1 - C (q : Ω)⁻¹ * X := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.localFactor_special_two. -/
example (hq : (q : Ω) ≠ 0) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor (special (W := W) (deg := deg) 2 hq) F hF = 1 - C (q : Ω)⁻¹ * X ∧
      localFactor (dual (special (W := W) (deg := deg) 2 hq)) F hF = 1 - X := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.localFactor_zero. -/
example (D : WeilDeligneRep W deg q Ω (Fin 0 → Ω)) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (h : IsOpen {w : W | (1 : W →* Ωˣ) w = 1}) :
    localFactor D F hF = 1 ∧
      localFactor (ofCharacter (deg := deg) (q := q) (1 : W →* Ωˣ) h) F hF = 1 - X := by
  sorry

/-- Unit test: TauCeti.WeilDeligneRep.localFactor_special_not_invariants. -/
example (hq : (q : Ω) ≠ 0) (hq1 : (q : Ω) ≠ 1) (h) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    LinearMap.det (1 - (X : (Polynomial Ω)) • ((special (W := W) (deg := deg) 2 hq).r F).baseChange (Polynomial Ω)) ≠
        localFactor (special (W := W) (deg := deg) 2 hq) F hF ∧
      localFactor (ofCharacter (deg := deg) (q := q) (omega deg hq) h) F hF ≠ 1 - C (q : Ω) * X := by
  sorry

/-- Unit test: TauCeti.WeilDeligneRep.localFactor_not_exact. -/
example (hq : (q : Ω) ≠ 0) (hq1 : (q : Ω) ≠ 1) (h h₁) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    localFactor (special (W := W) (deg := deg) 2 hq) F hF ≠
      localFactor (ofCharacter (deg := deg) (q := q) (omega deg hq) h) F hF *
        localFactor (ofCharacter (deg := deg) (q := q) 1 h₁) F hF := by sorry

end LocalFactor

end WeilDeligneRep

namespace GaloisRep

section LocalEulerFactor

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E] [CharZero E] [TopologicalSpace E] [Algebra ℚ_[ℓ] E]
  {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
  [TopologicalSpace V] [IsModuleTopology E V]

/-- `L(ρ, X) = det(1 − X ρ(F) | V^{ρ(I_K)})` for an `ℓ`-adic representation of the Weil group and
a geometric Frobenius lift `F` (`F = Φ⁻¹`, `Φ` arithmetic); for a global `ρ`, `L_v(ρ, X)` is this
for the local restriction. -/
def localEulerFactor (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) : (Polynomial E) := sorry

theorem localEulerFactor_eq_localFactor [FiniteDimensional ℚ_[ℓ] E] [IsModuleTopology ℚ_[ℓ] E]
    (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : WeilDeligneRep.IsTameCharacter deg q t) :
    localEulerFactor ρ F hF =
      WeilDeligneRep.localFactor (WeilDeligneRep.ofEllAdic (q := q) ρ F hF t) F hF := by sorry

theorem localEulerFactor_unramified [Module.Free E V] (ρ : ContinuousRep W E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (hρ : ∀ σ ∈ deg.ker, ρ σ = LinearMap.id) :
    localEulerFactor ρ F hF = ((ρ.toRepresentation.dual F⁻¹).charpoly).reverse := by sorry

end LocalEulerFactor

end GaloisRep

namespace WeilDeligneRep

/-! ### Local factors and Weil–Deligne representations of induced representations (ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation) -/

/-- ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation, local part (a):
`L(Ind_{W_L}^{W_K} D, X) = L(D, X^f)` with `f` the residue degree (`deg_K ∘ φ = f · deg_L`). The
global part (b) is the product over the places above `v` of this identity. -/
theorem localFactor_induced {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ}
    {q : ℕ} {W' : Type*} [Group W'] [TopologicalSpace W'] {deg' : W' →* Multiplicative ℤ}
    {Ω : Type*} [Field Ω] [CharZero Ω] {V : Type*} [AddCommGroup V] [Module Ω V]
    [FiniteDimensional Ω V] (φ : W' →ₜ* W) (f m : ℕ) (hm : φ.toMonoidHom.range.index = m)
    (hdeg : ∀ w, deg (φ w) = deg' w ^ f) (D : WeilDeligneRep W' deg' (q ^ f) Ω V)
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (F' : W')
    (hF' : deg' F' = Multiplicative.ofAdd (-1)) :
    localFactor (induced (deg := deg) (q := q) φ m hm D) F hF =
      (localFactor D F' hF').comp (X ^ f) := by sorry

/-! ### The determinant of a cyclic block endomorphism (Deligne, Lemme 3.9) (ArithmeticGaloisRepresentations:R01.2/determinant-of-a-cyclic-block-endomorphism) -/

/-- The cyclic block endomorphism `φ_{n+1}` of `V^{n+1}`: `φ_{n+1}(v ⊗ e_i) = v ⊗ e_{i+1}` for
`i < n` and `φ_{n+1}(v ⊗ e_n) = φ(v) ⊗ e_0`; in coordinates `(φ_{n+1} c)_0 = φ(c_n)` and
`(φ_{n+1} c)_i = c_{i−1}` for `i ≥ 1`. -/
def cyclicBlock {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V] (φ : V →ₗ[A] V) (n : ℕ) :
    (Fin (n + 1) → V) →ₗ[A] (Fin (n + 1) → V) where
  toFun c i := if (i : ℕ) = 0 then φ (c (Fin.last n))
    else c ⟨(i : ℕ) - 1, by have := i.isLt; omega⟩
  map_add' := by sorry
  map_smul' := by sorry

/-- ArithmeticGaloisRepresentations:R01.2/determinant-of-a-cyclic-block-endomorphism (Deligne,
Lemme 3.9, over a commutative ring): `det(1 − X φ_{n+1}) = det(1 − X^{n+1} φ)`. -/
theorem det_one_sub_X_smul_cyclicBlock {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V]
    [Module.Free A V] [Module.Finite A V] (φ : V →ₗ[A] V) (n : ℕ) :
    LinearMap.det (1 - (X : Polynomial A) • ((cyclicBlock φ n).baseChange (Polynomial A))) =
      LinearMap.det (1 - (X : Polynomial A) ^ (n + 1) • (φ.baseChange (Polynomial A))) := by
  sorry

/-- The same node, for characteristic polynomials: `charpoly(φ_{n+1})(X) = charpoly(φ)(X^{n+1})`. -/
theorem charpoly_cyclicBlock {A V : Type*} [CommRing A] [AddCommGroup V] [Module A V]
    [Module.Free A V] [Module.Finite A V] (φ : V →ₗ[A] V) (n : ℕ) :
    (cyclicBlock φ n).charpoly = φ.charpoly.comp (X ^ (n + 1)) := by sorry

/-! ### Inertia invariants of a representation induced from the Weil group of a finite extension (ArithmeticGaloisRepresentations:R01.2/inertia-invariants-of-an-induced-representation) -/

/- ArithmeticGaloisRepresentations:R01.2/inertia-invariants-of-an-induced-representation: for
L/K finite with residue degree f and V a representation of W_L, realise Ind V as the functions
φ : W_K → V with φ(hw) = hφ(w) (h ∈ W_L). Then (Ind V)^{I_K} is the space of right-I_K-invariant φ;
these have values in V^{I_L}, and φ ↦ (φ(F_K^{f−1}), …, φ(F_K), φ(1)) is an isomorphism onto
(V^{I_L})^f carrying F_K to `cyclicBlock F_L (f − 1)`; for a Weil–Deligne representation the same
holds for (ker N)^{I_L}. (Comment-block statement: `induced` above is realised on `Fin m → V`
through a choice of coset representatives and has no function model here, and the inertia subgroup
of the abstract `W'` inside `W` is `ker deg'`, whose comparison with `ker deg` needs the residue
degree as data. The determinant consequence is `localFactor_induced` above.) -/

/-! ### The monodromy filtration of a nilpotent endomorphism (ArithmeticGaloisRepresentations:R01.2/monodromy-filtration) -/

section MonodromyFiltration

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]
  {V' : Type*} [AddCommGroup V'] [Module k V']

/-- `M_a(N) = Σ_{i − j = a} (ker N^{i+1} ∩ im N^j)`: the monodromy filtration of `N` when `N` is a
nilpotent endomorphism of a finite-dimensional space (any field). -/
def _root_.TauCeti.MonodromyFiltration.ofNilpotent (N : Module.End k V) (a : ℤ) : Submodule k V :=
  ⨆ (i : ℕ) (j : ℕ) (_ : (i : ℤ) - (j : ℤ) = a),
    LinearMap.ker (N ^ (i + 1)) ⊓ LinearMap.range (N ^ j)

/-- Uniqueness: an increasing exhaustive separated filtration with `N M_a ⊆ M_{a−2}` and
`N^a : gr_a ≅ gr_{−a}` for `a ≥ 0` is the monodromy filtration. -/
theorem _root_.TauCeti.MonodromyFiltration.ofNilpotent_unique [FiniteDimensional k V]
    (N : Module.End k V) (hN : IsNilpotent N) (M : ℤ → Submodule k V)
    (hmono : Monotone M) (hbot : ∃ a, M a = ⊥) (htop : ∃ a, M a = ⊤)
    (hN2 : ∀ a, (M a).map N ≤ M (a - 2))
    (hinj : ∀ a : ℕ, M a ⊓ (M (-(a : ℤ) - 1)).comap (N ^ a) ≤ M ((a : ℤ) - 1))
    (hsurj : ∀ a : ℕ, M (-(a : ℤ)) ≤ (M a).map (N ^ a) ⊔ M (-(a : ℤ) - 1)) :
    M = TauCeti.MonodromyFiltration.ofNilpotent N := by sorry

/-- The filtration is increasing, exhaustive, separated, and `N M_a ⊆ M_{a−2}`. -/
theorem _root_.TauCeti.MonodromyFiltration.map_le [FiniteDimensional k V]
    (N : Module.End k V) (hN : IsNilpotent N) :
    Monotone (TauCeti.MonodromyFiltration.ofNilpotent N) ∧
      (∃ a, TauCeti.MonodromyFiltration.ofNilpotent N a = ⊥) ∧
      (∃ a, TauCeti.MonodromyFiltration.ofNilpotent N a = ⊤) ∧
      ∀ a, (TauCeti.MonodromyFiltration.ofNilpotent N a).map N ≤
        TauCeti.MonodromyFiltration.ofNilpotent N (a - 2) := by sorry

/-- For `a ≥ 0`, `N^a` induces a bijection `gr_a → gr_{−a}` (injectivity and surjectivity on the
graded pieces, written with submodules). -/
theorem _root_.TauCeti.MonodromyFiltration.iterate_bijective [FiniteDimensional k V]
    (N : Module.End k V) (hN : IsNilpotent N) (a : ℕ) :
    TauCeti.MonodromyFiltration.ofNilpotent N a ⊓
        (TauCeti.MonodromyFiltration.ofNilpotent N (-(a : ℤ) - 1)).comap (N ^ a) ≤
          TauCeti.MonodromyFiltration.ofNilpotent N ((a : ℤ) - 1) ∧
      TauCeti.MonodromyFiltration.ofNilpotent N (-(a : ℤ)) ≤
        (TauCeti.MonodromyFiltration.ofNilpotent N a).map (N ^ a) ⊔
          TauCeti.MonodromyFiltration.ofNilpotent N (-(a : ℤ) - 1) := by sorry

/-- Property (2): the filtration is stable under every `g` with `g N g⁻¹ = c N`, `c ≠ 0`, and
`N`, `cN` have the same filtration. -/
theorem _root_.TauCeti.MonodromyFiltration.ofNilpotent_conj (N : Module.End k V) (g : V ≃ₗ[k] V)
    (c : k) (hc : c ≠ 0) (h : (g : V →ₗ[k] V) ∘ₗ N = (c • N) ∘ₗ (g : V →ₗ[k] V)) (a : ℤ) :
    (TauCeti.MonodromyFiltration.ofNilpotent N a).map (g : V →ₗ[k] V) =
        TauCeti.MonodromyFiltration.ofNilpotent N a ∧
      TauCeti.MonodromyFiltration.ofNilpotent (c • N) a =
        TauCeti.MonodromyFiltration.ofNilpotent N a := by sorry

/-- Property (3): functoriality for maps commuting with the nilpotent operators. -/
theorem _root_.TauCeti.MonodromyFiltration.map_le_of_comm (N : Module.End k V)
    (N' : Module.End k V') (f : V →ₗ[k] V') (h : f ∘ₗ N = N' ∘ₗ f) (a : ℤ) :
    (TauCeti.MonodromyFiltration.ofNilpotent N a).map f ≤
      TauCeti.MonodromyFiltration.ofNilpotent N' a := by sorry

/-- Property (4): the primitive part in degree `a ≥ 0`, as the preimage in `M_a` of
`P_a = ker(N^{a+1} : gr_a → gr_{−a−2})`; its dimension modulo `M_{a−1}` is the number of Jordan
blocks of size `a + 1`, and `gr_b = ⊕_j N^j P_{b+2j}`. -/
def _root_.TauCeti.MonodromyFiltration.primitivePart (N : Module.End k V) (a : ℕ) :
    Submodule k V :=
  TauCeti.MonodromyFiltration.ofNilpotent N a ⊓
    (TauCeti.MonodromyFiltration.ofNilpotent N (-(a : ℤ) - 3)).comap (N ^ (a + 1))

/-- Property (4), the rank identity: `Σ_a a² dim gr_a = 2 Σ_{j ≥ 1} j · rank(N^j)`. -/
theorem _root_.TauCeti.MonodromyFiltration.sum_sq_finrank_gr [FiniteDimensional k V]
    (N : Module.End k V) (d : ℕ) (hN : N ^ (d + 1) = 0) :
    ∑ a ∈ Finset.Icc (-(d : ℤ)) d, a ^ 2 *
        ((Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent N a) : ℤ) -
          Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent N (a - 1))) =
      2 * ∑ j ∈ Finset.Icc 1 d, (j : ℤ) * Module.finrank k (LinearMap.range (N ^ j)) := by sorry

/-- Property (5): the filtration of the dual operator is the annihilator filtration. -/
theorem _root_.TauCeti.MonodromyFiltration.ofNilpotent_dual [FiniteDimensional k V]
    (N : Module.End k V) (hN : IsNilpotent N) (a : ℤ) :
    TauCeti.MonodromyFiltration.ofNilpotent N.dualMap a =
      (TauCeti.MonodromyFiltration.ofNilpotent N (-a - 1)).dualAnnihilator := by sorry

/-- Property (6), characteristic `0`: the filtration of `N ⊗ 1 + 1 ⊗ N'` is the convolution. -/
theorem _root_.TauCeti.MonodromyFiltration.ofNilpotent_tensor [CharZero k]
    [FiniteDimensional k V] [FiniteDimensional k V'] (N : Module.End k V) (N' : Module.End k V')
    (hN : IsNilpotent N) (hN' : IsNilpotent N') (a : ℤ) :
    TauCeti.MonodromyFiltration.ofNilpotent
        (TensorProduct.map N LinearMap.id + TensorProduct.map LinearMap.id N') a =
      ⨆ (b : ℤ) (c : ℤ) (_ : b + c = a), LinearMap.range (TensorProduct.map
        (TauCeti.MonodromyFiltration.ofNilpotent N b).subtype
        (TauCeti.MonodromyFiltration.ofNilpotent N' c).subtype) := by sorry

/-- Unit test: TauCeti.MonodromyFiltration.ofNilpotent_zero. -/
example (a : ℤ) : TauCeti.MonodromyFiltration.ofNilpotent (0 : Module.End k V) a =
    if a < 0 then ⊥ else ⊤ := by sorry

/-- Unit test: TauCeti.MonodromyFiltration.ofNilpotent_jordanBlock_two. `N e_0 = e_1`,
`N e_1 = 0`. -/
example : TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) (-2) = ⊥ ∧
    TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) (-1) =
      Submodule.span k {![0, 1]} ∧
    TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) 0 =
      Submodule.span k {![0, 1]} ∧
    TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) 1 = ⊤ := by
  sorry

/-- Unit test: TauCeti.MonodromyFiltration.ofNilpotent_ne_kernelFiltration. Neither the kernel
filtration `a ↦ ker N^{a+1}` nor the image filtration `a ↦ im N^{−a}` is the monodromy
filtration. -/
example : TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) (-1) ≠
      LinearMap.ker ((Matrix.toLin' !![(0 : k), 0; 1, 0]) ^ 0) ∧
    TauCeti.MonodromyFiltration.ofNilpotent (Matrix.toLin' !![(0 : k), 0; 1, 0]) 0 ≠
      LinearMap.range ((Matrix.toLin' !![(0 : k), 0; 1, 0]) ^ 0) := by sorry

/-- Unit test: TauCeti.MonodromyFiltration.ofNilpotent_tensor_jordanBlock_two. In characteristic
`0` the tensor square of a Jordan block of size `2` has graded dimensions `1, 2, 1` in degrees
`2, 0, −2`. -/
example [CharZero k] (T : Module.End k ((Fin 2 → k) ⊗[k] (Fin 2 → k)))
    (hT : T = TensorProduct.map (Matrix.toLin' !![(0 : k), 0; 1, 0]) LinearMap.id +
      TensorProduct.map LinearMap.id (Matrix.toLin' !![(0 : k), 0; 1, 0])) :
    Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T 2) = 4 ∧
      Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T 1) = 3 ∧
      Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T 0) = 3 ∧
      Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T (-1)) = 1 ∧
      Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T (-2)) = 1 ∧
      Module.finrank k (TauCeti.MonodromyFiltration.ofNilpotent T (-3)) = 0 := by sorry

/-- Unit test: TauCeti.MonodromyFiltration.not_ofNilpotent_tensor_char_two. Over `𝔽₂` the same
operator has square `0` and `M_0` of dimension `2`, not `3`: the tensor formula fails. -/
example (T : Module.End (ZMod 2) ((Fin 2 → ZMod 2) ⊗[ZMod 2] (Fin 2 → ZMod 2)))
    (hT : T = TensorProduct.map (Matrix.toLin' !![(0 : ZMod 2), 0; 1, 0]) LinearMap.id +
      TensorProduct.map LinearMap.id (Matrix.toLin' !![(0 : ZMod 2), 0; 1, 0])) :
    T ^ 2 = 0 ∧ Module.finrank (ZMod 2) (TauCeti.MonodromyFiltration.ofNilpotent T 0) = 2 := by
  sorry

end MonodromyFiltration

/-! ### The monodromy filtration and purity of Weil–Deligne representations (ArithmeticGaloisRepresentations:R01.2/purity-of-weil-deligne-representations) -/

section Purity

variable {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {Ω : Type*} [Field Ω] [CharZero Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
  {V' : Type*} [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']

/-- The monodromy filtration `M_•` of the nilpotent `N`: `TauCeti.MonodromyFiltration.ofNilpotent`
of the monodromy operator (ArithmeticGaloisRepresentations:R01.2/monodromy-filtration). -/
def monodromyFiltration (D : WeilDeligneRep W deg q Ω V) : ℤ → Submodule Ω V :=
  TauCeti.MonodromyFiltration.ofNilpotent D.N

/-- `M_•` is the unique increasing exhaustive separated filtration with `N M_a ⊆ M_{a−2}` and
`N^a : gr_a ≅ gr_{−a}` for `a ≥ 0`. -/
theorem monodromyFiltration_unique (D : WeilDeligneRep W deg q Ω V) (M : ℤ → Submodule Ω V)
    (hmono : Monotone M) (hbot : ∃ a, M a = ⊥) (htop : ∃ a, M a = ⊤)
    (hN : ∀ a, (M a).map D.N ≤ M (a - 2))
    (hinj : ∀ a : ℕ, M a ⊓ (M (-(a : ℤ) - 1)).comap (D.N ^ a) ≤ M ((a : ℤ) - 1))
    (hsurj : ∀ a : ℕ, M (-(a : ℤ)) ≤ (M a).map (D.N ^ a) ⊔ M (-(a : ℤ) - 1)) :
    M = monodromyFiltration D := by sorry

theorem monodromyFiltration_stable (D : WeilDeligneRep W deg q Ω V) (w : W) (a : ℤ) :
    (monodromyFiltration D a).map (D.r w) ≤ monodromyFiltration D a := by sorry

/-- `α` is a `q`-Weil number of weight `m`: algebraic over `ℚ` with all complex conjugates of
absolute value `q^{m/2}`. No embedding of the coefficient field into `ℂ` is chosen. -/
def IsWeilNumber (q : ℕ) (m : ℤ) (α : Ω) : Prop :=
  IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = (q : ℝ) ^ ((m : ℝ) / 2)

/-- Purity of weight `w` of a pair `(φ, N)`: every eigenvalue of `φ` on `gr^M_a` of the
monodromy filtration of `N`, taken in an algebraic closure of `Ω`, is a `q`-Weil number of weight
`w + a`. -/
def IsPureEnd (q : ℕ) (w : ℤ) (φ N : Module.End Ω V) : Prop :=
  ∀ (a : ℤ) (α : AlgebraicClosure Ω) (v : AlgebraicClosure Ω ⊗[Ω] V),
    v ∈ (TauCeti.MonodromyFiltration.ofNilpotent N a).baseChange (AlgebraicClosure Ω) →
    v ∉ (TauCeti.MonodromyFiltration.ofNilpotent N (a - 1)).baseChange (AlgebraicClosure Ω) →
    φ.baseChange (AlgebraicClosure Ω) v - α • v ∈
      (TauCeti.MonodromyFiltration.ofNilpotent N (a - 1)).baseChange (AlgebraicClosure Ω) →
    IsWeilNumber q (w + a) α

/-- Purity of weight `w`: every eigenvalue of the geometric Frobenius `F` on `gr^M_a` (in an
algebraic closure of `Ω`) is a `q`-Weil number of weight `w + a`. -/
def IsPure (D : WeilDeligneRep W deg q Ω V) (w : ℤ) (F : W) : Prop :=
  IsPureEnd q w (D.r F) D.N

theorem isPure_frobeniusSemisimplification (D : WeilDeligneRep W deg q Ω V) (w : ℤ) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsPure D w F ↔ IsPure (frobeniusSemisimplification D F hF) w F := by sorry

theorem isPure_tensor (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V')
    (w w' : ℤ) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (hq : (q : Ω) ≠ 0) (h) :
    (IsPure D w F → IsPure D' w' F → IsPure (tensor D D') (w + w') F) ∧
      (IsPure D w F → IsPure (dual D) (-w) F) ∧
      (IsPure D w F → IsPure (twist D (omega deg hq) h) (w - 2) F) := by sorry

/-- Purity is preserved by restriction to `W_L` (residue degree `f`, `q_L = q^f`): if `D` is pure
of weight `w` for a geometric Frobenius lift `F_K` of `W`, then `D|_{W_L}` is pure of weight `w`
for a geometric Frobenius lift `F` of `W_L`. The hypothesis is tested on `F_K`, not on `φ(F)`,
which has degree `−f`: the eigenvalues of `r(φ F)` are, up to roots of unity, the `f`-th powers of
those of `r(F_K)` (finite image of inertia), and they are compared with `q^f`. -/
theorem isPure_restrict {W' : Type*} [Group W'] [TopologicalSpace W']
    {deg' : W' →* Multiplicative ℤ} (D : WeilDeligneRep W deg q Ω V)
    (hfin : (Set.range fun σ : deg.ker => D.r σ).Finite) (φ : W' →ₜ* W) (f : ℕ) (hf : 0 < f)
    (hdeg : ∀ w, deg (φ w) = deg' w ^ f) (w : ℤ) (FK : W)
    (hFK : deg FK = Multiplicative.ofAdd (-1)) (F : W')
    (hF : deg' F = Multiplicative.ofAdd (-1)) :
    IsPure D w FK → IsPure (D.restrict φ f hdeg) w F := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.isPure_special_two. -/
example (hq : (q : Ω) ≠ 0) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsPure (special (W := W) (deg := deg) 2 hq) (-1) F := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.isPure_omega. -/
example (hq : (q : Ω) ≠ 0) (h) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsPure (ofCharacter (deg := deg) (q := q) (omega deg hq) h) (-2) F := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.isPure_trivial. -/
example (h) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    IsPure (ofCharacter (deg := deg) (q := q) (1 : W →* Ωˣ) h) 0 F := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.not_isPure_split. -/
example (hq : (q : Ω) ≠ 0) (hq1 : 1 < q) (h h₁) (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (w : ℤ) :
    ¬ IsPure (prod (ofCharacter (deg := deg) (q := q) (1 : W →* Ωˣ) h₁)
      (ofCharacter (deg := deg) (q := q) (omega deg hq) h)) w F := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.monodromyFiltration_special. -/
example (n : ℕ) (hq : (q : Ω) ≠ 0) (a : ℤ) :
    Module.finrank Ω (monodromyFiltration (special (W := W) (deg := deg) n hq) a) =
      Module.finrank Ω (monodromyFiltration (special (W := W) (deg := deg) n hq) (a - 1)) +
        if |a| < n ∧ Even (a + n - 1) then 1 else 0 := by sorry

end Purity

end WeilDeligneRep

namespace GaloisRep

/-- Purity of an `ℓ`-adic representation at a place: `WD(ρ)` (of the local restriction, here of
a representation of the local Weil group) is pure of weight `w`. -/
def IsPureAt {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} (q : ℕ)
    {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E] [CharZero E] [TopologicalSpace E]
    [Algebra ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V] (ρ : ContinuousRep W E V) (w : ℤ) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ]) : Prop :=
  WeilDeligneRep.IsPure (WeilDeligneRep.ofEllAdic (q := q) ρ F hF t) w F

end GaloisRep

namespace WeilDeligneRep

/-! ### A nilpotent operator with pure graded has the Jordan type of its graded (the count behind FSY Lemma 5.40) (ArithmeticGaloisRepresentations:R01.2/purity-from-a-pure-graded) -/

/-- ArithmeticGaloisRepresentations:R01.2/purity-from-a-pure-graded, for a flag with one step
`0 ⊂ U ⊂ V` (the general flag follows by induction): if `N φ = q φ N`, `U` is stable under `φ` and
`N`, and the pairs induced on `U` and on `V ⧸ U` are pure of weight `w`, then `(φ, N)` is pure of
weight `w` and `rank N^j = rank (N|_U)^j + rank (N|_{V/U})^j` for all `j` (same Jordan type as the
graded). -/
theorem isPureEnd_of_graded {Ω : Type*} [Field Ω] [CharZero Ω] {V : Type*} [AddCommGroup V]
    [Module Ω V] [FiniteDimensional Ω V] (q : ℕ) (hq : 2 ≤ q) (w : ℤ) (φ N : Module.End Ω V)
    (hN : IsNilpotent N) (hφ : IsUnit φ) (h : N ∘ₗ φ = (q : Ω) • (φ ∘ₗ N))
    (U : Submodule Ω V) (hUφ : U ≤ U.comap φ) (hUN : U ≤ U.comap N)
    (h₁ : IsPureEnd q w (φ.restrict (p := U) (q := U) fun _ hx => hUφ hx) (N.restrict (p := U) (q := U) fun _ hx => hUN hx))
    (h₂ : IsPureEnd q w (U.mapQ U φ hUφ) (U.mapQ U N hUN)) :
    IsPureEnd q w φ N ∧ ∀ j : ℕ, Module.finrank Ω (LinearMap.range (N ^ j)) =
      Module.finrank Ω (LinearMap.range ((N.restrict (p := U) (q := U) fun _ hx => hUN hx) ^ j)) +
        Module.finrank Ω (LinearMap.range ((U.mapQ U N hUN) ^ j)) := by sorry

/-! ### A representation with pure graded Weil–Deligne representation is pure, with the same L- and ε-factors (FSY Lemma 5.40) (ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne) -/

/-- ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne (FSY Lemma 5.40), one step of
the filtration: for `0 → ρ₁ → ρ → ρ₂ → 0` with `WD(ρ₁)`, `WD(ρ₂)` pure of weight `w`, `WD(ρ)` is
pure of weight `w` and `L(ρ) = L(ρ₁ ⊕ ρ₂)`; the general filtration follows by induction. The
`ε`-factor equality (complex coefficients through `ι`) is omitted here. The step that FSY assert
without proof is `isPureEnd_of_graded` above (node purity-from-a-pure-graded). -/
theorem isPure_of_graded {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ}
    {q : ℕ} {ℓ : ℕ} [Fact ℓ.Prime] {E : Type*} [Field E] [CharZero E] [TopologicalSpace E]
    [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E] [IsModuleTopology ℚ_[ℓ] E]
    {V₁ V V₂ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁] [Module.Projective E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂] [Module.Projective E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep W E V₁) (ρ : ContinuousRep W E V) (ρ₂ : ContinuousRep W E V₂)
    (f : V₁ →ₗ[E] V) (g : V →ₗ[E] V₂) (hf : Function.Injective f) (hg : Function.Surjective g)
    (hfg : LinearMap.range f = LinearMap.ker g) (hfρ : ∀ x, f ∘ₗ ρ₁ x = ρ x ∘ₗ f)
    (hgρ : ∀ x, g ∘ₗ ρ x = ρ₂ x ∘ₗ g) (w : ℤ) (F : W) (hF : deg F = Multiplicative.ofAdd (-1))
    (t : deg.ker →* Multiplicative ℤ_[ℓ]) (ht : IsTameCharacter deg q t)
    (h₁ : IsPure (ofEllAdic (q := q) ρ₁ F hF t) w F) (h₂ : IsPure (ofEllAdic (q := q) ρ₂ F hF t) w F) :
    IsPure (ofEllAdic (q := q) ρ F hF t) w F ∧
      GaloisRep.localEulerFactor ρ F hF =
        GaloisRep.localEulerFactor ρ₁ F hF * GaloisRep.localEulerFactor ρ₂ F hF := by sorry

/-! ### Deligne–Langlands local constants ε(V, ψ, dx) of Weil and Weil–Deligne representations (ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor) -/

section Epsilon

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [MeasurableSpace K]
  {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
  {V' : Type*} [AddCommGroup V'] [Module ℂ V'] [FiniteDimensional ℂ V']
  {V'' : Type*} [AddCommGroup V''] [Module ℂ V''] [FiniteDimensional ℂ V'']

/-- Deligne's local constant `ε(V, ψ, dx) ∈ ℂ^×` of a complex representation of `W_K` with open
kernel (local class field theory normalised with uniformisers ↦ geometric Frobenius). -/
def epsilonWeil (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (r : Representation ℂ W V) :
    ℂˣ := sorry

variable {K}

theorem epsilonWeil_exact (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K)
    (r' : Representation ℂ W V') (r : Representation ℂ W V) (r'' : Representation ℂ W V'')
    (f : V' →ₗ[ℂ] V) (g : V →ₗ[ℂ] V'') (hf : Function.Injective f) (hg : Function.Surjective g)
    (hfg : LinearMap.range f = LinearMap.ker g) (hfr : ∀ x, f ∘ₗ r' x = r x ∘ₗ f)
    (hgr : ∀ x, g ∘ₗ r x = r'' x ∘ₗ g) :
    epsilonWeil K ψ μ r = epsilonWeil K ψ μ r' * epsilonWeil K ψ μ r'' := by sorry

theorem epsilonWeil_smul_measure (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K)
    (r : Representation ℂ W V) (a : NNReal) (ha : 0 < a) :
    (epsilonWeil K ψ ((a : ENNReal) • μ) r : ℂ) =
      ((a : ℝ) : ℂ) ^ Module.finrank ℂ V * epsilonWeil K ψ μ r := by sorry

/- TauCeti.WeilDeligneRep.epsilonWeil_induced: ε(Ind V_L, ψ) = ε(V_L, ψ ∘ Tr_{L/K}) for virtual
V_L of dimension 0. (Comment-block fallback: virtual representations and Tr_{L/K} on the abstract
Weil groups are not available.) -/

/- TauCeti.WeilDeligneRep.epsilonWeil_character: for dim V = 1, given through Art_K by the
quasi-character χ = ωω_s of K^× (ω a character, s ∈ ℂ), ε(V, ψ, dx_ψ) = ε(s, ω, ψ) of
AL.1/local-epsilon-gamma-factors, where dx_ψ is the Haar measure self-dual for ψ; for a·dx_ψ
multiply by a. (Comment-block fallback: Tate's local constant and Art_K are Tau Ceti declarations
outside the Mathlib-only build.) -/

/-- TauCeti.WeilDeligneRep.epsilonWeil_character_explicit, unramified case. Normalisations: `π` a
uniformiser, `ν = n(ψ)` the largest integer with `ψ` trivial on `π^{−ν} 𝒪` (hypotheses `hψ₀`,
`hψ₁`), `μ` the Haar measure self-dual for `ψ`, i.e. `μ(𝒪) = q^{−ν/2}` (`hμ`). For an unramified
character `χ` of the Weil group, whose quasi-character of `K^×` takes the value `χ(F)` at `π`
(Deligne's normalisation: uniformisers ↔ geometric Frobenius `F`),
`ε(χ, ψ, μ) = χ(F)^ν q^{ν/2}`; with `χ = ωω_s` this is `ω(π^ν) q^{(1/2−s)ν}`, formula (i) of
AL.1/explicit-epsilon-factors. The ramified case, `ε(ωω_s, ψ, dx_ψ) =
ω(π^{ν+c}) q^{(1/2−s)(ν+c)} 𝔤(ω, ψ)` with `𝔤(ω, ψ) = q^{(ν+c)/2} ∫_{𝒪^×} ω⁻¹(y) ψ(π^{−ν−c} y) dy_ψ`
(formula (ii) there), needs quasi-characters of `K^×` and `Art_K` and is not typed here. -/
theorem epsilonWeil_character_explicit (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K)
    [μ.IsAddHaarMeasure] (χ : W →* ℂˣ) (h) (hχ : ∀ σ ∈ deg.ker, χ σ = 1) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (π : 𝒪[K]) (hπ : Irreducible π) (ν : ℤ)
    (hψ₀ : ∀ y : 𝒪[K], ψ ((π : K) ^ (-ν) * y) = 1)
    (hψ₁ : ∃ y : 𝒪[K], ψ ((π : K) ^ (-ν - 1) * y) ≠ 1)
    (hμ : μ (𝒪[K] : Set K) = ENNReal.ofReal ((Nat.card 𝓀[K] : ℝ) ^ (-(ν : ℝ) / 2))) :
    (epsilonWeil K ψ μ (ofCharacter (deg := deg) (q := q) χ h).r : ℂ) =
      (χ F : ℂ) ^ ν * (((Nat.card 𝓀[K] : ℝ) ^ ((ν : ℝ) / 2) : ℝ) : ℂ) := by sorry

/- TauCeti.WeilDeligneRep.epsilonWeil_unique: any function satisfying (1)–(4) equals epsilonWeil.
(Comment-block fallback: condition (4) is the comparison with Tate's constant above.) -/

/-- `ε((V, r, N), ψ, dx) = ε(r, ψ, dx) · det(−r(F) | V^{I}/(ker N)^{I})`, `F` geometric. -/
def epsilon (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (D : WeilDeligneRep W deg q ℂ V)
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) : ℂˣ := sorry

theorem epsilon_frobeniusSemisimplification (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K)
    (D : WeilDeligneRep W deg q ℂ V) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    epsilon ψ μ (frobeniusSemisimplification D F hF) F hF = epsilon ψ μ D F hF ∧
      epsilonWeil K ψ μ (semisimplification D).r = epsilonWeil K ψ μ D.r := by sorry

/- TauCeti.WeilDeligneRep.epsilon_unramified_twist: ε(V ⊗ ω_s, ψ, dx) =
q^{−(a(V) + n(ψ) dim V)s} ε(V, ψ, dx), a(V) the Artin conductor of R01.3. (Comment-block fallback:
the conductor `wdConductor` is declared later, in R01.3, and n(ψ) needs the conductor of ψ.) -/

/- TauCeti.WeilDeligneRep.epsilon_dual: ε(V, ψ, dx) ε(V^∨ ⊗ ω, ψ(−x), dx') = 1 for dual Haar
measures dx, dx' (Deligne 5.7). (Comment-block fallback: the self-duality relation between dx and
dx' with respect to ψ is a Fourier-analytic notion not typed here.) -/

/-- Unit test: TauCeti.WeilDeligneRep.epsilon_unramified_character. -/
example (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (χ : W →* ℂˣ) (h)
    (hχ : ∀ σ ∈ deg.ker, χ σ = 1) (hψ₀ : ∀ x : 𝒪[K], ψ x = 1)
    (hψ₁ : ∃ (π : 𝒪[K]) (x : 𝒪[K]), Irreducible π ∧ ψ ((x : K) / π) ≠ 1)
    (hμ : μ (𝒪[K] : Set K) = 1) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    epsilon ψ μ (ofCharacter (deg := deg) (q := q) χ h) F hF = 1 := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.epsilon_special_two. -/
example (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (hq : (q : ℂ) ≠ 0)
    (hψ₀ : ∀ x : 𝒪[K], ψ x = 1)
    (hψ₁ : ∃ (π : 𝒪[K]) (x : 𝒪[K]), Irreducible π ∧ ψ ((x : K) / π) ≠ 1)
    (hμ : μ (𝒪[K] : Set K) = 1) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    (epsilon ψ μ (special (W := W) (deg := deg) 2 hq) F hF : ℂ) = -1 := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.epsilon_zero. -/
example (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (D : WeilDeligneRep W deg q ℂ (Fin 0 → ℂ))
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) : epsilon ψ μ D F hF = 1 := by sorry

/-- Unit test: TauCeti.WeilDeligneRep.epsilon_not_weil_part. -/
example (ψ : AddChar K ℂ) (μ : MeasureTheory.Measure K) (hq : (q : ℂ) ≠ 0) (h h₁)
    (hψ₀ : ∀ x : 𝒪[K], ψ x = 1)
    (hψ₁ : ∃ (π : 𝒪[K]) (x : 𝒪[K]), Irreducible π ∧ ψ ((x : K) / π) ≠ 1)
    (hμ : μ (𝒪[K] : Set K) = 1) (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) :
    epsilon ψ μ (special (W := W) (deg := deg) 2 hq) F hF ≠
      epsilon ψ μ (prod (ofCharacter (deg := deg) (q := q) (1 : W →* ℂˣ) h₁)
        (ofCharacter (deg := deg) (q := q) (omega deg hq) h)) F hF := by sorry

/- TauCeti.WeilDeligneRep.epsilon_eq_tate: for a ramified character ω of K^× with conductor
exponent c, s ∈ ℂ, ν = n(ψ) and dx_ψ the Haar measure self-dual for ψ, epsilonWeil of the
one-dimensional representation given by ωω_s through Art_K equals
ω(ϖ^{ν+c}) q^{(1/2−s)(ν+c)} 𝔤(ω, ψ), 𝔤(ω, ψ) = q^{(ν+c)/2} ∫_{O^×} ω⁻¹(y) ψ(ϖ^{−ν−c} y) dy_ψ
(AL.1/explicit-epsilon-factors (ii), AL.1/local-gauss-sum). (Comment-block fallback, as for
epsilonWeil_character: quasi-characters of K^× and Art_K are outside the Mathlib-only build.) -/

end Epsilon

/-! ### Required examples: the cyclotomic character, an unramified character, and the Tate curve (ArithmeticGaloisRepresentations:R01.2/weil-deligne-required-examples) -/

/-- ArithmeticGaloisRepresentations:R01.2/weil-deligne-required-examples, parts (1)–(2): for the
cyclotomic character (`χ(w) = q^{deg w}`), `WD(ℚ_ℓ(1)) = (ω, 0)`, `L(ℚ_ℓ(1), X) = 1 − q⁻¹X`, and it
is pure of weight `−2`; for an unramified character `χ(w) = α^{deg w}`, `L(λ(α), X) = 1 − α⁻¹X`.
The Tate-curve parts (3)–(4) need the Tate curve (EllipticCurves layer 4) and are not restated. -/
theorem weilDeligne_required_examples {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} {ℓ : ℕ} [Fact ℓ.Prime] (hq : (q : ℚ_[ℓ]) ≠ 0)
    (χ : W →ₜ* ℚ_[ℓ]ˣ) (hχ : ∀ w, (χ w : ℚ_[ℓ]) = (q : ℚ_[ℓ]) ^ Multiplicative.toAdd (deg w))
    (α : ℚ_[ℓ]ˣ) (lam : W →ₜ* ℚ_[ℓ]ˣ)
    (hlam : ∀ w, (lam w : ℚ_[ℓ]) = (α : ℚ_[ℓ]) ^ Multiplicative.toAdd (deg w))
    (F : W) (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : IsTameCharacter deg q t) :
    (ofEllAdic (q := q) (ContinuousRep.ofCharacter χ) F hF t).N = 0 ∧
      GaloisRep.localEulerFactor (ContinuousRep.ofCharacter χ) F hF = 1 - C (q : ℚ_[ℓ])⁻¹ * X ∧
      IsPure (ofEllAdic (q := q) (ContinuousRep.ofCharacter χ) F hF t) (-2) F ∧
      GaloisRep.localEulerFactor (ContinuousRep.ofCharacter lam) F hF =
        1 - C ((α⁻¹ : ℚ_[ℓ]ˣ) : ℚ_[ℓ]) * X := by sorry

end WeilDeligneRep


/-! ## Conductors (R01.3)

Local setting: tier (F), `K` a nonarchimedean local field (Mathlib `IsNonarchimedeanLocalField`);
the tier (P) generalisation to complete discretely valued fields with perfect residue field rests
on the recorded ramification-filtration gap and is not typed here. Coefficients: a field `F` of
characteristic different from the residue characteristic, `ρ : ContinuousRep G_K F V`. -/

namespace Conductor

/-- The invariants `V^H` of a subgroup `H` acting through `ρ`. -/
def invariants {k Γ V : Type*} [Field k] [Group Γ] [AddCommGroup V] [Module k V]
    (ρ : Representation k Γ V) (H : Subgroup Γ) : Submodule k V :=
  ⨅ g ∈ H, LinearMap.ker (ρ g - LinearMap.id)

/-! ### Upper-numbering breaks and the Swan conductor of a representation with finite wild image (ArithmeticGaloisRepresentations:R01.3/breaks-and-swan-conductor) -/

section Swan

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The absolute upper ramification group `G_K^u` (`u ≥ −1`): the `σ` whose image in every finite
Galois `Gal(L/K)` lies in `Gal(L/K)^u`; closed, normal, antitone in `u`. Mathlib's
`Field.absoluteGaloisGroup K` is `Aut(AlgebraicClosure K / K)`; when `K` has positive characteristic
that extension is not Galois, so the finite Galois `L/K` are taken inside the separable closure and
the filtration is transported from `Gal(K^sep/K)` along Tau Ceti's
`TauCeti.absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup K ≃ₜ* Gal(K^sep/K)`. -/
def absUpperRamificationGroup (u : ℝ) : Subgroup (Field.absoluteGaloisGroup K) := sorry

theorem absUpperRamificationGroup_antitone : Antitone (absUpperRamificationGroup K) := by sorry

/- TauCeti.Conductor.map_absUpperRamificationGroup: for finite Galois L/K the image of G_K^u in
Gal(L/K) is Gal(L/K)^u (upperRamificationGroup of LocalFieldsRamification). (Comment-block
fallback: the finite-level upper numbering is a Tau Ceti declaration outside the Mathlib-only
build.) -/

theorem absUpperRamificationGroup_zero :
    absUpperRamificationGroup K 0 = GaloisRep.inertiaGroup K ∧
      (⨆ u : {u : ℝ // 0 < u}, absUpperRamificationGroup K u).topologicalClosure =
        GaloisRep.localWildInertiaGroup K := by sorry

variable {K} {F : Type*} [Field F] [TopologicalSpace F]
  {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
  [IsModuleTopology F V]

/-- The break decomposition `V = ⊕_λ V(λ)`, `λ ∈ ℚ_{≥0}`, with `V(0) = V^{P_K}`,
`V(λ)^{G_K^λ} = 0` and `V(λ)^{G_K^{λ+}} = V(λ)` for `λ > 0`. -/
def breakDecomposition (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℚ → Submodule F V :=
  sorry

/-- The hypothesis `hF` (the characteristic of `F` is not the residue characteristic `p`) cannot be
dropped: over `F = 𝔽_p`, a non-split unipotent action of a wildly ramified `ℤ/p`-extension on `F²`
has `V^{P_K}` as its only stable line, so no stable complement `⊕_{λ > 0} V(λ)` exists. -/
theorem breakDecomposition_isInternal (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    DirectSum.IsInternal (breakDecomposition ρ) ∧
      breakDecomposition ρ 0 = invariants ρ.toRepresentation (GaloisRep.localWildInertiaGroup K) ∧
      ∀ g b, (breakDecomposition ρ b).map (ρ g) ≤ breakDecomposition ρ b := by sorry

/-- The breaks: the finite set of `λ` with `V(λ) ≠ 0`. -/
def breaks (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : Finset ℚ := sorry

/-- The highest break (`0` for `V = 0`). -/
def highestBreak (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℚ :=
  if h : (breaks ρ).Nonempty then (breaks ρ).max' h else 0

/-- The Swan conductor `Sw(V) = Σ_λ λ · dim V(λ)`. -/
def swanConductor (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℚ :=
  ∑ b ∈ breaks ρ, b * Module.finrank F (breakDecomposition ρ b)

theorem swanConductor_eq_integral (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    (swanConductor ρ : ℝ) = ∫ u in Set.Ioi (0 : ℝ),
      ((Module.finrank F V : ℝ) -
        Module.finrank F (invariants ρ.toRepresentation (absUpperRamificationGroup K u))) := by
  sorry

/- TauCeti.Conductor.swanConductor_eq_lowerSum: Sw(V) = Σ_{i≥1} (|G_i|/|G_0|) codim V^{G_i} for
every finite Galois L/K with ρ trivial on Gal(K^sep/L) ∩ P_K. (Comment-block fallback: the lower
ramification groups of a finite Galois extension of local fields are LocalFieldsRamification
layer 3 declarations, outside the Mathlib-only build.) -/

theorem swanConductor_eq_zero_iff (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    swanConductor ρ = 0 ↔ GaloisRep.IsTamelyRamified ρ := by sorry

/-- The wild inertia group as a continuous homomorphism into `G_K`. -/
def wildInertiaInclusion (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    GaloisRep.localWildInertiaGroup K →ₜ* Field.absoluteGaloisGroup K :=
  ⟨(GaloisRep.localWildInertiaGroup K).subtype, continuous_subtype_val⟩

/-- The inertia group as a continuous homomorphism into `G_K`. -/
def inertiaInclusion (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    GaloisRep.inertiaGroup K →ₜ* Field.absoluteGaloisGroup K :=
  ⟨(GaloisRep.inertiaGroup K).subtype, continuous_subtype_val⟩

theorem swanConductor_congr {V' : Type*} [AddCommGroup V'] [Module F V'] [Module.Finite F V']
    [TopologicalSpace V'] [IsModuleTopology F V']
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F V')
    (h : Nonempty (ContinuousRep.Iso (ρ.res (wildInertiaInclusion K))
      (ρ'.res (wildInertiaInclusion K)))) :
    breaks ρ = breaks ρ' ∧ swanConductor ρ = swanConductor ρ' := by sorry

theorem swanConductor_extendScalars {F' : Type*} [Field F'] [TopologicalSpace F'] [Algebra F F']
    {V' : Type*} [AddCommGroup V'] [Module F' V'] [Module.Finite F' V'] [TopologicalSpace V']
    [IsModuleTopology F' V'] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F' V') (e : F' ⊗[F] V ≃ₗ[F'] V')
    (he : ∀ g, (e : F' ⊗[F] V →ₗ[F'] V') ∘ₗ (ρ g).baseChange F' = ρ' g ∘ₗ e) :
    breaks ρ' = breaks ρ ∧ swanConductor ρ' = swanConductor ρ := by sorry

theorem swanConductor_le (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    swanConductor ρ ≤ highestBreak ρ * Module.finrank F V ∧
      (swanConductor ρ = highestBreak ρ * Module.finrank F V ↔
        breaks ρ ⊆ {highestBreak ρ}) := by sorry

/- TauCeti.Conductor.lowerRamificationGroup_completion: for a place of a function field over a
finite field, the lower groups of the completed extension agree with TauCeti.Place.ramificationGroup
(AlgebraicCurves layer 8). (Comment-block fallback: TauCeti.Place is outside the Mathlib-only
build.) -/

/-- Unit test: TauCeti.Conductor.swanConductor_trivial. -/
example (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) (h : GaloisRep.IsTamelyRamified ρ) :
    swanConductor ρ = 0 ∧ breakDecomposition ρ 0 = ⊤ := by sorry

/-- Unit test: TauCeti.Conductor.swanConductor_chiMinusFour. -/
example (χ χ' : Field.absoluteGaloisGroup ℚ_[2] →ₜ* ℚˣ) (i s : AlgebraicClosure ℚ_[2])
    (hi : i ^ 2 = -1) (hs : s ^ 2 = 2) (hχ : ∀ σ, χ σ = 1 ↔ σ • i = i)
    (hχ' : ∀ σ, χ' σ = 1 ↔ σ • s = s) :
    breaks (ContinuousRep.ofCharacter χ) = {1} ∧ swanConductor (ContinuousRep.ofCharacter χ) = 1 ∧
      breaks (ContinuousRep.ofCharacter χ') = {2} ∧
      swanConductor (ContinuousRep.ofCharacter χ') = 2 := by sorry

/- TauCeti.Conductor.swanConductor_unweighted_fails: over L = Q_2(ζ_8) the unweighted sum
Σ_{i≥1} codim χ_8^{G_i} is 3, while Sw(χ_8) = 2. (Comment-block fallback: lower ramification
groups, as for swanConductor_eq_lowerSum.) -/

/- TauCeti.Conductor.swanConductor_eq_lowerSum_any: for χ_8 the weighted lower-numbering sums over
Q_2(√2) and over Q_2(ζ_8) agree (both 2). (Comment-block fallback, as above.) -/

/-- Unit test: TauCeti.Conductor.absUpperRamificationGroup_zero. -/
example : absUpperRamificationGroup K 0 = GaloisRep.inertiaGroup K ∧
    ∀ u > (0 : ℝ), absUpperRamificationGroup K u ≤ GaloisRep.localWildInertiaGroup K := by sorry

end Swan

/-! ### Finiteness of the wild inertia image for coefficients of characteristic different from p (ArithmeticGaloisRepresentations:R01.3/finite-wild-image) -/

/-- ArithmeticGaloisRepresentations:R01.3/finite-wild-image, case (c): for a coefficient field `E`
that is a nonarchimedean local field whose residue characteristic differs from that of `K`, the
image of wild inertia under a continuous representation is finite. Cases (a), (b) (discrete and
complex coefficients, where the whole image is finite) are
R01.1/finite-coefficients-and-finite-quotients; case (d) (`Q̄_ℓ`) follows from (c) by
R01.1/baire-descent-to-a-finite-coefficient-field. The injectivity of the reduction map on `ρ(P_K)`
is `artinConductor_reduction_le` below in the form used. -/
theorem finite_range_wildInertia {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {E : Type*} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (hℓ : ringChar 𝓀[E] ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) :
    (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite := by sorry

/-! ### The wild inertia action factors through a finite Galois extension (ArithmeticGaloisRepresentations:R01.3/wild-action-factors-through-a-finite-galois-extension) -/

/-- ArithmeticGaloisRepresentations:R01.3/wild-action-factors-through-a-finite-galois-extension,
part (a) in group form: if `ρ(P_K)` is finite there is an open normal subgroup `U` of `G_K` (the
group of a finite Galois extension `L/K`) such that `ρ` is trivial on `U ∩ P_K`. Parts (b)–(d)
(the induced representation `ρ_L` of the wild inertia group `Gal(L/K)_1`, its compatibility in `L`,
and the inertia variant) need the finite-level ramification groups of Tau Ceti
LocalFieldsRamification and are not typed. -/
theorem exists_open_normal_trivial_on_wildInertia {K : Type*} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F]
    [IsTopologicalRing F] [T2Space F]
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    ∃ U : Subgroup (Field.absoluteGaloisGroup K), U.Normal ∧
      IsOpen (U : Set (Field.absoluteGaloisGroup K)) ∧
      ∀ σ ∈ U, σ ∈ GaloisRep.localWildInertiaGroup K → ρ σ = LinearMap.id := by sorry

/-! ### The Artin conductor exponent and its wild part (ArithmeticGaloisRepresentations:R01.3/artin-conductor-with-its-wild-part) -/

section Artin

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {F : Type*} [Field F] [TopologicalSpace F]
  {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
  [IsModuleTopology F V]

/-- The tame part `ε(V) = dim V − dim V^{ρ(I_K)}`. -/
def tameConductor (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℕ :=
  Module.finrank F V - Module.finrank F (invariants ρ.toRepresentation (GaloisRep.inertiaGroup K))

/-- The Artin conductor exponent `a(V) = codim V^{ρ(I_K)} + Sw(V) ∈ ℚ_{≥0}`. -/
def artinConductor (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℚ :=
  tameConductor ρ + swanConductor ρ

/-- `a(V)` as a natural number (an integer by Hasse–Arf, R01.3/hasse-arf-integrality). -/
def artinConductorNat (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) : ℕ :=
  ⌊artinConductor ρ⌋₊

theorem artinConductor_eq_tame_add_swan (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) :
    artinConductor ρ = tameConductor ρ + swanConductor ρ := by sorry

/- TauCeti.Conductor.artinConductor_eq_lowerSum: for finite inertia image,
a(V) = Σ_{i≥0} (|G_i|/|G_0|) codim V^{G_i} (Serre (1.2.1)). (Comment-block fallback: lower
ramification groups, as for swanConductor_eq_lowerSum.) -/

theorem artinConductor_congr {V' : Type*} [AddCommGroup V'] [Module F V'] [Module.Finite F V']
    [TopologicalSpace V'] [IsModuleTopology F V']
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F V')
    (h : Nonempty (ContinuousRep.Iso (ρ.res (inertiaInclusion K)) (ρ'.res (inertiaInclusion K)))) :
    artinConductor ρ = artinConductor ρ' := by sorry

theorem artinConductor_extendScalars {F' : Type*} [Field F'] [TopologicalSpace F'] [Algebra F F']
    {V' : Type*} [AddCommGroup V'] [Module F' V'] [Module.Finite F' V'] [TopologicalSpace V']
    [IsModuleTopology F' V'] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F' V') (e : F' ⊗[F] V ≃ₗ[F'] V')
    (he : ∀ g, (e : F' ⊗[F] V →ₗ[F'] V') ∘ₗ (ρ g).baseChange F' = ρ' g ∘ₗ e) :
    artinConductor ρ' = artinConductor ρ := by sorry

/-- For an `ℓ`-adic representation `ρ` of `G_K`, `ℓ ≠ p` (`hℓ`), with Weil–Deligne representation
`(r, N)`: `V^{ρ(I_K)} = (ker N)^{r(I_K)}`. The triple `(W, deg, ι)` is the Weil group of `K` as far
as this statement sees it: `ι : W → G_K` is injective (`hι`), maps the inertia subgroup `deg.ker`
of `W` onto `I_K` (`hI`), and `deg.ker` is compact (`hc`), so that it carries the topology of `I_K`.
The homomorphism `t : I_K → ℤ_ℓ` is onto (`ht`) and trivial on wild inertia (`htP`), as
`T ∘ t_ℓ` is. Without these hypotheses (`ι` trivial, or `t = 1`, or `ℓ = p`) the right side is not
the Weil–Deligne representation of `ρ` and the statement fails. -/
theorem invariants_inertia_eq_ker_monodromy {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {ι : W →ₜ* Field.absoluteGaloisGroup K}
    {q ℓ : ℕ} [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) {E : Type*} [Field E]
    [TopologicalSpace E] [Algebra ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (hc : IsCompact (deg.ker : Set W))
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : Function.Surjective t)
    (htP : ∀ σ : deg.ker, ι σ ∈ GaloisRep.localWildInertiaGroup K → t σ = 1) :
    invariants ρ.toRepresentation (GaloisRep.inertiaGroup K) =
      LinearMap.ker (WeilDeligneRep.ofEllAdic (q := q) (ρ.res ι) F hF t).N ⊓
        invariants (WeilDeligneRep.ofEllAdic (q := q) (ρ.res ι) F hF t).r deg.ker := by sorry

/- TauCeti.Conductor.artinConductor_eq_characterConductorExp: for K/Q_p finite and a continuous
finite-order character χ of G_K, a(χ) = ClassFieldTheory.characterConductorExp(χ ∘ artinMap).
(Comment-block fallback: artinMap and characterConductorExp are ClassFieldTheory declarations
outside the Mathlib-only build.) -/

/-- Unit test: TauCeti.Conductor.artinConductor_unramified. -/
example (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V) [Module.Projective F V] :
    (GaloisRep.IsUnramified ρ → artinConductor ρ = 0) ∧
      (Subsingleton V → artinConductor ρ = 0) := by sorry

/- TauCeti.Conductor.artinConductor_tateCurve: for the Tate curve E_q over K and ℓ ≠ p,
a(V_ℓ E_q) = 1. (Comment-block fallback: the Tate curve's Tate module is owned by EllipticCurves
layer 4 / R01.6.) -/

/-- Unit test: TauCeti.Conductor.artinConductor_dyadicQuadratic. -/
example (χ χ' : Field.absoluteGaloisGroup ℚ_[2] →ₜ* ℚˣ) (i s : AlgebraicClosure ℚ_[2])
    (hi : i ^ 2 = -1) (hs : s ^ 2 = 2) (hχ : ∀ σ, χ σ = 1 ↔ σ • i = i)
    (hχ' : ∀ σ, χ' σ = 1 ↔ σ • s = s) :
    artinConductor (ContinuousRep.ofCharacter χ) = 2 ∧
      artinConductor (ContinuousRep.ofCharacter χ') = 3 := by sorry

/- TauCeti.Conductor.artinConductor_lift_fails: for the ℓ-adic Steinberg representation (a = 1)
and the stable lattice Λ = O_E e_1 ⊕ ℓ O_E e_2 (N e_2 = e_1), the residual Λ/ℓΛ is unramified, so
a(ρ̄_Λ) = 0 ≠ a(ρ). (Comment-block fallback: the Steinberg representation of G_K is built from the
Tate curve or the tame character, R01.6.) -/

/-- Unit test: TauCeti.Conductor.artinConductor_tameOnly_fails. -/
example (χ : Field.absoluteGaloisGroup ℚ_[2] →ₜ* ℚˣ) (s : AlgebraicClosure ℚ_[2])
    (hs : s ^ 2 = 2) (hχ : ∀ σ, χ σ = 1 ↔ σ • s = s) :
    tameConductor (ContinuousRep.ofCharacter χ) = 1 ∧
      artinConductor (ContinuousRep.ofCharacter χ) = 3 := by sorry

end Artin

/-! ### Integrality and independence of choices of Artin and Swan conductors (ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality) -/

/-- ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality, parts (a) and (c): `Sw(V)` and
`a(V)` are nonnegative integers; `a(V) = 0` iff `ρ` is unramified; `Sw(V) = 0` iff `ρ` is tamely
ramified, iff `a(V) = codim V^{I_K}`. Part (b) (independence of the finite Galois extension, of the
algebraic closure and of the coefficient field) is not typed: the definitions above involve no such
choice. Part (d) is `artinConductor_character` below. -/
theorem hasseArf_integrality {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F]
    (hF : ringChar F ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    (swanConductor ρ = ⌊swanConductor ρ⌋₊ ∧ artinConductor ρ = artinConductorNat ρ) ∧
      (artinConductor ρ = 0 ↔ GaloisRep.IsUnramified ρ) ∧
      (artinConductor ρ = tameConductor ρ ↔ GaloisRep.IsTamelyRamified ρ) := by sorry

/-- ArithmeticGaloisRepresentations:R01.3/hasse-arf-integrality, part (d): a ramified continuous
character `χ` with finite wild image (possibly of infinite order) has an integral upper break `n`
(Hasse–Arf): `χ` is nontrivial on `G_K^n`, trivial on `G_K^u` for `u > n`, and `a(χ) = n + 1`. -/
theorem artinConductor_character {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    (hF : ringChar F ≠ ringChar 𝓀[K]) (χ : Field.absoluteGaloisGroup K →ₜ* Fˣ)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => χ σ).Finite)
    (hram : ∃ σ ∈ GaloisRep.inertiaGroup K, χ σ ≠ 1) :
    ∃ n : ℕ, (∃ σ ∈ absUpperRamificationGroup K (n : ℝ), χ σ ≠ 1) ∧
      (∀ u : ℝ, (n : ℝ) < u → ∀ σ ∈ absUpperRamificationGroup K u, χ σ = 1) ∧
      artinConductor (ContinuousRep.ofCharacter χ) = n + 1 := by sorry

/-! ### Swan conductors through orbits of wild characters: reduction to finite groups in characteristic 0 (ArithmeticGaloisRepresentations:R01.3/swan-conductor-orbit-formula) -/

/- ArithmeticGaloisRepresentations:R01.3/swan-conductor-orbit-formula: for a finite Galois totally
ramified extension with group G_0, wild subgroup G_1 and lower groups G_i, and F algebraically closed
of characteristic ≠ p, put sw(W) = Σ_{i≥1} (|G_i|/|G_0|) codim W^{G_i} for an F[G_1]-module W. Every
simple F[G_1]-module θ lifts to a simple characteristic-0 representation θ̃ of G_1 with the same
dimensions of invariants and the same stabiliser T ⊇ G_1 in G_0; θ̃ extends to T (T/G_1 is cyclic);
and Σ over the G_0-orbit of θ of sw = [G_0 : T]·sw(θ) = Sw(Ind_T^{G_0} θ̃_T). Hence
Sw(V) = Σ_{orbits} m_θ·Sw(Ind_T^{G_0} θ̃_T) for every V of R01.3 whose wild action factors through
G_1. Comment-block fallback: the lower ramification groups of a finite Galois extension of local
fields are Tau Ceti LocalFieldsRamification layer 3 declarations, outside the Mathlib-only build;
the statement has no form without them. -/

/-! ### The conductor of a Weil–Deligne representation, with its monodromy term (ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation) -/

section WeilDeligne

/-- The Swan conductor of a representation `r` of the Weil group `W` (with its map
`ι : W → G_K`), computed from the filtration `ι⁻¹(G_K^u)`, `u > 0`, which lies in `P_K ⊆ W`. -/
def weilSwanConductor (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {W : Type*} [Group W] [TopologicalSpace W]
    (ι : W →ₜ* Field.absoluteGaloisGroup K) {Ω : Type*} [Field Ω] {V : Type*} [AddCommGroup V]
    [Module Ω V] (r : Representation Ω W V) : ℚ := sorry

/-- `a(r) = codim V^{r(I_K)} + Sw(r)`. -/
def weilArtinConductor (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {W : Type*} [Group W] [TopologicalSpace W]
    (deg : W →* Multiplicative ℤ) (ι : W →ₜ* Field.absoluteGaloisGroup K) {Ω : Type*} [Field Ω]
    {V : Type*} [AddCommGroup V] [Module Ω V] (r : Representation Ω W V) : ℚ :=
  (Module.finrank Ω V - Module.finrank Ω (invariants r deg.ker) : ℕ) + weilSwanConductor K ι r

/-- `a(r, N) = Sw(r) + dim V − dim (ker N)^{r(I_K)}`. -/
def wdConductor (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {W : Type*} [Group W] [TopologicalSpace W]
    {deg : W →* Multiplicative ℤ} {q : ℕ} (ι : W →ₜ* Field.absoluteGaloisGroup K) {Ω : Type*}
    [Field Ω] {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
    (D : WeilDeligneRep W deg q Ω V) : ℚ :=
  weilSwanConductor K ι D.r +
    (Module.finrank Ω V -
      Module.finrank Ω (LinearMap.ker D.N ⊓ invariants D.r deg.ker : Submodule Ω V) : ℕ)

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ} {q : ℕ}
  {ι : W →ₜ* Field.absoluteGaloisGroup K}
  {Ω : Type*} [Field Ω] [CharZero Ω]
  {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
  {V' : Type*} [AddCommGroup V'] [Module Ω V'] [FiniteDimensional Ω V']


theorem wdConductor_eq (D : WeilDeligneRep W deg q Ω V) :
    wdConductor K ι D = weilArtinConductor K deg ι D.r +
      (Module.finrank Ω (invariants D.r deg.ker) -
        Module.finrank Ω (LinearMap.ker D.N ⊓ invariants D.r deg.ker : Submodule Ω V) : ℕ) := by
  sorry

theorem wdConductor_zero (D : WeilDeligneRep W deg q Ω V) (hN : D.N = 0) :
    wdConductor K ι D = weilArtinConductor K deg ι D.r := by sorry

/- From here on the triple `(W, deg, ι)` is tied to the Weil group of `K` by two hypotheses:
`hι`, the map `ι : W → G_K` is injective, and `hI`, it maps the inertia subgroup `deg.ker` of `W`
onto `I_K`. They give `ι⁻¹(G_K^u) ⊆ deg.ker` for `u > 0`, which every statement about the Swan term
needs: for `W = ℤ` and `ι` trivial the filtration `ι⁻¹(G_K^u)` is all of `W` and the statements
below fail. (`wdConductor_eq` and `wdConductor_zero` above are identities between the definitions
and need nothing.) -/

/-- `a(ρ) = a(WD(ρ))` for an `ℓ`-adic representation `ρ` of `G_K` with finite wild image (`hP`),
`ℓ ≠ p` (`hℓ`). Besides `hι`, `hI`: the inertia subgroup `deg.ker` of `W` is compact (`hc`), so
that it carries the topology of `I_K`, and `t : I_K → ℤ_ℓ` is onto (`ht`) and trivial on wild
inertia (`htP`), as `T ∘ t_ℓ` is. Without them the statement is false: for `W = ℤ` and `ι` trivial
the right side does not depend on `ρ`. -/
theorem artinConductor_eq_wdConductor {ℓ : ℕ} [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0)
    {E : Type*} [Field E] [CharZero E]
    [TopologicalSpace E] [Algebra ℚ_[ℓ] E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (hc : IsCompact (deg.ker : Set W))
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) (t : deg.ker →* Multiplicative ℤ_[ℓ])
    (ht : Function.Surjective t)
    (htP : ∀ σ : deg.ker, ι σ ∈ GaloisRep.localWildInertiaGroup K → t σ = 1) :
    artinConductor ρ = wdConductor K ι (WeilDeligneRep.ofEllAdic (q := q) (ρ.res ι) F hF t) := by
  sorry

theorem wdConductor_frobeniusSemisimplification (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (D : WeilDeligneRep W deg q Ω V) (F : W)
    (hF : deg F = Multiplicative.ofAdd (-1)) :
    wdConductor K ι (WeilDeligneRep.frobeniusSemisimplification D F hF) = wdConductor K ι D := by
  sorry

theorem wdConductor_add (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (D : WeilDeligneRep W deg q Ω V) (D' : WeilDeligneRep W deg q Ω V') :
    wdConductor K ι (WeilDeligneRep.prod D D') = wdConductor K ι D + wdConductor K ι D' := by sorry

theorem wdConductor_twist_unramified (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (D : WeilDeligneRep W deg q Ω V) (α : Ωˣ) (h) :
    wdConductor K ι (D.twist (GaloisRep.weilUnramifiedCharacter deg α) h) = wdConductor K ι D := by
  sorry

/-- `a(sp(n) ⊗ χ)` for `n ≥ 1` (`hn`; for `n = 0` the representation is zero and its conductor is
`0`, not `−1`): `n − 1` if `χ` is unramified, `n · a(χ)` otherwise. -/
theorem wdConductor_sp (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (n : ℕ) (hn : 0 < n) (hq : (q : Ω) ≠ 0) (χ : W →* Ωˣ) (h : IsOpen {w | χ w = 1}) :
    ((∀ σ ∈ deg.ker, χ σ = 1) → wdConductor K ι (WeilDeligneRep.tensor
      (WeilDeligneRep.special (W := W) (deg := deg) n hq) (WeilDeligneRep.ofCharacter χ h)) =
        n - 1) ∧
    ((∃ σ ∈ deg.ker, χ σ ≠ 1) → wdConductor K ι (WeilDeligneRep.tensor
      (WeilDeligneRep.special (W := W) (deg := deg) n hq) (WeilDeligneRep.ofCharacter χ h)) =
        n * wdConductor K ι (WeilDeligneRep.ofCharacter (deg := deg) (q := q) χ h)) := by sorry

/-- Unit test: TauCeti.Conductor.wdConductor_steinberg. -/
example (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (D : WeilDeligneRep W deg q Ω (Fin 2 → Ω)) (hN : D.N ≠ 0)
    (hr : ∀ σ ∈ deg.ker, D.r σ = LinearMap.id) : wdConductor K ι D = 1 := by sorry

/-- Unit test: TauCeti.Conductor.wdConductor_N_zero. -/
example (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (D : WeilDeligneRep W deg q Ω V) (hN : D.N = 0) :
    wdConductor K ι D = weilArtinConductor K deg ι D.r ∧
      ((∀ σ ∈ deg.ker, D.r σ = LinearMap.id) → wdConductor K ι D = 0) := by sorry

/-- Unit test: TauCeti.Conductor.wdConductor_kerN_fails. -/
example (hι : Function.Injective ι)
    (hI : deg.ker.map ι.toMonoidHom = GaloisRep.inertiaGroup K)
    (hq : (q : Ω) ≠ 0) (χ : W →* Ωˣ) (h : IsOpen {w | χ w = 1})
    (hχ : ∃ σ ∈ deg.ker, χ σ ≠ 1)
    (htame : ∀ u > (0 : ℝ), ∀ σ, ι σ ∈ absUpperRamificationGroup K u → χ σ = 1) :
    let D := WeilDeligneRep.tensor (WeilDeligneRep.special (W := W) (deg := deg) 2 hq)
      (WeilDeligneRep.ofCharacter χ h)
    wdConductor K ι D = 2 ∧
      weilArtinConductor K deg ι D.r +
        ((Module.finrank Ω (invariants D.r deg.ker) : ℚ) -
          Module.finrank Ω (LinearMap.ker D.N)) = 1 := by sorry

/- TauCeti.Conductor.artinConductor_eq_wdConductor_tate: for the Tate curve,
a(V_ℓ E_q) = a(WD(V_ℓ E_q)) = 1. (Comment-block fallback, as for artinConductor_tateCurve.) -/

end WeilDeligne

/-! ### Global conductors and the prime-to-p conductor N(ρ̄) (ArithmeticGaloisRepresentations:R01.3/global-conductor-and-prime-to-p-conductor) -/

section Global

variable (F : Type*) [Field F] [NumberField F]
  {C : Type*} [Field C] [TopologicalSpace C]
  {V : Type*} [AddCommGroup V] [Module C V] [Module.Finite C V] [TopologicalSpace V]
  [IsModuleTopology C V]

/-- The local exponent `a_v(ρ) = a(ρ|_{G_{F_v}})` (R01.2/local-restriction followed by
`artinConductorNat` at the completion `F_v`, whose local-field instances are supplied by
NumberFieldArithmetic). -/
def localConductorExponent (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (v : HeightOneSpectrum (𝓞 F)) : ℕ := sorry

/-- The `Σ`-conductor `N^Σ(ρ) = ∏_{v ∉ Σ} 𝔭_v^{a_v(ρ)}`. -/
def globalConductor (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (S : Set (HeightOneSpectrum (𝓞 F))) : Ideal (𝓞 F) :=
  ∏ᶠ (v : HeightOneSpectrum (𝓞 F)) (_ : v ∉ S), v.asIdeal ^ localConductorExponent F ρ v

/-- The prime-to-`p` conductor `N(ρ̄) = N^{{v | p}}(ρ̄)` of a representation over a finite field of
characteristic `p`. -/
def primeToPConductor (p : ℕ) [CharP C p] [Finite C]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V) : Ideal (𝓞 F) :=
  globalConductor F ρ {v | (p : 𝓞 F) ∈ v.asIdeal}

variable {F}

/-- `v_𝔭(N^Σ(ρ)) = a_v(ρ)` for `v ∉ Σ` and `0` for `v ∈ Σ`, for `ρ` ramified at finitely many
places (`hfin`, a hypothesis of the node: without it the product defining `N^Σ(ρ)` is infinite,
and a nonzero ideal cannot have infinitely many prime factors). -/
theorem globalConductor_eq_prod (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (hfin : (GaloisRep.ramificationSet F ρ.toRepresentation).Finite)
    (S : Set (HeightOneSpectrum (𝓞 F))) (v : HeightOneSpectrum (𝓞 F)) :
    (v ∉ S → v.asIdeal ^ localConductorExponent F ρ v ∣ globalConductor F ρ S ∧
      ¬ v.asIdeal ^ (localConductorExponent F ρ v + 1) ∣ globalConductor F ρ S) ∧
    (v ∈ S → ¬ v.asIdeal ∣ globalConductor F ρ S) := by sorry

theorem globalConductor_eq_one_iff (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (hfin : (GaloisRep.ramificationSet F ρ.toRepresentation).Finite)
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    globalConductor F ρ S = ⊤ ↔ ∀ v ∉ S, GaloisRep.IsUnramifiedAt F ρ.toRepresentation v := by
  sorry

theorem primeToPConductor_coprime (p : ℕ) [CharP C p] [Finite C]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V) :
    primeToPConductor F p ρ ⊔ Ideal.span {(p : 𝓞 F)} = ⊤ := by sorry

theorem globalConductor_congr {V' : Type*} [AddCommGroup V'] [Module C V'] [Module.Finite C V']
    [TopologicalSpace V'] [IsModuleTopology C V']
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup F) C V') (h : Nonempty (ContinuousRep.Iso ρ ρ'))
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    globalConductor F ρ S = globalConductor F ρ' S := by sorry

/-- `N^Σ(ρ ⊕ ρ′) = N^Σ(ρ)·N^Σ(ρ′)`, and `N^Σ(ρ)·N^Σ(ρ′)` divides `N^Σ(ρ″)` for every extension
`ρ″` of `ρ′` by `ρ`, when `ρ″` (hence `ρ` and `ρ′`) is ramified at finitely many places (`hfin`).
The last clause of the packet's item (equality when every inertia image is finite of order
invertible in the coefficient field) is not typed. -/
theorem globalConductor_add {V' : Type*} [AddCommGroup V'] [Module C V'] [Module.Finite C V']
    [TopologicalSpace V'] [IsModuleTopology C V']
    {V'' : Type*} [AddCommGroup V''] [Module C V''] [Module.Finite C V''] [TopologicalSpace V'']
    [IsModuleTopology C V'']
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) C V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup F) C V')
    (ρ'' : ContinuousRep (Field.absoluteGaloisGroup F) C V'')
    (hfin : (GaloisRep.ramificationSet F ρ''.toRepresentation).Finite)
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    (∀ e : (V × V') ≃ₗ[C] V'', (∀ g, e.toLinearMap ∘ₗ LinearMap.prodMap (ρ g) (ρ' g) =
        ρ'' g ∘ₗ e.toLinearMap) →
      globalConductor F ρ'' S = globalConductor F ρ S * globalConductor F ρ' S) ∧
    (∀ (f : V →ₗ[C] V'') (g : V'' →ₗ[C] V'), Function.Injective f → Function.Surjective g →
      LinearMap.range f = LinearMap.ker g → (∀ x, f ∘ₗ ρ x = ρ'' x ∘ₗ f) →
        (∀ x, g ∘ₗ ρ'' x = ρ' x ∘ₗ g) →
          globalConductor F ρ S * globalConductor F ρ' S ∣ globalConductor F ρ'' S) := by sorry

/-- For `F = ℚ`, the positive integer generator of `N^Σ(ρ)` (its absolute norm). -/
def globalConductor_natCast (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) C V)
    (S : Set (HeightOneSpectrum (𝓞 ℚ))) : ℕ :=
  Ideal.absNorm (globalConductor ℚ ρ S)

/-- Unit test: TauCeti.Conductor.globalConductor_trivial. -/
example (S : Set (HeightOneSpectrum (𝓞 F))) [Module.Projective C V] :
    globalConductor F (ContinuousRep.trivial : ContinuousRep (Field.absoluteGaloisGroup F) C V) S =
      ⊤ := by sorry

/-- Unit test: TauCeti.Conductor.globalConductor_chiMinusFour. -/
example (ε : DirichletCharacter ℂ 4) (hε : ε.IsPrimitive) (χ : Field.absoluteGaloisGroup ℚ →ₜ* ℂˣ)
    (hχ : χ.toMonoidHom = GaloisRep.dirichletCharacterToGalois ε) :
    globalConductor_natCast (ContinuousRep.ofCharacter χ) ∅ = 4 := by sorry

/-- Unit test: TauCeti.Conductor.primeToPConductor_cyclotomic. For `p` odd (`hp`): the mod-`2`
cyclotomic character is trivial, hence unramified at `2`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (k : Type*) [Field k] [Finite k] [CharP k p]
    [TopologicalSpace k]
    [DiscreteTopology k] (χ : Field.absoluteGaloisGroup ℚ →ₜ* kˣ)
    (hχ : ∀ σ, (χ σ : k) =
      ZMod.castHom (dvd_refl p) k (PadicInt.toZMod (GaloisRep.cyclotomicCharacter ℚ p σ : ℤ_[p]))) :
    primeToPConductor ℚ p (ContinuousRep.ofCharacter χ) = ⊤ ∧
      ∀ v : HeightOneSpectrum (𝓞 ℚ), (p : 𝓞 ℚ) ∈ v.asIdeal →
        ¬ GaloisRep.IsUnramifiedAt ℚ (ContinuousRep.ofCharacter χ).toRepresentation v := by sorry

/- TauCeti.Conductor.primeToPConductor_11a1: for E = 11a1, N(ρ̄_{E,5}) = 1 while N(ρ̄_{E,3}) = 11.
(Comment-block fallback: the mod-ℓ representations E[ℓ] are owned by R01.6.) -/

end Global

/-! ### Additivity, duality, twists and base change of conductors (ArithmeticGaloisRepresentations:R01.3/additivity-twist-and-unramified-invariance) -/

/-- ArithmeticGaloisRepresentations:R01.3/additivity-twist-and-unramified-invariance, part (a):
for `0 → V' → V → V'' → 0`, `Sw` is additive and `a(V) ≥ a(V') + a(V'')`; part (c) for unramified
twists: `a(V ⊗ χ) = a(V)` (twist realised on the same space). Not typed here: the equality
criterion of (a) (`V^{I_K} → V''^{I_K}` onto), the tame twists of (c), the base changes of (d)
(they need the finite-level Herbrand functions) and (e) (`swanConductor_extendScalars`,
`artinConductor_extendScalars` above). Part (b) is `artinConductor_dual` and the last case of (c)
is `artinConductor_twist_dominant`, below. -/
theorem conductor_exact_twist {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F]
    {V' V V'' : Type*} [AddCommGroup V'] [Module F V'] [Module.Finite F V'] [TopologicalSpace V']
    [IsModuleTopology F V'] [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] [AddCommGroup V''] [Module F V''] [Module.Finite F V'']
    [TopologicalSpace V''] [IsModuleTopology F V'']
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F V')
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ'' : ContinuousRep (Field.absoluteGaloisGroup K) F V'')
    (f : V' →ₗ[F] V) (g : V →ₗ[F] V'') (hf : Function.Injective f) (hg : Function.Surjective g)
    (hfg : LinearMap.range f = LinearMap.ker g) (hfρ : ∀ x, f ∘ₗ ρ' x = ρ x ∘ₗ f)
    (hgρ : ∀ x, g ∘ₗ ρ x = ρ'' x ∘ₗ g)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite)
    (χ : Field.absoluteGaloisGroup K →* Fˣ) (hχ : ∀ σ ∈ GaloisRep.inertiaGroup K, χ σ = 1)
    (ρχ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hρχ : ∀ σ, ρχ σ = (χ σ : F) • ρ σ) :
    swanConductor ρ = swanConductor ρ' + swanConductor ρ'' ∧
      artinConductor ρ' + artinConductor ρ'' ≤ artinConductor ρ ∧
      artinConductor ρχ = artinConductor ρ ∧ swanConductor ρχ = swanConductor ρ := by sorry

/-- ArithmeticGaloisRepresentations:R01.3/additivity-twist-and-unramified-invariance, part (b):
`Sw(V^∨) = Sw(V)` and `a(V^∨) = a(V)`, with no hypothesis on the inertia image (the tame inertia
quotient is procyclic). The dual is given on a space `V'` with an equivariant identification `e`
with `Module.Dual F V`. -/
theorem artinConductor_dual {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F]
    {V V' : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] [AddCommGroup V'] [Module F V'] [Module.Finite F V'] [TopologicalSpace V']
    [IsModuleTopology F V']
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) F V')
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite)
    (e : Module.Dual F V ≃ₗ[F] V')
    (he : ∀ g, (e : _ →ₗ[F] V') ∘ₗ ρ.toRepresentation.dual g = ρ' g ∘ₗ e) :
    swanConductor ρ' = swanConductor ρ ∧ artinConductor ρ' = artinConductor ρ := by sorry

/-- ArithmeticGaloisRepresentations:R01.3/additivity-twist-and-unramified-invariance, part (c),
last case (Ulmer, Proposition 1): if the character `χ` has the single break `b > 0` and every break
of `V` is `< b`, then every break of `V ⊗ χ` is `b`, `Sw(V ⊗ χ) = b · dim V` and
`a(V ⊗ χ) = a(χ) · dim V`. -/
theorem artinConductor_twist_dominant {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F] [IsTopologicalRing F]
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] [Nontrivial V]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hF : ringChar F ≠ ringChar 𝓀[K])
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite)
    (χ : Field.absoluteGaloisGroup K →ₜ* Fˣ)
    (hPχ : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => χ σ).Finite)
    (b : ℚ) (hb : 0 < b) (hχ : breaks (ContinuousRep.ofCharacter χ) = {b})
    (hρ : ∀ c ∈ breaks ρ, c < b) :
    breaks (ρ.twist χ) = {b} ∧ swanConductor (ρ.twist χ) = b * Module.finrank F V ∧
      artinConductor (ρ.twist χ) =
        artinConductor (ContinuousRep.ofCharacter χ) * Module.finrank F V := by sorry

/-! ### The induction (conductor–discriminant) formula (ArithmeticGaloisRepresentations:R01.3/induction-formula-for-conductors) -/

/-- ArithmeticGaloisRepresentations:R01.3/induction-formula-for-conductors (local form):
`a_K(Ind V) = δ(L/K) · dim V + f · a_L(V)` with `δ(L/K) = a_K(Ind 1)` (conductor–discriminant) and
`f` the residue degree; the induced representations are given with equivariant identifications
`e`, `e₁` with Mathlib's `Representation.ind` along `ι^* : G_L → G_K`. The local statement is proved
in R01.3/local-induction-formula (`swanConductor_induced` below gives its parts (a), (b)). The global
form (relative discriminant and norm of the conductor) follows place by place and is not typed; for
`F = ℚ` and `M` quadratic it reads `N(Ind ψ) = |d_M| · Nm 𝔣(ψ)` with
`|d_M| = (NumberField.discr M).natAbs`, Mathlib's `NumberField.discr` being the signed discriminant. -/
theorem artinConductor_induced {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {L : Type*} [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f)
    {F : Type*} [Field F] [TopologicalSpace F] (hF : ringChar F ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V]
    {VI : Type*} [AddCommGroup VI] [Module F VI] [Module.Finite F VI] [TopologicalSpace VI]
    [IsModuleTopology F VI]
    {V₁ : Type*} [AddCommGroup V₁] [Module F V₁] [Module.Finite F V₁] [TopologicalSpace V₁]
    [IsModuleTopology F V₁]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup L) F V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup L => ρ σ).Finite)
    (ρI : ContinuousRep (Field.absoluteGaloisGroup K) F VI)
    (ρ₁ : ContinuousRep (Field.absoluteGaloisGroup K) F V₁)
    (e : Representation.IndV (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation ≃ₗ[F]
      VI)
    (he : ∀ g, (e : _ →ₗ[F] VI) ∘ₗ
      Representation.ind (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation g =
        ρI g ∘ₗ e)
    (e₁ : Representation.IndV (GaloisRep.localEmbeddingMap K L).toMonoidHom
      (Representation.trivial F (Field.absoluteGaloisGroup L) F) ≃ₗ[F] V₁)
    (he₁ : ∀ g, (e₁ : _ →ₗ[F] V₁) ∘ₗ Representation.ind (GaloisRep.localEmbeddingMap K L).toMonoidHom
      (Representation.trivial F (Field.absoluteGaloisGroup L) F) g = ρ₁ g ∘ₗ e₁) :
    artinConductor ρI = artinConductor ρ₁ * Module.finrank F V + f * artinConductor ρ := by sorry

/-! ### Upper numbering of the subgroup G_L: the function ψ_{L/K} of a finite separable extension (ArithmeticGaloisRepresentations:R01.3/upper-numbering-of-an-open-subgroup) -/

/-- ArithmeticGaloisRepresentations:R01.3/upper-numbering-of-an-open-subgroup, parts (a), (b) in
existential form: for a finite separable `L/K`, not necessarily Galois, there is a continuous,
strictly increasing `ψ = ψ_{L/K}`, the identity on `[−1, 0]`, with `G_K^u ∩ G_L = G_L^{ψ(u)}` for
every `u ≥ −1` (the intersection is the preimage under `G_L → G_K`). The definition
`ψ_{L/K} = φ_{M/L} ∘ ψ_{M/K}` for a Galois `M ⊇ L`, the integral formula (c) and the formula (d),
`ψ(u) = e·u − d(L/K) + e − 1` beyond the breaks, need the Herbrand functions and the different
exponent of Tau Ceti LocalFieldsRamification layer 3 and are not typed. -/
theorem exists_herbrand_comap_absUpperRamificationGroup {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {L : Type*} [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] :
    ∃ ψ : ℝ → ℝ, Continuous ψ ∧ StrictMono ψ ∧ (∀ u ∈ Set.Icc (-1 : ℝ) 0, ψ u = u) ∧
      ∀ u : ℝ, -1 ≤ u →
        (absUpperRamificationGroup K u).comap (GaloisRep.localEmbeddingMap K L).toMonoidHom =
          absUpperRamificationGroup L (ψ u) := by sorry

/-! ### Invariants of an induced representation under a closed normal subgroup (ArithmeticGaloisRepresentations:R01.3/invariants-of-an-induced-representation) -/

/-- ArithmeticGaloisRepresentations:R01.3/invariants-of-an-induced-representation, the general
statement in its algebraic form: for a subgroup `H` of finite index, a normal subgroup `D` and a
finite-dimensional representation `σ` of `H`,
`dim (Ind_H^Γ σ)^D = [Γ : H·D] · dim σ^{H ∩ D}` (Mathlib's `Representation.ind` along the inclusion;
for the continuous induction of R01.1 with `H` open and `D` closed this is the same space). -/
theorem finrank_invariants_ind {Γ : Type*} [Group Γ] (H D : Subgroup Γ) [H.FiniteIndex] [D.Normal]
    {F : Type*} [Field F] {U : Type*} [AddCommGroup U] [Module F U] [FiniteDimensional F U]
    (σ : Representation F H U) :
    Module.finrank F (invariants (Representation.ind H.subtype σ) D) =
      (H ⊔ D).index * Module.finrank F (invariants σ (D.subgroupOf H)) := by sorry

/-- ArithmeticGaloisRepresentations:R01.3/invariants-of-an-induced-representation, local case:
`dim (Ind_{G_L}^{G_K} V)^{I_K} = f · dim V^{I_L}`, and the induced representation has finite wild
image if `V` has. The induced representation is given with an equivariant identification `e` with
Mathlib's `Representation.ind` along `G_L → G_K`; `f` is the residue degree. -/
theorem finrank_invariants_inertia_induced {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {L : Type*} [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f)
    {F : Type*} [Field F] [TopologicalSpace F]
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V]
    {VI : Type*} [AddCommGroup VI] [Module F VI] [Module.Finite F VI] [TopologicalSpace VI]
    [IsModuleTopology F VI]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup L) F V)
    (ρI : ContinuousRep (Field.absoluteGaloisGroup K) F VI)
    (e : Representation.IndV (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation ≃ₗ[F]
      VI)
    (he : ∀ g, (e : _ →ₗ[F] VI) ∘ₗ
      Representation.ind (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation g =
        ρI g ∘ₗ e) :
    Module.finrank F (invariants ρI.toRepresentation (GaloisRep.inertiaGroup K)) =
        f * Module.finrank F (invariants ρ.toRepresentation (GaloisRep.inertiaGroup L)) ∧
      ((Set.range fun σ : GaloisRep.localWildInertiaGroup L => ρ σ).Finite →
        (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρI σ).Finite) := by sorry

/-! ### The local induction formula for conductors, in rational form (ArithmeticGaloisRepresentations:R01.3/local-induction-formula) -/

/-- ArithmeticGaloisRepresentations:R01.3/local-induction-formula, parts (a) and (b), for a finite
separable `L/K` (not necessarily Galois) and `V` with finite wild image over a field of
characteristic `≠ p`: `codim (Ind V)^{I_K} = ([L:K] − f) · dim V + f · codim V^{I_L}` and
`Sw_K(Ind V) = f · Sw_L(V) + Sw_K(Ind 1) · dim V`. In the node the constant is
`Sw_K(Ind 1) = δ(L/K) − [L:K] + f = f · (d(L/K) − e + 1)`, with `d(L/K)` the different exponent and
`δ(L/K) = f · d(L/K)` the discriminant exponent; these are Tau Ceti LocalFieldsRamification layer 3
declarations and are named only here. Part (c), `a_K(Ind V) = δ(L/K) · dim V + f · a_L(V)`, is
`artinConductor_induced` above. The induced representations are given with equivariant
identifications `e`, `e₁` with Mathlib's `Representation.ind` along `G_L → G_K`. -/
theorem swanConductor_induced {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {L : Type*} [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (f : ℕ)
    (hf : Nat.card 𝓀[L] = Nat.card 𝓀[K] ^ f)
    {F : Type*} [Field F] [TopologicalSpace F] (hF : ringChar F ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V]
    {VI : Type*} [AddCommGroup VI] [Module F VI] [Module.Finite F VI] [TopologicalSpace VI]
    [IsModuleTopology F VI]
    {V₁ : Type*} [AddCommGroup V₁] [Module F V₁] [Module.Finite F V₁] [TopologicalSpace V₁]
    [IsModuleTopology F V₁]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup L) F V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup L => ρ σ).Finite)
    (ρI : ContinuousRep (Field.absoluteGaloisGroup K) F VI)
    (ρ₁ : ContinuousRep (Field.absoluteGaloisGroup K) F V₁)
    (e : Representation.IndV (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation ≃ₗ[F]
      VI)
    (he : ∀ g, (e : _ →ₗ[F] VI) ∘ₗ
      Representation.ind (GaloisRep.localEmbeddingMap K L).toMonoidHom ρ.toRepresentation g =
        ρI g ∘ₗ e)
    (e₁ : Representation.IndV (GaloisRep.localEmbeddingMap K L).toMonoidHom
      (Representation.trivial F (Field.absoluteGaloisGroup L) F) ≃ₗ[F] V₁)
    (he₁ : ∀ g, (e₁ : _ →ₗ[F] V₁) ∘ₗ Representation.ind (GaloisRep.localEmbeddingMap K L).toMonoidHom
      (Representation.trivial F (Field.absoluteGaloisGroup L) F) g = ρ₁ g ∘ₗ e₁) :
    (tameConductor ρI : ℚ) =
        ((Module.finrank K L : ℚ) - f) * Module.finrank F V + f * tameConductor ρ ∧
      swanConductor ρI = f * swanConductor ρ + swanConductor ρ₁ * Module.finrank F V := by sorry

/-! ### Reduction does not increase the conductor at primes different from the coefficient characteristic (ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor) -/

/-- ArithmeticGaloisRepresentations:R01.3/reduction-does-not-increase-the-conductor (local part,
(a) and (b)): for a `G_K`-stable lattice `Λ` over the discrete valuation ring `O` with fraction field
`E` and residue field `k` (`hk`), and the residual representation `ρ̄_Λ` on `Λ/𝔪Λ` (given with the
equivariant reduction map `π`): `Sw(ρ̄_Λ) = Sw(ρ)`, `a(ρ̄_Λ) ≤ a(ρ)`, and exactly
`a(ρ̄_Λ) + dim ρ̄_Λ^{I_K} = a(ρ) + dim V^{I_K}` (`ℓ ≠ p`; `ρ(P_K)` finite, `hP`, which is automatic
for `E` finite over `ℚ_ℓ` but not for the arbitrary topological field typed here). Without `O` a
discrete valuation ring with fraction field `E`, or with `k` larger than the residue field, the
dimensions of `V` and of `Λ/𝔪Λ` differ and the statement is false. Part (c) (the semisimplification) and the global divisibility
are not typed. -/
theorem artinConductor_reduction_le.{uO} {K : Type*} [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] {O : Type uO} [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O]
    {E : Type uO} [Field E] [TopologicalSpace E] [Algebra O E] [IsFractionRing O E]
    {k : Type*} [Field k] [TopologicalSpace k] [Algebra O k]
    (hk : Function.Surjective (algebraMap O k))
    (hℓ : ringChar k ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [TopologicalSpace V]
    [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
    {Vb : Type*} [AddCommGroup Vb] [Module k Vb] [Module.Finite k Vb] [TopologicalSpace Vb]
    [IsModuleTopology k Vb] [Module O Vb] [IsScalarTower O k Vb]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup K) E V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite)
    (Λ : GaloisLattice.IntegralModel O ρ)
    (ρb : ContinuousRep (Field.absoluteGaloisGroup K) k Vb) (π : Λ.lattice →ₗ[O] Vb)
    (hπ : Function.Surjective π) (hker : LinearMap.ker π = (IsLocalRing.maximalIdeal O) • ⊤)
    (heq : ∀ g (x : Λ.lattice), π ⟨ρ g x, Λ.stable g x x.2⟩ = ρb g (π x)) :
    swanConductor ρb = swanConductor ρ ∧ artinConductor ρb ≤ artinConductor ρ ∧
      artinConductor ρb +
          Module.finrank k (invariants ρb.toRepresentation (GaloisRep.inertiaGroup K)) =
        artinConductor ρ +
          Module.finrank E (invariants ρ.toRepresentation (GaloisRep.inertiaGroup K)) := by sorry

/-! ### Tame and small conductor computations (ArithmeticGaloisRepresentations:R01.3/tame-conductor-computations) -/

/-- ArithmeticGaloisRepresentations:R01.3/tame-conductor-computations, parts (a), (b), (d):
`a(V) = 0` iff unramified; for `ρ(P_K) = 1`, `a(V) = codim V^{I_K}`; for `dim V = 2`, `ρ(P_K) = 1`
and `V^{I_K} = 0`, `a(V) = 2`. Part (c) (Steinberg, `a = 1`) is the unit test
`TauCeti.Conductor.wdConductor_steinberg` above, and for the Tate curve over any nonarchimedean
local field it needs Tau Ceti EllipticCurves layer 4; the dyadic quadratic characters of part (e)
are the unit test `TauCeti.Conductor.artinConductor_dyadicQuadratic`; the cubic characters of `ℚ_3`
(`a = 2`) are not typed. -/
theorem tame_conductor_computations {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] {F : Type*} [Field F] [TopologicalSpace F]
    (hF : ringChar F ≠ ringChar 𝓀[K])
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hP : (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ).Finite) :
    (artinConductor ρ = 0 ↔ GaloisRep.IsUnramified ρ) ∧
      (GaloisRep.IsTamelyRamified ρ → artinConductor ρ = tameConductor ρ) ∧
      (Module.finrank F V = 2 → GaloisRep.IsTamelyRamified ρ →
        invariants ρ.toRepresentation (GaloisRep.inertiaGroup K) = ⊥ → artinConductor ρ = 2) := by
  sorry

/-! ### Swan conductor of an Artin–Schreier character (ArithmeticGaloisRepresentations:R01.3/artin-schreier-swan-conductor) -/

/-- ArithmeticGaloisRepresentations:R01.3/artin-schreier-swan-conductor: in characteristic `p`,
for `u = w π^{−m}` (`p ∤ m`) and `α^p − α = u`, every nontrivial character `ψ` of `Gal(K(α)/K)`
has `Sw(ψ) = m` and `a(ψ) = m + 1`. -/
theorem swanConductor_artinSchreier {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime] [CharP K p] (m : ℕ) (hm : 0 < m)
    (hpm : ¬ p ∣ m) (π : 𝒪[K]) (hπ : Irreducible π) (w : (𝒪[K])ˣ) (u : K)
    (hu : u = ((w : 𝒪[K]) : K) * (π : K) ^ (-(m : ℤ))) (α : AlgebraicClosure K)
    (hα : α ^ p - α = algebraMap K _ u) {F : Type*} [Field F] [TopologicalSpace F]
    [IsTopologicalRing F] (hF : ringChar F ≠ p) (ψ : Field.absoluteGaloisGroup K →ₜ* Fˣ)
    (hψ : ∀ σ, σ • α = α → ψ σ = 1) (hψ' : ψ ≠ 1) :
    swanConductor (ContinuousRep.ofCharacter ψ) = m ∧
      artinConductor (ContinuousRep.ofCharacter ψ) = m + 1 := by sorry

/-! ### The conductor exponent of an elliptic curve (ArithmeticGaloisRepresentations:R01.3/conductor-of-an-elliptic-curve) -/

section Elliptic

variable (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The `ℓ`-adic Tate module `V_ℓ E` of an elliptic curve as a continuous representation of `G_K`
on `ℚ_ℓ²` (R01.6/tate-module-of-an-abelian-variety; a chosen basis). -/
def ellipticTateModuleRep (E : WeierstrassCurve K) [E.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup K) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]) := sorry

/-- The residual representation `E[ℓ]` (the reduction of the lattice `T_ℓ E`,
R01.6/torsion-and-residual-representation; a chosen basis). -/
def ellipticTorsionRep (E : WeierstrassCurve K) [E.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup K) (ZMod ℓ) (Fin 2 → ZMod ℓ) := sorry

/-- The conductor exponent `f(E) = a(V_{ℓ₀} E)`, `ℓ₀` the least prime different from the residue
characteristic. -/
def ellipticConductorExp (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry

/-- The tame part `ε(E) = codim (V_ℓ E)^{I_K} ∈ {0, 1, 2}`. -/
def ellipticTameConductor (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry

/-- The wild part `δ(E) = Sw(V_ℓ E) = Sw(E[ℓ])`, `ℓ ≠ p`. -/
def ellipticSwanConductor (E : WeierstrassCurve K) [E.IsElliptic] : ℕ := sorry

variable {K}

theorem ellipticConductorExp_eq_artinConductor (E : WeierstrassCurve K) [E.IsElliptic] (ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[K]) ≠ 0) :
    (ellipticConductorExp K E : ℚ) = artinConductor (ellipticTateModuleRep K E ℓ) ∧
      (ellipticTameConductor K E : ℚ) = tameConductor (ellipticTateModuleRep K E ℓ) ∧
      (ellipticSwanConductor K E : ℚ) = swanConductor (ellipticTateModuleRep K E ℓ) ∧
      ellipticConductorExp K E = ellipticTameConductor K E + ellipticSwanConductor K E := by sorry

theorem ellipticTameConductor_eq (E : WeierstrassCurve K) [E.IsElliptic] :
    (WeierstrassCurve.HasGoodReduction 𝒪[K] (E.minimal 𝒪[K]) → ellipticTameConductor K E = 0) ∧
      (WeierstrassCurve.HasMultiplicativeReduction 𝒪[K] (E.minimal 𝒪[K]) →
        ellipticTameConductor K E = 1) ∧
      (WeierstrassCurve.HasAdditiveReduction 𝒪[K] (E.minimal 𝒪[K]) →
        ellipticTameConductor K E = 2) := by sorry

theorem ellipticConductorExp_eq_zero_iff (E : WeierstrassCurve K) [E.IsElliptic] :
    ellipticConductorExp K E = 0 ↔
      WeierstrassCurve.HasGoodReduction 𝒪[K] (E.minimal 𝒪[K]) := by sorry

theorem ellipticConductorExp_eq_one_iff (E : WeierstrassCurve K) [E.IsElliptic] :
    ellipticConductorExp K E = 1 ↔
      WeierstrassCurve.HasMultiplicativeReduction 𝒪[K] (E.minimal 𝒪[K]) := by sorry

theorem ellipticConductorExp_baseChange_unramified (L : Type*) [Field L] [ValuativeRel L]
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Algebra K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)]
    (hunr : (GaloisRep.inertiaGroup L).map (GaloisRep.localEmbeddingMap K L).toMonoidHom =
      GaloisRep.inertiaGroup K)
    (E : WeierstrassCurve K) [E.IsElliptic] [(E.baseChange L).IsElliptic] :
    ellipticConductorExp L (E.baseChange L) = ellipticConductorExp K E := by sorry

/-- The local exponent `f(E_{F_v})` at a finite place (at the completion, whose local-field
instances are supplied by NumberFieldArithmetic). -/
def ellipticLocalConductorExp (F : Type*) [Field F] [NumberField F] (E : WeierstrassCurve F)
    [E.IsElliptic] (v : HeightOneSpectrum (𝓞 F)) : ℕ := sorry

/-- The conductor `N_E = ∏_v 𝔭_v^{f(E_{F_v})}` of an elliptic curve over a number field. -/
def ellipticConductor (F : Type*) [Field F] [NumberField F] (E : WeierstrassCurve F)
    [E.IsElliptic] : Ideal (𝓞 F) :=
  ∏ᶠ v : HeightOneSpectrum (𝓞 F), v.asIdeal ^ ellipticLocalConductorExp F E v

theorem ellipticConductorExp_dual (E : WeierstrassCurve K) [E.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[K]) ≠ 0) (ρ' : ContinuousRep (Field.absoluteGaloisGroup K) ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]))
    (e : Module.Dual ℚ_[ℓ] (Fin 2 → ℚ_[ℓ]) ≃ₗ[ℚ_[ℓ]] (Fin 2 → ℚ_[ℓ]))
    (he : ∀ g, (e : _ →ₗ[ℚ_[ℓ]] _) ∘ₗ (ellipticTateModuleRep K E ℓ).toRepresentation.dual g =
      ρ' g ∘ₗ e) :
    artinConductor ρ' = ellipticConductorExp K E := by sorry

/-- Unit test: TauCeti.Conductor.conductor_11a1. -/
example (E : WeierstrassCurve ℚ) (hE : E = ⟨0, -1, 1, -10, -20⟩) [E.IsElliptic] :
    ellipticConductor ℚ E = Ideal.span {(11 : 𝓞 ℚ)} := by sorry

/-- Unit test: TauCeti.Conductor.conductor_goodReduction. -/
example (E : WeierstrassCurve K) [E.IsElliptic]
    (h : WeierstrassCurve.HasGoodReduction 𝒪[K] (E.minimal 𝒪[K])) :
    ellipticConductorExp K E = 0 := by sorry

/-- Unit test: TauCeti.Conductor.conductor_y2_x3_minus_x. -/
example (E : WeierstrassCurve ℚ_[2]) (hE : E = ⟨0, 0, 0, -1, 0⟩) [E.IsElliptic] :
    ellipticConductorExp ℚ_[2] E = 5 := by sorry

/-- Unit test: TauCeti.Conductor.conductor_nonminimal_fails. -/
example (E : WeierstrassCurve K) [E.IsElliptic]
    (h : WeierstrassCurve.HasGoodReduction 𝒪[K] E) (π : 𝒪[K]) (hπ : Irreducible π)
    (C : WeierstrassCurve.VariableChange K) (hC : (C.u : K) = (π : K)⁻¹)
    [(C • E).IsElliptic] :
    ¬ WeierstrassCurve.IsMinimal 𝒪[K] (C • E) ∧ ellipticConductorExp K (C • E) = 0 := by sorry

/-- Unit test: TauCeti.Conductor.conductor_independent_ell. -/
example (E : WeierstrassCurve K) [E.IsElliptic] (ℓ ℓ' : ℕ) [Fact ℓ.Prime] [Fact ℓ'.Prime]
    (hℓ : (ℓ : 𝓀[K]) ≠ 0) (hℓ' : (ℓ' : 𝓀[K]) ≠ 0) :
    artinConductor (ellipticTateModuleRep K E ℓ) = artinConductor (ellipticTateModuleRep K E ℓ') :=
  by sorry

end Elliptic

/-! ### Ogg's formula: the algorithmic exponent is the ramification-theoretic conductor (ArithmeticGaloisRepresentations:R01.3/ogg-formula) -/

/- ArithmeticGaloisRepresentations:R01.3/ogg-formula: `v_K(Δ_min) = f(E) + m − 1`, where `m` is the
number of irreducible components, counted without multiplicity, of the geometric special fibre of
the minimal proper regular model of `E`; equivalently the component count of the ReductionSymbol of
Tate's algorithm over the strict henselisation: 1, n, 1, 2, 3, 5, n + 5, 7, 8, 9 for I₀, Iₙ, II, III,
IV, I₀*, Iₙ*, IV*, III*, II*. (It is not the number of components of the smooth Néron model: 4 for
I₀*, where the formula needs 5.) Comment-block fallback: the minimal regular model and the
ReductionSymbol have no Mathlib vocabulary (Tau Ceti EllipticCurves layer 4, StableReduction layer 5,
NeronModelsAndSemistableAbelianVarieties R11.2). The earlier Lean form took `m` as a free natural
number with no hypothesis, which made the statement false; the consequence that can be typed is
`ellipticConductorExp_le_valuation_minimalDiscriminant` below. -/

/-- A consequence of ArithmeticGaloisRepresentations:R01.3/ogg-formula (`m ≥ 1`):
`f(E) ≤ v_K(Δ_min)`, with equality exactly when the geometric special fibre of the minimal regular
model is irreducible. The valuation is measured as `Δ_min = u π^{n}` with `π` a uniformiser and `u`
a unit. Much weaker than the node, which is the comment block above. -/
theorem ellipticConductorExp_le_valuation_minimalDiscriminant {K : Type*} [Field K]
    [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] (E : WeierstrassCurve K)
    [E.IsElliptic] (π : 𝒪[K]) (hπ : Irreducible π) (n : ℕ) (u : (𝒪[K])ˣ)
    (hΔ : (E.minimal 𝒪[K]).Δ = ((u : 𝒪[K]) : K) * (π : K) ^ n) :
    ellipticConductorExp K E ≤ n := by sorry

/-! ### Saito's conductor–discriminant theorem for arithmetic surfaces (ArithmeticGaloisRepresentations:R01.3/saito-conductor-discriminant) -/

/- ArithmeticGaloisRepresentations:R01.3/saito-conductor-discriminant: for the minimal regular
model X → S = Spec R of a smooth projective geometrically connected curve C of genus g ≥ 1 over the
fraction field of a discrete valuation ring R with perfect residue field,
−Art(X/S) = ord(Δ_{X/S}), where Art(X/S) = χ(X_K̄) − χ(X_k̄) − δ, χ is the étale Euler characteristic
and δ the Swan conductor of H¹_ét(C_K̄, Q_ℓ), ℓ ≠ p (the statement as Liu 1994 quotes Saito 1988,
Theorem 1; Saito's own generality was not read). Comment-block fallback: regular arithmetic
surfaces, their ℓ-adic Euler characteristics, hence the definition of Art(X/S), and Deligne's
discriminant have no Mathlib vocabulary and belong to the recorded gap; the genus-one specialisation
is the comment block of R01.3/ogg-formula above. -/

/-! ### Values and bounds of elliptic conductor exponents; isogeny invariance (ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-exponent-bounds) -/

/-- ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-exponent-bounds, parts (a) and (c)
for `K = ℚ_p`: `f(E) = 2 + δ(E)` for additive reduction with `δ(E) = 0` for `p ≥ 5`, and
`f ≤ 8, 5, 2` for `p = 2, 3, ≥ 5`. The general form of (c) is `ellipticConductorExp_le` below. The
bound `8` at `p = 2` rests on the recorded gap (Brumer–Kramer, Theorem 5.5); parts (b), (d), (e) are
not typed. -/
theorem ellipticConductorExp_bounds (p : ℕ) [Fact p.Prime] (E : WeierstrassCurve ℚ_[p])
    [E.IsElliptic] :
    (WeierstrassCurve.HasAdditiveReduction 𝒪[ℚ_[p]] (E.minimal 𝒪[ℚ_[p]]) →
      ellipticConductorExp ℚ_[p] E = 2 + ellipticSwanConductor ℚ_[p] E) ∧
    (5 ≤ p → ellipticSwanConductor ℚ_[p] E = 0) ∧
    ellipticConductorExp ℚ_[p] E ≤ if p = 2 then 8 else if p = 3 then 5 else 2 := by sorry

/-- ArithmeticGaloisRepresentations:R01.3/elliptic-conductor-exponent-bounds, part (c) for a
nonarchimedean local field `K` of characteristic `0`: `f(E) ≤ 2 + 3 v_K(3) + 6 v_K(2)`, the
valuations being measured as `2 = u₂ π^a` and `3 = u₃ π^b` with `π` a uniformiser. In equal
characteristic `2` or `3` there is no bound. The case of residue characteristic `2` rests on the
recorded gap (Brumer–Kramer, Theorem 5.5). -/
theorem ellipticConductorExp_le {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [CharZero K] (E : WeierstrassCurve K) [E.IsElliptic]
    (π : 𝒪[K]) (hπ : Irreducible π) (a b : ℕ) (u₂ u₃ : (𝒪[K])ˣ)
    (h2 : (2 : K) = ((u₂ : 𝒪[K]) : K) * (π : K) ^ a)
    (h3 : (3 : K) = ((u₃ : 𝒪[K]) : K) * (π : K) ^ b) :
    ellipticConductorExp K E ≤ 2 + 3 * b + 6 * a := by sorry

/-! ### Serre's bound for the wild invariant of a representation of a p-adic Galois group (ArithmeticGaloisRepresentations:R01.3/serre-bound-for-the-wild-invariant) -/

/-- ArithmeticGaloisRepresentations:R01.3/serre-bound-for-the-wild-invariant (Serre 1987,
Proposition 9 and (4.9.4), non-strict form): for `K` of characteristic `0` with residue
characteristic `p` and `p = u π^{e_K}`, a representation `ρ` of `G_K` with finite image on a space
of dimension `N` over a field of characteristic `≠ p`, and `p^c` the order of the image of wild
inertia: `Sw(V) ≤ N e_K (c + 1/(p − 1))` and `a(V) ≤ N (1 + e_K c + e_K/(p − 1))`. Serre's strict
inequality for a non-cyclic wild inertia image is not part of the node. -/
theorem swanConductor_le_serre {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] [CharZero K] (p : ℕ) [Fact p.Prime] (hp : (p : 𝓀[K]) = 0)
    (π : 𝒪[K]) (hπ : Irreducible π) (eK : ℕ) (u : (𝒪[K])ˣ)
    (hpK : (p : K) = ((u : 𝒪[K]) : K) * (π : K) ^ eK)
    {F : Type*} [Field F] [TopologicalSpace F] (hF : ringChar F ≠ p)
    {V : Type*} [AddCommGroup V] [Module F V] [Module.Finite F V] [TopologicalSpace V]
    [IsModuleTopology F V] (ρ : ContinuousRep (Field.absoluteGaloisGroup K) F V)
    (hfin : (Set.range fun σ : Field.absoluteGaloisGroup K => ρ σ).Finite) (c : ℕ)
    (hc : Nat.card (Set.range fun σ : GaloisRep.localWildInertiaGroup K => ρ σ) = p ^ c) :
    swanConductor ρ ≤ (Module.finrank F V : ℚ) * eK * (c + 1 / ((p : ℚ) - 1)) ∧
      artinConductor ρ ≤ (Module.finrank F V : ℚ) * (1 + eK * c + eK / ((p : ℚ) - 1)) := by sorry

/-! ### Residual elliptic conductors away from ℓ (ArithmeticGaloisRepresentations:R01.3/residual-elliptic-conductor-away-from-ell) -/

/-- ArithmeticGaloisRepresentations:R01.3/residual-elliptic-conductor-away-from-ell (local part,
`ℓ ≥ 5`): for the residual representation `E[ℓ]` (`ellipticTorsionRep`, the reduction of the
lattice `T_ℓ E`, R01.6), `Sw(E[ℓ]) = δ(E)`, `a(E[ℓ]) ≤ f(E)`, `a(E[ℓ]) = 0` for good reduction, and
`a(E[ℓ]) = f(E)` unless `E` has multiplicative reduction with `ℓ | v_K(Δ_min)`, in which case
`a(E[ℓ]) = 0`. For `ℓ ∈ {2, 3}` the reduction `E[ℓ]` can acquire inertia invariants at places of
additive potentially good reduction, so `a(E[ℓ]) < f(E)` is possible; hence `ℓ ≥ 5` here. The global
form (`N(ρ̄_{E,ℓ}) = N_E^{(ℓ)}/∏ q`) follows place by place and is not typed. -/
theorem residual_ellipticConductor {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (E : WeierstrassCurve K) [E.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[K]) ≠ 0) (hℓ5 : 5 ≤ ℓ) (π : 𝒪[K]) (hπ : Irreducible π) (n : ℕ) (u : (𝒪[K])ˣ)
    (hΔ : (E.minimal 𝒪[K]).Δ = ((u : 𝒪[K]) : K) * (π : K) ^ n) :
    swanConductor (ellipticTorsionRep K E ℓ) = ellipticSwanConductor K E ∧
      artinConductor (ellipticTorsionRep K E ℓ) ≤ ellipticConductorExp K E ∧
      (WeierstrassCurve.HasGoodReduction 𝒪[K] (E.minimal 𝒪[K]) →
        artinConductor (ellipticTorsionRep K E ℓ) = 0) ∧
      (¬ (WeierstrassCurve.HasMultiplicativeReduction 𝒪[K] (E.minimal 𝒪[K]) ∧ ℓ ∣ n) →
        artinConductor (ellipticTorsionRep K E ℓ) = ellipticConductorExp K E) ∧
      (WeierstrassCurve.HasMultiplicativeReduction 𝒪[K] (E.minimal 𝒪[K]) → ℓ ∣ n →
        artinConductor (ellipticTorsionRep K E ℓ) = 0) := by sorry

end Conductor

end TauCeti

/-! # The declarations of layers R01.4 and R01.5 -/

namespace TauCeti

open NumberField Polynomial

namespace GaloisRep

/-! ### Complex conjugations and odd rank-two representations (ArithmeticGaloisRepresentations:R01.4/odd-representation) -/

-- The constructor `TauCeti.GaloisRep.complexConjugation` (a complex conjugation `c_v` at a real
-- place `v`, well defined up to conjugacy) is declared in the shared preamble and is not
-- redeclared here.

section Oddness

variable {F : Type*} [Field F] [NumberField F]

/-- A complex conjugation has order two: `c_v² = 1` and `c_v ≠ 1`. -/
theorem complexConjugation_sq (v : InfinitePlace F) (hv : v.IsReal) :
    complexConjugation F v hv ^ 2 = 1 ∧ complexConjugation F v hv ≠ 1 ∧
      orderOf (complexConjugation F v hv) = 2 := by
  sorry

/-- Every complex conjugation `c_ι = ι⁻¹ ∘ conj ∘ ι`, for an embedding `ι : F̄ → ℂ` above the real
place `v`, is conjugate in `G_F` to the chosen `complexConjugation F v hv`; hence any two complex
conjugations above `v` are conjugate. -/
theorem isConj_complexConjugation (v : InfinitePlace F) (hv : v.IsReal)
    (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (σ : AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)
    (hσ : ∀ x : AlgebraicClosure F, ι (σ x) = starRingEnd ℂ (ι x)) :
    IsConj (show Field.absoluteGaloisGroup F from σ) (complexConjugation F v hv) := by
  sorry

variable {A : Type*} [CommRing A]

/-- A character `μ : G_F → Aˣ` is totally odd if `μ(c_v) = -1` for every real place `v`
(independent of the choice of `c_v` in its conjugacy class). Continuity of `μ` plays no role in
the condition, so it is stated for monoid homomorphisms such as `ContinuousRep.det`. -/
def IsTotallyOddChar (μ : Field.absoluteGaloisGroup F →* Aˣ) : Prop :=
  ∀ (v : InfinitePlace F) (hv : v.IsReal), μ (complexConjugation F v hv) = -1

variable [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- A (rank-two) representation `ρ` of `G_F` is odd at the real place `v` if
`det ρ(c_v) = -1` in `A`. Oddness depends only on the character `det ρ`; over a reduced ring with
`2 = 0` (a field of characteristic two) it is automatic, over a non-reduced one (`F_2[ε]/(ε²)`,
`det ρ(c_v) = 1 + ε`) it is a genuine condition; `ρ(c_v) ≠ 1` is the separate condition
`IsNontrivialAt`. -/
def IsOddAt (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (v : InfinitePlace F)
    (hv : v.IsReal) : Prop :=
  ρ.det (complexConjugation F v hv) = -1

/-- `ρ` is odd (totally odd) if it is odd at every real place; vacuous when `F` has no real
place. -/
def IsOdd (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) : Prop :=
  ∀ (v : InfinitePlace F) (hv : v.IsReal), IsOddAt ρ v hv

/-- `ρ` is odd iff its determinant is a totally odd character. -/
theorem isOdd_iff_isTotallyOddChar (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    IsOdd ρ ↔ IsTotallyOddChar ρ.det :=
  Iff.rfl

/-- Twisting by a continuous character `ψ` preserves oddness: `σ = ρ ⊗ ψ` (on the same carrier,
`σ(g) = ψ(g) • ρ(g)`) is odd iff `ρ` is, since `det σ(c) = ψ(c)² det ρ(c)` and `ψ(c)² = 1`. -/
theorem isOdd_tensor_character (hM : Module.finrank A M = 2)
    (ρ σ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (ψ : Field.absoluteGaloisGroup F →ₜ* Aˣ) (hσ : ∀ g, σ g = ((ψ g : Aˣ) : A) • ρ g) :
    IsOdd σ ↔ IsOdd ρ := by
  sorry

/-- Coefficient extension: if `ρ` is odd then `ρ ⊗_A B` is odd (here `ρB` is any representation
on `B ⊗[A] M` acting by `(ρ g).baseChange B`). The converse holds when `A → B` is injective, and
also when `det ρ(c_v) ∈ {1, -1}` for every real place `v` (automatic if `A` is a domain, or a local
ring in which `2` is a unit) and `2 ≠ 0` in `B`. It fails in general: for `A = k × k → B = k` (the
second projection) and `det ρ(c) = (1, -1)`, `ρ ⊗_A B` is odd and `ρ` is not. -/
theorem isOdd_baseChange {B : Type*} [CommRing B] [TopologicalSpace B] [Algebra A B]
    [TopologicalSpace (B ⊗[A] M)] [IsModuleTopology B (B ⊗[A] M)]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (ρB : ContinuousRep (Field.absoluteGaloisGroup F) B (B ⊗[A] M))
    (hρB : ∀ g, ρB g = (ρ g).baseChange B) :
    (IsOdd ρ → IsOdd ρB) ∧
      (Function.Injective (algebraMap A B) → IsOdd ρB → IsOdd ρ) ∧
      ((2 : B) ≠ 0 →
        (∀ (v : InfinitePlace F) (hv : v.IsReal),
          ρ.det (complexConjugation F v hv) = 1 ∨ ρ.det (complexConjugation F v hv) = -1) →
        IsOdd ρB → IsOdd ρ) := by
  sorry

/-- Restriction to `G_{F'}` for a finite extension `F'/F` preserves oddness: every complex
conjugation of `F'` at a real place `w` is a complex conjugation of `F` at `w|_F`. -/
theorem isOdd_restrict {F' : Type*} [Field F'] [NumberField F'] [Algebra F F']
    [Algebra (AlgebraicClosure F) (AlgebraicClosure F')]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure F')]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (hρ : IsOdd ρ) :
    IsOdd (ρ.res (localEmbeddingMap F F')) := by
  sorry

/-- `ρ` is non-trivial at the real place `v` if `ρ(c_v) ≠ 1`; in characteristic two this is the
condition used instead of oddness, and it is never part of oddness. -/
def IsNontrivialAt (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (v : InfinitePlace F)
    (hv : v.IsReal) : Prop :=
  ρ (complexConjugation F v hv) ≠ LinearMap.id

end Oddness

section OddnessField

variable {F : Type*} [Field F] [NumberField F]
  {K : Type*} [Field K] [TopologicalSpace K]
  {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
  [TopologicalSpace V] [IsModuleTopology K V]

/-- Over a field of characteristic `≠ 2`, a rank-two `ρ` is odd at `v` iff `ρ(c_v)` is conjugate
to `diag(1, -1)`. -/
theorem isOdd_iff_conj_diag (hK : (2 : K) ≠ 0) (hV : Module.finrank K V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) (v : InfinitePlace F)
    (hv : v.IsReal) :
    IsOddAt ρ v hv ↔ ∃ b : Module.Basis (Fin 2) K V,
      LinearMap.toMatrix b b (ρ (complexConjugation F v hv)) = Matrix.diagonal ![1, -1] := by
  sorry

end OddnessField

/-- Unit test: TauCeti.GaloisRep.isOdd_cyclotomic_sum_one. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    {M : Type*} [AddCommGroup M] [Module (ZMod p) M] [Module.Finite (ZMod p) M]
    [Module.Projective (ZMod p) M] [TopologicalSpace M] [IsModuleTopology (ZMod p) M]
    (b : Module.Basis (Fin 2) (ZMod p) M)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod p) M)
    (hρ : ∀ g, LinearMap.toMatrix b b (ρ g) =
      Matrix.diagonal ![PadicInt.toZMod ((cyclotomicCharacter ℚ p g : ℤ_[p]ˣ) : ℤ_[p]), 1]) :
    IsOdd ρ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.not_isOdd_of_scalar_minus_one. -/
example {M : Type*} [AddCommGroup M] [Module (ZMod 5) M] [Module.Finite (ZMod 5) M]
    [Module.Projective (ZMod 5) M] [TopologicalSpace M] [IsModuleTopology (ZMod 5) M]
    (hM : Module.finrank (ZMod 5) M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 5) M) (v : InfinitePlace ℚ)
    (hv : v.IsReal) (hc : ρ (complexConjugation ℚ v hv) = -LinearMap.id) :
    ¬ IsOddAt ρ v hv ∧ IsNontrivialAt ρ v hv := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isOdd_of_charTwo. `A` is reduced with `2 = 0`; over a
non-reduced ring `det ρ(c_v)` need not be `1` (it is `1 + ε` for a suitable character over
`F_2[ε]/(ε²)`). -/
example :
    (∀ {F : Type} [Field F] [NumberField F] {A : Type} [CommRing A] [IsReduced A]
      [TopologicalSpace A] {M : Type} [AddCommGroup M] [Module A M] [Module.Finite A M]
      [Module.Projective A M] [TopologicalSpace M] [IsModuleTopology A M],
      (2 : A) = 0 → Module.finrank A M = 2 →
        ∀ ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M, IsOdd ρ) ∧
    (∀ {M : Type} [AddCommGroup M] [Module (ZMod 2) M] [Module.Finite (ZMod 2) M]
      [Module.Projective (ZMod 2) M] [TopologicalSpace M] [IsModuleTopology (ZMod 2) M],
      Module.finrank (ZMod 2) M = 2 →
        IsOdd (ContinuousRep.trivial : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 2) M) ∧
        ∀ (v : InfinitePlace ℚ) (hv : v.IsReal),
          ¬ IsNontrivialAt
            (ContinuousRep.trivial : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 2) M)
            v hv) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isOdd_iff_trace_eq_zero. -/
example {F : Type*} [Field F] [NumberField F] {K : Type*} [Field K] [TopologicalSpace K]
    {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
    [TopologicalSpace V] [IsModuleTopology K V] (hK : (2 : K) ≠ 0) (hV : Module.finrank K V = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) (v : InfinitePlace F)
    (hv : v.IsReal) :
    IsOddAt ρ v hv ↔ LinearMap.trace K V (ρ (complexConjugation F v hv)) = 0 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isOdd_reduction_iff. Stated for the lattice representation
`ρ` over a local domain `O` (whose oddness is that of the representation over `Frac O`) and its
reduction `ρbar` on `k ⊗[O] Λ`, `k` the residue field. -/
example {F : Type*} [Field F] [NumberField F]
    {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O] [TopologicalSpace O]
    [TopologicalSpace (IsLocalRing.ResidueField O)]
    {Λ : Type*} [AddCommGroup Λ] [Module O Λ] [Module.Finite O Λ] [Module.Free O Λ]
    [TopologicalSpace Λ] [IsModuleTopology O Λ]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ)]
    (hΛ : Module.finrank O Λ = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) O Λ)
    (ρbar : ContinuousRep (Field.absoluteGaloisGroup F) (IsLocalRing.ResidueField O)
      (IsLocalRing.ResidueField O ⊗[O] Λ))
    (hρbar : ∀ g, ρbar g = (ρ g).baseChange (IsLocalRing.ResidueField O)) :
    ((2 : IsLocalRing.ResidueField O) ≠ 0 → (IsOdd ρ ↔ IsOdd ρbar)) ∧
      ((2 : IsLocalRing.ResidueField O) = 0 → IsOdd ρbar) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.not_isOdd_of_isOddAt_one_place. Oddness is required at every
real place. The packet's instance is `F = ℚ(√2)` and `χ ⊕ 1` over `F_3`, with `χ` the quadratic
character of `ℚ(2^{1/4})/F`: `χ(c) = 1` at the place `√2 > 0` and `-1` at the place `√2 < 0`. The
field and the character are not constructed here; the example states what the instance shows
about the definition, for any representation with these two determinants. -/
example {F : Type*} [Field F] [NumberField F]
    {M : Type*} [AddCommGroup M] [Module (ZMod 3) M] [Module.Finite (ZMod 3) M]
    [Module.Projective (ZMod 3) M] [TopologicalSpace M] [IsModuleTopology (ZMod 3) M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) (ZMod 3) M)
    (v₁ v₂ : InfinitePlace F) (h₁ : v₁.IsReal) (h₂ : v₂.IsReal)
    (hd₁ : ρ.det (complexConjugation F v₁ h₁) = 1)
    (hd₂ : ρ.det (complexConjugation F v₂ h₂) = -1) :
    IsOddAt ρ v₂ h₂ ∧ ¬ IsOddAt ρ v₁ h₁ ∧ ¬ IsOdd ρ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isOdd_of_no_real_place. Without real places (for instance
`F = ℚ(i)`) every representation is odd and every character is totally odd. -/
example {F : Type*} [Field F] [NumberField F] (hF : ∀ v : InfinitePlace F, ¬ v.IsReal)
    {A : Type*} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (μ : Field.absoluteGaloisGroup F →* Aˣ) :
    IsOdd ρ ∧ IsTotallyOddChar μ :=
  ⟨fun v hv => absurd hv (hF v), fun v hv => absurd hv (hF v)⟩

/-! ### Odd irreducible residual representations are absolutely irreducible (odd p), and the characteristic-two case (ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible) -/

/-- ArithmeticGaloisRepresentations:R01.4/odd-irreducible-implies-absolutely-irreducible.
(b) Over a field of characteristic `≠ 2`, a rank-two `ρ̄` odd at some real place and irreducible
over `k` is absolutely irreducible. (c) In characteristic two the same holds when `ρ̄(c_v) ≠ 1`.
(The rationality lemma (a) and the cubic counterexample in (c) are not restated.) -/
theorem isAbsolutelyIrreducible_of_isOddAt_of_isIrreducible
    {F : Type*} [Field F] [NumberField F] {k : Type*} [Field k] [TopologicalSpace k]
    {M : Type*} [AddCommGroup M] [Module k M] [Module.Finite k M] [Module.Projective k M]
    [TopologicalSpace M] [IsModuleTopology k M] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) (v : InfinitePlace F) (hv : v.IsReal)
    (hirr : ρ.toRepresentation.IsIrreducible) :
    ((2 : k) ≠ 0 → IsOddAt ρ v hv → ρ.IsAbsolutelyIrreducible) ∧
      ((2 : k) = 0 → IsNontrivialAt ρ v hv → ρ.IsAbsolutelyIrreducible) := by
  sorry

end GaloisRep

/-! ### Dickson's classification of finite subgroups of PGL_2(F̄_p), with the coefficient field visible, its consequences and the p = 2 refinement (ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement) -/

namespace GL2Subgroup

open Matrix

/-- ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement, part
(b) (parts (a), (c), (d), (e) are not restated; (e) also needs absolute irreducibility, not
irreducibility over `k`): for a finite field `k` of characteristic `p` and `G ≤ GL_2(k)` acting absolutely irreducibly
on `k̄²` (Burnside form: `G` spans `M_2(k̄)`), the projective image `π(G) ⊂ PGL_2(k̄)` is dihedral
of order `2n` (`n ≥ 2`, `p ∤ n`), or isomorphic to `A_4`, `S_4`, `A_5`, or conjugate to the image
of `SL_2(F_0)` or `GL_2(F_0)`, where `F_0 ⊂ k` is generated by the values `Tr(g)²/det(g)`. -/
theorem dickson_projectiveImage {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k]
    [CharP k p] (G : Subgroup (GL (Fin 2) k))
    (hG : Submodule.span (AlgebraicClosure k)
      (Set.range fun g : G => ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k).map
        (algebraMap k (AlgebraicClosure k))) = ⊤) :
    let πG : Subgroup (ProjGenLinGroup (Fin 2) (AlgebraicClosure k)) :=
      (G.map (GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)))).map ProjGenLinGroup.mk
    let F₀ : Subfield k := Subfield.closure
      (Set.range fun g : G => (Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) ^ 2 /
        Matrix.det ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k))
    let ι : F₀ →+* AlgebraicClosure k := (algebraMap k (AlgebraicClosure k)).comp F₀.subtype
    (∃ n : ℕ, 2 ≤ n ∧ ¬ p ∣ n ∧ Nonempty (πG ≃* DihedralGroup n)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 4)) ∨ Nonempty (πG ≃* Equiv.Perm (Fin 4)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 5)) ∨
      ∃ x : ProjGenLinGroup (Fin 2) (AlgebraicClosure k),
        πG = ((SpecialLinearGroup.map ι).range.map
            (ProjGenLinGroup.mk.comp SpecialLinearGroup.toGL)).map
            (MulAut.conj x).toMonoidHom ∨
        πG = ((GeneralLinearGroup.map ι).range.map ProjGenLinGroup.mk).map
            (MulAut.conj x).toMonoidHom := by
  sorry

end GL2Subgroup

/-! ### Cartan subgroups of GL_2 over a finite field and their normalisers (ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers) -/

namespace GL2Cartan

section Cartan

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

/-- The split Cartan subgroup `C_s(D₁, D₂) = {s ∈ GL(V) : sD₁ = D₁, sD₂ = D₂}` attached to two
(distinct) lines; it is `(kˣ)²`, the diagonal torus in a basis adapted to `D₁ ⊕ D₂`. -/
def split (D₁ D₂ : Submodule k V) : Subgroup (LinearMap.GeneralLinearGroup k V) where
  carrier := {s | D₁.map (s : V →ₗ[k] V) = D₁ ∧ D₂.map (s : V →ₗ[k] V) = D₂}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The non-split Cartan subgroup `C_ns(k') = k'ˣ ⊂ GL(V)` attached to a subalgebra
`k' ⊂ End_k(V)` which is a field with `q²` elements. -/
def nonsplit (k' : Subalgebra k (Module.End k V)) : Subgroup (LinearMap.GeneralLinearGroup k V) :=
  (Units.map k'.val.toRingHom.toMonoidHom).range

/-- The split half-Cartan `C'(D₁, D₂) = {s ∈ C_s(D₁, D₂) : s acts trivially on D₂}`: cyclic of
order `q - 1`, with `det C' = kˣ`, `C' · kˣ = C_s(D₁, D₂)` and the same image in `PGL(V)`; for
`q ≥ 3`, `C_s(D₁, D₂)` is the only split Cartan subgroup containing it. (These facts are part of
the packet's API item and are not restated as separate declarations.) -/
def halfSplit (D₁ D₂ : Submodule k V) : Subgroup (LinearMap.GeneralLinearGroup k V) where
  carrier := {s | D₁.map (s : V →ₗ[k] V) = D₁ ∧ ∀ x ∈ D₂, (s : V →ₗ[k] V) x = x}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- `C` is a Cartan subgroup of `GL(V)`: split (for two distinct lines) or non-split (for a
quadratic subfield of `End_k(V)`, i.e. a subalgebra that is a field of dimension `2` over `k`; for
`k` finite this is the condition `|k'| = q²`). -/
def IsCartan (C : Subgroup (LinearMap.GeneralLinearGroup k V)) : Prop :=
  (∃ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 ∧ Module.finrank k D₂ = 1 ∧ D₁ ≠ D₂ ∧
      C = split D₁ D₂) ∨
    ∃ k' : Subalgebra k (Module.End k V), IsField k' ∧ Module.finrank k k' = 2 ∧
      C = nonsplit k'

/-- `[N(C) : C] = 2` for `C` non-split, or split with `q ≥ 3`. -/
theorem normalizer_index [Finite k] (hV : Module.finrank k V = 2) :
    (∀ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 → Module.finrank k D₂ = 1 → D₁ ≠ D₂ →
        3 ≤ Nat.card k →
        (split D₁ D₂).relIndex (Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V))) = 2) ∧
      ∀ k' : Subalgebra k (Module.End k V), IsField k' → Nat.card k' = Nat.card k ^ 2 →
        (nonsplit k').relIndex (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))) = 2 := by
  sorry

/-- `s ∈ N(C_s(D₁, D₂))` iff `s` permutes `{D₁, D₂}`, for `q ≥ 3` (for `q = 2` the split Cartan
is trivial and every `s` normalises it). -/
theorem mem_normalizer_split_iff [Finite k] (h3 : 3 ≤ Nat.card k)
    (hV : Module.finrank k V = 2) (D₁ D₂ : Submodule k V)
    (h₁ : Module.finrank k D₁ = 1) (h₂ : Module.finrank k D₂ = 1) (hne : D₁ ≠ D₂)
    (s : LinearMap.GeneralLinearGroup k V) :
    s ∈ Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V)) ↔
      ({D₁.map (s : V →ₗ[k] V), D₂.map (s : V →ₗ[k] V)} : Set (Submodule k V)) = {D₁, D₂} := by
  sorry

/-- The images in `PGL(V) = GL(V)/Z`: `π(C)` is cyclic of order `q ∓ 1` and `π(N(C))` is
dihedral of order `2(q ∓ 1)` (`-` split with `q ≥ 3`, `+` non-split); `π(N(C))` is the normaliser
of `π(C)` and every element of `π(N(C)) ∖ π(C)` has order `2`. -/
theorem image_PGL [Finite k] (hV : Module.finrank k V = 2) :
    let π := QuotientGroup.mk' (Subgroup.center (LinearMap.GeneralLinearGroup k V))
    (∀ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 → Module.finrank k D₂ = 1 → D₁ ≠ D₂ →
        3 ≤ Nat.card k →
        IsCyclic ((split D₁ D₂).map π) ∧ Nat.card ((split D₁ D₂).map π) = Nat.card k - 1 ∧
          Nonempty ((Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V))).map π ≃*
            DihedralGroup (Nat.card k - 1)) ∧
          (Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V))).map π =
            Subgroup.normalizer ((((split D₁ D₂).map π : Subgroup _)) : Set _) ∧
          ∀ x ∈ (Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V))).map π,
            x ∉ (split D₁ D₂).map π → orderOf x = 2) ∧
      ∀ k' : Subalgebra k (Module.End k V), IsField k' → Nat.card k' = Nat.card k ^ 2 →
        IsCyclic ((nonsplit k').map π) ∧ Nat.card ((nonsplit k').map π) = Nat.card k + 1 ∧
          Nonempty ((Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))).map π ≃*
            DihedralGroup (Nat.card k + 1)) ∧
          (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))).map π =
            Subgroup.normalizer ((((nonsplit k').map π : Subgroup _)) : Set _) ∧
          ∀ x ∈ (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))).map π,
            x ∉ (nonsplit k').map π → orderOf x = 2 := by
  sorry

/-- Conjugation: `g C(D₁, D₂) g⁻¹ = C(gD₁, gD₂)`, `g C_ns(k') g⁻¹ = C_ns(g k' g⁻¹)`, and taking
normalisers commutes with conjugation. -/
theorem conj (g : LinearMap.GeneralLinearGroup k V) (D₁ D₂ : Submodule k V)
    (k' k'' : Subalgebra k (Module.End k V))
    (hk'' : (k'' : Set (Module.End k V)) =
      (fun x => (g : Module.End k V) * x * ((g⁻¹ : LinearMap.GeneralLinearGroup k V) :
        Module.End k V)) '' k') :
    (split D₁ D₂).map (MulAut.conj g).toMonoidHom =
        split (D₁.map (g : V →ₗ[k] V)) (D₂.map (g : V →ₗ[k] V)) ∧
      (nonsplit k').map (MulAut.conj g).toMonoidHom = nonsplit k'' ∧
      ∀ C : Subgroup (LinearMap.GeneralLinearGroup k V),
        (Subgroup.normalizer (C : Set _)).map (MulAut.conj g).toMonoidHom =
          Subgroup.normalizer ((C.map (MulAut.conj g).toMonoidHom : Subgroup _) : Set _) := by
  sorry

/-- For `p ≠ 2` and `Tr(s)² - 4 det(s) ≠ 0`, `s` lies in a unique Cartan subgroup, which is split
iff the discriminant is a square in `k`. -/
theorem exists_unique_of_disc_ne_zero [Finite k] (hk : ringChar k ≠ 2)
    (hV : Module.finrank k V = 2) (s : LinearMap.GeneralLinearGroup k V)
    (hs : LinearMap.trace k V (s : V →ₗ[k] V) ^ 2 - 4 * LinearMap.det (s : V →ₗ[k] V) ≠ 0) :
    (∃! C : Subgroup (LinearMap.GeneralLinearGroup k V), IsCartan C ∧ s ∈ C) ∧
      (IsSquare (LinearMap.trace k V (s : V →ₗ[k] V) ^ 2 - 4 * LinearMap.det (s : V →ₗ[k] V)) ↔
        ∃ D₁ D₂ : Submodule k V, Module.finrank k D₁ = 1 ∧ Module.finrank k D₂ = 1 ∧
          D₁ ≠ D₂ ∧ s ∈ split D₁ D₂) := by
  sorry

end Cartan

/-- The diagonal model: `C_s(⟨e₁⟩, ⟨e₂⟩)` consists of the diagonal matrices (Tau Ceti's
`TauCeti.diagonalTorus k 2`, the range of `TauCeti.diagGL`), and its normaliser is generated by it
and the Weyl element `w = [[0,1],[1,0]]` (Tau Ceti's `TauCeti.GL2WeylElement`), for `q ≥ 3`. -/
theorem diagonal_model {k : Type*} [Field k] [Finite k] (h3 : 3 ≤ Nat.card k) :
    let e₁ : Submodule k (Fin 2 → k) := Submodule.span k {(Pi.single 0 1 : Fin 2 → k)}
    let e₂ : Submodule k (Fin 2 → k) := Submodule.span k {(Pi.single 1 1 : Fin 2 → k)}
    let w : LinearMap.GeneralLinearGroup k (Fin 2 → k) :=
      (LinearMap.GeneralLinearGroup.generalLinearEquiv k (Fin 2 → k)).symm
        (LinearEquiv.funCongrLeft k k (Equiv.swap (0 : Fin 2) 1))
    (∀ s : LinearMap.GeneralLinearGroup k (Fin 2 → k), s ∈ split e₁ e₂ ↔
        ∃ a b : kˣ, (s : Module.End k (Fin 2 → k)) = Matrix.toLin' (Matrix.diagonal ![(a : k), b])) ∧
      Subgroup.normalizer (split e₁ e₂ : Set _) =
        Subgroup.closure (insert w (split e₁ e₂ : Set (LinearMap.GeneralLinearGroup k (Fin 2 → k)))) := by
  sorry

section CartanTests

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

/-- Unit test: TauCeti.GL2Cartan.card_nonsplit. -/
example [Finite k] (hV : Module.finrank k V = 2) (k' : Subalgebra k (Module.End k V))
    (hk' : IsField k') (hcard : Nat.card k' = Nat.card k ^ 2) :
    Nat.card (nonsplit k') = Nat.card k ^ 2 - 1 ∧
      Nat.card (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))) = 2 * (Nat.card k ^ 2 - 1) ∧
      (Nat.card k = 3 → Nat.card (nonsplit k') = 8 ∧
        Nat.card (Subgroup.normalizer (nonsplit k' : Set (LinearMap.GeneralLinearGroup k V))) = 16) := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.split_trivial_q_two. -/
example (hk : Nat.card k = 2) (hV : Module.finrank k V = 2) (D₁ D₂ : Submodule k V)
    (h₁ : Module.finrank k D₁ = 1) (h₂ : Module.finrank k D₂ = 1) (hne : D₁ ≠ D₂) :
    split D₁ D₂ = ⊥ ∧ Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V)) = ⊤ ∧
      (split D₁ D₂).relIndex (Subgroup.normalizer (split D₁ D₂ : Set (LinearMap.GeneralLinearGroup k V))) ≠ 2 := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.trace_eq_zero_of_mem_normalizer_not_mem. For `C` non-split, or
split with `q ≥ 3`. (For `C` split and `q = 2` it fails: `N(C) ∖ C` then contains the elements
of order `3`, of trace `1`.) -/
example [Finite k] (hV : Module.finrank k V = 2)
    (C : Subgroup (LinearMap.GeneralLinearGroup k V)) (hC : IsCartan C)
    (h3 : 3 ≤ Nat.card k ∨ ∃ k' : Subalgebra k (Module.End k V), IsField k' ∧
      Module.finrank k k' = 2 ∧ C = nonsplit k')
    (s : LinearMap.GeneralLinearGroup k V) (hs : s ∈ Subgroup.normalizer (C : Set _))
    (hsC : s ∉ C) :
    LinearMap.trace k V (s : V →ₗ[k] V) = 0 ∧
      ∃ a : k, (s : Module.End k V) ^ 2 = algebraMap k (Module.End k V) a := by
  sorry

end CartanTests

/-- Unit test: TauCeti.GL2Cartan.nonsplit_eq_GL2NonSplitTorus. (Tau Ceti's
`TauCeti.GL2NonSplitTorus k L hL` and `TauCeti.nonSplitTorusBasis k L hL`, which take the proof
`hL : Module.finrank k L = 2`, are not importable here; the statement uses the left-multiplication
matrices of `Lˣ` in an arbitrary basis of the quadratic extension.) -/
example {k L : Type*} [Field k] [Finite k] [Field L] [Algebra k L]
    (hL : Module.finrank k L = 2) (b : Module.Basis (Fin 2) k L) :
    (nonsplit (Algebra.lmul k L).range).map
        (Units.map (LinearMap.toMatrixAlgEquiv b).toAlgHom.toRingHom.toMonoidHom) =
      (Units.map (Algebra.leftMulMatrix b).toRingHom.toMonoidHom).range := by
  sorry

section CartanTests2

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

/-- Unit test: TauCeti.GL2Cartan.split_ne_nonsplit. -/
example [Finite k] (hV : Module.finrank k V = 2) (D₁ D₂ : Submodule k V)
    (h₁ : Module.finrank k D₁ = 1) (h₂ : Module.finrank k D₂ = 1) (hne : D₁ ≠ D₂)
    (k' : Subalgebra k (Module.End k V)) (hk' : IsField k')
    (hcard : Nat.card k' = Nat.card k ^ 2) (g : LinearMap.GeneralLinearGroup k V) :
    (split D₁ D₂).map (MulAut.conj g).toMonoidHom ≠ nonsplit k' := by
  sorry

end CartanTests2

/-- Serre's Proposition 14, over `F_ℓ`: a Cartan subgroup `C'` (resp. a split half-Cartan `C'`)
contained in the normaliser of a Cartan subgroup `C` equals `C` (resp. lies in `C`), provided
`ℓ ≥ 5` when `C'` is split and `ℓ ≥ 3` otherwise. For `ℓ = 3` and `C'` split it fails: the split
Cartan subgroups attached to `{D₁, D₂}` and `{D₃, D₄}` have the same normaliser. -/
theorem eq_of_le_normalizer {ℓ : ℕ} [Fact ℓ.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod ℓ) V] (hV : Module.finrank (ZMod ℓ) V = 2)
    (C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) (hC : IsCartan C) :
    (∀ D₁ D₂ : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D₁ = 1 →
        Module.finrank (ZMod ℓ) D₂ = 1 → D₁ ≠ D₂ → 5 ≤ ℓ →
        (split D₁ D₂ ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
          split D₁ D₂ = C) ∧
        (halfSplit D₁ D₂ ≤
            Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
          halfSplit D₁ D₂ ≤ C)) ∧
      ∀ k' : Subalgebra (ZMod ℓ) (Module.End (ZMod ℓ) V), IsField k' →
        Module.finrank (ZMod ℓ) k' = 2 → 3 ≤ ℓ →
        nonsplit k' ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) →
        nonsplit k' = C := by
  sorry


end GL2Cartan

-- This node precedes the Cartan node in the packet; it is placed after it because its
-- statement uses `TauCeti.GL2Cartan.IsCartan`.

/-! ### Subgroups of GL_2(F_ℓ): Serre's Propositions 15–18 (ArithmeticGaloisRepresentations:R01.4/subgroups-of-gl2-over-a-prime-field) -/

namespace GL2Subgroup

/-- ArithmeticGaloisRepresentations:R01.4/subgroups-of-gl2-over-a-prime-field, parts (a), (b):
for `G ≤ GL(V)`, `V` a plane over `F_ℓ`: if `ℓ ∣ |G|` then `G ⊇ SL(V)` or `G` lies in a Borel
subgroup; if `ℓ ∤ |G|` then `G` lies in a Cartan subgroup, or in the normaliser of one, or its
projective image is `A_4`, `S_4` or `A_5`. (Parts (c)–(e) are not restated; in (d), Serre's
Proposition 17, the hypothesis `ℓ ≠ 5` applies to a split Cartan and to a split half-Cartan
`GL2Cartan.halfSplit`.) -/
theorem serre_prop15_prop16 {ℓ : ℕ} [Fact ℓ.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod ℓ) V] (hV : Module.finrank (ZMod ℓ) V = 2)
    (G : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) :
    let π := QuotientGroup.mk' (Subgroup.center (LinearMap.GeneralLinearGroup (ZMod ℓ) V))
    (ℓ ∣ Nat.card G →
        (∀ s : LinearMap.GeneralLinearGroup (ZMod ℓ) V,
          LinearMap.det (s : V →ₗ[ZMod ℓ] V) = 1 → s ∈ G) ∨
        ∃ D : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D = 1 ∧
          ∀ s ∈ G, D.map (s : V →ₗ[ZMod ℓ] V) = D) ∧
      (¬ ℓ ∣ Nat.card G →
        (∃ C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V), GL2Cartan.IsCartan C ∧ G ≤ C) ∨
        (∃ C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V), GL2Cartan.IsCartan C ∧
          G ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V))) ∨
        Nonempty (G.map π ≃* alternatingGroup (Fin 4)) ∨
        Nonempty (G.map π ≃* Equiv.Perm (Fin 4)) ∨
        Nonempty (G.map π ≃* alternatingGroup (Fin 5))) := by
  sorry

/-! ### p-subgroups of GL_2 in characteristic p fix a unique line (ArithmeticGaloisRepresentations:R01.4/p-subgroups-and-borel-subgroups) -/

/-- ArithmeticGaloisRepresentations:R01.4/p-subgroups-and-borel-subgroups: a nontrivial finite
`p`-subgroup `P ≤ GL(V)` (`V` a plane in characteristic `p`) consists of unipotent elements of
exponent `p`, fixes exactly one line pointwise, and its normaliser stabilises that line.
(Consequences (i)–(iv) are not restated.) -/
theorem pSubgroup_fixes_unique_line {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [CharP k p]
    {V : Type*} [AddCommGroup V] [Module k V] (hV : Module.finrank k V = 2)
    (P : Subgroup (LinearMap.GeneralLinearGroup k V)) [Finite P] (hP : IsPGroup p P)
    (hP1 : P ≠ ⊥) :
    (∀ s ∈ P, IsNilpotent ((s : Module.End k V) - 1) ∧ s ^ p = 1) ∧
      ∃! D : Submodule k V, Module.finrank k D = 1 ∧
        (∀ s ∈ P, ∀ x ∈ D, (s : V →ₗ[k] V) x = x) ∧
        ∀ s ∈ Subgroup.normalizer (P : Set (LinearMap.GeneralLinearGroup k V)), D.map (s : V →ₗ[k] V) = D := by
  sorry

/-! ### Dickson: subgroups of PSL_2(F_s) with more than one Sylow p-subgroup (ArithmeticGaloisRepresentations:R01.4/subgroups-of-psl2-with-several-sylow-p-subgroups) -/

/-- ArithmeticGaloisRepresentations:R01.4/subgroups-of-psl2-with-several-sylow-p-subgroups, part
(ii): a subgroup `H` of `PSL_2(F_s)` (given by its image in `PGL_2(F_s)`, `s = p^n`) of order
divisible by `p` and with no non-trivial normal `p`-subgroup (equivalently, with more than one
Sylow `p`-subgroup) is, after conjugation in `PGL_2(F_s)`, the image of `SL_2(F₀)` or of `GL_2(F₀)`
for a subfield `F₀`, or is dihedral of order `2m` with `m` odd (only for `p = 2`), or is isomorphic
to `A_5` (only for `p = 3`). The number `1 + f·p^m` of Sylow subgroups, the values of `f`, the
conditions on `F₀` and part (i) (`f = 0`: `H` fixes a point) are not restated. -/
theorem dickson_several_sylow {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k]
    [CharP k p] (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) k))
    (hH : H ≤ (Matrix.SpecialLinearGroup.toGL :
        Matrix.SpecialLinearGroup (Fin 2) k →* GL (Fin 2) k).range.map Matrix.ProjGenLinGroup.mk)
    (hp : p ∣ Nat.card H) (hsyl : ∀ N : Subgroup H, N.Normal → IsPGroup p N → N = ⊥) :
    (∃ (F₀ : Subfield k) (x : Matrix.ProjGenLinGroup (Fin 2) k),
        H = ((Matrix.SpecialLinearGroup.map F₀.subtype).range.map
            (Matrix.ProjGenLinGroup.mk.comp Matrix.SpecialLinearGroup.toGL)).map
            (MulAut.conj x).toMonoidHom ∨
        H = ((Matrix.GeneralLinearGroup.map F₀.subtype).range.map Matrix.ProjGenLinGroup.mk).map
            (MulAut.conj x).toMonoidHom) ∨
      (p = 2 ∧ ∃ m : ℕ, Odd m ∧ Nonempty (H ≃* DihedralGroup m)) ∨
      (p = 3 ∧ Nonempty (H ≃* alternatingGroup (Fin 5))) := by
  sorry

/-! ### Finite subgroups of PGL_2 of order prime to the characteristic: cyclic, dihedral, A_4, S_4, A_5 (ArithmeticGaloisRepresentations:R01.4/finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic) -/

/-- ArithmeticGaloisRepresentations:R01.4/finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic:
a finite subgroup of `PGL_2(K)`, `K` algebraically closed, of order not divisible by the
characteristic of `K` (no condition in characteristic `0`, where `ringChar K = 0` divides no
positive integer) is cyclic, dihedral of order `2n` (`n ≥ 2`), or isomorphic to `A_4`, `S_4` or
`A_5`. The class equation `1 - Σ (dᵢ - 1)/(fᵢ dᵢ) = 1/Ω` and its list of solutions are not
restated. -/
theorem finite_subgroup_PGL2_of_prime_to_char {K : Type*} [Field K] [IsAlgClosed K]
    (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) K)) [Finite H]
    (hH : ¬ ringChar K ∣ Nat.card H) :
    IsCyclic H ∨ (∃ n : ℕ, 2 ≤ n ∧ Nonempty (H ≃* DihedralGroup n)) ∨
      Nonempty (H ≃* alternatingGroup (Fin 4)) ∨ Nonempty (H ≃* Equiv.Perm (Fin 4)) ∨
      Nonempty (H ≃* alternatingGroup (Fin 5)) := by
  sorry

/-! ### Two transvections with distinct axes generate SL_2(F_ℓ) (ArithmeticGaloisRepresentations:R01.4/two-transvections-generate-sl2-over-a-prime-field) -/

/-- ArithmeticGaloisRepresentations:R01.4/two-transvections-generate-sl2-over-a-prime-field: for
a prime `ℓ` and `a, b ≠ 0` in `F_ℓ`, the matrices `[[1, a], [0, 1]]` and `[[1, 0], [b, 1]]`
generate `SL_2(F_ℓ)`. (False over `F_9`: for `(ab)² = -1` the group has order `120`.) The
consequence for subgroups of `GL(V)` containing two elements of order `ℓ` with distinct fixed
lines is part (a) of `serre_prop15_prop16`. -/
theorem closure_two_transvections_eq_top {ℓ : ℕ} [Fact ℓ.Prime] (a b : ZMod ℓ) (ha : a ≠ 0)
    (hb : b ≠ 0) (x y : Matrix.SpecialLinearGroup (Fin 2) (ZMod ℓ))
    (hx : (x : Matrix (Fin 2) (Fin 2) (ZMod ℓ)) = !![1, a; 0, 1])
    (hy : (y : Matrix (Fin 2) (Fin 2) (ZMod ℓ)) = !![1, 0; b, 1]) :
    Subgroup.closure {x, y} = ⊤ := by
  sorry

/-! ### An irreducible subgroup of GL_2 with abelian projective image has projective image (ℤ/2)² (ArithmeticGaloisRepresentations:R01.4/irreducible-with-abelian-projective-image-is-klein) -/

/-- ArithmeticGaloisRepresentations:R01.4/irreducible-with-abelian-projective-image-is-klein: for
`k` algebraically closed and `G ≤ GL_2(k)` irreducible (Burnside form: `G` spans `M_2(k)`) with
abelian image in `PGL_2(k)`: `2 ≠ 0` in `k`, the projective image has order `4` and exponent `2`,
and every non-scalar element of `G` has trace `0`. No finiteness of `G` is assumed. -/
theorem projImage_klein_of_irreducible_of_abelian {k : Type*} [Field k] [IsAlgClosed k]
    (G : Subgroup (GL (Fin 2) k))
    (hirr : Submodule.span k
      (Set.range fun g : G => ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) = ⊤)
    (hab : ∀ x ∈ G.map Matrix.ProjGenLinGroup.mk, ∀ y ∈ G.map Matrix.ProjGenLinGroup.mk,
      x * y = y * x) :
    (2 : k) ≠ 0 ∧ Nat.card (G.map Matrix.ProjGenLinGroup.mk) = 4 ∧
      (∀ x ∈ G.map Matrix.ProjGenLinGroup.mk, x ^ 2 = 1) ∧
      ∀ g ∈ G, (∀ a : k, ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) ≠ Matrix.scalar (Fin 2) a) →
        Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) = 0 := by
  sorry

/-! ### Galois's theorem: proper subgroups of PSL_2(F_q) have index at least q + 1 for q ≠ 2, 3, 5, 7, 9, 11 (ArithmeticGaloisRepresentations:R01.4/minimal-index-of-proper-subgroups-of-psl2) -/

/-- ArithmeticGaloisRepresentations:R01.4/minimal-index-of-proper-subgroups-of-psl2: for a finite
field with `q ∉ {2, 3, 5, 7, 9, 11}` elements every proper subgroup of `PSL_2(F_q)` has index
at least `q + 1`. (The existence of a subgroup of index `q + 1`, the statement for `SL_2` and
the least indices `2, 3, 5, 7, 6, 11` in the exceptional cases are not restated.) -/
theorem index_ge_of_ne_top_PSL2 {k : Type*} [Field k] [Finite k]
    (hq : Nat.card k ∉ ({2, 3, 5, 7, 9, 11} : Set ℕ))
    (H : Subgroup (Matrix.ProjectiveSpecialLinearGroup (Fin 2) k)) (hH : H ≠ ⊤) :
    Nat.card k + 1 ≤ H.index := by
  sorry

end GL2Subgroup

namespace GaloisRep

/-! ### Dihedral projective image if and only if induced from an index-two subgroup (ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced) -/

/-- ArithmeticGaloisRepresentations:R01.4/dihedral-projective-image-iff-induced, part (a): for a
profinite `Γ`, an algebraically closed `k` and `ρ : Γ → GL_2(k)` with finite projective image
(open projective kernel), `ρ` is irreducible with dihedral projective image of order `2n`
(`n ≥ 2`) iff `ρ ≅ Ind_Δ^Γ χ` for an open index-two `Δ` and `χ ≠ χ^σ`; the induced form is
expressed by a `Δ`-stable line moved by `Γ ∖ Δ` with `Δ` not acting by scalars. -/
theorem dihedral_iff_induced {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [TotallyDisconnectedSpace Γ] {k : Type*} [Field k] [IsAlgClosed k]
    (ρ : Γ →* GL (Fin 2) k)
    (hopen : IsOpen ((Matrix.ProjGenLinGroup.mk.comp ρ).ker : Set Γ))
    (hfin : Finite (Matrix.ProjGenLinGroup.mk.comp ρ).range) :
    ((Submodule.span k (Set.range fun g => ((ρ g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) = ⊤) ∧
        ∃ n : ℕ, 2 ≤ n ∧
          Nonempty ((Matrix.ProjGenLinGroup.mk.comp ρ).range ≃* DihedralGroup n)) ↔
      ∃ Δ : Subgroup Γ, IsOpen (Δ : Set Γ) ∧ Δ.index = 2 ∧
        ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
          (∀ δ ∈ Δ, D.map (Matrix.toLin' (ρ δ : Matrix (Fin 2) (Fin 2) k)) = D) ∧
          (∀ g ∉ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D) ∧
          ∃ δ ∈ Δ, ∀ a : k, (ρ δ : Matrix (Fin 2) (Fin 2) k) ≠ Matrix.scalar (Fin 2) a := by
  sorry

/-! ### Bad dihedral representations (ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representation) -/

section BadDihedral

/-- The cyclotomic field `F(ζ_p)` inside `F̄`. Local helper of this section. -/
def cyclotomicSubfield (F : Type*) [Field F] (p : ℕ) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.adjoin F {ζ : AlgebraicClosure F | IsPrimitiveRoot ζ p}

/-- `F' ⊂ F(ζ_p)`: the fixed field of the subgroup of squares of the cyclic group
`Gal(F(ζ_p)/F)` (so `F' = F` when `[F(ζ_p) : F]` is odd, and `F'` is the quadratic subextension
otherwise). -/
def cyclotomicSquareSubfield (F : Type*) [Field F] (p : ℕ) :
    IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.lift (IntermediateField.fixedField
    (Subgroup.closure {σ : cyclotomicSubfield F p ≃ₐ[F] cyclotomicSubfield F p | ∃ τ, σ = τ ^ 2}))

/-- Restriction of a representation of `G_F` to the closed subgroup `G_E = Gal(F̄/E)` fixing an
intermediate field `E`. Local helper of this section. -/
def resFixingSubgroup {F : Type*} [Field F] (E : IntermediateField F (AlgebraicClosure F))
    {A : Type*} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) :
    ContinuousRep (E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)) A M :=
  ρ.res ⟨(E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).subtype,
    continuous_subtype_val⟩

/-- For `F = ℚ` and an odd prime `p`, `F' = ℚ(√p*)` with `p* = (-1)^((p-1)/2) p`, and
`ℚ(√p*) = ℚ(g)` for the quadratic Gauss sum `g` attached to any primitive additive character. -/
theorem cyclotomicSquareSubfield_rat (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    cyclotomicSquareSubfield ℚ p = IntermediateField.adjoin ℚ
        {x : AlgebraicClosure ℚ | x ^ 2 = (((-1) ^ ((p - 1) / 2) * p : ℤ) : AlgebraicClosure ℚ)} ∧
      ∀ ψ : AddChar (ZMod p) (AlgebraicClosure ℚ), ψ.IsPrimitive →
        cyclotomicSquareSubfield ℚ p = IntermediateField.adjoin ℚ
          {gaussSum ((quadraticChar (ZMod p)).ringHomComp (Int.castRingHom _)) ψ} := by
  sorry

variable {F : Type*} [Field F] {k : Type*} [Field k] [TopologicalSpace k]
  {M : Type*} [AddCommGroup M] [Module k M] [Module.Finite k M] [Module.Projective k M]
  [TopologicalSpace M] [IsModuleTopology k M]

/-- `ρ̄` is bad dihedral (at `p`) if it is absolutely irreducible while its restriction to
`G_{F'}` is not (Dieulefait–Pacetti Definition 1.12 for `F = ℚ`). -/
def IsBadDihedral (p : ℕ) (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) : Prop :=
  ρ.IsAbsolutelyIrreducible ∧
    ¬ (resFixingSubgroup (cyclotomicSquareSubfield F p) ρ).IsAbsolutelyIrreducible

/-- Bad dihedral iff absolutely irreducible with `ρ̄|_{G_{F(ζ_p)}}` not absolutely irreducible. -/
theorem isBadDihedral_iff_cyclotomic [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    IsBadDihedral p ρ ↔ ρ.IsAbsolutelyIrreducible ∧
      ¬ (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible := by
  sorry

/-- Twisting by a continuous character (`σ(g) = ψ(g) • ρ(g)`) preserves being bad dihedral. -/
theorem isBadDihedral_tensor_character [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (ρ σ : ContinuousRep (Field.absoluteGaloisGroup F) k M)
    (ψ : Field.absoluteGaloisGroup F →ₜ* kˣ) (hσ : ∀ g, σ g = ((ψ g : kˣ) : k) • ρ g) :
    IsBadDihedral p σ ↔ IsBadDihedral p ρ := by
  sorry

/-- Being bad dihedral is invariant under extension `k ⊂ k'` of the finite coefficient field
(`ρ'` acting on `k' ⊗[k] M` by `(ρ g).baseChange k'`). -/
theorem isBadDihedral_baseChange [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    {k' : Type*} [Field k'] [Finite k'] [TopologicalSpace k'] [Algebra k k']
    [TopologicalSpace (k' ⊗[k] M)] [IsModuleTopology k' (k' ⊗[k] M)]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M)
    (ρ' : ContinuousRep (Field.absoluteGaloisGroup F) k' (k' ⊗[k] M))
    (hρ' : ∀ g, ρ' g = (ρ g).baseChange k') :
    IsBadDihedral p ρ' ↔ IsBadDihedral p ρ := by
  sorry

namespace IsBadDihedral

/-- For `F = ℚ`, a bad dihedral `ρ̄` has projective inertia image `π(ρ̄(I_p))` of order `≤ 2`
(`I_p` read in `G_ℚ` through a chosen embedding `ℚ̄ → ℚ̄_p`). This is the bound of the source
(Dieulefait–Pacetti, proof of Lemma 1.14); the order is in fact exactly `2`, because `ℚ(√p*)` is
ramified at `p`. -/
theorem projInertia_card_le_two {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    {ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) k M} (hρ : IsBadDihedral p ρ) :
    Nat.card ((((inertiaGroup ℚ_[p]).map (localEmbeddingMap ℚ ℚ_[p]).toMonoidHom).map
      ρ.toRepresentation.toHomUnits).map
        (QuotientGroup.mk' (Subgroup.center (LinearMap.GeneralLinearGroup k M)))) ≤ 2 := by
  sorry

/-- A bad dihedral `ρ̄` has `[F' : F] = 2`, is induced from `G_{F'}` (over `k̄`, a `G_{F'}`-stable
line moved by `G_F ∖ G_{F'}`) and has image of order prime to `p`. -/
theorem isInduced [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    {ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M} (hρ : IsBadDihedral p ρ) :
    ((cyclotomicSquareSubfield F p).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup F)).index = 2 ∧
    (∃ D : Submodule (AlgebraicClosure k) (AlgebraicClosure k ⊗[k] M),
        Module.finrank (AlgebraicClosure k) D = 1 ∧
        (∀ g ∈ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) = D) ∧
        ∀ g ∉ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) ≠ D) ∧
      Nat.Coprime (Nat.card ρ.toRepresentation.toHomUnits.range) p := by
  sorry

end IsBadDihedral

/-- Unit test: TauCeti.GaloisRep.isBadDihedral_x3_minus_x_minus_1. The representation of
`G_ℚ` over `F_23` with kernel cutting out the splitting field of `x³ - x - 1` and image of order
`6` (the standard representation of `S_3`) is bad dihedral at `23`. -/
example [Fact (Nat.Prime 23)] {M : Type*} [AddCommGroup M] [Module (ZMod 23) M]
    [Module.Finite (ZMod 23) M] [Module.Projective (ZMod 23) M] [TopologicalSpace M]
    [IsModuleTopology (ZMod 23) M] (hM : Module.finrank (ZMod 23) M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 23) M)
    (hker : ρ.toRepresentation.ker = ((IntermediateField.adjoin ℚ
      ((X ^ 3 - X - 1 : (Polynomial ℚ)).rootSet (AlgebraicClosure ℚ))).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup ℚ))) :
    IsBadDihedral 23 ρ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isBadDihedral_requires_absolute. In the previous example the
restriction to `G_{ℚ(√-23)}` is irreducible over `F_23` (but not absolutely irreducible). -/
example [Fact (Nat.Prime 23)] {M : Type*} [AddCommGroup M] [Module (ZMod 23) M]
    [Module.Finite (ZMod 23) M] [Module.Projective (ZMod 23) M] [TopologicalSpace M]
    [IsModuleTopology (ZMod 23) M] (hM : Module.finrank (ZMod 23) M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 23) M)
    (hker : ρ.toRepresentation.ker = ((IntermediateField.adjoin ℚ
      ((X ^ 3 - X - 1 : (Polynomial ℚ)).rootSet (AlgebraicClosure ℚ))).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup ℚ))) :
    (resFixingSubgroup (cyclotomicSquareSubfield ℚ 23) ρ).toRepresentation.IsIrreducible ∧
      ¬ (resFixingSubgroup (cyclotomicSquareSubfield ℚ 23) ρ).IsAbsolutelyIrreducible := by
  sorry

/-- Unit test: TauCeti.GaloisRep.not_isBadDihedral_of_SL2_le. -/
example (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) {M : Type*} [AddCommGroup M] [Module (ZMod p) M]
    [Module.Finite (ZMod p) M] [Module.Projective (ZMod p) M] [TopologicalSpace M]
    [IsModuleTopology (ZMod p) M] (b : Module.Basis (Fin 2) (ZMod p) M)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod p) M)
    (hSL : ∀ s : Matrix.SpecialLinearGroup (Fin 2) (ZMod p),
      ∃ g, LinearMap.toMatrix b b (ρ g) = (s : Matrix (Fin 2) (Fin 2) (ZMod p))) :
    ¬ IsBadDihedral p ρ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.badDihedral_p_three. -/
example {M : Type*} [AddCommGroup M] [Module (ZMod 3) M] [Module.Finite (ZMod 3) M]
    [Module.Projective (ZMod 3) M] [TopologicalSpace M] [IsModuleTopology (ZMod 3) M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 3) M) :
    cyclotomicSquareSubfield ℚ 3 = cyclotomicSubfield ℚ 3 ∧
      (IsBadDihedral 3 ρ ↔ ρ.IsAbsolutelyIrreducible ∧
        ¬ (resFixingSubgroup (cyclotomicSubfield ℚ 3) ρ).IsAbsolutelyIrreducible) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isBadDihedral_iff_induced. `ρ̄` is bad dihedral iff
`[F' : F] = 2` and `ρ̄ ⊗ F̄_p ≅ Ind_{G_{F'}}^{G_F} χ` with `χ ≠ χ^σ`: a `G_{F'}`-stable line moved
by some element outside `G_{F'}` (so `F' ≠ F`), with `G_{F'}` not acting by scalars. When
`F' = F` no `ρ̄` is bad dihedral. -/
example {F : Type*} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    IsBadDihedral p ρ ↔
      ∃ D : Submodule (AlgebraicClosure k) (AlgebraicClosure k ⊗[k] M),
        Module.finrank (AlgebraicClosure k) D = 1 ∧
        (∀ g ∈ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) = D) ∧
        (∃ g ∉ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          D.map ((ρ g).baseChange (AlgebraicClosure k)) ≠ D) ∧
        ∃ h ∈ ((cyclotomicSquareSubfield F p).fixingSubgroup :
            Subgroup (Field.absoluteGaloisGroup F)),
          ∀ a : AlgebraicClosure k,
            (ρ h).baseChange (AlgebraicClosure k) ≠ a • LinearMap.id := by
  sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicSquareSubfield_sqrt_five. For a number field `F`
containing `√5` and no primitive fifth root of unity (for instance `F = ℚ(√5)`) and `p = 5`:
`F(√p*) = F`, but `Gal(F(ζ_5)/F)` has order `2`, so `F' = F(ζ_5) ≠ F`. The definition of bad
dihedral by adjoining `√p*` would give `F` and declare nothing bad dihedral. -/
example {F : Type*} [Field F] [NumberField F] (h5 : ∃ x : F, x ^ 2 = 5)
    (hζ : ∀ ζ : F, ¬ IsPrimitiveRoot ζ 5) :
    IntermediateField.adjoin F {x : AlgebraicClosure F | x ^ 2 = 5} = ⊥ ∧
      cyclotomicSquareSubfield F 5 = cyclotomicSubfield F 5 ∧ cyclotomicSubfield F 5 ≠ ⊥ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.not_isBadDihedral_of_odd_cyclotomic_degree. If `[F(ζ_p) : F]`
is odd (for instance `F = ℚ(ζ_p)`) then `F' = F` and no representation is bad dihedral. -/
example {F : Type*} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    [Finite k] [CharP k p] (hM : Module.finrank k M = 2)
    (hodd : Odd (Module.finrank F (cyclotomicSubfield F p)))
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    cyclotomicSquareSubfield F p = ⊥ ∧ ¬ IsBadDihedral p ρ := by
  sorry

end BadDihedral

/-! ### The quadratic–cyclotomic irreducibility criterion and projective inertia of bad dihedral representations (ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representations-and-the-oddness-criterion) -/

/-- ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representations-and-the-oddness-criterion,
part (b): for `p` odd, `k` finite of characteristic `p` and `m ≥ 1`, absolute irreducibility of
`ρ̄` restricted to `G_{F'}`, to `G_{F(ζ_p)}` and to `G_{F(ζ_{p^m})}` are equivalent (no oddness
hypothesis). Parts (a), (c), (d) are not restated. -/
theorem isAbsolutelyIrreducible_res_cyclotomic_iff {F : Type*} [Field F] [NumberField F]
    {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) (m : ℕ) (hm : 1 ≤ m)
    {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k]
    {M : Type*} [AddCommGroup M] [Module k M] [Module.Finite k M] [Module.Projective k M]
    [TopologicalSpace M] [IsModuleTopology k M] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) :
    ((resFixingSubgroup (cyclotomicSquareSubfield F p) ρ).IsAbsolutelyIrreducible ↔
        (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible) ∧
      ((resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible ↔
        (resFixingSubgroup (cyclotomicSubfield F (p ^ m)) ρ).IsAbsolutelyIrreducible) := by
  sorry

/-! ### The image of a restriction and linear disjointness (ArithmeticGaloisRepresentations:R01.4/image-of-restriction-to-a-subfield) -/

/-- ArithmeticGaloisRepresentations:R01.4/image-of-restriction-to-a-subfield, part (b): for `ρ`
with discrete coefficients and kernel field `K = F̄^{ker ρ}`, if a finite extension `F' ⊂ F̄` meets
`K` only in `F` (linear disjointness, `K/F` being Galois), then `ρ(G_{F'}) = ρ(G_F)`. Parts (a),
(c)–(f) are not restated. -/
theorem image_res_eq_of_disjoint {F : Type*} [Field F] {A : Type*} [CommRing A]
    [TopologicalSpace A] [DiscreteTopology A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M)
    (F' : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F F']
    (hdisj : IntermediateField.fixedField
      (ρ.toRepresentation.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)) ⊓ F' = ⊥) :
    (F'.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).map
        ρ.toRepresentation.toHomUnits = ρ.toRepresentation.toHomUnits.range := by
  sorry

/-! ### Normal subgroups, quotients and automorphisms of SL_2, PSL_2, PGL_2 over finite fields (ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2) -/

/-- ArithmeticGaloisRepresentations:R01.4/normal-subgroups-and-automorphisms-of-psl2-pgl2, part
(a): for `q ≥ 4`, `SL_2(F_q)` is perfect, `PSL_2(F_q)` is simple, and every normal subgroup of
`GL_2(F_q)` contains `SL_2(F_q)` or is central. Parts (b)–(e) are not restated. -/
theorem normal_subgroups_GL2 {k : Type*} [Field k] [Finite k] (hq : 4 ≤ Nat.card k) :
    commutator (Matrix.SpecialLinearGroup (Fin 2) k) = ⊤ ∧
      IsSimpleGroup (Matrix.ProjectiveSpecialLinearGroup (Fin 2) k) ∧
      ∀ N : Subgroup (GL (Fin 2) k), N.Normal →
        (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) k →* _).range ≤ N ∨
          N ≤ Subgroup.center (GL (Fin 2) k) := by
  sorry

/-! ### Residual images under restriction to cyclotomic fields (ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field) -/

/-- ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, parts (b) and
(g): if `ρ̄` is irreducible and `ρ̄|_{G_{F(ζ_p)}}` is not absolutely irreducible, the image of `ρ̄`
lies in the normaliser of a Cartan subgroup; and for `l ≥ 3` a normal subgroup `Δ ⊴ GL_2(F_l)`
with `det Δ = F_lˣ` is all of `GL_2(F_l)`. Parts (a), (c)–(f), (h) are not restated. -/
theorem image_normalizer_cartan_of_res_cyclotomic {F : Type*} [Field F] [NumberField F]
    {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k]
    {M : Type*} [AddCommGroup M] [Module k M] [Module.Finite k M] [Module.Projective k M]
    [TopologicalSpace M] [IsModuleTopology k M] (hM : Module.finrank k M = 2)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M)
    (hirr : ρ.toRepresentation.IsIrreducible)
    (hred : ¬ (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible) :
    (∃ C : Subgroup (LinearMap.GeneralLinearGroup k M), GL2Cartan.IsCartan C ∧
      ρ.toRepresentation.toHomUnits.range ≤
        Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup k M))) ∧
    ∀ (l : ℕ) [Fact l.Prime], 3 ≤ l → ∀ Δ : Subgroup (GL (Fin 2) (ZMod l)), Δ.Normal →
      Δ.map Matrix.GeneralLinearGroup.det = ⊤ → Δ = ⊤ := by
  sorry

/-! ### Large residual image: persistence under small index and soluble base change, and a tame-inertia criterion (ArithmeticGaloisRepresentations:R01.4/large-image-persistence) -/

/-- ArithmeticGaloisRepresentations:R01.4/large-image-persistence, part (a): for `p ≥ 5`,
`a ≥ 2` and a finite `G ≤ GL_2(F̄_p)` containing `g SL_2(F_{p^a}) g⁻¹`, every subgroup of index
`< 2p` contains the same conjugate. Parts (b), (c) are not restated. -/
theorem le_of_relIndex_lt {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p) (a : ℕ) (ha : 2 ≤ a)
    (F₀ : Subfield (AlgebraicClosure (ZMod p))) (hF₀ : Nat.card F₀ = p ^ a)
    (g : GL (Fin 2) (AlgebraicClosure (ZMod p)))
    (G H : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod p)))) [Finite G]
    (hSG : ((Matrix.SpecialLinearGroup.toGL.comp
      (Matrix.SpecialLinearGroup.map F₀.subtype)).range.map (MulAut.conj g).toMonoidHom) ≤ G)
    (hHG : H ≤ G) (hindex : H.relIndex G < 2 * p) :
    ((Matrix.SpecialLinearGroup.toGL.comp
      (Matrix.SpecialLinearGroup.map F₀.subtype)).range.map (MulAut.conj g).toMonoidHom) ≤ H := by
  sorry

/-! ### Characteristic two: non-solvable residual images and the module M_2(F) (ArithmeticGaloisRepresentations:R01.4/characteristic-two-residual-image-facts) -/

/-- ArithmeticGaloisRepresentations:R01.4/characteristic-two-residual-image-facts, parts (b), (d):
for `F` finite of characteristic two and `F₀ ⊂ F` with `|F₀| ≥ 4`, the `SL_2(F₀)`-invariants of
`M_2(F)` (conjugation action) are the scalars, and the only `SL_2(F₀)`-stable subspaces are
`0`, `F·1`, the trace-zero matrices and `M_2(F)`. Parts (a), (c), (e) are not restated. -/
theorem sl2_submodules_charTwo {F : Type*} [Field F] [Finite F] [CharP F 2] (F₀ : Subfield F)
    (hF₀ : 4 ≤ Nat.card F₀) :
    let G₀ := (Matrix.SpecialLinearGroup.map F₀.subtype :
      Matrix.SpecialLinearGroup (Fin 2) F₀ →* Matrix.SpecialLinearGroup (Fin 2) F).range
    (∀ X : Matrix (Fin 2) (Fin 2) F,
      (∀ g ∈ G₀, (g : Matrix (Fin 2) (Fin 2) F) * X = X * (g : Matrix (Fin 2) (Fin 2) F)) ↔
        X ∈ Submodule.span F {(1 : Matrix (Fin 2) (Fin 2) F)}) ∧
    ∀ W : Submodule F (Matrix (Fin 2) (Fin 2) F),
      (∀ g ∈ G₀, ∀ X ∈ W, (g : Matrix (Fin 2) (Fin 2) F) * X *
          ((g⁻¹ : Matrix.SpecialLinearGroup (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) ∈ W) →
        W = ⊥ ∨ W = Submodule.span F {1} ∨ W = LinearMap.ker (Matrix.traceLinearMap (Fin 2) F F) ∨
          W = ⊤ := by
  sorry

/-! ### Density of Frobenius elements (ArithmeticGaloisRepresentations:R01.5/frobenius-density) -/

section Frobenius

variable {K : Type*} [Field K] [NumberField K]

/-- `σ ∈ G_K` is an arithmetic Frobenius at the prime `Q` of the integral closure of `𝓞 K` in
`K̄` (Mathlib's `AlgHom.IsArithFrobAt` for the restriction of `σ`). Local helper of this section;
the decomposition-group API is R01.2's. -/
def IsArithFrobAtIntegralPrime (σ : Field.absoluteGaloisGroup K)
    (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))) : Prop :=
  ((show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from σ).restrictScalars
    (𝓞 K)).mapIntegralClosure.toAlgHom.IsArithFrobAt Q

/-- ArithmeticGaloisRepresentations:R01.5/frobenius-density, part (a), first assertion: for a set
`Σ` of finite places of `K` of Dirichlet density one (Mathlib's
`NumberField.Set.HasDirichletDensity`, the limit as `s → 1⁺` of the ratio to the sum over all
nonzero primes; every cofinite set qualifies), the `Σ`-Frobenius elements are dense in `G_K`.
The exact density `#C/[G_K : U]` of the places with a Frobenius lift in a coset `gU` is
`hasDirichletDensity_frobenius_of_mem_range` below, applied to `G_K → G_K/U`. The proof uses
Tau Ceti's `IsArithFrobAt.restrictNormal` and `NumberField.isArithFrobAt_eq_of_isUnramifiedAt`
to restrict a Frobenius lift to a finite Galois level. -/
theorem dense_frobenius (Pl : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1) :
    Dense {σ : Field.absoluteGaloisGroup K |
      ∃ Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K)), Q.IsMaximal ∧
        (∃ v ∈ Pl, Q.under (𝓞 K) = v.asIdeal) ∧ IsArithFrobAtIntegralPrime σ Q} := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/frobenius-density, part (c) in the corrected form: two
continuous maps from `G_K` to a Hausdorff space that agree at every Frobenius element above a
set of places of Dirichlet density one are equal. (In the node the maps are defined on the image
of a representation unramified at those places; composing with the representation gives this
form.) -/
theorem eq_of_eqOn_frobenius {Y : Type*} [TopologicalSpace Y] [T2Space Y]
    (Pl : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (f₁ f₂ : Field.absoluteGaloisGroup K → Y) (h₁ : Continuous f₁) (h₂ : Continuous f₂)
    (h : ∀ (σ : Field.absoluteGaloisGroup K)
      (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))), Q.IsMaximal →
        (∃ v ∈ Pl, Q.under (𝓞 K) = v.asIdeal) → IsArithFrobAtIntegralPrime σ Q → f₁ σ = f₂ σ) :
    f₁ = f₂ := by
  sorry

/-! ### Every element of a finite image is a Frobenius at a set of primes of positive density (ArithmeticGaloisRepresentations:R01.5/every-element-of-a-finite-image-is-a-frobenius) -/

/-- ArithmeticGaloisRepresentations:R01.5/every-element-of-a-finite-image-is-a-frobenius: for a
continuous `φ : G_K → H` with `H` finite discrete, every `h ∈ φ(G_K)` is `φ(Frob_w)` for places
`w ∣ v` with `v` in an infinite set avoiding any finite `T`. This is the qualitative consequence;
the density `#(class of h)/#φ(G_K)` is `hasDirichletDensity_frobenius_of_mem_range` below. -/
theorem infinite_frobenius_of_mem_range {H : Type*} [Group H] [Finite H] [TopologicalSpace H]
    [DiscreteTopology H] (φ : Field.absoluteGaloisGroup K →ₜ* H) (h : H)
    (hh : h ∈ φ.toMonoidHom.range) (T : Set (Ideal (𝓞 K))) (hT : T.Finite) :
    {P : Ideal (𝓞 K) | P.IsMaximal ∧ P ∉ T ∧
      ∃ (σ : Field.absoluteGaloisGroup K)
        (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))),
        Q.IsMaximal ∧ Q.under (𝓞 K) = P ∧ IsArithFrobAtIntegralPrime σ Q ∧ φ σ = h}.Infinite := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/every-element-of-a-finite-image-is-a-frobenius, with
its density, and R01.5/frobenius-density, part (a), second assertion (take `H = G_K/U`): for a
continuous `φ : G_K → H` with `H` finite discrete, `h ∈ φ(G_K)` and a set `Σ` of places of
Dirichlet density one, the places `v ∈ Σ` at which some Frobenius lift is mapped to `h` have
Dirichlet density `#(conjugacy class of h in φ(G_K))/#φ(G_K)`; the class is taken in the image,
not in `H`. A place is counted when some Frobenius lift at some place above it is mapped to
`h`; at the finitely many places where `φ` is ramified this differs from the set of the node
(which leaves those places out), and a finite set does not change the density. -/
theorem hasDirichletDensity_frobenius_of_mem_range {H : Type*} [Group H] [Finite H]
    [TopologicalSpace H] [DiscreteTopology H] (φ : Field.absoluteGaloisGroup K →ₜ* H) (h : H)
    (hh : h ∈ φ.toMonoidHom.range)
    (Pl : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1) :
    NumberField.Set.HasDirichletDensity
      {v : IsDedekindDomain.HeightOneSpectrum (𝓞 K) | v ∈ Pl ∧
        ∃ (σ : Field.absoluteGaloisGroup K)
          (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))),
          Q.IsMaximal ∧ Q.under (𝓞 K) = v.asIdeal ∧ IsArithFrobAtIntegralPrime σ Q ∧ φ σ = h}
      ((Nat.card {x : φ.toMonoidHom.range // IsConj x ⟨h, hh⟩} : ℝ) /
        Nat.card φ.toMonoidHom.range) := by
  sorry

end Frobenius

/-! ### Primes with prescribed quadratic residue symbols, possibly coincident quadratic fields (ArithmeticGaloisRepresentations:R01.5/prescribed-quadratic-residue-symbols) -/

/-- ArithmeticGaloisRepresentations:R01.5/prescribed-quadratic-residue-symbols, (i) ⇔ (iii):
infinitely many odd primes `p ∤ ∏ dᵢ` have `(dᵢ/p) = εᵢ` for all `i` iff `∏_{i∈J} εᵢ = 1`
whenever `∏_{i∈J} dᵢ` is a square. (Legendre symbols are written with `jacobiSym`, which agrees
with `legendreSym` at primes; the density statement (ii) is omitted.) -/
theorem infinite_primes_jacobiSym_iff {r : ℕ} (d : Fin r → ℤ) (hd : ∀ i, d i ≠ 0)
    (ε : Fin r → ℤ) (hε : ∀ i, ε i = 1 ∨ ε i = -1) :
    {p : ℕ | p.Prime ∧ p ≠ 2 ∧ ¬ (p : ℤ) ∣ ∏ i, d i ∧ ∀ i, jacobiSym (d i) p = ε i}.Infinite ↔
      ∀ J : Finset (Fin r), IsSquare (∏ i ∈ J, d i) → ∏ i ∈ J, ε i = 1 := by
  sorry

/-! ### Chebotarev recognition by Frobenius characteristic polynomials (ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent) -/

section Recognition

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

/-- ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent,
in the form (c) for a profinite `Γ` and a dense subset `D` (for `Γ = G_K`, `D` is the set of
Frobenius elements at a density-one set of places, R01.5/frobenius-density): two
representations over a common Hausdorff topological coefficient field `E` with equal
characteristic polynomials on `D` have isomorphic semisimplifications, and are isomorphic when
semisimple. The node starts from two coefficient fields `E₁`, `E₂` with continuous embeddings
into `E`; here both representations are already extended to `E`. Without `T2Space E` the
statement is false (indiscrete topology: every representation is continuous). -/
theorem semisimplification_iso_of_charpoly_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁] [Module.Projective E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂] [Module.Projective E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep Γ E V₁) (ρ₂ : ContinuousRep Γ E V₂) (D : Set Γ) (hD : Dense D)
    (hchar : ∀ γ ∈ D, ρ₁.charpoly γ = ρ₂.charpoly γ) :
    Nonempty (ContinuousRep.Iso ρ₁.semisimplification.rep ρ₂.semisimplification.rep) ∧
      (IsSemisimpleModule (MonoidAlgebra E Γ) ρ₁.toRepresentation.asModule →
        IsSemisimpleModule (MonoidAlgebra E Γ) ρ₂.toRepresentation.asModule →
          Nonempty (ContinuousRep.Iso ρ₁ ρ₂)) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent,
variant (a): when `n!` is invertible in `E` (characteristic `0` or `> n`), equal traces on a
dense subset suffice (R01.1/brauer-nesbitt-traces). For `0 < char E ≤ n` this fails in general:
`1^{⊕n}` and `χ^{⊕p} ⊕ 1^{⊕(n-p)}` have the same trace. -/
theorem semisimplification_iso_of_trace_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁] [Module.Projective E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂] [Module.Projective E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep Γ E V₁) (ρ₂ : ContinuousRep Γ E V₂)
    (hdim : Module.finrank E V₁ = Module.finrank E V₂)
    (hfact : ((Module.finrank E V₁).factorial : E) ≠ 0) (D : Set Γ) (hD : Dense D)
    (htr : ∀ γ ∈ D, LinearMap.trace E V₁ (ρ₁ γ) = LinearMap.trace E V₂ (ρ₂ γ)) :
    Nonempty (ContinuousRep.Iso ρ₁.semisimplification.rep ρ₂.semisimplification.rep) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent,
the main form for `Γ = G_K`: two continuous representations of `G_K` over a common Hausdorff
topological coefficient field `E` whose characteristic polynomials agree at every Frobenius
element above a set of places of Dirichlet density one
(`NumberField.Set.HasDirichletDensity`) have isomorphic semisimplifications. The node assumes
both representations unramified at those places and compares the polynomials of the Frobenius
classes; here the hypothesis is on every Frobenius lift, which is the same for unramified
representations, so no ramification hypothesis appears. It follows from `dense_frobenius` and
`semisimplification_iso_of_charpoly_eq`. -/
theorem semisimplification_iso_of_frobenius_charpoly_eq {K : Type*} [Field K] [NumberField K]
    {E : Type*} [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁] [Module.Projective E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂] [Module.Projective E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep (Field.absoluteGaloisGroup K) E V₁)
    (ρ₂ : ContinuousRep (Field.absoluteGaloisGroup K) E V₂)
    (Pl : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (hchar : ∀ (σ : Field.absoluteGaloisGroup K)
      (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))), Q.IsMaximal →
        (∃ v ∈ Pl, Q.under (𝓞 K) = v.asIdeal) → IsArithFrobAtIntegralPrime σ Q →
          ρ₁.charpoly σ = ρ₂.charpoly σ) :
    Nonempty (ContinuousRep.Iso ρ₁.semisimplification.rep ρ₂.semisimplification.rep) := by
  sorry

end Recognition

/-! ### Rank two: the pair (trace, determinant) is the 2-dimensional determinant (ArithmeticGaloisRepresentations:R01.5/rank-two-trace-and-determinant-comparison) -/

/-- ArithmeticGaloisRepresentations:R01.5/rank-two-trace-and-determinant-comparison, part (1):
for `ρ : Γ → GL_2(A)` the pair `(T, δ) = (tr ρ, det ρ)` satisfies the identities of Chenevier's
Lemma 1.9 (IntegralHeckeAndGaloisDeterminants IHG.0/determinant-dimension-two): `T(1) = 2`,
`T(gh) = T(hg)` and `δ(g) T(g⁻¹h) − T(g) T(h) + T(gh) = 0`. Part (2), that `(T, δ)` corresponds to
the determinant law `det ∘ ρ` under the bijection of that node, cannot be stated: Mathlib has no
determinant laws (multiplicative polynomial laws). -/
theorem trace_det_identities_of_rankTwo {A Γ : Type*} [CommRing A] [Group Γ]
    (ρ : Γ →* GL (Fin 2) A) :
    Matrix.trace ((ρ 1 : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) = 2 ∧
    (∀ g h, Matrix.trace ((ρ (g * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
      Matrix.trace ((ρ (h * g) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A)) ∧
    ∀ g h, Matrix.det ((ρ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) *
        Matrix.trace ((ρ (g⁻¹ * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) -
      Matrix.trace ((ρ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) *
        Matrix.trace ((ρ h : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) +
      Matrix.trace ((ρ (g * h) : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) = 0 := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/rank-two-trace-and-determinant-comparison, part (3),
(i) ⇔ (ii): two `2 × 2` matrices have the same characteristic polynomial iff they have the same
trace and the same determinant, over every commutative ring (including characteristic two,
where the trace alone does not determine the determinant). -/
theorem charpoly_eq_iff_trace_eq_and_det_eq {A : Type*} [CommRing A]
    (M N : Matrix (Fin 2) (Fin 2) A) :
    M.charpoly = N.charpoly ↔ M.trace = N.trace ∧ M.det = N.det := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/rank-two-trace-and-determinant-comparison, part (4):
for a Hausdorff topological ring `A` and continuous `ρ₁, ρ₂ : Γ → GL_2(A)`, equality of trace and
determinant on a dense subset gives equality of characteristic polynomials everywhere. -/
theorem charpoly_eq_of_trace_det_eq_on_dense {A Γ : Type*} [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [T2Space A] [Group Γ] [TopologicalSpace Γ]
    (ρ₁ ρ₂ : Γ →* GL (Fin 2) A)
    (h₁ : Continuous fun g => ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A))
    (h₂ : Continuous fun g => ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A))
    (D : Set Γ) (hD : Dense D)
    (h : ∀ g ∈ D,
      Matrix.trace ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
        Matrix.trace ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) ∧
      Matrix.det ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
        Matrix.det ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A)) :
    ∀ g, Matrix.charpoly ((ρ₁ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) =
      Matrix.charpoly ((ρ₂ g : GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) := by
  sorry

/-! ### The image algebra, field of definition and Brauer class of an absolutely irreducible representation (ArithmeticGaloisRepresentations:R01.5/brauer-class-of-an-absolutely-irreducible-representation) -/

section BrauerClass

universe uK

variable {k : Type*} [Field k] {K : Type uK} [Field K] [Algebra k K]
  {Γ : Type*} [Group Γ] {n : ℕ}

/- In this section `ρ` absolutely irreducible is expressed in Burnside form (`ρ(Γ)` spans
`M_n(k̄)`) together with `[NeZero n]`: for `n = 0` the span condition holds trivially while
`B(ρ)` is the zero ring, which is not simple. -/

/-- The field of traces `k(ρ) = k(tr ρ(γ) : γ ∈ Γ)` inside `k̄`. -/
def traceField (ρ : Γ →* GL (Fin n) K) : IntermediateField k K :=
  IntermediateField.adjoin k
    (Set.range fun γ => Matrix.trace ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- The image algebra `B(ρ)`: the `k(ρ)`-subalgebra of `M_n(k̄)` spanned by `ρ(Γ)`. -/
def imageAlgebra (ρ : Γ →* GL (Fin n) K) :
    Subalgebra (traceField (k := k) ρ) (Matrix (Fin n) (Fin n) K) :=
  Algebra.adjoin (traceField (k := k) ρ)
    (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- For `ρ` absolutely irreducible (Burnside form: `ρ(Γ)` spans `M_n(k̄)`, and `n ≥ 1`), `B(ρ)`
is a central simple `k(ρ)`-algebra of dimension `n²`. -/
theorem imageAlgebra_isCentralSimple [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    Algebra.IsCentral (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) ∧
      IsSimpleRing (imageAlgebra (k := k) ρ) ∧
      Module.finrank (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) = n ^ 2 := by
  sorry

/-- The multiplication map `k̄ ⊗_{k(ρ)} B(ρ) → M_n(k̄)`, `c ⊗ b ↦ c • b`, is an isomorphism of
`k̄`-algebras (the isomorphism is this map, not an unspecified one). -/
theorem imageAlgebra_baseChange [IsAlgClosed K] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    ∃ e : K ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[K] Matrix (Fin n) (Fin n) K,
      ∀ (c : K) (b : imageAlgebra (k := k) ρ),
        e (c ⊗ₜ[traceField (k := k) ρ] b) = c • (b : Matrix (Fin n) (Fin n) K) := by
  sorry

/-- The Brauer class `β(ρ) = [B(ρ)] ∈ Br(k(ρ))`: the class of the central simple
`k(ρ)`-algebra `B(ρ)` in Mathlib's `BrauerGroup` (the group structure, `BrauerGroup.mk` and
`CSA.of` are Tau Ceti's; `B(ρ)` lives in the universe of `k(ρ)`, as the group structure needs). -/
def brauerClass [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    BrauerGroup.{uK, uK} (traceField (k := k) ρ) :=
  haveI := (imageAlgebra_isCentralSimple (k := k) ρ hρ).1
  haveI := (imageAlgebra_isCentralSimple (k := k) ρ hρ).2.1
  haveI : FiniteDimensional (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) := sorry
  Quotient.mk (Brauer.CSA_Setoid _) (CSA.mk (AlgCat.of _ (imageAlgebra (k := k) ρ)))

/-- Isomorphic (conjugate) representations have the same trace field and Brauer class. -/
theorem brauerClass_congr [IsAlgClosed K] [NeZero n] (ρ ρ' : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (hρ' : Submodule.span K
      (Set.range fun γ => ((ρ' γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (g : GL (Fin n) K) (hg : ∀ γ, ρ' γ = g * ρ γ * g⁻¹) :
    ∃ h : traceField (k := k) ρ = traceField (k := k) ρ',
      (h ▸ brauerClass (k := k) ρ hρ : BrauerGroup.{uK, uK} (traceField (k := k) ρ')) =
        brauerClass (k := k) ρ' hρ' := by
  sorry

/-- The Schur index `s(ρ)`: the index of `β(ρ)`, i.e. the degree of the central division algebra
`Δ` with `B(ρ) ≅ M_a(Δ)`. In the roadmap this is `TauCeti.Algebra.index k(ρ) B(ρ)` (Tau Ceti's
index of a central simple algebra, which cannot be imported here), so the number is data left
to be constructed; no value is chosen here. It is determined by `schurIndex_spec`, and its two
properties in the roadmap are `schurIndex_dvd` and `schurIndex_eq_one_iff`. -/
def schurIndex [IsAlgClosed K] (ρ : Γ →* GL (Fin n) K)
    (_hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) : ℕ :=
  let _B := imageAlgebra (k := k) ρ
  sorry

/-- The characterisation of the Schur index, for `ρ` absolutely irreducible of dimension
`n ≥ 1`: `B(ρ)` has a Wedderburn presentation `M_a(Δ)` with `Δ` a division algebra of dimension
`s(ρ)²` over `k(ρ)` and `n = a · s(ρ)`; and in every presentation `B(ρ) ≅ M_a(Δ)` with `Δ` a
division ring, `Δ` has dimension `s(ρ)²` over `k(ρ)`. -/
theorem schurIndex_spec [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    (∃ (a : ℕ) (Δ : Type uK) (_ : DivisionRing Δ) (_ : Algebra (traceField (k := k) ρ) Δ),
        Module.finrank (traceField (k := k) ρ) Δ = schurIndex (k := k) ρ hρ ^ 2 ∧
        n = a * schurIndex (k := k) ρ hρ ∧
        Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
          Matrix (Fin a) (Fin a) Δ)) ∧
      ∀ (a : ℕ) (Δ : Type uK) [DivisionRing Δ] [Algebra (traceField (k := k) ρ) Δ],
        Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
          Matrix (Fin a) (Fin a) Δ) →
        Module.finrank (traceField (k := k) ρ) Δ = schurIndex (k := k) ρ hρ ^ 2 := by
  sorry

/-- The Schur index divides the dimension: `s(ρ) ∣ n`. -/
theorem schurIndex_dvd [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    schurIndex (k := k) ρ hρ ∣ n := by
  sorry

/-- `s(ρ) = 1` iff `β(ρ)` is trivial. -/
theorem schurIndex_eq_one_iff [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    schurIndex (k := k) ρ hρ = 1 ↔
      brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
        (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) := by
  sorry

/-- `β(ρ)` is trivial iff `B(ρ) ≅ M_n(k(ρ))` iff `ρ` is conjugate to a representation with values
in `GL_n(k(ρ))`. -/
theorem brauerClass_eq_one_iff [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    (brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
        (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) ↔
      Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
        Matrix (Fin n) (Fin n) (traceField (k := k) ρ))) ∧
    (Nonempty (imageAlgebra (k := k) ρ ≃ₐ[traceField (k := k) ρ]
        Matrix (Fin n) (Fin n) (traceField (k := k) ρ)) ↔
      ∃ g : GL (Fin n) K, ∀ γ i j,
        ((g * ρ γ * g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈
          traceField (k := k) ρ) := by
  sorry

/-- For an extension `k'` of `k(ρ)` inside `k̄`, `ρ` is realizable over `k'` iff `k'` splits
`B(ρ)`. (The map `Br(k(ρ)) → Br(k')` is Tau Ceti's `TauCeti.BrauerGroup.baseChange`, not in
Mathlib, so the first half of the packet's statement — `β(ρ)` maps to `[B(ρ) ⊗ k']` — is
omitted; "`k'` splits `B(ρ)`" is `TauCeti.Algebra.IsSplittingField`, written out here.) -/
theorem brauerClass_baseChange [IsAlgClosed K] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (k' : IntermediateField (traceField (k := k) ρ) K) :
    (∃ g : GL (Fin n) K, ∀ γ i j,
        ((g * ρ γ * g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ k') ↔
      Nonempty (k' ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[k']
        Matrix (Fin n) (Fin n) k') := by
  sorry

/-- If `k(ρ)` is finite then `β(ρ)` is trivial. -/
theorem brauerClass_finite [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    [Finite (traceField (k := k) ρ)] :
    brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
      (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) := by
  sorry

/-- If `k(ρ) = k`, then `B(ρ) ≅ k[Γ]/ker(D)` for the determinant `D` descended to `k`. Mathlib
has no determinant laws; for absolutely irreducible `ρ`, `ker(D)` is the kernel of
`k[Γ] → M_n(k̄)` (Chenevier), which is what is used here. -/
theorem imageAlgebra_eq_quotient_ker [IsAlgClosed K] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (hk : traceField (k := k) ρ = ⊥) :
    Nonempty (imageAlgebra (k := k) ρ ≃+* MonoidAlgebra k Γ ⧸ RingHom.ker
      (MonoidAlgebra.lift k (Matrix (Fin n) (Fin n) K) Γ
        ((Units.coeHom (Matrix (Fin n) (Fin n) K)).comp ρ))) := by
  sorry

/-- For absolutely irreducible `ρ` and every `b ∈ B(ρ)` (in particular `b = ρ(γ)`), the
characteristic polynomial of `b` has coefficients in `k(ρ)`: it is the reduced characteristic
polynomial of `b` in `B(ρ)`. So `k(ρ)` is also generated by the coefficients of all
`det(X − ρ(γ))`, in every characteristic. -/
theorem charpoly_mem_traceField [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (b : imageAlgebra (k := k) ρ) (i : ℕ) :
    (Matrix.charpoly (b : Matrix (Fin n) (Fin n) K)).coeff i ∈ traceField (k := k) ρ := by
  sorry

end BrauerClass

/-- Unit test: TauCeti.GaloisRep.brauerClass_quaternion_real. -/
example (ρ : QuaternionGroup 2 →* GL (Fin 2) ℂ)
    (hρ : Submodule.span ℂ
      (Set.range fun γ => ((ρ γ : GL (Fin 2) ℂ) : Matrix (Fin 2) (Fin 2) ℂ)) = ⊤) :
    traceField (k := ℝ) ρ = ⊥ ∧
      Nonempty (imageAlgebra (k := ℝ) ρ ≃+* Quaternion ℝ) ∧
      brauerClass (k := ℝ) ρ hρ ≠ Quotient.mk (Brauer.CSA_Setoid _)
        (CSA.mk (AlgCat.of (traceField (k := ℝ) ρ) (traceField (k := ℝ) ρ))) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.brauerClass_one_dim. -/
example {k K Γ : Type*} [Field k] [Field K] [Algebra k K] [IsAlgClosed K] [Group Γ]
    (ρ : Γ →* GL (Fin 1) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin 1) K) : Matrix (Fin 1) (Fin 1) K)) = ⊤) :
    imageAlgebra (k := k) ρ = ⊥ ∧
      brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
        (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.brauerClass_finite_field. `Γ` is finite, so that `k(ρ)` is a
finite field (for an infinite group `k(ρ)` can be infinite, for instance `GL_n(F̄_q)` with its
standard representation). -/
example {k K Γ : Type*} [Field k] [Finite k] [Field K] [Algebra k K] [IsAlgClosed K]
    [Algebra.IsAlgebraic k K] [Group Γ] [Finite Γ] {n : ℕ} [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
      (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.imageAlgebra_not_field_span. For a faithful character
`χ : ℤ/3 → ℚ̄ˣ`, the `ℚ`-span of `χ(ℤ/3)` has `ℚ`-dimension `2 ≠ 1 = n²`, while the image algebra
over `k(χ) = ℚ(ζ_3)` has dimension `1`. -/
example (χ : Multiplicative (ZMod 3) →* GL (Fin 1) (AlgebraicClosure ℚ))
    (hχ : Function.Injective χ) :
    Module.finrank ℚ (Submodule.span ℚ (Set.range fun γ =>
      ((χ γ : GL (Fin 1) (AlgebraicClosure ℚ)) : Matrix (Fin 1) (Fin 1) (AlgebraicClosure ℚ)))) =
        2 ∧
      Module.finrank (traceField (k := ℚ) χ) (imageAlgebra (k := ℚ) χ) = 1 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.schurIndex_quaternion_rational. For the 2-dimensional
irreducible representation `ρ` of `Q_8` over an algebraic closure of `k`: `k(ρ) = k`, and
`s(ρ) = 2` for `k = ℚ` and `k = ℚ_2`, `s(ρ) = 1` for `k = ℚ_ℓ`, `ℓ` odd. -/
example :
    (∀ (ρ : QuaternionGroup 2 →* GL (Fin 2) (AlgebraicClosure ℚ))
      (hρ : Submodule.span (AlgebraicClosure ℚ) (Set.range fun γ =>
        ((ρ γ : GL (Fin 2) (AlgebraicClosure ℚ)) :
          Matrix (Fin 2) (Fin 2) (AlgebraicClosure ℚ))) = ⊤),
      traceField (k := ℚ) ρ = ⊥ ∧ schurIndex (k := ℚ) ρ hρ = 2) ∧
    ∀ (ℓ : ℕ) [Fact ℓ.Prime] (ρ : QuaternionGroup 2 →* GL (Fin 2) (AlgebraicClosure ℚ_[ℓ]))
      (hρ : Submodule.span (AlgebraicClosure ℚ_[ℓ]) (Set.range fun γ =>
        ((ρ γ : GL (Fin 2) (AlgebraicClosure ℚ_[ℓ])) :
          Matrix (Fin 2) (Fin 2) (AlgebraicClosure ℚ_[ℓ]))) = ⊤),
      traceField (k := ℚ_[ℓ]) ρ = ⊥ ∧
        schurIndex (k := ℚ_[ℓ]) ρ hρ = if ℓ = 2 then 2 else 1 := by
  sorry

/-! ### Characters of pairwise non-isomorphic absolutely irreducible representations are linearly independent (ArithmeticGaloisRepresentations:R01.5/absolutely-irreducible-determined-by-trace) -/

/-- ArithmeticGaloisRepresentations:R01.5/absolutely-irreducible-determined-by-trace, part (3):
two absolutely irreducible representations (Burnside form, dimension `≥ 1`) of a group over a
field with the same trace function have the same dimension. No hypothesis on the
characteristic. -/
theorem eq_dim_of_trace_eq_of_span_eq_top {k Γ : Type*} [Field k] [Group Γ] {n m : ℕ}
    [NeZero n] [NeZero m] (ρ₁ : Γ →* GL (Fin n) k) (ρ₂ : Γ →* GL (Fin m) k)
    (h₁ : Submodule.span k
      (Set.range fun γ => ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) = ⊤)
    (h₂ : Submodule.span k
      (Set.range fun γ => ((ρ₂ γ : GL (Fin m) k) : Matrix (Fin m) (Fin m) k)) = ⊤)
    (htr : ∀ γ, Matrix.trace ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) =
      Matrix.trace ((ρ₂ γ : GL (Fin m) k) : Matrix (Fin m) (Fin m) k)) :
    n = m := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/absolutely-irreducible-determined-by-trace, part (3):
two absolutely irreducible representations of the same dimension with the same trace function
are conjugate, in every characteristic. (Parts (1), (2): surjectivity of `k[Γ] → ∏ End(Vᵢ)` and
linear independence of the characters of a finite family, are not restated.) -/
theorem conj_of_trace_eq_of_span_eq_top {k Γ : Type*} [Field k] [Group Γ] {n : ℕ}
    (ρ₁ ρ₂ : Γ →* GL (Fin n) k)
    (h₁ : Submodule.span k
      (Set.range fun γ => ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) = ⊤)
    (h₂ : Submodule.span k
      (Set.range fun γ => ((ρ₂ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) = ⊤)
    (htr : ∀ γ, Matrix.trace ((ρ₁ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) =
      Matrix.trace ((ρ₂ γ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k)) :
    ∃ g : GL (Fin n) k, ∀ γ, ρ₂ γ = g * ρ₁ γ * g⁻¹ := by
  sorry

/-! ### Extension of a simple module to the algebraic closure of a perfect field (Schur index) (ArithmeticGaloisRepresentations:R01.5/simple-modules-over-the-algebraic-closure) -/

/- ArithmeticGaloisRepresentations:R01.5/simple-modules-over-the-algebraic-closure. Not stated in
Lean: the statement decomposes `W ⊗_k k̄` over the `k`-embeddings `τ` of the centre `Z` of the
image algebra and compares each constituent with `imageAlgebra`, which needs base change of
representations along `k → k̄` for `MonoidAlgebra` modules together with the Wedderburn
presentation of the image algebra (Tau Ceti SemisimpleAlgebras layer 2).

Statement. Let `k` be a perfect field, `k̄` an algebraic closure, `Γ` a group and `W` a simple
`k[Γ]`-module of finite dimension. Let `B ⊂ End_k(W)` be the image of `k[Γ]`, `Z` its centre,
`B ≅ M_a(Δ)` with `Δ` a division algebra of degree `s` over `Z`, and `m = a·s`. Then
(1) `W ⊗_k k̄ ≅ ⊕_τ ρ_τ^{⊕ s}` over the `k`-embeddings `τ : Z → k̄`, with `ρ_τ : Γ → GL_m(k̄)`
irreducible, pairwise non-isomorphic and permuted transitively by `Gal(k̄/k)`;
`dim_k W = m·s·[Z : k]`;
(2) `traceField ρ_τ = τ(Z)` and `B ≅ imageAlgebra ρ_τ` over `τ`, so `schurIndex ρ_τ = s`;
(3) every irreducible `ρ : Γ → GL_m(k̄)` with `traceField ρ` finite over `k` is `ρ_τ` for a simple
`W`, unique up to isomorphism, and two such `ρ`, `ρ'` give the same `W` iff they are conjugate
under `Gal(k̄/k)`. -/

/-! ### Coefficient descent and its Brauer-class obstruction (ArithmeticGaloisRepresentations:R01.5/descent-obstruction) -/

/-- ArithmeticGaloisRepresentations:R01.5/descent-obstruction, part (3) for absolutely
irreducible `ρ`: over a perfect field `k` with all characteristic polynomials in `(Polynomial k)`, `ρ` is
realizable over `k` iff `β(ρ)` is trivial. (Parts (1), (2), (4), with multiplicities and Schur
indices of the constituents, are not restated; they rest on
R01.5/absolutely-irreducible-determined-by-trace and
R01.5/simple-modules-over-the-algebraic-closure.) -/
theorem realizable_iff_brauerClass_trivial {k K Γ : Type*} [Field k] [PerfectField k] [Field K]
    [Algebra k K] [IsAlgClosed K] [Algebra.IsAlgebraic k K] [Group Γ] {n : ℕ} [NeZero n]
    (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤)
    (hchar : ∀ γ i, (Matrix.charpoly ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)).coeff i ∈
      (algebraMap k K).range) :
    (∃ g : GL (Fin n) K, ∀ γ i j,
        ((g * ρ γ * g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ (algebraMap k K).range) ↔
      brauerClass (k := k) ρ hρ = Quotient.mk (Brauer.CSA_Setoid _)
        (CSA.mk (AlgCat.of (traceField (k := k) ρ) (traceField (k := k) ρ))) := by
  sorry

/-! ### Realizability over the field of characteristic-polynomial coefficients (finite fields) (ArithmeticGaloisRepresentations:R01.5/finite-field-realisability) -/

/-- ArithmeticGaloisRepresentations:R01.5/finite-field-realisability (Deligne–Serre 6.13): a
semisimple `φ : Φ → GL_n(k')`, `k'` finite, is realizable over any subfield `k` containing the
coefficients of all `det(1 - φ(s)T)` (equivalently of all characteristic polynomials). The
continuity and Frobenius refinements are not restated. -/
theorem realizable_of_charpoly_mem {Φ : Type*} [Group Φ] {k' : Type*} [Field k'] [Finite k']
    {n : ℕ} (φ : Φ →* GL (Fin n) k')
    (hss : IsSemisimpleModule (MonoidAlgebra k' Φ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) k' ≃* _).toMonoidHom.comp φ))))
    (k : Subfield k')
    (hk : ∀ s i, (Matrix.charpoly ((φ s : GL (Fin n) k') : Matrix (Fin n) (Fin n) k')).coeff i ∈ k) :
    ∃ g : GL (Fin n) k', ∀ s i j,
      ((g * φ s * g⁻¹ : GL (Fin n) k') : Matrix (Fin n) (Fin n) k') i j ∈ k := by
  sorry

/-! ### Descent from traces and one element with distinct rational eigenvalues (BLGGT Lemma A.1.5) (ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent) -/

/-- ArithmeticGaloisRepresentations:R01.5/rational-eigenvalue-descent: for `M` of characteristic
zero and `r : Γ → GL_n(M̄)` semisimple with all traces in `M` and one `r(γ₀)` with `n` distinct
eigenvalues in `M`, `r` is conjugate to a representation into `GL_n(M)`. (The continuity and
lattice refinement is not restated.) -/
theorem conj_into_of_trace_mem_of_distinct_eigenvalues {Γ : Type*} [Group Γ]
    {M : Type*} [Field M] [CharZero M] {Mbar : Type*} [Field Mbar] [Algebra M Mbar]
    [IsAlgClosure M Mbar] {n : ℕ} (r : Γ →* GL (Fin n) Mbar)
    (hss : IsSemisimpleModule (MonoidAlgebra Mbar Γ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) Mbar ≃* _).toMonoidHom.comp r))))
    (htr : ∀ γ, Matrix.trace ((r γ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) ∈
      (algebraMap M Mbar).range)
    (γ₀ : Γ) (a : Fin n → M) (ha : Function.Injective a)
    (hγ₀ : Matrix.charpoly ((r γ₀ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) =
      ∏ i, (X - C (algebraMap M Mbar (a i)))) :
    ∃ g : GL (Fin n) Mbar, ∀ γ i j,
      ((g * r γ * g⁻¹ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) i j ∈
        (algebraMap M Mbar).range := by
  sorry

/-! ### Chebotarev density for compact images: Frobenius equidistribution in Haar measure (ArithmeticGaloisRepresentations:R01.5/haar-measure-chebotarev) -/

/-- ArithmeticGaloisRepresentations:R01.5/haar-measure-chebotarev, part (a) in qualitative form:
for `ρ : G_K → G` continuous and surjective onto a profinite `G` with Haar probability measure
`μ` (Tau Ceti's `TauCeti.haarProb G`, the unique Haar measure of mass one; Mathlib's
`Measure.haar` is not normalised to mass one), and an open and closed conjugation-stable
`C ⊂ G` with `μ(C) > 0`, infinitely many places
`v` have a Frobenius `Frob_w` (`w ∣ v`) with `ρ(Frob_w) ∈ C`. The Dirichlet density `μ(C)` is
`hasDirichletDensity_frobenius_mem_of_isClopen` below, and the density-zero case of (b) is
`hasDirichletDensity_zero_of_haar_null`. Not stated: the natural-density clause of (a) (natural
density of sets of places is Tau Ceti's, not Mathlib's), the upper-density bound of (b) for
`μ(C) > 0`, and parts (c)–(e). -/
theorem infinite_frobenius_mem_of_haar_pos {K : Type*} [Field K] [NumberField K]
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (ρ : Field.absoluteGaloisGroup K →ₜ* G) (hρ : Function.Surjective ρ)
    (C : Set G) (hCo : IsOpen C) (hCc : IsClosed C) (hconj : ∀ g h, g ∈ C → h * g * h⁻¹ ∈ C)
    (hμ : 0 < μ C) :
    {P : Ideal (𝓞 K) | P.IsMaximal ∧
      ∃ (σ : Field.absoluteGaloisGroup K)
        (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))),
        Q.IsMaximal ∧ Q.under (𝓞 K) = P ∧ IsArithFrobAtIntegralPrime σ Q ∧ ρ σ ∈ C}.Infinite := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/haar-measure-chebotarev, part (a), Dirichlet density:
for `ρ : G_K → G` continuous and surjective onto a profinite `G` with Haar probability measure
`μ` and an open and closed conjugation-stable `C ⊂ G`, the places `v` with a Frobenius `Frob_w`
(`w ∣ v`) such that `ρ(Frob_w) ∈ C` have Dirichlet density `μ(C)`
(`NumberField.Set.HasDirichletDensity`). A place is counted when some Frobenius lift at some
place above it is mapped into `C`; `C` is the preimage of a subset of a finite quotient `G/U`,
so this differs from the set `Σ_C` of the node only at the finitely many places ramified in the
corresponding finite extension, and no hypothesis on the ramification of `ρ` is needed. -/
theorem hasDirichletDensity_frobenius_mem_of_isClopen {K : Type*} [Field K] [NumberField K]
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (ρ : Field.absoluteGaloisGroup K →ₜ* G) (hρ : Function.Surjective ρ)
    (C : Set G) (hCo : IsOpen C) (hCc : IsClosed C) (hconj : ∀ g h, g ∈ C → h * g * h⁻¹ ∈ C) :
    NumberField.Set.HasDirichletDensity
      {v : IsDedekindDomain.HeightOneSpectrum (𝓞 K) |
        ∃ (σ : Field.absoluteGaloisGroup K)
          (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))),
          Q.IsMaximal ∧ Q.under (𝓞 K) = v.asIdeal ∧ IsArithFrobAtIntegralPrime σ Q ∧ ρ σ ∈ C}
      (μ C).toReal := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/haar-measure-chebotarev, part (b), the case of a null
set: for `C ⊂ G` closed, conjugation-stable and of Haar measure zero, the places `v` with a
Frobenius `Frob_w` (`w ∣ v`) such that `ρ(Frob_w) ∈ C` have Dirichlet density zero. The bound is
obtained in the finite quotients of `G`, at each of which only finitely many places ramify, so
no hypothesis on the ramification of `ρ` is needed. -/
theorem hasDirichletDensity_zero_of_haar_null {K : Type*} [Field K] [NumberField K]
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure μ]
    (ρ : Field.absoluteGaloisGroup K →ₜ* G) (hρ : Function.Surjective ρ)
    (C : Set G) (hCc : IsClosed C) (hconj : ∀ g h, g ∈ C → h * g * h⁻¹ ∈ C) (hμ : μ C = 0) :
    NumberField.Set.HasDirichletDensity
      {v : IsDedekindDomain.HeightOneSpectrum (𝓞 K) |
        ∃ (σ : Field.absoluteGaloisGroup K)
          (Q : Ideal (integralClosure (𝓞 K) (AlgebraicClosure K))),
          Q.IsMaximal ∧ Q.under (𝓞 K) = v.asIdeal ∧ IsArithFrobAtIntegralPrime σ Q ∧ ρ σ ∈ C} 0 := by
  sorry

/-! ### Haar measure on open subgroups of GL_n(O_E) is the restricted additive Haar measure (ArithmeticGaloisRepresentations:R01.5/haar-measure-on-open-subgroups-of-gl-n) -/

/-- ArithmeticGaloisRepresentations:R01.5/haar-measure-on-open-subgroups-of-gl-n, part (1): on a
compact Hausdorff topological ring `A` (for example `M_n(𝓞_E)`), left and right multiplication
by a unit preserve every additive Haar measure. -/
theorem addHaar_image_unit_mul {A : Type*} [Ring A] [TopologicalSpace A] [IsTopologicalRing A]
    [CompactSpace A] [T2Space A] [MeasurableSpace A] [BorelSpace A]
    (μ : MeasureTheory.Measure A) [μ.IsAddHaarMeasure] (u : Aˣ) (S : Set A) :
    μ ((fun x => (u : A) * x) '' S) = μ S ∧ μ ((fun x => x * (u : A)) '' S) = μ S := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/haar-measure-on-open-subgroups-of-gl-n, part (3): if
`G ≤ Aˣ` is open as a subset of the compact Hausdorff topological ring `A`, a Haar probability
measure `ν` of `G` (it is `TauCeti.haarProb G`) is the restriction of an additive Haar measure
`μ` of `A` divided by `μ(G)`. For `A = M_n(𝓞_E)` this applies to every open subgroup of
`GL_n(𝓞_E)` (part (4), with `μ(GL_n(𝓞_E)) = ∏_{i ≤ n} (1 − q^{-i})` for `μ` of mass one, is not
restated). -/
theorem haar_eq_addHaar_div_of_isOpen {A : Type*} [Ring A] [TopologicalSpace A]
    [IsTopologicalRing A] [CompactSpace A] [T2Space A] [MeasurableSpace A] [BorelSpace A]
    (μ : MeasureTheory.Measure A) [μ.IsAddHaarMeasure]
    (G : Subgroup Aˣ) (hG : IsOpen ((fun g : Aˣ => (g : A)) '' (G : Set Aˣ)))
    [MeasurableSpace G] [BorelSpace G]
    (ν : MeasureTheory.Measure G) [ν.IsHaarMeasure] [MeasureTheory.IsProbabilityMeasure ν]
    (S : Set G) (hS : MeasurableSet S) :
    ν S = μ ((fun g : G => ((g : Aˣ) : A)) '' S) /
      μ ((fun g : Aˣ => (g : A)) '' (G : Set Aˣ)) := by
  sorry

/-! ### Zero sets of nonzero polynomials are null for additive Haar measure (ArithmeticGaloisRepresentations:R01.5/polynomial-zero-sets-are-haar-null) -/

/-- ArithmeticGaloisRepresentations:R01.5/polynomial-zero-sets-are-haar-null: for a compact
Hausdorff second-countable topological ring `A` that is a domain without isolated points (for
example `𝓞_E`), an additive Haar measure `μ` of `A` and a nonzero polynomial `f` in `N`
variables, the zero set of `f` in `A^N` is null for the product measure. Second countability
makes the closed zero set measurable for the product σ-algebra, on which `Measure.pi` and the
Fubini step (`MeasureTheory.Measure.measure_prod_null`) live; without it a closed subset of
`A^N` need not be measurable there. The consequences (a)–(c) for `M_n(𝓞_E)` and for open
subgroups of `GL_n(𝓞_E)` are not restated. For a finite ring the statement is false
(`X^q − X` on `𝔽_q`); the hypothesis that `0` is not isolated excludes it. -/
theorem measure_pi_zeroSet_eq_zero {A : Type*} [CommRing A] [IsDomain A] [TopologicalSpace A]
    [IsTopologicalRing A] [CompactSpace A] [T2Space A] [SecondCountableTopology A]
    [MeasurableSpace A] [BorelSpace A] [(nhdsWithin (0 : A) {0}ᶜ).NeBot]
    (μ : MeasureTheory.Measure A) [μ.IsAddHaarMeasure] {N : ℕ}
    (f : MvPolynomial (Fin N) A) (hf : f ≠ 0) :
    MeasureTheory.Measure.pi (fun _ : Fin N => μ)
      {x : Fin N → A | MvPolynomial.eval x f = 0} = 0 := by
  sorry

/-! ### R-algebra endomorphisms of M_d(R) are inner for a local ring R (ArithmeticGaloisRepresentations:R01.5/matrix-algebra-endomorphisms-are-inner-over-local-rings) -/

/-- ArithmeticGaloisRepresentations:R01.5/matrix-algebra-endomorphisms-are-inner-over-local-rings:
for a commutative local ring `R`, every `R`-algebra endomorphism of `M_d(R)` is conjugation by
an element of `GL_d(R)` (so it is an automorphism). Uniqueness of `g` up to `Rˣ` is not
restated. -/
theorem algHom_matrix_eq_conj_of_isLocalRing {R : Type*} [CommRing R] [IsLocalRing R] {d : ℕ}
    (φ : Matrix (Fin d) (Fin d) R →ₐ[R] Matrix (Fin d) (Fin d) R) :
    ∃ g : GL (Fin d) R, ∀ x : Matrix (Fin d) (Fin d) R,
      φ x = (g : Matrix (Fin d) (Fin d) R) * x *
        ((g⁻¹ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) := by
  sorry

/-! ### Carayol's lemma: recognition, conjugacy and gluing of lifts with absolutely irreducible residual representation (ArithmeticGaloisRepresentations:R01.5/carayol-lifts-recognition) -/

/-- ArithmeticGaloisRepresentations:R01.5/carayol-lifts-recognition, part (a): for `R` complete
Noetherian local with finite residue field and its `m_R`-adic topology, and `r, r' : Γ → GL_d(R)`
continuous with the same absolutely irreducible residual representation and equal
characteristic polynomials on a dense subset, `r' = g r g⁻¹` for some `g ≡ 1 mod m_R`. (The
uniqueness of `g` up to `1 + m_R` in (a), the symplectic form (b) and the gluing (c) are not
restated. The hypothesis `hadic` says that the
topology of `R` is the `m_R`-adic one: the powers of the maximal ideal form a basis of
neighbourhoods of `0` (Mathlib's `IsAdic`, whose module is not imported here). For a
non-Hausdorff ring topology the statement would be false.) -/
theorem carayol_conj_of_charpoly_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Finite (IsLocalRing.ResidueField R)]
    [TopologicalSpace R] [IsTopologicalRing R] (hadic : ∀ s : Set R, s ∈ nhds (0 : R) ↔
      ∃ m : ℕ, ((IsLocalRing.maximalIdeal R ^ m : Ideal R) : Set R) ⊆ s)
    {d : ℕ} (r r' : Γ →* GL (Fin d) R)
    (hr : Continuous fun γ => ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hr' : Continuous fun γ => ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hres : ∀ γ, ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map
        (IsLocalRing.residue R) =
      ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R))
    (habs : Submodule.span (IsLocalRing.ResidueField R) (Set.range fun γ =>
      ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R)) = ⊤)
    (D : Set Γ) (hD : Dense D)
    (hchar : ∀ γ ∈ D, Matrix.charpoly ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) =
      Matrix.charpoly ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R)) :
    ∃ g : GL (Fin d) R,
      ((g : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) = 1) ∧
        ∀ γ, r' γ = g * r γ * g⁻¹ := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.5/carayol-lifts-recognition, part (a) in its trace form:
with the same hypotheses, equality of the traces on a dense subset already gives
`r' = g r g⁻¹` with `g ≡ 1 mod m_R`, in every residue characteristic and for every `d`
(the statement usually attributed to Carayol; it is proved in the node). As above, the
uniqueness of `g` up to `1 + m_R` is not restated. -/
theorem carayol_conj_of_trace_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Finite (IsLocalRing.ResidueField R)]
    [TopologicalSpace R] [IsTopologicalRing R] (hadic : ∀ s : Set R, s ∈ nhds (0 : R) ↔
      ∃ m : ℕ, ((IsLocalRing.maximalIdeal R ^ m : Ideal R) : Set R) ⊆ s)
    {d : ℕ} (r r' : Γ →* GL (Fin d) R)
    (hr : Continuous fun γ => ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hr' : Continuous fun γ => ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hres : ∀ γ, ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map
        (IsLocalRing.residue R) =
      ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R))
    (habs : Submodule.span (IsLocalRing.ResidueField R) (Set.range fun γ =>
      ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R)) = ⊤)
    (D : Set Γ) (hD : Dense D)
    (htr : ∀ γ ∈ D, Matrix.trace ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) =
      Matrix.trace ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R)) :
    ∃ g : GL (Fin d) R,
      ((g : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) = 1) ∧
        ∀ γ, r' γ = g * r γ * g⁻¹ := by
  sorry

/-! ### Semisimplicity criteria from Frobenius annihilation for GSp4-valued ρ (BCGP25 §4.11) (ArithmeticGaloisRepresentations:R01.5/gsp4-semisimplicity-criteria) -/

/-- ArithmeticGaloisRepresentations:R01.5/gsp4-semisimplicity-criteria, the common first step:
if `char_ρ(Frob)(s(Frob)) = 0` at Frobenius elements above a set of primes of Dirichlet density
one, then `char_ρ(g)(s(g)) = 0` for every `g ∈ G_ℚ` (Chebotarev and continuity). The conclusions
`s ≅ ρ^{⊕m}` of (a) and (b) need Zariski closures of the image (`Sp_4`, `SL_2 × SL_2`), which
are not in Mathlib, and are not stated; the symplectic structure of `ρ` is also omitted. The
coefficient field is Hausdorff (for the indiscrete topology the statement would be false). -/
theorem aeval_charpoly_eq_zero_of_frobenius {E : Type*} [Field E] [TopologicalSpace E]
    [IsTopologicalRing E] [T2Space E] {n : ℕ}
    (ρ : Field.absoluteGaloisGroup ℚ →* GL (Fin 4) E)
    (s : Field.absoluteGaloisGroup ℚ →* GL (Fin n) E)
    (hρ : Continuous fun g => ((ρ g : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E))
    (hs : Continuous fun g => ((s g : GL (Fin n) E) : Matrix (Fin n) (Fin n) E))
    (Pl : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ)))
    (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (hann : ∀ (σ : Field.absoluteGaloisGroup ℚ)
      (Q : Ideal (integralClosure (𝓞 ℚ) (AlgebraicClosure ℚ))), Q.IsMaximal →
        (∃ v ∈ Pl, Q.under (𝓞 ℚ) = v.asIdeal) → IsArithFrobAtIntegralPrime σ Q →
        aeval ((s σ : GL (Fin n) E) : Matrix (Fin n) (Fin n) E)
          (Matrix.charpoly ((ρ σ : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E)) = 0) :
    ∀ g : Field.absoluteGaloisGroup ℚ,
      aeval ((s g : GL (Fin n) E) : Matrix (Fin n) (Fin n) E)
        (Matrix.charpoly ((ρ g : GL (Fin 4) E) : Matrix (Fin 4) (Fin 4) E)) = 0 := by
  sorry

/-! ### Potentially abelian representations are induced from a character orbit (Clifford part of BCGP25 Lemma 10.2.3) (ArithmeticGaloisRepresentations:R01.5/potentially-abelian-representations) -/

/-- ArithmeticGaloisRepresentations:R01.5/potentially-abelian-representations, part (1): for `ρ`
irreducible over an algebraically closed `E` of characteristic zero and `L/F` finite Galois with
`ρ(G_L)` abelian, `ρ|_{G_L} ≅ ⊕_{i=1}^{b} χᵢ^{⊕a}` with `ab = n` and the `χᵢ` pairwise distinct
(each `χᵢ`-isotypic part has dimension `a` and they span). Parts (2)–(4) (transitivity of the
`Gal(L/F)`-action and the induced description) are not restated. -/
theorem restrict_eq_sum_isotypic {F : Type*} [Field F] {E : Type*} [Field E] [IsAlgClosed E]
    [CharZero E] [TopologicalSpace E]
    {V : Type*} [AddCommGroup V] [Module E V] [Module.Finite E V] [Module.Projective E V]
    [TopologicalSpace V] [IsModuleTopology E V]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) E V)
    (hirr : ρ.toRepresentation.IsIrreducible)
    (L : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F L] [IsGalois F L]
    (hab : ∀ g ∈ (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
      ∀ h ∈ (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)), ρ g * ρ h = ρ h * ρ g) :
    ∃ (a b : ℕ) (χ : Fin b → (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)) →* Eˣ),
      Function.Injective χ ∧ a * b = Module.finrank E V ∧
      (∀ i, Module.finrank E
        (⨅ h : (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
          LinearMap.ker (ρ h.1 - ((χ i h : Eˣ) : E) • LinearMap.id) : Submodule E V) = a) ∧
      (⨆ i, ⨅ h : (L.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)),
          LinearMap.ker (ρ h.1 - ((χ i h : Eˣ) : E) • LinearMap.id) : Submodule E V) = ⊤ := by
  sorry

section CurveRecognition

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

/-! ### Recognition of lisse sheaves on a curve over a finite field from a dense open subset (ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset) -/

/-- ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset. The fundamental
group `π₁(C)` of a curve and its Frobenius classes at closed points are not available in
Mathlib: `π` stands for `π₁(C, c̄)` and `frob x` for a Frobenius at the closed point `x ∈ |U|`;
the hypothesis `hdense` is the Chebotarev density theorem for the curve (the conjugates of the
Frobenius elements at closed points of the dense open `U` are dense in `π₁(C)`; the roadmap
takes it from FunctionFieldArithmetic FA.5 and the surjectivity of `π₁(U) → π₁(C)`). Equal
Frobenius characteristic polynomials on `|U|` give isomorphic semisimplifications. The
coefficient field is a Hausdorff topological field. -/
theorem curve_semisimplification_iso {π : Type*} [Group π] [TopologicalSpace π]
    [IsTopologicalGroup π] [CompactSpace π] [TotallyDisconnectedSpace π]
    {E : Type*} [Field E] [CharZero E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    {V₁ : Type*} [AddCommGroup V₁] [Module E V₁] [Module.Finite E V₁] [Module.Projective E V₁]
    [TopologicalSpace V₁] [IsModuleTopology E V₁]
    {V₂ : Type*} [AddCommGroup V₂] [Module E V₂] [Module.Finite E V₂] [Module.Projective E V₂]
    [TopologicalSpace V₂] [IsModuleTopology E V₂]
    (ρ₁ : ContinuousRep π E V₁) (ρ₂ : ContinuousRep π E V₂) {U : Type*} (frob : U → π)
    (hdense : Dense {g : π | ∃ x : U, ∃ h : π, g = h * frob x * h⁻¹})
    (hchar : ∀ x : U, ρ₁.charpoly (frob x) = ρ₂.charpoly (frob x)) :
    Nonempty (ContinuousRep.Iso ρ₁.semisimplification.rep ρ₂.semisimplification.rep) := by
  sorry

end CurveRecognition

end GaloisRep

end TauCeti


/-! # The declarations of layer R01.6 -/
/-! # R01.6: Tate modules of abelian varieties

Mathlib has no abelian varieties. This section works with an honest minimal stand-in,
`TauCeti.AlgebraicGeometry.AbelianVariety`, which records exactly the data the statements below
use: the group of geometric points with its Galois action, the dimension, and the structure of
the torsion subgroups. Here the types that depend on the geometry (`Hom`, `dual`, `Polarization`,
`baseChange`, `GoodReductionModel`, ...) are opaque data (`sorry`), and no condition that needs
the geometry is stated. Elliptic curves use Mathlib's `WeierstrassCurve` and
`WeierstrassCurve.localPolynomial`.

What replaces the stand-in in the roadmap:

* already in the pinned Tau Ceti (`TauCeti/AlgebraicGeometry/AbelianVariety/`): the structure
  `TauCeti.AlgebraicGeometry.AbelianVariety` (a proper geometrically integral group scheme over
  `Spec K`: fields `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`) and `AbelianVariety.dim`
  replace the structure and `dim` below; the morphisms `A ⟶ B` of its category with
  `AbelianVariety.End`, `End.toHom` and `AbelianVariety.mulBy` replace `Hom`, `End`, `End.toHom`;
  `AbelianVariety.baseChange`, `Hom.baseChange`, `AbelianVariety.prod`, `AbelianVariety.trivial`
  and `AbelianVariety.IsIsogeny` replace `baseChange`, `prod`, `zero` and `Hom.IsIsogeny`;
* not yet in Tau Ceti, supplied by other layers: the group `A(K̄)` of geometric points with its
  Galois action and the torsion counts (fields `Points`, `isOpen_stabilizer`, `divisible`,
  `finite_torsion`, `card_torsion`: AbelianSchemesAndArithmeticModuli A3); `Hom.degree` (A3);
  `dual`, `Hom.dual`, `Polarization` (Tau Ceti JacobianChallenge layer E); `GoodReductionModel`
  (NeronModelsAndSemistableAbelianVarieties R11.1, abelian-scheme-model); `qFrobenius` (recorded as
  a gap of the packet); `ofWeierstrass` (AbelianSchemesAndArithmeticModuli A1);
* `G_K` is Mathlib's `Field.absoluteGaloisGroup K`; its identification with `Gal(K^sep/K)` is Tau
  Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`. -/

namespace TauCeti

universe u

namespace AlgebraicGeometry

open Polynomial IsDedekindDomain NumberField ValuativeRel

/-! ## The stand-in carrier -/

/-- Stand-in for an abelian variety of dimension `g` over a field `K`, replaced in the roadmap by
Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety` (a proper geometrically integral group scheme
over `Spec K`) with `AbelianVariety.dim`; the fields below are theorems about that object (points
and torsion counts: AbelianSchemesAndArithmeticModuli A3), not extra data. The stand-in is: the group
`A(K̄)` of geometric points (`K̄ = AlgebraicClosure K`), with the coordinatewise action of
`G_K = Field.absoluteGaloisGroup K`, such that each point has an open stabiliser, `A(K̄)` is
divisible, `A[N](K̄)` is finite for `N ≠ 0`, and `#A[N](K̄) = N^{2g}` for `N` invertible in `K`. -/
structure AbelianVariety (K : Type u) [Field K] where
  /-- The group `A(K̄)` of geometric points. -/
  Points : Type u
  [instAddCommGroup : AddCommGroup Points]
  /-- The coordinatewise action of `G_K` on geometric points. -/
  [instGaloisAction : DistribMulAction (Field.absoluteGaloisGroup K) Points]
  /-- The dimension `g`. -/
  dim : ℕ
  /-- Every geometric point is defined over a finite extension of `K`. -/
  isOpen_stabilizer : ∀ x : Points, IsOpen {σ : Field.absoluteGaloisGroup K | σ • x = x}
  /-- `[N] : A → A` is surjective on geometric points for `N ≠ 0`. -/
  divisible : ∀ (N : ℕ) (x : Points), N ≠ 0 → ∃ y : Points, N • y = x
  /-- `A[N](K̄)` is finite for `N ≠ 0`. -/
  finite_torsion : ∀ N : ℕ, N ≠ 0 → Finite (AddSubgroup.torsionBy Points (N : ℤ))
  /-- `#A[N](K̄) = N^{2g}` for `N` invertible in `K`. -/
  card_torsion : ∀ N : ℕ, (N : K) ≠ 0 →
    Nat.card (AddSubgroup.torsionBy Points (N : ℤ)) = N ^ (2 * dim)

namespace AbelianVariety

attribute [instance] instAddCommGroup instGaloisAction

attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
  ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
  ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology

/-- `5` is prime (used by the unit tests). -/
instance fact_prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Every element of `Nat.Primes` is prime (used for adelic products over all primes). -/
instance instFactPrimes (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.2⟩

/-! ### The `ℓ`-adic Tate module of an abelian group -/

/-- The `ℓ`-adic Tate module `lim_n G[ℓ^n]` (transition maps `[ℓ]`) of an abelian group `G`: the
compatible systems `(x_n)` with `ℓ^n x_n = 0` and `ℓ x_{n+1} = x_n`. -/
def ellAdicTateModule (G : Type*) [AddCommGroup G] (ℓ : ℕ) : AddSubgroup (ℕ → G) where
  carrier := {x | ∀ n, ℓ ^ n • x n = 0 ∧ ℓ • x (n + 1) = x n}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

namespace ellAdicTateModule

variable (G : Type*) [AddCommGroup G] (ℓ : ℕ)

/-- `ℤ_ℓ` acts by `a • (x_n) = ((a mod ℓ^n) • x_n)_n`. -/
instance instModule [Fact ℓ.Prime] : Module ℤ_[ℓ] (ellAdicTateModule G ℓ) := sorry

/-- The inverse-limit topology of the discrete groups `G[ℓ^n]`. -/
instance instTopologicalSpace : TopologicalSpace (ellAdicTateModule G ℓ) :=
  TopologicalSpace.induced (fun x => (x : ℕ → G)) (@Pi.topologicalSpace ℕ (fun _ => G) fun _ => ⊥)

end ellAdicTateModule

/-- The Tate twist `ℤ_ℓ(1) = lim_n μ_{ℓ^n}(K̄)`, written additively; `G_K` acts on it through
`χ_ℓ`. Stand-in for R01.1's `ContinuousRep.TateTwist.zlOne` (another section). -/
abbrev tateTwistOne (K : Type u) [Field K] (ℓ : ℕ) :
    AddSubgroup (ℕ → Additive (AlgebraicClosure K)ˣ) :=
  ellAdicTateModule (Additive (AlgebraicClosure K)ˣ) ℓ

variable {K : Type u} [Field K]

/-! ### Opaque geometric data supplied by Tau Ceti -/

/-- Homomorphisms `A → B` of abelian varieties over `K` (Tau Ceti: homomorphisms of group schemes
over `K`); opaque in this stand-in. -/
def Hom (A B : AbelianVariety K) : Type u := sorry

instance (A B : AbelianVariety K) : AddCommGroup (Hom A B) := sorry

/-- The effect of a homomorphism on geometric points (Galois-equivariant, see `Hom.map_smul`). -/
def Hom.toPointsHom {A B : AbelianVariety K} : Hom A B →+ (A.Points →+ B.Points) := sorry

theorem Hom.map_smul {A B : AbelianVariety K} (α : Hom A B) (σ : Field.absoluteGaloisGroup K)
    (x : A.Points) : α.toPointsHom (σ • x) = σ • α.toPointsHom x := by
  sorry

/-- The identity homomorphism. -/
def Hom.id (A : AbelianVariety K) : Hom A A := sorry

/-- Composition of homomorphisms. -/
def Hom.comp {A B C : AbelianVariety K} (β : Hom B C) (α : Hom A B) : Hom A C := sorry

/-- The degree of a homomorphism: the rank of the finite group scheme `ker α` (`0` if `α` is not
an isogeny). -/
def Hom.degree {A B : AbelianVariety K} (α : Hom A B) : ℕ := sorry

/-- An isogeny: surjective with finite kernel (on geometric points, equivalently as a morphism of
abelian varieties). -/
def Hom.IsIsogeny {A B : AbelianVariety K} (α : Hom A B) : Prop :=
  Function.Surjective α.toPointsHom ∧ Finite α.toPointsHom.ker

/-- The endomorphism ring `End_K(A)`. -/
def End (A : AbelianVariety K) : Type u := Hom A A

instance (A : AbelianVariety K) : Ring (End A) := sorry

/-- An endomorphism as a homomorphism. -/
def End.toHom {A : AbelianVariety K} (α : End A) : Hom A A := α

/-- The endomorphism algebra `End⁰_K(A) = End_K(A) ⊗ ℚ`. -/
abbrev End0 (A : AbelianVariety K) : Type u := ℚ ⊗[ℤ] End A

/-- The dual abelian variety `A^∨` (Tau Ceti JacobianChallenge E / AbelianSchemes A2). -/
def dual (A : AbelianVariety K) : AbelianVariety K := sorry

/-- The dual homomorphism `α^∨ : B^∨ → A^∨`. -/
def Hom.dual {A B : AbelianVariety K} (α : Hom A B) : Hom B.dual A.dual := sorry

/-- Polarizations of `A` (isogenies `A → A^∨` of the form `φ_L` for an ample `L`); opaque. -/
def Polarization (A : AbelianVariety K) : Type u := sorry

/-- The isogeny `λ : A → A^∨` underlying a polarization. -/
def Polarization.toHom {A : AbelianVariety K} (μ : Polarization A) : Hom A A.dual := sorry

/-- Base change `A_L` along a field extension `L/K` (Tau Ceti `AbelianVariety.baseChange`). -/
def baseChange (A : AbelianVariety K) (L : Type u) [Field L] [Algebra K L] :
    AbelianVariety L := sorry

/-- The base change of a polarization. -/
def Polarization.baseChange {A : AbelianVariety K} (μ : Polarization A) (L : Type u) [Field L]
    [Algebra K L] : Polarization (A.baseChange L) := sorry

/-- The product `A × B` (Tau Ceti `AbelianVariety.prod`). -/
def prod (A B : AbelianVariety K) : AbelianVariety K where
  Points := A.Points × B.Points
  dim := A.dim + B.dim
  isOpen_stabilizer := sorry
  divisible := sorry
  finite_torsion := sorry
  card_torsion := sorry

/-- The product polarization `λ × μ`. -/
def Polarization.prod {A B : AbelianVariety K} (μ : Polarization A) (ν : Polarization B) :
    Polarization (A.prod B) := sorry

variable (K) in
/-- The zero abelian variety `Spec K` (`g = 0`). -/
def zero : AbelianVariety K where
  Points := PUnit
  dim := 0
  isOpen_stabilizer := sorry
  divisible := sorry
  finite_torsion := sorry
  card_torsion := sorry

/-- The `q`-power Frobenius endomorphism `π` of an abelian variety over a finite field
`k = 𝔽_q` (raising coordinates to the `q`-th power). Opaque: for `g > 1` no library or roadmap
node upstream of R01.6 defines it (a gap of the packet); for elliptic curves it is Tau Ceti's
`TauCeti.Isogeny.frobeniusIsogeny`. -/
def qFrobenius {k : Type u} [Field k] [Finite k] (B : AbelianVariety k) : Hom B B := sorry

/-! ### Elliptic curves -/

/-- The abelian variety `E_W` of dimension one defined by an elliptic Weierstrass curve: the
points are `(W⁄K̄).Point` and `σ ∈ G_K` acts by `WeierstrassCurve.Affine.Point.map σ`. In the
roadmap this identification is supplied by AbelianSchemesAndArithmeticModuli A1 (one-dimensional
abelian schemes are the elliptic curves, through the Weierstrass presentation). -/
def ofWeierstrass (W : WeierstrassCurve K) [W.IsElliptic] : AbelianVariety K := by
  classical
  exact
    { Points := (W.baseChange (AlgebraicClosure K)).toAffine.Point
      instGaloisAction :=
        { smul := fun σ P =>
            WeierstrassCurve.Affine.Point.map (W' := W.toAffine) (S := K)
              (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K).toAlgHom P
          one_smul := sorry
          mul_smul := sorry
          smul_zero := sorry
          smul_add := sorry }
      dim := 1
      isOpen_stabilizer := sorry
      divisible := sorry
      finite_torsion := sorry
      card_torsion := sorry }

/-- The canonical principal polarization `φ_{𝒪(O)} : P ↦ t_P^*𝒪(O) ⊗ 𝒪(O)⁻¹ = [(O) − (P)]` of an
elliptic curve (the opposite of the Abel–Jacobi identification `P ↦ [(P) − (O)]`, which is not a
polarization). -/
def canonicalPolarization (W : WeierstrassCurve K) [W.IsElliptic] :
    Polarization (ofWeierstrass W) := sorry

variable (K) in
/-- The Weierstrass curve `y² = x³ − x` (conductor `32`, CM by `ℤ[i]`). -/
def cmCurve : WeierstrassCurve K := ⟨0, 0, 0, -1, 0⟩

variable (K) in
/-- The Weierstrass curve `y² = x³ + 1` (supersingular at `p ≡ 2 mod 3`). -/
def curveX3Plus1 : WeierstrassCurve K := ⟨0, 0, 0, 0, 1⟩

/-- `Δ(y² = x³ − x) = 64`. -/
instance [CharZero K] : (cmCurve K).IsElliptic := sorry

/-- `Δ(y² = x³ − x) = 64 ≠ 0` in `𝔽_5`. -/
instance : (cmCurve (ZMod 5)).IsElliptic := sorry

/-- `Δ(y² = x³ + 1) = −432 ≠ 0` in characteristic `5`. -/
instance : (curveX3Plus1 (ZMod 5)).IsElliptic := sorry

/-- `Δ(y² = x³ + 1) = −432 ≠ 0` in characteristic `5`. -/
instance : (curveX3Plus1 (AlgebraicClosure (ZMod 5))).IsElliptic := sorry

/-! ### The ℓ-adic Tate module of an abelian variety as a continuous Galois representation (ArithmeticGaloisRepresentations:R01.6/tate-module-of-an-abelian-variety) -/

/-- `A[N](K^sep) = A[N](K̄)`, the `N`-torsion of the geometric points; for `N` invertible in `K` a
finite free `ℤ/N`-module of rank `2g` with its `G_K`-action. -/
abbrev torsionPoints (A : AbelianVariety K) (N : ℕ) : AddSubgroup A.Points :=
  AddSubgroup.torsionBy A.Points (N : ℤ)

instance (A : AbelianVariety K) (N : ℕ) : Module (ZMod N) (A.torsionPoints N) :=
  AddSubgroup.torsionBy.zmodModule

/-- The pointwise Galois action on `A[N](K̄)`. -/
instance (A : AbelianVariety K) (N : ℕ) :
    DistribMulAction (Field.absoluteGaloisGroup K) (A.torsionPoints N) where
  smul σ x := ⟨σ • (x : A.Points), sorry⟩
  one_smul := sorry
  mul_smul := sorry
  smul_zero := sorry
  smul_add := sorry

/-- For `N` invertible in `K`, `A[N](K^sep)` has `N^{2g}` elements and is (noncanonically)
isomorphic to `(ℤ/N)^{2g}`; `[N] : A[MN](K^sep) → A[M](K^sep)` is surjective. -/
theorem torsionPoints_card (A : AbelianVariety K) (N : ℕ) (hN : (N : K) ≠ 0) :
    Nat.card (A.torsionPoints N) = N ^ (2 * A.dim) ∧
      Nonempty (A.torsionPoints N ≃+ (Fin (2 * A.dim) → ZMod N)) ∧
      ∀ (M : ℕ) (x : A.torsionPoints M),
        ∃ y : A.torsionPoints (M * N), N • (y : A.Points) = (x : A.Points) := by
  sorry

/-- `T_ℓA := lim_n A[ℓ^n](K^sep)` along `[ℓ]`, a `ℤ_ℓ`-module with the inverse-limit topology.
Defined for every prime `ℓ`; the roadmap uses it for `ℓ ≠ char K` (see `tateModule_free` and the
test `tateModule_char_p_excluded`). -/
abbrev tateModule (A : AbelianVariety K) (ℓ : ℕ) : AddSubgroup (ℕ → A.Points) :=
  ellAdicTateModule A.Points ℓ

section TateInstances

variable (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]

/-- `T_ℓA` is free over `ℤ_ℓ` (from finiteness of `A[ℓ]` and divisibility). -/
instance : Module.Free ℤ_[ℓ] (A.tateModule ℓ) := sorry

/-- `T_ℓA` is finitely generated over `ℤ_ℓ`. -/
instance : Module.Finite ℤ_[ℓ] (A.tateModule ℓ) := sorry

/-- The inverse-limit topology on `T_ℓA` is the `ℓ`-adic topology and is the module topology. -/
instance tateModule_isModuleTopology : IsModuleTopology ℤ_[ℓ] (A.tateModule ℓ) := sorry

end TateInstances

namespace tateModule

/-- The projection `T_ℓA → A[ℓ^n](K^sep)`, `x ↦ x_n` (`G_K`-equivariant; `ℤ_ℓ` acts on the
target through `ℤ/ℓ^n`). -/
def toTorsion (A : AbelianVariety K) (ℓ n : ℕ) :
    A.tateModule ℓ →+ A.torsionPoints (ℓ ^ n) where
  toFun x := ⟨(x : ℕ → A.Points) n, sorry⟩
  map_zero' := sorry
  map_add' := sorry

end tateModule

/-- `T_ℓA` is free of rank `2g` over `ℤ_ℓ` for `ℓ ≠ char K`. -/
theorem tateModule_free (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    Module.Free ℤ_[ℓ] (A.tateModule ℓ) ∧ Module.finrank ℤ_[ℓ] (A.tateModule ℓ) = 2 * A.dim := by
  sorry

namespace tateModule

/-- `T_ℓA / ℓ^n T_ℓA ≃ A[ℓ^n](K^sep)`, induced by `tateModule.toTorsion` (`G_K`-equivariant, see
the test `tateModule_mod_pow_equiv_galois`). -/
def modPowEquiv (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ) :
    (A.tateModule ℓ ⧸ (Ideal.span {(ℓ : ℤ_[ℓ]) ^ n} • ⊤ : Submodule ℤ_[ℓ] (A.tateModule ℓ))) ≃+
      A.torsionPoints (ℓ ^ n) := sorry

/-- Two elements of `T_ℓA` are equal iff their images in every `A[ℓ^n](K^sep)` agree. -/
theorem ext {A : AbelianVariety K} {ℓ : ℕ} {x y : A.tateModule ℓ}
    (h : ∀ n, tateModule.toTorsion A ℓ n x = tateModule.toTorsion A ℓ n y) : x = y := by
  sorry

end tateModule

/-- `ρ_{A,ℓ}`: `(T_ℓA, σ ↦ ((σ x_n))_n)` as a continuous representation of `G_K` over `ℤ_ℓ`; its
Mathlib `ContRepresentation` is obtained by forgetting joint continuity. -/
def tateModuleRep (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup K) ℤ_[ℓ] (A.tateModule ℓ) where
  toRepresentation :=
    { toFun := fun σ =>
        { toFun := fun x => ⟨fun n => σ • (x : ℕ → A.Points) n, sorry⟩
          map_add' := sorry
          map_smul' := sorry }
      map_one' := sorry
      map_mul' := sorry }
  continuous_action := sorry

section Rational

variable (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]

/-- The module topology on `V_ℓA = ℚ_ℓ ⊗_{ℤ_ℓ} T_ℓA`. -/
instance : TopologicalSpace (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) := moduleTopology ℚ_[ℓ] _

instance : IsModuleTopology ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) := ⟨rfl⟩

end Rational

/-- `V_ℓA := ℚ_ℓ ⊗_{ℤ_ℓ} T_ℓA`, the coefficient extension of `tateModuleRep` to `ℚ_ℓ`. -/
def rationalTateModule (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup K) ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) where
  toRepresentation :=
    { toFun := fun σ => LinearMap.baseChange ℚ_[ℓ] (A.tateModuleRep ℓ σ)
      map_one' := sorry
      map_mul' := sorry }
  continuous_action := sorry

namespace tateModule

/-- `T_ℓα : T_ℓA → T_ℓB`, `(x_n) ↦ (α(x_n))`, for a homomorphism `α : A → B`. -/
def map {A B : AbelianVariety K} (α : Hom A B) (ℓ : ℕ) [Fact ℓ.Prime] :
    A.tateModule ℓ →ₗ[ℤ_[ℓ]] B.tateModule ℓ where
  toFun x := ⟨fun n => α.toPointsHom ((x : ℕ → A.Points) n), sorry⟩
  map_add' := sorry
  map_smul' := sorry

/-- `T_ℓ(id) = id`. -/
theorem map_id (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    tateModule.map (Hom.id A) ℓ = LinearMap.id := by
  sorry

/-- `T_ℓ(βα) = T_ℓβ ∘ T_ℓα`. -/
theorem map_comp {A B C : AbelianVariety K} (β : Hom B C) (α : Hom A B) (ℓ : ℕ)
    [Fact ℓ.Prime] : tateModule.map (β.comp α) ℓ = tateModule.map β ℓ ∘ₗ tateModule.map α ℓ := by
  sorry

/-- `T_ℓ(α + α′) = T_ℓα + T_ℓα′`. -/
theorem map_add {A B : AbelianVariety K} (α α' : Hom A B) (ℓ : ℕ) [Fact ℓ.Prime] :
    tateModule.map (α + α') ℓ = tateModule.map α ℓ + tateModule.map α' ℓ := by
  sorry

/-- For a field extension `L/K` and a `K`-embedding `K̄ → L̄` of algebraic closures (not only for
`L ⊆ K̄`: completions `F → F_v` are covered), `T_ℓ(A_L) ≅ T_ℓA` and `ρ_{A_L,ℓ}` is the
restriction of `ρ_{A,ℓ}` along `G_L → G_K`. -/
theorem baseChange (A : AbelianVariety K) (L : Type u) [Field L] [Algebra K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ e : (A.baseChange L).tateModule ℓ ≃ₗ[ℤ_[ℓ]] A.tateModule ℓ,
      ∀ (σ : Field.absoluteGaloisGroup L) (x : (A.baseChange L).tateModule ℓ),
        e ((A.baseChange L).tateModuleRep ℓ σ x) =
          A.tateModuleRep ℓ (GaloisRep.localEmbeddingMap K L σ) (e x) := by
  sorry

end tateModule

/-- The kernel of `G_K → Aut(A[N](K^sep))`, i.e. `G_{K(A[N])}`. -/
def torsionKernel (A : AbelianVariety K) (N : ℕ) : Subgroup (Field.absoluteGaloisGroup K) where
  carrier := {σ | ∀ x : A.torsionPoints N, σ • x = x}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

namespace tateModule

/-- `ker(ρ_{A,ℓ} mod ℓ^n)` is the kernel `G_{K(A[ℓ^n])}` of the action on `A[ℓ^n](K^sep)`, an open
normal subgroup of finite index. (The description as the fixer of the field generated by the
coordinates of the torsion points needs the coordinates, absent from the stand-in.) -/
theorem kernel_mod_pow (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ) :
    (∀ σ, σ ∈ A.torsionKernel (ℓ ^ n) ↔ ∀ x : A.tateModule ℓ,
        A.tateModuleRep ℓ σ x - x ∈
          (Ideal.span {(ℓ : ℤ_[ℓ]) ^ n} • ⊤ : Submodule ℤ_[ℓ] (A.tateModule ℓ))) ∧
      IsOpen (A.torsionKernel (ℓ ^ n) : Set (Field.absoluteGaloisGroup K)) ∧
      (A.torsionKernel (ℓ ^ n)).Normal ∧ (A.torsionKernel (ℓ ^ n)).FiniteIndex := by
  sorry

end tateModule

/-- `T̂A := lim_N A[N](K^sep)` over `N` invertible in `K`: compatible systems `(x_N)` with
`N x_N = 0` and `(N/M) x_N = x_M` for `M ∣ N`; canonically `∏_{ℓ ≠ char K} T_ℓA`
(`adelicTateModule.equivPi`), with the product action of `G_K`. -/
def adelicTateModule (A : AbelianVariety K) :
    AddSubgroup ({N : ℕ // (N : K) ≠ 0} → A.Points) where
  carrier := {x | (∀ N : {N : ℕ // (N : K) ≠ 0}, (N : ℕ) • x N = 0) ∧
    ∀ N M : {N : ℕ // (N : K) ≠ 0}, (M : ℕ) ∣ N → ((N : ℕ) / M) • x N = x M}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

namespace adelicTateModule

/-- `T̂A ≅ ∏_{ℓ ≠ char K} T_ℓA`. -/
def equivPi (A : AbelianVariety K) :
    A.adelicTateModule ≃+ ((ℓ : {ℓ : ℕ // ℓ.Prime ∧ (ℓ : K) ≠ 0}) → A.tateModule ℓ) := sorry

end adelicTateModule

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_rank_eq. -/
example : Module.finrank ℤ_[5] ((ofWeierstrass (cmCurve ℚ)).tateModule 5) = 2 ∧
    Nat.card ((ofWeierstrass (cmCurve ℚ)).tateModule 5 ⧸
      (Ideal.span {(5 : ℤ_[5])} • ⊤ : Submodule ℤ_[5] ((ofWeierstrass (cmCurve ℚ)).tateModule 5)))
      = 25 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_of_dim_zero. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    Subsingleton ((zero K).tateModule ℓ) ∧
      ∀ σ, (zero K).tateModuleRep ℓ σ = LinearMap.id := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_ne_limit_rational_torsion.
The limit of the `ℓ^n`-torsion of the rational points is the set of `G_ℚ`-fixed elements of `T_ℓE`,
which is `0`, while `T_ℓE` has rank `2`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    (∀ x : (ofWeierstrass (cmCurve ℚ)).tateModule ℓ,
        (∀ σ, (ofWeierstrass (cmCurve ℚ)).tateModuleRep ℓ σ x = x) → x = 0) ∧
      Module.finrank ℤ_[ℓ] ((ofWeierstrass (cmCurve ℚ)).tateModule ℓ) = 2 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_char_p_excluded.
For the supersingular curve `y² = x³ + 1` over `F̄_5`, `E[5^n](F̄_5) = 0`, so the limit at
`ℓ = 5 = char K` is `0`, not of rank `2g = 2`. -/
example :
    (ofWeierstrass (curveX3Plus1 (AlgebraicClosure (ZMod 5)))).torsionPoints 5 = ⊥ ∧
      Subsingleton ((ofWeierstrass (curveX3Plus1 (AlgebraicClosure (ZMod 5)))).tateModule 5) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.tateModule_mod_pow_equiv_galois. -/
example (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ)
    (σ : Field.absoluteGaloisGroup K) (x : A.tateModule ℓ) :
    tateModule.modPowEquiv A ℓ n (Submodule.Quotient.mk (A.tateModuleRep ℓ σ x)) =
      σ • tateModule.modPowEquiv A ℓ n (Submodule.Quotient.mk x) := by
  sorry

/-! ### Finite torsion, the residual representation and rational cyclic isogenies (ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation) -/

/-- ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation, (a) and (c): the
residual representation `T_ℓA/ℓT_ℓA` is `A[ℓ](K^sep)` (`tateModule.modPowEquiv`, `n = 1`), of
dimension `2g` over `𝔽_ℓ`; for an elliptic curve the `G_K`-stable subgroups `L ⊂ E[ℓ]` of order
`ℓ` are exactly the kernels of `K`-rational isogenies of degree `ℓ`, and `G_K` acts on such an `L`
through a character `ψ : G_K → 𝔽_ℓ^×`. (Part (b), on lattices in `V_ℓA`, is R01.1's
lattice-independence applied to `rationalTateModule`. In the node the quotient by a stable line is
Vélu's quotient of the Weierstrass curve, Tau Ceti EllipticCurves Layer 1; here it is expressed
with the stand-in `Hom`. That `ψ` can be non-trivial for `ℓ` odd is an existence statement about
quadratic twists, `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
in Tau Ceti, and is not stated; the case `ℓ = 2` is `torsion_stable_line_two`.) -/
theorem torsion_residual_and_isogeny (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    (∀ A : AbelianVariety K, Module.finrank (ZMod ℓ) (A.torsionPoints ℓ) = 2 * A.dim) ∧
    ∀ (W : WeierstrassCurve K) [W.IsElliptic] (L : AddSubgroup (ofWeierstrass W).Points),
      L ≤ (ofWeierstrass W).torsionPoints ℓ → Nat.card L = ℓ →
      (((∀ σ : Field.absoluteGaloisGroup K, ∀ x ∈ L, σ • x ∈ L) ↔
          ∃ (B : AbelianVariety K) (φ : Hom (ofWeierstrass W) B),
            φ.IsIsogeny ∧ φ.degree = ℓ ∧ φ.toPointsHom.ker = L) ∧
        ((∀ σ : Field.absoluteGaloisGroup K, ∀ x ∈ L, σ • x ∈ L) →
          ∃ ψ : Field.absoluteGaloisGroup K →* (ZMod ℓ)ˣ,
            ∀ σ, ∀ x ∈ L, σ • x = ((ψ σ : ZMod ℓ).val) • x)) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation, (c) for `ℓ = 2`:
`𝔽_2^×` is trivial, so a `G_K`-stable subgroup of order `2` is fixed pointwise: it is generated by
a `K`-rational point of order `2`, and `ρ̄_{E,2}` is reducible iff `E` has such a point. -/
theorem torsion_stable_line_two (W : WeierstrassCurve K) [W.IsElliptic]
    (L : AddSubgroup (ofWeierstrass W).Points) (hL : L ≤ (ofWeierstrass W).torsionPoints 2)
    (hcard : Nat.card L = 2)
    (hst : ∀ σ : Field.absoluteGaloisGroup K, ∀ x ∈ L, σ • x ∈ L) :
    ∀ σ : Field.absoluteGaloisGroup K, ∀ x ∈ L, σ • x = x := by
  sorry

/-! ### Comparison with the Tate module of a Weierstrass curve (Tau Ceti EllipticCurves Layer 2) (ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison) -/

/-- ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison: for an elliptic
Weierstrass curve, `E_W[N](K^sep)` is `Submodule.torsionBy ℤ (W⁄K̄).Point N` with the action
`Point.map σ`, free of rank two over `ℤ/N` for `N` invertible in `K`; hence `T_ℓ(E_W)` is the
Tate module `lim E[ℓ^n]` of Tau Ceti EllipticCurves Layer 2 (not in Mathlib, so the comparison of
isogeny maps and Weil pairings is not stated here: the point map of a Tau Ceti isogeny is a
Layer 1 milestone, absent from the pinned library, and for `λ = φ_{𝒪(O)} : P ↦ [(O) − (P)]` the
pairing `e^λ_N` equals the pairing `e_N(S, T) = g(X + S)/g(X)` of AEC III.8.1 exactly, while on the
class of `(T) − (O)` Milne's `g/(g ∘ t_S)` is its inverse). The count `#E[N] = N²` over an
algebraically closed field is `TauCeti.Isogeny.card_ker_mulByIntIsogeny` in the pinned library. -/
theorem ofWeierstrass_torsion (W : WeierstrassCurve K) [W.IsElliptic] (N : ℕ)
    (hN : (N : K) ≠ 0) :
    (ofWeierstrass W).dim = 1 ∧
      Nonempty ((ofWeierstrass W).torsionPoints N ≃+ (Fin 2 → ZMod N)) := by
  sorry

/-! ### Functoriality: homomorphisms, products, isogenies and base change (ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies) -/

namespace tateModule

/-- The isomorphism `(T_ℓpr₁, T_ℓpr₂) : T_ℓ(A × B) ≅ T_ℓA ⊕ T_ℓB`. -/
def prodEquiv (A B : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    (A.prod B).tateModule ℓ ≃ₗ[ℤ_[ℓ]] A.tateModule ℓ × B.tateModule ℓ := sorry

end tateModule

/-- ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies: `T_ℓ` is an
additive functor to `ℤ_ℓ[G_K]`-modules, compatible with products; for an isogeny `φ` of degree
`d`, `T_ℓφ` is injective with cokernel of order the `ℓ`-part of `d`; and `ψφ = [m]` gives
`T_ℓψ ∘ T_ℓφ = m`. (Base change is `tateModule.baseChange`; transport of structure along
`τ : K ≅ K′` is not stated.) -/
theorem tateModule_functoriality (A B : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : K) ≠ 0) :
    (∀ (α : Hom A B) (σ : Field.absoluteGaloisGroup K) (x : A.tateModule ℓ),
        tateModule.map α ℓ (A.tateModuleRep ℓ σ x) = B.tateModuleRep ℓ σ (tateModule.map α ℓ x)) ∧
    (∀ (σ : Field.absoluteGaloisGroup K) (x : (A.prod B).tateModule ℓ),
        tateModule.prodEquiv A B ℓ ((A.prod B).tateModuleRep ℓ σ x) =
          (A.tateModuleRep ℓ σ (tateModule.prodEquiv A B ℓ x).1,
            B.tateModuleRep ℓ σ (tateModule.prodEquiv A B ℓ x).2)) ∧
    (∀ φ : Hom A B, φ.IsIsogeny →
        Function.Injective (tateModule.map φ ℓ) ∧
          Nat.card (B.tateModule ℓ ⧸ LinearMap.range (tateModule.map φ ℓ)) =
            ℓ ^ (φ.degree.factorization ℓ)) ∧
    (∀ (φ : Hom A B) (ψ : Hom B A) (m : ℕ), ψ.comp φ = m • Hom.id A →
        ∀ x, tateModule.map ψ ℓ (tateModule.map φ ℓ x) = (m : ℤ_[ℓ]) • x) := by
  sorry

/-! ### The Weil pairing on Tate modules, polarization pairings and the similitude character (ArithmeticGaloisRepresentations:R01.6/weil-pairing-on-tate-modules) -/

/-- A3's perfect Weil pairing `e_N : A[N] × A^∨[N] → μ_N` (imported; opaque here). -/
def weilPairingFinite (A : AbelianVariety K) (N : ℕ) :
    A.torsionPoints N →+ A.dual.torsionPoints N →+ Additive (rootsOfUnity N (AlgebraicClosure K)) :=
  sorry

/-- `e_ℓ : T_ℓA × T_ℓA^∨ → ℤ_ℓ(1)`, `((a_n), (a′_n)) ↦ (e_{ℓ^n}(a_n, a′_n))_n`. -/
def weilPairing (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    A.tateModule ℓ →ₗ[ℤ_[ℓ]] A.dual.tateModule ℓ →ₗ[ℤ_[ℓ]] tateTwistOne K ℓ := sorry

/-- `e_ℓ` reduces mod `ℓ^n` to `e_{ℓ^n}`. -/
theorem weilPairing_mod_pow (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ)
    (x : A.tateModule ℓ) (y : A.dual.tateModule ℓ) :
    ((weilPairing A ℓ x y : tateTwistOne K ℓ) : ℕ → Additive (AlgebraicClosure K)ˣ) n =
      Additive.ofMul (((Additive.toMul (weilPairingFinite A (ℓ ^ n)
        (tateModule.toTorsion A ℓ n x) (tateModule.toTorsion A.dual ℓ n y)) :
          rootsOfUnity (ℓ ^ n) (AlgebraicClosure K)) : (AlgebraicClosure K)ˣ)) := by
  sorry

/-- `y ↦ e_ℓ(·, y)` is an isomorphism `T_ℓA^∨ ≅ Hom(T_ℓA, ℤ_ℓ(1))` (equivariant by
`weilPairing_galois`). -/
theorem weilPairing_perfect (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    Function.Bijective (weilPairing A ℓ).flip := by
  sorry

/-- `e_ℓ(σx, σy) = χ_ℓ(σ) e_ℓ(x, y)`. -/
theorem weilPairing_galois (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (σ : Field.absoluteGaloisGroup K) (x : A.tateModule ℓ) (y : A.dual.tateModule ℓ) :
    weilPairing A ℓ (A.tateModuleRep ℓ σ x) (A.dual.tateModuleRep ℓ σ y) =
      ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) • weilPairing A ℓ x y := by
  sorry

/-- Adjunction: `e_ℓ(x, T_ℓα^∨ y) = e_ℓ(T_ℓα x, y)`. -/
theorem weilPairing_map_dual {A B : AbelianVariety K} (α : Hom A B) (ℓ : ℕ) [Fact ℓ.Prime]
    (x : A.tateModule ℓ) (y : B.dual.tateModule ℓ) :
    weilPairing A ℓ x (tateModule.map α.dual ℓ y) = weilPairing B ℓ (tateModule.map α ℓ x) y := by
  sorry

/-- `e^λ_ℓ(x, y) := e_ℓ(x, T_ℓλ y)` for `λ : A → A^∨`. -/
def polarizationPairing (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (μ : Hom A A.dual) :
    A.tateModule ℓ →ₗ[ℤ_[ℓ]] A.tateModule ℓ →ₗ[ℤ_[ℓ]] tateTwistOne K ℓ :=
  (weilPairing A ℓ).compl₂ (tateModule.map μ ℓ)

/-- `e^λ_ℓ` is alternating for a polarization `λ` (the general `φ_L` form needs line bundles,
absent from the stand-in). -/
theorem polarizationPairing_alternating (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (μ : Polarization A) (x : A.tateModule ℓ) : polarizationPairing A ℓ μ.toHom x x = 0 := by
  sorry

/-- For a polarization of degree `d`, `e^λ_ℓ` is nondegenerate (over `ℚ_ℓ`), and perfect over
`ℤ_ℓ` iff `ℓ ∤ d`. -/
theorem polarizationPairing_perfect_iff (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : K) ≠ 0) (μ : Polarization A) :
    Function.Injective (polarizationPairing A ℓ μ.toHom) ∧
      (Function.Bijective (polarizationPairing A ℓ μ.toHom) ↔ ¬ ℓ ∣ μ.toHom.degree) := by
  sorry

/-- Rosati, integral case: if `β = α^†` is an endomorphism, i.e. `λ ∘ β = α^∨ ∘ λ`, then
`e^λ_ℓ(αx, y) = e^λ_ℓ(x, βy)`. The statement on `V_ℓA` for `α ∈ End(A) ⊗ ℚ` is
`weilPairing_rosati` of AbelianSchemesAndArithmeticModuli:A2/rosati-involution, which owns the
Rosati involution; `End⁰` does not act on the lattice, so only the integral case is stated. -/
theorem polarizationPairing_rosati (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (μ : Polarization A) (α β : Hom A A) (h : μ.toHom.comp β = α.dual.comp μ.toHom)
    (x y : A.tateModule ℓ) :
    polarizationPairing A ℓ μ.toHom (tateModule.map α ℓ x) y =
      polarizationPairing A ℓ μ.toHom x (tateModule.map β ℓ y) := by
  sorry

/-- `e^{λ×μ}_ℓ` on `T_ℓ(A × B) = T_ℓA ⊕ T_ℓB` is the orthogonal sum `e^λ_ℓ ⊥ e^μ_ℓ`. -/
theorem polarizationPairing_prod (A B : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (μ : Polarization A) (ν : Polarization B) (x y : (A.prod B).tateModule ℓ) :
    polarizationPairing (A.prod B) ℓ (μ.prod ν).toHom x y =
      polarizationPairing A ℓ μ.toHom (tateModule.prodEquiv A B ℓ x).1
          (tateModule.prodEquiv A B ℓ y).1 +
        polarizationPairing B ℓ ν.toHom (tateModule.prodEquiv A B ℓ x).2
          (tateModule.prodEquiv A B ℓ y).2 := by
  sorry

/-- `e^λ_ℓ(σx, σy) = χ_ℓ(σ)·e^λ_ℓ(x, y)` for `σ ∈ G_K` and `λ : A → A^∨` defined over `K`: every
`ρ_{A,ℓ}(σ)` preserves `e^λ_ℓ` up to the scalar `χ_ℓ(σ)`. -/
theorem polarizationPairing_galois (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (μ : Hom A A.dual) (σ : Field.absoluteGaloisGroup K) (x y : A.tateModule ℓ) :
    polarizationPairing A ℓ μ (A.tateModuleRep ℓ σ x) (A.tateModuleRep ℓ σ y) =
      ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) • polarizationPairing A ℓ μ x y := by
  sorry

/-- The group of similitudes `GSp(M, e) = {g | ∃ c ∈ R^×, e(gx, gy) = c·e(x, y)}` of a bilinear
form with values in an `R`-module. -/
def symplecticSimilitudes {R M N : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] (e : M →ₗ[R] M →ₗ[R] N) :
    Subgroup (LinearMap.GeneralLinearGroup R M) where
  carrier := {g | ∃ c : Rˣ, ∀ x y, e ((g : M →ₗ[R] M) x) ((g : M →ₗ[R] M) y) = (c : R) • e x y}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The isometry group `Sp(M, e) = {g | e(gx, gy) = e(x, y)}`. -/
def symplecticIsometries {R M N : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    [AddCommGroup N] [Module R N] (e : M →ₗ[R] M →ₗ[R] N) :
    Subgroup (LinearMap.GeneralLinearGroup R M) where
  carrier := {g | ∀ x y, e ((g : M →ₗ[R] M) x) ((g : M →ₗ[R] M) y) = e x y}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Compatibility form of `polarizationPairing_galois`: `ρ_{A,ℓ}(G_K) ⊆ GSp(T_ℓA, e^λ_ℓ)` with
multiplier `χ_ℓ` (hence `⊆ GSp(V_ℓA, e^λ_ℓ)` for every polarization; the integral form is a
perfect pairing exactly when `ℓ ∤ deg λ`). The group is the group of similitudes of
G7/similitude-groups, here `symplecticSimilitudes` above. -/
theorem image_le_GSp (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (μ : Polarization A) :
    (Representation.asGroupHom (A.tateModuleRep ℓ).toRepresentation).range ≤
        symplecticSimilitudes (polarizationPairing A ℓ μ.toHom) ∧
      ∀ (σ : Field.absoluteGaloisGroup K) (x y : A.tateModule ℓ),
        polarizationPairing A ℓ μ.toHom (A.tateModuleRep ℓ σ x) (A.tateModuleRep ℓ σ y) =
          ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) •
            polarizationPairing A ℓ μ.toHom x y := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_galois. -/
example (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0)
    (σ : Field.absoluteGaloisGroup K) (x : A.tateModule ℓ) (y : A.dual.tateModule ℓ) :
    weilPairing A ℓ (A.tateModuleRep ℓ σ x) (A.dual.tateModuleRep ℓ σ y) =
      ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) • weilPairing A ℓ x y := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_elliptic_det. -/
example (W : WeierstrassCurve K) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    (∀ b : Module.Basis (Fin 2) ℤ_[ℓ] ((ofWeierstrass W).tateModule ℓ),
        Submodule.span ℤ_[ℓ]
          {polarizationPairing (ofWeierstrass W) ℓ (canonicalPolarization W).toHom (b 0) (b 1)} =
            ⊤) ∧
      ∀ σ : Field.absoluteGaloisGroup K,
        LinearMap.det ((ofWeierstrass W).tateModuleRep ℓ σ) =
          ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_zero_dim. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (μ : Polarization (zero K)) :
    (∀ x y, polarizationPairing (zero K) ℓ μ.toHom x y = 0) ∧
      Function.Bijective (polarizationPairing (zero K) ℓ μ.toHom) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.polarizationPairing_not_perfect.
For `λ = [ℓ] ∘ λ_E`, `e^λ_ℓ = ℓ · e^{λ_E}_ℓ` is not perfect. -/
example (W : WeierstrassCurve K) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0) :
    (∀ x y, polarizationPairing (ofWeierstrass W) ℓ (ℓ • (canonicalPolarization W).toHom) x y =
      (ℓ : ℤ_[ℓ]) • polarizationPairing (ofWeierstrass W) ℓ (canonicalPolarization W).toHom x y) ∧
      ¬ Function.Bijective
        (polarizationPairing (ofWeierstrass W) ℓ (ℓ • (canonicalPolarization W).toHom)) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_target_twist.
For complex conjugation `c` on `ℚ̄`, `e_ℓ(cx, cy) = −e_ℓ(x, y)`: the pairing is not Galois-invariant
with values in `ℤ_ℓ`. -/
example (A : AbelianVariety ℚ) (ℓ : ℕ) [Fact ℓ.Prime] (v : InfinitePlace ℚ) (hv : v.IsReal)
    (x : A.tateModule ℓ) (y : A.dual.tateModule ℓ) :
    weilPairing A ℓ (A.tateModuleRep ℓ (GaloisRep.complexConjugation ℚ v hv) x)
        (A.dual.tateModuleRep ℓ (GaloisRep.complexConjugation ℚ v hv) y) =
      -weilPairing A ℓ x y := by
  sorry

/-! ### The determinant of a symplectic similitude (ArithmeticGaloisRepresentations:R01.6/determinant-of-a-symplectic-similitude) -/

/-- ArithmeticGaloisRepresentations:R01.6/determinant-of-a-symplectic-similitude, matrix form: over
a commutative ring, `Aᵀ J A = μ J` with `μ` a unit implies `det A = μ^g`. Mathlib has the case
`μ = 1` (`SymplecticGroup.det_eq_one`) and Tau Ceti the case `g = 1`
(`Matrix.det_eq_of_transpose_mul_J_mul_eq_smul`). -/
theorem det_of_transpose_mul_J_mul_eq_smul {g : Type*} [Fintype g] [DecidableEq g] {R : Type*}
    [CommRing R] (M : Matrix (g ⊕ g) (g ⊕ g) R) (c : Rˣ)
    (h : M.transpose * Matrix.J g R * M = (c : R) • Matrix.J g R) :
    M.det = (c : R) ^ Fintype.card g := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/determinant-of-a-symplectic-similitude: a nondegenerate
alternating form lives on a space of even dimension `2g`, and an endomorphism `h` with
`B(hx, hy) = μ·B(x, y)` has `det h = μ^g` (`μ = 0` allowed). -/
theorem det_of_symplectic_similitude {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (B : LinearMap.BilinForm k V) (hB : B.Nondegenerate) (hA : B.IsAlt)
    (h : V →ₗ[k] V) (c : k) (hh : ∀ x y, B (h x) (h y) = c * B x y) :
    ∃ g : ℕ, Module.finrank k V = 2 * g ∧ LinearMap.det h = c ^ g := by
  sorry

/-! ### Determinant of the Tate module and oddness over real places (ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness) -/

/-- ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, (a), (b): `det ρ_{A,ℓ} = χ_ℓ^g`
on the lattice `T_ℓA`, for every `ℓ ≠ char K` and with no condition on the degree of a
polarization (for an elliptic curve, `det ρ_{E,ℓ} = χ_ℓ`, which for a Weierstrass curve is the
determinant theorem of Tau Ceti EllipticCurves Layer 2). The proof is
`det_of_symplectic_similitude` applied to `polarizationPairing_galois`. -/
theorem tateModule_det (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0)
    (σ : Field.absoluteGaloisGroup K) :
    LinearMap.det (A.tateModuleRep ℓ σ) =
      ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) ^ A.dim := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, (c): at a real place of a
number field, `tr ρ_{A,ℓ}(c) = 0` and `det ρ_{A,ℓ}(c) = (−1)^g` for every prime `ℓ` (so an elliptic
curve is odd). (That the `±1`-eigenspaces are Lagrangian for `e^λ_ℓ ⊗ ℚ_ℓ` and part (d) are not
restated.) -/
theorem tateModule_odd [NumberField K] (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime]
    (v : InfinitePlace K) (hv : v.IsReal) :
    LinearMap.trace ℤ_[ℓ] _ (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv)) = 0 ∧
      LinearMap.det (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv)) =
        (-1) ^ A.dim := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, (c), integral form: the
eigenlattices `T_ℓA^± = ker(c ∓ 1)` of a complex conjugation have rank `g`; `T_ℓA` is their direct
sum when `ℓ` is odd, and for `ℓ = 2` only `2 T_2A ⊆ T_2A^+ ⊕ T_2A^-` holds (the sum is proper
whenever `c` acts non-trivially on `A[2]`, e.g. for `y² = x³ + 1`). -/
theorem tateModule_conj_eigenlattices [NumberField K] (A : AbelianVariety K) (ℓ : ℕ)
    [Fact ℓ.Prime] (v : InfinitePlace K) (hv : v.IsReal) :
    Module.finrank ℤ_[ℓ] (LinearMap.ker
        (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) - LinearMap.id)) = A.dim ∧
      Module.finrank ℤ_[ℓ] (LinearMap.ker
        (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) + LinearMap.id)) = A.dim ∧
      (ℓ ≠ 2 → IsCompl
        (LinearMap.ker (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) - LinearMap.id))
        (LinearMap.ker (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) + LinearMap.id))) ∧
      ∀ x : A.tateModule ℓ, (2 : ℤ_[ℓ]) • x ∈
        LinearMap.ker (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) - LinearMap.id) ⊔
        LinearMap.ker (A.tateModuleRep ℓ (GaloisRep.complexConjugation K v hv) + LinearMap.id) := by
  sorry

/-! ### The determinant and trace of a Weierstrass isogeny on the Tate module (ArithmeticGaloisRepresentations:R01.6/determinant-of-a-weierstrass-isogeny-on-the-tate-module) -/

/-- ArithmeticGaloisRepresentations:R01.6/determinant-of-a-weierstrass-isogeny-on-the-tate-module,
(b), in the stand-in: for a homomorphism `α : E_{W₁} → E_{W₂}` of elliptic curves and `ℓ ≠ char K`,
`e₂(T_ℓα x, T_ℓα y) = deg α · e₁(x, y)` for the pairings of the canonical polarizations (the
`ℓ`-adic Weil pairings of `W₁`, `W₂`); for `α = 0` both sides vanish. Parts (c), (d) below are
deduced from it. -/
theorem ofWeierstrass_polarizationPairing_map (W₁ W₂ : WeierstrassCurve K) [W₁.IsElliptic]
    [W₂.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : K) ≠ 0)
    (α : Hom (ofWeierstrass W₁) (ofWeierstrass W₂)) (x y : (ofWeierstrass W₁).tateModule ℓ) :
    polarizationPairing (ofWeierstrass W₂) ℓ (canonicalPolarization W₂).toHom
        (tateModule.map α ℓ x) (tateModule.map α ℓ y) =
      (α.degree : ℤ_[ℓ]) •
        polarizationPairing (ofWeierstrass W₁) ℓ (canonicalPolarization W₁).toHom x y := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/determinant-of-a-weierstrass-isogeny-on-the-tate-module,
(c), (d), in the stand-in: for an endomorphism `α` of the elliptic curve `E_W` and `ℓ ≠ char K`,
`det(T_ℓα) = deg α`, and if `β = 1 − α` then `tr(T_ℓα) = 1 + deg α − deg β`; both are integers
independent of `ℓ`. The node states this for Tau Ceti's `TauCeti.Isogeny W W` with
`TauCeti.Isogeny.degree` (the degree of a function-field extension), a type that is not in Mathlib;
applied to `frobeniusIsogeny` and `oneSubFrobeniusIsogeny` it gives `det = q` and
`tr = q + 1 − #E(𝔽_q)` (`degree_frobeniusIsogeny`, `degree_oneSubFrobeniusIsogeny_eq_pointCount`). -/
theorem ofWeierstrass_det_trace_map (W : WeierstrassCurve K) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : K) ≠ 0) (α β : Hom (ofWeierstrass W) (ofWeierstrass W))
    (hβ : β = Hom.id (ofWeierstrass W) - α) :
    LinearMap.det (tateModule.map α ℓ) = (α.degree : ℤ_[ℓ]) ∧
      LinearMap.trace ℤ_[ℓ] _ (tateModule.map α ℓ) =
        1 + (α.degree : ℤ_[ℓ]) - (β.degree : ℤ_[ℓ]) := by
  sorry

/-! ### Local results over a nonarchimedean local field -/

section Local

variable {F : Type u} [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F]

/-- Abelian-scheme models of `A` over `𝒪[F]` (good reduction means this type is nonempty);
opaque data, replaced in the roadmap by an abelian scheme over `𝒪[F]` with generic fibre `A`
(NeronModelsAndSemistableAbelianVarieties R11.1, abelian-scheme-model: it is the Néron model, so
unique). It is data, a model with its special fibre, not a proposition: the condition "`A` has good
reduction" is `Nonempty` of this type and cannot be stated otherwise in the stand-in. -/
def GoodReductionModel (A : AbelianVariety F) : Type u := sorry

/-- The special fibre `A_v := 𝒜 ⊗ 𝓀[F]` of a model. -/
def GoodReductionModel.specialFiber {A : AbelianVariety F} (𝒜 : GoodReductionModel A) :
    AbelianVariety 𝓀[F] := sorry

/-! ### Specialisation of torsion points of an abelian scheme over the integers of a local field (ArithmeticGaloisRepresentations:R01.6/specialisation-of-torsion-at-good-reduction) -/

/-- ArithmeticGaloisRepresentations:R01.6/specialisation-of-torsion-at-good-reduction, on Tate
modules: for an abelian scheme over `𝒪[F]` and `ℓ` different from the residue characteristic,
inertia acts trivially on `T_ℓA`, and there is a `ℤ_ℓ`-isomorphism `r : T_ℓA ≅ T_ℓA_k` (reduction
of torsion points) carrying an arithmetic Frobenius lift to the action of the `q`-power
automorphism of `k̄`. (The node states it at each finite level, with every torsion point defined
over `F^{ur}` and full equivariance for `G_F → Gal(k̄/k)`; the maximal unramified extension and
that map are not available here, so equivariance is stated for the Frobenius lift, which with the
triviality of inertia determines the action of the decomposition group.) -/
theorem torsion_specialisation (A : AbelianVariety F) (𝒜 : GoodReductionModel A) (ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    (∀ g ∈ GaloisRep.inertiaGroup F, ∀ x : A.tateModule ℓ, A.tateModuleRep ℓ g x = x) ∧
      ∃ (r : A.tateModule ℓ ≃ₗ[ℤ_[ℓ]] 𝒜.specialFiber.tateModule ℓ)
        (φ : Field.absoluteGaloisGroup 𝓀[F]),
        (∀ y : AlgebraicClosure 𝓀[F],
          φ.toRingEquiv y = y ^ Nat.card 𝓀[F]) ∧
        ∀ x : A.tateModule ℓ, r (A.tateModuleRep ℓ (GaloisRep.arithFrobLift F) x) =
          𝒜.specialFiber.tateModuleRep ℓ φ (r x) := by
  sorry

/-! ### Unramifiedness and the Frobenius polynomial at a place of good reduction (ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial) -/

/-- ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial (local form, `F = F_v`):
at good reduction and `ℓ ≠ p`, `ρ_{A,ℓ}` is unramified, its Frobenius polynomial
`P_v = det(X − ρ(Frob))` is the characteristic polynomial of `T_ℓ(π_v)` on `T_ℓA_v`, with constant
term `q^g` and `X^{2g} P_v(q/X) = q^g P_v(X)`. (Integrality and `ℓ`-independence of `P_v` for
`g > 1`, Milne AV Proposition 10.20, are not proved in this layer and not stated; for elliptic
curves see `ofWeierstrass_det_trace_map` and `localEulerFactor_compare_localPolynomial`. Parts (a),
(b) are `torsion_specialisation`.) -/
theorem goodReduction_frobCharpoly (A : AbelianVariety F) (𝒜 : GoodReductionModel A) (ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    GaloisRep.IsUnramified (A.tateModuleRep ℓ) ∧
      GaloisRep.frobCharpoly (A.tateModuleRep ℓ) =
        LinearMap.charpoly (tateModule.map (qFrobenius 𝒜.specialFiber) ℓ) ∧
      (GaloisRep.frobCharpoly (A.tateModuleRep ℓ)).coeff 0 = (Nat.card 𝓀[F] : ℤ_[ℓ]) ^ A.dim ∧
      ∀ x : ℚ_[ℓ], x ≠ 0 →
        x ^ (2 * A.dim) * ((GaloisRep.frobCharpoly (A.tateModuleRep ℓ)).map
            (algebraMap ℤ_[ℓ] ℚ_[ℓ])).eval ((Nat.card 𝓀[F] : ℚ_[ℓ]) / x) =
          (Nat.card 𝓀[F] : ℚ_[ℓ]) ^ A.dim *
            ((GaloisRep.frobCharpoly (A.tateModuleRep ℓ)).map (algebraMap ℤ_[ℓ] ℚ_[ℓ])).eval x := by
  sorry

/-! ### The Tate module of a Tate curve (ArithmeticGaloisRepresentations:R01.6/tate-module-of-the-tate-curve) -/

/-- ArithmeticGaloisRepresentations:R01.6/tate-module-of-the-tate-curve, the consequence for the
inertia action that can be stated without the Tate curve: an elliptic curve with split
multiplicative reduction (isomorphic to a Tate curve `E_q` by Tate's theorem) has, for `ℓ` different
from the residue characteristic, unipotent and non-trivial inertia action on `T_ℓE`. (The node
gives the exact sequence `0 → ℤ_ℓ(1) → T_ℓE_q → ℤ_ℓ → 0` from the uniformisation `K̄^×/q^ℤ`, the
Kummer cocycle `κ` of `q`, and `κ = v(q)·t_ℓ` on inertia with `t_ℓ` the tame character of R01.2;
the Tate curve is in Tau Ceti EllipticCurves Layer 4, not in Mathlib.) -/
theorem tateCurve_inertia_unipotent [CharZero F] [IsFractionRing 𝒪[F] F] (W : WeierstrassCurve F)
    [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0)
    (hW : (W.minimal 𝒪[F]).HasSplitMultiplicativeReduction 𝒪[F]) :
    (∀ g ∈ GaloisRep.inertiaGroup F,
        ((ofWeierstrass W).tateModuleRep ℓ g - LinearMap.id) ∘ₗ
          ((ofWeierstrass W).tateModuleRep ℓ g - LinearMap.id) = 0) ∧
      ∃ g ∈ GaloisRep.inertiaGroup F, (ofWeierstrass W).tateModuleRep ℓ g ≠ LinearMap.id := by
  sorry

/-! ### Comparison with Mathlib's WeierstrassCurve.localPolynomial (ArithmeticGaloisRepresentations:R01.6/comparison-with-weierstrass-local-polynomial) -/

/-- The inertia coinvariants `(V_ℓA)_I`: the quotient by `span {ρ(g)v − v | g ∈ I}`. -/
def inertiaCoinvariantsKernel (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime] :
    Submodule ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) :=
  Submodule.span ℚ_[ℓ]
    {w | ∃ g ∈ GaloisRep.inertiaGroup F, ∃ v, w = A.rationalTateModule ℓ g v - v}

/-- ArithmeticGaloisRepresentations:R01.6/comparison-with-weierstrass-local-polynomial (local form,
over a local field `F` with its ring of integers `𝒪[F]`; for `F = p.adicCompletion` of a number
field the form with Mathlib's `p.adicCompletionIntegers` is
`localPolynomial_adicCompletion_eq_localEulerFactor` below): if the minimal model has good or
multiplicative reduction, `localPolynomial 𝒪[F] W = det(1 − X·Frob | (V_ℓE)_I)`, the local Euler
factor of `H¹ = V_ℓE^∨` (`localEulerFactor_eq_coinvariants`); at good reduction inertia acts
trivially, so this is `det(1 − X·Frob | V_ℓE)`, and at split (resp. nonsplit) multiplicative
reduction it is `1 − X` (resp. `1 + X`). The reduction is elliptic at good reduction by Mathlib's
`WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`. Additive reduction, part (c) of the
node, is `localPolynomial_additive` below (in characteristic `0`), so that by Mathlib's trichotomy
`hasGoodReduction_or_hasMultiplicativeReduction_or_hasAdditiveReduction` the comparison holds at
every place. -/
theorem localPolynomial_eq_det_coinvariants [IsFractionRing 𝒪[F] F] (W : WeierstrassCurve F)
    [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0)
    (hW : (W.minimal 𝒪[F]).HasGoodReduction 𝒪[F] ∨
      (W.minimal 𝒪[F]).HasMultiplicativeReduction 𝒪[F]) :
    (WeierstrassCurve.localPolynomial 𝒪[F] W).map (Int.castRingHom ℚ_[ℓ]) =
      (LinearMap.charpoly (((ofWeierstrass W).inertiaCoinvariantsKernel ℓ).mapQ
        ((ofWeierstrass W).inertiaCoinvariantsKernel ℓ)
        ((ofWeierstrass W).rationalTateModule ℓ (GaloisRep.arithFrobLift F)) sorry)).reverse := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.6/comparison-with-weierstrass-local-polynomial, (c): at
additive reduction over a local field of characteristic `0` (every reduction type, every residue
characteristic), `V_ℓE` has no non-zero inertia invariants and no non-zero inertia coinvariants,
and Mathlib's `localPolynomial` is `1`: the Euler factor of `H¹ = V_ℓE^∨`. -/
theorem localPolynomial_additive [CharZero F] [IsFractionRing 𝒪[F] F] (W : WeierstrassCurve F)
    [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0)
    (hW : (W.minimal 𝒪[F]).HasAdditiveReduction 𝒪[F]) :
    (∀ v : ℚ_[ℓ] ⊗[ℤ_[ℓ]] (ofWeierstrass W).tateModule ℓ,
        (∀ g ∈ GaloisRep.inertiaGroup F, (ofWeierstrass W).rationalTateModule ℓ g v = v) → v = 0) ∧
      (ofWeierstrass W).inertiaCoinvariantsKernel ℓ = ⊤ ∧
      WeierstrassCurve.localPolynomial 𝒪[F] W = 1 := by
  sorry

/-! ### The local Euler factor of an abelian variety at a finite place (ArithmeticGaloisRepresentations:R01.6/local-euler-factor-of-an-abelian-variety) -/

section FirstCohomology

variable (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime]

/-- The module topology on `H¹_ℓ(A) = V_ℓA^∨`. -/
instance : TopologicalSpace (Module.Dual ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ)) :=
  moduleTopology ℚ_[ℓ] _

instance : IsModuleTopology ℚ_[ℓ] (Module.Dual ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ)) := ⟨rfl⟩

end FirstCohomology

/-- `H¹_ℓ(A) := V_ℓA^∨` with the dual action. -/
def firstCohomologyRep (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime] :
    ContinuousRep (Field.absoluteGaloisGroup F) ℚ_[ℓ]
      (Module.Dual ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ)) :=
  ⟨(A.rationalTateModule ℓ).toRepresentation.dual, sorry⟩

/-- The inertia invariants `H¹_ℓ(A)^{I}`. -/
def inertiaInvariants (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime] :
    Submodule ℚ_[ℓ] (Module.Dual ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ)) where
  carrier := {f | ∀ g ∈ GaloisRep.inertiaGroup F, A.firstCohomologyRep ℓ g f = f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- `L_v(A, T) := det(1 − T·Φ | H¹_ℓ(A)^{I})` with `Φ` a geometric Frobenius (the inverse of
`GaloisRep.arithFrobLift`), computed as the reverse of the characteristic polynomial. -/
def localEulerFactor (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime] : ℚ_[ℓ][X] :=
  (LinearMap.charpoly ((A.firstCohomologyRep ℓ (GaloisRep.arithFrobLift F)⁻¹).restrict
    (p := A.inertiaInvariants ℓ) (q := A.inertiaInvariants ℓ) sorry)).reverse

/-- `L_v(A, T) = det(1 − T·Frob | (V_ℓA)_I)` with the arithmetic Frobenius. -/
theorem localEulerFactor_eq_coinvariants (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    A.localEulerFactor ℓ =
      (LinearMap.charpoly ((A.inertiaCoinvariantsKernel ℓ).mapQ (A.inertiaCoinvariantsKernel ℓ)
        (A.rationalTateModule ℓ (GaloisRep.arithFrobLift F)) sorry)).reverse := by
  sorry

/-- At good reduction, `L_v(A, T) = T^{2g} P_v(1/T) = det(1 − T·π_v | V_ℓA_v)`. -/
theorem localEulerFactor_of_goodReduction (A : AbelianVariety F) (𝒜 : GoodReductionModel A)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    A.localEulerFactor ℓ =
        ((GaloisRep.frobCharpoly (A.tateModuleRep ℓ)).map (algebraMap ℤ_[ℓ] ℚ_[ℓ])).reverse ∧
      A.localEulerFactor ℓ =
        ((LinearMap.charpoly (tateModule.map (qFrobenius 𝒜.specialFiber) ℓ)).reverse).map
          (algebraMap ℤ_[ℓ] ℚ_[ℓ]) := by
  sorry

/-- Isogenous abelian varieties have the same local Euler factors. -/
theorem localEulerFactor_isogeny {A B : AbelianVariety F} (φ : Hom A B) (hφ : φ.IsIsogeny)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    A.localEulerFactor ℓ = B.localEulerFactor ℓ := by
  sorry

/-- `L_v(A × B, T) = L_v(A, T) L_v(B, T)`. -/
theorem localEulerFactor_prod (A B : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    (A.prod B).localEulerFactor ℓ = A.localEulerFactor ℓ * B.localEulerFactor ℓ := by
  sorry

/-- `deg L_v(A, T) ≤ 2g`, with equality iff `V_ℓA` is unramified. -/
theorem localEulerFactor_natDegree_le (A : AbelianVariety F) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[F]) ≠ 0) :
    (A.localEulerFactor ℓ).natDegree ≤ 2 * A.dim ∧
      ((A.localEulerFactor ℓ).natDegree = 2 * A.dim ↔
        GaloisRep.IsUnramified (A.rationalTateModule ℓ)) := by
  sorry

/- TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_eq_weilDeligne: `L_v(A, T)` equals
R01.2's local Euler factor `det(1 − T·r(Φ) | (ker N)^{I})` of the Weil–Deligne representation
`WD(H¹_ℓ(A))` attached by Grothendieck's monodromy theorem. (The Weil group and the functor `WD`
belong to R01.2, another section.) -/

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_goodReduction.
For `y² = x³ − x` at `5`: `L_5(E, T) = 1 + 2T + 5T²` for every `ℓ ≠ 5`. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5) :
    (ofWeierstrass (cmCurve ℚ_[5])).localEulerFactor ℓ = 1 + 2 * X + 5 * X ^ 2 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_zero. -/
example (ℓ : ℕ) [Fact ℓ.Prime] : (zero F).localEulerFactor ℓ = 1 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_compare_localPolynomial.
(Local form, over a local field `F` with `𝒪[F]`; the form at a prime of a number field is
`localPolynomial_adicCompletion_eq_localEulerFactor` below.) -/
example [IsFractionRing 𝒪[F] F] (W : WeierstrassCurve F) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[F]) ≠ 0)
    (hW : (W.minimal 𝒪[F]).HasGoodReduction 𝒪[F] ∨
      (W.minimal 𝒪[F]).HasMultiplicativeReduction 𝒪[F]) :
    (ofWeierstrass W).localEulerFactor ℓ =
      (WeierstrassCurve.localPolynomial 𝒪[F] W).map (Int.castRingHom ℚ_[ℓ]) := by
  sorry

/-- The base change of an elliptic Weierstrass curve is elliptic (Mathlib has the instance for
`WeierstrassCurve.map`; `baseChange` is a definition, so it is restated). -/
instance isElliptic_baseChange {k : Type*} [Field k] (W : WeierstrassCurve k) [W.IsElliptic]
    (L : Type*) [Field L] [Algebra k L] : (W.baseChange L).IsElliptic :=
  inferInstanceAs (W.map (algebraMap k L)).IsElliptic

/-- ArithmeticGaloisRepresentations:R01.6/comparison-with-weierstrass-local-polynomial, (d), in the
expression that occurs in Mathlib's `WeierstrassCurve.LFunction`: for an elliptic Weierstrass curve
`W` over a number field `k`, every prime `p` of `𝓞 k` (good, multiplicative or additive reduction)
and every `ℓ` different from the residue characteristic, the local polynomial of
`W.baseChange (p.adicCompletion k)` over `p.adicCompletionIntegers k` is the local Euler factor of
`H¹ = V_ℓE^∨` at `p`. The two instance arguments are the local-field structure of
`p.adicCompletion k`: in Tau Ceti they are the instances
`IsDedekindDomain.HeightOneSpectrum.instValuativeRelAdicCompletion` and
`isNonarchimedeanLocalField_adicCompletion`, and
`IsDedekindDomain.HeightOneSpectrum.integer_eq_adicCompletionIntegers` identifies
`𝒪[p.adicCompletion k]` with `p.adicCompletionIntegers k` (Mathlib has no such instance; a
valuative relation making the completion, with its adic topology, a nonarchimedean local field has
that ring of integers, so the statement does not depend on the instance). -/
theorem localPolynomial_adicCompletion_eq_localEulerFactor {k : Type u} [Field k] [NumberField k]
    (W : WeierstrassCurve k) [W.IsElliptic] (p : HeightOneSpectrum (𝓞 k))
    [ValuativeRel (p.adicCompletion k)] [IsNonarchimedeanLocalField (p.adicCompletion k)]
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓞 k ⧸ p.asIdeal) ≠ 0) :
    ((W.baseChange (p.adicCompletion k)).localPolynomial (p.adicCompletionIntegers k)).map
        (Int.castRingHom ℚ_[ℓ]) =
      (ofWeierstrass (W.baseChange (p.adicCompletion k))).localEulerFactor ℓ := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_not_on_V.
`det(1 − TΦ_5 | V_ℓE) = 1 + (2/5)T + (1/5)T²` for `y² = x³ − x`, which is not the Euler factor. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5) :
    (LinearMap.charpoly ((ofWeierstrass (cmCurve ℚ_[5])).rationalTateModule ℓ
        (GaloisRep.arithFrobLift ℚ_[5])⁻¹)).reverse =
      1 + C (2 / 5 : ℚ_[ℓ]) * X + C (1 / 5 : ℚ_[ℓ]) * X ^ 2 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.localEulerFactor_tate_curve.
Split multiplicative reduction (a Tate curve `E_q`, by Tate's uniformisation): `L(E_q, T) = 1 − T`. -/
example [IsFractionRing 𝒪[F] F] (W : WeierstrassCurve F) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : 𝓀[F]) ≠ 0) (hW : (W.minimal 𝒪[F]).HasSplitMultiplicativeReduction 𝒪[F]) :
    (ofWeierstrass W).localEulerFactor ℓ = 1 - X := by
  sorry

end Local

/-! ### Tate modules with endomorphism coefficients and their λ-adic components (ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients) -/

section Coefficients

variable (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] {E : Type} [Field E] [NumberField E]

namespace tateModule

/-- `End_K(A)` acts on `T_ℓA` (functoriality), commuting with `ρ_{A,ℓ}`, extended
`ℤ_ℓ`-linearly: the `O ⊗ ℤ_ℓ`-module structure for any order `O ⊆ End_K(A)`; its
rationalisation is `rationalEndAction`. -/
def endAction : ℤ_[ℓ] ⊗[ℤ] End A →ₐ[ℤ_[ℓ]] Module.End ℤ_[ℓ] (A.tateModule ℓ) := sorry

/-- The endomorphism action commutes with `ρ_{A,ℓ}`. -/
theorem endAction_comm (a : ℤ_[ℓ] ⊗[ℤ] End A) (σ : Field.absoluteGaloisGroup K) :
    tateModule.endAction A ℓ a ∘ₗ A.tateModuleRep ℓ σ =
      A.tateModuleRep ℓ σ ∘ₗ tateModule.endAction A ℓ a := by
  sorry

end tateModule

/-- The `E ⊗ ℚ_ℓ`-module structure on `V_ℓA` for `E ⊆ End⁰_K(A)`. -/
def rationalEndAction (ι : E →+* End0 A) :
    ℚ_[ℓ] ⊗[ℚ] E →ₐ[ℚ_[ℓ]] Module.End ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) := sorry

/-- The `λ`-component `V_λA = e_λ V_ℓA` (`e_λ` the idempotent of the factor `E_λ` of
`E ⊗ ℚ_ℓ`), a `ℚ_ℓ[G_K]`-submodule. -/
def lambdaComponent (ι : E →+* End0 A) (P : HeightOneSpectrum (𝓞 E)) :
    Submodule ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] A.tateModule ℓ) := sorry

/-- `V_λA := V_ℓA ⊗_{E⊗ℚ_ℓ} E_λ` as a continuous `E_λ`-representation of `G_K`, for `λ ∣ ℓ`. -/
def lambdaTateModule (ι : E →+* End0 A) (P : HeightOneSpectrum (𝓞 E))
    (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) :
    ContinuousRep.Bundled.{u, 0, u} (Field.absoluteGaloisGroup K) (P.adicCompletion E) := sorry

namespace lambdaTateModule

open Classical in
/-- `V_ℓA = ⊕_{λ ∣ ℓ} V_λA`. -/
theorem decomposition (ι : E →+* End0 A) :
    DirectSum.IsInternal fun P : {P : HeightOneSpectrum (𝓞 E) // (ℓ : 𝓞 E) ∈ P.asIdeal} =>
      lambdaComponent A ℓ ι P.1 := by
  sorry

end lambdaTateModule

/-- `dim_{E_λ} V_λA = 2g/[E : ℚ]`. The node states it under the hypothesis that `V_ℓA` is free
over `E ⊗ ℚ_ℓ` (Milne AV Proposition 10.23, not proved in this layer); that hypothesis needs the
`E ⊗ ℚ_ℓ`-module structure on `V_ℓA`, which is only available here as the algebra map
`rationalEndAction`, so it is left out of the statement. -/
theorem lambdaTateModule_finrank (hℓ : (ℓ : K) ≠ 0) (ι : E →+* End0 A)
    (P : HeightOneSpectrum (𝓞 E)) (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) :
    Module.finrank (P.adicCompletion E) (lambdaTateModule A ℓ ι P hP).carrier *
      Module.finrank ℚ E = 2 * A.dim := by
  sorry

/-- `T_λA := T_ℓA ⊗_{O_E⊗ℤ_ℓ} O_{E,λ}`, a `G_K`-stable `O_{E,λ}`-lattice in `V_λA`, for
`O_E ⊆ End_K(A)`. -/
def integralLambdaTateModule (ι : 𝓞 E →+* End A) (P : HeightOneSpectrum (𝓞 E))
    (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) :
    ContinuousRep.Bundled.{u, 0, u} (Field.absoluteGaloisGroup K) (P.adicCompletionIntegers E) :=
  sorry

/-- `A[λ](K^sep) = {x : αx = 0 for all α ∈ λ}` (inside `A[ℓ]` when `ℓ ∈ λ`), an
`O_E/λ[G_K]`-module isomorphic to the residual `λ`-adic representation `T_λA/λT_λA`; the
isomorphism is canonical (`A[λ] = e_λ A[ℓ]`) when `λ` is unramified over `ℓ`, and in general it is
multiplication by `ϖ^{e−1}`, defined up to a scalar. -/
def lambdaTorsion (ι : 𝓞 E →+* End A) (P : HeightOneSpectrum (𝓞 E)) : AddSubgroup A.Points where
  carrier := {x | ∀ a ∈ P.asIdeal, (End.toHom (ι a)).toPointsHom x = 0}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- When `O_E ⊆ End_K(A)`, `T_λA` is a free `O_{E,λ}`-module (finitely generated and torsion-free
over a discrete valuation ring), of rank `dim_{E_λ} V_λA`, and `T_ℓA = ⊕_{λ ∣ ℓ} T_λA`. (Only the
freeness is stated: the comparison of ranks needs the two carriers `lambdaTateModule` and
`integralLambdaTateModule` related, which the opaque definitions do not provide.) -/
theorem integralLambdaTateModule_free (ι : 𝓞 E →+* End A) (P : HeightOneSpectrum (𝓞 E))
    (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) :
    Module.Free (P.adicCompletionIntegers E) (integralLambdaTateModule A ℓ ι P hP).carrier := by
  sorry

/-- For totally real `E` of degree `g` (GL₂-type) acting through `O_E ⊆ End_K(A)` by Rosati-fixed
endomorphisms of a polarization: `det_{E_λ} ρ_{A,λ} = χ_ℓ` (`ℚ_ℓ → E_λ` the continuous embedding). -/
theorem lambdaTateModule_det [IsTotallyReal E] (hℓ : (ℓ : K) ≠ 0) (ι : 𝓞 E →+* End A)
    (μ : Polarization A) (hR : ∀ a, μ.toHom.comp (End.toHom (ι a)) = (End.toHom (ι a)).dual.comp μ.toHom)
    (hd : Module.finrank ℚ E = A.dim) (ι0 : E →+* End0 A)
    (hι : ∀ a : 𝓞 E, ι0 a = (1 : ℚ) ⊗ₜ[ℤ] ι a) (P : HeightOneSpectrum (𝓞 E))
    (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) [Algebra ℚ_[ℓ] (P.adicCompletion E)]
    [ContinuousSMul ℚ_[ℓ] (P.adicCompletion E)] (σ : Field.absoluteGaloisGroup K) :
    LinearMap.det ((lambdaTateModule A ℓ ι0 P hP).rep σ) =
      algebraMap ℚ_[ℓ] (P.adicCompletion E)
        ((GaloisRep.cyclotomicCharacter K ℓ σ : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) := by
  sorry

/-- Under the same hypotheses, over a number field, `det_{E_λ} ρ_{A,λ}(c) = −1` at every real
place. -/
theorem lambdaTateModule_odd [NumberField K] [IsTotallyReal E] (ι : 𝓞 E →+* End A)
    (μ : Polarization A) (hR : ∀ a, μ.toHom.comp (End.toHom (ι a)) = (End.toHom (ι a)).dual.comp μ.toHom)
    (hd : Module.finrank ℚ E = A.dim) (ι0 : E →+* End0 A)
    (hι : ∀ a : 𝓞 E, ι0 a = (1 : ℚ) ⊗ₜ[ℤ] ι a) (P : HeightOneSpectrum (𝓞 E))
    (hP : (ℓ : 𝓞 E) ∈ P.asIdeal) (v : InfinitePlace K) (hv : v.IsReal) :
    LinearMap.det ((lambdaTateModule A ℓ ι0 P hP).rep (GaloisRep.complexConjugation K v hv)) =
      -1 := by
  sorry

/- TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_frobenius: at a place `v ∤ ℓ` of
good reduction, `ρ_{A,λ}(Frob_v)` is the `E_λ`-linear map induced by the Frobenius endomorphism
`π_v` of `A_v`, which commutes with `E` acting on `A_v` through the reduction of endomorphisms.
(The action of `E` on the special fibre needs the extension of homomorphisms to the abelian
scheme, NeronModelsAndSemistableAbelianVarieties R11.1 abelian-scheme-model and group-law, absent
from the stand-in. That the `E_λ`-characteristic polynomial comes from a polynomial over `E`
independent of `λ` is not asserted by the node.) -/

/- TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule.coefficientExtension: for an
embedding `E_λ → ℚ̄_ℓ`, `V_λA ⊗_{E_λ} ℚ̄_ℓ` is the corresponding summand `V_ι` of
`V_ℓA ⊗_{ℚ_ℓ} ℚ̄_ℓ = ⊕_{ι : E → ℚ̄_ℓ} V_ι` (R01.1/coefficient-extension, another section). -/

end Coefficients

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_cm_rank_one.
`y² = x³ − x` over `ℚ(i)`, `End = ℤ[i]`, `ℓ = 5 = λλ̄`: each `V_λE` is one-dimensional. -/
example (ι : CyclotomicField 4 ℚ →+* End0 (ofWeierstrass (cmCurve (CyclotomicField 4 ℚ))))
    (P : HeightOneSpectrum (𝓞 (CyclotomicField 4 ℚ)))
    (hP : ((5 : ℕ) : 𝓞 (CyclotomicField 4 ℚ)) ∈ P.asIdeal) :
    Module.finrank (P.adicCompletion (CyclotomicField 4 ℚ))
      (lambdaTateModule (ofWeierstrass (cmCurve (CyclotomicField 4 ℚ))) 5 ι P hP).carrier = 1 := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_rationals.
For `E = ℚ`, the only `λ` is `ℓ` and `V_λA = V_ℓA`. -/
example (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] (ι : ℚ →+* End0 A)
    (P : HeightOneSpectrum (𝓞 ℚ)) (hP : (ℓ : 𝓞 ℚ) ∈ P.asIdeal) :
    lambdaComponent A ℓ ι P = ⊤ := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_not_over_smaller_field.
For `y² = x³ − x` over `ℚ`, no faithful `ℚ(i) ⊗ ℚ_ℓ`-action on `V_ℓE` commutes with `G_ℚ`
(complex conjugation anticommutes with `[i]`). -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ¬ ∃ f : ℚ_[ℓ] ⊗[ℚ] CyclotomicField 4 ℚ →ₐ[ℚ_[ℓ]]
        Module.End ℚ_[ℓ] (ℚ_[ℓ] ⊗[ℤ_[ℓ]] (ofWeierstrass (cmCurve ℚ)).tateModule ℓ),
      Function.Injective f ∧ ∀ σ a,
        f a ∘ₗ (ofWeierstrass (cmCurve ℚ)).rationalTateModule ℓ σ =
          (ofWeierstrass (cmCurve ℚ)).rationalTateModule ℓ σ ∘ₗ f a := by
  sorry

open Classical in
/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.lambdaTateModule_sum.
`V_ℓA = ⊕_{λ∣ℓ} V_λA` and `dim_{ℚ_ℓ} V_λA = [E_λ : ℚ_ℓ] · dim_{E_λ} V_λA`. -/
example (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] {E : Type} [Field E] [NumberField E]
    (ι : E →+* End0 A) (P : HeightOneSpectrum (𝓞 E)) (hP : (ℓ : 𝓞 E) ∈ P.asIdeal)
    [Algebra ℚ_[ℓ] (P.adicCompletion E)] [ContinuousSMul ℚ_[ℓ] (P.adicCompletion E)] :
    DirectSum.IsInternal (fun Q : {Q : HeightOneSpectrum (𝓞 E) // (ℓ : 𝓞 E) ∈ Q.asIdeal} =>
        lambdaComponent A ℓ ι Q.1) ∧
      Module.finrank ℚ_[ℓ] (lambdaComponent A ℓ ι P) =
        Module.finrank ℚ_[ℓ] (P.adicCompletion E) *
          Module.finrank (P.adicCompletion E)
            (lambdaTateModule A ℓ ι P hP).carrier := by
  sorry

/-! ### Galois generic and p-Galois generic abelian varieties (ArithmeticGaloisRepresentations:R01.6/galois-generic-abelian-varieties) -/

/-- The `ℓ`-adic (pointwise-convergence, i.e. `ℓ`-adic) topology on `End_{ℤ_ℓ}(T_ℓA)`; it induces
the topology of `GL(T_ℓA)`. -/
instance (A : AbelianVariety K) (ℓ : ℕ) [Fact ℓ.Prime] :
    TopologicalSpace (Module.End ℤ_[ℓ] (A.tateModule ℓ)) :=
  TopologicalSpace.induced (fun f x => f x) inferInstance

/-- The `p`-adic image `ρ_{A,p}(G_k) ⊆ GL(T_pA)` (contained in `GSp(T_pA, e^λ_p)` by
`image_le_GSp`), a closed subgroup. -/
def pAdicImage (A : AbelianVariety K) (p : ℕ) [Fact p.Prime] :
    Subgroup (LinearMap.GeneralLinearGroup ℤ_[p] (A.tateModule p)) :=
  (Representation.asGroupHom (A.tateModuleRep p).toRepresentation).range

/-- `A` is `p`-Galois generic (Masser–Zannier): `ρ_{A,p}(G_k)` is open in `GSp(T_pA, e^λ_p)`, the
group of `ℤ_p`-automorphisms of `T_pA` preserving `e^λ_p` up to a unit (`symplecticSimilitudes`,
defined directly, without G7/similitude-groups). The node takes `λ` principal. -/
def IsPGaloisGeneric (A : AbelianVariety K) (μ : Polarization A) (p : ℕ) [Fact p.Prime] : Prop :=
  IsOpen (((pAdicImage A p).subgroupOf (symplecticSimilitudes (polarizationPairing A p μ.toHom)) :
    Set (symplecticSimilitudes (polarizationPairing A p μ.toHom))))

/-- The adelic representation `ρ̂_A : G_k → ∏_p GL(T_pA)`. -/
def adelicRep (A : AbelianVariety K) :
    Field.absoluteGaloisGroup K →* ((p : Nat.Primes) →
      LinearMap.GeneralLinearGroup ℤ_[(p : ℕ)] (A.tateModule p)) :=
  MonoidHom.pi fun p => Representation.asGroupHom (A.tateModuleRep p).toRepresentation

/-- `A` is Galois generic: `ρ̂_A(G_k)` is open in `∏_p GSp(T_pA, e^λ_p) = GSp(T̂A, e^λ)` (the
standard adelic formulation; Masser–Zannier refer to Pink for the definition). -/
def IsGaloisGeneric (A : AbelianVariety K) (μ : Polarization A) : Prop :=
  IsOpen (((adelicRep A).range.subgroupOf
      (Subgroup.pi Set.univ fun p : Nat.Primes =>
        symplecticSimilitudes (polarizationPairing A p μ.toHom))) :
    Set (Subgroup.pi Set.univ fun p : Nat.Primes =>
        symplecticSimilitudes (polarizationPairing A p μ.toHom)))

/-- `p`-Galois generic iff the image has finite index (a closed subgroup of a profinite group). -/
theorem isPGaloisGeneric_iff_finiteIndex [NumberField K] (A : AbelianVariety K)
    (μ : Polarization A) (p : ℕ) [Fact p.Prime] :
    IsPGaloisGeneric A μ p ↔
      ((pAdicImage A p).subgroupOf
        (symplecticSimilitudes (polarizationPairing A p μ.toHom))).FiniteIndex := by
  sorry

namespace IsGaloisGeneric

/-- Galois generic implies `p`-Galois generic for every `p`. -/
theorem isPGaloisGeneric {A : AbelianVariety K} {μ : Polarization A}
    (h : IsGaloisGeneric A μ) (p : ℕ) [Fact p.Prime] : IsPGaloisGeneric A μ p := by
  sorry

end IsGaloisGeneric

/-- Invariance under a finite extension `L/k`. -/
theorem isPGaloisGeneric_baseChange_iff [NumberField K] (A : AbelianVariety K)
    (μ : Polarization A) (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    (p : ℕ) [Fact p.Prime] :
    IsPGaloisGeneric (A.baseChange L) (μ.baseChange L) p ↔ IsPGaloisGeneric A μ p := by
  sorry

/-- For two principal polarizations `λ`, `λ′` of `A`: `A` is `p`-Galois generic with respect to
`λ` iff it is with respect to `λ′`, and then `e^{λ′}_p` is a `ℤ_p^×`-multiple of `e^λ_p`. -/
theorem isPGaloisGeneric_polarization_indep [NumberField K] (A : AbelianVariety K)
    (μ μ' : Polarization A) (hμ : μ.toHom.degree = 1) (hμ' : μ'.toHom.degree = 1) (p : ℕ)
    [Fact p.Prime] :
    (IsPGaloisGeneric A μ p ↔ IsPGaloisGeneric A μ' p) ∧
      (IsPGaloisGeneric A μ p → ∃ c : ℤ_[p]ˣ, ∀ x y : A.tateModule p,
        polarizationPairing A p μ'.toHom x y =
          (c : ℤ_[p]) • polarizationPairing A p μ.toHom x y) := by
  sorry

/-- The general symplectic group `GSp_{2g}(R) = {M | Mᵀ J M = c J, c ∈ R^×}`. -/
def gspMatrix (g : Type*) [Fintype g] [DecidableEq g] (R : Type*) [CommRing R] :
    Subgroup (Matrix.GeneralLinearGroup (g ⊕ g) R) where
  carrier := {M | ∃ c : Rˣ, (M : Matrix (g ⊕ g) (g ⊕ g) R).transpose * Matrix.J g R *
    (M : Matrix (g ⊕ g) (g ⊕ g) R) = (c : R) • Matrix.J g R}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- For a symplectic basis `b` of `(T_pA, e^λ_p)` (`e^λ_p(b i, b j) = J i j • ζ`, `ζ` a generator of
`ℤ_p(1)`), `A` is `p`-Galois generic iff the framed image is open in `GSp_{2g}(ℤ_p)`. -/
theorem isPGaloisGeneric_iff_framed [NumberField K] (A : AbelianVariety K)
    (μ : Polarization A) (p : ℕ) [Fact p.Prime]
    (b : Module.Basis (Fin A.dim ⊕ Fin A.dim) ℤ_[p] (A.tateModule p)) (ζ : tateTwistOne K p)
    (hζ : Submodule.span ℤ_[p] {ζ} = ⊤)
    (hb : ∀ i j, polarizationPairing A p μ.toHom (b i) (b j) = Matrix.J (Fin A.dim) ℤ_[p] i j • ζ) :
    IsPGaloisGeneric A μ p ↔
      IsOpen ((((pAdicImage A p).map
          (Units.mapEquiv (LinearMap.toMatrixAlgEquiv b).toMulEquiv).toMonoidHom).subgroupOf
            (gspMatrix (Fin A.dim) ℤ_[p])) : Set (gspMatrix (Fin A.dim) ℤ_[p])) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_cm.
`y² = x³ − x` over `ℚ` (CM) is not `p`-Galois generic for any `p`. -/
example (p : ℕ) [Fact p.Prime] (μ : Polarization (ofWeierstrass (cmCurve ℚ))) :
    ¬ IsPGaloisGeneric (ofWeierstrass (cmCurve ℚ)) μ p := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.isPGaloisGeneric_iff_finiteIndex. -/
example [NumberField K] (A : AbelianVariety K) (μ : Polarization A) (p : ℕ) [Fact p.Prime] :
    IsPGaloisGeneric A μ p ↔
      ((pAdicImage A p).subgroupOf
        (symplecticSimilitudes (polarizationPairing A p μ.toHom))).FiniteIndex := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.not_open_in_Sp.
The image is never inside `Sp(T_pA, e^λ_p)`: its multiplier `χ_p` has infinite image. -/
example [NumberField K] (A : AbelianVariety K) (hA : 1 ≤ A.dim) (μ : Polarization A) (p : ℕ)
    [Fact p.Prime] :
    ¬ pAdicImage A p ≤ symplecticIsometries (polarizationPairing A p μ.toHom) := by
  sorry

/-- Unit test: TauCeti.AlgebraicGeometry.AbelianVariety.isGaloisGeneric_baseChange. -/
example [NumberField K] (A : AbelianVariety K) (μ : Polarization A) (L : Type u) [Field L]
    [Algebra K L] [FiniteDimensional K L] :
    IsGaloisGeneric (A.baseChange L) (μ.baseChange L) ↔ IsGaloisGeneric A μ := by
  sorry

/-! ### Serre: independence and connectedness of the ℓ-adic images after a finite extension (ArithmeticGaloisRepresentations:R01.6/serre-independence-and-connectedness) -/

/-- ArithmeticGaloisRepresentations:R01.6/serre-independence-and-connectedness, (1): after a
finite extension `L/K`, `ρ̂_A(G_L) = ∏_ℓ ρ_{A,ℓ}(G_L)` (`ℓ`-independence), as quoted from
Richard–Yafaev Theorem 4.9, which gives no proof (the proofs are Serre's and Larsen–Pink's, not
sources of the roadmap). (Zariski connectedness
of the images, part (2), needs Zariski closures in `GL(V_ℓA)`, absent from Mathlib; in the node
one field `L` serves (1) and (2). The independence of `ℓ` of `ker(G_K → G_ℓ/G_ℓ°)` is not
asserted by the node.) -/
theorem serre_independence [NumberField K] (A : AbelianVariety K) :
    ∃ L : IntermediateField K (AlgebraicClosure K), FiniteDimensional K L ∧
      (L.fixingSubgroup.map (adelicRep A)) =
        Subgroup.pi Set.univ fun p : Nat.Primes =>
          (L.fixingSubgroup.map (adelicRep A)).map (Pi.evalMonoidHom _ p) := by
  sorry

/-! ### Specialization of Tate modules and Galois images in a family (Noot, after Serre) (ArithmeticGaloisRepresentations:R01.6/noot-specialization) -/

/-- ArithmeticGaloisRepresentations:R01.6/noot-specialization (the limit step): Abelian schemes
over a base `S` are absent from Mathlib, so the specialisation isomorphisms
`s : X_η[n](K̄) ≅ X_σ[n](F̄)` of the finite étale `X[n]` (A3) are taken as input, as one
`D_σ`-equivariant isomorphism of torsion subgroups (characteristic `0`); then for every `ℓ`,
`T_ℓX_η ≅ T_ℓX_σ` `D_σ`-equivariantly and `ρ_{X_η,ℓ}(D_σ) ≅ ρ_{X_σ,ℓ}(Gal(F̄/F(σ)))`. -/
theorem noot_specialization {k : Type u} [Field k] (A : AbelianVariety K) (B : AbelianVariety k)
    (D : Subgroup (Field.absoluteGaloisGroup K)) (π : D →* Field.absoluteGaloisGroup k)
    (hπ : Function.Surjective π) (s : AddCommGroup.torsion A.Points ≃+ AddCommGroup.torsion B.Points)
    (hs : ∀ (d : D) (x y : AddCommGroup.torsion A.Points),
      (y : A.Points) = (d : Field.absoluteGaloisGroup K) • (x : A.Points) →
        (s y : B.Points) = π d • (s x : B.Points))
    (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ e : A.tateModule ℓ ≃ₗ[ℤ_[ℓ]] B.tateModule ℓ,
      ∀ (d : D) (x : A.tateModule ℓ),
        e (A.tateModuleRep ℓ d x) = B.tateModuleRep ℓ (π d) (e x) := by
  sorry

/-! ### Required examples: χ_p, the split Tate curve, supersingular good reduction, a CM curve over Q, Frobenius conventions (ArithmeticGaloisRepresentations:R01.6/required-examples) -/

/-- ArithmeticGaloisRepresentations:R01.6/required-examples, (1), (3), (5): `χ_p(c) = −1`; on
`T_ℓE` for `y² = x³ − x` over `𝔽_5` the arithmetic Frobenius has characteristic polynomial
`X² + 2X + 5` and the local factor is `1 + 2T + 5T²`; for the supersingular `y² = x³ + 1` over
`𝔽_5`, `X² + 5`. (The Tate curve (2) is `tateCurve_inertia_unipotent` and
`localEulerFactor_tate_curve`; the CM statements (4) are owned by
ComplexMultiplicationAndExplicitReciprocity CM.4.) -/
theorem required_examples (p : ℕ) [Fact p.Prime] (v : InfinitePlace ℚ) (hv : v.IsReal)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 5) :
    ((GaloisRep.cyclotomicCharacter ℚ p (GaloisRep.complexConjugation ℚ v hv) : ℤ_[p]ˣ) : ℤ_[p])
        = -1 ∧
      LinearMap.charpoly (tateModule.map (qFrobenius (ofWeierstrass (cmCurve (ZMod 5)))) ℓ) =
        X ^ 2 + 2 * X + 5 ∧
      (LinearMap.charpoly
          (tateModule.map (qFrobenius (ofWeierstrass (cmCurve (ZMod 5)))) ℓ)).reverse =
        1 + 2 * X + 5 * X ^ 2 ∧
      LinearMap.charpoly
          (tateModule.map (qFrobenius (ofWeierstrass (curveX3Plus1 (ZMod 5)))) ℓ) =
        X ^ 2 + 5 := by
  sorry

end AbelianVariety

end AlgebraicGeometry

end TauCeti

/-! # The declarations of layer G7 -/
namespace TauCeti

open Polynomial
open scoped Matrix

/-! ## G7: operations on representations, polarizations, similitude groups and residual image
conditions

Instances below put the module topology on the carriers built in this stage (powers, tensor
products, Hom-modules and the adjoint submodule/quotient); finiteness and projectivity of these
carriers are roadmap targets and are proved by `sorry`. Helpers that are not packet names live in
the namespace `TauCeti.G7`. -/

section CarrierInstances

/-- The module topology on a finite tensor power `⨂[A] _ : ι, M`. -/
instance G7.piTensorTopologicalSpace {A : Type*} [CommRing A] [TopologicalSpace A]
    {ι : Type*} [Fintype ι] (M : Type*) [AddCommGroup M] [Module A M] :
    TopologicalSpace (⨂[A] _ : ι, M) :=
  moduleTopology A _

instance G7.piTensorIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A]
    {ι : Type*} [Fintype ι] (M : Type*) [AddCommGroup M] [Module A M] :
    IsModuleTopology A (⨂[A] _ : ι, M) :=
  ⟨rfl⟩

instance G7.piTensorFinite {A : Type*} [CommRing A] {ι : Type*} [Fintype ι] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] : Module.Finite A (⨂[A] _ : ι, M) :=
  sorry

instance G7.piTensorProjective {A : Type*} [CommRing A] {ι : Type*} [Fintype ι] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Projective A M] :
    Module.Projective A (⨂[A] _ : ι, M) :=
  sorry

/-- The module topology on the symmetric power `Sym[A]^d M`. -/
instance G7.symPowerTopologicalSpace {A : Type} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] (d : ℕ) : TopologicalSpace (Sym[A]^d M) :=
  moduleTopology A _

instance G7.symPowerIsModuleTopology {A : Type} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] (d : ℕ) : IsModuleTopology A (Sym[A]^d M) :=
  ⟨rfl⟩

instance G7.symPowerFinite {A : Type} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] (d : ℕ) : Module.Finite A (Sym[A]^d M) :=
  sorry

instance G7.symPowerProjective {A : Type} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Projective A M] (d : ℕ) : Module.Projective A (Sym[A]^d M) :=
  sorry

instance G7.symPowerFree {A : Type} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Free A M] (d : ℕ) : Module.Free A (Sym[A]^d M) :=
  sorry

/-- The module topology on the exterior power `⋀[A]^d M`. -/
instance G7.extPowerTopologicalSpace {A : Type*} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] (d : ℕ) : TopologicalSpace (⋀[A]^d M) :=
  moduleTopology A _

instance G7.extPowerIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] (d : ℕ) : IsModuleTopology A (⋀[A]^d M) :=
  ⟨rfl⟩

instance G7.extPowerProjective {A : Type*} [CommRing A] (M : Type*) [AddCommGroup M]
    [Module A M] [Module.Projective A M] (d : ℕ) : Module.Projective A (⋀[A]^d M) :=
  sorry

/-- The module topology on a Hom-module `M →ₗ[A] N` (in particular on `Module.End A M` and on
`Module.Dual A M`). -/
instance G7.linearMapTopologicalSpace {A : Type*} [CommRing A] [TopologicalSpace A] (M N : Type*)
    [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] :
    TopologicalSpace (M →ₗ[A] N) :=
  moduleTopology A _

instance G7.linearMapIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A]
    (M N : Type*) [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] :
    IsModuleTopology A (M →ₗ[A] N) :=
  ⟨rfl⟩

instance G7.linearMapFinite {A : Type*} [CommRing A] (M N : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] [AddCommGroup N] [Module A N] [Module.Finite A N] :
    Module.Finite A (M →ₗ[A] N) :=
  sorry

instance G7.linearMapProjective {A : Type*} [CommRing A] (M N : Type*) [AddCommGroup M]
    [Module A M] [Module.Finite A M] [Module.Projective A M] [AddCommGroup N] [Module A N]
    [Module.Projective A N] : Module.Projective A (M →ₗ[A] N) :=
  sorry

/-- The module topology on a tensor product `M ⊗[A] N`. -/
instance G7.tensorTopologicalSpace {A : Type*} [CommRing A] [TopologicalSpace A] (M N : Type*)
    [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] :
    TopologicalSpace (M ⊗[A] N) :=
  moduleTopology A _

instance G7.tensorIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A] (M N : Type*)
    [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] :
    IsModuleTopology A (M ⊗[A] N) :=
  ⟨rfl⟩

instance G7.tensorProjective {A : Type*} [CommRing A] (M N : Type*) [AddCommGroup M] [Module A M]
    [Module.Projective A M] [AddCommGroup N] [Module A N] [Module.Projective A N] :
    Module.Projective A (M ⊗[A] N) :=
  sorry

/-- The trace-zero submodule `ad⁰` carries the module topology. -/
instance G7.adZeroIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M] :
    IsModuleTopology A (LinearMap.ker (LinearMap.trace A M)) :=
  sorry

instance G7.adZeroFinite {A : Type*} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] :
    Module.Finite A (LinearMap.ker (LinearMap.trace A M)) :=
  sorry

instance G7.adZeroProjective {A : Type*} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] :
    Module.Projective A (LinearMap.ker (LinearMap.trace A M)) :=
  sorry

/-- The quotient `ad / A·1` carries the module topology. -/
instance G7.adQuotIsModuleTopology {A : Type*} [CommRing A] [TopologicalSpace A] (M : Type*)
    [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M] :
    IsModuleTopology A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) :=
  sorry

instance G7.adQuotProjective {A : Type*} [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] [Module.Projective A M] :
    Module.Projective A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) :=
  sorry

end CarrierInstances

namespace ContinuousRep

/-! ### Tensor, symmetric and exterior powers of continuous representations (ArithmeticGaloisRepresentations:G7/symmetric-and-exterior-powers) -/

section Powers

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- `Sym^d ρ` on the quotient (coinvariant) symmetric power `Sym[A]^d M`, acting through Tau
Ceti's `Representation.symmetricPower ρ d`; no invertibility of `d!` is assumed. -/
def symPower (ρ : ContinuousRep Γ A M) (d : ℕ) : ContinuousRep Γ A (Sym[A]^d M) := sorry

/-- `∧^d ρ` on `⋀[A]^d M`, acting through Tau Ceti's `Representation.exteriorPower ρ d`. -/
def extPower (ρ : ContinuousRep Γ A M) (d : ℕ) : ContinuousRep Γ A (⋀[A]^d M) := sorry

/-- `T^d ρ` on `⨂_{i : Fin d} M`, with `g ↦ ρ(g)^{⊗ d}`: the underlying action is Tau Ceti's
`Representation.tensorPower ρ d` (see `tensorPower_toRepresentation`). (The tensor product
`ρ ⊗ ρ'` of two representations is the shared R01.1 construction.) -/
def tensorPower (ρ : ContinuousRep Γ A M) (d : ℕ) : ContinuousRep Γ A (⨂[A] _ : Fin d, M) :=
  sorry

/-- `TauCeti.ContinuousRep.tensorPower_toRepresentation`: the underlying abstract representation
of `T^d ρ` is Tau Ceti's `Representation.tensorPower ρ d`, the diagonal action (stated on pure
tensors because Tau Ceti is not imported here). -/
theorem tensorPower_toRepresentation (ρ : ContinuousRep Γ A M) (d : ℕ) (g : Γ) (v : Fin d → M) :
    (ρ.tensorPower d) g (⨂ₜ[A] i, v i) = ⨂ₜ[A] i, ρ g (v i) := by
  sorry

omit [TopologicalSpace A] [Module.Finite A M] [Module.Projective A M] [TopologicalSpace M]
  [IsModuleTopology A M] in
/-- Ranks: `Sym^d M` has rank `binom(n+d−1, d)` and `∧^d M` has rank `binom(n, d)` for `M` free
of rank `n` over a nonzero ring. -/
theorem symPower_rank [Module.Free A M] [Module.Finite A M] [Nontrivial A] (d : ℕ) :
    Module.finrank A (Sym[A]^d M) = Nat.choose (Module.finrank A M + d - 1) d ∧
    Module.finrank A (⋀[A]^d M) = Nat.choose (Module.finrank A M) d := by
  sorry

/-- Functoriality: a `Γ`-map `f : M → N` gives `Sym^d f` and `∧^d f` (with `map_id`, `map_comp`). -/
def symPower_map {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N]
    {ρ : ContinuousRep Γ A M} {σ : ContinuousRep Γ A N} (f : ρ.Hom σ) (d : ℕ) :
    (ρ.symPower d).Hom (σ.symPower d) × (ρ.extPower d).Hom (σ.extPower d) :=
  sorry

omit [TopologicalSpace A] [Module.Finite A M] [Module.Projective A M] [TopologicalSpace M]
  [IsModuleTopology A M] in
/-- Coefficient extension: the canonical isomorphism `Sym^d_B(B ⊗_A M) ≅ B ⊗_A Sym^d_A M`
(through which `Sym^d(ρ ⊗_A B) ≅ (Sym^d ρ) ⊗_A B`; likewise for `∧^d`). -/
theorem symPower_baseChange (B : Type) [CommRing B] [Algebra A B] (d : ℕ) :
    ∃ e : Sym[B]^d (B ⊗[A] M) ≃ₗ[B] B ⊗[A] Sym[A]^d M, ∀ v : Fin d → M,
      e (⨂ₛ[B] i, ((1 : B) ⊗ₜ[A] v i)) = (1 : B) ⊗ₜ[A] (⨂ₛ[A] i, v i) := by
  sorry

/-- Characteristic polynomials of `Sym^d ρ(g)` and `∧^d ρ(g)` when `det(X − ρ(g))` splits over
`A`: roots are the `d`-fold products with (resp. without) repetition. No basis triangularising
`ρ(g)` is assumed to exist. The general statement (universal integer polynomials in the
coefficients of `det(X − ρ(g))`, for every commutative ring) is
ArithmeticGaloisRepresentations:G7/charpoly-of-symmetric-and-exterior-powers. -/
theorem charpoly_symPower [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) {n : ℕ}
    (α : Fin n → A) (h : ρ.charpoly g = ∏ i, (X - C (α i))) (d : ℕ) :
    (ρ.symPower d).charpoly g =
        ∏ s ∈ (Finset.univ : Finset (Fin n)).sym d, (X - C ((s : Multiset (Fin n)).map α).prod) ∧
      (ρ.extPower d).charpoly g =
        ∏ s ∈ (Finset.univ : Finset (Fin n)).powersetCard d, (X - C (∏ i ∈ s, α i)) := by
  sorry

/-- `∧^n ρ ≅ det ρ` as rank-one continuous representations (`n` the rank). -/
def extPowerTopEquivDet [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M) :
    (ρ.extPower (Module.finrank A M)).Iso (ofCharacter ⟨ρ.det, sorry⟩) :=
  sorry

/-- When `2 ∈ Aˣ`, the symmetriser and antisymmetriser give `ρ ⊗ ρ ≅ Sym^2 ρ ⊕ ∧^2 ρ`. -/
theorem tensorSquareEquiv [Invertible (2 : A)] (ρ : ContinuousRep Γ A M) :
    ∃ e : M ⊗[A] M ≃ₗ[A] (Sym[A]^2 M) × (⋀[A]^2 M), ∀ (g : Γ) (x : M ⊗[A] M),
      e (TensorProduct.map (ρ g) (ρ g) x) = ((ρ.symPower 2) g (e x).1, (ρ.extPower 2) g (e x).2) := by
  sorry

/-- The wedge pairing `∧^d M × ∧^{n−d} M → ∧^n M` is perfect and `Γ`-equivariant, whence
`∧^d ρ ≅ (∧^{n−d} ρ)^∨ ⊗ det ρ`. -/
theorem extPowerPairing [Module.Free A M] (ρ : ContinuousRep Γ A M) (d : ℕ)
    (_hd : d ≤ Module.finrank A M) :
    ∃ P : ⋀[A]^d M →ₗ[A] ⋀[A]^(Module.finrank A M - d) M →ₗ[A] ⋀[A]^(Module.finrank A M) M,
      (∀ x y, ((P x y : ⋀[A]^(Module.finrank A M) M) : ExteriorAlgebra A M) =
        (x : ExteriorAlgebra A M) * (y : ExteriorAlgebra A M)) ∧
      Function.Bijective P ∧
      ∀ (g : Γ) x y, P ((ρ.extPower d) g x) ((ρ.extPower _) g y) = (ρ.extPower _) g (P x y) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.symPower_zero. -/
example [IsTopologicalRing A] (ρ : ContinuousRep Γ A M) :
    Nonempty ((ρ.symPower 0).Iso (ContinuousRep.trivial (Γ := Γ) (A := A) (M := A))) ∧
    Nonempty ((ρ.extPower 0).Iso (ContinuousRep.trivial (Γ := Γ) (A := A) (M := A))) ∧
    Nonempty ((ρ.symPower 1).Iso ρ) ∧ Nonempty ((ρ.extPower 1).Iso ρ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.extPower_top. -/
example [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M) (_h : Module.finrank A M = 3) :
    Nonempty ((ρ.extPower 3).Iso (ofCharacter ⟨ρ.det, sorry⟩)) ∧ Subsingleton (⋀[A]^4 M) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.charpoly_symPower_two. -/
example [Module.Free A M] (ρ : ContinuousRep Γ A M) (g : Γ) (α β : A)
    (_h : ρ.charpoly g = (X - C α) * (X - C β)) :
    (ρ.symPower 2).charpoly g = (X - C (α ^ 2)) * (X - C (α * β)) * (X - C (β ^ 2)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.symPower_toRepresentation. -/
example (ρ : ContinuousRep Γ A M) (d : ℕ) (g : Γ) (v : Fin d → M) :
    (ρ.symPower d) g (⨂ₛ[A] i, v i) = (⨂ₛ[A] i, ρ g (v i)) ∧
    (ρ.extPower d) g (exteriorPower.ιMulti A d v) =
      exteriorPower.ιMulti A d (fun i => ρ g (v i)) := by
  sorry

/- TauCeti.ContinuousRep.symPower_not_dual_char_p (unit test, comment fallback): over `F_3`, for
`V` the standard representation of `GL_2(F_3)`, `Sym^3 V` is not isomorphic to
`(Sym^3 V)^∨ ⊗ det^3`: `V ≅ V^∨ ⊗ det` is a quotient of the right-hand side (dual to the
subrepresentation `⟨x^3, y^3⟩ ≅ V` of `Sym^3 V`), while `Hom_{GL_2(F_3)}(Sym^3 V, V) = 0`. Since
`(Sym^3 V)^∨ ⊗ det^3 ≅ Γ^3 V`, a definition of `Sym^d` as symmetric invariant tensors (or as the
divided power) fails. (Over `F_2` the analogous statement for `Sym^2` is false:
`Sym^2 V = ⟨x^2, y^2⟩ ⊕ ⟨x^2 + xy + y^2⟩`.) Needs the dual and twist of R01.1, owned by another
section. -/

end Powers

/-! ### Characteristic polynomials of the symmetric and exterior powers of an endomorphism (universal identity) (ArithmeticGaloisRepresentations:G7/charpoly-of-symmetric-and-exterior-powers) -/

/-- ArithmeticGaloisRepresentations:G7/charpoly-of-symmetric-and-exterior-powers, exterior half in
product form: if `det(X − f) = ∏ (X − α_i)` for an endomorphism `f` of a finite free module, then
`det(X − ∧^d f) = ∏_{|s| = d} (X − ∏_{i ∈ s} α_i)`. No basis triangularising `f` is assumed. The
node states more: the coefficients of `det(X − ∧^d f)` are the values of universal integer
polynomials `E_{n,d}` at those of `det(X − f)`, over every commutative ring. -/
theorem _root_.TauCeti.G7.charpoly_exteriorPower_map {R : Type*} [CommRing R] {N : Type*}
    [AddCommGroup N] [Module R N] [Module.Free R N] [Module.Finite R N] (f : N →ₗ[R] N) {n : ℕ}
    (α : Fin n → R) (_h : f.charpoly = ∏ i, (X - C (α i))) (d : ℕ) :
    (exteriorPower.map d f).charpoly =
      ∏ s ∈ (Finset.univ : Finset (Fin n)).powersetCard d, (X - C (∏ i ∈ s, α i)) := by
  sorry

/- ArithmeticGaloisRepresentations:G7/charpoly-of-symmetric-and-exterior-powers, symmetric half
(comment block: the map `Sym^d f` on `Sym[R]^d N` is Tau Ceti's `SymmetricPower.map`, which is not
in Mathlib): for `R : Type`, `N` finite free of rank `n` and `f : N → N` with
`det(X − f) = ∏ (X − α_i)`, `det(X − Sym^d f) = ∏_{i_1 ≤ … ≤ i_d} (X − α_{i_1} ⋯ α_{i_d})`; in
general `det(X − Sym^d f) = S_{n,d}(c_1(f), …, c_n(f); X)` for a universal
`S_{n,d} ∈ ℤ[c_1, …, c_n][X]`. The statement for `Sym^d ρ(g)` is `charpoly_symPower` above. -/

/-! ### Tensor induction from an open subgroup (Asai representation in index two) (ArithmeticGaloisRepresentations:G7/tensor-induction) -/

section TensorInduction

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {V : Type*} [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V]
  [TopologicalSpace V] [IsModuleTopology A V]

/-- The tensor induction `⊗-Ind_H^Γ ρ` on `⨂_{Γ/H} V` for an open subgroup `H` and a chosen
transversal `t` (a section of `Γ → Γ/H`): `g` sends `⊗ v_q` to the tensor with `ρ(h_q(g)) v_q`
in slot `g q`, where `g t_q = t_{gq} h_q(g)`. -/
def tensorInd (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (t : Γ ⧸ H → Γ)
    (_ht : ∀ q, (t q : Γ ⧸ H) = q) (ρ : ContinuousRep H A V) :
    ContinuousRep Γ A (⨂[A] _ : Γ ⧸ H, V) :=
  sorry

/-- The canonical isomorphism between the tensor inductions for two transversals. -/
def tensorIndEquivOfTransversal (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (t t' : Γ ⧸ H → Γ)
    (ht : ∀ q, (t q : Γ ⧸ H) = q) (ht' : ∀ q, (t' q : Γ ⧸ H) = q) (ρ : ContinuousRep H A V) :
    (tensorInd H t ht ρ).Iso (tensorInd H t' ht' ρ) :=
  sorry

omit [TopologicalSpace A] [Module.Finite A V] [Module.Projective A V] [TopologicalSpace V]
  [IsModuleTopology A V] in
/-- `⊗-Ind_H^Γ V` has rank `(rank V)^{[Γ : H]}`. -/
theorem tensorInd_rank [Module.Free A V] [Module.Finite A V] [Nontrivial A] (H : Subgroup Γ)
    [Fintype (Γ ⧸ H)] :
    Module.finrank A (⨂[A] _ : Γ ⧸ H, V) = Module.finrank A V ^ H.index := by
  sorry

/- TauCeti.ContinuousRep.tensorInd_tprod (comment fallback): `⊗-Ind(ρ ⊗ ρ') ≅ ⊗-Ind ρ ⊗ ⊗-Ind ρ'`;
the tensor product of two continuous representations is the R01.1 construction of another
section. -/

/-- For `H` normal, `(⊗-Ind_H^Γ ρ)|_H ≅ ⊗_q ρ^{t_q}` with `ρ^t(h) = ρ(t⁻¹ h t)`. -/
theorem tensorInd_restrict_normal (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (hN : H.Normal)
    (t : Γ ⧸ H → Γ) (ht : ∀ q, (t q : Γ ⧸ H) = q) (ρ : ContinuousRep H A V) (h : H)
    (v : Γ ⧸ H → V) :
    tensorInd H t ht ρ (h : Γ) (⨂ₜ[A] q, v q) =
      ⨂ₜ[A] q, ρ ⟨(t q)⁻¹ * h * t q, hN.conj_mem' _ h.2 _⟩ (v q) := by
  sorry

/- TauCeti.ContinuousRep.trace_tensorInd (comment fallback): for `g` with cycles `C_1, …, C_r`
of lengths `ℓ_j` on `Γ/H` starting at `t_{i_j} H`,
`tr(⊗-Ind ρ)(g) = ∏_j tr ρ(t_{i_j}⁻¹ g^{ℓ_j} t_{i_j})`. -/

/-- `TauCeti.ContinuousRep.tensorInd_apply_tprod`: the action on pure tensors. With
`g t_q = t_{gq} h_q(g)`, the slot `q` of `g · ⊗ v` is `ρ(h_{g⁻¹q}(g)) v_{g⁻¹q}`, where
`h_{g⁻¹q}(g) = t_q⁻¹ g t_{g⁻¹q} ∈ H` (the membership is left as `sorry` inside the statement). -/
theorem tensorInd_apply_tprod (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (t : Γ ⧸ H → Γ)
    (ht : ∀ q, (t q : Γ ⧸ H) = q) (ρ : ContinuousRep H A V) (g : Γ) (v : Γ ⧸ H → V) :
    tensorInd H t ht ρ g (⨂ₜ[A] q, v q) =
      ⨂ₜ[A] q, ρ ⟨(t q)⁻¹ * g * t (g⁻¹ • q), sorry⟩ (v (g⁻¹ • q)) := by
  sorry

/- TauCeti.ContinuousRep.tensorInd_baseChange (comment fallback):
`(⊗-Ind_H^Γ ρ) ⊗_A B ≅ ⊗-Ind_H^Γ(ρ ⊗_A B)` for a continuous `A → B` (coefficient extension is the
R01.1 construction of another section). -/

/- TauCeti.ContinuousRep.charpoly_tensorInd (comment fallback): for `V` free, `det(X − (⊗-Ind ρ)(g))`
is the universal polynomial in the coefficients of the `det(X − ρ(t_{i_j}⁻¹ g^{ℓ_j} t_{i_j}))`, `j`
over the cycles of `g` on `Γ/H`, whose roots are the products over `j` of the roots of
`C_{n,ℓ_j}` (ArithmeticGaloisRepresentations:G7/charpoly-of-cyclically-permuted-tensor-product).
The index-two case is `charpoly_asai` below. -/

/- TauCeti.ContinuousRep.tensorInd_trans (comment fallback): transitivity
`⊗-Ind_K^Γ ⊗-Ind_H^K ≅ ⊗-Ind_H^Γ` for `H ≤ K ≤ Γ` open, and functoriality in `Γ`-maps. -/

/-- The Asai representation `As(ρ) := ⊗-Ind_H^Γ ρ` for `[Γ : H] = 2` (e.g. `H = G_K ⊂ G_F = Γ`,
`K/F` quadratic) with transversal `{1, σ}`; `As(ρ) ⊗ η_{K/F}` is a second extension of
`ρ ⊗ ρ^σ` (the only other one, up to isomorphism, when `A` is a field and `ρ ⊗ ρ^σ` is absolutely
irreducible). -/
def asai (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (_h2 : H.index = 2) (σ : Γ) (_hσ : σ ∉ H)
    (ρ : ContinuousRep H A V) : ContinuousRep Γ A (⨂[A] _ : Γ ⧸ H, V) :=
  sorry

/-- `TauCeti.ContinuousRep.charpoly_asai`, the case `g ∉ H`: if `det(X − ρ(g²)) = ∏ (X − β_i)`
then `det(X − As(ρ)(g)) = ∏_i (X − β_i) · ∏_{i<j} (X² − β_i β_j)`. For `g ∈ H` the roots are the
products `α_i α'_j` of the roots of `det(X − ρ(g))` and `det(X − ρ(σ⁻¹ g σ))` (not stated here).
Freeness of the tensor power is taken as an instance argument. -/
theorem charpoly_asai [Module.Free A V] (H : Subgroup Γ) [Fintype (Γ ⧸ H)]
    [Module.Free A (⨂[A] _ : Γ ⧸ H, V)] (h2 : H.index = 2) (σ : Γ) (hσ : σ ∉ H)
    (ρ : ContinuousRep H A V) (g : Γ) (_hg : g ∉ H) (hg2 : g ^ 2 ∈ H) {n : ℕ} (β : Fin n → A)
    (_hβ : ρ.charpoly ⟨g ^ 2, hg2⟩ = ∏ i, (X - C (β i))) :
    (asai H h2 σ hσ ρ).charpoly g =
      (∏ i, (X - C (β i))) *
        ∏ p ∈ (Finset.univ : Finset (Fin n × Fin n)).filter (fun p => p.1 < p.2),
          (X ^ 2 - C (β p.1 * β p.2)) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.tensorInd_index_one. -/
example [Fintype (Γ ⧸ (⊤ : Subgroup Γ))] (t : Γ ⧸ (⊤ : Subgroup Γ) → Γ)
    (ht : ∀ q, (t q : Γ ⧸ (⊤ : Subgroup Γ)) = q) (ρ : ContinuousRep Γ A V) :
    Nonempty ((tensorInd ⊤ t ht (ρ.res ⟨(⊤ : Subgroup Γ).subtype, continuous_subtype_val⟩)).Iso
      ρ) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.tensorInd_character. -/
example [IsTopologicalRing A] (H : Subgroup Γ) [Fintype (Γ ⧸ H)] [H.FiniteIndex] (t : Γ ⧸ H → Γ)
    (ht : ∀ q, (t q : Γ ⧸ H) = q) (ψ : H →ₜ* Aˣ) (g : Γ) (x : ⨂[A] _ : Γ ⧸ H, A) :
    tensorInd H t ht (ofCharacter ψ) g x = ((MonoidHom.transfer ψ.toMonoidHom g : Aˣ) : A) • x := by
  sorry

/- TauCeti.ContinuousRep.asai_restrict (unit test, comment fallback): for `[Γ : H] = 2` and
`σ ∈ Γ ∖ H`, `As(ρ)|_H ≅ ρ ⊗ ρ^σ`, of rank `n^2` (needs the R01.1 tensor product). -/

/- TauCeti.ContinuousRep.tensorInd_ne_ind (unit test, comment fallback): for `Γ = Z/2`, `H = 1`,
`A` a ring in which `2 ≠ 0` and `V = A^2` with trivial action, `⊗-Ind V = V ⊗ V` has rank 4 and
the generator acts by the swap, of trace 2, while `Ind V` has rank 4 and the generator has trace 0
(needs R01.1 induction). -/

/-- Unit test: TauCeti.ContinuousRep.charpoly_asai_outside_rank_two. -/
example [Module.Free A V] (H : Subgroup Γ) [Fintype (Γ ⧸ H)] [Module.Free A (⨂[A] _ : Γ ⧸ H, V)]
    (h2 : H.index = 2) (σ : Γ) (hσ : σ ∉ H) (ρ : ContinuousRep H A V) (g : Γ) (_hg : g ∉ H)
    (hg2 : g ^ 2 ∈ H) (a b : A) (_h : ρ.charpoly ⟨g ^ 2, hg2⟩ = X ^ 2 - C a * X + C b) :
    (asai H h2 σ hσ ρ).charpoly g = (X ^ 2 - C a * X + C b) * (X ^ 2 - C b) := by
  sorry

/-! ### Tensor induction does not depend on the transversal (ArithmeticGaloisRepresentations:G7/tensor-induction-independent-of-transversal) -/

/-- ArithmeticGaloisRepresentations:G7/tensor-induction-independent-of-transversal, part (2): for
two transversals `t, t'` (so `t'_q = t_q u_q` with `u_q = t_q⁻¹ t'_q ∈ H`) the map
`⨂ ρ(u_q)⁻¹ = ⨂ ρ(t'_q⁻¹ t_q)` is an isomorphism between the two models of `⊗-Ind_H^Γ ρ`. The
membership `t'_q⁻¹ t_q ∈ H` is left as `sorry` inside the statement; parts (1) and (3), the
cocycle identity `h_q(g'g) = h_{gq}(g') h_q(g)` and `T_{t',t''} ∘ T_{t,t'} = T_{t,t''}`, are
stated in the roadmap. -/
theorem tensorInd_transversal_intertwiner (H : Subgroup Γ) [Fintype (Γ ⧸ H)] (t t' : Γ ⧸ H → Γ)
    (ht : ∀ q, (t q : Γ ⧸ H) = q) (ht' : ∀ q, (t' q : Γ ⧸ H) = q) (ρ : ContinuousRep H A V) :
    ∃ e : (tensorInd H t ht ρ).Iso (tensorInd H t' ht' ρ), ∀ v : Γ ⧸ H → V,
      e.toLinearEquiv (⨂ₜ[A] q, v q) = ⨂ₜ[A] q, ρ ⟨(t' q)⁻¹ * t q, sorry⟩ (v q) := by
  sorry

/-! ### Characteristic polynomials of tensor products and of cyclically permuted tensor products of linear maps (ArithmeticGaloisRepresentations:G7/charpoly-of-cyclically-permuted-tensor-product) -/

/-- ArithmeticGaloisRepresentations:G7/charpoly-of-cyclically-permuted-tensor-product, part (1)
for `ℓ = 2`: the trace of `v ⊗ w ↦ A₂ w ⊗ A₁ v` is `tr(A₂ A₁)`. -/
theorem _root_.TauCeti.G7.trace_swap_tensor {R : Type*} [CommRing R] {W : Type*} [AddCommGroup W]
    [Module R W] [Module.Free R W] [Module.Finite R W] (A₁ A₂ : W →ₗ[R] W) :
    LinearMap.trace R (W ⊗[R] W)
        (TensorProduct.map A₂ A₁ ∘ₗ (TensorProduct.comm R W W).toLinearMap) =
      LinearMap.trace R W (A₂ ∘ₗ A₁) := by
  sorry

/-- Part (2) for `ℓ = 2`: if `det(X − A₂ A₁) = ∏ (X − β_i)` then the characteristic polynomial
of `v ⊗ w ↦ A₂ w ⊗ A₁ v` is `∏_i (X − β_i) · ∏_{i<j} (X² − β_i β_j)`. -/
theorem _root_.TauCeti.G7.charpoly_swap_tensor {R : Type*} [CommRing R] {W : Type*}
    [AddCommGroup W] [Module R W] [Module.Free R W] [Module.Finite R W] (A₁ A₂ : W →ₗ[R] W) {n : ℕ}
    (β : Fin n → R) (_h : (A₂ ∘ₗ A₁).charpoly = ∏ i, (X - C (β i))) :
    (TensorProduct.map A₂ A₁ ∘ₗ (TensorProduct.comm R W W).toLinearMap).charpoly =
      (∏ i, (X - C (β i))) *
        ∏ p ∈ (Finset.univ : Finset (Fin n × Fin n)).filter (fun p => p.1 < p.2),
          (X ^ 2 - C (β p.1 * β p.2)) := by
  sorry

/-- Part (4): the characteristic polynomial of a tensor product of endomorphisms of finite free
modules has as roots the pairwise products of the roots. -/
theorem _root_.TauCeti.G7.charpoly_tensor_map {R : Type*} [CommRing R] {W W' : Type*}
    [AddCommGroup W] [Module R W] [Module.Free R W] [Module.Finite R W] [AddCommGroup W']
    [Module R W'] [Module.Free R W'] [Module.Finite R W'] (B : W →ₗ[R] W) (B' : W' →ₗ[R] W')
    {n n' : ℕ} (α : Fin n → R) (α' : Fin n' → R) (_h : B.charpoly = ∏ i, (X - C (α i)))
    (_h' : B'.charpoly = ∏ j, (X - C (α' j))) :
    (TensorProduct.map B B').charpoly = ∏ i, ∏ j, (X - C (α i * α' j)) := by
  sorry

/- ArithmeticGaloisRepresentations:G7/charpoly-of-cyclically-permuted-tensor-product, general
`ℓ` (comment block): for `A_i : V_i → V_{i+1}` (indices mod `ℓ`, all `V_i` free of rank `n`) and
`T(v_1 ⊗ … ⊗ v_ℓ) = A_ℓ v_ℓ ⊗ A_1 v_1 ⊗ … ⊗ A_{ℓ−1} v_{ℓ−1}`, with `B = A_ℓ ∘ … ∘ A_1`:
`tr T = tr B` and `det(X − T) = C_{n,ℓ}(c(B); X)`, where
`C_{n,ℓ}(e(β); X) = ∏_O (X^{|O|} − β_{j_1} ⋯ β_{j_{|O|}})` over the orbits `O ∋ (j_1, …, j_ℓ)` of the
cyclic shift on `{1, …, n}^ℓ`. -/

end TensorInduction

/-! ### Restriction of scalars of the coefficients (ArithmeticGaloisRepresentations:G7/restriction-of-scalars) -/

section RestrictionOfScalars

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A] {B : Type*} [CommRing B] [TopologicalSpace B]
  [Algebra A B]
  {M : Type*} [AddCommGroup M] [Module B M] [Module.Finite B M] [Module.Projective B M]
  [TopologicalSpace M] [IsModuleTopology B M]

/-- `Res_{B/A} ρ`: the carrier `M` regarded as an `A`-module (finite projective, with the
`A`-module topology, as `B` is finite projective over `A` with its module topology), same action. -/
def resScalars [Module A M] [IsScalarTower A B M] [Module.Finite A M] [Module.Projective A M]
    [IsModuleTopology A M] (ρ : ContinuousRep Γ B M) : ContinuousRep Γ A M :=
  ⟨{ toFun := fun g => (ρ g).restrictScalars A
     map_one' := sorry
     map_mul' := sorry }, sorry⟩

omit [TopologicalSpace A] [TopologicalSpace B] [Module.Projective B M] [TopologicalSpace M]
  [IsModuleTopology B M] in
/-- `rank_A Res_{B/A} M = rank_A B · rank_B M`. -/
theorem resScalars_rank [Module A M] [IsScalarTower A B M] [Module.Free A B] [Module.Finite A B]
    [Module.Free B M] :
    Module.finrank A M = Module.finrank A B * Module.finrank B M := by
  sorry

/-- `det_A(X − ρ(g)) = N_{(Polynomial B)/(Polynomial A)} det_B(X − ρ(g))`, for `B` free over `A` and
`M` free over `B` (`LinearMap.charpoly` takes `Module.Free` and `Module.Finite` as instances; for
finite projective modules the identity is read Zariski-locally on `A`, with the characteristic
polynomial of R01.2/frobenius-characteristic-polynomial). -/
theorem charpoly_resScalars [Module A M] [IsScalarTower A B M] [Module.Finite A M]
    [Module.Projective A M] [IsModuleTopology A M] [Module.Free A B] [Module.Finite A B]
    [Module.Free B M] [Module.Free A M] (ρ : ContinuousRep Γ B M) (g : Γ) :
    letI : Algebra (Polynomial A) (Polynomial B) := (Polynomial.mapRingHom (algebraMap A B)).toAlgebra
    (resScalars (A := A) ρ).charpoly g = Algebra.norm (Polynomial A) (ρ.charpoly g) := by
  sorry

/-- `B`-linear `Γ`-maps are `A`-linear `Γ`-maps (with `map_id`, `map_comp`). -/
def resScalars_map [Module A M] [IsScalarTower A B M] [Module.Finite A M] [Module.Projective A M]
    [IsModuleTopology A M] {N : Type*} [AddCommGroup N] [Module B N] [Module.Finite B N]
    [Module.Projective B N] [TopologicalSpace N] [IsModuleTopology B N] [Module A N]
    [IsScalarTower A B N] [Module.Finite A N] [Module.Projective A N] [IsModuleTopology A N]
    {ρ : ContinuousRep Γ B M} {σ : ContinuousRep Γ B N} (f : ρ.Hom σ) :
    (resScalars (A := A) ρ).Hom (resScalars (A := A) σ) :=
  ⟨f.toLinearMap.restrictScalars A, sorry⟩

/- TauCeti.ContinuousRep.resScalarsBaseChangeEquiv (comment fallback): when `A'` splits the étale
`A`-algebra `B` (`B ⊗_A A' ≅ ∏_{σ ∈ Hom_A(B, A')} A'`),
`(Res_{B/A} ρ) ⊗_A A' ≅ ⊕_σ ρ ⊗_{B,σ} A'` (coefficient extension is the R01.1 construction). -/

/-- Transitivity `Res_{C/A} = Res_{B/A} ∘ Res_{C/B}`. -/
theorem resScalars_trans [Module A M] [IsScalarTower A B M] [Module.Finite A M]
    [Module.Projective A M] [IsModuleTopology A M] {C : Type*} [CommRing C] [TopologicalSpace C]
    [Algebra B C] [Algebra A C] [IsScalarTower A B C] [Module C M] [IsScalarTower B C M]
    [IsScalarTower A C M] [Module.Finite C M] [Module.Projective C M] [IsModuleTopology C M]
    (ρ : ContinuousRep Γ C M) :
    resScalars (A := A) (resScalars (A := B) ρ) = resScalars (A := A) ρ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.resScalars_self. -/
example (ρ : ContinuousRep Γ B M) : resScalars (A := B) ρ = ρ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.charpoly_resScalars_quadratic (for `B` free of rank two over
`A`, e.g. `A[√d]`, and a character `ψ`: `det_A(X − ψ(g)) = X^2 − (ψ(g) + ψ(g)^σ) X + ψ(g) ψ(g)^σ`). -/
example [IsTopologicalRing B] [Module.Free A B] [Module.Finite A B] [IsModuleTopology A B]
    (_h2 : Module.finrank A B = 2) (ψ : Γ →ₜ* Bˣ) (g : Γ) :
    (resScalars (A := A) (ofCharacter ψ)).charpoly g =
      X ^ 2 - C (Algebra.trace A B (ψ g : B)) * X + C (Algebra.norm A (ψ g : B)) := by
  sorry

/- TauCeti.ContinuousRep.resScalars_baseChange_split (unit test, comment fallback): if
`B ⊗_A A' ≅ A' × A'` then `(Res_{B/A} ρ) ⊗_A A' ≅ ρ ⊗_{σ_1} A' ⊕ ρ ⊗_{σ_2} A'`. -/

/- TauCeti.ContinuousRep.resScalars_ne_ind (unit test, comment fallback): for `B = A × A` and `ρ`
the trivial character of `Γ` on `B`, `Res_{B/A} ρ` is the trivial representation of `Γ` on `A^2`;
for an open subgroup `H` of index 2, `Ind_H^Γ` of the trivial character is `A[Γ/H]`, on which `Γ`
permutes the two basis vectors non-trivially: restriction of scalars of the coefficients is not
induction along the group (needs R01.1 induction). -/

end RestrictionOfScalars

/-! ### The adjoint representation, the trace kernel and the quotient by scalars (ArithmeticGaloisRepresentations:G7/adjoint-representations) -/

section Adjoint

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- `ad ρ` on `End_A(M)` by conjugation: Mathlib's `Representation.linHom ρ ρ`. -/
def ad (ρ : ContinuousRep Γ A M) : ContinuousRep Γ A (Module.End A M) :=
  ⟨Representation.linHom ρ.toRepresentation ρ.toRepresentation, sorry⟩

/-- `TauCeti.ContinuousRep.endTrace`: the trace `End_R(N) → R` of a finite projective module, by
contraction: `contractLeft ∘ (dualTensorHomEquiv R N N)⁻¹`, i.e. `φ ⊗ m ↦ φ(m)`. Mathlib's
`LinearMap.trace R N` is `0` by definition when `N` has no finite basis, so it is not used for the
trace kernel; the two agree for `N` free (unit test `endTrace_eq_trace_of_free`). Further
properties (`tr(XY) = tr(YX)`, `tr(1) = n` in constant rank `n`, base change) are in the roadmap. -/
def endTrace (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N]
    [Module.Finite R N] [Module.Projective R N] : Module.End R N →ₗ[R] R :=
  contractLeft R N ∘ₗ (dualTensorHomEquiv R N N).symm.toLinearMap

/-- The trace kernel `ker endTrace` carries the module topology. -/
instance _root_.TauCeti.G7.endTraceKerIsModuleTopology {R : Type*} [CommRing R]
    [TopologicalSpace R] (N : Type*) [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] : IsModuleTopology R (LinearMap.ker (endTrace R N)) :=
  sorry

instance _root_.TauCeti.G7.endTraceKerFinite {R : Type*} [CommRing R] (N : Type*)
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] :
    Module.Finite R (LinearMap.ker (endTrace R N)) :=
  sorry

instance _root_.TauCeti.G7.endTraceKerProjective {R : Type*} [CommRing R] (N : Type*)
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] :
    Module.Projective R (LinearMap.ker (endTrace R N)) :=
  sorry

/-- `ad⁰ ρ := ker (tr : ad ρ → A)` (the `sl`-module), with `tr = endTrace` the contraction trace
(equal to `LinearMap.trace` when `M` is free). -/
def adZero (ρ : ContinuousRep Γ A M) :
    ContinuousRep Γ A (LinearMap.ker (endTrace A M)) :=
  ⟨ρ.ad.toRepresentation.subrepresentation _ (by sorry), sorry⟩

/-- `ad ρ / A·1`, the quotient by the scalars (the `pgl`-module). -/
def adQuot (ρ : ContinuousRep Γ A M) :
    ContinuousRep Γ A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) :=
  ⟨ρ.ad.toRepresentation.quotient _ (by sorry), sorry⟩

/-- `ad ρ ≅ ρ ⊗ ρ^∨`. -/
theorem adEquivTensorDual (ρ : ContinuousRep Γ A M) :
    ∃ e : M ⊗[A] Module.Dual A M ≃ₗ[A] Module.End A M, ∀ (g : Γ) (x : M ⊗[A] Module.Dual A M),
      e (TensorProduct.map (ρ g) (Representation.dual ρ.toRepresentation g) x) = ρ.ad g (e x) := by
  sorry

/-- The trace pairing on `ad ρ` is perfect and `Γ`-invariant, and induces
`ad⁰ ρ ≅ (ad ρ / A·1)^∨` for every `A` (perfectness is
ArithmeticGaloisRepresentations:G7/trace-pairing-on-matrices-is-perfect). -/
theorem tracePairing_perfect (ρ : ContinuousRep Γ A M) :
    Function.Bijective (fun X : Module.End A M => endTrace A M ∘ₗ LinearMap.mulLeft A X) ∧
    (∀ (g : Γ) (X Y : Module.End A M),
      endTrace A M (ρ.ad g X * ρ.ad g Y) = endTrace A M (X * Y)) ∧
    ∃ e : LinearMap.ker (endTrace A M) ≃ₗ[A]
        Module.Dual A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}),
      ∀ X Y, e X (Submodule.Quotient.mk Y) = endTrace A M ((X : Module.End A M) * Y) := by
  sorry

omit [TopologicalSpace A] [TopologicalSpace M] [IsModuleTopology A M] in
/-- If `n ∈ Aˣ`: `ad = A·1 ⊕ ad⁰`, `ad⁰ → ad/A·1` is an isomorphism, and the trace pairing is
perfect on `ad⁰` (so `ad⁰ ρ` is self-dual); the decomposition is one of subrepresentations. -/
theorem adDecomp_of_invertible [Module.Free A M] [Invertible (Module.finrank A M : A)] :
    IsCompl (LinearMap.ker (endTrace A M)) (Submodule.span A {(1 : Module.End A M)}) ∧
    Function.Bijective ((Submodule.span A {(1 : Module.End A M)}).mkQ ∘ₗ
      (LinearMap.ker (endTrace A M)).subtype) ∧
    Function.Bijective (fun X : LinearMap.ker (endTrace A M) =>
      (endTrace A M ∘ₗ LinearMap.mulLeft A (X : Module.End A M)) ∘ₗ
        (LinearMap.ker (endTrace A M)).subtype) := by
  sorry

omit [TopologicalSpace A] [TopologicalSpace M] [IsModuleTopology A M] in
/-- `1 ∈ ad⁰ ρ` iff `n = 0` in `A`. -/
theorem one_mem_adZero_iff [Module.Free A M] :
    (1 : Module.End A M) ∈ LinearMap.ker (endTrace A M) ↔
      (Module.finrank A M : A) = 0 := by
  sorry

omit [TopologicalSpace A] [TopologicalSpace M] [IsModuleTopology A M] in
/-- `TauCeti.ContinuousRep.adZero_to_adQuot_ker_coker`: for `M` free of rank `n ≥ 1` and every
`A`, the natural map `ad⁰ → ad/A·1` has kernel `A[n]·1` and cokernel `A/nA`; it is bijective iff
`n ∈ Aˣ`. -/
theorem adZero_to_adQuot_ker_coker [Module.Free A M] (_hn : 0 < Module.finrank A M) :
    (∀ X : LinearMap.ker (endTrace A M),
      (Submodule.span A {(1 : Module.End A M)}).mkQ (X : Module.End A M) = 0 ↔
        ∃ a : A, (Module.finrank A M : A) * a = 0 ∧ (X : Module.End A M) = a • 1) ∧
    (∀ Y : Module.End A M,
      (∃ X : LinearMap.ker (endTrace A M),
        (Submodule.span A {(1 : Module.End A M)}).mkQ (X : Module.End A M) =
          (Submodule.span A {(1 : Module.End A M)}).mkQ Y) ↔
        ∃ a : A, endTrace A M Y = (Module.finrank A M : A) * a) ∧
    (Function.Bijective ((Submodule.span A {(1 : Module.End A M)}).mkQ ∘ₗ
        (LinearMap.ker (endTrace A M)).subtype) ↔ IsUnit (Module.finrank A M : A)) := by
  sorry

/-- `ad` commutes with restriction along continuous homomorphisms (the coefficient-extension and
twist-invariance halves use the R01.1 base change and twist of another section). -/
theorem ad_baseChange {Γ' : Type*} [Group Γ'] [TopologicalSpace Γ'] (φ : Γ' →ₜ* Γ)
    (ρ : ContinuousRep Γ A M) : (ρ.res φ).ad = ρ.ad.res φ := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ad_rank_one. -/
example [Module.Free A M] (ρ : ContinuousRep Γ A M) (_h : Module.finrank A M = 1) :
    (∀ g, ρ.ad g = LinearMap.id) ∧ Subsingleton (LinearMap.ker (endTrace A M)) ∧
    Subsingleton (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.adZero_dual_adQuot. -/
example (ρ : ContinuousRep Γ A M) :
    ∃ e : LinearMap.ker (endTrace A M) ≃ₗ[A]
        Module.Dual A (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}),
      (∀ X Y, e X (Submodule.Quotient.mk Y) = endTrace A M ((X : Module.End A M) * Y)) ∧
      ∀ (g : Γ) X Y, e (ρ.adZero g X) (ρ.adQuot g Y) = e X Y := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.ad_eq_linHom. -/
example (ρ : ContinuousRep Γ A M) :
    ρ.ad.toRepresentation = Representation.linHom ρ.toRepresentation ρ.toRepresentation := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.scalar_mem_adZero_char_two. Over `F_2` in rank two the
identity lies in `ad⁰` and the natural map `ad⁰ → ad/k·1` is not injective. -/
example {N : Type*} [AddCommGroup N] [Module (ZMod 2) N] [Module.Free (ZMod 2) N]
    [Module.Finite (ZMod 2) N] (_h : Module.finrank (ZMod 2) N = 2) :
    (1 : Module.End (ZMod 2) N) ∈ LinearMap.ker (endTrace (ZMod 2) N) ∧
    ¬ Function.Injective ((Submodule.span (ZMod 2) {(1 : Module.End (ZMod 2) N)}).mkQ ∘ₗ
      (LinearMap.ker (endTrace (ZMod 2) N)).subtype) := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.endTrace_eq_trace_of_free. -/
example (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N] [Module.Free R N]
    [Module.Finite R N] : endTrace R N = LinearMap.trace R N := by
  sorry

/-- Unit test: TauCeti.ContinuousRep.endTrace_ne_trace_of_not_free, general half: Mathlib's
`LinearMap.trace` vanishes on a finite projective module that is not free (while `endTrace` of the
identity of a module of constant rank `n` is `n`). The instance of the packet, `R = ℤ[√−5]` and
`N = (2, 1 + √−5)` with `endTrace (id) = 1 ≠ 0 = LinearMap.trace (id)`, needs the projectivity of
that ideal, which Mathlib does not provide as an instance. -/
example (R : Type*) [CommRing R] (N : Type*) [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] (_h : ¬ Module.Free R N) : LinearMap.trace R N = 0 := by
  sorry

end Adjoint

section AdjointSymSq

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- Unit test: TauCeti.ContinuousRep.adZero_equiv_symSq. -/
example [Module.Free A M] [Invertible (2 : A)] (ρ : ContinuousRep Γ A M)
    (_h : Module.finrank A M = 2) :
    ∃ e : LinearMap.ker (endTrace A M) ≃ₗ[A] Sym[A]^2 M, ∀ (g : Γ) X,
      e (ρ.adZero g X) = (((ρ.det g)⁻¹ : Aˣ) : A) • (ρ.symPower 2) g (e X) := by
  sorry

/-- `TauCeti.ContinuousRep.adQuot_equiv_symSq`: in rank two and for every `A` (no hypothesis on
`2`): `ad ρ / A·1 ≅ Sym^2 ρ ⊗ (det ρ)⁻¹` and `ad⁰ ρ ≅ (Sym^2 ρ)^∨ ⊗ det ρ`. -/
theorem adQuot_equiv_symSq [Module.Free A M] (ρ : ContinuousRep Γ A M)
    (_h : Module.finrank A M = 2) :
    (∃ e : (Module.End A M ⧸ Submodule.span A {(1 : Module.End A M)}) ≃ₗ[A] Sym[A]^2 M,
      ∀ (g : Γ) X, e (ρ.adQuot g X) = (((ρ.det g)⁻¹ : Aˣ) : A) • (ρ.symPower 2) g (e X)) ∧
    ∃ e' : LinearMap.ker (endTrace A M) ≃ₗ[A] Module.Dual A (Sym[A]^2 M),
      ∀ (g : Γ) X Y, e' (ρ.adZero g X) ((ρ.symPower 2) g Y) = ((ρ.det g : Aˣ) : A) * e' X Y := by
  sorry

end AdjointSymSq

end ContinuousRep

/-- `ad(r, N) := (ad r, [N, −])` on `End(V)`, a Weil–Deligne representation (part (viii) of
ArithmeticGaloisRepresentations:G7/adjoint-representations). -/
def WeilDeligneRep.ad {W : Type*} [Group W] [TopologicalSpace W] {deg : W →* Multiplicative ℤ}
    {q : ℕ} {Ω : Type*} [Field Ω] {V : Type*} [AddCommGroup V] [Module Ω V] [FiniteDimensional Ω V]
    (D : WeilDeligneRep W deg q Ω V) : WeilDeligneRep W deg q Ω (Module.End Ω V) where
  r := Representation.linHom D.r D.r
  isOpen_ker := sorry
  N := LinearMap.mulLeft Ω D.N - LinearMap.mulRight Ω D.N
  isNilpotent_N := sorry
  conj_monodromy := sorry
/-! ### The trace pairing on matrices, and on endomorphisms of a finite projective module, is perfect (ArithmeticGaloisRepresentations:G7/trace-pairing-on-matrices-is-perfect) -/

/-- ArithmeticGaloisRepresentations:G7/trace-pairing-on-matrices-is-perfect, part (1): the trace
pairing `(X, Y) ↦ tr(XY)` on `M_n(A)` is perfect: `X ↦ tr(X ·)` is a bijection onto the dual (the
form is symmetric, so this is `LinearMap.IsPerfPair`). Tau Ceti's `traceBilinForm_nondegenerate`
gives injectivity only. -/
theorem G7.tracePairing_matrix_perfect (A : Type*) [CommRing A] (n : Type*) [Fintype n]
    [DecidableEq n] :
    Function.Bijective (fun X : Matrix n n A =>
      (Matrix.traceLinearMap n A A ∘ₗ LinearMap.mulLeft A X : Matrix n n A →ₗ[A] A)) := by
  sorry

/-- Part (2): for `M` finite projective, the pairing `(X, Y) ↦ tr(XY)` on `End_A(M)`, with `tr`
the contraction trace `ContinuousRep.endTrace`, is perfect. -/
theorem G7.tracePairing_end_perfect (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M]
    [Module A M] [Module.Finite A M] [Module.Projective A M] :
    Function.Bijective (fun X : Module.End A M =>
      (ContinuousRep.endTrace A M ∘ₗ LinearMap.mulLeft A X : Module.End A M →ₗ[A] A)) := by
  sorry

/-! ### Similitude groups GSp and GO of a perfect form, with multiplier (ArithmeticGaloisRepresentations:G7/similitude-groups) -/

/-- `sp/so = {X : Xᵀ J + J X = 0}`, the kernel of `dν` on `TauCeti.SimilitudeGroup.lie J`. -/
def G7.lieZero {n : Type*} [Fintype n] {R : Type*} [CommRing R] (J : Matrix n n R) :
    Submodule R (Matrix n n R) where
  carrier := {X | Xᵀ * J + J * X = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

namespace SimilitudeGroup

variable {n : Type*} [Fintype n] [DecidableEq n] {R : Type*} [CommRing R]

/-- The similitude group scheme `GAut(M, B)` of the form with Gram matrix `J`, through its
functor of points: `GAut(R') = {(g, ν) ∈ GL_n(R') × R'ˣ : gᵀ J g = ν J}` (i.e.
`B(gx, gy) = ν B(x, y)`), a closed subgroup scheme of `GL_n × G_m`. -/
def groupScheme (J : Matrix n n R) (R' : Type*) [CommRing R'] [Algebra R R'] :
    Subgroup (GL n R' × R'ˣ) where
  carrier := {p | (p.1 : Matrix n n R')ᵀ * J.map (algebraMap R R') * (p.1 : Matrix n n R') =
    (p.2 : R') • J.map (algebraMap R R')}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The multiplier `ν : GAut(M, B) → G_m`. -/
def multiplier (J : Matrix n n R) (R' : Type*) [CommRing R'] [Algebra R R'] :
    groupScheme J R' →* R'ˣ :=
  (MonoidHom.snd _ _).comp (groupScheme J R').subtype

/-- `GSp_{2m}(R)` for `J_{2m} = (0, 1_m; −1_m, 0) = −Matrix.J` (BLGGT §1.1). BCGP21 and CG20 both
use the antidiagonal `J = (0, s; −s, 0)`, `s = (0 1; 1 0)`, for `GSp_4` (BCGP21 with `g J gᵀ = ν J`,
CG20 with `Mᵀ J M = ν J`: the same group, as `J⁻¹ = −J`); it is compared with `J_4` by
`TauCeti.GSp4Rep.changeJ`. -/
abbrev GSp (m : ℕ) (R : Type*) [CommRing R] : Subgroup (GL (Fin m ⊕ Fin m) R × Rˣ) :=
  groupScheme (-Matrix.J (Fin m) R) R

/-- `GO_n(R)` for the form `1_n` (BCG25's `G_n` for `n` odd, with `A_n = 1_n`). -/
abbrev GO (m : ℕ) (R : Type*) [CommRing R] : Subgroup (GL (Fin m) R × Rˣ) :=
  groupScheme (1 : Matrix (Fin m) (Fin m) R) R

/-- `g ∈ GAut(M, B)(R)` iff `B(gx, gy) = ν B(x, y)` for all `x, y`. -/
theorem mem_iff (J : Matrix n n R) (p : GL n R × Rˣ) :
    p ∈ groupScheme J R ↔ ∀ x y : n → R,
      ((p.1 : Matrix n n R) *ᵥ x) ⬝ᵥ (J *ᵥ ((p.1 : Matrix n n R) *ᵥ y)) =
        (p.2 : R) * (x ⬝ᵥ (J *ᵥ y)) := by
  sorry
/-- `TauCeti.SimilitudeGroup.GSp_points_eq`: the points of `GSp_{2m}` in the matrix form
`g J gᵀ = ν J` used by ArithmeticStatistics:ST.5/symplectic-similitude-group; it is equivalent to
`gᵀ J g = ν J` because `J⁻¹ = −J`, and the sign of `J` does not matter. -/
theorem GSp_points_eq (m : ℕ) (g : GL (Fin m ⊕ Fin m) R) (ν : Rˣ) :
    (g, ν) ∈ GSp m R ↔
      (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R) * Matrix.J (Fin m) R *
          (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R)ᵀ = (ν : R) • Matrix.J (Fin m) R := by
  sorry

/-- The Lie algebra `gsp/go = {X : Xᵀ J + J X = c J for some c}` (`dν(X) = c`). -/
def lie (J : Matrix n n R) : Submodule R (Matrix n n R) where
  carrier := {X | ∃ c : R, Xᵀ * J + J * X = c • J}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- If `2 ∈ Rˣ`, `gsp = sp ⊕ R·1` (the scalar line is central, with trivial adjoint action). -/
theorem lieSplit [Invertible (2 : R)] (J : Matrix n n R) (_hJ : IsUnit J.det) :
    G7.lieZero J ⊔ Submodule.span R {(1 : Matrix n n R)} = lie J ∧
    Disjoint (G7.lieZero J) (Submodule.span R {(1 : Matrix n n R)}) := by
  sorry

/-- An isometry `(M, B) ≅ (M', B')` up to a unit scalar induces `GAut(M, B) ≅ GAut(M', B')`
(compatibly with `ν`). -/
def ofIsometry (J J' : Matrix n n R) (P : GL n R) (u : Rˣ)
    (_hP : (P : Matrix n n R)ᵀ * J' * (P : Matrix n n R) = (u : R) • J) :
    groupScheme J R ≃* groupScheme J' R :=
  sorry

/-- Unit test: TauCeti.SimilitudeGroup.gsp_two_eq_gl_two. -/
example (g : GL (Fin 1 ⊕ Fin 1) R) (ν : Rˣ) :
    (g, ν) ∈ GSp 1 R ↔ (ν : R) = (g : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R).det := by
  sorry

/-- Unit test: TauCeti.SimilitudeGroup.det_eq_nu_pow. -/
example (m : ℕ) (p : GSp m R) :
    (p.1.1 : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R).det = (p.1.2 : R) ^ m := by
  sorry

/-- Unit test: TauCeti.SimilitudeGroup.sp_eq_symplecticGroup. An equality of sets of matrices:
`Matrix.symplecticGroup` is a `Submonoid` of matrices; its `J` is `−J_{2m}` and `A J Aᵀ = J` is
unchanged by `J ↦ −J`. -/
example (m : ℕ) (g : GL (Fin m ⊕ Fin m) R) :
    (g, 1) ∈ GSp m R ↔
      (g : Matrix (Fin m ⊕ Fin m) (Fin m ⊕ Fin m) R) ∈ Matrix.symplecticGroup (Fin m) R := by
  sorry

/-- Unit test: TauCeti.SimilitudeGroup.gsp_lie_split_fails_char_two. -/
example : (1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) (ZMod 2)) ∈
    G7.lieZero (-Matrix.J (Fin 2) (ZMod 2)) := by
  sorry

/-- Unit test: TauCeti.SimilitudeGroup.gsp_empty_odd_rank. -/
example {m : ℕ} [Nontrivial R] (J : Matrix (Fin m) (Fin m) R) (_hJ : Jᵀ = -J)
    (_hd : ∀ i, J i i = 0) (_hm : Odd m) : ¬ IsUnit J.det := by
  sorry

end SimilitudeGroup

/-! ### Polarized representations: an actual pairing, a multiplier and a sign (ArithmeticGaloisRepresentations:G7/polarized-representation) -/

section Polarized

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- A polarization of `ρ ∈ ContinuousRep Δ A M` at `c ∈ Γ` with `c^2 = 1`, `Δ ≤ Γ` open of index
at most two (group-theoretic form (a); for a CM field `F` take `Γ = G_{F⁺}`, `Δ = G_F`, `c = c_v`;
for `F` totally real `Δ = Γ = G_F`): a continuous multiplier `μ : Γ → Aˣ`, a perfect bilinear
pairing with `⟨ρ(σ)x, ρ(cσc)y⟩ = μ(σ)⟨x, y⟩`, a sign `ε` with `⟨x, y⟩ = ε⟨y, x⟩`, alternating when
`ε = −1` and `2 ∉ Aˣ`, and (for `c ∉ Δ`, i.e. `F` imaginary) `ε = −μ(c)`. This is data. -/
structure PolarizedRep (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) where
  /-- The multiplier `μ : Γ → Aˣ`. -/
  multiplier : Γ →ₜ* Aˣ
  /-- The perfect pairing `⟨ , ⟩`. -/
  pairing : LinearMap.BilinForm A M
  /-- The sign `ε ∈ {±1}`. -/
  sign : ℤˣ
  /-- `c` is an involution. -/
  sq_c : c ^ 2 = 1
  /-- Perfectness: `M → M^∨` is an isomorphism. -/
  pairing_perfect : Function.Bijective pairing
  /-- Covariance `⟨ρ(σ)x, ρ(cσc)y⟩ = μ(σ)⟨x, y⟩`. -/
  covariance : ∀ σ τ : Δ, (τ : Γ) = c * σ * c → ∀ x y : M,
    pairing (ρ σ x) (ρ τ y) = (multiplier σ : A) * pairing x y
  /-- Symmetry with sign `ε`. -/
  symm : ∀ x y : M, pairing x y = ((sign : ℤ) : A) * pairing y x
  /-- Alternating when `ε = −1` and `2` is not a unit. -/
  alternating : sign = -1 → ¬ IsUnit (2 : A) → ∀ x : M, pairing x x = 0
  /-- The CM sign condition `ε = −μ(c)` when `c ∉ Δ`. -/
  cm_sign : c ∉ Δ → ((sign : ℤ) : A) = -(multiplier c : A)

namespace PolarizedRep

/-- `(ρ, ·)` is polarizable at `c`: some multiplier and pairing make it polarized. -/
def IsPolarizable (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) : Prop :=
  Nonempty (PolarizedRep Δ ρ c)

/-- A polarized representation is essentially conjugate self-dual: `ρ^c ≅ ρ^∨ ⊗ μ|_Δ` via
`y ↦ ⟨−, y⟩`; the converse needs the pairing data. -/
theorem essConjSelfDual {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ}
    (P : PolarizedRep Δ ρ c) :
    ∃ e : M ≃ₗ[A] Module.Dual A M, ∀ σ τ : Δ, (τ : Γ) = c * σ * c → ∀ y : M,
      e (ρ τ y) = (P.multiplier σ : A) • Representation.dual ρ.toRepresentation σ (e y) := by
  sorry

/-- Two polarizations of the same `(ρ, μ)` with the same sign are equal iff their pairings
agree. -/
theorem ext {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ} {P Q : PolarizedRep Δ ρ c}
    (_hμ : P.multiplier = Q.multiplier) (_hs : P.sign = Q.sign) :
    P = Q ↔ P.pairing = Q.pairing := by
  sorry

/-- `F` totally real (`c ∈ Δ`), `2 ∈ Aˣ` and `Spec A` connected (no idempotents other than `0` and
`1`): `ρ` is polarizable iff it preserves, up to a multiplier, a perfect `±`-symmetric form (namely
`⟨ , ρ(c)·⟩`), i.e. factors through `GSp` or `GO`. BLGGT state this for `ℚ̄_l`, and for `F̄_l` only
when `l > 2`. -/
theorem toGSpOrGO (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) (_hc : c ∈ Δ)
    (_hc2 : c ^ 2 = 1) (_h2 : IsUnit (2 : A)) (_hconn : ∀ e : A, e * e = e → e = 0 ∨ e = 1) :
    IsPolarizable Δ ρ c ↔ ∃ (B : LinearMap.BilinForm A M) (μ : Γ →ₜ* Aˣ) (ε : ℤˣ),
      Function.Bijective B ∧ (∀ x y, B x y = ((ε : ℤ) : A) * B y x) ∧
      ∀ (σ : Δ) x y, B (ρ σ x) (ρ σ y) = (μ σ : A) * B x y := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.rank_one_imaginary. -/
example [IsDomain A] (_h2 : (2 : A) ≠ 0) [Module.Free A M] (_hM : Module.finrank A M = 1)
    (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) (_hc : c ∉ Δ) (P : PolarizedRep Δ ρ c) :
    (P.multiplier c : A) = -1 := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.not_polarized_even_multiplier. -/
example [IsDomain A] (_h2 : (2 : A) ≠ 0) [Module.Free A M] (_hM : Module.finrank A M = 1)
    (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) (_hc : c ∉ Δ) (μ : Γ →ₜ* Aˣ)
    (_hμ : (μ c : A) = 1) : ¬ ∃ P : PolarizedRep Δ ρ c, P.multiplier = μ := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.totallyReal_det (for `2 ∈ Aˣ` and `Spec A` connected, so that
`det ρ(c)` is a sign and the alternating requirement is empty). -/
example [Module.Free A M] (_hM : Module.finrank A M = 2) (_h2 : IsUnit (2 : A))
    (_hconn : ∀ e : A, e * e = e → e = 0 ∨ e = 1)
    (ρ : ContinuousRep (⊤ : Subgroup Γ) A M) (c : Γ) (_hc : c ^ 2 = 1) :
    ∃ P : PolarizedRep ⊤ ρ c, ∀ σ : (⊤ : Subgroup Γ), P.multiplier σ = ρ.det σ := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.iff_cht_triple (for `2 ∈ Aˣ` and `Spec A` connected, so that
`−μ(c)` is a sign; over a ring with idempotents a CHT triple need not be a polarization). -/
example (Δ : Subgroup Γ) (ρ : ContinuousRep Δ A M) (c : Γ) (_hc : c ∉ Δ) (_hc2 : c ^ 2 = 1)
    (_h2 : IsUnit (2 : A)) (_hconn : ∀ e : A, e * e = e → e = 0 ∨ e = 1) (μ : Γ →ₜ* Aˣ)
    (B : LinearMap.BilinForm A M) (_hB : Function.Bijective B)
    (_hcov : ∀ σ τ : Δ, (τ : Γ) = c * σ * c → ∀ x y, B (ρ σ x) (ρ τ y) = (μ σ : A) * B x y) :
    (∃ P : PolarizedRep Δ ρ c, P.multiplier = μ ∧ P.pairing = B) ↔
      ∀ x y, B x y = -(μ c : A) * B y x := by
  sorry

/-! ### Sign, change of place, determinant and parity constraints of a polarization (ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant) -/

/-- ArithmeticGaloisRepresentations:G7/polarization-sign-and-determinant, part (2):
`det ρ(cσc) · det ρ(σ) = μ(σ)^n`. (Change of place (1), parity (3), the intrinsic sign (4) and the
`GSp_4` similitude ambiguity (5) are stated in the roadmap.) -/
theorem det_mul_det [Module.Free A M] {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ}
    (P : PolarizedRep Δ ρ c) (σ τ : Δ) (_hτ : (τ : Γ) = c * σ * c) :
    ρ.det τ * ρ.det σ = P.multiplier σ ^ Module.finrank A M := by
  sorry

/-! ### Operations on polarized representations: dual, twist, tensor, powers, restriction, coefficients (ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations) -/

variable {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ}

/- In the constructions below the type `PolarizedRep Δ ρ' c` of the result does not record the new
multiplier or pairing, so each construction is followed by statements giving them. Where the new
multiplier involves the quadratic character `δ` of `Γ/Δ` or the transfer `Ver` (twist, tensor
product, exterior and symmetric powers), it is an argument, given with its values on `Δ` and at
`c`: for `Δ` of index two and `c ∉ Δ` these two conditions determine it, and for a subgroup `Δ` of
larger index a character of `Γ` with these values need not exist. -/

/-- The dual `(ρ^∨, μ⁻¹)` with the transported pairing, sign `ε`. -/
def dual (P : PolarizedRep Δ ρ c) (ρ' : ContinuousRep Δ A (Module.Dual A M))
    (_h : ∀ σ, ρ' σ = Representation.dual ρ.toRepresentation σ) : PolarizedRep Δ ρ' c :=
  sorry

/-- The multiplier of the dual is `μ⁻¹`. -/
theorem dual_multiplier (P : PolarizedRep Δ ρ c) (ρ' : ContinuousRep Δ A (Module.Dual A M))
    (h : ∀ σ, ρ' σ = Representation.dual ρ.toRepresentation σ) (g : Γ) :
    (P.dual ρ' h).multiplier g = (P.multiplier g)⁻¹ := by
  sorry

/-- The pairing of the dual is the transported one, `⟨⟨x, ·⟩, ⟨y, ·⟩⟩^∨ = ⟨x, y⟩`, with the same
sign. -/
theorem dual_pairing (P : PolarizedRep Δ ρ c) (ρ' : ContinuousRep Δ A (Module.Dual A M))
    (h : ∀ σ, ρ' σ = Representation.dual ρ.toRepresentation σ) :
    (∀ x y : M, (P.dual ρ' h).pairing (P.pairing x) (P.pairing y) = P.pairing x y) ∧
      (P.dual ρ' h).sign = P.sign := by
  sorry

/-- The twist `(ρ ⊗ χ, μ')` by a continuous character `χ` of `Δ`, with the same pairing and sign
`ε`. The new multiplier `μ'` is given with `μ'(σ) = μ(σ) χ(σ) χ(cσc)` on `Δ` and `μ'(c) = μ(c)`
for `c ∉ Δ`: it is `μ · (χ ∘ Ver)` for `Δ` of index two and `c ∉ Δ`, and `μ χ²` for `Δ = Γ`. -/
def twist (P : PolarizedRep Δ ρ c) (χ : Δ →ₜ* Aˣ) (ρ' : ContinuousRep Δ A M)
    (_h : ∀ σ, ρ' σ = (χ σ : A) • ρ σ) (μ' : Γ →ₜ* Aˣ)
    (_hμ : ∀ σ τ : Δ, (τ : Γ) = c * σ * c → μ' σ = P.multiplier σ * χ σ * χ τ)
    (_hc : c ∉ Δ → μ' c = P.multiplier c) : PolarizedRep Δ ρ' c :=
  sorry

/-- The multiplier of the twist is the given `μ'`. -/
theorem twist_multiplier (P : PolarizedRep Δ ρ c) (χ : Δ →ₜ* Aˣ) (ρ' : ContinuousRep Δ A M)
    (h : ∀ σ, ρ' σ = (χ σ : A) • ρ σ) (μ' : Γ →ₜ* Aˣ)
    (hμ : ∀ σ τ : Δ, (τ : Γ) = c * σ * c → μ' σ = P.multiplier σ * χ σ * χ τ)
    (hc : c ∉ Δ → μ' c = P.multiplier c) :
    (P.twist χ ρ' h μ' hμ hc).multiplier = μ' := by
  sorry

/-- The twist has the same pairing and the same sign. -/
theorem twist_pairing (P : PolarizedRep Δ ρ c) (χ : Δ →ₜ* Aˣ) (ρ' : ContinuousRep Δ A M)
    (h : ∀ σ, ρ' σ = (χ σ : A) • ρ σ) (μ' : Γ →ₜ* Aˣ)
    (hμ : ∀ σ τ : Δ, (τ : Γ) = c * σ * c → μ' σ = P.multiplier σ * χ σ * χ τ)
    (hc : c ∉ Δ → μ' c = P.multiplier c) :
    (P.twist χ ρ' h μ' hμ hc).pairing = P.pairing ∧ (P.twist χ ρ' h μ' hμ hc).sign = P.sign := by
  sorry

/-- The tensor product `(ρ ⊗ ρ', μ'')` with the product pairing, sign `ε ε'`. The new multiplier
`μ''` is given with `μ'' = μ μ'` on `Δ` and `μ''(c) = −μ(c) μ'(c)` for `c ∉ Δ`: it is `μ μ' δ` for
`Δ` of index two and `c ∉ Δ` (`δ` the quadratic character of `Γ/Δ`), and `μ μ'` for `Δ = Γ`. -/
def tensor {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
    [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (τ : ContinuousRep Δ A (M ⊗[A] N))
    (_h : ∀ g, τ g = TensorProduct.map (ρ g) (σ g)) (μ'' : Γ →ₜ* Aˣ)
    (_hμ : ∀ g : Δ, μ'' g = P.multiplier g * Q.multiplier g)
    (_hc : c ∉ Δ → μ'' c = -(P.multiplier c * Q.multiplier c)) : PolarizedRep Δ τ c :=
  sorry

/-- The multiplier of the tensor product is the given `μ''`. -/
theorem tensor_multiplier {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (τ : ContinuousRep Δ A (M ⊗[A] N))
    (h : ∀ g, τ g = TensorProduct.map (ρ g) (σ g)) (μ'' : Γ →ₜ* Aˣ)
    (hμ : ∀ g : Δ, μ'' g = P.multiplier g * Q.multiplier g)
    (hc : c ∉ Δ → μ'' c = -(P.multiplier c * Q.multiplier c)) :
    (P.tensor Q τ h μ'' hμ hc).multiplier = μ'' := by
  sorry

/-- The pairing of the tensor product is the product pairing
`⟨x ⊗ x', y ⊗ y'⟩ = ⟨x, y⟩ ⟨x', y'⟩'`. -/
theorem tensor_pairing {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (τ : ContinuousRep Δ A (M ⊗[A] N))
    (h : ∀ g, τ g = TensorProduct.map (ρ g) (σ g)) (μ'' : Γ →ₜ* Aˣ)
    (hμ : ∀ g : Δ, μ'' g = P.multiplier g * Q.multiplier g)
    (hc : c ∉ Δ → μ'' c = -(P.multiplier c * Q.multiplier c)) (x y : M) (x' y' : N) :
    (P.tensor Q τ h μ'' hμ hc).pairing (x ⊗ₜ[A] x') (y ⊗ₜ[A] y') =
      P.pairing x y * Q.pairing x' y' := by
  sorry

/-- The exterior power `(∧^k ρ, μ_k)` with the determinant pairing, sign `ε^k`, `k ≥ 1`, for every
`A`. The new multiplier `μ_k` is given with `μ_k = μ^k` on `Δ` and `μ_k(c) = (−1)^{k−1} μ(c)^k` for
`c ∉ Δ`: it is `μ^k δ^{k−1}` for `Δ` of index two and `c ∉ Δ`, and `μ^k` for `Δ = Γ`. -/
def extPower (P : PolarizedRep Δ ρ c) (k : ℕ) (_hk : 1 ≤ k) (ρ' : ContinuousRep Δ A (⋀[A]^k M))
    (_h : ∀ g (v : Fin k → M),
      ρ' g (exteriorPower.ιMulti A k v) = exteriorPower.ιMulti A k (fun i => ρ g (v i)))
    (μk : Γ →ₜ* Aˣ) (_hμ : ∀ g : Δ, μk g = P.multiplier g ^ k)
    (_hc : c ∉ Δ → μk c = (-1) ^ (k - 1) * P.multiplier c ^ k) :
    PolarizedRep Δ ρ' c :=
  sorry

/-- The multiplier of the exterior power is the given `μ_k`. -/
theorem extPower_multiplier (P : PolarizedRep Δ ρ c) (k : ℕ) (hk : 1 ≤ k)
    (ρ' : ContinuousRep Δ A (⋀[A]^k M))
    (h : ∀ g (v : Fin k → M),
      ρ' g (exteriorPower.ιMulti A k v) = exteriorPower.ιMulti A k (fun i => ρ g (v i)))
    (μk : Γ →ₜ* Aˣ) (hμ : ∀ g : Δ, μk g = P.multiplier g ^ k)
    (hc : c ∉ Δ → μk c = (-1) ^ (k - 1) * P.multiplier c ^ k) :
    (P.extPower k hk ρ' h μk hμ hc).multiplier = μk := by
  sorry

/-- The pairing of the exterior power is the determinant pairing
`⟨x_1 ∧ … ∧ x_k, y_1 ∧ … ∧ y_k⟩ = det(⟨x_i, y_j⟩)`. -/
theorem extPower_pairing (P : PolarizedRep Δ ρ c) (k : ℕ) (hk : 1 ≤ k)
    (ρ' : ContinuousRep Δ A (⋀[A]^k M))
    (h : ∀ g (v : Fin k → M),
      ρ' g (exteriorPower.ιMulti A k v) = exteriorPower.ιMulti A k (fun i => ρ g (v i)))
    (μk : Γ →ₜ* Aˣ) (hμ : ∀ g : Δ, μk g = P.multiplier g ^ k)
    (hc : c ∉ Δ → μk c = (-1) ^ (k - 1) * P.multiplier c ^ k) (x y : Fin k → M) :
    (P.extPower k hk ρ' h μk hμ hc).pairing (exteriorPower.ιMulti A k x)
        (exteriorPower.ιMulti A k y) =
      Matrix.det (Matrix.of fun i j => P.pairing (x i) (y j)) := by
  sorry

/-- Restriction to a CM extension `L/F` with `L = L⁺F`: here `Γ' ≤ Γ` (for `G_{L⁺}`) containing
`c`, with `Δ ∩ Γ'` (for `G_L`) and the same pairing. -/
def restrict (P : PolarizedRep Δ ρ c) (Γ' : Subgroup Γ) (hc : c ∈ Γ')
    (φ : (Δ.subgroupOf Γ') →ₜ* Δ) (_hφ : ∀ x, (φ x : Γ) = ((x : Γ') : Γ)) :
    PolarizedRep (Δ.subgroupOf Γ') (ρ.res φ) ⟨c, hc⟩ :=
  sorry

/-- The restriction has multiplier `μ|_{Γ'}`, the same pairing and the same sign. -/
theorem restrict_pairing (P : PolarizedRep Δ ρ c) (Γ' : Subgroup Γ) (hc : c ∈ Γ')
    (φ : (Δ.subgroupOf Γ') →ₜ* Δ) (hφ : ∀ x, (φ x : Γ) = ((x : Γ') : Γ)) :
    (∀ g : Γ', (P.restrict Γ' hc φ hφ).multiplier g = P.multiplier (g : Γ)) ∧
      (P.restrict Γ' hc φ hφ).pairing = P.pairing ∧ (P.restrict Γ' hc φ hφ).sign = P.sign := by
  sorry

/- TauCeti.PolarizedRep.baseChange (comment fallback): coefficient extension
`(ρ ⊗_A B, μ ⊗ B, ⟨ , ⟩ ⊗ B)` along continuous `A → B`, with `map_id`, `map_comp` (the
coefficient extension of a continuous representation is the R01.1 construction). -/

/-- The orthogonal sum of two polarizations with the same multiplier and sign at the same `c`. -/
def sum {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
    [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (_hμ : P.multiplier = Q.multiplier)
    (_hε : P.sign = Q.sign) (τ : ContinuousRep Δ A (M × N))
    (_h : ∀ g, τ g = LinearMap.prodMap (ρ g) (σ g)) : PolarizedRep Δ τ c :=
  sorry

/-- The orthogonal sum has the common multiplier and sign and the pairing
`⟨(x, x'), (y, y')⟩ = ⟨x, y⟩ + ⟨x', y'⟩'`. -/
theorem sum_pairing {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (hμ : P.multiplier = Q.multiplier)
    (hε : P.sign = Q.sign) (τ : ContinuousRep Δ A (M × N))
    (h : ∀ g, τ g = LinearMap.prodMap (ρ g) (σ g)) :
    (P.sum Q hμ hε τ h).multiplier = P.multiplier ∧ (P.sum Q hμ hε τ h).sign = P.sign ∧
      ∀ (x y : M) (x' y' : N), (P.sum Q hμ hε τ h).pairing (x, x') (y, y') =
        P.pairing x y + Q.pairing x' y' := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.tensor_sign. -/
example {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
    [TopologicalSpace N] [IsModuleTopology A N] {σ : ContinuousRep Δ A N}
    (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) (τ : ContinuousRep Δ A (M ⊗[A] N))
    (h : ∀ g, τ g = TensorProduct.map (ρ g) (σ g)) (μ'' : Γ →ₜ* Aˣ)
    (hμ : ∀ g : Δ, μ'' g = P.multiplier g * Q.multiplier g)
    (hc : c ∉ Δ → μ'' c = -(P.multiplier c * Q.multiplier c)) :
    (P.tensor Q τ h μ'' hμ hc).sign = P.sign * Q.sign ∧
      (P.tensor Q τ h μ'' hμ hc).multiplier = μ'' := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.twist_trivial. -/
example (P : PolarizedRep Δ ρ c) :
    P.twist 1 ρ (by sorry) P.multiplier (by sorry) (by sorry) = P := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.tensor_without_delta_fails. -/
example [IsDomain A] (_h2 : (2 : A) ≠ 0) {N : Type*} [AddCommGroup N] [Module A N]
    [Module.Finite A N] [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N]
    {σ : ContinuousRep Δ A N} (_hc : c ∉ Δ) (P : PolarizedRep Δ ρ c) (Q : PolarizedRep Δ σ c) :
    (((P.sign * Q.sign : ℤˣ) : ℤ) : A) ≠ -((P.multiplier c : A) * (Q.multiplier c : A)) := by
  sorry

/-- Unit test: TauCeti.PolarizedRep.extPower_top. -/
example [Module.Free A M] (P : PolarizedRep Δ ρ c) (hn : 1 ≤ Module.finrank A M)
    (ρ' : ContinuousRep Δ A (⋀[A]^(Module.finrank A M) M))
    (h : ∀ g (v : Fin (Module.finrank A M) → M), ρ' g (exteriorPower.ιMulti A _ v) =
      exteriorPower.ιMulti A _ (fun i => ρ g (v i)))
    (μn : Γ →ₜ* Aˣ) (hμ : ∀ g : Δ, μn g = P.multiplier g ^ Module.finrank A M)
    (hc : c ∉ Δ → μn c = (-1) ^ (Module.finrank A M - 1) * P.multiplier c ^ Module.finrank A M) :
    (P.extPower _ hn ρ' h μn hμ hc).sign = P.sign ^ Module.finrank A M ∧
      (P.extPower _ hn ρ' h μn hμ hc).multiplier = μn := by
  sorry

end PolarizedRep

end Polarized

/-- The symmetric power `(Sym^k ρ, μ_k)` with the permanent pairing, sign `ε^k`, for
`k ≥ 1` and `k! ∈ Aˣ` (part (5) of
ArithmeticGaloisRepresentations:G7/operations-on-polarized-representations). The new multiplier
`μ_k` is given with `μ_k = μ^k` on `Δ` and `μ_k(c) = (−1)^{k−1} μ(c)^k` for `c ∉ Δ`: it is
`μ^k δ^{k−1}` for `Δ` of index two and `c ∉ Δ`, and `μ^k` for `Δ = Γ`. -/
def PolarizedRep.symPower {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    {A : Type} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M}
    {c : Γ} (P : PolarizedRep Δ ρ c) (k : ℕ) (_hk : 1 ≤ k) [Invertible (k.factorial : A)]
    (μk : Γ →ₜ* Aˣ) (_hμ : ∀ g : Δ, μk g = P.multiplier g ^ k)
    (_hc : c ∉ Δ → μk c = (-1) ^ (k - 1) * P.multiplier c ^ k) :
    PolarizedRep Δ (ρ.symPower k) c :=
  sorry

/-- The symmetric power has the given multiplier `μ_k`, the sign `ε^k` and the permanent pairing
`⟨x_1 ⋯ x_k, y_1 ⋯ y_k⟩ = (1/k!) Σ_{s ∈ S_k} ∏_j ⟨x_j, y_{s(j)}⟩`. -/
theorem PolarizedRep.symPower_multiplier {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    {A : Type} [CommRing A] [TopologicalSpace A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [TopologicalSpace M] [IsModuleTopology A M] {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M}
    {c : Γ} (P : PolarizedRep Δ ρ c) (k : ℕ) (hk : 1 ≤ k) [Invertible (k.factorial : A)]
    (μk : Γ →ₜ* Aˣ) (hμ : ∀ g : Δ, μk g = P.multiplier g ^ k)
    (hc : c ∉ Δ → μk c = (-1) ^ (k - 1) * P.multiplier c ^ k) :
    (P.symPower k hk μk hμ hc).multiplier = μk ∧ (P.symPower k hk μk hμ hc).sign = P.sign ^ k ∧
      ∀ u w : Fin k → M, (P.symPower k hk μk hμ hc).pairing (⨂ₛ[A] i, u i) (⨂ₛ[A] i, w i) =
        ⅟ (k.factorial : A) * ∑ s : Equiv.Perm (Fin k), ∏ j, P.pairing (u j) (w (s j)) := by
  sorry

/-! ### Oddness at real places: polarized sign, similitude value and eigenspace balance (ArithmeticGaloisRepresentations:G7/oddness-at-real-places) -/

/-- `TauCeti.GaloisRep.complexConj`: A complex conjugation `c_v ∈ G_F` at a real place `v`, determined by an embedding
`ι : F̄ → ℂ` extending `v` (`ι⁻¹ ∘ conj ∘ ι`); its conjugacy class depends only on `v`. -/
def GaloisRep.complexConj (F : Type*) [Field F] [NumberField F] (v : NumberField.InfinitePlace F)
    (_hv : v.IsReal) (ι : AlgebraicClosure F →+* ℂ)
    (_hι : NumberField.InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v) :
    Field.absoluteGaloisGroup F :=
  sorry

section Oddness

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {A : Type*} [CommRing A] [TopologicalSpace A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [TopologicalSpace M] [IsModuleTopology A M]

/-- `TauCeti.PolarizedRep.IsTotallyOdd`: Polarized oddness (BLGGT §2.1): `ε_{v'} = 1` at every complex conjugation `c' ∈ C` (the
`c_{v'}` for the real places `v'` of `F⁺`), where by the change-of-place formula
`ε_{v'} = μ(c c') ε`. -/
def PolarizedRep.IsTotallyOdd {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M} {c : Γ}
    (P : PolarizedRep Δ ρ c) (C : Set Γ) : Prop :=
  ∀ c' ∈ C, ((P.sign : ℤ) : A) * (P.multiplier (c * c') : A) = 1

/-- `TauCeti.PolarizedRep.isTotallyOdd_iff_multiplier`: For `F` imaginary (`c ∉ Δ`): totally odd iff `μ(c_v) = −1` for all `v`. -/
theorem PolarizedRep.isTotallyOdd_iff_multiplier {Δ : Subgroup Γ} {ρ : ContinuousRep Δ A M}
    {c : Γ} (P : PolarizedRep Δ ρ c) (_hc : c ∉ Δ) (C : Set Γ) :
    P.IsTotallyOdd C ↔ ∀ c' ∈ C, (P.multiplier c' : A) = -1 := by
  sorry

end Oddness

/- The eigenspace-balance condition (d) of ArithmeticGaloisRepresentations:G7/oddness-at-real-places
is `TauCeti.GaloisRep.IsBalancedAt` below. It is not `TauCeti.GaloisRep.IsOddAt` of R01.4
(`det ρ(c_v) = −1`), with which it agrees only in rank two and characteristic `≠ 2`. Totally odd
characters (c) are `TauCeti.GaloisRep.IsTotallyOddChar` of R01.4. -/

section Balance

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {K : Type*} [Field K] [TopologicalSpace K]
  {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
  [TopologicalSpace V] [IsModuleTopology K V]

/-- `TauCeti.GaloisRep.IsBalancedAt`: the eigenspace-balance condition (d) at an involution `c` (a
complex conjugation at a real place): the `(±1)`-eigenspaces of `ρ(c)` have dimensions differing
by at most one (`|dim V^{c = 1} − dim V^{c = −1}| ≤ 1`; characteristic `≠ 2`). Calegari–Geraghty
call this odd; in dimension `n` it is not the determinant condition `IsOddAt` of R01.4. -/
def GaloisRep.IsBalancedAt (ρ : ContinuousRep Γ K V) (c : Γ) : Prop :=
  |(Module.finrank K (Module.End.eigenspace (ρ c) 1) : ℤ) -
      Module.finrank K (Module.End.eigenspace (ρ c) (-1))| ≤ 1

/-- `TauCeti.GaloisRep.isBalancedAt_iff_trace`: In characteristic `0`, or `ℓ > n + 1` (`n` even),
`ℓ > n` (`n` odd): the balance condition at `c` holds iff `Tr ρ(c) ∈ {−1, 0, 1}`. -/
theorem GaloisRep.isBalancedAt_iff_trace (ρ : ContinuousRep Γ K V) (c : Γ) (_hc : c ^ 2 = 1)
    (_h2 : (2 : K) ≠ 0)
    (_hchar : ringChar K = 0 ∨ (Even (Module.finrank K V) ∧ Module.finrank K V + 1 < ringChar K) ∨
      (Odd (Module.finrank K V) ∧ Module.finrank K V < ringChar K)) :
    GaloisRep.IsBalancedAt ρ c ↔ LinearMap.trace K V (ρ c) ∈ ({-1, 0, 1} : Set K) := by
  sorry

/-- `TauCeti.GaloisRep.dim_invariants_adZero_complexConj`: `dim H^0(⟨c⟩, ad⁰ V) = a^2 + b^2 − 1` for eigenspace dimensions `a + b = n ≥ 1` (whose minimum is
attained exactly at the balanced, i.e. odd, case). For `V = 0` the left side is `0`, so `n ≥ 1` is
a hypothesis. -/
theorem GaloisRep.dim_invariants_adZero_complexConj (ρ : ContinuousRep Γ K V) (c : Γ)
    (_hc : c ^ 2 = 1) (_h2 : (2 : K) ≠ 0) (_hn : 0 < Module.finrank K V) :
    Module.finrank K ↥(LinearMap.ker (LinearMap.trace K V) ⊓
        Subalgebra.toSubmodule (Subalgebra.centralizer K ({ρ c} : Set (Module.End K V)))) + 1 =
      Module.finrank K (Module.End.eigenspace (ρ c) 1) ^ 2 +
        Module.finrank K (Module.End.eigenspace (ρ c) (-1)) ^ 2 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.isOddBalanced_rank_two (in rank two and characteristic `≠ 2` the
balance condition is the determinant condition of R01.4). -/
example (ρ : ContinuousRep Γ K V) (_hV : Module.finrank K V = 2) (c : Γ) (_hc : c ^ 2 = 1)
    (_h2 : (2 : K) ≠ 0) :
    GaloisRep.IsBalancedAt ρ c ↔ LinearMap.det (ρ c) = -1 := by
  sorry

end Balance

/-- Group-valued oddness: `ν(r(c)) = ε` for all `c ∈ C`, where `ε` is the symmetry sign of the form
`J` (`Jᵀ = ε J`): `−1` for `GSp`-valued `r`, `+1` for `GO`-valued `r` (and `ν(r(c_v)) = −1` for
`𝒢_n`-valued `r`, see `TauCeti.CHTGroup.nu`). -/
def SimilitudeGroup.IsOdd {Γ : Type*} [Group Γ] {n : Type*} [Fintype n] [DecidableEq n]
    {R : Type*} [CommRing R] (J : Matrix n n R) (ε : ℤˣ) (r : Γ →* SimilitudeGroup.groupScheme J R)
    (C : Set Γ) : Prop :=
  ∀ c ∈ C, (SimilitudeGroup.multiplier J R (r c) : R) = ((ε : ℤ) : R)

/-- Unit test: TauCeti.GaloisRep.IsTotallyOdd_cyclotomic. -/
example (F : Type*) [Field F] [NumberField F] [NumberField.IsTotallyReal F] (ℓ : ℕ) [Fact ℓ.Prime]
    (v : NumberField.InfinitePlace F) (hv : v.IsReal) :
    GaloisRep.cyclotomicCharacter F ℓ (GaloisRep.complexConjugation F v hv) = -1 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.not_odd_trace_char_three. -/
example : LinearMap.trace (ZMod 3) (Fin 2 → ZMod 3) LinearMap.id = -1 ∧
    ¬ |(Module.finrank (ZMod 3)
        (Module.End.eigenspace (LinearMap.id : Module.End (ZMod 3) (Fin 2 → ZMod 3)) 1) : ℤ) -
      Module.finrank (ZMod 3)
        (Module.End.eigenspace (LinearMap.id : Module.End (ZMod 3) (Fin 2 → ZMod 3)) (-1))| ≤ 1 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.IsTotallyOdd_complex. Over a field with no real place the balance
condition (d) is empty: every representation satisfies it at every real place. -/
example (F : Type*) [Field F] [NumberField F] (_h : NumberField.InfinitePlace.nrRealPlaces F = 0)
    {K : Type*} [Field K] [TopologicalSpace K]
    {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
    [TopologicalSpace V] [IsModuleTopology K V]
    (ρ : TauCeti.ContinuousRep (Field.absoluteGaloisGroup F) K V) :
    ∀ (v : NumberField.InfinitePlace F) (hv : v.IsReal),
      GaloisRep.IsBalancedAt ρ (GaloisRep.complexConjugation F v hv) := by
  sorry

/-! ### The group scheme 𝒢_n and the dictionary with polarized triples (ArithmeticGaloisRepresentations:G7/clozel-harris-taylor-group) -/

/-- The action of `j` on `𝒢_n^0 = GL_n × GL_1`: `j (g, μ) j⁻¹ = (μ (gᵀ)⁻¹, μ)`. -/
def G7.chtJAction (n : Type*) [Fintype n] [DecidableEq n] (R : Type*) [CommRing R] :
    Multiplicative (ZMod 2) →* MulAut (GL n R × Rˣ) :=
  sorry

/-- The `R`-points of the Clozel–Harris–Taylor group scheme
`𝒢_n = (GL_n × GL_1) ⋊ {1, j}` over `ℤ`; `𝒢_n^0 = GL_n × GL_1` is the identity component and
`SemidirectProduct.rightHom` is the order-two quotient. -/
abbrev CHTGroup (n : Type*) [Fintype n] [DecidableEq n] (R : Type*) [CommRing R] : Type _ :=
  (GL n R × Rˣ) ⋊[G7.chtJAction n R] Multiplicative (ZMod 2)

namespace CHTGroup

variable (n : Type*) [Fintype n] [DecidableEq n] (R : Type*) [CommRing R]

/-- The multiplier `ν : 𝒢_n → GL_1`, `(g, μ) ↦ μ`, `j ↦ −1`. -/
def nu : CHTGroup n R →* Rˣ := sorry

/-- CHT08 Lemma 2.1.1: for `Δ ≤ Γ` of index two and `γ₀ ∈ Γ ∖ Δ`, homomorphisms
`r : Γ → 𝒢_n(R)` with `r⁻¹(𝒢_n^0) = Δ` correspond to triples
`(ρ, μ, P)` (`P` the Gram matrix of `⟨ , ⟩`, `r(γ₀) = (P⁻¹-type data, −μ(γ₀)) j`) with
`μ(δ) P = ρ(δ)ᵀ P ρ(γ₀ δ γ₀⁻¹)` and `P ρ(γ₀²) = −μ(γ₀) Pᵀ`; continuity is preserved. The index
hypothesis is needed: for `Γ = ℤ/3`, `Δ = 1` there is no such `r`, and `(1, 1, 1_n)` is a triple. -/
def equivTriple {Γ : Type*} [Group Γ] (Δ : Subgroup Γ) (_hΔ : Δ.index = 2) (γ₀ : Γ)
    (_hγ₀ : γ₀ ∉ Δ) :
    {r : Γ →* CHTGroup n R // ∀ g, g ∈ Δ ↔ (r g).right = 1} ≃
      {t : (Δ →* GL n R) × (Γ →* Rˣ) × GL n R //
        (∀ δ δ' : Δ, (δ' : Γ) = γ₀ * δ * γ₀⁻¹ →
          ((t.2.1 δ : Rˣ) : R) • (t.2.2 : Matrix n n R) =
            (t.1 δ : Matrix n n R)ᵀ * (t.2.2 : Matrix n n R) * (t.1 δ' : Matrix n n R)) ∧
        (∀ δ : Δ, (δ : Γ) = γ₀ ^ 2 →
          (t.2.2 : Matrix n n R) * (t.1 δ : Matrix n n R) =
            -((t.2.1 γ₀ : Rˣ) : R) • (t.2.2 : Matrix n n R)ᵀ)} :=
  sorry

/-- The adjoint action of `𝒢_n` on `gl_n`: `ad(g, μ) x = g x g⁻¹`, `ad(j) x = −xᵀ`. -/
def ad : Representation R (CHTGroup n R) (Matrix n n R) := sorry

/-- `⊗ : (𝒢_n × 𝒢_m)^+ → 𝒢_{nm}`, `(g, a) × (g', a') ↦ (g ⊗ g', a a')`, `j × j ↦ j`, on the
subgroup of pairs with the same image in `{1, j}`. -/
def tensor (m : Type*) [Fintype m] [DecidableEq m] :
    MonoidHom.eqLocus ((SemidirectProduct.rightHom).comp (MonoidHom.fst (CHTGroup n R) (CHTGroup m R)))
        ((SemidirectProduct.rightHom).comp (MonoidHom.snd (CHTGroup n R) (CHTGroup m R))) →*
      CHTGroup (n × m) R :=
  sorry

/-- `I : 𝒢_n → GSp_{2n}`, preserving multipliers. -/
def toGSp : CHTGroup n R →* SimilitudeGroup.groupScheme (-Matrix.J n R) R := sorry

/-- The injection `G_n × {±1} → 𝒢_n` of BCG25 (2.1.2) for a similitude group with form matrix
`J = A_n`: `(g, 1) ↦ (g, ν(g))`, `(g, −1) ↦ (g, ν(g)) · (J⁻¹, (−1)^{n+1}) j`. The formula is a
homomorphism when `Jᵀ = (−1)^{n+1} J` and `J² = (−1)^{n+1}` (true for `1_n`, `n` odd, and for
`J_n`, `n` even), which are therefore hypotheses. -/
def ofSimilitude (J : Matrix n n R) (_hJ : Jᵀ = (-1 : R) ^ (Fintype.card n + 1) • J)
    (_hJ2 : J * J = (-1 : R) ^ (Fintype.card n + 1) • (1 : Matrix n n R)) :
    SimilitudeGroup.groupScheme J R × ℤˣ →* CHTGroup n R :=
  sorry

/-- `r̃_μ : Γ → 𝒢_n(k)` extending an absolutely irreducible `r : Δ → GL_n(k)` with
`r^{γ₀} ≅ r^∨ ⊗ μ`, for `Δ ≤ Γ` of index two and `γ₀ ∈ Γ ∖ Δ`; its multiplier is `μ` or `μ δ`
according to `sgn(r, μ)`. -/
def extendOfAbsIrred {k : Type*} [Field k] {Γ : Type*} [Group Γ] (Δ : Subgroup Γ)
    (_hΔ : Δ.index = 2) (γ₀ : Γ)
    (_hγ₀ : γ₀ ∉ Δ) (r : Δ →* GL n k) (μ : Γ →* kˣ)
    (_hirr : Submodule.span k (Set.range fun δ : Δ => (r δ : Matrix n n k)) = ⊤)
    (_hdual : ∃ P : GL n k, ∀ δ δ' : Δ, (δ' : Γ) = γ₀ * δ * γ₀⁻¹ →
      ((μ δ : kˣ) : k) • (P : Matrix n n k) =
        (r δ : Matrix n n k)ᵀ * (P : Matrix n n k) * (r δ' : Matrix n n k)) :
    Γ →* CHTGroup n k :=
  sorry

/- TauCeti.CHTGroup.ind (comment fallback): CHT's induction `Ind^{Γ,Δ,χ}_{Γ',Δ'} r'` from
`Γ' ≤ Γ` of finite index not contained in `Δ`, with `Δ' = Δ ∩ Γ'`, `χ : Γ → Rˣ`, `γ₀ ∈ Γ' ∖ Δ'`
and `r' : Γ' → 𝒢_n(R)` corresponding to `(ρ', χ|_{Γ'}, ⟨ , ⟩')`: the homomorphism
`Γ → 𝒢_{n[Γ:Γ']}(R)` corresponding to `(ρ, χ, ⟨ , ⟩)`, where `ρ` is right translation on the
functions `f : Δ → R^n` with `f(δ'δ) = ρ'(δ') f(δ)` and
`⟨f, f'⟩ = Σ_{δ ∈ Δ'\Δ} χ(δ)⁻¹ ⟨f(δ), f'(γ₀ δ γ₀⁻¹)⟩'`; independent of `γ₀`, with `ν = χ`. -/

/-- Unit test: TauCeti.CHTGroup.nu_j. -/
example : nu n R (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2))) = -1 ∧
    (SemidirectProduct.inr (Multiplicative.ofAdd (1 : ZMod 2)) : CHTGroup n R) ^ 2 = 1 ∧
    ∀ (g : GL n R) (μ : Rˣ), nu n R (SemidirectProduct.inl (g, μ)) = μ := by
  sorry

/-- Unit test: TauCeti.CHTGroup.rankOne_forces_odd (true over every commutative ring). -/
example {Γ : Type*} [Group Γ] (γ₀ : Γ) (_hγ : γ₀ ^ 2 = 1)
    (r : Γ →* CHTGroup (Fin 1) R) (_hr : (r γ₀).right ≠ 1) : nu (Fin 1) R (r γ₀) = -1 := by
  sorry

/-- Unit test: TauCeti.CHTGroup.ofSimilitude_nu. -/
example (J : Matrix n n R) (hJ : Jᵀ = (-1 : R) ^ (Fintype.card n + 1) • J)
    (hJ2 : J * J = (-1 : R) ^ (Fintype.card n + 1) • (1 : Matrix n n R))
    (g : SimilitudeGroup.groupScheme J R) (s : ℤˣ) :
    nu n R (ofSimilitude n R J hJ hJ2 (g, s)) =
      SimilitudeGroup.multiplier J R g *
        Units.map (Int.castRingHom R).toMonoidHom s ^ Fintype.card n := by
  sorry

/-- Unit test: TauCeti.CHTGroup.no_invariants_fails_char_two. -/
example : ∀ x : CHTGroup n (ZMod 2), ad n (ZMod 2) x 1 = 1 := by
  sorry

/- TauCeti.CHTGroup.equivTriple_trivial (unit test, comment fallback): for `Δ = {1}`, `Γ = Z/2`,
homomorphisms `r` are the elements `(A, −μ) j` with square `1`, i.e. `Aᵀ = −μ A`: perfect
pairings with symmetry `−μ`. -/

end CHTGroup

/-! ### Polarization of symmetric powers of a rank-two symplectic representation (ArithmeticGaloisRepresentations:G7/symmetric-power-polarization) -/

/-- ArithmeticGaloisRepresentations:G7/symmetric-power-polarization: for `d!, 2 ∈ Fˣ` and `r`
preserving an alternating perfect form `h` on `F^2` with multiplier `μ`, the normalised
symmetrisation `B_d(u_1⋯u_d, w_1⋯w_d) = (1/d!) Σ_s ∏_j h(u_j, w_{s(j)})` is a perfect form on
`Sym^d F^2`, `(−1)^d`-symmetric, with multiplier `μ^d` (so `Sym^d r` is `GSp`- or `GO`-valued). -/
theorem symPower_polarization {Γ : Type*} [Group Γ] {F : Type} [Field F] (d : ℕ)
    (_hd : (d.factorial : F) ≠ 0) (_h2 : (2 : F) ≠ 0) (r : Representation F Γ (Fin 2 → F))
    (μ : Γ →* Fˣ) (h : LinearMap.BilinForm F (Fin 2 → F)) (_halt : ∀ x, h x x = 0)
    (_hperf : Function.Bijective h)
    (_hr : ∀ g x y, h (r g x) (r g y) = (μ g : F) * h x y) :
    ∃ B : LinearMap.BilinForm F (Sym[F]^d (Fin 2 → F)),
      (∀ u w : Fin d → Fin 2 → F, B (⨂ₛ[F] i, u i) (⨂ₛ[F] i, w i) =
        ((d.factorial : F))⁻¹ * ∑ s : Equiv.Perm (Fin d), ∏ j, h (u j) (w (s j))) ∧
      Function.Bijective B ∧ (∀ u w, B w u = (-1) ^ d * B u w) ∧
      ∀ (g : Γ) (u w : Fin d → Fin 2 → F),
        B (⨂ₛ[F] i, r g (u i)) (⨂ₛ[F] i, r g (w i)) = (μ g : F) ^ d * B (⨂ₛ[F] i, u i) (⨂ₛ[F] i, w i) := by
  sorry

/-! ### GSp_4-valued representations: oddness, adjoint modules, and symplectic induction from index two (ArithmeticGaloisRepresentations:G7/gsp4-and-symplectic-induction) -/

/-- The Gram matrix `J_4 = (0, 1_2; −1_2, 0)` of `GSp_4` (BLGGT normalisation). -/
abbrev G7.J4 (K : Type*) [CommRing K] : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) K :=
  -Matrix.J (Fin 2) K

/-- The matrix of a point of `GSp_4`. -/
abbrev G7.gsp4Mat {K : Type*} [CommRing K] (g : SimilitudeGroup.GSp 2 K) :
    Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) K :=
  (g.1.1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) K)

/-- The similitude factor of a point of `GSp_4`. -/
abbrev G7.gsp4Nu {K : Type*} [CommRing K] (g : SimilitudeGroup.GSp 2 K) : Kˣ := g.1.2

/-- The conjugation action `X ↦ r(g) X r(g)⁻¹` of `G` on `n × n` matrices through
`r : G → GL_n(K)`. -/
def G7.matConjRep {G : Type*} [Monoid G] {n : Type*} [Fintype n] [DecidableEq n] {K : Type*}
    [CommRing K] (r : G →* GL n K) : Representation K G (Matrix n n K) where
  toFun g :=
    { toFun := fun X => (r g : Matrix n n K) * X * (((r g)⁻¹ : GL n K) : Matrix n n K)
      map_add' := sorry
      map_smul' := sorry }
  map_one' := sorry
  map_mul' := sorry

/-- The underlying `GL_4`-valued homomorphism of a `GSp_4`-valued one. -/
abbrev G7.gsp4ToGL {G : Type*} [Monoid G] {K : Type*} [CommRing K]
    (r : G →* SimilitudeGroup.GSp 2 K) : G →* GL (Fin 2 ⊕ Fin 2) K :=
  (MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 K).subtype.comp r)

/-- A continuous `r : Γ → GSp_4(A)` (for `Γ = G_F`), with similitude character `ν ∘ r`. -/
structure GSp4Rep (Γ : Type*) [Group Γ] [TopologicalSpace Γ] (A : Type*) [CommRing A]
    [TopologicalSpace A] where
  /-- The underlying continuous homomorphism. -/
  toHom : Γ →ₜ* SimilitudeGroup.GSp 2 A

namespace GSp4Rep

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {A : Type*} [CommRing A] [TopologicalSpace A]

/-- Oddness: `ν(r(c_v)) = −1` for the complex conjugations `c_v ∈ C`. -/
def IsOdd (r : GSp4Rep Γ A) (C : Set Γ) : Prop :=
  ∀ c ∈ C, (G7.gsp4Nu (r.toHom c) : A) = -1

/-- `ad r` on `gsp_4` (rank 11) with `Ad ∘ r`. -/
def ad (r : GSp4Rep Γ A) : Representation A Γ (SimilitudeGroup.lie (G7.J4 A)) :=
  (G7.matConjRep (G7.gsp4ToGL r.toHom.toMonoidHom)).subrepresentation _ (by sorry)

/-- `ad⁰ r = asp⁰ r` on `sp_4 = Lie(PGSp_4)` (rank 10, `2 ∈ Aˣ`). -/
def adZero (r : GSp4Rep Γ A) : Representation A Γ (G7.lieZero (G7.J4 A)) :=
  (G7.matConjRep (G7.gsp4ToGL r.toHom.toMonoidHom)).subrepresentation _ (by sorry)

/-- `ad⁰ r ≅ Sym^2 r ⊗ (ν ∘ r)⁻¹` (determined on pure tensors). -/
theorem adZeroEquivSymSq {A : Type} [CommRing A] [TopologicalSpace A] [Invertible (2 : A)]
    (r : GSp4Rep Γ A) :
    ∃ e : G7.lieZero (G7.J4 A) ≃ₗ[A] Sym[A]^2 (Fin 2 ⊕ Fin 2 → A),
      ∀ (g : Γ) (v : Fin 2 → Fin 2 ⊕ Fin 2 → A),
        e (r.adZero g (e.symm (⨂ₛ[A] i, v i))) =
          (((G7.gsp4Nu (r.toHom g))⁻¹ : Aˣ) : A) • ⨂ₛ[A] i, (G7.gsp4Mat (r.toHom g) *ᵥ v i) := by
  sorry

/-- The two symplectic inductions (`s = ±1`) of a rank-two `ρ : H → GL_2(L)` from an index-two
`H` (`H = G_K`, `σ ∈ Γ ∖ H`, `det ρ = χ|_H`): on `V ⊕ σV` with `V ⊥ σV` and
`⟨σv_1, σv_2⟩ = s χ(σ) ⟨v_1, v_2⟩`; similitude characters `χ` and `χ η_{K/F}`. -/
def symplecticInd {L : Type*} [Field L] (H : Subgroup Γ) (_hH : H.index = 2) (σ : Γ)
    (_hσ : σ ∉ H) (ρ : H →* GL (Fin 2) L) (χ : Γ →* Lˣ)
    (_hχ : ∀ h : H, Matrix.GeneralLinearGroup.det (ρ h) = χ h) (_s : ℤˣ) :
    Γ →* SimilitudeGroup.GSp 2 L :=
  sorry

/-- The underlying `GL_4`-valued representation of a symplectic induction is
`Ind_H^Γ ρ` (R01.1), recorded through its character. -/
theorem symplecticInd_toGL4 {L : Type*} [Field L] (H : Subgroup Γ) (hN : H.Normal)
    (hH : H.index = 2) (σ : Γ) (hσ : σ ∉ H) (ρ : H →* GL (Fin 2) L) (χ : Γ →* Lˣ)
    (hχ : ∀ h : H, Matrix.GeneralLinearGroup.det (ρ h) = χ h) (s : ℤˣ) :
    (∀ h : H, (G7.gsp4Mat (symplecticInd H hH σ hσ ρ χ hχ s h)).trace =
      (ρ h : Matrix (Fin 2) (Fin 2) L).trace +
        (ρ ⟨σ⁻¹ * h * σ, hN.conj_mem' _ h.2 _⟩ : Matrix (Fin 2) (Fin 2) L).trace) ∧
    ∀ g ∉ H, (G7.gsp4Mat (symplecticInd H hH σ hσ ρ χ hχ s g)).trace = 0 := by
  sorry

/- TauCeti.GSp4Rep.adZero_symplecticInd (comment fallback): in characteristic `≠ 2`, for the
symplectic induction with similitude `ν ∈ {χ, χ η_{K/F}}`,
`ad⁰(Ind ρ) ≅ As(ρ) ⊗ ν⁻¹ ⊕ Ind ad⁰ ρ`, with `As(ρ)` the tensor induction for the transversal
`{1, σ}` (the summand `V·σV` of `Sym^2(V ⊕ σV)` is `As(ρ)` itself, and `V ∧ σV ⊂ ∧^2` is
`As(ρ) ⊗ η_{K/F}`), and `ad⁰(Ind ρ)|_{G_K} ≅ (ρ ⊗ ρ^σ) ⊗ χ⁻¹ ⊕ ad⁰ ρ ⊕ ad⁰ ρ^σ` (needs R01.1
induction and tensor products). -/

/-- The explicit isomorphism between `GSp_4` for `J_4 = (0, 1; −1, 0)` (BLGGT) and `GSp_4` for the
antidiagonal `J = (0, s; −s, 0)`, `s = (0 1; 1 0)`, which BCGP21 and CG20 both use:
`g ↦ P⁻¹ g P` with `P = diag(1_2, s)` (a permutation of the basis), compatible with `ν`. -/
def changeJ (A : Type*) [CommRing A] :
    SimilitudeGroup.GSp 2 A ≃* SimilitudeGroup.groupScheme
      (Matrix.of ![![0, 0, 0, 1], ![0, 0, 1, 0], ![0, -1, 0, 0], ![-1, 0, 0, 0]] :
        Matrix (Fin 4) (Fin 4) A) A :=
  sorry

/-- Unit test: TauCeti.GSp4Rep.odd_complexConj_eigen. -/
example {K : Type*} [Field K] [TopologicalSpace K] (r : GSp4Rep Γ K) (_h2 : (2 : K) ≠ 0) (c : Γ)
    (_hc : c ^ 2 = 1) (_hodd : r.IsOdd {c}) :
    (G7.gsp4Mat (r.toHom c)).charpoly = (X - 1) ^ 2 * (X + 1) ^ 2 ∧
    Module.finrank K (LinearMap.ker (r.adZero c - LinearMap.id)) = 4 := by
  sorry

/-- Unit test: TauCeti.GSp4Rep.ad_eq_adZero_add_trivial. -/
example [Invertible (2 : A)] (_r : GSp4Rep Γ A) :
    G7.lieZero (G7.J4 A) ⊔ Submodule.span A {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) A)} =
        SimilitudeGroup.lie (G7.J4 A) ∧
      Disjoint (G7.lieZero (G7.J4 A))
        (Submodule.span A {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) A)}) := by
  sorry

/- TauCeti.GSp4Rep.ad_not_adZero_add_nu (unit test, comment fallback): for odd `r` with `p > 2`,
`ad r ≇ ad⁰ r ⊕ (ν ∘ r)`: `ad r / ad⁰ r` is trivial while `ν(r(c)) = −1` (sourceIssues E701). -/

/-- Unit test: TauCeti.GSp4Rep.symplecticInd_similitudes. -/
example {L : Type*} [Field L] (H : Subgroup Γ) [DecidablePred (· ∈ H)] (hH : H.index = 2)
    (σ : Γ) (hσ : σ ∉ H) (ρ : H →* GL (Fin 2) L) (χ : Γ →* Lˣ)
    (hχ : ∀ h : H, Matrix.GeneralLinearGroup.det (ρ h) = χ h) (g : Γ) :
    G7.gsp4Nu (symplecticInd H hH σ hσ ρ χ hχ 1 g) = χ g ∧
    G7.gsp4Nu (symplecticInd H hH σ hσ ρ χ hχ (-1) g) = χ g * (if g ∈ H then 1 else -1) := by
  sorry

/-- Unit test: TauCeti.GSp4Rep.ofGL2_GSp2. -/
example {R : Type*} [CommRing R] (g : GL (Fin 1 ⊕ Fin 1) R) (c : Rˣ) :
    (g, Matrix.GeneralLinearGroup.det g) ∈ SimilitudeGroup.GSp 1 R ∧
    ((g, c) ∈ SimilitudeGroup.GSp 1 R → c = Matrix.GeneralLinearGroup.det g) := by
  sorry

end GSp4Rep

/-- The representation of `G` on `n → K` through `r : G → GL_n(K)`. -/
def G7.matrixRep {G : Type*} [Monoid G] {n : Type*} [Fintype n] [DecidableEq n] {K : Type*}
    [CommRing K] (r : G →* GL n K) : Representation K G (n → K) :=
  (Matrix.toLinAlgEquiv' : Matrix n n K ≃ₐ[K] Module.End K (n → K)).toRingEquiv.toMonoidHom.comp
    ((Units.coeHom (Matrix n n K)).comp r)

/-! ### Semisimple GSp_4-valued representations are determined by GL_4 × GL_1 (characteristic ≠ 2) (ArithmeticGaloisRepresentations:G7/gsp4-semisimple-determined-by-gl4) -/

/-- ArithmeticGaloisRepresentations:G7/gsp4-semisimple-determined-by-gl4: over an algebraically
closed field of characteristic `≠ 2`, semisimple `r, r' : Γ → GSp_4(L)` are `GSp_4(L)`-conjugate
iff their underlying `GL_4`-representations are isomorphic and `ν ∘ r = ν ∘ r'`. -/
theorem gsp4_conj_iff_gl4_conj {Γ : Type*} [Group Γ] {L : Type*} [Field L] [IsAlgClosed L]
    (_h2 : ringChar L ≠ 2) (r r' : Γ →* SimilitudeGroup.GSp 2 L)
    (_hr : (G7.matrixRep ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 L).subtype.comp r))).IsSemisimpleRepresentation)
    (_hr' : (G7.matrixRep ((MonoidHom.fst _ _).comp ((SimilitudeGroup.GSp 2 L).subtype.comp r'))).IsSemisimpleRepresentation) :
    (∃ P : SimilitudeGroup.GSp 2 L, ∀ g, r' g = P * r g * P⁻¹) ↔
      (∃ Q : GL (Fin 2 ⊕ Fin 2) L, ∀ g, (r' g).1.1 = Q * (r g).1.1 * Q⁻¹) ∧
        ∀ g, G7.gsp4Nu (r' g) = G7.gsp4Nu (r g) := by
  sorry

/-! ### Strongly irreducible representations (ArithmeticGaloisRepresentations:G7/strong-irreducibility) -/

namespace GaloisRep

section Strong

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {K : Type*} [Field K] [TopologicalSpace K]
  {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
  [TopologicalSpace V] [IsModuleTopology K V]

/-- `ρ` is strongly irreducible: `ρ|_{Γ'}` is irreducible for every open subgroup `Γ'`. -/
def IsStronglyIrreducible (ρ : ContinuousRep Γ K V) : Prop :=
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) →
    (ρ.res ⟨Γ'.subtype, continuous_subtype_val⟩).toRepresentation.IsIrreducible

/-- `ρ ⊗ K̄` is strongly irreducible: every restriction to an open subgroup is absolutely
irreducible. -/
def IsAbsStronglyIrreducible (ρ : ContinuousRep Γ K V) : Prop :=
  ∀ Γ' : Subgroup Γ, IsOpen (Γ' : Set Γ) →
    (ρ.res ⟨Γ'.subtype, continuous_subtype_val⟩).IsAbsolutelyIrreducible

/-- Strongly irreducible implies irreducible. -/
theorem IsStronglyIrreducible.irreducible {ρ : ContinuousRep Γ K V}
    (_h : IsStronglyIrreducible ρ) : ρ.toRepresentation.IsIrreducible := by
  sorry

/-- For `Γ = G_F`: strongly irreducible iff `ρ|_{G_L}` is irreducible for every finite `L/F`. -/
theorem isStronglyIrreducible_iff_finiteExt {F : Type} [Field F]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) :
    IsStronglyIrreducible ρ ↔ ∀ (L : Type) [Field L] [Algebra F L] [FiniteDimensional F L]
      [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
      [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)],
      (ρ.res (localEmbeddingMap F L)).toRepresentation.IsIrreducible := by
  sorry

/- TauCeti.GaloisRep.IsStronglyIrreducible.baseChange_iff (comment fallback): absolute strong
irreducibility is invariant under extension of the coefficient field (needs the R01.1 coefficient
extension of a continuous representation). -/

/- TauCeti.GaloisRep.isAbsStronglyIrreducible_iff_identityComponent (comment fallback):
characteristic `0`, `ρ` semisimple: absolutely strongly irreducible iff the identity component
`G_ρ^0` of the monodromy group acts irreducibly on `V ⊗ K̄` (needs the identity component of an
algebraic group, Tau Ceti ReductiveGroups layer 3). -/

/-- Unit test: TauCeti.GaloisRep.IsStronglyIrreducible.restrict. -/
example (ρ : ContinuousRep Γ K V) (_h : IsStronglyIrreducible ρ) (Γ' : Subgroup Γ)
    (_hΓ' : IsOpen (Γ' : Set Γ)) :
    IsStronglyIrreducible (ρ.res ⟨Γ'.subtype, continuous_subtype_val⟩) := by
  sorry

/- TauCeti.GaloisRep.not_stronglyIrreducible_induced (unit test, comment fallback):
`Ind_{G_K}^{G_F} ψ` with `ψ ≠ ψ^σ` is irreducible and not strongly irreducible (needs R01.1
induction). -/

/-- Unit test: TauCeti.GaloisRep.stronglyIrreducible_dim_one. -/
example (ρ : ContinuousRep Γ K V) (_h : Module.finrank K V = 1) : IsStronglyIrreducible ρ := by
  sorry

/- TauCeti.GaloisRep.stronglyIrreducible_iff_identityComponent (unit test, comment fallback): in
characteristic `0` for semisimple `ρ`, absolutely strongly irreducible iff `G_ρ^0` acts
irreducibly. -/

end Strong

end GaloisRep

/-! ### Zariski closures of subgroups and the monodromy group of a representation (ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups) -/

namespace AlgebraicGroup

variable {K : Type*} [Field K] {O : Type*} [CommRing O] [Algebra K O]

/-- The Zariski closure of a set `Σ ⊂ G(K)` of points of the affine group scheme `G = Spec O`, as
the vanishing (Hopf) ideal `I(Σ) = {f : f(σ) = 0 for σ ∈ Σ}`. -/
def zariskiClosure (S : Set (O →ₐ[K] K)) : Ideal O :=
  ⨅ σ ∈ S, RingHom.ker σ

/-- `Σ̄ ≤ H ⇔ Σ ⊂ H(K)` for the closed subscheme `H` with ideal `I`. -/
theorem zariskiClosure_le_iff (S : Set (O →ₐ[K] K)) (I : Ideal O) :
    I ≤ zariskiClosure S ↔ ∀ σ ∈ S, ∀ f ∈ I, σ f = 0 := by
  sorry

/- TauCeti.AlgebraicGroup.zariskiClosure_commutator (comment fallback): the closure of the
commutator subgroup `[Σ, Σ]` is the derived group `D(Σ̄)` ([Bor91, I.2.4]); needs the group
structure on points and derived subgroups of algebraic groups. -/

end AlgebraicGroup

namespace AlgebraicGroup

/-- Over an algebraically closed field, closure commutes with homomorphisms of algebraic groups
`α : H → H'` (given by a Hopf algebra map `α* : O' → O`): the closure of `α(Σ)` is `α(Σ̄)`, and the
latter is closed. -/
theorem zariskiClosure_map {K : Type*} [Field K] [IsAlgClosed K] {O : Type*} [CommRing O]
    [HopfAlgebra K O] {O' : Type*} [CommRing O']
    [HopfAlgebra K O'] [Algebra.FiniteType K O] [Algebra.FiniteType K O'] (α : O' →ₐ[K] O)
    (_hα : ∀ f, Coalgebra.comul (R := K) (α f) =
      TensorProduct.map α.toLinearMap α.toLinearMap (Coalgebra.comul (R := K) f))
    (S : Set (O →ₐ[K] K)) :
    zariskiClosure ((fun σ => σ.comp α) '' S) = Ideal.comap α (zariskiClosure S) ∧
    ∀ τ : O' →ₐ[K] K, (∀ f ∈ Ideal.comap α (zariskiClosure S), τ f = 0) →
      ∃ σ : O →ₐ[K] K, (∀ f ∈ zariskiClosure S, σ f = 0) ∧ τ = σ.comp α := by
  sorry

end AlgebraicGroup

namespace GaloisRep

section Monodromy

variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
  {K : Type*} [Field K] [TopologicalSpace K]
  {V : Type*} [AddCommGroup V] [Module K V] [Module.Finite K V] [Module.Projective K V]
  [TopologicalSpace V] [IsModuleTopology K V]

/-- The monodromy group `G_ρ`: the Zariski closure of `ρ(Γ)` in `GL(V)`, given (in a basis `b`)
by the ideal of `ρ(Γ)` in the coordinate ring of `M_n ⊇ GL_n` (`G_ρ` is its trace on the open
`GL_n`). -/
def monodromyGroup {ι : Type*} [Fintype ι] [DecidableEq ι] (ρ : ContinuousRep Γ K V)
    (b : Module.Basis ι K V) : Ideal (MvPolynomial (ι × ι) K) :=
  ⨅ g : Γ, RingHom.ker (MvPolynomial.eval fun ij : ι × ι => LinearMap.toMatrix b b (ρ g) ij.1 ij.2)

/-- `Γ^0 = ρ⁻¹(G_ρ^0(K̄))`, open normal of finite index, for the geometric identity component
`G_ρ^0`. -/
def monodromyIdentityComponent (ρ : ContinuousRep Γ K V) : OpenNormalSubgroup Γ := sorry

/-- `F_ρ^0 := (F̄)^{Γ^0}`, finite Galois over `F` with `Gal(F_ρ^0/F) ≅ π_0(G_ρ)(K̄)`. -/
def componentField {F : Type*} [Field F] (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V) :
    IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField (monodromyIdentityComponent ρ).toSubgroup

/-- `G_{ρ ⊗ K'} = (G_ρ)_{K'}` for a field extension `K'/K`. -/
theorem monodromyGroup_baseChange {ι : Type*} [Fintype ι] [DecidableEq ι] {K' : Type*} [Field K']
    [TopologicalSpace K'] [Algebra K K'] {V' : Type*} [AddCommGroup V'] [Module K' V']
    [Module.Finite K' V'] [Module.Projective K' V'] [TopologicalSpace V'] [IsModuleTopology K' V']
    (ρ : ContinuousRep Γ K V) (ρ' : ContinuousRep Γ K' V') (b : Module.Basis ι K V)
    (b' : Module.Basis ι K' V')
    (_h : ∀ g, LinearMap.toMatrix b' b' (ρ' g) = (LinearMap.toMatrix b b (ρ g)).map (algebraMap K K')) :
    monodromyGroup ρ' b' = Ideal.map (MvPolynomial.map (algebraMap K K')) (monodromyGroup ρ b) := by
  sorry

/- TauCeti.GaloisRep.isReductive_identityComponent_of_semisimple (comment fallback):
characteristic `0`, `ρ` semisimple ⇒ `G_ρ^0` is reductive (Tau Ceti ReductiveGroups layer 6;
Mathlib has no reductive groups). -/

/-- Unit test: TauCeti.GaloisRep.monodromyGroup_finiteImage. -/
example (ρ : ContinuousRep Γ K V) (_h : (Set.range fun g : Γ => ρ g).Finite) :
    (monodromyIdentityComponent ρ).toSubgroup = MonoidHom.ker ρ.toRepresentation := by
  sorry

/- TauCeti.GaloisRep.monodromyGroup_cyclotomic (unit test, comment fallback): for
`ρ = χ_ℓ : G_ℚ → GL_1(ℚ_ℓ)`, `G_ρ = G_m` (the image is open in `ℤ_ℓ^×`, hence infinite). -/

/-- Unit test: TauCeti.GaloisRep.zariskiClosure_map. -/
example {L : Type*} [Field L] [IsAlgClosed L] {O O' : Type*} [CommRing O] [CommRing O']
    [HopfAlgebra L O] [HopfAlgebra L O'] [Algebra.FiniteType L O] [Algebra.FiniteType L O']
    (α : O' →ₐ[L] O)
    (_hα : ∀ f, Coalgebra.comul (R := L) (α f) =
      TensorProduct.map α.toLinearMap α.toLinearMap (Coalgebra.comul (R := L) f))
    (S : Set (O →ₐ[L] L)) :
    AlgebraicGroup.zariskiClosure ((fun σ => σ.comp α) '' S) =
      Ideal.comap α (AlgebraicGroup.zariskiClosure S) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.zariskiClosure_finite_field. -/
example {k : Type*} [Field k] [Finite k] (S : Set (MvPolynomial (Fin 2 × Fin 2) k →ₐ[k] k)) :
    FiniteDimensional k (MvPolynomial (Fin 2 × Fin 2) k ⧸ AlgebraicGroup.zariskiClosure S) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.componentField_trivial. -/
example {F : Type*} [Field F] (ρ : ContinuousRep (Field.absoluteGaloisGroup F) K V)
    (_h : (monodromyIdentityComponent ρ).toSubgroup = ⊤) : componentField ρ = ⊥ := by
  sorry

end Monodromy

end GaloisRep
/-! ### PGL_2 of an algebraically closed field is a simple group (ArithmeticGaloisRepresentations:G7/simplicity-of-pgl2-over-an-algebraically-closed-field) -/

/-- `PGL_2(Ω)` as an abstract group: `GL_2(Ω)` modulo its centre (the scalar matrices). -/
abbrev G7.PGL2 (Ω : Type*) [Field Ω] : Type _ :=
  GL (Fin 2) Ω ⧸ Subgroup.center (GL (Fin 2) Ω)

/-- ArithmeticGaloisRepresentations:G7/simplicity-of-pgl2-over-an-algebraically-closed-field (2):
`PGL_2(Ω)` is a simple group for `Ω` algebraically closed. -/
theorem G7.isSimpleGroup_pgl_two (Ω : Type*) [Field Ω] [IsAlgClosed Ω] :
    IsSimpleGroup (G7.PGL2 Ω) := by
  sorry

/-- The general form of (2): `PSL_2(K)` is simple for a field `K` with more than three elements
(`PSL_2(F_2) ≅ S_3` and `PSL_2(F_3) ≅ A_4` are not simple). -/
theorem G7.isSimpleGroup_psl_two (K : Type*) [Field K] (_hK : 3 < Nat.card K ∨ Infinite K) :
    IsSimpleGroup (Matrix.ProjectiveSpecialLinearGroup (Fin 2) K) := by
  sorry

/-- (3): a subgroup of `PGL_2(Ω) × PGL_2(Ω)` with both projections surjective is the whole
product or the graph of an automorphism of the abstract group `PGL_2(Ω)` (Goursat). -/
theorem G7.pgl_two_goursat (Ω : Type*) [Field Ω] [IsAlgClosed Ω]
    (G : Subgroup (G7.PGL2 Ω × G7.PGL2 Ω))
    (_h₁ : ∀ a : G7.PGL2 Ω, ∃ x ∈ G, x.1 = a) (_h₂ : ∀ b : G7.PGL2 Ω, ∃ x ∈ G, x.2 = b) :
    G = ⊤ ∨ ∃ φ : G7.PGL2 Ω ≃* G7.PGL2 Ω, ∀ x : G7.PGL2 Ω × G7.PGL2 Ω, x ∈ G ↔ x.2 = φ x.1 := by
  sorry

/-! ### Tensor products of symmetric powers with unequal Hodge–Tate differences are strongly irreducible after cyclotomic restriction (ArithmeticGaloisRepresentations:G7/unequal-weight-tensor-irreducibility) -/

/- ArithmeticGaloisRepresentations:G7/unequal-weight-tensor-irreducibility (theorem, comment
block: Hodge–Tate weights are not available in Mathlib): for `ρ, ρ' : G_F → GL_2(ℚ̄_p)` strongly
irreducible, Hodge–Tate at `v | p` with `HT_τ(ρ) = {a, b}`, `HT_τ(ρ') = {a', b'}`,
`a − b ≠ ±(a' − b')`: (i) the Zariski closure of `(Proj ρ × Proj ρ')(G_F)` is `PGL_2 × PGL_2`;
(ii) `(Sym^m ρ ⊗ Sym^{m'} ρ')|_{G_{F(ζ_{p^∞})}}` is strongly irreducible for `m, m' ≥ 1`. -/

/-! ### Lifting projective Galois representations through central torus quotients (Tate's theorem) (ArithmeticGaloisRepresentations:G7/lifting-projective-representations) -/

/- ArithmeticGaloisRepresentations:G7/lifting-projective-representations (theorem, comment block:
needs `ℚ̄_ℓ`-points of linear algebraic groups, and Tate's theorem `H^2(G_F, ℚ/ℤ) = 0`): for `F` a
number field, (1) (Tate, Conrad) every continuous `P : G_F → PGL_n(ℚ̄_ℓ)` lifts to a continuous
`ρ : G_F → GL_n(ℚ̄_ℓ)`, and more generally continuous homomorphisms to `H(ℚ̄_ℓ)` lift through a
surjection `H' → H` with kernel a central torus; (2) two lifts differ by a continuous character;
(3) if `P` is unramified almost everywhere, so is every lift. No p-adic Hodge theory is used; the
statements with Hodge–Tate control are
ArithmeticGaloisRepresentations:G7/lifting-projective-representations-hodge-tate. -/

/-! ### m-th roots of ℓ-adic characters up to characters of finite order (ArithmeticGaloisRepresentations:G7/roots-of-characters-up-to-finite-order) -/

/-- ArithmeticGaloisRepresentations:G7/roots-of-characters-up-to-finite-order: a continuous
character `χ : Γ → ℚ̄_ℓˣ` of a profinite group is `χ₁^m · χ₀` with `χ₀` of finite order, for every
integer `m ≠ 0` (Patrikis, Lemma 2.3.15, for `Γ = G_F`). -/
theorem GaloisRep.exists_root_mul_finiteOrder {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [TotallyDisconnectedSpace Γ] (ℓ : ℕ) [Fact ℓ.Prime]
    (χ : Γ →ₜ* (PadicAlgCl ℓ)ˣ) (m : ℤ) (_hm : m ≠ 0) :
    ∃ χ₁ χ₀ : Γ →ₜ* (PadicAlgCl ℓ)ˣ,
      (∃ N : ℕ, 0 < N ∧ ∀ g, χ₀ g ^ N = 1) ∧ ∀ g, χ g = χ₁ g ^ m * χ₀ g := by
  sorry

/-! ### Lifts of geometric projective representations: half-integral Hodge–Tate–Sen weights, and Hodge–Tate lifts over totally real fields (ArithmeticGaloisRepresentations:G7/lifting-projective-representations-hodge-tate) -/

/- ArithmeticGaloisRepresentations:G7/lifting-projective-representations-hodge-tate (theorem,
comment block: Hodge–Tate and Hodge–Tate–Sen weights are not available in Mathlib; convention
`HT(χ_ℓ) = +1`): for `F` a number field, (1) (Patrikis 2.7.4) a continuous geometric
`P : G_F → PGL_2(ℚ̄_ℓ)` has a lift `ρ` with Hodge–Tate–Sen weights in `½ℤ` at all `v | ℓ` (one can
take `det ρ` of finite order), and for every such lift `Sym^2 ρ` and `det ρ` are geometric;
(2) (BCGP21, proof of 9.2.1) for `F` totally real, `F'/F` quadratic (not assumed totally real) and
`s : G_{F'} → GL_2(ℚ̄_ℓ)`
unramified almost everywhere and de Rham above `ℓ` with weights `{−1, 0}` such that `Proj s`
extends to `G_F`, the extension lifts to `r̃ : G_F → GL_2(ℚ̄_ℓ)`, unramified almost everywhere and
Hodge–Tate with weights `{−1, 0}`, with `r̃|_{G_{F'}} = s ⊗ ψ` for `ψ` of finite order. -/

/-! ### From determinants to representations, only through IHG.1, and compatibility with the operations (ArithmeticGaloisRepresentations:G7/transfer-of-determinants-to-representations) -/

/- ArithmeticGaloisRepresentations:G7/transfer-of-determinants-to-representations (comparison,
comment block: continuous determinants are IntegralHeckeAndGaloisDeterminants:IHG.0, not in
Mathlib): a representation is produced from an `n`-dimensional continuous determinant `D` on
`A[Γ]` only (a) over an algebraically closed coefficient field, `F̄_p` discrete or `ℚ̄_ℓ`
(Chenevier 2.12, with continuity), or (b) over a complete local Noetherian `A` with finite residue
field and `D̄` absolutely irreducible (Chenevier 2.22); `det ∘ Φ(ρ)` depends only on `D` for the
operations `Φ` of G7 (including `ad⁰` and `ad/A·1` for every `n`); polarizations transfer in case
(b) when `2 ∈ Aˣ`, with multiplier `μ` or `μ δ_{F/F⁺}` (for `2 ∉ Aˣ` the multiplier is `μ η` with
`η` valued in `μ_2(A)`, which can be larger than `{±1}`). -/

/-! ### Schur's lemma for residually absolutely irreducible representations over a local ring (ArithmeticGaloisRepresentations:G7/schur-lemma-over-local-rings) -/

/-- ArithmeticGaloisRepresentations:G7/schur-lemma-over-local-rings, (1) and (2): if the reduction
of `ρ : Γ → GL_n(A)` modulo the maximal ideal of the local ring `A` is absolutely irreducible (in
Burnside's form: the residual matrices span `M_n(k)`), then `ρ(Γ)` spans `M_n(A)` and every matrix
commuting with `ρ(Γ)` is a scalar. Part (3), uniqueness of an intertwiner up to `Aˣ`, follows. -/
theorem GaloisRep.span_eq_top_and_centralizer_of_residually_absIrred {A : Type*} [CommRing A]
    [IsLocalRing A] {Γ : Type*} [Group Γ] {n : Type*} [Fintype n] [DecidableEq n]
    (ρ : Γ →* GL n A)
    (_hirr : Submodule.span (IsLocalRing.ResidueField A)
      (Set.range fun g : Γ => (ρ g : Matrix n n A).map (IsLocalRing.residue A)) = ⊤) :
    Submodule.span A (Set.range fun g : Γ => (ρ g : Matrix n n A)) = ⊤ ∧
    ∀ X : Matrix n n A, (∀ g, X * (ρ g : Matrix n n A) = (ρ g : Matrix n n A) * X) →
      ∃ a : A, X = Matrix.scalar n a := by
  sorry

/-! ### Adequate, weakly adequate and GHT-adequate subgroups of GL_n over a field of characteristic p (ArithmeticGaloisRepresentations:G7/adequate-subgroup) -/

namespace G7

variable {K : Type*} [Field K] {n : Type*} [Fintype n] [DecidableEq n]

/-- `ad` of `r : G → GL_n(K)`: `End_K(K^n)` with conjugation, Mathlib's `linHom` of the
tautological representation with itself. -/
def adRep {G : Type*} [Group G] (r : G →* GL n K) : Representation K G (Module.End K (n → K)) :=
  Representation.linHom (matrixRep r) (matrixRep r)

/-- `ad⁰ ⊆ ad`, the trace-zero subrepresentation. -/
def adZeroRep {G : Type*} [Group G] (r : G →* GL n K) :
    Representation K G (LinearMap.ker (LinearMap.trace K (n → K))) :=
  (adRep r).subrepresentation _ (by sorry)

/-- `ad₀ := ad / K·1`, the quotient by the scalar line. -/
def adQuotRep {G : Type*} [Group G] (r : G →* GL n K) :
    Representation K G (Module.End K (n → K) ⧸ Submodule.span K {(1 : Module.End K (n → K))}) :=
  (adRep r).quotient _ (by sorry)

/-- `ad` of `r` as an object of `Rep K G` (for group cohomology). -/
abbrev adRepObj {G : Type} [Group G] {K : Type} [Field K] {n : Type} [Fintype n] [DecidableEq n]
    (r : G →* GL n K) : Rep K G :=
  Rep.of (X := Module.End K (n → K)) (adRep r)

/-- `ad⁰` of `r` as an object of `Rep K G`. -/
abbrev adZeroRepObj {G : Type} [Group G] {K : Type} [Field K] {n : Type} [Fintype n]
    [DecidableEq n] (r : G →* GL n K) : Rep K G :=
  Rep.of (X := LinearMap.ker (LinearMap.trace K (n → K))) (adZeroRep r)

/-- `ad₀` of `r` as an object of `Rep K G`. -/
abbrev adQuotRepObj {G : Type} [Group G] {K : Type} [Field K] {n : Type} [Fintype n]
    [DecidableEq n] (r : G →* GL n K) : Rep K G :=
  Rep.of (X := Module.End K (n → K) ⧸ Submodule.span K {(1 : Module.End K (n → K))}) (adQuotRep r)

/-- `W` is a simple `K[G]`-submodule of `V`. -/
def IsSimpleStable {G V : Type*} [Monoid G] [AddCommMonoid V] [Module K V]
    (ρ : Representation K G V) (W : Submodule K V) : Prop :=
  W ≠ ⊥ ∧ (∀ g, W ≤ W.comap (ρ g)) ∧
    ∀ W' : Submodule K V, (∀ g, W' ≤ W'.comap (ρ g)) → W' ≤ W → W' = ⊥ ∨ W' = W

/-- The `f`-equivariant projection `e_{f,α}` onto the generalised `α`-eigenspace of `f` along the
sum of the other generalised eigenspaces. -/
def eigenProj {V : Type*} [AddCommGroup V] [Module K V] (f : Module.End K V) (α : K) :
    Module.End K V :=
  sorry

/-- Thorne's trace condition (A3) for `H ≤ GL_n(k)`: for every simple `k̄[H]`-submodule
`W ⊆ ad⁰ ⊗ k̄` there are `g ∈ H` and `α ∈ k̄` with `tr(e_{g,α} W) ≠ 0`. -/
def AdZeroTraceCondition {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]
    (H : Subgroup (GL n k)) : Prop :=
  ∀ W : Submodule (AlgebraicClosure k) (Module.End (AlgebraicClosure k) (n → AlgebraicClosure k)),
    IsSimpleStable
      (adRep ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp H.subtype)) W →
    W ≤ LinearMap.ker (LinearMap.trace _ _) →
    ∃ g ∈ H, ∃ α : AlgebraicClosure k, ∃ w ∈ W,
      LinearMap.trace _ _ (eigenProj (matrixRep
        (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))) g) α * w) ≠ 0

/-- The GHT trace condition: for every simple `k̄[H]`-submodule `W ⊆ ad ⊗ k̄` there are a
semisimple `g ∈ H` and `α ∈ k̄` with `tr(e_{g,α} W) ≠ 0`. -/
def AdTraceCondition {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]
    (H : Subgroup (GL n k)) : Prop :=
  ∀ W : Submodule (AlgebraicClosure k) (Module.End (AlgebraicClosure k) (n → AlgebraicClosure k)),
    IsSimpleStable
      (adRep ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp H.subtype)) W →
    ∃ g ∈ H, (minpoly k (g : Matrix n n k)).Separable ∧ ∃ α : AlgebraicClosure k, ∃ w ∈ W,
      LinearMap.trace _ _ (eigenProj (matrixRep
        (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))) g) α * w) ≠ 0

/-- `Sym^m : GL_2 → GL_{m+1}`, the symmetric power in the monomial basis `x^{m−i} y^i`. -/
def symPowerGL (K : Type*) [CommRing K] (m : ℕ) : GL (Fin 2) K →* GL (Fin (m + 1)) K := sorry

/-- `G_{F(μ_m)} ≤ G_F`, the fixing subgroup of the `m`-th roots of unity. -/
def cyclotomicSubgroup (F : Type*) [Field F] (m : ℕ) : Subgroup (Field.absoluteGaloisGroup F) :=
  IntermediateField.fixingSubgroup (IntermediateField.adjoin F {x : AlgebraicClosure F | x ^ m = 1})

end G7

namespace ResidualImage

section Adequate

variable {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]

/-- `H` is weakly adequate: its semisimple elements (separable minimal polynomial, i.e.
diagonalisable over `k̄`) span `M_n(k)`. -/
def IsWeaklyAdequate (H : Subgroup (GL n k)) : Prop :=
  Submodule.span k {X : Matrix n n k | ∃ g ∈ H, (minpoly k (g : Matrix n n k)).Separable ∧
    X = (g : Matrix n n k)} = ⊤

/-- `H` is adequate (Thorne 2012, Definition 2.3): (A1) `H¹(H, k) = 0`, (A2)
`H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, (A3) the trace condition on simple `k̄[H]`-submodules of
`ad⁰ ⊗ k̄` (Mathlib's `groupCohomology`; `H` is finite in the applications). -/
def IsAdequate (H : Subgroup (GL n k)) : Prop :=
  Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
  Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 0) ∧
  Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 1) ∧
  G7.AdZeroTraceCondition H

/-- `H` is GHT-adequate (Thorne 2017, Definition 2.20): `H¹(H, k) = 0`, `H¹(H, ad₀) = 0` and the
trace condition with semisimple `g` on simple `k̄[H]`-submodules of `ad ⊗ k̄`. -/
def IsGHTAdequate (H : Subgroup (GL n k)) : Prop :=
  Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
  Subsingleton (groupCohomology ((G7.adQuotRepObj H.subtype)) 1) ∧
  G7.AdTraceCondition H

/-- (A3) ⇔ weakly adequate ⇔ the GHT trace condition, with no irreducibility hypothesis (GHTT
appendix, Lemma 1 assumes `H` irreducible, but its proof does not use it: the annihilator of the
span of the semisimple elements under the trace pairing is an `H`-submodule of `ad⁰ ⊗ k̄`, and each
condition says that it vanishes). -/
theorem isWeaklyAdequate_iff_trace_condition (H : Subgroup (GL n k)) :
    (G7.AdZeroTraceCondition H ↔ IsWeaklyAdequate H) ∧
      (IsWeaklyAdequate H ↔ G7.AdTraceCondition H) := by
  sorry

/-- `TauCeti.ResidualImage.IsWeaklyAdequate.absolutelyIrreducible`: A weakly adequate `H` acts
absolutely irreducibly on `k^n`. Absolute irreducibility is encoded in this section as "`H` spans
`M_n(k)`" (equivalent by Burnside's theorem and its easy converse), so as typed the statement is
the monotonicity of the span; the content is that encoding. -/
theorem IsWeaklyAdequate.absolutelyIrreducible {H : Subgroup (GL n k)}
    (_h : IsWeaklyAdequate H) :
    Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤ := by
  sorry

/-- `TauCeti.ResidualImage.IsAdequate.not_dvd`: An adequate subgroup forces `p ∤ n`. -/
theorem IsAdequate.not_dvd [Nonempty n] {H : Subgroup (GL n k)} (_h : IsAdequate H) :
    ¬ (ringChar k ∣ Fintype.card n) := by
  sorry

/-- If `p ∤ n`: adequate ⇔ GHT-adequate. -/
theorem isAdequate_iff_isGHTAdequate (H : Subgroup (GL n k)) (_hp : ¬ (ringChar k ∣ Fintype.card n)) :
    IsAdequate H ↔ IsGHTAdequate H := by
  sorry

/-- `TauCeti.ResidualImage.IsGHTAdequate.h1_ad`: GHT-adequacy gives `H¹(H, ad) = 0` (from `0 → k → ad → ad₀ → 0`). -/
theorem IsGHTAdequate.h1_ad {H : Subgroup (GL n k)} (_h : IsGHTAdequate H) :
    Subsingleton (groupCohomology ((G7.adRepObj H.subtype)) 1) := by
  sorry

/-- Adequacy is invariant under extension of the field `k'/k` (likewise the weak and GHT forms). -/
theorem isAdequate_baseChange_iff {k' : Type} [Field k'] [Algebra k k'] (H : Subgroup (GL n k)) :
    IsAdequate H ↔ IsAdequate (H.map (Matrix.GeneralLinearGroup.map (algebraMap k k'))) := by
  sorry

/-- For finite `k ⊆ k₁`: `H` is adequate iff `k₁^× · H` is (BLGG13 A.1.4). -/
theorem isAdequate_units_mul_iff [Finite k] {k₁ : Type} [Field k₁] [Finite k₁] [Algebra k k₁]
    (H : Subgroup (GL n k)) :
    IsAdequate H ↔ IsAdequate (H.map (Matrix.GeneralLinearGroup.map (algebraMap k k₁)) ⊔
      (Matrix.GeneralLinearGroup.scalar n).range) := by
  sorry

/-- `TauCeti.ResidualImage.IsAdequate.map_conj`: if `g ∈ GL_n(k̄)` and `gHg⁻¹ ⊆ GL_n(k)`, then
`gHg⁻¹` is adequate iff `H` is. The Lean form is stated after base change to `k̄`, where the
conjugate lives (`isAdequate_baseChange_iff` brings it back to `k`). -/
theorem IsAdequate.map_conj {H : Subgroup (GL n k)} (g : GL n (AlgebraicClosure k))
    (_h : IsAdequate (H.map (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))))) :
    IsAdequate ((H.map (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)))).map
      (MulAut.conj g).toMonoidHom) := by
  sorry

end Adequate

/-- Unit test: TauCeti.ResidualImage.isAdequate_SL2_ZMod7. -/
example [Fact (Nat.Prime 7)] :
    IsAdequate (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 7))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isAdequate_SL2_ZMod5. -/
example [Fact (Nat.Prime 5)] :
    Submodule.span (ZMod 5) ((fun g : GL (Fin 2) (ZMod 5) => (g : Matrix (Fin 2) (Fin 2) (ZMod 5))) ''
      ((Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 5))) :
        Set (GL (Fin 2) (ZMod 5)))) = ⊤ ∧
    IsWeaklyAdequate (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 5))) ∧
    ¬ IsAdequate (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 5))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isAdequate_SL2_ZMod3. -/
example : ¬ IsAdequate (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 3))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isAdequate_GL2_ZMod5. -/
example [Fact (Nat.Prime 5)] : IsAdequate (⊤ : Subgroup (GL (Fin 2) (ZMod 5))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isAdequate_of_rank_one. -/
example {k : Type} [Field k] [CharP k (ringChar k)] (H : Subgroup (GL (Fin 1) k)) [Finite H] :
    IsAdequate H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isAdequate_of_dvd. (`n` nonempty: for `n = ∅` the
trivial group is adequate and `p ∣ 0`.) -/
example {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n] [Nonempty n]
    (_h : ringChar k ∣ Fintype.card n) (H : Subgroup (GL n k)) : ¬ IsAdequate H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isGHTAdequate_SL2_GF4. `SL₂(F_4) ⊆ GL₂(F_4)` is
GHT-adequate (Guralnick–Herzig–Tiep, Corollary 9.4; Thorne 2017, proof of Lemma 6.3) but not
adequate in the sense of Thorne 2012, since `p = 2` divides `n = 2`. -/
example :
    IsGHTAdequate
      (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (GaloisField 2 2))) ∧
    ¬ IsAdequate
      (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (GaloisField 2 2))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isAdequate_iff_isGHTAdequate_of_coprime. -/
example {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]
    (_h : ¬ ringChar k ∣ Fintype.card n) (H : Subgroup (GL n k)) :
    IsAdequate H ↔ IsGHTAdequate H := by
  sorry

/-! ### Restriction to a subgroup of invertible finite index is injective on H¹ (Mathlib's group cohomology) (ArithmeticGaloisRepresentations:G7/h1-restriction-injective-for-invertible-index) -/

/-- ArithmeticGaloisRepresentations:G7/h1-restriction-injective-for-invertible-index, on cocycles:
a 1-cocycle `f : G → A` (Mathlib's `groupCohomology.IsCocycle₁`) whose restriction to a subgroup
`S` of finite index invertible in `k` is a coboundary is a coboundary. On classes this says that
restriction `H¹(G, A) → H¹(S, A)` is injective (`groupCohomology.H1π_eq_zero_iff`). It follows
from Tau Ceti's cochain-level identities `TauCeti.ContCohomology.cochainsCor1_res` and
`TauCeti.ContCohomology.cochainsCor1_d0`. -/
theorem isCoboundary₁_of_restrict_of_index_isUnit {k G A : Type*} [CommRing k] [Group G]
    [AddCommGroup A] [Module k A] [DistribMulAction G A] [SMulCommClass G k A]
    (S : Subgroup G) [S.FiniteIndex] (_hS : IsUnit (S.index : k)) (f : G → A)
    (_hf : groupCohomology.IsCocycle₁ f)
    (_hres : groupCohomology.IsCoboundary₁ (fun s : S => f (s : G))) :
    groupCohomology.IsCoboundary₁ f := by
  sorry

/-- Consequence (i): every 1-cocycle of a finite group whose order is invertible in `k` is a
coboundary, i.e. `H¹(G, A) = 0`. -/
theorem isCoboundary₁_of_card_isUnit {k G A : Type*} [CommRing k] [Group G] [Finite G]
    [AddCommGroup A] [Module k A] [DistribMulAction G A] [SMulCommClass G k A]
    (_hG : IsUnit (Nat.card G : k)) (f : G → A) (_hf : groupCohomology.IsCocycle₁ f) :
    groupCohomology.IsCoboundary₁ f := by
  sorry

/-! ### Vanishing of H⁰ and H¹ under extension of the coefficient field (ArithmeticGaloisRepresentations:G7/vanishing-of-h0-and-h1-under-extension-of-the-coefficient-field) -/

/- ArithmeticGaloisRepresentations:G7/vanishing-of-h0-and-h1-under-extension-of-the-coefficient-field
(lemma, comment block: needs the base change `M ⊗_k k'` of an object of `Rep k G` to `Rep k' G`,
which Mathlib does not package). For fields `k ⊆ k'`, a group `G` and a finite-dimensional
`k`-linear representation `M` of `G`, with `M' = M ⊗_k k'`: (1) `(M')^G = M^G ⊗_k k'`; (2) a
1-cocycle `G → M` that is a coboundary in `M'` is a coboundary in `M`; (3) if `H⁰(G, M) = 0` and
`H¹(G, M) = 0` then `H¹(G, M') = 0`; (4) for `G` finite, `H¹(G, M') ≅ H¹(G, M) ⊗_k k'`. -/

/-! ### H¹(B, N) embeds into the B-equivariant homomorphisms U → N when the normal subgroup U acts trivially and [B : U] is invertible (ArithmeticGaloisRepresentations:G7/h1-with-trivial-action-of-a-normal-subgroup) -/

/-- ArithmeticGaloisRepresentations:G7/h1-with-trivial-action-of-a-normal-subgroup, first half: if
the normal subgroup `U` acts trivially on `A`, the restriction to `U` of a 1-cocycle `f : B → A`
is additive and satisfies `f (b u b⁻¹) = b • f u`. -/
theorem isCocycle₁_restrict_of_trivial_action {B A : Type*} [Group B] [AddCommGroup A]
    [DistribMulAction B A] (U : Subgroup B) [U.Normal] (_hU : ∀ u ∈ U, ∀ a : A, u • a = a)
    (f : B → A) (_hf : groupCohomology.IsCocycle₁ f) :
    (∀ u ∈ U, ∀ u' ∈ U, f (u * u') = f u + f u') ∧
      ∀ b : B, ∀ u ∈ U, f (b * u * b⁻¹) = b • f u := by
  sorry

/-- Second half: if moreover `[B : U]` is finite and invertible in `k`, a 1-cocycle vanishing on
`U` is a coboundary; so `H¹(B, A)` embeds into the `B`-equivariant homomorphisms `U → A`. -/
theorem isCoboundary₁_of_trivial_action_of_restrict_eq_zero {k B A : Type*} [CommRing k] [Group B]
    [AddCommGroup A] [Module k A] [DistribMulAction B A] [SMulCommClass B k A]
    (U : Subgroup B) [U.Normal] [U.FiniteIndex] (_hidx : IsUnit (U.index : k))
    (_hU : ∀ u ∈ U, ∀ a : A, u • a = a) (f : B → A) (_hf : groupCohomology.IsCocycle₁ f)
    (_h0 : ∀ u ∈ U, f u = 0) : groupCohomology.IsCoboundary₁ f := by
  sorry

/-! ### Vanishing of H¹ of Borel subgroups of GL₂(F_q) with coefficients Sym^k ⊗ det^j, by weights (ArithmeticGaloisRepresentations:G7/h1-of-borel-subgroups-with-symmetric-power-coefficients) -/

/- ArithmeticGaloisRepresentations:G7/h1-of-borel-subgroups-with-symmetric-power-coefficients,
parts (1)–(3) (comment block: needs the subgroup `B = T'U` of `GL_2(F_q)` for a subgroup `T'` of
the diagonal torus and the module `Sym^k ⊗ det^j` with its monomial basis). With
`χ_i(diag(a, d)) = a^{k−i+j} d^{i+j}` for `0 ≤ i ≤ k ≤ p − 1`, call `(i, s)`, `0 ≤ s < r`, a
resonance if `χ_i = (a/d)^{p^s}` on `T'`. (1) No resonance: `H¹(B, M) = 0`. (2) `T'` not scalar
and every resonance has `s = 0`, `i < k`: `H¹(B, M) = 0`. (3) Then `H¹(G, M) = 0` for every
`G ⊇ B` in `GL_2(F_q)` with `p ∤ [G : B]`. The two cases used are stated below. -/

/-- Case (a): for `p ≥ 5`, a finite field `F` of characteristic `p` and `0 ≤ k ≤ p − 1`, with
`F ≠ F_p` or `k ≠ p − 3`: `H¹(SL₂(F), Sym^k) = 0` (coefficients in any field `L ⊇ F`). -/
theorem h1_SL2_symPower_eq_zero (p : ℕ) [Fact p.Prime] (_hp : 5 ≤ p) (F : Type) [Field F]
    [Fintype F] [CharP F p] (L : Type) [Field L] [Algebra F L] (k : ℕ) (_hk : k + 1 ≤ p)
    (_h : Fintype.card F ≠ p ∨ k + 3 ≠ p) :
    Subsingleton (groupCohomology (Rep.of (G7.matrixRep ((G7.symPowerGL L k).comp
      (Matrix.SpecialLinearGroup.mapGL L :
        Matrix.SpecialLinearGroup (Fin 2) F →* GL (Fin 2) L)))) 1) := by
  sorry

/-- Case (b): `H¹(GL₂(F_p), ad⁰) = 0` for `p ≥ 5`, in particular for `p = 5`, where
`H¹(SL₂(F_5), ad⁰) ≠ 0`. -/
theorem h1_GL2_adZero_eq_zero (p : ℕ) [Fact p.Prime] (_hp : 5 ≤ p) :
    Subsingleton (groupCohomology
      (G7.adZeroRepObj (MonoidHom.id (GL (Fin 2) (ZMod p)))) 1) := by
  sorry

/-! ### Verification criteria for adequacy: large characteristic, prime-to-p order, normal subgroups, tensor products, rank two and SL₂(p^r) (ArithmeticGaloisRepresentations:G7/adequacy-criteria) -/

/-- ArithmeticGaloisRepresentations:G7/adequacy-criteria, (2) and the headline case of (1): an
absolutely irreducible finite `H ⊆ GL_n(k)` is adequate if `p ∤ #H` or `p ≥ 2(n+1)`. -/
theorem isAdequate_of_coprime_or_large {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]
    (H : Subgroup (GL n k)) [Finite H] (_hp : (ringChar k).Prime)
    (_hirr : Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤)
    (_h : ¬ ringChar k ∣ Nat.card H ∨ 2 * (Fintype.card n + 1) ≤ ringChar k) :
    IsAdequate H := by
  sorry

/-! ### An absolutely irreducible representation of a finite group of order prime to p has dimension prime to p (ArithmeticGaloisRepresentations:G7/dimension-of-absolutely-irreducible-representations-of-prime-to-p-groups) -/

/-- ArithmeticGaloisRepresentations:G7/dimension-of-absolutely-irreducible-representations-of-prime-to-p-groups:
a finite subgroup `H ⊆ GL_n(k)` of order prime to `p = char k` that spans `M_n(k)` (i.e. acts
absolutely irreducibly) has `p ∤ n`. (`n` nonempty: for `n = ∅` the conclusion `¬ p ∣ 0` fails.) -/
theorem not_dvd_card_of_coprime_card_of_span_eq_top {k : Type} [Field k] {n : Type} [Fintype n]
    [DecidableEq n] [Nonempty n] (p : ℕ) [Fact p.Prime] [CharP k p] (H : Subgroup (GL n k))
    [Finite H] (_hcop : ¬ p ∣ Nat.card H)
    (_hirr : Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤) :
    ¬ p ∣ Fintype.card n := by
  sorry

/-! ### The 'enormous' condition for Taylor–Wiles data, its failure when p divides n, and its invariance under coefficient extension (ArithmeticGaloisRepresentations:G7/enormous-image-and-its-coefficient-extension-invariance) -/

section Enormous

variable {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]

/- Standing hypothesis of the node: `k` is an algebraic extension of `F_p`. The two definitions
are typed for every field `k`, with `p = ringChar k`; the statements that need the hypothesis
(`isEnormous_iff_of_image_PGL_eq`, `isEnormous_baseChange_iff`, `IsEnormous.isAdequate`,
`isEnormous_iff_isAdequate_of_two`, `IsEnormous.map_conj`) carry it as
`(p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k] [Algebra.IsAlgebraic (ZMod p) k]`, which gives
`ringChar k = p`. Without it the first, fourth and fifth fail as typed (over `k = F_p(t)` the
group `kˣ` has the quotient `ℤ/p`; in characteristic zero `IsPGroup 0` holds for every group, so
only the trivial group has no proper normal subgroup with such a quotient), and the proofs of the
second and third (Galois descent along `k'/k`; reduction to a finite field) do not apply. The
other four statements
(`isEnormous_iff_forall_submodule`, `IsEnormous.not_dvd`, `isEnormous_iff_KT`,
`IsEnormous.eq_of_normal_pGroup_quotient`) hold over every field. -/

/-- `h` is regular semisimple: its characteristic polynomial is separable (`n` distinct roots in
`k̄`). -/
def IsRegularSemisimple (h : GL n k) : Prop := (Matrix.charpoly (h : Matrix n n k)).Separable

/-- `H ≤ GL_n(k)` is enormous (Allen et al. 2023, Definition 6.2.29): absolutely irreducible,
no nontrivial quotient of `p`-power order, `H⁰(H, ad⁰) = H¹(H, ad⁰) = 0`, and every simple
`k[H]`-submodule `W ⊆ ad⁰` has `W^h ≠ 0` for some regular semisimple `h ∈ H`. Here `k` is meant
to be an algebraic extension of `F_p` and `p = ringChar k`. -/
def IsEnormous (H : Subgroup (GL n k)) : Prop :=
  Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤ ∧
  (∀ (N : Subgroup H) [N.Normal], IsPGroup (ringChar k) (H ⧸ N) → N = ⊤) ∧
  Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 0) ∧
  Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 1) ∧
  ∀ W : Submodule k (LinearMap.ker (LinearMap.trace k (n → k))),
    G7.IsSimpleStable (G7.adZeroRep H.subtype) W →
    ∃ h : H, IsRegularSemisimple (h : GL n k) ∧ ∃ w ∈ W, w ≠ 0 ∧ G7.adZeroRep H.subtype h w = w

/-- Given (1) and (2), condition (3) may be tested on all nonzero `k[H]`-submodules of `ad⁰`. -/
theorem isEnormous_iff_forall_submodule (H : Subgroup (GL n k)) :
    IsEnormous H ↔
      Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤ ∧
      (∀ (N : Subgroup H) [N.Normal], IsPGroup (ringChar k) (H ⧸ N) → N = ⊤) ∧
      Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 0) ∧
      Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 1) ∧
      ∀ W : Submodule k (LinearMap.ker (LinearMap.trace k (n → k))), W ≠ ⊥ →
        (∀ h, W ≤ W.comap (G7.adZeroRep H.subtype h)) →
        ∃ h : H, IsRegularSemisimple (h : GL n k) ∧ ∃ w ∈ W, w ≠ 0 ∧
          G7.adZeroRep H.subtype h w = w := by
  sorry

/-- `TauCeti.ResidualImage.IsEnormous.not_dvd`: No subgroup is enormous when `p ∣ n`. -/
theorem IsEnormous.not_dvd [Nonempty n] {H : Subgroup (GL n k)} (_h : IsEnormous H) :
    ¬ (ringChar k ∣ Fintype.card n) := by
  sorry

/-- Enormity depends only on the image in `PGL_n(k)` (`k` algebraic over `F_p`, so that the
scalars `kˣ` are a torsion group without elements of order `p`). -/
theorem isEnormous_iff_of_image_PGL_eq (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] (H H' : Subgroup (GL n k))
    (_h : H.map Matrix.ProjGenLinGroup.mk = H'.map Matrix.ProjGenLinGroup.mk) :
    IsEnormous H ↔ IsEnormous H' := by
  sorry

/-- For `k` algebraic over `F_p` and an algebraic extension `k'/k` (then `k'/k` is Galois, which
the proof uses): enormous over `k` iff enormous over `k'` (Lemma 6.2.30). -/
theorem isEnormous_baseChange_iff (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] {k' : Type} [Field k'] [Algebra k k']
    [Algebra.IsAlgebraic k k'] (H : Subgroup (GL n k)) :
    IsEnormous H ↔ IsEnormous (H.map (Matrix.GeneralLinearGroup.map (algebraMap k k'))) := by
  sorry

/-- If `k` contains all eigenvalues of all `h ∈ H`, enormous ⇔ Khare–Thorne Definition 4.10:
(1), (2) and (3') every simple `W ⊆ ad⁰` has `tr(e_{h,α} W) ≠ 0` for some `h` with `n` distinct
eigenvalues in `k` and an eigenvalue `α` of `h` (Remark 6.2.31). -/
theorem isEnormous_iff_KT (H : Subgroup (GL n k))
    (_heig : ∀ h ∈ H, ∃ s : Multiset k,
      Matrix.charpoly (h : Matrix n n k) = (s.map fun a => X - C a).prod) :
    IsEnormous H ↔
      Submodule.span k ((fun g : GL n k => (g : Matrix n n k)) '' (H : Set (GL n k))) = ⊤ ∧
      (∀ (N : Subgroup H) [N.Normal], IsPGroup (ringChar k) (H ⧸ N) → N = ⊤) ∧
      Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 0) ∧
      Subsingleton (groupCohomology ((G7.adZeroRepObj H.subtype)) 1) ∧
      ∀ W : Submodule k (LinearMap.ker (LinearMap.trace k (n → k))),
        G7.IsSimpleStable (G7.adZeroRep H.subtype) W →
        ∃ h : H, IsRegularSemisimple (h : GL n k) ∧ ∃ α : k, ∃ w ∈ W,
          LinearMap.trace k (n → k) (G7.eigenProj (G7.matrixRep H.subtype h) α * w) ≠ 0 := by
  sorry

/-- `TauCeti.ResidualImage.IsEnormous.isAdequate`: for `k` algebraic over `F_p`, a finite enormous
`H` whose eigenvalues lie in `k` is adequate (Gee–Newton 3.2.2). -/
theorem IsEnormous.isAdequate (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] {H : Subgroup (GL n k)} [Finite H]
    (_heig : ∀ h ∈ H, ∃ s : Multiset k,
      Matrix.charpoly (h : Matrix n n k) = (s.map fun a => X - C a).prod)
    (_h : IsEnormous H) : IsAdequate H := by
  sorry

/-- For `k` algebraic over `F_p`, `n = 2`, `p` odd, `H` finite and irreducible with eigenvalues
in `k`: enormous ⇔ adequate (Gee–Newton 3.2.3). -/
theorem isEnormous_iff_isAdequate_of_two (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] (H : Subgroup (GL (Fin 2) k)) [Finite H]
    (_hp : p ≠ 2)
    (_hirr : Submodule.span k ((fun g : GL (Fin 2) k => (g : Matrix (Fin 2) (Fin 2) k)) ''
      (H : Set (GL (Fin 2) k))) = ⊤)
    (_heig : ∀ h ∈ H, ∃ s : Multiset k,
      Matrix.charpoly (h : Matrix (Fin 2) (Fin 2) k) = (s.map fun a => X - C a).prod) :
    IsEnormous H ↔ IsAdequate H := by
  sorry

/-- `TauCeti.ResidualImage.IsEnormous.eq_of_normal_pGroup_quotient`: An enormous `H` has no proper normal subgroup with `p`-group quotient. -/
theorem IsEnormous.eq_of_normal_pGroup_quotient {H : Subgroup (GL n k)} (_h : IsEnormous H)
    (N : Subgroup H) [N.Normal] (_hN : IsPGroup (ringChar k) (H ⧸ N)) : N = ⊤ := by
  sorry

/-- `TauCeti.ResidualImage.IsEnormous.map_conj`: for `k` algebraic over `F_p`, enormity is
invariant under conjugation by `GL_n(k̄)` and under multiplying `H` by scalars. -/
theorem IsEnormous.map_conj (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] {H : Subgroup (GL n k)}
    (g : GL n (AlgebraicClosure k))
    (_h : IsEnormous H) :
    IsEnormous ((H.map (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)))).map
        (MulAut.conj g).toMonoidHom) ∧
      IsEnormous (H ⊔ (Matrix.GeneralLinearGroup.scalar n).range) := by
  sorry

end Enormous

/-- Unit test: TauCeti.ResidualImage.isEnormous_SL2_ZMod7. -/
example [Fact (Nat.Prime 7)] :
    IsEnormous (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 7))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isEnormous_SL2_ZMod5. `SL₂(F_5)` is absolutely
irreducible, has no quotient of order 5 and satisfies (3); it fails to be enormous only because
`H¹(SL₂(F_5), ad⁰) ≠ 0`. -/
example [Fact (Nat.Prime 5)] (H : Subgroup (GL (Fin 2) (ZMod 5)))
    (_hH : H = Matrix.SpecialLinearGroup.toGL.range) :
    Submodule.span (ZMod 5) ((fun g : GL (Fin 2) (ZMod 5) => (g : Matrix (Fin 2) (Fin 2) (ZMod 5))) ''
        (H : Set (GL (Fin 2) (ZMod 5)))) = ⊤ ∧
      (∀ (N : Subgroup H) [N.Normal], IsPGroup 5 (H ⧸ N) → N = ⊤) ∧
      (∀ W : Submodule (ZMod 5) (LinearMap.ker (LinearMap.trace (ZMod 5) (Fin 2 → ZMod 5))),
        G7.IsSimpleStable (G7.adZeroRep H.subtype) W →
        ∃ h : H, IsRegularSemisimple (h : GL (Fin 2) (ZMod 5)) ∧ ∃ w ∈ W, w ≠ 0 ∧
          G7.adZeroRep H.subtype h w = w) ∧
      ¬ Subsingleton (groupCohomology (G7.adZeroRepObj H.subtype) 1) ∧
      ¬ IsEnormous H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isEnormous_SL2_ZMod3. -/
example : ¬ IsEnormous (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 3))) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isEnormous_of_dvd. (`n` nonempty: for `n = ∅` the
trivial group satisfies every condition and `p ∣ 0`.) -/
example {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n] [Nonempty n]
    (_h : ringChar k ∣ Fintype.card n) (H : Subgroup (GL n k)) : ¬ IsEnormous H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isEnormous_of_rank_one. `k` is algebraic over `F_p`, as in
the definition: over `F_p(t)` the subgroup generated by `t` has the quotient `ℤ/p`. -/
example {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [Algebra (ZMod p) k]
    [Algebra.IsAlgebraic (ZMod p) k] (H : Subgroup (GL (Fin 1) k)) :
    IsEnormous H := by
  sorry

/- TauCeti.ResidualImage.not_isEnormous_Q8_tensor_Q8 (unit test, comment fallback): for `p` odd the
image of `Q₈ × Q₈` in `GL_4(F̄_p)` on the tensor product of the two-dimensional representations is
adequate but not enormous (no regular semisimple element acts with a fixed vector on every simple
constituent of `ad⁰`); needs an explicit model of `Q₈ ⊗ Q₈`. -/

/-- Unit test: TauCeti.ResidualImage.isEnormous_baseChange_iff. -/
example [Fact (Nat.Prime 7)] :
    IsEnormous (Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 7))) ∧
    IsEnormous ((Matrix.SpecialLinearGroup.toGL.range : Subgroup (GL (Fin 2) (ZMod 7))).map
      (Matrix.GeneralLinearGroup.map (algebraMap (ZMod 7) (GaloisField 7 2)))) := by
  sorry

/-! ### Galois descent for stable subspaces of V ⊗_k k′ (ArithmeticGaloisRepresentations:G7/galois-descent-of-stable-subspaces) -/

/-- ArithmeticGaloisRepresentations:G7/galois-descent-of-stable-subspaces: for a Galois extension
`k'/k` (possibly infinite) and a `k'`-subspace `W'` of `k' ⊗_k V` stable under `σ ⊗ 1` for all
`σ ∈ Gal(k'/k)`, `W'` is spanned over `k'` by its elements of the form `1 ⊗ v`, i.e.
`W' = (W' ∩ V) ⊗_k k'`. -/
theorem span_inter_eq_of_galois_stable {k k' : Type*} [Field k] [Field k'] [Algebra k k']
    [IsGalois k k'] {V : Type*} [AddCommGroup V] [Module k V] (W' : Submodule k' (k' ⊗[k] V))
    (_hW : ∀ σ : k' ≃ₐ[k] k', ∀ w ∈ W', LinearMap.rTensor V σ.toLinearMap w ∈ W') :
    Submodule.span k' {w : k' ⊗[k] V | w ∈ W' ∧ ∃ v : V, w = (1 : k') ⊗ₜ[k] v} = W' := by
  sorry

/-! ### Enormous subgroups of GL_n(O) in characteristic zero (Newton–Thorne) and the Zariski-closure criterion (ArithmeticGaloisRepresentations:G7/characteristic-zero-enormous-subgroups) -/

section EnormousCharZero

variable {n : Type} [Fintype n] [DecidableEq n]

/-- `H ≤ GL_n(O)` is enormous in the characteristic-zero sense (Newton–Thorne 2023, Definition
2.23): every simple `E[H]`-submodule `V ⊆ M_n(E)` (the whole of `ad ⊗ E`) has
`tr(e_{h,α} V) ≠ 0` for some `h ∈ H` with `n` distinct eigenvalues in `E` and an eigenvalue `α`. -/
def IsEnormousCharZero {O : Type*} [CommRing O] {E : Type*} [Field E] [Algebra O E]
    (H : Subgroup (GL n O)) : Prop :=
  ∀ W : Submodule E (Module.End E (n → E)),
    G7.IsSimpleStable (G7.adRep ((Matrix.GeneralLinearGroup.map (algebraMap O E)).comp H.subtype)) W →
    ∃ h ∈ H, (∃ s : Multiset E, s.Nodup ∧
        Matrix.charpoly ((h : Matrix n n O).map (algebraMap O E)) = (s.map fun a => X - C a).prod) ∧
      ∃ α : E, ∃ w ∈ W, LinearMap.trace E (n → E)
        (G7.eigenProj (G7.matrixRep (Matrix.GeneralLinearGroup.map (algebraMap O E)) h) α * w) ≠ 0

/-- Lemma 2.25: an enormous `H` acts absolutely irreducibly on `E^n`, so `H⁰(H, ad⁰ ⊗ E) = 0`. -/
theorem IsEnormousCharZero.absolutelyIrreducible {O : Type*} [CommRing O] {E : Type*} [Field E]
    [Algebra O E] {H : Subgroup (GL n O)} (_h : IsEnormousCharZero (E := E) H) :
    Submodule.span E ((fun g : GL n O => ((g : Matrix n n O).map (algebraMap O E))) ''
      (H : Set (GL n O))) = ⊤ := by
  sorry

/-- `TauCeti.ResidualImage.IsEnormousCharZero.mono`: Lemma 2.28(1): an `H` with split
characteristic polynomials containing an enormous subgroup is enormous. (§2.5 of the source also
takes `H` compact and the subgroup closed; neither is used in the proof, and both are dropped.) -/
theorem IsEnormousCharZero.mono {O : Type*} [CommRing O] {E : Type*} [Field E] [Algebra O E]
    {H H' : Subgroup (GL n O)} (_hle : H' ≤ H)
    (_hsplit : ∀ h ∈ H, ∃ s : Multiset E,
      Matrix.charpoly ((h : Matrix n n O).map (algebraMap O E)) = (s.map fun a => X - C a).prod)
    (_h : IsEnormousCharZero (E := E) H') : IsEnormousCharZero (E := E) H := by
  sorry

/- TauCeti.ResidualImage.isEnormousCharZero_of_zariskiClosure (comment fallback): Lemma 2.28(2):
if `H` has split characteristic polynomials and the identity component `G°` of its Zariski closure
contains regular semisimple elements and acts absolutely irreducibly on `E^n`, then `H` is
enormous (needs identity components of algebraic groups). §2.5 of the source also takes `H`
compact; the proof (Zariski density of the regular semisimple elements of `H`) does not use it,
and it is dropped here as in `IsEnormousCharZero.mono`. -/

/- TauCeti.ResidualImage.isEnormousCharZero_of_derived (comment fallback): Newton–Thorne 2026,
Lemma 4.7 form: if the derived subgroup `G¹` of `G°` contains regular semisimple elements, acts
absolutely irreducibly, and lies in the Zariski closure of `H`, then `H` is enormous. -/

/-- `TauCeti.ResidualImage.IsEnormousCharZero.baseChange`: Enormity is preserved by enlarging `E` to a finite extension `E'`. -/
theorem IsEnormousCharZero.baseChange {O : Type*} [CommRing O] {E : Type*} [Field E] [Algebra O E]
    {E' : Type*} [Field E'] [Algebra E E'] [Algebra O E'] [IsScalarTower O E E']
    [FiniteDimensional E E'] {H : Subgroup (GL n O)} (_h : IsEnormousCharZero (E := E) H) :
    IsEnormousCharZero (E := E') H := by
  sorry

end EnormousCharZero

/-- Unit test: TauCeti.ResidualImage.isEnormousCharZero_SL2. Every open subgroup `H` of
`SL₂(ℤ_p)` is enormous over `ℚ_p`, by direct verification with `h = diag(a, a⁻¹) ∈ H`, `a² ≠ 1`
(Lemma 2.28(2) does not apply over `ℚ_p`: not all characteristic polynomials split). -/
example (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) ℤ_[p]))
    (_hSL : H ≤ (Matrix.SpecialLinearGroup.toGL).range) (_hcpt : IsCompact (H : Set (GL (Fin 2) ℤ_[p])))
    (_hfi : (H.subgroupOf (Matrix.SpecialLinearGroup.toGL).range).FiniteIndex) :
    IsEnormousCharZero (E := ℚ_[p]) H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_isEnormousCharZero_of_reducible. A group of diagonal
matrices is not enormous, although it may contain elements with distinct eigenvalues. -/
example (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) ℤ_[p]))
    (_hdiag : ∀ g ∈ H, (g : Matrix (Fin 2) (Fin 2) ℤ_[p]).IsDiag) :
    ¬ IsEnormousCharZero (E := ℚ_[p]) H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.IsEnormousCharZero.absolutelyIrreducible. -/
example (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 2) ℤ_[p]))
    (_h : IsEnormousCharZero (E := ℚ_[p]) H) :
    Submodule.span ℚ_[p] ((fun g : GL (Fin 2) ℤ_[p] =>
      ((g : Matrix (Fin 2) (Fin 2) ℤ_[p]).map (algebraMap ℤ_[p] ℚ_[p]))) ''
        (H : Set (GL (Fin 2) ℤ_[p]))) = ⊤ := by
  sorry

/-- Unit test: TauCeti.ResidualImage.isEnormousCharZero_rank_one. -/
example (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin 1) ℤ_[p])) :
    IsEnormousCharZero (E := ℚ_[p]) H := by
  sorry

/-! ### Symmetric powers of groups containing SL₂(F_l) are enormous, and the Galois-theoretic consequence after restriction to F'(ζ_l) (ArithmeticGaloisRepresentations:G7/enormous-symmetric-powers) -/

/-- ArithmeticGaloisRepresentations:G7/enormous-symmetric-powers, part (2) (Allen et al. 2023,
Lemma 7.1.4, codomain `GL_n`): if `n ≥ 2`, `l > 2n + 1` and `H ⊆ GL_2(F̄_l)` is finite and contains
`SL_2(F_l)`, then `Sym^{n−1} H ⊆ GL_n(F̄_l)` is enormous. -/
theorem isEnormous_symPower_of_SL2_le (l : ℕ) [Fact l.Prime] (n : ℕ) (_hn : 2 ≤ n)
    (_hl : 2 * n + 1 < l) (H : Subgroup (GL (Fin 2) (AlgebraicClosure (ZMod l)))) [Finite H]
    (_hSL : (Matrix.SpecialLinearGroup.mapGL (AlgebraicClosure (ZMod l)) :
      Matrix.SpecialLinearGroup (Fin 2) (ZMod l) →* GL (Fin 2) (AlgebraicClosure (ZMod l))).range ≤ H) :
    IsEnormous (H.map (G7.symPowerGL (AlgebraicClosure (ZMod l)) (n - 1))) := by
  sorry

/-! ### H¹(SL₂(F), ad⁰) vanishes unless #F = 5, and the symmetric-power vanishing behind the bound p > 2n + 1 (ArithmeticGaloisRepresentations:G7/h1-of-sl2-with-adjoint-coefficients) -/

/-- ArithmeticGaloisRepresentations:G7/h1-of-sl2-with-adjoint-coefficients, part (a)
(Darmon–Diamond–Taylor 2.48): for a finite field `F` of odd characteristic with `#F ≠ 5`,
`H⁰(SL₂(F), ad⁰) = H¹(SL₂(F), ad⁰) = 0`. -/
theorem h1_SL2_adZero_eq_zero (F : Type) [Field F] [Fintype F] (_hp : ringChar F ≠ 2)
    (_h5 : Fintype.card F ≠ 5) :
    Subsingleton (groupCohomology ((G7.adZeroRepObj
      (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) F →* GL (Fin 2) F))) 0) ∧
    Subsingleton (groupCohomology ((G7.adZeroRepObj
      (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) F →* GL (Fin 2) F))) 1) := by
  sorry

/-- ArithmeticGaloisRepresentations:G7/h1-of-sl2-with-adjoint-coefficients, part (b):
`H¹(SL₂(F_5), ad⁰) ≠ 0` while `H¹(GL₂(F_5), ad⁰) = 0` (the second is
`h1_GL2_adZero_eq_zero 5`); BLGG13 v1 Proposition A.2.1 asserts the opposite of the second. Part
(c) is `h1_SL2_symPower_eq_zero`. -/
theorem h1_SL2_ZMod5_adZero_ne_zero [Fact (Nat.Prime 5)] :
    ¬ Subsingleton (groupCohomology ((G7.adZeroRepObj
      (Matrix.SpecialLinearGroup.toGL :
        Matrix.SpecialLinearGroup (Fin 2) (ZMod 5) →* GL (Fin 2) (ZMod 5)))) 1) ∧
    Subsingleton (groupCohomology
      (G7.adZeroRepObj (MonoidHom.id (GL (Fin 2) (ZMod 5)))) 1) := by
  sorry

/-! ### Mod p Clebsch–Gordan decompositions: V ⊗ Sym^{r−1}V, the two-constituent congruence for Sym^{p+r−1}V, and End(Sym^{n−1}V) (ArithmeticGaloisRepresentations:G7/mod-p-clebsch-gordan-decompositions) -/

/-- ArithmeticGaloisRepresentations:G7/mod-p-clebsch-gordan-decompositions, part (a)
(Newton–Thorne 2026, (1.3)), which is the node G7/pieri-splitting-for-symmetric-powers: for `V`
of rank two and `r ≥ 2` invertible in `k`, `V ⊗ Sym^{r−1} V ≅ Sym^r V ⊕ (det ⊗ Sym^{r−2} V)`.
(Part (d) is `tensor_symPower_symPower_equiv` below; (b), (c) are stated in the roadmap.) -/
theorem tensor_symPower_equiv {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {k : Type} [Field k]
    [TopologicalSpace k] {V : Type*} [AddCommGroup V] [Module k V] [Module.Finite k V]
    [TopologicalSpace V] [IsModuleTopology k V] (ρ : ContinuousRep Γ k V)
    (_hV : Module.finrank k V = 2) (r : ℕ) (_hr : 2 ≤ r) (_hinv : (r : k) ≠ 0) :
    ∃ e : V ⊗[k] Sym[k]^(r - 1) V ≃ₗ[k] Sym[k]^r V × Sym[k]^(r - 2) V,
      ∀ (g : Γ) (x : V ⊗[k] Sym[k]^(r - 1) V),
        e (TensorProduct.map (ρ g) ((ρ.symPower (r - 1)) g) x) =
          ((ρ.symPower r) g (e x).1, ((ρ.det g : kˣ) : k) • (ρ.symPower (r - 2)) g (e x).2) := by
  sorry

/-! ### V ⊗ Sym^{r−1}V ≅ Sym^rV ⊕ det ⊗ Sym^{r−2}V for r invertible (ArithmeticGaloisRepresentations:G7/pieri-splitting-for-symmetric-powers) -/

/-- ArithmeticGaloisRepresentations:G7/pieri-splitting-for-symmetric-powers: the statement is
`tensor_symPower_equiv` of the preceding section (part (a) of the Clebsch–Gordan node), repeated
under the node's own name. -/
theorem pieri_splitting_symPower {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {k : Type} [Field k]
    [TopologicalSpace k] {V : Type*} [AddCommGroup V] [Module k V] [Module.Finite k V]
    [TopologicalSpace V] [IsModuleTopology k V] (ρ : ContinuousRep Γ k V)
    (hV : Module.finrank k V = 2) (r : ℕ) (hr : 2 ≤ r) (hinv : (r : k) ≠ 0) :
    ∃ e : V ⊗[k] Sym[k]^(r - 1) V ≃ₗ[k] Sym[k]^r V × Sym[k]^(r - 2) V,
      ∀ (g : Γ) (x : V ⊗[k] Sym[k]^(r - 1) V),
        e (TensorProduct.map (ρ g) ((ρ.symPower (r - 1)) g) x) =
          ((ρ.symPower r) g (e x).1, ((ρ.det g : kˣ) : k) • (ρ.symPower (r - 2)) g (e x).2) :=
  tensor_symPower_equiv ρ hV r hr hinv

/-! ### Sym^aV ⊗ Sym^bV ≅ ⊕ det^i ⊗ Sym^{a+b−2i}V when (a + b)! is invertible (ArithmeticGaloisRepresentations:G7/tensor-products-of-symmetric-powers) -/

/-- ArithmeticGaloisRepresentations:G7/tensor-products-of-symmetric-powers: for `V` of rank two,
`a ≥ b` and `(a + b)!` invertible in `k`, `Sym^a V ⊗ Sym^b V ≅ ⊕_{i=0}^{b} det^i ⊗ Sym^{a+b−2i} V`
as representations of `Γ` (no hypothesis on `Γ`). The consequence
`End(Sym^{n−1} V) ≅ ⊕ Sym^{2i} V ⊗ det^{−i}` for `(2n − 2)!` invertible is stated in the roadmap
(it needs the dual of a symmetric power). -/
theorem tensor_symPower_symPower_equiv {Γ : Type*} [Group Γ] [TopologicalSpace Γ] {k : Type}
    [Field k] [TopologicalSpace k] {V : Type*} [AddCommGroup V] [Module k V] [Module.Finite k V]
    [TopologicalSpace V] [IsModuleTopology k V] (ρ : ContinuousRep Γ k V)
    (_hV : Module.finrank k V = 2) (a b : ℕ) (_hab : b ≤ a)
    (_hinv : ((a + b).factorial : k) ≠ 0) :
    ∃ e : Sym[k]^a V ⊗[k] Sym[k]^b V ≃ₗ[k] ((i : Fin (b + 1)) → Sym[k]^(a + b - 2 * (i : ℕ)) V),
      ∀ (g : Γ) (x : Sym[k]^a V ⊗[k] Sym[k]^b V) (i : Fin (b + 1)),
        e (TensorProduct.map ((ρ.symPower a) g) ((ρ.symPower b) g) x) i =
          ((ρ.det g : kˣ) : k) ^ (i : ℕ) • (ρ.symPower (a + b - 2 * (i : ℕ))) g (e x i) := by
  sorry

/-! ### Irreducibility of small symmetric powers of SL₂(F) and the one-dimensional constituents of their adjoints (ArithmeticGaloisRepresentations:G7/adjoint-invariants-of-symmetric-powers) -/

/-- ArithmeticGaloisRepresentations:G7/adjoint-invariants-of-symmetric-powers, part (a): for
`0 ≤ a ≤ p − 1`, `Sym^a(F̄_p^2)` is an absolutely irreducible representation of `SL_2(F)`. -/
theorem symPower_SL2_absolutelyIrreducible (F : Type*) [Field F] [Fintype F] (L : Type*) [Field L]
    [IsAlgClosed L] [Algebra F L] (a : ℕ) (_ha : a + 1 ≤ ringChar F) :
    Submodule.span L (Set.range fun g : Matrix.SpecialLinearGroup (Fin 2) F =>
      (G7.symPowerGL L a (Matrix.SpecialLinearGroup.mapGL L g) : Matrix (Fin (a + 1)) (Fin (a + 1)) L)) =
      ⊤ := by
  sorry

/-! ### Adequacy of symmetric powers and Frobenius-twisted tensor products of large SL₂ images, with one common threshold (ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers) -/

/-- ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers, part (3): if a finite
`H ⊆ GL_2(k)` contains `SL_2(F_p)` and `p ≥ 2n + 2`, then `Sym^{n−1} H` is adequate. ((1) and the
common threshold `a₀(p)` of (2) are stated in the roadmap.) -/
theorem isAdequate_symPower_of_SL2_le {k : Type} [Field k] (p : ℕ) [Fact p.Prime] [CharP k p]
    (n : ℕ) (_hn : 1 ≤ n) (_hp : 2 * n + 2 ≤ p) (H : Subgroup (GL (Fin 2) k)) [Finite H]
    (_hSL : ((Matrix.GeneralLinearGroup.map (ZMod.castHom (dvd_refl p) k)).comp
      (Matrix.SpecialLinearGroup.toGL :
        Matrix.SpecialLinearGroup (Fin 2) (ZMod p) →* GL (Fin 2) (ZMod p))).range ≤ H) :
    IsAdequate (H.map (G7.symPowerGL k (n - 1))) := by
  sorry

end ResidualImage

/-! ### Enormous and weakly enormous subgroups of GSp₄(k); vast and tidy GSp₄-valued representations (ArithmeticGaloisRepresentations:G7/vast-tidy-and-enormous-gsp4-subgroups) -/

namespace G7

/-- `ad⁰ = sp_4` (dimension 10) with the adjoint action through `r : G → GSp_4(K)`. -/
def gsp4AdZeroOf {G : Type*} [Group G] {K : Type*} [Field K]
    (r : G →* SimilitudeGroup.GSp 2 K) : Representation K G (lieZero (J4 K)) :=
  (matConjRep (gsp4ToGL r)).subrepresentation _ (by sorry)

/-- The map `GSp_4(K) → GSp_4(L)` induced by `K → L`. -/
def gsp4BaseChange (K L : Type*) [Field K] [Field L] [Algebra K L] :
    SimilitudeGroup.GSp 2 K →* SimilitudeGroup.GSp 2 L where
  toFun g := ⟨(Matrix.GeneralLinearGroup.map (algebraMap K L) g.1.1,
    Units.map (algebraMap K L).toMonoidHom g.1.2), sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- The mod `p` cyclotomic character `ε̄ : G_F → kˣ` for a field `k` of characteristic `p`. -/
def modCyclotomic (F : Type*) [Field F] (k : Type*) [Field k] :
    Field.absoluteGaloisGroup F →* kˣ :=
  sorry

end G7

namespace ResidualImage.GSp4

variable {k : Type} [Field k]

/-- Weakly enormous (BCGP21 7.5.2): (E2) `H` acts absolutely irreducibly on `k^4`, and (E3) every
simple `k̄[H]`-submodule `W ⊆ k̄ ⊗ sp_4` has `1` as an eigenvalue of some `h ∈ H` with four distinct
eigenvalues. -/
def IsWeaklyEnormous (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  Submodule.span k (Set.range fun h : H => G7.gsp4Mat (h : SimilitudeGroup.GSp 2 k)) = ⊤ ∧
  ∀ W : Submodule (AlgebraicClosure k) (G7.lieZero (G7.J4 (AlgebraicClosure k))),
    G7.IsSimpleStable
      (G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp H.subtype)) W →
    ∃ h : H, (G7.gsp4Mat (h : SimilitudeGroup.GSp 2 k)).charpoly.Separable ∧ ∃ w ∈ W, w ≠ 0 ∧
      G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp H.subtype) h w = w

/-- Enormous (BCGP21 7.5.2): (E1) `H¹(H, ad⁰) = 0` with `ad⁰ = sp_4`, together with (E2), (E3); no
`p`-power quotient condition. -/
def IsEnormous (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  Subsingleton (groupCohomology
    (Rep.of (X := G7.lieZero (G7.J4 k)) (G7.gsp4AdZeroOf H.subtype)) 1) ∧ IsWeaklyEnormous H

/-- Tidy (BCGP21 7.5.11): some `h ∈ H` has `ν(h) ≠ 1` and no two eigenvalues `λ, μ` of `h` (in `k̄`,
with multiplicity) satisfy `λ = ν(h) μ`. -/
def IsTidy (H : Subgroup (SimilitudeGroup.GSp 2 k)) : Prop :=
  ∃ h ∈ H, G7.gsp4Nu h ≠ 1 ∧
    ∀ a ∈ ((G7.gsp4Mat h).map (algebraMap k (AlgebraicClosure k))).charpoly.roots,
      ∀ b ∈ ((G7.gsp4Mat h).map (algebraMap k (AlgebraicClosure k))).charpoly.roots,
        a ≠ algebraMap k (AlgebraicClosure k) (G7.gsp4Nu h : k) * b

/-- Vast (BCGP21 7.5.6): `ρ̄(G_{F(ζ_{p^N})})` is enormous for all large `N`, or weakly enormous for
all large `N` with `ζ_p` not in the field cut out by `ad⁰ ρ̄`. -/
def IsVast {F : Type} [Field F] (ρ : Field.absoluteGaloisGroup F →* SimilitudeGroup.GSp 2 k) :
    Prop :=
  (∀ᶠ N in Filter.atTop, IsEnormous ((G7.cyclotomicSubgroup F (ringChar k ^ N)).map ρ)) ∨
  ((∀ᶠ N in Filter.atTop, IsWeaklyEnormous ((G7.cyclotomicSubgroup F (ringChar k ^ N)).map ρ)) ∧
    ¬ (MonoidHom.ker (G7.gsp4AdZeroOf ρ) ≤ G7.cyclotomicSubgroup F (ringChar k)))

/-- Lemma 7.5.3: (weak) enormity depends only on the image in `PGSp_4(k)`. -/
theorem isEnormous_iff_of_projective_eq (H H' : Subgroup (SimilitudeGroup.GSp 2 k))
    (_h : H ⊔ Subgroup.center _ = H' ⊔ Subgroup.center _) :
    (IsEnormous H ↔ IsEnormous H') ∧ (IsWeaklyEnormous H ↔ IsWeaklyEnormous H') := by
  sorry

/-- `TauCeti.ResidualImage.GSp4.IsWeaklyEnormous.mono`: Weak enormity and tidiness pass to overgroups. -/
theorem IsWeaklyEnormous.mono {H H' : Subgroup (SimilitudeGroup.GSp 2 k)} (_hle : H' ≤ H) :
    (IsWeaklyEnormous H' → IsWeaklyEnormous H) ∧ (IsTidy H' → IsTidy H) := by
  sorry

/-- Lemma 7.5.5: `ρ̄(G_{F(ζ_{p^N})})` is independent of `N` for `N ≥ 1 + δ` (`p ≥ 5`) or
`N ≥ 2 + δ` (`p = 3`), with `δ` depending only on `F` (and `δ = 1` if `p` is unramified in `F`,
not stated here). -/
theorem image_cyclotomic_stabilises [Finite k] (_hp : 3 ≤ ringChar k) (F : Type) [Field F]
    [NumberField F] :
    ∃ δ : ℕ, ∀ (ρ : Field.absoluteGaloisGroup F →* SimilitudeGroup.GSp 2 k) (N : ℕ),
      (if 5 ≤ ringChar k then 1 + δ else 2 + δ) ≤ N →
        (G7.cyclotomicSubgroup F (ringChar k ^ N)).map ρ =
          (G7.cyclotomicSubgroup F (ringChar k ^ (N + 1))).map ρ := by
  sorry

/-- Remark 7.5.8: `ρ̄` is vast iff `ρ̄ ⊗ χ` is vast. -/
theorem isVast_twist_iff {F : Type} [Field F]
    (ρ ρ' : Field.absoluteGaloisGroup F →* SimilitudeGroup.GSp 2 k)
    (χ : Field.absoluteGaloisGroup F →* kˣ)
    (_h : ∀ σ, G7.gsp4Mat (ρ' σ) = ((χ σ : kˣ) : k) • G7.gsp4Mat (ρ σ)) :
    IsVast ρ ↔ IsVast ρ' := by
  sorry

/-- `TauCeti.ResidualImage.GSp4.IsEnormous.toGL4`: Relation with `GL_4`: (E2) is absolute irreducibility in `GL_4(k)`; the `GL_4` notion of Allen
et al. (with `sl_4` and the `p`-power condition) is not implied. -/
theorem IsEnormous.toGL4 {H : Subgroup (SimilitudeGroup.GSp 2 k)} (_h : IsEnormous H) :
    Submodule.span k (Set.range fun h : H => G7.gsp4Mat (h : SimilitudeGroup.GSp 2 k)) = ⊤ := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.isEnormous_Sp4_ZMod7. -/
example [Fact (Nat.Prime 7)] :
    IsEnormous (SimilitudeGroup.multiplier (G7.J4 (ZMod 7)) (ZMod 7)).ker := by
  sorry

/- TauCeti.ResidualImage.GSp4.isWeaklyEnormous_not_isEnormous_wreath_ZMod5 (unit test, comment
fallback): `SL₂(ZMod 5) ≀ Z/2Z ⊆ Sp₄(ZMod 5)` is weakly enormous but not enormous; needs an
explicit model of the wreath product inside `Sp_4`. -/

/- TauCeti.ResidualImage.GSp4.isEnormous_SL2wr_ZMod3 (unit test, comment fallback):
`SL₂(ZMod 3) ≀ Z/2Z ⊆ Sp₄(ZMod 3)` is enormous in the `GSp_4` sense although it has a quotient of
order 3. -/

/-- Unit test: TauCeti.ResidualImage.GSp4.isTidy_of_center. -/
example (H : Subgroup (SimilitudeGroup.GSp 2 k))
    (_hirr : Submodule.span k (Set.range fun h : H => G7.gsp4Mat (h : SimilitudeGroup.GSp 2 k)) = ⊤)
    (_hc : 3 ≤ Nat.card (Subgroup.center H)) : IsTidy H := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.not_isTidy_Sp4. -/
example (H : Subgroup (SimilitudeGroup.GSp 2 k))
    (_hH : H ≤ (SimilitudeGroup.multiplier (G7.J4 k) k).ker) : ¬ IsTidy H := by
  sorry

/-! ### Verification of vast and tidy images in GSp₄: Galois cohomology vanishing, Sp₄(F_p), induced representations, wreath products and the p = 3 computations (ArithmeticGaloisRepresentations:G7/gsp4-big-image-verification) -/

/-- ArithmeticGaloisRepresentations:G7/gsp4-big-image-verification, part (5) (BCGP21 Lemma 7.5.15):
for `p ≥ 3`, `Sp_4(F_p)` is enormous and `GSp_4(F_p)` is tidy. (Parts (1)–(4), (6)–(12) are stated
in the roadmap.) -/
theorem isEnormous_Sp4_and_isTidy_GSp4 (p : ℕ) [Fact p.Prime] (_hp : 3 ≤ p) :
    IsEnormous (SimilitudeGroup.multiplier (G7.J4 (ZMod p)) (ZMod p)).ker ∧
      IsTidy (⊤ : Subgroup (SimilitudeGroup.GSp 2 (ZMod p))) := by
  sorry

/-! ### The image over the 3-power cyclotomic tower of an induction with image SL₂(F_3) ≀ Z/2Z does not shrink (ArithmeticGaloisRepresentations:G7/image-in-the-3-cyclotomic-tower-for-sl2-wreath-products) -/

/- ArithmeticGaloisRepresentations:G7/image-in-the-3-cyclotomic-tower-for-sl2-wreath-products
(lemma, comment block: needs an explicit model of `SL₂(F_3) ≀ Z/2Z` inside `Sp_4(F_3)`, as for the
unit tests on wreath products above). Let `G = SL₂(F_3) ≀ Z/2Z ⊆ Sp_4(F_3)` and `Γ ⊆ GSp_4(F_3)`
with `Γ ⊆ {(A, B)σ^e : det A = det B}`, `Γ ∩ Sp_4(F_3) = G` and `ν(Γ) = {±1}`. If `N ⊴ Γ`,
`N ⊆ G`, `G/N` is a 3-group and `Γ/N` is abelian, then `N = G`. Consequently, for
`ρ̄ : G_F → GSp_4(F_3)` with image `Γ`, similitude character `ε̄⁻¹` and `ρ̄(G_{F(ζ_3)}) = G`, the
image `ρ̄(G_{F(ζ_{3^M})})` is `G` for every `M ≥ 1`. -/

/-! ### The big image assumption (H1)–(H3) for GSp₄-valued residual representations of G_Q (ArithmeticGaloisRepresentations:G7/cg20-big-image-assumption) -/

/-- (H2): for every `m ≥ 1` some `σ ∈ G_{ℚ(ζ_{p^m})}` has `r̄(σ)` with four distinct eigenvalues
and eigenvalue `1` on each irreducible constituent `W/W'` of `ad⁰(r̄) ⊗ k̄` as a
`k̄[G_{ℚ(ζ_{p^m})}]`-module. -/
def G7.BigImageH2 (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k) : Prop :=
  ∀ m : ℕ, 1 ≤ m → ∃ σ ∈ G7.cyclotomicSubgroup ℚ (ringChar k ^ m),
    (G7.gsp4Mat (r σ)).charpoly.Separable ∧
    ∀ W W' : Submodule (AlgebraicClosure k) (G7.lieZero (G7.J4 (AlgebraicClosure k))), W' < W →
      (∀ τ ∈ G7.cyclotomicSubgroup ℚ (ringChar k ^ m),
        W ≤ W.comap (G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp r) τ) ∧
        W' ≤ W'.comap (G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp r) τ)) →
      (∀ U : Submodule (AlgebraicClosure k) (G7.lieZero (G7.J4 (AlgebraicClosure k))),
        (∀ τ ∈ G7.cyclotomicSubgroup ℚ (ringChar k ^ m),
          U ≤ U.comap (G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp r) τ)) →
        W' ≤ U → U ≤ W → U = W' ∨ U = W) →
      ∃ w ∈ W, w ∉ W' ∧
        G7.gsp4AdZeroOf ((G7.gsp4BaseChange k (AlgebraicClosure k)).comp r) σ w - w ∈ W'

/-- `r̄ : G_ℚ → GSp_4(k)` has big image (Calegari–Geraghty 2020, Assumption 4.1): (H1)
`ζ_p ∉ ℚ(ad⁰ r̄)`, i.e. `ker(ad⁰ r̄) ⊄ G_{ℚ(ζ_p)}`; (H2) `G7.BigImageH2`; (H3) neither the image of
`G_ℚ` under `ad⁰(r̄)` nor that under `ad⁰(r̄)(1)` has a quotient of order `p`. The source's wording
also admits the stronger reading (H3′), with the image of `G_{ℚ(ζ_p)}`; see
`HasBigImage.of_h3_cyclotomic`. -/
def HasBigImage (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k) : Prop :=
  ¬ (MonoidHom.ker (G7.gsp4AdZeroOf r) ≤ G7.cyclotomicSubgroup ℚ (ringChar k)) ∧
  G7.BigImageH2 r ∧
  (∀ f : Field.absoluteGaloisGroup ℚ →* Multiplicative (ZMod (ringChar k)),
    (∀ σ, G7.gsp4AdZeroOf r σ = 1 → f σ = 1) → f = 1) ∧
  (∀ f : Field.absoluteGaloisGroup ℚ →* Multiplicative (ZMod (ringChar k)),
    (∀ σ, ((G7.modCyclotomic ℚ k σ : kˣ) : k) • G7.gsp4AdZeroOf r σ = 1 → f σ = 1) → f = 1)

/-- `ad(r̄) ≅ ad⁰(r̄) ⊕ 1` for `p > 2`, with the trivial action on the centre `k·1`. -/
theorem adjointRep_eq_sp4_add_trivial (_h2 : (2 : k) ≠ 0) :
    G7.lieZero (G7.J4 k) ⊔ Submodule.span k {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k)} =
        SimilitudeGroup.lie (G7.J4 k) ∧
      Disjoint (G7.lieZero (G7.J4 k))
        (Submodule.span k {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k)}) ∧
      ∀ g : SimilitudeGroup.GSp 2 k,
        G7.gsp4Mat g * 1 * (G7.gsp4Mat g⁻¹) = (1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k) := by
  sorry

/-- `TauCeti.ResidualImage.GSp4.HasBigImage.of_h3_cyclotomic`: (H1), (H2) and (H3′) — the image
of `G_{ℚ(ζ_p)}` under `ad⁰(r̄)` has no quotient of order `p` — imply big image; i.e. (H3′) ⇒ (H3). -/
theorem HasBigImage.of_h3_cyclotomic {r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k}
    (_h1 : ¬ (MonoidHom.ker (G7.gsp4AdZeroOf r) ≤ G7.cyclotomicSubgroup ℚ (ringChar k)))
    (_h2 : G7.BigImageH2 r)
    (_h3 : ∀ f : G7.cyclotomicSubgroup ℚ (ringChar k) →* Multiplicative (ZMod (ringChar k)),
      (∀ σ : G7.cyclotomicSubgroup ℚ (ringChar k),
        G7.gsp4AdZeroOf r (σ : Field.absoluteGaloisGroup ℚ) = 1 → f σ = 1) → f = 1) :
    HasBigImage r := by
  sorry

/-- (H1) from big image. -/
theorem HasBigImage.h1 {r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k}
    (_h : HasBigImage r) :
    ¬ (MonoidHom.ker (G7.gsp4AdZeroOf r) ≤ G7.cyclotomicSubgroup ℚ (ringChar k)) := by
  sorry

/-- `TauCeti.ResidualImage.GSp4.HasBigImage.exists_sigma`: (H2) from big image. -/
theorem HasBigImage.exists_sigma {r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k}
    (_h : HasBigImage r) : G7.BigImageH2 r := by
  sorry

/-- `TauCeti.ResidualImage.GSp4.HasBigImage.isVast`: With absolute irreducibility over every `ℚ(ζ_{p^N})`, big image implies vast. -/
theorem HasBigImage.isVast {r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k}
    (_h : HasBigImage r)
    (_hirr : ∀ N : ℕ, Submodule.span k (Set.range fun σ : G7.cyclotomicSubgroup ℚ (ringChar k ^ N) =>
      G7.gsp4Mat (r σ)) = ⊤) :
    IsVast r := by
  sorry

/-- Big image is unchanged by twisting `r̄` by a character (`ad⁰` is unchanged). -/
theorem hasBigImage_twist_iff (r r' : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k)
    (χ : Field.absoluteGaloisGroup ℚ →* kˣ)
    (_h : ∀ σ, G7.gsp4Mat (r' σ) = ((χ σ : kˣ) : k) • G7.gsp4Mat (r σ)) :
    HasBigImage r ↔ HasBigImage r' := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.hasBigImage_of_surjective. -/
example (p : ℕ) [Fact p.Prime] (_hp : 5 ≤ p)
    (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 (ZMod p))
    (_hr : Function.Surjective r) : HasBigImage r := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.not_hasBigImage_of_zeta_mem. For `p = 3` and `r̄` onto
`GSp_4(F_3)` with similitude character `ε̄⁻¹`, (H1) fails (`ν` mod squares factors through
`PGSp_4(F_3)`, so `ℚ(ζ_3) ⊆ ℚ(ad⁰ r̄)`), although `r̄` is vast. -/
example (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 (ZMod 3))
    (_hr : Function.Surjective r)
    (_hν : ∀ σ, G7.gsp4Nu (r σ) = (G7.modCyclotomic ℚ (ZMod 3) σ)⁻¹) :
    ¬ HasBigImage r ∧ IsVast r := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.adjoint_split. The last conjunct is the content of the
test: the action on the second summand `k·1` is trivial (not through the similitude character). -/
example (_h2 : (2 : k) ≠ 0) :
    G7.lieZero (G7.J4 k) ⊔ Submodule.span k {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k)} =
        SimilitudeGroup.lie (G7.J4 k) ∧
      Disjoint (G7.lieZero (G7.J4 k))
        (Submodule.span k {(1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k)}) ∧
      ∀ g : SimilitudeGroup.GSp 2 k,
        G7.gsp4Mat g * 1 * (G7.gsp4Mat g⁻¹) = (1 : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) k) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.GSp4.hasBigImage_isVast. -/
example (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 k) (_h : HasBigImage r)
    (_hirr : ∀ N : ℕ, Submodule.span k (Set.range fun σ : G7.cyclotomicSubgroup ℚ (ringChar k ^ N) =>
      G7.gsp4Mat (r σ)) = ⊤) :
    IsVast r := by
  sorry

/-! ### Examples of big image: surjective GSp₄(F_p) images and inductions from imaginary quadratic fields (ArithmeticGaloisRepresentations:G7/cg20-big-image-examples) -/

/-- ArithmeticGaloisRepresentations:G7/cg20-big-image-examples, part (2) (CG20 Example 4.11(2)):
if `p ≥ 5` and `r̄(G_ℚ) = GSp_4(F_p)` then `r̄` has big image. (Part (1), inductions from imaginary
quadratic fields, is stated in the roadmap.) -/
theorem hasBigImage_of_range_eq_top (p : ℕ) [Fact p.Prime] (_hp : 5 ≤ p)
    (r : Field.absoluteGaloisGroup ℚ →* SimilitudeGroup.GSp 2 (ZMod p))
    (_hr : r.range = ⊤) : HasBigImage r := by
  sorry

end ResidualImage.GSp4

/-! ### Taylor–Wiles image conditions: adequate or enormous image over F(ζ_p) and a scalar element outside G_{F(ζ_p)} (ArithmeticGaloisRepresentations:G7/taylor-wiles-image-conditions) -/

namespace ResidualImage

section TaylorWiles

variable {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n] {F : Type} [Field F]

/-- The Taylor–Wiles image conditions: (TW2) `s̄(G_{F(ζ_p)})` is adequate and (TW3) some
`σ ∈ G_F ∖ G_{F(ζ_p)}` has `s̄(σ)` scalar (`k` a finite field of characteristic `p` containing the
image). Decomposed genericity is AutomorphicGaloisRepresentationsPartII:AG2.7. -/
def TaylorWilesImageConditions (s : Field.absoluteGaloisGroup F →* GL n k) : Prop :=
  IsAdequate ((G7.cyclotomicSubgroup F (ringChar k)).map s) ∧
  ∃ σ, σ ∉ G7.cyclotomicSubgroup F (ringChar k) ∧ s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range

/-- The enormous variant: `s̄(G_{F(ζ_p)})` enormous and (TW3). -/
def EnormousTaylorWilesImageConditions (s : Field.absoluteGaloisGroup F →* GL n k) : Prop :=
  IsEnormous ((G7.cyclotomicSubgroup F (ringChar k)).map s) ∧
  ∃ σ, σ ∉ G7.cyclotomicSubgroup F (ringChar k) ∧ s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range

/-- (TW3) iff `ζ_p ∉ F̄^{ker ad s̄}`, for `F` of characteristic zero and `k` of prime
characteristic `p` (without these the two sides differ: in characteristic `p` there is no
primitive `p`-th root of unity). -/
theorem tw3_iff_zeta_not_mem [CharZero F] (_hk : (ringChar k).Prime)
    (s : Field.absoluteGaloisGroup F →* GL n k) :
    (∃ σ, σ ∉ G7.cyclotomicSubgroup F (ringChar k) ∧
        s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range) ↔
      ∀ ζ : AlgebraicClosure F, IsPrimitiveRoot ζ (ringChar k) →
        ζ ∉ IntermediateField.fixedField
          (Subgroup.comap s (Matrix.GeneralLinearGroup.scalar n).range) := by
  sorry

/-- Both conditions are invariant under `s̄ ↦ s̄ ⊗ χ` (`k` finite, as in the node: the proof uses
that the scalars `kˣ` have order prime to `p`). -/
theorem TaylorWilesImageConditions.twist [Finite k]
    (s s' : Field.absoluteGaloisGroup F →* GL n k)
    (χ : Field.absoluteGaloisGroup F →* kˣ)
    (_h : ∀ σ, s' σ = Matrix.GeneralLinearGroup.scalar n (χ σ) * s σ) :
    (TaylorWilesImageConditions s ↔ TaylorWilesImageConditions s') ∧
      (EnormousTaylorWilesImageConditions s ↔ EnormousTaylorWilesImageConditions s') := by
  sorry

/-- `TauCeti.ResidualImage.EnormousTaylorWilesImageConditions.toTaylorWiles`: If `k` contains all eigenvalues of `s̄(G_F)`, the enormous variant implies (a). -/
theorem EnormousTaylorWilesImageConditions.toTaylorWiles [Finite k]
    {s : Field.absoluteGaloisGroup F →* GL n k}
    (_heig : ∀ σ, ∃ t : Multiset k,
      Matrix.charpoly (s σ : Matrix n n k) = (t.map fun a => X - C a).prod)
    (_h : EnormousTaylorWilesImageConditions s) : TaylorWilesImageConditions s := by
  sorry

/-- `TauCeti.ResidualImage.TaylorWilesImageConditions.restrict`: restriction to `G_H` preserves
both conditions when `G_H → G_F/(ker s̄ ∩ G_{F(ζ_p)})` is onto, i.e. when the finite extension
`H/F` is linearly disjoint over `F` from `M(ζ_p)`, `M = F̄^{ker s̄}`; the hypothesis of BCGNT
Lemma 5.2.2 (G7/taylor-wiles-image-lemmas (1)) gives this. `_hjoint` is that surjectivity, written
elementwise: every `σ ∈ G_F` has the same image under `s̄`, and the same action on `ζ_p`, as the
image in `G_F` of some `τ ∈ G_H`. It implies `s̄(G_H) = s̄(G_F)` and
`s̄(G_{H(ζ_p)}) = s̄(G_{F(ζ_p)})`, and it carries the scalar element of (TW3). The two image
equalities alone are not enough: for `F = ℚ`, `H = ℚ(ζ_p)`, `s̄ = 1` they hold, and (TW3) fails
over `H`. -/
theorem TaylorWilesImageConditions.restrict (H : Type) [Field H] [Algebra F H]
    [FiniteDimensional F H] [Algebra (AlgebraicClosure F) (AlgebraicClosure H)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure H)]
    (s : Field.absoluteGaloisGroup F →* GL n k)
    (_hjoint : ∀ σ : Field.absoluteGaloisGroup F, ∃ τ : Field.absoluteGaloisGroup H,
      s (GaloisRep.localEmbeddingMap F H τ) = s σ ∧
      (GaloisRep.localEmbeddingMap F H τ)⁻¹ * σ ∈ G7.cyclotomicSubgroup F (ringChar k)) :
    (TaylorWilesImageConditions s →
        TaylorWilesImageConditions (s.comp (GaloisRep.localEmbeddingMap F H).toMonoidHom)) ∧
      (EnormousTaylorWilesImageConditions s →
        EnormousTaylorWilesImageConditions (s.comp (GaloisRep.localEmbeddingMap F H).toMonoidHom)) := by
  sorry

end TaylorWiles

/-- Unit test: TauCeti.ResidualImage.twImageConditions_rank_one. (`F` of characteristic zero, as
for a number field.) -/
example {k : Type} [Field k] [Finite k] {F : Type} [Field F] [CharZero F]
    (s : Field.absoluteGaloisGroup F →* GL (Fin 1) k) :
    TaylorWilesImageConditions s ↔ ∀ ζ : F, ¬ IsPrimitiveRoot ζ (ringChar k) := by
  sorry

/-- Unit test: TauCeti.ResidualImage.not_twImageConditions_of_zeta_mem. (`k` of prime
characteristic.) -/
example {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n] {F : Type} [Field F]
    (_hk : (ringChar k).Prime)
    (_hζ : ∃ ζ : F, IsPrimitiveRoot ζ (ringChar k)) (s : Field.absoluteGaloisGroup F →* GL n k) :
    ¬ TaylorWilesImageConditions s := by
  sorry

/-- Unit test: TauCeti.ResidualImage.twImageConditions_elliptic. -/
example [Fact (Nat.Prime 7)] (s : Field.absoluteGaloisGroup ℚ →* GL (Fin 2) (ZMod 7)) (_hs : Function.Surjective s)
    (_hdet : ∀ σ, Matrix.GeneralLinearGroup.det (s σ) =
      Units.map (PadicInt.toZMod : ℤ_[7] →+* ZMod 7).toMonoidHom
        (GaloisRep.cyclotomicCharacter ℚ 7 σ)) :
    TaylorWilesImageConditions s ∧ EnormousTaylorWilesImageConditions s := by
  sorry

/-- Unit test: TauCeti.ResidualImage.tw3_iff_zeta_not_mem. -/
example {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n] {F : Type} [Field F]
    [CharZero F] (_hk : (ringChar k).Prime) (s : Field.absoluteGaloisGroup F →* GL n k) :
    (∃ σ, σ ∉ G7.cyclotomicSubgroup F (ringChar k) ∧
        s σ ∈ (Matrix.GeneralLinearGroup.scalar n).range) ↔
      ∀ ζ : AlgebraicClosure F, IsPrimitiveRoot ζ (ringChar k) →
        ζ ∉ IntermediateField.fixedField
          (Subgroup.comap s (Matrix.GeneralLinearGroup.scalar n).range) := by
  sorry

/-! ### Verification lemmas for the Taylor–Wiles image conditions: disjoint base change, Sym^{n−1}r̄_A ⊗ r̄_B, induced Frobenius eigenvalues, scalar elements for Sym^m (ArithmeticGaloisRepresentations:G7/taylor-wiles-image-lemmas) -/

/-- ArithmeticGaloisRepresentations:G7/taylor-wiles-image-lemmas, part (1) (BCGNT Lemma 5.2.2,
image part), in the form used after the linear-disjointness step. The hypothesis of the lemma
(the Galois closure of `H` over `ℚ` is linearly disjoint over `F` from the composite of `F(ζ_p)`
and the Galois closure over `ℚ` of `M = F̄^{ker s̄}`) gives that `H` is linearly disjoint over `F`
from `M(ζ_p)`, i.e. that `G_H → Gal(M(ζ_p)/F) = G_F/(ker s̄ ∩ G_{F(ζ_p)})` is onto; `_hjoint` is
this surjectivity, written elementwise (the pair `(σ, 1)` of the proof). Under it, if `s̄`
satisfies the Taylor–Wiles image conditions then so does `s̄|_{G_H}`, and `s̄(G_H) = s̄(G_F)`,
`s̄(G_{H(ζ_p)}) = s̄(G_{F(ζ_p)})`. These two equalities alone are not enough as a hypothesis: for
`F = ℚ`, `H = ℚ(ζ_p)`, `s̄ = 1` they hold, and (TW3) fails over `H`. (Parts (2)–(5) are stated in
the roadmap.) -/
theorem TaylorWilesImageConditions.restrict_of_image_eq {k : Type} [Field k] {n : Type} [Fintype n]
    [DecidableEq n] {F : Type} [Field F] (H : Type) [Field H] [Algebra F H] [FiniteDimensional F H]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure H)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure H)]
    (s : Field.absoluteGaloisGroup F →* GL n k) (_hs : TaylorWilesImageConditions s)
    (_hjoint : ∀ σ : Field.absoluteGaloisGroup F, ∃ τ : Field.absoluteGaloisGroup H,
      s (GaloisRep.localEmbeddingMap F H τ) = s σ ∧
      (GaloisRep.localEmbeddingMap F H τ)⁻¹ * σ ∈ G7.cyclotomicSubgroup F (ringChar k)) :
    TaylorWilesImageConditions (s.comp (GaloisRep.localEmbeddingMap F H).toMonoidHom) := by
  sorry

end ResidualImage

end TauCeti
