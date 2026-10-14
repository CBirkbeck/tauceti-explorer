# BP-AnalyticNumberTheory — handoff

Claude (session `claude-PVmOyA`), 14 October 2026. Refs #9433. The bot confirmed the claim at 07:39 UTC. This is a
completed target-level pass, ready for its independent review. No implementation is claimed; every node keeps
`implementationStatus: unchecked`.

## Deliverables

- [Packet](../packets/AnalyticNumberTheory.json): `part: null`, `status: complete`, scope AN.0–AN.9. It has **236
  targets**: 146 theorems, 42 definitions, 33 constructions and 15 comparisons. It also has **307 API items, 255 unit
  tests, 41 planets, 228 baseline declarations, 58 gaps, 55 requests, 48 source issues (numbered up to E49) and 66 sources**.
- [Reader](../readmes/AnalyticNumberTheory.md), 7,409 lines. It has:
  - the introduction, scope and boundaries, conventions, layer index and the dropped layers;
  - for each of the seven active layers, an overview and every target in dependency order, each with its statement,
    hypotheses, proof sketch, API, unit tests, uses, checks, prerequisites, proof ingredients and source;
  - the requests, open proof boundaries and layer acceptance for each layer;
  - the red-team handling, the restructuring proposals, the Tau Ceti interfaces, the paper coverage of all 91 routed
    items, the source issues, the proof-ingredient index and the bibliography.
- [Suggested Lean](../suggested/AnalyticNumberTheory.lean), 425 lines in the 2026-10-12 shape: light definitions with
  real bodies over carriers at the pins, layer milestones by `sorry`, and unit tests as `example`s.
  - Definitions: progression Chebyshev sums, the exceptional-zero predicate, Riemann ξ through
    `completedRiemannZeta₀`, finite order, `DirichletGRH`/`GRH`, partial ideal zeta, pretentious distance, Ψ(x,y),
    Beurling systems, Barnes G, the Lerch and complex Hurwitz series, and the spectral zeta series.
  - Milestones include the zero-free region, the effective PNT error, Siegel–Walfisz, Rosser–Schoenfeld, conditional
    RH/GRH error terms, uniform Stirling, Montgomery–Vaughan, bounded-degree Brauer–Siegel, and Gauss's sign as
    `rootNumber χ = 1` for every primitive quadratic χ.
  - No data definition has a `sorry` body. Hecke, Artin and Tate-continued L-functions, the Shintani series, Selberg
    zeta and the Bost–Connes system have no carrier at the pins, so they are README targets only.

## How the plan was built

The two part packets were both accepted: `AnalyticNumberTheory--AN.0.json` (AN.0–AN.7, 254 nodes,
REV-AnalyticNumberTheory--AN.0~2) and `AnalyticNumberTheory--AN.8.json` (AN.8–AN.9, 240 nodes,
REV-AnalyticNumberTheory--AN.8~2). This job continues them into one self-contained target-level plan, as the
PadicHodgeTheory main packet did. Their files are unchanged, and `imports` records their hashes.

- **Targets.** Every non-lemma predecessor node is a target under `AnalyticNumberTheory:AN.k/plan/<slug>`, because the
  checker refuses a node id repeated across packets of one roadmap. `predecessorTargets` maps all 221 continued ids.
- **Proof ingredients.** The 273 predecessor lemma nodes were sorted by hand:
  - 8 are stage results and became theorem targets: Yun–Zhang's derivative positivity, the trivial zeros of ζ_K,
    imprimitive Hecke factors, the Lerch PDE, Lerch solvable-cover descent, Lerch z = 1 degeneration, an explicit prime
    interval bound, and Σ_{p|N} log p/p ≤ log log N + C.
  - 2 served only superseded targets.
  - The other 263 are `proofDependencies`, each with its statement, hypotheses, proof sketch, locators and the targets
    that use it. 17 of them had no consumer and are attached by hand to the target they serve.
  - The prerequisites a lemma cited are lifted to the targets that use it.
- **Superseded by Tau Ceti.** Current Tau Ceti (a91d3aa; TauCetiRoadmap 0d144d0) proves:
  - the prime ideal theorem unconditionally (ArithmeticDirichletSeries 10.4, `TauCeti.primeIdealTheorem`);
  - Chebotarev in prime-counting form, with the arithmetic-progression specialization (Chebotarev Layers 11–14).
  The rational PNT, the fixed-progression PNT, the ψ→θ→π transfer and their two boundary lemmas are therefore
  `supersededTargets`. One theorem, `AN.2/plan/qualitative-prime-number-theorems`, imports them in Mathlib vocabulary.
- **Source issues.** The AN.8 part reused E18–E24, which collide with the AN.0 part's numbers. They are now E42–E48;
  `sourceIssueRenumbering` maps them, and every text reference was rewritten.

