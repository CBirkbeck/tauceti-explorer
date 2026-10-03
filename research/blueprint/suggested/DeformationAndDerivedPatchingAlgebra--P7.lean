import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Order.Interval.Set.Infinite
import Mathlib.Data.Nat.Choose.Cast
import Mathlib.RingTheory.MvPowerSeries.NoZeroDivisors
import Mathlib.Algebra.Field.ZMod
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.LocalRing.Length
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Algebra.Category.ModuleCat.AB
import Mathlib.Algebra.Homology.HomologicalComplexLimits
import Mathlib.Algebra.Homology.Embedding.StupidTrunc
import Mathlib.Algebra.Homology.HomotopyCategory.HomComplexCohomology
import Mathlib.Algebra.Homology.DerivedCategory.KProjective
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.HomologicalComplexBiprod
import Mathlib.Algebra.Homology.Single
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.Artinian.Module
import Mathlib.RingTheory.DedekindDomain.IntegralClosure
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.FiniteLength
import Mathlib.RingTheory.Finiteness.Cardinality
import Mathlib.RingTheory.IntegralClosure.IsIntegralClosure.Basic
import Mathlib.RingTheory.KrullDimension.Basic
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.RingHom.Basic
import Mathlib.RingTheory.Nilpotent.Lemmas
import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Ideal.KrullsHeightTheorem
import Mathlib.RingTheory.KrullDimension.NonZeroDivisors
import Mathlib.RingTheory.LocalRing.Module
import Mathlib.RingTheory.Polynomial.HilbertPoly
import Mathlib.RingTheory.KrullDimension.Module
import Mathlib.RingTheory.Finiteness.Ideal
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Order
import Mathlib.RingTheory.MvPowerSeries.NoZeroDivisors
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.LinearAlgebra.Finsupp.VectorSpace
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RingTheory.Support
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Data.ENat.Basic
import Mathlib.Analysis.Polynomial.Basic
import Mathlib.RingTheory.Nakayama
import Mathlib.Order.Filter.AtTopBot.Archimedean
import Mathlib.RingTheory.ReesAlgebra
import Mathlib.RingTheory.Filtration
import Mathlib.Algebra.DirectSum.Module
import Mathlib.RingTheory.Ideal.Quotient.PowTransition
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.Algebra.Module.GradedModule
import Mathlib.Algebra.Module.Submodule.Equiv

