# PAPER-BHARGAVA-SHANKAR-WANG-22: Squarefree values of polynomial discriminants I

Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants I*, [Inventiones Mathematicae 228 (2022), 1037–1073](https://doi.org/10.1007/s00222-022-01098-w); arXiv [1611.09806](https://arxiv.org/abs/1611.09806).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1274). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-BHARGAVA-SHANKAR-WANG-22.result.json](PAPER-BHARGAVA-SHANKAR-WANG-22.result.json): 74 items (4 library, 3 planned, 67 missing), 6 routes, 14 prerequisite entries and 12 recorded source issues.

**Source.** arXiv v3 (31 December 2021, 29 pages), SHA-256 `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83`, read in full on 2026-09-22.

- The Inventiones version (online 4 February 2022) is paywalled and was not read. v3 was posted five weeks before it and is presumably the accepted manuscript.
- Locators are v3 pages.
- Part II (arXiv 2207.05592) was consulted only to see whether it revisits these arguments. It does not.

## What the paper proves

Order monic integer polynomials f = xⁿ + a₁xⁿ⁻¹ + ⋯ + aₙ by H(f) = max|aᵢ|^{1/i}.

- **Theorem 1.1.** The density with squarefree discriminant is λₙ = ∏λₙ(p) > 0, using Yamamura's local densities. It tends to λ ≈ 30.7056% as n → ∞.
- **Theorem 1.2.** The density with Z[x]/(f) maximal is ζ(2)⁻¹, by Lenstra's local density 1 − 1/p².
- **Error terms.** Both counts hold with error O(X^{n(n+1)/2−1/5+ε}), by (4).
- **Corollary 1.3.** There are ≫ X^{1/2+1/n} monogenic Sₙ-fields of degree n with discriminant below X.
- **Corollary 1.4.** The Ellenberg–Venkatesh conjecture holds: ≍ Y^{(n−1)(n+2)/2} degree-n fields have a generating integer of length below Y.

**Strategy.** The heart of the paper is a tail estimate, Theorem 1.5, for f with m² | Δ(f) and m large.

1. **Strong and weak divisibility.** p² strongly divides Δ(f) if it divides Δ(f + pg) for all g; otherwise the divisibility is weak.
   - **Strong case.** The locus is of codimension 2, so Bhargava's quantitative Ekedahl sieve applies (Theorem 1.5(a)).
   - **Weak case.** By Proposition 2.2, some translate has m | b_{n−1} and m² | bₙ.
2. **The embedding (§§2.2, 3.2).** Explicit matrices B_m embed such f into symmetric matrices, in the representation of SOₙ used by Bhargava–Gross (n odd) and Shankar–Wang (n even). The image lies in the subspace W₀, where a new relative invariant, the Q-invariant of 2 ⊗ g ⊗ (g + 1), equals m. Since J_f[2](ℚ) is trivial for irreducible f, |Q| is well defined on G(ℤ)-orbits (Propositions 2.1 and 3.1).
3. **Counting in the cusp (§§2.3–2.4, 3.3–3.4).** Orbits with |Q| > M are counted deep in the cusp of a fundamental domain. There is a tension:
   - integral points are forced into W₀₀ when the torus coordinates sᵢ are large;
   - |Q|, whose weight is ∏s_k^{−k}, is large only when the sᵢ are small.

   Integrating the resulting monomials gives O(X^{n(n+1)/2}log X/M), or log²X for even n. A Selberg-sieve saving handles the points off W₀₀.
4. **The sieve (§4).** A squarefree sieve with κ-acceptable local conditions (Theorem 4.1), with Theorem 4.4 and the bound on reducible polynomials (Proposition 4.3), completes the proof.
5. **Fields (§5).** Minkowski quasi-reduction (Lemmas 5.1–5.3) makes distinct polynomials give distinct fields.

## What the atlas already has

- **Library.**
  - Mathlib at 082e2d3: the discriminant `Polynomial.discr` and `NumberField.discr`.
  - Tau Ceti at f790474: the index formula `discr_minpoly_eq_index_sq_mul_discr`, so a squarefree discriminant gives a maximal order, and `TauCeti.NumberField.IsMonogenic`.
- **Planned.**
  - InverseGaloisAndArithmeticFundamentalGroups IG.2: Hilbert irreducibility.
  - AdelicAlgebraicGroups AA.3: Siegel sets and reduction theory.
  - SieveMethodsAndPrimePatterns SV.1: the optimised Selberg sieve. Mathlib already has the Λ² upper-bound mechanism (`NumberTheory/SelbergSieve.lean`), and RS-07 narrows SV.1 to the optimisation beyond it.
- **Not in the atlas.** The local densities, the invariant theory of W and the Q-invariant, the cusp counts, the tail estimates, the sieve with infinitely many conditions, and the field-counting corollaries.
  - The same Ekedahl-sieve input is already routed to ST.2 by PAPER-KOYMANS-MILOVIC-21.
  - Tau Ceti has Stickelberger's congruence for number fields (`discr_emod_four_eq_zero_or_one`), relevant to E1.

## Routes

1. **Source of ArithmeticStatistics ST.0 and ST.1** (27 items).
   - **ST.0 (families, heights, local conditions and densities):**
     - the family and height;
     - λₙ(p), λ and ρₙ(p);
     - strong and weak divisibility with the root criterion;
     - Proposition 2.2;
     - κ-acceptable specifications.
   - **ST.1 (integral invariant theory and orbit parametrizations):**
     - the representation W, its invariant ring and stabilizers J_f[2];
     - distinguished orbits, W₀ and G₀;
     - the Q-invariant and Q² | Δ;
     - Propositions 2.1 and 3.1;
     - the matrices B_m and the embeddings σ_m (Theorems 2.3–2.4, 3.2–3.3).
2. **Source of ArithmeticStatistics ST.2** (21 items). ST.2 owns cusp and reducible contributions and uniform tail estimates, and its acceptance condition asks for exactly such a tail theorem.
   - fundamental-domain averaging and torus weights (both parities);
   - Propositions 2.5–2.7 and 3.4–3.6;
   - the density of distinguished elements and the Selberg-sieve step;
   - the Ekedahl sieve and Theorem 1.5;
   - Lemma 4.2 and Proposition 4.3;
   - Theorems 4.4 and 4.1.
3. **Source of ArithmeticStatistics ST.3 and ST.5** (16 items).
   - **ST.3 (field counts):**
     - Theorems 1.1 and 1.2 with (4), and their variants;
     - squarefree discriminant ⇒ Sₙ;
     - the Ellenberg–Venkatesh upper bound;
     - quasi-reduction, Lemmas 5.1–5.3 and Theorem 5.4;
     - Corollaries 1.3–1.4 and Remark 5.5.
   - **ST.5 (established asymptotics against models):** the conjecture (42) with the constant C₃ (Remark 5.6).
4. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.3** (1 item): Minkowski-reduced bases and their Siegel-set description.
5. **Source of InverseGaloisAndArithmeticFundamentalGroups IG.2** (1 item): Dietmann's quantitative Hilbert irreducibility.
6. **Source of ClassicalArithmeticCompletion CA.3** (1 item): Fujiwara's root bound.

No new roadmap or Part II is needed. ArithmeticStatistics ST.0–ST.3 is the Bhargava–Shankar direction this paper extends.

## Source issues (`sourceIssues` E1–E12)

None affects the main theorems.

- **E1** (error, affects nothing). The root criterion for strong and weak divisibility (p.4) fails at p = 2.
  - **Why.** By Stickelberger, 2 | Δ implies 4 | Δ for every lift, so every divisibility at 2 is strong. For example, x² + 1 ≡ (x + 1)² mod 2 has a single double root.
  - **Check.** Brute force confirms the criterion for p = 3 and 5 and finds failures at p = 2 for n = 2, …, 5.
  - **Why nothing changes.** The proofs use only the direction that holds at every p.
- **E2, E3** (misprints, §3.3–3.4).
  - E2: "s_g = t_gt_{g+1}" should be s_{g+1} = t_gt_{g+1}.
  - E3: (36) should read w(Q) = ∏s_k^{−k}, not ∏s_k^k.

  The proof of Proposition 3.6 uses the correct weight. Checked symbolically for g ≤ 5.
- **E4, E5** (misprints).
  - Theorem 3.3 has W^{(2)}_m for W^{(2),irr}_m.
  - §3.3 has G₀ for G₁.
  - The proof of Proposition 3.6 has ½W₀₀ for ¼W₀₀.
  - Theorem 4.4 has W^{(2)}_{k,X} for W^{(2)}_{k₂,X}.
  - The proof of Theorem 4.1 has θ̄(m) = ∏_{p|m}θ̄(m) for ∏_{p|m}θ̄(p).
- **E6** (error, affects nothing).
  - **The problem.** The middle error term O(Σ_{m≤X^{1/κ}}X^{n(n+1)/2−n}) in (41) is wrong. Already for m = 1 the paper's own count #{H < X} has an error of order X^{n(n+1)/2−1}.
  - **Correction.** The term should be O(Σθ̄(m)m^κX^{n(n+1)/2−1}) = O(X^{n(n+1)/2−1/κ+ε}). The stated error term of Theorem 4.1 absorbs this.
- **E7** (error, affects the proof).
  - **The problem.** In Proposition 4.3, the splitting field of an irreducible g(x)ḡ(x) has degree up to 2((n/2)!)², not 2(n/2)!. For example, x⁴ − 2 has Galois group D₄ of order 8. The claimed index bound n(n − 1)/2 therefore fails for n = 4 and 6.
  - **Consequence.** For n = 6 the stated bound still follows. For n = 4 the argument gives only O(X^{22/3+ε}), not O(X⁷ log X).
  - **Why the theorems survive.** Every use needs only O(X^{n(n+1)/2−1/5}).
- **E8** (gap, affects nothing). Lemma 4.2 claims O(log X) choices of r | aₙ for each fixed aₙ. This holds only on average, which is all the count needs.
- **E9** (gap, affects nothing). The case n = 2 of Theorem 1.5(b) is not covered, since §§2–3 need g ≥ 1. It has a two-line elementary proof.
- **E10** (error, affects nothing).
  - **The problem.** Lemma 5.1 ignores signs. A Minkowski-reduced basis is unique at best up to sign, so the correct conclusion is g* = g or g*(x) = (−1)ⁿg(−x).
  - **Counterexample.** x³ − 50x ± 7 are distinct, strongly quasi-reduced (reduced basis 1, θ, θ² − 33, computed) and give isomorphic rings.
  - **Consequence.** In Corollaries 1.3–1.4 each field comes from at most two polynomials, so the bounds stand.
- **E11** (misprint). Fujiwara's bound on p.27 lacks its factor 2. For example, x² − 4 has the root 2 > √2.
- **E12** (gap, affects nothing).
  - In the proof of Lemma 5.2, "Minkowski reduced ⇔ γ ∈ F_SL" is false. F_SL is a Siegel set, and the proof needs the converse direction for well-separated tori, which holds.
  - The proof of Lemma 5.3 never addresses uniqueness, the "strongly" part. It holds off a lower-dimensional tie locus.

**Also checked and correct:**
- Yamamura's λₙ(p), by exhaustive counts modulo p² for n ≤ 5 and p ∈ {2, 3, 5};
- λ ≈ 0.3070557 and ζ(2)⁻¹;
- f_{B_m} and Q(B_m) = ±m, symbolically for g = 1, 2, 3 and both parities (the sign depends on the unspecified ordering; only |Q| is used);
- Q² | Δ on W₀, at random points for n = 3, …, 7;
- the vanishing of Δ on W₀₀ when some b_{i,n−i} = 0;
- the weight chains of Propositions 2.7 and 3.6, and δ(s) against 2ρ for types B_g and D_{g+1};
- the exponent bookkeeping of Lemma 4.2, Theorems 4.4 and 4.1, and Corollaries 1.3–1.4;
- the constant C₃ of Remark 5.6: 0.96530936 by integration, against the printed 0.965309365.

Crossref records no correction notice or update relation.

## Prerequisites not yet covered

- Bhargava's geometric sieve (arXiv:1402.0031), and Ekedahl 1991.
- Bhargava–Gross 2013 (2-Selmer groups of hyperelliptic Jacobians) and Bhargava–Gross 2014 (arithmetic invariant theory).
- Shankar–Wang 2018, and Wang's thesis.
- Bhargava–Gross–Wang 2017 (its own paper job is issue #1436).
- Shankar–Tsimerman 2014.
- Dietmann 2012.
- Ash–Brakenhoff–Zarrabi 2007 (Lenstra's density), and Yamamura 1991.
- Kondo 1995, with Yamamura 1986 and Nakagawa 1988.
- Ellenberg–Venkatesh 2006.
- Fujiwara 1916.

Links and reasons are in the JSON. Part II (Forum Math. Pi 2025) has its own paper job, issue #1350.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-WANG-22.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Mathlib citations were read at 082e2d3:
  - `RingTheory/Polynomial/Resultant/Basic.lean:930`;
  - `NumberTheory/NumberField/Discriminant/Defs.lean:36`.
- Tau Ceti citations were read at f790474:
  - `NumberTheory/NumberField/Index/Discriminant.lean:56`;
  - `NumberTheory/NumberField/Monogenic.lean:68`.
- Stage ids were checked against `data/atlas.json` and against the accepted restructures:
  - RS-07 narrows ST.0–ST.4 and SV.1 and keeps ST.5; the routed items fall within the narrowed scopes.
  - RS-29 keeps IG.2.
  - Nothing touches CA.3, GN.3 or AA.3, and none of these roadmaps is retired.
- Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
