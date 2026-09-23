# Review of PAPER-CLAUSEN-MATHEW-MORROW-21

**Job** REV-PAPER-CLAUSEN-MATHEW-MORROW-21 (issue #1419) · **Date** 2026-09-23 · Claude Code,
session `cc-7b31c4` · **Verdict: accept**, with one correction in place. All nine routes accepted;
all seven `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Dustin Clausen, Akhil Mathew and Matthew Morrow, *K-theory and topological cyclic homology of
henselian pairs*, [J. Amer. Math. Soc. **34** (2021), 411–473](https://doi.org/10.1090/jams/961);
read in arXiv [1803.10897](https://arxiv.org/abs/1803.10897) v2. Both recorded hashes reproduce: the
PDF as `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c` and the e-print tarball as
`22f7d57f0cccbcdc8dec3152ffa5be862370ea8e8619e1ac4290401e6491b4f1`, whose `rigidity_final.tex` is
4016 lines, as the extraction records. Every quotation below is therefore checked against the
authors' own source, not against an extraction of the PDF.

## Structure

122 items: 103 missing, 18 planned, 1 library. Every missing item is routed exactly once, no route
takes a planned or library item, and `scripts/check_paper.py` passes. All six source stage ids exist
(`SchemeAndStackFoundations:SF.0`, `DeformationAndDerivedPatchingAlgebra:R03.3`,
`DerivedDeRhamCohomology:DD.0`, `CrystallineCohomology:CR.4`, `RefinedTraceMethods:RT.2` and
`RT.3`), and so do all 18 planned layer ids.

**Coverage.** 159 numbered environments appear in the text and every one of them is in an item. The
four my checker flagged are false alarms: Definition 2.2 is inside item 013 ("Definitions 2.1–2.3"),
Example 2.17 inside item 027 ("Examples 2.16–2.18"), Theorem 5.21 is item 096, and the "Remark 4.38"
on p.5 is a cross-reference in the introduction, not a declaration.

**Locators.** 170 name-and-page checks land on exactly the page given. The few that did not are
proofs crossing a page boundary — Theorem 5.7 is stated on p.39 and proved on pp.40–41, Example 6.10
opens on p.53 — or my own parsing of "Definition 3.1, Examples 3.2–3.3" style lists.

**Library.** The single library item cites `HenselianRing`, `HenselianLocalRing` and
`IsAdicComplete.henselianRing`. The first two are at `Mathlib/RingTheory/Henselian.lean:94` and
`:108`; the third is at `:170` and is missing from the regex index because it is declared as
`instance (priority := 100)`, so I read it in the source. All three are as cited.

**Planned.** I sampled the targets, including the two that look surprising and are right: the Tau
Ceti `ModularCurves` layer 4D does own "strict henselisation and completion of strict
henselisations", and `ArithmeticLocallySymmetricSpaces:ALS.2` is the Borel–Serre compactification
from which finiteness of classifying spaces of congruence subgroups comes.

## Routes

The two Part II titles reproduce the parent's atlas title, "Hochschild, cyclotomic and refined trace
methods", exactly. More to the point, this extraction joins proposals other extractions already made
rather than opening parallel ones, which is what PROTOCOL §15 asks for and what I checked:

- `RefinedTraceMethodsPartIIHenselianPairs` is used with this title and area by
  `PAPER-BHATT-MORROW-SCHOLZE-19` (1 item) and `PAPER-CLAUSEN-MATHEW-21` (7 items); this paper is
  its natural owner and contributes 84.
- `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses` was proposed by
  `PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22`, whose brief already asks for the continuous invariants
  `F^cts(X) = lim_n F(X_n)` and the comparison maps that are p-adic equivalences — exactly §5.2's
  Theorems 5.19–5.22, which this route sends there.
- `ArcTopologyAndDescent` is used by `PAPER-BHATT-MATHEW-21` (122 items), `PAPER-BHATT-SCHOLZE-17`,
  `PAPER-CESNAVICIUS-SCHOLZE-24` and `PAPER-GUO-REINECKE-24`; this route adds a single item, Gabber's
  affine analogue of proper base change, and its 79-word brief is short for that reason.

The six source routes each land where the layer description says the material lives: SF.0 for the
Stacks-project theory of henselian pairs and Néron–Popescu, R03.3 for excellence and F-finiteness,
DD.0 for the cotangent complex and p-bases, CR.4 for Illusie's logarithmic Hodge–Witt sequence and
Shiho's extension, RT.2 for Hesselholt's HKR theorem for TR, and RT.3 for the excision theorem it
already lists as an input.

## Correction: an area that is not a galaxy id

Route 2 carried `"area": "motivic"`. That is the **group** of the parent roadmap in the atlas, not a
galaxy id — `data/galaxies.json` has `motives`, `ktheory`, `homological` and so on, but no
`motivic`. The value is now `ktheory`, matching route 1's Part II of the same parent and the content
of the roadmap (K-theory and TC of p-adic formal schemes).

This is worth the maintainer's attention beyond this file. Across
`research/blueprint/papers/*.result.json`, **33 of 502 route areas are not galaxy ids**: `modular`
(15), `cohomology` (7), `motivic` (4), `algebra` (4), and one each of `classical`, `diophantine` and
`numbertheory` — all of them atlas group names or free text. `scripts/check_paper.py` only checks
that `area` is non-empty, which is why they pass. In particular
`PAPER-ANTIEAU-MATHEW-MORROW-ETAL-22` proposes this same roadmap id with the same invalid area and
needs the same fix in its own review; it is not this job's file and I did not touch it.

## The seven findings

All are misprints affecting nothing, and all are confirmed from the TeX source.

- **E1.** Line 397: `Geisser--Levine \cite{GH} and Geisser--Hesselholt \cite{GH}` — the same key
  twice. §1.1 (line 275) and Theorem 1.5 cite `\cite{GL}` correctly, and in the `.bbl` the entries
  are numbered GH = [30], GL = [34], exactly as the correction says.
- **E2.** Condition (Law) asks for `U` admitting "a left adjoint `F : Sets → C`"; four lines later
  the free-object functor is called "its right adjoint `F`". The free functor is the left adjoint.
- **E3.** The proof of Theorem 5.7 prints `b_1^{(j)}, …, c_{w_j}^{(j)} ∈ k_i` (should be `k_j`),
  `dlog(1+t^j b) ∧ dlog(1+t^j c) ≡ t^{2j} da ∧ db` (should be `db ∧ dc`; `a` does not occur) and
  `τ_{2s−2} ≡ Σ_i b_i^{(s)} ∧ c_i^{(s)}` (should be `τ_{2s}` and `db ∧ dc`, since the block `j`
  contributes at `t^{2j}`). The knock-on the finding records is right: Bloch–Esnault–Kerz bound
  `w(τ_j) ≤ N·C(j+2, j)`, which at the corrected index reads `N·C(2j+2, 2j)` rather than the printed
  `N·C(2j, 2j−2)`, and the ratio `(2j+2)(2j+1)/(2j(2j−1))` is at most 6 for `j ≥ 1`, so a sequence
  `w_j` defeating one bound defeats the other and the proof stands.
- **E4.** In the proof of Lemma 5.30 the two diagram arrows and the display of relative terms are
  labelled `{R^{r−s}}_s`, while the statement of the lemma and Illusie's sequence recalled just
  before it are labelled `{R^{s−r}}_s`. Restriction lowers the level by one, so `W_s → W_r` for
  `s ≥ r` is `R^{s−r}`.
- **E5.** This one is not a harmless restatement, and reading the surrounding paragraph settles it.
  The sentence before sets the *goal* — find a Zariski neighbourhood `U` of `x_0` with
  `x_0^*α = x^*α` for all sections `x` of `U` — so the printed "we can assume `x^*α = 0`" assumes
  what is to be proved. Subtracting `q^*x_0^*α` gives exactly `x_0^*α = 0`, which is what the next
  step uses when it applies rigidity at the henselization of `X` at `x_0`.
- **E6.** `K(\mathcal{O}_C; \mathbb{Z}_p) \simeq K(C; \mathbb{C}_p)`, where the same sentence
  continues that this is p-adic connective topological K-theory by Suslin — a statement about
  `K(C; Z_p)`.
- **E7.** Line 3887: `π_{n+1}(𝒯𝒞/p^r)` is described as the sheafification of the presheaf `π_n`; the
  summand comes from the `E_2^{1,−(n+1)}` term of the étale descent spectral sequence, so it is the
  sheafification of `π_{n+1}`, as Theorem 4.29 and the proof of Theorem 6.11 confirm.

## What this review did not do

I did not read all 4016 lines of the source: I read it around each finding, the statements of the
results the routes cite, and the definitions those depend on. I add no finding of my own. The
published JAMS text was not compared — the AMS PDF returns 403, as the extraction records — and
Crossref registers no correction for `10.1090/jams/961`, so every verdict here is about arXiv v2.
