/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.7.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-ArithmeticKTheory--N.7 (stages N.7 and N.8): prototype,
implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The file imports Mathlib only. Round three replaces the auxiliary cyclotomic
route by direct Tate descent for ℚ(√5), with a norm-thirty-three cutoff and
eleven exact finite residue-step certificates in the packet. These are planned
proofs; no implementation or independent acceptance is claimed. The current
negative review and its history are preserved pending independent review.
Unavailable imports, heavy constructions and their APIs/tests are mathematical
comments with exact suppliers. In particular no data definition is supplied by
`sorry` in place of N.4's unavailable w-invariant.

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
decomposition, and the higher K-groups used below.

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

/-- ArithmeticKTheory:N.7/bernoulli-conventions: this roadmap's convention is Mathlib's `bernoulli`
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

/- ArithmeticKTheory:N.7/w-invariant — README target: import N.4/the-w-invariant and its finiteness; twist supplier MotivicEtaleKTheory M.1. No substitute data declaration.
For a number field F and a positive integer i, import N.4/the-w-invariant and N.4/finiteness-of-the-w-invariant: w_i(F) is the largest integer m such that the absolute Galois group acts trivially on the i-th Tate twist of the m-th roots of unity; equivalently, w_i(F)=#H⁰(F,ℚ/ℤ(i)), using N.4’s compatible system of finite Tate twists. Over the rationals it is 2 for odd i, and for i = 2k it is the DENOMINATOR of B_{2k}/4k in the arithmetic convention (the source's 'B_k/4k' with its topologists' B_k); so w_2(Q) = 24 and w_4(Q) = 240; a prime divides w_i(Q) exactly when it is one more than a divisor of i. The invariant is what the torsion of the odd K-groups of a ring of integers is measured by, so it is the arithmetic half of the connection between Bernoulli numbers and K-theory that this layer exists to make precise.

Planning API:
wInvariant: Reuse TauCeti.wInvariant from N.4/the-w-invariant; no new data declaration.
wInvariant_even: For a number field F and positive weight i, 2 divides N.4’s w_i(F).
wInvariant_odd_rat: Over the rationals it is two for odd i.
wInvariant_even_rat: Over the rationals, for k ≥ 1, w_{2k}(Q) = the denominator of bernoulli (2k) / 4k.
wInvariant_prime_divides: For every positive i and prime l, l divides w_i(ℚ) if and only if l−1 divides i.
wInvariant_two_rat: Its value at i = 2 over the rationals is 24.

Planning tests:
w_two_rat: w_2(Q) = 24 = denominator of (1/6)/4.
w_odd: For odd i, w_i(Q) = 2.
w_gaussian: w_2(Q(i)) = 24.
prime_divisibility: 7 divides w_6(Q) = 504, since 6 is divisible by 6.
w_four_rat: w_4(Q) = 240 = denominator of bernoulli 4 / 8 = −1/240; the unconverted formula with bernoulli 2 = 1/6 would give 48.
-/

/-- ArithmeticKTheory:N.7/regular-prime: `p` is irregular when it divides the class number of the
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

/-- ArithmeticKTheory:N.7/kummer-criterion: an odd prime `p` is irregular exactly when it divides the
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

Round-three span proofs: Tate's norm filtration and criterion give the Gaussian
vanishing. For ℚ(√5), golden-congruence-lattices and golden-residue-section
construct small fractions of earlier S-units; golden-large-prime-cutoff proves
bijectivity for norm>33, and golden-finite-prime-certificates supplies all eleven
remaining steps. Descent gives generation by ordinary unit symbols. The
arithmetic of the field is imported from NumberFieldArithmetic and current
Tau Ceti, never re-planned here. -/

/-! ### `ArithmeticKTheory:N.8/certified-example-format` (definition) -/

/- ArithmeticKTheory:N.8/certified-example-format — README target: needs N.4’s genuine w-values, N.6/order-certificate and K₂ from K2SymbolsBrauer T.1/T.5. No substitute data declaration.
A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field, namely its degree, its signature, its class number, its unit rank and the invariants w_i, each with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE (or, for an even K-group, an order certificate) in the format of ArithmeticKTheory N.6/order-certificate, that is a finite presentation with a proof that its generators span (the upper bound) and an independent lower bound — a surjection onto a group of the presented order, from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from a complete kernel argument — so that an upper bound and a surjection are never reported as an isomorphism; and an explicit LABELLING of every number that is deduced rather than computed. The last is the rule the layer's text insists on: an order obtained from the Birch-Tate formula is a valid corollary of that formula and is labelled as one, it may not then be used as the independent test of the formula, and it may not supply either bound of a certificate that SpecialValuesBirchTate B.3 uses as that test (RT-AREA-ktheory-1/11).

