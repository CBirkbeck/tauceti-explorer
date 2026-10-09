/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/ArithmeticGaloisRepresentations--R01.4.md) is definitive.
It suggests Lean signatures for contributors and reviewers. Proofs and genuinely
missing data constructions use `sorry`; predicates have their mathematical bodies.
No implementation is claimed.

R01.1 carriers and R01.2 local maps below are dependency interfaces, retained from
 the accepted parent prototype. R01.4 owns the residual-image declarations.
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
import Mathlib.RepresentationTheory.Induced
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.LinearAlgebra.Eigenspace.Semisimple
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
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.GroupTheory.SemidirectProduct
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.IsDiag
import Mathlib.RingTheory.Trace.Basic
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.FieldTheory.Separable
import Mathlib.Data.Finset.Sym
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Algebra.Module.Basic
import Mathlib.RingTheory.Nilpotent.Exp
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Normalizer
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.NonSplitTorus
import Mathlib.LinearAlgebra.Projectivization.PSL.PSL2
import Mathlib.FieldTheory.SplittingField.Construction
import Mathlib.Algebra.DualNumber

noncomputable section
open scoped TensorProduct MatrixGroups
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

section FieldCoefficients

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  {K : Type v} [Field K] [TopologicalSpace K]
  {M : Type w} [AddCommGroup M] [Module K M] [Module.Finite K M] [Module.Projective K M]
  [TopologicalSpace M] [IsModuleTopology K M]

/-- Absolute irreducibility over a field of coefficients, in Burnside's form: the carrier is
nonzero and the operators `ρ(g)` span `End_K(M)`; equivalent to irreducibility after every
field extension. -/
def IsAbsolutelyIrreducible (ρ : ContinuousRep Γ K M) : Prop :=
  Nontrivial M ∧ Submodule.span K (Set.range fun g : Γ => ρ g) = ⊤


end FieldCoefficients
end ContinuousRep

namespace GaloisRep
def localEmbeddingMap (K L : Type*) [Field K] [Field L] [Algebra K L]
    [Algebra (AlgebraicClosure K) (AlgebraicClosure L)]
    [IsScalarTower K (AlgebraicClosure K) (AlgebraicClosure L)] :
    Field.absoluteGaloisGroup L →ₜ* Field.absoluteGaloisGroup K :=
  Field.absoluteGaloisGroup.mapOfAlgebra K L

/-- The inertia subgroup of `G_K` for a nonarchimedean local field `K` (Tau Ceti
LocalFieldsRamification layer 4). -/
def inertiaGroup (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : Subgroup (Field.absoluteGaloisGroup K) := sorry

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
end TauCeti

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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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

/-- Arbitrary-basis comparison for the non-split Cartan. The exact comparison with the
pinned Tau Ceti model is `nonsplit_GL2NonSplitTorus` below. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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

/-- `rhoBar` is bad dihedral (at `p`) if it is absolutely irreducible while its restriction to
`G_{F'}` is not (Dieulefait–Pacetti Definition 1.12 for `F = ℚ`). -/
def IsBadDihedral (p : ℕ) (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k M) : Prop :=
  ρ.IsAbsolutelyIrreducible ∧
    ¬ (resFixingSubgroup (cyclotomicSquareSubfield F p) ρ).IsAbsolutelyIrreducible

/-- Bad dihedral iff absolutely irreducible with `rhoBar|_{G_{F(ζ_p)}}` not absolutely irreducible. -/
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

/-- For `F = ℚ`, a bad dihedral `rhoBar` has projective inertia image `π(rhoBar(I_p))` of order `≤ 2`
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

/-- A bad dihedral `rhoBar` has `[F' : F] = 2`, is induced from `G_{F'}` (over `k̄`, a `G_{F'}`-stable
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

/-- Unit test: TauCeti.GaloisRep.isBadDihedral_iff_induced. `rhoBar` is bad dihedral iff
`[F' : F] = 2` and `rhoBar ⊗ F̄_p ≅ Ind_{G_{F'}}^{G_F} χ` with `χ ≠ χ^σ`: a `G_{F'}`-stable line moved
by some element outside `G_{F'}` (so `F' ≠ F`), with `G_{F'}` not acting by scalars. When
`F' = F` no `rhoBar` is bad dihedral. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
theorem image_res_eq_of_disjoint {F : Type*} [Field F] [PerfectField F] {A : Type*} [CommRing A]
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
theorem normal_subgroups_GL2 {k : Type*} [Field k] [Finite k] (hq : 4 ≤ Nat.card k) :
    commutator (Matrix.SpecialLinearGroup (Fin 2) k) = ⊤ ∧
      IsSimpleGroup (Matrix.ProjectiveSpecialLinearGroup (Fin 2) k) ∧
      ∀ N : Subgroup (GL (Fin 2) k), N.Normal →
        (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin 2) k →* _).range ≤ N ∨
          N ≤ Subgroup.center (GL (Fin 2) k) := by
  sorry

/-! ### Residual images under restriction to cyclotomic fields (ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field) -/

/-- ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, parts (b) and
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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
The reader gives the full target; supplementary signatures below include its other clauses. -/
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


end GaloisRep
/-! ## Supplementary construction APIs and discriminating examples -/

namespace GaloisRep
section ConjugationAPI
variable {F : Type*} [Field F] [NumberField F]

/-- Transport conjugation on the algebraic image of an embedding above a real place. -/
def complexConjugationOfEmbedding (v : InfinitePlace F) (hv : v.IsReal)
    (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v) :
    Field.absoluteGaloisGroup F := sorry

theorem complexConjugationOfEmbedding_spec (v : InfinitePlace F) (hv : v.IsReal)
    (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (x : AlgebraicClosure F) :
    ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from complexConjugationOfEmbedding v hv ι hι) x) = Complex.conjAe (ι x) := by
  sorry

theorem complexConjugationOfEmbedding_unique (v : InfinitePlace F) (hv : v.IsReal)
    (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (c : Field.absoluteGaloisGroup F)
    (hc : ∀ x, ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from c) x) = Complex.conjAe (ι x)) :
    c = complexConjugationOfEmbedding v hv ι hι := by
  sorry

theorem complexConjugation_spec (v : InfinitePlace F) (hv : v.IsReal) :
    ∃ ι : AlgebraicClosure F →+* ℂ,
      InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v ∧
      ∀ x, ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from complexConjugation F v hv) x) = Complex.conjAe (ι x) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.complexConjugation_on_sqrt_minus_one. -/
