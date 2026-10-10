import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.Perfection
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.Single
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.GroupWithZero.NonZeroDivisors
import Mathlib.Algebra.GroupWithZero.Associated

/-!
# Suggested Lean for PrismaticCohomology, Part PR.8 (logarithmic prismatic cohomology)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PrismaticCohomology--PR.8.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures; every
proof is `sorry`, and nothing here claims an implementation.

What is typed. The algebraic core that the pinned Mathlib can express: δ-structures (restated
from PR.0's suggested file, since suggested files cannot import one another), δ_log-rings with
their API and unit tests, the monoid Frobenius of a δ_log log ring, the extension of δ_log to the
group completion, the monoid part of exactification, prelog prisms with all three prism axioms,
perfectoid and perfect monoids (via Mathlib's `Perfection` of a monoid and `Associates`), and
Kummer-type monoid maps.

What remains untyped. The geometric sites, their derived cohomology and comparisons, and
most planned API items and tests below have no typed declaration in this checkpoint. Some
require supplier interfaces not implemented at the pins; other omissions are signature work
still to do. Documentation comments are a name ledger, not a substitute for those declarations.
The full 2026 corrigendum must be read before the Laurent comparison can be made definitive.
The prism fixtures below include the actual invertibility, derived completeness and
p-membership conditions. All declarations with `sorry` remain unimplemented obligations.
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

/-- Unit test `DeltaLogRing.frobeniusMonoid_not_pow` (non-example): if `δ_log(m) ≠ 0`, `α(m)` and
`p` are nonzerodivisors, then `φ_M(m) ≠ m^p`. -/
example (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
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

/-! ## Packet name ledger and remaining signature work

The core above supplies 54 of the packet's 336 API/test forms. The following comments
record all remaining names and their mathematical contracts. Each entry marked untyped
is an outstanding PROTOCOL section 13 requirement; a comment is not a Lean declaration.
Unimplemented supplier carriers and source-version uncertainty must be resolved explicitly.
The provisional Laurent equivalence and pushforward are held for the full corrigendum.
-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-ring` (definition): δ_log-rings

Fix a prime p. A δ_log-ring is a tuple (A, δ, α: M → A, δ_log: M → A) where (A, δ) is a δ-ring (a Z_(p)-algebra with a p-derivation), (A, α) is a prelog ring (M a commutative monoid, α a map to the multiplicative monoid of A), and δ_log: M → A is a map of sets satisfying (1) δ_log(e) = 0 for the unit e of M; (2) α(m)^p·δ_log(m) = δ(α(m)) for every m ∈ M; (3) δ_log(mm′) = δ_log(m) + δ_log(m′) + p·δ_log(m)·δ_log(m′) for all m, m′ ∈ M. A morphism (A, M) → (B, N) of δ_log-rings is a morphism of prelog rings (a ring map f and a monoid map h with α_N∘h = f∘α_M) commuting with δ and with δ_log (δ_log∘h = f∘δ_log). A δ_log-ring is of rank 1 if δ_log = 0. Equivalently (Remark 2.5) a δ_log-structure is a monoid map w_log: M → W_2(A), m ↦ (1, δ_log(m)), with w(α(m)) = (α(m), 0)·w_log(m) for the δ-section w(x) = (x, δ(x)).

Typed forms above (proofs admitted): `DeltaLogRing.mk`, `DeltaLogRing.frobenius_alpha`, `DeltaLogRing.unitFactor_mul`, `DeltaLogRing.frobenius_iterate_alpha`, `DeltaLogRing.deltaLog_unique_of_nonZeroDivisor`, `DeltaLogRing.exists_iff_dvd`, `DeltaLogRing.Hom`, `DeltaLogRing.IsRankOne`, `DeltaLogRing.trivialLog`, `DeltaLogRing.monoidAlgebra`, `DeltaLogRing.baseChange`, `DeltaLogRing.ext`, `DeltaLogRing.Hom.ext`, `DeltaLogRing.trivialLog_deltaLog`, `DeltaLogRing.zero_monoid`, `DeltaLogRing.monoidAlgebra_rankOne`, `DeltaLogRing.not_any_map`, `DeltaLogRing.frobenius_alpha_example`.

* Untyped API `DeltaLogRing.equivWittSection` (equivalence): δ_log-structures on (A, δ, α) correspond bijectively to monoid maps w_log: M → W_2(A) of the form m ↦ (1, δ_log(m)) with w(α(m)) = (α(m), 0)·w_log(m).

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-frobenius` (construction): The monoid Frobenius of a δ_log log ring

Let (A, α: M → A, δ_log) be a δ_log-ring such that (A, M) is a log ring (α^{-1}(A^×) ≅ A^×) and p lies in the Jacobson radical of A. Then 1 + pδ_log(m) ∈ A^× for all m, and φ_M(m) := m^p·α^{-1}(1 + pδ_log(m)) defines a monoid endomorphism of M with α∘φ_M = φ_A∘α, so (φ_A, φ_M) is an endomorphism of the log ring (A, M). If the δ_log-ring is of rank 1 the p-th power map of M lifts φ_A for any prelog ring.

Typed forms above (proofs admitted): `DeltaLogRing.frobeniusMonoid`, `DeltaLogRing.alpha_frobeniusMonoid`, `DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne`, `DeltaLogRing.frobeniusMonoid_units`, `DeltaLogRing.frobeniusMonoid_natural`, `DeltaLogRing.rankOneFrobeniusMonoid`, `DeltaLogRing.alpha_rankOneFrobeniusMonoid`, `DeltaLogRing.frobeniusMonoid_bk`, `DeltaLogRing.frobeniusMonoid_trivial`, `DeltaLogRing.frobeniusMonoid_not_pow`.

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-free` (construction): Limits, colimits and free δ_log-rings

The category of δ_log-rings has all limits and colimits, computed on underlying rings and monoids; the forgetful functors to prelog rings and to pairs (ring, monoid) have left adjoints that are the identity on the monoid part, and the forgetful functor to prelog rings has a right adjoint. For a δ_log-ring (A, M_A) and a monoid M, (A{M}_δlog, M_A ⊕ M) denotes the δ_log-ring freely obtained from the prelog ring (A[M], M_A ⊕ M). The free δ_log-ring on one log generator, Z_(p){x}_δlog, is the polynomial ring Z_(p)[x, δ_log(x), δ(δ_log(x)), δ^2(δ_log(x)), …] with prelog structure x^N, and its Frobenius is faithfully flat; Z_(p){x}_δlog[1/p] is the polynomial ring on x, φ(x)/x^p, φ(φ(x)/x^p), …; and (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) becomes an isomorphism after classical p-completion.

Typed forms above (proofs admitted): `DeltaLogRing.freeOneGenerator_equiv_mvPolynomial`, `DeltaLogRing.freeOneGenerator.lift`, `DeltaLogRing.freeOneGenerator.lift_unique`, `DeltaLogRing.freeOneGenerator_frobenius_x`, `DeltaLogRing.freeOneGenerator_not_monoidAlgebra`, `DeltaLogRing.pdivisible_rankOne`.

* Untyped API `DeltaLogRing.freeOnMonoid` (constructor): For a δ_log-ring (A, M_A) and a monoid M, the δ_log-ring (A{M}_δlog, M_A ⊕ M) with its prelog-ring map from (A[M], M_A ⊕ M).

* Untyped API `DeltaLogRing.freeOnMonoid.lift` (universal-property): δ_log-maps (A{M}_δlog, M_A ⊕ M) → (B, N) over (A, M_A) correspond to monoid maps M → N compatible with prelog structures (lift ∘ canonical = given map, and uniqueness).

* Untyped API `DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat` (other): φ on Z_(p){x}_δlog is faithfully flat.

* Untyped API `DeltaLogRing.hasLimits` (instance): The category of δ_log-rings has all small limits and colimits, preserved by the forgetful functor to (ring, monoid) pairs.

* Untyped API `DeltaLogRing.invertGenerator_completion` (compatibility): (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) is an isomorphism after classical p-completion.

* Untyped Unit test `DeltaLogRing.freeOnMonoid_trivial` (degenerate): For M the trivial monoid, (A{M}_δlog, M_A ⊕ M) = (A, M_A).

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-completion-etale` (lemma): δ_log-structures pass to completions and completely étale extensions

Let (A, M) be a δ_log-ring and I ⊂ A a finitely generated ideal containing p. (1) The classical I-adic completion A^∧_cl with the composite prelog structure M → A → A^∧_cl carries a unique δ_log-structure making A → A^∧_cl a map of δ_log-rings. (2) If A → B is I-completely étale, then (B, M) carries a unique δ_log-structure compatible with (A, M).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-associated-log` (theorem): δ_log-structures on associated log structures

(1) Let (A, M) be a δ_log-ring and N := M ⊔_{α^{-1}(A^×)} A^× the pushout of monoids. There is a unique δ_log-structure on the prelog ring (A, N) compatible with that of (A, M). (2) If moreover A is classically I-complete for a finitely generated ideal I ∋ p, then for every affine U = Spf(B) étale over Spf(A), the log ring (B, Γ(U, M^a)) of the associated log structure M^a on Spf(A)_ét carries a unique δ_log-structure compatible with (A, M) and with étale localisation. Hence δ_log-structures make sense on log structures (on the étale site of Spf(A)).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-groupification` (theorem): Extension of δ_log along M ⊂ N ⊂ M^gp

Let (A, M, α) be a δ_log-ring with M integral and p ∈ rad(A). (1) There is a unique map δ_log: M^gp → A extending the given δ_log on M and satisfying δ_log(mm′) = δ_log(m) + δ_log(m′) + pδ_log(m)δ_log(m′) on M^gp, namely δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m)). (2) For every submonoid N ⊂ M^gp containing M there is a unique δ-structure on A ⊗_{Z_(p)[M]} Z_(p)[N] making (A ⊗_{Z_(p)[M]} Z_(p)[N], N) a δ_log-ring over (A, M) with this δ_log. (3) The map (A, M) → (A ⊗_{Z_(p)[M]} Z_(p)[N], N) is universal among maps of δ_log-rings (A, M) → (B, N) compatible with M ⊂ N, and its formation commutes with base change A → A′.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-exactification` (construction): Exactification of δ_log-triples

Let (A, I, M) be a δ_log-triple (a δ_log-ring with an ideal I) with A classically p-complete, (A/I, N) a prelog ring and (A, M) → (A/I, N) a surjective map of prelog rings with M and N integral. Let h: M → N, h̄: M → N/N^× and M′ := (h^gp)^{-1}(N) = (h̄^gp)^{-1}(N/N^×) ⊂ M^gp; M′ is generated by M and (h̄^gp)^{-1}(e). The exactification is the δ_log-triple (A′, I′, M′) with A′ := A ⊗_{Z_(p)[M]} Z_(p)[M′] (with the δ_log-structure of Proposition 2.16), the induced exact surjection (A′, M′) → (A/I, N), and I′ := ker(A′ → A/I). The construction is functorial and the formation of (A′, M′) commutes with base change on A. If (A, M) → (A/I, N) lives over (B, M_B) with M_B → N integral, then M_B → M′ is integral.

Typed forms above (proofs admitted): `DeltaLogTriple.exactification_compat_monoid`.

* Untyped API `DeltaLogTriple.exactification` (constructor): The δ_log-triple (A′, I′, M′) with A′ = A ⊗_{Z_(p)[M]} Z_(p)[(h^gp)^{-1}(N)].

* Untyped API `DeltaLogTriple.exactification.toQuotient_exactSurjective` (characterisation): (A′, M′) → (A/I, N) is surjective and M′/M′^× ≅ N/N^×.

* Untyped API `DeltaLogTriple.exactification.lift` (universal-property): Every map of δ_log-triples (A, I, M) → (B, J, M_B) whose target surjects exactly onto (A/I, N) compatibly factors uniquely through (A′, I′, M′).

* Untyped API `DeltaLogTriple.exactification.baseChange` (functoriality): For A → A″ the exactification of the base change is the base change of (A′, M′).

* Untyped API `DeltaLogTriple.exactification.integral` (other): If M_B → N is integral for a base (B, M_B), then the induced M_B → M′ is integral.

* Untyped Unit test `DeltaLogTriple.exactification_of_exact` (degenerate): If (A, M) → (A/I, N) is already exact surjective then (A′, I′, M′) = (A, I, M).

* Untyped Unit test `DeltaLogTriple.exactification_diagonal` (computation): For (Z_p⟨X_0, X_1⟩, X_0^N X_1^N) → (Z_p⟨X_0⟩, X_0^N) sending both generators to X_0, M′ = X_0^N·(X_1/X_0)^Z and A′ = Z_p⟨X_0, X_1⟩[T,T^{-1}]/(X_0T − X_1). This exactification is algebraic; completion is a separate step in the envelope construction.

* Untyped Unit test `DeltaLogTriple.exactification_not_ring_quotient` (non-example): The exactification is not the kernel-ideal construction on A alone: for the diagonal example the ring changes (X_1/X_0 is adjoined), so the prismatic envelope of A → A/I without exactification is the wrong object.

-/

/-! ### Node `PrismaticCohomology:PR.8/prelog-prism` (definition): Prelog prisms

A prelog prism is a δ_log-triple (A, I, M) (a δ_log-ring (A, M) with an ideal I) such that (A, I) is a prism in the sense of BS22 (I defines a Cartier divisor, A is derived (p, I)-complete, p ∈ I + φ(I)A). It is bounded if (A, I) is bounded (A/I has bounded p^∞-torsion), and of rank 1 if δ_log = 0. Maps of prelog prisms are maps of δ_log-triples (maps of δ_log-rings carrying I into J). Rigidity: if (A, I, M) is a prelog prism and A → B a map of δ-rings with B (p, I)-complete, then (B, IB, M) is a prelog prism iff B[I] = 0; this holds when (A, I) is bounded and B is (p, I)-completely flat over A.

Typed forms above (proofs admitted): `PrelogPrism.mk`, `PrelogPrism.toPrism`, `PrelogPrism.IsBounded`, `PrelogPrism.IsRankOne`, `PrelogPrism.zero_log`, `PrelogPrism.trivial_monoid`, `PrelogPrism.not_delta_pair`.

* Untyped API `PrelogPrism.baseChange_of_flat` (functoriality): If (A, I) is bounded and A → B is a (p, I)-completely flat δ-map with B (p, I)-complete, then (B, IB, M) is a prelog prism.

* Untyped API `PrelogPrism.rigid` (characterisation): For a δ-map A → B with B (p, I)-complete, (B, IB, M) is a prelog prism iff B[I] = 0.

* Untyped Unit test `PrelogPrism.forget_compat` (compatibility): The forgetful functor to prisms sends (W(k), (p), N → 0) to PR.0's crystalline prism (W(k), (p)).

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prism` (definition): Log prisms

Let (A, I, M) be a bounded prelog prism. Then Spf(A) (with the (p, I)-adic topology; A is classically (p, I)-complete) carries the associated log structure M^a_{Spf(A)} with its δ_log-structure (Corollary 2.15). A log prism is a triple (A, I, M_{Spf(A)}) of a bounded prism (A, I) and a log structure on Spf(A) with a δ_log-structure arising from some bounded prelog prism; (A, I, M)^a denotes the associated log prism. A map of log prisms is a map of log formal schemes inducing a map of prisms and preserving δ_log. Conversely (A, I, Γ(Spf(A), M_{Spf(A)})) is a prelog prism. A map of bounded prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M_{Spf(B)})) induces a unique map of log prisms (A, I, M_A)^a → (B, J, M_{Spf(B)}). In the convention of Koshikawa–Yao, a ''log prism'' (in quotation marks) is a bounded prelog prism whose (A, M_A) is a log ring; for (A, M_A) a log ring with A classically p-complete the δ_log-structure induces the Frobenius lift φ(m) = m^p(1 + pδ_log(m)).

