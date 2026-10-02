# ArithmeticKTheory — N.7

The blueprint for the last two layers of the K-theory of number fields and S-integers: N.7, regular primes and Bernoulli numbers, and N.8, certified examples. Fifteen nodes written from one source, Weibel's K-book in the author-hosted draft of 29 August 2013, whose hash reproduces the one three other packets of this programme already record, so this is the same file they cite. The reviewed audit AUDIT-27 was read first. It records both layers as not built and the pinned index confirms it: Mathlib has the Bernoulli numbers in both conventions with the conversion lemma, cyclotomic extensions, class numbers, ramification and inertia, the unit rank, the places and the Dedekind zeta function, and Tau Ceti has an extensive quadratic-field development; but neither library defines a regular prime, neither mentions Vandiver, and no K-group above the zeroth exists in either. The audit also records three duplications for N.8, against SpecialValuesBirchTate B.3, K2SymbolsBrauer T.5 and K3BlochGroups V.5, and every computation those layers own is imported here with its owner named: the second K-group of the integers and of the rationals, the vanishing for a finite field, the third K-group of the integers and of the Gaussian rationals; the Birch–Tate check itself is B.3's, which imports N.8's certificate. What this packet owns is what is left: the convention discipline for the Bernoulli numbers, the invariant w_i and its value over the rationals, the definition of a regular prime with Kummer's criterion and the eigenspace decomposition, the vanishing of the l-primary tame kernel at an odd regular prime with the ramification argument that answers the S-integer question, the torsion consequences with their explicit degrees, Vandiver's conjecture kept separate from every unconditional statement, and for N.8 the format of a certified example, which instantiates ArithmeticKTheory N.6's certificate engine (independent upper and lower bounds) and carries the labelling rule that an order deduced from the Birch-Tate formula is a corollary and not a test of it; the certified examples N.8 keeps — K₂(ℤ[i]) = 0, the tame kernel of the real quadratic field ℚ(√5), exported to SpecialValuesBirchTate B.3 for its Birch–Tate check, and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree — while K₀(ℤ), K₁(ℤ), K₂(ℤ) and K₂(ℚ) are imported from KTheoryLowDegrees Z.6, U.6 and K2SymbolsBrauer T.5 (RT-AREA-ktheory-1/9, /11). Nothing is claimed to be formalised and every implementationStatus is unchecked. FIX-RT-BP-ArithmeticKTheory--N.7: honest signatures for available arithmetic carriers, exact supplier-labelled comments for unavailable K-theory and class-action interfaces, a separate residue-unit lemma, and the L3 Vandiver import contract. All prior source/certificate gaps and the needs_changes review are retained. Round2 FIX-RT-AREA-ktheory-1~2 expands the proof inputs described in the fix report, updates source-reading boundaries and retains precisely named supplier gaps. The revised plan awaits independent review; it is not a formalization.

FIX-RT-AREA-ktheory-1~2, issue #5541. Codex, session codex-5ebb6f, 2026-10-02. The five revised packets await independent review. Earlier review decisions are preserved as history. This document is the planning roadmap; the suggested Lean signatures remain unchecked and were not compiled.

This packet has 26 nodes, 39 API items, 30 unit-test obligations and 2 explicitly remaining gaps. A complete disposition of an assigned fix does not assert closure of the entire roadmap.

## Scope and pinned library inputs

`ArithmeticKTheory:N.7`, `ArithmeticKTheory:N.8`

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

- `mathlib:ClassGroup` — Mathlib/RingTheory/ClassGroup/Basic.lean. The class group of a Dedekind domain, whose eigenspace decomposition is what Herbrand-Ribet describes. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Ideal.inertiaDeg` — Mathlib/RingTheory/RamificationInertia/Inertia.lean. The inertia degree, as a definition; its value 1 at the prime above p in Q(ζ_p) is IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Ideal.ramificationIdx` — Mathlib/RingTheory/RamificationInertia/Ramification.lean. The ramification index, as a definition; its value p − 1 at the prime above p in Q(ζ_p) is IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:IsCyclotomicExtension` — Mathlib/NumberTheory/Cyclotomic/Basic.lean. Cyclotomic extensions, in which the class number defining regularity is taken. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:IsPrimitiveRoot` — Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean. Primitive roots of unity, needed for the cyclotomic field and for the trivialisation of a twist. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Nat.Prime` — Mathlib/Data/Nat/Prime/Defs.lean. Primality, the carrier of the regular-prime predicate. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField` — Mathlib/NumberTheory/NumberField/Basic.lean. Number fields, the setting of both layers. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` — Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean. The number of complex places, which is the rank in the structure theorem for the third K-group. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.InfinitePlace.nrRealPlaces` — Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean. The number of real places, which enters the structure theorem for the third K-group and the sign in the Birch-Tate formula. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.RingOfIntegers` — Mathlib/NumberTheory/NumberField/Basic.lean. The ring of integers of a number field. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.Units.rank` — Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean. The unit rank, part of the arithmetic data of a certified example. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.classNumber` — Mathlib/NumberTheory/NumberField/ClassNumber.lean. The class number of a number field, whose divisibility by p is the definition of an irregular prime. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.dedekindZeta` — Mathlib/NumberTheory/NumberField/DedekindZeta.lean. The Dedekind zeta function, whose value at minus one is one side of the Birch-Tate formula. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Polynomial.bernoulli` — Mathlib/NumberTheory/BernoulliPolynomials.lean. The Bernoulli polynomials, which carry the generating-series proofs the denominator statements rest on. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:ZMod` — Mathlib/Data/ZMod/Defs.lean. The cyclic rings, the coefficients of the eigenspace decomposition and the residue fields of the tame symbols. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli` — Mathlib/NumberTheory/Bernoulli.lean. The Bernoulli numbers in the arithmetic convention, with B_1 = -1/2; this roadmap's default, and the one every statement here names. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli'` — Mathlib/NumberTheory/Bernoulli.lean. The B_1 = +1/2 convention, equal to bernoulli away from index one. It is NOT the convention of the source, which uses the topologists' B_k = |B_{2k}|; it is imported only so that the conversion can be stated. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli'_one` — Mathlib/NumberTheory/Bernoulli.lean. The value of the first Bernoulli number in the other convention. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli_eq_bernoulli'_of_ne_one` — Mathlib/NumberTheory/Bernoulli.lean. The conversion: the two conventions agree at every index other than one. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli_one` — Mathlib/NumberTheory/Bernoulli.lean. The value of the first Bernoulli number in the arithmetic convention. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:rootsOfUnity` — Mathlib/RingTheory/RootsOfUnity/Basic.lean. The roots of unity of a ring, the carrier of the invariant w_i and of the twisted modules it is defined with. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Bernoulli.vonStaudt_clausen` — Mathlib/NumberTheory/Bernoulli.lean. B_{2k} + ∑_{p prime, (p−1) | 2k} 1/p is an integer (von Staudt–Clausen). Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Bernoulli.dvd_den_bernoulli` — Mathlib/NumberTheory/Bernoulli.lean. For k > 0 and (p − 1) | 2k, p divides the denominator of B_{2k}. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:Bernoulli.not_sq_dvd_den_bernoulli` — Mathlib/NumberTheory/Bernoulli.lean. For k > 0 and (p − 1) | 2k, p² does not divide the denominator of B_{2k}. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli_eq_zero_of_odd` — Mathlib/NumberTheory/Bernoulli.lean. bernoulli n = 0 for odd n > 1. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:bernoulli_two` — Mathlib/NumberTheory/Bernoulli.lean. bernoulli 2 = 1/6. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:CyclotomicField` — Mathlib/NumberTheory/Cyclotomic/Basic.lean. The n-th cyclotomic field over K, with a NumberField instance over ℚ. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'` — Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean. In the p-th cyclotomic field the prime (ζ − 1) has ramification index p − 1 over p. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'` — Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean. In the p-th cyclotomic field the prime (ζ − 1) has inertia degree 1 over p. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'` — Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean. Every prime of the ring of integers of the p-th cyclotomic field lying over p equals (ζ − 1): the prime above p is unique. Exact statement read at the Mathlib pin 082e2d37 by the reviewer on 2026-09-28.

- `mathlib:NumberField.maximalRealSubfield` — Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean. The intrinsic maximal real subfield; supplies the carrier in L3's imported Vandiver condition, not the conjecture. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:NumberField.of_subfield` — Mathlib/NumberTheory/NumberField/Basic.lean. A subfield of a number field is a number field, allowing its class number in the Vandiver import contract. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one` — Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean. For p prime and Q(mu_(p^(k+1))), the ideal (zeta−1) has absolute norm p. At k=0, after rewriting p^1=p, this computes the residue cardinality in Q(mu_p). Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:Ideal.absNorm_apply` — Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean. For an infinite finite-free integral ring, absolute ideal norm is the cardinality of its quotient, via Submodule.cardQuot. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:Submodule.cardQuot_apply` — Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean. The natural-number cardinality of the quotient is cardQuot; this identifies the actual ideal quotient cardinality, not a replacement carrier. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:Nat.card_units` — Mathlib/Algebra/GroupWithZero/Units/Fintype.lean. For a group with zero, Nat.card of its units is Nat.card of the carrier minus one; applies to the genuine quotient field. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:Ideal.Quotient.field` — Mathlib/RingTheory/Ideal/Quotient/Basic.lean. The quotient of a commutative ring by a maximal ideal has a Field structure; noncomputable abbrev, not an automatic instance. Exact declaration and its surrounding hypotheses read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 on 2026-10-01 (Codex — codex-a71f92).

- `mathlib:GaussianInt` — Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean. Gaussian integers as Zsqrtd(−1), with ring, Euclidean structure and the quotient/remainder norm calculation. The δ=1/√2 division bound is visible in norm_mod_lt’s separate coordinate half bounds; the K-theoretic cutoff is new. Definition and norm/remainder/Euclidean-instance proofs read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 on2026-10-02 by Codex — codex-5ebb6f.

- `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` — Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean. Compact symmetric convex-body Minkowski for a countable discrete additive lattice, finite-dimensional nontrivial real normed space, Haar measure and an actual additive fundamental domain; non-strict volume≥2^dimension times covolume. Statement and proof read at Mathlib082e2d37, lines85–140, 2026-10-02. The lattice, fundamental domain and covolume computations remain the explicit N.8 construction, not an existing golden-field specialization.

- `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` — TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean. For a squarefree integer d≡1 mod4 and integralθ generating a quadratic number field with minpoly X²−d, the half-generator(1+θ)/2 generates the ring of integers as a ℤ-algebra. Apply d=5. Declaration and proof read at Tau Ceti f790474, lines233–320, 2026-10-02; this is not an invented QuadraticFieldsAndIdeals roadmap import.

## Sources and actual reading coverage

### The K-book: An Introduction to Algebraic K-theory

Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013).

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)

SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Read scope.**

- Downloaded and hashed on 24 September 2026; the hash reproduces the one recorded by the packets of K2SymbolsBrauer, Polylogarithms and MotivesAndAlgebraicCycles, so this is the same file those cite.
- III.5.2.2 (PDF p. 222): the computation of the second K-group of the integers, cited by the source to Milnor's section 10, with the remark that the symbol of minus one with itself is the only non-trivial element of the kernel, and Tate's computations for the quadratic rings, including the vanishing for the Gaussian integers.
- III.6.1 to III.6.5.3 (PDF pp. 230 to 246): Matsumoto's theorem, the vanishing of the second K-group of a finite field with its proof, the leading-coefficient symbol, Steinberg symbols, the sign symbol at a real place, the Hilbert and norm residue symbols, Moore's theorem, the tame symbol with its proof, and the computation of the second K-group of the rationals with its splitting.
- VI.2.4 and VI.2.4.1 (PDF pp. 465 to 466): the denominator of the Bernoulli numbers, the value of the invariant w_i over the rationals in both parities, the definition of a regular and of an irregular prime, Iwasawa's equivalent form, the smallest irregular primes, Siegel's conjecture with the numerical evidence, Kummer's criterion and its consequence through Kummer's congruences.
- VI.5.3 (PDF p. 489): the structure theorem for the third K-group of a number field, in the totally imaginary case and in the case with a real place.
- VI.8.1 with Classical Data 8.1, VI.8.2 and VI.8.6 (PDF pp. 507 to 513): the finiteness and rank statements for the K-groups of a number field, the formulas in degrees zero and one for a ring of S-integers, the Brauer-group sequence, the localisation of the K-groups at a prime, and the Birch-Tate conjecture with its status and its worked rational instance.
- VI.10.1.1, VI.10.2, VI.10.5, VI.10.6, VI.10.8, VI.10.8.1 and VI.10.8.2 (PDF pp. 528 to 533): the table of the K-groups of the integers with its note on the groups in degrees divisible by four, the conditional table under Vandiver's conjecture, the vanishing of l-torsion in the even groups at an odd regular prime with the identification of the remaining torsion, the free-module structure of the mod-l K-theory with its generators and the worked case l = 5, Vandiver's conjecture in both forms with its verification bound, the Herbrand-Ribet theorem, and the historical remark.
- Not read: the chapters on the constructions of higher K-theory, the proofs of the etale descent theorems of chapter VI sections 6 to 9 beyond the statements cited, and the exercises.

