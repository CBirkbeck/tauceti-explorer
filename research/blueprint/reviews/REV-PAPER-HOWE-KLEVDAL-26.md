# Review: PAPER-HOWE-KLEVDAL-26 (Howe–Klevdal, Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax–Lindemann theorem)

Job `REV-PAPER-HOWE-KLEVDAL-26` (issue #1196), by Claude Code, session `cc-39fac3`, 23 September 2026. The extraction was written by session `cc-442dc5`. **Verdict: accept**, after the corrections below, which were made in place. All eight routes are accepted, including the new roadmap AdmissiblePairsAndPadicHodgeStructures.

## What was read

- **arXiv 2308.11064v2** (28 February 2025, 68 pp.; same SHA-256 c133b06b… as the extraction's) and its TeX source, read in full again by five checkers, one per group of sections:
  - Part I inputs, §1 and §2;
  - §§3–4;
  - §§5–6;
  - §7;
  - §§8–10.
- **Part I** (arXiv 2308.11065v2) was read from its TeX, for the Part I statements cited.
- **The published version** (Invent. Math. 244 (2026), 455–530) is paywalled and could not be read.
  - Springer's PDF link redirects to the article page, and the authors' SharedIt link returns no text.
  - The first author's homepage says the published numbering differs.
  - Locators therefore stay in arXiv v2 numbering, as the extraction's do.
- **Errata:** Crossref has no update relation, and the homepage has no erratum.

## Changes made to the extraction

- **Statements:** 39 corrected. Among them:
  - Part I inputs 004, 005, 011 and 014 now have Part I's actual hypotheses: the base field C̄₀, C₀ = W(κ_C)[1/p], "special" meaning the motivic Galois group is a torus, and the Tannakian scope of the stabilizer theorem.
  - 066 (Theorem 3.3.1(3)) records the descent step.
  - 097, 104, 105 and 174 have their base field, smoothness, connectedness and reducedness hypotheses.
  - Items 022, 051, 155, 160, 162, 165, 169, 172 and 175–179 (§§8–10) have corrected hypotheses and cross-references.
- **Locators:** 45 corrected.
- **Statuses:**
  - **024** changed from planned to missing, routed to DiamondsAndVStacks. No stage constructs D ×_{|Y|} Y; D1 and D5 plan only its inputs.
  - **023** also cites DiamondEtaleCohomology:C0.
  - **076** is re-pointed from VB2:ampleness to VB1, VB3:general-BC and VB4.
  - **079** also cites RF2:untilts.
- **Library citations:** both library items check out. Item 015's Tau Ceti Tannaka declarations are at f790474. Item 164's Baire-category declarations (`BaireSpace.of_completelyPseudoMetrizable`, `nonempty_interior_of_iUnion_of_closed`) are at Mathlib 082e2d3.
- **New items (11):**
  - **2 planned:** the relative Fargues–Fontaine curve FF_S (RF0, RF1), and Fargues–Scholze III.4.5 (BG3).
  - **9 missing:**
    - 6 to the new roadmap, among them the connectedness of motivic Galois groups, the Hodge locus of a line as a disjoint union of twisted admissible loci, and the rigid-analytic points of Gr_G;
    - 2 to the ReductiveGroups Part II (unipotent vector-group structure; Steinberg over Q̆_p);
    - 1 to DiamondsAndVStacks (products with a profinite set).
- **New-roadmap brief:** a corrections paragraph lists the constraints below.

## Mistakes in the paper (`sourceIssues`, E1–E48)

- **E1–E14**, the extraction's, are all confirmed on page images or in the TeX.
  - E3 quotes 𝒢(𝒪), not G(O).
  - E9's reason is sharpened: Remark 6.2.2 writes X_[μ] over Q_p([μ]).
  - E14's correction is too strong: v1's Lemma 4.1.1 also holds when the twisted unipotent group has slopes ≥ 0.
- **E15–E48** are new: 20 misprints, and the following.
- **Gaps in proofs, each with a verified repair:**
  - **E21:** the proof of Theorem 3.3.1(3) uses Caraiani–Scholze 3.4.3, which works only over affinoid perfectoids, and never descends the trace filtration to X_ét. The paper's own Proposition 5.0.3(4) supplies it.
  - **E31, E36, and E13 in Theorem 7.2.3:** Lemmas 6.3.3 and 7.4.4 apply Theorem 3.3.1, stated for smooth S, to seminormal S. Use Theorem 5.0.4(4) or a resolution.
  - **E33:** that HS°(Y) is abelian over a family is asserted "as in the case of a point", but B_dR^+(R) is not a PID. The family argument uses pro-étale local triviality of fibrewise semistable bundles.
  - **E32:** the proof of Proposition 6.4.1 never shows that ℓ lies in a single even weight. The step is commented out in the TeX; the argument is short.
  - **E37:** the connectedness of MG(𝒢, y), which §7.5 and §9 use, is never proved.
  - **E42:** the proof of Theorem 9.1.3 applies Lemma 9.3.1 to Z that is only irreducible. Z = {x² = ϖy²} shows that irreducible and geometrically connected does not imply geometrically irreducible. The lemma's proof works for irreducible Z.
  - **E43:** Part I Corollary 5.5.3 needs a strict p-adic field. Pass to the maximal unramified extension of the field of definition.
  - **E44:** Lemma 9.3.5 needs only an infinite residue field, not an algebraically closed one.
- **Errors:**
  - **E34 (the proof):** the proof of Proposition 7.5.2 identifies Gr_H^{b_H-adm} with Hdg(ℓ). This fails when H^1(Q_p, H) → H^1(Q_p, G) has a kernel, as for SL_2 ⊃ the norm-one torus of an unramified quadratic field. Gr_H^{b_H-adm} is one open and closed piece of Hdg(ℓ), and the proposition holds.
  - **E38 (a stated result):** Lemma 7.5.1 fails for disconnected Y (same example). Every use has Y connected.
  - **E35 (a stated result):** Remark 7.5.3's preimage claim is false, and its Borel example works with diag(1, p), not diag(p, 1).
  - **E41 (a stated result):** Lemma 9.3.3's "if" direction fails for T that is not a point (two CM points with distinct tori in a GL_2 space). It is used only for points.
  - **E19 (affects nothing):** the descent group on p. 19.
- **Effect:** Theorems A, B and 9.1.3 stand.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-HOWE-KLEVDAL-26.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems.
- Every missing item is routed exactly once, and every stage id exists in the atlas.
