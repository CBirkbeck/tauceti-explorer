/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.7.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticKTheory--N.7 (stages N.7 and N.8): prototype,
implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only. The round-two independent review (7 October 2026)
corrects the expressible API signatures and tests. Its final elaboration result is
recorded in REV-FIX-RT-BP-ArithmeticKTheory--N.7~2.md. The Gaussian span is verified;
the cyclotomic representative-generation obligation supporting the real-quadratic
upper bound remains a recorded gap. No certificate completion is asserted here.

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
does one for "Vandiver"), the Bernoulli API for N.4’s invariant w_i, Kummer's criterion, the eigenspace
decomposition, and every K-group above the zeroth.

Imported and never re-planned: the tame kernel and the computations of K₂ (from
K2SymbolsBrauer T.5), the twisted coefficient modules (T.7), K₃ of the integers
and of the Gaussian rationals (K3BlochGroups V.5), the norm residue map
(MotivicEtaleKTheory M.3), the localisation theorem (ArithmeticKTheory N.2) and
the Birch-Tate formula (SpecialValuesBirchTate B.3, which since the fix of RT-AREA-ktheory-1 imports
N.8's real-quadratic certificate rather than being imported by N.8). Unavailable K-group, class-action and eigenspace interfaces are recorded as exact
mathematical comments with their suppliers, never as `True` or arbitrary carrier
placeholders. The N.8 comments and N.6 certificate ownership are preserved.
Vandiver's predicate is imported in the plan from IntegralIwasawaTheory L3;
that owner has no published L3 Lean declaration at this baseline, so no second
predicate or nonexistent module import is declared here.
-/
import Mathlib.NumberTheory.Bernoulli
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.Algebra.GroupWithZero.Units.Fintype
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.NumberTheory.NumberField.Cyclotomic.PID
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.Analysis.Real.Sqrt

noncomputable section

namespace TauCeti.ArithKTheory

/-! ## N.7 Regular primes and Bernoulli numbers -/

/-- N.7/bernoulli-conventions: this roadmap's convention is Mathlib's `bernoulli`
(`B₁ = -1/2`). The SOURCE (Weibel) uses the topologists' numbers `B_k^top = |B_{2k}|`,
which are NOT Mathlib's `bernoulli'` (that one differs from `bernoulli` only at index one).
Reviewer's correction (REV-ArithmeticKTheory--N.7): every formula quoted from the source is
re-indexed `k ↦ 2k`. -/
/- bernoulliArith is an alias of the imported convention, not a second Bernoulli definition. -/
abbrev bernoulliArith : ℕ → ℚ := bernoulli

theorem bernoulli_one_arith : bernoulli 1 = -1/2 := bernoulli_one

/-- b_one -/
example : bernoulli 1 = -1 / 2 ∧ bernoulli' 1 = 1 / 2 := by sorry

/-- agree_away_from_one -/
example (n : ℕ) (hn : n ≠ 1) : bernoulli n = bernoulli' n :=
  bernoulli_eq_bernoulli'_of_ne_one hn

theorem bernoulli_convert (n : ℕ) (hn : n ≠ 1) : bernoulli n = bernoulli' n := by sorry

/-- The source's topologists' Bernoulli numbers, used only when quoting Weibel. -/
def bernoulliTop (k : ℕ) : ℚ := (-1) ^ (k + 1) * bernoulli (2 * k)

theorem bernoulliTop_eq_abs (k : ℕ) (hk : 1 ≤ k) : bernoulliTop k = |bernoulli (2 * k)| ∧ 0 < bernoulliTop k := by
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
example : bernoulli 12 = -691 / 2730 ∧ (bernoulli 12).den = 2730 ∧
    bernoulli 6 = 1 / 42 := by sorry

/-- top_not_primed -/
example : bernoulliTop 1 = 1 / 6 ∧ bernoulli' 1 = 1 / 2 := by sorry

/-- five_divides_top_b_five: the source's `B_5 = 5/66` is `bernoulli 10`. -/
example : bernoulliTop 5 = 5 / 66 ∧ bernoulli 5 = 0 ∧
    (5 : ℤ) ∣ (bernoulli 10).num ∧ ¬ (5 : ℤ) ∣ (bernoulli 10 / 5).num := by sorry

/-- N.7/w-invariant imports ArithmeticKTheory N.4/the-w-invariant and its
finiteness, whose twist supplier is MotivicEtaleKTheory M.1. The local prototype
below stands for that unavailable imported declaration; it is not a second
planned definition. For positive i, `w_i(F)` is the largest `m` on whose
`i`-th twist of the roots of unity the Galois group acts trivially. The N.7 API
adds the Bernoulli-denominator comparison. -/
def wInvariant (F : Type*) [Field F] [NumberField F] (i : ℕ) : ℕ := by sorry

theorem wInvariant_even (F : Type*) [Field F] [NumberField F] (i : ℕ) (hi : 0 < i) :
    Even (wInvariant F i) := by sorry

theorem wInvariant_odd_rat (i : ℕ) (hi : Odd i) : wInvariant ℚ i = 2 := by sorry

/-- Over `ℚ`, `w_{2k}` is the denominator of `B_{2k}/4k` (the source's `B_k/4k`). -/
theorem wInvariant_even_rat (k : ℕ) (hk : 1 ≤ k) :
    wInvariant ℚ (2 * k) = (bernoulli (2 * k) / (4 * k)).den := by sorry

theorem wInvariant_prime_divides (i : ℕ) (hi0 : 0 < i) (l : ℕ) (hl : l.Prime) :
    l ∣ wInvariant ℚ i ↔ (l - 1) ∣ i := by sorry

theorem wInvariant_two_rat : wInvariant ℚ 2 = 24 := by sorry

/-- w_two_rat -/
example : wInvariant ℚ 2 = 24 ∧ (bernoulli 2 / 4).den = 24 := by sorry

/-- w_odd -/
example (i : ℕ) (hi : Odd i) : wInvariant ℚ i = 2 := by sorry

/-- w_gaussian: the twisted invariant, not the four ordinary roots of unity. -/
example : wInvariant (CyclotomicField 4 ℚ) 2 = 24 := by sorry

/-- prime_divisibility -/
example : wInvariant ℚ 6 = 504 ∧ 7 ∣ wInvariant ℚ 6 := by sorry

/-- w_four_rat: `240`, where the unconverted formula would give `48`. -/
example : wInvariant ℚ 4 = 240 := by sorry

/-- N.7/regular-prime: `p` is irregular when it divides the class number of the
`p`-th cyclotomic field. Neither pinned library defines this. -/
def IsRegularPrime (p : ℕ) : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

theorem IsRegularPrime.iff_not_dvd_classNumber (p : ℕ) :
    IsRegularPrime p ↔ ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ) := Iff.rfl

/-- Iwasawa's form (as the source states it): the whole tower `ℚ(μ_{p^ν})`. -/
theorem IsRegularPrime.iwasawa (p : ℕ) (hp : p.Prime) :
    IsRegularPrime p ↔
      ∀ ν : ℕ, 1 ≤ ν → ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ ν) ℚ) := by
  sorry

instance IsRegularPrime.decidable (p : ℕ) : Decidable (IsRegularPrime p) :=
  inferInstanceAs (Decidable (¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)))

theorem not_isRegularPrime_37 : ¬ IsRegularPrime 37 := by sorry

theorem isRegularPrime_of_lt_37 (p : ℕ) (hp : p.Prime) (h : p < 37) : IsRegularPrime p := by sorry

/-- thirty_seven_irregular -/
example : ¬ IsRegularPrime 37 := by sorry

/-- small_primes_regular -/
example (p : ℕ) (hp : p.Prime) (h : p < 37) : IsRegularPrime p := by sorry

/-- not_vandiver: 37 distinguishes the full class-number condition from the real one.
This uses the historical verification at 37 cited in the K-book; it does not
introduce or assume the global Vandiver predicate owned by IntegralIwasawaTheory L3. -/
example : ¬ IsRegularPrime 37 ∧
    ¬ 37 ∣ NumberField.classNumber
      (NumberField.maximalRealSubfield (CyclotomicField 37 ℚ)) := by sorry

/-- decidable_instance -/
example (p : ℕ) : Decidable (IsRegularPrime p) := inferInstance

/-- N.7/kummer-criterion: an odd prime `p` is irregular exactly when it divides the
numerator of one of `B_2, B_4, …, B_{p-3}` (the source's `B_k`, `k ≤ (p-3)/2`).
Quoted from the source, which cites Washington. -/
theorem kummer_criterion (p : ℕ) (hp : p.Prime) (hodd : Odd p) :
    ¬ IsRegularPrime p ↔
      ∃ k ∈ Finset.Icc 1 ((p - 3) / 2), (p : ℤ) ∣ (bernoulli (2 * k)).num := by
  sorry

/- `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`:
eigenspace and herbrand_ribet are not declared here. The missing interface is
the canonical G-action on P = Pic(𝓞_F[1/l])/l Pic(𝓞_F[1/l]), F = ℚ(ζ_l),
G = Gal(F/ℚ), as a ZMod l-module, with cyclotomic character χ.
N.7 owns this class-action/eigenspace construction. For j modulo l−1 set
P^[j] = {x ∈ P | ∀ σ ∈ G, σ x = χ(σ)^j • x}. The projectors divide by l−1,
which is invertible in ZMod l, not in ℤ.
For l an odd prime and 1 ≤ k ≤ (l−3)/2, Herbrand–Ribet asserts
(l : ℤ) ∣ (bernoulli (2*k)).num ↔ P^[l−2*k] ≠ 0.
No arbitrary Type parameter or unconnected eigenspace stub can state this theorem.
Tests: a regular prime has P = 0; for l = 37 and k = 16 the character
index is 5 and the component is ℤ/37. The original proof-source gap remains.
Source: Weibel VI.10.8.1, printed p. 532 (PDF p. 540). -/

/- `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`:
tameKernel_no_l_torsion is not stated here; for an ODD REGULAR prime l and
F = ℚ(ζ_l), K₂(𝓞_F)[l^∞] = 0, and inverting the unique prime above l adds
no l-primary residue-unit term. Needs the genuine tame-kernel/K₂ carrier
and localisation sequence (supplier: K2SymbolsBrauer T.5), twists (T.7)
and Tate comparison (MotivicEtaleKTheory M.3); N.7 owns the application.
Test: l = 5; not asserted for irregular primes. No K-group is invented.
Source: Weibel VI.8.3.2, printed p. 514 (PDF p. 522). -/

/-- `ArithmeticKTheory:N.7/residue-field-units-prime-to-l`.
For any maximal ideal P above l in ℚ(ζ_l), the actual quotient field has l
elements and its units have l−1 elements. Primality alone suffices; in
particular l = 2 is allowed, and neither oddness nor regularity is assumed.
The proof uses cyclotomic inertia degree 1 / absolute norm l and Nat.card_units;
it does not use K-theoretic vanishing. -/
theorem residue_field_units_prime_to_l
    (l : ℕ) [Fact (Nat.Prime l)]
    (P : Ideal (NumberField.RingOfIntegers (CyclotomicField l ℚ)))
    [P.IsMaximal] [P.LiesOver (Ideal.span {(l : ℤ)})] :
    Nat.card ((NumberField.RingOfIntegers (CyclotomicField l ℚ) ⧸ P)ˣ) = l - 1 ∧
      ¬ l ∣ Nat.card ((NumberField.RingOfIntegers (CyclotomicField l ℚ) ⧸ P)ˣ) := by
  sorry

/-- Residue-unit test l = 2: the multiplicative group has one element, not two. -/
example (P : Ideal (NumberField.RingOfIntegers (CyclotomicField 2 ℚ)))
    [P.IsMaximal] [P.LiesOver (Ideal.span {(2 : ℤ)})] :
    Nat.card ((NumberField.RingOfIntegers (CyclotomicField 2 ℚ) ⧸ P)ˣ) = 1 := by
  sorry

/-- Residue-unit test l = 5: order four, hence no 5-primary contribution. -/
example (P : Ideal (NumberField.RingOfIntegers (CyclotomicField 5 ℚ)))
    [P.IsMaximal] [P.LiesOver (Ideal.span {(5 : ℤ)})] :
    Nat.card ((NumberField.RingOfIntegers (CyclotomicField 5 ℚ) ⧸ P)ˣ) = 4 := by
  sorry

/- `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`:
even_K_no_l_torsion is not stated here: for l an odd regular prime and i ≥ 1,
K_{2i}(ℤ)[l^∞] = 0. The only l-primary odd torsion is the Harris–Segal summand
(ℤ/w_i(ℚ))_(l) in K_{2i−1}(ℤ), when (l−1) ∣ i.
Needs actual higher K-groups (GeneralAlgebraicKTheory), arithmetic descent
(ArithmeticKTheory N.5/N.6), and the w-invariant of N.7; N.7 owns the consequence.
Source: Weibel VI.10.5, printed p. 530 (PDF p. 538).

modl_K_free_over_bott is not stated here: for l an odd regular prime,
K_*(ℤ[1/l]; ℤ/l) is free graded over (ℤ/l)[β^(l−1)], |β^(l−1)| = 2l−2.
Its (l+3)/2 generators are 1 in degree 0, v in degree 2l−3, and y_k in
degree 4k+1 for 0 ≤ k ≤ (l−3)/2. Needs genuine finite-coefficient graded
K-theory and Bott action (ArithmeticKTheory N.5/N.6), not an arbitrary module.
Test l = 5: degrees 0, 1, 5, 7 and ranks 1,1,0,0,0,1,0,1 modulo 8.
Source: Weibel VI.10.6, printed pp. 531–532 (PDF pp. 539–540). -/

/- `ArithmeticKTheory:N.7/vandiver-separation`:
VandiverConjecture is not a second definition here. Import the predicate
Vandiver(l) from its single owner IntegralIwasawaTheory:L3. Its exact contract,
for a prime l, in the pinned Mathlib vocabulary is
  ¬ l ∣ NumberField.classNumber
    (NumberField.maximalRealSubfield (CyclotomicField l ℚ)).
This condition is expressible, not an unknown Prop. No L3 Lean module/predicate
has yet been published, so this file does not invent an import or redefine it.
L3 supplies transport from its ℚ(μ_l)^+ model to this intrinsic real subfield.
N.7 owns the comparison with the sum of odd-character components of Pic(𝓞_F)/l
(equivalently conjugation acts by −1), not the imported predicate.

vandiver_iff_K4i_vanishes is not stated here; needs genuine K-groups and the
owner-supplied predicate. The GLOBAL conjecture (Vandiver(l) for every odd prime,
with regular primes automatic) is equivalent to
∀ i ≥ 2, K_{4i}(ℤ) = 0. A condition at a single prime does not imply this global
vanishing. K₄(ℤ) = 0 is unconditional and imported, not an instance of the open
conjecture. Unconditionally the source records that these higher groups have
order a product of irregular primes > 10^8; the bound is historical to this source.
Suppliers: IntegralIwasawaTheory L3 (predicate), ArithmeticKTheory N.5/N.6
(arithmetic K-groups); N.7 owns the comparison and conditional consequence.
Sources: Weibel VI.10.8, p. 532 (PDF p. 540), and the paragraph before
Table 10.1.1, p. 527 (PDF p. 535). Vandiver is not silently assumed. -/

/-- The pinned real-subfield carrier has a genuine NumberField instance.
This checks the condition's carrier, not Vandiver's conjecture. -/
example (l : ℕ) :
    NumberField (NumberField.maximalRealSubfield (CyclotomicField l ℚ)) := inferInstance

/-! ## N.8 Certified examples

Revision for FIX-RT-AREA-ktheory-1 (30 September 2026), findings 9 and 11 of RT-AREA-ktheory-1: the
certificate format is ArithmeticKTheory N.6's `OrderCertificate` (see the N.1–N.6 suggested file);
K₀(ℤ), K₁(ℤ), K₂(ℤ) and K₂(ℚ) are imported (KTheoryLowDegrees Z.6, U.6; K2SymbolsBrauer T.5); N.8 owns
the certificates K₂(ℤ[i]) = 0 and K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², the latter exported to SpecialValuesBirchTate
B.3, and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree. Statements that need a K-group above
degree zero are `not stated here` comments, the convention of the N.1–N.6 file.

Revision for FIX-RT-BP-ArithmeticKTheory--N.7~2 (6 October 2026): the span proofs of both certificates.
Tate's method (`N.8/tate-norm-filtration`, `N.8/tate-criterion`) proves K₂(ℤ[i]) = 0
(`N.8/gaussian-tame-kernel-vanishes`); restriction to ℚ(ζ₅), where the tame kernel vanishes
(Zhang–Xu, `N.8/tame-kernel-of-q-zeta-five`), transfer, and Tate's description of two-torsion prove
that {−1, −1} and {−1, ε} generate K₂(𝓞_{ℚ(√5)}) (`N.8/real-quadratic-upper-generation`)
once the recorded cyclotomic generation obligation is supplied. The
arithmetic inputs of those proofs are stated below as genuine signatures; the K₂ statements are
comments. -/

/-! ### `ArithmeticKTheory:N.8/certified-example-format` (definition) -/

/-- ArithmeticData: concrete invariant values with equality proofs, without a K-group carrier.
The equalities are actual proof obligations, not unnamed proposition fields. -/
structure ArithmeticData (F : Type*) [Field F] [NumberField F] where
  degree : ℕ
  nrReal : ℕ
  nrComplex : ℕ
  classNumber : ℕ
  unitRank : ℕ
  w : ℕ → ℕ
  degree_eq : degree = Module.finrank ℚ F
  nrReal_eq : nrReal = NumberField.InfinitePlace.nrRealPlaces F
  nrComplex_eq : nrComplex = NumberField.InfinitePlace.nrComplexPlaces F
  classNumber_eq : classNumber = NumberField.classNumber F
  unitRank_eq : unitRank = NumberField.Units.rank F
  w_eq : ∀ i : ℕ, 0 < i → w i = wInvariant F i

/-- data_from_libraries: the stored arithmetic values agree with their actual suppliers.
This checks the arithmetic-data half; the certificate tests below still need K₂. -/
example (F : Type*) [Field F] [NumberField F] (d : ArithmeticData F) :
    d.degree = Module.finrank ℚ F ∧
      d.classNumber = NumberField.classNumber F ∧ d.unitRank = NumberField.Units.rank F := by
  sorry
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
-- test gaussian_certified (computation): not stated here; needs CertifiedExample and K₂(ℤ[i]): no
--   generators, span by `N.8/gaussian-tame-kernel-vanishes`, lower bound onto the trivial group
-- test sqrt_five_certified (computation): not stated here; needs CertifiedExample and K₂(𝓞_{ℚ(√5)}):
--   generators {−1, −1}, {−1, ε} with relations 2g = 0, span by `N.8/real-quadratic-upper-generation`,
--   lower bound the two real sign symbols onto (ℤˣ)²; the identity 1/30 = 4/120 is tagged as B.3's test

/- `ArithmeticKTheory:N.8/k-groups-of-the-integers`: `K₀(ℤ) = ℤ`, `K₁(ℤ) = ℤ/2`, `K₂(ℤ) = ℤ/2`,
`K₃(ℤ) = ℤ/48`, `K₄(ℤ) = 0`, each imported: not stated here; needs `K_n` (supplier: KTheoryLowDegrees
Z.6, U.6; K2SymbolsBrauer T.5/k2-of-the-integers; K3BlochGroups V.5). -/

/-! ### `ArithmeticKTheory:N.8/tate-norm-filtration` (definition)

Finite places v₁, v₂, … of a number field F in order of nondecreasing norm, S_m = {v₁, …, v_m},
U_m the S_m-units (Mathlib's `Set.unit`), K₂^{S_m}(F) the subgroup of K₂(F) generated by the
symbols of U_m. At a place v_m with prime generated by π, and U = U_{m−1}: α(u) = {u, π},
β(u) = u mod v_m, and U₁ the subgroup of U generated by (1 + πU) ∩ U. Only U₁ is free of K₂ and
is stated as a definition below. -/

-- tateFiltration: not stated here; needs K₂(F) and its Steinberg symbols (supplier: K2SymbolsBrauer
--   T.1/k2-definition, T.2/matsumoto); m ↦ the subgroup generated by the symbols of `Set.unit` for S_m
-- tateFiltration_mono: not stated here; needs tateFiltration
-- iSup_tateFiltration: not stated here; needs tateFiltration (and T.3/finite-support)
-- tameSymbol_eq_one_of_mem_tateFiltration: not stated here; needs tateFiltration and the tame symbol
--   of K2SymbolsBrauer T.3/tame-symbol
-- tateGradedResidue: not stated here; needs tateFiltration and the tame symbol
-- tateAlpha: not stated here; needs tateFiltration (u ↦ {u, π} modulo the previous step)
-- tateGradedResidue_comp_tateAlpha: not stated here; needs tateGradedResidue and tateAlpha
--   (the composite is reduction modulo v_m, in T.3's convention ∂_v{u, t} = ū)
-- tateAlpha_tateUnitSubgroup: not stated here; needs tateAlpha (it kills `tateUnitSubgroup`, by the
--   Steinberg identity {1 + πx, −πx} = 1)
-- tateFiltration_zero_le_unramified: not stated here; needs tateFiltration and K2SymbolsBrauer
--   T.5/unramified-subgroup
-- test tateFiltration_zero_rat (computation): not stated here; needs tateFiltration (for ℚ, step 0 is
--   generated by {−1, −1})
-- test tateFiltration_units_not_integers (non-example): not stated here; needs tateFiltration
--   ({−1, 3} is not in step 1 over ℚ, as ∂₃{−1, 3} = −1)
-- test tateFiltration_zero_le_unramified_rat (compatibility): not stated here; needs tateFiltration
-- test tateGradedResidue_surjective_rat_five (characterisation): not stated here; needs
--   tateGradedResidue ({2, 5} ↦ 2, a generator of 𝔽₅ˣ)

open IsDedekindDomain in
/-- `tateUnitSubgroup`: Tate's group U₁ at a place with generator `π`, for the `S`-units `U`
of a Dedekind domain `R` with fraction field `K`: the subgroup of `Kˣ` generated by the
`S`-units of the form `1 + π x` with `x` an `S`-unit. -/
def tateUnitSubgroup {R : Type*} [CommRing R] [IsDedekindDomain R] (K : Type*) [Field K]
    [Algebra R K] [IsFractionRing R K] (S : Set (HeightOneSpectrum R)) (π : K) : Subgroup Kˣ :=
  Subgroup.closure {u : Kˣ | u ∈ S.unit K ∧ ∃ x ∈ S.unit K, (u : K) = 1 + π * (x : K)}

open IsDedekindDomain in
theorem tateUnitSubgroup_le_unit {R : Type*} [CommRing R] [IsDedekindDomain R] (K : Type*)
    [Field K] [Algebra R K] [IsFractionRing R K] (S : Set (HeightOneSpectrum R)) (π : K) :
    tateUnitSubgroup K S π ≤ S.unit K := by
  sorry

/-- tateUnitSubgroup_gaussian_one_add_i, its arithmetic content: at the place `1 + i` of `ℤ[i]`
the unit `i` is `1 + (1 + i) · i`, so `i ∈ U₁` and U₁ = ⟨i⟩. -/
example : (⟨0, 1⟩ : GaussianInt) = 1 + (⟨1, 1⟩ : GaussianInt) * ⟨0, 1⟩ := by sorry

/- `ArithmeticKTheory:N.8/tate-criterion` (theorem), Tate's Proposition 1, Lemma 1 and the descent:
not stated here; needs tateFiltration, tateGradedResidue and tateAlpha. (a) If W, C, G ⊆ U with
W ⊆ C·U₁ and ⟨W⟩ = U, C·G ⊆ C·U₁ and ⟨β(G)⟩ = k(v)ˣ, 1 ∈ C and C ∩ ker β ⊆ U₁, then the graded
residue at v is bijective. (b) If a, b ∈ 𝓞_F ∩ U, a ≡ b mod v and |N(a − b)| < (N v)², then
a/b ∈ U₁ (for imaginary quadratic F: |a| + |b| < N v). (c) If the graded residue is bijective at
every v_j with j > m₀, the tame kernel K₂(𝓞_F) lies in K₂^{S_{m₀}}(F); with m₀ = 0 it is the
subgroup generated by the symbols of units. Sources: Browkin (2000), Theorem 1 and Lemma 4;
Zhang–Xu (2016), Lemmas 2.1–2.2. -/

/-! ### `ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishes` (theorem)

`K₂(ℤ[i]) = 0`: not stated here; needs K₂ of a ring and the tame-kernel sequence (supplier:
K2SymbolsBrauer T.1, T.5/tame-kernel-sequence). The proof applies `N.8/tate-criterion` at every
Gaussian place with the sets below, and shows {i, i} = {i, −1} = {i, i}², so step 0 is trivial.
Its arithmetic inputs are genuine statements. -/

/-- The factor one half of Gaussian division: the remainder has at most half the norm of the
divisor. Mathlib's `GaussianInt.norm_mod_lt` gives only `<`; the bound is the intermediate step
`normSq ≤ 1/2` in the proof of `GaussianInt.normSq_div_sub_div_lt_one`. -/
theorem gaussian_two_mul_norm_mod_le (x : GaussianInt) {y : GaussianInt} (hy : y ≠ 0) :
    2 * (x % y).norm ≤ y.norm := by
  sorry

/-- Tate's set C = G at a Gaussian place `(π)`: the non-zero `c` with `2 N(c) ≤ N(π)`. -/
def gaussianResidueReps (π : GaussianInt) : Set GaussianInt :=
  {c | c ≠ 0 ∧ 2 * c.norm ≤ π.norm}

/-- Every non-zero residue class modulo a Gaussian prime meets `gaussianResidueReps`. -/
theorem exists_mem_gaussianResidueReps (π : GaussianInt) (hπ : Prime π) (x : GaussianInt)
    (hx : ¬ π ∣ x) : ∃ c ∈ gaussianResidueReps π, π ∣ x - c := by
  sorry

/-- Condition (3) of Tate's criterion at a place of norm `N ≥ 5`: `|c| + 1 < N`. -/
example (N : ℝ) (hN : 5 ≤ N) : Real.sqrt (N / 2) + 1 < N := by sorry

/-- Condition (2): `|c c'| + |c''| < N` as soon as `N > 2`. -/
example (N : ℝ) (hN : 2 < N) : N / 2 + Real.sqrt (N / 2) < N := by sorry

/-- Condition (1): `|c| + |w| ≤ (1 + 1/√2) √N < N` for `N ≥ 5`; it fails at the place of norm 2,
which is treated by the identity `i = 1 + (1 + i) · i`. -/
example (N : ℝ) (hN : 5 ≤ N) : (1 + 1 / Real.sqrt 2) * Real.sqrt N < N := by sorry

/- `ArithmeticKTheory:N.8/gaussian-and-imaginary-quadratic`: the certificate `K₂(ℤ[i]) = 0` (empty
presentation, span by `N.8/gaussian-tame-kernel-vanishes`, trivial lower bound) and
`K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24`: not stated here; needs `K₂`, `K₃` and `OrderCertificate` (supplier:
K2SymbolsBrauer T.5; K3BlochGroups V.5; ArithmeticKTheory N.6). -/

/- `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`: for every `n ≥ 1`,
`0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n-1}(𝔽_p) → 0`, and `K₀(ℤ) ≅ K₀(ℤ[1/p])`; in degree two it is
K2SymbolsBrauer T.5's relative sequence and splits: not stated here; needs `K_n` and the localisation
sequence (supplier: ArithmeticKTheory N.2, N.5; KTheoryFiniteLocalFields L.1; K2SymbolsBrauer
T.5/relative-s-integer-sequence; KTheoryLowDegrees U.6). -/

/- `ArithmeticKTheory:N.8/the-rationals-infinite-against-finite`: `K₂(ℚ)` is infinite while the tame
kernel `K₂(ℤ)` has order two: not stated here; needs `K₂` (supplier: K2SymbolsBrauer
T.5/k2-of-the-integers, T.5/k2-of-the-rationals). -/

/-! ### `ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five` (theorem)

Zhang–Xu: `K₂(ℤ[ζ₅]) = 0`: not stated here; needs K₂ of a ring (supplier: K2SymbolsBrauer T.1,
T.5/tame-kernel-sequence). Tate's criterion holds at every place (their Theorems 3.3–3.6, with
Skalba's generalised Thue theorem and the U_m-compatible representative selection recorded
as gaps). This generation step remains unverified by the independent review; once supplied,
K₂(ℤ[ζ₅]) is generated by the six symbols
of −1, ζ and ξ = 1 + ζ + ζ²; Tate's Theorem (6.2) (MotivicEtaleKTheory M.3) leaves no element of
order 2, and {ζ, ξ} = {ζ³, 1 − ζ³}² = 1. Arithmetic inputs: -/

