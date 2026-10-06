import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.Perfection
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.Algebra.MonoidAlgebra.Defs
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
group completion, the monoid part of exactification, the δ_log-triple carrier of prelog prisms,
perfectoid and perfect monoids (via Mathlib's `Perfection` of a monoid and `Associates`), and
Kummer-type monoid maps.

What is not typed. Prisms (PR.0), log formal schemes and Koshikawa smoothness (CR.5), Gabber's
log cotangent complex and derived log de Rham theory (DD.6), derived ∞-categories and animation
(EnhancedDerivedSheaves), sites of log prisms, diamonds and the quasi-pro-étale site
(DiamondsAndVStacks, DiamondEtaleCohomology), and A_inf/BKF modules (AInfCohomology) are not in the
pinned libraries. Conditions that cannot be stated are left out, never replaced by `Prop`-valued
fields. For the nodes that rest on them, the second half of this file records every API item and
unit test of the packet by its packet name, with its statement, in documentation comments.
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

/-- Unit test `DeltaLogRing.trivialLog_deltaLog` (computation, over `ℤ_[p]`). -/
example (δ : DeltaStructure p ℤ_[p]) (u : ℤ_[p]ˣ) :
    (trivialLog δ).deltaLog u * (u : ℤ_[p]) ^ p = δ.delta u := by
  sorry

/-- Unit test `DeltaLogRing.zero_monoid` (degenerate): over the trivial monoid every δ_log-ring
has rank one. -/
example (D : DeltaLogRing p A PUnit) : D.IsRankOne := by
  sorry

/-- Unit test `DeltaLogRing.monoidAlgebra_rankOne` (compatibility). -/
example (R : Type*) [CommRing R] (M : Type*) [CommMonoid M]
    (δ : DeltaStructure p (MonoidAlgebra R M)) (hδ : ∀ m, δ.delta (MonoidAlgebra.of R M m) = 0) :
    (monoidAlgebra R M δ hδ).IsRankOne :=
  fun _ => rfl

/-- Unit test `DeltaLogRing.not_any_map` (non-example): with `δ(x) = 1` there is no δ_log-structure
on `(ℤ[x], x^ℕ)`. -/
example (δ : DeltaStructure p (Polynomial ℤ)) (hX : δ.delta Polynomial.X = 1) :
    ¬ ∃ D : DeltaLogRing p (Polynomial ℤ) (Multiplicative ℕ),
      D.delta = δ ∧ D.α (Multiplicative.ofAdd 1) = Polynomial.X := by
  sorry

/-- Unit test `DeltaLogRing.frobenius_alpha_example` (characterisation). -/
example (D : DeltaLogRing p A M) (m : M) :
    D.delta.frob (D.α m) - D.α m ^ p = (p : A) * D.α m ^ p * D.deltaLog m := by
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

/-- Unit test `DeltaLogRing.frobeniusMonoid_bk` (computation): for a rank-one δ_log-structure on
`(ℤ_[p]⟦u⟧, ℕ)`, `n ↦ uⁿ`, the Frobenius on the monoid is multiplication by `p`. -/
example (D : DeltaLogRing p (PowerSeries ℤ_[p]) (Multiplicative ℕ))
    (hα : ∀ n, D.α (Multiplicative.ofAdd n) = PowerSeries.X ^ n) (h : D.IsRankOne) :
    D.delta.frob (D.α (Multiplicative.ofAdd 1)) = D.α (Multiplicative.ofAdd p) := by
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

/-- Unit test `DeltaLogTriple.exactification_compat_monoid` (compatibility): `M` lies in its
exactification. -/
example {M N : Type*} [CommMonoid M] [CommMonoid N] (h : M →* N) (m : M) :
    Algebra.GrothendieckGroup.of m ∈ exactificationMonoid h := by
  sorry

/-! ## B. Prelog prisms: the carrier (node `PR.8/prelog-prism`) -/

/-- A δ_log-triple `(A, I, M)`: a δ_log-ring with an ideal. A prelog prism is a δ_log-triple whose
underlying δ-pair is a prism (PR.0); the prism conditions are PR.0's and are not restated. -/
structure DeltaLogTriple (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] extends DeltaLogRing p A M where
  ideal : Ideal A

/-- API `PrelogPrism.IsRankOne` (on the δ_log-triple carrier): `δ_log = 0`. -/
def PrelogPrism.IsRankOne {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A]
    [CommMonoid M] (T : DeltaLogTriple p A M) : Prop :=
  T.toDeltaLogRing.IsRankOne

/-! ## B. Perfect log prisms (node `PR.8/perfect-log-prism`) -/

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- API `LogPrism.IsPerfect` (on the δ_log-triple carrier of a ''log prism'' whose `(A, M)` is a
log ring): `M` integral and the Frobenius `(φ_A, φ_M)` bijective. The prism and boundedness
conditions are PR.0's and are not restated. -/
def IsPerfect (T : DeltaLogTriple p A M) (hlog : DeltaLogRing.IsLogRing T.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : Prop :=
  IsCancelMul M ∧ Function.Bijective T.delta.frob ∧
    Function.Bijective (T.toDeltaLogRing.frobeniusMonoid hlog hp)

/-- API `LogPrism.isPerfect_iff_uniquelyDivisible`: for a perfect underlying prism, perfectness
of the ''log prism'' is unique `p`-divisibility of `M_A / A^×` (with `M` integral). -/
theorem isPerfect_iff_uniquelyDivisible (T : DeltaLogTriple p A M)
    (hlog : DeltaLogRing.IsLogRing T.α) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hA : Function.Bijective T.delta.frob) :
    IsPerfect T hlog hp ↔ IsCancelMul M ∧ Function.Bijective (fun a : Associates M => a ^ p) := by
  sorry

/-- Unit test `LogPrism.trivial_isPerfect_iff` (degenerate): with the trivial log structure the
''log prism'' is perfect iff the Frobenius of `A` is bijective. -/
example (δ : DeltaStructure p A) (I : Ideal A)
    (hlog : DeltaLogRing.IsLogRing (DeltaLogRing.trivialLog δ).α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsPerfect ⟨DeltaLogRing.trivialLog δ, I⟩ hlog hp ↔ Function.Bijective δ.frob := by
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

/-! ## Packet items not typed here

For each node of the packet, the API items and unit tests that the pinned libraries cannot yet
express are recorded below under their packet names, with the reason they are not typed. Names
typed earlier in this file are listed as such. Theorems are recorded by their statements; those
that can be stated over the typed core are stated above.
-/
/-! ### Node `PR.8/delta-log-ring` (definition): δ_log-rings

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0/delta-frobenius-dictionary, CrystallineCohomology:CR.5:log-algebra).

Typed above: `DeltaLogRing.mk`, `DeltaLogRing.frobenius_alpha`, `DeltaLogRing.unitFactor_mul`, `DeltaLogRing.frobenius_iterate_alpha`, `DeltaLogRing.deltaLog_unique_of_nonZeroDivisor`, `DeltaLogRing.exists_iff_dvd`, `DeltaLogRing.Hom`, `DeltaLogRing.IsRankOne`, `DeltaLogRing.trivialLog`, `DeltaLogRing.monoidAlgebra`, `DeltaLogRing.baseChange`, `DeltaLogRing.trivialLog_deltaLog`, `DeltaLogRing.zero_monoid`, `DeltaLogRing.monoidAlgebra_rankOne`, `DeltaLogRing.not_any_map`, `DeltaLogRing.frobenius_alpha_example`.

* API `DeltaLogRing.equivWittSection` (equivalence): δ_log-structures on (A, δ, α) correspond bijectively to monoid maps w_log: M → W_2(A) of the form m ↦ (1, δ_log(m)) with w(α(m)) = (α(m), 0)·w_log(m).
-/

/-! ### Node `PR.8/delta-log-frobenius` (construction): The monoid Frobenius of a δ_log log ring

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

Typed above: `DeltaLogRing.frobeniusMonoid`, `DeltaLogRing.alpha_frobeniusMonoid`, `DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne`, `DeltaLogRing.frobeniusMonoid_units`, `DeltaLogRing.frobeniusMonoid_natural`, `DeltaLogRing.frobeniusMonoid_bk`, `DeltaLogRing.frobeniusMonoid_trivial`, `DeltaLogRing.frobeniusMonoid_not_pow`.
-/

/-! ### Node `PR.8/delta-log-free` (construction): Limits, colimits and free δ_log-rings

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence, PrismaticCohomology:PR.0).

* API `DeltaLogRing.freeOnMonoid` (constructor): For a δ_log-ring (A, M_A) and a monoid M, the δ_log-ring (A{M}_δlog, M_A ⊕ M) with its prelog-ring map from (A[M], M_A ⊕ M).

* API `DeltaLogRing.freeOnMonoid.lift` (universal-property): δ_log-maps (A{M}_δlog, M_A ⊕ M) → (B, N) over (A, M_A) correspond to monoid maps M → N compatible with prelog structures (lift ∘ canonical = given map, and uniqueness).

* API `DeltaLogRing.freeOneGenerator_equiv_mvPolynomial` (equivalence): Z_(p){x}_δlog ≅ Z_(p)[x, y_0, y_1, …] with y_0 = δ_log(x), y_{i+1} = δ(y_i).

* API `DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat` (other): φ on Z_(p){x}_δlog is faithfully flat.

* API `DeltaLogRing.hasLimits` (instance): The category of δ_log-rings has all small limits and colimits, preserved by the forgetful functor to (ring, monoid) pairs.

* API `DeltaLogRing.invertGenerator_completion` (compatibility): (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) is an isomorphism after classical p-completion.

* Unit test `DeltaLogRing.freeOneGenerator_frobenius_x` (computation): In Z_(p){x}_δlog, φ(x) = x^p(1 + p·δ_log(x)) and φ(δ_log(x)) = δ_log(x)^p + p·δ(δ_log(x)).

* Unit test `DeltaLogRing.freeOnMonoid_trivial` (degenerate): For M the trivial monoid, (A{M}_δlog, M_A ⊕ M) = (A, M_A).

* Unit test `DeltaLogRing.freeOneGenerator_not_monoidAlgebra` (non-example): Z_(p){x}_δlog is not Z_(p)[x]: the element δ_log(x) is algebraically independent of x, so the rank-1 algebra Z_(p)[x] is a proper quotient.

* Unit test `DeltaLogRing.pdivisible_rankOne` (characterisation): For M = N[1/p] and a classically p-complete δ_log-ring (A, M), δ(α(m)) = 0 for all m (K1 Example 2.10).
-/

/-! ### Node `PR.8/delta-log-completion-etale` (lemma): δ_log-structures pass to completions and completely étale extensions

Statement: Let (A, M) be a δ_log-ring and I ⊂ A a finitely generated ideal containing p. (1) The classical I-adic completion A^∧_cl with the composite prelog structure M → A → A^∧_cl carries a unique δ_log-structure making A → A^∧_cl a map of δ_log-rings. (2) If A → B is I-completely étale, then (B, M) carries a unique δ_log-structure compatible with (A, M).

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0/delta-completion-unique-fg, PrismaticCohomology:PR.0).
-/

/-! ### Node `PR.8/delta-log-associated-log` (theorem): δ_log-structures on associated log structures

Statement: (1) Let (A, M) be a δ_log-ring and N := M ⊔_{α^{-1}(A^×)} A^× the pushout of monoids. There is a unique δ_log-structure on the prelog ring (A, N) compatible with that of (A, M). (2) If moreover A is classically I-complete for a finitely generated ideal I ∋ p, then for every affine U = Spf(B) étale over Spf(A), the log ring (B, Γ(U, M^a)) of the associated log structure M^a on Spf(A)_ét carries a unique δ_log-structure compatible with (A, M) and with étale localisation. Hence δ_log-structures make sense on log structures (on the étale site of Spf(A)).

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/delta-log-groupification` (theorem): Extension of δ_log along M ⊂ N ⊂ M^gp

Statement: Let (A, M, α) be a δ_log-ring with M integral and p ∈ rad(A). (1) There is a unique map δ_log: M^gp → A satisfying δ_log(mm′) = δ_log(m) + δ_log(m′) + pδ_log(m)δ_log(m′) on M^gp, namely δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m)). (2) For every submonoid N ⊂ M^gp containing M there is a unique δ-structure on A ⊗_{Z_(p)[M]} Z_(p)[N] making (A ⊗_{Z_(p)[M]} Z_(p)[N], N) a δ_log-ring over (A, M) with this δ_log. (3) The map (A, M) → (A ⊗_{Z_(p)[M]} Z_(p)[N], N) is universal among maps of δ_log-rings (A, M) → (B, N) compatible with M ⊂ N, and its formation commutes with base change A → A′.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0/delta-localization-phi-stable, CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/delta-log-exactification` (construction): Exactification of δ_log-triples

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

