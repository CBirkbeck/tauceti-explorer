# Review of PAPER-NELSON-VENKATESH-21

**Job** REV-PAPER-NELSON-VENKATESH-21 (issue #2191) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** Both routes accepted; the findings checked and sustained; one
library citation corrected in place; nothing rejected and no item deleted.

Paper: Paul D. Nelson and Akshay Venkatesh, *The orbit method and analysis of automorphic forms*,
[Acta Math. **226** (2021), 1–209](https://doi.org/10.4310/ACTA.2021.v226.n1.a1); arXiv
[1805.07750](https://arxiv.org/abs/1805.07750).

Reviewed: `research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json` and its report. The
machine-readable verdict is `PAPER-NELSON-VENKATESH-21.review.json` beside the extraction. The
extraction completes a partial checkpoint of `cc-d67081` (#2214) and keeps its route ids.

## What I read

Both documents the extraction names, and both hashes came back the same: the published Acta PDF,
209 pages, sha256 `85e14654d2b367f4b0d4a21c9555576f6def6649c8b6707afc78e1dfbdaea76e`, and arXiv v3,
sha256 `9bce49cb7d3f6f2f6994c7af0ecbf3f12c3e4f79599091543d331824f522c03e`.

The publisher's PDF carries the standard permission flags and opens without a password, so it was
read the way a PDF reader reads it; the extraction's own note that six pages were checked on page
images suggests it worked around the same thing. With the text in hand every locator could be
checked mechanically, which is the main thing this review adds.

## Locators

**All 88 name-and-page checks pass.** 82 land on exactly the page the locator gives. The other six
are locators that point at a proof, or at the passage following a statement, and each is right when
read:

| finding/item | locator | statement | where the cited text is |
| --- | --- | --- | --- |
| item 89 | Theorem 27.7 (proof), p. 184 | p. 183 | proof runs 184–185 |
| E1 | Proof of Lemma 27.3, p. 182 | p. 181 | proof on 182 |
| E4 | Proof of Lemma 7.6, display (7.4), p. 49 | p. 48 | proof on 49 |
| E6 | Proof of Lemma 19.5, (19.20)–(19.21), p. 130 | p. 129 | proof on 130 |
| E9 | §4.4, after Definition 4.3, p. 34 | p. 33 | the display on 34 |
| E13 | Proof of Lemma 10.4, (10.12), (10.14), p. 82 | p. 81 | proof on 82 |

## Items and statuses

**The four planned items** name layers that exist in `data/atlas.json`
(`tauceti:…/LieHighestWeight#layer-7`, `AutomorphicFormsOnReductiveGroups:AF.1`,
`SmoothRepresentationsOfLocalGroups:SR.1`/`SR.3`, `AdelicAlgebraicGroups:AA.4`,
`GeometryOfNumbersAndQuadraticArithmetic:GN.4`), and the extraction flags the one that is a
judgement call — routing Ratner's measure classification to GN.4, "specification-state", with the
remark that a reviewer may prefer to route it separately. I agree it is the best available home and
that the remark should stay.

**The three library items.** Seven of the eight cited declarations exist at the pinned commit and
say what is claimed: `SchwartzMap` and `SchwartzMap.fourierTransformCLM`; the Stone–Weierstrass,
Urysohn and Tietze declarations; `BoundedContinuousFunction.arzela_ascoli₁` and
`MeasureTheory.Measure.rnDeriv`.

**The eighth is the one correction.** `mathlib:SchwartzMap.fourierTransformCLE` **does not exist at
`082e2d3`**. The name occurs exactly once in the whole tree, in the module docstring of
`Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean`, which says the Fourier transform "is
also given as a continuous linear equiv, in `fourierTransformCLE`" — a promise the file does not
keep. What the item actually needs, Fourier inversion, *is* there under other names: the instance
`SchwartzMap.instFourierTransform` (`Fourier.lean:86`) carries `fourierInv` with
`fourierInv_fourier_eq` and `fourier_fourierInv_eq` proved for Schwartz maps, and
`Continuous.fourierInv_fourier_eq` and `MeasureTheory.Integrable.fourierInv_fourier_eq` are the
general statements in `Analysis/Fourier/Inversion.lean`. The item therefore stays `library`, with
the two correct declarations cited in place of the absent one and the note recording why. The
report `.md` carries the same change.

## Routes

Both routes propose **new** roadmaps, so the question is whether anything in the atlas already goes
in their direction. I searched every layer title and description in `data/atlas.json` for "orbit
method", "Kirillov", "microlocal", "coadjoint", "Gan–Gross–Prasad", "Ichino", "Bessel model",
"Plancherel" and "relative character": **not one hit**. Neither proposed roadmap id exists yet, and
both areas — `representations` and `automorphic` — are galaxy ids.

**Route 1** (`QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups`, 74 items). The reason's
argument against a Part II of the Tau Ceti representation-theory family quotes that family's README
accurately: "no representations of noncompact groups, no Plancherel theory, no tempered spectrum …
their unitary duals are not [in scope]". A Part II must start where its base stops and continue in
the same direction; a theory of unitary duals of noncompact reductive groups is not that direction,
so a new roadmap is right. The 515-word brief names the final theorems in the published numbering
and sets the order to cover them, and it says which parts are the reusable core — useful, because
the design job may well be split.

**Route 2** (`GanGrossPrasadConjecturesForClassicalGroups`, 18 items). This coalesces with a roadmap
six other extractions already propose. I checked all of them: `PAPER-JIANG-ZHANG-20`,
`PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21`, `PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22`,
`PAPER-BEUZARTPLESSIS-CHAUDOUARD-25`, `PAPER-LIU-ETAL-22` and this one use **the same id, the same
title and the same area**, so the design job will get one proposal rather than six competing ones —
which is the point of coalescing. The brief adds only what this paper contributes and marks the
Ichino–Ikeda/N. Harris conjecture as a conjecture, which matters because Theorem 31.11's L-value
form is conditional on it.

## The recorded mistakes

Fifteen findings, one reaching a stated result. I checked that one in full and six others verbatim.

- **E1 (gap, a stated result).** Confirmed, and it matters. Page 182 argues, for `G = SO_n`, that
  the assertion "follows from the surjectivity of the spinor norm on SO_{n−1} (for n − 1 ⩾ 2)", and
  §25.7(2) does allow the pair `(SO_{n+1}, SO_n)` with `n ⩾ 2` — so `(SO_3, SO_2)` is in scope.
  For an anisotropic binary form, which is what an anisotropic `G` forces, the spinor norm of
  `SO_2(F_v)` is `N(K_v^×)F_v^{×2}`, of index two, not everything; the surjectivity of
  `H(A) → G(A)/G(A)^+` that Lemma 27.3's reduction needs then fails, and Lemma 27.3 is exactly the
  reduction the paper states for Theorem 27.1 ("Assume that … Then, the conclusion of Theorem 27.1
  holds"). The finding's partial repair — for `Π ≇ Π ⊗ (η_{K/F}∘θ)` the character integral vanishes
  and the argument survives — is offered as partial, and says plainly that the dihedral case gives
  nothing. That is the right way to record it.
- **E2, E4, E8, E9, E11, E14** are printed exactly as quoted. E9 is the nicest of them: the display
  defining `h^η S^m_δ` on p. 34 has `⟨ξ⟩^{m−α}` where display (4.8), eleven lines above, correctly
  has `⟨ξ⟩^{m−|α|}`.
- The remaining findings (E3, E5–E7, E10, E12, E13, E15) are misprints of the same kind, each with a
  locator that passed the page check above.

## What this review did not do

- I did not re-derive the paper's analysis. E1 was verified from the printed argument, §25.7(2) and
  the standard image of the spinor norm on an anisotropic plane; the other findings from the printed
  text.
- The 23 prerequisite papers were read only as this paper cites them.
- No Lean file was written or compiled; the only library claims checked are the eight citations
  above, at the pinned commits.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-NELSON-VENKATESH-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