/-- Class number one of `ℚ(ζ₅)`, pinned in Mathlib. -/
example (E : Type*) [Field E] [NumberField E] [IsCyclotomicExtension {5} ℚ E] :
    IsPrincipalIdealRing (NumberField.RingOfIntegers E) :=
  IsCyclotomicExtension.Rat.five_pid E

/-- `[ℚ(ζ₅) : ℚ] = 4`, from `IsCyclotomicExtension.finrank`. -/
example (E : Type*) [Field E] [NumberField E] [IsCyclotomicExtension {5} ℚ E] :
    Module.finrank ℚ E = 4 := by sorry

/-- `2` is inert in `ℚ(ζ₅)`: it has order 4 modulo 5, and the residue field is `𝔽₁₆`. -/
theorem cyclotomicFive_two_isPrime (E : Type*) [Field E] [NumberField E]
    [IsCyclotomicExtension {5} ℚ E] :
    (Ideal.span {(2 : NumberField.RingOfIntegers E)}).IsPrime := by
  sorry

/-- The quadratic Gauss sum: `√5 = ζ − ζ² − ζ³ + ζ⁴`, so `ℚ(√5) ⊆ ℚ(ζ₅)`. -/
theorem sqrt_five_eq_gauss_sum (E : Type*) [Field E] (ζ : E) (hζ : IsPrimitiveRoot ζ 5) :
    (ζ - ζ ^ 2 - ζ ^ 3 + ζ ^ 4) ^ 2 = 5 := by
  sorry