### The Milnor ring of a global field, with Tate’s appendix

Hyman Bass and John Tate; appendix by John Tate. Published chapter in Algebraic K-theory II, Lecture Notes in Mathematics342 (1973), pp.349–446. The downloaded file is the entire536-page volume, not a standalone article..

[Source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf)

SHA-256: `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55`.

**Read scope.**

- ChapterII §3, own pp.56–60/PDF413–417, the S-unit filtration and Lemma3.2 proof; own pp.63–64/PDF420–421, Claim2 and its norm-congruence proof. AppendixA1–A8/PDF439–446, global-unit criterion, geometric bound and Gaussian computation, read in full. ImagesA5/PDF443 andA8/PDF446 verify the inequalities and three Gaussian relations. Other quadratic computations in A9–A18 are not used or claimed read.

### Bounds for computing the tame kernel

Richard P. Groenewegen. Mathematics of Computation73(247),2004,1443–1458; electronically published29July2003. Published16-page PDF read through the public indexed mirror; direct publisher and mirror downloads returned403, so no local PDF hash is asserted..

[Source](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/)

**Read scope.**

- §§1–8 through Theorem15, printed1443–1455, including the lattice, inverse-section, generator and denominator-trick proofs; Lemmas16–18 were inspected but are not used. The specialization below uses the ordinary density bound1, so does not invoke the unread Hlawka/Rogers packing refinements. The unread Lenstra6.2 generation input in§5 is avoided by explicitly proving the Qsqrt5 unit group.

## Declarations and proof obligations

### The two Bernoulli conventions, and the conversion between them

`ArithmeticKTheory:N.7/bernoulli-conventions` · definition · parent `ArithmeticKTheory:N.7` · implementation unchecked

Fix the ARITHMETIC convention: Mathlib's bernoulli, defined by the generating series t/(e^t − 1), so B_1 = −1/2, B_2 = 1/6 and B_n = 0 for odd n > 1. Mathlib's bernoulli' (B_1 = +1/2) differs from it only at index one (bernoulli_eq_bernoulli'_of_ne_one). The SOURCE uses neither: Weibel's K-book uses the topologists' numbers B_k^top = (−1)^(k+1) B_{2k} = |B_{2k}| (k ≥ 1), all positive, with B_1^top = 1/6, B_5^top = 5/66 and B_6^top = 691/2730. Every formula quoted from the source is therefore re-indexed here by k ↦ 2k: the source's B_k is the arithmetic B_{2k} up to sign. The denominator facts are von Staudt–Clausen, which the pinned Mathlib proves: for k ≥ 1 the denominator of B_{2k} is the product of the primes p with (p − 1) | 2k, hence squarefree and divisible by 6 (Bernoulli.vonStaudt_clausen, dvd_den_bernoulli, not_sq_dvd_den_bernoulli); and if (p − 1) ∤ 2k then p does not divide the denominator of B_{2k}/k even when p | k.

**Hypotheses.**

- k is a natural number; the numbers are rational.
- Both conventions are pinned in Mathlib, together with the lemma that they agree away from index one; this layer imports them and defines nothing new.
- The statement about the denominator is von Staudt-Clausen with the refinement the source records; the numerator has no such description, which is what makes the regular-prime story non-trivial.

**Proof outline.**

1. Import the two pinned definitions and the conversion lemma, and fix the arithmetic convention as this roadmap's default.
2. State the denominator facts as the source gives them, and record where each is proved in the pinned library.
3. Record the refinement: for p - 1 not dividing 2k, the prime p does not divide the denominator of B_k/k even if it divides k, the example being 5 dividing B_5.
4. Record that no statement of this roadmap may use a Bernoulli number without naming the convention, since the two differ exactly at the index the regular-prime criterion never uses but the topologists' formulas do.

**Acceptance.**

- B_1 is minus one half in the arithmetic convention and plus one half in the other, and the two agree elsewhere.
- The denominator of B_6 is 2730, which is the product of the primes p with p - 1 dividing 12, namely 2, 3, 5, 7 and 13.
- The numerator has no analogous description, and a formalisation that treats it as computable by a closed formula is wrong.

**Prerequisites.**

