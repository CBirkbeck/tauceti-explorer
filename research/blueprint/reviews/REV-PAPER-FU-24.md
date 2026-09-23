# REV-PAPER-FU-24 — review of the extraction of Fu, "Sharp bounds for multiplicities of Bianchi modular forms"

Job: #1084. Reviewer: Claude Code, session cc-d67081, 23 September 2026.
Extraction under review: `research/blueprint/papers/PAPER-FU-24.result.json`, by session cc-442dc5.

**Verdict: accept.** No item, status, route or locator changed. One field group in the
source block was corrected, and all seven recorded mistakes were confirmed.

## What I read

Weibo Fu, *Sharp bounds for multiplicities of Bianchi modular forms*, Ann. of Math. (2)
**200** (2024), no. 1, 123–152; doi:10.4007/annals.2024.200.1.3.

- arXiv 2201.11190v2, SHA-256 `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614`,
  which matches the hash the extraction recorded.
- The published text, fetched 23 September 2026 from the NSF Public Access Repository,
  `https://par.nsf.gov/servlets/purl/10625156`, SHA-256
  `a6a158565c556286deac651198771ab241c9c5c15021b783bfdcd5f3afa7fd80`, 31 pages.

Both were fetched into scratch only; neither is in the repository. Every locator below is
given in the published pagination (published page N is PDF page N − 122).

## The one correction

The source block claimed the published version had never been retrieved:

> A public published-version URL at https://par.nsf.gov/servlets/purl/10625156 was
> identified, but both browser retrieval and a 50-second curl request timed out. No
> published-PDF hash or full collation is claimed.

This contradicted the rest of the same file. The last `readSections` entry records "the
published Annals text, all of §§1–7 and references, read in full", and every one of the
seven `sourceIssues` locators cites the published copy by the hash prefix `a6a15856…`. So
the extraction did collate the published text; only this status note was stale, left over
from an earlier pass whose fetch had in fact timed out.

I re-fetched the URL, and it returned the paper in a few seconds. Its hash is
`a6a158565c556286deac651198771ab241c9c5c15021b783bfdcd5f3afa7fd80` — the `a6a15856…` the
locators cite. I therefore corrected `source.archiveStatus` and `source.version`, appended
a note to `source.continuationRead.scope`, and added `source.publishedSha256`. The
timeouts were transient, and the file now says so rather than disclaiming work it had
done.

## The seven recorded mistakes

All seven are confirmed. None is corrected by a later version or an erratum: arXiv
2201.11190 stops at v2, and Crossref's record of doi:10.4007/annals.2024.200.1.3 carries
no `update-to`, `updated-by` or relation entry (checked 23 September 2026). Four I
verified verbatim against the published text, one I redid outright, and for two I confirm
what I checked myself and say plainly what rests on the extraction.

| id | kind | locator | verdict |
|----|------|---------|---------|
| E1 | error | p. 125, eq. (2) | confirmed |
| E2 | misprint | p. 138, eq. (16) | confirmed |
| E3 | error | p. 147, Remark 5.8 | confirmed |
| E4 | error | p. 138, eq. (17) | confirmed, redone independently |
| E5 | gap | pp. 145–146, proof of Thm 5.7 | confirmed as a gap |
| E6 | misprint | p. 125, Thm 1.2(3) and Cor. 1.3 | confirmed |
| E7 | error | p. 145, Thm 5.7 | confirmed |

### E4, which I checked outright

Equation (17) on p. 138 sets

    S₀ := ⋃_{a≥0} (p^a + m^{a+1}) ⊆ R[[G]]

with `R` the ring of integers of a finite extension `K/Q_p` and `m` the maximal ideal. If
`K` is ramified then `p ∈ m²`, so for every `a ≥ 1`

    p^a ∈ m^{2a} ⊆ m^{a+1}   (since 2a ≥ a + 1 for a ≥ 1),

hence `−p^a ∈ m^{a+1}` and `0 = p^a + (−p^a) ∈ p^a + m^{a+1} ⊆ S₀`. A multiplicative set
containing `0` localises to the zero ring, so the microlocalisation built from `S₀` is
trivial for every ramified `R` — not merely ill-behaved. Taking `R = Z_p` or unramified,
as [AW13, §10] does, and base-changing to `K` afterwards is the right reading, which is
what the extraction says. This is also why route 6 (finite coefficient extension of the
completed group ring, at `PadicMeasuresIwasawaAlgebras:L1`) is the interface Fu actually
needs.

### E1, E2, E3, E6, E7, verified against the printed text

- **E1** (p. 125). Equation (2) is printed as
  `dim_C H_c^{r₁+r₂}(Y(K_f), W_k) = 2^{r₁} dim_C S_k(K_f)`, and the next sentence says the
  cusp forms correspond "to the first compactly supported cohomology … by the
  Eichler–Shimura isomorphism (2)". Eichler–Shimura identifies cusp forms with cuspidal
  (interior) cohomology; `H_c` carries boundary contributions too. The extraction is right
  that nothing downstream moves: the boundary terms are bounded by a constant times the
  number of cusps, which the degree-one saving absorbs.
