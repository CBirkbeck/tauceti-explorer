# PAPER-KOYMANS-MILOVIC-21: Joint distribution of spins

Peter Koymans and Djordjo Milovic, *Joint distribution of spins*, [Duke Mathematical Journal 170 (2021), 1723–1755](https://doi.org/10.1215/00127094-2020-0068); arXiv [1809.09597](https://arxiv.org/abs/1809.09597).

Extraction by Claude Code, session `cc-fb70e5`, 22 September 2026 (issue #1318). Status: **complete**. The whole paper was read and every missing item is routed once. The machine-readable extraction is [PAPER-KOYMANS-MILOVIC-21.result.json](PAPER-KOYMANS-MILOVIC-21.result.json): 28 items (2 library, 4 planned, 22 missing), 5 routes, 10 prerequisite entries and 5 recorded source issues.

**Source.** arXiv v1 (25 September 2018, 23 pages), SHA-256 `d56a738ae1b1487dd01b92b7084dd6bd4b9a041a85efdd2fac66b86afd8af433`, read in full on 2026-09-22.

- It is the only public version. The Duke version (2021, 33 printed pages) could not be retrieved, since Project Euclid blocks scripted access, and it may be revised.
- Locators are v1 pages.
- FIMR (arXiv:1110.6331v2) was consulted for its Proposition 5.2 and §6.

## What the paper proves

Let K/ℚ be Galois of degree n: either totally real with every totally positive unit a square, or totally complex. Let S ⊂ Gal(K/ℚ) satisfy σ ∈ S ⇒ σ^{−1} ∉ S. The joint spin of a principal prime p = (π) is ∏_{σ∈S}(π/σ(π))_{K,2}; it governs the splitting of p in K(√∏σ^{−1}(π)).

- **Theorem 1.** Assume FIMR's Conjecture C_{|S|n} on short real character sums. Then Σ_{N(p)≤X}s_p ≪ X^{1−δ/(54|S|²n(12n+1))+ε}. This extends FIMR, which treats Gal(K/ℚ) = ⟨σ⟩ and S = {σ}, to non-cyclic groups, several automorphisms and totally complex fields.
- **Theorem 2.** The spins spin(σ_i, p) are jointly equidistributed. With S = {σ, σ²} this answers FIMR's question.
- **Theorem 3.** Under Conjecture C_n for all n, there is no governing field for the 16-rank of ℚ(√−4p). This is a conditional negative answer to Cohn–Lagarias, for whom governing fields exist for k ≤ 3 (Stevenhagen).

**The proof.** FIMR's sieve for primes (their Proposition 5.2) turns a type I estimate (2.5) and a type II estimate (2.6) into Theorem 1. The exponent ϑθ/(2 + θ), with ϑ = δ/(54n|S|²) and θ = 1/(6n), was checked against FIMR.

- **Type I (§3).** Write α = a + β with a ∈ ℤ. The spin becomes a character sum in a of modulus c = ∏c(σ, β), which Conjecture C_{|S|n} bounds unless c is nearly squarefull. Two new counts handle the bad β, replacing FIMR's cruder bound over all of O_K:
  - **Lemma 3.1** counts squarefull norms of β − σ(β) in a submodule, using Widmer's lattice count and Minkowski's second theorem.
  - **Lemma 3.2** counts β for which two norms N(β − σβ), N(β − τβ) share a large factor. It uses their coprimality (Dedekind's lemma, with σ ≠ τ and S ∩ S^{−1} = ∅), Bhargava's geometric sieve, and linear independence of the two congruences at unramified primes.
- **Type II (§4).** FIMR's spin factorisation reduces the sums to bilinear forms in φ(α, β) = ∏(α/σ(β)σ^{−1}(β)). These are bounded by the authors' earlier Proposition 3.6, with (P3) weakened to "not squarefull".
- **§5.** The field E = ℚ(ζ₈, √(1+i)) governs the 8-rank. The criterion (5.1) for 16 | h(−4p) turns a hypothetical governing field into a constant joint spin on degree-one primes, contradicting Theorem 1.

## What the atlas already has

- **Library (Mathlib at 082e2d3).**
  - Dedekind's independence of characters: `linearIndependent_monoidHom`.
  - Dirichlet's unit theorem: `NumberField.Units.exist_unique_eq_mul_prod`.
- **Planned.**
  - ClassicalArithmeticCompletion CA.1: quadratic residue symbols in number fields and Hilbert symbols at 2 and ∞.
  - GeometryOfNumbersAndQuadraticArithmetic GN.1: Minkowski's second theorem.
  - AnalyticNumberTheory AN.4: Chebotarev.
- **Not in the atlas.** Spins, prime-detecting type I/II sieves in number fields, governing fields, Widmer's count, the geometric sieve, and Conjecture C_n. No stage or earlier extraction mentions spins or governing fields.

## Routes

1. **Source of SieveMethodsAndPrimePatterns SV.5** (12 items). This is the spin development:
   - the setup and class-group representatives, spins and joint spins, and fundamental domains;
   - FIMR's sieve for primes;
   - the type I estimate with Lemmas 3.1–3.2, and the type II estimate with Lemma 4.1 and (P1)–(P3);
   - Theorems 1–2.

   SV.5 owns advanced sieves with their own bilinear, parity-breaking inputs, as separate developments.
2. **Source of ArithmeticStatistics ST.2 and ST.3** (5 items): Bhargava's geometric sieve (ST.2, uniform conditions at infinitely many primes); and for ST.3, 2^k-ranks and governing fields, the 8-rank field, the 16-rank criterion and Theorem 3.
3. **Source of ClassicalArithmeticCompletion CA.1** (2 items): quadratic reciprocity in number fields with Hilbert-symbol factors (Lemma 2.1), and norm compatibility of residue symbols.
4. **Source of GeometryOfNumbersAndQuadraticArithmetic GN.4** (1 item): Widmer's lattice-point count for sets with Lipschitz boundary, with the error in successive minima.
5. **Source of AnalyticNumberTheory AN.6** (2 items): Conjecture C_n and its arithmetic-progression form (Corollary 2.2), for AN.6's register of conjectural inputs.

## Source issues (`sourceIssues` E1–E5)

None affects the theorems. All are recorded against arXiv v1, and the printed version may differ.

- **E1** (misprint, §5).
  - ψ₀ is defined on O_E, so "α ∈ O_K … u ∈ O_K^×" should be "α ∈ O_E … u ∈ O_E^×".
  - In (5.2), "1_{16|h(−p)}" should be "1_{16|h(−4p)}".
- **E2** (misprint). Corollary 2.2 is missing the +ε in the exponent.
- **E3** (gap, nothing).
  - **The problem.** (2.5) is stated "for any nonzero ideal m", but §3, like FIMR's Proposition 6.1, proves it only for m coprime to F and to all σ(m), and only for a coprime to F.
  - **Repair.** If m and σ(m) share a prime, then every s_a with m | a vanishes, since that prime divides both α and σ(α). The condition (a, F) = 1 costs finitely many primes.
- **E4** (gap, nothing).
  - **The problem.** (3.16) cites Lemma 3.1 for g₁ > A (the squarefull part), but Lemma 3.1 controls the radical g₀ > Z, and a large squarefull number can have a tiny radical.
  - **Repair.** The proof of Lemma 3.1, summed over squarefull g > A, gives exactly the stated A^{−1/2+1/ord(σ)}.
- **E5** (misprint, Lemma 4.1).
  - **The problem.** (P3) has "Σ_{ξ mod w}" for Σ_{ξ mod N(w)}, and quantifies over all w although γ is defined on S_f.
  - **What the verification needs.** An unramified degree-one prime, guaranteed for w coprime to F ⊇ D_K. For a ramified prime, ∏σ(p)σ^{−1}(p) is a square.

**Also checked and correct:**
- the exponent bookkeeping in §3: the choice Y = x^{δ/(2n)} gives the claimed exponent, which is weaker than what the estimates allow;
- (3.26) and (3.27);
- the Artin–Dedekind coprimality argument;
- the S ∩ S^{−1} = ∅ condition in §5;
- that C_{tn} implies C_{mn} for m ≤ t, as Theorem 2 needs.

No correction notice or Crossref update relation exists.

## Prerequisites not yet covered

- Friedlander–Iwaniec–Mazur–Rubin 2013.
- Koymans–Milovic IMRN 2019 and Compositio 2019.
- Bhargava's geometric sieve.
- Widmer 2010.
- Bruin–Hemenway 2013.
- Cohn–Lagarias 1983.
- Milovic 2017, and McMeekin 2019.
- Stevenhagen's thesis.

Links and reasons are in the JSON.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KOYMANS-MILOVIC-21.result.json`: ok.
- Every missing item appears in exactly one route, and no route takes a planned or library item.
- Mathlib citations were read at 082e2d3:
  - `LinearAlgebra/LinearIndependent/Basic.lean:502`;
  - `NumberTheory/NumberField/Units/DirichletTheorem.lean:506`.
- Tau Ceti f790474 has no residue-symbol, Hilbert-symbol or spin declarations.
- Layer ids were checked against `data/atlas.json`, and prerequisite DOIs against Crossref.
- No Lean was written or compiled; none is a deliverable of this job.