## Added and corrected in this pass

**New targets (10).**

| Layer | Target | Kind |
| --- | --- | --- |
| AN.2 | Qualitative PNT, and PNT in fixed progressions, imported from Tau Ceti | theorem, planet |
| AN.3 | RH/GRH statement register (`DirichletGRH`, `GRH`, Mathlib `RiemannHypothesis`) | definition, planet |
| AN.3 | Prime error terms under RH and under GRH, with the hypotheses explicit | theorem |
| AN.3 | Uniform Stirling bounds on vertical strips (DLMF 5.11.9) | theorem |
| AN.4 | Artin holomorphy as a hypothesis | definition |
| AN.4 | Extended Riemann hypothesis for Dedekind and Hecke L-functions | definition |
| AN.4 | Zero-free region for Dedekind zeta and Hecke L-functions (Zaman Thm 1.3.5, Cor 1.3.6) | theorem, planet |
| AN.4 | Effective Chebotarev (Lagarias–Odlyzko, its ERH form, Lagarias–Montgomery–Odlyzko), stated on Tau Ceti's `frobeniusPrimeCount` | theorem, planet |
| AN.4 | Sign of the quadratic Gauss sum (root number 1) from the Dedekind functional equation | theorem |
| AN.7 | Barnes G-function (DLMF §5.17) | definition |

Why these were added:

- RS-07 assigns the RH/GRH register of the dropped AN.6 to AN.3, and the conditional general-continuation statements
  to AN.4; the predecessors had no node for either.
- Effective Chebotarev had no owner. Tau Ceti Chebotarev defers it to a “Zeros of L-functions” roadmap that does not
  exist anywhere, and Koymans–Pagano item 249 needs it.
- The Gauss sign was a request to FiniteFieldsAndCharacterSums FF.1 with no consumer. Gross–Zagier items 196–197 need
  it, and REV-PAPER-GROSS-ZAGIER-86 names this analytic route.
- Stirling and Barnes G were internal requests of the AN.8 part to this roadmap's own AN.5 and AN.7. Single ownership
  now plans them here, and their consumers point at them.

**Other corrections.**

- Prerequisites added to 29 targets that had none, each taken from its own proof sketch. Examples: Brauer–Siegel now
  rests on the Dedekind continuation, Louboutin's residue bound, Brauer meromorphy and Mathlib's residue, class number
  and regulator; Selberg zero density on the Montgomery–Vaughan mean value; the zeta moments on Montgomery–Vaughan.
  Only the two elementary affine maps of AN.8 remain without prerequisites.
- 14 prerequisites that named this roadmap's own stages (inherited from the AN.8 part) now name the exact target:
  PNT, Stirling, Barnes G, Dedekind continuation, finite order, or Mathlib Γ.
- Two orphan requests are recorded as resolved in `resolvedRequests`: the AN.0 part's request to AN.8, and the FF.1
  Gauss-sign request.
- One API item was added (`pretentious_distance.triangle`). The test kind `example` became `computation`.
- Planets: “Characters modulo eight” and “Artin boundary continuation” were removed, and named theorems added
  (Siegel–Walfisz, Shintani matrix functional equation, Lerch monodromy, the two new AN.4 theorems). Every layer has
  at most 6.
- New source issue **E49**, a misprint: Kedlaya Theorem 4.12 (§4.4, p. 27) prints the hypothesis “gcd(m,N)” without
  “= 1”.

## Red-team findings

- **RT-AREA-analytic/1** (arithmetic-scheme Chebotarev). Restructure entry 1 proposes “Chebotarev density theorem,
  Part II: arithmetic schemes”, extending Tau Ceti Chebotarev. AN.4's RS-07 narrowing excludes the scheme form, and
  Tau Ceti roadmaps are never changed here. AN.4's coverage and `paperCoverage` (Abdurrahman–Venkatesh /20) name the
  proposed owner.
- **RT-AREA-combinatorics/8** (the AC.4 route). The packet supplies both contracts:
  - for the Green–Tao 2008 route, `green-tao-zeta-strip`, `riemann-zeta-weak-convexity` and `siegel-walfisz`, plus the
    bound W(N) ≤ (log N)^B;
  - for the Conlon–Fox–Zhao route, nothing beyond Mathlib's `isBigO_riemannZeta_sub_one_div` and Chebyshev bounds.

  Restructure entry 2 says when the RS-07 link AN.2 → AC.4 should be narrowed or kept. The route is AC.4's choice.

## Paper coverage

All 91 items of the 14 maintainer-added papers have a destination in `paperCoverage`: a target, a proof ingredient,
or a named outside owner. Two items are routed out by request:

- Tsimerman's Colmez finite-family uniformity, to the CM supplier (gap “Colmez finite-family and regularized Brauer
  suppliers”);
