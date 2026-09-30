# Red team: PAPER-BROWNING-LEBOUDEC-SAWIN-23 (Browning–Le Boudec–Sawin, *The Hasse principle for random Fano hypersurfaces*)

Job `RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23` (issue #4067), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23.result.json`, in the format of PROTOCOL section 17.

**Result:** 6 findings: 3 medium and 3 low. None is high.

- **The extraction.** It is careful and faithful to arXiv v1.
  - It has 129 items (5 library, 4 planned, 120 missing), 8 routes and 19 source issues.
  - I re-read the whole paper and recomputed the main estimates. No item misstates its source.
  - All nineteen source issues are right, and the six library citations hold at the pin.
- **What breaks.**
  - The file does not say which text was read (no `sourceVersions`). Because of how its notes are worded, the collation tooling counts it as read from the published version.
  - Three Part II items are now planned in ArithmeticStatistics ST.5.
  - The Euclidean local-density statement on which Theorems 1.1 and 2.2 rest after E19 has no proof route, and its route never reached ST.2.
  - Three smaller points: the W-bound needs only Chebyshev, not the prime number theorem; the review's reasons for routes 4 and 5 misdescribe them; and Bhargava's input is stated too narrowly.

## Independence

- **Who did the work.**
  - The extraction was begun by Codex `codex-a71f92` (checkpoint PR #1920, 22 September) and completed by Claude Code `cc-442dc5` (PR #2086, issue #1095, 23 September).
  - The review, REV-PAPER-BROWNING-LEBOUDEC-SAWIN-23, is by Claude Code `cc-7b31c4` (issue #1096, PRs #2396 and #2399, 23 September).
  - There is no errata file for this paper.
  - `cc-f805bf` appears in none of these files or commits.
- **Disclosure.**
  - This session red-teamed Browning–Sawin 20 (PR #4792). It wrote FIX-RT-AREA-finitefields and FIX-RT-AUDIT-07 (the exponential-sum and sieve audit), and it wrote PAPER-DELIGNE-74/80.
  - Finding 3 cites FF.2's Lang–Weil nodes (FiniteFieldsAndCharacterSums blueprint, PR #2910) and ST.2's geometric-sieve nodes (BP-ArithmeticStatistics, PR #2864). Neither is my work.
  - No finding relies on those earlier jobs.

## What was read

- **The paper.** arXiv 2006.02356v1, downloaded 30 September.
  - Its SHA-256 `210c746b…1efb` reproduces the recorded hash.
  - arXiv lists only v1. Crossref records no update or relation.
  - The Annals page gives Received 5 June 2020 and Revised 22 July 2022, and it links no correction.
  - The published text was not obtained. Like the extraction, this red team is scoped to v1.
- **External inputs.**
  - Poonen–Voloch: §2 and Theorem 3.6 with its proof (hash `e4ec66ff…` reproduced).
  - Le Boudec, arXiv 2006.02288v1: Theorems 1 and 3, Lemma 3 (hash `cb782025…` reproduced).
  - Bhargava, arXiv 1402.1131v1: §1.1 and Theorems 1, 2 and 4.
- **The repository.**
  - The extraction, its report and handoff, the review JSON and report, the register entries and `data/source-issues.json`.
  - Atlas stage texts: GN.0–GN.6, ST.0–ST.5, RP.0–RP.6.
  - The GN, ST and RP packets, and the FF.2 Lang–Weil nodes.
  - `queue.json`, `make_queue.py` and `collation.py`.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`, searched in `declarations.tsv` for:
  - successive minima, Minkowski's second theorem and transference;
  - Hasse–Minkowski;
  - the prime number theorem and primorial bounds.

## What holds up

- **Statements.** Every item was checked at its locator, with its hypothesis ranges:
  - n ≥ d, not n ≥ d + 1;
  - the exclusions (2,2), (3,3) and (4,4);
  - the ranges of A against B, and the bounds on φ.
- **Re-derived.**
  - Lemma 3.9, from the Smith form.
  - Lemma 3.16's Gram identity: det = 2δ³, checked at x = e₀, y = e₁.
  - The d = 2 case of Lemma 3.15.
  - Lemmas 3.18–3.24: the dyadic bookkeeping and the log powers.
  - Lemmas 4.2–4.11:
    - the volume constants;
    - the partial-summation constants (N−1)/(N−2) and N/(N−2);
    - the ι normalisation;
    - the diagonal and antidiagonal pairs in Δ^mix and Δ^loc;
    - Lemma 4.9's sums with δ = 1/20.
  - §5 in full, including κ = 1/(4n) and κ = 1/n.
- **Source issues.** E1–E19 are right.
  - E16's certificate recomputes as 30/173.
  - E13's local factor recomputes as p^{r−⌈r/d⌉}(1−p^{−n}).
  - The one further slip I found, the missing '#' in Lemma 5.6, is already recorded as ArithmeticStatistics/E641.
  - The register holds no duplicate.
- **Library and planned statuses.**
  - The six Mathlib declarations are as cited.
  - Successive minima, Minkowski's second theorem and transference are absent from the libraries, so GN.1 and GN.4 are right.
  - Tau Ceti has only local predicates for quadratic forms, so Hasse–Minkowski is correctly "planned".
- **Routes.**
  - There is no cycle.
  - The GN, ST and RP packets all began after the routes were accepted, and all are partial.
  - GN's later nodes plan covolumes, duals and minima in exactly the stages routes 1 and 2 name.
- **Methods.** The paper uses no circle method, no Deligne or Katz bounds, no Kloosterman refinement, no exponential sums, no Betti bounds and no sieve. Lang–Weil and the Ekedahl sieve enter only through Poonen–Voloch's Theorem 3.6 (finding 3). There is no overlap with Browning–Sawin 20.

## Findings

### Medium

1. **No `sourceVersions`, and collation misreads the file.**
   - E3 quotes a stated result, so PROTOCOL §18 requires the field. `check_errata.versions_checked` reports it missing.
   - `collation.py` falls back to the free-text notes. Those contain "annals.math" and "The published text … is subscription-only", which match its PUBLISHER and READ_IT patterns.
   - So `provenance()` returns "published", and the paper is left off the collation worklist, although nothing was compared with the Annals text.
   - **Fix:** add a preprint `sourceVersions` entry (arXiv v1, read 2026-09-22, the recorded SHA-256). A maintainer note suggests tightening READ_IT.
2. **Duplicate with ST.5.**
   - The ArithmeticStatistics blueprint (24 September) took §5 through route 5 and planned three carriers that route 7 still sends to the pending Part II design:
     - σ(a;Q) with its multiplicativity (`/sigma`);
     - f_a with the unweighted Veronese vector (`/veronese`);
     - Lemma 3.11 (`/veronese-gcd`).
   - **Fix:** mark the three items planned at the named ST.5 nodes and remove them from route 7. Tell DESIGN-HeightsRationalPointsAndObstructionsPartII to import them. Plan the minor gcd G once, in GN.0.
3. **`/pv-density-ball` has no proof route and no landing.**
   - After E19, the Euclidean-ball local density is what makes ρ^loc exist for the paper's ordering, and so what Theorems 1.1 and 2.2 assert.
   - The extraction formulated this statement itself, but names none of its inputs. Poonen–Voloch's proof needs:
     - Hensel's lemma;
     - Lang–Weil, uniformly in the form;
     - the Poonen–Stoll (Ekedahl) density lemmas;
     - the codimension-≥ 2 inequality for reducible forms, which is where (2,2) is excluded.
   - ST.2's blueprint has no node for route 4's items, and its coverage does not mention route 4.
   - **Fix:** write the proof route using FF.2/uniform-lang-weil-estimate and ST.2/quantitative-ekedahl-geometric-sieve on the Euclidean ball, and add a ST.2 node or coverage entry.

### Low

4. **`/W-bound` does not need the prime number theorem.**
   - Every use of (2.12) needs only W = B^{O(1/log log B)}.
   - Mathlib's `primorial_le_four_pow` (Primorial.lean:141) gives log W ≤ √w log w + 4 log 4·w.
   - **Fix:** split the item, so that the Part II does not import the prime number theorem.
5. **The review's reasons for routes 4 and 5 misattribute items.**
   - Route 4's reason cites "Lemmas 5.1–5.4" and "sigma(a;W) and its convergence". Those items belong to routes 5 and 7, and the paper says the convergence is not used.
   - Route 5's reason omits Lemma 5.4 and the Hensel input.
   - **Fix:** correct both reasons.
6. **`/bhargava-plane-cubics` is stated for boxes only, and its inputs are not recorded.**
   - Bhargava's Theorem 2 holds for every compact region that is the closure of an open set containing 0, so the ball needs no inscribed box.
   - It rests on Bhargava–Skinner's positive proportion of rank-one curves and the 3-Selmer parametrisation. ST.4 lists the item as "source not yet acquired".
   - **Fix:** restate the item for all regions and record these inputs.