example (v : InfinitePlace F) (hv : v.IsReal) (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (i : AlgebraicClosure F) (hi : i ^ 2 = -1) :
    (show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from complexConjugationOfEmbedding v hv ι hι) i = -i := by
  sorry

/-- Unit test: TauCeti.GaloisRep.complexConjugation_on_real_base. -/
example (v : InfinitePlace F) (hv : v.IsReal) (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v) (a : F) :
    (show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from complexConjugationOfEmbedding v hv ι hι) (algebraMap F (AlgebraicClosure F) a) =
      algebraMap F (AlgebraicClosure F) a := by
  sorry

/-- Unit test: TauCeti.GaloisRep.complexConjugation_on_primitive_root. -/
example (v : InfinitePlace F) (hv : v.IsReal) (ι : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (ζ : AlgebraicClosure F) (n : ℕ) (hζ : IsPrimitiveRoot ζ n) (hn : n ≠ 0) :
    (show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from complexConjugationOfEmbedding v hv ι hι) ζ = ζ⁻¹ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.complexConjugation_change_embedding. -/
example (v : InfinitePlace F) (hv : v.IsReal) (ι ι' : AlgebraicClosure F →+* ℂ)
    (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v)
    (hι' : InfinitePlace.mk (ι'.comp (algebraMap F (AlgebraicClosure F))) = v)
    (g : Field.absoluteGaloisGroup F) (hg : ∀ x, ι' x = ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from g) x)) :
    complexConjugationOfEmbedding v hv ι' hι' =
      g⁻¹ * complexConjugationOfEmbedding v hv ι hι * g := by
  sorry
end ConjugationAPI

section TotallyOddAPI
variable {F : Type*} [Field F] [NumberField F] {A : Type*} [CommRing A]

theorem isTotallyOddChar_iff_embeddings (μ : Field.absoluteGaloisGroup F →* Aˣ) :
    IsTotallyOddChar μ ↔ ∀ (v : InfinitePlace F) (hv : v.IsReal)
      (ι : AlgebraicClosure F →+* ℂ)
      (hι : InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v),
      μ (complexConjugationOfEmbedding v hv ι hι) = -1 := by
  sorry

theorem isTotallyOddChar_map {B : Type*} [CommRing B] (f : A →+* B)
    (μ : Field.absoluteGaloisGroup F →* Aˣ) :
    (IsTotallyOddChar μ → IsTotallyOddChar ((Units.map f.toMonoidHom).comp μ)) ∧
      (Function.Injective f →
        (IsTotallyOddChar ((Units.map f.toMonoidHom).comp μ) ↔ IsTotallyOddChar μ)) := by
  sorry

theorem isTotallyOddChar_restrict {L : Type*} [Field L] [NumberField L] [Algebra F L]
    [Algebra (AlgebraicClosure F) (AlgebraicClosure L)]
    [IsScalarTower F (AlgebraicClosure F) (AlgebraicClosure L)]
    (μ : Field.absoluteGaloisGroup F →* Aˣ) (hμ : IsTotallyOddChar μ) :
    IsTotallyOddChar (μ.comp (localEmbeddingMap F L).toMonoidHom) := by
  sorry

theorem isTotallyOddChar_mul_square (μ ψ : Field.absoluteGaloisGroup F →* Aˣ) :
    IsTotallyOddChar (μ * ψ ^ 2) ↔ IsTotallyOddChar μ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.totallyOdd_trivial_Five. -/
example : ¬ IsTotallyOddChar (1 : Field.absoluteGaloisGroup ℚ →* (ZMod 5)ˣ) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.totallyOdd_cyclotomic. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    IsTotallyOddChar ((Units.map (PadicInt.toZMod : ℤ_[p] →+* ZMod p).toMonoidHom).comp
      (cyclotomicCharacter ℚ p)) := by
  sorry

/-- Unit test: TauCeti.GaloisRep.totallyOdd_reduced_charTwo. The second clause produces an
actual character, with kernel cutting out ℚ(i), over the nonreduced coefficient ring. -/
example :
    (∀ {A : Type} [CommRing A] [IsReduced A], (2 : A) = 0 →
      ∀ μ : Field.absoluteGaloisGroup ℚ →* Aˣ, IsTotallyOddChar μ) ∧
    ∃ μ : Field.absoluteGaloisGroup ℚ →* (DualNumber (ZMod 2))ˣ,
      μ.ker = ((IntermediateField.adjoin ℚ
        {x : AlgebraicClosure ℚ | x ^ 2 = -1}).fixingSubgroup :
          Subgroup (Field.absoluteGaloisGroup ℚ)) ∧
      ¬ IsTotallyOddChar μ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.totallyOdd_every_real_place. The quadratic character of
F(√x)/F, where F=ℚ(√2), has different signs at its two real places. -/
example (x : F) (hx : x ^ 2 = 2) (hF : Module.finrank ℚ F = 2) :
    ∃ μ : Field.absoluteGaloisGroup F →* (ZMod 3)ˣ,
      μ.ker = ((IntermediateField.adjoin F
        {a : AlgebraicClosure F | a ^ 2 = algebraMap F (AlgebraicClosure F) x}).fixingSubgroup :
          Subgroup (Field.absoluteGaloisGroup F)) ∧
      (∃ (v : InfinitePlace F) (hv : v.IsReal), μ (complexConjugation F v hv) = 1) ∧
      (∃ (w : InfinitePlace F) (hw : w.IsReal), μ (complexConjugation F w hw) = -1) ∧
      ¬ IsTotallyOddChar μ := by
  sorry

/-- Unit test: TauCeti.GaloisRep.totallyOdd_no_real_place. -/
example (hF : ∀ v : InfinitePlace F, ¬ v.IsReal)
    (μ : Field.absoluteGaloisGroup F →* Aˣ) : IsTotallyOddChar μ := by
  sorry
end TotallyOddAPI
end GaloisRep

namespace GL2Cartan
section LineAPI
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

theorem mem_split_iff (D₁ D₂ : Submodule k V) (g : LinearMap.GeneralLinearGroup k V) :
    g ∈ split D₁ D₂ ↔ D₁.map (g : Module.End k V) = D₁ ∧
      D₂.map (g : Module.End k V) = D₂ := by
  sorry

theorem split_comm (D₁ D₂ : Submodule k V) : split D₁ D₂ = split D₂ D₁ := by
  sorry

def splitEquivUnits (b : Module.Basis (Fin 2) k V) :
    split (Submodule.span k {b 0}) (Submodule.span k {b 1}) ≃* kˣ × kˣ := sorry

theorem split_diagonalTorus (b : Module.Basis (Fin 2) k V) :
    (TauCeti.diagonalTorus k 2).map (Matrix.GeneralLinearGroup.toLin' b).toMonoidHom =
      split (Submodule.span k {b 0}) (Submodule.span k {b 1}) := by
  sorry

theorem split_conj (D₁ D₂ : Submodule k V) (g : LinearMap.GeneralLinearGroup k V) :
    (split D₁ D₂).map (MulAut.conj g).toMonoidHom =
      split (D₁.map (g : Module.End k V)) (D₂.map (g : Module.End k V)) := by
  sorry

theorem mem_halfSplit_iff (D₁ D₂ : Submodule k V) (g : LinearMap.GeneralLinearGroup k V) :
    g ∈ halfSplit D₁ D₂ ↔ D₁.map (g : Module.End k V) = D₁ ∧
      ∀ x ∈ D₂, (g : Module.End k V) x = x := by
  sorry

theorem halfSplit_le_split (b : Module.Basis (Fin 2) k V) :
    halfSplit (Submodule.span k {b 0}) (Submodule.span k {b 1}) ≤
      split (Submodule.span k {b 0}) (Submodule.span k {b 1}) := by
  sorry

def halfSplitEquivUnits (b : Module.Basis (Fin 2) k V) :
    halfSplit (Submodule.span k {b 0}) (Submodule.span k {b 1}) ≃* kˣ := sorry

theorem halfSplit_sup_center (b : Module.Basis (Fin 2) k V) :
    halfSplit (Submodule.span k {b 0}) (Submodule.span k {b 1}) ⊔
      Subgroup.center (LinearMap.GeneralLinearGroup k V) =
        split (Submodule.span k {b 0}) (Submodule.span k {b 1}) := by
  sorry

theorem halfSplit_unique_split [Finite k] (hq : 3 ≤ Nat.card k)
    (b : Module.Basis (Fin 2) k V) (D₁ D₂ : Submodule k V)
    (h₁ : Module.finrank k D₁ = 1) (h₂ : Module.finrank k D₂ = 1) (hne : D₁ ≠ D₂)
    (h : halfSplit (Submodule.span k {b 0}) (Submodule.span k {b 1}) ≤ split D₁ D₂) :
    split D₁ D₂ = split (Submodule.span k {b 0}) (Submodule.span k {b 1}) := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.split_card_Five. -/
example (b : Module.Basis (Fin 2) (ZMod 5) (Fin 2 → ZMod 5)) :
    let C := split (k := ZMod 5) (Submodule.span (ZMod 5) {b 0}) (Submodule.span (ZMod 5) {b 1})
    Nat.card C = 16 ∧ Nat.card (Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod 5) (Fin 2 → ZMod 5)))) = 32 := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.split_diagonal_baseline. -/
example :
    (TauCeti.diagonalTorus k 2).map Matrix.GeneralLinearGroup.toLin.toMonoidHom =
      split (Submodule.span k {(Pi.single 0 1 : Fin 2 → k)})
        (Submodule.span k {(Pi.single 1 1 : Fin 2 → k)}) := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.swap_not_mem_split. -/
example :
    let C := split (k := ZMod 5) (Submodule.span (ZMod 5) {(Pi.single 0 1 : Fin 2 → ZMod 5)})
      (Submodule.span (ZMod 5) {(Pi.single 1 1 : Fin 2 → ZMod 5)})
    let w := Matrix.GeneralLinearGroup.toLin (TauCeti.permutationGL (k := ZMod 5)
      (Equiv.swap (0 : Fin 2) 1))
    w ∈ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod 5) (Fin 2 → ZMod 5))) ∧ w ∉ C := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.halfSplit_card_Five. -/
example (b : Module.Basis (Fin 2) (ZMod 5) (Fin 2 → ZMod 5)) :
    Nat.card (halfSplit (k := ZMod 5) (Submodule.span (ZMod 5) {b 0})
      (Submodule.span (ZMod 5) {b 1})) = 4 := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.halfSplit_second_axis. -/
example :
    let C' := halfSplit (k := ZMod 5) (Submodule.span (ZMod 5) {(Pi.single 0 1 : Fin 2 → ZMod 5)})
      (Submodule.span (ZMod 5) {(Pi.single 1 1 : Fin 2 → ZMod 5)})
    Matrix.GeneralLinearGroup.toLin (TauCeti.diagGL ![1, Units.mk0 (2 : ZMod 5) (by decide)]) ∉ C' ∧
      Matrix.GeneralLinearGroup.toLin (TauCeti.diagGL ![Units.mk0 (2 : ZMod 5) (by decide), 1]) ∈ C' := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.halfSplit_det_baseline. -/
example (a : kˣ) : Matrix.GeneralLinearGroup.det (TauCeti.diagGL ![a, 1]) = a := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.halfSplit_q_two. -/
example :
    let D₀ := Submodule.span (ZMod 2) {(Pi.single 0 1 : Fin 2 → ZMod 2)}
    let D₁ := Submodule.span (ZMod 2) {(Pi.single 1 1 : Fin 2 → ZMod 2)}
    let D₂ := Submodule.span (ZMod 2) {(![1, 1] : Fin 2 → ZMod 2)}
    halfSplit D₀ D₁ = ⊥ ∧ halfSplit D₀ D₂ = ⊥ ∧ D₁ ≠ D₂ := by
  sorry
end LineAPI

section NonsplitAPI
variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V]

theorem mem_nonsplit_iff (E : Subalgebra k (Module.End k V)) (hE : IsField E)
    (g : LinearMap.GeneralLinearGroup k V) :
    g ∈ nonsplit E ↔ (g : Module.End k V) ∈ E ∧ (g : Module.End k V) ≠ 0 := by
  sorry

def nonsplitEquivUnits (E : Subalgebra k (Module.End k V)) : Eˣ ≃* nonsplit E := sorry