- Skorobogatov–Sofos's Wintner mean value, to the generic Abel/convolution supplier.

Koymans–Pagano /249 now maps to the effective Chebotarev target, and Gross–Zagier /196–197 to the Gauss-sign target.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`, with the pinned
  declaration index: **0 errors, 0 warnings**. All 228 baseline references resolve, and the own-node graph is acyclic.
- Source issues, put into an errata-form scratch file: `scripts/check_errata.py` reports **ok**.
- Own checks:
  - no request or gap without a target consumer;
  - every reader anchor resolves (236 targets);
  - no private path, Lean code or `sorry` in the packet or reader;
  - “optional” and “deferred” do not occur; the five uses of “later” are in carried text and refer to a later part of
    a source.
- `lean-check research/blueprint/suggested/AnalyticNumberTheory.lean` at Mathlib 082e2d3 and Tau Ceti f790474: **exit
  0, 51 `declaration uses 'sorry'` warnings, no other messages**. No language server, `lake build`, `lake update` or
  cache download was run.
- A Sonnet subagent cross-checked every Lean declaration against its packet node, API item and test. Its findings were
  applied: the test instances now match the packet's, an API item was added, and `π` is written `Real.pi`. It found no
  data definition with a `sorry` body.

## What remains

Every stage is `planned`, and AN.0, AN.1 and AN.6 are `closed` as RS-07 drops. The coverage records list the open
proof boundaries precisely: 58 gaps and 55 requests. The main ones:

- **AN.2:**
  - canonical-product limits and good-circle lower bounds;
  - the quantitative PNT remainder;
  - the conductor-uniform region and the Siegel–Walfisz proof;
  - certified numerical inputs (Rosser–Schoenfeld, Schoenfeld, Ramaré–Rumely);
  - Siegel ineffectivity.
- **AN.3:** explicit-formula adapters, the argument-principle phase, the Hilbert inequality, the Mestre contour formula.
- **AN.4:**
  - Artin induction proofs, the Colmez family, the quadratic period normalizations;
  - effective Chebotarev's explicit formula, zero count and Deuring–Heilbronn repulsion (new gap). Lagarias–Odlyzko
    and Lagarias–Montgomery–Odlyzko were not read; their statements come from Zaman's thesis §1.2.
- **AN.5:** the Halász decomposition, the Dickman recursion, Landau and Selberg–Delange transfers, the Beurling remainder.
- **AN.7:** the Lerch functional-relation refinements.
- **AN.8:** the Bochner tube theorem, nonprincipal modules, the Datskovsky–Wright unfolding.
- **AN.9:** Haar/adelic adapters, the OperatorTheory Part II requests, the heat-trace and Weyl inputs.

**For the package job.** Two cited roadmaps are outside the 94 that Caraiani–Newton needs. At package time their
notions should move down, as the upstream order prescribes:

- SieveMethodsAndPrimePatterns SV.1: Shiu's bound and the Mangoldt window used in the Halász proof, into AN.5;
- ProbabilisticAndMetricNumberTheory PM.5: the random-matrix moment-model predicates, into AN.5's conjectural model.

Every other citation is to a lower tier or to ArithmeticStatistics, which is in this roadmap's tier-14 bundle.

**Notes for the maintainer** (`upstreamNotes`):

- The Tau Ceti ArithmeticDirichletSeries and Chebotarev READMEs assign the effective theory to “Zeros of L-functions”
  and “LFunctions” roadmaps that exist nowhere. In the atlas that theory is planned here.
- The ArithmeticDirichletSeries README still calls 10.4 conditional, while its STATUS reports it proved.

## Sources

- **Read in this job (14 October 2026), public copies:**
  - Kedlaya, *Notes on analytic number theory* (author PDF, SHA-256 7a934fce…, the same file as the predecessors):
    §1.3, §4.4, §7.3, §10.1–10.3, §22.2–22.5.
  - Zaman's PhD thesis (Toronto 2017, SHA-256 03e075ae…): §1.2 pp. 7–8, §1.3.2 p. 16, §4.1 p. 69.
  - DLMF §5.11 (SHA-256 1f9879c2…) and §5.17 (SHA-256 18554e52…).
  - The TauCetiRoadmap READMEs and STATUS files of ArithmeticDirichletSeries and Chebotarev at 0d144d0.
  - The current Tau Ceti sources for the Chebotarev, ArithmeticDirichletSeries, LSeries and DirichletCharacter modules.
- **Inherited:** all other sources and reading receipts come from the two accepted part packets and stay in
  `sources` and `sourceVersions`.
- **Not read:** Lagarias–Odlyzko (1977) and Lagarias–Montgomery–Odlyzko (1979), now a recorded gap. The
  predecessors' unread sources are listed in their gaps. No uncleared book was used.
