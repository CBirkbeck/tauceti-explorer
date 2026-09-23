# Review: PAPER-CESNAVICIUS-SCHOLZE-24 (Česnavičius–Scholze, Purity for flat cohomology)

Job `REV-PAPER-CESNAVICIUS-SCHOLZE-24` (issue #1072), by Claude Code, session `cc-d67081`,
23 September 2026. **Verdict: accept.** All seven routes are accepted. All fourteen recorded mistakes
are confirmed. Two corrections were made in place.

## What was read

- **arXiv [1912.10932](https://arxiv.org/abs/1912.10932)v3** (26 April 2023, "final version, to appear
  in Annals of Mathematics"), 97 pages, fetched into scratch. Its SHA-256 is
  `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` — exactly the hash the report
  records.
- All fourteen recorded mistakes at their locators.
- **Erratum check:** arXiv stops at v3, itself the final version; Crossref's record of
  `10.4007/annals.2024.199.1.2` has no `update-to`, `updated-by` or relation. The published text
  (Ann. of Math. 199 (2024), no. 1, 51–180) is paywalled and was not compared, as the extraction says.

## Mistakes in the paper (`sourceIssues` E1–E14)

**All fourteen confirmed.**

- **E1 (error, affects a stated result) — settled with a counterexample.** Theorem 7.1.2 (p. 87)
  assumes each `O_{X,z}` with `z ∈ Z` is "either a complete intersection of dimension ≥ d or **regular
  of dimension ≥ d − 1**", and concludes that `H^i(X,G) → H^i(X∖Z,G)` is injective for `i < d`. At
  `d = 1` the second clause permits **dimension 0**, i.e. a field. Take `X = Spec k ⊔ Spec k`, `Z` one
  of the two points and `G` any nontrivial finite locally free group: `O_{X,z} = k` is regular of
  dimension `0 ≥ d − 1`, the immersion `X∖Z ↪ X` is quasi-compact, and
  `H^0(X,G) = G(k) × G(k) → H^0(X∖Z,G) = G(k)` is not injective. So the theorem as stated fails for
  `d = 1`, and the extraction's repair — dimension `≥ max(d−1, 1)`, i.e. not a field, or `d ≥ 2` — is
  the right one. Every application in the paper has `d ≥ 2`.
- **Three misprints the paper itself contradicts.** Page 79 writes "the analogues of (5.7.2.1),
  (5.7.2.2), and **(5.7.2.2)**" where page 80, concluding the same argument, writes "(5.7.2.1),
  (5.7.2.2), and **(5.7.2.3)**" (E8). Page 85 writes the Cohen-structure ideal as
  `(p, x_1, …, x_n)²` where page 29 states the same consequence correctly with `x_d` (E11). And
  page 75 thanks "Akhil **Matthew**" where the acknowledgements (p. 9), the text (p. 20,
  "Bhatt–Mathew") and two bibliography entries all spell it **Mathew** (E14) — plausibly by
  attraction to Matthew Morrow, who is in the same bibliography.
- **The remaining nine** are index and range slips, each visible in its own sentence: `π_*(M′ ⊗^L_A M)
  ≅ π_i(M′) ⊗ π_0(M)` (E5); `τ_{≤n} ⊗^L_A A^•` with the second `τ_{≤n}` missing its argument (E9);
  `n ≥ 0` where `µ_n` needs `n ≥ 1` (E12, E13); `vdim(R_d)` for `vdim(R)`, which occurs exactly once
  in the paper against one correct `vdim(R)` (E4); `π_0(A)` in a passage about `A′`, whose own second
  half writes `π_0(A′)` (E6); `A_2 ⊂ A` for `A_2 ⊂ Ã` (E2); "p-this integral closure" for "this
  p-integral closure" (E3); a redundant leading range in "for i ≥ 2 the map … surjective for i ≥ 1,
  bijective for i ≥ 2" (E7); and `(a_1, …, a_n)` for the `r`-element sequence (E10).

## Corrections made to the extraction

1. **The source hash.** The report records the PDF's SHA-256 (and the TeX source's), but the
   machine-readable `source` block carried none, so a checker reading the JSON alone could not tie
   the locators to a fixed file. I re-fetched the PDF, confirmed the hash is the report's, and copied
   it in with a note saying the review did so.
2. **An exclusion claim that the atlas does not support.** Route 1's reason said "EDC.2 excludes
   absolute purity". EDC.2's description does not mention absolute purity — and neither does any
   other stage: a search of `data/atlas.json` returns **zero** stages mentioning it. That is the
   stronger and accurate justification for a new roadmap, and the reason now says it. I also recorded
   where the atlas's existing Brauer material actually lives, since the route's "no Brauer groups of
   schemes" invites the question: Tau Ceti's `ClassFieldTheory` layers 5, 6 and 10 own the Brauer
   group of a *field* and the local invariants, and `HeightsRationalPointsAndObstructions:RP.2` is
   the Brauer–Manin pairing, which consumes `Br(X)` rather than constructing it — so placing the
   Brauer group of a scheme in route 2 is right.

Nothing else changed: no item, status, route target or locator.

## Items, statuses and routes

- **Library (3 items).** All declarations resolve at the pinned commits.
- **Planned (16 items).** Every cited stage id resolves.
- **Missing (124 items).** Routed exactly once across the seven routes.
- **Routes.** Two new roadmaps and four Part IIs, and the division between them is the point of the
  routing: the *purity* line — virtual dimension, the key formula, perfectoid purity, complete
  intersections, Gabber's conjectures, Brauer purity — becomes `PurityForFlatCohomology`, while the
  general tools go back to their owners (fppf cohomology's general properties to
  `SchemeAndStackFoundations`, integral perfectoid material to `PerfectoidQuotients`, absolute purity
  to `EtaleDualityAndPerverseSheaves`, prismatic Dieudonné theory to `PrismaticCohomology`), and the
  arc topology becomes its own small roadmap so that two consumers can import it instead of each
  restating it. Every Part II parent exists, every id is free, and every area is a galaxy id.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-SCHOLZE-24.result.json`
  ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 124 missing items, 124 routed, each exactly once.
- Every planned and route stage id resolves; every Part II parent exists and every new id is free.
- The source PDF's SHA-256 matches the hash the report records.
- Lean: none.