theorem nonsplit_GL2NonSplitTorus {E : Type*} [Field E] [Algebra k E]
    (hE : Module.finrank k E = 2) :
    (nonsplit (Algebra.lmul k E).range).map
        (Matrix.GeneralLinearGroup.toLin' (TauCeti.nonSplitTorusBasis k E hE)).symm.toMonoidHom =
      TauCeti.GL2NonSplitTorus k E hE := by
  sorry

theorem nonsplit_trace_det {E : Type*} [Field E] [Algebra k E]
    (hE : Module.finrank k E = 2) (a : Eˣ) :
    Matrix.trace (TauCeti.GL2NonSplitTorusHom k E hE a : Matrix (Fin 2) (Fin 2) k) =
      Algebra.trace k E (a : E) ∧
    (Matrix.GeneralLinearGroup.det (TauCeti.GL2NonSplitTorusHom k E hE a) : k) =
      Algebra.norm k (a : E) := by
  sorry

theorem nonsplit_conj (g : LinearMap.GeneralLinearGroup k V)
    (E E' : Subalgebra k (Module.End k V))
    (h : (E' : Set (Module.End k V)) =
      (fun x => (g : Module.End k V) * x * ((g⁻¹ : LinearMap.GeneralLinearGroup k V) :
        Module.End k V)) '' E) :
    (nonsplit E).map (MulAut.conj g).toMonoidHom = nonsplit E' := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.nonsplit_card_Three. -/
example {E : Type*} [Field E] [Algebra (ZMod 3) E] (hE : Module.finrank (ZMod 3) E = 2) :
    Nat.card (TauCeti.GL2NonSplitTorus (ZMod 3) E hE) = 8 ∧
      Nat.card (Subgroup.normalizer (TauCeti.GL2NonSplitTorus (ZMod 3) E hE : Set (Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)))) = 16 := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.nonsplit_card_Two. -/
example {E : Type*} [Field E] [Algebra (ZMod 2) E] (hE : Module.finrank (ZMod 2) E = 2) :
    Nat.card (TauCeti.GL2NonSplitTorus (ZMod 2) E hE) = 3 ∧
      Subgroup.normalizer (TauCeti.GL2NonSplitTorus (ZMod 2) E hE : Set (Matrix.GeneralLinearGroup (Fin 2) (ZMod 2))) = ⊤ ∧
      Nat.card (Subgroup.normalizer (TauCeti.GL2NonSplitTorus (ZMod 2) E hE : Set (Matrix.GeneralLinearGroup (Fin 2) (ZMod 2)))) = 6 := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.nonsplit_eq_GL2NonSplitTorus. -/
example {E : Type*} [Field E] [Algebra k E] (hE : Module.finrank k E = 2) :
    (nonsplit (Algebra.lmul k E).range).map
        (Matrix.GeneralLinearGroup.toLin' (TauCeti.nonSplitTorusBasis k E hE)).symm.toMonoidHom =
      TauCeti.GL2NonSplitTorus k E hE := by
  sorry

/-- Unit test: TauCeti.GL2Cartan.nonsplit_no_rational_line. -/
example {E : Type*} [Field E] [Algebra (ZMod 3) E] (hE : Module.finrank (ZMod 3) E = 2) :
    ¬ ∃ D : Submodule (ZMod 3) E, Module.finrank (ZMod 3) D = 1 ∧
      ∀ g ∈ nonsplit (Algebra.lmul (ZMod 3) E).range,
        D.map (g : Module.End (ZMod 3) E) = D := by
  sorry
end NonsplitAPI
end GL2Cartan

namespace GL2Subgroup
open Matrix
variable {k : Type*} [Field k]

def projectiveTraceField (G : Subgroup (GL (Fin 2) k)) : Subfield k :=
  Subfield.closure (Set.range fun g : G =>
    Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) ^ 2 /
      Matrix.det ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k))

theorem projectiveTraceField_le_iff (G : Subgroup (GL (Fin 2) k)) (E : Subfield k) :
    projectiveTraceField G ≤ E ↔ ∀ g ∈ G,
      Matrix.trace (g : Matrix (Fin 2) (Fin 2) k) ^ 2 /
        Matrix.det (g : Matrix (Fin 2) (Fin 2) k) ∈ E := by
  sorry

theorem projectiveTraceField_conj (G : Subgroup (GL (Fin 2) k)) (x : GL (Fin 2) k) :
    projectiveTraceField (G.map (MulAut.conj x).toMonoidHom) = projectiveTraceField G := by
  sorry

theorem projectiveTraceField_scalars (G : Subgroup (GL (Fin 2) k)) :
    projectiveTraceField (G ⊔ (GeneralLinearGroup.scalar (Fin 2)).range) =
      projectiveTraceField G := by
  sorry

theorem projectiveTraceField_map {k' : Type*} [Field k'] (f : k →+* k')
    (G : Subgroup (GL (Fin 2) k)) :
    projectiveTraceField (G.map (GeneralLinearGroup.map f)) = (projectiveTraceField G).map f := by
  sorry

theorem projectiveTraceField_standard (E : Subfield k) [Finite E] (hE : 4 ≤ Nat.card E) :
    projectiveTraceField ((SpecialLinearGroup.map E.subtype).range.map
        SpecialLinearGroup.toGL) = E ∧
      projectiveTraceField (GeneralLinearGroup.map E.subtype).range = E := by
  sorry

/-- Unit test: TauCeti.GL2Subgroup.projectiveTraceField_scalar. -/
example : projectiveTraceField (GeneralLinearGroup.scalar (Fin 2) : kˣ →* _).range = ⊥ := by
  sorry

/-- Unit test: TauCeti.GL2Subgroup.projectiveTraceField_Four_in_Sixteen. -/
example [Finite k] (hk : Nat.card k = 16) (E : Subfield k) (hE : Nat.card E = 4) :
    projectiveTraceField ((SpecialLinearGroup.map E.subtype).range.map
      SpecialLinearGroup.toGL) = E := by
  sorry

/-- Unit test: TauCeti.GL2Subgroup.projectiveTraceField_conjugated_subfield. -/
example [Finite k] (hk : Nat.card k = 16) (E : Subfield k) (hE : Nat.card E = 4)
    (x : GL (Fin 2) k) :
    projectiveTraceField (((SpecialLinearGroup.map E.subtype).range.map
      SpecialLinearGroup.toGL).map (MulAut.conj x).toMonoidHom) = E := by
  sorry

/-- Unit test: TauCeti.GL2Subgroup.projectiveTraceField_scalar_trace_ratio. -/
example (c : kˣ) (g : GL (Fin 2) k) :
    Matrix.trace (((GeneralLinearGroup.scalar (Fin 2) c) * g : GL (Fin 2) k) :
        Matrix (Fin 2) (Fin 2) k) ^ 2 /
      Matrix.det (((GeneralLinearGroup.scalar (Fin 2) c) * g : GL (Fin 2) k) :
        Matrix (Fin 2) (Fin 2) k) =
      Matrix.trace (g : Matrix (Fin 2) (Fin 2) k) ^ 2 /
        Matrix.det (g : Matrix (Fin 2) (Fin 2) k) := by
  sorry
end GL2Subgroup

namespace GaloisRep
section SquareFieldAPI
variable {F : Type*} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)

theorem cyclotomicSquareSubfield_le :
    cyclotomicSquareSubfield F p ≤ cyclotomicSubfield F p := by
  sorry

theorem cyclotomicSquareSubfield_degree :
    (Odd (Module.finrank F (cyclotomicSubfield F p)) →
      cyclotomicSquareSubfield F p = ⊥) ∧
    (Even (Module.finrank F (cyclotomicSubfield F p)) →
      Module.finrank F (cyclotomicSquareSubfield F p) = 2) := by
  sorry

theorem cyclotomicSquareSubfield_unique (E : IntermediateField F (AlgebraicClosure F))
    (hE : E ≤ cyclotomicSubfield F p) (hdeg : Module.finrank F E = 2) :
    E = cyclotomicSquareSubfield F p := by
  sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicSquareSubfield_rat_three. -/
example : cyclotomicSquareSubfield ℚ 3 = cyclotomicSubfield ℚ 3 ∧
    cyclotomicSquareSubfield ℚ 3 = IntermediateField.adjoin ℚ
      {x : AlgebraicClosure ℚ | x ^ 2 = -3} := by
  sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicSquareSubfield_rat_five. -/
example : cyclotomicSquareSubfield ℚ 5 = IntermediateField.adjoin ℚ
    {x : AlgebraicClosure ℚ | x ^ 2 = 5} ∧
      Module.finrank ℚ (cyclotomicSquareSubfield ℚ 5) = 2 ∧
      Module.finrank ℚ (cyclotomicSubfield ℚ 5) = 4 ∧
      cyclotomicSquareSubfield ℚ 5 < cyclotomicSubfield ℚ 5 := by
  sorry

/-- Unit test: TauCeti.GaloisRep.cyclotomicSquareSubfield_odd_degree. -/
example (h : Odd (Module.finrank F (cyclotomicSubfield F p))) :
    cyclotomicSquareSubfield F p = ⊥ := by
  sorry
end SquareFieldAPI
end GaloisRep

/-! ## The two previously missing proofs and the explicit niveau-two witness -/

namespace GL2Subgroup
open Matrix

/-- ArithmeticGaloisRepresentations:R01.4/semilinear-projective-automorphisms.
The formula is tested on the embedded PSL, so both factors are uniquely determined in PGL. -/
theorem automorphisms_PSL2_semilinear {k : Type*} [Field k] [Finite k]
    (hq : 4 ≤ Nat.card k) (φ : MulAut (ProjectiveSpecialLinearGroup (Fin 2) k)) :
    ∃! f : ProjGenLinGroup (Fin 2) k × (k ≃+* k),
      ∀ g : ProjectiveSpecialLinearGroup (Fin 2) k,
        ProjectiveSpecialLinearGroup.toPGL (φ g) =
          f.1 * ProjGenLinGroup.map f.2.toRingHom
            (ProjectiveSpecialLinearGroup.toPGL g) * f.1⁻¹ := by
  sorry

theorem automorphisms_PGL2_semilinear {k : Type*} [Field k] [Finite k]
    (hq : 4 ≤ Nat.card k) (φ : MulAut (ProjGenLinGroup (Fin 2) k)) :
    ∃! f : ProjGenLinGroup (Fin 2) k × (k ≃+* k),
      ∀ g : ProjGenLinGroup (Fin 2) k,
        φ g = f.1 * ProjGenLinGroup.map f.2.toRingHom g * f.1⁻¹ := by
  sorry

/-- Restriction to the characteristic derived PSL subgroup is bijective. -/
theorem automorphisms_PGL2_restrict {k : Type*} [Field k] [Finite k]
    (hq : 4 ≤ Nat.card k) :
    ∀ φ : MulAut (ProjectiveSpecialLinearGroup (Fin 2) k),
      ∃! ψ : MulAut (ProjGenLinGroup (Fin 2) k),
        ∀ g, ψ (ProjectiveSpecialLinearGroup.toPGL g) =
          ProjectiveSpecialLinearGroup.toPGL (φ g) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/characteristic-two-matrix-cocycles.
This is exactly the cocycle/coboundary statement for the conjugation module M₂(k).
The reader gives the all-q torus, root-group and odd-index averaging argument. -/
theorem matrix_cocycle_is_coboundary_charTwo {k₀ k : Type*}
    [Field k₀] [Finite k₀] [CharP k₀ 2] [Field k] [Algebra k₀ k]
    (hq : 4 ≤ Nat.card k₀)
    (f : SpecialLinearGroup (Fin 2) k₀ → Matrix (Fin 2) (Fin 2) k)
    (hf : ∀ g h, f (g * h) = f g +
      (g : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) * f h *
        (g⁻¹ : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k)) :
    ∃ X : Matrix (Fin 2) (Fin 2) k, ∀ g, f g =
      (g : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) * X *
        (g⁻¹ : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) - X := by
  sorry

/-- The quotient Ad/Z has no fixed vector: saying that every conjugation difference is
scalar forces X itself to be scalar. This avoids an unspecified quotient action. -/
theorem matrix_mod_scalars_invariants_charTwo {k₀ k : Type*}
    [Field k₀] [Finite k₀] [CharP k₀ 2] [Field k] [Algebra k₀ k]
    (hq : 4 ≤ Nat.card k₀) (X : Matrix (Fin 2) (Fin 2) k)
    (hX : ∀ g : SpecialLinearGroup (Fin 2) k₀, ∃ a : k,
      (g : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) * X *
        (g⁻¹ : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) - X = Matrix.scalar (Fin 2) a) :
    ∃ a : k, X = Matrix.scalar (Fin 2) a := by
  sorry

/-- On trace-zero matrices in characteristic two, (X₀₁,X₁₀) has scalar kernel and is onto.
For g=[[a,b],[c,d]], its quotient action is [[a²,b²],[c²,d²]], the Frobenius-twisted
natural module. Perfectness implies every one-dimensional representation is trivial. -/
theorem traceZero_quotient_frobenius_charTwo {k₀ k : Type*}
    [Field k₀] [Finite k₀] [CharP k₀ 2] [Field k] [Algebra k₀ k]
    (hq : 4 ≤ Nat.card k₀) :
    (∀ x y : k, ∃ X : Matrix (Fin 2) (Fin 2) k,
      Matrix.trace X = 0 ∧ X 0 1 = x ∧ X 1 0 = y) ∧
    (∀ X : Matrix (Fin 2) (Fin 2) k, Matrix.trace X = 0 →
      (X 0 1 = 0 ∧ X 1 0 = 0 ↔ ∃ a : k, X = Matrix.scalar (Fin 2) a)) ∧
    (∀ (g : SpecialLinearGroup (Fin 2) k₀) (X : Matrix (Fin 2) (Fin 2) k),
      Matrix.trace X = 0 →
        let Y := (g : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k) * X *
          (g⁻¹ : Matrix (Fin 2) (Fin 2) k₀).map (algebraMap k₀ k)
        Y 0 1 = (algebraMap k₀ k (g 0 0)) ^ 2 * X 0 1 +
          (algebraMap k₀ k (g 0 1)) ^ 2 * X 1 0 ∧
        Y 1 0 = (algebraMap k₀ k (g 1 0)) ^ 2 * X 0 1 +
          (algebraMap k₀ k (g 1 1)) ^ 2 * X 1 0) ∧
    (∀ χ : SpecialLinearGroup (Fin 2) k₀ →* kˣ, χ = 1) := by
  sorry
end GL2Subgroup

namespace GaloisRep

/-- ArithmeticGaloisRepresentations:R01.4/niveau-two-bad-dihedral-witness.
Existence of an actual Galois representation with the specified polynomial kernel field,
not an assumption that a representation with this image has already been supplied. -/
theorem exists_niveauTwo_badDihedral_three
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[3])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[3])] :
    ∃ ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 3) (Fin 2 → ZMod 3),
      ρ.toRepresentation.ker = ((IntermediateField.adjoin ℚ
        ((X ^ 4 + 3 : Polynomial ℚ).rootSet (AlgebraicClosure ℚ))).fixingSubgroup :
          Subgroup (Field.absoluteGaloisGroup ℚ)) ∧
      Nat.card ρ.toRepresentation.toHomUnits.range = 8 ∧
      IsOdd ρ ∧ IsBadDihedral 3 ρ ∧
      (∃ σ ∈ inertiaGroup ℚ_[3],
        ρ (localEmbeddingMap ℚ ℚ_[3] σ) = Matrix.toLin' !![0, -1; 1, 0]) ∧
      (∀ σ ∈ inertiaGroup ℚ_[3], ∃ n : ℕ,
        ρ (localEmbeddingMap ℚ ℚ_[3] σ) =
          Matrix.toLin' ((!![0, -1; 1, 0] : Matrix (Fin 2) (Fin 2) (ZMod 3)) ^ n)) ∧
      Nat.card ((((inertiaGroup ℚ_[3]).map (localEmbeddingMap ℚ ℚ_[3]).toMonoidHom).map
        ρ.toRepresentation.toHomUnits).map
          (QuotientGroup.mk' (Subgroup.center
            (LinearMap.GeneralLinearGroup (ZMod 3) (Fin 2 → ZMod 3))))) = 2 := by
  sorry

/-- Matrix part of the acceptance example, including the span criterion and the diagonal
subgroup over ℚ(√−3). The reader supplies the number-field and local ramification arguments. -/
example :
    let R : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![0, -1; 1, 0]
    let S : Matrix (Fin 2) (Fin 2) (ZMod 3) := Matrix.diagonal ![1, -1]
    R ^ 4 = 1 ∧ S ^ 2 = 1 ∧ S * R * S = R ^ 3 ∧
      Matrix.det (R ^ 3 * S) = -1 ∧
      Submodule.span (ZMod 3) {1, R, S, R * S} = ⊤ ∧
      Matrix.IsDiag (R ^ 2) ∧ Matrix.IsDiag S := by
  sorry
end GaloisRep

/-! ## Typed clauses retained from the accepted principal targets -/

namespace GL2Cartan
theorem mem_normalizer_nonsplit_semilinear {k : Type*} [Field k] [Finite k]
    {V : Type*} [AddCommGroup V] [Module k V] (hV : Module.finrank k V = 2)
    (E : Subalgebra k (Module.End k V)) (hE : IsField E) (hdeg : Module.finrank k E = 2)
    (g : LinearMap.GeneralLinearGroup k V) :
    g ∈ Subgroup.normalizer (nonsplit E : Set (LinearMap.GeneralLinearGroup k V)) ↔
      (∀ (a : E) (x : V), g.val (a.val x) = a.val (g.val x)) ∨
      (∀ (a : E) (x : V), g.val (a.val x) = (a.val ^ Nat.card k) (g.val x)) := by
  sorry

theorem trace_eq_zero_of_mem_normalizer_not_mem {k : Type*} [Field k] [Finite k]
    {V : Type*} [AddCommGroup V] [Module k V] (hV : Module.finrank k V = 2)
    (C : Subgroup (LinearMap.GeneralLinearGroup k V)) (hC : IsCartan C)
    (hCq : 3 ≤ Nat.card k ∨ ∃ E : Subalgebra k (Module.End k V),
      IsField E ∧ Module.finrank k E = 2 ∧ C = nonsplit E)
    (g : LinearMap.GeneralLinearGroup k V)
    (hg : g ∈ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup k V))) (hgc : g ∉ C) :
    LinearMap.trace k V g.val = 0 ∧ ∃ a : k, g.val ^ 2 = algebraMap k (Module.End k V) a := by
  sorry
