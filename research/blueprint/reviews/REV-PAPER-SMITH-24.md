# Review: PAPER-SMITH-24 (Smith, Algebraic integers with conjugates in a prescribed distribution)

Job `REV-PAPER-SMITH-24` (issue #1082), by Claude Code, session `cc-d67081`, 23 September 2026.
**Verdict: accept.** All four routes are accepted. **No correction was needed** — no item, status,
route or locator changed.

## What was read

- **arXiv [2111.12660](https://arxiv.org/abs/2111.12660)v2** (16 March 2024, 47 pages), fetched into
  scratch. Its SHA-256 is `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9` — the
  hash the extraction records.
- §1 in full, Corollary 1.3, and the statements behind the proposed roadmap; plus a sweep of the
  paper's own numbering against the items.
- The extraction states that the published text (Ann. of Math. 200 (2024), no. 1) is paywalled and
  was not compared, and that v2 postdates the journal version's date; the locators are to v2.

## Items

- **Coverage is complete.** I extracted all **57** paper-internal numbered statements —
  Theorem/Lemma/Proposition/Corollary/Definition/Remark/Example/Notation — and compared them with the
  numbers the 56 items cite. **Every one is referenced.** That is the cleanest coverage among the
  extractions I have reviewed.
- **The headline arithmetic is right.** Theorem 1.1 is `λ_SSS < 1.89831`, and Corollary 1.3 reads
  `#A(F_q) ≥ (q + 2√q − 0.89831)^{dim A}` and `#A(F_q) ≤ (q − 2√q + 2.89831)^{dim A}`, which item 5
  reproduces exactly — with the two constants `1.89831 ∓ 1`, as the Weil-bound bookkeeping requires.
  The introduction's history (Schur's `e^{1/2} ≤ λ_SSS ≤ 2`, Siegel's 1.7336…, Smyth's 1.7719, the
  state of the art 1.793145) is recorded as printed.

## Statuses

- **Library (3 items).** `Polynomial.content`/`IsPrimitive`/`content_dvd_coeff`, Eisenstein's
  criterion, and Tonelli with monotone convergence — all resolve at the pinned commits, and all three
  are the right granularity for what the paper actually uses.
- **Planned (5 items).** Every cited layer plans its item: weak\* compactness of probability measures
  on a compact set at Tau Ceti's `OptimalTransport` layer 1 with `ArithmeticStatistics:ST.0`;
  resultants, minimal polynomials and conjugates at `ClassicalArithmeticCompletion:CA.3` with the Tau
  Ceti number-field and Galois-group roadmaps; Minkowski's convex-body and successive-minima theorems
  at `GeometryOfNumbersAndQuadraticArithmetic:GN.0`/`GN.1`; and the Weil bound at
  `WeightsInEtaleCohomology:R34.1`/`R34.2` with `DeligneWeightsAndPurity:DWP.1`.
- **Missing (48 items).** Routed exactly once.

## Routes

All four accepted. The new roadmap is the substance, and **I reproduced every negative search its
reason claims**, against the atlas at this commit:

| search | stages |
|---|---|
| `capacity`, `equilibrium measure`, `logarithmic potential`, `transfinite diameter` | **0** each |
| `trace problem`, `Smyth`, `totally positive algebraic integer` | **0** each |
| `potential theory` | **1** — the Tau Ceti PDE lane on maximum principles and harmonic functions |
| `Chebyshev` | 10 — Chebyshev's ψ and θ in `AnalyticNumberTheory:AN.2`, and the orthogonal-basis roadmap |

So nothing in the atlas owns weighted potential theory, capacities or the extremal polynomials of a
compact set, and the one "potential theory" hit is a different subject — a lane I happen to have
reviewed today in AUDIT-40, which confirms it is maximum principles and harmonic functions.

The rejection of a source route to `ClassicalArithmeticCompletion:CA.6` is right: CA.6 is "Special
algebraic numbers and Mahler measure" — house, Pisot and Salem classes — the neighbouring MSC family,
whereas the bulk of this paper is analysis. Routing the *classical statement* of the trace problem
and `λ_SSS` to CA.6 while the analysis becomes a new roadmap is exactly the "import it, don't define
it twice" discipline of Protocol 15.

## Mistakes in the paper (`sourceIssues`)

The extraction records **none**. I checked the headline statements of §1, the historical constants
and Corollary 1.3's arithmetic and found nothing to record. I did not read all 47 pages hunting for
mistakes, and record none — an empty `sourceIssues` is a claim about what the extraction found, not a
claim that the paper is error-free, and this review does not turn it into one.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SMITH-24.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 48 missing items, 48 routed, each exactly once.
- Every planned and route stage id resolves; the new roadmap's id is free and its area is a galaxy id.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
