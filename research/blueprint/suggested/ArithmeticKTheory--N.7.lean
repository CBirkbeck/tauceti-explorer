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
the proposed certificates K₂(ℤ[i]) = 0 and K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², the latter to be exported, once complete, to
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

/- `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`: the proposed tame-kernel certificate (upper-bound generation gap remains)
`K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)²`, generated by `{-1, -1}` and `{-1, ε}`, `ε = (1 + √5)/2`, with the two
real sign symbols as lower bound and a generation argument (recorded gap) as upper bound; the
Birch–Tate check `1/30 = 4/120` is SpecialValuesBirchTate B.3's, which may import this certificate once complete:
not stated here; needs `K₂` and `OrderCertificate` (supplier: K2SymbolsBrauer T.5/real-sign-symbol,
T.5/tame-kernel-sequence; ArithmeticKTheory N.6/order-certificate). -/

/- The former `N.8/birch-tate-status` is deleted (RT-AREA-ktheory-1/11): the status of the
Birch–Tate formula is SpecialValuesBirchTate's, and what an example may claim is the labelling rule
of `N.8/certified-example-format`. -/

end TauCeti.ArithKTheory

/- Review REV-FIX-RT-AREA-ktheory-1: neither example currently supplies its
span proof. For ℚ(√5), the two sign characters establish the lower bound 4.
Export to B.3 is conditional on an independent generation proof. -/