end GL2Cartan

namespace GL2Subgroup
open Matrix

/-- ArithmeticGaloisRepresentations:R01.4/rational-lines-of-a-split-nonscalar-element.
The non-scalar split operator can have distinct eigenvalues or a single Jordan line. -/
theorem stable_lines_rational_of_split_nonscalar {Γ k : Type*} [Group Γ] [Field k]
    (ρ : Γ →* GL (Fin 2) k) (g : Γ)
    (hns : ∀ a : k, (ρ g : Matrix (Fin 2) (Fin 2) k) ≠ Matrix.scalar (Fin 2) a)
    (hsplit : (ρ g : Matrix (Fin 2) (Fin 2) k).charpoly.Splits)
    {L : Type*} [Field L] [Algebra k L] (D : Submodule L (Fin 2 → L))
    (hD : Module.finrank L D = 1)
    (hstable : ∀ s : Γ, D.map (Matrix.toLin'
      ((ρ s : Matrix (Fin 2) (Fin 2) k).map (algebraMap k L))) = D) :
    ∃ v : Fin 2 → k, v ≠ 0 ∧
      D = Submodule.span L {fun i => algebraMap k L (v i)} := by
  sorry

/-- Dickson's full projective classification, including the point-fixing alternative. -/
theorem dickson_all_projective_subgroups {p : ℕ} [Fact p.Prime]
    {K : Type*} [Field K] [IsAlgClosed K] [CharP K p]
    (H : Subgroup (ProjGenLinGroup (Fin 2) K)) [Finite H] :
    (∃ D : Submodule K (Fin 2 → K), Module.finrank K D = 1 ∧
      ∀ g : GL (Fin 2) K, ProjGenLinGroup.mk g ∈ H →
        D.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) K)) = D) ∨
    (∃ E : Subfield K, Finite E ∧ ∃ x : ProjGenLinGroup (Fin 2) K,
      H = ((SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toPGL).map
        (MulAut.conj x).toMonoidHom ∨
      H = ((GeneralLinearGroup.map E.subtype).range.map ProjGenLinGroup.mk).map
        (MulAut.conj x).toMonoidHom) ∨
    (∃ n : ℕ, 2 ≤ n ∧ ¬ p ∣ n ∧ Nonempty (H ≃* DihedralGroup n)) ∨
      Nonempty (H ≃* alternatingGroup (Fin 4)) ∨
      Nonempty (H ≃* Equiv.Perm (Fin 4)) ∨ Nonempty (H ≃* alternatingGroup (Fin 5)) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/conjugacy-of-standard-projective-images. -/
theorem standard_projective_images_conjugate {K : Type*} [Field K] [IsAlgClosed K]
    (E : Subfield K) [Finite E] (hq : 4 ≤ Nat.card E)
    (H : Subgroup (ProjGenLinGroup (Fin 2) K)) :
    (Nonempty (H ≃* ProjectiveSpecialLinearGroup (Fin 2) E) →
      ∃ x : ProjGenLinGroup (Fin 2) K,
        H = ((SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toPGL).map
          (MulAut.conj x).toMonoidHom) ∧
    (Nonempty (H ≃* ProjGenLinGroup (Fin 2) E) →
      ∃ x : ProjGenLinGroup (Fin 2) K,
        H = ((GeneralLinearGroup.map E.subtype).range.map ProjGenLinGroup.mk).map
          (MulAut.conj x).toMonoidHom) := by
  sorry

/-- The small A5 identifications in characteristics two and five are not disjoint cases. -/
theorem icosahedral_standard_image {p : ℕ} [Fact p.Prime]
    {K : Type*} [Field K] [IsAlgClosed K] [CharP K p]
    (hp : p = 2 ∨ p = 5) (E : Subfield K) [Finite E]
    (hE : Nat.card E = if p = 2 then 4 else 5)
    (H : Subgroup (ProjGenLinGroup (Fin 2) K))
    (hH : Nonempty (H ≃* alternatingGroup (Fin 5))) :
    ∃ x : ProjGenLinGroup (Fin 2) K,
      H = ((SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toPGL).map
        (MulAut.conj x).toMonoidHom := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/linear-image-over-the-projective-trace-field.
The conjugacy is in GL(K); scalar enlargement is a subgroup supremum. -/
theorem linear_image_over_subfield {K : Type*} [Field K] [IsAlgClosed K]
    (G : Subgroup (GL (Fin 2) K)) [Finite G]
    (E : Subfield K) [Finite E] (hq : 4 ≤ Nat.card E)
    (hstd : G.map ProjGenLinGroup.mk =
      (SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toPGL ∨
      G.map ProjGenLinGroup.mk = (GeneralLinearGroup.map E.subtype).range.map ProjGenLinGroup.mk) :
    (commutator G).map G.subtype =
      (SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toGL ∧
    G ≤ (GeneralLinearGroup.scalar (Fin 2)).range ⊔ (GeneralLinearGroup.map E.subtype).range := by
  sorry

/-- The converse standard-image assertion, with a possibly larger coefficient field. -/
theorem standard_projective_image_of_SL2_le {K : Type*} [Field K] [IsAlgClosed K]
    (G : Subgroup (GL (Fin 2) K)) [Finite G] (E : Subfield K) [Finite E]
    (hq : 4 ≤ Nat.card E)
    (hE : (SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toGL ≤ G) :
    ∃ E' : Subfield K, Finite E' ∧ E ≤ E' ∧ ∃ x : ProjGenLinGroup (Fin 2) K,
      G.map ProjGenLinGroup.mk =
        ((SpecialLinearGroup.map E'.subtype).range.map SpecialLinearGroup.toPGL).map
          (MulAut.conj x).toMonoidHom ∨
      G.map ProjGenLinGroup.mk =
        ((GeneralLinearGroup.map E'.subtype).range.map ProjGenLinGroup.mk).map
          (MulAut.conj x).toMonoidHom := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/dyadic-solvable-projective-image. -/
theorem dyadic_solvable_image_dihedral {K : Type*} [Field K] [IsAlgClosed K] [CharP K 2]
    (G : Subgroup (GL (Fin 2) K)) [Finite G] (hsol : Group.IsSolvable G)
    (hirr : Submodule.span K (Set.range fun g : G =>
      (g.val : Matrix (Fin 2) (Fin 2) K)) = ⊤) :
    ∃ n : ℕ, 3 ≤ n ∧ Odd n ∧ Nonempty (G.map ProjGenLinGroup.mk ≃* DihedralGroup n) := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/dyadic-nonsolvable-projective-image. -/
theorem dyadic_nonsolvable_image_standard {K : Type*} [Field K] [IsAlgClosed K] [CharP K 2]
    (G : Subgroup (GL (Fin 2) K)) [Finite G] (hsol : ¬ Group.IsSolvable G)
    (hirr : Submodule.span K (Set.range fun g : G =>
      (g.val : Matrix (Fin 2) (Fin 2) K)) = ⊤) :
    ∃ E : Subfield K, Finite E ∧ 4 ≤ Nat.card E ∧ ∃ x : ProjGenLinGroup (Fin 2) K,
      G.map ProjGenLinGroup.mk =
        ((SpecialLinearGroup.map E.subtype).range.map SpecialLinearGroup.toPGL).map
          (MulAut.conj x).toMonoidHom := by
  sorry

/-- ArithmeticGaloisRepresentations:R01.4/large-order-projective-image-criterion. -/
theorem large_projective_order_criterion {p : ℕ} [Fact p.Prime]
    {K : Type*} [Field K] [IsAlgClosed K] [CharP K p] [Algebra (ZMod p) K]
    (G : Subgroup (GL (Fin 2) K)) [Finite G]
    (hirr : Submodule.span K (Set.range fun g : G =>
      (g.val : Matrix (Fin 2) (Fin 2) K)) = ⊤)
    (horder : ∃ g ∈ G, 5 < orderOf (ProjGenLinGroup.mk g)) :
    (Group.IsSolvable G → ∃ n : ℕ, 2 ≤ n ∧ Nonempty (G.map ProjGenLinGroup.mk ≃* DihedralGroup n)) ∧
    ((¬ ∃ D₁ D₂ : Submodule K (Fin 2 → K), Module.finrank K D₁ = 1 ∧
      Module.finrank K D₂ = 1 ∧ D₁ ≠ D₂ ∧
      G.map GeneralLinearGroup.toLin.toMonoidHom ≤ Subgroup.normalizer
        (GL2Cartan.split D₁ D₂ : Set (LinearMap.GeneralLinearGroup K (Fin 2 → K)))) →
      ∃ x : GL (Fin 2) K,
        ((SpecialLinearGroup.toGL.comp
          (SpecialLinearGroup.map (algebraMap (ZMod p) K))).range.map
            (MulAut.conj x).toMonoidHom) ≤ G) := by
  sorry

/-- Prime-field semisimplicity adds the split-Cartan conclusion in the reducible case. -/
theorem semisimple_prime_field_reducible {ℓ : ℕ} [Fact ℓ.Prime]
    {V : Type*} [AddCommGroup V] [Module (ZMod ℓ) V]
    (hV : Module.finrank (ZMod ℓ) V = 2)
    (G : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V))
    (hss : ∀ D : Submodule (ZMod ℓ) V,
      (∀ g ∈ G, D.map (g : Module.End (ZMod ℓ) V) = D) →
        ∃ D' : Submodule (ZMod ℓ) V, IsCompl D D' ∧
          ∀ g ∈ G, D'.map (g : Module.End (ZMod ℓ) V) = D')
    (hred : ∃ D : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D = 1 ∧
      ∀ g ∈ G, D.map (g : Module.End (ZMod ℓ) V) = D) :
    ∃ D₁ D₂ : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D₁ = 1 ∧
      Module.finrank (ZMod ℓ) D₂ = 1 ∧ D₁ ≠ D₂ ∧ G ≤ GL2Cartan.split D₁ D₂ := by
  sorry

/-- Serre Proposition 17, with the split exception at ℓ=5. -/
theorem serre_prop17 {ℓ : ℕ} [Fact ℓ.Prime]
    {V : Type*} [AddCommGroup V] [Module (ZMod ℓ) V]
    (hV : Module.finrank (ZMod ℓ) V = 2)
    (G : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V))
    (hcontains :
      (∃ E : Subalgebra (ZMod ℓ) (Module.End (ZMod ℓ) V), IsField E ∧
        Module.finrank (ZMod ℓ) E = 2 ∧ GL2Cartan.nonsplit E ≤ G) ∨
      (ℓ ≠ 5 ∧ ∃ D₁ D₂ : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D₁ = 1 ∧
        Module.finrank (ZMod ℓ) D₂ = 1 ∧ D₁ ≠ D₂ ∧ GL2Cartan.halfSplit D₁ D₂ ≤ G)) :
    G = ⊤ ∨
      (∃ D : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D = 1 ∧
        ∀ g ∈ G, D.map (g : Module.End (ZMod ℓ) V) = D) ∨
      ∃ C : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V), GL2Cartan.IsCartan C ∧
        G ≤ Subgroup.normalizer (C : Set (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) := by
  sorry

theorem serre_prop18 {ℓ : ℕ} [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    {V : Type*} [AddCommGroup V] [Module (ZMod ℓ) V]
    (hV : Module.finrank (ZMod ℓ) V = 2)
    (G : Subgroup (LinearMap.GeneralLinearGroup (ZMod ℓ) V)) (hGn : G.Normal)
    (hcontains :
      (∃ E : Subalgebra (ZMod ℓ) (Module.End (ZMod ℓ) V), IsField E ∧
        Module.finrank (ZMod ℓ) E = 2 ∧ GL2Cartan.nonsplit E ≤ G) ∨
      (∃ D₁ D₂ : Submodule (ZMod ℓ) V, Module.finrank (ZMod ℓ) D₁ = 1 ∧
        Module.finrank (ZMod ℓ) D₂ = 1 ∧ D₁ ≠ D₂ ∧ GL2Cartan.halfSplit D₁ D₂ ≤ G)) :
    G = ⊤ := by
  sorry

/-- Normal p-subgroup and normal Sylow consequences of the unique fixed line. -/
theorem normal_p_subgroup_reducible {p : ℕ} [Fact p.Prime]
    {k : Type*} [Field k] [CharP k p]
    {V : Type*} [AddCommGroup V] [Module k V] (hV : Module.finrank k V = 2)
    (G P : Subgroup (LinearMap.GeneralLinearGroup k V)) [Finite P]
    (hP : IsPGroup p P) (hne : P ≠ ⊥) (hle : P ≤ G)
    (hN : ∀ g ∈ G, P.map (MulAut.conj g).toMonoidHom = P) :
    ∃! D : Submodule k V, Module.finrank k D = 1 ∧
      (∀ g ∈ G, D.map (g : Module.End k V) = D) ∧
      (∀ g ∈ P, ∀ x ∈ D, (g : Module.End k V) x = x) := by
  sorry

theorem reducible_subgroup_normal_sylow {p : ℕ} [Fact p.Prime]
    {k : Type*} [Field k] [IsAlgClosed k] [CharP k p]
    (G : Subgroup (GL (Fin 2) k)) [Finite G] (hpG : p ∣ Nat.card G)
    (hred : ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
      ∀ g ∈ G, D.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) k)) = D) :
    ∀ P : Sylow p G, (P : Subgroup G).Normal := by
  sorry

theorem sylow_GL2_order {p : ℕ} [Fact p.Prime]
    {k : Type*} [Field k] [Finite k] [CharP k p] (P : Sylow p (GL (Fin 2) k)) :
    Nat.card P = Nat.card k ∧
      Nat.card (Sylow p (GL (Fin 2) k)) = Nat.card k + 1 := by
  sorry

/-- The Sylow count used in Dickson's target, including f=0. -/
theorem dickson_sylow_count {p : ℕ} [Fact p.Prime]
    {k : Type*} [Field k] [Finite k] [CharP k p]
    (n : ℕ) (hn : Nat.card k = p ^ n)
    (H : Subgroup (ProjectiveSpecialLinearGroup (Fin 2) k)) (hpH : p ∣ Nat.card H) :
    ∃ m f : ℕ, 0 < m ∧ m ≤ n ∧
      (∀ P : Sylow p H, Nat.card P = p ^ m) ∧
      Nat.card (Sylow p H) = 1 + f * p ^ m ∧
      (f = 0 → ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
        ∀ g : SpecialLinearGroup (Fin 2) k,
          (QuotientGroup.mk' (Subgroup.center (SpecialLinearGroup (Fin 2) k))) g ∈ H →
            D.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) k)) = D) := by
  sorry

/-- Exact minimal indices, including the six exceptional fields. -/
theorem minimal_index_PSL2 {k : Type*} [Field k] [Finite k] :
    let q := Nat.card k
    let m := if q = 2 then 2 else if q = 3 then 3 else if q = 5 then 5 else
      if q = 7 then 7 else if q = 9 then 6 else if q = 11 then 11 else q + 1
    (∃ H : Subgroup (ProjectiveSpecialLinearGroup (Fin 2) k), H ≠ ⊤ ∧ H.index = m) ∧
      (∀ H : Subgroup (ProjectiveSpecialLinearGroup (Fin 2) k), H ≠ ⊤ → m ≤ H.index) ∧
      (∃ B : Subgroup (ProjectiveSpecialLinearGroup (Fin 2) k), B.index = q + 1) := by
  sorry

theorem index_ge_of_ne_top_SL2 {k : Type*} [Field k] [Finite k]
    (hq4 : 4 ≤ Nat.card k) (hq : Nat.card k ∉ ({5, 7, 9, 11} : Set ℕ))
    (H : Subgroup (SpecialLinearGroup (Fin 2) k)) (hH : H ≠ ⊤) :
    Nat.card k + 1 ≤ H.index := by
  sorry
end GL2Subgroup

/-! ## Remaining normal-subgroup, induction and restriction clauses -/
namespace GL2Subgroup

/-- The normal subgroups of SL₂ and PGL₂ when q≥4. -/
theorem normal_subgroups_SL2_PGL2 {k : Type*} [Field k] [Finite k]
    (hq : 4 ≤ Nat.card k) :
    (∀ N : Subgroup (Matrix.SpecialLinearGroup (Fin 2) k), N.Normal →
      N = ⊥ ∨ N = Subgroup.center _ ∨ N = ⊤) ∧
    (∀ N : Subgroup (Matrix.ProjGenLinGroup (Fin 2) k), N.Normal →
      N = ⊥ ∨ N = (Matrix.SpecialLinearGroup.toGL.comp
        (MonoidHom.id _)).range.map Matrix.ProjGenLinGroup.mk ∨ N = ⊤) := by sorry

/-- Determinant gives the GL₂ abelianization for q≥3. The PGL₂ derived subgroup is PSL₂. -/
theorem abelianizations_GL2_PGL2 {k : Type*} [Field k] [Finite k]
    (hq : 3 ≤ Nat.card k) :
    commutator (GL (Fin 2) k) = Matrix.GeneralLinearGroup.det.ker ∧
    commutator (Matrix.ProjGenLinGroup (Fin 2) k) =
      Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk ∧
    Nonempty (Abelianization (GL (Fin 2) k) ≃* kˣ) ∧
    Nonempty (Abelianization (Matrix.ProjGenLinGroup (Fin 2) k) ≃*
      (kˣ ⧸ Subgroup.closure (Set.range fun a : kˣ => a ^ 2))) := by sorry

/-- Small fields are separate cases; GL₂(F₂) is S₃ and PGL₂(F₃) is S₄. -/
theorem small_fields_GL2 :
    Nonempty (GL (Fin 2) (ZMod 2) ≃* Equiv.Perm (Fin 3)) ∧
    Nonempty (Matrix.ProjGenLinGroup (Fin 2) (ZMod 3) ≃* Equiv.Perm (Fin 4)) ∧
    (∀ N : Subgroup (GL (Fin 2) (ZMod 2)), N.Normal →
      N = ⊥ ∨ N = commutator _ ∨ N = ⊤) ∧
    (∀ N : Subgroup (GL (Fin 2) (ZMod 3)), N.Normal →
      N = ⊥ ∨ N = Subgroup.center _ ∨
      (Nat.card N = 8 ∧ Nonempty (N ≃* QuaternionGroup 2)) ∨
      N = Matrix.SpecialLinearGroup.toGL.range ∨ N = ⊤) := by sorry

/-- Goursat's rank-one consequence: a subdirect product of two copies of a nonabelian
simple group is either the whole product or an automorphism graph. General Goursat
machinery belongs to the existing upstream induction/restriction roadmap. -/
theorem subdirect_simple_pair {S : Type*} [Group S] [Finite S] [IsSimpleGroup S]
    (hnonabelian : ∃ x y : S, x * y ≠ y * x) (H : Subgroup (S × S))
    (h₁ : H.map (MonoidHom.fst S S) = ⊤) (h₂ : H.map (MonoidHom.snd S S) = ⊤) :
    H = ⊤ ∨ ∃ φ : MulAut S, ∀ x y, (x,y) ∈ H ↔ y = φ x := by sorry

/-- Automorphisms of a product of simple rank-one groups have an independent
semilinear automorphism on every factor, followed by a permutation. -/
theorem automorphisms_PSL2_product {k : Type*} [Field k] [Finite k]
    (hq : 4 ≤ Nat.card k) (r : ℕ)
    (φ : MulAut (Fin r → Matrix.ProjectiveSpecialLinearGroup (Fin 2) k)) :
    ∃! z : (Fin r → MulAut (Matrix.ProjectiveSpecialLinearGroup (Fin 2) k)) ×
        Equiv.Perm (Fin r),
      ∀ x i, φ x i = z.1 i (x (z.2.symm i)) := by sorry

/-- A normal p-subgroup of PGL₂ fixes a point whenever it is nontrivial. -/
theorem normal_p_subgroup_PGL2_fixes_point {p : ℕ} [Fact p.Prime]
    {K : Type*} [Field K] [IsAlgClosed K] [CharP K p]
    (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) K)) [Finite H]
    (P : Subgroup H) (hP : P.Normal) (hne : P ≠ ⊥) (hp : IsPGroup p P) :
    ∃ D : Submodule K (Fin 2 → K), Module.finrank K D = 1 ∧
      ∀ g : GL (Fin 2) K, Matrix.ProjGenLinGroup.mk g ∈ H →
        D.map (Matrix.toLin' (g : Matrix (Fin 2) (Fin 2) K)) = D := by sorry
end GL2Subgroup

namespace GaloisRep
/-- Finite-image restriction is exactly restriction to the intersection of kernel fields.
The perfect-field hypothesis lets this prototype use AlgebraicClosure rather than
SeparableClosure; the reader states the separable formulation for arbitrary fields. -/
theorem image_restriction_intersection {F B : Type*} [Field F] [PerfectField F] [Group B]
    (ρ : Field.absoluteGaloisGroup F →* B) [Finite ρ.range]
    (hopen : IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)))
    (K E : IntermediateField F (AlgebraicClosure F))
    [FiniteDimensional F K] [IsGalois F K] [FiniteDimensional F E]
    (hK : K = IntermediateField.fixedField
      (ρ.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F))) :
    ∃ e : (K ≃ₐ[F] K) ≃* ρ.range,
      (∀ σ : Field.absoluteGaloisGroup F,
        (e (AlgEquiv.restrictNormalHom K
          (show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from σ)) : B) = ρ σ) ∧
      (E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).map ρ =
        ((K ⊓ E).fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).map ρ := by sorry