* Untyped API `LogPrism.ofPrelog` (constructor): The associated log prism (A, I, M)^a of a bounded prelog prism.

* Untyped API `LogPrism.globalSections` (projection): The prelog prism (A, I, Γ(Spf(A), M_{Spf(A)})).

* Untyped API `LogPrism.homOfPrelog` (universal-property): Maps of prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M)) correspond bijectively to maps of log prisms (A, I, M_A)^a → (B, J, M).

* Untyped API `LogPrism.frobenius` (structure): For a log prism the Frobenius lift (φ_A, φ_M) of the log formal scheme Spf(A) (from delta-log-frobenius).

* Untyped API `LogPrism.IsIntegral` (other): The log structure is integral.

* Untyped API `LogPrism.trivial` (example): Any bounded prism with the trivial log structure O^×.

* Untyped Unit test `LogPrism.trivial_frobenius` (degenerate): For the trivial log structure the Frobenius of the log prism is φ_A.

* Untyped Unit test `LogPrism.bk_associated` (computation): The associated log structure of (W(k)[[u]], (E(u)), N → u^n) on Spf(W(k)[[u]]) (a single point for the (p, E)-adic topology) has characteristic monoid M/O^× ≅ N, generated by u.

* Untyped Unit test `LogPrism.globalSections_not_inverse` (non-example): (B, J, Γ(Spf(B), M))^a → (B, J, M) need not be an isomorphism (K1 Remark 3.5): a log prism is not the same as a prelog prism on global sections.

* Untyped Unit test `LogPrism.forget_compat` (compatibility): Forgetting the log structure sends log prisms to PR.0's bounded prisms, and the trivial log prism functor is a section.

-/

/-! ### Node `PrismaticCohomology:PR.8/standard-log-prisms` (construction): The standard prelog prisms

The following are bounded prelog prisms: (1) for a bounded prism (A, I), the trivial log structure (A, I, O^×) and (A, I, N → A, 1 ↦ 0) of rank 1; (2) for a perfect prism (A, I) = (W(R♭), ker θ) with R perfectoid, (W(R♭), ker θ, R♭) with the Teichmüller prelog structure, of rank 1, and for R♭ a domain (A_inf, (ξ), O_C♭∖{0}); (3) the crystalline prelog prism (W(k), (p), N → W(k), 1 ↦ 0) of rank 1 (Hyodo–Kato base); (4) for K/W(k)[1/p] totally ramified with uniformiser π and Eisenstein polynomial E(u), the Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → W(k)[[u]], n ↦ u^n) with δ_log = 0 and φ(u) = u^p. These are related by the maps of prelog prisms W(k)[[u]] → W(k) (u ↦ 0, identity on N) and W(k)[[u]] → A_inf (u ↦ [π♭], 1 ↦ [π♭]).

* Untyped API `PrelogPrism.breuilKisin` (constructor): The Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → u^n) of rank 1.

* Untyped API `PrelogPrism.ainf` (constructor): The prelog prism (A_inf, ker θ, O_C♭∖{0}) with Teichmüller prelog structure, of rank 1.

* Untyped API `PrelogPrism.crystallineZeroLog` (constructor): The prelog prism (W(k), (p), N → W(k), 1 ↦ 0).

* Untyped API `PrelogPrism.breuilKisinToCrystalline` (functoriality): The map of prelog prisms u ↦ 0 from the Breuil–Kisin prelog prism to (W(k), (p), N).

* Untyped API `PrelogPrism.breuilKisinToAinf` (functoriality): The map of prelog prisms u ↦ [π♭] to (A_inf, ker θ, O_C♭∖{0}), with N → O_C♭∖{0}, 1 ↦ π♭.

* Untyped Unit test `PrelogPrism.breuilKisin_frobenius` (computation): In the Breuil–Kisin prelog prism φ(u) = u^p and δ_log(1) = 0, so φ_M is multiplication by p on N.

* Untyped Unit test `PrelogPrism.breuilKisin_mod_u` (compatibility): Reducing the Breuil–Kisin prelog prism along u ↦ 0 gives (W(k), (p), N → 0) since E(0) = p·unit.

* Untyped Unit test `PrelogPrism.ainf_rankOne` (characterisation): In (A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0 for all x, so δ_log = 0 is forced (Lemma 2.1 of K1).

* Untyped Unit test `PrelogPrism.breuilKisin_not_frobenius_u_plus_p` (non-example): With the Frobenius φ(u) = u^p + p on W(k)[[u]], (W(k)[[u]], (E), N → u) is not a δ_log-ring of rank 1, and no δ_log exists since u^p does not divide δ(u) = 1.

-/

/-! ### Node `PrismaticCohomology:PR.8/prelog-prismatic-envelope` (construction): Prelog prismatic envelopes

Fix an orientable prelog prism (A, I, M_A) with M_A integral. Let (B, J, M_B) be a δ_log-triple over (A, I, M_A) and (B, M_B) → (B/J, N) a surjection of prelog rings with M_B, N integral. There is a universal map (B, J, M_B) → (B′, IB′, M_{B′}) of δ_log-triples over (A, I, M_A) to a prelog prism with an exact surjection (B′, M_{B′}) → (B′/IB′, N); moreover M_{B′} is integral. It is called the prelog prismatic envelope.

* Untyped API `PrelogPrism.envelope` (constructor): The prelog prismatic envelope (B′, IB′, M_{B′}) of (B, J, M_B) → (B/J, N) over (A, I, M_A).

* Untyped API `PrelogPrism.envelope.lift` (universal-property): Maps of δ_log-triples from (B, J, M_B) to a prelog prism (C, IC, M_C) over (A, I, M_A) with an exact surjection (C, M_C) → (C/IC, N) compatible with (B/J, N) factor uniquely through the envelope.

* Untyped API `PrelogPrism.envelope.exactSurjective` (characterisation): (B′, M_{B′}) → (B′/IB′, N) is exact surjective.

* Untyped API `PrelogPrism.envelope.monoid_integral` (other): M_{B′} is integral.

* Untyped API `PrelogPrism.envelope_of_exact` (compatibility): For an exact surjection the envelope is PR.0's prismatic envelope of (B, J) with the monoid M_B unchanged.

* Untyped Unit test `PrelogPrism.envelope_identity` (degenerate): The envelope of (A, I, M_A) → (A/I, M_A) itself is (A, I, M_A).

* Untyped Unit test `PrelogPrism.envelope_trivial_log` (compatibility): With all monoids trivial, the prelog prismatic envelope is the BS22 prismatic envelope.

* Untyped Unit test `PrelogPrism.envelope_log_line_diagonal` (computation): For (A⟨X_0, X_1⟩, X_0^N X_1^N) → (A/I⟨X_0⟩, X_0^N) the envelope is the completion of A⟨X_0, X_1⟩{(I, X_1/X_0 − 1)/I}_δ with monoid X_0^N(X_1/X_0)^Z (K1 §5.4).

* Untyped Unit test `PrelogPrism.envelope_not_without_exactification` (non-example): Without exactification the non-log prismatic envelope of (A⟨X_0, X_1⟩, (I, X_1 − X_0)) gives the non-log Čech nerve, whose Hodge–Tate cohomology is ordinary Ω, not log Ω.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-envelope` (theorem): Universal property of log prismatic envelopes

In the situation of the prelog prismatic envelope, assume (B′, IB′, M_{B′}) is bounded. Then (B′, IB′, M_{B′})^a with the exact closed immersion (Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′}) is final among commutative squares with top arrow an exact closed immersion (Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)}) for log prisms (C, IC, M_{Spf(C)}) with integral log structure over (Spf(B/J), N^a) → (Spf(B), M^a_B). Key lemma: for such a log prism, with N^a_{C/I} := Γ(Spf(C/IC), N^a), the map (C, Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I}) is exact surjective and a (1 + IC)-torsor on monoids.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/envelope-flatness-smooth` (theorem): Flatness of prelog prismatic envelopes for smooth log algebras

Fix a bounded prelog prism (A, I, M_A) with M_A integral. (1) Let (B_0, M_B) be a prelog ring over (A, M_A) with M_B integral and (B_0, M_B) → (B_0/J, N) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) (smooth in Koshikawa's Appendix A sense). Assume M_A → N is integral, N is weakly finitely generated over M_A, and (∗): M_A → M_B is injective and integral, M_B^gp/M_A^gp is free abelian, and B_0 is (p, I)-completely free over the completion of A ⊗_{Z_(p)[M_A]} Z_(p)[M_B]. Let (B, M_B) be the (p, I)-completed free δ_log-ring over (A, M_A) generated by (B_0, M_B). Then the prelog prismatic envelope (B′, IB′, M_{B′}) of (B, (JB)^∧, M_B) exists, is (p, I)-completely flat over A (hence bounded), and its formation commutes with base change on (A, I, M_A) and with (p, I)-completely flat base change on B_0. (2) Variant: if (B, M_B) is a (p, I)-completely smooth δ_log-ring over (A, M_A) with M_A → M_B a smooth chart, (B, M_B) → (R, P) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) with M_A → P integral, then the prelog prismatic envelope exists, is (p, I)-completely flat over A and commutes with base change on (A, I, M_A).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/perfectoid-monoid` (definition): Perfectoid monoids and perfectoid log rings

For a commutative monoid M its tilt is M♭ := lim_{m ↦ m^p} M; M♭ and M♭/(M♭)^× are uniquely p-divisible. M is perfectoid if M♭/(M♭)^× → M/M^× is an isomorphism; perfect if M is uniquely p-divisible (M♭ → M an isomorphism); pseudo-perfectoid if M/M^× is uniquely p-divisible. A pre-log ring (R, M) is perfectoid if R is a perfectoid ring (in the sense of BMS1) and M is perfectoid; then (R, M♭) → (R, M) induces an isomorphism of associated log rings, and the tilt (R♭, M♭) with α♭(m_0, m_1, …) = (α(m_0), α(m_1), …) and A_inf(R) := (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]) are defined. An integral log ring (R, M) is a perfectoid log ring if it is perfectoid as a pre-log ring, equivalently R is perfectoid and M/M^× is uniquely p-divisible.

Typed forms above (proofs admitted): `Monoid.tilt`, `Monoid.IsPerfectoid`, `Monoid.IsPerfect`, `Monoid.IsPseudoPerfectoid`, `Monoid.IsPerfect.isPerfectoid`, `Monoid.IsPerfectoid.isPseudoPerfectoid`, `Monoid.isPerfectoid_units`.

* Untyped API `PrelogRing.tilt` (constructor): For a perfectoid pre-log ring (R, M), the pre-log ring (R♭, M♭, α♭).

* Untyped API `PrelogRing.ainf` (constructor): A_inf(R) = (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]).

* Untyped API `PerfectoidLogRing.iff_pseudoPerfectoid` (characterisation): For an integral log ring (R, M) with R perfectoid, M is perfectoid iff M/M^× is uniquely p-divisible.

* Untyped Unit test `Monoid.tilt_nat_inv_p` (computation): For M = N[1/p] (additive), M♭ ≅ N[1/p] and M is perfect.

* Untyped Unit test `Monoid.valuationMonoid_perfectoid_not_perfect` (non-example): O_C∖{0} for C algebraically closed perfectoid is perfectoid but not perfect, since 1 + p has many p-th roots.

* Untyped Unit test `Monoid.pseudoPerfectoid_not_perfectoid` (non-example): The monoid generated by x_0, x_1, …, y_1^{±1}, … with x_j^p = x_{j−1}y_j is pseudo-perfectoid with M/M^× ≅ N[1/p] but M♭ = 0.

* Untyped Unit test `Monoid.tilt_compat_pretilt` (compatibility): For an integral perfectoid ring R, the multiplicative monoid of PreTilt agrees with Monoid.tilt of (R, ·) under the multiplicative bijection R♭ ≅ lim_{x ↦ x^p} R.

-/

/-! ### Node `PrismaticCohomology:PR.8/perfect-log-prism` (definition): Perfect log prisms

A ''log prism'' (A, I, M_A) (bounded prelog prism with (A, M_A) a log ring) is perfect if M_A is integral and its Frobenius (φ_A, φ_{M_A}) is an isomorphism. If (A, I) is perfect, (A, I, M_A) is perfect iff M_A/A^× is uniquely p-divisible; a perfect ''log prism'' has p-saturated monoid. Every integral ''log prism'' has a perfection (A_perf, IA_perf, M_{A,perf}): the colimit perfection of A with the log structure associated to colim_φ M_A → A_perf. For a perfectoid integral pre-log ring (R, M), (A_inf(R), ker θ, M♭)^a is perfect and of rank 1.

Typed forms above (proofs admitted): `LogPrism.IsPerfect`, `LogPrism.isPerfect_iff_uniquelyDivisible`, `LogPrism.trivial_isPerfect_iff`.

* Untyped API `LogPrism.IsPerfect.pSaturated` (relation): A perfect ''log prism'' has p-saturated monoid.

* Untyped API `LogPrism.perfection` (constructor): The perfection (A_perf, IA_perf, M_{A,perf}) of an integral ''log prism''.

* Untyped API `LogPrism.perfection.lift` (universal-property): Maps from an integral ''log prism'' to a perfect one factor uniquely through its perfection.

* Untyped API `LogPrism.ainfPerfect` (example): (A_inf(R), ker θ, M♭)^a is perfect of rank 1 for a perfectoid integral pre-log ring (R, M).

* Untyped Unit test `LogPrism.ainf_isPerfect` (computation): (A_inf, (ξ), O_C♭∖{0})^a is a perfect log prism.

* Untyped Unit test `LogPrism.breuilKisin_not_perfect` (non-example): The Breuil–Kisin log prism (W(k)[[u]], (E), N) is not perfect: u is not a p-th power and φ is not surjective.

* Untyped Unit test `LogPrism.zeroLog_perfect` (characterisation): (W(k), (p), N → 0)^a is not perfect (N is not p-divisible), while its perfection has monoid N[1/p] modulo units.

-/

/-! ### Node `PrismaticCohomology:PR.8/perfect-log-prisms-perfectoid` (theorem): Perfect log prisms are perfectoid log rings

