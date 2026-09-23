# REV-PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 — review of the extraction of Beuzart-Plessis–Chaudouard–Zydor, *The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case*

**Verdict: accept. All seven routes accepted, no coverage gap, all ten recorded mistakes confirmed, one `reason` amended in place.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1446 — 115 items (2 library, 14 planned, 99 missing), 7 routes, 10 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Publ. math. IHÉS **135** (2022), 183–336, [doi:10.1007/s10240-021-00129-1](https://doi.org/10.1007/s10240-021-00129-1), read in the open-access published PDF on Centre Mersenne, with [arXiv:2007.05601v1](https://arxiv.org/abs/2007.05601) as a reading aid.

## Provenance — hash matches, and the preprint earns its keep

`a07a6143…f13794` matches byte for byte, and the PDF's page tree reports **107 pages**, as the extraction records. I also took the v2 e-print — a nine-file LaTeX project in Latin-1 with a custom `entete-hanoi.sty` — and used it throughout. That mattered: **two of the ten findings are revision artifacts**, where the preprint is right and the published text is not.

## 1. Numbering and coverage — complete

The numbering is four-level and comes from a macro layer, not from `\numberwithin`:

- the `paragr` environment does `\refstepcounter{subsubsection}`, so numbered paragraphs run 1.1.1, 1.1.2, …;
- `\newtheorem{theo}{…}[subsubsection]` and every statement environment (`theoreme`, `proposition`, `corollaire`, `lemme`, `remarque`) does `\refstepcounter{theo}`, so statements are numbered **1.1.5.1** and the like;
- `local.tex` and part of `finalJchi.tex` write `\bpar`/`\epar` for the same environment, and a simulation that misses those loses a whole level of numbering (my first pass did, and produced `9.1.0.1` where the paper prints 9.1.7.1).

Simulating all of it across the eight input files gives **93 numbered statements and 190 numbered paragraphs**, and reproduces the extraction's numbers exactly — Theorems 1.1.5.1, 1.1.5.3, 1.1.6.1, and the appendix's `A.0.x.y` form. The appendix has no subsections, so its statements really are printed **A.0.9.1**, **A.0.11.1**; I found both in the published PDF.

**Coverage is complete.** All 93 statements are covered, once the paper's own locator style is respected: the extraction cites paragraph ranges (`§§2.2.1–2.2.13`) as well as statement numbers, and a paragraph citation covers the statements inside it. A number-only audit falsely flags 32 statements; that is an artifact of the audit, not a gap.

## 2. Internal references — clean

I ran the audit that found two unrecorded mis-citations in the Groechenig–Wyss–Ziegler review earlier today: for every `<word>~\ref{label}` in the source, compare the word with the environment carrying the label. Here there are **197 such citations and no mismatch**, no duplicate labels, and no undefined references.

## 3. Statuses

Both `library` items were read in the Mathlib source at pinned `082e2d3`: `WithSeminorms.banach_steinhaus` and `PolynormableSpace.banach_steinhaus` with the class `BarrelledSpace` (`Analysis/LocallyConvex/Barrelled.lean:165, :193, :91`), and `PhragmenLindelof.vertical_strip` (`Analysis/Complex/PhragmenLindelof.lean:275`). The 14 `planned` items and the routes cite 14 layers; **all exist in `data/atlas.json`**.

## 4. Routes — three Part IIs, one new roadmap, three sources, all accepted

Every non-source route is a **joined** proposal: the roadmap id, parent and title are shared with at least one other extraction, and the introducing paper is identifiable each time — `PAPER-ZHANG-21` for the Jacquet–Rallis Part II, `PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21` for the Schwartz-multiplier Part II, `PAPER-JIANG-ZHANG-20` for the Gan–Gross–Prasad framework, and `PAPER-BEUZARTPLESSIS-CHAUDOUARD-25` alongside this paper for the Asai/periods Part II. All three parent titles are reproduced verbatim, as PROTOCOL §15 requires.

## 5. Mistakes in the paper — 10 of 10 confirmed

**Settled by the paper against itself:** (8.2.3.4) carries `η_{G′}` and (8.2.3.5), in the same sentence, `η_{[G′]}` (**E4**); §10.1.5 says "in the sense of Section 5.1.3" where §10.2.1 says "Section 4.3.2" (**E7**); Proposition 4.3.7.1's limit is over `[G′]` where the expansion its proof starts from, (4.3.6.2), is over `[G′]_0` (**E3**); Lemma 4.3.6.2 puts `λ ∈ ia^G_{P_1}` where the proposition above integrates over the dual space (**E9**).

**Settled by arithmetic:** `|S_Π| = 2^{−dim(a_P)}` cannot hold for a cardinality, and (10.3.2.1) itself carries `|S_Π|^{−1}` (**E5**). **By invariance:** only `(det h)^{−n}` gives a translation-invariant top form on `GL_n` — `⋀ dh_{i,j}` scales by `det(g)^n` — and the paper's own local measure in §9.1.2 is that one (**E10**).

**Two revision artifacts, with the preprint as witness:**

- **E6** — the published proof of Proposition 10.1.6.1 writes `𝔛^h_π`; arXiv v1 writes `𝔛^h_0` at the same place.
- **E8** — the published §6.3 writes `𝒜_0` in (6.3.0.4)–(6.3.0.5) although the section renamed that space to `ia*_{M,0}`; arXiv v1 defines `𝒜 := (iℝ)^k` and `𝒜_0` explicitly. The entry's identification of `𝒜_0` with `ia*_{M,0}` is exactly right.

**E1, the one gap, was followed to its source.** BPLZZ Theorem 4.14(4) says what the entry says; the proof of 4.14 ends "For (4) … follows from Proposition 4.13(1)"; and Proposition 4.13 assumes a cuspidal form with non-vanishing period and argues *by contradiction from "weak base change does not exist"*. BPLZZ's own Remark 4.15 — "Theorem 4.14 already follows from [Mok15, KMSW]" — supports both the entry's alternative repair and its classification as affecting the proof only. **What I did not verify:** the step that `χ′` is CAP when the base change is non-cuspidal; that is stated in the entry, not checked here.

## 6. One amendment in place

**E2's reason** said the cited BPLZZ numbers "are those of the first arXiv version". I rebuilt the numbering of both arXiv versions from their sources. For §§3–4 the claim is exactly right, at label level:

| label | v1 (Dec 2019) | Annals (v3) |
|---|---|---|
| `th:isolation_tri` | 3.17 | **3.19** |
| `th:abc` | 4.12 | **4.14** |
| `le:modify` | 4.10 | **4.12** |

But the two §1 citations are different: `th:ggp` is **1.8** and `th:nonvanishing` is **1.9** in v1 *and* in the Annals text, so "Theorem 1.7" (for Gan–Gross–Prasad) and "Theorem 1.8" (for non-vanishing) are off by one in **every** public version, not only relative to the Annals numbering. The entry's corrections are unaffected; the reason has been amended to say this.

## 7. What this extraction does well

115 items for a 154-page paper, with the division of labour between the four non-source routes drawn where the mathematics divides: the framework definitions to the Gan–Gross–Prasad roadmap, the trace-formula work to the Jacquet–Rallis Part II, the function spaces to the Schwartz-multiplier Part II, and the Asai/period analysis to its own Part II. Its findings are precise about *where* a defect bites — E1 in particular traces a gap through two papers and says which downstream choice depends on it.

## Tools

A macro-aware inventory simulator (`paragr`/`\bpar`, shared `theo` counter, eight input files, Latin-1), a word/environment reference audit, a pure-Python PDF text extractor for the published text, and `git grep` against pinned Mathlib `082e2d3`. Kept in the session scratchpad.