Typed above: `DeltaLogTriple.exactification_compat_monoid`.

* API `DeltaLogTriple.exactification` (constructor): The δ_log-triple (A′, I′, M′) with A′ = A ⊗_{Z_(p)[M]} Z_(p)[(h^gp)^{-1}(N)].

* API `DeltaLogTriple.exactification.toQuotient_exactSurjective` (characterisation): (A′, M′) → (A/I, N) is surjective and M′/M′^× ≅ N/N^×.

* API `DeltaLogTriple.exactification.lift` (universal-property): Every map of δ_log-triples (A, I, M) → (B, J, M_B) whose target surjects exactly onto (A/I, N) compatibly factors uniquely through (A′, I′, M′).

* API `DeltaLogTriple.exactification.baseChange` (functoriality): For A → A″ the exactification of the base change is the base change of (A′, M′).

* API `DeltaLogTriple.exactification.integral` (other): If M_B → N is integral for a base (B, M_B), then N → M′ is integral.

* Unit test `DeltaLogTriple.exactification_of_exact` (degenerate): If (A, M) → (A/I, N) is already exact surjective then (A′, I′, M′) = (A, I, M).

* Unit test `DeltaLogTriple.exactification_diagonal` (computation): For (Z_p⟨X_0, X_1⟩, X_0^N X_1^N) → (Z_p⟨X_0⟩, X_0^N) sending both generators to X_0, M′ = X_0^N·(X_1/X_0)^Z and A′ = Z_p⟨X_0, X_1⟩[(X_1/X_0)^{±1}]^ completed.

* Unit test `DeltaLogTriple.exactification_not_ring_quotient` (non-example): The exactification is not the kernel-ideal construction on A alone: for the diagonal example the ring changes (X_1/X_0 is adjoined), so the prismatic envelope of A → A/I without exactification is the wrong object.
-/

/-! ### Node `PR.8/prelog-prism` (definition): Prelog prisms

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0).

Typed above: `PrelogPrism.IsRankOne`.

* API `PrelogPrism.mk` (constructor): From a δ_log-ring (A, M) and an ideal I with (A, I) a prism, a prelog prism.

* API `PrelogPrism.toPrism` (projection): The underlying prism (A, I).

* API `PrelogPrism.IsBounded` (other): Boundedness of the underlying prism.

* API `PrelogPrism.baseChange_of_flat` (functoriality): If (A, I) is bounded and A → B is a (p, I)-completely flat δ-map with B (p, I)-complete, then (B, IB, M) is a prelog prism.

* API `PrelogPrism.rigid` (characterisation): For a δ-map A → B with B (p, I)-complete, (B, IB, M) is a prelog prism iff B[I] = 0.

* Unit test `PrelogPrism.zero_log` (computation): (Z_p, (p), N → Z_p, 1 ↦ 0) is a bounded prelog prism of rank 1.

* Unit test `PrelogPrism.trivial_monoid` (degenerate): With M = {e}, prelog prisms are exactly prisms.

* Unit test `PrelogPrism.not_delta_pair` (non-example): (Z_p[x], (x), x^N) with δ(x) = 0 is a δ_log-triple of rank 1 that is not a prelog prism: x is not distinguished and Z_p[x] is not (p, x)-complete.

* Unit test `PrelogPrism.forget_compat` (compatibility): The forgetful functor to prisms sends (W(k), (p), N → 0) to PR.0's crystalline prism (W(k), (p)).
-/

/-! ### Node `PR.8/log-prism` (definition): Log prisms

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

* API `LogPrism.ofPrelog` (constructor): The associated log prism (A, I, M)^a of a bounded prelog prism.

* API `LogPrism.globalSections` (projection): The prelog prism (A, I, Γ(Spf(A), M_{Spf(A)})).

* API `LogPrism.homOfPrelog` (universal-property): Maps of prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M)) correspond bijectively to maps of log prisms (A, I, M_A)^a → (B, J, M).

* API `LogPrism.frobenius` (structure): For a log prism the Frobenius lift (φ_A, φ_M) of the log formal scheme Spf(A) (from delta-log-frobenius).

* API `LogPrism.IsIntegral` (other): The log structure is integral.

* API `LogPrism.trivial` (example): Any bounded prism with the trivial log structure O^×.

* Unit test `LogPrism.trivial_frobenius` (degenerate): For the trivial log structure the Frobenius of the log prism is φ_A.

* Unit test `LogPrism.bk_associated` (computation): The associated log structure of (W(k)[[u]], (E(u)), N → u^n) on Spf(W(k)[[u]]) (a single point for the (p, E)-adic topology) has characteristic monoid M/O^× ≅ N, generated by u.

* Unit test `LogPrism.globalSections_not_inverse` (non-example): (B, J, Γ(Spf(B), M))^a → (B, J, M) need not be an isomorphism (K1 Remark 3.5): a log prism is not the same as a prelog prism on global sections.

* Unit test `LogPrism.forget_compat` (compatibility): Forgetting the log structure sends log prisms to PR.0's bounded prisms, and the trivial log prism functor is a section.
-/

/-! ### Node `PR.8/standard-log-prisms` (construction): The standard prelog prisms

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0, AInfCohomology:AI.0).

* API `PrelogPrism.breuilKisin` (constructor): The Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → u^n) of rank 1.

* API `PrelogPrism.ainf` (constructor): The prelog prism (A_inf, ker θ, O_C♭∖{0}) with Teichmüller prelog structure, of rank 1.

* API `PrelogPrism.crystallineZeroLog` (constructor): The prelog prism (W(k), (p), N → W(k), 1 ↦ 0).

* API `PrelogPrism.breuilKisinToCrystalline` (functoriality): The map of prelog prisms u ↦ 0 from the Breuil–Kisin prelog prism to (W(k), (p), N).

* API `PrelogPrism.breuilKisinToAinf` (functoriality): The map of prelog prisms u ↦ [π♭] to (A_inf, ker θ, O_C♭∖{0}), with N → O_C♭∖{0}, 1 ↦ π♭.

* Unit test `PrelogPrism.breuilKisin_frobenius` (computation): In the Breuil–Kisin prelog prism φ(u) = u^p and δ_log(1) = 0, so φ_M is multiplication by p on N.

* Unit test `PrelogPrism.breuilKisin_mod_u` (compatibility): Reducing the Breuil–Kisin prelog prism along u ↦ 0 gives (W(k), (p), N → 0) since E(0) = p·unit.

* Unit test `PrelogPrism.ainf_rankOne` (characterisation): In (A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0 for all x, so δ_log = 0 is forced (Lemma 2.1 of K1).

* Unit test `PrelogPrism.breuilKisin_not_frobenius_u_plus_p` (non-example): With the Frobenius φ(u) = u^p + p on W(k)[[u]], (W(k)[[u]], (E), N → u) is not a δ_log-ring of rank 1, and no δ_log exists since u^p does not divide δ(u) = 1.
-/

/-! ### Node `PR.8/prelog-prismatic-envelope` (construction): Prelog prismatic envelopes

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0).

* API `PrelogPrism.envelope` (constructor): The prelog prismatic envelope (B′, IB′, M_{B′}) of (B, J, M_B) → (B/J, N) over (A, I, M_A).

* API `PrelogPrism.envelope.lift` (universal-property): Maps of δ_log-triples from (B, J, M_B) to a prelog prism (C, IC, M_C) over (A, I, M_A) with an exact surjection (C, M_C) → (C/IC, N) compatible with (B/J, N) factor uniquely through the envelope.

* API `PrelogPrism.envelope.exactSurjective` (characterisation): (B′, M_{B′}) → (B′/IB′, N) is exact surjective.

* API `PrelogPrism.envelope.monoid_integral` (other): M_{B′} is integral.

* API `PrelogPrism.envelope_of_exact` (compatibility): For an exact surjection the envelope is PR.0's prismatic envelope of (B, J) with the monoid M_B unchanged.

* Unit test `PrelogPrism.envelope_identity` (degenerate): The envelope of (A, I, M_A) → (A/I, M_A) itself is (A, I, M_A).

* Unit test `PrelogPrism.envelope_trivial_log` (compatibility): With all monoids trivial, the prelog prismatic envelope is the BS22 prismatic envelope.

* Unit test `PrelogPrism.envelope_log_line_diagonal` (computation): For (A⟨X_0, X_1⟩, X_0^N X_1^N) → (A/I⟨X_0⟩, X_0^N) the envelope is the completion of A⟨X_0, X_1⟩{(I, X_1/X_0 − 1)/I}_δ with monoid X_0^N(X_1/X_0)^Z (K1 §5.4).

* Unit test `PrelogPrism.envelope_not_without_exactification` (non-example): Without exactification the non-log prismatic envelope of (A⟨X_0, X_1⟩, (I, X_1 − X_0)) gives the non-log Čech nerve, whose Hodge–Tate cohomology is ordinary Ω, not log Ω.
-/

/-! ### Node `PR.8/log-prismatic-envelope` (theorem): Universal property of log prismatic envelopes

Statement: In the situation of the prelog prismatic envelope, assume (B′, IB′, M_{B′}) is bounded. Then (B′, IB′, M_{B′})^a with the exact closed immersion (Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′}) is final among commutative squares with top arrow an exact closed immersion (Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)}) for log prisms (C, IC, M_{Spf(C)}) with integral log structure over (Spf(B/J), N^a) → (Spf(B), M^a_B). Key lemma: for such a log prism, with N^a_{C/I} := Γ(Spf(C/IC), N^a), the map (C, Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I}) is exact surjective and a (1 + IC)-torsor on monoids.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/envelope-flatness-smooth` (theorem): Flatness of prelog prismatic envelopes for smooth log algebras

Statement: Fix a bounded prelog prism (A, I, M_A) with M_A integral. (1) Let (B_0, M_B) be a prelog ring over (A, M_A) with M_B integral and (B_0, M_B) → (B_0/J, N) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) (smooth in Koshikawa's Appendix A sense). Assume M_A → N is integral, N is weakly finitely generated over M_A, and (∗): M_A → M_B is injective and integral, M_B^gp/M_A^gp is free abelian, and B_0 is (p, I)-completely free over the completion of A ⊗_{Z_(p)[M_A]} Z_(p)[M_B]. Let (B, M_B) be the (p, I)-completed free δ_log-ring over (A, M_A) generated by (B_0, M_B). Then the prelog prismatic envelope (B′, IB′, M_{B′}) of (B, (JB)^∧, M_B) exists, is (p, I)-completely flat over A (hence bounded), and its formation commutes with base change on (A, I, M_A) and with (p, I)-completely flat base change on B_0. (2) Variant: if (B, M_B) is a (p, I)-completely smooth δ_log-ring over (A, M_A) with M_A → M_B a smooth chart, (B, M_B) → (R, P) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) with M_A → P integral, then the prelog prismatic envelope exists, is (p, I)-completely flat over A and commutes with base change on (A, I, M_A).

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0, CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/perfectoid-monoid` (definition): Perfectoid monoids and perfectoid log rings

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra, PrismaticCohomology:PR.0).

Typed above: `Monoid.tilt`, `Monoid.IsPerfectoid`, `Monoid.IsPerfect`, `Monoid.IsPseudoPerfectoid`, `Monoid.IsPerfect.isPerfectoid`, `Monoid.IsPerfectoid.isPseudoPerfectoid`, `Monoid.isPerfectoid_units`.

* API `PrelogRing.tilt` (constructor): For a perfectoid pre-log ring (R, M), the pre-log ring (R♭, M♭, α♭).

* API `PrelogRing.ainf` (constructor): A_inf(R) = (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]).

* API `PerfectoidLogRing.iff_pseudoPerfectoid` (characterisation): For an integral log ring (R, M) with R perfectoid, M is perfectoid iff M/M^× is uniquely p-divisible.

* Unit test `Monoid.tilt_nat_inv_p` (computation): For M = N[1/p] (additive), M♭ ≅ N[1/p] and M is perfect.

* Unit test `Monoid.valuationMonoid_perfectoid_not_perfect` (non-example): O_C∖{0} for C algebraically closed perfectoid is perfectoid but not perfect, since 1 + p has many p-th roots.