The functor (A, I, M_A) ↦ (A/I, M_A)^a is an equivalence from perfect ''log prisms'' to perfectoid log rings, with quasi-inverse (R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a. In particular every perfect ''log prism'' admits a chart N → A of rank 1. Moreover, for a perfectoid integral pre-log ring (R, M) and an integral ''log prism'' (A, I, M_A), every map (R, M) → (A/I, M_A)^a of pre-log rings lifts uniquely to a map of pre-log prisms (A_inf(R), ker θ, M♭) → (A, I, M_A); so (A_inf(R), ker θ, M♭)^a is initial among integral ''log prisms'' under (R, M) (also with exact-surjection or associated-log variants).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/perfectoid-prelog-cotangent` (lemma): Log cotangent complexes of perfectoid pre-log rings

Let (R, M) be a perfectoid (or pseudo-perfectoid) pre-log ring and Z_p the trivial pre-log ring. Then the natural map L̂_{R/Z_p} → L̂_{(R,M)/Z_p} of p-completed (Gabber) log cotangent complexes is an isomorphism; equivalently L̂_{(R,M)/R} = 0; in particular L̂_{(R,M)/Z_p}[−1]{−1} ≅ R. For a map f: (R, M) → (S, N) of perfectoid pre-log rings, L̂_{(S,N)/(R,M)} = 0.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-site` (definition): The relative log prismatic site

Fix a bounded prelog prism (A, I, M_A) with M_A integral and a log (p, I)-adic formal scheme (X, M_X) smooth over (A/I, M_A) in Koshikawa's sense (so M_X is integral). The log prismatic site ((X, M_X)/(A, M_A))_Δ is the opposite of the category of triples consisting of: a log prism (B, IB, M_{Spf(B)}) = (B, IB, M_B)^a with integral log structure and a map of log prisms (A, I, M_A)^a → (B, IB, M_{Spf(B)}); a map of formal schemes f: Spf(B/IB) → X over A/I; and an exact closed immersion of log formal schemes (Spf(B/IB), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A). A morphism is an étale cover if B → C is (p, I)-completely étale and faithfully flat and (Spf(C), M) → (Spf(B), M) is strict étale. The structure sheaves are O_Δ: B ↦ B and Ō_Δ: B ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. The site depends only on (Spf(A), M_A)^a and (X, M_X), not on the chart M_A → A.

* Untyped API `LogPrismaticSite` (constructor): The site ((X, M_X)/(A, M_A))_Δ with the étale topology.

* Untyped API `LogPrismaticSite.structureSheaf` (data): The sheaf O_Δ: (B, IB, M) ↦ B, valued in (p, I)-complete A-algebras with δ-structure.

* Untyped API `LogPrismaticSite.reducedStructureSheaf` (data): Ō_Δ: (B, IB, M) ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ.

* Untyped API `LogPrismaticSite.etaleLift` (characterisation): For an object B and a p-completely étale B/IB → C̄ there is a unique étale map of objects B → C with C/IC ≅ C̄ (Remark 4.2).

* Untyped API `LogPrismaticSite.toEtale` (functoriality): The morphism of topoi ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) with (ν_*F)(U) = H^0(((U, M_U)/(A, M_A))_Δ, F).

* Untyped API `LogPrismaticSite.flat_eq_etale` (compatibility): Replacing étale covers by (p, I)-completely faithfully flat covers does not change the cohomology of O_Δ (Remark 4.3).

* Untyped API `LogPrismaticSite.trivialLog_equiv` (equivalence): For trivial log structures the site is equivalent to PR.1's relative prismatic site with the étale topology.

* Untyped API `LogPrismaticSite.chart_independent` (other): The site depends only on (Spf(A), M_A)^a and (X, M_X).

* Untyped Unit test `LogPrismaticSite.affineLine_object` (computation): For (X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a, the triple (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 and the identity Spf(A/I⟨X⟩) → X is an object.

* Untyped Unit test `LogPrismaticSite.trivialLog` (compatibility): With M_A and M_X trivial, the site equals the PR.1 relative prismatic site (étale variant) and the structure sheaves agree.

* Untyped Unit test `LogPrismaticSite.base_point` (degenerate): For X = Spf(A/I) with the log structure from M_A, (A, I, M_A)^a is a final object.

* Untyped Unit test `LogPrismaticSite.not_strict_open_immersion` (non-example): For the log affine line with trivial base log structure, forgetting logs sends (A⟨X⟩, I, N)^a to a valid object of the underlying non-log prismatic site. It does not preserve the Hodge–Tate differential module: the canonical map R·dX → R·dlog X sends dX to X·dlog X and is not an isomorphism when X is not a unit.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-cohomology` (construction): Log prismatic cohomology complexes

In the setting of the log prismatic site, define Δ_{(X,M_X)/(A,M_A)} := Rν_*O_Δ ∈ D(X_ét, A) and its reduction Δ̄_{(X,M_X)/(A,M_A)} := Rν_*Ō_Δ ∈ D(X_ét, A/I), commutative algebra objects with Δ̄ ≅ Δ ⊗^L_A A/I, and RΓ_Δ((X, M_X)/(A, M_A)) := RΓ(((X, M_X)/(A, M_A))_Δ, O_Δ), a (p, I)-complete E_∞-A-algebra with a φ_A-semilinear endomorphism φ induced by the δ-structures. For X = Spf(R) with an integral chart P → Γ(X, M_X) over M_A that is integral and weakly finitely generated over M_A, write Δ_{(R,P)/(A,M_A)}; it may be computed with the indiscrete topology and depends only on (Spf(R), P)^a and (A, I, M_A)^a.

* Untyped API `LogPrismaticSite.cohomology` (constructor): RΓ_Δ((X, M_X)/(A, M_A)) as a (p, I)-complete E_∞-A-algebra.

* Untyped API `LogPrismaticSite.sheafCohomology` (constructor): Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A).

* Untyped API `LogPrismaticSite.reducedCohomology` (constructor): Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I).

* Untyped API `LogPrismaticSite.reduced_eq_tensor` (characterisation): Δ̄ ≅ Δ ⊗^L_A A/I.

* Untyped API `LogPrismaticSite.frobenius` (structure): The φ_A-semilinear Frobenius φ: Δ → φ_{A,*}Δ.

* Untyped API `LogPrismaticSite.cohomology_isComplete` (other): RΓ_Δ is derived (p, I)-complete.

* Untyped API `LogPrismaticSite.cohomology_map` (functoriality): Functoriality in (X, M_X) over (A, M_A) and in maps of bounded prelog prisms.

* Untyped Unit test `LogPrismaticSite.cohomology_point` (degenerate): For X = Spf(A/I) with log structure from M_A, RΓ_Δ((X, M_X)/(A, M_A)) ≅ A with φ = φ_A.

* Untyped Unit test `LogPrismaticSite.cohomology_trivialLog` (compatibility): With trivial log structures, Δ_{(X,M_X)/(A,M_A)} ≅ PR.1's Δ_{X/A}.

* Untyped Unit test `LogPrismaticSite.reduced_affineLine` (computation): For (A/I⟨X⟩, M_A ⊕ N): H^0(Δ̄) = A/I⟨X⟩ and H^1(Δ̄){1} ≅ A/I⟨X⟩·dlog X, a free module of rank 1 (K1 §5.4).

* Untyped Unit test `LogPrismaticSite.cohomology_not_nonlog` (non-example): For the log affine line, H^1(Δ̄){1} is generated by dlog X rather than dX: the log and non-log cohomologies differ (the map Ω^1 → Ω^1_log is X·, not an isomorphism).

-/

/-! ### Node `PrismaticCohomology:PR.8/absolute-log-prismatic-site` (definition): The absolute saturated log prismatic site

For an integral log p-adic formal scheme (X, M_X), the absolute log prismatic site (X, M_X)_Δ has objects diagrams (Spf(B), M_{Spf(B)}) ↩ (Spf(B/J), M_{Spf(B/J)}) → (X, M_X) where (B, J, M_{Spf(B)}) is a log prism with M_{Spf(B)} integral, M_{Spf(B/J)} its restriction, and the right map admits an integral chart étale locally; it carries the flat topology. For a bounded fs log p-adic formal scheme, the absolute saturated log prismatic site has objects saturated log prisms (A, I, M_A)^a with a map (Spf(A/I), M_A)^a → (X, M_X) admitting a saturated chart étale locally, with the strict flat topology. There is a strict variant requiring the right map to be strict, and the relative site maps to it.

* Untyped API `AbsoluteLogPrismaticSite` (constructor): The site (X, M_X)_Δ with the flat topology (integral variant).

* Untyped API `AbsoluteLogPrismaticSite.saturated` (constructor): The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict flat topology.

* Untyped API `AbsoluteLogPrismaticSite.structureSheaf` (data): O_Δ: (B, J, M) ↦ B and the ideal sheaf I_Δ: (B, J, M) ↦ J.

* Untyped API `AbsoluteLogPrismaticSite.ofRelative` (functoriality): The forgetful functor from the relative site ((X, M_X)/(A, M_A))_Δ to the strict variant.

* Untyped API `AbsoluteLogPrismaticSite.trivialLog` (compatibility): For trivial log structures the strict variant is PR.5's absolute prismatic site.

* Untyped Unit test `AbsoluteLogPrismaticSite.bk_covers` (computation): For (X, M_X) = (Spf(O_K), O_K∖{0})^a, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object (K1 Lemma 4.14).

* Untyped Unit test `AbsoluteLogPrismaticSite.point_perfect` (degenerate): For (Spf(O_C), O_C∖{0})^a, the perfect log prism (A_inf, (ξ), O_C♭∖{0})^a is weakly final.

* Untyped Unit test `AbsoluteLogPrismaticSite.not_relative` (non-example): Unlike the relative site, objects need not receive a map from a fixed base prism: for O_K the Breuil–Kisin prism depends on a choice of uniformiser, while the absolute site does not.

-/

/-! ### Node `PrismaticCohomology:PR.8/cech-alexander-log` (construction): Čech–Alexander complexes for log prismatic cohomology

Let X = Spf(R) be affine with an integral chart P over M_A that is integral and weakly finitely generated over M_A. Choose a surjection M_B = M_A ⊕ N^T → P and a surjection B_0 := A⟨(X_s)_{s∈S}, N^T⟩ → R compatible with it, and let B := (A{(X_s)}_δ{N^T}_δlog)^∧_(p,I) be the free δ_log-ring. Let (B_0^•, M_B^•) ↪ (B^•, M_B^•) be the (p, I)-completed Čech nerves over (A, M_A) and J^• := ker(B_0^• → R). Applying the flatness theorem for envelopes levelwise gives a cosimplicial prelog prism (C^•, IC^•, M_C^•) with exact surjections onto (C^•/IC^•, P), each C^n (p, I)-completely flat over A; its associated cosimplicial object is the Čech nerve of (C^0, IC^0, M_C^0)^a, which covers the final object of the topos. Hence Δ_{(R,P)/(A,M_A)} is computed by the cosimplicial δ-A-algebra C^•, compatibly with base change in (A, I, M_A). Taking P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩ gives a strictly functorial complex C^•((R, P)/(A, M_A), O_Δ). This latter choice does not itself commute with arbitrary base changes (K1 Remark 4.8); its totalisation computes the same cohomology.

* Untyped API `LogPrismaticSite.cechAlexander` (constructor): The cosimplicial δ-A-algebra C^• attached to a choice of surjections (B_0, M_B) → (R, P).

* Untyped API `LogPrismaticSite.cechAlexander_flat` (other): Each C^n is (p, I)-completely flat over A.

* Untyped API `LogPrismaticSite.cechAlexander_computes` (characterisation): Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)} compatibly with Frobenius.

* Untyped API `LogPrismaticSite.cechAlexander_baseChange` (functoriality): For a chosen free presentation, C^• commutes with completed base change along maps of bounded prelog prisms when the same presentation is base changed. This does not assert base change of the strictly functorial presentation indexed by all elements of R and P (K1 Remark 4.8).

* Untyped API `LogPrismaticSite.cechAlexanderFunctorial` (constructor): The strictly functorial complex for P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩.

* Untyped API `LogPrismaticSite.cechAlexander_independent` (extensionality): Two choices of surjections give canonically quasi-isomorphic totalisations.

* Untyped Unit test `LogPrismaticSite.cechAlexander_affineLine` (computation): For (A/I⟨X_0⟩, M_A ⊕ X_0^N) with B_0 = A⟨X_0⟩, C^n is the completion of A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ (K1 §5.4).

* Untyped Unit test `LogPrismaticSite.cechAlexander_trivial` (degenerate): For R = A/I and P = M_A, the constant cosimplicial algebra A computes Δ = A.

* Untyped Unit test `LogPrismaticSite.cechAlexander_trivialLog` (compatibility): With trivial log structures, C^• is BS22's Čech–Alexander complex (PR.1).

* Untyped Unit test `LogPrismaticSite.cechAlexander_needs_exactification` (non-example): Using the non-exactified δ-pair (B^1, (I, X_1 − X_0)) for the log affine line gives the non-log Čech nerve, whose cohomology has H^1(Δ̄) ≅ R·dX rather than R·dlog X.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-weak-base-change` (lemma): Affine base change for log prismatic cohomology

Let (R, P) be as in the Čech–Alexander construction and (A, I, M_A) → (A′, IA′, M_{A′}) a map of bounded prelog prisms with M_{A′} integral and A → A′ of finite (p, I)-complete Tor amplitude. With (R′, P′) the p-completed base change of (R, P) as a prelog ring, the natural map Δ_{(R,P)/(A,M_A)} ⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})} is an isomorphism, and similarly for Δ̄.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-etale-localization` (lemma): Strict étale localisation

Let (A, I, M_A) be a bounded prelog prism with M_A integral, (R, P) a p-completely smooth prelog ring over (A/I, M_A), and R → S a p-completely étale map with the pulled-back chart P. Then Δ̄_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ̄_{(S,P)/(A,M_A)} is an isomorphism. Consequently the reduced log prismatic complex Δ̄ is a quasi-coherent derived p-complete complex on strict-étale localisations. This R-linear statement concerns Δ̄, not the unreduced Δ, which is naturally an A-complex.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/smooth-chart-covers` (theorem): Envelopes of smooth charts cover the final object

