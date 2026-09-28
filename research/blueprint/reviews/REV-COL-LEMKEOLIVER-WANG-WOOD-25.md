Verdict: accepted

# Review of COL-LEMKEOLIVER-WANG-WOOD-25

Reviewer: Claude Code — cc-39fac3. This agent did not do the collation, which was by cc-e94dc5 in #2925.

Record reviewed: `research/blueprint/collation/COL-LEMKEOLIVER-WANG-WOOD-25.result.json`, as it is on `main`. The findings are in `research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json`.

## What I opened

I fetched the copy named in `sourceVersions` myself from Cambridge Core, using the same URL:
`https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf`
The DOI `10.1017/S2050508625000009` resolves to the same article.

**Is it the version of record? Yes.**
- It is the typeset article, not an accepted manuscript and not a preprint with a cover sheet.
- Every page carries the running header "Forum of Mathematics, Pi (2025), Vol. 13:e19".
- The first page gives the DOI 10.1017/S2050508625000009. It also gives "Received: 24 May 2023; Revised: 7 March 2025; Accepted: 7 March 2025", and the CC BY 4.0 licence line.
- The article runs to 43 pages, numbered 1–43. The printed page equals the PDF page, so the locators "p. 14", "p. 16", "p. 18" and "p. 39" can be read directly.
- This matches the `citation` and `note` in `sourceVersions`.

**The hash cannot be reproduced byte for byte, as expected.**
- My download has sha256 `bd40efbaeb513141e45d497112f5a5dd918be96cc2d0158ac2f37ff0783ffff9`. The recorded value is `792fd446784bff5cdbbf426fd702200af538de739fa24538275fa267c56917c7`.
- The difference is expected. Cambridge Core stamps each page of the PDF with a per-download footer: "Downloaded from https://www.cambridge.org/core. … on 28 Sep 2026 at 16:40:02, subject to the Cambridge Core terms of use …". That footer includes the time of the download, so no two downloads share a hash.
- The article text itself is the same. So the recorded hash correctly identifies the collator's file, but a reader who fetches the PDF again will get a different hash.
- A `note` saying this would help later readers, but it is not a defect in the record.

I read each locator on a rendered page image, not only on the extracted text layer, because the formulas in this paper extract poorly.

## Verdict per finding

All three findings were marked `identical`. None was re-scoped to the preprint.

### PAPER-LEMKEOLIVER-WANG-WOOD-25/E9 — identical: holds

- **Where I read it:** printed p. 14, Lemma 3.11.
- **What the page prints:** "For any −1/2 ≤ σ ≤ 3/2 and any t ∈ ℝ, the Shintani zeta function satisfies ξ_{F,α}(σ + it) = O_{[F:ℚ],ε}(h₂(F)Disc(F)^{7/2−2σ+ε}(1 + |t|)^{2[F:ℚ](3/2−σ)+ε})."
- **How it compares:**
  - The range of σ, the quantifier over all real t, the implied-constant subscripts and both exponents agree, symbol for symbol, with the finding's `printed` field and the collation's `evidence`.
  - The published lemma has no restriction away from the poles. So the defect the finding reports is in the published text, as the verdict says.

### PAPER-LEMKEOLIVER-WANG-WOOD-25/E10 — identical: holds

- **Where I read it:** printed p. 16, statement and proof of Lemma 3.13; printed p. 18.
- **What p. 16 prints:**
  - The definition "A := R ⊗_ℚ F".
  - The display Σ_{R∈ℛ(K)} |Aut_F(A)|^{−1}/Disc(R/O_F)^s = h₃(K/F)/(2Disc(K/F)^s) ζ_F(2s) ζ_F(6s − 1) Σ_{𝔞 ⊆ O_K squarefree, [𝔞] ∈ 3Cl_K + Cl_F} 1/Nm(𝔞)^{2s}.
- **What p. 18 prints:** "A = R ⊗_ℚ F", followed by "|Aut_{O_F}(R)| ≤ |Aut_F(A)|", in the step that applies the lemma.
- **How it compares:**
  - The finding's `printed` field ends in "Σ …". That ellipsis elides only the final sum over squarefree ideals.
  - Everything the finding does quote matches the page, including the weight |Aut_F(A)|^{−1}, the normalising factor h₃(K/F)/(2Disc(K/F)^s) and the two zeta factors ζ_F(2s)ζ_F(6s − 1).
  - Eliding the sum is marked by the ellipsis and is not a paraphrase. The locator "Lemma 3.13, p.16, and its use on p.18" is accurate.

### PAPER-LEMKEOLIVER-WANG-WOOD-25/E15 — identical: holds

- **Where I read it:** printed p. 39, §7.2 ("Cohen–Lenstra–Martinet prediction for the average of h₃(K/k)").
- **What the page prints:** "Thus the predicted average of h₃(K/k) is (1 + ∏_v |V^{σ_v}|^{−1}) ∏_i (1 + ∏_v |V_i^{σ_v}|^{−1} + ⋯ + ∏_v |V_i^{σ_v}|^{−a_i})".
- **How it compares:**
  - This matches the finding's `printed` field, including the running exponent up to −a_i in each factor.
  - The defect the finding reports, which appears whenever some a_i ≥ 2, is in the published text.

## Record shape (PROTOCOL §18)

- `sourceVersions` has one entry, of kind `published`. It gives the URL actually used, a full citation with volume, article number and pages, the date it was read, a sha256 and a note that says what the file is. That accurately records what was read.
- Each finding has an `outcome`, a `verdict` that names the text it is against, and `evidence` quoting the printed sentence with its page.

## Checks run

- `python3 scripts/collation.py` (report mode, without `--write`):
  - It exits 0 and reports "206 paper records: 110 preprint, 96 published".
  - PAPER-LEMKEOLIVER-WANG-WOOD-25 is no longer among the papers exposed with quoted statements read only from a preprint.
- `python3 -m unittest tests.test_collation`: 17 tests, OK.
