# REV-PAPER-LAFFORGUE-18 — review of the extraction of V. Lafforgue, "Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale"

Job: #1433. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-LAFFORGUE-18.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. All 12 recorded mistakes are
confirmed.

## What I read

V. Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale*,
J. Amer. Math. Soc. **31** (2018), no. 3, 719–891; doi:10.1090/jams/897.

arXiv 1209.5352v10, re-fetched and hashing to
`b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295` — matching the record —
184 pages, in French.

## The "published version unreachable" claim was checked, not assumed

The extraction records that the published JAMS text could not be consulted. I checked this
rather than taking it on trust, **because the same claim proved false in the paper I handled
immediately before** — PAPER-BOCKLE-HARRIS-KHARE-ETAL-19, where Acta Mathematica turned out
to be openly available and the published text differed from the arXiv version.

Here the claim holds:

- Unpaywall reports `doi:10.1090/jams/897` as **bronze** open access, with a publisher PDF at
  `https://www.ams.org/jams/2018-31-03/S0894-0347-2018-00897-5/S0894-0347-2018-00897-5.pdf`.
- That URL returns **HTTP 403** to curl and, to a browser user-agent, a 3 MB **HTML bot
  interstitial** rather than a PDF.
- The `r.jina.ai` proxy returns the **JAMS issue listing**, not the article.

So the extraction is right, and every finding stands against v10 only. I added a
`publishedVersionCheck` record to the source block so the next worker need not repeat the
attempt.

## Four settled decisively

**E3** (p. 86, proof of Lemme 6.11). The page prints

> (de façon encore plus canonique **pr₁\*(F^(I))** et **pr₁\*(F^(I))** sont tous les deux
> image inverse de S_{I,W,E})

— the same projection twice — while the sentence immediately above introduces both: "Comme
les projections **pr₁ et pr₂** de …". The second must be `pr₂*`.

**E6** (§12.2.3, p. 154). The page says "On rappelle que dans **(12.1)** la somme est indexée
par ker¹(F,G)". But (12.1), on p. 150, is the *inclusion* `G(F)\G(A)/K_N ⊂ Bun_{G,N}(F_q)` —
there is no sum in it. The decomposition indexed by `ker¹(F,G)` is **(12.2)**,
`Bun_{G,N}(F_q) = ⊔_α G_α(F)\G_α(A)/K_N`, and p. 150 itself refers twice to "le membre de
droite de (12.2)".

**E8** (Remarque 12.4, p. 152). One displayed equality carries `Q̄_ℓ` on the left and `E` on
the right; the ambient coefficient field in the remark is `Q̄_ℓ`, as the next display
confirms.

**E12**. `éventuellemement` occurs **exactly once** in the 184 pages (p. 170), and
`mais mais` **exactly once** (p. 55). Plainly typographical.

## The other eight

For E1, E2, E4, E5, E7, E9, E10 and E11 the quotation was verified at its locator and the
verdict states what rests on the extraction.

Three of them — E2, E9, E10 — turn on a superscript or a tilde that the text layer flattens.
The extraction records that it rendered page images for E9 and E10, which is the right
standard for exactly this. For **E2** my own crops of p. 116 did not capture the `Cht^{(I)}`
superscript cleanly, so that element rests on the extraction's reading; the surrounding text
("champ constant Bun_{G,N}(F_q) sur η^∅ = Spec(F_q)", and display (8.4)) is as described.

**E11** picked up incidental corroboration: while cropping p. 116 for E2 I read the analogous
display as an image, and it prints `H^{0,≤µ,E}_{N,I,W}` — coefficient `E`, representation `W`
— which is exactly what E11 says p. 172 should have instead of `H̃^{0,≤µ,Q̄_ℓ}_{N,I,V}`.

**E5** is worth flagging beyond this paper: Lemme 11.10 is one of the four items routed to
`LanglandsParameterStacks`, so its statement matters to a stage other papers also feed.

## Items, statuses and routes

- **No library items**, right for this material.
- **41 planned items**, all naming atlas layers that exist; **10 missing items**, routed
  exactly once each. No run-together numbering.
- The **41-planned-to-10-missing split is unusual and correct**, and route 1 explains it:
  this paper *is* the named source of `GlobalShtukasAndFunctionFieldLanglands`, stage by
  stage — GS.0's source route reads "V. Lafforgue global bundle/level setup", GS.1's
  "V. Lafforgue geometric Satake input", and so on. A reviewer should check that rather than
  flag the distribution.
- **4 routes, all source additions.** No Part II and no new roadmap, which for the paper a
  roadmap was already built from is plainly right.

### Route 3, and a cross-paper check

Route 3 sets out what LP2 and LP3 already own — the excursion algebra, the coarse quotient,
Fargues–Scholze VIII.3.8, the integral invariant theory — and then isolates what none of them
states and what the argument turns on: the **characteristic-zero** invariant theory, that a
tuple in `H(Q̄_ℓ)^n` is semisimple exactly when its diagonal conjugation orbit is closed
(Richardson), so that the `Q̄_ℓ`-points of `H^n//H` are the semisimple conjugacy classes. It
names Proposition 11.7 and Lemme 11.10 as what reconstructs `σ` for a profinite group and a
possibly disconnected `H`, observes that the string "pseudo-character" occurs nowhere in the
atlas, and concludes: *"Plan it once here, in characteristic zero for a profinite group and a
possibly disconnected reductive H, and let both LP2:semisimple-characters and GS.5 import
it."*

I reviewed **PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 immediately before this job**, and its route to
the same stage records that *it* supplies the **integral** form, "in a stronger form than the
characteristic-zero statements that PAPER-LAFFORGUE-18 routes" there. **The two extractions
are mutually consistent and cross-referencing** — which is precisely what two papers feeding
one stage at different generality should look like, and the thing most likely to go wrong
when they are extracted separately.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAFFORGUE-18.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
