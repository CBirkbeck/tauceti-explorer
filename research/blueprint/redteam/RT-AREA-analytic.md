# RT-AREA-analytic — red team of the Analytic number theory area

**Result: three findings, two medium and one low. All three are omissions the atlas's own records already half-document — one route is literally unaccepted because of the first. Four other heads came back clean, and this is the best-built area I have red-teamed.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: the area *Analytic number theory* — **7 roadmaps, 51 stages, 69 accepted paper routes from 33 papers**, the richest area I have taken.

| roadmap | origin | stages | routes | prereq | consumers | audit verdicts |
|---|---|---|---|---|---|---|
| `AnalyticNumberTheory` | campaign | 10 | 19 | 7 | 6 | 2 built, 3 partly, 4 not, 1 process |
| `ArithmeticStatistics` | campaign | 6 | **30** | 5 | 0 | 2 partly, 4 not |
| `SieveMethodsAndPrimePatterns` | campaign | 6 | 9 | 1 | 3 | 3 partly, 3 not |
| `ExponentialSumsAndCircleMethod` | campaign | 6 | 7 | 3 | 2 | 1 partly, 5 not |
| `DiophantineApproximationAndTranscendence` | campaign | 6 | 2 | 1 | 4 | 2 partly, 4 not |
| `ProbabilisticAndMetricNumberTheory` | campaign | 6 | 2 | 3 | 0 | 2 partly, 4 not |
| `tauceti:…/ArithmeticDirichletSeries` | tauceti | 11 | 0 | 0 | 1 | **5 built, 6 partly, 0 not** |

**Eligibility measured:** none of the papers this session has reviewed routes into this area, checked at route granularity across all 207 paper result files.

## Attack 1 — omissions against the 33 routed papers. **Findings 1–3.**

### Finding 1, medium — arithmetic-scheme Chebotarev density has no owner

Two accepted extractions need Serre's density theorem for **normal integral rings of finite type over ℤ** (*Lectures on N_X(p)*, §9) and route it to `AN.4`. **One of those routes is recorded as UNACCEPTED for exactly this reason**, and says what is needed:

> "UNACCEPTED candidate: the arithmetic-scheme Chebotarev input **is not supplied** by AN.4's number-field analytic comparison/prime-ideal interfaces. RS-07 narrows AN.4 and **does not assign** general finite-type arithmetic-scheme Frobenius density to it. **A separate source-qualified supplier/extension**…" — `PAPER-SCHMIDT-STIX-16`

> "The density theorem for normal integral rings of finite type over ℤ (Serre, *Lectures on N_X(p)*, §9), used throughout §2 and in §2.14, is its arithmetic-scheme form; **PAPER-SCHMIDT-STIX-16 sends the same statement there.**" — `PAPER-ABDURRAHMAN-VENKATESH-25`

The scope claim checks out against the accepted restructuring record. `RS-07.result.json` gives AN.4 `{"action": "narrow", "keeps": "Arithmetic-to-analytic comparison maps for Dedekind/Hecke functions, boundary nonvanishing and prime-ideal applications, plus the Artin Euler-factor/induction int[erfaces]"}` — a number-field scope that does not reach schemes over ℤ.

**And nothing else owns it.** I searched under several descriptions before concluding absence, because a density theorem can be named many ways:

| search | result |
|---|---|
| `Frobenius density` | 2 files — both the *number-field* tool for Galois determinants and representations ("Prove uniqueness from Frobenius density using Chebotarev and continuity") |
| `N_X` | 1 file — the Maslov index `n_x(D)` in `HeegaardFloer` |
| `finite type over` | 8 files — every one over a **field, DVR or other base**, in adic, moduli and ring-stack roadmaps |
| the 14-stage `Chebotarev` roadmap | contains none of "finite type over", "arithmetic scheme", `N_X(p)` |

So a documented need sits between two roadmaps with no owner, and one route cannot be accepted until it has one. The natural home is the `Chebotarev` roadmap, as the scheme-theoretic form with the number-field case recovered as the relative-dimension-zero instance.

### Finding 2, medium — Heath-Brown's large sieve for quadratic characters is named by nothing

Two extractions route it to `SV.2`, and one says the gap outright:

> "…comes from Heath-Brown's large sieve for quadratic characters, a sharper member of that family that **SV.2 does not yet name**." — `PAPER-KOYMANS-PAGANO`

> "The prime-denominator 2 error and exact norms must be retained; **a generic DFT or character-orthogonality theorem does not establish this bound**." — `PAPER-SKOROBOGATOV-SOFOS-23`

That second sentence is why this is medium rather than a naming nicety: SV.2 owns large sieves *generically* — "additive and multiplicative large-sieve inequalities, duality, primitive-character reduction, and bilinear decompositions such as Vaughan identities", sourced to "KED-ANT Chapters 15-16 and Chapter 18" — and **the target as written does not imply the theorem the sources need**. RS-07 confirms SV.2 is the right home, stating that "large-sieve/bilinear inequalities belong to SV.2".

