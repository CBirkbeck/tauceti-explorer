# REV-PAPER-HANSEN-KALETHA-WEINSTEIN-22 — review of the extraction of Hansen–Kaletha–Weinstein, *On the Kottwitz conjecture for local shtuka spaces*

**Verdict: accept. All five routes accepted, all fourteen recorded mistakes confirmed, two uncovered statements added as items.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-442dc5`, issue #1391 — 126 items (0 library, 22 planned, 104 missing), 5 routes, 14 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **10** (2022), e13, 79 pp., [doi:10.1017/fmp.2022.7](https://doi.org/10.1017/fmp.2022.7), read in the published version and in [arXiv:1709.06651v4](https://arxiv.org/abs/1709.06651) with its TeX source.

## Provenance — two hashes match, and one cannot be reproduced by anyone

`d37e986e…c0bd5c` (arXiv v4 PDF) and `ff665124…60bdb4` (v4 e-print, a nine-file LaTeX project with `macros.sty`) match byte for byte.

The third artifact, the Cambridge PDF, is a different matter: **Cambridge Core watermarks every download** — the page footers read "Downloaded from https://www.cambridge.org/core. IP address: …, on 23 Sep 2026 at …" — so two downloads a minute apart differ from each other and from the recorded `62d523a5…39e13`. The file I fetched is the right article and its page tree reports the 79 pages the extraction read, so nothing is wrong with the reading; but that hash is not a check anyone can repeat, and the record should say so rather than imply reproducibility.

## 1. Numbering and coverage

`macros.sty` declares `\numberwithin{thm}{subsection}` and hangs `lem`, `cor`, `pro`, `cnj`, `fct`, `dfn`, `qst`, `exm`, `rmk`, `assumptions` on the `thm` counter, so numbers are `section.subsection.n`. Simulating that across the seven `\include`d files gives **111 numbered statements**, the appendix lettered A, B, C (2, 7 and 6 statements), and it reproduces the **kind as well as the number** of every object the findings cite — Theorem 3.2.9, Remark 2.4.4, Proposition 5.6.2, Theorem 6.6.1, Lemma B.1.1, Definition 4.3.4, Proposition 5.2.4, Proposition 6.3.3, Theorem 4.5.3, Lemma 3.1.1, Example 3.2.10. The locators' published page numbers are the journal's own: the proof of Theorem 4.5.3 is on p. 41 and the §5.6 passage on p. 51, as recorded.

**Coverage was 109 of 111**, and the two exceptions were worth chasing rather than waving through. Both precede the extraction's first §4.1 item (Definition 4.1.3):

- **Example 4.1.1** — `BG = [S/G]` is a small v-stack, morphisms `[S/G] → [S/H]` are `S`-homomorphisms `G → H`, and the 2-morphisms `φ_1 ⇒ φ_2` are the `h ∈ H(S)` with `f_1 = (ad h) ∘ f_2`. That identification is what Definitions 4.3.3–4.3.4 use, and the classifying stacks `[S/G_S]` are the objects of items 061–062.
- **Remark 4.1.2** — the `(f^*, Rf_*)` adjunction is compatible with 2-morphisms, via two commuting diagrams for the unit and counit. §4.3 pushes 2-morphisms through units and counits constantly.

I have **added them as items 127 and 128**, routed to the v-stack Part II beside their neighbours, with the file's own field convention (`id`, `kind`, `name`, `statement`, `locator`, `note`). That is the only change to the extraction besides the review blocks.

## 2. Internal references — clean

I audited **all 161** references of the form `<word>~\ref{label}` against the environment carrying the label, resolving by hand the seven labels my first pass could not (`DefCoCorr`, `ThmSixOperations`, `ThmSatakeEquivalence`, `ThmHeckePreservesULA`, `ThmSmoothBaseChange`, `ThmULASheavesOnBunG`, `LemmaBehaviorOfKappa`): **no mismatch, no duplicate label, no undefined reference.**

## 3. Statuses

No `library` items, which is right — nothing in this subject is in the pinned libraries. The 22 `planned` items and the routes cite **25 layers; all 25 exist** in `data/atlas.json`.

## 4. Routes — three Part IIs and two sources, all accepted

All three Part II titles reproduce their parents' verbatim. Unlike most extractions I have reviewed today, **these Part IIs are proposed by this extraction alone**, so the non-duplication check had to be made against the atlas rather than against sibling proposals:

- the parents demonstrably stop short — `HeckeStacksAndLocalShtukas` HS0–HS4 builds Hecke stacks, shtuka moduli and cohomology but no trace formula; `VStackSheavesAndLisseCategories` VS0–VS5 has ULA, condensed foundations and duality but no six functors for fine maps, no `Corr_S`/`CoCorr_S`; `SmoothRepresentationsOfLocalGroups` SR.0–SR.6 has no characters or trace Paley–Wiener;
- **"Kottwitz conjecture" appears nowhere** in `data/atlas.json`, "Paley–Wiener" only twice in unrelated analytic contexts, and every "Lefschetz" hit is `LefschetzPencilsAndVanishingCycles`, a different subject;
- the one atlas layer that mentions cohomological correspondences is the **scheme-level** evaluation interface owned by `EtaleDualityAndPerverseSheaves`, which this extraction uses as a *source* route (items 090–091, Varshavsky's local terms) rather than re-planning. That boundary is drawn in the right place.

## 5. Mistakes in the paper — 14 of 14 confirmed

All quoted verbatim from the hash-verified source and, where checked, found in the published text at the recorded page. Most are settled by the paper against itself:

- **E5** — (3.3.3) on p. 18 says "`ρ_G` is the sum of the positive roots"; pp. 12 and 15 both say **`2ρ_G`**. Right twice, wrong once.
- **E6** — §3.4 announces the transfer operator with `C_c(G_b(F)_ell, Λ)_{G(F)}` as target; Definition 6.3.2 defines the same map with `_{G_b(F)}`. `G(F)` does not act on `G_b(F)`.
- **E1/E2** — `Groth(G_b(F))` described as representations of `G(F)` beside `Groth(G(F) × W_E)`; and `H^{i,j}(G,b,μ)[ρ]` called `G_b(F)`-admissible where the `Ext` is over `G_b(F)` and the colimit runs over levels in `G(F)`.
- **E9** — a closure written `∪_{ν′≤ν} S_ν` instead of `S_{ν′}`, and `χ_c(U, S_V)` with no `U` defined, beside a display that computes `χ_c(X_ν, S_V)`.
- **E10** — in a three-line display, the middle line carries `rank V_μ[λ′]` where the lines above and below carry `rank V_μ[λ]`, after the text has just converted `rank V_μ^∨[λ′]` into `rank V_μ[λ]`.
- **E12** — `m^{m−1}Λ → κ` and "the `(Λ/m^{m−1})`-module `mM`" where `Λ = R/m^k` and the induction is on `k`; `m` is undefined.
- **E4, E7, E8, E11, E13, E14** — a transfer map applied in the wrong direction to `Θ_ρ`; an undefined `T_1` in a fibre product over a single base `T`; `R_1^perf = A` where `A` is the coefficient complex and `R` is meant; `[FS21, Theorem 1.9.6…]` for their I.9.6; `G(Q_p)`/`G_b(Q_p)` for a group over a finite extension `F`; and a tensor product of 1-morphisms whose target should be `A_1′ ⊠_S A_2′`.

The single **error**, **E3**, is the claim that `H^1(F, N(T,G))` classifies conjugacy classes of rational maximal tori. The correct statement is the **kernel** of `H^1(F, N(T,G)) → H^1(F,G)` — the class of `x^{−1}x^σ` is the coboundary of `x`, and for `G = PGL_2` the other classes are tori of the inner form. The entry is right that the proof uses only well-definedness and finiteness of the target, so nothing downstream moves.

## 6. What this extraction does well

126 items for a 79-page paper spanning three different subjects, split so that each lands with its own machinery: the v-stack six functors and 2-categories of correspondences in one Part II, the Kottwitz conjecture and shtuka cohomology in another, characters and trace Paley–Wiener in a third, and the classical scheme-level local terms left as a source of an existing layer. Its findings are uniformly precise about which symbol is wrong and what the neighbouring text says.

## Tools

A `macros.sty`-aware inventory simulator over the seven included files, a word/environment reference audit, and a pure-Python PDF text extractor for the published text. Kept in the session scratchpad.