* Unit test `Monoid.pseudoPerfectoid_not_perfectoid` (non-example): The monoid generated by x_0, x_1, …, y_1^{±1}, … with x_j^p = x_{j−1}y_j is pseudo-perfectoid with M/M^× ≅ N[1/p] but M♭ = 0.

* Unit test `Monoid.tilt_compat_pretilt` (compatibility): For an integral perfectoid ring R, the multiplicative monoid of PreTilt agrees with Monoid.tilt of (R, ·) under the multiplicative bijection R♭ ≅ lim_{x ↦ x^p} R.
-/

/-! ### Node `PR.8/perfect-log-prism` (definition): Perfect log prisms

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0).

Typed above: `LogPrism.IsPerfect`, `LogPrism.isPerfect_iff_uniquelyDivisible`, `LogPrism.trivial_isPerfect_iff`.

* API `LogPrism.IsPerfect.pSaturated` (relation): A perfect ''log prism'' has p-saturated monoid.

* API `LogPrism.perfection` (constructor): The perfection (A_perf, IA_perf, M_{A,perf}) of an integral ''log prism''.

* API `LogPrism.perfection.lift` (universal-property): Maps from an integral ''log prism'' to a perfect one factor uniquely through its perfection.

* API `LogPrism.ainfPerfect` (example): (A_inf(R), ker θ, M♭)^a is perfect of rank 1 for a perfectoid integral pre-log ring (R, M).

* Unit test `LogPrism.ainf_isPerfect` (computation): (A_inf, (ξ), O_C♭∖{0})^a is a perfect log prism.

* Unit test `LogPrism.breuilKisin_not_perfect` (non-example): The Breuil–Kisin log prism (W(k)[[u]], (E), N) is not perfect: u is not a p-th power and φ is not surjective.

* Unit test `LogPrism.zeroLog_perfect` (characterisation): (W(k), (p), N → 0)^a is not perfect (N is not p-divisible), while its perfection has monoid N[1/p] modulo units.
-/

/-! ### Node `PR.8/perfect-log-prisms-perfectoid` (theorem): Perfect log prisms are perfectoid log rings

Statement: The functor (A, I, M_A) ↦ (A/I, M_A)^a is an equivalence from perfect ''log prisms'' to perfectoid log rings, with quasi-inverse (R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a. In particular every perfect ''log prism'' admits a chart N → A of rank 1. Moreover, for a perfectoid integral pre-log ring (R, M) and an integral ''log prism'' (A, I, M_A), every map (R, M) → (A/I, M_A)^a of pre-log rings lifts uniquely to a map of pre-log prisms (A_inf(R), ker θ, M♭) → (A, I, M_A); so (A_inf(R), ker θ, M♭)^a is initial among integral ''log prisms'' under (R, M) (also with exact-surjection or associated-log variants).

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0, DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/perfectoid-prelog-cotangent` (lemma): Log cotangent complexes of perfectoid pre-log rings

Statement: Let (R, M) be a perfectoid (or pseudo-perfectoid) pre-log ring and Z_p the trivial pre-log ring. Then the natural map L̂_{R/Z_p} → L̂_{(R,M)/Z_p} of p-completed (Gabber) log cotangent complexes is an isomorphism; equivalently L̂_{(R,M)/R} = 0; in particular L̂_{(R,M)/Z_p}[−1]{−1} ≅ R. For a map f: (R, M) → (S, N) of perfectoid pre-log rings, L̂_{(S,N)/(R,M)} = 0.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/log-prismatic-site` (definition): The relative log prismatic site

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1, CrystallineCohomology:CR.5:log-algebra).

* API `LogPrismaticSite` (constructor): The site ((X, M_X)/(A, M_A))_Δ with the étale topology.

* API `LogPrismaticSite.structureSheaf` (data): The sheaf O_Δ: (B, IB, M) ↦ B, valued in (p, I)-complete A-algebras with δ-structure.

* API `LogPrismaticSite.reducedStructureSheaf` (data): Ō_Δ: (B, IB, M) ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ.

* API `LogPrismaticSite.etaleLift` (characterisation): For an object B and a p-completely étale B/IB → C̄ there is a unique étale map of objects B → C with C/IC ≅ C̄ (Remark 4.2).

* API `LogPrismaticSite.toEtale` (functoriality): The morphism of topoi ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) with (ν_*F)(U) = H^0(((U, M_U)/(A, M_A))_Δ, F).

* API `LogPrismaticSite.flat_eq_etale` (compatibility): Replacing étale covers by (p, I)-completely faithfully flat covers does not change the cohomology of O_Δ (Remark 4.3).

* API `LogPrismaticSite.trivialLog_equiv` (equivalence): For trivial log structures the site is equivalent to PR.1's relative prismatic site with the étale topology.

* API `LogPrismaticSite.chart_independent` (other): The site depends only on (Spf(A), M_A)^a and (X, M_X).

* Unit test `LogPrismaticSite.affineLine_object` (computation): For (X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a, the triple (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 and the identity Spf(A/I⟨X⟩) → X is an object.

* Unit test `LogPrismaticSite.trivialLog` (compatibility): With M_A and M_X trivial, the site equals the PR.1 relative prismatic site (étale variant) and the structure sheaves agree.

* Unit test `LogPrismaticSite.base_point` (degenerate): For X = Spf(A/I) with the log structure from M_A, (A, I, M_A)^a is a final object.

* Unit test `LogPrismaticSite.not_strict_open_immersion` (non-example): The log affine line object (A⟨X⟩, I, M_A ⊕ N)^a is not an object of the non-log site of the underlying scheme with trivial log structure: the closed immersion must be exact for the given log structures, and forgetting logs changes the cohomology (Ω^1 versus log Ω^1).
-/

/-! ### Node `PR.8/log-prismatic-cohomology` (construction): Log prismatic cohomology complexes

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1).

* API `LogPrismaticSite.cohomology` (constructor): RΓ_Δ((X, M_X)/(A, M_A)) as a (p, I)-complete E_∞-A-algebra.

* API `LogPrismaticSite.sheafCohomology` (constructor): Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A).

* API `LogPrismaticSite.reducedCohomology` (constructor): Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I).

* API `LogPrismaticSite.reduced_eq_tensor` (characterisation): Δ̄ ≅ Δ ⊗^L_A A/I.

* API `LogPrismaticSite.frobenius` (structure): The φ_A-semilinear Frobenius φ: Δ → φ_{A,*}Δ.

* API `LogPrismaticSite.cohomology_isComplete` (other): RΓ_Δ is derived (p, I)-complete.

* API `LogPrismaticSite.cohomology_map` (functoriality): Functoriality in (X, M_X) over (A, M_A) and in maps of bounded prelog prisms.

* Unit test `LogPrismaticSite.cohomology_point` (degenerate): For X = Spf(A/I) with log structure from M_A, RΓ_Δ((X, M_X)/(A, M_A)) ≅ A with φ = φ_A.

* Unit test `LogPrismaticSite.cohomology_trivialLog` (compatibility): With trivial log structures, Δ_{(X,M_X)/(A,M_A)} ≅ PR.1's Δ_{X/A}.

* Unit test `LogPrismaticSite.reduced_affineLine` (computation): For (A/I⟨X⟩, M_A ⊕ N): H^0(Δ̄) = A/I⟨X⟩ and H^1(Δ̄){1} ≅ A/I⟨X⟩·dlog X, a free module of rank 1 (K1 §5.4).

* Unit test `LogPrismaticSite.cohomology_not_nonlog` (non-example): For the log affine line, H^1(Δ̄){1} is generated by dlog X rather than dX: the log and non-log cohomologies differ (the map Ω^1 → Ω^1_log is X·, not an isomorphism).
-/

/-! ### Node `PR.8/absolute-log-prismatic-site` (definition): The absolute saturated log prismatic site

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1, CrystallineCohomology:CR.5:log-algebra).

* API `AbsoluteLogPrismaticSite` (constructor): The site (X, M_X)_Δ with the flat topology (integral variant).

* API `AbsoluteLogPrismaticSite.saturated` (constructor): The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict flat topology.

* API `AbsoluteLogPrismaticSite.structureSheaf` (data): O_Δ: (B, J, M) ↦ B and the ideal sheaf I_Δ: (B, J, M) ↦ J.

* API `AbsoluteLogPrismaticSite.ofRelative` (functoriality): The forgetful functor from the relative site ((X, M_X)/(A, M_A))_Δ to the strict variant.

* API `AbsoluteLogPrismaticSite.trivialLog` (compatibility): For trivial log structures the strict variant is PR.5's absolute prismatic site.

* Unit test `AbsoluteLogPrismaticSite.bk_covers` (computation): For (X, M_X) = (Spf(O_K), O_K∖{0})^a, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object (K1 Lemma 4.14).

* Unit test `AbsoluteLogPrismaticSite.point_perfect` (degenerate): For (Spf(O_C), O_C∖{0})^a, the perfect log prism (A_inf, (ξ), O_C♭∖{0})^a is weakly final.

* Unit test `AbsoluteLogPrismaticSite.not_relative` (non-example): Unlike the relative site, objects need not receive a map from a fixed base prism: for O_K the Breuil–Kisin prism depends on a choice of uniformiser, while the absolute site does not.
-/

/-! ### Node `PR.8/cech-alexander-log` (construction): Čech–Alexander complexes for log prismatic cohomology

* API `LogPrismaticSite.cechAlexander` (constructor): The cosimplicial δ-A-algebra C^• attached to a choice of surjections (B_0, M_B) → (R, P).

* API `LogPrismaticSite.cechAlexander_flat` (other): Each C^n is (p, I)-completely flat over A.

* API `LogPrismaticSite.cechAlexander_computes` (characterisation): Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)} compatibly with Frobenius.

* API `LogPrismaticSite.cechAlexander_baseChange` (functoriality): C^• commutes with base change along maps of bounded prelog prisms (A, I, M_A) → (A′, IA′, M_{A′}).

* API `LogPrismaticSite.cechAlexanderFunctorial` (constructor): The strictly functorial complex for P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩.

* API `LogPrismaticSite.cechAlexander_independent` (extensionality): Two choices of surjections give canonically quasi-isomorphic totalisations.

* Unit test `LogPrismaticSite.cechAlexander_affineLine` (computation): For (A/I⟨X_0⟩, M_A ⊕ X_0^N) with B_0 = A⟨X_0⟩, C^n is the completion of A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ (K1 §5.4).

* Unit test `LogPrismaticSite.cechAlexander_trivial` (degenerate): For R = A/I and P = M_A, the constant cosimplicial algebra A computes Δ = A.

* Unit test `LogPrismaticSite.cechAlexander_trivialLog` (compatibility): With trivial log structures, C^• is BS22's Čech–Alexander complex (PR.1).

* Unit test `LogPrismaticSite.cechAlexander_needs_exactification` (non-example): Using the non-exactified δ-pair (B^1, (I, X_1 − X_0)) for the log affine line gives the non-log Čech nerve, whose cohomology has H^1(Δ̄) ≅ R·dX rather than R·dlog X.
-/

/-! ### Node `PR.8/log-prismatic-weak-base-change` (lemma): Affine base change for log prismatic cohomology

Statement: Let (R, P) be as in the Čech–Alexander construction and (A, I, M_A) → (A′, IA′, M_{A′}) a map of bounded prelog prisms with M_{A′} integral and A → A′ of finite (p, I)-complete Tor amplitude. With (R′, P′) the p-completed base change of (R, P) as a prelog ring, the natural map Δ_{(R,P)/(A,M_A)} ⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})} is an isomorphism, and similarly for Δ̄.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1).
-/

/-! ### Node `PR.8/log-prismatic-etale-localization` (lemma): Strict étale localisation

Statement: Let R → S be a p-completely étale map of A/I-algebras (so (S, P) is p-completely smooth over (A, M_A)). Then Δ_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ_{(S,P)/(A,M_A)} is an isomorphism; consequently Δ_{(X,M_X)/(A,M_A)} is a quasi-coherent (p, I)-complete sheaf on affine strict-étale localisations.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1).
-/

/-! ### Node `PR.8/smooth-chart-covers` (theorem): Envelopes of smooth charts cover the final object