Work with the flat topology. Let (R, P) be p-completely smooth over (A/I, M_A) with M_A → P a smooth chart, and (B, IB, M_B) a prelog prism over (A, I, M_A) that is (p, I)-completely smooth over (A, M_A) with M_A → M_B a smooth chart, together with a surjection (B, M_B) → (R, P); let (B′, IB′, M_{B′}) be its prelog prismatic envelope. Then for every object (C, IC, M_C)^a of ((R, P)/(A, M_A))_Δ the product of (B′, IB′, M_{B′})^a and (C, IC, M_C)^a exists and is (p, I)-completely faithfully flat over C; in particular (B′, IB′, M_{B′})^a covers the final object. If (A, M_A) has rank 1, a smooth lift (R̃, P̃) of (R, P) over (A, M_A) with its rank-1 δ_log-structure gives such a covering. In the absolute setting, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object of the topos of (O_K, O_K∖{0})_Δ.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-hodge-tate-map` (construction): The log Hodge–Tate comparison map

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). The structure map η^0: O_X → H^0(Δ̄_{(X,M_X)/(A,M_A)}) extends to η^1: Ω^1_{(X,M_X)/(A/I,M_A)} → H^1(Δ̄){1}: locally, for X = Spf(R) with chart P and an object (B, IB, M_B)^a with exact surjection M_B → P, compose RΓ(L_{(R,P)/(A,M_A)}) → RΓ(L_{(B/IB,P)/(B,M_B)}) ≅ RΓ(L_{(B/IB,M_B)/(B,M_B)}) ≅ IB/I^2B[1] ≅ I/I^2 ⊗^L_{A/I} B/IB[1], take derived global sections over the site and H^0. For every local section m of M_X^gp, η^1(dlog m)^2 = 0 and β_I(η^1(dlog m)) = 0, where β_I is the Bockstein differential on H^*(Δ̄){*}. Since Ω^1_log has local bases of the form dlog m, η^1 extends uniquely to a map of commutative differential graded A/I-algebras η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → (H^*(Δ̄){*}, β_I), compatible with the O_X-module structures; its composite with the canonical map Ω^1_{R/(A/I)} → Ω^1_log agrees with the non-log Hodge–Tate map followed by the forgetful comparison map.

* Untyped API `LogPrismaticSite.hodgeTateMap` (constructor): η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} as a map of cdgas with the Bockstein differential.

* Untyped API `LogPrismaticSite.hodgeTateMap_dlog_sq` (simp): η^1(dlog m)^2 = 0 for m ∈ M_X^gp.

* Untyped API `LogPrismaticSite.hodgeTateMap_bockstein_dlog` (simp): β_I(η^1(dlog m)) = 0.

* Untyped API `LogPrismaticSite.hodgeTateMap_restrict_nonlog` (compatibility): The square comparing the non-log and log Hodge–Tate maps commutes along the canonical map Ω^1_{X/(A/I)} → Ω^1_log and the map induced by forgetting logs. The differential map is not asserted to be injective.

* Untyped API `LogPrismaticSite.hodgeTateMap_cotangent` (characterisation): Locally, η^1 is H^0 of the map RΓ(L_{(R,P)/(A,M_A)}) → Δ̄{1}[1] built from Gabber's log cotangent complex.

* Untyped API `LogPrismaticSite.hodgeTateMap_natural` (functoriality): η^* is natural in (X, M_X) and in maps of bounded prelog prisms.

* Untyped Unit test `LogPrismaticSite.hodgeTateMap_affineLine` (computation): For (A/I⟨X_0⟩, M_A ⊕ X_0^N), η^1(dlog X_0) corresponds to the class of (X_1/X_0 − 1)/d ⊗ d in H^1 of the Čech–Alexander complex, for an orientation d.

* Untyped Unit test `LogPrismaticSite.hodgeTateMap_degree0` (degenerate): η^0: O_X → H^0(Δ̄) is the structure map, independent of the log structures.

* Untyped Unit test `LogPrismaticSite.hodgeTateMap_trivialLog` (compatibility): With trivial log structures η^* equals PR.1's Hodge–Tate comparison map.

* Untyped Unit test `LogPrismaticSite.hodgeTateMap_dlog_not_dx` (non-example): η^1(dlog X_0) is not η^1(dX_0): they differ by the factor X_0, which is not a unit on A/I⟨X_0⟩.

-/

/-! ### Node `PrismaticCohomology:PR.8/hodge-tate-group-lemma` (lemma): Hodge–Tate cohomology of group-ring Čech nerves

Let (A, I) be a bounded prism and G′ → G a surjection of finitely generated abelian groups without p-torsion, with kernel H; R := A/I⟨G⟩ and A⟨G′⟩ → R. Let B^• be the Čech nerve of the prismatic envelope B^0 in (R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′), and C^• := A⟨H ⊕ H_n⟩{(I, (h − 1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I, so that B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•. Then the map ∧^i(A/I ⊗_Z G) → H^i(Tot(C^•)){i} induced by g ↦ (g̃ − 1)/d ⊗ d (for a lift g̃ ∈ G′ and an orientation d) is an isomorphism of A/I-modules for every i.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/hodge-tate-log-affine-line` (lemma): Hodge–Tate comparison for the log affine line

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N). Then η^*: Ω^*_{(R,P)/(A/I,M_A)} → H^*(Δ̄_{(R,P)/(A,M_A)}){*} is an isomorphism; explicitly H^1(Δ̄){1} ≅ R ⊗_Z X_0^Z with 1 ⊗ X_0 ↦ dlog X_0.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-hodge-tate-comparison` (theorem): The log Hodge–Tate comparison

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme smooth over (A/I, M_A) in Koshikawa's sense. Then η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} is an isomorphism of differential graded A/I-algebras (sheaves on X_ét); in particular Δ̄_{(X,M_X)/(A,M_A)} is a perfect complex. Moreover RΓ(Spf(R)_ét, L_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1] locally.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-base-change` (theorem): Completed base change for log prismatic cohomology

Let (A, I, M_A) → (A′, IA′, M_{A′}) be a map of bounded prelog prisms with integral monoids, (X, M_X) smooth over (A/I, M_A) with qcqs underlying formal scheme, and X′ := X ×_{(Spf A/I, M_A)^a} (Spf A′/IA′, M_{A′})^a (an integral log formal scheme, smooth over the new base). Then RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′})), and the same holds for the sheaves Δ.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-crystalline-site` (definition): The δ_log-crystalline site

Let (A, (p), M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme over (A, M_A). A δ_log-PD triple over (A, M_A) is (B, J, M_B)^a where (B, (p), M_B) is a bounded prelog prism over (A, (p), M_A) with integral log structure and J ⊂ B is a p-completed PD ideal with B/J classically p-complete. The (big) δ_log-crystalline site ((X, M_X)/(A, M_A))_δCRYS is the opposite of the category of δ_log-PD triples with a map f: Spf(B/J) → X over A and an exact closed immersion (Spf(B/J), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A), with the étale topology and structure sheaf O_δCRYS: (B, J, M_B)^a ↦ B. Dropping δ and δ_log gives a version ((X, M_X)/(A, M_A))_CRYS of the big log crystalline site with étale topology; forgetting is a cocontinuous functor inducing u_X^δ: Shv(δCRYS) → Shv(X_ét) and a canonical map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

* Untyped API `DeltaLogCrystallineSite` (constructor): The site ((X, M_X)/(A, M_A))_δCRYS with étale topology.

* Untyped API `DeltaLogCrystallineSite.structureSheaf` (data): O_δCRYS: (B, J, M_B)^a ↦ B.

* Untyped API `DeltaLogCrystallineSite.toBigLogCrystalline` (functoriality): The cocontinuous forgetful functor to the big log crystalline site ((X, M_X)/(A, M_A))_CRYS and the map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

* Untyped API `DeltaLogCrystallineSite.pd_compatible` (relation): For a PD ideal I of A, the divided powers of I and J are compatible on every object.

* Untyped API `DeltaLogCrystallineSite.toEtale` (projection): The morphism of topoi u^δ_X to X_ét.

* Untyped Unit test `DeltaLogCrystallineSite.point` (degenerate): For X = Spf(A/p) with log structure M_A, the triple (A, (p), M_A)^a is final and RΓ_δCRYS = A.

* Untyped Unit test `DeltaLogCrystallineSite.trivialLog_compat` (compatibility): With trivial log structures, the cohomology agrees with crystalline cohomology for smooth X (BS22 Theorem 5.2's δ-crystalline site).

* Untyped Unit test `DeltaLogCrystallineSite.not_all_pd_thickenings` (non-example): A PD thickening (B, J) with B having p-torsion is not an object: objects are bounded prelog prisms with I = (p), so B is p-torsion free.

* Untyped Unit test `DeltaLogCrystallineSite.affineLine` (computation): For (A/p⟨X⟩, M_A ⊕ N), the rank-one triple (A⟨X⟩, (p), M_A ⊕ N)^a is an object, but it is not asserted weakly final: an arbitrary target log generator can have nonzero δ_log. A weakly final object for the Čech computation is obtained from the free δ_log ring and its log PD envelope (K1 Construction 6.6).

-/

/-! ### Node `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline` (theorem): δ_log-crystalline cohomology is log crystalline cohomology

Let I ⊂ A be a p-completed PD ideal with A/I classically p-complete and (X, M_X) smooth over (A/I, M_A). Then the natural map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS is an isomorphism of E_∞-A-algebras on X_ét. Moreover, for every m ≥ 1 reduction mod p^m identifies Ru_{X*}O_CRYS ⊗^L A/p^m with Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)} (small log crystalline site), and passing to the limit Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS. When I ∋ p and the chart M_A → P is integral and weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a p-completely smooth δ_log-ring of topologically finite presentation, and also the log de Rham complex with coefficients in that envelope, compute these cohomologies.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/cartier-type-cosimplicial-frobenius` (lemma): Cosimplicial relative Frobenius for Cartier-type monoid maps

