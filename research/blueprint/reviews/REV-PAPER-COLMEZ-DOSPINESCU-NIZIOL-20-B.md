# REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B — review of the extraction of Colmez–Dospinescu–Nizioł, "Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1"

Job: #1425. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B.result.json`,
by session cc-442dc5.

**Verdict: accept.** Nothing needed correcting in place. All 6 recorded mistakes are
confirmed, every one against the published text.

## What I read

P. Colmez, G. Dospinescu and W. Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas
de la dimension 1*, J. Amer. Math. Soc. **33** (2020), 311–362; doi:10.1090/jams/935. In
French.

The **published** AMS PDF, re-fetched by this review and hashing to
`db810ee0b4017eba2f30801c8cc76df6d61f3b32a6ef07cb891586e4121f0a16` — matching the record
**byte for byte** — 52 pages, printed page = PDF page + 310.

The source block's central claim is therefore verified: JAMS opens its back content six years
after publication, so volume 33 (2020) is freely available and the extraction really did read
the published text rather than a preprint. That is a materially better basis for an errata
record than a preprint, and it is worth saying so.

> A note on how this checked out. This extraction's observation about the six-year policy is
> what led me to discover and correct an error in my own immediately preceding review, of
> PAPER-LAFFORGUE-18, where I had wrongly accepted that a JAMS article could not be consulted.
> The working URL carries a `/journals/` path segment that the Unpaywall-supplied URL omits.
> That correction is recorded in PR #2471.

## All six confirmed, four by the paper's own argument

### E1 — the proof announces the wrong part, twice (p. 345)

The proof of Proposition 4.8 opens

> Le (ii) est une conséquence directe du (i) et de suite exacte ci-dessus.

and its next sentence reads

> **Pour montrer le (ii)**, on montre d'abord que l'action de `G_j` (resp., `Ǧ_n`) sur
> `O(M^ϖ_n)^*` … peut se dériver

Having just deduced (ii) from (i), the proof announces (ii) a second time and never announces
(i) — while what follows, deriving the action and showing that a functional killed by the Lie
algebra vanishes, is exactly the proof of (i). The second half of the finding, "et de **la**
suite exacte", is a dropped article in the same sentence.

### E4 — bracket counting settles it (p. 355)

Proposition 5.16 displays

    C(S^p(U), F) = H⁰(G, Hom(π, LC(S(U))) ⊗ X.

The three closing parentheses after `S(U)` close `S(`, `LC(` and `Hom(` — leaving `H⁰(G,`
**unclosed**. That the tensor factor belongs outside the invariants is exactly what the proof
does, pulling `X` out of the `Hom` because `G` acts trivially on it, and how the proposition
is applied three lines later: `Hom_G(π, LC(S(U))) ⊗_L Z`.

### E3 — a map whose kernel is its source (p. 355)

> comme M est de pente 1/2, le noyau `t(B⁺_st ⊗ M)^{N=0,φ=1}` de
> `θ : (B⁺_st ⊗ M)^{N=0,φ=1} → C ⊗ M_dR` est réduit à 0

The source of `θ` carries the **same** superscript as its kernel. Throughout the paper `θ` is
defined on `X⁺_st(M) = (B⁺_st ⊗ M)^{N=0,φ=p}`; only the superscript on the source is wrong.

### E6 — read on a page image (p. 343)

Lemma 4.4 hypothesises

> … une réunion croissante stricte d'affinoïdes `X_n` dont les images inverses **dans X** sont
> des affinoïdes perfectoïdes.

I read this on a rendered page image, because the whole finding turns on a hat that a text
layer drops — and the image shows a **plain `X`, no hat**. As printed the hypothesis is
absurd: the inverse image of `X_n` in `X` is `X_n` itself, an affinoid that is never
perfectoid. The covering is `X̂`, and the proof says so: "l'image inverse `X̂_n` de `X_n` dans
`X̂` est affinoïde perfectoïde".

### E2 and E5

**E2** (p. 349) is confirmed as printed, and the text layer is itself evidence that the
distinction is real rather than a rendering artefact: the page renders the caron in
`ρ_{Π̌,p}` but **not** in the `Π_p` of the parenthesis. The choices fixed on p. 348 are `Π̌`
with `Π̌_p = JL(M)` and `Π` its Jacquet–Langlands partner with `Π_p = LL(M)`; the hypothesis
invoked concerns `ρ_{Π̌,p}`.

**E5** (p. 355): the first half is verified directly — the display prints `LC(U^p)`, and `U^p`
is not a defined object in this paper, the space being `S(U)`. The second half, the bracket
closing after `Sh_n(U)`, follows the extraction's collation with Proposition 5.12; I verified
the display as printed but did not re-derive the bracketing.

## Items, statuses and routes

- **No library items**, right for this material.
- **21 planned items**, all naming atlas layers that exist.
- **81 missing items, routed exactly once each.**
- **No run-together numbering anywhere.**
- **15 routes, all accepted**: two proposals and thirteen source additions.
  - **`ProetaleCohomologyOfPAdicCurvesAndTowers`** (new, 55 items). The reason delimits rather
    than asserts: AdicEtaleGeometry and ClassicalAdicEtaleCohomology build the sites and the
    ℓ-adic and torsion theory, PadicHodgeTheory P8 the period sheaves, CohomologyComparisons
    and CrystallineCohomology the comparison theorems for **proper** formal models — and none
    computes the p-adic pro-étale cohomology of a **non-proper** rigid analytic curve, which
    is the Stein package this paper runs on. Naming each neighbour and saying what it stops
    short of is the right way to justify a new roadmap.
  - **`PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`** (Part II, 26 items), whose
    title is an **exact prefix extension** of its parent's. The parent constructs `V ↦ Π(V)`
    through Colmez's functor; this paper adds the geometric construction of `Π(V)` as the
    multiplicity space of `V` in the p-adic étale cohomology of the Drinfeld tower.
  - Both names are free, and both are co-proposed with identical id, parent and title by other
    papers — the first by three, the second by two — so they are merges, not conflicts.
  - The **thirteen source routes** are what make the two proposals credible: the extraction
    imports from thirteen existing owners and asks for new ground only where it has shown,
    neighbour by neighbour, that none exists.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
