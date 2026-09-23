# REV-PAPER-EISCHEN-HARRIS-LI-ETAL-20 — review of the extraction of Eischen–Harris–Li–Skinner, "p-adic L-functions for unitary groups"

Job: #1401. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json`,
by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. This is the largest findings
list this reviewer has handled — **160 recorded mistakes** — and the review's main work was to
test them against a text the extraction could not read.

## The published version is available after all

The source block states:

> The published article is CC-BY, but www.cambridge.org returned HTTP 404 or an HTML page
> instead of the PDF on 23 September 2026 … so the journal's text was not read and its 160-page
> pagination is not used. All locators are to v5.

It is retrievable. The landing page of `doi:10.1017/fmp.2020.4` carries a `citation_pdf_url`
meta tag with a **very long, unguessable path**, and that URL serves the PDF to a browser
user-agent with a Cambridge referer. I fetched it: **160 pages**, matching the journal's stated
pagination, **printed page = PDF page**. The retrieval recipe is now recorded in
`source.publishedVersion` so the next worker need not rediscover it.

The arXiv v5 hash the source block records was also re-fetched and **matches byte for byte**.

As with every Cambridge article this reviewer has handled, the published PDF's own hash is
**not reproducible** — two downloads gave `dbfb017c…254f` and `45f5c50c…e5f8`, differing only
in the per-page download stamp. A reproducible stamp-stripped text hash,
`b591d50a223ccd2e617f1ea3523d8d4bf89a48adce789d6dc599619162d4fe5b`, is recorded in its place.

## All 160 checked against the published text, with the basis stated per finding

| basis | count |
|---|---|
| located in the published article | **99** |
| not located mechanically; verdict rests on the extraction's reading of v5 | **60** |
| E160, a mixed bundle — see below | **1** |

The 60 are the findings whose `printed` field is a mathematical display that no text search
reproduces from either PDF. **Their verdicts say so plainly**, rather than implying a check I
did not make. As calibration I spot-checked six drawn from that group — E2, E11, E40, E88,
E120, E150 — by targeted search, and all six are present in the published text. That is
evidence about the group, and it is recorded as such and not as a per-entry confirmation.

## ⚠️ E160 is partly corrected in publication

This is why reading the published text mattered. E160 bundles about a dozen typographical slips
of arXiv v5, and **at least three of them are not mistakes in the published work**, Cambridge's
copyediting having fixed them:

| element | arXiv v5 | published |
|---|---|---|
| unbalanced parenthesis | `(upon restriction to U(V). Thus:` | `(upon restriction to U (V )). Thus:` |
| doubled word | `open neighborhood neighborhood U_v` | `open neighborhood U_v` |
| equation reference | `the isomorphisms 9` | does not occur |

Other elements of the same bundle **do** survive — "For all w ∈ Σ and" and "These sections,
denoted" are present in both versions.

Since the errata register records mistakes in **published** work, those three must be struck
from the entry, or the entry split. I recorded this in E160's verdict rather than editing the
entry, because re-partitioning a bundled finding is the extraction's call and not the
reviewer's.

## Items, statuses and routes

- **One library item**, and it is correct: `mathlib:AbstractMeasure` at
  `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40` is `def AbstractMeasure := C(X, R) →L[R] E`,
  which is what the item claims for p-adic measures on a compact, totally disconnected space.
- **417 planned items**, all naming atlas layers that exist.
- **40 missing items**, routed exactly once. No run-together numbering.
- **One route**, and accepted: a Part II of `AutomorphicLFunctionsAndLocalFactors`, titled
  "Automorphic L-functions and local factors, Part II: the doubling method for classical and
  unitary groups" — an **exact prefix extension**, with a free name, **co-proposed identically by
  PAPER-CAI-FRIEDBERG-KAPLAN-24**, so it is a merge.

### On the unusual shape of this extraction

417 of 458 items are `planned` rather than `missing`. That is worth checking rather than
flagging, and it checks out: `AutomorphicPadicLFunctions:L4` already names this paper, its Main
Theorem 9.2.2 and its three hypotheses, together with the PEL, compactification,
automorphic-bundle, Hida and measure layers it imports. What is genuinely unplanned is the
general doubling machinery, and that is exactly what the single route carries. I confirmed that
every planned item resolves to a real layer and that all 40 missing items are routed once, so
the distribution is a real feature of the atlas's coverage and not a mislabelling.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
