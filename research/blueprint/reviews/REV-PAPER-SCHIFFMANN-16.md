# REV-PAPER-SCHIFFMANN-16

Independent review of the extraction of Olivier Schiffmann, *Indecomposable vector bundles and stable
Higgs bundles over smooth projective curves*, Annals of Mathematics **183** (2016), no. 1, 297–362
(doi 10.4007/annals.2016.183.1.6; arXiv 1406.3839v2).

Issue [#1183](https://github.com/CBirkbeck/tauceti-explorer/issues/1183). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All four routes accepted. The published version was obtained and the findings
re-checked against it; one finding changes status as a result.

## The published version is available, and I obtained it

The extraction recorded all four findings against arXiv v2 and said "the published version in the
Annals of Mathematics could not be read here", with no claim about print. It is in fact served, like
other Annals articles, at

> `https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf`

— 66 pages, SHA-256 `8e486963410368afe461a6f2a848eb7ddb618aa48fda7db2c0bd51710286c7a5`, **printed page =
PDF page + 296** (pp. 297–362). I re-checked all four findings there, and the result is **not
uniform**, which is exactly why it was worth doing.

### Three survive in print

| id | published location | what is still there |
|----|--------------------|---------------------|
| **E2** | Proposition 5.1, p. 322 | `X_{r_1,…,r_s}` against its own definition four lines below, and the second factor taking `(z_r,…,z_1;w)` — a variable that does not occur in the statement. The published text renames `A^{≥0}` to `Y^{≥0}` **without touching either slip**, which is itself evidence the passage was retyped |
| **E3** | the list on p. 306 | `A_{g,3,d}` and `A_{g,4,d}` still drop the argument `0` that the introducing sentence and the first two entries carry |
| **E4** | pp. 349, 351, 301 | `Σ n_i = n`; `Σ_i l_j = i`; and the Poincaré dual's exponent `q^{2(1+(g−1)r²` — two opening parentheses and none closing — in published Corollary 1.4(i), read on a **rendered page image** rather than the text layer, a dropped bracket being exactly what a text layer invents |

### One is corrected in print, and I have recorded it as such

**E1** — the lemma whose second and third parts are both labelled `ii)` in arXiv v2 — is **fixed in
the Annals text**: the statement is renumbered **Lemma 2.3** on printed p. 309 and its parts are
labelled `(i)`, `(ii)`, `(iii)`.

A slip that the publisher's copyediting fixed is not a mistake in published work. Rather than leave
it as a new finding, I set its `known` field to record the published version as the correction.
PROTOCOL §18 provides for exactly this, and the register will now list it among mistakes **already
corrected in print** instead of attributing it to the Annals paper.

## Other corrections made in place

Each finding now carries its published location beside its preprint one, and a
`publishedVersionCheck` records the retrieval, the hash, the page map and the **renumbering between
the two versions** — preprint Corollary 1.6 is published Corollary 1.5, preprint Corollary 1.9 is
published Corollary 1.4, preprint Corollary 1.10 is published Corollary 1.9 — which a design job
would otherwise have to rediscover. No item, status, route or quotation changed.

## Items, statuses, routes

**59 items: 1 library, 3 planned, 55 missing.** Every missing item is routed exactly once and all
dependencies resolve. The five declarations of the library item (`YoungDiagram` with transpose, row
and column lengths, and `Nat.Partition`) were opened at the pinned commits. All four stage ids cited
by the routes and the planned items exist.

Four routes, all accepted. The **new roadmap** is justified by a sweep of every roadmap extract for
*Hall algebra*, *Kac polynomial*, *Higgs bundle* and *indecomposable vector bundle*, which returns
**nothing**; its id is free, `functionfields` is a galaxy id, and no other extraction proposes it.
The three source routes are well drawn — `GS.0` for the stack of bundles with its
Harder–Narasimhan stratification, `DWP.0` for the purity and weight statements that E4's two slips
sit in, and `ET.2b` for the Higgs moduli and the global nilpotent cone, which are **imported rather
than re-planned**. That is the same boundary `PAPER-GROECHENIG-WYSS-ZIEGLER-20` respects, so the two
extractions agree about who owns Higgs moduli.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
