# Independent review: Dasgupta–Kakde errata

Job: REV-ERRATA-PAPER-DASGUPTA-KAKDE-23. Reviewer: Codex, session `codex-c83e7a`, 23 September 2026.

**Verdict: accept.** E1 is confirmed in the two preprints named by the finding. The proposed deletion, classification as a misprint, and `affects: nothing` are correct. Persistence in the published journal version is unverified and is explicitly outside this verdict.

## Independence and scope

The original extraction and errata were authored by Claude Code, session `cc-fb70e5`; the errata arrived through [PR 1759](https://github.com/CBirkbeck/tauceti-explorer/pull/1759), commit `754fbaa190a0e036fd4aee631c560c515fd50e27`. This reviewer wrote neither. The review inputs were acquired at repository commit `aff62a667b2c094d22cee21b55ac3c9f385006b5`.

I read the complete errata JSON and report, the extraction’s item 221, arXiv v3 pp.49–55, the February copy pp.53–54, the May copy pp.52–53, and the corresponding arXiv TeX. I also read the TeX definitions of cusps above zero and infinity in §7.2. The formula on each of the three proposition pages was checked visually, not inferred from OCR. This is a review of the recorded finding and its local dependencies, not a fresh audit of all 99 pages or of the external theorem underlying Proposition 8.4.

## E1: correction derived independently

Fix an odd weight (k>1), with the notation of §8.1 and a cusp in (C_0(mathfrak c,mathfrak n)). Let (C) denote the common scalar prefactor in Proposition 8.4, ending with the product over primes dividing (mathfrak P). Definition 8.2 weights the summand indexed by (mathfrak mmidmathfrak t) by (mu(mathfrak m)psi(mathfrak m)(Nmathfrak m)^k).

The auxiliary ideal (mathfrak t) is squarefree and coprime to the conductor. For each prime dividing it, the cusp definitions give the disjoint alternatives (C_0(mathfrak l,mathfrak n)) and (C_infty(mathfrak l,mathfrak n)). Thus (J_{mathfrak m}) and (J_{mathfrak m}^c) partition its prime factors, and the character values here are nonzero. Multiplying the weight by the two prime products from Proposition 8.4 cancels the norm factors on (J_{mathfrak m}) and the character factors on its complement. The result is

[
Csum_{mathfrak mmidmathfrak t}mu(mathfrak m)
prod_{mathfrak lin J_{mathfrak m}}psi(mathfrak l)
prod_{mathfrak lin J_{mathfrak m}^c}(Nmathfrak l)^k.
]

Set (x_{mathfrak l}=psi(mathfrak l)) on (J_{mathfrak t}) and (x_{mathfrak l}=(Nmathfrak l)^k) on its complement. Divisors of the squarefree ideal correspond to subsets of its prime factors. Expanding (prod_{mathfrak lmidmathfrak t}(1-x_{mathfrak l})) gives exactly that sum, including the empty divisor with coefficient 1. There is no additional ideal or norm factor. Outside (C_0(mathfrak c,mathfrak n)), every summand vanishes by Proposition 8.4. Remark 8.5’s convention at a zero lower-left matrix entry remains unchanged.

This establishes the reported correction from the definition and preceding proposition. The proof printed on the next page computes this same expression. The source at TeX label `p:nop` nevertheless starts the statement’s display with a literal `\ft`, matching the visible stray factor. Delete it; replacing it by its norm would also be wrong.

For reach, Proposition 8.11, equation (101), compares the weight-one and higher-weight constants using the scalar ratio with conductor power and Euler-factor ratios. It contains no extra auxiliary-ideal factor. Therefore the actual downstream calculation already uses the intended value. This supports `misprint` and `affects: nothing` in PROTOCOL §18’s sense; it does not certify every proof in the article.

## Version and correction search

The [arXiv v3 PDF](https://arxiv.org/pdf/2010.00657v3) and [Kakde author PDF](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf), each dated 14 May 2022 internally, show the slip on p.52. The [Dasgupta author PDF](https://sites.math.duke.edu/~dasgupta/papers/Brumer-Stark.pdf), dated 15 February 2022, has no such factor on p.53. Its auxiliary ideal is named (mathfrak l) and its prime index (mathfrak q). This earlier correct version supports the intended expression but is not a later correction.

On 23 September 2026, the [Annals article page](https://annals.math.princeton.edu/2023/197-1/p05) linked no erratum; [arXiv history](https://arxiv.org/abs/2010.00657) listed v3 as latest; neither [Dasgupta’s page](https://sites.math.duke.edu/~dasgupta/) nor [Kakde’s research page](https://math.iisc.ac.in/~maheshkakde/research.html) listed a correction. Title/Proposition 8.6/DOI searches with erratum, correction and corrigendum found none. `known: new` records this bounded negative search, not discovery priority.

The Annals full-text link was inaccessible here, and the attempted Project Euclid PDF returned an HTML access challenge. Consequently **the published journal formula was not checked**. The locator and verdict now make that limitation explicit; they must not be cited as evidence that the published article contains this typo.

Fresh source downloads on 23 September 2026, all three PDFs 99 pages:

- arXiv v3: SHA-256 `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.
- Dasgupta, 15 February 2022: SHA-256 `c5b1df5da32ea7a30ed49b9ddc71249adb37e318971b0d304584c98d6ef69dcf`.
- Kakde, 14 May 2022: SHA-256 `92415f59d3cc8899bf36bdbdf23d0bbcb4f0f39e7c183280b3883b4d7e8028ed`.

- [arXiv TeX source](https://arxiv.org/src/2010.00657v3): gzip SHA-256 `4a73268176e1db3f4071b80368bbdec5440716f4f9ce5cee10157fbadc72ff25`; decompressed single TeX file SHA-256 `77fbe895e540b14c83d7ca708f9a0032a28da08588d13abf791523ed91d7050c`.

## Changes, checks and handoff

Added the independent `confirmed` verdict to E1. Retained its correction and reach, clarified the source versions and older notation, corrected the report’s 100-page description to the retrieved PDFs’ 99 pages, and bounded the downstream and journal claims. No additional mistake was established in the inspected passages. The paper extraction was not edited.

Validation:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-DASGUPTA-KAKDE-23.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-DASGUPTA-KAKDE-23.md research/blueprint/errata/PAPER-DASGUPTA-KAKDE-23.json research/blueprint/errata/PAPER-DASGUPTA-KAKDE-23.md`

No Lean file is involved; no Lean compilation or formalization is claimed. The review of the version-scoped finding is complete. A future reader with access to the published article can determine whether the typo survived typesetting; that unanswered comparison is preserved rather than presumed.
