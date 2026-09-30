# REV-RT-PAPER-SMITH-24

**Complete: all seven findings confirmed.** Six of the fixes need correcting (given below). Two of the corrections turn proposed "missing" items into library items.

- **Job:** Refs #4051.
- **Verifier:** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence.** None of this is this session's work:
  - the extraction: `cc-7b31c4`, after a partial extraction by `codex-c83e7a` and `codex-a71f92` continued by `cc-fb70e5`;
  - its review: `cc-d67081`;
  - the errata record: `cc-fb70e5`, reviewed by `cc-442dc5`;
  - the red team: `cc-f805bf`.
- **Verdicts:** `research/blueprint/redteam/RT-PAPER-SMITH-24.review.json`. `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

**Source.** arXiv 2111.12660v2, with its LaTeX source. Its hash matches the record. The Annals text is not open access, and the extraction did not use it either.

**Division of the work.** Three verifiers worked in parallel:
- the paper's mistakes and the items (1, 6, 7);
- missing inputs and the route 1 brief (2, 5);
- library claims and route 4 (3, 4).

**Lead checks.**
- The Mathlib Nullstellensatz declarations behind the /2 correction.
- The Tau Ceti empirical measure behind the /3 correction.
- The capacities behind the /7 correction.

## Verdicts

**/1 (high): confirmed; fix corrected.**
- The errata record (E1–E7) was an ancestor of both the extraction commit and its review commit. Yet `sourceIssues` is `[]`, and the report says "No mistakes were found".
- The earlier partial extraction already had "greatest" for λ_SSS, and the rewrite undid it.
- I rederived E1–E7 from the TeX, and all hold.
- Items 1, 23 and 37 copy the uncorrected text. Item 37 is false for any mass M > 1: take µ = Mδ₀ with z in [ε², ε].
- **Corrections:**
  - E2's locator is the proof of Proposition 2.12, not 2.5. Fix it in the errata record as well.
  - Do not copy E1–E7's review objects into the extraction. A verdict counts only from a review of a job that wrote the file, so the copies would be listed as "awaiting review", as happens for PAPER-CIUBOTARU-HARRIS-26.

**/2 (high): confirmed; fix corrected.**
- Every input is actually invoked, and none has an item:
  - the Saff–Totik weighted theory behind Lemma 2.7, domination, Frostman, lower semicontinuity of energy and polar sets;
  - Erdélyi's Remez inequality (Lemma 2.8), BLPS flatness (Theorem 3.2) and the Gregory–Newton step.
- No atlas stage, promoted blueprint, accepted route or library at the pins plans them. GN.1 plans only Blichfeldt and Minkowski. The d26bcb34 checkpoint had these items, and the rewrite dropped them.
- **Corrections:**
  - The Gregory–Newton step of Lemma 2.10 is Mathlib's `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` (Combinatorics/Nullstellensatz.lean:67). With S_i = {0,…,2(n−deg G)−1} it gives exactly the lemma's bound. `combinatorial_nullstellensatz_exists_eval_nonzero` gives the proof's sum bound. So this is a library item, and Salzer need not be added.
  - Balayage is used only to see that ν_[a,b] has mass 1, which the proof obtains again by substituting u = 1/t. A note on item 36 is enough.
  - The Saff–Totik prerequisite mislabels domination: the paper's (I.1.4) is Frostman, and domination is Theorem II.3.2.

**/3 (medium): confirmed; fix corrected.**
- Item 48 is entirely in Mathlib: the Sylvester resultant, the root-product formula, and "zero iff not coprime", with `minpoly` and `IsIntegral`.
- Compactness of probability measures on a compact space, with a metrizable weak topology, is in Mathlib (Prokhorov.lean:175–183). ST.0 plans no topology on measures.
- Item 52 needs only Minkowski's second theorem.
- **Correction:** µ_P is `TauCeti.Probability.empiricalMeasureOfFintype` (Tau Ceti f790474, Probability/Process/EmpiricalMeasure.lean:54), applied to the roots with multiplicity.
  - Item 6 becomes library, and there is no new missing item.
  - Empty the planned lists of items 48 and 51; for 51, drop OptimalTransport layer 1 too.
  - Route 1's brief imports algebraic integers, minimal polynomials, resultants, Blichfeldt and Minkowski I from Mathlib.

**/4 (high): confirmed; fix corrected.**
- The Faltings blueprint finished on 24 September, and a source route never re-runs a finished job. Its packet has no "Honda" or "Smith". So items 5, 43 and 44 (Corollary 1.3) and item 53 are planned nowhere.
- Every R28.4 node is over a number field.
- Honda–Tate already has an owner: Lipnowski–Tsimerman's accepted route 10, whose design job `DESIGN-AbelianSchemesAndArithmeticModuliPartII` is pending.
- **Correction:** the proposed id "AbelianSchemesAndArithmeticModuliPartIIFiniteFields" does not exist, and a source route cannot reach a pending design. Instead:
  - replace route 4 by a `part-ii` route with parent AbelianSchemesAndArithmeticModuli, carrying item 53 over general F_q;
  - put items 5, 43 and 44 in exactly one place;
  - land the fix before the design job is claimed.
- The same defect appears in KISIN-MADAPUSIPERA-SHIN-22 route 6, which follows this route to R28.4.

**/5 (medium): confirmed; fix corrected.**
- Route 1's brief opens "on compact subsets of the real line", and the design job quotes it.
- The paper needs potentials at complex points: (5.9) and Proposition 5.15 integrate U^µ over complex roots.
- CDT-25's accepted route 2 imports complex capacity from this owner.
- **Correction:** item 8 already says Σ ⊂ ℂ. The change belongs in item 36 ("for all z ∈ ℂ") and in the brief.

**/6 (low): confirmed.**
- Item 32 drops the sign of Lemma 4.5's ratio, which Lemma 4.7 uses. That part is arguably medium, and it is a one-symbol change in the file /1's fix edits anyway.
- The only real Weil q-numbers are ±√q. The number with conjugates in [−2√q, 2√q] is π + q/π.

**/7 (low): confirmed; example corrected.**
- The four new slips are real, and none is among E1–E7:
  - Lemma 4.4's root claim;
  - Lemma 4.7's "[0, D−1)";
  - Proposition 3.6's "k ≤ n";
  - the k = 0 pigeonhole step.
- **Corrections:**
  - The proposed example [−2,−1] ∪ [1,2] has capacity √3/2 < 1, so it breaks §4's standing assumption. Use [−3,−1] ∪ [1,3], of capacity √2.
  - In the Lemma 4.7 fix, the intervals have "length at most a".

## For the maintainer

- **Duplicate mistake numbers.** Mistake numbers recur between extractions and errata records: 676 duplicates in `data/source-issues.json`. This needs one policy.
- **Source routes into finished blueprints.** Routes into R28.4 (this paper and KISIN-MADAPUSIPERA-SHIN-22) and into other finished blueprints never take effect.