Statement: Work with the flat topology. Let (R, P) be p-completely smooth over (A/I, M_A) with M_A → P a smooth chart, and (B, IB, M_B) a prelog prism over (A, I, M_A) that is (p, I)-completely smooth over (A, M_A) with M_A → M_B a smooth chart, together with a surjection (B, M_B) → (R, P); let (B′, IB′, M_{B′}) be its prelog prismatic envelope. Then for every object (C, IC, M_C)^a of ((R, P)/(A, M_A))_Δ the product of (B′, IB′, M_{B′})^a and (C, IC, M_C)^a exists and is (p, I)-completely faithfully flat over C; in particular (B′, IB′, M_{B′})^a covers the final object. If (A, M_A) has rank 1, a smooth lift (R̃, P̃) of (R, P) over (A, M_A) with its rank-1 δ_log-structure gives such a covering. In the absolute setting, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object of the topos of (O_K, O_K∖{0})_Δ.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.0).
-/

/-! ### Node `PR.8/log-hodge-tate-map` (construction): The log Hodge–Tate comparison map

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, CrystallineCohomology:CR.5:log-algebra, PrismaticCohomology:PR.1).

* API `LogPrismaticSite.hodgeTateMap` (constructor): η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} as a map of cdgas with the Bockstein differential.

* API `LogPrismaticSite.hodgeTateMap_dlog_sq` (simp): η^1(dlog m)^2 = 0 for m ∈ M_X^gp.

* API `LogPrismaticSite.hodgeTateMap_bockstein_dlog` (simp): β_I(η^1(dlog m)) = 0.

* API `LogPrismaticSite.hodgeTateMap_restrict_nonlog` (compatibility): On Ω^1_{X/(A/I)} ⊂ Ω^1_log, η^1 agrees with the non-log Hodge–Tate map of PR.1.

* API `LogPrismaticSite.hodgeTateMap_cotangent` (characterisation): Locally, η^1 is H^0 of the map RΓ(L_{(R,P)/(A,M_A)}) → Δ̄{1}[1] built from Gabber's log cotangent complex.

* API `LogPrismaticSite.hodgeTateMap_natural` (functoriality): η^* is natural in (X, M_X) and in maps of bounded prelog prisms.

* Unit test `LogPrismaticSite.hodgeTateMap_affineLine` (computation): For (A/I⟨X_0⟩, M_A ⊕ X_0^N), η^1(dlog X_0) corresponds to the class of (X_1/X_0 − 1)/d ⊗ d in H^1 of the Čech–Alexander complex, for an orientation d.

* Unit test `LogPrismaticSite.hodgeTateMap_degree0` (degenerate): η^0: O_X → H^0(Δ̄) is the structure map, independent of the log structures.

* Unit test `LogPrismaticSite.hodgeTateMap_trivialLog` (compatibility): With trivial log structures η^* equals PR.1's Hodge–Tate comparison map.

* Unit test `LogPrismaticSite.hodgeTateMap_dlog_not_dx` (non-example): η^1(dlog X_0) is not η^1(dX_0): they differ by the factor X_0, which is not a unit on A/I⟨X_0⟩.
-/

/-! ### Node `PR.8/hodge-tate-group-lemma` (lemma): Hodge–Tate cohomology of group-ring Čech nerves