Planning API:
ArithmeticData: For a number field F: natural-number fields degree, realPlaceCount, complexPlaceCount, classNumber and unitRank, and a natural-number wValue(i) for each positive i. Each field has an equality proof to its actual Mathlib invariant or the imported N.4 w_i(F); require realPlaceCount+2·complexPlaceCount=degree and unitRank=realPlaceCount+complexPlaceCount−1.
CertifiedExample: A number field F, its ArithmeticData, N.6’s order certificate for its actual tame kernel, tags for every numerical claim, and a provenance graph naming the suppliers of both certificate bounds. The certificate contains a finite presentation, relations verified in K₂(O_F), a surjective generator map (span), and an independent finite quotient of the same order (lower bound).
CertifiedExample.tag: The tag of a numerical claim: computed, imported or deduced.
CertifiedExample.no_circularity: Neither certificate bound has a provenance path from the Birch–Tate formula. A claim tagged as deduced from that formula cannot be evidence for that formula.
CertifiedExample.admissible: The arithmetic data, explicit upper bound and numerical provenance make an example admissible as an upper-bound report; it is certified only when the independent lower bound has matching order.

Planning tests:
deduced_not_evidence: An order deduced from Birch-Tate cannot be listed as a test of Birch-Tate.
upper_bound_only: Without the lower bound (or a complete kernel argument) the example reports an upper bound, not an order.
rationals_admissible: The rational example is admissible: its three numbers are known independently.
data_from_libraries: Each arithmetic-data field must equal its named Mathlib or N.4 supplier; replacing the golden-field degree2 by degree3 fails its equality proof. Current NumberFieldArithmetic supplies that field’s completed arithmetic, rather than a new local development.
gaussian_certified: The Gaussian example is certified: no generators, span by N.8/gaussian-tame-kernel-vanishes, lower bound onto the trivial group; its tame-kernel order 1 is tagged computed.
sqrt_five_certified: The ℚ(√5) example is certified: generators {−1, −1}, {−1, ε} with relations 2g = 0, span by N.8/real-quadratic-upper-generation, lower bound the two sign symbols onto (ℤˣ)²; its order 4 is tagged computed, and the Birch–Tate identity 1/30 = 4/120 is tagged as B.3's test of it.
-/

/- ArithmeticData fields: degree, realPlaceCount, complexPlaceCount, classNumber,
unitRank, and positive-index w-values, each accompanied by equality to the actual
Mathlib arithmetic invariant or imported N.4 invariant. No arbitrary proposition
or unexplained value can certify them.
CertifiedExample fields: a number field and its certified ArithmeticData; an
N.6/order-certificate for its actual tame kernel (finite presentation, relations,
span proof, and independent finite lower-bound quotient with equal cardinality);
a computed/imported/deduced tag for each result; and a provenance graph with
source/owner information for its two bounds. Admissibility allows a labelled upper-bound report. Certification requires both
bounds independently supplied, with matching cardinality and neither depending on Birch–Tate. Its
no_circularity API rejects a path from Birch–Tate to either certificate bound.
The Gaussian presentation has no generators, with span from
gaussian-tame-kernel-vanishes. The golden presentation has generators {−1,−1}
and {−1,ε}, exponent-two relations and span from real-quadratic-upper-generation;
its independent sign quotient sends them to (−1,−1) and (1,−1).
-/

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
subgroup generated by the symbols of units. Sources: Bass–Tate (1973), Appendix Proposition 1, pp. 430–431
(volume PDF 440–441); II §3, Lemma 3.4, Claim 2, pp. 410–411
(volume PDF 420–421). In (b), J=(a−b)v⁻¹ is integral with norm<Nv;
this gives (a−b)/π∈U even when the localized generator π is not globally integral. -/

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

/- ArithmeticKTheory:N.8/golden-congruence-lattices — planning target; the heavy construction and K₂ quotient are not declared here. Suppliers: tate-norm-filtration, tate-criterion, NumberFieldArithmetic Layers 3/7 and K2SymbolsBrauer T.2/T.3/T.5. See the reader for the proof and sources.
Let F = ℚ(√5), O = ℤ[ε], ε = (1+√5)/2, and σ₁,σ₂ its real embeddings. Put d = 2√5/π and B_t = {(z₁,z₂) ∈ ℝ² : (z₁²+z₂²)/2 ≤ t}. For a prime v of norm q, s ∈ {2,3}, and a₁,…,a_{s−1} ∈ k(v)×, define L(a) ⊆ O^s by x_j mod v = a_j (x_s mod v). Its real-embedding covolume is 5^(s/2) q^(s−1). If t > 0 and t^s ≥ d^s q^(s−1), then for every positive diagonal stretch ξ with determinant one there is a nonzero tuple of L(a) with all coordinates in ξB_t. If also t < q, every coordinate is nonzero and belongs to the preceding S-unit group U.

