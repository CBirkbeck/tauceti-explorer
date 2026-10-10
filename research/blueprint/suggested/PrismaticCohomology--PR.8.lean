import Mathlib.CategoryTheory.Functor.KanExtension.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.GroupTheory.PGroup
import Mathlib.NumberTheory.Padics.RingHoms
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.MonCat.Basic
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.Additive
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.Embedding.Extend
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.Single
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicTopology.AlternatingFaceMapComplex
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Limits.Shapes.IsTerminal
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Sites.Continuous
import Mathlib.CategoryTheory.Sites.CoverLifting
import Mathlib.CategoryTheory.Sites.CoversTop.Basic
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Sieves.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Whiskering
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.Nat.Prime.Int
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.DividedPowers.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Nilpotent.Basic
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.RingHom.FaithfullyFlat
import Mathlib.RingTheory.RingHom.Flat
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Verschiebung
import Mathlib.RingTheory.WittVector.WittPolynomial
/-!
# Suggested Lean for PrismaticCohomology, Part PR.8 (logarithmic prismatic cohomology)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PrismaticCohomology--PR.8.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures; every
proof is `sorry`, and nothing here claims an implementation.

All API items and tests in the packet have a typed form below. Supplier-owned objects
such as schemes, sites, completed chart rings and stable derived constructions are explicit
Type-valued fixtures with separate maps and properties. They are not implementations. The
concrete algebraic predicates use their actual axioms; a condition whose supplier interface
is unavailable is omitted and identified in the declaration comment, as PROTOCOL §13 requires.
The document supplies the complete ranges, sheaf-level and E∞ structures, completion and chart
conditions that the 1-categorical signatures omit. The full 2026 correcting text was read:
Laurent realization lands in the p-Kummer full subcategory, not all Kummer local systems.

PR.0/DD.1 interfaces are repeated only to let this standalone suggested file elaborate; their
owners supply the eventual implementation. Existing Mathlib and Tau Ceti objects are imported.
No assertion here certifies that a proposed supplier or recorded gap is already implemented.
-/

namespace TauCeti.LogPrismatic

open scoped BigOperators

universe u v w

section Delta

variable (p : ℕ) [Fact p.Prime]

/-- PR.0's integral addition correction `C_p(x, y) = -Σ_{0<i<p} (binom(p,i)/p) x^i y^(p-i)`,
restated from PR.0's suggested file so that this file elaborates on its own. -/
def addCorrection {R : Type*} [CommRing R] (x y : R) : R :=
  - ∑ i ∈ Finset.Icc 1 (p - 1), ((p.choose i / p : ℕ) : R) * x ^ i * y ^ (p - i)

/-- PR.0's δ-structure (node `PR.0/delta-frobenius-dictionary`), restated with the same axioms. -/
structure DeltaStructure (R : Type u) [CommRing R] where
  delta : R → R
  delta_zero : delta 0 = 0
  delta_one : delta 1 = 0
  delta_add : ∀ x y, delta (x + y) = delta x + delta y + addCorrection p x y
  delta_mul : ∀ x y, delta (x * y) =
    x ^ p * delta y + y ^ p * delta x + (p : R) * delta x * delta y

variable {p}

/-- The Frobenius lift `φ(x) = x^p + p δ(x)` of a δ-structure. -/
def DeltaStructure.frob {R : Type*} [CommRing R] (d : DeltaStructure p R) (x : R) : R :=
  x ^ p + (p : R) * d.delta x

end Delta

/-! The following coefficient carrier and delta operations are PR.0 test fixtures, not
additional PR.8 targets. The coefficient Frobenius fixes Z_(p); delta is its divided difference.
The prime-ideal witness and all unimplemented constructions are mathematical obligations. -/

/-- The ideal (p) in the integers. -/
def primeIntegerIdeal (p : ℕ) : Ideal ℤ := Ideal.span {(p : ℤ)}

instance primeIntegerIdeal_isPrime (p : ℕ) [Fact p.Prime] :
    (primeIntegerIdeal p).IsPrime := by
  sorry

/-- Z_(p), rather than the p-adic integers used by the earlier weak test. -/
abbrev PInteger (p : ℕ) [Fact p.Prime] := Localization.AtPrime (primeIntegerIdeal p)

/-- PR.0 fixture: the unique delta operation with identity Frobenius on Z_(p). -/
noncomputable def pIntegerDelta (p : ℕ) [Fact p.Prime] : DeltaStructure p (PInteger p) := by
  sorry

/-- The fixture is specified by its divided difference, not by an arbitrary delta operation. -/
theorem pIntegerDelta_spec (p : ℕ) [Fact p.Prime] (a : PInteger p) :
    (p : PInteger p) * (pIntegerDelta p).delta a = a - a ^ p := by
  sorry

/-- The monoid-algebra Frobenius fixes coefficients and takes monomials to their p-th powers. -/
noncomputable def monoidAlgebraFrobenius (p : ℕ) [Fact p.Prime]
    (M : Type*) [CommMonoid M] :
    MonoidAlgebra (PInteger p) M →+* MonoidAlgebra (PInteger p) M :=
  MonoidAlgebra.mapDomainRingHom (PInteger p) (powMonoidHom p)

/-- PR.0 fixture: the delta structure determined by this Frobenius on a p-torsion-free ring. -/
noncomputable def monoidAlgebraDelta (p : ℕ) [Fact p.Prime]
    (M : Type*) [CommMonoid M] : DeltaStructure p (MonoidAlgebra (PInteger p) M) := by
  sorry

theorem monoidAlgebraDelta_spec (p : ℕ) [Fact p.Prime]
    (M : Type*) [CommMonoid M] (a : MonoidAlgebra (PInteger p) M) :
    (p : MonoidAlgebra (PInteger p) M) * (monoidAlgebraDelta p M).delta a =
      monoidAlgebraFrobenius p M a - a ^ p := by
  sorry

theorem monoidAlgebraDelta_of (p : ℕ) [Fact p.Prime]
    (M : Type*) [CommMonoid M] (m : M) :
    (monoidAlgebraDelta p M).delta (MonoidAlgebra.of (PInteger p) M m) = 0 := by
  sorry

/-! PR.0/DD.1 fixtures, with actual axioms. Derived completeness is the same orthogonality
predicate as PR.0's suggested file. It is a 1-categorical signature of the source's derived
condition. These interfaces remain owned by PR.0 and DD.1. -/

open CategoryTheory
attribute [local instance] HasDerivedCategory.standard

noncomputable def DeltaStructure.frobenius {p : ℕ} [Fact p.Prime]
    {A : Type*} [CommRing A] (d : DeltaStructure p A) : A →+* A where
  toFun := d.frob
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

noncomputable def IsDerivedComplete {A : Type u} [CommRing A] (J : Ideal A)
    (K : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∀ f ∈ J, ∀ n : ℤ,
    Subsingleton (((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj
      (ModuleCat.of A (Localization.Away f))) ⟶ K⟦n⟧)

structure PrismFixture (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] where
  delta : DeltaStructure p A
  ideal : Ideal A
  invertible : Module.Invertible A ideal
  complete : IsDerivedComplete (Ideal.span {(p : A)} ⊔ ideal)
    ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A))
  p_mem : (p : A) ∈ ideal ⊔ ideal.map delta.frobenius

/-! ## A. δ_log-rings (node `PR.8/delta-log-ring`) -/

/-- **Definition (PR.8/delta-log-ring).** A δ_log-ring: a δ-ring `A`, a prelog structure
`α : M →* A` to the multiplicative monoid, and `deltaLog : M → A` with
`δ_log(e) = 0`, `α(m)^p δ_log(m) = δ(α(m))` and
`δ_log(m m') = δ_log(m) + δ_log(m') + p δ_log(m) δ_log(m')` (Koshikawa I, Definition 2.2).
The API item `DeltaLogRing.mk` is the structure constructor. -/
structure DeltaLogRing (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] where
  delta : DeltaStructure p A
  α : M →* A
  deltaLog : M → A
  deltaLog_one : deltaLog 1 = 0
  alpha_pow_mul_deltaLog : ∀ m, α m ^ p * deltaLog m = delta.delta (α m)
  deltaLog_mul : ∀ m m', deltaLog (m * m') = deltaLog m + deltaLog m' + (p : A) * deltaLog m * deltaLog m'

namespace DeltaLogRing

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- API `DeltaLogRing.ext`: equality of the three data fields determines the structure. -/
theorem ext (D E : DeltaLogRing p A M) (hδ : D.delta = E.delta)
    (hα : D.α = E.α) (hlog : D.deltaLog = E.deltaLog) : D = E := by
  sorry

/-- API `DeltaLogRing.frobenius_alpha`: `φ(α(m)) = α(m)^p (1 + p δ_log(m))`. -/
theorem frobenius_alpha (D : DeltaLogRing p A M) (m : M) :
    D.delta.frob (D.α m) = D.α m ^ p * (1 + (p : A) * D.deltaLog m) := by
  sorry

/-- The unit factor `m ↦ 1 + p δ_log(m)`, a monoid map `M →* A`. -/
def unitFactor (D : DeltaLogRing p A M) : M →* A where
  toFun m := 1 + (p : A) * D.deltaLog m
  map_one' := by sorry
  map_mul' := by sorry

/-- API `DeltaLogRing.unitFactor_mul`. -/
theorem unitFactor_mul (D : DeltaLogRing p A M) (m m' : M) :
    1 + (p : A) * D.deltaLog (m * m') =
      (1 + (p : A) * D.deltaLog m) * (1 + (p : A) * D.deltaLog m') := by
  sorry

/-- API `DeltaLogRing.frobenius_iterate_alpha`: `φ^n(α(m)) ∈ α(m)^{p^n} (1 + pA)`. -/
theorem frobenius_iterate_alpha (D : DeltaLogRing p A M) (m : M) (n : ℕ) :
    ∃ a : A, D.delta.frob^[n] (D.α m) = D.α m ^ (p ^ n) * (1 + (p : A) * a) := by
  sorry

/-- API `DeltaLogRing.deltaLog_unique_of_nonZeroDivisor`. -/
theorem deltaLog_unique_of_nonZeroDivisor (D E : DeltaLogRing p A M) (hδ : D.delta = E.delta)
    (hα : D.α = E.α) (h : ∀ m, D.α m ∈ nonZeroDivisors A) : D.deltaLog = E.deltaLog := by
  sorry

/-- API `DeltaLogRing.exists_iff_dvd`. -/
theorem exists_iff_dvd (δ : DeltaStructure p A) (α : M →* A) (h : ∀ m, α m ∈ nonZeroDivisors A) :
    (∃ D : DeltaLogRing p A M, D.delta = δ ∧ D.α = α) ↔ ∀ m, α m ^ p ∣ δ.delta (α m) := by
  sorry

/-- API `DeltaLogRing.Hom`: morphisms of δ_log-rings. -/
structure Hom {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (D : DeltaLogRing p A M) (E : DeltaLogRing p B N) where
  ring : A →+* B
  monoid : M →* N
  comm_alpha : ∀ m, E.α (monoid m) = ring (D.α m)
  comm_delta : ∀ x, E.delta.delta (ring x) = ring (D.delta.delta x)
  comm_deltaLog : ∀ m, E.deltaLog (monoid m) = ring (D.deltaLog m)

/-- Identity morphism (part of API `DeltaLogRing.Hom`). -/
def Hom.id (D : DeltaLogRing p A M) : Hom D D where
  ring := RingHom.id A
  monoid := MonoidHom.id M
  comm_alpha _ := rfl
  comm_delta _ := rfl
  comm_deltaLog _ := rfl

/-- Composition (part of API `DeltaLogRing.Hom`). -/
def Hom.comp {B C : Type*} {N P : Type*} [CommRing B] [CommRing C] [CommMonoid N]
    [CommMonoid P] {D : DeltaLogRing p A M} {E : DeltaLogRing p B N} {F : DeltaLogRing p C P}
    (g : Hom E F) (f : Hom D E) : Hom D F where
  ring := g.ring.comp f.ring
  monoid := g.monoid.comp f.monoid
  comm_alpha _ := by sorry
  comm_delta _ := by sorry
  comm_deltaLog _ := by sorry

/-- API `DeltaLogRing.Hom.ext`: morphisms are determined by their ring and monoid maps. -/
theorem Hom.ext {B N : Type*} [CommRing B] [CommMonoid N]
    {D : DeltaLogRing p A M} {E : DeltaLogRing p B N} (f g : Hom D E)
    (hr : f.ring = g.ring) (hm : f.monoid = g.monoid) : f = g := by
  sorry

/-- API `DeltaLogRing.IsRankOne`: `δ_log = 0`. -/
def IsRankOne (D : DeltaLogRing p A M) : Prop :=
  ∀ m, D.deltaLog m = 0

/-- API `DeltaLogRing.trivialLog`: the units `Aˣ ⊂ A` with `δ_log(u) = δ(u) u^{-p}`. -/
noncomputable def trivialLog (δ : DeltaStructure p A) : DeltaLogRing p A Aˣ where
  delta := δ
  α := Units.coeHom A
  deltaLog u := δ.delta u * ((u⁻¹ : Aˣ) : A) ^ p
  deltaLog_one := by sorry
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- API `DeltaLogRing.monoidAlgebra`: `(R[M], M)` with a δ-structure killing `δ` on monoid
elements (Frobenius `m ↦ m^p`) is a δ_log-ring of rank one. -/
noncomputable def monoidAlgebra (R : Type*) [CommRing R] (M : Type*) [CommMonoid M]
    (δ : DeltaStructure p (MonoidAlgebra R M))
    (hδ : ∀ m, δ.delta (MonoidAlgebra.of R M m) = 0) :
    DeltaLogRing p (MonoidAlgebra R M) M where
  delta := δ
  α := MonoidAlgebra.of R M
  deltaLog _ := 0
  deltaLog_one := rfl
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- API `DeltaLogRing.baseChange`: along a δ-ring map `A → B`. -/
def baseChange (D : DeltaLogRing p A M) {B : Type*} [CommRing B] (δB : DeltaStructure p B)
    (f : A →+* B) (hf : ∀ x, δB.delta (f x) = f (D.delta.delta x)) : DeltaLogRing p B M where
  delta := δB
  α := f.toMonoidHom.comp D.α
  deltaLog m := f (D.deltaLog m)
  deltaLog_one := by sorry
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- The specific unit 1+p of Z_(p). -/
noncomputable def oneAddPrimeUnit : (PInteger p)ˣ := by
  sorry

theorem oneAddPrimeUnit_val : (oneAddPrimeUnit (p := p) : PInteger p) = 1 + p := by
  sorry

/-- Unit test `DeltaLogRing.trivialLog_deltaLog`: compute at 1+p for the identity-Frobenius
coefficient delta. Integer division is exact before casting; division by p is not performed
inside Z_(p). In particular this is not a statement about an arbitrary supplied delta. -/
example : (trivialLog (pIntegerDelta p)).deltaLog (oneAddPrimeUnit (p := p)) =
    ((((1 + (p : ℤ)) - (1 + (p : ℤ)) ^ p) / (p : ℤ) : ℤ) : PInteger p) *
      (((oneAddPrimeUnit (p := p))⁻¹ : (PInteger p)ˣ) : PInteger p) ^ p := by
  sorry

/-- Unit test `DeltaLogRing.zero_monoid` (degenerate): over the trivial monoid every δ_log-ring
has rank one. -/
example (D : DeltaLogRing p A PUnit) : D.IsRankOne := by
  sorry

/-- Unit test `DeltaLogRing.monoidAlgebra_rankOne`: the canonical delta, rather than
an assumed vanishing hypothesis, makes Z_(p)[N] rank one. -/
example :
    (monoidAlgebra (PInteger p) (Multiplicative ℕ) (monoidAlgebraDelta p (Multiplicative ℕ))
      (monoidAlgebraDelta_of p (Multiplicative ℕ))).IsRankOne ∧
    (monoidAlgebraDelta p (Multiplicative ℕ)).delta
      (MonoidAlgebra.of (PInteger p) (Multiplicative ℕ) (Multiplicative.ofAdd 1)) = 0 := by
  sorry

/-- Unit test `DeltaLogRing.not_any_map` (non-example): with `δ(x) = 1` there is no δ_log-structure
on `(Z_(p)[x], x^ℕ)`. -/
example (δ : DeltaStructure p (Polynomial (PInteger p))) (hX : δ.delta Polynomial.X = 1) :
    ¬ ∃ D : DeltaLogRing p (Polynomial (PInteger p)) (Multiplicative ℕ),
      D.delta = δ ∧ D.α (Multiplicative.ofAdd 1) = Polynomial.X := by
  sorry

/-! A concrete model of the free delta-log algebra. The variable `none` is x and
`some i` is y_i. Its carrier and formulas state K1 Lemma 2.11's test contract. The general
free-on-monoid adjunction remains an untyped request; this model does not claim that adjunction. -/

abbrev FreeOneGenerator (p : ℕ) [Fact p.Prime] := MvPolynomial (Option ℕ) (PInteger p)

noncomputable def freeX : FreeOneGenerator p := MvPolynomial.X none
noncomputable def freeY (i : ℕ) : FreeOneGenerator p := MvPolynomial.X (some i)

noncomputable def freeFrobenius : FreeOneGenerator p →+* FreeOneGenerator p :=
  MvPolynomial.eval₂Hom MvPolynomial.C (fun j => match j with
    | none => freeX ^ p * (1 + (p : FreeOneGenerator p) * freeY 0)
    | some i => freeY i ^ p + (p : FreeOneGenerator p) * freeY (i + 1))

/-- PR.0's torsion-free divided-difference construction, specialised to this model. -/
noncomputable def freeDelta : DeltaStructure p (FreeOneGenerator p) := by
  sorry

theorem freeDelta_spec (a : FreeOneGenerator p) :
    (p : FreeOneGenerator p) * freeDelta.delta a = freeFrobenius a - a ^ p := by
  sorry

noncomputable def freeOneGenerator : DeltaLogRing p (FreeOneGenerator p) (Multiplicative ℕ) := by
  sorry

theorem freeOneGenerator_delta : (freeOneGenerator (p := p)).delta = freeDelta := by
  sorry

theorem freeOneGenerator_alpha (n : ℕ) :
    (freeOneGenerator (p := p)).α (Multiplicative.ofAdd n) = freeX ^ n := by
  sorry

theorem freeOneGenerator_deltaLog :
    (freeOneGenerator (p := p)).deltaLog (Multiplicative.ofAdd 1) = freeY 0 := by
  sorry

/-- Unit test `DeltaLogRing.frobenius_alpha_example`: the actual free model with x,y_0,y_1,... . -/
example : (freeOneGenerator (p := p)).delta.frob freeX =
    freeX ^ p * (1 + (p : FreeOneGenerator p) * freeY 0) := by
  sorry

/-- Unit test `DeltaLogRing.freeOneGenerator_frobenius_x`: both defining generator formulas. -/
example : (freeOneGenerator (p := p)).delta.frob freeX =
      freeX ^ p * (1 + (p : FreeOneGenerator p) * freeY 0) ∧
    (freeOneGenerator (p := p)).delta.frob (freeY 0) =
      freeY 0 ^ p + (p : FreeOneGenerator p) * freeY 1 := by
  sorry

/-- Unit test `DeltaLogRing.freeOneGenerator_not_monoidAlgebra`: y_0 is not a polynomial in x. -/
example : ¬ ∃ f : Polynomial (PInteger p), Polynomial.eval₂ MvPolynomial.C freeX f = freeY 0 := by
  sorry

/-- Universal-property signature of the concrete one-generator model. -/
noncomputable def freeOneGenerator.lift [Algebra (PInteger p) A]
    (D : DeltaLogRing p A M) (m : M) : Hom (freeOneGenerator (p := p)) D := by
  sorry

theorem freeOneGenerator.lift_generator [Algebra (PInteger p) A]
    (D : DeltaLogRing p A M) (m : M) :
    (freeOneGenerator.lift D m).monoid (Multiplicative.ofAdd 1) = m := by
  sorry

theorem freeOneGenerator.lift_coeff [Algebra (PInteger p) A]
    (D : DeltaLogRing p A M) (m : M) (a : PInteger p) :
    (freeOneGenerator.lift D m).ring (MvPolynomial.C a) = algebraMap (PInteger p) A a := by
  sorry

theorem freeOneGenerator.lift_unique [Algebra (PInteger p) A]
    (D : DeltaLogRing p A M) (m : M) (f : Hom (freeOneGenerator (p := p)) D)
    (hm : f.monoid (Multiplicative.ofAdd 1) = m)
    (hc : ∀ a : PInteger p, f.ring (MvPolynomial.C a) = algebraMap (PInteger p) A a) :
    f = freeOneGenerator.lift D m := by
  sorry

/-- API `DeltaLogRing.freeOneGenerator_equiv_mvPolynomial`: the constructed free model
has the polynomial carrier; its freeness is the preceding evaluation-and-uniqueness contract. -/
noncomputable def freeOneGenerator_equiv_mvPolynomial : FreeOneGenerator p ≃+*
    MvPolynomial (Option ℕ) (PInteger p) := RingEquiv.refl _

/-- Unit test `DeltaLogRing.pdivisible_rankOne`: only vanishing of delta(alpha(m)) is asserted.
It does not silently conclude delta-log=0 when alpha(m) can be a zero divisor. -/
example (D : DeltaLogRing p A M) [IsAdicComplete (Ideal.span {(p : A)}) A]
    (hdiv : Function.Surjective (powMonoidHom p : M →* M)) (m : M) :
    D.delta.delta (D.α m) = 0 := by
  sorry

/-! ### The monoid Frobenius (node `PR.8/delta-log-frobenius`) -/

/-- A prelog structure is a log structure on the ring: `α⁻¹(Aˣ) ≅ Aˣ` (CR.5's notion, stated here
for rings only). -/
def IsLogRing (α : M →* A) : Prop :=
  ∀ a : Aˣ, ∃! m : M, α m = a

/-- API `DeltaLogRing.frobeniusMonoid`: `φ_M(m) = m^p · α⁻¹(1 + p δ_log(m))`. -/
noncomputable def frobeniusMonoid (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : M →* M := by
  sorry

/-- API `DeltaLogRing.alpha_frobeniusMonoid`. -/
theorem alpha_frobeniusMonoid (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (m : M) :
    D.α (D.frobeniusMonoid hlog hp m) = D.delta.frob (D.α m) := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne`. -/
theorem frobeniusMonoid_eq_pow_of_rankOne (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (h : D.IsRankOne) (m : M) :
    D.frobeniusMonoid hlog hp m = m ^ p := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_units`. -/
theorem frobeniusMonoid_units (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (u : Mˣ) :
    IsUnit (D.frobeniusMonoid hlog hp u) ∧
      D.α (D.frobeniusMonoid hlog hp u) = D.delta.frob (D.α u) := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_natural`. -/
theorem frobeniusMonoid_natural {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (D : DeltaLogRing p A M) (E : DeltaLogRing p B N) (f : Hom D E)
    (hD : IsLogRing D.α) (hE : IsLogRing E.α)
    (hpA : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hpB : (p : B) ∈ Ideal.jacobson (⊥ : Ideal B))
    (m : M) : f.monoid (D.frobeniusMonoid hD hpA m) = E.frobeniusMonoid hE hpB (f.monoid m) := by
  sorry

/-- On a rank-one prelog ring the power map is already a Frobenius lift. It needs
neither a logification nor a hypothesis that the chart monoid is a log ring. -/
def rankOneFrobeniusMonoid : M →* M := powMonoidHom p

theorem alpha_rankOneFrobeniusMonoid (D : DeltaLogRing p A M) (h : D.IsRankOne) (m : M) :
    D.α (rankOneFrobeniusMonoid (p := p) m) = D.delta.frob (D.α m) := by
  sorry

/-- Unit test `DeltaLogRing.frobeniusMonoid_bk`: an equality in the chart monoid itself,
for every n. The N chart of the Breuil–Kisin prelog ring is not assumed to be a log ring. -/
example (D : DeltaLogRing p (PowerSeries ℤ_[p]) (Multiplicative ℕ))
    (hα : ∀ n, D.α (Multiplicative.ofAdd n) = PowerSeries.X ^ n) (h : D.IsRankOne) (n : ℕ) :
    rankOneFrobeniusMonoid (p := p) (Multiplicative.ofAdd n) = Multiplicative.ofAdd (p * n) ∧
    D.α (rankOneFrobeniusMonoid (p := p) (Multiplicative.ofAdd n)) =
      D.delta.frob (PowerSeries.X ^ n) := by
  sorry

/-- Unit test `DeltaLogRing.frobeniusMonoid_trivial` (degenerate). -/
example (δ : DeltaStructure p A) (hlog : IsLogRing (trivialLog δ).α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (u : Aˣ) :
    (((trivialLog δ).frobeniusMonoid hlog hp u : Aˣ) : A) = δ.frob u := by
  sorry

/-- General supporting lemma: if `δ_log(m) ≠ 0`, `α(m)` and
`p` are nonzerodivisors, then `φ_M(m) ≠ m^p`. -/
theorem frobeniusMonoid_ne_pow (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (m : M) (hm : D.deltaLog m ≠ 0)
    (hα : D.α m ∈ nonZeroDivisors A) (hp' : (p : A) ∈ nonZeroDivisors A) :
    D.frobeniusMonoid hlog hp m ≠ m ^ p := by
  sorry

/-! ### Extension to the group completion (node `PR.8/delta-log-groupification`) -/

/-- **Theorem (PR.8/delta-log-groupification), part (1).** For integral `M` and `p` in the
Jacobson radical, `δ_log` extends uniquely to `M^gp` satisfying the cocycle identity. -/
theorem exists_unique_deltaLog_gp [IsCancelMul M] (D : DeltaLogRing p A M)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    ∃! d : Algebra.GrothendieckGroup M → A,
      (∀ m, d (Algebra.GrothendieckGroup.of m) = D.deltaLog m) ∧
        ∀ x y, d (x * y) = d x + d y + (p : A) * d x * d y := by
  sorry

end DeltaLogRing

/-! ### Exactification, monoid part (node `PR.8/delta-log-exactification`) -/

/-- The monoid `M′ = (h^gp)⁻¹(N) ⊂ M^gp` of the exactification of `h : M →* N` (owned as monoid
algebra by CR.5; recorded here to state the compatibility test). -/
noncomputable def exactificationMonoid {M N : Type*} [CommMonoid M] [CommMonoid N] (h : M →* N) :
    Submonoid (Algebra.GrothendieckGroup M) :=
  (MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := N))).comap
    (Algebra.GrothendieckGroup.lift ((Algebra.GrothendieckGroup.of (M := N)).comp h))

/-- Unit test `DeltaLogTriple.exactification_compat_monoid` (compatibility): the monoid is
exactly the inverse image of `N` under `h^gp`, not merely a monoid containing `M`. -/
example {M N : Type*} [CommMonoid M] [CommMonoid N] (h : M →* N)
    (x : Algebra.GrothendieckGroup M) :
    x ∈ exactificationMonoid h ↔
      Algebra.GrothendieckGroup.lift ((Algebra.GrothendieckGroup.of (M := N)).comp h) x ∈
        MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := N)) := by
  sorry

/-! ## B. Prelog prisms: the carrier (node `PR.8/prelog-prism`) -/

/-- A δ_log-triple `(A, I, M)`: a δ_log-ring with an ideal. A prelog prism is a δ_log-triple whose
underlying δ-pair is a prism (PR.0); the full conditions are included in `PrelogPrism` below. -/
structure DeltaLogTriple (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] extends DeltaLogRing p A M where
  ideal : Ideal A

/-- Node `PR.8/prelog-prism`: a delta-log triple with all three actual prism axioms.
This is not merely the earlier ideal-equipped delta-log carrier. -/
structure PrelogPrism (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] extends DeltaLogTriple p A M where
  invertible : Module.Invertible A ideal
  complete : IsDerivedComplete (Ideal.span {(p : A)} ⊔ ideal)
    ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A))
  p_mem : (p : A) ∈ ideal ⊔ ideal.map delta.frobenius

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- API `PrelogPrism.toPrism`: the actual underlying prism. -/
def toPrism (P : PrelogPrism p A M) : PrismFixture p A :=
  ⟨P.delta, P.ideal, P.invertible, P.complete, P.p_mem⟩

/-- A delta-log structure over a supplied prism, with matching delta, gives a prelog prism. -/
def overPrism (P : PrismFixture p A) (D : DeltaLogRing p A M) (hδ : D.delta = P.delta) :
    PrelogPrism p A M where
  toDeltaLogTriple := ⟨D, P.ideal⟩
  invertible := P.invertible
  complete := P.complete
  p_mem := by simpa only [hδ] using P.p_mem

/-- API `PrelogPrism.IsBounded`: bounded p-power torsion in A/I. -/
def IsBounded (P : PrelogPrism p A M) : Prop :=
  ∃ n : ℕ, ∀ x : A ⧸ P.ideal,
    (∃ k : ℕ, (p : A ⧸ P.ideal) ^ k * x = 0) → (p : A ⧸ P.ideal) ^ n * x = 0

/-- API `PrelogPrism.IsRankOne`: vanishing delta-log. -/
def IsRankOne (P : PrelogPrism p A M) : Prop := P.toDeltaLogRing.IsRankOne

/-- API `PrelogPrism.Hom`: both delta-log compatibility and prism-ideal compatibility. -/
structure Hom {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (P : PrelogPrism p A M) (Q : PrelogPrism p B N) extends
      DeltaLogRing.Hom P.toDeltaLogRing Q.toDeltaLogRing where
  map_ideal : P.ideal.map ring ≤ Q.ideal

/-- Test fixture for the trivial chart, preserving the actual prism axioms. -/
def trivialMonoid (P : PrismFixture p A) : PrelogPrism p A PUnit := by
  sorry

/-- Unit test `PrelogPrism.trivial_monoid`: no additional delta-log choice on the trivial chart. -/
example (P : PrismFixture p A) : (trivialMonoid P).toPrism = P ∧
    (trivialMonoid P).IsRankOne ∧
    ∀ Q : PrelogPrism p A PUnit, Q.toPrism = P → Q = trivialMonoid P := by
  sorry

/-- PR.0's crystalline-prism fixture over Z_p, with the identity Frobenius. -/
noncomputable def padicCrystalline : PrismFixture p ℤ_[p] := by
  sorry

theorem padicCrystalline_ideal : (padicCrystalline (p := p)).ideal =
    Ideal.span {(p : ℤ_[p])} := by
  sorry

theorem padicCrystalline_frobenius (a : ℤ_[p]) :
    (padicCrystalline (p := p)).delta.frob a = a := by
  sorry

/-- The zero-valued N chart is rank one for every prism. -/
noncomputable def zeroLog (P : PrismFixture p A) : PrelogPrism p A (Multiplicative ℕ) := by
  sorry

theorem zeroLog_alpha (P : PrismFixture p A) (n : ℕ) :
    (zeroLog P).α (Multiplicative.ofAdd n) = (0 : A) ^ n := by
  sorry

theorem zeroLog_forget (P : PrismFixture p A) : (zeroLog P).toPrism = P := by
  sorry

/-- Unit test `PrelogPrism.zero_log`: boundedness, rank one and the actual zero chart. -/
example : (zeroLog (padicCrystalline (p := p))).IsBounded ∧
    (zeroLog (padicCrystalline (p := p))).IsRankOne ∧
    (zeroLog (padicCrystalline (p := p))).α (Multiplicative.ofAdd 1) = 0 := by
  sorry

/-- Unit test `PrelogPrism.not_delta_pair`: even with rank-one X, the prism p-membership
axiom fails for the ideal (X). No omitted completeness hypothesis can make this a prism. -/
example (d : DeltaStructure p (Polynomial ℤ_[p])) (hX : d.delta Polynomial.X = 0) :
    ¬ ∃ P : PrelogPrism p (Polynomial ℤ_[p]) (Multiplicative ℕ),
      P.delta = d ∧ P.ideal = Ideal.span {Polynomial.X} ∧
        P.α (Multiplicative.ofAdd 1) = Polynomial.X := by
  sorry

end PrelogPrism

/-! ## B. Perfect log prisms (node `PR.8/perfect-log-prism`) -/

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- API `LogPrism.IsPerfect` (on a prelog prism whose `(A, M)` is a
log ring): `M` integral and the Frobenius `(φ_A, φ_M)` bijective. The three prism axioms and boundedness are required. -/
def IsPerfect (T : PrelogPrism p A M) (hlog : DeltaLogRing.IsLogRing T.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : Prop :=
  T.IsBounded ∧ IsCancelMul M ∧ Function.Bijective T.delta.frob ∧
    Function.Bijective (T.toDeltaLogRing.frobeniusMonoid hlog hp)

/-- API `LogPrism.isPerfect_iff_uniquelyDivisible`: for a perfect underlying prism, perfectness
of the ''log prism'' is unique `p`-divisibility of `M_A / A^×` (with `M` integral). -/
theorem isPerfect_iff_uniquelyDivisible (T : PrelogPrism p A M)
    (hlog : DeltaLogRing.IsLogRing T.α) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hb : T.IsBounded) (hA : Function.Bijective T.delta.frob) :
    IsPerfect T hlog hp ↔ IsCancelMul M ∧ Function.Bijective (fun a : Associates M => a ^ p) := by
  sorry

/-- Unit test `LogPrism.trivial_isPerfect_iff`: a genuine prism with its units log structure. -/
example (P : PrismFixture p A)
    (hlog : DeltaLogRing.IsLogRing (DeltaLogRing.trivialLog P.delta).α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hb : (PrelogPrism.overPrism P (DeltaLogRing.trivialLog P.delta) rfl).IsBounded) :
    IsPerfect (PrelogPrism.overPrism P (DeltaLogRing.trivialLog P.delta) rfl) hlog hp ↔
      Function.Bijective P.delta.frob := by
  sorry

end LogPrism

/-! ## B. Perfectoid monoids (node `PR.8/perfectoid-monoid`) -/

namespace Monoid

variable (M : Type*) [CommMonoid M] (p : ℕ)

/-- API `Monoid.tilt`: `M♭ = lim_{m ↦ m^p} M`, Mathlib's perfection of the monoid `M`. -/
abbrev tilt : Type _ := Perfection M p

/-- API `Monoid.IsPerfect`: `M` is uniquely `p`-divisible. -/
def IsPerfect : Prop :=
  Function.Bijective (fun m : M => m ^ p)

/-- API `Monoid.IsPseudoPerfectoid`: `M / Mˣ` is uniquely `p`-divisible. -/
def IsPseudoPerfectoid : Prop :=
  Function.Bijective (fun a : Associates M => a ^ p)

/-- API `Monoid.IsPerfectoid`: `M♭ / (M♭)ˣ → M / Mˣ` is bijective, stated elementwise. -/
def IsPerfectoid : Prop :=
  (∀ m : M, ∃ x : tilt M p, ∃ u : Mˣ, Perfection.coeffMonoidHom M p 0 x = m * u) ∧
    ∀ x y : tilt M p, (∃ u : Mˣ, Perfection.coeffMonoidHom M p 0 x =
      Perfection.coeffMonoidHom M p 0 y * u) → ∃ v : (tilt M p)ˣ, x = y * v

variable {M p}

/-- API `Monoid.IsPerfect.isPerfectoid`. -/
theorem IsPerfect.isPerfectoid (h : IsPerfect M p) : IsPerfectoid M p := by
  sorry

/-- API `Monoid.IsPerfectoid.isPseudoPerfectoid`. -/
theorem IsPerfectoid.isPseudoPerfectoid (h : IsPerfectoid M p) : IsPseudoPerfectoid M p := by
  sorry

/-- Unit test `Monoid.isPerfectoid_units` (degenerate): every commutative group is perfectoid. -/
example (G : Type*) [CommGroup G] : IsPerfectoid G p := by
  sorry

end Monoid

/-! ## I. Kummer-type maps (node `PR.8/kummer-etale-site-log-scheme`) -/

namespace KummerEtale

/-- API `KummerEtale.IsKummerType` (monoid form): injective, and every element has a power in
the image. -/
def IsKummerType {P Q : Type*} [CommMonoid P] [CommMonoid Q] (h : P →* Q) : Prop :=
  Function.Injective h ∧ ∀ a : Q, ∃ n : ℕ, 1 ≤ n ∧ a ^ n ∈ MonoidHom.mrange h

/-- Unit test `KummerEtale.kummerType_nat` (computation): `ℕ → ℕ, 1 ↦ n` is of Kummer type for
`n ≥ 1`; the diagonal `ℕ → ℕ²` is not. -/
example (n : ℕ) (hn : 1 ≤ n) :
    IsKummerType (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) ∧
      ¬ IsKummerType ((MonoidHom.id (Multiplicative ℕ)).prod (MonoidHom.id (Multiplicative ℕ))) := by
  sorry

end KummerEtale


/-! ## Interfaces imported from the ordinary and foundational owners
These declarations are standalone signatures of the named suppliers, not additional packet
nodes. They are unimplemented. A type-valued supplier fixture records an object interface;
no unknown condition is introduced as an arbitrary proposition. The reader gives the full
hypotheses omitted from a signature when its supplier cannot yet express them.
-/
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

abbrev Prism := PrismFixture
namespace PrismFixture
variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
abbrev I (P : PrismFixture p A) := P.ideal
abbrev δ (P : PrismFixture p A) := P.delta
noncomputable abbrev φ (P : PrismFixture p A) := P.delta.frobenius
abbrev bar (P : PrismFixture p A) := A ⧸ P.ideal
def IsBounded (P : PrismFixture p A) : Prop :=
  ∃ n : ℕ, ∀ x : P.bar, (∃ k : ℕ, (p : P.bar)^k * x = 0) → (p : P.bar)^n * x = 0
def IsPerfect (P : PrismFixture p A) : Prop := Function.Bijective P.φ
def IsCrystalline (P : PrismFixture p A) : Prop := P.ideal = Ideal.span {(p : A)}
def IsOrientable (P : PrismFixture p A) : Prop := ∃ d : A, P.ideal = Ideal.span {d}
end PrismFixture
noncomputable abbrev frob {p : ℕ} [Fact p.Prime] {A : Type*} [CommRing A]
  (d : DeltaStructure p A) := d.frob
abbrev NatInvP (p : ℕ) :=
  Multiplicative (AddSubmonoid.closure (Set.range fun k : ℕ => ((p : ℚ) ^ k)⁻¹))

def IsDeltaHom (p : ℕ) [Fact p.Prime] {A B : Type*} [CommRing A] [CommRing B]
  (d : DeltaStructure p A) (e : DeltaStructure p B) (f : A →+* B) : Prop :=
  ∀ a, f (d.delta a) = e.delta (f a)
namespace DeltaLogTriple
structure Hom {p : ℕ} [Fact p.Prime] {A B M N : Type*} [CommRing A] [CommRing B]
  [CommMonoid M] [CommMonoid N] (T : DeltaLogTriple p A M) (U : DeltaLogTriple p B N) where
  toHom : DeltaLogRing.Hom T.toDeltaLogRing U.toDeltaLogRing
  map_ideal : T.ideal.map toHom.ring ≤ U.ideal
end DeltaLogTriple
namespace PrelogPrism
variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
noncomputable def trivialLog (P : PrismFixture p A) : PrelogPrism p A Aˣ :=
  overPrism P (DeltaLogRing.trivialLog P.delta) rfl
end PrelogPrism
namespace DeltaLogRing
noncomputable def frobeniusMonoidOfRankOne {p : ℕ} [Fact p.Prime]
  {A M : Type*} [CommRing A] [CommMonoid M] (D : DeltaLogRing p A M)
  (_h : D.IsRankOne) : M →* M := powMonoidHom p
/-- CR.5's associated-log monoid (the pushout of M and Aˣ along α⁻¹(Aˣ)). -/
def AssocLogMonoid {A M : Type*} [CommRing A] [CommMonoid M] (_α : M →* A) : Type _ := sorry
noncomputable instance {A M : Type*} [CommRing A] [CommMonoid M] (α : M →* A) :
  CommMonoid (AssocLogMonoid α) := sorry
end DeltaLogRing

noncomputable def prismaticCohomology {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
  (P : PrismFixture p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
  DerivedCategory (ModuleCat.{u} A) := sorry
noncomputable def hodgeTateCohomology {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
  (P : PrismFixture p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
  DerivedCategory (ModuleCat.{u} R) := sorry
noncomputable def frobeniusPushforward {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
  (P : PrismFixture p A) :
  DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) := sorry
noncomputable def prismaticFrobenius {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
  (P : PrismFixture p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
  prismaticCohomology P R ⟶ (frobeniusPushforward P).obj (prismaticCohomology P R) := sorry
/-! ### The completed free non-rank-one example
The completion ring is Mathlib's p-adic completion of the actual polynomial free model.
Logification is CR.5's units pushout; the tests compute on its image of x, and do not assume
non-rank-oneness of an arbitrary input.
-/
namespace DeltaLogRing
variable {p : ℕ} [Fact p.Prime]
abbrev CompletedFree := AdicCompletion
  (Ideal.span {(p : FreeOneGenerator p)}) (FreeOneGenerator p)
noncomputable def completedFree : DeltaLogRing p (CompletedFree (p := p)) (Multiplicative ℕ) := sorry
noncomputable def completedFree.inclusion : Hom (freeOneGenerator (p := p)) (completedFree (p := p)) := sorry
theorem completedFree.inclusion_ring : (completedFree.inclusion (p := p)).ring =
    algebraMap (FreeOneGenerator p) (CompletedFree (p := p)) := by
  sorry
theorem completedFree.inclusion_monoid : (completedFree.inclusion (p := p)).monoid =
    MonoidHom.id (Multiplicative ℕ) := by
  sorry
/-- The logification construction imported from CR.5, with delta-log extension K1 Prop. 2.14. -/
noncomputable def associatedLog {A M : Type u} [CommRing A] [CommMonoid M]
    (D : DeltaLogRing p A M) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    DeltaLogRing p A (AssocLogMonoid D.α) := sorry
noncomputable def associatedLog.map {A M : Type u} [CommRing A] [CommMonoid M]
    (D : DeltaLogRing p A M) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    Hom D (associatedLog D hp) := sorry
theorem associatedLog.map_ring {A M : Type u} [CommRing A] [CommMonoid M]
    (D : DeltaLogRing p A M) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    (associatedLog.map D hp).ring = RingHom.id A := by
  sorry
theorem associatedLog_isLogRing {A M : Type u} [CommRing A] [CommMonoid M]
    (D : DeltaLogRing p A M) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsLogRing (associatedLog D hp).α := by
  sorry
theorem completedFree_p_jacobson : (p : CompletedFree (p := p)) ∈
    Ideal.jacobson (⊥ : Ideal (CompletedFree (p := p))) := by
  sorry
noncomputable def completedFreeLog := associatedLog (completedFree (p := p)) completedFree_p_jacobson
noncomputable def completedFreeLog.x : AssocLogMonoid (completedFree (p := p)).α :=
  (associatedLog.map (completedFree (p := p)) completedFree_p_jacobson).monoid (Multiplicative.ofAdd 1)
theorem completedFreeLog_isLogRing : IsLogRing (completedFreeLog (p := p)).α := by
  sorry
/-- Unit test `DeltaLogRing.frobeniusMonoid_not_pow`: the concrete completed free log ring. -/
example :
    (completedFreeLog (p := p)).α
      ((completedFreeLog (p := p)).frobeniusMonoid completedFreeLog_isLogRing
        completedFree_p_jacobson (completedFreeLog.x (p := p))) =
      algebraMap (FreeOneGenerator p) (CompletedFree (p := p)) freeX ^ p *
        (1 + (p : CompletedFree (p := p)) *
          algebraMap (FreeOneGenerator p) (CompletedFree (p := p)) (freeY 0)) ∧
    (completedFreeLog (p := p)).frobeniusMonoid completedFreeLog_isLogRing
      completedFree_p_jacobson (completedFreeLog.x (p := p)) ≠ (completedFreeLog.x (p := p)) ^ p := by
  sorry
end DeltaLogRing

namespace PrelogPrism
variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
/-- **Node `PR.8/standard-log-prisms`** (construction): The standard prelog prisms.

The following are bounded prelog prisms: (1) for a bounded prism (A, I), the trivial log structure
(A, I, O^×), and separately the rank-1 zero chart (A, I, N → A, 1 ↦ 0); (2) for a perfect prism (A,
I) = (W(R♭), ker θ) with R perfectoid, (W(R♭), ker θ, R♭) with the Teichmüller prelog structure, of
rank 1, and for R♭ a domain (A_inf, (ξ), O_C♭∖{0}); (3) the crystalline prelog prism (W(k), (p), N →
W(k), 1 ↦ 0) of rank 1 (Hyodo–Kato base); (4) for K/W(k)[1/p] totally ramified with uniformiser π
and Eisenstein polynomial E(u), the Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → W(k)[[u]], n ↦
u^n) with δ_log = 0 and φ(u) = u^p. These are related by the maps of prelog prisms W(k)[[u]] → W(k)
(u ↦ 0, identity on N) and W(k)[[u]] → A_inf (u ↦ [π♭], 1 ↦ [π♭]).

Hypotheses (packet): k a perfect field of characteristic p; O_K totally ramified over W(k) with
uniformiser π; C the completed algebraic closure; π♭ a compatible system of p-power roots.

API `PrelogPrism.breuilKisin` (constructor; node `PR.8/standard-log-prisms`): The Breuil–Kisin
prelog prism (W(k)[[u]], (E(u)), N → u^n) of rank 1.

Lean form: on a PR.0 prism `P` on `W(k)⟦u⟧` (Mathlib `PowerSeries (WittVector p k)`) with `I = (E)`
and `φ(u) = u ^ p` (PR.0's `Prism.breuilKisin`, outside the PR.0 excerpt, is such a prism), the
prelog structure `n ↦ uⁿ` with `δ_log = 0`. -/
noncomputable def breuilKisin (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) :
    PrelogPrism p (PowerSeries (WittVector p k)) (Multiplicative ℕ) := by
  sorry

theorem breuilKisin_isRankOne (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) : (breuilKisin k E P hI hφ).IsRankOne :=
  by sorry

/-- API `PrelogPrism.ainf` (constructor; node `PR.8/standard-log-prisms`): The prelog prism (A_inf,
ker θ, O_C♭∖{0}) with Teichmüller prelog structure, of rank 1.

Lean form: on a PR.0 prism on `A_inf(O) = W(O♭)` (Mathlib `WittVector p (PreTilt O p)`) with `I =
ker θ` (Mathlib `WittVector.fontaineTheta`) and `φ` the Witt vector Frobenius, the Teichmüller
prelog structure on the nonzerodivisors of `O♭` (for `O♭` a domain, `O♭ ∖ {0}`). -/
noncomputable def ainf (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (P : Prism p (WittVector p (PreTilt O p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta O p)) (hφ : P.φ = WittVector.frobenius) :
    PrelogPrism p (WittVector p (PreTilt O p)) (nonZeroDivisors (PreTilt O p)) := by
  sorry

/-- API `PrelogPrism.crystallineZeroLog` (constructor; node `PR.8/standard-log-prisms`): The prelog
prism (W(k), (p), N → W(k), 1 ↦ 0). -/
noncomputable def crystallineZeroLog (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    PrelogPrism p (WittVector p k) (Multiplicative ℕ) :=
  zeroLog Q

/-- API `PrelogPrism.breuilKisinToCrystalline` (functoriality; node `PR.8/standard-log-prisms`): The
map of prelog prisms u ↦ 0 from the Breuil–Kisin prelog prism to (W(k), (p), N). -/
noncomputable def breuilKisinToCrystalline (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    Hom (breuilKisin k E P hI hφ) (crystallineZeroLog k Q hQ) := sorry

/-- The map `u ↦ 0` underlying `breuilKisinToCrystalline`: the constant coefficient, identity on
the monoid. -/
theorem breuilKisinToCrystalline_spec (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    (breuilKisinToCrystalline k E hEis P hI hφ Q hQ).toHom.ring =
        PowerSeries.constantCoeff (R := WittVector p k) ∧
      (breuilKisinToCrystalline k E hEis P hI hφ Q hQ).toHom.monoid = MonoidHom.id _ := by
  sorry

/-- API `PrelogPrism.breuilKisinToAinf` (functoriality; node `PR.8/standard-log-prisms`): The map of
prelog prisms u ↦ [π♭] to (A_inf, ker θ, O_C♭∖{0}), with N → O_C♭∖{0}, 1 ↦ π♭.

Lean form: a δ-ring map `f : W(k)⟦u⟧ → A_inf` with `f(u) = [π♭]` carrying `(E)` into `ker θ` is
upgraded to a map of prelog prisms with monoid map `n ↦ (π♭)ⁿ`; the existence of `f` (from `k → O♭`
and the choice of `π♭`) is the AI.0 input. -/
noncomputable def breuilKisinToAinf (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
    (Q : Prism p (WittVector p (PreTilt O p)))
    (hQI : Q.I = RingHom.ker (WittVector.fontaineTheta O p)) (hQφ : Q.φ = WittVector.frobenius)
    (πb : nonZeroDivisors (PreTilt O p))
    (f : PowerSeries (WittVector p k) →+* WittVector p (PreTilt O p))
    (hf : IsDeltaHom p P.δ Q.δ f)
    (hfX : f PowerSeries.X = WittVector.teichmuller p (πb : PreTilt O p))
    (hfI : P.I.map f ≤ Q.I) :
    Hom (breuilKisin k E P hI hφ) (ainf O Q hQI hQφ) := by
  sorry

/-- Unit test `PrelogPrism.breuilKisin_frobenius` (computation; node `PR.8/standard-log-prisms`): In
the Breuil–Kisin prelog prism φ(u) = u^p and δ_log(1) = 0, so φ_M is multiplication by p on N. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) (n : ℕ) :
    frob (breuilKisin k E P hI hφ).toDeltaLogRing.delta PowerSeries.X = PowerSeries.X ^ p ∧
      (breuilKisin k E P hI hφ).deltaLog (Multiplicative.ofAdd 1) = 0 ∧
      (breuilKisin k E P hI hφ).toDeltaLogRing.frobeniusMonoidOfRankOne
          (breuilKisin_isRankOne k E P hI hφ) (Multiplicative.ofAdd n) =
        Multiplicative.ofAdd (p * n) := by
  sorry

/-- Unit test `PrelogPrism.breuilKisin_mod_u` (compatibility; node `PR.8/standard-log-prisms`):
Reducing the Breuil–Kisin prelog prism along u ↦ 0 gives (W(k), (p), N → 0) since E(0) = p·unit.

Lean form: reduction along `u ↦ 0` (the constant coefficient) carries `I = (E)` onto `(p)` because
`E` is Eisenstein, so `breuilKisinToCrystalline` lands in the crystalline prelog prism. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hE : E.Monic)
    (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))}) :
    P.I.map (PowerSeries.constantCoeff (R := WittVector p k)) =
      Ideal.span {(p : WittVector p k)} := by
  sorry

/-- Unit test `PrelogPrism.ainf_rankOne` (characterisation; node `PR.8/standard-log-prisms`): In
(A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0 for all x, so δ_log = 0 is forced (Lemma 2.1 of K1). -/
example (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (P : Prism p (WittVector p (PreTilt O p)))
    (hφ : P.φ = WittVector.frobenius) :
    (∀ x : PreTilt O p, P.δ.delta (WittVector.teichmuller p x) = 0) ∧
      ∀ D : DeltaLogRing p (WittVector p (PreTilt O p)) (nonZeroDivisors (PreTilt O p)),
        D.delta = P.δ →
        D.α = (WittVector.teichmuller p).comp (nonZeroDivisors (PreTilt O p)).subtype →
        D.IsRankOne := by
  sorry

/-- Unit test `PrelogPrism.breuilKisin_not_frobenius_u_plus_p` (non-example; node
`PR.8/standard-log-prisms`): With the Frobenius φ(u) = u^p + p on W(k)[[u]], (W(k)[[u]], (E), N → u)
is not a δ_log-ring of rank 1, and no δ_log exists since u^p does not divide δ(u) = 1. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (δ : DeltaStructure p (PowerSeries (WittVector p k)))
    (hδ : frob δ PowerSeries.X = PowerSeries.X ^ p + (p : PowerSeries (WittVector p k))) :
    ¬ ∃ D : DeltaLogRing p (PowerSeries (WittVector p k)) (Multiplicative ℕ),
      D.delta = δ ∧ D.α = powersHom _ PowerSeries.X := by
  sorry

end PrelogPrism


/-- Exact surjection of prelog rings, stated on characteristic monoids (CR.5). -/
def IsExactSurjection {B C P N : Type*} [CommRing B] [CommRing C] [CommMonoid P]
  [CommMonoid N] (f : B →+* C) (g : P →* N) : Prop :=
  Function.Surjective f ∧ (∀ n : N, ∃ x : P, ∃ u : Nˣ, g x = n * u) ∧
    ∀ x y : P, (∃ u : Nˣ, g x = g y * u) → ∃ v : Pˣ, x = y * v

/-! ## Node `PR.8/log-prism` (definition): Log prisms -/

/-- **Node `PR.8/log-prism`** (definition): Log prisms.

Let (A, I, M) be a bounded prelog prism. Then Spf(A) (with the (p, I)-adic topology; A is
classically (p, I)-complete) carries the associated log structure M^a_{Spf(A)} with its
δ_log-structure (Corollary 2.15). A log prism is a triple (A, I, M_{Spf(A)}) of a bounded prism (A,
I) and a log structure on Spf(A) with a δ_log-structure arising from some bounded prelog prism; (A,
I, M)^a denotes the associated log prism. A map of log prisms is a map of log formal schemes
inducing a map of prisms and preserving δ_log. Conversely (A, I, Γ(Spf(A), M_{Spf(A)})) is a prelog
prism. A map of bounded prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M_{Spf(B)})) induces a unique
map of log prisms (A, I, M_A)^a → (B, J, M_{Spf(B)}). In the convention of Koshikawa–Yao, a ''log
prism'' (in quotation marks) is a bounded prelog prism whose (A, M_A) is a log ring; for (A, M_A) a
log ring with A classically p-complete the δ_log-structure induces the Frobenius lift φ(m) = m^p(1 +
pδ_log(m)).

Hypotheses (packet): Bounded prelog prism; A classically (p, I)-complete (BS Lemma 3.7).

Placeholder carrier (node `PR.8/log-prism`; log structures on the formal scheme `Spf(A)` are
`CrystallineCohomology:CR.5:log-algebra` objects): log prisms with underlying ring `A`. -/
def LogPrism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] : Type (u + 1) := sorry

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The underlying bounded prism of a log prism. -/
noncomputable def toPrism (L : LogPrism p A) : Prism p A := sorry

/-- Placeholder carrier (CR.5): the monoid `Γ(Spf(A), M_{Spf(A)})` of global sections of the log
structure. -/
def Sections (L : LogPrism p A) : Type u := sorry

noncomputable instance (L : LogPrism p A) : CommMonoid L.Sections := sorry

/-- Placeholder carrier (CR.5): maps of log prisms (maps of log formal schemes inducing maps of
prisms and preserving δ_log). -/
def Hom {B : Type u} [CommRing B] (L : LogPrism p A) (L' : LogPrism p B) : Type u := sorry

/-- API `LogPrism.ofPrelog` (constructor; node `PR.8/log-prism`): The associated log prism (A, I,
M)^a of a bounded prelog prism. -/
noncomputable def ofPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) : LogPrism p A := sorry

/-- API `LogPrism.globalSections` (projection; node `PR.8/log-prism`): The prelog prism (A, I,
Γ(Spf(A), M_{Spf(A)})). -/
noncomputable def globalSections (L : LogPrism p A) : PrelogPrism p A L.Sections := sorry

theorem globalSections_toPrism (L : LogPrism p A) : L.globalSections.toPrism = L.toPrism := by
  sorry

theorem ofPrelog_toPrism {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) : (ofPrelog P hb).toPrism = P.toPrism := by
  sorry

/-- API `LogPrism.homOfPrelog` (universal-property; node `PR.8/log-prism`): Maps of prelog prisms
(A, I, M_A) → (B, J, Γ(Spf(B), M)) correspond bijectively to maps of log prisms (A, I, M_A)^a → (B,
J, M). -/
noncomputable def homOfPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) {B : Type u} [CommRing B] (L' : LogPrism p B) :
    PrelogPrism.Hom P L'.globalSections ≃ Hom (ofPrelog P hb) L' := sorry

/-- API `LogPrism.frobenius` (structure; node `PR.8/log-prism`): For a log prism the Frobenius lift
(φ_A, φ_M) of the log formal scheme Spf(A) (from delta-log-frobenius).

Lean form: the monoid part `φ_M` on global sections; the ring part is the prism's `φ`, and
`frobenius_alpha` is their compatibility. -/
noncomputable def frobenius (L : LogPrism p A) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    L.Sections →* L.Sections := sorry

theorem frobenius_alpha (L : LogPrism p A) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (s : L.Sections) :
    L.globalSections.α (L.frobenius hp s) = L.toPrism.φ (L.globalSections.α s) := by
  sorry


/-- API `LogPrism.trivial` (example; node `PR.8/log-prism`): Any bounded prism with the trivial log
structure O^×. -/
noncomputable def trivial (P : Prism p A) (hb : P.IsBounded) : LogPrism p A :=
  ofPrelog (PrelogPrism.trivialLog P) hb

/-- Unit test `LogPrism.trivial_frobenius` (degenerate; node `PR.8/log-prism`): For the trivial log
structure the Frobenius of the log prism is φ_A. -/
example (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    ∃ e : (trivial P hb).Sections ≃* Aˣ, ∀ s, (e ((trivial P hb).frobenius hp s) : A) = P.φ (e s) := by
  sorry

/-- Unit test `LogPrism.bk_associated` (computation; node `PR.8/log-prism`): The associated log
structure of (W(k)[[u]], (E(u)), N → u^n) on Spf(W(k)[[u]]) has characteristic monoid M/O^× ≅ N, generated by u. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (hb : (PrelogPrism.breuilKisin k E P hI hφ).IsBounded) :
    ∃ e : Associates (ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb).Sections ≃*
        Multiplicative ℕ,
      ∀ s, e (Associates.mk s) = Multiplicative.ofAdd 1 →
        Associated ((ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb).globalSections.α s)
          PowerSeries.X := by
  sorry


/-- Unit test `LogPrism.forget_compat` (compatibility; node `PR.8/log-prism`): Forgetting the log
structure sends log prisms to PR.0's bounded prisms, and the trivial log prism functor is a section.
-/
example (L : LogPrism p A) (P : Prism p A) (hb : P.IsBounded) :
    L.toPrism.IsBounded ∧ (trivial P hb).toPrism = P := by
  sorry

end LogPrism


/-! ## Node `PR.8/prelog-prismatic-envelope` (construction): Prelog prismatic envelopes -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The input of a prelog prismatic envelope over an orientable prelog prism `P` with integral
`M_A`: a δ_log-triple `(B, J, M_B)` over `P` and a surjection of prelog rings
`(B, M_B) → (B / J, N)` with `M_B`, `N` integral. -/
structure EnvelopeDatum (P : PrelogPrism p A M) where
  /-- The ring `B`. -/
  B : Type u
  [commRing : CommRing B]
  /-- The monoid `M_B`. -/
  MB : Type u
  [commMonoid : CommMonoid MB]
  /-- The δ_log-triple `(B, J, M_B)`. -/
  T : DeltaLogTriple p B MB
  /-- The structure map over `(A, I, M_A)`. -/
  structureMap : DeltaLogTriple.Hom P.toDeltaLogTriple T
  /-- The monoid `N`. -/
  N : Type u
  [commMonoidN : CommMonoid N]
  /-- The prelog structure of `B / J`. -/
  αN : N →* B ⧸ T.ideal
  /-- The surjection `M_B → N`. -/
  h : MB →* N
  comm : ∀ m, αN (h m) = Ideal.Quotient.mk T.ideal (T.α m)
  surj : Function.Surjective h
  orientable : P.toPrism.IsOrientable
  integral_A : IsCancelMul M
  integral_B : IsCancelMul MB
  integral_N : IsCancelMul N

attribute [instance] EnvelopeDatum.commRing EnvelopeDatum.commMonoid EnvelopeDatum.commMonoidN

/-- Placeholder carrier (node `PR.8/prelog-prismatic-envelope`): the ring `B′` of the prelog
prismatic envelope. -/
def EnvelopeRing {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type u := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    CommRing (EnvelopeRing E) := sorry

/-- Placeholder carrier (node `PR.8/prelog-prismatic-envelope`): the monoid `M_{B′}`. -/
def EnvelopeMonoid {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type u := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    CommMonoid (EnvelopeMonoid E) := sorry

/-- **Node `PR.8/prelog-prismatic-envelope`** (construction): Prelog prismatic envelopes.

Fix an orientable prelog prism (A, I, M_A) with M_A integral. Let (B, J, M_B) be a δ_log-triple over
(A, I, M_A) and (B, M_B) → (B/J, N) a surjection of prelog rings with M_B, N integral. There is a
universal map (B, J, M_B) → (B′, IB′, M_{B′}) of δ_log-triples over (A, I, M_A) to a prelog prism
with an exact surjection (B′, M_{B′}) → (B′/IB′, N); moreover M_{B′} is integral. It is called the
prelog prismatic envelope.

Hypotheses (packet): (A, I) orientable; M_A, M_B, N integral; (B, M_B) → (B/J, N) surjective.

API `PrelogPrism.envelope` (constructor; node `PR.8/prelog-prismatic-envelope`): The prelog
prismatic envelope (B′, IB′, M_{B′}) of (B, J, M_B) → (B/J, N) over (A, I, M_A). -/
noncomputable def envelope {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    PrelogPrism p (EnvelopeRing E) (EnvelopeMonoid E) := sorry

/-- The universal map `(B, J, M_B) → (B′, IB′, M_{B′})` of δ_log-triples. -/
noncomputable def envelope.map {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    DeltaLogTriple.Hom E.T (envelope E).toDeltaLogTriple := sorry

/-- The monoid map `M_{B′} → N` of the exact surjection `(B′, M_{B′}) → (B′ / IB′, N)`. -/
noncomputable def envelope.toN {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    EnvelopeMonoid E →* E.N := sorry

theorem envelope_ideal {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    (envelope E).toPrism.I = P.toPrism.I.map ((envelope.map E).toHom.ring.comp E.structureMap.toHom.ring) := by
  sorry

/-- API `PrelogPrism.envelope.lift` (universal-property; node `PR.8/prelog-prismatic-envelope`):
Maps of δ_log-triples from (B, J, M_B) to a prelog prism (C, IC, M_C) over (A, I, M_A) with an exact
surjection (C, M_C) → (C/IC, N) compatible with (B/J, N) factor uniquely through the envelope. -/
theorem envelope.lift {P : PrelogPrism p A M} (E : EnvelopeDatum P) {C : Type u} {MC : Type u}
    [CommRing C] [CommMonoid MC] (Q : PrelogPrism p C MC)
    (g : DeltaLogTriple.Hom P.toDeltaLogTriple Q.toDeltaLogTriple)
    (hQI : Q.toPrism.I = P.toPrism.I.map g.toHom.ring)
    (f : DeltaLogTriple.Hom E.T Q.toDeltaLogTriple)
    (hfg : f.toHom.ring.comp E.structureMap.toHom.ring = g.toHom.ring) (r : MC →* E.N)
    (hex : IsExactSurjection (Ideal.Quotient.mk Q.toPrism.I) r)
    (hr : ∀ m, r (f.toHom.monoid m) = E.h m) :
    ∃! F : Hom (envelope E) Q,
      F.toHom.ring.comp (envelope.map E).toHom.ring = f.toHom.ring ∧
        F.toHom.monoid.comp (envelope.map E).toHom.monoid = f.toHom.monoid := by
  sorry

/-- API `PrelogPrism.envelope.exactSurjective` (characterisation; node
`PR.8/prelog-prismatic-envelope`): (B′, M_{B′}) → (B′/IB′, N) is exact surjective. -/
theorem envelope.exactSurjective {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    IsExactSurjection (Ideal.Quotient.mk (envelope E).toPrism.I) (envelope.toN E) := by
  sorry

/-- API `PrelogPrism.envelope.monoid_integral` (other; node `PR.8/prelog-prismatic-envelope`):
M_{B′} is integral. -/
theorem envelope.monoid_integral {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    IsCancelMul (EnvelopeMonoid E) := by
  sorry

/-- API `PrelogPrism.envelope_of_exact` (compatibility; node `PR.8/prelog-prismatic-envelope`): For
an exact surjection the envelope is PR.0's prismatic envelope of (B, J) with the monoid M_B
unchanged.

Lean form: the monoid part (`M_{B′} = M_B`, via the universal map). The ring part ("PR.0's prismatic
envelope of `(B, J)`") refers to PR.0's `Prismatic.Envelope`, which is outside the PR.0 excerpt this
file is checked against. -/
theorem envelope_of_exact {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hex : IsExactSurjection (Ideal.Quotient.mk E.T.ideal) E.h) :
    Function.Bijective (envelope.map E).toHom.monoid := by
  sorry

/-- The envelope datum `(A, I, M_A) → (A / I, M_A)` of a prelog prism itself. -/
noncomputable def EnvelopeDatum.self (P : PrelogPrism p A M) (ho : P.toPrism.IsOrientable)
    (hM : IsCancelMul M) : EnvelopeDatum P := sorry

/-- Unit test `PrelogPrism.envelope_identity` (degenerate; node `PR.8/prelog-prismatic-envelope`):
The envelope of (A, I, M_A) → (A/I, M_A) itself is (A, I, M_A). -/
example (P : PrelogPrism p A M) (ho : P.toPrism.IsOrientable)
    (hM : IsCancelMul M) :
    Function.Bijective (envelope.map (EnvelopeDatum.self P ho hM)).toHom.ring ∧
      Function.Bijective (envelope.map (EnvelopeDatum.self P ho hM)).toHom.monoid := by
  sorry


end PrelogPrism

/-! ## Node `PR.8/log-prismatic-envelope` (theorem): Universal property of log prismatic envelopes -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder category (node `PR.8/log-prismatic-envelope`, with CR.5 exact closed immersions
of log formal schemes): commutative squares whose top arrow is an exact closed immersion
`(Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)})` for log prisms with integral log structure over
`(Spf(B/J), N^a) → (Spf(B), M_B^a)`. -/
def LogEnvelopeSquares {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type (u + 1) := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    Category.{u} (LogEnvelopeSquares E) := sorry

/-- The square of the associated log prism `(B′, IB′, M_{B′})^a` of a bounded envelope. -/
noncomputable def envelopeSquare {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hb : (envelope E).IsBounded) : LogEnvelopeSquares E := sorry

/-- **Node `PR.8/log-prismatic-envelope`** (theorem): Universal property of log prismatic envelopes.

In the situation of the prelog prismatic envelope, assume (B′, IB′, M_{B′}) is bounded. Then (B′,
IB′, M_{B′})^a with the exact closed immersion (Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′}) is final
among commutative squares with top arrow an exact closed immersion (Spf(C/IC), N^a) ↪ (Spf(C),
M_{Spf(C)}) for log prisms (C, IC, M_{Spf(C)}) with integral log structure over (Spf(B/J), N^a) →
(Spf(B), M^a_B). Key lemma: for such a log prism, with N^a_{C/I} := Γ(Spf(C/IC), N^a), the map (C,
Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I}) is exact surjective and a (1 + IC)-torsor on monoids.

Hypotheses (packet): (A, I, M_A) orientable with integral M_A; the prelog prismatic envelope is
bounded.

Lean form of the finality; the key lemma (exactness and the `(1 + IC)`-torsor) is about sections of
CR.5 log structures and is not typed. -/
theorem envelopeSquare_isTerminal {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hb : (envelope E).IsBounded) : Nonempty (Limits.IsTerminal (envelopeSquare E hb)) := by
  sorry

end PrelogPrism

/-! ## Node `PR.8/envelope-flatness-smooth` (theorem): Flatness of prelog prismatic envelopes for smooth log algebras -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`, Koshikawa smoothness):
envelope data as in node `PR.8/envelope-flatness-smooth` (1) or (2) — a surjection onto a
`p`-completely smooth prelog ring over `(A / I, M_A)` satisfying the chart hypotheses (∗) and weak
finite generation, from the `(p, I)`-completed free δ_log-ring, resp. from a smooth δ_log-ring
with a smooth chart. -/
def SmoothEnvelopeDatum (P : PrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying envelope datum. -/
noncomputable def SmoothEnvelopeDatum.toEnvelopeDatum {P : PrelogPrism p A M}
    (S : SmoothEnvelopeDatum P) : EnvelopeDatum P := sorry

/-- **Node `PR.8/envelope-flatness-smooth`** (theorem): Flatness of prelog prismatic envelopes for
smooth log algebras.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. (1) Let (B_0, M_B) be a prelog ring over
(A, M_A) with M_B integral and (B_0, M_B) → (B_0/J, N) a surjection onto a p-completely smooth
prelog ring over (A/I, M_A) (smooth in Koshikawa's Appendix A sense). Assume M_A → N is integral, N
is weakly finitely generated over M_A, and (∗): M_A → M_B is injective and integral, M_B^gp/M_A^gp
is free abelian, and B_0 is (p, I)-completely free over the completion of A ⊗_{Z_(p)[M_A]}
Z_(p)[M_B]. Let (B, M_B) be the (p, I)-completed free δ_log-ring over (A, M_A) generated by (B_0,
M_B). Then the prelog prismatic envelope (B′, IB′, M_{B′}) of (B, (JB)^∧, M_B) exists, is (p,
I)-completely flat over A (hence bounded), and its formation commutes with base change on (A, I,
M_A) and with (p, I)-completely flat base change on B_0. (2) Variant: if (B, M_B) is a (p,
I)-completely smooth δ_log-ring over (A, M_A) with M_A → M_B a smooth chart, (B, M_B) → (R, P) a
surjection onto a p-completely smooth prelog ring over (A/I, M_A) with M_A → P integral, then the
prelog prismatic envelope exists, is (p, I)-completely flat over A and commutes with base change on
(A, I, M_A).

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; smoothness in the sense of Koshikawa
Appendix A (CR.5); hypotheses (∗) and weak finite generation in (1).

Lean form: boundedness of the envelope. `(p, I)`-complete flatness over `A` and the base-change
assertions are not typed: Mathlib has no notion of completely flat modules. -/
theorem SmoothEnvelopeDatum.envelope_isBounded {P : PrelogPrism p A M} (hb : P.IsBounded)
    (S : SmoothEnvelopeDatum P) : (envelope S.toEnvelopeDatum).IsBounded := by
  sorry

end PrelogPrism

/-- Placeholder carrier (owner `PerfectoidQuotients:Q0:integral-algebra`): perfectoid rings in
the sense of BMS1 (PR.0's convention), as a type of bundled rings. -/
def PerfectoidRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace PerfectoidRing

variable {p : ℕ} [Fact p.Prime]

/-- The underlying ring. -/
def carrier (R : PerfectoidRing.{u} p) : Type u := sorry

noncomputable instance (R : PerfectoidRing.{u} p) : CommRing R.carrier := sorry

instance (R : PerfectoidRing.{u} p) : Fact ¬IsUnit (p : R.carrier) := sorry

instance (R : PerfectoidRing.{u} p) : IsAdicComplete (Ideal.span {(p : R.carrier)}) R.carrier :=
  sorry

end PerfectoidRing

namespace PrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- API `PrelogRing.tilt` (constructor; node `PR.8/perfectoid-monoid`): For a perfectoid pre-log
ring (R, M), the pre-log ring (R♭, M♭, α♭).

Lean form: `α♭ : M♭ → R♭`, `(m_0, m_1, …) ↦ (α(m_0), α(m_1), …)` read in `R♭ = PreTilt R p` through
the multiplicative identification `tilt_compat_pretilt`; defined for every `p`-adically complete
`R`. -/
noncomputable def tilt {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R) :
    Monoid.tilt M p →* PreTilt R p := sorry

theorem tilt_untilt {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R)
    (x : Monoid.tilt M p) : (tilt α x).untilt = α (Perfection.coeffMonoidHom M p 0 x) := by
  sorry

/-- API `PrelogRing.ainf` (constructor; node `PR.8/perfectoid-monoid`): A_inf(R) = (W(R♭), M♭ →
W(R♭), m ↦ [α♭(m)]). -/
noncomputable def ainf {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R) :
    Monoid.tilt M p →* WittVector p (PreTilt R p) :=
  (WittVector.teichmuller p).comp (tilt α)

end PrelogRing

namespace PerfectoidLogRing

variable {p : ℕ} [Fact p.Prime]

/-- API `PerfectoidLogRing.iff_pseudoPerfectoid` (characterisation; node `PR.8/perfectoid-monoid`):
For an integral log ring (R, M) with R perfectoid, M is perfectoid iff M/M^× is uniquely
p-divisible. -/
theorem iff_pseudoPerfectoid (R : PerfectoidRing.{u} p) {M : Type u} [CommMonoid M]
    [IsCancelMul M] (α : M →* R.carrier) (hlog : DeltaLogRing.IsLogRing α) :
    Monoid.IsPerfectoid M p ↔ Monoid.IsPseudoPerfectoid M p := by
  sorry

end PerfectoidLogRing

/-! ## Node `PR.8/perfect-log-prism` (definition): Perfect log prisms -/

/-- A ''log prism'' in the convention of Koshikawa–Yao: a bounded prelog prism whose `(A, M_A)` is
a log ring. The membership of `p` in the Jacobson radical is the consequence of completeness used
for the monoid Frobenius (recorded explicitly, PR.0 convention). -/
structure LogPrismKY (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (M : Type v)
    [CommMonoid M] extends PrelogPrism p A M where
  bounded : toPrelogPrism.IsBounded
  isLogRing : DeltaLogRing.IsLogRing toDeltaLogRing.α
  p_mem_jacobson : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)

namespace LogPrismKY

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The ''log prism'' of a bounded prelog prism, with its associated log structure. -/
noncomputable def ofPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    LogPrismKY p A (DeltaLogRing.AssocLogMonoid P.α) := sorry

/-- The ''log prism'' with the trivial log structure `Aˣ`. -/
noncomputable def trivial (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : LogPrismKY p A Aˣ where
  toPrelogPrism := PrelogPrism.trivialLog P
  bounded := hb
  isLogRing := by sorry
  p_mem_jacobson := hp

end LogPrismKY

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type v} [CommMonoid M]

/-- **Node `PR.8/perfect-log-prism`** (definition): Perfect log prisms.

A ''log prism'' (A, I, M_A) (bounded prelog prism with (A, M_A) a log ring) is perfect if M_A is
integral and its Frobenius (φ_A, φ_{M_A}) is an isomorphism. If (A, I) is perfect, (A, I, M_A) is
perfect iff M_A/A^× is uniquely p-divisible; a perfect ''log prism'' has p-saturated monoid. Every
integral ''log prism'' has a perfection (A_perf, IA_perf, M_{A,perf}): the colimit perfection of A
with the log structure associated to colim_φ M_A → A_perf. For a perfectoid integral pre-log ring
(R, M), (A_inf(R), ker θ, M♭)^a is perfect and of rank 1.

Hypotheses (packet): Integral monoid; (A, M_A) a log ring; boundedness as for log prisms.

API `LogPrism.IsPerfectKY` (other; node `PR.8/perfect-log-prism`): M_A integral and (φ_A, φ_{M_A})
bijective.

Lean form: on PR.0's prism, perfectness of the ring Frobenius is `Prism.IsPerfectKY`; the monoid
Frobenius is `DeltaLogRing.frobeniusMonoid`. -/
def IsPerfectKY (L : LogPrismKY p A M) : Prop :=
  IsCancelMul M ∧ L.toPrism.IsPerfect ∧
    Function.Bijective (L.toDeltaLogRing.frobeniusMonoid L.isLogRing L.p_mem_jacobson)

/-- API `LogPrism.isPerfect_iff_uniquelyDivisible` (characterisation; node
`PR.8/perfect-log-prism`): For perfect (A, I): perfect iff M_A/A^× is uniquely p-divisible. -/
theorem isPerfectKY_iff_uniquelyDivisible (L : LogPrismKY p A M) (hA : L.toPrism.IsPerfect) :
    IsPerfectKY L ↔ IsCancelMul M ∧ Function.Bijective (fun a : Associates M => a ^ p) := by
  sorry

/-- API `LogPrism.IsPerfectKY.pSaturated` (relation; node `PR.8/perfect-log-prism`): A perfect ''log
prism'' has p-saturated monoid. -/
theorem IsPerfectKY.pSaturated {L : LogPrismKY p A M} (h : IsPerfectKY L)
    (x : Algebra.GrothendieckGroup M)
    (hx : x ^ p ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M))) :
    x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M)) := by
  sorry

/-- Placeholder carrier (node `PR.8/perfect-log-prism`): the ring `A_perf` (colimit perfection). -/
def PerfectionRing (L : LogPrismKY p A M) : Type u := sorry

noncomputable instance (L : LogPrismKY p A M) : CommRing (PerfectionRing L) := sorry

/-- Placeholder carrier (node `PR.8/perfect-log-prism`): the log monoid `M_{A,perf}`
associated with `colim_φ M_A → A_perf`. -/
def PerfectionMonoid (L : LogPrismKY p A M) : Type (max u v) := sorry

noncomputable instance (L : LogPrismKY p A M) : CommMonoid (PerfectionMonoid L) := sorry

/-- API `LogPrism.perfection` (constructor; node `PR.8/perfect-log-prism`): The perfection (A_perf,
IA_perf, M_{A,perf}) of an integral ''log prism''. -/
noncomputable def perfection (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    LogPrismKY p (PerfectionRing L) (PerfectionMonoid L) := sorry

/-- The map `(A, I, M_A) → (A_perf, IA_perf, M_{A,perf})`. -/
noncomputable def perfection.map (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    PrelogPrism.Hom L.toPrelogPrism (perfection L hM).toPrelogPrism := sorry

theorem perfection_isPerfect (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    IsPerfectKY (perfection L hM) := by
  sorry

/-- API `LogPrism.perfection.lift` (universal-property; node `PR.8/perfect-log-prism`): Maps from an
integral ''log prism'' to a perfect one factor uniquely through its perfection. -/
theorem perfection.lift (L : LogPrismKY p A M) (hM : IsCancelMul M) {B : Type u} [CommRing B]
    {N : Type v} [CommMonoid N] (L' : LogPrismKY p B N) (hL' : IsPerfectKY L')
    (f : PrelogPrism.Hom L.toPrelogPrism L'.toPrelogPrism) :
    ∃! g : PrelogPrism.Hom (perfection L hM).toPrelogPrism L'.toPrelogPrism,
      g.toHom.ring.comp (perfection.map L hM).toHom.ring = f.toHom.ring ∧
        g.toHom.monoid.comp (perfection.map L hM).toHom.monoid = f.toHom.monoid := by
  sorry

/-- API `LogPrism.ainfPerfect` (example; node `PR.8/perfect-log-prism`): (A_inf(R), ker θ, M♭)^a is
perfect of rank 1 for a perfectoid integral pre-log ring (R, M).

Lean form: for a perfectoid ring `R` (placeholder `PerfectoidRing`, Q0) with integral perfectoid
prelog structure, the prelog prism `(A_inf(R), ker θ, M♭)` on a PR.0 prism with `I = ker θ` and Witt
Frobenius is of rank one and its associated ''log prism'' is perfect. -/
theorem ainfPerfect (R : PerfectoidRing.{u} p) {N : Type u} [CommMonoid N] [IsCancelMul N]
    (αR : N →* R.carrier) (hN : Monoid.IsPerfectoid N p)
    (P : Prism p (WittVector p (PreTilt R.carrier p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta R.carrier p))
    (hφ : P.φ = WittVector.frobenius)
    (D : DeltaLogRing p (WittVector p (PreTilt R.carrier p)) (Monoid.tilt N p))
    (hD : D.delta = P.δ) (hDα : D.α = PrelogRing.ainf αR)
    (hb : (PrelogPrism.overPrism P D hD).IsBounded)
    (hp : (p : WittVector p (PreTilt R.carrier p)) ∈ Ideal.jacobson ⊥) :
    D.IsRankOne ∧ IsPerfectKY (LogPrismKY.ofPrelog (PrelogPrism.overPrism P D hD) hb hp) := by
  sorry

/-- Unit test `LogPrism.ainf_isPerfect` (computation; node `PR.8/perfect-log-prism`): (A_inf, (ξ),
O_C♭∖{0})^a is a perfect log prism. -/
example (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDomain (PreTilt O p)]
    (P : Prism p (WittVector p (PreTilt O p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta O p)) (hφ : P.φ = WittVector.frobenius)
    (hb : (PrelogPrism.ainf O P hI hφ).IsBounded)
    (hp : (p : WittVector p (PreTilt O p)) ∈ Ideal.jacobson ⊥) :
    IsPerfectKY (LogPrismKY.ofPrelog (PrelogPrism.ainf O P hI hφ) hb hp) := by
  sorry

/-- Unit test `LogPrism.trivial_isPerfect_iff` (degenerate; node `PR.8/perfect-log-prism`): With the
trivial log structure, a log prism is perfect iff the underlying prism is perfect. -/
example (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsPerfectKY (LogPrismKY.trivial P hb hp) ↔ P.IsPerfect := by
  sorry

/-- Unit test `LogPrism.breuilKisin_not_perfect` (non-example; node `PR.8/perfect-log-prism`): The
Breuil–Kisin log prism (W(k)[[u]], (E), N) is not perfect: u is not a p-th power and φ is not
surjective. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (hb : (PrelogPrism.breuilKisin k E P hI hφ).IsBounded)
    (hp : (p : PowerSeries (WittVector p k)) ∈ Ideal.jacobson ⊥) :
    ¬ IsPerfectKY (LogPrismKY.ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb hp) ∧
      ¬ Function.Surjective P.φ := by
  sorry

/-- Unit test `LogPrism.zeroLog_perfect` (characterisation; node `PR.8/perfect-log-prism`): (W(k),
(p), N → 0)^a is not perfect (N is not p-divisible), while its perfection has monoid N[1/p] modulo
units. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline)
    (hb : (PrelogPrism.crystallineZeroLog k Q hQ).IsBounded)
    (hp : (p : WittVector p k) ∈ Ideal.jacobson ⊥) :
    ¬ IsPerfectKY (LogPrismKY.ofPrelog (PrelogPrism.crystallineZeroLog k Q hQ) hb hp) ∧
      Nonempty (Associates (PerfectionMonoid
        (LogPrismKY.ofPrelog (PrelogPrism.crystallineZeroLog k Q hQ) hb hp)) ≃* NatInvP p) := by
  sorry

end LogPrism

/-! ## Node `PR.8/perfect-log-prisms-perfectoid` (theorem): Perfect log prisms are perfectoid log rings -/

/-- Placeholder category (node `PR.8/perfect-log-prisms-perfectoid`): perfect ''log prisms''
(bundled `LogPrismKY` with `LogPrism.IsPerfect`) and their maps. -/
def PerfectLogPrismCat (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (PerfectLogPrismCat.{u} p) := sorry

/-- Placeholder category (owners `PerfectoidQuotients:Q0` and `CrystallineCohomology:CR.5`):
perfectoid log rings (integral log rings `(R, M)` with `R` perfectoid and `M / Mˣ` uniquely
`p`-divisible). -/
def PerfectoidLogRingCat (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (PerfectoidLogRingCat.{u} p) := sorry

/-- The functor `(A, I, M_A) ↦ (A / I, M_A)^a`. -/
noncomputable def PerfectLogPrismCat.reduction (p : ℕ) [Fact p.Prime] :
    PerfectLogPrismCat.{u} p ⥤ PerfectoidLogRingCat.{u} p := sorry

/-- The functor `(R, M) ↦ (A_inf(R), ker θ, M♭)^a`. -/
noncomputable def PerfectoidLogRingCat.ainf (p : ℕ) [Fact p.Prime] :
    PerfectoidLogRingCat.{u} p ⥤ PerfectLogPrismCat.{u} p := sorry

/-- **Node `PR.8/perfect-log-prisms-perfectoid`** (theorem): Perfect log prisms are perfectoid log
rings.

The functor (A, I, M_A) ↦ (A/I, M_A)^a is an equivalence from perfect ''log prisms'' to perfectoid
log rings, with quasi-inverse (R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a. In
particular every perfect ''log prism'' admits a chart N → A of rank 1. Moreover, for a perfectoid
integral pre-log ring (R, M) and an integral ''log prism'' (A, I, M_A), every map (R, M) → (A/I,
M_A)^a of pre-log rings lifts uniquely to a map of pre-log prisms (A_inf(R), ker θ, M♭) → (A, I,
M_A); so (A_inf(R), ker θ, M♭)^a is initial among integral ''log prisms'' under (R, M) (also with
exact-surjection or associated-log variants).

Hypotheses (packet): Perfect ''log prisms'' are integral and bounded; the lifting statement assumes
(A, I, M_A) bounded and integral.

Lean form: the equivalence with its quasi-inverse; the rank-one chart and the lifting statement for
integral ''log prisms'' are not typed (they quantify over CR.5 maps of pre-log rings into associated
log rings). -/
theorem PerfectLogPrismCat.reduction_isEquivalence (p : ℕ) [Fact p.Prime] :
    (PerfectLogPrismCat.reduction.{u} p).IsEquivalence ∧
      Nonempty (PerfectoidLogRingCat.ainf.{u} p ⋙ PerfectLogPrismCat.reduction.{u} p ≅
        𝟭 (PerfectoidLogRingCat.{u} p)) := by
  sorry

/-! ## Node `PR.8/perfectoid-prelog-cotangent` (lemma): Log cotangent complexes of perfectoid pre-log rings -/

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): Gabber's log cotangent complex
`L_{(S, N)/(R, M)}` of a map of prelog rings, in `D(S)`. -/
noncomputable def logCotangent {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    {M N : Type u} [CommMonoid M] [CommMonoid N] (αM : M →* R) (αN : N →* S) (h : M →* N) :
    DerivedCategory (ModuleCat.{u} S) := sorry

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.1`): derived `J`-adic completion on `D(S)`. -/
noncomputable def derivedCompletion {S : Type u} [CommRing S] (J : Ideal S) :
    DerivedCategory (ModuleCat.{u} S) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- **Node `PR.8/perfectoid-prelog-cotangent`** (lemma): Log cotangent complexes of perfectoid
pre-log rings.

Let (R, M) be a perfectoid (or pseudo-perfectoid) pre-log ring and Z_p the trivial pre-log ring.
Then the natural map L̂_{R/Z_p} → L̂_{(R,M)/Z_p} of p-completed (Gabber) log cotangent complexes is
an isomorphism; equivalently L̂_{(R,M)/R} = 0; in particular L̂_{(R,M)/Z_p}[−1]{−1} ≅ R. For a map
f: (R, M) → (S, N) of perfectoid pre-log rings, L̂_{(S,N)/(R,M)} = 0.

Hypotheses (packet): Perfectoid or pseudo-perfectoid pre-log rings; p-completed Gabber log cotangent
complex as supplied by DD.6.

Lean form: `L̂_{(R, M)/R} = 0` (the base `R` with the trivial prelog structure `{e}`), for `R`
perfectoid (placeholder `PerfectoidRing`) and `M` perfectoid or pseudo-perfectoid; the
identification `L̂_{(R,M)/ℤ_p}[−1]{−1} ≅ R` and the relative statement for maps are not typed. -/
theorem perfectoid_logCotangent_zero {p : ℕ} [Fact p.Prime] (R : PerfectoidRing.{u} p) {M : Type u}
    [CommMonoid M] (α : M →* R.carrier)
    (hM : Monoid.IsPerfectoid M p ∨ Monoid.IsPseudoPerfectoid M p) :
    Limits.IsZero ((derivedCompletion (Ideal.span {(p : R.carrier)})).obj
      (logCotangent (R := R.carrier) (S := R.carrier) (1 : PUnit.{u + 1} →* R.carrier) α 1)) := by
  sorry


/-! ## The relative theory: base, prelog algebras and shared placeholders -/

/-- The base of the relative theory (standing hypothesis of K1 §§4–7 and KY): a bounded prelog
prism whose monoid `M_A` is integral (cancellative). A bounded prism is classically
`(p, I)`-adically complete (BS22 Lemma 3.7(1), recalled in node `PR.8/log-prism`); since PR.0's
`Prism` does not record derived completeness, this consequence is the field `complete`. -/
structure IntegralBoundedPrelogPrism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    (M : Type u) [CommMonoid M] extends PrelogPrism p A M where
  bounded : toPrelogPrism.IsBounded
  integral : IsCancelMul M
  classicallyComplete : IsAdicComplete (Ideal.span {(p : A)} ⊔ toPrelogPrism.toPrism.I) A

/-- `S⟨X⟩`: the `p`-adic completion of the polynomial ring `S[X]` (Mathlib `AdicCompletion`). -/
abbrev ConvergentPoly (p : ℕ) (S : Type u) [CommRing S] : Type u :=
  AdicCompletion (Ideal.span {(p : Polynomial S)}) (Polynomial S)

/-- Placeholder (left derived functor of extension of scalars, owner
`EnhancedDerivedSheaves`; Mathlib has no derived tensor product): `− ⊗^L_R S` on `D(R)`. -/
noncomputable def derivedExtendScalars {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- The unit `X → X^∧_J` of derived completion (owner `DerivedDeRhamCohomology:DD.1`). -/
noncomputable def derivedCompletionUnit {S : Type u} [CommRing S] (J : Ideal S) :
    𝟭 (DerivedCategory (ModuleCat.{u} S)) ⟶ derivedCompletion J := sorry

/-- `X ↦ (X ⊗^L_R S)^∧_J`, completed derived extension of scalars: PR.0's
`TauCeti.Prismatic.completedBaseChange`, which is `derivedExtendScalars f` followed by
`derivedCompletion J`. -/
noncomputable abbrev completedExtendScalars {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (J : Ideal S) : DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) :=
  derivedExtendScalars f ⋙ derivedCompletion J

namespace IntegralBoundedPrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- `Ā = A / I`. -/
abbrev bar (P : IntegralBoundedPrelogPrism p A M) : Type u := P.toPrism.bar

/-- The prelog structure `M_A → Ā`. -/
noncomputable def barα (P : IntegralBoundedPrelogPrism p A M) : M →* P.bar :=
  (Ideal.Quotient.mk P.toPrism.I).toMonoidHom.comp P.α

/-- The `(p, I)`-adic ideal of `A`. -/
def pI (P : IntegralBoundedPrelogPrism p A M) : Ideal A :=
  Ideal.span {(p : A)} ⊔ P.toPrism.I

/-- Maps of bases: maps of prelog prisms `(A, I, M_A) → (A′, IA′, M_{A′})` with `I A′ = I′`. -/
structure BaseHom {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    (P : IntegralBoundedPrelogPrism p A M) (P' : IntegralBoundedPrelogPrism p A' M') where
  /-- The map of prelog prisms. -/
  toHom : PrelogPrism.Hom P.toPrelogPrism P'.toPrelogPrism
  ideal_eq : P'.toPrism.I = P.toPrism.I.map toHom.toHom.ring

end IntegralBoundedPrelogPrism

/-- An affine prelog algebra `(R, P)` over `(Ā, M_A)`: an `Ā`-algebra `R`, a prelog structure
`α : P → R` (the chart monoid is called `Q` here, since `P` names the base) and a monoid map
`M_A → Q` compatible with the prelog structures. -/
structure PrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) where
  /-- The ring `R`. -/
  R : Type u
  [commRing : CommRing R]
  [algebra : Algebra P.bar R]
  /-- The chart monoid. -/
  Q : Type u
  [commMonoid : CommMonoid Q]
  /-- The prelog structure. -/
  α : Q →* R
  /-- The monoid map `M_A → Q`. -/
  structureMap : M →* Q
  comm : ∀ m, α (structureMap m) = algebraMap P.bar R (P.barα m)

attribute [instance] PrelogAlgebra.commRing PrelogAlgebra.algebra PrelogAlgebra.commMonoid

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The base `(Ā, M_A)` itself (`X = Spf(A / I)` with the log structure from `M_A`). -/
noncomputable def base (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := P.bar
  Q := M
  α := P.barα
  structureMap := MonoidHom.id M
  comm _ := rfl

/-- The log affine line `(Ā⟨X⟩, M_A ⊕ ℕ)`, `(m, n) ↦ α(m) Xⁿ`. -/
noncomputable def logAffineLine (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := ConvergentPoly p P.bar
  Q := M × Multiplicative ℕ
  α := ((algebraMap P.bar (ConvergentPoly p P.bar)).toMonoidHom.comp P.barα).coprod
    (powersHom _ (algebraMap (Polynomial P.bar) (ConvergentPoly p P.bar) Polynomial.X))
  structureMap := MonoidHom.inl M (Multiplicative ℕ)
  comm _ := by sorry

/-- The prelog algebra `(R, M_A)` with the log structure pulled back from the base. -/
noncomputable def strict (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] : PrelogAlgebra P where
  R := R
  Q := M
  α := (algebraMap P.bar R).toMonoidHom.comp P.barα
  structureMap := MonoidHom.id M
  comm _ := rfl

/-- The `X`-coordinate of the log affine line, as an element of its chart monoid. -/
def logAffineLine.X (P : IntegralBoundedPrelogPrism p A M) : (logAffineLine P).Q :=
  ((1 : M), Multiplicative.ofAdd 1)

end PrelogAlgebra

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`, Koshikawa Appendix A):
`p`-completely smooth prelog algebras `(R, P)` over `(Ā, M_A)` with an integral chart that is
integral and weakly finitely generated over `M_A`. -/
def SmoothPrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): qcqs log `p`-adic formal
schemes `(X, M_X)` smooth over `(Spf Ā, M_A)^a` in Koshikawa's sense (integral log structure).
Global statements of this file are made for these. -/
def SmoothLogFormalScheme {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

namespace SmoothLogFormalScheme

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance : Category.{u} (SmoothLogFormalScheme P) := sorry

/-- `Spf` of a smooth affine prelog algebra with its associated log structure. -/
noncomputable def spf (X : SmoothPrelogAlgebra P) : SmoothLogFormalScheme P := sorry

/-- Placeholder (formal-scheme foundations, `SchemeAndStackFoundations`): the small étale site
`X_ét` of the underlying formal scheme. -/
def Etale (X : SmoothLogFormalScheme P) : Type (u + 1) := sorry

noncomputable instance (X : SmoothLogFormalScheme P) : Category.{u} X.Etale := sorry

/-- The étale topology on `X_ét`. -/
noncomputable def etaleTopology (X : SmoothLogFormalScheme P) : GrothendieckTopology X.Etale :=
  sorry

/-- Placeholder (owner `EnhancedDerivedSheaves`): `D(X_ét, Λ)`. -/
def EtaleDerived (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] : Type (u + 1) := sorry

noncomputable instance (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] :
    Category.{u} (X.EtaleDerived Λ) := sorry

/-- `RΓ(X_ét, −) : D(X_ét, Λ) → D(Λ)`. -/
noncomputable def globalSections (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] :
    X.EtaleDerived Λ ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Base change of `(X, M_X)` along a map of bases (fibre product of integral log formal
schemes; smooth over the new base). -/
noncomputable def baseChange {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    {P' : IntegralBoundedPrelogPrism p A' M'} (X : SmoothLogFormalScheme P)
    (f : IntegralBoundedPrelogPrism.BaseHom P P') : SmoothLogFormalScheme P' := sorry

end SmoothLogFormalScheme

namespace SmoothPrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The underlying prelog algebra. -/
noncomputable def toPrelogAlgebra (X : SmoothPrelogAlgebra P) : PrelogAlgebra P := sorry

/-- The base `(Ā, M_A)` is smooth over itself. -/
noncomputable def base (P : IntegralBoundedPrelogPrism p A M) : SmoothPrelogAlgebra P := sorry

theorem base_toPrelogAlgebra (P : IntegralBoundedPrelogPrism p A M) :
    (base P).toPrelogAlgebra = PrelogAlgebra.base P := by
  sorry

/-- The log affine line is smooth. -/
noncomputable def logAffineLine (P : IntegralBoundedPrelogPrism p A M) : SmoothPrelogAlgebra P :=
  sorry

theorem logAffineLine_toPrelogAlgebra (P : IntegralBoundedPrelogPrism p A M) :
    (logAffineLine P).toPrelogAlgebra = PrelogAlgebra.logAffineLine P := by
  sorry

end SmoothPrelogAlgebra

/-! ## Node `PR.8/log-prismatic-site` (definition): The relative log prismatic site -/

/-- **Node `PR.8/log-prismatic-site`** (definition): The relative log prismatic site.

Fix a bounded prelog prism (A, I, M_A) with M_A integral and a log (p, I)-adic formal scheme (X,
M_X) smooth over (A/I, M_A) in Koshikawa's sense (so M_X is integral). The log prismatic site ((X,
M_X)/(A, M_A))_Δ is the opposite of the category of triples consisting of: a log prism (B, IB,
M_{Spf(B)}) = (B, IB, M_B)^a with integral log structure and a map of log prisms (A, I, M_A)^a → (B,
IB, M_{Spf(B)}); a map of formal schemes f: Spf(B/IB) → X over A/I; and an exact closed immersion of
log formal schemes (Spf(B/IB), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A). A morphism is an étale
cover if B → C is (p, I)-completely étale and faithfully flat and (Spf(C), M) → (Spf(B), M) is
strict étale. The structure sheaves are O_Δ: B ↦ B and Ō_Δ: B ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. The
site depends only on (Spf(A), M_A)^a and (X, M_X), not on the chart M_A → A.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the
sense of Koshikawa Appendix A (CR.5). Étale topology; the (p, I)-completely faithfully flat topology
gives the same cohomology (Remark 4.3).

API `LogPrismaticSite` (constructor; node `PR.8/log-prismatic-site`): The site ((X, M_X)/(A, M_A))_Δ
with the étale topology.

Placeholder carrier (node `PR.8/log-prismatic-site`): the underlying category (opposite of the
category of triples). -/
def LogPrismaticSite {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Type (u + 1) := sorry

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance (X : SmoothLogFormalScheme P) : Category.{u} (LogPrismaticSite P X) :=
  sorry

/-- The étale topology of the log prismatic site (part of API `LogPrismaticSite`). -/
noncomputable def topology (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (LogPrismaticSite P X) := sorry

/-- The `(p, I)`-completely faithfully flat topology. -/
noncomputable def flatTopology (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (LogPrismaticSite P X) := sorry

/-- The ring `B` of an object `(B, IB, M_B)^a`. -/
def objRing {X : SmoothLogFormalScheme P} (U : LogPrismaticSite P X) : Type u := sorry

noncomputable instance {X : SmoothLogFormalScheme P} (U : LogPrismaticSite P X) :
    CommRing (objRing U) := sorry

/-- API `LogPrismaticSite.structureSheaf` (data; node `PR.8/log-prismatic-site`): The sheaf O_Δ: (B,
IB, M) ↦ B, valued in (p, I)-complete A-algebras with δ-structure. -/
noncomputable def structureSheaf (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) CommRingCat.{u} := sorry

/-- API `LogPrismaticSite.reducedStructureSheaf` (data; node `PR.8/log-prismatic-site`): Ō_Δ: (B,
IB, M) ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. -/
noncomputable def reducedStructureSheaf (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) CommRingCat.{u} := sorry


/-- API `LogPrismaticSite.toEtale` (functoriality; node `PR.8/log-prismatic-site`): The morphism of
topoi ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) with (ν_*F)(U) = H^0(((U, M_U)/(A, M_A))_Δ, F).

Lean form: the direct image `ν_*` on sheaves of sets. -/
noncomputable def toEtale (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) (Type u) ⥤ Sheaf X.etaleTopology (Type u) := sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-cohomology` (construction): Log prismatic cohomology complexes -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-cohomology`** (construction): Log prismatic cohomology complexes.

In the setting of the log prismatic site, define Δ_{(X,M_X)/(A,M_A)} := Rν_*O_Δ ∈ D(X_ét, A) and its
reduction Δ̄_{(X,M_X)/(A,M_A)} := Rν_*Ō_Δ ∈ D(X_ét, A/I), commutative algebra objects with Δ̄ ≅ Δ
⊗^L_A A/I, and RΓ_Δ((X, M_X)/(A, M_A)) := RΓ(((X, M_X)/(A, M_A))_Δ, O_Δ), a (p, I)-complete
E_∞-A-algebra with a φ_A-semilinear endomorphism φ induced by the δ-structures. For X = Spf(R) with
an integral chart P → Γ(X, M_X) over M_A that is integral and weakly finitely generated over M_A,
write Δ_{(R,P)/(A,M_A)}; it may be computed with the indiscrete topology and depends only on
(Spf(R), P)^a and (A, I, M_A)^a.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; (X, M_X) smooth over (A/I, M_A).

API `LogPrismaticSite.cohomology` (constructor; node `PR.8/log-prismatic-cohomology`): RΓ_Δ((X,
M_X)/(A, M_A)) as a (p, I)-complete E_∞-A-algebra.

Placeholder (node `PR.8/log-prismatic-cohomology`): `RΓ_Δ((X, M_X)/(A, M_A))` in `D(A)`, like PR.0's
`prismaticCohomology`; the `E_∞`-algebra structure is not recorded. -/
noncomputable def cohomology (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the affine complex `Δ_{(R,P)/(A,M_A)}`
of a prelog algebra (the cohomology of the log prismatic site of `(Spf R^∧_p, P^a)`; for smooth
`(R, P)` it is `cohomology` of `spf`). -/
noncomputable def affineCohomology (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the reduced affine complex
`Δ̄_{(R,P)/(A,M_A)}` as an `R`-linear complex (global sections of `Rν_* Ō_Δ`). -/
noncomputable def reducedAffineCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : PrelogAlgebra P) : DerivedCategory (ModuleCat.{u} X.R) := sorry

/-- For smooth affine `(R, P)` the global and affine complexes agree. -/
theorem cohomology_spf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P) :
    Nonempty (cohomology P (SmoothLogFormalScheme.spf X) ≅ affineCohomology P X.toPrelogAlgebra) := by
  sorry

/-- API `LogPrismaticSite.sheafCohomology` (constructor; node `PR.8/log-prismatic-cohomology`):
Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A). -/
noncomputable def sheafCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : X.EtaleDerived A := sorry

/-- API `LogPrismaticSite.reducedCohomology` (constructor; node `PR.8/log-prismatic-cohomology`):
Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I). -/
noncomputable def reducedCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : X.EtaleDerived P.bar := sorry

/-- `RΓ(X_ét, Δ) = RΓ_Δ`. -/
theorem globalSections_sheafCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) :
    Nonempty ((X.globalSections A).obj (sheafCohomology P X) ≅ cohomology P X) := by
  sorry

/-- API `LogPrismaticSite.reduced_eq_tensor` (characterisation; node
`PR.8/log-prismatic-cohomology`): Δ̄ ≅ Δ ⊗^L_A A/I.

Lean form: on global sections, `RΓ(X_ét, Δ̄) ≅ RΓ_Δ ⊗^L_A A / I`. -/
theorem reduced_eq_tensor (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Nonempty ((X.globalSections P.bar).obj (reducedCohomology P X) ≅
      (derivedExtendScalars (Ideal.Quotient.mk P.toPrism.I)).obj (cohomology P X)) := by
  sorry

/-- API `LogPrismaticSite.frobenius` (structure; node `PR.8/log-prismatic-cohomology`): The
φ_A-semilinear Frobenius φ: Δ → φ_{A,*}Δ. -/
noncomputable def frobenius (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    cohomology P X ⟶ (frobeniusPushforward P.toPrism).obj (cohomology P X) := sorry

/-- API `LogPrismaticSite.cohomology_isComplete` (other; node `PR.8/log-prismatic-cohomology`): RΓ_Δ
is derived (p, I)-complete. -/
theorem cohomology_isComplete (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : IsIso ((derivedCompletionUnit P.pI).app (cohomology P X)) := by
  sorry

/-- API `LogPrismaticSite.cohomology_map` (functoriality; node `PR.8/log-prismatic-cohomology`):
Functoriality in (X, M_X) over (A, M_A) and in maps of bounded prelog prisms.

Lean form: functoriality in `(X, M_X)` over the base; functoriality in maps of bounded prelog prisms
is the base change of node `PR.8/log-prismatic-base-change`. -/
noncomputable def cohomology_map (P : IntegralBoundedPrelogPrism p A M) :
    (SmoothLogFormalScheme P)ᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

theorem cohomology_map_obj (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    (cohomology_map P).obj (Opposite.op X) = cohomology P X := by
  sorry

/-- Unit test `LogPrismaticSite.cohomology_point` (degenerate; node
`PR.8/log-prismatic-cohomology`): For X = Spf(A/I) with log structure from M_A, RΓ_Δ((X, M_X)/(A,
M_A)) ≅ A with φ = φ_A.

Lean form: the isomorphism with `A` in degree `0`; the compatibility `φ = φ_A` is not typed. -/
example (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (cohomology P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-- Unit test `LogPrismaticSite.cohomology_trivialLog` (compatibility; node
`PR.8/log-prismatic-cohomology`): With trivial log structures, Δ_{(X,M_X)/(A,M_A)} ≅ PR.1's Δ_{X/A}.

Lean form: over a base with trivial monoid `{e}` and for `(R, {e})`, the affine log prismatic
complex is PR.0's shared carrier `prismaticCohomology` (PR.1's `Δ_{R/A}`). -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}) (R : Type u)
    [CommRing R] [Algebra P.bar R] :
    Nonempty (affineCohomology P (PrelogAlgebra.strict P R) ≅ prismaticCohomology P.toPrism R) := by
  sorry

/-- Unit test `LogPrismaticSite.reduced_affineLine` (computation; node
`PR.8/log-prismatic-cohomology`): For (A/I⟨X⟩, M_A ⊕ N): H^0(Δ̄) = A/I⟨X⟩ and H^1(Δ̄){1} ≅
A/I⟨X⟩·dlog X, a free module of rank 1 (K1 §5.4).

Lean form: for an orientable base (so that the Breuil–Kisin twist is trivial), `H^0(Δ̄) ≅ R` and
`H^1(Δ̄) ≅ R` (free of rank one on `dlog X`, see `hodge-tate-log-affine-line`). -/
example (P : IntegralBoundedPrelogPrism p A M) (ho : P.toPrism.IsOrientable) :
    Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        (reducedAffineCohomology P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of (PrelogAlgebra.logAffineLine P).R (PrelogAlgebra.logAffineLine P).R) ∧
    Nonempty ((DerivedCategory.homologyFunctor _ 1).obj
        (reducedAffineCohomology P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of (PrelogAlgebra.logAffineLine P).R (PrelogAlgebra.logAffineLine P).R) := by
  sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the map from PR.1's Hodge–Tate cohomology
`Δ̄_{R/A}` (PR.0's shared carrier `hodgeTateCohomology`) to the reduced log complex, induced by
forgetting log structures. -/
noncomputable def forgetLogMap (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    hodgeTateCohomology P.toPrism X.R ⟶ reducedAffineCohomology P X := sorry

/-- Unit test `LogPrismaticSite.cohomology_not_nonlog` (non-example; node
`PR.8/log-prismatic-cohomology`): For the log affine line, H^1(Δ̄){1} is generated by dlog X rather
than dX: the log and non-log cohomologies differ (the map Ω^1 → Ω^1_log is X·, not an isomorphism).
-/
example (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by
  sorry

/-- The object `(A, I, M_A)^a` of the site of `Spf(A / I)` with the log structure from `M_A`. -/
noncomputable def baseObject (P : IntegralBoundedPrelogPrism p A M) :
    LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) := sorry

/-- Unit test `LogPrismaticSite.base_point` (degenerate; node `PR.8/log-prismatic-site`): For X =
Spf(A/I) with the log structure from M_A, (A, I, M_A)^a is a final object. -/
example (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (Limits.IsTerminal (baseObject P)) := by
  sorry

/-- Unit test `LogPrismaticSite.affineLine_object` (computation; node `PR.8/log-prismatic-site`):
For (X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a, the triple (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 and the
identity Spf(A/I⟨X⟩) → X is an object.

Lean form: an object whose ring is `A⟨X⟩`, the `(p, I)`-adic completion of `A[X]`. -/
example (P : IntegralBoundedPrelogPrism p A M) :
    ∃ U : LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.logAffineLine P)),
      Nonempty (objRing U ≃+* AdicCompletion (P.pI.map Polynomial.C) (Polynomial A)) := by
  sorry

/-- Placeholder (node `PR.8/log-prismatic-site`): the cohomology of `O_Δ` for the
`(p, I)`-completely faithfully flat topology `flatTopology`. -/
noncomputable def flatCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : DerivedCategory (ModuleCat.{u} A) := sorry

/-- API `LogPrismaticSite.flat_eq_etale` (compatibility; node `PR.8/log-prismatic-site`): Replacing
étale covers by (p, I)-completely faithfully flat covers does not change the cohomology of O_Δ
(Remark 4.3). -/
theorem flat_eq_etale (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Nonempty (flatCohomology P X ≅ cohomology P X) := by
  sorry


/-- Unit test `LogPrismaticSite.not_strict_open_immersion` (non-example; node
`PR.8/log-prismatic-site`): For the log affine line with trivial base log structure, forgetting logs
sends (A⟨X⟩, I, N)^a to a valid object of the underlying non-log prismatic site. It does not
preserve the Hodge–Tate differential module: the canonical map R·dX → R·dlog X sends dX to X·dlog X
and is not an isomorphism when X is not a unit.

Lean form of the second assertion: on the log affine line the comparison of Hodge–Tate differential
modules (degree one) is not an isomorphism. The first assertion (the object of PR.1's site) is not
typed. -/
example (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/absolute-log-prismatic-site` (definition): The absolute saturated log prismatic site -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): integral log `p`-adic
formal schemes `(X, M_X)`. -/
def IntegralLogFormalScheme (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): bounded fs log `p`-adic
formal schemes. -/
def FsLogFormalScheme (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (FsLogFormalScheme.{u} p) := sorry

/-- **Node `PR.8/absolute-log-prismatic-site`** (definition): The absolute saturated log prismatic
site.

For an integral log p-adic formal scheme (X, M_X), the absolute log prismatic site (X, M_X)_Δ has
objects diagrams (Spf(B), M_{Spf(B)}) ↩ (Spf(B/J), M_{Spf(B/J)}) → (X, M_X) where (B, J, M_{Spf(B)})
is a log prism with M_{Spf(B)} integral, M_{Spf(B/J)} its restriction, and the right map admits an
integral chart étale locally; it carries the flat topology. For a bounded fs log p-adic formal
scheme, the absolute saturated log prismatic site has objects saturated log prisms (A, I, M_A)^a
with a map (Spf(A/I), M_A)^a → (X, M_X) admitting a saturated chart étale locally, with the strict
flat topology. There is a strict variant requiring the right map to be strict, and the relative site
maps to it.

Hypotheses (packet): (X, M_X) integral (resp. bounded fs for the saturated variant).

API `AbsoluteLogPrismaticSite` (constructor; node `PR.8/absolute-log-prismatic-site`): The site (X,
M_X)_Δ with the flat topology (integral variant).

Placeholder carrier (node `PR.8/absolute-log-prismatic-site`): the underlying category of `(X,
M_X)_Δ`. -/
def AbsoluteLogPrismaticSite {p : ℕ} [Fact p.Prime] (X : IntegralLogFormalScheme.{u} p) :
    Type (u + 1) := sorry

namespace AbsoluteLogPrismaticSite

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (X : IntegralLogFormalScheme.{u} p) :
    Category.{u} (AbsoluteLogPrismaticSite X) := sorry

/-- The flat topology of `(X, M_X)_Δ`. -/
noncomputable def flatTopology (X : IntegralLogFormalScheme.{u} p) :
    GrothendieckTopology (AbsoluteLogPrismaticSite X) := sorry

/-- API `AbsoluteLogPrismaticSite.saturated` (constructor; node `PR.8/absolute-log-prismatic-site`):
The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict
flat topology.

Placeholder carrier: the underlying category; its strict flat topology is `saturatedTopology`. -/
def saturated (X : FsLogFormalScheme.{u} p) : Type (u + 1) := sorry

noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (saturated X) := sorry

/-- The strict flat topology of the absolute saturated site. -/
noncomputable def saturatedTopology (X : FsLogFormalScheme.{u} p) :
    GrothendieckTopology (saturated X) := sorry

/-- API `AbsoluteLogPrismaticSite.structureSheaf` (data; node `PR.8/absolute-log-prismatic-site`):
O_Δ: (B, J, M) ↦ B and the ideal sheaf I_Δ: (B, J, M) ↦ J.

Lean form: on the absolute saturated site, `O_Δ` and the ideal sheaf `I_Δ` as a sheaf of
`O_Δ`-ideals is recorded through the quotient `O_Δ / I_Δ` (`reducedStructureSheaf`). -/
noncomputable def structureSheaf (X : FsLogFormalScheme.{u} p) :
    Sheaf (saturatedTopology X) CommRingCat.{u} := sorry

/-- `O_Δ / I_Δ` on the absolute saturated site. -/
noncomputable def reducedStructureSheaf (X : FsLogFormalScheme.{u} p) :
    Sheaf (saturatedTopology X) CommRingCat.{u} := sorry

/-- The underlying integral log formal scheme of a smooth log formal scheme over a base. -/
noncomputable def _root_.TauCeti.LogPrismatic.SmoothLogFormalScheme.toIntegral
    {A : Type u} [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : SmoothLogFormalScheme P) : IntegralLogFormalScheme.{u} p := sorry

/-- API `AbsoluteLogPrismaticSite.ofRelative` (functoriality; node
`PR.8/absolute-log-prismatic-site`): The forgetful functor from the relative site ((X, M_X)/(A,
M_A))_Δ to the strict variant.

Lean form: the forgetful functor to the absolute site of the underlying integral log formal scheme
(it lands in the strict variant). -/
noncomputable def ofRelative {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    LogPrismaticSite P X ⥤ AbsoluteLogPrismaticSite X.toIntegral := sorry


end AbsoluteLogPrismaticSite

/-! ## Node `PR.8/cech-alexander-log` (construction): Čech–Alexander complexes for log prismatic cohomology -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder carrier (node `PR.8/cech-alexander-log`; restricted power series rings are not in
Mathlib): choices of compatible surjections `M_A ⊕ ℕ^T → P` and
`A⟨(X_s)_{s ∈ S}, ℕ^T⟩ → R` for a smooth affine prelog algebra. -/
def CechAlexanderDatum (X : SmoothPrelogAlgebra P) : Type (u + 1) := sorry

/-- **Node `PR.8/cech-alexander-log`** (construction): Čech–Alexander complexes for log prismatic
cohomology.

Let X = Spf(R) be affine with an integral chart P over M_A that is integral and weakly finitely
generated over M_A. Choose a surjection M_B = M_A ⊕ N^T → P and a surjection B_0 := A⟨(X_s)_{s∈S},
N^T⟩ → R compatible with it, and let B := (A{(X_s)}_δ{N^T}_δlog)^∧_(p,I) be the free δ_log-ring. Let
(B_0^•, M_B^•) ↪ (B^•, M_B^•) be the (p, I)-completed Čech nerves over (A, M_A) and J^• := ker(B_0^•
→ R). Applying the flatness theorem for envelopes levelwise gives a cosimplicial prelog prism (C^•,
IC^•, M_C^•) with exact surjections onto (C^•/IC^•, P), each C^n (p, I)-completely flat over A; its
associated cosimplicial object is the Čech nerve of (C^0, IC^0, M_C^0)^a, which covers the final
object of the topos. Hence Δ_{(R,P)/(A,M_A)} is computed by the cosimplicial δ-A-algebra C^•,
compatibly with base change in (A, I, M_A). Taking P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩ gives a
strictly functorial complex C^•((R, P)/(A, M_A), O_Δ). This latter choice does not itself commute
with arbitrary base changes (K1 Remark 4.8); its totalisation computes the same cohomology.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; M_A → P integral and weakly finitely
generated; (R, P) p-completely smooth.

API `LogPrismaticSite.cechAlexander` (constructor; node `PR.8/cech-alexander-log`): The cosimplicial
δ-A-algebra C^• attached to a choice of surjections (B_0, M_B) → (R, P).

Lean form: the cosimplicial `A`-module underlying the cosimplicial δ-`A`-algebra `C^•`. -/
noncomputable def cechAlexander (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    CosimplicialObject (ModuleCat.{u} A) := sorry

/-- `Tot(C^•)` in `D(A)`: the alternating coface complex, extended from `ℕ` to `ℤ`. -/
noncomputable def cechAlexanderTot (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    DerivedCategory (ModuleCat.{u} A) :=
  DerivedCategory.Q.obj
    (((AlgebraicTopology.alternatingCofaceMapComplex (ModuleCat.{u} A)).obj
      (cechAlexander X c)).extend ComplexShape.embeddingUpNat)

/-- API `LogPrismaticSite.cechAlexander_computes` (characterisation; node
`PR.8/cech-alexander-log`): Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)} compatibly with Frobenius.

Lean form: the isomorphism in `D(A)`; compatibility with Frobenius is not typed. -/
theorem cechAlexander_computes (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    Nonempty (cechAlexanderTot X c ≅ affineCohomology P X.toPrelogAlgebra) := by
  sorry


/-- The strictly functorial datum `P = Γ(X, M_X)`, `B_0 = A⟨ℕ^R ⊕ ℕ^P⟩`. -/
noncomputable def CechAlexanderDatum.functorial (X : SmoothPrelogAlgebra P) :
    CechAlexanderDatum X := sorry

/-- API `LogPrismaticSite.cechAlexanderFunctorial` (constructor; node `PR.8/cech-alexander-log`):
The strictly functorial complex for P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩. -/
noncomputable def cechAlexanderFunctorial (X : SmoothPrelogAlgebra P) :
    CosimplicialObject (ModuleCat.{u} A) :=
  cechAlexander X (CechAlexanderDatum.functorial X)

/-- API `LogPrismaticSite.cechAlexander_independent` (extensionality; node
`PR.8/cech-alexander-log`): Two choices of surjections give canonically quasi-isomorphic
totalisations. -/
theorem cechAlexander_independent (X : SmoothPrelogAlgebra P) (c c' : CechAlexanderDatum X) :
    Nonempty (cechAlexanderTot X c ≅ cechAlexanderTot X c') := by
  sorry

/-- The trivial datum for `(R, P) = (Ā, M_A)` (`S = T = ∅`). -/
noncomputable def CechAlexanderDatum.trivial (P : IntegralBoundedPrelogPrism p A M) :
    CechAlexanderDatum (SmoothPrelogAlgebra.base P) := sorry

/-- Unit test `LogPrismaticSite.cechAlexander_trivial` (degenerate; node `PR.8/cech-alexander-log`):
For R = A/I and P = M_A, the constant cosimplicial algebra A computes Δ = A. -/
example (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (cechAlexander (SmoothPrelogAlgebra.base P) (CechAlexanderDatum.trivial P) ≅
      (Functor.const SimplexCategory).obj (ModuleCat.of A A)) := by
  sorry


end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-weak-base-change` (lemma): Affine base change for log prismatic cohomology -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The `p`-completed base change `(R′, P′)` of a prelog algebra along a map of bases. -/
noncomputable def baseChange {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    {P' : IntegralBoundedPrelogPrism p A' M'} (X : PrelogAlgebra P)
    (f : IntegralBoundedPrelogPrism.BaseHom P P') : PrelogAlgebra P' := sorry

end PrelogAlgebra

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-weak-base-change`** (lemma): Affine base change for log prismatic
cohomology.

Let (R, P) be as in the Čech–Alexander construction and (A, I, M_A) → (A′, IA′, M_{A′}) a map of
bounded prelog prisms with M_{A′} integral and A → A′ of finite (p, I)-complete Tor amplitude. With
(R′, P′) the p-completed base change of (R, P) as a prelog ring, the natural map Δ_{(R,P)/(A,M_A)}
⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})} is an isomorphism, and similarly for Δ̄.

Hypotheses (packet): Finite (p, I)-complete Tor amplitude of A → A′; M_{A′} integral.

Lean form: "finite `(p, I)`-complete Tor amplitude" is replaced by the stronger flatness of `A → A′`
(Mathlib `RingHom.Flat`); the statement for `Δ̄` is not typed separately. -/
theorem weakBaseChange (X : SmoothPrelogAlgebra P) {A' : Type u} [CommRing A'] {M' : Type u}
    [CommMonoid M'] (P' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom P P') (hf : f.toHom.ring.Flat) :
    Nonempty ((completedExtendScalars f.toHom.ring P'.pI).obj
        (affineCohomology P X.toPrelogAlgebra) ≅
      affineCohomology P' (X.toPrelogAlgebra.baseChange f)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-etale-localization` (lemma): Strict étale localisation -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The prelog algebra `(S, P)` for an `R`-algebra `S`, with the pulled-back chart. -/
noncomputable def ofAlgebra (X : PrelogAlgebra P) (S : Type u) [CommRing S] [Algebra X.R S] :
    PrelogAlgebra P :=
  letI : Algebra P.bar S := ((algebraMap X.R S).comp (algebraMap P.bar X.R)).toAlgebra
  { R := S
    Q := X.Q
    α := (algebraMap X.R S).toMonoidHom.comp X.α
    structureMap := X.structureMap
    comm := by sorry }

end PrelogAlgebra

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-etale-localization`** (lemma): Strict étale localisation.

Let (A, I, M_A) be a bounded prelog prism with M_A integral, (R, P) a p-completely smooth prelog
ring over (A/I, M_A), and R → S a p-completely étale map with the pulled-back chart P. Then
Δ̄_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ̄_{(S,P)/(A,M_A)} is an isomorphism. Consequently the reduced log
prismatic complex Δ̄ is a quasi-coherent derived p-complete complex on strict-étale localisations.
This R-linear statement concerns Δ̄, not the unreduced Δ, which is naturally an A-complex.

Hypotheses (packet): Bounded base prism with integral M_A; (R, P) p-completely smooth over (A/I,
M_A). R → S p-completely étale; same pulled-back chart P; Δ̄ := Δ ⊗^L_A A/I.

Lean form: "`p`-completely étale" is replaced by the stronger étale (Mathlib `Algebra.Etale`); the
completed base change is `completedExtendScalars` along `R → S`. The quasi-coherence consequence is
not typed. -/
theorem etaleLocalization (X : SmoothPrelogAlgebra P) (S : Type u) [CommRing S]
    [Algebra X.toPrelogAlgebra.R S] [Algebra.Etale X.toPrelogAlgebra.R S] :
    Nonempty ((completedExtendScalars (algebraMap X.toPrelogAlgebra.R S)
          (Ideal.span {(p : S)})).obj (reducedAffineCohomology P X.toPrelogAlgebra) ≅
      reducedAffineCohomology P (X.toPrelogAlgebra.ofAlgebra S)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/smooth-chart-covers` (theorem): Envelopes of smooth charts cover the final object -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): a prelog prism
`(B, IB, M_B)` over the base that is `(p, I)`-completely smooth with a smooth chart, with a
surjection `(B, M_B) → (R, P)` onto a smooth prelog algebra with a smooth chart. -/
def SmoothChartDatum (X : SmoothPrelogAlgebra P) : Type (u + 1) := sorry

/-- The object `(B′, IB′, M_{B′})^a` given by the prelog prismatic envelope of a smooth chart. -/
noncomputable def SmoothChartDatum.envelopeObject {X : SmoothPrelogAlgebra P}
    (c : SmoothChartDatum X) : LogPrismaticSite P (SmoothLogFormalScheme.spf X) := sorry

/-- **Node `PR.8/smooth-chart-covers`** (theorem): Envelopes of smooth charts cover the final
object.

Work with the flat topology. Let (R, P) be p-completely smooth over (A/I, M_A) with M_A → P a smooth
chart, and (B, IB, M_B) a prelog prism over (A, I, M_A) that is (p, I)-completely smooth over (A,
M_A) with M_A → M_B a smooth chart, together with a surjection (B, M_B) → (R, P); let (B′, IB′,
M_{B′}) be its prelog prismatic envelope. Then for every object (C, IC, M_C)^a of ((R, P)/(A,
M_A))_Δ the product of (B′, IB′, M_{B′})^a and (C, IC, M_C)^a exists and is (p, I)-completely
faithfully flat over C; in particular (B′, IB′, M_{B′})^a covers the final object. If (A, M_A) has
rank 1, a smooth lift (R̃, P̃) of (R, P) over (A, M_A) with its rank-1 δ_log-structure gives such a
covering. In the absolute setting, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the
final object of the topos of (O_K, O_K∖{0})_Δ.

Hypotheses (packet): Flat topology; smooth charts in Koshikawa's sense; (A, I) may be assumed
orientable for faithful flatness.

Lean form: the envelope object covers the final object for the flat topology (Mathlib
`GrothendieckTopology.CoversTop`). The existence and complete faithful flatness of the products, the
rank-one smooth-lift variant and the absolute Breuil–Kisin statement are not typed. -/
theorem SmoothChartDatum.coversTop {X : SmoothPrelogAlgebra P} (c : SmoothChartDatum X) :
    (flatTopology (SmoothLogFormalScheme.spf X)).CoversTop (fun _ : Unit => c.envelopeObject) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-hodge-tate-map` (construction): The log Hodge–Tate comparison map -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder (owner `CrystallineCohomology:CR.5:log-algebra`): the module of log differentials
`Ω^1_{(R,P)/(Ā,M_A)}`. -/
def logKaehler (X : PrelogAlgebra P) : Type u := sorry

noncomputable instance (X : PrelogAlgebra P) : AddCommGroup (logKaehler X) := sorry

noncomputable instance (X : PrelogAlgebra P) : Module X.R (logKaehler X) := sorry

/-- `dlog : P → Ω^1_log`, a monoid map to the additive group. -/
noncomputable def dlog (X : PrelogAlgebra P) : X.Q →* Multiplicative (logKaehler X) := sorry

/-- The derivation `d : R → Ω^1_log`. -/
noncomputable def logD (X : PrelogAlgebra P) : X.R → logKaehler X := sorry

/-- `d(α(q)) = α(q) dlog(q)`. -/
theorem logD_alpha (X : PrelogAlgebra P) (q : X.Q) :
    logD X (X.α q) = X.α q • Multiplicative.toAdd (dlog X q) := by
  sorry

/-- Placeholder (node `PR.8/log-hodge-tate-map`): `H^i(Δ̄_{(R,P)/(A,M_A)}){i}`, the Breuil–Kisin
twisted cohomology of the reduced complex. -/
noncomputable def twistedHomology (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : ModuleCat.{u} X.R := sorry

/-- Placeholder (node `PR.8/log-hodge-tate-map`): the Bockstein differential
`β_I : H^i(Δ̄){i} → H^{i+1}(Δ̄){i+1}`. -/
noncomputable def bockstein (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    twistedHomology P X i ⟶ twistedHomology P X (i + 1) := sorry

/-- **Node `PR.8/log-hodge-tate-map`** (construction): The log Hodge–Tate comparison map.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). The structure map
η^0: O_X → H^0(Δ̄_{(X,M_X)/(A,M_A)}) extends to η^1: Ω^1_{(X,M_X)/(A/I,M_A)} → H^1(Δ̄){1}: locally,
for X = Spf(R) with chart P and an object (B, IB, M_B)^a with exact surjection M_B → P, compose
RΓ(L_{(R,P)/(A,M_A)}) → RΓ(L_{(B/IB,P)/(B,M_B)}) ≅ RΓ(L_{(B/IB,M_B)/(B,M_B)}) ≅ IB/I^2B[1] ≅ I/I^2
⊗^L_{A/I} B/IB[1], take derived global sections over the site and H^0. For every local section m of
M_X^gp, η^1(dlog m)^2 = 0 and β_I(η^1(dlog m)) = 0, where β_I is the Bockstein differential on
H^*(Δ̄){*}. Since Ω^1_log has local bases of the form dlog m, η^1 extends uniquely to a map of
commutative differential graded A/I-algebras η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → (H^*(Δ̄){*}, β_I),
compatible with the O_X-module structures; its composite with the canonical map Ω^1_{R/(A/I)} →
Ω^1_log agrees with the non-log Hodge–Tate map followed by the forgetful comparison map.

Hypotheses (packet): Bounded prelog prism with integral monoid; smoothness in Koshikawa's sense; the
Breuil–Kisin twist {i} = ⊗ I^i/I^{i+1}.

API `LogPrismaticSite.hodgeTateMap` (constructor; node `PR.8/log-hodge-tate-map`): η^*:
Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} as a map of cdgas with the Bockstein
differential.

Lean form: the degree-`i` component `η^i : Ω^i_log = ⋀^i Ω^1_log → H^i(Δ̄){i}` as a map of
`R`-modules (affine form); multiplicativity is not typed. -/
noncomputable def hodgeTateMap (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : ModuleCat.of X.R (⋀[X.R]^i (logKaehler X)) ⟶ twistedHomology P X i := sorry


/-- API `LogPrismaticSite.hodgeTateMap_bockstein_dlog` (simp; node `PR.8/log-hodge-tate-map`):
β_I(η^1(dlog m)) = 0. -/
theorem hodgeTateMap_bockstein_dlog (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (q : X.Q) :
    (bockstein P X 1) ((hodgeTateMap P X 1)
      (exteriorPower.ιMulti X.R 1 (fun _ => Multiplicative.toAdd (dlog X q)))) = 0 := by
  sorry


/-- Unit test `LogPrismaticSite.hodgeTateMap_dlog_not_dx` (non-example; node
`PR.8/log-hodge-tate-map`): η^1(dlog X_0) is not η^1(dX_0): they differ by the factor X_0, which is
not a unit on A/I⟨X_0⟩. -/
example (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    (hodgeTateMap P (PrelogAlgebra.logAffineLine P) 1)
        (exteriorPower.ιMulti _ 1 (fun _ => Multiplicative.toAdd
          (dlog (PrelogAlgebra.logAffineLine P) (PrelogAlgebra.logAffineLine.X P)))) ≠
      (hodgeTateMap P (PrelogAlgebra.logAffineLine P) 1)
        (exteriorPower.ιMulti _ 1 (fun _ => logD (PrelogAlgebra.logAffineLine P)
          ((PrelogAlgebra.logAffineLine P).α (PrelogAlgebra.logAffineLine.X P)))) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/hodge-tate-group-lemma` (lemma): Hodge–Tate cohomology of group-ring Čech nerves -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- Placeholder (node `PR.8/hodge-tate-group-lemma`): `Tot(C^•)` for
`C^• = A⟨H ⊕ H_n⟩{(I, (h − 1))/I}_δ ⊗_A A / I`, attached to a surjection `G′ → G` of finitely
generated abelian groups with kernel `H`. -/
noncomputable def groupCechTot (P : Prism p A) {G G' : Type u} [AddCommGroup G] [AddCommGroup G']
    (f : G' →+ G) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/hodge-tate-group-lemma`** (lemma): Hodge–Tate cohomology of group-ring Čech nerves.

Let (A, I) be a bounded prism and G′ → G a surjection of finitely generated abelian groups without
p-torsion, with kernel H; R := A/I⟨G⟩ and A⟨G′⟩ → R. Let B^• be the Čech nerve of the prismatic
envelope B^0 in (R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′), and C^• := A⟨H ⊕ H_n⟩{(I, (h −
1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I, so that B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•. Then the map ∧^i(A/I ⊗_Z G) →
H^i(Tot(C^•)){i} induced by g ↦ (g̃ − 1)/d ⊗ d (for a lift g̃ ∈ G′ and an orientation d) is an
isomorphism of A/I-modules for every i.

Hypotheses (packet): G, G′ finitely generated abelian with trivial p-torsion; (A, I) bounded.

Lean form: an isomorphism `⋀^i(A/I ⊗_ℤ G) ≅ H^i(Tot C^•)` of `A/I`-modules (the twist `{i}` is
trivialised by the orientation); that it is induced by `g ↦ (g̃ − 1)/d ⊗ d` is not typed. -/
theorem groupLemma (P : Prism p A) (hb : P.IsBounded) (ho : P.IsOrientable) {G G' : Type u}
    [AddCommGroup G] [AddCommGroup G'] [AddGroup.FG G] [AddGroup.FG G']
    (hG : ∀ g : G, (p : ℤ) • g = 0 → g = 0) (hG' : ∀ g : G', (p : ℤ) • g = 0 → g = 0)
    (f : G' →+ G) (hf : Function.Surjective f) (i : ℕ) :
    Nonempty (ModuleCat.of P.bar (⋀[P.bar]^i (TensorProduct ℤ P.bar G)) ≅
      (DerivedCategory.homologyFunctor _ i).obj (groupCechTot P f)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/hodge-tate-log-affine-line` (lemma): Hodge–Tate comparison for the log affine line -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/hodge-tate-log-affine-line`** (lemma): Hodge–Tate comparison for the log affine
line.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N).
Then η^*: Ω^*_{(R,P)/(A/I,M_A)} → H^*(Δ̄_{(R,P)/(A,M_A)}){*} is an isomorphism; explicitly
H^1(Δ̄){1} ≅ R ⊗_Z X_0^Z with 1 ⊗ X_0 ↦ dlog X_0.

Hypotheses (packet): (A, I, M_A) bounded, M_A integral. -/
theorem hodgeTate_logAffineLine (P : IntegralBoundedPrelogPrism p A M) (i : ℕ) :
    IsIso (hodgeTateMap P (PrelogAlgebra.logAffineLine P) i) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-hodge-tate-comparison` (theorem): The log Hodge–Tate comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-hodge-tate-comparison`** (theorem): The log Hodge–Tate comparison.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme
smooth over (A/I, M_A) in Koshikawa's sense. Then η^*: Ω^*_{(X,M_X)/(A/I,M_A)} →
H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} is an isomorphism of differential graded A/I-algebras (sheaves on
X_ét); in particular Δ̄_{(X,M_X)/(A,M_A)} is a perfect complex. Moreover RΓ(Spf(R)_ét,
L_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1] locally.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the
sense of Koshikawa Appendix A (integral, relatively coherent charts).

Lean form: the affine (smooth chart) form, degreewise. The sheaf version on `X_ét`, perfectness of
`Δ̄` and the cotangent identification are not typed. -/
theorem hodgeTateComparison (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P)
    (i : ℕ) : IsIso (hodgeTateMap P X.toPrelogAlgebra i) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-base-change` (theorem): Completed base change for log prismatic cohomology -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-prismatic-base-change`** (theorem): Completed base change for log prismatic
cohomology.

Let (A, I, M_A) → (A′, IA′, M_{A′}) be a map of bounded prelog prisms with integral monoids, (X,
M_X) smooth over (A/I, M_A) with qcqs underlying formal scheme, and X′ := X ×_{(Spf A/I, M_A)^a}
(Spf A′/IA′, M_{A′})^a (an integral log formal scheme, smooth over the new base). Then RΓ_Δ((X,
M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′})), and the same holds for the sheaves Δ.

Hypotheses (packet): Bounded prelog prisms with integral monoids; base change in the category of
integral log formal schemes; qcqs X for the global form.

Lean form: the global statement for `RΓ_Δ`; the statement for the sheaves `Δ` is not typed. -/
theorem baseChange (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P)
    {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    (P' : IntegralBoundedPrelogPrism p A' M') (f : IntegralBoundedPrelogPrism.BaseHom P P') :
    Nonempty ((completedExtendScalars f.toHom.ring P'.pI).obj (cohomology P X) ≅
      cohomology P' (X.baseChange f)) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/delta-log-crystalline-site` (definition): The δ_log-crystalline site -/

/-- The crystalline bases of K1 §6: the prism ideal is `(p)` and `(A, M_A)` is of rank one or a
log ring. -/
structure IntegralBoundedPrelogPrism.CrystallineBase {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Prop where
  crystalline : P.toPrism.IsCrystalline
  rank : P.toPrelogPrism.IsRankOne ∨ DeltaLogRing.IsLogRing P.α

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth log formal
schemes over the base whose mod `p` fibre is of Cartier type over `(A / (p, I), M_A)` (Kato 4.8);
`toSmooth` forgets the condition. -/
def CartierTypeLogFormalScheme {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth affine prelog
algebras with a chart of Cartier type (resp. mod `p` fibre of Cartier type) admitting an exact
surjection from a smooth lift. -/
def CartierTypePrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

namespace CartierTypeLogFormalScheme

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The underlying smooth log formal scheme. -/
noncomputable def toSmooth (X : CartierTypeLogFormalScheme P) : SmoothLogFormalScheme P := sorry

end CartierTypeLogFormalScheme

/-- The underlying smooth prelog algebra. -/
noncomputable def CartierTypePrelogAlgebra.toSmooth {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : CartierTypePrelogAlgebra P) : SmoothPrelogAlgebra P := sorry

/-- **Node `PR.8/delta-log-crystalline-site`** (definition): The δ_log-crystalline site.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal
scheme over (A, M_A). A δ_log-PD triple over (A, M_A) is (B, J, M_B)^a where (B, (p), M_B) is a
bounded prelog prism over (A, (p), M_A) with integral log structure and J ⊂ B is a p-completed PD
ideal with B/J classically p-complete. The (big) δ_log-crystalline site ((X, M_X)/(A, M_A))_δCRYS is
the opposite of the category of δ_log-PD triples with a map f: Spf(B/J) → X over A and an exact
closed immersion (Spf(B/J), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A), with the étale topology
and structure sheaf O_δCRYS: (B, J, M_B)^a ↦ B. Dropping δ and δ_log gives a version ((X, M_X)/(A,
M_A))_CRYS of the big log crystalline site with étale topology; forgetting is a cocontinuous functor
inducing u_X^δ: Shv(δCRYS) → Shv(X_ét) and a canonical map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

Hypotheses (packet): I = (p); (A, M_A) of rank 1 or a log ring (so A is p-torsion free); objects
only those receiving a map from (A, (p), M_A) (a chart-dependent simplification, K1 §6.1).

API `DeltaLogCrystallineSite` (constructor; node `PR.8/delta-log-crystalline-site`): The site ((X,
M_X)/(A, M_A))_δCRYS with étale topology.

Placeholder carrier (node `PR.8/delta-log-crystalline-site`). Lean form: the base is a crystalline
base (`I = (p)`, rank one or log ring; `IntegralBoundedPrelogPrism.CrystallineBase`) and the PD
ideal is `(p)`; the general PD ideal `I ∋ p` of the packet is not typed. -/
def DeltaLogCrystallineSite {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : Type (u + 1) := sorry

namespace DeltaLogCrystallineSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Category.{u} (DeltaLogCrystallineSite P hP X) := sorry

/-- The étale topology of the δ_log-crystalline site. -/
noncomputable def topology (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (DeltaLogCrystallineSite P hP X) := sorry

/-- API `DeltaLogCrystallineSite.structureSheaf` (data; node `PR.8/delta-log-crystalline-site`):
O_δCRYS: (B, J, M_B)^a ↦ B. -/
noncomputable def structureSheaf (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Sheaf (topology hP X) CommRingCat.{u} := sorry

/-- Placeholder (owner `CrystallineCohomology:CR.5`): the big log crystalline site
`((X, M_X)/(A, M_A))_CRYS` with the étale topology. -/
def BigLogCrystalline (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Type (u + 1) := sorry

noncomputable instance (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Category.{u} (BigLogCrystalline hP X) := sorry

/-- The étale topology of the big log crystalline site. -/
noncomputable def BigLogCrystalline.topology (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : GrothendieckTopology (BigLogCrystalline hP X) := sorry

/-- API `DeltaLogCrystallineSite.toBigLogCrystalline` (functoriality; node
`PR.8/delta-log-crystalline-site`): The cocontinuous forgetful functor to the big log crystalline
site ((X, M_X)/(A, M_A))_CRYS and the map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS. -/
noncomputable def toBigLogCrystalline (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DeltaLogCrystallineSite P hP X ⥤ BigLogCrystalline hP X := sorry

theorem toBigLogCrystalline_isCocontinuous (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) :
    (toBigLogCrystalline hP X).IsCocontinuous (topology hP X) (BigLogCrystalline.topology hP X) := by
  sorry

/-- Placeholder (owner `CrystallineCohomology:CR.5`): `RΓ(X_ét, Ru_{X*} O_CRYS)`, log crystalline
cohomology. -/
noncomputable def logCrystallineCohomology (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/delta-log-crystalline-site`): `RΓ(X_ét, Ru^δ_{X*} O_δCRYS)`. -/
noncomputable def cohomology (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : DerivedCategory (ModuleCat.{u} A) := sorry

/-- The canonical map `Ru_{X*} O_CRYS → Ru^δ_{X*} O_δCRYS` on global sections. -/
noncomputable def fromLogCrystalline (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    logCrystallineCohomology P hP X ⟶ cohomology P hP X := sorry


/-- API `DeltaLogCrystallineSite.toEtale` (projection; node `PR.8/delta-log-crystalline-site`): The
morphism of topoi u^δ_X to X_ét.

Lean form: the direct image `u^δ_{X*}` on sheaves of sets. -/
noncomputable def toEtale (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Sheaf (topology hP X) (Type u) ⥤ Sheaf X.etaleTopology (Type u) := sorry

/-- Unit test `DeltaLogCrystallineSite.point` (degenerate; node `PR.8/delta-log-crystalline-site`):
For X = Spf(A/p) with log structure M_A, the triple (A, (p), M_A)^a is final and RΓ_δCRYS = A. -/
example (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase) :
    Nonempty (cohomology P hP (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry


end DeltaLogCrystallineSite

/-! ## Node `PR.8/delta-log-crystalline-vs-log-crystalline` (theorem): δ_log-crystalline cohomology is log crystalline cohomology -/

namespace DeltaLogCrystallineSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/delta-log-crystalline-vs-log-crystalline`** (theorem): δ_log-crystalline cohomology
is log crystalline cohomology.

Let I ⊂ A be a p-completed PD ideal with A/I classically p-complete and (X, M_X) smooth over (A/I,
M_A). Then the natural map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS is an isomorphism of E_∞-A-algebras on
X_ét. In the characteristic-p case p ∈ I, for every m ≥ 1 reduction mod p^m identifies Ru_{X*}O_CRYS
⊗^L A/p^m with Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)} (small log crystalline site), and passing to the
limit Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS. When I ∋ p and the chart M_A → P is integral and
weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a
p-completely smooth δ_log-ring of topologically finite presentation, and also the log de Rham
complex with coefficients in that envelope, compute these cohomologies.

Hypotheses (packet): I a p-completed PD ideal, A/I classically p-complete; (X, M_X) smooth over
(A/I, M_A) in Koshikawa's sense; (A, (p), M_A) bounded of rank 1 or a log ring.

Lean form: on global sections over the crystalline base (PD ideal `(p)`); the reductions mod `p^m`,
the limit statement and the Čech/de Rham computations are not typed. -/
theorem fromLogCrystalline_isIso (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    IsIso (fromLogCrystalline P hP X) := by
  sorry

end DeltaLogCrystallineSite

/-! ## Node `PR.8/cartier-type-cosimplicial-frobenius` (lemma): Cosimplicial relative Frobenius for Cartier-type monoid maps -/


/-! ## Node `PR.8/crystalline-comparison-map` (construction): The log crystalline comparison map -/

namespace IntegralBoundedPrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The Frobenius-twisted base `(φ_* A, (p), φ_* M_A)` of a crystalline base of rank one or with
`(A, M_A)` a log ring (node `PR.8/crystalline-comparison-map`). -/
noncomputable def frobeniusTwist (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) : IntegralBoundedPrelogPrism p A M := sorry

end IntegralBoundedPrelogPrism

/-- The base change `(X^(1), M_X^(1))` along `ψ : (A/I, M_A) → (φ_* A / p, φ_* M_A)`. -/
noncomputable def SmoothLogFormalScheme.frobeniusTwist {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    SmoothLogFormalScheme (P.frobeniusTwist hP) := sorry

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/crystalline-comparison-map`** (construction): The log crystalline comparison map.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log
ring, I ⊂ A a PD ideal containing p, and ψ: (A/I, M_A) → (φ_*A/p, φ_*M_A) the factorisation of
Frobenius. For (X, M_X) over A/I let (X^(1), M_X^(1)) be its base change along ψ. There is a
cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M_X^(1))/(φ_*A, φ_*M_A))_Δ sending (B, J,
M_B)^a (with (B, M_B) a log ring) to (φ_*B, (p), M_B^(1))^a, where M_B^(1) = M_B ⊔_{M_A, φ_{M_A}}
φ_*M_A with M_B^(1) → φ_*M_B induced by φ_{M_B}, and Spf(φ_*B/p) → X^(1) induced by ψ_B: B/J →
φ_*B/p. It induces a morphism of ringed topoi (Shv(δCRYS), φ_*O_δCRYS) → (Shv(log prismatic site of
X^(1)), O_Δ) and hence the crystalline comparison map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} →
φ_*Ru^δ_{X*}O_δCRYS of E_∞-φ_*A-algebras on X_ét, compatible with Frobenius.

Hypotheses (packet): The prism ideal is (p); I denotes a separate auxiliary PD ideal containing p.
M_A is integral; (A, M_A) is of rank 1 or a log ring.

API `LogPrismaticSite.crystallineFunctor` (constructor; node `PR.8/crystalline-comparison-map`): The
cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ. -/
noncomputable def crystallineFunctor (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DeltaLogCrystallineSite P hP X ⥤ LogPrismaticSite (P.frobeniusTwist hP) (X.frobeniusTwist hP) :=
  sorry

/-- API `LogPrismaticSite.crystallineFunctor_cocontinuous` (other; node
`PR.8/crystalline-comparison-map`): The functor is cocontinuous for the étale topologies. -/
theorem crystallineFunctor_cocontinuous (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) :
    (crystallineFunctor hP X).IsCocontinuous (DeltaLogCrystallineSite.topology hP X)
      (topology (X.frobeniusTwist hP)) := by
  sorry

/-- API `LogPrismaticSite.crystallineComparisonMap` (constructor; node
`PR.8/crystalline-comparison-map`): The induced map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} →
φ_*Ru^δ_{X*}O_δCRYS of E_∞-algebras.

Lean form: on global sections, `RΓ_Δ((X^(1), M^(1))/(φ_* A, φ_* M_A)) → φ_* RΓ_δCRYS` in `D(A)`,
with `φ_*` PR.0's `frobeniusPushforward`. -/
noncomputable def crystallineComparisonMap (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    cohomology (P.frobeniusTwist hP) (X.frobeniusTwist hP) ⟶
      (frobeniusPushforward P.toPrism).obj (DeltaLogCrystallineSite.cohomology P hP X) := sorry


/-- Unit test `LogPrismaticSite.crystallineComparisonMap_point` (degenerate; node
`PR.8/crystalline-comparison-map`): For X = Spf(A/I) with log structure M_A, the comparison map is
the identity of φ_*A.

Lean form: for the base point the comparison map is an isomorphism (both sides are `φ_* A`); that it
is the identity is not typed. -/
example (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) :
    IsIso (crystallineComparisonMap P hP
      (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P))) := by
  sorry


end LogPrismaticSite

/-! ## Node `PR.8/local-crystalline-comparison` (theorem): Local log crystalline comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/local-crystalline-comparison`** (theorem): Local log crystalline comparison.

In the setting of the comparison map, let (R, P) be a smooth prelog ring over (A/I, M_A) with P
integral, M_A → P integral, (weakly) finitely generated and of Cartier type (M_A/M_A^× → P/P^×
integral with exact relative Frobenius P^(1) → P), and assume (R, P) admits an exact surjection from
a smooth lift (R̃, P̃) over (A/p, M_A). Then there is a canonical isomorphism
Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A)) of E_∞-φ_*A-algebras compatible with
Frobenius; by base change the left side is the p-completed base change of Δ_{(R̃,P̃)/(A,M_A)} along
φ.

Hypotheses (packet): As in the comparison map; Cartier type of M_A → P; existence of the exact
surjection from a smooth lift.

Lean form: the comparison map is an isomorphism on `Spf` of a smooth affine prelog algebra of
Cartier type with an exact surjection from a smooth lift (placeholder `CartierTypePrelogAlgebra`,
CR.5); the base-change description is not typed. -/
theorem localCrystallineComparison (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : CartierTypePrelogAlgebra P) :
    IsIso (crystallineComparisonMap P hP (SmoothLogFormalScheme.spf X.toSmooth)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-crystalline-comparison` (theorem): The log crystalline comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-crystalline-comparison`** (theorem): The log crystalline comparison.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log
ring, I a PD ideal of A containing p, and (X, M_X) a smooth log scheme over (A/I, M_A) of Cartier
type (Kato 4.8). Then the crystalline comparison map is an isomorphism of E_∞-φ_*A-algebras on X_ét:
Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys. Globally, for I = (p) and X qcqs of Cartier
type over (A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A,
φ-equivariantly, as E_∞-A-algebras.

Hypotheses (packet): The prism ideal is (p); the auxiliary PD ideal I contains p. The smooth log
scheme over (A/I, M_A) is of Cartier type. For the displayed global form specialize I = (p) and
assume X qcqs.

Lean form: for `I = (p)` and `X` of Cartier type (placeholder `CartierTypeLogFormalScheme`, CR.5),
the comparison map is an isomorphism and `RΓ_logcrys ≅ RΓ_Δ ⊗̂^L_{A, φ_A} A`; φ-equivariance and the
`E_∞` structure are not typed. -/
theorem logCrystallineComparison (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : CartierTypeLogFormalScheme P) :
    IsIso (crystallineComparisonMap P hP X.toSmooth) ∧
      Nonempty (DeltaLogCrystallineSite.logCrystallineCohomology P hP X.toSmooth ≅
        (completedExtendScalars P.toPrism.φ (Ideal.span {(p : A)})).obj
          (cohomology P X.toSmooth)) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/log-q-pd-triple` (definition): Log q-PD triples and log q-PD envelopes -/

/-- The `q`-integer `[n]_q = 1 + q + ⋯ + q^{n-1}`: PR.0's `qNumber`. -/
def qNumber {R : Type*} [CommRing R] (q : R) (n : ℕ) : R := ∑ i ∈ Finset.range n, q ^ i

/-- **Node `PR.8/log-q-pd-triple`** (definition): Log q-PD triples and log q-PD envelopes.

Let A = Z_p[[q − 1]] with δ(q) = 0 and [p]_q = (q^p − 1)/(q − 1). A q-PD pair is a (p,
[p]_q)-complete δ-pair (D, I) over (A, (q − 1)) such that (D, ([p]_q)) is a bounded prism over (A,
([p]_q)), φ(I) ⊂ [p]_q D and γ(I) ⊂ I where γ(x) = φ(x)/[p]_q − δ(x), D/(q − 1) is p-torsion free
with finite (p, [p]_q)-complete Tor amplitude over D, and D/I is classically p-complete. A prelog
q-PD triple is (D, I, M_D) with (D, I) a q-PD pair and (D, I, M_D) a δ_log-triple; a log q-PD triple
is (D, I, M_{Spf(D)}) arising as (D, [p]_q, M_D)^a. Étale maps lift uniquely (Lemma 7.3). For a
prelog q-PD triple (D_1, I_1, M_{D_1}) with integral monoid, a p-completely smooth (R, P) over
(D_1/I_1, M_{D_1}) with M_{D_1} → P integral and weakly finitely generated admitting a smooth lift,
and a surjection (D_2, M_{D_2}) → (R, P) as in Lemma 7.4, there is a universal map to a prelog q-PD
triple (D_3, I_3, M_{D_3}) with an exact surjection M_{D_3} → P and D_2/I_2 ≅ D_3/I_3; D_3 is (p,
[p]_q)-completely flat over D_1, the construction commutes with completed base change, and D_3 ⊗̂
D_1/(q − 1) is the p-completed log PD envelope. This is the log q-PD envelope.

Hypotheses (packet): A = Z_p[[q − 1]]; (D_1, I_1, M_{D_1}) a prelog q-PD triple with integral
M_{D_1}. (R, P) p-completely smooth over (D_1/I_1, M_{D_1}); M_{D_1} → P integral and weakly
finitely generated; (R, P)^a admits a smooth lift over (D_1, M_{D_1}). A surjection (D_{2,0},
M_{D_2}) → (R, P) over (D_1, M_{D_1}) satisfies one of: (i) (D_{2,0}, M_{D_2}) is a (p,
[p]_q)-completely smooth δ_log ring of topologically finite presentation; (ii) M_{D_1} → M_{D_2} is
injective integral, M_{D_2}^gp/M_{D_1}^gp is free abelian, and D_{2,0} is (p, [p]_q)-completely free
over the completion of D_1 ⊗_{Z_(p)[M_{D_1}]} Z_(p)[M_{D_2}]. In (i), D_2 = D_{2,0}; in (ii), D_2 is
the completed universal δ_log ring generated by D_{2,0}. I_{2,0} = ker(D_{2,0} → R), and I_2 is the
(p, [p]_q)-completion of I_{2,0}D_2.

API `LogQPDTriple` (constructor; node `PR.8/log-q-pd-triple`): A prelog q-PD triple (D, I, M_D) over
Z_p[[q − 1]].

Placeholder carrier (node `PR.8/log-q-pd-triple`, with PR.6's `q`-PD pairs): prelog `q`-PD triples
over `ℤ_p⟦q − 1⟧` (Mathlib `PowerSeries ℤ_[p]`, `q = 1 + X`), with the projections below. -/
def LogQPDTriple (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- The ring `D`. -/
def D (T : LogQPDTriple.{u} p) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) : CommRing T.D := sorry

/-- The monoid `M_D`. -/
def M (T : LogQPDTriple.{u} p) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) : CommMonoid T.M := sorry

/-- The underlying δ_log-triple `(D, I, M_D)`. -/
noncomputable def toDeltaLogTriple (T : LogQPDTriple.{u} p) : DeltaLogTriple p T.D T.M := sorry

/-- `D` is an algebra over `ℤ_p⟦q − 1⟧`. -/
noncomputable instance (T : LogQPDTriple.{u} p) : Algebra (PowerSeries ℤ_[p]) T.D := sorry

/-- The image of `q`. -/
noncomputable def q (T : LogQPDTriple.{u} p) : T.D := sorry

theorem q_eq (T : LogQPDTriple.{u} p) :
    T.q = algebraMap (PowerSeries ℤ_[p]) T.D (1 + PowerSeries.X) := by
  sorry

/-- API `LogQPDTriple.gamma_mem` (relation; node `PR.8/log-q-pd-triple`): For x ∈ I, γ(x) =
φ(x)/[p]_q − δ(x) ∈ I. -/
theorem gamma_mem (T : LogQPDTriple.{u} p) (x : T.D) (hx : x ∈ T.toDeltaLogTriple.ideal) :
    ∃ y : T.D, frob T.toDeltaLogTriple.delta x = qNumber T.q p * y ∧
      y - T.toDeltaLogTriple.delta.delta x ∈ T.toDeltaLogTriple.ideal := by
  sorry


/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): the data of Lemma 7.4 —
`(R, P)` smooth over `(D_1/I_1, M_{D_1})` with integral weakly finitely generated chart and a
smooth lift, and a surjection `(D_2, M_{D_2}) → (R, P)` of type (i) or (ii). -/
def EnvelopeDatum (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- API `LogQPDTriple.envelope` (constructor; node `PR.8/log-q-pd-triple`): The log q-PD envelope
(D_3, I_3, M_{D_3}) of Lemma 7.4. -/
noncomputable def envelope {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) : LogQPDTriple.{u} p :=
  sorry

/-- The structure map `D_1 → D_3`. -/
noncomputable def envelope.map {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) :
    T.D →+* (envelope S).D := sorry


/-- Unit test `LogQPDTriple.not_q_minus_one_ideal` (non-example; node `PR.8/log-q-pd-triple`):
(Z_p[[q − 1]], (q − 1)) is a q-PD pair but ([p]_q) cannot be replaced by (q − 1) as the prism ideal:
(Z_p[[q − 1]], (q − 1)) is not a prism.

Lean form of the second assertion: with the δ-structure `δ(q) = 0` (`φ(q) = q ^ p`), there is no
PR.0 prism on `ℤ_p⟦q − 1⟧` with ideal `(q − 1)`. -/
example (δ : DeltaStructure p (PowerSeries ℤ_[p]))
    (hδ : frob δ (1 + PowerSeries.X) = (1 + PowerSeries.X) ^ p) :
    ¬ ∃ P : Prism p (PowerSeries ℤ_[p]), P.δ = δ ∧ P.I = Ideal.span {PowerSeries.X} := by
  sorry

end LogQPDTriple

/-! ## Node `PR.8/log-q-crystalline-site` (definition): The log q-crystalline site -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): log `p`-adic formal
schemes smooth over `(D/I, M_D)` (with integral log structure). -/
def SmoothScheme (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- `Spf(D/I)` with the log structure from `M_D`. -/
noncomputable def SmoothScheme.base (T : LogQPDTriple.{u} p) : SmoothScheme T := sorry

end LogQPDTriple

/-- **Node `PR.8/log-q-crystalline-site`** (definition): The log q-crystalline site.

Fix a prelog q-PD triple (D, I, M_D) with M_D integral and (X, M_X) smooth over (D/I, M_D). The log
q-crystalline site ((X, M_X)/(D, M_D))_qCRYS is the opposite of the category of log q-PD triples (E,
J, M_{Spf(E)}) from prelog q-PD triples (E, J, M_E) over (D, I, M_D) with M_E integral, with f:
Spf(E/J) → X over D/I and an exact closed immersion (Spf(E/J), f^*M_X) ↪ (Spf(E), M_{Spf(E)}) over
(D, M_D); étale topology; structure sheaf O_qCRYS: E ↦ E. Write RΓ_qCRYS((X, M_X)/(D, M_D)), a (p,
[p]_q)-complete E_∞-D-algebra with φ_D-semilinear endomorphism, and qΩ_{(X,M_X)/(D,M_D)} :=
Ru^q_{X*}O_qCRYS on X_ét. For affine X with a smooth lift and integral weakly finitely generated
chart, the Čech nerve of the log q-PD envelope of a free surjection computes it (Construction 7.8),
strictly functorially for (E_0, M_E) = (D⟨N^R, N^P⟩, M_D ⊕ N^P). At q = 1 it is the
δ_log-crystalline site.

Hypotheses (packet): (D, I, M_D) prelog q-PD triple with M_D integral; (X, M_X) smooth over (D/I,
M_D).

API `LogQCrystallineSite` (constructor; node `PR.8/log-q-crystalline-site`): The site ((X, M_X)/(D,
M_D))_qCRYS.

Placeholder carrier (node `PR.8/log-q-crystalline-site`): the underlying category. -/
def LogQCrystallineSite {p : ℕ} [Fact p.Prime] (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    Type (u + 1) := sorry

namespace LogQCrystallineSite

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    Category.{u} (LogQCrystallineSite T X) := sorry

/-- The étale topology. -/
noncomputable def topology (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    GrothendieckTopology (LogQCrystallineSite T X) := sorry

/-- API `LogQCrystallineSite.qOmega` (constructor; node `PR.8/log-q-crystalline-site`):
qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS, an E_∞-D-algebra on X_ét with φ_D-semilinear Frobenius.

Lean form: global sections `RΓ_qCRYS((X, M_X)/(D, M_D)) = RΓ(X_ét, qΩ)` in `D(D)`. -/
noncomputable def qOmega (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    DerivedCategory (ModuleCat.{u} T.D) := sorry


/-- Unit test `LogQCrystallineSite.point` (degenerate; node `PR.8/log-q-crystalline-site`): For X =
Spf(D/I) with log structure M_D, qΩ = D. -/
example (T : LogQPDTriple.{u} p) :
    Nonempty (qOmega T (LogQPDTriple.SmoothScheme.base T) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} T.D) 0).obj (ModuleCat.of T.D T.D)) := by
  sorry


end LogQCrystallineSite

/-! ## Node `PR.8/log-q-crystalline-vs-crystalline` (theorem): Log q-crystalline cohomology modulo q − 1 -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- General δ_log-PD thickening site over the reduction of (D,I,M_D) modulo q−1.
The base PD ideal is the image of I, which need not be (p). This carrier imports CR.5's
arbitrary PD-base log crystalline interface; it is not a crystalline prism. -/
def ReducedPDSite (T : LogQPDTriple.{u} p) (X : SmoothScheme T) : Type (u+1) := sorry
noncomputable instance (T : LogQPDTriple.{u} p) (X : SmoothScheme T) :
    Category.{u} (ReducedPDSite T X) := sorry
noncomputable def reducedPDCohomology (T : LogQPDTriple.{u} p) (X : SmoothScheme T) :
    DerivedCategory (ModuleCat.{u} (T.D ⧸ Ideal.span {T.q - 1})) := sorry
end LogQPDTriple
namespace LogQCrystallineSite
variable {p : ℕ} [Fact p.Prime]
/-- API `LogQCrystallineSite.ofDeltaLogCrystalline`: K1 Theorem 7.10's canonical comparison
at an arbitrary reduced PD ideal, not only at the crystalline ideal (p). The sheaf-level
site functor and E∞ structure are omitted from this global 1-categorical signature. -/
noncomputable def ofDeltaLogCrystalline (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    (completedExtendScalars (Ideal.Quotient.mk (Ideal.span {T.q - 1}))
        (Ideal.span {(p : T.D ⧸ Ideal.span {T.q - 1})})).obj (qOmega T X) ⟶
      T.reducedPDCohomology X := sorry
/-- Node `PR.8/log-q-crystalline-vs-crystalline`: K1 Theorem 7.10. -/
theorem ofDeltaLogCrystalline_isIso (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    IsIso (ofDeltaLogCrystalline T X) := by sorry
end LogQCrystallineSite

/-! ## Node `PR.8/log-q-crystalline-vs-prismatic` (theorem): Log q-crystalline versus log prismatic cohomology -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth schemes over
`(D/I, M_D)` whose mod `p` fibre is of Cartier type. -/
def CartierScheme (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- The underlying smooth scheme. -/
noncomputable def CartierScheme.toSmooth {T : LogQPDTriple.{u} p} (X : CartierScheme T) :
    SmoothScheme T := sorry

/-- The log prism `(φ_* D, ([p]_q), φ_* M_D)` of a `q`-PD triple of rank one or with `(D, M_D)` a
log ring, as an integral bounded prelog prism. -/
noncomputable def frobeniusPrism (T : LogQPDTriple.{u} p) [IsCancelMul T.M]
    (hT : T.toDeltaLogTriple.toDeltaLogRing.IsRankOne ∨
      DeltaLogRing.IsLogRing T.toDeltaLogTriple.α) :
    IntegralBoundedPrelogPrism p T.D T.M := sorry

/-- `(X^(1), M_X^(1))`: base change along `ψ_D : (D/I, M_D) → (φ_* D/[p]_q, φ_* M_D)`. -/
noncomputable def CartierScheme.frobeniusTwist {T : LogQPDTriple.{u} p} [IsCancelMul T.M] (X : CartierScheme T)
    (hT : T.toDeltaLogTriple.toDeltaLogRing.IsRankOne ∨
      DeltaLogRing.IsLogRing T.toDeltaLogTriple.α) :
    SmoothLogFormalScheme (T.frobeniusPrism hT) := sorry

/-- The Frobenius of `D`. -/
noncomputable def frobenius (T : LogQPDTriple.{u} p) : T.D →+* T.D :=
  T.toDeltaLogTriple.delta.frobenius

/-- **Node `PR.8/log-q-crystalline-vs-prismatic`** (theorem): Log q-crystalline versus log prismatic
cohomology.

Let (D, I, M_D) be a prelog q-PD triple of rank 1 or with (D, M_D) a log ring, ψ_D: (D/I, M_D) →
(φ_*D/[p]_q, φ_*M_D) induced by Frobenius, and (X^(1), M_X^(1)) the base change of (X, M_X) along
ψ_D. If the mod p fibre of (X, M_X) is of Cartier type over (D/(p, I), M_D), there is a canonical
isomorphism Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)} of E_∞-φ_*D-algebras on
X_ét, relative to the log prism (φ_*D, ([p]_q), φ_*M_D). By base change the left side is the (p,
[p]_q)-completed base change along φ_D of Δ_{(X̃,M̃)/(D,M_D)} for a lift.

Hypotheses (packet): Cartier type of the mod p fibre; rank 1 or log ring base. M_D is integral, as
fixed in K1 §7.2 before Definition 7.5 (p. 39).

Lean form: on global sections, `RΓ_Δ((X^(1), M^(1))/(φ_* D, φ_* M_D)) ≅ φ_* RΓ_qCRYS` in `D(D)`; the
`E_∞` structure and the base-change description are not typed. -/
theorem qCrystalline_vs_prismatic (T : LogQPDTriple.{u} p) [IsCancelMul T.M]
    (hT : T.toDeltaLogTriple.toDeltaLogRing.IsRankOne ∨
      DeltaLogRing.IsLogRing T.toDeltaLogTriple.α) (X : CartierScheme T) :
    Nonempty (LogPrismaticSite.cohomology (T.frobeniusPrism hT) (X.frobeniusTwist hT) ≅
      (ModuleCat.restrictScalars T.frobenius).mapDerivedCategory.obj
        (LogQCrystallineSite.qOmega T X.toSmooth)) := by
  sorry

end LogQPDTriple

/-! ## Node `PR.8/log-q-de-rham-complex` (construction): Log q-de Rham complexes -/

namespace LogQDeRham

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (node `PR.8/log-q-de-rham-complex`): the ring `E_N`, the
`(p, [p]_q)`-completion of `D ⊗_{ℤ_(p)[M_D]} ℤ_(p)[N]`, here for the log-free monoid
`N = M_D ⊕ ℕ^S` (the coordinates `X_s`). -/
def E (T : LogQPDTriple.{u} p) (S : Type u) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) (S : Type u) : CommRing (E T S) := sorry

noncomputable instance (T : LogQPDTriple.{u} p) (S : Type u) : Algebra T.D (E T S) := sorry

/-- The coordinate `X_s ∈ E_N`. -/
noncomputable def coord (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S := sorry

/-- API `LogQDeRham.gamma` (data; node `PR.8/log-q-de-rham-complex`): The automorphism γ_s: X_s ↦
qX_s of (E_N, N)^a. -/
noncomputable def gamma (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S ≃ₐ[T.D] E T S :=
  sorry

theorem gamma_coord (T : LogQPDTriple.{u} p) {S : Type u} [DecidableEq S] (s t : S) :
    gamma T s (coord T t) = if t = s then algebraMap T.D (E T S) T.q * coord T t else coord T t := by
  sorry

/-- API `LogQDeRham.qNabla` (data; node `PR.8/log-q-de-rham-complex`): ∇^log_{q,s}(f) = (γ_s(f) −
f)/(q − 1) and ∇_q = Σ_s ∇^log_{q,s} dlog X_s.

Lean form: `∇^log_{q,s}` with its defining identity `(q − 1) ∇^log_{q,s}(f) = γ_s(f) − f`. -/
noncomputable def qNabla (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S →ₗ[T.D] E T S :=
  sorry

theorem qNabla_spec (T : LogQPDTriple.{u} p) {S : Type u} (s : S) (f : E T S) :
    algebraMap T.D (E T S) (T.q - 1) * qNabla T s f = gamma T s f - f := by
  sorry

/-- **Node `PR.8/log-q-de-rham-complex`** (construction): Log q-de Rham complexes.

Assume D flat over A = Z_p[[q − 1]] and work locally with X = Spf(R) admitting a smooth lift and an
integral weakly finitely generated chart M_D → P. For S a set and N ⊂ M_D^gp ⊕ Z^S a submonoid
containing M_D, let E_N be the (p, [p]_q)-completion of D ⊗_{Z_(p)[M_D]} Z_(p)[N] with its
δ_log-structure (Proposition 2.16). For s ∈ S, γ_s: X_s ↦ qX_s, X_t ↦ X_t (t ≠ s) is an automorphism
and ∇^log_{q,s}(f) := (γ_s(f) − f)/(q − 1); ∇_q(f) := Σ_s ∇^log_{q,s}(f)·dlog X_s defines the (p,
[p]_q)-completed Koszul complex qΩ^*_{(E_N,N)/(D,M_D)}, functorial in (S, N). For a surjection (E_N,
N) → (R, P) with exactification (E_{N′}, N′) and log q-PD envelope (F, M_F), ∇^log_q extends to F
giving qΩ^*_{(F,M_F)/(D,M_D)}: F → F ⊗̂_E Ω^1_{(E,M_E)/(D,M_D)} → ⋯, whose reduction mod q − 1 is
the de Rham complex of the p-completed log PD envelope. Theorem: qΩ_{(R,P)/(D,M_D)} ≅
qΩ^*_{(F,M_F)/(D,M_D)}, functorially in surjections. On qΩ^* the Frobenius sends dlog X_s ↦ [p]_q
dlog X_s, so the linearised Frobenius factors through η_{[p]_q}; if the mod p fibre is of Cartier
type and R is topologically of finite presentation, qΩ_{(R,P)/(D,M_D)} ∈ D^{[0,r]}(D) (r the rank of
Ω^1_log) and the linearised Frobenius induces φ_D^*qΩ ≅ Lη_{[p]_q}qΩ.

Hypotheses (packet): D flat over Z_p[[q − 1]]; smooth lift; chart integral and weakly finitely
generated; Cartier type for the Frobenius statements.

API `LogQDeRham.complex` (constructor; node `PR.8/log-q-de-rham-complex`): The log q-de Rham complex
qΩ^*_{(E_N,N)/(D,M_D)} and its extension qΩ^*_{(F,M_F)/(D,M_D)} to log q-PD envelopes. -/
noncomputable def complex (T : LogQPDTriple.{u} p) (S : Type u) :
    CochainComplex (ModuleCat.{u} T.D) ℕ := sorry

/-- The prelog algebra side: the smooth scheme `Spf(R)` computed by `E_N` and the surjection. -/
noncomputable def complex.scheme (T : LogQPDTriple.{u} p) (S : Type u) : T.SmoothScheme := sorry

/-- API `LogQDeRham.computes` (characterisation; node `PR.8/log-q-de-rham-complex`):
qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)} functorially in surjections (Theorem 7.17).

Lean form: for the log-free algebra `(D/I⟨ℕ^S⟩, M_D ⊕ ℕ^S)` (where the envelope is `E_N` itself) and
`D` flat over `ℤ_p⟦q − 1⟧`. -/
theorem computes (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D] (S : Type u) :
    Nonempty (DerivedCategory.Q.obj ((complex T S).extend ComplexShape.embeddingUpNat) ≅
      LogQCrystallineSite.qOmega T (complex.scheme T S)) := by
  sorry


/-- Unit test `LogQDeRham.affineLine_monomial` (computation; node `PR.8/log-q-de-rham-complex`): On
D⟨X⟩ with N = X^N, ∇^log_q(X^n) = [n]_q·X^n (since γ(X^n) = q^n X^n). -/
example (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D]
    (n : ℕ) :
    qNabla T PUnit.unit (coord T PUnit.unit ^ n) =
      algebraMap T.D (E T PUnit) (qNumber T.q n) * coord T PUnit.unit ^ n := by
  sorry

/-- Unit test `LogQDeRham.empty` (degenerate; node `PR.8/log-q-de-rham-complex`): For S = ∅ the
complex is E_N in degree 0. -/
example (T : LogQPDTriple.{u} p) :
    ∀ i : ℕ, 0 < i → Limits.IsZero ((complex T PEmpty).X i) := by
  sorry


end LogQDeRham

/-! ## Node `PR.8/semistable-aomega-comparison` (theorem): Comparison with semistable AΩ -/

/-- Placeholder carrier (owner `AInfCohomology:AI.6`): semistable formal schemes over `O_C` in the
sense of ČK19 (with their canonical log structure). -/
def SemistableOverOC (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder (owner `AInfCohomology:AI.6`): the prelog `q`-PD triple
`(A_inf, (ξ), O_C♭ ∖ {0})`. -/
noncomputable def ainfQPDTriple (p : ℕ) [Fact p.Prime] : LogQPDTriple.{u} p := sorry

/-- The scheme of a semistable formal scheme over the triple `ainfQPDTriple`. -/
noncomputable def SemistableOverOC.toScheme {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    (ainfQPDTriple.{u} p).SmoothScheme := sorry

/-- Placeholder (owner `AInfCohomology:AI.6`): `RΓ(X_ét, AΩ_X)`, ČK's semistable
`A_inf`-cohomology. -/
noncomputable def aOmega {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    DerivedCategory (ModuleCat.{u} (ainfQPDTriple.{u} p).D) := sorry

/-- **Node `PR.8/semistable-aomega-comparison`** (theorem): Comparison with semistable AΩ.

Let k be algebraically closed of characteristic p, C the completed algebraic closure of W(k)[1/p],
and X a p-adic formal scheme over O_C that is étale locally étale over O_C⟨t_0, …, t_r,
t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) for a nonzero non-unit π ∈ O_C, with its canonical log
structure M_X (Česnavičius–Koshikawa 1.6). Then there is an isomorphism
qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X in D(X_ét, A_inf) compatible with Frobenius, where the left
side is formed over the prelog q-PD triple (A_inf, (ξ), O_C♭∖{0}) and the right side is ČK's
semistable A_inf-cohomology. Since the mod p fibre is of Cartier type, qΩ is the (p, μ)-completed
base change of Δ_{(X,M_X)/(A_inf,O_C♭∖{0})} along φ_{A_inf}; hence (φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf,
O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X).

Hypotheses (packet): Semistable formal scheme over O_C in the sense of ČK19, with nonzero non-unit
chart parameter π; C algebraically closed; compatible roots fixed as in ČK19 §1.5.

Lean form: on global sections in `D(A_inf)`; Frobenius compatibility and the description through
`φ^*` of log prismatic cohomology are not typed. -/
theorem semistable_aOmega {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    Nonempty (LogQCrystallineSite.qOmega (ainfQPDTriple.{u} p) X.toScheme ≅ aOmega X) := by
  sorry

/-! ## Node `PR.8/semistable-crys-bdr-diagram` (theorem): The semistable C_st comparison diagram -/


/-! ## Node `PR.8/breuil-kisin-log-cohomology` (construction): Breuil–Kisin cohomology of semistable formal schemes -/

namespace BreuilKisinLogCohomology

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owners `CrystallineCohomology:CR.5:log-algebra`, AI.6): qcqs semistable
formal schemes over `O_K = W(k)⟦u⟧/(E)` with their canonical log structure, as smooth log formal
schemes over a Breuil–Kisin base. -/
def Semistable {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    (B : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying smooth log formal scheme. -/
noncomputable def Semistable.toSmooth {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    {B : IntegralBoundedPrelogPrism p A M} (X : Semistable B) : SmoothLogFormalScheme B := sorry

end BreuilKisinLogCohomology

/-- The Breuil–Kisin prelog prism `PrelogPrism.breuilKisin` as an integral bounded prelog prism
(the monoid `ℕ` lifted to the universe of the ring). -/
noncomputable def IntegralBoundedPrelogPrism.breuilKisin {p : ℕ} [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (E : Polynomial (WittVector p k))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) (hb : P.IsBounded) :
    IntegralBoundedPrelogPrism p (PowerSeries (WittVector p k)) (Multiplicative (ULift.{u} ℕ)) :=
  sorry

/-- **Node `PR.8/breuil-kisin-log-cohomology`** (construction): Breuil–Kisin cohomology of
semistable formal schemes.

Let K be a totally ramified finite extension of W(k)[1/p] with uniformiser π and X a qcqs semistable
formal scheme over O_K with canonical log structure M_X. Define RΓ_BK(X) := RΓ_Δ((X,
M_X)/(W(k)[[u]], N)) over the Breuil–Kisin prelog prism. Then (A_inf ⊗^L_{W(k)[[u]]}
RΓ_BK(X))^∧_(p,ξ) ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})), which together with the semistable AΩ
comparison is a Breuil–Kisin descent of the A_inf-cohomology of X_{O_C}; if X is proper, RΓ_BK(X) is
perfect and the base change holds without completion. Its Frobenius is φ-semilinear over u ↦ u^p,
and over (W(k)[[u]], N) the Frobenius is an isogeny when the mod p fibre is of Cartier type.

Hypotheses (packet): X qcqs semistable over O_K; canonical log structure M_X = (O_X[1/p])^× ∩ O_X.

API `BreuilKisinLogCohomology` (constructor; node `PR.8/breuil-kisin-log-cohomology`): RΓ_BK(X) :=
RΓ_Δ((X, M_X)/(W(k)[[u]], N)).

Lean form: over any integral bounded base (the packet's base is
`IntegralBoundedPrelogPrism.breuilKisin`), `RΓ_BK(X) = RΓ_Δ((X, M_X)/(W(k)⟦u⟧, ℕ))`. -/
noncomputable def BreuilKisinLogCohomology {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] (B : IntegralBoundedPrelogPrism p A M)
    (X : BreuilKisinLogCohomology.Semistable B) : DerivedCategory (ModuleCat.{u} A) :=
  LogPrismaticSite.cohomology B X.toSmooth

namespace BreuilKisinLogCohomology

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- API `BreuilKisinLogCohomology.toAinf` (compatibility; node `PR.8/breuil-kisin-log-cohomology`):
(A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})).

Lean form: along a map of bases `f` to an `A_inf` base, `(A_inf ⊗^L RΓ_BK(X))^∧ ≅ RΓ_Δ` of the base
change. -/
theorem toAinf (B : IntegralBoundedPrelogPrism p A M) (X : Semistable B) {A' : Type u}
    [CommRing A'] {M' : Type u} [CommMonoid M'] (B' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom B B') :
    Nonempty ((completedExtendScalars f.toHom.ring B'.pI).obj
        (BreuilKisinLogCohomology B X) ≅
      LogPrismaticSite.cohomology B' (X.toSmooth.baseChange f)) := by
  sorry


/-- API `BreuilKisinLogCohomology.frobenius` (structure; node `PR.8/breuil-kisin-log-cohomology`):
The φ-semilinear Frobenius over u ↦ u^p. -/
noncomputable def frobenius (B : IntegralBoundedPrelogPrism p A M) (X : Semistable B) :
    BreuilKisinLogCohomology B X ⟶
      (frobeniusPushforward B.toPrism).obj (BreuilKisinLogCohomology B X) :=
  LogPrismaticSite.frobenius B X.toSmooth

/-- `Spf(O_K)` with `M_X = O_K ∖ {0}` is the base point. -/
noncomputable def Semistable.point (B : IntegralBoundedPrelogPrism p A M) : Semistable B := sorry

theorem Semistable.point_toSmooth (B : IntegralBoundedPrelogPrism p A M) :
    (Semistable.point B).toSmooth = SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base B) := by
  sorry

/-- Unit test `BreuilKisinLogCohomology.point` (degenerate; node
`PR.8/breuil-kisin-log-cohomology`): For X = Spf(O_K) with M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]]. -/
example (B : IntegralBoundedPrelogPrism p A M) :
    Nonempty (BreuilKisinLogCohomology B (Semistable.point B) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry


end BreuilKisinLogCohomology


/-! ## Node `PR.8/log-quasisyntomic-site` (definition): The log quasisyntomic site -/

namespace LogQSyn

/-- **Node `PR.8/log-quasisyntomic-site`** (definition): The log quasisyntomic site.

A map of pre-log rings A → B is p-completely homologically log flat (resp. faithfully flat) if B
⊗^L_A A/p ≅ B/p is discrete and (A/p, M_A) → (B/p, M_B) is homologically log flat (resp.
homologically log faithfully flat) in the sense supplied by DD.6 (B′ ⊕^L_A B ≅ B′ ⊕_A B for all A →
B′, plus faithful flatness of rings). A pre-log ring (A, M_A) is quasisyntomic if A is p-complete
with bounded p^∞-torsion and the Gabber log cotangent complex L_{(A,M_A)/Z_p} has p-complete Tor
amplitude in [−1, 0]. A map A → B of p-complete pre-log rings with bounded p^∞-torsion is
quasisyntomic (resp. a quasisyntomic cover) if it is p-completely homologically log flat (resp.
faithfully flat) and L_{B/A} ⊗^L_B B/p has Tor amplitude in [−1, 0]. QSyn^prelog is the category of
quasisyntomic pre-log rings; its opposite is a site with quasisyntomic covers. For (R, M) p-complete
with bounded p^∞-torsion, qSyn_{(R,M)} is the small site of quasisyntomic maps (R, M) → (S, N); for
perfectoid quasisyntomic (R, M), QSyn_{(R,M)} is the slice. On these sites the p-completion of ∧^i
L_{(S,N)/(R,M)}[−i] lies in D^{≥0}(S).

Hypotheses (packet): Gabber's log cotangent complex and homologically log flat maps as supplied by
DD.6. For trivial pre-log structures one recovers BMS2's quasisyntomic site (DD.5).

API `LogQSyn.site` (constructor; node `PR.8/log-quasisyntomic-site`): The site QSyn^{prelog,op} with
quasisyntomic covers, and its small variant qSyn_{(R,M)}.

Placeholder carrier (node `PR.8/log-quasisyntomic-site`, with DD.6's Gabber log cotangent complex):
the category `QSyn^{prelog,op}`; its quasisyntomic topology is `LogQSyn.topology` and the small
variant `qSyn_{(R,M)}` is `LogQSyn.smallSite`. -/
def site (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (site.{u} p) := sorry

/-- The quasisyntomic topology on `QSyn^{prelog,op}`. -/
noncomputable def topology (p : ℕ) [Fact p.Prime] : GrothendieckTopology (site.{u} p) := sorry

/-- Placeholder (node `PR.8/log-quasisyntomic-site`): the small site `qSyn_{(R,M)}` of
quasisyntomic maps out of a `p`-complete pre-log ring with bounded `p^∞`-torsion. -/
def smallSite (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u} [CommMonoid M]
    (α : M →* R) : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u}
    [CommMonoid M] (α : M →* R) : Category.{u} (smallSite p α) := sorry

/-- The quasisyntomic topology on `qSyn_{(R,M)}`. -/
noncomputable def smallTopology (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u}
    [CommMonoid M] (α : M →* R) : GrothendieckTopology (smallSite p α) := sorry


end LogQSyn

/-! ## Node `PR.8/log-qrsp` (definition): Quasiregular semiperfectoid pre-log rings -/

namespace LogQRSP

variable {p : ℕ} [Fact p.Prime]

/-- **Node `PR.8/log-qrsp`** (definition): Quasiregular semiperfectoid pre-log rings.

A p-complete pre-log ring S = (S, M) is semiperfectoid if (1) there is a ring map R → S from a
perfectoid ring; (2) S/p is semiperfect; (3) the natural map M♭ → M/M^× is surjective. It is
quasiregular semiperfectoid if moreover (4) S is quasisyntomic. QRSPerfd^prelog denotes the category
of quasiregular semiperfectoid pre-log rings. Conditions (2)–(3) (log-semiperfect) imply L_{(S,M)/R}
⊗^L S/p ∈ D^{≤−1}(S/p) for any R → S; for S quasiregular semiperfectoid, L̂_{(S,M)/Z_p}[−1] is
p-completely flat. Equivalently (when S/p is log-semiperfect, S p-complete with bounded
p^∞-torsion), S ∈ QRSPerfd^prelog iff for some (equivalently every) perfectoid R → S, L_{(S,M)/R}
⊗^L S/p has Tor amplitude in degree −1.

Hypotheses (packet): p-complete pre-log rings; perfectoid in the sense of BMS1.

API `LogQRSP.IsSemiperfectoid` (other; node `PR.8/log-qrsp`): Conditions (1)–(3).

Lean form: `S` is `p`-adically complete, receives a ring map from a perfectoid ring (placeholder
`PerfectoidRing`, Q0), `S / p` is semiperfect (every element is a `p`-th power) and `M♭ → M / Mˣ` is
surjective. -/
def IsSemiperfectoid (S : Type u) [CommRing S] {M : Type v} [CommMonoid M] (α : M →* S) : Prop :=
  IsAdicComplete (Ideal.span {(p : S)}) S ∧
    (∃ R : PerfectoidRing.{u} p, Nonempty (R.carrier →+* S)) ∧
    (∀ x : S ⧸ Ideal.span {(p : S)}, ∃ y, y ^ p = x) ∧
    Function.Surjective (fun x : Monoid.tilt M p => Associates.mk (Perfection.coeffMonoidHom M p 0 x))


/-- Placeholder (node `PR.8/log-qrsp`): the ring `R ⊗̂ W(S♭) ⊗̂ ℤ_p⟨M♭⟩` of Remark 3.13. -/
def PerfectoidCoverRing (S : Type u) [CommRing S] {M : Type u} [CommMonoid M] (α : M →* S)
    (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) : Type u := sorry

noncomputable instance (S : Type u) [CommRing S] {M : Type u} [CommMonoid M] (α : M →* S)
    (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) : CommRing (PerfectoidCoverRing S α R f) :=
  sorry

/-- API `LogQRSP.perfectoidCover` (constructor; node `PR.8/log-qrsp`): The map (R ⊗̂ W(S♭) ⊗̂
Z_p⟨M♭⟩, M♭) → (S, M) of Remark 3.13.

Lean form: the ring map; on monoids the map is `M♭ → M`. -/
noncomputable def perfectoidCover (S : Type u) [CommRing S] {M : Type u} [CommMonoid M]
    (α : M →* S) (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) :
    PerfectoidCoverRing S α R f →+* S := sorry

/-- API `LogQRSP.quotient_monoid` (relation; node `PR.8/log-qrsp`): Condition (3) passes to quotient
monoids and pushouts (Remark 3.14).

Lean form: the quotient-monoid half: condition (3) passes along a surjective monoid map. -/
theorem quotient_monoid {M N : Type*} [CommMonoid M] [CommMonoid N] (f : M →* N)
    (hf : Function.Surjective f)
    (h : Function.Surjective
      (fun x : Monoid.tilt M p => Associates.mk (Perfection.coeffMonoidHom M p 0 x))) :
    Function.Surjective
      (fun x : Monoid.tilt N p => Associates.mk (Perfection.coeffMonoidHom N p 0 x)) := by
  sorry

/-- Unit test `LogQRSP.log_line_not` (non-example; node `PR.8/log-qrsp`): (Z_p⟨T⟩, T^N) is
quasisyntomic but not semiperfectoid: N♭ = 0 does not surject onto N.

Lean form of the second assertion: `(ℤ_p⟨T⟩, T^ℕ)` (`ConvergentPoly p ℤ_[p]`) is not semiperfectoid.
-/
example :
    ¬ IsSemiperfectoid (p := p) (ConvergentPoly p ℤ_[p])
      (powersHom _ (algebraMap (Polynomial ℤ_[p]) (ConvergentPoly p ℤ_[p]) Polynomial.X)) := by
  sorry


end LogQRSP

/-! ## Node `PR.8/log-qrsp-basis` (theorem): Quasiregular semiperfectoid pre-log rings form a basis -/


/-! ## Node `PR.8/derived-log-prismatic` (construction): Derived log prismatic cohomology -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The log-free prelog algebra `Σ_{S,T} = (Ā⟨(X_s)_{s ∈ S}, ℕ^T⟩, M_A ⊕ ℕ^T)` (restricted power
series; recorded opaquely). -/
noncomputable def logFree (P : IntegralBoundedPrelogPrism p A M) (S T : Type u) [Finite S]
    [Finite T] : PrelogAlgebra P := sorry

/-- The prelog algebra `(Ā, M_A ⊕ ℕ)` with `ℕ → Ā`, `1 ↦ 0`. -/
noncomputable def zeroLogPoint (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := P.bar
  Q := M × Multiplicative ℕ
  α := P.barα.coprod (powersHom _ 0)
  structureMap := MonoidHom.inl M (Multiplicative ℕ)
  comm _ := by sorry

end PrelogAlgebra

/-- **Node `PR.8/derived-log-prismatic`** (construction): Derived log prismatic cohomology.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. On the log-free pre-log rings Σ_{S,T} :=
(A/I⟨(X_s)_{s∈S}, N^T⟩, M_A ⊕ N^T) (S, T finite) consider Σ_{S,T} ↦ Δ_{Σ_{S,T}/(A,M_A)} :=
RΓ_Δ(Spf(Σ_{S,T})^a/(A, M_A)), a (p, I)-complete commutative algebra in D(A) with φ_A-semilinear
Frobenius. The derived log prismatic cohomology (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is its left Kan
extension (animation) to all simplicial (animated) pre-log rings over (A/I, M_A), followed by (p,
I)-completion; it depends only on the derived p-completion of (R, P); Δ̄^L := Δ^L ⊗^L_A A/I. For a
log p-adic formal scheme (X, M_X) over (A/I, M_A), the étale sheaf Δ^L_{(X,M_X)/(A,M_A)} is the (p,
I)-complete étale sheafification of U = Spf(R) ↦ Δ^L_{(R,Γ(U,M_X))/(A,M_A)}; similarly Δ̄^L and the
conjugate filtration.

Hypotheses (packet): Animated pre-log rings as supplied by DD.6 (KY Remark 2.8) built on EDS
E5:animation; (A, I, M_A) bounded with integral monoid.

API `DerivedLogPrismatic` (constructor; node `PR.8/derived-log-prismatic`): The functor (R, P) ↦
Δ^L_{(R,P)/(A,M_A)} on animated pre-log (A/I, M_A)-algebras, with Frobenius.

Placeholder (node `PR.8/derived-log-prismatic`): `Δ^L_{(R,P)/(A,M_A)}` in `D(A)` for discrete prelog
algebras; the animated extension (EnhancedDerivedSheaves E5) and the Frobenius are not typed. -/
noncomputable def DerivedLogPrismatic {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- API `DerivedLogPrismatic.reduced` (constructor; node `PR.8/derived-log-prismatic`): Δ̄^L := Δ^L
⊗^L_A A/I. -/
noncomputable def reduced (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} P.bar) :=
  (derivedExtendScalars (Ideal.Quotient.mk P.toPrism.I)).obj (DerivedLogPrismatic P X)

/-- API `DerivedLogPrismatic.onFree` (characterisation; node `PR.8/derived-log-prismatic`): On
Σ_{S,T}, Δ^L agrees with the site-theoretic log prismatic cohomology. -/
theorem onFree (P : IntegralBoundedPrelogPrism p A M) (S T : Type u) [Finite S] [Finite T] :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.logFree P S T) ≅
      LogPrismaticSite.affineCohomology P (PrelogAlgebra.logFree P S T)) := by
  sorry


/-- API `DerivedLogPrismatic.sheaf` (constructor; node `PR.8/derived-log-prismatic`): The étale
sheaf Δ^L_{(X,M_X)/(A,M_A)} on a log p-adic formal scheme. -/
noncomputable def sheaf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    X.EtaleDerived A := sorry

/-- Maps of prelog algebras over `(Ā, M_A)`: an `Ā`-algebra map and a monoid map under `M_A`
compatible with the prelog structures. -/
structure _root_.TauCeti.LogPrismatic.PrelogAlgebra.Hom {P : IntegralBoundedPrelogPrism p A M}
    (X Y : PrelogAlgebra P) where
  /-- The ring map. -/
  ring : X.R →ₐ[P.bar] Y.R
  /-- The monoid map. -/
  monoid : X.Q →* Y.Q
  comm_alpha : ∀ q, Y.α (monoid q) = ring (X.α q)
  comm_structureMap : monoid.comp X.structureMap = Y.structureMap

/-- API `DerivedLogPrismatic.map` (functoriality; node `PR.8/derived-log-prismatic`): Functoriality
in (R, P) and in maps of bounded prelog prisms.

Lean form: functoriality in `(R, P)`; functoriality in maps of bounded prelog prisms is base change
and is not typed here. -/
noncomputable def map (P : IntegralBoundedPrelogPrism p A M) {X Y : PrelogAlgebra P}
    (f : PrelogAlgebra.Hom X Y) : DerivedLogPrismatic P X ⟶ DerivedLogPrismatic P Y := sorry

/-- Unit test `DerivedLogPrismatic.free_logLine` (computation; node `PR.8/derived-log-prismatic`):
For (A/I⟨N⟩, M_A ⊕ N), Δ̄^L has H^0 = A/I⟨X⟩ and H^1{1} free on dlog X.

Lean form: for an orientable base (trivial Breuil–Kisin twist), as `A/I`-modules. -/
example (P : IntegralBoundedPrelogPrism p A M) (ho : P.toPrism.IsOrientable) :
    Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        (reduced P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of P.bar (PrelogAlgebra.logAffineLine P).R) ∧
    Nonempty ((DerivedCategory.homologyFunctor _ 1).obj
        (reduced P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of P.bar (PrelogAlgebra.logAffineLine P).R) := by
  sorry

/-- Unit test `DerivedLogPrismatic.base` (degenerate; node `PR.8/derived-log-prismatic`): For (R, P)
= (A/I, M_A), Δ^L = A. -/
example (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.base P) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-- Unit test `DerivedLogPrismatic.trivialLog` (compatibility; node `PR.8/derived-log-prismatic`):
For P = M_A pulled back from the base, Δ^L_{(R,M_A)/(A,M_A)} ≅ BS22's Δ_{R/A} (PR.2). -/
example (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.strict P R) ≅
      prismaticCohomology P.toPrism R) := by
  sorry

/-- Unit test `DerivedLogPrismatic.zeroLog_not_discrete` (non-example; node
`PR.8/derived-log-prismatic`): For (R, P) = (A/I, N → 0) over trivial M_A, Δ̄^L is not concentrated
in degree 0: its conjugate filtration has graded pieces ∧^i L_{(A/I,N)/(A/I)}{−i}[−i] and
L_{(A/I,N)/(A/I)} lives in degrees [−1, 0] (KY Example 2.30). -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    [Nontrivial P.bar] :
    ∃ i : ℤ, i ≠ 0 ∧ ¬ Limits.IsZero ((DerivedCategory.homologyFunctor _ i).obj
      (reduced P (PrelogAlgebra.zeroLogPoint P))) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-log-hodge-tate` (theorem): Derived log Hodge–Tate comparison -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/derived-log-hodge-tate`): `gr_i` of the conjugate filtration of
`Δ̄^L_{(R,P)/(A,M_A)}`. -/
noncomputable def conjugateGraded (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): the twisted derived exterior power
`∧^i L_{(R,P)/(Ā,M_A)}{−i}` of Gabber's log cotangent complex, viewed in `D(Ā)`. -/
noncomputable def logCotangentWedge (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/derived-log-hodge-tate`** (theorem): Derived log Hodge–Tate comparison.

For a simplicial pre-log ring (R, P) over (A/I, M_A), there is an increasing exhaustive
multiplicative filtration Fil_• Δ̄_{(R,P)/(A,M_A)} (the conjugate filtration) by derived p-complete
objects with gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p. Globally, gr_i
Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i].

Hypotheses (packet): (A, I, M_A) bounded with M_A integral.

Lean form: the graded pieces for a discrete prelog algebra; the filtration itself, its
multiplicativity and the global form are not typed. -/
theorem conjugateGraded_iso (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    Nonempty (conjugateGraded P X i ≅ (derivedCompletion (Ideal.span {(p : P.bar)})).obj
      ((shiftFunctor (DerivedCategory (ModuleCat.{u} P.bar)) (-(i : ℤ))).obj
        (logCotangentWedge P X i))) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-log-properties` (theorem): Basic properties of derived log prismatic cohomology -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/derived-log-properties`** (theorem): Basic properties of derived log prismatic
cohomology.

Let (A, I, M_A) be a bounded prelog prism with M_A integral. (1) For every derived p-complete
simplicial ring R over A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)} (strict pull-back of the base log
structure). (2) Δ^L is invariant under passing to the associated log ring: Δ^L_{(R,P)/(A,M_A)} ≅
Δ^L_{(R,P)^a/(A,M_A)}. (3) Base change: for a map of bounded prelog prisms (A, I, M_A) → (A′, IA′,
M_{A′}) and (R′, P′) the homotopy base change, Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅
Δ^L_{(R′,P′)/(A′,M_{A′})}. (4) Multiplicativity: for the homotopy cofibre product (R_3, P_3) of
(R_1, P_1), (R_2, P_2) over (A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3, compatibly with conjugate filtrations
(Day convolution); Δ^L_{−/(A,M_A)} commutes with all colimits. (5) For (A/I, M_A) perfectoid or
pseudo-perfectoid, Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}.

Hypotheses (packet): As in derived-log-prismatic.

Lean form of part (1) (strict pull-back of the base log structure gives PR.0's shared carrier
`prismaticCohomology`); parts (2)–(5) are not typed (associated log rings of animated pre-log rings,
homotopy base change and cofibre products, perfectoid bases). -/
theorem strict_eq (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] :
    Nonempty (prismaticCohomology P.toPrism R ≅ DerivedLogPrismatic P (PrelogAlgebra.strict P R)) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-vs-site` (theorem): Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/derived-vs-site`** (theorem): Derived and site-theoretic log prismatic cohomology
agree for smooth log formal schemes.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). (1) For every
affine U = Spf(R) in X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ). (2) If P →
Γ(U, M_X) is a smooth chart, Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U); in particular for X =
Spf(R) with smooth chart M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A)) compatibly with
Hodge–Tate maps. Hence Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}),
Δ̄^L ≅ Rν_*Ō_Δ, and the derived conjugate filtration is the canonical filtration τ_{≤i}Δ̄.

Hypotheses (packet): (X, M_X) smooth in Koshikawa's sense over a bounded prelog prism with integral
monoid.

Lean form of (2) for `X = Spf(R)` with a smooth chart; the sheaf-level assertions are not typed. -/
theorem eq_site (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P) :
    Nonempty (DerivedLogPrismatic P X.toPrelogAlgebra ≅
      LogPrismaticSite.affineCohomology P X.toPrelogAlgebra) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/log-quasisyntomic-descent` (theorem): Log quasisyntomic descent -/


/-! ## Node `PR.8/initial-log-prism-qrsp` (theorem): Initial log prisms of semiperfectoid pre-log rings -/


/-! ## Node `PR.8/log-nygaard-filtration` (construction): The log Nygaard filtration -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- `Δ^{L,(1)} = Δ^L ⊗̂^L_{A, φ_A} A`. -/
noncomputable def frobeniusTwisted (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) :=
  (completedExtendScalars P.toPrism.φ P.pI).obj (DerivedLogPrismatic P X)

/-- Placeholder (derived tensor product, owner `EnhancedDerivedSheaves`): `I^i ⊗^L_A −`. -/
noncomputable def idealTwist (P : IntegralBoundedPrelogPrism p A M) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

/-- **Node `PR.8/log-nygaard-filtration`** (construction): The log Nygaard filtration.

Let (A, I, M_A) be an integral bounded prelog prism and write Δ^(1)_{(R,P)/(A,M_A)} :=
Δ_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ_A} A. For the non-log local setup of KY §5.2 take A_0 = A⟨X_1,…,X_d⟩
with δ(X_i)=0 and R = A_0/(I,f_1,…,f_r), where the f_i form a p-completely regular sequence relative
to A/I, and assume ∆^(1)_{R/A_0} is (p,I)-completely flat (Assumption 5.3). In this setup the
Nygaard filtration is Fil^i_N Δ^(1)_{R/A_0} = {x : φ_{R/A_0}(x) ∈ I^iΔ_{R/A_0}} (Definition 5.5).
For the log-free algebra (R, P) = (A/I⟨N^S⟩, M_A ⊕ N^S), choose a surjection M_A ⊕ N → M_A ⊕ N^S,
exactify it (Construction 5.11) to obtain non-log prismatic cohomologies over the non-perfect base
prisms Ã^•_∞ obtained by extracting p-power roots (Construction 5.9), and define Fil^i_N
Δ^(1)_{(R,P)/(A,M_A)} as the totalisation of Fil^i_N Δ_{(A/I)^•/Ã^•_∞} ⊗̂^L_{Ã^•_∞,φ} Ã^•_∞
(Definition 5.13), independent of the choice; extend to Σ_{S,T} by Day convolution with BS22's
Nygaard filtration. Left Kan extension gives the derived Nygaard filtration Fil^•_N
Δ^{L,(1)}_{(R,P)/(A,M_A)} on all simplicial pre-log rings, with a filtered Frobenius φ: Fil^•_N
Δ^{L,(1)} → I^•Δ^L and maps I ⊗ Fil^{•−1}_N → Fil^•_N; étale sheafification gives the global Nygaard
filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} (Constructions 5.25–5.26). It is multiplicative.

Hypotheses (packet): (A, I, M_A) integral bounded prelog prism; animated pre-log rings (DD.6). The
displayed non-log preimage formula is restricted to the §5.2 regular-presentation setup and
Assumption 5.3; Proposition 5.7 gives its completed flat base-change compatibility, rather than
defining it for arbitrary flat maps.

API `LogNygaard.fil` (constructor; node `PR.8/log-nygaard-filtration`): The decreasing
multiplicative filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} by (p, I)-complete objects.

Placeholder (node `PR.8/log-nygaard-filtration`): `Fil^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)}` for discrete
prelog algebras. -/
noncomputable def fil (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- The transition maps `Fil^{i+1}_N → Fil^i_N`. -/
noncomputable def fil.map (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    fil P X (i + 1) ⟶ fil P X i := sorry

/-- API `LogNygaard.frobenius` (data; node `PR.8/log-nygaard-filtration`): The filtered Frobenius φ:
Fil^i_N Δ^{L,(1)} → I^iΔ^L. -/
noncomputable def frobenius (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    fil P X i ⟶ (idealTwist P i).obj (DerivedLogPrismatic P X) := sorry

/-- API `LogNygaard.mulI` (data; node `PR.8/log-nygaard-filtration`): The maps I ⊗^L Fil^{i−1}_N →
Fil^i_N (Construction 5.21). -/
noncomputable def mulI (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    (idealTwist P 1).obj (fil P X i) ⟶ fil P X (i + 1) := sorry


/-- API `LogNygaard.flatBaseChange` (functoriality; node `PR.8/log-nygaard-filtration`): Formation
of Fil^•_N commutes with (p, I)-completely flat base change on A.

Lean form: "`(p, I)`-completely flat" is replaced by flat (Mathlib `RingHom.Flat`), a stronger
hypothesis. -/
theorem flatBaseChange (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ)
    {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M'] (P' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom P P') (hf : f.toHom.ring.Flat) :
    Nonempty ((completedExtendScalars f.toHom.ring P'.pI).obj (fil P X i) ≅
      fil P' (X.baseChange f) i) := by
  sorry

/-- API `LogNygaard.sheaf` (constructor; node `PR.8/log-nygaard-filtration`): The global Nygaard
filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} by étale sheafification. -/
noncomputable def sheaf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P)
    (i : ℕ) : X.EtaleDerived A := sorry


/-- Unit test `LogNygaard.fil0` (degenerate; node `PR.8/log-nygaard-filtration`): Fil^0_N Δ^{L,(1)}
= Δ^{L,(1)}. -/
example (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    Nonempty (fil P X 0 ≅ frobeniusTwisted P X) := by
  sorry


end LogNygaard

/-! ## Node `PR.8/log-nygaard-graded` (theorem): Graded pieces of the log Nygaard filtration -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/log-nygaard-filtration`): `gr^i_N Δ^{L,(1)}`. -/
noncomputable def graded (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/derived-log-hodge-tate`): `Fil_i Δ̄^L{i}`, the twisted conjugate
filtration step. -/
noncomputable def conjugateFilTwist (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/log-nygaard-graded`** (theorem): Graded pieces of the log Nygaard filtration.

Let (A, I, M_A) be an integral bounded prelog prism and (R, P) a simplicial pre-log ring over (A/I,
M_A). The Frobenius induces an isomorphism gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i
Δ̄^L_{(R,P)/(A,M_A)}{i}, where Fil_i is the conjugate filtration. For Σ_{S,T} this reads gr^i_N
Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}; globally gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i
Δ̄^L_{(X,M_X)}{i}, and for (X, M_X) smooth over (A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅
τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}.

Hypotheses (packet): As in log-nygaard-filtration; smoothness for the last assertion.

Lean form: `gr^i_N Δ^{L,(1)} ≅ Fil_i Δ̄^L{i}` in `D(A)` (restriction of scalars along `A → A/I`);
the smooth form with `τ_{≤i}` is not typed. -/
theorem graded_iso (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    Nonempty (graded P X i ≅ (ModuleCat.restrictScalars
      (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj (conjugateFilTwist P X i)) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/nygaard-hodge-fiber-sequence` (theorem): The Nygaard–Hodge fibre sequence and Nygaard completeness -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): `Fil^i_H LΩ̂_{(R,P)/(Ā,M_A)}`, the Hodge
filtration of the `p`-completed derived log de Rham complex. -/
noncomputable def hodgeFilteredLogDeRham (P : IntegralBoundedPrelogPrism p A M)
    (X : PrelogAlgebra P) (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/nygaard-hodge-fiber-sequence`** (theorem): The Nygaard–Hodge fibre sequence and
Nygaard completeness.

For a simplicial pre-log ring (R, P) over (A/I, M_A) there is a functorial fibre sequence I ⊗^L_A
Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)} of filtered objects, the
second map being the derived de Rham specialisation γ^• (Construction 5.21, Lemma 5.22). Globally on
X_ét it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If
(X, M_X) is smooth over (A/I, M_A) with mod p fibre of Cartier type, the right term becomes
Ω^{≥•}_{(X,M_X)/(A/I,M_A)}; if moreover X is qcqs and Ω^1_log has finite rank D, then for i ≥ 0 and
j ≥ D the maps RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1)) are isomorphisms and RΓ(X_ét,
Δ^(1)) is complete for the Nygaard filtration.

Hypotheses (packet): Derived log de Rham with Hodge filtration from DD.6; Cartier type and finite
rank for the last assertions.

Lean form: for each `i` a distinguished triangle `I ⊗^L Fil^i_N → Fil^{i+1}_N → Fil^{i+1}_H LΩ̂ →`
in `D(A)` whose first map is `mulI`; the global, Cartier-type and completeness assertions are not
typed. -/
theorem fiberSequence (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    ∃ (g : fil P X (i + 1) ⟶ (ModuleCat.restrictScalars
          (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
            (hodgeFilteredLogDeRham P X (i + 1)))
      (h : (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
            (hodgeFilteredLogDeRham P X (i + 1)) ⟶
          (shiftFunctor (DerivedCategory (ModuleCat.{u} A)) (1 : ℤ)).obj
            ((idealTwist P 1).obj (fil P X i))),
      Pretriangulated.Triangle.mk (mulI P X i) g h ∈ Pretriangulated.distinguishedTriangles := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-l-eta-factorization` (theorem): The Lη_I factorisation of Frobenius -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `AInfCohomology:AI.1`, through PR.3): the décalage functor `Lη_I` on `D(A)`. -/
noncomputable def decalage (P : IntegralBoundedPrelogPrism p A M) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

/-- **Node `PR.8/log-l-eta-factorization`** (theorem): The Lη_I factorisation of Frobenius.

Let (A, I, M_A) be bounded with M_A integral. (1) If (R, P) is p-complete with bounded p^∞-torsion
and M_A → P a smooth chart, then gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i} and the Frobenius factors as Δ^L
⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L; if M_A → P is of Cartier type, Δ^{L,(1)} → Lη_IΔ^L is an
isomorphism identifying the Nygaard filtration with the truncations of the I-adic filtration for the
Beilinson t-structure. (2) For (X, M_X) smooth over (A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U)) is a sheaf
on the affine étale site, defining Lη_IΔ_{(X,M_X)/(A,M_A)}; if the mod p fibre is of Cartier type,
Frobenius induces an isomorphism of étale sheaves Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)},
and RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A)) for affine U.

Hypotheses (packet): Smooth charts; Cartier type of the chart (1) or of the mod p fibre (2); Lη_I as
supplied by AI.1 through PR.3.

Lean form of (1) for a smooth chart of Cartier type (placeholder `CartierTypePrelogAlgebra`, CR.5):
`Δ^{L,(1)} ≅ Lη_I Δ^L`; the factorisation in general and the sheaf statement (2) are not typed. -/
theorem lEta (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypePrelogAlgebra P) :
    Nonempty (frobeniusTwisted P X.toSmooth.toPrelogAlgebra ≅
      (decalage P).obj (DerivedLogPrismatic P X.toSmooth.toPrelogAlgebra)) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-de-rham-comparison` (theorem): The log de Rham comparison -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `CrystallineCohomology:CR.5:log-algebra`): the `p`-completed log de Rham
complex `Ω̂^•_{(R,P)/(Ā,M_A)}` in `D(Ā)`. -/
noncomputable def logDeRham (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/log-de-rham-comparison`** (theorem): The log de Rham comparison.

(1) If P → R is a smooth chart of Cartier type over (A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅
Ω̂^•_{(R,P)/(A/I,M_A)} as E_∞-algebras in D(A/I). (2) For every simplicial pre-log ring (R, P) over
(A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p-completed derived log de Rham). (3) For
(X, M_X) smooth over (A/I, M_A) with mod p fibre of Cartier type, Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A}
A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)} as étale sheaves, and for qcqs X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅
RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I as E_∞-A-algebras.

Hypotheses (packet): (A, I, M_A) is bounded with M_A integral. Cartier type is required for the
smooth-chart clause (1) and the mod-p fibre in the global smooth clause (3); clause (2) applies to
every animated pre-log algebra without a Cartier-type assumption.

Lean form of (1): `Δ^L ⊗̂^L_{A, φ} A/I ≅ Ω̂^•_log` in `D(A/I)` for a smooth chart of Cartier type;
the `E_∞` structure, (2) and (3) are not typed. -/
theorem deRhamComparison (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypePrelogAlgebra P) :
    Nonempty ((completedExtendScalars ((Ideal.Quotient.mk P.toPrism.I).comp P.toPrism.φ)
        (Ideal.span {(p : P.bar)})).obj (DerivedLogPrismatic P X.toSmooth.toPrelogAlgebra) ≅
      logDeRham P X.toSmooth.toPrelogAlgebra) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-frobenius-isogeny` (theorem): Frobenius is an isogeny -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/log-frobenius-isogeny`): the linearised Frobenius
`RΓ_Δ ⊗̂^L_{A, φ_A} A → RΓ_Δ`. -/
noncomputable def linearizedFrobenius (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) :
    (completedExtendScalars P.toPrism.φ P.pI).obj (LogPrismaticSite.cohomology P X) ⟶
      LogPrismaticSite.cohomology P X := sorry

/-- **Node `PR.8/log-frobenius-isogeny`** (theorem): Frobenius is an isogeny.

Let (X, M_X) be smooth over (A/I, M_A) with mod p fibre of Cartier type. For each i ≥ 0 there are
natural maps V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)} with φ∘V_i and
V_i∘(φ ⊗ 1) equal to the maps induced by I^i ⊂ A. If X is qcqs, V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A
I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A) inverts Frobenius up to I^i; for I = (d) principal, φ∘V_i = V_i∘φ =
d^i. If Ω^1_log has finite rank D, a single V inverts φ up to I^D; in particular the linearised
Frobenius RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ becomes an isomorphism after inverting I.

Hypotheses (packet): Mod p fibre of Cartier type; qcqs for the global maps; finite rank D for the
uniform bound.

Lean form: for `I = (d)` principal and qcqs `X` of Cartier type, on `H^i` there is `V_i` with `φ ∘
V_i = d^i` and `V_i ∘ φ = d^i`; the truncated maps for general `I` and the uniform exponent are not
typed. -/
theorem frobeniusIsogeny (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypeLogFormalScheme P)
    (d : A) (hd : P.toPrism.I = Ideal.span {d}) (i : ℕ) :
    ∃ V : (DerivedCategory.homologyFunctor _ i).obj (LogPrismaticSite.cohomology P X.toSmooth) ⟶
        (DerivedCategory.homologyFunctor _ i).obj
          ((completedExtendScalars P.toPrism.φ P.pI).obj (LogPrismaticSite.cohomology P X.toSmooth)),
      (V ≫ (DerivedCategory.homologyFunctor _ i).map (linearizedFrobenius P X.toSmooth)).hom =
          d ^ i • LinearMap.id ∧
        ((DerivedCategory.homologyFunctor _ i).map (linearizedFrobenius P X.toSmooth) ≫ V).hom =
          d ^ i • LinearMap.id := by
  sorry

end LogNygaard


/-! ## Node `PR.8/kummer-etale-site-log-scheme` (definition): The Kummer étale site of an fs log scheme -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): fs log schemes. -/
def FsLogScheme : Type (u + 1) := sorry

noncomputable instance : Category.{u} FsLogScheme.{u} := sorry

namespace KummerEtale

/-! **Node `PR.8/kummer-etale-site-log-scheme`** (definition): The Kummer étale site of an fs log
scheme.

A homomorphism of fs monoids h: P → Q is of Kummer type if it is injective and every a ∈ Q has a
power a^n (n ≥ 1) in h(P); a morphism f: X → Y of fs log schemes is of Kummer type if M_{Y,f(x)}/O^×
→ M_{X,x}/O^× is of Kummer type for every x. For an fs log scheme X, the Kummer étale site X_két is
the category (fs/X) (or its small variant of Kummer étale X-schemes) with coverings the families
{f_i: U_i → X} of log étale morphisms of Kummer type with X = ∪ f_i(U_i); RΓ_két(X, Λ) is its
cohomology. For a pre-log ring (R[1/p], P) with P saturated (not necessarily fine),
RΓ_két(Spec(R[1/p], P)^a, Λ) := colim_{P_i ⊂ P} RΓ_két(Spec(R[1/p], P_i)^a, Λ), over fine saturated
submonoids P_i (a filtered colimit). Standard covers: for P → Q of Kummer type with Q fs, Spec(R
⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a Kummer étale cover when the index is invertible on R.

Hypotheses (packet): fs log schemes (CR.5); Kummer-étale coverings are log étale (Kato) and of
Kummer type.

API `KummerEtale.IsKummerType` (other; node `PR.8/kummer-etale-site-log-scheme`): Kummer type for
maps of fs monoids and morphisms of fs log schemes.

Lean form: the monoid form (for maps of fs monoids, stated for all commutative monoids); the form
for morphisms of fs log schemes (stalkwise on characteristic monoids) is not typed. -/

/-- API `KummerEtale.site` (constructor; node `PR.8/kummer-etale-site-log-scheme`): The Kummer étale
site X_két of an fs log scheme.

Placeholder carrier: the underlying category; the topology is `KummerEtale.topology`. -/
def site (X : FsLogScheme.{u}) : Type (u + 1) := sorry

noncomputable instance (X : FsLogScheme.{u}) : Category.{u} (site X) := sorry

/-- The Kummer étale topology. -/
noncomputable def topology (X : FsLogScheme.{u}) : GrothendieckTopology (site X) := sorry

/-- API `KummerEtale.cohomology` (constructor; node `PR.8/kummer-etale-site-log-scheme`): RΓ_két(X,
Λ) for a torsion abelian group Λ, and its colimit extension to saturated charts.

Lean form: for coefficient rings `Λ` that are torsion (`(n : Λ) = 0` for some `n ≥ 1`, recorded
where used); the colimit extension to saturated charts is `kummerEtaleSaturated` below. -/
noncomputable def cohomology (X : FsLogScheme.{u}) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry


/-- API `KummerEtale.baseChange` (functoriality; node `PR.8/kummer-etale-site-log-scheme`): Kummer
étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.

Lean form: the induced morphism of sites (continuity of the pull-back functor); stability of covers
under fs base change is not typed separately. -/
noncomputable def baseChange {X Y : FsLogScheme.{u}} (f : X ⟶ Y) : site Y ⥤ site X := sorry

theorem baseChange_isContinuous {X Y : FsLogScheme.{u}} (f : X ⟶ Y) :
    (baseChange f).IsContinuous (topology Y) (topology X) := by
  sorry


/-- Unit test `KummerEtale.kummerType_nat` (computation; node `PR.8/kummer-etale-site-log-scheme`):
For n ≥ 1, N → N, 1 ↦ n is of Kummer type; at n = 0 it is not injective. The diagonal N → N^2, 1 ↦
(1,1) is not of Kummer type (not every element has a positive multiple in the image). -/
example (n : ℕ) (hn : 1 ≤ n) :
    IsKummerType (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) ∧
      ¬ IsKummerType (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) ∧
      ¬ IsKummerType ((MonoidHom.id (Multiplicative ℕ)).prod (MonoidHom.id (Multiplicative ℕ))) := by
  sorry


end KummerEtale

/-! ## Node `PR.8/log-scheme-vs-log-adic-kummer` (lemma): Kummer étale cohomology of log schemes and of log adic spaces -/

/-- Placeholder carrier (owners `CrystallineCohomology:CR.5:log-algebra`,
`PrismaticCohomology:PR.8/fs-log-adic-kummer-foundations`): classically `p`-complete fs pre-log rings `(R, P)`
with `R` topologically finitely generated over a noetherian ring. -/
def TopFinFsPrelogRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace TopFinFsPrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- `Spec(R[1/p], P)^a`. -/
noncomputable def genericLogScheme (X : TopFinFsPrelogRing.{u} p) : FsLogScheme.{u} := sorry

/-- Placeholder (owner `PrismaticCohomology:PR.8/fs-log-adic-kummer-foundations`): Kummer étale cohomology of
the fs log adic space `(Spa(R[1/p], R), P)^a` (Diao–Lan–Liu–Zhu). -/
noncomputable def logAdicKummerCohomology (X : TopFinFsPrelogRing.{u} p) (Λ : Type)
    [CommRing Λ] : DerivedCategory (ModuleCat.{u} Λ) := sorry

end TopFinFsPrelogRing

/-- **Node `PR.8/log-scheme-vs-log-adic-kummer`** (lemma): Kummer étale cohomology of log schemes
and of log adic spaces.

Let n ≥ 1 and Λ = Z/nZ and (R, P) a classically p-complete fs pre-log ring with R topologically
finitely generated over a noetherian ring A_0. With X = Spec(R[1/p], P)^a and X^ad = (Spa(R[1/p],
R), P)^a the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism
RΓ_két(X, Λ) ≅ RΓ_két(X^ad, Λ).

Hypotheses (packet): Fs pre-log ring; R topologically of finite type over a noetherian base;
Spa(R[1/p], R) is then an adic space. The coefficient modulus n is positive; ZMod 0 = Z is outside
this torsion comparison. -/
theorem logScheme_vs_logAdic {p : ℕ} [Fact p.Prime] (X : TopFinFsPrelogRing.{u} p) (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (KummerEtale.cohomology X.genericLogScheme (ZMod n) ≅
      X.logAdicKummerCohomology (ZMod n)) := by
  sorry

/-! ## Node `PR.8/affine-kummer-etale-comparison` (theorem): The affine Kummer-étale comparison -/

namespace KummerEtale

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- Placeholder (node `PR.8/kummer-etale-site-log-scheme`): `RΓ_két(Spec(R[1/p], P)^a, Λ)` for a
saturated chart, the filtered colimit over fine saturated submonoids. -/
noncomputable def kummerEtaleSaturated {P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}}
    (X : PrelogAlgebra P) (Λ : Type) [CommRing Λ] : DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Placeholder (node `PR.8/affine-kummer-etale-comparison`): `(Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}`, the
derived fibre of `φ − 1` on `DerivedLogPrismatic` after inverting `d` and reducing mod `p^n`. -/
noncomputable def phiFixed {P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}} (d : A)
    (X : PrelogAlgebra P) (n : ℕ) : DerivedCategory (ModuleCat.{u} (ZMod (p ^ n))) := sorry

/-- **Node `PR.8/affine-kummer-etale-comparison`** (theorem): The affine Kummer-étale comparison.

Let (A, I = (d)) be a perfect prism with I ≠ (p), and (R, P) a p-adically complete pre-log
A/I-algebra with P saturated and R of bounded p^∞-torsion. For each n ≥ 1 there is a canonical
isomorphism RΓ_két(Spec(R[1/p], P)^a, Z/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}, functorial in (R, P),
where (−)^{φ=1} is the derived fibre of φ − 1. The base prism may be replaced by any perfect log
prism, or by a pre-log prism with (A/I, M_A) perfectoid or pseudo-perfectoid (derived-log-properties
(5)); the left side may equally be the full log étale cohomology.

Hypotheses (packet): Perfect prism, I ≠ (p) (both sides vanish for I = (p)); P saturated; bounded
p^∞-torsion.

Lean form: over a perfect prism `(A, (d))` with `I ≠ (p)` (base with trivial monoid) and `(R, P)`
`p`-adically complete with saturated chart and bounded `p^∞`-torsion; functoriality and the variants
are not typed. -/
theorem affineComparison (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    (hperf : P.toPrism.IsPerfect) (d : A) (hd : P.toPrism.I = Ideal.span {d})
    (hne : P.toPrism.I ≠ Ideal.span {(p : A)}) (X : PrelogAlgebra P)
    [IsCancelMul X.Q] [IsAdicComplete (Ideal.span {(p : X.R)}) X.R]
    (hsat : ∀ (x : Algebra.GrothendieckGroup X.Q) (n : ℕ), 1 ≤ n →
      x ^ n ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := X.Q)) →
      x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := X.Q)))
    (htors : ∃ N : ℕ, ∀ x : X.R, (∃ m : ℕ, (p : X.R) ^ m * x = 0) → (p : X.R) ^ N * x = 0)
    (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (kummerEtaleSaturated X (ZMod (p ^ n)) ≅ phiFixed d X n) := by
  sorry

end KummerEtale

/-! ## Node `PR.8/log-diamond` (definition): Log diamonds -/

/-- Placeholder carrier (owners `DiamondsAndVStacks:D4`, `DiamondEtaleCohomology:C0`): diamonds
over `Spd ℚ_p`. -/
def Diamond (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- **Node `PR.8/log-diamond`** (definition): Log diamonds.

A log (locally spatial) diamond over Q_p is a (locally spatial) diamond Y with a map Y → Spd Q_p and
a log structure M_Y → Ô_Y on the quasi-pro-étale site Y_qproét, where Ô_Y and Ô^+_Y are the
completed structure sheaves (for affinoid perfectoid Y′ = Spa(R, R^+) quasi-pro-étale over Y with
untilt (R^♯, R^{♯+}), Ô_Y(Y′) = R^♯). A chart is P → Γ(Y_qproét, M_Y) inducing P^a ≅ M_Y and
factoring through Ô^+_Y; (Y, M_Y) is quasi-coherent (integral, saturated, fine, fs) if such charts
exist quasi-pro-étale locally. Maps are assumed to have compatible charts locally (Convention 7.5).
Saturation exists for quasi-coherent log diamonds (via perfectoidisation of R^+ ⊗_{Z[P]} Z[P^sat])
and fibre products exist among saturated quasi-coherent (resp. fs) log diamonds; from now on fibre
products are saturated fibre products ×^sat.

Hypotheses (packet): Diamonds and their pro-étale presentations are supplied by D4; locally spatial
quasi-pro-étale pullbacks and fibre products by D5/quasi-pro-etale-and-fibre-product-permanence;
quasi-pro-étale sites by DiamondEtaleCohomology C0.

API `LogDiamond` (constructor; node `PR.8/log-diamond`): A diamond Y → Spd Q_p with a log structure
M_Y → Ô_Y on Y_qproét.

Placeholder carrier (node `PR.8/log-diamond`): log (locally spatial) diamonds over `ℚ_p`, with maps
having compatible charts locally (Convention 7.5). -/
def LogDiamond (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogDiamond

variable {p : ℕ} [Fact p.Prime]

noncomputable instance : Category.{u} (LogDiamond.{u} p) := sorry


/-- API `LogDiamond.saturation` (universal-property; node `PR.8/log-diamond`): A quasi-coherent log
diamond admits a saturation map (Y^sat, M_Y^sat) → (Y, M_Y), terminal among maps from saturated
quasi-coherent log diamonds to (Y, M_Y).

Lean form: the saturation and its map to `(Y, M_Y)`; terminality among maps from saturated
quasi-coherent log diamonds is not typed (saturatedness is a condition on the placeholder). -/
noncomputable def saturation (Y : LogDiamond.{u} p) : LogDiamond.{u} p := sorry

/-- The saturation map `(Y^sat, M^sat) → (Y, M_Y)`. -/
noncomputable def saturationMap (Y : LogDiamond.{u} p) : saturation Y ⟶ Y := sorry


/-- Placeholder carrier (owner `PrismaticCohomology:PR.8/fs-log-adic-kummer-foundations`): fs log adic spaces
(locally noetherian or perfectoid). -/
def _root_.TauCeti.LogPrismatic.FsLogAdicSpace (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance : Category.{u} (FsLogAdicSpace.{u} p) := sorry

/-- API `LogDiamond.ofLogAdicSpace` (coercion; node `PR.8/log-diamond`): An fs log adic space (DLLZ,
from PR.8/fs-log-adic-kummer-foundations), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦. -/
noncomputable def ofLogAdicSpace : FsLogAdicSpace.{u} p ⥤ LogDiamond.{u} p := sorry

/-- The diamond `Y` with the trivial log structure `Ô_Y^×`. -/
noncomputable def trivialOf (Y : Diamond.{u} p) : LogDiamond.{u} p := sorry

/-- Unit test `LogDiamond.trivial` (degenerate; node `PR.8/log-diamond`): Y with M_Y = Ô_Y^× is a
saturated quasi-coherent log diamond and its saturation is itself.

Lean form: the saturation of a trivial log diamond is itself (saturatedness and quasi-coherence are
conditions on the placeholder and not typed). -/
example (Y : Diamond.{u} p) : IsIso (saturationMap (trivialOf Y)) := by
  sorry


end LogDiamond

/-! ## Node `PR.8/log-diamond-generic-fibre` (construction): The log diamond generic fibre -/

/-- Placeholder carrier (owners `DiamondsAndVStacks:D6`, CR.5): pre-log Huber pairs
`((R, R⁺), P → R⁺)` over `(ℚ_p, ℤ_p)`. -/
def PrelogHuberPair (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder carrier (owner CR.5): `p`-complete fs pre-log rings `(R, P)` with bounded
`p^∞`-torsion. -/
def FsPrelogRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace FsPrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- `(Spf R, P)^a`. -/
noncomputable def spf (X : FsPrelogRing.{u} p) : FsLogFormalScheme.{u} p := sorry

/-- `((R[1/p], R⁺), P)` with `R⁺` the integral closure of `R`. -/
noncomputable def huberPair (X : FsPrelogRing.{u} p) : PrelogHuberPair.{u} p := sorry

/-- `Spec(R[1/p], P)^a`. -/
noncomputable def genericLogScheme (X : FsPrelogRing.{u} p) : FsLogScheme.{u} := sorry

end FsPrelogRing

namespace LogDiamond

variable {p : ℕ} [Fact p.Prime]

/-- **Node `PR.8/log-diamond-generic-fibre`** (construction): The log diamond generic fibre.

For a pre-log Huber pair (R, R^+) over (Q_p, Z_p) with a monoid map P → R^+, (Spd(R, R^+), P)^a
denotes the associated log diamond (log structure associated with P → Ô^+). For an fs log p-adic
formal scheme (X, M_X) over Z_p, its diamond generic fibre X^♦_η → Spd Q_p carries the fs log
structure induced by M_X, giving the log diamond (X, M_X)^♦_η, functorial in (X, M_X); for
p-complete (R, P) with bounded p^∞-torsion it is (Spd(R[1/p], R^+), P)^a with R^+ the integral
closure of R. The underlying pre-adic space Spa(R[1/p], R^+) need not be sheafy; the log diamond
always exists.

Hypotheses (packet): Fs log p-adic formal schemes; diamonds of Huber pairs via DiamondsAndVStacks
D6.

API `LogDiamond.genericFibre` (constructor; node `PR.8/log-diamond-generic-fibre`): (X, M_X) ↦ (X,
M_X)^♦_η for fs log p-adic formal schemes. -/
noncomputable def genericFibre : FsLogFormalScheme.{u} p ⥤ LogDiamond.{u} p := sorry

/-- API `LogDiamond.ofHuberPair` (constructor; node `PR.8/log-diamond-generic-fibre`): (Spd(R, R^+),
P)^a for a pre-log Huber pair. -/
noncomputable def ofHuberPair (X : PrelogHuberPair.{u} p) : LogDiamond.{u} p := sorry

/-- API `LogDiamond.genericFibre_map` (functoriality; node `PR.8/log-diamond-generic-fibre`):
Functoriality in maps of fs log p-adic formal schemes, compatible with composition.

Lean form: the action of the functor `genericFibre` on maps (compatibility with composition is
functoriality). -/
noncomputable def genericFibre_map {X Y : FsLogFormalScheme.{u} p} (f : X ⟶ Y) :
    genericFibre.obj X ⟶ genericFibre.obj Y :=
  genericFibre.map f


/-- API `LogDiamond.genericFibre_affine` (characterisation; node `PR.8/log-diamond-generic-fibre`):
For X = Spf(R) with fs chart P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a. -/
theorem genericFibre_affine (X : FsPrelogRing.{u} p) :
    Nonempty (genericFibre.obj X.spf ≅ ofHuberPair X.huberPair) := by
  sorry


end LogDiamond

/-! ## Node `PR.8/stdisc-log-perfectoid` (definition): Strictly totally disconnected log perfectoid spaces -/

/-- Placeholder carrier (owner `DiamondsAndVStacks:D1`): strictly totally disconnected perfectoid
spaces. -/
def StdiscPerfectoidSpace (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder (owner D1): the ring `Γ(X, Ô⁺_X)`. -/
def StdiscPerfectoidSpace.integralSections {p : ℕ} [Fact p.Prime]
    (X : StdiscPerfectoidSpace.{u} p) : Type u := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] (X : StdiscPerfectoidSpace.{u} p) :
    CommRing X.integralSections := sorry

/-- **Node `PR.8/stdisc-log-perfectoid`** (definition): Strictly totally disconnected log perfectoid
spaces.

A strictly totally disconnected log perfectoid space is a strictly totally disconnected perfectoid
space X (qcqs, every étale cover splits) with a saturated quasi-coherent log structure M_X such that
M_X/M_X^× is uniquely divisible; then X is affinoid perfectoid and Γ(X, M_X) is saturated and
divisible. For such X, H^1(X, Ô_X^×) = 0 for the pro-étale topology, so Γ(X, M_X) → Γ(X, M_X/M_X^×)
is surjective for any integral quasi-coherent M_X; it suffices that M_X be divisible, and (X, P)^a
is such a space for any divisible saturated P → Γ(X, Ô^+_X).

Hypotheses (packet): Strictly totally disconnected perfectoid spaces as in DiamondsAndVStacks D1.

Placeholder carrier (node `PR.8/stdisc-log-perfectoid`): strictly totally disconnected log
perfectoid spaces (the defining condition `LogPerfectoid.IsStrictlyTotallyDisconnected` is built
into the type). -/
def StdiscLogPerfectoid (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogPerfectoid

variable {p : ℕ} [Fact p.Prime]


/-- API `LogPerfectoid.of_divisible` (constructor; node `PR.8/stdisc-log-perfectoid`): (X, P)^a for
P divisible saturated with P → Γ(X, Ô^+_X). -/
noncomputable def of_divisible (X : StdiscPerfectoidSpace.{u} p) {P : Type u} [CommMonoid P] [IsCancelMul P]
    (hdiv : ∀ (x : P) (n : ℕ), 1 ≤ n → ∃ y, y ^ n = x)
    (hsat : ∀ (x : Algebra.GrothendieckGroup P) (n : ℕ), 1 ≤ n →
      x ^ n ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := P)) →
      x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := P)))
    (α : P →* X.integralSections) : StdiscLogPerfectoid.{u} p := sorry


/-- Fixture forgetful map (compatibility; node `PR.8/stdisc-log-perfectoid`): The
underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.

Lean form: the forgetful map to D1's strictly totally disconnected perfectoid spaces. -/
noncomputable def compat_D1 (X : StdiscLogPerfectoid.{u} p) : StdiscPerfectoidSpace.{u} p := sorry

/-- Fixture trivial log structure (degenerate; node `PR.8/stdisc-log-perfectoid`): Any strictly
totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected
log perfectoid space.

Lean form: the object with trivial log structure on a given space, and its underlying space. -/
noncomputable def trivial (X : StdiscPerfectoidSpace.{u} p) : StdiscLogPerfectoid.{u} p := sorry

/-- Unit test `LogPerfectoid.trivial`: forgetting the trivial log recovers X. -/
example (X : StdiscPerfectoidSpace.{u} p) : compat_D1 (trivial X) = X := by
  sorry


end LogPerfectoid

/-! ## Node `PR.8/quasi-pro-kummer-etale-site` (definition): The quasi-pro-Kummer-étale site -/

namespace QProKummerEtale

variable {p : ℕ} [Fact p.Prime]


/-- **Node `PR.8/quasi-pro-kummer-etale-site`** (definition): The quasi-pro-Kummer-étale site.

A locally separated map f: (Y′, M_{Y′}) → (Y, M_Y) of saturated quasi-coherent log diamonds is
quasi-pro-Kummer-étale (resp. Kummer-étale, finite Kummer-étale) if for every map (X, M_X) → (Y,
M_Y) from a strictly totally disconnected log perfectoid space, Y′ ×^sat_Y X is a perfectoid space
and (Y′ ×_Y X, M) → (X, M_X) is strict and pro-étale (resp. étale, finite étale); it is surjective
if each such pullback is surjective. The quasi-pro-Kummer-étale site (Y, M_Y)_qpkét consists of
quasi-pro-Kummer-étale maps to (Y, M_Y) with jointly surjective coverings. Strict maps are
quasi-pro-Kummer-étale iff the underlying map is pro-étale; the classes are stable under
pullback and composition and satisfy cancellation in the following direction: if g and g∘f belong to
the class, then f belongs to the class (no unrestricted two-out-of-three assertion); maps of log
diamonds induce morphisms of sites.

Hypotheses (packet): Saturated quasi-coherent log diamonds; locally separated maps (as in Scholze).

API `QProKummerEtale.site` (constructor; node `PR.8/quasi-pro-kummer-etale-site`): The site (Y,
M_Y)_qpkét.

Placeholder carrier: the underlying category; its topology is `QProKummerEtale.topology`. -/
def site (Y : LogDiamond.{u} p) : Type (u + 1) := sorry

noncomputable instance (Y : LogDiamond.{u} p) : Category.{u} (site Y) := sorry

/-- The quasi-pro-Kummer-étale topology (jointly surjective families). -/
noncomputable def topology (Y : LogDiamond.{u} p) : GrothendieckTopology (site Y) := sorry


/-- API `QProKummerEtale.pullbackSite` (functoriality; node `PR.8/quasi-pro-kummer-etale-site`): A
map of saturated quasi-coherent log diamonds induces a morphism of sites. -/
noncomputable def pullbackSite {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) : site Y ⥤ site Y' := sorry

theorem pullbackSite_isContinuous {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) :
    (pullbackSite f).IsContinuous (topology Y) (topology Y') := by
  sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`): the quasi-pro-étale site of a diamond. -/
def _root_.TauCeti.LogPrismatic.Diamond.qproet (Y : Diamond.{u} p) : Type (u + 1) := sorry

noncomputable instance (Y : Diamond.{u} p) : Category.{u} Y.qproet := sorry

/-- API `QProKummerEtale.trivialLog` (compatibility; node `PR.8/quasi-pro-kummer-etale-site`): For
trivial log structures (Y, M_Y)_qpkét ≃ Y_qproét (DiamondEtaleCohomology C0). -/
noncomputable def trivialLog (Y : Diamond.{u} p) : site (LogDiamond.trivialOf Y) ≌ Y.qproet :=
  sorry

/-- API `QProKummerEtale.cohomology` (constructor; node `PR.8/quasi-pro-kummer-etale-site`):
RΓ_qpkét((Y, M_Y), Λ) for a condensed (discrete or profinite) coefficient ring.

Lean form: for discrete coefficient rings; condensed (profinite) coefficients are not typed. -/
noncomputable def cohomology (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry


end QProKummerEtale

/-! ## Node `PR.8/kummer-tower-covers` (theorem): Kummer towers and the comparison of sites -/


/-! ## Node `PR.8/kummer-etale-vs-qpket` (theorem): Kummer-étale cohomology of log schemes via log diamonds -/

/-- **Node `PR.8/kummer-etale-vs-qpket`** (theorem): Kummer-étale cohomology of log schemes via log
diamonds.

Let Λ be a torsion abelian group, R a p-complete ring with bounded p^∞-torsion, (R[1/p], R^+) the
associated Huber pair and P → R a map from an fs monoid. The comparison map is an isomorphism
RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ). Consequently, for a perfect
prism (A, (d)), R p-complete over A/I with bounded p^∞-torsion and P → R fs, RΓ_qpkét((Spd(R[1/p],
R^+), P)^a, Z/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1} functorially (and for saturated P after defining
the left side as a filtered colimit of fs cases).

Hypotheses (packet): Λ torsion; R p-complete with bounded p^∞-torsion; P fs (saturated via colimit).

Lean form of the first isomorphism for torsion coefficient rings; the consequence for perfect prisms
is `affineComparison` combined with it. -/
theorem kummerEtale_vs_qpket {p : ℕ} [Fact p.Prime] (X : FsPrelogRing.{u} p) (Λ : Type)
    [CommRing Λ] (htors : ∃ n : ℕ, 1 ≤ n ∧ (n : Λ) = 0) :
    Nonempty (KummerEtale.cohomology X.genericLogScheme Λ ≅
      QProKummerEtale.cohomology (LogDiamond.ofHuberPair X.huberPair) Λ) := by
  sorry

/-! ## Node `PR.8/global-etale-comparison` (theorem): The Kummer-étale comparison -/

namespace QProKummerEtale

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The log diamond generic fibre `(X, M_X)^♦_η` of a smooth log formal scheme (CR.5/D6). -/
noncomputable def genericFibreOf {P : IntegralBoundedPrelogPrism p A M}
    (X : SmoothLogFormalScheme P) : LogDiamond.{u} p := sorry

/-- Placeholder (node `PR.8/global-etale-comparison`): `(RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1}`. -/
noncomputable def phiFixedGlobal (P : IntegralBoundedPrelogPrism p A M) (d : A)
    (X : SmoothLogFormalScheme P) (m : ℕ) : DerivedCategory (ModuleCat.{u} (ZMod (p ^ m))) :=
  sorry

/-- **Node `PR.8/global-etale-comparison`** (theorem): The Kummer-étale comparison.

Let (A, I = (d), M_0) be a bounded pre-log prism with (A, I) perfect and M_0 an fs monoid; (X_0,
M_{X_0}) a smooth fs log p-adic formal scheme over (A/I, M_0) with X_0 qcqs and mod p fibre of (X_0,
M_{X_0}) → (Spf A/I, M_0)^a of Cartier type (equivalently, saturated in Tsuji's sense); (A, I, M_A)
a saturated pre-log prism whose associated log prism is perfect, with (A, M_0) → (A, Γ(Spf A, M_{Spf
A})); and (X, M_X) the base change of (X_0, M_{X_0}) to (A/I, M_A) (also (X_i, M_{X_i}) to fs
submonoids M_i ⊂ M_A containing the image of M_0; underlying formal schemes unchanged). Define
RΓ_qpkét((X, M_X)^♦_η, Z/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, Z/p^m). Then there are
functorial isomorphisms RΓ_qpkét((X, M_X)^♦_η, Z/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅
(RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}. If moreover A/I = O_C (C algebraically closed, A =
A_inf) and X is proper, RΓ_qpkét((X, M_X)^♦_η, Z_p) := lim_m RΓ_qpkét(−, Z/p^m) is a perfect
Z_p-complex with RΓ_qpkét ⊗^L_{Z_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭), and similarly
mod p^m. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the
log structure is trivial there.

Hypotheses (packet): Exactly the setup of KY §7.4 (perfect log prism, fs M_0, Cartier-type mod p
fibre, qcqs X_0); properness and A/I = O_C for the second part.

Lean form of the first isomorphism in the case `M_0 = M_A = {e}`: the base is a perfect prism `(A,
(d))` with the trivial log structure (a perfect log prism, `LogPrism.trivial_isPerfect_iff`) and `X`
of Cartier type; the colimit over fs submonoids is then trivial. The general saturated perfect log
prism base, the second isomorphism and the `A_inf` statements are not typed. -/
theorem globalComparison (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    (hperf : P.toPrism.IsPerfect) (d : A) (hd : P.toPrism.I = Ideal.span {d})
    (X : CartierTypeLogFormalScheme P) (m : ℕ) :
    Nonempty (cohomology (genericFibreOf X.toSmooth) (ZMod (p ^ m)) ≅
      phiFixedGlobal P d X.toSmooth m) := by
  sorry

end QProKummerEtale

/-! ## Node `PR.8/kummer-local-systems` (definition): Kummer-étale local systems -/

/-- **Node `PR.8/kummer-local-systems`** (definition): Kummer-étale local systems.

Let (X, M_X) be an fs log diamond and pr: (X, M_X)_qpkét → X_qproét → ∗_proét. For a condensed ring
Λ (here Z/p^n discrete or Z_p profinite), a sheaf of pr^{-1}Λ-modules F on (X, M_X)_qpkét is
constant if F ≅ pr^{-1}Λ^r, and locally constant (a Λ-local system) if it is constant
quasi-pro-Kummer-étale locally. Loc_Λ(X, M_X) is the category of Λ-local systems; D^(b)((X,
M_X)^♦_η, Z_p) denotes the corresponding category of complexes locally constant with perfect fibres
(hypercomplete when X^♦_η is quasicompact).

Hypotheses (packet): Condensed coefficient rings Z/p^n and Z_p; following Mann–Werner §3.

API `KummerLocalSystem` (constructor; node `PR.8/kummer-local-systems`): Loc_Λ(X, M_X): locally
constant sheaves of pr^{-1}Λ-modules on (X, M_X)_qpkét.

Placeholder carrier (node `PR.8/kummer-local-systems`, with C0's coefficient interfaces): the
category `Loc_Λ(Y, M_Y)`; `Λ` is a coefficient ring such as `ℤ/p^n` or `ℤ_p` (condensed structure
not recorded). -/
def KummerLocalSystem {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Type (u + 1) := sorry

namespace KummerLocalSystem

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Category.{u} (KummerLocalSystem Y Λ) := sorry

/-- API `KummerLocalSystem.constant` (constructor; node `PR.8/kummer-local-systems`): The constant
local system pr^{-1}Λ^r. -/
noncomputable def constant (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] (r : ℕ) :
    KummerLocalSystem Y Λ := sorry

/-- API `KummerLocalSystem.pullback` (functoriality; node `PR.8/kummer-local-systems`): Pullback
along maps of fs log diamonds. -/
noncomputable def pullback {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (Λ : Type) [CommRing Λ] :
    KummerLocalSystem Y Λ ⥤ KummerLocalSystem Y' Λ := sorry

/-- API `KummerLocalSystem.tensor` (structure; node `PR.8/kummer-local-systems`): Tensor products
and duals of local systems.

Lean form: the tensor product as a monoidal structure; duals are not typed. -/
noncomputable instance tensor (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    MonoidalCategory (KummerLocalSystem Y Λ) := sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`, Mann–Werner): quasi-pro-étale `Λ`-local
systems on a diamond. -/
def _root_.TauCeti.LogPrismatic.Diamond.LocalSystem (Y : Diamond.{u} p) (Λ : Type) [CommRing Λ] :
    Type (u + 1) := sorry

noncomputable instance (Y : Diamond.{u} p) (Λ : Type) [CommRing Λ] :
    Category.{u} (Y.LocalSystem Λ) := sorry

/-- API `KummerLocalSystem.trivialLog` (compatibility; node `PR.8/kummer-local-systems`): For
trivial log structure, Loc_{Z_p} agrees with quasi-pro-étale Z_p-local systems (Mann–Werner). -/
noncomputable def trivialLog (Y : Diamond.{u} p) :
    KummerLocalSystem (LogDiamond.trivialOf Y) ℤ_[p] ≌ Y.LocalSystem ℤ_[p] := sorry

end KummerLocalSystem

namespace LogDiamond
variable {p : ℕ} [Fact p.Prime]
noncomputable def underlying (Y : LogDiamond.{u} p) : Diamond.{u} p := sorry
/-- Geometric log points, with the usual underlying geometric point. -/
def Point (Y : LogDiamond.{u} p) : Type u := sorry
/-- The sharp characteristic stalk M_y/O_yˣ supplied by the log structure. -/
def characteristic (Y : LogDiamond.{u} p) (y : Point Y) : Type u := sorry
noncomputable instance (Y : LogDiamond.{u} p) (y : Point Y) :
    CommMonoid (characteristic Y y) := sorry
/-- Saturation is checked in each characteristic group completion. -/
def IsSaturated (Y : LogDiamond.{u} p) : Prop :=
  ∀ y : Point Y, IsCancelMul (characteristic Y y) ∧
    ∀ (z : Algebra.GrothendieckGroup (characteristic Y y)) (n : ℕ), 0 < n →
      z ^ n ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := characteristic Y y)) →
      z ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := characteristic Y y))
def IsPDivisible (Y : LogDiamond.{u} p) : Prop :=
  ∀ y : Point Y, Function.Surjective (powMonoidHom p : characteristic Y y →* characteristic Y y)
/-- D1's ordinary strictly totally disconnected perfectoid carrier, not the all-integer
log divisibility condition in PR.8/stdisc-log-perfectoid. -/
noncomputable def stdiscUnderlying (Y : StdiscPerfectoidSpace.{u} p) : Diamond.{u} p := sorry
/-- Compatible-chart maps (Convention 7.5). The chart/localisation object interface is
not implemented; it omits the local chart compatibility condition in this prototype. -/
structure ChartMap (Y X : LogDiamond.{u} p) where
  hom : Y ⟶ X
/-- Strict quasi-pro-étale covers with fs charts; object interface for Lemma 1(3).
The strictness/chart conditions are not yet fields of this standalone fixture. -/
def StrictFSChartCover (X : LogDiamond.{u} p) : Type (u + 1) := sorry
namespace StrictFSChartCover
noncomputable def Index {X : LogDiamond.{u} p} (U : StrictFSChartCover X) : Type u := sorry
noncomputable def root {X : LogDiamond.{u} p} (U : StrictFSChartCover X) (i : U.Index) :
    LogDiamond.{u} p := sorry
noncomputable def rootMap {X : LogDiamond.{u} p} (U : StrictFSChartCover X) (i : U.Index) :
    U.root i ⟶ X := sorry
end StrictFSChartCover
end LogDiamond

namespace KummerLocalSystem
variable {p : ℕ} [Fact p.Prime]
noncomputable def ordinaryToKummer (Y : LogDiamond.{u} p) :
    Y.underlying.LocalSystem ℤ_[p] ⥤ KummerLocalSystem Y ℤ_[p] := sorry
/-- Being ordinary means descent to the underlying diamond, not merely being Kummer. -/
def IsOrdinary {Y : LogDiamond.{u} p} (F : KummerLocalSystem Y ℤ_[p]) : Prop :=
  ∃ E : Y.underlying.LocalSystem ℤ_[p], Nonempty ((ordinaryToKummer Y).obj E ≅ F)
def IsConstant {Y : LogDiamond.{u} p} (F : KummerLocalSystem Y ℤ_[p]) : Prop :=
  ∃ r : ℕ, Nonempty (F ≅ constant Y ℤ_[p] r)
/-- Local rank is a function on geometric points; a disconnected local system need not
have one global rank. -/
noncomputable def rank {Y : LogDiamond.{u} p} {Λ : Type} [CommRing Λ]
    (F : KummerLocalSystem Y Λ) (y : Y.Point) : ℕ := sorry
/-- Unit test `KummerLocalSystem.constant_rank`. -/
example (Y : LogDiamond.{u} p) (r : ℕ) (y : Y.Point) : rank (constant Y ℤ_[p] r) y = r := by
  sorry
/-- Unit test `KummerLocalSystem.zero`. -/
example (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Limits.IsZero (constant Y Λ 0) ∧ ∀ y : Y.Point, rank (constant Y Λ 0) y = 0 := by
  sorry
/-- Unit test `KummerLocalSystem.trivialLog_eq`. -/
example (Y : Diamond.{u} p) :
    Nonempty (KummerLocalSystem (LogDiamond.trivialOf Y) ℤ_[p] ≌ Y.LocalSystem ℤ_[p]) := by
  sorry
end KummerLocalSystem

/-! ## p-Kummer local systems: corrected essential image (KYcorr Lemma 1/Definition 2)
The universal test below uses only p-divisible characteristic stalks. It must not be replaced
by the stronger all-integer divisible test of the uncorrected argument.
-/
namespace PKummerLocalSystem
variable {p : ℕ} [Fact p.Prime]
def IsPKummer {X : LogDiamond.{u} p} (F : KummerLocalSystem X ℤ_[p]) : Prop :=
  ∀ (Y : LogDiamond.{u} p) (f : LogDiamond.ChartMap Y X), Y.IsSaturated → Y.IsPDivisible →
    KummerLocalSystem.IsOrdinary ((KummerLocalSystem.pullback f.hom ℤ_[p]).obj F)
end PKummerLocalSystem
/-- API `PKummerLocalSystem`: the actual full-subcategory condition is the universal test. -/
abbrev PKummerLocalSystem {p : ℕ} [Fact p.Prime] (X : LogDiamond.{u} p) :=
  CategoryTheory.ObjectProperty.FullSubcategory
    (PKummerLocalSystem.IsPKummer (X := X) :
      CategoryTheory.ObjectProperty (KummerLocalSystem X ℤ_[p]))
namespace PKummerLocalSystem
variable {p : ℕ} [Fact p.Prime]
/-- API `PKummerLocalSystem.chart_iff` (KYcorr Lemma 1(3), pp. 1–2). -/
theorem chart_iff {X : LogDiamond.{u} p} (F : KummerLocalSystem X ℤ_[p]) :
    IsPKummer F ↔ ∃ U : X.StrictFSChartCover,
      ∀ i : U.Index, KummerLocalSystem.IsOrdinary
        ((KummerLocalSystem.pullback (U.rootMap i) ℤ_[p]).obj F) := by
  sorry
/-- API `PKummerLocalSystem.stdisc_iff` (KYcorr Lemma 1(2)); the source characteristic is
p-divisible, without assuming it has roots of every order. -/
theorem stdisc_iff {X : LogDiamond.{u} p} (F : KummerLocalSystem X ℤ_[p]) :
    IsPKummer F ↔ ∀ (Y : LogDiamond.{u} p) (f : LogDiamond.ChartMap Y X)
      (S : StdiscPerfectoidSpace.{u} p), Y.underlying = LogDiamond.stdiscUnderlying S →
      Y.IsSaturated → Y.IsPDivisible →
      KummerLocalSystem.IsConstant ((KummerLocalSystem.pullback f.hom ℤ_[p]).obj F) := by
  sorry
/-- API `PKummerLocalSystem.constant`. -/
noncomputable def constant (X : LogDiamond.{u} p) (r : ℕ) : PKummerLocalSystem X :=
  ⟨KummerLocalSystem.constant X ℤ_[p] r, by sorry⟩
/-- API `PKummerLocalSystem.pullback`. -/
noncomputable def pullback {X Y : LogDiamond.{u} p} (f : X ⟶ Y) :
    PKummerLocalSystem Y ⥤ PKummerLocalSystem X := sorry
/-- API `PKummerLocalSystem.tensor`. -/
noncomputable instance tensor (X : LogDiamond.{u} p) : MonoidalCategory (PKummerLocalSystem X) := sorry
noncomputable def dual {X : LogDiamond.{u} p} (F : PKummerLocalSystem X) : PKummerLocalSystem X := sorry
/-- API `PKummerLocalSystem.trivialLog`. -/
noncomputable def trivialLog (Y : Diamond.{u} p) :
    PKummerLocalSystem (LogDiamond.trivialOf Y) ≌ Y.LocalSystem ℤ_[p] := sorry
/-- Unit test `PKummerLocalSystem.constant_rank`. -/
example (Y : LogDiamond.{u} p) (r : ℕ) (y : Y.Point) :
    KummerLocalSystem.rank (constant Y r).obj y = r := by
  sorry
/-- Unit test `PKummerLocalSystem.trivialLog_eq`. -/
example (Y : Diamond.{u} p) :
    Nonempty (PKummerLocalSystem (LogDiamond.trivialOf Y) ≌ Y.LocalSystem ℤ_[p]) := by
  sorry
end PKummerLocalSystem

/-! ## Finite-level log inertia: DLLZ local fundamental group, KYcorr Definition 4/Proposition 5
The underlying inertia group and chosen fibre bases are object interfaces, not hypotheses
assuming p-Kummerness. We reuse Mathlib's matrix GL, coefficient reduction and p-groups, and
Tau Ceti's pro-p predicate.
-/
namespace LogDiamond
variable {p : ℕ} [Fact p.Prime]
def Inertia {Y : LogDiamond.{u} p} (y : Y.Point) : Type u := sorry
noncomputable instance {Y : LogDiamond.{u} p} (y : Y.Point) : Group (Inertia y) := sorry
end LogDiamond
namespace KummerLocalSystem
variable {p : ℕ} [Fact p.Prime] {Y : LogDiamond.{u} p}
noncomputable def inertia (F : KummerLocalSystem Y ℤ_[p]) (y : Y.Point) :
    LogDiamond.Inertia y →* Matrix.GeneralLinearGroup (Fin (rank F y)) ℤ_[p] := sorry
noncomputable def inertiaMod (F : KummerLocalSystem Y ℤ_[p]) (y : Y.Point) (n : ℕ) :=
  (Matrix.GeneralLinearGroup.map (PadicInt.toZModPow (p := p) (n + 1))).comp (inertia F y)
def HasPInertia (F : KummerLocalSystem Y ℤ_[p]) : Prop :=
  ∀ (y : Y.Point) (n : ℕ), IsPGroup p (inertiaMod F y n).range
end KummerLocalSystem
/-- Noetherian fs log adic objects; the API is moved down from the higher T6 owner to PR.8.
This fixture omits the noetherian and analytic-space axioms, which the packet states. -/
def NoetherianFsLogAdicSpace (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry
noncomputable def NoetherianFsLogAdicSpace.diamond {p : ℕ} [Fact p.Prime]
    (X : NoetherianFsLogAdicSpace.{u} p) : LogDiamond.{u} p := sorry
/-- Node `PR.8/p-kummer-monodromy-criterion`: finite-level inertia characterization.
The diamond/adic finite-free local-system identification is an imported object interface;
finite-level reduction is actual matrix coefficient reduction. -/
theorem PKummerLocalSystem.monodromy_iff {p : ℕ} [Fact p.Prime]
    (X : NoetherianFsLogAdicSpace.{u} p) (F : KummerLocalSystem X.diamond ℤ_[p]) :
    PKummerLocalSystem.IsPKummer F ↔ KummerLocalSystem.HasPInertia F := by
  sorry
/-- The image has its matrix subspace topology, not an artificial discrete topology. -/
noncomputable instance {p : ℕ} [Fact p.Prime] {Y : LogDiamond.{u} p}
    (F : KummerLocalSystem Y ℤ_[p]) (y : Y.Point) :
    TopologicalSpace (KummerLocalSystem.inertia F y).range := sorry
theorem PKummerLocalSystem.inertia_proP_iff {p : ℕ} [Fact p.Prime]
    (X : NoetherianFsLogAdicSpace.{u} p) (F : KummerLocalSystem X.diamond ℤ_[p]) :
    KummerLocalSystem.HasPInertia F ↔
      ∀ y : X.diamond.Point, TauCeti.IsProP p (KummerLocalSystem.inertia F y).range := by
  sorry

/-- Geometric log disc over an algebraically closed complete C/Q_p. The field/adic
space interface is supplied by the adic foundations; this is not a punctured disc. -/
def GeometricLogDisc (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry
namespace GeometricLogDisc
variable {p : ℕ} [Fact p.Prime]
noncomputable def diamond (D : GeometricLogDisc.{u} p) : LogDiamond.{u} p := sorry
noncomputable def boundary (D : GeometricLogDisc.{u} p) : D.diamond.Point := sorry
/-- π_* Z_p for the n-th-root cover, a rank-n module local system. -/
noncomputable def rootPushforward (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 0 < n) :
    KummerLocalSystem D.diamond ℤ_[p] := sorry
/-- Its geometric boundary inertia is the regular permutation representation of Z/n. -/
noncomputable def rootInertiaModEquiv (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 0 < n)
    (a : ℕ) : (KummerLocalSystem.inertiaMod (D.rootPushforward n hn) D.boundary a).range ≃*
      Multiplicative (ZMod n) := sorry
end GeometricLogDisc
/-- Unit test `KummerLocalSystem.kummer_torsor`: a finite permutation local system, not a
rank-one torsor. Nontrivial boundary inertia obstructs ordinary descent. -/
example {p : ℕ} [Fact p.Prime] (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 1 < n) :
    KummerLocalSystem.rank (D.rootPushforward n (by omega)) D.boundary = n ∧
      ¬ KummerLocalSystem.IsOrdinary (D.rootPushforward n (by omega)) := by
  sorry
/-- Unit test `PKummerLocalSystem.pPower_root`. -/
example {p : ℕ} [Fact p.Prime] (D : GeometricLogDisc.{u} p) (a : ℕ) (ha : 0 < a) :
    PKummerLocalSystem.IsPKummer (D.rootPushforward (p ^ a) (Nat.pow_pos (Fact.out : p.Prime).pos)) ∧
      KummerLocalSystem.rank (D.rootPushforward (p ^ a) (Nat.pow_pos (Fact.out : p.Prime).pos)) D.boundary = p ^ a ∧
      ∀ n, IsPGroup p
        (KummerLocalSystem.inertiaMod (D.rootPushforward (p ^ a) (Nat.pow_pos (Fact.out : p.Prime).pos)) D.boundary n).range := by
  sorry
/-- Unit test `PKummerLocalSystem.primeToP_root`. -/
example {p : ℕ} [Fact p.Prime] (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 1 < n)
    (hcop : Nat.Coprime n p) :
    KummerLocalSystem.rank (D.rootPushforward n (by omega)) D.boundary = n ∧
      ¬ PKummerLocalSystem.IsPKummer (D.rootPushforward n (by omega)) ∧
      ¬ IsPGroup p (KummerLocalSystem.inertiaMod
        (D.rootPushforward n (by omega)) D.boundary 0).range := by
  sorry


/-! ## Node `PR.8/laurent-f-crystal` (definition): Laurent F-crystals on the absolute saturated log prismatic site -/

/-- **Node `PR.8/laurent-f-crystal`** (definition): Laurent F-crystals on the absolute saturated log
prismatic site.

Let (X, M_X) be a bounded fs log p-adic formal scheme and (X, M_X)_Δ its absolute saturated log
prismatic site. A Laurent F-crystal is a crystal of vector bundles E over (O_Δ[1/I])^∧_p on (X,
M_X)_Δ (a compatible family of finite projective A[1/I]^∧_p-modules on objects (A, I, M_A)^a with
isomorphisms along maps) together with an isomorphism φ_E: φ^*E ≅ E. Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1} is the category of Laurent F-crystals; D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}
the analogous category of perfect complexes.

Hypotheses (packet): Bounded fs log p-adic formal schemes; absolute saturated site with the strict
flat topology.

API `LaurentFCrystal` (constructor; node `PR.8/laurent-f-crystal`): The category Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1}.

Placeholder carrier (node `PR.8/laurent-f-crystal`): the category `Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1}` on the absolute saturated log prismatic site. -/
def LaurentFCrystal {p : ℕ} [Fact p.Prime] (X : FsLogFormalScheme.{u} p) : Type (u + 1) := sorry

namespace LaurentFCrystal

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (LaurentFCrystal X) := sorry

/-- API `LaurentFCrystal.unit` (example; node `PR.8/laurent-f-crystal`): The unit object
O_Δ[1/I]^∧_p with its Frobenius. -/
noncomputable def unit (X : FsLogFormalScheme.{u} p) : LaurentFCrystal X := sorry

/-- API `LaurentFCrystal.tensor` (structure; node `PR.8/laurent-f-crystal`): Tensor products and
duals.

Lean form: the tensor product as a monoidal structure (with unit `LaurentFCrystal.unit`); duals are
not typed. -/
noncomputable instance tensor (X : FsLogFormalScheme.{u} p) : MonoidalCategory (LaurentFCrystal X) :=
  sorry

/-- API `LaurentFCrystal.pullback` (functoriality; node `PR.8/laurent-f-crystal`): Pullback along
maps of bounded fs log p-adic formal schemes. -/
noncomputable def pullback {X Y : FsLogFormalScheme.{u} p} (f : X ⟶ Y) :
    LaurentFCrystal Y ⥤ LaurentFCrystal X := sorry


/-- API `LaurentFCrystal.etaleRealisation` (projection; node `PR.8/laurent-f-crystal`): The étale
realisation F ↦ F_ét to Loc_{Z_p}((X, M_X)^♦_η) (from Theorem 7.36). -/
noncomputable def etaleRealisation (X : FsLogFormalScheme.{u} p) :
    LaurentFCrystal X ⥤ PKummerLocalSystem (LogDiamond.genericFibre.obj X) := sorry

/-- Unit test `LaurentFCrystal.unit_realisation` (computation; node `PR.8/laurent-f-crystal`): The
étale realisation of the unit O_Δ[1/I]^∧_p is the constant local system Z_p. -/
example (X : FsLogFormalScheme.{u} p) :
    Nonempty ((etaleRealisation X).obj (unit X) ≅
      PKummerLocalSystem.constant (LogDiamond.genericFibre.obj X) 1) := by
  sorry


/-- Unit test `LaurentFCrystal.zero` (degenerate; node `PR.8/laurent-f-crystal`): The zero crystal
is a Laurent F-crystal of rank 0.

Lean form: there is a zero Laurent F-crystal, and its étale realisation is the zero local system
(ranks of crystals are not recorded). -/
example (X : FsLogFormalScheme.{u} p) :
    ∃ Z : LaurentFCrystal X, Limits.IsZero Z ∧ Limits.IsZero ((etaleRealisation X).obj Z) := by
  sorry


end LaurentFCrystal

/-! ## Node `PR.8/laurent-f-crystals-local-systems` (theorem): Laurent F-crystals and Kummer-étale local systems -/

/-- Node `PR.8/laurent-f-crystals-local-systems` (KYcorr Theorem 7, p. 4).
The target is the p-Kummer full subcategory. The original unrestricted equivalence is false.
The perfect-complex equivalence is stated below after its coefficient interfaces. -/
theorem LaurentFCrystal.etaleRealisation_isEquivalence {p : ℕ} [Fact p.Prime]
    (X : FsLogFormalScheme.{u} p) : (LaurentFCrystal.etaleRealisation X).IsEquivalence := by
  sorry

/-! ## Node `PR.8/smooth-proper-pushforward` (theorem): Smooth proper pushforward of Kummer-étale local systems -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth (Koshikawa) proper
maps of bounded fs log `p`-adic formal schemes. -/
def SmoothProperMap {p : ℕ} [Fact p.Prime] (X Y : FsLogFormalScheme.{u} p) : Type u := sorry

/-- All complexes of condensed Z_p sheaves on the quasi-pro-Kummer site; no local
perfectness or p-Kummer condition is built into this carrier. -/
def KummerSheafDerived {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) : Type (u + 1) := sorry
noncomputable instance {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) :
    Category.{u} (KummerSheafDerived Y) := sorry
/-- C0's ordinary derived coefficient-sheaf category. -/
def Diamond.SheafDerived {p : ℕ} [Fact p.Prime] (Y : Diamond.{u} p) : Type (u + 1) := sorry
noncomputable instance {p : ℕ} [Fact p.Prime] (Y : Diamond.{u} p) :
    Category.{u} (Diamond.SheafDerived Y) := sorry
/-- C0's category of locally perfect complexes of ordinary local systems. -/
def Diamond.LisseDerived {p : ℕ} [Fact p.Prime] (Y : Diamond.{u} p) : Type (u + 1) := sorry
noncomputable def Diamond.LisseDerived.toKummer {p : ℕ} [Fact p.Prime]
    (Y : LogDiamond.{u} p) : Diamond.LisseDerived Y.underlying → KummerSheafDerived Y := sorry
noncomputable def KummerSheafDerived.pullback {p : ℕ} [Fact p.Prime]
    {Y X : LogDiamond.{u} p} (f : Y ⟶ X) : KummerSheafDerived X ⥤ KummerSheafDerived Y := sorry
/-- The derived p-Kummer condition uses locally perfect ordinary complexes after the same
universal p-divisible chart pullbacks. -/
def KummerSheafDerived.IsPKummer {p : ℕ} [Fact p.Prime] {X : LogDiamond.{u} p}
    (F : KummerSheafDerived X) : Prop :=
  ∀ (Y : LogDiamond.{u} p) (f : LogDiamond.ChartMap Y X), Y.IsSaturated → Y.IsPDivisible →
    ∃ E : Diamond.LisseDerived Y.underlying,
      Nonempty ((KummerSheafDerived.pullback f.hom).obj F ≅ Diamond.LisseDerived.toKummer Y E)
abbrev PKummerDerived {p : ℕ} [Fact p.Prime] (X : LogDiamond.{u} p) :=
  CategoryTheory.ObjectProperty.FullSubcategory
    (KummerSheafDerived.IsPKummer (X := X) :
      CategoryTheory.ObjectProperty (KummerSheafDerived X))
/-- Laurent Frobenius-perfect complexes (source category, not the pushforward conclusion). -/
def LaurentFCrystal.Perfect {p : ℕ} [Fact p.Prime] (Y : FsLogFormalScheme.{u} p) : Type (u + 1) := sorry
noncomputable instance {p : ℕ} [Fact p.Prime] (Y : FsLogFormalScheme.{u} p) :
    Category.{u} (LaurentFCrystal.Perfect Y) := sorry
noncomputable def LaurentFCrystal.Perfect.etaleRealisation {p : ℕ} [Fact p.Prime]
    (Y : FsLogFormalScheme.{u} p) :
    LaurentFCrystal.Perfect Y ⥤ PKummerDerived (LogDiamond.genericFibre.obj Y) := sorry
/-- Perfect-complex part of KYcorr Theorem 7. -/
theorem LaurentFCrystal.Perfect.etaleRealisation_isEquivalence {p : ℕ} [Fact p.Prime]
    (Y : FsLogFormalScheme.{u} p) : (LaurentFCrystal.Perfect.etaleRealisation Y).IsEquivalence := by
  sorry
/-- The raw derived generic-fibre direct image. Its type assumes none of the theorem. -/
noncomputable def SmoothProperMap.etalePushforward {p : ℕ} [Fact p.Prime]
    {X Y : FsLogFormalScheme.{u} p} (f : SmoothProperMap X Y) :
    KummerSheafDerived (LogDiamond.genericFibre.obj Y) := sorry
/-- Published KY Proposition 7.37 is unchanged by the corrigendum (intro p. 1).
There is a Laurent Frobenius-perfect object realizing the raw direct image; thus local
perfectness and the derived p-Kummer property are conclusions. -/
theorem SmoothProperMap.pushforward_comparison {p : ℕ} [Fact p.Prime]
    {X Y : FsLogFormalScheme.{u} p} (f : SmoothProperMap X Y) :
    ∃ E : LaurentFCrystal.Perfect Y,
      Nonempty (((LaurentFCrystal.Perfect.etaleRealisation Y).obj E).obj ≅ f.etalePushforward) ∧
        KummerSheafDerived.IsPKummer f.etalePushforward := by
  sorry

/-! ## Node `PR.8/etale-comparison-over-ainf` (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)] -/

/-- Placeholder carrier (owner `AInfCohomology:AI.0`): complete algebraically closed
nonarchimedean fields `C` of residue characteristic `p`. -/
def CompleteAlgClosedField (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace CompleteAlgClosedField

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder (owner AI.0): `A_inf = W(O_C♭)`. -/
def Ainf (C : CompleteAlgClosedField.{u} p) : Type u := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : CommRing C.Ainf := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : Algebra ℤ_[p] C.Ainf := sorry

/-- The perfect prism `(A_inf, (ξ))` with the trivial log structure, as a base (AI.0). -/
noncomputable def ainfBase (C : CompleteAlgClosedField.{u} p) :
    IntegralBoundedPrelogPrism p C.Ainf PUnit.{u + 1} := sorry

theorem ainfBase_isPerfect (C : CompleteAlgClosedField.{u} p) : C.ainfBase.toPrism.IsPerfect := by
  sorry

/-- `φ⁻¹(μ) = [ε^{1/p}] − 1 ∈ A_inf`. -/
noncomputable def phiInvMu (C : CompleteAlgClosedField.{u} p) : C.Ainf := sorry

/-- Placeholder (owner AI.0): `A_crys` with its map from `A_inf`. -/
def Acrys (C : CompleteAlgClosedField.{u} p) : Type u := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : CommRing C.Acrys := sorry

/-- The map `A_inf → A_crys`. -/
noncomputable def toAcrys (C : CompleteAlgClosedField.{u} p) : C.Ainf →+* C.Acrys := sorry

end CompleteAlgClosedField

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): proper smooth log formal
schemes over the base with mod `p` fibre of Cartier type. -/
def ProperCartierType {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying Cartier-type scheme. -/
noncomputable def ProperCartierType.toCartier {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : ProperCartierType P) : CartierTypeLogFormalScheme P := sorry

/-- **Node `PR.8/etale-comparison-over-ainf`** (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)].

Let C be algebraically closed with A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1; (X_0, M_{X_0}) an
fs log p-adic formal scheme smooth and proper over (Spf O_C, M_0)^a with mod p fibre of Cartier
type, base changed to (X, M_X) over a perfect log prism (A_inf, (ξ), M_A) receiving M_0; M :=
RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X,
M_X)^♦_η, Z_p). Then for every i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p)
⊗_{Z_p} A_inf[1/φ^{-1}(μ)].

Hypotheses (packet): As in KY §8 setup; C algebraically closed; properness; Cartier type.

Lean form: over `A_inf(O_C)` with the trivial log structure on the base (`M_0 = M_A = {e}`), an
isomorphism of `A_inf[1/φ⁻¹(μ)]`-modules `H^i_Δ ⊗ A_inf[1/φ⁻¹(μ)] ≅ H^i_qpkét ⊗_{ℤ_p}
A_inf[1/φ⁻¹(μ)]`; general perfect log prism bases are not typed. -/
theorem etaleComparisonAinf {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) (i : ℕ) :
    Nonempty (TensorProduct C.Ainf (Localization.Away C.phiInvMu)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} C.Ainf) i).obj
          (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth)).carrier
          ≃ₗ[Localization.Away C.phiInvMu]
      TensorProduct ℤ_[p] (Localization.Away C.phiInvMu)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} ℤ_[p]) i).obj
          (QProKummerEtale.cohomology (QProKummerEtale.genericFibreOf X.toCartier.toSmooth)
            ℤ_[p])).carrier) := by
  sorry

/-! ## Node `PR.8/log-hyodo-kato-isomorphism` (theorem): Hyodo–Kato isomorphism for log prismatic cohomology over A_crys -/

/-- Placeholder (owner `CrystallineCohomology:CR.6`): `RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))`. -/
noncomputable def crysOverAcrys {p : ℕ} [Fact p.Prime] {C : CompleteAlgClosedField.{u} p}
    (X : ProperCartierType C.ainfBase) : DerivedCategory (ModuleCat.{u} C.Acrys) := sorry

/-- **Node `PR.8/log-hyodo-kato-isomorphism`** (theorem): Hyodo–Kato isomorphism for log prismatic
cohomology over A_crys.

In the setting of the étale comparison over A_inf, let (A_crys, (p), M_crys) be the log prism
associated with M_0 → A_inf → A_crys and (X_0, M_{X_0})_{O_C/p} the base change along Spec(O_C/p,
M_crys)^a → Spf(O_C, M_0)^a. (1) φ^*RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ⊗^L_{A_inf} A_crys ≅
RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys)) Frobenius-equivariantly, and Frobenius is an
isomorphism after inverting p. (2) Let k = O_C/m, (k, N) the log ring associated with (k, M_0) and
(Y, M_Y) the base change of (X_0, M_{X_0}) to (k, N). For a section k → O_C/p, RΓ_crys((Y,
M_Y)/(W(k), N)) ⊗^L_{W(k)} A_crys[1/p] ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))[1/p];
hence each H^i(M ⊗^L_{A_inf,φ} A_crys[1/p]) is a finite free A_crys[1/p]-module.

Hypotheses (packet): As in KY §8; section k → O_C/p fixed.

Lean form of (1) without Frobenius, over `A_inf(O_C)` with trivial base log structure: `φ^* RΓ_Δ
⊗^L_{A_inf} A_crys ≅ RΓ_crys(…/(A_crys, M_crys))`; Frobenius-equivariance and (2) are not typed. -/
theorem hyodoKato {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) :
    Nonempty ((derivedExtendScalars (C.toAcrys.comp C.ainfBase.toPrism.φ)).obj
        (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth) ≅ crysOverAcrys X) := by
  sorry

/-! ## Node `PR.8/log-prismatic-bkf-module` (theorem): Log prismatic cohomology groups are Breuil–Kisin–Fargues modules -/

/-- Placeholder carrier (owner `AInfCohomology:AI.2`): Breuil–Kisin–Fargues modules over `A_inf`
(finitely presented, free after inverting `p`, with `φ_N : N[1/ξ] ≅ N[1/φ(ξ)]`). -/
def BKFModule {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p) : Type (u + 1) := sorry

/-- The underlying `A_inf`-module. -/
noncomputable def BKFModule.toModuleCat {p : ℕ} [Fact p.Prime] {C : CompleteAlgClosedField.{u} p}
    (N : BKFModule C) : ModuleCat.{u} C.Ainf := sorry

/-- **Node `PR.8/log-prismatic-bkf-module`** (theorem): Log prismatic cohomology groups are
Breuil–Kisin–Fargues modules.

In the setting of the étale comparison over A_inf (X proper over O_C, mod p fibre of Cartier type,
perfect log prism base over A_inf), for every i the Frobenius-twisted cohomology φ^*H^i_Δ = H^i_Δ
⊗_{A_inf,φ} A_inf with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented
A_inf-module N, free after inverting p, with a φ-linear φ_N inducing N[1/ξ] ≅ N[1/φ(ξ)]. Moreover
H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗ A_inf[1/φ^{-1}(μ)].

Hypotheses (packet): As in KY §8: X proper; Cartier type; C algebraically closed.

Lean form: `φ^* H^i_Δ = H^i_Δ ⊗_{A_inf, φ} A_inf` (Mathlib `ModuleCat.extendScalars`) underlies a
Breuil–Kisin–Fargues module (trivial base log structure); the étale comparison part is node
`PR.8/etale-comparison-over-ainf`. -/
theorem bkfModule {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) (i : ℕ) :
    ∃ N : BKFModule C, Nonempty (N.toModuleCat ≅ (ModuleCat.extendScalars C.ainfBase.toPrism.φ).obj
      ((DerivedCategory.homologyFunctor _ i).obj
        (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth))) := by
  sorry

/-! ## Node `PR.8/semistable-chart-application` (application): Log prismatic cohomology of the standard semistable chart -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The standard semistable chart `R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π)` with `P = ℕ^r`,
`e_j ↦ x_j`, over a base with monoid `ℕ`, `1 ↦ π`, via the diagonal `ℕ → ℕ^r` (recorded opaquely;
`O_K = A / I` and `π` the image of the generator). -/
noncomputable def semistableChart (P : IntegralBoundedPrelogPrism p A (Multiplicative (ULift.{u} ℕ)))
    (d r : ℕ) : PrelogAlgebra P := sorry

end PrelogAlgebra

/-- **Node `PR.8/semistable-chart-application`** (application): Log prismatic cohomology of the
standard semistable chart.

Let O_K be totally ramified over W(k) with uniformiser π and R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤
r ≤ d) with the canonical log structure given by the chart P = N^r → R, e_j ↦ x_j (j ≤ r), over
(O_K, N → O_K, 1 ↦ π) via the diagonal 1 ↦ e_1 + ⋯ + e_r (the standard semistable chart of CR.5,
with its actual monoid map recording π). Then: (1) (Spf R, P)^a is smooth of Cartier type over (O_K,
N) in Koshikawa's sense, hence over the Breuil–Kisin prelog prism (W(k)[[u]], (E), N → u) via O_K =
W(k)[[u]]/(E); (2) H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}, a free R-module of rank
(d − 1 choose i) with basis the wedge products of dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1
= −Σ_{j=2}^r dlog x_j); (3) the crystalline comparison over (W(k), (p), N → 0), after u ↦ 0,
computes the Hyodo–Kato log crystalline cohomology of the special fibre (Spec k[x_1, …,
x_d]/(x_1⋯x_r), N^r)^a; (4) the de Rham comparison gives Ω^•_{(R,P)/(O_K,N)}; (5) base change along
u ↦ [π♭] gives the A_inf log prismatic cohomology of R_{O_C}, whose Frobenius twist is ČK's AΩ
(semistable-aomega-comparison, on the overlap with AI.6); (6) the Kummer-étale comparison over a
perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale
cohomology because x_1, …, x_r are units on R[1/p], so the log structure is trivial there.

Hypotheses (packet): 1 ≤ r ≤ d; k perfect; the free coordinates x_{r+1}, …, x_d carry no log
structure.

Lean form of (2), over any integral bounded base with monoid `ℕ` (the packet's base is the
Breuil–Kisin prelog prism): the twisted Hodge–Tate cohomology `H^i(Δ̄){i}` is free of rank `(d − 1
choose i)` and `η^i` is an isomorphism; (1) and (3)–(6) are not typed (they rest on the
Cartier-type, crystalline, de Rham, `A_inf` and Kummer-étale statements above). -/
theorem semistableChart_hodgeTate {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    (P : IntegralBoundedPrelogPrism p A (Multiplicative (ULift.{u} ℕ))) (d r : ℕ) (hr : 1 ≤ r)
    (hrd : r ≤ d) (i : ℕ) :
    Module.Free (PrelogAlgebra.semistableChart P d r).R
        (LogPrismaticSite.twistedHomology P (PrelogAlgebra.semistableChart P d r) i) ∧
      Module.finrank (PrelogAlgebra.semistableChart P d r).R
          (LogPrismaticSite.twistedHomology P (PrelogAlgebra.semistableChart P d r) i) =
        (d - 1).choose i ∧
      IsIso (LogPrismaticSite.hodgeTateMap P (PrelogAlgebra.semistableChart P d r) i) := by
  sorry

/-! ## Algebraic API contracts
The carriers of free constructions and chart changes below are supplier interfaces. Their
universal properties are separate assertions, so no construction's conclusion is hidden in
its carrier. General completely flatness is expressed through derived reduction modulo the
completion ideal, using DD.1's derived scalar extension.
-/
namespace DeltaLogRing
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
/-- API `DeltaLogRing.mk`: the generated constructor has all three delta-log axioms. -/
example (d : DeltaStructure p A) (α : M →* A) (l : M → A)
    (h1 : l 1 = 0) (ha : ∀ m, α m ^ p * l m = d.delta (α m))
    (hm : ∀ x y, l (x*y) = l x + l y + (p:A)*l x*l y) :
    DeltaLogRing p A M := ⟨d, α, l, h1, ha, hm⟩
noncomputable def wittSection (d : DeltaStructure p A) : A →+* TruncatedWittVector p 2 A := sorry
/-- The section is determined by the delta-ring structure, not an arbitrary ring homomorphism. -/
theorem wittSection_coeff_zero (d : DeltaStructure p A) (a : A) :
    (wittSection d a).coeff 0 = a := by sorry
theorem wittSection_coeff_one (d : DeltaStructure p A) (a : A) :
    (wittSection d a).coeff 1 = d.delta a := by sorry
noncomputable def wittTeich (a : A) : TruncatedWittVector p 2 A :=
  TruncatedWittVector.mk p (fun i => if i = 0 then a else 0)
/-- API `DeltaLogRing.equivWittSection`: first Witt coefficient one, with the section identity. -/
noncomputable def equivWittSection (d : DeltaStructure p A) (α : M →* A) :
    {D : DeltaLogRing p A M // D.delta = d ∧ D.α = α} ≃
      {w : M →* TruncatedWittVector p 2 A //
        (∀ m, (w m).coeff 0 = 1) ∧ ∀ m, wittSection d (α m) = wittTeich (α m) * w m} := sorry
/-- Carrier of the relative free ring A{N}, with the coefficient map. -/
def FreeRing (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] : Type u := sorry
noncomputable instance (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
  CommRing (FreeRing D N) := sorry
noncomputable instance (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
  Algebra A (FreeRing D N) := sorry
/-- API `DeltaLogRing.freeOnMonoid`: the coproduct monoid M × N. -/
noncomputable def freeOnMonoid (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    DeltaLogRing p (FreeRing D N) (M × N) := sorry
noncomputable def freeOnMonoid.inclusion (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    Hom D (freeOnMonoid D N) := sorry
/-- API `DeltaLogRing.freeOnMonoid.lift`: evaluation of the adjoined monoid and unique extension. -/
theorem freeOnMonoid.lift (D : DeltaLogRing p A M) {B Q N : Type u} [CommRing B]
    [CommMonoid Q] [CommMonoid N] (E : DeltaLogRing p B Q) (f : Hom D E) (g : N →* Q) :
    ∃! h : Hom (freeOnMonoid D N) E,
      h.ring.comp (freeOnMonoid.inclusion D N).ring = f.ring ∧
      (∀ m, h.monoid (m,1) = f.monoid m) ∧ ∀ n, h.monoid (1,n) = g n := by sorry
/-- API `DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat`. -/
theorem freeOneGenerator_frobenius_faithfullyFlat :
    RingHom.FaithfullyFlat (freeFrobenius (p := p)) := by sorry
/-- The category and its forgetful functor to ring/monoid pairs. -/
def Cat (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable instance : Category.{u} (Cat.{u} p) := sorry
noncomputable def forgetPairs : Cat.{u} p ⥤ CommRingCat.{u} × CommMonCat.{u} := sorry
/-- API `DeltaLogRing.hasLimits`: both kinds of small diagrams and their preservation. -/
theorem hasLimits : Limits.HasLimits (Cat.{u} p) ∧ Limits.HasColimits (Cat.{u} p) ∧
    Limits.PreservesLimits (forgetPairs (p := p)) ∧
    Limits.PreservesColimits (forgetPairs (p := p)) := by sorry
/-- Ring freely generated by the invertible log generator; freeness asserted separately. -/
def FreeInvertibleRing (p : ℕ) [Fact p.Prime] : Type u := sorry
noncomputable instance : CommRing (FreeInvertibleRing.{u} p) := sorry
/-- API `DeltaLogRing.invertGenerator_completion`: the p-completion of x-localization. -/
theorem invertGenerator_completion : Nonempty (
    AdicCompletion (Ideal.span {(p : Localization.Away (freeX (p := p)))})
      (Localization.Away (freeX (p := p))) ≃+*
    AdicCompletion (Ideal.span {(p : FreeInvertibleRing.{0} p)}) (FreeInvertibleRing.{0} p)) := by sorry
/-- Unit test `DeltaLogRing.freeOnMonoid_trivial`: only the coefficient ring is unchanged. -/
example (D : DeltaLogRing p A M) : Nonempty (FreeRing D PUnit.{u+1} ≃ₐ[A] A) := by sorry
end DeltaLogRing

/-- DD.1 reduction test for J-complete flatness; use this general supplier, not a PR.8 theory. -/
def IsCompletelyFlat {A B : Type u} [CommRing A] [CommRing B] (J : Ideal A) (f : A →+* B) : Prop :=
  ∃ V : ModuleCat.{u} (A ⧸ J), Module.Flat (A ⧸ J) V ∧ Nonempty
    ((derivedExtendScalars (Ideal.Quotient.mk J)).obj
      ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj
        ((ModuleCat.restrictScalars f).obj (ModuleCat.of B B))) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} (A ⧸ J)) 0).obj V)

namespace PrelogPrism
variable {p : ℕ} [Fact p.Prime] {A M B : Type u} [CommRing A] [CommMonoid M] [CommRing B]
/-- API `PrelogPrism.mk`: the constructor includes the three prism axioms. -/
example (T : DeltaLogTriple p A M) (hi : Module.Invertible A T.ideal)
    (hc : IsDerivedComplete (Ideal.span {(p:A)} ⊔ T.ideal)
      ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)))
    (hp : (p:A) ∈ T.ideal ⊔ T.ideal.map T.delta.frobenius) : PrelogPrism p A M := ⟨T,hi,hc,hp⟩
/-- API `PrelogPrism.baseChange_of_flat`: no prism hypotheses are assumed for B. -/
noncomputable def baseChange_of_flat (P : PrelogPrism p A M) (hb : P.IsBounded)
    (d : DeltaStructure p B) (f : A →+* B) (hf : IsDeltaHom p P.delta d f)
    (hc : IsDerivedComplete ((Ideal.span {(p:A)} ⊔ P.ideal).map f)
      ((DerivedCategory.singleFunctor (ModuleCat.{u} B) 0).obj (ModuleCat.of B B)))
    (hflat : IsCompletelyFlat (Ideal.span {(p:A)} ⊔ P.ideal) f) : PrelogPrism p B M := sorry
/-- API `PrelogPrism.rigid`: Cartier ideal after base change iff I-torsion vanishes.
The p-completeness and prism p-membership hypotheses still apply. -/
theorem rigid (P : PrelogPrism p A M) (d : DeltaStructure p B) (f : A →+* B)
    (hf : IsDeltaHom p P.delta d f)
    (hc : IsDerivedComplete ((Ideal.span {(p:A)} ⊔ P.ideal).map f)
      ((DerivedCategory.singleFunctor (ModuleCat.{u} B) 0).obj (ModuleCat.of B B))) :
    (∃ Q : PrelogPrism p B M, Q.delta = d ∧ Q.ideal = P.ideal.map f ∧
      Q.α = f.toMonoidHom.comp P.α) ↔
    ∀ b : B, (∀ a ∈ P.ideal, f a * b = 0) → b = 0 := by sorry
/-- Unit test `PrelogPrism.forget_compat`: crystalline zero log prism. -/
example (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    (crystallineZeroLog k Q hQ).toPrism = Q := by sorry
end PrelogPrism
namespace LogPrism
variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
def Point (L : LogPrism p A) : Type u := sorry
def Stalk (L : LogPrism p A) (x : L.Point) : Type u := sorry
noncomputable instance (L : LogPrism p A) (x : L.Point) : CommMonoid (L.Stalk x) := sorry
/-- API `LogPrism.IsIntegral`: actual stalkwise cancellativity. -/
def IsIntegral (L : LogPrism p A) : Prop := ∀ x : L.Point, IsCancelMul (L.Stalk x)
noncomputable instance : Category.{u} (LogPrism p A) := sorry
/-- The global-sections logification map; it is not assumed to be an isomorphism. -/
noncomputable def counit (L : LogPrism p A) :
  ofPrelog L.globalSections (by sorry) ⟶ L := sorry
/-- Unit test `LogPrism.globalSections_not_inverse`: the failure permitted by K1 Remark 3.5.
No canonical explicit counterexample is supplied in that remark; this is the existential contract. -/
example : ∃ (A : Type u) (_ : CommRing A) (L : LogPrism p A), ¬ IsIso (counit L) := by sorry
/-- API `LogPrism.IsPerfect.pSaturated`: saturation under p-th powers, not all roots. -/
theorem IsPerfect.pSaturated {M : Type u} [CommMonoid M] (T : PrelogPrism p A M)
    (hl : DeltaLogRing.IsLogRing T.α) (hp : (p:A) ∈ Ideal.jacobson (⊥:Ideal A))
    (h : IsPerfect T hl hp) (x : Algebra.GrothendieckGroup M)
    (hx : x ^ p ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M))) :
    x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M)) := by sorry
end LogPrism
namespace Monoid
variable {p : ℕ} [Fact p.Prime]
/-- Unit test `Monoid.tilt_nat_inv_p`: unique p-divisibility and its inverse-limit model. -/
example : IsPerfect (NatInvP p) p ∧ Nonempty (tilt (NatInvP p) p ≃* NatInvP p) := by sorry
/-- Q0's algebraically closed perfectoid field and its valuation ring. -/
def AlgebraicallyClosedPerfectoidField (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
def AlgebraicallyClosedPerfectoidField.integers (C : AlgebraicallyClosedPerfectoidField.{u} p) :
    Type u := sorry
noncomputable instance (C : AlgebraicallyClosedPerfectoidField.{u} p) :
  CommRing C.integers := sorry
noncomputable instance (C : AlgebraicallyClosedPerfectoidField.{u} p) : IsDomain C.integers := sorry
/-- Unit test `Monoid.valuationMonoid_perfectoid_not_perfect`. -/
example (C : AlgebraicallyClosedPerfectoidField.{u} p) :
    IsPerfectoid (nonZeroDivisors C.integers) p ∧
    ¬ IsPerfect (nonZeroDivisors C.integers) p := by sorry
/-- The presented monoid of KY Example 2.8; the relations are a separate presentation contract. -/
def TwistedRootMonoid (p : ℕ) : Type := sorry
noncomputable instance : CommMonoid (TwistedRootMonoid p) := sorry
noncomputable instance : IsCancelMul (TwistedRootMonoid p) := sorry
noncomputable def TwistedRootMonoid.x (i : ℕ) : TwistedRootMonoid p := sorry
noncomputable def TwistedRootMonoid.y (i : ℕ) : (TwistedRootMonoid p)ˣ := sorry
theorem TwistedRootMonoid.relation (i : ℕ) :
  x (p := p) (i+1) ^ p = x (p := p) i * y (p := p) (i+1) := by sorry
/-- Unit test `Monoid.pseudoPerfectoid_not_perfectoid`: characteristic quotient and trivial tilt. -/
example : IsPseudoPerfectoid (TwistedRootMonoid p) p ∧
    Nonempty (Associates (TwistedRootMonoid p) ≃* NatInvP p) ∧
    Subsingleton (tilt (TwistedRootMonoid p) p) ∧ ¬ IsPerfectoid (TwistedRootMonoid p) p := by sorry
/-- Unit test `Monoid.tilt_compat_pretilt`: multiplicative identification, not additive perfection. -/
example (R : PerfectoidRing.{u} p) : Nonempty (tilt R.carrier p ≃* PreTilt R.carrier p) := by sorry
end Monoid

namespace DeltaLogTriple
variable {p : ℕ} [Fact p.Prime] {A M N : Type u} [CommRing A] [CommMonoid M] [CommMonoid N]
/-- The surjective integral chart map onto the quotient; the ring is already A/I. -/
structure ExactificationDatum (T : DeltaLogTriple p A M) (N : Type u) [CommMonoid N] where
  αN : N →* (A ⧸ T.ideal)
  h : M →* N
  surj : Function.Surjective h
  comm : ∀ m, αN (h m) = Ideal.Quotient.mk T.ideal (T.α m)
  integralM : IsCancelMul M
  integralN : IsCancelMul N
  complete : IsAdicComplete (Ideal.span {(p:A)}) A
/-- The algebraic tensor-product ring of K1 Construction 2.17. It is not yet completed. -/
def ExactificationRing {T : DeltaLogTriple p A M} (d : ExactificationDatum T N) : Type u := sorry
noncomputable instance {T : DeltaLogTriple p A M} (d : ExactificationDatum T N) :
    CommRing (ExactificationRing d) := sorry
/-- API `DeltaLogTriple.exactification`: the monoid is the actual group-completion preimage. -/
noncomputable def exactification {T : DeltaLogTriple p A M} (d : ExactificationDatum T N) :
    DeltaLogTriple p (ExactificationRing d) (exactificationMonoid d.h) := sorry
noncomputable def exactification.map {T : DeltaLogTriple p A M} (d : ExactificationDatum T N) :
    Hom T (exactification d) := sorry
noncomputable def exactification.toQuotient {T : DeltaLogTriple p A M}
    (d : ExactificationDatum T N) : ExactificationRing d →+* (A ⧸ T.ideal) := sorry
noncomputable def exactification.toN {T : DeltaLogTriple p A M}
    (d : ExactificationDatum T N) : exactificationMonoid d.h →* N := sorry
/-- API `DeltaLogTriple.exactification.toQuotient_exactSurjective`. -/
theorem exactification.toQuotient_exactSurjective {T : DeltaLogTriple p A M}
    (d : ExactificationDatum T N) : IsExactSurjection (exactification.toQuotient d)
      (exactification.toN d) ∧ (exactification d).ideal = RingHom.ker (exactification.toQuotient d) := by sorry
/-- API `DeltaLogTriple.exactification.lift`: compatible exact quotient on the target. -/
theorem exactification.lift {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {B Q : Type u} [CommRing B] [CommMonoid Q] (U : DeltaLogTriple p B Q)
    (f : Hom T U) (r : B →+* (A ⧸ T.ideal)) (s : Q →* N)
    (hex : IsExactSurjection r s) (hc : r.comp f.toHom.ring = Ideal.Quotient.mk T.ideal)
    (hm : s.comp f.toHom.monoid = d.h) :
    ∃! g : Hom (exactification d) U,
      g.toHom.ring.comp (exactification.map d).toHom.ring = f.toHom.ring ∧
      g.toHom.monoid.comp (exactification.map d).toHom.monoid = f.toHom.monoid := by sorry
/-- Base-changed exactification datum. The compatible quotient identification is part of it. -/
def BaseChangeDatum {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {B : Type u} [CommRing B] (f : A →+* B) : Type (u+1) := sorry
noncomputable def BaseChangeDatum.triple {T : DeltaLogTriple p A M}
    {d : ExactificationDatum T N} {B : Type u} [CommRing B] {f : A →+* B}
    (e : BaseChangeDatum d f) : DeltaLogTriple p B M := sorry
noncomputable def BaseChangeDatum.datum {T : DeltaLogTriple p A M}
    {d : ExactificationDatum T N} {B : Type u} [CommRing B] {f : A →+* B}
    (e : BaseChangeDatum d f) : ExactificationDatum e.triple N := sorry
/-- The algebraic ring base change B ⊗_A A′. -/
def BaseChangeRing {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {B : Type u} [CommRing B] (f : A →+* B) : Type u := sorry
noncomputable instance {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {B : Type u} [CommRing B] (f : A →+* B) : CommRing (BaseChangeRing d f) := sorry
/-- API `DeltaLogTriple.exactification.baseChange`: algebraic base change, before completion. -/
theorem exactification.baseChange {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {B : Type u} [CommRing B] (f : A →+* B) (e : BaseChangeDatum d f) :
    Nonempty (ExactificationRing e.datum ≃+* BaseChangeRing d f) := by sorry
/-- CR.5 integrality of a monoid map: cancellation in every integral pushout. -/
def MonoidPushout {P Q R : Type u} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) : Type u := sorry
noncomputable instance {P Q R : Type u} [CommMonoid P] [CommMonoid Q] [CommMonoid R]
    (f : P →* Q) (g : P →* R) : CommMonoid (MonoidPushout f g) := sorry
def IsIntegralMap {P Q : Type u} [CommMonoid P] [CommMonoid Q] (f : P →* Q) : Prop :=
  ∀ (R : Type u) (_ : CommMonoid R) (_ : IsCancelMul R) (g : P →* R),
    IsCancelMul (MonoidPushout f g)
/-- API `DeltaLogTriple.exactification.integral`: the source/base map, not N → M′. -/
theorem exactification.integral {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    {P : Type u} [CommMonoid P] [IsCancelMul P] (g : P →* M)
    (hg : IsIntegralMap (d.h.comp g)) :
    IsIntegralMap ((exactification.map d).toHom.monoid.comp g) := by sorry
/-- Unit test `DeltaLogTriple.exactification_of_exact`: identity ring and chart after exactification. -/
example {T : DeltaLogTriple p A M} (d : ExactificationDatum T N)
    (he : IsExactSurjection (Ideal.Quotient.mk T.ideal) d.h) :
    Function.Bijective (exactification.map d).toHom.ring ∧
    Function.Bijective (exactification.map d).toHom.monoid := by sorry
/-- The diagonal N² → N, and its group-completion inverse image. -/
def diagonalChart : Multiplicative ℕ × Multiplicative ℕ →* Multiplicative ℕ :=
  (MonoidHom.id _).coprod (MonoidHom.id _)
/-- Unit test `DeltaLogTriple.exactification_diagonal`: N·(x₁/x₀)^Z, before completion. -/
example : Nonempty (exactificationMonoid diagonalChart ≃* Multiplicative ℕ × Multiplicative ℤ) := by sorry
/-- Unit test `DeltaLogTriple.exactification_not_ring_quotient`: chart units really change.
This detects the same diagonal defect already at the monoid level. -/
example : ¬ Subsingleton (exactificationMonoid diagonalChart)ˣ ∧
    Subsingleton (Multiplicative ℕ × Multiplicative ℕ)ˣ := by sorry
end DeltaLogTriple

/-! Tests of envelopes use the same diagonal datum and a PR.0 delta-envelope interface.
The latter's carrier is an ordinary algebraic construction, not a proposition that its
comparison with the log envelope has already been proved.
-/
namespace PrelogPrism
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
def OrdinaryEnvelopeRing {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type u := sorry
noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    CommRing (OrdinaryEnvelopeRing E) := sorry
/-- Unit test `PrelogPrism.envelope_trivial_log`: ordinary envelope on trivial charts. -/
example {P : PrelogPrism p A PUnit.{u+1}} (E : EnvelopeDatum P)
    (hB : Subsingleton E.MB) (hN : Subsingleton E.N) :
    Nonempty (EnvelopeRing E ≃+* OrdinaryEnvelopeRing E) := by sorry
noncomputable def diagonalEnvelopeDatum (P : IntegralBoundedPrelogPrism p A M)
    (ho : P.toPrism.IsOrientable) : EnvelopeDatum P.toPrelogPrism := sorry
/-- PR.0 delta envelope of the exactified diagonal, completed in (p,I). -/
def ExactifiedDiagonalEnvelopeRing (P : IntegralBoundedPrelogPrism p A M) : Type u := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A M) :
    CommRing (ExactifiedDiagonalEnvelopeRing P) := sorry
/-- Unit test `PrelogPrism.envelope_log_line_diagonal`: the exactified delta envelope. -/
example (P : IntegralBoundedPrelogPrism p A M) (ho : P.toPrism.IsOrientable) :
    Nonempty (EnvelopeRing (diagonalEnvelopeDatum P ho) ≃+* ExactifiedDiagonalEnvelopeRing P) ∧
    Nonempty (EnvelopeMonoid (diagonalEnvelopeDatum P ho) ≃* M × Multiplicative ℕ × Multiplicative ℤ) := by sorry
/-- Unit test `PrelogPrism.envelope_not_without_exactification`: failure of the ordinary HT map. -/
example (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (LogPrismaticSite.forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by sorry
end PrelogPrism

namespace LogPrismaticSite
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}
/-- Objects with the prescribed p-completely étale reduction and its identification.
The complete-étaleness condition belongs to PR.0's lifting interface and is omitted here;
this carrier records that input, rather than assuming the lift exists. -/
def EtaleReductionDatum {X : SmoothLogFormalScheme P} (U : LogPrismaticSite P X) : Type (u+1) := sorry
def EtaleLiftCat {X : SmoothLogFormalScheme P} {U : LogPrismaticSite P X}
    (d : EtaleReductionDatum U) : Type (u+1) := sorry
noncomputable instance {X : SmoothLogFormalScheme P} {U : LogPrismaticSite P X}
    (d : EtaleReductionDatum U) : Category.{u} (EtaleLiftCat d) := sorry
/-- API `LogPrismaticSite.etaleLift`: terminal object in the category of identified lifts. -/
theorem etaleLift {X : SmoothLogFormalScheme P} {U : LogPrismaticSite P X}
    (d : EtaleReductionDatum U) : ∃ L : EtaleLiftCat d, Nonempty (Limits.IsTerminal L) := by sorry
/-- PR.1's relative ordinary site. The base chart and the algebra chart below are trivial. -/
def OrdinaryRelativeSite (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] : Type (u+1) := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] : Category.{u} (OrdinaryRelativeSite P R) := sorry
noncomputable def SmoothPrelogAlgebra.strict (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R] : SmoothPrelogAlgebra P := sorry
/-- API `LogPrismaticSite.trivialLog_equiv`: underlying site-category equivalence.
Continuity and structure-sheaf identification are separate supplier conditions. -/
noncomputable def trivialLog_equiv (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R] :
    LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.strict P R)) ≌
      OrdinaryRelativeSite P R := sorry
/-- API `LogPrismaticSite.chart_independent`: two charts of the same associated log base.
The formal log base isomorphism, with its compatibility on X, is represented by this datum. -/
def ChangeChartDatum (P : IntegralBoundedPrelogPrism p A M) {N : Type u} [CommMonoid N]
    (Q : IntegralBoundedPrelogPrism p A N) (X : SmoothLogFormalScheme P)
    (Y : SmoothLogFormalScheme Q) : Type (u+1) := sorry
theorem chart_independent {N : Type u} [CommMonoid N]
    (Q : IntegralBoundedPrelogPrism p A N) (X : SmoothLogFormalScheme P)
    (Y : SmoothLogFormalScheme Q) (c : ChangeChartDatum P Q X Y) :
    Nonempty (LogPrismaticSite P X ≌ LogPrismaticSite Q Y) := by sorry
/-- Unit test `LogPrismaticSite.trivialLog`: the actual ordinary site equivalence. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1}) (R : Type u) [CommRing R]
    [Algebra P.bar R] [Algebra.Smooth P.bar R] :
    Nonempty (LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.strict P R)) ≌
      OrdinaryRelativeSite P R) := by sorry
/-- Derived reduction definition of completely flat modules (DD.1 supplier). -/
def IsCompletelyFlatModule (J : Ideal A) (V : ModuleCat.{u} A) : Prop :=
  ∃ W : ModuleCat.{u} (A ⧸ J), Module.Flat (A ⧸ J) W ∧ Nonempty
    ((derivedExtendScalars (Ideal.Quotient.mk J)).obj
      ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj V) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} (A ⧸ J)) 0).obj W)
/-- API `LogPrismaticSite.cechAlexander_flat`: complete flatness at every cosimplicial degree. -/
theorem cechAlexander_flat (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) (n : ℕ) :
    IsCompletelyFlatModule P.pI ((cechAlexander X c).obj (SimplexCategory.mk n)) := by sorry
noncomputable def CechAlexanderDatum.baseChange {A' N : Type u} [CommRing A'] [CommMonoid N]
    {P' : IntegralBoundedPrelogPrism p A' N} (X : SmoothPrelogAlgebra P)
    (c : CechAlexanderDatum X) (f : IntegralBoundedPrelogPrism.BaseHom P P') :
    SmoothPrelogAlgebra P' := sorry
noncomputable def CechAlexanderDatum.baseChangePresentation {A' N : Type u} [CommRing A']
    [CommMonoid N] {P' : IntegralBoundedPrelogPrism p A' N} (X : SmoothPrelogAlgebra P)
    (c : CechAlexanderDatum X) (f : IntegralBoundedPrelogPrism.BaseHom P P') :
    CechAlexanderDatum (c.baseChange X f) := sorry
/-- API `LogPrismaticSite.cechAlexander_baseChange`: completed levelwise change for a fixed
presentation. The derived version compares D(A′)-valued cosimplicial objects. -/
theorem cechAlexander_baseChange {A' N : Type u} [CommRing A'] [CommMonoid N]
    (P' : IntegralBoundedPrelogPrism p A' N) (f : IntegralBoundedPrelogPrism.BaseHom P P')
    (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) : Nonempty
    (cechAlexander X c ⋙ DerivedCategory.singleFunctor (ModuleCat.{u} A) 0 ⋙
        completedExtendScalars f.toHom.ring P'.pI ≅
      cechAlexander (c.baseChange X f) (c.baseChangePresentation X f) ⋙
        DerivedCategory.singleFunctor (ModuleCat.{u} A') 0) := by sorry
noncomputable def affineLineCechDatum (P : IntegralBoundedPrelogPrism p A M) :
    CechAlexanderDatum (SmoothPrelogAlgebra.logAffineLine P) := sorry
/-- δ-envelope term with n ratio coordinates, the formula in K1 §5.4. -/
def DiagonalCechRing (P : IntegralBoundedPrelogPrism p A M) (n : ℕ) : Type u := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A M) (n : ℕ) :
    CommRing (DiagonalCechRing P n) := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A M) (n : ℕ) :
    Algebra A (DiagonalCechRing P n) := sorry
/-- Unit test `LogPrismaticSite.cechAlexander_affineLine`: degree n is the ratio envelope. -/
example (P : IntegralBoundedPrelogPrism p A M) (n : ℕ) : Nonempty
    ((cechAlexander (SmoothPrelogAlgebra.logAffineLine P) (affineLineCechDatum P)).obj
        (SimplexCategory.mk n) ≅ ModuleCat.of A (DiagonalCechRing P n)) := by sorry
/-- PR.1's ordinary Čech object, using exactly the same presentation. -/
noncomputable def ordinaryCech (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R]
    (c : CechAlexanderDatum (SmoothPrelogAlgebra.strict P R)) : CosimplicialObject (ModuleCat.{u} A) := sorry
/-- Unit test `LogPrismaticSite.cechAlexander_trivialLog`. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1}) (R : Type u) [CommRing R]
    [Algebra P.bar R] [Algebra.Smooth P.bar R]
    (c : CechAlexanderDatum (SmoothPrelogAlgebra.strict P R)) :
    Nonempty (cechAlexander (SmoothPrelogAlgebra.strict P R) c ≅ ordinaryCech P R c) := by sorry
/-- Unit test `LogPrismaticSite.cechAlexander_needs_exactification`: ordinary vs logarithmic HT. -/
example (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by sorry
end LogPrismaticSite

namespace AbsoluteLogPrismaticSite
variable {p : ℕ} [Fact p.Prime]
/-- Integral strict variant of the absolute log site. -/
def strict (X : IntegralLogFormalScheme.{u} p) : Type (u+1) := sorry
noncomputable instance (X : IntegralLogFormalScheme.{u} p) : Category.{u} (strict X) := sorry
/-- PR.5's ordinary absolute site and its trivial-log formal scheme. -/
def OrdinaryFormalScheme (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def OrdinaryFormalScheme.trivial (X : OrdinaryFormalScheme.{u} p) :
    IntegralLogFormalScheme.{u} p := sorry
def OrdinaryAbsoluteSite (X : OrdinaryFormalScheme.{u} p) : Type (u+1) := sorry
noncomputable instance (X : OrdinaryFormalScheme.{u} p) : Category.{u} (OrdinaryAbsoluteSite X) := sorry
/-- API `AbsoluteLogPrismaticSite.trivialLog`: the strict site, rather than the integral variant. -/
noncomputable def trivialLog (X : OrdinaryFormalScheme.{u} p) :
    strict X.trivial ≌ OrdinaryAbsoluteSite X := sorry
/-- Finite totally ramified extension of W(k)[1/p], with its valuation log structure. -/
def RamifiedDVR (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def RamifiedDVR.formal (K : RamifiedDVR.{u} p) : IntegralLogFormalScheme.{u} p := sorry
noncomputable def RamifiedDVR.bkObject (K : RamifiedDVR.{u} p) : AbsoluteLogPrismaticSite K.formal := sorry
/-- Unit test `AbsoluteLogPrismaticSite.bk_covers`: a cover of the final sheaf. -/
example (K : RamifiedDVR.{u} p) : (flatTopology K.formal).CoversTop
    (fun _ : Unit => K.bkObject) := by sorry
noncomputable def perfectoidPoint (C : Monoid.AlgebraicallyClosedPerfectoidField.{u} p) :
    IntegralLogFormalScheme.{u} p := sorry
noncomputable def ainfObject (C : Monoid.AlgebraicallyClosedPerfectoidField.{u} p) :
    AbsoluteLogPrismaticSite (perfectoidPoint C) := sorry
/-- Unit test `AbsoluteLogPrismaticSite.point_perfect`: weak finality allows nonunique maps. -/
example (C : Monoid.AlgebraicallyClosedPerfectoidField.{u} p) :
    ∀ U : AbsoluteLogPrismaticSite (perfectoidPoint C), Nonempty (U ⟶ ainfObject C) := by sorry
/-- Unit test `AbsoluteLogPrismaticSite.trivialLog_test`: the strict absolute site recovers
PR.5's ordinary absolute site, including its morphisms, for the trivial log structure. -/
example (X : OrdinaryFormalScheme.{u} p) :
    Nonempty (strict X.trivial ≌ OrdinaryAbsoluteSite X) := by sorry
end AbsoluteLogPrismaticSite

namespace LogPrismaticSite
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}
/-- The graded product in the twisted Hodge–Tate groups, inherited from the E∞ algebra. -/
noncomputable def twistedMul (X : PrelogAlgebra P) (i j : ℕ) :
    twistedHomology P X i → twistedHomology P X j → twistedHomology P X (i+j) := sorry
noncomputable def dlogGp (X : PrelogAlgebra P) :
    Algebra.GrothendieckGroup X.Q →* Multiplicative (logKaehler X) :=
  Algebra.GrothendieckGroup.lift (dlog X)
/-- API `LogPrismaticSite.hodgeTateMap_dlog_sq`: the square of the class is zero, including at p=2. -/
theorem hodgeTateMap_dlog_sq (X : PrelogAlgebra P) (q : Algebra.GrothendieckGroup X.Q) :
    let z := (hodgeTateMap P X 1)
      (exteriorPower.ιMulti X.R 1 (fun _ => Multiplicative.toAdd (dlogGp X q)))
    twistedMul X 1 1 z z = 0 := by sorry
noncomputable def nonlogDifferentials (X : PrelogAlgebra P) :
    KaehlerDifferential P.bar X.R →ₗ[X.R] logKaehler X := sorry
noncomputable def ordinaryTwistedHomology (X : PrelogAlgebra P) (i : ℕ) : ModuleCat.{u} X.R := sorry
noncomputable def ordinaryHT1 (X : PrelogAlgebra P) :
    KaehlerDifferential P.bar X.R →ₗ[X.R]
      ordinaryTwistedHomology X 1 := sorry
noncomputable def forgetHT1 (X : PrelogAlgebra P) :
    ordinaryTwistedHomology X 1 →ₗ[X.R]
      twistedHomology P X 1 := sorry
/-- API `LogPrismaticSite.hodgeTateMap_restrict_nonlog`: a square, with no injectivity assertion. -/
theorem hodgeTateMap_restrict_nonlog (X : PrelogAlgebra P) (ω : KaehlerDifferential P.bar X.R) :
    (hodgeTateMap P X 1) (exteriorPower.ιMulti X.R 1 (fun _ => nonlogDifferentials X ω)) =
      forgetHT1 X (ordinaryHT1 X ω) := by sorry
/-- DD.6 cotangent complex over the prism, and the H⁰ map of its natural η morphism.
The construction of the map is the transitivity/exact immersion construction in K1 §5.2. -/
noncomputable def cotangentOverPrism (X : PrelogAlgebra P) : DerivedCategory (ModuleCat.{u} X.R) := sorry
noncomputable def cotangentH0Differentials (X : PrelogAlgebra P) :
    (DerivedCategory.homologyFunctor (ModuleCat.{u} X.R) 0).obj (cotangentOverPrism X) ≅
      ModuleCat.of X.R (logKaehler X) := sorry
noncomputable def cotangentEtaH0 (X : PrelogAlgebra P) :
    (DerivedCategory.homologyFunctor (ModuleCat.{u} X.R) 0).obj (cotangentOverPrism X) ⟶ twistedHomology P X 1 := sorry
/-- API `LogPrismaticSite.hodgeTateMap_cotangent`: identify η¹ with the H⁰ cotangent map. -/
theorem hodgeTateMap_cotangent (X : PrelogAlgebra P)
    (z : (DerivedCategory.homologyFunctor (ModuleCat.{u} X.R) 0).obj (cotangentOverPrism X)) :
    cotangentEtaH0 X z = (hodgeTateMap P X 1)
      (exteriorPower.ιMulti X.R 1 (fun _ => (cotangentH0Differentials X).hom z)) := by sorry
noncomputable def exteriorMap {X Y : PrelogAlgebra P} (f : PrelogAlgebra.Hom X Y) (i : ℕ) :
    ModuleCat.of X.R (⋀[X.R]^i (logKaehler X)) ⟶
      (ModuleCat.restrictScalars f.ring.toRingHom).obj (ModuleCat.of Y.R (⋀[Y.R]^i (logKaehler Y))) := sorry
noncomputable def htMap {X Y : PrelogAlgebra P} (f : PrelogAlgebra.Hom X Y) (i : ℕ) :
    twistedHomology P X i ⟶
      (ModuleCat.restrictScalars f.ring.toRingHom).obj (twistedHomology P Y i) := sorry
/-- API `LogPrismaticSite.hodgeTateMap_natural`: source and target are restricted to X.R. -/
theorem hodgeTateMap_natural {X Y : PrelogAlgebra P} (f : PrelogAlgebra.Hom X Y) (i : ℕ) :
    hodgeTateMap P X i ≫ htMap f i = exteriorMap f i ≫
      (ModuleCat.restrictScalars f.ring.toRingHom).map (hodgeTateMap P Y i) := by sorry
/-- The class of the ratio-coordinate cocycle (x₁/x₀−1)/d ⊗ d, not an arbitrary chosen generator. -/
noncomputable def ratioCocycleClass (P : IntegralBoundedPrelogPrism p A M)
    (d : A) (hd : P.toPrism.I = Ideal.span {d}) :
    twistedHomology P (PrelogAlgebra.logAffineLine P) 1 := sorry
/-- Unit test `LogPrismaticSite.hodgeTateMap_affineLine`. -/
example (P : IntegralBoundedPrelogPrism p A M) (d : A) (hd : P.toPrism.I = Ideal.span {d}) :
    (hodgeTateMap P (PrelogAlgebra.logAffineLine P) 1)
      (exteriorPower.ιMulti _ 1 (fun _ => Multiplicative.toAdd
        (dlog (PrelogAlgebra.logAffineLine P) (PrelogAlgebra.logAffineLine.X P)))) =
      ratioCocycleClass P d hd := by sorry
noncomputable def htStructureMap (X : PrelogAlgebra P) : X.R →ₗ[X.R] twistedHomology P X 0 := sorry
/-- Unit test `LogPrismaticSite.hodgeTateMap_degree0`: η⁰ is induced by the structure map. -/
example (X : PrelogAlgebra P) : (hodgeTateMap P X 0)
    (exteriorPower.ιMulti X.R 0 (fun i => Fin.elim0 i)) = htStructureMap X 1 := by sorry
/-- Unit test `LogPrismaticSite.hodgeTateMap_trivialLog`: agreement in degree one. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (X : PrelogAlgebra P) (ω : KaehlerDifferential P.bar X.R) :
    (hodgeTateMap P X 1)
      (exteriorPower.ιMulti X.R 1 (fun _ => nonlogDifferentials X ω)) =
      forgetHT1 X (ordinaryHT1 X ω) := by sorry
end LogPrismaticSite

namespace DeltaLogCrystallineSite
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}
def objRing {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : Type u := sorry
noncomputable instance {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : CommRing (objRing U) := sorry
noncomputable def objPrism {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : Prism p (objRing U) := sorry
noncomputable def objBaseMap {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : A →+* objRing U := sorry
noncomputable def objIdeal {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : Ideal (objRing U) := sorry
noncomputable def objPD {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) : DividedPowers (objIdeal U) := sorry
/-- API `DeltaLogCrystallineSite.pd_compatible`: the base PD structure is the canonical one on (p).
The full arbitrary PD-base version is in the reader; this signature tests the I=(p) specialization. -/
theorem pd_compatible {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) (dp : DividedPowers (Ideal.span {(p:A)}))
    (hdp : ∀ n a, a ∈ Ideal.span {(p:A)} → (n.factorial:A) * dp.dpow n a = a ^ n) (n : ℕ)
    (a : A) (ha : a ∈ Ideal.span {(p:A)}) :
    (objPD U).dpow n (objBaseMap U a) = objBaseMap U (dp.dpow n a) := by sorry
/-- CR.5 ordinary crystalline cohomology at the same base. -/
noncomputable def ordinaryCrys (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (hP : P.CrystallineBase) (R : Type u) [CommRing R] [Algebra P.bar R] :
    DerivedCategory (ModuleCat.{u} A) := sorry
/-- Unit test `DeltaLogCrystallineSite.trivialLog_compat`. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1}) (hP : P.CrystallineBase)
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R] : Nonempty
    (cohomology P hP (SmoothLogFormalScheme.spf (LogPrismaticSite.SmoothPrelogAlgebra.strict P R)) ≅
      ordinaryCrys P hP R) := by sorry
/-- Unit test `DeltaLogCrystallineSite.not_all_pd_thickenings`: p-torsion excludes a ring of objects. -/
example {hP : P.CrystallineBase} {X : SmoothLogFormalScheme P}
    (U : DeltaLogCrystallineSite P hP X) :
    ∀ b : objRing U, (p:objRing U)*b = 0 → b = 0 := by sorry
noncomputable def affineLineObject (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) : DeltaLogCrystallineSite P hP
      (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.logAffineLine P)) := sorry
/-- Unit test `DeltaLogCrystallineSite.affineLine`: rank-one lift is an object, not weak finality. -/
example (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase) :
    Nonempty (objRing (affineLineObject P hP) ≃+* ConvergentPoly p A) := by sorry
/-- Semilinear crystalline Frobenius and contravariance in the smooth scheme. -/
noncomputable def frobenius (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : cohomology P hP X ⟶
      (frobeniusPushforward P.toPrism).obj (cohomology P hP X) := sorry
noncomputable def map (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    {X Y : SmoothLogFormalScheme P} (f : X ⟶ Y) : cohomology P hP Y ⟶ cohomology P hP X := sorry
end DeltaLogCrystallineSite
namespace LogPrismaticSite
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
/-- The Frobenius action on the φ-pushforward crystalline complex. -/
noncomputable def crystallineTargetFrobenius (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    (frobeniusPushforward P.toPrism).obj (DeltaLogCrystallineSite.cohomology P hP X) ⟶
      (frobeniusPushforward (P.frobeniusTwist hP).toPrism).obj
        ((frobeniusPushforward P.toPrism).obj (DeltaLogCrystallineSite.cohomology P hP X)) := sorry
/-- API `LogPrismaticSite.crystallineComparisonMap_frobenius`. -/
theorem crystallineComparisonMap_frobenius (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    crystallineComparisonMap P hP X ≫ crystallineTargetFrobenius P hP X =
      frobenius (P.frobeniusTwist hP) (X.frobeniusTwist hP) ≫
        (frobeniusPushforward (P.frobeniusTwist hP).toPrism).map (crystallineComparisonMap P hP X) := by sorry
noncomputable def crystallineSourceMap (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) {X Y : SmoothLogFormalScheme P} (f : X ⟶ Y) :
    cohomology (P.frobeniusTwist hP) (Y.frobeniusTwist hP) ⟶
      cohomology (P.frobeniusTwist hP) (X.frobeniusTwist hP) := sorry
/-- API `LogPrismaticSite.crystallineComparisonMap_natural`. -/
theorem crystallineComparisonMap_natural (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) {X Y : SmoothLogFormalScheme P} (f : X ⟶ Y) :
    crystallineSourceMap P hP f ≫ crystallineComparisonMap P hP X =
      crystallineComparisonMap P hP Y ≫
        (frobeniusPushforward P.toPrism).map (DeltaLogCrystallineSite.map P hP f) := by sorry
/-- Unit test `LogPrismaticSite.crystallineComparisonMap_trivialLog`: the source's canonical map
is an isomorphism in the smooth ordinary case. Its identification with PR.1 uses its supplier. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1}) (hP : P.CrystallineBase)
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R] :
    IsIso (crystallineComparisonMap P hP
      (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.strict P R))) := by sorry
/-- Unit test `LogPrismaticSite.crystallineFunctor_logPoint`: the relative Frobenius chart,
N ⊔_{N,p} N, is a pushout, not an unaltered diagram of charts. -/
example : Nonempty (DeltaLogTriple.MonoidPushout
    (MonoidHom.id (Multiplicative ℕ)) (powMonoidHom p) ≃* Multiplicative ℕ) := by sorry
/-- Unit test `LogPrismaticSite.crystallineFunctor_untwisted_fails`: an explicit PD base
whose residue ring has no A-linear lift back to A/p. Use A=Z_p⟦t⟧ with PD ideal containing t;
the relation t=0 in its quotient prevents such a lift. -/
example : ¬ ∃ f : ZMod p →+* Polynomial (ZMod p), ∀ a : Polynomial (ZMod p),
    f (Polynomial.constantCoeff a) = a := by sorry
end LogPrismaticSite

namespace LogQPDTriple
variable {p : ℕ} [Fact p.Prime]
def EtaleReduction (T : LogQPDTriple.{u} p) : Type (u+1) := sorry
def EtaleLiftCat {T : LogQPDTriple.{u} p} (d : EtaleReduction T) : Type (u+1) := sorry
noncomputable instance {T : LogQPDTriple.{u} p} (d : EtaleReduction T) :
    Category.{u} (EtaleLiftCat d) := sorry
/-- API `LogQPDTriple.etaleLift`: uniqueness includes the identified reduction and strict chart. -/
theorem etaleLift {T : LogQPDTriple.{u} p} (d : EtaleReduction T) :
    ∃ U : EtaleLiftCat d, Nonempty (Limits.IsTerminal U) := by sorry
/-- API `LogQPDTriple.envelope_flat`: complete flatness, not ordinary flatness. -/
theorem envelope_flat {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) :
    IsCompletelyFlat (Ideal.span {(p:T.D), qNumber T.q p}) (envelope.map S) := by sorry
/-- The p-completed log PD envelope of the reduced input (CR.5). -/
noncomputable def reducedLogPDEnvelope {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) :
    DerivedCategory (ModuleCat.{u} (T.D ⧸ Ideal.span {T.q - 1})) := sorry
/-- API `LogQPDTriple.envelope_mod_q_sub_one`: completed scalar change of the envelope ring. -/
theorem envelope_mod_q_sub_one {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) : Nonempty
    ((completedExtendScalars (Ideal.Quotient.mk (Ideal.span {T.q-1}))
      (Ideal.span {(p:T.D ⧸ Ideal.span {T.q-1})})).obj
        ((DerivedCategory.singleFunctor (ModuleCat.{u} T.D) 0).obj
          ((ModuleCat.restrictScalars (envelope.map S)).obj (ModuleCat.of (envelope S).D (envelope S).D))) ≅
      reducedLogPDEnvelope S) := by sorry
/-- A compatible primitive cyclotomic tower, used for q=[ε] and ξ=φ⁻¹([p]q). -/
def CyclotomicChoice (C : CompleteAlgClosedField.{u} p) : Type u := sorry
noncomputable def ainfTriple {C : CompleteAlgClosedField.{u} p} (ε : CyclotomicChoice C) :
    LogQPDTriple.{u} p := sorry
noncomputable def ainfTriple.ξ {C : CompleteAlgClosedField.{u} p} (ε : CyclotomicChoice C) :
    (ainfTriple ε).D := sorry
/-- Unit test `LogQPDTriple.ainf_example`: distinguish the q-PD ideal (ξ) from the prism ideal. -/
example {C : CompleteAlgClosedField.{u} p} (ε : CyclotomicChoice C) :
    Nonempty ((ainfTriple ε).D ≃+* C.Ainf) ∧
    (ainfTriple ε).toDeltaLogTriple.ideal = Ideal.span {ainfTriple.ξ ε} ∧
    (ainfTriple ε).toDeltaLogTriple.delta.frob (ainfTriple.ξ ε) = qNumber (ainfTriple ε).q p := by sorry
/-- Unit test `LogQPDTriple.q_eq_one`: the ideal carries divided powers at q=1. -/
example (T : LogQPDTriple.{u} p) (hq : T.q = 1) :
    Nonempty (DividedPowers T.toDeltaLogTriple.ideal) := by sorry
noncomputable def EnvelopeDatum.identity (T : LogQPDTriple.{u} p) : EnvelopeDatum T := sorry
/-- Unit test `LogQPDTriple.trivial_envelope`: identity input has no new elements. -/
example (T : LogQPDTriple.{u} p) : Function.Bijective (envelope.map (EnvelopeDatum.identity T)) ∧
    Nonempty ((envelope (EnvelopeDatum.identity T)).M ≃* T.M) := by sorry
end LogQPDTriple
namespace LogQCrystallineSite
variable {p : ℕ} [Fact p.Prime]
/-- Compatible free presentation and smooth lift as in K1 Construction 7.8. -/
def CechDatum (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) : Type (u+1) := sorry
noncomputable def cechObject {T : LogQPDTriple.{u} p} {X : T.SmoothScheme} (c : CechDatum T X) :
    CosimplicialObject (ModuleCat.{u} T.D) := sorry
noncomputable def cechTot {T : LogQPDTriple.{u} p} {X : T.SmoothScheme} (c : CechDatum T X) :
    DerivedCategory (ModuleCat.{u} T.D) :=
  DerivedCategory.Q.obj (((AlgebraicTopology.alternatingCofaceMapComplex (ModuleCat.{u} T.D)).obj
    (cechObject c)).extend ComplexShape.embeddingUpNat)
/-- API `LogQCrystallineSite.cech`. -/
theorem cech {T : LogQPDTriple.{u} p} {X : T.SmoothScheme} (c : CechDatum T X) :
    Nonempty (cechTot c ≅ qOmega T X) := by sorry
/-- A strict change of ideal on the same q-PD ring and log monoid, with I⊆I′. -/
def StrictChange (T T' : LogQPDTriple.{u} p) : Type (u+1) := sorry
noncomputable def StrictChange.ringEquiv {T T' : LogQPDTriple.{u} p} (f : StrictChange T T') :
    T.D ≃+* T'.D := sorry
noncomputable def StrictChange.scheme {T T' : LogQPDTriple.{u} p} (f : StrictChange T T')
    (X : T.SmoothScheme) : T'.SmoothScheme := sorry
/-- API `LogQCrystallineSite.strict_change`: forgetful equivalence on cohomology. -/
theorem strict_change {T T' : LogQPDTriple.{u} p} (f : StrictChange T T') (X : T.SmoothScheme) :
    Nonempty ((derivedExtendScalars f.ringEquiv.toRingHom).obj (qOmega T X) ≅
      qOmega T' (f.scheme X)) := by sorry
/-- Unit test `LogQCrystallineSite.q_eq_one`: site equivalence in the q=1 specialization.
The reduced base retains its arbitrary PD ideal, as in Theorem 7.10. -/
example (T : LogQPDTriple.{u} p) (hq : T.q = 1) (X : T.SmoothScheme) : Nonempty
    (LogQCrystallineSite T X ≌ T.ReducedPDSite X) := by sorry
/-- Unit test `LogQCrystallineSite.affineLine_complex`: the point-index q-de Rham complex. -/
example (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D] : Nonempty
    (qOmega T (LogQDeRham.complex.scheme T PUnit.{u+1}) ≅
      DerivedCategory.Q.obj ((LogQDeRham.complex T PUnit.{u+1}).extend ComplexShape.embeddingUpNat)) := by sorry
/-- Unit test `LogQCrystallineSite.not_prismatic`: (ξ) need not contain [p]q in A_inf. -/
example {C : CompleteAlgClosedField.{u} p} (ε : LogQPDTriple.CyclotomicChoice C) :
    qNumber (LogQPDTriple.ainfTriple ε).q p ∉ (LogQPDTriple.ainfTriple ε).toDeltaLogTriple.ideal := by sorry
end LogQCrystallineSite
namespace LogQDeRham
variable {p : ℕ} [Fact p.Prime]
/-- The completed ordinary log de Rham complex of the mod-(q−1) lift (CR.5).
The cochain carrier is ℤ-indexed, in agreement with the q-de Rham Koszul model. -/
noncomputable def modQDeRham (T : LogQPDTriple.{u} p) (S : Type u) :
    DerivedCategory (ModuleCat.{u} (T.D ⧸ Ideal.span {T.q-1})) := sorry
/-- API `LogQDeRham.mod_q_sub_one`. -/
theorem mod_q_sub_one (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D]
    (S : Type u) : Nonempty ((completedExtendScalars (Ideal.Quotient.mk (Ideal.span {T.q-1}))
      (Ideal.span {(p:T.D ⧸ Ideal.span {T.q-1})})).obj
        (DerivedCategory.Q.obj ((complex T S).extend ComplexShape.embeddingUpNat)) ≅ modQDeRham T S) := by sorry
/-- Degree-one dlog generators and their Frobenius map on the complex. -/
noncomputable def dlogGenerator (T : LogQPDTriple.{u} p) (S : Type u) (s : S) :
    (complex T S).X 1 := sorry
noncomputable def frobeniusDegreeOne (T : LogQPDTriple.{u} p) (S : Type u) :
    (complex T S).X 1 → (complex T S).X 1 := sorry
/-- API `LogQDeRham.frobenius_dlog`: Frobenius sends dlog X to [p]q dlog X. -/
theorem frobenius_dlog (T : LogQPDTriple.{u} p) (S : Type u) (s : S) :
    frobeniusDegreeOne T S (dlogGenerator T S s) = qNumber T.q p • dlogGenerator T S s := by sorry
/-- DD.1/PR.6's Lη_[p]q on D(D), also valid for the commuting q-coordinate model. -/
noncomputable def qDecalage (T : LogQPDTriple.{u} p) :
    DerivedCategory (ModuleCat.{u} T.D) ⥤ DerivedCategory (ModuleCat.{u} T.D) := sorry
/-- API `LogQDeRham.frobenius_l_eta`: the source has the φ_D scalar twist. -/
theorem frobenius_l_eta (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D]
    (S : Type u) [Finite S] : Nonempty
    ((completedExtendScalars T.toDeltaLogTriple.delta.frobenius
      (Ideal.span {(p:T.D),qNumber T.q p})).obj (DerivedCategory.Q.obj ((complex T S).extend ComplexShape.embeddingUpNat)) ≅
      (qDecalage T).obj (DerivedCategory.Q.obj ((complex T S).extend ComplexShape.embeddingUpNat))) := by sorry
/-- Unit test `LogQDeRham.q_one_limit`: [n]q reduces to n, recovering X d/dX. -/
example (T : LogQPDTriple.{u} p) (n : ℕ) :
    Ideal.Quotient.mk (Ideal.span {T.q-1}) (qNumber T.q n) = (n:T.D ⧸ Ideal.span {T.q-1}) := by sorry
/-- Unit test `LogQDeRham.not_nonlog_derivative`: on the one-coordinate model,
∇q(X)=X, whereas the ordinary derivative of X is 1. -/
example (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D] [Nontrivial T.D] :
    qNabla T (PUnit.unit : PUnit.{u+1}) (coord T (PUnit.unit : PUnit.{u+1})) =
      coord T (PUnit.unit : PUnit.{u+1}) ∧
    coord T (PUnit.unit : PUnit.{u+1}) ≠ 1 := by sorry
end LogQDeRham


/-! DD.6 supplier adapters. The carriers below stand for its Gabber cotangent complex,
derived tensor product and homotopy pushouts, not for propositions or theorem conclusions.
No general log-cotangent theory is owned again by PR.8. -/
namespace LogQSyn
variable {p : ℕ} [Fact p.Prime]
structure PrelogRing where
  R : Type u
  [ring : CommRing R]
  M : Type u
  [monoid : CommMonoid M]
  α : M →* R
attribute [instance] PrelogRing.ring PrelogRing.monoid
structure Hom (X Y : PrelogRing.{u}) where
  ring : X.R →+* Y.R
  monoid : X.M →* Y.M
  compatible : Y.α.comp monoid = ring.toMonoidHom.comp X.α
noncomputable def Hom.id (X : PrelogRing.{u}) : Hom X X :=
  ⟨RingHom.id X.R, MonoidHom.id X.M, by simp⟩
noncomputable def Hom.comp {X Y Z : PrelogRing.{u}} (g : Hom Y Z) (f : Hom X Y) : Hom X Z := sorry
noncomputable def cotangent (X : PrelogRing.{u}) : DerivedCategory (ModuleCat.{u} X.R) := sorry
noncomputable def relativeCotangent {X Y : PrelogRing.{u}} (f : Hom X Y) :
    DerivedCategory (ModuleCat.{u} Y.R) := sorry
/-- DD.1's derived tensor with a module, used to express Tor amplitude. -/
noncomputable def tensorModule {R : Type u} [CommRing R]
    (K : DerivedCategory (ModuleCat.{u} R)) (V : ModuleCat.{u} R) :
    DerivedCategory (ModuleCat.{u} R) := sorry
/-- Cohomological indexing: the interval is [-1,0], not [0,1]. -/
def TorAmplitude {R : Type u} [CommRing R]
    (K : DerivedCategory (ModuleCat.{u} R)) (a b : ℤ) : Prop :=
  ∀ (V : ModuleCat.{u} R) (i : ℤ), i < a ∨ b < i →
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj (tensorModule K V))
noncomputable def modP {R : Type u} [CommRing R] (K : DerivedCategory (ModuleCat.{u} R)) :
    DerivedCategory (ModuleCat.{u} (R ⧸ Ideal.span {(p:R)})) :=
  (derivedExtendScalars (Ideal.Quotient.mk (Ideal.span {(p:R)}))).obj K
def BoundedPTorsion (R : Type u) [CommRing R] : Prop :=
  ∃ n : ℕ, ∀ x : R, (∃ m : ℕ, (p:R)^m*x=0) → (p:R)^n*x=0
/-- API `LogQSyn.IsQuasisyntomic`: the ring and cotangent conditions together. -/
def IsQuasisyntomic (X : PrelogRing.{u}) : Prop :=
  IsAdicComplete (Ideal.span {(p:X.R)}) X.R ∧ BoundedPTorsion (p:=p) X.R ∧
    TorAmplitude (modP (p:=p) (cotangent X)) (-1) 0
/-- DD.6's category of derived prelog rings and the canonical homotopy-to-naive pushout map.
Its source and target use the same input span; no flatness is built into this carrier. -/
def DerivedPrelog : Type (u+1) := sorry
noncomputable instance : Category.{u} (DerivedPrelog.{u}) := sorry
noncomputable def pushoutComparison {X Y Z : PrelogRing.{u}} (f : Hom X Y) (g : Hom X Z) :
    Arrow (DerivedPrelog.{u}) := sorry
def HomologicallyLogFlat {X Y : PrelogRing.{u}} (f : Hom X Y) : Prop :=
  ∀ (Z : PrelogRing.{u}) (g : Hom X Z), IsIso (pushoutComparison f g).hom
noncomputable def PrelogRing.modP (X : PrelogRing.{u}) : PrelogRing.{u} := sorry
noncomputable def Hom.modP {X Y : PrelogRing.{u}} (f : Hom X Y) : Hom X.modP Y.modP := sorry
/-- Canonical B ⊗ᴸ_A A/p → B/p, in D(A/p), supplied by DD.1. -/
noncomputable def reductionComparison {X Y : PrelogRing.{u}} (f : Hom X Y) :
    Arrow (DerivedCategory (ModuleCat.{u} (X.R ⧸ Ideal.span {(p:X.R)}))) := sorry
def PCompletelyHLF {X Y : PrelogRing.{u}} (f : Hom X Y) : Prop :=
  IsIso (reductionComparison (p:=p) f).hom ∧ HomologicallyLogFlat f.modP
/-- API `LogQSyn.IsQuasisyntomicMap`: endpoints are complete with bounded torsion. -/
def IsQuasisyntomicMap {X Y : PrelogRing.{u}} (f : Hom X Y) : Prop :=
  IsAdicComplete (Ideal.span {(p:X.R)}) X.R ∧ BoundedPTorsion (p:=p) X.R ∧
  IsAdicComplete (Ideal.span {(p:Y.R)}) Y.R ∧ BoundedPTorsion (p:=p) Y.R ∧
  PCompletelyHLF (p:=p) f ∧ TorAmplitude (modP (p:=p) (relativeCotangent f)) (-1) 0
/-- The faithful condition is on the mod-p ring map, in addition to homological log flatness. -/
def IsCover {X Y : PrelogRing.{u}} (f : Hom X Y) : Prop :=
  IsQuasisyntomicMap (p:=p) f ∧ f.modP.ring.FaithfullyFlat
/-- API `LogQSyn.of_cover`. -/
theorem of_cover {X Y : PrelogRing.{u}} (f : Hom X Y) (hf : IsCover (p:=p) f) :
    IsQuasisyntomic (p:=p) X ↔ IsQuasisyntomic (p:=p) Y := by sorry
/-- API `LogQSyn.comp`. -/
theorem comp {X Y Z : PrelogRing.{u}} (f : Hom X Y) (g : Hom Y Z)
    (hf : IsQuasisyntomicMap (p:=p) f) (hg : IsQuasisyntomicMap (p:=p) g) :
    IsQuasisyntomicMap (p:=p) (g.comp f) := by sorry
noncomputable def completedPushout {X Y Z : PrelogRing.{u}} (f : Hom X Y) (g : Hom X Z) :
    PrelogRing.{u} := sorry
noncomputable def completedPushout.map {X Y Z : PrelogRing.{u}} (f : Hom X Y) (g : Hom X Z) :
    Hom Z (completedPushout f g) := sorry
/-- API `LogQSyn.pushout`: discreteness and bounded torsion are part of the complete-ring output. -/
theorem pushout {X Y Z : PrelogRing.{u}} (f : Hom X Y) (g : Hom X Z)
    (hf : IsQuasisyntomicMap (p:=p) f)
    (hZ : IsAdicComplete (Ideal.span {(p:Z.R)}) Z.R) (htZ : BoundedPTorsion (p:=p) Z.R) :
    IsQuasisyntomicMap (p:=p) (completedPushout.map f g) := by sorry
noncomputable def trivialRing (R : Type u) [CommRing R] : PrelogRing.{u} :=
  ⟨R, PUnit.{u+1}, 1⟩
/-- DD.5 ordinary cotangent complex over Z_p. -/
noncomputable def ordinaryCotangent (R : Type u) [CommRing R] :
    DerivedCategory (ModuleCat.{u} R) := sorry
def OrdinaryQSyn (R : Type u) [CommRing R] : Prop :=
  IsAdicComplete (Ideal.span {(p:R)}) R ∧ BoundedPTorsion (p:=p) R ∧
    TorAmplitude (modP (p:=p) (ordinaryCotangent R)) (-1) 0
/-- API `LogQSyn.trivialLog`. -/
theorem trivialLog (R : Type u) [CommRing R] :
    IsQuasisyntomic (p:=p) (trivialRing R) ↔ OrdinaryQSyn (p:=p) R := by sorry
noncomputable def completedShiftedExterior {X Y : PrelogRing.{u}} (f : Hom X Y) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} Y.R) := sorry
/-- API `LogQSyn.cotangent_coconnective`: ∧ⁱ L[-i] is in D≥0, including the shift. -/
theorem cotangent_coconnective {X Y : PrelogRing.{u}} (f : Hom X Y)
    (hf : IsQuasisyntomicMap (p:=p) f) (i : ℕ) :
    ∀ n : ℤ, n < 0 → Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} Y.R) n).obj
      (completedShiftedExterior f i)) := by sorry
noncomputable def logLine : PrelogRing.{0} :=
  ⟨ConvergentPoly p ℤ_[p], Multiplicative ℕ,
    powersHom _ (algebraMap (Polynomial ℤ_[p]) (ConvergentPoly p ℤ_[p]) Polynomial.X)⟩
/-- Unit test `LogQSyn.smoothLog_quasisyntomic`. -/
example : IsQuasisyntomic (p:=p) (logLine (p:=p)) := by sorry
/-- Unit test `LogQSyn.trivialLog_eq`. -/
example (R : Type u) [CommRing R] :
    IsQuasisyntomic (p:=p) (trivialRing R) ↔ OrdinaryQSyn (p:=p) R := by sorry
noncomputable def zeroChart : PrelogRing.{0} :=
  ⟨ℤ_[p], Multiplicative ℕ, powersHom ℤ_[p] 0⟩
/-- Unit test `LogQSyn.zeroLog_lci`: the zero chart contributes degree -1. -/
example : IsQuasisyntomic (p:=p) (zeroChart (p:=p)) := by sorry
/-- KY Remark 2.13's explicit nonintegral chart and square-zero ring.
The source requires characteristic different from 2. -/
def NonIntegralExample (k : Type u) [Field k] : Type (u+1) := sorry
noncomputable def NonIntegralExample.source {k : Type u} [Field k] (e : NonIntegralExample k) : PrelogRing.{u} := sorry
noncomputable def NonIntegralExample.target {k : Type u} [Field k] (e : NonIntegralExample k) : PrelogRing.{u} := sorry
noncomputable def NonIntegralExample.map {k : Type u} [Field k] (e : NonIntegralExample k) :
    Hom e.source e.target := sorry
/-- Unit test `LogQSyn.not_nonintegral`: a log-étale nonintegral chart need not be quasisyntomic.
The square-zero target and Veronese source chart are the omitted data in this adapter. -/
example (k : Type u) [Field k] [CharP k p] (hp : p ≠ 2) (e : NonIntegralExample k) :
    ¬ IsQuasisyntomicMap (p:=p) e.map := by sorry
/-- Unit test `LogQSyn.empty_degenerate`: the identity is a cover. -/
example (X : PrelogRing.{u}) (hX : IsQuasisyntomic (p:=p) X) : IsCover (p:=p) (Hom.id X) := by sorry
end LogQSyn
namespace LogQRSP
variable {p : ℕ} [Fact p.Prime]
/-- API `LogQRSP.IsQRSP`: no QRSP conclusion is built into the ring carrier. -/
def IsQRSP (X : LogQSyn.PrelogRing.{u}) : Prop :=
  IsSemiperfectoid (p:=p) X.R X.α ∧ LogQSyn.IsQuasisyntomic (p:=p) X
/-- API `LogQRSP.cotangent_flat`: flatness in degree -1 is expressed by Tor amplitude. -/
theorem cotangent_flat (X : LogQSyn.PrelogRing.{u}) (hX : IsQRSP (p:=p) X) :
    LogQSyn.TorAmplitude (LogQSyn.modP (p:=p) (LogQSyn.cotangent X)) (-1) (-1) := by sorry
/-- API `LogQRSP.iff_cotangent`: the semiperfectoid conditions must precede this criterion. -/
theorem iff_cotangent (X : LogQSyn.PrelogRing.{u}) (hX : IsSemiperfectoid (p:=p) X.R X.α)
    (ht : LogQSyn.BoundedPTorsion (p:=p) X.R) (R : PerfectoidRing.{u} p) (f : R.carrier →+* X.R) :
    IsQRSP (p:=p) X ↔ LogQSyn.TorAmplitude (LogQSyn.modP (p:=p)
      (LogQSyn.relativeCotangent (Y:=X)
        (⟨f, 1, by sorry⟩ : LogQSyn.Hom (LogQSyn.trivialRing R.carrier) X))) (-1) (-1) := by sorry
noncomputable def perfectoidRootLine (C : Monoid.AlgebraicallyClosedPerfectoidField.{u} p) :
    LogQSyn.PrelogRing.{u} := sorry
/-- Unit test `LogQRSP.perfectoid_divisible`: O_C⟨T^(1/p∞)⟩ with its p-divisible root chart. -/
example (C : Monoid.AlgebraicallyClosedPerfectoidField.{u} p) :
    IsQRSP (p:=p) (perfectoidRootLine C) := by sorry
/-- DD.5's ordinary QRSP condition, written using the same three ring conditions. -/
def OrdinaryQRSP (S : Type u) [CommRing S] : Prop :=
  LogQSyn.OrdinaryQSyn (p:=p) S ∧ (∃ R : PerfectoidRing.{u} p, Nonempty (R.carrier →+* S)) ∧
    (∀ x : S ⧸ Ideal.span {(p:S)}, ∃ y, y^p=x)
/-- Unit test `LogQRSP.trivialLog`: the trivial prelog chart, not a choice of infinite roots. -/
example (S : Type u) [CommRing S] : IsQRSP (p:=p) (LogQSyn.trivialRing S) ↔
    OrdinaryQRSP (p:=p) S := by sorry
/-- Unit test `LogQRSP.zero_ring`: its only ring element is zero. -/
example : IsQRSP (p:=p) (LogQSyn.trivialRing PUnit.{u+1}) := by sorry
end LogQRSP


/-! Further derived supplier adapters: object carriers are placeholders for constructions;
vanishing and perfectness below are actual conditions on their homology and module terms. -/
def IsPerfectComplex {A : Type u} [CommRing A] (K : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∃ C : CochainComplex (ModuleCat.{u} A) ℤ,
    (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → Limits.IsZero (C.X i)) ∧
    (∀ i, Module.Finite A (C.X i) ∧ Module.Projective A (C.X i)) ∧ Nonempty (DerivedCategory.Q.obj C ≅ K)
namespace BreuilKisinLogCohomology
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
/-- A proper semistable input; properness is the omitted geometric condition of this carrier. -/
def ProperSemistable (B : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable def ProperSemistable.toSemistable {B : IntegralBoundedPrelogPrism p A M}
    (X : ProperSemistable B) : Semistable B := sorry
/-- API `BreuilKisinLogCohomology.perfect`. -/
theorem perfect (B : IntegralBoundedPrelogPrism p A M) (X : ProperSemistable B) :
    IsPerfectComplex (BreuilKisinLogCohomology B X.toSemistable) := by sorry
/-- The specialization u↦0 into W(k), including the relative Frobenius log-point twist. -/
def HyodoKatoDatum (B : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable def HyodoKatoDatum.ring {B : IntegralBoundedPrelogPrism p A M}
    (d : HyodoKatoDatum B) : Type u := sorry
noncomputable instance {B : IntegralBoundedPrelogPrism p A M} (d : HyodoKatoDatum B) :
    CommRing d.ring := sorry
noncomputable def HyodoKatoDatum.map {B : IntegralBoundedPrelogPrism p A M}
    (d : HyodoKatoDatum B) : A →+* d.ring := sorry
noncomputable def HyodoKatoDatum.cohomology {B : IntegralBoundedPrelogPrism p A M}
    (d : HyodoKatoDatum B) (X : Semistable B) : DerivedCategory (ModuleCat.{u} d.ring) := sorry
/-- API `BreuilKisinLogCohomology.toHyodoKato`: completed base change with the crystalline twist. -/
theorem toHyodoKato (B : IntegralBoundedPrelogPrism p A M) (X : Semistable B)
    (d : HyodoKatoDatum B) : Nonempty ((completedExtendScalars d.map (Ideal.span {(p:d.ring)})).obj
      (BreuilKisinLogCohomology B X) ≅ d.cohomology X) := by sorry
/-- Ordinary smooth good-reduction inputs and PR.1 cohomology. -/
def GoodReduction (B : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable def GoodReduction.semistable {B : IntegralBoundedPrelogPrism p A M}
    (X : GoodReduction B) : Semistable B := sorry
noncomputable def GoodReduction.ordinary {B : IntegralBoundedPrelogPrism p A M}
    (X : GoodReduction B) : DerivedCategory (ModuleCat.{u} A) := sorry
/-- Unit test `BreuilKisinLogCohomology.goodReduction`. -/
example (B : IntegralBoundedPrelogPrism p A M) (X : GoodReduction B) :
    Nonempty (BreuilKisinLogCohomology B X.semistable ≅ X.ordinary) := by sorry
/-- Proper semistable curve with geometrically connected generic fibre. -/
def ConnectedCurve (B : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable def ConnectedCurve.toSemistable {B : IntegralBoundedPrelogPrism p A M}
    (X : ConnectedCurve B) : Semistable B := sorry
/-- Unit test `BreuilKisinLogCohomology.curve_H0`. -/
example (B : IntegralBoundedPrelogPrism p A M) (X : ConnectedCurve B) : Nonempty
    ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).obj
      (BreuilKisinLogCohomology B X.toSemistable) ≅ ModuleCat.of A A) := by sorry
/-- Nodal residue-fibre ring and evaluation at its singular point. -/
abbrev NodalRing (k : Type u) [Field k] := MvPolynomial (Fin 2) k ⧸
  Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) k)}
noncomputable def nodeEvaluation (k : Type u) [Field k] : NodalRing k →+* k := sorry
/-- Both coordinate classes vanish at this evaluation; this is the singular fibre. -/
theorem nodeEvaluation_coordinate (k : Type u) [Field k] (i : Fin 2) :
    nodeEvaluation k (Ideal.Quotient.mk _ (MvPolynomial.X i)) = 0 := by sorry
noncomputable instance (k : Type u) [Field k] : Algebra (NodalRing k) k :=
  (nodeEvaluation k).toAlgebra
/-- Unit test `BreuilKisinLogCohomology.not_trivialLog`: the ordinary differential fibre
has dimension two at xy=0, while the relative logarithmic differential fibre has dimension one. -/
example (k : Type u) [Field k] : Module.finrank k
    (TensorProduct (NodalRing k) k (KaehlerDifferential k (NodalRing k))) = 2 := by sorry
end BreuilKisinLogCohomology
namespace DerivedLogPrismatic
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
/-- DD.6 animated prelog algebras and its finite log-free subcategory. -/
def Animated (P : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A M) : Category.{u} (Animated P) := sorry
def Free (P : IntegralBoundedPrelogPrism p A M) : Type (u+1) := sorry
noncomputable instance (P : IntegralBoundedPrelogPrism p A M) : Category.{u} (Free P) := sorry
noncomputable def inclusion (P : IntegralBoundedPrelogPrism p A M) : Free P ⥤ Animated P := sorry
noncomputable def freeCohomology (P : IntegralBoundedPrelogPrism p A M) :
    Free P ⥤ DerivedCategory (ModuleCat.{u} A) := sorry
noncomputable def animatedUncompleted (P : IntegralBoundedPrelogPrism p A M) :
    Animated P ⥤ DerivedCategory (ModuleCat.{u} A) := sorry
noncomputable def extensionUnit (P : IntegralBoundedPrelogPrism p A M) :
    freeCohomology P ⟶ inclusion P ⋙ animatedUncompleted P := sorry
/-- API `DerivedLogPrismatic.leftKanExtension`: completion follows the universal Kan extension.
This 1-categorical shadow does not encode the stable ∞-categorical enhancement. -/
theorem leftKanExtension (P : IntegralBoundedPrelogPrism p A M) :
    (animatedUncompleted P).IsLeftKanExtension (extensionUnit P) := by sorry
noncomputable def pCompletedInput (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    PrelogAlgebra P := sorry
/-- API `DerivedLogPrismatic.pComplete_invariant`: p-completion is applied to the input ring,
with its unchanged monoid, as specified by KY Proposition 4.3. -/
theorem pComplete_invariant (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    Nonempty (DerivedLogPrismatic P X ≅ DerivedLogPrismatic P (pCompletedInput P X)) := by sorry
end DerivedLogPrismatic
namespace LogNygaard
variable {p : ℕ} [Fact p.Prime] {A M : Type u} [CommRing A] [CommMonoid M]
noncomputable def tensorDerived (K L : DerivedCategory (ModuleCat.{u} A)) :
    DerivedCategory (ModuleCat.{u} A) := sorry
/-- API `LogNygaard.mul`: multiplicative filtration, not a product of degree-zero modules. -/
noncomputable def mul (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i j : ℕ) :
    tensorDerived (fil P X i) (fil P X j) ⟶ fil P X (i+j) := sorry
noncomputable def ordinaryFil (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) : DerivedCategory (ModuleCat.{u} A) := sorry
/-- API `LogNygaard.free_eq_bs`: PR.3 owns the ordinary filtration. -/
theorem free_eq_bs (P : IntegralBoundedPrelogPrism p A PUnit.{u+1})
    (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    Nonempty (fil P (PrelogAlgebra.strict P R) i ≅ ordinaryFil P R i) := by sorry
/-- A finitely generated free monoid N and a surjective map M_A⊕N→M_A⊕N^S;
N[1/p] and the exactified non-perfect base enter the resulting filtered totalization separately. -/
def FreeChart (P : IntegralBoundedPrelogPrism p A M) (S : Type u) : Type (u+1) := sorry
noncomputable def chartFil {P : IntegralBoundedPrelogPrism p A M} {S : Type u}
    (c : FreeChart P S) (i : ℕ) : DerivedCategory (ModuleCat.{u} A) := sorry
/-- API `LogNygaard.independent`: choices compare as filtered complexes; this is its component. -/
theorem independent {P : IntegralBoundedPrelogPrism p A M} {S : Type u}
    (c c' : FreeChart P S) (i : ℕ) : Nonempty (chartFil c i ≅ chartFil c' i) := by sorry
/-- Unit test `LogNygaard.trivialLog`. -/
example (P : IntegralBoundedPrelogPrism p A PUnit.{u+1}) (i : ℕ) :
    Nonempty (fil P (PrelogAlgebra.strict P (ConvergentPoly p P.bar)) i ≅
      ordinaryFil P (ConvergentPoly p P.bar) i) := by sorry
/-- Unit test `LogNygaard.logLine_gr1`: the conjugate filtration is its smooth τ≤1 model. -/
example (P : IntegralBoundedPrelogPrism p A M) : Nonempty
    (graded P (PrelogAlgebra.logAffineLine P) 1 ≅
      (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
        (conjugateFilTwist P (PrelogAlgebra.logAffineLine P) 1)) := by sorry
/-- KY Example 5.2: the normalized naive Frobenius fails to hit (u−1)/ξ.
The ring is its exactified non-perfect base, not A_inf itself. -/
def NaiveToy (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def NaiveToy.ring (T : NaiveToy.{u} p) : Type u := sorry
noncomputable instance (T : NaiveToy.{u} p) : CommRing T.ring := sorry
noncomputable def NaiveToy.filOne (T : NaiveToy.{u} p) : Submodule T.ring T.ring := sorry
noncomputable def NaiveToy.target (T : NaiveToy.{u} p) : Type u := sorry
noncomputable def NaiveToy.normalizedFrob (T : NaiveToy.{u} p) : T.filOne → T.target := sorry
/-- Unit test `LogNygaard.naive_fails`. -/
example (T : NaiveToy.{u} p) : ¬ Function.Surjective T.normalizedFrob := by sorry
/-- The reduced Frobenius gr⁰_N→Δ̄ and its factor through Fil₀ of the conjugate filtration. -/
noncomputable def grZeroFrob (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    graded P X 0 ⟶ (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
      (DerivedLogPrismatic.reduced P X) := sorry
noncomputable def conjugateZeroInclusion (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj (conjugateFilTwist P X 0) ⟶
      (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj (DerivedLogPrismatic.reduced P X) := sorry
/-- Unit test `LogNygaard.frobenius_fil1`: factoring through the zeroth conjugate step. -/
example (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    ∃ e : graded P X 0 ≅ (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj (conjugateFilTwist P X 0),
      grZeroFrob P X = e.hom ≫ conjugateZeroInclusion P X := by sorry
end LogNygaard

noncomputable instance {p : ℕ} [Fact p.Prime] : Category.{u} (Diamond.{u} p) := sorry

namespace LogDiamond
variable {p : ℕ} [Fact p.Prime]
noncomputable def underlyingFunctor : LogDiamond.{u} p ⥤ Diamond.{u} p where
  obj := underlying
  map := sorry
  map_id := by sorry
  map_comp := by sorry
noncomputable def completedIntegralSections (Y : LogDiamond.{u} p) : Type u := sorry
noncomputable instance (Y : LogDiamond.{u} p) : CommRing (completedIntegralSections Y) := sorry
noncomputable def logSections (Y : LogDiamond.{u} p) : Type u := sorry
noncomputable instance (Y : LogDiamond.{u} p) : CommMonoid (logSections Y) := sorry
noncomputable def logSheaf (Y : LogDiamond.{u} p) : (underlying Y).qproetᵒᵖ ⥤ CommMonCat.{u} := sorry
/-- CR.5 logification of the constant P chart on the completed untilt sheaf; units are identified
with Ô×, while the chart factors through Ô+. C0 supplies those two coefficient sheaves. -/
noncomputable def associatedChartSheaf (Y : LogDiamond.{u} p) {P : Type u} [CommMonoid P]
    (α : P →* completedIntegralSections Y) : (underlying Y).qproetᵒᵖ ⥤ CommMonCat.{u} := sorry
noncomputable def logAlpha (Y : LogDiamond.{u} p) :
    logSections Y →* completedIntegralSections Y := sorry
/-- API `LogDiamond.chart`: the comparison is a sheaf isomorphism, not an equality of global monoids. -/
structure chart (Y : LogDiamond.{u} p) where
  P : Type u
  [monoid : CommMonoid P]
  toPositive : P →* completedIntegralSections Y
  toLog : P →* logSections Y
  compatible : (logAlpha Y).comp toLog = toPositive
  identifiesLog : Nonempty (associatedChartSheaf Y toPositive ≅ logSheaf Y)
attribute [instance] chart.monoid
noncomputable def qproetTopology (Y : LogDiamond.{u} p) :
    GrothendieckTopology (underlying Y).qproet := sorry
/-- Pull back the log structure to an object of the ordinary quasi-pro-étale site. -/
noncomputable def qproetPullback (Y : LogDiamond.{u} p) (U : (underlying Y).qproet) :
    LogDiamond.{u} p := sorry
/-- API `LogDiamond.IsQuasiCoherent`: charts exist locally for the ordinary qpro-étale topology. -/
def IsQuasiCoherent (Y : LogDiamond.{u} p) : Prop :=
  ∀ U : (underlying Y).qproet, ∃ S : Sieve U, S ∈ qproetTopology Y U ∧
    ∀ (V : (underlying Y).qproet) (f : V ⟶ U), S f → Nonempty (chart (qproetPullback Y V))
abbrev Characteristic (Y : LogDiamond.{u} p) (x : Y.Point) := characteristic Y x
def SatQC : ObjectProperty (LogDiamond.{u} p) := fun Y => IsQuasiCoherent Y ∧ IsSaturated Y
/-- API `LogDiamond.satFiberProduct`: pullbacks in the full subcategory of saturated qc objects. -/
noncomputable instance satFiberProduct : Limits.HasPullbacks (ObjectProperty.FullSubcategory (SatQC (p:=p))) := sorry
/-- The saturation's universal property is terminal among maps FROM saturated qc objects. -/
theorem saturation_terminal (Y : LogDiamond.{u} p) (hY : IsQuasiCoherent Y)
    (Z : LogDiamond.{u} p) (hZ : SatQC Z) (f : Z ⟶ Y) :
    ∃! g : Z ⟶ saturation Y, g ≫ saturationMap Y = f := by sorry
noncomputable def rationalLogDisc : LogDiamond.{u} p := sorry
noncomputable def rationalLogDisc.chart : chart (rationalLogDisc (p:=p)) := sorry
/-- Unit test `LogDiamond.disc`: the disc chart is N, not a group chart or the punctured disc. -/
example : Nonempty ((rationalLogDisc.chart (p:=p)).P ≃* Multiplicative (ULift.{u} ℕ)) := by sorry
/-- Pullback and logification of the adic étale log structure along ν. -/
noncomputable def inducedAdicLog (X : FsLogAdicSpace.{u} p) :
    (underlying (ofLogAdicSpace.obj X)).qproetᵒᵖ ⥤ CommMonCat.{u} := sorry
/-- Unit test `LogDiamond.compat_logAdic`: ν⁻¹ followed by logification, not raw inverse image. -/
example (X : FsLogAdicSpace.{u} p) :
    Nonempty (logSheaf (ofLogAdicSpace.obj X) ≅ inducedAdicLog X) := by sorry
/-- Ordinary and saturated self-products of the geometric n-th-root disc; roots of unity
are chosen in the algebraically closed coefficient field in this input. -/
def RootSelfProduct (p : ℕ) [Fact p.Prime] (n : ℕ) : Type (u+1) := sorry
noncomputable def RootSelfProduct.ordinary {n : ℕ} (D : RootSelfProduct.{u} p n) : Diamond.{u} p := sorry
noncomputable def RootSelfProduct.saturated {n : ℕ} (D : RootSelfProduct.{u} p n) : LogDiamond.{u} p := sorry
noncomputable def RootSelfProduct.disjoint {n : ℕ} (D : RootSelfProduct.{u} p n) : Diamond.{u} p := sorry
/-- Unit test `LogDiamond.not_naive_product`: the saturated product separates the n branches. -/
example (n : ℕ) (hn : 1<n) (D : RootSelfProduct.{u} p n) :
    Nonempty (underlying D.saturated ≅ D.disjoint) ∧ ¬ Nonempty (D.ordinary ≅ D.disjoint) := by sorry
/-- D6 ordinary diamond generic fibre of the underlying formal scheme. -/
noncomputable def ordinaryGenericFibre (X : FsLogFormalScheme.{u} p) : Diamond.{u} p := sorry
noncomputable def trivialFormal (X : FsLogFormalScheme.{u} p) : FsLogFormalScheme.{u} p := sorry
/-- API `LogDiamond.genericFibre_trivial`. -/
theorem genericFibre_trivial (X : FsLogFormalScheme.{u} p) :
    Nonempty (genericFibre.obj (trivialFormal X) ≅ trivialOf (ordinaryGenericFibre X)) := by sorry
noncomputable def spfZp : FsLogFormalScheme.{u} p := sorry
noncomputable def spdQp : Diamond.{u} p := sorry
/-- Unit test `LogDiamond.genericFibre_point`. -/
example : Nonempty (genericFibre.obj (spfZp (p:=p)) ≅ trivialOf (spdQp (p:=p))) := by sorry
noncomputable def formalLogDisc : FsLogFormalScheme.{u} p := sorry
/-- Unit test `LogDiamond.genericFibre_disc`. -/
example : Nonempty (genericFibre.obj (formalLogDisc (p:=p)) ≅ rationalLogDisc (p:=p)) := by sorry
/-- Unit test `LogDiamond.genericFibre_ok_nonsheafy`: no sheafiness condition on the Huber pair
enters the affine diamond construction. The separate test is the canonical affine comparison. -/
example (X : FsPrelogRing.{u} p) :
    Nonempty (genericFibre.obj X.spf ≅ ofHuberPair X.huberPair) := by sorry
noncomputable def discOrigin : (rationalLogDisc (p:=p)).Point := sorry
/-- Unit test `LogDiamond.genericFibre_not_complement`: a boundary point remains in the fibre. -/
example : Nonempty (genericFibre.obj (formalLogDisc (p:=p))).Point := by sorry
end LogDiamond
namespace LogPerfectoid
variable {p : ℕ} [Fact p.Prime]
noncomputable def toDiamond (X : StdiscPerfectoidSpace.{u} p) : Diamond.{u} p := sorry
/-- API `LogPerfectoid.IsStrictlyTotallyDisconnected`: all positive integers are required in
the characteristic condition; p-divisibility alone does not satisfy this definition. -/
def IsStrictlyTotallyDisconnected (Y : LogDiamond.{u} p) : Prop :=
  (∃ X : StdiscPerfectoidSpace.{u} p, Nonempty (LogDiamond.underlying Y ≅ toDiamond X)) ∧
    LogDiamond.SatQC Y ∧ ∀ (x : Y.Point) (n : ℕ), 0<n →
      Function.Bijective (powMonoidHom n : LogDiamond.Characteristic Y x →* LogDiamond.Characteristic Y x)
noncomputable def logDiamond (X : StdiscLogPerfectoid.{u} p) : LogDiamond.{u} p := sorry
/-- Unit test `LogPerfectoid.compat_D1`: the underlying diamond is represented by
a strictly totally disconnected ordinary perfectoid space. -/
example (X : StdiscLogPerfectoid.{u} p) :
    ∃ Y : StdiscPerfectoidSpace.{u} p,
      Nonempty (LogDiamond.underlying (logDiamond X) ≅ toDiamond Y) := by sorry
/-- Pro-étale H¹ of the completed untilt unit sheaf, from C0's coefficient interface. -/
noncomputable def unitsH1 (X : StdiscPerfectoidSpace.{u} p) : Type u := sorry
noncomputable instance (X : StdiscPerfectoidSpace.{u} p) : AddCommGroup (unitsH1 X) := sorry
/-- API `LogPerfectoid.h1_units`. -/
theorem h1_units (X : StdiscPerfectoidSpace.{u} p) : Subsingleton (unitsH1 X) := by sorry
noncomputable def characteristicSections (X : StdiscLogPerfectoid.{u} p) : Type u := sorry
noncomputable instance (X : StdiscLogPerfectoid.{u} p) : CommMonoid (characteristicSections X) := sorry
noncomputable def sectionsMap (X : StdiscLogPerfectoid.{u} p) :
    LogDiamond.logSections (logDiamond X) →* characteristicSections X := sorry
/-- API `LogPerfectoid.sections_surjective`: the global lifting is a theorem, not a field. -/
theorem sections_surjective (X : StdiscLogPerfectoid.{u} p) : Function.Surjective (sectionsMap X) := by sorry
/-- API `LogPerfectoid.divisible_iff`: for underlying strictly totally disconnected X and
saturated qc M, divisibility of the characteristic is equivalent to the full log condition. -/
theorem divisible_iff (Y : LogDiamond.{u} p)
    (hY : ∃ X : StdiscPerfectoidSpace.{u} p, Nonempty (LogDiamond.underlying Y ≅ toDiamond X))
    (hsat : LogDiamond.SatQC Y) : IsStrictlyTotallyDisconnected Y ↔
    ∀ (x : Y.Point) (n : ℕ), 0<n → Function.Surjective
      (powMonoidHom n : LogDiamond.Characteristic Y x →* LogDiamond.Characteristic Y x) := by sorry
/-- The zero-valued Q≥0 and N charts on Spa(C,O_C); every strictly positive exponent maps to 0. -/
noncomputable def rationalZeroChart (C : CompleteAlgClosedField.{u} p) : LogDiamond.{u} p := sorry
noncomputable def naturalZeroChart (C : CompleteAlgClosedField.{u} p) : LogDiamond.{u} p := sorry
/-- Unit test `LogPerfectoid.rational_monoid`. -/
example (C : CompleteAlgClosedField.{u} p) : IsStrictlyTotallyDisconnected (rationalZeroChart C) := by sorry
/-- Unit test `LogPerfectoid.not_fs`: N is not divisible although the underlying point is strictly
 totally disconnected. Sending the generator to p would produce a different, trivial log structure. -/
example (C : CompleteAlgClosedField.{u} p) : ¬ IsStrictlyTotallyDisconnected (naturalZeroChart C) := by sorry
end LogPerfectoid

namespace KummerEtale
/-- The ordinary small étale site, imported from scheme foundations. -/
def EtaleSite (X : FsLogScheme.{u}) : Type (u+1) := sorry
noncomputable instance (X : FsLogScheme.{u}) : Category.{u} (EtaleSite X) := sorry
noncomputable def trivialScheme (X : FsLogScheme.{u}) : FsLogScheme.{u} := sorry
/-- API `KummerEtale.trivialLog`: the equivalence of the small sites, with transported topology. -/
noncomputable def trivialLog (X : FsLogScheme.{u}) : site (trivialScheme X) ≌ EtaleSite X := sorry
noncomputable def ordinaryEtaleCohomology (X : FsLogScheme.{u}) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry
noncomputable def fullLogEtaleCohomology (X : FsLogScheme.{u}) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry
/-- API `KummerEtale.toLogEtale`: torsion coefficients, not arbitrary Z_p coefficients. -/
theorem toLogEtale (X : FsLogScheme.{u}) (n : ℕ) (hn : 0<n) :
    Nonempty (cohomology X (ZMod n) ≅ fullLogEtaleCohomology X (ZMod n)) := by sorry
/-- Standard fs Kummer chart with invertible cokernel index, and its object in the small site. -/
def StandardChart (X : FsLogScheme.{u}) : Type (u+1) := sorry
noncomputable def StandardChart.object {X : FsLogScheme.{u}} (C : StandardChart X) : site X := sorry
/-- API `KummerEtale.standardCover`. -/
theorem standardCover {X : FsLogScheme.{u}} (C : StandardChart X) :
    (topology X).CoversTop (fun _ : Unit => C.object) := by sorry
/-- Unit test `KummerEtale.trivialLog_eq`. -/
example (X : FsLogScheme.{u}) (n : ℕ) (hn : 0<n) :
    Nonempty (cohomology (trivialScheme X) (ZMod n) ≅ ordinaryEtaleCohomology X (ZMod n)) := by sorry
noncomputable def emptyScheme : FsLogScheme.{u} := sorry
/-- Unit test `KummerEtale.empty`: an empty covering family covers only the empty scheme. -/
example : (topology emptyScheme).CoversTop (fun e : Empty => nomatch e) := by sorry
noncomputable def zeroLogPoint (K : Type u) [Field K] : FsLogScheme.{u} := sorry
/-- Unit test `KummerEtale.not_etale`: choose roots of unity over an algebraically closed field;
the isomorphism is noncanonical and no Tate-twist trivialization over a smaller field is claimed. -/
example (K : Type u) [Field K] [IsAlgClosed K] [CharZero K] (n : ℕ) (hn : 1<n) :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} (ZMod n)) 1).obj
      (cohomology (zeroLogPoint K) (ZMod n)) ≅ ModuleCat.of (ZMod n) (ULift.{u} (ZMod n))) ∧
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} (ZMod n)) 1).obj
      (ordinaryEtaleCohomology (zeroLogPoint K) (ZMod n))) := by sorry
end KummerEtale
namespace Diamond
variable {p : ℕ} [Fact p.Prime]
/-- D1/C0 ordinary pro-étale and étale site object interfaces. Membership is expressed through
isomorphic objects over Y; no Prop-valued field assumes a map is pro-étale. -/
def ProetSite (Y : Diamond.{u} p) : Type (u+1) := sorry
noncomputable def ProetSite.source {Y : Diamond.{u} p} (U : ProetSite Y) : Diamond.{u} p := sorry
noncomputable def ProetSite.map {Y : Diamond.{u} p} (U : ProetSite Y) : U.source ⟶ Y := sorry
def IsProet {Y' Y : Diamond.{u} p} (f : Y' ⟶ Y) : Prop :=
  ∃ U : ProetSite Y, ∃ e : Y' ≅ U.source, e.hom ≫ U.map = f
/-- C0's quasi-pro-étale site. This is the ordinary condition on a strict map of
log diamonds; pro-étaleness below is used only on the perfectoid test pullbacks. -/
noncomputable def qproetSource {Y : Diamond.{u} p} (U : Y.qproet) : Diamond.{u} p := sorry
noncomputable def qproetMap {Y : Diamond.{u} p} (U : Y.qproet) : qproetSource U ⟶ Y := sorry
def IsQProet {Y' Y : Diamond.{u} p} (f : Y' ⟶ Y) : Prop :=
  ∃ U : Y.qproet, ∃ e : Y' ≅ qproetSource U, e.hom ≫ qproetMap U = f
def EtaleSite (Y : Diamond.{u} p) : Type (u+1) := sorry
noncomputable def EtaleSite.source {Y : Diamond.{u} p} (U : EtaleSite Y) : Diamond.{u} p := sorry
noncomputable def EtaleSite.map {Y : Diamond.{u} p} (U : EtaleSite Y) : U.source ⟶ Y := sorry
def IsEtale {Y' Y : Diamond.{u} p} (f : Y' ⟶ Y) : Prop :=
  ∃ U : EtaleSite Y, ∃ e : Y' ≅ U.source, e.hom ≫ U.map = f
/-- All perfectoid spaces, not the strictly totally disconnected subclass. -/
def PerfectoidSpace (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def PerfectoidSpace.diamond (U : PerfectoidSpace.{u} p) : Diamond.{u} p := sorry
def IsPerfectoid (Y : Diamond.{u} p) : Prop := ∃ U : PerfectoidSpace.{u} p, Nonempty (U.diamond ≅ Y)
end Diamond
namespace LogDiamond
variable {p : ℕ} [Fact p.Prime]
noncomputable def pullbackLogSheaf {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) :
    Y'.underlying.qproetᵒᵖ ⥤ CommMonCat.{u} := sorry
noncomputable def logPullbackMap {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) :
    pullbackLogSheaf f ⟶ logSheaf Y' := sorry
def IsStrict {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) : Prop := IsIso (logPullbackMap f)
noncomputable def satPullback {Y' X Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (g : X ⟶ Y) :
    LogDiamond.{u} p := sorry
noncomputable def satPullback.snd {Y' X Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (g : X ⟶ Y) :
    satPullback f g ⟶ X := sorry
end LogDiamond
namespace QProKummerEtale
variable {p : ℕ} [Fact p.Prime]
/-- API `QProKummerEtale.IsQPKet`: every strictly totally disconnected LOG test object is used.
This signature omits local separatedness and compatible-chart assumptions; the roadmap's full
range imposes both and restricts the endpoints to saturated qc log diamonds. -/
def IsQPKet {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) : Prop :=
  ∀ (T : StdiscLogPerfectoid.{u} p) (g : LogPerfectoid.logDiamond T ⟶ Y),
    Diamond.IsPerfectoid (LogDiamond.satPullback f g).underlying ∧
      LogDiamond.IsStrict (LogDiamond.satPullback.snd f g) ∧
      Diamond.IsProet (LogDiamond.underlyingFunctor.map (LogDiamond.satPullback.snd f g))
/-- API `QProKummerEtale.strict_iff`: the ordinary diamond condition uses the quasi-pro-étale
site of KY Definition 7.1. The strictly totally disconnected perfectoid pullbacks are pro-étale,
as in Definition 7.14 and Proposition 7.16(1). -/
theorem strict_iff {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (hf : LogDiamond.IsStrict f)
    (hY' : LogDiamond.SatQC Y') (hY : LogDiamond.SatQC Y) :
    IsQPKet f ↔ Diamond.IsQProet (LogDiamond.underlyingFunctor.map f) := by sorry
/-- API `QProKummerEtale.comp`: composition; base-change and cancellation are separate obligations. -/
theorem comp {X Y Z : LogDiamond.{u} p} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hf : IsQPKet f) (hg : IsQPKet g) : IsQPKet (f ≫ g) := by sorry
theorem baseChange {Y' X Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (g : X ⟶ Y)
    (hf : IsQPKet f) : IsQPKet (LogDiamond.satPullback.snd f g) := by sorry
theorem cancel {X Y Z : LogDiamond.{u} p} (f : X ⟶ Y) (g : Y ⟶ Z)
    (hg : IsQPKet g) (hgf : IsQPKet (f ≫ g)) : IsQPKet f := by sorry
noncomputable def rootDiamond (D : GeometricLogDisc.{u} p) (n : ℕ) : LogDiamond.{u} p := sorry
noncomputable def rootMap (D : GeometricLogDisc.{u} p) (n : ℕ) : rootDiamond D n ⟶ D.diamond := sorry
/-- Unit test `QProKummerEtale.kummer_root`: all positive indices, including powers of p. -/
example (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 0<n) : IsQPKet (rootMap D n) := by sorry
/-- Unit test `QProKummerEtale.trivial`: ordinary quasi-pro-étale maps with trivial logs qualify. -/
example (Y' Y : Diamond.{u} p) (f : LogDiamond.trivialOf Y' ⟶ LogDiamond.trivialOf Y)
    (hf : Diamond.IsQProet (LogDiamond.underlyingFunctor.map f)) : IsQPKet f := by sorry
/-- Unit test `QProKummerEtale.id`: the identity is in the class. -/
example (Y : LogDiamond.{u} p) : IsQPKet (𝟙 Y) := by sorry
/-- Unit test `QProKummerEtale.not_strict_etale`: the boundary ramification survives forgetting logs. -/
example (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 1<n) :
    ¬ Diamond.IsEtale (LogDiamond.underlyingFunctor.map (rootMap D n)) ∧
      ¬ LogDiamond.IsStrict (rootMap D n) := by sorry
end QProKummerEtale
namespace LaurentFCrystal
variable {p : ℕ} [Fact p.Prime]
/-- The category of compatible Frobenius vector bundles over the absolute saturated site.
Its objects are descent families, indexed by all site objects; the ring at each object is
(A[1/I])^∧_p. This is PR.7's ordinary crystal/descent construction applied to the new site. -/
def DescentFamilies (X : FsLogFormalScheme.{u} p) : Type (u+1) := sorry
noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (DescentFamilies X) := sorry
/-- API `LaurentFCrystal.descent`: a category equivalence, with the limit object suppressed
in this 1-categorical prototype; the reader specifies its evaluation and transition equations. -/
noncomputable def descent (X : FsLogFormalScheme.{u} p) : LaurentFCrystal X ≌ DescentFamilies X := sorry
/-- PR.7 ordinary Laurent F-crystals for the underlying formal scheme with trivial log. -/
def Ordinary (X : FsLogFormalScheme.{u} p) : Type (u+1) := sorry
noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (Ordinary X) := sorry
/-- Unit test `LaurentFCrystal.trivialLog`. -/
example (X : FsLogFormalScheme.{u} p) :
    Nonempty (LaurentFCrystal (LogDiamond.trivialFormal X) ≌ Ordinary X) := by sorry
/-- Unit test `LaurentFCrystal.not_F_crystal`: Laurent inversion changes the coefficient ring.
Before completion, inverting I=(p) over Z_p makes p a unit; the original ring does not.
The p-completion of this particular localization is zero, so this is an inversion test only. -/
example : IsUnit (p : Localization.Away (p:ℤ_[p])) ∧ ¬ IsUnit (p:ℤ_[p]) := by sorry
end LaurentFCrystal


/-! Moved ownership: the general fs log adic Kummer foundation needed at tier 13 lives in PR.8.
T6, at tier 16, imports this interface. The noetherian hypothesis is kept separate from the
perfectoid adic-to-diamond construction, which never claims noetherian comparison for perfectoids. -/
namespace NoetherianFsLogAdicSpace
variable {p : ℕ} [Fact p.Prime]
noncomputable instance : Category.{u} (NoetherianFsLogAdicSpace.{u} p) := sorry
/-- API `NoetherianFsLogAdicSpace.kummerSite`: DLLZ §4.1, all fs Kummer-étale charts. -/
def kummerSite (X : NoetherianFsLogAdicSpace.{u} p) : Type (u+1) := sorry
noncomputable instance (X : NoetherianFsLogAdicSpace.{u} p) : Category.{u} (kummerSite X) := sorry
/-- API `NoetherianFsLogAdicSpace.kummerTopology`: jointly surjective coverings. -/
noncomputable def kummerTopology (X : NoetherianFsLogAdicSpace.{u} p) :
    GrothendieckTopology (kummerSite X) := sorry
/-- API `NoetherianFsLogAdicSpace.LocalSystem`: finite locally free coefficient sheaves. -/
def LocalSystem (X : NoetherianFsLogAdicSpace.{u} p) (Λ : Type) [CommRing Λ] : Type (u+1) := sorry
noncomputable instance (X : NoetherianFsLogAdicSpace.{u} p) (Λ : Type) [CommRing Λ] :
    Category.{u} (LocalSystem X Λ) := sorry
/-- API `NoetherianFsLogAdicSpace.finiteLevelDiamond`: Inoue Proposition B.4. -/
noncomputable def finiteLevelDiamond (X : NoetherianFsLogAdicSpace.{u} p) (n : ℕ) (hn : 0<n) :
    LocalSystem X (ZMod (p^n)) ≌ KummerLocalSystem X.diamond (ZMod (p^n)) := sorry
/-- API `NoetherianFsLogAdicSpace.cohomology`: finite torsion coefficients. -/
noncomputable def cohomology (X : NoetherianFsLogAdicSpace.{u} p) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry
noncomputable def constant (X : NoetherianFsLogAdicSpace.{u} p) (Λ : Type) [CommRing Λ]
    (r : ℕ) : LocalSystem X Λ := sorry
/-- Unit test `NoetherianFsLogAdicSpace.constantDiamond`: coefficient levels are positive. -/
example (X : NoetherianFsLogAdicSpace.{u} p) (n : ℕ) (hn : 0<n) (r : ℕ) :
    Nonempty ((finiteLevelDiamond X n hn).functor.obj (constant X (ZMod (p^n)) r) ≅
      KummerLocalSystem.constant X.diamond (ZMod (p^n)) r) := by sorry
/-- Unit test `NoetherianFsLogAdicSpace.zeroRank`: the zero sheaf is sent to the zero sheaf. -/
example (X : NoetherianFsLogAdicSpace.{u} p) (n : ℕ) (hn : 0<n) :
    Limits.IsZero ((finiteLevelDiamond X n hn).functor.obj (constant X (ZMod (p^n)) 0)) := by sorry
/-- Unit test `NoetherianFsLogAdicSpace.rootInertia`: regular permutation inertia has rank n
and a cyclic image. The finite-level comparison must not collapse it to a rank-one system. -/
example (D : GeometricLogDisc.{u} p) (n : ℕ) (hn : 0<n) (a : ℕ) :
    KummerLocalSystem.rank (D.rootPushforward n hn) D.boundary = n ∧ Nonempty
      ((KummerLocalSystem.inertiaMod (D.rootPushforward n hn) D.boundary a).range ≃*
        Multiplicative (ZMod n)) := by sorry
/-- Ordinary locally noetherian adic space, from AdicEtaleGeometry A1. Adic charts factor
through O_X^+ (DLLZ Definition 2.3.1, p. 13). LocalSystem here uses the finite-free KYcorr
convention; DLLZ Definition 6.3.1 also allows finitely generated torsion stalks. -/
def Ordinary (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def Ordinary.trivial (X : Ordinary.{u} p) : NoetherianFsLogAdicSpace.{u} p := sorry
def Ordinary.etaleSite (X : Ordinary.{u} p) : Type (u+1) := sorry
noncomputable instance (X : Ordinary.{u} p) : Category.{u} (Ordinary.etaleSite X) := sorry
/-- API `NoetherianFsLogAdicSpace.trivialLogSite`: trivial logs have no extra Kummer covers. -/
noncomputable def trivialLogSite (X : Ordinary.{u} p) : kummerSite X.trivial ≌ X.etaleSite := sorry
/-- Characteristic-stalk module and higher direct-image module. CharacteristicMod is the characteristic group modulo n tensored with Z/n(-1);
its i-th exterior power therefore carries the twist (-i). The reader states the intrinsic form. -/
def GeometricPoint (X : NoetherianFsLogAdicSpace.{u} p) : Type u := sorry
def CharacteristicMod (X : NoetherianFsLogAdicSpace.{u} p) (x : GeometricPoint X) (n : ℕ) : Type u := sorry
noncomputable instance (X : NoetherianFsLogAdicSpace.{u} p) (x : GeometricPoint X) (n : ℕ) :
    AddCommGroup (CharacteristicMod X x n) := sorry
noncomputable instance (X : NoetherianFsLogAdicSpace.{u} p) (x : GeometricPoint X) (n : ℕ) :
    Module (ZMod n) (CharacteristicMod X x n) := sorry
noncomputable def directImageStalk (X : NoetherianFsLogAdicSpace.{u} p) (x : GeometricPoint X)
    (n i : ℕ) : ModuleCat.{u} (ZMod n) := sorry
/-- API `NoetherianFsLogAdicSpace.inertiaExterior`: the unramified coefficient condition
(n invertible on X) is omitted from this signature; the full statement imposes it. -/
theorem inertiaExterior (X : NoetherianFsLogAdicSpace.{u} p) (x : GeometricPoint X) (n i : ℕ)
    (hn : 0<n) : Nonempty (directImageStalk X x n i ≅
      ModuleCat.of (ZMod n) (⋀[ZMod n]^i (CharacteristicMod X x n))) := by sorry
/-- Unit test `NoetherianFsLogAdicSpace.trivialSite_test`. -/
example (X : Ordinary.{u} p) : Nonempty (kummerSite X.trivial ≌ X.etaleSite) := by sorry
/-- The geometric rank-one log point with chart N→C sending every positive element to zero. -/
noncomputable def rankOnePoint (C : CompleteAlgClosedField.{u} p) :
    NoetherianFsLogAdicSpace.{u} p := sorry
noncomputable def rankZeroPoint (C : CompleteAlgClosedField.{u} p) :
    NoetherianFsLogAdicSpace.{u} p := sorry
/-- Unit test `NoetherianFsLogAdicSpace.rankOneH1`: a chosen roots-of-unity trivialization
makes the rank-one cohomology noncanonically Z/n. -/
example (C : CompleteAlgClosedField.{u} p) (n : ℕ) (hn : 1<n) : Nonempty
    ((DerivedCategory.homologyFunctor (ModuleCat.{u} (ZMod n)) 1).obj
      (cohomology (rankOnePoint C) (ZMod n)) ≅ ModuleCat.of (ZMod n) (ULift.{u} (ZMod n))) := by sorry
/-- Unit test `NoetherianFsLogAdicSpace.rankZeroH1`: ordinary geometric points have no H¹. -/
example (C : CompleteAlgClosedField.{u} p) (n : ℕ) (hn : 0<n) : Limits.IsZero
    ((DerivedCategory.homologyFunctor (ModuleCat.{u} (ZMod n)) 1).obj
      (cohomology (rankZeroPoint C) (ZMod n))) := by sorry
end NoetherianFsLogAdicSpace

namespace CartierCosimplicial
variable {p : ℕ} [Fact p.Prime]
/-- Integral injective chart M→Q whose relative Frobenius pushout is exact and injective.
Its cosimplicial rings are the explicit monoid algebras in K1 Appendix B.1. -/
def Datum (k : Type u) [CommRing k] : Type (u+1) := sorry
noncomputable def Datum.complex {k : Type u} [CommRing k] (d : Datum k) :
    CochainComplex (ModuleCat.{u} k) ℕ := sorry
/-- The endomorphism ι ∘ pr kills precisely the monomials outside the image of Q^(1). -/
noncomputable def Datum.projection {k : Type u} [CommRing k] (d : Datum k) :
    d.complex ⟶ d.complex := sorry
/-- Node `PR.8/cartier-type-cosimplicial-frobenius`: K1 Proposition B.1's chain-homotopy shadow.
The cosimplicial homotopy's A^(1)-linearity and relative tensor version are in the definitive text. -/
theorem homotopy {k : Type u} [CommRing k] (d : Datum k) :
    Nonempty (Homotopy d.projection (𝟙 d.complex)) := by sorry
end CartierCosimplicial
namespace LogQRSP
variable {p : ℕ} [Fact p.Prime]
/-- Node `PR.8/log-qrsp-basis`: KY Lemma 3.18's covering existence. The presentable
∞-category valued sheaf equivalence is outside the 1-categorical Lean shadow. -/
theorem basis (X : LogQSyn.PrelogRing.{u}) (hX : LogQSyn.IsQuasisyntomic (p:=p) X) :
    ∃ Y : LogQSyn.PrelogRing.{u}, ∃ f : LogQSyn.Hom X Y,
      LogQSyn.IsCover (p:=p) f ∧ IsQRSP (p:=p) Y ∧ Function.Surjective (powMonoidHom p : Y.M →* Y.M) := by sorry
end LogQRSP
namespace QProKummerEtale
variable {p : ℕ} [Fact p.Prime]
/-- fs monoid P with torsion-free group completion, as required by the corrected power tower. -/
def PowerTowerDatum (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
noncomputable def PowerTowerDatum.base (D : PowerTowerDatum.{u} p) : LogDiamond.{u} p := sorry
noncomputable def PowerTowerDatum.allRoots (D : PowerTowerDatum.{u} p) : LogDiamond.{u} p := sorry
noncomputable def PowerTowerDatum.map (D : PowerTowerDatum.{u} p) : D.allRoots ⟶ D.base := sorry
/-- Node `PR.8/kummer-tower-covers`: the all-integer root tower is quasi-pro-Kummer-étale.
Surjectivity, finite intermediate covers and scheme-to-diamond site morphisms remain the reader's
additional assertions; the excluded Z/2 unit monoid is tested separately in the packet. -/
theorem powerTower (D : PowerTowerDatum.{u} p) : IsQPKet D.map := by sorry
end QProKummerEtale
/-- Proper input for the semistable period diagram; the period constructors belong to AI.6. -/
def ProperSemistableOC (p : ℕ) [Fact p.Prime] : Type (u+1) := sorry
namespace SemistablePeriodDiagram
variable {p : ℕ} [Fact p.Prime]
def BdrPlus (X : ProperSemistableOC.{u} p) : Type u := sorry
noncomputable instance (X : ProperSemistableOC.{u} p) : CommRing (BdrPlus X) := sorry
noncomputable def t (X : ProperSemistableOC.{u} p) : BdrPlus X := sorry
noncomputable def logCrys (X : ProperSemistableOC.{u} p) : DerivedCategory (ModuleCat.{u} (BdrPlus X)) := sorry
noncomputable def aOmegaCrys (X : ProperSemistableOC.{u} p) : DerivedCategory (ModuleCat.{u} (BdrPlus X)) := sorry
noncomputable def genericCrys (X : ProperSemistableOC.{u} p) : DerivedCategory (ModuleCat.{u} (BdrPlus X)) := sorry
noncomputable def etalePeriod (X : ProperSemistableOC.{u} p) : DerivedCategory (ModuleCat.{u} (BdrPlus X)) := sorry
noncomputable def left (X : ProperSemistableOC.{u} p) : logCrys X ⟶ aOmegaCrys X := sorry
noncomputable def top (X : ProperSemistableOC.{u} p) : logCrys X ⟶ genericCrys X := sorry
noncomputable def bottom (X : ProperSemistableOC.{u} p) : aOmegaCrys X ⟶ etalePeriod X := sorry
noncomputable def right (X : ProperSemistableOC.{u} p) : genericCrys X ⟶ etalePeriod X := sorry
/-- Node `PR.8/semistable-crys-bdr-diagram`: corrected K1 Theorem 8.5, using ČK Proposition 6.8.
All four objects have been extended to B_dR⁺. The qCRYS corner is first formed over A_inf and
then tensored with A_crys. The right comparison is asserted invertible only after inverting t. -/
theorem comparison (X : ProperSemistableOC.{u} p) :
    left X ≫ bottom X = top X ≫ right X ∧ IsIso (left X) ∧
      IsIso ((derivedExtendScalars (algebraMap (BdrPlus X) (Localization.Away (t X)))).map (right X)) := by sorry
end SemistablePeriodDiagram

end TauCeti.LogPrismatic
