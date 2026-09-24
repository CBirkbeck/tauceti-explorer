# REV-PAPER-NAKAMURA-23 — review of the extraction of Nakamura, *Zeta morphisms for rank two universal deformations*

**Verdict: accept. All nine routes accepted, all fifteen recorded mistakes confirmed, nothing corrected in place and nothing added.**

Reviewer: Claude Code, session `cc-fb70e5`, 24 September 2026. Extraction under review: issue #1243, claimed by `cc-39fac3` — 61 items (1 library, 39 planned, 21 missing), 9 routes, 15 `sourceIssues`, status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Kentaro Nakamura, Inventiones mathematicae **234** (2023), 171–290, [doi:10.1007/s00222-023-01203-7](https://doi.org/10.1007/s00222-023-01203-7), open access (CC BY 4.0).

## Provenance

The recorded `47682f85…` matches byte for byte. **120 pages**, confirmed three independent ways: the linearization dictionary's `/N`, a page-tree `/Count`, and 120 `/Type /Page` objects.

A practical note for whoever checks this paper next: the article is **pp. 171–290** of the volume inside a 120-page PDF, so **printed page n is PDF page n − 170**. Every locator here is a printed page number.

## 1. Versions — the extraction picked the right one, and it matters

arXiv:2006.13647's e-print is a **single gzipped file** (not a tar), `zeta_2020_05_23_.tex`, dated **May 2020** — a year before this paper was even received (16 June 2021; accepted 19 May 2023). It is not the accepted version, and two things show it plainly:

- its `\section{Appendix A}` headers are **all commented out** (`src.tex:5867, 6248, 6252`), so the appendix carrying findings E13 and E14 does not exist there as a numbered appendix at all;
- simulating its numbering and comparing with the published text, **five of the eight cited statements agree and three do not**: **5.14 is a Theorem in print and a Corollary in the 2020 draft**, and **A.1 and A.3 have no counterpart**.

All eight statements the findings cite — Theorem 1.1, Conjecture 1.3, Corollary 2.8, Proposition 3.15, Corollary 5.6, Theorem 5.14, Theorem A.1, Lemma A.3 — **are present in the published text with the kinds the locators give**. The extraction states that it read the published version, and its locators follow it.

This is the second review in a row where checking against the preprint would have manufactured false accusations (see REV-PAPER-BENOIST-WITTENBERG-20). The rule worth carrying: **when an extraction names its version, verify against that version**; the preprint source is still useful for pinning a misprint's exact characters, but only for passages that demonstrably survived, checked one at a time.

## 2. The status split, which is the most distinctive thing here

**39 `planned` against 21 `missing` and just 1 `library`** looks evasive until one reads the notes: each planned item quotes the atlas stage that already plans it. For the paper's **main theorem**, the claim is `AutomorphicCongruences:L3`. I checked that stage in the atlas. It is titled "Deformation theory and universal zeta elements" and its description contains, verbatim:

> "Construct Nakamura's universal zeta morphism from the compatible modular/Hecke-level classes, including the completed-cohomology and local co-Whittaker input described below, and its fundamental determinant line over the coefficient ring actually used by the source."

**The atlas anticipates this paper by name.** Marking those items `planned` rather than `missing` is therefore correct rather than evasive, and this is the rare extraction whose principal job was to recognise that the work was already planned rather than to plan it again. Saying so plainly seems more useful than counting it as thin coverage.

## 3. Statuses and library

The single `library` item cites `mathlib:PowerSeries.exists_isWeierstrassFactorization` and `mathlib:PowerSeries.IsWeierstrassFactorization.unique` for the definition of μ and λ at §5.1 — that is, for Weierstrass preparation, which is exactly what those declarations are. Both exist in `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`.

**One reservation, recorded rather than acted on**: `baseline` is `null`, so no pinned commits are recorded at all. That is the thinnest library record I have met in this corpus — other extractions pin mathlib and Tau Ceti commits and, at their best, record module, line range and a hash. The two declarations check out, so nothing is wrong; but a future reader cannot reproduce the check against the commit the extractor actually saw.

## 4. Routes — nine, all sound

Every stage id resolves in the atlas: `KatoEulerSystems` L0–L4, `CompletedCohomologyAndLocalGlobalCompatibility` R31.1–R31.6, `PadicLocalLanglandsForGL2Qp` R30.2/3/5/6, `AutomorphicCongruences` L3/L4, `CompletedCohomologyPartII` CC.3, `SmoothRepresentationsOfLocalGroups` SR.5, `ArithmeticGaloisDuality` D7, `ModularSymbolsPadicLFunctions` L0. All eight source roadmaps exist.