/-!
# Suggested forms for prime filtrations and characteristic-zero points

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md` is definitive.
These forms let contributors and reviewers converge on names and signatures.
They introduce no new prime-filtration carrier, theorem or implementation claim.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The previous file elaborated with placeholder-proof warnings only against the
existing Mathlib build at the pin (Codex codex-J6LwjP, 2 October 2026).
That historical receipt covers neither codex-rtOQ9t's positivity continuation
nor codex-a71f92's cumulative continuation.
The current full-file elaboration receipt is in the handoff.
No Tau Ceti module is imported; its baseline references were inspected as source.
The original ten baseline examples are retained. Five new signatures and four
algebraic regressions cover the R03.4 point strand, not the eight-stage part.
-/

#check Submodule.IsQuotientEquivQuotientPrime
#check Submodule.isQuotientEquivQuotientPrime_iff
#check IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
#check IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime
#check associatedPrimes.finite

#check IsDiscreteValuationRing.irreducible_iff_uniformizer
#check IsDiscreteValuationRing.iff_pid_with_one_nonzero_prime
#check IsDiscreteValuationRing.exists_irreducible
#check IsDiscreteValuationRing.length_quotient_pow_maximalIdeal
#check Module.length_ne_top_iff
#check isFiniteLength_iff_isNoetherian_isArtinian
#check isArtinian_of_tower
#check IsArtinianRing.of_finite
#check IsArtinianRing.isMaximal_of_isPrime
#check Ring.krullDimLE_zero_iff
#check Ring.krullDimLE_iff
#check nilpotent_iff_mem_prime
#check Algebra.finite_iff_isIntegral_and_finiteType
#check IsAlgClosed.lift
#check Module.Finite.exists_fin'
#check Algebra.IsIntegral.inv_mem
#check IsIntegralClosure.finite
#check integralClosure.isIntegral
#check Algebra.IsIntegral.tower_top
#check RingHom.IsIntegral.isLocalHom
#check IsLocalHom.of_surjective
#check RingHom.isLocalHom_comp

universe u v

section BaselineReuse

variable (R : Type u) [CommRing R] [IsNoetherianRing R]
variable (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M]

/-- Direct use of the existing filtration; this is not a replacement definition. -/
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := R) (M := M) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime R M

/-- The quotient in a step is taken inside the upper submodule. -/
example {N₁ N₂ : Submodule R M}
    (h : N₁.IsQuotientEquivQuotientPrime N₂) :
    N₁ ≤ N₂ ∧ ∃ p : PrimeSpectrum R,
      Nonempty ((↥N₂ ⧸ N₁.submoduleOf N₂) ≃ₗ[R] R ⧸ p.1) := by
  exact h

/-- The actual induction interface. The motive is a hypothesis supplied by a
consumer, not an opaque mathematical definition. -/
example
    {motive : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → Prop}
    (hzero : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → [Subsingleton N] → motive N)
    (hprime : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → (p : PrimeSpectrum R) →
      (N ≃ₗ[R] R ⧸ p.1) → motive N)
    (hext : (N₁ : Type v) → [AddCommGroup N₁] → [Module R N₁] →
      [Module.Finite R N₁] →
      (N₂ : Type v) → [AddCommGroup N₂] → [Module R N₂] →
      [Module.Finite R N₂] →
      (N₃ : Type v) → [AddCommGroup N₃] → [Module R N₃] →
      [Module.Finite R N₃] →
      (f : N₁ →ₗ[R] N₂) → (g : N₂ →ₗ[R] N₃) →
      Function.Injective f → Function.Surjective g → Function.Exact f g →
      motive N₁ → motive N₃ → motive N₂) : motive M := by
  exact IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime (motive := motive) R
    (inferInstance : Module.Finite R M) hzero hprime hext

end BaselineReuse

/-! ## Regression examples using actual module carriers -/

-- Zero module: no prime need be chosen before the zero case.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ℤ) (M := Fin 0 → ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    ℤ (Fin 0 → ℤ)

-- Finite generation is not finiteness of the underlying set or finite length.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ ℤ

-- Repeated residue-characteristic factors are allowed.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ZMod 4) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ (ZMod 4)

-- Two explicit steps in the nonsplit Z/4 filtration.
example :
    Submodule.IsQuotientEquivQuotientPrime
      (⊥ : Submodule ℤ (ZMod 4))
      (Submodule.span ℤ ({2} : Set (ZMod 4))) := by
  sorry

example :
    Submodule.IsQuotientEquivQuotientPrime
      (Submodule.span ℤ ({2} : Set (ZMod 4)))
      (⊤ : Submodule ℤ (ZMod 4)) := by
  sorry

-- No homomorphism from Z/2 can lift the nonzero residue class to an odd element.
-- This rules out a linear splitting of the canonical projection Z/4 -> Z/2.
example (f : ZMod 2 →ₗ[ℤ] ZMod 4) : f 1 ≠ 1 ∧ f 1 ≠ 3 := by
  sorry

-- The zero ring is permitted; every finite free module over it is zero.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ZMod 1) (M := Fin 2 → ZMod 1) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    (ZMod 1) (Fin 2 → ZMod 1)

/-!
## Characteristic-zero-point strand of R03.4

Five proposed signatures, matching the five new packet nodes. These are not
compiled here. They use actual ideals, quotient rings, intermediate fields
and integral closures; no structure stores the desired point theorem.
The local-field/topology transport and framed-lifting theorem are recorded
as separate open owner interfaces in the packet and reader.
-/


namespace TauCeti.FiniteLocalAlgebra

/-- R03.4/nilpotent-uniformizer-artinian. No finite-residue-field assumption. -/
theorem isArtinian_of_nilpotent_uniformizer
    {O A : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CommRing A] [Algebra O A] [Module.Finite O A]
    (π : O) (hπ : Irreducible π)
    (h : IsNilpotent (algebraMap O A π)) : IsArtinianRing A := by
  sorry

/-- R03.4/generic-prime-coefficient-injection. A itself need not be finite. -/
theorem quotient_coefficient_injective
    {O A : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CommRing A] [Algebra O A]
    (π : O) (hπ : Irreducible π) (q : Ideal A) [q.IsPrime]
    (hq : algebraMap O A π ∉ q) :
    Function.Injective (algebraMap O (A ⧸ q)) := by
  sorry

/-- R03.4/algebraic-point-of-generic-prime. The injective map is on A/q,
not on A; the source proof of IsAlgClosed.lift gives its fraction-field factorization. -/
theorem exists_algebraic_point_with_kernel
    {O A Ω : Type*} [CommRing O] [IsDomain O]
    [CommRing A] [Algebra O A] [Module.Finite O A]
    [Field Ω] [Algebra O Ω] [IsAlgClosed Ω]
    (hΩ : Function.Injective (algebraMap O Ω))
    (q : Ideal A) [q.IsPrime]
    (hq : Function.Injective (algebraMap O (A ⧸ q))) :
    ∃ f : A →ₐ[O] Ω, RingHom.ker f.toRingHom = q := by
  sorry

/-- R03.4/finite-field-of-point-values. The field carrier is the existing adjoin. -/
theorem finite_field_of_point_values
    {O K A Ω : Type*} [CommRing O] [Field K] [Field Ω]
    [Algebra O K] [Algebra K Ω] [Algebra O Ω] [IsScalarTower O K Ω]
    [CommRing A] [Algebra O A] [Module.Finite O A]
    (f : A →ₐ[O] Ω) :
    Module.Finite K (IntermediateField.adjoin K (Set.range f)) := by
  sorry

/-- R03.4/characteristic-zero-points-from-finiteness-and-dimension.
The source's integrated node ID is retained. This is its algebraic core.
IsLocalHom means unit reflection; without a complete base the target is not
asserted to be a local ring. The complete local-field interpretation and its
continuity require the recorded Layer 0 comparison. The target residue field
is not fixed by this statement. -/
theorem exists_finite_integral_point
    {O K A Ω : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [Field Ω] [Algebra K Ω] [Algebra O Ω] [IsScalarTower O K Ω] [IsAlgClosed Ω]
    [CommRing A] [Algebra O A] [Module.Finite O A] [IsLocalRing A]
    (hdim : 1 ≤ ringKrullDim A) :
    ∃ E : IntermediateField K Ω,
      Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : A →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-! Algebraic regressions, not substitutes for the integral-point signatures. -/

/-- Prime avoidance here is direct reuse of the nilradical theorem, not new theory. -/
example {R : Type*} [CommRing R] (x : R) (hx : ¬ IsNilpotent x) :
    ∃ q : Ideal R, q.IsPrime ∧ x ∉ q := by
  sorry

/-- A torsion coefficient ring has no unital map into characteristic zero. -/
example {S : Type*} [CommRing S] [CharZero S] (f : ZMod 4 →+* S) : False := by
  sorry

/-- The residue obstruction for Z_3[t]/(t^2-18). The reader proves why t/3
is an integral unit in any target field and why this residue test applies. -/
example : ¬ ∃ x : ZMod 3, x ^ 2 = 2 := by
  sorry

/-- The two branch evaluations are distinct before reducing modulo pi. -/
example {O : Type*} [CommRing O] (π : O) (hπ : π ≠ 0) :
    (0 : O) ^ 2 - π * 0 = 0 ∧ π ^ 2 - π * π = 0 ∧ (0 : O) ≠ π := by
  sorry

end TauCeti.FiniteLocalAlgebra

/-! ## R03.3: catenarity and freeness over a regular local base

Two statements of layer R03.3 that layer R03.6 consumes (its requests to R03.3). Catenarity is
Stacks Definition 10.105.1 (tag 00NI), stated on the poset `PrimeSpectrum R`; a *saturated*
chain is an `LTSeries` each of whose steps is a covering relation `⋖`. The pinned Mathlib has no
catenary predicate. Depth is stated, as in R03.6, by an `M`-regular sequence in the maximal ideal
of length `ringKrullDim A`, because the pinned Mathlib has no module depth. -/

namespace Ring

/-- **`R03.3/catenary`** (Stacks 00NI). `R` is catenary if for all primes `p ≤ q` the lengths of
the chains of primes from `p` to `q` are bounded, and any two saturated chains from `p` to `q`
have the same length. -/
def IsCatenary (R : Type*) [CommRing R] : Prop :=
  ∀ p q : PrimeSpectrum R, p ≤ q →
    (∃ n : ℕ, ∀ s : LTSeries (PrimeSpectrum R), s.head = p → s.last = q → s.length ≤ n) ∧
    ∀ s t : LTSeries (PrimeSpectrum R), s.head = p → s.last = q → t.head = p → t.last = q →
      (∀ i : Fin s.length, s (Fin.castSucc i) ⋖ s i.succ) →
      (∀ i : Fin t.length, t (Fin.castSucc i) ⋖ t i.succ) → s.length = t.length

/-- API: catenarity is invariant under ring isomorphisms. -/
theorem IsCatenary.of_ringEquiv {R S : Type*} [CommRing R] [CommRing S] (e : R ≃+* S)
    (h : IsCatenary R) : IsCatenary S := sorry

/-- API (Stacks 00NK): a quotient of a catenary ring is catenary. -/
theorem IsCatenary.quotient {R : Type*} [CommRing R] (I : Ideal R) (h : IsCatenary R) :
    IsCatenary (R ⧸ I) := sorry

/-- API (Stacks 00NJ): a localization of a catenary ring is catenary. -/
theorem IsCatenary.localization {R : Type*} [CommRing R] (S : Submonoid R)
    (L : Type*) [CommRing L] [Algebra R L] [IsLocalization S L] (h : IsCatenary R) :
    IsCatenary L := sorry

/-- API: a ring of Krull dimension at most one is catenary; every chain has length at most one. -/
theorem isCatenary_of_ringKrullDim_le_one {R : Type*} [CommRing R] (h : ringKrullDim R ≤ 1) :
    IsCatenary R := sorry

/-- **`R03.3/catenary-iff-dimension-function`** (Stacks Lemma 10.105.10, tag 0ECF). A Noetherian
local ring is catenary iff `p ↦ dim A/p` drops by exactly one along every covering relation of
primes. The right-hand side is the hypothesis `hcat` of R03.6's
`Module.NearlyFaithful.of_quotient_of_isSMulRegular`. -/
theorem isCatenary_iff_ringKrullDim_quotient_covBy (A : Type*) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] :
    IsCatenary A ↔ ∀ p q : PrimeSpectrum A, p ⋖ q →
      ringKrullDim (A ⧸ p.asIdeal) = ringKrullDim (A ⧸ q.asIdeal) + 1 := sorry

end Ring

/-- **`R03.3/free-of-maximal-depth-regular-local`** (Stacks Lemma 10.106.6, tag 00NT; the case
`e = d` of Proposition 10.110.1, tag 00O7). A finite module of maximal depth over a regular local
ring is free. -/
theorem Module.free_of_isRegular_of_isRegularLocalRing {A M : Type*} [CommRing A]
    [IsRegularLocalRing A] [AddCommGroup M] [Module A M] [Module.Finite A M] (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) :
    Module.Free A M := sorry

namespace SuggestedTest.Catenary

/-- Unit test: a field is catenary. -/
example (k : Type*) [Field k] : Ring.IsCatenary k := sorry

/-- Unit test: `ℤ` is catenary. -/
example : Ring.IsCatenary ℤ := sorry

/-- Unit test, pinning the word *saturated*: `k[x, y]` is catenary, although its chains
`0 ⊂ (x, y)` and `0 ⊂ (x) ⊂ (x, y)` have different lengths. -/
example (k : Type*) [Field k] : Ring.IsCatenary (MvPolynomial (Fin 2) k) := sorry

/-- Unit test, pinning the equal-length clause (Stacks 02JE, Nagata): some Noetherian local
domain is not catenary. -/
example : ∃ (A : Type) (_ : CommRing A), IsLocalRing A ∧ IsNoetherianRing A ∧ IsDomain A ∧
    ¬ Ring.IsCatenary A := sorry

/-- Acceptance for `R03.3/free-of-maximal-depth-regular-local`: the regular-local hypothesis is
needed. Over the dual numbers `k[ε]` (dimension zero), the module `k = k[ε]/(ε)` has maximal
depth (the empty sequence) but is not free. -/
example (k : Type*) [Field k] :
    ¬ Module.Free (DualNumber k) (DualNumber k ⧸ Ideal.span {(DualNumber.eps : DualNumber k)}) :=
  sorry

end SuggestedTest.Catenary


/-!
## R03.3: general Hilbert–Samuel strand (Codex — codex-a71f92, 2026-10-02)

The reader's Section 5b is definitive. These additions now elaborate with placeholder proofs at the Mathlib pin.
The current receipt covers the complete file; earlier receipts remain historical.
The actual associated-graded bridge, Hilbert–Serre induction, degree/dimension
and Artin–Rees comparison remain explicit packet gaps. A polynomial supplied
as a hypothesis is not used as a replacement definition of multiplicity.

The raw function takes values in ENat. The polynomial constructor chooses
from an unproved theorem on the actual module quotients, not from a structure
which postulates all the desired results. The rational multiplicity is proved
integral only by the separate theorem. All suggested proofs remain unchecked.
-/

namespace TauCeti.HilbertSamuel

open scoped Pointwise
open Polynomial

variable {A : Type u} [CommRing A]
variable {M : Type v} [AddCommGroup M] [Module A M]

/-- R03.3/hilbert-samuel-function: cumulative n+1 indexing, extended length. -/
noncomputable def function (q : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M)))

theorem function_eq_length (q : Ideal A) (n : ℕ) :
    function (M := M) q n =
      Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M))) := by
  rfl

theorem function_zero [Subsingleton M] (q : Ideal A) (n : ℕ) :
    function (M := M) q n = 0 := by sorry

theorem function_congr {N : Type*} [AddCommGroup N] [Module A N]
    (e : M ≃ₗ[A] N) (q : Ideal A) (n : ℕ) :
    function (M := M) q n = function (M := N) q n := by sorry

theorem function_top (n : ℕ) :
    function (M := M) (⊤ : Ideal A) n = 0 := by sorry

section FiniteLocal

variable [IsNoetherianRing A] [IsLocalRing A] [Module.Finite A M]

/-- R03.3/finite-length-of-maximal-power-annihilation. -/
theorem finite_length_of_maximal_power (r : ℕ)
    (h : IsLocalRing.maximalIdeal A ^ r • (⊤ : Submodule A M) = ⊥) :
    Module.length A M ≠ ⊤ := by sorry

/-- R03.3/finite-adic-quotient-length; this justifies later toNat calls. -/
theorem function_ne_top (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (n : ℕ) :
    function (M := M) q n ≠ ⊤ := by sorry

/-- R03.3/eventual-hilbert-samuel-polynomial.
This is not Polynomial.existsUnique_hilbertPoly, which starts with a series.
The cumulative bridge is specified below, but the associated-graded ring/module
and graded polynomial-existence input remain explicit packet gaps. -/
theorem existsUnique_polynomial (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    ∃! p : Polynomial ℚ, ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      p.eval (n : ℚ) = ((function (M := M) q n).toNat : ℚ) := by sorry

/-- R03.3/hilbert-samuel-polynomial: no extra polynomial datum from a caller. -/
noncomputable def polynomial (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) : Polynomial ℚ :=
  Classical.choose (existsUnique_polynomial (M := M) q hq).exists

theorem polynomial_eventually (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      (polynomial (M := M) q hq).eval (n : ℚ) =
        ((function (M := M) q n).toNat : ℚ) := by sorry

theorem polynomial_unique (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (p : Polynomial ℚ)
    (hp : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      p.eval (n : ℚ) = ((function (M := M) q n).toNat : ℚ)) :
    p = polynomial (M := M) q hq := by sorry

theorem polynomial_zero [Subsingleton M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    polynomial (M := M) q hq = 0 := by sorry

theorem polynomial_congr {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    (e : M ≃ₗ[A] N) (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    polynomial (M := M) q hq = polynomial (M := N) q hq := by sorry

/-- R03.3/hilbert-samuel-degree: the zero module is deliberately excluded. -/
theorem polynomial_degree [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    polynomial (M := M) q hq ≠ 0 ∧
      Module.supportDim A M =
        ((polynomial (M := M) q hq).natDegree : WithBot ℕ∞) := by sorry

/-- Reserved key/hilbert-samuel-multiplicity: intrinsic module dimension.
leadingCoeff 0 = 0, so the zero-module value is genuinely zero. -/
noncomputable def multiplicity (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) : ℚ :=
  ((polynomial (M := M) q hq).natDegree.factorial : ℚ) *
    (polynomial (M := M) q hq).leadingCoeff

/-- R03.3/degree-indexed-multiplicity.
The meaningful multiplicity API requires a dimension upper bound. -/
noncomputable def multiplicityInDegree (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ) : ℚ :=
  (d.factorial : ℚ) * (polynomial (M := M) q hq).coeff d

theorem multiplicity_zero [Subsingleton M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    multiplicity (M := M) q hq = 0 := by sorry

theorem multiplicity_eq_factorial_leadingCoeff (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    multiplicity (M := M) q hq =
      ((polynomial (M := M) q hq).natDegree.factorial : ℚ) *
        (polynomial (M := M) q hq).leadingCoeff := by rfl

theorem multiplicity_congr {N : Type*} [AddCommGroup N] [Module A N] [Module.Finite A N]
    (e : M ≃ₗ[A] N) (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    multiplicity (M := M) q hq = multiplicity (M := N) q hq := by sorry

/-- R03.3/intrinsic-ambient-normalization, equal-dimension clause. -/
theorem multiplicity_eq_inDegree [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ)
    (hd : Module.supportDim A M = (d : WithBot ℕ∞)) :
    multiplicity (M := M) q hq =
      multiplicityInDegree (M := M) q hq d := by sorry

theorem multiplicityInDegree_zero [Subsingleton M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ) :
    multiplicityInDegree (M := M) q hq d = 0 := by sorry

theorem multiplicityInDegree_eq_coeff (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ) :
    multiplicityInDegree (M := M) q hq d =
      (d.factorial : ℚ) * (polynomial (M := M) q hq).coeff d := by rfl

/-- Degree-indexed extractor API; meaningful regardless of whether M is zero. -/
theorem multiplicityInDegree_eq_zero_of_lt (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ)
    (hd : (polynomial (M := M) q hq).natDegree < d) :
    multiplicityInDegree (M := M) q hq d = 0 := by sorry

/-- R03.3/intrinsic-ambient-normalization, higher-dimension clause. -/
theorem ambient_zero_of_lower_dimension (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (D : ℕ)
    (hd : Module.supportDim A M < (D : WithBot ℕ∞)) :
    multiplicityInDegree (M := M) q hq D = 0 := by sorry

/-- R03.3/multiplicity-positive-integer. -/
theorem multiplicity_pos_integral [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    ∃ e : ℕ, 0 < e ∧ multiplicity (M := M) q hq = (e : ℚ) := by sorry

/-- R03.3/multiplicity-powers: positive powers only, with the actual support dimension. -/
theorem multiplicity_pow [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (s : ℕ) (hs : 0 < s)
    (hqs : (q ^ s).radical = IsLocalRing.maximalIdeal A) (d : ℕ)
    (hd : Module.supportDim A M = (d : WithBot ℕ∞)) :
    multiplicity (M := M) (q ^ s) hqs =
      (s : ℚ) ^ d * multiplicity (M := M) q hq := by sorry

/-- R03.3/dimension-normalized-additivity.
The original maps are exact; their q-adic quotient maps need not be exact. -/
theorem multiplicityInDegree_additive
    {M₁ M₃ : Type*} [AddCommGroup M₁] [Module A M₁] [Module.Finite A M₁]
    [AddCommGroup M₃] [Module A M₃] [Module.Finite A M₃]
    (f : M₁ →ₗ[A] M) (g : M →ₗ[A] M₃)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hex : Function.Exact f g)
    (q : Ideal A) (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ)
    (hd : Module.supportDim A M ≤ (d : WithBot ℕ∞)) :
    multiplicityInDegree (M := M) q hq d =
      multiplicityInDegree (M := M₁) q hq d +
        multiplicityInDegree (M := M₃) q hq d := by sorry

/-- Canonical quotient-locality adapter from the pinned surjective-map theorem. -/
local instance primeQuotientLocal (p : PrimeSpectrum A) : IsLocalRing (A ⧸ p.asIdeal) :=
  IsLocalRing.of_surjective' (Ideal.Quotient.mk p.asIdeal) Ideal.Quotient.mk_surjective

/-- R03.3/multiplicity-associativity.
P enumerates the actual top-dimensional support primes. The quotient-ideal
proofs and finite localized-length proofs are conclusions of the missing
localization adapter; they are not private substitute module carriers.
The signature is intentionally explicit in those quotient-ideal proof arguments. -/
theorem multiplicityInDegree_associativity
    (q : Ideal A) (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ)
    (hd : Module.supportDim A M ≤ (d : WithBot ℕ∞))
    (P : Finset (PrimeSpectrum A))
    (hP : ∀ p : PrimeSpectrum A, p ∈ P ↔
      p ∈ Module.support A M ∧ ringKrullDim (A ⧸ p.asIdeal) = (d : WithBot ℕ∞))
    (hqP : ∀ p : PrimeSpectrum A, p ∈ P →
      (q.map (Ideal.Quotient.mk p.asIdeal)).radical =
        IsLocalRing.maximalIdeal (A ⧸ p.asIdeal)) :
    multiplicityInDegree (M := M) q hq d =
      ∑ p ∈ P.attach, ((Module.length (Localization.AtPrime p.1.asIdeal)
        (LocalizedModule p.1.asIdeal.primeCompl M)).toNat : ℚ) *
        multiplicityInDegree (A := A ⧸ p.1.asIdeal) (M := A ⧸ p.1.asIdeal)
          (q.map (Ideal.Quotient.mk p.1.asIdeal)) (hqP p.1 p.2) d := by sorry

end FiniteLocal

/-- R03.3/top-coefficient-finite-difference: ordinary rational polynomial algebra. -/
theorem top_coefficient_finite_difference (p : Polynomial ℚ) (d : ℕ)
    (hd : p.natDegree ≤ d) (t : ℚ) :
    ∑ i ∈ Finset.range (d + 1), (-1 : ℚ) ^ i * (Nat.choose d i : ℚ) *
      p.eval (t - (i : ℚ)) = (d.factorial : ℚ) * p.coeff d := by sorry

end TauCeti.HilbertSamuel

namespace HilbertSamuelTest

open TauCeti.HilbertSamuel Polynomial
open scoped Pointwise

-- test: HilbertSamuelTest.function_field_rank
example (k : Type*) [Field k] (r n : ℕ) :
    function (M := Fin r → k) (⊥ : Ideal k) n = r := by sorry

-- test: HilbertSamuelTest.function_dvr_power
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (s : ℕ) (hs : 0 < s) (n : ℕ) :
    function (M := O) (IsLocalRing.maximalIdeal O ^ s) n = s * (n + 1) := by sorry

-- test: HilbertSamuelTest.function_infinite
example (n : ℕ) : function (M := ℤ) (⊥ : Ideal ℤ) n = ⊤ := by sorry

-- test: HilbertSamuelTest.function_zero
example (A : Type*) [CommRing A] (q : Ideal A) (n : ℕ) :
    function (M := Fin 0 → A) q n = 0 := by sorry

-- test: HilbertSamuelTest.polynomial_field
example (k : Type*) [Field k] (r : ℕ)
    (hq : (⊥ : Ideal k).radical = IsLocalRing.maximalIdeal k) :
    polynomial (M := Fin r → k) (⊥ : Ideal k) hq = C (r : ℚ) := by sorry

-- test: HilbertSamuelTest.polynomial_dvr
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsNoetherianRing O] (s : ℕ) (hs : 0 < s)
    (hq : (IsLocalRing.maximalIdeal O ^ s).radical = IsLocalRing.maximalIdeal O) :
    polynomial (M := O) (IsLocalRing.maximalIdeal O ^ s) hq =
      C (s : ℚ) * (X + 1) := by sorry

/-- Actual formal-series quotient for the embedded-prime regression, not an opaque ring. -/
abbrev EmbeddedRing (k : Type*) [Field k] :=
  MvPowerSeries (Fin 2) k ⧸ Ideal.span
    {MvPowerSeries.X 0 * MvPowerSeries.X 1,
      (MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k) ^ 2}

-- test: HilbertSamuelTest.polynomial_embedded
example (k : Type*) [Field k] [IsNoetherianRing (EmbeddedRing k)]
    [IsLocalRing (EmbeddedRing k)]
    (hq : (IsLocalRing.maximalIdeal (EmbeddedRing k)).radical =
      IsLocalRing.maximalIdeal (EmbeddedRing k)) :
    polynomial (M := EmbeddedRing k) _ hq = X + C 2 ∧
      function (M := EmbeddedRing k) (IsLocalRing.maximalIdeal (EmbeddedRing k)) 0 = 1 ∧
      (polynomial (M := EmbeddedRing k) _ hq).eval 0 = 2 := by sorry

-- test: HilbertSamuelTest.polynomial_zero
example (A : Type*) [CommRing A] [IsNoetherianRing A] [IsLocalRing A]
    (q : Ideal A) (hq : q.radical = IsLocalRing.maximalIdeal A) :
    polynomial (M := Fin 0 → A) q hq = 0 ∧
      (polynomial (M := Fin 0 → A) q hq).degree = ⊥ := by sorry

-- test: HilbertSamuelTest.multiplicity_field
example (k : Type*) [Field k] (r : ℕ)
    (hq : (⊥ : Ideal k).radical = IsLocalRing.maximalIdeal k) :
    multiplicity (M := Fin r → k) (⊥ : Ideal k) hq = (r : ℚ) := by sorry

-- test: HilbertSamuelTest.multiplicity_dvr_power
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsNoetherianRing O] (s : ℕ) (hs : 0 < s)
    (hq : (IsLocalRing.maximalIdeal O ^ s).radical = IsLocalRing.maximalIdeal O) :
    multiplicity (M := O) (IsLocalRing.maximalIdeal O ^ s) hq = (s : ℚ) := by sorry

-- test: HilbertSamuelTest.multiplicity_residue
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsNoetherianRing O]
    (hq : (IsLocalRing.maximalIdeal O).radical = IsLocalRing.maximalIdeal O) :
    multiplicity (M := O ⧸ IsLocalRing.maximalIdeal O) _ hq = 1 := by sorry

-- test: HilbertSamuelTest.multiplicity_embedded
example (k : Type*) [Field k] [IsNoetherianRing (EmbeddedRing k)]
    [IsLocalRing (EmbeddedRing k)]
    (hq : (IsLocalRing.maximalIdeal (EmbeddedRing k)).radical =
      IsLocalRing.maximalIdeal (EmbeddedRing k)) :
    multiplicity (M := EmbeddedRing k) _ hq = 1 ∧
      ¬ IsRegularLocalRing (EmbeddedRing k) := by sorry

-- test: HilbertSamuelTest.inDegree_residue
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsNoetherianRing O]
    (hq : (IsLocalRing.maximalIdeal O).radical = IsLocalRing.maximalIdeal O) :
    multiplicityInDegree (M := O ⧸ IsLocalRing.maximalIdeal O) _ hq 0 = 1 ∧
      multiplicityInDegree (M := O ⧸ IsLocalRing.maximalIdeal O) _ hq 1 = 0 := by sorry

-- test: HilbertSamuelTest.inDegree_mixed
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsNoetherianRing O]
    (hq : (IsLocalRing.maximalIdeal O).radical = IsLocalRing.maximalIdeal O) :
    polynomial (M := O × (O ⧸ IsLocalRing.maximalIdeal O)) _ hq = X + C 2 ∧
      multiplicity (M := O × (O ⧸ IsLocalRing.maximalIdeal O)) _ hq = 1 ∧
      multiplicity (M := O) _ hq +
        multiplicity (M := O ⧸ IsLocalRing.maximalIdeal O) _ hq = 2 ∧
      multiplicityInDegree (M := O × (O ⧸ IsLocalRing.maximalIdeal O)) _ hq 1 =
        multiplicityInDegree (M := O) _ hq 1 +
          multiplicityInDegree (M := O ⧸ IsLocalRing.maximalIdeal O) _ hq 1 := by sorry

-- test: HilbertSamuelTest.inDegree_zero
example (A : Type*) [CommRing A] [IsNoetherianRing A] [IsLocalRing A]
    (q : Ideal A) (hq : q.radical = IsLocalRing.maximalIdeal A) (d : ℕ) :
    multiplicityInDegree (M := Fin 0 → A) q hq d = 0 := by sorry

-- test: HilbertSamuelTest.inDegree_factorial
example (k : Type*) [Field k]
    [IsNoetherianRing (MvPowerSeries (Fin 2) k)]
    [IsLocalRing (MvPowerSeries (Fin 2) k)]
    (hq : (IsLocalRing.maximalIdeal (MvPowerSeries (Fin 2) k)).radical =
      IsLocalRing.maximalIdeal (MvPowerSeries (Fin 2) k)) :
    polynomial (M := MvPowerSeries (Fin 2) k) _ hq = (X + 1) * (X + 2) * C (1 / 2) ∧
      multiplicityInDegree (M := MvPowerSeries (Fin 2) k) _ hq 2 = 1 := by sorry

end HilbertSamuelTest

/-!
## P7: minimal finite-free complexes (Codex — codex-J6LwjP)

The reader's Section 7 is definitive. These forms elaborate with placeholder proofs. The definitions
use actual pinned carriers. Ordinary residual tensor on projective representatives
is not presented as an already implemented generic derived tensor functor.
Omitted signatures: disk rank equations and a locally finite disk-family isomorphism;
the generic derived-object forms of residualPerfectness and residualNakayama;
the Tor-amplitude predicate, derived tensor/RHom, filtered-colimit factorization,
and completed infinite-rank minimality. Their exact obligations remain packet gaps.
-/

namespace TauCeti.LocalPerfect
open Module

open CategoryTheory CategoryTheory.Limits ZeroObject

variable {R : Type u} [CommRing R]

-- Local shorthand for the existing cochain carrier; no new complex structure.
abbrev Complex (R : Type u) [CommRing R] := CochainComplex (ModuleCat.{u} R) ℤ

section DerivedObjects

variable [HasDerivedCategory.{u} (ModuleCat.{u} R)]

/-- P7/perfect-object: existence of a genuine bounded projective representative. -/
def IsPerfect (K : DerivedCategory (ModuleCat.{u} R)) : Prop :=
  ∃ (C : Complex R) (a b : ℤ),
    (∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i)) ∧
    C.IsStrictlyGE a ∧ C.IsStrictlyLE b ∧
    Nonempty (DerivedCategory.Q.obj C ≅ K)

/-- P7/pseudo-coherent-object: finite free, upper bounded, with no lower bound. -/
def IsPseudoCoherent (K : DerivedCategory (ModuleCat.{u} R)) : Prop :=
  ∃ (C : Complex R) (b : ℤ),
    (∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i)) ∧
    C.IsStrictlyLE b ∧ Nonempty (DerivedCategory.Q.obj C ≅ K)

theorem IsPerfect.of_rep (C : Complex R) (a b : ℤ)
    (h : ∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b) :
    IsPerfect (DerivedCategory.Q.obj C) := by sorry

theorem IsPerfect.of_iso {K L : DerivedCategory (ModuleCat.{u} R)}
    (e : K ≅ L) (h : IsPerfect K) : IsPerfect L := by sorry

theorem IsPerfect.exists_rep {K : DerivedCategory (ModuleCat.{u} R)}
    (h : IsPerfect K) :
    ∃ (C : Complex R) (a b : ℤ),
      (∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i)) ∧
      C.IsStrictlyGE a ∧ C.IsStrictlyLE b ∧
      Nonempty (DerivedCategory.Q.obj C ≅ K) := by sorry

theorem IsPerfect.zero : IsPerfect (0 : DerivedCategory (ModuleCat.{u} R)) := by sorry

theorem IsPerfect.shift {K : DerivedCategory (ModuleCat.{u} R)}
    (h : IsPerfect K) (n : ℤ) : IsPerfect (K⟦n⟧) := by sorry

theorem IsPseudoCoherent.of_rep (C : Complex R) (b : ℤ)
    (h : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hb : C.IsStrictlyLE b) : IsPseudoCoherent (DerivedCategory.Q.obj C) := by sorry

theorem IsPseudoCoherent.of_iso {K L : DerivedCategory (ModuleCat.{u} R)}
    (e : K ≅ L) (h : IsPseudoCoherent K) : IsPseudoCoherent L := by sorry

theorem IsPseudoCoherent.exists_rep {K : DerivedCategory (ModuleCat.{u} R)}
    (h : IsPseudoCoherent K) :
    ∃ (C : Complex R) (b : ℤ),
      (∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i)) ∧
      C.IsStrictlyLE b ∧ Nonempty (DerivedCategory.Q.obj C ≅ K) := by sorry

theorem IsPseudoCoherent.zero :
    IsPseudoCoherent (0 : DerivedCategory (ModuleCat.{u} R)) := by sorry

theorem IsPseudoCoherent.shift {K : DerivedCategory (ModuleCat.{u} R)}
    (h : IsPseudoCoherent K) (n : ℤ) : IsPseudoCoherent (K⟦n⟧) := by sorry

/-- P7/perfect-is-pseudo-coherent. -/
theorem IsPerfect.isPseudoCoherent {K : DerivedCategory (ModuleCat.{u} R)}
    (h : IsPerfect K) : IsPseudoCoherent K := by sorry

-- perfect_zero
example : IsPerfect (0 : DerivedCategory (ModuleCat.{u} R)) := by sorry
-- perfect_projective_rep
example (C : Complex R) (a b : ℤ)
    (h : ∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b) :
    IsPerfect (DerivedCategory.Q.obj C) := by sorry
-- perfect_iso_transport
example {K L : DerivedCategory (ModuleCat.{u} R)} (e : K ≅ L) :
    IsPerfect K ↔ IsPerfect L := by sorry
-- pseudo_zero
example : IsPseudoCoherent (0 : DerivedCategory (ModuleCat.{u} R)) := by sorry
-- pseudo_free_rep
example (C : Complex R) (b : ℤ)
    (h : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hb : C.IsStrictlyLE b) : IsPseudoCoherent (DerivedCategory.Q.obj C) := by sorry
-- pseudo_iso_transport
example {K L : DerivedCategory (ModuleCat.{u} R)} (e : K ≅ L) :
    IsPseudoCoherent K ↔ IsPseudoCoherent L := by sorry

end DerivedObjects

section FieldTests
variable (k : Type u) [Field k] [HasDerivedCategory.{u} (ModuleCat.{u} k)]
variable (V : Type u) [AddCommGroup V] [Module k V]
-- perfect_field_stalk: rules out an infinite-dimensional stalk.
example : IsPerfect (DerivedCategory.Q.obj
    ((HomologicalComplex.single (ModuleCat.{u} k) (.up ℤ) 0).obj
      (ModuleCat.of k V))) ↔ Module.Finite k V := by sorry
-- pseudo_field_stalk: boundedness alone does not imply pseudo-coherence.
example : IsPseudoCoherent (DerivedCategory.Q.obj
    ((HomologicalComplex.single (ModuleCat.{u} k) (.up ℤ) 0).obj
      (ModuleCat.of k V))) ↔ Module.Finite k V := by sorry
end FieldTests

section Local
variable [IsLocalRing R]

/-- P7/minimal-complex: no opaque hypotheses, and no implicit finite-free clause. -/
def IsMinimal (C : Complex R) : Prop :=
  ∀ i : ℤ, LinearMap.range (C.d i (i + 1)).hom ≤
    IsLocalRing.maximalIdeal R • (⊤ : Submodule R (C.X (i + 1)))

-- The existing extendScalars functor is additive; this adapter has a placeholder proof.
local instance residualFunctor_additive :
    (ModuleCat.extendScalars (algebraMap R (IsLocalRing.ResidueField R))).Additive where
  map_add := by sorry

-- Ordinary scalar change on actual complexes, using the pinned functors.
noncomputable abbrev residueComplex (C : Complex R) :=
  ((ModuleCat.extendScalars (algebraMap R (IsLocalRing.ResidueField R))).mapHomologicalComplex (.up ℤ)).obj C

theorem IsMinimal.iff_residue_d_zero (C : Complex R) :
    IsMinimal C ↔ ∀ i : ℤ,
      ((C.d i (i + 1)).hom.lTensor (IsLocalRing.ResidueField R)) = 0 := by sorry

theorem IsMinimal.of_iso {C D : Complex R} (e : C ≅ D)
    (h : IsMinimal C) : IsMinimal D := by sorry

theorem IsMinimal.zero : IsMinimal (0 : Complex R) := by sorry

theorem IsMinimal.shift {C : Complex R} (h : IsMinimal C) (n : ℤ) :
    IsMinimal (C⟦n⟧) := by sorry

theorem IsMinimal.iff_matrix (C : Complex R)
    {ι : ℤ → Type u} (b : ∀ i, Basis (ι i) R (C.X i)) :
    IsMinimal C ↔ ∀ (i : ℤ) (j : ι i) (k : ι (i + 1)),
      (b (i + 1)).repr ((C.d i (i + 1)).hom (b i j)) k ∈
        IsLocalRing.maximalIdeal R := by sorry

-- minimal_zero
example : IsMinimal (0 : Complex R) := by sorry
-- minimal_iff_residue
example (C : Complex R) : IsMinimal C ↔ ∀ i : ℤ,
    ((C.d i (i + 1)).hom.lTensor (IsLocalRing.ResidueField R)) = 0 := by sorry
-- minimal_iso_transport
example {C D : Complex R} (e : C ≅ D) : IsMinimal C ↔ IsMinimal D := by sorry
-- minimal_identity_disk: the cone of an identity is contractible but not minimal.
example : ¬ IsMinimal (CochainComplex.mappingCone
    (𝟙 ((HomologicalComplex.single (ModuleCat.{u} R) (.up ℤ) 1).obj
      (ModuleCat.of R R)))) := by sorry

/-- P7/homotopy-residue-equality. -/
theorem homotopy_residue_equality {C D : Complex R}
    (hC : IsMinimal C) (hD : IsMinimal D) {f g : C ⟶ D}
    (h : Homotopy f g) (i : ℤ) :
    (f.f i).hom.lTensor (IsLocalRing.ResidueField R) =
      (g.f i).hom.lTensor (IsLocalRing.ResidueField R) := by sorry

/-- P7/minimal-homotopy-equivalence-is-iso: strict uniqueness, not canonical choice. -/
theorem minimal_homotopy_equivalence_is_iso {C D : Complex R}
    (hC : IsMinimal C) (hD : IsMinimal D)
    (hFC : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hFD : ∀ i, Module.Finite R (D.X i) ∧ Module.Free R (D.X i))
    (e : HomotopyEquiv C D) : IsIso e.hom := by sorry

namespace minimalRepresentative

theorem «exists» (C : Complex R) (b : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hb : C.IsStrictlyLE b) :
    ∃ M : Complex R,
      (∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i)) ∧
      M.IsStrictlyLE b ∧ IsMinimal M ∧ Nonempty (HomotopyEquiv C M) := by sorry

theorem bounded (C : Complex R) (a b : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b) :
    ∃ M : Complex R,
      (∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i)) ∧
      M.IsStrictlyGE a ∧ M.IsStrictlyLE b ∧
      IsMinimal M ∧ Nonempty (HomotopyEquiv C M) := by sorry

-- disk_part: omitted as a locally finite family until that carrier is constructed.
-- For each individual disk the existing cone already has a contraction.
theorem disk_part (i : ℤ) :
    Nonempty (Homotopy
      (𝟙 (CochainComplex.mappingCone
        (𝟙 ((HomologicalComplex.single (ModuleCat.{u} R) (.up ℤ) (i + 1)).obj
          (ModuleCat.of R R))))) 0) := by sorry

theorem quasiIso {C M : Complex R} (e : HomotopyEquiv C M) :
    QuasiIso e.hom := by sorry

theorem unique {C M N : Complex R} (hM : IsMinimal M) (hN : IsMinimal N)
    (hFM : ∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i))
    (hFN : ∀ i, Module.Finite R (N.X i) ∧ Module.Free R (N.X i))
    (eM : HomotopyEquiv C M) (eN : HomotopyEquiv C N) : Nonempty (M ≅ N) := by sorry

end minimalRepresentative

-- minimal_rep_exists
example (C : Complex R) (b : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hb : C.IsStrictlyLE b) :
    ∃ M : Complex R,
      (∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i)) ∧
      M.IsStrictlyLE b ∧ IsMinimal M ∧ Nonempty (HomotopyEquiv C M) := by sorry
-- minimal_rep_bounded
example (C : Complex R) (a b : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b) :
    ∃ M : Complex R,
      (∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i)) ∧
      M.IsStrictlyGE a ∧ M.IsStrictlyLE b ∧
      IsMinimal M ∧ Nonempty (HomotopyEquiv C M) := by sorry
-- minimal_rep_already_minimal
example (C : Complex R) (h : IsMinimal C) :
    IsMinimal C ∧ Nonempty (HomotopyEquiv C C) := by sorry

/-- P7/minimal-residual-ranks: the actual residual homology is the residual term.
The rank-number transport is specified in the reader, not yet elaborated here. -/
theorem minimal_residual_ranks (C : Complex R) (h : IsMinimal C) (i : ℤ) :
    Nonempty ((residueComplex C).homology i ≅ (residueComplex C).X i) := by sorry

/-- P7/residual-perfectness-criterion, on an actual finite-free representative.
The corresponding generic derived-base-change signature remains an explicit gap. -/
theorem residualPerfectness (C : Complex R) (a b c : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hc : C.IsStrictlyLE c)
    (hr : ∀ i : ℤ, i < a ∨ b < i → IsZero ((residueComplex C).homology i)) :
    ∃ M : Complex R,
      (∀ i, Module.Finite R (M.X i) ∧ Module.Free R (M.X i)) ∧
      M.IsStrictlyGE a ∧ M.IsStrictlyLE b ∧
      Nonempty (HomotopyEquiv C M) := by sorry

/-- P7/pseudo-coherent-residual-nakayama, again on the representative. -/
theorem residualNakayama (C : Complex R) (b : ℤ)
    (hF : ∀ i, Module.Finite R (C.X i) ∧ Module.Free R (C.X i))
    (hb : C.IsStrictlyLE b)
    (hr : ∀ i : ℤ, IsZero ((residueComplex C).homology i)) :
    Nonempty (Homotopy (𝟙 C) 0) := by sorry

/-- P7/bounded-residual-acyclic-contractible, with actual projective terms. -/
theorem bounded_residual_acyclic_contractible (C : Complex R) (a b : ℤ)
    (hP : ∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b)
    (hr : ∀ i : ℤ, IsZero ((residueComplex C).homology i)) :
    Nonempty (Homotopy (𝟙 C) 0) := by sorry

end Local

section ThreeTerm
variable [IsLocalRing R]
variable {M₀ M₁ M₂ : Type u}
variable [AddCommGroup M₀] [AddCommGroup M₁] [AddCommGroup M₂]
variable [Module R M₀] [Module R M₁] [Module R M₂]
variable [Module.Finite R M₀] [Module.Finite R M₁] [Module.Finite R M₂]
variable [Module.Free R M₀] [Module.Free R M₁] [Module.Free R M₂]

/-- P7/three-term-residual-splitting: exact only in the middle, three real splittings. -/
theorem three_term_residual_splitting
    (f : M₀ →ₗ[R] M₁) (g : M₁ →ₗ[R] M₂) (hgf : g ∘ₗ f = 0)
    (hr : Function.Exact (f.lTensor (IsLocalRing.ResidueField R))
      (g.lTensor (IsLocalRing.ResidueField R))) :
    Function.Exact f g ∧
    (∃ s : M₀ →ₗ[R] LinearMap.ker f, s ∘ₗ (LinearMap.ker f).subtype = LinearMap.id) ∧
    (∃ s : M₁ →ₗ[R] LinearMap.range f, s ∘ₗ (LinearMap.range f).subtype = LinearMap.id) ∧
    (∃ s : M₂ →ₗ[R] LinearMap.range g, s ∘ₗ (LinearMap.range g).subtype = LinearMap.id) := by sorry

end ThreeTerm

section Cancellation
-- The unit-pivot theorem itself is valid without a local hypothesis.
variable {C : Complex R} {ι κ : Type u}
/-- P7/unit-pivot-cancellation. Rank and unchanged-degree equations remain noted omissions. -/
theorem unit_pivot_cancellation (i : ℤ)
    (hF : ∀ j, Module.Finite R (C.X j) ∧ Module.Free R (C.X j))
    (b₀ : Basis ι R (C.X i)) (b₁ : Basis κ R (C.X (i + 1)))
    (j : ι) (k : κ)
    (hu : IsUnit (b₁.repr ((C.d i (i + 1)).hom (b₀ j)) k)) :
    ∃ C' : Complex R, Nonempty (C ≅ C' ⊞ CochainComplex.mappingCone
      (𝟙 ((HomologicalComplex.single (ModuleCat.{u} R) (.up ℤ) (i + 1)).obj
        (ModuleCat.of R R)))) := by sorry
end Cancellation

end TauCeti.LocalPerfect

/-!
P7 filtered-colimit continuation. The following are placeholder-proof signatures on
actual diagrams and the existing derived category. `homColimitMap` is the
canonical comparison, defined by the existing colimit universal property;
no existence of arbitrary derived-category filtered colimits is presumed.
-/
namespace TauCeti.LocalPerfect
open Module
open CategoryTheory CategoryTheory.Limits ZeroObject
variable {R : Type u} [CommRing R]
variable [HasDerivedCategory.{u} (ModuleCat.{u} R)]

/-- The inclusion missing from the pinned brutal-truncation API. -/
noncomputable def finiteTailInclusion (F : Complex R) (a : ℤ) :
    F.stupidTrunc (ComplexShape.embeddingUpIntGE (a - 1)) ⟶ F := by sorry

/-- P7/finite-free-tail-approximation: comparison of actual derived Hom sets. -/
theorem finite_free_tail_approximation (F E : Complex R) (a b : ℤ)
    (hF : ∀ i, Module.Finite R (F.X i) ∧ Module.Free R (F.X i))
    (hb : F.IsStrictlyLE b) (ha : E.IsStrictlyGE a) :
    Function.Bijective (fun f : DerivedCategory.Q.obj F ⟶ DerivedCategory.Q.obj E =>
      DerivedCategory.Q.map (finiteTailInclusion F a) ≫ f) := by sorry

variable {J : Type u} [SmallCategory J]

/-- A canonical colimit comparison built from the existing degreewise colimit. -/
noncomputable def homColimitMap
    (K : DerivedCategory (ModuleCat.{u} R)) (E : J ⥤ Complex R)
    [HasColimit E]
    [HasColimit (E ⋙ DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op K))] :
    colimit (E ⋙ DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op K)) →
      (K ⟶ DerivedCategory.Q.obj (colimit E)) :=
  colimit.desc _
    ((DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op K)).mapCocone
      (colimit.cocone E))

variable [IsFiltered J]

/-- P7/finite-perfect-hom-filtered-colimit. -/
theorem finite_perfect_hom_filtered_colimit
    (C : Complex R) (a b : ℤ) (E : J ⥤ Complex R)
    (hC : ∀ i, Module.Finite R (C.X i) ∧ Module.Projective R (C.X i))
    (ha : C.IsStrictlyGE a) (hb : C.IsStrictlyLE b)
    [HasColimit E]
    [HasColimit (E ⋙ DerivedCategory.Q ⋙
      coyoneda.obj (Opposite.op (DerivedCategory.Q.obj C)))] :
    Function.Bijective (homColimitMap (DerivedCategory.Q.obj C) E) := by sorry

/-- P7/lower-bounded-target-replacement: the pointwise colimit keeps the common bound.
The objectwise smart truncation maps are already pinned library declarations;
the natural-transformation comparison of whole diagrams remains to implement. -/
theorem lower_bounded_target_replacement (E : J ⥤ Complex R) (a : ℤ)
    (ha : ∀ j, (E.obj j).IsGE a) [HasColimit E] :
    (colimit E).IsGE a := by sorry

/-- P7/pseudo-coherent-hom-uniform-colimit: the actual canonical comparison. -/
theorem pseudo_coherent_hom_uniform_colimit
    (P : DerivedCategory (ModuleCat.{u} R)) (hP : IsPseudoCoherent P)
    (E : J ⥤ Complex R) (a : ℤ) (ha : ∀ j, (E.obj j).IsGE a)
    [HasColimit E]
    [HasColimit (E ⋙ DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op P))] :
    Function.Bijective (homColimitMap P E) := by sorry

-- Stage factorization is a consequence of surjectivity, with no coherent choice.
example (P : DerivedCategory (ModuleCat.{u} R)) (hP : IsPseudoCoherent P)
    (E : J ⥤ Complex R) (a : ℤ) (ha : ∀ j, (E.obj j).IsGE a)
    [HasColimit E]
    [HasColimit (E ⋙ DerivedCategory.Q ⋙ coyoneda.obj (Opposite.op P))]
    (f : P ⟶ DerivedCategory.Q.obj (colimit E)) :
    ∃ j, ∃ g : P ⟶ DerivedCategory.Q.obj (E.obj j),
      g ≫ DerivedCategory.Q.map (colimit.ι E j) = f := by sorry

end TauCeti.LocalPerfect


/- Positivity continuation by codex-rtOQ9t. All four added forms use the actual
native polynomial and quotient-length types. They do not prove existence of
the cumulative polynomial or its degree/dimension comparison. NOT COMPILED;
the successful historical receipt above covers only the preceding file. -/
namespace TauCeti.HilbertSamuel

open Polynomial
open scoped Pointwise

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/positive-leading-coefficient-on-natural-tail
theorem leadingCoeff_pos_of_nat_tail_nonneg (P : Polynomial ℚ) (hP : P ≠ 0)
    (N : ℕ) (hN : ∀ n : ℕ, N ≤ n → 0 ≤ P.eval (n : ℚ)) :
    0 < P.leadingCoeff := by sorry

variable {A : Type u} [CommRing A] [IsNoetherianRing A] [IsLocalRing A]
variable {M : Type v} [AddCommGroup M] [Module A M] [Module.Finite A M]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/positive-finite-adic-length
theorem function_toNat_pos [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) (n : ℕ) :
    0 < (function (M := M) q n).toNat := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/nonzero-hilbert-samuel-polynomial
theorem polynomial_ne_zero [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    polynomial (M := M) q hq ≠ 0 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/positive-hilbert-samuel-leading-coefficient
theorem polynomial_leadingCoeff_pos [Nontrivial M] (q : Ideal A)
    (hq : q.radical = IsLocalRing.maximalIdeal A) :
    0 < (polynomial (M := M) q hq).leadingCoeff := by sorry

-- acceptance: HilbertSamuelPosTest.constant
example : (C (3/2 : ℚ)).leadingCoeff = 3/2 ∧
    0 < (C (3/2 : ℚ)).leadingCoeff := by sorry

-- acceptance: HilbertSamuelPosTest.delayed
example :
    let P : Polynomial ℚ := X ^ 2 - C 100 * X
    P.leadingCoeff = 1 ∧ P.eval 1 = -99 ∧
      ∀ n : ℕ, 100 ≤ n → 0 ≤ P.eval (n : ℚ) := by sorry

-- acceptance: HilbertSamuelPosTest.zero
example : ¬ (0 < (0 : Polynomial ℚ).leadingCoeff) := by sorry

-- acceptance: HilbertSamuelPosTest.rational
example :
    let P : Polynomial ℚ := C (1/3 : ℚ) * X + 1
    0 < P.leadingCoeff ∧ ∀ z : ℤ, (z : ℚ) ≠ P.leadingCoeff := by sorry

end TauCeti.HilbertSamuel


/-! ## R03.3: native graded quotients and rational summation (codex-a71f92)

The current full-file elaboration receipt is in the handoff. Every signature uses native quotients or rational polynomials.
No associated-graded ring/module or graded polynomial-existence input is asserted.
-/
namespace TauCeti.HilbertSamuel

open Polynomial
open scoped Pointwise

variable {A : Type u} [CommRing A]
variable {M : Type v} [AddCommGroup M] [Module A M]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function
noncomputable def gradedFunction (q : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A
    (↥(q ^ n • (⊤ : Submodule A M)) ⧸
      (q • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M)))))

theorem gradedFunction_eq_length (q : Ideal A) (n : ℕ) :
    gradedFunction (M := M) q n =
      Module.length A
        (↥(q ^ n • (⊤ : Submodule A M)) ⧸
          (q • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M))))) := by rfl

theorem gradedFunction_zero [Subsingleton M] (q : Ideal A) (n : ℕ) :
    gradedFunction (M := M) q n = 0 := by sorry

theorem gradedFunction_zero_degree (q : Ideal A) :
    gradedFunction (M := M) q 0 = function (M := M) q 0 := by sorry

theorem gradedFunction_congr {K : Type*} [AddCommGroup K] [Module A K]
    (e : M ≃ₗ[A] K) (q : Ideal A) (n : ℕ) :
    gradedFunction (M := M) q n = gradedFunction (M := K) q n := by sorry

theorem gradedFunction_top (n : ℕ) :
    gradedFunction (M := M) (⊤ : Ideal A) n = 0 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step
theorem quotient_length_succ (q : Ideal A) (n : ℕ) :
    Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M))) =
      gradedFunction (M := M) q n +
        Module.length A (M ⧸ (q ^ n • (⊤ : Submodule A M))) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-graded-length
theorem function_eq_sum_graded (q : Ideal A) (n : ℕ) :
    function (M := M) q n =
      ∑ i ∈ Finset.range (n + 1), gradedFunction (M := M) q i := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/finite-graded-piece-length
theorem gradedFunction_ne_top [IsNoetherianRing A] [IsLocalRing A] [Module.Finite A M]
    (q : Ideal A) (hq : q.radical = IsLocalRing.maximalIdeal A) (n : ℕ) :
    gradedFunction (M := M) q n ≠ ⊤ := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-natural-length
theorem function_toNat_eq_sum_graded (q : Ideal A)
    (hfinite : ∀ i : ℕ, gradedFunction (M := M) q i ≠ ⊤) (n : ℕ) :
    (function (M := M) q n).toNat =
      ∑ i ∈ Finset.range (n + 1), (gradedFunction (M := M) q i).toNat := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial
noncomputable def summatoryPolynomial (P : Polynomial ℚ) : Polynomial ℚ :=
  ∑ j ∈ P.support, C (P.coeff j / (j + 1 : ℚ)) *
    ((Polynomial.bernoulli (j + 1)).comp (X + 1) -
      C ((Polynomial.bernoulli (j + 1)).eval 0))

theorem summatoryPolynomial_eq (P : Polynomial ℚ) :
    summatoryPolynomial P =
      ∑ j ∈ P.support, C (P.coeff j / (j + 1 : ℚ)) *
        ((Polynomial.bernoulli (j + 1)).comp (X + 1) -
          C ((Polynomial.bernoulli (j + 1)).eval 0)) := by rfl

theorem summatoryPolynomial_zero : summatoryPolynomial 0 = 0 := by sorry

theorem summatoryPolynomial_add (P Q : Polynomial ℚ) :
    summatoryPolynomial (P + Q) = summatoryPolynomial P + summatoryPolynomial Q := by sorry

theorem summatoryPolynomial_smul (c : ℚ) (P : Polynomial ℚ) :
    summatoryPolynomial (c • P) = c • summatoryPolynomial P := by sorry

theorem summatoryPolynomial_C (c : ℚ) :
    summatoryPolynomial (C c) = C c * (X + 1) := by sorry

theorem summatoryPolynomial_eval_neg_one (P : Polynomial ℚ) :
    (summatoryPolynomial P).eval (-1) = 0 := by sorry

theorem summatoryPolynomial_difference (P : Polynomial ℚ) :
    (summatoryPolynomial P).comp (X + 1) - summatoryPolynomial P =
      P.comp (X + 1) := by sorry

theorem summatoryPolynomial_unique (P R : Polynomial ℚ)
    (hnorm : R.eval (-1) = 0)
    (hdiff : R.comp (X + 1) - R = P.comp (X + 1)) :
    R = summatoryPolynomial P := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial-evaluation
theorem summatoryPolynomial_eval (P : Polynomial ℚ) (n : ℕ) :
    (summatoryPolynomial P).eval (n : ℚ) =
      ∑ i ∈ Finset.range (n + 1), P.eval (i : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail
theorem cumulativePolynomial_from_graded_tail (q : Ideal A)
    (hfinite : ∀ i : ℕ, gradedFunction (M := M) q i ≠ ⊤)
    (Q : Polynomial ℚ) (N : ℕ)
    (htail : ∀ i : ℕ, N ≤ i →
      Q.eval (i : ℚ) = ((gradedFunction (M := M) q i).toNat : ℚ))
    (n : ℕ) (hn : N ≤ n) :
    (summatoryPolynomial Q +
      C (∑ i ∈ Finset.range N,
        (((gradedFunction (M := M) q i).toNat : ℚ) - Q.eval (i : ℚ)))).eval (n : ℚ) =
      ((function (M := M) q n).toNat : ℚ) := by sorry

end TauCeti.HilbertSamuel

namespace HilbertSamuelGradedTest
open TauCeti.HilbertSamuel Polynomial
open scoped Pointwise

-- test: HilbertSamuelGradedTest.field_rank
example (k : Type*) [Field k] (r n : ℕ) :
    gradedFunction (M := Fin r → k) (⊥ : Ideal k) 0 = r ∧
      gradedFunction (M := Fin r → k) (⊥ : Ideal k) (n + 1) = 0 := by sorry

-- test: HilbertSamuelGradedTest.dvr_power
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (s : ℕ) (hs : 0 < s) (n : ℕ) :
    gradedFunction (M := O) (IsLocalRing.maximalIdeal O ^ s) n = s := by sorry

-- test: HilbertSamuelGradedTest.zero
example (A : Type*) [CommRing A] (q : Ideal A) (n : ℕ) :
    gradedFunction (M := Fin 0 → A) q n = 0 := by sorry

-- test: HilbertSamuelGradedTest.infinite
example (n : ℕ) :
    gradedFunction (M := ℤ) (⊥ : Ideal ℤ) 0 = ⊤ ∧
      gradedFunction (M := ℤ) (⊥ : Ideal ℤ) (n + 1) = 0 ∧
      function (M := ℤ) (⊥ : Ideal ℤ) n = ⊤ := by sorry

-- acceptance: nonsplit transition in Z/4
example :
    let q : Ideal ℤ := Ideal.span {2}
    gradedFunction (M := ZMod 4) q 0 = 1 ∧
      gradedFunction (M := ZMod 4) q 1 = 1 ∧
      gradedFunction (M := ZMod 4) q 2 = 0 ∧
      function (M := ZMod 4) q 0 = 1 ∧
      function (M := ZMod 4) q 1 = 2 := by sorry

end HilbertSamuelGradedTest

namespace HilbertSamuelSumTest
open TauCeti.HilbertSamuel Polynomial

-- test: HilbertSamuelSumTest.zero
example (n : ℕ) :
    summatoryPolynomial 0 = 0 ∧
      (summatoryPolynomial 0).eval (n : ℚ) = 0 := by sorry

-- test: HilbertSamuelSumTest.one
example :
    summatoryPolynomial 1 = X + 1 ∧
      (summatoryPolynomial 1).eval 0 = 1 := by sorry

-- test: HilbertSamuelSumTest.linear
example :
    summatoryPolynomial X = C (1/2 : ℚ) * X * (X + 1) ∧
      (summatoryPolynomial X).eval 3 = 6 := by sorry

-- test: HilbertSamuelSumTest.normalization
example :
    (X : Polynomial ℚ).comp (X + 1) - X = 1 ∧
      (X : Polynomial ℚ).eval (-1) = -1 ∧
      (X : Polynomial ℚ).eval 0 = 0 ∧
      (X : Polynomial ℚ) ≠ summatoryPolynomial 1 := by sorry

-- acceptance: initial segment [1,2] with constant graded tail 1
example :
    summatoryPolynomial 1 + C (1 : ℚ) = X + C 2 ∧
      (summatoryPolynomial 1 + C (1 : ℚ)).eval 0 = 2 := by sorry

-- acceptance: initial segment [3] with constant graded tail 1
example : summatoryPolynomial 1 + C (2 : ℚ) = X + C 3 := by sorry

-- acceptance: eventually zero graded tail, nonzero cumulative constant
example : summatoryPolynomial 0 + C (3 : ℚ) = C 3 := by sorry

-- acceptance: negative rational correction cannot be truncated natural subtraction
example : summatoryPolynomial (C (3 : ℚ)) - C 2 = C 3 * X + 1 := by sorry

end HilbertSamuelSumTest

/-! ## R03.3: adic graded ring through the native Rees quotient (codex-J6LwjP)
No generic Rees carrier is reconstructed. Module comparison and graded polynomiality
remain gaps; every proposed mathematical implementation is unchecked. -/
namespace TauCeti.HilbertSamuel
noncomputable section AdicGraded
open scoped Polynomial DirectSum
variable {A : Type*} [CommRing A]

abbrev reesCoefficientIdeal (q : Ideal A) : Ideal (reesAlgebra q) :=
  q.map (algebraMap A (reesAlgebra q))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring
abbrev adicGradedRing (q : Ideal A) := (reesAlgebra q) ⧸ reesCoefficientIdeal q

instance adicGradedRing_quotientAlgebra (q : Ideal A) :
    Algebra (A ⧸ q) (adicGradedRing q) :=
  Ideal.Quotient.algebraQuotientOfLEComap Ideal.le_comap_map

lemma adicGradedRing_zero : Nonempty (adicGradedRing (⊥ : Ideal A) ≃ₐ[A] A) := by sorry
lemma adicGradedRing_top : Subsingleton (adicGradedRing (⊤ : Ideal A)) := by sorry
lemma adicGradedRing_noetherian [IsNoetherianRing A] (q : Ideal A) :
    IsNoetherianRing (adicGradedRing q) := inferInstance

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/rees-coefficient-ideal
lemma mem_reesCoefficientIdeal_iff (q : Ideal A) (p : reesAlgebra q) :
    p ∈ reesCoefficientIdeal q ↔ ∀ n : ℕ, (p : A[X]).coeff n ∈ q ^ (n + 1) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map
noncomputable def adicMonomial (q : Ideal A) (n : ℕ) :
    ↥(q ^ n) →ₗ[A] adicGradedRing q where
  toFun x := Ideal.Quotient.mk (reesCoefficientIdeal q)
    ⟨Polynomial.monomial n x.val, reesAlgebra.monomial_mem.mpr x.property⟩
  map_add' := by sorry
  map_smul' := by sorry

lemma adicMonomial_eq (q : Ideal A) (n : ℕ) (x : ↥(q ^ n)) :
    adicMonomial q n x = Ideal.Quotient.mk (reesCoefficientIdeal q)
      ⟨Polynomial.monomial n x.val, reesAlgebra.monomial_mem.mpr x.property⟩ := rfl

lemma adicMonomial_add (q : Ideal A) (n : ℕ) (x y : ↥(q ^ n)) :
    adicMonomial q n (x + y) = adicMonomial q n x + adicMonomial q n y :=
  (adicMonomial q n).map_add x y
lemma adicMonomial_smul (q : Ideal A) (n : ℕ) (c : A) (x : ↥(q ^ n)) :
    adicMonomial q n (c • x) = c • adicMonomial q n x :=
  (adicMonomial q n).map_smul c x

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-kernel
lemma adicMonomial_ker (q : Ideal A) (n : ℕ) :
    LinearMap.ker (adicMonomial q n) = q • (⊤ : Submodule A ↥(q ^ n)) := by sorry

abbrev adicRingPiece (q : Ideal A) (n : ℕ) :=
  ↥(q ^ n) ⧸ (q • (⊤ : Submodule A ↥(q ^ n)))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion
noncomputable def adicPieceInclusion (q : Ideal A) (n : ℕ) :
    adicRingPiece q n →ₗ[A] adicGradedRing q :=
  Submodule.liftQ _ (adicMonomial q n) (by rw [adicMonomial_ker])

lemma adicPieceInclusion_mk (q : Ideal A) (n : ℕ) (x : ↥(q ^ n)) :
    adicPieceInclusion q n (Submodule.Quotient.mk x) = adicMonomial q n x := rfl
lemma adicPieceInclusion_injective (q : Ideal A) (n : ℕ) :
    Function.Injective (adicPieceInclusion q n) := by sorry

lemma adicPieceInclusion_zero (q : Ideal A) (n : ℕ) :
    adicPieceInclusion q n 0 = 0 := (adicPieceInclusion q n).map_zero

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-product
lemma adicMonomial_mul (q : Ideal A) (n m : ℕ) (x : ↥(q ^ n)) (y : ↥(q ^ m)) :
    adicMonomial q n x * adicMonomial q m y =
      adicMonomial q (n + m)
        ⟨x.val * y.val, by rw [pow_add]; exact Ideal.mul_mem_mul x.property y.property⟩ := by sorry

noncomputable def adicExpansion (q : Ideal A) :
    (⨁ n : ℕ, adicRingPiece q n) →ₗ[A] adicGradedRing q :=
  DirectSum.toModule A ℕ (adicGradedRing q) (adicPieceInclusion q)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-bijective
lemma adicExpansion_bijective (q : Ideal A) : Function.Bijective (adicExpansion q) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-direct-sum
noncomputable def adicDirectSumEquiv (q : Ideal A) :
    (⨁ n : ℕ, adicRingPiece q n) ≃ₗ[A] adicGradedRing q :=
  LinearEquiv.ofBijective (adicExpansion q) (adicExpansion_bijective q)

lemma adicDirectSumEquiv_lof (q : Ideal A) (n : ℕ) (x : adicRingPiece q n) :
    adicDirectSumEquiv q (DirectSum.lof A ℕ (adicRingPiece q) n x) =
      adicPieceInclusion q n x := by sorry
lemma adicDirectSumEquiv_coe (q : Ideal A) :
    (adicDirectSumEquiv q).toLinearMap = adicExpansion q := rfl

lemma adicDirectSumEquiv_symm_inclusion (q : Ideal A) (n : ℕ) (x : adicRingPiece q n) :
    (adicDirectSumEquiv q).symm (adicPieceInclusion q n x) =
      DirectSum.lof A ℕ (adicRingPiece q) n x := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-generation
lemma adicGradedRing_generated_degree_one (q : Ideal A) :
    Algebra.adjoin (A ⧸ q) (Set.range fun x : q =>
      adicMonomial q 1 ⟨x.val, by simpa only [pow_one] using x.property⟩) = ⊤ := by sorry

-- test: HilbertSamuelAdicTest.field_zero_ideal
example {k : Type*} [Field k] : Nonempty (adicGradedRing (⊥ : Ideal k) ≃ₐ[k] k) := by sorry
-- test: HilbertSamuelAdicTest.unit_ideal
example (q : Ideal A) (hq : q = ⊤) : Subsingleton (adicGradedRing q) := by sorry
-- test: HilbertSamuelAdicTest.dual_numbers_nonfield
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicGradedRing q, x ≠ 0 ∧ x * x = 0 := by sorry

-- test: HilbertSamuelAdicTest.monomial_degree_zero
example (a : A) :
    adicMonomial (⊥ : Ideal A) 0 ⟨a, by simp⟩ =
      algebraMap A (adicGradedRing (⊥ : Ideal A)) a := by sorry
-- test: HilbertSamuelAdicTest.monomial_two_survives
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    adicMonomial q 1 ⟨2, by simp [q]⟩ ≠ 0 := by sorry
-- test: HilbertSamuelAdicTest.monomial_top_zero
example (n : ℕ) (x : ↥((⊤ : Ideal A) ^ n)) : adicMonomial (⊤ : Ideal A) n x = 0 := by sorry

-- test: HilbertSamuelAdicTest.piece_field_higher_zero
example {k : Type*} [Field k] (n : ℕ) : Subsingleton (adicRingPiece (⊥ : Ideal k) (n + 1)) := by sorry
-- test: HilbertSamuelAdicTest.piece_two_injective
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    Function.Injective (adicPieceInclusion q 1) ∧
      adicPieceInclusion q 1 (Submodule.Quotient.mk ⟨2, by simp [q]⟩) ≠ 0 := by sorry
-- test: HilbertSamuelAdicTest.piece_unit_zero
example (n : ℕ) : Subsingleton (adicRingPiece (⊤ : Ideal A) n) := by sorry

-- test: HilbertSamuelAdicTest.expansion_degree_zero
example (x : adicRingPiece (⊥ : Ideal A) 0) :
    adicDirectSumEquiv (⊥ : Ideal A) (DirectSum.lof A ℕ (adicRingPiece (⊥ : Ideal A)) 0 x) = adicPieceInclusion (⊥ : Ideal A) 0 x := by sorry
-- test: HilbertSamuelAdicTest.expansion_nilpotent_degree
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicRingPiece q 1,
      adicDirectSumEquiv q (DirectSum.lof (ZMod 4) ℕ (adicRingPiece q) 1 x) ≠ 0 := by sorry
-- test: HilbertSamuelAdicTest.expansion_unit_zero
example : Subsingleton (⨁ n : ℕ, adicRingPiece (⊤ : Ideal A) n) := by sorry
end AdicGraded
end TauCeti.HilbertSamuel

/-! ## R03.3: ordinary associated graded modules (codex-5ebb6f)
Aliases below reuse Ideal.stableFiltration and its native polynomial Rees module.
Only the adic quotient and its comparisons are new. No graded polynomial is assumed.
-/
namespace TauCeti.HilbertSamuel
noncomputable section AdicModule
set_option backward.isDefEq.respectTransparency.types false
open scoped Polynomial DirectSum
variable {A : Type*} [CommRing A]
variable (q : Ideal A) (M : Type*) [AddCommGroup M] [Module A M]

abbrev adicReesModule := ↥((q.stableFiltration (⊤ : Submodule A M)).submodule)
abbrev adicModuleDenominator : Submodule (reesAlgebra q) (adicReesModule q M) :=
  reesCoefficientIdeal q • ⊤

-- Specify the scalar ring to native quotient inference on this Rees subtype.
local instance adicReesModule_hasQuotient :
    HasQuotient (adicReesModule q M) (Submodule (reesAlgebra q) (adicReesModule q M)) :=
  @Submodule.hasQuotient (reesAlgebra q) (adicReesModule q M) _ _ _

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-module
abbrev adicGradedModule := adicReesModule q M ⧸ adicModuleDenominator q M

instance (priority := 1200) adicGradedModule_quotientModule :
    Module (adicGradedRing q) (adicGradedModule q M) :=
  (Module.isTorsionBySet_quotient_ideal_smul
    (adicReesModule q M) (reesCoefficientIdeal q)).module

instance (priority := 1200) adicGradedModule_quotientSMul :
    SMul (adicGradedRing q) (adicGradedModule q M) :=
  (adicGradedModule_quotientModule q M).toSMul

instance (priority := 100) adicGradedModule_residueModule : Module (A ⧸ q) (adicGradedModule q M) :=
  Module.compHom (adicGradedModule q M) (algebraMap (A ⧸ q) (adicGradedRing q))

instance adicGradedModule_residueTower :
    IsScalarTower (A ⧸ q) (adicGradedRing q) (adicGradedModule q M) := by sorry

instance adicGradedModule_baseTower :
    IsScalarTower A (A ⧸ q) (adicGradedModule q M) := by sorry

lemma adicGradedModule_mk_smul (r : reesAlgebra q) (f : adicReesModule q M) :
    Ideal.Quotient.mk (reesCoefficientIdeal q) r •
      (Submodule.Quotient.mk f : adicGradedModule q M) =
      Submodule.Quotient.mk (r • f) := rfl
lemma adicGradedModule_residue_smul (a : A) (x : adicGradedModule q M) :
    Ideal.Quotient.mk q a • x = a • x := by sorry
lemma adicGradedModule_top : Subsingleton (adicGradedModule (⊤ : Ideal A) M) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/rees-module-coefficient-denominator
lemma mem_adicModuleDenominator_iff (f : adicReesModule q M) :
    f ∈ adicModuleDenominator q M ↔
      ∀ n : ℕ, (f : PolynomialModule A M).coeff n ∈
        q ^ (n + 1) • (⊤ : Submodule A M) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map
noncomputable def adicModuleMonomial (n : ℕ) :
    ↥(q ^ n • (⊤ : Submodule A M)) →ₗ[A] adicGradedModule q M where
  toFun m := Submodule.Quotient.mk ⟨PolynomialModule.single A n m, by sorry⟩
  map_add' := by sorry
  map_smul' := by sorry

lemma adicModuleMonomial_eq (n : ℕ) (m : ↥(q ^ n • (⊤ : Submodule A M))) :
    ∃ h : PolynomialModule.single A n (m : M) ∈
        (q.stableFiltration (⊤ : Submodule A M)).submodule,
      adicModuleMonomial q M n m = Submodule.Quotient.mk ⟨_, h⟩ := by sorry
lemma adicModuleMonomial_add (n : ℕ) (m m' : ↥(q ^ n • (⊤ : Submodule A M))) :
    adicModuleMonomial q M n (m + m') =
      adicModuleMonomial q M n m + adicModuleMonomial q M n m' := by sorry
lemma adicModuleMonomial_smul (n : ℕ) (a : A) (m : ↥(q ^ n • (⊤ : Submodule A M))) :
    adicModuleMonomial q M n (a • m) = a • adicModuleMonomial q M n m := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-kernel
lemma adicModuleMonomial_ker (n : ℕ) :
    LinearMap.ker (adicModuleMonomial q M n) =
      q • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M))) := by sorry

-- Same quotient carrier as gradedFunction, rather than another filtration structure.
abbrev adicModulePiece (n : ℕ) :=
  ↥(q ^ n • (⊤ : Submodule A M)) ⧸
    (q • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M))))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-piece-inclusion
noncomputable def adicModulePieceInclusion (n : ℕ) :
    adicModulePiece q M n →ₗ[A] adicGradedModule q M :=
  Submodule.liftQ _ (adicModuleMonomial q M n) (by rw [adicModuleMonomial_ker])
lemma adicModulePieceInclusion_mk (n : ℕ) (m : ↥(q ^ n • (⊤ : Submodule A M))) :
    adicModulePieceInclusion q M n (Submodule.Quotient.mk m) =
      adicModuleMonomial q M n m := rfl
lemma adicModulePieceInclusion_injective (n : ℕ) :
    Function.Injective (adicModulePieceInclusion q M n) := by sorry
lemma adicModulePieceInclusion_residue_smul (n : ℕ) (a : A ⧸ q)
    (m : adicModulePiece q M n) :
    adicModulePieceInclusion q M n (a • m) =
      a • adicModulePieceInclusion q M n m := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-module-action
lemma adicModuleMonomial_smul_monomial (r n : ℕ) (a : ↥(q ^ r))
    (m : ↥(q ^ n • (⊤ : Submodule A M))) :
    ∃ h : (a : A) • (m : M) ∈ q ^ (r + n) • (⊤ : Submodule A M),
      adicMonomial q r a • adicModuleMonomial q M n m =
        adicModuleMonomial q M (r + n) ⟨_, h⟩ := by sorry

abbrev adicModuleExpansion : (⨁ n : ℕ, adicModulePiece q M n) →ₗ[A] adicGradedModule q M :=
  DirectSum.toModule A ℕ (adicGradedModule q M) (adicModulePieceInclusion q M)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-expansion-bijective
lemma adicModuleExpansion_bijective : Function.Bijective (adicModuleExpansion q M) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-direct-sum
noncomputable def adicModuleDirectSumEquiv :
    (⨁ n : ℕ, adicModulePiece q M n) ≃ₗ[A] adicGradedModule q M :=
  LinearEquiv.ofBijective (adicModuleExpansion q M) (adicModuleExpansion_bijective q M)
lemma adicModuleDirectSumEquiv_lof (n : ℕ) (x : adicModulePiece q M n) :
    adicModuleDirectSumEquiv q M (DirectSum.lof A ℕ (adicModulePiece q M) n x) =
      adicModulePieceInclusion q M n x := by sorry
lemma adicModuleDirectSumEquiv_coe :
    (adicModuleDirectSumEquiv q M).toLinearMap = adicModuleExpansion q M := rfl
lemma adicModuleDirectSumEquiv_symm_inclusion (n : ℕ) (x : adicModulePiece q M n) :
    (adicModuleDirectSumEquiv q M).symm (adicModulePieceInclusion q M n x) =
      DirectSum.lof A ℕ (adicModulePiece q M) n x := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-degree-zero-generation
lemma adicGradedModule_generated_degree_zero :
    Submodule.span (adicGradedRing q) (Set.range (adicModuleMonomial q M 0)) = ⊤ := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-finite
lemma adicGradedModule_finite [Module.Finite A M] :
    Module.Finite (adicGradedRing q) (adicGradedModule q M) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-regular-module-comparison
lemma adicRegularModuleComparison :
    ∃ e : adicGradedModule q A ≃ₗ[adicGradedRing q] adicGradedRing q,
      ∀ (n : ℕ) (m : ↥(q ^ n • (⊤ : Submodule A A))),
        ∃ h : (m : A) ∈ q ^ n,
          e (adicModuleMonomial q A n m) = adicMonomial q n ⟨_, h⟩ := by sorry

end AdicModule
end TauCeti.HilbertSamuel

/-! Native acceptance tests for the four module constructions. -/
namespace TauCeti.HilbertSamuel
noncomputable section AdicModuleTests
open scoped DirectSum
variable {A : Type*} [CommRing A]
variable (M : Type*) [AddCommGroup M] [Module A M]

-- test: HilbertSamuelAdicModuleTest.zero_ideal_module
example : Nonempty (adicGradedModule (⊥ : Ideal A) M ≃ₗ[A] M) := by sorry
-- test: HilbertSamuelAdicModuleTest.unit_ideal_module
example : Subsingleton (adicGradedModule (⊤ : Ideal A) M) := by sorry
-- test: HilbertSamuelAdicModuleTest.residue_module_degree_one_action
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ a : ↥(q ^ 1), adicMonomial q 1 a ≠ 0 ∧
      ∀ x : adicGradedModule q (ZMod 4 ⧸ q), adicMonomial q 1 a • x = 0 := by sorry

-- test: HilbertSamuelAdicModuleTest.monomial_zero_degree_injective
example : Function.Injective (adicModuleMonomial (⊥ : Ideal A) M 0) := by sorry
-- test: HilbertSamuelAdicModuleTest.monomial_regular_two_survives
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ m : ↥(q ^ 1 • (⊤ : Submodule (ZMod 4) (ZMod 4))),
      adicModuleMonomial q (ZMod 4) 1 m ≠ 0 := by sorry
-- test: HilbertSamuelAdicModuleTest.monomial_residue_degree_one_zero
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∀ m : ↥(q ^ 1 • (⊤ : Submodule (ZMod 4) (ZMod 4 ⧸ q))),
      adicModuleMonomial q (ZMod 4 ⧸ q) 1 m = 0 := by sorry

-- test: HilbertSamuelAdicModuleTest.piece_length_same_carrier
example (q : Ideal A) (n : ℕ) :
    gradedFunction q (M := M) n = Module.length A (adicModulePiece q M n) := rfl
-- test: HilbertSamuelAdicModuleTest.piece_regular_two_injective
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    Function.Injective (adicModulePieceInclusion q (ZMod 4) 1) ∧
      ∃ m : adicModulePiece q (ZMod 4) 1,
        adicModulePieceInclusion q (ZMod 4) 1 m ≠ 0 := by sorry
-- test: HilbertSamuelAdicModuleTest.piece_residue_higher_zero
example (n : ℕ) : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    Subsingleton (adicModulePiece q (ZMod 4 ⧸ q) (n + 1)) := by sorry

-- test: HilbertSamuelAdicModuleTest.expansion_zero_degree
example (x : adicModulePiece (⊥ : Ideal A) M 0) :
    adicModuleDirectSumEquiv (⊥ : Ideal A) M
      (DirectSum.lof A ℕ (adicModulePiece (⊥ : Ideal A) M) 0 x) =
      adicModulePieceInclusion (⊥ : Ideal A) M 0 x := by sorry
-- test: HilbertSamuelAdicModuleTest.expansion_regular_degree_one
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicModulePiece q (ZMod 4) 1,
      adicModuleDirectSumEquiv q (ZMod 4)
        (DirectSum.lof (ZMod 4) ℕ (adicModulePiece q (ZMod 4)) 1 x) ≠ 0 := by sorry
-- test: HilbertSamuelAdicModuleTest.expansion_residue_higher_zero
example (n : ℕ) : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∀ x : adicModulePiece q (ZMod 4 ⧸ q) (n + 1),
      adicModuleDirectSumEquiv q (ZMod 4 ⧸ q)
        (DirectSum.lof (ZMod 4) ℕ (adicModulePiece q (ZMod 4 ⧸ q)) (n + 1) x) = 0 := by sorry

end AdicModuleTests
end TauCeti.HilbertSamuel

/-! Native grading on the existing Rees quotients. These are adic adapters,
not new generic graded carriers. All compatibility proofs remain unchecked.
The kernel/cokernel induction in the preceding handoff is a subsequent step. -/
namespace TauCeti.HilbertSamuel
noncomputable section AdicGrading
open scoped DirectSum
variable {A : Type*} [CommRing A]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components
def adicRingComponents (q : Ideal A) (n : ℕ) : Submodule A (adicGradedRing q) :=
  LinearMap.range (adicPieceInclusion q n)

def adicRingComponentEquiv (q : Ideal A) (n : ℕ) :
    adicRingPiece q n ≃ₗ[A] adicRingComponents q n :=
  LinearEquiv.ofInjective (adicPieceInclusion q n) (adicPieceInclusion_injective q n)

lemma adicRingComponentEquiv_coe (q : Ideal A) (n : ℕ) (x : adicRingPiece q n) :
    (adicRingComponentEquiv q n x : adicGradedRing q) = adicPieceInclusion q n x := rfl

def adicRingDecompose (q : Ideal A) :
    adicGradedRing q →ₗ[A] ⨁ n : ℕ, adicRingComponents q n :=
  (DirectSum.congrLinearEquiv (adicRingComponentEquiv q)).toLinearMap.comp
    (adicDirectSumEquiv q).symm.toLinearMap

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition
lemma adicRingDecompose_inclusion (q : Ideal A) (n : ℕ) (x : adicRingPiece q n) :
    adicRingDecompose q (adicPieceInclusion q n x) =
      DirectSum.lof A ℕ (fun n => ↥(adicRingComponents q n)) n (adicRingComponentEquiv q n x) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration
instance adicRingGrading (q : Ideal A) : GradedAlgebra (adicRingComponents q) where
  decompose' := adicRingDecompose q
  left_inv := by sorry
  right_inv := by sorry
  one_mem := by sorry
  mul_mem := by sorry

lemma adicRingGrading_decompose (q : Ideal A) (x : adicGradedRing q) :
    DirectSum.decompose (adicRingComponents q) x = adicRingDecompose q x := rfl

def adicRingProjection (q : Ideal A) (n : ℕ) : adicGradedRing q →ₗ[A] adicGradedRing q :=
  GradedAlgebra.proj (adicRingComponents q) n

lemma adicRingProjection_inclusion (q : Ideal A) (i j : ℕ) (x : adicRingPiece q j) :
    adicRingProjection q i (adicPieceInclusion q j x) =
      if i = j then adicPieceInclusion q j x else 0 := by sorry

lemma adicRingProjection_mul (q : Ideal A) (i j : ℕ)
    (x : adicRingComponents q i) (y : adicRingComponents q j) :
    adicRingProjection q (i + j) ((x : adicGradedRing q) * y) =
      (x : adicGradedRing q) * y := by sorry

variable (q : Ideal A) (M : Type*) [AddCommGroup M] [Module A M]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components
def adicModuleComponents (n : ℕ) : Submodule A (adicGradedModule q M) :=
  LinearMap.range (adicModulePieceInclusion q M n)

def adicModuleComponentEquiv (n : ℕ) :
    adicModulePiece q M n ≃ₗ[A] adicModuleComponents q M n :=
  LinearEquiv.ofInjective (adicModulePieceInclusion q M n)
    (adicModulePieceInclusion_injective q M n)

lemma adicModuleComponentEquiv_coe (n : ℕ) (x : adicModulePiece q M n) :
    (adicModuleComponentEquiv q M n x : adicGradedModule q M) =
      adicModulePieceInclusion q M n x := rfl

def adicModuleDecompose :
    adicGradedModule q M →ₗ[A] ⨁ n : ℕ, adicModuleComponents q M n :=
  (DirectSum.congrLinearEquiv (adicModuleComponentEquiv q M)).toLinearMap.comp
    (adicModuleDirectSumEquiv q M).symm.toLinearMap

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-decomposition
lemma adicModuleDecompose_inclusion (n : ℕ) (x : adicModulePiece q M n) :
    adicModuleDecompose q M (adicModulePieceInclusion q M n x) =
      DirectSum.lof A ℕ (fun n => ↥(adicModuleComponents q M n)) n (adicModuleComponentEquiv q M n x) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-grading-registration
instance adicModuleDecomposition : DirectSum.Decomposition (adicModuleComponents q M) :=
  DirectSum.Decomposition.ofLinearMap (adicModuleComponents q M) (adicModuleDecompose q M)
    (by sorry) (by sorry)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-scalar-action
instance adicModuleGradedSMul :
    SetLike.GradedSMul (adicRingComponents q) (adicModuleComponents q M) where
  smul_mem := by sorry

-- Native graded action, with its precise module instance made explicit.
local instance adicModuleSumModule :
    Module (adicGradedRing q) (⨁ n : ℕ, adicModuleComponents q M n) :=
  GradedModule.isModule (adicRingComponents q) (adicModuleComponents q M)

def adicModuleGradedEquiv :
    adicGradedModule q M ≃ₗ[adicGradedRing q] ⨁ n : ℕ, adicModuleComponents q M n :=
  GradedModule.linearEquiv (adicRingComponents q) (adicModuleComponents q M)

lemma adicModuleGradedEquiv_inclusion (n : ℕ) (x : adicModulePiece q M n) :
    adicModuleGradedEquiv q M (adicModulePieceInclusion q M n x) =
      DirectSum.of (fun n => ↥(adicModuleComponents q M n)) n
        (adicModuleComponentEquiv q M n x) := by sorry

def adicModuleProjection (n : ℕ) : adicGradedModule q M →ₗ[A] adicGradedModule q M :=
  (adicModuleComponents q M n).subtype.comp
    ((DFinsupp.lapply n).comp (DirectSum.decomposeLinearEquiv (adicModuleComponents q M)).toLinearMap)

lemma adicModuleProjection_inclusion (i j : ℕ) (x : adicModulePiece q M j) :
    adicModuleProjection q M i (adicModulePieceInclusion q M j x) =
      if i = j then adicModulePieceInclusion q M j x else 0 := by sorry

lemma adicModuleProjection_smul (i j : ℕ)
    (a : adicRingComponents q i) (x : adicModuleComponents q M j) :
    adicModuleProjection q M (i + j) ((a : adicGradedRing q) • (x : adicGradedModule q M)) =
      (a : adicGradedRing q) • (x : adicGradedModule q M) := by sorry

-- test: HilbertSamuelAdicGradingTest.ring_zero_degree
example (a : adicRingPiece (⊥ : Ideal A) 0) :
    (adicRingComponentEquiv (⊥ : Ideal A) 0 a : adicGradedRing (⊥ : Ideal A)) =
      adicPieceInclusion (⊥ : Ideal A) 0 a := by sorry
-- test: HilbertSamuelAdicGradingTest.ring_nonzero_positive
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicRingComponents q 1, (x : adicGradedRing q) ≠ 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.ring_unit_components
example (n : ℕ) : Subsingleton (adicRingComponents (⊤ : Ideal A) n) := by sorry
-- test: HilbertSamuelAdicGradingTest.ring_unit_degree_zero
example : adicRingProjection q 0 1 = 1 := by sorry
-- test: HilbertSamuelAdicGradingTest.ring_positive_projection
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicGradedRing q, adicRingProjection q 1 x ≠ 0 ∧ adicRingProjection q 0 x = 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.ring_degree_one_square
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicRingComponents q 1, (x : adicGradedRing q) ≠ 0 ∧
      adicRingProjection q 2 ((x : adicGradedRing q) * x) = 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.module_zero_degree
example (x : adicModulePiece (⊥ : Ideal A) M 0) :
    (adicModuleComponentEquiv (⊥ : Ideal A) M 0 x : adicGradedModule (⊥ : Ideal A) M) =
      adicModulePieceInclusion (⊥ : Ideal A) M 0 x := by sorry
-- test: HilbertSamuelAdicGradingTest.module_regular_positive
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicModuleComponents q (ZMod 4) 1, (x : adicGradedModule q (ZMod 4)) ≠ 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.module_residue_positive_zero
example (n : ℕ) : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    Subsingleton (adicModuleComponents q (ZMod 4 ⧸ q) (n + 1)) := by sorry
-- test: HilbertSamuelAdicGradingTest.module_zero_higher_projection
example (n : ℕ) (x : adicGradedModule (⊥ : Ideal A) M) :
    adicModuleProjection (⊥ : Ideal A) M (n + 1) x = 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.module_regular_positive_projection
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∃ x : adicGradedModule q (ZMod 4), adicModuleProjection q (ZMod 4) 1 x ≠ 0 ∧
      adicModuleProjection q (ZMod 4) 0 x = 0 := by sorry
-- test: HilbertSamuelAdicGradingTest.module_residue_action_zero
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    ∀ (a : adicRingComponents q 1) (x : adicGradedModule q (ZMod 4 ⧸ q)),
      (a : adicGradedRing q) • x = 0 := by sorry

end AdicGrading
end TauCeti.HilbertSamuel

/-! Finite-variable jet adapters for the plane-curve handoff.
The variable ideal is the algebraic span of the native variables, not a
new local-ring carrier. Injectivity needs exact finite order and a
no-zero-divisors coefficient ring. All six planned nodes remain unchecked. -/
namespace TauCeti.HilbertSamuel
noncomputable section Jets
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => (Ideal.span (Set.range (MvPowerSeries.X : σ → R)))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/monomial-variable-ideal-power
omit [Finite σ] in
lemma monomial_mem_variableIdeal_pow_degree (β : σ →₀ ℕ) :
    MvPowerSeries.monomial β (1 : k) ∈ v ^ β.degree := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order-bound
omit [Finite σ] in
lemma order_lower_bound_of_mem_variableIdeal_pow (g : R) (r : ℕ)
    (hg : g ∈ v ^ r) : (r : ℕ∞) ≤ g.order := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/finite-degree-monomial-factorization
lemma exists_degree_monomial_factorization (g : R) (r : ℕ)
    (hg : (r : ℕ∞) ≤ g.order) :
    ∃ h : (σ →₀ ℕ) → R,
      g = ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := σ) r).toFinset,
        MvPowerSeries.monomial β (1 : k) * h β := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order
lemma mem_variableIdeal_pow_iff (g : R) (r : ℕ) :
    g ∈ v ^ r ↔ (r : ℕ∞) ≤ g.order := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-denominator
lemma shiftedJet_denominator (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    (v ^ (N + 1 - d) : Submodule R R) ≤
      Submodule.comap (LinearMap.mulLeft R f) (v ^ (N + 1) : Submodule R R) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map
def shiftedJetMap (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    (R ⧸ v ^ (N + 1 - d)) →ₗ[R] (R ⧸ v ^ (N + 1)) :=
  Submodule.mapQ _ _ (LinearMap.mulLeft R f) (shiftedJet_denominator f d N hN hd)

lemma shiftedJetMap_apply (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) (g : R) :
    shiftedJetMap f d N hN hd
      (Submodule.mkQ (v ^ (N + 1 - d)) g) =
      Submodule.mkQ (v ^ (N + 1)) (f * g) := rfl

def jetProjection (f : R) (N : ℕ) :
    (R ⧸ v ^ (N + 1)) →ₗ[R]
      (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) :=
  Submodule.factor (show (v ^ (N + 1) : Submodule R R) ≤
    (Ideal.span {f} ⊔ v ^ (N + 1)) from le_sup_right)

omit [Finite σ] in
lemma jetProjection_apply (f : R) (N : ℕ) (g : R) :
    jetProjection f N (Submodule.mkQ (v ^ (N + 1)) g) =
      Submodule.mkQ (Ideal.span {f} ⊔ v ^ (N + 1)) g := rfl

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-injective
lemma shiftedJetMap_injective [NoZeroDivisors k] (f : R) (d N : ℕ)
    (hN : d ≤ N) (hd : f.order = (d : ℕ∞)) :
    Function.Injective (shiftedJetMap f d N hN hd.ge) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-exact
lemma shiftedJetMap_exact (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    LinearMap.range (shiftedJetMap f d N hN hd) =
      LinearMap.ker (jetProjection f N) ∧
      Function.Surjective (jetProjection f N) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/jet-below-equation-order
lemma jetProjection_below_order (f : R) (d N : ℕ)
    (hN : N < d) (hd : (d : ℕ∞) ≤ f.order) :
    Ideal.span {f} ⊔ v ^ (N + 1) = v ^ (N + 1) ∧
      Function.Bijective (jetProjection f N) := by sorry

-- test: HilbertSamuelJetTest.linear_equation
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      shiftedJetMap f 1 1 (by decide) hd (Submodule.mkQ (q ^ 1) 1) =
        Submodule.mkQ (q ^ 2) f ∧ Submodule.mkQ (q ^ 2) f ≠ 0 := by sorry

-- test: HilbertSamuelJetTest.unit_equation
example (N : ℕ) :
    ∀ hd : (0 : ℕ∞) ≤ (1 : MvPowerSeries (Fin 2) ℚ).order,
      shiftedJetMap (1 : MvPowerSeries (Fin 2) ℚ) 0 N (Nat.zero_le N) hd =
        LinearMap.id := by
  intro hd
  apply LinearMap.ext
  intro x
  refine Quotient.inductionOn' x ?_
  intro g
  simp [shiftedJetMap]

-- test: HilbertSamuelJetTest.nonreduced_equation
example :
    let f : MvPowerSeries (Fin 2) (ZMod 2) := MvPowerSeries.X 0 ^ 4
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ hd : f.order = (4 : ℕ∞),
      shiftedJetMap f 4 4 (by decide) hd.ge (Submodule.mkQ (q ^ 1) 1) =
        Submodule.mkQ (q ^ 5) f ∧ Submodule.mkQ (q ^ 5) f ≠ 0 ∧
        Function.Injective (shiftedJetMap f 4 4 (by decide) hd.ge) := by sorry

-- test: HilbertSamuelJetTest.zero_equation
example (d N : ℕ) (hN : d ≤ N) (hd : (d : ℕ∞) ≤ (0 : R).order) :
    shiftedJetMap (0 : R) d N hN hd = 0 := by
  apply LinearMap.ext
  intro x
  refine Quotient.inductionOn' x ?_
  intro g
  simp [shiftedJetMap]

-- test: HilbertSamuelJetTest.small_index_not_shifted
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0 ^ 4
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    Function.Bijective (jetProjection f 0) ∧
      ¬ Function.Injective
        (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ ⧸ q)
          (Ideal.Quotient.mk q f)) := by sorry

-- test: HilbertSamuelJetTest.zero_divisor_base
example :
    let f : MvPowerSeries (Fin 2) (ZMod 4) := MvPowerSeries.C 2 * MvPowerSeries.X 0
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      ¬ Function.Injective (shiftedJetMap f 1 1 (by decide) hd) := by sorry

end Jets
end TauCeti.HilbertSamuel

/-! Total-degree jets (codex-rtOQ9t). The truncation algebra map, third
isomorphism theorem and surjective scalar length comparison are built.
Only their series-ideal kernel and coordinate/basis adapters are planned.
All new definitions, APIs and tests are prototypes with admitted bodies. -/
namespace TauCeti.HilbertSamuel
noncomputable section TotalJets
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => (Ideal.span (Set.range (MvPowerSeries.X : σ → R)))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-kernel
lemma truncTotalAlgHom_ker (r : ℕ) :
    RingHom.ker (MvPowerSeries.truncTotalAlgHom σ k r).toRingHom = v ^ r := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-equivalence
def totalJetEquiv (r : ℕ) :
    (R ⧸ v ^ r) ≃ₐ[k]
      (MvPolynomial σ k ⧸ MvPolynomial.idealOfVars σ k ^ r) := by sorry

lemma totalJetEquiv_mk (r : ℕ) (g : R) :
    totalJetEquiv (σ := σ) (k := k) r (Ideal.Quotient.mk (v ^ r) g) =
      Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) (g.truncTotal r) := by sorry

lemma totalJetEquiv_symm_mk (r : ℕ) (p : MvPolynomial σ k) :
    (totalJetEquiv (σ := σ) (k := k) r).symm
      (Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) p) =
        Ideal.Quotient.mk (v ^ r) (p : R) := by sorry

lemma totalJetEquiv_mul (r : ℕ) (a b : R ⧸ v ^ r) :
    totalJetEquiv (σ := σ) (k := k) r (a * b) =
      totalJetEquiv (σ := σ) (k := k) r a *
        totalJetEquiv (σ := σ) (k := k) r b := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis
def totalJetBasis (r : ℕ) :
    Module.Basis {α : σ →₀ ℕ // α.degree < r} k (R ⧸ v ^ r) := by sorry

lemma totalJetBasis_apply (r : ℕ) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetBasis (σ := σ) (k := k) r α =
      Ideal.Quotient.mk (v ^ r) (MvPowerSeries.monomial α.val 1) := by sorry

lemma totalJetBasis_repr_mk (r : ℕ) (g : R)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    (totalJetBasis (σ := σ) (k := k) r).repr (Ideal.Quotient.mk (v ^ r) g) α =
      g.coeff α.val := by sorry

lemma totalJetBasis_finite (r : ℕ) : Module.Finite k (R ⧸ v ^ r) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-finrank
lemma planeTotalJet_finrank {k : Type*} [Field k] (r : ℕ) :
    let q : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span (Set.range MvPowerSeries.X)
    Module.finrank k (MvPowerSeries (Fin 2) k ⧸ q ^ r) = Nat.choose (r + 1) 2 := by sorry

-- test: HilbertSamuelTotalJetTest.zero_cutoff
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    Subsingleton (MvPowerSeries (Fin 2) ℚ ⧸ q ^ 0) ∧
      IsEmpty {α : Fin 2 →₀ ℕ // α.degree < 0} := by sorry

-- test: HilbertSamuelTotalJetTest.residue_cutoff
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    totalJetEquiv (σ := Fin 2) (k := ℚ) 1 (Ideal.Quotient.mk (q ^ 1) 1) = 1 ∧
      totalJetEquiv (σ := Fin 2) (k := ℚ) 1
        (Ideal.Quotient.mk (q ^ 1) (MvPowerSeries.X 0)) = 0 := by sorry

-- test: HilbertSamuelTotalJetTest.total_not_rectangular
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    Ideal.Quotient.mk (q ^ 2) (MvPowerSeries.X 0 * MvPowerSeries.X 1) = 0 ∧
      MvPowerSeries.trunc' ℚ
        (Finsupp.single (0 : Fin 2) 1 + Finsupp.single 1 1)
        (MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) ℚ) ≠ 0 := by sorry

-- test: HilbertSamuelTotalJetTest.basis_zero_cutoff
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    ∀ g : MvPowerSeries (Fin 2) ℚ ⧸ q ^ 0,
      (totalJetBasis (σ := Fin 2) (k := ℚ) 0).repr g = 0 := by sorry

-- test: HilbertSamuelTotalJetTest.basis_dual_variable
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Ideal.Quotient.mk (q ^ 3) (MvPowerSeries.X 0 * MvPowerSeries.X 1) ≠ 0 ∧
      Ideal.Quotient.mk (q ^ 3) (MvPowerSeries.X 0 ^ 3) = 0 := by sorry

-- test: HilbertSamuelTotalJetTest.basis_zero_divisors
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 4)) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ α : {α : Fin 2 →₀ ℕ // α.degree < 1},
      (totalJetBasis (σ := Fin 2) (k := ZMod 4) 1).repr
        (Ideal.Quotient.mk (q ^ 1) (MvPowerSeries.C 2)) α = 2 ∧
      Ideal.Quotient.mk (q ^ 1) (MvPowerSeries.C 2) ≠ 0 := by sorry

-- test: HilbertSamuelTotalJetTest.field_length_six
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (ZMod 2) (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) = 6 := by sorry

-- Built interfaces are cited as baseline, never new blueprint nodes.
-- Powers commute with the quotient ideal map; the third isomorphism theorem
-- then identifies the actual curve jet with R/((f)+v^r).
example (f : R) (r : ℕ) :
    let I : Ideal R := Ideal.span {f}
    let n := (v).map (Ideal.Quotient.mk I)
    Nonempty (((R ⧸ I) ⧸ n ^ r) ≃ₐ[R] (R ⧸ (I ⊔ v ^ r))) := by sorry

example (f : R) (r : ℕ) :
    let I : Ideal R := Ideal.span {f}
    let n := (v).map (Ideal.Quotient.mk I)
    Module.length R ((R ⧸ I) ⧸ n ^ r) =
      Module.length (R ⧸ I) ((R ⧸ I) ⧸ n ^ r) := by sorry

end TotalJets
end TauCeti.HilbertSamuel

/-! Native residue and module-length adapters (codex-5ebb6f).
The checked proof source is archived separately; all new bodies here are
admitted under PROTOCOL section 13. The jet basis and count remain unchecked. -/
namespace TauCeti.HilbertSamuel
noncomputable section SeriesResidue
variable {σ k : Type*} [Field k]
local notation "R" => MvPowerSeries σ k
local notation "κ" => IsLocalRing.ResidueField R

local instance constantCoeff_local : IsLocalHom (MvPowerSeries.constantCoeff : R →+* k) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-equivalence
def seriesResidueEquiv : κ ≃ₐ[k] k := by sorry

lemma seriesResidueEquiv_residue (g : R) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R g) =
      MvPowerSeries.constantCoeff g := by sorry

lemma seriesResidueEquiv_symm (a : k) :
    (seriesResidueEquiv (σ := σ) (k := k)).symm a =
      IsLocalRing.residue R (MvPowerSeries.C a) := by sorry

lemma seriesResidueEquiv_algebraMap (a : k) :
    seriesResidueEquiv (σ := σ) (k := k) (algebraMap k κ a) = a := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-coefficients-surjective
lemma seriesResidue_coeff_surjective : Function.Surjective (algebraMap k κ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/series-module-length
lemma seriesModule_length_eq_coeff_length (M : Type*) [AddCommGroup M] [Module R M]
    [Module k M] [IsScalarTower k R M] : Module.length R M = Module.length k M := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/series-module-finite-length
lemma seriesModule_length_eq_finrank (M : Type*) [AddCommGroup M] [Module R M]
    [Module k M] [IsScalarTower k R M] [Module.Finite k M] :
    Module.length R M = Module.finrank k M := by sorry


-- test: HilbertSamuelResidueTest.coefficient_section
example (a : k) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R (MvPowerSeries.C a)) = a ∧
      (seriesResidueEquiv (σ := σ) (k := k)).symm a =
        IsLocalRing.residue R (MvPowerSeries.C a) := by sorry


-- test: HilbertSamuelResidueTest.empty_variables
example :
    seriesResidueEquiv (σ := Empty) (k := ℚ)
      (IsLocalRing.residue (MvPowerSeries Empty ℚ) (MvPowerSeries.C 3)) = 3 := by sorry


-- test: HilbertSamuelResidueTest.variable_not_identity
example (i : σ) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R (MvPowerSeries.X i)) = 0 ∧
      (MvPowerSeries.X i : R) ≠ 0 := by sorry


-- test: HilbertSamuelResidueTest.residue_module_length
example : Module.length R κ = 1 := by sorry


-- test: HilbertSamuelResidueTest.zero_module_length
example : Module.length R (Fin 0 → κ) = 0 := by sorry


-- test: HilbertSamuelResidueTest.residue_pair_length
example : Module.length R (κ × κ) = 2 := by sorry


end SeriesResidue
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
noncomputable section ResidueJetLength
variable {σ k : Type*} [Finite σ] [Field k]
local notation "R" => MvPowerSeries σ k
local notation "v" => (Ideal.span (Set.range (MvPowerSeries.X : σ → R)))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-finite
-- Promotes the existing totalJetBasis_finite signature above; no duplicate declaration.

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-ring-length
lemma totalJet_length_eq_finrank (r : ℕ) :
    Module.length R (R ⧸ v ^ r) = Module.finrank k (R ⧸ v ^ r) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-ring-length
lemma planeTotalJet_length {k : Type*} [Field k] (r : ℕ) :
    let q : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (MvPowerSeries (Fin 2) k) (MvPowerSeries (Fin 2) k ⧸ q ^ r) =
      (Nat.choose (r + 1) 2 : ℕ∞) := by sorry

-- test: HilbertSamuelResidueTest.ring_jet_length_six
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (MvPowerSeries (Fin 2) (ZMod 2))
      (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) = 6 := by sorry

end ResidueJetLength
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
noncomputable section PlaneCurveContinuation
variable {k : Type*} [Field k]
variable (f : (MvPowerSeries (Fin 2) k))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length-balance
-- sum in ENat first; no subtraction of infinite lengths.
lemma planeEquationJet_length_balance (d N : ℕ)
    (hN : d ≤ N) (hd : f.order = (d : ℕ∞)) :
    Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1)) =
      Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1 - d)) +
        Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span {f} ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length
-- the right-hand subtraction is in Nat before the ENat cast.
lemma planeEquationJet_length (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span {f} ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-jet-length
lemma planeCurve_jet_length (N : ℕ) :
    function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N =
      Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ ((Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))) ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-function
-- the actual Hilbert-Samuel function of the actual quotient A.
lemma planeCurve_function (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-graded-function
-- use the native successive-quotient carrier, including N=0.
lemma planeCurve_gradedFunction (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    gradedFunction (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N = (min (N + 1) d : ℕ∞) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-defect
-- rational subtraction, after the preceding finite-length equality.
lemma planeCurve_postulation_defect (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) -
        ((d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) =
      (Nat.choose (d - N - 1) 2 : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-iff
-- cumulative, not graded, agreement threshold.
lemma planeCurve_postulation_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    (((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) =
      (d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) ↔
        d ≤ N + 2 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial
-- no caller-supplied Hilbert polynomial or automatic local instance.
lemma planeCurve_polynomial [IsNoetherianRing ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))] [IsLocalRing ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))]
    (d : ℕ) (hd : f.order = (d : ℕ∞))
    (hq : ((Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))))).radical = IsLocalRing.maximalIdeal ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) :
    polynomial (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) hq =
      Polynomial.C (d : ℚ) * (Polynomial.X + 1) -
        Polynomial.C ((d : ℚ) * ((d : ℚ) - 1) / 2) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-function
-- zero is not a finite-order equation.
lemma planeZeroEquation_function (N : ℕ) :
    let I : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span {(0 : (MvPowerSeries (Fin 2) k))}
    let B := (MvPowerSeries (Fin 2) k) ⧸ I
    let q := ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))).map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q N = (Nat.choose (N + 2) 2 : ℕ∞) := by sorry
end PlaneCurveContinuation

section PlaneCurveAcceptance
-- Unit boundary: no IsLocalRing instance is required on the zero quotient.
-- test: PlaneCurveAcceptance.unit_boundary
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(1 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = 0 := by sorry

-- The zero equation retains the regular surface's quadratic function.
-- test: PlaneCurveAcceptance.zero_equation_six
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by sorry

-- Smooth equation: the function is N+1, not the ambient triangular number.
-- test: PlaneCurveAcceptance.smooth_linear
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = (N + 1 : ℕ∞) := by sorry

-- Nonreduced positive-characteristic equation, with its low-index exception.
-- test: PlaneCurveAcceptance.nonreduced_cumulative
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 4}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let q := (v).map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q 0 = 1 ∧
      function (A := B) (M := B) q 1 = 3 ∧
      function (A := B) (M := B) q 2 = 6 ∧
      function (A := B) (M := B) q 4 = 14 := by sorry

-- The cumulative function has already stabilised polynomially at index 2,
-- but the degree-2 graded component has dimension 3, not yet 4.
-- test: PlaneCurveAcceptance.nonreduced_graded
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 4}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let q := (v).map (Ideal.Quotient.mk I)
    gradedFunction (M := B) q 2 = 3 ∧ gradedFunction (M := B) q 3 = 4 := by sorry

-- Large order does not erase a small ambient jet.
-- test: PlaneCurveAcceptance.below_equation_order
example :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 100}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by sorry
end PlaneCurveAcceptance
end TauCeti.HilbertSamuel

-- Quotient-ring comparison continuation, codex-rtOQ9t. Canonical signatures only.
namespace TauCeti.HilbertSamuel
open scoped Pointwise
variable {A : Type u} [CommRing A]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function
-- api: TauCeti.HilbertSamuel.function_ringQuotient
theorem function_ringQuotient (I J : Ideal A) (n : ℕ) :
    function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n =
      Module.length A (A ⧸ (I ⊔ J ^ (n + 1))) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function-below-ideal
-- api: TauCeti.HilbertSamuel.function_ringQuotient_of_le
theorem function_ringQuotient_of_le (I J : Ideal A) (n : ℕ)
    (hI : I ≤ J ^ (n + 1)) :
    function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n =
      Module.length A (A ⧸ J ^ (n + 1)) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function-antitone
-- api: TauCeti.HilbertSamuel.function_ringQuotient_antitone
theorem function_ringQuotient_antitone (I I' J : Ideal A) (n : ℕ)
    (hI : I ≤ I') :
    function (M := A ⧸ I') (J.map (Ideal.Quotient.mk I')) n ≤
      function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n := by sorry

-- test: HilbertSamuelQuotientTest.unit_equation
example (J : Ideal A) (n : ℕ) :
    function (M := A ⧸ (⊤ : Ideal A))
      (J.map (Ideal.Quotient.mk ⊤)) n = 0 := by sorry

-- test: HilbertSamuelQuotientTest.zero_equation
example (J : Ideal A) (n : ℕ) :
    function (M := A ⧸ (⊥ : Ideal A))
      (J.map (Ideal.Quotient.mk ⊥)) n = function (M := A) J n := by sorry

-- test: HilbertSamuelQuotientTest.field_one
example (n : ℕ) :
    function (M := (ZMod 2) ⧸ (⊥ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊥)) n = 1 := by sorry

-- test: HilbertSamuelQuotientTest.strict_quotient
example :
    function (M := (ZMod 2) ⧸ (⊤ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊤)) 0 <
    function (M := (ZMod 2) ⧸ (⊥ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊥)) 0 := by sorry

-- test: HilbertSamuelQuotientTest.nonreduced_coefficients
example :
    let R := MvPowerSeries (Fin 2) (ZMod 4)
    let J : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 3}
    function (M := R ⧸ I) (J.map (Ideal.Quotient.mk I)) 0 =
      Module.length R (R ⧸ J ^ 1) := by sorry

-- test: HilbertSamuelQuotientTest.nonsurjective_coefficients
example : Module.length ℝ ℂ = 2 ∧ Module.length ℂ ℂ = 1 := by sorry

end TauCeti.HilbertSamuel

/-! Principal-ideal quotient multiplication (codex-5ebb6f).
General ring and actual ideal quotient adapters; the order-to-variable-ideal
bridge remains a separate planned input. New bodies are admitted prototypes. -/
namespace TauCeti.HilbertSamuel
noncomputable section PrincipalQuotients
variable {A : Type*} [CommRing A]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-mul-denominator
lemma pow_mul_denominator (q : Ideal A) (f : A) (d n : ℕ)
    (hdn : d ≤ n) (hf : f ∈ q ^ d) :
    (q ^ (n - d) : Submodule A A) ≤
      Submodule.comap (LinearMap.mulLeft A f) (q ^ n : Submodule A A) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-quotient-multiplication
def quotientMulMap (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    (A ⧸ J) →ₗ[A] (A ⧸ K) := by sorry

-- API: TauCeti.HilbertSamuel.quotientMulMap_apply
lemma quotientMulMap_apply (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) (g : A) :
    quotientMulMap J K f h (Submodule.mkQ J g) = Submodule.mkQ K (f * g) := by sorry

-- API: TauCeti.HilbertSamuel.principalQuotientProjection
def principalQuotientProjection (K : Ideal A) (f : A) :
    (A ⧸ K) →ₗ[A] (A ⧸ (Ideal.span {f} ⊔ K)) := by sorry

-- API: TauCeti.HilbertSamuel.principalQuotientProjection_apply
lemma principalQuotientProjection_apply (K : Ideal A) (f g : A) :
    principalQuotientProjection K f (Submodule.mkQ K g) =
      Submodule.mkQ (Ideal.span {f} ⊔ K) g := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-quotient-exact
lemma quotientMulMap_exact (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    LinearMap.range (quotientMulMap J K f h) =
      LinearMap.ker (principalQuotientProjection K f) ∧
      Function.Surjective (principalQuotientProjection K f) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-quotient-injectivity
lemma quotientMulMap_injective_iff (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    Function.Injective (quotientMulMap J K f h) ↔
      ∀ g : A, f * g ∈ K → g ∈ J := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-projection-in-ideal
lemma principalQuotientProjection_bijective (K : Ideal A) (f : A) (hf : f ∈ K) :
    Ideal.span {f} ⊔ K = K ∧ Function.Bijective (principalQuotientProjection K f) := by sorry

-- test: HilbertSamuelPrincipalJetTest.endpoint_denominator
example (q : Ideal A) (f : A) (n : ℕ) (hf : f ∈ q ^ n) :
    (q ^ 0 : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) (q ^ n) := by sorry

-- test: HilbertSamuelPrincipalJetTest.zero_cutoff
example (q : Ideal A) (f : A) :
    (q ^ 0 : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) (q ^ 0) := by sorry

-- test: HilbertSamuelPrincipalJetTest.zero_equation
example (J K : Ideal A) :
    ∃ h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (0 : A)) K,
      quotientMulMap J K 0 h = 0 ∧
      LinearMap.ker (principalQuotientProjection K 0) = ⊥ := by sorry

-- test: HilbertSamuelPrincipalJetTest.unit_equation
example (K : Ideal A) :
    ∃ h : (K : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (1 : A)) K,
      quotientMulMap K K 1 h = LinearMap.id ∧
      LinearMap.ker (principalQuotientProjection K 1) = ⊤ := by sorry

-- test: HilbertSamuelPrincipalJetTest.zero_divisor_noninjective
example :
    ∃ h : ((⊥ : Ideal (ZMod 4)) : Submodule (ZMod 4) (ZMod 4)) ≤
        Submodule.comap (LinearMap.mulLeft (ZMod 4) 2) (⊥ : Ideal (ZMod 4)),
      ¬ Function.Injective (quotientMulMap ⊥ ⊥ (2 : ZMod 4) h) ∧
      LinearMap.range (quotientMulMap ⊥ ⊥ (2 : ZMod 4) h) =
        LinearMap.ker (principalQuotientProjection ⊥ (2 : ZMod 4)) ∧
      Function.Surjective (principalQuotientProjection ⊥ (2 : ZMod 4)) := by sorry

-- test: HilbertSamuelPrincipalJetTest.nonzero_shift
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    let h := pow_mul_denominator q 2 1 2 (by decide) (by dsimp [q]; simp)
    quotientMulMap (q ^ (2 - 1)) (q ^ 2) 2 h (Submodule.mkQ (q ^ 1) 1) =
      Submodule.mkQ (q ^ 2) 2 ∧ Submodule.mkQ (q ^ 2) 2 ≠ 0 := by sorry

-- test: HilbertSamuelPrincipalJetTest.wrong_source_domain
example : let K : Ideal ℤ := Ideal.span {(4 : ℤ)}
    ∃ h : (K : Submodule ℤ ℤ) ≤ Submodule.comap (LinearMap.mulLeft ℤ 2) K,
      ¬ Function.Injective (quotientMulMap K K 2 h) := by sorry

end PrincipalQuotients
end TauCeti.HilbertSamuel

/-! ## Codex codex-a71f92: finite algebraic variable-ideal regression tests
The three auxiliary declarations and the existing iff retain admitted canonical
bodies. A separate immutable archive holds the exact admission-free proof
prototype and these eleven tests. It is not a library integration claim. -/
open scoped BigOperators
namespace TauCeti.HilbertSamuel

-- Arbitrary, even infinite, variable sets in the forward direction.
-- test: HilbertSamuelVariableIdealTest.infinite_variables_forward
example (g : MvPowerSeries ℕ (ZMod 4)) (r : ℕ)
    (hg : g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      ℕ → MvPowerSeries ℕ (ZMod 4)))) ^ r) : (r : ℕ∞) ≤ g.order :=
  order_lower_bound_of_mem_variableIdeal_pow g r hg

-- Zero and power zero do not require a nontrivial coefficient ring.
-- test: HilbertSamuelVariableIdealTest.zero_series
example {σ k : Type*} [Finite σ] [CommRing k] (r : ℕ) :
    (0 : MvPowerSeries σ k) ∈
      (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ r :=
  (mem_variableIdeal_pow_iff 0 r).mpr (by simp)

-- test: HilbertSamuelVariableIdealTest.zero_power
example {σ k : Type*} [CommRing k] (g : MvPowerSeries σ k) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ 0 := by
  simp

-- test: HilbertSamuelVariableIdealTest.zero_degree_factorization
example {σ k : Type*} [Finite σ] [CommRing k] (g : MvPowerSeries σ k) :
    ∃ h : (σ →₀ ℕ) → MvPowerSeries σ k,
      g = ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := σ) 0).toFinset,
        MvPowerSeries.monomial β (1 : k) * h β :=
  exists_degree_monomial_factorization g 0 (by simp)

-- Empty variable set: positive-order series really are zero.
-- test: HilbertSamuelVariableIdealTest.empty_variables
example (g : MvPowerSeries PEmpty ℚ) (r : ℕ) (hr : 0 < r) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      PEmpty → MvPowerSeries PEmpty ℚ))) ^ r ↔ g = 0 := by
  rw [mem_variableIdeal_pow_iff]
  constructor
  · intro hg
    apply MvPowerSeries.ext
    intro α
    have hα : α = 0 := by ext i; exact i.elim
    subst α
    simpa using (MvPowerSeries.coeff_of_lt_order
      ((Nat.cast_pos.mpr hr).trans_le hg) : MvPowerSeries.coeff 0 g = 0)
  · rintro rfl
    simp

-- Degree zero and a mixed monomial check the total, not coordinatewise, bound.
-- test: HilbertSamuelVariableIdealTest.constant_monomial
example {σ k : Type*} [CommRing k] :
    MvPowerSeries.monomial (0 : σ →₀ ℕ) (1 : k) ∈
      (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ 0 := by
  simp

-- test: HilbertSamuelVariableIdealTest.mixed_total_degree
example :
    MvPowerSeries.monomial (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3) (1 : ZMod 4) ∈
      (Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4)))) ^ 5 := by
  have hd : (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3).degree = 5 := by
    rw [Finsupp.degree_eq_sum, Fin.sum_univ_two]
    simp
  exact hd ▸ monomial_mem_variableIdeal_pow_degree (k := ZMod 4)
    (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3)

-- A variable is in the ideal but not its square over a ring with zero divisors.
-- test: HilbertSamuelVariableIdealTest.variable_membership
example :
    (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 4)) ∈
      Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4))) :=
  Ideal.subset_span (Set.mem_range_self _)

-- test: HilbertSamuelVariableIdealTest.variable_not_square
example :
    (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 4)) ∉
      (Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4)))) ^ 2 := by
  rw [mem_variableIdeal_pow_iff, MvPowerSeries.X,
    MvPowerSeries.order_monomial_of_ne_zero (by decide : (1 : ZMod 4) ≠ 0)]
  simp

-- The zero coefficient ring is allowed; no order(0).toNat conversion is used.
-- test: HilbertSamuelVariableIdealTest.zero_coefficient_ring
example (g : MvPowerSeries (Fin 2) (ZMod 1)) (r : ℕ) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      Fin 2 → MvPowerSeries (Fin 2) (ZMod 1)))) ^ r := by
  have hg : g = 0 := by
    apply MvPowerSeries.ext
    intro α
    exact Subsingleton.elim _ _
  rw [hg]
  exact (mem_variableIdeal_pow_iff 0 r).mpr (by simp)

-- The finite decomposition applies to the sum, not just individual monomials.
-- test: HilbertSamuelVariableIdealTest.sum_factorization
example :
    ∃ h : (Fin 2 →₀ ℕ) → MvPowerSeries (Fin 2) (ZMod 4),
      ((MvPowerSeries.X (0 : Fin 2)) ^ 2 + (MvPowerSeries.X 1) ^ 2 :
        MvPowerSeries (Fin 2) (ZMod 4)) =
      ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := Fin 2) 2).toFinset,
        MvPowerSeries.monomial β (1 : ZMod 4) * h β := by
  apply exists_degree_monomial_factorization
  apply (mem_variableIdeal_pow_iff _ 2).mp
  apply Ideal.add_mem
  · exact Ideal.pow_mem_pow (Ideal.subset_span (Set.mem_range_self (0 : Fin 2))) 2
  · exact Ideal.pow_mem_pow (Ideal.subset_span (Set.mem_range_self (1 : Fin 2))) 2

end TauCeti.HilbertSamuel

/-! Checked coefficient-coordinate continuation, Codex — codex-7e92bd.
The public proof archive contains actual proofs; these canonical signatures
remain admitted. Existing total-jet definitions retain their native carriers. -/
namespace TauCeti.HilbertSamuel
noncomputable section JetCoordinates
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
lemma jet_mk_eq_iff (r : ℕ) (f g : R) :
    Ideal.Quotient.mk (v ^ r) f = Ideal.Quotient.mk (v ^ r) g ↔
      ∀ α : σ →₀ ℕ, α.degree < r → f.coeff α = g.coeff α := by sorry

lemma truncTotalAlgHom_surjective (r : ℕ) :
    Function.Surjective (MvPowerSeries.truncTotalAlgHom σ k r) := by sorry

def totalJetCoefficients (r : ℕ) :
    (R ⧸ v ^ r) →ₗ[k] ({α : σ →₀ ℕ // α.degree < r} → k) := by sorry

lemma totalJetCoefficients_mk (r : ℕ) (g : R) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) g) α = g.coeff α.val := by sorry

lemma totalJetCoefficients_bijective (r : ℕ) :
    Function.Bijective (totalJetCoefficients (σ := σ) (k := k) r) := by sorry

def totalJetCoordinates (r : ℕ) :
    (R ⧸ v ^ r) ≃ₗ[k] ({α : σ →₀ ℕ // α.degree < r} → k) := by sorry

lemma totalJetCoordinates_mk (r : ℕ) (g : R) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoordinates r (Ideal.Quotient.mk (v ^ r) g) α = g.coeff α.val := by sorry

lemma totalJetCoordinates_symm_apply (r : ℕ)
    (c : {α : σ →₀ ℕ // α.degree < r} → k)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoordinates r ((totalJetCoordinates (σ := σ) (k := k) r).symm c) α = c α := by sorry

omit [Finite σ] [CommRing k] in
lemma planeJetIndex_card (r : ℕ) :
    Nat.card {α : Fin 2 →₀ ℕ // α.degree < r} = Nat.choose (r + 1) 2 := by sorry

open scoped Classical in
lemma totalJetCoefficients_monomial (r : ℕ) (β : σ →₀ ℕ) (a : k)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) (MvPowerSeries.monomial β a)) α =
      if α.val = β then a else 0 := by sorry

lemma totalJetCoefficients_eq_zero_iff (r : ℕ) (x : R ⧸ v ^ r) :
    totalJetCoefficients (σ := σ) (k := k) r x = 0 ↔ x = 0 := by sorry

lemma totalJetCoordinates_symm_coeff (r : ℕ) (g : R) :
    (totalJetCoordinates (σ := σ) (k := k) r).symm
      (fun α => g.coeff α.val) = Ideal.Quotient.mk (v ^ r) g := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coefficients_zero_cutoff
example (g : R) : totalJetCoefficients 0 (Ideal.Quotient.mk (v ^ 0) g) = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coefficients_constant_nilpotent
example : totalJetCoefficients (σ := Fin 2) (k := ZMod 4) 1
    (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 1) (MvPowerSeries.C 2))
      ⟨0, by simp⟩ = 2 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coefficients_exact_cutoff
example : totalJetCoefficients (σ := Fin 2) (k := ZMod 4) 2
    (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 2)
      (MvPowerSeries.monomial (Finsupp.single 0 2) 1)) = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.representative_independence
example (r : ℕ) (f g : R) (hg : g ∈ v ^ r) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) (f + g)) =
      totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) f) := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coordinates_reconstruction
example (r : ℕ) (g : R) :
    (totalJetCoordinates r).symm (fun α => g.coeff α.val) = Ideal.Quotient.mk (v ^ r) g := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coordinates_empty_variables
example (a : ZMod 4) :
    totalJetCoordinates (σ := PEmpty) 1
      (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 1) (MvPowerSeries.C a))
      ⟨0, by simp⟩ = a := by sorry

-- test: HilbertSamuelJetCoordinatesTest.coordinates_zero_ring
example (r : ℕ) (g : MvPowerSeries (Fin 2) (ZMod 1)) :
    totalJetCoordinates r (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ r) g) = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.basis_zero_cutoff
example (g : R ⧸ v ^ 0) : (totalJetBasis (σ := σ) (k := k) 0).repr g = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.basis_mixed_monomial
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Ideal.Quotient.mk (q ^ 3)
      (MvPowerSeries.monomial (Finsupp.single 0 1 + Finsupp.single 1 1) 1) ≠ 0 ∧
      Ideal.Quotient.mk (q ^ 3) (MvPowerSeries.monomial (Finsupp.single 0 3) 1) = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.polynomial_inverse
example (r : ℕ) (p : MvPolynomial σ k) :
    (totalJetEquiv (σ := σ) (k := k) r).symm
      (Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) p) =
      Ideal.Quotient.mk (v ^ r) (p : R) := by sorry

-- test: HilbertSamuelJetCoordinatesTest.count_zero
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 0} = 0 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.count_one
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 1} = 1 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.count_three
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 3} = 6 := by sorry

-- test: HilbertSamuelJetCoordinatesTest.field_length_six
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (ZMod 2) (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) = 6 := by sorry

end JetCoordinates
end TauCeti.HilbertSamuel

/-! Exact-order shifted-jet continuation. These are planning signatures;
all new bodies are admitted under PROTOCOL §13. The checked proofs are archived separately. -/
namespace TauCeti.HilbertSamuel
noncomputable section ShiftedOrderContinuation
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

lemma mul_mem_variableIdeal_pow_iff [NoZeroDivisors k] (f g : R) (d r : ℕ)
    (hd : f.order = (d : ℕ∞)) :
    f * g ∈ v ^ (d + r) ↔ g ∈ v ^ r := by sorry

lemma shiftedJetMap_eq_quotientMulMap (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    shiftedJetMap f d N hN hd = quotientMulMap (v ^ (N + 1 - d))
      (v ^ (N + 1)) f (shiftedJet_denominator f d N hN hd) := by sorry

omit [Finite σ] in
lemma jetProjection_eq_principalQuotientProjection (f : R) (N : ℕ) :
    jetProjection f N = principalQuotientProjection (v ^ (N + 1)) f := by sorry

-- test: HilbertSamuelShiftedOrderTest.zero_multiplier
example (r : ℕ) :
    (0 : R) * 1 ∈ v ^ (1 + r) ∧ (0 : R).order ≠ (1 : ℕ∞) := by sorry

-- test: HilbertSamuelShiftedOrderTest.membership_zero_argument
example [NoZeroDivisors k] (f : R) (d r : ℕ) (hd : f.order = (d : ℕ∞)) :
    f * 0 ∈ v ^ (d + r) ↔ (0 : R) ∈ v ^ r := by sorry

-- test: HilbertSamuelShiftedOrderTest.membership_zero_cutoff
example [NoZeroDivisors k] (f g : R) (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    f * g ∈ v ^ d := by sorry

-- test: HilbertSamuelShiftedOrderTest.loose_order_bound
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0 ^ 2
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      ¬ Function.Injective (shiftedJetMap f 1 1 (by decide) hd) := by sorry

-- test: HilbertSamuelShiftedOrderTest.exactness_zero_divisors
example (f : MvPowerSeries (Fin 2) (ZMod 4)) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    LinearMap.range (shiftedJetMap f d N hN hd) = LinearMap.ker (jetProjection f N) ∧
      Function.Surjective (jetProjection f N) := shiftedJetMap_exact f d N hN hd

-- test: HilbertSamuelJetTest.small_index_not_shifted
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0 ^ 4
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    Function.Bijective (jetProjection f 0) ∧
      ¬ Function.Injective
        (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ ⧸ q)
          (Ideal.Quotient.mk q f)) := by sorry

-- test: HilbertSamuelShiftedOrderTest.wrong_source_field
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ h : (q ^ 2 : Submodule (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries (Fin 2) ℚ)) ≤
        Submodule.comap (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries.X 0)) (q ^ 2),
      ¬ Function.Injective (quotientMulMap (q ^ 2) (q ^ 2) (MvPowerSeries.X 0) h) := by sorry

end ShiftedOrderContinuation
end TauCeti.HilbertSamuel

/- Finite equation jets and all-cutoff length continuation, 2026-10-03.
The combined proof is preserved by the handoff archive. Suggested bodies remain admitted.
The preceding native-carrier length and cumulative-function signatures now have checked
proof prototypes; graded functions, postulation and multiplicity remain open. -/
namespace TauCeti.HilbertSamuel
noncomputable section EquationJetFiniteContinuation
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/equation-jet-finite
lemma equationJet_finite (f : R) (N : ℕ) :
    Module.Finite k (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := by sorry
end EquationJetFiniteContinuation
noncomputable section EquationJetLengthContinuation
variable {σ k : Type*} [Finite σ] [Field k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/equation-jet-length-finrank
lemma equationJet_length_eq_finrank (f : R) (N : ℕ) :
    Module.length R (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) =
      Module.finrank k (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := by sorry
end EquationJetLengthContinuation

-- test: HilbertSamuelEquationJetTest.nonreduced_rank
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.finrank (ZMod 2) (R ⧸ (Ideal.span {(MvPowerSeries.X 0 : R) ^ 4} ⊔ v ^ 5)) = 14 := by sorry

-- test: HilbertSamuelEquationJetTest.nilpotent_coefficients_finite
example :
    let R := MvPowerSeries (Fin 3) (ZMod 4)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.Finite (ZMod 4) (R ⧸ (Ideal.span {MvPowerSeries.C 2} ⊔ v ^ 3)) := by sorry

-- test: HilbertSamuelEquationJetTest.zero_coefficients_finite
example :
    let R := MvPowerSeries Empty (ZMod 1)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.Finite (ZMod 1) (R ⧸ (Ideal.span {0} ⊔ v ^ 1)) := by sorry
end TauCeti.HilbertSamuel

/- Exact postulation continuation. Native proofs are archived separately; these are planning signatures. -/
namespace TauCeti.HilbertSamuel
noncomputable section
lemma planeJetCount_defect (d N : ℕ) :
    ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℚ) -
      ((d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) =
        (Nat.choose (d - N - 1) 2 : ℚ) := by sorry

lemma planeJetCount_step (d N : ℕ) :
    Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 =
      min (N + 1) d + (Nat.choose (N + 1) 2 - Nat.choose (N + 1 - d) 2) := by sorry

variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)
lemma planeCurve_graded_stable_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    gradedFunction (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N = (d : ℕ∞) ↔ d ≤ N + 1 := by sorry

lemma planeCurve_postulation_predecessor (d : ℕ) (hd : f.order = (d : ℕ∞)) (h3 : 3 ≤ d) :
    ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) (d - 3)).toNat : ℚ) -
      ((d : ℚ) * ((d - 3 : ℕ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) = 1 := by sorry

lemma planeZeroEquation_gradedFunction (N : ℕ) :
    let I : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span {(0 : MvPowerSeries (Fin 2) k)}
    let B := (MvPowerSeries (Fin 2) k) ⧸ I
    let q := (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))).map (Ideal.Quotient.mk I)
    gradedFunction (M := B) q N = ((N + 1 : ℕ) : ℕ∞) := by sorry

end
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
noncomputable section
namespace CurvePostulationTests
local notation "R" => MvPowerSeries (Fin 2) (ZMod 2)
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → R))
local notation "x" => (MvPowerSeries.X (0 : Fin 2) : R)
local notation "B4" => R ⧸ Ideal.span {x ^ 4}
local notation "q4" => Ideal.map (Ideal.Quotient.mk (Ideal.span {x ^ 4})) v
-- test: CurvePostulationTests.char_two_thresholds
example :
    ((function (M := B4) q4 2).toNat : ℚ) = 6 ∧
      gradedFunction (M := B4) q4 2 ≠ 4 ∧ gradedFunction (M := B4) q4 3 = 4 := by sorry

-- test: CurvePostulationTests.negative_polynomial
example :
    ((function (M := B4) q4 0).toNat : ℚ) - (-2) = 3 := by sorry

-- test: CurvePostulationTests.sharp_predecessor
example :
    ((function (M := B4) q4 1).toNat : ℚ) - 2 = 1 := by sorry

-- test: CurvePostulationTests.graded_threshold
example (N : ℕ) :
    gradedFunction (M := B4) q4 N = 4 ↔ 3 ≤ N := by sorry

-- test: CurvePostulationTests.cumulative_threshold
example (N : ℕ) :
    ((function (M := B4) q4 N).toNat : ℚ) = 4 * ((N : ℚ) + 1) - 6 ↔ 2 ≤ N := by sorry

-- test: CurvePostulationTests.unit_graded
example (N : ℕ) :
    let B := R ⧸ Ideal.span {(1 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(1 : R)}))
    gradedFunction (M := B) q N = 0 := by sorry

-- test: CurvePostulationTests.smooth_graded
example (N : ℕ) :
    let B := R ⧸ Ideal.span {x}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {x}))
    gradedFunction (M := B) q N = 1 := by sorry

-- test: CurvePostulationTests.zero_equation_growth
example (N : ℕ) :
    let B := R ⧸ Ideal.span {(0 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    (0 : R).order = ⊤ ∧ gradedFunction (M := B) q N = ((N + 1 : ℕ) : ℕ∞) := by sorry

-- test: CurvePostulationTests.unit_defect
example (N : ℕ) :
    ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - 0) 2 : ℕ) : ℚ) = 0 := by sorry

-- test: CurvePostulationTests.small_cutoff_defect
example :
    (Nat.choose 4 2 : ℚ) - ((100 : ℚ) * 3 - 100 * 99 / 2) = Nat.choose 97 2 := by sorry

end CurvePostulationTests
end
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
open Polynomial
noncomputable section ExplicitLengthPolynomials

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial
def planeCurvePolynomial (d : ℕ) : Polynomial ℚ := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-eval
lemma planeCurvePolynomial_eval (d : ℕ) (t : ℚ) :
    (planeCurvePolynomial d).eval t = (d : ℚ) * (t + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-zero
lemma planeCurvePolynomial_zero : planeCurvePolynomial 0 = 0 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-degree
lemma planeCurvePolynomial_natDegree (d : ℕ) (hd : d ≠ 0) :
    (planeCurvePolynomial d).natDegree = 1 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-leading-coefficient
lemma planeCurvePolynomial_leadingCoeff (d : ℕ) :
    (planeCurvePolynomial d).leadingCoeff = (d : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-normalization
lemma planeCurvePolynomial_factorial_leadingCoeff (d : ℕ) :
    ((planeCurvePolynomial d).natDegree.factorial : ℚ) * (planeCurvePolynomial d).leadingCoeff = (d : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial
def planeSurfacePolynomial : Polynomial ℚ := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-eval
lemma planeSurfacePolynomial_eval (N : ℕ) :
    planeSurfacePolynomial.eval (N : ℚ) = (Nat.choose (N + 2) 2 : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-degree
lemma planeSurfacePolynomial_natDegree : planeSurfacePolynomial.natDegree = 2 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-leading-coefficient
lemma planeSurfacePolynomial_leadingCoeff : planeSurfacePolynomial.leadingCoeff = (1 / 2 : ℚ) := by sorry

lemma planeSurfacePolynomial_factorial_leadingCoeff :
    (planeSurfacePolynomial.natDegree.factorial : ℚ) * planeSurfacePolynomial.leadingCoeff = 1 := by sorry

variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-eval-iff
lemma planeCurvePolynomial_eval_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    (planeCurvePolynomial d).eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) ↔ d ≤ N + 2 := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-tail
lemma planeCurvePolynomial_tail (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    ∀ N ≥ d - 2, (planeCurvePolynomial d).eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-unique
lemma planeCurvePolynomial_unique (d : ℕ) (hd : f.order = (d : ℕ∞)) (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ)) :
    P = planeCurvePolynomial d := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-native-polynomial-existence
lemma planeCurve_existsUnique_polynomial (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    ∃! P : Polynomial ℚ, ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-eval
lemma planeZeroEquation_polynomial_eval (N : ℕ) :
    planeSurfacePolynomial.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-unique
lemma planeZeroEquation_polynomial_unique (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ)) :
    P = planeSurfacePolynomial := by sorry

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-native-polynomial-existence
lemma planeZeroEquation_existsUnique_polynomial :
    ∃! P : Polynomial ℚ, ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by sorry

end ExplicitLengthPolynomials
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel.CurvePolynomialTests
open Polynomial
noncomputable section
local notation "R" => MvPowerSeries (Fin 2) (ZMod 2)
local notation "x" => (MvPowerSeries.X (0 : Fin 2) : R)
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → R))
local notation "B4" => R ⧸ Ideal.span {x ^ 4}
local notation "q4" => Ideal.map (Ideal.Quotient.mk (Ideal.span {x ^ 4})) v

-- test: CurvePolynomialTests.quartic_formula
example :
    planeCurvePolynomial 4 = C 4 * X - C 2 ∧
      (planeCurvePolynomial 4).natDegree = 1 ∧ (planeCurvePolynomial 4).leadingCoeff = 4 := by sorry

-- test: CurvePolynomialTests.unit_zero
example :
    planeCurvePolynomial 0 = 0 ∧ (planeCurvePolynomial 0).degree = ⊥ ∧
      ((planeCurvePolynomial 0).natDegree.factorial : ℚ) * (planeCurvePolynomial 0).leadingCoeff = 0 := by sorry

-- test: CurvePolynomialTests.smooth_polynomial
example : planeCurvePolynomial 1 = X + 1 := by sorry

-- test: CurvePolynomialTests.characteristic_two_unique
example (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (M := B4) q4 N).toNat : ℚ)) :
    P = C 4 * X - C 2 := by sorry

-- test: CurvePolynomialTests.sharp_tail
example :
    (∀ (N : ℕ), N ≥ 2 → (planeCurvePolynomial 4).eval (N : ℚ) = ((function (M := B4) q4 N).toNat : ℚ)) ∧
      (planeCurvePolynomial 4).eval (1 : ℚ) ≠ ((function (M := B4) q4 1).toNat : ℚ) := by sorry

-- test: CurvePolynomialTests.cumulative_not_graded
example :
    planeCurvePolynomial 4 ≠ C 4 ∧ gradedFunction (M := B4) q4 3 = 4 := by sorry

-- test: CurvePolynomialTests.coefficient_characteristic_is_not_length
example :
    (Polynomial.C (4 : ZMod 2) * Polynomial.X - Polynomial.C 2 : Polynomial (ZMod 2)) = 0 ∧
      function (M := B4) q4 0 = 1 := by sorry

-- test: CurvePolynomialTests.surface_shape
example :
    planeSurfacePolynomial = C (1 / 2) * (X + 1) * (X + 2) ∧
      planeSurfacePolynomial.natDegree = 2 ∧ planeSurfacePolynomial.leadingCoeff = (1 / 2 : ℚ) := by sorry

-- test: CurvePolynomialTests.surface_all_lengths
example (N : ℕ) :
    let B := R ⧸ Ideal.span {(0 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    planeSurfacePolynomial.eval (N : ℚ) = ((function (M := B) q N).toNat : ℚ) ∧
      (planeSurfacePolynomial.natDegree.factorial : ℚ) * planeSurfacePolynomial.leadingCoeff = 1 := by sorry

-- test: CurvePolynomialTests.zero_and_unit_quotients
example :
    let B0 := R ⧸ Ideal.span {(0 : R)}
    let q0 := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    let B1 := R ⧸ Ideal.span {(1 : R)}
    let q1 := (v).map (Ideal.Quotient.mk (Ideal.span {(1 : R)}))
    function (M := B0) q0 0 = 1 ∧ function (M := B1) q1 0 = 0 ∧
      planeSurfacePolynomial ≠ planeCurvePolynomial 0 := by sorry

-- test: CurvePolynomialTests.surface_unique
example (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K,
      P.eval (N : ℚ) = ((function
        (M := R ⧸ Ideal.span {(0 : R)})
        ((v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))) N).toNat : ℚ)) :
    P = planeSurfacePolynomial := by sorry

end
end TauCeti.HilbertSamuel.CurvePolynomialTests

/- BEGIN ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Order.Interval.Set.Infinite
import Mathlib.RingTheory.Ideal.Quotient.PowTransition
import Mathlib.Data.Nat.Choose.Cast
import Mathlib.RingTheory.MvPowerSeries.NoZeroDivisors
import Mathlib.RingTheory.Length
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.LinearAlgebra.Finsupp.VectorSpace
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.RingTheory.MvPowerSeries.Order
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.Tactic
import Mathlib.RingTheory.MvPowerSeries.Inverse
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.LocalRing.Length
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Algebra.Field.ZMod
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.Complex.FiniteDimensional


noncomputable section
open scoped BigOperators
namespace TauCeti.HilbertSamuel

variable {σ k : Type*} [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

lemma monomial_mem_variableIdeal_pow_degree (β : σ →₀ ℕ) :
    MvPowerSeries.monomial β (1 : k) ∈ v ^ β.degree := by
  classical
  have hp : ∀ s : Finset σ,
      (∏ i ∈ s, (MvPowerSeries.X i : R) ^ β i) ∈ v ^ (∑ i ∈ s, β i) := by
    intro s
    induction s using Finset.induction_on with
    | empty => simp
    | @insert i s hi ih =>
      rw [Finset.prod_insert hi, Finset.sum_insert hi, pow_add]
      exact Ideal.mul_mem_mul
        (Ideal.pow_mem_pow (Ideal.subset_span (Set.mem_range_self i)) (β i)) ih
  rw [MvPowerSeries.monomial_one_eq]
  exact hp β.support

lemma order_lower_bound_of_mem_variableIdeal_pow (g : R) (r : ℕ)
    (hg : g ∈ v ^ r) : (r : ℕ∞) ≤ g.order := by
  have hv : v ≤ RingHom.ker (@MvPowerSeries.constantCoeff σ k _) := by
    refine Ideal.span_le.mpr ?_
    rintro _ ⟨i, rfl⟩
    simp
  have hvo : ∀ g : R, g ∈ v → (1 : ℕ∞) ≤ g.order := by
    intro g hg
    exact MvPowerSeries.one_le_order_iff_constCoeff_eq_zero.mpr (hv hg)
  induction r generalizing g with
  | zero => simp
  | succ r ih =>
    rw [pow_succ] at hg
    refine Submodule.mul_induction_on hg ?_ ?_
    · intro a ha b hb
      calc
        ((r + 1 : ℕ) : ℕ∞) = (r : ℕ∞) + 1 := by simp
        _ ≤ a.order + b.order := add_le_add (ih a ha) (hvo b hb)
        _ ≤ (a * b).order := MvPowerSeries.le_order_mul
    · intro a b ha hb
      exact le_trans (le_min ha hb) MvPowerSeries.min_order_le_add

lemma exists_degree_monomial_factorization [Finite σ] (g : R) (r : ℕ)
    (hg : (r : ℕ∞) ≤ g.order) :
    ∃ h : (σ →₀ ℕ) → R,
      g = ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := σ) r).toFinset,
        MvPowerSeries.monomial β (1 : k) * h β := by
  classical
  let pick : (σ →₀ ℕ) → (σ →₀ ℕ) := fun α =>
    if ha : r ≤ α.degree then Classical.choose (Finsupp.exists_le_degree_eq α r ha) else 0
  have pick_spec (α : σ →₀ ℕ) (ha : r ≤ α.degree) :
      pick α ≤ α ∧ (pick α).degree = r := by
    simpa [pick, ha] using Classical.choose_spec (Finsupp.exists_le_degree_eq α r ha)
  let h : (σ →₀ ℕ) → R := fun β γ =>
    if pick (β + γ) = β then MvPowerSeries.coeff (β + γ) g else 0
  refine ⟨h, MvPowerSeries.ext fun α => ?_⟩
  rw [map_sum]
  by_cases ha : r ≤ α.degree
  · have hs := pick_spec α ha
    have hmem : pick α ∈ (Finsupp.finite_of_degree_eq (σ := σ) r).toFinset := by
      simpa using hs.2
    rw [Finset.sum_eq_single (pick α)]
    · rw [MvPowerSeries.coeff_monomial_mul, ite_eq_left hs.1, one_mul]
      change g α = if pick (pick α + (α - pick α)) = pick α then
        g (pick α + (α - pick α)) else 0
      rw [add_tsub_cancel_of_le hs.1, ite_eq_left rfl]
    · intro β hβ hne
      rw [MvPowerSeries.coeff_monomial_mul]
      by_cases hle : β ≤ α
      · rw [ite_eq_left hle, one_mul]
        change (if pick (β + (α - β)) = β then g (β + (α - β)) else 0) = 0
        rw [add_tsub_cancel_of_le hle, ite_eq_right (Ne.symm hne)]
      · rw [ite_eq_right hle]
    · exact fun hn => False.elim (hn hmem)
  · have hzero : MvPowerSeries.coeff α g = 0 :=
      MvPowerSeries.coeff_of_lt_order
        ((Nat.cast_lt.mpr (Nat.lt_of_not_ge ha)).trans_le hg)
    rw [hzero]
    symm
    apply Finset.sum_eq_zero
    intro β hβ
    rw [MvPowerSeries.coeff_monomial_mul, ite_eq_right]
    intro hle
    have hd : β.degree = r := by simpa using hβ
    exact ha (hd ▸ Finsupp.degree_mono hle)

lemma mem_variableIdeal_pow_iff [Finite σ] (g : R) (r : ℕ) :
    g ∈ v ^ r ↔ (r : ℕ∞) ≤ g.order := by
  constructor
  · exact order_lower_bound_of_mem_variableIdeal_pow g r
  · intro hg
    obtain ⟨h, rfl⟩ := exists_degree_monomial_factorization g r hg
    apply Ideal.sum_mem
    intro β hβ
    have hd : β.degree = r := by simpa using hβ
    exact Ideal.mul_mem_right _ _ (hd ▸ monomial_mem_variableIdeal_pow_degree β)

end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel

-- Arbitrary, even infinite, variable sets in the forward direction.
-- test: HilbertSamuelVariableIdealTest.infinite_variables_forward
example (g : MvPowerSeries ℕ (ZMod 4)) (r : ℕ)
    (hg : g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      ℕ → MvPowerSeries ℕ (ZMod 4)))) ^ r) : (r : ℕ∞) ≤ g.order :=
  order_lower_bound_of_mem_variableIdeal_pow g r hg

-- Zero and power zero do not require a nontrivial coefficient ring.
-- test: HilbertSamuelVariableIdealTest.zero_series
example {σ k : Type*} [Finite σ] [CommRing k] (r : ℕ) :
    (0 : MvPowerSeries σ k) ∈
      (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ r :=
  (mem_variableIdeal_pow_iff 0 r).mpr (by simp)

-- test: HilbertSamuelVariableIdealTest.zero_power
example {σ k : Type*} [CommRing k] (g : MvPowerSeries σ k) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ 0 := by
  simp

-- test: HilbertSamuelVariableIdealTest.zero_degree_factorization
example {σ k : Type*} [Finite σ] [CommRing k] (g : MvPowerSeries σ k) :
    ∃ h : (σ →₀ ℕ) → MvPowerSeries σ k,
      g = ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := σ) 0).toFinset,
        MvPowerSeries.monomial β (1 : k) * h β :=
  exists_degree_monomial_factorization g 0 (by simp)

-- Empty variable set: positive-order series really are zero.
-- test: HilbertSamuelVariableIdealTest.empty_variables
example (g : MvPowerSeries PEmpty ℚ) (r : ℕ) (hr : 0 < r) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      PEmpty → MvPowerSeries PEmpty ℚ))) ^ r ↔ g = 0 := by
  rw [mem_variableIdeal_pow_iff]
  constructor
  · intro hg
    apply MvPowerSeries.ext
    intro α
    have hα : α = 0 := by ext i; exact i.elim
    subst α
    simpa using (MvPowerSeries.coeff_of_lt_order
      ((Nat.cast_pos.mpr hr).trans_le hg) : MvPowerSeries.coeff 0 g = 0)
  · rintro rfl
    simp

-- Degree zero and a mixed monomial check the total, not coordinatewise, bound.
-- test: HilbertSamuelVariableIdealTest.constant_monomial
example {σ k : Type*} [CommRing k] :
    MvPowerSeries.monomial (0 : σ →₀ ℕ) (1 : k) ∈
      (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ k))) ^ 0 := by
  simp

-- test: HilbertSamuelVariableIdealTest.mixed_total_degree
example :
    MvPowerSeries.monomial (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3) (1 : ZMod 4) ∈
      (Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4)))) ^ 5 := by
  have hd : (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3).degree = 5 := by
    rw [Finsupp.degree_eq_sum, Fin.sum_univ_two]
    simp
  exact hd ▸ monomial_mem_variableIdeal_pow_degree (k := ZMod 4)
    (Finsupp.single (0 : Fin 2) 2 + Finsupp.single 1 3)

-- A variable is in the ideal but not its square over a ring with zero divisors.
-- test: HilbertSamuelVariableIdealTest.variable_membership
example :
    (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 4)) ∈
      Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4))) :=
  Ideal.subset_span (Set.mem_range_self _)

-- test: HilbertSamuelVariableIdealTest.variable_not_square
example :
    (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 4)) ∉
      (Ideal.span (Set.range (MvPowerSeries.X :
        Fin 2 → MvPowerSeries (Fin 2) (ZMod 4)))) ^ 2 := by
  rw [mem_variableIdeal_pow_iff, MvPowerSeries.X,
    MvPowerSeries.order_monomial_of_ne_zero (by decide : (1 : ZMod 4) ≠ 0)]
  simp

-- The zero coefficient ring is allowed; no order(0).toNat conversion is used.
-- test: HilbertSamuelVariableIdealTest.zero_coefficient_ring
example (g : MvPowerSeries (Fin 2) (ZMod 1)) (r : ℕ) :
    g ∈ (Ideal.span (Set.range (MvPowerSeries.X :
      Fin 2 → MvPowerSeries (Fin 2) (ZMod 1)))) ^ r := by
  have hg : g = 0 := by
    apply MvPowerSeries.ext
    intro α
    exact Subsingleton.elim _ _
  rw [hg]
  exact (mem_variableIdeal_pow_iff 0 r).mpr (by simp)

-- The finite decomposition applies to the sum, not just individual monomials.
-- test: HilbertSamuelVariableIdealTest.sum_factorization
example :
    ∃ h : (Fin 2 →₀ ℕ) → MvPowerSeries (Fin 2) (ZMod 4),
      ((MvPowerSeries.X (0 : Fin 2)) ^ 2 + (MvPowerSeries.X 1) ^ 2 :
        MvPowerSeries (Fin 2) (ZMod 4)) =
      ∑ β ∈ (Finsupp.finite_of_degree_eq (σ := Fin 2) 2).toFinset,
        MvPowerSeries.monomial β (1 : ZMod 4) * h β := by
  apply exists_degree_monomial_factorization
  apply (mem_variableIdeal_pow_iff _ 2).mp
  apply Ideal.add_mem
  · exact Ideal.pow_mem_pow (Ideal.subset_span (Set.mem_range_self (0 : Fin 2))) 2
  · exact Ideal.pow_mem_pow (Ideal.subset_span (Set.mem_range_self (1 : Fin 2))) 2

#print axioms monomial_mem_variableIdeal_pow_degree
#print axioms order_lower_bound_of_mem_variableIdeal_pow
#print axioms exists_degree_monomial_factorization
#print axioms mem_variableIdeal_pow_iff
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
lemma jet_mk_eq_iff (r : ℕ) (f g : R) :
    Ideal.Quotient.mk (v ^ r) f = Ideal.Quotient.mk (v ^ r) g ↔
      ∀ α : σ →₀ ℕ, α.degree < r → f.coeff α = g.coeff α := by
  rw [Ideal.Quotient.eq, mem_variableIdeal_pow_iff]
  constructor
  · intro h α hα
    have := MvPowerSeries.coeff_of_lt_order ((Nat.cast_lt.mpr hα).trans_le h)
    simpa [sub_eq_zero] using this
  · intro h
    apply MvPowerSeries.nat_le_order
    intro α hα
    simpa using sub_eq_zero.mpr (h α hα)
lemma truncTotalAlgHom_ker (r : ℕ) :
    RingHom.ker (MvPowerSeries.truncTotalAlgHom σ k r).toRingHom = v ^ r := by
  ext g
  change Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) (g.truncTotal r) = 0 ↔ _
  rw [Ideal.Quotient.eq_zero_iff_mem, MvPolynomial.mem_pow_idealOfVars_iff',
    mem_variableIdeal_pow_iff]
  constructor
  · intro h
    apply MvPowerSeries.nat_le_order
    intro α hα
    simpa [MvPowerSeries.coeff_truncTotal _ hα] using h α hα
  · intro hg α hα
    rw [MvPowerSeries.coeff_truncTotal _ hα]
    exact MvPowerSeries.coeff_of_lt_order ((Nat.cast_lt.mpr hα).trans_le hg)
lemma truncTotalAlgHom_surjective (r : ℕ) :
    Function.Surjective (MvPowerSeries.truncTotalAlgHom σ k r) := by
  intro x
  obtain ⟨p, rfl⟩ := Ideal.Quotient.mk_surjective x
  exact ⟨(p : R), (MvPowerSeries.truncTotalAlgHom σ k r).commutes p⟩
def totalJetEquiv (r : ℕ) :
    (R ⧸ v ^ r) ≃ₐ[k] (MvPolynomial σ k ⧸ MvPolynomial.idealOfVars σ k ^ r) :=
  (Ideal.quotientEquivAlgOfEq k (truncTotalAlgHom_ker (σ := σ) (k := k) r).symm).trans
    (Ideal.quotientKerAlgEquivOfSurjective
      (f := (MvPowerSeries.truncTotalAlgHom σ k r).restrictScalars k)
      (truncTotalAlgHom_surjective r))
lemma totalJetEquiv_mk (r : ℕ) (g : R) :
    totalJetEquiv (σ := σ) (k := k) r (Ideal.Quotient.mk (v ^ r) g) =
      Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) (g.truncTotal r) := by rfl
lemma totalJetEquiv_symm_mk (r : ℕ) (p : MvPolynomial σ k) :
    (totalJetEquiv (σ := σ) (k := k) r).symm
      (Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) p) =
        Ideal.Quotient.mk (v ^ r) (p : R) := by
  apply (totalJetEquiv (σ := σ) (k := k) r).injective
  rw [AlgEquiv.apply_symm_apply, totalJetEquiv_mk]
  exact ((MvPowerSeries.truncTotalAlgHom σ k r).commutes p).symm
lemma totalJetEquiv_mul (r : ℕ) (a b : R ⧸ v ^ r) :
    totalJetEquiv (σ := σ) (k := k) r (a * b) =
      totalJetEquiv (σ := σ) (k := k) r a * totalJetEquiv (σ := σ) (k := k) r b :=
  map_mul _ _ _
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
def totalJetCoefficients (r : ℕ) :
    (R ⧸ v ^ r) →ₗ[k] ({α : σ →₀ ℕ // α.degree < r} → k) :=
  ((v ^ r).restrictScalars k).liftQ
    (LinearMap.pi fun α => (MvPowerSeries.coeff α.val : R →ₗ[k] k)) (by
      intro g hg
      ext α
      exact MvPowerSeries.coeff_of_lt_order
        ((Nat.cast_lt.mpr α.property).trans_le ((mem_variableIdeal_pow_iff g r).mp hg)))
lemma totalJetCoefficients_mk (r : ℕ) (g : R) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) g) α = g.coeff α.val := rfl
lemma totalJetCoefficients_bijective (r : ℕ) :
    Function.Bijective (totalJetCoefficients (σ := σ) (k := k) r) := by
  constructor
  · intro a b hab
    obtain ⟨f, rfl⟩ := Ideal.Quotient.mk_surjective a
    obtain ⟨g, rfl⟩ := Ideal.Quotient.mk_surjective b
    apply (jet_mk_eq_iff r f g).mpr
    intro α hα
    exact congrFun hab ⟨α, hα⟩
  · intro c
    classical
    let g : R := fun α => if h : α.degree < r then c ⟨α, h⟩ else 0
    refine ⟨Ideal.Quotient.mk (v ^ r) g, ?_⟩
    ext α
    change (if h : α.val.degree < r then c ⟨α.val, h⟩ else 0) = c α
    simp [α.property]
def totalJetCoordinates (r : ℕ) :
    (R ⧸ v ^ r) ≃ₗ[k] ({α : σ →₀ ℕ // α.degree < r} → k) :=
  LinearEquiv.ofBijective (totalJetCoefficients r) (totalJetCoefficients_bijective r)
lemma totalJetCoordinates_mk (r : ℕ) (g : R) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoordinates r (Ideal.Quotient.mk (v ^ r) g) α = g.coeff α.val := rfl
lemma totalJetCoordinates_symm_apply (r : ℕ)
    (c : {α : σ →₀ ℕ // α.degree < r} → k)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoordinates r ((totalJetCoordinates (σ := σ) (k := k) r).symm c) α = c α := by
  rw [LinearEquiv.apply_symm_apply]
def totalJetBasis (r : ℕ) :
    Module.Basis {α : σ →₀ ℕ // α.degree < r} k (R ⧸ v ^ r) := by
  letI : Fintype {α : σ →₀ ℕ // α.degree < r} :=
    (Finsupp.finite_of_degree_lt (σ := σ) r).fintype
  exact Module.Basis.ofEquivFun (totalJetCoordinates r)
lemma totalJetBasis_repr_mk (r : ℕ) (g : R)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    (totalJetBasis (σ := σ) (k := k) r).repr (Ideal.Quotient.mk (v ^ r) g) α =
      g.coeff α.val := rfl
lemma totalJetBasis_apply (r : ℕ) (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetBasis (σ := σ) (k := k) r α =
      Ideal.Quotient.mk (v ^ r) (MvPowerSeries.monomial α.val 1) := by
  classical
  apply (totalJetBasis r).repr.injective
  ext β
  rw [Module.Basis.repr_self, totalJetBasis_repr_mk]
  simp only [Finsupp.single_apply, MvPowerSeries.coeff_monomial]
  congr 1
  exact propext (Subtype.ext_iff.trans eq_comm)
lemma totalJetBasis_finite (r : ℕ) : Module.Finite k (R ⧸ v ^ r) := by
  let : Fintype {α : σ →₀ ℕ // α.degree < r} :=
    (Finsupp.finite_of_degree_lt (σ := σ) r).fintype
  exact Module.Finite.of_basis (totalJetBasis r)
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
lemma planeJetIndex_card (r : ℕ) :
    Nat.card {α : Fin 2 →₀ ℕ // α.degree < r} = Nat.choose (r + 1) 2 := by
  classical
  let : Fintype {α : Fin 2 →₀ ℕ // α.degree < r} :=
    (Finsupp.finite_of_degree_lt (σ := Fin 2) r).fintype
  have hdegree (α : Fin 2 →₀ ℕ) : α.degree = α 0 + α 1 := by
    rw [Finsupp.degree_eq_sum, Fin.sum_univ_two]
  let e : {α : Fin 2 →₀ ℕ // α.degree < r} ≃ (t : Fin r) × Fin (t.val + 1) :=
    { toFun := fun α => ⟨⟨α.val.degree, α.property⟩,
        ⟨α.val 0, by change α.val 0 < α.val.degree + 1; rw [hdegree]; omega⟩⟩
      invFun := fun t => ⟨Finsupp.single 0 t.2.val + Finsupp.single 1 (t.1.val - t.2.val), by
        rw [hdegree]
        simp only [Finsupp.add_apply, Finsupp.single_eq_same, Finsupp.single_eq_of_ne
          (by decide : (0 : Fin 2) ≠ 1), Finsupp.single_eq_of_ne (by decide : (1 : Fin 2) ≠ 0),
          zero_add, add_zero]
        have := t.1.isLt; have := t.2.isLt; omega⟩
      left_inv := by
        intro α
        apply Subtype.ext
        ext i
        fin_cases i
        · simp
        · change (Finsupp.single (0 : Fin 2) (α.val 0) +
              Finsupp.single 1 (α.val.degree - α.val 0) : Fin 2 →₀ ℕ) 1 = α.val 1
          simp [hdegree]
      right_inv := by
        intro ⟨t, i⟩
        apply Sigma.ext
        · apply Fin.ext
          simp only [hdegree, Finsupp.add_apply, Finsupp.single_eq_same,
            Finsupp.single_eq_of_ne (by decide : (0 : Fin 2) ≠ 1),
            Finsupp.single_eq_of_ne (by decide : (1 : Fin 2) ≠ 0), zero_add, add_zero]
          have := i.isLt
          omega
        · apply (Fin.heq_ext_iff (by
            simp only [hdegree, Finsupp.add_apply, Finsupp.single_eq_same,
              Finsupp.single_eq_of_ne (by decide : (0 : Fin 2) ≠ 1),
              Finsupp.single_eq_of_ne (by decide : (1 : Fin 2) ≠ 0), zero_add, add_zero]
            have := i.isLt
            omega)).mpr
          simp }
  rw [Nat.card_congr e, Nat.card_eq_fintype_card, Fintype.card_sigma]
  simp only [Fintype.card_fin]
  change (∑ t : Fin r, (t.val + 1)) = _
  rw [show (∑ t : Fin r, (t.val + 1)) = ∑ t ∈ Finset.range r, (t + 1) from
    Fin.sum_univ_eq_sum_range (fun t => t + 1) r]
  cases r with
  | zero => simp
  | succ n => simpa using Nat.sum_range_add_choose n 1
lemma planeTotalJet_finrank {k : Type*} [Field k] (r : ℕ) :
    let q : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span (Set.range MvPowerSeries.X)
    Module.finrank k (MvPowerSeries (Fin 2) k ⧸ q ^ r) = Nat.choose (r + 1) 2 := by
  exact (Module.finrank_eq_nat_card_basis (totalJetBasis r)).trans (planeJetIndex_card r)
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
open scoped Classical in
lemma totalJetCoefficients_monomial (r : ℕ) (β : σ →₀ ℕ) (a : k)
    (α : {α : σ →₀ ℕ // α.degree < r}) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) (MvPowerSeries.monomial β a)) α =
      if α.val = β then a else 0 := by
  classical
  rw [totalJetCoefficients_mk, MvPowerSeries.coeff_monomial]
lemma totalJetCoefficients_eq_zero_iff (r : ℕ) (x : R ⧸ v ^ r) :
    totalJetCoefficients (σ := σ) (k := k) r x = 0 ↔ x = 0 :=
  (totalJetCoefficients_bijective r).injective.eq_iff' (map_zero _)
lemma totalJetCoordinates_symm_coeff (r : ℕ) (g : R) :
    (totalJetCoordinates (σ := σ) (k := k) r).symm
      (fun α => g.coeff α.val) = Ideal.Quotient.mk (v ^ r) g :=
  (totalJetCoordinates r).symm_apply_apply (Ideal.Quotient.mk (v ^ r) g)

-- test: HilbertSamuelJetCoordinatesTest.coefficients_zero_cutoff
example (g : R) : totalJetCoefficients 0 (Ideal.Quotient.mk (v ^ 0) g) = 0 := by
  ext α
  exact (Nat.not_lt_zero _ α.property).elim
-- test: HilbertSamuelJetCoordinatesTest.coefficients_constant_nilpotent
example : totalJetCoefficients (σ := Fin 2) (k := ZMod 4) 1
    (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 1) (MvPowerSeries.C 2))
      ⟨0, by simp⟩ = 2 := by
  change MvPowerSeries.coeff 0 (MvPowerSeries.C (σ := Fin 2) (2 : ZMod 4)) = 2
  simp
-- test: HilbertSamuelJetCoordinatesTest.coefficients_exact_cutoff
example : totalJetCoefficients (σ := Fin 2) (k := ZMod 4) 2
    (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 2)
      (MvPowerSeries.monomial (Finsupp.single 0 2) 1)) = 0 := by
  ext α
  classical
  rw [totalJetCoefficients_monomial]
  split_ifs with h
  · have := α.property
    simp [h] at this
  · rfl
-- test: HilbertSamuelJetCoordinatesTest.representative_independence
example (r : ℕ) (f g : R) (hg : g ∈ v ^ r) :
    totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) (f + g)) =
      totalJetCoefficients r (Ideal.Quotient.mk (v ^ r) f) := by
  rw [map_add, Ideal.Quotient.eq_zero_iff_mem.mpr hg, add_zero]
-- test: HilbertSamuelJetCoordinatesTest.coordinates_reconstruction
example (r : ℕ) (g : R) :
    (totalJetCoordinates r).symm (fun α => g.coeff α.val) = Ideal.Quotient.mk (v ^ r) g :=
  totalJetCoordinates_symm_coeff r g
-- test: HilbertSamuelJetCoordinatesTest.coordinates_empty_variables
example (a : ZMod 4) :
    totalJetCoordinates (σ := PEmpty) 1
      (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ 1) (MvPowerSeries.C a))
      ⟨0, by simp⟩ = a := by
  change MvPowerSeries.coeff 0 (MvPowerSeries.C (σ := PEmpty) a) = a
  simp
-- test: HilbertSamuelJetCoordinatesTest.coordinates_zero_ring
example (r : ℕ) (g : MvPowerSeries (Fin 2) (ZMod 1)) :
    totalJetCoordinates r (Ideal.Quotient.mk (Ideal.span (Set.range MvPowerSeries.X) ^ r) g) = 0 :=
  Subsingleton.elim _ _
-- test: HilbertSamuelJetCoordinatesTest.basis_zero_cutoff
example (g : R ⧸ v ^ 0) : (totalJetBasis (σ := σ) (k := k) 0).repr g = 0 := by
  ext α
  exact (Nat.not_lt_zero _ α.property).elim
-- test: HilbertSamuelJetCoordinatesTest.basis_mixed_monomial
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Ideal.Quotient.mk (q ^ 3)
      (MvPowerSeries.monomial (Finsupp.single 0 1 + Finsupp.single 1 1) 1) ≠ 0 ∧
      Ideal.Quotient.mk (q ^ 3) (MvPowerSeries.monomial (Finsupp.single 0 3) 1) = 0 := by
  dsimp
  constructor
  · intro h
    have hd : (Finsupp.single (0 : Fin 2) 1 + Finsupp.single 1 1).degree < 3 := by
      rw [Finsupp.degree_eq_sum, Fin.sum_univ_two]
      simp
    have h' := congrArg
      (fun x => (totalJetBasis (σ := Fin 2) (k := ZMod 2) 3).repr x
        ⟨Finsupp.single 0 1 + Finsupp.single 1 1, hd⟩) h
    simp [totalJetBasis_repr_mk] at h'
  · rw [Ideal.Quotient.eq_zero_iff_mem, mem_variableIdeal_pow_iff,
      MvPowerSeries.order_monomial_of_ne_zero (by decide : (1 : ZMod 2) ≠ 0)]
    simp
-- test: HilbertSamuelJetCoordinatesTest.polynomial_inverse
example (r : ℕ) (p : MvPolynomial σ k) :
    (totalJetEquiv (σ := σ) (k := k) r).symm
      (Ideal.Quotient.mk (MvPolynomial.idealOfVars σ k ^ r) p) =
      Ideal.Quotient.mk (v ^ r) (p : R) := totalJetEquiv_symm_mk r p
-- test: HilbertSamuelJetCoordinatesTest.count_zero
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 0} = 0 := by
  rw [planeJetIndex_card]; decide
-- test: HilbertSamuelJetCoordinatesTest.count_one
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 1} = 1 := by
  rw [planeJetIndex_card]; decide
-- test: HilbertSamuelJetCoordinatesTest.count_three
example : Nat.card {α : Fin 2 →₀ ℕ // α.degree < 3} = 6 := by
  rw [planeJetIndex_card]; decide
-- test: HilbertSamuelJetCoordinatesTest.field_length_six
example :
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (ZMod 2) (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) = 6 := by
  let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
  have : Module.Finite (ZMod 2) (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) := totalJetBasis_finite 3
  change Module.length (ZMod 2) (MvPowerSeries (Fin 2) (ZMod 2) ⧸ q ^ 3) = 6
  rw [Module.length_eq_finrank, planeTotalJet_finrank]
  norm_num [Nat.choose]
end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.jet_mk_eq_iff
#print axioms TauCeti.HilbertSamuel.truncTotalAlgHom_ker
#print axioms TauCeti.HilbertSamuel.truncTotalAlgHom_surjective
#print axioms TauCeti.HilbertSamuel.totalJetEquiv
#print axioms TauCeti.HilbertSamuel.totalJetEquiv_mk
#print axioms TauCeti.HilbertSamuel.totalJetEquiv_symm_mk
#print axioms TauCeti.HilbertSamuel.totalJetEquiv_mul
#print axioms TauCeti.HilbertSamuel.totalJetCoefficients
#print axioms TauCeti.HilbertSamuel.totalJetCoefficients_mk
#print axioms TauCeti.HilbertSamuel.totalJetCoefficients_bijective
#print axioms TauCeti.HilbertSamuel.totalJetCoordinates
#print axioms TauCeti.HilbertSamuel.totalJetCoordinates_mk
#print axioms TauCeti.HilbertSamuel.totalJetCoordinates_symm_apply
#print axioms TauCeti.HilbertSamuel.totalJetBasis
#print axioms TauCeti.HilbertSamuel.totalJetBasis_repr_mk
#print axioms TauCeti.HilbertSamuel.totalJetBasis_apply
#print axioms TauCeti.HilbertSamuel.totalJetBasis_finite
#print axioms TauCeti.HilbertSamuel.planeJetIndex_card
#print axioms TauCeti.HilbertSamuel.planeTotalJet_finrank
#print axioms TauCeti.HilbertSamuel.totalJetCoefficients_monomial
#print axioms TauCeti.HilbertSamuel.totalJetCoefficients_eq_zero_iff
#print axioms TauCeti.HilbertSamuel.totalJetCoordinates_symm_coeff

namespace TauCeti.HilbertSamuel
noncomputable section PrincipalQuotients
variable {A : Type*} [CommRing A]

lemma pow_mul_denominator (q : Ideal A) (f : A) (d n : ℕ)
    (hdn : d ≤ n) (hf : f ∈ q ^ d) :
    (q ^ (n - d) : Submodule A A) ≤
      Submodule.comap (LinearMap.mulLeft A f) (q ^ n : Submodule A A) := by
  intro g hg
  change f * g ∈ q ^ n
  have h := Ideal.mul_mem_mul hf hg
  rwa [← Ideal.IsTwoSided.pow_add, Nat.add_sub_of_le hdn] at h

def quotientMulMap (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    (A ⧸ J) →ₗ[A] (A ⧸ K) := Submodule.mapQ _ _ (LinearMap.mulLeft A f) h

lemma quotientMulMap_apply (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) (g : A) :
    quotientMulMap J K f h (Submodule.mkQ J g) = Submodule.mkQ K (f * g) := rfl

def principalQuotientProjection (K : Ideal A) (f : A) :
    (A ⧸ K) →ₗ[A] (A ⧸ (Ideal.span {f} ⊔ K)) :=
  Submodule.factor (show (K : Submodule A A) ≤ (Ideal.span {f} ⊔ K) from le_sup_right)

lemma principalQuotientProjection_apply (K : Ideal A) (f g : A) :
    principalQuotientProjection K f (Submodule.mkQ K g) =
      Submodule.mkQ (Ideal.span {f} ⊔ K) g := rfl

lemma quotientMulMap_exact (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    LinearMap.range (quotientMulMap J K f h) =
      LinearMap.ker (principalQuotientProjection K f) ∧
      Function.Surjective (principalQuotientProjection K f) := by
  refine ⟨?_, Submodule.factor_surjective (show (K : Submodule A A) ≤ (Ideal.span {f} ⊔ K) from le_sup_right)⟩
  apply le_antisymm
  · rintro x ⟨y, rfl⟩
    obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective J y
    change Submodule.mkQ (Ideal.span {f} ⊔ K) (f * g) = 0
    apply (Submodule.Quotient.mk_eq_zero _).mpr
    apply Submodule.mem_sup_left
    exact Ideal.mem_span_singleton'.mpr ⟨g, mul_comm g f⟩
  · intro x hx
    obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective K x
    change Submodule.mkQ (Ideal.span {f} ⊔ K) g = 0 at hx
    obtain ⟨a, b, hb, he⟩ := Ideal.mem_span_singleton_sup.mp
      ((Submodule.Quotient.mk_eq_zero _).mp hx)
    refine ⟨Submodule.mkQ J a, ?_⟩
    rw [quotientMulMap_apply]
    apply (Submodule.Quotient.eq _).mpr
    change f * a - g ∈ K
    rw [← he, mul_comm f a, sub_add_cancel_left]
    exact K.neg_mem hb

lemma quotientMulMap_injective_iff (J K : Ideal A) (f : A)
    (h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) K) :
    Function.Injective (quotientMulMap J K f h) ↔
      ∀ g : A, f * g ∈ K → g ∈ J := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  constructor
  · intro hi g hg
    exact (Submodule.Quotient.mk_eq_zero _).mp
      (hi (Submodule.mkQ J g) ((Submodule.Quotient.mk_eq_zero _).mpr hg))
  · intro hi x hx
    obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective J x
    apply (Submodule.Quotient.mk_eq_zero _).mpr
    exact hi g ((Submodule.Quotient.mk_eq_zero _).mp hx)

lemma principalQuotientProjection_bijective (K : Ideal A) (f : A) (hf : f ∈ K) :
    Ideal.span {f} ⊔ K = K ∧ Function.Bijective (principalQuotientProjection K f) := by
  have he : Ideal.span {f} ⊔ K = K := sup_eq_right.mpr
    ((Ideal.span_singleton_le_iff_mem K).mpr hf)
  refine ⟨he, ?_, Submodule.factor_surjective (show (K : Submodule A A) ≤ (Ideal.span {f} ⊔ K) from le_sup_right)⟩
  intro x y hxy
  obtain ⟨a, rfl⟩ := Submodule.mkQ_surjective K x
  obtain ⟨b, rfl⟩ := Submodule.mkQ_surjective K y
  apply (Submodule.Quotient.eq _).mpr
  have hmem := (Submodule.Quotient.eq _).mp hxy
  simpa [he] using hmem

-- test: HilbertSamuelPrincipalJetTest.endpoint_denominator
example (q : Ideal A) (f : A) (n : ℕ) (hf : f ∈ q ^ n) :
    (q ^ 0 : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) (q ^ n) := by
  simpa using pow_mul_denominator q f n n le_rfl hf

-- test: HilbertSamuelPrincipalJetTest.zero_cutoff
example (q : Ideal A) (f : A) :
    (q ^ 0 : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A f) (q ^ 0) := by
  apply pow_mul_denominator q f 0 0 le_rfl
  simp

-- test: HilbertSamuelPrincipalJetTest.zero_equation
example (J K : Ideal A) :
    ∃ h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (0 : A)) K,
      quotientMulMap J K 0 h = 0 ∧
      LinearMap.ker (principalQuotientProjection K 0) = ⊥ := by
  have h : (J : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (0 : A)) K := by
    intro g hg; change 0 * g ∈ K; simp
  have hm : quotientMulMap J K 0 h = 0 := by
    apply LinearMap.ext; intro x
    obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective J x
    change Submodule.mkQ K (0 * g) = 0
    simp
  refine ⟨h, hm, ?_⟩
  rw [← (quotientMulMap_exact J K 0 h).1, hm]
  simp

-- test: HilbertSamuelPrincipalJetTest.unit_equation
example (K : Ideal A) :
    ∃ h : (K : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (1 : A)) K,
      quotientMulMap K K 1 h = LinearMap.id ∧
      LinearMap.ker (principalQuotientProjection K 1) = ⊤ := by
  have h : (K : Submodule A A) ≤ Submodule.comap (LinearMap.mulLeft A (1 : A)) K := by
    intro g hg; simpa using hg
  have hm : quotientMulMap K K 1 h = LinearMap.id := by
    apply LinearMap.ext; intro x
    obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective K x
    change Submodule.mkQ K (1 * g) = Submodule.mkQ K g
    rw [one_mul]
  refine ⟨h, hm, ?_⟩
  rw [← (quotientMulMap_exact K K 1 h).1, hm]
  simp

-- test: HilbertSamuelPrincipalJetTest.zero_divisor_noninjective
example :
    ∃ h : ((⊥ : Ideal (ZMod 4)) : Submodule (ZMod 4) (ZMod 4)) ≤
        Submodule.comap (LinearMap.mulLeft (ZMod 4) 2) (⊥ : Ideal (ZMod 4)),
      ¬ Function.Injective (quotientMulMap ⊥ ⊥ (2 : ZMod 4) h) ∧
      LinearMap.range (quotientMulMap ⊥ ⊥ (2 : ZMod 4) h) =
        LinearMap.ker (principalQuotientProjection ⊥ (2 : ZMod 4)) ∧
      Function.Surjective (principalQuotientProjection ⊥ (2 : ZMod 4)) := by
  have h : ((⊥ : Ideal (ZMod 4)) : Submodule (ZMod 4) (ZMod 4)) ≤
      Submodule.comap (LinearMap.mulLeft (ZMod 4) 2) (⊥ : Ideal (ZMod 4)) := bot_le
  refine ⟨h, ?_, (quotientMulMap_exact ⊥ ⊥ 2 h).1, (quotientMulMap_exact ⊥ ⊥ 2 h).2⟩
  rw [quotientMulMap_injective_iff]
  intro hi
  have hz := hi 2 (by change (2 : ZMod 4) * 2 = 0; decide)
  have hn : (2 : ZMod 4) ≠ 0 := by decide
  exact hn hz

-- test: HilbertSamuelPrincipalJetTest.nonzero_shift
example : let q : Ideal (ZMod 4) := Ideal.span {(2 : ZMod 4)}
    let h := pow_mul_denominator q 2 1 2 (by decide) (by dsimp [q]; simp)
    quotientMulMap (q ^ (2 - 1)) (q ^ 2) 2 h (Submodule.mkQ (q ^ 1) 1) =
      Submodule.mkQ (q ^ 2) 2 ∧ Submodule.mkQ (q ^ 2) 2 ≠ 0 := by
  dsimp
  refine ⟨rfl, ?_⟩
  have he : (Ideal.span {(2 : ZMod 4)}) ^ 2 = ⊥ := by
    rw [pow_two, Ideal.span_singleton_mul_span_singleton]
    have hz : (2 : ZMod 4) * 2 = 0 := by decide
    simp [hz]
  rw [he]
  rw [Ideal.Quotient.eq_zero_iff_mem]
  change ¬ (2 : ZMod 4) ∈ (⊥ : Ideal (ZMod 4))
  change (2 : ZMod 4) ≠ 0
  decide

-- test: HilbertSamuelPrincipalJetTest.wrong_source_domain
example : let K : Ideal ℤ := Ideal.span {(4 : ℤ)}
    ∃ h : (K : Submodule ℤ ℤ) ≤ Submodule.comap (LinearMap.mulLeft ℤ 2) K,
      ¬ Function.Injective (quotientMulMap K K 2 h) := by
  dsimp
  have h : (Ideal.span {(4 : ℤ)} : Submodule ℤ ℤ) ≤
      Submodule.comap (LinearMap.mulLeft ℤ 2) (Ideal.span {(4 : ℤ)}) := by
    intro g hg; exact Ideal.mul_mem_left _ _ hg
  refine ⟨h, ?_⟩
  rw [quotientMulMap_injective_iff]
  intro hi
  have hz := hi 2 (by norm_num [Ideal.mem_span_singleton])
  norm_num [Ideal.mem_span_singleton] at hz

#print axioms pow_mul_denominator
#print axioms quotientMulMap
#print axioms quotientMulMap_apply
#print axioms principalQuotientProjection
#print axioms principalQuotientProjection_apply
#print axioms quotientMulMap_exact
#print axioms quotientMulMap_injective_iff
#print axioms principalQuotientProjection_bijective
end PrincipalQuotients
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
noncomputable section ShiftedJets
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/exact-order-mul-ideal-preimage
lemma mul_mem_variableIdeal_pow_iff [NoZeroDivisors k] (f g : R) (d r : ℕ)
    (hd : f.order = (d : ℕ∞)) :
    f * g ∈ v ^ (d + r) ↔ g ∈ v ^ r := by
  rw [mem_variableIdeal_pow_iff, mem_variableIdeal_pow_iff,
    MvPowerSeries.order_mul, hd, Nat.cast_add]
  exact ENat.add_le_add_iff_left (by simp)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-denominator
lemma shiftedJet_denominator (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    (v ^ (N + 1 - d) : Submodule R R) ≤
      Submodule.comap (LinearMap.mulLeft R f) (v ^ (N + 1) : Submodule R R) := by
  exact pow_mul_denominator v f d (N + 1) (hN.trans (Nat.le_succ N))
    ((mem_variableIdeal_pow_iff f d).mpr hd)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map
def shiftedJetMap (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    (R ⧸ v ^ (N + 1 - d)) →ₗ[R] (R ⧸ v ^ (N + 1)) :=
  Submodule.mapQ _ _ (LinearMap.mulLeft R f) (shiftedJet_denominator f d N hN hd)
lemma shiftedJetMap_apply (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) (g : R) :
    shiftedJetMap f d N hN hd (Submodule.mkQ (v ^ (N + 1 - d)) g) =
      Submodule.mkQ (v ^ (N + 1)) (f * g) := rfl

def jetProjection (f : R) (N : ℕ) :
    (R ⧸ v ^ (N + 1)) →ₗ[R] (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) :=
  Submodule.factor (show (v ^ (N + 1) : Submodule R R) ≤
    (Ideal.span {f} ⊔ v ^ (N + 1)) from le_sup_right)
omit [Finite σ] in
lemma jetProjection_apply (f : R) (N : ℕ) (g : R) :
    jetProjection f N (Submodule.mkQ (v ^ (N + 1)) g) =
      Submodule.mkQ (Ideal.span {f} ⊔ v ^ (N + 1)) g := rfl

-- API: TauCeti.HilbertSamuel.shiftedJetMap_eq_quotientMulMap
lemma shiftedJetMap_eq_quotientMulMap (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    shiftedJetMap f d N hN hd = quotientMulMap (v ^ (N + 1 - d))
      (v ^ (N + 1)) f (shiftedJet_denominator f d N hN hd) := rfl
-- API: TauCeti.HilbertSamuel.jetProjection_eq_principalQuotientProjection
omit [Finite σ] in
lemma jetProjection_eq_principalQuotientProjection (f : R) (N : ℕ) :
    jetProjection f N = principalQuotientProjection (v ^ (N + 1)) f := rfl

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-injective
lemma shiftedJetMap_injective [NoZeroDivisors k] (f : R) (d N : ℕ)
    (hN : d ≤ N) (hd : f.order = (d : ℕ∞)) :
    Function.Injective (shiftedJetMap f d N hN hd.ge) := by
  rw [shiftedJetMap_eq_quotientMulMap, quotientMulMap_injective_iff]
  intro g hg
  apply (mul_mem_variableIdeal_pow_iff f g d (N + 1 - d) hd).mp
  simpa [Nat.add_sub_of_le (hN.trans (Nat.le_succ N))] using hg

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-exact
lemma shiftedJetMap_exact (f : R) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    LinearMap.range (shiftedJetMap f d N hN hd) = LinearMap.ker (jetProjection f N) ∧
      Function.Surjective (jetProjection f N) := by
  rw [shiftedJetMap_eq_quotientMulMap, jetProjection_eq_principalQuotientProjection]
  exact quotientMulMap_exact _ _ f _

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/jet-below-equation-order
lemma jetProjection_below_order (f : R) (d N : ℕ)
    (hN : N < d) (hd : (d : ℕ∞) ≤ f.order) :
    Ideal.span {f} ⊔ v ^ (N + 1) = v ^ (N + 1) ∧
      Function.Bijective (jetProjection f N) := by
  rw [jetProjection_eq_principalQuotientProjection]
  apply principalQuotientProjection_bijective
  apply (mem_variableIdeal_pow_iff f (N + 1)).mpr
  exact (Nat.cast_le.mpr hN).trans hd

-- test: HilbertSamuelShiftedOrderTest.zero_multiplier
example (r : ℕ) :
    (0 : R) * 1 ∈ v ^ (1 + r) ∧ (0 : R).order ≠ (1 : ℕ∞) := by simp
-- test: HilbertSamuelShiftedOrderTest.membership_zero_argument
example [NoZeroDivisors k] (f : R) (d r : ℕ) (hd : f.order = (d : ℕ∞)) :
    f * 0 ∈ v ^ (d + r) ↔ (0 : R) ∈ v ^ r :=
  mul_mem_variableIdeal_pow_iff f 0 d r hd
-- test: HilbertSamuelShiftedOrderTest.membership_zero_cutoff
example [NoZeroDivisors k] (f g : R) (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    f * g ∈ v ^ d := by
  simpa using (mul_mem_variableIdeal_pow_iff f g d 0 hd).mpr (by simp)

-- test: HilbertSamuelJetTest.linear_equation
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      shiftedJetMap f 1 1 (by decide) hd (Submodule.mkQ (q ^ 1) 1) =
        Submodule.mkQ (q ^ 2) f ∧ Submodule.mkQ (q ^ 2) f ≠ 0 := by
  dsimp only
  have hd : (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ).order = 1 := by
    simp [MvPowerSeries.X, MvPowerSeries.order_monomial_of_ne_zero]
  refine ⟨hd.ge, by simpa only [mul_one] using (shiftedJetMap_apply (σ := Fin 2) (k := ℚ) (MvPowerSeries.X 0) 1 1 (by decide) hd.ge 1), ?_⟩
  intro hz
  have ho := (mem_variableIdeal_pow_iff _ _).mp ((Submodule.Quotient.mk_eq_zero _).mp hz)
  rw [hd] at ho
  norm_num at ho

-- test: HilbertSamuelJetTest.unit_equation
example (N : ℕ) :
    ∀ hd : (0 : ℕ∞) ≤ (1 : MvPowerSeries (Fin 2) ℚ).order,
      shiftedJetMap (1 : MvPowerSeries (Fin 2) ℚ) 0 N (Nat.zero_le N) hd =
        LinearMap.id := by
  intro hd
  apply LinearMap.ext
  intro x
  obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective _ x
  simp [shiftedJetMap]

-- test: HilbertSamuelJetTest.nonreduced_equation
example :
    let f : MvPowerSeries (Fin 2) (ZMod 2) := MvPowerSeries.X 0 ^ 4
    let q : Ideal (MvPowerSeries (Fin 2) (ZMod 2)) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ hd : f.order = (4 : ℕ∞),
      shiftedJetMap f 4 4 (by decide) hd.ge (Submodule.mkQ (q ^ 1) 1) =
        Submodule.mkQ (q ^ 5) f ∧ Submodule.mkQ (q ^ 5) f ≠ 0 ∧
        Function.Injective (shiftedJetMap f 4 4 (by decide) hd.ge) := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2)) ^ 4).order = 4 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  refine ⟨hd, by simpa only [mul_one] using (shiftedJetMap_apply (σ := Fin 2) (k := ZMod 2) (MvPowerSeries.X 0 ^ 4) 4 4 (by decide) hd.ge 1), ?_, shiftedJetMap_injective _ 4 4 (by decide) hd⟩
  intro hz
  have ho := (mem_variableIdeal_pow_iff _ _).mp ((Submodule.Quotient.mk_eq_zero _).mp hz)
  rw [hd] at ho
  norm_num at ho

-- test: HilbertSamuelJetTest.zero_equation
example (d N : ℕ) (hN : d ≤ N) (hd : (d : ℕ∞) ≤ (0 : R).order) :
    shiftedJetMap (0 : R) d N hN hd = 0 := by
  apply LinearMap.ext
  intro x
  obtain ⟨g, rfl⟩ := Submodule.mkQ_surjective _ x
  simp [shiftedJetMap]

-- test: HilbertSamuelShiftedOrderTest.loose_order_bound
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0 ^ 2
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      ¬ Function.Injective (shiftedJetMap f 1 1 (by decide) hd) := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 2).order = 2 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  refine ⟨by rw [hd]; decide, ?_⟩
  change ¬ Function.Injective (quotientMulMap _ _ _ _)
  rw [quotientMulMap_injective_iff]
  intro hi
  have hg := hi 1 (by rw [mul_one, mem_variableIdeal_pow_iff, hd]; norm_num)
  rw [mem_variableIdeal_pow_iff] at hg
  rw [← MvPowerSeries.monomial_zero_one,
    MvPowerSeries.order_monomial_of_ne_zero (by norm_num : (1 : ℚ) ≠ 0)] at hg
  norm_num at hg

-- test: HilbertSamuelJetTest.zero_divisor_base
example :
    let f : MvPowerSeries (Fin 2) (ZMod 4) := MvPowerSeries.C 2 * MvPowerSeries.X 0
    ∃ hd : (1 : ℕ∞) ≤ f.order,
      ¬ Function.Injective (shiftedJetMap f 1 1 (by decide) hd) := by
  dsimp only
  have hd : (1 : ℕ∞) ≤ (MvPowerSeries.C 2 * MvPowerSeries.X (0 : Fin 2) :
      MvPowerSeries (Fin 2) (ZMod 4)).order := by
    apply (mem_variableIdeal_pow_iff _ 1).mp
    simpa using Ideal.mul_mem_left (Ideal.span (Set.range MvPowerSeries.X))
      (MvPowerSeries.C (2 : ZMod 4)) (Ideal.subset_span (Set.mem_range_self (0 : Fin 2)))
  refine ⟨hd, ?_⟩
  change ¬ Function.Injective (quotientMulMap _ _ _ _)
  rw [quotientMulMap_injective_iff]
  intro hi
  have hz : (MvPowerSeries.C (2 : ZMod 4) * MvPowerSeries.X (0 : Fin 2)) *
      MvPowerSeries.C 2 = 0 := by
    rw [mul_right_comm, ← map_mul]
    have hz : (2 : ZMod 4) * 2 = 0 := by decide
    rw [hz, map_zero, zero_mul]
  have hg := hi (MvPowerSeries.C 2) (by rw [hz]; simp)
  have := MvPowerSeries.coeff_of_lt_order (d := (0 : Fin 2 →₀ ℕ))
    (f := (MvPowerSeries.C (2 : ZMod 4) : MvPowerSeries (Fin 2) (ZMod 4))) ((by simp : ((0 : Fin 2 →₀ ℕ).degree : ℕ∞) < 1).trans_le
    ((mem_variableIdeal_pow_iff _ 1).mp hg))
  simp only [MvPowerSeries.coeff_zero_C] at this
  exact (by decide : (2 : ZMod 4) ≠ 0) this

-- test: HilbertSamuelShiftedOrderTest.exactness_zero_divisors
example (f : MvPowerSeries (Fin 2) (ZMod 4)) (d N : ℕ) (hN : d ≤ N)
    (hd : (d : ℕ∞) ≤ f.order) :
    LinearMap.range (shiftedJetMap f d N hN hd) = LinearMap.ker (jetProjection f N) ∧
      Function.Surjective (jetProjection f N) := shiftedJetMap_exact f d N hN hd

-- test: HilbertSamuelJetTest.small_index_not_shifted
example :
    let f : MvPowerSeries (Fin 2) ℚ := MvPowerSeries.X 0 ^ 4
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    Function.Bijective (jetProjection f 0) ∧
      ¬ Function.Injective
        (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ ⧸ q)
          (Ideal.Quotient.mk q f)) := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 4).order = 4 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  refine ⟨(jetProjection_below_order _ 4 0 (by decide) hd.ge).2, ?_⟩
  have hf : (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 4 ∈ Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) ℚ)) := by
    have ho : (1 : ℕ∞) ≤ ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 4).order := by
      rw [hd]; decide
    simpa using (mem_variableIdeal_pow_iff _ 1).mpr ho
  have hz := Ideal.Quotient.eq_zero_iff_mem.mpr hf
  rw [hz]
  intro hi
  have he : (1 : MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span (Set.range MvPowerSeries.X)) = 0 :=
    hi (by simp)
  have hm : (1 : MvPowerSeries (Fin 2) ℚ) ∈ Ideal.span (Set.range MvPowerSeries.X) :=
    Ideal.Quotient.eq_zero_iff_mem.mp he
  have ho := (mem_variableIdeal_pow_iff (1 : MvPowerSeries (Fin 2) ℚ) 1).mp
    (by simpa only [pow_one] using hm)
  rw [← MvPowerSeries.monomial_zero_one,
    MvPowerSeries.order_monomial_of_ne_zero (by norm_num : (1 : ℚ) ≠ 0)] at ho
  norm_num at ho

-- test: HilbertSamuelShiftedOrderTest.wrong_source_field
example :
    let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
    ∃ h : (q ^ 2 : Submodule (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries (Fin 2) ℚ)) ≤
        Submodule.comap (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries.X 0)) (q ^ 2),
      ¬ Function.Injective (quotientMulMap (q ^ 2) (q ^ 2) (MvPowerSeries.X 0) h) := by
  dsimp only
  let q : Ideal (MvPowerSeries (Fin 2) ℚ) := Ideal.span (Set.range MvPowerSeries.X)
  have h : (q ^ 2 : Submodule (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries (Fin 2) ℚ)) ≤
      Submodule.comap (LinearMap.mulLeft (MvPowerSeries (Fin 2) ℚ) (MvPowerSeries.X 0)) (q ^ 2) := by
    intro g hg
    exact Ideal.mul_mem_left _ _ hg
  refine ⟨h, ?_⟩
  rw [quotientMulMap_injective_iff]
  intro hi
  have hX : (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ∈ q :=
    Ideal.subset_span (Set.mem_range_self _)
  have hg := hi (MvPowerSeries.X 0) (by simpa [pow_two] using Ideal.mul_mem_mul hX hX)
  have ho := (mem_variableIdeal_pow_iff _ 2).mp hg
  simp [MvPowerSeries.X, MvPowerSeries.order_monomial_of_ne_zero] at ho

end ShiftedJets
end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.mul_mem_variableIdeal_pow_iff
#print axioms TauCeti.HilbertSamuel.shiftedJet_denominator
#print axioms TauCeti.HilbertSamuel.shiftedJetMap
#print axioms TauCeti.HilbertSamuel.shiftedJetMap_apply
#print axioms TauCeti.HilbertSamuel.jetProjection
#print axioms TauCeti.HilbertSamuel.jetProjection_apply
#print axioms TauCeti.HilbertSamuel.shiftedJetMap_eq_quotientMulMap
#print axioms TauCeti.HilbertSamuel.jetProjection_eq_principalQuotientProjection
#print axioms TauCeti.HilbertSamuel.shiftedJetMap_injective
#print axioms TauCeti.HilbertSamuel.shiftedJetMap_exact
#print axioms TauCeti.HilbertSamuel.jetProjection_below_order


namespace TauCeti.HilbertSamuel
noncomputable section SeriesResidue
variable {σ k : Type*} [Field k]
local notation "R" => MvPowerSeries σ k
local notation "κ" => IsLocalRing.ResidueField R

local instance constantCoeff_local : IsLocalHom (MvPowerSeries.constantCoeff : R →+* k) :=
  ⟨fun _ h => MvPowerSeries.isUnit_iff_constantCoeff.mpr h⟩

def seriesResidueEquiv : κ ≃ₐ[k] k :=
  AlgEquiv.ofBijective
    { IsLocalRing.ResidueField.lift (MvPowerSeries.constantCoeff : R →+* k) with
      commutes' := by
        intro a
        change IsLocalRing.ResidueField.lift (MvPowerSeries.constantCoeff : R →+* k)
          (IsLocalRing.residue R (MvPowerSeries.C a)) = a
        simp }
    ⟨RingHom.injective _, by
      intro a
      exact ⟨IsLocalRing.residue R (MvPowerSeries.C a), by simp⟩⟩

lemma seriesResidueEquiv_residue (g : R) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R g) =
      MvPowerSeries.constantCoeff g := rfl

lemma seriesResidueEquiv_symm (a : k) :
    (seriesResidueEquiv (σ := σ) (k := k)).symm a =
      IsLocalRing.residue R (MvPowerSeries.C a) := by
  apply (seriesResidueEquiv (σ := σ) (k := k)).injective
  simp [seriesResidueEquiv_residue]

lemma seriesResidueEquiv_algebraMap (a : k) :
    seriesResidueEquiv (σ := σ) (k := k) (algebraMap k κ a) = a :=
  (seriesResidueEquiv (σ := σ) (k := k)).commutes a

lemma seriesResidue_coeff_surjective : Function.Surjective (algebraMap k κ) := by
  intro x
  exact ⟨seriesResidueEquiv (σ := σ) (k := k) x, by
    apply (seriesResidueEquiv (σ := σ) (k := k)).injective
    simp⟩

lemma seriesModule_length_eq_coeff_length (M : Type*) [AddCommGroup M] [Module R M]
    [Module k M] [IsScalarTower k R M] : Module.length R M = Module.length k M := by
  have hc : Module.length k κ = 1 := by
    rw [Module.length_eq_of_surjective (seriesResidue_coeff_surjective (σ := σ) (k := k))]
    exact Module.length_eq_one κ κ
  have hf : Module.length (IsLocalRing.ResidueField k) κ = 1 := by
    rw [← Module.length_eq_of_surjective (@IsLocalRing.residue_surjective k _ _)]
    exact hc
  have h := IsLocalRing.length_restrictScalars k R M
  rw [hf, mul_one] at h
  exact h.symm

lemma seriesModule_length_eq_finrank (M : Type*) [AddCommGroup M] [Module R M]
    [Module k M] [IsScalarTower k R M] [Module.Finite k M] :
    Module.length R M = Module.finrank k M := by
  rw [seriesModule_length_eq_coeff_length, Module.length_eq_finrank]

-- test: HilbertSamuelResidueTest.coefficient_section
example (a : k) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R (MvPowerSeries.C a)) = a ∧
      (seriesResidueEquiv (σ := σ) (k := k)).symm a =
        IsLocalRing.residue R (MvPowerSeries.C a) := by
  constructor
  · simp [seriesResidueEquiv_residue]
  · exact seriesResidueEquiv_symm a

-- test: HilbertSamuelResidueTest.empty_variables
example :
    seriesResidueEquiv (σ := Empty) (k := ℚ)
      (IsLocalRing.residue (MvPowerSeries Empty ℚ) (MvPowerSeries.C 3)) = 3 := by
  simp [seriesResidueEquiv_residue]

-- test: HilbertSamuelResidueTest.variable_not_identity
example (i : σ) :
    seriesResidueEquiv (σ := σ) (k := k) (IsLocalRing.residue R (MvPowerSeries.X i)) = 0 ∧
      (MvPowerSeries.X i : R) ≠ 0 := by
  constructor
  · rw [seriesResidueEquiv_residue, MvPowerSeries.constantCoeff_X]
  · classical
    intro h
    have hc := congrArg (MvPowerSeries.coeff (Finsupp.single i 1)) h
    simp [MvPowerSeries.coeff_X] at hc

-- test: HilbertSamuelResidueTest.residue_module_length
example : Module.length R κ = 1 := by
  rw [seriesModule_length_eq_coeff_length,
    Module.length_eq_of_surjective (seriesResidue_coeff_surjective (σ := σ) (k := k))]
  exact Module.length_eq_one κ κ

-- test: HilbertSamuelResidueTest.zero_module_length
example : Module.length R (Fin 0 → κ) = 0 := by
  exact Module.length_eq_zero

-- test: HilbertSamuelResidueTest.residue_pair_length
example : Module.length R (κ × κ) = 2 := by
  let : Module.Finite k κ := Module.Finite.equiv
    (seriesResidueEquiv (σ := σ) (k := k)).symm.toLinearEquiv
  rw [seriesModule_length_eq_finrank, Module.finrank_prod]
  have hf : Module.finrank k κ = 1 := by
    rw [(seriesResidueEquiv (σ := σ) (k := k)).toLinearEquiv.finrank_eq]
    exact Module.finrank_self k
  simp [hf]

end SeriesResidue
end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.seriesResidueEquiv
#print axioms TauCeti.HilbertSamuel.seriesResidueEquiv_residue
#print axioms TauCeti.HilbertSamuel.seriesResidueEquiv_symm
#print axioms TauCeti.HilbertSamuel.seriesResidueEquiv_algebraMap
#print axioms TauCeti.HilbertSamuel.seriesResidue_coeff_surjective
#print axioms TauCeti.HilbertSamuel.seriesModule_length_eq_coeff_length
#print axioms TauCeti.HilbertSamuel.seriesModule_length_eq_finrank


noncomputable section
universe u v
namespace TauCeti.HilbertSamuel
open scoped Pointwise
variable {A : Type u} [CommRing A]
variable {M : Type v} [AddCommGroup M] [Module A M]

noncomputable def function (q : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M)))

theorem function_ringQuotient (I J : Ideal A) (n : ℕ) :
    function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n =
      Module.length A (A ⧸ (I ⊔ J ^ (n + 1))) := by
  unfold function
  have hden : (J.map (Ideal.Quotient.mk I) ^ (n + 1) •
      (⊤ : Submodule (A ⧸ I) (A ⧸ I))) =
      (J.map (Ideal.Quotient.mk I) ^ (n + 1) : Submodule (A ⧸ I) (A ⧸ I)) := by
    simp
  rw [hden, ← Ideal.map_pow]
  rw [← Module.length_eq_of_surjective (S := A)
    (Ideal.Quotient.mk_surjective : Function.Surjective (algebraMap A (A ⧸ I)))]
  exact (DoubleQuot.quotQuotEquivQuotSupₐ A I (J ^ (n + 1))).toLinearEquiv.length_eq

theorem function_ringQuotient_of_le (I J : Ideal A) (n : ℕ)
    (hI : I ≤ J ^ (n + 1)) :
    function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n =
      Module.length A (A ⧸ J ^ (n + 1)) := by
  rw [function_ringQuotient, sup_eq_right.mpr hI]

theorem function_ringQuotient_antitone (I I' J : Ideal A) (n : ℕ)
    (hI : I ≤ I') :
    function (M := A ⧸ I') (J.map (Ideal.Quotient.mk I')) n ≤
      function (M := A ⧸ I) (J.map (Ideal.Quotient.mk I)) n := by
  rw [function_ringQuotient, function_ringQuotient]
  exact Module.length_le_of_surjective
    (g := Submodule.factor (show (I ⊔ J ^ (n + 1) : Submodule A A) ≤
      (I' ⊔ J ^ (n + 1) : Submodule A A) from sup_le_sup_right hI _))
    (Submodule.factor_surjective _)


section Plane
variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)
lemma planeCurve_jet_length (N : ℕ) :
    function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N =
      Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ ((Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))) ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) := by
  exact function_ringQuotient (Ideal.span {f})
    (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))) N
end Plane

-- test: HilbertSamuelQuotientTest.unit_equation
example (J : Ideal A) (n : ℕ) :
    function (M := A ⧸ (⊤ : Ideal A))
      (J.map (Ideal.Quotient.mk ⊤)) n = 0 := by
  rw [function_ringQuotient]
  simp [Module.length_eq_zero]

-- test: HilbertSamuelQuotientTest.zero_equation
example (J : Ideal A) (n : ℕ) :
    function (M := A ⧸ (⊥ : Ideal A))
      (J.map (Ideal.Quotient.mk ⊥)) n = function (M := A) J n := by
  rw [function_ringQuotient]
  unfold function
  have hden : (J ^ (n + 1) • (⊤ : Submodule A A)) =
      (J ^ (n + 1) : Submodule A A) := by simp
  rw [hden, bot_sup_eq]

-- test: HilbertSamuelQuotientTest.field_one
example (n : ℕ) :
    function (M := (ZMod 2) ⧸ (⊥ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊥)) n = 1 := by
  let : Fact (Nat.Prime 2) := ⟨by decide⟩
  rw [function_ringQuotient]
  rw [Submodule.bot_pow (by omega : n + 1 ≠ 0), bot_sup_eq]
  rw [(AlgEquiv.quotientBot (ZMod 2) (ZMod 2)).toLinearEquiv.length_eq]
  exact Module.length_eq_one _ _

-- test: HilbertSamuelQuotientTest.strict_quotient
example :
    function (M := (ZMod 2) ⧸ (⊤ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊤)) 0 <
    function (M := (ZMod 2) ⧸ (⊥ : Ideal (ZMod 2)))
      ((⊥ : Ideal (ZMod 2)).map (Ideal.Quotient.mk ⊥)) 0 := by
  let : Fact (Nat.Prime 2) := ⟨by decide⟩
  rw [function_ringQuotient, function_ringQuotient]
  rw [Nat.zero_add, pow_one, top_sup_eq, bot_sup_eq]
  rw [Module.length_eq_zero,
    (AlgEquiv.quotientBot (ZMod 2) (ZMod 2)).toLinearEquiv.length_eq,
    Module.length_eq_one]
  decide

-- test: HilbertSamuelQuotientTest.nonreduced_coefficients
example :
    let R := MvPowerSeries (Fin 2) (ZMod 4)
    let J : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 3}
    function (M := R ⧸ I) (J.map (Ideal.Quotient.mk I)) 0 =
      Module.length R (R ⧸ J ^ 1) := by
  intro R J I
  apply function_ringQuotient_of_le
  rw [zero_add, pow_one]
  apply Ideal.span_le.mpr
  intro x hx
  have hx' : x = (MvPowerSeries.X 0 : R) ^ 3 := Set.mem_singleton_iff.mp hx
  rw [hx']
  exact J.pow_mem_of_mem (Ideal.subset_span (show (MvPowerSeries.X 0 : R) ∈
    Set.range MvPowerSeries.X from ⟨0, rfl⟩)) 3 (by decide)

-- test: HilbertSamuelQuotientTest.nonsurjective_coefficients
example : Module.length ℝ ℂ = 2 ∧ Module.length ℂ ℂ = 1 := by
  constructor
  · rw [Module.length_eq_finrank, Complex.finrank_real_complex]
    rfl
  · exact Module.length_eq_one _ _

end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.function_ringQuotient
#print axioms TauCeti.HilbertSamuel.function_ringQuotient_of_le
#print axioms TauCeti.HilbertSamuel.function_ringQuotient_antitone

#print axioms TauCeti.HilbertSamuel.function
#print axioms TauCeti.HilbertSamuel.planeCurve_jet_length

namespace TauCeti.HilbertSamuel
noncomputable section EquationJetFinite
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

lemma equationJet_finite (f : R) (N : ℕ) :
    Module.Finite k (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := by
  let : Module.Finite k (R ⧸ v ^ (N + 1)) := totalJetBasis_finite (N + 1)
  have hs : Function.Surjective (jetProjection f N) := Submodule.factor_surjective le_sup_right
  exact Module.Finite.of_surjective ((jetProjection f N).restrictScalars k) hs

end EquationJetFinite
noncomputable section EquationJetLength
variable {σ k : Type*} [Finite σ] [Field k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

lemma equationJet_length_eq_finrank (f : R) (N : ℕ) :
    Module.length R (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) =
      Module.finrank k (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := by
  let : Module.Finite k (R ⧸ (Ideal.span {f} ⊔ v ^ (N + 1))) := equationJet_finite f N
  exact seriesModule_length_eq_finrank _

lemma totalJet_length_eq_finrank (r : ℕ) :
    Module.length R (R ⧸ v ^ r) = Module.finrank k (R ⧸ v ^ r) := by
  let : Module.Finite k (R ⧸ v ^ r) := totalJetBasis_finite r
  exact seriesModule_length_eq_finrank _

lemma planeTotalJet_length {k : Type*} [Field k] (r : ℕ) :
    let q : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span (Set.range MvPowerSeries.X)
    Module.length (MvPowerSeries (Fin 2) k) (MvPowerSeries (Fin 2) k ⧸ q ^ r) =
      (Nat.choose (r + 1) 2 : ℕ∞) := by
  dsimp only
  rw [totalJet_length_eq_finrank, planeTotalJet_finrank]
end EquationJetLength

noncomputable section PlaneLength
variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)

lemma planeEquationJet_length_balance (d N : ℕ)
    (hN : d ≤ N) (hd : f.order = (d : ℕ∞)) :
    Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1)) =
      Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1 - d)) +
        Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span {f} ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) := by
  obtain ⟨hexact, hsurj⟩ := shiftedJetMap_exact f d N hN hd.ge
  exact Module.length_eq_add_of_exact (shiftedJetMap f d N hN hd.ge)
    (jetProjection f N) (shiftedJetMap_injective f d N hN hd) hsurj
    (LinearMap.exact_iff.mpr hexact.symm)

lemma planeEquationJet_length (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    Module.length (MvPowerSeries (Fin 2) k) ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span {f} ⊔ (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))) ^ (N + 1))) =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by
  by_cases hN : d ≤ N
  · have hbal := planeEquationJet_length_balance f d N hN hd
    rw [planeTotalJet_length, planeTotalJet_length,
      equationJet_length_eq_finrank] at hbal
    have he : N + 1 - d + 1 = N + 2 - d := by omega
    rw [he, ← Nat.cast_add, Nat.cast_inj] at hbal
    have hbal' : (N + 2).choose 2 = (N + 2 - d).choose 2 +
        Module.finrank k (MvPowerSeries (Fin 2) k ⧸
          (Ideal.span {f} ⊔ Ideal.span (Set.range MvPowerSeries.X) ^ (N + 1))) := hbal
    rw [equationJet_length_eq_finrank]
    congr 1
    omega
  · have hsmall := (jetProjection_below_order f d N (by omega) hd.ge).1
    rw [hsmall, planeTotalJet_length]
    have hc : Nat.choose (N + 2 - d) 2 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simp only [hc, Nat.sub_zero]

lemma planeCurve_function (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N =
      ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℕ∞) := by
  rw [planeCurve_jet_length, planeEquationJet_length f d N hd]

lemma planeZeroEquation_function (N : ℕ) :
    let I : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span {(0 : (MvPowerSeries (Fin 2) k))}
    let B := (MvPowerSeries (Fin 2) k) ⧸ I
    let q := ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))).map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q N = (Nat.choose (N + 2) 2 : ℕ∞) := by
  dsimp only
  rw [planeCurve_jet_length]
  have hI : Ideal.span {(0 : MvPowerSeries (Fin 2) k)} = ⊥ := Ideal.span_singleton_eq_bot.mpr rfl
  rw [hI, bot_sup_eq]
  exact planeTotalJet_length (k := k) (N + 1)

end PlaneLength
end TauCeti.HilbertSamuel
#print axioms TauCeti.HilbertSamuel.equationJet_finite
#print axioms TauCeti.HilbertSamuel.equationJet_length_eq_finrank
#print axioms TauCeti.HilbertSamuel.totalJet_length_eq_finrank
#print axioms TauCeti.HilbertSamuel.planeTotalJet_length
#print axioms TauCeti.HilbertSamuel.planeEquationJet_length_balance
#print axioms TauCeti.HilbertSamuel.planeEquationJet_length
#print axioms TauCeti.HilbertSamuel.planeCurve_function
#print axioms TauCeti.HilbertSamuel.planeZeroEquation_function

namespace TauCeti.HilbertSamuel

-- test: PlaneCurveAcceptance.unit_boundary
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(1 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = 0 := by
  dsimp only
  rw [planeCurve_function (d := 0) _ _ (by
    simpa using (MvPowerSeries.order_monomial_of_ne_zero
      (d := (0 : Fin 2 →₀ ℕ)) (a := (1 : ℚ)) one_ne_zero))]
  simp

-- test: PlaneCurveAcceptance.zero_equation_six
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by
  simpa [Nat.choose] using (planeZeroEquation_function (k := ZMod 2) 2)

-- test: PlaneCurveAcceptance.smooth_linear
example (N : ℕ) :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R)}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) N = (N + 1 : ℕ∞) := by
  dsimp only
  have hd : (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ).order = 1 := by
    simp [MvPowerSeries.X, MvPowerSeries.order_monomial_of_ne_zero]
  rw [planeCurve_function _ 1 N hd]
  have hc : (N + 2).choose 2 = (N + 1).choose 2 + (N + 1) := by
    simpa [Nat.choose_one_right, Nat.add_comm, Nat.add_left_comm, Nat.add_assoc] using (Nat.choose_succ_succ (N + 1) 1)
  have he : (N + 2).choose 2 - (N + 2 - 1).choose 2 = N + 1 := by
    have he' : N + 2 - 1 = N + 1 := by omega
    rw [he']
    omega
  simp only [he, Nat.cast_add, Nat.cast_one]

-- test: PlaneCurveAcceptance.nonreduced_cumulative
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 4}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    let q := (v).map (Ideal.Quotient.mk I)
    function (A := B) (M := B) q 0 = 1 ∧
      function (A := B) (M := B) q 1 = 3 ∧
      function (A := B) (M := B) q 2 = 6 ∧
      function (A := B) (M := B) q 4 = 14 := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2)) ^ 4).order = 4 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  simp only [planeCurve_function _ 4 _ hd]
  norm_num [Nat.choose]

-- test: PlaneCurveAcceptance.below_equation_order
example :
    let R := MvPowerSeries (Fin 2) ℚ
    let I : Ideal R := Ideal.span {(MvPowerSeries.X 0 : R) ^ 100}
    let B := R ⧸ I
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    function (A := B) (M := B) (v.map (Ideal.Quotient.mk I)) 2 = 6 := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 100).order = 100 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  rw [planeCurve_function _ 100 2 hd]
  norm_num [Nat.choose]

end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
-- test: HilbertSamuelEquationJetTest.nonreduced_rank
example :
    let R := MvPowerSeries (Fin 2) (ZMod 2)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.finrank (ZMod 2) (R ⧸ (Ideal.span {(MvPowerSeries.X 0 : R) ^ 4} ⊔ v ^ 5)) = 14 := by
  dsimp only
  have hd : ((MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2)) ^ 4).order = 4 := by
    rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  have h := planeEquationJet_length (MvPowerSeries.X 0 ^ 4) 4 4 hd
  rw [equationJet_length_eq_finrank] at h
  norm_num [Nat.choose] at h
  exact_mod_cast h

-- test: HilbertSamuelEquationJetTest.nilpotent_coefficients_finite
example :
    let R := MvPowerSeries (Fin 3) (ZMod 4)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.Finite (ZMod 4) (R ⧸ (Ideal.span {MvPowerSeries.C 2} ⊔ v ^ 3)) := by
  exact equationJet_finite _ 2

-- test: HilbertSamuelEquationJetTest.zero_coefficients_finite
example :
    let R := MvPowerSeries Empty (ZMod 1)
    let v : Ideal R := Ideal.span (Set.range MvPowerSeries.X)
    Module.Finite (ZMod 1) (R ⧸ (Ideal.span {0} ⊔ v ^ 1)) := by
  exact equationJet_finite _ 0
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel
open scoped Pointwise
noncomputable section
set_option backward.isDefEq.respectTransparency.types false
variable {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M]

-- Exact inherited native definition, not a new carrier or packet definition.
noncomputable def gradedFunction (q : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A
    (↥(q ^ n • (⊤ : Submodule A M)) ⧸
      (q • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M)))))

theorem quotient_length_succ (q : Ideal A) (n : ℕ) :
    Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M))) =
      gradedFunction (M := M) q n +
        Module.length A (M ⧸ (q ^ n • (⊤ : Submodule A M))) := by
  let j := Submodule.powSMulQuotInclusion q M
    (a := n) (b := 1) (c := n + 1) (by omega) (⊤ : Submodule A M)
  let g := Submodule.factorPowSucc q M n
  have hj : Function.Injective j := Submodule.powSMulQuotInclusion_injective _ _ _
  have hg : Function.Surjective g := Submodule.factor_surjective _
  have he : LinearMap.ker g = LinearMap.range j := by
    rw [Submodule.range_powSMulQuotInclusion]
    simpa only [Submodule.comap_id] using
      Submodule.ker_mapQ (q ^ (n + 1) • (⊤ : Submodule A M))
        (q ^ n • (⊤ : Submodule A M)) (LinearMap.id) _
  have h := Module.length_eq_add_of_exact j g hj hg (LinearMap.exact_iff.mpr he)
  change Module.length A (M ⧸ (q ^ (n + 1) • (⊤ : Submodule A M))) =
    Module.length A (↥(q ^ n • (⊤ : Submodule A M)) ⧸
      (q ^ 1 • (⊤ : Submodule A ↥(q ^ n • (⊤ : Submodule A M))))) +
    Module.length A (M ⧸ (q ^ n • (⊤ : Submodule A M))) at h
  rw [show q ^ (1 : ℕ) = q from pow_one q] at h
  exact h

end
noncomputable section

lemma planeJetCount_defect (d N : ℕ) :
    ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 : ℕ) : ℚ) -
      ((d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) =
        (Nat.choose (d - N - 1) 2 : ℚ) := by
  rw [Nat.cast_sub (Nat.choose_le_choose 2 (Nat.sub_le _ _))]
  by_cases h : d ≤ N + 2
  · have hz : Nat.choose (d - N - 1) 2 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    rw [hz, Nat.cast_zero, Nat.cast_choose_two ℚ, Nat.cast_choose_two ℚ, Nat.cast_sub h]
    push_cast
    ring
  · have hz : N + 2 - d = 0 := by omega
    rw [hz]
    simp only [Nat.choose_zero_succ, Nat.cast_zero, sub_zero]
    rw [Nat.cast_choose_two ℚ, Nat.cast_choose_two ℚ,
      Nat.cast_sub (show 1 ≤ d - N by omega), Nat.cast_sub (show N ≤ d by omega)]
    push_cast
    ring

lemma planeJetCount_step (d N : ℕ) :
    Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2 =
      min (N + 1) d + (Nat.choose (N + 1) 2 - Nat.choose (N + 1 - d) 2) := by
  have ha : Nat.choose (N + 2) 2 = (N + 1) + Nat.choose (N + 1) 2 := by
    simpa only [Nat.choose_one_right, Nat.add_assoc] using Nat.choose_succ_succ (N + 1) 1
  have hb : Nat.choose (N + 1 - d) 2 ≤ Nat.choose (N + 1) 2 :=
    Nat.choose_le_choose 2 (Nat.sub_le _ _)
  by_cases hd : d ≤ N + 1
  · have he : N + 2 - d = (N + 1 - d) + 1 := by omega
    have hc : Nat.choose (N + 1 - d + 1) 2 = (N + 1 - d) + Nat.choose (N + 1 - d) 2 := by
      simpa only [Nat.choose_one_right] using Nat.choose_succ_succ (N + 1 - d) 1
    rw [he, min_eq_right hd]
    omega
  · have hsmall : Nat.choose (N + 2 - d) 2 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    have hsmall' : Nat.choose (N + 1 - d) 2 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    rw [hsmall, hsmall', min_eq_left (by omega)]
    omega

variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)

lemma planeCurve_gradedFunction (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    gradedFunction (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N = (min (N + 1) d : ℕ∞) := by
  let B := (MvPowerSeries (Fin 2) k) ⧸ Ideal.span {f}
  let q : Ideal B := (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))).map (Ideal.Quotient.mk (Ideal.span {f}))
  change gradedFunction (M := B) q N = min (((N + 1 : ℕ) : ℕ∞)) (d : ℕ∞)
  have hmin : min (((N + 1 : ℕ) : ℕ∞)) (d : ℕ∞) = ((min (N + 1) d : ℕ) : ℕ∞) := by
    by_cases h : N + 1 ≤ d
    · rw [min_eq_left (by exact_mod_cast h), min_eq_left h]
    · rw [min_eq_right (by exact_mod_cast (show d ≤ N + 1 by omega)),
        min_eq_right (by omega : d ≤ N + 1)]
  rw [hmin]
  have hf (t : ℕ) : function (M := B) q t =
      ((Nat.choose (t + 2) 2 - Nat.choose (t + 2 - d) 2 : ℕ) : ℕ∞) :=
    planeCurve_function f d t hd
  cases N with
  | zero =>
    have h := quotient_length_succ (M := B) q 0
    have hz : Module.length B (B ⧸ (q ^ 0 • (⊤ : Submodule B B))) = 0 := by
      rw [pow_zero, one_smul]
      exact Module.length_eq_zero
    rw [hz, add_zero] at h
    change function (M := B) q 0 = gradedFunction (M := B) q 0 at h
    rw [← h, hf]
    have hc := planeJetCount_step d 0
    have hc0 : Nat.choose (1 - d) 2 = 0 := Nat.choose_eq_zero_of_lt (by omega)
    simpa only [hc0, Nat.choose_one_right, Nat.choose_self, Nat.choose_eq_zero_of_lt (by omega : 1 < 2), Nat.sub_zero, Nat.add_zero] using congrArg (fun x : ℕ => (x : ℕ∞)) hc
  | succ N =>
    have h := quotient_length_succ (M := B) q (N + 1)
    change function (M := B) q (N + 1) = gradedFunction (M := B) q (N + 1) + function (M := B) q N at h
    rw [hf, hf] at h
    have hg : gradedFunction (M := B) q (N + 1) ≠ ⊤ := by
      intro ht
      rw [ht, top_add] at h
      exact ENat.natCast_ne_top _ h
    have hn := congrArg ENat.toNat h
    rw [ENat.toNat_add hg (ENat.natCast_ne_top _), ENat.toNat_natCast, ENat.toNat_natCast] at hn
    have hc : Nat.choose (N + 1 + 2) 2 - Nat.choose (N + 1 + 2 - d) 2 =
        min (N + 1 + 1) d + (Nat.choose (N + 2) 2 - Nat.choose (N + 2 - d) 2) := by
      simpa only [Nat.add_assoc] using planeJetCount_step d (N + 1)
    have he : (gradedFunction (M := B) q (N + 1)).toNat = min (N + 1 + 1) d := by omega
    rw [← ENat.natCast_toNat_eq_self.mpr hg, he]

lemma planeCurve_postulation_defect (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) -
        ((d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) =
      (Nat.choose (d - N - 1) 2 : ℚ) := by
  rw [planeCurve_function f d N hd, ENat.toNat_natCast]
  exact planeJetCount_defect d N

lemma planeCurve_postulation_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    (((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) =
      (d : ℚ) * ((N : ℚ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) ↔
        d ≤ N + 2 := by
  rw [← sub_eq_zero, planeCurve_postulation_defect f d N hd, Nat.cast_eq_zero,
    Nat.choose_eq_zero_iff]
  omega

lemma planeCurve_graded_stable_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    gradedFunction (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) N = (d : ℕ∞) ↔ d ≤ N + 1 := by
  rw [planeCurve_gradedFunction f d N hd, min_eq_right_iff]
  exact_mod_cast (Iff.rfl : d ≤ N + 1 ↔ d ≤ N + 1)

lemma planeCurve_postulation_predecessor (d : ℕ) (hd : f.order = (d : ℕ∞)) (h3 : 3 ≤ d) :
    ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (M := ((MvPowerSeries (Fin 2) k) ⧸ (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) (Ideal.map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k))))) (d - 3)).toNat : ℚ) -
      ((d : ℚ) * ((d - 3 : ℕ) + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2) = 1 := by
  rw [planeCurve_postulation_defect f d (d - 3) hd,
    show d - (d - 3) - 1 = 2 by omega]
  norm_num

lemma planeZeroEquation_gradedFunction (N : ℕ) :
    let I : Ideal (MvPowerSeries (Fin 2) k) := Ideal.span {(0 : MvPowerSeries (Fin 2) k)}
    let B := (MvPowerSeries (Fin 2) k) ⧸ I
    let q := (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))).map (Ideal.Quotient.mk I)
    gradedFunction (M := B) q N = ((N + 1 : ℕ) : ℕ∞) := by
  dsimp only
  let B := (MvPowerSeries (Fin 2) k) ⧸ Ideal.span {(0 : MvPowerSeries (Fin 2) k)}
  let q : Ideal B := (Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) k))).map (Ideal.Quotient.mk (Ideal.span {(0 : MvPowerSeries (Fin 2) k)}))
  change gradedFunction (M := B) q N = _
  have hf (t : ℕ) : function (M := B) q t = (Nat.choose (t + 2) 2 : ℕ∞) := planeZeroEquation_function t
  cases N with
  | zero =>
    have h := quotient_length_succ (M := B) q 0
    have hz : Module.length B (B ⧸ (q ^ 0 • (⊤ : Submodule B B))) = 0 := by
      rw [pow_zero, one_smul]
      exact Module.length_eq_zero
    rw [hz, add_zero] at h
    change function (M := B) q 0 = gradedFunction (M := B) q 0 at h
    rw [← h, hf]
    norm_num
  | succ N =>
    have h := quotient_length_succ (M := B) q (N + 1)
    change function (M := B) q (N + 1) = gradedFunction (M := B) q (N + 1) + function (M := B) q N at h
    rw [hf, hf] at h
    have hg : gradedFunction (M := B) q (N + 1) ≠ ⊤ := by
      intro ht
      rw [ht, top_add] at h
      exact ENat.natCast_ne_top _ h
    have hn := congrArg ENat.toNat h
    rw [ENat.toNat_add hg (ENat.natCast_ne_top _), ENat.toNat_natCast, ENat.toNat_natCast] at hn
    have hc : Nat.choose (N + 1 + 2) 2 = (N + 1 + 1) + Nat.choose (N + 2) 2 := by
      rw [show N + 1 + 2 = (N + 2) + 1 by omega,
        show N + 1 + 1 = N + 2 by omega]
      exact Nat.choose_succ_succ (N + 2) 1 |>.trans (by rw [Nat.choose_one_right])
    have he : (gradedFunction (M := B) q (N + 1)).toNat = N + 1 + 1 := by omega
    rw [← ENat.natCast_toNat_eq_self.mpr hg, he]

end
end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.quotient_length_succ
#print axioms TauCeti.HilbertSamuel.planeJetCount_defect
#print axioms TauCeti.HilbertSamuel.planeJetCount_step
#print axioms TauCeti.HilbertSamuel.planeCurve_gradedFunction
#print axioms TauCeti.HilbertSamuel.planeCurve_postulation_defect
#print axioms TauCeti.HilbertSamuel.planeCurve_postulation_iff
#print axioms TauCeti.HilbertSamuel.planeCurve_graded_stable_iff
#print axioms TauCeti.HilbertSamuel.planeCurve_postulation_predecessor
#print axioms TauCeti.HilbertSamuel.planeZeroEquation_gradedFunction

namespace TauCeti.HilbertSamuel
noncomputable section
namespace CurvePostulationTests
local notation "R" => MvPowerSeries (Fin 2) (ZMod 2)
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → R))
local notation "x" => (MvPowerSeries.X (0 : Fin 2) : R)
local notation "B4" => R ⧸ Ideal.span {x ^ 4}
local notation "q4" => Ideal.map (Ideal.Quotient.mk (Ideal.span {x ^ 4})) v
private lemma quartic_order : (x ^ 4).order = 4 := by
  rw [MvPowerSeries.X, MvPowerSeries.monomial_pow]
  simp [MvPowerSeries.order_monomial_of_ne_zero]

-- test: CurvePostulationTests.char_two_thresholds
theorem char_two_thresholds :
    ((function (M := B4) q4 2).toNat : ℚ) = 6 ∧
      gradedFunction (M := B4) q4 2 ≠ 4 ∧ gradedFunction (M := B4) q4 3 = 4 := by
  rw [planeCurve_function _ 4 _ quartic_order,
    planeCurve_gradedFunction _ 4 _ quartic_order,
    planeCurve_gradedFunction _ 4 _ quartic_order]
  norm_num [Nat.choose]

-- test: CurvePostulationTests.negative_polynomial
theorem negative_polynomial :
    ((function (M := B4) q4 0).toNat : ℚ) - (-2) = 3 := by
  have h := planeCurve_postulation_defect (x ^ 4) 4 0 quartic_order
  norm_num [Nat.choose] at h
  simpa only [sub_neg_eq_add] using h

-- test: CurvePostulationTests.sharp_predecessor
theorem sharp_predecessor :
    ((function (M := B4) q4 1).toNat : ℚ) - 2 = 1 := by
  have h := planeCurve_postulation_predecessor (x ^ 4) 4 quartic_order (by decide)
  norm_num at h
  exact h

-- test: CurvePostulationTests.graded_threshold
theorem graded_threshold (N : ℕ) :
    gradedFunction (M := B4) q4 N = 4 ↔ 3 ≤ N := by
  have h := planeCurve_graded_stable_iff (x ^ 4) 4 N quartic_order
  rw [show ((4 : ℕ) : ℕ∞) = (4 : ℕ∞) by norm_num] at h
  exact h.trans (by omega : 4 ≤ N + 1 ↔ 3 ≤ N)

-- test: CurvePostulationTests.cumulative_threshold
theorem cumulative_threshold (N : ℕ) :
    ((function (M := B4) q4 N).toNat : ℚ) = 4 * ((N : ℚ) + 1) - 6 ↔ 2 ≤ N := by
  have h := planeCurve_postulation_iff (x ^ 4) 4 N quartic_order
  norm_num at h
  exact h.trans (by omega : 4 ≤ N + 2 ↔ 2 ≤ N)

-- test: CurvePostulationTests.unit_graded
theorem unit_graded (N : ℕ) :
    let B := R ⧸ Ideal.span {(1 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(1 : R)}))
    gradedFunction (M := B) q N = 0 := by
  dsimp only
  have hd : (1 : R).order = (0 : ℕ∞) := by
    simpa using (MvPowerSeries.order_monomial_of_ne_zero
      (d := (0 : Fin 2 →₀ ℕ)) (a := (1 : ZMod 2)) one_ne_zero)
  rw [planeCurve_gradedFunction _ 0 _ hd]
  simp

-- test: CurvePostulationTests.smooth_graded
theorem smooth_graded (N : ℕ) :
    let B := R ⧸ Ideal.span {x}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {x}))
    gradedFunction (M := B) q N = 1 := by
  dsimp only
  have hd : (x).order = (1 : ℕ∞) := by
    rw [MvPowerSeries.X]
    simp [MvPowerSeries.order_monomial_of_ne_zero]
  rw [planeCurve_gradedFunction _ 1 _ hd]
  apply min_eq_right
  exact_mod_cast (show 1 ≤ N + 1 by omega)

-- test: CurvePostulationTests.zero_equation_growth
theorem zero_equation_growth (N : ℕ) :
    let B := R ⧸ Ideal.span {(0 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    (0 : R).order = ⊤ ∧ gradedFunction (M := B) q N = ((N + 1 : ℕ) : ℕ∞) := by
  exact ⟨MvPowerSeries.order_zero, planeZeroEquation_gradedFunction N⟩

-- test: CurvePostulationTests.unit_defect
theorem unit_defect (N : ℕ) :
    ((Nat.choose (N + 2) 2 - Nat.choose (N + 2 - 0) 2 : ℕ) : ℚ) = 0 := by
  simp

-- test: CurvePostulationTests.small_cutoff_defect
theorem small_cutoff_defect :
    (Nat.choose 4 2 : ℚ) - ((100 : ℚ) * 3 - 100 * 99 / 2) = Nat.choose 97 2 := by
  norm_num [Nat.choose]

end CurvePostulationTests
end
end TauCeti.HilbertSamuel

#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.char_two_thresholds
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.negative_polynomial
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.sharp_predecessor
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.graded_threshold
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.cumulative_threshold
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.unit_graded
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.smooth_graded
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.zero_equation_growth
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.unit_defect
#print axioms TauCeti.HilbertSamuel.CurvePostulationTests.small_cutoff_defect

namespace TauCeti.HilbertSamuel
open Polynomial
noncomputable section ExplicitLengthPolynomials

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial
def planeCurvePolynomial (d : ℕ) : Polynomial ℚ :=
  C (d : ℚ) * (X + 1) - C ((d : ℚ) * ((d : ℚ) - 1) / 2)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-eval
lemma planeCurvePolynomial_eval (d : ℕ) (t : ℚ) :
    (planeCurvePolynomial d).eval t = (d : ℚ) * (t + 1) - (d : ℚ) * ((d : ℚ) - 1) / 2 := by
  simp [planeCurvePolynomial]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-zero
lemma planeCurvePolynomial_zero : planeCurvePolynomial 0 = 0 := by
  simp [planeCurvePolynomial]

private lemma planeCurvePolynomial_linear (d : ℕ) :
    planeCurvePolynomial d = C (d : ℚ) * X + C ((d : ℚ) - (d : ℚ) * ((d : ℚ) - 1) / 2) := by
  simp only [planeCurvePolynomial, mul_add, mul_one, map_sub]
  ring

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-degree
lemma planeCurvePolynomial_natDegree (d : ℕ) (hd : d ≠ 0) :
    (planeCurvePolynomial d).natDegree = 1 := by
  rw [planeCurvePolynomial_linear]
  exact Polynomial.natDegree_linear (by exact_mod_cast hd)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-leading-coefficient
lemma planeCurvePolynomial_leadingCoeff (d : ℕ) :
    (planeCurvePolynomial d).leadingCoeff = (d : ℚ) := by
  by_cases hd : d = 0
  · subst d
    simp [planeCurvePolynomial_zero]
  · rw [planeCurvePolynomial_linear]
    exact Polynomial.leadingCoeff_linear (by exact_mod_cast hd)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-normalization
lemma planeCurvePolynomial_factorial_leadingCoeff (d : ℕ) :
    ((planeCurvePolynomial d).natDegree.factorial : ℚ) * (planeCurvePolynomial d).leadingCoeff = (d : ℚ) := by
  by_cases hd : d = 0
  · subst d
    simp [planeCurvePolynomial_zero]
  · rw [planeCurvePolynomial_natDegree d hd, planeCurvePolynomial_leadingCoeff]
    norm_num

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial
def planeSurfacePolynomial : Polynomial ℚ :=
  C (1 / 2) * X ^ 2 + C (3 / 2) * X + 1

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-eval
lemma planeSurfacePolynomial_eval (N : ℕ) :
    planeSurfacePolynomial.eval (N : ℚ) = (Nat.choose (N + 2) 2 : ℚ) := by
  rw [Nat.cast_choose_two]
  simp only [planeSurfacePolynomial, eval_add, eval_mul, eval_C, eval_pow, eval_X, eval_one,
    Nat.cast_add, Nat.cast_ofNat]
  ring

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-degree
lemma planeSurfacePolynomial_natDegree : planeSurfacePolynomial.natDegree = 2 := by
  change (C (1 / 2 : ℚ) * X ^ 2 + C (3 / 2) * X + C 1).natDegree = 2
  exact Polynomial.natDegree_quadratic (by norm_num)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-leading-coefficient
lemma planeSurfacePolynomial_leadingCoeff : planeSurfacePolynomial.leadingCoeff = (1 / 2 : ℚ) := by
  change (C (1 / 2 : ℚ) * X ^ 2 + C (3 / 2) * X + C 1).leadingCoeff = 1 / 2
  exact Polynomial.leadingCoeff_quadratic (by norm_num)

lemma planeSurfacePolynomial_factorial_leadingCoeff :
    (planeSurfacePolynomial.natDegree.factorial : ℚ) * planeSurfacePolynomial.leadingCoeff = 1 := by
  rw [planeSurfacePolynomial_natDegree, planeSurfacePolynomial_leadingCoeff]
  norm_num

variable {k : Type*} [Field k] (f : MvPowerSeries (Fin 2) k)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-eval-iff
lemma planeCurvePolynomial_eval_iff (d N : ℕ) (hd : f.order = (d : ℕ∞)) :
    (planeCurvePolynomial d).eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) ↔ d ≤ N + 2 := by
  rw [planeCurvePolynomial_eval, eq_comm]
  exact planeCurve_postulation_iff f d N hd

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-tail
lemma planeCurvePolynomial_tail (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    ∀ N ≥ d - 2, (planeCurvePolynomial d).eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by
  intro N hN
  exact (planeCurvePolynomial_eval_iff f d N hd).mpr (by omega)

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-unique
lemma planeCurvePolynomial_unique (d : ℕ) (hd : f.order = (d : ℕ∞)) (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ)) :
    P = planeCurvePolynomial d := by
  obtain ⟨K, hK⟩ := hP
  apply Polynomial.eq_of_infinite_eval_eq
  apply ((Set.Ici_infinite (max K (d - 2))).image (Nat.cast_injective (R := ℚ)).injOn).mono
  rintro t ⟨N, hN, rfl⟩
  simp only [Set.mem_Ici, max_le_iff] at hN
  exact (hK N hN.1).trans (planeCurvePolynomial_tail f d hd N hN.2).symm

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-native-polynomial-existence
lemma planeCurve_existsUnique_polynomial (d : ℕ) (hd : f.order = (d : ℕ∞)) :
    ∃! P : Polynomial ℚ, ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({f} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by
  refine ⟨planeCurvePolynomial d, ⟨d - 2, planeCurvePolynomial_tail f d hd⟩, ?_⟩
  intro P hP
  exact planeCurvePolynomial_unique f d hd P hP

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-eval
lemma planeZeroEquation_polynomial_eval (N : ℕ) :
    planeSurfacePolynomial.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by
  rw [planeZeroEquation_function, ENat.toNat_natCast, planeSurfacePolynomial_eval]

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-unique
lemma planeZeroEquation_polynomial_unique (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ)) :
    P = planeSurfacePolynomial := by
  obtain ⟨K, hK⟩ := hP
  apply Polynomial.eq_of_infinite_eval_eq
  apply ((Set.Ici_infinite K).image (Nat.cast_injective (R := ℚ)).injOn).mono
  rintro t ⟨N, hN, rfl⟩
  exact (hK N hN).trans (planeZeroEquation_polynomial_eval (k := k) N).symm

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-native-polynomial-existence
lemma planeZeroEquation_existsUnique_polynomial :
    ∃! P : Polynomial ℚ, ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (A := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) (M := ((MvPowerSeries (Fin 2) k) ⧸ Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k)))) ((Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → (MvPowerSeries (Fin 2) k)))).map (Ideal.Quotient.mk (Ideal.span ({(0 : MvPowerSeries (Fin 2) k)} : Set (MvPowerSeries (Fin 2) k))))) N).toNat : ℚ) := by
  refine ⟨planeSurfacePolynomial, ⟨0, fun N _ => planeZeroEquation_polynomial_eval N⟩, ?_⟩
  intro P hP
  exact planeZeroEquation_polynomial_unique P hP

end ExplicitLengthPolynomials
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel.CurvePolynomialTests
open Polynomial
noncomputable section
local notation "R" => MvPowerSeries (Fin 2) (ZMod 2)
local notation "x" => (MvPowerSeries.X (0 : Fin 2) : R)
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → R))
local notation "B4" => R ⧸ Ideal.span {x ^ 4}
local notation "q4" => Ideal.map (Ideal.Quotient.mk (Ideal.span {x ^ 4})) v

-- test: CurvePolynomialTests.quartic_formula
lemma quartic_formula :
    planeCurvePolynomial 4 = C 4 * X - C 2 ∧
      (planeCurvePolynomial 4).natDegree = 1 ∧ (planeCurvePolynomial 4).leadingCoeff = 4 := by
  refine ⟨?_, planeCurvePolynomial_natDegree 4 (by norm_num), planeCurvePolynomial_leadingCoeff 4⟩
  norm_num [planeCurvePolynomial_linear, sub_eq_add_neg]

-- test: CurvePolynomialTests.unit_zero
lemma unit_zero :
    planeCurvePolynomial 0 = 0 ∧ (planeCurvePolynomial 0).degree = ⊥ ∧
      ((planeCurvePolynomial 0).natDegree.factorial : ℚ) * (planeCurvePolynomial 0).leadingCoeff = 0 := by
  simp [planeCurvePolynomial_zero]

-- test: CurvePolynomialTests.smooth_polynomial
lemma smooth_polynomial : planeCurvePolynomial 1 = X + 1 := by
  norm_num [planeCurvePolynomial]

-- test: CurvePolynomialTests.characteristic_two_unique
lemma characteristic_two_unique (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K, P.eval (N : ℚ) = ((function (M := B4) q4 N).toNat : ℚ)) :
    P = C 4 * X - C 2 := by
  rw [planeCurvePolynomial_unique (x ^ 4) 4 CurvePostulationTests.quartic_order P hP]
  exact quartic_formula.1

-- test: CurvePolynomialTests.sharp_tail
lemma sharp_tail :
    (∀ (N : ℕ), N ≥ 2 → (planeCurvePolynomial 4).eval (N : ℚ) = ((function (M := B4) q4 N).toNat : ℚ)) ∧
      (planeCurvePolynomial 4).eval (1 : ℚ) ≠ ((function (M := B4) q4 1).toNat : ℚ) := by
  refine ⟨?_, ?_⟩
  · exact planeCurvePolynomial_tail (x ^ 4) 4 CurvePostulationTests.quartic_order
  · intro h
    have hb := (planeCurvePolynomial_eval_iff (x ^ 4) 4 1 CurvePostulationTests.quartic_order).mp h
    omega

-- test: CurvePolynomialTests.cumulative_not_graded
lemma cumulative_not_graded :
    planeCurvePolynomial 4 ≠ C 4 ∧ gradedFunction (M := B4) q4 3 = 4 := by
  constructor
  · intro h
    have hd := congrArg Polynomial.natDegree h
    rw [planeCurvePolynomial_natDegree 4 (by norm_num), natDegree_C] at hd
    omega
  · rw [planeCurve_gradedFunction (x ^ 4) 4 3 CurvePostulationTests.quartic_order]
    norm_num

-- test: CurvePolynomialTests.coefficient_characteristic_is_not_length
lemma coefficient_characteristic_is_not_length :
    (Polynomial.C (4 : ZMod 2) * Polynomial.X - Polynomial.C 2 : Polynomial (ZMod 2)) = 0 ∧
      function (M := B4) q4 0 = 1 := by
  constructor
  · have h4 : (4 : ZMod 2) = 0 := by decide
    have h2 : (2 : ZMod 2) = 0 := by decide
    rw [h4, h2]
    simp
  · rw [planeCurve_function (x ^ 4) 4 0 CurvePostulationTests.quartic_order]
    norm_num [Nat.choose]

-- test: CurvePolynomialTests.surface_shape
lemma surface_shape :
    planeSurfacePolynomial = C (1 / 2) * (X + 1) * (X + 2) ∧
      planeSurfacePolynomial.natDegree = 2 ∧ planeSurfacePolynomial.leadingCoeff = (1 / 2 : ℚ) := by
  refine ⟨?_, planeSurfacePolynomial_natDegree, planeSurfacePolynomial_leadingCoeff⟩
  simp only [planeSurfacePolynomial]
  ring_nf
  have h2 : C (1 / 2 : ℚ) * (2 : Polynomial ℚ) = 1 := by
    change C (1 / 2 : ℚ) * C 2 = 1
    rw [← C_mul]
    norm_num
  have h3 : C (1 / 2 : ℚ) * (3 : Polynomial ℚ) = C (3 / 2 : ℚ) := by
    change C (1 / 2 : ℚ) * C 3 = C (3 / 2 : ℚ)
    rw [← C_mul]
    congr 1
    norm_num
  rw [h2, mul_right_comm (C (1 / 2 : ℚ)) X 3, h3]
  ring

-- test: CurvePolynomialTests.surface_all_lengths
lemma surface_all_lengths (N : ℕ) :
    let B := R ⧸ Ideal.span {(0 : R)}
    let q := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    planeSurfacePolynomial.eval (N : ℚ) = ((function (M := B) q N).toNat : ℚ) ∧
      (planeSurfacePolynomial.natDegree.factorial : ℚ) * planeSurfacePolynomial.leadingCoeff = 1 := by
  exact ⟨planeZeroEquation_polynomial_eval N, planeSurfacePolynomial_factorial_leadingCoeff⟩

-- test: CurvePolynomialTests.zero_and_unit_quotients
lemma zero_and_unit_quotients :
    let B0 := R ⧸ Ideal.span {(0 : R)}
    let q0 := (v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))
    let B1 := R ⧸ Ideal.span {(1 : R)}
    let q1 := (v).map (Ideal.Quotient.mk (Ideal.span {(1 : R)}))
    function (M := B0) q0 0 = 1 ∧ function (M := B1) q1 0 = 0 ∧
      planeSurfacePolynomial ≠ planeCurvePolynomial 0 := by
  dsimp only
  refine ⟨?_, ?_, ?_⟩
  · simpa using (planeZeroEquation_function (k := ZMod 2) 0)
  · simpa using (planeCurve_function (1 : R) 0 0 (by simpa using (MvPowerSeries.order_monomial_of_ne_zero
      (d := (0 : Fin 2 →₀ ℕ)) (a := (1 : ZMod 2)) one_ne_zero)))
  · intro h
    have hd := congrArg Polynomial.natDegree h
    rw [planeSurfacePolynomial_natDegree, planeCurvePolynomial_zero, natDegree_zero] at hd
    omega

-- test: CurvePolynomialTests.surface_unique
lemma surface_unique (P : Polynomial ℚ)
    (hP : ∃ K : ℕ, ∀ N ≥ K,
      P.eval (N : ℚ) = ((function
        (M := R ⧸ Ideal.span {(0 : R)})
        ((v).map (Ideal.Quotient.mk (Ideal.span {(0 : R)}))) N).toNat : ℚ)) :
    P = planeSurfacePolynomial := by
  exact planeZeroEquation_polynomial_unique P hP

end
end TauCeti.HilbertSamuel.CurvePolynomialTests

#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_eval
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_zero
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_natDegree
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_leadingCoeff
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_factorial_leadingCoeff
#print axioms TauCeti.HilbertSamuel.planeSurfacePolynomial
#print axioms TauCeti.HilbertSamuel.planeSurfacePolynomial_eval
#print axioms TauCeti.HilbertSamuel.planeSurfacePolynomial_natDegree
#print axioms TauCeti.HilbertSamuel.planeSurfacePolynomial_leadingCoeff
#print axioms TauCeti.HilbertSamuel.planeSurfacePolynomial_factorial_leadingCoeff
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_eval_iff
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_tail
#print axioms TauCeti.HilbertSamuel.planeCurvePolynomial_unique
#print axioms TauCeti.HilbertSamuel.planeCurve_existsUnique_polynomial
#print axioms TauCeti.HilbertSamuel.planeZeroEquation_polynomial_eval
#print axioms TauCeti.HilbertSamuel.planeZeroEquation_polynomial_unique
#print axioms TauCeti.HilbertSamuel.planeZeroEquation_existsUnique_polynomial
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.quartic_formula
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.unit_zero
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.smooth_polynomial
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.characteristic_two_unique
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.sharp_tail
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.cumulative_not_graded
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.surface_shape
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.surface_all_lengths
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.zero_and_unit_quotients
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.surface_unique
#print axioms TauCeti.HilbertSamuel.CurvePolynomialTests.coefficient_characteristic_is_not_length

END ARCHIVED CHECKED ACTUAL CURVE POLYNOMIALS -/