/-- Disjointness from the joint linear-kernel/cyclotomic field preserves both images. -/
theorem images_restriction_cyclotomic_pair {F : Type*} [Field F] [NumberField F]
    {k : Type*} [Field k] [Finite k] [TopologicalSpace k]
    [IsModuleTopology k (Fin 2 → k)]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k (Fin 2 → k)) (p : ℕ)
    (E : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F E]
    (hdisj : (IntermediateField.fixedField
      (ρ.toRepresentation.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)) ⊔
        cyclotomicSubfield F p) ⊓ E = ⊥) :
    (E.fixingSubgroup : Subgroup (Field.absoluteGaloisGroup F)).map
      ρ.toRepresentation.toHomUnits = ρ.toRepresentation.toHomUnits.range ∧
    ((E ⊔ cyclotomicSubfield F p).fixingSubgroup :
      Subgroup (Field.absoluteGaloisGroup F)).map ρ.toRepresentation.toHomUnits =
    ((cyclotomicSubfield F p).fixingSubgroup :
      Subgroup (Field.absoluteGaloisGroup F)).map ρ.toRepresentation.toHomUnits := by sorry

/-- A perfect subgroup survives a normal restriction with soluble quotient. -/
theorem perfect_subgroup_survives_soluble_quotient {Γ B : Type*} [Group Γ] [Group B]
    (N : Subgroup Γ) [N.Normal] [Group.IsSolvable (Γ ⧸ N)] (ρ : Γ →* B)
    (H : Subgroup B) (hH : H ≤ ρ.range) (hperfect : commutator H = ⊤) :
    H ≤ N.map ρ := by sorry

