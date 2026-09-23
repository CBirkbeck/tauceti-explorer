# REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 — review of the extraction of Colmez–Dospinescu–Nizioł, "Factorisation de la cohomologie étale p-adique de la tour de Drinfeld"

Job: #1372. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-COLMEZ-DOSPINESCU-NIZIOL-23.result.json`,
by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. All 6 recorded mistakes are
confirmed, every one decisively.

## What I read

P. Colmez, G. Dospinescu and W. Nizioł, *Factorisation de la cohomologie étale p-adique de la
tour de Drinfeld*, Forum of Mathematics Pi **11** (2023), e16, 1–62; doi:10.1017/fmp.2023.15.
Open access, in French. **Printed page = PDF page**, confirmed against the running heads.

No erratum: Crossref's DOI record carries no update or relation entry.

## A provenance note, with a detail worth recording

The recorded `sha256` is **not reproducible** — the article carries a per-download stamp on all
62 pages and its `ModDate` is set at download.

What makes this one instructive: **two of my three downloads agreed** (`89c9d43a…48a7`), which
looks like reproducibility but is not — the stamp has one-second granularity and those two
requests completed in the same second. The third gave `9d9a3ca1…b913`, and none matched the
recorded `1c6ee85b…7d49`. **Two agreeing downloads are not evidence; take three.**

A reproducible stamp-stripped text hash,
`08bae10932da0efb09817301c0d089ea34da05f59f444429e024f623bf4fa34a`, is recorded as the anchor.

## All six confirmed, decisively

### E3 — the body states more than the introduction announces

This is the substantive one, and the paper settles it against itself.

Published **p. 9**, Théorème 0.18(ii):

> **Supposons que p > 3.** On a un isomorphisme de `E^{δ_M}_B[G_{Q_p}]`-modules …

Published **p. 59**, Théorème 5.24(ii):

> On a un isomorphisme de `E^{δ_M}_B[G_{Q_p}]`-modules …

The same isomorphism, stated in the body with **no hypothesis at all**. The body statement is
therefore strictly stronger than the one the introduction announces, and the missing condition
is exactly the one the finding names; the article's own discussion of the Steinberg block ("pas
à un twist `{χ, St ⊗ χ, I(χ,χε)}` du bloc de la Steinberg") supplies the `p = 3` alternative.
"Affects a stated result" is the right classification. The companion remark, that Théorème
5.15's proof cites results carrying the same restriction, rests on the extraction's reading of
that proof.

### E1 — a dual defined as its own dual

Published p. 55: "les produits tensoriels non spécifiés sont au-dessus de `R_{B,M}` et
**`Ř_{B,M} = Hom(Ř_{B,M}, L)`**". A dual cannot be defined as the dual of itself;
`Hom(R_{B,M}, L)` is meant, and is the only reading under which the displayed tensor products
over `R_{B,M}` and `Ř_{B,M}` make sense.

### E2, E4, E5, E6 — verifiable at a glance

| id | published text | note |
|----|----------------|------|
| E2 | "qui, **pour pour** tout `k ⩾ 1`, sont fixes modulo `p^k`" (p. 55) | the doubled word occurs exactly once in the article |
| E4 | "[52] V. Paškūnas, Extensions for supersingular representations **of )**, Astérisque 331" (p. 62) | the group name has dropped out, leaving a stray parenthesis; the paper's own [71] shows the intended "of GL₂(F)" |
| E5 | "[42] … quaternion algebra over **𝑔 𝑝**" (p. 62) | the field set as two letters rather than `Q_p` |
| E6 | "[68] M. Strauch, Geometrically connected components **of of** Lubin-Tate deformation spaces" (p. 62) | doubled "of" |

## Items, statuses and routes

- **No library items**, right for this material.
- **16 planned items**, all naming atlas layers that exist.
- **76 missing items, routed exactly once each.**
- **13 routes, all accepted**: three new roadmaps, one Part II and nine source additions. All
  four proposed names are free, and the Part II title is an **exact prefix extension** of its
  parent's.

### Two merges I could check at first hand

I reviewed **PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B earlier in this same session** (PR #2474),
which lets me report the continuity directly rather than infer it:

- **`ProetaleCohomologyOfPAdicCurvesAndTowers`** — the reason says this is the roadmap 20-B
  proposed for the cohomology of a non-proper p-adic curve and the Drinfeld tower, and that the
  geometric half of *this* paper is its mod p counterpart. Reviewing 20-B I confirmed that
  nothing in the atlas computes that cohomology, so the two proposals agree. A four-way merge
  with PAPER-BOXER-CALEGARI-GEE-PILLONI-25 and PAPER-DOSPINESCU-LEBRAS-17.
- **`PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`** — the Part II 20-B proposed for the
  geometric realisation, which this paper **completes**: 20-B carries the construction of `Π(V)`
  as the multiplicity space in the Drinfeld tower for supercuspidal `V` of weights 0 and 1, and
  this paper the factorisation. **Complementary, not overlapping.**

The other two new roadmaps are well delimited: `ModpRepresentationsOfGL2OverLocalFields` notes
that the atlas plans the mod p classification only for `GL₂(Q_p)`, inside R30.2, and none of the
finiteness theory for a general finite extension; and
`ScholzeFunctorAndModpCohomologyOfTheLubinTateTower` — the one roadmap unique to this paper —
names the nearest candidate and says why it does not cover Scholze's functor, ET.6a planning the
ℓ-adic two-tower realisation rather than the mod p functor.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COLMEZ-DOSPINESCU-NIZIOL-23.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
