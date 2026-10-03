import Mathlib.RingTheory.MvPolynomial.Homogeneous
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
/-! ## Native degree-wise initial relation continuation — codex-a71f92.
These adapters reuse the native series homogeneous-component map and actual ideals.
They do not construct the full graded tangent-cone algebra or a dimension theorem. -/
namespace TauCeti.HilbertSamuel
noncomputable section InitialRelations
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-variable-ideal-membership
lemma homogeneous_mem_variableIdeal_pow (g : R) (n : ℕ)
    (hg : g.IsHomogeneous n) : g ∈ v ^ n := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power
lemma homogeneousComponent_eq_zero_iff_mem_next (g : R) (n : ℕ) (hg : g ∈ v ^ n) :
    MvPowerSeries.homogeneousComponent n g = 0 ↔ g ∈ v ^ (n + 1) := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-initial-relation
lemma mem_principal_add_next_iff_initial [NoZeroDivisors k] (f g : R) (d n : ℕ)
    (hd : f.order = (d : ℕ∞)) (hdn : d ≤ n) (hg : g ∈ v ^ n) :
    g ∈ Ideal.span {f} ⊔ v ^ (n + 1) ↔
      ∃ w : R, w.IsHomogeneous (n - d) ∧
        MvPowerSeries.homogeneousComponent n g =
          MvPowerSeries.homogeneousComponent d f * w := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-below-order
lemma mem_principal_add_next_below_order (f g : R) (d n : ℕ)
    (hd : (d : ℕ∞) ≤ f.order) (hnd : n < d) (hg : g ∈ v ^ n) :
    g ∈ Ideal.span {f} ⊔ v ^ (n + 1) ↔
      MvPowerSeries.homogeneousComponent n g = 0 := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection
def curveDegreeProjection (f : R) (n : ℕ) :
    ↥(v ^ n) →ₗ[k] (R ⧸ (Ideal.span {f} ⊔ v ^ (n + 1))) :=
  ((Submodule.mkQ (Ideal.span {f} ⊔ v ^ (n + 1))).restrictScalars k).comp
    ((v ^ n).subtype.restrictScalars k)

-- API: TauCeti.HilbertSamuel.curveDegreeProjection_apply
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-apply
omit [Finite σ] in
lemma curveDegreeProjection_apply (f : R) (n : ℕ) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g =
      Submodule.mkQ (Ideal.span {f} ⊔ v ^ (n + 1)) (g : R) := by sorry
-- API: TauCeti.HilbertSamuel.curveDegreeProjection_eq_zero_iff
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing
omit [Finite σ] in
lemma curveDegreeProjection_eq_zero_iff (f : R) (n : ℕ) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g = 0 ↔ (g : R) ∈ Ideal.span {f} ⊔ v ^ (n + 1) := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-kernel
lemma curveDegreeProjection_kernel [NoZeroDivisors k] (f : R) (d n : ℕ)
    (hd : f.order = (d : ℕ∞)) (hdn : d ≤ n) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g = 0 ↔
      ∃ w : R, w.IsHomogeneous (n - d) ∧
        MvPowerSeries.homogeneousComponent n (g : R) =
          MvPowerSeries.homogeneousComponent d f * w := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-below-order
lemma curveDegreeProjection_below_order (f : R) (d n : ℕ)
    (hd : (d : ℕ∞) ≤ f.order) (hnd : n < d) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g = 0 ↔
      MvPowerSeries.homogeneousComponent n (g : R) = 0 := by sorry
-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-zero-equation
lemma curveDegreeProjection_zero_equation (n : ℕ) (g : ↥(v ^ n)) :
    curveDegreeProjection (0 : R) n g = 0 ↔
      MvPowerSeries.homogeneousComponent n (g : R) = 0 := by sorry
end InitialRelations
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel.InitialRelationTests
noncomputable section
variable {k : Type*} [CommRing k]
local notation "R" => MvPowerSeries (Fin 2) k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → R))

-- test: InitialRelationTests.zero_input
example (f : R) (n : ℕ) :
    curveDegreeProjection f n (0 : ↥(v ^ n)) = 0 := by sorry
-- test: InitialRelationTests.unit_equation
example (n : ℕ) (g : ↥(v ^ n)) :
    curveDegreeProjection (1 : R) n g = 0 := by sorry
-- test: InitialRelationTests.zero_equation_survives
example :
    let x := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ)
    let jetIdeal := Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) ℚ))
    ∃ hx : x ∈ jetIdeal ^ 1, curveDegreeProjection 0 1 ⟨x, hx⟩ ≠ 0 := by sorry