/-! ### `ArithmeticKTheory:N.8/real-quadratic-upper-generation` (theorem)

`K₂(𝓞_{ℚ(√5)}) ⊆ ⟨{−1, −1}, {−1, ε}⟩`, `ε = (1 + √5)/2`: not stated here; needs K₂ (supplier:
K2SymbolsBrauer T.1, T.5/tame-kernel-sequence). Proof: restriction to ℚ(ζ₅) lands in
K₂(ℤ[ζ₅]) = 0 and transfer after restriction is multiplication by 2 (K2SymbolsBrauer
T.4/restriction-transfer-degree), so K₂(𝓞_F) is killed by 2; an element of order 2 is {−1, b}
(Tate's Theorem (6.1), MotivicEtaleKTheory M.3); unramifiedness at the odd primes, class number one
and the units ±εⁿ reduce b to ±εⁿ, and {−1, 2} = 1. The arithmetic inputs, for any number field
`F` of degree 2 containing a square root `s` of 5: -/

section SqrtFive

variable (F : Type*) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) (s : F)
  (hs : s ^ 2 = 5)
include hF hs

/-- Class number one, from `RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt`
(`|d_F| = 5 < 16`). -/
theorem sqrtFive_isPrincipalIdealRing : IsPrincipalIdealRing (NumberField.RingOfIntegers F) := by
  sorry