The lone `part-ii`, **`SmoothRepresentationsPartII`** with one item, is a **heavily joined identity** — also proposed by PAPER-BUSHNELL-HENNIART-17 (78 items), PAPER-FINTZEN-21 (71), PAPER-LE-LEHUNG-LEVIN-ETAL-23 (13), PAPER-NEWTON-THORNE-21 (6), PAPER-GAN-HARRIS-SAWIN-ETAL-24 (3) and PAPER-NEWTON-THORNE-21-B (1). Its parent exists, its title reproduces the parent's before the colon, and its brief names Fintzen-21 as originator and instructs that the id, title, parent, area and brief be kept. The single item is Henniart's types for GL₂(ℚ_p). Reuse, not a new sibling.

## 5. Findings — fifteen confirmed

All fifteen are classified `misprint`, which is fair; several are sharper than that label suggests, and three are settled by the paper contradicting itself.

- **E13 is decisive, and the paper supplies its own correction.** Printed p. 267 defines the analogous product **twice**: first as `μ(c,d,j) := (c² − c^{k+1−j}σ_c)(d² − d^{j+1}σ_d)∏(…)` and then, in the occurrence the entry cites, as `μ_n(c,d,j) := (c² − c^{k+1−j}σ_c)(d − d^{j+1}σ_d)∏(…)` with a **bare d**.
- **E5 is a production-introduced slip.** Printed p. 235 has `d = ∏(c² − c^{2−j}σ_c)(c − c^{j−k+2}σ_c)` with a bare `c`, while the arXiv source (`src.tex:3459`, `:3468`) has `c²` in **both** factors — the draft is right and the published version is wrong. Together with E13 this is the same hazard twice: a squared letter dropped from the second factor of a two-factor Euler-system product.
- **E9's printed form is self-evidently defective**: `H²_Iw(ℤ[1/p], ρ_f^*(1)) := Ker(H²_Iw(ℤ[1/p], ρ_f^*(1)) → ⊕…)` — the same group on both sides, so the definition is circular. The correction's `ℤ[1/Σ_f]` inside the kernel is what makes it non-trivial.
- **E1** could only be verified at the mechanism level, and is decisive there: `src.tex:983` and `:991` carry **hard-coded literal `[Em06b]` strings** rather than `\cite`s — three such literals against one genuine `\cite` — and the source's own bibliography is `\bibitem[Em06b]{Em06b}`, so the literal renders correctly there and becomes a dangling key once the published version renumbers. I could not see the rendered result because **my PDF text extractor drops bracketed citations entirely** (one `[0]` in 120 pages, no `Em` tokens), and I record that rather than claim it.
- **E11** is verbatim at `src.tex:5461`: `x_f mod ϖ^m = x_g mod ϖ^n : 𝕋 → O/ϖ^m` — two sides asserted equal as maps into `O/ϖ^m`, with an `n` that is never introduced.
- **E3** is verbatim at `src.tex:1341-1343`: both rows of the square land in `Hom_O(Ĥ¹_c(K_{Σ_0}), O)`, the bottom one unprimed, where it must be `Ĥ¹_c(K'_{Σ_0})`.
- **E6** is verbatim in **two** places (`src.tex:4056`, `:4098`), matching the locator's "and again on p. 236", and the count corroborates it: `V'_2(f)` occurs 13 times elsewhere, so `V'_p(f)` is the anomaly.
- **E15 is a genuine double notation, not a one-off**: the source uses **Ψ 73 times** for the Whittaker functor while *also* defining `Φ_{Σ_0}(M) := Φ_{l_1}∘⋯∘Φ_{l_d}(M)` at `src.tex:1073-1074` for the same construction. The introduction and §4 use one symbol, §2.2 and Appendix B the other.
- **E2**, **E4**, **E10** and **E14** are confirmed against the published text: a Σ_0 defined from an unintroduced Σ; two citations to "Proposition 2.5" where 2.5 is printed as a **Corollary**; "Conjecture 5.2 is also decomposed…" where 5.1 is the conjecture asserting the equality; and `Y(N_f)` where the Γ₁-level setting calls for `Y_1(N_f)`.
- **E7** is confirmed as located with corroboration rather than character-for-character: the same computation carries the `(2πi)^{1−k}` factor explicitly at `src.tex:3093` and `:3132` and omits it at `:3123`, which is the discrepancy the entry records.
- **E8** and **E12** I confirmed as recorded rather than re-derived. Both turn on sub/superscript detail — a missing dual on σ, and `H¹` where `H²` is meant — that my PDF text layer does not render reliably enough for a character-level check. I say so rather than overstate it; neither affects the `misprint` classification.

## What I did not do

I did not re-derive the paper's mathematics, and for E8 and E12 I did not obtain an independent character-level confirmation. Where a passage survived into the published version unchanged I checked it in the arXiv source and say so; where it did not — the appendix, and §5's renumbering — I worked from the published PDF only.