**A name collision that would have misled me in either direction.** Searching the roadmaps for Heath-Brown returns exactly one file, `ExponentialSumsAndCircleMethod` — but that is the Heath-Brown **identity**, a von Mangoldt decomposition ("construct a separate prime-weighted branch using Vaughan or Heath-Brown identities"). A different theorem. Matching on the name alone would have made me either dismiss a real gap or file a duplicate. This is the **third** time this session two theorems sharing a name had to be separated, after Smyth's Mahler bound versus the trace problem, and Salem numbers versus Salem–Spencer sets.

### Finding 3, low — Stevenhagen's conjecture

`PAPER-KOYMANS-PAGANO` mentions it **25 times** (27 across the area with `KOYMANS-MILOVIC-21`) and its route says "the prior bounds towards Stevenhagen's conjecture (Fouvry–Klüners, CKMP, the authors' KP3) and the sets D_{2,n} belong there [ST.3]". **No roadmap in either directory names Stevenhagen.**

Low, not medium: ST.3's target is "selected counting and class-group moment/distribution theorems by discriminant and signature", and a density theorem for negative-Pell solvability is one of those — so the defect is the unnamed governing conjecture, not unplanned material. What keeps it a finding is the area's **own practice**: Cohen–Lenstra is a declared source of both ST.3 and ST.5, and Malle appears in 23 roadmap files, so this area does name its governing conjectures.

## Attack 2 — two absences I deliberately did not file

**Davenport–Heilbronn** and **Katz–Sarnak** appear in **no roadmap** in either directory. They are the archetypal results for a stage called "Fields and class groups", so they are tempting. But **neither is mentioned by a single one of the 33 routed papers**. Filing them would be second-guessing the roadmap's scope rather than reporting a need its own sources demonstrate, which is not what §17 asks for. Not findings — recorded so a verifier can see the line I drew and why.

## Attack 3 — dependency bookkeeping. Clean, and more strictly than in the Elementary area.

For **every** campaign roadmap here, `prerequisites` equals its set of cross-roadmap stage-edge heads **exactly** — no extras, no omissions: AnalyticNumberTheory 7/7, ArithmeticStatistics 5/5, ExponentialSums 3/3, ProbabilisticAndMetric 3/3, Sieve 1/1, DT 1/1.

`ArithmeticStatistics.consumers = []` looked like part 1's finding, since it is the most heavily routed roadmap in the area. It is correct: the **only five** roadmaps in either directory that cite `ArithmeticStatistics` are precisely its own five prerequisites, citing it as *their* consumer. It is a sink, as `HigherLocalFields` was in part 1. Same for `ProbabilisticAndMetricNumberTheory`.

## Attack 4 — duplication, and the conjecture registers. Clean.

The sharpest duplication candidate was a near-collision of names: `PM.3` "**Metric** Diophantine approximation" against the whole `DiophantineApproximationAndTranscendence` roadmap. The division is deliberate and stated in PM's own summary:

> "**Almost-everywhere assertions, averages over integers, and statements about every real number remain distinct.** Specify the probability space and measure before every distribution theorem."

PM.3 owns the measure-theoretic side — limsup sets, Borel–Cantelli, Khintchine and Duffin–Schaeffer, Lebesgue and Hausdorff measures, convergence and divergence halves separated. DT owns the individual algebraic side — heights and irrationality exponents, Liouville and Roth, the subspace theorem, transcendence. Continued fractions appear in both for different purposes (PM.4's Gauss map and ergodic statistics; DT.0's link to Dirichlet approximation). Nothing is planned twice.

**No stage plans to prove a conjecture**, and the guards are explicit: AN.6 maintains "a statement register for RH, GRH, prime tuples"; AN.9 says "a partition-function identity with zeta is not a proof of a zero-location conjecture"; PM.5 keeps "Chowla/Sarnak-type general statements in the conjecture register" and forbids a heuristic model standing as "a proven joint distribution"; AN.8 restricts itself to "exact proved cases".

## Attack 5 — the library boundary. Clean.

All 51 stages are already audited, so as in the Elementary area the audit carries the library mapping and a red team's job is to break it where it is wrong, not repeat it. **`ArithmeticDirichletSeries` is exemplary**: 11 layers, **5 built and 6 partly built with none "not built"**, a monotone progression (layers 0–4 built, 5–10 partly) matching its `active` lifecycle, and a summary that names the APIs it consumes — it "regroups them by norm into **Mathlib's `ArithmeticFunction` and `LSeries` APIs**", with Layer 1 titled "norm fibres and Mathlib LSeries". No stage in the area instructs construction of something an audit records as built.

## What this red team did not do

I did not re-derive the mathematics of any stage, and I did not re-audit the libraries stage by stage — AUDIT coverage is accepted for all 51 and I probed only where a roadmap's verbs or a routed paper gave a reason to. **"Targets out of date with the literature" is the §17 head I ran least well**: for an analytic area that would mean checking whether stated exponents, zero-density ranges and sieve bounds have been superseded, which needs the current literature on each and is beyond what I could verify at source here; I checked only that no stage claims a conjecture as provable. Omissions were tested against the 33 routed papers and the roadmaps' own targets, so an omission no routed paper happens to need would not have surfaced — that is exactly the line I drew for Davenport–Heilbronn. The 22 unrouted stages were read for scope but their sources were not verified. Every library number here comes from a full Mathlib checkout of 8556 `.lean` files and the Tau Ceti tree of 5268, with the file count printed beside each result, a precaution taken after two wrong tree paths returned false cleans earlier in this session.