/-- Cyclic quotient criterion in dimension two. No oddness assumption is involved. -/
theorem cyclic_restriction_square_criterion {Γ k : Type*} [Group Γ] [Field k]
    [IsAlgClosed k] (N : Subgroup Γ) [N.Normal] [Finite (Γ ⧸ N)] [IsCyclic (Γ ⧸ N)]
    (ρ : Γ →* GL (Fin 2) k) [Finite ρ.range] :
    let J := (Subgroup.closure (Set.range fun x : Γ ⧸ N => x ^ 2)).comap
      (QuotientGroup.mk' N)
    Submodule.span k {X : Matrix (Fin 2) (Fin 2) k | ∃ g ∈ N, X = ρ g} = ⊤ ↔
      Submodule.span k {X : Matrix (Fin 2) (Fin 2) k | ∃ g ∈ J, X = ρ g} = ⊤ := by sorry

/-- Actual characters and an adapted basis of the index-two induced representation.
Its determinant is the transfer of χ times the permutation sign. -/
theorem induced_character_data {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (Δ : Subgroup Γ) [Δ.FiniteIndex] (hΔ : Δ.index = 2)
    (ρ : Γ →* GL (Fin 2) k) [Finite ρ.range]
    (D : Submodule k (Fin 2 → k)) (hD : Module.finrank k D = 1)
    (hstable : ∀ g ∈ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) = D)
    (hmoved : ∀ g ∉ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D)
    (hnonscalar : ∃ g ∈ Δ, ∀ a, (ρ g : Matrix (Fin 2) (Fin 2) k) ≠ Matrix.scalar (Fin 2) a) :
    ∃ χ χ' : Δ →* kˣ, χ ≠ χ' ∧
      (∃ x : GL (Fin 2) k, ∀ δ : Δ,
        ((x⁻¹ * ρ δ * x : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k) =
          !![(χ δ : k), 0; 0, (χ' δ : k)]) ∧
      (∀ g ∉ Δ, Matrix.trace (ρ g : Matrix (Fin 2) (Fin 2) k) = 0) ∧
      (∃ ε : Γ →* kˣ, (∀ g, ε g = 1 ↔ g ∈ Δ ∨ (2 : k) = 0) ∧
        Matrix.GeneralLinearGroup.det.comp ρ = ε * χ.transfer) := by sorry

/-- Uniqueness of the induction subgroup, with the Klein-four exception. -/
theorem induction_subgroup_count {Γ k : Type*} [Group Γ] [Field k] [IsAlgClosed k]
    (ρ : Γ →* GL (Fin 2) k) [Finite ρ.range] (n : ℕ) (hn : 2 ≤ n)
    (hproj : Nonempty ((Matrix.ProjGenLinGroup.mk.comp ρ).range ≃* DihedralGroup n)) :
    let choices := {Δ : Subgroup Γ | Δ.index = 2 ∧
      ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
        (∀ g ∈ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) = D) ∧
        (∀ g ∉ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D)}
    (n = 2 → Nat.card choices = 3) ∧ (3 ≤ n → Nat.card choices = 1) := by sorry

/-- Self-twisting by the nontrivial quadratic character detects index-two induction. -/
theorem quadratic_self_twist_iff_induced {Γ k : Type*} [Group Γ] [Field k]
    [IsAlgClosed k] (hk : (2 : k) ≠ 0) (ε : Γ →* kˣ)
    (hε : ε ≠ 1) (hεsq : ∀ g, ε g ^ 2 = 1)
    (ρ : Γ →* GL (Fin 2) k) [Finite ρ.range]
    (hirr : Submodule.span k (Set.range fun g => (ρ g : Matrix (Fin 2) (Fin 2) k)) = ⊤) :
    (∃ x : GL (Fin 2) k, ∀ g, x * ρ g * x⁻¹ =
      Matrix.GeneralLinearGroup.scalar (Fin 2) (ε g) * ρ g) ↔
    ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
      (∀ g ∈ ε.ker, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) = D) ∧
      (∀ g ∉ ε.ker, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D) := by sorry

/-- Restriction to a normal subgroup with abelian quotient: distinct constituents give
index-two induction; scalar restriction gives Klein-four projective image. -/
theorem normal_abelian_restriction_rank_two {Γ k : Type*} [Group Γ] [Field k]
    [IsAlgClosed k] (N : Subgroup Γ) [N.Normal] [IsMulCommutative (Γ ⧸ N)]
    (ρ : Γ →* GL (Fin 2) k) [Finite ρ.range]
    (hirr : Submodule.span k (Set.range fun g => (ρ g : Matrix (Fin 2) (Fin 2) k)) = ⊤)
    (hred : ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
      ∀ g ∈ N, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) = D) :
    (∀ g ∈ N, ∃ a, (ρ g : Matrix (Fin 2) (Fin 2) k) = Matrix.scalar (Fin 2) a) ∧
        Nonempty ((Matrix.ProjGenLinGroup.mk.comp ρ).range ≃* DihedralGroup 2) ∨
    ∃ Δ : Subgroup Γ, N ≤ Δ ∧ Δ.index = 2 ∧
      ∃ D : Submodule k (Fin 2 → k), Module.finrank k D = 1 ∧
        (∀ g ∈ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) = D) ∧
        (∀ g ∉ Δ, D.map (Matrix.toLin' (ρ g : Matrix (Fin 2) (Fin 2) k)) ≠ D) := by sorry
end GaloisRep

/-! ## Cyclotomic and tame-inertia consequences -/
namespace GaloisRep
open scoped ValuativeRel Pointwise

/-- Dependency interface owned by R01.2 / LocalGaloisGroups: level-n tame character. -/
def fundamentalCharacter (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime] (n : ℕ) :
    inertiaGroup K →* rootsOfUnity (p ^ n - 1) (AlgebraicClosure K) := sorry

/-- Dependency interface: reduce the local root-of-unity character at the specified
valuation, then embed its finite residue field in k. This is a mathematical predicate. -/
def IsFundamentalOfLevel (K : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    (χ : inertiaGroup K →* kˣ) (n : ℕ) : Prop :=
  0 < n ∧ ∃ φ : Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1} →+* k,
    (∀ x : Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1},
      ¬ IsIntegral 𝒪[K] ((x : AlgebraicClosure K)⁻¹) → φ x = 0) ∧
    ∀ σ (h : ((fundamentalCharacter K p n σ : (AlgebraicClosure K)ˣ) : AlgebraicClosure K) ∈
      Subring.closure {x : AlgebraicClosure K | x ^ (p ^ n - 1) = 1}), (χ σ : k) = φ ⟨_, h⟩

/-- The polynomial witness has the actual niveau-two characters, not just a cyclic
inertia image of the appropriate abstract order. -/
theorem niveauTwo_characters_of_x4_plus_three
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[3])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[3])]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) (ZMod 3) (Fin 2 → ZMod 3))
    (hker : ρ.toRepresentation.ker = ((IntermediateField.adjoin ℚ
      ((X ^ 4 + 3 : Polynomial ℚ).rootSet (AlgebraicClosure ℚ))).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup ℚ))) :
    ∃ ω : inertiaGroup ℚ_[3] →* (AlgebraicClosure (ZMod 3))ˣ,
      IsFundamentalOfLevel ℚ_[3] 3 (AlgebraicClosure (ZMod 3)) ω 2 ∧
      ∃ x : GL (Fin 2) (AlgebraicClosure (ZMod 3)), ∀ σ : inertiaGroup ℚ_[3],
        (x : Matrix (Fin 2) (Fin 2) _) *
          (LinearMap.toMatrix' (ρ (localEmbeddingMap ℚ ℚ_[3] σ))).map
            (algebraMap (ZMod 3) (AlgebraicClosure (ZMod 3))) *
              (x⁻¹ : Matrix (Fin 2) (Fin 2) _) = !![(ω σ : AlgebraicClosure (ZMod 3)) ^ 2, 0;
                0, (ω σ : AlgebraicClosure (ZMod 3)) ^ 6] := by sorry

/-- Projective inertia has order exactly two for a bad-dihedral representation of G_Q. -/
theorem IsBadDihedral.projInertia_card_eq_two {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k] [IsModuleTopology k (Fin 2 → k)]
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    {ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) k (Fin 2 → k)}
    (hρ : IsBadDihedral p ρ) :
    Nat.card ((((inertiaGroup ℚ_[p]).map (localEmbeddingMap ℚ ℚ_[p]).toMonoidHom).map
      ρ.toRepresentation.toHomUnits).map
        (QuotientGroup.mk' (Subgroup.center
          (LinearMap.GeneralLinearGroup k (Fin 2 → k))))) = 2 := by sorry

