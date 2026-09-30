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
  (B₁ = +1/2), with `bernoulli_eq_bernoulli'_of_ne_one` relating them; von Staudt–Clausen
  (`Bernoulli.vonStaudt_clausen`). The source's topologists' `B_k` is `|bernoulli (2k)|`,
  not `bernoulli'` (reviewer's correction).
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
the Birch-Tate formula (SpecialValuesBirchTate B.3, which since the fix of RT-AREA-ktheory-1 imports
N.8's real-quadratic certificate rather than being imported by N.8). In the N.7 section these appear
as `True` placeholders; the N.8 section records them as `not stated here` comments.
-/
import Mathlib.NumberTheory.Bernoulli
import Mathlib.Algebra.Squarefree.Basic
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

/-- N.7/bernoulli-conventions: this roadmap's convention is Mathlib's `bernoulli`
(`B₁ = -1/2`). The SOURCE (Weibel) uses the topologists' numbers `B_k^top = |B_{2k}|`,
which are NOT Mathlib's `bernoulli'` (that one differs from `bernoulli` only at index one).
Reviewer's correction (REV-ArithmeticKTheory--N.7): every formula quoted from the source is
re-indexed `k ↦ 2k`. -/
theorem bernoulli_convention_one : bernoulli 1 = -1/2 := by sorry

theorem bernoulli_convert (n : ℕ) (hn : n ≠ 1) : bernoulli n = bernoulli' n := by sorry

/-- The source's topologists' Bernoulli numbers, used only when quoting Weibel. -/
def bernoulliTop (k : ℕ) : ℚ := (-1) ^ (k + 1) * bernoulli (2 * k)

theorem bernoulliTop_eq_abs (k : ℕ) (hk : 1 ≤ k) : bernoulliTop k = |bernoulli (2 * k)| := by
  sorry

/-- von Staudt–Clausen, in the pinned Mathlib (`Bernoulli.vonStaudt_clausen`,
`Bernoulli.dvd_den_bernoulli`, `Bernoulli.not_sq_dvd_den_bernoulli`). -/
theorem bernoulli_denominator (k : ℕ) (hk : 1 ≤ k) :
    (bernoulli (2 * k)).den =
      ∏ p ∈ (Finset.range (2 * k + 2)).filter (fun p => p.Prime ∧ (p - 1) ∣ 2 * k), p := by
  sorry

theorem bernoulli_denominator_squarefree (k : ℕ) (hk : 1 ≤ k) :
    Squarefree (bernoulli (2 * k)).den ∧ 6 ∣ (bernoulli (2 * k)).den := by
  sorry

/-- b_twelve_denominator: the source's `B_6 = 691/2730` is `bernoulli 12`. -/
example : bernoulli 12 = -691 / 2730 ∧ bernoulli 6 = 1 / 42 := by sorry

/-- top_not_primed -/
example : bernoulliTop 1 = 1 / 6 ∧ bernoulli' 1 = 1 / 2 := by sorry

/-- five_divides_top_b_five: the source's `B_5 = 5/66` is `bernoulli 10`. -/
example : bernoulliTop 5 = 5 / 66 ∧ bernoulli 5 = 0 := by sorry

/-- N.7/w-invariant: `w_i(F)` is the largest `m` on whose `i`-th twist of the roots
of unity the Galois group acts trivially. -/
def wInvariant (F : Type) [Field F] [NumberField F] (i : ℕ) : ℕ := by sorry

theorem wInvariant_odd_rat (i : ℕ) (hi : Odd i) : wInvariant ℚ i = 2 := by sorry

/-- Over `ℚ`, `w_{2k}` is the denominator of `B_{2k}/4k` (the source's `B_k/4k`). -/
theorem wInvariant_even_rat (k : ℕ) (hk : 1 ≤ k) :
    wInvariant ℚ (2 * k) = (bernoulli (2 * k) / (4 * k)).den := by sorry

theorem wInvariant_prime_divides (i : ℕ) (hi : Even i) (hi0 : 0 < i) (l : ℕ) (hl : l.Prime) :
    l ∣ wInvariant ℚ i ↔ (l - 1) ∣ i := by sorry

theorem wInvariant_two_rat : wInvariant ℚ 2 = 24 := by sorry

/-- w_four_rat: `240`, where the unconverted formula would give `48`. -/
example : wInvariant ℚ 4 = 240 := by sorry

/-- N.7/regular-prime: `p` is irregular when it divides the class number of the
`p`-th cyclotomic field. Neither pinned library defines this. -/
def IsRegularPrime (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

theorem isRegularPrime_iff_not_dvd_classNumber (p : ℕ) :
    IsRegularPrime p ↔ ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ) := Iff.rfl

/-- Iwasawa's form (as the source states it): the whole tower `ℚ(μ_{p^ν})`. -/
theorem isRegularPrime_iwasawa (p : ℕ) (hp : p.Prime) :
    IsRegularPrime p ↔
      ∀ ν : ℕ, 1 ≤ ν → ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ ν) ℚ) := by
  sorry

theorem not_isRegularPrime_37 : ¬ IsRegularPrime 37 := by sorry

theorem isRegularPrime_of_lt_37 (p : ℕ) (hp : p.Prime) (h : p < 37) : IsRegularPrime p := by sorry

/-- N.7/kummer-criterion: an odd prime `p` is irregular exactly when it divides the
numerator of one of `B_2, B_4, …, B_{p-3}` (the source's `B_k`, `k ≤ (p-3)/2`).
Quoted from the source, which cites Washington. -/
theorem kummer_criterion (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    ¬ IsRegularPrime p ↔
      ∃ k ∈ Finset.Icc 1 ((p - 3) / 2), (p : ℤ) ∣ (bernoulli (2 * k)).num := by
  sorry

/-- N.7/eigenspaces-and-herbrand-ribet. The projectors need `(l-1)⁻¹`, which exists
mod `l`; an integral statement using them would be wrong. Herbrand–Ribet: for
`1 ≤ k ≤ (l-3)/2`, `l` divides the numerator of `B_{2k}` (the source's `B_k`) iff the
eigenspace of index `l - 2k` is nonzero. -/
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

/-! ## N.8 Certified examples

Revision for FIX-RT-AREA-ktheory-1 (30 September 2026), findings 9 and 11 of RT-AREA-ktheory-1: the
certificate format is ArithmeticKTheory N.6's `OrderCertificate` (see the N.1–N.6 suggested file);
K₀(ℤ), K₁(ℤ), K₂(ℤ) and K₂(ℚ) are imported (KTheoryLowDegrees Z.6, U.6; K2SymbolsBrauer T.5); N.8 owns
the certificates K₂(ℤ[i]) = 0 and K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², the latter exported to
SpecialValuesBirchTate B.3, and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree. The former
`True` placeholders of this section are replaced by the `not stated here` comments of the N.1–N.6
file's convention, since every statement below needs a K-group above degree zero. This revision was
not compiled. -/

/-! ### `ArithmeticKTheory:N.8/certified-example-format` (definition) -/

-- ArithmeticData: not stated here as a structure with fields; suggested fields: the degree
--   `Module.finrank ℚ F`, the signature `(nrRealPlaces F, nrComplexPlaces F)`, `NumberField.classNumber F`,
--   `NumberField.Units.rank F` and the invariants `w_i(F)` (ArithmeticKTheory N.4), each with its proof
-- CertifiedExample: not stated here; needs ArithmeticData, an `OrderCertificate` (ArithmeticKTheory
--   N.6/order-certificate) for the tame kernel K₂(𝓞_F) and the labelling (supplier: K2SymbolsBrauer T.1
--   for K₂; ArithmeticKTheory N.6)
-- CertifiedExample.tag: not stated here; needs CertifiedExample (the tag is computed | imported |
--   deduced, with its origin)
-- CertifiedExample.no_circularity: not stated here; needs CertifiedExample
-- CertifiedExample.admissible: not stated here; needs CertifiedExample
-- test deduced_not_evidence (non-example): not stated here; needs CertifiedExample
-- test upper_bound_only (degenerate): not stated here; needs OrderCertificate without its lower bound
-- test rationals_admissible (computation): not stated here; needs K₂(ℤ) (K2SymbolsBrauer T.5)
-- test data_from_libraries (compatibility): not stated here; the arithmetic data of ℚ, ℚ(i) and
--   ℚ(√5) are to be discharged from Mathlib's `NumberField.classNumber` and `NumberField.Units.rank`

/- `ArithmeticKTheory:N.8/k-groups-of-the-integers`: `K₀(ℤ) = ℤ`, `K₁(ℤ) = ℤ/2`, `K₂(ℤ) = ℤ/2`,
`K₃(ℤ) = ℤ/48`, `K₄(ℤ) = 0`, each imported: not stated here; needs `K_n` (supplier: KTheoryLowDegrees
Z.6, U.6; K2SymbolsBrauer T.5/k2-of-the-integers; K3BlochGroups V.5). -/

/- `ArithmeticKTheory:N.8/gaussian-and-imaginary-quadratic`: the certificate `K₂(ℤ[i]) = 0` (empty
presentation; its span obligation, Tate's vanishing, is a recorded gap) and `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`:
not stated here; needs `K₂`, `K₃` and `OrderCertificate` (supplier: K2SymbolsBrauer T.5;
K3BlochGroups V.5; ArithmeticKTheory N.6). -/

/- `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`: for every `n ≥ 1`,
`0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n-1}(𝔽_p) → 0`, and `K₀(ℤ) ≅ K₀(ℤ[1/p])`; in degree two it is
K2SymbolsBrauer T.5's relative sequence and splits: not stated here; needs `K_n` and the localisation
sequence (supplier: ArithmeticKTheory N.2, N.5; KTheoryFiniteLocalFields L.1; K2SymbolsBrauer
T.5/relative-s-integer-sequence; KTheoryLowDegrees U.6). -/

/- `ArithmeticKTheory:N.8/the-rationals-infinite-against-finite`: `K₂(ℚ)` is infinite while the tame
kernel `K₂(ℤ)` has order two: not stated here; needs `K₂` (supplier: K2SymbolsBrauer
T.5/k2-of-the-integers, T.5/k2-of-the-rationals). -/

/- `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`: the certified tame kernel
`K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)²`, generated by `{-1, -1}` and `{-1, ε}`, `ε = (1 + √5)/2`, with the two
real sign symbols as lower bound and a generation argument (recorded gap) as upper bound; the
Birch–Tate check `1/30 = 4/120` is SpecialValuesBirchTate B.3's, which imports this certificate:
not stated here; needs `K₂` and `OrderCertificate` (supplier: K2SymbolsBrauer T.5/real-sign-symbol,
T.5/tame-kernel-sequence; ArithmeticKTheory N.6/order-certificate). -/

/- The former `N.8/birch-tate-status` is deleted (RT-AREA-ktheory-1/11): the status of the
Birch–Tate formula is SpecialValuesBirchTate's, and what an example may claim is the labelling rule
of `N.8/certified-example-format`. -/

end TauCeti.ArithKTheory
