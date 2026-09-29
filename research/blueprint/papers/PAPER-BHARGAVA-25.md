# PAPER-BHARGAVA-25: Galois groups of random integer polynomials and van der Waerden's Conjecture

Manjul Bhargava, *Galois groups of random integer polynomials and van der Waerden's Conjecture*, [Annals of Mathematics 201 (2025), no. 2](https://doi.org/10.4007/annals.2025.201.2.1); arXiv [2111.06507](https://arxiv.org/abs/2111.06507).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1059). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-BHARGAVA-25.result.json](PAPER-BHARGAVA-25.result.json). It has:
- 74 items: 11 library, 3 planned, 60 missing;
- 4 routes: one new Part II of a Tau Ceti roadmap and three sources of existing layers;
- 17 prerequisite entries;
- 15 recorded mistakes: 7 misprints, 6 errors and 2 gaps.

## Sources read

- **arXiv v3** (28 September 2024, "to appear in Annals of Math"), read in full: 34 pages. Item locators are v3's pages.
  - v3 postdates acceptance (14 February 2024).
  - The published article (online 12 March 2025) is subscription-only and was not compared.
- **Errata:** the Annals page lists no erratum, and Crossref records no update.
- **Checks:**
  - Every mistake was checked on v3's page images.
  - Every numerical claim behind a mistake was recomputed exactly, with rational arithmetic.
  - The discriminant formula was checked symbolically.
  - Inequality (6) was checked by enumerating all m ≤ 14.
- **Ellenberg–Venkatesh** was read to check Corollary 6's input, in both the arXiv v1 and the published Annals version.

## What the paper proves

**Main theorem (Theorem 1).**
- E_n(H) = O(H^{n−1}). Here E_n(H) counts the monic f = x^n + a_1x^{n−1} + ··· + a_n with |a_i| ≤ H whose Galois group is not S_n.
- This is van der Waerden's 1936 conjecture. It was previously known only for n ≤ 4 (Chow–Dietmann).

