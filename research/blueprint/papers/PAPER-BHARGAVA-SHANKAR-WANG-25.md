# PAPER-BHARGAVA-SHANKAR-WANG-25: Squarefree values of polynomial discriminants II

Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants II*, [Forum of Mathematics, Pi 13 (2025), e17](https://doi.org/10.1017/fmp.2025.9); arXiv [2207.05592](https://arxiv.org/abs/2207.05592).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1350). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-BHARGAVA-SHANKAR-WANG-25.result.json](PAPER-BHARGAVA-SHANKAR-WANG-25.result.json): 75 items (1 library, 2 planned, 72 missing), 7 routes, 15 prerequisite entries and 11 recorded source issues.

**Source.** The published open-access article (CC BY 4.0), 57 pages, SHA-256 `1cdd11c0f7ea39deda07685ddd55a47720f94dfd0a5b1ce2769e4d39352f55d3`, read in full on 2026-09-22. Part I ([PAPER-BHARGAVA-SHANKAR-WANG-22](PAPER-BHARGAVA-SHANKAR-WANG-22.md)) was compared wherever Part II relies on it.

## What the paper proves

Order integral binary n-ic forms f = a₀xⁿ + ⋯ + aₙyⁿ by H(f) = max|aᵢ|.

- **Theorem 1.** The density with squarefree discriminant exists and is an explicit Euler product. It is about 38.97% for n = 2, 24.64% for n = 3, and 20.83% for n ≥ 4. The paper prints 21.18% for n = 4, which is wrong (E1).
- **Theorem 2.** The density with R_f maximal is ζ(2)⁻¹ζ(3)⁻¹ ≈ 50.57% for n ≥ 3. This is the arithmetic Bertini theorem that Poonen conjectured for P¹_ℤ, proved for every fixed n.
- **Theorem 6.** Both counts hold with a power saving.
- **Theorem 3.** There are ≫ X^{1/2+1/(n−1)} S_n-fields of degree n with discriminant below X. This improves Part I's X^{1/2+1/n}.
- **Theorem 4.** Nakagawa's retracted lower bound for unramified Aₙ-extensions of quadratic fields holds.

**Strategy.** Everything rests on the tail estimate, Theorem 5.

1. **Strong divisibility (p² | Δ(f + pg) for all g).** Bhargava's geometric sieve.
2. **Weak divisibility, n odd (§§3.4, 4).** As in Part I, an explicit map σ_m sends f into pairs of symmetric matrices 2 ⊗ Sym²(n), inside the subspace W₀, where the Q-invariant equals m.
   - The Q-invariant is the hyperdeterminant of format 2 × g × (g + 1).
   - The fundamental domain splits into the main body, where distinguished points are rare (large sieve, Proposition 4.3), the shallow cusp (Ho–Shankar–Varma), and the deep cusp, where |Q| > M saves 1/M.
3. **Weak divisibility, n even (§§3.5, 5, 6).** Binary forms need not be determinants, so f is replaced by xf, whose pencil has singular B.
   - A new q-invariant takes the value m.
   - §5 proves a skew-box version of Eskin–Katznelson's count of singular symmetric matrices.
   - §6 fibers over the row space of B. Main body: large sieve with a fixed B₀ (Lemma 6.7). Shallow cusp: a long case analysis (Lemmas 6.12–6.23). Deep cusp: an upper bound for |q| (Proposition 6.26).
4. **The sieve (§7, Theorem 7.1)** and the local densities (Appendix).

## What the atlas already has

- **Library.** Mathlib `NumberField.discr`. Mathlib's `Polynomial.discr` covers only the dehomogenized form. Tau Ceti's Stickelberger congruence covers only number fields.
- **Planned.**
  - InverseGaloisAndArithmeticFundamentalGroups IG.2: Hilbert irreducibility.
  - AdelicAlgebraicGroups AA.3: Siegel sets.
- **Elsewhere.** The monic analogues of the invariant theory, the geometric sieve and Minkowski reduction are items of Part I (routed to ST.0–ST.3 and GN.3). The design jobs should coalesce them.

## Routes

1. **Source of ArithmeticStatistics ST.0 and ST.1** (26 items).
   - **ST.0 (families, heights and local densities):**
     - binary forms, height and discriminant;
     - Stickelberger's congruence;
     - strong and weak divisibility;
     - ν₀, ν₁, αₙ(p), βₙ(p) and Lenstra's density.
   - **ST.1 (integral invariant theory and orbit parametrizations):**
     - the ring R_f;
     - the representation 2 ⊗ Sym²(n): invariants, J_f[2]-stabilizers, distinguished orbits and the orbit criterion for even n;
     - U_g and Proposition 3.1 (castling);
     - the Q-invariant, Propositions 3.2–3.4, Theorem 3.5 (Q² | Δ) and the corrected Proposition 3.6;
     - σ_m and Theorem 3.7, |Q| on lattices, and Proposition 3.8;
     - the even construction, the q-invariant, and Proposition 3.9.
2. **Source of ArithmeticStatistics ST.2** (29 items). The whole tail machinery:
   - odd n: averaging, Propositions 4.4–4.8 and Theorem 4.2;
   - even n: the auxiliary sets, Lemmas 6.1–6.2, the row-space fibering, Proposition 6.3, Lemmas 6.4–6.7, Theorem 6.6 (corrected), the shallow cusp (Theorem 6.11), and the deep cusp (Lemma 6.25 corrected, Proposition 6.26, Theorem 6.24);
   - Theorem 5, Corollary 6.27 and Theorem 7.1.

   RS-07 narrows ST.2 to exactly this: cusp and reducible contributions and uniform tail estimates, consuming GN.4.
3. **Source of ArithmeticStatistics ST.3** (8 items):
   - Theorems 1 (corrected), 2 and 6;
   - the arithmetic Bertini theorem;
   - quasi-reduction and Lemma 7.2 (corrected);
   - Theorems 3 and 4.
4. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.4** (6 items):
   - Davenport's lemma and Schmidt's bound;
   - the §5 counts of singular symmetric matrices in skew balls (Theorem 5.3, Propositions 5.4–5.7, Theorem 5.1).
5. **Source of GN.3** (1 item): Minkowski-reduced bases.
6. **Source of SieveMethodsAndPrimePatterns SV.2** (1 item): the multidimensional large sieve (Proposition 4.3).
7. **Source of IG.2** (1 item): Kuba's count of reducible forms.

No new roadmap or Part II is needed.

## Source issues (`sourceIssues` E1–E11)

The main theorems stand, except that the n = 4 constant of Theorem 1 is wrong (E1). The deep-cusp argument for even n has a gap with an easy repair (E2, E3).

- **E1** (error, affects a stated result).
  - **The problem.** ν₁(n, p) for n ≥ 4 is quoted with (−p)^{−n} where (−p)^{2−n} is correct. Hence αₙ(p) and Theorem 1 are wrong for n = 4.
  - **Correction.** α₄(p) equals the n ≥ 5 value, and the density is ≈ 20.83%, not 21.18%.
  - **Evidence.** Exhaustive counts mod p² give α₄(3) = 176/243 and α₄(5) = 2784/3125. The monic check ν₀ + ν₁ = λₙ(p) fails with the printed ν₁.
  - **Not checked.** Ash–Brakenhoff–Zarrabi could not be read, so whether the slip is theirs is open.
- **E2** (error, affects the proof). Proposition 3.6, det(A^topA^topᵗ)det(B^topB^topᵗ) | Δ, is false.
  - **Why.** Over ℂ, det(MMᵗ) = 0 does not force rank M < g.
  - **Counterexample.** For n = 3, A = [[0,0,1],[0,0,0],[1,0,1]] and B = [[0,1,1],[1,1,0],[1,0,0]] give Δ = 5, while the product is 2.
  - **What is true.** Δ lies in the ideal of maximal minors, so |Δ| ≪ det(B^topB^topᵗ)^{1/2} on bounded sets.
- **E3** (error, affects the proof). Lemma 6.25's scaling treats Δ on W_{n+1} as having degree (2n − 2)(n + 1) instead of 2n(n + 1). It also assumes only |Δ(A, B)| > X^{2n−2−κ}, although Δ(A, B) = Δ(f)f(0, 1)².
  - **Repair.** Discard the O(X^{n+1−κ/(2n−2)}) forms with small |f(0, 1)|, work in dyadic heights, and use E2's bound. Then Theorem 6.24 holds with X^{n+1+κn/(n−1)}.
  - **Consequence.** In Theorem 5(c) and Corollary 6.27, ξₙ becomes 1/(44n⁵) instead of 1/(88n⁵). ηₙ and Theorems 1–4 and 6 are unchanged.
- **E4** (error, affects the proof). Theorem 6.6's exponent 1/(4n) is not reached for n = 4: the proof gives 1/21. Nothing downstream changes.
- **E5** (error, affects nothing). Lemma 7.2 ignores the sign ambiguity of Minkowski bases.
  - **Counterexample.** f = x³ − x²y + xy² + y³ (disc −44) and f(−x, y) are strongly reduced with the same R_f, but they are not SL₂(ℤ)-equivalent.
  - **Consequence.** The conclusion should be GL₂(ℤ)-equivalence. Theorem 3 is repaired by choosing B accordingly.
- **E6** (gap, affects nothing). The proofs define W^{(2)}_m only for odd m. Even m are empty by Stickelberger for binary forms (checked mod 4), which is never said.
- **E7** (gap, affects nothing). V(ℤ)^red (Galois group ≠ Sₙ) is bounded by citing Kuba, who counts reducible forms only. Irreducible non-Sₙ forms need, e.g., the large sieve.
- **E8** (gap, affects nothing). The n = 2 case is only asserted ("classical methods"). A proof is given in the entry.
- **E9** (gap, affects nothing). The normalization (8) needs (m, b₀) = 1, which Part I does not provide. An SL₂ shift repairs it.
- **E10** (misprints), for example:
  - Poonen's density lacks its ⁻¹;
  - "odd" is missing in Theorem 3.7;
  - (20) should run over j ≤ g (checked symbolically);
  - "U₁" should be U′;
  - e_n should be e_{n+1} in Proposition 3.9;
  - |Δ| is needed in (32);
  - p^n·#O(b₀) in Lemma 6.7;
  - T₂ in (48), Y in (58), and min in Lemma 6.21;
  - m^{2n+ε} in §6.5;
  - "N ≥ 3" in Corollary 6.27.
- **E11** (gap, affects nothing). Theorem 7.1's proof omits the conditions at p | N from W_m(Σ) and from γ(Σ, N, m). Theorem 3 applies Theorem 7.1 to a scaled region, not the height box.

**Also checked and correct:**
- α₂, α₃, αₙ (n ≥ 5) and βₙ, by exhaustive counts;
- the constants of Theorems 1 (n = 2, 3) and 2;
- the Appendix congruence Δ ≡ −4a₀a₂³Δ(a₂x^{n−2} + ⋯) (n = 3, …, 6);
- Q² | Δ on pairs (n = 3, 5);
- the (19)–(20) bookkeeping;
- Lemma 4.7, Propositions 4.4 and 6.9, and the balances in Theorem 6.6 and Proposition 6.18.

Crossref records no correction notice or update relation.

## Prerequisites not yet covered

- Part I (extracted as PAPER-BHARGAVA-SHANKAR-WANG-22).
- Ash–Brakenhoff–Zarrabi 2007.
- Bhargava's geometric sieve.
- Bhargava–Gross–Wang 2017 and AIT II.
- Ho–Shankar–Varma 2018.
- Eskin–Katznelson 1995.
- Schmidt 1968, and Davenport 1951.
- Huxley 1968 and Kowalski (large sieve).
- Kuba 2009.
- Sato–Kimura 1977.
- Nakagawa 1989–1991.
- Birch–Merriman 1972 and Wood 2011.
- Poonen 2004.
- Bhargava 2010 and Bhargava–Shankar 2015.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-WANG-25.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Stage ids were checked against `data/atlas.json` and against the accepted restructures:
  - RS-07 narrows ST.0–ST.3 and SV.2, and the routed items fit the narrowed scopes;
  - RS-29 keeps IG.2;
  - GN.3, GN.4 and AA.3 are untouched, and no cited roadmap is retired.
- Mathlib citation read at 082e2d3: `NumberTheory/NumberField/Discriminant/Defs.lean:36`.
- Prerequisite DOIs were checked against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
