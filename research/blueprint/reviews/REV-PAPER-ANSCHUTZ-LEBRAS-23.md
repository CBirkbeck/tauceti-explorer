# REV-PAPER-ANSCHUTZ-LEBRAS-23 — review of the extraction of Anschütz–Le Bras, *Prismatic Dieudonné theory*

**Verdict: accept. All seven routes accepted, no substantive coverage gap, all five recorded mistakes confirmed, nothing corrected in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-7b31c4`, issue #1367 — 155 items (0 library, 36 planned, 119 missing), 7 routes, 5 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **11** (2023), e2, [doi:10.1017/fmp.2022.22](https://doi.org/10.1017/fmp.2022.22), with an **erratum** in Pi **13** (2025), e3; read in [arXiv:1907.10525v4](https://arxiv.org/abs/1907.10525v4)'s TeX source.

## Provenance, and the erratum read

The recorded e-print hash matches byte for byte: `d1765c3c…843906`, a single `prismatic_dieudonne_111022.tex` of **6397 lines**, exactly as recorded. Reading the source rather than the PDF is why the locators are statement numbers and not pages — the right trade for a paper whose two versions number differently.

**The erratum was fetched and read, not merely cited.** Pi 13 (2025) e3 (doi:10.1017/fmp.2024.30) says: "There is a mistake in the proof of Proposition 5.23 of the published version. The content of this proposition was already known to be true by a different proof… Also, the arguments of this fallacious proof are not used anywhere else in the paper, so this mistake does not affect any of the results stated in the paper." It identifies exactly the step **E5** quotes — topological nilpotence of the divided Frobenius on `ker(A_crys(R) → W(R))` — calls it "not true", and gives **Andrew Senger's** counterexample (`R = F_p[x^{1/p^∞}]/x` and the element `Σ_k p[x]^{1/p^k}/p^k`, fixed by the divided Frobenius). E5 records the erratum in its `known` field, which is what PROTOCOL §18 asks for.

## 1. Numbering

The preprint declares `\newtheorem{theorem}{Theorem}[subsection]` with nine environments sharing the counter, so numbers run `section.subsection.n`; the published version uses one counter per section. Simulating the preprint numbering gives **190 numbered statements** and reproduces the **number and the kind** of every statement the findings cite, and of every statement their reasons cite in passing: Theorem 4.9.5, Definition 5.2.4, Example 6.0.4, Definitions 1.3.1/1.3.5, Proposition 5.3.5, Definition 4.2.8, Definition 4.1.24, Proposition 4.1.26 and Lemma 4.9.3. All 155 items carry a preprint number; 150 also carry the published one.

## 2. Coverage — 155 of 190 cited, and the residue is accounted for

- **19 are in the introduction**, where this paper states its definitions and main theorems before restating them in the body. The body versions are covered — including the two definitions **E4** is about, whose introductory copies are 1.3.1 and 1.3.5 and whose body forms 4.1.5 and 4.1.10 the extraction does cite.
- **14 are commentary remarks** ("remarks on the definition", "simplifications", "previous results on classification of finite flat group schemes"), and one is a Question.
- **One is Definition 5.2.4**, the verbatim repeat of Definition 4.1.24 that E2 concerns — so its content is covered through 4.1.24.

No substantive gap.

## 3. Internal references — and why one of my usual audits does not apply

The paper uses **cleveref**: 290 of its 311 references are `\Cref`, where the word is generated from the target's environment. The "cited as Theorem, printed as Proposition" class therefore **cannot arise** here — consistent with the extraction's list containing no such slip, and the reason E2's defect is a wrong `\Cref` *target* rather than a wrong word. I audited the 21 hand-written `\ref` uses too: each is preceded by a preposition or nothing, so there is no mismatch.

Two source blemishes with no visible effect, recorded rather than filed as findings:

- the label `sec:comp-case-mathc-definition-breuil-kisin-module` is **defined twice**, on Definitions 4.1.24 and 5.2.4 — LaTeX warns about it, but nothing references that label, so no number is misprinted;
- two labels **contain a space** (`…quasi-regular semiperfectoid`). That works, but it is fragile: my first pass read one of them as an undefined reference before I checked, because the `\Cref` argument is split across a line.

## 4. Statuses and routes

No `library` items, which is right for this subject. The 36 `planned` items and the routes cite **17 layers, all present** in `data/atlas.json` — including the three-component stage id `PerfectoidQuotients:Q0:integral-algebra`.

One Part II and six source routes, all accepted. `PrismaticCohomologyPartIIPrismaticDieudonneTheory` reproduces its parent's title verbatim and is a **joined** proposal with `PAPER-CESNAVICIUS-SCHOLZE-24` and `PAPER-FARB-KISIN-WOLFSON-24`; the parent's PR.0–PR.3 build the prismatic site and cohomology, not this classification. The source routes send the prismatic foundations, perfectoid inputs, classical integral p-adic Hodge theory, `A_inf` material and abelian schemes to the layers that already own them.

## 5. Mistakes in the paper — 5 of 5 confirmed

- **E1** — Theorem 4.9.5 names the target "the category of admissible prismatic Dieudonné **crystals**" for the functor `M_prism(−)`, whose target is the **modules**; the crystal-valued functor is the calligraphic one.
- **E2** — "Recall the following definition, which already appeared in `\Cref{…cais-lau-principal}` before": the `\Cref` points at the Cais–Lau **Proposition** 4.1.26, while the definition recalled is **Definition** 4.1.24. Because of cleveref the printed word follows the wrong target, so the fix is the label, not the word.
- **E3** — with the relations `p x_{i,j} = f x_{i,j+1}`, the displayed chain `p^i x_{i,0} = p^i f x_{i,1} = … = f^i x_{i,i}` raises the total degree by one; the middle term is `p^{i−1} f x_{i,1}`. The conclusion (unbounded `p^∞`-torsion) is unaffected.
- **E4** — "has its cokernel **is** killed by" in *both* introductory copies of the definition; the body forms read correctly.
- **E5** — the erratum's fallacious proof, above.

## 6. What this extraction does well

155 items for a 100-page paper, with the published **and** preprint number in every locator — necessary here, because the two versions number differently and no page numbers exist in the source it read. Its E5 does the thing a register most needs: it records a published erratum in the `known` field, quotes the step that fails, and then notes that the paper proves a *genuine* topological-nilpotence lemma elsewhere (label `…topological-nilpotent-on-the-kernel`, Lemma 4.9.3 / published 4.88), so a reader does not confuse the two.

## Tools

A shared-counter inventory simulator over the single source file, a cleveref-aware reference audit (`\Cref` versus hand-written `\ref`), duplicate-label and undefined-reference checks, and a pure-Python PDF text extractor for the erratum. Kept in the session scratchpad.
