# Review of PAPER-DASGUPTA-KAKDE-23

**Job** REV-PAPER-DASGUPTA-KAKDE-23 (issue #1090) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All five routes accepted; the empty `sourceIssues` list supported
by an independent audit; one defect found and reported (the locators' source-line numbers drift);
nothing rejected or deleted.

Paper: Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*,
[Ann. of Math. **197** (2023), 289–388](https://doi.org/10.4007/annals.2023.197.1.5); read in
arXiv [2010.00657](https://arxiv.org/abs/2010.00657) v3, the authors' final version.

Reviewed: `research/blueprint/papers/PAPER-DASGUPTA-KAKDE-23.result.json` and its report. At 332
items it is the largest extraction in this batch.

## What I read

Both files the extraction hashes, reproduced exactly: the LaTeX e-print,
`4a73268176e1db3f4071b80368bbdec5440716f4f9ce5cee10157fbadc72ff25`, and the PDF,
`c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`. Having the **same source file**
made three checks possible that are usually out of reach.

## 1. Statuses and routing

**All 57 distinct planned layer ids exist** in `data/atlas.json`, and the five source routes land
where the mathematics is owned. The first is the decisive one: `IntegralIwasawaTheory` I.6 and I.7
are *"Integral Brumer–Stark prerequisites"* and *"The integral Brumer–Stark theorem"* — the atlas
named those layers for this theorem and names this paper as their source, so a source route into
existing layers is right and a new roadmap would have been wrong. The other four are equally apt:
Hilbert Eisenstein series and the integral q-expansion principle to `AutomorphicPadicLFunctions` L3;
Fitting ideals, projective presentations and exterior biduals over a Gorenstein order to
`PadicMeasuresIwasawaAlgebras` L6; the Rubin–Stark material to `EulerSystemsAndKolyvaginSystems`
ES.6/ES.7, whose own text already records that a conjectural Rubin–Stark element stays conditional;
and the Hilbert modular Galois representations to `AutomorphicGaloisRepresentations` R19.2.

**Routing arithmetic.** All 60 missing items are routed exactly once. Thirty *planned* items are
named by two routes each — permitted, since section 16 lets a source route name planned items the
paper is a good source for, and a paper can be a good source for the same item in two layers.

## 2. The twelve library items

Twenty of their twenty-two citations match `declarations.tsv` exactly. **The two that do not are
index artefacts, not errors**, and both are in Mathlib at the pinned commit:

- `HenselianRing.is_henselian` is a **class field** (`Mathlib/RingTheory/Henselian.lean:96`), and
  the indexer only records declarations, not structure fields;
- `IsAdicComplete.henselianRing` is an **instance written with a priority**
  (`Henselian.lean:170`), and the indexer's declaration regex cannot capture a name after
  `instance (priority := 100)`.

I read both. This is the same pair of artefacts I recorded today in REV-AUDIT-34 and REV-AUDIT-37 —
a mechanical check against the index is not a verdict.

The declarations behind the less obvious claims say what is claimed:
`TauCeti.subgroupCharSum χ H = ∑_{h∈H} χ(h)·h` (the norm element is the trivial-character case),
`TauCeti.AuslanderReitenTranspose` is the cokernel of `Hom_A(P₀,A) → Hom_A(P₁,A)` (Jannsen's
transpose), and `Rep.indCoindIso` is `Ind ≅ Coind` for a finite-index subgroup (Weibel 6.3.4).

## 3. The empty `sourceIssues` list

For a 100-page paper, recording *no* mistake is a claim, so I tested it the way the source allows.
**A mechanical audit of the LaTeX is clean**: 283 `\label`s with none duplicated, 257
cross-references with none undefined, no cross-reference whose word disagrees with the environment
it points at, and no leftover editing markers — the two apparent marker hits are
`\DeclareMathOperator{\red}{red}` and the bibliography's `\begin{thebibliography}{XXX}`.

That is evidence for the empty list, not proof. It is not a line-by-line re-reading of the paper,
and it would not catch a mathematical slip that compiles cleanly.

## 4. The one defect: the locators' source-line numbers drift

The locators are unusually rich — each names a section, a statement, a LaTeX label and one or more
source line numbers, for example "§2.3, Lemma 2.6, label `l:fittmult`, first assertion (the source
lines 715–721)".

**Every one of the 230 labels resolves** in the file the extraction hashes, so no item is
misattributed and the section and statement names are exact. **The line numbers do not.** They run
ahead of the true lines by an amount that grows through the file:

| label | true line | cited | drift |
| --- | --- | --- | --- |
| `c:rubin` | 405 | 421 | +16 |
| `t:main` | 511 | 539 | +28 |
| `l:cnf` | 559 | 591 | +32 |
| `l:fittmult` | 675 | 715 | +40 |
| `l:abab` | 685 | 726 | +41 |

and by line 3440 the drift is about 7.5%. A constant offset would suggest a different file; a drift
proportional to position is what reading a **soft-wrapped** copy of the same file produces.

I did not rewrite the locators. Each already carries its label, which is exact and is the right
handle for a reader or a design job; rewriting 222 locators mechanically would have fixed only the
first line number in each and left mixed conventions behind. The measurement is recorded here and in
the review JSON instead.

## What this review did not do

- The published Annals text is paywalled and was not compared; the extraction says so and reads the
  authors' final version, which is the same text.
- The sixteen prerequisites were read only as this paper cites them.
- No Lean file was written or compiled; the library claims checked are the twenty-two citations
  above, at the pinned commits.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DASGUPTA-KAKDE-23.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
