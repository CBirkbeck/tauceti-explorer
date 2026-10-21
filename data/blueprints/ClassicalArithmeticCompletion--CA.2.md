# Classical arithmetic, sequences, polynomials and reciprocity — CA.2 continued: Eulerian numbers, p-free factorials and Ward's theorem

This document continues layer CA.2 (*Sequences and generating functions*) of the roadmap. The layer's recurrences, Lucas sequences, Euler zigzag numbers, analytic generating functions, digit expansions, automatic sequences, Christol and Cobham's theorems and Farey sequences are planned in the roadmap's main document (`research/blueprint/readmes/ClassicalArithmeticCompletion.md`, §CA.2) and are cited here by their identifiers; nothing there is restated. This part adds four groups of targets:

1. **Eulerian numbers** A(n, q), counted by descents, with their identities and unimodality, and the five inequalities of Lawrence–Sawin's Appendix C at their exact ranges (§1).
2. **Generalised binomial coefficients and the p-free factorial** from Yu's integrality argument: divisibility by n/gcd(n, m), the factorial f_p(N) of the integers prime to p, the factorisation of C(np, mp) and C(−np, mp), and the Luo–Zhu congruence with its exceptional case (§2).
3. **Ward's strong divisibility theorem** for elliptic divisibility sequences, with an explicit curve carrying normEDS b c d, the zero set over a field, the filtration E_k(ℚ\_p) of an arbitrary integral Weierstrass equation and the theorem at primes not dividing W₂W₃ (§3). The primes dividing W₂W₃ and the singular attached curves are a recorded gap (§6).
4. **Three suppliers** for steps of earlier CA.2 targets: formal sine and cosine, and the divergence of the Bernoulli and secant-plus-tangent series on and beyond their circles of convergence (§4), with a disposition of every target on the earlier review frontier (§5).

**Conventions.** ℕ contains 0. A(n, q) is indexed by the number q of descents, so A(n, 0) = 1 and A(0, 0) = 1 (Stanley indexes by 1 + des). Generalised binomial coefficients are Mathlib's `Ring.choose` on ℤ: C(n, m) = n(n − 1)···(n − m + 1)/m! for n ∈ ℤ, m ∈ ℕ. `normEDS b c d` is Mathlib's normalised elliptic divisibility sequence W with W₀ = 0, W₁ = 1, W₂ = b, W₃ = c, W₄ = db; it is nondegenerate when bc ≠ 0. Division polynomials ψₙ, φₙ are Mathlib's, ωₙ is Tau Ceti's. v_p is the p-adic valuation (multiplicity, with v_p(0) = ∞). The Bernoulli numbers are Mathlib's `bernoulli`, B₁ = −1/2.

**Boundaries.** The Hodge-theoretic meaning of Eulerian numbers (χ(H, Ωⁱ\_H) = ±d·A(n, i) for a hypersurface H in an abelian variety) belongs to the roadmap that plans Lawrence–Sawin's convolution theory; this layer owns only the numbers and their inequalities. Yu's integrality theorem (Théorème 7.2.3) and the counting of local systems belong to the function-field counting roadmap; this layer owns the binomial and factorial arithmetic it uses. The formal group of an integral Weierstrass equation and its identification Ê(𝔪) ≅ E₁(K) are Tau Ceti's EllipticCurves roadmap (Layer 1, milestones (i), (iii) and (iv)); this layer adds the finer filtration E_k for an arbitrary integral equation. The maximal order of the divisor function, which AdditiveCombinatorics asked of this layer, is AnalyticNumberTheory's target AN.5/divisor-maximal-order.

## 1. Eulerian numbers

The Eulerian number A(n, q) counts permutations of {1, …, n} by descents. Lawrence and Sawin use these numbers as the Hodge numbers of hypersurfaces in abelian varieties and need, in their Appendix B, a battery of inequalities between them, which their Appendix C reduces to five lemmas. The definition fixes the zero-degree value A(0, 0) = 1 separately from Lawrence–Sawin's convention that A(n, q) vanishes outside 0 ≤ q < n, which they use only for n ≥ 1; the identities hold for all n. The lower bound of Lemma C.1 is computed in ℤ, since it is negative for large q. Lemma C.4 uses the unimodality of the rows, which is planned as its own lemma with an elementary proof.

<a id="CA-2-eulerian-numbers"></a>

### Eulerian numbers

`ClassicalArithmeticCompletion:CA.2/eulerian-numbers` · definition · planet: *Eulerian numbers*.

For n, q ∈ ℕ, the Eulerian number A(n, q) is the number of permutations σ of {1, …, n} with exactly q descents, a descent being a position i with 1 ≤ i < n and σ(i) > σ(i + 1). In Lean the permutations are Equiv.Perm (Fin n) and descentCount σ counts the positions i : Fin n with i + 1 < n and σ(i + 1) < σ(i). The empty permutation has no descent, so A(0, 0) = 1 and A(0, q) = 0 for q ≥ 1; for n ≥ 1, A(n, q) = 0 for q ≥ n. The count by ascents (σ(i) < σ(i + 1)) gives the same numbers. In Stanley's indexing A_Stanley(d, k) = A(d, k − 1) (his k counts 1 + des), and Lawrence–Sawin's A(n, q) is this A(n, q).

Hypotheses and conventions: n and q are natural numbers; no range condition is built into the definition, the vanishing outside 0 ≤ q < n (n ≥ 1) is a theorem. The zero-degree value A(0, 0) = 1 is the count of the empty permutation. It is kept separate from Lawrence–Sawin's convention 'A(n, q) = 0 unless 0 ≤ q < n', which they use only for n ≥ 1, and from Stanley's convention A_Stanley(0, k) = δ\_{0k} (that is A₀(x) = 1), which is a separate normalisation of his shifted indexing at d = 0 and does not correspond to A(0, 0) under k = q + 1; the identities planned here (row sums, Worpitzky at m = q + 1 ≥ 1) hold with A(0, 0) = 1.

Uses:

- Lawrence–Sawin, Lemma 3.4, p. 20: the Euler characteristics χ(H, Ω^i_H) of an ample hypersurface of degree d in an abelian variety of dimension n are ±d·A(n, i); that Hodge interpretation stays with the hypersurface owner.
- Lawrence–Sawin, Appendix B (Propositions B.1 and B.11 and their lemmas), pp. 93–116: the numerical elimination of exceptional monodromy groups compares products of Eulerian numbers with binomial counts, through the bounds of Appendix C.
- CA.2/eulerian-power-bounds, eulerian-small-descent-bounds, eulerian-square-separation, eulerian-ratio-bound: the inequalities of Lemmas C.1–C.5 are stated for this A(n, q).

API:

- `eulerian` (data): A(n, q) := #{σ ∈ Equiv.Perm (Fin n) : descentCount σ = q}.
- `descentCount` (data): The number of positions i with i + 1 < n and σ(i + 1) < σ(i).
- `ascentCount` (data): The number of positions i with i + 1 < n and σ(i) < σ(i + 1).
- `eulerian_zero_zero` (simp): A(0, 0) = 1.
- `eulerian_zero_right` (simp): A(n, 0) = 1 for every n (only the identity has no descent).
- `eulerian_eq_zero_of_le` (simp): For 1 ≤ n ≤ q, A(n, q) = 0.
- `eulerian_one_right` (example): A(n, 1) = 2ⁿ − n − 1 (natural subtraction; both sides 0 for n ≤ 1).
- `card_ascentCount_eq_eulerian` (characterisation): #{σ : ascentCount σ = q} = A(n, q): complementing values σ ↦ (n + 1 − σ) exchanges ascents and descents.

Unit tests:

- `eulerian_three_one` (computation): A(3, 1) = 4 (the permutations 132, 213, 231, 312).
- `eulerian_four_row` (computation): A(4, 0) = 1, A(4, 1) = 11, A(4, 2) = 11, A(4, 3) = 1.
- `eulerian_two_row` (computation): A(2, 0) = A(2, 1) = 1.
- `sum_eulerian_zero` (degenerate): Σ\_{q ≤ 0} A(0, q) = 0! = 1, that is A(0, 0) = 1: a definition that builds in 'A(n, q) = 0 unless q < n' gives 0 here and breaks the row sum.
- `sum_eulerian_five` (compatibility): Σ\_{q ≤ 5} A(5, q) = 120 = Nat.factorial 5.
- `eulerian_ne_zigzag` (non-example): A(3, 1) = 4 ≠ 2 = E₃: Eulerian numbers are not the Euler zigzag numbers of CA.2/euler-zigzag-numbers, nor counts of Eulerian circuits in graphs.

Acceptance checks:

- A(4, ·) = 1, 11, 11, 1 and A(5, ·) = 1, 26, 66, 26, 1 (Stanley's table of Eulerian polynomials).
- A(0, 0) = 1, so the row sums are n! for every n ≥ 0, including n = 0.

Proof sketch:

1. Define descentCount σ as the cardinality of the finite set of positions i : Fin n with i + 1 < n and σ(i + 1) < σ(i), and A(n, q) as the cardinality of {σ ∈ Equiv.Perm (Fin n) : descentCount σ = q}.
2. The basic identities (sum n!, symmetry, recurrence, Worpitzky) are proved in eulerian-basic-identities; this node fixes the object and its conventions.

Direct prerequisites: `mathlib:Equiv.Perm`, `mathlib:Finset.card`, `mathlib:Finset.filter`.

Suggested Lean: `eulerian` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), §1.4, (1.36) and the paragraph after it, p. 39. Defines A(d, k) as the number of permutations of [d] with k − 1 descents, the Eulerian polynomial A_d(x) = Σ\_w x^{1+des(w)}, sets A(0, k) = δ\_{0k} and tabulates A_0(x), …, A_8(x).

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), §3, Lemma 3.4, p. 20; Appendix B, opening paragraph, p. 93; Appendix C, proof of Lemma C.1, p. 116. Uses A(n, i) for the Eulerian number in the Hodge-number formula, adopts the convention A(n, q) = 0 unless 0 ≤ q < n, and recalls that A(n, q) counts permutations of {1, …, n} with exactly q ascents.

<a id="CA-2-eulerian-basic-identities"></a>

### Basic identities of Eulerian numbers

`ClassicalArithmeticCompletion:CA.2/eulerian-basic-identities` · theorem.

For all n, q ∈ ℕ: (a) Σ\_{q=0}^{n} A(n, q) = n!; (b) for q < n, A(n, q) = A(n, n − 1 − q); (c) A(n + 1, q + 1) = (q + 2)·A(n, q + 1) + (n − q)·A(n, q), with natural subtraction (for q ≥ n both sides vanish); (d) Worpitzky's identity (q + 1)ⁿ = Σ\_{j=0}^{q} A(n, j)·C(n + q − j, n); (e) A(n, 0) = 1 and A(n, 1) = 2ⁿ − n − 1; (f) the number of permutations with q ascents is A(n, q).

Hypotheses and conventions: n, q ∈ ℕ; (b) needs q < n, which forces n ≥ 1.

Acceptance checks:

- Row 5 is 1, 26, 66, 26, 1, summing to 120 and symmetric.
- Worpitzky at n = 2, q = 1: 4 = A(2, 0)·C(3, 2) + A(2, 1)·C(2, 2) = 3 + 1.
- The recurrence at n = 2, q = 0: A(3, 1) = 2·A(2, 1) + 2·A(2, 0) = 4.

Proof sketch:

1. (a) The sets {σ : des σ = q}, 0 ≤ q ≤ n, partition Equiv.Perm (Fin n), whose cardinality is n! (Fintype.card_perm).
2. (b) and (f): reversal σ ↦ σ ∘ rev sends a permutation with q descents to one with n − 1 − q descents, and complementation σ ↦ rev ∘ σ exchanges descents and ascents (Stanley p. 40, the paragraph before Proposition 1.4.3).
3. (c) Insert n + 1 into a permutation of [n]: inserting it into a descent slot or at the end keeps the descent number, inserting it into an ascent slot or at the front raises it by one; this is Stanley's recurrence (1.39) A(d + 1, k) = kA(d, k) + (d − k + 2)A(d, k − 1) with k = q + 2.
4. (d) For n ≥ 1, Stanley's Proposition 1.4.4 gives Σ\_{m≥0} mⁿxᵐ = A_n(x)/(1 − x)^{n+1} with A_n(x) = Σ\_j A(n, j)x^{j+1}; expanding 1/(1 − x)^{n+1} = Σ\_k C(n + k, n)x^k (Mathlib's PowerSeries.invOneSubPow) and comparing coefficients of x^{q+1} gives (d). At n = 0 Stanley sets A₀(x) = 1 rather than x, so (d) is checked directly there: only j = 0 contributes, and both sides are 1 because A(0, 0) = 1.
5. (e) A(n, 0) = 1 because only the identity has no descent; A(n, 1) = 2ⁿ − n − 1 follows from (d) at q = 1: 2ⁿ = A(n, 0)C(n + 1, n) + A(n, 1).

