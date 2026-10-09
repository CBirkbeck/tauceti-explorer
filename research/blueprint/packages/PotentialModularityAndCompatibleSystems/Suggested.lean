import TauCeti.AlgebraicGeometry.LineBundle.Class
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.FieldTheory.LinearDisjoint
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.RingTheory.IntegralClosure.IntegralRestrict
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Tactic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.NumberTheory.NumberField.Completion.FinitePlace
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Induced
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Multiset.Sum
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Completion.InfinitePlace
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.FieldTheory.AlgebraicClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.NumberTheory.NumberField.DirichletDensity
import Mathlib.LinearAlgebra.Semisimple

/-!
# Potential modularity and compatible systems: suggested Lean forms

This file is not the roadmap and is not exhaustive. `README.md` in this directory is
definitive. The statements suggest Lean forms so that contributors and reviewers converge
on names and signatures; `sorry` proofs claim no implementation.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

`TauCeti.PotentialModularity` covers integral points, field selection and residual
potential modularity (R23.1–R23.5); `TauCeti.CompatibleSystems` covers finiteness of global
rings, characteristic-zero points, the required lift types and compatible families
(R24.1–R24.6 and the family operations). R23.6 records the export order and adds no
declarations. Tests follow their definitions or appear in `TauCeti.CompatibleSystems.Tests`.
`GaloisGroup F` is `Field.absoluteGaloisGroup F` throughout.

Objects owned by other roadmaps (Frobenius and inertia at a place, cuspidal automorphic
representations and their Galois realizations, Hilbert–Blumenthal abelian varieties,
deformation rings, Weil–Deligne parameters, Hodge–Tate data, Hecke algebras, local point
topologies) enter as opaque data: types, subgroups, homomorphisms, numbers and polynomials,
each with its owner in the docstring. The owner's construction replaces each of them. Every
predicate is defined from such data; none is an opaque proposition. A hypothesis or
conclusion that still cannot be stated is named in the docstring of its declaration, and the
README gives the complete statement.
-/

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped TensorProduct
set_option autoImplicit false

universe u
noncomputable section

namespace TauCeti.PotentialModularity

open scoped NumberField

abbrev GL2 (k : Type u) [CommRing k] := Matrix.GeneralLinearGroup (Fin 2) k
abbrev GaloisGroup (F : Type u) [Field F] := Field.absoluteGaloisGroup F

/-!
## Interfaces supplied by other roadmaps

The statements below use the following objects. Those that Mathlib already provides are defined
from it. The others belong to the roadmap named in each docstring; here they are opaque data
(types, subgroups, homomorphisms, polynomials) so that statements about them elaborate, and the
owner's construction replaces each of them. Every predicate in this file is defined from such
data; none is an opaque proposition.
-/

section Places

variable {F : Type u} [Field F] [NumberField F]

/-- The finite places of a number field `F`, as height-one primes of `𝓞 F`. -/
abbrev FinitePrime (F : Type u) [Field F] [NumberField F] :=
  IsDedekindDomain.HeightOneSpectrum (𝓞 F)

/-- The finite place `v` lies above the rational prime `p`. -/
def FinitePrime.LiesOver (v : FinitePrime F) (p : ℕ) : Prop := (p : 𝓞 F) ∈ v.asIdeal

/-- The absolute norm of `v`: the cardinality of its residue field. -/
def FinitePrime.norm (v : FinitePrime F) : ℕ := Nat.card (𝓞 F ⧸ v.asIdeal)

/-- `F/ℚ` is unramified at every place above the rational prime `p`. -/
def UnramifiedAbove (F : Type u) [Field F] [NumberField F] (p : ℕ) : Prop :=
  ∀ v : FinitePrime F, v.LiesOver p → v.asIdeal.ramificationIdx ℤ = 1

/-- The rational prime `p` splits completely in `F`: unramified with residue fields `𝔽_p`. -/
def SplitsCompletelyAbove (F : Type u) [Field F] [NumberField F] (p : ℕ) : Prop :=
  UnramifiedAbove F p ∧ ∀ v : FinitePrime F, v.LiesOver p → v.norm = p

/-- A decomposition group at `v`: the stabilizer of a chosen place of `F̄` above `v`.
Owner: ArithmeticGaloisRepresentations:R01.1 (with the compatible embeddings fixed there). -/
def decompositionGroup (v : FinitePrime F) : Subgroup (GaloisGroup F) := sorry

/-- The inertia subgroup of `decompositionGroup v`.
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def inertiaGroup (v : FinitePrime F) : Subgroup (GaloisGroup F) := sorry

/-- A lift to `decompositionGroup v` of the arithmetic Frobenius at `v`.
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def frobLift (v : FinitePrime F) : GaloisGroup F := sorry

/-- The complex conjugation attached to a real embedding `τ` of `F`.
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def complexConjugation (τ : F →+* ℝ) : GaloisGroup F := sorry

end Places

section Restriction

/-- Restriction `G_{F'} → G_F` along a field embedding `F → F'` (Mathlib's
`Field.absoluteGaloisGroup.map`, after a choice of embedding of algebraic closures). -/
noncomputable def restrictionMap {F F' : Type u} [Field F] [Field F'] (f : F →+* F') :
    GaloisGroup F' →* GaloisGroup F :=
  (Field.absoluteGaloisGroup.map f).toMonoidHom

/-- The restriction of a representation of `G_F` to `G_{F'}`. -/
noncomputable def restrictRep {F F' : Type u} [Field F] [Field F'] {A : Type u} [CommRing A]
    (ρ : GaloisGroup F →* GL2 A) (f : F →+* F') : GaloisGroup F' →* GL2 A :=
  ρ.comp (restrictionMap f)

end Restriction

section Characters

/-- The mod-`p` cyclotomic character of `G_F` (Mathlib's `modularCyclotomicCharacter` on `F̄`,
whose root-count hypothesis holds in characteristic zero).
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def cyclotomicCharacterModP (F : Type u) [Field F] (p : ℕ) : GaloisGroup F →* (ZMod p)ˣ :=
  sorry

/-- The `p`-adic cyclotomic character of `G_F`, Mathlib's `cyclotomicCharacter` on `F̄`. -/
noncomputable def cyclotomicCharacterPadic (F : Type u) [Field F] (p : ℕ) [Fact p.Prime] :
    GaloisGroup F →* ℤ_[p]ˣ :=
  (_root_.cyclotomicCharacter (AlgebraicClosure F) p).comp
    { toFun := fun σ => σ.toRingEquiv
      map_one' := rfl
      map_mul' := fun _ _ => rfl }

end Characters

section ResidualRepresentations

variable {F : Type u} [Field F] [NumberField F] {k : Type u} [Field k]

/-- The `k`-linear representation of a matrix-valued Galois representation. -/
noncomputable def toRepresentation {A : Type u} [CommRing A] (ρ : GaloisGroup F →* GL2 A) :
    Representation A (GaloisGroup F) (Fin 2 → A) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ)

/-- A residual representation is continuous for the discrete topology: its kernel is open. -/
def IsContinuousResidual (ρ : GaloisGroup F →* GL2 k) : Prop :=
  IsOpen (ρ.ker : Set (GaloisGroup F))

/-- Continuity of a representation with coefficients in a topological ring. -/
def IsContinuousRep {A : Type u} [CommRing A] [TopologicalSpace A]
    (ρ : GaloisGroup F →* GL2 A) : Prop :=
  Continuous (fun g => (ρ g : Matrix (Fin 2) (Fin 2) A))

/-- Every complex conjugation has determinant `-1`. -/
def IsTotallyOdd {A : Type u} [CommRing A] (ρ : GaloisGroup F →* GL2 A) : Prop :=
  ∀ τ : F →+* ℝ, Matrix.GeneralLinearGroup.det (ρ (complexConjugation τ)) = -1

/-- Irreducibility after extending scalars to an algebraic closure of `k`. -/
def IsAbsolutelyIrreducible (ρ : GaloisGroup F →* GL2 k) : Prop :=
  (toRepresentation ((Matrix.GeneralLinearGroup.map
    (algebraMap k (AlgebraicClosure k))).comp ρ)).IsIrreducible

/-- Unramified at `v`: trivial on the inertia group. -/
def IsUnramifiedAt {A : Type u} [CommRing A] (ρ : GaloisGroup F →* GL2 A)
    (v : FinitePrime F) : Prop :=
  ∀ g ∈ inertiaGroup v, ρ g = 1

/-- Unramified outside the finite set `S`. -/
def IsUnramifiedOutside {A : Type u} [CommRing A] (ρ : GaloisGroup F →* GL2 A)
    (S : Finset (FinitePrime F)) : Prop :=
  ∀ v, v ∉ S → IsUnramifiedAt ρ v

/-- Restriction to the decomposition group at `v` is upper triangular, with diagonal
characters `χ₁` (upper left) and `χ₂` (lower right), after conjugation by `P`. -/
def IsUpperTriangularAt {A : Type u} [CommRing A] (ρ : GaloisGroup F →* GL2 A)
    (v : FinitePrime F) (χ₁ χ₂ : GaloisGroup F →* Aˣ) : Prop :=
  ∃ P : GL2 A, ∀ g ∈ decompositionGroup v,
    ((P⁻¹ * ρ g * P : GL2 A) : Matrix (Fin 2) (Fin 2) A) 1 0 = 0 ∧
    ((P⁻¹ * ρ g * P : GL2 A) : Matrix (Fin 2) (Fin 2) A) 0 0 = χ₁ g ∧
    ((P⁻¹ * ρ g * P : GL2 A) : Matrix (Fin 2) (Fin 2) A) 1 1 = χ₂ g

/-- A character is unramified at `v`. -/
def CharIsUnramifiedAt {A : Type u} [CommRing A] (χ : GaloisGroup F →* Aˣ)
    (v : FinitePrime F) : Prop :=
  ∀ g ∈ inertiaGroup v, χ g = 1

/-- The residual image is preserved by restriction along `f`. -/
def ImagePreserved {F' : Type u} [Field F'] (ρ : GaloisGroup F →* GL2 k) (f : F →+* F') :
    Prop :=
  (restrictRep ρ f).range = ρ.range

/-- The normalized Serre weight `k(ρ̄) ≥ 2` of a residual representation of `G_ℚ`.
Owner: ClassicalSerreModularity:R27 (with AlgebraicModularFormsAndSerreWeights:R15.4). -/
def serreWeight {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k) : ℕ := sorry

/-- Khare–Wintenberger's S-type: continuous, totally odd and absolutely irreducible. -/
def IsSType {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k) : Prop :=
  IsContinuousResidual ρ ∧ IsTotallyOdd ρ ∧ IsAbsolutelyIrreducible ρ

/-- The restriction of a residual representation of `G_F` to `G_{F(μ_p)}`. -/
noncomputable def restrictToCyclotomic (ρ : GaloisGroup F →* GL2 k) (p : ℕ+) :
    GaloisGroup (CyclotomicField p F) →* GL2 k :=
  restrictRep ρ (algebraMap F (CyclotomicField p F))

end ResidualRepresentations

section Automorphic

/-- Regular algebraic cuspidal automorphic representations of `GL₂(𝔸_F)`.
Owner: GL2AutomorphicRepresentationsAndTransfer:R17.5 and AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2 (F : Type u) [Field F] [NumberField F] : Type u := sorry

variable {F : Type u} [Field F] [NumberField F]

/-- The weight `k_τ ≥ 2` of `π` at the infinite place `τ` (cohomological normalization).
Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2.weight (π : CuspidalGL2 F) (τ : F →+* ℝ) : ℕ := sorry

/-- The exponent of the conductor of `π_v`.
Owner: GL2AutomorphicRepresentationsAndTransfer:R17.5. -/
def CuspidalGL2.conductorExponent (π : CuspidalGL2 F) (v : FinitePrime F) : ℕ := sorry

/-- `π_v` is unramified. -/
def CuspidalGL2.IsUnramifiedAt (π : CuspidalGL2 F) (v : FinitePrime F) : Prop :=
  π.conductorExponent v = 0

/-- `π` has parallel weight `k`. -/
def CuspidalGL2.HasParallelWeight (π : CuspidalGL2 F) (k : ℕ) : Prop :=
  ∀ τ, π.weight τ = k

/-- The field of coefficients (Hecke field) of `π`.
Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2.coefficientField (π : CuspidalGL2 F) : Type := sorry

noncomputable instance (π : CuspidalGL2 F) : Field π.coefficientField := sorry
instance (π : CuspidalGL2 F) : NumberField π.coefficientField := sorry

/-- The integral Hecke polynomial `X² − a_v X + χ(v) Nv^{k−1}` of `π` (weight `k`) at an unramified
`v`: the characteristic polynomial of arithmetic Frobenius on `ρ_{π,ι}`.
Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2.heckePolynomial (π : CuspidalGL2 F) (v : FinitePrime F) :
    Polynomial (𝓞 π.coefficientField) := sorry

/-- The `U_v`-eigenvalue of `π` at `v` (zero when `π_v` has no such eigenvector).
Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2.uEigenvalue (π : CuspidalGL2 F) (v : FinitePrime F) :
    𝓞 π.coefficientField := sorry

/-- The `p`-adic Galois representation `ρ_{π,ι}` for an embedding `ι` of the coefficient field.
Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGL2.galoisRep (π : CuspidalGL2 F) (p : ℕ) [Fact p.Prime]
    (ι : π.coefficientField →+* PadicAlgCl p) : GaloisGroup F →* GL2 (PadicAlgCl p) := sorry

/-- `π_v` is ordinary at `v` for the reduction `ι`: its `U_v`-eigenvalue is a unit mod `p`. -/
def CuspidalGL2.IsOrdinaryAt (π : CuspidalGL2 F) (p : ℕ) [Fact p.Prime]
    (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)) (v : FinitePrime F) : Prop :=
  ι (π.uEigenvalue v) ≠ 0

/-- The residual representation `ρ̄ : G_F → GL₂(k)` arises from `π`: for some reduction `ι` of
the integers of the coefficient field, the Frobenius characteristic polynomials agree in `𝔽̄_p`
outside a finite set. -/
def ArisesFrom {k : Type u} [Field k] (p : ℕ) [Fact p.Prime] (j : k →+* AlgebraicClosure (ZMod p))
    (ρ : GaloisGroup F →* GL2 k) (π : CuspidalGL2 F) : Prop :=
  ∃ (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)) (S : Finset (FinitePrime F)),
    ∀ v ∉ S, ((ρ (frobLift v) : Matrix (Fin 2) (Fin 2) k).charpoly).map j =
      (π.heckePolynomial v).map ι

/-- A `p`-adic representation is modular: isomorphic to `ρ_{π,ι}` after an embedding of its
coefficients into `ℚ̄_p`. -/
def IsModularLift {A : Type u} [CommRing A] (p : ℕ) [Fact p.Prime] (j : A →+* PadicAlgCl p)
    (ρ : GaloisGroup F →* GL2 A) : Prop :=
  ∃ (π : CuspidalGL2 F) (ι : π.coefficientField →+* PadicAlgCl p) (P : GL2 (PadicAlgCl p)),
    ∀ g, Matrix.GeneralLinearGroup.map j (ρ g) = P * π.galoisRep p ι g * P⁻¹

end Automorphic

section AbelianVarieties

/-- Abelian varieties over `E` with multiplication by the integers of the totally real field
`M` (Hilbert–Blumenthal abelian varieties), with their polarizations.
Owner: AbelianSchemesAndArithmeticModuli:A6 and HilbertModularVarietiesAndShimuraCurves:H6. -/
def HBAV (E M : Type u) [Field E] [NumberField E] [Field M] [NumberField M] : Type u := sorry

variable {E M : Type u} [Field E] [NumberField E] [Field M] [NumberField M]

/-- The Galois action on `A[λ]`, a rank-two `𝓞_M/λ`-module.
Owner: AbelianSchemesAndArithmeticModuli:A6. -/
def HBAV.torsionRep (A : HBAV E M) (lam : FinitePrime M) :
    GaloisGroup E →* GL2 (𝓞 M ⧸ lam.asIdeal) := sorry

/-- The Galois action on the rational `λ`-adic Tate module `V_λ A`, of rank two over `M_λ`.
Owner: AbelianSchemesAndArithmeticModuli:A6. -/
def HBAV.tateRep (A : HBAV E M) (lam : FinitePrime M) :
    GaloisGroup E →* GL2 (lam.adicCompletion M) := sorry

/-- The characteristic polynomial of Frobenius on `V_λ A` at good `v`, with coefficients in `M`
and independent of `λ`. Owner: AbelianSchemesAndArithmeticModuli:A6. -/
def HBAV.frobeniusCharpoly (A : HBAV E M) (v : FinitePrime E) : Polynomial M := sorry

/-- `A` is modular: its Frobenius polynomials are those of a cuspidal `π` outside a finite set,
after an embedding of `M` into the coefficient field of `π`. -/
def HBAV.IsModular (A : HBAV E M) : Prop :=
  ∃ (π : CuspidalGL2 E) (ι : M →+* π.coefficientField) (S : Finset (FinitePrime E)),
    ∀ v ∉ S, (A.frobeniusCharpoly v).map ι =
      (π.heckePolynomial v).map (algebraMap (𝓞 π.coefficientField) π.coefficientField)

end AbelianVarieties

section Deformations

/-- Khare–Wintenberger's local deformation conditions at `p`: (A) crystalline (Fontaine–Laffaille
in weight `k(ρ̄)`), (B) weight-two potentially Barsotti–Tate with the prescribed type,
(C) weight-two semistable. Owner: LocalGaloisDeformationRings:R08.6. -/
inductive KWLocalType
  | A
  | B
  | C
  deriving DecidableEq