/-- Both niveau divisibilities are consequences of the exact inertia order. -/
theorem badDihedral_niveau_divisibilities {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k] [IsModuleTopology k (Fin 2 → k)]
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    {ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) k (Fin 2 → k)}
    (hρ : IsBadDihedral p ρ) :
    (∀ (a : ℕ) (ω : inertiaGroup ℚ_[p] →* (AlgebraicClosure k)ˣ),
      IsFundamentalOfLevel ℚ_[p] p (AlgebraicClosure k) ω 1 →
      (∃ x : GL (Fin 2) (AlgebraicClosure k), ∀ σ : inertiaGroup ℚ_[p],
        (x : Matrix (Fin 2) (Fin 2) _) *
          (LinearMap.toMatrix' (ρ (localEmbeddingMap ℚ ℚ_[p] σ))).map
            (algebraMap k (AlgebraicClosure k)) * (x⁻¹ : Matrix (Fin 2) (Fin 2) _) =
              !![(ω σ : AlgebraicClosure k) ^ a, 0; 0, 1]) → p - 1 ∣ 2 * a) ∧
    (∀ (b : ℕ) (ω : inertiaGroup ℚ_[p] →* (AlgebraicClosure k)ˣ),
      IsFundamentalOfLevel ℚ_[p] p (AlgebraicClosure k) ω 2 →
      (∃ x : GL (Fin 2) (AlgebraicClosure k), ∀ σ : inertiaGroup ℚ_[p],
        (x : Matrix (Fin 2) (Fin 2) _) *
          (LinearMap.toMatrix' (ρ (localEmbeddingMap ℚ ℚ_[p] σ))).map
            (algebraMap k (AlgebraicClosure k)) * (x⁻¹ : Matrix (Fin 2) (Fin 2) _) =
              !![(ω σ : AlgebraicClosure k) ^ b, 0; 0, (ω σ : AlgebraicClosure k) ^ (p*b)]) →
                p + 1 ∣ 2 * b) := by sorry

/-- Large linear image persists to the cyclotomic kernel; determinant then gives equality. -/
theorem SL2_in_cyclotomic_image {F : Type*} [Field F] [NumberField F]
    {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) (ZMod p) (Fin 2 → ZMod p))
    (hSL : Matrix.SpecialLinearGroup.toGL.range ≤
      ρ.toRepresentation.toHomUnits.range.map (Matrix.GeneralLinearGroup.toLin'
        (Pi.basisFun (ZMod p) (Fin 2))).symm.toMonoidHom)
    (hdet : ∀ g ∈ ((cyclotomicSubfield F p).fixingSubgroup :
        Subgroup (Field.absoluteGaloisGroup F)), LinearMap.det (ρ g) = 1) :
    (((cyclotomicSubfield F p).fixingSubgroup :
      Subgroup (Field.absoluteGaloisGroup F)).map ρ.toRepresentation.toHomUnits).map
        (Matrix.GeneralLinearGroup.toLin' (Pi.basisFun (ZMod p) (Fin 2))).symm.toMonoidHom =
          Matrix.SpecialLinearGroup.toGL.range := by sorry

/-- If the cyclotomic degree exceeds two, a large projective kernel field cannot contain it. -/
theorem cyclotomic_not_le_projective_field {F : Type*} [Field F] [NumberField F]
    {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k] [CharP k p]
    (ρ : Field.absoluteGaloisGroup F →* GL (Fin 2) k)
    (hq : 4 ≤ Nat.card k)
    (hproj : (Matrix.ProjGenLinGroup.mk.comp ρ).range = ⊤ ∨
      (Matrix.ProjGenLinGroup.mk.comp ρ).range =
        Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk)
    (hdegree : 2 < Module.finrank F (cyclotomicSubfield F p)) :
    ¬ cyclotomicSubfield F p ≤ IntermediateField.fixedField
      ((Matrix.ProjGenLinGroup.mk.comp ρ).ker :
        Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)) := by sorry

/-- The mod-five determinant argument also handles cyclotomic degree two. -/
theorem cyclotomic_five_not_le_projective_field [Fact (Nat.Prime 5)]
    {F : Type*} [Field F] [NumberField F]
    (ρ : Field.absoluteGaloisGroup F →* GL (Fin 2) (ZMod 5))
    (hdet : Matrix.GeneralLinearGroup.det.comp ρ =
      (Units.map (PadicInt.toZModPow 1).toMonoidHom).comp (cyclotomicCharacter F 5))
    (hζ : cyclotomicSubfield F 5 ≠ ⊥)
    (hH : ((cyclotomicSubfield F 5).fixingSubgroup :
      Subgroup (Field.absoluteGaloisGroup F)).map (Matrix.ProjGenLinGroup.mk.comp ρ) =
        Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk) :
    ¬ cyclotomicSubfield F 5 ≤ IntermediateField.fixedField
      ((Matrix.ProjGenLinGroup.mk.comp ρ).ker :
        Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F)) := by sorry