Direct prerequisites: [eulerian-numbers](#CA-2-eulerian-numbers), `mathlib:Fintype.card_perm`, `mathlib:Nat.choose`, `mathlib:PowerSeries.invOneSubPow`, `mathlib:Fin.revPerm`.

Suggested Lean: `sum_eulerian`, `eulerian_symm`, `eulerian_succ_succ`, `worpitzky`, `eulerian_one_right`, `card_ascentCount_eq_eulerian` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), §1.4, the paragraph before Proposition 1.4.3 and Propositions 1.4.3–1.4.4 with the proof of 1.4.4, (1.37)–(1.39), p. 40. Shows that reversal turns d − 1 − j descents into j descents, proves Σ m^d x^m = A_d(x)/(1 − x)^{d+1} by induction through the recurrence (1.39), and proves (1.39) by inserting d + 1 into a permutation of [d].

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemmas C.1–C.2 with their proofs, p. 116; Appendix A, proof of Lemma A.6, p. 92; Appendix B, opening paragraph, p. 93. The proof of Lemma C.2 is the factorial sum Σ\_q A(n, q) = n!; the proof of Lemma A.6 uses the symmetry A(n, k) = A(n, n − 1 − k); the proof of Lemma C.1 recalls that A(n, q) counts the permutations with exactly q ascents; the opening of Appendix B fixes the convention A(n, q) = 0 outside 0 ≤ q < n.

<a id="CA-2-eulerian-unimodal"></a>

### Unimodality of the rows of Eulerian numbers

`ClassicalArithmeticCompletion:CA.2/eulerian-unimodal` · lemma.

For n ∈ ℕ and q with 2(q + 1) ≤ n − 1: A(n, q) ≤ A(n, q + 1). With the symmetry A(n, q) = A(n, n − 1 − q), each row A(n, 0), …, A(n, n − 1) rises weakly to its middle and falls symmetrically after it.

Hypotheses and conventions: 2(q + 1) ≤ n − 1 means q + 1 ≤ (n − 1)/2, the left half of the row; for n = 0 the hypothesis never holds.

Acceptance checks:

- Row 6 is 1, 57, 302, 302, 57, 1; row 7 is 1, 120, 1191, 2416, 1191, 120, 1.
- Checked numerically for every n ≤ 70 and every q in the range.

Proof sketch:

1. Induction on n with the recurrence of eulerian-basic-identities (c): A(n, q + 1) − A(n, q) = (q + 2)A(n − 1, q + 1) + (n − 2q − 2)A(n − 1, q) − (n − q)A(n − 1, q − 1) for 1 ≤ q (and the analogous expression at q = 0).
2. Under 2(q + 1) ≤ n − 1 the index q + 1 is at most the middle (n − 2)/2 of row n − 1, or equals it up to the symmetric partner when n is odd; by the induction hypothesis and the symmetry, A(n − 1, q + 1) ≥ A(n − 1, q) ≥ A(n − 1, q − 1).
3. Hence the difference is at least ((q + 2) + (n − 2q − 2) − (n − q))·A(n − 1, q − 1) = 0, all coefficients other than the last being nonnegative because n − 2q − 2 ≥ 1.
4. Alternatively (Stanley, Exercise 1.50(e) with its solution): the Eulerian polynomial has only real zeros (Exercise 1.49), hence log-concave coefficients by Newton's inequalities, hence unimodal; symmetry places the peak in the middle.

Direct prerequisites: [eulerian-basic-identities](#CA-2-eulerian-basic-identities).

Suggested Lean: `eulerian_le_eulerian_succ` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), Chapter 1, Exercise 1.50(e), p. 124, with its solution, p. 178; Exercises 1.49 and 1.50(a)–(b), p. 124, with the solutions of 1.49 and 1.50(b), p. 177. Asks to show that Σ\_{w ∈ S_n} x^{des(w)} is symmetric and unimodal, and solves it from the real-rootedness of the Eulerian polynomial (Exercise 1.49) and Newton's inequalities (Exercise 1.50(a),(b)); cites Gasharov for a combinatorial proof.

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, proof of Lemma C.4, p. 117. Uses, without stating it as a lemma, that A(n, r) ≥ A(n, r₀) for r₀ ≤ r ≤ n/2, which is this unimodality.

<a id="CA-2-eulerian-power-bounds"></a>

### Power and factorial bounds for Eulerian numbers (Lawrence–Sawin, Lemmas C.1–C.2)

`ClassicalArithmeticCompletion:CA.2/eulerian-power-bounds` · theorem.

For n ≥ 1 and q ≥ 0: (q + 1)ⁿ − (n + 1)qⁿ ≤ A(n, q) ≤ (q + 1)ⁿ (the left side computed in ℤ), and A(n, q) ≤ n!. The upper bound (q + 1)ⁿ and A(n, q) ≤ n! hold for n = 0 as well.

Hypotheses and conventions: n ≥ 1 for the lower bound, as in the source; q ∈ ℕ arbitrary (for q ≥ n the bounds are consistent with A(n, q) = 0).

Acceptance checks:

- n = 3, q = 1: 2³ − 4·1 = 4 ≤ A(3, 1) = 4 ≤ 8: the lower bound is attained.
- n = 4, q = 2: 3⁴ − 5·2⁴ = 1 ≤ 11 ≤ 81.
- For q ≥ n the lower bound is ≤ 0, consistent with A(n, q) = 0 (checked for n ≤ 70, q ≤ n + 2).

Proof sketch:

