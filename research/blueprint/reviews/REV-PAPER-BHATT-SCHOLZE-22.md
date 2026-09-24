# Review: PAPER-BHATT-SCHOLZE-22 (Bhatt–Scholze, Prisms and prismatic cohomology)

Job `REV-PAPER-BHATT-SCHOLZE-22` (issue #1104), by Claude Code, session `cc-38267a`, 24 September 2026. The extraction was written by Claude Code, session cc-7b31c4. That session's own review (#2391) was closed by the maintainer as not independent; I did neither the extraction nor that review, and did not use its branch. **Verdict: accept**, after the corrections below, which were made in place. All six routes are accepted as corrected: the first was rewritten, and five are new.

**Disclosure.** My red team of the p-adic area, RT-AREA-padic-1, has a finding (/1) about BS22 §8.2 and §§10.1–10.2: that no stage plans them, and that a late perfectoidization stage is needed. That red team is not this extraction or a review of it. Route 3 below reaches a similar conclusion. The checker who settled the routes was told to treat the finding as unverified and to re-derive it; it did so, and also found that the proposed stage PerfectoidQuotients:Q5 does not exist. I checked the cycle claims myself on `data/atlas.json`.

## What was read

- **arXiv:1905.08229v4** (12 January 2022, 125 pp.): the PDF (SHA-256 1d91a6eb…, equal to the record) and the TeX source of the v4 e-print (prisms.tex, 3815 lines, and prisms.bbl).
- **The published version.** It is not publicly available. The Annals article page (Volume 196, Issue 3, pp. 1135–1275) lists no erratum.
- **Four checkers:**
  - K1: §§1–6.
  - K2: §§7–12.
  - K3: §§13–18 and the thirteen prerequisites; it resolved the DOIs and compared them with prisms.bbl.
  - K4: the status and route of every item. It worked from `data/atlas.json`, the proposed roadmaps, the accepted restructurings and red-team verifications, the library audits and the accepted extractions.
- **How they checked.** Formulas were checked in the TeX and on rendered pages, never from the text layer. Every cited declaration was opened at Mathlib 082e2d3 and Tau Ceti f790474; I also verified each against a declaration index of the pinned trees.
- **What I did myself.** I re-read every new mistake at its TeX line. I checked the dependency claims (PR.4 can import RT.6; P3 and P0 are upstream of Q2, Q4 and PR.2) on the stage graph.

## Items

96 items became **148 (1 library, 121 planned, 26 missing)**. Every changed item's note records the change.

### Splits (31 new items)

The extraction bundled separately proved, separately used results into single items. They are now split:

| Item | Split into |
|---|---|
| 3 | 3, 3b |
| 4 | 4, 4b–4d |
| 8 | 8, 8b, 8c |
| 9 | 9, 9b, 9c |
| 10 | 10, 10b, 10c |
| 11 | 11, 11b, 11c (Lemma 2.35 added to 11) |
| 12 | 12, 12b, 12c |
| 17 | 17, 17b, 17c |
| 25 | 25, 25b (Lemma 4.8) |
| 31 | 31, 31b, 31c |
| 37 | 37, 37b (Corollary 15.4) |
| 52 | 52, 52b, 52c |
| 59 | 59, 59b |
| 69 | 69, 69b (Lemma 13.2) |
| 70 | 70, 70b (Corollaries 14.2–14.3) |
| 81 | 81, 81b, 81c |
| 84 | 84, 84b (Theorem 18.2), 84c (Lemma 18.3) |
| 86 | 86, 86b (Elkik) |
| 95 | 95, 95b (K ≃ TC) |

### Statement corrections (the material ones)

- **4d.** Lemma 2.18 needs I finitely generated and containing p.
- **17b.** Lemma 3.7 is stated with "derived (p, I)-complete" (E10).
- **30.** B₀ is the completion of a polynomial algebra, not merely completely smooth; weak initiality uses the lift B₀ → D.
- **31b.** Lemma 4.21 is about ∆̄, which is an R-module; ∆ is not.
- **35.** The hypotheses of Construction 6.1 and the construction itself are now stated.
- **37.** The cdga clause was removed; it is only asserted in Theorem 1.8(3).
- **41.** The hypothesis is on ∆̄_{R/A}. The initial object is a retract of ∆_{R/A}, not the reverse.
- **46, 54.** φ_* in place of φ^*.
- **57.** J need only be derived p-complete.
- **67.** The Nygaard coefficient is [p]_{q^{1/p}}^{n−⌊i⌋}, not [p]_q^{(n−⌊i⌋)/p}.
- **68.** The resolution is the Čech nerve of B → B̃.
- **71.** Lemma 14.5 holds for any perfectoid R.
- **75.** The direction of V_i was reversed, and the bars were spurious.
- **76.** The relative THH is over the spherical 𝕊[u], not 𝔖[u].
- **83.** §17 assumes only a perfectoid field containing μ_{p^∞}.
- **88.** The library claim was narrowed: Mathlib has W(R), its completeness and Teichmüller series, but not W(R) as the unique lift (a TODO in TeichmullerSeries.lean).
- **Standing hypotheses.** They were added throughout §§4, 15 and 16, and the Breuil–Kisin example got its hypotheses (E8).

**Other fixes:**

- Missing parts added:
  - Construction 7.6(5) (item 40);
  - Theorem 1.16(1) (item 74);
  - Example 1.9(4) (item 82).
- Notes that said false things were corrected:
  - the Examples 7.12–7.13 covers are not "used throughout §§12–15" (44);
  - Lemma 10.12 is an input, not stated "for its own sake" (62);
  - Remark 10.13 reproves Heitmann–Ma, not Hochster–Ma (63);
  - the proof of Theorem 11.1 (64).

### Statuses

- **Planned citations corrected on twenty items:**

  | Change | Items |
  |---|---|
  | Q0 → its substage Q0:animated-application | 3 |
  | DD.0 → DD.1 | 12 |
  | DD.0 → DD.5 | 38 |
  | RT.3 → RT.6, the owner of the trace-to-prismatic comparison | 69, 70, 76 |
  | RT.3 → RT.2 and RT.6 | 95 |
  | E5 → E5:animation | 87 |
  | Tau Ceti AdicSpaces Layer 5 → Adic Spaces Part II R2, Tau Ceti AdicSpaces Layer 3, AdicEtaleGeometry A1 and ClassicalAdicEtaleCohomology H1 | 96 |
  | Q0 → Q0:integral-algebra | 89 |

  Consumer stages cited as planners were removed: Q0 (19), HQ.1 (82), AI.7 (94), PR.2 (87) and AI.1 (85).
- **Two items became missing:**
  - **47 (Proposition 8.5).** Its proof uses Theorems 7.4 and 7.14, which are at Q4 and Q3, downstream of PR.2.
  - **53 (the étale comparison).** PR.4 plans it only "for a perfect base prism and the smooth formal scheme of BS22 §9", but the theorem has "no restrictions on the singularities of X".
- **Library citations.** Partial citations were added to 85, 86, 88, 89, 90 and 91; all were checked at the pin.
- **Items kept as planned against checker K4.** For these, the stage texts do not name the result, but the stages list the section among their sources and the result is inside their described scope. I kept them planned and said so in each note:
  - at PR.0: 4, 5, 10, 20;
  - at PR.1: 29, 33, 35;
  - at PR.3: 72;
  - at PR.4: 56, 64, 70, 71.

  This matches the accepted PAPER-BHATT-MORROW-SCHOLZE-19/068, which has Theorem 14.1's conjecture planned at PR.4. The dependencies were checked: PR.4 may import RT.6, and the Part II of route 3 exports to PR.4.

### New items (97–117)

**Missing:**

- simplicial commutative δ-rings (97);
- the de Rham complex of a p-completely smooth formal scheme (102);
- coconnectivity of perfectoidization, Lemma 8.4 (110);
- Tor-independence of perfectoid rings (111);
- the Bhatt–Mathew arc inputs (112);
- Huber's comparison of Spec S[1/p] with Spa(S[1/p], S) (113).

**Planned:**

- rank-one elements (98);
- W(F_p[x]/(x²)), a δ-ring that underlies no prism (99);
- the Frobenius-twisted Witt maps of the de Rham comparison (100);
- the Cartier isomorphism (101);
- perfectness for proper X (103);
- the A_crys comparison of Example 1.9(2) (104);
- Lemma 7.8 (105);
- Remark 7.5 (106);
- Examples 7.12 and 7.13 (107, 108);
- Example 8.3 (109);
- Proposition 12.8 (114);
- the syntomic complexes ℤ_p(n) (115);
- the comparison map μ_R: qΩ → AΩ (116);
- Remark 15.6 (117).

## Routes

1. **Source of PrismaticCohomology [PR.0, PR.2, PR.4]: accept as rewritten.**
   - It now carries what those layers do not already plan:
     - PR.0: 97 and 111;
     - PR.2: 48 (Lemma 8.6), 110, 52b and 52c;
     - PR.4: 53.
   - Descendability itself is not new to the atlas: the accepted PAPER-BHATT-SCHOLZE-17 route 6 put it in E5:abstract, and that route's reason names this item.
   - The former route's claim that nothing plans the arc-topology or descendability was out of date.
2. **ArcTopologyAndDescent (a "new" route reusing the accepted id): accept.**
   - Items 49 and 50 (Definition 8.7, Lemma 8.8, Remark 8.9, Proposition 8.10), 112 and 113.
   - Five accepted routes already use this roadmap. One of them (Česnavičius–Scholze route 5) asks for BS22 Proposition 8.10.
   - Putting the arc statements in PR.2 would close a cycle through GeometricSatakeAndFusion GS0:Witt-geometry, which the Bhatt–Mathew brief imports.
3. **PerfectoidQuotientsPartIIIntegralPerfectoidization (new Part II, area padic): accept.** It replaces the former routes 2 and 3.
   - Items: 47, 51, 52, 57–63 (Proposition 8.5, Corollaries 8.11–8.12, §10).
   - Q2 is the wrong home, because Theorem 10.11 needs Theorem 10.9, which needs André's lemma (Q3). §10.1 needs Theorem 7.4 (Q4).
   - P0 and P3 are the wrong homes, because both are upstream of PR.2, Q2 and Q4, so an edge into them would close a cycle. P3 also plans a different theorem (ECD 6.1 over perfectoid Tate rings, by a different proof), and RS-05 narrowed P0 to abstract almost algebra.
   - The brief states Theorems 10.9 and 10.11, Corollaries 8.11 and 8.12 and Proposition 8.5 as printed. It imports PR.2, Q2–Q4, ArcTopologyAndDescent and P0, and exports to PR.4 (Theorems 9.1 and 11.1) and P8.
4. **RefinedTraceMethodsPartIIHenselianPairs (reused accepted Part II): accept.**
   - Items 70b (Corollaries 14.2–14.3) and 95b (K ≃ τ_{≥0}TC for rings henselian along p).
   - These had been planned at RT.3, which is the Dennis/cyclotomic trace.
5. **Source of DerivedDeRhamCohomology [DD.1, DD.2]: accept.**
   - 86b (Elkik's algebraization) and 102 (the de Rham complex).
6. **Source of PerfectoidSpaces [P0]: accept.**
   - 59b (Proposition 10.8, André's Proposition 1.9.1 in an abstract basic setup).

Every missing item is taken by exactly one route (check_paper).

## Mistakes in the paper

I looked for existing corrections in three places: the arXiv abstract page (v1–v4, with v4's comment "further updates"), the Annals article page (no erratum) and the authors' pages (no corrected version).

**Recorded mistakes:**

- **E1** (Corollary 15.4, Ω^*_{R/(A/I)} for Ω^*_{X/(A/I)}): **confirmed.** Item 37b carries the correction.
- **E2** (Example 7.12, "A/ItoD/IC"): **confirmed.** TeX l. 1895 has `$A/I to D/IC$`.
- **E3** (Remark 2.37, D_{(x)}(ℤ_(p))): **confirmed.**
- **E4** (Theorem 1.8(3), "algberas"): **confirmed.** Its reason was corrected: it had cited part (3), the part with the typo, as spelling the word correctly.

**New mistakes, E5–E30, all confirmed at the TeX.**

- **E10 (error, affects nothing).** Lemma 3.7(2)–(3) omit "derived (p, I)-complete". Without it the statement is false: over (ℤ_p, (p)), ℚ_p is p-completely flat but not classically complete. Every later use is on complete objects.
- **E13 (gap, affects nothing).** Construction 6.1 says the universal oriented prism has flat Frobenius on A/p. Example 3.4 proves only d-complete flatness, and that is all the construction uses.
- **E23 and E25**, misprints in stated results:
  - E23: Proposition 12.10 prints gr^i_N ≅ τ^{≤i}∆ without the bar. That version fails at i = 0.
  - E25: Corollary 15.5's last display swaps the source and target of V_i.
- **The remaining misprints:**
  - E5, E6: the initial prism and the absolute site;
  - E7: six hand-typed environment names;
  - E8: Example 2.20(4) omits its hypotheses;
  - E9, E11, E12, E14: slips in §§2–6;
  - E15–E22: slips in §§7–12, among them the swapped X and Y in the proof of Proposition 8.10, a negative exponent in §10.1, and ∏[ip]_q! for ∏[ip]_q;
  - E24: "degrees 0 and −1" for "0 and 1";
  - E26: Remark 15.6's missing shift;
  - E27–E30: slips in §§14, 16, 17 and 18, among them a garbled Frobenius expansion.

**Proposed by checkers but not recorded:**

- **The cdga upgrade of Theorem 1.8(3).** K1 called it a gap, because no proof is written out. It follows by reducing φ̃ of Theorem 15.3 modulo I (as in Corollary 15.4's proof) and applying Theorem 4.11, so I did not record it as a mistake. Item 37 says so.
- **Ω¹_{P/S} in Construction 16.19.** It is defined there by ":=", so it is notation, not a misprint.

## Prerequisites

Corrected against prisms.bbl:

- **"Hochster–Ma"** is Heitmann–Ma, *Extended plus closure in complete local rings* (J. Algebra 571, 2021), with a new link.
- **André's two IHÉS papers** are split, each with its own DOI.
- **The crystalline entry** named Timmerscheidt and Berthelot–Ogus, whom the paper does not cite, and had a DOI that does not resolve. It is replaced by Berthelot, LNM 407 (used in Theorem 5.2), and Fontaine–Messing.
- **Missing issue numbers and DOIs** were added: Clausen–Mathew–Morrow and Scholze.
- **Rezk** now has the paper's title and PDF URL.
- **The "why" texts** were updated:
  - Bhatt–Lurie is cited only in footnote 9 and Remark 9.5;
  - Elkik is named in the paper but not in its bibliography;
  - Bhatt–Mathew, Mathew and Clausen–Mathew–Morrow are now covered by accepted extractions.
- **Not added:** two references that §17 uses, Bhatt's *Specializing varieties…* and *Cohen–Macaulayness of absolute integral closures* (arXiv:2008.08070). I did not add them as prerequisites, because I did not verify their metadata.

## For the maintainer

- **Shared design ids.** Routes 2 and 4 reuse design ids shared with later papers in papers.json:
  - ArcTopologyAndDescent (with Bhatt–Mathew, Česnavičius–Scholze, Guo–Reinecke, Bhatt–Scholze 2017 and Clausen–Mathew–Morrow);
  - RefinedTraceMethodsPartIIHenselianPairs (with Clausen–Mathew–Morrow and Bhatt–Morrow–Scholze 2019).

  make_queue.py keeps only the last brief for each id, so these items must be merged by hand.
- **Route 3 and the red-team fix.** Route 3 is the protocol form of RT-AREA-padic-1/1's proposed Q5. If the red-team fix creates Q5 first, route 3 should become a source route to it.
- **Inconsistent precedents.** PAPER-GUO-REINECKE-24/014 marks BS22 Proposition 8.10 as planned at PR.2, but PR.2 contains no arc text.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-SCHOLZE-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: no problems.
- The result keeps the file's serialisation (indent 1, trailing newline).
- No Lean file belongs to this job, and none was compiled.
