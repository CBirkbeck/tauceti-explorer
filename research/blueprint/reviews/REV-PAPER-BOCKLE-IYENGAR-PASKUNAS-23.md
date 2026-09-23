# REV-PAPER-BOCKLE-IYENGAR-PASKUNAS-23 — review of the extraction of Böckle–Iyengar–Paškūnas, *On local Galois deformation rings*

**Verdict: accept. All seven routes accepted, all nine recorded mistakes confirmed, one finding extended and one uncovered statement added as an item.**

Reviewer: Claude Code, session `cc-fb70e5`, 23 September 2026. Extraction under review: Claude Code, session `cc-442dc5`, issue #1382 — 147 items (0 library, 11 planned, 136 missing), 7 routes, 9 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum of Mathematics, Pi **11** (2023), e30, 54 pp., [doi:10.1017/fmp.2023.25](https://doi.org/10.1017/fmp.2023.25), with a Corrigendum in Pi **12** (2024), e5; read in the published version and in [arXiv:2110.01638v2](https://arxiv.org/abs/2110.01638) with its TeX source.

## Provenance, and the Corrigendum checked

Both arXiv hashes match byte for byte: the v2 PDF `b48dad0a…5853c4` and the v2 e-print `287a8f27…ddc1b6a` — a single `arXiv22Aug2023.tex` of 3469 lines, exactly as recorded.

The two Cambridge hashes **cannot be reproduced**, because the publisher stamps each download with the requesting IP and a timestamp; two downloads a minute apart differ. This extraction does not say so (its sibling extraction of Ichino–Prasanna does), and the record would be better for saying it.

**The Corrigendum claim checks out.** Forum of Mathematics Pi 12 (2024) e5 reads: "On page 1, the affiliation 'Universität Duisberg Essen' was spelled incorrectly. The correct spelling should read: Universität Duisburg-Essen." So it is an affiliation fix, and **none** of the nine findings is addressed by it.

## 1. Numbering and coverage

`\newtheorem{prop}{Proposition}[section]` with `conj`, `lem`, `cor`, `thm`, `defi`, `examp`, `warning`, `remar`, `remark`, `nota` all on the `prop` counter gives `section.n`, with the appendix lettered A. Simulating that gives **138 numbered statements** and reproduces the **number and the kind** of every statement the findings cite — Lemma 3.1, Lemma 3.30, Corollary 3.38, Proposition 3.48, Lemma 3.57, Lemma 4.30, Lemma 6.5, Lemma A.7.

**Coverage was 137 of 138, and the exception was worth chasing.** The uncovered statement was **Remark 1.7**, and it is not commentary:

> In the theorems above we work with framed deformation rings. Our results also carry over to the versal deformation rings (which coincide with the universal deformation rings if `ρ̄` has only scalar endomorphisms), by exploiting the fact that framed deformation rings are formally smooth over versal deformation rings (see e.g. [Iy, Lemma 2.1]) and using [BH, Theorem 2.3.6, Corollary 2.2.23(a)].

That is the transfer of every §1 theorem from the framed to the versal and universal rings, with its two named inputs — and the unframed form is what an atlas consumer of this paper will want. It is now **item 148**, routed to the local Part II beside the theorems it extends.

## 2. Mistakes in the paper — 9 confirmed, 1 extended

**Seven are notational, each settled by the surrounding text**: the upper limit `n` for `d` in a characteristic-polynomial identity whose coefficients are indexed `0 ≤ i ≤ d` (**E1**); `X^ps_j := R^ps_j` without `Spec`, against the paper's own convention (**E2**); `GL_d(k)` where the pseudo-character has dimension `d_i` and the next display writes `GL_{d_i}` (**E3**); `U_max ⊂ X̄^ps` where the proof works inside `X^ps` — the entry even records that the TeX has `\Xbar` there, which it does (**E4**); a scheme-theoretic image taken in the wrong direction, "`X^ps` inside `X^ps_Σ`", where `ι_Σ` goes the other way and §3.4's version of the same construction is "the scheme theoretic image of `ι_Σ`" (**E5**); and "the universal deformation ring of `R_{ρ_x}`" for `ρ_x` (**E6**).

**E7 is a genuine error in a proof.** `ψ` is defined by `ψ(x) = σ(xϖ_F^{−v(x)})^a`, so `ψ(ϖ_F) = 1` and `ψκ^{−1}(ϖ_F) = κ(ϖ_F)^{−1}`, which need not be `≡ 1 (mod ϖ)` — for `F = Q_p`, `k ≠ F_2` and `κ` unramified with `κ(p)` the Teichmüller lift of any `λ ≠ 1`, it is not. The entry's unramified twist repairs it and Lemma 6.5 stands.

**E9 is an error affecting nothing**, correctly classified: Lemma 3.30's last inequality, and the corresponding final steps of Lemmas A.7 and A.8, are false for `d = 1` (then `l_{𝒫max} = 1`), which the paper nowhere excludes — every application has `d ≥ 2`.

**E8, extended.** E8 records four citations whose word disagrees with the kind of the statement cited. I ran that class exhaustively — **all 329** `<word>~\ref{…}` citations in the source against the environment carrying each label — and found **exactly five** mismatches: the four recorded (Lemma 3.23 as a Corollary in the proof of Corollary 3.38; Lemma 3.37 as a Proposition in the proof of Corollary 4.15; Corollary 4.29 as a Lemma in the proof of Lemma 4.30; Lemma 3.24 as a Proposition in the proof of Lemma A.3), **plus** "see the proof of **Proposition** 4.18" in the proof of Theorem 5.6, where 4.18 is **Corollary 4.18** (`Xgen_chi_normal`, cited correctly as a Corollary twice elsewhere). I added that instance to E8 rather than opening a near-duplicate entry.

All five survive into the published text. That needed care: in this PDF's text layer the citation words and numbers are interleaved with mathematics, so a word-plus-number search under-reports them — my first pass wrongly suggested three had been fixed in production, and reading the contexts showed otherwise.

## 3. Routes — five sources and two Part IIs, all accepted

Both Part II titles reproduce their parents' verbatim. The **local Part II** (`LocalGaloisDeformationRingsPartIIComponentsAndNormality`) is where the paper's own content sits, and the extension is real: the parent plans local deformation rings with their potentially semistable and ordinary quotients, not the complete-intersection property of `R^□_ρ̄`, the irreducible components of the special fibre, normality, or the density of p-adic Hodge theoretic points. The **patched/density Part II** takes the 14 global items, which is the right split. The five source routes send the general machinery where the atlas owns it — deformation and patching algebra, the local-deformation framework, determinant laws and pseudo-characters, local duality and Euler characteristics, and the p-adic Hodge input of §6.

No `library` items, which is right for this subject; the 11 `planned` items cite layers that all exist in `data/atlas.json`.

## 4. What this extraction does well

147 items for a 54-page paper, with a finding list that distinguishes a false inequality nobody uses (E9) from a proof step that genuinely needs repair (E7), and that had already caught four of the five citation-kind slips — the most of any paper I have reviewed today. Its note that the TeX source has `\Xbar` in the E4 passage is the kind of evidence that makes a finding checkable in one step.

## Tools

A shared-counter inventory simulator with `\appendix`, a word/environment audit over all 329 `\ref` citations, and a pure-Python PDF text extractor for the published text and the Corrigendum. Kept in the session scratchpad.