-- test: InitialRelationTests.nonreduced_survives
example :
    let x := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2))
    let jetIdeal := Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) (ZMod 2)))
    ∃ hx : x ∈ jetIdeal ^ 1, curveDegreeProjection (x ^ 2) 1 ⟨x, hx⟩ ≠ 0 := by sorry
-- test: InitialRelationTests.nonreduced_square_vanishes
example :
    let x := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2))
    let jetIdeal := Ideal.span (Set.range (MvPowerSeries.X : Fin 2 → MvPowerSeries (Fin 2) (ZMod 2)))
    ∃ hxx : x ^ 2 ∈ jetIdeal ^ 2, curveDegreeProjection (x ^ 2) 2 ⟨x ^ 2, hxx⟩ = 0 := by sorry
-- test: InitialRelationTests.equation_order_boundary
example [NoZeroDivisors k] (f : R) (d : ℕ)
    (hd : f.order = (d : ℕ∞)) :
    ∃ hf : f ∈ v ^ d,
      curveDegreeProjection f d ⟨f, hf⟩ = 0 ∧
      ∃ w : R, w.IsHomogeneous 0 ∧
        MvPowerSeries.homogeneousComponent d f =
          MvPowerSeries.homogeneousComponent d f * w := by sorry
end
end TauCeti.HilbertSamuel.InitialRelationTests

/- BEGIN POLYNOMIAL HOMOGENEOUS COMPARISON -/

namespace TauCeti.HilbertSamuel
noncomputable section HomogeneousPolynomials
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "P" => MvPolynomial σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))

-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-component
def homogeneousPolynomial (n : ℕ) : R →ₗ[k] P := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-coeff
lemma homogeneousPolynomial_coeff (n : ℕ) (f : R) (β : σ →₀ ℕ) :
    (homogeneousPolynomial n f).coeff β =
      if β.degree = n then MvPowerSeries.coeff β f else 0 := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series
lemma coe_homogeneousPolynomial (n : ℕ) (f : R) :
    (homogeneousPolynomial n f : R) = MvPowerSeries.homogeneousComponent n f := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-degree
lemma homogeneousPolynomial_isHomogeneous (n : ℕ) (f : R) :
    (homogeneousPolynomial n f).IsHomogeneous n := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-inclusion
lemma homogeneousPolynomial_coe (n : ℕ) (p : P) :
    homogeneousPolynomial n (p : R) = MvPolynomial.homogeneousComponent n p := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-series-homogeneity
lemma coe_isHomogeneous_iff (n : ℕ) (p : P) :
    (p : R).IsHomogeneous n ↔ p.IsHomogeneous n := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-retraction
lemma homogeneousPolynomial_coe_of_homogeneous (n : ℕ) (p : P)
    (hp : p.IsHomogeneous n) : homogeneousPolynomial n (p : R) = p := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-series-unique-polynomial
lemma homogeneous_existsUnique_polynomial (n : ℕ) (f : R) (hf : f.IsHomogeneous n) :
    ∃! p : P, p.IsHomogeneous n ∧ (p : R) = f := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-vanishing
lemma homogeneousPolynomial_eq_zero_iff (n : ℕ) (f : R) :
    homogeneousPolynomial n f = 0 ↔ MvPowerSeries.homogeneousComponent n f = 0 := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-initial-truncation
lemma homogeneousPolynomial_eq_truncTotal (n : ℕ) (f : R) (hf : (n : ℕ∞) ≤ f.order) :
    homogeneousPolynomial n f = MvPowerSeries.truncTotal (n + 1) f := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-initial-nonzero
lemma homogeneousPolynomial_ne_zero_of_order (n : ℕ) (f : R)
    (hf : f.order = (n : ℕ∞)) : homogeneousPolynomial n f ≠ 0 := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-initial-product
lemma homogeneousPolynomial_mul_of_le_order (m n : ℕ) (f g : R)
    (hf : (m : ℕ∞) ≤ f.order) (hg : (n : ℕ∞) ≤ g.order) :
    homogeneousPolynomial (m + n) (f * g) =
      homogeneousPolynomial m f * homogeneousPolynomial n g := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-projections
lemma homogeneousPolynomial_component (m n : ℕ) (f : R) :
    homogeneousPolynomial m (homogeneousPolynomial n f : R) =
      if m = n then homogeneousPolynomial n f else 0 := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-degree-kernel