/-- The unframed fixed-determinant global deformation ring `R̄_S^ψ` of a residual
`ρ̄ : G_ℚ → GL₂(k)` with ramification in `S`, determinant `ψ χ_p` and the KW local conditions of
type `t` at `p` (minimal at the other primes of `S`), as a `ℤ_p`-algebra.
Owner: GlobalGaloisDeformations:R04.6 over LocalGaloisDeformationRings:R08.6. -/
def unframedGlobalRing (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    (ρ : GaloisGroup ℚ →* GL2 k) (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ)
    (t : KWLocalType) : Type := sorry

variable (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
  (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType)

noncomputable instance : CommRing (unframedGlobalRing p ρ S ψ t) := sorry
noncomputable instance : Algebra ℤ_[p] (unframedGlobalRing p ρ S ψ t) := sorry
instance : IsLocalRing (unframedGlobalRing p ρ S ψ t) := sorry

/-- The lift classified by a point of the framed global ring over `R̄_S^ψ`: a continuous
`ρ : G_ℚ → GL₂(O)` reducing to `ρ̄`, unramified outside `S`, of determinant `ψ χ_p`, of type `t`
at `p` and minimal away from `p`. A point of the unframed ring determines it up to conjugation.
Owner: GlobalGaloisDeformations:R04.6. -/
def unframedGlobalRing.liftOfPoint {O : Type} [CommRing O] [Algebra ℤ_[p] O]
    (x : unframedGlobalRing p ρ S ψ t →ₐ[ℤ_[p]] O) : GaloisGroup ℚ →* GL2 O := sorry

end Deformations

end TauCeti.PotentialModularity

namespace TauCeti.PotentialModularity

open scoped NumberField

abbrev Point (A : Type u) [CommRing A] (X : Scheme.{u}) := Spec (.of A) ⟶ X

/-- Auxiliary packaging of actual field/algebra/finite-dimensional data. -/
structure FiniteExtension (K : Type u) [Field K] where
  carrier : Type u
  [field : Field carrier]
  [algebra : Algebra K carrier]
  [finite : FiniteDimensional K carrier]

attribute [instance] FiniteExtension.field FiniteExtension.algebra FiniteExtension.finite

/-! ### Places, completions and local point sets -/

/-- The places of a number field: infinite places and finite primes. -/
abbrev Place (K : Type u) [Field K] [NumberField K] :=
  NumberField.InfinitePlace K ⊕ FinitePrime K

/-- The completion `K_v` at a place (Mathlib's `InfinitePlace.Completion` or `adicCompletion`). -/
def placeCompletion {K : Type u} [Field K] [NumberField K] : Place K → Type u
  | .inl w => w.Completion
  | .inr w => w.adicCompletion K

noncomputable instance {K : Type u} [Field K] [NumberField K] (v : Place K) :
    Field (placeCompletion v) :=
  match v with
  | .inl w => (inferInstance : Field w.Completion)
  | .inr w => (inferInstance : Field (w.adicCompletion K))

instance {K : Type u} [Field K] [NumberField K] (v : Place K) :
    TopologicalSpace (placeCompletion v) :=
  match v with
  | .inl w => (inferInstance : TopologicalSpace w.Completion)
  | .inr w => (inferInstance : TopologicalSpace (w.adicCompletion K))

/-- The embedding `K → K_v`. -/
noncomputable def placeEmbedding {K : Type u} [Field K] [NumberField K] (v : Place K) :
    K →+* placeCompletion v :=
  match v with
  | .inl w => algebraMap K w.Completion
  | .inr w => algebraMap K (w.adicCompletion K)

noncomputable instance {K : Type u} [Field K] [NumberField K] (v : Place K) :
    Algebra K (placeCompletion v) := (placeEmbedding v).toAlgebra

/-- The analytic (`v`-adic) topology on the points `X(L)` of a scheme over a topological field `L`.
Owner: SchemeAndStackFoundations:SF.4. -/
abbrev pointTopology (L : Type u) [Field L] [TopologicalSpace L] (X : Scheme.{u}) :
    TopologicalSpace (Point L X) := sorry

/-- `L_v` is a finite Galois extension of `K_v` with its canonical topology, compatibly with `K`. -/
def IsLocalGaloisExtension {K : Type u} [Field K] [NumberField K] (v : Place K) (L : Type u)
    [Field L] [TopologicalSpace L] [Algebra K L] [Algebra (placeCompletion v) L] : Prop :=
  FiniteDimensional (placeCompletion v) L ∧ IsGalois (placeCompletion v) L ∧
    IsModuleTopology (placeCompletion v) L ∧
    algebraMap K L = (algebraMap (placeCompletion v) L).comp (placeEmbedding v)

/-- Splitting after scalar extension to L, not equality of completions with L. -/
abbrev SplitOver (K E L : Type u) [Field K] [Field E] [Field L]
    [Algebra K E] [Algebra K L] :=
  Nonempty ((L ⊗[K] E) ≃ₐ[L] (Fin (Module.finrank K E) → L))

/-- A Skolem datum (Moret-Bailly II, 1.1–1.2, p. 181): a separated surjective morphism of finite
type `f : X → B = Spec R` with `X` irreducible, a finite set `Σ` of places disjoint from the closed
points `Max(R)`, and for `v ∈ Σ` a field `L_v` with a nonempty, `v`-adically open,
`Gal(L_v/K_v)`-stable set `Ω_v ⊆ X(L_v)`. The ring `R` is the ring of `S`-integers of a number field
or of a smooth affine curve over a finite field, and `L_v/K_v` is finite Galois (hypotheses of the
theorems below). Omitted conditions: geometric irreducibility of `X_K` and smoothness of the points
of `Ω_v` (owner SchemeAndStackFoundations:SF.4). -/
structure SkolemDatum (R K : Type u) [CommRing R] [Field K] [Algebra R K]
    (V : Type u) (L : V → Type u) [∀ v, Field (L v)] [∀ v, Algebra K (L v)]
    [∀ v, TopologicalSpace (L v)] where
  X : Scheme.{u}
  f : X ⟶ Spec (.of R)
  separated : IsSeparated f
  finiteType : LocallyOfFiniteType f
  surjective : Surjective f
  irreducible : IrreducibleSpace X
  sigma : Finset V
  closedPlaces : Set V
  disjoint : ∀ v ∈ sigma, v ∉ closedPlaces
  Ω : ∀ v, Set (Point (L v) X)
  open_Ω : ∀ v ∈ sigma, @IsOpen _ (pointTopology (L v) X) (Ω v)
  nonempty_Ω : ∀ v ∈ sigma, (Ω v).Nonempty
  galoisStable : ∀ v ∈ sigma, ∀ σ : L v ≃ₐ[K] L v, ∀ x ∈ Ω v,
    Spec.map (CommRingCat.ofHom σ.toRingEquiv.toRingHom) ≫ x ∈ Ω v

variable {R K V : Type u} [CommRing R] [Field K] [Algebra R K]
  {L : V → Type u} [∀ v, Field (L v)] [∀ v, Algebra K (L v)] [∀ v, TopologicalSpace (L v)]

/-- Complete: every place lies in `Σ` or in `Max(R)`. -/
def SkolemDatum.IsComplete (S : SkolemDatum R K V L) : Prop :=
  ∀ v, v ∈ S.sigma ∨ v ∈ S.closedPlaces

/-- The concrete generic-extension criterion of MB II Remark 1.5. -/
def SkolemDatum.FieldPoint (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) : Prop :=
  (x ≫ S.f = Spec.map (CommRingCat.ofHom (algebraMap R (integralClosure R E.carrier)))) ∧
  (∀ v ∈ S.sigma, SplitOver K E.carrier (L v)) ∧
  (∀ v ∈ S.sigma, ∀ e : E.carrier →ₐ[K] L v,
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v)

structure SkolemDatum.IntegralPoint (S : SkolemDatum R K V L) where
  E : FiniteExtension K
  [algebraR : Algebra R E.carrier]
  [tower : IsScalarTower R K E.carrier]
  x : Point (integralClosure R E.carrier) S.X
  valid : S.FieldPoint E x

attribute [instance] SkolemDatum.IntegralPoint.algebraR SkolemDatum.IntegralPoint.tower

lemma SkolemDatum.fieldPoint_split (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) (hx : S.FieldPoint E x)
    (v : V) (hv : v ∈ S.sigma) : SplitOver K E.carrier (L v) := by
  sorry

lemma SkolemDatum.fieldPoint_local (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) (hx : S.FieldPoint E x)
    (v : V) (hv : v ∈ S.sigma) (e : E.carrier →ₐ[K] L v) :
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v := by
  sorry

lemma SkolemDatum.isComplete_congr (S T : SkolemDatum R K V L)
    (hs : S.sigma = T.sigma) (hc : S.closedPlaces = T.closedPlaces) :
    S.IsComplete ↔ T.IsComplete := by
  sorry

/-- Map normalized field points. The geometric closed-image comparison remains omitted. -/
def SkolemDatum.mapPoint (S T : SkolemDatum R K V L) (f : S.X ⟶ T.X)
    (hf : f ≫ T.f = S.f) (hs : S.sigma = T.sigma)
    (hΩ : ∀ v ∈ S.sigma, ∀ y ∈ S.Ω v, y ≫ f ∈ T.Ω v)
    (x : S.IntegralPoint) : T.IntegralPoint := by
  sorry

/-- Generic criterion; its equivalence to the geometric closed-subscheme definition is omitted. -/
lemma SkolemDatum.integralPoint_iff (S : SkolemDatum R K V L) (E : FiniteExtension K)
    [Algebra R E.carrier] [IsScalarTower R K E.carrier]
    (x : Point (integralClosure R E.carrier) S.X) :
    S.FieldPoint E x ↔
      (x ≫ S.f = Spec.map (CommRingCat.ofHom (algebraMap R (integralClosure R E.carrier)))) ∧
      (∀ v ∈ S.sigma, SplitOver K E.carrier (L v)) ∧
      (∀ v ∈ S.sigma, ∀ e : E.carrier →ₐ[K] L v,
        Spec.map (CommRingCat.ofHom
          (e.toRingHom.comp (algebraMap (integralClosure R E.carrier) E.carrier))) ≫ x ∈ S.Ω v) := by
  sorry

/-- The algebra equivalence is over L; requiring factors L over K_v is stronger. -/
lemma SkolemDatum.split_iff_algEquiv (E : FiniteExtension K) (v : V) :
    SplitOver K E.carrier (L v) ↔
      Nonempty (((L v) ⊗[K] E.carrier) ≃ₐ[L v]
        (Fin (Module.finrank K E.carrier) → L v)) := by
  sorry

/-- Enlarging `Σ` by a finite set `T` of closed places with nonempty integral local opens
(Moret-Bailly II 1.10): the new datum has `Σ ∪ T` and closed places `Max(R) ∖ T`. Removing `T` from
the base replaces `R` by a localization; the closure of an integral point of the enlarged datum is
an integral point of `S`. -/
def SkolemDatum.enlargeSigma [DecidableEq V] (S : SkolemDatum R K V L) (T : Finset V)
    (Ω' : ∀ v, Set (Point (L v) S.X))
    (ho : ∀ v ∈ S.sigma ∪ T, @IsOpen _ (pointTopology (L v) S.X) (Ω' v))
    (hn : ∀ v ∈ S.sigma ∪ T, (Ω' v).Nonempty) :
    {S' : SkolemDatum R K V L //
      S'.sigma = S.sigma ∪ T ∧ S'.closedPlaces = S.closedPlaces \ (T : Set V)} := by
  sorry

/-- skolem_complete_Z: completeness on Q's places, and the conjugate-norm obstruction. -/
example (L : Option Nat.Primes → Type) [∀ v, Field (L v)] [∀ v, Algebra ℚ (L v)]
    [∀ v, TopologicalSpace (L v)]
    (S : SkolemDatum ℤ ℚ (Option Nat.Primes) L)
    (hs : S.sigma = {none}) (hc : S.closedPlaces = {v | v ≠ none}) :
    S.IsComplete ∧
    (∀ (n : ℕ) (hn : 0 < n) (z : Fin n → ℂ),
      (∏ i, ‖z i‖) = 1 → ¬ (∀ i, ‖z i‖ < 1)) := by
  sorry

/-- skolem_incomplete_Z_half: remove 2 from the closed places, keep infinity in sigma. -/
example (L : Option Nat.Primes → Type) [∀ v, Field (L v)] [∀ v, Algebra ℚ (L v)]
    [∀ v, TopologicalSpace (L v)]
    (S : SkolemDatum ℤ ℚ (Option Nat.Primes) L)
    (hs : S.sigma = {none})
    (hc : S.closedPlaces = {v | ∃ p : Nat.Primes, p.val ≠ 2 ∧ v = some p}) :
    ¬ S.IsComplete := by
  sorry

/-- skolem_trivial_X: the generic extension K works even for nontrivial L/K. -/
example (F : Type u) [Field F] [Algebra K F] : SplitOver K K F := by
  sorry

/-- skolem_open_required: a singleton in a nondiscrete local analytic curve is inadmissible.
This is the local analytic test, after choosing a coordinate in Q_p or R. -/
example (x : ℝ) : ¬ IsOpen ({x} : Set ℝ) := by
  sorry

/-- skolem_fieldPoint_local: the object imposes the condition at every embedding. -/
example (S : SkolemDatum R K V L) (x : S.IntegralPoint)
    (v : V) (hv : v ∈ S.sigma) (e : x.E.carrier →ₐ[K] L v) :
    Spec.map (CommRingCat.ofHom
      (e.toRingHom.comp (algebraMap (integralClosure R x.E.carrier) x.E.carrier))) ≫ x.x ∈ S.Ω v := by
  sorry

/-- A line bundle on `X` with a trivialization of its restriction to the boundary `Z`
(Moret-Bailly II 3.4). -/
structure Rigidified (X Z : Scheme.{u}) (i : Z ⟶ X) where
  line : InvertibleSheaf X
  trivialization : (Scheme.Modules.pullback i).obj line.obj ≅ (InvertibleSheaf.trivial Z).obj

def rigidifiedSetoid (X Z : Scheme.{u}) (i : Z ⟶ X) : Setoid (Rigidified X Z i) where
  r A B := Nonempty {e : A.line.obj ≅ B.line.obj //
    (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom}
  iseqv := by sorry

def generalizedPicard (X Z : Scheme.{u}) (i : Z ⟶ X) : Type _ :=
  Quotient (rigidifiedSetoid X Z i)

lemma generalizedPicard_mk_eq_iff (X Z : Scheme.{u}) (i : Z ⟶ X)
    (A B : Rigidified X Z i) :
    (Quotient.mk _ A : generalizedPicard X Z i) = Quotient.mk _ B ↔
      Nonempty {e : A.line.obj ≅ B.line.obj //
        (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom} := by
  sorry

def generalizedPicard_lift (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B) :
    generalizedPicard X Z i → T := Quotient.lift f hf

lemma generalizedPicard_lift_mk (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B)
    (A : Rigidified X Z i) :
    generalizedPicard_lift X Z i T f hf (Quotient.mk _ A) = f A := by
  sorry

/-- Objectwise group signature. Tensor/dual compatibility and the relative group sheaf
are not supplied by this signature; the README specifies their precise construction. -/
noncomputable instance generalizedPicard_group (X Z : Scheme.{u}) (i : Z ⟶ X) :
    CommGroup (generalizedPicard X Z i) := by
  sorry

/-- Quotient descent of the supplier's actual rigidified pullback. Its construction
from a Cartesian square and the identity/composition laws remain omitted. -/
def generalizedPicard_pullback (X Z Y W : Scheme.{u}) (i : Z ⟶ X) (j : W ⟶ Y)
    (pull : Rigidified X Z i → Rigidified Y W j)
    (hp : ∀ A B, (rigidifiedSetoid X Z i).r A B →
      (rigidifiedSetoid Y W j).r (pull A) (pull B)) :
    generalizedPicard X Z i → generalizedPicard Y W j := Quotient.map pull hp

/-- Forgetting is well-defined on rigidified isomorphism classes, into the pinned class type. -/
def generalizedPicard_forget (X Z : Scheme.{u}) (i : Z ⟶ X) :
    generalizedPicard X Z i → LineBundleClass X :=
  Quotient.lift (fun A ↦ LineBundleClass.mk A.line) (by sorry)

/-- Exactness at PG on objectwise points. Full sheaf exactness, including the last arrow's
local surjectivity, is omitted and requires the relative/fppf supplier. -/
lemma generalizedPicard_exact (X Z : Scheme.{u}) (i : Z ⟶ X)
    (P : generalizedPicard X Z i) :
    generalizedPicard_forget X Z i P = LineBundleClass.mk (InvertibleSheaf.trivial X) ↔
      ∃ α : (Scheme.Modules.pullback i).obj (InvertibleSheaf.trivial X).obj ≅
          (InvertibleSheaf.trivial Z).obj,
        P = Quotient.mk _ (Rigidified.mk (InvertibleSheaf.trivial X) α) := by
  sorry

/-- The supplier identifies D with degree-d effective divisors disjoint from Z. -/
def divisorClassMap (X Z : Scheme.{u}) (i : Z ⟶ X) (D : Type u)
    (lineOfDivisor : D → InvertibleSheaf X)
    (boundarySection : ∀ d, (Scheme.Modules.pullback i).obj (lineOfDivisor d).obj ≅
      (InvertibleSheaf.trivial Z).obj) : D → generalizedPicard X Z i :=
  fun d ↦ Quotient.mk _ ⟨lineOfDivisor d, boundarySection d⟩

/-- Compactification data of a smooth relative curve `X → B` (Moret-Bailly II 3.1–3.5): `X̄ → B`
projective with regular `X̄` and geometrically integral fibres, the reduced boundary
`Z = X̄ ∖ X` finite flat over `B`, the genus `g = h¹(X̄_K, 𝒪)`, the boundary degree `z = deg_K Z_K`,
the symmetric powers `X^{(d)}`, the schemes `PG_d` representing degree-`d` classes of rigidified
line bundles (`generalizedPicard`) and the divisor-class morphisms `φ_d : X^{(d)} → PG_d`.
Owner: AlgebraicModuliForArithmeticGeometry:R09.3 with SchemeAndStackFoundations:SF.3. -/
def CurveCompactification {X B : Scheme.{u}} (f : X ⟶ B) : Type u := sorry

namespace CurveCompactification
variable {X B : Scheme.{u}} {f : X ⟶ B}

/-- The genus `g`. Owner: AlgebraicModuliForArithmeticGeometry:R09.3. -/
def genus (_C : CurveCompactification f) : ℕ := sorry

/-- The boundary degree `z`. Owner: AlgebraicModuliForArithmeticGeometry:R09.3. -/
def boundaryDegree (_C : CurveCompactification f) : ℕ := sorry

/-- The symmetric power `X^{(d)}` over `B`. Owner: SchemeAndStackFoundations:SF.3. -/
def symmetricPower (_C : CurveCompactification f) (_d : ℕ) : Scheme.{u} := sorry

/-- The scheme `PG_d` representing degree-`d` rigidified classes.
Owner: AlgebraicModuliForArithmeticGeometry:R09.3 (Murre's representability). -/
def picardScheme (_C : CurveCompactification f) (_d : ℕ) : Scheme.{u} := sorry

/-- `φ_d : X^{(d)} → PG_d`, `D ↦ (𝒪(D), s_D|_Z)`. Owner: AlgebraicModuliForArithmeticGeometry:R09.3. -/
def divisorClass (C : CurveCompactification f) (d : ℕ) :
    C.symmetricPower d ⟶ C.picardScheme d := sorry

/-- The points, with multiplicity, of an `L`-point of `X^{(d)}` that is a sum of `L`-rational
points (empty otherwise). Owner: SchemeAndStackFoundations:SF.3. -/
def splitSupport (C : CurveCompactification f) {L : Type u} [Field L] (d : ℕ)
    (D : Point L (C.symmetricPower d)) : Multiset (Point L X) := sorry

end CurveCompactification

/-- `Ω_v^{[d]}` (Moret-Bailly II 3.2): the étale effective divisors of degree `d` that are split over
`L_v` and have all their points in `Ω_v`. -/
def omegaDivisors (S : SkolemDatum R K V L) (C : CurveCompactification S.f) (v : V) (d : ℕ) :
    Set (Point (L v) (C.symmetricPower d)) :=
  {D | (C.splitSupport d D).card = d ∧ (C.splitSupport d D).Nodup ∧
    ∀ x ∈ C.splitSupport d D, x ∈ S.Ω v}

/-- Moret-Bailly II, Lemme 3.3 (p. 187): `Ω_v^{[d]}` is open, and nonempty when `[L_v : K_v]`
divides `d`. -/
theorem omegaDivisors_open (S : SkolemDatum R K V L) (C : CurveCompactification S.f) (v : V)
    (hv : v ∈ S.sigma) (d : ℕ) (Kv : Type u) [Field Kv] [Algebra Kv (L v)]
    (hdeg : Module.finrank Kv (L v) ∣ d) :
    @IsOpen _ (pointTopology (L v) (C.symmetricPower d)) (omegaDivisors S C v d) ∧
      (omegaDivisors S C v d).Nonempty := by
  sorry

/-- Moret-Bailly II, Lemme 3.6 (p. 189): for `d ≥ 2g + z − 1`, `φ_d` is a locally trivial fibration
in affine spaces of dimension `d + 1 − g − z`; in particular every fibre over a field-valued point
is `𝔸^{d+1−g−z}`. Uses Riemann–Roch and duality on the regular, hence Gorenstein, `X̄`. -/
theorem divisorClassMap_affineFibration {X B : Scheme.{u}} {f : X ⟶ B}
    (C : CurveCompactification f) (d : ℕ) (hd : 2 * C.genus + C.boundaryDegree - 1 ≤ d)
    (k : Type u) [Field k] (x : Spec (.of k) ⟶ C.picardScheme d) :
    Nonempty (Limits.pullback (C.divisorClass d) x ≅
      AffineSpace (ULift.{u} (Fin (d + 1 - C.genus - C.boundaryDegree))) (Spec (.of k))) := by
  sorry

/-- pg_affine_line: for `X = 𝔸¹ ⊂ ℙ¹`, `Z = {∞}` (`g = 0`, `z = 1`) the fibres of `φ_d` are `𝔸^d`, the
monic polynomials of degree `d`. -/
example {X B : Scheme.{u}} {f : X ⟶ B} (C : CurveCompactification f) (hg : C.genus = 0)
    (hz : C.boundaryDegree = 1) (d : ℕ) (k : Type u) [Field k]
    (x : Spec (.of k) ⟶ C.picardScheme d) :
    Nonempty (Limits.pullback (C.divisorClass d) x ≅ AffineSpace (ULift.{u} (Fin d)) (Spec (.of k))) := by
  sorry

/-- pg_multiplicative: for `X = 𝔾_m ⊂ ℙ¹`, `Z = {0, ∞}` (`g = 0`, `z = 2`) the fibres in degree
`d ≥ 1` are `𝔸^{d−1}`. -/
example {X B : Scheme.{u}} {f : X ⟶ B} (C : CurveCompactification f) (hg : C.genus = 0)
    (hz : C.boundaryDegree = 2) (d : ℕ) (hd : 1 ≤ d) (k : Type u) [Field k]
    (x : Spec (.of k) ⟶ C.picardScheme d) :
    Nonempty (Limits.pullback (C.divisorClass d) x ≅ AffineSpace (ULift.{u} (Fin (d - 1))) (Spec (.of k))) := by
  sorry

/-- pg_small_degree: for `g = 1`, `z = 1`, degree `d = 1` is below `2g + z − 1 = 2`, outside the
range of the fibration lemma. -/
example {X B : Scheme.{u}} {f : X ⟶ B} (C : CurveCompactification f) (hg : C.genus = 1)
    (hz : C.boundaryDegree = 1) : ¬ (2 * C.genus + C.boundaryDegree - 1 ≤ 1) := by
  sorry

/-- pg_trivial_Z: the rigidified quotient agrees with existing line-bundle classes. -/
example (X Z : Scheme.{u}) [IsEmpty Z] (i : Z ⟶ X) :
    Function.Bijective (generalizedPicard_forget X Z i) := by
  sorry

/-- pg_rigidified_iso: compatible isomorphisms, rather than literal representatives. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A B : Rigidified X Z i)
    (h : (rigidifiedSetoid X Z i).r A B) :
    (Quotient.mk _ A : generalizedPicard X Z i) = Quotient.mk _ B := by
  sorry

/-- pg_boundary_matters: an unrigidified isomorphism alone does not equate the classes. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A B : Rigidified X Z i)
    (h : ∀ e : A.line.obj ≅ B.line.obj,
      (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom ≠ A.trivialization.hom) :
    (Quotient.mk _ A : generalizedPicard X Z i) ≠ Quotient.mk _ B := by
  sorry

/-- pg_forget_representative: use the existing line-bundle class, preserving its universe. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A : Rigidified X Z i) :
    generalizedPicard_forget X Z i (Quotient.mk _ A) = LineBundleClass.mk A.line := by
  sorry

/-! ### The integral-point theorem and its reductions -/

/-- The datum's base is the ring of `s`-integers `(𝓞_K)[1/s]` of a number field, its places are
those of `K`, its closed places are the finite primes not dividing `s`, and each `L_v` is a finite
Galois extension of `K_v` with its canonical topology. -/
def SkolemDatum.IsArithmetic {K : Type u} [Field K] [NumberField K] {R : Type u} [CommRing R]
    [Algebra R K] {L : Place K → Type u} [∀ v, Field (L v)] [∀ v, Algebra K (L v)]
    [∀ v, TopologicalSpace (L v)] [∀ v, Algebra (placeCompletion v) (L v)]
    [Algebra (𝓞 K) R] (s : 𝓞 K) (S : SkolemDatum R K (Place K) L) : Prop :=
  IsLocalization.Away s R ∧ IsScalarTower (𝓞 K) R K ∧
    S.closedPlaces = {v | ∃ w : FinitePrime K, v = Sum.inr w ∧ (s : 𝓞 K) ∉ w.asIdeal} ∧
    ∀ v, IsLocalGaloisExtension v (L v)

/-- Moret-Bailly II, Théorème 1.3 (p. 182): every incomplete Skolem datum has an integral point.
For `Σ = ∅` this is Rumely's local–global principle (Moret-Bailly I, Théorème 1.7); the proof for
`Σ ≠ ∅` uses `elementaryReductions`, `reductionToCurves`, `localPicardOpensAndApproximation` and
`compactGeneralizedJacobianQuotient`. Stated here in the arithmetic case; Remarque 1.7 extends it to
localizations of rings of integers and to the geometric case. -/
theorem moretBailly {K : Type u} [Field K] [NumberField K] {R : Type u} [CommRing R]
    [Algebra R K] {L : Place K → Type u} [∀ v, Field (L v)] [∀ v, Algebra K (L v)]
    [∀ v, TopologicalSpace (L v)] [∀ v, Algebra (placeCompletion v) (L v)] [Algebra (𝓞 K) R]
    (s : 𝓞 K) (S : SkolemDatum R K (Place K) L) (harith : S.IsArithmetic s)
    (hinc : ¬ S.IsComplete) : Nonempty S.IntegralPoint := by
  sorry

/-- Density of algebraic local points (Moret-Bailly II, Lemme 1.6.1, Corollaire 1.6.2 and
Lemme 2.1, pp. 183–184): for a finite place `w` of a number field `K` and `X` locally of finite type
over `K`, the points of `X` over the algebraic closure of `K` in `K_w` are dense in `X(K_w)`.
In characteristic zero the separable and algebraic closures agree, so Lemme 1.6.1 is the case
`X(K̄_w)`. Omitted conclusion: Corollaire 1.6.2 (points over the integers of a finite extension of
`K_w` for a flat surjective model), which needs integral models (owner SchemeAndStackFoundations:SF.4). -/
theorem densityOfAlgebraicLocalPoints {K : Type u} [Field K] [NumberField K] (w : FinitePrime K)
    (X : Scheme.{u}) (f : X ⟶ Spec (.of K)) [LocallyOfFiniteType f] :
    @Dense _ (pointTopology (w.adicCompletion K) X)
      {x | ∃ y : Point (algebraicClosure K (w.adicCompletion K)) X,
        x = Spec.map (CommRingCat.ofHom
          (algebraMap (algebraicClosure K (w.adicCompletion K)) (w.adicCompletion K))) ≫ y} := by
  sorry

/-- Elementary reductions (Moret-Bailly II, Remarques 1.4, 1.9, 1.10, Exemple 1.10.1): `X` may be
replaced by a nonempty open subscheme `U` (for instance its smooth locus) with
`Ω'_v ⊆ Ω_v ∩ U(L_v)`: an integral point of the restricted datum gives one of the original datum
(by closure). Chow's lemma (EGA II 5.6) gives the quasi-projective reduction, and `enlargeSigma`
the enlargement of `Σ`. -/
theorem elementaryReductions (S S' : SkolemDatum R K V L) (j : S'.X ⟶ S.X) [IsOpenImmersion j]
    (hf : j ≫ S.f = S'.f) (hsig : S'.sigma = S.sigma) (hcl : S'.closedPlaces = S.closedPlaces)
    (hΩ : ∀ v ∈ S.sigma, ∀ y ∈ S'.Ω v, y ≫ j ∈ S.Ω v) :
    Nonempty S'.IntegralPoint → Nonempty S.IntegralPoint := by
  sorry

/-- Reduction to relative dimension one (Moret-Bailly II, Lemmes 2.2–2.4, pp. 184–186): for `f`
quasi-projective with `X_K` smooth of dimension at least two, a Bertini hypersurface section
(Jouanolou, Théorème I.6.3) through a curve meeting every `Ω_v` gives a Skolem datum on a closed
subscheme of smaller dimension, incomplete if `S` is, whose integral points map to integral points
of `S`. By induction Théorème 1.3 reduces to curves. Omitted hypothesis: quasi-projectivity of `f`
(owner SchemeAndStackFoundations:SF.4). -/
theorem reductionToCurves (S : SkolemDatum R K V L) [Smooth S.f]
    (hdim : 2 < topologicalKrullDim S.X) :
    ∃ (S' : SkolemDatum R K V L) (i : S'.X ⟶ S.X), IsClosedImmersion i ∧ i ≫ S.f = S'.f ∧
      S'.sigma = S.sigma ∧ S'.closedPlaces = S.closedPlaces ∧
      topologicalKrullDim S'.X < topologicalKrullDim S.X ∧
      (Nonempty S'.IntegralPoint → Nonempty S.IntegralPoint) := by
  sorry

/-- Local Picard opens and strong approximation (Moret-Bailly II, Lemmes 3.7.2 and 3.8,
pp. 190–191): for `d ≥ 2g + z − 1` the images `W_v^{[d]} = φ_d(Ω_v^{[d]})` are open in `PG_d(L_v)`, and
if `S` is incomplete, an `R`-point of `PG_d` whose local images lie in every `W_v^{[d]}` comes from a
section whose divisor lies in every `Ω_v^{[d]}`; each component of that divisor is an integral point.
Strong approximation is imported (Cassels–Fröhlich II §15). -/
theorem localPicardOpensAndApproximation (S : SkolemDatum R K V L)
    (C : CurveCompactification S.f) (d : ℕ) (hd : 2 * C.genus + C.boundaryDegree - 1 ≤ d)
    (hinc : ¬ S.IsComplete) (base : ∀ v, R →+* L v)
    (P : Spec (.of R) ⟶ C.picardScheme d)
    (hP : ∀ v ∈ S.sigma, ∃ D ∈ omegaDivisors S C v d,
      Spec.map (CommRingCat.ofHom (base v)) ≫ P = D ≫ C.divisorClass d) :
    (∀ v ∈ S.sigma, @IsOpen _ (pointTopology (L v) (C.picardScheme d))
      ((fun D => D ≫ C.divisorClass d) '' omegaDivisors S C v d)) ∧
    Nonempty S.IntegralPoint := by
  sorry

/-- The compact generalized-Jacobian quotient (Moret-Bailly II, Lemmes 3.9, 3.9.2 and
3.10.2–3.10.4, pp. 191–193): if `S` is incomplete, some power of an ample `M₀` with a trivialization
on `Z` gives an `R`-point of `PG_d`, `d ≥ 2g + z`, whose local images lie in every `W_v^{[d]}`. The
proof uses quasi-compactness of `P₀(K_Σ)/Γ(Z, 𝒪_Z^×)`, compactness of `J(F)` (Raynaud, through
Altman–Kleiman), and the `S`-unit lattice (Cassels–Fröhlich II §18). -/
theorem compactGeneralizedJacobianQuotient (S : SkolemDatum R K V L)
    (C : CurveCompactification S.f) (hinc : ¬ S.IsComplete) (base : ∀ v, R →+* L v) :
    ∃ (d : ℕ) (P : Spec (.of R) ⟶ C.picardScheme d), 2 * C.genus + C.boundaryDegree ≤ d ∧
      ∀ v ∈ S.sigma, ∃ D ∈ omegaDivisors S C v d,
        Spec.map (CommRingCat.ofHom (base v)) ≫ P = D ≫ C.divisorClass d := by
  sorry

/-! ### Split fields, avoidance and prescribed completions -/

/-- `K_S`: the compositum of the finite subextensions of `K̄/K` in which every place of `S` splits
completely (for `K = ℚ`, `S = {∞}`, the maximal totally real field). -/
def splitField (K : Type u) [Field K] [NumberField K] (S : Finset (Place K)) :
    IntermediateField K (AlgebraicClosure K) :=
  ⨆ (E : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K E)
    (_ : ∀ v ∈ S, SplitOver K E (placeCompletion v)), E

/-- `X` is a scheme over `K` with `K_v`-points for every `v ∈ S`. -/
def HasLocalPoints {K : Type u} [Field K] [NumberField K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of K)) (S : Finset (Place K)) : Prop :=
  ∀ v ∈ S, ∃ y : Point (placeCompletion v) X,
    y ≫ f = Spec.map (CommRingCat.ofHom (placeEmbedding v))

/-- From integral points to split-field density (the spreading-out deduction, EGA IV §8): for a
smooth irreducible `X/K` with local points at `S` and a nonempty open `U ⊆ X`, there are a finite
`K' ⊆ K_S` and a `K'`-point of `X` landing in `U`. The model over `𝓞_K[1/N]` omits a place outside
`Σ ∪ Max(R)`, which makes the Skolem datum incomplete. -/
theorem theoremGFromMoretBailly {K : Type u} [Field K] [NumberField K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of K)) [Smooth f] [IrreducibleSpace X] (S : Finset (Place K))
    (hloc : HasLocalPoints f S) (U : X.Opens) (hU : (U : Set X).Nonempty) :
    ∃ (E : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K E)
      (y : Point E X), E ≤ splitField K S ∧
      y ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K E)) ∧ Set.range y.base ⊆ U := by
  sorry

/-- Taylor's Theorem G (Remarks on a conjecture of Fontaine and Mazur, pp. 4–5, after
Moret-Bailly): for `X/K` smooth, geometrically irreducible and quasi-projective with `X(K_v) ≠ ∅` for
`v ∈ S`, the points of `X` over `K_S` are Zariski dense. KW II (proof of Theorem 6.1) uses the form
with prescribed local opens, `moretBaillyThreeLocalConditions`. Omitted hypotheses:
quasi-projectivity and geometric irreducibility (owner SchemeAndStackFoundations:SF.4). -/
theorem taylorTheoremG {K : Type u} [Field K] [NumberField K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of K)) [Smooth f] [IrreducibleSpace X] (S : Finset (Place K))
    (hloc : HasLocalPoints f S) :
    Dense {x : X | ∃ (E : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K E)
      (y : Point E X), E ≤ splitField K S ∧
      y ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K E)) ∧ x ∈ Set.range y.base} := by
  sorry

/-- No nontrivial subextension of `D` splits completely at every place of `T`; for `D/K` Galois this
says the Frobenius elements at `T` generate `Gal(D/K)`. -/
def DetectsSubextensions {K : Type u} [Field K] [NumberField K]
    (D : IntermediateField K (AlgebraicClosure K)) (T : Finset (FinitePrime K)) : Prop :=
  ∀ E : IntermediateField K (AlgebraicClosure K), E ≤ D → E ≠ ⊥ →
    ∃ v ∈ T, ¬ SplitOver K E (placeCompletion (Sum.inr v))

/-- Generating Frobenius primes (Chebotarev): for `D/K` finite Galois and a finite set `B` of finite
places there is a finite set `T` of places outside `B`, unramified in `D`, whose Frobenius elements
generate `Gal(D/K)`. -/
theorem frobeniusPrimesGenerate {K : Type u} [Field K] [NumberField K]
    (D : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K D] [IsGalois K D]
    (B : Finset (FinitePrime K)) :
    ∃ T : Finset (FinitePrime K), Disjoint T B ∧ DetectsSubextensions D T := by
  sorry

/-- Forcing linear disjointness by extra split places (KW II, proof of Theorem 6.1): if every finite
Galois `K'/K` considered splits completely at a set `T` detecting the subextensions of the finite
Galois `D/K`, then `K'` is linearly disjoint from `D` (its intersection with `D` splits at `T`).
For a non-Galois avoidance field use its normal closure. -/
theorem disjointnessByExtraSplitPlaces {K : Type u} [Field K] [NumberField K]
    (D K' : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K D] [IsGalois K D]
    [FiniteDimensional K K'] [IsGalois K K'] (T : Finset (FinitePrime K))
    (hT : DetectsSubextensions D T)
    (hsplit : ∀ v ∈ T, SplitOver K K' (placeCompletion (Sum.inr v))) :
    K'.LinearDisjoint D := by
  sorry

/-- Disjointness through a tower: inside a common field, for `C ⊆ B ⊆ A` and `D ⊇ C` with `A` and `D`
linearly disjoint over `C`, the fields `A` and `BD` are linearly disjoint over `B` and `A ∩ BD = B`. -/
theorem towerLinearDisjoint {C Ω : Type u} [Field C] [Field Ω] [Algebra C Ω]
    (A B D : IntermediateField C Ω) (hBA : B ≤ A) (hAD : A.LinearDisjoint D) :
    A ⊓ (B ⊔ D) = B ∧
      (IntermediateField.extendScalars hBA).LinearDisjoint
        ↥(IntermediateField.extendScalars (le_sup_left : B ≤ B ⊔ D)) := by
  sorry

/-- The idèle class group `𝔸_K^×/K^×` with the inclusions of the local unit groups.
Owner: GlobalNumberFields Layers 9–10 with ClassFieldTheory Layer 12. -/
def IdeleClassGroup (K : Type u) [Field K] [NumberField K] : Type u := sorry

noncomputable instance {K : Type u} [Field K] [NumberField K] : CommGroup (IdeleClassGroup K) :=
  sorry

/-- The map `K_v^× → 𝔸_K^×/K^×`. Owner: GlobalNumberFields. -/
def localToIdeleClass {K : Type u} [Field K] [NumberField K] (v : Place K) :
    (placeCompletion v)ˣ →* IdeleClassGroup K := sorry

/-- Extending finite local characters (Clozel–Harris–Taylor, Lemma 4.1.1, pp. 116–117, with the
finite-order refinement of its proof): a finite-order character of `∏_{v ∈ S} K_v^×` (continuous for
the discrete topology on the values) extends to a finite-order character of `𝔸_K^×/K^×`; if the
local characters have `p`-power order, so can the global one. Its order may exceed that of the
local character. Omitted hypothesis: continuity of the global character (owner GlobalNumberFields). -/
theorem chtCharacterExtension {K : Type u} [Field K] [NumberField K] (S : Finset (Place K))
    (χ : ∀ v ∈ S, (placeCompletion v)ˣ →* (AlgebraicClosure ℚ)ˣ)
    (hfin : ∃ m : ℕ, 0 < m ∧ ∀ v (hv : v ∈ S) x, χ v hv x ^ m = 1)
    (hcont : ∀ v (hv : v ∈ S), IsOpen ((χ v hv).ker : Set (placeCompletion v)ˣ)) :
    ∃ ψ : IdeleClassGroup K →* (AlgebraicClosure ℚ)ˣ, (∃ m : ℕ, 0 < m ∧ ∀ x, ψ x ^ m = 1) ∧
      ∀ v (hv : v ∈ S) x, ψ (localToIdeleClass v x) = χ v hv x := by
  sorry

/-- Soluble extensions with prescribed completions (Clozel–Harris–Taylor, Lemma 4.1.2, statement
p. 116, proof p. 117): for `D/K` finite Galois and finite Galois `E_v/K_v` at the places of a finite
`S`, there is a finite soluble Galois `E/K`, linearly disjoint from `D`, whose completions above each
`v ∈ S` are `E_v` (`K_v ⊗_K E` is a product of copies of `E_v`). Taking `E_v = ℝ` at the real places
keeps a totally real field totally real. -/
theorem chtSolublePrescribedCompletions {K : Type u} [Field K] [NumberField K]
    (D : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K D] [IsGalois K D]
    (S : Finset (Place K)) (Eloc : Place K → Type u) [∀ v, Field (Eloc v)]
    [∀ v, Algebra (placeCompletion v) (Eloc v)]
    (hEloc : ∀ v ∈ S, FiniteDimensional (placeCompletion v) (Eloc v) ∧
      IsGalois (placeCompletion v) (Eloc v)) :
    ∃ E : IntermediateField K (AlgebraicClosure K), FiniteDimensional K E ∧ IsGalois K E ∧
      Group.IsSolvable (E ≃ₐ[K] E) ∧ E.LinearDisjoint D ∧
      ∀ v ∈ S, ∃ m : ℕ, Nonempty ((placeCompletion v ⊗[K] E) ≃ₐ[placeCompletion v]
        (Fin m → Eloc v)) := by
  sorry

/-- The local ambient fields of the three kinds of local conditions: `K_v` (kind 0), the maximal
unramified extension `K_v^{nr}` (kind 1) and an algebraic closure `K̄_v` (kind 2), with their
topologies. Owner: Mathlib's local fields (the maximal unramified extension is supplied by
LocalGaloisDeformationRings:R08.2). -/
def localAmbient {K : Type u} [Field K] [NumberField K] (v : Place K) (_kind : Fin 3) : Type u :=
  sorry

section LocalAmbient
variable {K : Type u} [Field K] [NumberField K] (v : Place K) (i : Fin 3)
noncomputable instance : Field (localAmbient v i) := sorry
noncomputable instance : TopologicalSpace (localAmbient v i) := sorry
noncomputable instance : Algebra K (localAmbient v i) := sorry
end LocalAmbient

/-- Moret–Bailly with three local conditions (Qian, Proposition 4.2): for `X/K` smooth and
geometrically connected, `H/K` finite Galois and `S = S₁ ⊔ S₂ ⊔ S₃` (`S₂` nonarchimedean) with
nonempty Galois-stable opens in `X(K_v)`, `X(K_v^{nr})` and `X(K̄_v)` respectively, there are a finite
Galois `K'/K` linearly disjoint from `H` and `P ∈ X(K')` such that the places of `S₁` split
completely, those of `S₂` are unramified (`K'` embeds in `K_v` resp. `K_v^{nr}`), and every local
image of `P` lies in the prescribed open. If `K` is totally real and the real places lie in `S₁`,
`K'` is totally real. -/
theorem moretBaillyThreeLocalConditions {K : Type u} [Field K] [NumberField K] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of K)) [Smooth f] [GeometricallyConnected f]
    (H : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K H] [IsGalois K H]
    (S : Finset (Place K)) (kind : Place K → Fin 3)
    (hS₂ : ∀ v ∈ S, kind v = 1 → v.isRight)
    (Ω : ∀ v, Set (Point (localAmbient v (kind v)) X))
    (hΩ : ∀ v ∈ S, @IsOpen _ (pointTopology (localAmbient v (kind v)) X) (Ω v) ∧ (Ω v).Nonempty) :
    ∃ (K' : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K K'),
      IsGalois K K' ∧ K'.LinearDisjoint H ∧
      (∀ v ∈ S, kind v ≠ 2 → Nonempty (K' →ₐ[K] localAmbient v (kind v))) ∧
      ∃ P : Point K' X, P ≫ f = Spec.map (CommRingCat.ofHom (algebraMap K K')) ∧
        ∀ v ∈ S, ∀ σ : K' →ₐ[K] localAmbient v (kind v),
          Spec.map (CommRingCat.ofHom σ.toRingHom) ≫ P ∈ Ω v := by
  sorry

/-- Moret–Bailly above a preliminary field (BLGHT, Proposition 6.2, pp. 40–41): for `M/K` finite
Galois, split at `S₁` and unramified at `S₂`, `X/M` smooth and geometrically connected with the three
kinds of nonempty opens at the places of `M` above `S`, and `L/K` finite Galois linearly disjoint
from `M`, there are a finite Galois `K'/K` containing `M`, linearly disjoint from `L`, and
`P ∈ X(K')` satisfying every local condition. Uses Weil restriction (AbelianSchemesAndArithmeticModuli:A6). -/
theorem moretBaillyAbovePreliminaryField {K : Type u} [Field K] [NumberField K]
    (M L : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K M] [IsGalois K M]
    [NumberField M] [FiniteDimensional K L] [IsGalois K L] (hML : M.LinearDisjoint L)
    {X : Scheme.{u}} (f : X ⟶ Spec (.of M)) [Smooth f] [GeometricallyConnected f]
    (S : Finset (Place M)) (kind : Place M → Fin 3)
    (Ω : ∀ v, Set (Point (localAmbient v (kind v)) X))
    (hΩ : ∀ v ∈ S, @IsOpen _ (pointTopology (localAmbient v (kind v)) X) (Ω v) ∧ (Ω v).Nonempty) :
    ∃ (K' : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K K') (hMK' : M ≤ K'),
      IsGalois K K' ∧ K'.LinearDisjoint L ∧
      ∃ P : Point K' X,
        P ≫ f = Spec.map (CommRingCat.ofHom (IntermediateField.inclusion hMK').toRingHom) ∧
        ∀ v ∈ S, ∀ σ : K' →+* localAmbient v (kind v),
          σ.comp (IntermediateField.inclusion hMK').toRingHom = algebraMap M _ →
          Spec.map (CommRingCat.ofHom σ) ≫ P ∈ Ω v := by
  sorry

/-- The étale fundamental group of a connected scheme and the specialization of a point.
Owner: SchemeAndStackFoundations:SF.2. -/
def etaleFundamentalGroup (X : Scheme.{u}) : Type u := sorry

noncomputable instance (X : Scheme.{u}) : Group (etaleFundamentalGroup X) := sorry

/-- The map `G_{F'} → π₁^{ét}(X)` induced by a point `P ∈ X(F')`. Owner: SchemeAndStackFoundations:SF.2. -/
def specialization {X : Scheme.{u}} {F' : Type u} [Field F'] (P : Point F' X) :
    GaloisGroup F' →* etaleFundamentalGroup X := sorry

/-- Surjective specialization of a finite quotient (Bianchi, Proposition 4.5.1, pp. 48–49): for `F`
imaginary CM and Galois over `ℚ`, `X/F` smooth and geometrically irreducible, an avoidance field and
local data `(L_v, Ω_v)` at the places above a finite set of primes, and a surjection
`π₁^{ét}(X) → G` to a finite group, there are a CM extension `F'/F`, linearly disjoint from the
avoidance field, with the prescribed completions, and `P ∈ X(F')` with local images in `Ω_v` and
`G_{F'} → G` surjective. Omitted hypothesis: Galois-equivariance of the local data and `F'` Galois
over `ℚ` (owner AbelianSchemesAndArithmeticModuli:A6 for the Weil restriction used). -/
theorem surjectiveSpecialisation {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    {X : Scheme.{u}} (f : X ⟶ Spec (.of F)) [Smooth f] [GeometricallyIntegral f]
    (avoid : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F avoid]
    (S : Finset (Place F)) (Lloc : Place F → Type u) [∀ v, Field (Lloc v)]
    [∀ v, TopologicalSpace (Lloc v)] [∀ v, Algebra F (Lloc v)]
    (Ω : ∀ v, Set (Point (Lloc v) X))
    (hΩ : ∀ v ∈ S, @IsOpen _ (pointTopology (Lloc v) X) (Ω v) ∧ (Ω v).Nonempty)
    (G : Type u) [Group G] [Finite G] (q : etaleFundamentalGroup X →* G)
    (hq : Function.Surjective q) :
    ∃ (F' : IntermediateField F (AlgebraicClosure F)) (_ : NumberField F'),
      NumberField.IsCMField F' ∧ F'.LinearDisjoint avoid ∧
      ∃ P : Point F' X, P ≫ f = Spec.map (CommRingCat.ofHom (algebraMap F F')) ∧
        (∀ v ∈ S, ∀ σ : F' →ₐ[F] Lloc v, Spec.map (CommRingCat.ofHom σ.toRingHom) ≫ P ∈ Ω v) ∧
        Function.Surjective (q.comp (specialization P)) := by
  sorry

/-- The isomorphism torsor `Z = Isom_{Y_K,H}(X_φ, X_ψ)` over `K = 𝔽_q(X)` attached to `φ : G_K → H` and
`ψ : G_F → H` (BHKT §9, diagram (9.1), with the corrected finite étale base of source issue E8),
with its structure morphism to `Spec K`. Owner: SchemeAndStackFoundations:SF.1–SF.2. -/
def isomTorsor (k : Type u) [Field k] [Finite k] {K F : Type u} [Field K] [Field F] [Algebra k K]
    [Algebra k F] (H : Type u) [Group H] [Finite H] (φ : GaloisGroup K →* H)
    (ψ : GaloisGroup F →* H) : Scheme.{u} := sorry

/-- The structure morphism `Z → Spec K`. Owner: SchemeAndStackFoundations:SF.1–SF.2. -/
def isomTorsorStructure (k : Type u) [Field k] [Finite k] {K F : Type u} [Field K] [Field F]
    [Algebra k K] [Algebra k F] (H : Type u) [Group H] [Finite H] (φ : GaloisGroup K →* H)
    (ψ : GaloisGroup F →* H) : isomTorsor k H φ ψ ⟶ Spec (.of K) := sorry

/-- The function-field isomorphism torsor (BHKT, Lemma 9.1 and diagram (9.1), published
pp. 76–77; correction: Beuzart-Plessis–Harris–Thorne, p. 28): for smooth geometrically connected
curves `X, Y` over `𝔽_q` with function fields `K, F` and `φ : G_K → H`, `ψ : G_F → H` to a finite group,
`Z` is geometrically connected over `K` when `ψ` is surjective (on the geometric fundamental group),
and a `K'`-point of `Z` over a finite `K'/K` (with nonconstant image in `Y`) gives an `𝔽_q`-embedding
`β : F → K'` with `β^*ψ` conjugate to `φ|_{G_{K'}}`. `Z` is a curve over `K`, not a finite `K`-scheme.
Omitted hypothesis: nonconstancy of the image of the point in `Y` (owner SF.1). -/
theorem functionFieldIsomTorsor (k : Type u) [Field k] [Finite k] {K F : Type u} [Field K]
    [Field F] [Algebra k K] [Algebra k F] (H : Type u) [Group H] [Finite H]
    (φ : GaloisGroup K →* H) (ψ : GaloisGroup F →* H) (hψ : Function.Surjective ψ) :
    GeometricallyConnected (isomTorsorStructure k H φ ψ) ∧
      ∀ (K' : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K K')
        (z : Point K' (isomTorsor k H φ ψ)),
        z ≫ isomTorsorStructure k H φ ψ = Spec.map (CommRingCat.ofHom (algebraMap K K')) →
        ∃ β : F →+* K', (∀ c : k, β (algebraMap k F c) = algebraMap K K' (algebraMap k K c)) ∧
          ∃ h : H, ∀ g,
            ψ (restrictionMap β g) = h * φ (restrictionMap (algebraMap K K') g) * h⁻¹ := by
  sorry

/-- Moret–Bailly with unchanged constant field (BHKT, Proposition 9.2, pp. 77–78): with the torsor
data, a finite Galois `D/K` and two split places of coprime degrees, there are a finite Galois `K'/K`
linearly disjoint from `D`, with constant field `𝔽_q` (the algebraic closure of `𝔽_q` in `K'` is
trivial), and an `𝔽_q`-embedding `β : F → K'` with `β^*ψ` conjugate to `φ|_{G_{K'}}`. -/
theorem fixedConstantField (k : Type u) [Field k] [Finite k] {K F : Type u} [Field K] [Field F]
    [Algebra k K] [Algebra k F] (hK : algebraicClosure k K = ⊥) (H : Type u) [Group H] [Finite H]
    (φ : GaloisGroup K →* H) (ψ : GaloisGroup F →* H) (hψ : Function.Surjective ψ)
    (D : IntermediateField K (AlgebraicClosure K)) [FiniteDimensional K D] [IsGalois K D] :
    ∃ (K' : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K K'),
      IsGalois K K' ∧ K'.LinearDisjoint D ∧
      (letI : Algebra k K' := ((algebraMap K K').comp (algebraMap k K)).toAlgebra
       algebraicClosure k K' = ⊥) ∧
      ∃ β : F →+* K', ∃ h : H, ∀ g,
        ψ (restrictionMap β g) = h * φ (restrictionMap (algebraMap K K') g) * h⁻¹ := by
  sorry

/-- Potential realization of local Galois data (BHKT, Theorem 9.3, after Moret-Bailly; Calegari,
Proposition 3.2): for a number field `K`, a finite set `S` of places, a finite group `H` and local
homomorphisms `G_{K_v} → H` with open kernel, there are a finite `K'/K` split at `S` and a Galois
extension of `K'` with group `H` realizing each local datum up to conjugacy at the places above `S`;
when `K` is totally real, `K'` can be chosen totally real and Galois over `K`. Omitted conclusion:
linear disjointness from an avoidance field (Calegari's refinement); the MB90 source remains a
recorded gap. -/
theorem potentialGlobalGaloisLocalData {K : Type u} [Field K] [NumberField K]
    (S : Finset (Place K)) (H : Type u) [Group H] [Finite H]
    (localData : ∀ v ∈ S, GaloisGroup (placeCompletion v) →* H)
    (hlocal : ∀ v (hv : v ∈ S),
      IsOpen ((localData v hv).ker : Set (GaloisGroup (placeCompletion v)))) :
    ∃ (K' : IntermediateField K (AlgebraicClosure K)) (_ : FiniteDimensional K K'),
      (∀ v ∈ S, SplitOver K K' (placeCompletion v)) ∧
      (NumberField.IsTotallyReal K → (∀ σ : K' →+* ℂ, ∀ x, (σ x).im = 0) ∧ IsGalois K K') ∧
      ∃ q : GaloisGroup K' →* H, Function.Surjective q ∧ IsOpen (q.ker : Set (GaloisGroup K')) ∧
        ∀ v (hv : v ∈ S), ∀ σ : K' →ₐ[K] placeCompletion v, ∃ h : H, ∀ g,
          q (restrictionMap σ.toRingHom g) = h * localData v hv g * h⁻¹ := by
  sorry

/-- Split fields after a soluble preliminary extension (Snowden, Proposition 3.2.1 and §3; BLGHT
§6): for `X/F` smooth and geometrically connected, local data `(L_v, Ω_v)` at a finite `Σ` and an
avoidance field, there are a finite soluble Galois `F₁/F` and a finite Galois `F₂/F`, linearly
disjoint from `F₁ F_avoid`, with `F₁ ⊗ L_v` and `F₂ ⊗ L_v` split, and a point of `X` over `F₁F₂` whose
images under every `F`-embedding `F₁F₂ → L_v` lie in `Ω_v`. Splitting after tensoring with `L_v` is
weaker than prescribing completions. -/
theorem snowdenSolublePreliminaryField {F : Type u} [Field F] [NumberField F] {X : Scheme.{u}}
    (f : X ⟶ Spec (.of F)) [Smooth f] [GeometricallyConnected f] (T : Finset (Place F))
    (Lloc : Place F → Type u) [∀ v, Field (Lloc v)] [∀ v, TopologicalSpace (Lloc v)]
    [∀ v, Algebra F (Lloc v)] (Ω : ∀ v, Set (Point (Lloc v) X))
    (hΩ : ∀ v ∈ T, @IsOpen _ (pointTopology (Lloc v) X) (Ω v) ∧ (Ω v).Nonempty)
    (avoid : IntermediateField F (AlgebraicClosure F)) [FiniteDimensional F avoid] :
    ∃ (F₁ F₂ : IntermediateField F (AlgebraicClosure F)),
      FiniteDimensional F F₁ ∧ IsGalois F F₁ ∧ Group.IsSolvable (F₁ ≃ₐ[F] F₁) ∧
      FiniteDimensional F F₂ ∧ IsGalois F F₂ ∧ F₂.LinearDisjoint ↥(F₁ ⊔ avoid) ∧
      (∀ v ∈ T, SplitOver F F₁ (Lloc v) ∧ SplitOver F F₂ (Lloc v)) ∧
      ∃ x : Point ↥(F₁ ⊔ F₂) X,
        x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap F ↥(F₁ ⊔ F₂))) ∧
        ∀ v ∈ T, ∀ σ : ↥(F₁ ⊔ F₂) →ₐ[F] Lloc v,
          Spec.map (CommRingCat.ofHom σ.toRingHom) ≫ x ∈ Ω v := by
  sorry

/-- Two split places of coprime degrees force the constant field to be `𝔽_q`: a common divisor
of the degrees is `1`. -/
example (constantDegree m n : ℕ) (hpos : 0 < constantDegree)
    (hm : constantDegree ∣ m) (hn : constantDegree ∣ n) (hcop : m.Coprime n) :
    constantDegree = 1 := by
  sorry

end TauCeti.PotentialModularity

namespace TauCeti.PotentialModularity

open scoped NumberField

/-- A fixed algebraic closure of `ℚ`, containing the fields selected over `ℚ`. -/
abbrev QBar := AlgebraicClosure ℚ

/-!
### Supplier interfaces used in R23.2–R24.2

Opaque data owned by the roadmaps named in each docstring, used together with those of the
shared supplier section above.
-/

section Suppliers

/-- Reduction of integral elements of `ℚ̄_p` to `𝔽̄_p` (any value off the valuation ring).
Owner: ArithmeticGaloisRepresentations:R01.1 (reduction of stable lattices). -/
def padicResidue (p : ℕ) [Fact p.Prime] : PadicAlgCl p → AlgebraicClosure (ZMod p) := sorry

/-- The Teichmüller lift `𝔽̄_p^× → ℚ̄_p^×`. Owner: ArithmeticGaloisRepresentations:R01.1. -/
def teichmullerLift (p : ℕ) [Fact p.Prime] :
    (AlgebraicClosure (ZMod p))ˣ →* (PadicAlgCl p)ˣ := sorry

/-- The fundamental character of niveau `n` on the inertia group at `v`, with values in `𝔽̄_l`
(`ω` for `n = 1`, `ω₂` for `n = 2`). Owner: ArithmeticGaloisRepresentations:R01.1. -/
def fundamentalCharacter {F : Type u} [Field F] [NumberField F] (l n : ℕ) [Fact l.Prime]
    (v : FinitePrime F) : inertiaGroup v →* (AlgebraicClosure (ZMod l))ˣ := sorry

/-- The `p`-adic cyclotomic character with values in `ℚ̄_p`. -/
noncomputable def cyclotomicCharacterQbarp (F : Type u) [Field F] (p : ℕ) [Fact p.Prime] :
    GaloisGroup F →* (PadicAlgCl p)ˣ :=
  (Units.map ((algebraMap ℚ_[p] (PadicAlgCl p)).comp PadicInt.Coe.ringHom).toMonoidHom).comp
    (cyclotomicCharacterPadic F p)

/-- The `l`-adic cyclotomic character with values in the completion `M_λ` of a number field.
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def cyclotomicCharacterAt (E : Type u) [Field E] {M : Type u} [Field M] [NumberField M]
    (lam : FinitePrime M) : GaloisGroup E →* (lam.adicCompletion M)ˣ := sorry

/-- Reduction from the valuation ring of `M_λ` to `𝓞_M/λ` (any value off the valuation ring).
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def adicResidue {M : Type u} [Field M] [NumberField M] (lam : FinitePrime M) :
    lam.adicCompletion M → 𝓞 M ⧸ lam.asIdeal := sorry

/-- The exponent of the conductor of the central character of `π` at `v`.
Owner: GL2AutomorphicRepresentationsAndTransfer:R17.5. -/
def CuspidalGL2.centralConductorExponent {F : Type u} [Field F] [NumberField F]
    (π : CuspidalGL2 F) (v : FinitePrime F) : ℕ := sorry

/-- The restriction to inertia of the Weil–Deligne representation `WD_ι(π_v)`.
Owner: AutomorphicGaloisRepresentations:R19.5 (local–global compatibility). -/
def CuspidalGL2.wdInertia {F : Type u} [Field F] [NumberField F] (π : CuspidalGL2 F)
    (p : ℕ) [Fact p.Prime] (ι : π.coefficientField →+* PadicAlgCl p) (v : FinitePrime F) :
    inertiaGroup v →* GL2 (PadicAlgCl p) := sorry

/-- The type (Snowden's A/B/C) of `π` at a place above `p`, read from `π_v`.
Owner: GL2ModularityLifting:R22.5. -/
def CuspidalGL2.localType {F : Type u} [Field F] [NumberField F] (π : CuspidalGL2 F)
    (v : FinitePrime F) : KWLocalType := sorry

/-- The type of finite flat models over `𝓞_{F_v}` of `ρ̄|_{G_v}`.
Owner: LocalGaloisDeformationRings:R08.2. -/
def FiniteFlatModel {F : Type u} [Field F] [NumberField F] {k : Type u} [Field k]
    (ρ : GaloisGroup F →* GL2 k) (v : FinitePrime F) : Type u := sorry

/-- The induced representation `Ind_{G_L}^{G_K} ψ` of a character, in the basis `{1, c}`.
Owner: ArithmeticGaloisRepresentations:G7. -/
def inducedCharacter {K : Type u} [Field K] (L : IntermediateField K (AlgebraicClosure K))
    {A : Type u} [CommRing A] (ψ : GaloisGroup L →* Aˣ) : GaloisGroup K →* GL2 A := sorry

/-- Hecke algebras of definite quaternionic forms of weight `(k⃗, w)` and level `U_H(𝔫)` over `F`
(Taylor's `h_{(k⃗,w⃗),ψ}(U_H(𝔫))`), as `ℤ_l`-algebras.
Owner: GL2AutomorphicRepresentationsAndTransfer:R17.3 with AutomorphicGaloisRepresentations:R19.2. -/
def QuaternionicHeckeAlgebra (F : Type u) [Field F] [NumberField F] (l : ℕ) [Fact l.Prime]
    (weight : (F →+* ℝ) → ℕ) (w : ℤ) (level : Ideal (𝓞 F)) : Type := sorry

section HeckeInstances
variable {F : Type u} [Field F] [NumberField F] {l : ℕ} [Fact l.Prime]
  {weight : (F →+* ℝ) → ℕ} {w : ℤ} {level : Ideal (𝓞 F)}
noncomputable instance : CommRing (QuaternionicHeckeAlgebra F l weight w level) := sorry
noncomputable instance : Algebra ℤ_[l] (QuaternionicHeckeAlgebra F l weight w level) := sorry

/-- The Hecke operator `T_x`. Owner: GL2AutomorphicRepresentationsAndTransfer:R17.3. -/
def QuaternionicHeckeAlgebra.heckeT (x : FinitePrime F) :
    QuaternionicHeckeAlgebra F l weight w level := sorry

/-- The Hecke operator `S_x`. Owner: GL2AutomorphicRepresentationsAndTransfer:R17.3. -/
def QuaternionicHeckeAlgebra.heckeS (x : FinitePrime F) :
    QuaternionicHeckeAlgebra F l weight w level := sorry

/-- The operator `𝐔_{ϖ_x}` at `x | 𝔫`. Owner: GL2AutomorphicRepresentationsAndTransfer:R17.3. -/
def QuaternionicHeckeAlgebra.heckeU (x : FinitePrime F) :
    QuaternionicHeckeAlgebra F l weight w level := sorry
end HeckeInstances

/-- Taylor's mod-`l` Hecke algebra `h_{η̄^i,𝔽̄_l,ψ}(U₀(𝔫, l))` of definite quaternionic forms
with character `η̄^i` at `l`. Owner: GL2AutomorphicRepresentationsAndTransfer:R17.3. -/
def QuaternionicHeckeAlgebraModL (F : Type u) [Field F] [NumberField F] (l : ℕ) [Fact l.Prime]
    (i : ℕ) (level : Ideal (𝓞 F)) : Type := sorry

noncomputable instance {F : Type u} [Field F] [NumberField F] {l : ℕ} [Fact l.Prime] {i : ℕ}
    {level : Ideal (𝓞 F)} : CommRing (QuaternionicHeckeAlgebraModL F l i level) := sorry

end Suppliers

section FieldConditions

/-- The place `w` of `L` lies above the place `v` of `F`. -/
def FinitePrime.LiesAbove {F : Type u} [Field F] [NumberField F]
    {L : IntermediateField F (AlgebraicClosure F)} [NumberField L]
    (w : FinitePrime L) (v : FinitePrime F) : Prop :=
  w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 L)) = v.asIdeal

/-- The place `v` of `F` splits completely in `L`: every place above it is unramified with the
same residue field. -/
def SplitsCompletelyIn {F : Type u} [Field F] [NumberField F] (v : FinitePrime F)
    (L : IntermediateField F (AlgebraicClosure F)) [NumberField L] : Prop :=
  ∀ w : FinitePrime L, w.LiesAbove v → w.asIdeal.ramificationIdx (𝓞 F) = 1 ∧ w.norm = v.norm

/-- The place `v` of `F` is unramified in `L`. -/
def UnramifiedIn {F : Type u} [Field F] [NumberField F] (v : FinitePrime F)
    (L : IntermediateField F (AlgebraicClosure F)) [NumberField L] : Prop :=
  ∀ w : FinitePrime L, w.LiesAbove v → w.asIdeal.ramificationIdx (𝓞 F) = 1

/-- `ρ̄|_{G_v}` is irreducible over `k̄`: no conjugate is upper triangular on the decomposition
group. -/
def IsLocallyIrreducibleAt {F : Type u} [Field F] [NumberField F] {k : Type u} [Field k]
    (ρ : GaloisGroup F →* GL2 k) (v : FinitePrime F) : Prop :=
  ¬ ∃ χ₁ χ₂ : GaloisGroup F →* (AlgebraicClosure k)ˣ,
    IsUpperTriangularAt ((Matrix.GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k))).comp ρ)
      v χ₁ χ₂

/-- `ρ̄` is ordinary at `v`: upper triangular on `G_v` with unramified quotient character. -/
def IsOrdinaryResidualAt {F : Type u} [Field F] [NumberField F] {k : Type u} [Field k]
    (ρ : GaloisGroup F →* GL2 k) (v : FinitePrime F) : Prop :=
  ∃ χ₁ χ₂ : GaloisGroup F →* kˣ, IsUpperTriangularAt ρ v χ₁ χ₂ ∧ CharIsUnramifiedAt χ₂ v

/-- `ρ|_{G_v}` is diagonal with characters `χ₁, χ₂` after conjugation. -/
def IsDiagonalAt {F : Type u} [Field F] [NumberField F] {A : Type u} [CommRing A]
    (ρ : GaloisGroup F →* GL2 A) (v : FinitePrime F) (χ₁ χ₂ : GaloisGroup F →* Aˣ) : Prop :=
  ∃ P : GL2 A, ∀ g ∈ decompositionGroup v,
    ((P⁻¹ * ρ g * P : GL2 A) : Matrix (Fin 2) (Fin 2) A) =
      Matrix.diagonal ![(χ₁ g : A), (χ₂ g : A)]

/-- The restriction to inertia at `v` is `ω₂^a ⊕ ω₂^{l a}` over `𝔽̄_l` (niveau two). -/
def HasNiveauTwoInertia {F : Type u} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime]
    (ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod l))) (v : FinitePrime F) (a : ℕ) : Prop :=
  ∃ P : GL2 (AlgebraicClosure (ZMod l)), ∀ g : inertiaGroup v,
    ((P⁻¹ * ρ g * P : GL2 _) : Matrix (Fin 2) (Fin 2) _) = Matrix.diagonal ![
      ((fundamentalCharacter l 2 v g ^ a : (AlgebraicClosure (ZMod l))ˣ) :
        AlgebraicClosure (ZMod l)),
      ((fundamentalCharacter l 2 v g ^ (l * a) : (AlgebraicClosure (ZMod l))ˣ) :
        AlgebraicClosure (ZMod l))]

/-- `ρ̄|_{G_F}` arises from `π` through the reduction `ι` (`ArisesFrom` with `ι` fixed, so that
local conditions on `π` can refer to the same reduction). -/
def ArisesFromVia {F : Type u} [Field F] [NumberField F] {k : Type u} [Field k] (p : ℕ)
    [Fact p.Prime] (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup F →* GL2 k)
    (π : CuspidalGL2 F) (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)) : Prop :=
  ∃ S : Finset (FinitePrime F), ∀ v ∉ S,
    ((ρ (frobLift v) : Matrix (Fin 2) (Fin 2) k).charpoly).map j = (π.heckePolynomial v).map ι

end FieldConditions

/-! ## R23.2 — Auxiliary characters and moduli -/

/-- Taylor's auxiliary data for the ordinary-at-`l` construction (Taylor, Remarks on a conjecture
of Fontaine and Mazur, §1, printed pp. 7–9, with the corrections of Taylor 2006, pp. 776–777).
For a base field `F ⊆ Ω`, the group `G = G_F`, a local group `D` and coefficients `k`:
the original prime `l`, the auxiliary prime `p ≠ l`, the quadratic extension `L/F` with
`L ⊄ F(ζ_p)`, the coefficient fields `N ⊇ M` (with `M` the maximal real subfield of `N`), the
index-two subgroup `H = G_L`, the character `ψ` of `H` with its conjugate `ψ^c`, distinct on the
decomposition group at the chosen place above `l`, and `Ind ψ` with determinant the cyclotomic
character. Splitting at the places above `l` and `p` is `TaylorAuxiliaryData.split`. -/
structure TaylorAuxiliaryData (F Ω G D k : Type u)
    [Field F] [Field Ω] [Algebra F Ω] [Group G] [Group D] [Field k]
    (cyclotomic : G →* kˣ) where
  l : ℕ
  residual_prime : l.Prime
  p : ℕ
  prime : p.Prime
  ne_l : p ≠ l
  L : IntermediateField F Ω
  cyclotomicField : IntermediateField F Ω
  notCyclotomic : ¬ L ≤ cyclotomicField
  N : FiniteExtension ℚ
  M : FiniteExtension ℚ
  realCoefficientEmbedding : M.carrier →+* N.carrier
  H : Subgroup G
  index_two : H.index = 2
  psi : H →* kˣ
  psiConjugate : H →* kˣ
  conjugation : H ≃* H
  conjugation_involutive : Function.Involutive conjugation
  conjugate_eq : psiConjugate = psi.comp conjugation.toMonoidHom
  /-- The full local decomposition group at the chosen place above `l`. Distinction on
  inertia is stronger and fails when the two local characters are both unramified. -/
  decomposition : D →* H
  distinguished : psi.comp decomposition ≠ psiConjugate.comp decomposition
  induced : G →* GL2 k
  determinant : Matrix.GeneralLinearGroup.det.comp induced = cyclotomic

namespace TaylorAuxiliaryData
variable {F Ω G D k : Type u} [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] {cyclotomic : G →* kˣ}

/-- `det Ind_{G_L}^{G_F} ψ = ε_p`. -/
lemma det_ind (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    Matrix.GeneralLinearGroup.det.comp A.induced = cyclotomic := by
  sorry

/-- `ψ̄|_{G_{v₁}} ≠ ψ̄^c|_{G_{v₁}}` on the full decomposition group. -/
lemma psi_ne_conj (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    A.psi.comp A.decomposition ≠ A.psiConjugate.comp A.decomposition := by
  sorry

/-- The auxiliary prime differs from the residual prime. -/
lemma prime_ne_l (A : TaylorAuxiliaryData F Ω G D k cyclotomic) : A.p ≠ A.l := by
  sorry

/-- Conjugating twice returns `ψ`. -/
lemma conj_conj (A : TaylorAuxiliaryData F Ω G D k cyclotomic) :
    A.psiConjugate.comp A.conjugation.toMonoidHom = A.psi := by
  sorry

/-- Pointwise form of `det_ind`. -/
lemma det_ind_apply (A : TaylorAuxiliaryData F Ω G D k cyclotomic) (g : G) :
    Matrix.GeneralLinearGroup.det (A.induced g) = cyclotomic g := by
  sorry

/-- Splitting of the auxiliary quadratic field (Taylor, printed p. 8; Taylor 2006, p. 777):
`L` is totally imaginary and every place of `F` above `l` or above `p` splits in `L`. -/
theorem split {F D k : Type} [Field F] [NumberField F] [Group D] [Field k]
    {cyc : GaloisGroup F →* kˣ}
    (A : TaylorAuxiliaryData F (AlgebraicClosure F) (GaloisGroup F) D k cyc) [NumberField A.L] :
    NumberField.IsTotallyComplex A.L ∧
      ∀ v : FinitePrime F, (v.LiesOver A.l ∨ v.LiesOver A.p) → SplitsCompletelyIn v A.L := by
  sorry

/-- Existence of Taylor's auxiliary data (Taylor, printed pp. 7–9; Taylor 2006, pp. 776–777).
Let `l` be odd, `F` totally real and `ρ̄ : G_F → GL₂(k)` continuous with insoluble image, of the
shape `(ε χ_v⁻¹, *; 0, χ_v)` at every `v | l` and with `det ρ̄ = ε` (the 2006 correction).
For a place `v | l` there are an auxiliary prime `p ≠ l` and data with `ψ` valued in `ℚ̄_p`,
distinguished on the decomposition group at `v` and with `det Ind ψ = ε_p`. The prime `p` comes
from Chebotarev (including the exclusion `p ∤ q_v − 1` when `χ_v² = 1`), `ψ` from
`taylorLemma11`, and `N/N₀` is a CM extension in which the places above `l` split. -/
theorem «exists» {F : Type} [Field F] [NumberField F] [NumberField.IsTotallyReal F]
    {k : Type} [Field k] [Finite k] (l : ℕ) [Fact l.Prime] [CharP k l] (hl : l ≠ 2)
    (ρ : GaloisGroup F →* GL2 k) (hρ : IsContinuousResidual ρ) (hins : ¬ Group.IsSolvable ρ.range)
    (hshape : ∀ v : FinitePrime F, v.LiesOver l → ∃ χ : GaloisGroup F →* kˣ,
      IsUpperTriangularAt ρ v
        (((Units.map (ZMod.castHom (dvd_refl l) k).toMonoidHom).comp
          (cyclotomicCharacterModP F l)) * χ⁻¹) χ)
    (hdet : Matrix.GeneralLinearGroup.det.comp ρ =
      (Units.map (ZMod.castHom (dvd_refl l) k).toMonoidHom).comp (cyclotomicCharacterModP F l))
    (v : FinitePrime F) (hv : v.LiesOver l) :
    ∃ (p : ℕ) (_ : Fact p.Prime) (A : TaylorAuxiliaryData F (AlgebraicClosure F)
        (GaloisGroup F) (decompositionGroup v) (PadicAlgCl p) (cyclotomicCharacterQbarp F p)),
      A.l = l ∧ A.p = p := by
  sorry

end TaylorAuxiliaryData

/-- taylorAux_N0_l5: for `l = 5` and `k = 𝔽₅` the field `N₀ = ℚ(ζ₄, √−19)` uses the discriminant
`1 − 4·5 = −19`, prime to `5`, so `5` is unramified in `N₀`. -/
example : (1 : ℤ) - 4 * 5 = -19 ∧ ¬ (5 : ℤ) ∣ (1 - 4 * 5) := by
  sorry

/-- taylorAux_det_needed: auxiliary data cannot have a determinant other than the cyclotomic
character; the alternating pairing on `V_λ` needs it. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon)
    (h : Matrix.GeneralLinearGroup.det.comp A.induced ≠ epsilon) : False := by
  sorry

/-- taylorAux_alpha_norm: for `α_w` of algebraic norm `p`, `det diag(α_w, α_w^c) = p`; this is
the algebraic norm, not the `p`-adic cyclotomic value on a Frobenius lift. -/
example (alpha : ℂ) (p : ℕ) (h : alpha * star alpha = p) :
    Matrix.det !![alpha, 0; 0, star alpha] = p := by
  sorry

/-- taylorAux_not_in_cyclotomic: `L ⊄ F(ζ_p)` is part of the data. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon)
    (h : A.L ≤ A.cyclotomicField) : False := by
  sorry

/-- taylorAux_local_decomposition: some element of the full decomposition group separates
`ψ` from `ψ^c`. -/
example (F Ω G D k : Type u) [Field F] [Field Ω] [Algebra F Ω]
    [Group G] [Group D] [Field k] (epsilon : G →* kˣ)
    (A : TaylorAuxiliaryData F Ω G D k epsilon) :
    ∃ g : D, A.psi (A.decomposition g) ≠ A.psiConjugate (A.decomposition g) := by
  sorry

/-- taylorAux_beta_norm: for `l = 5`, `f_v = 1` and `a² − a + 5 = 0`, `a^c = 1 − a`, the norm
`a a^c = q_v = 5` differs from every auxiliary prime `p ≠ 5`. -/
example (a : ℂ) (ha : a ^ 2 - a + 5 = 0)
    (hc : star a = 1 - a) (p : ℕ) (hp : p ≠ 5) :
    a * star a = 5 ∧ a * star a ≠ p := by
  sorry

/-- Taylor's Lemma 1.1 (Remarks on a conjecture of Fontaine and Mazur, printed pp. 5–6):
characters of a CM quadratic extension with prescribed local reductions. Let `K` be totally real,
`L/K` totally imaginary quadratic with every place above `p` split, `S` a finite set of places of
`K` split in `L` containing those above `p`, and `S_L` one place of `L` above each. Let
`φ : G_K → ℚ̄_p^×` be continuous, totally odd and of the form `ε_p^n` times a finite-order
character, and `ψ̄_x` a character of `G_{L_x}` for `x ∈ S_L`. Then there is a continuous
`ψ : G_L → ℚ̄_p^×` reducing to `ψ̄_x` on each `G_{L_x}` with `det Ind ψ = φ`. The final step uses
Lemma 2.1 of Taylor's icosahedral paper II. Omitted hypothesis: the finite ramification of
`ψ|_{G_{L_x}}` (owner ClassFieldTheory, local Artin map). -/
theorem taylorLemma11 (p : ℕ) [Fact p.Prime] {K : Type} [Field K] [NumberField K]
    [NumberField.IsTotallyReal K] (L : IntermediateField K (AlgebraicClosure K)) [NumberField L]
    (hquad : Module.finrank K L = 2) (hL : NumberField.IsTotallyComplex L)
    (S : Finset (FinitePrime K)) (hSp : ∀ v : FinitePrime K, v.LiesOver p → v ∈ S)
    (hSsplit : ∀ v ∈ S, SplitsCompletelyIn v L)
    (SL : Finset (FinitePrime L)) (hSL : ∀ v ∈ S, ∃! x, x ∈ SL ∧ x.LiesAbove v)
    (φ : GaloisGroup K →* (PadicAlgCl p)ˣ) (hφodd : ∀ τ : K →+* ℝ, φ (complexConjugation τ) = -1)
    (n : ℤ) (hφ : ∃ m : ℕ, 0 < m ∧ ∀ g, (φ * (cyclotomicCharacterQbarp K p) ^ (-n)) g ^ m = 1)
    (ψbar : ∀ x ∈ SL, GaloisGroup L →* (AlgebraicClosure (ZMod p))ˣ) :
    ∃ ψ : GaloisGroup L →* (PadicAlgCl p)ˣ,
      Continuous (fun g => ((ψ g : (PadicAlgCl p)ˣ) : PadicAlgCl p)) ∧
      (∀ x (hx : x ∈ SL), ∀ g ∈ decompositionGroup x,
        padicResidue p (ψ g) = (ψbar x hx g : AlgebraicClosure (ZMod p))) ∧
      Matrix.GeneralLinearGroup.det.comp (inducedCharacter L ψ) = φ := by
  sorry

/-- The twisted Hilbert moduli application (Taylor, printed pp. 9–12; KW II §6): for Taylor's
auxiliary data, apply `moretBaillyThreeLocalConditions` to the geometrically irreducible
component of the twisted Hilbert–Blumenthal moduli scheme supplied by
HilbertModularVarietiesAndShimuraCurves:H6, with its local opens at `l`, `p` and the real places.
The result is a totally real Galois `E/F`, split above `l` and `p`, linearly disjoint from the
avoidance field, and a Hilbert–Blumenthal abelian variety `A/E` with `A[λ] ≅ ρ̄|_{G_E}` and
`A[℘] ≅ (Ind ψ̄)|_{G_E}` after the given embeddings of residue fields. -/
theorem localPointsTwistedHilbertModuli {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] {D : Type} [Group D] (p l : ℕ) [Fact p.Prime] [Fact l.Prime]
    {cyc : GaloisGroup F →* (AlgebraicClosure (ZMod p))ˣ}
    (aux : TaylorAuxiliaryData F (AlgebraicClosure F) (GaloisGroup F) D
      (AlgebraicClosure (ZMod p)) cyc) (haux : aux.p = p ∧ aux.l = l)
    {k : Type} [Field k] [CharP k l] (ρ : GaloisGroup F →* GL2 k)
    (hdet : Matrix.GeneralLinearGroup.det.comp ρ =
      (Units.map (ZMod.castHom (dvd_refl l) k).toMonoidHom).comp (cyclotomicCharacterModP F l))
    (hins : ¬ Group.IsSolvable ρ.range)
    (M : Type) [Field M] [NumberField M] [NumberField.IsTotallyReal M]
    (lam wp : FinitePrime M) (hlam : lam.LiesOver l) (hwp : wp.LiesOver p)
    (jl : 𝓞 M ⧸ lam.asIdeal →+* k)
    (jp : 𝓞 M ⧸ wp.asIdeal →+* AlgebraicClosure (ZMod p))
    (avoid : IntermediateField F (AlgebraicClosure F)) (havoid : FiniteDimensional F avoid) :
    ∃ (E : IntermediateField F (AlgebraicClosure F)) (_ : NumberField E),
      NumberField.IsTotallyReal E ∧ IsGalois F E ∧ E.LinearDisjoint avoid ∧
      (∀ v : FinitePrime F, (v.LiesOver l ∨ v.LiesOver p) → SplitsCompletelyIn v E) ∧
      ∃ A : HBAV E M,
        (∃ P : GL2 k, ∀ g, Matrix.GeneralLinearGroup.map jl (A.torsionRep lam g) =
          P * restrictRep ρ (algebraMap F E) g * P⁻¹) ∧
        (∃ P : GL2 (AlgebraicClosure (ZMod p)), ∀ g,
          Matrix.GeneralLinearGroup.map jp (A.torsionRep wp g) =
            P * restrictRep aux.induced (algebraMap F E) g * P⁻¹) := by
  sorry

/-- The restricted auxiliary moduli application (Snowden, §5 and §8; BCGP §9.1): for finite
totally real `F₁/F` and the smooth geometrically connected auxiliary scheme over `F₁` supplied
by H6, apply Moret–Bailly over `F` to the Weil restriction `Res_{F₁/F} X` (owner
AbelianSchemesAndArithmeticModuli:A6), whose `F_v`-points are the products of the `X(F_{1,w})`.
The result is a totally real Galois `F'/F`, linearly disjoint from `F₁ F_avoid`, and an auxiliary
abelian variety over `F₁F'` with the two prescribed torsion representations. -/
theorem restrictedAuxiliaryModuli {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (F₁ avoid : IntermediateField F (AlgebraicClosure F))
    [NumberField F₁] (hF₁ : NumberField.IsTotallyReal F₁) (havoid : FiniteDimensional F avoid)
    (p q : ℕ) [Fact p.Prime] [Fact q.Prime]
    (r : GaloisGroup F₁ →* GL2 (AlgebraicClosure (ZMod q)))
    (r' : GaloisGroup F₁ →* GL2 (AlgebraicClosure (ZMod p)))
    (hr : Matrix.GeneralLinearGroup.det.comp r =
      (Units.map (ZMod.castHom (dvd_refl q) (AlgebraicClosure (ZMod q))).toMonoidHom).comp
        (cyclotomicCharacterModP F₁ q))
    (hr' : Matrix.GeneralLinearGroup.det.comp r' =
      (Units.map (ZMod.castHom (dvd_refl p) (AlgebraicClosure (ZMod p))).toMonoidHom).comp
        (cyclotomicCharacterModP F₁ p))
    (M : Type) [Field M] [NumberField M] (lam wp : FinitePrime M)
    (jl : 𝓞 M ⧸ lam.asIdeal →+* AlgebraicClosure (ZMod q))
    (jp : 𝓞 M ⧸ wp.asIdeal →+* AlgebraicClosure (ZMod p)) :
    ∃ (F' : IntermediateField F (AlgebraicClosure F)) (_ : NumberField F')
      (_ : NumberField ↥(F₁ ⊔ F')),
      NumberField.IsTotallyReal F' ∧ IsGalois F F' ∧ F'.LinearDisjoint ↥(F₁ ⊔ avoid) ∧
      ∃ A : HBAV ↥(F₁ ⊔ F') M,
        (∃ P, ∀ g, Matrix.GeneralLinearGroup.map jl (A.torsionRep lam g) =
          P * restrictRep r (IntermediateField.inclusion le_sup_left).toRingHom g * P⁻¹) ∧
        (∃ P, ∀ g, Matrix.GeneralLinearGroup.map jp (A.torsionRep wp g) =
          P * restrictRep r' (IntermediateField.inclusion le_sup_left).toRingHom g * P⁻¹) := by
  sorry

/-! ## R23.3 — Residual potential modularity -/

/-- Taylor's Lemma 1.5 (printed p. 14): the `λ`-adic Tate module of the auxiliary abelian
variety is ordinary at unramified places above `l`. Let `v | l` be unramified in `F`, `x | v` a
place of `E`, and suppose `χ_v²|_{I_v} = ε^n|_{I_v}` with `0 ≤ n < l − 1`, and `n ≠ 1` when
`ρ̄|_{G_v}` is semisimple. Then `G_x` acts on `V_λ A` by `(ε χ'⁻¹, *; 0, χ')` with `χ'` a lift of
`χ_v`. Uses Edixhoven §5 and CDT Appendix B (imports). Omitted hypothesis: tame ramification of
`χ'` (owner ArithmeticGaloisRepresentations:R01.1). -/
theorem taylorLemma15 {E M : Type} [Field E] [NumberField E] [Field M] [NumberField M]
    (l : ℕ) [Fact l.Prime] (A : HBAV E M) (lam : FinitePrime M)
    [CharP (𝓞 M ⧸ lam.asIdeal) l] (x : FinitePrime E) (hx : x.LiesOver l) (hxun : x.asIdeal.ramificationIdx ℤ = 1)
    (χ : GaloisGroup E →* (𝓞 M ⧸ lam.asIdeal)ˣ)
    (hshape : IsUpperTriangularAt (A.torsionRep lam) x
      (((Units.map (ZMod.castHom (dvd_refl l) (𝓞 M ⧸ lam.asIdeal)).toMonoidHom).comp
        (cyclotomicCharacterModP E l)) * χ⁻¹) χ)
    (n : ℕ) (hn : n < l - 1)
    (hχ : ∀ g ∈ inertiaGroup x, χ g ^ 2 =
      (Units.map (ZMod.castHom (dvd_refl l) (𝓞 M ⧸ lam.asIdeal)).toMonoidHom)
        (cyclotomicCharacterModP E l g) ^ n)
    (hss : (∃ P : GL2 (𝓞 M ⧸ lam.asIdeal), ∀ g ∈ decompositionGroup x,
      ((P⁻¹ * A.torsionRep lam g * P : GL2 _) :
        Matrix (Fin 2) (Fin 2) (𝓞 M ⧸ lam.asIdeal)) 0 1 = 0) → n ≠ 1) :
    ∃ χ' : GaloisGroup E →* (lam.adicCompletion M)ˣ,
      IsUpperTriangularAt (A.tateRep lam) x (cyclotomicCharacterAt E lam * χ'⁻¹) χ' ∧
      ∀ g ∈ decompositionGroup x, adicResidue lam (χ' g) = χ g := by
  sorry

/-- Modularity of the auxiliary abelian variety and transfer to `ρ̄` (Taylor, proof of
Theorem 1.6, printed pp. 14–15): for the abelian variety `A/E` of
`localPointsTwistedHilbertModuli`, with `E/F` totally real and split above `p`, if the residual
representation `A[℘]` (the restriction of `Ind ψ̄`, modular by automorphic induction) is
absolutely irreducible and arises from a cuspidal representation, then `A` is semistable and
`T_℘ A` ordinary above `p`, so `T_℘ A` is modular by the nearly ordinary lifting theorem
(OrdinaryAutomorphicFormsAndModularityLifting:R21.5, whose printed proof has a gap in this
induced-from-CM case), hence `A` is modular and `ρ̄|_{G_E} ≅ A[λ]` arises from a cuspidal
representation. -/
theorem auxiliaryModularityTransfer {E M : Type} [Field E] [NumberField E]
    [NumberField.IsTotallyReal E] [Field M] [NumberField M] (l p : ℕ) [Fact l.Prime] [Fact p.Prime]
    (A : HBAV E M) (lam wp : FinitePrime M) (hlam : lam.LiesOver l) (hwp : wp.LiesOver p)
    (hsplit : SplitsCompletelyAbove E p)
    (jl : 𝓞 M ⧸ lam.asIdeal →+* AlgebraicClosure (ZMod l))
    (jp : 𝓞 M ⧸ wp.asIdeal →+* AlgebraicClosure (ZMod p))
    (hirr : IsAbsolutelyIrreducible
      ((Matrix.GeneralLinearGroup.map jp).comp (A.torsionRep wp)))
    (hmod : ∃ π : CuspidalGL2 E,
      ArisesFrom p (RingHom.id _) ((Matrix.GeneralLinearGroup.map jp).comp (A.torsionRep wp)) π) :
    A.IsModular ∧ ∃ π : CuspidalGL2 E,
      ArisesFrom l (RingHom.id _) ((Matrix.GeneralLinearGroup.map jl).comp (A.torsionRep lam)) π := by
  sorry

/-- Taylor's Theorem 1.6 (printed p. 15, with the corrected proof of Taylor 2006): potential
modularity of residual representations ordinary above `l`. Let `l` be odd, `F` totally real and
`ρ̄ : G_F → GL₂(k)` continuous, irreducible and totally odd, of the shape `(ε χ_v⁻¹, *; 0, χ_v)` at
every `v | l`. Then there are a finite Galois totally real `E/F` in which every place above `l`
splits completely and a cuspidal `π` of `GL₂(𝔸_E)` with `ρ̄|_{G_E}` arising from `π`.
Corollary 1.7 (stated without proof in the preprint, a recorded gap) removes the ordinary
hypothesis at the cost of residue degree at most two above `l`. Omitted conclusion: the ordinary
shape `(ε χ'⁻¹, *; 0, χ')` of `ρ_{π,λ'}` at the unramified places above `l` (the "moreover" clause,
from `taylorLemma15`), which needs the coefficient place `λ'` of `π`. -/
theorem taylorOrdinaryPotentialResidual {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (l : ℕ) [Fact l.Prime] (hl : l ≠ 2) {k : Type} [Field k]
    [Finite k] [CharP k l] (j : k →+* AlgebraicClosure (ZMod l)) (ρ : GaloisGroup F →* GL2 k)
    (hcont : IsContinuousResidual ρ) (hirr : (toRepresentation ρ).IsIrreducible)
    (hodd : IsTotallyOdd ρ)
    (hshape : ∀ v : FinitePrime F, v.LiesOver l → ∃ χ : GaloisGroup F →* kˣ,
      IsUpperTriangularAt ρ v
        (((Units.map (ZMod.castHom (dvd_refl l) k).toMonoidHom).comp
          (cyclotomicCharacterModP F l)) * χ⁻¹) χ) :
    ∃ (E : IntermediateField F (AlgebraicClosure F)) (_ : NumberField E),
      NumberField.IsTotallyReal E ∧ IsGalois F E ∧
      (∀ v : FinitePrime F, v.LiesOver l → SplitsCompletelyIn v E) ∧
      ∃ π : CuspidalGL2 E, ArisesFrom l j (restrictRep ρ (algebraMap F E)) π := by
  sorry

/-- Taylor 2006, Proposition 4.1 and Corollary 4.6 (pp. 745–750): potential modularity when
`ρ̄|_{G_l}` is irreducible. Let `l > 2` and `ρ̄ : G_ℚ → GL₂(𝔽̄_l)` continuous and odd with
`ρ̄|_{I_l} ≅ ω₂^{k−1} ⊕ ω₂^{l(k−1)}`, `2 ≤ k ≤ l`. There are a Galois totally real `F` of even
degree in which `l` splits completely and a cuspidal `π` of weight two with `ρ̄|_{G_F} ≅ ρ̄_{π,λ}`,
such that at every `x | l` the Weil–Deligne inertial restriction of `π_x` is the Teichmüller lift
of `ω₂^{k−(l+1)} ⊕ ω₂^{lk−(l+1)}`, and the central character of `π` is unramified away from `l`.
The proof imports Skinner–Wiles and complex multiplication; the exceptional CM lifting case is
a recorded gap. -/
theorem taylorNiveauTwoPotentialResidual (l : ℕ) [Fact l.Prime] (hl : l ≠ 2)
    (ρ : GaloisGroup ℚ →* GL2 (AlgebraicClosure (ZMod l))) (hcont : IsContinuousResidual ρ)
    (hodd : IsTotallyOdd ρ) (k : ℕ) (hk : 2 ≤ k ∧ k ≤ l)
    (hniv : ∀ v : FinitePrime ℚ, v.LiesOver l → HasNiveauTwoInertia l ρ v (k - 1)) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      NumberField.IsTotallyReal F ∧ IsGalois ℚ F ∧ Even (Module.finrank ℚ F) ∧
      SplitsCompletelyAbove F l ∧
      ∃ (π : CuspidalGL2 F) (ι : π.coefficientField →+* PadicAlgCl l),
        π.HasParallelWeight 2 ∧
        ArisesFrom l (RingHom.id _) (restrictRep ρ (algebraMap ℚ F)) π ∧
        (∀ x : FinitePrime F, ¬ x.LiesOver l → π.centralConductorExponent x = 0) ∧
        ∀ x : FinitePrime F, x.LiesOver l → ∃ P : GL2 (PadicAlgCl l), ∀ g : inertiaGroup x,
          ((P⁻¹ * π.wdInertia l ι x g * P : GL2 _) : Matrix (Fin 2) (Fin 2) _) =
            Matrix.diagonal ![
              ((teichmullerLift l (fundamentalCharacter l 2 x g ^ ((k : ℤ) - (l + 1))) :
                (PadicAlgCl l)ˣ) : PadicAlgCl l),
              ((teichmullerLift l (fundamentalCharacter l 2 x g ^ ((l * k : ℤ) - (l + 1))) :
                (PadicAlgCl l)ˣ) : PadicAlgCl l)] := by
  sorry

attribute [local instance] RingHom.ker_isPrime in
/-- Taylor 2006, Lemma 1.3 (pp. 740–742): definite quaternionic forms and their Galois
representations. For `F` totally real of even degree and weight `(k⃗, w)` with every `k_τ ≥ 2`,
the Hecke algebra `h` of the definite quaternion algebra ramified exactly at infinity carries,
at every maximal ideal `𝔪` whose residual trace data come from an absolutely irreducible
`ρ̄_𝔪`, a continuous representation `ρ_𝔪 : G_F → GL₂(h_𝔪)` unramified away from `𝔫l` with
`tr ρ_𝔪(Frob_x) = T_x`. Jacquet–Langlands (R17.3), the Galois representations of Hilbert forms
(R19.2) and Carayol's trace theorem (GlobalGaloisDeformations:R04.2) are imported. Omitted
hypothesis: the central character `ψ` and the determinant `ε(ψ ∘ Art⁻¹)` (owner R19.2). -/
theorem quaternionicHeckeGaloisRealisation {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (heven : Even (Module.finrank ℚ F)) (l : ℕ) [Fact l.Prime]
    (weight : (F →+* ℝ) → ℕ) (hweight : ∀ τ, 2 ≤ weight τ) (w : ℤ) (level : Ideal (𝓞 F))
    (ι : QuaternionicHeckeAlgebra F l weight w level →+* AlgebraicClosure (ZMod l))
    (ρbar : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod l)))
    (hρbar : ∀ x : FinitePrime F, ¬ x.LiesOver l → ¬ level ≤ x.asIdeal →
      Matrix.trace (ρbar (frobLift x) : Matrix (Fin 2) (Fin 2) _) =
        ι (QuaternionicHeckeAlgebra.heckeT x))
    (hirr : IsAbsolutelyIrreducible ρbar) :
    ∃ ρ : GaloisGroup F →* GL2 (Localization.AtPrime (RingHom.ker ι)),
      ∀ x : FinitePrime F, ¬ x.LiesOver l → ¬ level ≤ x.asIdeal →
        IsUnramifiedAt ρ x ∧
        Matrix.trace (ρ (frobLift x) : Matrix (Fin 2) (Fin 2) _) =
          algebraMap (QuaternionicHeckeAlgebra F l weight w level)
            (Localization.AtPrime (RingHom.ker ι)) (QuaternionicHeckeAlgebra.heckeT x) := by
  sorry

/-- Taylor 2006, Lemma 1.4 and Corollary 1.5 (pp. 742–744): the Fontaine–Laffaille shape at
split places above `l`. For a split place `x ∤ 𝔫` above `l` with `2 ≤ k_x ≤ l − 1` and a
non-Eisenstein `𝔪`, `ρ̄_𝔪|_{I_x}` is either `ω₂^{k_x−1+(l+1)w_x} ⊕ ω₂^{l(k_x−1)+(l+1)w_x}` or
upper triangular with diagonal `(ω^{k_x+w_x−1}, ω^{w_x})`. The Fontaine–Laffaille module of
Lemma 1.4 is the PadicHodgeTheory:R06.4 interface. -/
theorem localResidualInertialShape {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (l : ℕ) [Fact l.Prime]
    (ρbar : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod l))) (hirr : IsAbsolutelyIrreducible ρbar)
    (x : FinitePrime F) (hx : x.LiesOver l) (hsplit : x.norm = l)
    (kx : ℕ) (hkx : 2 ≤ kx ∧ kx ≤ l - 1) (wx : ℕ)
    (hmod : ∃ (level : Ideal (𝓞 F)) (weight : (F →+* ℝ) → ℕ) (w : ℤ)
      (𝔪 : Ideal (QuaternionicHeckeAlgebra F l weight w level)) (_ : 𝔪.IsMaximal)
      (ι : QuaternionicHeckeAlgebra F l weight w level ⧸ 𝔪 →+* AlgebraicClosure (ZMod l)),
      ¬ level ≤ x.asIdeal ∧ weight = (fun _ => kx) ∧
      ∀ y : FinitePrime F, ¬ y.LiesOver l → ¬ level ≤ y.asIdeal →
        Matrix.trace (ρbar (frobLift y) : Matrix (Fin 2) (Fin 2) _) =
          ι (Ideal.Quotient.mk 𝔪 (QuaternionicHeckeAlgebra.heckeT y))) :
    HasNiveauTwoInertia l (ρbar) x (kx - 1 + (l + 1) * wx) ∨
      ∃ P : GL2 (AlgebraicClosure (ZMod l)), ∀ g : inertiaGroup x,
        ((P⁻¹ * ρbar g * P : GL2 _) : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod l))) 1 0 = 0 ∧
        ((P⁻¹ * ρbar g * P : GL2 _) : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod l))) 0 0 =
          ((fundamentalCharacter l 1 x g ^ (kx + wx - 1) : (AlgebraicClosure (ZMod l))ˣ) :
            AlgebraicClosure (ZMod l)) ∧
        ((P⁻¹ * ρbar g * P : GL2 _) : Matrix (Fin 2) (Fin 2) (AlgebraicClosure (ZMod l))) 1 1 =
          ((fundamentalCharacter l 1 x g ^ wx : (AlgebraicClosure (ZMod l))ˣ) :
            AlgebraicClosure (ZMod l)) := by
  sorry

/-- Taylor 2006, Lemma 5.1 and Corollary 5.2 (pp. 765–767; a variant of Buzzard's unpublished
result): for `l > 3` split completely in `F` of even degree and `0 ≤ i ≤ l − 2`, there is a
natural surjection from the mod-`l` Hecke algebra of level `U₀(𝔫, l)` with character `η̄^i`
to the weight-`(i + 2)` Hecke algebra of level `U_H(𝔫)` over `𝔽̄_l`, compatible with `T_y`, `S_y`
and `𝐔_{ϖ_x}`. The filtration uses `Symm^i` (correcting the printed `Symm^{i+2}`, source issue
E10). Omitted conclusion: the nonvanishing criterion for `h_{i+2,𝔪}` through the `𝐕_{ϖ_x}`
(owner R17.3 for the operators `𝐕`). -/
theorem weightReductionHeckeSurjection {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (heven : Even (Module.finrank ℚ F)) (l : ℕ) [Fact l.Prime]
    (hl : 3 < l) (hsplit : SplitsCompletelyAbove F l) (i : ℕ) (hi : i ≤ l - 2)
    (level : Ideal (𝓞 F)) :
    ∃ f : QuaternionicHeckeAlgebraModL F l i level →+*
        QuaternionicHeckeAlgebra F l (fun _ => i + 2) 0 level ⧸
          (Ideal.span {(l : QuaternionicHeckeAlgebra F l (fun _ => i + 2) 0 level)}),
      Function.Surjective f := by
  sorry

/-- Taylor 2006, Lemma 5.3 (p. 767): raising the weight by `l + 1`. If `l` splits completely in
`F`, `k ≥ 2` and `φ` is an eigensystem of weight `k`, there is an eigensystem `Dφ` of weight
`k + l + 1` with `Dφ(T_y) = φ(T_y) Ny` and `Dφ(S_y) = φ(S_y) (Ny)²` for all `y ∤ l`. Omitted
hypothesis: the twist of the central character by `ε ∘ Art⁻¹` (owner R19.2). -/
theorem weightShift {F : Type} [Field F] [NumberField F] [NumberField.IsTotallyReal F]
    (l : ℕ) [Fact l.Prime] (hsplit : SplitsCompletelyAbove F l) (k : ℕ) (hk : 2 ≤ k)
    (w : ℤ) (level : Ideal (𝓞 F))
    (φ : QuaternionicHeckeAlgebra F l (fun _ => k) w level →+* AlgebraicClosure (ZMod l)) :
    ∃ Dφ : QuaternionicHeckeAlgebra F l (fun _ => k + l + 1) w level →+*
        AlgebraicClosure (ZMod l),
      ∀ y : FinitePrime F, ¬ y.LiesOver l →
        Dφ (QuaternionicHeckeAlgebra.heckeT y) = φ (QuaternionicHeckeAlgebra.heckeT y) * y.norm ∧
        Dφ (QuaternionicHeckeAlgebra.heckeS y) =
          φ (QuaternionicHeckeAlgebra.heckeS y) * (y.norm : AlgebraicClosure (ZMod l)) ^ 2 := by
  sorry

/-- Taylor 2006, Lemma 5.4, Corollary 5.5 and Lemma 5.6 (pp. 767–770): potential modularity in
weight `k`, unramified everywhere. Let `l > 3` and `ρ̄ : G_ℚ → GL₂(𝔽̄_l)` continuous and odd with
`ρ̄|_{I_l} ≅ ω₂^{k−1} ⊕ ω₂^{l(k−1)}`, `2 ≤ k ≤ l`. There are a Galois totally real `F` of even
degree in which `l` splits completely and a cuspidal `π` of parallel weight `k`, unramified at
every finite place, with `ρ̄|_{G_F}` arising from `π`. Lemma 5.4 imports Conrad–Diamond–Taylor
Lemmas 3.1.1 and 4.2.4 and Corollary 5.5 the Skinner–Wiles base change, both recorded gaps. -/
theorem weightAndLevelPotentialResidual (l : ℕ) [Fact l.Prime] (hl : 3 < l)
    (ρ : GaloisGroup ℚ →* GL2 (AlgebraicClosure (ZMod l))) (hcont : IsContinuousResidual ρ)
    (hodd : IsTotallyOdd ρ) (k : ℕ) (hk : 2 ≤ k ∧ k ≤ l)
    (hniv : ∀ v : FinitePrime ℚ, v.LiesOver l → HasNiveauTwoInertia l ρ v (k - 1)) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      NumberField.IsTotallyReal F ∧ IsGalois ℚ F ∧ Even (Module.finrank ℚ F) ∧
      SplitsCompletelyAbove F l ∧
      ∃ π : CuspidalGL2 F, π.HasParallelWeight k ∧ (∀ x, π.IsUnramifiedAt x) ∧
        ArisesFrom l (RingHom.id _) (restrictRep ρ (algebraMap ℚ F)) π := by
  sorry

/-- Taylor 2006, Theorem 5.7 (pp. 770–771): potential modularity in Serre's weight, unramified
everywhere. Let `l > 3` and `ρ̄ : G_ℚ → GL₂(𝔽̄_l)` continuous, absolutely irreducible and odd
with `ρ̄|_{G_l}` irreducible. There are a Galois totally real `F` of even degree in which `l`
splits completely and a cuspidal `π` of parallel weight `k(ρ̄)`, unramified at every finite place,
with `ρ̄|_{G_F}` arising from `π`. The case `l = 3` is Khare's Lemma 2.2 (level-one paper), a
recorded gap. -/
theorem taylorSerreWeightPotentialResidual (l : ℕ) [Fact l.Prime] (hl : 3 < l)
    (ρ : GaloisGroup ℚ →* GL2 (AlgebraicClosure (ZMod l))) (hS : IsSType ρ)
    (hloc : ∀ v : FinitePrime ℚ, v.LiesOver l → IsLocallyIrreducibleAt ρ v) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      NumberField.IsTotallyReal F ∧ IsGalois ℚ F ∧ Even (Module.finrank ℚ F) ∧
      SplitsCompletelyAbove F l ∧
      ∃ π : CuspidalGL2 F, π.HasParallelWeight (serreWeight ρ) ∧ (∀ x, π.IsUnramifiedAt x) ∧
        ArisesFrom l (RingHom.id _) (restrictRep ρ (algebraMap ℚ F)) π := by
  sorry

/-- The field conditions of Khare–Wintenberger's potential modularity theorems for an S-type
`ρ̄ : G_ℚ → GL₂(k)` over `F ⊆ ℚ̄`: `F` is totally real and Galois over `ℚ` of even degree,
unramified above `p` and split above `p` when `ρ̄|_{D_p}` is irreducible, the residual image is
unchanged, and (for `p > 2`) `ρ̄|_{G_{F(μ_p)}}` stays absolutely irreducible. -/
def IsKWField (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (F : IntermediateField ℚ QBar) [NumberField F] : Prop :=
  NumberField.IsTotallyReal F ∧ IsGalois ℚ F ∧ Even (Module.finrank ℚ F) ∧
    UnramifiedAbove F p ∧
    ((∀ v : FinitePrime ℚ, v.LiesOver p → IsLocallyIrreducibleAt ρ v) →
      SplitsCompletelyAbove F p) ∧
    ImagePreserved ρ (algebraMap ℚ F) ∧
    (p ≠ 2 → IsAbsolutelyIrreducible
      (restrictToCyclotomic (restrictRep ρ (algebraMap ℚ F)) ⟨p, (Fact.out : p.Prime).pos⟩))

/-- The two cuspidal witnesses of Khare–Wintenberger II, Theorem 6.1 over `F`: (i) when `p > 2`
or `k(ρ̄) = 2`, a witness of parallel weight `k(ρ̄)` unramified at every place above `p`;
(ii) a witness of parallel weight two with conductor dividing `v` at each `v | p`, unramified
there when `ρ̄|_{G_v}` has a finite flat model. -/
def HasKWWitnesses (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k)
    (F : IntermediateField ℚ QBar) [NumberField F] : Prop :=
  ((p ≠ 2 ∨ serreWeight ρ = 2) → ∃ π : CuspidalGL2 F, π.HasParallelWeight (serreWeight ρ) ∧
      (∀ v : FinitePrime F, v.LiesOver p → π.IsUnramifiedAt v) ∧
      ArisesFrom p j (restrictRep ρ (algebraMap ℚ F)) π) ∧
    ∃ π : CuspidalGL2 F, π.HasParallelWeight 2 ∧
      (∀ v : FinitePrime F, v.LiesOver p → π.conductorExponent v ≤ 1 ∧
        (Nonempty (FiniteFlatModel (restrictRep ρ (algebraMap ℚ F)) v) → π.IsUnramifiedAt v)) ∧
      ArisesFrom p j (restrictRep ρ (algebraMap ℚ F)) π

/-- Khare–Wintenberger II, Theorem 6.1 (i)–(ii) (pp. 53–57): potential modularity of `ρ̄` over a
controlled field. Let `ρ̄ : G_ℚ → GL₂(k)` be of S-type, with `2 ≤ k(ρ̄) ≤ p + 1` and
`ρ̄|_{G_{ℚ(μ_p)}}` absolutely irreducible if `p > 2`, and with insoluble image if `p = 2`. Then
there is a field satisfying `IsKWField` over which both witnesses of `HasKWWitnesses` exist. The
proof combines Taylor's theorems, Langlands–Tunnell, Gross, Coleman–Voloch, KW II Theorem 8.2
and Hida theory with the Moret–Bailly field selection; no characteristic-zero lift is used. The
extension controls are `controlledExtension`. -/
theorem kwPotentialResidual (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ)
    (hwt : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρ.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ
      ⟨p, (Fact.out : p.Prime).pos⟩)) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      IsKWField p ρ F ∧ HasKWWitnesses p j ρ F := by
  sorry

/-- Khare–Wintenberger, Annals, Theorem 2.1 (Taylor; pp. 234–237): the odd-characteristic
variant with ordinary witnesses. Let `p` be odd, `ρ̄` of S-type with `ρ̄|_{G_{ℚ(μ_p)}}` absolutely
irreducible, `2 ≤ k(ρ̄) ≤ p + 1` and `k(ρ̄) ≠ p`. There is a field satisfying `IsKWField` with
(i) a witness of weight `k(ρ̄)` unramified at every finite place and (ii) a weight-two witness
unramified away from `p` with conductor dividing `v` (unramified when finite flat) at `v | p`,
both ordinary at every `v | p` when `ρ̄` is ordinary at `p`. Imports Hida's Corollary 3.5 and the
Skinner–Wiles base change. -/
theorem kwOrdinaryPotentialResidual (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : Type} [Field k]
    [Finite k] [CharP k p] (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k)
    (hS : IsSType ρ) (hwt : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (hwtp : serreWeight ρ ≠ p)
    (hcyc : IsAbsolutelyIrreducible (restrictToCyclotomic ρ ⟨p, (Fact.out : p.Prime).pos⟩)) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F), IsKWField p ρ F ∧
      (∃ (π : CuspidalGL2 F) (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)),
        π.HasParallelWeight (serreWeight ρ) ∧ (∀ v, π.IsUnramifiedAt v) ∧
        ArisesFromVia p j (restrictRep ρ (algebraMap ℚ F)) π ι ∧
        ((∀ v : FinitePrime ℚ, v.LiesOver p → IsOrdinaryResidualAt ρ v) →
          ∀ v : FinitePrime F, v.LiesOver p → π.IsOrdinaryAt p ι v)) ∧
      ∃ (π : CuspidalGL2 F) (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)),
        π.HasParallelWeight 2 ∧ (∀ v : FinitePrime F, ¬ v.LiesOver p → π.IsUnramifiedAt v) ∧
        (∀ v : FinitePrime F, v.LiesOver p → π.conductorExponent v ≤ 1 ∧
          (Nonempty (FiniteFlatModel (restrictRep ρ (algebraMap ℚ F)) v) → π.IsUnramifiedAt v)) ∧
        ArisesFromVia p j (restrictRep ρ (algebraMap ℚ F)) π ι ∧
        ((∀ v : FinitePrime ℚ, v.LiesOver p → IsOrdinaryResidualAt ρ v) →
          ∀ v : FinitePrime F, v.LiesOver p → π.IsOrdinaryAt p ι v) := by
  sorry

/-- Snowden, Theorem 5.1.1 and Proposition 8.2.1 (pp. 15, 26): potential residual modularity
over totally real fields. Let `F` be totally real, `p` odd, `ρ̄ : G_F → GL₂(𝔽̄_p)` continuous and
totally odd, `ψ` a finite-order character with `det ρ̄ = ψ̄ χ̄_p`, `M/F` finite and `t` a type
function at the places above `p`. There are a finite Galois `M'/F` containing `M` and a totally
real Galois `F'/F`, linearly disjoint from `M'`, such that over every totally real finite `F''/F'`
linearly disjoint from `M'` there is a cuspidal `π` of parallel weight two with
`det ρ_π = ψ χ_p`, `ρ̄|_{G_{F''}}` arising from `π`, and type `t` at the places above `p`.
Omitted hypothesis: compatibility of `t` with `ρ̄` at prescribed split places (owner R22.5). -/
theorem snowdenPotentialResidual {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod p))) (hcont : IsContinuousResidual ρ)
    (hodd : IsTotallyOdd ρ) (ψ : GaloisGroup F →* (PadicAlgCl p)ˣ)
    (hψfin : ∃ m : ℕ, 0 < m ∧ ∀ g, ψ g ^ m = 1)
    (hdet : ∀ g, ((Matrix.GeneralLinearGroup.det (ρ g) : (AlgebraicClosure (ZMod p))ˣ) :
      AlgebraicClosure (ZMod p)) =
        padicResidue p (((ψ * cyclotomicCharacterQbarp F p) g : (PadicAlgCl p)ˣ) : PadicAlgCl p))
    (M : IntermediateField F (AlgebraicClosure F)) (hM : FiniteDimensional F M)
    (t : FinitePrime F → KWLocalType) :
    ∃ (M' F' : IntermediateField F (AlgebraicClosure F)),
      M ≤ M' ∧ FiniteDimensional F M' ∧ IsGalois F M' ∧ FiniteDimensional F F' ∧
      IsGalois F F' ∧ NumberField.IsTotallyReal F' ∧ F'.LinearDisjoint M' ∧
      ∀ (F'' : IntermediateField F (AlgebraicClosure F)) (_ : NumberField F''), F' ≤ F'' →
        NumberField.IsTotallyReal F'' → F''.LinearDisjoint M' →
        ∃ (π : CuspidalGL2 F'') (ι : π.coefficientField →+* PadicAlgCl p),
          π.HasParallelWeight 2 ∧
          ArisesFrom p (RingHom.id _) (restrictRep ρ (algebraMap F F'')) π ∧
          (∀ g, Matrix.GeneralLinearGroup.det (π.galoisRep p ι g) =
            (ψ * cyclotomicCharacterQbarp F p) (restrictionMap (algebraMap F F'') g)) ∧
          ∀ w : FinitePrime F'', w.LiesOver p → ∀ v : FinitePrime F,
            w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 F'')) = v.asIdeal → π.localType w = t v := by
  sorry

/-- Boxer–Calegari–Gee–Pilloni, Proposition 9.1.11 (p. 458): controlled residual modularity
after restriction of scalars. Let `F₁/F` be finite totally real, `p, q > 2` distinct primes
splitting completely in `F₁`, and `r : G_{F₁} → GL₂(𝔽̄_q)` with `det r = ε̄_q⁻¹`, of the shape
`diag(λ_{α_v}, ε̄_q⁻¹ λ_{α_v}⁻¹)` at every `v | q` (with `λ_α` unramified) and unramified above
`p`. For finite `F_avoid/F` there are a totally real Galois `F'/F`, split above `p` and `q` and
linearly disjoint from `F₁ F_avoid`, and a `q`-ordinary cuspidal `π` of parallel weight two over
`F₁F'`, unramified above `pq`, with trivial central character and `r|_{G_{F₁F'}}` arising from
`π`. -/
theorem bcgpPotentialResidual {F : Type} [Field F] [NumberField F] [NumberField.IsTotallyReal F]
    (F₁ avoid : IntermediateField F (AlgebraicClosure F)) [NumberField F₁]
    (hF₁ : NumberField.IsTotallyReal F₁) (havoid : FiniteDimensional F avoid)
    (p q : ℕ) [Fact p.Prime] [Fact q.Prime] (hp : p ≠ 2) (hq : q ≠ 2) (hpq : p ≠ q)
    (hsplit : SplitsCompletelyAbove F₁ p ∧ SplitsCompletelyAbove F₁ q)
    (r : GaloisGroup F₁ →* GL2 (AlgebraicClosure (ZMod q)))
    (hdet : Matrix.GeneralLinearGroup.det.comp r =
      ((Units.map (ZMod.castHom (dvd_refl q) (AlgebraicClosure (ZMod q))).toMonoidHom).comp
        (cyclotomicCharacterModP F₁ q))⁻¹)
    (hq_shape : ∀ v : FinitePrime F₁, v.LiesOver q →
      ∃ μ : GaloisGroup F₁ →* (AlgebraicClosure (ZMod q))ˣ,
      CharIsUnramifiedAt μ v ∧ IsDiagonalAt r v μ
        (((Units.map (ZMod.castHom (dvd_refl q) (AlgebraicClosure (ZMod q))).toMonoidHom).comp
          (cyclotomicCharacterModP F₁ q))⁻¹ * μ⁻¹))
    (hp_unr : ∀ v : FinitePrime F₁, v.LiesOver p → IsUnramifiedAt r v) :
    ∃ (F' : IntermediateField F (AlgebraicClosure F)) (_ : NumberField F')
      (_ : NumberField ↥(F₁ ⊔ F')),
      NumberField.IsTotallyReal F' ∧ IsGalois F F' ∧
      SplitsCompletelyAbove F' p ∧ SplitsCompletelyAbove F' q ∧
      F'.LinearDisjoint ↥(F₁ ⊔ avoid) ∧
      ∃ (π : CuspidalGL2 ↥(F₁ ⊔ F')) (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod q)),
        π.HasParallelWeight 2 ∧
        (∀ v : FinitePrime ↥(F₁ ⊔ F'), (v.LiesOver p ∨ v.LiesOver q) → π.IsUnramifiedAt v) ∧
        (∀ v, π.centralConductorExponent v = 0) ∧
        (∀ v : FinitePrime ↥(F₁ ⊔ F'), v.LiesOver q → π.IsOrdinaryAt q ι v) ∧
        ArisesFromVia q (RingHom.id _)
          (restrictRep r (IntermediateField.inclusion le_sup_left).toRingHom) π ι := by
  sorry

/-! ## R23.4 — Potential modularity of a given lift -/

/-- `ρ` is a lift of type `t` of `ρ̄`: it is the lift attached to an `O`-point of the KW
unframed global ring, up to conjugation. -/
def IsLiftOfType (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρbar : GaloisGroup ℚ →* GL2 k)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType) {O : Type} [CommRing O]
    [Algebra ℤ_[p] O] (ρ : GaloisGroup ℚ →* GL2 O) : Prop :=
  ∃ (x : unframedGlobalRing p ρbar S ψ t →ₐ[ℤ_[p]] O) (P : GL2 O),
    ∀ g, ρ g = P * unframedGlobalRing.liftOfPoint p ρbar S ψ t x g * P⁻¹

/-- Potential modularity of a given lift (KW II, §§6, 8–10): let `ρ̄` satisfy the hypotheses of
KW I Theorem 5.1 and let `ρ : G_ℚ → GL₂(O)` be a given lift of type (A), (B) or (C) at `p`,
minimal away from `p`. There is a totally real Galois `F/ℚ` (from `kwPotentialResidual` and the
allowable base change of KW II Theorem 8.2) over which `ρ|_{G_F}` is modular, by KW II
Theorem 9.7 (GL2ModularityLifting:R22.5/R22.6). The lift is an input; this is not an existence
theorem for lifts. -/
theorem potentialModularityGivenLift (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k]
    [CharP k p] (ρbar : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρbar)
    (hwt : 2 ≤ serreWeight ρbar ∧ serreWeight ρbar ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρbar.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρbar
      ⟨p, (Fact.out : p.Prime).pos⟩))
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType)
    {O : Type} [CommRing O] [Algebra ℤ_[p] O] (j : O →+* PadicAlgCl p)
    (ρ : GaloisGroup ℚ →* GL2 O) (hρ : IsLiftOfType p ρbar S ψ t ρ) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      NumberField.IsTotallyReal F ∧ IsGalois ℚ F ∧
      IsModularLift p j (restrictRep ρ (algebraMap ℚ F)) := by
  sorry

/-! ## R23.5 — Control of extensions -/

/-- Primes as a type, with their primality available to `ℚ_[ℓ]`. -/
instance factPrimes (ℓ : Nat.Primes) : Fact (ℓ : ℕ).Prime := ⟨ℓ.2⟩

/-- Khare–Wintenberger II, Theorem 6.1 (iii) (p. 54): the field of `kwPotentialResidual` can be
chosen so that moreover (a) if `k(ρ̄) = p` and `ρ̄|_{I_p}` is trivial, `ρ̄|_{G_𝔭}` is trivial at every
`𝔭 | p`; (b) for finitely many primes `ℓ ≠ p` and finite extensions `K_ℓ/ℚ_ℓ`, every completion of
`F` above `ℓ` contains `K_ℓ`; (c) if `p > 2` and `k(ρ̄) = p + 1`, `F` is split above `p`; (d) `F` is
linearly disjoint from a given finite `L/ℚ`. The construction uses the soluble
prescribed-completion theorem and Moret–Bailly; soluble descent (R17.4/R17.6) is applied only
under its invariance and cuspidality hypotheses. KW II §10.1 cites (b) as part (c) (source issue
E2). Completions are encoded by embeddings `F → ℚ̄_ℓ`. -/
theorem controlledExtension (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ)
    (hwt : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρ.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ
      ⟨p, (Fact.out : p.Prime).pos⟩))
    (T : Finset Nat.Primes) (hT : ∀ ℓ ∈ T, (ℓ : ℕ) ≠ p)
    (Kloc : ∀ ℓ ∈ T, IntermediateField ℚ_[(ℓ : ℕ)] (AlgebraicClosure ℚ_[(ℓ : ℕ)]))
    (hKloc : ∀ ℓ (h : ℓ ∈ T), FiniteDimensional ℚ_[(ℓ : ℕ)] (Kloc ℓ h))
    (L : IntermediateField ℚ QBar) (hL : FiniteDimensional ℚ L) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      IsKWField p ρ F ∧ HasKWWitnesses p j ρ F ∧
      ((serreWeight ρ = p ∧ ∀ v : FinitePrime ℚ, v.LiesOver p → ∀ g ∈ inertiaGroup v, ρ g = 1) →
        ∀ w : FinitePrime F, w.LiesOver p → ∀ g ∈ decompositionGroup w,
          restrictRep ρ (algebraMap ℚ F) g = 1) ∧
      (∀ ℓ (h : ℓ ∈ T), ∀ σ : F →+* AlgebraicClosure ℚ_[(ℓ : ℕ)],
        Kloc ℓ h ≤ IntermediateField.adjoin ℚ_[(ℓ : ℕ)] (Set.range σ)) ∧
      ((p ≠ 2 ∧ serreWeight ρ = p + 1) → SplitsCompletelyAbove F p) ∧
      F.LinearDisjoint L := by
  sorry

/-- Boxer–Calegari–Gee–Pilloni, Proposition 9.1.12 as corrected (p. 459): local Galois data over a
composite field. Let `E'/E` be finite, `F_avoid/E` finite and linearly disjoint from `E'`, `S` a
finite set of places of `E` and `G` a finite group with, at each place of `E'` above `S`, a finite
Galois local extension and an embedding of its group into `G` (and an element of order dividing
two at real places). There are a finite Galois `K/E`, linearly disjoint from `E' F_avoid`, such
that every place of `E'` above `S` splits completely in `K' = K E'`, and a Galois `L'/K'` with
group `G` realizing the local data up to conjugacy. No descent of `L'` to `K` is asserted.
Omitted hypothesis: the local completions and their embeddings, recorded through the
decomposition groups (owner ArithmeticGaloisRepresentations:R01.1). -/
theorem bcgpLocalData {E : Type} [Field E] [NumberField E]
    (E' avoid : IntermediateField E (AlgebraicClosure E)) [NumberField E']
    (hE' : FiniteDimensional E E') (havoid : FiniteDimensional E avoid)
    (hdisj : avoid.LinearDisjoint E') (S : Finset (FinitePrime E))
    (G : Type) [Group G] [Finite G]
    (localData : ∀ w : FinitePrime E', (∃ v ∈ S, w.LiesAbove v) → GaloisGroup E' →* G)
    (hlocal : ∀ w hw, IsOpen (((localData w hw).ker : Set (GaloisGroup E')))) :
    ∃ (K : IntermediateField E (AlgebraicClosure E)) (_ : NumberField K)
      (_ : NumberField ↥(K ⊔ E')),
      IsGalois E K ∧ K.LinearDisjoint ↥(E' ⊔ avoid) ∧
      (∀ w : FinitePrime E', (∃ v ∈ S, w.LiesAbove v) →
        ∀ w' : FinitePrime ↥(K ⊔ E'), w'.asIdeal.comap (NumberField.RingOfIntegers.mapRingHom
          (IntermediateField.inclusion le_sup_right).toRingHom) = w.asIdeal → w'.norm = w.norm) ∧
      ∃ f : GaloisGroup ↥(K ⊔ E') →* G, Function.Surjective f ∧
        IsOpen ((f.ker : Set (GaloisGroup ↥(K ⊔ E')))) ∧
        ∀ w (hw : ∃ v ∈ S, w.LiesAbove v) (w' : FinitePrime ↥(K ⊔ E')),
          w'.asIdeal.comap (NumberField.RingOfIntegers.mapRingHom
            (IntermediateField.inclusion le_sup_right).toRingHom) = w.asIdeal →
          ∃ g : G, ∀ σ ∈ decompositionGroup w',
            f σ = g * localData w hw
              (restrictionMap (IntermediateField.inclusion le_sup_right).toRingHom σ) * g⁻¹ := by
  sorry

end TauCeti.PotentialModularity

namespace TauCeti.CompatibleSystems
open PotentialModularity
open scoped NumberField

/-! ## R24.1 — Finiteness of global rings -/

/-- The universal representation over the unframed ring `R̄_S^ψ` (a trace-subring realization,
available because `ρ̄` is absolutely irreducible). Owner: GlobalGaloisDeformations:R04.6. -/
def universalRep (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType) :
    GaloisGroup ℚ →* GL2 (unframedGlobalRing p ρ S ψ t) := sorry

/-- The auxiliary totally real field of Khare–Wintenberger II §10.1 (pp. 90–91) for `ρ̄`, `S`, `ψ`
and the local type `t`: a totally real `F/ℚ` with (1) insoluble image over `F` if `p = 2` and
`ρ̄|_{G_{F(μ_p)}}` absolutely irreducible if `p > 2`, unramified above `p` and split there when
`ρ̄|_{D_p}` is irreducible; (2) `ρ̄|_{G_𝔭}` trivial at `𝔭 | p` when `ρ̄|_{D_p}` is unramified;
(3) the cuspidal witnesses: a type-(A) witness `piA` of parallel weight `k(ρ̄)`, unramified
everywhere, when `p ≠ 2` or `k(ρ̄) = 2`, and a type-(B)/(C) witness `piBC` of parallel weight two,
unramified away from `p` with conductor dividing `v` at `v | p`; (4) the reduction modulo `p`
of the universal representation is unramified on `G_F` away from `p`. -/
structure AuxiliaryField (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType) where
  F : IntermediateField ℚ QBar
  [numberField : NumberField F]
  totallyReal : NumberField.IsTotallyReal F
  insolubleImage : p = 2 → ¬ Group.IsSolvable (restrictRep ρ (algebraMap ℚ F)).range
  cyclotomicIrreducible : p ≠ 2 → IsAbsolutelyIrreducible
    (restrictToCyclotomic (restrictRep ρ (algebraMap ℚ F)) ⟨p, (Fact.out : p.Prime).pos⟩)
  unramifiedAboveP : UnramifiedAbove F p
  splitAboveP : (∀ v : FinitePrime ℚ, v.LiesOver p → IsLocallyIrreducibleAt ρ v) →
    SplitsCompletelyAbove F p
  trivialAboveP : (∀ v : FinitePrime ℚ, v.LiesOver p → IsUnramifiedAt ρ v) →
    ∀ w : FinitePrime F, w.LiesOver p → ∀ g ∈ decompositionGroup w,
      restrictRep ρ (algebraMap ℚ F) g = 1
  piA : (p ≠ 2 ∨ serreWeight ρ = 2) → CuspidalGL2 F
  piA_spec : ∀ h, (piA h).HasParallelWeight (serreWeight ρ) ∧ (∀ v, (piA h).IsUnramifiedAt v) ∧
    ArisesFrom p j (restrictRep ρ (algebraMap ℚ F)) (piA h)
  piBC : CuspidalGL2 F
  piBC_spec : piBC.HasParallelWeight 2 ∧
    (∀ v : FinitePrime F, ¬ v.LiesOver p → piBC.IsUnramifiedAt v) ∧
    (∀ v : FinitePrime F, v.LiesOver p → piBC.conductorExponent v ≤ 1) ∧
    ArisesFrom p j (restrictRep ρ (algebraMap ℚ F)) piBC
  tauUnramified : ∀ v : FinitePrime F, ¬ v.LiesOver p →
    IsUnramifiedAt (restrictRep ((Matrix.GeneralLinearGroup.map
      (Ideal.Quotient.mk (Ideal.span {(p : unframedGlobalRing p ρ S ψ t)}))).comp
        (universalRep p ρ S ψ t)) (algebraMap ℚ F)) v

attribute [instance] AuxiliaryField.numberField

namespace AuxiliaryField
variable {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {j : k →+* AlgebraicClosure (ZMod p)}
  {ρ : GaloisGroup ℚ →* GL2 k} {S : Finset ℕ} {ψ : GaloisGroup ℚ →* ℤ_[p]ˣ} {t : KWLocalType}

/-- The type-(A) witness is available: `p ≠ 2` or `k(ρ̄) = 2`. -/
def HasTypeA (_A : AuxiliaryField p j ρ S ψ t) : Prop := p ≠ 2 ∨ serreWeight ρ = 2

/-- The type-(A) witness exists exactly when `p ≠ 2` or `k(ρ̄) = 2`; at `p = 2`, `k(ρ̄) = 4` only the
type-(B)/(C) witness is part of the construction. -/
lemma piA_iff (A : AuxiliaryField p j ρ S ψ t) : A.HasTypeA ↔ p ≠ 2 ∨ serreWeight ρ = 2 := by
  sorry

/-- The type-(B)/(C) witness has parallel weight two and gives `ρ̄|_{G_F}`. -/
lemma piBC_eq (A : AuxiliaryField p j ρ S ψ t) :
    A.piBC.HasParallelWeight 2 ∧ ArisesFrom p j (restrictRep ρ (algebraMap ℚ A.F)) A.piBC := by
  sorry

/-- The reduction of the universal representation is unramified on `G_F` away from `p`. -/
lemma tau_unramified (A : AuxiliaryField p j ρ S ψ t) (v : FinitePrime A.F)
    (hv : ¬ v.LiesOver p) :
    IsUnramifiedAt (restrictRep ((Matrix.GeneralLinearGroup.map
      (Ideal.Quotient.mk (Ideal.span {(p : unframedGlobalRing p ρ S ψ t)}))).comp
        (universalRep p ρ S ψ t)) (algebraMap ℚ A.F)) v := by
  sorry

/-- Existence of the auxiliary field (KW II §10.1, pp. 90–91), from Theorem 6.1 with its
extension controls (iii)(b)–(d) (`controlledExtension`), KW II Theorem 8.2 and the local killing
of the finitely many ramified primes of the universal representation modulo `p`. -/
theorem «exists» (hS : IsSType ρ) [Finite k] [CharP k p]
    (hwt : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρ.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ
      ⟨p, (Fact.out : p.Prime).pos⟩)) :
    Nonempty (AuxiliaryField p j ρ S ψ t) := by
  sorry

end AuxiliaryField

/-- aux_dyadic_weight_four: for `p = 2` and `k(ρ̄) = 4` the type-(A) guard fails and only the
weight-two witness is used. -/
example [Fact (Nat.Prime 2)] {k : Type} [Field k] (j : k →+* AlgebraicClosure (ZMod 2))
    (ρ : GaloisGroup ℚ →* GL2 k) (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[2]ˣ)
    (t : KWLocalType) (A : AuxiliaryField 2 j ρ S ψ t) (h4 : serreWeight ρ = 4) :
    ¬ A.HasTypeA ∧ A.piBC.HasParallelWeight 2 := by
  sorry

/-- aux_unramified_at_p: when `ρ̄|_{D_p}` is unramified, `ρ̄|_{G_𝔭}` is trivial at every `𝔭 | p`
of the auxiliary field. -/
example {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {j : k →+* AlgebraicClosure (ZMod p)}
    {ρ : GaloisGroup ℚ →* GL2 k} {S : Finset ℕ} {ψ : GaloisGroup ℚ →* ℤ_[p]ˣ}
    {t : KWLocalType} (A : AuxiliaryField p j ρ S ψ t)
    (hunr : ∀ v : FinitePrime ℚ, v.LiesOver p → IsUnramifiedAt ρ v)
    (w : FinitePrime A.F) (hw : w.LiesOver p) (g : GaloisGroup A.F)
    (hg : g ∈ decompositionGroup w) : restrictRep ρ (algebraMap ℚ A.F) g = 1 := by
  sorry

/-- aux_not_cm: the auxiliary field is totally real, so it contains no square root of `−1`. -/
example {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {j : k →+* AlgebraicClosure (ZMod p)}
    {ρ : GaloisGroup ℚ →* GL2 k} {S : Finset ℕ} {ψ : GaloisGroup ℚ →* ℤ_[p]ˣ}
    {t : KWLocalType} (A : AuxiliaryField p j ρ S ψ t) (i : A.F) (h : i * i = -1) : False := by
  sorry

/-- aux_tame_killing: ramification of the universal representation modulo `p` at a prime
`ℓ ≠ p` (tame of order `e`, e.g. `e = 3` at `ℓ = 7` with `3 ∣ 7 − 1`) is killed over the
auxiliary field. -/
example {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {j : k →+* AlgebraicClosure (ZMod p)}
    {ρ : GaloisGroup ℚ →* GL2 k} {S : Finset ℕ} {ψ : GaloisGroup ℚ →* ℤ_[p]ˣ}
    {t : KWLocalType} (A : AuxiliaryField p j ρ S ψ t) (v : FinitePrime A.F) (hv : v.LiesOver 7)
    (hp : p ≠ 7) (g : GaloisGroup A.F) (hg : g ∈ inertiaGroup v) :
    restrictRep ((Matrix.GeneralLinearGroup.map
      (Ideal.Quotient.mk (Ideal.span {(p : unframedGlobalRing p ρ S ψ t)}))).comp
        (universalRep p ρ S ψ t)) (algebraMap ℚ A.F) g = 1 ∧ (3 : ℕ) ∣ 7 - 1 := by
  sorry

/-- Khare–Wintenberger II, Theorem 10.1 (pp. 90–92): the unframed fixed-determinant global ring
`R̄_S^ψ` is finite over `ℤ_p`, under the hypotheses of §10.1 (case (C) at `p > 2` only when
`k(ρ̄) = p + 1`). The proof restricts to the auxiliary field and uses Propositions 9.2–9.3
(`R = T` over `F`) and the finite-image criterion (KW Annals Lemma 3.6, or de Jong 3.14). The
framed ring is a power series ring over it and is not finite. -/
theorem kwGlobalFiniteness (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ)
    (hwt : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρ.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ
      ⟨p, (Fact.out : p.Prime).pos⟩))
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType)
    (hC : (p ≠ 2 ∧ t = KWLocalType.C) → serreWeight ρ = p + 1) :
    Module.Finite ℤ_[p] (unframedGlobalRing p ρ S ψ t) := by
  sorry

/-- Thorne's unframed fixed-determinant `GL₂` deformation ring over a totally real `F`, ordinary
semistable of a fixed regular Hodge type `λ` above `p` (`R_v^{λ,ss-ord}`) and unrestricted with
fixed determinant at the other places of `S`, as an `O`-algebra.
Owner: GlobalGaloisDeformations:R04.6 over LocalGaloisDeformationRings:L8. -/
def OrdinaryGlobalRing {F : Type} [Field F] [NumberField F] (p : ℕ) [Fact p.Prime] {k : Type}
    [Field k] (ρ : GaloisGroup F →* GL2 k) (S : Finset (FinitePrime F))
    (ψ : GaloisGroup F →* (PadicAlgCl p)ˣ) (hodge : (F →+* ℝ) → ℕ × ℕ) : Type := sorry

noncomputable instance {F : Type} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime] {k : Type}
    [Field k] {ρ : GaloisGroup F →* GL2 k} {S : Finset (FinitePrime F)}
    {ψ : GaloisGroup F →* (PadicAlgCl p)ˣ} {hodge : (F →+* ℝ) → ℕ × ℕ} :
    CommRing (OrdinaryGlobalRing p ρ S ψ hodge) := sorry

noncomputable instance {F : Type} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime] {k : Type}
    [Field k] {ρ : GaloisGroup F →* GL2 k} {S : Finset (FinitePrime F)}
    {ψ : GaloisGroup F →* (PadicAlgCl p)ˣ} {hodge : (F →+* ℝ) → ℕ × ℕ} :
    Algebra ℤ_[p] (OrdinaryGlobalRing p ρ S ψ hodge) := sorry

/-- Ordinary global ring finiteness (Thorne, Theorem 10.2, pp. 56–58, as a totally real `GL₂`
adapter): for `p > 2`, `F` totally real with `ζ_p ∉ F`, `ρ̄` totally odd, absolutely irreducible
with adequate image on `G_{F(ζ_p)}`, `S` containing the places above `p` and the ramification,
and an ordinary regular algebraic cuspidal lift of the fixed determinant, the unframed ring is
finite over `ℤ_p`. Omitted hypotheses: adequacy of the image and the polarized CM-extension and
restriction comparisons of Thorne's theorem (owner OrdinaryAutomorphicFormsAndModularityLifting:R21.4).
Applying it to another ordinary or potentially crystalline component needs a separate local
comparison. -/
theorem ordinaryGlobalFiniteness {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : Type} [Field k]
    [Finite k] [CharP k p] (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup F →* GL2 k)
    (hcont : IsContinuousResidual ρ) (hodd : IsTotallyOdd ρ) (hirr : IsAbsolutelyIrreducible ρ)
    (hζ : ¬ ∃ ζ : F, IsPrimitiveRoot ζ p)
    (S : Finset (FinitePrime F)) (hSp : ∀ v : FinitePrime F, v.LiesOver p → v ∈ S)
    (hSram : ∀ v, v ∉ S → IsUnramifiedAt ρ v) (ψ : GaloisGroup F →* (PadicAlgCl p)ˣ)
    (hodge : (F →+* ℝ) → ℕ × ℕ)
    (hlift : ∃ (π : CuspidalGL2 F) (ι : 𝓞 π.coefficientField →+* AlgebraicClosure (ZMod p)),
      ArisesFromVia p j ρ π ι ∧ ∀ v : FinitePrime F, v.LiesOver p → π.IsOrdinaryAt p ι v) :
    Module.Finite ℤ_[p] (OrdinaryGlobalRing p ρ S ψ hodge) := by
  sorry

/-- The Calegari–Geraghty ring `R_φ` of CG18 Theorem 4.8's proof: unframed, ordinary (`R^†`) at `p`
and unrestricted with fixed determinant `χ_φ = ε det(ρ̄) ε̄⁻¹ φ` at the other ramified places.
Owner: GlobalGaloisDeformations:R04.6 over LocalGaloisDeformationRings:L8. -/
def CGRing (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (φ : GaloisGroup ℚ →* (PadicAlgCl p)ˣ) : Type := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {ρ : GaloisGroup ℚ →* GL2 k}
    {φ : GaloisGroup ℚ →* (PadicAlgCl p)ˣ} : CommRing (CGRing p ρ φ) := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {ρ : GaloisGroup ℚ →* GL2 k}
    {φ : GaloisGroup ℚ →* (PadicAlgCl p)ˣ} : Algebra ℤ_[p] (CGRing p ρ φ) := sorry

/-- Finiteness of the Calegari–Geraghty ring (CG18, proof of Theorem 4.8, author PDF pp. 66–68):
for `p ≥ 3` and `ρ̄ : G_ℚ → GL₂(k)` absolutely irreducible, modular and twist-minimal away from `p`,
each `R_φ` is finite over `ℤ_p`; its framed version is not. Obtained from
`ordinaryGlobalFiniteness` through the explicit local-ring comparison. -/
theorem cgRingFiniteness (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : Type} [Field k] [Finite k]
    [CharP k p] (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k)
    (hS : IsSType ρ) (hmod : ∃ π : CuspidalGL2 ℚ, ArisesFrom p j ρ π)
    (φ : GaloisGroup ℚ →* (PadicAlgCl p)ˣ) (hφ : ∃ m : ℕ, 0 < m ∧ ∀ g, φ g ^ m = 1) :
    Module.Finite ℤ_[p] (CGRing p ρ φ) := by
  sorry

/-! ## R24.2 — Integral characteristic-zero points -/

/-- Characteristic-zero points from finiteness and dimension (the commutative algebra of
DeformationAndDerivedPatchingAlgebra:R03.4): a finite local `O`-algebra of Krull dimension at
least one has an `O`-point in the integers of a finite extension of `Frac O`. -/
theorem characteristicZeroPoint (O K R : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [CommRing R] [IsLocalRing R] [Algebra O R] [Module.Finite O R]
    [IsLocalHom (algebraMap O R)] (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : IntermediateField K (AlgebraicClosure K), Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : R →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-- Lifts of the required type (KW II, Proposition 4.5, Corollary 4.7 and §10.3.1): under the
hypotheses of `kwGlobalFiniteness`, `R̄_S^ψ` has dimension at least one (Proposition 4.5) and is
finite over `ℤ_p` (Theorem 10.1), so it has a `ℚ̄_p`-point, and the attached lift is a continuous
lift of `ρ̄` unramified outside `S` with determinant `ψ χ_p` and of type `t` at `p`. Finiteness
alone would not suffice: a finite algebra of dimension zero has no such point. -/
theorem requiredTypeLiftExists (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ)
    (hwt : p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1)
    (h2 : p = 2 → ¬ Group.IsSolvable ρ.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ
      ⟨p, (Fact.out : p.Prime).pos⟩))
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType)
    (hC : (p ≠ 2 ∧ t = KWLocalType.C) → serreWeight ρ = p + 1) :
    1 ≤ ringKrullDim (unframedGlobalRing p ρ S ψ t) ∧
      ∃ x : unframedGlobalRing p ρ S ψ t →ₐ[ℤ_[p]] PadicAlgCl p,
        IsLiftOfType p ρ S ψ t (unframedGlobalRing.liftOfPoint p ρ S ψ t x) ∧
        IsContinuousRep (unframedGlobalRing.liftOfPoint p ρ S ψ t x) ∧
        ∀ g, Matrix.GeneralLinearGroup.det (unframedGlobalRing.liftOfPoint p ρ S ψ t x g) =
          Units.map (algebraMap ℤ_[p] (PadicAlgCl p)).toMonoidHom
            ((ψ * cyclotomicCharacterPadic ℚ p) g) := by
  sorry

/-- Extracting a point on prescribed components (Newton–Thorne §3, Lemma 3.1 setting): for the
fixed-determinant unframed ring `R` with the chosen potentially crystalline ordinary components
above `p`, the Steinberg component at `v₀` and regular components elsewhere, BG19
Proposition 4.2.6 gives `dim R ≥ 1` and the applicable finiteness theorem gives `R` finite over
`O`; the algebra of `characteristicZeroPoint` then gives an integral point over a finite
extension. Automorphy of the resulting lift is a later application. -/
theorem newtonThornePoint (O K R : Type u)
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [CommRing R] [IsLocalRing R] [Algebra O R] [Module.Finite O R]
    [IsLocalHom (algebraMap O R)] (hdim : 1 ≤ ringKrullDim R) :
    ∃ E : IntermediateField K (AlgebraicClosure K), Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : R →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-- A finite nonzero ring of characteristic `p` has no characteristic-zero point, so finiteness
without the dimension bound gives no lift. -/
example : ¬ Nonempty (ZMod 5 →+* ℚ) := by
  sorry

end TauCeti.CompatibleSystems

noncomputable section
open scoped NumberField Polynomial
open IsDedekindDomain
namespace TauCeti.CompatibleSystems

open TauCeti.PotentialModularity (FinitePrime frobLift inertiaGroup decompositionGroup
  complexConjugation restrictionMap GL2 toRepresentation)

/-- The finite places of a number field, used both for base places `v` and for coefficient
places `λ`. -/
abbrev PrimeIndex (F : Type) [Field F] [NumberField F] := FinitePrime F
abbrev GaloisGroup (F : Type u) [Field F] := TauCeti.PotentialModularity.GaloisGroup F
/-- `GL_n(E)`. -/
abbrev GLn (n : ℕ) (E : Type) [CommRing E] := Matrix.GeneralLinearGroup (Fin n) E

/-- The residue characteristic `l` of a finite place `λ`. -/
def PrimeIndex.residueChar {M : Type} [Field M] [NumberField M] (lam : PrimeIndex M) : ℕ :=
  ringChar (𝓞 M ⧸ lam.asIdeal)

section Matrices
variable {G K : Type} [Group G] [Field K] {n : ℕ}

/-- The matrix form `G → GL_n(K)` of a representation on `K^n`. -/
def repToGL (ρ : Representation K G (Fin n → K)) : G →* GLn n K :=
  Matrix.GeneralLinearGroup.toLin.symm.toMonoidHom.comp ρ.asGroupHom

/-- The representation on `K^n` of a matrix representation `G → GL_n(K)`. -/
def glToRep (ρ : G →* GLn n K) : Representation K G (Fin n → K) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ)

/-- Absolute irreducibility: irreducible after extending scalars to an algebraic closure. -/
def IsAbsolutelyIrreducibleRep (ρ : Representation K G (Fin n → K)) : Prop :=
  (glToRep ((Matrix.GeneralLinearGroup.map (algebraMap K (AlgebraicClosure K))).comp
    (repToGL ρ))).IsIrreducible

end Matrices

/-!
### Supplier interfaces used in this part

Weil groups, Weil–Deligne parameters of local Galois representations, p-adic Hodge
invariants, reductions of stable lattices, cuspidal representations of `GL_n`, algebraic Hecke
characters, algebraic monodromy groups, deformation rings and Hecke algebras belong to the
roadmaps named in each docstring. They appear here as opaque data (types, subgroups,
homomorphisms, numbers, multisets, polynomials); every predicate in this part is defined from
these data.
-/

section WeilDeligne
variable {F : Type} [Field F] [NumberField F]

/-- The Weil group `W_{F_v}`: the elements of `decompositionGroup v` acting on the residue field
by an integral power of Frobenius. Owner: ArithmeticGaloisRepresentations:R01.1. -/
def weilGroup (v : PrimeIndex F) : Subgroup (GaloisGroup F) := sorry

/-- The degree map `d : W_{F_v} → ℤ`, sending an arithmetic Frobenius lift to `1`.
Owner: ArithmeticGaloisRepresentations:R01.1. -/
def weilDegree (v : PrimeIndex F) : weilGroup v →* Multiplicative ℤ := sorry

/-- A Weil–Deligne representation of `W_{F_v}` of rank `n` over `E`: a representation of
`W_{F_v}` trivial on an open subgroup of inertia, with a nilpotent monodromy operator `N`
satisfying `r(w) N r(w)⁻¹ = q_v^{d(w)} N` (Tate, *Number theoretic background*, §4.1; the
interface of PadicHodgeTheory:R06.3/weil-deligne-parameter). -/
structure WeilDeligneRep (v : PrimeIndex F) (E : Type) [Field E] (n : ℕ) where
  rep : weilGroup v →* GLn n E
  monodromy : Matrix (Fin n) (Fin n) E
  isNilpotent : IsNilpotent monodromy
  smooth : ∃ U : Subgroup (GaloisGroup F), IsOpen (U : Set (GaloisGroup F)) ∧
    ∀ w : weilGroup v, (w : GaloisGroup F) ∈ U → (w : GaloisGroup F) ∈ inertiaGroup v →
      rep w = 1
  commutation : ∀ w : weilGroup v,
    (rep w : Matrix (Fin n) (Fin n) E) * monodromy * ((rep w)⁻¹ : GLn n E) =
      ((v.norm : E) ^ Multiplicative.toAdd (weilDegree v w)) • monodromy

namespace WeilDeligneRep
variable {v : PrimeIndex F} {E E' : Type} [Field E] [Field E'] {n : ℕ}

/-- Isomorphism of Weil–Deligne representations: one conjugating matrix for `r` and `N`. -/
def IsIso (W W' : WeilDeligneRep v E n) : Prop :=
  ∃ P : GLn n E, (∀ w, W'.rep w = P * W.rep w * P⁻¹) ∧
    W'.monodromy = (P : Matrix (Fin n) (Fin n) E) * W.monodromy *
      ((P⁻¹ : GLn n E) : Matrix (Fin n) (Fin n) E)

/-- Extension of scalars of a Weil–Deligne representation along `ι : E → E'`. -/
def map (ι : E →+* E') (W : WeilDeligneRep v E n) : WeilDeligneRep v E' n where
  rep := (Matrix.GeneralLinearGroup.map ι).comp W.rep
  monodromy := W.monodromy.map ι
  isNilpotent := by sorry
  smooth := by sorry
  commutation := by sorry

/-- Unramified Weil–Deligne data: inertia acts trivially and `N = 0`. -/
def IsUnramified (W : WeilDeligneRep v E n) : Prop :=
  (∀ w : weilGroup v, (w : GaloisGroup F) ∈ inertiaGroup v → W.rep w = 1) ∧ W.monodromy = 0

/-- Frobenius semisimplicity: every `r(w)` is a semisimple endomorphism. -/
def IsFrobSemisimple (W : WeilDeligneRep v E n) : Prop :=
  ∀ w, Module.End.IsSemisimple (Matrix.toLin' (W.rep w : Matrix (Fin n) (Fin n) E))

/-- The characteristic polynomial of a geometric Frobenius lift on the `j`-th graded piece of the
monodromy filtration of `N`. Owner: PadicHodgeTheory:R06.3/weil-deligne-parameter. -/
def monodromyGradedCharpoly (W : WeilDeligneRep v E n) (j : ℤ) : Polynomial E := sorry

/-- The exponent of the Artin conductor of `W`.
Owner: ArithmeticGaloisRepresentations:R01.4. -/
def conductorExponent (W : WeilDeligneRep v E n) : ℕ := sorry

/-- Purity of weight `w` under `ι : E → ℂ`: geometric Frobenius eigenvalues on the `j`-th
monodromy-graded piece have `|ια|² = q_v^{w+j}` (BLGGT v1 §5.1, p. 52). -/
def IsPure (W : WeilDeligneRep v E n) (ι : E →+* ℂ) (w : ℤ) : Prop :=
  ∀ (j : ℤ) (α : ℂ), ((W.monodromyGradedCharpoly j).map ι).IsRoot α →
    ‖α‖ ^ 2 = (v.norm : ℝ) ^ (w + j)

end WeilDeligneRep

end WeilDeligne

section PadicHodge
variable {F : Type} [Field F] [NumberField F] {K : Type} [Field K] [TopologicalSpace K] {n : ℕ}

/-- `WD(ρ|_{W_{F_v}})^{F-ss}`: the Frobenius-semisimplified Weil–Deligne representation of the
restriction of an `l`-adic `ρ` to `W_{F_v}`, by Grothendieck's monodromy theorem when `v ∤ l` and
by Fontaine's `D_pst` when `v ∣ l` and `ρ|_{G_{F_v}}` is de Rham.
Owner: PadicHodgeTheory:R06.3/weil-deligne-parameter (with ArithmeticGaloisRepresentations:R01.5). -/
def localWD (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) :
    WeilDeligneRep v K n := sorry

/-- The labeled Hodge–Tate multiset of `ρ` at the embedding `σ : F → K` (at the place of `F` that
`σ` determines), each weight repeated with its multiplicity, in the normalization
`HT(ε) = {−1}`. Owner: PadicHodgeTheory:R06.2. -/
def hodgeTateWeights (ρ : Representation K (GaloisGroup F) (Fin n → K)) (σ : F →+* K) :
    Multiset ℤ := sorry

/-- The rank of `D_dR(ρ|_{G_{F_v}})` over `F_v ⊗_{ℚ_l} K`; it is at most `n`, with equality
exactly when `ρ|_{G_{F_v}}` is de Rham. Owner: PadicHodgeTheory:R06.2. -/
def deRhamRank (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) : ℕ :=
  sorry

/-- The rank of `D_cris(ρ|_{G_{F_v}})` over `F_{v,0} ⊗_{ℚ_l} K`.
Owner: PadicHodgeTheory:R06.2. -/
def crystallineRank (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) :
    ℕ := sorry

/-- The rank of `D_st(ρ|_{G_{F_v}})` over `F_{v,0} ⊗_{ℚ_l} K`.
Owner: PadicHodgeTheory:R06.2. -/
def semistableRank (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) :
    ℕ := sorry

/-- `ρ|_{G_{F_v}}` is de Rham. -/
def IsDeRhamAt (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) : Prop :=
  deRhamRank ρ v = n

/-- `ρ|_{G_{F_v}}` is crystalline. -/
def IsCrystallineAt (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) :
    Prop :=
  crystallineRank ρ v = n

/-- `ρ|_{G_{F_v}}` is semistable. -/
def IsSemistableAt (ρ : Representation K (GaloisGroup F) (Fin n → K)) (v : PrimeIndex F) :
    Prop :=
  semistableRank ρ v = n

/-- The Hodge–Tate multiset in the Khare–Wintenberger normalization `HT(ε) = {+1}`. -/
def kwHodgeTateWeights (ρ : Representation K (GaloisGroup F) (Fin n → K)) (σ : F →+* K) :
    Multiset ℤ :=
  (hodgeTateWeights ρ σ).map Neg.neg

end PadicHodge

section Reductions
variable {F : Type} [Field F] [NumberField F]

/-- The semisimplified reduction `ρ̄ : G_F → GL₂(𝔽̄_l)` of a `G_F`-stable lattice of a continuous
`ρ : G_F → GL₂(ℚ̄_l)`, independent of the lattice up to isomorphism.
Owner: ArithmeticGaloisRepresentations:R01.3. -/
def residualRep (l : ℕ) [Fact l.Prime] (ρ : GaloisGroup F →* GL2 (PadicAlgCl l)) :
    GaloisGroup F →* GL2 (AlgebraicClosure (ZMod l)) := sorry

/-- The exponent at `v` of the Artin conductor of a residual representation.
Owner: ArithmeticGaloisRepresentations:R01.4. -/
def residualConductorExponent {k : Type} [Field k] (ρ : GaloisGroup F →* GL2 k)
    (v : PrimeIndex F) : ℕ := sorry

end Reductions

section Cuspidal

/-- Regular algebraic cuspidal automorphic representations of `GL_n(𝔸_F)`.
Owner: AutomorphicGaloisRepresentations:R19.2 (general `n`: PotentialAutomorphyInfrastructure:PA.5). -/
def CuspidalGLn (F : Type) [Field F] [NumberField F] (n : ℕ) : Type := sorry

variable {F : Type} [Field F] [NumberField F] {n : ℕ}

/-- The exponent of the conductor of `π_v`. Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGLn.conductorExponent (π : CuspidalGLn F n) (v : PrimeIndex F) : ℕ := sorry

/-- The characteristic polynomial of `rec(π_v |det|_v^{(1−n)/2})(Frob_v)` (geometric Frobenius,
Harris–Taylor normalization of `rec`). Owner: AutomorphicGaloisRepresentations:R19.2. -/
def CuspidalGLn.recPolynomial (π : CuspidalGLn F n) (v : PrimeIndex F) : Polynomial ℂ := sorry

end Cuspidal

/-! ### Weakly compatible systems -/

/-- A rank-`n` weakly compatible system of `l`-adic representations of `G_F` over `M`
(BLGGT v1 §5.1, p. 51; Taylor, degree-two L-functions, §6, p. 773): a finite set `S`, monic
degree-`n` polynomials `Q_v ∈ M[X]`, continuous semisimple members `r_λ` over `K_λ ⊇ M_λ` and
Hodge multisets `H_τ`, such that for `λ` of residue characteristic `l`: `r_λ` is unramified at
`v ∉ S`, `v ∤ l`, with geometric Frobenius characteristic polynomial `Q_v`; `r_λ` is de Rham at
`v ∣ l` and crystalline there if `v ∉ S`; and `H_τ` is the labeled Hodge–Tate multiset at every
coefficient embedding extending `λ`. Geometric Frobenius is `(frobLift v)⁻¹` and `HT(ε) = {−1}`. -/
structure WeaklyCompatibleSystem (F M : Type) [Field F] [NumberField F] [Field M] [NumberField M]
    (K : PrimeIndex M → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (n : ℕ) where
  /-- A continuous embedding of the completion `M_λ` into the coefficient field `K_λ`. -/
  completionEmbedding : ∀ lam, lam.adicCompletion M →+* K lam
  completionEmbedding_continuous : ∀ lam, Continuous (completionEmbedding lam)
  S : Finset (PrimeIndex F)
  Q : PrimeIndex F → M[X]
  monic : ∀ v, v ∉ S → (Q v).Monic
  degree : ∀ v, v ∉ S → (Q v).natDegree = n
  member : ∀ lam, Representation (K lam) (GaloisGroup F) (Fin n → K lam)
  semisimple : ∀ lam, (member lam).IsSemisimpleRepresentation
  continuousAction : ∀ lam, Continuous (fun gv : GaloisGroup F × (Fin n → K lam) =>
    member lam gv.1 gv.2)
  H : (F →+* AlgebraicClosure M) → Multiset ℤ
  hodgeCard : ∀ τ, (H τ).card = n
  unramified : ∀ lam v, v ∉ S → ¬ v.LiesOver lam.residueChar →
    ∀ g ∈ inertiaGroup v, member lam g = 1
  frobenius : ∀ lam v, v ∉ S → ¬ v.LiesOver lam.residueChar →
    (member lam (frobLift v)⁻¹).charpoly =
      (Q v).map ((completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)))
  deRhamAt : ∀ lam v, v.LiesOver lam.residueChar → IsDeRhamAt (member lam) v
  crystallineAt : ∀ lam v, v ∉ S → v.LiesOver lam.residueChar → IsCrystallineAt (member lam) v
  hodgeTate : ∀ lam (ι : AlgebraicClosure M →+* K lam),
    ι.comp (algebraMap M (AlgebraicClosure M)) =
      (completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)) →
    ∀ τ, hodgeTateWeights (member lam) (ι.comp τ) = H τ

namespace WeaklyCompatibleSystem
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ}

/-- The rank `n`. -/
def rank (_ : WeaklyCompatibleSystem F M K n) : ℕ := n

/-- The coefficient embedding `M → M_λ → K_λ`. -/
def coefficientEmbedding (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M) :
    M →+* K lam :=
  (R.completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M))

/-- The coefficient embeddings `ι : M̄ → K_λ` extending `M → K_λ`. -/
def ExtendsCoefficients (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M)
    (ι : AlgebraicClosure M →+* K lam) : Prop :=
  ι.comp (algebraMap M (AlgebraicClosure M)) = R.coefficientEmbedding lam

/-- For `v ∉ S` and `v ∤ l`, `r_λ` is unramified at `v` and the characteristic polynomial of a
geometric Frobenius is the image of `Q_v` (BLGGT v1 §5.1, p. 51). -/
theorem charpoly_frob (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M)
    (v : PrimeIndex F) (hv : v ∉ R.S) (hl : ¬ v.LiesOver lam.residueChar) :
    (∀ g ∈ inertiaGroup v, R.member lam g = 1) ∧
      (R.member lam (frobLift v)⁻¹).charpoly = (R.Q v).map (R.coefficientEmbedding lam) := by
  sorry

/-- At `v ∣ l` the member is de Rham, and crystalline when `v ∉ S` (BLGGT v1 §5.1, p. 51). -/
theorem deRham (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M) (v : PrimeIndex F)
    (hv : v.LiesOver lam.residueChar) :
    IsDeRhamAt (R.member lam) v ∧ (v ∉ R.S → IsCrystallineAt (R.member lam) v) := by
  sorry

/-- Enlarging the exceptional set to `S' ⊇ S` keeps every `r_λ`, `Q_v` and `H_τ`. -/
def enlargeRamificationSet (R : WeaklyCompatibleSystem F M K n)
    (S' : Finset (PrimeIndex F)) (h : R.S ⊆ S') : WeaklyCompatibleSystem F M K n :=
  { R with
    S := S'
    monic := fun v hv => R.monic v (fun hS => hv (h hS))
    degree := fun v hv => R.degree v (fun hS => hv (h hS))
    unramified := fun lam v hv => R.unramified lam v (fun hS => hv (h hS))
    frobenius := fun lam v hv => R.frobenius lam v (fun hS => hv (h hS))
    crystallineAt := fun lam v hv => R.crystallineAt lam v (fun hS => hv (h hS)) }

/-! #### Predicates (BLGGT v1 §5.1, pp. 51–53) -/

/-- Regular: every `H_τ` has distinct entries. -/
def IsRegular (R : WeaklyCompatibleSystem F M K n) : Prop :=
  ∀ τ, (R.H τ).Nodup

/-- Extremely regular: regular, and some `H_τ` has no two distinct submultisets of the same
cardinality and the same sum. -/
def IsExtremelyRegular (R : WeaklyCompatibleSystem F M K n) : Prop :=
  R.IsRegular ∧ ∃ τ, ∀ A B : Multiset ℤ, A ≤ R.H τ → B ≤ R.H τ →
    A.card = B.card → A.sum = B.sum → A = B

/-- Strictly compatible (BLGGT sense): for every finite `v` a Weil–Deligne representation
`WD_v(ℛ)` over `M̄` with `ι WD_v(ℛ) ≅ WD(r_λ|_{W_{F_v}})^{F-ss}` for every `λ` not above the
residue characteristic of `v` and every `ι : M̄ → K_λ` extending `M → K_λ`. -/
def IsStrictlyCompatible (R : WeaklyCompatibleSystem F M K n) : Prop :=
  ∀ v : PrimeIndex F, ∃ W : WeilDeligneRep v (AlgebraicClosure M) n,
    ∀ lam : PrimeIndex M, ¬ v.LiesOver lam.residueChar →
      ∀ ι : AlgebraicClosure M →+* K lam, R.ExtendsCoefficients lam ι →
        (W.map ι).IsIso (localWD (R.member lam) v)

/-- Pure of weight `w`: every root `α` of `Q_v`, `v ∉ S`, has `|ια|² = (#k(v))^w` for every
`ι : M̄ → ℂ`, and `H_{cτ} = {w − h : h ∈ H_τ}` for every complex conjugation `c` of `M̄`. -/
def IsPure (R : WeaklyCompatibleSystem F M K n) (w : ℤ) : Prop :=
  (∀ v, v ∉ R.S → ∀ α : AlgebraicClosure M,
    ((R.Q v).map (algebraMap M (AlgebraicClosure M))).IsRoot α →
    ∀ σ : AlgebraicClosure M →+* ℂ, ‖σ α‖ ^ 2 = (v.norm : ℝ) ^ w) ∧
  (∀ (σ : AlgebraicClosure M →+* ℂ) (c : AlgebraicClosure M ≃+* AlgebraicClosure M),
    (∀ x, σ (c x) = star (σ x)) → ∀ τ : F →+* AlgebraicClosure M,
    R.H (c.toRingHom.comp τ) = (R.H τ).map (fun h => w - h))

/-- Strictly pure of weight `w`: strictly compatible with every `WD_v(ℛ)` pure of weight `w`
(including its monodromy filtration), and `H_{cτ} = {w − h : h ∈ H_τ}`. -/
def IsStrictlyPure (R : WeaklyCompatibleSystem F M K n) (w : ℤ) : Prop :=
  (∀ v : PrimeIndex F, ∃ W : WeilDeligneRep v (AlgebraicClosure M) n,
    (∀ lam : PrimeIndex M, ¬ v.LiesOver lam.residueChar →
      ∀ ι : AlgebraicClosure M →+* K lam, R.ExtendsCoefficients lam ι →
        (W.map ι).IsIso (localWD (R.member lam) v)) ∧
    ∀ σ : AlgebraicClosure M →+* ℂ, W.IsPure σ w) ∧
  (∀ (σ : AlgebraicClosure M →+* ℂ) (c : AlgebraicClosure M ≃+* AlgebraicClosure M),
    (∀ x, σ (c x) = star (σ x)) → ∀ τ : F →+* AlgebraicClosure M,
    R.H (c.toRingHom.comp τ) = (R.H τ).map (fun h => w - h))

/-- The value `μ_λ(g)` of a rank-one system, the scalar by which `g` acts. -/
def charValue (R : WeaklyCompatibleSystem F M K 1) (lam : PrimeIndex M) (g : GaloisGroup F) :
    K lam :=
  R.member lam g (fun _ => 1) 0

/-- Irreducible: `r_λ` absolutely irreducible for every `λ` above a set of rational primes of
Dirichlet density one. -/
def IsIrreducible (R : WeaklyCompatibleSystem F M K n) : Prop :=
  ∃ L : Set (PrimeIndex ℚ), NumberField.Set.HasDirichletDensity L 1 ∧
    ∀ lam : PrimeIndex M, (∃ l ∈ L, lam.residueChar = l.residueChar) →
      IsAbsolutelyIrreducibleRep (R.member lam)

/-- Automorphic: for some `ι : M → ℂ` there is a regular algebraic cuspidal `π` of `GL_n(𝔸_F)`,
unramified outside `S`, with `rec(π_v |det|^{(1−n)/2})(Frob_v)` of characteristic polynomial
`ι(Q_v)` for `v ∉ S` (BLGGT v1 §5.1, p. 53). -/
def IsAutomorphic (R : WeaklyCompatibleSystem F M K n) : Prop :=
  ∃ (ι : M →+* ℂ) (π : CuspidalGLn F n), ∀ v, v ∉ R.S →
    π.conductorExponent v = 0 ∧ (R.Q v).map ι = π.recPolynomial v

end WeaklyCompatibleSystem

end TauCeti.CompatibleSystems

noncomputable section
open scoped NumberField Polynomial
open IsDedekindDomain
namespace TauCeti.CompatibleSystems

open TauCeti.PotentialModularity (FinitePrime frobLift inertiaGroup decompositionGroup
  complexConjugation restrictionMap GL2 toRepresentation CuspidalGL2 IsModularLift
  IsLiftOfType KWLocalType unframedGlobalRing serreWeight IsSType restrictToCyclotomic
  IsAbsolutelyIrreducible ArisesFrom restrictRep IsContinuousResidual IsTotallyOdd
  cyclotomicCharacterPadic)

/-! ### Further supplier interfaces for the family layers -/

/-- The residue characteristic of a finite place is prime. -/
instance residueChar_fact {M : Type} [Field M] [NumberField M] (lam : PrimeIndex M) :
    Fact lam.residueChar.Prime := sorry

section Residual
variable {F : Type} [Field F] [NumberField F] {K : Type} [Field K] [TopologicalSpace K] {n : ℕ}

/-- The semisimplified reduction of a `G_F`-stable lattice of a member over a coefficient field
of residue characteristic `l`, with values in `𝔽̄_l`. Owner: ArithmeticGaloisRepresentations:R01.3. -/
def residualMember (l : ℕ) [Fact l.Prime] (ρ : Representation K (GaloisGroup F) (Fin n → K)) :
    GaloisGroup F →* GLn n (AlgebraicClosure (ZMod l)) := sorry

/-- The determinant character of a member, as a rank-one representation. -/
def detRep {G : Type} [Group G] (ρ : Representation K G (Fin n → K)) :
    Representation K G (Fin 1 → K) where
  toFun g := LinearMap.det (ρ g) • LinearMap.id
  map_one' := by sorry
  map_mul' := by sorry

end Residual

/-! ### Very weak and extremely weak data (ACC+ §7.1, pp. 1084–1085) -/

/-- Extremely weakly compatible data: the carrier of `WeaklyCompatibleSystem` (number fields,
finite `S`, monic good Frobenius polynomials, continuous semisimple members unramified with
those geometric Frobenius polynomials) with only the determinant Hodge condition
`HT_τ(det r_λ) = {Σ H_τ}` at every `λ`. -/
structure ExtremelyWeaklyCompatibleSystem (F M : Type) [Field F] [NumberField F] [Field M]
    [NumberField M] (K : PrimeIndex M → Type) [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (n : ℕ) where
  completionEmbedding : ∀ lam, lam.adicCompletion M →+* K lam
  S : Finset (PrimeIndex F)
  Q : PrimeIndex F → M[X]
  monic : ∀ v, v ∉ S → (Q v).Monic
  degree : ∀ v, v ∉ S → (Q v).natDegree = n
  member : ∀ lam, Representation (K lam) (GaloisGroup F) (Fin n → K lam)
  semisimple : ∀ lam, (member lam).IsSemisimpleRepresentation
  continuousAction : ∀ lam, Continuous (fun gv : GaloisGroup F × (Fin n → K lam) =>
    member lam gv.1 gv.2)
  H : (F →+* AlgebraicClosure M) → Multiset ℤ
  hodgeCard : ∀ τ, (H τ).card = n
  unramified : ∀ lam v, v ∉ S → ¬ v.LiesOver lam.residueChar →
    ∀ g ∈ inertiaGroup v, member lam g = 1
  frobenius : ∀ lam v, v ∉ S → ¬ v.LiesOver lam.residueChar →
    (member lam (frobLift v)⁻¹).charpoly =
      (Q v).map ((completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)))
  detHodge : ∀ lam (ι : AlgebraicClosure M →+* K lam),
    ι.comp (algebraMap M (AlgebraicClosure M)) =
      (completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)) →
    ∀ τ, hodgeTateWeights (detRep (member lam)) (ι.comp τ) = {(H τ).sum}

/-- Very weakly compatible data: extremely weak data whose members, for `λ` above a set of
rational primes of Dirichlet density one, are crystalline above `l` with Hodge–Tate multisets
`H_τ`. -/
structure VeryWeaklyCompatibleSystem (F M : Type) [Field F] [NumberField F] [Field M]
    [NumberField M] (K : PrimeIndex M → Type) [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (n : ℕ)
    extends ExtremelyWeaklyCompatibleSystem F M K n where
  densityOne : ∃ L : Set (PrimeIndex ℚ), NumberField.Set.HasDirichletDensity L 1 ∧
    ∀ lam : PrimeIndex M, (∃ l ∈ L, lam.residueChar = l.residueChar) →
      (∀ v : PrimeIndex F, v.LiesOver lam.residueChar → IsCrystallineAt (member lam) v) ∧
      ∀ ι : AlgebraicClosure M →+* K lam,
        ι.comp (algebraMap M (AlgebraicClosure M)) =
          (completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)) →
        ∀ τ, hodgeTateWeights (member lam) (ι.comp τ) = H τ

section Weakening
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ}

/-- A weakly compatible system is very weakly compatible (its full Hodge–Tate and crystalline
conditions hold at every `λ`). -/
def WeaklyCompatibleSystem.toVeryWeak (R : WeaklyCompatibleSystem F M K n) :
    VeryWeaklyCompatibleSystem F M K n where
  completionEmbedding := R.completionEmbedding
  S := R.S
  Q := R.Q
  monic := R.monic
  degree := R.degree
  member := R.member
  semisimple := R.semisimple
  continuousAction := R.continuousAction
  H := R.H
  hodgeCard := R.hodgeCard
  unramified := R.unramified
  frobenius := R.frobenius
  detHodge := by sorry
  densityOne := by sorry

/-- Forget the density-one condition. -/
def VeryWeaklyCompatibleSystem.toExtremelyWeak (R : VeryWeaklyCompatibleSystem F M K n) :
    ExtremelyWeaklyCompatibleSystem F M K n :=
  R.toExtremelyWeaklyCompatibleSystem

/-- The determinant Hodge condition: at every `λ` and coefficient embedding extending `λ`, the
Hodge–Tate weight of `det r_λ` is `Σ H_τ`. -/
theorem ExtremelyWeaklyCompatibleSystem.hodgeSum (R : ExtremelyWeaklyCompatibleSystem F M K n)
    (lam : PrimeIndex M) (ι : AlgebraicClosure M →+* K lam)
    (hι : ι.comp (algebraMap M (AlgebraicClosure M)) =
      (R.completionEmbedding lam).comp (algebraMap M (lam.adicCompletion M)))
    (τ : F →+* AlgebraicClosure M) :
    hodgeTateWeights (detRep (R.member lam)) (ι.comp τ) = {(R.H τ).sum} := by
  sorry

end Weakening

/-! ### Linear algebra, twists, restriction and induction (BLGGT v4 §5.1) -/

section Operations
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n m : ℕ}

/-- The normalized reciprocal polynomial `X^n Q(0)⁻¹ Q(X⁻¹)` of the dual. -/
def dualPolynomial (Q : M[X]) : M[X] := Polynomial.C ((Q.coeff 0)⁻¹) * Q.reverse

/-- Direct sum `ℛ ⊕ 𝒮`: members `r_λ ⊕ s_λ`, `Q_v = Q_v(ℛ) Q_v(𝒮)`, `H_τ = H_τ(ℛ) + H_τ(𝒮)`, with
`S = S(ℛ) ∪ S(𝒮)`. -/
def directSum (R : WeaklyCompatibleSystem F M K n) (T : WeaklyCompatibleSystem F M K m) :
    WeaklyCompatibleSystem F M K (n + m) := sorry

/-- Tensor product `(ℛ ⊗ 𝒮)^ss`: good roots `α_i β_j`, `H_τ` the pairwise sums. -/
def tensor (R : WeaklyCompatibleSystem F M K n) (T : WeaklyCompatibleSystem F M K m) :
    WeaklyCompatibleSystem F M K (n * m) := sorry

/-- Dual `ℛ^∨`: members `r_λ^∨`, `Q_v` the normalized reciprocal, `H_τ = −H_τ`. -/
def dual (R : WeaklyCompatibleSystem F M K n) : WeaklyCompatibleSystem F M K n := sorry

/-- `Sym^k ℛ`, of rank `binom(n + k − 1, k)`, with `H_τ` the repeated `k`-fold sums. -/
def symmetricPower (k : ℕ) (R : WeaklyCompatibleSystem F M K n) :
    WeaklyCompatibleSystem F M K (Nat.choose (n + k - 1) k) := sorry

/-- `∧^k ℛ`, of rank `binom(n, k)` (zero when `k > n`), with `H_τ` the distinct `k`-fold sums. -/
def exteriorPower (k : ℕ) (R : WeaklyCompatibleSystem F M K n) :
    WeaklyCompatibleSystem F M K (Nat.choose n k) := sorry

/-- Twist by a rank-one system: memberwise tensor with the character, local WD tensor and
Hodge shift. -/
def twist (R : WeaklyCompatibleSystem F M K n) (χ : WeaklyCompatibleSystem F M K 1) :
    WeaklyCompatibleSystem F M K n := sorry

/-- Restriction to `G_{F'}` for a finite extension `F'/F`: members restricted, `H_{τ'}` pulled back
along `F → F'`, and good roots raised to residue degrees. -/
def restrict {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (R : WeaklyCompatibleSystem F M K n) : WeaklyCompatibleSystem F' M K n := sorry

/-- Induction from `G_{F'}` to `G_F`: rank multiplied by `[F' : F]`, `S` enlarged by the primes
ramified in `F'/F`, local WD induction and Hodge multisets the unions over the embeddings of
`F'` extending each embedding of `F`. -/
def induce {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (R : WeaklyCompatibleSystem F' M K n) :
    WeaklyCompatibleSystem F M K (n * Module.finrank F F') := sorry

/-- The Hodge data of a direct sum. -/
theorem directSum_H (R : WeaklyCompatibleSystem F M K n) (T : WeaklyCompatibleSystem F M K m)
    (τ : F →+* AlgebraicClosure M) : (directSum R T).H τ = R.H τ + T.H τ := by
  sorry

/-- Pure systems of the same weight `w` have a pure direct sum of weight `w`. -/
theorem directSum_pure (R : WeaklyCompatibleSystem F M K n) (T : WeaklyCompatibleSystem F M K m)
    (w : ℤ) (hR : R.IsPure w) (hT : T.IsPure w) : (directSum R T).IsPure w := by
  sorry

/-- The good polynomials of a dual are the normalized reciprocals. -/
theorem dual_Q (R : WeaklyCompatibleSystem F M K n) (v : PrimeIndex F)
    (hv : v ∉ (dual R).S) : (dual R).Q v = dualPolynomial (R.Q v) := by
  sorry

/-- The Hodge data of a twist by a character with `H_τ(χ) = {a}` are shifted by `a`. -/
theorem twist_H (R : WeaklyCompatibleSystem F M K n) (χ : WeaklyCompatibleSystem F M K 1)
    (τ : F →+* AlgebraicClosure M) (a : ℤ) (ha : χ.H τ = {a}) :
    (twist R χ).H τ = (R.H τ).map (· + a) := by
  sorry

/-- The Hodge data of a tensor product are the pairwise sums. -/
theorem tensor_H (R : WeaklyCompatibleSystem F M K n) (T : WeaklyCompatibleSystem F M K m)
    (τ : F →+* AlgebraicClosure M) :
    (tensor R T).H τ = (R.H τ).bind (fun a => (T.H τ).map (a + ·)) := by
  sorry

/-- Restriction keeps the members, restricted to `G_{F'}`. -/
theorem restrict_member {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M) (g : GaloisGroup F') :
    (restrict (F' := F') R).member lam g =
      R.member lam (restrictionMap (algebraMap F F') g) := by
  sorry

/-- At a good place `w | v` of `F'`, the roots of `Q_w` are the `f`-th powers of the roots of `Q_v`,
`f` the residue degree. -/
theorem restrict_charpoly {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (R : WeaklyCompatibleSystem F M K n) (v : PrimeIndex F) (w : PrimeIndex F')
    (hw : w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 F')) = v.asIdeal)
    (hv : v ∉ R.S) (hw' : w ∉ (restrict (F' := F') R).S) (f : ℕ) (hf : w.norm = v.norm ^ f)
    (α : AlgebraicClosure M)
    (hα : ((R.Q v).map (algebraMap M (AlgebraicClosure M))).IsRoot α) :
    (((restrict (F' := F') R).Q w).map (algebraMap M (AlgebraicClosure M))).IsRoot (α ^ f) := by
  sorry

/-- The rank of an induced system is `[F' : F]` times the rank; induction need not preserve
regularity or irreducibility. -/
theorem induce_rank {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (R : WeaklyCompatibleSystem F' M K n) :
    (induce (F := F) R).rank = R.rank * Module.finrank F F' := by
  sorry

/-- Member-level normalized reciprocal formula for the dual representation. -/
theorem dual_charpoly {k G V : Type} [Field k] [Group G] [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (ρ : Representation k G V) (g : G) :
    (ρ.dual g).charpoly = Polynomial.C ((((ρ g).charpoly).coeff 0)⁻¹) *
      (ρ g).charpoly.reverse := by
  sorry

end Operations

/-! ### Essential conjugate self-duality and polarizations (BLGGT §§2.1, 5.1; G7) -/

section Polarized
variable {F Fplus M : Type} [Field F] [NumberField F] [Field Fplus] [NumberField Fplus]
variable [Field M] [NumberField M] {K : PrimeIndex M → Type}
variable [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}

/-- `(ℛ, ℳ)` is essentially conjugate self-dual: for every `λ` there is a nondegenerate pairing on
`r_λ` with `B(r_λ(g)x, r_λ(c g c)y) = μ_λ(j g) B(x, y)`, for the restriction `j : G_F → G_{F⁺}` and
the conjugation action `conj` of a complex conjugation on `G_F`. -/
def WeaklyCompatibleSystem.IsEssentiallySelfDual (R : WeaklyCompatibleSystem F M K n)
    (j : GaloisGroup F →* GaloisGroup Fplus) (conj : MulAut (GaloisGroup F))
    (μ : WeaklyCompatibleSystem Fplus M K 1) : Prop :=
  ∀ lam, ∃ B : (Fin n → K lam) ≃ₗ[K lam] Module.Dual (K lam) (Fin n → K lam),
    ∀ g x y, B (R.member lam g x) (R.member lam (conj g) y) =
      μ.charValue lam (j g) * B x y

/-- A polarized weakly compatible system: `ℛ` with a rank-one multiplier system `ℳ` of `G_{F⁺}` and
a perfect pairing for every `λ` and real place `v`, with `B(x, y) = ε_v B(y, x)`,
`B(r_λ(g)x, r_λ(c_v g c_v)y) = μ_λ(g) B(x, y)` and `ε_v = −μ_λ(c_v)` (the representation-level
polarization witness of ArithmeticGaloisRepresentations:G7). -/
structure PolarizedSystem (F Fplus M : Type) [Field F] [NumberField F]
    [Field Fplus] [NumberField Fplus] [Field M] [NumberField M]
    (K : PrimeIndex M → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (n : ℕ)
    (j : GaloisGroup F →* GaloisGroup Fplus)
    (c : (Fplus →+* ℝ) → GaloisGroup Fplus)
    (conjAction : (Fplus →+* ℝ) → MulAut (GaloisGroup F)) where
  system : WeaklyCompatibleSystem F M K n
  multiplier : WeaklyCompatibleSystem Fplus M K 1
  pairing : ∀ lam, (Fplus →+* ℝ) →
    (Fin n → K lam) ≃ₗ[K lam] Module.Dual (K lam) (Fin n → K lam)
  sign : ∀ lam, (Fplus →+* ℝ) → K lam
  signUnit : ∀ lam v, sign lam v = 1 ∨ sign lam v = -1
  symmetry : ∀ lam v x y, pairing lam v x y = sign lam v * pairing lam v y x
  covariance : ∀ lam v g x y,
    pairing lam v (system.member lam g x) (system.member lam (conjAction v g) y) =
      multiplier.charValue lam (j g) * pairing lam v x y
  cmSign : ∀ lam v, sign lam v = -multiplier.charValue lam (c v)

namespace PolarizedSystem
variable {j : GaloisGroup F →* GaloisGroup Fplus}
variable {c : (Fplus →+* ℝ) → GaloisGroup Fplus}
variable {a : (Fplus →+* ℝ) → MulAut (GaloisGroup F)}

/-- Totally odd: every sign `ε_v` is `+1` (for CM fields, `μ(c_v) = −1`). -/
def IsTotallyOdd (P : PolarizedSystem F Fplus M K n j c a) : Prop :=
  ∀ lam v, P.sign lam v = 1

/-- Each `r_λ^c` is `r_λ^∨ ⊗ μ_λ` through the given pairing. -/
theorem conjugateDual (P : PolarizedSystem F Fplus M K n j c a) (lam) (v) (g) (x y) :
    P.pairing lam v (P.system.member lam g x) (P.system.member lam (a v g) y) =
      P.multiplier.charValue lam (j g) * P.pairing lam v x y := by
  sorry

/-- Forgetting the pairings leaves an essentially conjugate self-dual system. -/
theorem isEssentiallySelfDual (P : PolarizedSystem F Fplus M K n j c a) (v : Fplus →+* ℝ) :
    P.system.IsEssentiallySelfDual j (a v) P.multiplier := by
  sorry

/-- Tensor product, with multiplier `μ μ' δ` for the quadratic character `δ` of `F/F⁺` (given as a
rank-one system with `δ(c_v) = −1`) and sign `ε ε'`. -/
def tensor (P : PolarizedSystem F Fplus M K n j c a) {m : ℕ}
    (Q : PolarizedSystem F Fplus M K m j c a) (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1) :
    PolarizedSystem F Fplus M K (n * m) j c a := sorry

/-- Dual, with inverse multiplier and the same sign. -/
def dual (P : PolarizedSystem F Fplus M K n j c a) : PolarizedSystem F Fplus M K n j c a := sorry

/-- Twist by a character `χ` of `G_F`, with the norm character `χ χ^c` extended to `G_{F⁺}`
(value `+1` at each `c_v`) multiplying the multiplier. -/
def twist (P : PolarizedSystem F Fplus M K n j c a) (χ : WeaklyCompatibleSystem F M K 1)
    (norm : WeaklyCompatibleSystem Fplus M K 1)
    (hnorm : ∀ lam v g, norm.charValue lam (j g) = χ.charValue lam g * χ.charValue lam (a v g))
    (hreal : ∀ lam v, norm.charValue lam (c v) = 1) : PolarizedSystem F Fplus M K n j c a :=
  sorry

/-- Symmetric or exterior `k`-th power (`k ≥ 1`), with multiplier `μ^k δ^{k−1}` and sign `ε^k`. -/
def power (exterior : Bool) (k : ℕ) (hk : 0 < k) (P : PolarizedSystem F Fplus M K n j c a)
    (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1) :
    PolarizedSystem F Fplus M K
      (if exterior then Nat.choose n k else Nat.choose (n + k - 1) k) j c a := sorry

/-- The sign of a tensor product is the product of the signs. -/
theorem tensor_sign (P : PolarizedSystem F Fplus M K n j c a) {m : ℕ}
    (Q : PolarizedSystem F Fplus M K m j c a) (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1)
    (lam) (v) : (P.tensor Q δ hδc hδj).sign lam v = P.sign lam v * Q.sign lam v := by
  sorry

/-- Two totally odd inputs give a totally odd normalized tensor product. -/
theorem tensor_isTotallyOdd (P : PolarizedSystem F Fplus M K n j c a) {m : ℕ}
    (Q : PolarizedSystem F Fplus M K m j c a) (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1)
    (hP : P.IsTotallyOdd) (hQ : Q.IsTotallyOdd) : (P.tensor Q δ hδc hδj).IsTotallyOdd := by
  sorry

end PolarizedSystem

end Polarized

/-! ### Character and Artin families, purity -/

/-- Algebraic Hecke characters of type `A₀` of `F` with algebraic values in `M`.
Owner: GlobalNumberFields Layers 9–10 (with ClassFieldTheory Layers 11–12 for reciprocity). -/
def AlgebraicHeckeCharacter (F M : Type) [Field F] [NumberField F] [Field M] [NumberField M] :
    Type := sorry

section Characters
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]

/-- The infinity type: `χ` at connected infinity is `∏ (τ x)^{−a_τ}`. Owner: GlobalNumberFields. -/
def AlgebraicHeckeCharacter.infinityType (χ : AlgebraicHeckeCharacter F M)
    (τ : F →+* AlgebraicClosure M) : ℤ := sorry

/-- The value of `χ` on a uniformizer at an unramified `v`, in `M`. Owner: GlobalNumberFields. -/
def AlgebraicHeckeCharacter.value (χ : AlgebraicHeckeCharacter F M) (v : PrimeIndex F) : M :=
  sorry

/-- The conductor of `χ`. Owner: GlobalNumberFields. -/
def AlgebraicHeckeCharacter.conductor (χ : AlgebraicHeckeCharacter F M) :
    Finset (PrimeIndex F) := sorry

/-- The rank-one family of `l`-adic realizations of an algebraic Hecke character. -/
def characterSystem (χ : AlgebraicHeckeCharacter F M) : WeaklyCompatibleSystem F M K 1 := sorry

/-- `H_τ = {a_τ}` for connected-infinity exponent `−a_τ`. -/
theorem characterSystem_hodge (χ : AlgebraicHeckeCharacter F M) (τ : F →+* AlgebraicClosure M) :
    (characterSystem (K := K) χ).H τ = {χ.infinityType τ} := by
  sorry

/-- The good polynomial is `X − χ(ϖ_v)` in the geometric Artin convention. -/
theorem characterSystem_frob (χ : AlgebraicHeckeCharacter F M) (v : PrimeIndex F)
    (hv : v ∉ (characterSystem (K := K) χ).S) :
    (characterSystem (K := K) χ).Q v = Polynomial.X - Polynomial.C (χ.value v) := by
  sorry

/-- A rank-one family with the same good polynomials as `characterSystem χ` has isomorphic
members. -/
theorem characterSystem_unique (χ : AlgebraicHeckeCharacter F M)
    (R : WeaklyCompatibleSystem F M K 1)
    (hQ : ∀ v, v ∉ R.S → v ∉ (characterSystem (K := K) χ).S →
      R.Q v = (characterSystem (K := K) χ).Q v) (lam : PrimeIndex M) :
    ∀ g, R.charValue lam g = (characterSystem (K := K) χ).charValue lam g := by
  sorry

/-- Every rank-one weakly compatible system is pure of some integer weight (ACC+ §7.1; BLGGT v4
§5.1): algebraic character classification. -/
theorem rank_one_purity (R : WeaklyCompatibleSystem F M K 1) : ∃ w : ℤ, R.IsPure w := by
  sorry

/-- Purity of induced character families: for finite `F'/F` and a pure rank-one family of
weight `w` over `F'`, the induced family is pure of weight `w` (each good eigenvalue `β` in a
residue-degree-`f` block has `β^f = α_w` with `|ια_w|² = q_v^{fw}`). -/
theorem induced_character_purity {F' : Type} [Field F'] [NumberField F'] [Algebra F F']
    (C : WeaklyCompatibleSystem F' M K 1) (w : ℤ) (hC : C.IsPure w) :
    (induce (F := F) C).IsPure w := by
  sorry

end Characters

section Artin
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ} {Γ : Type} [Group Γ] [Finite Γ]

/-- The Artin family of a representation `a` over `M` of a finite quotient `q : G_F → Γ` (with open
kernel): members `a ∘ q` after `M → K_λ`, `S` the primes ramified in the quotient, `H_τ` `n`
zeros, `Q_v` the characteristic polynomial of `a(q(Frob_v))`. -/
def artinSystem (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin n → M)) : WeaklyCompatibleSystem F M K n := sorry

theorem artinSystem_hodge (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin n → M)) (τ) :
    (artinSystem (K := K) q hq a).H τ = Multiset.replicate n 0 := by
  sorry

theorem artinSystem_charpoly (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin n → M)) (v) (hv : v ∉ (artinSystem (K := K) q hq a).S) :
    (artinSystem (K := K) q hq a).Q v = (a (q (frobLift v)⁻¹)).charpoly := by
  sorry

/-- The Artin family is pure of weight zero. -/
theorem artinSystem_pure (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin n → M)) : (artinSystem (K := K) q hq a).IsPure 0 := by
  sorry

/-- Artin families twisted by a pure character family (with the canonical Hodge data, `n` copies
of the character's Hodge number) are pure of the character's weight. -/
theorem artin_twist_purity (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin n → M)) (χ : WeaklyCompatibleSystem F M K 1) (w : ℤ)
    (hχ : χ.IsPure w) : (twist (artinSystem (K := K) q hq a) χ).IsPure w := by
  sorry

end Artin

/-- Independence of characteristic-zero reducibility in rank two (Taylor, degree-two
L-functions, Lemma 6.5, p. 773): if one member of a rank-two weakly compatible system over `ℚ` is
absolutely reducible, every member is. -/
theorem rank_two_reducibility_independent_of_lambda {M : Type} [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (R : WeaklyCompatibleSystem ℚ M K 2) (lam₀ : PrimeIndex M)
    (h : ¬ IsAbsolutelyIrreducibleRep (R.member lam₀)) (lam : PrimeIndex M) :
    ¬ IsAbsolutelyIrreducibleRep (R.member lam) := by
  sorry

/-! ### L-functions of systems (BLGGT v4 §5.1, pp. 52–53) -/

section LFunctions
variable {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
variable {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
variable {n : ℕ}

/-- The partial L-function `L^S(ıℛ, s) = ∏_{v ∉ S} q_v^{ns} / ıQ_v(q_v^s)`. -/
def partialLFunction (R : WeaklyCompatibleSystem F M K n) (ι : M →+* ℂ) (s : ℂ) : ℂ := by
  classical
  exact ∏' v, if v ∈ R.S then 1 else
    (v.norm : ℂ) ^ ((n : ℂ) * s) / ((R.Q v).map ι).eval ((v.norm : ℂ) ^ s)

/-- The Euler factor `L(ıWD_v, s)` of a Weil–Deligne representation (inverse characteristic
polynomial of Frobenius on the `N`-invariant inertia invariants at `q_v^{−s}`).
Owner: PadicHodgeTheory:R06.3. -/
def eulerFactor {v : PrimeIndex F} {E : Type} [Field E] (W : WeilDeligneRep v E n)
    (ι : E →+* ℂ) (s : ℂ) : ℂ := sorry

/-- The full L-function `L(ıℛ, s) = ∏_v L(ıWD_v(ℛ), s)` of a strictly compatible system, from its
Weil–Deligne parameters `WD_v(ℛ)`. -/
def lFunction (R : WeaklyCompatibleSystem F M K n) (hR : R.IsStrictlyCompatible)
    (ι : AlgebraicClosure M →+* ℂ) (s : ℂ) : ℂ :=
  ∏' v, eulerFactor (Classical.choose (hR v)) ι s

/-- Integer real-place multiplicities `d^±`: `n/2` for `n` even, `(n ± (−1)^{w/2} det ℛ(c_v))/2`
for `n` odd. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- The archimedean factor `L_v(ıℛ, s)` at a real or complex place in BLGGT v4's form. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- The archimedean root number `ε_v = i^{d^− + Σ |h − w/2|}` (real) or
`i^{Σ_{H_τ} |h − w/2| + Σ_{H_{τ'}} |h − w/2|}` (complex). -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ) (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

/-- The completed L-function `Λ(ıℛ, s) = L(ıℛ, s) ∏_{v | ∞} L_v(ıℛ, s)`, from the Weil–Deligne
parameters and the archimedean factors at the real places (with their `d^±`) and the
complex places (with the two Hodge multisets). -/
def completedLFunction (R : WeaklyCompatibleSystem F M K n) (hR : R.IsStrictlyCompatible)
    (ι : AlgebraicClosure M →+* ℂ) (archimedean : ℂ → ℂ) (s : ℂ) : ℂ :=
  lFunction R hR ι s * archimedean s

open Classical in
/-- For `ℛ` pure of weight `w` the partial Euler product converges on `Re s > 1 + w/2`. -/
theorem partialLFunction_converges (R : WeaklyCompatibleSystem F M K n) (w : ℤ)
    (hR : R.IsPure w) (ι : M →+* ℂ) (s : ℂ) (hs : 1 + (w : ℝ) / 2 < s.re) :
    Multipliable (fun v : PrimeIndex F => if v ∈ R.S then (1 : ℂ) else
      (v.norm : ℂ) ^ ((n : ℂ) * s) / ((R.Q v).map ι).eval ((v.norm : ℂ) ^ s)) := by
  sorry

/-- When `S` contains the places above `l`, the partial L-function depends only on the member at
any `λ | l`: two systems with isomorphic members at `λ` and equal `S` have equal `L^S`. -/
theorem partialLFunction_eq_of_lambda (R T : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M)
    (hS : R.S = T.S) (hSl : ∀ v : PrimeIndex F, v.LiesOver lam.residueChar → v ∈ R.S)
    (hiso : ∃ e : (Fin n → K lam) ≃ₗ[K lam] (Fin n → K lam),
      ∀ g x, e (R.member lam g x) = T.member lam g (e x))
    (ι : M →+* ℂ) (s : ℂ) : partialLFunction R ι s = partialLFunction T ι s := by
  sorry

end LFunctions

/-! ### The arithmetic representation ring (BLGGT v4 §5.3) -/

/-- The Grothendieck ring `Rep_{F,l}` of semisimple continuous `ℚ̄_l`-representations of `G_F`
unramified almost everywhere, with multiplication the semisimplified tensor product.
Owner of the arithmetic category: ArithmeticGaloisRepresentations:G7. -/
def RepRing (F : Type) [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] : Type := sorry

namespace RepRing
variable {F : Type} [Field F] [NumberField F] {l : ℕ} [Fact l.Prime]

noncomputable instance : CommRing (RepRing F l) := sorry

/-- The class `[V]` of a representation. -/
def ofRep {n : ℕ} (ρ : Representation (PadicAlgCl l) (GaloisGroup F) (Fin n → PadicAlgCl l)) :
    RepRing F l := sorry

/-- `tr σ : Rep_{F,l} → ℚ̄_l`, a ring homomorphism for each `σ ∈ G_F`. -/
def trace (σ : GaloisGroup F) : RepRing F l →+* PadicAlgCl l := sorry

/-- `(A, B) = dim Hom_{G_F}(A, B)`, extended bilinearly. -/
def pairing : RepRing F l →+ RepRing F l →+ ℤ := sorry

/-- The dimension `tr 1`. -/
def dim (A : RepRing F l) : PadicAlgCl l := trace 1 A

/-- Positive dimension and `(A, A) = 1` force `A` to be the class of an irreducible
representation. -/
theorem eq_irreducible_of_pairing_eq_one (A : RepRing F l) (hdim : ∃ d : ℕ, 0 < d ∧ dim A = d)
    (hnorm : pairing A A = 1) :
    ∃ (n : ℕ) (ρ : Representation (PadicAlgCl l) (GaloisGroup F) (Fin n → PadicAlgCl l)),
      ρ.IsIrreducible ∧ A = ofRep ρ := by
  sorry

/-- Restriction to `G_{F'}`, a ring homomorphism. -/
def res {F' : Type} [Field F'] [NumberField F'] [Algebra F F'] : RepRing F l →+* RepRing F' l :=
  sorry

/-- Induction from `G_{F'}`, additive, with the trace formula, the projection formula
`ind(A · res B) = ind A · B`, Frobenius reciprocity and Mackey's formula. -/
def ind {F' : Type} [Field F'] [NumberField F'] [Algebra F F'] : RepRing F' l →+ RepRing F l :=
  sorry

/-- The projection formula. -/
theorem ind_mul_res {F' : Type} [Field F'] [NumberField F'] [Algebra F F'] (A : RepRing F' l)
    (B : RepRing F l) : ind (A * res B) = ind A * B := by
  sorry

/-- Frobenius reciprocity `(ind A, B) = (A, res B)`. -/
theorem pairing_ind {F' : Type} [Field F'] [NumberField F'] [Algebra F F'] (A : RepRing F' l)
    (B : RepRing F l) : pairing (ind A) B = pairing A (res B) := by
  sorry

/-- Brauer induction: `A = Σ n_i ind([ψ_i] · res A)` for soluble subextensions `F_i` and
characters `ψ_i` of `G_{F_i}` (BLGGT v4 Lemma 5.3.1 with Brauer's theorem). -/
theorem brauer (A : RepRing F l) :
    ∃ (r : ℕ) (Fi : Fin r → IntermediateField F (AlgebraicClosure F))
      (_ : ∀ i, NumberField (Fi i)) (n : Fin r → ℤ)
      (ψ : ∀ i, Representation (PadicAlgCl l) (GaloisGroup (Fi i)) (Fin 1 → PadicAlgCl l)),
      A = ∑ i, n i • ind (ofRep (ψ i) * res A) := by
  sorry

/-- `L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}` for `A = Σ n_i [V_i]`, from the Euler factors of the
irreducible constituents. -/
def partialLFunction (Lirr : ∀ n : ℕ,
    Representation (PadicAlgCl l) (GaloisGroup F) (Fin n → PadicAlgCl l) → ℂ → ℂ)
    (A : RepRing F l) (s : ℂ) : ℂ := sorry

end RepRing

/-! ### Monodromy groups and residual irreducibility (BLGGT v4 §5.2) -/

/-- Larsen's monodromy data for a weakly compatible system with rational coefficients: the
Zariski closures `G_l` of the images and the groups derived from them. Owner of the algebraic
groups: ArithmeticGaloisRepresentations:R01.5 (Larsen–Pink, Serre). -/
structure LarsenData (F : Type) [Field F] [NumberField F] (n : ℕ) where
  /-- `G_l`, the Zariski closure of `r_l(G_F)` in `GL_n/ℚ_l`, as its group of `ℚ_l`-points. -/
  G : ∀ l : Nat.Primes, Subgroup (GLn n ℚ_[(l : ℕ)])
  /-- The identity component `G⁰_l`. -/
  identityComponent : ∀ l : Nat.Primes, Subgroup (GLn n ℚ_[(l : ℕ)])
  identityComponent_le : ∀ l, identityComponent l ≤ G l
  /-- `F⁰/F` with `Gal(F⁰/F) ≅ Γ_l/Γ⁰_l` for every `l`. -/
  componentField : IntermediateField F (AlgebraicClosure F)
  componentField_finite : FiniteDimensional F componentField
  componentField_galois : IsGalois F componentField
  /-- `Γ^H_l ⊆ H_l(ℚ_l)`, the preimage of `Γ⁰⁰_l` in `G^sc_l × Z_l`, as an abstract profinite group
  with its map to `G⁰_l(ℚ_l)`. -/
  gammaH : Nat.Primes → Type
  [gammaH_group : ∀ l, Group (gammaH l)]
  gammaH_map : ∀ l, gammaH l →* identityComponent l
  /-- `A(n)`, a uniform bound with `#ker(G^sc_l → G^ad_l) ∣ A(n)`. -/
  A : ℕ
  A_pos : 0 < A
  /-- The order of `ker(G^sc_l → G^ad_l)`, divisible into `A`. -/
  centerOrder : Nat.Primes → ℕ
  centerOrder_dvd : ∀ l, centerOrder l ∣ A
  /-- Serre's `θ_l : S_{F⁰,l} → C_l`, recorded by its exponents `m_{μ,σ}`: for each embedding `σ`
  of `F⁰` and each of the `rankC` weights `μ` of the centre, `(A μ) ∘ θ_l = Σ_σ m_{μ,σ} σ`. -/
  rankC : ℕ
  theta : Nat.Primes → (componentField →+* ℝ) → (Fin rankC → ℤ)

attribute [instance] LarsenData.gammaH_group

/-- Larsen's data exist for every weakly compatible system with rational coefficients, with the
image of `r_l` open in `G_l` (Bogomolov) and `Gal(F⁰/F) ≅ G_l/G⁰_l` for every `l`
(Larsen–Pink 6.14). -/
theorem larsenData_exists {F : Type} [Field F] [NumberField F] {n : ℕ}
    {K : PrimeIndex ℚ → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (R : WeaklyCompatibleSystem F ℚ K n) : Nonempty (LarsenData F n) := by
  sorry

/-- Serre's bounds (BLGGT v4 Lemma 5.2.1): `θ_l` is surjective onto `C_l`, agrees with the
reciprocity map on the units at `l` when `l ∉ S`, and its exponents and the torsion of the
cokernel of `θ_l^*` are bounded by constants `C(ℛ)`, `D(ℛ)` independent of `l` (but not of `ℛ`). -/
theorem serre_theta_uniform_bounds {F : Type} [Field F] [NumberField F] {n : ℕ}
    (L : LarsenData F n) :
    ∃ C : ℕ, ∀ l : Nat.Primes, ∀ τ, ∀ i, (L.theta l τ i).natAbs < C := by
  sorry

/-- Larsen's good primes (BLGGT v4 Lemma 5.2.2 after Larsen): there is a set of rational primes of
Dirichlet density one at which `G⁰_l` is unramified, `Γ^H_l` is the `ℤ_l`-points of a
semisimple-times-torus model up to bounded index, and the lattice conditions (5)–(6) hold.
Recorded here through the hyperspecial index bound. -/
theorem larsen_good_primes {F : Type} [Field F] [NumberField F] {n : ℕ} (L : LarsenData F n) :
    ∃ P : Set (PrimeIndex ℚ), NumberField.Set.HasDirichletDensity P 1 ∧
      ∃ B : ℕ, ∀ l : Nat.Primes, (∃ p ∈ P, p.residueChar = l) → L.centerOrder l ≤ B := by
  sorry

/-- The component group `G_λ/G⁰_λ` of the Zariski closure `G_λ` of `r_λ(G_F)`.
Owner: ArithmeticGaloisRepresentations:R01.5. -/
def componentGroup {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}
    (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M) : Type := sorry

noncomputable instance {F M : Type} [Field F] [NumberField F] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}
    (R : WeaklyCompatibleSystem F M K n) (lam : PrimeIndex M) : Group (componentGroup R lam) :=
  sorry

/-- The common monodromy component field (BLGGT v4 Lemma 5.3.1): one finite Galois `F¹/F` with
`Gal(F¹/F) ≅ G_λ/G⁰_λ` for every `λ`; for regular `ℛ`, irreducible subrepresentations under open
subgroups have multiplicity one and are defined over `M_λ` after one finite coefficient
extension. Omitted conclusion: that multiplicity-one and rationality clause, which needs the
algebraic monodromy groups of ArithmeticGaloisRepresentations:R01.5. -/
theorem monodromy_component_field {F M : Type} [Field F] [NumberField F] [Field M]
    [NumberField M] {K : PrimeIndex M → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] {n : ℕ} (R : WeaklyCompatibleSystem F M K n) :
    ∃ F₁ : IntermediateField F (AlgebraicClosure F), FiniteDimensional F F₁ ∧ IsGalois F F₁ ∧
      ∀ lam, Nonempty ((F₁ ≃ₐ[F] F₁) ≃* componentGroup R lam) := by
  sorry

/-- Density-one residual irreducibility (BLGGT v4 Proposition 5.3.2): for regular `ℛ` there is a
set `L` of rational primes of Dirichlet density one such that for `λ` above `L`, the residual
representation of the member (restricted to `G_{F(ζ_l)}`) is irreducible whenever the member is
irreducible. -/
theorem residual_irreducibility_density_one {F M : Type} [Field F] [NumberField F] [Field M]
    [NumberField M] {K : PrimeIndex M → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] {n : ℕ} (R : WeaklyCompatibleSystem F M K n)
    (hR : R.IsRegular) :
    ∃ L : Set (PrimeIndex ℚ), NumberField.Set.HasDirichletDensity L 1 ∧
      ∀ lam : PrimeIndex M, (∃ l ∈ L, lam.residueChar = l.residueChar) →
        IsAbsolutelyIrreducibleRep (R.member lam) →
        IsAbsolutelyIrreducibleRep (glToRep ((residualMember lam.residueChar (R.member lam)).comp
          (restrictionMap (algebraMap F (CyclotomicField lam.residueChar F))))) := by
  sorry

/-- Polarized constituents (BLGGT v4 Lemma 5.4.5): for `F` imaginary CM, `(ℛ, ℳ)` pure, extremely
regular and polarized, `F'/F` finite and `s` an irreducible subrepresentation of `r_λ|_{G_{F'}}`,
there is a CM field `F ⊆ F'' ⊆ F'` with `s` invariant under `G_{F''}` and `(s, μ_λ|_{G_{F''⁺}})`
polarized, totally odd when `(ℛ, ℳ)` is. -/
theorem constituents_essentially_self_dual {F Fplus M : Type} [Field F] [NumberField F]
    [NumberField.IsCMField F] [Field Fplus] [NumberField Fplus] [Field M] [NumberField M]
    {K : PrimeIndex M → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] {n : ℕ}
    {j : GaloisGroup F →* GaloisGroup Fplus} {c : (Fplus →+* ℝ) → GaloisGroup Fplus}
    {a : (Fplus →+* ℝ) → MulAut (GaloisGroup F)}
    (P : PolarizedSystem F Fplus M K n j c a) (w : ℤ) (hpure : P.system.IsPure w)
    (hreg : P.system.IsExtremelyRegular)
    (F' : IntermediateField F (AlgebraicClosure F)) (hF' : FiniteDimensional F F')
    (lam : PrimeIndex M) (s : Submodule (K lam) (Fin n → K lam))
    (hs : ∀ g : GaloisGroup F', ∀ x ∈ s,
      P.system.member lam (restrictionMap (algebraMap F F') g) x ∈ s) :
    ∃ F'' : IntermediateField F (AlgebraicClosure F), F'' ≤ F' ∧ NumberField.IsCMField F'' ∧
      ∀ g : GaloisGroup F'', ∀ x ∈ s,
        P.system.member lam (restrictionMap (algebraMap F F'') g) x ∈ s := by
  sorry

end TauCeti.CompatibleSystems

noncomputable section
open scoped NumberField Polynomial
open IsDedekindDomain
namespace TauCeti.CompatibleSystems

open TauCeti.PotentialModularity (FinitePrime frobLift inertiaGroup decompositionGroup
  complexConjugation restrictionMap GL2 CuspidalGL2 IsModularLift IsLiftOfType KWLocalType
  unframedGlobalRing serreWeight IsSType restrictToCyclotomic IsAbsolutelyIrreducible ArisesFrom
  restrictRep IsContinuousResidual IsTotallyOdd cyclotomicCharacterPadic HasKWWitnesses
  IsKWField QBar)

/-! ## R24.3 — Presentations and the four required lift types -/

/-- `R` has a presentation `𝒪⟦x₁, …, x_r⟧/(f₁, …, f_s)` as an `𝒪`-algebra. -/
def HasPresentation (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (r s : ℕ) : Prop :=
  ∃ f : Fin s → MvPowerSeries (Fin r) O,
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range f)))

/-- `R` is flat over `𝒪` and a complete intersection of relative dimension `d`: a presentation
`𝒪⟦x₁, …, x_{s+d}⟧/(f₁, …, f_s)` by a regular sequence. -/
def IsFlatCompleteIntersection (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (d : ℕ) :
    Prop :=
  Module.Flat O R ∧ ∃ (s : ℕ) (f : Fin s → MvPowerSeries (Fin (s + d)) O),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin (s + d)) O) (List.ofFn f) ∧
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin (s + d)) O ⧸ Ideal.span (Set.range f)))

/-- A choice of local deformation conditions `X = (X_ℓ)_{ℓ ∈ S}` for `ρ̄ : G_ℚ → GL₂(k)`.
Owner: LocalGaloisDeformationRings:R08.6. -/
def LocalConditions (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (S : Finset ℕ) : Type := sorry

section Bockle
variable {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {ρ : GaloisGroup ℚ →* GL2 k}
  {S : Finset ℕ}

/-- The local ring `R_{X,ℓ}`. Owner: LocalGaloisDeformationRings:R08.6. -/
def LocalConditions.localRing (X : LocalConditions p ρ S) (ℓ : ℕ) : Type := sorry
noncomputable instance (X : LocalConditions p ρ S) (ℓ : ℕ) : CommRing (X.localRing ℓ) := sorry
noncomputable instance (X : LocalConditions p ρ S) (ℓ : ℕ) : Algebra ℤ_[p] (X.localRing ℓ) :=
  sorry

/-- The global ring `R_X`, with fixed determinant when `d = 0`. Owner: GlobalGaloisDeformations:R04.3. -/
def LocalConditions.globalRing (X : LocalConditions p ρ S) (d : Fin 2) : Type := sorry
noncomputable instance (X : LocalConditions p ρ S) (d : Fin 2) : CommRing (X.globalRing d) :=
  sorry
noncomputable instance (X : LocalConditions p ρ S) (d : Fin 2) :
    Algebra ℤ_[p] (X.globalRing d) := sorry

/-- `h⁰(G_ℓ, Ad_X)`, with `Ad_X = Ad⁰ ρ̄` for `d = 0` and `Ad ρ̄` for `d = 1`.
Owner: GlobalGaloisDeformations:R04.3. -/
def LocalConditions.h0 (_X : LocalConditions p ρ S) (d : Fin 2) (ℓ : ℕ) : ℕ := sorry

end Bockle

/-- Böckle's presentation (appendix to Khare, Proposition 1, p. 2; KW Annals Proposition 3.4):
let `ρ̄ : G_ℚ → GL₂(k)` be odd and absolutely irreducible and `X` local conditions unramified
outside `S`. If each `R_{X,ℓ}` (`ℓ ∈ S, ℓ ≠ p`) is a flat complete intersection of relative dimension
`h⁰(G_ℓ, Ad_X) − Δ_ℓ` and `R_{X,p}` one of relative dimension `h⁰(G_p, Ad_X) + 1 + d − Δ_p`, then
`R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ})` for some `n`, with `Δ = Σ Δ_ℓ`. Oddness enters through
the global Euler characteristic. This is a presentation, not a lift-existence theorem. -/
theorem bockle_presentation (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k]
    (ρ : GaloisGroup ℚ →* GL2 k) (hodd : IsTotallyOdd ρ) (hirr : IsAbsolutelyIrreducible ρ)
    (S : Finset ℕ) (hpS : p ∈ S) (X : LocalConditions p ρ S) (d : Fin 2) (Δ : ℕ → ℤ)
    (hloc : ∀ ℓ ∈ S, ℓ ≠ p → ∃ e : ℕ, (e : ℤ) = (X.h0 d ℓ : ℤ) - Δ ℓ ∧
      IsFlatCompleteIntersection ℤ_[p] (X.localRing ℓ) e)
    (hp : ∃ e : ℕ, (e : ℤ) = (X.h0 d p : ℤ) + 1 + d - Δ p ∧
      IsFlatCompleteIntersection ℤ_[p] (X.localRing p) e) :
    ∃ r s : ℕ, (r : ℤ) - s = (d : ℤ) - ∑ ℓ ∈ S, Δ ℓ ∧
      HasPresentation ℤ_[p] (X.globalRing d) r s := by
  sorry

/-- Finite plus few relations gives a finite flat complete intersection (Böckle, Lemma 2; the
algebra of DeformationAndDerivedPatchingAlgebra:R03.3): for `𝒪` a complete DVR with uniformizer `π`,
`A = 𝒪⟦x₁, …, x_n⟧` and `f₁, …, f_m ∈ 𝔪_A` with `m ≤ n`, if `R = A/(f)` is nonzero and finite over `𝒪`
then `m = n`, `(π, f₁, …, f_n)` is `A`-regular and `R` is flat over `𝒪`. Finiteness is essential:
`𝒪⟦x⟧` is a flat complete intersection but not finite. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- Khare's minimal and auxiliary deformation rings `R_Q` and Hecke algebras `𝕋_Q` (Khare,
Inventiones 154), with the canonical map `R_Q → 𝕋_Q`.
Owner: GlobalGaloisDeformations:R04 and GL2ModularityLifting:R22.3. -/
def KhareRing (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (Q : Finset ℕ) : Type := sorry

/-- The Hecke algebra `𝕋_Q`. Owner: GL2ModularityLifting:R22.3. -/
def KhareHecke (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k)
    (Q : Finset ℕ) : Type := sorry

section KhareRings
variable {p : ℕ} [Fact p.Prime] {k : Type} [Field k] {ρ : GaloisGroup ℚ →* GL2 k}
noncomputable instance (Q : Finset ℕ) : CommRing (KhareRing p ρ Q) := sorry
noncomputable instance (Q : Finset ℕ) : CommRing (KhareHecke p ρ Q) := sorry
noncomputable instance (Q : Finset ℕ) : Algebra ℤ_[p] (KhareRing p ρ Q) := sorry
noncomputable instance (Q : Finset ℕ) : Algebra ℤ_[p] (KhareHecke p ρ Q) := sorry

/-- The canonical surjection `R_Q → 𝕋_Q`. Owner: GL2ModularityLifting:R22.3. -/
def KhareRing.toHecke (Q : Finset ℕ) : KhareRing p ρ Q →ₐ[ℤ_[p]] KhareHecke p ρ Q := sorry
end KhareRings

/-- Böckle's Theorem 1 (appendix to Khare): if for some auxiliary set `Q` the map `R_Q → 𝕋_Q` is an
isomorphism of finite flat `W(k)`-algebras, the minimal `R_∅ → 𝕋_∅` is an isomorphism. The
presentation comes from GlobalGaloisDeformations:R04 and `R_Q ≅ 𝕋_Q` from GL2ModularityLifting:R22;
this is not a lift-existence theorem. -/
theorem bockle_minimal_r_equals_t (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k]
    (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ) (Q : Finset ℕ)
    (hfin : Module.Finite ℤ_[p] (KhareRing p ρ Q) ∧ Module.Flat ℤ_[p] (KhareRing p ρ Q))
    (hiso : Function.Bijective (KhareRing.toHecke (p := p) (ρ := ρ) Q)) :
    Function.Bijective (KhareRing.toHecke (p := p) (ρ := ρ) ∅) := by
  sorry

/-- Minimally ramified lifts (KW Annals, Theorem 3.3, §3): for `ρ̄` of S-type with `p > 2`,
`ρ̄|_{G_{ℚ(μ_p)}}` absolutely irreducible, `2 ≤ k(ρ̄) ≤ p + 1` and `k(ρ̄) ≠ p`, the minimal ring with the
crystalline condition at `p` has a `ℚ̄_p`-point, i.e. `ρ̄` has a minimally ramified lift crystalline
of weight `k(ρ̄)`; when `k(ρ̄) = p + 1` there is also a semistable weight-two minimal lift. The ring
has a Böckle presentation with `r ≥ s`, is finite over `W(k)` (Proposition 3.8), hence finite
flat and a complete intersection with a characteristic-zero point. -/
theorem kw_annals_minimal_lifts (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : Type} [Field k]
    [Finite k] [CharP k p] (ρ : GaloisGroup ℚ →* GL2 k) (hS : IsSType ρ)
    (hcyc : IsAbsolutelyIrreducible (restrictToCyclotomic ρ ⟨p, (Fact.out : p.Prime).pos⟩))
    (hwt : 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1) (hwtp : serreWeight ρ ≠ p)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) :
    Nonempty (unframedGlobalRing p ρ S ψ KWLocalType.A →ₐ[ℤ_[p]] PadicAlgCl p) ∧
      (serreWeight ρ = p + 1 →
        Nonempty (unframedGlobalRing p ρ S ψ KWLocalType.C →ₐ[ℤ_[p]] PadicAlgCl p)) := by
  sorry

/-- The four required lift types of KW I Theorem 5.1 (KW II, §5, pp. 504–505 of KW I), with their
numerical auxiliary data: (1) minimal crystalline of weight `k(ρ̄)` (`k(ρ̄) = 2` if `p = 2`);
(2) weight two, minimal away from `p`, with inertial WD parameter `(ω^{k(ρ̄)−2} ⊕ 1, 0)` at `p`, or
`(id, N ≠ 0)` when `k(ρ̄) = p + 1`; (3) at an odd `q ∥ N(ρ̄)` with `p ∣ q − 1`, inertial character
`ω_q^i` (`0 < i ≤ q − 2`, `i` even if `p = 2`); (4) at `q ≠ p` with `p ∣ q + 1`, a level-two character
`ω_{q,2}^i ω_{q,2}^{qj}` of `p`-power order (`i + j` even if `p = 2`). -/
inductive RequiredLiftType (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

namespace RequiredLiftType
variable {p k : ℕ}

/-- The local condition at `p` (LocalGaloisDeformationRings:R08.6): type (A) for case (1); the
weight-two condition (B), or (C) when `k = p + 1`, for cases (2)–(4). -/
def localCondition : RequiredLiftType p k → KWLocalType
  | minimalCrystalline _ => KWLocalType.A
  | _ => if k = p + 1 then KWLocalType.C else KWLocalType.B

/-- The auxiliary prime `q` of cases (3) and (4), whose local condition is the abelian or
level-two condition of R08.6. -/
def auxiliaryPrime : RequiredLiftType p k → Option ℕ
  | levelOne q .. => some q
  | levelTwo q .. => some q
  | _ => none

/-- The fixed-determinant unframed ring `R̄^ψ_S` of GlobalGaloisDeformations:R04.6 for these local
conditions (including the condition at the auxiliary prime). Owner: GlobalGaloisDeformations:R04.6. -/
def ring [Fact p.Prime] (T : RequiredLiftType p k) {F : Type} [Field F]
    (ρ : GaloisGroup ℚ →* GL2 F) (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) : Type := sorry

variable [Fact p.Prime] {F : Type} [Field F] {ρ : GaloisGroup ℚ →* GL2 F} {S : Finset ℕ}
  {ψ : GaloisGroup ℚ →* ℤ_[p]ˣ}

noncomputable instance (T : RequiredLiftType p k) : CommRing (T.ring ρ S ψ) := sorry
noncomputable instance (T : RequiredLiftType p k) : Algebra ℤ_[p] (T.ring ρ S ψ) := sorry

/-- The lift attached to a point of the ring. Owner: GlobalGaloisDeformations:R04.6. -/
def liftOfPoint (T : RequiredLiftType p k) {O : Type} [CommRing O] [Algebra ℤ_[p] O]
    (x : T.ring ρ S ψ →ₐ[ℤ_[p]] O) : GaloisGroup ℚ →* GL2 O := sorry

/-- Points of the ring give lifts of the required type: of the local type `localCondition` at `p`
(and of the prescribed inertial shape at the auxiliary prime). -/
theorem points_iff (T : RequiredLiftType p k) {O : Type} [CommRing O] [Algebra ℤ_[p] O]
    (x : T.ring ρ S ψ →ₐ[ℤ_[p]] O) :
    IsLiftOfType p ρ (S ∪ (T.auxiliaryPrime.map ({·})).getD ∅) ψ T.localCondition
      (T.liftOfPoint x) := by
  sorry

/-- Every lift of the type has determinant `ψ χ_p`. -/
theorem det (T : RequiredLiftType p k) (x : T.ring ρ S ψ →ₐ[ℤ_[p]] PadicAlgCl p)
    (g : GaloisGroup ℚ) :
    Matrix.GeneralLinearGroup.det (T.liftOfPoint x g) =
      Units.map (algebraMap ℤ_[p] (PadicAlgCl p)).toMonoidHom
        ((ψ * cyclotomicCharacterPadic ℚ p) g) := by
  sorry

end RequiredLiftType

/-- The hypotheses of KW I Theorem 5.1 on `ρ̄ : G_ℚ → GL₂(k)`: S-type, `2 ≤ k(ρ̄) ≤ p + 1` if `p > 2`,
insoluble image if `p = 2`, and `ρ̄|_{G_{ℚ(μ_p)}}` absolutely irreducible if `p > 2`. -/
def KWHypotheses (p : ℕ) [Fact p.Prime] {k : Type} [Field k] (ρ : GaloisGroup ℚ →* GL2 k) :
    Prop :=
  IsSType ρ ∧ (p ≠ 2 → 2 ≤ serreWeight ρ ∧ serreWeight ρ ≤ p + 1) ∧
    (p = 2 → ¬ Group.IsSolvable ρ.range) ∧
    (p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρ ⟨p, (Fact.out : p.Prime).pos⟩))

/-- KW I Theorem 5.1 (1) (KW II, pp. 504–505): with `k(ρ̄) = 2` if `p = 2`, `ρ̄` has a lift of type (1):
minimally ramified away from `p` and crystalline of weight `k(ρ̄)` at `p` (including `k(ρ̄) = p`). -/
theorem theorem_5_1_part_1_minimal_crystalline (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    [Finite k] [CharP k p] (ρ : GaloisGroup ℚ →* GL2 k) (h : KWHypotheses p ρ)
    (h2 : p = 2 → serreWeight ρ = 2) (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) :
    Nonempty ((RequiredLiftType.minimalCrystalline (p := p) (k := serreWeight ρ) h2).ring ρ S ψ
      →ₐ[ℤ_[p]] PadicAlgCl p) := by
  sorry

/-- KW I Theorem 5.1 (2): `ρ̄` has a weight-two lift of type (2) (semistable non-crystalline of
weight two at `p = 2` when `k(ρ̄) = 4`). -/
theorem theorem_5_1_part_2_weight_two (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k]
    [CharP k p] (ρ : GaloisGroup ℚ →* GL2 k) (h : KWHypotheses p ρ) (S : Finset ℕ)
    (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) :
    Nonempty ((RequiredLiftType.weightTwo (p := p) (k := serreWeight ρ)).ring ρ S ψ
      →ₐ[ℤ_[p]] PadicAlgCl p) := by
  sorry

/-- KW I Theorem 5.1 (3): at an odd `q ∥ N(ρ̄)` with `p ∣ q − 1` and `ρ̄|_{I_q} = (χ, *; 0, 1)`, with
`χ' = ω_q^i` lifting `χ`, `ρ̄` has a lift of type (3). The local condition at `q` is the abelian
condition of LocalGaloisDeformationRings:R08.6. -/
theorem theorem_5_1_part_3_level_one_type_at_q (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    [Finite k] [CharP k p] (ρ : GaloisGroup ℚ →* GL2 k) (h : KWHypotheses p ρ)
    (q i : ℕ) (hq : q.Prime) (hq2 : q ≠ 2) (hdiv : p ∣ q - 1) (hi : 0 < i ∧ i ≤ q - 2)
    (hpar : p = 2 → Even i)
    (hshape : ∀ v : FinitePrime ℚ, v.LiesOver q → ∃ χ : GaloisGroup ℚ →* kˣ,
      ∃ P : GL2 k, ∀ g ∈ inertiaGroup v,
        ((P⁻¹ * ρ g * P : GL2 k) : Matrix (Fin 2) (Fin 2) k) 1 0 = 0 ∧
        ((P⁻¹ * ρ g * P : GL2 k) : Matrix (Fin 2) (Fin 2) k) 0 0 = χ g ∧
        ((P⁻¹ * ρ g * P : GL2 k) : Matrix (Fin 2) (Fin 2) k) 1 1 = 1)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) :
    Nonempty ((RequiredLiftType.levelOne (p := p) (k := serreWeight ρ) q i hq hq2 hdiv hi hpar).ring
      ρ S ψ →ₐ[ℤ_[p]] PadicAlgCl p) := by
  sorry

/-- KW I Theorem 5.1 (4): at `q ≠ p` with `p ∣ q + 1` and `ρ̄|_{D_q}` of the shape `(χ_p, *; 0, 1)` up to
unramified twist, with a level-two character of `p`-power order, `ρ̄` has a lift of type (4); this
inserts a good dihedral prime (ClassicalSerreModularity:R27.1). -/
theorem theorem_5_1_part_4_level_two_type_at_q (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    [Finite k] [CharP k p] (ρ : GaloisGroup ℚ →* GL2 k) (h : KWHypotheses p ρ)
    (q i j : ℕ) (hq : q.Prime) (hqp : q ≠ p) (hdiv : p ∣ q + 1) (hij : j < i ∧ i ≤ q - 1)
    (hord : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
    (hpar : p = 2 → Even (i + j))
    (hshape : ∀ v : FinitePrime ℚ, v.LiesOver q → ∃ μ : GaloisGroup ℚ →* kˣ,
      TauCeti.PotentialModularity.CharIsUnramifiedAt μ v ∧
      TauCeti.PotentialModularity.IsUpperTriangularAt ρ v
        (μ * (Units.map (ZMod.castHom (dvd_refl p) k).toMonoidHom).comp
          (TauCeti.PotentialModularity.cyclotomicCharacterModP ℚ p)) μ)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) :
    Nonempty ((RequiredLiftType.levelTwo (p := p) (k := serreWeight ρ) q i j hq hqp hdiv hij hord
      hpar).ring ρ S ψ →ₐ[ℤ_[p]] PadicAlgCl p) := by
  sorry

/-- The applications of KW I Theorem 5.1 in KW I §§8–9, KW Annals and Dieulefait–Pacetti. -/
inductive KWApplication
  | killingRamification
  | modThree
  | modFive
  | inductiveStep
  | corollary81
  | goodDihedralPrime
  | dyadicTheorem91
  | kwAnnalsMinimal
  | dieulefaitPacettiTypes
  deriving DecidableEq

/-- The required lift types used by each application, in order (types numbered 1–4; the
"inductive step" and "mod 5" entries list the residual member's second step as (2) or (1)
according to whether the new residual prime divides its level). -/
def theorem_5_1_application_table : KWApplication → List (Fin 4)
  | .killingRamification => [0]
  | .modThree => [1, 3]
  | .modFive => [1, 2]
  | .inductiveStep => [1, 2]
  | .corollary81 => [0]
  | .goodDihedralPrime => [1, 3]
  | .dyadicTheorem91 => [1, 3]
  | .kwAnnalsMinimal => [0]
  | .dieulefaitPacettiTypes => [0, 1, 3]

/-- Snowden's lifting problems `P = (Σ, ψ, t, (τ_v))` for `ρ̄ : G_F → GL₂(𝔽̄_p)` over a totally real
`F`, with their (global) solutions and local solutions.
Owner: GL2ModularityLifting:R22.5. -/
def LiftingProblem (F : Type) [Field F] [NumberField F] (p : ℕ) [Fact p.Prime]
    (ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod p))) : Type := sorry

/-- The weight-two global solutions of a lifting problem. Owner: GL2ModularityLifting:R22.5. -/
def LiftingProblem.Solution {F : Type} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime]
    {ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod p))} (P : LiftingProblem F p ρ) : Type :=
  sorry

/-- The local solutions: at each `v ∈ Σ` a lift of `ρ̄|_{G_{F_v}}` of the prescribed determinant,
inertial type and definite type. Owner: LocalGaloisDeformationRings:R08.6. -/
def LiftingProblem.LocalSolution {F : Type} [Field F] [NumberField F] {p : ℕ} [Fact p.Prime]
    {ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod p))} (P : LiftingProblem F p ρ) : Type :=
  sorry

/-- Modern prescribed-type lifts (Snowden, Theorems 7.2.1 and 7.6.1): for `p` odd, `F` totally real
and `ρ̄ : G_F → GL₂(𝔽̄_p)` odd with (A1) `ρ̄|_{G_{F(ζ_p)}}` absolutely irreducible and (A2) the
`PGL₂(𝔽₅)` condition, every lifting problem has finitely many solutions, and a solution exists if
and only if a local solution exists. This is the global step of Dieulefait–Pacetti
Theorem 1.9(4). Omitted hypothesis: (A2), that `[F(ζ₅) : F] = 4` when `p = 5` and the projective
image is `PGL₂(𝔽₅)` (automatic over `ℚ`), which needs projective images (owner
ArithmeticGaloisRepresentations:R01.2). -/
theorem modern_prescribed_type_lifts {F : Type} [Field F] [NumberField F]
    [NumberField.IsTotallyReal F] (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (ρ : GaloisGroup F →* GL2 (AlgebraicClosure (ZMod p))) (hcont : IsContinuousResidual ρ)
    (hodd : IsTotallyOdd ρ)
    (hA1 : IsAbsolutelyIrreducible (restrictToCyclotomic ρ ⟨p, (Fact.out : p.Prime).pos⟩))
    (P : LiftingProblem F p ρ) :
    Finite P.Solution ∧ (Nonempty P.Solution ↔ Nonempty P.LocalSolution) := by
  sorry

/-! ## R24.4 — Modularity lifting over ℚ through the imported interfaces -/

/-- The weight part of Serre's conjecture and allowable base change (KW II, §§4, 8, 10.2): an S-type
modular `ρ̄` with the image hypotheses of KW I Theorem 4.1 arises from weight `k(ρ̄)` with level
prime to `p` and from weight two at level `Np` (Gross Theorem 13.10, Coleman–Voloch, Gross
Propositions 8.13 and 8.18), so after an allowable soluble totally real base change `F/ℚ` the
restriction satisfies (α) and (β). -/
theorem alpha_beta_from_residual_modularity (p : ℕ) [Fact p.Prime] {k : Type} [Field k]
    [Finite k] [CharP k p] (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k)
    (h : KWHypotheses p ρ) (hmod : ∃ π : CuspidalGL2 ℚ, ArisesFrom p j ρ π) :
    ∃ (F : IntermediateField ℚ QBar) (_ : NumberField F),
      IsKWField p ρ F ∧ Group.IsSolvable (F ≃ₐ[ℚ] F) ∧ HasKWWitnesses p j ρ F := by
  sorry

/-- KW I Theorem 4.1 (as exported by GL2ModularityLifting:R22.5 and R22.6): for modular `ρ̄` with
insoluble image if `p = 2` and `ρ̄|_{G_{ℚ(μ_p)}}` absolutely irreducible if `p > 2`, a finitely
ramified continuous lift `ρ` is modular when (`p = 2`) it is odd and crystalline of weight two at
`2`, or semistable of weight two when `k(ρ̄) = 4`; (`p > 2`) it is crystalline of weight
`2 ≤ k ≤ p + 1`, or potentially semistable of weight two at `p`. -/
theorem kw_theorem_4_1 (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρbar : GaloisGroup ℚ →* GL2 k)
    (hmod : ∃ π : CuspidalGL2 ℚ, ArisesFrom p j ρbar π)
    (h2 : p = 2 → ¬ Group.IsSolvable ρbar.range)
    (hcyc : p ≠ 2 → IsAbsolutelyIrreducible (restrictToCyclotomic ρbar
      ⟨p, (Fact.out : p.Prime).pos⟩))
    (ρ : Representation (PadicAlgCl p) (GaloisGroup ℚ) (Fin 2 → PadicAlgCl p))
    (hcont : Continuous (fun gv : GaloisGroup ℚ × (Fin 2 → PadicAlgCl p) => ρ gv.1 gv.2))
    (hram : ∃ T : Finset (PrimeIndex ℚ), ∀ v ∉ T, ∀ g ∈ inertiaGroup v, ρ g = 1)
    (hred : ∃ P, ∀ g, residualMember p ρ g = P * Matrix.GeneralLinearGroup.map j (ρbar g) * P⁻¹)
    (hloc : ∀ v : PrimeIndex ℚ, v.LiesOver p →
      (p = 2 → (IsCrystallineAt ρ v ∨ (serreWeight ρbar = 4 ∧ IsSemistableAt ρ v)) ∧
        ∀ σ, kwHodgeTateWeights ρ σ = {0, 1}) ∧
      (p ≠ 2 → (∃ wt : ℕ, 2 ≤ wt ∧ wt ≤ p + 1 ∧ IsCrystallineAt ρ v ∧
          ∀ σ, kwHodgeTateWeights ρ σ = {0, (wt : ℤ) - 1}) ∨
        ((∀ σ, kwHodgeTateWeights ρ σ = {0, 1}) ∧
          ∃ (L : IntermediateField ℚ QBar) (_ : NumberField L), ∀ w : PrimeIndex L,
            w.LiesOver p → IsSemistableAt
              (ρ.comp (restrictionMap (algebraMap ℚ L))) w))) :
    IsModularLift p (RingHom.id _) (repToGL ρ) := by
  sorry

/-! ## R24.5 — Rank-two families, Brauer induction and strict compatibility -/

/-- A two-dimensional `E`-rational compatible family of `G_F` in the sense of Khare–Wintenberger
(KW I §5; KW II §10.3): continuous semisimple members at every coefficient place `λ` of `E`,
Frobenius-semisimple Weil–Deligne data `r_q` over `E` at every finite `q` (unramified for almost all
`q`), and integers `a ≥ b`, with Weil–Deligne comparison at `q ∤ ℓ` and, for `ℓ` large,
crystalline members of Hodge–Tate weights `(a, b)` above `ℓ` (KW normalization `HT(ε) = 1`). -/
structure CompatibleSystem (F E : Type) [Field F] [NumberField F] [Field E] [NumberField E]
    (K : PrimeIndex E → Type) [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] where
  completionEmbedding : ∀ lam, lam.adicCompletion E →+* K lam
  member : ∀ lam, Representation (K lam) (GaloisGroup F) (Fin 2 → K lam)
  semisimple : ∀ lam, (member lam).IsSemisimpleRepresentation
  continuousAction : ∀ lam, Continuous (fun gv : GaloisGroup F × (Fin 2 → K lam) =>
    member lam gv.1 gv.2)
  wd : ∀ q : PrimeIndex F, WeilDeligneRep q E 2
  frobSemisimple : ∀ q, (wd q).IsFrobSemisimple
  almostAllUnramified : ∃ T : Finset (PrimeIndex F), ∀ q ∉ T, (wd q).IsUnramified
  a : ℤ
  b : ℤ
  b_le_a : b ≤ a
  awayComparison : ∀ lam q, ¬ q.LiesOver lam.residueChar →
    ((wd q).map ((completionEmbedding lam).comp (algebraMap E (lam.adicCompletion E)))).IsIso
      (localWD (member lam) q)
  largeCrystalline : ∃ N : ℕ, ∀ lam, N < lam.residueChar → ∀ q, q.LiesOver lam.residueChar →
    IsCrystallineAt (member lam) q ∧ ∀ σ, kwHodgeTateWeights (member lam) σ = {a, b}

namespace CompatibleSystem
variable {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
variable {K : PrimeIndex E → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]

/-- The coefficient embedding `E → E_λ → K_λ`. -/
def coeff (C : CompatibleSystem F E K) (lam : PrimeIndex E) : E →+* K lam :=
  (C.completionEmbedding lam).comp (algebraMap E (lam.adicCompletion E))

/-- The semisimplified residual member, irreducible case test. -/
def ResiduallyIrreducible (C : CompatibleSystem F E K) (lam : PrimeIndex E) : Prop :=
  IsAbsolutelyIrreducibleRep (glToRep (residualMember lam.residueChar (C.member lam)))

/-- Strict compatibility (KW): every member is de Rham with Hodge–Tate weights `(a, b)` above `ℓ`,
and `WD(ρ_λ|_{D_q})^{F-ss} ≅ ι r_q` at every finite `q`, including `q | ℓ`. -/
def IsStrict (C : CompatibleSystem F E K) : Prop :=
  ∀ lam q, (q.LiesOver lam.residueChar → IsDeRhamAt (C.member lam) q ∧
      ∀ σ, kwHodgeTateWeights (C.member lam) σ = {C.a, C.b}) ∧
    ((C.wd q).map (C.coeff lam)).IsIso (localWD (C.member lam) q)

/-- Almost strict compatibility (KW II §10.3): at `q | ℓ`, (i) if the residual member is
irreducible, the member is de Rham of weights `(a, b)` with full WD comparison, and (ii) if `ℓ ≠ 2`
and `r_q` is unramified, the member is crystalline of weights `(a, b)` with WD comparison. No
assertion is made when the residual member is reducible and `r_q` is ramified. -/
def IsAlmostStrict (C : CompatibleSystem F E K) : Prop :=
  ∀ lam q, q.LiesOver lam.residueChar →
    (C.ResiduallyIrreducible lam → IsDeRhamAt (C.member lam) q ∧
      (∀ σ, kwHodgeTateWeights (C.member lam) σ = {C.a, C.b}) ∧
      ((C.wd q).map (C.coeff lam)).IsIso (localWD (C.member lam) q)) ∧
    ((lam.residueChar ≠ 2 ∧ (C.wd q).IsUnramified) → IsCrystallineAt (C.member lam) q ∧
      (∀ σ, kwHodgeTateWeights (C.member lam) σ = {C.a, C.b}) ∧
      ((C.wd q).map (C.coeff lam)).IsIso (localWD (C.member lam) q))

/-- Regular: `a ≠ b`. -/
def IsRegular (C : CompatibleSystem F E K) : Prop := C.a ≠ C.b

/-- Strict implies almost strict (and both refine plain compatibility, which is the structure). -/
theorem IsStrict.isAlmostStrict {C : CompatibleSystem F E K} (h : C.IsStrict) :
    C.IsAlmostStrict := by
  sorry

/-- Extend the coefficient field to a finite `E'/E`, reindexing places through `λ' ↦ λ' ∩ E` with
coefficient embeddings `K_{λ' ∩ E} → K'_{λ'}`; members and local data are unchanged. -/
def enlargeCoefficients (C : CompatibleSystem F E K) {E' : Type} [Field E'] [NumberField E']
    [Algebra E E'] {K' : PrimeIndex E' → Type} [∀ lam, Field (K' lam)]
    [∀ lam, TopologicalSpace (K' lam)]
    (under : PrimeIndex E' → PrimeIndex E) (emb : ∀ lam', K (under lam') →+* K' lam') :
    CompatibleSystem F E' K' := sorry

end CompatibleSystem

/-- The rank-two weakly compatible system of a KW family whose members are de Rham above `ℓ` with
the common weights and crystalline outside an enlarged finite `S`; plain or almost strict
compatibility alone does not give these. -/
def WeaklyCompatibleSystem.ofCompatibleSystem {F E : Type} [Field F] [NumberField F] [Field E]
    [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (C : CompatibleSystem F E K) (S : Finset (PrimeIndex F))
    (hdR : ∀ lam q, q.LiesOver lam.residueChar → IsDeRhamAt (C.member lam) q)
    (hcris : ∀ lam q, q ∉ S → q.LiesOver lam.residueChar → IsCrystallineAt (C.member lam) q) :
    WeaklyCompatibleSystem F E K 2 := sorry

section Brauer
variable {E : Type} [Field E] [NumberField E]
variable {K : PrimeIndex E → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]

/-- The Brauer-induction family (KW II §10.3.2; Taylor, degree-two L-functions, §6): for a lift
`ρ : G_ℚ → GL₂(ℚ̄_p)` that is modular over a totally real Galois `F/ℚ`, write
`1 = Σ n_i Ind_{G_i}^G χ_i` with `G_i = Gal(F/F_i)` soluble, base change to cuspidal `π_i` over `F_i`
and put `ρ_λ = Σ n_i Ind(χ_i ⊗ ρ_{π_i,λ})`, with coefficients in a number field `E` containing all
Hecke and character values. Absolute irreducibility of `ρ|_{G_F}` and of the Hilbert members is
assumed. Omitted hypothesis: that `E` contains the Hecke fields of the `π_i` and the values of the
`χ_i` (owner AutomorphicGaloisRepresentations:R19.3). -/
def brauerSystem (p : ℕ) [Fact p.Prime] (ρ : GaloisGroup ℚ →* GL2 (PadicAlgCl p))
    (F : IntermediateField ℚ QBar) [NumberField F] (hF : IsGalois ℚ F)
    (hFr : NumberField.IsTotallyReal F)
    (hmod : IsModularLift p (RingHom.id _) (restrictRep ρ (algebraMap ℚ F)))
    (hirr : IsAbsolutelyIrreducible (restrictRep ρ (algebraMap ℚ F))) :
    CompatibleSystem ℚ E K := sorry

variable (p : ℕ) [Fact p.Prime] (ρ : GaloisGroup ℚ →* GL2 (PadicAlgCl p))
  (F : IntermediateField ℚ QBar) [NumberField F] (hF : IsGalois ℚ F)
  (hFr : NumberField.IsTotallyReal F)
  (hmod : IsModularLift p (RingHom.id _) (restrictRep ρ (algebraMap ℚ F)))
  (hirr : IsAbsolutelyIrreducible (restrictRep ρ (algebraMap ℚ F)))

/-- The virtual class `Σ n_i Ind(χ_i ⊗ ρ_{π_i,λ})` has dimension two and norm one, hence every member
is a genuine absolutely irreducible representation. -/
theorem brauerSystem_isTrue (lam : PrimeIndex E) :
    IsAbsolutelyIrreducibleRep
      ((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).member lam) := by
  sorry

/-- Good Frobenius polynomials: a common `E`-rational polynomial at almost every `v` gives the
characteristic polynomial of `ρ(Frob_v)` (through an embedding `E → ℚ̄_p`) and of every member. -/
theorem brauerSystem_trace :
    ∃ (ι : E →+* PadicAlgCl p) (T : Finset (PrimeIndex ℚ)) (Q : PrimeIndex ℚ → E[X]),
      ∀ v ∉ T, (ρ (frobLift v) : Matrix (Fin 2) (Fin 2) _).charpoly = (Q v).map ι ∧
        ∀ lam, ¬ v.LiesOver lam.residueChar →
          ((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).member lam
            (frobLift v)).charpoly =
          (Q v).map ((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).coeff lam) := by
  sorry

/-- Uniqueness: any family with the same good Frobenius polynomials has isomorphic members. -/
theorem brauerSystem_unique (C : CompatibleSystem ℚ E K)
    (hC : ∃ T : Finset (PrimeIndex ℚ), ∀ v ∉ T, ∀ lam, ¬ v.LiesOver lam.residueChar →
      (C.member lam (frobLift v)).charpoly =
        ((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).member lam
          (frobLift v)).charpoly)
    (lam : PrimeIndex E) :
    ∃ e : (Fin 2 → K lam) ≃ₗ[K lam] (Fin 2 → K lam), ∀ g x,
      e (C.member lam g x) =
        (brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).member lam g (e x) := by
  sorry

/-- For `F' ⊆ F` with `F/F'` soluble, the restriction of the family to `G_{F'}` is automorphic: its
good Frobenius polynomials are those of a cuspidal `π'` over `F'`. -/
theorem brauerSystem_restrict (F' : IntermediateField ℚ QBar) [NumberField F'] (hle : F' ≤ F)
    (hsol : letI : Algebra F' F := (IntermediateField.inclusion hle).toRingHom.toAlgebra
      Group.IsSolvable (F ≃ₐ[F'] F)) :
    ∃ (π' : CuspidalGL2 F') (ι : π'.coefficientField →+* E) (T : Finset (FinitePrime F')),
      ∀ v ∉ T, ∀ lam : PrimeIndex E,
        ((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).member lam
          (restrictionMap (algebraMap ℚ F') (frobLift v))).charpoly =
          ((π'.heckePolynomial v).map (algebraMap _ π'.coefficientField)).map
            (((brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).coeff lam).comp ι) := by
  sorry

/-- KW II's almost strict compatibility of the Brauer family (§10.3.2): WD comparison at `q ≠ ℓ`
(Carayol, Taylor); at `q = ℓ ≠ 2` with `r_q` unramified, crystalline with WD comparison (Breuil,
Berger); at `q = ℓ` with irreducible residual member, full WD comparison (Kisin, after moving to a
field linearly disjoint from the residual kernel). -/
theorem almost_strict_compatibility :
    (brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).IsAlmostStrict := by
  sorry

/-- Strict compatibility of the Brauer family of motivic Hilbert forms (weights `k_τ ≥ 2`): every
member is geometric of the common weights and `WD(ρ_λ|_{D_q})^{F-ss} ≅ r_q` at every `q`, including
`q = ℓ` and reducible residual members (Skinner's coefficient-prime theorem,
AutomorphicGaloisRepresentations:R19.5). -/
theorem strict_brauer_system :
    (brauerSystem (E := E) (K := K) p ρ F hF hFr hmod hirr).IsStrict := by
  sorry

end Brauer

/-- KW I Theorem 5.1 with families (KW II §10.3): for `ρ̄` satisfying the hypotheses and each required
type, there are a number field `E` and an `E`-rational, almost strictly compatible, irreducible,
odd family lifting `ρ̄` whose `p`-adic member has that type. Omitted conclusion: the identification
of the `p`-adic member with a point of `RequiredLiftType.ring` and the residual Serre weights in
cases (3) and (4) (Savitt), which need the coefficient-field algebra of the member. -/
theorem kw_theorem_5_1_systems (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [Finite k] [CharP k p]
    (j : k →+* AlgebraicClosure (ZMod p)) (ρ : GaloisGroup ℚ →* GL2 k) (h : KWHypotheses p ρ)
    (T : RequiredLiftType p (serreWeight ρ)) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (K : PrimeIndex E → Type)
      (_ : ∀ lam, Field (K lam)) (_ : ∀ lam, TopologicalSpace (K lam))
      (C : CompatibleSystem ℚ E K),
      C.IsAlmostStrict ∧ (∀ lam, IsAbsolutelyIrreducibleRep (C.member lam)) ∧
      (∀ lam, TauCeti.PotentialModularity.IsTotallyOdd (repToGL (C.member lam))) ∧
      ∃ lam : PrimeIndex E, lam.residueChar = p ∧ ∃ P, ∀ g,
        residualMember (F := ℚ) p (C.member lam) g =
          P * Matrix.GeneralLinearGroup.map j (ρ g) * P⁻¹ := by
  sorry

/-- Dieulefait–Pacetti Theorem 1.11 in the scope of R23.4: an odd, irreducible, continuous, finitely
ramified `ρ : G_ℚ → GL₂(ℚ̄_p)`, de Rham at `p` with Hodge–Tate weights `{0, k − 1}`, `k > 1`, with
`ρ̄|_{G_{ℚ(ζ_p)}}` absolutely irreducible (insoluble image if `p = 2`) and of type (A), (B) or (C) at
`p`, is a member of a rank-two almost strictly compatible family (through potential modularity,
R23.4, and the Brauer family). -/
theorem dieulefait_families (p : ℕ) [Fact p.Prime] {kf : Type} [Field kf] [Finite kf]
    [CharP kf p] (ρbar : GaloisGroup ℚ →* GL2 kf) (hρbar : KWHypotheses p ρbar)
    (S : Finset ℕ) (ψ : GaloisGroup ℚ →* ℤ_[p]ˣ) (t : KWLocalType)
    (ρ : GaloisGroup ℚ →* GL2 (PadicAlgCl p)) (hρ : IsLiftOfType p ρbar S ψ t ρ) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (K : PrimeIndex E → Type)
      (_ : ∀ lam, Field (K lam)) (_ : ∀ lam, TopologicalSpace (K lam))
      (C : CompatibleSystem ℚ E K) (lam : PrimeIndex E) (ι : K lam →+* PadicAlgCl p)
      (T : Finset (PrimeIndex ℚ)),
      C.IsAlmostStrict ∧ ∀ v ∉ T,
        (ρ (frobLift v) : Matrix (Fin 2) (Fin 2) _).charpoly =
          (C.member lam (frobLift v)).charpoly.map ι := by
  sorry

/-! ## R24.6 — Residual members and linked families -/

/-- Residual members of a family (KW I, proof of Theorem 10.1 and Lemma 6.3): for an almost strictly
compatible, irreducible, odd rank-two family, every residual member is odd, and for all but finitely
many `ℓ` it is absolutely irreducible; if `a ≠ b`, also its restriction to `G_{ℚ(ζ_ℓ)}`. -/
theorem residual_members {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type}
    [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (C : CompatibleSystem ℚ E K)
    (hC : C.IsAlmostStrict) (hirr : ∀ lam, IsAbsolutelyIrreducibleRep (C.member lam))
    (hodd : ∀ lam, TauCeti.PotentialModularity.IsTotallyOdd (repToGL (C.member lam))) :
    (∀ lam, TauCeti.PotentialModularity.IsTotallyOdd
      (residualMember lam.residueChar (C.member lam))) ∧
    ∃ N : ℕ, ∀ lam, N < lam.residueChar →
      C.ResiduallyIrreducible lam ∧
      (C.IsRegular → IsAbsolutelyIrreducibleRep (glToRep
        ((residualMember lam.residueChar (C.member lam)).comp
          (restrictionMap (algebraMap ℚ (CyclotomicField lam.residueChar ℚ)))))) := by
  sorry

/-- Local compatibility at the coefficient prime: for an almost strict family and `q | ℓ`, the
definition gives full WD comparison when the residual member is irreducible, and crystallinity
with the prescribed weights when `ℓ ≠ 2` and `r_q` is unramified; for a strict family (such as the
Brauer families of `strict_brauer_system`) the comparison holds at every coefficient prime. -/
theorem local_compatibility_at_the_coefficient_prime {E : Type} [Field E] [NumberField E]
    {K : PrimeIndex E → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (C : CompatibleSystem ℚ E K) (lam : PrimeIndex E) (q : PrimeIndex ℚ)
    (hq : q.LiesOver lam.residueChar) :
    (C.IsAlmostStrict → C.ResiduallyIrreducible lam →
      ((C.wd q).map (C.coeff lam)).IsIso (localWD (C.member lam) q)) ∧
    (C.IsAlmostStrict → lam.residueChar ≠ 2 → (C.wd q).IsUnramified →
      IsCrystallineAt (C.member lam) q) ∧
    (C.IsStrict → IsDeRhamAt (C.member lam) q ∧
      ((C.wd q).map (C.coeff lam)).IsIso (localWD (C.member lam) q)) := by
  sorry

/-- Modularity transfer between linked families (KW I §4 with Theorem 4.1): if one member of a
rank-two family is attached to a cuspidal `π`, all are (Chebotarev–Brauer–Nesbitt); and if two
families are linked at `λ` (isomorphic residual members), the second modular and the first
satisfying the residual-image and local hypotheses of `kw_theorem_4_1` at `λ`, then the first
family is modular. Ramified residually reducible de Rham transfer is GL2ModularityLifting:R32.6. -/
theorem linked_systems_modularity_transfer {E : Type} [Field E] [NumberField E]
    {K : PrimeIndex E → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (C C' : CompatibleSystem ℚ E K) (lam : PrimeIndex E)
    (hlink : ∃ P, ∀ g, residualMember lam.residueChar (C.member lam) g =
      P * residualMember lam.residueChar (C'.member lam) g * P⁻¹)
    (hmod' : ∃ (π : CuspidalGL2 ℚ) (ι : π.coefficientField →+* E) (T : Finset (PrimeIndex ℚ)),
      ∀ v ∉ T, ∀ mu, ¬ v.LiesOver mu.residueChar →
        (C'.member mu (frobLift v)).charpoly =
          ((π.heckePolynomial v).map (algebraMap _ π.coefficientField)).map ((C'.coeff mu).comp ι))
    (hres : C.ResiduallyIrreducible lam)
    (hcris : ∀ q : PrimeIndex ℚ, q.LiesOver lam.residueChar → IsDeRhamAt (C.member lam) q) :
    ∃ (π : CuspidalGL2 ℚ) (ι : π.coefficientField →+* E) (T : Finset (PrimeIndex ℚ)),
      ∀ v ∉ T, ∀ mu, ¬ v.LiesOver mu.residueChar →
        (C.member mu (frobLift v)).charpoly =
          ((π.heckePolynomial v).map (algebraMap _ π.coefficientField)).map ((C.coeff mu).comp ι) := by
  sorry

end TauCeti.CompatibleSystems

noncomputable section
open scoped NumberField Polynomial
open IsDedekindDomain

namespace TauCeti.CompatibleSystems

open TauCeti.PotentialModularity (FinitePrime frobLift inertiaGroup decompositionGroup
  complexConjugation restrictionMap GL2 CuspidalGL2 KWLocalType)

/-! ### Families used by the tests -/

/-- The idelic norm `‖·‖_F`, the algebraic Hecke character whose family is the cyclotomic family,
with Hodge number `−1` at every embedding in the geometric Artin convention.
Owner: GlobalNumberFields Layers 9–10. -/
def AlgebraicHeckeCharacter.normCharacter (F M : Type) [Field F] [NumberField F] [Field M]
    [NumberField M] : AlgebraicHeckeCharacter F M := sorry

/-- The trivial algebraic Hecke character. Owner: GlobalNumberFields Layers 9–10. -/
def AlgebraicHeckeCharacter.trivial (F M : Type) [Field F] [NumberField F] [Field M]
    [NumberField M] : AlgebraicHeckeCharacter F M := sorry

/-- The cohomological weakly compatible system `H = {0, k − 1}`, `Q_v = X² − a_v X + χ(v) q_v^{k−1}`
of a cuspidal eigenform over `ℚ`, with coefficients in `M`.
Owner: AutomorphicGaloisRepresentations:R19.3. -/
def eigenformSystem {M : Type} [Field M] [NumberField M] {K : PrimeIndex M → Type}
    [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (π : CuspidalGL2 ℚ)
    (ι : π.coefficientField →+* M) : WeaklyCompatibleSystem ℚ M K 2 := sorry

/-- The Khare–Wintenberger family of a cuspidal eigenform over `ℚ` (KW normalization).
Owner: AutomorphicGaloisRepresentations:R19.3. -/
def eigenformFamily {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type}
    [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)] (π : CuspidalGL2 ℚ)
    (ι : π.coefficientField →+* E) : CompatibleSystem ℚ E K := sorry

end TauCeti.CompatibleSystems

namespace TauCeti.CompatibleSystems.Tests

open TauCeti.CompatibleSystems
open TauCeti.PotentialModularity (FinitePrime frobLift inertiaGroup decompositionGroup
  complexConjugation restrictionMap GL2 CuspidalGL2 KWLocalType QBar)

variable {M : Type} [Field M] [NumberField M] {K : PrimeIndex M → Type}
  [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]

/-! #### Required lift types -/

/-- type3_parity_p2: for `p = 2`, `q = 5`, the character `ω₅` (`i = 1`) is excluded by the parity
condition, while `ω₅²` (`i = 2`) gives a type-(3) datum. -/
example (k : ℕ) : ¬ (2 = 2 → Even 1) ∧
    (RequiredLiftType.levelOne (p := 2) (k := k) 5 2 (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) (fun _ => even_two)).auxiliaryPrime = some 5 := by
  sorry

/-- type4_level_two_exists: for `p = 2`, `q = 7` (`v₂(8) = 3`) admits a level-two datum of 2-power
order, while `q = 5` (`v₂(6) = 1`) admits none. -/
example (k : ℕ) :
    (RequiredLiftType.levelTwo (p := 2) (k := k) 7 6 0 (by norm_num) (by norm_num) (by norm_num)
      (by norm_num) ⟨3, by norm_num⟩ (fun _ => by decide)).auxiliaryPrime = some 7 ∧
    ¬ 4 ∣ 5 + 1 := by
  sorry

/-- type2_steinberg: when `k(ρ̄) = p + 1` the type-(2) local condition is the semistable
(Steinberg, `N ≠ 0`) condition (C). -/
example (p : ℕ) :
    (RequiredLiftType.weightTwo (p := p) (k := p + 1)).localCondition = KWLocalType.C := by
  sorry

/-- type3_needs_p_divides: for `p = 3`, `q = 5` we have `3 ∤ 4 = q − 1`, so no type-(3) datum at
`q = 5` exists. -/
example (k : ℕ) : ¬ ∃ (i : ℕ) (hq : Nat.Prime 5) (hodd : 5 ≠ 2) (hdiv : 3 ∣ 5 - 1)
    (hi : 0 < i ∧ i ≤ 5 - 2) (hpar : 3 = 2 → Even i),
    (RequiredLiftType.levelOne (p := 3) (k := k) 5 i hq hodd hdiv hi hpar).auxiliaryPrime =
      some 5 := by
  sorry

/-! #### Rank-two families -/

/-- newform_is_strict: the KW family of the weight-12 eigenform `Δ` has weights `(11, 0)`, is
regular, and is strict (with Skinner's coefficient-prime theorem). -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (Δ : CuspidalGL2 ℚ) (hΔ : Δ.HasParallelWeight 12)
    (ι : Δ.coefficientField →+* E) :
    (eigenformFamily (K := K) Δ ι).a = 11 ∧ (eigenformFamily (K := K) Δ ι).b = 0 ∧
      (eigenformFamily (K := K) Δ ι).IsRegular ∧ (eigenformFamily (K := K) Δ ι).IsStrict := by
  sorry

/-- weight_one_irregular: a weight-one newform gives an irregular family, `a = b = 0`. -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (f : CuspidalGL2 ℚ) (hf : f.HasParallelWeight 1)
    (ι : f.coefficientField →+* E) : ¬ (eigenformFamily (K := K) f ι).IsRegular := by
  sorry

/-- almost_strict_not_strict: almost strictness gives no Weil–Deligne conclusion at `q | ℓ` when the
residual member is reducible and `r_q` ramified: the two clauses of `IsAlmostStrict` have
hypotheses that both fail there, so the predicate holds whatever the comparison at `q` is. -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (C : CompatibleSystem ℚ E K) (lam : PrimeIndex E)
    (q : PrimeIndex ℚ) (hred : ¬ C.ResiduallyIrreducible lam) (hram : ¬ (C.wd q).IsUnramified)
    (h : ∀ lam' q', (lam', q') ≠ (lam, q) → q'.LiesOver lam'.residueChar →
      (C.ResiduallyIrreducible lam' → IsDeRhamAt (C.member lam') q' ∧
        (∀ σ, kwHodgeTateWeights (C.member lam') σ = {C.a, C.b}) ∧
        ((C.wd q').map (C.coeff lam')).IsIso (localWD (C.member lam') q')) ∧
      ((lam'.residueChar ≠ 2 ∧ (C.wd q').IsUnramified) → IsCrystallineAt (C.member lam') q' ∧
        (∀ σ, kwHodgeTateWeights (C.member lam') σ = {C.a, C.b}) ∧
        ((C.wd q').map (C.coeff lam')).IsIso (localWD (C.member lam') q'))) :
    C.IsAlmostStrict := by
  sorry

/-- hodge_tate_weights_convention: a newform of weight `k` gives KW weights `(a, b) = (k − 1, 0)`. -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (f : CuspidalGL2 ℚ) (k : ℕ) (hf : f.HasParallelWeight k)
    (ι : f.coefficientField →+* E) :
    (eigenformFamily (K := K) f ι).a = (k : ℤ) - 1 ∧ (eigenformFamily (K := K) f ι).b = 0 := by
  sorry

/-! #### Operations -/

/-- twist_cyclotomic: twisting by the cyclotomic family (`H = {−1}`) shifts each Hodge number by
`−1` and the pure weight by `−2`. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (R : WeaklyCompatibleSystem F M K n) (w : ℤ)
    (hR : R.IsPure w) (τ : F →+* AlgebraicClosure M) :
    (twist R (characterSystem (AlgebraicHeckeCharacter.normCharacter F M))).H τ =
        (R.H τ).map (· - 1) ∧
      (twist R (characterSystem (AlgebraicHeckeCharacter.normCharacter F M))).IsPure (w - 2) := by
  sorry

/-- restrict_trivial_extension: restriction along `F = F` returns the same members, polynomials and
Hodge data. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (R : WeaklyCompatibleSystem F M K n) :
    (restrict (F' := F) R).H = R.H ∧ ∀ v, v ∉ R.S → (restrict (F' := F) R).Q v = R.Q v := by
  sorry

/-- induce_quadratic_trivial: inducing the trivial character across a quadratic `F'/F` gives rank
two, `H = {0, 0}`, and good polynomials `(X − 1)²` at split and `X² − 1` at inert primes. -/
example {F F' : Type} [Field F] [NumberField F] [Field F'] [NumberField F'] [Algebra F F']
    (h2 : Module.finrank F F' = 2) (v : PrimeIndex F)
    (hv : v ∉ (induce (F := F) (characterSystem (K := K)
      (AlgebraicHeckeCharacter.trivial F' M))).S) :
    (induce (F := F) (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F' M))).rank = 2 ∧
      ((induce (F := F) (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F' M))).Q v =
          (Polynomial.X - 1) ^ 2 ∨
        (induce (F := F) (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F' M))).Q v =
          Polynomial.X ^ 2 - 1) := by
  sorry

/-- induced_regular_nonexample: the induced quadratic trivial character is not regular. -/
example {F F' : Type} [Field F] [NumberField F] [Field F'] [NumberField F'] [Algebra F F']
    (h2 : Module.finrank F F' = 2) :
    ¬ (induce (F := F) (characterSystem (K := K)
      (AlgebraicHeckeCharacter.trivial F' M))).IsRegular := by
  sorry

/-- dual_rank_two: `X² − aX + b` with `b ≠ 0` has dual `X² − (a/b)X + 1/b`. -/
example (a b : M) (hb : b ≠ 0) :
    dualPolynomial (Polynomial.X ^ 2 - Polynomial.C a * Polynomial.X + Polynomial.C b) =
      Polynomial.X ^ 2 - Polynomial.C (a / b) * Polynomial.X + Polynomial.C (1 / b) := by
  sorry

/-- sym2_distinct: for a regular rank-two system, `Sym²` stays regular (`{2h₁, h₁ + h₂, 2h₂}`
distinct). -/
example {F : Type} [Field F] [NumberField F] (R : WeaklyCompatibleSystem F M K 2)
    (hR : R.IsRegular) : (symmetricPower 2 R).IsRegular := by
  sorry

/-- tensor_collision: `H = {0, 1}` and `H' = {0, −1}` give a tensor product with `H = {0, −1, 1, 0}`,
which is not regular. -/
example {F : Type} [Field F] [NumberField F] (R T : WeaklyCompatibleSystem F M K 2)
    (τ : F →+* AlgebraicClosure M) (hR : R.H τ = {0, 1}) (hT : T.H τ = {0, -1}) :
    (tensor R T).H τ = {0, -1, 1, 0} ∧ ¬ (tensor R T).IsRegular := by
  sorry

/-- direct_sum_mixed_weights: `1 ⊕ ε` has weights `0` and `−2`, so it is not pure of one weight. -/
example {F : Type} [Field F] [NumberField F] :
    ¬ ∃ w, (directSum (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F M))
      (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter F M))).IsPure w := by
  sorry

/-- exterior_above_rank: `∧³` of a rank-two system has rank zero, with empty Hodge data. -/
example {F : Type} [Field F] [NumberField F] (R : WeaklyCompatibleSystem F M K 2)
    (τ : F →+* AlgebraicClosure M) :
    (exteriorPower 3 R).rank = 0 ∧ (exteriorPower 3 R).H τ = 0 := by
  sorry

/-! #### Brauer families -/

/-- brauer_trivial_F: for `F = ℚ` the Brauer family is the family of `π` itself. -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (p : ℕ) [Fact p.Prime]
    (ρ : GaloisGroup ℚ →* GL2 (PadicAlgCl p)) [NumberField (⊥ : IntermediateField ℚ QBar)]
    (hF : IsGalois ℚ (⊥ : IntermediateField ℚ QBar))
    (hFr : NumberField.IsTotallyReal (⊥ : IntermediateField ℚ QBar))
    (hmod : TauCeti.PotentialModularity.IsModularLift p (RingHom.id _)
      (TauCeti.PotentialModularity.restrictRep ρ (algebraMap ℚ (⊥ : IntermediateField ℚ QBar))))
    (hirr : TauCeti.PotentialModularity.IsAbsolutelyIrreducible
      (TauCeti.PotentialModularity.restrictRep ρ (algebraMap ℚ (⊥ : IntermediateField ℚ QBar))))
    (lam : PrimeIndex E) :
    ∃ (π : CuspidalGL2 ℚ) (ι : π.coefficientField →+* E)
      (e : (Fin 2 → K lam) ≃ₗ[K lam] (Fin 2 → K lam)), ∀ g x,
      e ((eigenformFamily (K := K) π ι).member lam g x) =
        (brauerSystem (E := E) (K := K) p ρ ⊥ hF hFr hmod hirr).member lam g (e x) := by
  sorry

/-- brauer_quadratic_coefficients: for `G = ℤ/2`, `1 = Ind_1^G 1 − ε` in the representation ring:
the regular class (traces `(2, 0)`) minus the sign class (`(1, −1)`) is the trivial class, since
traces separate classes. -/
example {F : Type} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] (reg sgn one : RepRing F l)
    (hreg : ∀ σ, RepRing.trace σ reg = RepRing.trace σ one + RepRing.trace σ sgn) :
    reg - sgn = one := by
  sorry

/-- brauer_virtual_nonexample: the virtual class `3·1 − ε` of `ℤ/2` has dimension two but norm ten, so
it is not the class of a representation. -/
example {F : Type} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] (one ε : RepRing F l)
    (h1 : RepRing.pairing one one = 1) (hε : RepRing.pairing ε ε = 1)
    (h0 : RepRing.pairing one ε = 0) (h0' : RepRing.pairing ε one = 0) :
    RepRing.pairing (3 • one - ε) (3 • one - ε) = 10 := by
  sorry

/-- brauer_trace_agreement: for a non-CM elliptic curve over `ℚ` (`F = ℚ`), the Brauer family has
the same good Frobenius polynomials as the given `p`-adic member. -/
example {E : Type} [Field E] [NumberField E] {K : PrimeIndex E → Type} [∀ lam, Field (K lam)]
    [∀ lam, TopologicalSpace (K lam)] (p : ℕ) [Fact p.Prime]
    (ρ : GaloisGroup ℚ →* GL2 (PadicAlgCl p)) (F : IntermediateField ℚ QBar) [NumberField F]
    (hF : IsGalois ℚ F) (hFr : NumberField.IsTotallyReal F)
    (hmod : TauCeti.PotentialModularity.IsModularLift p (RingHom.id _)
      (TauCeti.PotentialModularity.restrictRep ρ (algebraMap ℚ F)))
    (hirr : TauCeti.PotentialModularity.IsAbsolutelyIrreducible
      (TauCeti.PotentialModularity.restrictRep ρ (algebraMap ℚ F))) :
    ∃ (ι : E →+* PadicAlgCl p) (T : Finset (PrimeIndex ℚ)) (Q : PrimeIndex ℚ → E[X]), ∀ v ∉ T,
      (ρ (frobLift v) : Matrix (Fin 2) (Fin 2) _).charpoly = (Q v).map ι := by
  sorry

/-! #### Weakly compatible systems and predicates -/

/-- wcs_cyclotomic: the cyclotomic system (idelic norm) has rank one, `H = {−1}`, good polynomial
`X − q_v⁻¹` (geometric Frobenius) and weight `−2`. -/
example (τ : ℚ →+* AlgebraicClosure M) (v : PrimeIndex ℚ)
    (hv : v ∉ (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)).S) :
    (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)).H τ = {-1} ∧
      (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)).Q v =
        Polynomial.X - Polynomial.C ((v.norm : M)⁻¹) ∧
      (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)).IsPure (-2) := by
  sorry

/-- wcs_newform_delta: the cohomological system of `Δ` has rank two, `H = {0, 11}` and
`Q₂ = X² + 24X + 2048`. -/
example (Δ : CuspidalGL2 ℚ) (hΔ : Δ.HasParallelWeight 12) (ι : Δ.coefficientField →+* M)
    (τ : ℚ →+* AlgebraicClosure M) (v : PrimeIndex ℚ) (hv : v.LiesOver 2) :
    (eigenformSystem (K := K) Δ ι).H τ = {0, 11} ∧
      (eigenformSystem (K := K) Δ ι).Q v = Polynomial.X ^ 2 + 24 * Polynomial.X + 2048 := by
  sorry

/-- wcs_not_just_traces: two systems with the same polynomials have members isomorphic only up to
conjugation; the carrier stores the members themselves. -/
example {F : Type} [Field F] [NumberField F] (R : WeaklyCompatibleSystem F M K 2)
    (lam : PrimeIndex M) (P : (Fin 2 → K lam) ≃ₗ[K lam] (Fin 2 → K lam)) :
    ∃ R' : WeaklyCompatibleSystem F M K 2, R'.Q = R.Q ∧ R'.H = R.H ∧
      ∀ g, R'.member lam g = P.toLinearMap ∘ₗ R.member lam g ∘ₗ P.symm.toLinearMap := by
  sorry

/-- wcs_S_enlarge: enlarging `S` keeps the members and Hodge data. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (R : WeaklyCompatibleSystem F M K n)
    (S' : Finset (PrimeIndex F)) (h : R.S ⊆ S') :
    (R.enlargeRamificationSet S' h).member = R.member ∧ (R.enlargeRamificationSet S' h).H = R.H ∧
      (R.enlargeRamificationSet S' h).S = S' := by
  sorry

/-- pred_newform: the system of a newform of weight `k ≥ 2` is regular, strictly pure of weight
`k − 1`, irreducible and automorphic. -/
example (f : CuspidalGL2 ℚ) (k : ℕ) (hk : 2 ≤ k) (hf : f.HasParallelWeight k)
    (ι : f.coefficientField →+* M) :
    (eigenformSystem (K := K) f ι).IsRegular ∧
      (eigenformSystem (K := K) f ι).IsStrictlyPure ((k : ℤ) - 1) ∧
      (eigenformSystem (K := K) f ι).IsIrreducible ∧
      (eigenformSystem (K := K) f ι).IsAutomorphic := by
  sorry

/-- pred_regular_fails: `ε ⊕ ε` has `H = {−1, −1}` and is not regular. -/
example {F : Type} [Field F] [NumberField F] :
    ¬ (directSum (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter F M))
      (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter F M))).IsRegular := by
  sorry

/-- pred_odd_purity: for odd rank and a real place, purity forces an even weight. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (hn : Odd n)
    (R : WeaklyCompatibleSystem F M K n) (w : ℤ) (hR : R.IsPure w) (τ : F →+* ℝ) :
    Even w := by
  sorry

/-- pred_strict_vs_almost_strict: BLGGT strict compatibility of the weakly compatible system of a
KW family asks only for comparisons at `λ ∤ v`, which plain KW compatibility already supplies. -/
example {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
    {K : PrimeIndex E → Type} [∀ lam, Field (K lam)] [∀ lam, TopologicalSpace (K lam)]
    (C : CompatibleSystem F E K) (S : Finset (PrimeIndex F))
    (hdR : ∀ lam q, q.LiesOver lam.residueChar → IsDeRhamAt (C.member lam) q)
    (hcris : ∀ lam q, q ∉ S → q.LiesOver lam.residueChar → IsCrystallineAt (C.member lam) q) :
    (WeaklyCompatibleSystem.ofCompatibleSystem C S hdR hcris).IsStrictlyCompatible := by
  sorry

/-! #### L-functions -/

/-- trivial_character: for the trivial character over `ℚ`, `d⁺ = 1`, `d⁻ = 0`, `L_∞ = Γ_ℝ(s)`,
`ε_∞ = 1`. -/
example (s : ℂ) :
    archimedeanD 1 0 1 = (1, 0) ∧ archimedeanGammaFactor true {0} {0} 0 1 0 s = Complex.Gammaℝ s ∧
      archimedeanEpsilon true {0} {0} 0 0 = 1 := by
  sorry

/-- gamma_duplication: `Γ_ℂ(s) = Γ_ℝ(s) Γ_ℝ(s + 1)`. -/
example (s : ℂ) : Complex.Gammaℂ s = Complex.Gammaℝ s * Complex.Gammaℝ (s + 1) := by
  sorry

/-- cyclotomic_character: for the cyclotomic system over `ℚ`, `L^S(ıε, s) = ζ^S(s + 1)`, so its
partial L-function agrees with that of the trivial system shifted by one. -/
example (ι : M →+* ℂ) (s : ℂ)
    (hS : (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)).S =
      (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial ℚ M)).S) :
    partialLFunction (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter ℚ M)) ι s =
      partialLFunction (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial ℚ M)) ι
        (s + 1) := by
  sorry

/-- elliptic_curve_gamma_factor: for `H¹` of an elliptic curve (`n = 2`, `w = 1`, `H = {0, 1}`,
`d^± = 1`), `L_∞ = Γ_ℂ(s)` and `ε_∞ = −1`. -/
example (s : ℂ) (hs : ∀ n : ℕ, s - 1 / 2 ≠ -n) :
    archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 s = Complex.Gammaℂ s ∧
      archimedeanEpsilon true {0, 1} {0, 1} 1 1 = -1 := by
  sorry

/-! #### The representation ring -/

/-- pairing_norm: for distinct irreducibles `V₁, V₂`, `A = 2[V₁] − [V₂]` has `(A, A) = 5`. -/
example {F : Type} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] (V₁ V₂ : RepRing F l)
    (h11 : RepRing.pairing V₁ V₁ = 1) (h22 : RepRing.pairing V₂ V₂ = 1)
    (h12 : RepRing.pairing V₁ V₂ = 0) (h21 : RepRing.pairing V₂ V₁ = 0) :
    RepRing.pairing (2 • V₁ - V₂) (2 • V₁ - V₂) = 5 := by
  sorry

/-- trivial_class: the unit class has `(1, 1) = 1` and dimension `1`. -/
example {F : Type} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] :
    RepRing.pairing (1 : RepRing F l) 1 = 1 ∧ RepRing.dim (1 : RepRing F l) = 1 := by
  sorry

/-- induced_dimension: `dim ind_{F'/F} 1 = [F' : F]` and `(ind 1, 1) = 1`. -/
example {F F' : Type} [Field F] [NumberField F] [Field F'] [NumberField F'] [Algebra F F']
    (l : ℕ) [Fact l.Prime] :
    RepRing.dim (RepRing.ind (F := F) (1 : RepRing F' l)) = Module.finrank F F' ∧
      RepRing.pairing (RepRing.ind (F := F) (1 : RepRing F' l)) 1 = 1 := by
  sorry

/-- virtual_not_genuine: positive dimension alone does not make a class genuine; the norm-one
criterion is `eq_irreducible_of_pairing_eq_one`. -/
example {F : Type} [Field F] [NumberField F] (l : ℕ) [Fact l.Prime] (one ε : RepRing F l)
    (h1 : RepRing.pairing one one = 1) (hε : RepRing.pairing ε ε = 1)
    (h0 : RepRing.pairing one ε = 0) (h0' : RepRing.pairing ε one = 0) :
    RepRing.pairing (3 • one - ε) (3 • one - ε) ≠ 1 := by
  sorry

/-! #### Monodromy data -/

/-- torus_case: for a CM-type system `G⁰_l` is a torus, so `G^sc_l` is trivial and the kernel of
`G^sc_l → G^ad_l` has order one. -/
example {F : Type} [Field F] [NumberField F] (L : LarsenData F 2)
    (hcomm : ∀ l : Nat.Primes, ∀ x ∈ L.identityComponent l, ∀ y ∈ L.identityComponent l,
      x * y = y * x) (l : Nat.Primes) : L.centerOrder l = 1 := by
  sorry

/-- gl2_case: for a non-CM elliptic curve, `SL₂ → PGL₂` has kernel of order two, so `2 ∣ A(2)`. -/
example {F : Type} [Field F] [NumberField F] (L : LarsenData F 2) (l : Nat.Primes)
    (h : L.centerOrder l = 2) : 2 ∣ L.A := by
  sorry

/-- finite_image: for an Artin representation `G⁰_l = 1`. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (L : LarsenData F n)
    (hfin : ∀ l : Nat.Primes, Finite (L.G l)) (l : Nat.Primes) : L.identityComponent l = ⊥ := by
  sorry

/-- theta_bound_depends_on_system: for `ε^k` over `ℚ` the exponent of `θ_l` is `±k`, so no bound
independent of the system exists. -/
example (k : ℤ) (L : LarsenData ℚ 1) (hθ : ∀ l τ, L.theta l τ = fun _ => k)
    (hr : 0 < L.rankC) (τ₀ : L.componentField →+* ℝ) :
    ∀ C : ℕ, C ≤ k.natAbs → ¬ ∀ l τ i, (L.theta l τ i).natAbs < C := by
  sorry

/-! #### Polarized systems -/

section PolarizedTests
variable {F Fplus : Type} [Field F] [NumberField F] [Field Fplus] [NumberField Fplus] {n : ℕ}
  {j : GaloisGroup F →* GaloisGroup Fplus} {c : (Fplus →+* ℝ) → GaloisGroup Fplus}
  {a : (Fplus →+* ℝ) → MulAut (GaloisGroup F)}

/-- polarized_cm_unit: the trivial rank-one system with multiplier `δ` (`δ(c_v) = −1`) is totally odd;
multiplier `1` has the wrong sign. -/
example (P : PolarizedSystem F Fplus M K 1 j c a)
    (hδ : ∀ lam v, P.multiplier.charValue lam (c v) = -1) : P.IsTotallyOdd := by
  sorry

/-- polarized_rank_two: total oddness is read off the actual pairing sign, through
`ε_v = −μ(c_v)`. -/
example (P : PolarizedSystem F Fplus M K 2 j c a) :
    P.IsTotallyOdd ↔ ∀ lam v, P.multiplier.charValue lam (c v) = -1 := by
  sorry

/-- polarized_multiplier_wrong: a pairing of sign `+1` with multiplier `+1` at `c_v` violates
`ε_v = −μ(c_v)`. -/
example (P : PolarizedSystem F Fplus M K n j c a) (lam : PrimeIndex M) (v : Fplus →+* ℝ)
    (hs : P.sign lam v = 1) (hμ : P.multiplier.charValue lam (c v) = 1)
    (h2 : (2 : K lam) ≠ 0) : False := by
  sorry

/-- polarized_forget_pairing: forgetting the pairing leaves essential conjugate self-duality. -/
example (P : PolarizedSystem F Fplus M K n j c a) (v : Fplus →+* ℝ) :
    P.system.IsEssentiallySelfDual j (a v) P.multiplier :=
  P.isEssentiallySelfDual v

/-- polarized_tensor_sign: signs multiply under tensor product (with the corrected multiplier
`μμ'δ`). -/
example (P Q : PolarizedSystem F Fplus M K n j c a) (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1)
    (hP : P.IsTotallyOdd) (hQ : Q.IsTotallyOdd) (lam) (v) :
    (P.tensor Q δ hδc hδj).sign lam v = 1 := by
  sorry

/-- polarized_dual_sign: duality keeps the sign. -/
example (P : PolarizedSystem F Fplus M K n j c a) (lam) (v) :
    P.dual.sign lam v = P.sign lam v := by
  sorry

/-- polarized_unit_tensor: tensoring with a totally odd rank-one polarized unit preserves total
oddness. -/
example (P : PolarizedSystem F Fplus M K n j c a) (U : PolarizedSystem F Fplus M K 1 j c a)
    (δ : WeaklyCompatibleSystem Fplus M K 1)
    (hδc : ∀ lam v, δ.charValue lam (c v) = -1) (hδj : ∀ lam g, δ.charValue lam (j g) = 1)
    (hP : P.IsTotallyOdd) (hU : U.IsTotallyOdd) : (P.tensor U δ hδc hδj).IsTotallyOdd :=
  PolarizedSystem.tensor_isTotallyOdd P U δ hδc hδj hP hU

/-- polarized_sum_mismatch: a block pairing of a symmetric and an alternating pairing has no common
sign. -/
example (lam : PrimeIndex M) (s₁ s₂ : K lam) (h₁ : s₁ = 1) (h₂ : s₂ = -1)
    (h2 : (2 : K lam) ≠ 0) : ¬ ∃ s : K lam, s = s₁ ∧ s = s₂ := by
  sorry

end PolarizedTests

/-! #### Character and Artin families -/

/-- character_trivial: `χ = 1` gives `Q_v = X − 1`, `H = {0}` and weight `0`. -/
example {F : Type} [Field F] [NumberField F] (τ : F →+* AlgebraicClosure M) (v : PrimeIndex F)
    (hv : v ∉ (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F M)).S) :
    (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F M)).Q v = Polynomial.X - 1 ∧
      (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F M)).H τ = {0} ∧
      (characterSystem (K := K) (AlgebraicHeckeCharacter.trivial F M)).IsPure 0 := by
  sorry

/-- character_cyclotomic: the idelic norm gives `H = {−1}` and weight `−2`. -/
example {F : Type} [Field F] [NumberField F] (τ : F →+* AlgebraicClosure M) :
    (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter F M)).H τ = {-1} ∧
      (characterSystem (K := K) (AlgebraicHeckeCharacter.normCharacter F M)).IsPure (-2) := by
  sorry

/-- character_finite_order: a finite-order Hecke character has `H = {0}` and weight `0`. -/
example {F : Type} [Field F] [NumberField F] (χ : AlgebraicHeckeCharacter F M)
    (hfin : ∃ m : ℕ, 0 < m ∧ ∀ v, χ.value v ^ m = 1) (τ : F →+* AlgebraicClosure M) :
    (characterSystem (K := K) χ).H τ = {0} ∧ (characterSystem (K := K) χ).IsPure 0 := by
  sorry

/-- character_non_algebraic: the constructor only takes algebraic characters of type `A₀`; its
Hodge data are the integer infinity type. -/
example {F : Type} [Field F] [NumberField F] (χ : AlgebraicHeckeCharacter F M)
    (τ : F →+* AlgebraicClosure M) :
    ∃ a : ℤ, (characterSystem (K := K) χ).H τ = {a} := by
  sorry

section ArtinTests
variable {F : Type} [Field F] [NumberField F] {Γ : Type} [Group Γ] [Finite Γ]

/-- artin_trivial: the trivial rank-one quotient gives `Q_v = X − 1` and `H = {0}`. -/
example (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F))) (τ)
    (v : PrimeIndex F) (hv : v ∉ (artinSystem (K := K) q hq (1 : Representation M Γ (Fin 1 → M))).S) :
    (artinSystem (K := K) q hq (1 : Representation M Γ (Fin 1 → M))).Q v = Polynomial.X - 1 ∧
      (artinSystem (K := K) q hq (1 : Representation M Γ (Fin 1 → M))).H τ = {0} := by
  sorry

/-- artin_quadratic: for a quadratic character the good polynomial is `X − 1` or `X + 1`. -/
example (q : GaloisGroup F →* Multiplicative (ZMod 2))
    (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M (Multiplicative (ZMod 2)) (Fin 1 → M))
    (ha : a (Multiplicative.ofAdd 1) = -LinearMap.id) (v : PrimeIndex F)
    (hv : v ∉ (artinSystem (K := K) q hq a).S) :
    (artinSystem (K := K) q hq a).Q v = Polynomial.X - 1 ∨
      (artinSystem (K := K) q hq a).Q v = Polynomial.X + 1 := by
  sorry

/-- artin_rank_two_irregular: every rank-two Artin family has `H = {0, 0}` and is not regular. -/
example (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F)))
    (a : Representation M Γ (Fin 2 → M)) : ¬ (artinSystem (K := K) q hq a).IsRegular := by
  sorry

/-- artin_roots_unity: good roots of an Artin family have absolute value one under every complex
embedding. -/
example (q : GaloisGroup F →* Γ) (hq : IsOpen (q.ker : Set (GaloisGroup F))) {n : ℕ}
    (a : Representation M Γ (Fin n → M)) (v : PrimeIndex F)
    (hv : v ∉ (artinSystem (K := K) q hq a).S) (α : AlgebraicClosure M)
    (hα : (((artinSystem (K := K) q hq a).Q v).map (algebraMap M (AlgebraicClosure M))).IsRoot α)
    (σ : AlgebraicClosure M →+* ℂ) : ‖σ α‖ = 1 := by
  sorry

end ArtinTests

/-! #### Weakened data -/

/-- weakening_rank_one: in rank one the determinant Hodge condition is the full Hodge condition. -/
example {F : Type} [Field F] [NumberField F] (R : ExtremelyWeaklyCompatibleSystem F M K 1)
    (τ : F →+* AlgebraicClosure M) : ∃ a : ℤ, R.H τ = {a} := by
  sorry

/-- weakening_higher_rank_metadata: `H = {0, 2}` and `H' = {1, 1}` have the same determinant sum;
the determinant condition distinguishes neither the multiset nor regularity. -/
example {F : Type} [Field F] [NumberField F] (R : ExtremelyWeaklyCompatibleSystem F M K 2)
    (τ : F →+* AlgebraicClosure M) (hR : R.H τ = {0, 2}) :
    ∃ R' : ExtremelyWeaklyCompatibleSystem F M K 2, R'.H τ = {1, 1} ∧
      (R'.H τ).sum = (R.H τ).sum := by
  sorry

/-- weakening_hodge_purity_not_sum: `H_τ = {−1, 1}` and `H_{cτ} = {0, 0}` both have sum zero, but
`H_{cτ} ≠ −H_τ`. -/
example {F : Type} [Field F] [NumberField F] (R : ExtremelyWeaklyCompatibleSystem F M K 2)
    (τ : F →+* AlgebraicClosure M) (c : AlgebraicClosure M ≃+* AlgebraicClosure M)
    (hτ : R.H τ = {-1, 1}) (hcτ : R.H (c.toRingHom.comp τ) = {0, 0}) :
    (R.H τ).sum = (R.H (c.toRingHom.comp τ)).sum ∧
      R.H (c.toRingHom.comp τ) ≠ (R.H τ).map (fun h => 0 - h) := by
  sorry

/-- weakening_transitive: weak → very weak → extremely weak keeps members, polynomials and Hodge
data. -/
example {F : Type} [Field F] [NumberField F] {n : ℕ} (R : WeaklyCompatibleSystem F M K n) :
    R.toVeryWeak.toExtremelyWeak.member = R.member ∧ R.toVeryWeak.toExtremelyWeak.Q = R.Q ∧
      R.toVeryWeak.toExtremelyWeak.H = R.H := by
  sorry

end TauCeti.CompatibleSystems.Tests