Planning API:
GoldenCongruenceLattice: For s=2 or 3 and specified nonzero residues, the kernel L(a) of the displayed congruence map, embedded in (ℝ²)^s.
GoldenCongruenceLattice.covolume: covolume L(a) = 5^(s/2) q^(s−1).
GoldenCongruenceLattice.smallTuple: For t>0, t^s ≥ d^s q^(s−1), and a positive determinant-one stretch, a nonzero tuple in the product of stretched B_t.
GoldenCongruenceLattice.oldUnits: When t<q every coordinate of the small tuple is a nonzero preceding S-unit.

Planning tests:
golden_lattice_two: For s=2, covolume is 5q and the volume condition is t² ≥ d²q.
golden_lattice_three: For s=3, covolume is 5√5 q² and the volume condition is t³ ≥ d³q²; replacing q² by q would fail the kernel-index calculation.
golden_lattice_stretch: The stretch diag(2,1/2) preserves covolume and |z₁z₂|; smallTuple still gives |N(x_j)|≤t.
golden_lattice_boundary: At v=(2), q=4, s=2 and t=q, the tuple (2,2) lies in L(1) and in B_4² but its coordinates have zero residue and are not preceding S-units. The strict inequality t<q is essential.
-/

/- ArithmeticKTheory:N.8/golden-residue-section — planning target; the heavy construction and K₂ quotient are not declared here. Suppliers: tate-norm-filtration, tate-criterion, NumberFieldArithmetic Layers 3/7 and K2SymbolsBrauer T.2/T.3/T.5. See the reader for the proof and sources.
For a prime v of F=ℚ(√5) with q=Nv > 4d², let U be the preceding S-units, choose a global generator π_v of v, and put U₁=⟨(1+π_v U)∩U⟩. Reduction induces β̄:U/U₁→k(v)×. For a∈k(v)× choose integral x,y∈U with residue x/y=a and x,y∈B_t, t=d√q. Define γ(a)=[x/y]∈U/U₁. This is independent of the choice and remains the same if the same determinant-one stretch is applied to x and y. Moreover β̄γ=id. More generally small fractions in ξB_t and ξ′B_t′ of equal residue represent the same class whenever 4tt′<q².

Planning API:
GoldenResidueSection: The map a↦[x/y] defined by a small integral old-unit fraction in B_(d√q).
GoldenResidueSection.independent: Any two such choices, with arbitrary common determinant-one stretches on the two entries of each fraction, give the same class.
GoldenResidueSection.compare: Equal-residue fractions with parameters t,t′ and 4tt′<q² give the same class in U/U₁.
GoldenResidueSection.reduction: β̄∘γ=id on k(v)×.
GoldenResidueSection.one: γ(1)=1.

Planning tests:
golden_section_one: For every q>4d², the witness x=y=1 gives γ(1)=1.
golden_section_zero_difference: Comparing x/y with itself gives determinant xy−xy=0 and equality of classes without dividing by that zero difference.
golden_section_stretched: For q>4d², the fractions obtained with ξ=diag(2,1/2) and ξ′=id for the same residue have equal classes.
golden_section_not_representative: At v=(2), the integral old unit ε has residue of order 3; choosing its residue representative supplies neither the other residues nor multiplicativity. Those require smallTuple and the separate denominator-triple argument.
-/

/- ArithmeticKTheory:N.8/golden-large-prime-cutoff — planning target; the heavy construction and K₂ quotient are not declared here. Suppliers: tate-norm-filtration, tate-criterion, NumberFieldArithmetic Layers 3/7 and K2SymbolsBrauer T.2/T.3/T.5. See the reader for the proof and sources.
For every prime v of ℚ(√5) with q=Nv>33, β̄:U/U₁→k(v)× is an isomorphism, with inverse γ. Consequently the graded tame residue is an isomorphism at v, and every unramified element of K₂(F) lies in the symbol subgroup generated by S-units for primes of norm at most 33.
-/