Let k be a ring with a prelog structure M → k, M → Q an injective integral map of integral monoids with G := Q^gp/M^gp, and Q^(1) the base change of M → Q along the p-th power map of M, with relative Frobenius Q^(1) → Q. Consider the cosimplicial k-algebras A^• = k ⊗_{Z[M]} Z[Q ⊕ G^•], A^{•(1)} and B^• (the Čech-type nerves of K1 Appendix B). If Q^(1) → Q is exact and injective (M → Q of Cartier type), the projection pr^•: A^• → B^• (killing q ∉ Q^(1)) is homotopic to the identity as a map of cosimplicial A^{•(1)}-modules, so B^• ⊗_{A^{•(1)}} M^• → A^• ⊗_{A^{•(1)}} M^• is a homotopy equivalence for every cosimplicial A^{•(1)}-module M^•. If moreover G is free abelian, M^• → A^• ⊗_{A^{•(1)}} M^• is a quasi-isomorphism on associated cochain complexes of k-modules.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/crystalline-comparison-map` (construction): The log crystalline comparison map

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log ring, I ⊂ A a PD ideal containing p, and ψ: (A/I, M_A) → (φ_*A/p, φ_*M_A) the factorisation of Frobenius. For (X, M_X) over A/I let (X^(1), M_X^(1)) be its base change along ψ. There is a cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M_X^(1))/(φ_*A, φ_*M_A))_Δ sending (B, J, M_B)^a (with (B, M_B) a log ring) to (φ_*B, (p), M_B^(1))^a, where M_B^(1) = M_B ⊔_{M_A, φ_{M_A}} φ_*M_A with M_B^(1) → φ_*M_B induced by φ_{M_B}, and Spf(φ_*B/p) → X^(1) induced by ψ_B: B/J → φ_*B/p. It induces a morphism of ringed topoi (Shv(δCRYS), φ_*O_δCRYS) → (Shv(log prismatic site of X^(1)), O_Δ) and hence the crystalline comparison map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS of E_∞-φ_*A-algebras on X_ét, compatible with Frobenius.

* Untyped API `LogPrismaticSite.crystallineFunctor` (constructor): The cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ.

* Untyped API `LogPrismaticSite.crystallineFunctor_cocontinuous` (other): The functor is cocontinuous for the étale topologies.

* Untyped API `LogPrismaticSite.crystallineComparisonMap` (constructor): The induced map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS of E_∞-algebras.

* Untyped API `LogPrismaticSite.crystallineComparisonMap_frobenius` (compatibility): The comparison map is compatible with the Frobenius endomorphisms.

* Untyped API `LogPrismaticSite.crystallineComparisonMap_natural` (functoriality): Natural in (X, M_X) and in the base.

* Untyped Unit test `LogPrismaticSite.crystallineComparisonMap_point` (degenerate): For X = Spf(A/I) with log structure M_A, the comparison map is the identity of φ_*A.

* Untyped Unit test `LogPrismaticSite.crystallineComparisonMap_trivialLog` (compatibility): With trivial log structures it equals the map of PR.1's crystalline comparison (BS22 Theorem 5.2).

* Untyped Unit test `LogPrismaticSite.crystallineFunctor_logPoint` (computation): For the log point (k, N → 0) over (W(k), (p), N → 0), the functor sends the object (W(k), (p), N) to (φ_*W(k), (p), N^(1)) with N^(1) = N ⊔_{N, ·p} N.

* Untyped Unit test `LogPrismaticSite.crystallineFunctor_untwisted_fails` (non-example): Without the Frobenius twist (sending (B, J, M_B) to (B, (p), M_B)) one does not get an object over X: Spf(B/p) need not map to X since only B/J does.

-/

/-! ### Node `PrismaticCohomology:PR.8/local-crystalline-comparison` (theorem): Local log crystalline comparison

In the setting of the comparison map, let (R, P) be a smooth prelog ring over (A/I, M_A) with P integral, M_A → P integral, (weakly) finitely generated and of Cartier type (M_A/M_A^× → P/P^× integral with exact relative Frobenius P^(1) → P), and assume (R, P) admits an exact surjection from a smooth lift (R̃, P̃) over (A/p, M_A). Then there is a canonical isomorphism Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A)) of E_∞-φ_*A-algebras compatible with Frobenius; by base change the left side is the p-completed base change of Δ_{(R̃,P̃)/(A,M_A)} along φ.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-crystalline-comparison` (theorem): The log crystalline comparison

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log ring, I a PD ideal of A containing p, and (X, M_X) a smooth log scheme over (A/I, M_A) of Cartier type (Kato 4.8). Then the crystalline comparison map is an isomorphism of E_∞-φ_*A-algebras on X_ét: Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys. Globally, for I = (p) and X qcqs of Cartier type over (A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A, φ-equivariantly, as E_∞-A-algebras.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-q-pd-triple` (definition): Log q-PD triples and log q-PD envelopes

Let A = Z_p[[q − 1]] with δ(q) = 0 and [p]_q = (q^p − 1)/(q − 1). A q-PD pair is a (p, [p]_q)-complete δ-pair (D, I) over (A, (q − 1)) such that (D, ([p]_q)) is a bounded prism over (A, ([p]_q)), φ(I) ⊂ [p]_q D and γ(I) ⊂ I where γ(x) = φ(x)/[p]_q − δ(x), D/(q − 1) is p-torsion free with finite (p, [p]_q)-complete Tor amplitude over D, and D/I is classically p-complete. A prelog q-PD triple is (D, I, M_D) with (D, I) a q-PD pair and (D, I, M_D) a δ_log-triple; a log q-PD triple is (D, I, M_{Spf(D)}) arising as (D, [p]_q, M_D)^a. Étale maps lift uniquely (Lemma 7.3). For a prelog q-PD triple (D_1, I_1, M_{D_1}) with integral monoid, a p-completely smooth (R, P) over (D_1/I_1, M_{D_1}) with M_{D_1} → P integral and weakly finitely generated admitting a smooth lift, and a surjection (D_2, M_{D_2}) → (R, P) as in Lemma 7.4, there is a universal map to a prelog q-PD triple (D_3, I_3, M_{D_3}) with an exact surjection M_{D_3} → P and D_2/I_2 ≅ D_3/I_3; D_3 is (p, [p]_q)-completely flat over D_1, the construction commutes with completed base change, and D_3 ⊗̂ D_1/(q − 1) is the p-completed log PD envelope. This is the log q-PD envelope.

* Untyped API `LogQPDTriple` (constructor): A prelog q-PD triple (D, I, M_D) over Z_p[[q − 1]].

* Untyped API `LogQPDTriple.gamma_mem` (relation): For x ∈ I, γ(x) = φ(x)/[p]_q − δ(x) ∈ I.

* Untyped API `LogQPDTriple.etaleLift` (characterisation): A p-completely étale D/I → Ē lifts uniquely to a prelog q-PD triple (E, J, M_D) over (D, I, M_D) (Lemma 7.3).

* Untyped API `LogQPDTriple.envelope` (constructor): The log q-PD envelope (D_3, I_3, M_{D_3}) of Lemma 7.4.

* Untyped API `LogQPDTriple.envelope_flat` (other): D_3 is (p, [p]_q)-completely flat over D_1.

* Untyped API `LogQPDTriple.envelope_mod_q_sub_one` (compatibility): D_3 ⊗̂_{D_1} D_1/(q − 1) is the p-completed log PD envelope of I_2/(q − 1) (CR.5).

* Untyped Unit test `LogQPDTriple.ainf_example` (computation): (A_inf(O_C), (ξ), O_C♭∖{0}) with q = [ε] is a prelog q-PD triple and ξ = φ^{-1}([p]_q).

* Untyped Unit test `LogQPDTriple.q_eq_one` (compatibility): At q = 1 a prelog q-PD triple is the same as a pre-δ_log-PD triple (D p-torsion free and p-complete, D/I classically p-complete, I with divided powers).

* Untyped Unit test `LogQPDTriple.trivial_envelope` (degenerate): For (R, P) = (D_1/I_1, M_{D_1}) and the identity surjection, the envelope is (D_1, I_1, M_{D_1}).

* Untyped Unit test `LogQPDTriple.not_q_minus_one_ideal` (non-example): (Z_p[[q − 1]], (q − 1)) is a q-PD pair but ([p]_q) cannot be replaced by (q − 1) as the prism ideal: (Z_p[[q − 1]], (q − 1)) is not a prism.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-q-crystalline-site` (definition): The log q-crystalline site

Fix a prelog q-PD triple (D, I, M_D) with M_D integral and (X, M_X) smooth over (D/I, M_D). The log q-crystalline site ((X, M_X)/(D, M_D))_qCRYS is the opposite of the category of log q-PD triples (E, J, M_{Spf(E)}) from prelog q-PD triples (E, J, M_E) over (D, I, M_D) with M_E integral, with f: Spf(E/J) → X over D/I and an exact closed immersion (Spf(E/J), f^*M_X) ↪ (Spf(E), M_{Spf(E)}) over (D, M_D); étale topology; structure sheaf O_qCRYS: E ↦ E. Write RΓ_qCRYS((X, M_X)/(D, M_D)), a (p, [p]_q)-complete E_∞-D-algebra with φ_D-semilinear endomorphism, and qΩ_{(X,M_X)/(D,M_D)} := Ru^q_{X*}O_qCRYS on X_ét. For affine X with a smooth lift and integral weakly finitely generated chart, the Čech nerve of the log q-PD envelope of a free surjection computes it (Construction 7.8), strictly functorially for (E_0, M_E) = (D⟨N^R, N^P⟩, M_D ⊕ N^P). At q = 1 it is the δ_log-crystalline site.

* Untyped API `LogQCrystallineSite` (constructor): The site ((X, M_X)/(D, M_D))_qCRYS.

* Untyped API `LogQCrystallineSite.qOmega` (constructor): qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS, an E_∞-D-algebra on X_ét with φ_D-semilinear Frobenius.

* Untyped API `LogQCrystallineSite.cech` (characterisation): For affine X with chart and smooth lift, the Čech nerve of a log q-PD envelope computes qΩ (Construction 7.8, Remark 7.9).

* Untyped API `LogQCrystallineSite.ofDeltaLogCrystalline` (functoriality): The functor from ((X, M_X)/(D/(q − 1), M_D))_δCRYS and the induced map qΩ ⊗̂^L D/(q − 1) → Ru^δ_{X*}O_δCRYS.

* Untyped API `LogQCrystallineSite.strict_change` (other): For a strict map (D, I, M_D) → (D, I′, M_D), qΩ_{(X,M_X)/(D,M_D)} ≅ qΩ_{(X,M_X)_{D/I′}/(D,M_D)} (Lemma 7.12).

* Untyped Unit test `LogQCrystallineSite.point` (degenerate): For X = Spf(D/I) with log structure M_D, qΩ = D.

* Untyped Unit test `LogQCrystallineSite.q_eq_one` (compatibility): If q = 1 in D the site is the δ_log-crystalline site.

* Untyped Unit test `LogQCrystallineSite.affineLine_complex` (computation): For (D/I⟨X⟩, M_D ⊕ N) with D flat over A, qΩ is computed by the two-term complex D⟨X⟩ → D⟨X⟩·dlog X, f ↦ (γ(f) − f)/(q − 1)·dlog X with γ(X) = qX (Construction 7.15 with S a point).

* Untyped Unit test `LogQCrystallineSite.not_prismatic` (non-example): The log q-crystalline site is not the log prismatic site over (D, ([p]_q)): its objects carry a q-PD ideal J containing the image of the base q-PD ideal I, with γ(J) ⊂ J and φ(J) ⊂ [p]_qE. J need not contain [p]_q (for example J = (ξ) in A_inf). The comparison of Theorem 7.13 uses a Frobenius twist.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-q-crystalline-vs-crystalline` (theorem): Log q-crystalline cohomology modulo q − 1

The canonical map induces an isomorphism qΩ_{(X,M_X)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^δ_{X*}O_δCRYS; hence qΩ_{(R,P)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^crys_*O_{(X,M_X)/(D/(q−1),M_D)} computed on the small log crystalline site.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-q-crystalline-vs-prismatic` (theorem): Log q-crystalline versus log prismatic cohomology

Let (D, I, M_D) be a prelog q-PD triple of rank 1 or with (D, M_D) a log ring, ψ_D: (D/I, M_D) → (φ_*D/[p]_q, φ_*M_D) induced by Frobenius, and (X^(1), M_X^(1)) the base change of (X, M_X) along ψ_D. If the mod p fibre of (X, M_X) is of Cartier type over (D/(p, I), M_D), there is a canonical isomorphism Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)} of E_∞-φ_*D-algebras on X_ét, relative to the log prism (φ_*D, ([p]_q), φ_*M_D). By base change the left side is the (p, [p]_q)-completed base change along φ_D of Δ_{(X̃,M̃)/(D,M_D)} for a lift.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-q-de-rham-complex` (construction): Log q-de Rham complexes

Assume D flat over A = Z_p[[q − 1]] and work locally with X = Spf(R) admitting a smooth lift and an integral weakly finitely generated chart M_D → P. For S a set and N ⊂ M_D^gp ⊕ Z^S a submonoid containing M_D, let E_N be the (p, [p]_q)-completion of D ⊗_{Z_(p)[M_D]} Z_(p)[N] with its δ_log-structure (Proposition 2.16). For s ∈ S, γ_s: X_s ↦ qX_s, X_t ↦ X_t (t ≠ s) is an automorphism and ∇^log_{q,s}(f) := (γ_s(f) − f)/(q − 1); ∇_q(f) := Σ_s ∇^log_{q,s}(f)·dlog X_s defines the (p, [p]_q)-completed Koszul complex qΩ^*_{(E_N,N)/(D,M_D)}, functorial in (S, N). For a surjection (E_N, N) → (R, P) with exactification (E_{N′}, N′) and log q-PD envelope (F, M_F), ∇^log_q extends to F giving qΩ^*_{(F,M_F)/(D,M_D)}: F → F ⊗̂_E Ω^1_{(E,M_E)/(D,M_D)} → ⋯, whose reduction mod q − 1 is the de Rham complex of the p-completed log PD envelope. Theorem: qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)}, functorially in surjections. On qΩ^* the Frobenius sends dlog X_s ↦ [p]_q dlog X_s, so the linearised Frobenius factors through η_{[p]_q}; if the mod p fibre is of Cartier type and R is topologically of finite presentation, qΩ_{(R,P)/(D,M_D)} ∈ D^{[0,r]}(D) (r the rank of Ω^1_log) and the linearised Frobenius induces φ_D^*qΩ ≅ Lη_{[p]_q}qΩ.

* Untyped API `LogQDeRham.gamma` (data): The automorphism γ_s: X_s ↦ qX_s of (E_N, N)^a.

* Untyped API `LogQDeRham.qNabla` (data): ∇^log_{q,s}(f) = (γ_s(f) − f)/(q − 1) and ∇_q = Σ_s ∇^log_{q,s} dlog X_s.

* Untyped API `LogQDeRham.complex` (constructor): The log q-de Rham complex qΩ^*_{(E_N,N)/(D,M_D)} and its extension qΩ^*_{(F,M_F)/(D,M_D)} to log q-PD envelopes.

* Untyped API `LogQDeRham.computes` (characterisation): qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)} functorially in surjections (Theorem 7.17).

* Untyped API `LogQDeRham.mod_q_sub_one` (compatibility): Modulo q − 1, qΩ^* is the log de Rham complex of the p-completed log PD envelope.

* Untyped API `LogQDeRham.frobenius_dlog` (simp): Frobenius sends dlog X_s to [p]_q·dlog X_s.

* Untyped API `LogQDeRham.frobenius_l_eta` (relation): Under Cartier type, φ_D^*qΩ ≅ Lη_{[p]_q}qΩ, so Frobenius has an inverse up to [p]_q^r.

* Untyped Unit test `LogQDeRham.affineLine_monomial` (computation): On D⟨X⟩ with N = X^N, ∇^log_q(X^n) = [n]_q·X^n (since γ(X^n) = q^n X^n).

* Untyped Unit test `LogQDeRham.empty` (degenerate): For S = ∅ the complex is E_N in degree 0.

* Untyped Unit test `LogQDeRham.q_one_limit` (compatibility): Setting q = 1, ∇^log_{q,s} becomes the log derivation X_s ∂/∂X_s of the log de Rham complex.

* Untyped Unit test `LogQDeRham.not_nonlog_derivative` (non-example): The log q-derivative is not the q-derivative of BS22 §16: on X^n it gives [n]_q X^n rather than [n]_q X^{n−1}, i.e. it uses (γ − 1)/(q − 1), not (γ − 1)/((q − 1)X).

-/

/-! ### Node `PrismaticCohomology:PR.8/semistable-aomega-comparison` (theorem): Comparison with semistable AΩ

Let k be algebraically closed of characteristic p, C the completed algebraic closure of W(k)[1/p], and X a p-adic formal scheme over O_C that is étale locally étale over O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) for a non-unit π ∈ O_C, with its canonical log structure M_X (Česnavičius–Koshikawa 1.6). Then there is an isomorphism qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X in D(X_ét, A_inf) compatible with Frobenius, where the left side is formed over the prelog q-PD triple (A_inf, (ξ), O_C♭∖{0}) and the right side is ČK's semistable A_inf-cohomology. Since the mod p fibre is of Cartier type, qΩ is the (p, μ)-completed base change of Δ_{(X,M_X)/(A_inf,O_C♭∖{0})} along φ_{A_inf}; hence (φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf, O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/semistable-crys-bdr-diagram` (theorem): The semistable C_st comparison diagram

Let X be as in the semistable AΩ comparison and proper over O_C. The intended commutative comparison diagram has left column RΓ_logcrys((X,M_X)/(A_crys,O_C♭∖{0})) ≅ RΓ_qCRYS((X,M_X)/(A_inf,O_C♭∖{0})) ⊗^L_{A_inf} A_crys ≅ RΓ(X_ét,AΩ_X) ⊗^L_{A_inf} A_crys. The right column starts with RΓ_crys(X_C^ad/B_dR^+) → RΓ_ét(X_C^ad,Z_p) ⊗^L_{Z_p} B_dR^+, the period comparison map of ČK19 Proposition 6.8, followed by the usual isomorphism with RΓ_ét(X_C^ad,A_inf,X_C^ad) ⊗^L_{A_inf} B_dR^+. The first right-column map is not asserted an isomorphism over B_dR^+; it becomes one over B_dR. Horizontals are the ČK19 §6.8 maps transported via Theorem 8.1 and Remark 8.4. K1 Theorem 8.5 contains diagram misprints; this node specifies the corrected intended diagram, not the erroneous isomorphism as printed.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/breuil-kisin-log-cohomology` (construction): Breuil–Kisin cohomology of semistable formal schemes

Let K be a totally ramified finite extension of W(k)[1/p] with uniformiser π and X a qcqs semistable formal scheme over O_K with canonical log structure M_X. Define RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)) over the Breuil–Kisin prelog prism. Then (A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧_(p,ξ) ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})), which together with the semistable AΩ comparison is a Breuil–Kisin descent of the A_inf-cohomology of X_{O_C}; if X is proper, RΓ_BK(X) is perfect and the base change holds without completion. Its Frobenius is φ-semilinear over u ↦ u^p, and over (W(k)[[u]], N) the Frobenius is an isogeny when the mod p fibre is of Cartier type.

* Untyped API `BreuilKisinLogCohomology` (constructor): RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)).

* Untyped API `BreuilKisinLogCohomology.toAinf` (compatibility): (A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})).

* Untyped API `BreuilKisinLogCohomology.perfect` (other): For X proper, RΓ_BK(X) is a perfect W(k)[[u]]-complex.

* Untyped API `BreuilKisinLogCohomology.toHyodoKato` (compatibility): Base change along u ↦ 0 and Frobenius twist gives RΓ_crys((X_k, M)/(W(k), N)) (log-crystalline-comparison).

* Untyped API `BreuilKisinLogCohomology.frobenius` (structure): The φ-semilinear Frobenius over u ↦ u^p.

* Untyped Unit test `BreuilKisinLogCohomology.point` (degenerate): For X = Spf(O_K) with M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]].

* Untyped Unit test `BreuilKisinLogCohomology.goodReduction` (compatibility): If X is smooth over O_K (no boundary), M_X is pulled back from O_K∖{0}, and RΓ_BK(X) agrees with the non-log prismatic cohomology of X over the Breuil–Kisin prism (PR.1), as the strict case of derived-log-properties (1).

* Untyped Unit test `BreuilKisinLogCohomology.curve_H0` (computation): For a proper semistable curve with geometrically connected generic fibre, H^0(RΓ_BK(X)) = W(k)[[u]].

* Untyped Unit test `BreuilKisinLogCohomology.not_trivialLog` (non-example): Using the trivial log structure on a semistable X (not smooth over O_K) does not give a perfect complex with Hodge–Tate graded pieces Ω^i_log; the log structure is essential.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-quasisyntomic-site` (definition): The log quasisyntomic site

Import DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites and expose its notions to log prismatic consumers under the API names below; no second site or QRSP definition is constructed in PR.8. A map of pre-log rings A → B is p-completely homologically log flat (resp. faithfully flat) if B ⊗^L_A A/p ≅ B/p is discrete and (A/p, M_A) → (B/p, M_B) is homologically log flat (resp. homologically log faithfully flat) in the sense supplied by DD.6 (B′ ⊕^L_A B ≅ B′ ⊕_A B for all A → B′, plus faithful flatness of rings). A pre-log ring (A, M_A) is quasisyntomic if A is p-complete with bounded p^∞-torsion and the Gabber log cotangent complex L_{(A,M_A)/Z_p} has p-complete Tor amplitude in [−1, 0]. A map A → B of p-complete pre-log rings with bounded p^∞-torsion is quasisyntomic (resp. a quasisyntomic cover) if it is p-completely homologically log flat (resp. faithfully flat) and L_{B/A} ⊗^L_B B/p has Tor amplitude in [−1, 0]. QSyn^prelog is the category of quasisyntomic pre-log rings; its opposite is a site with quasisyntomic covers. For (R, M) p-complete with bounded p^∞-torsion, qSyn_{(R,M)} is the small site of quasisyntomic maps (R, M) → (S, N); for perfectoid quasisyntomic (R, M), QSyn_{(R,M)} is the slice. On these sites the p-completion of ∧^i L_{(S,N)/(R,M)}[−i] lies in D^{≥0}(S).

* Untyped API `LogQSyn.IsQuasisyntomic` (other): The quasisyntomic condition on a pre-log ring.

* Untyped API `LogQSyn.IsQuasisyntomicMap` (other): The quasisyntomic condition on a map, with the cover variant.

* Untyped API `LogQSyn.site` (constructor): The site QSyn^{prelog,op} with quasisyntomic covers, and its small variant qSyn_{(R,M)}.

* Untyped API `LogQSyn.of_cover` (characterisation): For a quasisyntomic cover A → B, A is quasisyntomic iff B is.

* Untyped API `LogQSyn.comp` (structure): Quasisyntomic maps compose.

* Untyped API `LogQSyn.pushout` (functoriality): The p-completed pushout of a quasisyntomic map along any map is discrete with bounded p^∞-torsion and quasisyntomic.

* Untyped API `LogQSyn.trivialLog` (compatibility): On pre-log rings with trivial pre-log structure, the notions agree with BMS2's quasisyntomic rings and maps (DD.5).

