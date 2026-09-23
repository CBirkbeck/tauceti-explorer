# REV-PAPER-GAN-SAVIN-23-B — review of the extraction of Gan–Savin, "The Local Langlands Conjecture for G_2"

Job: #1379. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-GAN-SAVIN-23-B.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. All 15 recorded mistakes are
confirmed; two records were added to the source block.

## What I read

W. T. Gan and G. Savin, *The Local Langlands Conjecture for G_2*, Forum of Mathematics Pi
**11** (2023), e28, 1–42; doi:10.1017/fmp.2023.27. Open access, CC BY 4.0. Printed page = PDF
page.

No later version or erratum corrects anything below: Crossref's DOI record carries no update
or relation entry, and arXiv 2209.07346 stops at v2, which the extraction records as predating
the journal revision.

## A provenance problem

The source block's `sha256` for the published PDF is **not reproducible**. Cambridge stamps
each download with the date and time on every page. Two downloads on 23 September 2026:

| | |
|---|---|
| recorded | `9a68ba45…3b4ce` |
| download 1 | `dc968e17…19bb` |
| download 2 | `8cbded05…8a2a` |

differing from each other only in that stamp. I recorded `source.sha256Note` and a hash that
**is** reproducible: `publishedTextSha256 = f35be3dd4537e0816bc98cf31333c3d22f751b8a39d3387ce32867b1b8bc66f5`,
the stamp-stripped `pdftotext` output, identical from both downloads. The arXiv hash the source
block also carries remains a second anchor.

## Four settled decisively by the paper's own text

**E3** (p. 4). The Main Theorem (ix) prints

    γ(s, π × τ, ψ) = γ(s, std ◦ L(π)) ⊗ φ_τ, ψ)

whose brackets do not balance: the close after `L(π)` shuts `γ(` prematurely, leaving
`⊗ φ_τ, ψ)` with an unmatched close. The intended `γ(s, (std ∘ L(π)) ⊗ φ_τ, ψ)` is the only
reading that parses and the only one that is a γ-factor of a tensor product.

**E6** (p. 11). The text introduces a totally real field and then takes the wrong base:

> Let `k` be a totally real number field with a place `w` such that `k_w ≅ F`. Let `O` be a
> totally definite octonion algebra **over F** with automorphism group `G = Aut(O)`. Then `G_v`
> is anisotropic at all archimedean places `v` and `G_v` is the split `G_2` at all finite places
> `v`.

An octonion algebra over the local field `F` has no places `v` to be anisotropic at; the
paragraph is a global argument and the algebra must be over `k`.

**E13** (p. 36). The same page prints the formula correctly eighteen lines before printing it
wrongly: `std ∘ φ = L_{Sp_6}(rest(σ))` at line 18, against
`std ∘ φ = L_{SO_6}(θ^♠♣(σ)) ⊕ 1 = L_{Sp_6 6}(rest(σ))` in the proof of Theorem 12.3.

**E5** (pp. 8, 10). Theorem 2.1's parts are printed as (i) Howe duality, (ii) theta dichotomy
("Let `π ∈ Irr(G_2)`. Then `π` has nonzero theta lift to exactly one of `PD^×` or `PGSp_6`")
and (iii) "More precisely, one has:". The decomposition of `Irr(G_2)` is therefore introduced
by **(ii)**, yet p. 8 cites "the decomposition of `Irr(G_2)` in Theorem 2.1(i)" and p. 10
"introduced in Theorem 2.1(i)".

## The two gaps

**E2** is the more consequential, and again the paper's own text settles that a hypothesis is
missing. Theorem 9.1(ii) is stated on p. 27 for **every** `π`:

> suppose that `π ∈ Irr(G_2)` has (enhanced) L-parameter `(φ, η)`, then its local theta lift
> `θ(π) ∈ Irr(PGSp_6)` has (enhanced) L-parameter `(φ′, η′)` satisfying …

But Theorem 2.1(ii) on p. 8 is the theta dichotomy: `π` has nonzero theta lift to **exactly
one** of `PD^×` or `PGSp_6`. For the `π` whose nonzero lift is to `PD^×`, the phrase "its local
theta lift `θ(π) ∈ Irr(PGSp_6)`" has no referent, so the statement cannot hold as printed and a
restriction is required. I confirm that a restriction is needed; its exact form — the extraction
proposes `φ ∈ Φ^♦_ds(G_2)` — rests on the extraction. "Affects a stated result" is right.

**E1** (p. 14) is confirmed as printed: "One has a projective system … of centralizer subgroups
`Z_{G_2}(φ)` which are finite of order 3, and thus identified with the component groups `S_φ`",
with no hypothesis on `φ`. The scope of the repair — that this is the non-self-dual case, a
self-dual `ρ` giving `S_φ ≅ S_3` — rests on the extraction's analysis, which I did not
re-derive. Classified a gap rather than an error, which is the right call.

## The remaining nine

**E4, E7, E8, E9, E11, E12, E14, E15** were verified as printed at their locators. E15 is
internally inconsistent as printed — "the global theta lift `Θ(Σ)` of **Π** to `PGSO_8`", where
`Θ(Σ)` is by its own notation the lift of `Σ`, the representation the sentence has just
constructed. E4 is confirmed against the paper's structure: Appendix A is §10, not the §9 cited,
§9 being where Theorem 9.1 sits.

Where a finding bundles a principal element with subsidiary ones, or where its correction
depends on re-deriving an identity rather than reading the page, **the verdict says so
explicitly**.

**E10** is the one I could not settle from the text layer at all: the symbol after "parameterized
by" is dropped in extraction. I confirm it on the sentence's own logic — the stabilizer can only
be `Aut(D)` if the orbit is the one parameterized by `D` — and the verdict records that this is
the basis, rather than a glyph reading.

## Items, statuses and routes

- **One library item**, read at the pinned commit and correct: item 114 cites Banach–Alaoglu,
  and Mathlib's `isCompact_closedBall` and `isCompact_polar`
  (`Analysis/Normed/Module/WeakDual.lean:269, :313`) say what it claims.
- **4 planned items**, all naming atlas layers that exist.
- **123 missing items, routed exactly once each.** No run-together numbering.
- **6 routes, all accepted.** Both new roadmap names are free and both Part II titles are exact
  prefix extensions of their parents'.
  - `LocalLanglandsCorrespondenceForG2` (75 items) is the paper's own architecture — the map
    `L`, its surjectivity, its fibres, and the characterisation by Main Theorem (i), (ii), (iii)
    and (ix) — and nothing in the atlas plans it.
  - `ExceptionalThetaCorrespondencesForG2` (25 items) is **co-proposed by PAPER-GAN-SAVIN-23**,
    the companion paper "Howe duality and dichotomy for exceptional theta correspondences". That
    is the right structure rather than a duplication: the dichotomy is used *here* as an input
    (Theorem 2.1(ii)) and proved *there*, so one shared roadmap is exactly what the pair needs.
  - `MetaplecticAutomorphicFormsPartIIShimuraWaldspurger` is co-proposed identically by
    PAPER-GAN-ICHINO-18 and PAPER-ICHINO-PRASANNA-23 — a three-way merge.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-SAVIN-23-B.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