/- ArithmeticKTheory:N.8/golden-finite-prime-certificates — planning target; the heavy construction and K₂ quotient are not declared here. Suppliers: tate-norm-filtration, tate-criterion, NumberFieldArithmetic Layers 3/7 and K2SymbolsBrauer T.2/T.3/T.5. See the reader for the proof and sources.
The certificateData of this node specifies the eleven primes of O=ℤ[ε] of norm≤33, in this order: (2) of norm4, (−1+2ε) of norm5, (3) of norm9; then (3+ε),(4−ε) of norm11, (4+ε),(5−ε) of norm19, (5+ε),(6−ε) of norm29 and (5+2ε),(7−2ε) of norm31. For each step its oldUnitGenerators are −1,ε and exactly the preceding listed prime generators. The data gives residues generating k(v)×, unit-kernel witnesses, selected maximal minors and their gcd q−1. They certify β̄:U/U₁≅k(v)× at each of these eleven steps.

Planning API:
GoldenFinitePrimeCertificate: At a named listed prime: its earlier generator list, residue images, relation vectors with exact factorizations a,b,(a−b)/π_v, and selected maximal minors.
GoldenFinitePrimeCertificate.verify: All exact factorization equalities, earlier support, residue generation, selected determinants and gcd=q−1 hold.
GoldenFinitePrimeCertificate.sound: A verified certificate gives U/U₁≅k(v)× and a bijective graded tame residue through α.
goldenFinitePrimeCertificates: The eleven data items stored here, with the specified order and cutoff 33.

Planning tests:
golden_finite_four: At (2), the residue of ε has order3; selected determinants 6 and −3 have gcd3=q−1, so the quotient has order3.
golden_finite_nine: At (3), the residue polynomial is irreducible and the certified quotient has order8, not the rational-prime unit order2.
golden_finite_tie: At the first norm11 prime, oldUnitGenerators contains no norm11 generator. At the second it contains exactly [3,1]. Supplying the second generator at the first step fails verify.
golden_finite_bad_minor: Changing the first certificate’s selected determinant −3 to −6 fails exact determinant recomputation; a larger common divisor alone would not prove the required index3.
-/

/- ArithmeticKTheory:N.8/real-quadratic-upper-generation — planning target; the heavy construction and K₂ quotient are not declared here. Suppliers: tate-norm-filtration, tate-criterion, NumberFieldArithmetic Layers 3/7 and K2SymbolsBrauer T.2/T.3/T.5. See the reader for the proof and sources.
For F=ℚ(√5) and ε=(1+√5)/2, the tame kernel K₂(O_F) is generated by {−1,−1} and {−1,ε}. Both generators have order dividing two, so its order is at most four. This follows from direct descent through every prime: the geometric cutoff for norm>33 and eleven exact finite unit-quotient certificates. No restriction to a cyclotomic extension, general two-torsion classification, ζ-value or Birch–Tate formula is used.
-/

/-- Arithmetic bound used by the direct norm-thirty-three cutoff. This is a
signature over actual pinned real numbers, not a K₂ stand-in. -/
theorem golden_cutoff_main_bound :
    16 * (2 * Real.sqrt 5 / Real.pi) ^ 2 < 33 := by
  sorry

/-- The common-denominator and inverse-generator comparisons have the strict
norm bounds needed to force earlier prime support. -/
example (q : ℝ) (hq : 33 < q) :
    let d := 2 * Real.sqrt 5 / Real.pi
    d * Real.sqrt q < q ∧
      d * q ^ ((2 : ℝ) / 3) < q ∧
      4 * (d * Real.sqrt q) * (d * q ^ ((2 : ℝ) / 3)) < q ^ 2 ∧
      4 * d * Real.sqrt q * q < q ^ 2 ∧ 20 * d * Real.sqrt q < q ^ 2 := by
  sorry

/- Imported field arithmetic (not new declarations): NumberFieldArithmetic's
ℚ(√5) example provides O=ℤ[ε], discr=5, signature(2,0), class number1,
units ±ε^n, and the splitting laws. Current Tau Ceti has these in namespace
TauCeti.NumberField.Sqrt5: adjoin_eq_top, discr_eq_five, nrRealPlaces_eq_two,
isPrincipalIdealRing, classNumber_eq_one, isPrime_map_span_two and
closure_sup_torsion_eq_top (Invariants.lean and Units.lean in
NumberTheory/NumberField/WorkedExamples/Sqrt5). Those current files postdate
the frozen build, so no nonexistent pinned module is imported here.
-/

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

/- Round-three correction: the earlier cyclotomic representative-generation gap
is bypassed by direct descent in ℚ(√5), not declared solved in Zhang–Xu's proof.
The finite data checks and the geometric proof are distinct obligations. Neither
certificate is inferred from a sign lower bound or a special value. -/
