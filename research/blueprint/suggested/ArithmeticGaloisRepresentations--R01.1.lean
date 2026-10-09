/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/ArithmeticGaloisRepresentations--R01.1.md) is definitive.
These statements suggest Lean forms so that contributors and reviewers converge
on names and signatures. No implementation is claimed: every proof is `sorry`,
and data whose construction is a roadmap target is `sorry` as well.

Conventions pinned here (see the roadmap's Conventions section): the carrier of a
continuous representation is a finite projective module with the module topology
and a jointly continuous action; coefficient Frobenius is arithmetic. This file
covers R01.1 only. Supplier-owned general reductive carriers are not restated here.
-/
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.Irreducible
import TauCeti.RepresentationTheory.Continuous.LinHom
import TauCeti.RingTheory.CompositionSeries.Multiplicity
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup
import Mathlib.RepresentationTheory.FDRep
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
import Mathlib.LinearAlgebra.Matrix.Kronecker
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
import Mathlib.RingTheory.HopfAlgebra.Convolution
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

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

/-- The determinant character `Γ →* Aˣ` of a finite projective carrier, defined
through a finite free complement. For constant rank it is the top exterior power;
for a free carrier it is `LinearMap.det ∘ ρ`. The complement independence, also
for varying local rank, is R01.1/determinant-through-a-complement. -/
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
structure Bundled (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {K : Type v} [Field K] [TopologicalSpace K]
  {M : Type w} [AddCommGroup M] [Module K M] [Module.Finite K M] [Module.Projective K M]
  [TopologicalSpace M] [IsModuleTopology K M]

/-- Absolute irreducibility is algebraic irreducibility after extension to an algebraic closure.
The Burnside operator-span condition is a theorem, not the definition. -/
def IsAbsolutelyIrreducible (ρ : ContinuousRep Γ K M) : Prop :=
  Representation.IsIrreducible (Representation.baseChange (AlgebraicClosure K) ρ.toRepresentation)

/-- The semisimplification over a field of coefficients: the direct sum of the factors of a
composition series (Jordan–Hölder), well defined up to isomorphism. -/
def semisimplification (ρ : ContinuousRep Γ K M) : Bundled.{u, v, w} Γ K := sorry

end FieldCoefficients

end ContinuousRep

/-- A `Γ`-stable lattice in a representation over a field `E` with ring of integers `O`:
a finitely generated `O`-submodule, stable under `Γ`, spanning `V` over `E`. -/
structure GaloisLattice.IntegralModel {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

namespace GaloisRep
-- Imported R01.2 supplier signatures, used by the retained cyclotomic tests.
def localEmbeddingMap (K L : Type*) [Field K] [Field L] [Algebra K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] :
    Field.absoluteGaloisGroup L →ₜ* Field.absoluteGaloisGroup K :=
  Field.absoluteGaloisGroup.mapOfAlgebra K L

def complexConjugation (F : Type*) [Field F] [NumberField F]
    (v : NumberField.InfinitePlace F) (_hv : v.IsReal) : Field.absoluteGaloisGroup F := sorry

/-- The `ℓ`-adic cyclotomic character of `G_F` (Mathlib's `cyclotomicCharacter` on the
algebraic closure). -/
def cyclotomicCharacter (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] :
    Field.absoluteGaloisGroup F →* ℤ_[ℓ]ˣ where
  toFun g := _root_.cyclotomicCharacter (AlgebraicClosure F) ℓ g.toRingEquiv
  map_one' := sorry
  map_mul' := sorry

end GaloisRep
end TauCeti

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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
    Continuous ρ.det := by
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
def frame [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) :
    Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A := by
  have _ := hMtop
  exact sorry

theorem coe_frame [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) (g : Γ) :
    (frame b ρ g : Matrix (Fin n) (Fin n) A) = LinearMap.toMatrix b b (ρ g) := by
  sorry

/-- `ofFramed (frame b ρ) ≅ ρ`. -/
def frameIso [IsTopologicalRing A] {n : ℕ} (b : Module.Basis (Fin n) A M)
    (ρ : ContinuousRep Γ A M) : Iso (ofFramed (frame b ρ)) ρ :=
  sorry

/-- Change of frame: `frame b' ρ = P⁻¹ (frame b ρ) P` with `P = b.toMatrix b'`. -/
theorem frame_basis_change [IsTopologicalRing A] {n : ℕ}
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
theorem continuous_iff_coe [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin n) A) :
    Continuous ρ ↔ Continuous fun g => (ρ g : Matrix (Fin n) (Fin n) A) := by
  sorry

end Framed

/-- `det (ofFramed ρ) = Matrix.det ∘ ρ`. -/
theorem det_ofFramed [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    (ofFramed ρ).det = Matrix.GeneralLinearGroup.det.comp ρ.toMonoidHom := by
  sorry

/-- Unit test: R011Tests.frame_ring. Retained test
TauCeti.ContinuousRep.Framed.conj_not_integral. -/
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
example [IsTopologicalRing A] {n : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin n) A) :
    Continuous ρ ↔ Continuous fun g => (ρ g : Matrix (Fin n) (Fin n) A) :=
  Framed.continuous_iff_coe ρ

end Framed

/-! ### Extension of coefficients
(ArithmeticGaloisRepresentations:R01.1/coefficient-extension) -/

section BaseChange

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
def dual [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)]
    [IsModuleTopology A (Module.Dual A M)] : ContinuousRep Γ A (Module.Dual A M) :=
  ⟨ρ.toRepresentation.dual, by have _ := hMfin; have _ := hMproj; have _ := hMtop; sorry⟩

theorem dual_apply [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    (g : Γ) (f : Module.Dual A M) (m : M) : ρ.dual g f m = f (ρ g⁻¹ m) := by
  sorry

/-- The internal Hom `Hom_A(M, N)` with `g · f = ρ_N(g) ∘ f ∘ ρ_M(g)⁻¹`. -/
def hom [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
    (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)] :
    ContinuousRep Γ A (M →ₗ[A] N) :=
  ⟨ρ.toRepresentation.linHom σ.toRepresentation, by have _ := hMtop; have _ := hNtop; sorry⟩

/-- `Hom_A(M, N) ≅ M^∨ ⊗_A N`. -/
def homEquivDualTensor [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
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
theorem invariants_hom [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
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
example [IsTopologicalRing A] [Module.Free A M] (ρ : ContinuousRep Γ A M)
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
example [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
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
example [IsTopologicalRing A] (ρ : ContinuousRep Γ A M)
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
system of primitive roots of unity; this comparison depends on that choice.
Each finite root set is discrete; the subtype has the inverse-limit topology.
Galois equivariance is `zlOneEquivLimRootsOfUnity_galois`, and the group law is
`zlOneEquivLimRootsOfUnity_mul`. -/
def zlOneEquivLimRootsOfUnity (F : Type*) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    letI : TopologicalSpace (AlgebraicClosure F) := ⊥
    {x : ℕ → (AlgebraicClosure F)ˣ // ∀ n, x n ^ (ℓ ^ n) = 1 ∧ x (n + 1) ^ ℓ = x n} ≃ₜ ℤ_[ℓ] :=
  sorry

/-- Multiplication in the root system corresponds to addition in the cyclotomic line. -/
theorem zlOneEquivLimRootsOfUnity_mul (F : Type*) [Field F] (ℓ : ℕ)
    [Fact ℓ.Prime] [NeZero (ℓ : F)]
    (x y z : {x : ℕ → (AlgebraicClosure F)ˣ // ∀ n,
      x n ^ (ℓ ^ n) = 1 ∧ x (n + 1) ^ ℓ = x n})
    (hxyz : ∀ n, z.1 n = x.1 n * y.1 n) :
    zlOneEquivLimRootsOfUnity F ℓ z =
      zlOneEquivLimRootsOfUnity F ℓ x + zlOneEquivLimRootsOfUnity F ℓ y := by sorry

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

/-- Unit test R011Tests.zl_one_roots. -/
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
theorem continuous_iff_isOpen_ker {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
     [CompactSpace Γ] [T2Space Γ] [TotallyDisconnectedSpace Γ]
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
theorem residual_descent_finite_field {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
theorem baire_descent {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
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
      ∀ {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ]
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
def dual [IsTopologicalRing E] [TopologicalSpace (Module.Dual E V)]
    [IsModuleTopology E (Module.Dual E V)] (Λ : IntegralModel O ρ) : IntegralModel O ρ.dual :=
  sorry

theorem mem_dual [IsTopologicalRing E] [TopologicalSpace (Module.Dual E V)]
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
example {Γ : Type} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] (γ : Γ) (hγ : ∀ x : Γ, ∃ n : ℕ, x = γ ^ n)
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
def reduceLocal {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

/-- The reduction `rhoBar_Λ := Λ/ϖΛ = k_E ⊗_{O_E} Λ`, a continuous representation over the residue
field (discrete). -/
def reduction (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)] :
    ContinuousRep Γ (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice) :=
  ⟨ContinuousRep.baseChangeRepresentation (IsLocalRing.ResidueField O)
    { toFun g := ((ρ g).restrictScalars O).restrict (fun x hx => Λ.stable g x hx)
      map_one' := sorry
      map_mul' := sorry }, by have _ := hVtop; sorry⟩

/-- The residual semisimplification `rhoBar_Λ^ss` attached to `Λ`. (Over `Q̄_ℓ` the residual
representation `(rhoBar_Λ ⊗ F̄_ℓ)^ss` is obtained after descent to a coefficient field; it is not
restated here.) -/
def residualSS (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
    [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
    [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)] :
    ContinuousRep.Bundled.{uΓ, uA, max uA uM} Γ (IsLocalRing.ResidueField O) :=
  Λ.reduction.semisimplification

variable (Λ : IntegralModel O ρ) [IsModuleTopology O Λ.lattice]
  [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
  [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]

/-- `charpoly rhoBar_Λ(g)` is the reduction of `charpoly ρ(g) ∈ (Polynomial O)`. -/
theorem charpoly_reduction (g : Γ) :
    Λ.reduction.charpoly g =
      (Λ.toContinuousRep.charpoly g).map (IsLocalRing.residue O) := by
  sorry





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

/-- Unit test: R011Tests.lattice_reduce_dependence. -/
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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

/-- The residual coefficient Frobenius twist `rhoBar^{(p)} := rhoBar^{Frob_p}` over a perfect field of
characteristic `p` with the discrete topology (`frobeniusEquiv`). -/
def frobTwist (p : ℕ) [Fact p.Prime] {k : Type uA} [Field k] [CharP k p] [PerfectRing k p]
    [TopologicalSpace k] [DiscreteTopology k] {n : ℕ}
    (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k) : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k :=
  coeffTwist (frobeniusEquiv k p) continuous_of_discreteTopology ρ



variable (p : ℕ) [Fact p.Prime] {k : Type uA} [Field k] [CharP k p] [PerfectRing k p]
  [TopologicalSpace k] [DiscreteTopology k]

/-- Unit test: R011Tests.frob_character.
For a character `χ̄ : Γ → GL_1(F_{p²})`, the Frobenius twist is `χ̄^p`, which differs from `χ̄`
when `χ̄` has an element of order `p² − 1` in its image. -/
example [TopologicalSpace (GaloisField p 2)] [DiscreteTopology (GaloisField p 2)]
    (χ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) (GaloisField p 2)) :
    (∀ g, frobTwist p χ g = χ g ^ p) ∧
      ((∃ g, orderOf (χ g) = p ^ 2 - 1) → frobTwist p χ ≠ χ) := by
  sorry

/-- Unit test: R011Tests.frob_prime. -/
example {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (ZMod p))
    (ρ' : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) :
    frobTwist p ρ = ρ ∧ coeffTwist (RingEquiv.refl A) continuous_id ρ' = ρ' := by
  sorry

/-- Unit test: R011Tests.frob_not_conjugation.
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



end CoeffTwist

/-! ### Teichmüller lifts of residual characters
(ArithmeticGaloisRepresentations:R01.1/teichmuller-lift-of-a-residual-character) -/

namespace Teichmuller

-- For an algebraic-closure-valued residual character, finite-field descent requires
-- profinite `Γ` (or a separately assumed finite image). The typed lift below already has
-- finite residue-field coefficients.
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

/-- Unit test: R011Tests.teich_one. -/
example (h1 : IsOpen ((1 : Γ →* (IsLocalRing.ResidueField O)ˣ).ker : Set Γ)) (g : Γ) :
    lift (1 : Γ →* (IsLocalRing.ResidueField O)ˣ) h1 g = 1 := by
  sorry

/-- Unit test: R011Tests.teich_not_any_lift. -/
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

variable {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
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
a general split reductive `Ĝ` over `ℤ` and `Ĝ`-semisimplification use the supplier
Hopf-algebra and building carriers and are omitted from this prototype. -/
theorem exists_integral_conj_GL {Γ : Type uΓ} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ]
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


/-! # Target-level R01.1 refinements

The preceding signatures supply the retained parent carriers and elementary arithmetic leaves.
The following sections complete the fresh refinement nodes in this packet. Algebraic
reconstruction, general exterior powers and classical Ribet lattices are supplier targets,
not a second implementation programme here.
-/
namespace TauCeti
namespace ContinuousRep

universe uG uA uM uN uB
section ModuleOperations
variable {Γ : Type uG} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {A : Type uA} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
  {M : Type uM} [AddCommGroup M] [Module A M] [Module.Finite A M]
  [Module.Projective A M] [TopologicalSpace M] [IsModuleTopology A M]
  {N : Type uN} [AddCommGroup N] [Module A N] [Module.Finite A N]
  [Module.Projective A N] [TopologicalSpace N] [IsModuleTopology A N]

 theorem det_ofCharacter (χ : Γ →ₜ* Aˣ) : (ofCharacter χ).det = χ.toMonoidHom := by sorry
 theorem res_apply {H : Type*} [Group H] [TopologicalSpace H]
    (φ : H →ₜ* Γ) (ρ : ContinuousRep Γ A M) (h : H) (m : M) :
    ρ.res φ h m = ρ (φ h) m := by sorry
 theorem res_comp {H K : Type*} [Group H] [Group K] [TopologicalSpace H]
    [TopologicalSpace K] (φ : H →ₜ* Γ) (ψ : K →ₜ* H) (ρ : ContinuousRep Γ A M) :
    (ρ.res φ).res ψ = ρ.res (φ.comp ψ) := by sorry
 theorem directSum_apply (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    (g : Γ) (m : M) (n : N) : ρ.directSum σ g (m,n) = (ρ g m, σ g n) := by sorry
 theorem directSum_charpoly [Module.Free A M] [Module.Free A N]
    (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N) (g : Γ) :
    (ρ.directSum σ).charpoly g = ρ.charpoly g * σ.charpoly g := by sorry
 theorem tensor_comm (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)]
    [TopologicalSpace (N ⊗[A] M)] [IsModuleTopology A (N ⊗[A] M)] :
    ∃ e : Iso (ρ.tensor σ) (σ.tensor ρ),
      ∀ m n, e.toLinearEquiv (m ⊗ₜ[A] n) = n ⊗ₜ[A] m := by sorry
 theorem dual_dual (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    [TopologicalSpace (Module.Dual A (Module.Dual A M))]
    [IsModuleTopology A (Module.Dual A (Module.Dual A M))] :
    ∃ e : Iso ρ ρ.dual.dual, ∀ m lam, e.toLinearEquiv m lam = lam m := by sorry
 theorem det_dual (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)] :
    ρ.dual.det = ρ.det⁻¹ := by sorry
 theorem hom_apply (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [Module.Finite A (M →ₗ[A] N)] [Module.Projective A (M →ₗ[A] N)]
    [TopologicalSpace (M →ₗ[A] N)] [IsModuleTopology A (M →ₗ[A] N)]
    (g : Γ) (f : M →ₗ[A] N) (m : M) :
    ρ.hom σ g f m = σ g (f (ρ g⁻¹ m)) := by sorry
 theorem twist_apply (ρ : ContinuousRep Γ A M) (χ : Γ →ₜ* Aˣ) (g : Γ) (m : M) :
    ρ.twist χ g m = (χ g : A) • ρ g m := by sorry
 theorem twist_one (ρ : ContinuousRep Γ A M) : ρ.twist 1 = ρ := by sorry

/-- Unit test R011Tests.det_line. -/
example (χ : Γ →ₜ* Aˣ) : (ofCharacter χ).det = χ.toMonoidHom := by sorry
/-- Unit test R011Tests.det_zero. -/
example : (trivial : ContinuousRep Γ A (Fin 0 → A)).det = 1 := by sorry
/-- Unit test R011Tests.det_free. -/
example (n : ℕ) (π : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
    ((ofFramed π).det g : A) = Matrix.det (π g : Matrix (Fin n) (Fin n) A) := by sorry
/-- Unit test R011Tests.det_projective_corner. The ideal has local ranks one and zero,
so the projective determinant differs from LinearMap.det's nonfree fallback. -/
example (P : Ideal (ZMod 3 × ZMod 3))
    [Module.Finite (ZMod 3 × ZMod 3) P] [Module.Projective (ZMod 3 × ZMod 3) P]
    [IsModuleTopology (ZMod 3 × ZMod 3) P]
    (hP : P = Ideal.span ({(1, 0)} : Set (ZMod 3 × ZMod 3)))
    (ρ : ContinuousRep (Multiplicative (ZMod 2)) (ZMod 3 × ZMod 3) P)
    (hρ : ∀ x : P, ρ (Multiplicative.ofAdd 1) x = -x) :
    ¬ Module.Free (ZMod 3 × ZMod 3) P ∧
      (ρ.det (Multiplicative.ofAdd 1) : ZMod 3 × ZMod 3) = (-1, 1) ∧
      LinearMap.det (ρ (Multiplicative.ofAdd 1)) = 1 := by sorry
/-- Unit test R011Tests.frame_one. -/
example (χ : Γ →ₜ* Aˣ) (π : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 1) A)
    (hπ : ∀ g, (π g : Matrix (Fin 1) (Fin 1) A) 0 0 = (χ g : A)) :
    Nonempty (Iso (ofFramed π) (ofCharacter χ)) := by sorry
/-- Unit test R011Tests.frame_zero. -/
example (π : Γ →ₜ* Matrix.GeneralLinearGroup (Fin 0) A) :
    Nonempty (Iso (ofFramed π) (trivial : ContinuousRep Γ A (Fin 0 → A))) := by sorry
/-- Unit test R011Tests.res_id. -/
example (ρ : ContinuousRep Γ A M) : ρ.res (ContinuousMonoidHom.id Γ) = ρ := by sorry
/-- Unit test R011Tests.res_trivial_group. -/
example (ρ : ContinuousRep Γ A M) (φ : PUnit →ₜ* Γ) (h : PUnit) (m : M) :
    ρ.res φ h m = m := by sorry
/-- Unit test R011Tests.res_algebraic. -/
example {H : Type*} [Group H] [TopologicalSpace H] (φ : H →ₜ* Γ)
    (ρ : ContinuousRep Γ A M) :
    (ρ.res φ).toRepresentation = ρ.toRepresentation.comp φ.toMonoidHom := by sorry
/-- Unit test R011Tests.sum_lines. -/
example (χ ψ : Γ →ₜ* Aˣ) (g : Γ) (x y : A) :
    (ofCharacter χ).directSum (ofCharacter ψ) g (x,y) = ((χ g : A)*x,(ψ g : A)*y) := by sorry
/-- Unit test R011Tests.sum_zero. -/
example (ρ : ContinuousRep Γ A M) (g : Γ) (m : M) (z : Fin 0 → A) :
    ρ.directSum (trivial : ContinuousRep Γ A (Fin 0 → A)) g (m,z) = (ρ g m,z) := by sorry
/-- Unit test R011Tests.sum_det. -/
example (χ ψ : Γ →ₜ* Aˣ) :
    ((ofCharacter χ).directSum (ofCharacter ψ)).det = χ.toMonoidHom * ψ.toMonoidHom := by sorry
/-- Unit test R011Tests.tensor_lines. -/
example [TopologicalSpace (A ⊗[A] A)] [IsModuleTopology A (A ⊗[A] A)]
    (χ ψ : Γ →ₜ* Aˣ) :
    ∃ e : Iso ((ofCharacter χ).tensor (ofCharacter ψ)) (ofCharacter (χ*ψ)),
      ∀ a b, e.toLinearEquiv (a ⊗ₜ[A] b) = a*b := by sorry
/-- Unit test R011Tests.tensor_zero. -/
example [TopologicalSpace (M ⊗[A] (Fin 0 → A))]
    [IsModuleTopology A (M ⊗[A] (Fin 0 → A))] :
    Module.finrank A (M ⊗[A] (Fin 0 → A)) = 0 := by sorry
/-- Unit test R011Tests.tensor_mathlib. -/
example (ρ : ContinuousRep Γ A M) (σ : ContinuousRep Γ A N)
    [TopologicalSpace (M ⊗[A] N)] [IsModuleTopology A (M ⊗[A] N)] :
    (ρ.tensor σ).toRepresentation = Representation.tprod ρ.toRepresentation σ.toRepresentation := by sorry
/-- Unit test R011Tests.dual_line. -/
example [TopologicalSpace (Module.Dual A A)] [IsModuleTopology A (Module.Dual A A)]
    (χ : Γ →ₜ* Aˣ) (g : Γ) (lam : Module.Dual A A) (a : A) :
    (ofCharacter χ).dual g lam a = lam ((↑(χ g)⁻¹ : A)*a) := by sorry
/-- Unit test R011Tests.dual_zero. -/
example [TopologicalSpace (Module.Dual A (Fin 0 → A))]
    [IsModuleTopology A (Module.Dual A (Fin 0 → A))] :
    Module.finrank A (Module.Dual A (Fin 0 → A)) = 0 := by sorry
/-- Unit test R011Tests.dual_pairing. -/
example (ρ : ContinuousRep Γ A M)
    [TopologicalSpace (Module.Dual A M)] [IsModuleTopology A (Module.Dual A M)]
    (g : Γ) (lam : Module.Dual A M) (m : M) : ρ.dual g lam (ρ g m) = lam m := by sorry
/-- Unit test R011Tests.hom_lines. -/
example [TopologicalSpace (A →ₗ[A] A)] [IsModuleTopology A (A →ₗ[A] A)]
    (χ ψ : Γ →ₜ* Aˣ) (g : Γ) (f : A →ₗ[A] A) (a : A) :
    (ofCharacter χ).hom (ofCharacter ψ) g f a =
      (ψ g : A) * (↑(χ g)⁻¹ : A) * f a := by sorry
/-- Unit test R011Tests.hom_zero. -/
example : Module.finrank A ((Fin 0 → A) →ₗ[A] N) = 0 := by sorry
/-- Unit test R011Tests.hom_identity. -/
example [Module.Finite A (M →ₗ[A] M)] [Module.Projective A (M →ₗ[A] M)]
    [TopologicalSpace (M →ₗ[A] M)] [IsModuleTopology A (M →ₗ[A] M)]
    (ρ : ContinuousRep Γ A M) (g : Γ) : ρ.hom ρ g LinearMap.id = LinearMap.id := by sorry
/-- Unit test R011Tests.twist_line. -/
example (χ ψ : Γ →ₜ* Aˣ) : (ofCharacter ψ).twist χ = ofCharacter (χ*ψ) := by sorry
/-- Unit test R011Tests.twist_one. -/
example (ρ : ContinuousRep Γ A M) : ρ.twist 1 = ρ := by sorry
/-- Unit test R011Tests.twist_det. -/
example (χ : Γ →ₜ* Aˣ) (g : Γ) :
    ((trivial : ContinuousRep Γ A (Fin 2 → A)).twist χ).det g = χ g ^ 2 := by sorry
end ModuleOperations

/-- The named comparison uses Tau Ceti's genuine operator space, not a new Hom carrier. -/
theorem hom_toLinHom {Γ K V W : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [NontriviallyNormedField K] [CompleteSpace K]
    [NormedAddCommGroup V] [NormedSpace K V] [FiniteDimensional K V] [IsModuleTopology K V]
    [NormedAddCommGroup W] [NormedSpace K W] [FiniteDimensional K W] [IsModuleTopology K W]
    [TopologicalSpace (V →ₗ[K] W)] [IsModuleTopology K (V →ₗ[K] W)]
    (ρ : ContinuousRep Γ K V) (σ : ContinuousRep Γ K W) (g : Γ) (f : V →ₗ[K] W) :
    LinearMap.toContinuousLinearMap (ρ.hom σ g f) =
      ContRepresentation.linHom ρ.toContRepresentation σ.toContRepresentation g
        (LinearMap.toContinuousLinearMap f) := by sorry

section Subquotients
variable {Γ K V : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [Field K] [TopologicalSpace K] [IsTopologicalRing K] [T2Space K]
 [AddCommGroup V] [Module K V] [FiniteDimensional K V] [TopologicalSpace V]
 [IsModuleTopology K V]
/-- The induced subspace topology is already the canonical module topology.
A linear splitting proves this without a complete normed-field hypothesis. -/
 theorem submodule_moduleTopology (W : Submodule K V) : IsModuleTopology K W := by sorry
variable (ρ : ContinuousRep Γ K V) (W : Submodule K V) [IsModuleTopology K W]
 (hW : ∀ g, W ≤ W.comap (ρ g))
 theorem subrep_apply (g : Γ) (w : W) : (ρ.subrep W hW g w : V) = ρ g w := by sorry
 def subrep_inclusion : Hom (ρ.subrep W hW) ρ := ⟨W.subtype,sorry⟩
 theorem subrep_algebraic (τ : Subrepresentation ρ.toRepresentation)
     (hτ : τ.toSubmodule = W) (g : Γ) (w : W) :
     (ρ.subrep W hW g w : V) = ρ.toRepresentation g w := by sorry
 theorem quotientRep_mkQ (g : Γ) (v : V) :
     ρ.quotientRep W hW g (W.mkQ v) = W.mkQ (ρ g v) := by sorry
 def quotient_projection : Hom ρ (ρ.quotientRep W hW) := ⟨W.mkQ,sorry⟩
 theorem quotient_algebraic : (ρ.quotientRep W hW).toRepresentation =
     ρ.toRepresentation.quotient W hW := by sorry
/-- Unit test R011Tests.sub_zero. -/
example [IsModuleTopology K (⊥ : Submodule K V)] :
    Module.finrank K (⊥ : Submodule K V) = 0 := by sorry
/-- Unit test R011Tests.sub_full. -/
example [IsModuleTopology K (⊤ : Submodule K V)] :
    Nonempty (Iso (ρ.subrep ⊤ (by sorry)) ρ) := by sorry
/-- Unit test R011Tests.quot_full. -/
example : Module.finrank K (V ⧸ (⊤ : Submodule K V)) = 0 := by sorry
/-- Unit test R011Tests.quot_zero. -/
example : Nonempty (Iso (ρ.quotientRep ⊥ (by sorry)) ρ) := by sorry
end Subquotients

/-- Unit test R011Tests.sub_line. -/
example {Γ K : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [Field K] [TopologicalSpace K] [IsTopologicalRing K] [T2Space K]
 (χ ψ : Γ →ₜ* Kˣ) (W : Submodule K (K × K)) [IsModuleTopology K W]
 (hW : W = LinearMap.ker (LinearMap.snd K K K))
 (hst : ∀ g, W ≤ W.comap ((ofCharacter χ).directSum (ofCharacter ψ) g)) :
 Nonempty (Iso (((ofCharacter χ).directSum (ofCharacter ψ)).subrep W hst) (ofCharacter χ)) := by sorry
/-- Unit test R011Tests.quot_line. -/
example {Γ K : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [Field K] [TopologicalSpace K] [IsTopologicalRing K] [T2Space K]
 (χ ψ : Γ →ₜ* Kˣ) (W : Submodule K (K × K))
 (hW : W = LinearMap.ker (LinearMap.snd K K K))
 (hst : ∀ g, W ≤ W.comap ((ofCharacter χ).directSum (ofCharacter ψ) g)) :
 Nonempty (Iso (((ofCharacter χ).directSum (ofCharacter ψ)).quotientRep W hst) (ofCharacter ψ)) := by sorry
end ContinuousRep

/-! Algebraic carriers: these declarations have a monoid, no topology and no finite-image premise. -/
namespace AlgRep
open CategoryTheory
open scoped MonoidAlgebra
universe u
variable {k Δ : Type u} [Field k] [Monoid Δ]

 abbrev _root_.FDRep.representation (V : FDRep k Δ) : _root_.Representation k Δ V := V.ρ

 def compositionSeries (V : FDRep k Δ) : CompositionSeries (Submodule k[Δ] (_root_.Representation.asModule (V.representation : _root_.Representation k Δ V))) := sorry
 theorem compositionSeries_endpoints (V : FDRep k Δ) :
    (compositionSeries V).head = (⊥ : Submodule k[Δ] (_root_.Representation.asModule (V.representation : _root_.Representation k Δ V))) ∧
    (compositionSeries V).last = ⊤ := by sorry
 def factorsOfSeries (V : FDRep k Δ)
    (s : CompositionSeries (Submodule k[Δ] (_root_.Representation.asModule (V.representation : _root_.Representation k Δ V)))) : Fin s.length → FDRep k Δ := sorry
 theorem factorsOfSeries_spec (V : FDRep k Δ)
    (s : CompositionSeries (Submodule k[Δ] (_root_.Representation.asModule (V.representation : _root_.Representation k Δ V)))) (i : Fin s.length) :
    TauCeti.IsCompositionFactorAt s i (_root_.Representation.asModule ((factorsOfSeries V s i).representation : _root_.Representation k Δ (factorsOfSeries V s i))) := by sorry
 def compositionFactors (V : FDRep k Δ) : Multiset (FDRep k Δ) := sorry
 theorem compositionFactors_iso (V : FDRep k Δ)
    (s : CompositionSeries (Submodule k[Δ] (_root_.Representation.asModule (V.representation : _root_.Representation k Δ V))))
    (hs : s.head = ⊥ ∧ s.last = ⊤) :
    Multiset.Rel (fun X Y : FDRep k Δ => Nonempty (X.representation.Equiv Y.representation))
      (compositionFactors V) (Multiset.ofList (List.ofFn (factorsOfSeries V s))) := by sorry
 def factorMultiplicity (V S : FDRep k Δ) : ℕ := by
    letI : IsNoetherian k[Δ] V.representation.asModule :=
      isNoetherian_of_tower k (inferInstance : IsNoetherian k V.representation.asModule)
    letI : IsArtinian k[Δ] V.representation.asModule :=
      isArtinian_of_tower k (inferInstance : IsArtinian k V.representation.asModule)
    exact TauCeti.jordanHolderMultiplicity k[Δ]
      (_root_.Representation.asModule V.representation)
      (_root_.Representation.asModule S.representation)
 def semisimplification (V : FDRep k Δ) : FDRep k Δ := sorry
 theorem isSemisimple_ss (V : FDRep k Δ) :
    Representation.IsSemisimpleRepresentation (semisimplification V).representation := by sorry
 theorem charpoly_ss (V : FDRep k Δ) (g : Δ) :
    LinearMap.charpoly ((semisimplification V).representation g) = LinearMap.charpoly (V.representation g) := by sorry
 theorem ss_iso_self_iff (V : FDRep k Δ) :
    Nonempty ((semisimplification V).representation.Equiv V.representation) ↔ Representation.IsSemisimpleRepresentation V.representation := by sorry
 theorem ss_exact (V : FDRep k Δ) (W : Subrepresentation V.representation)
    (Vsub Vquot : FDRep k Δ)
    (esub : Nonempty (Vsub.representation.Equiv W.toRepresentation))
    (equot : Nonempty (Vquot.representation.Equiv (V.representation.quotient W.toSubmodule (by sorry)))) :
    ∃ e : (semisimplification V) ≃ₗ[k] ((semisimplification Vsub) × (semisimplification Vquot)),
      ∀ g v, e ((semisimplification V).representation g v) =
        ((semisimplification Vsub).representation g (e v).1, (semisimplification Vquot).representation g (e v).2) := by sorry

 def IsAbsolutelyIrreducible {V : Type u} [AddCommGroup V] [Module k V]
    (ρ : Representation k Δ V) : Prop :=
    Representation.IsIrreducible (_root_.Representation.baseChange (AlgebraicClosure k) ρ)
 theorem absIrr_iff_span {V : Type u} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k Δ V) :
    IsAbsolutelyIrreducible ρ ↔ Nontrivial V ∧ Submodule.span k (Set.range ρ) = ⊤ := by sorry
 theorem absIrr_baseChange_iff {V : Type u} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k Δ V) (L : Type u) [Field L] [Algebra k L] :
    IsAbsolutelyIrreducible (_root_.Representation.baseChange L ρ) ↔ IsAbsolutelyIrreducible ρ := by sorry
 theorem absIrr_iff_irreducible_end {V : Type u} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (ρ : Representation k Δ V) :
    IsAbsolutelyIrreducible ρ ↔ ρ.IsIrreducible ∧
      ∀ f : V →ₗ[k] V, (∀ g, f.comp (ρ g) = (ρ g).comp f) → ∃ c : k, f = c • LinearMap.id := by sorry
 theorem absIrr_continuous {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [TopologicalSpace k] {V : Type u} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [TopologicalSpace V] [IsModuleTopology k V] (ρ : ContinuousRep Γ k V) :
    IsAbsolutelyIrreducible ρ.toRepresentation ↔ ρ.IsAbsolutelyIrreducible := by sorry

/-- Noether–Deuring specialized to semisimple modules; the simultaneous image algebra is finite. -/
 theorem semisimpleIso_descends {V W : Type u} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (ρ : Representation k Δ V) (σ : Representation k Δ W)
    (hρ : Representation.IsSemisimpleRepresentation ρ)
    (hσ : Representation.IsSemisimpleRepresentation σ)
    (L : Type u) [Field L] [Algebra k L]
    (he : Nonempty ((_root_.Representation.baseChange L ρ).Equiv (_root_.Representation.baseChange L σ))) :
    Nonempty (ρ.Equiv σ) := by sorry
/-- Exact IHG.1 arithmetic bridge. Its proof uses determinant laws on the monoid algebra,
Amitsur, perfect-field scalar extension and Noether–Deuring, not equality of traces. -/
 theorem brauerNesbitt_of_perfectField [PerfectField k]
    {V W : Type u} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (ρ : Representation k Δ V) (σ : Representation k Δ W)
    (hρ : Representation.IsSemisimpleRepresentation ρ)
    (hσ : Representation.IsSemisimpleRepresentation σ)
    (hc : ∀ g, LinearMap.charpoly (ρ g) = LinearMap.charpoly (σ g)) :
    Nonempty (ρ.Equiv σ) := by sorry

/-- The fixed-vector submodule for an arbitrary monoid; no inverse action is used. -/
def fixedSubmodule {V : Type u} [AddCommGroup V] [Module k V]
    (ρ : _root_.Representation k Δ V) : Submodule k V where
  carrier := {v | ∀ g, ρ g v = v}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Retained parent Brauer–Nesbitt, including imperfect coefficient fields.
Extend and semisimplify over the algebraic closure, use the imported IHG uniqueness,
then reflect the semisimplified isomorphism through the finite image-algebra factors. -/
theorem brauerNesbitt {V W : Type u} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (ρ : Representation k Δ V) (σ : Representation k Δ W)
    (hρ : Representation.IsSemisimpleRepresentation ρ)
    (hσ : Representation.IsSemisimpleRepresentation σ)
    (hc : ∀ g, LinearMap.charpoly (ρ g) = LinearMap.charpoly (σ g)) :
    Nonempty (ρ.Equiv σ) := by sorry

section ScalarExtension
variable (L : Type u) [Field L] [Algebra k L]
 def baseChange (V : FDRep k Δ) : FDRep L Δ := sorry
 theorem baseChange_action (V : FDRep k Δ) :
    Nonempty ((baseChange L V).representation.Equiv (_root_.Representation.baseChange L V.representation)) := by sorry
 theorem ss_baseChange (V : FDRep k Δ) :
    Nonempty ((semisimplification (baseChange L V)).representation.Equiv
      (semisimplification (baseChange L (semisimplification V))).representation) := by sorry
 theorem invariants_extension (V : FDRep k Δ) :
    Nonempty (fixedSubmodule (_root_.Representation.baseChange L V.representation) ≃ₗ[L]
      (L ⊗[k] fixedSubmodule V.representation)) := by sorry
 theorem hom_extension (V W : FDRep k Δ) :
    Nonempty (_root_.Representation.IntertwiningMap (_root_.Representation.baseChange L V.representation) (_root_.Representation.baseChange L W.representation) ≃ₗ[L]
      (L ⊗[k] (_root_.Representation.IntertwiningMap V.representation W.representation))) := by sorry
end ScalarExtension

/-- Unit test R011Tests.factors_simple. -/
example (V : FDRep k Δ) (h : V.representation.IsIrreducible) :
    Multiset.Rel (fun X Y : FDRep k Δ => Nonempty (X.representation.Equiv Y.representation)) (compositionFactors V) {V} := by sorry
/-- Unit test R011Tests.factors_zero. -/
example (V : FDRep k Δ) [Subsingleton V] : compositionFactors V = 0 := by sorry
/-- Unit test R011Tests.factors_unipotent. A nonidentity square-zero off-diagonal action. -/
example (V : FDRep k Δ) (b : Module.Basis (Fin 2) k V)
    (hc : ∀ g, LinearMap.toMatrix b b (V.representation g) 0 0 = 1 ∧
      LinearMap.toMatrix b b (V.representation g) 1 1 = 1 ∧ LinearMap.toMatrix b b (V.representation g) 1 0 = 0)
    (hn : ∃ g, LinearMap.toMatrix b b (V.representation g) 0 1 ≠ 0) :
    (compositionFactors V).card = 2 ∧ ∀ S ∈ compositionFactors V,
      Module.finrank k S = 1 ∧ ∀ g, S.representation g = LinearMap.id := by sorry
/-- Unit test R011Tests.ss_zero. -/
example (V : FDRep k Δ) [Subsingleton V] : Module.finrank k (semisimplification V) = 0 := by sorry
/-- Unit test R011Tests.ss_simple. -/
example (V : FDRep k Δ) (h : V.representation.IsIrreducible) :
    Nonempty ((semisimplification V).representation.Equiv V.representation) := by sorry
/-- Unit test R011Tests.ss_unipotent. -/
example (V : FDRep k Δ) (b : Module.Basis (Fin 2) k V)
    (hc : ∀ g, LinearMap.toMatrix b b (V.representation g) 0 0 = 1 ∧
      LinearMap.toMatrix b b (V.representation g) 1 1 = 1 ∧ LinearMap.toMatrix b b (V.representation g) 1 0 = 0)
    (hn : ∃ g, LinearMap.toMatrix b b (V.representation g) 0 1 ≠ 0) :
    Module.finrank k (semisimplification V) = 2 ∧
      (∀ g, (semisimplification V).representation g = LinearMap.id) ∧
      ¬ Nonempty ((semisimplification V).representation.Equiv V.representation) := by sorry
/-- Unit test R011Tests.abs_line. -/
example (V : FDRep k Δ) (h : Module.finrank k V = 1) : IsAbsolutelyIrreducible V.representation := by sorry
/-- Unit test R011Tests.abs_zero. -/
example (V : FDRep k Δ) [Subsingleton V] : ¬ IsAbsolutelyIrreducible V.representation := by sorry
end AlgRep

/-- Unit test R011Tests.abs_rotation. The rational rotation and its scalar extension. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 4)) (Fin 2 → ℚ))
    (hρ : LinearMap.toMatrix (Pi.basisFun ℚ (Fin 2)) (Pi.basisFun ℚ (Fin 2))
      (ρ (Multiplicative.ofAdd 1)) = !![0,-1;1,0]) :
    ρ.IsIrreducible ∧ ¬ AlgRep.IsAbsolutelyIrreducible ρ := by sorry
end TauCeti

namespace TauCeti
namespace GaloisLattice.IntegralModel
open scoped TensorProduct
universe uR uG uV
variable {Γ : Type uG} {O E : Type uR} {V : Type uV} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
 [Field E] [TopologicalSpace E] [IsTopologicalRing E] [Algebra O E] [IsFractionRing O E]
 [AddCommGroup V] [Module E V] [FiniteDimensional E V] [TopologicalSpace V]
 [IsModuleTopology E V] [Module O V] [IsScalarTower O E V]
variable (ρ : ContinuousRep Γ E V) (Λ : IntegralModel O ρ) (W : Submodule E V)
 [IsModuleTopology E W] (hW : ∀ g, W ≤ W.comap (ρ g))

def saturationModel : IntegralModel O (ρ.subrep W hW) := by
 have _ := Λ
 sorry
def quotientModel  :
 IntegralModel O (ρ.quotientRep W hW) := by
 have _ := Λ
 sorry
theorem mem_saturation (w : W) : w ∈ Λ.saturation W ↔ (w : V) ∈ Λ.lattice := by sorry
theorem saturationModel_lattice : (saturationModel ρ Λ W hW).lattice = Λ.saturation W := by sorry
theorem quotient_lattice  :
 (quotientModel ρ Λ W hW).lattice = Λ.lattice.map (W.mkQ.restrictScalars O) := by sorry
/-- Unit test R011Tests.sat_zero. -/
example (hzero : W = ⊥) : Λ.saturation W = ⊥ ∧
    ∀ v : V, W.mkQ v ∈ (quotientModel ρ Λ W hW).lattice ↔ v ∈ Λ.lattice := by sorry
/-- Unit test R011Tests.sat_full. -/
example (hfull : W = ⊤) :
    (∀ v : W, v ∈ Λ.saturation W ↔ (v : V) ∈ Λ.lattice) ∧
    (quotientModel ρ Λ W hW).lattice = ⊥ := by sorry
/-- Unit test R011Tests.sat_coordinate. The image of a saturated coordinate line. -/
example
 (b : Module.Basis (Fin 2) E V)
 (hΛ : Λ.lattice = Submodule.span O {b 0,b 1})
 (hline : W = Submodule.span E {b 0}) :
 ∃ w : W, (w : V) = b 0 ∧ Λ.saturation W = Submodule.span O {w} ∧
   (quotientModel ρ Λ W hW).lattice = Submodule.span O {W.mkQ (b 1)} := by sorry

theorem dual_dual_lattice [TopologicalSpace (Module.Dual E V)]
 [IsModuleTopology E (Module.Dual E V)]
 [TopologicalSpace (Module.Dual E (Module.Dual E V))]
 [IsModuleTopology E (Module.Dual E (Module.Dual E V))]
 (v : V) : (Module.Dual.eval E V v) ∈ Λ.dual.dual.lattice ↔ v ∈ Λ.lattice := by sorry
/-- Unit test R011Tests.dual_lattice_standard. -/
example [TopologicalSpace (Module.Dual E V)] [IsModuleTopology E (Module.Dual E V)]
 (b : Module.Basis (Fin 2) E V) (hΛ : Λ.lattice = Submodule.span O {b 0,b 1})
 (f : Module.Dual E V) :
 f ∈ Λ.dual.lattice ↔ f (b 0) ∈ Set.range (algebraMap O E) ∧
 f (b 1) ∈ Set.range (algebraMap O E) := by sorry
/-- Unit test R011Tests.dual_lattice_zero. -/
example [Subsingleton V] [TopologicalSpace (Module.Dual E V)]
 [IsModuleTopology E (Module.Dual E V)] : Λ.dual.lattice = ⊥ := by sorry
/-- Unit test R011Tests.dual_lattice_scaled. -/
example [TopologicalSpace (Module.Dual E V)] [IsModuleTopology E (Module.Dual E V)]
 (c : Eˣ) : (IntegralModel.smul c Λ).dual.lattice =
 (IntegralModel.smul c⁻¹ Λ.dual).lattice := by sorry
/-- R011Tests.dual_lattice_scaled, discriminating instance: a uniformizer is not a unit. -/
example [TopologicalSpace (Module.Dual E V)] [IsModuleTopology E (Module.Dual E V)]
 (c : Eˣ) (a : O) (ha : Irreducible a) (hc : algebraMap O E a = (c : E))
 (b : Module.Basis (Fin 1) E V) (hΛ : Λ.lattice = Submodule.span O {b 0}) :
 (IntegralModel.smul c Λ).dual.lattice ≠ (IntegralModel.smul c Λ.dual).lattice := by sorry

section Reduction
attribute [local instance] ContinuousRep.Bundled.isAddCommGroup ContinuousRep.Bundled.isModule
 ContinuousRep.Bundled.isFinite ContinuousRep.Bundled.isProjective
 ContinuousRep.Bundled.isTopologicalSpace ContinuousRep.Bundled.isModuleTopology
variable [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]
 [ContinuousSMul O (IsLocalRing.ResidueField O)] [IsModuleTopology O Λ.lattice]
 [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
 [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
/-- Unit test R011Tests.lattice_reduce_trivial. -/
example (h : ∀ g, ρ g = LinearMap.id) : ∀ g, Λ.reduction g = LinearMap.id := by sorry
/-- Unit test R011Tests.lattice_reduce_zero. -/
example [Subsingleton V] : Module.finrank (IsLocalRing.ResidueField O)
 (IsLocalRing.ResidueField O ⊗[O] Λ.lattice) = 0 := by sorry
end Reduction
end GaloisLattice.IntegralModel

namespace ContinuousRep
section LocalReduction
open scoped TensorProduct
variable {Γ A M : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsLocalRing A]
 [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
 [TopologicalSpace M] [IsModuleTopology A M]
 (hm : IsOpen (IsLocalRing.maximalIdeal A : Set A))
 [TopologicalSpace (IsLocalRing.ResidueField A)] [DiscreteTopology (IsLocalRing.ResidueField A)]
 [TopologicalSpace (IsLocalRing.ResidueField A ⊗[A] M)]
 [IsModuleTopology (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] M)]
 (ρ : ContinuousRep Γ A M)
theorem reduceLocal_apply_tmul (g : Γ) (a : IsLocalRing.ResidueField A) (m : M) :
 ρ.reduceLocal hm g (a ⊗ₜ[A] m) = a ⊗ₜ[A] (ρ g m) := by sorry
theorem charpoly_reduceLocal [Module.Free A M] (g : Γ) :
 (ρ.reduceLocal hm).charpoly g = (ρ.charpoly g).map (IsLocalRing.residue A) := by sorry
theorem det_reduceLocal : (ρ.reduceLocal hm).det =
 (Units.map (IsLocalRing.residue A).toMonoidHom).comp ρ.det := by sorry
/-- Unit test R011Tests.reduce_zero. -/
example [Subsingleton M] : Module.finrank (IsLocalRing.ResidueField A)
 (IsLocalRing.ResidueField A ⊗[A] M) = 0 := by sorry
/-- Unit test R011Tests.reduce_charpoly. -/
example [Module.Free A M] (g : Γ) :
 (ρ.reduceLocal hm).charpoly g = (ρ.charpoly g).map (IsLocalRing.residue A) := by sorry
end LocalReduction
/-- Unit test R011Tests.reduce_line. -/
example {Γ A : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [IsLocalRing A]
 (hm : IsOpen (IsLocalRing.maximalIdeal A : Set A))
 [TopologicalSpace (IsLocalRing.ResidueField A)] [DiscreteTopology (IsLocalRing.ResidueField A)]
 [TopologicalSpace (IsLocalRing.ResidueField A ⊗[A] A)]
 [IsModuleTopology (IsLocalRing.ResidueField A) (IsLocalRing.ResidueField A ⊗[A] A)]
 (χ : Γ →ₜ* Aˣ) (g : Γ) (x : IsLocalRing.ResidueField A ⊗[A] A) :
 (ofCharacter χ).reduceLocal hm g x = IsLocalRing.residue A (χ g : A) • x := by sorry

section BasisFreeCoefficientTwist
attribute [local instance] Bundled.isAddCommGroup Bundled.isModule Bundled.isFinite
 Bundled.isProjective Bundled.isTopologicalSpace Bundled.isModuleTopology
variable {Γ A M : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
 [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
 [TopologicalSpace M] [IsModuleTopology A M]

def coeffTwistModule (σ : A ≃+* A) (hσ : Continuous σ) (ρ : ContinuousRep Γ A M) : Bundled Γ A := sorry
theorem coeffTwistModule_apply_tmul (σ : A ≃+* A) (hσ : Continuous σ)
 (ρ : ContinuousRep Γ A M) :
 letI : Algebra A A := σ.toRingHom.toAlgebra
 ∃ e : (A ⊗[A] M) ≃ₗ[A] (coeffTwistModule σ hσ ρ).carrier,
  ∀ g a m, (coeffTwistModule σ hσ ρ).rep g (e (a ⊗ₜ[A] m)) =
    e (a ⊗ₜ[A] (ρ g m)) := by sorry
theorem coeffTwistModule_id (ρ : ContinuousRep Γ A M) :
 Nonempty (Iso (coeffTwistModule (RingEquiv.refl A) continuous_id ρ).rep ρ) := by sorry
theorem coeffTwistModule_comp (σ τ : A ≃+* A) (hσ : Continuous σ) (hτ : Continuous τ)
 (ρ : ContinuousRep Γ A M) :
 Nonempty (Iso (coeffTwistModule σ hσ (coeffTwistModule τ hτ ρ).rep).rep
   (coeffTwistModule (τ.trans σ) (hσ.comp hτ) ρ).rep) := by sorry
theorem coeffTwistModule_frame (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
 (ρ : ContinuousRep Γ A M) (b : Module.Basis (Fin n) A M) :
 Nonempty (Iso (coeffTwistModule σ hσ ρ).rep (ofFramed (coeffTwist σ hσ (frame b ρ)))) := by sorry
/-- Unit test R011Tests.coeff_identity. -/
example (ρ : ContinuousRep Γ A M) :
 Nonempty (Iso (coeffTwistModule (RingEquiv.refl A) continuous_id ρ).rep ρ) := by sorry
/-- Unit test R011Tests.coeff_line. -/
example (σ : A ≃+* A) (hσ : Continuous σ) (χ : Γ →ₜ* Aˣ)
 (χσ : Γ →ₜ* Aˣ) (hχ : ∀ g, (χσ g : A) = σ (χ g : A)) :
 Nonempty (Iso (coeffTwistModule σ hσ (ofCharacter χ)).rep (ofCharacter χσ)) := by sorry
/-- Unit test R011Tests.coeff_frame. -/
example (σ : A ≃+* A) (hσ : Continuous σ) {n : ℕ}
 (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) A) (g : Γ) :
 (coeffTwist σ hσ ρ g : Matrix (Fin n) (Fin n) A).charpoly =
 (ρ g : Matrix (Fin n) (Fin n) A).charpoly.map σ.toRingHom := by sorry

def frobTwistModule (p : ℕ) [Fact p.Prime] {k : Type*} [Field k] [CharP k p] [PerfectRing k p]
 [TopologicalSpace k] [DiscreteTopology k] {V : Type*} [AddCommGroup V] [Module k V]
 [FiniteDimensional k V] [TopologicalSpace V] [IsModuleTopology k V]
 (ρ : ContinuousRep Γ k V) : Bundled Γ k :=
 coeffTwistModule (frobeniusEquiv k p) continuous_of_discreteTopology ρ

theorem frobTwist_apply (p : ℕ) [Fact p.Prime] {k : Type*} [Field k] [CharP k p] [PerfectRing k p]
 [TopologicalSpace k] [DiscreteTopology k] {n : ℕ}
 (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) k) (g : Γ) (i j : Fin n) :
 (frobTwist p ρ g : Matrix (Fin n) (Fin n) k) i j =
 ((ρ g : Matrix (Fin n) (Fin n) k) i j)^p := by sorry
theorem frobTwist_primeField (p : ℕ) [Fact p.Prime] {V : Type*}
 [AddCommGroup V] [Module (ZMod p) V] [FiniteDimensional (ZMod p) V]
 [TopologicalSpace V] [IsModuleTopology (ZMod p) V]
 (ρ : ContinuousRep Γ (ZMod p) V) : Nonempty (Iso (frobTwistModule p ρ).rep ρ) := by sorry
end BasisFreeCoefficientTwist

abbrev AlgebraicIntegers (ℓ : ℕ) [Fact ℓ.Prime] := ((PadicAlgCl.valued ℓ).v.valuationSubring)
def algebraicResidueMap (ℓ : ℕ) [Fact ℓ.Prime]
 (ι : IsLocalRing.ResidueField (AlgebraicIntegers ℓ) ≃+* AlgebraicClosure (ZMod ℓ)) :
 AlgebraicIntegers ℓ →+* AlgebraicClosure (ZMod ℓ) := ι.toRingHom.comp (IsLocalRing.residue _)

section ResidualRepresentative
attribute [local instance] Bundled.isAddCommGroup Bundled.isModule Bundled.isFinite
 Bundled.isProjective Bundled.isTopologicalSpace Bundled.isModuleTopology
variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
 (ℓ : ℕ) [Fact ℓ.Prime]
 [TopologicalSpace (AlgebraicClosure (ZMod ℓ))] [DiscreteTopology (AlgebraicClosure (ZMod ℓ))]
 (ι : IsLocalRing.ResidueField (AlgebraicIntegers ℓ) ≃+* AlgebraicClosure (ZMod ℓ))
 {V : Type*} [AddCommGroup V] [Module (PadicAlgCl ℓ) V] [FiniteDimensional (PadicAlgCl ℓ) V]
 [TopologicalSpace V] [IsModuleTopology (PadicAlgCl ℓ) V]

def residual (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) : Bundled Γ (AlgebraicClosure (ZMod ℓ)) := by
 have _ := ι
 have _ := (inferInstance : CompactSpace Γ)
 have _ := (inferInstance : T2Space Γ)
 sorry
theorem residual_isSemisimple (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) :
 Representation.IsSemisimpleRepresentation (residual ℓ ι ρ).rep.toRepresentation := by sorry
theorem residual_choice_independent (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V)
 {n : ℕ} (ρO : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (AlgebraicIntegers ℓ))
 (hint : Nonempty (Iso ρ
   (ofFramed (Framed.map (AlgebraicIntegers ℓ).subtype continuous_subtype_val ρO))))
 (hred : Continuous (algebraicResidueMap ℓ ι)) :
 Nonempty (Iso (residual ℓ ι ρ).rep
  (ofFramed (Framed.map (algebraicResidueMap ℓ ι) hred ρO)).semisimplification.rep) := by sorry
theorem residual_finite_image (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) :
 (Set.range fun g : Γ => (residual ℓ ι ρ).rep g).Finite := by sorry
theorem residual_charpoly (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V)
 {n : ℕ} (ρO : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) (AlgebraicIntegers ℓ))
 (hint : Nonempty (Iso ρ
   (ofFramed (Framed.map (AlgebraicIntegers ℓ).subtype continuous_subtype_val ρO)))) (g : Γ) :
 (residual ℓ ι ρ).rep.charpoly g =
 (ρO g : Matrix (Fin n) (Fin n) (AlgebraicIntegers ℓ)).charpoly.map (algebraicResidueMap ℓ ι) := by sorry
/-- Unit test R011Tests.residual_zero. -/
example [Subsingleton V] (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) :
 Module.finrank (AlgebraicClosure (ZMod ℓ)) (residual ℓ ι ρ).carrier = 0 := by sorry
/-- Unit test R011Tests.residual_trivial. -/
example (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) (hρ : ∀ g, ρ g = LinearMap.id) :
 ∀ g, (residual ℓ ι ρ).rep g = LinearMap.id := by sorry
/-- Unit test R011Tests.residual_unipotent. -/
example (ρ : ContinuousRep Γ (PadicAlgCl ℓ) V) (b : Module.Basis (Fin 2) (PadicAlgCl ℓ) V)
 (hρ : ∀ g, LinearMap.toMatrix b b (ρ g) 0 0 = 1 ∧
  LinearMap.toMatrix b b (ρ g) 1 1 = 1 ∧ LinearMap.toMatrix b b (ρ g) 1 0 = 0) :
 Module.finrank (AlgebraicClosure (ZMod ℓ)) (residual ℓ ι ρ).carrier = 2 ∧
 ∀ g, (residual ℓ ι ρ).rep g = LinearMap.id := by sorry
end ResidualRepresentative

namespace Teichmuller
variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ]
 (ℓ : ℕ) [Fact ℓ.Prime]
 [TopologicalSpace (AlgebraicClosure (ZMod ℓ))] [DiscreteTopology (AlgebraicClosure (ZMod ℓ))]
 (ι : IsLocalRing.ResidueField (AlgebraicIntegers ℓ) ≃+* AlgebraicClosure (ZMod ℓ))

def liftAlgebraic (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) :
 Γ →ₜ* (AlgebraicIntegers ℓ)ˣ := by
 have _ := ι
 have _ := (inferInstance : CompactSpace Γ)
 have _ := (inferInstance : T2Space Γ)
 sorry
def liftAlgebraicField (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) :
 Γ →ₜ* (PadicAlgCl ℓ)ˣ := by
 have _ := ι
 have _ := (inferInstance : CompactSpace Γ)
 have _ := (inferInstance : T2Space Γ)
 sorry
theorem liftAlgebraicField_apply (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) (g : Γ) :
 liftAlgebraicField ℓ ι ψ g = Units.map (AlgebraicIntegers ℓ).subtype.toMonoidHom
  (liftAlgebraic ℓ ι ψ g) := by sorry
theorem liftAlgebraic_residue (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) (g : Γ) :
 Units.map (algebraicResidueMap ℓ ι).toMonoidHom (liftAlgebraic ℓ ι ψ g) = ψ g := by sorry
theorem liftAlgebraic_unique (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ)
 (χ : Γ →ₜ* (AlgebraicIntegers ℓ)ˣ)
 (htors : ∀ g, ∃ n : ℕ, ℓ.Coprime n ∧ χ g ^ n = 1)
 (hred : ∀ g, Units.map (algebraicResidueMap ℓ ι).toMonoidHom (χ g) = ψ g) :
 χ = liftAlgebraic ℓ ι ψ := by sorry
theorem liftAlgebraic_model (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ)
 {O : Type*} [CommRing O] [TopologicalSpace O] [IsTopologicalRing O] [IsLocalRing O]
 [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
 (j : O →+* AlgebraicIntegers ℓ) (hj : Continuous j)
 (ψO : Γ →* (IsLocalRing.ResidueField O)ˣ) (hψO : IsOpen (ψO.ker : Set Γ))
 (htors : ℓ.Coprime (Nat.card (IsLocalRing.ResidueField O) - 1))
 (hres : ∀ g, Units.map (algebraicResidueMap ℓ ι).toMonoidHom
   (Units.map j.toMonoidHom (lift ψO hψO g)) = ψ g) (g : Γ) :
 liftAlgebraic ℓ ι ψ g = Units.map j.toMonoidHom (lift ψO hψO g) := by sorry
/-- Unit test R011Tests.teich_algebraic_one. -/
example (g : Γ) : liftAlgebraicField ℓ ι (1 : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) g = 1 := by sorry
/-- Unit test R011Tests.teich_algebraic_order. -/
example (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ) (g : Γ) :
 orderOf (liftAlgebraicField ℓ ι ψ g) = orderOf (ψ g) := by sorry
/-- Unit test R011Tests.teich_algebraic_model. Values with the same residue and prime-to-ℓ torsion agree. -/
example (ψ : Γ →ₜ* (AlgebraicClosure (ZMod ℓ))ˣ)
 (χ : Γ →ₜ* (AlgebraicIntegers ℓ)ˣ)
 (htors : ∀ g, ∃ n : ℕ, ℓ.Coprime n ∧ χ g ^ n = 1)
 (hred : ∀ g, Units.map (algebraicResidueMap ℓ ι).toMonoidHom (χ g) = ψ g) (g : Γ) :
 Units.map (AlgebraicIntegers ℓ).subtype.toMonoidHom (χ g) = liftAlgebraicField ℓ ι ψ g := by sorry
end Teichmuller
end ContinuousRep
end TauCeti

namespace TauCeti
noncomputable section
open scoped TensorProduct

namespace GaloisRep

/-- Composition of the continuous maps induced by compatible embeddings of
algebraic closures. The scalar-tower hypotheses pin the embeddings. -/
theorem localEmbeddingMap_comp_tower (F K L : Type*) [Field F] [Field K] [Field L]
    [Algebra F K] [Algebra K L] [Algebra F L] [IsScalarTower F K L]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure K)]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
    [IsScalarTower (AlgebraicClosure F) (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure K)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)] :
    (localEmbeddingMap F K).comp (localEmbeddingMap K L) = localEmbeddingMap F L := by sorry

/-- Local restriction commutes with global restriction, after choosing a
commuting square of closure embeddings. -/
theorem localRestriction_restrict
    {GF GExt GK GM A V : Type*}
    [Group GF] [Group GExt] [Group GK] [Group GM]
    [TopologicalSpace GF] [TopologicalSpace GExt] [TopologicalSpace GK] [TopologicalSpace GM]
    [CommRing A] [TopologicalSpace A]
    [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V]
    [TopologicalSpace V] [IsModuleTopology A V]
    (global : GExt →ₜ* GF) (loc : GM →ₜ* GK)
    (atF : GK →ₜ* GF) (atL : GM →ₜ* GExt)
    (hsquare : global.comp atL = atF.comp loc) (ρ : ContinuousRep GF A V) :
    (ρ.res global).res atL = (ρ.res atF).res loc := by sorry

/-- Finite-image local restriction descends to the quotient by its kernel;
the resulting faithful action carries the named inertia subgroups to their
actual images. -/
theorem localRestriction_kernelField
    {G H A V : Type*} [Group G] [Group H]
    [TopologicalSpace G] [TopologicalSpace H] [CommRing A] [TopologicalSpace A]
    [AddCommGroup V] [Module A V] [Module.Finite A V] [Module.Projective A V]
    [TopologicalSpace V] [IsModuleTopology A V]
    (ι : H →ₜ* G) (ρ : ContinuousRep G A V) (I P : Subgroup H)
    (hfinite : (Set.range fun h => ρ (ι h)).Finite) :
    ∃ s : H ⧸ ((ρ.toRepresentation.comp ι.toMonoidHom).ker) →*
        (Module.End A V)ˣ,
      Function.Injective s ∧
      (∀ h, (s (QuotientGroup.mk h) : Module.End A V) = ρ (ι h)) ∧
      (I.map (QuotientGroup.mk' _)).map s =
        I.map ((ρ.toRepresentation.comp ι.toMonoidHom).toHomUnits) ∧
      (P.map (QuotientGroup.mk' _)).map s =
        P.map ((ρ.toRepresentation.comp ι.toMonoidHom).toHomUnits) := by sorry

/-- Unit test: TauCeti.GaloisRep.isUnramifiedAt_not_of_reduction.
The explicit nonzero unipotent entry lies in the kernel of the residue map. -/
example {G O k : Type*} [Group G] [CommRing O] [Field k]
    (red : O →+* k) (I : Subgroup G) (a : G → O)
    (ρ : Representation O G (Fin 2 → O))
    (ρbar : Representation k G (Fin 2 → k))
    (hmatrix : ∀ g ∈ I, LinearMap.toMatrix' (ρ g) = !![1, a g; 0, 1])
    (hred : ∀ g, LinearMap.toMatrix' (ρbar g) = (LinearMap.toMatrix' (ρ g)).map red)
    (hzero : ∀ g ∈ I, red (a g) = 0) (hnonzero : ∃ g ∈ I, a g ≠ 0) :
    (∀ g ∈ I, ρbar g = LinearMap.id) ∧ ¬ (∀ g ∈ I, ρ g = LinearMap.id) := by sorry

end GaloisRep
end
end TauCeti

namespace TauCeti
noncomputable section
open scoped TensorProduct

namespace GaloisLattice.IntegralModel

/-- The carrier comparison for reduction of a coefficient-extended lattice.
Apply this to `Λ.toContinuousRep`; the specified scalar towers include the
commutative square of integral and residue-field maps. -/
theorem reduction_baseChange
    {Γ O O' k k' M : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [IsTopologicalRing O]
    [CommRing O'] [TopologicalSpace O'] [IsTopologicalRing O'] [Algebra O O']
    [Field k] [TopologicalSpace k] [IsTopologicalRing k] [Algebra O k]
    [Field k'] [TopologicalSpace k'] [IsTopologicalRing k'] [Algebra O k'] [Algebra O' k'] [Algebra k k']
    [IsScalarTower O O' k'] [IsScalarTower O k k']
    [ContinuousSMul O O'] [ContinuousSMul O k] [ContinuousSMul O' k']
    [ContinuousSMul k k']
    [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Projective O M]
    [TopologicalSpace M] [IsModuleTopology O M]
    [TopologicalSpace (O' ⊗[O] M)] [IsModuleTopology O' (O' ⊗[O] M)]
    [TopologicalSpace (k ⊗[O] M)] [IsModuleTopology k (k ⊗[O] M)]
    [TopologicalSpace (k' ⊗[O'] (O' ⊗[O] M))]
    [IsModuleTopology k' (k' ⊗[O'] (O' ⊗[O] M))]
    [TopologicalSpace (k' ⊗[k] (k ⊗[O] M))]
    [IsModuleTopology k' (k' ⊗[k] (k ⊗[O] M))]
    (ρ : ContinuousRep Γ O M) :
    ∃ e : ContinuousRep.Iso ((ρ.baseChange (B := O')).baseChange (B := k'))
        ((ρ.baseChange (B := k)).baseChange (B := k')),
      ∀ (a : k') (b : O') (m : M),
        e.toLinearEquiv (a ⊗ₜ[O'] (b ⊗ₜ[O] m)) =
          (a * algebraMap O' k' b) ⊗ₜ[k] (1 ⊗ₜ[O] m) := by sorry

/-- Reduction of the tensor lattice: the isomorphism is specified on pure tensors.
Dual, restriction, twist and sum companions use their canonical carrier maps. -/
theorem reduction_tensor
    {Γ O k M N : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [IsTopologicalRing O]
    [Field k] [TopologicalSpace k] [IsTopologicalRing k] [Algebra O k]
    [ContinuousSMul O k]
    [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Projective O M]
    [TopologicalSpace M] [IsModuleTopology O M]
    [AddCommGroup N] [Module O N] [Module.Finite O N] [Module.Projective O N]
    [TopologicalSpace N] [IsModuleTopology O N]
    [TopologicalSpace (M ⊗[O] N)] [IsModuleTopology O (M ⊗[O] N)]
    [TopologicalSpace (k ⊗[O] M)] [IsModuleTopology k (k ⊗[O] M)]
    [TopologicalSpace (k ⊗[O] N)] [IsModuleTopology k (k ⊗[O] N)]
    [TopologicalSpace (k ⊗[O] (M ⊗[O] N))]
    [IsModuleTopology k (k ⊗[O] (M ⊗[O] N))]
    [TopologicalSpace ((k ⊗[O] M) ⊗[k] (k ⊗[O] N))]
    [IsModuleTopology k ((k ⊗[O] M) ⊗[k] (k ⊗[O] N))]
    (ρ : ContinuousRep Γ O M) (σ : ContinuousRep Γ O N) :
    ∃ e : ContinuousRep.Iso ((ρ.tensor σ).baseChange (B := k))
        ((ρ.baseChange (B := k)).tensor (σ.baseChange (B := k))),
      ∀ (a : k) (m : M) (n : N),
        e.toLinearEquiv (a ⊗ₜ[O] (m ⊗ₜ[O] n)) =
          (a ⊗ₜ[O] m) ⊗ₜ[k] (1 ⊗ₜ[O] n) := by sorry

end GaloisLattice.IntegralModel

namespace ContinuousRep

/-- Residual coefficient twisting in an integral frame. The commutative residue
square makes the coefficient automorphism on the residual representation explicit;
applying semisimplification gives the unframed residual comparison. -/
theorem residual_coeffTwist
    {Γ O k : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [Field k] [TopologicalSpace k]
    (red : O →+* k) (hred : Continuous red)
    (γ : O ≃+* O) (hγ : Continuous γ) (γbar : k ≃+* k)
    (hγbar : Continuous γbar) (hsquare : ∀ x, red (γ x) = γbar (red x))
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) O) :
    Framed.map red hred (coeffTwist γ hγ ρ) =
      coeffTwist γbar hγbar (Framed.map red hred ρ) := by sorry

/-- Unit test: TauCeti.ContinuousRep.residual_coeffTwist_inertia.
An integral coefficient automorphism acting trivially on the residue field
leaves the residual action unchanged. -/
example {Γ O k : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [Field k] [TopologicalSpace k]
    (red : O →+* k) (hred : Continuous red)
    (γ : O ≃+* O) (hγ : Continuous γ) (hinertia : ∀ x, red (γ x) = red x)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) O) :
    Framed.map red hred (coeffTwist γ hγ ρ) = Framed.map red hred ρ := by sorry

/-- Coefficient Frobenius lifts induce the residue-field Frobenius, so the
comparison is independent of the lift. LocalFieldsRamification supplies these
residue-square hypotheses for actual coefficient-Galois elements. -/
theorem residual_coeffTwist_frobeniusLift
    {Γ O k : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [Field k] [TopologicalSpace k]
    [DiscreteTopology k] (ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ] [PerfectRing k ℓ]
    (red : O →+* k) (hred : Continuous red)
    (γ γ' : O ≃+* O) (hγ : Continuous γ) (hγ' : Continuous γ')
    (hF : ∀ x, red (γ x) = (red x) ^ ℓ)
    (hF' : ∀ x, red (γ' x) = (red x) ^ ℓ)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) O) :
    Framed.map red hred (coeffTwist γ hγ ρ) =
        frobTwist ℓ (Framed.map red hred ρ) ∧
      Framed.map red hred (coeffTwist γ hγ ρ) =
        Framed.map red hred (coeffTwist γ' hγ' ρ) := by sorry

/-- Unit test: TauCeti.ContinuousRep.residual_coeffTwist_inertia (Frobenius clause).
This supplements the inertia computation above with the different residue action. -/
example {Γ O k : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [Field k] [TopologicalSpace k]
    [DiscreteTopology k] (ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ] [PerfectRing k ℓ]
    (red : O →+* k) (hred : Continuous red)
    (γ : O ≃+* O) (hγ : Continuous γ)
    (hF : ∀ x, red (γ x) = (red x) ^ ℓ)
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) O) :
    Framed.map red hred (coeffTwist γ hγ ρ) =
      frobTwist ℓ (Framed.map red hred ρ) := by sorry

section ResidualTwistSS
attribute [local instance] Bundled.isAddCommGroup Bundled.isModule Bundled.isFinite
  Bundled.isProjective Bundled.isTopologicalSpace Bundled.isModuleTopology

/-- The integral-frame comparison descends to the unframed residual
semisimplifications. Lattice and coefficient descent independence then apply. -/
theorem residual_coeffTwist_semisimplification
    {Γ O k : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CommRing O] [TopologicalSpace O] [Field k] [TopologicalSpace k] [IsTopologicalRing k]
    (red : O →+* k) (hred : Continuous red)
    (γ : O ≃+* O) (hγ : Continuous γ) (γbar : k ≃+* k)
    (hγbar : Continuous γbar) (hsquare : ∀ x, red (γ x) = γbar (red x))
    {n : ℕ} (ρ : Γ →ₜ* Matrix.GeneralLinearGroup (Fin n) O) :
    Nonempty (Iso
      (ofFramed (Framed.map red hred (coeffTwist γ hγ ρ))).semisimplification.rep
      (ofFramed (coeffTwist γbar hγbar (Framed.map red hred ρ))).semisimplification.rep) := by sorry
end ResidualTwistSS

end ContinuousRep

end
end TauCeti

namespace TauCeti
namespace ContinuousRep.TateTwist
variable {F : Type*} [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)]
/-- Unit test R011Tests.zl_one_det. -/
example : (zlOne F ℓ).det = (cyclotomicChar F ℓ).toMonoidHom := by sorry
/-- Unit test R011Tests.zl_one_closed. Over an algebraically closed base the character is trivial. -/
example [IsAlgClosed F] (g : Field.absoluteGaloisGroup F) (x : ℤ_[ℓ]) : zlOne F ℓ g x = x := by sorry
/-- Unit test R011Tests.tate_minus_one. -/
example : tateTwist ℓ (zlOne F ℓ) (-1) = ContinuousRep.trivial := by sorry
/-- Unit test R011Tests.tate_zero. -/
example {A M : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
 [Algebra ℤ_[ℓ] A] [ContinuousSMul ℤ_[ℓ] A]
 [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
 [TopologicalSpace M] [IsModuleTopology A M]
 (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) : tateTwist ℓ ρ 0 = ρ := by sorry
/-- Unit test R011Tests.tate_add. -/
example {A M : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A]
 [Algebra ℤ_[ℓ] A] [ContinuousSMul ℤ_[ℓ] A]
 [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
 [TopologicalSpace M] [IsModuleTopology A M]
 (ρ : ContinuousRep (Field.absoluteGaloisGroup F) A M) (m n : ℤ) :
 tateTwist ℓ (tateTwist ℓ ρ m) n = tateTwist ℓ ρ (m+n) := by sorry
end ContinuousRep.TateTwist

namespace ContinuousRep.Teichmuller
/-- Unit test R011Tests.teich_residue. -/
example {Γ O : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing O] [TopologicalSpace O] [IsTopologicalRing O] [IsLocalRing O]
 [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
 (ψ : Γ →* (IsLocalRing.ResidueField O)ˣ) (hψ : IsOpen (ψ.ker : Set Γ)) (g : Γ) :
 Units.map (IsLocalRing.residue O).toMonoidHom (lift ψ hψ g) = ψ g := by sorry
end ContinuousRep.Teichmuller

namespace GaloisLattice.IntegralModel
open scoped TensorProduct
universe uO uG uV
variable {Γ : Type uG} {O E : Type uO} {V : Type uV}
 [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
 [CommRing O] [TopologicalSpace O] [IsDomain O] [IsDiscreteValuationRing O]
 [Field E] [TopologicalSpace E] [IsTopologicalRing E] [Algebra O E] [IsFractionRing O E]
 [AddCommGroup V] [Module E V] [FiniteDimensional E V] [TopologicalSpace V] [IsModuleTopology E V]
 [Module O V] [IsScalarTower O E V]
 [TopologicalSpace (Module.Dual E V)] [IsModuleTopology E (Module.Dual E V)]
 [TopologicalSpace (IsLocalRing.ResidueField O)] [DiscreteTopology (IsLocalRing.ResidueField O)]
 [ContinuousSMul O (IsLocalRing.ResidueField O)]
 (ρ : ContinuousRep Γ E V) (Λ : IntegralModel O ρ)
 [IsModuleTopology O Λ.lattice] [IsModuleTopology O Λ.dual.lattice]
 [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
 [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice)]
 [TopologicalSpace (IsLocalRing.ResidueField O ⊗[O] Λ.dual.lattice)]
 [IsModuleTopology (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.dual.lattice)]
 [TopologicalSpace (Module.Dual (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice))]
 [IsModuleTopology (IsLocalRing.ResidueField O)
  (Module.Dual (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O ⊗[O] Λ.lattice))]

theorem dual_reduction : Nonempty (ContinuousRep.Iso Λ.dual.reduction Λ.reduction.dual) := by sorry
end GaloisLattice.IntegralModel
end TauCeti
