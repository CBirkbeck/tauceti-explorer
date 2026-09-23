# Review: PAPER-KOYMANS-PAGANO (Koymans–Pagano, On Stevenhagen's conjecture)

Job `REV-PAPER-KOYMANS-PAGANO` (issue #2195), by Claude Code, session `cc-d67081`, 23 September 2026. The extraction was written by session `cc-39fac3` (issue #2194). **Verdict: accept.** All six routes are accepted. All 51 recorded mistakes are confirmed. No item, status or route was changed; four corrections were amended in place.

## What was read

- **arXiv [2201.13424](https://arxiv.org/abs/2201.13424)v1**, 110 pages, SHA-256 `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd` — the hash the extraction records, matched byte for byte. Fetched into scratch, never into the repository.
- Read at and around **every locator**: §1, §§2.1–2.3, §3, §4, §§5.1–5.3, §§6.1–6.3, §§7.1–7.3, §§8.1–8.4. Wherever the finding turned on typography — calligraphic ℳ against roman M in Definition 7.4 and the proof of Proposition 7.6, primes, superscripts — I settled it on the **page image**, not on the text layer.
- **Library baseline:** Mathlib `082e2d3`, Tau Ceti `f790474`, through the pinned declaration index.
- **Erratum check, done independently of the extraction:** arXiv 2201.13424 has only **v1** (31 January 2022), with no journal reference; Crossref has no published version of the paper (query for the title and authors, and a check that `10.1007/BF01388835` — Gerth — resolves as E51 says). So no later version corrects any finding, and every entry's `known: "new"` stands.

## Items and statuses

- **Statements and locators.** Sampled across the paper and checked verbatim: Definition 2.12 (p. 14), Proposition 2.6 and its proof (pp. 10–11), Definition 4.2 (p. 28), Lemma 4.5 (p. 30), the §5.3 set-up and Definitions 5.8–5.9 (p. 45), Definition 6.1 (p. 53), Lemma 6.5 and Proposition 6.6 (p. 54), Lemmas 6.7–6.10 (pp. 55–58), Definitions 7.3–7.5 and Proposition 7.6 (pp. 60–62), Definition 7.9 and Theorem 7.10 (p. 71), Theorem 8.2 (p. 77), (8.5) (p. 79), Definition 8.11 and X_pre (pp. 87–88), (8.20)–(8.22) (p. 92), (8.44) and (8.49) (pp. 104, 107). Every one matched. I also checked the headline constant myself: ∏_{j odd}(1 − 2^{−j}) = 0.4194224, the paper's 0.41942, so Theorem 1.1's limit is 0.5805776.
- **Nothing is missing on the way to the main results.** The chain Theorem 1.1 ← 8.1 ← 8.2 ← 8.7 ← 8.8 ← 8.10 ← 8.13, and the algebra it feeds on (raw cocycles, expansion maps, the Artin pairings, Theorem 3.2, Theorems 4.6, 5.2, 5.3, 5.5–5.7, 5.10, 5.11, the §6 combinatorics and the §7 equidistribution) all have items.
- **Library (6 items, 7 declarations).** All 7 exist at the pinned commits: `Field.absoluteGaloisGroup`, `Squarefree`, `legendreSym.quadratic_reciprocity_one_mod_four`, `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`, `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`, `ProbabilityTheory.meas_ge_le_variance_div_sq` (Mathlib) and `NumberField.NarrowClassGroup` (Tau Ceti). Each provides what its item claims.
- **Planned (17 items).** Every cited stage id exists in `data/atlas.json`, and the layers do plan the items — checked layer by layer, and in detail for ℚ(A) (Multiquadratic layer 0, square-class descent), the Hilbert pairing (QuadraticFormInvariants 6C and ClassFieldTheory layer 14) and genus theory (Multiquadratic layers 2–3).
- **Missing (241 items).** Searched the pinned index and the atlas myself for the method's vocabulary — Rédei, governing field, reflection principle, expansion map, raw cocycle, additive system, higher Artin pairing, Stevenhagen, negative Pell. Nothing owns any of it. The statuses stand as extracted.

## Routes

All six accepted; see `PAPER-KOYMANS-PAGANO.review.json` for the reason on each. In summary: the Part II is justified (nothing in the atlas plans Smith's method, its parent and area are sound, its id is free, and its brief states Theorem 1.1 exactly, gives six layers that follow §§2–8, names two tests and says what to import rather than re-plan), and the five source routes put each of the remaining 22 items in the layer that owns it — Pell equations in `CA.4`, the family and the distribution results in `ST.0/ST.3/ST.5`, exceptional zeros and effective Chebotarev in `AN.2/AN.4/AN.5`, Heath-Brown's quadratic large sieve in `SV.2`, Erdős–Kac on 𝒟 in `PM.1`. Every missing item is routed exactly once, and no Tau Ceti roadmap is re-planned.

## Mistakes in the paper (`sourceIssues` E1–E51)

**All 51 are confirmed**, each with a `review` object giving the reason I could check it myself. The strongest of them, with what I verified:

- **E4 (error).** Proposition 2.9 and Corollary 2.11 are stated for every x₀ ∈ C, but the proof (p. 13) replaces χ_{xx₀}(σ) by |T_x ∩ T_σ|. Since xx₀ ≡ ∏_{i : π_i(x) ≠ π_i(x₀)} p_i(1)p_i(2) modulo squares, the true exponent is |T_σ ∩ (T_x Δ T_{x₀})|, so the substitution is valid exactly at the vertex with T_{x₀} = ∅. Both uses in the paper take that vertex.
- **E15 (error).** Definition 3.1's second condition is printed with L(ψ_i). In the proof of Theorem 5.2 (p. 36) ψ₂ has pointer χ₋₁, so ℚ(i) ⊆ M(ψ₂) and ∞ never splits completely there: as printed the condition demands that L(ψ₁) be totally real, and the proof checks only M(ψ₁). By (5.1) the action of complex conjugation on L(ψ₁)/M(ψ₁) is the quantity Theorem 5.2 is computing, so the printed reading would make the argument circular. Read with ℚ(χ_i), as p. 21 already reads it, the proof is complete.
- **E9 (error).** Proposition 3.6(c) is stated only for places v ≠ (2), and at (2) the Artin symbol is defined only for the index i of Definition 3.1's fourth condition; the remark on p. 24 and the case split on p. 26 ignore both restrictions.
- **E13 (gap), amended.** For s = 1 two steps fail, and the extraction had recorded only one. The four-tuple built on p. 33 has base set {χ_{p_j(1)p_j(2)} : j ∈ [s] − {i}}, which is empty, while §3.1 (p. 20) opens "Let n ∈ ℤ_{≥1}" and the proof of Theorem 3.2 uses n ≥ 1 at the real places (p. 26). And there is no T ⊆ [s] of size 2, so the reduction on pp. 32–33 is vacuous while the fact needed is (a/p₁(1)) = 1. I checked the repair: in the product formula for the Hilbert symbol (a, p₁(1)p₁(2)) the terms at ∞, at (2) and at every l | a vanish by Remark 4.1, by p₁(1)p₁(2) ≡ 1 mod 8 and by Definition 4.2's fourth condition, so (a/p₁(1)) = (a/p₁(2)) = 1.
- **E41 (gap).** Theorem 8.2 is stated for m ≥ 3, so the i = 2 factor of the telescoping product on p. 77 is not an instance of it.
- **E46 (gap).** The displayed estimates give log δ′^{−1} > e^{(3/10)k_gap}/(5M_box^m); with M_box = ⌊(log log log log N)^{1/(5(m+1))}⌋ and k_gap > r^{1/2}/2 − 1, r ≍ ½ log log N, what follows is δ ≤ exp(−e^{k_gap/4}), not the printed e^{−¼e^{k_gap}}, which would need log δ^{−1} ≳ e^{k_gap}. The weaker bound is still far below the error term it is used against.
- **E48 (gap).** For the x failing (8.22) the trivial bound Λ(x) ≤ R leaves the factor d(M_box, m)^{r−k_gap}, which the density O(e^{−k_gap/2}) does not absorb. Cauchy–Schwarz on the two moments does: with μ = R/d^{r−k_gap}, (8.20) and (8.21) give ∑(1 − Λ/μ)² = O(e^{−k_gap})|X(a, Q)|, hence ∑|1 − Λ/μ| = O(e^{−k_gap/2})|X(a, Q)|.
- **E20, E22, E23, E24, E27, E28, E30, E33, E42, E43, E44, E45 (misprints)** were each settled against the paper's own neighbouring text: C is an (s+1)-cube (p. 45); Definition 5.9 makes governing triples type 2 and carries [s] − T; Definition 6.1's next bullet defines C_T^acc as a subset of C_T; Lemmas 6.8–6.9 carry the K(X) that Lemma 6.10 drops, and its degree formula then needs the S = ∅ term ℚ(√d); Definition 7.4 makes ℳ_{r,P}, not M_{r,P}, the set forced empty in the base case; Proposition 7.6 normalizes both sides of its conclusion by the same power of 2; (8.5) is about |X_j|; S = S′ ∪ {i_Cheb} with i_Cheb > k_gap; and c(x₀, x) fixes pr₁ = π_i(x₀).

**Two remarks on classification, which I left as extracted.** E4 and E7 are the two marked `affects: "a stated result"`; the misprints that also make a statement wrong as printed (E3, E5, E22, E24) are marked `nothing`, on the line that a misprint's intended statement is clear. E21 and E35 are errors marked `nothing` because each repair is a one-line substitution, where E9 and E15 change how the argument is run. Both lines are defensible and applied consistently.

## Changes made to the extraction

Four corrections were amended; nothing else changed.

- **E12.** Struck the first half, "'is at most 2'". The printed "equals 2" in Lemma 4.5(ii) is right: K ⊆ ∏_x L(ψ_{k+1}(x)) forces e_p ≥ 2, while each L(ψ_{k+1}(x))/ℚ(√x) is unramified at the finite places and inertia is cyclic at odd p by tameness and of order ≤ 2 at (2) by the lemma's standing hypothesis. The second half stands and is what the entry is about: p. 29 claims Proposition 4.4 gives cyclicity of *all* decomposition groups of K/ℚ, and at a prime p_i(h) that group can be (ℤ/2)²; the hypothesis the conclusion needs is local at p, which is what Proposition 4.4 supplies.
- **E13.** Added the empty base set of the s = 1 four-tuple, as above. The report already said this; the entry did not.
- **E17.** Restricted to what is checkable: that one symbol χ stands for two applications of the analysis, so the step needs the two contributions ∑_{q|a₁} χ(Frob(q)) to agree or vanish; and that φ_{a₁;a_{s+1}} should not be called Pellian, since Definition 5.4 constrains the top map of a family with support {a₁, …, a_{s+1}}.
- **E18.** Restricted to the omission I verified — Theorem 5.5 applies only to a Pellian expansion map, and neither Theorem 5.3 nor Theorem 4.6 says the attached map is one, so the one-line proof of Theorem 5.6 skips Definition 5.4. Which of the six conditions need work I did not settle, so the extraction's account (conditions (2)–(6) from Theorem 4.6, condition (1) only for a suitable ψ_{s+1}(x₀), with its alternative) is kept and labelled a suggestion.

A `verification` block records the review in the result file; the report carries a note at the top, the sharper E13, and the E12 amendment.

## Where I was wrong first

On E30 I read Definition 7.4's calligraphic ℳ as the *full* index set and was about to rewrite the correction backwards. The page image settles it the other way — "Let ℳ_r ⊆ M_r and ℳ_{r,P} ⊆ M_{r,P} and let a : ℳ_r ⊔ ℳ_{r,P} → 𝔽₂" — so the extraction had it right and the entry stands unchanged. Noted because the text layer of this paper loses the distinction everywhere, and any later worker will hit it.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KOYMANS-PAGANO.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the four touched files reports no problems.
- Every missing item is routed exactly once; 241 missing, 241 routed.
- Every planned and route stage id exists in `data/atlas.json`; the Part II's parent exists, its id does not, and its area is a galaxy id.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
