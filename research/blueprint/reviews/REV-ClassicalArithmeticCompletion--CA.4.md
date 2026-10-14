# REV-ClassicalArithmeticCompletion--CA.4

Independent review of `BP-ClassicalArithmeticCompletion--CA.4`, the follow-up part for layer CA.4 (classical Diophantine equations: Markoff and Markoff–Hurwitz surfaces, negative Pell radicands, the formal triple product). Done by Claude (Opus 5.5), session `claude-xDsM16`, issue [#9677](https://github.com/CBirkbeck/tauceti-explorer/issues/9677), on 2026-10-14. The plan was written by session `claude-buloOr` (PR #9704); this session wrote none of it and no earlier review of the roadmap.

**Verdict: accepted.** The packet, its reader and its suggested Lean file were corrected in place. The review object is in the packet, with a verdict for every node.

## Scope and method

The review is at target level (PROTOCOL §2). Each of the 43 nodes was checked against its sources at the locators, against the pinned Mathlib 082e2d3 for every cited declaration, for closure and for the truth of its statements, tests and acceptance values.

**Sources.** All nine were fetched again. Eight SHA-256 values equal the packet's. The Wayback copy of Andrews 1965 now serves a file with hash b029d0ef… instead of the recorded acac30fd…, so the hash was updated; the copy shows pp. 333–334 as cited.

- I read Ghosh–Sarnak §§1–6, 8 and 10 myself, at every locator the nodes give. Page 10 (Lemmas 2.1–2.2 and the levels 1–3) was also read as an image, and so was Andrews p. 333.
- For Gamburd–Magee–Ronan, Chen, Koymans–Pagano, Pak, Andrews, Zhu, Dummit and Hirschhorn, Haiku subagents retrieved the passages at each locator. I read the quoted lines and the relevant pages, and every verdict is mine.

**Computation.** Every numerical claim was recomputed by scripts written for this review, independent of the plan's.

- **Identities.** The Δ factorisation, the Bhargava discriminants, narrow invariance, (4.1) and (8.2) were checked on 2,000 random integral points. Δ mod 4 and the sign criterion were checked on boxes.
- **Local points.** Corollary 6.3's point was checked exactly over ℚ and modulo pⁿ. Every 2-adic and 3-adic point family was checked.
- **Lemma 6.4.** The point count was checked for all α, β and p ≤ 13. Solubility modulo 16, 27, 25, 49, 32 and 81 was compared with admissibility.
- **Gauss sums.** The normalisation (i)–(vi) was checked numerically for p ≤ 17.
- **Small levels.** V₁(ℤ) and V₂(ℤ) were enumerated for |xᵢ| ≤ 40.
- **Fundamental sets.**
  - F⁺ at 54, 3685, 9454 (with the eleven points) and 9500; F⁻ at −2, −4 and −3691.
  - The box U(k) was checked against an unbounded search at 43 levels.
- **Hasse failures.**
  - The first ones: 46, 56, 86, 124, 126, 142, 161, 198 and −4, −8, −14, −18, −19.
  - Every family member the packet names: −14, −158, −238, −1454, 342, 1062, 1456, 1926, 16432 and 33624.
  - The family-(i) counts 1, 5, 13, 113.
- **Table 3.** A_HF(100800) = 7630, with 7105 admissible exceptional levels whose F⁺ is empty.
- **Negative Pell.** 𝒟⁻(11), 𝒟⁻(35) and 34, 221 ∉ 𝒟⁻, by continued-fraction periods; 𝒟⁻ ⊆ 𝒟 for d < 2000.
- **Triple product.** Both forms, the cube identity, (ii)–(iv) and Euler's identity were expanded to degree 40, with Laurent-polynomial coefficients where the parameter is free.
- **Orbit counts at exceptional levels.** Exact counts by the small-coordinate argument below.

**Subagents.** Sonnet subagents pulled the 46 baseline signatures, the supplier, tier and duplication data, and the 27 frontier-disposition suppliers. A further Sonnet subagent proofread the edits. Every verdict is mine.

## Counts

| | Count |
| --- | ---: |
| Nodes | 43 (7 definitions, 4 constructions, 28 theorems, 4 lemmas) |
| Verified | 32 |
| Corrected | 11 |
| Added | 0 |
| Unverifiable | 0 |
| API items | 90 (2 added) |
| Unit tests | 61 |
| Planets | 6 (unchanged) |
| Baseline declarations | 48 (46 confirmed, 2 added; 5 `provides` texts made exact; none removed) |
| Requests | 2 (both checked, unchanged) |
| Gaps | 2 (kept) |
| Source issues | E551, E552 confirmed; E553 confirmed and upgraded from gap to error; E554 confirmed and sharpened; E555 added |
| Frontier dispositions | 45 (6 supplier notes corrected) |
| movedDown / consumerRetargets | 2 / 11 (1 and 4 added) |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. `lean-check` on the suggested file exits 0 with 173 warnings, every one "declaration uses `sorry`". Every packet API and unit-test name appears in the file.

## Corrections

### Mathematics

1. **The character form of the reciprocity obstruction** (`markoff-reciprocity-obstruction`).
   - Ghosh–Sarnak's (8.1) asserts, for every x ∈ V₄₊d(ℤ), that x_j² − 4 lies in S_d = {n : (4d/n) ∈ {0, 1}} modulo 4d. The node repeated this. It is false.
   - **Counterexample.** k = 2, d = −2, x = (1, 1, 1). Here x₁² − 4 = −3 ≡ 5 (mod 8), and the primitive character (−8/·) takes the value −1 at 5.
   - **Why.** A negative x_j² − 4 brings in the sign (4d/−1) = sgn d. The source's proof factors x_j² − 4 into primes and ignores its sign.
   - **Exact scope of the failure.** It fails exactly when d < 0, 3 ∤ d and x_j = ±1. Then 3 divides x_j² − 4 = −3, which forces (d/3) = 1, so the odd character takes the value −(d/3) = −1 at −3. The only level where this happens is k = 2: a coordinate ±1 needs k ≥ 1, V₃(ℤ) = ∅, and 3 ∣ d at k = 1.
   - **Fix.** The statement now carries this exception, and the proof sketch handles the sign. The supplementary laws `jacobiSym.at_neg_one` and `jacobiSym.at_two` are cited for negative or even d, and were added to the baseline. A new acceptance item records the counterexample. New source issue E555.
   - The prime-factor form, which is what the Lean statement and the Hasse-failure nodes use, is right and unchanged.
2. **The class-number bound at exceptional levels** (`markoff-class-number-finite`, `markoff-class-number-upper-bound`, E553). The plan recorded a gap: the bound h_M(k) ≪ |k|^{1/3+ε} "appears to fail" on k = 4 + w². I proved that it fails.
   - **Upper bound.** On the line (2, t, t + w), V₂ followed by a transposition shifts t by w. A double sign change followed by a transposition sends t to −t − w. So there are at most ⌊w/2⌋ + 1 classes. The finiteness node said at most w; it now says ⌊w/2⌋ + 1.
   - **The classes are distinct: the Δ-structure.**
     - By (4.1), a point all of whose coordinates have absolute value ≥ 3 has exactly one Δ-smaller neighbour.
     - Its Δ-larger neighbours again have all coordinates ≥ 3.
     - So a shortest Γ-path between two points with a coordinate in {0, ±1, ±2} passes only through such points.
   - **The classes are distinct: the small points.** These are finitely many off the line:
     - coordinate 0, from a² + b² = 4 + w²;
     - coordinate ±1, from a² ∓ ab + b² = 3 + w².
   - **The classes are distinct: the edges.** The moves join small points to the line only as follows:
     - (0, 2, w) joins the class t ≡ 0;
     - the coordinate-±1 points join the class t ≡ ±1;
     - every other line point joins only points of its own class.
   - **Extent of the proof.** The case analysis covers every w ≥ 9. An exact computation of the small-coordinate graph covers every w ≤ 300. A bounded union-find over all points with coordinates up to 900 agrees for w = 3, 5 and 10.
   - **Conclusion.** h_M(4 + w²) ≥ ⌊w/2⌋ + 1 > √(k − 4)/2. Ghosh–Sarnak's consequence (c) is therefore false along these levels, and E553 is now an error. The node already restricted (b) to non-exceptional levels; its remarks now state the proved count. k = 13 has exactly two line orbits.
3. **h_M(3685)** (`markoff-class-number`, E554).
   - The same Δ-structure shows that the orbit of a negative root contains no small-coordinate point.
   - The small-coordinate points of V₃₆₈₅(ℤ) all have a coordinate ±1, since 3685 is not a sum of two squares and 3681 is not a square. They form one orbit.
   - So h_M(3685) = 7 exactly. The plan had h_M(3685) ≥ 7.
4. **Second form of the triple product** (`jacobi-triple-product`). The coefficient of t^m of the finite products stabilises once i > m + 1, not once i > m: the factor 1 + s⁻¹t^{i−1} with i = m + 1 still contributes to t^m. A truncated expansion confirmed it.
5. **The class number at k = 4** (`markoff-class-number`). The statement said h_M(k) is zero exactly when V_k(ℤ) = ∅, without excluding k = 4, where Nat.card of the infinite orbit set is 0. It now states the convention, as the API item `markoffClassNumber_eq_zero_iff` already did.

### Sources and locators

6. **Table 3** (`markoff-class-number-enumeration`) prints 12.97620% of the A(100800) = 58,800 admissible levels, not the count 7630. The count was recomputed and agrees, and the wording was corrected.
7. **Hirschhorn.**
   - The cube identity is his identity (2), not "(i)".
   - The locators gave the journal pages 436–437, which cannot be read in the author's TeX version the plan read. They now give that version's pp. 1–3, and the source's edition says so.
   - The theta-product match counted "three theta products and Gauss's identity". §2 uses two theta products and the identity ∏((1 − xⁿ)/(1 + xⁿ)) = Σ(−1)ⁿx^{n²}.
8. **Pak §2.2** (`power-series-product-specialisation`). The match attributed to the survey the coefficientwise principle that the node supplies. §2.2 only writes the generating functions as products. The match was rewritten.
9. **Gamburd–Magee–Ronan, p. 15** (`markoff-hurwitz-infinite-descent`). Baragar characterises the fundamental solutions only for a ≥ 2(n − 1)^{1/2}. The match now says so.

### Bookkeeping

10. **Frontier dispositions.** I read each library supplier of the 45 first-pass items at the pin and corrected six:
    - `integer-linear-systems`: `Matrix.ker_diagonal_toLin'` is stated over a semifield and was dropped. The diagonal system is solved coordinatewise.
    - `negative-pell-least-solution-squares-to-fundamental`: the node's own step uses `Pell.IsFundamental.eq_pow_of_nonneg`, which replaces `eq_zpow_or_neg_zpow` and `Zsqrtd.toReal_injective`.
    - `negative-pell-classification`: `Pell.Solution₁.exists_pos_variant` concerns norm-one solutions only. It was replaced by `eq_zpow_or_neg_zpow` for the norm-one step; the norm −1 sign reduction is a proof step.
    - `small-norm-pell-decision-by-convergents`: `Real.exists_rat_eq_convergent` is Legendre's criterion, not denominator transport. `Real.convs_eq_convergent` was added for the transport.
    - `primitive-zero-of-a-form`: `MvPolynomial.IsHomogeneous` replaces `IsWeightedHomogeneous`, since the node uses ordinary homogeneity.
    - `local-solubility-of-a-primitive-zero`: `PadicInt.norm_int_lt_one_iff_dvd` was added, since a coordinate prime to p has norm 1.
11. **Duplication found by the supplier sweep.**
    - ArithmeticStatistics `ST.0/negative-pell-radicands` and the 𝒟, 𝒟⁻ part of `ST.3/restricted-real-quadratic-family` (accepted, tier 14) define the same sets as `negative-pell-radicand-sets`. CA (tier 5) now owns them. A movedDown entry and two consumer retargets were added, and the node's use entry names them. ST.0 truncates at d ≤ X; ST.3 and Koymans–Pagano at d < X.
    - QSeries `QM.0/jacobi-cube-identity` duplicates `jacobi-cube-identity`. QSeries is outside the upstream order. It was added to the moved-down QM.0 nodes and to the consumer retargets.
    - ExponentialSums `ES.3/markoff-odd-local-density` has, as its first increment, N_p/p² − 1 for Lemma 6.4's count. ExponentialSums is outside the order. A consumer retarget to `markoff-type-point-count-mod-p` was added.
12. **New API** (`markoff-class-number`). GN.4 (tier 3) owns the lattice-point counts R^±(K) of Ghosh–Sarnak (1.6) and Lemmas 7.2–7.3, on exactly the sets F^±_k summed over k. Two compatibility items were added, `sum_card_markoffFundamentalPlus_eq` and `sum_card_markoffFundamentalMinus_eq`, with a use entry. Their Lean statements are in the suggested file.

### Suggested Lean file

13. The two new theorems state the sum identities above. Three docstrings now say:
    - the class-number bound needs the non-exceptional hypothesis (E553);
    - the source's character form fails at k = 2 (E555).

    No existing statement was false or vacuous. I checked each signature against its node, including:
    - the BijOn forms of Theorem 1.1;
    - the local-solubility iff;
    - the Hasse-failure families' hypotheses (ν mod 9 and the prime-factor classes);
    - Lemma 6.4's formula;
    - Proposition 16's parts (1), (2), (3) and (5);
    - the HasProd forms of the triple-product identities in the pi topology.

## Baseline

All 46 declarations exist under their names in the cited modules at Mathlib 082e2d3. Each provides what its citing nodes use, with the same or weaker hypotheses. Five `provides` texts were made exact:

- quadratic reciprocity for Jacobi symbols is stated for odd natural numbers;
- the Legendre form is a product identity for distinct odd primes;
- `HasFPowerSeriesAt.eq_formalMultilinearSeries` is one-variable;
- `hensels_lemma` also gives uniqueness in a ball;
- `Nat.eq_sq_add_sq_iff` is over ℕ.

`jacobiSym.at_neg_one` (line 313) and `jacobiSym.at_two` (line 323) were added. No citation was removed.

## Mistakes in the sources

- **E551** (Ghosh–Sarnak §2, p. 10: the orbit of (0, 1, 1) at k = 2 is called infinite). Confirmed: it is finite, with 16 points, and is all of V₂(ℤ).
- **E552** (Lemma 5.1, p. 16: sign slips in the second root and the product). Confirmed.
- **E554** (the illustration k = 3685 of Theorem 1.1 is exceptional). Confirmed and sharpened to h_M(3685) = 7.
- **E553** (consequence (c), p. 4). Confirmed and upgraded from gap to error, with the proof above.
- **E555** (added). (8.1), pp. 22–23, fails for d < 0 at a coordinate ±1; the counterexample is k = 2, x = (1, 1, 1). Nothing downstream is affected, since Proposition 8.1 argues through prime factors.

The inherited issues the nodes rely on were each read at their locators:

- PAPER-GHOSH-SARNAK-22/E2–E3: the lifts from (3, 0, 0) mod 9 and (1, 0, 0) mod 4 reach only k ≡ 9 (mod 27) and k ≡ 1 (mod 8).
- E7, E8 (ν = 11 is the smallest), E9, E10, E11.
- ClassicalArithmeticCompletion/E507 and E518.
- PAPER-GAMBURD-MAGEE-RONAN-19/E3: part (3) of Proposition 16 fails at (1, 3, 4) ∈ V₁₄.

None of E551–E555 duplicates an entry of the extraction's E1–E24.

## Closure, suppliers and tiers

- Every node's proof sketch follows from its prerequisites at target level. Prerequisite chains end in Mathlib, the first-pass CA.4 nodes, the two requested GeometryOfNumbersAndQuadraticArithmetic inputs, or the two recorded gaps.
- **GN.3/pell-automorph.** The node gives the infinite cyclic automorph group, as requested.
- **GN.4.** The GN package README (Layer 4, §4.3) uses the analytic triple product only as an unnamed intermediate of `jacobi_product_specialization`. The request to state it as a named target is precise and stands.
- **Tiers.** GN is tier 3 and CA tier 5. No prerequisite or request points to a higher tier or to a roadmap outside the order. AnalyticNumberTheory appears only in the gap texts, and ArithmeticStatistics, ArithmeticDynamics, ExponentialSums and QSeries only as consumers.
- **Cycles.** The new stage edges CA.4 → GN.3 and CA.4 → GN.4 create no cycle: neither GN stage reaches CA.4.
- **Promotion dry run.** The atlas build was run with the corrected packet added to the promoted blueprints. It assembles without error and adds the blueprint edge GN.4 → CA.4.

## Reader

I first confirmed that a renderer reproduces the committed reader's 43 node sections, and its requests, gaps, mistakes, frontier, structure and coverage blocks, byte for byte from the committed packet. All of these were then regenerated from the corrected packet. The mistakes section now prints each review verdict.

Three sentences of hand-written layer prose were adjusted:

- the class-number bound is false on 4 + w²;
- the obstruction is stated through prime factors, with E555;
- ArithmeticStatistics imports 𝒟 and 𝒟⁻ from here.

A script confirms that every packet text field appears in the reader.

## Questions for the orchestrator

1. **Planets.** Layer CA.4 will show twelve planets, six from the first pass and six here, until the packet's `restructure` proposal (sub-layers CA.4a–e) is applied.
2. **ArithmeticStatistics ST.0 and ST.3** (accepted) should be pointed at `CA.4/negative-pell-radicand-sets` (consumer retargets added). ST.0's truncation d ≤ X differs from Koymans–Pagano's d < X.
3. **QSeries QM.0** (needs_changes) should import `CA.4/jacobi-triple-product`, `jacobi-cube-identity` and `theta-product-specialisations`. Its finite and universal triple-product nodes give a purely formal alternative route that CA.4 cannot cite, since QSeries is outside the upstream order.
4. **E553 and E555** are new findings against the arXiv v3 text (Invent. Math. 229 was not obtained). E553 now says that a stated consequence of Ghosh–Sarnak's Theorem 1.1 is false. The maintainer may want it checked against the published version before the register reports it.
5. **CA.1.** Its part packet, accepted on 2026-10-14, is not yet in `data/blueprints`. The CA parts are promoted separately.