/-- `2` is inert: `X² − X − 1` has no root modulo 2. -/
theorem sqrtFive_two_isPrime : (Ideal.span {(2 : NumberField.RingOfIntegers F)}).IsPrime := by
  sorry

/-- The units are `±εⁿ`, with `ε = (1 + s)/2` the least unit greater than 1. -/
theorem sqrtFive_units (u : (NumberField.RingOfIntegers F)ˣ) :
    ∃ n : ℤ, ((u : NumberField.RingOfIntegers F) : F) = ((1 + s) / 2) ^ n ∨
      ((u : NumberField.RingOfIntegers F) : F) = -((1 + s) / 2) ^ n := by
  sorry

/-- Two real places, the source of the two sign symbols of the lower bound. -/
theorem sqrtFive_nrRealPlaces : NumberField.InfinitePlace.nrRealPlaces F = 2 := by
  sorry

end SqrtFive

/-- Minkowski's bound for a real quadratic field: `|d_F| = 5 < (2 · (π/4)⁰ · 2²/2!)² = 16`. -/
example : (5 : ℝ) < (2 * (Real.pi / 4) ^ 0 * ((2 : ℝ) ^ 2 / 2)) ^ 2 := by sorry

/- `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`: the tame-kernel certificate
`K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)²`, generated by `{-1, -1}` and `{-1, ε}`, `ε = (1 + √5)/2`, with the two
real sign symbols as lower bound and `N.8/real-quadratic-upper-generation` as span; the
Birch–Tate check `1/30 = 4/120` is SpecialValuesBirchTate B.3's, which imports this certificate:
not stated here; needs `K₂` and `OrderCertificate` (supplier: K2SymbolsBrauer T.5/real-sign-symbol,
T.5/tame-kernel-sequence; ArithmeticKTheory N.6/order-certificate). -/

/- The former `N.8/birch-tate-status` is deleted (RT-AREA-ktheory-1/11): the status of the
Birch–Tate formula is SpecialValuesBirchTate's, and what an example may claim is the labelling rule
of `N.8/certified-example-format`. -/

end TauCeti.ArithKTheory

/- Review REV-FIX-RT-AREA-ktheory-1 found that neither example supplied its span proof, and
REV-FIX-RT-BP-ArithmeticKTheory--N.7 kept the packet open for that reason. FIX-RT-BP-
ArithmeticKTheory--N.7~2 proposes both span proofs independently of the Birch–Tate formula.
REV-FIX-RT-BP-ArithmeticKTheory--N.7~2 verifies the Gaussian proof and the real-quadratic
transfer/reduction, but the latter still needs the recorded cyclotomic representative-generation
obligation. The
lower bound 4 for ℚ(√5) is the pair of real sign characters, as before. -/