- `mathlib:bernoulli`
- `mathlib:bernoulli'`
- `mathlib:bernoulli_eq_bernoulli'_of_ne_one`
- `mathlib:bernoulli_one`
- `mathlib:bernoulli'_one`
- `mathlib:Polynomial.bernoulli`
- `mathlib:Bernoulli.vonStaudt_clausen`
- `mathlib:Bernoulli.dvd_den_bernoulli`
- `mathlib:Bernoulli.not_sq_dvd_den_bernoulli`
- `mathlib:bernoulli_eq_zero_of_odd`
- `mathlib:bernoulli_two`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `bernoulliArith` | data | The arithmetic Bernoulli numbers: Mathlib's bernoulli, used directly (no new definition). |
| `bernoulliTop` | data | The source's topologists' numbers, bernoulliTop k := (−1)^(k+1) * bernoulli (2k), a named translation used only when quoting Weibel. |
| `bernoulliTop_eq_abs` | characterisation | For k ≥ 1, bernoulliTop k = \|bernoulli (2k)\| > 0. |
| `bernoulli_convert` | compatibility | bernoulli n = bernoulli' n for n ≠ 1 (Mathlib's bernoulli_eq_bernoulli'_of_ne_one); bernoulli' is NOT the source's convention. |
| `bernoulli_one_arith` | simp | bernoulli 1 = −1/2 (Mathlib's bernoulli_one). |
| `bernoulli_denominator` | compatibility | For k ≥ 1, (bernoulli (2k)).den = ∏_{p prime, (p−1) \| 2k} p: von Staudt–Clausen with dvd_den_bernoulli and not_sq_dvd_den_bernoulli, all in the pinned Mathlib. |
| `bernoulli_denominator_squarefree` | compatibility | For k ≥ 1, (bernoulli (2k)).den is squarefree and divisible by 6 (2 and 3 always qualify). |

**Consumers.**

- N.7, the invariant w — w_{2k}(Q) is the denominator of B_{2k}/4k in the arithmetic convention (the source's B_k/4k), so the re-indexing must be fixed first.
- N.7, Kummer's criterion — The criterion concerns the numerators of B_2, B_4, …, B_{p−3} (the source's B_1, …, B_{(p−3)/2}).
- The Handbook comparison — Parts of the K-theory literature use the topologists' numbering; a translated statement says which one it is in.

**Unit tests.**

- `b_one` (computation) — bernoulli 1 = −1/2 and bernoulli' 1 = +1/2.
- `b_twelve_denominator` (computation) — The denominator of bernoulli 12 = −691/2730 is 2730 = 2·3·5·7·13, the source's 'B_6 = 691/2730'; the arithmetic bernoulli 6 = 1/42. A statement that read the source's B_6 as bernoulli 6 fails.
- `agree_away_from_one` (compatibility) — For every index other than one, bernoulli and bernoulli' agree.
- `five_divides_top_b_five` (non-example) — The source's B_5 = 5/66 is bernoulli 10: 5 divides it but not the numerator of bernoulli 10 / 5 = 1/66. The arithmetic bernoulli 5 is 0, so reading the source's example with the arithmetic index is vacuous.
- `top_not_primed` (non-example) — bernoulliTop 1 = 1/6 while bernoulli' 1 = 1/2: the source's convention is not Mathlib's bernoulli'.

**Sources.**

- `Kbook.2013`: VI.2, the paragraph 'Bernoulli numbers' before Lemma 2.4, printed p. 472 (PDF p. 480). The source's convention and its first values, verbatim; the node re-indexes them. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.2, same paragraph, printed p. 472 (PDF p. 480). The denominator facts, in the source's indexing (its B_k = arithmetic B_{2k}). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.2.4.1, printed p. 472 (PDF p. 480). The Kummer-congruence refinement and the example 5 | B_5 (arithmetic B_10 = 5/66). Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The invariant w_i(F), and its value over the rationals

`ArithmeticKTheory:N.7/w-invariant` · construction · parent `ArithmeticKTheory:N.7` · implementation unchecked

For a number field F and a positive integer i, the invariant w_i(F) is the largest integer m such that the absolute Galois group acts trivially on the i-th Tate twist of the m-th roots of unity; equivalently, the order of the group of roots of unity in the fixed field of that action. Over the rationals it is 2 for odd i, and for i = 2k it is the DENOMINATOR of B_{2k}/4k in the arithmetic convention (the source's 'B_k/4k' with its topologists' B_k); so w_2(Q) = 24 and w_4(Q) = 240; a prime divides w_i(Q) exactly when it is one more than a divisor of i. The invariant is what the torsion of the odd K-groups of a ring of integers is measured by, so it is the arithmetic half of the connection between Bernoulli numbers and K-theory that this layer exists to make precise.

**Hypotheses.**

- F is a number field; i is a positive integer; the Bernoulli numbers are in the arithmetic convention of the previous node.
- The twisted module of roots of unity is the one K2SymbolsBrauer T.7 constructs; neither pinned library has it, and this layer imports it rather than building a second one.
- The statement over the rationals is a theorem about the denominator, not a definition.

**Proof outline.**

1. Define the invariant by the largest-m characterisation and prove that the maximum exists, using that the Galois action on the roots of unity of order m factors through a finite quotient.
2. Prove the elementary properties: the invariant is even, it is divisible by the order of the roots of unity in F, and it is multiplicative in the evident sense under a field extension only up to the stated index.
3. Prove the value 2 for odd i over the rationals, which is the source's earlier computation.
4. Prove the value for even i over the rationals: the invariant is the denominator of B_k/4k, and a prime divides it exactly when one less than the prime divides i.
5. Record the two places where the invariant is used: the order of the torsion of the odd K-groups, and the Birch-Tate formula of N.8.

**Acceptance.**

- Over the rationals the invariant at i = 2 is 24, which is the denominator of B_1/8 in the arithmetic convention and is the number that appears in the Birch-Tate formula.
- For odd i over the rationals the invariant is 2, so the odd twists contribute only two-torsion.
- For the Gaussian rationals the invariant at i = 2 is again 24, which is what makes the third K-group of that field have a cyclic summand of order 24.

**Prerequisites.**

- `ArithmeticKTheory:N.7/bernoulli-conventions`
- `K2SymbolsBrauer:T.7`
- `mathlib:rootsOfUnity`
- `mathlib:IsPrimitiveRoot`
- `mathlib:NumberField`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `wInvariant` | data | The invariant w_i(F). |
| `wInvariant_even` | characterisation | The invariant is even. |
| `wInvariant_odd_rat` | example | Over the rationals it is two for odd i. |
| `wInvariant_even_rat` | characterisation | Over the rationals, for k ≥ 1, w_{2k}(Q) = the denominator of bernoulli (2k) / 4k. |
| `wInvariant_prime_divides` | characterisation | A prime divides it exactly when one less than the prime divides i. |
| `wInvariant_two_rat` | example | Its value at i = 2 over the rationals is 24. |

**Consumers.**

- N.8, the Birch-Tate example — The formula is the quotient of the order of the tame kernel by this invariant, so the worked example needs its value.
- N.7, the torsion consequences — The Harris-Segal torsion of the odd K-groups has order this invariant.
- K3BlochGroups V.5 — The third K-group of a number field has a cyclic summand of order this invariant at i = 2, which is the computation that packet carries.

**Unit tests.**

- `w_two_rat` (computation) — w_2(Q) = 24 = denominator of (1/6)/4.
- `w_odd` (computation) — For odd i, w_i(Q) = 2.
- `w_gaussian` (computation) — w_2(Q(i)) = 24.
- `prime_divisibility` (computation) — 7 divides w_6(Q) = 504, since 6 is divisible by 6.
- `w_four_rat` (non-example) — w_4(Q) = 240 = denominator of bernoulli 4 / 8 = −1/240; the unconverted formula with bernoulli 2 = 1/6 would give 48.

**Sources.**

- `Kbook.2013`: VI.2.4 (Lemma 2.4) and the recall of 2.1.2 before it, printed p. 472 (PDF p. 480). The value over the rationals, verbatim, in the source's indexing. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Regular and irregular primes

`ArithmeticKTheory:N.7/regular-prime` · definition · parent `ArithmeticKTheory:N.7` · implementation unchecked

A prime p is IRREGULAR when it divides the class number of the p-th cyclotomic field, that is the order of the Picard group of the ring of integers of the field obtained by adjoining a primitive p-th root of unity; otherwise p is REGULAR. Iwasawa's equivalent form concerns the whole cyclotomic tower: p is regular exactly when, for every ν ≥ 1, the Picard group of the ring of integers of Q(μ_{p^ν}) has no p-torsion. The smallest irregular primes are 37, 59, 67, 101, 103, 131 and 149, and Siegel conjectured that asymptotically about 39 per cent of primes are irregular, a proportion the numerical evidence up to four million matches. The definition is about the class number and nothing else: no statement of this roadmap may fold Vandiver's conjecture, or any other class-group hypothesis, into the word regular.

**Hypotheses.**

- p is a prime; the cyclotomic field is the one obtained by adjoining a primitive p-th root of unity, and the Picard group is that of its ring of integers.
- Mathlib has the cyclotomic extension, the ring of integers and the class number, so the definition is a composition of pinned objects; what it does not have is the word, which neither library defines.
- Iwasawa's equivalent form is quoted from the source and is not proved here.

**Proof outline.**

1. Define irregularity as divisibility of the class number of the cyclotomic field by the prime, using the pinned class number.
2. Define regularity as its negation and record that it is decidable for a given prime once the class number is computed.
3. Record Iwasawa's equivalent form, that regularity is the absence of p-power torsion in the Picard group, as a quoted statement.
4. Record the list of the smallest irregular primes and the statistical expectation, both as data with the source named.
5. State the discipline the layer's text demands: regularity is this property and nothing more, and any theorem that needs Vandiver's conjecture or another class-group hypothesis states it separately.

**Acceptance.**

- The first irregular prime is 37, so every prime below it is regular; this is the smallest instance of the definition.
- Regularity is not the same as the absence of torsion in the class group of the real subfield, which is Vandiver's conjecture and is a separate statement.
- The definition is decidable for a given prime, which is what makes the certified examples of N.8 possible.

**Prerequisites.**

- `ArithmeticKTheory:N.7/bernoulli-conventions`
- `mathlib:NumberField.classNumber`
- `mathlib:IsCyclotomicExtension`
- `mathlib:ClassGroup`
- `mathlib:NumberField.RingOfIntegers`
- `mathlib:Nat.Prime`
- `mathlib:CyclotomicField`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `IsRegularPrime` | data | The predicate on a prime. |
| `IsRegularPrime.iff_not_dvd_classNumber` | characterisation | The definition: the prime does not divide the class number of the cyclotomic field. |
| `IsRegularPrime.iwasawa` | characterisation | p is regular iff for all ν ≥ 1, p does not divide the class number of Q(μ_{p^ν}). |
| `IsRegularPrime.decidable` | instance | Decidability for a given prime, once the class number is known. |
| `not_isRegularPrime_37` | example | The prime 37 is irregular. |
| `isRegularPrime_of_lt_37` | example | Every prime below 37 is regular. |

**Consumers.**

- N.7, Kummer's criterion — The criterion is an equivalent condition on Bernoulli numerators for exactly this predicate.
- N.7, the tame kernel theorem — The vanishing theorem is stated for an odd regular prime.
- N.8 — The certified examples are stated for explicit primes, and regularity is checked there.

**Unit tests.**

- `thirty_seven_irregular` (computation) — The prime 37 is irregular, so the predicate fails there.
- `small_primes_regular` (computation) — Every prime below 37 is regular.
- `not_vandiver` (non-example) — The predicate is about the full cyclotomic class number, not about the real subfield; a definition that used the real subfield would be Vandiver’s condition and is a different predicate.
- `decidable_instance` (degenerate) — For a given prime the predicate is decidable once the class number is computed.

**Sources.**

- `Kbook.2013`: VI.2.4.1 (Example 2.4.1, Irregular Primes), printed p. 472 (PDF p. 480). The definition, Iwasawa's equivalent form and the list, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Kummer's criterion, and what the numerators can be

`ArithmeticKTheory:N.7/kummer-criterion` · theorem · parent `ArithmeticKTheory:N.7` · implementation unchecked

An odd prime p is irregular exactly when it divides the numerator of one of the Bernoulli numbers B_2, B_4, …, B_{p−3} (arithmetic convention; the source's B_k with k ≤ (p−3)/2). Consequently, by Kummer's congruences, a regular prime divides the numerator of no B_{2k}/k: only irregular primes can. The criterion converts a class-number condition into a finite arithmetic check, which is what makes the regularity of a given prime decidable in practice and what ties this layer's two halves together.

**Hypotheses.**

- p is an odd prime; the Bernoulli numbers are in the arithmetic convention, where the criterion is insensitive to the convention because it concerns even indices only.
- The source states the criterion and attributes it to Kummer, referring to Washington's book for the proof; that book was not obtained and the criterion is not proved here.
- The bound on k is (p-3)/2 and is part of the statement, since it is what makes the check finite.

**Proof outline.**

1. State the criterion with its bound.
2. Record the direction that is used in practice: to certify that a prime is regular it suffices to check that it divides no numerator in the finite range.
3. Record the consequence through Kummer's congruences: a prime divides the numerator of B_k/k only if it is irregular, and the example that 5 divides the source's B_5 = B_10 = 5/66 but not the numerator of B_10/5.
4. Record the status: the criterion is quoted from the source, which cites Washington for the proof, and this packet does the same and records the gap.
5. Record the historical use the source records, Kummer's proof of the first case of Fermat's Last Theorem for regular exponents, as context and not as a target of this roadmap.

**Acceptance.**

- For p = 37 the criterion is satisfied at B_32 (the source's k = 16), which is why 37 is the first irregular prime; the source records the same fact from the K-theoretic side.
- For a prime below 37 the finite check finds no numerator divisibility, which certifies regularity.
- The criterion is an equivalence, so it may be used in both directions, but the proof is imported in both.

**Prerequisites.**

- `ArithmeticKTheory:N.7/regular-prime`
- `ArithmeticKTheory:N.7/bernoulli-conventions`

**Sources.**

- `Kbook.2013`: VI.2.4.1, printed p. 472 (PDF p. 480). The criterion and its consequence, verbatim, in the source's indexing, with its reference for the proof. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.2.4.1, the historical remark, printed p. 472 (PDF p. 480). The context, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Character eigenspaces of the cyclotomic class group, and the Herbrand-Ribet theorem

`ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet` · theorem · parent `ArithmeticKTheory:N.7` · implementation unchecked

Let l be an odd prime, G the Galois group of the l-th cyclotomic field over the rationals, which is cyclic of order l-1, and P the Picard group of the ring of integers with the prime inverted, modulo l. Since l-1 is invertible modulo l, the group algebra of G over the field with l elements splits into the eigenspaces of the powers of the cyclotomic character, and P decomposes accordingly. The Herbrand-Ribet theorem identifies the eigenspaces that can be non-zero: for 1 ≤ k ≤ (l−3)/2, l divides the numerator of B_{2k} (arithmetic convention; the source's B_k) exactly when the eigenspace of index l−2k is non-zero. Among irregular primes below four thousand this happens for at most three values of k. The projectors are the usual idempotents of the group algebra, and their denominators are exactly the factor l-1, which is invertible; a statement that uses them must say so, since over the integers they do not exist.

**Hypotheses.**

- l is an odd prime; the base field is the l-th cyclotomic field; the coefficients are the field with l elements.
- The projectors require the inverse of l-1 and therefore do not exist integrally; every statement using them carries that restriction, which is the denominator restriction the layer's text demands.
- The Herbrand-Ribet theorem is quoted from the source, which cites the original papers; it is not proved here.

**Proof outline.**

1. Construct the idempotents of the group algebra attached to the powers of the cyclotomic character, and record the denominator l-1 and its invertibility modulo l.
2. Decompose the modulo-l Picard group into eigenspaces and prove that the decomposition is natural in the module.
3. State the Herbrand-Ribet theorem in the form the source gives: divisibility of the numerator of B_{2k} by l is equivalent to non-vanishing of the eigenspace of index l-2k.
4. Record the numerical statement: among irregular primes below four thousand at most three values of k occur.
5. Record how the eigenspace decomposition connects to the definition of regularity: the prime is regular exactly when every eigenspace vanishes, which is the class-number condition.

**Acceptance.**

- For a regular prime every eigenspace vanishes, which is the class-number condition of the definition.
- For l = 37 exactly one eigenspace is non-zero, at index 37 − 32 = 5, attached to B_32 (the source's k = 16), which the source records.
- The projectors are not available over the integers, so an integral statement that used them would be wrong; the restriction is part of the statement.

**Prerequisites.**

- `ArithmeticKTheory:N.7/regular-prime`
- `ArithmeticKTheory:N.7/kummer-criterion`
- `mathlib:ZMod`
- `mathlib:IsCyclotomicExtension`
- `mathlib:ClassGroup`

**Sources.**

- `Kbook.2013`: VI.10.8.1 (Remark 10.8.1), printed p. 532 (PDF p. 540). The theorem and the numerical remark, verbatim, in the source's indexing. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.4.2 (Example 10.4.2), printed p. 530 (PDF p. 538). The eigenspace bookkeeping, verbatim; the packet had cited it as 10.4.1. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The residue field above a cyclotomic prime has prime-to-l unit order

`ArithmeticKTheory:N.7/residue-field-units-prime-to-l` · lemma · parent `ArithmeticKTheory:N.7` · implementation unchecked

Let l be a prime, F = Q(mu_l), and P a maximal ideal of its ring of integers lying over (l) in Z. Then the actual quotient field k(P) = O_F/P has l elements, its multiplicative unit group has l−1 elements, and l does not divide that order. No regularity or oddness is assumed.

**Hypotheses.**

- l is prime (including l=2); F is the l-th cyclotomic field over Q.
- P is maximal in O_F and lies over the ideal (l) of Z; the quotient is the genuine ideal quotient, with its field structure.
- The theorem is arithmetic and independent of tame-kernel or higher K-theory vanishing.

**Proof outline.**

1. Use the pinned uniqueness theorem to identify P with (zeta−1), for a primitive l-th root. The previously cited inertia degree is one.
2. Use IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one at k=0, rewriting l^1=l, to obtain absolute norm l. Ideal.absNorm_apply and Submodule.cardQuot_apply identify this norm with the natural-number cardinality of O_F/P.
3. Install Ideal.Quotient.field P locally and apply Nat.card_units to get unit order l−1.
4. Since l≥2, 0<l−1<l; elementary divisibility implies l does not divide l−1. No K-theoretic input is used.

**Acceptance.**

- For l=2, the quotient has two elements and the unit group has order one.
- For l=5, the quotient has five elements and the unit group has order four.
- Removing regularity does not change the result; a supposed proof importing regular-prime K-theory is circular for its intended use.

**Prerequisites.**

- `mathlib:CyclotomicField`
- `mathlib:NumberField.RingOfIntegers`
- `mathlib:Nat.Prime`
- `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`
- `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`
- `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`
- `mathlib:Ideal.absNorm_apply`
- `mathlib:Submodule.cardQuot_apply`
- `mathlib:Ideal.Quotient.field`
- `mathlib:Nat.card_units`

**Sources.**

- `Kbook.2013`: VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522); cyclotomic prime arithmetic in the pinned Mathlib declarations listed as prerequisites. The book supplies the single-prime localisation used by the tame-kernel application. The elementary residue-field/unit-order lemma is derived from the pinned cyclotomic norm and quotient-cardinality declarations, not attributed as a separately stated theorem of the book.

### For an odd regular prime the l-primary tame kernel of the cyclotomic field vanishes

`ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime` · theorem · parent `ArithmeticKTheory:N.7` · implementation unchecked

Let l be an odd regular prime and F the l-th cyclotomic field. Then the l-primary part of the tame kernel of F, that is of the second K-group of its ring of integers, vanishes. The proof combines three inputs: Tate's comparison, which identifies the second K-group modulo l with a Galois cohomology group; the class-group input, which is that the Picard group of the ring of integers has no l-torsion, by definition of regularity; and the local Brauer calculation, which is the exact sequence computing the Brauer group of a ring of S-integers from the real places and the finite places in S. Moreover, inverting the unique prime above l introduces no l-primary residue-field-unit term: that prime is totally ramified with inertia degree one, so its residue field is the field with l elements, whose unit group has order l-1, which is prime to l.

**Hypotheses.**

- l is an odd regular prime; F is the l-th cyclotomic field; S is either empty or the singleton of the unique prime above l.
- Tate's comparison is imported from MotivicEtaleKTheory M.3 and the tame kernel and its exact sequence from K2SymbolsBrauer T.5; neither is reproved here.
- The ramification statement, that l has a unique prime above it with ramification index l-1 and inertia degree one, is pinned in Mathlib and is cited.

**Proof outline.**

1. State the tame-kernel sequence for F, importing it from K2SymbolsBrauer T.5, and localise it at l.
2. Apply Tate's comparison to identify the l-primary part of the second K-group modulo l with the Galois cohomology of the twice-twisted roots of unity.
3. Use regularity: the Picard group has no l-torsion, so the class-group contribution to that cohomology vanishes.
4. Use the local Brauer calculation of the source's Classical Data to control the remaining contribution from the finite places.
5. Conclude the vanishing of the l-primary part.
6. For the S-integer version, use residue-field-units-prime-to-l: the unique prime above l has residue-unit order l−1, which is prime to l. Localisation therefore adds no l-primary residue term. This named arithmetic input is proved without K-theory and no longer hidden inside the vanishing application.

**Acceptance.**

- For l = 5 the statement says that the tame kernel of the fifth cyclotomic field has no 5-torsion.
- The residue-field remark is an elementary computation with the ramification data and does not need any K-theory; a proof that invoked a K-theoretic vanishing instead would be circular.
- For an irregular prime the argument breaks at the class-group step, which is exactly where the eigenspace analysis of the previous node takes over.

**Prerequisites.**

- `ArithmeticKTheory:N.7/regular-prime`
- `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`
- `K2SymbolsBrauer:T.5`
- `K2SymbolsBrauer:T.7`
- `MotivicEtaleKTheory:M.3`
- `mathlib:IsCyclotomicExtension`
- `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`
- `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`
- `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`
- `ArithmeticKTheory:N.7/residue-field-units-prime-to-l`

**Sources.**

- `Kbook.2013`: VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522). The statement itself, for all K_{2i}, with the three inputs (Pic, |S| = 1, Br = 0); the packet did not cite it. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.8.1 (Classical Data), (8.1.1), printed p. 513 (PDF p. 521). The Brauer sequence the argument uses. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The analogous statement over the integers. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Torsion in the K-groups at an odd regular prime

`ArithmeticKTheory:N.7/regular-prime-torsion-consequences` · theorem · parent `ArithmeticKTheory:N.7` · implementation unchecked

Let l be an odd regular prime. Then the even K-groups of the integers have no l-torsion, and the only l-torsion in the K-groups of the integers is the l-primary part Z/w_i(Q)_(l) of the Harris-Segal summand of the odd group K_{2i-1}, present exactly when i is divisible by l-1. With finite coefficients the statement is cleaner still: the mod-l K-theory of the integers with l inverted is a free graded module over the polynomial ring on β^(l-1), the (l-1)-st power of the Bott element, in degree 2l-2, with (l+3)/2 generators, namely the unit in degree zero, a class in degree 2l-3 and classes in the degrees 4k+1 for k from zero to (l-3)/2. The degrees and the character indices are part of the statement and may not be compressed.

**Hypotheses.**

- l is an odd regular prime; the ring is the integers, or the integers with l inverted for the statement with finite coefficients.
- The identification of the torsion as Harris-Segal summands is imported from the earlier parts of this roadmap, which own the etale descent computation.
- The free-module statement is the source's Theorem 10.6, stated for l odd and regular.

**Proof outline.**

1. State the vanishing of l-torsion in the even groups.
2. State the identification of the remaining l-torsion with the Harris-Segal summands, with the index condition that i is divisible by l-1.
3. State the free graded module structure with finite coefficients, with the explicit generator count and degrees.
4. Record the example the source gives for l = 5: the groups are eight-periodic with ranks 1, 1, 0, 0, 0, 1, 0, 1 in the degrees zero to seven, generated by a power of the Bott element times one of four explicit classes.
5. Record what is not claimed: nothing here is asserted at an irregular prime, where the module structure is not known and the eigenspace decomposition is the only available tool.

**Acceptance.**

- For l = 5 the explicit periodic structure is the source's worked example, and the generator in degree five is attached to the golden ratio.
- The count of generators is (l+3)/2, which for l = 5 is four, matching the four classes named.
- At an irregular prime none of these statements is asserted.

**Prerequisites.**

- `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`
- `ArithmeticKTheory:N.7/w-invariant`
- `K3BlochGroups:V.5`

**Sources.**

- `Kbook.2013`: VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The first two statements, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.6 (Theorem 10.6), printed p. 531 (PDF p. 539). The module statement, verbatim: the polynomial ring is on β^{ℓ−1}. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.6, the case ℓ = 5, printed p. 532 (PDF p. 540). The worked example, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### Vandiver's conjecture, and keeping the conditional results apart

`ArithmeticKTheory:N.7/vandiver-separation` · comparison · parent `ArithmeticKTheory:N.7` · implementation unchecked

Import Vandiver(l) from its single owner IntegralIwasawaTheory L3: for a prime l it is nondivisibility by l of the class number of Q(mu_l)^+, identified with the pinned maximal real subfield of CyclotomicField l Q. This node does not define a second predicate. Vandiver's conjecture asserts that for an irregular prime l the Picard group of the ring of integers of the maximal real subfield of the l-th cyclotomic field has no l-torsion; equivalently, that the representation of the Galois group on the modulo-l Picard group of the full cyclotomic field is a sum of odd twists of the roots of unity, which says that complex conjugation acts as minus one on the l-torsion. It has been verified for all primes up to a hundred and sixty-three million and is open. Under it, the K-groups of the integers are given by an explicit table, and in particular the groups K_{4i}(Z) with 4i ≥ 8 vanish (K_4(Z) = 0 is a theorem, of Rognes); unconditionally those higher groups are known only to have order a product of irregular primes greater than ten to the eighth, and their vanishing is equivalent to Vandiver's conjecture. Every statement of this roadmap that uses the conjecture says so in its hypotheses, and no definition of regularity contains it.

**Hypotheses.**

- l is an irregular prime; the real subfield is the fixed field of complex conjugation.
- The equivalence between the two forms of the conjecture uses that complex conjugation is the unique element of order two in the Galois group, which the source records.
- The conditional table is the source's Theorem 10.2 and is quoted as conditional.
- The predicate and its transport to the intrinsic maximal-real-subfield model are supplied by IntegralIwasawaTheory L3; the equivalence and conditional K-theory consequences, not that definition, are owned here.

**Proof outline.**

1. Import IntegralIwasawaTheory L3's predicate, whose exact contract is l not dividing the class number of the maximal real subfield of Q(mu_l). Prove the comparison to the odd-character condition on the full cyclotomic class group; do not introduce a second definition.
2. Record the verification bound and the historical remark that the statement was discussed by Kummer and Kronecker long before Vandiver.
3. State the conditional theorem: under the conjecture the K-groups of the integers are given by the explicit table.
4. State the unconditional order restriction for K_{4i}(Z), i≥2, and the equivalence of their joint vanishing with the global Vandiver conjecture at every odd prime. A hypothesis at one irregular prime is not the global conjecture; K_4(Z)=0 is an unconditional imported result.
5. State the discipline: a theorem conditional on the conjecture is labelled conditional, and the definition of a regular prime does not mention it.

**Acceptance.**

- The conjecture is open, and a formalisation that assumed it silently would make the conditional table look unconditional.
- The equivalence of the two forms is a statement about the action of complex conjugation and is proved, not assumed.
- The unconditional statement about the groups in degrees divisible by four is weaker and is what may be used without the conjecture.

**Prerequisites.**

- `ArithmeticKTheory:N.7/regular-prime`
- `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`
- `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`
- `IntegralIwasawaTheory:L3`
- `mathlib:NumberField.maximalRealSubfield`
- `mathlib:NumberField.of_subfield`

**Sources.**

- `Kbook.2013`: VI.10.8 (Vandiver's Conjecture 10.8), printed p. 532 (PDF p. 540). The conjecture and the equivalence, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.1, the paragraph before Table 10.1.1, printed p. 527 (PDF p. 535). The unconditional statement and the equivalence, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: VI.10.8.2 (Historical Remark 10.8.2), printed p. 532 (PDF p. 540). The historical remark, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### What a certified example is

`ArithmeticKTheory:N.8/certified-example-format` · definition · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field, namely its degree, its signature, its class number, its unit rank and the invariants w_i, each with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE (or, for an even K-group, an order certificate) in the format of ArithmeticKTheory N.6/order-certificate, that is a finite presentation with a proof that its generators span (the upper bound) and an independent lower bound — a surjection onto a group of the presented order, from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from a complete kernel argument — so that an upper bound and a surjection are never reported as an isomorphism; and an explicit LABELLING of every number that is deduced rather than computed. The last is the rule the layer's text insists on: an order obtained from the Birch-Tate formula is a valid corollary of that formula and is labelled as one, it may not then be used as the independent test of the formula, and it may not supply either bound of a certificate that SpecialValuesBirchTate B.3 uses as that test (RT-AREA-ktheory-1/11).

**Hypotheses.**

- F is a number field; the data are those of its ring of integers or of a ring of S-integers, as the example states.
- The certificate format is ArithmeticKTheory N.6's (RT-AREA-ktheory-1/9) and is not redefined here; the tame kernel and its exact sequences are K2SymbolsBrauer T.5's.
- The labelling rule is a condition on the example, not on the mathematics: the same equality may appear as a computation in one example and as a corollary in another, and the example says which.

**Proof outline.**

1. Define the record of arithmetic data with a field for each invariant and a proof obligation attached to it.
2. Import the order certificate of N.6/order-certificate and record which of its fields are present in a given example.
3. Define the labelling: each numerical claim carries a tag saying whether it is computed, imported or deduced, and from what.
4. State the circularity rule: a claim tagged as deduced from a formula may not be cited as evidence for that formula, and may not fill a bound of a certificate used to test it.
5. Record the minimum an example must contain to be admissible: the arithmetic data, at least an upper bound for the tame kernel, and the labelling; it is certified only with both bounds.

**Acceptance.**

- An example whose tame-kernel order is deduced from Birch-Tate is admissible and is labelled as a corollary; the same example may not then be listed as a test of Birch-Tate.
- An example with a surjective presentation and no completeness proof reports an upper bound, not an order.
- The arithmetic data half can be discharged from the pinned libraries for the small fields this layer uses, which is why those are the required first examples.

**Prerequisites.**

- `ArithmeticKTheory:N.6/order-certificate`
- `mathlib:NumberField.classNumber`
- `mathlib:NumberField.Units.rank`
- `mathlib:NumberField.InfinitePlace.nrRealPlaces`
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `ArithmeticData` | structure | Degree, signature, class number, unit rank and the invariants w_i, with their proofs. |
| `CertifiedExample` | structure | The arithmetic data, an order certificate in N.6's format (OrderCertificate) for the tame kernel, and the labelling. |
| `CertifiedExample.tag` | projection | The tag of a numerical claim: computed, imported or deduced. |
| `CertifiedExample.no_circularity` | characterisation | A claim tagged as deduced from a formula is not evidence for that formula. |
| `CertifiedExample.admissible` | characterisation | The minimum an example must contain. |

**Consumers.**

- N.8, every example — Each of the five required examples is an instance of this record.
- SpecialValuesBirchTate B.3 — B.3 imports N.8's certified examples, the real-quadratic tame kernel among them, as the independent input of its Birch–Tate check (atlas edge N.8 → B.3); the labelling is what keeps that check independent.
- ArithmeticKTheory N.6/order-certificate — The certificate half is N.6's format, imported here; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to.

**Unit tests.**

- `deduced_not_evidence` (non-example) — An order deduced from Birch-Tate cannot be listed as a test of Birch-Tate.
- `upper_bound_only` (degenerate) — Without the lower bound (or a complete kernel argument) the example reports an upper bound, not an order.
- `rationals_admissible` (computation) — The rational example is admissible: its three numbers are known independently.
- `data_from_libraries` (compatibility) — For the small fields used here the arithmetic data can be discharged from the pinned libraries.

**Sources.**

- `Kbook.2013`: VI.8.6, the worked case of the rationals, printed p. 515 (PDF p. 523). The shape of a certified example: three independently known numbers. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The first K-groups of the integers

`ArithmeticKTheory:N.8/k-groups-of-the-integers` · application · parent `ArithmeticKTheory:N.8` · implementation unchecked

The required first computation: the zeroth K-group of the integers is the integers, the first is cyclic of order two, the second is cyclic of order two generated by the symbol of minus one with itself, the third is cyclic of order forty-eight, and the fourth vanishes. None is computed here: K₀(ℤ) = ℤ is KTheoryLowDegrees Z.6's, K₁(ℤ) = {±1} is KTheoryLowDegrees U.6's, K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} is K2SymbolsBrauer T.5's (T.5/k2-of-the-integers, through Milnor's bound and the sign symbol), and K₃(ℤ) ≅ ℤ/48 is K3BlochGroups V.5's; the fourth is the source's table. This node records the five values with the roadmap that owns each, and the two consistency checks the layer's text asks for.

**Hypotheses.**

- The ring is the integers; the groups are Quillen's K-groups.
- Each value is attributed; none is proved here.
- The fourth group vanishing is a theorem, unlike the groups in higher degrees divisible by four, whose vanishing is equivalent to Vandiver's conjecture.

**Proof outline.**

1. Record the five values with their owners: Z.6 (K₀), U.6 (K₁), T.5/k2-of-the-integers (K₂), V.5 (K₃), the source's table (K₄).
2. Record the generator of the second group, the symbol of minus one with itself, and the sign symbol that detects it.
3. Record the first consistency check: the second group has order two while the second K-group of the rationals is infinite, and the tame-kernel sequence accounts for the difference.
4. Record the second consistency check: the third group has order forty-eight, which is twice the invariant w_2 of the rationals, matching the odd-degree formula for a field with a real place.
5. Record the boundary: the vanishing of the fourth group is a theorem, and the vanishing of the higher groups in degrees divisible by four is not.

**Acceptance.**

- The third group has order forty-eight and the invariant w_2 of the rationals is twenty-four; the factor of two is the real place, as the general formula predicts.
- The second group has order two, and the second K-group of the rationals is infinite; both are consistent with the tame-kernel sequence.
- The fourth group vanishes; the eighth is only conjectured to vanish, and the packet says so.
- As a certified example, K₂(ℤ) instantiates N.6's engine with T.5's bounds: one generator {−1, −1}, the relation 2g = 0, span by Milnor's bound, lower bound the real sign symbol onto ℤˣ (the instance orderCertificate_k2_int of ArithmeticKTheory N.6/order-certificate).

**Prerequisites.**

- `ArithmeticKTheory:N.8/certified-example-format`
- `ArithmeticKTheory:N.7/w-invariant`
- `ArithmeticKTheory:N.7/vandiver-separation`
- `KTheoryLowDegrees:Z.6`
- `KTheoryLowDegrees:U.6`
- `K2SymbolsBrauer:T.5/k2-of-the-integers`
- `K2SymbolsBrauer:T.5/k2-of-the-rationals`
- `K3BlochGroups:V.5`

**Sources.**

- `Kbook.2013`: VI.10.1.1 (Table 10.1.1) and its note, printed p. 528 (PDF p. 536). The first column of the table (transcribed) and its note, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The Gaussian integers: a vanishing tame kernel and a third K-group of order twenty-four

`ArithmeticKTheory:N.8/gaussian-and-imaginary-quadratic` · application · parent `ArithmeticKTheory:N.8` · implementation unchecked

For the Gaussian rationals the required computations are that the tame kernel vanishes and that the third K-group is the direct sum of the integers and a cyclic group of order twenty-four. The first is Tate's computation, recorded by the source together with the other imaginary quadratic rings of class number one for which the same vanishing holds; this node gives an independent certificate in N.6’s format: the empty presentation spans by gaussian-residue-cutoff and gaussian-tame-kernel-vanishing, which strip all primes of norm>2 and kill the three remaining S-unit symbols; its lower bound is trivial. The second follows from the general structure theorem for the third K-group of a number field: for a totally imaginary field with r_2 complex places the group is the direct sum of r_2 copies of the integers and a cyclic group of order the invariant w_2; the Gaussian rationals have one complex place and no real place, and their invariant w_2 is twenty-four, so the group is as stated.

**Hypotheses.**

- The field is the Gaussian rationals and the ring is the Gaussian integers; the field is totally imaginary with one complex place and no real place.
- The structure theorem for the third K-group is the source's Corollary 5.3, which K3BlochGroups V.5 owns and this layer imports; the case distinction between the totally imaginary case and the case with a real place is part of it.
- The value twenty-four for the invariant is computed by N.7's node and is the same as for the rationals.

**Proof outline.**

1. Gaussian certificate: no generators, span by gaussian-residue-cutoff and gaussian-tame-kernel-vanishing, and a trivial independent lower bound. Identify the tame kernel via T.5; the K₃ structure computation remains a separate V.5 import.
2. State the structure theorem for the third K-group of a number field in both cases, totally imaginary and with a real place.
3. Compute the signature of the Gaussian rationals and its invariant w_2.
4. Substitute into the totally imaginary case to obtain the direct sum of the integers and a cyclic group of order twenty-four.
5. Record the contrast with the rationals, where the real place contributes the extra factor of two that gives order forty-eight, and record that this contrast is the point of having both examples.

**Acceptance.**

- The tame kernel of the Gaussian integers vanishes, while that of the integers has order two; the difference is the absence of a real place.
- The third K-group of the Gaussian rationals has torsion of order twenty-four and that of the rationals of order forty-eight, and both are instances of the same formula.
- The vanishing is Tate's computation, owned here as a certificate whose span is supplied by the two new Gaussian proof nodes; a formalisation may not derive it from the structure theorem, which does not give the tame kernel.

**Prerequisites.**

- `ArithmeticKTheory:N.8/k-groups-of-the-integers`
- `ArithmeticKTheory:N.8/certified-example-format`
- `ArithmeticKTheory:N.6/order-certificate`
- `ArithmeticKTheory:N.7/w-invariant`
- `K3BlochGroups:V.5`
- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `K2SymbolsBrauer:T.5/unramified-subgroup`
- `ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishing`

**Sources.**

- `Kbook.2013`: VI.5.3 (Corollary 5.3), printed p. 488 (PDF p. 496). The structure theorem in both cases, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226). Tate's vanishing for Z[i] and the other rings, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### The localisation sequence of the integers with one prime inverted, in every degree

`ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime` · application · parent `ArithmeticKTheory:N.8` · implementation unchecked

Let p be a prime. The localisation sequence of ℤ ⊂ ℤ[1/p], whose fibre term is K_*(𝔽_p) (N.2/finite-support with R = ℤ and s = p), breaks up into short exact sequences 0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → 0 for every n ≥ 1, and K₀(ℤ) → K₀(ℤ[1/p]) is an isomorphism. Hence K_n(ℤ[1/p]) ≅ K_n(ℤ) for odd n ≥ 3; for n = 2i ≥ 2, K_{2i}(ℤ[1/p]) is an extension of ℤ/(p^i − 1) by K_{2i}(ℤ), of order #K_{2i}(ℤ)·(p^i − 1); and in degree one K₁(ℤ[1/p]) = ℤ[1/p]^× = {±1} × p^ℤ ≅ ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6). In degree two the sequence is K2SymbolsBrauer T.5's relative sequence 0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0 (residue at p ∈ S), imported, and it splits: the retraction K₂(ℚ) → K₂(ℤ) given by the real sign symbol (T.5/k2-of-the-rationals) restricts to K₂(ℤ[1/p]). In the degrees 2i ≥ 4 the extension class is not determined here. The demonstration is what the layer's text asks for ('demonstrate the S-integer exact sequence for Z[1/p]'), and N.8 owns it in every degree (RT-AREA-ktheory-1/9).

**Hypotheses.**

- p is a prime; S = {p} (with the infinite place for the K-book's count of S-units); the ring is ℤ[1/p].
- The localisation sequence is N.2's (the sequence of R → R[1/s] of N.2/finite-support); the injectivity of K_n(ℤ) → K_n(ℚ) for n ≥ 1 is Bass–Milnor–Serre in degree one (SK₁(ℤ) = 0), N.2/even-degree-injectivity in even degrees (T.5 in degree two) and Soulé's theorem (N.5/soule-theorem) in odd degrees n ≥ 3.
- The extension class in degrees 2i ≥ 4 is not claimed; in degree two the splitting comes from the real place.

**Proof outline.**

1. Take the localisation sequence of ℤ → ℤ[1/p] with fibre K_*(𝔽_p) (N.2/finite-support, dévissage for the p-torsion modules): ⋯ → K_n(𝔽_p) → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → K_{n−1}(ℤ) → ⋯.
2. For n ≥ 1, K_n(ℤ) → K_n(ℚ) is injective (SK₁(ℤ) = 0, KTheoryLowDegrees U.6; N.2/even-degree-injectivity for even n; N.5/soule-theorem with S = ∅ for odd n ≥ 3); it factors through K_n(ℤ[1/p]), so K_n(ℤ) → K_n(ℤ[1/p]) is injective and every map K_n(𝔽_p) → K_n(ℤ), n ≥ 1, is zero.
3. Degree zero: K₀(𝔽_p) → K₀(ℤ) sends [𝔽_p] to [ℤ] − [pℤ] = 0 (N.2/the-three-classical-rows (a)), so 0 → K₁(ℤ) → K₁(ℤ[1/p]) → K₀(𝔽_p) = ℤ → 0 is exact and K₀(ℤ) ≅ K₀(ℤ[1/p]).
4. Insert Quillen's K_*(𝔽_p) (KTheoryFiniteLocalFields L.1): K_{2i}(𝔽_p) = 0 and K_{2i−1}(𝔽_p) ≅ ℤ/(p^i − 1) for i ≥ 1; this gives the odd-degree isomorphisms and the even-degree extensions.
5. Degree two: identify the sequence with T.5/relative-s-integer-sequence, and split it by restricting the retraction of T.5/k2-of-the-rationals.
6. Degree one: compare with K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6), the map to K₀(𝔽_p) = ℤ being the p-adic valuation.

**Acceptance.**

- p = 2: K₂(ℤ[1/2]) ≅ K₂(ℤ) = ℤ/2, since 𝔽₂^× is trivial.
- p = 3: K₂(ℤ[1/3]) ≅ ℤ/2 ⊕ ℤ/2, split by the real sign symbol.
- K₃(ℤ[1/p]) ≅ K₃(ℤ) ≅ ℤ/48 for every p, and K₄(ℤ[1/p]) ≅ ℤ/(p² − 1) since K₄(ℤ) = 0 (the source's table); for p = 2 this is ℤ/3.
- Degree one: 0 → {±1} → {±1} × p^ℤ → ℤ → 0, the last map the p-adic valuation.
- A formalisation that asserted a splitting in degrees 2i ≥ 4 would be claiming more than the argument gives.

**Prerequisites.**

- `ArithmeticKTheory:N.8/k-groups-of-the-integers`
- `ArithmeticKTheory:N.2/finite-support`
- `ArithmeticKTheory:N.2/the-three-classical-rows`
- `ArithmeticKTheory:N.2/even-degree-injectivity`
- `ArithmeticKTheory:N.5/soule-theorem`
- `KTheoryFiniteLocalFields:L.1`
- `KTheoryLowDegrees:U.6`
- `K2SymbolsBrauer:T.5/relative-s-integer-sequence`
- `K2SymbolsBrauer:T.5/k2-of-the-rationals`

**Sources.**

- `Kbook.2013`: VI.8.1 (Classical Data), printed p. 513 (PDF p. 521). The degree-zero and degree-one formulas. The printed rank r2 + |S| − 1 is wrong for fields with real places (it gives rank 0 for Z[1/p]); the node uses the correct rank r1 + r2 + |S| − 1 = 1, recorded as ArithmeticKTheory/E1. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The sequence for the integers, which is one of the two compared. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.
- `Kbook.2013`: V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s], here with R = ℤ and s = p, whose fibre is G_*(ℤ/p) = K_*(𝔽_p).

### The rationals: an infinite second K-group over a tame kernel of order two

`ArithmeticKTheory:N.8/the-rationals-infinite-against-finite` · application · parent `ArithmeticKTheory:N.8` · implementation unchecked

The explicit check the layer's text asks for: the second K-group of the rationals is infinite, being the direct sum of a cyclic group of order two and the direct sum over the primes of the multiplicative groups of the prime fields, while the tame kernel, that is the second K-group of the integers, has order two. The two statements are consistent because the tame-kernel sequence is exact and its right-hand term is the infinite direct sum; the splitting is given by the sign symbol at the real place. Both halves are K2SymbolsBrauer T.5's and are imported; what this node adds is the check itself and its record as a certified example.

**Hypotheses.**

- The field is the rationals and the ring the integers.
- Both computations are imported from K2SymbolsBrauer T.5 (T.5/k2-of-the-integers and T.5/k2-of-the-rationals); the sign symbol that splits the sequence is that layer's own contribution.
- The infinite direct sum is over all primes, and each summand is finite cyclic, so the sum is infinite but torsion.

**Proof outline.**

1. Record the two statements with their owner.
2. Record the exact sequence that relates them and the splitting by the sign symbol.
3. Perform the check: the finite group on the left and the infinite group in the middle are consistent exactly because the right-hand term is infinite.
4. Record the resulting certified example: three numbers, the order two, the infinitude, and the splitting, each tagged with its status.
5. Record the contrast with the Gaussian case, where the tame kernel vanishes and there is no real place to split the sequence.

**Acceptance.**

- The second K-group of the rationals is infinite and torsion, which is not a contradiction.
- The tame kernel has order two and is a direct summand, by the sign symbol.
- The example is admissible in the sense of this layer's format: every number is tagged and none is deduced from Birch-Tate.

**Prerequisites.**

- `ArithmeticKTheory:N.8/certified-example-format`
- `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`
- `K2SymbolsBrauer:T.5/k2-of-the-integers`
- `K2SymbolsBrauer:T.5/k2-of-the-rationals`

**Sources.**

- `Kbook.2013`: III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The decomposition that makes the check, verbatim. Prose verbatim from the text layer of the author-hosted PDF; formulas transcribed.

### An independent tame-kernel certificate for Qsqrt5

`ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate` · application · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For F=ℚ(√5), O_F=ℤ[ε], ε=(1+√5)/2, the arithmetic data are degree2, signature(2,0), class number1 and fundamental unitε. The tame kernel is(C₂)² with generators{−1,−1},{−1,ε}. Upper generation is golden-tame-kernel-upper-generation, using the geometric cutoff and11 exact finite residue certificates. Both generators have order dividing2. Independently the two real sign characters send them to(−1,−1),(1,−1), so give a surjection onto(C₂)² and the lower bound4. This completes the mathematical order certificate of N.6; all implementation statuses remain unchecked. Export it to B.3 as an independent input to its own ζ_F(−1)=1/30 and w₂(F)=120 check; those special values supply neither bound here.

**Hypotheses.**

- F = ℚ(√5) is real quadratic, so totally real with two real places; the ring is its ring of integers.
- The format is N.6/order-certificate; the sign symbols are K2SymbolsBrauer T.5/real-sign-symbol at the two real embeddings, and the tame kernel is T.5's unramified subgroup, identified with K₂(𝓞_F) by T.5/tame-kernel-sequence.
- The upper-generation proof is the explicit golden cutoff and finite lattice certificates in this packet.
- The certificate is independent of Birch–Tate; the comparison in B.3 is a downstream application.

**Proof outline.**

1. Certify the arithmetic data: degree and signature from the minimal polynomial X² − X − 1 of ε, the class number from golden-integer-euclidean-units (PID), the unit rank r_1 + r_2 − 1 = 1 (Mathlib's NumberField.Units.rank) with ε fundamental.
2. Lower bound: compute the two sign symbols of {−1, −1} and {−1, ε} (T.5/real-sign-symbol; K-book Ex. III.6.4 for the surjection K₂(F) → {±1}^{r_1}) and conclude that K₂(𝓞_F) → (ℤˣ)² is onto.
3. Apply golden-tame-kernel-upper-generation for the two-symbol presentation with2g=0.
4. The upper presentation and independent real-sign quotient both have order4; N.6 certificate soundness gives the isomorphism.
5. Export the proved mathematical certificate to B.3; no formal Lean implementation is claimed.

**Acceptance.**

- The two sign symbols separate {−1, −1} and {−1, ε}: their images (−1, −1) and (1, −1) generate (ℤˣ)².
- The finite witnesses and the geometric cutoff establish generation, independently of the sign lower bound.
- The Birch–Tate identity 1/30 = (+1)·4/120 is SpecialValuesBirchTate B.3's check, which uses this certificate as its independent input; an order read off from the formula would be tagged as a corollary and could not fill either bound.

**Prerequisites.**

- `ArithmeticKTheory:N.8/certified-example-format`
- `ArithmeticKTheory:N.6/order-certificate`
- `K2SymbolsBrauer:T.5/real-sign-symbol`
- `K2SymbolsBrauer:T.5/unramified-subgroup`
- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `mathlib:NumberField.classNumber`
- `mathlib:NumberField.Units.rank`
- `mathlib:NumberField.InfinitePlace.nrRealPlaces`
- `ArithmeticKTheory:N.8/golden-tame-kernel-upper-generation`

**Sources.**

- `Kbook.2013`: Ex. III.6.4 (PDF p. 251; book p. 243). The sign symbols at the real places, the lower bound of the certificate (text layer as extracted; '֒ →' is the hooked arrow).
- `Kbook.2013`: VI.8.6 (Birch-Tate Conjecture 8.6), printed p. 515 (PDF p. 523). The formula whose independent test in SpecialValuesBirchTate B.3 this certificate feeds, and which may therefore not supply its bounds.

### The Gaussian residue cutoff above norm two

`ArithmeticKTheory:N.8/gaussian-residue-cutoff` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For F=ℚ(i), every finite prime v with Nv>2 gives an isomorphism ∂_v:K₂^{S∪{v}}/K₂^S→k(v)×, where S is the preceding prime-norm filtration. Hence every tame-kernel element belongs to the S-unit symbol subgroup for S={(1−i)}.

**Hypotheses.**

- Gaussian integer arithmetic, PID factorization and nearest-lattice-point division give covering radiusδ=1/√2. Every prime norm after2 is at least5.

**Proof outline.**

1. Put P=√Nv and choose π with |π|=P. Gaussian division gives nonzero representatives in C={a∈ℤ[i]∩U_S:|a|≤δP}. Their norms are<Nv, hence all prime factors are inS. Take G=C, and take W as i together with generators of the preceding primes normalized by Gaussian units; |w|≤P.
2. For w∈W and its representative c∈C, |w−c|≤(1+δ)P<Nv because P≥√5>1+δ. Thus |N(w−c)|<(Nv)² and the small-norm lemma gives w/c∈U₁.
3. For c,g∈C and representative c′ of cg, |cg−c′|≤δ²Nv+δP<Nv because P≥√5>δ/(1−δ²)=√2. For c∈C with residue1, |c−1|≤δP+1<Nv. Treat zero differences separately and apply the Tate criterion.
4. Strip the largest prime in finite symbol support using zero tame residues, leaving only the unique prime of norm2. The argument establishes generation, rather than deducing it from norm-Euclideanity alone.

**Acceptance.**

- The numerical inequalities are exactly the two A5 conditions. The norm2 step is left in the generating stage and handled by the next lemma.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tate-unit-residue-criterion`
- `K2SymbolsBrauer:T.5/small-norm-congruent-units`
- `K2SymbolsBrauer:T.5/S-unit-symbol-filtration`
- `mathlib:GaussianInt`

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix Lemma2 A5/PDF443; Gaussian case A8/PDF446. Both images inspected. The source’s r=P,s=t=δP proof is expanded through the explicit sets and unit criterion.

### Kill the three Gaussian S-unit generators

`ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishing` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

The tame kernel of ℚ(i), identified with K₂(ℤ[i]), is zero. This gives the upper-generation proof for the empty N.6 presentation.

**Hypotheses.**

- Use gaussian-residue-cutoff and U_{ {(1−i)} }=⟨i,π=1−i⟩. The field symbol convention is additive.

**Proof outline.**

1. Bilinearity and anticommutativity reduce the S-unit symbols to{i,i},{i,π},{π,π}. The cutoff lemma shows they generate a subgroup containing the entire tame kernel.
2. The diagonal identity gives{i,i}={−1,i}={i²,i}=2{i,i}, so{i,i}=0. Steinberg for i gives{i,1−i}=0. Finally{π,π}={−1,π}=2{i,π}=0.
3. All generators of the remaining S-unit subgroup vanish, hence so does its tame-kernel subgroup. The localization injection identifies K₂(ℤ[i]) with that subgroup. The certificate has no generators, span by this proof, and the trivial lower bound; no special-value formula is used.

**Acceptance.**

- The three symbol relations are read from Tate’s A8 image. An empty presentation without the cutoff span proof would not certify vanishing.

**Prerequisites.**

- `ArithmeticKTheory:N.8/gaussian-residue-cutoff`
- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `ArithmeticKTheory:N.6/order-certificate`

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix Gaussian case A8/PDF446, global printed p.436. Full image computation read; no use of Proposition3’s odd/2-primary shortcut, nor Birch–Tate.

### Euclidean arithmetic and all units of the golden integer ring

`ArithmeticKTheory:N.8/golden-integer-euclidean-units` · construction · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For O=ℤ[ε], ε²=ε+1, identify a+bε with(a,b), use N(a,b)=a²+ab−b², and prove O is a PID and O×=⟨−1,ε⟩≅C₂×ℤ. In the two real embeddings its lattice has covolume√5.

**Hypotheses.**

- Import the ring-of-integers identification for Qsqrt5 from the existing quadratic-field owner.

**Proof outline.**

1. The multiplication rule is(a,b)(c,d)=(ac+bd,ad+bc+bd); conjugation sends(a,b) to(a+b,−b). For real coefficients rounded separately into[−1/2,1/2], the absolute value of u²+uv−v² is at most5/16: optimize the quadratic on the square and its four edges. Thus division by any nonzero element admits a remainder of smaller absolute norm, giving Euclideanity and PID factorization.
2. If z is a unit, choose its sign and an integral power of ε so its first embedding lies in[1,ε). Its other embedding is±1/z. The coefficient b=(σ₁z−σ₂z)/√5 is an integer with absolute value<1 (at the endpoints the only possible unit is1), hence b=0 and z=1. This proves the asserted unit presentation.
3. The embedding basis(1,1),(ε,1−ε) has determinant−√5; take its absolute value for covolume.

**Acceptance.**

- This proves the unit presentation actually used by the finite certificates; norm-Euclideanity alone is not asserted to imply unit-symbol generation.

**Prerequisites.**

- `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GoldenInteger.coordinate` | equivalence | O with pairs of integers and ε²=ε+1. |
| `GoldenInteger.norm` | projection | a²+ab−b². |
| `GoldenInteger.unitNormalForm` | characterisation | Every unit is uniquely(−1)^s ε^k, s∈Z/2,k∈Z. |
| `GoldenInteger.smallRemainder` | characterisation | Coordinate rounding has norm bound5/16. |

**Consumers.**

- N.8 independent quadratic order certificate — Supplies a checkable upper-generation argument before the independent real-sign lower bound is compared.

**Unit tests.**

- `epsilon_inverse` (computation) — ε⁻¹=ε−1 and Nε=−1.
- `euclidean_corner` (computation) — u=1/2,v=1/4 attains5/16, so an erroneous1/4 bound is excluded.
- `zero_excluded` (non-example) — Norm division is only defined for a nonzero denominator.

**Sources.**

- `Groenewegen.TameKernel.2004`: Worker arithmetic specialization for X²−X−1; Groenewegen§2 uses the canonical-embedding covolume. The displayed elementary calculation proves the arithmetic input directly.

### Small congruent fractions from the golden embedding lattice

`ArithmeticKTheory:N.8/golden-congruence-lattices` · construction · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

Put d=2√5/π. For a prime v of norm q and k(v)× elements a₁,…,a_(s−1), s=2 or3, the lattice of(x₁,…,x_s)∈O^s with x_j≡a_j x_s modv has covolume5^(s/2)q^(s−1). Ordinary Minkowski applied to s products of stretched disks B_t={x:(σ₁x²+σ₂x²)/2≤t} gives a nonzero tuple with each coordinate in B_t whenever t^s≥d^s q^(s−1); determinant-one stretches are allowed. If t<q every coordinate is a nonzero old S-unit.

**Hypotheses.**

- S contains the primes preceding v in prime-norm order. At nonzero residue classes the congruence equations force all coordinates to be nonzero once one is nonzero.

**Proof outline.**

1. The congruence map O^s→k(v)^(s−1) is onto by choosing x_s=0, hence the stated lattice index is q^(s−1). The embedding determinant gives its covolume.
2. Each B_t disk has area2πt=4√5(t/d). Its s-fold product is compact convex symmetric in dimension2s, with volume at least2^(2s) times the lattice covolume under the displayed inequality. Apply the pinned compact Minkowski theorem; this uses packing bound1, with no refined packing-density import.
3. |N(x_j)|≤t<q means every prime divisor has norm<q. A zero coordinate would force all residues zero; any nonzero remaining coordinate would then have norm≥q, a contradiction.

**Acceptance.**

- The two-coordinate case uses t=d√q; the common-denominator three-coordinate case uses t=d q^(2/3).

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-integer-euclidean-units`
- `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GoldenCongruenceLattice` | constructor | Kernel of the explicit surjective congruence homomorphism O^s→k^(s−1). |
| `GoldenCongruenceLattice.covolume` | characterisation | 5^(s/2)q^(s−1). |
| `GoldenCongruenceLattice.smallTuple` | constructor | The compact Minkowski witness with specified nonzero residues. |
| `GoldenCongruenceLattice.oldUnits` | characterisation | t<q gives old S-units. |

**Consumers.**

- N.8 independent quadratic order certificate — Supplies a checkable upper-generation argument before the independent real-sign lower bound is compared.

**Unit tests.**

- `two_coordinates` (computation) — s=2 gives covolume5q and t²≥d²q.
- `three_coordinates` (computation) — s=3 gives covolume5√5 q² and t³≥d³q².
- `strict_norm` (non-example) — At t=q a coordinate can be divisible byv, so the nonzero-old-unit conclusion is not available.

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen Lemmas6,9,12, printed1447–1450,1453. Source lattice proofs specialized to degree2 and the weaker packing bound1.

### Compare small fractions with equal residues

`ArithmeticKTheory:N.8/golden-small-fraction-comparison` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

Let x/y and x′/y′ be fractions of integral old S-units, represented in possibly stretched B_t and B_t′, with equal nonzero residue atv. If4tt′<q², they represent the same class in U/U₁.

**Hypotheses.**

- The stretches are positive diagonal and have determinant1. U₁ is generated by(1+πU)∩U, with π any prime generator ofv.

**Proof outline.**

1. Cauchy–Schwarz gives the product inclusion B_t B_t′⊂D_(tt′), where D_T is the diamond |σ₁x|+|σ₂x|≤2√T. The difference xy′−x′y lies in the product stretch of D_(4tt′), so its absolute norm is≤4tt′<q².
2. This integral difference is divisible byv. If nonzero, its factorization has exactly one v factor and all other prime factors have norm<q, hence it isπ times an old unit. Consequently xy′/(x′y)=1+πu∈U₁. A zero difference gives equality directly.

**Acceptance.**

- The two stretches multiply, preserving the absolute norm; a bound on each coordinate in the unstretched Euclidean disk is not assumed.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-congruence-lattices`
- `K2SymbolsBrauer:T.5/small-norm-congruent-units`

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen Proposition10, printed1450. Full norm-difference proof read; the constants are n=2 and ordinary density1.

### A well-defined section for a large golden prime residue

`ArithmeticKTheory:N.8/golden-residue-section` · construction · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For q>4d² define γ:k(v)×→U/U₁ by a small fraction x/y of residuea with x,y∈B_(d√q). This is independent of the choice of fraction and of a determinant-one stretch, and reduction composed withγ is the identity.

**Hypotheses.**

- The preceding S-unit group and U₁ are the actual arithmetic groups, not abstract names for the target quotient.

**Proof outline.**

1. Existence follows from the two-coordinate lattice lemma. Here t=d√q<q, so x,y are old units.
2. Since4t²=4d²q<q², golden-small-fraction-comparison identifies every choice with the unstretched one. Nonzero residues give reduction(γ(a))=a.

**Acceptance.**

- A set-theoretic section is constructed first; multiplicativity is a separate lemma.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-congruence-lattices`
- `ArithmeticKTheory:N.8/golden-small-fraction-comparison`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GoldenResidueSection` | constructor | A small-fraction section into U/U₁. |
| `GoldenResidueSection.independent` | characterisation | Choices and determinant-one stretches give the same class. |
| `GoldenResidueSection.reduction` | compatibility | Reduction afterγ is identity. |

**Consumers.**

- N.8 independent quadratic order certificate — Supplies a checkable upper-generation argument before the independent real-sign lower bound is compared.

**Unit tests.**

- `section_exists` (computation) — For q>33, t=d√q<q.
- `equal_fraction` (computation) — Two identical fractions compare through the zero-difference case.
- `no_hom_yet` (non-example) — A chosen residue representative does not alone imply a group homomorphism.

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen§3 definition ofγ and Proposition10, printed1450–1451. Read construction, with rho replaced by1.

### The golden section is inverse on all old unit generators

`ArithmeticKTheory:N.8/golden-section-on-generators` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For q>33, γ∘reduction is identity on U/U₁. The proof uses all earlier prime generators and the two explicitly known units−1,ε; it does not require Lenstra’s general small-unit generation theorem.

**Hypotheses.**

- Use the section and the proved O×=⟨−1,ε⟩. No finite prime has norm≤√5:2 is inert and has norm4.

**Proof outline.**

1. For each earlier prime p′ of norm q′, apply the ordinary Minkowski theorem to p′⁻¹ and the square with coordinate bound(√5/q′)^(1/2). Obtain π′ with valuation−1 atp′, supported otherwise at primes of norm≤√5<q′, hence actually a unit times an inverse generator ofp′. Its embedding coordinates have absolute value<1. These π′ and−1,ε generate U.
2. Compare π′ with its small residue fraction x/y. The fractional-ideal difference π′y−x lies in the disk B_(4d√q). Multiplying its ideal byp′ makes it integral, of norm≤q′4d√q<q² for q>16d². Thus the nonzero difference has valuation1 atv and only old prime factors, so π′/(x/y) lies inU₁; zero difference is immediate.
3. For a=−1 orε let H=∏σ max(1,|σ(a)|), which is1 orε<5. Choose the determinant-one stretch ξ_σ=H^(1/2)/max(1,|σ(a)|). Then both ay andx lie in B_(tH), so |N(ay−x)|≤4tH≤20d√q<q² for q>33. The same factorization gives a/(x/y)∈U₁.
4. These are actual generators ofU, not just a generating set of its image in the residue field. Multiplicativity ofγ, proved next, extends identity from them toU/U₁.

**Acceptance.**

- The assertion on all ofU/U₁ depends on the next multiplicativity lemma; there is no prerequisite cycle because that lemma uses only the section/comparison.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-residue-section`
- `ArithmeticKTheory:N.8/golden-integer-euclidean-units`
- `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`
- `ArithmeticKTheory:N.8/golden-section-multiplicative`

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen§4 and§6, printed1451–1453. Specialization bypasses§5’s unread Lenstra input by proving the two units directly.

### The golden residue section is multiplicative

`ArithmeticKTheory:N.8/golden-section-multiplicative` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For q>33 the sectionγ is a group homomorphism.

**Hypotheses.**

- Put s=d q^(2/3) and t=d√q. Then s<q and4st<q².

**Proof outline.**

1. For a,b∈k(v)× choose the common-denominator tuple x,y,z∈B_s with x/z of residuea and y/z of residueab. Choose x′/z′∈B_t of residueb.
2. The small-fraction comparison, since4st<q², givesγ(a)=x/z andγ(ab)=y/z. The integral products xx′ and yz′ have equal residue and their difference has norm≤4st<q², so xx′/(yz′)∈U₁ (or they are equal). Thus γ(a)γ(b)=γ(ab).
3. The inequalities follow from q>max(d³,2^(12/5)d^(12/5)). Both thresholds are<33. For the latter use d<16 and 2^(12/5)d^(12/5)<16d²<33.

**Acceptance.**

- Common denominators are constructed using the three-coordinate lattice. Independently chosen small fractions alone do not establish this step.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-congruence-lattices`
- `ArithmeticKTheory:N.8/golden-small-fraction-comparison`
- `ArithmeticKTheory:N.8/golden-residue-section`

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen Lemma12 and Proposition13, printed1453. Read common-denominator proof and its strict inequality.

### Eliminate all golden prime norms above thirty-three

`ArithmeticKTheory:N.8/golden-large-prime-cutoff` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For O=ℤ[ε] and every prime v with Nv>33, the residue map K₂^(S∪{v})/K₂^S→k(v)× is an isomorphism. Consequently every tame-kernel element lies in the symbol subgroup for primes of norm≤33.

**Hypotheses.**

- Order finite primes by norm and break ties arbitrarily.

**Proof outline.**

1. The section is multiplicative and inverse on the old unit generators, hence U/U₁≅k(v)×. The field-symbol quotient is the same group by the Steinberg residue criterion.
2. The only bounds used are q>16d², q>(20d)^(2/3), q>d³ and q>2^(12/5)d^(12/5), with d=2√5/π. The first is320/π²<33 (π>3.14), and each other bound is smaller. No estimate of the full group order enters.
3. Any symbol has finite prime support; strip its largest supported prime when it has norm>33 and its residue is trivial. This terminates.

**Acceptance.**

- The cutoff is a sufficient bound specialized from the proof, not the source’s sharp packing-density value. The two prime ideals at a split rational prime are handled as separate steps.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-section-on-generators`
- `ArithmeticKTheory:N.8/golden-section-multiplicative`
- `K2SymbolsBrauer:T.5/tate-unit-residue-criterion`
- `K2SymbolsBrauer:T.5/S-unit-symbol-filtration`

**Sources.**

- `Groenewegen.TameKernel.2004`: Groenewegen Theorems14–15, printed1454–1455, specialized through the preceding lemmas. Read source proof; density1 and explicit unit basis replace its stronger general inputs.

### Eleven exact golden unit-kernel certificates below the cutoff

`ArithmeticKTheory:N.8/golden-finite-prime-certificates` · construction · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

For the ordered prime generators 2,2ε−1,3,3+ε,4−ε,4+ε,5−ε,5+ε,6−ε,5+2ε,7−2ε, of norms4,5,9,11,11,19,19,29,29,31,31, respectively, the attached integer-lattice witnesses certify every successive field-symbol residue quotient as k(v)×.

**Hypotheses.**

- Use the actual unit basis−1,ε and the preceding prime generators, which is free except for(−1)²=1 by PID factorization. The list contains all prime ideals of norm≤33.

**Proof outline.**

1. Classify rational primes≤33 by X²−X−1 modulo p:2,3 are inert (norm4,9);5 ramifies (norm5);11,19,29,31 split. All remaining primes≤33 are inert and have prime norm>33. The displayed norm±p generators distinguish each split pair.
2. For every certificate the finite residue multiplication table generated by the old-unit images has q−1 elements, proving surjectivity.
3. Coordinates useε²=ε+1. For each recorded relation verify the exact factorizations ofa,b,(a−b)/π by the old unit and prime generators. Therefore a/b=1+π((a−b)/πb) is a U₁ witness. Recompute each displayed maximal minor by exact integer elimination; the gcd is q−1. Apply unit-kernel-lattice-certificate.
4. The attached data are a finite, reproducible certificate; the search used to find witnesses is not part of the mathematical correctness claim.

**Acceptance.**

- The exact-arithmetic check passes all11 primes. Counts of maximal minors are2,1,1,3,2,2,2,3,2,2,3; their gcds are3,4,8,10,10,18,18,28,28,30,30. No GRH or Birch–Tate formula is used.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-integer-euclidean-units`
- `K2SymbolsBrauer:T.5/unit-kernel-lattice-certificate`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `GoldenPrimeCertificates` | constructor | The explicit prime order and exact unit-kernel lattice data. |
| `GoldenPrimeCertificates.factorization` | compatibility | Each vector has an actual a/b=1+πu witness. |
| `GoldenPrimeCertificates.minors` | characterisation | The recorded determinants have gcdq−1. |
| `GoldenPrimeCertificates.residueStep` | equivalence | Each checked successive symbol quotient is k(v)×. |

**Consumers.**

- N.8 independent quadratic order certificate — Supplies a checkable upper-generation argument before the independent real-sign lower bound is compared.

**Unit tests.**

- `first_inert` (computation) — At norm4 the lattice index is3; at norm9 it is8.
- `split_order` (computation) — The second norm11 certificate includes the first norm11 prime among its old generators.
- `odd_factor` (non-example) — A full-rank relation lattice of index2(q−1) would leave an unresolved factor2 and cannot be accepted.

**Sources.**

- `Groenewegen.TameKernel.2004`: Worker exact arithmetic specialization of the Tate unit-kernel criterion. All certificate values are worker calculations, not values quoted from Groenewegen.

The exact finite certificate data are included under `certificateData` in this node of the JSON packet. The reproducible checker below reads those data directly.

### The two unit symbols generate the golden tame kernel

`ArithmeticKTheory:N.8/golden-tame-kernel-upper-generation` · lemma · parent `ArithmeticKTheory:N.8` · implementation unchecked

Proposed parent: `ArithmeticKTheory:N.8:K2-examples`; maintainer integration is pending.

The tame kernel of Qsqrt5 is generated by {−1,−1} and{−1,ε}, each of order dividing2.

**Hypotheses.**

- Use the large-prime cutoff and all11 finite residue certificates.

**Proof outline.**

1. Strip primes above33 by the cutoff; strip all remaining primes in the displayed descending order using the finite residue-step isomorphisms and zero tame residues. Thus the tame kernel lies in the symbol subgroup of O×=⟨−1,ε⟩.
2. Bilinearity and anticommutativity reduce unit symbols to {−1,−1},{−1,ε},{ε,ε}. The diagonal identity {ε,ε}={−1,ε} removes the third generator, and multiplication in the first argument gives2{−1,u}=0.
3. Identify the tame kernel with K₂(O) via T.5 localization; its independent real-sign lower bound then makes the presentation(C₂)² exact.

**Acceptance.**

- The upper generation is proved before comparing orders with the real sign characters.

**Prerequisites.**

- `ArithmeticKTheory:N.8/golden-large-prime-cutoff`
- `ArithmeticKTheory:N.8/golden-finite-prime-certificates`
- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `K2SymbolsBrauer:T.2/steinberg-symbol`

**Sources.**

- `Groenewegen.TameKernel.2004`: Worker specialization using the preceding source-derived geometric cutoff and exact finite certificates. This is an independent certificate route and does not assume Birch–Tate or any zeta value.

## Remaining gaps

### Washington's book, the source of Kummer's criterion, was not obtained

The K-book states Kummer's criterion, that a prime is irregular exactly when it divides the numerator of one of the Bernoulli numbers in the finite range, and refers to Washington's Introduction to Cyclotomic Fields for the proof, as it does for Kummer's congruences. That book is not freely available and was not obtained. This packet states the criterion as the source states it, with the attribution, and proves nothing about it. NEXT SOURCE ACTION: obtain Washington, chapters 5 and 6, and decompose the proof of the criterion and of the congruences; both are needed before the criterion can be used as anything but an import.

Needed by: `ArithmeticKTheory:N.7`.

### The Herbrand-Ribet theorem is quoted from a remark

The eigenspace statement, that l divides the k-th Bernoulli number exactly when the eigenspace of index l-2k of the modulo-l class group is non-zero, appears in the K-book as a remark with a reference to the original papers of Herbrand and of Ribet. Neither was obtained. The node states the theorem in the form the remark gives and records the numerical statement that among irregular primes below four thousand at most three values of k occur. NEXT SOURCE ACTION: obtain Ribet's 1976 Inventiones paper and Herbrand's original, or Washington chapter 6, and decompose the proof; Ribet's half uses modular forms and is a substantial piece of work in its own right.

Needed by: `ArithmeticKTheory:N.7`.

## Requests to existing owners

- `K2SymbolsBrauer:T.5` — The tame kernel and its exact sequences (T.5/unramified-subgroup, T.5/tame-kernel-sequence, T.5/relative-s-integer-sequence), the real sign symbol (T.5/real-sign-symbol), and the computations K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} (T.5/k2-of-the-integers) and K₂(ℚ) ≅ K₂(ℤ) ⊕ ⊕_p 𝔽_p^×, infinite (T.5/k2-of-the-rationals), which N.8 imports and does not recompute (RT-AREA-ktheory-1/9). The certificate format is no longer requested from T.5: it is ArithmeticKTheory N.6/order-certificate, and T.5 drops its competing certificate paragraph.

- `K2SymbolsBrauer:T.7` — The twisted coefficient modules and the norm residue symbol. The invariant w_i is defined with the twisted modules. Tate's comparison K₂/m ≅ H² is no longer requested from T.7: MotivicEtaleKTheory M.3 owns it (RT-AREA-ktheory-1/8), and N.7's tame-kernel vanishing theorem imports it from there (request to M.3).

- `K3BlochGroups:V.5` — The third K-group of the integers, of the rationals and of the Gaussian rationals. AUDIT-27 names V.5 as owning the order forty-eight and the Gaussian computation that N.8 records.

- `MotivicEtaleKTheory:M.3` — The Galois symbol and Tate's comparison K₂/m ≅ H²(μ_m^{⊗2}) for local and global fields and for rings of S-integers with the primes above m inverted, M.3 being its single owner (RT-AREA-ktheory-1/8): the first of the three inputs of N.7's tame-kernel vanishing theorem.

- `ArithmeticKTheory:N.5` — The odd K-groups with their Harris-Segal summands, which is where the torsion consequences of N.7 live.

- `K2SymbolsBrauer:T.2` — Matsumoto's presentation of the second K-group of a field by Steinberg symbols, the skew-symmetry and the relation between the symbol of an element with itself and with minus one, all used by the computations N.8 imports.

- `KTheoryLowDegrees:U.6` — K₁(ℤ) = {±1} by the determinant (SK₁(ℤ) = 0), and K₁(ℤ[1/p]) = ℤ[1/p]^× ≅ ℤ/2 ⊕ ℤ with the p-adic valuation as boundary, which N.8 imports for the first K-groups of the integers and the degree-one row of the ℤ[1/p] sequence (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees U.1 packet plans them as U.6/K1-integers and U.6/K1-integers-away-from-p; N.8 will cite them by id once that packet is accepted. U.6 → N.8 is a new atlas edge; it is acyclic.

- `KTheoryLowDegrees:Z.6` — K₀(ℤ) = ℤ (with π₀ of the K-theory space), which N.8 imports for the first K-groups of the integers (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees Z.3 packet plans it as Z.6/integers-test. Z.6 → N.8 is a new atlas edge; it is acyclic.

- `KTheoryFiniteLocalFields:L.1` — Quillen's computation K₀(𝔽_q) = ℤ, K_{2i}(𝔽_q) = 0 and K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) for i ≥ 1 (K-book IV.1.13), which gives the residue terms of the localisation sequence of ℤ ⊂ ℤ[1/p] in N.8's example in every degree. The atlas already has L.1 upstream of ArithmeticKTheory (L.1 → N.2); no cycle.

- `IntegralIwasawaTheory:L3` — Supply the single Vandiver(l) predicate for primes l, with its defining equivalence l not dividing the class number of Q(mu_l)^+, and transport along a rational cyclotomic-field isomorphism to NumberField.maximalRealSubfield (CyclotomicField l Q). Its Lean module/declaration is not yet published; N.7 records the import contract, not a second definition. The odd-character equivalence and conditional K-theory consequences remain in N.7.

## Stage proposals awaiting maintainer integration

### N.8 owns its certified examples and imports the rest

RT-AREA-ktheory-1/9 and /11 (confirmed) settle the boundaries. N.8 imports K₀(ℤ) (KTheoryLowDegrees Z.6), K₁(ℤ) (U.6), K₂(ℤ) and K₂(ℚ) (K2SymbolsBrauer T.5) and K₃(ℤ), K₃(ℚ(i)) (K3BlochGroups V.5); it owns the format of a certified example on ArithmeticKTheory N.6's certificate engine, the certificate K₂(ℤ[i]) = 0, the certified tame kernel of the real quadratic field ℚ(√5), and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree. The Birch–Tate check is SpecialValuesBirchTate B.3's, which imports N.8's real-quadratic certificate. Proposal for the stage text: name those owners, say that N.8 owns the certificates and the ℤ[1/p] sequence, and replace 'before checking Birch–Tate' by 'for SpecialValuesBirchTate B.3 to check Birch–Tate against'.



### The word regular is missing from both libraries and is a cheap early target

AUDIT-27 records that a grep for the phrase regular prime over both pinned trees returns nothing, and the same for Vandiver. Yet every ingredient is pinned: cyclotomic extensions, rings of integers, class numbers and the Bernoulli numbers in both conventions, with the conversion. The definition of a regular prime is therefore a composition of pinned objects and is one of the cheapest genuinely new definitions in this area, with the decidability instance for a given prime following from the pinned class number. Proposal: record it as an early library target of this roadmap, ahead of the theorems that use it, since it unblocks both the statement of N.7's main theorem and the certified examples of N.8.



### N.8's real-quadratic certificate feeds SpecialValuesBirchTate B.3

RT-AREA-ktheory-1/11 (confirmed): N.8 and B.3 both planned the certified real-quadratic tame kernel, and no edge made N.8 available to B.3, while N.8 imported B.3. N.8/real-quadratic-example-and-birch-tate now owns the certificate for ℚ(√5) (with N.6's engine) and no longer imports B.3; N.8/birch-tate-status, which imported B.3, is deleted. Proposal: add the atlas edge ArithmeticKTheory:N.8 → SpecialValuesBirchTate:B.3 (acyclic once N.8's imports of B.3 are gone, checked against the current packets) and let B.3/sqrt-five-birch-tate-check import the N.8 node instead of requesting the certificate from K2SymbolsBrauer T.5. B.3 keeps the w₂ computation, the L-function factorisation and the check, and must not supply the order bound.



### Independent K2 certificates precede the mixed higher examples



Create N.8:K2-examples after N.6 and elementary T.5. Move certified-example-format, gaussian-residue-cutoff, gaussian-tame-kernel-vanishing, the golden-* construction/proof nodes and real-quadratic-example-and-birch-tate there with stable ids. The independent K2 certificates precede B.3; mixed N.8 examples may import K3BlochGroups V.5. The existing unchanged V.5/k3-Z-and-Q and V.5/k3-gaussian nodes still import the whole N.8 while N.8 imports V.5. Handoff to the K3BlochGroups owner: remove those reverse imports; V.5 must own the Lee–Szczarba K3(Z) computation (or request its actual independent source proof) and derive the Gaussian K3 value from its own number-field theorem, w2 and signature. N.8 only consumes these results. This is an integration proposal, not a claim that the unread Lee–Szczarba proof was completed or a revision of the accepted UCE import repair.

## Source discrepancies

### ArithmeticKTheory/E1

VI.8.1 (Classical Data 8.1), printed p. 513 (PDF p. 521); identical in the chapter file Kbook.VI.pdf of 18 September 2012

K1(OS) = OS^× ≅ Z^{r1+r2+|S|−1} ⊕ µ(F), for S a finite set of finite places (Dirichlet's S-unit theorem).

For F = Q and S = {p}: OS = Z[1/p] has units ±p^n, of rank 1 = r1 + r2 + |S| − 1, while the printed formula gives rank 0. The printed rank is right only when r1 = 0, which is the only case the book uses it in (Theorem 8.4, F totally imaginary).

new

- Weibel's K-book page (sites.math.rutgers.edu/~weibel/Kbook.html): its 'Errata to the published version' link (Kbook.errata.pdf) returned 404 on 2026-09-28.
- The chapter file Kbook.VI.pdf (18 September 2012) prints the same formula; the published AMS version (GSM 145) was not accessible.

## Reproduce the eleven finite residue-step checks

Save the following standard-library Python as `checker.py` outside the repository and run it from the repository root with the packet path. It checks the old-unit order, exact rational factorizations, reduction images and surjectivity, congruent-unit witnesses, selected determinants and their gcds. It verifies the arithmetic certificate data; the large-prime, lattice and symbol proofs are the nodes above and are not inferred merely from this computation. All eleven cases passed on 2026-10-02.

```python
from fractions import Fraction as F
from pathlib import Path
from math import gcd
import json
import sys
# Run from the repository: python3 checker.py research/blueprint/packets/ArithmeticKTheory--N.7.json
p=json.loads(Path(sys.argv[1]).read_text())
s=next(n['certificateData'] for n in p['nodes'] if n['id'].endswith('golden-finite-prime-certificates'))
one=(F(1),F(0))
def times(x,y):a,b=x;c,d=y;return(a*c+b*d,a*d+b*c+b*d)
def inverse(x):a,b=x;n=a*a+a*b-b*b;assert n;return((a+b)/n,-b/n)
def exp(x,k):
 if k<0:x=inverse(x);k=-k
 y=one
 for _ in range(k):y=times(y,x)
 return y

def factors(gs,vs):
 z=one
 for g,v in zip(gs,vs):z=times(z,exp(tuple(map(F,g)),v))
 return z

def determinant(rows):
 a=[list(map(F,row)) for row in rows];result=F(1);n=len(rows)
 for k in range(n):
  j=next((j for j in range(k,n) if a[j][k]),None)
  if j is None:return 0
  if j!=k:a[k],a[j]=a[j],a[k];result=-result
  p=a[k][k];result*=p
  for j in range(k+1,n):
   c=a[j][k]/p
   for l in range(k,n):a[j][l]-=c*a[k][l]
 assert result.denominator==1
 return int(result)
preceding=[]
assert len(s['certificates'])==11 and s['cutoff']==33
for c in s['certificates']:
 gs=c['oldUnitGenerators'];rels=c['latticeRelations'];pg=tuple(map(F,c['primeGenerator']));n=len(gs)
 assert c['precedingPrimeGenerators']==preceding
 assert gs==[[-1,0],[0,1]]+preceding
 q=c['primeNorm'];aa,bb=map(int,pg)
 assert abs(aa*aa+aa*bb-bb*bb)==q
 if q in (4,9):
  ell=2 if q==4 else 3
  red=lambda x:(int(x[0])%ell,int(x[1])%ell)
  mult=lambda x,y:tuple(int(z)%ell for z in times(x,y))
  un=(1,0);zero=(0,0)
 else:
  ell=q
  assert all(ell%d for d in range(2,int(ell**0.5)+1))
  eps=(-aa*pow(bb,-1,ell))%ell
  assert (eps*eps-eps-1)%ell==0
  red=lambda x:(int(x[0])+eps*int(x[1]))%ell
  mult=lambda x,y:(x*y)%ell
  un=1;zero=0
 assert red(pg)==zero
 images=[red(x) for x in gs]
 expected=[tuple(x) if isinstance(x,list) else x for x in c['residueImages']]
 assert images==expected and all(x!=zero for x in images)
 subgroup={un}
 while True:
  larger=subgroup|{mult(x,g) for x in subgroup for g in images}
  if larger==subgroup:break
  subgroup=larger
 assert len(subgroup)==q-1
 for r in rels:
  assert len(r['vector'])==n
  if r['kind']=='torsion':assert factors(gs,r['vector'])==one;continue
  a=tuple(map(F,r['a']));b=tuple(map(F,r['b']));w=tuple(map(F,r['differenceOverPrime']))
  assert factors(gs,r['aFactors'])==a
  assert factors(gs,r['bFactors'])==b
  assert factors(gs,r['quotientFactors'])==w
  assert times(pg,w)==(a[0]-b[0],a[1]-b[1])
  assert red(a)==red(b) and red(b)!=zero
  assert factors(gs,r['vector'])==times(a,inverse(b))
  assert all(v==x-y for v,x,y in zip(r['vector'],r['aFactors'],r['bFactors']))
 g=0
 for m in c['minors']:
  cols=[rels[j]['vector'] for j in m['columns']]
  d=determinant([[cols[j][i] for j in range(n)] for i in range(n)])
  assert d==m['determinant'];g=gcd(g,d)
 assert g==c['gcdOfMinors']==c['primeNorm']-1
 preceding.append(c['primeGenerator'])
 print('VERIFIED',c['primeNorm'],c['primeGenerator'],'all exact factorization witnesses and determinants')
```