lemma curveDegreeProjection_polynomial_kernel [NoZeroDivisors k] (f : R) (d n : ℕ)
    (hd : f.order = (d : ℕ∞)) (hdn : d ≤ n) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g = 0 ↔
      ∃ w : P, w.IsHomogeneous (n - d) ∧
        homogeneousPolynomial n (g : R) = homogeneousPolynomial d f * w := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-degree-below
lemma curveDegreeProjection_polynomial_below_order (f : R) (d n : ℕ)
    (hd : (d : ℕ∞) ≤ f.order) (hnd : n < d) (g : ↥(v ^ n)) :
    curveDegreeProjection f n g = 0 ↔ homogeneousPolynomial n (g : R) = 0 := by sorry


-- node: DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-degree-zero
lemma curveDegreeProjection_polynomial_zero_equation (n : ℕ) (g : ↥(v ^ n)) :
    curveDegreeProjection (0 : R) n g = 0 ↔ homogeneousPolynomial n (g : R) = 0 := by sorry

end HomogeneousPolynomials
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel.HomogeneousPolynomialTests
noncomputable section

-- test: HomogeneousPolynomialTests.zero_input
example {σ k : Type*} [Finite σ] [CommRing k] (n : ℕ) :
    homogeneousPolynomial n (0 : MvPowerSeries σ k) = 0 := by sorry


-- test: HomogeneousPolynomialTests.native_polynomial
example {σ k : Type*} [Finite σ] [CommRing k]
    (n : ℕ) (p : MvPolynomial σ k) (hp : p.IsHomogeneous n) :
    homogeneousPolynomial n (p : MvPowerSeries σ k) = p := by sorry


-- test: HomogeneousPolynomialTests.no_variables
example (a : ℚ) :
    homogeneousPolynomial 0 (MvPowerSeries.C a : MvPowerSeries Empty ℚ) = MvPolynomial.C a ∧
    homogeneousPolynomial 1 (MvPowerSeries.C a : MvPowerSeries Empty ℚ) = 0 := by sorry


-- test: HomogeneousPolynomialTests.exact_degree_not_truncation
example :
    let x := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2))
    homogeneousPolynomial 1 (1 + x + x ^ 2) = MvPolynomial.X (0 : Fin 2) := by sorry


-- test: HomogeneousPolynomialTests.not_multiplicative_in_fixed_degree
example :
    let x := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) ℚ)
    homogeneousPolynomial 1 (x * x) ≠ homogeneousPolynomial 1 x * homogeneousPolynomial 1 x := by sorry


-- test: HomogeneousPolynomialTests.nilpotent_coefficients
example :
    let p : MvPolynomial (Fin 2) (ZMod 4) := MvPolynomial.C 2 * MvPolynomial.X 0
    homogeneousPolynomial 1 (p : MvPowerSeries (Fin 2) (ZMod 4)) ≠ 0 ∧
    homogeneousPolynomial 2 ((p : MvPowerSeries (Fin 2) (ZMod 4)) ^ 2) = 0 := by sorry

end
end TauCeti.HilbertSamuel.HomogeneousPolynomialTests
/- END POLYNOMIAL HOMOGENEOUS COMPARISON -/

/- BEGIN DEGREE QUOTIENT COMPARISON -/
namespace TauCeti.HilbertSamuel
noncomputable section DegreeQuotients
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 800000
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "P" => MvPolynomial σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
local notation "H" => MvPolynomial.homogeneousSubmodule σ k

def homogeneousLift (n : ℕ) : ↥(H n) →ₗ[k] ↥(v ^ n) := by
  sorry

lemma homogeneousLift_apply (n : ℕ) (p : ↥(H n)) :
    (homogeneousLift n p : R) = (p.val : R) := by
  sorry

def degreePolynomial (n : ℕ) : ↥(v ^ n) →ₗ[k] ↥(H n) := by
  sorry

lemma degreePolynomial_apply (n : ℕ) (g : ↥(v ^ n)) :
    (degreePolynomial n g : P) = homogeneousPolynomial n (g : R) := by
  sorry

lemma degreePolynomial_lift (n : ℕ) (p : ↥(H n)) :
    degreePolynomial n (homogeneousLift n p) = p := by
  sorry

lemma degreePolynomial_surjective (n : ℕ) : Function.Surjective (degreePolynomial (σ := σ) (k := k) n) := by
  sorry