**How the proof goes.**
- **Reduction.** Intransitive groups (reducible f, van der Waerden) and imprimitive groups (Widmer, O(H^{n/2+2})) are classical, so G may be taken primitive.
- **The index.** ind(G) = min over g ≠ 1 of n − #orbits(g). For primitive G ≠ S_n, Jordan's theorem gives ind(G) ≥ 2. By Proposition 11, Disc(K_f) is then ind(G)-powerful.
- **Three cases**, by the product C of ramified primes and D = |Disc K_f|:
  - **Case I** (C ≤ H^{1+δ}, D large): congruence conditions of density c^{ω(D)}/D, made uniform in boxes beyond the modulus by Fourier analysis (§4: Propositions 26 and 30, with Weil's bound when d = n).
  - **Case II** (D small): Schmidt's count of fields, times Lemke Oliver–Thorne's count of polynomials per field.
  - **Case III** (C large): Proposition 34 shows C divides the double discriminant DD(a_1, …, a_{n−1}). A split by the size of the prime factors of C then removes the H^ε.

**General groups (Theorem 2).**
- N_n(G, H) is bounded by the minimum of two expressions:
  - H^{n+1−ind G} + H^{n−(n−1)θ}, times a power of log H;
  - H^{(2n−2)(a(G)−u)+1} log^{n−1} H.
- Here a(G) is any exponent with F_n(G, X) = O(X^{a(G)}), θ = (1 − 1/ind G)/(a(G) + 1 − 1/ind G − u), and u = 1/(n(n − 1)) for primitive G (0 otherwise).
- Case III now uses the index strata of monic polynomials (Remark 23, Propositions 21–22).

**Permutation-group input.**
- Theorem 12: ind(G) ≥ ⌊√n⌋ (Liebeck–Saxl).
- Theorem 13: ind(G) ≥ 3n/14 for elemental G (Guralnick–Magaard).
- Theorem 16 and Corollaries 17–18: for non-elemental G, ind(g)/ind(g′) ≫ √n against the imprimitive companion G′.
- Remark 15 records which statements need CFSG; Babai's bound gives CFSG-free versions.

**New field counts.**
- Theorem 20: F_n(G, X) ≪ X^{(n+2)/4−1+1/ind G+ε} for primitive G.
- Theorem 25: F_n(G, X) ≪ X^{b log² n/√n} for non-elemental G.

**Corollaries.**
- Corollary 3: power savings for primitive groups, e.g. O(H^{n−2}) for n ≥ 10.
- Corollary 4: hyperelliptic Jacobians with extra endomorphisms are rare (via Zarhin).
- Corollary 5: N_p(C_p, H) = O(H²).
- Corollary 6: a bound for regular groups.
- Theorem 7 and Corollary 8: intransitive groups, via the Mahler measure.

## What the atlas already has

**Library (11 items).**
- Mathlib:
  - the Galois action on roots;
  - primitivity and blocks;
  - Jordan's theorems for a transposition and for a 3-cycle (`Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`, `…alternatingGroup_le_of_isPreprimitive_of_isThreeCycle_mem`);
  - the Mahler measure with its multiplicativity and both coefficient comparisons;
  - discriminants and resultants of polynomials, and number-field discriminants;
  - partitions;
  - the Girard–Newton identities;
  - Schwartz–Zippel, which is [7, Lemma 3.1];
  - roots of a polynomial over a field, and the Chinese remainder theorem.
- Tau Ceti: the equivalence between a primitive Galois action and having no intermediate field (`TauCeti.isPreprimitive_iff_isAtom_adjoin_simple`).

**Planned (3 items).**
- Weil's exponential-sum bound: FF.2.
- Tame inertia cycle types and discriminant valuations: Tau Ceti LocalFieldsRamification Layer 3 and NumberFieldArithmetic Layer 3.
- The divisor bound: AN.5.

## Routes

1. **New Part II `PolynomialGaloisGroupsPartIICountingByGaloisGroup`** (51 missing).
   - Title: "Galois groups of polynomials, Part II: counting integer polynomials by Galois group". Parent: the Tau Ceti roadmap `PolynomialGaloisGroups`. Area: `algebraicnt`.
   - **Layers:**
     1. the index and Proposition 11;
     2. primitive groups: minimal-degree imports, Jordan's double-transposition theorem, Theorems 12, 13, 16 and Corollaries 17–18;
     3. index strata;
     4. Theorems 20 and 25;
     5. §4's Fourier equidistribution;
     6. the three-case sieve;
     7. the corollaries and Theorem 7.
   - **Why a Part II:** the parent owns the permutation representation, blocks, primitivity and Sₙ over ℚ, but no counting by Galois group.
   - **Relation to other proposals:** PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 proposes random-polynomial Part IIs, but for growing degree, a different regime. Its `PolynomialGaloisGroupsPartIIRandomPartitions` says to import "the original primitive-group minimum-degree theorem"; this Part II's second layer is where that theorem lives.
   - **Why the field counts stay here:** Theorems 20 and 25 need the index theory, so moving them to ST.3 would create a cycle.
2. **Source of ArithmeticStatistics [ST.3]** (7 missing). The cited field counts:
   - Schmidt's bound, with its small trace-zero element;
   - Lemke Oliver–Thorne;
   - Bhargava's quartic and quintic densities;
   - Mäki–Wright for cyclic fields of prime degree;
   - Ellenberg–Venkatesh for Galois fields (|G| > 4);
   - Malle's F_n(G, X), a(G) and his conjecture.
3. **Source of InverseGaloisAndArithmeticFundamentalGroups [IG.2]** (1 missing). E_n(H) = o(H^n), as PAPER-BHARGAVA-SHANKAR-WANG-22 routed its height version.
4. **Source of SchemeAndStackFoundations [SF.5]** (1 missing). Bézout's bound, used for the power-sum system (7).

## Source issues (`sourceIssues` E1–E15)

**The stated results that do not hold as printed.**
- **E15 (error, Corollary 6)** is false for n = 2.
  - C_2 is regular, and every irreducible monic quadratic has it, so N_2(C_2, H) ≍ H² > H^{1.709}.
  - The derivation drops Theorem 2's term H^{n+1−ind G} = H^{n/p+1}. That term exceeds the claimed bound whenever the smallest prime factor p of n is 2 or 3.
  - The constant 1.164 is the largest excess of the middle term alone over 3n/11 for n ≥ 5 (at n = 6).
  - Ellenberg–Venkatesh's exponent 3/8 needs |G| > 4.
  - Theorem 2 does prove the bound for n > 4 prime to 6.
- **E13 (error, Corollary 3(a), threshold 53).** With ind(G) ≥ 13 for elemental G, the saving is 3.4910, 3.4946 and 3.4981 at n = 53, 54, 55, below 3.5. The argument proves O(H^{n−3.5}) only from n = 56.
- **E11 (error, Theorem 2's power of log).**
  - The claim b < c is false. For AGL(2, 3) on 9 letters, b ≈ 3.46 > c = 3.
  - Theorem 2 holds with log^{max(b, c)} H.
  - No corollary is affected.

**Proofs that need repair; the results stand.**
- **E6 (error).** §5's choice δ = 1/(2n) makes the Case II exponent 5.2611 > 5 at n = 6 and 3.0625 > 3 at n = 4. δ = min{1/(2n), 1/60} works; it also respects Case I's requirement δ < 1/(2n − 1). §5 does not treat n = 3, which Theorem 2 covers.
- **E9 (error).** §6 allows δ < 1/(n − 1) and cites Proposition 26 (binary forms). The monic count is Corollary 33, which needs δ < 1/(2n − 1).
- **E12 (error).** The displayed k = 5 bound gives H^{n−3} only for n ≥ 46. The claim for n ≥ 28 follows from the elemental/non-elemental split.
- **E5 (gap).** The induction for (6) in Theorem 16 has two holes:
  - it misses the fixed-point-free case with k odd;
  - it steps to (2k, k), outside its range.

  Complementation fills both, since f(2k, k, y) = 2f(2k − 1, k − 1, y).
- **E10 (gap).** The polynomials g_i of §6 Case III(ii) need a dimension property that "successive resultants" does not supply. Closures of projections of the index stratum repair the count.

**Misprints (affect nothing).**
- E1: Guralnick–Magaard is cited as [26]; it should be [21].
- E2: n^{3n/4+…} should be H^{3n/4+…}.
- E3: log^{p−1} B should be log^{p−1} H.
- E4: Theorem 7's conclusion should be N_n(G, H), not N_n(G_1 × ··· × G_k, H).
- E7: an unbalanced parenthesis in Case II, with "n = 5" where n = 4, 5 is meant.
- E8: the discriminant of x^n + ax + b lacks the sign (−1)^{n(n−1)/2}.
- E14: the denominator of (28).

## Prerequisites not yet covered

Seventeen entries:
- Schmidt (Astérisque 1995);
- Lemke Oliver–Thorne on fields (Duke 2022) and on polynomials (Mathematika 2020);
- Liebeck–Saxl (Proc. LMS 1991), Guralnick–Magaard (J. Algebra 1998), Babai (Annals 1981);
- Bhargava on quartic (Annals 2005) and quintic (Annals 2010) densities, and the geometric sieve (arXiv 1402.0031);
- Ellenberg–Venkatesh (Annals 2006);
- Widmer (IJNT 2011);
- Zarhin (MRL 2000), who is missing from the paper's own reference list;
- Wright (Proc. LMS 1989);
- van der Waerden (1936);
- Weil (PNAS 1948);
- Dixon–Mortimer;
- Malle (JNT 2002).

Every DOI was checked against Crossref, and Schmidt's paper on Numdam.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-25.result.json` reports no errors.
- Every cited declaration was found in the pinned index at Mathlib 082e2d3 and Tau Ceti f790474. Every statement was read in its Lean file.
- Every planned and route stage id exists in `data/atlas.json`.