Statement: Let (A, I) be a bounded prism and G′ → G a surjection of finitely generated abelian groups without p-torsion, with kernel H; R := A/I⟨G⟩ and A⟨G′⟩ → R. Let B^• be the Čech nerve of the prismatic envelope B^0 in (R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′), and C^• := A⟨H ⊕ H_n⟩{(I, (h − 1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I, so that B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•. Then the map ∧^i(A/I ⊗_Z G) → H^i(Tot(C^•)){i} induced by g ↦ (g̃ − 1)/d ⊗ d (for a lift g̃ ∈ G′ and an orientation d) is an isomorphism of A/I-modules for every i.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.1, PrismaticCohomology:PR.0).
-/

/-! ### Node `PR.8/hodge-tate-log-affine-line` (lemma): Hodge–Tate comparison for the log affine line

Statement: Let (A, I, M_A) be a bounded prelog prism with M_A integral and (R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N). Then η^*: Ω^*_{(R,P)/(A/I,M_A)} → H^*(Δ̄_{(R,P)/(A,M_A)}){*} is an isomorphism; explicitly H^1(Δ̄){1} ≅ R ⊗_Z X_0^Z with 1 ⊗ X_0 ↦ dlog X_0.
-/

/-! ### Node `PR.8/log-hodge-tate-comparison` (theorem): The log Hodge–Tate comparison

Statement: Let (A, I, M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme smooth over (A/I, M_A) in Koshikawa's sense. Then η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} is an isomorphism of differential graded A/I-algebras (sheaves on X_ét); in particular Δ̄_{(X,M_X)/(A,M_A)} is a perfect complex. Moreover RΓ(Spf(R)_ét, L_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1] locally.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra, DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/log-prismatic-base-change` (theorem): Completed base change for log prismatic cohomology

Statement: Let (A, I, M_A) → (A′, IA′, M_{A′}) be a map of bounded prelog prisms with integral monoids, (X, M_X) smooth over (A/I, M_A) with qcqs underlying formal scheme, and X′ := X ×_{(Spf A/I, M_A)^a} (Spf A′/IA′, M_{A′})^a (an integral log formal scheme, smooth over the new base). Then RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′})), and the same holds for the sheaves Δ.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/delta-log-crystalline-site` (definition): The δ_log-crystalline site

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5).

* API `DeltaLogCrystallineSite` (constructor): The site ((X, M_X)/(A, M_A))_δCRYS with étale topology.

* API `DeltaLogCrystallineSite.structureSheaf` (data): O_δCRYS: (B, J, M_B)^a ↦ B.

* API `DeltaLogCrystallineSite.toBigLogCrystalline` (functoriality): The cocontinuous forgetful functor to the big log crystalline site ((X, M_X)/(A, M_A))_CRYS and the map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

* API `DeltaLogCrystallineSite.pd_compatible` (relation): For a PD ideal I of A, the divided powers of I and J are compatible on every object.

* API `DeltaLogCrystallineSite.toEtale` (projection): The morphism of topoi u^δ_X to X_ét.

* Unit test `DeltaLogCrystallineSite.point` (degenerate): For X = Spf(A/p) with log structure M_A, the triple (A, (p), M_A)^a is final and RΓ_δCRYS = A.

* Unit test `DeltaLogCrystallineSite.trivialLog_compat` (compatibility): With trivial log structures, the cohomology agrees with crystalline cohomology for smooth X (BS22 Theorem 5.2's δ-crystalline site).

* Unit test `DeltaLogCrystallineSite.not_all_pd_thickenings` (non-example): A PD thickening (B, J) with B having p-torsion is not an object: objects are bounded prelog prisms with I = (p), so B is p-torsion free.

* Unit test `DeltaLogCrystallineSite.affineLine` (computation): For (A/p⟨X⟩, M_A ⊕ N) the object (A⟨X⟩, (p), M_A ⊕ N) with δ_log(N) = 0 and J = (p) is weakly final.
-/

/-! ### Node `PR.8/delta-log-crystalline-vs-log-crystalline` (theorem): δ_log-crystalline cohomology is log crystalline cohomology

Statement: Let I ⊂ A be a p-completed PD ideal with A/I classically p-complete and (X, M_X) smooth over (A/I, M_A). Then the natural map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS is an isomorphism of E_∞-A-algebras on X_ét. Moreover, for every m ≥ 1 reduction mod p^m identifies Ru_{X*}O_CRYS ⊗^L A/p^m with Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)} (small log crystalline site), and passing to the limit Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS. When I ∋ p and the chart M_A → P is integral and weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a p-completely smooth δ_log-ring of topologically finite presentation, and also the log de Rham complex with coefficients in that envelope, compute these cohomologies.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5, PrismaticCohomology:PR.0).
-/

/-! ### Node `PR.8/cartier-type-cosimplicial-frobenius` (lemma): Cosimplicial relative Frobenius for Cartier-type monoid maps

Statement: Let k be a ring with a prelog structure M → k, M → Q an injective integral map of integral monoids with G := Q^gp/M^gp, and Q^(1) the base change of M → Q along the p-th power map of M, with relative Frobenius Q^(1) → Q. Consider the cosimplicial k-algebras A^• = k ⊗_{Z[M]} Z[Q ⊕ G^•], A^{•(1)} and B^• (the Čech-type nerves of K1 Appendix B). If Q^(1) → Q is exact and injective (M → Q of Cartier type), the projection pr^•: A^• → B^• (killing q ∉ Q^(1)) is homotopic to the identity as a map of cosimplicial A^{•(1)}-modules, so B^• ⊗_{A^{•(1)}} M^• → A^• ⊗_{A^{•(1)}} M^• is a homotopy equivalence for every cosimplicial A^{•(1)}-module M^•. If moreover G is free abelian, M^• → A^• ⊗_{A^{•(1)}} M^• is a quasi-isomorphism on associated cochain complexes of k-modules.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra, PrismaticCohomology:PR.1).
-/

/-! ### Node `PR.8/crystalline-comparison-map` (construction): The log crystalline comparison map

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

* API `LogPrismaticSite.crystallineFunctor` (constructor): The cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ.

* API `LogPrismaticSite.crystallineFunctor_cocontinuous` (other): The functor is cocontinuous for the étale topologies.

* API `LogPrismaticSite.crystallineComparisonMap` (constructor): The induced map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS of E_∞-algebras.

* API `LogPrismaticSite.crystallineComparisonMap_frobenius` (compatibility): The comparison map is compatible with the Frobenius endomorphisms.

* API `LogPrismaticSite.crystallineComparisonMap_natural` (functoriality): Natural in (X, M_X) and in the base.

* Unit test `LogPrismaticSite.crystallineComparisonMap_point` (degenerate): For X = Spf(A/I) with log structure M_A, the comparison map is the identity of φ_*A.

* Unit test `LogPrismaticSite.crystallineComparisonMap_trivialLog` (compatibility): With trivial log structures it equals the map of PR.1's crystalline comparison (BS22 Theorem 5.2).

* Unit test `LogPrismaticSite.crystallineFunctor_logPoint` (computation): For the log point (k, N → 0) over (W(k), (p), N → 0), the functor sends the object (W(k), (p), N) to (φ_*W(k), (p), N^(1)) with N^(1) = N ⊔_{N, ·p} N.

* Unit test `LogPrismaticSite.crystallineFunctor_untwisted_fails` (non-example): Without the Frobenius twist (sending (B, J, M_B) to (B, (p), M_B)) one does not get an object over X: Spf(B/p) need not map to X since only B/J does.
-/

/-! ### Node `PR.8/local-crystalline-comparison` (theorem): Local log crystalline comparison

Statement: In the setting of the comparison map, let (R, P) be a smooth prelog ring over (A/I, M_A) with P integral, M_A → P integral, (weakly) finitely generated and of Cartier type (M_A/M_A^× → P/P^× integral with exact relative Frobenius P^(1) → P), and assume (R, P) admits an exact surjection from a smooth lift (R̃, P̃) over (A/p, M_A). Then there is a canonical isomorphism Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A)) of E_∞-φ_*A-algebras compatible with Frobenius; by base change the left side is the p-completed base change of Δ_{(R̃,P̃)/(A,M_A)} along φ.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra, PrismaticCohomology:PR.1).
-/

/-! ### Node `PR.8/log-crystalline-comparison` (theorem): The log crystalline comparison

Statement: Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log ring, I a PD ideal of A containing p, and (X, M_X) a smooth log scheme over (A/I, M_A) of Cartier type (Kato 4.8). Then the crystalline comparison map is an isomorphism of E_∞-φ_*A-algebras on X_ét: Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys. Globally, for I = (p) and X qcqs of Cartier type over (A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A, φ-equivariantly, as E_∞-A-algebras.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra, CrystallineCohomology:CR.5).
-/

/-! ### Node `PR.8/log-q-pd-triple` (definition): Log q-PD triples and log q-PD envelopes

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.6, CrystallineCohomology:CR.5).

* API `LogQPDTriple` (constructor): A prelog q-PD triple (D, I, M_D) over Z_p[[q − 1]].

* API `LogQPDTriple.gamma_mem` (relation): For x ∈ I, γ(x) = φ(x)/[p]_q − δ(x) ∈ I.

* API `LogQPDTriple.etaleLift` (characterisation): A p-completely étale D/I → Ē lifts uniquely to a prelog q-PD triple (E, J, M_D) over (D, I, M_D) (Lemma 7.3).

* API `LogQPDTriple.envelope` (constructor): The log q-PD envelope (D_3, I_3, M_{D_3}) of Lemma 7.4.

* API `LogQPDTriple.envelope_flat` (other): D_3 is (p, [p]_q)-completely flat over D_1.

* API `LogQPDTriple.envelope_mod_q_sub_one` (compatibility): D_3 ⊗̂_{D_1} D_1/(q − 1) is the p-completed log PD envelope of I_2/(q − 1) (CR.5).

* Unit test `LogQPDTriple.ainf_example` (computation): (A_inf(O_C), (ξ), O_C♭∖{0}) with q = [ε] is a prelog q-PD triple and ξ = φ^{-1}([p]_q).

* Unit test `LogQPDTriple.q_eq_one` (compatibility): At q = 1 a prelog q-PD triple is the same as a pre-δ_log-PD triple (D p-torsion free and p-complete, D/I classically p-complete, I with divided powers).

* Unit test `LogQPDTriple.trivial_envelope` (degenerate): For (R, P) = (D_1/I_1, M_{D_1}) and the identity surjection, the envelope is (D_1, I_1, M_{D_1}).

* Unit test `LogQPDTriple.not_q_minus_one_ideal` (non-example): (Z_p[[q − 1]], (q − 1)) is a q-PD pair but ([p]_q) cannot be replaced by (q − 1) as the prism ideal: (Z_p[[q − 1]], (q − 1)) is not a prism.
-/

/-! ### Node `PR.8/log-q-crystalline-site` (definition): The log q-crystalline site

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.6).

* API `LogQCrystallineSite` (constructor): The site ((X, M_X)/(D, M_D))_qCRYS.

* API `LogQCrystallineSite.qOmega` (constructor): qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS, an E_∞-D-algebra on X_ét with φ_D-semilinear Frobenius.

* API `LogQCrystallineSite.cech` (characterisation): For affine X with chart and smooth lift, the Čech nerve of a log q-PD envelope computes qΩ (Construction 7.8, Remark 7.9).

* API `LogQCrystallineSite.ofDeltaLogCrystalline` (functoriality): The functor from ((X, M_X)/(D/(q − 1), M_D))_δCRYS and the induced map qΩ ⊗̂^L D/(q − 1) → Ru^δ_{X*}O_δCRYS.

* API `LogQCrystallineSite.strict_change` (other): For a strict map (D, I, M_D) → (D, I′, M_D), qΩ_{(X,M_X)/(D,M_D)} ≅ qΩ_{(X,M_X)_{D/I′}/(D,M_D)} (Lemma 7.12).

* Unit test `LogQCrystallineSite.point` (degenerate): For X = Spf(D/I) with log structure M_D, qΩ = D.

* Unit test `LogQCrystallineSite.q_eq_one` (compatibility): If q = 1 in D the site is the δ_log-crystalline site.

* Unit test `LogQCrystallineSite.affineLine_complex` (computation): For (D/I⟨X⟩, M_D ⊕ N) with D flat over A, qΩ is computed by the two-term complex D⟨X⟩ → D⟨X⟩·dlog X, f ↦ (γ(f) − f)/(q − 1)·dlog X with γ(X) = qX (Construction 7.15 with S a point).

* Unit test `LogQCrystallineSite.not_prismatic` (non-example): The log q-crystalline site is not the log prismatic site over (D, ([p]_q)): its objects carry the additional q-PD ideal J ⊃ ([p]_q)-structure, and the comparison of Theorem 7.13 needs a Frobenius twist.
-/

/-! ### Node `PR.8/log-q-crystalline-vs-crystalline` (theorem): Log q-crystalline cohomology modulo q − 1

Statement: The canonical map induces an isomorphism qΩ_{(X,M_X)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^δ_{X*}O_δCRYS; hence qΩ_{(R,P)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^crys_*O_{(X,M_X)/(D/(q−1),M_D)} computed on the small log crystalline site.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.6).
-/

/-! ### Node `PR.8/log-q-crystalline-vs-prismatic` (theorem): Log q-crystalline versus log prismatic cohomology

Statement: Let (D, I, M_D) be a prelog q-PD triple of rank 1 or with (D, M_D) a log ring, ψ_D: (D/I, M_D) → (φ_*D/[p]_q, φ_*M_D) induced by Frobenius, and (X^(1), M_X^(1)) the base change of (X, M_X) along ψ_D. If the mod p fibre of (X, M_X) is of Cartier type over (D/(p, I), M_D), there is a canonical isomorphism Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)} of E_∞-φ_*D-algebras on X_ét, relative to the log prism (φ_*D, ([p]_q), φ_*M_D). By base change the left side is the (p, [p]_q)-completed base change along φ_D of Δ_{(X̃,M̃)/(D,M_D)} for a lift.
-/

/-! ### Node `PR.8/log-q-de-rham-complex` (construction): Log q-de Rham complexes

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.6, CrystallineCohomology:CR.5).

* API `LogQDeRham.gamma` (data): The automorphism γ_s: X_s ↦ qX_s of (E_N, N)^a.

* API `LogQDeRham.qNabla` (data): ∇^log_{q,s}(f) = (γ_s(f) − f)/(q − 1) and ∇_q = Σ_s ∇^log_{q,s} dlog X_s.

* API `LogQDeRham.complex` (constructor): The log q-de Rham complex qΩ^*_{(E_N,N)/(D,M_D)} and its extension qΩ^*_{(F,M_F)/(D,M_D)} to log q-PD envelopes.

* API `LogQDeRham.computes` (characterisation): qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)} functorially in surjections (Theorem 7.17).

* API `LogQDeRham.mod_q_sub_one` (compatibility): Modulo q − 1, qΩ^* is the log de Rham complex of the p-completed log PD envelope.

* API `LogQDeRham.frobenius_dlog` (simp): Frobenius sends dlog X_s to [p]_q·dlog X_s.

* API `LogQDeRham.frobenius_l_eta` (relation): Under Cartier type, φ_D^*qΩ ≅ Lη_{[p]_q}qΩ, so Frobenius has an inverse up to [p]_q^r.

* Unit test `LogQDeRham.affineLine_monomial` (computation): On D⟨X⟩ with N = X^N, ∇^log_q(X^n) = [n]_q·X^n (since γ(X^n) = q^n X^n).

* Unit test `LogQDeRham.empty` (degenerate): For S = ∅ the complex is E_N in degree 0.

* Unit test `LogQDeRham.q_one_limit` (compatibility): Setting q = 1, ∇^log_{q,s} becomes the log derivation X_s ∂/∂X_s of the log de Rham complex.

* Unit test `LogQDeRham.not_nonlog_derivative` (non-example): The log q-derivative is not the q-derivative of BS22 §16: on X^n it gives [n]_q X^n rather than [n]_q X^{n−1}, i.e. it uses (γ − 1)/(q − 1), not (γ − 1)/((q − 1)X).
-/

/-! ### Node `PR.8/semistable-aomega-comparison` (theorem): Comparison with semistable AΩ

Statement: Let k be algebraically closed of characteristic p, C the completed algebraic closure of W(k)[1/p], and X a p-adic formal scheme over O_C that is étale locally étale over O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) for a non-unit π ∈ O_C, with its canonical log structure M_X (Česnavičius–Koshikawa 1.6). Then there is an isomorphism qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X in D(X_ét, A_inf) compatible with Frobenius, where the left side is formed over the prelog q-PD triple (A_inf, (ξ), O_C♭∖{0}) and the right side is ČK's semistable A_inf-cohomology. Since the mod p fibre is of Cartier type, qΩ is the (p, μ)-completed base change of Δ_{(X,M_X)/(A_inf,O_C♭∖{0})} along φ_{A_inf}; hence (φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf, O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X).

Not typed: rests on carriers outside the pinned libraries (AInfCohomology:AI.6, PrismaticCohomology:PR.6).
-/

/-! ### Node `PR.8/semistable-crys-bdr-diagram` (theorem): The semistable C_st comparison diagram

Statement: Let X be as in the semistable AΩ comparison and proper over O_C. There is a commutative diagram whose left column identifies RΓ_crys((X, M_X)/(A_crys, O_C♭∖{0})) with RΓ_qCRYS((X, M_X)/(A_crys, O_C♭∖{0})) ⊗^L_{A_inf} A_crys and with RΓ(X_ét, AΩ_X) ⊗^L_{A_inf} A_crys (by Theorem 8.1 and Remark 8.4), whose right column identifies RΓ_crys(X^ad/B_dR^+) with RΓ_ét(X^ad_C, Z_p) ⊗^L B_dR^+ and RΓ_ét(X^ad_C, A_inf,X^ad) ⊗^L_{A_inf} B_dR^+, and whose horizontal maps are those of ČK19 6.8.

Not typed: rests on carriers outside the pinned libraries (AInfCohomology:AI.6, AInfCohomology:AI.0, CrystallineCohomology:CR.5).
-/

/-! ### Node `PR.8/breuil-kisin-log-cohomology` (construction): Breuil–Kisin cohomology of semistable formal schemes

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

* API `BreuilKisinLogCohomology` (constructor): RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)).

* API `BreuilKisinLogCohomology.toAinf` (compatibility): (A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})).

* API `BreuilKisinLogCohomology.perfect` (other): For X proper, RΓ_BK(X) is a perfect W(k)[[u]]-complex.

* API `BreuilKisinLogCohomology.toHyodoKato` (compatibility): Base change along u ↦ 0 and Frobenius twist gives RΓ_crys((X_k, M)/(W(k), N)) (log-crystalline-comparison).

* API `BreuilKisinLogCohomology.frobenius` (structure): The φ-semilinear Frobenius over u ↦ u^p.

* Unit test `BreuilKisinLogCohomology.point` (degenerate): For X = Spf(O_K) with M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]].

* Unit test `BreuilKisinLogCohomology.goodReduction` (compatibility): If X is smooth over O_K (no boundary), M_X is pulled back from O_K∖{0}, and RΓ_BK(X) agrees with the non-log prismatic cohomology of X over the Breuil–Kisin prism (PR.1), as the strict case of derived-log-properties (1).

* Unit test `BreuilKisinLogCohomology.curve_H0` (computation): For a proper semistable curve with geometrically connected generic fibre, H^0(RΓ_BK(X)) = W(k)[[u]].

* Unit test `BreuilKisinLogCohomology.not_trivialLog` (non-example): Using the trivial log structure on a semistable X (not smooth over O_K) does not give a perfect complex with Hodge–Tate graded pieces Ω^i_log; the log structure is essential.
-/

/-! ### Node `PR.8/log-quasisyntomic-site` (definition): The log quasisyntomic site

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, DerivedDeRhamCohomology:DD.5, CrystallineCohomology:CR.5:log-algebra).

* API `LogQSyn.IsQuasisyntomic` (other): The quasisyntomic condition on a pre-log ring.

* API `LogQSyn.IsQuasisyntomicMap` (other): The quasisyntomic condition on a map, with the cover variant.

* API `LogQSyn.site` (constructor): The site QSyn^{prelog,op} with quasisyntomic covers, and its small variant qSyn_{(R,M)}.

* API `LogQSyn.of_cover` (characterisation): For a quasisyntomic cover A → B, A is quasisyntomic iff B is.

* API `LogQSyn.comp` (structure): Quasisyntomic maps compose.

* API `LogQSyn.pushout` (functoriality): The p-completed pushout of a quasisyntomic map along any map is discrete with bounded p^∞-torsion and quasisyntomic.

* API `LogQSyn.trivialLog` (compatibility): On pre-log rings with trivial pre-log structure, the notions agree with BMS2's quasisyntomic rings and maps (DD.5).

* API `LogQSyn.cotangent_coconnective` (other): For (S, N) in qSyn_{(R,M)}, (∧^i L_{(S,N)/(R,M)}[−i])^∧_p ∈ D^{≥0}(S).

* Unit test `LogQSyn.smoothLog_quasisyntomic` (computation): (Z_p⟨T⟩, T^N) is quasisyntomic: its log cotangent complex is free of rank 1 on dlog T.

* Unit test `LogQSyn.trivialLog_eq` (compatibility): (R, {e}) is in QSyn^prelog iff R is in BMS2's QSyn.

* Unit test `LogQSyn.zeroLog_lci` (characterisation): (Z_p, N → Z_p, 1 ↦ 0) is quasisyntomic: L_{(Z_p,N)/Z_p} is concentrated in degrees [−1, 0] (KY Example 2.30).

* Unit test `LogQSyn.not_nonintegral` (non-example): For k of characteristic p ≠ 2, (k, P) → (k[x, y]/(x^2, xy, y^2), N^2), with P ⊂ N^2 generated by (2,0), (0,2), (1,1) and P∖{0} ↦ 0, is log étale in Kato's sense but not quasisyntomic: its log cotangent complex is unbounded on the left (KY Remark 2.13).

* Unit test `LogQSyn.empty_degenerate` (degenerate): The identity of a quasisyntomic pre-log ring is a quasisyntomic cover.
-/

/-! ### Node `PR.8/log-qrsp` (definition): Quasiregular semiperfectoid pre-log rings

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, PrismaticCohomology:PR.2).

* API `LogQRSP.IsSemiperfectoid` (other): Conditions (1)–(3).

* API `LogQRSP.IsQRSP` (other): Conditions (1)–(4).

* API `LogQRSP.cotangent_flat` (other): For S ∈ QRSPerfd^prelog, L̂_{(S,M)/Z_p}[−1] is p-completely flat.

* API `LogQRSP.iff_cotangent` (characterisation): Lemma 3.16: with S/p log-semiperfect, S is quasiregular semiperfectoid iff L_{S/R} ⊗^L S/p has Tor amplitude in degree −1 for some/any perfectoid R → S.

* API `LogQRSP.perfectoidCover` (constructor): The map (R ⊗̂ W(S♭) ⊗̂ Z_p⟨M♭⟩, M♭) → (S, M) of Remark 3.13.

* API `LogQRSP.quotient_monoid` (relation): Condition (3) passes to quotient monoids and pushouts (Remark 3.14).

* Unit test `LogQRSP.perfectoid_divisible` (computation): (O_C⟨T^{1/p^∞}⟩, N[1/p] → T^{N[1/p]}) is quasiregular semiperfectoid.

* Unit test `LogQRSP.trivialLog` (compatibility): (S, S^×) is in QRSPerfd^prelog iff S is in BMS2's QRSPerfd (PR.2/DD.5).

* Unit test `LogQRSP.log_line_not` (non-example): (Z_p⟨T⟩, T^N) is quasisyntomic but not semiperfectoid: N♭ = 0 does not surject onto N.

* Unit test `LogQRSP.zero_ring` (degenerate): The zero pre-log ring is quasiregular semiperfectoid.
-/

/-! ### Node `PR.8/log-qrsp-basis` (theorem): Quasiregular semiperfectoid pre-log rings form a basis

Statement: (1) For maps A → B, A → C in QRSPerfd^prelog with A → B a quasisyntomic cover, the p-completed pushout lies in QRSPerfd^prelog and is a quasisyntomic cover of C; QRSPerfd^{prelog,op} is a site. (2) Every R ∈ QSyn^prelog admits a quasisyntomic cover R → S with S ∈ QRSPerfd^prelog, which can be chosen with p-divisible monoid. (3) For such a cover every term of the Čech nerve lies in QRSPerfd^prelog. (4) Consequently, for every presentable ∞-category C, restriction induces an equivalence Shv_C(QSyn^{prelog,op}) ≅ Shv_C(QRSPerfd^{prelog,op}).

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.5).
-/

/-! ### Node `PR.8/derived-log-prismatic` (construction): Derived log prismatic cohomology

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, EnhancedDerivedSheaves:E5:animation, PrismaticCohomology:PR.2).

* API `DerivedLogPrismatic` (constructor): The functor (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} on animated pre-log (A/I, M_A)-algebras, with Frobenius.

* API `DerivedLogPrismatic.reduced` (constructor): Δ̄^L := Δ^L ⊗^L_A A/I.

* API `DerivedLogPrismatic.onFree` (characterisation): On Σ_{S,T}, Δ^L agrees with the site-theoretic log prismatic cohomology.

* API `DerivedLogPrismatic.leftKanExtension` (universal-property): Δ^L preserves sifted colimits and is the unique such extension of its values on log-free algebras (after completion).

* API `DerivedLogPrismatic.pComplete_invariant` (other): Δ^L depends only on the derived p-completion of (R, P).

* API `DerivedLogPrismatic.sheaf` (constructor): The étale sheaf Δ^L_{(X,M_X)/(A,M_A)} on a log p-adic formal scheme.

* API `DerivedLogPrismatic.map` (functoriality): Functoriality in (R, P) and in maps of bounded prelog prisms.

* Unit test `DerivedLogPrismatic.free_logLine` (computation): For (A/I⟨N⟩, M_A ⊕ N), Δ̄^L has H^0 = A/I⟨X⟩ and H^1{1} free on dlog X.

* Unit test `DerivedLogPrismatic.base` (degenerate): For (R, P) = (A/I, M_A), Δ^L = A.

* Unit test `DerivedLogPrismatic.trivialLog` (compatibility): For P = M_A pulled back from the base, Δ^L_{(R,M_A)/(A,M_A)} ≅ BS22's Δ_{R/A} (PR.2).

* Unit test `DerivedLogPrismatic.zeroLog_not_discrete` (non-example): For (R, P) = (A/I, N → 0) over trivial M_A, Δ̄^L is not concentrated in degree 0: its conjugate filtration has graded pieces ∧^i L_{(A/I,N)/(A/I)}{−i}[−i] and L_{(A/I,N)/(A/I)} lives in degrees [−1, 0] (KY Example 2.30).
-/

/-! ### Node `PR.8/derived-log-hodge-tate` (theorem): Derived log Hodge–Tate comparison

Statement: For a simplicial pre-log ring (R, P) over (A/I, M_A), there is an increasing exhaustive multiplicative filtration Fil_• Δ̄_{(R,P)/(A,M_A)} (the conjugate filtration) by derived p-complete objects with gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p. Globally, gr_i Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i].

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/derived-log-properties` (theorem): Basic properties of derived log prismatic cohomology

