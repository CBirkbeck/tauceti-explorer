# PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 — Colmez–Dospinescu–Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*

Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, **Forum of Mathematics, Pi 11 (2023), e16, 1–62**, [doi:10.1017/fmp.2023.15](https://doi.org/10.1017/fmp.2023.15), arXiv [2204.11214](https://arxiv.org/abs/2204.11214). In French.

Read in full in the **published** version: the Cambridge PDF, 62 pages, SHA-256 `1c6ee85b486a8d72f404e1e737d45b794ddf0ee03bc7bdc123b46bf0b7357d49`, retrieved 2026-09-23. Locators are printed pages (1–62). Forum of Mathematics Pi is **CC-BY**, so the published text is directly available — no preprint compromise was needed.

> **The statement counter is shared with the equations.** The source declares `\newtheorem{theo}[equation]` with `\numberwithin{equation}{section}`, so numbered equations advance the same counter: chapter 3 runs 3.1, 3.2, then jumps to Lemma 3.10 and Corollary 3.11, and chapter 4 skips 4.6 and 4.14–4.16. Statement numbers therefore **cannot** be obtained by counting statements, and a first pass that did so mis-numbered about a third of the locators. They were rebuilt from the printed pages and then checked against a simulation of the source counter, label by label: the arXiv v2 numbering and the published numbering agree **exactly** (103 labelled statements), so there is no drift between the two versions. As a by-product, all 176 internal cross-references in the published text were checked for kind and existence (`th./prop./lemme/cor./rem.` against the real environment of that number) and every one is correct.

**Status: `complete`.** 92 items (76 missing, 16 planned; 71 theorems, 12 constructions, 9 definitions), 13 routes, 18 prerequisites, 6 source issues, 6 gaps.

## What the paper proves

The companion paper computed the multiplicity of **one** irreducible `V` in the cohomology of the Drinfeld tower. This one determines the **whole** cohomology as a `Gal_{Q_p} × G × Ǧ`-module, for `F = Q_p` and `p > 3`:

> **Theorem 0.1 (= Theorem 5.15).** `H¹_ét(M^p_{n,Q̄_p},L(1)) ≅ ⊕_M (⊕̂_B Π*(ρ_{B,M}) ⊗ ρ_{B,M} ⊗ Ř_{B,M}) ⊗_L JL(M)`, the unspecified tensor products being over `R_{B,M}`.

This is Emerton's description of the completed cohomology of the modular tower with **Kisin rings in place of Hecke algebras**: `M` runs over the types of level ≤ n, `B` over the blocks of the mod p representation theory of `G`, `R_{B,M}` parametrises the potentially semi-stable representations of type `M` with residual pseudo-character `ρ_B`, and `Π*(ρ_{B,M})` interpolates the duals `Π(ρ_x)*` of the p-adic local Langlands correspondence over `Spm R_{B,M}`. Note which object is described: the completed cohomology of the tower of **coefficient fields** `M^p_{n,K}`, a strict subobject of the cohomology over `C_p`; the two differ because the levels are not quasi-compact, and the authors say they failed to find an arithmetic meaning for the quotient.

The engine, which occupies most of the paper and is geometric and independent of the first paper's methods:

1. **Finite presentation for every `F`, every level, every `q`** (Theorem 0.5 = 2.1), from an equivariant semi-stable formal model (Proposition 2.7), the Bloch–Kato–Hyodo filtration on mod p nearby cycles **extended to formal schemes** (Theorem 2.4 — the paper notes this is "bien connu des experts" but unpublished), and a calculus of *cohomologically profinite, `G′`-continuous, finitely copresented* sheaves (§2.1.3).
2. **Finite length for `F = Q_p`** (Theorem 0.2 = 4.1), the crucial ingredient. It rests on Theorem 1.21 — finite length is detected by the cosocle — plus Scholze's functor, Ludwig's vanishing `S² = 0`, and a **global** input: quaternionic algebraic modular forms, Paškūnas's local structure results, and local–global compatibility (Proposition 4.11), used to prove the purely local Proposition 4.3.
3. **Non-admissibility for `F ≠ Q_p`** (Theorems 0.4 = 2.13/2.14): finite presentation plus Schraen–Wu (supersingulars are not finitely presented) plus Emerton's ordinary-part description of the category `C`, contradicting the companion's computation of `Π_M(V)`.
4. **Interpolation** (§5): the integral block decomposition of the completed cohomology (Proposition 5.21, Theorem 5.22) and the pointwise answer at every closed point of `Spec R_{B,M}` (Theorem 5.8), glued because `R_{B,M}` is a finite product of principal ideal rings (Theorem 5.11).

## Routing — two new roadmaps, and two shared with the companion extraction

PROTOCOL §15: the two Drinfeld-tower papers are one design job, so this extraction **reuses** the roadmap and the Part II proposed by `PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B` rather than duplicating them.

| # | route | roadmap | area | items |
|---|-------|---------|------|-------|
| 1 | new | **`ModpRepresentationsOfGL2OverLocalFields`** | `representations` | 18 |
| 2 | new | **`ScholzeFunctorAndModpCohomologyOfTheLubinTateTower`** | `langlands` | 16 |
| 3 | new (shared) | **`ProetaleCohomologyOfPAdicCurvesAndTowers`** | `padic` | 15 |
| 4 | part-ii (shared) | **`PadicLocalLanglandsForGL2QpPartIIGeometricRealisation`**, parent `PadicLocalLanglandsForGL2Qp` | `langlands` | 27 |
| 5–13 | source | `PadicLocalLanglandsForGL2Qp` R30.2/R30.3/R30.5/R30.6 · `LocalGaloisDeformationRings` R08.3 · `CompletedCohomologyAndLocalGlobalCompatibility` R31.4/R31.5 · `HilbertModularVarietiesAndShimuraCurves` R18.3 · `GL2AutomorphicRepresentationsAndTransfer` R16.3/R17.1/R17.3 · `PadicHodgeTheory` R06.3 · `FiniteFlatGroupsAndIntegralPadicHodgeTheory` R07.5 · `ClassicalAdicEtaleCohomology` H1 · `EndoscopicTransferAndUnitaryTraceComparison` ET.6a | — | 16 planned |

**Route 1 exists because the atlas plans mod p representation theory only for `GL_2(Q_p)`.** `PadicLocalLanglandsForGL2Qp:R30.2` owns the categories and R30.5/R30.6 the blocks, projective envelopes and the `R = T` statements for `Q_p` — and this paper is a *source* for those, since it needs them in the sharp Paškūnas–Tung form (Theorem 1.16). What has no home is everything about a **general** local field: Shotton's coherence of `O_L⟨H⟩` for an amalgam, the finite-type/finite-presentation/admissibility hierarchy, the filtration of a finite-type representation by quotients of compact inductions (Propositions 1.19–1.20), the cosocle criterion (Theorem 1.21) with its two finiteness lemmas, the category `C` of admissible finitely presented representations (Theorem 1.26) and its description through Emerton's ordinary part (Propositions 1.30–1.33, Corollary 1.34). Nothing in the atlas builds the `Ord` functor at all.

**Route 2 exists because the atlas has nothing on Scholze's functor.** `π ↦ S^i(π)` — the candidate mod p Jacquet–Langlands transfer built from the pro-étale `GL_n(F)`-torsor over `P^{n-1}` — is not planned anywhere, nor is the spectral sequence relating it to the cohomology of the tower (Theorem 3.2), nor Ludwig's vanishing, nor Fust's computation of `H^i(SL_2(Q_p),π)` that turns the spectral sequence into the comparison of Corollary 3.13, nor the mod p geometric multiplicities `Π^geo_n(ρ̄)` of Theorem 4.23.

**Routes 3 and 4 are the companion's proposals, consumed here.** Route 3 takes the nearby-cycle and formal-model package of chapter 2 and the pro-étale statements of §5.1 (Proposition 5.6, `H¹_ét` as the `G`-bounded part of `H¹_proét`); route 4 takes the factorisation itself — the Kisin rings, `Π*(ρ_{B,M})`, the integral block decomposition and Theorems 5.15/5.24 — since a geometric realisation of the p-adic correspondence is new layers in precisely the direction of `PadicLocalLanglandsForGL2Qp`, and no stage of the parent mentions the tower. `ET.6a` again supplies the two towers with their period morphisms and the infinite-level identification, so those items are `planned`, not missing.

## Source issues — 6, each verified on the rendered page

Crossref has no correction, erratum or update relation for the DOI (checked 2026-09-23, relation set empty), the Cambridge article page lists no corrigendum, and arXiv has only v1 and v2. The two findings in the statements are present in the arXiv v2 source as well; the three in the reference list divide the other way.

- **E1 (Theorem 5.15, p. 55) — the main theorem's own statement is circular.** It closes "et `Ř_{B,M} = Hom(Ř_{B,M},L)`". It must be `Hom(R_{B,M},L)`: Theorem 0.1 (p. 2) says "`Ř_{B,M}` est le L-dual continu de `R_{B,M}`" and Theorem 5.24 (ii) (p. 59) repeats it correctly. Same formula in the arXiv source.
- **E2 (Proposition 5.16, p. 55).** "qui, **pour pour** tout `k ≥ 1`, sont fixes modulo `p^k`" — doubled word.
- **E3 (Theorem 5.24 (ii), p. 59, and Theorem 5.15, p. 55) — a missing hypothesis.** Neither statement restricts `p`, and no standing hypothesis does it for them: chapter 4 assumes only `p > 2` (footnote 23) and chapter 5 assumes nothing. But the proof of (ii) concludes "en adaptant le lemme 5.12" through **footnote 32** (p. 60), which needs Paškūnas's explicit description and therefore "demande d'exclure les blocs contenant un twist de la steinberg si `p = 2, 3`" — which is why the introduction states the same result as Theorem 0.18 (ii) with "Supposons que `p > 3`", relaxed in footnote 14 to `p = 3` away from the Steinberg blocks. As printed, the body asserts for all `p` what is proved under that restriction.
- **E4 (reference [52], p. 62).** "Extensions for supersingular representations **of )**" — the group has vanished from Paškūnas's title, leaving a stray parenthesis. The source has the malformed `${\rm GL}_2(\Q_p$)`, with the closing parenthesis outside the formula.
- **E5 (reference [42], p. 62).** "quaternion algebra over **`g p`**" for `Q_p`; the source writes `$\qp$`, so the substitution happened in production. Checked on the rendered page and with two independent extractors.
- **E6 (reference [68], p. 62).** "components **of of** Lubin-Tate deformation spaces" — doubled word, already in the arXiv bibliography.

## Recorded as gaps

The `p > 3` hypothesis is "sans doute superflue" (footnote 2) but not removed: `p = 3` is open outside the Steinberg-twist blocks and `p = 2` is excluded throughout, so the factorisation may not be planned for all `p`. Four inputs were unpublished when the paper appeared — in particular **`[19]`, "Correspondance de Langlands locale p-adique et anneaux de Kisin" (Acta Arith., "à paraître"), carries the prodiscrete module `Y_B` used in the proof of Theorem 5.24 (i)** — so a design job should plan the statements used, not the papers. The **integral** multiplicity module is not described: the paper obtains `H^{1,+}_{Q̄_p} ≅ ⊕̂_B [P_B ⊗_{E_B} 𝕞_B(H^{1,+}_{Q̄_p})]` but says it does not seem easy to describe `𝕞_B(H^{1,+})` itself, and computes only its generic fibre. Several statements are expectations, not results: Question 5.18 (is `H^{1,+}_{Q̄_p}` dense in `H^{1,+}_{C_p}`?), Remark 0.6 (a Poincaré duality would give the first half of Theorem 0.5 for all `q`), Remark 2.3 (finite presentation in arbitrary dimension), Remark 4.29 (Theorem 4.26 should hold for `F ≠ Q_p`, whereas Theorem 4.1 does not), Remark 1.18 (Emerton's conjecture on quotients of `I(σ)`). And the **mod p classification is missing for `F ≠ Q_p`**, which is exactly why the cosocle criterion and the finite-length theorem are `Q_p`-only while finite presentation holds for all `F`. Finally, no functor realising a p-adic Jacquet–Langlands correspondence is constructed; the factorisation produces the objects, not the correspondence.

## Checks

`scripts/check_paper.py`: ok with `"status": "complete"`, so exactly-once routing of the 76 missing items is enforced and the 6 source issues pass `scripts/source_issues.py`. Both proposed new ids are free in `data/atlas.json`, in `research/blueprint/roadmaps/` and in every other paper extraction; the two shared ids are the ones proposed by `PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B`, as PROTOCOL §15 intends; the `part-ii` parent exists and is of atlas origin; all route areas are galaxy ids of `data/galaxies.json`; and every `planned` stage id was checked against `data/atlas.json`.

## Review (REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-23, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1372](https://github.com/CBirkbeck/tauceti-explorer/issues/1372). **Verdict: accept.**
No item, status, route or locator changed.

- **All 6 mistakes confirmed, every one decisively.** E3 is the substantive one and the paper
  settles it against itself: Théorème 0.18(ii) on p. 9 reads "Supposons que p > 3", while
  Théorème 5.24(ii) on p. 59 states the same isomorphism with no hypothesis at all. E1 defines a
  dual as its own dual (`Ř = Hom(Ř, L)`). E2, E4, E5, E6 are "pour pour", a reference whose group
  name dropped out leaving "of )", a field set as "𝑔 𝑝", and "of of".
- **Provenance, with a detail worth recording:** the recorded `sha256` is not reproducible, and
  although two of three downloads agreed, that was an artefact of the stamp's one-second
  granularity — the third differed. **Two agreeing downloads are not evidence; take three.** A
  stamp-stripped text hash was recorded as the anchor.
- **Items and routes:** no library items; 16 planned resolving; 76 missing routed exactly once;
  all four proposed names free and the Part II title an exact prefix extension.
- **Two merges checked at first hand:** `ProetaleCohomologyOfPAdicCurvesAndTowers` and the Part II
  are the ones PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B proposed, which the same reviewer reviewed
  earlier in this session (#2474) — the two extractions are complementary, this paper completing
  what 20-B began.

Full report: `research/blueprint/reviews/REV-PAPER-COLMEZ-DOSPINESCU-NIZIOL-23.md`.