1. Upper bound: by Worpitzky's identity (eulerian-basic-identities (d)) (q + 1)ⁿ is a sum of nonnegative terms one of which is A(n, q)·C(n, n) = A(n, q). (Lawrence–Sawin's argument: labelling [n] by 1, …, q + 1 and listing each label class in decreasing order gives every permutation with at most q ascents.)
2. Lower bound (Lawrence–Sawin's argument): the labellings producing a permutation with fewer than q ascents have two adjacent labels whose classes are separated; recording the position j ∈ {0, …, n} of the cut and merging the labels injects them into (n + 1)·qⁿ data, so the number of permutations with exactly q ascents is at least (q + 1)ⁿ − (n + 1)qⁿ.
3. A(n, q) ≤ n! from Σ\_q A(n, q) = n! (eulerian-basic-identities (a)).
4. Ascents and descents give the same numbers (eulerian-basic-identities (f)), so the source's ascent count is A(n, q).

Direct prerequisites: [eulerian-basic-identities](#CA-2-eulerian-basic-identities).

Suggested Lean: `eulerian_le_pow`, `pow_sub_le_eulerian`, `eulerian_le_factorial` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemma C.1 with its proof, p. 116. States (q + 1)ⁿ − (n + 1)qⁿ ≤ A(n, q) ≤ (q + 1)ⁿ for n ≥ 1, q ≥ 0, and proves both halves by the labelling argument.

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemma C.2 with its proof, p. 116. States A(n, q) ≤ n! and derives it from the factorial sum.

<a id="CA-2-eulerian-small-descent-bounds"></a>

### Eulerian numbers with few descents (Lawrence–Sawin, Lemma C.3)

`ClassicalArithmeticCompletion:CA.2/eulerian-small-descent-bounds` · theorem.

For n ≥ 2 and q ∈ ℕ with q < n/(log(n + 1) + 1) − 1 (natural logarithm, real comparison): (1 − 1/e)(q + 1)ⁿ ≤ A(n, q) ≤ (q + 1)ⁿ.

Hypotheses and conventions: n ≥ 2; the hypothesis on q is the real inequality q + 1 < n/(log(n + 1) + 1).

Acceptance checks:

- n = 20: log 21 + 1 ≈ 4.04, so q ≤ 3 is allowed; A(20, 3) ≥ (1 − 1/e)·4²⁰.
- Checked numerically for n ≤ 70 and every admissible q.

Proof sketch:

1. From 1/(q + 1) < log((q + 1)/q) for q ≥ 1, ((q + 1)/q)ⁿ > e^{n/(q+1)}; the hypothesis n/(q + 1) > log(n + 1) + 1 gives ((q + 1)/q)ⁿ > e(n + 1), that is (n + 1)qⁿ < (q + 1)ⁿ/e (trivially true at q = 0).
2. Insert this into the lower bound of eulerian-power-bounds: A(n, q) ≥ (q + 1)ⁿ − (n + 1)qⁿ > (1 − 1/e)(q + 1)ⁿ; the upper bound is the upper half of that node.

Direct prerequisites: [eulerian-power-bounds](#CA-2-eulerian-power-bounds), `mathlib:Real.log`, `mathlib:Real.exp`, `mathlib:Real.add_one_le_exp`.

Suggested Lean: `one_sub_exp_neg_one_mul_le_eulerian` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemma C.3 with its proof, pp. 116–117. States the bound (1 − 1/e)(q + 1)ⁿ ≤ A(n, q) ≤ (q + 1)ⁿ for n ≥ 2 and q < n/(log(n + 1) + 1) − 1, proved from the logarithm inequalities and Lemma C.1.

<a id="CA-2-eulerian-square-separation"></a>

### A product inequality for Eulerian numbers (Lawrence–Sawin, Lemma C.4)

`ClassicalArithmeticCompletion:CA.2/eulerian-square-separation` · theorem.

For n ∈ ℕ and 3 ≤ r ≤ n − 2: A(n, r − 1)·(A(n, r − 1) − 1) > 2·A(n, 3r − 2).

Hypotheses and conventions: 3 ≤ r ≤ n − 2, which forces n ≥ 5; for 3r − 2 ≥ n the right side is 0.

Acceptance checks:

- n = 5, r = 3: A(5, 2)(A(5, 2) − 1) = 66·65 > 0 = 2A(5, 7).
- n = 12, r = 3: A(12, 2) = 478 271 and A(12, 7) = 66 318 474, so the left side ≈ 2.29·10¹¹ exceeds 2A(12, 7) ≈ 1.33·10⁸.
- Checked numerically for every n ≤ 70 and 3 ≤ r ≤ n − 2.

Proof sketch:

1. Small n: for n ≤ 20 the finitely many cases are checked by computation (the source's ancillary Python code, bound-B; rechecked here for all n ≤ 70).
2. Assume n ≥ 21 and r ≤ n/2 (for r > n/2, 3r − 2 ≥ n and the right side vanishes). There is an integer r₀ with √n ≤ r₀ < n/(log(n + 1) + 1), so either r < n/(log(n + 1) + 1) or r ≥ r₀.
3. If r < n/(log(n + 1) + 1): eulerian-small-descent-bounds gives A(n, r − 1) ≥ (1 − 1/e)rⁿ, and eulerian-power-bounds gives 2A(n, 3r − 2) ≤ 2(3r − 1)ⁿ; and (1 − 1/e)²r^{2n} > 2(3r − 1)ⁿ + (1 − 1/e)rⁿ for r ≥ 3, n ≥ 14.
4. If r ≥ r₀: by eulerian-unimodal A(n, r − 1) ≥ A(n, r₀ − 1) (r − 1 ≤ n/2 − 1 is in the rising half), and eulerian-small-descent-bounds at r₀ − 1 gives A(n, r₀ − 1)(A(n, r₀ − 1) − 1) > (3/10)r₀^{2n} ≥ (3/10)nⁿ > 2·n! ≥ 2A(n, 3r − 2) by eulerian-power-bounds (A ≤ n!).

Direct prerequisites: [eulerian-small-descent-bounds](#CA-2-eulerian-small-descent-bounds), [eulerian-power-bounds](#CA-2-eulerian-power-bounds), [eulerian-unimodal](#CA-2-eulerian-unimodal).

Suggested Lean: `two_mul_eulerian_lt` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemma C.4 with its proof, p. 117. States A(n, r − 1)(A(n, r − 1) − 1) > 2A(n, 3r − 2) for 3 ≤ r ≤ n − 2 and proves it for n ≥ 21 by the two-case argument above, leaving n ≤ 20 to the ancillary code; the second case uses the monotonicity A(n, r) ≥ A(n, r₀) without naming it.

<a id="CA-2-eulerian-ratio-bound"></a>

### The ratio A(n, 2)/A(n, 1)² (Lawrence–Sawin, Lemma C.5)

`ClassicalArithmeticCompletion:CA.2/eulerian-ratio-bound` · theorem.

For n ≥ 11: 27·A(n, 2) < A(n, 1)², i.e. A(n, 2)/A(n, 1)² < 1/27. The threshold is sharp: at n = 10, A(10, 1) = 1013 and A(10, 2) = 47 840, so 27·47 840 = 1 291 680 > 1 026 169 = 1013².

Hypotheses and conventions: n ≥ 11.

Acceptance checks:

- The inequality fails for 3 ≤ n ≤ 10 (checked), so the hypothesis n ≥ 11 cannot be weakened.
- Checked numerically for n ≤ 70.

Proof sketch:

1. eulerian-power-bounds gives A(n, 2) ≤ 3ⁿ, and for n ≥ 6 eulerian-small-descent-bounds at q = 1 gives A(n, 1) ≥ (1 − 1/e)2ⁿ (its hypothesis 1 < n/(log(n + 1) + 1) − 1 holds from n = 6).
2. Hence 27A(n, 2)/A(n, 1)² ≤ 27(3/4)ⁿ/(1 − 1/e)², which is < 1 for n ≥ 15.
3. The cases 11 ≤ n ≤ 14 are checked directly from A(n, 1) = 2ⁿ − n − 1 and the recurrence (e.g. n = 11: A(11, 1) = 2036, A(11, 2) = 152 637, and 27·152 637 = 4 121 199 < 4 145 296).

Direct prerequisites: [eulerian-small-descent-bounds](#CA-2-eulerian-small-descent-bounds), [eulerian-power-bounds](#CA-2-eulerian-power-bounds), [eulerian-basic-identities](#CA-2-eulerian-basic-identities).

Suggested Lean: `twentySeven_mul_eulerian_two_lt` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), Appendix C, Lemma C.5 with its proof, pp. 117–118. States A(n, 2)/A(n, 1)² < 1/27 for n ≥ 11, proves it for n ≥ 15 from Lemma C.3 and leaves 11 ≤ n ≤ 14 to a direct check; used in the proof of Lemma B.11.

## 2. Generalised binomial coefficients and the p-free factorial

Yu's proof that the coefficients of his counting polynomials are integers compares, prime by prime, binomial coefficients C(εχsS/l, k/l) with their p-multiples. Four arithmetic facts carry it: n/gcd(n, m) divides C(n, m) for every nonzero integer n, the p-free factorial f_p and its factorial split, the factorisation of C(np, mp) and C(−np, mp) through f_p — with the sign (−1)^{m(p−1)}, which matters at p = 2 — and the Luo–Zhu congruence f_p(p^αN) ≡ f_p(p^α)^N (mod p^{2α}), which fails for p = 2, α = 1 and is replaced there by f_2(2N) ≡ (−1)^{⌊N/2⌋} (mod 4). Mathlib's `Ring.choose` supplies the generalised binomial coefficients and C(−r, n) = (−1)ⁿC(r + n − 1, n).

<a id="CA-2-generalized-binomial-divisibility"></a>

### Divisibility of generalised binomial coefficients (Yu, Lemme 7.2.2)

`ClassicalArithmeticCompletion:CA.2/generalized-binomial-divisibility` · theorem.

For a nonzero integer n and an integer m ≥ 1, n/gcd(n, m) divides the generalised binomial coefficient C(n, m) = n(n − 1)···(n − m + 1)/m! (Mathlib's Ring.choose on ℤ), negative upper entries included. The supporting absorption identity: for every n ∈ ℤ and m ∈ ℕ, (m + 1)·C(n, m + 1) = n·C(n − 1, m).

Hypotheses and conventions: n ∈ ℤ, n ≠ 0; m ∈ ℕ, m ≥ 1. For m > n ≥ 1, C(n, m) = 0 and the statement is trivial.

Acceptance checks:

- n = −2, m = 2: C(−2, 2) = 3 and n/gcd = −1.
- n = −4, m = 2: C(−4, 2) = 10 and n/gcd = −2 divides it.
- The gcd cannot be dropped: 4 ∤ C(4, 2) = 6.
- Checked for every 0 < |n| ≤ 40 and 1 ≤ m ≤ 29.

Proof sketch:

1. Absorption: multiply both sides by m! and use Ring.descPochhammer_eq_factorial_smul_choose: (m + 1)!·C(n, m + 1) is the falling factorial n(n − 1)···(n − m) = n·[(n − 1)···(n − m)] = n·m!·C(n − 1, m); cancel m! in the torsion-free ℤ.
2. Write g = gcd(n, m), n = g·n′, m = g·m′ with gcd(n′, m′) = 1. Absorption at m − 1 gives m·C(n, m) = n·C(n − 1, m − 1), so m′·C(n, m) = n′·C(n − 1, m − 1) is divisible by n′.
3. Since gcd(m′, n′) = 1, n′ divides C(n, m) (Int.dvd_of_dvd_mul_right_of_gcd_one).

Direct prerequisites: `mathlib:Ring.choose`, `mathlib:Ring.choose_neg`, `mathlib:Ring.descPochhammer_eq_factorial_smul_choose`, `mathlib:Int.dvd_of_dvd_mul_right_of_gcd_one`.

Suggested Lean: `div_gcd_dvd_ringChoose`, `succ_mul_ringChoose_succ` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*](https://arxiv.org/pdf/1807.04659v5), §7.2.2, Lemme 7.2.2 with its proof, p. 67 (arXiv v5). States that n/(n, m) divides the binomial coefficient C(n, m) for nonzero integers n, m with m ≥ 1, and proves it from (m/n)C(n, m) = C(n − 1, m − 1) and the coprimality of m/(m, n) and n/(m, n).

<a id="CA-2-p-free-factorial"></a>

### The p-free factorial

`ClassicalArithmeticCompletion:CA.2/p-free-factorial` · definition · planet: *p-free factorial*.

For a natural number p and N ∈ ℕ, the p-free factorial f_p(N) is the product of the integers 1 ≤ i ≤ N with p ∤ i; f_p(0) = 1 (empty product). For p prime, N! = p^{⌊N/p⌋}·⌊N/p⌋!·f_p(N) and f_p(N) is prime to p (a p-adic unit). Negative arguments are not part of the definition.

Hypotheses and conventions: p, N ∈ ℕ; the factorial split holds for every p (for p = 0 and p = 1 it degenerates to N! = N! and N! = N!·1), while the unit property needs p prime.

Uses:

- Yu, proof of Théorème 7.2.3, pp. 71–72: the ratios f_p(np)/(f_p(mp)f_p((n − m)p)) and f_p(np + mp)/(f_p(mp)f_p(np)) carry the p-adic unit part of binomial coefficients of multiples of p.
- CA.2/luo-zhu-congruence: the congruence f_p(p^αN) ≡ f_p(p^α)^N is stated for f_p.
- CA.2/p-free-factorial-binomial-factorisation: the binomial factorisations are stated with f_p.

API:

- `pFreeFactorial` (data): f_p(N) := ∏\_{1 ≤ i ≤ N, p ∤ i} i.
- `pFreeFactorial_zero` (simp): f_p(0) = 1.
- `pFreeFactorial_succ` (simp): f_p(N + 1) = f_p(N)·(1 if p ∣ N + 1, else N + 1).
- `factorial_eq_mul_pFreeFactorial` (characterisation): N! = p^{⌊N/p⌋}·⌊N/p⌋!·f_p(N), for every p.
- `not_dvd_pFreeFactorial` (relation): For p prime, p ∤ f_p(N).
- `pFreeFactorial_prime` (example): For p prime, f_p(p) = (p − 1)!, so f_p(p) ≡ −1 (mod p) by Wilson's theorem (ZMod.wilsons_lemma).

Unit tests:

- `pFreeFactorial_three_six` (computation): f_3(6) = 40.
- `pFreeFactorial_two_four` (computation): f_2(4) = 3.
- `pFreeFactorial_zero` (degenerate): f_p(0) = 1 for every p.
- `pFreeFactorial_ne_ordCompl` (non-example): f_2(6) = 15 ≠ 45 = 6!/2^{v₂(6!)}: the p-free factorial is not the prime-to-p part of N!, which also removes the p-free part of ⌊N/p⌋!.
- `factorial_six_eq_mul_pFreeFactorial` (compatibility): With Mathlib's Nat.factorial: 6! = 3²·2!·f_3(6) = 9·2·40.

Acceptance checks:

- f_3(6) = 1·2·4·5 = 40; f_2(4) = 1·3 = 3; f_5(5) = 4! = 24 ≡ −1 (mod 5).
- f_p(N) is not the prime-to-p part of N!: f_2(6) = 15 while 6! = 2⁴·45.

Proof sketch:

1. Define f_p(N) := ∏ over i ∈ Icc 1 N with ¬ p ∣ i of i.
2. Factorial split: the multiples of p up to N are p·1, …, p·⌊N/p⌋, whose product is p^{⌊N/p⌋}·⌊N/p⌋!; the other factors give f_p(N) (Finset.prod_filter_mul_prod_filter_not).
3. Unit property: a product of integers prime to p is prime to p (Nat.Prime.coprime_iff_not_dvd and Nat.coprime_prod_left_iff).

Direct prerequisites: `mathlib:Finset.prod`, `mathlib:Finset.Icc`, `mathlib:Nat.factorial`, `mathlib:Finset.prod_filter_mul_prod_filter_not`, `mathlib:Nat.coprime_prod_left_iff`, `mathlib:Nat.Prime.coprime_iff_not_dvd`.

Suggested Lean: `pFreeFactorial` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*](https://arxiv.org/pdf/1807.04659v5), §7.2.2, definition of f_p before the citation of Luo–Zhu, p. 71, and the unit property in the first case of the proof, p. 72 (arXiv v5). Defines f_p(n) as the product of the integers 1 ≤ i ≤ n prime to p, equal to n!/(p^{[n/p]}[n/p]!), and uses that f_p(p^α) is a unit of ℤ\_p.

Source: [Wei Luo and Shengmao Zhu, *Integrality of the LMOV invariants for framed unknot*](https://arxiv.org/pdf/2106.02882v1), §3, equation (10), p. 6 (arXiv:2106.02882v1). Defines f_p(n) for every nonnegative integer n by the same product and the same factorial quotient.

<a id="CA-2-p-free-factorial-binomial-factorisation"></a>

### Binomial coefficients of multiples of p through the p-free factorial

`ClassicalArithmeticCompletion:CA.2/p-free-factorial-binomial-factorisation` · theorem.

Let p be a prime and f_p the p-free factorial. (a) For n ≥ m ≥ 0: C(np, mp)·f_p(mp)·f_p((n − m)p) = C(n, m)·f_p(np). (b) For n ≥ 1 and m ≥ 0, with generalised binomial coefficients: C(−np, mp)·f_p(mp)·f_p(np) = (−1)^{m(p−1)}·C(−n, m)·f_p(np + mp).

Hypotheses and conventions: p prime; (a) n ≥ m ≥ 0; (b) n ≥ 1, m ≥ 0. The sign (−1)^{m(p−1)} matters only for p = 2.

Acceptance checks:

- p = 2, n = m = 1: C(−2, 2) = 3 = (−1)¹·C(−1, 1)·f_2(4) = (−1)(−1)·3.
- p = 3, n = 2, m = 1: C(6, 3) = 20 and f_3(6)/(f_3(3)²) = 40/4 = 10 = 20/C(2, 1).
- Checked for p ∈ {2, 3, 5, 7}, n < 9, m < 9.

Proof sketch:

1. (a) By the factorial split of p-free-factorial, (kp)! = p^k·k!·f_p(kp) for every k; substitute into C(np, mp) = (np)!/((mp)!((n − m)p)!) and cancel p^n = p^m·p^{n−m}.
2. (b) By Ring.choose_neg, C(−N, M) = (−1)^M·C(N + M − 1, M) for N ≥ 1; and C(N + M − 1, M) = C(N + M, M)·N/(N + M). Apply this to (N, M) = (np, mp) and to (n, m): the ratio C(−np, mp)/C(−n, m) is (−1)^{mp−m}·C((n + m)p, mp)/C(n + m, m), and (a) with (n + m, m) turns this into (−1)^{m(p−1)}·f_p((n + m)p)/(f_p(mp)f_p(np)).

Direct prerequisites: [p-free-factorial](#CA-2-p-free-factorial), `mathlib:Ring.choose_neg`, `mathlib:Nat.choose_mul_factorial_mul_factorial`, `mathlib:Ring.choose_natCast`.

Suggested Lean: `choose_mul_mul_pFreeFactorial`, `ringChoose_neg_mul_pFreeFactorial` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*](https://arxiv.org/pdf/1807.04659v5), §7.2.2, the two displayed identities before the case distinction in the proof of Théorème 7.2.3, p. 71 (arXiv v5). States C(np, mp) = C(n, m)f_p(np)/(f_p(mp)f_p((n − m)p)) and C(−np, mp) = (−1)^{m(p−1)}C(−n, m)f_p(np + mp)/(f_p(mp)f_p(np)), used to compare the l- and lp-terms of the Möbius sum.

<a id="CA-2-luo-zhu-congruence"></a>

### The Luo–Zhu congruence for p-free factorials

`ClassicalArithmeticCompletion:CA.2/luo-zhu-congruence` · theorem · planet: *Luo–Zhu congruence*.

Let p be a prime and α ≥ 1 with p odd or α ≥ 2. For every N ≥ 0: f_p(p^α·N) ≡ f_p(p^α)^N (mod p^{2α}). In the excluded case p = 2, α = 1: f_2(2N) ≡ (−1)^{⌊N/2⌋} (mod 4). The exclusion is necessary: f_2(4) = 3 ≢ 1 = f_2(2)² (mod 4).

Hypotheses and conventions: p prime; α ≥ 1; p ≠ 2 or α ≥ 2 for the main congruence; N ∈ ℕ.

Acceptance checks:

- p = 3, α = 1, N = 2: f_3(6) = 40 ≡ 4 = 2² (mod 9).
- p = 2, α = 2, N = 2: f_2(8) = 105 ≡ 9 = 3² (mod 16).
- Checked for p ∈ {3, 5, 7} with α ≤ 3, p = 2 with α ∈ {2, 3}, and N ≤ 11, and f_2(2N) mod 4 for N < 60; at p = 2, α = 1 the congruence fails exactly for N ≡ 2, 3 (mod 4) in that range.

Proof sketch:

1. Induction on N; N = 0 is f_p(0) = 1. For the step, f_p(p^αN) = f_p(p^α(N − 1))·∏\_{1 ≤ i ≤ p^α, p ∤ i}(p^α(N − 1) + i).
2. Modulo p^{2α} the product is f_p(p^α)·(1 + p^α(N − 1)·Σ\_{i} i^{−1}), the inverses taken modulo p^{2α} (the cross terms carry p^{2α}).
3. Pair i with p^α − i: 1/i + 1/(p^α − i) = p^α/(i(p^α − i)), so p^α divides the sum of inverses. The pairing has no fixed point because p^{α−1}(p − 1), the number of units, is even and i = p^α/2 is not a unit (p odd, or p = 2 with α ≥ 2); for p = 2, α = 1 the sum is 1 and the argument fails.
4. Hence the factor is ≡ f_p(p^α) (mod p^{2α}) and the induction closes.
5. p = 2, α = 1: f_2(2N) is the product of the odd numbers below 2N, of which ⌊N/2⌋ are ≡ 3 (mod 4).

Direct prerequisites: [p-free-factorial](#CA-2-p-free-factorial), `mathlib:Int.ModEq`, `mathlib:ZMod.unitOfCoprime`.

Suggested Lean: `pFreeFactorial_pow_mul_modEq`, `pFreeFactorial_two_two_mul_modEq` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Wei Luo and Shengmao Zhu, *Integrality of the LMOV invariants for framed unknot*](https://arxiv.org/pdf/2106.02882v1), §3, Lemma 3.1 with its proof, pp. 6–7 (arXiv:2106.02882v1). States p^{2α} | f_p(p^αn) − f_p(p^α)^n for p odd, α ≥ 1 or p = 2, α ≥ 2, and f_2(2n) ≡ (−1)^{[n/2]} (mod 4); proves the first by expanding the block product modulo p^{2α} and pairing i with p^α − i.

Source: [Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*](https://arxiv.org/pdf/1807.04659v5), §7.2.2, fact (∗) and the case p = 2, p. 71 (arXiv v5). Quotes the same two congruences as Lemma 3.1 of [LZ16] and uses them in both cases of the proof of Théorème 7.2.3.

Source: [Wei Luo and Shengmao Zhu, *Integrality structures in topological strings I: framed unknot*](https://arxiv.org/pdf/1611.06506v1), §4, Lemma 4.6 with its proof, pp. 16–17 (arXiv:1611.06506v1). The earlier preprint states the same lemma; its expansion carries a misprint (sourceIssues).

## 3. Elliptic divisibility sequences and Ward's theorem

Tau Ceti proves that normEDS b c d is an elliptic net and a divisibility sequence. Ward's theorem upgrades divisibility to strong divisibility, gcd(W_m, Wₙ) = |W_{gcd(m,n)}|, exactly when gcd(W₃, W₄) = 1. The route planned here is geometric. The explicit curve E_{b,c,d} has the point (0, 0) with ψₙ(0, 0) = normEDS b c d n on the nose, for any field and without an ellipticity hypothesis. Tau Ceti's theorem that n·P has Jacobian coordinates (φₙ : ωₙ : ψₙ)(P) on any Weierstrass curve gives the zero set over a field and Ayad's coprimality of φₙ and ψₙ at a nonsingular point. At a prime p not dividing bc the curve is p-integral with P integral and nonsingular modulo p, so v_p(Wₙ) is the filtration level of nP, and the filtration E_k(ℚ\_p) of an arbitrary integral equation consists of subgroups. This proves the subgroup property of {n : p^V | Wₙ} at those primes. The primes dividing bc are different in kind: there the point can have singular reduction on every integral model, and the theorem at those primes, together with the singular curves, is the gap of §6.

<a id="CA-2-eds-attached-curve"></a>

### The Weierstrass curve of a normalised elliptic divisibility sequence

`ClassicalArithmeticCompletion:CA.2/eds-attached-curve` · construction.

Let K be a field and b, c, d ∈ K with b ≠ 0, c ≠ 0. The curve E_{b,c,d} is the Weierstrass curve with a₁ = (d + b⁴)/(bc), a₂ = c/b², a₃ = b, a₄ = a₆ = 0, that is y² + ((d + b⁴)/(bc))xy + by = x³ + (c/b²)x². The point P = (0, 0) lies on it and is nonsingular (∂/∂y at P is a₃ = b ≠ 0), and the division polynomials of Mathlib evaluated at P are the normalised EDS: ψₙ(P) = normEDS b c d n for every n ∈ ℤ. Its discriminant is Δ(E_{b,c,d}) = −D(b, c, d)/(b⁴c³) with D(b, c, d) = d b¹² + (3d² − c³)b⁸ + (3d³ − 20c³d)b⁴ + 16c⁶ + 8c³d² + d⁴. The curve may be singular (Δ = 0); P is always a nonsingular point.

Hypotheses and conventions: K a field; b ≠ 0 and c ≠ 0 (a nondegenerate sequence: W₂W₃ ≠ 0). In normEDS form W₄ = db, so W₂ | W₄ is built in. No hypothesis on Δ: the identification ψₙ(P) = Wₙ is a polynomial identity and holds on singular cubics.

Uses:

- CA.2/eds-zero-set-is-a-subgroup: zeros of the sequence over a field are the n with n·P = O.
- CA.2/eds-strong-divisibility-at-good-primes: at a prime p ∤ bc the curve is p-integral, P is integral and nonsingular modulo p, and p-adic valuations of Wₙ become filtration levels of nP.
- Silverman, p-adic properties of division polynomials, Proposition 18 and Theorem 20: the comparison of an EDS with division polynomials on a minimal model, which this explicit model makes unnecessary at primes not dividing bc.

API:

- `edsCurve` (data): E_{b,c,d} with a₁ = (d + b⁴)/(bc), a₂ = c/b², a₃ = b, a₄ = a₆ = 0.
- `edsCurve_nonsingular` (constructor): For b ≠ 0, (0, 0) is a nonsingular point of E_{b,c,d}.
- `evalEval_ψ₂_edsCurve` (simp): ψ₂(0, 0) = b.
- `eval_Ψ₃_edsCurve` (simp): For b ≠ 0, Ψ₃(0) = c.
- `eval_preΨ₄_edsCurve` (simp): For b, c ≠ 0, preΨ₄(0) = d.
- `evalEval_ψ_edsCurve` (characterisation): For b, c ≠ 0 and n ∈ ℤ, ψₙ(0, 0) = normEDS b c d n.
- `Δ_edsCurve` (relation): Δ(E_{b,c,d}) = −D(b, c, d)/(b⁴c³).
- `map_edsCurve` (functoriality): (E_{b,c,d}).map f = E_{f b, f c, f d} for a ring homomorphism of fields f.

Unit tests:

- `Δ_edsCurve_two_three_two` (degenerate): Δ(E_{2,3,2}) = 0: the identity sequence comes from a cuspidal cubic, so no ellipticity hypothesis may be built into the construction.
- `Δ_edsCurve_one_neg_one_one` (computation): Δ(E_{1,−1,1}) = 37.
- `edsCurve_one_neg_one_one_coeffs` (computation): E_{1,−1,1} has a₁ = −2 and a₂ = −1 (so y ↦ y + x gives y² + y = x³ − x).
- `evalEval_ψ_edsCurve_two_three_two` (compatibility): ψₙ(0, 0) = n on E_{2,3,2}, matching Tau Ceti's normEDS_two_three_two_eq_id.
- `normEDS_one_neg_one_one_values` (computation): normEDS 1 (−1) 1 at 0, …, 10 is 0, 1, 1, −1, 1, 2, −1, −3, −5, 7, −4.

Acceptance checks:

- b = 1, c = −1, d = 1: a₁ = −2, a₂ = −1, a₃ = 1; the substitution y ↦ y + x turns it into y² + y = x³ − x (conductor 37), with Δ = 37, and the sequence is 0, 1, 1, −1, 1, 2, −1, −3, −5, 7, −4, … (Silverman, Example 1).
- b = 2, c = 3, d = 2: Δ = 0 (a cusp: c₄ = 0 as well) and normEDS 2 3 2 = id (Tau Ceti normEDS_two_three_two_eq_id).
- Δ(E_{1,3,1}) = −11321/27 and Δ(E_{3,1,1}) = −543211/81, matching −D/(b⁴c³).

Proof sketch:

1. Compute at P: ψ₂(P) = 2·0 + a₁·0 + a₃ = b; Ψ₃(0) = b₈ = a₁²a₆ + 4a₂a₆ − a₁a₃a₄ + a₂a₃² − a₄² = (c/b²)·b² = c; preΨ₄(0) = b₄b₈ − b₆² = (a₁b)·c − b⁴ = d, since b₄ = 2a₄ + a₁a₃ = a₁b and b₆ = a₃² = b².
2. Mathlib defines ψₙ = normEDS ψ₂ (C Ψ₃) (C preΨ₄) n in R[X][Y] (WeierstrassCurve.ψ); evaluation at (0, 0) is the ring homomorphism Polynomial.evalEvalRingHom 0 0, and map_normEDS carries normEDS through it, giving ψₙ(P) = normEDS b c d n.
3. Nonsingularity: WeierstrassCurve.Affine.nonsingular_zero (P = (0, 0) is nonsingular iff a₆ = 0 and (a₃ ≠ 0 or a₄ ≠ 0)).
4. The discriminant formula is a direct computation of Δ = −b₂²b₈ − 8b₄³ − 27b₆² + 9b₂b₄b₆ (checked on the values below); D is Ward's discriminant polynomial as printed by Silverman–Stephens, Appendix A (31), up to the factor 2⁸3¹²b⁸c⁹ of their short model.
5. Base change: the coefficients are rational functions of b, c, d, so (E_{b,c,d}).map f = E_{f b, f c, f d} for a field homomorphism f.

Direct prerequisites: `mathlib:WeierstrassCurve.ψ`, `mathlib:WeierstrassCurve.ψ₂`, `mathlib:WeierstrassCurve.Ψ₃`, `mathlib:WeierstrassCurve.preΨ₄`, `mathlib:WeierstrassCurve.b₈`, `mathlib:WeierstrassCurve.Δ`, `mathlib:normEDS`, `mathlib:map_normEDS`, `mathlib:Polynomial.evalEvalRingHom`, `mathlib:WeierstrassCurve.Affine.nonsingular_zero`, `mathlib:WeierstrassCurve.map`, `tauceti:normEDS_two_three_two_eq_id`.

Suggested Lean: `edsCurve` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), §3, Theorem 8 and the paragraph after it, p. 8 (arXiv v4). States Ward's theorem, as updated by Shipsey and Stange, over a field of characteristic zero: Ψₙ(P) on a cubic Weierstrass curve is an EDS, and every EDS with W₂W₃ ≠ 0, W₁ = 1 is Ψₙ(P) for some cubic Weierstrass curve E/K and P ∈ E(K) (Ward, Theorem 12.1; Shipsey; Stange). The source gives no explicit curve; the curve of this node is checked by the direct computation of the proof sketch, over every field.

Source: [Joseph H. Silverman and Nelson Stephens, *The sign of an elliptic divisibility sequence*](https://arxiv.org/pdf/math/0402415v1), Appendix A, (27)–(31), pp. 16–17 (arXiv:math/0402415v1). Gives Ward's explicit short Weierstrass model Y² = X³ + AX + B and point (x, y) for the EDS 1, α, β, αγ, …, with the discriminant (31).

Source: [Joseph H. Silverman and Katherine E. Stange, *Terms in elliptic divisibility sequences divisible by their indices*](https://arxiv.org/pdf/1001.5303v1), Remark 28, p. 24 (arXiv:1001.5303v1). Recalls the recursive definition of EDS normalised by W₁ = 1 and W₂ | W₄, their integrality, and Ward's association with a curve and point satisfying Wₙ = ψₙ(P).

<a id="CA-2-division-polynomials-at-a-nonsingular-point"></a>

### Division polynomials at a nonsingular point

`ClassicalArithmeticCompletion:CA.2/division-polynomials-at-a-nonsingular-point` · theorem.

Let W be a Weierstrass curve over a field F (possibly singular) and P = (x, y) a nonsingular affine point. For every n ∈ ℤ: (a) ψₙ(P) = 0 if and only if n·P = O in the group of nonsingular points; (b) φₙ(P) and ψₙ(P) are not both 0 (Ayad's coprimality); (c) if ψₙ(P) ≠ 0 then n·P = (φₙ(P)/ψₙ(P)², ωₙ(P)/ψₙ(P)³).

Hypotheses and conventions: F a field; P nonsingular. No hypothesis on Δ(W), on n or on the characteristic.

Acceptance checks:

- On y² + y = x³ − x with P = (0, 0) (order ∞), ψ₅(P) = 2 ≠ 0, so 5P = (φ₅/4, ω₅/8) is affine; over 𝔽₂, ψ₅ vanishes and 5P̃ = O.
- For the 2-torsion point (0, 0) of y² = x³ − x: ψ₂ = 2y vanishes there and φ₂(P) = 1 ≠ 0.

Proof sketch:

1. Tau Ceti's zsmul_point_eq_smulEval: the Jacobian coordinates of n·P are the triple (φₙ(P) : ωₙ(P) : ψₙ(P)) for every n, with no hypothesis on the characteristic.
2. This triple represents a nonsingular Jacobian point, hence is a nonsingular triple. A nonsingular Jacobian triple is the point at infinity exactly when its Z-coordinate vanishes, and then its X-coordinate is nonzero (WeierstrassCurve.Jacobian.X_ne_zero_of_Z_eq_zero); this gives (a) and (b).
3. (c) A nonsingular Jacobian triple with Z ≠ 0 is the affine point (X/Z², Y/Z³).

Direct prerequisites: `tauceti:WeierstrassCurve.zsmul_point_eq_smulEval`, `tauceti:WeierstrassCurve.smulEval`, `mathlib:WeierstrassCurve.Jacobian.X_ne_zero_of_Z_eq_zero`, `mathlib:WeierstrassCurve.Jacobian.nonsingular_of_Z_eq_zero`, `mathlib:WeierstrassCurve.Jacobian.Point.fromAffine`, `mathlib:WeierstrassCurve.φ`, `tauceti:WeierstrassCurve.ω`.

Suggested Lean: `evalEval_ψ_eq_zero_iff`, `evalEval_φ_ne_zero_or_evalEval_ψ_ne_zero`, `zsmul_some_eq_some_of_evalEval_ψ_ne_zero` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), §2, Proposition 5 and the multiplication-by-n formulas, pp. 6–7 (arXiv v4). States that a point of an elliptic curve is a nontrivial n-torsion point iff Ψₙ vanishes there, and the formula [n]P = (φₙ/Ψₙ², ωₙ/Ψₙ³).

Source: [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), §6, proof of Theorem 14, p. 13 (arXiv v4). Quotes Ayad's Theorem A: for a point of nonzero nonsingular reduction, at least one of v(Ψₙ) and v(φₙ) is zero for each n — the reduction of statement (b).

<a id="CA-2-eds-zero-set-is-a-subgroup"></a>

### The zeros of a nondegenerate EDS over a field

`ClassicalArithmeticCompletion:CA.2/eds-zero-set-is-a-subgroup` · theorem.

Let K be a field and b, c ∈ K with b ≠ 0, c ≠ 0, d ∈ K. Then {n ∈ ℤ : normEDS b c d n = 0} = rℤ, where r is the order of P = (0, 0) in the group of nonsingular points of E_{b,c,d}(K) (r = 0 if P has infinite order). In particular, for a prime p ∤ bc and an integral normalised EDS W, p | Wₙ if and only if r_p | n, with r_p the order of P mod p (the rank of apparition).

Hypotheses and conventions: K a field, b ≠ 0, c ≠ 0 in K. For the reading mod p, b, c, d ∈ ℤ and the reductions of b and c are nonzero.

Acceptance checks:

- Over 𝔽₂ the sequence 1, 1, −1, 1, 2, … of y² + y = x³ − x reads 1, 1, 1, 1, 0, …: its zeros are 5ℤ, the order of (0, 0) in E(𝔽₂).
- Over ℚ, normEDS 2 3 2 = id vanishes only at 0: P has infinite order on the cusp curve.

Proof sketch:

1. By eds-attached-curve, normEDS b c d n = ψₙ(P) on E_{b,c,d} with P nonsingular.
2. By division-polynomials-at-a-nonsingular-point (a), ψₙ(P) = 0 iff n·P = O, iff the additive order of P divides n (orderOf_dvd_iff_zpow_eq_one in its additive form addOrderOf_dvd_iff_zsmul_eq_zero).
3. For p ∤ bc apply this over 𝔽\_p to the reduced parameters, using map_normEDS for the reduction ℤ → 𝔽\_p.

Direct prerequisites: [eds-attached-curve](#CA-2-eds-attached-curve), [division-polynomials-at-a-nonsingular-point](#CA-2-division-polynomials-at-a-nonsingular-point), `mathlib:orderOf_dvd_iff_zpow_eq_one`, `mathlib:map_normEDS`.

Suggested Lean: `normEDS_eq_zero_iff` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Joseph H. Silverman, *p-adic properties of division polynomials and elliptic divisibility sequences*](https://arxiv.org/pdf/math/0404412v1), §3, Theorem 8, p. 6 (arXiv:math/0404412v1). For an elliptic curve over a finite field and a point P of exact order r ≥ 2, gives F_{kr+n}(P) = a^{kn}b^{k²}Fₙ(P) with units a, b (and F_{2k}(P) = 0 when r = 2); since F₀ = 0 and Fₙ(P) ≠ 0 for 0 < n < r, the sequence vanishes exactly at the multiples of r.

Source: [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), §2, Proposition 5, p. 7 (arXiv v4). Vanishing of Ψₙ at P characterises nontrivial n-torsion.

<a id="CA-2-reduction-filtration-of-an-integral-weierstrass-equation"></a>

### The filtration E_k(ℚ\_p) for an arbitrary integral Weierstrass equation

`ClassicalArithmeticCompletion:CA.2/reduction-filtration-of-an-integral-weierstrass-equation` · theorem.

Let p be a prime and W a Weierstrass equation with coefficients in ℤ\_p, not necessarily minimal, with Δ(W) ≠ 0. For k ≥ 1 let E_k(ℚ\_p) = {O} ∪ {(x, y) ∈ W(ℚ\_p) : v_p(x) ≤ −2k}. Then each E_k(ℚ\_p) is a subgroup of W(ℚ\_p), E_k/E_{k+1} ≅ 𝔽\_p, and for (x, y) ∈ E_1 the parameter z = −x/y has v_p(z) = −v_p(x)/2. Consequently, for a point Q and a homomorphism n ↦ nQ from ℤ, {n : nQ ∈ E_k} is a subgroup of ℤ.

Hypotheses and conventions: p prime; W has coefficients in ℤ\_p (any integral model); Δ(W) ≠ 0 as in the source, which treats elliptic curves.

Acceptance checks:

- BLRN, Remark 2.5: E: y² + xy = x³ + 4x + 1, P = (15/4, −83/8) ∈ E_1(ℚ₂) with v₂(P) = 1 and v₂(2P) = 4: the quotients E_k/E_{k+1} are 𝔽₂ but E_1(ℚ₂) has 2-torsion, so the valuation is not v(P) + v₂(n) in general.
- For W: y² = x³ − p¹²x (not minimal at p), the substitution x = p⁶x′, y = p⁹y′ identifies it with y′² = x′³ − x′, and E_k(W) = E′\_{k+3} because v(x) = v(x′) + 6.

Proof sketch:

1. The formal group Ê of the Weierstrass equation has coefficients in ℤ\_p (it is defined from the a_i universally); for z ∈ pℤ\_p the series w(z) converges and z ↦ (z/w(z), −1/w(z)) is an isomorphism Ê(pℤ\_p) → E_1(ℚ\_p) with v(z) = −v(x)/2 (Streng, Lemma III.2.1; Silverman AEC VII.2.2 for a minimal equation; Tau Ceti's EllipticCurves Layer 1, milestone (iv), plans this identification for an integral model).
2. Ê(p^kℤ\_p) is a subgroup of Ê(pℤ\_p), and its image is E_k(ℚ\_p); Ê(p^k)/Ê(p^{k+1}) ≅ p^kℤ\_p/p^{k+1}ℤ\_p ≅ 𝔽\_p (Streng, Lemma III.2.3).
3. The last sentence is the preimage of a subgroup under a homomorphism.
4. Tau Ceti's EllipticCurves roadmap, Layer 1, plans the elliptic formal group law (milestone (i)), the group Ê(𝔪) over a complete valued field (iii) and the identification Ê(𝔪) ≅ E₁(K) for an integral model (iv); its Layer 4 works from a minimal equation and is not used here. This node adds the finer filtration E_k, k ≥ 1, and its quotients for an arbitrary integral equation (AEC VII, Exercise 7.4, as solved in Streng, Lemma III.2.3).

Direct prerequisites: `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `mathlib:PadicInt`, `mathlib:Padic`, `mathlib:WeierstrassCurve.baseChange`.

Suggested Lean: `exists_addSubgroup_filtration` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Marco Streng, *Elliptic divisibility sequences with complex multiplication*](https://pub.math.leidenuniv.nl/~strengtc/mthesis.pdf), Chapter III, §2 (opening paragraph, Lemma 2.1, §2.3 and Lemma 2.3), pp. 16–18. Repeats AEC VII §2 for any Weierstrass equation with integral coefficients, not only a minimal one: E_1(K) ≅ Ê(M) via z = −x/y with v(z) = −v(x)/2, the sets E_n(K) = {v(x) ≤ −2n} ∪ {O} are subgroups, and E_n/E_{n+1} ≅ k⁺.

Source: [Subham Bhakta, Daniel Loughran, Simon L. Rydin Myerson and Masahiro Nakahara, *The elliptic sieve and Brauer groups*](https://arxiv.org/pdf/2109.03746), §2, the opening paragraph, Definition 2.1 and Lemma 2.3, p. 7 (arXiv:2109.03746). Works with a not necessarily minimal Weierstrass equation over ℤ\_p, uses the subgroup filtration E_i(ℚ\_p), and proves v_p(P) = max{0, −v_p(x)/2}.

<a id="CA-2-eds-strong-divisibility-at-good-primes"></a>

### Strong divisibility of an integral EDS at primes not dividing W₂W₃

`ClassicalArithmeticCompletion:CA.2/eds-strong-divisibility-at-good-primes` · theorem.

Let b, c, d ∈ ℤ with b ≠ 0, c ≠ 0, W = normEDS b c d, and p a prime with p ∤ b and p ∤ c, such that E_{b,c,d} is nonsingular (Δ(E_{b,c,d}) ≠ 0). Then for every V ≥ 0 the set {n ∈ ℤ : p^V | Wₙ} is a subgroup of ℤ, and for all m, n ∈ ℤ the p-adic multiplicity satisfies v_p(W_{gcd(m,n)}) = min(v_p(W_m), v_p(W_n)) (with v_p(0) = ∞). For V ≥ 1, p^V | Wₙ holds exactly when nP ∈ E_V(ℚ\_p), P = (0, 0) on E_{b,c,d}.

Hypotheses and conventions: b, c, d ∈ ℤ, bc ≠ 0; p prime, p ∤ bc; Δ(E_{b,c,d}) ≠ 0. No coprimality hypothesis is needed at such primes.

Acceptance checks:

- W = normEDS 1 (−1) 1 (curve 37a1), p = 2: v₂(Wₙ) is 0 unless 5 | n, and the multiples of 5 carry the valuations of 5P ∈ E_1(ℚ₂).
- W = normEDS 3 2 5, p = 5 (p ∤ bc, 5 | d, Δ ≠ 0): {n : 5 | Wₙ} = 4ℤ and {n : 25 | Wₙ} = 20ℤ within n ≤ 40.

Proof sketch:

1. Since p ∤ bc, the coefficients a₁ = (d + b⁴)/(bc), a₂ = c/b², a₃ = b of E = E_{b,c,d} lie in ℤ\_(p), P = (0, 0) is integral, and P is nonsingular modulo p because a₃ = b is a p-unit. By eds-attached-curve, Wₙ = ψₙ(P), and φₙ(P), ψₙ(P) ∈ ℤ\_(p).
2. Reduction: the division polynomials have coefficients in ℤ[a₁, …, a₆] (WeierstrassCurve.map_ψ, map_φ), so their values at P reduce to those of the reduced curve at P̃. By division-polynomials-at-a-nonsingular-point (b) over 𝔽\_p, p does not divide both φₙ(P) and ψₙ(P).
3. By division-polynomials-at-a-nonsingular-point (c) over ℚ\_p, if Wₙ ≠ 0 then x(nP) = φₙ(P)/ψₙ(P)²; so x(nP) is p-integral when p ∤ Wₙ, and v_p(x(nP)) = −2v_p(Wₙ) when p | Wₙ. If Wₙ = 0 then nP = O. Hence for V ≥ 1, p^V | Wₙ iff nP ∈ E_V(ℚ\_p).
4. By reduction-filtration-of-an-integral-weierstrass-equation (applied to the ℤ\_p-model E), {n : nP ∈ E_V} is a subgroup of ℤ; for V = 0 the set is ℤ.
5. Bezout and the subgroup property give min(v_p W_m, v_p W_n) ≤ v_p W_{gcd(m,n)}; the reverse inequality is divisibility W_{gcd} | W_m, W_n (Tau Ceti isDvdSequence_normEDS).

Direct prerequisites: [eds-attached-curve](#CA-2-eds-attached-curve), [division-polynomials-at-a-nonsingular-point](#CA-2-division-polynomials-at-a-nonsingular-point), [reduction-filtration-of-an-integral-weierstrass-equation](#CA-2-reduction-filtration-of-an-integral-weierstrass-equation), `mathlib:WeierstrassCurve.map_ψ`, `mathlib:WeierstrassCurve.map_φ`, `tauceti:isDvdSequence_normEDS`, `mathlib:emultiplicity`, `mathlib:Int.gcd_eq_gcd_ab`.

Suggested Lean: `normEDS_dvd_iff_mem_addSubgroup`, `emultiplicity_normEDS_gcd` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Subham Bhakta, Daniel Loughran, Simon L. Rydin Myerson and Masahiro Nakahara, *The elliptic sieve and Brauer groups*](https://arxiv.org/pdf/2109.03746), §3.1, Lemmas 3.4 and 3.5 with their proofs, p. 9 (arXiv:2109.03746). For the normalised denominator sequence βₙ of a point on an integral model, proves v_p(βₙ) = v_p(nP) − v_p(P) and deduces gcd(β\_m, βₙ) = |β\_{gcd(m,n)}| from the subgroup filtration; it notes that the division-polynomial sequence need not be strongly divisible when P has bad reduction.

Source: [Marco Streng, *Elliptic divisibility sequences with complex multiplication*](https://pub.math.leidenuniv.nl/~strengtc/mthesis.pdf), Chapter IV, §3, Lemma 3.1 with its proof, p. 38. Proves that the denominator sequence of the multiples of a point on an integral Weierstrass equation is a strong divisibility sequence, by Bezout and the groups E_r.

Source: [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), §6, proof of Theorem 14, p. 13 (arXiv v4). For P of nonzero nonsingular reduction, uses Ayad's theorem to identify v(Ψ\_{kn_P}) with the valuation of the formal-group parameter of [kn_P]P.

<a id="CA-2-ward-strong-divisibility"></a>

### Ward's strong divisibility theorem for elliptic divisibility sequences

`ClassicalArithmeticCompletion:CA.2/ward-strong-divisibility` · theorem · planet: *Ward's strong divisibility theorem*.

Let b, c, d ∈ ℤ with b ≠ 0 and c ≠ 0, and W = normEDS b c d, the nondegenerate integral EDS with W₀ = 0, W₁ = 1, W₂ = b, W₃ = c, W₄ = db (so W₂ | W₄). Then W is a strong divisibility sequence, gcd(W_m, Wₙ) = |W_{gcd(m,n)}| for all m, n ∈ ℤ, if and only if gcd(W₃, W₄) = 1, i.e. c is coprime to db. Equivalently n ↦ |Wₙ| is a strong divisibility sequence on ℕ (Mathlib's Nat.IsStrongDvdSequence).

Hypotheses and conventions: b, c, d ∈ ℤ with bc ≠ 0 (nondegenerate: W₂W₃ ≠ 0). The coprimality gcd(W₃, W₄) = 1 is necessary: strong divisibility at (3, 4) says gcd(W₃, W₄) = |W₁| = 1. It cannot be dropped: normEDS 1 (−6) (−6) = 0, 1, 1, −6, −6, 210, −1044, … has gcd(W₃, W₄) = 6. Absolute values are needed: Wₙ can be negative (W₃ = −1 for the curve 37a1).

Acceptance checks:

- normEDS 2 3 2 = id: the theorem reads gcd(m, n) = gcd(m, n).
- normEDS 1 (−1) 1 (curve 37a1): W₅ = 2, W₁₀ = −4, W₁₅ = −314, and gcd(W₁₀, W₁₅) = 2 = |W₅|.
- normEDS 1 (−6) (−6): gcd(W₃, W₄) = 6 ≠ 1 = |W₁|, so the coprimality hypothesis is sharp.
- Numerically: for b ∈ [−6, 6] ∖ {0} and c, d ∈ [−8, 8], c ≠ 0, the 1552 sequences with gcd(c, db) = 1 satisfy gcd(W_m, Wₙ) = |W_{gcd(m,n)}| for 1 ≤ m, n ≤ 24.

Proof sketch:

1. Ward's sequences are the normEDS: normEDS b c d satisfies the elliptic net relations (Tau Ceti isEllipticNet_normEDS), hence the EDS recursion, with W₀, …, W₄ = 0, 1, b, c, db; an EDS with W₁ = 1 and W₂W₃ ≠ 0 is determined by W₂, W₃, W₄, and such a triple gives an integral EDS exactly when W₂ | W₄ (Silverman–Stephens, §1, p. 3), so every normalised nondegenerate integral EDS is normEDS b c d for some b, c, d ∈ ℤ with bc ≠ 0.
2. Necessity: put m = 3, n = 4.
3. Sufficiency, prime by prime: it suffices that for every prime p, min(v_p W_m, v_p Wₙ) = v_p W_{gcd(m,n)}. The inequality ≥ in the other direction is divisibility (Tau Ceti isDvdSequence_normEDS).
4. Primes p ∤ bc with Δ(E_{b,c,d}) ≠ 0: eds-strong-divisibility-at-good-primes.
5. Primes p | bc: by the coprimality, p divides exactly one of b, c, and p ∤ d when p | c. At such primes the point P = (0, 0) can have singular reduction on every integral model of E_{b,c,d}, and the valuations v_p(Wₙ) are then not filtration levels of nP (for b = 1, c = 3, d = 1 and p = 3, where 3 ∤ d + b⁴, no integral model carries P as an integral nonsingular point with Wₙ = ψₙ(P) up to a unit, and v₃(Wₙ) is 0 for 3 ∤ n, 1 for n ≡ 3 (mod 6) and 4 + v₃(n/6) for 6 | n, checked to n = 110 — the sets {n : 3^V | Wₙ} are 3ℤ, 6ℤ, 6ℤ, 6ℤ, 18ℤ, … but the jump from 1 to 4 is not a formal-group pattern). The theorem asserts that the sets {n : p^V | Wₙ} are still subgroups; this case and the singular case Δ(E_{b,c,d}) = 0 are the recorded gap 'Ward's strong divisibility at primes dividing W₂W₃ and for singular attached curves'.
6. Assemble over all primes: |W_{gcd(m,n)}| and gcd(W_m, Wₙ) have the same p-adic valuation for every p and are nonnegative.

Direct prerequisites: [eds-strong-divisibility-at-good-primes](#CA-2-eds-strong-divisibility-at-good-primes), [eds-attached-curve](#CA-2-eds-attached-curve), `tauceti:isDvdSequence_normEDS`, `tauceti:isEllipticNet_normEDS`, `mathlib:Nat.IsStrongDvdSequence`, `mathlib:IsCoprime`, `mathlib:Int.isCoprime_iff_gcd_eq_one`.

Suggested Lean: `ward_strong_divisibility`, `isCoprime_of_strong_divisibility`, `isStrongDvdSequence_natAbs_normEDS` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Joseph H. Silverman and Katherine E. Stange, *Terms in elliptic divisibility sequences divisible by their indices*](https://arxiv.org/pdf/1001.5303v1), Remark 28, p. 24 (arXiv:1001.5303v1). Recalls Ward's recursive EDS, normalised by W₁ = 1 and W₂ | W₄, and Ward's association with a curve; the arithmetic theory is attributed to Ward's memoir.

Source: [Joseph H. Silverman, *p-adic properties of elliptic divisibility sequences (lecture slides)*](https://www.math.brown.edu/johsilve/Presentations/ICMSEDSLecture.pdf), slide 1, 'Elliptic Divisibility Sequences As Recursions' (ICMS workshop, Edinburgh, 27 June 2007). States that an integral EDS with W₂W₃ ≠ 0 and W₂ | W₄ is a strong divisibility sequence; the coprimality of W₃ and W₄ is missing there (sourceIssues).

Source: [Subham Bhakta, Daniel Loughran, Simon L. Rydin Myerson and Masahiro Nakahara, *The elliptic sieve and Brauer groups*](https://arxiv.org/pdf/2109.03746), §3.1, Lemma 3.5 and the remark after it, p. 9 (arXiv:2109.03746). Strong divisibility of the normalised denominator sequence, with the warning that the division-polynomial sequence need not be strongly divisible when P has bad reduction — the primes this theorem's gap concerns.

Source: [Joseph H. Silverman and Nelson Stephens, *The sign of an elliptic divisibility sequence*](https://arxiv.org/pdf/math/0402415v1), §1, p. 3 (arXiv:math/0402415v1). An EDS is determined by W₂, W₃, W₄ through its two duplication recursions, and a triple with W₂W₃ ≠ 0 gives an EDS exactly when W₂ | W₄ (attributed to Ward).

## 4. Suppliers for steps of earlier CA.2 targets

Three steps of earlier CA.2 targets had no supplier at the pins. The formal identity sec + tan of the Euler numbers uses the formal derivatives of sine and cosine and sin² + cos² = 1, which the pinned Mathlib lacks. The analytic Bernoulli and secant-plus-tangent theorems assert exact radii 2π and π/2, whose divergence halves follow from the size of B₂ₖ through ζ(2k). At assembly these nodes become prerequisites of `secant-plus-tangent-formal-identity`, `bernoulli-generating-function-on-its-disc` and `secant-plus-tangent-on-its-disc` respectively; they also settle the boundary circles, which the earlier signatures leave open.

<a id="CA-2-formal-sine-cosine-identities"></a>

### Formal derivatives of sine and cosine and the Pythagorean identity

`ClassicalArithmeticCompletion:CA.2/formal-sine-cosine-identities` · lemma.

For every commutative ℚ-algebra A, in A⟦X⟧ with Mathlib's PowerSeries.sin A, PowerSeries.cos A and the formal derivative d/dX: (a) d/dX sin = cos; (b) d/dX cos = −sin; (c) sin² + cos² = 1.

Hypotheses and conventions: A a commutative ring with an algebra structure over ℚ (so that the coefficients ±1/n! exist); no convergence is involved.

Acceptance checks:

- The coefficient of X² of cos is −1/2 and of X³ of sin is −1/6.
- These are exactly the formal facts the step 'tan′ = 1 + tan², sec′ = tan·sec' of CA.2/secant-plus-tangent-formal-identity uses.

Proof sketch:

1. (a), (b): compare coefficients with PowerSeries.coeff_derivative: the n-th coefficient of d/dX f is (n + 1)·coeff_{n+1}(f); for sin this is (n + 1)·[n even]·(−1)^{n/2}/(n + 1)! = [n even]·(−1)^{n/2}/n!, the n-th coefficient of cos; for cos it is −[n odd]·(−1)^{(n−1)/2}/n!, that of −sin.
2. (c): f = sin² + cos² has d/dX f = 2 sin cos − 2 cos sin = 0 by (a), (b) and the Leibniz rule of the derivation, and constant coefficient 0 + 1 = 1; PowerSeries.derivative.ext, whose hypothesis IsAddTorsionFree A holds because A is a ℚ-module (IsAddTorsionFree.of_module_rat, a lemma rather than an instance), gives f = 1.

Direct prerequisites: `mathlib:PowerSeries.sin`, `mathlib:PowerSeries.cos`, `mathlib:PowerSeries.derivative`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.derivative.ext`, `mathlib:IsAddTorsionFree.of_module_rat`.

Suggested Lean: `derivative_sin`, `derivative_cos`, `sin_sq_add_cos_sq` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), §1.6.1, proof of Proposition 1.6.1, pp. 54–55. Reduces Proposition 1.6.1 (the exponential generating function of the Euler numbers is sec x + tan x) to the equation 2y′ = y² + 1 with y(0) = 1 and states that sec x + tan x is its unique solution; that sec x + tan x solves the equation rests on the derivatives of sin and cos and on sin² + cos² = 1, which the source takes as known.

<a id="CA-2-bernoulli-coefficients-do-not-decay"></a>

### The Bernoulli series diverges on and beyond |z| = 2π

`ClassicalArithmeticCompletion:CA.2/bernoulli-coefficients-do-not-decay` · lemma.

(a) For k ≥ 1: |B_{2k}|·(2π)^{2k}/(2k)! = 2ζ(2k) ≥ 2. (b) For z ∈ ℂ with |z| ≥ 2π, the terms B_n zⁿ/n! do not tend to 0, so Σ\_n B_n zⁿ/n! is not summable (Mathlib's bernoulli, B₁ = −1/2).

Hypotheses and conventions: k ≥ 1 in (a); |z| ≥ 2π in (b). This includes the boundary circle, which the analytic theorem's radius statement leaves open.

Acceptance checks:

- k = 1: |B₂|(2π)²/2! = (1/6)·4π²/2 = π²/3 = 2ζ(2).
- Together with CA.2/bernoulli-generating-function-on-its-disc this pins the radius at exactly 2π and decides the boundary circle (divergent), which the parent signature not_summable_bernoulli_mul_pow (strict 2π < |z|) leaves open.

Proof sketch:

1. (a) Mathlib's hasSum_zeta_nat: Σ\_{n≥1} 1/n^{2k} = (−1)^{k+1}2^{2k−1}π^{2k}B_{2k}/(2k)!; the left side is ζ(2k) > 1, so (−1)^{k+1}B_{2k} > 0 and |B_{2k}|(2π)^{2k}/(2k)! = 2ζ(2k) ≥ 2 (DLMF (24.9.8) gives the slightly stronger lower bound 2/(1 − 2^{−2k})).
2. (b) For |z| ≥ 2π, |B_{2k}z^{2k}/(2k)!| ≥ |B_{2k}|(2π)^{2k}/(2k)! ≥ 2 for every k ≥ 1, so the terms do not tend to 0 (Summable.tendsto_atTop_zero, the additive form of Multipliable.tendsto_atTop_one).

Direct prerequisites: `mathlib:hasSum_zeta_nat`, `mathlib:bernoulli`, `mathlib:Multipliable.tendsto_atTop_one`.

Suggested Lean: `two_le_abs_bernoulli_mul_div`, `not_summable_bernoulli_mul_pow_of_le` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [F. W. J. Olver et al. (eds.), *NIST Digital Library of Mathematical Functions, §24.9 Inequalities*](https://dlmf.nist.gov/24.9), §24.9, (24.9.8), retrieved 2026-10-14. For n ≥ 1, bounds (−1)^{n+1}B_{2n} below by 2(2n)!/(2π)^{2n} times 1/(1 − 2^{−2n}), and above by the same quantity times 1/(1 − 2^{β−2n}) with β = 2 + log₂(1 − 6/π²) ≈ 0.649 (24.9.9).

<a id="CA-2-tangent-coefficients-do-not-decay"></a>

### The secant-plus-tangent series diverges on and beyond |z| = π/2

`ClassicalArithmeticCompletion:CA.2/tangent-coefficients-do-not-decay` · lemma.

Let e : ℕ → ℚ be any sequence whose odd terms are the tangent numbers in their Bernoulli closed form, e(2n + 1) = (−1)ⁿ2^{2n+2}(2^{2n+2} − 1)B_{2n+2}/(2n + 2) (for the Euler zigzag numbers this is the API item zigzag_odd_eq_bernoulli of CA.2/euler-zigzag-numbers). Then for z ∈ ℂ with |z| ≥ π/2 the terms e(n)zⁿ/n! do not tend to 0, so Σ\_n e(n)zⁿ/n! is not summable.

Hypotheses and conventions: |z| ≥ π/2; only the odd terms of e are constrained.

Acceptance checks:

- k = 1: e(1) = 1 and (4/π)(3/4)ζ(2) = π/2 = 1·(π/2)¹/1!.
- k = 2: e(3) = 2 from B₄ = −1/30, and 2(π/2)³/3! = π³/24 = (4/π)(15/16)ζ(4).

Proof sketch:

1. With k = n + 1, |e(2k − 1)|/(2k − 1)! = 2^{2k}(2^{2k} − 1)|B_{2k}|/(2k)! = 2(2^{2k} − 1)ζ(2k)/π^{2k} by bernoulli-coefficients-do-not-decay (a).
2. Hence |e(2k − 1)|(π/2)^{2k−1}/(2k − 1)! = (4/π)(1 − 2^{−2k})ζ(2k) ≥ 3/π for every k ≥ 1, and for |z| ≥ π/2 the odd terms have absolute value at least 3/π; the terms do not tend to 0.

Direct prerequisites: [bernoulli-coefficients-do-not-decay](#CA-2-bernoulli-coefficients-do-not-decay), `mathlib:bernoulli`, `mathlib:Multipliable.tendsto_atTop_one`.

Suggested Lean: `not_summable_mul_pow_of_tangent_closed_form` (in `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.2.lean`).

Source: [F. W. J. Olver et al. (eds.), *NIST Digital Library of Mathematical Functions, §24.9 Inequalities*](https://dlmf.nist.gov/24.9), §24.9, (24.9.8), retrieved 2026-10-14. The lower bound for |B_{2n}| that gives the lower bound for the tangent numbers.

Source: [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), §1.6.1, (1.53)–(1.54), p. 54. The tangent numbers are the odd-index Euler numbers E_{2n+1}, the coefficients of tan x.

## 5. The earlier review frontier, target by target

The earlier pass of CA.2 ended with twenty targets whose review recorded obligations. Each is listed with its disposition; *resolved* means the earlier pass or its third review already discharged it, *superseded at target level* means the obligation was a demand to split API items into lemma nodes, which the current granularity (one node per target, smaller steps in the proof sketch) does not require, and the remaining six name the supplier that discharges the step.

| Target | Status | Disposition |
|---|---|---|
| `generating-polynomials-and-the-minimal-polynomial` | resolved | Resolved in the first pass by REV-ClassicalArithmeticCompletion~3: generatingIdeal and minPoly have concrete bodies; the normalised-denominator remark (Q(0) = 1) is in the node's statement. |
| `rational-power-series` | superseded at target level | A demand to split IsRational, the subring and the coefficient characterisation into lemma nodes; at target level (PROTOCOL §2, detail.json) these stay API items of the definition, each with a proof step in the node. No supplier is missing. |
| `linear-recurrence-of-a-monic-polynomial` | superseded at target level | A demand to promote charPoly_ofMonic and isSolution_ofMonic_iff to lemma nodes; they are API items whose proofs are one-line unfoldings of Mathlib's LinearRecurrence, and their consumers cite the node. |
| `exponential-polynomial-solutions` | resolved | The missing Hasse product rule and the factorial-invertibility step were added in the first pass (Polynomial.hasseDeriv_mul, Polynomial.factorial_smul_hasseDeriv, Nat.pow_eq_sum_stirlingSecond_mul_descFactorial are its prerequisites). |
| `companion-matrix` | resolved | Resolved by REV~3: minpoly_companion is proved through minpoly.algHom_eq along the injective Algebra.leftMulMatrix with AdjoinRoot.minpoly_root. |
| `roots-are-eigenvalues-of-the-companion-matrix` | superseded at target level | A demand to split the ring eigenvector identity and the field HasEigenvalue statement; both are parts of one target with separate proof steps, as target level allows. |
| `euler-zigzag-numbers` | resolved | Resolved by REV~3: the Bernoulli computation behind zigzag_odd_eq_bernoulli is the last proof step of secant-plus-tangent-formal-identity, so no definition-to-theorem cycle remains. |
| `secant-plus-tangent-formal-identity` | supplied by a new node | The step 'sin′ = cos, cos′ = −sin, sin² + cos² = 1 formally' had no supplier in the pinned Mathlib (no formal derivative lemmas for PowerSeries.sin and cos). It is now the lemma node formal-sine-cosine-identities; the uniqueness of solutions of the formal first-order system stays a coefficient-recursion step of the target. Supplier: [formal-sine-cosine-identities](#CA-2-formal-sine-cosine-identities). |
| `taylor-series-of-a-complex-function` | suppliers named | Every API item the consumers use already names a Mathlib supplier among the node's prerequisites: multiplicativity by iteratedDeriv_mul through AnalyticAt.contDiffAt; exp, sin and cos by iteratedDeriv_cexp_const_mul or HasFPowerSeriesAt.eq_formalMultilinearSeries against Complex.hasSum_cos and Complex.hasSum_sin; convergence on a disc by Complex.hasSum_taylorSeries_on_ball; germ injectivity by AnalyticAt.eventually_analyticAt with AnalyticOnNhd.differentiableOn. Promoting them to separate nodes is a lemma-level demand. |
| `bernoulli-generating-function-on-its-disc` | supplied by a new node | The exactness of the radius 2π (divergence beyond, and on, the circle) is now the lemma node bernoulli-coefficients-do-not-decay, from Mathlib's hasSum_zeta_nat: \|B₂ₖ\|(2π)^{2k}/(2k)! = 2ζ(2k) ≥ 2. It strengthens the signature not_summable_bernoulli_mul_pow (2π < \|z\|) to 2π ≤ \|z\|. Supplier: [bernoulli-coefficients-do-not-decay](#CA-2-bernoulli-coefficients-do-not-decay). |
| `secant-plus-tangent-on-its-disc` | supplied by a new node | The exactness of the radius π/2 is now the lemma node tangent-coefficients-do-not-decay: the odd terms satisfy \|E₂ₖ₋₁\|(π/2)^{2k−1}/(2k − 1)! = (4/π)(1 − 2^{−2k})ζ(2k) ≥ 3/π, through zigzag_odd_eq_bernoulli and hasSum_zeta_nat; it gives not_summable_zigzag_mul_pow on π/2 ≤ \|z\|. Supplier: [tangent-coefficients-do-not-decay](#CA-2-tangent-coefficients-do-not-decay). |
| `p-adic-digit-expansion` | suppliers named | The summability of Σ dᵢpⁱ for arbitrary digits is Mathlib's NonarchimedeanAddGroup.summable_of_tendsto_cofinite_zero (the additive form of NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one, Topology/Algebra/InfiniteSum/Nonarchimedean.lean), applied in ℤ\_p with the instances IsUltrametricDist ℤ\_[p] (hence NonarchimedeanAddGroup) and PadicInt.completeSpace, since ‖dᵢpⁱ‖ ≤ p^{−i} → 0; continuity of reduction modulo pⁿ is PadicInt.toZModPow being a ring homomorphism with open kernel pⁿℤ\_p. |
| `automata-with-output` | superseded at target level | A demand to split six data declarations into nodes; they are the data and API of one definition at target level. |
| `automatic-sequences` | resolved | Resolved in the first pass: the finite-kernel cycle was removed, a direct finite automaton is given, and the unary case has its own proof and a base-one test. |
| `k-kernel` | superseded at target level | A demand to promote kernel_subset; it is an API item of the definition, proved by exponent arithmetic in the node. |
| `thue-morse-sequence` | resolved | Resolved in the first pass: the elementary non-periodicity argument behind the non-rationality test is supplied. |
| `cartier-operators` | suppliers named | The Frobenius-product identity Λ\_r(g^q h) = g·Λ\_r(h) and the reconstruction f = Σ\_r X^r(Λ\_r f)^q are API items with proof steps that name their suppliers (FiniteField.pow_card and frobenius for (Σ bₙXⁿ)^q = Σ bₙX^{qn}); the corrected hypotheses q > 0 and r < q are in the node. Separate lemma nodes are a lemma-level demand. |
| `automatic-series-are-algebraic` | resolved | Resolved by REV~3: the degree bound q^m − 1 has its own signature exists_poly_natDegree_le_of_finite_kernel. |
| `stern-brocot-tree` | resolved | Resolved in the first pass: reduction is proved on raw determinant-one pairs including the infinity sentinel. |
| `stern-brocot-enumerates-positive-rationals` | resolved | Resolved by REV~3: the surjectivity proof uses the decreasing measure U + V of the third review. |

## 6. Gap

**Ward's strong divisibility at primes dividing W₂W₃ and for singular attached curves.** For b, c, d ∈ ℤ with bc ≠ 0 and gcd(c, db) = 1, the subgroup property of {n : p^V | Wₙ}, W = normEDS b c d, is planned only at primes p ∤ bc with Δ(E_{b,c,d}) ≠ 0 (CA.2/eds-strong-divisibility-at-good-primes). Missing: (1) primes p dividing b or c; there the point (0, 0) can have singular reduction on every integral model (b = 1, c = 3, d = 1, p = 3: no integral model carries P as an integral nonsingular point, and v₃(Wₙ) = 1 for n ≡ 3 (mod 6), 4 + v₃(n/6) for 6 | n), so the formal-group argument does not apply; (2) the singular case Δ(E_{b,c,d}) = 0 (sequences satisfying a linear recurrence, e.g. normEDS 2 3 2 = id), where the filtration of the nonsingular points of a singular integral cubic is needed. Sources: Ward, Memoir on elliptic divisibility sequences, Amer. J. Math. 70 (1948), 31–74, proves the theorem by recursion but is not freely available; no public source with a complete proof was found (searched: Silverman arXiv:math/0404412 and his 2007 ICMS slides, Silverman–Stephens math/0402415, Everest–King math/0404124, Everest–McLaren–Ward math/0409540, Bhakta–Loughran–Rydin Myerson–Nakahara 2109.03746, Streng's master's thesis, Stange 0710.1316 and 1108.3051, Silverman–Stange 1001.5303, Verzobio 1906.00632, Xu 2604.05280; Shipsey's and Swart's theses are not online). Numerical evidence: 1552 sequences with b ∈ [−6, 6] ∖ {0}, c, d ∈ [−8, 8], gcd(c, db) = 1 satisfy gcd(W_m, Wₙ) = |W_{gcd(m,n)}| for m, n ≤ 24. A wider check by the review: the 3232 sequences with b, c ∈ [−12, 12] ∖ {0}, d ∈ [−6, 6] and gcd(c, db) = 1 satisfy gcd(W_m, Wₙ) = |W_{gcd(m,n)}| for 1 ≤ m, n ≤ 32, and in the first range no sequence with gcd(c, db) ≠ 1 is strongly divisible. A route: Stange's valuation formulas for P of singular reduction (troublemaker sequences, Theorems 19 ff. of arXiv:1108.3051) together with the integrality and coprimality constraints, or a recursion-only proof of the subgroup property modulo p^V.

Needed by: [ward-strong-divisibility](#CA-2-ward-strong-divisibility).

## 7. Dependencies

Inside the roadmap: the Eulerian non-example compares with `ClassicalArithmeticCompletion:CA.2/euler-zigzag-numbers`; the tangent supplier uses that node's API item `zigzag_odd_eq_bernoulli`; the three suppliers of §4 feed `CA.2/secant-plus-tangent-formal-identity`, `CA.2/bernoulli-generating-function-on-its-disc` and `CA.2/secant-plus-tangent-on-its-disc`. Elliptic divisibility sequences rest on CA.0's divisibility and gcd arithmetic (Mathlib's `Int.gcd`, Bezout).

Other roadmaps: Tau Ceti's EllipticCurves, Layer 1 (the elliptic formal group law of a Weierstrass equation, its points Ê(𝔪) over a complete field and the identification Ê(𝔪) ≅ E₁(K) for an integral model), from which this layer builds the finer filtration E_k of an arbitrary integral equation. Libraries: Mathlib's `normEDS`, division polynomials, Weierstrass curves, `Ring.choose`, `bernoulli` and `hasSum_zeta_nat`, formal power series and their derivative; Tau Ceti's `isEllipticNet_normEDS`, `isDvdSequence_normEDS`, `normEDS_two_three_two_eq_id` and `WeierstrassCurve.zsmul_point_eq_smulEval`.

Consumers: Lawrence–Sawin's Appendix B, and the roadmap planning their convolution monodromy, use §1; Yu's Théorème 7.2.3, in the function-field counting roadmap, uses §2.

## 8. Acceptance tests for the layer

- A(4, ·) = 1, 11, 11, 1, the rows sum to n! including A(0, 0) = 1, and A(3, 1) = 4 differs from the zigzag number E₃ = 2.
- Lemma C.5 holds from n = 11 and fails at n = 10 (A(10, 1) = 1013, A(10, 2) = 47 840).
- −2 divides C(−4, 2) = 10 while 4 does not divide C(4, 2) = 6; f_3(6) = 40 and f_2(6) = 15 ≠ 45 = 6!/2⁴.
- f_3(6) ≡ f_3(3)² (mod 9), and the Luo–Zhu congruence fails for p = 2, α = 1, N = 2 (f_2(4) = 3 ≢ 1 mod 4).
- E_{1,−1,1} is y² + y = x³ − x after y ↦ y + x, with Δ = 37 and sequence 0, 1, 1, −1, 1, 2, −1, −3, −5, 7, −4; E_{2,3,2} is cuspidal and carries the identity sequence.
- normEDS 1 (−6) (−6) = 0, 1, 1, −6, −6, 210, … has gcd(W₃, W₄) = 6, so Ward's coprimality hypothesis is necessary; for normEDS 1 (−1) 1, gcd(W₁₀, W₁₅) = 2 = |W₅|.
- |B₂|(2π)²/2! = π²/3 = 2ζ(2), and the tangent closed form gives E₃ = 2 from B₄ = −1/30.

## 9. Sources

- [Richard P. Stanley, *Enumerative Combinatorics, Volume 1, second edition*](https://math.mit.edu/~rstan/ec/ec1.pdf), Cambridge Studies in Advanced Mathematics 49, second edition (2012); the author's posted PDF. Read: §1.4 (descents, Eulerian polynomials, Propositions 1.4.3–1.4.5), pp. 38–41; §1.6.1 (alternating permutations, Proposition 1.6.1 and its proof), pp. 54–55; Chapter 1 exercises 1.49–1.50 (p. 124) with the solutions of 1.49 and 1.50(b)–(e) (pp. 177–178).
- [Brian Lawrence and Will Sawin, *The Shafarevich conjecture for hypersurfaces in abelian varieties*](https://arxiv.org/pdf/2004.09046v5), arXiv:2004.09046v5 (16 October 2025); Annals of Mathematics 202 (2025), no. 3. Read: §3, Lemmas 3.3–3.4 and the definition of the degree, p. 20; Appendix A, the end of the proof of Lemma A.1 (Lemma A.6), p. 92; Appendix B, opening paragraph (conventions), p. 93, and §B.3 opening, p. 101; Appendix C, Lemmas C.1–C.5 with proofs, pp. 116–118.
- [Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*](https://arxiv.org/pdf/1807.04659v5), arXiv:1807.04659v5 (18 July 2022); Annals of Mathematics 197 (2023), 423–531. Read: §7.2.2, Lemme 7.2.2 with its proof and the statement of Théorème 7.2.3, p. 67; §7.2.2, proof of Théorème 7.2.3: the definition of f_p, the quoted Luo–Zhu fact (∗), the two binomial factorisations and the first case, pp. 71–72.
- [Wei Luo and Shengmao Zhu, *Integrality of the LMOV invariants for framed unknot*](https://arxiv.org/pdf/2106.02882v1), arXiv:2106.02882v1 (5 June 2021), the deposit of Commun. Number Theory Phys. 13 (2019), 81–100. Read: §3, equation (10) and Lemma 3.1 with its proof, pp. 6–7.
- [Wei Luo and Shengmao Zhu, *Integrality structures in topological strings I: framed unknot*](https://arxiv.org/pdf/1611.06506v1), arXiv:1611.06506v1 (20 November 2016). Read: §4, the definition of f_p before Lemma 4.6 and Lemma 4.6 with its proof, pp. 16–17 (page images read).
- [Katherine E. Stange, *Integral points on elliptic curves and explicit valuations of division polynomials*](https://arxiv.org/pdf/1108.3051v4), arXiv:1108.3051v4 (29 December 2014); Canad. J. Math. 68 (2016). Read: §1 (Theorems 1 and 3), pp. 1–6; §§2–3 (Propositions 5–6, Definition 7, Theorems 8–9), pp. 6–8; §§4–6 (Lemma 10 with proof, Theorem 14 with proof, Corollaries 15–17, Remark 18), pp. 8–13; §7 (Theorem 19 with proof, Remark 20), pp. 14–15.
- [Joseph H. Silverman and Nelson Stephens, *The sign of an elliptic divisibility sequence*](https://arxiv.org/pdf/math/0402415v1), arXiv:math/0402415v1 (25 February 2004). Read: Introduction, Definition 1, p. 1; §1, the normalisation and the W₂ | W₄ criterion, p. 3; Appendix A, (27)–(31), pp. 16–17.
- [Joseph H. Silverman, *p-adic properties of division polynomials and elliptic divisibility sequences*](https://arxiv.org/pdf/math/0404412v1), arXiv:math/0404412v1 (22 April 2004); Math. Ann. 332 (2005). Read: §1 (Theorems 1–3), pp. 1–3; §3 (Theorem 8), p. 6; §§8–10 (Definitions 2–3, Remarks 5–6, Example 1, Theorems 16–17, Proposition 18, Theorem 20), pp. 24–28.
- [Joseph H. Silverman and Katherine E. Stange, *Terms in elliptic divisibility sequences divisible by their indices*](https://arxiv.org/pdf/1001.5303v1), arXiv:1001.5303v1 (29 January 2010). Read: §1, the definition of EDS of a point, pp. 2–3; Remark 28, p. 24.
- [Subham Bhakta, Daniel Loughran, Simon L. Rydin Myerson and Masahiro Nakahara, *The elliptic sieve and Brauer groups*](https://arxiv.org/pdf/2109.03746), arXiv:2109.03746 (current version, retrieved 2026-10-14). Read: §2 (Definitions 2.1–2.2, Lemmas 2.3–2.4, Remark 2.5), pp. 7–8; §3.1 (Definition 3.1, Proposition 3.2, Lemmas 3.4–3.5), pp. 8–9; §3.2 opening (symmetry law, Proposition 3.6), p. 9.
- [Marco Streng, *Elliptic divisibility sequences with complex multiplication*](https://pub.math.leidenuniv.nl/~strengtc/mthesis.pdf), Master's thesis, Universiteit Utrecht, 3 June 2006; the author's posted PDF. Read: Chapter I, pp. 1–3; Chapter III, §2 (the opening paragraph, §§2.1–2.3, Lemmas 2.1–2.3 with proofs), pp. 16–18, with the statements of Lemmas 1.6–1.11 it uses; Chapter IV, §§2–4 (Lemmas 2.1, 3.1, 4.1 with proofs, Example 4.2), pp. 38–39.
- [Joseph H. Silverman, *p-adic properties of elliptic divisibility sequences (lecture slides)*](https://www.math.brown.edu/johsilve/Presentations/ICMSEDSLecture.pdf), Slides, ICMS Workshop on Number Theory and Computability, Edinburgh, 27 June 2007. Read: Slides 1–2 (EDS as recursions; EDS and elliptic curves).
- [F. W. J. Olver et al. (eds.), *NIST Digital Library of Mathematical Functions, §24.9 Inequalities*](https://dlmf.nist.gov/24.9), Online edition, retrieved 2026-10-14. Read: §24.9, (24.9.7)–(24.9.9).

Mistakes found in these sources are recorded with the plan: a duplicated factor p^α(n − 1) in the expansion of the proof of Luo–Zhu's Lemma 4.6 in the 2016 preprint (corrected in the 2021 deposit of the published article), and the statement of strong divisibility without the coprimality of W₃ and W₄, and without absolute values, on the first slide of Silverman's 2007 ICMS lecture.