* Untyped API `LogQSyn.cotangent_coconnective` (other): For (S, N) in qSyn_{(R,M)}, (∧^i L_{(S,N)/(R,M)}[−i])^∧_p ∈ D^{≥0}(S).

* Untyped Unit test `LogQSyn.smoothLog_quasisyntomic` (computation): (Z_p⟨T⟩, T^N) is quasisyntomic: its log cotangent complex is free of rank 1 on dlog T.

* Untyped Unit test `LogQSyn.trivialLog_eq` (compatibility): (R, {e}) is in QSyn^prelog iff R is in BMS2's QSyn.

* Untyped Unit test `LogQSyn.zeroLog_lci` (characterisation): (Z_p, N → Z_p, 1 ↦ 0) is quasisyntomic: L_{(Z_p,N)/Z_p} is concentrated in degrees [−1, 0] (KY Example 2.30).

* Untyped Unit test `LogQSyn.not_nonintegral` (non-example): For k of characteristic p ≠ 2, (k, P) → (k[x, y]/(x^2, xy, y^2), N^2), with P ⊂ N^2 generated by (2,0), (0,2), (1,1) and P∖{0} ↦ 0, is log étale in Kato's sense but not quasisyntomic: its log cotangent complex is unbounded on the left (KY Remark 2.13).

* Untyped Unit test `LogQSyn.empty_degenerate` (degenerate): The identity of a quasisyntomic pre-log ring is a quasisyntomic cover.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-qrsp` (definition): Quasiregular semiperfectoid pre-log rings

Import DerivedDeRhamCohomology:DD.6/log-quasiregular-semiperfectoid and expose its notions to log prismatic consumers under the API names below; no second site or QRSP definition is constructed in PR.8. A p-complete pre-log ring S = (S, M) is semiperfectoid if (1) there is a ring map R → S from a perfectoid ring; (2) S/p is semiperfect; (3) the natural map M♭ → M/M^× is surjective. It is quasiregular semiperfectoid if moreover (4) S is quasisyntomic. QRSPerfd^prelog denotes the category of quasiregular semiperfectoid pre-log rings. Conditions (2)–(3) (log-semiperfect) imply L_{(S,M)/R} ⊗^L S/p ∈ D^{≤−1}(S/p) for any R → S; for S quasiregular semiperfectoid, L̂_{(S,M)/Z_p}[−1] is p-completely flat. Equivalently (when S/p is log-semiperfect, S p-complete with bounded p^∞-torsion), S ∈ QRSPerfd^prelog iff for some (equivalently every) perfectoid R → S, L_{(S,M)/R} ⊗^L S/p has Tor amplitude in degree −1.

* Untyped API `LogQRSP.IsSemiperfectoid` (other): Conditions (1)–(3).

* Untyped API `LogQRSP.IsQRSP` (other): Conditions (1)–(4).

* Untyped API `LogQRSP.cotangent_flat` (other): For S ∈ QRSPerfd^prelog, L̂_{(S,M)/Z_p}[−1] is p-completely flat.

* Untyped API `LogQRSP.iff_cotangent` (characterisation): Lemma 3.16: with S/p log-semiperfect and S p-complete with bounded p^∞-torsion, S is quasiregular semiperfectoid iff the log cotangent complex L_{(S,M)/R} ⊗^L S/p has Tor amplitude in degree −1 for some/any perfectoid R → S (R with trivial prelog structure).

* Untyped API `LogQRSP.perfectoidCover` (constructor): The map (R ⊗̂ W(S♭) ⊗̂ Z_p⟨M♭⟩, M♭) → (S, M) of Remark 3.13.

* Untyped API `LogQRSP.quotient_monoid` (relation): Condition (3) passes to quotient monoids and pushouts (Remark 3.14).

* Untyped Unit test `LogQRSP.perfectoid_divisible` (computation): (O_C⟨T^{1/p^∞}⟩, N[1/p] → T^{N[1/p]}) is quasiregular semiperfectoid.

* Untyped Unit test `LogQRSP.trivialLog` (compatibility): (S, S^×) is in QRSPerfd^prelog iff S is in BMS2's QRSPerfd (PR.2/DD.5).

* Untyped Unit test `LogQRSP.log_line_not` (non-example): (Z_p⟨T⟩, T^N) is quasisyntomic but not semiperfectoid: N♭ = 0 does not surject onto N.

* Untyped Unit test `LogQRSP.zero_ring` (degenerate): The zero pre-log ring is quasiregular semiperfectoid.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-qrsp-basis` (theorem): Quasiregular semiperfectoid pre-log rings form a basis

(1) For maps A → B, A → C in QRSPerfd^prelog with A → B a quasisyntomic cover, the p-completed pushout lies in QRSPerfd^prelog and is a quasisyntomic cover of C; QRSPerfd^{prelog,op} is a site. (2) Every R ∈ QSyn^prelog admits a quasisyntomic cover R → S with S ∈ QRSPerfd^prelog, which can be chosen with p-divisible monoid. (3) For such a cover every term of the Čech nerve lies in QRSPerfd^prelog. (4) Consequently, for every presentable ∞-category C, restriction induces an equivalence Shv_C(QSyn^{prelog,op}) ≅ Shv_C(QRSPerfd^{prelog,op}).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/derived-log-prismatic` (construction): Derived log prismatic cohomology

Fix a bounded prelog prism (A, I, M_A) with M_A integral. On the log-free pre-log rings Σ_{S,T} := (A/I⟨(X_s)_{s∈S}, N^T⟩, M_A ⊕ N^T) (S, T finite) consider Σ_{S,T} ↦ Δ_{Σ_{S,T}/(A,M_A)} := RΓ_Δ(Spf(Σ_{S,T})^a/(A, M_A)), a (p, I)-complete commutative algebra in D(A) with φ_A-semilinear Frobenius. The derived log prismatic cohomology (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is its left Kan extension (animation) to all simplicial (animated) pre-log rings over (A/I, M_A), followed by (p, I)-completion; it depends only on the derived p-completion of (R, P); Δ̄^L := Δ^L ⊗^L_A A/I. For a log p-adic formal scheme (X, M_X) over (A/I, M_A), the étale sheaf Δ^L_{(X,M_X)/(A,M_A)} is the (p, I)-complete étale sheafification of U = Spf(R) ↦ Δ^L_{(R,Γ(U,M_X))/(A,M_A)}; similarly Δ̄^L and the conjugate filtration.

* Untyped API `DerivedLogPrismatic` (constructor): The functor (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} on animated pre-log (A/I, M_A)-algebras, with Frobenius.

* Untyped API `DerivedLogPrismatic.reduced` (constructor): Δ̄^L := Δ^L ⊗^L_A A/I.

* Untyped API `DerivedLogPrismatic.onFree` (characterisation): On Σ_{S,T}, Δ^L agrees with the site-theoretic log prismatic cohomology.

* Untyped API `DerivedLogPrismatic.leftKanExtension` (universal-property): Δ^L preserves sifted colimits and is the unique such extension of its values on log-free algebras (after completion).

* Untyped API `DerivedLogPrismatic.pComplete_invariant` (other): Δ^L depends only on the derived p-completion of (R, P).

* Untyped API `DerivedLogPrismatic.sheaf` (constructor): The étale sheaf Δ^L_{(X,M_X)/(A,M_A)} on a log p-adic formal scheme.

* Untyped API `DerivedLogPrismatic.map` (functoriality): Functoriality in (R, P) and in maps of bounded prelog prisms.

* Untyped Unit test `DerivedLogPrismatic.free_logLine` (computation): For (A/I⟨N⟩, M_A ⊕ N), Δ̄^L has H^0 = A/I⟨X⟩ and H^1{1} free on dlog X.

* Untyped Unit test `DerivedLogPrismatic.base` (degenerate): For (R, P) = (A/I, M_A), Δ^L = A.

* Untyped Unit test `DerivedLogPrismatic.trivialLog` (compatibility): For P = M_A pulled back from the base, Δ^L_{(R,M_A)/(A,M_A)} ≅ BS22's Δ_{R/A} (PR.2).

* Untyped Unit test `DerivedLogPrismatic.zeroLog_not_discrete` (non-example): For (R, P) = (A/I, N → 0) over trivial M_A, Δ̄^L is not concentrated in degree 0: its conjugate filtration has graded pieces ∧^i L_{(A/I,N)/(A/I)}{−i}[−i] and L_{(A/I,N)/(A/I)} lives in degrees [−1, 0] (KY Example 2.30).

-/

/-! ### Node `PrismaticCohomology:PR.8/derived-log-hodge-tate` (theorem): Derived log Hodge–Tate comparison

For a simplicial pre-log ring (R, P) over (A/I, M_A), there is an increasing exhaustive multiplicative filtration Fil_• Δ̄_{(R,P)/(A,M_A)} (the conjugate filtration) by derived p-complete objects with gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p. Globally, gr_i Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i].

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/derived-log-properties` (theorem): Basic properties of derived log prismatic cohomology

Let (A, I, M_A) be a bounded prelog prism with M_A integral. (1) For every derived p-complete simplicial ring R over A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)} (strict pull-back of the base log structure). (2) Δ^L is invariant under passing to the associated log ring: Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(R,P)^a/(A,M_A)}. (3) Base change: for a map of bounded prelog prisms (A, I, M_A) → (A′, IA′, M_{A′}) and (R′, P′) the homotopy base change, Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅ Δ^L_{(R′,P′)/(A′,M_{A′})}. (4) Multiplicativity: for the homotopy cofibre product (R_3, P_3) of (R_1, P_1), (R_2, P_2) over (A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3, compatibly with conjugate filtrations (Day convolution); Δ^L_{−/(A,M_A)} commutes with all colimits. (5) For (A/I, M_A) perfectoid or pseudo-perfectoid, Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/derived-vs-site` (theorem): Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). (1) For every affine U = Spf(R) in X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ). (2) If P → Γ(U, M_X) is a smooth chart, Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U); in particular for X = Spf(R) with smooth chart M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A)) compatibly with Hodge–Tate maps. Hence Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}), Δ̄^L ≅ Rν_*Ō_Δ, and the derived conjugate filtration is the canonical filtration τ_{≤i}Δ̄.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-quasisyntomic-descent` (theorem): Log quasisyntomic descent

Let (A, I, M_A) be a bounded prelog prism with M_A integral. On the small log quasisyntomic site qSyn_{(A/I,M_A)} the presheaf (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is a sheaf (with values in (p, I)-complete objects of D(A)); if (A/I, M_A) is a perfectoid pre-log ring, the same holds on QSyn_{(A/I,M_A)}. The same holds for each step of the conjugate filtration of Δ̄^L.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/initial-log-prism-qrsp` (theorem): Initial log prisms of semiperfectoid pre-log rings

Let S = (S, N) be a semiperfectoid integral pre-log ring and (R, M) → (S, N) a map from a perfectoid integral pre-log ring, surjective on rings and modulo units on monoids. Exactify M♭ → M → N as M♭ → M̃ → N and put A_inf(R, M̃) := A_inf(R) ⊗̂ Z_p⟨M̃⟩ with the bounded rank-1 prelog prism (A_inf(R, M̃), (ξ), M̃). Applying prismatic envelopes to A_inf(R, M̃) → S gives a prelog prism (Δ^init_{S/R}, (ξ), M^init_{S/R} := M̃) with S → Δ^init/ξ and an exact surjection onto (Δ^init/ξ, N)^a, and its perfection Δ^init_{S/R,perf}. (1) For every integral ''log prism'' (A, I, M_A) with S → A/I and an exact surjection (A, M_A) → (A/I, N → A/I)^a there is a unique compatible map (Δ^init_{S/R}, (ξ), M^init) → (A, I, M_A); similarly for the perfections among perfect A (resp. perfect log prisms). (2) If S is quasiregular semiperfectoid, Δ_{S/A_inf(R)} is discrete with a δ-structure, Δ_{S/A_inf(R)} ≅ Δ^init_{S/R}, the latter is bounded and independent of R, giving an initial ''log prism'' (Δ^init_S, (ξ), M^init_S) for the category of exact-surjection diagrams. (3) If S is semiperfectoid, Δ_{S/R,perf} is discrete, a perfect prism, and Δ_{S/A_inf(R),perf} ≅ Δ^init_{S,perf}. (4) If moreover N is semiperfect (N♭ → N surjective), the p-saturation S^{p-sat} is semiperfectoid and Δ_{S/R,perf} ≅ Δ_{S^{p-sat}/R,perf}.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-nygaard-filtration` (construction): The log Nygaard filtration

Let (A, I, M_A) be an integral bounded prelog prism and write Δ^(1)_{(R,P)/(A,M_A)} := Δ_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ_A} A. For a (p, I)-completely flat map of bounded prisms A_0 → A′_0 with ∆^(1)_{R/A_0} (p, I)-completely flat (Assumption 5.3), the Nygaard filtration is Fil^i_N Δ^(1)_{R/A_0} = {x : φ_{R/A_0}(x) ∈ I^iΔ_{R/A_0}} (Definition 5.5). For the log-free algebra (R, P) = (A/I⟨N^S⟩, M_A ⊕ N^S), choose a surjection M_A ⊕ N → M_A ⊕ N^S, exactify it (Construction 5.11) to obtain non-log prismatic cohomologies over the non-perfect base prisms Ã^•_∞ obtained by extracting p-power roots (Construction 5.9), and define Fil^i_N Δ^(1)_{(R,P)/(A,M_A)} as the totalisation of Fil^i_N Δ_{(A/I)^•/Ã^•_∞} ⊗̂^L_{Ã^•_∞,φ} Ã^•_∞ (Definition 5.13), independent of the choice; extend to Σ_{S,T} by Day convolution with BS22's Nygaard filtration. Left Kan extension gives the derived Nygaard filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} on all simplicial pre-log rings, with a filtered Frobenius φ: Fil^•_N Δ^{L,(1)} → I^•Δ^L and maps I ⊗ Fil^{•−1}_N → Fil^•_N; étale sheafification gives the global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} (Constructions 5.25–5.26). It is multiplicative.

* Untyped API `LogNygaard.fil` (constructor): The decreasing multiplicative filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} by (p, I)-complete objects.

* Untyped API `LogNygaard.frobenius` (data): The filtered Frobenius φ: Fil^i_N Δ^{L,(1)} → I^iΔ^L.

* Untyped API `LogNygaard.mulI` (data): The maps I ⊗^L Fil^{i−1}_N → Fil^i_N (Construction 5.21).

* Untyped API `LogNygaard.mul` (structure): Fil^i_N ⊗ Fil^j_N → Fil^{i+j}_N (Remark 5.20).

* Untyped API `LogNygaard.free_eq_bs` (compatibility): For trivial log structures, Fil^•_N is BS22's Nygaard filtration on Δ^(1) (PR.3).

* Untyped API `LogNygaard.flatBaseChange` (functoriality): Formation of Fil^•_N commutes with (p, I)-completely flat base change on A.

* Untyped API `LogNygaard.sheaf` (constructor): The global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} by étale sheafification.

* Untyped API `LogNygaard.independent` (extensionality): On log-free algebras the totalisation is independent of the chosen surjection M_A ⊕ N → M_A ⊕ N^S.

* Untyped Unit test `LogNygaard.fil0` (degenerate): Fil^0_N Δ^{L,(1)} = Δ^{L,(1)}.

* Untyped Unit test `LogNygaard.trivialLog` (compatibility): For (R, P) = (A/I⟨X⟩, M_A) with trivial M_A, Fil^•_N agrees with BS22's Nygaard filtration on Δ^(1)_{R/A}.