lemma degreePolynomial_eq_zero_iff (n : ℕ) (g : ↥(v ^ n)) :
    degreePolynomial n g = 0 ↔ (g : R) ∈ v ^ (n + 1) := by
  sorry

lemma degreePolynomial_ker (n : ℕ) :
    LinearMap.ker (degreePolynomial (σ := σ) (k := k) n) =
      (v • (⊤ : Submodule R ↥(v ^ n))).restrictScalars k := by
  sorry

def ambientDegreeEquiv (n : ℕ) :
    (↥(v ^ n) ⧸ (v • (⊤ : Submodule R ↥(v ^ n))).restrictScalars k) ≃ₗ[k] ↥(H n) := by
  sorry

lemma ambientDegreeEquiv_mk (n : ℕ) (g : ↥(v ^ n)) :
    ambientDegreeEquiv n (Submodule.Quotient.mk g) = degreePolynomial n g := by
  sorry

lemma ambientDegreeEquiv_symm (n : ℕ) (p : ↥(H n)) :
    (ambientDegreeEquiv n).symm p = Submodule.Quotient.mk (homogeneousLift n p) := by
  sorry

def homogeneousCurveProjection (f : R) (n : ℕ) :
    ↥(H n) →ₗ[k] (R ⧸ (Ideal.span {f} ⊔ v ^ (n + 1))) := by
  sorry

lemma homogeneousCurveProjection_apply (f : R) (n : ℕ) (p : ↥(H n)) :
    homogeneousCurveProjection f n p =
      Submodule.mkQ (Ideal.span {f} ⊔ v ^ (n + 1)) (p.val : R) := by
  sorry

lemma curveDegreeProjection_factor (f : R) (n : ℕ) (g : ↥(v ^ n)) :
    homogeneousCurveProjection f n (degreePolynomial n g) = curveDegreeProjection f n g := by
  sorry

lemma homogeneousCurveProjection_range (f : R) (n : ℕ) :
    LinearMap.range (homogeneousCurveProjection f n) = LinearMap.range (curveDegreeProjection f n) := by
  sorry

lemma homogeneousCurveProjection_kernel [NoZeroDivisors k] (f : R) (d n : ℕ)
    (hd : f.order = (d : ℕ∞)) (hdn : d ≤ n) (p : ↥(H n)) :
    homogeneousCurveProjection f n p = 0 ↔
      ∃ w : P, w.IsHomogeneous (n - d) ∧ p.val = homogeneousPolynomial d f * w := by
  sorry

lemma homogeneousCurveProjection_below_order (f : R) (d n : ℕ)
    (hd : (d : ℕ∞) ≤ f.order) (hnd : n < d) (p : ↥(H n)) :
    homogeneousCurveProjection f n p = 0 ↔ p = 0 := by
  sorry

def homogeneousCurveQuotientEquiv (f : R) (n : ℕ) :
    (↥(H n) ⧸ LinearMap.ker (homogeneousCurveProjection f n)) ≃ₗ[k]
      LinearMap.range (curveDegreeProjection f n) := by
  sorry

lemma homogeneousCurveQuotientEquiv_mk (f : R) (n : ℕ) (p : ↥(H n)) :
    (homogeneousCurveQuotientEquiv f n (Submodule.Quotient.mk p) :
      R ⧸ (Ideal.span {f} ⊔ v ^ (n + 1))) = homogeneousCurveProjection f n p := by
  sorry

end DegreeQuotients
end TauCeti.HilbertSamuel

namespace TauCeti.HilbertSamuel.DegreeQuotientTests
noncomputable section
variable {σ k : Type*} [Finite σ] [CommRing k]
local notation "R" => MvPowerSeries σ k
local notation "P" => MvPolynomial σ k
local notation "v" => Ideal.span (Set.range (MvPowerSeries.X : σ → R))
local notation "H" => MvPolynomial.homogeneousSubmodule σ k

-- test: DegreeQuotientTests.lift_zero
lemma lift_zero (n : ℕ) : homogeneousLift (σ := σ) (k := k) n 0 = 0 := by
  sorry

-- test: DegreeQuotientTests.lift_variable
lemma lift_variable (i : σ) :
    (homogeneousLift 1 ⟨MvPolynomial.X i, MvPolynomial.isHomogeneous_X k i⟩ : R) = MvPowerSeries.X i := by
  sorry