/-- Every character trivial on the cyclotomic subgroup gives the same vanishing of
trace-zero adjoint eigenvectors. This includes χ_p, its inverse and the trivial character. -/
theorem traceZero_adjoint_eigenvectors_vanish {F : Type*} [Field F] [NumberField F]
    {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k] [IsModuleTopology k (Fin 2 → k)]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) k (Fin 2 → k))
    (habs : (resFixingSubgroup (cyclotomicSubfield F p) ρ).IsAbsolutelyIrreducible)
    (ψ : Field.absoluteGaloisGroup F →* kˣ)
    (hψ : ∀ g ∈ ((cyclotomicSubfield F p).fixingSubgroup :
      Subgroup (Field.absoluteGaloisGroup F)), ψ g = 1)
    (X : Matrix (Fin 2) (Fin 2) k) (hX : Matrix.trace X = 0)
    (heigen : ∀ g, LinearMap.toMatrix' (ρ g) * X =
      (ψ g : k) • (X * LinearMap.toMatrix' (ρ g))) : X = 0 := by sorry

/-- Dependency instance from R01.2, transporting the natural algebraic-closure action. -/
instance instMulSemiringActionAbsoluteGaloisGroup (F : Type*) [Field F] :
    MulSemiringAction (Field.absoluteGaloisGroup F) (AlgebraicClosure F) :=
  inferInstanceAs (MulSemiringAction (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F) _)

/-- R01.2 dependency interface, using the library's ideal inertia subgroup. -/
def globalInertiaGroup (F : Type*) [Field F] [NumberField F]
    (w : Ideal (𝓞 (AlgebraicClosure F))) : Subgroup (Field.absoluteGaloisGroup F) :=
  AddSubgroup.inertia w.toAddSubgroup (Field.absoluteGaloisGroup F)

/-- Pure Galois form of the tame-inertia large-image criterion. -/
theorem large_image_from_tame_inertia {p : ℕ} [Fact p.Prime] (hp : 5 ≤ p)
    {k : Type*} [Field k] [Finite k] [CharP k p] [TopologicalSpace k] [IsModuleTopology k (Fin 2 → k)]
    [Algebra (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    [IsScalarTower ℚ (AlgebraicClosure ℚ) (AlgebraicClosure ℚ_[p])]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup ℚ) k (Fin 2 → k))
    (hunram : ∀ w : Ideal (𝓞 (AlgebraicClosure ℚ)), w.IsMaximal →
      (p : 𝓞 (AlgebraicClosure ℚ)) ∉ w → ∀ g ∈ globalInertiaGroup ℚ w, ρ g = 1)
    (hlocal : (ρ.res (localEmbeddingMap ℚ ℚ_[p])).IsAbsolutelyIrreducible)
    (a : ℕ) (ha : Nat.Coprime a (p+1))
    (ω : inertiaGroup ℚ_[p] →* (AlgebraicClosure k)ˣ)
    (hω : IsFundamentalOfLevel ℚ_[p] p (AlgebraicClosure k) ω 2)
    (hinertia : ∃ x : GL (Fin 2) (AlgebraicClosure k), ∀ σ : inertiaGroup ℚ_[p],
      (x : Matrix (Fin 2) (Fin 2) _) *
        (LinearMap.toMatrix' (ρ (localEmbeddingMap ℚ ℚ_[p] σ))).map
          (algebraMap k (AlgebraicClosure k)) * (x⁻¹ : Matrix (Fin 2) (Fin 2) _) =
            !![(ω σ : AlgebraicClosure k) ^ a, 0; 0, (ω σ : AlgebraicClosure k) ^ (p*a)]) :
    ∃ y : GL (Fin 2) (AlgebraicClosure k),
      ((Matrix.SpecialLinearGroup.toGL.comp
        (Matrix.SpecialLinearGroup.map (ZMod.castHom (dvd_refl p) (AlgebraicClosure k)))).range.map
          (MulAut.conj y).toMonoidHom) ≤
      (ρ.toRepresentation.toHomUnits.range.map (Matrix.GeneralLinearGroup.toLin'
        (Pi.basisFun k (Fin 2))).symm.toMonoidHom).map
          (Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))) := by sorry
end GaloisRep

/-! ## Explicit finite-subgroup counting and cyclotomic exceptional cases -/
namespace GL2Subgroup
/-- All Sylow-count parameters in Dickson's modular alternatives. -/
theorem dickson_sylow_parameters {p : ℕ} [Fact p.Prime]
    {k : Type*} [Field k] [Finite k] [CharP k p]
    (n m f : ℕ) (hn : 0 < n) (hm : 0 < m) (hk : Nat.card k = p ^ n)
    (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) k))
    (hH : H ≤ Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk)
    (P : Sylow p H) (hP : Nat.card P = p ^ m)
    (hcount : Nat.card (Sylow p H) = 1 + f * p ^ m) (hf : 1 ≤ f) :
    m ∣ n ∧
    ((2 < p ^ m ∧ f = 1 ∧ ∃ E : Subfield k, Nat.card E = p ^ m ∧
      ∃ x : Matrix.ProjGenLinGroup (Fin 2) k,
        H = ((Matrix.SpecialLinearGroup.map E.subtype).range.map
          (Matrix.ProjGenLinGroup.mk.comp Matrix.SpecialLinearGroup.toGL)).map
            (MulAut.conj x).toMonoidHom) ∨
    (p ^ m = 2 ∧ Nonempty (H ≃* DihedralGroup (1 + 2*f))) ∨
    (Odd p ∧ Even (n / m) ∧ f = 1 ∧ ∃ E : Subfield k, Nat.card E = p ^ m ∧
      ∃ x : Matrix.ProjGenLinGroup (Fin 2) k,
        H = ((Matrix.GeneralLinearGroup.map E.subtype).range.map
          Matrix.ProjGenLinGroup.mk).map (MulAut.conj x).toMonoidHom) ∨
    (p = 3 ∧ m = 1 ∧ Even n ∧ f = 3 ∧ Nat.card H = 60 ∧
      Nonempty (H ≃* alternatingGroup (Fin 5)))) := by sorry

/-- The tame maximal-cyclic partition and its class equation, including the trivial group.
Each C_i represents exactly one conjugacy class of nontrivial maximal cyclic subgroups. -/
theorem tame_projective_class_equation {K : Type*} [Field K] [IsAlgClosed K]
    (H : Subgroup (Matrix.ProjGenLinGroup (Fin 2) K)) [Finite H]
    (htame : ¬ ringChar K ∣ Nat.card H) :
    (∀ g : H, g ≠ 1 → ∃! C : Subgroup H,
      IsCyclic C ∧ g ∈ C ∧
        ∀ D : Subgroup H, IsCyclic D → C ≤ D → D = C) ∧
    ∃ r : ℕ, r ≤ 3 ∧ ∃ C : Fin r → Subgroup H,
      (∀ i, IsCyclic (C i) ∧ C i ≠ ⊥ ∧
        ∀ D : Subgroup H, IsCyclic D → C i ≤ D → D = C i) ∧
      (∀ D : Subgroup H, IsCyclic D → D ≠ ⊥ →
        (∀ E : Subgroup H, IsCyclic E → D ≤ E → E = D) →
          ∃ i x, D = (C i).map (MulAut.conj x).toMonoidHom) ∧
      (∀ i j (x : H), (C i).map (MulAut.conj x).toMonoidHom = C j → i = j) ∧
      (∀ i, (C i).relIndex (Subgroup.normalizer (C i : Set H)) = 1 ∨
        (C i).relIndex (Subgroup.normalizer (C i : Set H)) = 2) ∧
      (1 - ∑ i, ((Nat.card (C i) : ℚ) - 1) /
        (((C i).relIndex (Subgroup.normalizer (C i : Set H)) : ℚ) * Nat.card (C i))) =
          1 / (Nat.card H : ℚ) := by sorry
end GL2Subgroup

namespace GaloisRep
/-- The mod-three exceptional image uses ordinary irreducibility, not absolute
irreducibility, since a nonsplit cyclic Cartan is among the alternatives. -/
theorem cyclotomic_exception_three {F : Type*} [Field F] [NumberField F]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) (ZMod 3) (Fin 2 → ZMod 3))
    (hirr : ρ.toRepresentation.IsIrreducible)
    (hred : ¬ (resFixingSubgroup (cyclotomicSubfield F 3) ρ).IsAbsolutelyIrreducible)
    (hdet : ContinuousRep.det ρ =
      (Units.map (PadicInt.toZModPow 1).toMonoidHom).comp (cyclotomicCharacter F 3)) :
    let G := ρ.toRepresentation.toHomUnits.range.map
      (Matrix.GeneralLinearGroup.toLin' (Pi.basisFun (ZMod 3) (Fin 2))).symm.toMonoidHom
    (∃ x : GL (Fin 2) (ZMod 3), G =
      (Subgroup.normalizer (TauCeti.diagonalTorus (ZMod 3) 2 : Set (GL (Fin 2) (ZMod 3)))).map
        (MulAut.conj x).toMonoidHom) ∨
    (∃ E : Subalgebra (ZMod 3) (Module.End (ZMod 3) (Fin 2 → ZMod 3)),
      IsField E ∧ Module.finrank (ZMod 3) E = 2 ∧
        ρ.toRepresentation.toHomUnits.range ≤ GL2Cartan.nonsplit E) := by sorry

/-- The mod-five exceptional case requires full cyclotomic degree four. -/
theorem cyclotomic_exception_five [Fact (Nat.Prime 5)]
    {F : Type*} [Field F] [NumberField F]
    (ρ : ContinuousRep (Field.absoluteGaloisGroup F) (ZMod 5) (Fin 2 → ZMod 5))
    (hirr : ρ.toRepresentation.IsIrreducible)
    (hred : ¬ (resFixingSubgroup (cyclotomicSubfield F 5) ρ).IsAbsolutelyIrreducible)
    (hdet : ContinuousRep.det ρ =
      (Units.map (PadicInt.toZModPow 1).toMonoidHom).comp (cyclotomicCharacter F 5))
    (hdegree : Module.finrank F (cyclotomicSubfield F 5) = 4) :
    ∃ E : Subalgebra (ZMod 5) (Module.End (ZMod 5) (Fin 2 → ZMod 5)),
      IsField E ∧ Module.finrank (ZMod 5) E = 2 ∧
        ρ.toRepresentation.toHomUnits.range ≤
          Subgroup.normalizer (GL2Cartan.nonsplit E :
            Set (LinearMap.GeneralLinearGroup (ZMod 5) (Fin 2 → ZMod 5))) := by sorry
end GaloisRep

namespace GaloisRep
/-- Rank-one projective kernel fields have only the Goursat intersections. The fixed
coefficient field avoids unrelated accidental isomorphisms across characteristics. -/
theorem projective_kernel_field_intersections {F k : Type*} [Field F] [NumberField F]
    [Field k] [Finite k] (hq : 4 ≤ Nat.card k)
    (φ ψ : Field.absoluteGaloisGroup F →* Matrix.ProjGenLinGroup (Fin 2) k)
    (hopenφ : IsOpen (φ.ker : Set (Field.absoluteGaloisGroup F)))
    (hopenψ : IsOpen (ψ.ker : Set (Field.absoluteGaloisGroup F)))
    (hφ : φ.range = ⊤ ∨ φ.range =
      Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk)
    (hψ : ψ.range = ⊤ ∨ ψ.range =
      Matrix.SpecialLinearGroup.toGL.range.map Matrix.ProjGenLinGroup.mk) :
    let K := IntermediateField.fixedField
      (φ.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F))
    let L := IntermediateField.fixedField
      (ψ.ker : Subgroup (AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F))
    K ⊓ L = ⊥ ∨
      (Module.finrank F ↥(K ⊓ L) = 2 ∧ Odd (Nat.card k) ∧ φ.range = ⊤ ∧ ψ.range = ⊤) ∨
      (K = L ∧ ∃ α : MulAut (Matrix.ProjGenLinGroup (Fin 2) k),
        ∀ g, ψ g = α (φ g)) := by sorry
end GaloisRep

namespace GL2Subgroup
/-- Irreducibility of the squared-entry standard action on Ad⁰/Z, over any extension. -/
theorem frobenius_plane_irreducible_charTwo {k₀ k : Type*} [Field k₀] [Finite k₀]
    [CharP k₀ 2] [Field k] [CharP k 2] [Algebra k₀ k] (hq : 4 ≤ Nat.card k₀) :
    ∀ W : Submodule k (Fin 2 → k),
      (∀ g : Matrix.SpecialLinearGroup (Fin 2) k₀, ∀ v ∈ W,
        (fun i => ∑ j, ((algebraMap k₀ k ((g : Matrix (Fin 2) (Fin 2) k₀) i j)) ^ 2) * v j) ∈ W) →
      W = ⊥ ∨ W = ⊤ := by sorry
end GL2Subgroup

end TauCeti
