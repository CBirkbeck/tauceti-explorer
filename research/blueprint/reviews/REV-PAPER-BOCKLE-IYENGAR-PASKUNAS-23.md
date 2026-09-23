# REV-PAPER-BOCKLE-IYENGAR-PASKUNAS-23 — review of the extraction of Böckle–Iyengar–Paškūnas, "On local Galois deformation rings"

Job: #1383. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-BOCKLE-IYENGAR-PASKUNAS-23.result.json`,
by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. All 9 recorded mistakes are
confirmed; three records were added to the source block.

## What I read

G. Böckle, A. Iyengar and V. Paškūnas, *On local Galois deformation rings*, Forum of
Mathematics Pi **11** (2023), e30, 54 pp.; doi:10.1017/fmp.2023.25. Open access, CC BY.
Printed page = PDF page.

And the **Corrigendum**, Forum of Mathematics Pi **12** (2024), e5; doi:10.1017/fmp.2024.3.

## Two source-block claims tested rather than accepted

### The Corrigendum really does correct only an affiliation

The extraction states this, and it is the basis on which all nine findings can say that no
erratum corrects them — so it is worth checking rather than repeating. I fetched the
Corrigendum and read it in full. It says:

> The authors regret the inclusion of an error in the above article. On page 1, the
> affiliation 'Universität Duisberg Essen' was spelled incorrectly. The correct spelling
> should read: Universität Duisburg-Essen. The article has been corrected.

Nothing else. Crossref lists this as the article's only update. **The extraction's claim is
exactly right.** The PDF now served is the corrected version — it reads "Duisburg-Essen".

### The recorded PDF hash is not reproducible

Cambridge stamps every page with the download time ("Downloaded from
https://www.cambridge.org/core … on <date> at <time>"). Three downloads on 23 September 2026
gave three different hashes:

| | |
|---|---|
| recorded by the extraction | `ef8dbe35…a9a69` |
| this review, first download | `d51b0526…4898` |
| this review, second download | `fd2f9e08…7e42` |

I added `source.sha256Note` recording this, and a hash that **is** reproducible:
`publishedTextSha256 = 99bb7a1b43652f946fc06dd31c905d2a502bf1c73504130bf8e1dbb3104b3de1`,
the SHA-256 of `pdftotext -layout` output with the stamp lines stripped, obtained identically
from both downloads.

## All nine confirmed — four decisively

### E1 and E4, settled on page images

Each turns on a glyph the text layer drops, and both are plainly there.

**E1** (p. 9). One sentence contains its own contradiction:

> Let `Λ_i : E → R^ps`, **`0 ≤ i ≤ d`** be the coefficients of the characteristic polynomial
> of `D^u`; these are homogeneous polynomial laws satisfying
> `D^u(t − a) = Σ_{i=0}^{**n**} (−1)^i Λ_i(a) t^{d−i}`

The coefficients are indexed to `d` and the exponent is `t^{d−i}`; `n` is not a defined symbol
in that sentence.

**E4** (p. 28). The bar is clearly visible on the image:

> The open subscheme `U_max = X^ps ∖ {𝔪_{R^ps}} ⊂ **X̄^ps**` is Jacobson by Lemma 3.18

`U_max` is `X^ps` with a point removed, hence an open subscheme of `X^ps`, not of the
compactification.

### E6 — self-referential as printed

Page 42: "Let `R_{ρ_x}` be the universal deformation ring of **`R_{ρ_x}`**". The object being
deformed is `ρ_x`, named two clauses earlier ("denote by `ρ_x`").

### E8 — checked against the paper's own environment headings

I searched the published text for each cited result and compared its heading with the
citation:

| result | actual heading | cited as |
|---|---|---|
| 3.23 | **Lemma** 3.23 | Corollary 3.23 (p. 25) |
| 3.37 | **Lemma** 3.37 | Proposition 3.37 |
| 4.29 | **Corollary** 4.29 | Lemma 4.29 |
| 3.24 | appears as **both** Lemma 3.24 and Proposition 3.24 | — |

Four cross-references carry the wrong environment kind. None of the *numbers* is wrong, so
nothing downstream is misdirected.

### E2, E3, E5, E7, E9

Verified as printed:

- **E2** (p. 19): `X^ps_j := R^ps_j` sets a scheme equal to a ring; `Spec R^ps_j` is meant.
- **E3** (p. 27): `ρ̄_i : G_F → GL_d(k)` where the factors have their own dimensions `d_i`.
- **E5** (p. 31): the scheme-theoretic image is taken the wrong way round.
- **E7** (p. 48, proof of Lemma 6.5): verified word for word. The proposed repair — replacing
  `ψ` by `ψμ` for the unramified `μ` with `μ(Art_F(ϖ_F)) = κ(Art_F(ϖ_F))` — follows the
  extraction's analysis; I did not re-derive it, and the verdict says so. This is the only one
  of the nine classed as affecting a proof, and that classification looks right.
- **E9** (pp. 22, 51): both inequalities printed as quoted. The final numerical step needs
  `d ≥ 2`: at `d = 1` one has `l_{𝒫_max} = 1`, and `d[F:Q_p] = [F:Q_p]` can be `1` when
  `F = Q_p`. Stating the hypothesis is the right repair, and "affects nothing" is right, the
  paper's setting having `d ≥ 2` throughout.

## Items, statuses and routes

- **No library items**, right for this material.
- **11 planned items**, all naming atlas layers that exist.
- **136 missing items, routed exactly once each.** No run-together numbering.
- **7 routes, all accepted**: five source additions carrying the GIT, deformation-algebra,
  determinant, duality and p-adic Hodge inputs, and two Part IIs carrying the paper's own
  structural results. Both Part II titles are **exact prefix extensions** of their parents'
  and both names are free.

### A cross-paper check I could make directly

Both Part IIs are co-proposed with identical id, parent and title:

- `LocalGaloisDeformationRingsPartIIComponentsAndNormality` — with PAPER-PASKUNAS-QUAST-26.
- `CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity` — with
  **PAPER-LE-LEHUNG-LEVIN-ETAL-23**, whose extraction I checkpointed earlier in this same
  session (PR #2477). I can therefore report at first hand that the two proposals agree and
  will merge without divergence, rather than inferring it.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOCKLE-IYENGAR-PASKUNAS-23.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
