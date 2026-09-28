/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.7.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticKTheory--N.7 (stages N.7 and N.8): partial prototype,
implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established and the file was not compiled.

The reviewed audit AUDIT-27 records both layers as NOT BUILT. What the pinned
libraries DO have is imported and never redefined:

* `bernoulli` (B₁ = -1/2, this roadmap's arithmetic convention) and `bernoulli'`
  (B₁ = +1/2), with `bernoulli_eq_bernoulli'_of_ne_one` relating them.
* `IsCyclotomicExtension`, `NumberField.RingOfIntegers`, `NumberField.classNumber`
  and `ClassGroup`: everything the definition of a regular prime is built from.
* `Ideal.ramificationIdx` and `Ideal.inertiaDeg`: Mathlib proves that p has a
  unique prime above it in the p-th cyclotomic field, with e = p - 1 and f = 1,
  which is exactly the input of the S-integer argument of N.7.
* `NumberField.Units.rank`, the real and complex place counts, and
  `NumberField.dedekindZeta`: the arithmetic data of a certified example and one
  side of the Birch-Tate formula.

What is ABSENT from both libraries, and is therefore written out below: the word
"regular" (a grep for "regular prime" over both trees returns nothing, and so
does one for "Vandiver"), the invariant w_i, Kummer's criterion, the eigenspace
decomposition, and every K-group above the zeroth.

Imported and never re-planned: the tame kernel and the computations of K₂ (from
K2SymbolsBrauer T.5), the twisted coefficient modules (T.7), K₃ of the integers
and of the Gaussian rationals (K3BlochGroups V.5), the norm residue map
(MotivicEtaleKTheory M.3), the localisation theorem (ArithmeticKTheory N.2) and
the Birch-Tate formula (SpecialValuesBirchTate B.3). These appear as `variable`s
or as `True` placeholders, never as invented definitions.
-/
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.RootsOfUnity.Basic

noncomputable section

namespace TauCeti.ArithKTheory

/-! ## N.7 Regular primes and Bernoulli numbers -/

/-- N.7/bernoulli-conventions: this roadmap's convention is Mathlib's `bernoulli`,
with `B₁ = -1/2`. The other numbering is `bernoulli'`; they agree away from one. -/
theorem bernoulli_convention_one : bernoulli 1 = -1/2 := by sorry

theorem bernoulli_convert (n : ℕ) (hn : n ≠ 1) : bernoulli n = bernoulli' n := by sorry

/-- The denominator of `B_k` is the product of the primes `p` with `(p-1) ∣ 2k`;
it is squarefree and divisible by six. -/
theorem bernoulli_denominator (k : ℕ) : True := by sorry

/-- N.7/w-invariant: `w_i(F)` is the largest `m` on whose `i`-th twist of the roots
of unity the Galois group acts trivially. Over `ℚ` it is `2` for odd `i` and the
denominator of `B_k/4k` for `i = 2k`. -/
def wInvariant (F : Type) [Field F] [NumberField F] (i : ℕ) : ℕ := by sorry

theorem wInvariant_odd_rat (i : ℕ) (hi : Odd i) : True := by sorry

theorem wInvariant_even_rat (k : ℕ) : True := by sorry

theorem wInvariant_two_rat : True := by sorry  -- `w₂(ℚ) = 24`

/-- N.7/regular-prime: `p` is irregular when it divides the class number of the
`p`-th cyclotomic field. Neither pinned library defines this. -/
def IsRegularPrime (p : ℕ) [Fact (Nat.Prime p)] : Prop := by sorry

theorem isRegularPrime_iff_not_dvd_classNumber (p : ℕ) [Fact (Nat.Prime p)] :
    True := by sorry

/-- Iwasawa's equivalent form: no `p`-power torsion in the Picard group. -/
theorem isRegularPrime_iwasawa (p : ℕ) [Fact (Nat.Prime p)] : True := by sorry

theorem not_isRegularPrime_37 : True := by sorry

/-- N.7/kummer-criterion: `p` is irregular exactly when it divides the numerator of
some `B_k` with `k ≤ (p-3)/2`. Quoted from the source, which cites Washington. -/
theorem kummer_criterion (p : ℕ) [Fact (Nat.Prime p)] : True := by sorry

/-- N.7/eigenspaces-and-herbrand-ribet. The projectors need `(l-1)⁻¹`, which exists
mod `l`; an integral statement using them would be wrong. -/
def eigenspace (l : ℕ) (j : ℕ) : Type := by sorry

theorem herbrand_ribet (l k : ℕ) : True := by sorry

/-- N.7/tame-kernel-vanishing-at-a-regular-prime: for an odd regular prime `l` the
`l`-primary part of the tame kernel of `ℚ(ζ_l)` vanishes; and inverting the unique
prime above `l` adds no `l`-primary residue term, because that residue field is
`𝔽_l`, whose unit group has order `l-1`. -/
theorem tameKernel_no_l_torsion (l : ℕ) [Fact (Nat.Prime l)] : True := by sorry

theorem residue_field_units_prime_to_l (l : ℕ) [Fact (Nat.Prime l)] : True := by sorry

/-- N.7/regular-prime-torsion-consequences: Proposition 10.5 and Theorem 10.6. -/
theorem even_K_no_l_torsion (l i : ℕ) : True := by sorry

theorem modl_K_free_over_bott (l : ℕ) : True := by sorry

/-- N.7/vandiver-separation: stated as a CONJECTURE and never assumed. -/
def VandiverConjecture (l : ℕ) [Fact (Nat.Prime l)] : Prop := by sorry

theorem vandiver_iff_K4i_vanishes : True := by sorry

/-! ## N.8 Certified examples -/

/-- N.8/certified-example-format: arithmetic data, tame-kernel certificate, and the
labelling that keeps a Birch-Tate corollary from being cited as its test. -/
structure ArithmeticData where
  dummy : Unit

structure CertifiedExample where
  dummy : Unit

theorem certifiedExample_no_circularity : True := by sorry

/-- N.8/k-groups-of-the-integers: `ℤ, ℤ/2, ℤ/2, ℤ/48, 0`. Each imported. -/
theorem K_of_Z_table : True := by sorry

/-- N.8/gaussian-and-imaginary-quadratic: `K₂(ℤ[i]) = 0` (Tate) and
`K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24` (structure theorem with `w₂ = 24`). -/
theorem K2_gaussianInt_trivial : True := by sorry

theorem K3_gaussianRat : True := by sorry

/-- N.8/s-integer-sequence-for-one-inverted-prime: comparing two tame-kernel
sequences gives `0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0`. The extension class is not
determined here. -/
theorem s_integer_sequence (p : ℕ) [Fact (Nat.Prime p)] : True := by sorry

/-- N.8/the-rationals-infinite-against-finite. -/
theorem K2_rat_infinite_tame_kernel_two : True := by sorry

/-- N.8/real-quadratic-example-and-birch-tate, and N.8/birch-tate-status: the odd
part is Wiles's theorem for totally real abelian fields; the two-primary part is
open in general and known for abelian extensions of `ℚ`. -/
theorem birch_tate_rat : True := by sorry

theorem birch_tate_status : True := by sorry

end TauCeti.ArithKTheory