Statement: Let (A, I, M_A) be a bounded prelog prism with M_A integral. (1) For every derived p-complete simplicial ring R over A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)} (strict pull-back of the base log structure). (2) Δ^L is invariant under passing to the associated log ring: Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(R,P)^a/(A,M_A)}. (3) Base change: for a map of bounded prelog prisms (A, I, M_A) → (A′, IA′, M_{A′}) and (R′, P′) the homotopy base change, Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅ Δ^L_{(R′,P′)/(A′,M_{A′})}. (4) Multiplicativity: for the homotopy cofibre product (R_3, P_3) of (R_1, P_1), (R_2, P_2) over (A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3, compatibly with conjugate filtrations (Day convolution); Δ^L_{−/(A,M_A)} commutes with all colimits. (5) For (A/I, M_A) perfectoid or pseudo-perfectoid, Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, PrismaticCohomology:PR.2).
-/

/-! ### Node `PR.8/derived-vs-site` (theorem): Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes

Statement: Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). (1) For every affine U = Spf(R) in X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ). (2) If P → Γ(U, M_X) is a smooth chart, Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U); in particular for X = Spf(R) with smooth chart M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A)) compatibly with Hodge–Tate maps. Hence Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}), Δ̄^L ≅ Rν_*Ō_Δ, and the derived conjugate filtration is the canonical filtration τ_{≤i}Δ̄.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/log-quasisyntomic-descent` (theorem): Log quasisyntomic descent

Statement: Let (A, I, M_A) be a bounded prelog prism. On the small log quasisyntomic site qSyn_{(A/I,M_A)} the presheaf (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is a sheaf (with values in (p, I)-complete objects of D(A)); if (A/I, M_A) is a perfectoid pre-log ring, the same holds on QSyn_{(A/I,M_A)}. The same holds for each step of the conjugate filtration of Δ̄^L.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/initial-log-prism-qrsp` (theorem): Initial log prisms of semiperfectoid pre-log rings

Statement: Let S = (S, N) be a semiperfectoid integral pre-log ring and (R, M) → (S, N) a map from a perfectoid integral pre-log ring, surjective on rings and modulo units on monoids. Exactify M♭ → M → N as M♭ → M̃ → N and put A_inf(R, M̃) := A_inf(R) ⊗̂ Z_p⟨M̃⟩ with the bounded rank-1 prelog prism (A_inf(R, M̃), (ξ), M̃). Applying prismatic envelopes to A_inf(R, M̃) → S gives a prelog prism (Δ^init_{S/R}, (ξ), M^init_{S/R} := M̃) with S → Δ^init/ξ and an exact surjection onto (Δ^init/ξ, N)^a, and its perfection Δ^init_{S/R,perf}. (1) For every integral ''log prism'' (A, I, M_A) with S → A/I and an exact surjection (A, M_A) → (A/I, N → A/I)^a there is a unique compatible map (Δ^init_{S/R}, (ξ), M^init) → (A, I, M_A); similarly for the perfections among perfect A (resp. perfect log prisms). (2) If S is quasiregular semiperfectoid, Δ_{S/A_inf(R)} is discrete with a δ-structure, Δ_{S/A_inf(R)} ≅ Δ^init_{S/R}, the latter is bounded and independent of R, giving an initial ''log prism'' (Δ^init_S, (ξ), M^init_S) for the category of exact-surjection diagrams. (3) If S is semiperfectoid, Δ_{S/R,perf} is discrete, a perfect prism, and Δ_{S/A_inf(R),perf} ≅ Δ^init_{S,perf}. (4) If moreover N is semiperfect (N♭ → N surjective), the p-saturation S^{p-sat} is semiperfectoid and Δ_{S/R,perf} ≅ Δ_{S^{p-sat}/R,perf}.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.2, PrismaticCohomology:PR.0).
-/

/-! ### Node `PR.8/log-nygaard-filtration` (construction): The log Nygaard filtration

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.3).

* API `LogNygaard.fil` (constructor): The decreasing multiplicative filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} by (p, I)-complete objects.

* API `LogNygaard.frobenius` (data): The filtered Frobenius φ: Fil^i_N Δ^{L,(1)} → I^iΔ^L.

* API `LogNygaard.mulI` (data): The maps I ⊗^L Fil^{i−1}_N → Fil^i_N (Construction 5.21).

* API `LogNygaard.mul` (structure): Fil^i_N ⊗ Fil^j_N → Fil^{i+j}_N (Remark 5.20).

* API `LogNygaard.free_eq_bs` (compatibility): For trivial log structures, Fil^•_N is BS22's Nygaard filtration on Δ^(1) (PR.3).

* API `LogNygaard.flatBaseChange` (functoriality): Formation of Fil^•_N commutes with (p, I)-completely flat base change on A.

* API `LogNygaard.sheaf` (constructor): The global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} by étale sheafification.

* API `LogNygaard.independent` (extensionality): On log-free algebras the totalisation is independent of the chosen surjection M_A ⊕ N → M_A ⊕ N^S.

* Unit test `LogNygaard.fil0` (degenerate): Fil^0_N Δ^{L,(1)} = Δ^{L,(1)}.

* Unit test `LogNygaard.trivialLog` (compatibility): For (R, P) = (A/I⟨X⟩, M_A) with trivial M_A, Fil^•_N agrees with BS22's Nygaard filtration on Δ^(1)_{R/A}.

* Unit test `LogNygaard.logLine_gr1` (computation): For (R, P) = (A/I⟨N⟩, M_A ⊕ N), gr^1_N Δ^(1) ≅ τ_{≤1}Δ̄{1}, a two-term object with H^0 ≅ R{1} and H^1 ≅ R·dlog X.

* Unit test `LogNygaard.naive_fails` (non-example): For KY's toy example over (A_inf, (ξ)) the naive filtration {x : φ(x) ∈ ξ^iΔ} on Δ^(1)_{(S,M)/(A,M_A)} differs from Fil^•_N (KY §5.1).

* Unit test `LogNygaard.frobenius_fil1` (characterisation): φ(Fil^1_N) ⊂ IΔ and the induced map gr^0_N → Δ̄ is the inclusion of Fil_0 Δ̄ = (derived) R.
-/

/-! ### Node `PR.8/log-nygaard-graded` (theorem): Graded pieces of the log Nygaard filtration

Statement: Let (A, I, M_A) be an integral bounded prelog prism and (R, P) a simplicial pre-log ring over (A/I, M_A). The Frobenius induces an isomorphism gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i Δ̄^L_{(R,P)/(A,M_A)}{i}, where Fil_i is the conjugate filtration. For Σ_{S,T} this reads gr^i_N Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}; globally gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i Δ̄^L_{(X,M_X)}{i}, and for (X, M_X) smooth over (A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅ τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.3).
-/

/-! ### Node `PR.8/nygaard-hodge-fiber-sequence` (theorem): The Nygaard–Hodge fibre sequence and Nygaard completeness