-- test: DegreeQuotientTests.lift_torsion
lemma lift_torsion :
    let p : ↥(MvPolynomial.homogeneousSubmodule (Fin 2) (ZMod 4) 1) :=
      ⟨MvPolynomial.C 2 * MvPolynomial.X 0, (MvPolynomial.isHomogeneous_X (ZMod 4) (0 : Fin 2)).C_mul 2⟩
    (homogeneousLift 1 p : MvPowerSeries (Fin 2) (ZMod 4)) =
      MvPowerSeries.C 2 * MvPowerSeries.X 0 := by
  sorry

-- test: DegreeQuotientTests.degree_lift
lemma degree_lift (n : ℕ) (p : ↥(H n)) : degreePolynomial n (homogeneousLift n p) = p := by
  sorry

-- test: DegreeQuotientTests.degree_constant
lemma degree_constant (a : k) :
    degreePolynomial 0 (homogeneousLift 0
      ⟨(MvPolynomial.C a : MvPolynomial Empty k), MvPolynomial.isHomogeneous_C (σ := Empty) a⟩) =
      ⟨MvPolynomial.C a, MvPolynomial.isHomogeneous_C (σ := Empty) a⟩ := by
  sorry

-- test: DegreeQuotientTests.degree_next
lemma degree_next (n : ℕ) (g : ↥(v ^ n)) (hg : (g : R) ∈ v ^ (n + 1)) :
    degreePolynomial n g = 0 := by
  sorry

-- test: DegreeQuotientTests.ambient_roundtrip
lemma ambient_roundtrip (n : ℕ) (g : ↥(v ^ n)) :
    (ambientDegreeEquiv n).symm (degreePolynomial n g) = Submodule.Quotient.mk g := by
  sorry

-- test: DegreeQuotientTests.ambient_inverse
lemma ambient_inverse (n : ℕ) (p : ↥(H n)) :
    ambientDegreeEquiv n (Submodule.Quotient.mk (homogeneousLift n p)) = p := by
  sorry

-- test: DegreeQuotientTests.ambient_torsion
lemma ambient_torsion :
    let p : ↥(MvPolynomial.homogeneousSubmodule (Fin 2) (ZMod 4) 1) :=
      ⟨MvPolynomial.C 2 * MvPolynomial.X 0, (MvPolynomial.isHomogeneous_X (ZMod 4) (0 : Fin 2)).C_mul 2⟩
    (ambientDegreeEquiv 1).symm p ≠ 0 := by
  sorry

-- test: DegreeQuotientTests.curve_unit
lemma curve_unit (n : ℕ) (p : ↥(H n)) : homogeneousCurveProjection (1 : R) n p = 0 := by
  sorry

-- test: DegreeQuotientTests.curve_zero
lemma curve_zero (n : ℕ) (p : ↥(H n)) :
    homogeneousCurveProjection (0 : R) n p = 0 ↔ p = 0 := by
  sorry

-- test: DegreeQuotientTests.characteristic_two_killed
lemma characteristic_two_killed :
    let f := (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) (ZMod 2)) ^ 2
    let p : ↥(MvPolynomial.homogeneousSubmodule (Fin 2) (ZMod 2) 2) :=
      ⟨MvPolynomial.X 0 ^ 2, by simpa using (MvPolynomial.isHomogeneous_X (ZMod 2) (0 : Fin 2)).pow 2⟩
    homogeneousCurveProjection f 2 p = 0 := by
  sorry

-- test: DegreeQuotientTests.quotient_value
lemma quotient_value (f : R) (n : ℕ) (p : ↥(H n)) :
    (homogeneousCurveQuotientEquiv f n (Submodule.Quotient.mk p) :
      R ⧸ (Ideal.span {f} ⊔ v ^ (n + 1))) = homogeneousCurveProjection f n p := by
  sorry

-- test: DegreeQuotientTests.quotient_inverse
lemma quotient_inverse (f : R) (n : ℕ) (p : ↥(H n)) :
    (homogeneousCurveQuotientEquiv f n).symm
      (homogeneousCurveQuotientEquiv f n (Submodule.Quotient.mk p)) = Submodule.Quotient.mk p := by
  sorry

-- test: DegreeQuotientTests.quotient_zero_equation
lemma quotient_zero_equation (n : ℕ) (p : ↥(H n)) :
    homogeneousCurveQuotientEquiv (0 : R) n (Submodule.Quotient.mk p) = 0 ↔ p = 0 := by
  sorry

end
end TauCeti.HilbertSamuel.DegreeQuotientTests
/- END DEGREE QUOTIENT COMPARISON -/
