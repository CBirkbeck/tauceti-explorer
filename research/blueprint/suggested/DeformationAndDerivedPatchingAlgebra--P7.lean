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
import Mathlib.RingTheory.Support
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Data.ENat.Basic

/-!
# Suggested forms for prime filtrations and characteristic-zero points

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--P7.md` is definitive.
These forms let contributors and reviewers converge on names and signatures.
They introduce no new prime-filtration carrier, theorem or implementation claim.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The complete file elaborates with placeholder-proof warnings only against the
existing Mathlib build at the pin (Codex codex-J6LwjP, 2 October 2026).
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
This is not Polynomial.existsUnique_hilbertPoly, which starts with a series. -/
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
