# REV-PAPER-SCHOLZE-13: review of the extraction of Scholze, *p-adic Hodge theory for rigid-analytic varieties*

**Verdict: accept.** All five routes are accepted, but the extraction is corrected in place:
- 110 of its 191 missing items were already planned by blueprint packets on main, and are now planned.
- A fifth source route, to AInfCohomology AI.3, takes 19 integral statements from routes 1–3.
- The four original route reasons are rewritten.
- `source.readSections` records a renumbering between arXiv and the published version.
- All 21 recorded mistakes are confirmed. No new mistake was found.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-f805bf` (PR #4554, issue #4548). It had 254 items (5 library, 58 planned, 191 missing), 4 source routes and 21 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Sources:
- **Published article.** Forum Math. Pi **1** (2013), e1, doi:10.1017/fmp.2013.1: the Cambridge Core open-access PDF, 77 pages, where PDF page = printed page. Cambridge stamps each download, so I did not reproduce the recorded text hash; the recorded method needs pdftotext, which this machine lacks.
- **Corrigendum.** Forum Math. Pi **4** (2016), e6, 4 pages.
- **Preprint.** arXiv:1205.3463v2, whose SHA-256 `ed9187b3…1959` matches the recorded hash.

## 1. Items: complete, with one numbering correction

- **Coverage.** A script read arXiv v2's 94 numbered statement headers and renumbered them to the published text (the published headers are set in capitals). Every one appears in an item except four:
  - Remark 1.4 (history), Remark 3.14 (a caution) and Remark 5.7 (a speculation);
  - Corollary 3.8, which the corrigendum withdraws (E7).
- **Numbering.** The extraction says no statement changed between arXiv v2 and the published text, but one did. The published version inserts Lemma 5.8 (p. 45, completely continuous maps of Banach spaces). It makes explicit a step that arXiv v2's proof of Lemma 5.6 calls easy ("one easily checks that A is a subquotient of a bounded subset of a finite-dimensional K-vector space", arXiv p. 32). Published Lemmas 5.9 and 5.11, Definition 5.10 and Corollary 5.12 are therefore arXiv v2's 5.8, 5.10, 5.9 and 5.11. The published text itself cites "Corollary 5.12" on p. 72, where arXiv cites 5.11. The blueprint packets use the arXiv numbers. `source.readSections` now says so.
- **Statements.** I read these statements in the published text, and the items for them agree, with the corrigendum's corrections applied: Proposition 3.7, Definitions 3.3, 3.4, 3.9 and 6.8, Proposition 3.13, Lemma 3.18, Corollary 5.12, Lemmas 6.11 and 6.12, Remark 6.20, Definition 8.3, Theorem 8.8 and Theorem 9.4.
- **Not read.** I did not read every proof in the 77 pages. I read the statements, the pages at every source issue, and the proofs cited below.

## 2. Statuses: 110 corrected

**Library.** All five library items hold at Mathlib 082e2d3:
- `BDeRhamPlus` is the ker θ-adic completion of W(R♭)[1/p], and `BDeRham` inverts the generators of ker θ (Mathlib/RingTheory/Perfectoid/BDeRham.lean:77, 90), with `fontaineThetaInvertP` and `WittVector.fontaineTheta`.
- `IsBezout.isPrincipal_of_FG` is the field of the class `IsBezout` (PrincipalIdealDomain.lean:67). Class fields are not in the declarations index. Valuation rings are Bézout (Valuation/ValuationRing.lean:381).

**Planned and missing.** The extraction compared its items with the stage texts only. Five blueprint packets on main, merged 24–27 September before the extraction, state most of its missing items node by node, citing this paper:

| Packet | Stages | Items now planned |
|---|---|---|
| `PadicHodgeTheory--P7.json` | P8, P8:local-rational, R06.1 | §6: the period sheaves on affinoid perfectoids, corrected 𝒪𝔹⁺_dR and Propositions 6.7–6.20 |
| | | §7: Definitions 7.1–7.5, Theorems 7.2 and 7.6, Lemmas 7.7–7.10, the definition of Hodge cohomology and Lemma 7.13 |
| | | §8: Definitions 8.1 and 8.3, Proposition 8.2, Theorem 8.4(i), Lemmas 8.6–8.7 |
| | | Theorem 4.9 and Lemma 5.2 |
| `AdicEtaleGeometry.json` | A1 | all of §3 routed to A1 except Lemma 3.18 |
| `ClassicalAdicEtaleCohomology--H0.json` | H0 | Proposition 3.7(iii), Lemma 3.16, Corollary 3.17 and the Tate twist on X_proét |
| `PerfectoidSpaces--P0.json` | P0, P6 | Definition 2.3 and its dependence on M^a, Lemma 2.13, Definition 4.3(i), Example 4.4, Lemmas 4.5(i) and 4.6 |
| `AdicSpacesPartII.json` | R0, R3 | locally noetherian adic spaces, Theorem 9.1, Proposition 9.2(ii) |

I also re-marked the introduction's restatements (Theorems 1.2 and 1.5, the two definitions and Remark 1.7) with their body theorems.

For each pair I compared the item with the node's statement. A node that only uses a result in a proof, or imports it from another stage, does not count.

Four items are stated only in part, with the integral part requested from AI.3. They stay missing: Theorem 6.5(i), Corollary 6.6, Lemma 4.10(iii) and Û. The counts are now 5 library, 168 planned and 81 missing.

## 3. Routes: all accepted, one added

- **Route 1** (PadicHodgeTheory P8, P8:local-rational). **Accept, reason corrected.**
  - 61 of its items are now planned.
  - **What stays.** The primitive comparison and finiteness theorem, with Lemmas 5.3–5.9, Corollary 5.12 and Lemma 4.12, and a few remarks.
  - **Precedent.** Accepted routes send these to P8: PAPER-ZAVYALOV-25 route 7 and PAPER-BHATT-MORROW-SCHOLZE-18 route 14. The extraction also cited PAPER-HEUER-25, but that one is awaiting review.
  - **An open request.** The P7 packet itself records the primitive comparison as having no owner and requests it from CohomologyComparisons CP.3. P8's blueprint should settle that.
- **Route 2** (PerfectoidSpaces). **Accept, narrowed to P0 and P6.**
  - §2's rank-one theory is not in the packet and belongs in P0: ≈_ε, Theorem 2.5, the elementary divisors of Propositions 2.10–2.11, Proposition 2.7 and Lemma 2.12.
  - The integral §4 statements go to route 5.
- **Route 3** (AdicEtaleGeometry A1). **Accept.** Every item is now planned, which §16 allows for a source route. Lemma 3.18 goes to route 5.
- **Route 4** (AdicSpacesPartII R1, R3). **Accept.** Three of its items are planned by R3. Proposition 9.2(i) and Theorem 9.4 remain missing.
- **Route 5** (new: AInfCohomology AI.3). **Accept.**
  - **What AI.3 owns.** Its stage text constructs "the completed integral structure sheaf, its tilt and the Witt A_inf,X sheaf" on the pro-étale site with the corrected covers, and the continuous cochains of a toric perfectoid cover. P8:local-rational imports the integral A_inf sheaf from it.
  - **What the packet asks.** The PadicHodgeTheory P7 packet requests from AI.3, for every locally noetherian adic space over Spa(ℚ_p, ℤ_p), the 19 statements now routed here:
    - Lemmas 3.18, 4.2(iii), 4.10, 5.5 and 5.11;
    - Corollary 4.7, Proposition 4.8, Û and perfectoid objects;
    - the integral cases of Theorem 6.5 and Corollary 6.6.
  - **Why not P2 and P6.** The extraction had sent these to P2 and P6, which would give the completed integral structure sheaf a second owner.

**For the red team.**
- **Planned more than once.** Lemma 5.2 has three nodes: P8:local-rational/toric-charts-for-smooth-spaces, AdicSpacesPartII:R0/smooth-toric-chart and AdicEtaleGeometry:A2/relative-toric-charts. Lemma 6.12 has two: AdicSpacesPartII:R0/etale-algebraic-model and P8:local-rational/etale-algebras-over-torus-models.
- **A needless condition.** PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves makes freeness of H^i(X_k̄, 𝕄) depend on H^i(X_k̄, 𝕃) being torsion free. Since p is a unit in B_dR^+, the tensor product is free in all cases.

## 4. Mistakes in the paper: 21 of 21 confirmed

Every entry was checked at its locator in the published text, and E2 on the 300 dpi page image, where γ₁ is printed.

**Corrected in the 2016 corrigendum (E3–E8, E14).** Each printed text is the one the corrigendum quotes and changes:
- Proposition 3.7(i);
- the covers of Definitions 3.3, 3.4 and 3.9;
- Corollary 3.8, which the corrigendum calls a proposition;
- the last sentence of Proposition 3.13, and the proof line that uses it;
- the definition of 𝒪𝔹⁺_dR in 6.8(iii).

**E13, redone.** In the resolution of Ô_X(j), the term gr^{j−m}𝒪𝔹_dR ⊗ Ω^m sits in degree m. Proposition 6.16(ii) makes R^qν_* of it nonzero only for m = j and q ∈ {0, 1}. So R^{j+1}ν_*Ô_X(j) = Ω^j·log χ, and for j = 0 this is 𝒪·log χ, of rank one, not Ω¹·log χ.

**The misprints** (E1, E2, E9–E12, E15–E21) are as recorded:
- **E17:** Corollary 5.12 is stated over Spa(ℚ_p, ℤ_p).
- **E18:** Lemma 6.12 is stated over Spa(W(κ)[1/p], W(κ)).
- **E20:** Theorem 8.8(ii) applies "de Rham" on smooth, non-proper X and Y.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. Every change is listed in `notes` and in the report's new section "Corrections by the independent review".