* Untyped Unit test `LogNygaard.logLine_gr1` (computation): For (R, P) = (A/I⟨N⟩, M_A ⊕ N), gr^1_N Δ^(1) ≅ τ_{≤1}Δ̄{1}, a two-term object with H^0 ≅ R{1} and H^1 ≅ R·dlog X.

* Untyped Unit test `LogNygaard.naive_fails` (non-example): For KY's toy example over (A_inf, (ξ)) the naive filtration {x : φ(x) ∈ ξ^iΔ} on Δ^(1)_{(S,M)/(A,M_A)} differs from Fil^•_N (KY §5.1).

* Untyped Unit test `LogNygaard.frobenius_fil1` (characterisation): φ(Fil^1_N) ⊂ IΔ and the induced map gr^0_N → Δ̄ is the inclusion of Fil_0 Δ̄ = (derived) R.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-nygaard-graded` (theorem): Graded pieces of the log Nygaard filtration

Let (A, I, M_A) be an integral bounded prelog prism and (R, P) a simplicial pre-log ring over (A/I, M_A). The Frobenius induces an isomorphism gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i Δ̄^L_{(R,P)/(A,M_A)}{i}, where Fil_i is the conjugate filtration. For Σ_{S,T} this reads gr^i_N Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}; globally gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i Δ̄^L_{(X,M_X)}{i}, and for (X, M_X) smooth over (A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅ τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/nygaard-hodge-fiber-sequence` (theorem): The Nygaard–Hodge fibre sequence and Nygaard completeness

For a simplicial pre-log ring (R, P) over (A/I, M_A) there is a functorial fibre sequence I ⊗^L_A Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)} of filtered objects, the second map being the derived de Rham specialisation γ^• (Construction 5.21, Lemma 5.22). Globally on X_ét it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If (X, M_X) is smooth over (A/I, M_A) with mod p fibre of Cartier type, the right term becomes Ω^{≥•}_{(X,M_X)/(A/I,M_A)}; if moreover X is qcqs and Ω^1_log has finite rank D, then for i ≥ 0 and j ≥ D the maps RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1)) are isomorphisms and RΓ(X_ét, Δ^(1)) is complete for the Nygaard filtration.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-l-eta-factorization` (theorem): The Lη_I factorisation of Frobenius

Let (A, I, M_A) be bounded with M_A integral. (1) If (R, P) is p-complete with bounded p^∞-torsion and M_A → P a smooth chart, then gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i} and the Frobenius factors as Δ^L ⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L; if M_A → P is of Cartier type, Δ^{L,(1)} → Lη_IΔ^L is an isomorphism identifying the Nygaard filtration with the truncations of the I-adic filtration for the Beilinson t-structure. (2) For (X, M_X) smooth over (A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U)) is a sheaf on the affine étale site, defining Lη_IΔ_{(X,M_X)/(A,M_A)}; if the mod p fibre is of Cartier type, Frobenius induces an isomorphism of étale sheaves Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)}, and RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A)) for affine U.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-de-rham-comparison` (theorem): The log de Rham comparison

(1) If P → R is a smooth chart of Cartier type over (A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅ Ω̂^•_{(R,P)/(A/I,M_A)} as E_∞-algebras in D(A/I). (2) For every simplicial pre-log ring (R, P) over (A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p-completed derived log de Rham). (3) For (X, M_X) smooth over (A/I, M_A) with mod p fibre of Cartier type, Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A} A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)} as étale sheaves, and for qcqs X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I as E_∞-A-algebras.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-frobenius-isogeny` (theorem): Frobenius is an isogeny

Let (X, M_X) be smooth over (A/I, M_A) with mod p fibre of Cartier type. For each i ≥ 0 there are natural maps V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)} with φ∘V_i and V_i∘(φ ⊗ 1) equal to the maps induced by I^i ⊂ A. If X is qcqs, V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A) inverts Frobenius up to I^i; for I = (d) principal, φ∘V_i = V_i∘φ = d^i. If Ω^1_log has finite rank D, a single V inverts φ up to I^D; in particular the linearised Frobenius RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ becomes an isomorphism after inverting I.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/kummer-etale-site-log-scheme` (definition): The Kummer étale site of an fs log scheme

A homomorphism of fs monoids h: P → Q is of Kummer type if it is injective and every a ∈ Q has a power a^n (n ≥ 1) in h(P); a morphism f: X → Y of fs log schemes is of Kummer type if M_{Y,f(x)}/O^× → M_{X,x}/O^× is of Kummer type for every x. For an fs log scheme X, the Kummer étale site X_két is the category (fs/X) (or its small variant of Kummer étale X-schemes) with coverings the families {f_i: U_i → X} of log étale morphisms of Kummer type with X = ∪ f_i(U_i); RΓ_két(X, Λ) is its cohomology. For a pre-log ring (R[1/p], P) with P saturated (not necessarily fine), RΓ_két(Spec(R[1/p], P)^a, Λ) := colim_{P_i ⊂ P} RΓ_két(Spec(R[1/p], P_i)^a, Λ), over fine saturated submonoids P_i (a filtered colimit). Standard covers: for P → Q of Kummer type with Q fs, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a Kummer étale cover when the index is invertible on R.

Typed forms above (proofs admitted): `KummerEtale.IsKummerType`, `KummerEtale.kummerType_nat`.

* Untyped API `KummerEtale.site` (constructor): The Kummer étale site X_két of an fs log scheme.

* Untyped API `KummerEtale.cohomology` (constructor): RΓ_két(X, Λ) for a torsion abelian group Λ, and its colimit extension to saturated charts.

* Untyped API `KummerEtale.standardCover` (example): For P → Q of Kummer type with index invertible, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a covering.

* Untyped API `KummerEtale.trivialLog` (compatibility): For trivial log structure X_két ≃ X_ét.

* Untyped API `KummerEtale.baseChange` (functoriality): Kummer étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.

* Untyped API `KummerEtale.toLogEtale` (relation): For constant torsion Λ, Kummer étale and full log étale cohomology agree (Nakayama II Proposition 5.4, KY Remark 6.3).

* Untyped Unit test `KummerEtale.trivialLog_eq` (compatibility): For X with trivial log structure, RΓ_két(X, Λ) = RΓ_ét(X, Λ).

* Untyped Unit test `KummerEtale.empty` (degenerate): The empty family covers the empty log scheme.

* Untyped Unit test `KummerEtale.not_etale` (non-example): For n > 1 and K algebraically closed of characteristic 0 and the log point X = Spec(K, N → 0)^a, H^1_két(X, Z/n) ≅ Z/n(−1) ≠ 0 = H^1_ét(Spec K, Z/n): Kummer étale cohomology is not étale cohomology of the underlying scheme.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-scheme-vs-log-adic-kummer` (lemma): Kummer étale cohomology of log schemes and of log adic spaces

Let Λ = Z/nZ and (R, P) a classically p-complete fs pre-log ring with R topologically finitely generated over a noetherian ring A_0. With X = Spec(R[1/p], P)^a and X^ad = (Spa(R[1/p], R), P)^a the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism RΓ_két(X, Λ) ≅ RΓ_két(X^ad, Λ).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/affine-kummer-etale-comparison` (theorem): The affine Kummer-étale comparison

Let (A, I = (d)) be a perfect prism with I ≠ (p), and (R, P) a p-adically complete pre-log A/I-algebra with P saturated and R of bounded p^∞-torsion. For each n ≥ 1 there is a canonical isomorphism RΓ_két(Spec(R[1/p], P)^a, Z/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}, functorial in (R, P), where (−)^{φ=1} is the derived fibre of φ − 1. The base prism may be replaced by any perfect log prism, or by a pre-log prism with (A/I, M_A) perfectoid or pseudo-perfectoid (derived-log-properties (5)); the left side may equally be the full log étale cohomology.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-diamond` (definition): Log diamonds

A log (locally spatial) diamond over Q_p is a (locally spatial) diamond Y with a map Y → Spd Q_p and a log structure M_Y → Ô_Y on the quasi-pro-étale site Y_qproét, where Ô_Y and Ô^+_Y are the completed structure sheaves (for affinoid perfectoid Y′ = Spa(R, R^+) quasi-pro-étale over Y with untilt (R^♯, R^{♯+}), Ô_Y(Y′) = R^♯). A chart is P → Γ(Y_qproét, M_Y) inducing P^a ≅ M_Y and factoring through Ô^+_Y; (Y, M_Y) is quasi-coherent (integral, saturated, fine, fs) if such charts exist quasi-pro-étale locally. Maps are assumed to have compatible charts locally (Convention 7.5). Saturation exists for quasi-coherent log diamonds (via perfectoidisation of R^+ ⊗_{Z[P]} Z[P^sat]) and fibre products exist among saturated quasi-coherent (resp. fs) log diamonds; from now on fibre products are saturated fibre products ×^sat.

* Untyped API `LogDiamond` (constructor): A diamond Y → Spd Q_p with a log structure M_Y → Ô_Y on Y_qproét.

* Untyped API `LogDiamond.chart` (data): Charts P → Γ(Y_qproét, M_Y) factoring through Ô^+_Y, with integral/saturated/fine/fs variants.

* Untyped API `LogDiamond.IsQuasiCoherent` (other): Existence of charts quasi-pro-étale locally (with integral, saturated, fine, fs variants).

* Untyped API `LogDiamond.saturation` (universal-property): A quasi-coherent log diamond admits a saturation map (Y^sat, M_Y^sat) → (Y, M_Y), terminal among maps from saturated quasi-coherent log diamonds to (Y, M_Y).

* Untyped API `LogDiamond.satFiberProduct` (structure): Saturated fibre products exist among saturated quasi-coherent (resp. fs) log diamonds.

* Untyped API `LogDiamond.ofLogAdicSpace` (coercion): An fs log adic space (DLLZ, from T6:log-sites), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦.

* Untyped Unit test `LogDiamond.trivial` (degenerate): Y with M_Y = Ô_Y^× is a saturated quasi-coherent log diamond and its saturation is itself.

* Untyped Unit test `LogDiamond.disc` (computation): (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a is an fs log diamond with chart N → Ô^+, 1 ↦ T.

* Untyped Unit test `LogDiamond.compat_logAdic` (compatibility): For an fs log adic space from T6:log-sites, the associated log diamond has the log structure induced by ν^{-1} of the étale log structure (KY Example 7.6).

* Untyped Unit test `LogDiamond.not_naive_product` (non-example): For n > 1, take the log n-th-root cover of the disc over an algebraically closed complete C. Its ordinary diamond self-product has branches meeting over T = 0; its saturated log self-product is the disjoint union of n copies of the root disc after choosing μ_n(C). Over Q_p this splitting is asserted only after this geometric base change.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-diamond-generic-fibre` (construction): The log diamond generic fibre

For a pre-log Huber pair (R, R^+) over (Q_p, Z_p) with a monoid map P → R^+, (Spd(R, R^+), P)^a denotes the associated log diamond (log structure associated with P → Ô^+). For an fs log p-adic formal scheme (X, M_X) over Z_p, its diamond generic fibre X^♦_η → Spd Q_p carries the fs log structure induced by M_X, giving the log diamond (X, M_X)^♦_η, functorial in (X, M_X); for p-complete (R, P) with bounded p^∞-torsion it is (Spd(R[1/p], R^+), P)^a with R^+ the integral closure of R. The underlying pre-adic space Spa(R[1/p], R^+) need not be sheafy; the log diamond always exists.

* Untyped API `LogDiamond.genericFibre` (constructor): (X, M_X) ↦ (X, M_X)^♦_η for fs log p-adic formal schemes.

* Untyped API `LogDiamond.ofHuberPair` (constructor): (Spd(R, R^+), P)^a for a pre-log Huber pair.

* Untyped API `LogDiamond.genericFibre_map` (functoriality): Functoriality in maps of fs log p-adic formal schemes, compatible with composition.

* Untyped API `LogDiamond.genericFibre_trivial` (compatibility): For trivial M_X, the underlying diamond is X^♦_η with trivial log structure.

* Untyped API `LogDiamond.genericFibre_affine` (characterisation): For X = Spf(R) with fs chart P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a.

* Untyped Unit test `LogDiamond.genericFibre_point` (degenerate): For (Spf Z_p, trivial) the generic fibre is Spd Q_p with trivial log structure.

