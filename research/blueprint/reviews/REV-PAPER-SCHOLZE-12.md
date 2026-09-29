# REV-PAPER-SCHOLZE-12: review of the extraction of Scholze, *Perfectoid spaces*

**Verdict: accept.** Five routes are accepted and one is rejected; three of the accepted routes are corrected in place.
- Six items marked missing were already planned by blueprint packets on main. They are now planned.
- Route 3 is rejected, because its only item is planned elsewhere.
- Two briefs are corrected.
- Of the 11 recorded mistakes, 9 are confirmed and 2 rejected (E5, E9). No new mistake was found.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-39fac3` (PR #4556, issue #4544). It had 153 items (13 library, 106 planned, 34 missing), 6 routes and 11 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Sources:
- **Published version.** Publ. Math. IHÉS **116** (2012), 245–313, doi:10.1007/s10240-012-0042-x, the [Centre Mersenne PDF](https://pmihes.centre-mersenne.org/item/10.1007/s10240-012-0042-x.pdf) (69 pages). Its SHA-256 `7e7f7a3b…814a` matches the recorded hash. PDF page 1 is printed page 245.
- **Preprint.** [arXiv v1](https://arxiv.org/pdf/1111.4914v1). Its SHA-256 `065441a8…8e7b` matches as well.

## 1. Items: complete and accurate

- **Coverage.** A script read the numbered statement headers from the published text layer: 95 of them. Every one appears in an item. The one apparent miss, Lemma 5.7 on p. 275, is covered by item 63, "Lemmas 5.6–5.7 and proofs".
- **Locators.** The locators that cite a numbered statement point to the right page.
- **Statements.** I compared these items with the page text: Lemma 7.3, Propositions 8.6 and 8.7, Corollary 8.8, Proposition 9.1, Lemma 9.5 and Theorem 9.6. They match, with the recorded misprints corrected.
- **Not read.** I did not read every proof in the 69 pages. I read the statements, and every page that carries a source issue.

## 2. Statuses: six corrected

**Library.** All declarations cited by the 13 library items are in the pinned index. I opened three at Tau Ceti f790474, and each provides its item:
- `TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`;
- `TauCeti.ValuationSpectrum.spa_eq_empty_iff_subsingleton_quotient_closure_zero`;
- `TauCeti.Huber.IsStronglyNoetherian`.

The toric carriers `TauCeti.Toric.IsToricCone` and `TauCeti.Toric.Fan` are also in the index.

**Planned and missing.** For each missing item I searched the stage texts and every blueprint packet on main (143 files). The extraction compared the paper with the stage texts and the 33-node PerfectoidSpaces decomposition. It missed three packets that were already merged:
- `PerfectoidSpaces--P0.json`: 324 nodes over P0–P7, #3097, 26 September;
- `AdicSpacesPartII.json`: 537 nodes, review accepted;
- `ClassicalAdicEtaleCohomology--H0.json`: H0–H3, #3281, 27 September.

These packets plan six of the missing items.

| Item | Statement | Now planned by | Packet node |
|---|---|---|---|
| 2 | Galois groups under completion and perfection | PerfectoidSpaces:P3 | P3/fontaine-wintenberger, which cites P3/henselian-finite-etale-approximation (b) and P3/finite-etale-under-completed-perfection |
| 5 | Remark 1.11, Faltings's almost purity | PerfectoidSpaces:P3 | acceptance criterion of P3/almost-purity-theorem |
| 71 | Remark 5.14, W(R) as the unique deformation | PerfectoidSpaces:P1 | acceptance criterion of P1/cotangent-complex-vanishing-mod-varpi |
| 25 | Huber's rigid–adic comparison (Theorem 2.21) | AdicSpacesPartII:R1 | R1/rigid-adic-comparison-functor, R1/rigid-adic-quasi-separated-equivalence, R1/rigid-adic-topos-equivalence |
| 26 | formal models, X ≅ lim 𝔛 (Theorem 2.22) | AdicSpacesPartII:R2 | R2/specialisation-map (v), R2/raynaud-theorem (e) |
| 27 | taut spaces and Berkovich spaces (Theorem 2.24) | ClassicalAdicEtaleCohomology:H3 | H3/taut-spaces-and-morphisms, H3/berkovich-taut-comparison (a), which quotes Sch12 Theorem 2.24 |

The counts are now 13 library, 112 planned and 28 missing.

**Checked and still missing.**
- Item 23, the universal property of maps into Spa(R, R⁺). Foundations of adic spaces Layer 5 and the AdicSpacesPartII packet state universal properties for gluing, quotients, completed tensor products and analytification, but not this one.
- Items 31 and 33, points and specialisation in terms of field pairs.
- The 16 toric items and the 9 weight-monodromy items.

## 3. Routes: five accepted, one rejected

- **Route 1** (source PerfectoidSpaces P1, P3). **Accept, reason corrected.**
  - All three items are now planned by the packet. The route stands as a source route naming planned items, which §16 allows. Sch12 is their source, and Remark 1.11's sketch has to be written out.
  - The old reason called PerfectoidSpaces/E23 "the gap the atlas records". REV-PerfectoidSpaces--P0 **rejected** that finding.
- **Route 2** (source AdicSpacesPartII R0–R2). **Accept, reason corrected.** Item 23 is the one missing item and belongs in R0. Items 25 and 26 are planned by R1 and R2.
- **Route 3** (source TropicalAndBerkovichArithmetic TB.0). **Reject.** Item 27 is planned by ClassicalAdicEtaleCohomology H3, so routing it into TB.0 would plan it twice. The route is left in the file so that the route numbers stay fixed.
- **Route 4** (source AdicEtaleGeometry A1). **Accept.** No stage or node states Propositions 2.27 or 2.29, and A1's insistence on field pairs (K, K⁺) of higher rank makes it the owner.
- **Route 5** (Part II `AnalyticToricGeometryNonarchimedeanPartII`). **Accept, brief corrected.**
  - **Coalescence.** BKV route 14 has the same id, title, parent and area. Its review rejected it only for the missing G12 leaves, and this brief supplies them from §8.
  - **Extension, not re-planning.** Tau Ceti's Analytic toric geometry builds its affine toric schemes over ℂ (Layer 0, item 7), so this is an extension.
  - **Correction 1.** *Toroidal compactifications and boundary geometry* C0 already plans affine toric charts over the base rings of integral models, with face open immersions (C0/relative-torus-embedding, C0/relative-face-open). Leaf (1) now imports them, and the import list names ShimuraCompactifications C0.
  - **Correction 2.** Theorem 1.5 is obtained from Theorem 8.5(iii) for ℙ¹, not by an exhaustion (see E9).
- **Route 6** (Part II `DeligneWeightsPartIIWeightMonodromy`). **Accept.**
  - **Why a Part II.** No stage or node defines or proves weight-monodromy in mixed characteristic. DWP.5 says it is not the mixed-characteristic conjecture, and R34.6 that the general conjecture is no assumption.
  - **Imports.** Every named import exists in the atlas.
  - **Wording fix.** The brief now says the Galois-group invariance is planned in P3, not routed there.
  - **For the design job.** The predicate is Taylor–Yoshida purity of a Frobenius-semisimple Weil–Deligne representation. R24.5 ("strictly pure") and AG2.6 use the same notion, and no stage text or packet API defines it.

## 4. Mistakes in the paper: 9 confirmed, 2 rejected

Every entry was checked at its locator in the published text, and against arXiv v1 where the locator gives it.

**Confirmed.**
- **E1** (p. 307): exp(N t_ℓ(g)) for exp(N t_ℓ(σ)).
- **E2** (p. 297): the fibre product in Lemma 7.3(i), (iii) is over Y; PerfectoidSpaces/E22 is the same finding.
- **E3** (p. 297): "over k" for "over K" in Lemma 7.3(iii).
- **E4** (p. 293): "zero" for "empty"; PerfectoidSpaces/E14 is the same finding.
- **E6** (p. 272): "The rest is easy" hides the uniform bound of an almost-Nakayama argument; PerfectoidSpaces/E4 is the same finding.
- **E7** (p. 261): Spa(R[1/p], R) where k may have characteristic p, so R[1/ϖ] is meant.
- **E8** (p. 309): Lemma 9.5 never introduces i.
- **E10** (p. 282): the proof needs a finite R°-subalgebra; a merely finitely generated one need not be integral or bounded.
- **E11** (p. 306): h = g^{p^N} is a section of 𝒪(p^N D), not a regular function.

**Rejected.**
- **E5.** The reduction after Theorem 1.1 is correct and rests on two textbook facts: Krasner's lemma for the henselian field ℚ_p(p^{1/p^∞}), and the invariance of the absolute Galois group under a purely inseparable extension. Leaving them implicit in an introduction is not an inadequate proof. The atlas record that E5 cites as already known, PerfectoidSpaces/E23, was rejected by REV-PerfectoidSpaces--P0 for this reason.
- **E9.** Theorem 8.5 holds for the complete fan of ℙ¹, for which X^ad_Σ = (ℙ¹)^ad (p. 304: "if X_Σ is proper, then X_Σ^ad = X^ad_Σ"). φ(x_0 : x_1) = (x_0^p : x_1^p) preserves ∞ and 𝔸¹ at every level. So the homeomorphism of 8.5(iii) restricts to |𝔸^{1,ad}_{K♭}| ≅ lim_φ |𝔸^{1,ad}_K|, which is Theorem 1.5.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. Every change is listed in `notes` and in the report's new section "Corrections by the independent review":
- the six item statuses and their notes;
- the notes of items 4, 120 and 145;
- the reasons of routes 1, 2 and 5;
- the briefs of routes 5 and 6;
- the eleven `review` verdicts.