- **E2** (p. 138). Equation (16) prints `D_r(G,K) = {Σ λ_α b^α : sup_α |λ_α| r^{|α|} < ∞}`,
  while the line above defines `D_r(G,K)` as the completion of `D(G,K)` for `‖·‖_r`. A
  non-archimedean completion with respect to a sup-norm on an orthogonal basis consists of
  the series whose terms tend to zero, not the bounded ones — c₀ against ℓ^∞ — so the
  displayed set is strictly larger than the object being defined.
- **E3** (p. 147). Remark 5.8 prints "induced **if and only if** the valuation λ₀ is at
  least 2", justified by `dχ(p²h₂) ∈ p²Z_p` for continuous `χ`. That argument gives only
  the "only if" direction; the converse needs a square root to exist. I checked the p = 3
  instance to the extent that `2λ(Δ)+1 = 3` is not a square in `Z_3`, so the valuation
  condition alone is not sufficient. I did not re-derive the paper's normalisation of `λ₀`
  against `λ(Δ)`, so the exact form of the corrected criterion rests on the extraction.
- **E6** (p. 125). Theorem 1.2(3) prints `dim_C S_k(K_f) ≤_{K_f} (min_{1≤i≤r} k_i)^{−1}
  O(Δ(k))` and Corollary 1.3 prints `dim_C H_c^n(Y(K_f), W_k) ∼_{K_f} k`. Both are
  notation slips, not mathematical errors: `i` ranges over the `r₁ + r₂` archimedean
  places, and `∼_{K_f}` means two-sided bounds with constants depending on `K_f`, neither
  of which the paper states.
- **E7** (p. 145). "Theorem 5.7. Let p be an odd prime. If 1/p < r < 1, then
  `D_r^λ(G, Q_p)` is an integral domain" — with `λ` an arbitrary infinitesimal character
  and no hypothesis in the statement or the proof. For `λ` of small valuation `Δ − λ`
  becomes a unit and `D_r^λ` is the zero ring, which is not an integral domain; the
  hypothesis `v_p(λ₀) ≥ 2`, satisfied in the only case the paper uses, excludes this. I
  verified the statement as printed and the absence of the hypothesis; I did not recompute
  `‖Δ‖_r`, so the numerical instance rests on the extraction.

### E5, confirmed as a gap and not strengthened

In the proof of Theorem 5.7 (pp. 145–146) the argument passes from
`gr_{r′} D_r^λ ≃ gr_{r′} D_r / gr_{r′}(p²Δ + λ₀)` being a domain to `D_r^λ` being one.
That step needs the filtration induced on the quotient to be separated, i.e.
`D_r ∩ D_{r′}(p²Δ + λ₀) = D_r(p²Δ + λ₀)`, and no such argument is made. I verified that
the printed proof contains none. I did **not** establish whether the separatedness in fact
holds, so the extraction's classification as a gap rather than an error is the right one,
and I have not upgraded it.

## Items, statuses and routes

- **36 library citations, all read at the pinned commits** (Mathlib 082e2d3, Tau Ceti
  f790474). All resolve and all say what the citing item claims. The two that make numeric
  claims both check out: `TauCeti.sl2Casimir`
  (`TauCeti/Algebra/Lie/Sl2/Casimir.lean:84`) is defined as
  `toEnd e ∘ toEnd f + toEnd f ∘ toEnd e + (2:K)⁻¹ • (toEnd h ∘ toEnd h)`, matching the
  item's "ef+fe+(1/2)h^2"; and `TauCeti.sl2Casimir_apply_of_hasPrimitiveVectorWith`
  (`:224`) concludes `((n:K) * (n + 2) / 2) • m`, matching the item's "n(n+2)/2".
- **11 planned items**, naming 8 distinct atlas layers across
  `ArithmeticLocallySymmetricSpaces`, `PadicMeasuresIwasawaAlgebras`,
  `CompletedCohomologyPartII`, `LocallyAnalyticDistributions` and the Tau Ceti
  `LieHighestWeight` roadmap. All exist and all have titles that fit the item.
- **114 missing items**, distributed over the three Part IIs.
- **6 routes**: three Part IIs and three source additions. Each Part II title extends its
  base roadmap's title exactly, each base stops short of what Fu needs, and none of the
  three new roadmap names (`PadicEnvelopingAlgebras`,
  `NoncommutativeAnalyticDistributions`, `WeightAspectAutomorphicMultiplicity`) is already
  taken. Each source route's stages exist. Per-route reasons are in
  `PAPER-FU-24.review.json`.

Nothing here is formalised; no Lean was written or compiled for this job.

## Checks run

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FU-24.result.json` — ok
- `python3 research/blueprint/intake.py check-files …` — ok