* Untyped Unit test `LogDiamond.genericFibre_disc` (computation): For (Spf Z_p⟨T⟩, T^N)^a the generic fibre is (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a.

* Untyped Unit test `LogDiamond.genericFibre_ok_nonsheafy` (characterisation): For p-complete R with bounded p^∞-torsion whose Spa(R[1/p], R^+) is not sheafy, (Spd(R[1/p], R^+), P)^a still exists as a log diamond.

* Untyped Unit test `LogDiamond.genericFibre_not_complement` (non-example): The log diamond generic fibre of (Spf Z_p⟨T⟩, T^N) is not the punctured disc: its underlying diamond contains T = 0; only its Kummer-étale cohomology sees the puncture.

-/

/-! ### Node `PrismaticCohomology:PR.8/stdisc-log-perfectoid` (definition): Strictly totally disconnected log perfectoid spaces

A strictly totally disconnected log perfectoid space is a strictly totally disconnected perfectoid space X (qcqs, every étale cover splits) with a saturated quasi-coherent log structure M_X such that M_X/M_X^× is uniquely divisible; then X is affinoid perfectoid and Γ(X, M_X) is saturated and divisible. For such X, H^1(X, Ô_X^×) = 0 for the pro-étale topology, so Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective for any integral quasi-coherent M_X; it suffices that M_X be divisible, and (X, P)^a is such a space for any divisible saturated P → Γ(X, Ô^+_X).

* Untyped API `LogPerfectoid.IsStrictlyTotallyDisconnected` (other): The defining condition: X strictly totally disconnected, M_X saturated quasi-coherent, M_X/M_X^× uniquely divisible.

* Untyped API `LogPerfectoid.h1_units` (other): H^1_proét(X, Ô_X^×) = 0 for X strictly totally disconnected.

* Untyped API `LogPerfectoid.sections_surjective` (characterisation): Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective.

* Untyped API `LogPerfectoid.of_divisible` (constructor): (X, P)^a for P divisible saturated with P → Γ(X, Ô^+_X).

* Untyped API `LogPerfectoid.divisible_iff` (characterisation): It suffices that M_X be divisible (Remark 7.13).

* Untyped Unit test `LogPerfectoid.trivial` (degenerate): Any strictly totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected log perfectoid space.

* Untyped Unit test `LogPerfectoid.rational_monoid` (computation): For C algebraically closed, the chart Q_{≥0} → O_C sending 0 ↦ 1 and every a > 0 to 0 on Spa(C,O_C) gives a strictly totally disconnected log perfectoid space: its characteristic monoid is Q_{≥0}, which is uniquely divisible.

* Untyped Unit test `LogPerfectoid.not_fs` (non-example): On Spa(C,O_C), the chart N → O_C with 0 ↦ 1 and every n > 0 mapping to 0 gives characteristic monoid N, so the log perfectoid space is not strictly totally disconnected as a log space. In contrast, 1 ↦ p gives trivial associated log structure on Ô = C, hence is not this non-example.

* Untyped Unit test `LogPerfectoid.compat_D1` (compatibility): The underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.

-/

/-! ### Node `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site` (definition): The quasi-pro-Kummer-étale site

A locally separated map f: (Y′, M_{Y′}) → (Y, M_Y) of saturated quasi-coherent log diamonds is quasi-pro-Kummer-étale (resp. Kummer-étale, finite Kummer-étale) if for every map (X, M_X) → (Y, M_Y) from a strictly totally disconnected log perfectoid space, Y′ ×^sat_Y X is a perfectoid space and (Y′ ×_Y X, M) → (X, M_X) is strict and pro-étale (resp. étale, finite étale); it is surjective if each such pullback is surjective. The quasi-pro-Kummer-étale site (Y, M_Y)_qpkét consists of quasi-pro-Kummer-étale maps to (Y, M_Y) with jointly surjective coverings. Strict maps are quasi-pro-Kummer-étale iff the underlying map is quasi-pro-étale; the classes are stable under pullback and composition and satisfy cancellation in the following direction: if g and g∘f belong to the class, then f belongs to the class (no unrestricted two-out-of-three assertion); maps of log diamonds induce morphisms of sites.

* Untyped API `QProKummerEtale.IsQPKet` (other): The quasi-pro-Kummer-étale condition on a map, with Kummer-étale and finite Kummer-étale variants.

* Untyped API `QProKummerEtale.site` (constructor): The site (Y, M_Y)_qpkét.

* Untyped API `QProKummerEtale.strict_iff` (characterisation): A strict map is quasi-pro-Kummer-étale iff its underlying map of diamonds is pro-étale in the quasi sense.

* Untyped API `QProKummerEtale.comp` (structure): Stability under composition and saturated pullback. Cancellation in KY Proposition 7.16(4): if g and g∘f are quasi-pro-Kummer-étale (respectively Kummer-étale or finite Kummer-étale), then f is too.

* Untyped API `QProKummerEtale.pullbackSite` (functoriality): A map of saturated quasi-coherent log diamonds induces a morphism of sites.

* Untyped API `QProKummerEtale.trivialLog` (compatibility): For trivial log structures (Y, M_Y)_qpkét ≃ Y_qproét (DiamondEtaleCohomology C0).

* Untyped API `QProKummerEtale.cohomology` (constructor): RΓ_qpkét((Y, M_Y), Λ) for a condensed (discrete or profinite) coefficient ring.

* Untyped Unit test `QProKummerEtale.kummer_root` (computation): (Spd(Q_p⟨T^{1/n}⟩, Z_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N) is surjective finite Kummer-étale; over a strictly totally disconnected log perfectoid space its saturated pullback is n copies indexed by Z/n.

* Untyped Unit test `QProKummerEtale.trivial` (compatibility): With trivial log structures quasi-pro-Kummer-étale maps are quasi-pro-étale maps.

* Untyped Unit test `QProKummerEtale.id` (degenerate): Identity maps are quasi-pro-Kummer-étale coverings.

* Untyped Unit test `QProKummerEtale.not_strict_etale` (non-example): For n > 1, the Kummer map T ↦ T^n of log discs is Kummer-étale but its underlying map of diamonds is not étale at T = 0.

-/

/-! ### Node `PrismaticCohomology:PR.8/kummer-tower-covers` (theorem): Kummer towers and the comparison of sites

For the power-tower assertions (1)–(2), let P be an fs monoid with torsion-free group completion (in particular, a sharp fs monoid), P^{1/n} the monoid P with structure map a ↦ a^n, and P_{Q≥0} := colim_n P^{1/n}. (1) For n ≥ 1 and a saturated Q with P ⊂ Q ⊂ P^{1/n}, (Spd(Q_p⟨Q⟩, Z_p⟨Q⟩), Q) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective finite Kummer-étale. (2) (Spd(Q_p⟨P_{Q≥0}⟩, Z_p⟨P_{Q≥0}⟩), P_{Q≥0}) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective quasi-pro-Kummer-étale. (3) For any fs chart P and a Huber pair (R, R^+) over (Q_p, Z_p) with P → R^+, the associated log diamond gives a morphism of sites (Spd(R, R^+), P)^a_qpkét → (Spec R, P)^a_két; separately, for any divisible saturated chart P, (Spd(R, R^+), P)^a_qpkét ≅ Spd(R, R^+)_qproét and there is a morphism of sites to (Spec R)_ét. (4) For P fs and P_∞ divisible saturated over P, base change gives (Spec S)_ét → (Spec R, P)_két for the saturated base change (S, P_∞).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/kummer-etale-vs-qpket` (theorem): Kummer-étale cohomology of log schemes via log diamonds

Let Λ be a torsion abelian group, R a p-complete ring with bounded p^∞-torsion, (R[1/p], R^+) the associated Huber pair and P → R a map from an fs monoid. The comparison map is an isomorphism RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ). Consequently, for a perfect prism (A, (d)), R p-complete over A/I with bounded p^∞-torsion and P → R fs, RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Z/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1} functorially (and for saturated P after defining the left side as a filtered colimit of fs cases).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/global-etale-comparison` (theorem): The Kummer-étale comparison

Let (A, I = (d), M_0) be a bounded pre-log prism with (A, I) perfect and M_0 an fs monoid; (X_0, M_{X_0}) a smooth fs log p-adic formal scheme over (A/I, M_0) with X_0 qcqs and mod p fibre of (X_0, M_{X_0}) → (Spf A/I, M_0)^a of Cartier type (equivalently, saturated in Tsuji's sense); (A, I, M_A) a saturated pre-log prism whose associated log prism is perfect, with (A, M_0) → (A, Γ(Spf A, M_{Spf A})); and (X, M_X) the base change of (X_0, M_{X_0}) to (A/I, M_A) (also (X_i, M_{X_i}) to fs submonoids M_i ⊂ M_A containing the image of M_0; underlying formal schemes unchanged). Define RΓ_qpkét((X, M_X)^♦_η, Z/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, Z/p^m). Then there are functorial isomorphisms RΓ_qpkét((X, M_X)^♦_η, Z/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅ (RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}. If moreover A/I = O_C (C algebraically closed, A = A_inf) and X is proper, RΓ_qpkét((X, M_X)^♦_η, Z_p) := lim_m RΓ_qpkét(−, Z/p^m) is a perfect Z_p-complex with RΓ_qpkét ⊗^L_{Z_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭), and similarly mod p^m. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the log structure is trivial there.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/kummer-local-systems` (definition): Kummer-étale local systems

Let (X, M_X) be an fs log diamond and pr: (X, M_X)_qpkét → X_qproét → ∗_proét. For a condensed ring Λ (here Z/p^n discrete or Z_p profinite), a sheaf of pr^{-1}Λ-modules F on (X, M_X)_qpkét is constant if F ≅ pr^{-1}Λ^r, and locally constant (a Λ-local system) if it is constant quasi-pro-Kummer-étale locally. Loc_Λ(X, M_X) is the category of Λ-local systems; D^(b)((X, M_X)^♦_η, Z_p) denotes the corresponding category of complexes locally constant with perfect fibres (hypercomplete when X^♦_η is quasicompact).

* Untyped API `KummerLocalSystem` (constructor): Loc_Λ(X, M_X): locally constant sheaves of pr^{-1}Λ-modules on (X, M_X)_qpkét.

* Untyped API `KummerLocalSystem.constant` (constructor): The constant local system pr^{-1}Λ^r.

* Untyped API `KummerLocalSystem.pullback` (functoriality): Pullback along maps of fs log diamonds.

* Untyped API `KummerLocalSystem.tensor` (structure): Tensor products and duals of local systems.

* Untyped API `KummerLocalSystem.trivialLog` (compatibility): For trivial log structure, Loc_{Z_p} agrees with quasi-pro-étale Z_p-local systems (Mann–Werner).

* Untyped Unit test `KummerLocalSystem.constant_rank` (computation): pr^{-1}Z_p^r is a Z_p-local system of rank r.

* Untyped Unit test `KummerLocalSystem.zero` (degenerate): The zero sheaf is the local system of rank 0.

* Untyped Unit test `KummerLocalSystem.kummer_torsor` (non-example): Over an algebraically closed complete C and for n > 1, let π be the finite Kummer-étale n-th-root cover of the log disc. The linear local system π_*Z_p has rank n and nontrivial permutation inertia at T = 0, so it does not descend to a local system on the underlying diamond near T = 0. The root torsor itself is a torsor under Z_p(1) in the inverse p-power tower, not a rank-one Z_p-module local system.

* Untyped Unit test `KummerLocalSystem.trivialLog_eq` (compatibility): With trivial log structure these are the quasi-pro-étale Z_p-local systems of Mann–Werner.

-/

/-! ### Node `PrismaticCohomology:PR.8/laurent-f-crystal` (definition): Laurent F-crystals on the absolute saturated log prismatic site

Let (X, M_X) be a bounded fs log p-adic formal scheme and (X, M_X)_Δ its absolute saturated log prismatic site. A Laurent F-crystal is a crystal of vector bundles E over (O_Δ[1/I])^∧_p on (X, M_X)_Δ (a compatible family of finite projective A[1/I]^∧_p-modules on objects (A, I, M_A)^a with isomorphisms along maps) together with an isomorphism φ_E: φ^*E ≅ E. Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} is the category of Laurent F-crystals; D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} the analogous category of perfect complexes.

* Untyped API `LaurentFCrystal` (constructor): The category Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}.

* Untyped API `LaurentFCrystal.unit` (example): The unit object O_Δ[1/I]^∧_p with its Frobenius.

* Untyped API `LaurentFCrystal.tensor` (structure): Tensor products and duals.

* Untyped API `LaurentFCrystal.pullback` (functoriality): Pullback along maps of bounded fs log p-adic formal schemes.

* Untyped API `LaurentFCrystal.descent` (characterisation): Vect(…)^{φ=1} ≃ lim_{(A,I,M_A)} Vect(A[1/I]^∧_p)^{φ_A=1} over the absolute saturated site (Drinfeld–Mathew).

* Untyped API `LaurentFCrystal.etaleRealisation` (projection): The étale realisation F ↦ F_ét to Loc_{Z_p}((X, M_X)^♦_η) (from Theorem 7.36).

* Untyped Unit test `LaurentFCrystal.unit_realisation` (computation): The étale realisation of the unit O_Δ[1/I]^∧_p is the constant local system Z_p.

* Untyped Unit test `LaurentFCrystal.trivialLog` (compatibility): For trivial log structure the category agrees with PR.7's Laurent F-crystals (BS F-crystals Definition 3.2).

* Untyped Unit test `LaurentFCrystal.zero` (degenerate): The zero crystal is a Laurent F-crystal of rank 0.

* Untyped Unit test `LaurentFCrystal.not_F_crystal` (non-example): A vector-bundle crystal E over O_Δ (not O_Δ[1/I]) with φ^*E[1/I] ≅ E[1/I] is a prismatic F-crystal, not a Laurent F-crystal: inverting I is part of the definition.

-/

/-! ### Node `PrismaticCohomology:PR.8/laurent-f-crystals-local-systems` (theorem): Laurent F-crystals and Kummer-étale local systems

Provisional preprint target, held for source correction and not accepted as a current theorem: Let (X, M_X) be a bounded fs log p-adic formal scheme with log diamond generic fibre (X, M_X)^♦_η. There is a natural equivalence Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ Loc_{Z_p}((X, M_X)^♦_η), and more generally D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ D^(b)((X, M_X)^♦_η, Z_p); the unit O_Δ corresponds to the constant sheaf Z_p.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/smooth-proper-pushforward` (theorem): Smooth proper pushforward of Kummer-étale local systems

Provisional preprint target, held for source correction and not accepted as a current theorem: Let f: (X, M_X) → (Y, M_Y) be a smooth (Koshikawa's sense) proper map of bounded fs log p-adic formal schemes. Then Rf_*O_Δ is an F-crystal of perfect complexes on (Y, M_Y)_Δ and there is a natural isomorphism (Rf_*O_Δ)_ét ≅ Rf_{η*}Z_p for f_η: (X, M_X)^♦_η → (Y, M_Y)^♦_η; in particular Rf_{η*}Z_p is locally constant with perfect fibres and commutes with base change (Z, M_Z) → (Y, M_Y).

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/etale-comparison-over-ainf` (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)]

Let C be algebraically closed with A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1; (X_0, M_{X_0}) an fs log p-adic formal scheme smooth and proper over (Spf O_C, M_0)^a with mod p fibre of Cartier type, base changed to (X, M_X) over a perfect log prism (A_inf, (ξ), M_A) receiving M_0; M := RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X, M_X)^♦_η, Z_p). Then for every i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗_{Z_p} A_inf[1/φ^{-1}(μ)].

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism` (theorem): Hyodo–Kato isomorphism for log prismatic cohomology over A_crys

In the setting of the étale comparison over A_inf, let (A_crys, (p), M_crys) be the log prism associated with M_0 → A_inf → A_crys and (X_0, M_{X_0})_{O_C/p} the base change along Spec(O_C/p, M_crys)^a → Spf(O_C, M_0)^a. (1) φ^*RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ⊗^L_{A_inf} A_crys ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys)) Frobenius-equivariantly, and Frobenius is an isomorphism after inverting p. (2) Let k = O_C/m, (k, N) the log ring associated with (k, M_0) and (Y, M_Y) the base change of (X_0, M_{X_0}) to (k, N). For a section k → O_C/p, RΓ_crys((Y, M_Y)/(W(k), N)) ⊗^L_{W(k)} A_crys[1/p] ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))[1/p]; hence each H^i(M ⊗^L_{A_inf,φ} A_crys[1/p]) is a finite free A_crys[1/p]-module.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/log-prismatic-bkf-module` (theorem): Log prismatic cohomology groups are Breuil–Kisin–Fargues modules

In the setting of the étale comparison over A_inf (X proper over O_C, mod p fibre of Cartier type, perfect log prism base over A_inf), for every i the Frobenius-twisted cohomology φ^*H^i_Δ = H^i_Δ ⊗_{A_inf,φ} A_inf with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented A_inf-module N, free after inverting p, with a φ-linear φ_N inducing N[1/ξ] ≅ N[1/φ(ξ)]. Moreover H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗ A_inf[1/φ^{-1}(μ)].

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

/-! ### Node `PrismaticCohomology:PR.8/semistable-chart-application` (application): Log prismatic cohomology of the standard semistable chart

Let O_K be totally ramified over W(k) with uniformiser π and R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤ r ≤ d) with the canonical log structure given by the chart P = N^r → R, e_j ↦ x_j (j ≤ r), over (O_K, N → O_K, 1 ↦ π) via the diagonal 1 ↦ e_1 + ⋯ + e_r (the standard semistable chart of CR.5, with its actual monoid map recording π). Then: (1) (Spf R, P)^a is smooth of Cartier type over (O_K, N) in Koshikawa's sense, hence over the Breuil–Kisin prelog prism (W(k)[[u]], (E), N → u) via O_K = W(k)[[u]]/(E); (2) H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}, a free R-module of rank (d − 1 choose i) with basis the wedge products of dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1 = −Σ_{j=2}^r dlog x_j); (3) the crystalline comparison over (W(k), (p), N → 0), after u ↦ 0, computes the Hyodo–Kato log crystalline cohomology of the special fibre (Spec k[x_1, …, x_d]/(x_1⋯x_r), N^r)^a; (4) the de Rham comparison gives Ω^•_{(R,P)/(O_K,N)}; (5) base change along u ↦ [π♭] gives the A_inf log prismatic cohomology of R_{O_C}, whose Frobenius twist is ČK's AΩ (semistable-aomega-comparison, on the overlap with AI.6); (6) the Kummer-étale comparison over a perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale cohomology because x_1, …, x_r are units on R[1/p], so the log structure is trivial there.

The geometric target has no typed statement here. Its packet statement and proof outline remain planning obligations.

-/

end TauCeti.LogPrismatic
