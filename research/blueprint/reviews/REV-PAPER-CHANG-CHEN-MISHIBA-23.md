# REV-PAPER-CHANG-CHEN-MISHIBA-23 — review of the extraction of Chang–Chen–Mishiba, *On Thakur's basis conjecture for multiple zeta values in positive characteristic*

**Verdict: accept. Both routes accepted, no coverage gap, all three recorded mistakes confirmed, one finding added.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-7b31c4`, issue #1380 — 51 items (1 library, 3 planned, 47 missing), 2 routes, 3 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **11** (2023), [doi:10.1017/fmp.2023.26](https://doi.org/10.1017/fmp.2023.26), read in [arXiv:2205.09929v2](https://arxiv.org/abs/2205.09929v2) with its TeX source and in the open-access published version.

## Provenance

The recorded e-print hash matches byte for byte: `6336dfc5…0c52de` (a single gzipped `Basis_Submit_v2.tex`, 2086 lines). The extraction records **no** hash for the Cambridge PDF, which is the right call — Cambridge Core watermarks each download with the requesting IP and a timestamp, so no such hash is reproducible. I read the published text for the checks that needed it.

## 1. Numbering — the delicate part

The class hangs **every statement environment on the `equation` counter** (`\newtheorem{theorem}[equation]{Theorem}`, …) with `\numberwithin{equation}{subsection}`. So numbered displays consume numbers alongside statements, and a simulation must count `align` lines (minus `\notag`) as well as theorem environments. Doing that gives **43 numbered statements** and reproduces the extraction's numbers exactly — Theorem 1.2.4 (the main theorem, `T:Main Thm`) and Remark 1.2.5 among them.

My first pass mislabelled the appendix as a sixth section because I had not handled `\appendix`; with that fixed the appendix statements come out **A.1.1, A.1.2, A.2.3, A.3.1, A.3.2, A.3.7, A.3.8** — exactly the numbers the extraction's locators use. (Two reviews today have now turned on getting `\appendix` and comment-stripping right before trusting an inventory.)

**The extraction's dual numbering is real and correctly recorded.** The preprint numbers by subsection, the published version by section, and every locator gives both. I verified the correspondence in the published text for **Theorem 1.5**, **Remark 1.6**, **Proposition A.1**, **Theorem A.5** ("(Theorem 3.6(1))") and **Theorem A.7** ("(Theorem 3.6(2))"). Carrying both numbers is more than the job asks for and makes the file checkable against either version.

**Coverage is complete: all 43 numbered statements appear in an item locator.**

## 2. Statuses

The single `library` item cites `Polynomial`, `RatFunc`, `LaurentSeries` and `Polynomial.Monic`, all present in Mathlib at pinned `082e2d3`. The three `planned` items cite `FunctionFieldArithmetic:FA.0`, `DrinfeldModulesAndTModules:DM.0/DM.2/DM.6` and `PeriodsAndSpecialValues:PS.9`; those and the source route's `DM.8` **all exist** in `data/atlas.json`.

## 3. Routes

**`DrinfeldModulesAndTModulesPartII`** reproduces its parent's title verbatim and is a **joined** proposal: `PAPER-NGODAC-21` and `PAPER-IM-KIM-LE-ETAL-24` propose the same Part II with the same parent and title. The parent's DM.0–DM.8 run from additive polynomials and Drinfeld modules through t-modules, L-values and periods to algebraic independence, and stop short of multiple zeta values and Thakur's basis.

The **source route to `DM.8`** (periods, logarithms and algebraic independence) carries the two items the paper uses rather than proves — the ABP criterion and its period input. The split is drawn where the mathematics divides.

## 4. Mistakes in the paper — 3 confirmed, 1 added

All three recorded findings are confirmed verbatim, and each is settled by the paper against itself:

- **E1** — the display defines `S^{Li}_d(s) := 1/L_d^s` and, beside it, `S^{ζ}_d(s) := Σ_{a∈A_{+,d}} 1/a^{d}`. The second exponent must be `s`, or the symbol would not depend on its argument.
- **E2** — the coefficient `Δ^{[j]}_{s,n}` is defined "if `(q−1) | k` and `1 ≤ j < s+n`", but `k` is the function field `F_q(θ)`; the divisibility is on the summation index `j`, which is what makes Remark 2.3.4 come out right.
- **E3** — `dim_w Z_w ≤ d′_w` where every other statement writes `dim_k` (Conjecture 1.2.2, Corollary 1.2.7). The published text prints the same subscript.

**One finding added (E4).** The recorded findings are all of one class — a symbol that cannot mean what it says — so I ran the neighbouring mechanical class exhaustively: for each of the **89** `<word>~\ref{label}` citations in the source, compare the word with the environment carrying the label. **Two mismatches exist.**

- The one that **survives into the version of record** is now E4: the appendix proof says "It follows by **Theorem A.4**" of a statement printed "**Proposition A.4**" (preprint: `Theorem A.3.1` for `Proposition A.3.1`), while §1.3 cites the same statement correctly as a proposition.
- The other is **preprint-only**: §1.3 of arXiv v2 says "See Theorem~`\ref{P:product of sLbullet}`" for Proposition 2.3.5, and the published version reworded that sentence to "stated as **Proposition 2.7**". Since the version of record is correct, it is recorded here rather than as a finding.

The same audit found no duplicate labels and no undefined references.

## 5. What this extraction does well

Fifty-one items for a paper that spans classical multizeta conjectures, the characteristic-p analogues, t-motives and the ABP criterion, with the framework material routed to the parent roadmap and only the paper's own contribution kept in the Part II. Carrying **both** numbering schemes in every locator is the detail that makes the file usable: without it, half the locators would be unresolvable against whichever version a later reader has.

## Tools

A display-aware inventory simulator (shared `equation` counter, `align` line counting, `\appendix`), a word/environment reference audit, and a pure-Python PDF text extractor for the published text. Kept in the session scratchpad.