Statement: For a simplicial pre-log ring (R, P) over (A/I, M_A) there is a functorial fibre sequence I ⊗^L_A Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)} of filtered objects, the second map being the derived de Rham specialisation γ^• (Construction 5.21, Lemma 5.22). Globally on X_ét it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If (X, M_X) is smooth over (A/I, M_A) with mod p fibre of Cartier type, the right term becomes Ω^{≥•}_{(X,M_X)/(A/I,M_A)}; if moreover X is qcqs and Ω^1_log has finite rank D, then for j ≥ D the maps RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1)) are isomorphisms and RΓ(X_ét, Δ^(1)) is complete for the Nygaard filtration.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6, PrismaticCohomology:PR.5).
-/

/-! ### Node `PR.8/log-l-eta-factorization` (theorem): The Lη_I factorisation of Frobenius

Statement: Let (A, I, M_A) be bounded with M_A integral. (1) If (R, P) is p-complete with bounded p^∞-torsion and M_A → P a smooth chart, then gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i} and the Frobenius factors as Δ^L ⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L; if M_A → P is of Cartier type, Δ^{L,(1)} → Lη_IΔ^L is an isomorphism identifying the Nygaard filtration with the truncations of the I-adic filtration for the Beilinson t-structure. (2) For (X, M_X) smooth over (A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U)) is a sheaf on the affine étale site, defining Lη_IΔ_{(X,M_X)/(A,M_A)}; if the mod p fibre is of Cartier type, Frobenius induces an isomorphism of étale sheaves Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)}, and RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A)) for affine U.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.3, DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/log-de-rham-comparison` (theorem): The log de Rham comparison

Statement: (1) If P → R is a smooth chart of Cartier type over (A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅ Ω̂^•_{(R,P)/(A/I,M_A)} as E_∞-algebras in D(A/I). (2) For every simplicial pre-log ring (R, P) over (A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p-completed derived log de Rham). (3) For (X, M_X) smooth over (A/I, M_A) with mod p fibre of Cartier type, Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A} A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)} as étale sheaves, and for qcqs X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I as E_∞-A-algebras.

Not typed: rests on carriers outside the pinned libraries (DerivedDeRhamCohomology:DD.6).
-/

/-! ### Node `PR.8/log-frobenius-isogeny` (theorem): Frobenius is an isogeny

Statement: Let (X, M_X) be smooth over (A/I, M_A) with mod p fibre of Cartier type. For each i ≥ 0 there are natural maps V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)} with φ∘V_i and V_i∘(φ ⊗ 1) equal to the maps induced by I^i ⊂ A. If X is qcqs, V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A) inverts Frobenius up to I^i; for I = (d) principal, φ∘V_i = V_i∘φ = d^i. If Ω^1_log has finite rank D, a single V inverts φ up to I^D; in particular the linearised Frobenius RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ becomes an isomorphism after inverting I.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.3).
-/

/-! ### Node `PR.8/kummer-etale-site-log-scheme` (definition): The Kummer étale site of an fs log scheme

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5:log-algebra).

Typed above: `KummerEtale.IsKummerType`, `KummerEtale.kummerType_nat`.

* API `KummerEtale.site` (constructor): The Kummer étale site X_két of an fs log scheme.

* API `KummerEtale.cohomology` (constructor): RΓ_két(X, Λ) for a torsion abelian group Λ, and its colimit extension to saturated charts.

* API `KummerEtale.standardCover` (example): For P → Q of Kummer type with index invertible, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a covering.

* API `KummerEtale.trivialLog` (compatibility): For trivial log structure X_két ≃ X_ét.

* API `KummerEtale.baseChange` (functoriality): Kummer étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.

* API `KummerEtale.toLogEtale` (relation): For constant torsion Λ, Kummer étale and full log étale cohomology agree (Nakayama II Proposition 5.4, KY Remark 6.3).

* Unit test `KummerEtale.trivialLog_eq` (compatibility): For X with trivial log structure, RΓ_két(X, Λ) = RΓ_ét(X, Λ).

* Unit test `KummerEtale.empty` (degenerate): The empty family covers the empty log scheme.

* Unit test `KummerEtale.not_etale` (non-example): For K algebraically closed of characteristic 0 and the log point X = Spec(K, N → 0)^a, H^1_két(X, Z/n) ≅ Z/n(−1) ≠ 0 = H^1_ét(Spec K, Z/n): Kummer étale cohomology is not étale cohomology of the underlying scheme.
-/

/-! ### Node `PR.8/log-scheme-vs-log-adic-kummer` (lemma): Kummer étale cohomology of log schemes and of log adic spaces

Statement: Let Λ = Z/nZ and (R, P) a classically p-complete fs pre-log ring with R topologically finitely generated over a noetherian ring A_0. With X = Spec(R[1/p], P)^a and X^ad = (Spa(R[1/p], R), P)^a the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism RΓ_két(X, Λ) ≅ RΓ_két(X^ad, Λ).

Not typed: rests on carriers outside the pinned libraries (HodgeTateAndCanonicalSubgroups:T6:log-sites).
-/

/-! ### Node `PR.8/affine-kummer-etale-comparison` (theorem): The affine Kummer-étale comparison

Statement: Let (A, I = (d)) be a perfect prism with I ≠ (p), and (R, P) a p-adically complete pre-log A/I-algebra with P saturated and R of bounded p^∞-torsion. For each n ≥ 1 there is a canonical isomorphism RΓ_két(Spec(R[1/p], P)^a, Z/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}, functorial in (R, P), where (−)^{φ=1} is the derived fibre of φ − 1. The base prism may be replaced by any perfect log prism, or by a pre-log prism with (A/I, M_A) perfectoid or pseudo-perfectoid (derived-log-properties (5)); the left side may equally be the full log étale cohomology.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.4).
-/

/-! ### Node `PR.8/log-diamond` (definition): Log diamonds

Not typed: rests on carriers outside the pinned libraries (DiamondsAndVStacks:D4, DiamondEtaleCohomology:C0, PerfectoidQuotients:Q2, HodgeTateAndCanonicalSubgroups:T6:log-sites, CrystallineCohomology:CR.5:log-algebra).

* API `LogDiamond` (constructor): A diamond Y → Spd Q_p with a log structure M_Y → Ô_Y on Y_qproét.

* API `LogDiamond.chart` (data): Charts P → Γ(Y_qproét, M_Y) factoring through Ô^+_Y, with integral/saturated/fine/fs variants.

* API `LogDiamond.IsQuasiCoherent` (other): Existence of charts quasi-pro-étale locally (with integral, saturated, fine, fs variants).

* API `LogDiamond.saturation` (universal-property): The saturation (Y^sat, M^sat_Y) of a quasi-coherent log diamond, universal among maps to saturated log diamonds.

* API `LogDiamond.satFiberProduct` (structure): Saturated fibre products exist among saturated quasi-coherent (resp. fs) log diamonds.

* API `LogDiamond.ofLogAdicSpace` (coercion): An fs log adic space (DLLZ, from T6:log-sites), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦.

* Unit test `LogDiamond.trivial` (degenerate): Y with M_Y = Ô_Y^× is a saturated quasi-coherent log diamond and its saturation is itself.

* Unit test `LogDiamond.disc` (computation): (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a is an fs log diamond with chart N → Ô^+, 1 ↦ T.

* Unit test `LogDiamond.compat_logAdic` (compatibility): For an fs log adic space from T6:log-sites, the associated log diamond has the log structure induced by ν^{-1} of the étale log structure (KY Example 7.6).

* Unit test `LogDiamond.not_naive_product` (non-example): The diamond fibre product of (Spd Q_p⟨T^{1/n}⟩, T^{N/n}) with itself over (Spd Q_p⟨T⟩, T^N) is not its saturated fibre product: saturation splits it into n copies (KY Lemma 7.21 proof).
-/

/-! ### Node `PR.8/log-diamond-generic-fibre` (construction): The log diamond generic fibre

Not typed: rests on carriers outside the pinned libraries (DiamondsAndVStacks:D6, CrystallineCohomology:CR.5:log-algebra).

* API `LogDiamond.genericFibre` (constructor): (X, M_X) ↦ (X, M_X)^♦_η for fs log p-adic formal schemes.

* API `LogDiamond.ofHuberPair` (constructor): (Spd(R, R^+), P)^a for a pre-log Huber pair.

* API `LogDiamond.genericFibre_map` (functoriality): Functoriality in maps of fs log p-adic formal schemes, compatible with composition.

* API `LogDiamond.genericFibre_trivial` (compatibility): For trivial M_X, the underlying diamond is X^♦_η with trivial log structure.

* API `LogDiamond.genericFibre_affine` (characterisation): For X = Spf(R) with fs chart P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a.

* Unit test `LogDiamond.genericFibre_point` (degenerate): For (Spf Z_p, trivial) the generic fibre is Spd Q_p with trivial log structure.

* Unit test `LogDiamond.genericFibre_disc` (computation): For (Spf Z_p⟨T⟩, T^N)^a the generic fibre is (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a.

* Unit test `LogDiamond.genericFibre_ok_nonsheafy` (characterisation): For p-complete R with bounded p^∞-torsion whose Spa(R[1/p], R^+) is not sheafy, (Spd(R[1/p], R^+), P)^a still exists as a log diamond.

* Unit test `LogDiamond.genericFibre_not_complement` (non-example): The log diamond generic fibre of (Spf Z_p⟨T⟩, T^N) is not the punctured disc: its underlying diamond contains T = 0; only its Kummer-étale cohomology sees the puncture.
-/

/-! ### Node `PR.8/stdisc-log-perfectoid` (definition): Strictly totally disconnected log perfectoid spaces

Not typed: rests on carriers outside the pinned libraries (DiamondsAndVStacks:D1).

* API `LogPerfectoid.IsStrictlyTotallyDisconnected` (other): The defining condition: X strictly totally disconnected, M_X saturated quasi-coherent, M_X/M_X^× uniquely divisible.

* API `LogPerfectoid.h1_units` (other): H^1_proét(X, Ô_X^×) = 0 for X strictly totally disconnected.

* API `LogPerfectoid.sections_surjective` (characterisation): Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective.

* API `LogPerfectoid.of_divisible` (constructor): (X, P)^a for P divisible saturated with P → Γ(X, Ô^+_X).

* API `LogPerfectoid.divisible_iff` (characterisation): It suffices that M_X be divisible (Remark 7.13).

* Unit test `LogPerfectoid.trivial` (degenerate): Any strictly totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected log perfectoid space.

* Unit test `LogPerfectoid.rational_monoid` (computation): For C algebraically closed, (Spa(C, O_C), Q_{≥0} → O_C, a ↦ p^a)^a is strictly totally disconnected log perfectoid.

* Unit test `LogPerfectoid.not_fs` (non-example): (Spa(C, O_C), N → O_C, 1 ↦ p)^a is not one: N is not divisible.

* Unit test `LogPerfectoid.compat_D1` (compatibility): The underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.
-/

/-! ### Node `PR.8/quasi-pro-kummer-etale-site` (definition): The quasi-pro-Kummer-étale site

Not typed: rests on carriers outside the pinned libraries (DiamondEtaleCohomology:C0, DiamondsAndVStacks:D4).

* API `QProKummerEtale.IsQPKet` (other): The quasi-pro-Kummer-étale condition on a map, with Kummer-étale and finite Kummer-étale variants.

* API `QProKummerEtale.site` (constructor): The site (Y, M_Y)_qpkét.

* API `QProKummerEtale.strict_iff` (characterisation): A strict map is quasi-pro-Kummer-étale iff its underlying map of diamonds is pro-étale in the quasi sense.

* API `QProKummerEtale.comp` (structure): Stability under composition and pullback; two-out-of-three.

* API `QProKummerEtale.pullbackSite` (functoriality): A map of saturated quasi-coherent log diamonds induces a morphism of sites.

* API `QProKummerEtale.trivialLog` (compatibility): For trivial log structures (Y, M_Y)_qpkét ≃ Y_qproét (DiamondEtaleCohomology C0).

* API `QProKummerEtale.cohomology` (constructor): RΓ_qpkét((Y, M_Y), Λ) for a condensed (discrete or profinite) coefficient ring.

* Unit test `QProKummerEtale.kummer_root` (computation): (Spd(Q_p⟨T^{1/n}⟩, Z_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N) is surjective finite Kummer-étale; over a strictly totally disconnected log perfectoid space its saturated pullback is n copies indexed by Z/n.

* Unit test `QProKummerEtale.trivial` (compatibility): With trivial log structures quasi-pro-Kummer-étale maps are quasi-pro-étale maps.

* Unit test `QProKummerEtale.id` (degenerate): Identity maps are quasi-pro-Kummer-étale coverings.

* Unit test `QProKummerEtale.not_strict_etale` (non-example): The Kummer map T ↦ T^n of log discs is Kummer-étale but its underlying map of diamonds is not étale at T = 0.
-/

/-! ### Node `PR.8/kummer-tower-covers` (theorem): Kummer towers and the comparison of sites

Statement: Let P be an fs monoid, P^{1/n} the monoid P with structure map a ↦ a^n, and P_{Q≥0} := colim_n P^{1/n}. (1) For n ≥ 1 and a saturated Q with P ⊂ Q ⊂ P^{1/n}, (Spd(Q_p⟨Q⟩, Z_p⟨Q⟩), Q) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective finite Kummer-étale. (2) (Spd(Q_p⟨P_{Q≥0}⟩, Z_p⟨P_{Q≥0}⟩), P_{Q≥0}) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective quasi-pro-Kummer-étale. (3) For a Huber pair (R, R^+) over (Q_p, Z_p) with P → R^+, the associated log diamond gives a morphism of sites (Spd(R, R^+), P)^a_qpkét → (Spec R, P)^a_két; if P is divisible saturated, (Spd(R, R^+), P)^a_qpkét ≅ Spd(R, R^+)_qproét and there is a morphism of sites to (Spec R)_ét. (4) For P fs and P_∞ divisible saturated over P, base change gives (Spec S)_ét → (Spec R, P)_két for the saturated base change (S, P_∞).
-/

/-! ### Node `PR.8/kummer-etale-vs-qpket` (theorem): Kummer-étale cohomology of log schemes via log diamonds

Statement: Let Λ be a torsion abelian group, R a p-complete ring with bounded p^∞-torsion, (R[1/p], R^+) the associated Huber pair and P → R a map from an fs monoid. The comparison map is an isomorphism RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ). Consequently, for a perfect prism (A, (d)), R p-complete over A/I with bounded p^∞-torsion and P → R fs, RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Z/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1} functorially (and for saturated P after defining the left side as a filtered colimit of fs cases).

Not typed: rests on carriers outside the pinned libraries (DiamondEtaleCohomology:C0).
-/

/-! ### Node `PR.8/global-etale-comparison` (theorem): The Kummer-étale comparison

Statement: Let (A, I = (d), M_0) be a bounded pre-log prism with (A, I) perfect and M_0 an fs monoid; (X_0, M_{X_0}) a smooth fs log p-adic formal scheme over (A/I, M_0) with X_0 qcqs and mod p fibre of (X_0, M_{X_0}) → (Spf A/I, M_0)^a of Cartier type (equivalently, saturated in Tsuji's sense); (A, I, M_A) a saturated pre-log prism whose associated log prism is perfect, with (A, M_0) → (A, Γ(Spf A, M_{Spf A})); and (X, M_X) the base change of (X_0, M_{X_0}) to (A/I, M_A) (also (X_i, M_{X_i}) to fs submonoids M_i ⊂ M_A containing the image of M_0; underlying formal schemes unchanged). Define RΓ_qpkét((X, M_X)^♦_η, Z/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, Z/p^m). Then there are functorial isomorphisms RΓ_qpkét((X, M_X)^♦_η, Z/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅ (RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}. If moreover A/I = O_C (C algebraically closed, A = A_inf) and X is proper, RΓ_qpkét((X, M_X)^♦_η, Z_p) := lim_m RΓ_qpkét(−, Z/p^m) is a perfect Z_p-complex with RΓ_qpkét ⊗^L_{Z_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭), and similarly mod p^m. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the log structure is trivial there.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.4, CrystallineCohomology:CR.5:log-algebra).
-/

/-! ### Node `PR.8/kummer-local-systems` (definition): Kummer-étale local systems

Not typed: rests on carriers outside the pinned libraries (DiamondEtaleCohomology:C0).

* API `KummerLocalSystem` (constructor): Loc_Λ(X, M_X): locally constant sheaves of pr^{-1}Λ-modules on (X, M_X)_qpkét.

* API `KummerLocalSystem.constant` (constructor): The constant local system pr^{-1}Λ^r.

* API `KummerLocalSystem.pullback` (functoriality): Pullback along maps of fs log diamonds.

* API `KummerLocalSystem.tensor` (structure): Tensor products and duals of local systems.

* API `KummerLocalSystem.trivialLog` (compatibility): For trivial log structure, Loc_{Z_p} agrees with quasi-pro-étale Z_p-local systems (Mann–Werner).

* Unit test `KummerLocalSystem.constant_rank` (computation): pr^{-1}Z_p^r is a Z_p-local system of rank r.

* Unit test `KummerLocalSystem.zero` (degenerate): The zero sheaf is the local system of rank 0.

* Unit test `KummerLocalSystem.kummer_torsor` (non-example): On the log disc the Kummer torsor of p-power roots of T is a Z_p(1)-local system that does not come from any local system on the underlying diamond of the disc (it is ramified along T = 0).

* Unit test `KummerLocalSystem.trivialLog_eq` (compatibility): With trivial log structure these are the quasi-pro-étale Z_p-local systems of Mann–Werner.
-/

/-! ### Node `PR.8/laurent-f-crystal` (definition): Laurent F-crystals on the absolute saturated log prismatic site

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.7).

* API `LaurentFCrystal` (constructor): The category Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}.

* API `LaurentFCrystal.unit` (example): The unit object O_Δ[1/I]^∧_p with its Frobenius.

* API `LaurentFCrystal.tensor` (structure): Tensor products and duals.

* API `LaurentFCrystal.pullback` (functoriality): Pullback along maps of bounded fs log p-adic formal schemes.

* API `LaurentFCrystal.descent` (characterisation): Vect(…)^{φ=1} ≃ lim_{(A,I,M_A)} Vect(A[1/I]^∧_p)^{φ_A=1} over the absolute saturated site (Drinfeld–Mathew).

* API `LaurentFCrystal.etaleRealisation` (projection): The étale realisation F ↦ F_ét to Loc_{Z_p}((X, M_X)^♦_η) (from Theorem 7.36).

* Unit test `LaurentFCrystal.unit_realisation` (computation): The étale realisation of the unit O_Δ[1/I]^∧_p is the constant local system Z_p.

* Unit test `LaurentFCrystal.trivialLog` (compatibility): For trivial log structure the category agrees with PR.7's Laurent F-crystals (BS F-crystals Definition 3.2).

* Unit test `LaurentFCrystal.zero` (degenerate): The zero crystal is a Laurent F-crystal of rank 0.

* Unit test `LaurentFCrystal.not_F_crystal` (non-example): A vector-bundle crystal E over O_Δ (not O_Δ[1/I]) with φ^*E[1/I] ≅ E[1/I] is a prismatic F-crystal, not a Laurent F-crystal: inverting I is part of the definition.
-/

/-! ### Node `PR.8/laurent-f-crystals-local-systems` (theorem): Laurent F-crystals and Kummer-étale local systems

Statement: Let (X, M_X) be a bounded fs log p-adic formal scheme with log diamond generic fibre (X, M_X)^♦_η. There is a natural equivalence Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ Loc_{Z_p}((X, M_X)^♦_η), and more generally D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ D^(b)((X, M_X)^♦_η, Z_p); the unit O_Δ corresponds to the constant sheaf Z_p.

Not typed: rests on carriers outside the pinned libraries (PrismaticCohomology:PR.7).
-/

/-! ### Node `PR.8/smooth-proper-pushforward` (theorem): Smooth proper pushforward of Kummer-étale local systems

Statement: Let f: (X, M_X) → (Y, M_Y) be a smooth (Koshikawa's sense) proper map of bounded fs log p-adic formal schemes. Then Rf_*O_Δ is an F-crystal of perfect complexes on (Y, M_Y)_Δ and there is a natural isomorphism (Rf_*O_Δ)_ét ≅ Rf_{η*}Z_p for f_η: (X, M_X)^♦_η → (Y, M_Y)^♦_η; in particular Rf_{η*}Z_p is locally constant with perfect fibres and commutes with base change (Z, M_Z) → (Y, M_Y).
-/

/-! ### Node `PR.8/etale-comparison-over-ainf` (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)]

Statement: Let C be algebraically closed with A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1; (X_0, M_{X_0}) an fs log p-adic formal scheme smooth and proper over (Spf O_C, M_0)^a with mod p fibre of Cartier type, base changed to (X, M_X) over a perfect log prism (A_inf, (ξ), M_A) receiving M_0; M := RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X, M_X)^♦_η, Z_p). Then for every i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗_{Z_p} A_inf[1/φ^{-1}(μ)].

Not typed: rests on carriers outside the pinned libraries (AInfCohomology:AI.0).
-/

/-! ### Node `PR.8/log-hyodo-kato-isomorphism` (theorem): Hyodo–Kato isomorphism for log prismatic cohomology over A_crys

Statement: In the setting of the étale comparison over A_inf, let (A_crys, (p), M_crys) be the log prism associated with M_0 → A_inf → A_crys and (X_0, M_{X_0})_{O_C/p} the base change along Spec(O_C/p, M_crys)^a → Spf(O_C, M_0)^a. (1) φ^*RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ⊗^L_{A_inf} A_crys ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys)) Frobenius-equivariantly, and Frobenius is an isomorphism after inverting p. (2) Let k = O_C/m, (k, N) the log ring associated with (k, M_0) and (Y, M_Y) the base change of (X_0, M_{X_0}) to (k, N). For a section k → O_C/p, RΓ_crys((Y, M_Y)/(W(k), N)) ⊗^L_{W(k)} A_crys[1/p] ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))[1/p]; hence each H^i(M ⊗^L_{A_inf,φ} A_crys[1/p]) is a finite free A_crys[1/p]-module.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.6, AInfCohomology:AI.0).
-/

/-! ### Node `PR.8/log-prismatic-bkf-module` (theorem): Log prismatic cohomology groups are Breuil–Kisin–Fargues modules

Statement: In the setting of the étale comparison over A_inf (X proper over O_C, mod p fibre of Cartier type, perfect log prism base over A_inf), for every i the Frobenius-twisted cohomology φ^*H^i_Δ = H^i_Δ ⊗_{A_inf,φ} A_inf with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented A_inf-module N, free after inverting p, with a φ-linear φ_N inducing N[1/ξ] ≅ N[1/φ(ξ)]. Moreover H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗ A_inf[1/φ^{-1}(μ)].

Not typed: rests on carriers outside the pinned libraries (AInfCohomology:AI.2).
-/

/-! ### Node `PR.8/semistable-chart-application` (application): Log prismatic cohomology of the standard semistable chart

Statement: Let O_K be totally ramified over W(k) with uniformiser π and R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤ r ≤ d) with the canonical log structure given by the chart P = N^r → R, e_j ↦ x_j (j ≤ r), over (O_K, N → O_K, 1 ↦ π) via the diagonal 1 ↦ e_1 + ⋯ + e_r (the standard semistable chart of CR.5, with its actual monoid map recording π). Then: (1) (Spf R, P)^a is smooth of Cartier type over (O_K, N) in Koshikawa's sense, hence over the Breuil–Kisin prelog prism (W(k)[[u]], (E), N → u) via O_K = W(k)[[u]]/(E); (2) H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}, a free R-module of rank (d − 1 choose i) with basis the wedge products of dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1 = −Σ_{j=2}^r dlog x_j); (3) the crystalline comparison over (W(k), (p), N → 0), after u ↦ 0, computes the Hyodo–Kato log crystalline cohomology of the special fibre (Spec k[x_1, …, x_d]/(x_1⋯x_r), N^r)^a; (4) the de Rham comparison gives Ω^•_{(R,P)/(O_K,N)}; (5) base change along u ↦ [π♭] gives the A_inf log prismatic cohomology of R_{O_C}, whose Frobenius twist is ČK's AΩ (semistable-aomega-comparison, on the overlap with AI.6); (6) the Kummer-étale comparison over a perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale cohomology because x_1, …, x_r are units on R[1/p], so the log structure is trivial there.

Not typed: rests on carriers outside the pinned libraries (CrystallineCohomology:CR.5, CrystallineCohomology:CR.6, AInfCohomology:AI.6).
-/

end TauCeti.LogPrismatic
