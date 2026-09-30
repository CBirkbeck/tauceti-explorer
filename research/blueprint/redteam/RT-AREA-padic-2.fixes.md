# RT-AREA-padic-2: fixes

Fixer: Claude Code, session `cc-48533a`, 29 September 2026. Issue #3976, job FIX-RT-AREA-padic-2.

- **Findings.** `RT-AREA-padic-2.result.json`. This job takes the 36 confirmed findings of high or medium severity, /1–/36.
- **Verdicts.** `RT-AREA-padic-2.review.json`. It rejects /38 and /41, and /37–/46 are low severity, so none of these is in this job.

This job's only deliverable is this report. The queue gives it no atlas, packet, restructuring or paper file to edit; its `outputs` list has only this file. Each fix is therefore written as exact edits for whoever owns the file:

- the maintainer, for stage texts, stage edges, the READMEs and paper routes;
- the restructuring jobs, for owners entries and links;
- the blueprint or design jobs, for packet and decomposition nodes and Part II briefs.

Where a finding's own fix turned out to be wrong, already applied, or in conflict with another fix, the section says so and gives the fix that works.

These fixes build on the fixes for the sister findings, RT-AREA-padic-1 (`RT-AREA-padic-1.fixes.md`, merged in PR #4645). Several reuse the stages proposed there:

- AInfCohomology:AI.2:essential-surjectivity;
- RelativeFarguesFontaine:RF0:crystalline-end;
- PadicHodgeTheory:P8:primitive;
- PadicHodgeTheory:R06.1 as owner of B_dR⁺(C).

Section /3 amends two edits of padic-1/24. They must be applied together with that report (see C10 below).

All checks ran on origin/main (e9e99604–53d76f83, 29 September 2026).

- **Quotes.** Every quoted "current text" was matched once against its file.
- **Acyclicity.** Every new stage edge was checked alone, with the other sections' edges, and with padic-1's changes. The check used several graphs, each tested with every alternative and conditional edge added:
  - `data/atlas.json` stageEdges (3508 edges);
  - with the links of the accepted restructurings as `scripts/restructure.py` applies them;
  - with RS-20;
  - with the parent–sub-stage edges that `scripts/theory_graph.py` adds;
  - the full graph that `scripts/build.py` assembles;
  - with placeholder nodes for Part II roadmaps not yet in the atlas.

  None has a cycle.
- **Conflicts.** The joint pass found nine conflicts between sections. They are resolved at the end, and the affected sections are marked "Adjusted by the joint check".

New stages proposed here:

- CrystallineCohomology:CR.5:quasi-coherent (/14);
- LanglandsParameterStacks:LP1:stacks (/29);
- PadicHodgeTheory:R06.1:tate-sen (/20, imported by /5).

## Overview

| Finding | Outcome |
|---|---|
| /1 Fargues' theorem in AI.2 | Builds on padic-1/18–/19. The Lecture 13 steps go to VB2:classification and Kedlaya's theorem to RD.1 (C8). BMS1 Lemma 4.27 moves to AI.2:essential-surjectivity. New edges come from VB0, VB4 and RD.1. |
| /2 de Rham and PD de Rham complexes | The ordinary complex moves from DD.2 to DD.0 and the divided-power complex to CR.2. New edges DD.0 → C5, RT.1 and M.5d. |
| /3 primitive comparison and BMS1 5.7 | Builds on padic-1/24's P8:primitive, whose edge to AI.4 becomes edges to AI.5, AI.6 and CP.4. AI.4 is restated as the local comparison; AI.5 owns BMS1 Thm 5.7 and 14.3(iv). |
| /4 Kisin theory in R07.4 | Stage text for the Kummer tower, finite E-height modules and full faithfulness. Edges from P7:annulus-foundations, PG.0, PG.1 and RD.2, and R07.4 → PR.7. |
| /5 Tate and Raynaud §4 | R07.1 gains the invariant-differential length and Raynaud 4.1.1, and R07.2 gains Raynaud 4.2.1. Tate's Theorem 2 is imported from R06.1:tate-sen (C1). Faltings' citations are corrected. |
| /6 PR.4 and BS22 Thm 9.1 | PR.4 is restated for every p-adic formal scheme over a perfectoid ring, with Lemma 9.2 and Remark 9.3, and a warning that this is not a syntomic comparison. |
| /7 Bhatt Theorem 7.22 | DD.6 is rewritten around the corrected definition (a strict regular-sequence quotient with flat intermediate ring). A sourceIssue DerivedDeRhamCohomology/E4 is drafted. |
| /8 Langer–Zink over any Z_(p)-algebra | The CR.4 paragraph is rewritten; the BMS1 route already sends §10 to CR.4. |
| /9 AI.3 vs P8:local-rational | AI.3 is restated for locally noetherian X with W(Ô⁺) and A_inf,X kept separate. Three decomposition nodes move to AI.3, with new edge P7 → AI.3. |
| /10 rational comparison in AI.3 | Moves to P8:local-rational, in the erratum's order; AI.3 keeps the corrected covers. |
| /11 BMS1 Proposition 13.21 | Owner is CR.3:Frobenius-isogeny, with edges to AI.5 and CP.2. |
| /12 classical Cartier isomorphism | Owner is DD.3, with edges DD.3 → CR.4 and DD.3 → M.5d. |
| /13 AI.6 suppliers | Edge CP.3 → AI.6. AI.6 imports CP.3 and proves Česnavičius–Koshikawa Thm 6.6. |
| /14 Beilinson's log setting | New stage CR.5:quasi-coherent, feeding AI.6. |
| /15 Koszul complex | Single owner DD.1, with the shift by d. AI.1 and IHG.6 import it, via new edge DD.1 → IHG.6. |
| /16 log Hodge–Witt sheaves | CR.4 gains the sheaves, Illusie's sequence and R − F in the étale topology. Edge CR.4 → PR.4, plus edits to PR.4, HL.2 and the CMM extraction. |
| /17 AI.0 and Mathlib | The Mathlib declarations are named with their hypotheses, and principality of ker θ is imported from P1. |
| /18 weakly admissible ⇒ admissible | The statement stays in R06.2 and the proof (Berger's route) goes to R06.3, because the proof chain uses RD.2 and Berger 2002 Thm 3.6. |
| /19 Berger's bridge | Edges PG.2 → R06.3 and R01.2 → R06.3. R06.3 constructs the bridge and 23 bridge nodes move there from P7. |
| /20 Tate–Sen | New early sub-stage R06.1:tate-sen, fed by R01.1 and Tau Ceti LocalFieldsRamification Layer 3, feeding R06.1, R07.1 and R28.2. It avoids the cycle that R06.1 → R07.1 would close. |
| /21 B_dR⁺ duplicate | R06.1 imports P1's θ-kernel theorem and keeps Scholze's uniform ξ and the filtration. The RF2 half is padic-1/20. |
| /22 R06.5 vs R19.5 | The modular-curve, Kuga–Sato and Shimura-curve applications move to R19.5, with edges R06.6 → R19.5 and R06.3 → R19.5 (the finding's "no edge" was wrong). |
| /23 CP.4–CP.6 suppliers | Edges PR.8 → CP.4, R06.4 → CP.5, PR.4 → CP.6, EDC.3 → CP.6 and CP.6 → R06.6. PR.4 owns the first Chern classes of Bhatt–Lurie §§7–8, and CP.6 owns §9 (C7). |
| /24 arc_p and perfectoidization in PR.4 | Requests to ArcTopologyAndDescent and the PerfectoidQuotients Part II, with future edges to PR.4. PR.2's sources are narrowed; an arc edge into PR.2 would close a cycle. |
| /25 étale comparison inputs | Edges SF.2, H0 and H1:henselian → PR.4. The perfectoid Spec/Spa case stays with the arc roadmap. |
| /26 Cartier isomorphism in PR.1 | Edge DD.3 → PR.1. |
| /27 BS22 Theorem 6.4 | PR.1 keeps it with its hypothesis; PR.3 gets Corollaries 15.4–15.5. No edge change. |
| /28 prismatic duplicates | Twists and the prismatic logarithm go to PR.3, absolute cohomology and the Nygaard filtration to PR.5, and syntomic complexes to PR.4. Edge PR.5 → PR.4. |
| /29 Bhatt–Lurie stacks for PR.5 | New sub-stage LP1:stacks rather than LP1 → PR.5, which would add 8–12 ancestors. Edge SF.1 → PR.5. |
| /30 PR.7 suppliers | Edges from C2, VB2:classification and RF0:crystalline-end. Kisin's full-faithfulness results are owned by R07.4 (C3). |
| /31 RD.0 duplicates carriers | RD.0 imports the Robba and dagger carriers from P7:annulus-foundations and F1. P7's text is generalised. |
| /32 AG2.4 and rigid cohomology | New RD.4 and RD.6 nodes (Grosse-Klönne, Chiarellotto). Edges RD.4, RD.5 and RD.6 → AG2.4. |
| /33 étale covers and alterations | Already planned at RD.3 and L5. Adds edge L5 → RD.5 and the texts. |
| /34 p-adic Grothendieck–Ogg–Shafarevich | New RD.6 nodes (Christol–Mebkhout, Irr = Swan). R01.3 is extended to k((t)), with edge R01.3 → RD.6. |
| /35 perfectoid supplier for DD.5 | Edge Q0:integral-algebra → DD.5. |
| /36 PD comparison duplicate | DD.4 owns Bhatt Lemma 3.39, Corollary 3.40 and Theorem 3.27. CR.0 keeps Lemmas 3.37–3.38. |

## /1 (high, error): AInfCohomology:AI.2 cites a BMS1 proof of Fargues' theorem that BMS1 does not contain

**The finding and the verdict.** AInfCohomology:AI.2 plans both directions of Fargues' equivalence and cites "Theorem 4.28 and its proof". BMS1 only states Theorem 4.28, refers to Scholze–Weinstein for the proof, proves full faithfulness in Remark 4.29, and proves Lemma 4.27 only by citing Fargues–Fontaine, Corollaire 11.1.14. The verifier confirmed this and asked to "assign these proof leaves to the existing RF/VB owners or an early extension of them, keeping the actual finite-free equivalence at AI.2", to "Add the acyclic VB0 input, but reuse Mathlib's WittVector.Isocrystal/IsocrystalHom/IsocrystalEquiv carriers", to "explicitly obtain FF Corollary11.1.14" for Lemma 4.27, and not to narrow AI.2 "without moving the essential-surjectivity obligation and checking PR.7's demand". RT-AREA-padic-1/19 already splits AI.2 into AI.2 (BKF category and full faithfulness) and a new AInfCohomology:AI.2:essential-surjectivity, and RT-AREA-padic-1/18 adds RelativeFarguesFontaine:RF0:crystalline-end, which owns Kedlaya's Theorem 14.2.1 and Proposition 14.2.6. This fix builds on both. It adds what they leave open: owners and imports for the Lecture 12–13 proof leaves, the VB0 input, and Lemma 4.27. It also corrects one sentence of /19's new stage text.

**Checked.**
- content/campaign/AInfCohomology/README.md l. 102–114: "Construct both directions, full faithfulness and tensor/Tate-twist compatibility using the analytic annulus/patching arguments of BMS1 §4" and "Source: BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28 and its proof." (once in the README, once in the AI.2 atlas description). Atlas requires of AInfCohomology:AI.2: AInfCohomology:AI.0, PadicHodgeTheory:P7:annulus-foundations, PadicHodgeTheory:R06.1, RelativeFarguesFontaine:RF4:vector-bundles.
- BMS1 (arXiv:1602.03148v3), p. 42: "The main theorem about Breuil–Kisin–Fargues modules is Fargues' classification; we refer to [61] for a proof". Lemma 4.27 "works whenever K is of characteristic 0"; its proof is "This follows from a result of Fargues–Fontaine, [31, Corollaire 11.1.14]", followed by "in geometric situations, the ϕ-equivariant isomorphism … is canonical, cf. Proposition 13.21". Lemma 4.26's proof opens "As C♭ is an algebraically closed field of characteristic p, finitely generated W(C♭)-modules with a Frobenius automorphism are equivalent to finitely generated Zp-modules". Remark 4.29 (p. 43) proves full faithfulness.
- Scholze–Weinstein, Berkeley Lectures (27 March 2020), proof of Theorem 14.1.1 (printed p. 116): "The equivalence between (1) and (2) is Theorem 12.4.6" (it is Proposition 12.4.6). Then (2)↔(3) uses Corollary 13.5.5 and the Beauville–Laszlo lemma. Then "In the last lecture, we proved the equivalence between (1) and (4). By Theorem 14.2.1 below, categories (4) and (5) are equivalent." So BKF modules (5) reach pairs (T, Ξ) (2) through Theorem 14.2.1, Lecture 13 and Proposition 12.4.6. Corollary 13.5.5 and GAGA (Theorem 13.5.6) are used only for the curve description (3).
- Lecture 13. Theorem 13.2.1 ("[FF18, Théorème 11.1.9, Corollary 11.1.13]"): restriction of φ-modules from Y[r,∞] to Y[r,∞) is an equivalence. Remark 13.2.2 glues the extension to a shtuka. Full faithfulness: Lemma 13.3.1 and Proposition 13.3.2 ("[FF18, Proposition 4.1.3, Théorème 11.1.12]", with Dieudonné–Manin and FF18 Propositions 4.1.1–4.1.3). Essential surjectivity: Theorem 13.4.1 ([Ked04]): "there exists a ϕ-module (M, ϕM) over L such that (E, ϕE) ∼= (M, ϕM) ⊗L OY[r,∞)"; Remark 13.4.2: "ϕ-modules over L are by definition the same as isocrystals over k". The translation is in FF18 §11.2 (Proposition 11.2.20, Corollaire 11.2.22) and Definition 13.4.3.
- Lecture 12. Theorem 12.3.4 ([KL15, Theorem 8.5.3]); Proposition 12.3.5; Corollary 12.4.1. Proposition 12.4.6 is "an easy consequence of Corollary 12.4.1", and its inverse uses "the Beauville–Laszlo lemma, Lemma 5.2.9".
- Current owners. PAPER-SCHOLZE-WEINSTEIN-20 (review: accept). Route 6 sends /85 (Theorem 12.3.4) to VectorBundlesAndIsocrystals VB3/VB4. Route 9 (AI.2) lists /86 (Proposition 12.3.5, Corollary 12.4.1), /88, /90 (Theorem 13.2.1, Lemma 13.3.1, Proposition 13.3.2; planned ["AInfCohomology:AI.2", "VectorBundlesAndIsocrystals:VB1"]), /98 and /99. Item /91 (Theorem 13.4.1) is planned at VB2:classification, VB0 and VB1. No node of data/decompositions/VectorBundlesAndIsocrystals.json states Theorem 13.2.1 or 13.4.1; the VB2:classification node dieudonne-manin-classification-of-bundles is FS II.2.14. PAPER-FARGUES-FONTAINE-18 (review pending) records FF18 Théorème 11.1.9 (/1034), 11.1.12 (/1045), Corollaire 11.1.13 (/1046) and 11.1.14 (/1047–/1051) as "missing" and routes them to a proposed VectorBundlesAndIsocrystalsPartII (route 3).
- VB0 and Mathlib. research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json already cites mathlib:WittVector.Isocrystal, IsocrystalHom, IsocrystalEquiv, StandardOneDimIsocrystal and isocrystal_classification as the E = Q_p baseline. At Mathlib 082e2d3, Mathlib/RingTheory/WittVector/Isocrystal.lean has `class Isocrystal` (l. 113), `structure IsocrystalHom` (l. 133), `structure IsocrystalEquiv` (l. 140) and `theorem isocrystal_classification` (l. 183, one-dimensional only).
- Graph (data/atlas.json stageEdges at origin/main 53d76f8). VectorBundlesAndIsocrystals:VB0 → VB1 → VB2:classification, so once /19 is applied VB0 is already an ancestor of AInfCohomology:AI.2:essential-surjectivity. With /18, RelativeFarguesFontaine:RF0:crystalline-end → VectorBundlesAndIsocrystals:VB1, so RF0:crystalline-end is an ancestor of VB2:classification. VectorBundlesAndIsocrystals:VB4 requires VB2:classification.
- Acyclicity (Python). I used four graphs: stageEdges (1968 stages, 3508 edges); the graph after scripts/restructure.py applies the 23 accepted restructurings (6116 edges); stageEdges plus all `requires`; and the full graph assembled by scripts/build.py (2840 stages and nodes, 7792 edges). On each, I added the stage-graph changes of RT-AREA-padic-1 near this area (/3, /6, /8, /9, /10, /17–/20, /22, /24, /26) and the 61 additions of the REV-RT-AREA-padic-2 joint table. I modelled the prismatic Dieudonné Part II as a virtual node after AI.2:essential-surjectivity, with successors IG.0, IG.1, IG.3 and ET.6a as in RT-AREA-padic-1/25. VB0 → AI.2:essential-surjectivity and VB4 → AI.2:essential-surjectivity close no cycle on any version. The fallback VB0 → AI.2 (used only if /19 is not applied) closes none either. After these edges, restructure.py skips no additional RS link: 90 skipped before, 90 after. VB4 → AI.2:essential-surjectivity adds 67 ancestors on stageEdges (88 with the RS links), including the six-functor stages. AI.2:essential-surjectivity has no consumer in the atlas except that Part II.

**Fix, as edits.** Apply after RT-AREA-padic-1/18 and /19. Edits 1 and 2 change text that /19 inserts; each quoted string occurs once in the RT-AREA-padic-1 fixes report.
1. AI.2 sources (the line that /19 edit 1b installs). Replace "Lemmas 3.23 and 4.26–4.27" with "Lemmas 3.23 and 4.26". Lemma 4.27 moves to AI.2:essential-surjectivity (edit 2b). Full faithfulness in AI.2 needs no curve, isocrystal or crystalline-period input.
2. AI.2:essential-surjectivity (the description that /19 edit 2 creates).
   a. Replace "Such a shtuka extends over the crystalline end by the classification of vector bundles (Lecture 13, Corollary 13.5.5; VB2:classification) and GAGA (Theorem 13.5.6; VB2:ampleness)." with: "Proposition 12.4.6 follows from Corollary 12.4.1 and Proposition 12.3.5 (shtukas without legs are φ-modules over the integral Robba ring), with Theorem 12.3.4 ([KL15, Theorem 8.5.3]) imported from VectorBundlesAndIsocrystals VB4. Such a shtuka extends over the crystalline point x_L (Remark 13.2.2) by Theorem 13.2.1 ([FF18, Théorème 11.1.9, Corollaire 11.1.13]). Its full faithfulness is Lemma 13.3.1 and Proposition 13.3.2. Its essential surjectivity is Kedlaya's Theorem 13.4.1: every φ-module over Y_[r,∞) is M ⊗_L O for an isocrystal M over L = W(k)[1/p]. Import these from VectorBundlesAndIsocrystals VB2:classification, and the isocrystals from VB0 (Mathlib's WittVector.Isocrystal, IsocrystalHom and IsocrystalEquiv for E = Q_p). Corollary 13.5.5 and GAGA (Theorem 13.5.6) are used only for the curve description (3) of Theorem 14.1.1, which this stage does not need."
   b. After "Keep the Galois action for descent from a discretely valued field." add: "Also prove BMS1 Lemma 4.27. For a Breuil–Kisin–Fargues module M over a perfectoid field K of characteristic 0 and a fixed section k → O_K/p, there is a noncanonical φ-equivariant isomorphism M ⊗_{A_inf} B^+_crys ≅ M′ ⊗_{W(k)} B^+_crys, with M′ = M ⊗_{A_inf} W(k), reducing to the identity over W(k)[1/p]. BMS1 proves it only by citing FF18 Corollaire 11.1.14. Prove the case needed here (E = Q_p, the usual B^+_crys, imported from PadicHodgeTheory R06.1) from FF18 Théorème 11.1.12, imported from VectorBundlesAndIsocrystals VB2:classification, and FF18's comparison of B^+_crys with the rings B^+_ρ. The canonical version in geometric situations is BMS1 Proposition 13.21, owned by CrystallineCohomology CR.3:Frobenius-isogeny (FIX-RT-AREA-padic-2/11)."
   c. requires: add "VectorBundlesAndIsocrystals:VB0" and "VectorBundlesAndIsocrystals:VB4" to /19's five inputs.
3. VectorBundlesAndIsocrystals:VB2:classification. Edit content/campaign/VectorBundlesAndIsocrystals/README.md l. 61–62, and the same text in the atlas descriptions of VB2 and VB2:classification. After "Prove Hom/Ext vanishing, extension and uniqueness properties needed for HN filtrations and moduli charts." add: "For E = Q_p and S = Spa C♭, also prove the φ-module form of the classification at the crystalline point x_L. First, Kedlaya's theorem: every φ-module over Y_[r,∞) is M ⊗_L O_{Y_[r,∞)} for an isocrystal M over L = W(k)[1/p] (SW20 Theorem 13.4.1, [Ked04]). Include the extended Robba ring of Definition 13.4.3 and the translation of FF18 §11.2 (Proposition 11.2.20, Corollaire 11.2.22). Second, restriction of φ-modules from Y_[r,∞] to Y_[r,∞) is an equivalence (SW20 Theorem 13.2.1 = FF18 Théorème 11.1.9 and Corollaire 11.1.13), with Lemma 13.3.1 and Proposition 13.3.2 and the inputs that Proposition 13.3.2 cites, FF18 Propositions 4.1.1–4.1.3 and Théorème 11.1.12. State Théorème 11.1.12 as FF18 do, for F perfect with a section k_F → O_F. The charts Y_[r,∞] come from RelativeFarguesFontaine RF0:crystalline-end, and the isocrystals from VB0. Record whether Theorem 13.4.1 is derived from the classification above through the §11.2 translation or proved as in [Ked04]. Export these statements to AInfCohomology AI.2:essential-surjectivity."
4. VectorBundlesAndIsocrystals:VB4 (README l. 106–107 and the VB4 atlas description). After "Prove the equivalence between everywhere slope-zero bundles and pro-étale E-local systems, with tensor and scalar-extension compatibility." add: "Its integral pointwise form at S = Spa C♭, SW20 Theorem 12.3.4 ([KL15, Theorem 8.5.3], routed here by PAPER-SCHOLZE-WEINSTEIN-20 route 6), is exported to AInfCohomology AI.2:essential-surjectivity."
5. data/atlas.json stageEdges: add {"source": "VectorBundlesAndIsocrystals:VB0", "target": "AInfCohomology:AI.2:essential-surjectivity"} and {"source": "VectorBundlesAndIsocrystals:VB4", "target": "AInfCohomology:AI.2:essential-surjectivity"}, with the matching requires and consumers entries. VB0 is already an ancestor through VB2:classification. The direct edge records the verifier's isocrystal input, which Theorem 13.4.1 and Lemma 4.27 use. If /19 is not applied, add {"source": "VectorBundlesAndIsocrystals:VB0", "target": "AInfCohomology:AI.2"} instead (acyclic), and edits 2–4 then concern AI.2.
6. research/blueprint/papers/PAPER-SCHOLZE-WEINSTEIN-20.result.json. Apply only after AI.2:essential-surjectivity exists in the atlas, because check_paper.py rejects unknown stages.
   - Item /86: set "planned" to ["AInfCohomology:AI.2:essential-surjectivity"] and "note" to "Steps of the proof of Proposition 12.4.6 in Fargues' essential surjectivity, planned in AI.2:essential-surjectivity (FIX-RT-AREA-padic-2/1)."
   - Item /90: set "planned" to ["VectorBundlesAndIsocrystals:VB2:classification"] and "note" to "Requested from VB2:classification and imported by AI.2:essential-surjectivity (FIX-RT-AREA-padic-2/1); the φ-modules on annuli come from VB1."
   - Item /91 is unchanged; it already names VB2:classification. Route 9 keeps /90 as a planned item it is a good source for. If /19's adjustment C1 has not already done so, add "AInfCohomology:AI.2:essential-surjectivity" to route 9's "stages".
7. Owners entry for the maintainer's record. No accepted restructuring covers AInfCohomology and VectorBundlesAndIsocrystals together (RS-01 covers AI, RS-15 covers VB). {"target": "Kedlaya's theorem on φ-modules over Y_[r,∞) and the extension of φ-modules over the crystalline point x_L (SW20 Theorems 13.2.1 and 13.4.1, Lemma 13.3.1, Proposition 13.3.2; FF18 Théorème 11.1.9, Théorème 11.1.12, Corollaire 11.1.13)", "owner": "VectorBundlesAndIsocrystals:VB2:classification", "formerly": ["AInfCohomology:AI.2"]}
8. Already applied, no edit: the VB0 packet cites the Mathlib isocrystal carriers and plans only the general-E version, as the verifier asks. PrismaticCohomology:PR.7 needs only full faithfulness (checked under RT-AREA-padic-1/19: Bhatt–Scholze, "full faithfulness (which is the only part we use)").

**Adjusted by the joint check (C8).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- /19's direct edge VB2:ampleness → AI.2:essential-surjectivity no longer records an import once edit 2a replaces the GAGA sentence. It is redundant (VB2:ampleness → VB2:classification) and may be dropped when /19 is applied. It is not on main, so the block below does not list its deletion.
- The review of PAPER-FARGUES-FONTAINE-18 (pending) should mark /1034, /1045 and /1046 as planned at VB2:classification. It should mark the B^+_crys case of /1047–/1048 as planned at AI.2:essential-surjectivity. The general rings B^+_{cris,ρ} of O_F/a (/1047–/1051) stay with route 3. If route 3's Part II is accepted and should own FF18 §11.1 instead, it must precede AI.2:essential-surjectivity. FF18 was not read for this fix; its statements are cited as the extraction records them.
- The W(C♭) part of Theorem 12.3.4, (2)↔(3), is also the first step of BMS1 Lemma 4.26 in AI.2 (for finitely generated modules). The VB4 blueprint should cite AI.2's Lemma 4.26 node for it rather than prove it again. The induced edge AI.2 → VB4 is acyclic on all graphs, and after /19 it adds only AI.2 and P7:annulus-foundations to VB4's ancestors. It is a node-level decision, so it is not proposed here.
- [Ked04], [KL15], [Ked19b] and FF18 were not read. Dieudonné–Manin in general is VB0's; the VB0 coverage records it as unread.

## /2 (high, missing): the ordinary and divided-power de Rham complexes have no owner upstream of their users

**The finding and the verdict.** No stage builds the ordinary de Rham complex Ω^•_{B/A} of a ring map or its divided-power version Ω^•_{B/A,δ}, and the pinned libraries have neither. CrystallineCohomology:CR.2, CR.4, AInfCohomology:AI.4 and DerivedDeRhamCohomology:DD.2 use them; the only stage that constructs an algebraic de Rham complex is ComplexComparisonPartII:C5, for smooth complex varieties. The finding gives DerivedDeRhamCohomology:DD.0 the ordinary complex and CrystallineCohomology:CR.0/CR.2 the PD complex, and adds DD.0 → ComplexComparisonPartII:C5. The verifier confirmed it. It asked DD.0 for "the generic exterior algebra with differential, d²=0, Leibniz/functoriality and correctly qualified base-change/localization/completion results", asked for "DD.0 → C5 and RT.1", and warned that "Base-change comparison is not an unconditional assertion about arbitrary ordinary tensor products." Main has moved since the red team: the DerivedDeRhamCohomology packet now plans the ordinary complex, but under DD.2, which CR.2, C5 and RT.1 cannot reach. The fix moves that tranche to DD.0 and adds the missing edges.

**Checked.**
- content/campaign/DerivedDeRhamCohomology/README.md, lines 22–25: "The ordinary algebraic differential forms/de Rham complex use existing Mathlib KaehlerDifferential, Derivation, exterior algebra and scheme sheaf carriers". DD.0 (lines 32–62) plans cotangent complexes and derived powers only. DD.2, line 100: "Apply the ordinary de Rham functor to polynomial resolutions".
- CR.2 (CrystallineCohomology README, line 87): "by the de Rham complex of its PD envelope". AI.4 (AInfCohomology README, line 148): "theta specialization, which yields the actual de Rham complex". C5 (ComplexComparisonPartII README, line 63): "construct its algebraic de Rham complex from the existing Kähler differential/exterior algebra". RefinedTraceMethods:RT.1 (README, line 11): "Compare the de Rham differential with B."
- Mathlib 082e2d3. `git grep -iE "de ?rham"` finds only Mathlib/RingTheory/Perfectoid/BDeRham.lean and the comment at Mathlib/Data/Fin/Parity.lean:19. The carriers exist: KaehlerDifferential (Kaehler/Basic.lean:153), KaehlerDifferential.D (:198), exterior powers, tensorKaehlerEquiv `[Algebra.IsPushout R S A B]` (Kaehler/TensorProduct.lean:247), the isLocalizedModule instances (TensorProduct.lean:231, 237) and KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale (Etale/Kaehler.lean:38).
- research/blueprint/packets/DerivedDeRhamCohomology.json, commit 1c9b1028 (PR #3119, 26 September, after the red team of 24 September). Its summary: "builds a twenty-node ordinary differential-algebra tranche on the pinned Kähler and exterior-power carriers". Nineteen of the nodes sit under DD.2: DD.2/symbol-relations, symbol-map, symbol-map-surjective, symbol-relations-kernel, free-symbol-differential, free-differential-relations, ordinary-differential, differential-generator-formula, differential-uniqueness, differential-square-zero, differential-graded-leibniz, ordinary-de-rham-complex ("Define Ω•_(B/A) as the nonnegative cochain complex of A-modules with degree n object Ωⁿ and differential dₙ"), forms-pullback, pullback-differential, pullback-wedge, pullback-identity, pullback-composition, ordinary-complex-map and pullback-elementary. The twentieth is DD.3/frobenius-linear-differential.
- In that packet only three other nodes cite the tranche: DD.2/polynomial-resolution-derham (now "Apply the planned ordinary-de-rham-complex and ordinary-complex-map nodes to each polynomial algebra P_n"), DD.3/polynomial-cartier-map and DD.3/frobenius-linear-differential. No other packet or decomposition file contains these ids. The packet's gap "Ordinary base-square and Künneth proof inputs" says "the underived tensor-base-change isomorphism of complexes in Stacks 10.132.1 remain[s] to be typed".
- research/blueprint/packets/MotivicEtaleKTheory--M.5d.json requests the same objects from DD.2: "On ordinary absolute forms Ω_F^n=∧_F^n Ω_(F/Z), supply the additive de Rham differential d, d²=0, …". No DD.2 → M.5d edge exists.
- research/blueprint/packets/HabiroCohomologyFoundations--HQ.1.json requests from CR.2 the "computation by the PD de Rham complex of the envelope of a surjection from an ind-smooth algebra". The CR packet (CR.2 not_read) has no PD de Rham node.
- BMS1 (arXiv:1602.03148v3), p.7, Theorem 1.10(ii): AΩ_X ⊗^L_{A_inf} O ≃ Ω^{•,cont}_{X/O}, "where Ω^{i,cont}_{X/O} = lim_n Ω^i_{(X/p^n)/(O/p^n)}". Stacks Tags 07HQ and 07HZ are cited as the finding and verifier cite them; I did not reopen them.
- Reachability, on data/atlas.json stageEdges (1968 stages, 3508 edges), with the links of the accepted restructurings as scripts/restructure.py applies them (6116 edges), and on the graph scripts/build.py assembles (2840 stages, 7792 edges): DD.2 is an ancestor of none of CR.2 (requires CR.1, DD.0, DD.1, E2), C5 (requires C3 only) and RT.1 (requires StableHomotopyKTheory:H.5:spectra only). DD.0 → CR.2 and DD.0 → DD.2 exist.
- RT-AREA-ktheory-2/37 (confirmed) asked for DD.2 → RT.1 and DD.0 → RT.1. The open draft fix for it (PR #4638) says "Add the DerivedDeRham foundations DD.0 and HKR DD.2 suppliers to RT.1."
- Acyclicity. I tested every edge of this report on the base graph, the RS graph and the full graph, each also with the parent–sub-stage edges that scripts/theory_graph.py adds. Each edge has no return path, and all of them together, and together with the edges that the other padic-2 findings propose (/11, /13, /18, /19, /23, /25, /26, /29, /30, /39, /43, /45, /46), leave all six graphs acyclic. Here: DerivedDeRhamCohomology:DD.0 → ComplexComparisonPartII:C5, DD.0 → RefinedTraceMethods:RT.1 and DD.0 → MotivicEtaleKTheory:M.5d. C5 then has 17 ancestors instead of 7 (base), RT.1 14 instead of 8.

**Fix, as edits.**
1. content/campaign/DerivedDeRhamCohomology/README.md, introduction, lines 22–25 (not a stage description). Replace "The ordinary algebraic differential forms/de Rham complex use existing Mathlib KaehlerDifferential, Derivation, exterior algebra and scheme sheaf carriers; existing algebraic de Rham and Jacobian roadmaps retain their classical geometric applications." with: "DD.0 owns the ordinary algebraic de Rham complex Ω^•_{B/A} = ∧^•_B Ω^1_{B/A} of a ring map, built on Mathlib's KaehlerDifferential, Derivation and exterior powers; the libraries have no de Rham complex. DD.2, CrystallineCohomology CR.2 and CR.4, AInfCohomology AI.4, ComplexComparisonPartII C5, RefinedTraceMethods RT.1 and MotivicEtaleKTheory M.5d import it. C5 and the Jacobian roadmaps keep their classical geometric applications."
2. DerivedDeRhamCohomology:DD.0, in the README and in the data/atlas.json description. After "A pushout of ordinary rings without Tor independence is not a derived pushout." (lines 40–41) insert a new paragraph: "Construct the ordinary de Rham complex of a ring map A→B on Mathlib's carriers: Ω^n_{B/A} = ∧^n_B Ω^1_{B/A}, the A-linear differential d with d∘d = 0 and d = KaehlerDifferential.D in degree zero, the wedge product with the graded Leibniz rule, and pullback along maps of A-algebras and along commutative squares of base rings. Prove the isomorphism of complexes Ω^•_{(A'⊗_A B)/A'} ≅ A' ⊗_A Ω^•_{B/A} from Mathlib's tensorKaehlerEquiv and base change of exterior powers. It is a statement about complexes: base change of de Rham cohomology needs flatness or derived tensor products and is not claimed. Prove Ω^n_{C/A} ≅ C ⊗_B Ω^n_{B/A} for localizations and étale maps B→C, from Mathlib's isLocalizedModule instances and tensorKaehlerEquivOfFormallyEtale, and glue the Zariski and étale sheaves Ω^•_{X/S} on schemes. Define the continuous complex Ω^{i,cont}_{R/A} = lim_n Ω^i_{(R/p^n)/(A/p^n)} (BMS1 Theorem 1.10(ii)). It is the classical p-adic completion of Ω^i_{R/A}; it agrees with the derived p-completion only under a bounded p-power-torsion hypothesis, proved where it is used. The divided-power de Rham complex is CrystallineCohomology CR.2's, built on this one."
3. DerivedDeRhamCohomology:DD.2, line 100 (README and atlas). Replace "Apply the ordinary de Rham functor to polynomial resolutions" with "Apply DD.0's ordinary de Rham functor to polynomial resolutions".
4. CrystallineCohomology:CR.2 (README and atlas). After "including coefficients in an eligible crystal." (line 88) insert: "Construct the divided-power de Rham complex. For a PD algebra (B, J, δ) over (A, I, γ), Ω_{B/A,δ} is the quotient of Ω^1_{B/A} by the submodule generated by dδ_n(x) − δ_{n−1}(x)dx for x ∈ J and n ≥ 1, with its universal PD derivation, and Ω^•_{B/A,δ} is the corresponding quotient of DerivedDeRhamCohomology DD.0's ordinary complex (Stacks, Tags 07HQ and 07HZ). The de Rham complex of a PD envelope used below is this complex." CR.2 already requires DD.0; the PD complex goes here and not in CR.0, which does not reach DD.0.
5. ComplexComparisonPartII:C5 (README line 63 and atlas). Replace "construct its algebraic de Rham complex from the existing Kähler differential/exterior algebra," with "import its algebraic de Rham complex Ω^•_{X/ℂ} from DerivedDeRhamCohomology DD.0 and construct". The sentence then reads "For a smooth complex algebraic variety import its algebraic de Rham complex Ω^•_{X/ℂ} from DerivedDeRhamCohomology DD.0 and construct its analytification and the integration/Poincaré map to the analytic resolution of the constant complex sheaf." Add DerivedDeRhamCohomology:DD.0 to C5's `requires`.
6. RefinedTraceMethods:RT.1 (README line 11 and atlas). Replace "Compare the de Rham differential with B." with "Compare the de Rham differential of the ordinary complex Ω^•_{A/k}, imported from DerivedDeRhamCohomology DD.0, with B." Add DerivedDeRhamCohomology:DD.0 to RT.1's `requires`.
7. AInfCohomology:AI.4 (README line 148 and atlas). Replace "theta specialization, which yields the actual de Rham complex." with "theta specialization, which yields the actual continuous de Rham complex Ω^{•,cont} of DerivedDeRhamCohomology DD.0 (BMS1 Theorem 1.10(ii))." No edge is needed: DD.0 → CR.2 → CR.4 → AI.4 exists.
8. Stage edges: add DerivedDeRhamCohomology:DD.0 → ComplexComparisonPartII:C5, DerivedDeRhamCohomology:DD.0 → RefinedTraceMethods:RT.1 and DerivedDeRhamCohomology:DD.0 → MotivicEtaleKTheory:M.5d, with the matching `requires` and `consumers` entries.
9. research/blueprint/packets/DerivedDeRhamCohomology.json, for BP-DerivedDeRhamCohomology.
   - Rename the nineteen DD.2 nodes listed under Checked from DerivedDeRhamCohomology:DD.2/<name> to DerivedDeRhamCohomology:DD.0/<name>, and set their parentStageId and realises to DerivedDeRhamCohomology:DD.0. Keep DD.3/frobenius-linear-differential in DD.3.
   - Replace the old ids in every `prerequisites` list. Besides the tranche itself this touches DD.2/polynomial-resolution-derham (ordinary-de-rham-complex, ordinary-complex-map), DD.3/polynomial-cartier-map (ordinary-de-rham-complex, differential-graded-leibniz) and DD.3/frobenius-linear-differential (differential-graded-leibniz).
   - Coverage. DD.0 becomes "partial". Move DD.2's first `remaining` item ("Complete the direct symbol-presentation proof, including the two quotient universal properties and the explicit restriction-of-scalars lifting data; the statement-only prototype contains no proofs.") to DD.0, and add to DD.0: "Extend fixed-base algebra-map naturality to general commutative base-ring squares; prove the underived base change of complexes, the polynomial Künneth decomposition, localization and étale base change, the Zariski/étale sheaves and the continuous complex Ω^{•,cont}." Replace DD.2's second item "Extend fixed-base algebra-map naturality to general commutative base-ring squares; prove ordinary underived base change and the polynomial Künneth decomposition before invoking Bhatt Proposition 2.7." with "Import DD.0's ordinary base change and polynomial Künneth decomposition before invoking Bhatt Proposition 2.7."
   - The suggested Lean file, the packet readme and the handoff note follow the renamed ids.
10. research/blueprint/packets/MotivicEtaleKTheory--M.5d.json, for the M.5d blueprint job. In the request whose `need` begins "On ordinary absolute forms Ω_F^n=∧_F^n Ω_(F/Z)", change `supplier` from "DerivedDeRhamCohomology:DD.2" to "DerivedDeRhamCohomology:DD.0". The DD.3 request stays (see /12).
11. Owners entries (RS format):
    - `{"target": "Ordinary algebraic de Rham complex Ω^•_{B/A} = ∧^•_B Ω^1_{B/A} of a ring map: differential, d² = 0, graded Leibniz rule, functoriality, base change of complexes, localization and étale base change, Zariski and étale sheaves on schemes, and the continuous complex Ω^{•,cont}", "owner": "DerivedDeRhamCohomology:DD.0", "formerly": ["DerivedDeRhamCohomology:DD.2", "ComplexComparisonPartII:C5"]}`
    - `{"target": "Divided-power de Rham complex Ω^•_{B/A,δ} of a PD algebra and its universal PD derivation (Stacks 07HQ, 07HZ)", "owner": "CrystallineCohomology:CR.2", "formerly": []}`

**Not changed / open.**
- C5's logarithmic de Rham complex of a compactified curve stays in C5, its only user.
- RT-AREA-ktheory-2/37. With DD.0 as owner, RT.1 needs DD.0 for the ordinary complex. The fixer of RT-AREA-ktheory-2 (draft PR #4638) should keep DD.2 → RT.1 only if RT.1 itself imports derived de Rham cohomology. DD.0 → RT.1 is added here; it should not be added twice.
- The verifier's other padic-2 constraint ("Keep one ordinary de Rham and generic Koszul constructor") is met on the de Rham side. The Koszul owner is decided under /15.

## /3 (high, missing): Scholze's primitive comparison. Build on RT-AREA-padic-1/24's P8:primitive, send it to AI.5, AI.6 and CP.4, and make AI.4 local

**The finding and the verdict.** No stage plans Scholze's finiteness and primitive comparison theorem: Sch13 Theorem 5.1, with Theorems 1.1 and 1.3, Theorem 4.9, Lemma 4.12 and the relative form. CohomologyComparisons:CP.3, CohomologyComparisons:CP.4, the proper suffix of PadicHodgeTheory:P8, AInfCohomology:AI.5, AInfCohomology:AI.6 and IgusaVarietiesAndTorsionConcentration:IG.3 all rest on it. The finding adds that AInfCohomology:AI.4 claims locally what BMS1 proves only globally. The verifier "Confirmed the missing producer and the local/global conflation". It asks to "Export to AI.5, AI.6, CP.3, CP.4, P8 and IG.3 with exact coefficient/proper-smooth/base hypotheses and derived-completion obligations" and to "Keep the Sch13 erratum's corrected covers". It also notes that "The CP decomposition's recalled BMS1 Theorem 5.1 is a de Rham comparison, not Sch13's different Theorem 5.1". RT-AREA-padic-1/24 (merged in PR #4645) already creates the owner as PadicHodgeTheory:P8:primitive, after P8:local-rational. I build on it and create no second stage, so the finding's name P8:primitive-comparison is dropped. I change 1/24 in one respect. Its out-edge to AI.4 rests on a note that 1/24 flagged as unchecked ("I did not open BMS1"). BMS1 shows that the edge belongs to AI.5.

**Checked.**
- AInfCohomology README, AI.4 (l. 157–160): "After mu-inversion prove the étale comparison with the actual p-adic cohomology of the generic fiber". AI.5 (l. 169–171): "Globalize AI.4 to the derived theta, W(k), A_cris and mu-inverted specializations". In the atlas, AI.5 requires AI.2 and AI.4, and AI.6 requires AI.5, CR.5 and CR.6.
- BMS1, local statement:
  - Theorem 1.10(iv), p. 7: "With (a variant of) étale cohomology … AΩX ⊗ Ainf[1/µ] ≃ (Rν∗Ainf,X) ⊗ Ainf[1/µ]".
  - Theorem 14.1, p. 118: "part (iv) follows directly from the definition of AΩX".
- BMS1, global statement:
  - Theorem 14.3(iv), pp. 119–120, is the comparison with RΓét(X, Zp). Its proof says "using Theorem 5.7 for part (iv)". The BKF property follows "by Corollary 4.20 and comparisons (iii) and (iv)".
  - Theorem 5.7, p. 47 ("[58, proof of Theorem 8.4]"), assumes C algebraically closed and X a proper smooth adic space over C. Its proof reads: "killed by [m♭], and derived p-complete (cf. Lemma 6.15)", hence "killed by W(m♭)".
- BMS1 Theorem 5.1, p. 45, gives finitely generated H^i_ét(X_C, Z_p) together with the de Rham comparison. So it combines Sch13 Theorem 1.1 and Corollary 1.8. It is not Sch13 Theorem 5.1.
- Sch13:
  - Theorem 1.1, p. 2, and Theorem 1.3 with its relative form, p. 3.
  - Corollary 1.8, p. 4.
  - Theorem 5.1, p. 28.
  - Corollary 5.11, p. 34 (the relative form in arXiv numbering).
  - Proof of Theorem 8.4, p. 49: "This follows inductively from Theorem 5.1 (using Proposition 3.15) … the almost version of Lemma 3.18", giving H^i(X, L) ⊗ A_inf^a ≅ H^i(X, L ⊗ A_inf^a).
- Sch13 erratum, p. 1:
  - Item (1) changes the covers, and "all results of the paper are then kept intact".
  - Item (2) removes Proposition 3.8 and part of 3.13, which "were not used in the rest of the paper".
  - Item (3) concerns OB_dR^+.
- CK uses the primitive comparison directly:
  - Theorem 2.3, p. 9: "If X is proper over OC", the μ-inverted comparison with RΓét(X^ad_C, Zp), from "a result of Scholze [BMS18, 5.6]". That is CK's number for BMS1 Theorem 5.7.
  - Proof of Proposition 6.8, p. 67: "due to [Sch13a, 5.1], the object RΓét(X^ad_C, Ainf) ⊗ B+dR … is perfect".
- PAPER-BHATT-MORROW-SCHOLZE-18 (accepted):
  - Item /092 (Theorem 5.7) is in routes[4] (route 5, AI.4). Its note says "It feeds the étale specializations (Theorems 1.8(iv), 14.1(iv)), which AI.4 plans."
  - Item /013 (Theorem 14.3(iv)) is planned at AI.5 and CP.1 and "Uses Theorem 5.7 (item 092)".
  - Route 5's reason contains "the primitive comparison with A_inf-coefficients (Theorem 5.7), " once.
- CP gap. The title "Scholze's de Rham comparison (Theorem 5.1, [58]) has no verified supplier in the CP graph" and the phrase "Theorem 5.1 (finite generation of H^i_ét(X_C,Z_p)" each occur once in research/blueprint/packets/CohomologyComparisons.json and once in data/decompositions/CohomologyComparisons.json.
- Graph:
  - None of 1/24's inputs to P8:primitive is reachable from AI.5, AI.6 or CP.4.
  - Moving 1/24's out-edge from AI.4 to AI.5 keeps AI.4 at 26 ancestors on stageEdges; with 1/24's edge it would have 44. It also keeps PrismaticCohomology:PR.6, a consumer of AI.4, at 33 instead of 51.
  - AI.5 gets 47 ancestors either way.
  - The edges to AI.6 and CP.4 are implied through AI.5 → AI.6 and CP.3 → CP.4. They record CK's direct use.
  - All three edges are acyclic in all six graphs, alone and jointly.

**Fix, as edits.**
1. RT-AREA-padic-1/24, edit 1 (the P8:primitive section it inserts into content/campaign/PadicHodgeTheory/README.md). Amend its text before applying it.
   a. Replace "Deduce the finiteness of H^i_ét(X_C, Z_p) for proper smooth rigid X over a discretely valued K (Theorem 1.1, recalled as BMS1 Theorem 5.1)." with:
      "Deduce the finiteness of H^i_ét(X_C, Z_p) for proper smooth rigid X over a discretely valued K (Scholze 2013, Theorem 1.1). This is only the finiteness clause of BMS1 Theorem 5.1. That theorem's de Rham comparison clause is Scholze 2013, Corollary 1.8 (Theorem 8.4); CohomologyComparisons CP.3 and the proper suffix of P8 prove it, not this stage."
   b. Insert after that paragraph:
      "Prove the A_inf-coefficient form from the first paragraph of the proof of Scholze 2013, Theorem 8.4. For X proper smooth over an algebraically closed C and a lisse Ẑ_p-sheaf L on X_proét, H^i(X_proét, L) ⊗_{Z_p} A_inf^a ≅ H^i(X_proét, L ⊗_{Ẑ_p} A_inf,X^a). Prove it by induction on n for L/p^n from Theorem 5.1 and Proposition 3.15, then pass to the limit with the almost version of Lemma 3.18 (arXiv v2 numbering). Keep the almost qualification: the cone is killed by [m^♭]. Its upgrade to W(m^♭) (BMS1 Theorem 5.7) belongs to AInfCohomology AI.5. Use the corrected pro-étale covers of Scholze's erratum, item (1), imported from AdicEtaleGeometry A1. With them the paper's results hold as stated. Item (2) of the erratum removes statements that the rest of the paper does not use, and item (3) concerns OB_dR^+."
   c. In its export list, replace "- AInfCohomology AI.4 (BMS1 Theorem 5.7, the A_inf form);" with three lines:
      "- AInfCohomology AI.5 (the [m^♭]-almost A_inf form, for BMS1 Theorem 5.7 and the étale specialization of Theorem 14.3(iv));
      - AInfCohomology AI.6 (Česnavičius–Koshikawa Theorem 2.3 and the proof of Proposition 6.8);
      - CohomologyComparisons CP.4 (the semistable comparison, through AI.6);"
2. RT-AREA-padic-1/24, edit 2 (stage edges). In its "out" list, replace AInfCohomology:AI.4 with AInfCohomology:AI.5, AInfCohomology:AI.6 and CohomologyComparisons:CP.4. The out-list becomes P8, CP.3, AI.5, AI.6, CP.4, TC.2, IG.3 and T6:log-primitive.
3. RT-AREA-padic-1/24, other edits:
   - Do not apply edit 6, the sentence it adds to AI.4. Edits 4–6 below replace it.
   - In edit 8(d), replace "before CP.3, AI.4 and P8" with "before CP.3, AI.5 and P8".
   - In edit 12 (owners entry), append to its target: ", and the [m^♭]-almost A_inf-coefficient form from the proof of Theorem 8.4".
4. AI.4, in content/campaign/AInfCohomology/README.md (l. 157–160) and the AI.4 atlas description. Replace
   ```
   After mu-inversion prove the étale comparison with the actual p-adic
   cohomology of the generic fiber, including derived p-completion where used.
   Replacing mu-inversion by p-inversion or special-fiber p-adic étale
   cohomology would give a different statement.
   ```
   with
   ```
   After mu-inversion prove the local comparison
   AΩ ⊗ A_inf[1/mu] ≃ (Rnu_* A_inf,X) ⊗ A_inf[1/mu] of BMS1 Theorem 1.10(iv)
   (= Theorem 14.1(iv), which follows from the definition AΩ = Lη_mu Rnu_* A_inf,X).
   This compares AΩ with a variant of étale cohomology on mathfrak X_Zar, not
   with the p-adic étale cohomology of the generic fiber. That identification
   is global, needs Scholze's primitive comparison, and belongs to AI.5.
   Replacing mu-inversion by p-inversion or special-fiber p-adic étale
   cohomology would give a different statement.
   ```
5. AI.5, in the same README and the AI.5 atlas description.
   a. After "Globalize AI.4 to the derived theta, W(k), A_cris and mu-inverted specializations, including cup products, Frobenius, functoriality and base change." (wrapped over l. 169–171), insert:
      ```
      For the mu-inverted specialization prove BMS1 Theorem 5.7: for a proper
      smooth adic space X over C, the map RΓ_ét(X, Z_p) ⊗_{Z_p} A_inf →
      RΓ(X_proét, A_inf,X) has cone killed by W(m^♭). Import the [m^♭]-almost
      form from PadicHodgeTheory P8:primitive and upgrade it through the derived
      p-completeness of the cone (BMS1 Lemma 6.15). Deduce Theorem 14.3(iv),
      RΓ_Ainf ⊗ A_inf[1/mu] ≃ RΓ_ét(X, Z_p) ⊗_{Z_p} A_inf[1/mu], including derived
      p-completion where used. The BKF property uses it with Corollary 4.20.
      ```
   b. Replace "Sources: BMS1 §§4,14 and Theorems 1.1,1.8." with "Sources: BMS1 §§4,14, Theorem 5.7 and Theorems 1.1,1.8."
6. AI.6, in the same README and the AI.6 atlas description. After "algebraically closed and the induced Witt extension." (l. 197), insert: "The étale comparison (CK Theorem 2.3) and the perfectness of RΓ_ét(X^ad_C, A_inf) ⊗^L B_dR^+ in the proof of CK Proposition 6.8 use Scholze's primitive comparison. Import it from PadicHodgeTheory P8:primitive, through AI.5's BMS1 Theorem 5.7 (which CK cite as [BMS18, 5.6])." The next sentence, which /13 edits, is not touched.
7. CP.4, in content/campaign/CohomologyComparisons/README.md and the CP.4 atlas description. After "Transport to the admitted algebraic models by formal comparison.", insert: "The étale side of the semistable comparison rests on Scholze's primitive comparison (PadicHodgeTheory P8:primitive), used through AI.6."
8. data/atlas.json stageEdges. Add PadicHodgeTheory:P8:primitive → AInfCohomology:AI.5, → AInfCohomology:AI.6 and → CohomologyComparisons:CP.4. Add P8:primitive to the requires of those three stages and to its own consumers. Do not add P8:primitive → AInfCohomology:AI.4.
9. research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json.
   a. routes[4] (route 5, AI.4): remove "PAPER-BHATT-MORROW-SCHOLZE-18/092" from items. In its reason, delete "the primitive comparison with A_inf-coefficients (Theorem 5.7), ".
   b. routes[5] (route 6, AI.5): add "PAPER-BHATT-MORROW-SCHOLZE-18/092" to items. Append to its reason: " It also takes Theorem 5.7, the primitive comparison with A_inf-coefficients. The global étale specialization Theorem 14.3(iv), which AI.5 plans, uses it; the local Theorem 14.1(iv) does not (RT-AREA-padic-2/3)."
   c. Item /092, note: replace "It feeds the étale specializations (Theorems 1.8(iv), 14.1(iv)), which AI.4 plans." with "It feeds the global étale specialization (Theorems 1.8(iv), 14.3(iv)), which AI.5 plans. The local Theorem 14.1(iv) follows from the definition of AΩ and does not use it."
   d. The item still belongs to exactly one route. Both routes stay accepted. Add a line on the move to route 6's entry in the .review.json.
10. The CP gap, in research/blueprint/packets/CohomologyComparisons.json and data/decompositions/CohomologyComparisons.json.
   a. Replace the title "Scholze's de Rham comparison (Theorem 5.1, [58]) has no verified supplier in the CP graph" with "Scholze's finiteness and de Rham comparison (BMS1 Theorem 5.1, recalling [58] Theorem 1.1 and Corollary 1.8; not [58] Theorem 5.1) has no verified supplier in the CP graph".
   b. In its detail, replace "Theorem 5.1 (finite generation of H^i_ét(X_C,Z_p)" with "BMS1 Theorem 5.1 (finite generation of H^i_ét(X_C,Z_p)".
   c. RT-AREA-padic-1/24 edit 10 (the resolution text) stays. Its "([58] Theorems 1.1 and 5.1)" correctly means Scholze's numbering.

**Adjusted by the joint check (C4, C5, C10).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- The finding's second fix and the verifier's joint table list AdicSpacesPartII:R4 as an input. I do not add it. R4 is "the early site reexport … Transport the elementary site and sheaf operations from A1", and AdicEtaleGeometry:A1 is already an input of P8:primitive under 1/24.
- 1/24's open items stay open: Huber's proper base change for the relative form, and the choice of R3 nodes.
- IG.3's text and CP.3's import are 1/24's edits 5 and 7, unchanged.

## /4 (high, missing): Kisin's Kummer-tower theory is planned only inside the R07.4 packet; the stage text, its inputs and the export to PR.7 are missing

**The finding and the verdict.** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4's stage text plans the Breuil–Kisin classification of finite flat and p-divisible groups, but not the theory it rests on. That theory is Fontaine's étale φ-modules for G_{K∞} over the non-Galois Kummer tower, modules of finite E-height over 𝔖 and over the open disc, the slope-zero form of weak admissibility (Kedlaya's slopes), Kisin's lattice functor in every weight, and full faithfulness of Rep_cris(G_K) → Rep(G_{K∞}). PrismaticCohomology:PR.7 compares with "R07's Kisin functor", but R07.4 is not upstream of it. The verifier confirmed and set the repair: "Extend R07.4 with the Kummer tower, étale phi-module equivalence, finite E-height modules and the lattice functor, including Tate-shift/weight conventions and proof of the comparison diagram. Import the early annulus and RD slope input; either extend PG’s tower-specific field-of-norms scope with explicit comparison or construct the Kummer variant under R07, never silently substitute the cyclotomic tower. Add R07.4 → PR.7." Since the red team, most of the node-level work has landed on main. What is still missing is the stage text, the stage edges, the PhiGamma side of the imports, and three node-level corrections.

**Checked.**
- `content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, §R07.4: "Construct the power-series coefficient ring, Frobenius modules and the height bound determined by the Eisenstein polynomial. Prove the appropriate classification of finite-flat groups and p-divisible groups, including descent data and generic-fibre comparison". In data/atlas.json, R07.4 requires only R07.2 and PadicHodgeTheory:R06.2. Its consumers include CohomologyComparisons:CP.5, so CP.5 already imports it. PR.7 is not a consumer.
- PR.7 (`content/campaign/PrismaticCohomology/README.md`, line 227): "Compare evaluation on the Breuil–Kisin prism with R07's Kisin functor". PR.7 requires AI.2, R06.2, PR.4, PR.5, RT.3b and RT.6. There is no path from R07.4 to PR.7 on any of the graphs listed below.
- PhiGammaModulesAndIwasawaCohomology:PG.0 is titled "Cyclotomic coefficients and semilinear actions". The PG README preamble says: "Start with a finite extension K/Q_p and its cyclotomic tower K∞" and "General Lubin–Tate or multivariable towers are not obtained by renaming Γ_K." PG.1 constructs "D(T)=(A⊗T)^(H_K)". The PG packet has no PG.0 or PG.1 nodes; its 32 nodes are in PG.3–PG.5.
- Already on main. The FiniteFlat packet (`research/blueprint/packets/FiniteFlatGroupsAndIntegralPadicHodgeTheory.json`, checkpoint 5, PR #3838, 28 September, after the red team of 24 September) has these R07.4 nodes: bk-coefficient-rings, kisin-modules, kummer-etale-phi-modules, phi-n-nabla-modules, weakly-admissible-slope-zero, kisin-crystalline-embedding, kisin-etale-full-faithfulness (with Kisin's erratum E.4), finite-height-lattices, semistable-finite-height and crystalline-restriction-full-faithfulness (Kisin 2006, Corollary (2.1.14)). They fix the conventions "HT(χ_cyc) = +1. Kisin's functors are contravariant". Kisin 2009 Proposition (1.1.13) is inside R07.4/finite-flat-classification, so the unreviewed EXT-07 node R07.4/galois-module-of-a-kisin-module-over-K-infinity is superseded.
- The packet's requests on main:
  - to PG.0: "The field of norms of the Kummer tower … K_∞/K is strictly APF, X_K(K_∞) ≅ k((u)) … PG.0 plans the cyclotomic tower; this is the Kummer instance of the same input";
  - to PG.1: "Fontaine's equivalence for an arbitrary field E of characteristic p with Cohen ring 𝒪_ℰ and Frobenius lift, independent of any Γ-action … (Fontaine, Représentations p-adiques des corps locaux, A.1.2.6–A.1.2.7), and the comparison B.1.8.4";
  - to RD.1: "Kedlaya's slope theory for φ-modules over the Robba ring … slopes via ℛ^alg (… Theorem 4.16) … (Slope filtrations revisited, Theorem 6.3.3), the slope filtration (Kedlaya 2004, Theorem 6.10)".
- The FiniteFlat packet is not promoted (it is not in data/blueprints). None of its cross-roadmap prerequisites is a stage edge yet.
- In the RD packet (`research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json`, PR #2916), the slope filtration theorem is RD.2/slope-filtration-for-frobenius-modules-statement (sources include Kedlaya's monodromy paper, "Theorem 6.10"), and the descent of isoclinic modules is RD.2/isoclinic-descent-to-bounded-robba-ring ("Theorem 6.3.3(b)"). Only Dieudonné–Manin over ℛ^alg is in RD.1 (RD.1/dieudonne-manin-over-extended-robba-ring, whose sources include "Theorem 4.16"). So RD.1 alone does not supply the filtration that the request asks RD.1 for. Finding /44, which would move the filtration theorem to RD.1, is low severity and not part of this job.
- The P7 packet (PR #2917) node PadicHodgeTheory:P7:annulus-foundations/robba-ring: "The ring O_K((0,1))_{>=0} of functions on the open unit disc … is a subring." Yet R07.4/bk-coefficient-rings builds the same ring again ("𝒪 is the ring of rigid analytic functions on the open unit u-disc"), and neither it nor R07.4/weakly-admissible-slope-zero (which uses ℛ) cites P7:annulus-foundations. The accepted RS-26 owner entry gives "Analytic annulus/Robba coefficient carriers" to P7:annulus-foundations.
- The PAPER-LE-LEHUNG-LEVIN-ETAL-20 items /notation-K-infinity ("K_∞ := ⋃ K(p_n)") and /cite-LLHLM18-def-2-3 (Kisin modules over 𝔖_{L′,R} of height ≤ h, with descent data) are marked planned at R07.4. After edit 1 the stage text covers the Kummer tower and Kisin modules of height ≤ h. Kisin modules with descent data in general weight remain the first "remaining" item of R07.4's coverage.
- Acyclicity. I checked the edges of edit 2 one by one (no path from target back to source) and all together, on six graphs:
  - data/atlas.json stageEdges (3508 edges);
  - with the links of the accepted restructurings, as scripts/restructure.py applies them (6116);
  - with the same links applied raw (6200; 72 nodes lie on cycles before any edit, from links that restructure.py skips; the count does not change);
  - the full graph of scripts/build.py assemble() (7792);
  - that graph with the sub-stage → parent links that scripts/theory_graph.py adds;
  - that graph plus the cross-roadmap node prerequisites of the four unpromoted packets (FiniteFlat, RD, P7, PG).

  All are acyclic, with the edges of this section alone, with every edge of this report together, with the 61 edges of the verifier's joint table added, and with the 15 RT-AREA-padic-1 links written in RS format added. The alternative RD.1 → R07.4 is also acyclic on every graph. With this section's edges, R07.4's ancestors on the RS graph go from 84 to 95, and PR.7's from 101 to 123.

**Fix, as edits.**
1. `content/campaign/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, §R07.4. The Dependencies line occurs twice in this file (R07.3 and R07.4). Replace this block, which occurs once:

   ```markdown
   Prove the appropriate classification of finite-flat groups and p-divisible groups, including descent data and generic-fibre comparison, for the base fields used in KW and Kisin. Separate finite-flat, potentially Barsotti–Tate and merely potentially semistable cases. Include the dyadic theorem rather than assuming p>2 throughout.

   **Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2](README.md#r07-2); [PadicHodgeTheory R06.2](../PadicHodgeTheory/README.md#r06-2).
   ```

   with:

   ```markdown
   Prove the appropriate classification of finite-flat groups and p-divisible groups, including descent data and generic-fibre comparison, for the base fields used in KW and Kisin. Separate finite-flat, potentially Barsotti–Tate and merely potentially semistable cases. Include the dyadic theorem rather than assuming p>2 throughout.

   Construct Kisin's theory over the Kummer tower K_∞ = ∪_n K(π_n), where π_0 = π is a uniformizer and π_{n+1}^p = π_n. K_∞/K is not Galois, and the cyclotomic tower is not a substitute for it. Import the field of norms of K_∞ and Fontaine's equivalence between étale φ-modules over 𝒪_ℰ and ℤ_p-representations of G_{K_∞} from PhiGammaModulesAndIwasawaCohomology PG.0–PG.1. Import the ring 𝒪 of rigid-analytic functions on the open unit disc and the Robba ring from PadicHodgeTheory P7:annulus-foundations, and Kedlaya's slopes and slope filtration from PadicDifferentialEquationsAndRigidCohomology RD.1–RD.2. Construct 𝔖-modules of finite E-height with their torsion versions, and the (φ, N_∇)-module over 𝒪 of an effective filtered (φ, N)-module. Prove that weak admissibility is purity of slope 0 over the Robba ring. Construct the fully faithful functor from effective weakly admissible modules to 𝔖-modules of finite E-height up to isogeny, and prove full faithfulness of 𝔐 ↦ 𝒪_ℰ ⊗ 𝔐 in the form repaired by Kisin's 2008 erratum. Construct the lattice functor: every G_{K_∞}-stable lattice in a semistable representation with Hodge–Tate weights in [0, h] comes from a unique 𝔖-lattice of E-height ≤ h. Prove that restriction from crystalline G_K-representations to G_{K_∞}-representations is fully faithful (Kisin, Crystalline representations and F-crystals, Corollary 2.1.14). Construct the square of functors in that proof and prove that it commutes; do not assume it. Fix the covariance and the Hodge–Tate sign once (HT(χ_cyc) = +1, Kisin's contravariant functors), and prove the Tate-twist translation for each consumer that uses the other convention. PrismaticCohomology PR.7 compares its Breuil–Kisin evaluation with this lattice functor.

   **Dependencies:** [FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2](README.md#r07-2); [PadicHodgeTheory R06.2](../PadicHodgeTheory/README.md#r06-2); [PadicHodgeTheory P7:annulus-foundations](../PadicHodgeTheory/README.md#p7-annulus-foundations); [PhiGammaModulesAndIwasawaCohomology PG.0–PG.1](../PhiGammaModulesAndIwasawaCohomology/README.md); [PadicDifferentialEquationsAndRigidCohomology RD.2](../PadicDifferentialEquationsAndRigidCohomology/README.md).
   ```

2. data/atlas.json:
   - Regenerate R07.4's description from the README.
   - Add to R07.4.requires: PadicHodgeTheory:P7:annulus-foundations, PhiGammaModulesAndIwasawaCohomology:PG.0, PhiGammaModulesAndIwasawaCohomology:PG.1 and PadicDifferentialEquationsAndRigidCohomology:RD.2.
   - Add R07.4 to PrismaticCohomology:PR.7.requires.
   - Add these stageEdges:
     - {"source": "PadicHodgeTheory:P7:annulus-foundations", "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4"}
     - {"source": "PhiGammaModulesAndIwasawaCohomology:PG.0", "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4"}
     - {"source": "PhiGammaModulesAndIwasawaCohomology:PG.1", "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4"}
     - {"source": "PadicDifferentialEquationsAndRigidCohomology:RD.2", "target": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4"}
     - {"source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4", "target": "PrismaticCohomology:PR.7"}

   PG.0 → R07.4 is implied by PG.0 → PG.1 → R07.4. I list it because the packet's node prerequisites create it at promotion anyway.
3. `content/campaign/PhiGammaModulesAndIwasawaCohomology/README.md`. This takes the verifier's first option (extend PG with an explicit comparison), which the FiniteFlat packet's requests on main already assume.
   - PG.0, after "Include field-of-norms Galois equivalence and the descent/lifting statements required in Fontaine's construction, as explicit local proof inputs." (occurs once), insert: "Construct the field of norms for strictly APF extensions of K, or at least for the two towers the atlas uses, and prove that the cyclotomic instance agrees with the construction above. For the Kummer tower K_∞ = ∪_n K(π_n) (π_0 a uniformizer, π_{n+1}^p = π_n), which FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 uses, prove three things: K_∞/K is strictly APF; its field of norms is k((u)), with u sent to (π_n) in R; and G_{K_∞} ≅ Gal(k((u))^sep/k((u))), compatibly with the embedding of k((u))^sep into Fr R. This tower is not Galois over K. It carries no Γ_K-action and replaces the cyclotomic tower nowhere in PG."
   - PG.1, after "Extend to V and to finite torsion coefficients in the source-supported integral category." (occurs once), insert: "Prove first the Γ-free core, for any field E of characteristic p with a Cohen ring 𝒪_ℰ and a Frobenius lift. Finitely generated étale φ-modules over 𝒪_ℰ, torsion or free, are equivalent to finitely generated ℤ_p-modules with continuous G_E-action through M ↦ (𝒪̂_{ℰ^ur} ⊗ M)^{φ=1}. The equivalence is exact and compatible with ⊗, duals and lattices (Fontaine, Représentations p-adiques des corps locaux, A.1.2.6–A.1.2.7, as Kisin cites it). The (φ, Γ) equivalence of this stage adds the Γ_K-action to the cyclotomic instance. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 applies the core to E = k((u)) for the Kummer tower, with the comparison B.1.8.4 that Kisin uses for 𝔖^ur."
4. `content/campaign/PrismaticCohomology/README.md`, PR.7. Replace "Compare evaluation on the Breuil–Kisin prism with R07's Kisin functor,\nincluding uniformizer dependence and full faithfulness in the source\nrange." (occurs once) with "Compare evaluation on the Breuil–Kisin prism with the Kisin lattice functor of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (the 𝔖-lattice of finite E-height attached to a G_{K_∞}-stable lattice in a crystalline representation), including uniformizer dependence and full faithfulness in the source range."
5. FiniteFlat packet (for the FiniteFlat blueprint job):
   - a. R07.4/bk-coefficient-rings.
     - In the statement, replace "𝒪 is the ring of rigid analytic functions on the open unit u-disc (𝔖[1/p] is its subring of bounded functions)" (occurs once) with "𝒪 is the ring of rigid analytic functions on the open unit u-disc over K₀, imported as the subring O_{K₀}((0,1))_{≥0} of PadicHodgeTheory:P7:annulus-foundations/robba-ring (𝔖[1/p] is its subring of bounded functions)".
     - Add the prerequisites PadicHodgeTheory:P7:annulus-foundations/robba-ring and PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring.
   - b. R07.4/weakly-admissible-slope-zero.
     - In its prerequisites, replace PadicDifferentialEquationsAndRigidCohomology:RD.1 with PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-over-extended-robba-ring, PadicDifferentialEquationsAndRigidCohomology:RD.2/isoclinic-descent-to-bounded-robba-ring and PadicDifferentialEquationsAndRigidCohomology:RD.2/slope-filtration-for-frobenius-modules-statement.
     - Add the prerequisite PadicHodgeTheory:P7:annulus-foundations/robba-ring for ℛ.
     - In its third hypothesis, replace "Kedlaya's slope theory is requested from PadicDifferentialEquationsAndRigidCohomology RD.1:" with "Kedlaya's slope theory is imported from PadicDifferentialEquationsAndRigidCohomology RD.1 (Dieudonné–Manin over ℛ^alg) and RD.2 (the slope filtration and the descent of isoclinic modules):".
   - c. requests. Split the entry whose supplier is PadicDifferentialEquationsAndRigidCohomology:RD.1 into two entries:
     - RD.1 keeps "slopes via ℛ^alg (Kedlaya 2004, Theorem 4.16)";
     - a new entry with supplier PadicDifferentialEquationsAndRigidCohomology:RD.2 takes "the equivalence of pure slope-s modules over the bounded Robba ring and over ℛ (Slope filtrations revisited, Theorem 6.3.3), the slope filtration (Kedlaya 2004, Theorem 6.10)";
     - the Lemma 4.1 and Propositions 4.4, 4.5, 5.13 and 6.5 clause stays with RD.2 until it is matched to nodes.

     Both entries keep neededBy [R07.4/weakly-admissible-slope-zero].
6. PG packet (for the PG blueprint job): plan PG.0 and PG.1 nodes that answer the two FiniteFlat requests already on main (the Kummer field of norms; Fontaine's A.1.2.6–A.1.2.7 and B.1.8.4). Then replace the stage-level prerequisites PhiGammaModulesAndIwasawaCohomology:PG.0 and PG.1 in R07.4/kummer-etale-phi-modules by those node ids.

**Adjusted by the joint check (C3).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- RD.2 → R07.4 follows the RD packet on main. If finding /44 (low severity, outside this job) is later applied and moves the filtration theorem to RD.1, the edge may become RD.1 → R07.4, which is also acyclic. The verifier's joint table lists RD.1 → R07.4 on that assumption. Only one of the two should be applied.
- R07.4 → PR.7 is also requested by /30 ("Add R07.4 → PR.7 only with the extended Kisin functor of finding4"). It is one edge.
- The Kedlaya 2004 lemmas that Kisin cites (Lemma 4.1, Propositions 4.4, 4.5, 5.13, 6.5) are not matched to RD nodes here. I did not read them.
- If PG's owner declines the Kummer tower, the verifier's other option applies: construct the Kummer field of norms and the k((u)) case of Fontaine's equivalence as R07.4 nodes, with an explicit comparison to PG.1's core. That option needs no PG edges. I did not choose it, because Fontaine's A.1.2.6 for a general field of characteristic p would then be planned twice.

## /5 (high, missing): Tate's p-divisible-group theorems are now in R07.1, but Raynaud §4 is unplanned, Faltings's uses are mis-cited, and the Tate–Sen input runs backwards in the full graph

**The finding and the verdict.** Faltings's finiteness proof (FaltingsFinitenessAndIsogenyTheorems:R28.2 and FaltingsFinitenessAndIsogenyTheorems:R28.5) uses Tate's p-divisible-group results: Proposition 2, Theorem 2, and Theorem 3 Corollary 2. Raynaud's Proposition 2.3.1 also needs Tate's full faithfulness. Faltings further uses Raynaud's Théorème 4.1.1, and the finding adds Théorème 4.2.1. FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1's text scopes Raynaud to §§2–3, and neither R07.1 nor FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 names Tate. The verifier confirmed this with corrections. First, "Tate’s original Proposition 2 (printed p.164) is a discriminant formula; derive the invariant-differential length used by Faltings rather than relabeling the proposition". Second, Theorem 2 "is H^0/H^1 vanishing for a character defining an eventually totally ramified Z_p-extension". The "C-realization C(k) implies cyclotomic^k times finite order" form additionally uses "its GLOBAL class-field-theoretic character form. Preserve those hypotheses and separate that deduction". Third, Raynaud §§4.1–4.2 hold "with strictly henselian mixed-characteristic base and e≤p−1 only where 4.1.1 imposes it", and the fix must "Preserve the deformation-to-ordinary proof input for 4.2.1". Finally, "R07.2 → R28.2 ALREADY EXISTS via accepted fine links … R07.1 also already reaches R28.5."

**Checked.**
- R07.1 (FiniteFlat README): "Also construct the (p,…,p)-type classification and its tame inertia characters used in R07.5 (Bull. SMF 102 (1974), §§2–3, especially Theorems 3.4.1/3.4.3)." The accepted RS-02 narrows R07.1, and its keeps names neither Tate nor Raynaud §4.
- Already on main. The FiniteFlat packet (checkpoint 2, PR #3827, 28 September) has:
  - R07.1/p-divisible-discriminant ("Tate67 (2.2), Proposition 2 and Lemma 1, pp. 164–165": "The discriminant ideal of A_v over R is generated by p^{nvp^{hv}}");
  - R07.1/hodge-tate-p-divisible (Tate (4.1), Theorem 3 and its Corollary 1, pp. 179–180; the decomposition is sourced to Stix, Corollary 93);
  - R07.1/tate-generic-fibre-theorem (Tate (4.2), Theorem 4 and Corollaries 1–2, pp. 180–181);
  - R07.1/raynaud-extension-of-generic-p-divisible (Raynaud, Proposition 2.3.1, whose uniqueness step cites R07.1/tate-generic-fibre-theorem).

  Source Tate67 records the sections read: "§2 … Proposition 2 (discriminants)", "§3.3 (pp. 176–177): Theorems 1 and 2 on the Galois cohomology of C", "§4 … Theorem 3 and its corollaries, Theorem 4". So Tate's discriminant formula, Hodge–Tate decomposition and full faithfulness are planned. The invariant-differential order that Faltings uses is not.
- Tate's Theorem 2 is planned as PadicHodgeTheory:R06.1/tate-sen-theorem (P7 packet): "If η(I_K) is infinite then H^0_cont(G_K, C(η)) = H^1_cont(G_K, C(η)) = 0; if η(I_K) is finite these are 1-dimensional". It is stated for K/Q_p finite. R07.1/hodge-tate-p-divisible's first proof step says: "Tate–Sen (requested from PadicHodgeTheory R06.1)". The request asks for K "complete discretely valued of characteristic 0 with perfect residue field".
- Raynaud §4 is not planned. The packet has no node for 4.1.1, 4.2.1 or the appendix. Source Raynaud74 records §§1.2–3.4 and §2.3 read, not §4 or the appendix. The unreviewed EXT-07 draft has R07.1/determinant-of-the-generic-fibre-by-the-tame-different-character, R07.1/absolute-different-and-haar-measures-of-a-finite-flat-group and R07.6/determinant-of-the-tate-module-of-a-p-divisible-group.
- The Faltings decomposition (`data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json`):
  - R28.2/local-differential-computation-for-the-l-divisible-tower quotes Faltings: "by Tate, p-divisible groups, Proposition 2, # s^*(Omega^1_{(G_i)_n/R_i}) = l^{n . m_i . d_i}". Its first proof step reads Theorem 2 as "the statement that a character of D whose C-realization is C(+k) differs from chi_0^k by a character of finite order".
  - R28.2/global-determinant-identity-forcing-sum-m-i-d-i-equals-mh-over-two: "Class field theory gives chi = (l-adic power of chi_0) . (character of finite order)", then "by Tate's Theorem 2 the exponent is sum m_i d_i".
  - R28.5/determinant-character-of-the-kernel-computed-by-raynaud uses 4.1.1 with "l^d = # s^*(Omega^1_{G/R})".
  - Two gaps: "Tate, p-divisible groups (Driebergen 1966) is absent from the supplied library", and "Raynaud's Theoreme 4.1.1 has no supplier stage …", which names the link to restore. No Faltings node cites 4.2.1.
- RS-06 (accepted) links R07.1 → R28.2 and R07.1 → R28.3. Its R28.5 reason ends: "Raynaud 4.1.1/different comparison remains an explicit unsupplied proof boundary."
- Paths.
  - On the RS graph, R07.1 → R28.2 is a direct edge.
  - R07.1 reaches R28.5 only through R01.6 (the RS-02 link R07.1 → R01.6, then the RS-06 link R01.6 → R28.5).
  - R07.2 reaches R28.2 and R28.5 through R07.3 → R06.4 → R06.5 → R06.6.
  - R07.1 → R07.2 is an RS-02 link.
- The Tate–Sen direction. In the full build graph there is a path R07.1 → ModularCurvesPartII:R13.2 (RS-06) → AdicSpacesPartII:R2 → AdicSpacesPartII:R3 → PadicHodgeTheory:R06.1 (RS-05). The step into R2 is an edge of the promoted AdicSpacesPartII blueprint: "Conrad's Hasse-invariant loci … of a generalized elliptic curve are admissible opens uses ModularCurvesPartII:R13.2". So the edge R06.1 → R07.1, which the Tate–Sen request implies, closes a cycle in the build graph. It is acyclic only on stageEdges and on the RS graph.
- The Tate–Sen chain of the P7 packet uses only Mathlib plus the packet's request to Tau Ceti LocalFieldsRamification Layer 3. The chain is R06.1/galois-action-on-cp, cp-integers-p-adically-complete, ax-sen-lemma, ax-sen-tate-invariants, semilinear-galois-descent, tate-trace-almost-surjective, tate-sen-axioms-cyclotomic, tate-sen-vanishing-on-hk and tate-sen-theorem (I followed the prerequisites transitively). No atlas stage text mentions Tate–Sen, so there is one owner.
- No atlas stage mentions Zariski–Nagata purity or purity of the branch locus. Raynaud's proof of 4.2.1 uses it, as the EXT-07 draft reads that proof.
- Acyclicity. The new sub-stage's edges and R07.1 → R28.5 pass every check on the graphs listed under /4 (alone, jointly, with the verifier's 61 edges and with the padic-1 RS-format links). R07.1's ancestors go from 7 to 9.

**Fix, as edits.**
1. New sub-stage PadicHodgeTheory:R06.1:tate-sen, so that R07.1 and R28.2 can import Tate–Sen without R06.1's period-ring imports. In `content/campaign/PadicHodgeTheory/README.md`, insert after R06.1's Dependencies line "**Dependencies:** [AInfCohomology AI.0:integral](../AInfCohomology/README.md); … [PerfectoidSpaces P2](../PerfectoidSpaces/README.md)." (occurs once) and before `<a id="r06-2"></a>`:

   ```markdown
   <a id="r06-1-tate-sen"></a>
   <a id="stage-R06.1:tate-sen"></a>

   ### R06.1:tate-sen. Galois cohomology of C (Tate–Sen)

   Let K be a complete discretely valued field of characteristic 0 with perfect residue field of characteristic p, and C the completion of an algebraic closure of K. Construct the continuous isometric G_K-action on C. Prove the Ax–Sen lemma and Ax–Sen–Tate (C^H is the completion of the fixed field of H), Hilbert 90 and completed unramified descent, and Tate's almost-surjectivity of traces in a ramified ℤ_p-extension. Prove the normalized traces on the cyclotomic tower, and the vanishing of H^n(H_K, W) for C-representations W. Prove the Tate–Sen theorem (Tate, p-divisible groups, §3.3, Theorems 1–2). Let η be a continuous character whose image is a p-adic Lie group of dimension at most one. If η(I_K) is infinite, then H^0(G_K, C(η)) = H^1(G_K, C(η)) = 0. If η(I_K) is finite, both are one-dimensional over K. Record the corollary: C(ψ) ≅ C(k) as semilinear G_K-modules if and only if ψχ^{-k} has finite image on inertia. This is a local statement. The global "χ^k times a character of finite order" needs class field theory and belongs to its consumer. The stage uses Mathlib's ℂ_p and the ramification filtration only. It needs none of R06.1's period-ring imports. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (Tate's Hodge–Tate decomposition) and FaltingsFinitenessAndIsogenyTheorems R28.2 import it directly.

   **Dependencies:** Tau Ceti LocalFieldsRamification, Layer 3 (ramification, the tame and wild cases, and the filtration).
   ```

   In the same file, §R06.1, after "Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects." (occurs once), insert: "The Galois cohomology of C (Ax–Sen–Tate and Tate–Sen) is the early sub-stage R06.1:tate-sen, which uses none of these imports."
2. data/atlas.json:
   - Add the stage object:
     - {"id": "PadicHodgeTheory:R06.1:tate-sen", "owner": "PadicHodgeTheory", "key": "R06.1:tate-sen", "title": "Galois cohomology of C (Tate–Sen)", "description": the README text above, "requires": ["tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration"], "consumers": ["PadicHodgeTheory:R06.1", "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1", "FaltingsFinitenessAndIsogenyTheorems:R28.2"], "parentStageId": "PadicHodgeTheory:R06.1", "origin": "campaign", "sourcePath": "content/campaign/PadicHodgeTheory/README.md", "isLeaf": true};
     - status fields as for PadicHodgeTheory:P7:annulus-foundations; depth and line numbers by the usual tooling.
   - Set R06.1's isLeaf to false. Add R06.1:tate-sen to the requires of R06.1 and of R07.1.
   - Add stageEdges:
     - tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration → PadicHodgeTheory:R06.1:tate-sen
     - PadicHodgeTheory:R06.1:tate-sen → PadicHodgeTheory:R06.1 (the sub-stage-to-parent edge, as P7:annulus-foundations → P7 has)
     - PadicHodgeTheory:R06.1:tate-sen → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1
     - PadicHodgeTheory:R06.1:tate-sen → FaltingsFinitenessAndIsogenyTheorems:R28.2 (also produced by link L2 of edit 8)
   - In the R07.1 Dependencies line of the FiniteFlat README, "**Dependencies:** [AlgebraicModuliForArithmeticGeometry R09.3](../AlgebraicModuliForArithmeticGeometry/README.md#r09-3)." (occurs once), append "; [PadicHodgeTheory R06.1:tate-sen](../PadicHodgeTheory/README.md#r06-1-tate-sen)".
3. P7 packet (`research/blueprint/packets/PadicHodgeTheory--P7.json`, for its blueprint job):
   - Set parentStageId and realises to PadicHodgeTheory:R06.1:tate-sen for the nine nodes listed under Checked. Keep their ids, so the references to them from other packets stay valid.
   - Add R06.1:tate-sen to scope and coverage.
   - The LocalFieldsRamification request, whose neededBy are two of these nodes, then belongs to the sub-stage. Its neededBy ids do not change.
   - In R06.1/tate-sen-theorem, widen "Let K/Q_p be finite" to the complete discretely valued fields of characteristic 0 with perfect residue field that R07.1 needs, if Brinon–Conrad's standing convention for "p-adic field" allows it (not checked here). If it does not, add that generality as its own node.
   - Add the corollary of the stage text to the node's statement.
4. FiniteFlat README, §R07.1. After "(Bull. SMF 102 (1974), §§2–3, especially Theorems 3.4.1/3.4.3)." insert: "Prove Tate's theorems for p-divisible groups (Tate, p-divisible groups, 1967) under the source's base hypotheses. First, the discriminant of the levels (Proposition 2). Second, derived from Proposition 2 and its Lemma 1, the invariant differentials of the levels: ω_{G[p^n]} ≅ (R/p^n)^d for G of dimension d over a complete mixed-characteristic discrete valuation ring R, which is the order Faltings uses. Third, the Hodge–Tate decomposition of T_p(G) ⊗ C (Theorem 3 and its Corollary 2), importing Tate–Sen from PadicHodgeTheory R06.1:tate-sen. Fourth, full faithfulness of G ↦ G_K (Theorem 4 and its corollaries), which the uniqueness in Raynaud's Proposition 2.3.1 uses. Prove Raynaud's Théorème 4.1.1 (§4.1). Let R be a strictly henselian discrete valuation ring of unequal characteristics with e ≤ p−1. For a finite flat commutative R-group scheme killed by p, Galois acts on det of its generic fibre through the tame character τ_p^{v(D)}, where D is the absolute different of Raynaud's appendix 'Trace et différente'. Also prove the comparison of v(D) with the length of the invariant differentials that Faltings uses."
5. FiniteFlat README, §R07.2. After "Supply the deformation results needed for p-divisible groups over nilpotent thickenings." (occurs once) insert: "Prove Raynaud's Théorème 4.2.1 (§4.2). For a p-divisible group X of height h and dimension d over a strictly henselian discrete valuation ring of unequal characteristics, with no bound on e, Galois acts on det T(X) through τ^d, where τ is the character of T(μ_{p^∞}). Its proof uses the deformation theory of this stage, Raynaud's Lemme 4.2.3 (the universal deformation is ordinary above the generic point of its special fibre) and Zariski–Nagata purity." RT-AREA-padic-1/26 inserts its Hasse-invariant sentence into R07.2 after the preceding sentence ("Include Frobenius/Verschiebung, …"), so the two insertions do not overlap.
6. RS-02 (`data/restructure/RS-02.result.json` and `research/blueprint/restructure/RS-02.result.json`, which are identical; for the restructuring job):
   - layers[R07.1].keeps: after "Retain multiplicative, constant, ordinary-nonsplit, supersingular and distinct-integral-model tests." append "Retain Tate's p-divisible-group theorems in the source's generality: the discriminant of the levels and, derived from it, their invariant differentials; the Hodge–Tate decomposition, importing Tate–Sen from PadicHodgeTheory R06.1:tate-sen; and generic-fibre full faithfulness. Retain Raynaud's §4.1 Théorème 4.1.1 with the absolute different of his appendix and its comparison with invariant differentials (RT-AREA-padic-2/5)."
   - layers[R07.2].keeps: after "Retain every small-prime exception and source-qualified extension rather than asserting the equivalence for arbitrary thickenings." append "Retain Raynaud's §4.2 Théorème 4.2.1 (det T(X) = τ^d over strictly henselian bases of unequal characteristics), proved from the deformation theory here (RT-AREA-padic-2/5)."

   The keep is placed in R07.2, not in R07.1 as the finding has it. 4.2.1 needs R07.2's deformation theory, and R07.1 → R07.2 is an RS-02 link, so an R07.1 node needing R07.2 would close a cycle.
7. FiniteFlat packet (for its blueprint job). Read Raynaud §4 (pp. 271–274) and the appendix (pp. 274–279) on numdam first; the EXT-07 statements are unreviewed candidates. Add these nodes:
   - R07.1/invariant-differentials-of-levels (lemma).
     - Statement: let R be a complete discrete valuation ring of mixed characteristic (0, p) and G a p-divisible group over R of dimension d. For every n ≥ 1, ω_{G[p^n]} = e^*Ω^1_{G[p^n]/R} ≅ (R/p^nR)^d. Hence its length is n·d·v_R(p), and when the residue field is finite its order is p^{n·d·[K:Q_p]}. This is Faltings's l^{n·m_i·d_i}.
     - Proof route: the conormal sequence of the connected–étale sequence of the level gives ω_{G[p^n]} ≅ ω_{G°[p^n]}. For G° = Spf R⟦X_1, …, X_d⟧, [p^n](X) ≡ p^n X modulo degree 2. So the augmentation ideal I of R⟦X⟧/([p^n]) has I/I² = ⊕ R X_i / p^n R X_i.
     - Prerequisites: R07.1/serre-tate-connected-p-divisible, R07.1/p-divisible-connected-etale, R07.1/p-divisible-dimension, R07.1/p-divisible-discriminant.
     - Sources: Tate67 (2.2), Lemma 1 in the proof of Proposition 2, which computes the same Jacobian. The node is a derivation, not a printed statement.
   - R07.1/raynaud-absolute-different (definition, with Proposition 9). Invariant and Haar measures, and the absolute different D(𝒢) of a finite locally free commutative group scheme, with D(𝒢)·D(𝒢^∨) = (rank). Source: Raynaud 1974, appendix, Definitions 5 and 8, Proposition 9, pp. 274–279.
   - R07.1/absolute-different-and-invariant-differentials (lemma). For 𝒢 finite flat commutative over a discrete valuation ring R, v_R(D(𝒢)) = length_R(ω_𝒢). This is what makes Faltings's "l^d = # s^*(Omega^1_{G/R})" the exponent in 4.1.1. No source was read for it. A candidate route: D(𝒢) is the different of the Hopf algebra A; for a finite flat complete-intersection algebra the different is the Fitting ideal of Ω^1_{A/R} (Tate 1967, p. 165, which Raynaud cites); and Ω^1_{A/R} ≅ A ⊗_R ω_𝒢.
   - R07.1/raynaud-determinant-tame-character (theorem).
     - Statement: Raynaud, Théorème 4.1.1, p. 272, under §4's standing hypothesis "R strictement hensélien, d'inégales caractéristiques" (p. 271) and "Supposons e ≤ p−1". For 𝒢 finite, flat, commutative and killed by p, of order p^h, Galois acts on det G = Λ^h G through τ_p^{v(D(𝒢))}.
     - Prerequisites: R07.1/raynaud-tame-inertia, R07.1/raynaud-classification, R07.1/raynaud-simple-objects, R07.1/raynaud-absolute-different.
     - Proof route: first the F-vector-scheme case through Théorème 3.4.1 and the different ∏ δ_i; then dévissage (Corollaire 3.3.7, which needs e ≤ p−1).
     - Acceptance: μ_p over W(k̄), where v(D) = 1 and the character is τ_p. Also Remarque 4.1.2: the e-free statement holds only for p-kernels of p-divisible groups, through 4.2.1.
   - R07.2/universal-deformation-generically-ordinary (lemma). Raynaud, Lemme 4.2.3: the universal deformation over the complete local ring of a versal deformation of X_k is ordinary above the generic point of its special fibre. Read the exact statement on p. 273.
   - R07.2/raynaud-determinant-of-tate-module (theorem).
     - Statement: Raynaud, Théorème 4.2.1 and Remarque 4.2.2, pp. 272–273. X is a p-divisible group of height h and dimension d over R strictly henselian of unequal characteristics, with no bound on e, and det T(X) has character τ^d.
     - Prerequisites: R07.1/p-divisible-tate-module, R07.1/p-divisible-dimension, R07.2/universal-deformation-generically-ordinary, and R07.2's Grothendieck–Messing node once it is planned (the versal deformation ring is a power series ring).
     - Add a gap for Zariski–Nagata purity (no supplier in the atlas).

   In R07.1/hodge-tate-p-divisible:
   - add the prerequisite PadicHodgeTheory:R06.1/tate-sen-theorem;
   - add the source locator "Tate67, (4.1), Theorem 3, Corollary 2";
   - in the first proof step, replace "requested from PadicHodgeTheory R06.1" with "PadicHodgeTheory R06.1:tate-sen".

   In requests, change the supplier of the Tate–Sen entry ("Tate–Sen: for K complete discretely valued of characteristic 0 …") from PadicHodgeTheory:R06.1 to PadicHodgeTheory:R06.1:tate-sen.
8. Faltings decomposition (`data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json`, for the maintainer):
   - Node R28.2/local-differential-computation-for-the-l-divisible-tower.
     - Replace hypothesis "Tate's results are quoted as [13]: Proposition 2, Theorem 2, and Theorem 3 Corollary 2" with "Tate's results are quoted as [13]: Proposition 2, Theorem 2, and Theorem 3 Corollary 2. Suppliers: the order of s^*(Omega^1) is FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1's invariant-differentials lemma, derived from Proposition 2 (a discriminant formula) and its Lemma 1; the decomposition is R07.1's Hodge–Tate node; Theorem 2 is PadicHodgeTheory R06.1:tate-sen's Tate–Sen theorem".
     - In the first proof step, replace "and the statement that a character of D whose C-realization is C(+k) differs from chi_0^k by a character of finite order (Theorem 2)." with "and Tate's Theorem 2 (H^0 and H^1 of C(η) vanish when η has infinite image on inertia), which gives that a character of D whose C-realization is C(+k) agrees with chi_0^k on an open subgroup of inertia; the finite-order statement for the global character is the class-field-theory step of the next node."
   - Node R28.2/global-determinant-identity-forcing-sum-m-i-d-i-equals-mh-over-two. After the proof step "The local Hodge-Tate computation gives L otimes C = C(+ sum m_i d_i) as D-module, so by Tate's Theorem 2 the exponent is sum m_i d_i." append "(Tate's Theorem 2 is the local Tate–Sen theorem of PadicHodgeTheory R06.1:tate-sen; combined with the class-field-theory step it gives the global exponent)".
   - Add links:
     - L1 {"source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1", "target": "FaltingsFinitenessAndIsogenyTheorems:R28.2/local-differential-computation-for-the-l-divisible-tower", "reason": "R07.1 plans the invariant differentials of the levels (derived from Tate's Proposition 2 and Lemma 1) and Tate's Hodge–Tate decomposition (Theorem 3, Corollary 2), the two local inputs Faltings quotes on p. 359."}
     - L2 {"source": "PadicHodgeTheory:R06.1:tate-sen", "target": "FaltingsFinitenessAndIsogenyTheorems:R28.2/global-determinant-identity-forcing-sum-m-i-d-i-equals-mh-over-two", "reason": "Tate's Theorem 2, the local Tate–Sen theorem; the global finite-order deduction is this node's class-field-theory step."}
     - L3 {"source": "FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1", "target": "FaltingsFinitenessAndIsogenyTheorems:R28.5/determinant-character-of-the-kernel-computed-by-raynaud", "reason": "Raynaud's Théorème 4.1.1 (Faltings's '[10], Théorème 4.11') with the comparison of the absolute different and invariant differentials; this is the link the gap on 4.1.1 asks to restore."}

     These use stage-level sources, as the existing link from NeronModelsAndSemistableAbelianVarieties:R11.3 does. Re-point L1 and L3 to the node ids of edit 7 when the FiniteFlat packet is promoted. L2 needs edit 2 first.
   - Remove the two gaps "Tate, p-divisible groups (Driebergen 1966) is absent from the supplied library" and "Raynaud's Theoreme 4.1.1 has no supplier stage, and its supplier node sits in an unreviewed packet". The FiniteFlat packet has read Tate's §§2, 3.3 and 4 (source Tate67, a Purdue scan; its §4, pp. 177–183, includes the p. 182 that Faltings's erratum cites), and L3 restores the 4.1.1 link.
9. RS-06, both identical copies (for the restructuring job):
   - layers[R28.5].reason: replace "Raynaud 4.1.1/different comparison remains an explicit unsupplied proof boundary." with "Raynaud 4.1.1 and the comparison of the absolute different with invariant differentials are supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (RT-AREA-padic-2/5)."
   - Add FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 to layers[R28.5].suppliedBy, and PadicHodgeTheory:R06.1:tate-sen to layers[R28.2].suppliedBy.
10. `content/campaign/HodgeTateAndCanonicalSubgroups/README.md`, T2. After "Prove the displayed Hodge–Tate exact sequence and its relative form on the pro-étale site." (occurs once) insert: "Over the ring of integers of a complete discretely valued field with perfect residue field, Tate's Hodge–Tate decomposition of a p-divisible group is FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1's; prove the sequence here compatible with it rather than proving it again." The link R07.1 → T2 is already an RS-02 link. This edit does not touch the T2 lines that RT-AREA-padic-1/22 edits.

**Adjusted by the joint check (C1, C2).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- No new stage edge is needed for R28.2 or for 4.2.1, as the verifier said. R07.1 → R28.2 is direct, and R07.2 already reaches R28.2 and R28.5. The only new direct edges into R28 are R07.1 → R28.5 (link L3; the path through R01.6 already exists) and R06.1:tate-sen → R28.2.
- No Faltings node cites Raynaud 4.2.1. It is planned because the verifier confirmed Raynaud §4.2 as a missing supplier. I did not check Faltings's paper.
- The absolute-different comparison has no source yet (edit 7). Zariski–Nagata purity has no owner in the atlas. Both are recorded as gaps.
- The build-graph path through the AdicSpacesPartII:R2 blueprint edge from ModularCurvesPartII:R13.2 (an elliptic-curve application placed in a foundational layer) is what forces the Tate–Sen sub-stage. Moving that node would be for the AdicSpacesPartII owner. The sub-stage is correct either way.
- For residue fields that are perfect but not finite, whether Tau Ceti LocalFieldsRamification Layer 3 covers the ramification input of Tate–Sen was not checked. Its request on main speaks of p-adic fields.

## /6 (high, error): PR.4 plans the étale comparison only for smooth formal schemes

**The finding and the verdict.** PrismaticCohomology:PR.4 plans the étale comparison "for a perfect base prism and the smooth formal scheme of BS22 §9". But BS22 Theorem 9.1 holds for every p-adic formal scheme over a perfectoid ring, using derived prismatic cohomology, and its proof works arc_p-locally on perfectoid rings. The verifier confirmed it "as a scope/source mismatch, not a counterexample to the smooth special case". It asks for:
- the derived nearby-cycle and affine forms, with Theorem 1.8(4) kept as the smooth specialisation;
- Lemma 9.2 and Remark 9.3 "with their proof obligations";
- reuse of PR.2's derived extension.

It also warns: "Do not turn Theorem 9.1 into an unrestricted syntomic comparison; Theorem 9.4 distinguishes positive Tate twists from twist zero." Main has moved since then. The BS22 extraction, accepted after the verification, already routes the general theorem to PR.4. Only the stage text is still wrong.

**Checked.**
- PrismaticCohomology README ll. 134–139, identical to the atlas description, reads "For a **perfect** base prism and the smooth formal scheme of BS22 §9, construct the comparison from generic-fiber Z/p^n étale cohomology to (Δ/p^n[1/I])^(phi=1)". PR.4 requires PerfectoidQuotients:Q4 and PR.3, and its only consumer is PR.7.
- BS22 TeX, Theorem 9.1: "Fix a perfectoid ring R corresponding to a perfect prism (A,(d)), and a p-adic formal scheme X over R … R μ_* Z/p^n ≃ (Δ_{X/A}[1/d]/p^n)^{φ=1}". Its affine form is RΓ(Spec(S[1/p]), Z/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^{φ=1}. The theorem is followed by "Note that there are no restrictions on the singularities of X above."
- Theorem 1.8(4) is "Assume A is perfect", stated inside Theorem 1.8, whose preamble takes "a smooth p-adic formal scheme over A/I".
- Lemma 9.2 is stated for "an F_p-algebra B equipped with an element t ∈ B".
- Remark 9.3 reads "There is also a variant … without inverting p or d … Z/p^n ≃ (Δ_{X/A}/p^n)^{φ=1} of étale sheaves on X … we leave this to the reader".
- Theorem 9.4 has separate statements "For any integer n ≥ 1" and "For n = 0".
- Proof of 9.1: "F is an arc_p-sheaf by [BhattMathew, Corollary 6.17]". G is handled through Δ_{S/A,perf}: "an arc-sheaf as S ↦ S_perfd is so (Corollary 8.11)". The proof then says "there are two ways to finish the proof": perfectoid S, or products of absolutely integrally closed valuation rings (Remark 8.9).
- `research/blueprint/papers/PAPER-BHATT-SCHOLZE-22.result.json`:
  - Item /53 (Theorem 9.1, Remark 9.3, Theorem 1.8(4)) is "missing".
  - Route 1 carries /53, with the reason "PR.4: the étale comparison theorem for arbitrary p-adic formal schemes over a perfectoid ring (item 53); PR.4 plans only the smooth case".
  - Items /54 (Lemma 9.2) and /55 (Theorem 9.4) are planned at PR.4.
  - Commit order: the review accepting this is a4607bc0 (24 September, 16:06). The red team (68f991b1) is from 09:40 and the verification (70f7a571) from 10:23.
- PR.2 plans "the coherent left Kan extension of BS22 Construction 7.6", which is the derived functor Δ_{S/A}.
- `data/decompositions/PrismaticCohomology.json` has PR.4 coverage "not_read" and no PR.4 nodes. `research/blueprint/queue.json` has blueprint jobs only for PR.0 and PR.8.
- No stage edge changes in this section.

**Fix, as edits.**
1. README §PR.4 and the atlas description of PrismaticCohomology:PR.4. Replace
   `For a **perfect** base prism and the smooth formal scheme of BS22 §9, construct the comparison from generic-fiber Z/p^n étale cohomology to (Δ/p^n[1/I])^(phi=1). Define phi=1 as a derived fixed-point/fiber construction, not fixed vectors in H^0. Establish descent, perfectoid local calculations, coefficient compatibility and passage to Z_p with the required derived limits.`
   with
   ```text
   For a **perfect** base prism (A,(d)) with perfectoid ring R = A/d and every
   p-adic formal scheme X over R, with no smoothness or singularity hypothesis,
   construct the canonical identification Rμ_*Z/p^n ≃ (Δ_{X/A}[1/d]/p^n)^(phi=1)
   of BS22 Theorem 9.1. Here X_η = X ×_{Spf R} Spa(R[1/p],R) is the adic generic
   fibre, μ: X_{η,ét} → X_ét is the nearby-cycles map and Δ_{X/A} is PR.2's
   derived prismatic cohomology. Prove the affine form
   RΓ(Spec(S[1/p]), Z/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^(phi=1) for X = Spf(S) and each
   n ≥ 0. For smooth X this is BS22 Theorem 1.8(4). Define phi=1 as a derived
   fixed-point/fiber construction, not fixed vectors in H^0. Prove BS22 Lemma
   9.2: for an F_p-algebra B with t ∈ B, the functors M ↦ M^(phi=1) and
   M ↦ (M[1/t])^(phi=1) on derived t-complete Frobenius modules commute with
   colimits. Follow BS22's proof. Both sides are arc_p-sheaves: the étale side by
   Bhatt–Mathew Corollary 6.17, the prismatic side through the perfection
   Δ_{S/A,perf}, Lemma 9.2 and BS22 Corollary 8.11. Check the comparison
   arc_p-locally, either on perfectoid S by Artin–Schreier–Witt, Huber's
   comparison of Spec(S[1/p]) with Spa(S[1/p],S) and tilting of étale sites
   (PerfectoidSpaces P3), or on products of p-complete absolutely integrally
   closed valuation rings of rank at most 1 (BS22 Remark 8.9), where both sides
   are explicit. Import the arc_p-topology, arc_p-descent, BS22 Definition 8.7 to
   Proposition 8.10 and Huber's comparison for perfectoid S from
   ArcTopologyAndDescent, and BS22 Corollary 8.11 from the Part II of
   PerfectoidQuotients; neither roadmap is in the atlas yet. Prove separately the
   étale-sheaf form without inverting p or d, Z/p^n ≃ (Δ_{X/A}/p^n)^(phi=1) on
   X_ét (BS22 Remark 9.3, whose proof the source leaves to the reader). Establish
   coefficient compatibility and passage to Z_p with the required derived limits.
   This is a statement about phi-fixed points of the unfiltered prismatic
   complex, not a comparison of syntomic Z_p(n) with étale cohomology; BS22
   Theorem 9.4 treats the twists n ≥ 1 and n = 0 separately.
   ```
2. The Sources sentence of PR.4. This is one joint edit for /6, /24, /25 and /28. Replace
   `Sources: BS22 §§9,11,14; BMS2 §10 and Bhatt–Lurie §§7–8.`
   with
   ```text
   Sources: BS22 §§9, 11, 14 (Theorems 9.1 and 9.4, Lemma 9.2, Remark 9.3 and
   Theorem 1.8(4)); BMS2 §§7.4, 10; Bhatt–Lurie §§7–9 (Construction 7.4.1, §8 with
   Construction 8.4.1, and the syntomic calculations of §9). Imported:
   Bhatt–Mathew Definitions 6.14 and 6.19 and Corollary 6.17, BS22 Definition 8.7
   to Corollary 8.11, and Hub96 Lemma 3.2.5 and Corollaries 3.2.2–3.2.3.
   ```
3. Nodes for the PR.4 blueprint, in packet format. They go into the PR.4 packet when BP-PrismaticCohomology--PR.4 is queued. The maintainer may also enter them in `data/decompositions/PrismaticCohomology.json` before then.
   ```json
   [{"id": "PrismaticCohomology:PR.4/phi-fixed-points-completed-colimits", "parentStageId": "PrismaticCohomology:PR.4", "realises": ["PrismaticCohomology:PR.4"], "title": "Frobenius fixed points commute with completed colimits", "kind": "lemma",
     "statement": "Let B be an F_p-algebra with t ∈ B, D(B[F]) the ∞-category of pairs (M, φ: M → φ_*M) with M ∈ D(B), and D_comp(B[F]) the full subcategory with M derived t-complete. Then M ↦ M^{φ=1} and M ↦ (M[1/t])^{φ=1}, from D_comp(B[F]) to D(F_p), commute with colimits.",
     "proofSteps": ["The fibre of colim M_i → (colim M_i)^ is uniquely t-divisible, so it suffices to treat M ↦ M^{φ=1}.", "For N derived t-complete, N^{φ=1} ≃ (N/t)^{φ=1}: φ is topologically nilpotent on the fibre of N → N/t for the t-adic filtration, since φ(t) = t^p ∈ t²B.", "N ↦ N/t and (−)^{φ=1} on D(B[F]) commute with all colimits."],
     "prerequisites": ["DerivedDeRhamCohomology:DD.1"],
     "sources": [{"sourceId": "bs-prisms-2022", "locator": "Lemma 9.2 and proof, p. 71", "excerpt": "Then the functors D_comp(B[F]) → D(F_p) given by M ↦ M^{φ=1} and M ↦ (M[1/t])^{φ=1} commute with colimits.", "match": "Statement as printed; the item is PAPER-BHATT-SCHOLZE-22/54."}], "implementationStatus": "unchecked"},
    {"id": "PrismaticCohomology:PR.4/etale-comparison", "parentStageId": "PrismaticCohomology:PR.4", "realises": ["PrismaticCohomology:PR.4"], "title": "The étale comparison for p-adic formal schemes over a perfectoid ring", "kind": "comparison",
     "statement": "Let R be perfectoid with perfect prism (A,(d)) and X a p-adic formal scheme over R, with X_η = X ×_{Spf R} Spa(R[1/p],R) and μ: X_{η,ét} → X_ét. There is a canonical identification Rμ_*Z/p^n ≃ (Δ_{X/A}[1/d]/p^n)^{φ=1}; for X = Spf(S), RΓ(Spec(S[1/p]), Z/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^{φ=1} for every n ≥ 0. Δ is the derived prismatic cohomology of PR.2, and φ=1 is a derived fixed-point fibre.",
     "hypotheses": ["No smoothness or singularity hypothesis on X.", "The base prism is perfect."],
     "proofSteps": ["F(S) = RΓ(Spec(S[1/p]), Z/p^n) is an arc_p-sheaf (Bhatt–Mathew Corollary 6.17), arc_p-locally concentrated in degree 0, so it is the arc_p-sheafification of H^0(F).", "G(S) = (Δ_{S/A}[1/d]/p^n)^{φ=1} equals (Δ_{S/A,perf}[1/d]/p^n)^{φ=1} by PR.4/phi-fixed-points-completed-colimits. It is an arc-sheaf by BS22 Corollary 8.11, and an arc_p-sheaf because Δ_{S'/A,perf}[1/d]/p^n = 0 when pS' = 0 (Example 8.3).", "Build F → RΓ_{arc_p}(−, Z/p^n) → G and check it arc_p-locally: on perfectoid S by Artin–Schreier–Witt, W(S^♭)[1/d]/p^n, Huber's comparison and tilting of étale sites; or on products of absolutely integrally closed valuation rings of rank ≤ 1 (Remark 8.9)."],
     "prerequisites": ["PrismaticCohomology:PR.2", "PrismaticCohomology:PR.4/phi-fixed-points-completed-colimits", "SchemeAndStackFoundations:SF.2", "ClassicalAdicEtaleCohomology:H0", "PerfectoidSpaces:P3"],
     "sources": [{"sourceId": "bs-prisms-2022", "locator": "Theorem 9.1 and proof, pp. 71–73", "excerpt": "Note that there are no restrictions on the singularities of X above.", "match": "Scope of the node."}], "implementationStatus": "unchecked"},
    {"id": "PrismaticCohomology:PR.4/etale-comparison-uninverted", "parentStageId": "PrismaticCohomology:PR.4", "realises": ["PrismaticCohomology:PR.4"], "title": "The étale comparison without inverting p or d", "kind": "comparison",
     "statement": "For a p-adic formal scheme X over R there is a canonical identification Z/p^n ≃ (Δ_{X/A}/p^n)^{φ=1} of étale sheaves on X, for all n ≥ 0.",
     "proofSteps": ["Proof obligation: the source leaves it to the reader. Theorem 9.4 uses it for n = 0."],
     "prerequisites": ["PrismaticCohomology:PR.4/etale-comparison"],
     "sources": [{"sourceId": "bs-prisms-2022", "locator": "Remark 9.3, p. 73", "excerpt": "There is also a variant of Theorem 9.1 without inverting p or d", "match": "Statement as printed."}], "implementationStatus": "unchecked"}]
   ```
   The requests entries that go with these nodes are in /24.
4. PAPER-BHATT-SCHOLZE-22 needs no change. Route 1 already sends item /53 to PR.4, and edit 1 is the change its reason asks for.

**Adjusted by the joint check (C7).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- Theorem 9.4 and the existing sentence "syntomic cohomology is not automatically all generic-fiber étale cohomology in every degree on every singular input" stay. The verifier's warning is carried by edit 1's last sentence.
- Remark 9.3 prints "if X is a p-adic formal scheme R-scheme". This is a misprint for "a p-adic formal R-scheme". The extraction's sourceIssues E1–E30 do not record it. The only §9 entry is E18, in the proof of 9.4. It can be added as E31 at the next revision of the extraction.
- Constructing μ for non-noetherian X is covered in /25.

## /7 (high, error): DD.6 plans Bhatt's Theorem 7.22 under a definition that makes it false

**The finding and the verdict.** DerivedDeRhamCohomology:DD.6 plans Bhatt's Theorem 7.22 for G-lci maps "exactly as Definition 7.20 prints it". There the second factor b need only be a strict effective epimorphism, and the theorem is then false. With n = 1 and trivial log structures, F_p → F_p[x,y] → B = F_p[x,y]/(x²,xy,y²) satisfies the definition, but dR_{B/F_p} is unbounded on the left, while crystalline cohomology is not. The verifier confirmed it ("I read arXiv v1 pp.11,13,17,26,31 and checked p.31 visually") and added that "The local ideal has height 2 but three minimal generators, so this is not an lci quotient." It asked for "a source-qualified corrected statement" with "a precise filtered-colimit formulation when using ind-log-smooth examples". It "does not certify that adding an ambiguous 'after passage to the inductive limit' clause proves every case of Example 7.21; retain that verification as work". It also asked to "Record a sourceIssue and check dependent uses such as Theorem 8.4".

**Checked.**
- DerivedDeRhamCohomology:DD.6, README lines 193–196 and atlas: "Prove the specific G-lci/Cartier-type statement of Bhatt Definition 7.20 and Theorem 7.22, using the source's factorization condition and mod-p Cartier hypothesis; its Example 7.23 is a required failure test."
- Bhatt, arXiv:1204.6560v1, the PDF with sha256 e5ca4056…f4f00f that the DD packet records. Definition 7.20 (p.31): "and b a strict effective epimorphism." Theorem 7.22 and its sketch (p.31): "The map Comp_b is an isomorphism by Theorem 3.27 (or simply Corollary 3.40)". Theorem 3.27 (p.13): "Assume that f is lci." Corollary 3.40 (p.17): "Assume that I is generated by a regular sequence." Example 3.21 (p.11): "we can take A = F_p[x, y]/(x², xy, y²) … In particular, the complex dR_{A/F_p} is unbounded on the left." Proposition 6.11 (p.26): "the natural map dR_{f_Alg} → dR_f is an isomorphism when M = N."
- Dependent uses. Theorem 8.4 (p.32) assumes "f is G-lci modulo p". The two §9 uses I read are quotients by a regular element. P.35: "The map b is a quotient by the regular element … by Lemma 8.3 (5) and Theorem 8.4 (or simply Corollary 3.40)". P.38: "has kernel generated by a single regular element E(x). Hence, the claim follows immediately from Theorem 8.4." The proof on pp.38–39 ("We freely use the identification between derived de Rham and crystalline cohomology (Theorem 8.4)") and Proposition 8.5 (p.32, a regular-sequence quotient) were not rechecked case by case.
- The DD packet has sourceIssues E1–E3 for this source (id bhatt-ddr-2012), none on §7. DD.6 is not_read; its coverage asks for "the G-lci/Cartier-type conditions of Bhatt Definition 7.20 and Theorem 7.22". research/errata/REGISTER.md lists for this paper Remark 8.7, Corollary 8.6 and the packet's E1–E3, nothing on §7.
- No stage-graph change.

**Fix, as edits.**
1. DerivedDeRhamCohomology:DD.6, README lines 193–196 and atlas. Replace the sentence quoted above with: "Prove Bhatt Theorem 7.22 for G-lci maps in a corrected sense (sourceIssue DerivedDeRhamCohomology/E4). As printed, Definition 7.20 lets b be any strict effective epimorphism, and the theorem is then false: F_p → F_p[x,y] → F_p[x,y]/(x²,xy,y²) with trivial log structures satisfies the printed definition, but its derived de Rham complex is unbounded on the left (Bhatt Example 3.21, with Proposition 6.11), while crystalline cohomology has no negative cohomology. Require a factorization (M→A) →a (P→F) →b (N→B) with A, F and B flat over Z/p^n, a log smooth and of Cartier type modulo p, and b strict with underlying ring map F→B surjective and kernel Zariski-locally generated by a regular sequence. These are the hypotheses of the steps in the sketch of proof: Corollary 7.6 for a, Theorem 3.27 or Corollary 3.40 for b. Where a is only an inductive limit of such maps, as in Example 7.21, state the condition for a filtered system of such factorizations and prove the passage to the colimit on both sides; check each case of Example 7.21 against it rather than assume it. Example 7.23 (the Cartier-type hypothesis on a) and the example above (the lci hypothesis on b) are required failure tests."
2. DerivedDeRhamCohomology:DD.4, README and atlas. After "identify the p-completed derived de Rham description of A_cris in Bhatt §9." (lines 152–153) insert: "Use Bhatt Theorem 8.4 only for maps that are G-lci modulo p in the corrected sense of DD.6 (sourceIssue DerivedDeRhamCohomology/E4); the §9 uses are quotients by a regular element and satisfy it."
3. research/blueprint/packets/DerivedDeRhamCohomology.json, `sourceIssues`, for BP-DerivedDeRhamCohomology. Add:
```json
{"id": "DerivedDeRhamCohomology/E4", "source": "bhatt-ddr-2012", "kind": "error",
 "locator": "Definition 7.20, Theorem 7.22 and its sketch of proof, printed/PDF p.31 in arXiv:1204.6560v1; Theorem 8.4, p.32, uses the same definition modulo p",
 "printed": "and b a strict effective epimorphism",
 "correction": "b a strict map whose underlying ring map F → B is surjective with kernel Zariski-locally generated by a regular sequence, with F also Z/p^n-flat; when a is an inductive limit, a filtered system of such factorizations. Theorems 7.22 and 8.4 hold for G-lci maps in this corrected sense, subject to the colimit step, which the source leaves to the reader.",
 "reason": "With n = 1 and trivial log structures, F_p → F_p[x,y] → B = F_p[x,y]/(x²,xy,y²) satisfies the printed definition: the first map is smooth, hence log smooth of Cartier type, the second is a strict surjection, and all rings are F_p-flat. By Proposition 6.11 its log derived de Rham complex is the ordinary one, which Example 3.21 shows is unbounded on the left for this B; RΓ of the crystalline structure sheaf has no negative cohomology, so Comp_f is not an isomorphism. The sketch treats b by Theorem 3.27 or Corollary 3.40, which assume lci, resp. a regular sequence; the ideal (x², xy, y²) has height 2 and three minimal generators, so b is not lci.",
 "affects": "a stated result",
 "known": "No correction identified in the checks below; novelty is not established. Scoped to arXiv v1.",
 "searched": ["https://arxiv.org/abs/1204.6560 lists only v1 (REV-RT-AREA-padic-2, 24 September 2026; the packet's E1 check, 26 September 2026)", "the public author PDF has the same definition and proof (REV-RT-AREA-padic-2)", "a bounded search for the title with 7.22 or errata found no correction (REV-RT-AREA-padic-2)", "research/errata/REGISTER.md: only Remark 8.7, Corollary 8.6 and this packet's E1–E3 for this paper"]}
```
   The packet's `sourceVersions` already records the PDF read (sha256 e5ca4056…f4f00f). scripts/errata.py then carries the entry into the register.
4. Same packet, coverage of DD.6.
   - Third `remaining` item: replace "then the exactification/strict-PD-envelope comparison with the G-lci/Cartier-type conditions of Bhatt Definition 7.20 and Theorem 7.22." with "then the exactification/strict-PD-envelope comparison of Bhatt Theorem 7.22 under the corrected G-lci condition of sourceIssue DerivedDeRhamCohomology/E4 (b a strict lci quotient), not the printed Definition 7.20."
   - Fourth item: replace "Work the failure Example 7.23, log point and semistable monoid chart" with "Work the failure Example 7.23, the non-lci failure test F_p → F_p[x,y] → F_p[x,y]/(x²,xy,y²) of sourceIssue E4, log point and semistable monoid chart".

**Not changed / open.**
- Whether every case of Example 7.21, in particular the O_K-bar case, meets the corrected condition as a filtered colimit is left to DD.6's blueprint, as the verifier asks. The corrected condition may not be the weakest one that works; that is not addressed.
- I did not repeat the search for an existing correction. The `searched` entries are the verifier's and the packet's.

## /8 (medium, error): CR.4 confines the relative Langer–Zink complex to bases on which p is nilpotent

**The finding and the verdict.** CrystallineCohomology:CR.4 plans the relative Langer–Zink theory "for smooth algebras over a base on which p is nilpotent" and says that this version "supplies BMS1 §§10–12". BMS1 §10 works over any Z_(p)-algebra and applies it with A = O_C, where p is not nilpotent. It also uses the continuous complex, the Laurent-polynomial basis and base change along maps of perfectoid rings. The verifier confirmed against pp.81–85. It asked to keep "the precise Teichmüller identity, étale base change (10.4/10.8), Laurent-polynomial basis/integral-part calculation (10.12/10.13), and continuous version (10.10/10.11)". It qualified: "Proposition 10.14 additionally proves Tor independence and base change for perfectoid base maps and smooth R, not arbitrary base maps. Keep nilpotence and smoothness where required by the classical crystalline comparison; do not transfer that comparison unqualified to every Z_(p)-algebra."

**Checked.**
- CrystallineCohomology:CR.4, README lines 159–161 and atlas: "Construct the relative Langer–Zink theory for smooth algebras over a base on which p is nilpotent, with its relative crystalline comparison. This relative version, not just perfect-field de Rham–Witt, supplies BMS1 §§10–12." AI.4: "Construct the relative de Rham–Witt comparison using CR.4's Langer–Zink objects".
- BMS1, arXiv:1602.03148v3. P.81: "From now on, we assume that A is a Z(p)-algebra." Definition 10.5 includes "the Teichmüller identity Fdλ_{r+1}([b]) = λ_r([b])^{p−1}dλ_r([b])". Theorem 10.7 and Lemma 10.8 (p.82): "Let A → R be a morphism of Z(p)-algebras, and let R′ be an étale R-algebra." Corollary 10.10 and Definition 10.11 (p.83): "W_rΩ^{i,cont}_{R/A} = lim_s W_rΩ^i_{(R/p^s)/(A/p^s)}". Theorems 10.12 and 10.13 (p.84). Proposition 10.14 (p.85): "Let A → A′ be a homomorphism of perfectoid rings, and R a smooth A-algebra". Theorem 11.1 (p.86) is for "a small formally smooth O-algebra". BMS1 attributes Theorem 10.13 to "[51, Proof of Theorem 3.5]".
- The paper route is already in place. PAPER-BHATT-MORROW-SCHOLZE-18 route 11 (accepted) sends to CR.4 the planned items /150 (F-V-procomplexes, "Let A be a Z_(p)-algebra"), /151, /152, /154 and /155, and the missing items /138 (Lemma 9.8), /146–/149 (Lemmas 10.1 and 10.3, Corollary 10.2, Theorem 10.4), /153 (Lemma 10.9, Corollary 10.10), /156 (Theorem 10.13) and /157 (Proposition 10.14). Only CR.4's text and the CR packet lag.
- Two further users ask for this generality. The HQ.1 packet requests "The ordinary relative de Rham-Witt complexes of Langer and Zink over Z_(p)-algebras". The HQ.8 packet requests them "of ℤ_(p)-algebras …, their base change along A → A/I (BMS1 Corollary 10.10)".
- research/blueprint/packets/CrystallineCohomology--CR.0.json contains "basic Witt differentials and the precise smooth p-nilpotent relative comparison." twice: in CR.4's coverage and in the gap "Classical, relative and strict-completion source coverage".
- No stage-graph change; CR.4 → AI.4 exists. Langer–Zink was not read.

**Fix, as edits.**
1. CrystallineCohomology:CR.4, README lines 159–161 and atlas. Replace the two sentences quoted above with: "Construct the relative Langer–Zink de Rham–Witt complex W_rΩ^•_{B/A} for every Z_(p)-algebra A and A-algebra B as the initial F–V-procomplex (BMS1 Definition 10.5, with the Teichmüller identity Fdλ_{r+1}([b]) = λ_r([b])^{p−1}dλ_r([b]), and Theorem 10.7). For these bases prove: étale base change for Witt vectors (Theorem 10.4) and for the complex (Lemma 10.8); the Witt-ideal and quotient results (Lemmas 10.1, 10.3 and 10.9, Corollaries 10.2 and 10.10) and Witt vectors of (Laurent) polynomial rings (Lemma 9.8); the continuous complex W_rΩ^{i,cont}_{R/A} = lim_s W_rΩ^i_{(R/p^s)/(A/p^s)} (Definition 10.11); the basis of W_rΩ^n_{A[T^{±1}]/A} (Theorem 10.12); and the integral part, an injective quasi-isomorphism from Ω^•_{W_r(A)[U^{±1}]/W_r(A)} (Theorem 10.13). For a map A → A′ of perfectoid rings and R smooth over A, prove Tor-independence and base change W_rΩ^•_{R/A} ⊗_{W_r(A)} W_r(A′) ≅ W_rΩ^•_{R′/A′} (Proposition 10.14); this is not claimed for other base maps. This relative version over A = O_C, where p is not nilpotent, and not just perfect-field de Rham–Witt, supplies BMS1 §§10–12. The relative crystalline comparison keeps its source's hypotheses (smooth algebras over a base on which p is nilpotent) and is not extended to every Z_(p)-algebra."
2. CR.4 acceptance (README line 167 and atlas). Replace "a smooth relative lift over Z/p^n," with "a smooth relative lift over Z/p^n, the Laurent polynomial algebra O_C[T^{±1}] over O_C (BMS1 Theorems 10.12–10.13),".
3. research/blueprint/packets/CrystallineCohomology--CR.0.json, both occurrences, for BP-CrystallineCohomology--CR.0. Replace "basic Witt differentials and the precise smooth p-nilpotent relative comparison." with "basic Witt differentials, the relative complex over every Z_(p)-algebra base with BMS1 §§10.2–10.5 (base change, basis, integral part, continuous complex, perfectoid base change), and, separately, the precise smooth p-nilpotent relative crystalline comparison."

**Not changed / open.** The locator for the Langer–Zink crystalline comparison (their Theorem 3.5) is the finding's; I did not read Langer–Zink.

## /9 (medium, duplicate): The integral pro-étale sheaves are planned in both AInfCohomology:AI.3 and PadicHodgeTheory:P8:local-rational, with two definitions of A_inf

**The finding and the verdict.** AInfCohomology:AI.3 plans the completed integral structure sheaf, its tilt and the Witt sheaf A_inf,X, and accepted RS-01 gives AI.3 the "Integral pro-etale sheaves". The accepted PadicHodgeTheory decomposition nevertheless plans them under PadicHodgeTheory:P8:local-rational, with A_inf = W(Ô^+_{X♭}) as in Scholze 2013. BMS1, the source of AI.3, defines A_inf,X as the derived p-adic completion of W(Ô^+_{X♭}). The verifier confirmed this and asked: "Move the completed integral sheaf and its affinoid-perfectoid calculation to AI.3, preserving hypotheses, proof steps and incoming/outgoing references. AI.3 must separately name W(Ô^+_{X♭}) and its derived p-completion A_inf,X". It also asked to add BMS1 §5 and the canonical map "with only the source-supported almost/completion and affinoid-section comparisons", and "Do not silently equate either the two sheaves or their derived sections".

**Checked.**
- AInfCohomology README l. 120–125 (also in the AI.3 atlas description): "On the analytic generic fiber X of a smooth p-adic formal scheme mathfrak X, construct the completed integral structure sheaf, its tilt and the Witt A_inf,X sheaf." Sources line (l. 137): "Sources: BMS1 §§7–9."
- data/restructure/RS-01.md l. 130: AI.3 "Integral pro-etale sheaves, actual AΩ, toric continuous-cochain/Koszul calculations and descent". l. 163: P8:local-rational "Correct rational structural period sheaves, local acyclicity, connection and Poincare lemma, with the prescribed completion order". RS-01.result.json has no owners entry for these sheaves.
- data/decompositions/PadicHodgeTheory.json (review accepted, REVIEW-EXT-03). Nodes P8:local-rational/proetale-structure-sheaves-and-valuations (Scholze Definition 4.1, Lemma 4.2), affinoid-perfectoid-objects-and-etale-pullbacks (Definition 4.3–Proposition 4.8) and completed-structure-sheaf-on-affinoid-perfectoids (Lemma 4.10, Lemma 3.18). Node period-sheaves-definitions: "A_inf = W(Ô^+_{X♭}) with B_inf = A_inf[1/p]". Gap "AI.3 supplier nodes for Ô_X^+ and the A_inf sheaf do not exist yet": "when AI.3 is written they should move there". Coverage: "the two nodes on Ô_X^+ here are candidates for relocation". data/decompositions/AInfCohomology.json has seven nodes, all under AI.1, and its AI.3 coverage is "not_read".
- The pending checkpoint of BP-PadicHodgeTheory--P7 (research/blueprint/packets/PadicHodgeTheory--P7.json) keeps these ids with rational statements. It requests the integral content (a)–(g) from AI.3 "For every locally noetherian adic space X over Spa(Q_p, Z_p)". Its restructure entry proposes AI.3 with "A_inf,X = W(Ô^+_{X♭})", which is not BMS1's definition.
- BMS1 p. 46, Definition 5.4: "(vi) Fontaine's period sheaf Ainf,X, the derived p-adic completion of W(bO+X♭)". The definition is stated for X locally noetherian over Spa(Q_p, Z_p). p. 47, Remark 5.5: "it is not clear to us whether W(bO+X♭) is derived p-adically complete. (Its failure to be derived p-adically complete is [m♭]-torsion.)" Lemma 5.6 (citing "[58, Lemma 4.10, Lemma 5.10, Theorem 6.5]"): "H0(U, Ainf,X) = Ainf(R+)", and "the Ainf-module Hi(U, Ainf,X) is killed by [m♭]". After it: "Hi(U, Ainf,X) is actually killed by W(m♭)". Its almost statements use m and m♭ of O = O_C. The same page constructs θ̃_r, θ_r : A_inf,X → W_r(Ô^+_X).
- Node links. P2 (two nodes), P3 (two) and PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison link into affinoid-perfectoid-objects-and-etale-pullbacks. That node, proetale-structure-sheaves-and-valuations and P3/etale-site-tilting-and-etale-almost-acyclicity link into completed-structure-sheaf-on-affinoid-perfectoids. AdicEtaleGeometry:A1 links into proetale-structure-sheaves-and-valuations, and completed-structure-sheaf-on-affinoid-perfectoids links out to P8:local-rational/period-sheaves-on-affinoid-perfectoids. Moving the Lemma 4.10 node alone would leave the link from the Definition 4.3 node running from P8:local-rational into AI.3, against the edge AI.3 → P8:local-rational. So the Definition 4.3 node moves too.
- Stage order after the move. P2 → P3 → AI.3, P3 → AI.3 and A1 → AI.3 already hold. PerfectoidSpaces:P7 is not an ancestor of AI.3 on stageEdges or with the RS links (P7 → P8:local-rational is an RS link only). So the moved node's P7 input needs the stage edge P7 → AI.3.
- Acyclicity (same method and graphs as /1). PerfectoidSpaces:P7 → AInfCohomology:AI.3 has no return path on any version, alone or with the other changes. It adds 9 ancestors to AInfCohomology:AI.3 on stageEdges (PerfectoidSpaces:P4, P5 and P7, AdicSpacesPartII:F0 and R0–R3, and DeformationAndDerivedPatchingAlgebra:R03.1), and 7 with the RS links.

**Fix, as edits.**
1. AI.3 first paragraph (README l. 120–125 and the AI.3 atlas description). Replace the whole paragraph "On the analytic generic fiber X of a smooth p-adic formal scheme mathfrak X, … open surjections of arbitrary profinite sets need not split." with the text below. It also carries the deletions of /10.
   "Let X be a locally noetherian adic space over Spa(Q_p, Z_p). Work on X_proet with the corrected covers of Scholze's corrigendum, item (1); open surjections of arbitrary profinite sets need not split. Construct O_X^+, the completed integral structure sheaf Ô_X^+ = lim O_X^+/p^n with Ô_X = Ô_X^+[1/p], the tilted sheaf Ô^+_{X♭} = lim_Φ O_X^+/p, the Witt sheaf W(Ô^+_{X♭}) with θ, and Fontaine's sheaf A_inf,X, the derived p-adic completion of W(Ô^+_{X♭}) (BMS1 Definition 5.4). Construct the canonical map W(Ô^+_{X♭}) → A_inf,X and the maps θ_r, θ̃_r : A_inf,X → W_r(Ô_X^+). Keep the two Witt sheaves distinct. W(Ô^+_{X♭}) is not known to be derived p-adically complete (BMS1 Remark 5.5), and the map is not asserted to be an isomorphism. Construct the basis of affinoid perfectoid objects (Scholze 2013, Definition 4.3–Proposition 4.8) and prove the values and almost acyclicity of these sheaves on it: Scholze 2013 Lemmas 3.18, 4.2, 4.10 and 5.10 and Theorem 6.5 for W(Ô^+_{X♭}), and BMS1 Lemma 5.6 for A_inf,X over O_C, where the higher cohomology on affinoid perfectoid U is killed by [m♭] (and by W(m♭)). Both sheaves have sections A_inf(R^+) on such U. Prove that the canonical map induces the identity there. PadicHodgeTheory P8:local-rational imports these sheaves and builds the rational and structural period sheaves; their comparison with the sheaves here is P8:local-rational's. From here on X is the analytic generic fiber of a smooth p-adic formal scheme mathfrak X over O_C."
2. AI.3 sources (README l. 137). Replace "complex as q-de Rham. Sources: BMS1 §§7–9." with "complex as q-de Rham. Sources: BMS1 §5 (Definition 5.4, Remark 5.5, Lemma 5.6) and §§7–9; Scholze 2013, Definitions 4.1, 4.3 and 5.9, Lemmas 3.18, 4.2, 4.5, 4.6, 4.10 and 5.10, Corollary 4.7, Proposition 4.8 and Theorem 6.5 for W(Ô^+_{X♭}), with its erratum, item (1)."
3. PadicHodgeTheory README l. 118, and the atlas descriptions of P8 and P8:local-rational. Replace "On the analytic pro-étale site supplied by AdicEtaleGeometry import the integral A_inf sheaf from [AInfCohomology AI.3](../AInfCohomology/README.md#ai-3)." with "On the analytic pro-étale site supplied by AdicEtaleGeometry import from [AInfCohomology AI.3](../AInfCohomology/README.md#ai-3) the integral sheaves Ô_X^+, Ô^+_{X♭}, W(Ô^+_{X♭}) with θ, and A_inf,X with the canonical map W(Ô^+_{X♭}) → A_inf,X, together with the affinoid perfectoid basis and the values of these sheaves on it." /10 adds the next sentences.
4. Move three nodes from data/decompositions/PadicHodgeTheory.json to data/decompositions/AInfCohomology.json. Keep their statement, hypotheses, proofSteps, acceptance and sources unchanged:
   - PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations → AInfCohomology:AI.3/proetale-structure-sheaves-and-valuations;
   - PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks → AInfCohomology:AI.3/affinoid-perfectoid-objects-and-etale-pullbacks;
   - PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids → AInfCohomology:AI.3/completed-structure-sheaf-on-affinoid-perfectoids.
   For each, set "parentStageId" to "AInfCohomology:AI.3". Copy the source entries "sch13-padic-hodge" and "sch16-erratum" into AInfCohomology.json "sources". Move the nine links whose target is one of these nodes into AInfCohomology.json "links", renaming their endpoints; their reasons and sources are unchanged. The link completed-structure-sheaf-on-affinoid-perfectoids → P8:local-rational/period-sheaves-on-affinoid-perfectoids stays in PadicHodgeTheory.json, with its "source" endpoint renamed. Add to PadicHodgeTheory.json the link {"source": "AInfCohomology:AI.3/proetale-structure-sheaves-and-valuations", "target": "PadicHodgeTheory:P8:local-rational/period-sheaves-definitions", "reason": "Definition 6.1 uses Ô_X^+ as the target of θ and O_X^+/p in Ô^+_{X♭}; both are AI.3's.", "sources": [{"sourceId": "sch13-padic-hodge", "locator": "Section 6, Definition 6.1, p. 35"}]}. In AInfCohomology.json set coverage[AI.3] to status "partial", with remaining ["BMS1 §5: Definition 5.4, Remark 5.5 and Lemma 5.6, the canonical map W(Ô^+_{X♭}) → A_inf,X and θ_r, θ̃_r.", "Scholze 2013 Definition 5.9/Lemma 5.10 and Theorem 6.5 for W(Ô^+_{X♭}).", "BMS1 §§7–9 (AΩ)."]. Record in the review notes that the three nodes were reviewed by REVIEW-EXT-03 in the PadicHodgeTheory decomposition.
5. PadicHodgeTheory.json, node period-sheaves-definitions. In "statement", replace "A_inf = W(Ô^+_{X♭}) with B_inf = A_inf[1/p] and θ: A_inf → Ô_X^+ extending to θ: B_inf → Ô_X;" with "A_inf = W(Ô^+_{X♭}) and θ: A_inf → Ô_X^+, imported from AInfCohomology AI.3 (the ordinary Witt sheaf of Scholze's Definition 6.1, not BMS1's derived p-completion A_inf,X); B_inf = A_inf[1/p] with θ extended to θ: B_inf → Ô_X;".
6. Same file, node period-sheaves-on-affinoid-perfectoids. In "statement", replace "(i) A_inf(U) = A_inf(R, R^+), and likewise for B_inf, B_dR^+, B_dR;" with "(i) A_inf(U) = A_inf(R, R^+) (imported from AInfCohomology AI.3), and likewise for B_inf, B_dR^+, B_dR;". Replace proofSteps[0], "Describe W(Ô^+_{X♭})/p^m on U by induction on m, each graded piece being Ô^+_{X♭}, whose sections R♭+ and almost acyclicity are Lemma 5.10. Apply Lemma 3.18 for A_inf, then a direct limit for B_inf.", with "Import from AInfCohomology AI.3 the case of A_inf = W(Ô^+_{X♭}) (induction on m through W(Ô^+_{X♭})/p^m, Lemma 5.10 and Lemma 3.18); pass to a direct limit for B_inf."
7. Same file, gaps and coverage.
   - Delete the gap "AI.3 supplier nodes for Ô_X^+ and the A_inf sheaf do not exist yet".
   - In the gap "Lemma 5.10 (tilted completed structure sheaf) has no node", replace "Next action: write the tilted Čech argument explicitly (Sch12 Proposition 7.13 for the tilt, which is in PerfectoidSpaces P3) as a node." with "Next action: AInfCohomology AI.3 writes the tilted Čech argument explicitly (Sch12 Proposition 7.13 for the tilt, which is in PerfectoidSpaces P3) as a node (FIX-RT-AREA-padic-2/9)."
   - In coverage[P8:local-rational].remaining, replace "The integral objects Ô_X^+ and A_inf are assigned by the atlas to AInfCohomology:AI.3, whose draft has no such nodes yet; the two nodes on Ô_X^+ here are candidates for relocation." with "The integral objects are AInfCohomology:AI.3's (FIX-RT-AREA-padic-2/9). The nodes for Definition 4.1/Lemma 4.2, Definition 4.3–Proposition 4.8 and Lemma 4.10 moved there; Definition 5.9/Lemma 5.10 and Theorem 6.5 for W(Ô^+_{X♭}) are requested from it."
8. data/atlas.json stageEdges: add {"source": "PerfectoidSpaces:P7", "target": "AInfCohomology:AI.3"}, with the matching requires and consumers entries.
9. Requests to the pending blueprint jobs.
   - BP-AInfCohomology--AI.0 (its scope includes AI.3). Write AI.3 nodes for:
     - Ô^+_{X♭} = lim_Φ O_X^+/p with Scholze Lemma 5.10;
     - W(Ô^+_{X♭}) with θ, its sections W(R♭+) and almost acyclicity on affinoid perfectoid U (Scholze Theorem 6.5 for A_inf) and the integral cases of Corollary 6.6;
     - A_inf,X with the canonical map, Remark 5.5 and Lemma 5.6 under their hypotheses, and θ_r, θ̃_r;
     - the identity of A_inf(R^+) on affinoid perfectoid U under the two identifications. This is a proof obligation: the sources state each identification separately.
   - BP-PadicHodgeTheory--P7. In its request to AInfCohomology:AI.3, append to item (e): "; and, separately, BMS1's A_inf,X, the derived p-adic completion of W(Ô^+_{X♭}) (Definition 5.4(vi), Remark 5.5, Lemma 5.6). The rational period sheaves are built from the ordinary W(Ô^+_{X♭}), and the two are not identified." In its restructure entry "AI.3's integral pro-étale package must cover all locally noetherian adic spaces", replace "A_inf,X = W(Ô^+_{X♭})" (once in the packet) with "W(Ô^+_{X♭}) and its derived p-completion A_inf,X", and note that edit 1 adopts the generality it asks for.
10. Owners entry for RS-01's record. The family contains both roadmaps; RS-01 is accepted, so the maintainer records it: {"target": "The integral pro-étale sheaves O_X^+, Ô_X^+, Ô^+_{X♭}, W(Ô^+_{X♭}) and its derived p-completion A_inf,X with θ, the affinoid perfectoid basis and their values on it (Scholze 2013 Definitions 4.1, 4.3, 5.9, Lemmas 3.18, 4.2, 4.10, 5.10, Theorem 6.5 for W(Ô^+_{X♭}); BMS1 Definition 5.4, Remark 5.5, Lemma 5.6)", "owner": "AInfCohomology:AI.3", "formerly": ["PadicHodgeTheory:P8:local-rational"]}

**Not changed / open.**
- The finding also says that the cone of W(Ô^+_{X♭}) → A_inf,X is killed by W(m♭). BMS1 does not state this. It states that the failure of derived completeness is "[m♭]-torsion" (Remark 5.5), and that H^i(U, A_inf,X) is killed by W(m♭) for i > 0 on affinoid perfectoid U. Edit 1 plans only these statements.
- The P7 packet's request item (g), Scholze Lemma 5.5 (the toric Koszul computation), is outside this finding. AI.3's toric cochains already cover it in BMS1's form.

## /10 (medium, error): AInfCohomology:AI.3 plans a comparison with rational period sheaves that only a later stage can state

**The finding and the verdict.** AInfCohomology:AI.3 says "Prove the comparison with rational period sheaves after the correct completion/localization" and uses "the structural period-sheaf completion from Scholze's corrigendum". The rational sheaves are built in PadicHodgeTheory:P8:local-rational, which requires AI.3. The reverse edge would close a cycle. The verifier confirmed and asked to "Move the rational/structural comparison and the structural O B_dR^+ completion prescription into" P8:local-rational, to "retain the corrected covers in AI.3", and to preserve "the erratum's order". It corrected the finding's arrow: "ordinary W(Ô^+_{X♭}) maps canonically to its derived completion, hence after inverting p the immediate direction is ordinary B_inf → A_inf,X[1/p]. A reverse arrow or identification requires a proved localization/almost-comparison result and cannot simply be asserted."

**Checked.**
- AInfCohomology README l. 122–125: "Prove the comparison with rational period sheaves after the correct completion/localization. Use the corrected transfinite pro-étale covers and the structural period-sheaf completion from Scholze's corrigendum; open surjections of arbitrary profinite sets need not split." Each sentence occurs once. AI.3 requires AI.0, AI.1, A1, E1 and P3.
- P8:local-rational requires AInfCohomology:AI.3 (a direct edge), so P8:local-rational → AI.3 would close a 2-cycle (checked). RS-01.md l. 263 rejects "late P8 → P8:local-rational".
- Scholze's erratum, item (1) (the corrected covers) and item (3): "one has to take a suitable p-adic completion of OBinf = OX ⊗W(κ) Binf first". Then "OB+dR is the sheafification of the presheaf sending U to the direct limit over i of the kerθ-adic completion of (R+i ˆ⊗W(κ) Ainf(R, R+))[1/p]. Here, the completed tensor product is the p-adic completion of the tensor product".
- P8:local-rational already plans the corrected sheaf at node level: data/decompositions/PadicHodgeTheory.json, node P8:local-rational/corrected-structural-de-rham-sheaf, sourced to erratum item (3). The README section "Corrected structural period-sheaf construction" (after l. 118) belongs to the P8 aggregate. It is not in P8:local-rational's atlas description.
- BMS1 Remark 5.5 (p. 47): A_inf,X is defined as the derived p-adic completion of W(Ô^+_{X♭}), so the canonical map runs from W(Ô^+_{X♭}) to A_inf,X.

**Fix, as edits.**
1. AI.3. Edit 1 of /9 replaces the paragraph. The replacement drops "Prove the comparison with rational period sheaves after the correct completion/localization." and "and the structural period-sheaf completion from", and keeps the corrected covers of item (1). If /9 edit 1 is not applied, make these two changes alone: delete "Prove the comparison with rational period sheaves after the correct completion/localization.", and replace "Use the corrected transfinite pro-étale covers and the structural period-sheaf completion from Scholze's corrigendum;" with "Use the corrected transfinite pro-étale covers of Scholze's corrigendum, item (1);".
2. P8:local-rational (PadicHodgeTheory README l. 118, and the atlas descriptions of P8 and P8:local-rational). Insert after the sentence that /9 edit 3 installs: "Construct B_inf = W(Ô^+_{X♭})[1/p], B_dR^+ and B_dR in Scholze's convention (Scholze 2013, Definition 6.1). Construct the canonical map B_inf → A_inf,X[1/p] induced by AI.3's map W(Ô^+_{X♭}) → A_inf,X, compatible with θ. No map in the other direction and no identification of the two is asserted without a proof. This stage owns the comparison of the rational period sheaves with AI.3's integral sheaves. It also owns the structural sheaf OB_dR^+, built in the order of Scholze's corrigendum, item (3): the p-adically completed tensor product R_i^+ ⊗̂_{W(κ)} A_inf(R, R^+), then inversion of p, then ker θ-adic completion, then the colimit over i and sheafification."
3. Stage graph: no change. The edge AI.3 → P8:local-rational stays, and the reverse edge is not added.

**Not changed / open.**
- The finding proposed that P8:local-rational own "the maps A_inf,X[1/p] → B_inf → B_dR^+". Following the verifier, edit 2 plans B_inf → A_inf,X[1/p] and B_inf → B_dR^+ instead. It plans no map out of A_inf,X[1/p] into B_inf. Whether B_inf → A_inf,X[1/p] is an isomorphism is not known from the sources read. Remark 5.5 bounds the failure of derived completeness only by [m♭]-torsion, which inverting p does not kill.

## /11 (medium, error): The BKF property in AInfCohomology:AI.5 needs BMS1 Proposition 13.21, which has no crystalline supplier

**The finding and the verdict.** BMS1 proves that the cohomology groups of RΓ_Ainf are Breuil–Kisin–Fargues modules using Corollary 4.20, comparisons (iii) and (iv), and Proposition 13.21: a rational crystalline base change along a residue-field section. AInfCohomology:AI.5 requires only AI.2 and AI.4, and no crystalline stage reaches it. The verifier confirmed this. It corrected the owner: "respect the already separated CR.3:Frobenius-isogeny child: retain that theorem there, and put 13.21 in this later crystalline successor … importing CR.3's base change and finiteness. Export the result to AI.5 and CP.2. A bare CR.3 → AI.5 edge does not license assuming its later isogeny theorem." It also asked to "Preserve proper smooth formal X, the chosen residue-field section k → O/p, phi linearization and inversion of p; do not assert an integral or section-free base change."

**Checked.**
- BMS1 p. 120, proof of Theorem 14.3: "It follows that all cohomology groups are finite free after inverting p by Corollary 4.20 and comparisons (iii) and (iv), using also Proposition 13.21. Thus, all cohomology groups are Breuil–Kisin–Fargues modules."
- BMS1 §13.4, p. 116. The setting is X proper smooth formal over O and Y = X ×_{Spf O} Spec O/p. Proposition 13.21: "Fix a section k → O/p. Then there is a canonical ϕ-equivariant isomorphism Hi crys(Y/Acrys)[1/p] ∼= Hi crys(Ȳ/W(k)) ⊗W(k) Acrys[1/p]". Its proof first shows "for any qcqs smooth O/p-scheme Z, the Frobenius … is an isomorphism after inverting p", reducing to Z ≅ Z̄ ×_k O/p and "the case of Z̄/k". It ends: "Base change for crystalline cohomology implies the result." Remark 13.22 discusses uniqueness of the section.
- Atlas. CrystallineCohomology:CR.3:Frobenius-isogeny requires CR.3 and CR.4 and has no consumers. Its text (CrystallineCohomology README l. 119–122): "Its rational-isogeny conclusion is a later substage, proved through CR.4's de Rham–Witt/Cartier control or the corresponding classical crystalline argument". AI.5 requires AI.2 and AI.4. CohomologyComparisons:CP.2 requires AI.5, CP.0, CR.3 and R06.2, and its text (README l. 87–89) says "Prove the relevant crystalline change-of-base/invariance statement after p-inversion".
- data/decompositions/CohomologyComparisons.json records Proposition 13.21 as node CP.2/rational-crystalline-base-change-along-residue-section. Its links go to CP.2/crystalline-comparison-over-discretely-valued-base and CP.5/lattice-recovery-over-C, and CR.3 links into it. Gap "Ownership of the generic A_inf linear algebra and of Proposition 13.21": "Proposition 13.21 should be re-homed upstream (CrystallineCohomology CR.3 as a Berthelot–Ogus-type base change, or AI.4) with CP.2 consuming it. No node → AI.5 link was added." Gap "Imports of Proposition 13.21": the smooth affine (not proper) Frobenius step is used "without reference". The pending CP packet repeats the node. data/decompositions/CrystallineCohomology.json already has source "bms1-2019", and its coverage for CR.3:Frobenius-isogeny is "not_read".
- Acyclicity (same method and graphs as /1). CR.3:Frobenius-isogeny → AInfCohomology:AI.5 and CR.3:Frobenius-isogeny → CohomologyComparisons:CP.2 close no cycle on any version. AInfCohomology:AI.5 gains CrystallineCohomology:CR.3 and CR.3:Frobenius-isogeny as ancestors; CohomologyComparisons:CP.2 gains CR.3:Frobenius-isogeny.

**Fix, as edits.**
1. CrystallineCohomology README §CR.3 (l. 119–122), and the atlas descriptions of CR.3 and CR.3:Frobenius-isogeny. After "Its rational-isogeny conclusion is a later substage, proved through CR.4's de Rham–Witt/Cartier control or the corresponding classical crystalline argument, not a field of the definition of cohomology." add: "That substage, CR.3:Frobenius-isogeny, also owns BMS1 Proposition 13.21. Let X be a proper smooth formal scheme over O_C, C complete algebraically closed over Q_p with residue field k, and let Y = X ×_{Spf O_C} Spec O_C/p and Ȳ = X_k. For a fixed section k → O_C/p there is a canonical φ-equivariant isomorphism H^i_crys(Y/A_crys)[1/p] ≅ H^i_crys(Ȳ/W(k)) ⊗_{W(k)} A_crys[1/p], so H^i_crys(Y/A_crys)[1/p] is finite free over A_crys[1/p]. Prove with it the input of its proof. For every qcqs smooth O_C/p-scheme Z, the linearized Frobenius H^i_crys(Z/A_crys) ⊗_{A_crys,φ} A_crys → H^i_crys(Z/A_crys) is an isomorphism after inverting p. Prove this by reduction to the affine case Z ≅ Z̄ ×_k O_C/p and base change from the smooth, not necessarily proper, k-scheme Z̄; BMS1 gives no reference for that case. Import CR.3's base change and finiteness. The isomorphism depends on the section (BMS1 Remark 13.22). No integral or section-free statement is asserted. Export it to AInfCohomology AI.5 and CohomologyComparisons CP.2."
2. Same section, sources (l. 131–132). Replace "Sources: Berthelot–Ogus §§7–8, Stacks crystalline applications/base change, BMS1 §14." with "Sources: Berthelot–Ogus §§7–8, Stacks crystalline applications/base change, BMS1 §14, and for CR.3:Frobenius-isogeny BMS1 Proposition 13.21 and Remark 13.22."
3. CohomologyComparisons README §CP.2 (l. 87–89) and the CP.2 atlas description. Replace "Prove the relevant crystalline change-of-base/invariance statement after p-inversion; do not infer it integrally or assert it from special-fiber point counts." with "Import BMS1 Proposition 13.21 (rational crystalline base change along a residue-field section) from CrystallineCohomology CR.3:Frobenius-isogeny. Prove here its variant over a discretely valued base used in BMS1 Theorem 14.6, with the canonical section k → O_K/p → O_C/p. Do not infer it integrally or assert it from special-fiber point counts."
4. AInfCohomology README §AI.5 (l. 181) and the AI.5 atlas description. Before "Sources: BMS1 §§4,14 and Theorems 1.1,1.8." insert: "The BKF property uses BMS1 Corollary 4.20 with comparisons (iii) and (iv) and Proposition 13.21, imported from CrystallineCohomology CR.3:Frobenius-isogeny (proof of BMS1 Theorem 14.3, p. 120)."
5. data/atlas.json stageEdges: add {"source": "CrystallineCohomology:CR.3:Frobenius-isogeny", "target": "AInfCohomology:AI.5"} and {"source": "CrystallineCohomology:CR.3:Frobenius-isogeny", "target": "CohomologyComparisons:CP.2"}, with the matching requires and consumers entries. The edge CR.3 → CP.2 stays, because CP.2 also uses CR.3's base change.
6. Move node CohomologyComparisons:CP.2/rational-crystalline-base-change-along-residue-section from data/decompositions/CohomologyComparisons.json to data/decompositions/CrystallineCohomology.json.
   - New id: CrystallineCohomology:CR.3:Frobenius-isogeny/rational-crystalline-base-change-along-residue-section. parentStageId: CrystallineCohomology:CR.3:Frobenius-isogeny.
   - Keep the title, hypotheses, proofSteps[0–2], acceptance[0] and [2], and sources[0–2].
   - Move the last sentence of its statement, from "In Theorem 14.6, where X is the base change", with proofSteps[3] (the DVR descent), acceptance[1] and sources[3], to node CP.2/crystalline-comparison-over-discretely-valued-base. Append them to that node's proofSteps[1], acceptance and sources.
   - Links. Re-point "CrystallineCohomology:CR.3 → …" to the new id and keep it in CrystallineCohomology.json. Re-point the two out-links (to CP.2/crystalline-comparison-over-discretely-valued-base and CP.5/lattice-recovery-over-C) and keep them in CohomologyComparisons.json.
   - Move the gap "Imports of Proposition 13.21: crystalline base change and Frobenius isogeny for smooth qcqs k-schemes" to CrystallineCohomology.json, with neededBy renamed.
   - In the gap "Ownership of the generic A_inf linear algebra and of Proposition 13.21", replace "Separately, Proposition 13.21 (recorded under CP.2 per CP.2's description) is also an input of AI.5's Theorem 14.3 (BKF property), while AI.5 → CP.2 is an existing edge: to avoid an AI.5 ⇄ CP.2 ownership cycle, Proposition 13.21 should be re-homed upstream (CrystallineCohomology CR.3 as a Berthelot–Ogus-type base change, or AI.4) with CP.2 consuming it. No node → AI.5 link was added." with "Proposition 13.21 is owned by CrystallineCohomology:CR.3:Frobenius-isogeny (FIX-RT-AREA-padic-2/11), which exports it to AI.5 and CP.2." Rename the id in that gap's neededBy.
   - Set coverage[CR.3:Frobenius-isogeny] in CrystallineCohomology.json to "partial".
   - The pending BP-CohomologyComparisons and BP-CrystallineCohomology--CR.0 checkpoints (the latter's scope includes CR.3:Frobenius-isogeny) follow the same move.
7. Owners entry for RS-01's record. RS-01's family contains CrystallineCohomology, CohomologyComparisons and AInfCohomology. {"target": "BMS1 Proposition 13.21 (rational crystalline base change from W(k) to A_crys along a residue-field section) and the rational Frobenius-linearization isomorphism for qcqs smooth O_C/p-schemes in its proof", "owner": "CrystallineCohomology:CR.3:Frobenius-isogeny", "formerly": ["CohomologyComparisons:CP.2"]}

**Adjusted by the joint check (C4).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- The finding named CR.3 itself. Following the verifier, the owner is the later child CR.3:Frobenius-isogeny, and no CR.3 → AI.5 edge is added.
- Berthelot–Ogus [7], of which Proposition 13.21 is "a variant", was not read.

## /12 (medium, error): CR.4 has no supplier for the classical Cartier isomorphism

**The finding and the verdict.** BLM compare the completed de Rham complex of a Frobenius-lifted smooth lift with the saturated de Rham–Witt complex. Their only non-homological input is the Cartier isomorphism for smooth algebras over a perfect F_p-algebra (BLM Theorem 3.3.6, used through Corollary 3.3.8 in Theorem 4.2.4). CrystallineCohomology:CR.4 plans that comparison but cannot reach DerivedDeRhamCohomology:DD.3, the only stage that plans classical Cartier. The verifier confirmed: "Add DD.3 → CR.4 and specify the perfect F_p-algebra base of 3.3.6; the lift comparison also needs p-torsion-freeness and a Frobenius lift. Do not identify every singular classical complex with its saturated replacement."

**Checked.**
- CR.4, README lines 151–157: "For smooth algebras over a perfect F_p-field prove agreement with the classical de Rham–Witt complex. Give the BLM construction via strict saturated Dieudonne complexes as a compared model". CR.4 requires AInfCohomology:AI.1 and CR.2 only; DD.3 is not its ancestor on the base, RS or full graph.
- DD.3, README lines 126–128: "Compare with classical Cartier on smooth algebras by a coordinate calculation, followed by coherent descent."
- BLM, arXiv:1805.05501v3. P.5: "the only input we will need is the Cartier isomorphism (which we recall as Theorem 3.3.6) and some elementary homological algebra." P.35: "We refer the reader to [Kat70, Th. 7.2] for a proof of the following: Theorem 3.3.6 (Cartier Isomorphism). Let k be a perfect Fp-algebra and let A be a smooth k-algebra. Then the Cartier map Cart: Ω∗_A → H∗(Ω∗_A) is an isomorphism." Corollary 3.3.8 (p.35) takes R p-torsion-free, ϕ with ϕ(x) ≡ x^p (mod p), R/pR smooth over a perfect F_p-algebra k, and concludes that the completed de Rham complex is of Cartier type and maps quasi-isomorphically to W Sat; "Assertion (1) follows from Theorem 3.3.6". Theorem 4.2.4 (p.45), same hypotheses: "This follows from Corollary 3.3.8."
- CR packet. Its CR.4 nodes are Dieudonné-complex nodes, including CR.4/cartier-saturation-mod-p (the Cartier criterion, BLM Theorem 2.4.2). It has no node for Corollary 3.3.8 or Theorem 4.2.4 and no request to DD.3.
- DD packet. DD.3/polynomial-cartier-map covers polynomial algebras over an F_p-algebra. DD.3's coverage already lists "Prove the smooth Cartier extension, including the arbitrary-field characteristic-p scope needed by MotivicEtaleKTheory:M.5d." The M.5d packet requests inverse Cartier from DD.3; the HQ.1 packet requests derived Cartier from DD.3; the accepted brief of PAPER-CLAUSEN-MATHEW-MORROW-21 route 1 imports "DerivedDeRhamCohomology DD.3 (Cartier isomorphism)". So DD.3 already owns classical Cartier at packet level; its stage text and edges lag. No DD.3 → M.5d edge exists.
- /26 of this red team adds DD.3 → PrismaticCohomology:PR.1 for the polynomial Cartier map. This fix is consistent with it.
- Acyclicity, as in /2: DD.3 → CR.4 and DD.3 → M.5d are acyclic, alone and together with the rest. CR.4 gains DD.2 and DD.3 as ancestors (15 → 17 on base).

**Fix, as edits.**
1. DerivedDeRhamCohomology:DD.3, README lines 126–128 and atlas. Replace "Compare with classical Cartier on smooth algebras by a coordinate calculation, followed by coherent descent." with "Own the classical Cartier isomorphism of DD.0's ordinary complex: for a smooth algebra A over a perfect F_p-algebra k, Cart: Ω^*_A → H^*(Ω^*_A) is an isomorphism (BLM Theorem 3.3.6, which refers to Katz 1970, Theorem 7.2, for the proof); extend it to the arbitrary characteristic-p fields requested by MotivicEtaleKTheory M.5d. Compare it with the derived Cartier map by a coordinate calculation, followed by coherent descent. CrystallineCohomology CR.4, PrismaticCohomology PR.1 and M.5d import it."
2. CrystallineCohomology:CR.4, README and atlas. After "de Rham–Witt complex without a comparison theorem." (line 157) insert: "For a p-torsion-free ring R with a Frobenius lift ϕ (ϕ(x) ≡ x^p mod p) and R/pR smooth over a perfect F_p-algebra k, prove that the completed de Rham complex Ω̂^*_R is of Cartier type and maps quasi-isomorphically to W Sat(Ω̂^*_R) (BLM Corollary 3.3.8), and that µ: Ω̂^*_R → WΩ^*_{R/pR} is a quasi-isomorphism (BLM Theorem 4.2.4). Both import the classical Cartier isomorphism (BLM Theorem 3.3.6) from DerivedDeRhamCohomology DD.3. Neither is claimed when R/pR is singular."
3. Stage edges: add DerivedDeRhamCohomology:DD.3 → CrystallineCohomology:CR.4 and DerivedDeRhamCohomology:DD.3 → MotivicEtaleKTheory:M.5d. The second carries M.5d's existing request to DD.3, which the ownership statement in edit 1 makes explicit.
4. research/blueprint/packets/CrystallineCohomology--CR.0.json, for BP-CrystallineCohomology--CR.0.
   - Add two nodes under CR.4: CrystallineCohomology:CR.4/completed-de-rham-cartier-type (BLM Corollary 3.3.8, with the hypotheses in edit 2) and CrystallineCohomology:CR.4/lift-comparison (BLM Theorem 4.2.4). Their prerequisites are the request below, the continuous complex of DD.0 (/2), CR.4/cartier-saturation-mod-p and BLM Corollary 2.8.5, which has no node yet.
   - Add the request `{"supplier": "DerivedDeRhamCohomology:DD.3", "need": "The classical Cartier isomorphism of the ordinary de Rham complex: for a perfect F_p-algebra k and a smooth k-algebra A, Cart: Ω^*_A → H^*(Ω^*_A) is an isomorphism (BLM Theorem 3.3.6; proof referred to Katz 1970, Theorem 7.2), together with the fact that the map written through a Frobenius lift does not depend on the lift (BLM, before Theorem 3.3.6).", "neededBy": ["CrystallineCohomology:CR.4/completed-de-rham-cartier-type", "CrystallineCohomology:CR.4/lift-comparison"]}`.
5. research/blueprint/packets/DerivedDeRhamCohomology.json, coverage of DD.3. Replace "Prove the smooth Cartier extension, including the arbitrary-field characteristic-p scope needed by MotivicEtaleKTheory:M.5d." with "Prove the smooth Cartier extension, including the perfect-F_p-algebra base of BLM Theorem 3.3.6 needed by CrystallineCohomology:CR.4 and the arbitrary-field characteristic-p scope needed by MotivicEtaleKTheory:M.5d."
6. Owners entry: `{"target": "Classical Cartier isomorphism of the ordinary de Rham complex for smooth algebras over a perfect F_p-algebra (BLM Theorem 3.3.6; Katz 1970, Theorem 7.2), with its extension to the characteristic-p fields requested by M.5d", "owner": "DerivedDeRhamCohomology:DD.3", "formerly": []}`

**Not changed / open.** Katz 1970 was not read. The regular Noetherian extension (BLM Remark 3.3.7, through Popescu) is not added, since none of these users needs it.

## /13 (medium, error): AInfCohomology:AI.6 compares with the canonical B_dR^+ cohomology but does not require CohomologyComparisons:CP.3, which constructs it

**The finding and the verdict.** AInfCohomology:AI.6 plans the semistable B_dR^+ comparison with the canonical deformation of the smooth generic fibre (Česnavičius–Koshikawa Theorem 6.6). Its target RΓ_cris(X^ad_C/B_dR^+) is BMS1 §13's object, which CohomologyComparisons:CP.3 constructs, yet CP.3 is not a prerequisite of AI.6. The verifier confirmed: "Select CP.3 → AI.6, retaining CK's properness, semistable/log hypotheses and topology-comparison work. Moving the comparison to CP.4 is an alternative, not an additional prerequisite to introduce indiscriminately."

**Checked.**
- AInfCohomology README l. 197–198 (once, and in the AI.6 atlas description): "Construct the B_dR^+ comparison with the smooth generic fiber's canonical deformation." AI.6 requires AI.5, CR.5 and CR.6, and its sources are "CK §§2–7".
- CP.3 (CohomologyComparisons README l. 106 ff.): "For a proper smooth adic space X/C construct the canonical B_dR^+-valued deformation of de Rham cohomology by the infinitesimal/PD-style embedding system of BMS1 §13". CP.4 requires AI.6 and CP.3.
- Česnavičius–Koshikawa (arXiv:1710.06145v3). §6 introduction (p. 59): "The main goal of this section is to prove in Theorem 6.6 that for OC-proper X, we have RΓlog cris(XOC/p/Acris) ⊗L Acris B+dR ∼= RΓcris(Xad C/B+dR) …, where the definition of RΓcris(Xad C/B+dR) … was given in [BMS18, §13]". It continues: "we only need to check that a slightly more general definition that uses the étale topology and more general embeddings … leads to the same cohomology (see §§6.2–6.3)". Theorem 6.6 (p. 66) also gives finite freeness over B_dR^+ and RΓ(X_ét, AΩ_X) ⊗^L_{A_inf} B_dR^+ ≅ RΓ_cris(X^ad_C/B_dR^+), "compatibly with the identifications modulo ξ".
- RS-01.md l. 133 gives AI.6 the "generic-fibre B_dR^+ comparison" and l. 138 gives CP.3 the "Canonical B_dR^+ deformation/cohomology of the smooth generic fibre". RS-01 adds no CP.3 → AI.6 link.
- Acyclicity (same method and graphs as /1). CohomologyComparisons:CP.3 → AInfCohomology:AI.6 closes no cycle on any version. That includes RT-AREA-padic-1/24's PadicHodgeTheory:P8:primitive → CP.3 and the joint table's AI.6 → PR.8 → CP.4. AInfCohomology:AI.6 gains CohomologyComparisons:CP.0 and CP.3, PadicHodgeTheory:P8:local-rational and AInfCohomology:AI.0:period-comparison as ancestors, and also PerfectoidSpaces:P7 with the RS links.

**Fix, as edits.**
1. data/atlas.json stageEdges: add {"source": "CohomologyComparisons:CP.3", "target": "AInfCohomology:AI.6"}. Add CP.3 to AI.6's requires and AI.6 to CP.3's consumers.
2. AInfCohomology README l. 197–198 and the AI.6 atlas description. Replace "Construct the B_dR^+ comparison with the smooth generic fiber's canonical deformation." with "Import the canonical B_dR^+-cohomology RΓ_cris(X^ad_C/B_dR^+) of the smooth generic fibre (BMS1 §13) from CohomologyComparisons CP.3, and prove CK Theorem 6.6. For O_C-proper X, RΓ^log_cris(X_{O_C/p}/A_cris) ⊗^L_{A_cris} B_dR^+ ≅ RΓ_cris(X^ad_C/B_dR^+), the cohomology modules of the right side are finite free over B_dR^+, and RΓ(X_ét, AΩ_X) ⊗^L_{A_inf} B_dR^+ ≅ RΓ_cris(X^ad_C/B_dR^+), compatibly with the identifications modulo ξ with de Rham cohomology. Prove CK §§6.2–6.3: the étale-topology definition with more general embeddings gives the same cohomology as BMS1's. This stage does not define the target."
3. RS-01 needs no change. The atlas edge is enough, and the RS-01 ownership lines already match.

**Adjusted by the joint check (C5).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- CP.4 keeps its own step, "compatibility of the absolute log-crystalline A_cris map with the B_dR^+ deformation from CP.3". The comparison is not moved to CP.4, because the verifier selected the edge.

## /14 (medium, missing): no stage plans Beilinson's integral quasi-coherent log crystalline setting

**The finding and the verdict.** CrystallineCohomology:CR.5 plans Kato's theory of fine log structures. AInfCohomology:AI.6 follows Česnavičius–Koshikawa (CK) §5, which works with integral quasi-coherent, non-coherent log structures in Beilinson's framework. Examples are the log structure on O_C/p with characteristic monoid Q_{≥0}, its unique lift to A_cris/p^n, and the log crystalline site of Beilinson §1.12. No stage plans this. The verifier confirmed: "Beilinson v4 §1.3 (p.4) proves an envelope theorem over a p-nilpotent log PD base with explicit integrality/quasi-coherence assumptions; §1.5 (p.6) constructs the site; §§1.17 (pp.25–26) gives the unique lifting and its universal property." It added: "A non-fine log-geometry prefix alone is not the log crystalline site. Preserve the finite-level-to-p-adic construction; do not infer existence of arbitrary mixed-characteristic nonexact log PD envelopes, which CK expressly avoids."

**Checked.**
- CrystallineCohomology:CR.5, README lines 177–195 (its text is also the atlas description of CR.5:log-algebra): fine, saturated and integral monoids, charts, "Construct exactification and the log PD envelope, followed by the log crystalline site". Sources: Kato, Hyodo–Kato, Koshikawa. AInfCohomology:AI.6 requires AI.5, CR.5 and CR.6; its sources are "CK §§2–7".
- CK, arXiv:1710.06145v3, pp.32–33. §5: "not knowing the existence of logarithmic divided power envelopes of certain nonexact logarithmic closed immersions in mixed characteristic, we are forced to devise slightly indirect arguments"; "some log structures that we use are not coherent (only quasi-coherent)". §5.2: "by [Bei13b, §1.17, Lemma], every quasi-coherent, integral log structure N on OC/p for which N/(OC/p)× is uniquely p-divisible lifts uniquely"; the lifts are "the pullbacks of the log structure on Acris associated to the prelog structure O♭_C \ {0} → Acris, x ↦ [x]". §5.3: the site is "defined as in [Bei13b, §1.12]". CK §5 also cites Beilinson's §1.3 Theorem, §1.4 Remarks (ii), §1.5, §1.7, (1.8.1), (1.11.1), §1.15 Remarks (i) and §1.18 Theorem.
- Beilinson, arXiv:1111.3316v4. P.2: the envelope theorem "remains true for integral quasi-coherent log schemes, which is our preferred log crystalline setting". §1.2 (p.4): "Let S♯ = (S, L, I, γ) be a log pd-scheme with p ∈ OS nilpotent". §1.3 (p.4), Theorem, with the proof idea "one can realize iY as a filtered inverse limit of embeddings of fine log schemes, which brings iT by loc. cit." (Kato 5.4). §1.5 (p.6), §1.12 (p.16), §1.17 Lemma and Exercise (pp.25–26).
- The Binda–Kato–Vezzani prefix the finding builds on has no accepted owner. PAPER-BINDA-KATO-VEZZANI-25 route 2 (to CR.5:log-algebra and CR.5; items /009–/019, including /009, "an integral quasi-coherent log structure on its small étale site", and /014, "the log structure associated to O_K\{0}→O_K") is rejected: "Non-fine log and specialization proof leaves G3 remain undecomposed". The paper's verdict is "revise".
- No CR.5 packet exists yet (BP-CrystallineCohomology--CR.5 is pending).
- Acyclicity, as in /2, with the new vertex: CR.5 → CR.5:quasi-coherent and CR.5:quasi-coherent → AI.6 are acyclic, alone and jointly. AI.6 gains only the new stage as an ancestor, since CR.5 already precedes it. The new stage names CR.5 as its prerequisite, so scripts/theory_graph.py does not make CR.5 require it.

**Fix, as edits.**
1. New stage CrystallineCohomology:CR.5:quasi-coherent (atlas object and README section).
   - owner CrystallineCohomology, key "CR.5:quasi-coherent", parentStageId "CrystallineCohomology:CR.5", requires ["CrystallineCohomology:CR.5"], consumers ["AInfCohomology:AI.6"]. It follows the successor pattern of CR.3:duality.
   - title "Integral quasi-coherent log crystalline theory — source-qualified successor".
   - Inputs: CR.5's fine log PD envelopes, log crystalline site and log Poincaré lemma, and through it CR.0, CR.2 and CR.5:log-algebra. Outputs: the objects listed in the description, for AI.6.
   - README: insert after CR.5's line 195 ("Hyodo–Kato §§1–3; Koshikawa I Appendix A and §§2–4.") and before `<a id="cr-6"></a>`:
     `<a id="stage-CR.5:quasi-coherent"></a>`, then the heading "### CR.5:quasi-coherent. Integral quasi-coherent log crystalline theory — source-qualified successor", then this description: "Extend CR.5's fine theory to the integral quasi-coherent log schemes of Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1, which Česnavičius–Koshikawa §5 need because some of their log structures are only quasi-coherent. Over a log PD base S♯ = (S, L, I, γ) with p nilpotent on S and (S, L) quasi-coherent (§1.2), construct the following. Integral quasi-coherent log schemes and their charts over a fine base (§1.1). The log pd-envelope of a locally closed embedding of an integral quasi-coherent (Z, M) into a quasi-coherent (Y, N), as the right adjoint of §1.3's Theorem, by writing the embedding étale-locally as a filtered inverse limit of embeddings of fine log schemes and applying CR.5's envelope. Log pd-smooth thickenings (§1.4). The log crystalline site, its cohomology, log crystals and connections (§§1.5–1.7). The comparison with log de Rham cohomology (1.8.1). Base change for perfect crystals (1.11.1). The p-adic setting (§1.12). Prove §1.17's Lemma and Exercise: an integral quasi-coherent log structure on a Z/p-scheme whose characteristic monoid is uniquely p-divisible lifts uniquely along every PD thickening over Z/p^n, and the lift has the stated universal property. Apply it to O_C/p with the log structure of O_C ∖ {0} (characteristic monoid Q_{≥0}); this gives the log structures on A_cris/p^n associated to O_C^♭ ∖ {0} → A_cris, x ↦ [x] (CK §5.2), and the identification of the log crystalline sites over Z_p and over A_cris (CK §5.3). Keep CK's finite-level constructions and their p-adic limits. Do not assert that every nonexact log closed immersion in mixed characteristic has a log PD envelope; CK avoid that statement. AInfCohomology AI.6 imports this stage. Acceptance: O_C/p and A_cris/p^n with these log structures; a fine semistable chart, where the theory must agree with CR.5's; the site identification of CK §5.3."
2. CrystallineCohomology:CR.5 (README line 195; this text is also the atlas description of CR.5 and of CR.5:log-algebra). After "Hyodo–Kato §§1–3; Koshikawa I Appendix A and §§2–4." append: "The integral quasi-coherent extension used by Česnavičius–Koshikawa §5 is the successor sub-stage CR.5:quasi-coherent below; nothing in CR.5 or CR.5:log-algebra depends on it."
3. AInfCohomology:AI.6 (README line 197 and atlas). After "algebraically closed and the induced Witt extension." insert: "The A_cris comparison uses the integral quasi-coherent log structures on O_C/p and A_cris/p^n and the log crystalline site of Beilinson §1.12 (CK §§5.2–5.3), imported from CrystallineCohomology CR.5:quasi-coherent." This goes before the sentence "Construct the B_dR^+ comparison with the smooth generic fiber's canonical deformation.", which /13 replaces; the two edits do not overlap.
4. Stage edges: add CrystallineCohomology:CR.5 → CrystallineCohomology:CR.5:quasi-coherent and CrystallineCohomology:CR.5:quasi-coherent → AInfCohomology:AI.6.
5. Owners entry: `{"target": "Integral quasi-coherent log schemes over a quasi-coherent log PD base with p nilpotent; their log pd-envelopes, log pd-smooth thickenings, log crystalline site and cohomology; the log de Rham comparison (1.8.1); base change (1.11.1); the p-adic setting; and the unique lifting of log structures with uniquely p-divisible characteristic monoid along PD thickenings, with the resulting log structures on A_cris/p^n (Beilinson arXiv:1111.3316v4 §§1.1–1.8, 1.11–1.12, 1.17)", "owner": "CrystallineCohomology:CR.5:quasi-coherent", "formerly": []}`
6. For the revision of PAPER-BINDA-KATO-VEZZANI-25: route its integral quasi-coherent items (at least /009, /010 and /014) to CR.5:quasi-coherent. If the revision instead puts them in CR.5:log-algebra, CR.5:quasi-coherent imports them from there. Either way they are planned once.

**Adjusted by the joint check (C5).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- CK 5.43 also cites Beilinson §1.18's Theorem (perfectness over A_cris), which rests on the Hyodo–Kato theory of §1.16. CR.6's blueprint should decide whether CR.6 states it over A_cris. If it does, add CR.5:quasi-coherent → CrystallineCohomology:CR.6 (checked acyclic, together with this report's other edges).
- I did not check whether HodgeTateAndCanonicalSubgroups:T6:log-sites or PrismaticCohomology:PR.8, the other users of CR.5, also need the quasi-coherent setting.

## /15 (medium, duplicate): The Koszul complex is planned separately in AInfCohomology:AI.1, DerivedDeRhamCohomology:DD.1 and IntegralHeckeAndGaloisDeterminants:IHG.6

**The finding and the verdict.** AInfCohomology:AI.1 plans the Koszul complex of commuting endomorphisms (BMS1 Definition 7.1). DerivedDeRhamCohomology:DD.1 uses a Koszul model for derived completion, and IntegralHeckeAndGaloisDeterminants:IHG.6 builds Koszul/Buchsbaum–Rim complexes. Neither library has the construction. PROTOCOL §15 names exactly this notion as its example of what must be planned once. The verifier confirmed: "Assign its generic construction, functoriality, symmetry and ring-element specialization to DD.1, and add DD.1 → IHG.6. Keep AI.1's continuous group-cohomology/Lη applications and IHG.6's Buchsbaum–Rim/grade/exactness results distinct." It corrected the tensor formula: the identification with M ⊗^L_{Z[T_1,…,T_d]} Z holds "UP TO THE SHIFT BY d … An unshifted identification is false already for d=1 and the zero endomorphism."

**Checked.**
- AInfCohomology README l. 83–84: "Prove the Koszul calculation for commuting endomorphisms and integral continuous cochains." DerivedDeRhamCohomology README l. 69–70: "construct its reflective localization by the Koszul model", and l. 75: "Prove the comparison with Rlim of **derived Koszul quotients**." IntegralHeckeAndGaloisDeterminants README l. 81–83: "Build Koszul/Buchsbaum–Rim complexes, their grade/regularity hypotheses, exactness and the comparison killing the obstruction as in §5." Each quote occurs once.
- PROTOCOL.md §15: "When a general notion the atlas needs is missing from the libraries (the Koszul complex, say), find every place the atlas uses it, and plan it once, in the most general form those uses require, in the roadmap that owns it".
- BMS1 p. 56, Definition 7.1: "Let M be an abelian group with commuting endomorphisms fi … KM(f1, . . . , fd) = M ⊗Z[f1,...,fd] ⊗i (Z[f1, . . . , fd] →fi Z[f1, . . . , fd]) … the complex sits in nonnegative cohomological degrees … canonically independent of the order of the fi … KM(f1, . . . , fd) computes M ⊗L Z[f1,...,fd] Z up to a shift" (the source prints "by |I|", meaning by d). Lemma 7.3 (group cohomology of Z^d and Z_p^d), Lemma 7.5 (multiplicative structure) and Lemmas 7.9–7.10 (Lη of Koszul complexes) are the AI.1 applications.
- Libraries. Mathlib 082e2d3: Mathlib/RingTheory/Regular/RegularSequence.lean l. 21, "TODO: Koszul regular sequences". Mathlib/Algebra/Homology/LocalCohomology.lean l. 40–44 lists "the characterization as the limit of Koszul homology" as future work. No Koszul complex is defined in Mathlib. At Tau Ceti f790474, `git grep` finds koszulBraiding, koszulTwist, koszulSign and a Levi-Civita `koszul`, but no Koszul complex.
- Graph. DD.1 → AI.1 is already an edge. IHG.6 requires R02.1, IHG.0 and IHG.1. RS-01 (accepted) covers DerivedDeRhamCohomology and AInfCohomology. RS-24 (accepted) covers IntegralHeckeAndGaloisDeterminants. No RS covers DD and IHG together.
- No packet has a Koszul-complex node: DerivedDeRhamCohomology.json, IntegralHeckeAndGaloisDeterminants.json and AInfCohomology--AI.0.json have none. The AI.0 packet's coverage[AI.1] lists "BMS1 §7 commuting Koszul complexes" as remaining.
- Acyclicity (same method and graphs as /1). DerivedDeRhamCohomology:DD.1 → IntegralHeckeAndGaloisDeterminants:IHG.6 closes no cycle on any version. IntegralHeckeAndGaloisDeterminants:IHG.6 gains 10 ancestors on stageEdges (DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E0–E3, E5:abstract and E5:animation, DiamondsAndVStacks:D0 and two upstream ECD nodes), and 11 with the RS links. IHG.6 has 14 descendants.

**Fix, as edits.**
1. DerivedDeRhamCohomology README §DD.1, and the DD.1 atlas description. Insert a new paragraph after l. 81, which ends "Ordinary completion of an underived complex does not preserve all quasi-isomorphisms.":
   "Own the Koszul complex for the whole atlas (PROTOCOL §15). For commuting endomorphisms f_1, …, f_d of an abelian group, a module or a complex M, construct K_M(f_1, …, f_d) in cohomological degrees 0, …, d with the differentials and signs of BMS1 Definition 7.1. Construct its description as M ⊗_{Z[f_1,…,f_d]} ⊗_i (Z[f_1,…,f_d] --f_i--> Z[f_1,…,f_d]). Prove canonical independence of the order of the f_i and functoriality in M. Prove that K_M(f_1, …, f_d) computes M ⊗^L_{Z[T_1,…,T_d]} Z up to the shift by d; the unshifted statement is false already for d = 1 and f_1 = 0. Specialize to elements of a commutative ring acting by multiplication. This case gives the Koszul model of derived completion above, and the homological Koszul complex of a sequence of elements used for grade and regular sequences, with its indexing and sign convention stated. Acceptance: d = 1 with f_1 = 0; a regular sequence; a commuting pair of endomorphisms that are not multiplications. AInfCohomology AI.1 imports this for BMS1 §7 from Lemma 7.3 on. IntegralHeckeAndGaloisDeterminants IHG.6 imports it for its Koszul/Buchsbaum–Rim complexes."
2. AInfCohomology README l. 83–84 and the AI.1 atlas description. Replace "Prove the Koszul calculation for commuting endomorphisms and integral continuous cochains." with "Import the Koszul complex of commuting endomorphisms (BMS1 Definition 7.1) from DerivedDeRhamCohomology DD.1. Prove the calculations of BMS1 §7 from Lemma 7.3 on: group cohomology of Z^d and continuous cohomology of Z_p^d by Koszul complexes (Lemma 7.3, Remark 7.4), the multiplicative structure (Lemma 7.5), and Lη of Koszul complexes (Lemmas 7.9 and 7.10), with integral continuous cochains."
3. IntegralHeckeAndGaloisDeterminants README l. 81–83 and the IHG.6 atlas description. Replace "Build Koszul/Buchsbaum–Rim complexes, their grade/regularity hypotheses, exactness and the comparison killing the obstruction as in §5." with "Import the Koszul complex from DerivedDeRhamCohomology DD.1. Build the Buchsbaum–Rim complexes, the grade/regularity hypotheses, exactness and the comparison killing the obstruction as in §5."
4. data/atlas.json stageEdges: add {"source": "DerivedDeRhamCohomology:DD.1", "target": "IntegralHeckeAndGaloisDeterminants:IHG.6"}, with the matching requires and consumers entries.
5. Packets and requests.
   - research/blueprint/packets/AInfCohomology--AI.0.json, coverage[AI.1].remaining. Replace "BMS1 §7 commuting Koszul complexes, continuous cochains and the commuting-pair acceptance test; BLM §§2,7–8 supplier/consumer comparison." with "BMS1 §7 from Lemma 7.3 on (continuous cochains, Lemma 7.5, Lemmas 7.9–7.10) and the commuting-pair acceptance test, importing Definition 7.1 from DerivedDeRhamCohomology DD.1; BLM §§2,7–8 supplier/consumer comparison." Add the request {"supplier": "DerivedDeRhamCohomology:DD.1", "need": "The Koszul complex K_M(f_1, …, f_d) of commuting endomorphisms of a module or complex (BMS1 Definition 7.1), with its tensor-product description, independence of order and the identification with M ⊗^L_{Z[T_1,…,T_d]} Z up to the shift by d."}.
   - BP-DerivedDeRhamCohomology writes the DD.1 node (for example DD.1/koszul-complex) with the content of edit 1.
   - BP-IntegralHeckeAndGaloisDeterminants records a request to DD.1 for the ring-element case in the homological convention.
6. Owners entry for the maintainer's record; no single accepted RS covers the three roadmaps. {"target": "The Koszul complex K_M(f_1, …, f_d) of commuting endomorphisms of a module or complex (BMS1 Definition 7.1): tensor-product description, independence of order, functoriality, identification with M ⊗^L_{Z[T_1,…,T_d]} Z up to the shift by d, and the ring-element case", "owner": "DerivedDeRhamCohomology:DD.1", "formerly": ["AInfCohomology:AI.1", "IntegralHeckeAndGaloisDeterminants:IHG.6"]}

**Not changed / open.**
- RS-01's ledger lines "Koszul/Bockstein" (AI.1) and "toric continuous-cochain/Koszul calculations" (AI.3) are applications and stay as they are.
- BMS1 Example 7.2 identifies K_R(∂/∂x_i) with the de Rham complex of a polynomial ring. It is a test for DD.0's de Rham complex (RT-AREA-padic-2/2), not part of this fix.

## /16 (medium, missing): logarithmic Hodge–Witt sheaves and their exact sequences

**The finding and the verdict.** No stage states the logarithmic Hodge–Witt sheaves W_rΩ^n_log and their exact sequences as a construction. CrystallineCohomology:CR.4 plans only the dlog map. PrismaticCohomology:PR.4 states "logarithmic de Rham–Witt comparisons" without a path from CR.4, and HigherLocalFieldsAndHigherClassFieldTheory:HL.2 (narrowed by RS-28) builds logarithmic coefficients on CR.4. The verifier confirmed and asked to "Add the source-qualified definitions and CR.4 → PR.4". It corrected four points. Keep "the indexing R^{s-r} for s≥r, rather than the reversed exponent appearing in a later displayed diagram." "The R−F sequence is a sequence of PRO sheaves; do not assert that its kernel at every fixed level is W_r Ω_log or that p^r is levelwise injective." Keep the "regular/F-finite/noetherian/henselian hypotheses where CMM's relative global-section lemma needs them." And "The Zariski/étale dlog-image agreement is a separate comparison cited there to Morrow, not permission to transfer étale exactness to the Zariski topology without proof." I follow these corrections. I also drop from the finding's fix "the fact that dlog forms can be defined in the Zariski or étale topology": that fact is proved through Milnor K-theory and does not belong in CR.4.

**Checked.**
- CR.4, README lines 144–145: "Teichmuller lifts and dlog". PR.4, README lines 144–146: "Prove the stated truncation and nearby-cycle/logarithmic de Rham–Witt comparisons under BS22/BMS2's hypotheses". PR.4 requires PerfectoidQuotients:Q4 and PR.3; CR.4 is not its ancestor on the base, RS or full graph.
- HL.2, README line 43: "introduce logarithmic de Rham–Witt/Artin–Schreier–Witt coefficients for the wild characteristic case". RS-28 keeps "built on CR.4 ordinary de Rham–Witt" and links CR.4 → HL.2.
- Clausen–Mathew–Morrow (CMM), arXiv:1803.10897v2, sha256 ad23c1d7…abd9c. P.45: Definitions 5.24–5.25. P.46: Illusie's result that W_sΩ^n_{X,log}/p^r → W_rΩ^n_{X,log} is an isomorphism for s ≥ r, so that the p^r, R^{s−r} sequence "is an exact sequence of pro sheaves on X_ét [46, §I.5.7]". P.47: "let WrΩn_X,log be the image in the étale topology of dlog[·]"; the R−F sequences are "short exact sequences of pro sheaves", from "[64, Cor. 4.1(iii)]"; "Illusie’s result … (which has been extended to arbitrary regular Fp-schemes by A. Shiho [77, Cor. 2.13])". The later diagram on p.47 labels the map "{R^{r−s}}_s", the reversed exponent the verifier mentions.
- CMM extraction. Item /098 (Definitions 5.24–5.25) is planned at both CR.4 and HL.2. Item /102 (Illusie I.5.7 and Shiho) is routed to CR.4 by route 7, accepted. Item /099, "Morrow's structure results for logarithmic Hodge–Witt groups", "For any F_p-algebra R: pro short exact sequences … R−F …", is missing and sits in route 1 (the RefinedTraceMethods Part II, accepted). That brief says: "Import, never re-plan: … CrystallineCohomology CR.4 (de Rham–Witt complexes, strict Dieudonné complexes, logarithmic forms and Illusie's sequence)".
- Morrow, arXiv:1512.04703v1 (fetched for this check; sha256 3f0a8976…691c46). Corollary 4.1, p.28: "(ii) If Y is a scheme on which p is locally nilpotent, then R − F : WrΩn_Y → Wr−1Ωn_Y is surjective in the étale topology. (iii) If Y is an Fp-scheme, then the sequence of pro étale sheaves 0 → {WrΩn_Y,log}r → {WrΩn_Y}r → {WrΩn_Y}r → 0 on Y is exact" (the last map is 1 − F). Part (iii) is "an immediate consequence of (i) and (ii)". For (i), the inclusion R(W_rΩ^{n,F=1}) ⊆ W_{r−1}Ω^n_log, the smooth case is "due to Illusie [21, I.5.7.4]", and arbitrary F_p-algebras follow by Néron–Popescu and a lifting to an I-adic completion ("By Theorem 2.20(ii)"; the same result is called Proposition 2.20 elsewhere in the paper). For (ii) Morrow reduces to strictly henselian local rings and uses his Proposition 2.20(iii) with "Illusie's aforementioned result in the smooth case" for the residue field.
- The Zariski/étale agreement is Morrow's Theorem 1.2 (regular schemes, p.9) and Corollary 4.2(i) (in general, p.29). Theorem 1.2 is proved from "the result that dlog[·] : KM_n(A)/pr → WrΩn_A,log is surjective for any regular, local Fp-algebra A" (Theorem 5.1, which rests on Geisser–Levine, Elbaz-Vincent–Müller-Stach and Kerz; p.38). CMM cite the agreement as "[64, Cor. 4.1(iii)]", so their numbering follows another version of Morrow.
- Acyclicity, as in /2: CR.4 → PR.4 is acyclic, alone and jointly. On base it adds only CR.4 to PR.4's 38 ancestors; with /12's DD.3 → CR.4, DD.2 and DD.3 come too (40).

**Fix, as edits.**
1. CrystallineCohomology:CR.4, README and atlas. After "ghost coordinates can be inverted only under the proved torsion hypotheses." (line 149) insert a paragraph: "Construct the logarithmic Hodge–Witt sheaves. For an F_p-scheme X, W_rΩ^n_{X,log} ⊂ W_rΩ^n_X is the image, as an étale sheaf, of dlog[·]: G_m^{⊗n} → W_rΩ^n_X, α_1 ⊗ … ⊗ α_n ↦ dlog[α_1] ∧ … ∧ dlog[α_n] (Clausen–Mathew–Morrow Definitions 5.24–5.25 and §5.3). For X smooth over a perfect field prove, in the étale topology: (a) W_sΩ^n_{X,log}/p^r ≅ W_rΩ^n_{X,log} for s ≥ r, so that 0 → {W_sΩ^n_{X,log}}_s →(p^r) {W_sΩ^n_{X,log}}_s →({R^{s−r}}_s) W_rΩ^n_{X,log} → 0 is exact as pro sheaves (Illusie 1979, I.5.7), and its extension to regular F_p-schemes (Shiho 2007, Corollary 2.13); (b) the exact sequence of pro sheaves 0 → {W_rΩ^n_{X,log}}_r → {W_rΩ^n_X}_r →(R−F) {W_{r−1}Ω^n_X}_r → 0, from Illusie's I.5.7.4 and the étale surjectivity of R − F (Morrow, Corollary 4.1, in the smooth case). Both are statements about pro sheaves: do not assert that p^r is injective, or that the kernel of R − F is W_rΩ^n_{X,log}, at a fixed level. The Zariski-local and étale definitions agree only by a separate theorem (Morrow, Theorem 1.2, proved through Milnor K-theory), which is not part of this stage; state these results in the étale topology. PrismaticCohomology PR.4 and HigherLocalFieldsAndHigherClassFieldTheory HL.2 import them. Morrow's extension of (b) to all F_p-schemes belongs to the RefinedTraceMethods Part II of Clausen–Mathew–Morrow, which imports this case."
2. PrismaticCohomology:PR.4, README and atlas. After "étale cohomology in every degree on every singular input." (line 147) insert: "Import the logarithmic Hodge–Witt sheaves W_rΩ^n_log and their pro-exact sequences from CrystallineCohomology CR.4." The /6 and /28 fixes of PR.4 keep the anchor sentence, so this edit applies after them too.
3. HigherLocalFieldsAndHigherClassFieldTheory:HL.2, README line 43 and atlas. Replace "introduce logarithmic de Rham–Witt/Artin–Schreier–Witt coefficients for the wild characteristic case." with "introduce logarithmic de Rham–Witt/Artin–Schreier–Witt coefficients for the wild characteristic case, importing the logarithmic Hodge–Witt sheaves W_rΩ^n_log and their exact sequences from CrystallineCohomology CR.4." No edge is needed: RS-28's link CR.4 → HL.2 is accepted.
4. Stage edge: add CrystallineCohomology:CR.4 → PrismaticCohomology:PR.4.
5. research/blueprint/papers/PAPER-CLAUSEN-MATHEW-MORROW-21.result.json. No item moves; routes 1 and 7 stay accepted.
   - Item /098: set `planned` to ["CrystallineCohomology:CR.4"]. Set `note` to "CR.4 plans W_rΩ, dlog, étale descent and the logarithmic sheaves (RT-AREA-padic-2/16); HL.2 imports them (RS-28). The Zariski–étale comparison is Morrow's, item 099; in arXiv:1512.04703v1 it is Theorem 1.2 and Corollary 4.2(i), proved through Milnor K-theory."
   - Item /099: add the note "For smooth schemes over a perfect field the R−F pro sequence is planned in CrystallineCohomology CR.4 (RT-AREA-padic-2/16); Morrow's Corollary 4.1 extends it to all F_p-schemes, through Néron–Popescu and his Proposition 2.20, and imports that case."
   - Route 1 brief: replace "CrystallineCohomology CR.4 (de Rham–Witt complexes, strict Dieudonné complexes, logarithmic forms and Illusie's sequence)" with "CrystallineCohomology CR.4 (de Rham–Witt complexes, strict Dieudonné complexes, the logarithmic sheaves W_rΩ^n_log, Illusie's sequence and the R−F sequence for smooth schemes over a perfect field)".
6. Owners entry: `{"target": "Logarithmic Hodge–Witt sheaves W_rΩ^n_{X,log} (étale image of dlog), Illusie's p^r/R^{s−r} pro sequence with Shiho's regular extension, and the R−F pro sequence for smooth schemes over a perfect field", "owner": "CrystallineCohomology:CR.4", "formerly": ["HigherLocalFieldsAndHigherClassFieldTheory:HL.2"]}`. The extension of the R−F sequence to arbitrary F_p-schemes, and Morrow's other results in item /099, stay with the RefinedTraceMethods Part II, which builds on CR.4's case (PROTOCOL §15, last rule).

**Not changed / open.**
- I did not read Illusie 1979 or Shiho 2007. Their locators are those that CMM and Morrow give.
- The étale surjectivity of R − F for smooth X needs a source. Morrow proves it (Corollary 4.1(ii)) through his Proposition 2.20(iii) and Illusie's result for the residue field. If CR.4's blueprint finds no classical proof in Illusie, it takes Morrow's argument, and Proposition 2.20(iii) (in item /099) moves from the RefinedTraceMethods Part II to CR.4 with it.
- I did not check which BMS2 or Bhatt–Lurie comparison PR.4 means by "logarithmic de Rham–Witt comparisons". If PR.4 needs the R−F sequence beyond smooth schemes, it must import Morrow's extension, which is not upstream of PR.4.

## /17 (medium, library-claim): AInfCohomology:AI.0 should name the Mathlib A_inf, θ and B_dR^+ carriers and plan only what is missing

**The finding and the verdict.** AInfCohomology:AI.0 plans to "form A_inf=W(O_C^flat), its Frobenius and theta" and treats B_dR^+ as supplied by PadicHodgeTheory. It names none of the Mathlib declarations that already provide the tilt, the Witt Frobenius equivalence, Fontaine's θ with its Teichmüller formula and surjectivity, and B_dR^+ and B_dR. The verifier confirmed this "only as an explicit baseline/API correction": "AI.0 already instructs reuse, and accepted RS-01 already names the Mathlib BDeRhamPlus/BDeRham carriers". It asked to cite them in AI.0 and R06.1, keeping their hypotheses ("primality, p nonunit, p-adic completeness and, for surjectivity, Frobenius surjectivity mod p"). It added: "the general principal nonzerodivisor kernel theorem belongs to P1; AI.0 specializes it and identifies its chosen xi, rather than constructing it a second time", and "Mathlib explicitly leaves the extended theta map and DVR property as TODOs".

**Checked.**
- Mathlib 082e2d3, read in a checkout at that commit:
  - Mathlib/RingTheory/Perfection.lean l. 634: `def PreTilt := Perfection (ModP O p) p`.
  - Mathlib/RingTheory/WittVector/Frobenius.lean l. 286: `def frobeniusEquiv [PerfectRing R p] : WittVector p R ≃+* WittVector p R`.
  - Mathlib/RingTheory/Perfectoid/FontaineTheta.lean l. 165: `def fontaineTheta : 𝕎 R♭ →+* R`, under `[Fact p.Prime]` and, from l. 118, `[Fact ¬IsUnit (p : R)] [IsAdicComplete (span {(p : R)}) R]`; l. 182: `fontaineTheta_teichmuller`; l. 195: root-level `surjective_fontaineTheta (hF : Function.Surjective (frobenius (ModP R p) p))`.
  - Mathlib/RingTheory/Perfectoid/BDeRham.lean l. 77: `def BDeRhamPlus`; l. 90: `def BDeRham`; l. 30: TODO "3. Show that ker θ is principal when the base ring is integral perfectoid"; TODOs 1–2: extend θ to B_dR^+, and show that B_dR^+ is a discrete valuation ring.
- AInfCohomology README l. 32–33, 34–37 and 41–43 (the same text is in the atlas descriptions of AI.0, AI.0:integral and AI.0:period-comparison): "Reuse the common integral perfectoid ring and Witt-vector definitions to form A_inf=W(O_C^flat), its Frobenius and theta:A_inf→O_C.", "Prove the displayed quotient exists and generates the stated ideal rather than using field division." and "A_cris is the completed PD envelope from CR.0, and B_dR^+ is the kernel-adic completion after p-inversion supplied by PadicHodgeTheory." Each occurs once in the README.
- Principal kernel. PerfectoidSpaces:P1 → PerfectoidQuotients:Q0:integral-algebra → AInfCohomology:AI.0 on stageEdges, so P1 is already an ancestor of AI.0 and AI.0:integral. data/decompositions/PerfectoidSpaces.json has P1/fontaine-theta-and-primitive-kernel: "Fontaine's θ: W(R♭+) → R^+ is surjective with kernel generated by a degree-one primitive nonzerodivisor".
- R06.1 side, already applied. The RS-01 layer reason for R06.1 reads "Reuse the existing pinned BDeRhamPlus/BDeRham carriers". The pending P7 packet has node R06.1/de-rham-period-ring, "Put B_dR^+ := BDeRhamPlus O_C p", and R06.1/explicit-generator-of-ker-theta, which imports P1/fontaine-theta-and-primitive-kernel. RT-AREA-padic-1/20 edit 1b adds "B_dR^+(C) = BDeRhamPlus O_C p" to R06.1's README text.
- The AI.0 packet (research/blueprint/packets/AInfCohomology--AI.0.json; BP-AInfCohomology--AI.0 is pending) cites none of these declarations in "baseline". Its coverage for AI.0 and AI.0:integral is "not_read".
- No stage-graph change.

**Fix, as edits.** AInfCohomology README §AI.0, and the same text in the atlas descriptions of AI.0, AI.0:integral and AI.0:period-comparison.
1. Replace "Reuse the common integral perfectoid ring and Witt-vector definitions to form A_inf=W(O_C^flat), its Frobenius and theta:A_inf→O_C." with "Form A_inf=W(O_C^flat) on the pinned Mathlib carriers and the common integral perfectoid ring definitions of PerfectoidQuotients Q0:integral-algebra. O_C^flat is PreTilt O_C p (Mathlib/RingTheory/Perfection.lean). The Witt Frobenius is WittVector.frobeniusEquiv (WittVector/Frobenius.lean). theta:A_inf→O_C is WittVector.fontaineTheta, with fontaineTheta_teichmuller and surjective_fontaineTheta (Perfectoid/FontaineTheta.lean). Prove the instances these need for O_C: p prime, p not a unit, p-adic completeness, and surjectivity of Frobenius on O_C/p for the surjectivity of theta. Do not build a second tilt, Witt Frobenius or theta."
2. After "Prove the displayed quotient exists and generates the stated ideal rather than using field division." add: "That ker theta is principal with a nonzerodivisor generator is PerfectoidSpaces P1's theorem, imported through Q0:integral-algebra; Mathlib lists it as a TODO in Perfectoid/BDeRham.lean. This stage specializes it to O_C and proves that its xi generates, rather than proving principality a second time."
3. Replace "A_cris is the completed PD envelope from CR.0, and B_dR^+ is the kernel-adic completion after p-inversion supplied by PadicHodgeTheory." with "A_cris is the completed PD envelope from CR.0. B_dR^+ and B_dR are Mathlib's BDeRhamPlus O_C p and BDeRham O_C p (Perfectoid/BDeRham.lean): the ker-theta-adic completion of A_inf[1/p] and its localization. PadicHodgeTheory R06.1 proves their properties, including the extended theta and the discrete valuation ring property (both Mathlib TODOs), and does not rebuild them."
4. research/blueprint/packets/AInfCohomology--AI.0.json, "baseline.declarations". Add entries with "ref", "module" and "provides", each read at 082e2d3:
   - mathlib:PreTilt (Mathlib/RingTheory/Perfection.lean): "O_C^flat = Perfection (ModP O_C p) p".
   - mathlib:WittVector.frobeniusEquiv (Mathlib/RingTheory/WittVector/Frobenius.lean): "Frobenius of W(R) as a ring equivalence for PerfectRing R p".
   - mathlib:WittVector.fontaineTheta (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean): "θ : W(R♭) → R, for p prime, p not a unit and R p-adically complete".
   - mathlib:WittVector.fontaineTheta_teichmuller (same module): "θ([x]) = x♯".
   - mathlib:surjective_fontaineTheta (same module): "θ is surjective if Frobenius is surjective on R/p".
   - mathlib:BDeRhamPlus and mathlib:BDeRham (Mathlib/RingTheory/Perfectoid/BDeRham.lean): "the ker-θ-adic completion of W(R♭)[1/p] and its localization at generators of ker θ; zero if p = 0 in R".
   Add to coverage[AI.0:integral].remaining: "Instances of the Mathlib carriers for O_C; specialization of PerfectoidSpaces P1's principal-kernel theorem and identification of xi."
5. R06.1: no further edit. The RS-01 reason, the P7 packet nodes and RT-AREA-padic-1/20 already record that R06.1 builds on BDeRhamPlus/BDeRham.

**Not changed / open.**
- AI.0 still plans mu, xi and tilde-xi, tilde-theta, the residue map to W(k), the Frobenius-twisted scalar extension and the Breuil–Kisin twists. The finding and the verifier agree that these are missing from the libraries.
- The finding also proposes that AI.0 prove principality of ker θ and close the Mathlib TODO. Following the verifier, that theorem is P1's; AI.0 specializes it.
- The characteristic-p and ramified-Witt period rings, for which Mathlib's BDeRhamPlus is zero or does not apply, concern RelativeFarguesFontaine (RT-AREA-padic-2/21), not AI.0.
- AI.0's text ("identify the kernel generator with the existing period-ring one") is kept. Since AI.0:integral precedes R06.1, the identification uses P1's criterion, not R06.1's node.

## /18 (medium, missing): weakly admissible ⇒ admissible. Keep the statement in R06.2 and prove it in R06.3 by Berger's slope route

**The finding and the verdict.** PadicHodgeTheory:R06.2 plans "weak admissibility versus admissibility" with R06.1 as its only prerequisite, and no slope-theoretic supplier reaches it. The verifier confirmed "missing proof-route dependencies, without endorsing the universal assertion". It selected Berger's route and asked to import "the RD.1 slope theorem after the relocation in finding44 (RD.2 is a safe broader ancestor), PG.2 and the early annulus prefix". It also asked to "State the degree/slope and stable-lattice comparison" and to match scope: "PG.2 currently promises finite extensions of Q_p, whereas Berger also treats perfect residue fields". I keep the route, the inputs and the scope. I put the proof in PadicHodgeTheory:R06.3 and not in R06.2. The verifier relied on Remarque V.2.2 ("without using the local-monodromy theorem"). As printed, Berger's proof does use RD.2's local monodromy theorem, and it also uses Berger 2002 Théorème 3.6. R06.3 has both: RD.2 is already upstream, and /19 makes R06.3 the owner of Berger's bridge.

**Checked.**
- R06.2's text and requires, as the finding quotes them. PadicHodgeTheory README, completion contract: "separate the construction of filtered semilinear objects from the theorem producing a representation".
- Berger 2004 (math/0406601v1):
  - p. 2: K is "complet et de corps résiduel parfait".
  - Théorème B, p. 3.
  - III.2.1, p. 15: the monodromy theorem "conjecturé par Crew et démontré par André, Kedlaya et Mebkhout".
  - Proof of III.2.3, p. 16: "Par le théorème de monodromie p-adique de André, Kedlaya et Mebkhout".
  - Corollaire III.2.5, p. 17. Its proof reads "on peut donc écrire M′ = M(D′)", which is Théorème III.2.4.
  - Théorème IV.2.1 and Proposition IV.2.2, p. 18. IV.2.2 uses "Par le corollaire III.2.5, tout sous-objet de M(D) est de la forme M(D′)" and "[Ked04, theorem 6.10]".
  - Théorème V.2.1, pp. 21–22, uses "[Ber02, théorème 3.6]" (p. 22).
  - Remarque V.2.2, p. 22.
- The chain IV.2.2 → III.2.5 → III.2.4 → III.2.3 → III.2.1 therefore uses the local monodromy theorem. The pending packet records the same as source issue PadicHodgeTheory/E32.
- Berger 2002, Théorème 3.6, p. 33: "Dst(V) = (D†log(V)[1/t])^ΓK et Dcris(V) = (D†rig(V)[1/t])^ΓK".
- RD.1's text: "Frobenius pullback and slope filtrations. Prove existence/uniqueness and descent of the filtration". The RD slope node's hypothesis: "σ is a Frobenius for Γ_an,con in Kedlaya's sense: … reducing modulo a uniformizer of Γ_con to the p-th power map". The cyclotomic φ(π) = (1+π)^p − 1 is such a lift, and Berger p. 17 says "les anneaux Γan,con et Γcon[1/p] de Kedlaya sont nos anneaux B†rig,K et B†K".
- Graph:
  - RD.1 → RD.2 → R06.3 exists.
  - PG.2 reaches neither R06.2 nor R06.3.
  - Among R06.2's consumers, only LocalGaloisDeformationRings:L7 (through R08.3) and PotentialModularityAndCompatibleSystems:R24.5:operations lie downstream of R06.3.
  - The other consumers are CP.2, R07.3, R07.4, PadicHodgeRegulators:L0, P7, R06.4, R06.5, PG.6 and PR.7. None of their texts asks for the converse theorem. R07.3 and R06.4 name only Fontaine–Laffaille's own admissibility theorem.
- The pending blueprint packet research/blueprint/packets/PadicHodgeTheory--P7.json (BP-PadicHodgeTheory--P7, state pending) reached the same conclusion. See its gap "Colmez–Fontaine theorem (weakly admissible ⇒ admissible) is not provable inside R06.2" and its restructure entry "Prove the Colmez–Fontaine theorem in R06.3 (or a sub-stage after P7), keeping its statement in R06.2".
- Cost comparison. Putting the proof in R06.2 (with RD.2, PG.2 and P7:annulus-foundations) would add 15 ancestors to R06.2 on stageEdges and 85 in the assembled build graph. The assembled cost comes through RD.0's input AdicSpacesPartII:F1. All of R06.2's consumers would inherit them. Under this fix R06.2 gains nothing from /18.
- Acyclicity: /18 adds no edge. It uses /19's PG.2 → R06.3. The verifier's alternative edges RD.1, RD.2, PG.2 and P7:annulus-foundations → R06.2 are also acyclic in all six graphs.

**Fix, as edits.**
1. R06.2, in content/campaign/PadicHodgeTheory/README.md and the R06.2 atlas description. Replace "Prove weak admissibility versus admissibility in the precise setting used to construct representations and local deformation spaces." with:
   "Define weak admissibility, prove that admissible filtered (φ,N)-modules are weakly admissible, and state the converse (Colmez–Fontaine: weakly admissible implies admissible) in the precise setting used to construct representations and local deformation spaces. The proof of the converse is R06.3's. It needs Kedlaya's slope filtration, the overconvergent Robba realization of PhiGammaModulesAndIwasawaCohomology PG.2 and Berger's comparison of D_st with that realization, none of which precedes this stage."
2. R06.3, in the same README and atlas description. Insert this paragraph after the paragraph that /19 edit 1 produces:
   ```
   Prove the Colmez–Fontaine theorem stated in R06.2, for K a finite extension of Q_p, by Berger's route (Berger 2004, arXiv math/0406601v1). Construct the (φ,Γ_K)-module M(D) over B†_rig,K of a filtered (φ,N,G_K)-module D by gluing the lattices Fil^0(K_n((t)) ⊗ D) (§II, Théorème II.2.6). Prove the equivalence onto (φ,Γ_K)-modules with locally trivial connection and its consequence for sub-objects (Théorèmes III.2.3–III.2.4, Corollaire III.2.5; these use RD.2's local monodromy theorem, although Remarque V.2.2 says otherwise). Prove that the slope of det M(D) is t_N(D) − t_H(D) (Théorème IV.2.1). With Kedlaya's slope filtration from PadicDifferentialEquationsAndRigidCohomology RD.1, prove that D is weakly admissible if and only if M(D) is étale, i.e. descends to an étale (φ,Γ_K)-module over B†_K, its stable lattice (Proposition IV.2.2). Recover V from that module through PhiGammaModulesAndIwasawaCohomology PG.1–PG.2, and prove D = D_st,L(V) with its filtration using Berger 2002, Théorème 3.6, constructed above (Théorème V.2.1).
   ```
3. The same README, completion contracts.
   a. Replace "For weakly admissible versus admissible, separate the construction of filtered semilinear objects from the theorem producing a representation: build the degree/slope comparison and recover its invariant lattice/rational representation in the precise discretely valued field setting." with "For weakly admissible versus admissible, separate the construction of filtered semilinear objects (R06.2) from the theorem producing a representation (R06.3). Build the degree/slope comparison of Berger's M(D) with Kedlaya's slope filtration (RD.1), descend the étale module to its invariant lattice over B†_K and recover the rational representation through PG.1–PG.2, for K finite over Q_p."
   b. Replace "together with the Robba/Galois comparison;" with "together with PG.2's overconvergent Robba realization and Berger's bridge (Berger 2002, Théorèmes 3.6, 0.4 and 5.10), which R06.3 constructs;".
4. RD.1, in content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md and the RD.1 atlas description. After "Prove existence/uniqueness and descent of the filtration with its coefficient extensions recorded.", insert: "State the slope filtration theorem (Kedlaya, A p-adic local monodromy theorem, Theorem 6.10) for any Frobenius lift in Kedlaya's sense, and record the instance B†_rig,K with φ(π) = (1+π)^p − 1 that PadicHodgeTheory R06.3 uses (Berger 2004, §IV.1)."
5. The pending packet research/blueprint/packets/PadicHodgeTheory--P7.json (for BP-PadicHodgeTheory--P7).
   - Adopt its own restructure entry "Prove the Colmez–Fontaine theorem in R06.3 (or a sub-stage after P7), keeping its statement in R06.2", in the R06.3 form. The R06.3 nodes it lists implement edit 2.
   - Keep R06.2/colmez-fontaine-theorem as the statement.
   - Mark the gap "Colmez–Fontaine theorem (weakly admissible ⇒ admissible) is not provable inside R06.2" resolved by this fix.
   - Keep source issue E32.
6. Paper items (planned markers only; no route changes). Add "PadicHodgeTheory:R06.3" to the planned list of PAPER-DOSPINESCU-LEBRAS-17/5 and PAPER-GUO-REINECKE-24/034, keeping R06.2, which states the theorem. PAPER-FARGUES-FONTAINE-18/964 and /966 already list R06.3.

**Not changed / open.**
- Scope. The proof is planned for K finite over Q_p, because PG.2 promises only that. PAPER-GLEASON-LIM-XU-26/T50 (K finite over Q̆_p) and PAPER-FARGUES-FONTAINE-18/964 (perfect residue field) need more. Covering them means extending PG.0–PG.2 and this proof to perfect residue fields, which Berger's proof allows. Until then T50 has only R06.2's statement.
- /44 (low) moves the slope node from RD.2 to RD.1. Until that is done, R06.3 cites RD.2/slope-filtration-for-frobenius-modules-statement, and RD.2 → R06.3 already exists.
- The Fargues–Fontaine curve route (VB2:classification, VB4) and Colmez's Banach–Colmez route (VB3) are not planned.
- If the maintainer prefers the verifier's placement in R06.2, the edges are RD.2 (not only RD.1, because of III.2.5), PG.2 and P7:annulus-foundations → R06.2, all acyclic. R06.2 would then also have to own Berger 2002, Théorème 3.6 and the maps ι_n.

## /19 (medium, missing): R06.3 needs PG.2's Robba realization and R01.2's Weil–Deligne carrier, and constructs Berger's bridge

**The finding and the verdict.** PadicHodgeTheory:R06.3 attaches Weil–Deligne parameters to de Rham representations. Its only inputs are RD.2 and R06.2. The bridge V → D†_rig(V) → N_dR(V) needs Cherbonnier–Colmez overconvergence (PhiGammaModulesAndIwasawaCohomology:PG.2), and the WD carrier is ArithmeticGaloisRepresentations:R01.2's. The verifier: "PG.2 owns the former; R06.3 must construct the latter and import R01.2's WD carrier/conventions, while keeping its coefficient-prime monodromy proof distinct from R01.2's prime-to-residue-characteristic theorem. Use PG.2 → R06.3 and R01.2 → R06.3". It also asks to "Apply Berger's correction in 0406601v1 Appendix B, pp.26–27".

**Checked.**
- R06.3's text and requires. R01.2: "For ℓ different from the residue characteristic, prove quasi-unipotence … With arithmetic Frobenius the relation is r(F)Nr(F)⁻¹=qN". PG.2: "Cherbonnier–Colmez overconvergence theorem for p-adic representations over finite extensions of Q_p". RS-26 owner: "Cherbonnier–Colmez overconvergence and bounded/Robba realization …" → PG.2.
- Berger 2002 (math/0102179v3):
  - p. 2: K is finite and totally ramified over F = W(k)[1/p], with k perfect.
  - Théorème 0.1, p. 3; 0.2, p. 4; 0.4 and 0.5, p. 5; 0.6, p. 6.
  - 3.6, p. 33; 5.10, p. 52.
  - 5.19, p. 56, and 5.20, p. 58. 5.20 reads "Tout module différentiel M de présentation finie sur RK admettant une structure de Frobenius possède une base de solutions dans R′[log π]", i.e. RD.2.
- Berger 2004, Appendix B, pp. 26–27, lists the corrections to Berger 2002:
  - B†_K has coefficients in "l'extension maximale non-ramifiée de F dans K∞";
  - log must be extended from Ã⁺ to Ã† (Proposition 2.24);
  - Proposition 5.15: "l'image de ιn est dense pour la topologie t-adique";
  - matrices are written transposed;
  - "N(log(π)) = −p/(p−1) au lieu de N(log(π)) = −1".
- data/decompositions/PadicHodgeTheory.json, coverage of R06.3: "The bridge from representations to N_dR(V) (Berger Théorèmes 3.6, 5.10 and §5.4) belongs to this stage and was not decomposed."
- The pending P7 packet plans the bridge's rings and dictionary as P7 nodes. 23 of its 32 P7 nodes are prerequisites of its R06.3 nodes, and none of the 23 needs PG.3–PG.6 or R07. The packet proposes P7 → R06.3. That edge would put PG.3 and PG.6 upstream of R06.3 and add 25 ancestors (stageEdges) or 76 (with RS links).
- Graph:
  - There is no path PG.2 → R06.3 on stageEdges or with RS links.
  - There is no path R01.2 → R06.3 there either. The assembled build has one only incidentally: R01.2 → H1 → L5 → F1 → RD.0 → RD.1 → RD.2 → R06.3.
  - Both edges are acyclic in all six graphs. R06.3 goes from 35 to 40 ancestors on stageEdges.

**Fix, as edits.**
1. R06.3, in content/campaign/PadicHodgeTheory/README.md and the R06.3 atlas description. Replace "Prove the p-adic monodromy theorem needed to attach a potentially semistable Weil–Deligne parameter to a de Rham representation." with:
   ```
   Prove the p-adic monodromy theorem needed to attach a potentially semistable Weil–Deligne parameter to a de Rham representation, for K a finite extension of Q_p, by Berger's route (Berger 2002, Théorème 5.19). Import from PhiGammaModulesAndIwasawaCohomology PG.2 the overconvergent module D†(V), the Robba realization D†_rig(V) = B†_rig,K ⊗ D†(V) (Théorème 0.1) and the maps ι_n. Construct here Berger's bridge:
   - D_cris(V) and D_st(V) recovered from D†_rig(V)[1/t] and D†_log(V)[1/t] (Théorème 3.6);
   - the connection ∇_V = log(γ)/log χ(γ) on D†_rig(V), and the criterion that V is semistable over some K(μ_{p^n}) if and only if ∇_V is unipotent on D†_rig(V)[1/t] (Théorème 0.4);
   - for V de Rham with non-positive Hodge–Tate weights, the unique ∂_V-stable free rank-d submodule N_dR(V) ⊂ D†_rig(V), stable under φ and Γ_K (Théorème 5.10).
   N_dR(V) is a p-adic differential equation with Frobenius structure. The local monodromy theorem of PadicDifferentialEquationsAndRigidCohomology RD.2 (Théorème 5.20) makes it quasi-unipotent, which gives de Rham ⇒ potentially semistable.
   Apply Berger's corrections (Berger 2004, Appendix B): B†_K has coefficients in the maximal unramified extension of F in K_∞; log must be extended from Ã⁺ to Ã† (Proposition 2.24); in Proposition 5.15 the image of ι_n is only t-adically dense; matrices are written transposed; and D_st needs N(log π) = −p/(p−1), not −1.
   ```
2. Same stage. Replace "Compare the determinant, twists and Frobenius conventions with R01." with "Import the Weil–Deligne category from ArithmeticGaloisRepresentations R01.2, with its arithmetic-Frobenius normalization r(F)Nr(F)⁻¹ = qN, Frobenius semisimplification and twists, and compare the determinant, twists and Frobenius conventions with it. R01.2's quasi-unipotence theorem is for ℓ different from the residue characteristic. The p-adic monodromy theorem here has its own proof and is not imported from R01.2."
3. Same stage. Replace "**Dependencies:** R06.2 (preceding layer)." with "**Dependencies:** R06.2 (preceding layer); [PadicDifferentialEquationsAndRigidCohomology RD.2](../PadicDifferentialEquationsAndRigidCohomology/README.md); [PhiGammaModulesAndIwasawaCohomology PG.2](../PhiGammaModulesAndIwasawaCohomology/README.md); [ArithmeticGaloisRepresentations R01.2](../ArithmeticGaloisRepresentations/README.md#r01-2)."
4. data/atlas.json stageEdges. Add PhiGammaModulesAndIwasawaCohomology:PG.2 → PadicHodgeTheory:R06.3 and ArithmeticGaloisRepresentations:R01.2 → PadicHodgeTheory:R06.3. Add both to R06.3's requires.
5. The pending packet PadicHodgeTheory--P7 (for BP-PadicHodgeTheory--P7). Re-parent to R06.3 the 23 P7 nodes that its R06.3 nodes use, and do not add P7 → R06.3. The ids become PadicHodgeTheory:R06.3/<same suffix>. The nodes are: robba-ring-of-p-adic-field, berger-robba-identification, robba-ring-tensor-identity, extended-robba-ring-with-galois-action, extended-robba-plus-decomposition, extended-localisation-maps, localisation-maps-p-adic-field, decompletion-operators, frobenius-regularisation, semistable-periods-in-extended-robba-ring, log-extended-period-rings, cyclotomic-eigenvectors-in-log-ring, antiderivatives-on-log-robba-ring, nabla-operator-on-robba-ring, connection-on-robba-realisation, robba-realisation-comparison, berger-dcris-dst-dictionary, ddr-via-robba-realisation, t-divisibility-criterion, theta-iota-kernel, theta-iota-surjective-onto-Kn, sen-module and fontaine-dif-module. Update the P7 nodes that cite them; the build then adds R06.3 → P7, which is acyclic because P7 has no consumers.

**Adjusted by the joint check (C8).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- Alternative for the packet: its own proposed sub-stage P7:berger-robba, with inputs P7:annulus-foundations, PG.0–PG.2, R06.1, R06.2 and RD.0 and the edge P7:berger-robba → R06.3. This is acyclic in all six graphs. It departs from the verifier's "R06.3 must construct the latter", so I did not choose it.
- Ownership of Sen theory and D_dif. The packet's entry asks for an owner. Under edit 5 they move to R06.3, their only user. An earlier owner is a separate decision.
- Perfect residue fields: as in /18.

## /20 (medium, missing): Tate–Sen theory. New early sub-stage PadicHodgeTheory:R06.1:tate-sen

**The finding and the verdict.** No stage states the Tate–Sen theorem, Tate's normalized traces or Tate's character criterion, although PadicHodgeTheory:R06.2, PadicHodgeTheory:P8:local-rational and FaltingsFinitenessAndIsogenyTheorems:R28.2 need them. The verifier confirmed and asked to add "the trace bounds/completed cyclotomic descent and Tate–Sen theorem in the early R06.1 scope". It made two corrections:
- "the character result needs the finite-inertia/ramification and character-image hypotheses (and Faltings' separate global class-field argument), not unconditional finite global order";
- "the P8 node actually reduces to H^q_cont(Gamma_k,Q_p(i)), so include the completed-cyclotomic descent comparison".

It also said "R06.1 already reaches R28.2 … preserve that path rather than report a new missing stage dependency". I use the finding's sub-stage option, for a reason the verifier did not have. /5 (another section of this report) plans Tate's p-divisible-group theorems in R07.1–R07.2, and they use Tate's Theorem 2. R06.1 cannot feed R07.1 without a cycle. An early sub-stage can.

**Checked.**
- Stage texts. A search of all atlas stage texts for Tate–Sen, Ax–Sen, normalized traces and C_K(·) finds only the normalized trace of ψ in PhiGammaModulesAndIwasawaCohomology:PG.4 and ColemanPowerSeries:L1, and Tate's theorem for class formations in Tau Ceti ClassFieldTheory. None states Tate–Sen.
- Brinon–Conrad:
  - Definition 1.3.1, p. 7: a p-adic field is complete, discretely valued, of characteristic 0, with perfect residue field.
  - Theorem 2.2.7, p. 15: "K = C_K^{G_K} … C_K(r)^{G_K} = 0 for r ≠ 0 … H^1_cont(G_K, C_K(r)) = 0 if r ≠ 0 and H^1_cont(G_K, C_K) is 1-dimensional". It is followed by the η-version, which assumes "η(G_K) is a commutative p-adic Lie group of dimension at most 1".
  - Lemma 14.1.9, p. 242.
  - Proposition 14.3.3 and Theorem 14.3.4, p. 253: "If η(I_K) is infinite then H^i_cont(G_K, C_K(η)) = 0 for i = 0, 1 and these cohomologies are 1-dimensional over K when η(I_K) is finite".
  - p. 22: B_HT^{G_K} = K "By the Tate–Sen theorem".
- Tate (1967), Theorem 2 (scan p. 10): if K_∞ contains a finite K_0 with K_∞/K_0 totally ramified and Gal ≅ Z_p, then H^0(C(χ)) = H^1(C(χ)) = 0. Tate's §4 then uses it ("by Theorem 2, … = 0").
- Mathlib 082e2d3:
  - Algebra.normalizedTrace (Mathlib/FieldTheory/NormalizedTrace.lean:81) is K →ₗ[F] F for [CharZero F] and an integral extension. It is algebraic, with no continuity bound.
  - continuousCohomology is at Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131.
  - cyclotomicCharacter is at Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307.
  - PadicComplex is at Mathlib/NumberTheory/Padics/Complex.lean:137.
- data/decompositions/PadicHodgeTheory.json, node P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf.
  - Its hypotheses contain "Tate's computation of H^q_cont(Γ_k, Q_p(i)) ([19], unread)" and "a Tate-type descent for K = completion of k(μ_{p^∞}), not a consequence of Lemma 5.5", each once.
  - Coverage of P8:local-rational contains "Tate [19] for H^q_cont(Γ_k, Q_p(i)) and for the descent R(i) → R ⊗̂_k K(i)" once.
  - Here k is discretely valued with perfect residue field, so the owner must cover Brinon–Conrad's p-adic fields, not only finite extensions of Q_p.
- Faltings:
  - research/blueprint/packets/FaltingsFinitenessAndIsogenyTheorems.json (done). requests[23] has supplier "PadicHodgeTheory:R06.2" and need "Tate's Theorem 2 and its converse … C(ψ) ≅ C … if and only if ψ has finite image on inertia". It is the only R06 request.
  - The data/decompositions gap says "Theorem 2 (a character whose C-realization is C(+k) is chi_0^k up to finite order)", once.
- The pending P7 packet already has nodes R06.1/ax-sen-lemma … R06.1/tate-sen-theorem (for K finite over Q_p), P8:local-rational/tate-descent-for-completed-cyclotomic-tensor (k with perfect residue field) and R06.2/hodge-tate-decomposition-tate. Parts (1)–(2) of the last are the character criterion. The packet also has a request to Tau Ceti LocalFieldsRamification layer 3 for Tate's ramification estimates.
- Graph:
  - R06.1 reaches R28.2 already on stageEdges: R06.1 → R06.2 → R06.5 → R06.6 → R11.5 → R11.6 → R28.1 → R28.2. With RS links R06.6 → R28.2 is direct. No edge to R28.2 is added.
  - R06.1 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 closes a cycle in the assembled build graph: R07.1 → ModularCurvesPartII:R13.2 → AdicSpacesPartII:R2 → R3 → R06.1.
  - R06.1:tate-sen → R07.1 and → R07.2 are acyclic in all six graphs.
  - The new edges are acyclic. R06.1 and R06.2 each gain 2 ancestors: the sub-stage and the LocalFieldsRamification layer (R01.1 is already an ancestor).

**Fix, as edits.**
1. content/campaign/PadicHodgeTheory/README.md. Insert after the R06.1 Dependencies line, which ends "[PerfectoidSpaces P2](../PerfectoidSpaces/README.md).", and before `<a id="r06-2"></a>`:
   ```markdown
   <a id="r06-1-tate-sen"></a>
   <a id="stage-R06.1:tate-sen"></a>

   ### R06.1:tate-sen. Tate–Sen theory of C_K

   **Dependencies:** [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1) (continuous representations and characters); Tau Ceti LocalFieldsRamification, layer 3 (upper numbering, Herbrand's theorem, the different). Mathlib supplies PadicComplex, cyclotomicCharacter, continuousCohomology and the algebraic Algebra.normalizedTrace. No period-ring, perfectoid or Robba input.

   Let K be a p-adic field: complete, discretely valued, of characteristic 0, with perfect residue field of characteristic p (Brinon–Conrad Definition 1.3.1). Let C_K be the completion of an algebraic closure, K_∞ = K(μ_{p^∞}), H_K = Gal(K̄/K_∞) and Γ_K = Gal(K_∞/K). Prove, following Brinon–Conrad §§2.2, 13–14 and Tate (1967, §3):
   - the Ax–Sen lemma, and C_K^H = (K̄^H)^ for closed subgroups H of G_K;
   - Tate's trace estimate for the cyclotomic Z_p-extension, and Tate's normalized traces R_n: K_∞ → K_n with R_n|_{K_m} = p^{n−m} Tr_{K_m/K_n}, built on Mathlib's algebraic Algebra.normalizedTrace. Prove the continuity bound v(R_n(x)) ≥ v(x) − c, the extension to K̂_∞, and the Γ_K-equivariant splitting K̂_∞ = K_n ⊕ X_n with γ_n − 1 bijective with bounded inverse on X_n. Neither estimate is in Mathlib;
   - H^i_cont(H_K, W) = 0 for i ≥ 1 and H^i_cont(G_K, W) ≅ H^i_cont(Γ_K, W^{H_K}) for finite-dimensional semilinear C_K-representations W (Brinon–Conrad Proposition 14.3.3), with semilinear Hilbert 90;
   - the Tate–Sen theorem (Brinon–Conrad Theorems 2.2.7 and 14.3.4): C_K^{G_K} = K; C_K(r)^{G_K} = 0 and H^1_cont(G_K, C_K(r)) = 0 for r ≠ 0; and H^1_cont(G_K, C_K) = K·log χ. More generally, let η: G_K → O_K^× be continuous with η(G_K) a commutative p-adic Lie group of dimension at most 1. Then H^0 and H^1 of C_K(η) vanish if η(I_K) is infinite and are one-dimensional over K if η(I_K) is finite;
   - Tate's character criterion: for such η, C_K(η) ≅ C_K if and only if η(I_K) is finite. Hence C_K(η) ≅ C_K(k) forces ηχ^{−k} to be finite on inertia. This says nothing about the global order of a character: Faltings' global statement (FaltingsFinitenessAndIsogenyTheorems R28.2) uses his own class-field argument. Also, a representation with finite image on inertia becomes trivial after ⊗ C_K;
   - the completed-cyclotomic descent with Banach coefficients: for a K-Banach space M with trivial action (for example an affinoid K-algebra), M(i) → (M ⊗̂_K K̂_∞)(i) induces isomorphisms on continuous Γ_K-cohomology. Also, H^q_cont(Γ_K, Q_p(i)) is Q_p for i = 0 and q ∈ {0, 1}, and 0 otherwise.

   This sub-stage is the one owner of these statements. R06.1 imports them for the invariants of B_HT and B_dR, and so do R06.2, P8:local-rational (Scholze 2013, Proposition 6.16) and FaltingsFinitenessAndIsogenyTheorems R28.2. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 import Tate's Theorem 2 from here.
   ```
2. R06.1, in the same README and the R06.1 atlas description.
   a. After "The existence and invariants of the rational period rings remain mathematical targets, not opaque constants.", add: "Tate–Sen theory (the Galois invariants and cohomology of C_K and its twists, and Tate's normalized traces) is the earlier sub-stage R06.1:tate-sen below. This stage uses it for the invariants of B_HT and B_dR."
   b. Replace "**Dependencies:** [AInfCohomology AI.0:integral](../AInfCohomology/README.md);" with "**Dependencies:** R06.1:tate-sen (below); [AInfCohomology AI.0:integral](../AInfCohomology/README.md);".
3. data/atlas.json.
   - New stage: id PadicHodgeTheory:R06.1:tate-sen, owner PadicHodgeTheory, key "R06.1:tate-sen", title "Tate–Sen theory of C_K", and the description of edit 1. scripts/snapshot/build_data.py derives parentStageId PadicHodgeTheory:R06.1 from the key.
   - stageEdges: add ArithmeticGaloisRepresentations:R01.1 → R06.1:tate-sen, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration → R06.1:tate-sen, and R06.1:tate-sen → PadicHodgeTheory:R06.1. The last one is also what scripts/theory_graph.py adds for a child. Add R06.1:tate-sen to R06.1's requires.
   - Then rerun research/blueprint/make_atlas_extracts.py.
4. data/decompositions/PadicHodgeTheory.json.
   a. In the node P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf, replace "Tate's computation of H^q_cont(Γ_k, Q_p(i)) ([19], unread)" with "Tate's computation of H^q_cont(Γ_k, Q_p(i)) (PadicHodgeTheory:R06.1:tate-sen)".
   b. In the same node, replace "a Tate-type descent for K = completion of k(μ_{p^∞}), not a consequence of Lemma 5.5" with "a Tate-type descent for K = completion of k(μ_{p^∞}), not a consequence of Lemma 5.5; supplied by PadicHodgeTheory:R06.1:tate-sen (completed-cyclotomic descent with Banach coefficients)".
   c. In coverage[P8:local-rational].remaining, replace "Tate [19] for H^q_cont(Γ_k, Q_p(i)) and for the descent R(i) → R ⊗̂_k K(i)" with "Tate [19] for H^q_cont(Γ_k, Q_p(i)) and for the descent R(i) → R ⊗̂_k K(i) (owned by R06.1:tate-sen, RT-AREA-padic-2/20)".
5. The pending packet PadicHodgeTheory--P7 (for BP-PadicHodgeTheory--P7; the job's stage list gains R06.1:tate-sen).
   - Re-parent these nodes to R06.1:tate-sen, with ids PadicHodgeTheory:R06.1:tate-sen/<suffix>: R06.1/cp-integers-p-adically-complete, galois-action-on-cp, semilinear-galois-descent, ax-sen-lemma, ax-sen-tate-invariants, tate-trace-almost-surjective, tate-sen-axioms-cyclotomic, tate-sen-vanishing-on-hk and tate-sen-theorem, and P8:local-rational/tate-descent-for-completed-cyclotomic-tensor. Their prerequisites are Mathlib, each other, and the LocalFieldsRamification request.
   - Split parts (1)–(2) of R06.2/hodge-tate-decomposition-tate into a new node R06.1:tate-sen/tate-character-criterion. Parts (3)–(4), the Hodge–Tate decomposition, stay in R06.2 and cite it.
   - Widen K from "K/Q_p finite" to Brinon–Conrad p-adic fields where §14 allows.
   - Rewrite the restructure entry "R06.1 owns Ax–Sen–Tate, Tate's normalised traces and the Tate–Sen theorem; R06.2 owns Tate's C(ψ) theorems" to name R06.1:tate-sen as owner of both. The entry "Atlas sub-layers for R06.1" then starts its R06.1:de-rham block after these nodes.
6. research/blueprint/packets/FaltingsFinitenessAndIsogenyTheorems.json, requests[23]: replace the supplier "PadicHodgeTheory:R06.2" with "PadicHodgeTheory:R06.1:tate-sen". The need text already has the inertia hypothesis.
7. data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json, gap "Tate, p-divisible groups (Driebergen 1966) is absent from the supplied library". Replace "Theorem 2 (a character whose C-realization is C(+k) is chi_0^k up to finite order)" with "Theorem 2 (H^0 and H^1 of C(χ) vanish when the splitting field of χ contains an eventually totally ramified Z_p-extension; hence a character whose C-realization is C(+k) is chi_0^k times a character that is finite on inertia, owned by PadicHodgeTheory:R06.1:tate-sen; the global finite-order step is Faltings' own class-field argument)".

**Adjusted by the joint check (C1, C2).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- No owners entry: no stage text planned these statements before. The pending packet's node placement is corrected by edit 5.
- /5, in another section of this report, plans Tate's p-divisible-group theorems in R07.1–R07.2. It should import Tate's Theorem 2 from R06.1:tate-sen through an edge R06.1:tate-sen → R07.1 (or R07.2), which is acyclic, and not plan it again. It must not use R06.1 → R07.1, which is cyclic in the assembled graph.
- Items that plan these statements at R06.1 (for example PAPER-KEDLAYA-LIU-15/375 and PAPER-FARGUES-FONTAINE-18/882) stay correct, since the parent contains the sub-stage. They may be re-pointed to the sub-stage later.

## /21 (medium, duplicate): the θ-kernel theorem is P1's. R06.1 imports it and keeps only Scholze's uniform ξ and the filtration; the RF2 part is RT-AREA-padic-1/20

**The finding and the verdict.** The ring-level B_dR^+ theory is planned three times: in a PadicHodgeTheory:R06.1 node, in PerfectoidSpaces:P1 and in RelativeFarguesFontaine:RF2:untilts. The verifier "Confirmed the repeated primitive-kernel proof and missing fixed-Q_p reuse boundary, but reject[ed] the proposed blanket replacement of RF2 by Mathlib/R06.1". R06.1 should "import P1 and retain the uniform base-change/generator identification it actually needs (Sch13 Lemma 6.3 and Corollary 6.4)". The verifier adds that "one existing Mathlib carrier does not serve every untilt" and that "Graded pieces are I^m/I^(m+1), not globally free R(i) without the appropriate twist/trivialization". It also says "RS-20 remains needs_changes; its generic-divisor owner is not automatically a contradiction". The RF2 half is already RT-AREA-padic-1/20's. That fix makes R06.1 own B_dR^+(C) and its DVR theorem for complete algebraically closed C of mixed characteristic, adds R06.1 → RF2:untilts, and leaves RF2:untilts the equal-characteristic case and the O_E-relative comparison. What remains here is the θ-kernel re-proof, the graded-piece wording and the owners entry.

**Checked.**
- data/decompositions/PadicHodgeTheory.json, node R06.1/bdr-plus-of-perfectoid-affinoid-algebras. Its proofSteps[1] ("Nonzerodivisor: if ξy = 0 with y = Σ p^i [y_i] ≠ 0 …") and [2] ("Generation: for y ∈ ker θ, first reduce to y_0 ≠ 0 …") re-prove P1's theorem. So does hypotheses[2] ("The generation step uses W(R♭+)/(ξ, p) = R♭+/π = R^+/p …"). Each quote occurs once there and once in the packet's copy of the node.
- research/blueprint/packets/PerfectoidSpaces--P0.json (BP and REV done), node PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel. Part (b) says ker θ "is generated by a primitive element of degree 1 … ξ is a nonzerodivisor", and part (c) says "An element of ker θ generates ker θ iff it is primitive (BMS1 Remark 3.11)". Its "uses" already names R06.1/bdr-plus-of-perfectoid-affinoid-algebras. P1/distinguished-element-criterion (a): "every p + [ϖ♭]α … is a nonzerodivisor". The integrated PerfectoidSpaces decomposition's copy of the node lacks (c).
- ξ = [π] − Σ_{i≥1} p^i[x_i] with x_1 = u_0. Since u_0♯ ≡ u mod p and u ∈ (K^+)^×, x_1 is a unit. So u′ = Σ_{i≥1} p^{i−1}[x_i] is a unit and ξ = −u′(p + [π]α) with α = −u′^{−1}. Its image in W(R♭+) is primitive for every perfectoid affinoid (K, K^+)-algebra, because π is a pseudo-uniformizer of R♭.
- The accepted RS-05 keeps in P1 the "primitive theta-kernel theorem". The accepted RS-01 owner for R06.1 is "Rational period-ring constructions … reusing the existing BDeRhamPlus/BDeRham carriers". RS-20~3's review is pending.
- Mathlib 082e2d3, BDeRham.lean: BDeRhamPlus at :77 and BDeRham at :90. Its TODO reads "3. Show that ker θ is principal when the base ring is integral perfectoid", and the docstring says "if p = 0 in R, then this definition is the zero ring". FS Remark VI.2.1 (physical p. 194): "For this divisor, C♯ = C and B+dR(C♯) = WOE(C)".
- No stage-edge change: P1 → R06.1 exists, and R06.1 → RF2:untilts is 1/20's.

**Fix, as edits.**
1. R06.1, in content/campaign/PadicHodgeTheory/README.md and the R06.1 atlas description. After "this stage applies them and does not introduce a second A_inf/theta or PD-envelope carrier.", insert:
   "Import from PerfectoidSpaces P1 the surjectivity of θ: W(R^{♭+}) → R^+ for perfectoid (R, R^+), and the theorem that ker θ is generated by any primitive element and that such elements are nonzerodivisors. This is the primitive theta-kernel theorem that the accepted RS-05 keeps in P1; do not prove it again. Prove here only that Scholze's ξ for a perfectoid field (K, K^+) of characteristic 0 is a unit times p + [π]α, so that it generates ker θ for every perfectoid affinoid (K, K^+)-algebra (R, R^+) (Scholze 2013, Lemma 6.3). Then prove the filtration Fil^i = ξ^i B_dR^+(R, R^+) on Mathlib's BDeRhamPlus/BDeRham carriers, with gr^i = (ker θ)^i/(ker θ)^{i+1} free of rank one over R with basis ξ^i (Corollary 6.4). Identifying gr^i with R(i) needs t = log[ε] and p-power roots of unity in K."
   This composes with RT-AREA-padic-1/20 edit 1, which edits other sentences of the same paragraph.
2. data/decompositions/PadicHodgeTheory.json, node PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
   a. Replace proofSteps[1] (the whole entry beginning "Nonzerodivisor: if ξy = 0 with y = Σ p^i [y_i] ≠ 0") and proofSteps[2] (the whole entry beginning "Generation: for y ∈ ker θ, first reduce to y_0 ≠ 0") by one step:
      "Uniformity (imported, not re-proved): x_1 = u_0 is a unit of K♭+ because u_0♯ ≡ u mod p with u ∈ (K^+)^×. So u′ = Σ_{i≥1} p^{i−1}[x_i] is a unit of W(K♭+), and ξ = [π] − p·u′ = −u′(p + [π]α) with α = −u′^{−1}. π is a pseudo-uniformizer of R♭, so the image of ξ in W(R♭+) is primitive of degree one and lies in ker θ. By PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel (c) it generates ker θ, and by PerfectoidSpaces:P1/distinguished-element-criterion (a) it is a nonzerodivisor."
   b. Delete hypotheses[2] ("The generation step uses W(R♭+)/(ξ, p) = R♭+/π = R^+/p, …").
   c. In the link PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel → this node, replace "Supplies surjectivity of θ: W(R♭+) → R^+ for perfectoid Tate rings." with "Supplies surjectivity of θ: W(R♭+) → R^+ for perfectoid Tate rings, and (parts (b)–(c) of the reviewed PerfectoidSpaces--P0 node) generation of ker θ by any primitive element, which this node uses instead of re-proving the generation step of Lemma 6.3 (RT-AREA-padic-2/21)."
   d. Delete the link PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring → this node. Its reason cites only the deleted generation step.
   e. When the P0 packet's nodes are integrated, add the link PerfectoidSpaces:P1/distinguished-element-criterion → this node.
3. research/blueprint/packets/PadicHodgeTheory--P7.json (pending). Apply 2a and 2b to the packet's copy of the node, which has the same three quoted strings. Keep its prerequisite PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel.
4. Owners entry. Record it here. If it goes into a restructuring file, use RS-01.result.json, whose family contains PadicHodgeTheory; RS-01 is accepted, so this is a correction:
   {"target": "Surjectivity of Fontaine's θ: W(R♭+) → R^+ for perfectoid (R, R^+), generation of ker θ by any primitive (degree-one distinguished) element, and nonzerodivisibility of such elements", "owner": "PerfectoidSpaces:P1", "formerly": ["PadicHodgeTheory:R06.1"]}

**Not changed / open.**
- RF2:untilts is not narrowed further (the verifier's rejection). RF0's arbitrary E with ramified Witt coefficients, integral divisors, non-trivial graded line bundles and the characteristic-p divisor stay there, as in 1/20.
- RS-20's generic-divisor owner record stays. 1/20 edit 6 adds the B_dR^+(C) owner.
- /17 (AInfCohomology:AI.0), in another section of this report, should also import P1's theorem and specialize its ξ, as the /17 verdict says.

## /22 (medium, duplicate): modular-curve, Kuga–Sato and Shimura-curve applications move from R06.5 (and R06.6) to R19.5

**The finding and the verdict.** PadicHodgeTheory:R06.5 claims the p-adic Hodge applications to modular curves, Kuga–Sato varieties and Shimura curves. AutomorphicGaloisRepresentations:R19.5 plans the same statements, and R06.5 has none of those varieties upstream. The verifier "Confirmed the named-application ownership mismatch" and asks to "make the three named automorphic examples downstream applications under R19.5 and their actual geometric suppliers, with higher-rank applications under AG2.6". It adds: "Preserve admissibility, filtration, dual and Tate-twist compatibility targets; no mathematical work should disappear". The finding says "No new edge is needed". That is not quite right. The work being moved uses R06.6's abelian-variety results and R06.3's Weil–Deligne parameter, and neither reaches R19.5.

**Checked.**
- R06.5's text, quoted by the finding. R19.5's text and requires (R19.4, R18.5, R06.5). R06.6: "Supply the functorial p-adic local–global compatibility inputs used by R19.", with consumers R28.4 and R11.5 only.
- R06.5 reaches GeneralizedHeegnerCycles:GH.0 (R06.5 → R19.5 → R19.6 → R29.1–R29.4 → HE.1 → GH.0). AbelianSchemesAndArithmeticModuli:A3 is upstream of R06.5.
- The pending packet research/blueprint/packets/PadicHodgeTheory--R06.5.json (BP-PadicHodgeTheory--R06.5, pending) plans in R06.5/R06.6 the nodes R06.5/modular-form-de-rham-realisation, R06.5/modular-form-crystalline-good-primes, R06.5/weight-two-modular-abelian-varieties, R06.5/modular-form-endpoint-weights, R06.6/modular-form-local-global-compatibility-at-p and R06.6/hilbert-modular-form-compatibility-at-p. To support them it makes requests to R19.1, R19.4, GL2AutomorphicRepresentationsAndTransfer:R16.3, ModularCurvesPartII:R13.5, HilbertModularVarietiesAndShimuraCurves:R18.2, CP.4, R34.3, R07.4 and LocalGaloisDeformationRings:R08.5. Every one of those requests serves only these six nodes.
- The integrated data/decompositions/AutomorphicGaloisRepresentations.json already has R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime ("Saito's theorem: local-global compatibility at places above the coefficient characteristic"). R06.6/modular-form-local-global-compatibility-at-p therefore duplicates it at node level.
- The pending packet AutomorphicGaloisRepresentations.json has an R19.5 coverage note, "The coefficient-prime compatibility is imported from PadicHodgeTheory R06.5–R06.6 (Scholl, Saito), with the Barsotti–Tate, ordinary and Steinberg cases.", which occurs once.
- RS-12 is not accepted (REV-RS-12~3 pending). Its owner record "Classical/Hilbert coefficient-prime geometric comparisons, including source-scoped ordinary, Barsotti-Tate and endpoint cases" → R19.5 has formerly [AG2.6].
- Graph:
  - There is no path from R06.3 or R06.6 to R19.5, and no path back from R19.5, in any of the six graphs.
  - The node-level suppliers of the moved nodes are either already ancestors of R19.5 (R19.1, R19.4, R16.3, R18.2, CP.4, R34.3, R07.4, R06.4, and R13.5 with RS links) or acyclic new ones (R14.5, R14.6, R08.5, RD.7, R13.5 on stageEdges).
  - R19.5 goes from 336 to 342 ancestors.

**Fix, as edits.**
1. R06.5, in content/campaign/PadicHodgeTheory/README.md and the R06.5 atlas description. Replace "This stage owns their representation-theoretic applications to abelian varieties, modular curves, Kuga–Sato varieties and Shimura curves: identify the R06.2 period functors with geometric cohomology, prove admissibility and recover Hodge filtrations, weights, cohomological duals and Tate twists." with:
   "This stage owns their representation-theoretic applications to proper smooth and proper semistable varieties over p-adic fields and to abelian varieties: identify the R06.2 period functors with geometric cohomology, prove admissibility and recover Hodge filtrations, weights, cohomological duals and Tate twists. The same statements for the Galois representations in the cohomology of modular curves, Kuga–Sato varieties and Shimura curves are applications owned by AutomorphicGaloisRepresentations R19.5, which imports this stage and has the geometry of those varieties upstream. The higher-rank cases are AutomorphicGaloisRepresentationsPartII AG2.6's."
2. R19.5, in content/campaign/AutomorphicGaloisRepresentations/README.md and the R19.5 atlas description.
   a. After "Use R06 and the geometry to prove the de Rham/crystalline/potentially semistable statements, Hodge weights and inertial-type comparisons available for these representations.", insert:
      "This stage owns the p-adic Hodge theory of the Galois representations in the cohomology of modular curves, Kuga–Sato varieties and Shimura curves. Apply PadicHodgeTheory R06.5's comparison for proper smooth and proper semistable varieties to them, and prove admissibility, Hodge filtrations and Hodge–Tate weights, cohomological duals and Tate twists. Also prove crystallinity at primes not dividing the level with the Frobenius polynomial, the weight-two semistable case through Deligne–Rapoport models, the endpoint weights, and T. Saito's compatibility at p with local Langlands. Import the abelian-variety and Tate-curve results of R06.6 and the Weil–Deligne parameter at p of R06.3."
   b. Replace "[PadicHodgeTheory R06.5](../PadicHodgeTheory/README.md#r06-5)." (the end of its Dependencies line) with "[PadicHodgeTheory R06.5](../PadicHodgeTheory/README.md#r06-5); [PadicHodgeTheory R06.3](../PadicHodgeTheory/README.md#r06-3); [PadicHodgeTheory R06.6](../PadicHodgeTheory/README.md#r06-6)."
3. R06.6, in the PadicHodgeTheory README and the R06.6 atlas description. Replace "Supply the functorial p-adic local–global compatibility inputs used by R19." with "Supply the functorial p-adic local–global compatibility inputs used by AutomorphicGaloisRepresentations R19.5: the abelian-variety, Tate-curve and semistable-reduction statements above. The compatibility at p for modular and Hilbert modular forms (Scholl, T. Saito) is R19.5's, not this stage's."
4. data/atlas.json stageEdges. Add PadicHodgeTheory:R06.6 → AutomorphicGaloisRepresentations:R19.5 and PadicHodgeTheory:R06.3 → AutomorphicGaloisRepresentations:R19.5, and add both to R19.5's requires.
5. The pending packet PadicHodgeTheory--R06.5 (for BP-PadicHodgeTheory--R06.5).
   - Remove the six nodes listed under Checked, and the nine requests that only they use.
   - Hand the nodes, with their statements, sources and source issues, to BP-AutomorphicGaloisRepresentations as R19.5 nodes. Merge R06.6/modular-form-local-global-compatibility-at-p with the existing node R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime.
   - Rewrite the coverage notes of R06.5 and R06.6 to drop the modular-form items. The gap "Scholl's Kuga–Sato motives not read" goes with the nodes.
6. The pending packet research/blueprint/packets/AutomorphicGaloisRepresentations.json. In coverage of R19.5, replace "The coefficient-prime compatibility is imported from PadicHodgeTheory R06.5–R06.6 (Scholl, Saito), with the Barsotti–Tate, ordinary and Steinberg cases." with "The coefficient-prime compatibility for modular and Hilbert modular forms (Scholl, Saito), with the Barsotti–Tate, ordinary, Steinberg and endpoint cases, is planned here (moved from the PadicHodgeTheory R06.5 packet by RT-AREA-padic-2/22), on R06.5's general comparison, R06.6's abelian-variety results and R06.3's Weil–Deligne parameter."
7. Owners entry. In RS-12.result.json (under revision), in the record whose owner is AutomorphicGaloisRepresentations:R19.5, add "PadicHodgeTheory:R06.5" and "PadicHodgeTheory:R06.6" to formerly. Append to its target: "; the p-adic Hodge properties of the representations in the cohomology of modular curves, Kuga–Sato varieties and Shimura curves, with T. Saito's compatibility at p".

**Not changed / open.**
- AutomorphicGaloisRepresentationsPartII:AG2.6 needs no edit. Its text already applies "the actual crystalline/semistable/log-crystalline comparison of PadicHodgeTheory to the geometric construction".
- R34.3 → R06.5 stays for R06.5's general semistable branch.
- The moved nodes will create node-level edges into R19.5 from R14.5, R14.6, R08.5 and RD.7 when the R19.5 blueprint writes them. All are acyclic.

## /23 (medium, missing): CP.4–CP.6 suppliers, with first Chern classes owned by PR.4

**The finding and the verdict.** Three CohomologyComparisons stages name suppliers that are not upstream:
- CP.4 names PR.8's log-prismatic maps;
- CP.5 names R07's objects and the R06.4 interface;
- CP.6 compares Chern classes whose constructions are not upstream, and "returns" consequences to PadicHodgeTheory:R06.6 without an edge.

The verifier confirmed: "Add PR.8 → CP.4; R06.4 → CP.5 supplies the already imported R07.3 as well (a direct R07.3 edge may document that theorem); add PR.4 and EDC.3 → CP.6, then CP.6 → R06.6". It also asks to "Assign the source-qualified prismatic/syntomic/crystalline first-Chern constructions once, e.g. PR.4 with its crystalline inputs", and to "retain the BL §9 splitting/projective-bundle work and its proper scope as explicit targets". It notes that "EDC.3's scheme-theoretic classes require the appropriate formal/adic comparison before use on generic fibres".

**Checked.**
- CP.4, CP.5 and CP.6 texts and requires, as the finding quotes them. PrismaticCohomology:PR.8 has consumers []. R06.4 requires R07.3, R07.4 and R06.2. RS-01's CP.5 keeps include "the R06.4 interface".
- No stage text owns a crystalline, prismatic or syntomic Chern class. The only Chern texts are CP.6, EtaleDualityAndPerverseSheaves:EDC.3 ("Construct Chern classes, the projective-bundle relation and the cycle class … over a perfect field k") and PR.4 ("arithmetic Chern/regulator consumers").
- Bhatt–Lurie (arXiv v1):
  - §7.3, Construction 7.3.1, p. 175: the crystalline first Chern class of an F_p-scheme, via RΓcrys(X/Zp) and Fil^1_N.
  - Theorem 7.5.6, p. 184: RΓét(Spec R, Gm)^∧[−1] → RΓsyn(Spf R, Zp(1)) "is an isomorphism".
  - §7.6, p. 185: the de Rham specialization.
  - Construction 8.2.5, p. 192: "The Étale First Chern Class".
  - Theorem 9.1.1, p. 209: the projective bundle formula for "a scheme, formal scheme, or algebraic stack".
  - Construction 9.2.1, p. 213: higher Chern classes.
- PR.4 already has CrystallineCohomology:CR.0, CR.1 and CR.2 upstream.
- Graph:
  - There is no path PR.8 → CP.4, R07.3 → CP.5, R06.4 → CP.5, PR.4 → CP.6, EDC.3 → CP.6 or CP.6 → R06.6 in any of the six graphs.
  - All five edges are acyclic alone and jointly, including with /46's AI.6 → PR.8, /13's CP.3 → AI.6 and /28's PR.5 → PR.4.
  - CP.6 goes from 97 to 128 ancestors. R06.6 goes from 128 to 140, gaining CP.1, CP.5, CP.6, CR.3:duality, PR.4 and PR.6 and their inputs.

**Fix, as edits.**
1. data/atlas.json stageEdges. Add:
   - PrismaticCohomology:PR.8 → CohomologyComparisons:CP.4;
   - PadicHodgeTheory:R06.4 → CohomologyComparisons:CP.5;
   - PrismaticCohomology:PR.4 → CohomologyComparisons:CP.6;
   - EtaleDualityAndPerverseSheaves:EDC.3 → CohomologyComparisons:CP.6;
   - CohomologyComparisons:CP.6 → PadicHodgeTheory:R06.6.
   Update the requires of CP.4, CP.5, CP.6 and R06.6 to match.
2. CP.5, in content/campaign/CohomologyComparisons/README.md and the CP.5 atlas description. Replace
   ```
   For the small-weight Fontaine–Laffaille/Breuil–Kisin regimes compare with
   R07's classified integral objects and prove the normalization agreement.
   ```
   with
   ```
   For the small-weight Fontaine–Laffaille/Breuil–Kisin regimes compare with
   R07's classified integral objects through PadicHodgeTheory R06.4's
   small-weight interface (which imports R07.3–R07.4) and prove the
   normalization agreement.
   ```
3. CP.6, in the same README and the CP.6 atlas description. Replace
   ```
   Compare first Chern classes of line bundles under
   the étale Kummer, de Rham dlog, crystalline PD and prismatic logarithm
   maps, including twists; extend higher classes/projective bundle formulas
   through the source's actual splitting construction.
   ```
   with
   ```
   Compare first Chern classes of line bundles under
   the étale Kummer, de Rham dlog, crystalline PD and prismatic logarithm
   maps, including twists. Import the constructions and do not build them
   again: the prismatic, crystalline, syntomic and étale first Chern classes
   from PrismaticCohomology PR.4 (Bhatt–Lurie §§7.1–7.6, 8.2), and the étale
   Chern classes, projective-bundle relation and cycle class of smooth
   varieties over a perfect field from EtaleDualityAndPerverseSheaves EDC.3,
   after the formal/adic comparison needed to use them on generic fibres.
   Extend to higher classes and projective bundle formulas through the
   source's actual splitting construction. The syntomic projective bundle
   formula and higher Chern classes (Bhatt–Lurie Theorem 9.1.1 and
   Construction 9.2.1, for schemes, formal schemes and algebraic stacks) are
   explicit targets here.
   ```
4. PR.4, in content/campaign/PrismaticCohomology/README.md and the PR.4 atlas description. After "The syntomic realization is shared with RT's TC graded pieces and with arithmetic Chern/regulator consumers." (wrapped over l. 149–150), insert:
   ```
   Construct the first Chern classes of line bundles of Bhatt–Lurie §7:
   the prismatic logarithm and G_m-coefficient class (§§7.1–7.2), the
   crystalline first Chern class of an F_p-scheme (Construction 7.3.1, on
   CrystallineCohomology's crystalline complex and its Nygaard piece), the
   syntomic first Chern class with RΓ_ét(Spec R, G_m)^∧[−1] ≃
   RΓ_syn(Spf R, Z_p(1)) for p-complete animated R (Theorem 7.5.6), its
   de Rham specialization (§7.6) and the étale first Chern class
   (Construction 8.2.5). This stage is their one owner; CohomologyComparisons
   CP.6 only compares them.
   ```

**Adjusted by the joint check (C6, C7).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- R07.3 → CP.5 is not added. R07.3 reaches CP.5 through R06.4 (R07.3 → R06.4 → CP.5). The direct edge is acyclic, if the maintainer wants it for documentation.
- CP.6's text also returns consequences to "R07 and AutomorphicGaloisRepresentationsPartII". The finding asks for no edge there and the text names no stage, so none is added.
- The syntomic class (BL Construction 7.4.1) uses the absolute Nygaard filtration. /28's PR.5 → PR.4 supplies it.

## /24 (medium, missing): no stage plans the arc_p-topology that PR.4's proof needs

**The finding and the verdict.** The proofs of BS22 Theorems 9.1 and 9.4, planned at PrismaticCohomology:PR.4, need three things: the arc_p-topology, Bhatt–Mathew Corollary 6.17, and the arc-descent of perfectoidization (BS22 §8.2). No stage plans any of them. The verifier confirmed "the absent arc_t supplier". It said "a routing proposal is not a live prerequisite", asked for explicit requests, and noted "Future edges require validation when the actual supplier stages exist". Two parts of the finding and of the verdict are superseded on main:
- The finding's "PR.2 keeps BS22 Proposition 8.10 and Corollaries 8.11–8.12 as its own nodes", with an arc edge into PR.2.
- The verifier's "PR.2 retains the BS22 §8.2 perfectoidization/descent application".

The accepted BS22 routes 2 and 3 now give §8.2 to ArcTopologyAndDescent and to the Part II of PerfectoidQuotients. An arc edge into PR.2 would close a cycle. The owners change, but the verifier's intent stands: PR.4 imports the material.

**Checked.**
- A search of every stage description in `data/atlas.json` for arc-topology, arc-descent, arc-sheaf, arc_p, arc_t and Bhatt–Mathew finds no stage that plans the arc-topology. The only hits are unrelated uses of "arc", such as "major-arc".
- PR.4 requires only Q4 and PR.3.
- PR.2 ends "Sources: BS22 §§7–8 and BMS2 §4."
- BS22 TeX:
  - The §8.2 footnote: "Getting similar results for the slightly weaker v-topology would be enough for the applications below, and could avoid reference to [BhattMathew]."
  - Definition 8.7, "The arc-topology of p-adic formal schemes".
  - Remark 8.9: covers by "a product of p-complete rank 1 valuation rings with algebraically closed fraction field".
  - Corollary 8.11: "S_perfd = RΓ_arc(Spf S, O)".
  - Theorem 9.4's proof works "p-complete arc-locally".
- Accepted BS22 routes, from the extraction and its review:
  - Route 2, a new route to ArcTopologyAndDescent, carries items /49, /50, /112 and /113: Definition 8.7, Lemma 8.8–Proposition 8.10, the Bhatt–Mathew inputs and Huber's comparison. Its reason says "Putting the arc statements in PR.2 would also close a cycle: the Bhatt–Mathew brief imports GeometricSatakeAndFusion GS0:Witt-geometry, which is downstream of PR.2". Its brief lists "Consumers: PR.4 (Theorem 9.1)".
  - Route 3, a Part II of PerfectoidQuotients, carries /47, /51 and /52: Proposition 8.5 and Corollaries 8.11–8.12. Its brief says "Export to PrismaticCohomology PR.4 (Theorem 9.1 needs Corollary 8.11 …)".
- `research/blueprint/make_queue.py` `paper_designs` merges every "new" route with the same roadmap id into one job. DESIGN-ArcTopologyAndDescent and DESIGN-PerfectoidQuotientsPartII are both pending in queue.json.
- The cycle. The path PR.2 → Q2 → Q4 → AdicEtaleGeometry:A3 → RF0:integral-Y → GS0:loop-geometry → GS0:Witt-geometry exists on base, RS and full. So "arc → PR.2", with the arc brief's GS0:Witt-geometry import, is cyclic on all three. It becomes acyclic only once RT-AREA-padic-1/6 deletes Q4 → A3.
- Acyclicity of the arc edge into PR.4. I modelled the arc roadmap as one placeholder node with RT-AREA-padic-1/1's import list (SF.0–SF.2, EDC.0, EDC.4, E2, D0, LD.0, K.5, K.6, A0, A1, GS0:Witt-geometry, Q0, Q0:integral-algebra, PR.0, P1). "Arc placeholder → PR.4" is acyclic on base, RS and full, and in the joint check. PR.4 reaches no arc import.

**Fix, as edits.**
1. PR.4 text. The import sentence of /6 edit 1 names ArcTopologyAndDescent and the Part II of PerfectoidQuotients; nothing more is needed here.
2. README §PR.2 and the atlas description of PrismaticCohomology:PR.2. Replace
   `Sources: BS22 §§7–8 and BMS2 §4.`
   with
   ```text
   Sources: BS22 §7 and, from §8, Definition 8.2, Example 8.3, Lemmas 8.4 and 8.6,
   Proposition 8.13 and Corollary 8.14; BMS2 §4. Proposition 8.5 and Corollaries
   8.11–8.12 belong to the Part II of PerfectoidQuotients, and Definition 8.7 to
   Proposition 8.10 to ArcTopologyAndDescent (BS22 routes 2 and 3). PR.2 has no
   arc input.
   ```
3. Requests entries for the PR.4 packet. Until that packet exists, the maintainer can enter them as gaps of PR.4 in `data/decompositions/PrismaticCohomology.json`.
   ```json
   [{"supplier": "ArcTopologyAndDescent:<the stage that owns Bhatt–Mathew Corollary 6.17>", "need": "The arc_p-topology on p-complete rings (Bhatt–Mathew Definition 6.14) and arc_p-equivalences (Definition 6.19); arc_p-descent for S ↦ RΓ(Spec(S[1/p]), G), G a torsion étale sheaf (Corollary 6.17); BS22 Definition 8.7, Lemma 8.8, Remark 8.9 (arc-covers by products of p-complete rank-1 valuation rings with algebraically closed fraction field) and Proposition 8.10; and, for perfectoid S, the comparison of the étale cohomology of Spec(S[1/p]) and Spa(S[1/p],S) (BS22 item /113).", "neededBy": ["PrismaticCohomology:PR.4/etale-comparison"]},
    {"supplier": "PerfectoidQuotientsPartII:<the stage that owns BS22 Corollary 8.11>", "need": "S_perfd = RΓ_arc(Spf S, O) for every p-complete ring S, so S ↦ S_perfd and S ↦ Δ_{S/A,perf} are arc-sheaves (BS22 Corollary 8.11).", "neededBy": ["PrismaticCohomology:PR.4/etale-comparison"]}]
   ```
4. Future stage edges, added when the designs exist:
   - from the ArcTopologyAndDescent stage that owns Corollary 6.17 to PrismaticCohomology:PR.4;
   - from the PerfectoidQuotientsPartII stage that owns Corollary 8.11 to PrismaticCohomology:PR.4, next to RT-AREA-padic-1/1's edge from its Theorem 10.11 stage.
   
   Both are acyclic under the placeholder model above. They must be re-checked against the actual designs. BS22 routes 2 and 3 already name PR.4 as a consumer, so no brief changes.

**Not changed / open.**
- No arc edge into PR.2, and no PR.2 nodes for Proposition 8.10 or Corollaries 8.11–8.12. On main these have other owners. PR.2's own §8 items (Lemmas 8.4 and 8.6, Proposition 8.13, Corollary 8.14) use only derived prismatic cohomology, according to the BS22 review.
- As the verifier asks, the perfectoid-space v-topology of DiamondsAndVStacks D2 is not substituted.

## /25 (medium, error): PR.4 has no supplier of étale cohomology of schemes or of adic spaces

**The finding and the verdict.** PrismaticCohomology:PR.4 compares prismatic cohomology with étale cohomology of the generic fibre. No prerequisite of PR.4, direct or transitive, supplies étale cohomology of schemes or of adic spaces (SchemeAndStackFoundations:SF.2, ClassicalAdicEtaleCohomology:H0, ClassicalAdicEtaleCohomology:H1:henselian). The verifier confirmed this and said: "Add SF.2 and H0 as cohomology suppliers for PR.4, and H1:henselian for the selected Huber Spec/Spa route". It added "H1 is a proof-route choice", "The source comparison is cohomological", and "Passing to Z_p requires the derived inverse limit separately".

I add all three edges. But H1:henselian's draft packet plans Huber's Spec/Spa comparison only under Huber's noetherian standing condition. So it cannot supply BS22's perfectoid step. That step is BS22 item /113, which the accepted BS22 route 2 already gives to ArcTopologyAndDescent. H1:henselian does supply a second input the finding did not name: Gabber's affine analogue of proper base change, which Theorem 9.4 uses for n = 0.

**Checked.**
- Stage texts:
  - AdicEtaleGeometry:A1: "These are geometric sites, not definitions of derived cohomology."
  - SF.2: "Own Zariski, etale, fppf and pro-etale site comparisons …; construct sheaf cohomology". Its acceptance clause asks to "Specify torsion order invertible on the base where required"; p is invertible on Spec(S[1/p]).
  - H0: "construct module sheaves on analytic adic étale sites, … derived global sections and direct image".
  - H1:henselian: "prove Hub96 §§3.1–3.4's cohomology comparisons".
  - H1:formal-adic-comparison: "For a formal scheme of type (S) in Hub96 §1.9, construct the specialization morphism".
- Paths. On base and RS there is no path from SF.2, H0, H1:henselian or DiamondEtaleCohomology:C0 to PR.4. On the full graph, SF.2 reaches PR.4 through AdicSpacesPartII:F0 → R2 → R3 → PerfectoidSpaces:P4 → Q4. That is a geometric path, not a cohomology import. H0, H1:henselian and C0 do not reach PR.4 on the full graph either.
- BS22 TeX:
  - The proof of 9.1: "This follows from the comparison between the étale cohomology of Spec(S[1/p]) and Spa(S[1/p],S) (and similarly for S^♭), cf. [HuberBook, Corollary 3.2.2], and [ScholzeThesis, Theorem 1.11]". It is applied to perfectoid S.
  - The proof of 9.4 for n = 0 uses "Gabber's affine analog of proper base change to pass from R to R/p".
  - Bhatt–Lurie Construction 8.4.1 uses RΓ_ét(Spec(R[1/p]), Z_p(n)).
- `research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json` is a draft; REV-ClassicalAdicEtaleCohomology--H0 is pending.
  - Node H1:henselian/complete-affinoid-comparison-3-2-2 (Hub96 Corollary 3.2.2) assumes "Huber's standing condition: the completion Â has a noetherian ring of definition or is a strongly noetherian Tate ring". So does 3.2.1.
  - Node H1:henselian/affine-henselian-comparison-3-2-5 (Hub96 Lemma 3.2.5, Gabber) states "No noetherian hypothesis".
  - A perfectoid Tate ring S[1/p] is not strongly noetherian in general.
- BS22 item /113 ("Étale cohomology of Spec S[1/p] and of Spa(S[1/p], S)") is in route 2, to ArcTopologyAndDescent. The GUO-REINECKE-24 route 3 brief asks the same roadmap for "the comparison of étale cohomology of Spec S[1/p] and Spa S[1/p] for perfectoid S (Scholze)".
- Acyclicity. The three edges are acyclic on base, RS and full, and jointly. They add these ancestors to PR.4 on base:
  - SF.2: SF.0–SF.2 and LI.0, LI.1, LI.3 (plus two Tau Ceti layers on RS);
  - H0: A2, H0 and UPSTREAM:ECD:SCH_BC;
  - H1:henselian: also L2, H1:henselian and UPSTREAM:ECD:SCH_SUPPORT_NOETH.
- An arc placeholder that also imports H1:henselian stays acyclic on all three graphs.

**Fix, as edits.**
1. stageEdges: add SchemeAndStackFoundations:SF.2 → PrismaticCohomology:PR.4, ClassicalAdicEtaleCohomology:H0 → PrismaticCohomology:PR.4 and ClassicalAdicEtaleCohomology:H1:henselian → PrismaticCohomology:PR.4. Add the three to PR.4's `requires` and PR.4 to their `consumers`.
2. README §PR.4 and the atlas description. Insert a new paragraph after the paragraph that /6 edit 1 creates:
   ```text
   Import étale cohomology of schemes with Z/p^n coefficients from
   SchemeAndStackFoundations SF.2, and étale sites, cohomology and direct images
   of adic spaces from ClassicalAdicEtaleCohomology H0. From H1:henselian import
   Gabber's affine analogue of proper base change for henselian pairs (Hub96
   Lemma 3.2.5), which BS22 Theorem 9.4 uses for n = 0, and Huber's comparison of
   Spec and Spa (Hub96 Corollaries 3.2.2–3.2.3). H1:henselian plans the latter
   only under Huber's noetherian standing condition. That covers algebras
   topologically of finite type over a perfectoid field, such as the formal torus
   over O_C, but not a general perfectoid S. For those, use the
   ArcTopologyAndDescent comparison or the valuation-ring route above. Construct
   the nearby-cycles morphism μ for arbitrary p-adic formal schemes here;
   H1:formal-adic-comparison's specialization morphism covers only formal schemes
   of type (S). These comparisons are cohomological, not equivalences of the
   algebraic and analytic étale sites.
   ```
3. PAPER-BHATT-SCHOLZE-22.result.json, route 2 brief. After
   `and Huber's comparison of the étale cohomology of Spec S[1/p] and Spa(S[1/p], S) (item 113, already in the accepted PAPER-GUO-REINECKE-24 route 3 brief).`
   insert
   ```text
    ClassicalAdicEtaleCohomology H1:henselian plans Hub96 §3.2 (Corollary 3.2.2 and Gabber's Lemma 3.2.5) under Huber's noetherian standing condition; prove item 113 for perfectoid and general p-complete S here, and import the noetherian case and Lemma 3.2.5 from H1:henselian rather than planning them again.
   ```
   The sentence changes no route and no items. It is a brief refinement for the maintainer or the arc design job.

**Not changed / open.**
- I could not read Huber's book. If the proof of Hub96 3.2.1–3.2.2 works without the standing condition, H1:henselian could drop it for those nodes. The arc design would then import the general form. That decision belongs to the H0 packet's review.
- The nearby-cycle form also needs the étale site of a possibly non-sheafy generic fibre. A1 plans "generalized adic-space presentations" for ECD §15. Whether that suffices for PR.4 is left to the PR.4 blueprint.

## /26 (medium, error): PR.1's Hodge–Tate comparison needs DD.3's Cartier isomorphism

**The finding and the verdict.** BS22 Theorem 6.3, the Hodge–Tate comparison, reduces to the characteristic-p case, Corollary 5.5. That corollary is proved from the crystalline comparison and the Cartier isomorphism for polynomial F_p-algebras. DerivedDeRhamCohomology:DD.3 plans that isomorphism, but PrismaticCohomology:PR.1 does not reach DD.3. The verifier confirmed: "Add DD.3 → PR.1 and attach its theorem-level link to the characteristic-p comparison. Preserve the Frobenius twist, multiplicative comparison and Bockstein differential."

**Checked.**
- PR.1 requires CR.2, EnhancedDerivedSheaves:E2 and PR.0.
- DD.3 requires only DD.2. Its consumers are DD.4 and DD.6.
- There is no path DD.3 → PR.1 on base, RS or full.
- Node DerivedDeRhamCohomology:DD.3/polynomial-cartier-map in `data/decompositions/DerivedDeRhamCohomology.json`: "For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A))".
- BS22 TeX:
  - Proof of Corollary 5.5: "Then S=R^(1) for the F_p-algebra R=F_p[X_1,…,X_n], and the result follows from Theorem 5.2 and the Cartier isomorphism."
  - Proposition 6.2: "our claim now reduces to the Hodge-Tate comparison for Δ̄_{F_p[X]/Z_p}, which was already explained earlier (Corollary 5.5)".
  - Theorem 6.3 reduces to Proposition 6.2.
  - The proof of Theorem 15.3 (PR.3) ends "Now it follows from Theorem 5.2 and the Cartier isomorphism." PR.3 reaches DD.3 through PR.1 → PR.2 → PR.3 once the edge exists.
- The BS22 extraction already records the dependency:
  - Item /34 (Corollary 5.5) is planned at PR.1, with the note "The proof uses the Cartier isomorphism for polynomial F_p-algebras (item 101)".
  - Item /101 is planned at DD.3, with the locator "Used in Corollary 5.5, p. 49, and in the proof of Theorem 15.3, p. 104".
- Acyclicity. The edge is acyclic on base, RS and full, and jointly. It adds DD.2 and DD.3 to PR.1's ancestors (23 → 25 on base).

**Fix, as edits.**
1. stageEdges: add DerivedDeRhamCohomology:DD.3 → PrismaticCohomology:PR.1. Add DD.3 to PR.1's `requires` and PR.1 to DD.3's `consumers`.
2. README §PR.1 and the atlas description. After
   `Prove the Hodge–Tate comparison on affines: H^i(Δ tensor^L_A A/I) is Ω^i with twist (I/I²)^(-i).`
   insert
   ```text
   First prove it over crystalline prisms (A,(p)) (BS22 Corollary 5.5): localise
   to A/p[X_1,…,X_n], reduce to A = Z_p, write S = R^(1) for R = F_p[X_1,…,X_n],
   and combine the crystalline comparison with the Cartier isomorphism for
   polynomial F_p-algebras imported from DD.3 (node DD.3/polynomial-cartier-map).
   Then reduce the general case to it through the universal oriented prism and
   its map to a crystalline prism (BS22 Construction 6.1, Proposition 6.2,
   Theorem 6.3).
   ```
3. The Sources sentence of PR.1 is changed jointly with /27; see /27 edit 2.
4. Node for the PR.1 blueprint. The PR.1 coverage entry still lists "Read the crystalline, Hodge–Tate and de Rham comparisons in §§5–6".
   ```json
   {"id": "PrismaticCohomology:PR.1/hodge-tate-comparison-char-p", "parentStageId": "PrismaticCohomology:PR.1", "realises": ["PrismaticCohomology:PR.1"], "title": "The Hodge–Tate comparison over crystalline prisms", "kind": "theorem",
    "statement": "Let (A,(p)) be a crystalline prism. For every smooth A/p-algebra S the Hodge–Tate comparison map gives isomorphisms H^i(Δ̄_{S/A}) ≅ Ω^i_{S/(A/p)}{−i}, multiplicatively and with the Bockstein differential. In particular S ↦ Δ_{S/A} commutes with arbitrary p-complete base change of (A,(p)).",
    "proofSteps": ["Étale localisation (BS22 Lemma 4.21) reduces to S = A/p[X_1,…,X_n]; base change (Lemma 4.20) reduces to A = Z_p.", "S = R^(1) for R = F_p[X_1,…,X_n]; the crystalline comparison (Theorem 5.2) identifies Δ_{S/Z_p} with RΓ_crys(R/Z_p).", "The Cartier isomorphism for R identifies the cohomology of the reduction with Ω^i_{R^(1)}, keeping the Frobenius twist."],
    "prerequisites": ["DerivedDeRhamCohomology:DD.3/polynomial-cartier-map", "CrystallineCohomology:CR.2", "PrismaticCohomology:PR.1/prismatic-structure-sheaf"],
    "sources": [{"sourceId": "bs-prisms-2022", "locator": "Corollary 5.5 and proof, p. 49", "excerpt": "and the result follows from Theorem 5.2 and the Cartier isomorphism", "match": "The proof step that needs DD.3."}], "implementationStatus": "unchecked"}
   ```

**Not changed / open.**
- The general Hodge–Tate comparison (Theorem 6.3) and its twist conventions keep PR.1's current wording.

## /27 (medium, error): PR.1 states the de Rham comparison without Theorem 6.4's hypothesis

**The finding and the verdict.** PrismaticCohomology:PR.1 plans the de Rham comparison unconditionally and cites BS22 Theorem 6.4. But Theorem 6.4 assumes that W(A/I) is p-torsion-free. The general Corollary 15.4 is deduced from the Lη_I factorisation of Theorem 15.3, which PrismaticCohomology:PR.3 owns. The verifier confirmed a "proof-order/source-scope error". Its instructions: "PR.1 should state the early conditional theorem; PR.3 owns the general bounded-prism/smooth-formal theorem and Corollary 15.5. Do not add PR.3 → PR.1".

**Checked.**
- PR.1 text: "Prove the de Rham comparison after phi_A-twisted reduction, with its completed tensor and differential". Its sources are "Theorems 5.2,6.3,6.4 and Corollary 4.12".
- PR.3 text: "the Lη_I Frobenius factorization in BS22 §15". PR.1 → PR.2 → PR.3, so PR.3 → PR.1 would close a cycle.
- BS22 TeX:
  - Before Theorem 6.4: "at least under the technical assumption that W(A/I) is p-torsion free. This is satisfied, for example, if A/I is p-torsion free or if I=(p) and A/p is reduced. This technical assumption will be removed later".
  - Theorem 6.4: "Let X be a smooth formal A/I-scheme and assume that W(A/I) is p-torsion free".
  - Corollary 15.4's proof: "Take the reduction of φ̃ modulo I and use [BMS1, Proposition 6.12] and the Hodge-Tate comparison."
  - Theorem 1.8(3): "Moreover, it can be upgraded naturally to an isomorphism of commutative differential graded algebras."
- BS22 extraction:
  - Item /37 (Theorem 6.4) is planned at PR.1. Its note says the cdga upgrade "follows by reducing the map φ̃ of Theorem 15.3 modulo I ([BMS1, Prop. 6.12]) and applying Theorem 4.11". So the differential of the upgrade also comes from §15.
  - Item /37b (Corollary 15.4) is planned at ["PrismaticCohomology:PR.1", "PrismaticCohomology:PR.3"].
  - Item /75 (Corollary 15.5) is planned at PR.3.
  - Source issues E1 (Corollary 15.4 prints Ω^*_{R/(A/I)}), E14 (the proof of 6.4 prints FVW(R) = (p)) and E25 (Corollary 15.5's V_i) are recorded.
- No stage edge changes.

**Fix, as edits.**
1. README §PR.1 and the atlas description. Replace
   `Prove the de Rham comparison after phi_A-twisted reduction, with its completed tensor and differential; it is not the same as an untwisted Hodge–Tate direct sum.`
   with
   ```text
   Prove the de Rham comparison Δ_{X/A} ⊗̂^L_{A,phi_A} A/I ≃ Ω^*_{X/(A/I)}, with
   p-adic completion, as commutative algebras in D(X_ét, A/I), under BS22
   Theorem 6.4's hypothesis that W(A/I) is p-torsion-free (for example A/I
   p-torsion-free, or I = (p) with A/p reduced). The proof passes through the
   prism map (A,I) → (W(A/I),(p)) and the crystalline comparison. It is not the
   same as an untwisted Hodge–Tate direct sum. The statement without the
   hypothesis on W(A/I), and the upgrade to commutative differential graded
   algebras, are PR.3's (BS22 Corollary 15.4).
   ```
2. The Sources sentence of PR.1, joint with /26. Replace
   `Sources: BS22 §§4–6, Theorems 5.2,6.3,6.4 and Corollary 4.12.`
   with
   ```text
   Sources: BS22 §§4–6: Theorems 5.2, 6.3 and 6.4 (with its hypothesis on
   W(A/I)), Corollaries 4.12 and 5.5, Construction 6.1 and Proposition 6.2; the
   Cartier isomorphism for polynomial F_p-algebras is imported from DD.3.
   ```
3. README §PR.3 and the atlas description. After
   `Prove the associated-graded description, comparison with Hodge–Tate and de Rham filtrations, and the Lη_I Frobenius factorization in BS22 §15.`
   insert
   ```text
   Deduce from the factorization φ̃: Δ^(1)_{X/A} ≃ Lη_I Δ_{X/A} (Theorem 15.3):
   the de Rham comparison for every bounded prism and smooth formal A/I-scheme,
   without PR.1's hypothesis on W(A/I), as an isomorphism of E_∞-algebras
   Δ_{X/A} ⊗̂^L_{A,phi} A/I ≃ Ω^*_{X/(A/I)} (Corollary 15.4, by reducing φ̃ modulo
   I with BMS1 Proposition 6.12 and PR.1's Hodge–Tate comparison); its upgrade
   to commutative differential graded algebras asserted in Theorem 1.8(3); and
   the image of Frobenius with the maps V_i (Corollary 15.5, Theorem 1.8(6)).
   ```
4. PAPER-BHATT-SCHOLZE-22.result.json, item /37b:
   - Change `"planned"` from `["PrismaticCohomology:PR.1", "PrismaticCohomology:PR.3"]` to `["PrismaticCohomology:PR.3"]`.
   - Append to its note: " Fix of RT-AREA-padic-2/27: the general statement is PR.3's; PR.1 plans only Theorem 6.4 (item 37)."
5. Node for the PR.3 blueprint:
   ```json
   {"id": "PrismaticCohomology:PR.3/de-rham-comparison-general", "parentStageId": "PrismaticCohomology:PR.3", "realises": ["PrismaticCohomology:PR.3"], "title": "The de Rham comparison for every bounded prism", "kind": "comparison",
    "statement": "For any bounded prism (A,I) and any smooth formal A/I-scheme X there is a canonical isomorphism of E_∞-algebras Δ_{X/A} ⊗̂^L_{A,φ} A/I ≅ Ω^*_{X/(A/I)} in D(X_ét, A/I), which upgrades to an isomorphism of commutative differential graded algebras.",
    "proofSteps": ["Reduce φ̃: Δ^(1)_{X/A} ≃ Lη_I Δ_{X/A} (Theorem 15.3) modulo I.", "Identify (Lη_I M)/I with the Bockstein complex of H^*(M/I) (BMS1 Proposition 6.12), then use the Hodge–Tate comparison."],
    "prerequisites": ["PrismaticCohomology:PR.1", "AInfCohomology:AI.1"],
    "sources": [{"sourceId": "bs-prisms-2022", "locator": "Corollary 15.4 and proof, p. 104 (the right side is misprinted as Ω^*_{R/(A/I)}; PAPER-BHATT-SCHOLZE-22/E1)", "excerpt": "Take the reduction of φ̃ modulo I and use [BMS1, Proposition 6.12] and the Hodge-Tate comparison.", "match": "The whole proof."}], "implementationStatus": "unchecked"}
   ```

**Not changed / open.**
- The acceptance examples of PR.1 stay. A crystalline base with A/p reduced satisfies Theorem 6.4's hypothesis.

## /28 (medium, duplicate): one owner each for twists, the absolute Nygaard filtration and syntomic complexes; add PR.5 → PR.4

**The finding and the verdict.** Several Bhatt–Lurie constructions are planned twice:
- the Breuil–Kisin twists and the absolute refinement of the Nygaard filtration, in PrismaticCohomology:PR.3 and in PrismaticCohomology:PR.5;
- the syntomic complexes of BL §§7–8, in PrismaticCohomology:PR.4 and in PR.5.

PR.4 builds the syntomic complexes but does not reach PR.5's absolute Nygaard filtration. The verifier confirmed both points. Its assignment: "prism twists and relative Nygaard to PR.3, absolute prismatic cohomology/absolute Nygaard to PR.5, and syntomic construction/comparison to PR.4; add PR.5 → PR.4. PR.5 imports the common twists rather than deleting their use. Preserve the distinction between formal-scheme syntomic cohomology, invariant under p-completion, and BL §8.4's scheme version".

**Checked.**
- Stage texts, quoted in the edits below:
  - PR.3: "Bhatt–Lurie §§2,5 for intrinsic twists/absolute refinement".
  - PR.5: "Construct the absolute Nygaard filtration, Frobenius, BK twists and the source's derived/filtered/syntomic packages" and "Sources: Bhatt–Lurie §§2–5,7–9".
  - PR.4: "Construct the syntomic/Tate-twist fibers …" and "Bhatt–Lurie §§7–8".
- PR.4 requires Q4 and PR.3. PR.5's only consumer is PR.7.
- Bhatt–Lurie TeX:
  - Construction 7.4.1: "the fiber of the morphism (φ{n} − ι): Fil^n_N Δ_R{n} → Δ_R{n}, formed in the derived ∞-category D̂(Z_p)". Δ_R here is the absolute prismatic complex.
  - Warning 7.4.2: R ↦ R̂ "induces an isomorphism" of these complexes, whereas the variant of Construction 8.4.1 "does not share this property".
  - Construction 8.4.1: a pullback with RΓ_ét(Spec(R[1/p]), Z_p(n)).
  - The §5 introduction: "Our primary goal in this section is to construct a counterpart of the Nygaard filtration in the setting of absolute prismatic cohomology".
  - §5.1 constructs the relative Nygaard filtration of animated algebras, reviewing BS22 §15. §5.2 is the relative de Rham comparison.
  - Theorem 5.6.2 and Corollary 5.6.3 compare the absolute filtration with the relative one over a perfect prism and with BS22's filtration on quasiregular semiperfectoid rings.
  - §2 is "Breuil-Kisin Twists and the Prismatic Logarithm". The logarithm is Construction 2.3.2 and Definition 2.5.11.
- Paper items planned at two of these stages:

  | Item | Content | Planned at |
  |---|---|---|
  | ANSCHUTZ-LEBRAS-23/116 | twist O_Δ{−1} | PR.3, PR.5 |
  | BHATT-MATHEW-23/001 | syntomic complexes | PR.4, PR.5 |
  | BHATT-MATHEW-23/004 | syntomic complexes | PR.4, PR.5 |
  | BHATT-MATHEW-23/006 | syntomic complexes | PR.4, PR.5 |
  | BHATT-MATHEW-23/016 | twists with divided Frobenius | PR.3, PR.5 |
  | BHATT-MATHEW-23/018 | prismatic logarithm, BL §2 | PR.5 |

- Acyclicity. PR.5 → PR.4 is acyclic on base, RS and full, and jointly. On every graph, PR.4's only descendant is PR.7 and PR.5 is not among them. The edge adds only PR.5 to PR.4's ancestors on base, since PR.5's own ancestors already precede PR.4.

**Fix, as edits.**
1. stageEdges: add PrismaticCohomology:PR.5 → PrismaticCohomology:PR.4. Add PR.5 to PR.4's `requires` and PR.4 to PR.5's `consumers`.
2. README §PR.3 and the atlas description.
   a. After `Construct divided Frobenius, inclusion/canonical maps, and BK twists by descent when I is not oriented.` insert:
   ```text
   These Breuil–Kisin twists A{n} and their Frobenius A{n} → I^{-n}A{n} are
   functorial in the prism, so they give the sheaves O_Δ{n} on every prismatic
   site, including the absolute one; PR.4 and PR.5 import them. Construct also
   the prismatic logarithm log_Δ: T_p((A/I)^×) → A{1} (Bhatt–Lurie Construction
   2.3.2 and Definition 2.5.11).
   ```
   b. Replace `Sources: BS22 §§12–15; Bhatt–Lurie §§2,5 for intrinsic twists/absolute refinement.` with:
   ```text
   Sources: BS22 §§12–15; Bhatt–Lurie §2 (twists and the prismatic logarithm)
   and §§5.1–5.2 (the relative Nygaard filtration of animated algebras and the
   relative de Rham comparison). The absolute Nygaard filtration of Bhatt–Lurie
   §5.5 is PR.5's.
   ```
3. README §PR.4 and the atlas description. Replace `Construct the syntomic/Tate-twist fibers from Nygaard pieces and divided Frobenius with the intrinsic twists.` with:
   ```text
   Construct the syntomic complexes RΓ_Syn(Spf(R), Z_p(n)) of an animated ring R
   as the fibre of φ{n} − ι: Fil^n_N Δ_R{n} → Δ_R{n}, formed in the derived
   p-complete category (Bhatt–Lurie Construction 7.4.1), importing PR.5's
   absolute prismatic complex and absolute Nygaard filtration and PR.3's
   Breuil–Kisin twists. On quasisyntomic rings compare them with the Z_p(n) of
   BS22 §14 and BMS2 §7.4, built by quasisyntomic descent from PR.3's Nygaard
   pieces on quasiregular semiperfectoid rings. Construct the syntomic complexes
   RΓ_Syn(Spec(R), Z_p(n)) of arbitrary animated rings by Bhatt–Lurie's pullback
   square with RΓ_ét(Spec(R[1/p]), Z_p(n)) (Construction 8.4.1). The formal
   version is invariant under p-completion (Warning 7.4.2) and the scheme version
   is not; keep separate notation for them.
   ```
   The Sources change to "Bhatt–Lurie §§7–9" is /6 edit 2.
4. README §PR.5 and the atlas description.
   a. Replace `Construct the absolute Nygaard filtration, Frobenius, BK twists and the source's derived/filtered/syntomic packages.` with:
   ```text
   Construct absolute prismatic cohomology of animated rings and p-adic formal
   schemes (Bhatt–Lurie §4), the absolute de Rham comparison and the absolute
   Nygaard filtration Fil^•_N Δ_R with its divided Frobenius on the twisted pieces
   Fil^n_N Δ_R{n} → Δ_R{n} (§§5.4, 5.5 and 5.7). Construct its comparison with the
   relative filtration over a perfect prism and with BS22's filtration on
   quasiregular semiperfectoid rings (Theorem 5.6.2, Corollary 5.6.3), and
   Nygaard completion (§5.8). The Breuil–Kisin twists are imported from PR.3; the
   syntomic complexes built from these pieces are PR.4's.
   ```
   b. Replace `Sources: Bhatt–Lurie §§2–5,7–9 and Appendices A–F.` with:
   ```text
   Sources: Bhatt–Lurie §§3–4, §§5.3–5.8 and Appendices A–F; §2 and §§5.1–5.2
   are imported from PR.3, and §§7–9 belong to PR.4.
   ```
   c. The change of "§§2–4" in PR.5's first paragraph is part of /29 edit 4.
5. Owners entries, for the record:
   ```json
   [{"target": "Breuil–Kisin twists A{n} of a bounded prism, their Frobenius A{n} → I^{-n}A{n}, the sheaves O_Δ{n} and the prismatic logarithm (Bhatt–Lurie §2)", "owner": "PrismaticCohomology:PR.3", "formerly": ["PrismaticCohomology:PR.5"]},
    {"target": "Absolute prismatic cohomology of animated rings and p-adic formal schemes, the absolute de Rham comparison and the absolute Nygaard filtration with its divided Frobenius (Bhatt–Lurie §4, §§5.3–5.8)", "owner": "PrismaticCohomology:PR.5", "formerly": ["PrismaticCohomology:PR.3"]},
    {"target": "Syntomic complexes RΓ_Syn(Spf R, Z_p(n)) and RΓ_Syn(Spec R, Z_p(n)), their étale comparison and syntomic calculations (Bhatt–Lurie Construction 7.4.1, §§8–9; BS22 §14; BMS2 §7.4)", "owner": "PrismaticCohomology:PR.4", "formerly": ["PrismaticCohomology:PR.5"]}]
   ```
6. Paper items, set to a single owner:
   - PAPER-ANSCHUTZ-LEBRAS-23/116: set `"planned"` to `["PrismaticCohomology:PR.3"]`. Replace its note "PR.3 constructs the Breuil–Kisin twists, by descent when I is not oriented, and PR.5 the intrinsic twists of the absolute theory." with "PR.3 constructs the Breuil–Kisin twists of a prism, which give O_Δ{n} on every absolute prismatic site; PR.5 imports them (fix of RT-AREA-padic-2/28)."
   - PAPER-BHATT-MATHEW-23/001, /004 and /006: set `"planned"` from `["PrismaticCohomology:PR.4", "PrismaticCohomology:PR.5"]` to `["PrismaticCohomology:PR.4"]`.
   - PAPER-BHATT-MATHEW-23/016: set `"planned"` from `["PrismaticCohomology:PR.3", "PrismaticCohomology:PR.5"]` to `["PrismaticCohomology:PR.3"]`.
   - PAPER-BHATT-MATHEW-23/018: set `"planned"` from `["PrismaticCohomology:PR.5"]` to `["PrismaticCohomology:PR.3"]`, and append to its note: " Owner PR.3, with the twists of Bhatt–Lurie §2 (fix of RT-AREA-padic-2/28)."

**Adjusted by the joint check (C6, C7).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- RT-AREA-padic-2/23 states in PR.4 that PR.4 constructs the first Chern classes of Bhatt–Lurie §7. Its section writes that sentence. This section only moves §§7–9 into PR.4's sources, which is consistent with it.
- PAPER-GUO-REINECKE-24/016 is a composite item: the absolute site, twists, the Hodge–Tate gerbe and the crystalline site. It keeps its planned list [PR.5, PR.3].
- Bhatt–Lurie §5.3, the crystalline Nygaard filtration, stays with PR.5. Its regular case compares with the de Rham–Witt Nygaard filtration, and it is used by PR.5's absolute comparisons.

## /29 (medium, error): PR.5's Cartier–Witt stack has no stack supplier; add LP1:stacks

**The finding and the verdict.** PrismaticCohomology:PR.5 builds the Cartier–Witt stack "from the shared animated/stack objects", but no prerequisite supplies stacks, quotient stacks or QCoh/Perf on them. The atlas gives those to LanglandsParameterStacks:LP1 and to SchemeAndStackFoundations:SF.1. The verifier confirmed and asked to "explicitly extend them to the formal/completed setting required here". It gave the locator "BL Proposition 3.2.3 (p.41): WCart is the quotient [WCart0/W^×] in Zariski stacks, with WCart0 an affine FORMAL scheme and p-nilpotent test rings". It also noted that the crystal equivalence "uses (p,I)-complete modules and completed scalar extension (BL §3.3)".

I propose a sub-stage LanglandsParameterStacks:LP1:stacks rather than the plain edge LP1 → PR.5. The generic constructions in LP1 do not depend on Weil groups or reductive groups, but LP1 as a whole does.

**Checked.**
- PR.5 requires DD.1, EnhancedDerivedSheaves:E5:animation, PR.1 and PR.3.
- E5:cotangent-export: "LanglandsParameterStacks owns derived affine/quotient/mapping stacks and their geometry."
- LP1 requires DD.0, E5:animation, E5:presentability and LP0. Its second paragraph begins "Build derived affine schemes, fpqc quotient stacks, quasi-coherent modules, perfect complexes and their pullback/descent from EnhancedDerivedSheaves E5:animation and E5:presentability." That sentence names no LP0 input. LP0 is "Weil groups and continuous cocycles".
- SF.1: "Prove effective fpqc/fppf descent for the required objects".
- Paths. On base and RS, neither LP1 nor SF.1 reaches PR.5. On the full graph SF.1 reaches PR.5 through SF.2 → AdicSpacesPartII:F0 → … → PR.0 → PR.1 → PR.5; LP1 does not.
- Ancestors each option would add to PR.5:
  - LP1 → PR.5 adds LP0, RG2.0a, RG2.5, R09.1, E5:presentability, UPSTREAM:LocalFieldsRamification, UPSTREAM:ProfiniteCohomology and LP1: 8 stages on base, 12 on RS with four Tau Ceti ReductiveGroups layers. After /28 these would also become ancestors of PR.4.
  - LP1:stacks → PR.5 adds only E5:presentability and LP1:stacks. E5:animation and DD.0 are already ancestors of PR.5.
  - SF.1 → PR.5 adds SF.0, SF.1, LI.0, LI.1 and LI.3.
- Bhatt–Lurie TeX:
  - Construction 3.2.1: WCart_0 is "an affine formal scheme Spf(A^0)", with A^0 the (p,a_0)-completion of Z[a_0, a_1^{±1}, a_2, …]. "By convention, we define WCart_0(R) = ∅ when p is not nilpotent in R".
  - Proposition 3.2.3: "exhibits WCart as the quotient [WCart_0/W^×], formed in the 2-category of stacks with respect to the Zariski topology".
  - Definition 3.3.1: D(WCart) is the inverse limit of D(R) over "the category of points of the Cartier-Witt stack".
  - Proposition 3.3.5: D(WCart) → lim_{(A,I)} D̂(A) over bounded prisms is an equivalence, with D̂(A) the (p,I)-complete complexes.
  - Warning 3.3.6 gives the boundedness hypothesis. The remark after it reads D(WCart) as "crystals of (p,I_Δ)-complete complexes on the absolute prismatic site".
  - §1.2: "{Perfect complexes on WCart} ≃ {Perfect Prismatic Crystals on Spf(Z_p)}".
- `scripts/theory_graph.py` makes a parent require its sub-stages unless a sub-stage names the parent as its prerequisite. So LP1:stacks → LP1 is the direction it would add anyway.
- Acyclicity. LP1:stacks, with inputs E5:animation and E5:presentability and outputs LP1 and PR.5, and SF.1 → PR.5 are acyclic on base, RS and full, and jointly. The fallback LP1 → PR.5 is acyclic too, and is among the verifier's 61 edges.

**Fix, as edits.**
1. New atlas stage:
   - id "LanglandsParameterStacks:LP1:stacks"; owner "LanglandsParameterStacks"; key "LP1:stacks"; parentStageId "LanglandsParameterStacks:LP1"; title "Derived affine schemes, quotient stacks and their module categories".
   - requires ["EnhancedDerivedSheaves:E5:animation", "EnhancedDerivedSheaves:E5:presentability"]; consumers ["LanglandsParameterStacks:LP1", "PrismaticCohomology:PR.5"].
   - description:
   ```text
   ### LP1:stacks — Derived affine schemes, quotient stacks and their module categories

   Build derived affine schemes, fpqc quotient stacks, quasi-coherent modules,
   perfect complexes and their pullback/descent from EnhancedDerivedSheaves
   E5:animation and E5:presentability. State them for prestacks on a full
   subcategory of rings (for example the rings in which p is nilpotent), with
   quotients formed in a named topology (Zariski, étale or fpqc), and define
   quasi-coherent and perfect complexes on a prestack as the limit of D(R) over
   its points. These are the generic carriers: LP1 applies them to the parameter
   stacks and PrismaticCohomology PR.5 to the Cartier–Witt stack. No Weil-group,
   reductive-group or parameter input enters this stage.
   ```
   - README: in content/campaign/LanglandsParameterStacks/README.md, insert this text after LP1's second paragraph, which ends "an equality of classical points does not establish this comparison.". Use the anchors `<a id="lp1-stacks"></a>` and `<a id="stage-LP1:stacks"></a>`.
2. README §LP1 and the atlas description of LanglandsParameterStacks:LP1. Replace
   `Build derived affine schemes, fpqc quotient stacks, quasi-coherent modules, perfect complexes and their pullback/descent from EnhancedDerivedSheaves E5:animation and E5:presentability.`
   with
   ```text
   Import derived affine schemes, fpqc quotient stacks, quasi-coherent modules,
   perfect complexes and their pullback/descent from LP1:stacks.
   ```
   Add "LanglandsParameterStacks:LP1:stacks" to LP1's `requires`.
3. README of EnhancedDerivedSheaves §E5:cotangent-export and its atlas description. Replace
   `LanglandsParameterStacks owns derived affine/quotient/mapping stacks and their geometry.`
   with
   ```text
   LanglandsParameterStacks owns derived affine/quotient/mapping stacks and their
   geometry; the generic constructions are its sub-stage LP1:stacks, which
   PrismaticCohomology PR.5 imports.
   ```
4. README §PR.5 and the atlas description. This edit also carries /28's move of BL §2 to PR.3. Replace
   `Develop the Cartier–Witt divisor moduli and Cartier–Witt stack of Bhatt–Lurie §§2–4 from the shared animated/stack objects, proving descent and the equivalence with the source's prismatic crystals.`
   with
   ```text
   Develop the Cartier–Witt divisor moduli and the Cartier–Witt stack of
   Bhatt–Lurie §§3–4, with the Breuil–Kisin twists of §2 imported from PR.3.
   Build them on the stack, quasi-coherent, perfect-complex and descent
   interfaces of LanglandsParameterStacks LP1:stacks and on SchemeAndStackFoundations
   SF.1's effective fpqc descent, and extend those interfaces here to the formal
   and completed setting WCart needs. WCart is the quotient [WCart_0/W^×] in
   stacks for the Zariski topology on rings in which p is nilpotent, where
   WCart_0 = Spf(A^0) is an affine formal scheme and W^× an affine group scheme
   (Bhatt–Lurie Proposition 3.2.3). It is neither an affine quotient nor a formal
   scheme. D(WCart) is the limit of D(R) over its points (Definition 3.3.1).
   Prove that pullback along the maps ρ_A gives D(WCart) ≃ lim D̂(A) over bounded
   prisms (A,I), where D̂(A) consists of the (p,I)-complete complexes
   (Proposition 3.3.5 and Warning 3.3.6). This identifies quasi-coherent and
   perfect complexes on WCart with (p,I)-complete crystals on the absolute
   prismatic site, using completed scalar extension.
   ```
5. stageEdges: add
   - EnhancedDerivedSheaves:E5:animation → LanglandsParameterStacks:LP1:stacks;
   - EnhancedDerivedSheaves:E5:presentability → LanglandsParameterStacks:LP1:stacks;
   - LanglandsParameterStacks:LP1:stacks → LanglandsParameterStacks:LP1;
   - LanglandsParameterStacks:LP1:stacks → PrismaticCohomology:PR.5;
   - SchemeAndStackFoundations:SF.1 → PrismaticCohomology:PR.5.
   
   Update PR.5's `requires` and the suppliers' `consumers` to match.
6. Owners entry, for the record:
   ```json
   {"target": "Derived affine schemes, fpqc quotient stacks, quasi-coherent and perfect complexes on prestacks, with pullback and descent (generic constructions)", "owner": "LanglandsParameterStacks:LP1:stacks", "formerly": ["LanglandsParameterStacks:LP1"]}
   ```

**Not changed / open.**
- If the maintainer does not want to split LP1, add LanglandsParameterStacks:LP1 → PrismaticCohomology:PR.5 instead, which is the verifier's edge. It is acyclic. The cost is the Weil-group and reductive-group ancestors listed above, for PR.5, PR.4 and PR.7. In that case edit 4 names "LP1" instead of "LP1:stacks", and edits 1–3 and 6 are dropped.
- The mapping-stack and cotangent parts of LP1 stay in LP1. So does its import from DD.0.

## /30 (medium, error): PR.7's étale realization, essential surjectivity and Kisin comparison have no suppliers

**The finding and the verdict.** PrismaticCohomology:PR.7 follows BS F-crystals §§3, 6 and 7, but three of their inputs have no supplier:
- (a) v-descent of lisse Z_p-sheaves on the diamond generic fibre (ECD), owned by DiamondEtaleCohomology:C2;
- (b) the Fargues–Fontaine classification: φ-modules over the extended Robba ring as bundles on X_FF, and slope-0 semistable bundles being trivial (VectorBundlesAndIsocrystals:VB2:classification);
- (c) R07's Kisin functor (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4), which is not upstream of PR.7.

The verifier confirmed all three. It asked to "Add C2 → PR.7 with the lisse/completion qualification", to "Add VB2:classification → PR.7 and record the dictionary/comparison proof requests", and to "Add R07.4 → PR.7 only with the extended Kisin functor of finding4". It also noted that "AI.2's repaired extension theorem supplies its overlap". Two corrections:
- The SW20 Theorem 14.2.1 extension used in §6.4 is owned by RT-AREA-padic-1/18's RelativeFarguesFontaine:RF0:crystalline-end, not by AInfCohomology:AI.2.
- BS prove Kisin's full faithfulness results themselves (Theorem 7.9, Corollary 7.10). Only the identification with Kisin's own functor (Remark 7.11) needs R07.4.

**Checked.**
- PR.7 requires AI.2, R06.2, PR.4, PR.5, RT.3b and RT.6. It has no consumers, and no descendants on base, RS or full. There is no path from C2, VB1, VB2:classification or R07.4 to PR.7 on any of the three graphs.
- BS F-crystals TeX:
  - Notation 3.1 defines D^(b)_lisse(X_η, Z_p) as "locally bounded objects which are derived p-complete and whose mod p reduction has cohomology sheaves that are locally constant with finitely generated stalks". It says this "defines a sheaf of ∞-categories for the quasisyntomic topology on X, as follows from the v-descent results in [ECoD] (and the observation that any quasisyntomic cover of X induces a v-cover of X_η)".
  - §6.4 uses "[Berkeley, Theorem 14.2.1]", "[FFCurve, Corollary 11.2.22]", "[FFCurve, Proposition 10.5.6]" and "[FFCurve, Theorem 8.2.10 (1)]", and "Kedlaya's theorem [KedlayaAinf] or [BMS1, Lemma 4.6]". Its footnote says the argument "relies ultimately on Berger's observation … via Kedlaya's slope filtration results".
  - §7 contains Theorem 7.2 (Kisin, Proposition 2.1.12), Theorem 7.9 (Kisin, Corollary 1.3.15) and Corollary 7.10 (Kisin, Corollary 2.1.14). Remark 7.11 says "Strictly speaking, we haven't yet shown that the functor in Theorem 7.9 coincides with the one from [Kisin]". Remark 7.12 is Liu's uniformizer independence.
- Stage texts:
  - C2: "tested on one v-cover … enhanced hyperdescent (17.3)".
  - VB2:classification: "every bundle at a geometric point is a direct sum of the stable O(lambda)".
  - R07.4 states only the classification of finite flat groups and p-divisible groups.
- DiamondsAndVStacks:D6 plans ECD 15.2–15.4 and already reaches PR.7 and C2.
- The Fargues–Fontaine extraction (PAPER-FARGUES-FONTAINE-18, merged 29 September; REV-PAPER-FARGUES-FONTAINE-18 pending):
  - Item /1084 (Corollaire 11.2.22(1)) is "missing" and goes to route 3, VectorBundlesAndIsocrystalsPartII.
  - Item /962 (Proposition 10.5.6) is "missing" and goes to route 5, PadicHodgeTheoryPartIIEquivariantBundlesOnTheCurve, whose design job is DESIGN-PadicHodgeTheoryPartII.
  - Item /811 (Théorème 8.2.10(1)) is planned at VB2:classification.
  - Neither brief names PR.7.
- RT-AREA-padic-2/18's verdict selects Berger's route for R06.2. So R06.2 will not supply FF Proposition 10.5.6.
- RT-AREA-padic-1/18 creates RF0:crystalline-end, with Kedlaya's algebraization and SW20 Proposition 14.2.6. RT-AREA-padic-1/19 keeps PR.7 on AI.2 for full faithfulness only.
- Acyclicity. The four edges below, the two future Part II edges and a hypothetical /4 sub-stage are acyclic on base, RS and full, and jointly. Ancestors added to PR.7:
  - C2: 44 stages on base, 68 on RS (the ECD chain through H1, H2, EDC and R09);
  - VB2:classification: 8;
  - R07.4: 2 on base, 12 on RS.

**Fix, as edits.**
1. stageEdges:
   - Add DiamondEtaleCohomology:C2 → PrismaticCohomology:PR.7 and VectorBundlesAndIsocrystals:VB2:classification → PrismaticCohomology:PR.7.
   - Add RelativeFarguesFontaine:RF0:crystalline-end → PrismaticCohomology:PR.7 when RT-AREA-padic-1/18 creates that stage.
   - Add FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 → PrismaticCohomology:PR.7 when the fix of RT-AREA-padic-2/4 gives R07.4 Kisin's lattice functor. If that fix puts the functor in a sub-stage, the edge starts there.
   - Update `requires` and `consumers` to match.
2. README §PR.7 and the atlas description.
   a. After `For a p-adic formal scheme construct étale realization on its generic fiber and crystalline realization on its special fiber in the ranges of Bhatt–Scholze 2106.14735 §§2–4.` insert:
   ```text
   The étale realization uses that X ↦ D^(b)_lisse(X_η, Z_p) (locally bounded,
   derived p-complete objects of D(X_{η,proét}, Z_p) whose reduction mod p has
   locally constant cohomology sheaves with finitely generated stalks) is a
   sheaf of ∞-categories for the quasisyntomic topology (BS F-crystals Notation
   3.1). Import v-descent of D_ét from DiamondEtaleCohomology C2 (ECD Theorem
   14.12, Proposition 17.3) and prove here that the lisse, local-boundedness and
   derived p-completeness conditions descend; pass to Z_p by derived limits. A
   quasisyntomic cover of X induces a v-cover of X_η.
   ```
   b. After `Construct the inverse, including the BKF/Robba boundedness argument and descent over the self-product of the perfectoid cover.` insert:
   ```text
   For essential surjectivity (BS F-crystals §6.4), import these results:
   - the equivalence between vector bundles on Spa(A_inf) \ {x_k} and finite free
     A_inf-modules (SW20 Theorem 14.2.1), from RelativeFarguesFontaine
     RF0:crystalline-end;
   - BMS1 Lemma 4.6, from AI.2;
   - the identification of φ-modules over the extended Robba ring with bundles
     on X_FF (FF Corollaire 11.2.22(1));
   - the fact that weak admissibility makes the associated bundle semistable of
     slope 0 (FF Proposition 10.5.6);
   - triviality of semistable bundles of slope 0 (FF Théorème 8.2.10(1)), from
     VectorBundlesAndIsocrystals VB2:classification.
   The two FF statements have no atlas owner yet. Only full faithfulness of
   Fargues' theorem is used.
   ```
   c. Replace `Compare evaluation on the Breuil–Kisin prism with R07's Kisin functor, including uniformizer dependence and full faithfulness in the source range.` with:
   ```text
   Prove BS F-crystals Theorem 7.2 (the étale realization over 𝔖 is fully
   faithful), Theorem 7.9 (D_𝔖 is fully faithful on crystalline lattices) and
   Corollary 7.10 (restriction Rep^cris_Zp(G_K) → Rep_Zp(G_K∞) is fully faithful)
   from the main theorem. Then identify D_𝔖 with Kisin's lattice functor from
   FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, extended as in
   RT-AREA-padic-2/4 (Remark 7.11), and prove its independence of the uniformizer
   (Remark 7.12).
   ```
3. Requests entries for the PR.7 packet:
   ```json
   [{"supplier": "VectorBundlesAndIsocrystalsPartII:<the stage that owns FF Corollaire 11.2.22(1)>", "need": "For F = C^♭ algebraically closed and E = Q_p, φ-modules over the Robba ring R = lim_{ρ→0} B_{]0,ρ]} are equivalent to vector bundles on X_FF, through Fib_{Y/φ^Z}, compatibly with rank, degree and slope (FF Corollaire 11.2.22(1); PAPER-FARGUES-FONTAINE-18/1084).", "neededBy": ["PrismaticCohomology:PR.7"]},
    {"supplier": "PadicHodgeTheoryPartII:<the stage that owns FF Proposition 10.5.6>", "need": "For K|Q_p complete, discretely valued, with perfect residue field, and a filtered φ-module A over K/K_0, the HN filtration of E(A) on X_{C^♭,Q_p} is E of the HN filtration of A; in particular A is weakly admissible if and only if E(A) is semistable of slope 0 (FF Proposition 10.5.6; PAPER-FARGUES-FONTAINE-18/962).", "neededBy": ["PrismaticCohomology:PR.7"]}]
   ```
4. PAPER-FARGUES-FONTAINE-18.result.json. These are for REV-PAPER-FARGUES-FONTAINE-18, or for the maintainer after its review.
   - Route 3 brief, after `and the equivalences Fib_{Y/φ^Z} ≃ φ-Mod_B ≃ φ-Mod_R (§11.2.5, Corollaire 11.2.22(1)).` insert " Export Corollaire 11.2.22(1) to PrismaticCohomology PR.7, whose essential surjectivity (Bhatt–Scholze, Prismatic F-crystals, §6.4) reads φ-modules over the extended Robba ring as bundles on X_FF."
   - Route 5 brief, append at the end: " Export Proposition 10.5.6 to PrismaticCohomology PR.7 (Bhatt–Scholze, Prismatic F-crystals, §6.4: weak admissibility makes the bundle attached to M(D)(Y) semistable of slope 0)."
   - Future edges: from the owning Part II stages to PrismaticCohomology:PR.7. They are acyclic, because PR.7 has no descendants and neither brief imports PR.7.
5. RT-AREA-padic-1/18's description of RF0:crystalline-end. After "(SW20 Proposition 14.2.6)" add ", and hence SW20 Theorem 14.2.1: vector bundles on Spa A_inf \ {x_k} are finite free A_inf-modules". PR.7 and AI.2:essential-surjectivity both cite the result in that form.

**Adjusted by the joint check (C3, C8, C9).** Apply this section together with the resolutions under "Cross-finding adjustments" below, which take precedence where they differ.

**Not changed / open.**
- Robba-side alternative. The footnote of §6.4 names a route that avoids the two unowned FF statements: Berger's criterion (weak admissibility means slope 0) with Kedlaya's slope theory over the extended Robba ring. Two pieces of it are already planned: Kedlaya's Dieudonné–Manin over B̃_rig is PAPER-FARGUES-FONTAINE-18/74, planned at RD.1/P7, and the slope-zero characterisation is item (3) of RT-AREA-padic-2/4's R07.4 extension. The PR.7 blueprint may choose that route. The requests of edit 3 and the Part II edges of edit 4 then lapse.
- The C2 edge brings the whole ECD §§14–17 chain into PR.7's ancestry. That is what BS's citation of ECD v-descent requires. A lighter supplier for lisse sheaves alone is not in the atlas.
- Torsion and derived representations stay out of scope, as the stage already says ("Finite-free crystals do not classify all torsion or derived Galois representations").

## /31 (medium, duplicate): RD.0's text re-plans the Robba and dagger carriers of P7:annulus-foundations and F1; the packets already split them, so the stage text and RS-26 must follow

**The finding and the verdict.** PadicDifferentialEquationsAndRigidCohomology:RD.0's text constructs dagger algebras with weak completion and differential forms, which are AdicSpacesPartII:F1's. It also constructs bounded and full Robba rings with their norms and topology, which are PadicHodgeTheory:P7:annulus-foundations's. RD.0 already requires both stages. The verifier confirmed: "importing the common carrier is the appropriate repair; neither merely adding another edge nor deleting all RD.0's coefficient work suffices". RD.0 must "Preserve RD.0's required imperfect-residue/Cohen coefficient extensions, Frobenius choices, relative/fringe constructions, coordinate-change and descent lemmas unless an upstream owner is explicitly generalized". The fix should "Add RD.0 to the Robba reuse record, retain the existing two prerequisites, and keep later comparisons out of the early carrier prefix". The verifier also notes: "The Bézout assertion there is for the scalar-field ring, not every relative ring."

**Checked.**
- RD.0 (`content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`): "Construct overconvergent power-series algebras as unions over strict radii, their weak completion maps and differential forms. Build bounded and full Robba rings with their radius-indexed norms and topology." RD.0 requires AdicSpacesPartII:F1 and PadicHodgeTheory:P7:annulus-foundations.
- P7:annulus-foundations (`content/campaign/PadicHodgeTheory/README.md`): "Construct the bounded, overconvergent and Robba coefficient rings from actual convergent Laurent series on annuli, their norms/topologies and restriction maps, Frobenius and cyclotomic Γ action."
- The P7 packet already builds these carriers in general. Its nodes annulus-laurent-ring, robba-ring, bounded-robba-ring, amice-ring, amice-ring-complete-dvf ("No perfectness of k is needed"), coefficient-extension and annulus-derivation are stated for "K is a field complete for a nontrivial nonarchimedean absolute value". So the generalisation the finding asks for ("If P7 is stated only for cyclotomic coefficients, generalise P7's coefficient field there") is already made at node level. The stage text still says "cyclotomic".
- The RD packet already splits ownership at node level. Its restructure entries are "Robba coefficient rings: P7:annulus-foundations owns the Laurent-series rings, RD.0 their structure theory" and "Dagger algebras: F1 owns weak completion and overconvergent de Rham complexes, RD.0 owns Frobenius lifts on them". RD.0/robba-ring and RD.0/frobenius-lift-on-robba-ring import R, R^bd, R^int and O_E "from PadicHodgeTheory:P7:annulus-foundations", and the packet records requests to P7:annulus-foundations and F1. Kedlaya's relative Robba rings over dagger algebras and the fringe norms are RD.5/relative-robba-ring and RD.5/fringe-norm-interpolation. The Bézout nodes are RD.0/analytic-ring-bezout and RD.0/modules-over-bezout-domains, for the scalar-field rings.
- Residual node-level overlaps remain:
  - RD.0/derivation-on-robba-ring restates P7:annulus-foundations/annulus-derivation: the bound "|df/dt|_ρ ≤ ρ^{-1}|f|_ρ", commuting with restriction, "ker(d/dt on R) = K and R/(d/dt)R = K·t^{-1}".
  - RD.0/bounded-robba-ring (c), "R^bd = R ∩ E … and R^int = R ∩ O_E", restates P7:annulus-foundations/bounded-robba-ring ("R^bd_K = R_K ∩ E_K and R^int_K = R_K ∩ O_{E,K}").
- The owner entries of the accepted restructurings:
  - RS-05 already gives "Dagger/weak-completion geometric carrier" to AdicSpacesPartII:F1, with formerly ["PadicDifferentialEquationsAndRigidCohomology:RD.0", "AutomorphicGaloisRepresentationsPartII:AG2.4"].
  - RS-26 gives "Analytic annulus/Robba coefficient carriers, topologies and analytic scalar-extension maps" to PadicHodgeTheory:P7:annulus-foundations, with formerly ["PhiGammaModulesAndIwasawaCohomology:PG.0", "PadicHodgeRegulators:L2", "PadicLocalLanglandsForGL2Qp:R30.1"]. RD.0 is missing. The copies in data/restructure and research/blueprint/restructure are identical.
  - scripts/check_restructure.py requires only that a former owner be an atlas layer, so a non-member layer is allowed (RS-05's entry already has one).
- No stage edge changes. Both prerequisites stay, and nothing is added upstream of P7:annulus-foundations.

**Fix, as edits.**
1. `content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.0. Replace "**Construction and export:** Construct overconvergent power-series algebras as unions over strict radii, their weak completion maps and differential forms. Build bounded and full Robba rings with their radius-indexed norms and topology. Prove the flatness, faithful descent and base-change lemmas actually used later; do not identify an overconvergent algebra with its affinoid completion. Construct compatible Frobenius lifts and explain coordinate-change dependence." (occurs once) with:

   ```markdown
   **Construction and export:** Import the carriers.
   - From PadicHodgeTheory P7:annulus-foundations: the Laurent-series rings of annuli, the Robba ring and its bounded and integral subrings, the Amice rings O_E and E with their Gauss norms, topologies, restriction maps, coefficient extension and the derivation d/dt, for every complete discretely valued coefficient field of characteristic 0 (residue field not assumed perfect).
   - From AdicSpacesPartII F1: weak completions, dagger algebras, their differential forms and their de Rham complexes.

   Construct here only what those carriers do not give:
   - Kedlaya's analytic rings over a finite totally ramified extension of a Cohen ring whose residue field may be imperfect, the extended Robba ring, and the identification of the Robba ring with the analytic ring of k((t));
   - the henselian discrete valuation ring and field structure of R^int and R^bd, their units, the PID and Bézout properties of the scalar-field rings, freeness of vector bundles, finite separable extensions, and the flatness, faithful descent and base-change lemmas used later;
   - arbitrary Frobenius lifts on these rings and on dagger algebras of Monsky–Washnitzer type, with their Taylor comparison, homotopy and coordinate-change dependence;
   - the norm and spectral-norm estimates for d/dt and the chain rule under Frobenius.

   Kedlaya's relative Robba rings over dagger algebras belong to RD.5. Do not identify an overconvergent algebra with its affinoid completion.
   ```
2. `content/campaign/PadicHodgeTheory/README.md`, P7:annulus-foundations. Replace "Construct the bounded, overconvergent and Robba coefficient rings from actual convergent Laurent series on annuli, their norms/topologies and restriction maps, Frobenius and cyclotomic Γ action." (occurs once) with "Construct the bounded, overconvergent and Robba coefficient rings from actual convergent Laurent series on annuli, with their norms/topologies and restriction maps. Build them for an arbitrary complete nonarchimedean coefficient field, including discretely valued fields whose residue field is not perfect, with the functions on the open unit disc as a subring. Then give the cyclotomic Frobenius and Γ action as one instance. These are the atlas's only annulus carriers (RS-26). PhiGammaModulesAndIwasawaCohomology PG.0, PadicDifferentialEquationsAndRigidCohomology RD.0 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 import them. Arbitrary Frobenius lifts, Kedlaya's analytic rings and the algebraic structure theory of these rings are RD.0's."
3. RS-26, both identical copies (for the restructuring job). In the owners entry {"target": "Analytic annulus/Robba coefficient carriers, topologies and analytic scalar-extension maps", "owner": "PadicHodgeTheory:P7:annulus-foundations", …}, change "formerly" to ["PhiGammaModulesAndIwasawaCohomology:PG.0", "PadicHodgeRegulators:L2", "PadicLocalLanglandsForGL2Qp:R30.1", "PadicDifferentialEquationsAndRigidCohomology:RD.0"]. RS-05's dagger entry needs no change.
4. RD packet (for the RD blueprint job):
   - a. RD.0/derivation-on-robba-ring: cite PadicHodgeTheory:P7:annulus-foundations/annulus-derivation for the definition, the bound |df|_ρ ≤ ρ^{-1}|f|_ρ, commutation with restriction and the kernel and cokernel. Keep only the operator and spectral norms, the module of differentials, integrability of connections and the Frobenius chain rule.
   - b. RD.0/bounded-robba-ring: cite PadicHodgeTheory:P7:annulus-foundations/bounded-robba-ring for part (c). Keep (a), (b) and (d).
   - c. In restructure, note that the two ownership entries on Robba rings and dagger algebras are applied by RT-AREA-padic-2/31.

**Adjusted by the joint check (C8).** Apply this section together with the resolution under "Cross-finding adjustments" below, which takes precedence where they differ.

**Not changed / open.**
- The finding's alternative, narrower keep list (Frobenius lifts on the Robba ring of a chosen coordinate, plus the flatness and descent lemmas) is contained in edit 1. The larger list follows the RD packet and the verifier, since P7 does not plan Kedlaya's analytic rings or the Bézout theory.

## /32 (medium, missing): AG2.4 needs the Grosse-Klönne dagger–rigid comparison and the finiteness and weight theorems of RD.4–RD.6, which do not reach it

**The finding and the verdict.** AutomorphicGaloisRepresentationsPartII:AG2.4 plans HLTT's "rigid cohomology" of the ordinary locus as dagger log de Rham hypercohomology, and asks to "Prove finite-dimensional slope pieces". HLTT get finiteness and weights only by identifying dagger de Rham cohomology with rigid cohomology (Grosse-Klönne, Theorem 5.1), then applying Berthelot's finiteness and Chiarellotto's weight theorem. PadicDifferentialEquationsAndRigidCohomology:RD.4, RD.5 and RD.6 own rigid cohomology and its finiteness and weights, but do not reach AG2.4, and no layer plans the comparison. The verifier confirmed and corrected the scope. HLTT's "Lemma 6.8, pp.189–190, identifies rigid cohomology of the special fibre of a smooth quasi-projective O_K-scheme with dagger de Rham cohomology of the dagger tube of that special fibre … not an unrestricted identification with the whole analytic generic fibre". "Lemma 6.21 and Corollary 6.22 on p.207 pass through rigid cohomology of boundary strata and Berthelot's finiteness; Corollary 6.24 on p.208 imports Chiarellotto's weight theorem". The fix should "Add an explicitly functorial, Frobenius-compatible comparison node at RD.4 … separately prove the boundary-stratum/log/compact-support adapters … Keep carrier-level boundary complexes at F1 and import cohomological comparison/finiteness/weights into AG2.4 via RD.4, RD.5 and RD.6." The verifier adds: "The original GK, Berthelot and Chiarellotto proofs were not independently read here".

**Checked.**
- AG2.4 (`content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`): "Build the overconvergent logarithmic de Rham complex with the appropriate compact-support boundary ideal on these dagger spaces, its hypercohomology and the comparison with finite-slope overconvergent cuspidal sections. Prove finite-dimensional slope pieces". AG2.4 requires F1, B3, AG2.3, L4 and C5. No path runs from RD.4, RD.5 or RD.6 to AG2.4 on any graph.
- RS-12 (accepted) keeps AG2.4 with the "ordinary-locus dagger and compact-support logarithmic complex instance". The AG2 decomposition has one AG2.4 node, and its coverage says HLTT's "Sections 1-7 … were not read".
- F1 (`content/campaign/AdicSpacesPartII/README.md`): "For smooth pairs define compact-support variants through extension/vanishing at the boundary and prove the natural localization maps." The promoted AdicSpacesPartII blueprint has the carrier nodes F1/compact-support-log-complex, F1/compact-support-localisation-maps and F1/compact-support-de-rham. Its F1 coverage note says: "Grosse-Klönne's Theorems 3.5 and 5.1 are proved through Berthelot's j† on tubes, owned by PadicDifferentialEquationsAndRigidCohomology RD.3, and belong with RD.4; they are outside F1."
- The RD packet plans RD.4/rigid-cohomology, RD.4/compactly-supported-rigid-cohomology, RD.4/monsky-washnitzer-comparison (the smooth affine case), RD.5/finiteness-of-rigid-cohomology and RD.5/finiteness-of-compactly-supported-rigid-cohomology (Kedlaya's finiteness, which contains Berthelot's constant-coefficient case), RD.6/p-adic-weil-ii and RD.6/purity-smooth-proper. It has no Grosse-Klönne comparison node and no node for Chiarellotto's theorem. Its restructure entry "RD.4 and AG2.4: ordinary-locus rigid cohomology" proposes: "AG2.4 consumes RD.4/rigid-cohomology, RD.4/compactly-supported-rigid-cohomology and RD.5/finiteness-of-rigid-cohomology and keeps only the Shimura-variety-specific boundary and slope comparisons."
- RD.4's text says "Prove independence of frames/compactifications, localization triangles, excision and proper/smooth comparison maps with actual functoriality." It does not name the comparison.
- Acyclicity. RD.4 → AG2.4, RD.5 → AG2.4 and RD.6 → AG2.4 pass every check listed under /4. With these edges, AG2.4's ancestors on the RS graph go from 364 to 372.

**Fix, as edits.**
1. `content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.4. After "Prove independence of frames/compactifications, localization triangles, excision and proper/smooth comparison maps with actual functoriality." (occurs once) insert: "Prove the Grosse-Klönne comparison (Crelle 519 (2000), Theorem 5.1, as HLTT use it in arXiv:1411.6717v1, Lemma 6.8). For a smooth quasi-projective O_K-scheme 𝒴 with special fibre Y, H^i_rig(Y/K) is canonically isomorphic to the de Rham cohomology of the dagger tube of Y in the analytic generic fibre, the dagger space and complex being AdicSpacesPartII F1's. The isomorphism is functorial in 𝒴 and compatible with Frobenius. It extends the Monsky–Washnitzer comparison of the affine case. Its logarithmic, compact-support and boundary-stratum variants are separate statements, each with its own proof."
2. `content/campaign/AdicSpacesPartII/README.md`, F1. Replace "For smooth pairs define compact-support variants through extension/vanishing at the boundary and prove the natural localization maps." (occurs once) with "For smooth pairs, define through extension or vanishing at the boundary the compact-support (boundary-vanishing) logarithmic de Rham complexes and the compactly supported de Rham cohomology of affinoid and Stein dagger spaces. Prove the natural localization maps between these complexes. Their comparison with rigid cohomology of the special fibre (Grosse-Klönne's Theorem 5.1, proved through Berthelot's j† on tubes) and the finiteness of rigid cohomology belong to PadicDifferentialEquationsAndRigidCohomology RD.4 and RD.5."
3. `content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`, AG2.4. Replace "Build the overconvergent logarithmic de Rham complex with the appropriate compact-support boundary ideal on these dagger spaces, its hypercohomology and the comparison with finite-slope overconvergent cuspidal sections. Prove finite-dimensional slope pieces, independence of admissible neighborhoods/refinements, functorial Hecke action and the boundary/Levi inclusion." (occurs once) with:

   "Take from AdicSpacesPartII F1 the overconvergent logarithmic de Rham complex with the compact-support boundary ideal on these dagger spaces, and form its hypercohomology. Identify it with rigid cohomology as HLTT do (arXiv:1411.6717v1, Lemma 6.8). Apply the Grosse-Klönne comparison of PadicDifferentialEquationsAndRigidCohomology RD.4 to the dagger tube of the special fibre of a smooth quasi-projective O_K-scheme, not to the whole analytic generic fibre. Prove here the boundary-stratum adapter of HLTT Lemma 6.21, from RD.4's comparison and its excision and localization sequences. Import finite-dimensionality from RD.5: Berthelot's theorem is the constant-coefficient case of RD.5's finiteness (HLTT Corollary 6.22). Import from RD.6 that the Frobenius eigenvalues are Weil numbers (HLTT Corollary 6.24, via Chiarellotto's theorem). Do not prove either again. Then prove the comparison with finite-slope overconvergent cuspidal sections, finite-dimensional slope pieces as a consequence, independence of admissible neighborhoods/refinements, functorial Hecke action and the boundary/Levi inclusion."
4. data/atlas.json:
   - stageEdges add:
     - PadicDifferentialEquationsAndRigidCohomology:RD.4 → AutomorphicGaloisRepresentationsPartII:AG2.4
     - PadicDifferentialEquationsAndRigidCohomology:RD.5 → AutomorphicGaloisRepresentationsPartII:AG2.4
     - PadicDifferentialEquationsAndRigidCohomology:RD.6 → AutomorphicGaloisRepresentationsPartII:AG2.4
   - Add the three stages to AG2.4.requires, and regenerate the F1, RD.4 and AG2.4 descriptions.
5. RD packet (for the RD blueprint job):
   - a. New node PadicDifferentialEquationsAndRigidCohomology:RD.4/grosse-kloenne-dagger-comparison (comparison).
     - Statement: the comparison of edit 1, with the smooth quasi-projective and dagger-tube hypotheses of HLTT Lemma 6.8.
     - Prerequisites: RD.4/rigid-cohomology, RD.4/monsky-washnitzer-comparison, RD.4/frobenius-on-rigid-cohomology, RD.3/tube, AdicSpacesPartII:F1/dagger-space, AdicSpacesPartII:F1/dagger-de-rham-complex, AdicSpacesPartII:F1/weak-completion.
     - Sources: Grosse-Klönne 2000, Theorem 5.1 (not read), and HLTT v1, Lemma 6.8, pp. 189–190 (the verifier's reading).
     - Record Grosse-Klönne's proof as a gap until it is read.
   - b. New node PadicDifferentialEquationsAndRigidCohomology:RD.6/frobenius-eigenvalues-are-weil-numbers (theorem).
     - Statement: the eigenvalues of Frobenius on H^i_rig of a separated finite-type scheme over F_q, with constant coefficients, are Weil numbers, as HLTT Corollary 6.24 uses Chiarellotto's Theorem 2.2. Fix the exact weight range from Chiarellotto's paper, which was not read.
     - Route: deduce it from RD.6/p-adic-weil-ii (every ι) and RD.5/poincare-duality if the deduction closes. Otherwise decompose Chiarellotto's proof.
     - Prerequisites: RD.6/p-adic-weil-ii, RD.6/pointwise-iota-weights, RD.5/finiteness-of-rigid-cohomology, RD.5/poincare-duality.
   - c. In restructure, entry "RD.4 and AG2.4: ordinary-locus rigid cohomology": replace its proposal "AG2.4 consumes RD.4/rigid-cohomology, RD.4/compactly-supported-rigid-cohomology and RD.5/finiteness-of-rigid-cohomology and keeps only the Shimura-variety-specific boundary and slope comparisons." with "AG2.4 consumes RD.4/rigid-cohomology, RD.4/compactly-supported-rigid-cohomology, RD.4/grosse-kloenne-dagger-comparison, RD.5/finiteness-of-rigid-cohomology, RD.5/finiteness-of-compactly-supported-rigid-cohomology and RD.6/frobenius-eigenvalues-are-weil-numbers, and keeps only the Shimura-variety-specific boundary-stratum adapter (HLTT Lemma 6.21) and slope comparisons."
6. AG2.4 decomposition or blueprint (for the AG2 blueprint job): when HLTT §6 is read, add the application nodes for Lemma 6.8, Lemma 6.21, Corollary 6.22 and Corollary 6.24, with the RD nodes of edit 5 as prerequisites.

**Not changed / open.**
- The Grosse-Klönne, Berthelot and Chiarellotto proofs were not read. The new nodes carry them as recorded gaps, as the verifier asks.
- HLTT's lemma and corollary numbers and pages are the verifier's (v1). The finding's "6.23" is corrected to 6.22.

## /33 (medium, missing): Kedlaya's étale-cover theorem and de Jong's alterations; both are planned in the RD packet on main, but the atlas lacks L5 → RD.5 and the stage texts

**The finding and the verdict.** Kedlaya's finiteness proof has two geometric inputs that PadicDifferentialEquationsAndRigidCohomology:RD.5 lacks. The first is his theorem that a smooth point of a variety in characteristic p has an open dense affine neighbourhood finite étale over affine n-space (Finiteness, Proposition 9.1.2). The second is de Jong's Theorem 4.1 with cohomological descent. RD.5 names "alterations" but does not require AdicCoefficientsAndComparisons:L5, which plans de Jong's Theorem 4.1. The verifier confirmed both and qualified them. Proposition 9.1.2 has "the hypothesis that the chosen geometric point x is smooth". The fix should "Add the fully source-qualified cover theorem at RD.5 and L5→RD.5". It should "Import the alteration geometry only: L5's étale-cohomology descent does not automatically prove descent for rigid cohomology. Name and plan the latter Chiarellotto–Tsuzuki/Tsuzuki input separately, with its field-extension and coefficient hypotheses."

**Checked.**
- RD.5 (RD README): "Develop the relative curve pushforward and relative local-monodromy input used in Kedlaya's proof, then devissage and alterations/descent." RD.5 requires RD.2 and RD.4.
- Already on main. The RD packet (PR #2916, 25 September, after the red team) has:
  - RD.3/etale-cover-of-affine-space ("X contains an open dense affine subscheme U containing x with a finite étale morphism U → A^n_k", with x a smooth point and pure dimension n). Sources: Kedlaya, Finiteness, Proposition 9.1.2, p. 61; More étale covers, Theorem 2. Source issue E41 records that "of dimension n" must read "of pure dimension n".
  - RD.5/smooth-proper-hypercovering (hypothesis: "The alterations are de Jong's (Theorem 4.1), requested from AdicCoefficientsAndComparisons:L5 together with the simplicial construction"; finite purely inseparable extensions k_n).
  - RD.5/cohomological-descent-for-proper-hypercoverings (Tsuzuki, Invent. Math. 151 (2003), Theorem 4.5.1, not public; Chiarellotto–Tsuzuki, Theorem 11.7.1, for étale hypercoverings).
  - A request to L5 for Theorem 4.1 "over an arbitrary field k of characteristic p".

  The cover theorem sits in RD.3 and not in RD.5. Its users are RD.3/full-faithfulness-overconvergent-to-convergent, RD.5/finiteness-for-smooth-varieties, RD.5/compact-support-vanishing-above-twice-dimension, RD.5/poincare-duality, RD.5/kunneth-formula-with-supports, RD.6/lefschetz-trace-formula, RD.6/weight-drop-lemma, RD.6/p-adic-weil-ii and RD.6/slope-bounds-for-rigid-cohomology. RD.3 is the right owner, and the finding's placement in RD.5 is superseded.
- L5 already plans the theorem. The accepted AdicCoefficientsAndComparisons decomposition has the node AdicCoefficientsAndComparisons:L5/de-jong-4-1-alteration-field-case: "Theorem 4.1: for a variety X over a field k … X̄_1 is a projective variety and a regular scheme … Remark 4.2: X_1 -> Spec k factors through a finite extension k_1 with X̄_1 geometrically irreducible and smooth over k_1".
- Graph. L5 → RD.5 is not an edge. On the full build graph L5 already reaches RD.5, through the promoted AdicSpacesPartII blueprint edge L5 → F1 ("uses AdicCoefficientsAndComparisons:L5/de-jong-6-5-strictly-semistable-alteration") and then F1 → RD.0 → … → RD.5. So the edge adds no ancestors there (161 before and after). On the RS graph RD.5's ancestors go from 50 to 142; the new ones are the étale-cohomology inputs of L5.
- Acyclicity. L5 → RD.5 passes every check listed under /4.

**Fix, as edits.**
1. `content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.5.
   - Replace "Develop the relative curve pushforward and relative local-monodromy input used in Kedlaya's proof, then devissage and alterations/descent." (occurs once) with "Develop the relative curve pushforward and relative local-monodromy input used in Kedlaya's proof. Then do the dévissage: finite étale pushforward from the open dense affines of RD.3's cover theorem (Kedlaya, Finiteness, Proposition 9.1.2, at a smooth point and in pure dimension); proper hypercoverings built from de Jong's alterations (Theorem 4.1, imported from AdicCoefficientsAndComparisons L5 as geometry only) with smooth terms over finite purely inseparable extensions of the base field; and cohomological descent of rigid cohomology along them (Tsuzuki; Chiarellotto–Tsuzuki for étale hypercoverings), proved here with its field-extension and coefficient hypotheses. The étale-cohomological descent of L5 does not supply it."
   - Replace "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`." (occurs once) with "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`, `AdicCoefficientsAndComparisons:L5`."
2. Same file, RD.3. After "Define restriction to convergent isocrystals and state full-faithfulness only in the proven source range; overconvergence at a boundary is real extra data." (occurs once) insert: "Prove Kedlaya's cover theorem. A separated, geometrically reduced k-scheme of finite type and pure dimension n contains, around any smooth point, an open dense affine that is finite étale over A^n_k (Kedlaya, More étale covers of affine spaces in positive characteristic, Theorem 2; Finiteness, Proposition 9.1.2, whose 'of dimension n' must read 'of pure dimension n'). RD.3's full faithfulness, RD.5's finiteness and duality, and RD.6's trace formula and weights use it."
3. data/atlas.json: add stageEdge AdicCoefficientsAndComparisons:L5 → PadicDifferentialEquationsAndRigidCohomology:RD.5, add L5 to RD.5.requires, and regenerate the RD.3 and RD.5 descriptions.
4. RD packet (for the RD blueprint job):
   - In RD.5/smooth-proper-hypercovering, replace the prerequisite AdicCoefficientsAndComparisons:L5 with AdicCoefficientsAndComparisons:L5/de-jong-4-1-alteration-field-case.
   - In its hypothesis, replace "requested from AdicCoefficientsAndComparisons:L5 together with the simplicial construction" with "imported from AdicCoefficientsAndComparisons:L5/de-jong-4-1-alteration-field-case (Theorem 4.1 and Remark 4.2); the coskeleton construction of the hypercovering (Tsuzuki, Section 4) is this node's".
   - Narrow the request to L5 to what the L5 node does not state: Kedlaya's finite purely inseparable form of the base-field extension, if Remark 4.2's "finite extension k_1" does not already give it.

**Not changed / open.**
- The proofs of Kedlaya's cover theorem (Lemmas 3–6 of the covers paper are read at node level) and of Tsuzuki's proper descent (not public; a recorded gap) remain proof interiors. The verifier said the same.
- SchemeAndStackFoundations:SF.4 also names alterations. The RD packet's restructure proposal asks SF.4 to import them from L5. That is outside this finding.

## /34 (medium, missing): the p-adic Grothendieck–Ogg–Shafarevich formula's two inputs, Christol–Mebkhout's index formula and Irr_x = Swan_x, have no nodes, and R01.3 does not reach RD.6

**The finding and the verdict.** Kedlaya's Weil II uses a p-adic Grothendieck–Ogg–Shafarevich formula, χ = χ(O)·rank − Σ[κ(x):k]·Swan_x. Its proof combines two theorems that nobody plans: Christol–Mebkhout's index formula with the irregularity Irr_x, and Irr_x = Swan_x (Crew, Matsuda, Tsuzuki). PadicDifferentialEquationsAndRigidCohomology:RD.6's phrase "conductor/radius estimates" names neither, and RD.6 has no conductor supplier (ArithmeticGaloisRepresentations:R01.3 is not upstream). The verifier confirmed, but "the proposed placement of the global index theorem at early RD.1 should be corrected. … Keep local differential irregularity and radii at RD.1, and put the global Euler-characteristic/index theorem after RD.4's cohomology, naturally in RD.6 (or a named intervening successor). Put the irregularity–Swan comparison there with RD.2's local-monodromy input. Add R01.3→RD.6, expanding its conductor construction to equal-characteristic local fields k((t)) when needed". The verifier also noted: "the original CM/Crew/Matsuda/Tsuzuki proofs were not read in this verification."

**Checked.**
- RD.6 (RD README): "Build the p-adic Fourier transform and conductor/radius estimates needed for Kedlaya's Weil II theorem." RD.6 requires only RD.5.
- Already on main. The RD packet has:
  - RD.6/swan-conductor-of-isocrystal, whose prerequisites include ArithmeticGaloisRepresentations:R01.3;
  - RD.6/grothendieck-ogg-shafarevich-formula (Kedlaya, Weil II, Theorem 4.4.1, p. 33), whose first proof step reads "Combine (a) the Christol–Mebkhout index formula χ = χ(O)·rank − Σ[κ(x):k] Irr_x(E) with (b) Irr_x(E) = Swan_x(E) (Crew, Matsuda, Tsuzuki); neither proof is publicly available here (recorded gap)";
  - the local invariants RD.1/highest-break, RD.1/break-decomposition and RD.1/differential-swan-conductor.

  The packet's gaps include "Christol-Mebkhout index theory and the comparison Irr = Swan are not planned in RD.1" (with "NEXT ACTION (lead): assign them to RD.2 … and RD.6 (index formula)") and "Proof of the p-adic Grothendieck–Ogg–Shafarevich formula". So neither input is a node. The local half is at RD.1, as the verifier wants.
- The packet's request to R01.3 on main asks for "an equal-characteristic local field E = κ((t)) with perfect residue field κ": breaks, the Swan conductor, integrality, independence of the finite quotient, and the Artin–Schreier break computation. R01.3's README text is "Define conductors using the ramification filtration …". Its accepted decomposition node R01.3/artin-conductor-with-its-wild-part is stated at a prime l of a number field ("choose an extension of the l-adic valuation to Qbar"). So R01.3 does not cover κ((t)).
- The packet also says: "Christol-Mebkhout's local index identifies Swan(E) with an index (Swan conductors I Remark 2.8.4; unread)". So equating Christol–Mebkhout's Irr_x with RD.1's differential Swan conductor is itself a step to be sourced.
- Acyclicity. R01.3 → RD.6 passes every check listed under /4. R01.3 depends only on R01.2 and R01.1.

**Fix, as edits.**
1. `content/campaign/PadicDifferentialEquationsAndRigidCohomology/README.md`, RD.6.
   - Replace "Build the p-adic Fourier transform and conductor/radius estimates needed for Kedlaya's Weil II theorem." (occurs once) with "Build the p-adic Fourier transform and the conductor/radius estimates needed for Kedlaya's Weil II theorem. Among them is the p-adic Grothendieck–Ogg–Shafarevich formula for an overconvergent F-isocrystal E on a smooth affine curve C: χ(C/K, E) = χ(C/K, O_C)·rank(E) − Σ_{x∈C̄∖C} [κ(x):k]·Swan_x(E) (Kedlaya, Weil II, Theorem 4.4.1). Prove it from two separately planned theorems of this stage. The first is Christol–Mebkhout's index formula, with the differential irregularity Irr_x of RD.1. The second is the equality Irr_x = Swan_x of the differential and Galois Swan conductors (Crew, Matsuda, Tsuzuki), which uses RD.2's local monodromy. Import the Swan conductors of the local monodromy representations over the equal-characteristic fields κ(x)((t)) from ArithmeticGaloisRepresentations R01.3."
   - Replace "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`." (occurs once) with "**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`, `ArithmeticGaloisRepresentations:R01.3`."
2. `content/campaign/ArithmeticGaloisRepresentations/README.md`, R01.3. After "Define conductors using the ramification filtration, prove independence of the finite quotient and auxiliary choices, integrality, and induction and twist formulas under their stated hypotheses." (occurs once) insert: "State the Swan conductor, its independence of the finite quotient and its integrality for finite-image representations of the absolute Galois group of any complete discretely valued field with perfect residue field. This includes the equal-characteristic fields κ((t)) at the boundary points of curves over finite fields, which PadicDifferentialEquationsAndRigidCohomology RD.6 uses. Include the Artin–Schreier break computation that RD.6 requests: for P ∈ κ[t^{-1}] of degree d prime to p, the character of κ((t))[u]/(u^p − u − P) has break d. The number-field statements of this stage are the other instance; they do not supply this one."
3. data/atlas.json: add stageEdge ArithmeticGaloisRepresentations:R01.3 → PadicDifferentialEquationsAndRigidCohomology:RD.6, add R01.3 to RD.6.requires, and regenerate the RD.6 and R01.3 descriptions.
4. RD packet (for the RD blueprint job):
   - a. New node PadicDifferentialEquationsAndRigidCohomology:RD.6/christol-mebkhout-index-formula (theorem).
     - Statement: for E an overconvergent F-isocrystal on a smooth irreducible affine curve C over k with smooth compactification C̄, χ(C/K, E) = χ(C/K, O_C)·rank(E) − Σ_{x∈C̄∖C} [κ(x):k]·Irr_x(E). Here Irr_x(E) is the differential Swan conductor (RD.1/differential-swan-conductor) of the restriction of E to the boundary annulus at x.
     - Prerequisites: RD.1/differential-swan-conductor, RD.1/break-decomposition, RD.4/rigid-cohomology, RD.5/finiteness-of-rigid-cohomology, RD.5/crew-finiteness-and-duality-on-curves.
     - Sources: Christol–Mebkhout, Invent. Math. 143 (2001), Corollaire 5.0-12 (not read), as cited in Kedlaya, Weil II, proof of Theorem 4.4.1.
     - The identification of Christol–Mebkhout's Irr_x with RD.1's invariant is its own proof step. Its source is Kedlaya, Swan conductors I, Remark 2.8.4 (not read).
   - b. New node PadicDifferentialEquationsAndRigidCohomology:RD.6/irregularity-equals-swan-conductor (theorem).
     - Statement: for E ∈ F-Isoc†(C/K) and x ∈ C̄∖C, Irr_x(E) = Swan_x(E), where Swan_x is RD.6/swan-conductor-of-isocrystal.
     - Prerequisites: RD.2/quasi-unipotence-and-local-monodromy-statement, RD.1/differential-swan-conductor, RD.6/swan-conductor-of-isocrystal, ArithmeticGaloisRepresentations:R01.3.
     - Sources: Crew, Math. Ann. 316 (2000), Theorem 5.4; Matsuda, Compositio 134 (2002), Theorem 8.6; Tsuzuki, Compositio 111 (1998), Theorem 7.2.2. These are cited as in Kedlaya, and none was read.
   - c. RD.6/grothendieck-ogg-shafarevich-formula.
     - Add the two nodes to its prerequisites.
     - Replace the proof step "Combine (a) the Christol–Mebkhout index formula χ = χ(O)·rank − Σ[κ(x):k] Irr_x(E) with (b) Irr_x(E) = Swan_x(E) (Crew, Matsuda, Tsuzuki); neither proof is publicly available here (recorded gap)." with "Combine RD.6/christol-mebkhout-index-formula with RD.6/irregularity-equals-swan-conductor."
   - d. Gaps.
     - Close "Christol-Mebkhout index theory and the comparison Irr = Swan are not planned in RD.1". Both are now RD.6 nodes. Kedlaya's overview Theorem 5.4.10 (highest break equals highest ramification break) stays open, for RD.2 or as a corollary in RD.6.
     - Narrow "Proof of the p-adic Grothendieck–Ogg–Shafarevich formula" to the unread proofs of Corollaire 5.0-12 and of Irr = Swan, with neededBy the two new nodes.

**Not changed / open.**
- The Christol–Mebkhout, Crew, Matsuda and Tsuzuki proofs, and Swan conductors I, Remark 2.8.4, are not read. The nodes are source-qualified requests, as the verifier says.
- Whether R01.3's integrality proof is Artin's theorem or Hasse–Arf in the equal-characteristic case is for R01.3's blueprint to fix.

## /35 (medium, error): DD.5 builds semiperfectoid covers with no supplier of perfectoid rings

**The finding and the verdict.** DerivedDeRhamCohomology:DD.5 plans the existence and refinement of semiperfectoid covers of the quasisyntomic site. A semiperfectoid ring is a quotient of a perfectoid ring, yet no prerequisite of DD.5 supplies perfectoid rings, directly or transitively. The finding adds PerfectoidQuotients:Q0:integral-algebra → DD.5. The verifier confirmed it: "Add Q0:integral-algebra → DD.5, importing the integral/Tate and completion distinctions. Preserve DD.5's elementary compatible-root covers; Q3's stronger André extension theorem must remain downstream, not become an input."

**Checked.**
- DD.5, README lines 166–170: "prove existence/refinement of the semiperfectoid covers used by BMS2. The elementary compatible-root cover construction is the independent BMS2 §4 argument; the stronger absolutely-integrally-closed perfectoid extension theorem belongs to PerfectoidQuotients Q3 and is not an input here." DD.5 requires DD.0, DD.1 and DD.2.
- PerfectoidQuotients:Q0:integral-algebra, README lines 28–31: "Construct integral perfectoid rings in the scope of BS22, their relation to Tate perfectoid rings and integral subrings … Keep the different notions of ordinary, derived p-adic and pseudouniformizer-adic completion separate." It requires DD.1, PerfectoidSpaces:P1 and P3.
- None of Q0:integral-algebra, Q0, P0, P1 or P3 reaches DD.5 on the base, RS or full graph, and DD.5 is not an ancestor of Q0:integral-algebra.
- BS22, arXiv:1905.08229v4, p.6, Theorem 1.12: "Let S be a semiperfectoid ring, i.e., S is a (derived) p-adically complete quotient of a perfectoid ring."
- PAPER-BHATT-MORROW-SCHOLZE-19 route 8 (accepted, to DD.5) includes /035: "S is quasiregular semiperfectoid if S ∈ QSyn, some perfectoid R maps to S, and S/p is semiperfect".
- Acyclicity, as in /2: the edge is acyclic, alone and jointly. DD.5's ancestors grow from 12 to 20 on base (adding Q0:integral-algebra, P0–P3, AdicEtaleGeometry A0–A1 and the ECD adic upstream), 13 to 35 with the RS links, and 13 to 60 on the full graph. Q3, which requires DD.5, already has Q0:integral-algebra as an ancestor.

**Fix, as edits.**
1. DerivedDeRhamCohomology:DD.5, README and atlas. After "theorem belongs to PerfectoidQuotients Q3 and is not an input here." (line 170) insert: "Import integral perfectoid rings in the scope of BS22, their relation to Tate perfectoid rings, and the distinctions between ordinary, derived p-adic and pseudouniformizer-adic completion from PerfectoidQuotients Q0:integral-algebra. A semiperfectoid ring is a derived p-adically complete quotient of such a ring (BS22 Theorem 1.12), and BMS2's quasiregular semiperfectoid rings receive a map from one."
2. PerfectoidQuotients:Q0:integral-algebra, README line 31 and atlas. After "the comparison lemmas needed when passing from a semiperfectoid quotient to a Tate ring." insert: "DerivedDeRhamCohomology DD.5 imports these rings for its semiperfectoid covers."
3. Stage edge: add PerfectoidQuotients:Q0:integral-algebra → DerivedDeRhamCohomology:DD.5.
4. research/blueprint/packets/DerivedDeRhamCohomology.json, coverage of DD.5. Replace "Prove the elementary compatible-root semiperfectoid covers/refinements and descent for cotangent powers and the specified filtered/completed de Rham object." with "Import integral perfectoid rings from PerfectoidQuotients:Q0:integral-algebra; prove the elementary compatible-root semiperfectoid covers/refinements and descent for cotangent powers and the specified filtered/completed de Rham object."

## /36 (medium, duplicate): the derived-versus-classical PD comparison is planned in both CR.0 and DD.4

**The finding and the verdict.** CrystallineCohomology:CR.0 plans the "comparison with the derived PD construction in the lci range" and cites Bhatt §3.3. DerivedDeRhamCohomology:DD.4 plans Bhatt Theorem 3.27, and CrystallineCohomology:CR.2 already names DD.4 as its owner. CR.0 also cannot prove a comparison with derived de Rham cohomology: it requires only DD.1 and reaches neither DD.2 nor DD.3. The verifier confirmed it: "Put this cited comparison in DD.4, retaining flat Z/p^n and regularity conditions, and keep the classical envelope/base-change lemmas in CR.0." It also said: "Do not identify every animated/derived PD construction with derived de Rham by terminology alone: any independently intended derived-envelope theory needs its own explicit definition and proof rather than being silently deleted."

**Checked.**
- CrystallineCohomology:CR.0, README lines 40–41: "Prove explicit envelopes for polynomial regular immersions and comparison with the derived PD construction in the lci range." Line 50: "Bhatt derived de Rham §3.3." CR.0 requires DD.1 only and reaches neither DD.2 nor DD.3 on the base, RS or full graph.
- DD.4, README lines 145–146: "Prove Bhatt Theorem 3.27 for lci maps of flat Z/p^n algebras/schemes". CR.2, lines 94–95: "DD.4 owns the additional derived-de-Rham-to-crystalline comparison for flat lci Z/p^n maps".
- Bhatt, arXiv:1204.6560v1. Lemma 3.37 (p.16): for a quotient of F_p-algebras by a regular sequence, "DA(I) ≃ A⟨x1, …, xr⟩/(x1 − f1, …, xr − fr) ≃ ⊗i A⟨x⟩/(x − fi) ≃ ⊗i DA(fi) where all tensor products are derived". Lemma 3.38 (p.16): for flat Z/p^n-algebras, D_A(I) "is Z/pn-flat, and its formation commutes with reduction modulo p". Lemma 3.39 (p.17): crystalline cohomology of an lci map of flat Z/p^n-algebras commutes with reduction mod p, by Berthelot's theorem. Corollary 3.40 (p.17). Remark 3.43 (p.18): "In [Bhab], we will define a notion of a 'derived pd-envelope' LDA(I) of an arbitrary ideal".
- RS-01 (accepted) keeps CR.0. Its owners entry for CR.0 reads: "The shared PD-envelope construction of A_cris, its source-qualified completion and canonical PD coefficient maps; this is not the derived-de-Rham or prismatic comparison theorem." No entry names an owner for this comparison.
- CR packet. CR.0's coverage: "Import DD.0/1 for the derived PD comparison and derived completion, with lci and torsion/boundedness hypotheses." The gap "PD filtrations, derived comparison, completion and Fontaine specialization" ends "preserve the p=2 distinctions and lci/torsion/boundedness hypotheses in derived comparisons." The sourceInventory entry "Bhatt derived de Rham§3.3" has status "Envelope/derived comparison remains required; not read here".
- A search of all atlas stage descriptions for "derived PD", "animated PD", "derived pd" and "derived divided" finds only CR.0's phrase and DD.2's "derived divided-power terms". No stage uses a derived PD envelope of an arbitrary ideal.
- No stage-graph change: CR.0 reaches DD.4 through CR.1 → CR.2 → DD.4.

**Fix, as edits.**
1. CrystallineCohomology:CR.0, README lines 40–41 and atlas. Replace "Prove explicit envelopes for polynomial regular immersions and comparison with the derived PD construction in the lci range." with "Prove explicit envelopes for regular immersions: for a quotient A → A/I of F_p-algebras with I generated by a regular sequence f_1, …, f_r, D_A(I) ≅ A⟨x_1, …, x_r⟩/(x_1 − f_1, …, x_r − f_r) ≅ ⊗_i D_A(f_i), with derived tensor products (Bhatt Lemma 3.37); for flat Z/p^n-algebras, D_A(I) is Z/p^n-flat and its formation commutes with reduction modulo p (Lemma 3.38). Export these to DerivedDeRhamCohomology DD.4, which owns their comparison with derived de Rham cohomology."
2. CR.0 sources (README line 50 and atlas). Replace "Bhatt derived de Rham §3.3." with "Bhatt derived de Rham Lemmas 3.37–3.38."
3. DerivedDeRhamCohomology:DD.4, README and atlas. After "Prove Bhatt Theorem 3.27 for lci maps of flat Z/p^n algebras/schemes, preserving flatness and finiteness conventions." (lines 145–146) insert: "DD.4 is the only owner of the comparison between the derived de Rham cohomology of a quotient and its classical PD envelope. Prove first Corollary 3.40 (A → A/I a quotient of flat Z/p^n-algebras with I generated by a regular sequence), with Lemma 3.39 (for an lci map of flat Z/p^n-algebras, crystalline cohomology commutes with reduction modulo p), and then Theorem 3.27. Import the explicit envelopes, their flatness and their reduction modulo p (Lemmas 3.37–3.38) from CrystallineCohomology CR.0."
4. research/blueprint/packets/CrystallineCohomology--CR.0.json.
   - CR.0 coverage: replace "Import DD.0/1 for the derived PD comparison and derived completion, with lci and torsion/boundedness hypotheses." with "Import DD.1 for derived completion, with torsion/boundedness hypotheses. The comparison of derived de Rham cohomology with the classical envelope (Bhatt Corollary 3.40, Theorem 3.27) belongs to DD.4, which imports this stage's explicit envelopes (Bhatt Lemmas 3.37–3.38)."
   - Gap: replace "preserve the p=2 distinctions and lci/torsion/boundedness hypotheses in derived comparisons." with "preserve the p=2 distinctions and the regular-sequence, flatness and torsion hypotheses of Bhatt Lemmas 3.37–3.38."
   - sourceInventory, "Bhatt derived de Rham§3.3": set status to "Lemmas 3.37–3.38 required here; Corollary 3.40 and Theorem 3.27 belong to DD.4; not read here".
5. research/blueprint/packets/DerivedDeRhamCohomology.json, coverage of DD.4. Replace "Read and decompose Bhatt Theorem 3.27 and §§3.3,8–9 completely, with the lci and flat Z/p^n hypotheses." with "Read and decompose Bhatt Theorem 3.27 and §§3.3,8–9 completely, with the lci and flat Z/p^n hypotheses, including Lemma 3.39 and Corollary 3.40; import Lemmas 3.37–3.38 from CrystallineCohomology:CR.0."
6. Owners entry: `{"target": "Comparison of the derived de Rham cohomology of a quotient of flat Z/p^n-algebras with its classical PD envelope: Bhatt Lemma 3.39, Corollary 3.40 (regular-sequence quotients) and Theorem 3.27 (lci maps)", "owner": "DerivedDeRhamCohomology:DD.4", "formerly": ["CrystallineCohomology:CR.0"]}`

**Not changed / open.** Nothing in the atlas plans a derived PD envelope of an arbitrary ideal (Bhatt Remark 3.43 announces one for a later paper), and no stage uses one. Edit 1 removes only the lci comparison, which DD.4 now owns. If a stage later needs such an envelope, it needs its own definition, proof and owner.
## Cross-finding adjustments (joint check)

The joint pass read all sections together and applied every change at once, including the changes of RT-AREA-padic-1 that these fixes build on. It found no cycle, and nine conflicts, each resolved below. A tenth conflict (C10) was already resolved within one section. In this part, H1–H5 name the five groups of sections:

- H1 = /1, /9, /10, /11, /13, /15, /17;
- H2 = /2, /7, /8, /12, /14, /16, /35, /36;
- H3 = /6, /24–/30;
- H4 = /3, /18–/23;
- H5 = /4, /5, /31–/34.

### C1. PadicHodgeTheory:R06.1:tate-sen is defined twice (/20 and /5)

The two definitions differ in title ("Tate–Sen theory of C_K" and "Galois cohomology of C (Tate–Sen)"), inputs (H4: R01.1 and Layer 3; H5: Layer 3 only), outputs (H4: R06.1; H5: R06.1, R07.1, R28.2), the R06.1 sentence and its anchor, and node ids. H4 renames the moved P7-packet nodes to PadicHodgeTheory:R06.1:tate-sen/<suffix>. H5 keeps their ids, and its /5 edit 7 cites PadicHodgeTheory:R06.1/tate-sen-theorem. H4 splits Tate's character criterion into a new node; H5 adds it to R06.1/tate-sen-theorem. H4's Checked says "No edge to R28.2 is added"; H5 adds it.

Resolution: /20 (H4) owns the stage; /5 (H5) imports it.

1. Stage object: id PadicHodgeTheory:R06.1:tate-sen, owner PadicHodgeTheory, key "R06.1:tate-sen", parentStageId PadicHodgeTheory:R06.1, title "Tate–Sen theory of C_K", requires [ArithmeticGaloisRepresentations:R01.1, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration], consumers [PadicHodgeTheory:R06.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, FaltingsFinitenessAndIsogenyTheorems:R28.2]. Set R06.1's isLeaf to false.
2. Edges, five: R01.1 → R06.1:tate-sen, Layer 3 → R06.1:tate-sen and R06.1:tate-sen → R06.1 (listed under /20); R06.1:tate-sen → R07.1 and R06.1:tate-sen → R28.2 (listed under /5). All five are in the joint check above.
3. README text: /20 edit 1, placed as it says, with five changes:
   - "Prove, following Brinon–Conrad §§2.2, 13–14 and Tate (1967, §3):" becomes "Construct the continuous isometric G_K-action on C_K. Prove, following Brinon–Conrad §§2.2, 13–14 and Tate (p-divisible groups, 1967, §3):".
   - "Tate's trace estimate for the cyclotomic Z_p-extension, and Tate's normalized traces" becomes "Tate's trace estimate (almost-surjectivity of traces) for a ramified Z_p-extension, in particular the cyclotomic one, and Tate's normalized traces". Tate's Theorem 2 needs the Z_p-extension cut out by the character, not only the cyclotomic one.
   - "with semilinear Hilbert 90;" becomes "with semilinear Hilbert 90 and completed unramified descent;".
   - "the Tate–Sen theorem (Brinon–Conrad Theorems 2.2.7 and 14.3.4):" becomes "the Tate–Sen theorem (Tate 1967, §3.3, Theorems 1–2; Brinon–Conrad Theorems 2.2.7 and 14.3.4):".
   - "FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 import Tate's Theorem 2 from here." becomes "FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 imports Tate's Theorem 2 from here for Tate's Hodge–Tate decomposition of p-divisible groups; R07.2 reaches it through R07.1."
4. R06.1's text: /20 edits 2a and 2b. Do not apply /5 edit 1's sentence after "Construct B_dR^+, its filtration and B_dR, B_cris^+, B_cris and B_st from those same objects.". That anchor also receives padic-1/20 edit 1b, and the sentence repeats 2a. Do not apply H5's README insertion either; its anchor, the full R06.1 Dependencies line, is changed by /20 edit 2b.
5. P7 packet, /20 edit 5: replace "Re-parent these nodes to R06.1:tate-sen, with ids PadicHodgeTheory:R06.1:tate-sen/<suffix>:" with "Re-parent these nodes to R06.1:tate-sen, keeping their ids (set parentStageId and realises to PadicHodgeTheory:R06.1:tate-sen):". The build resolves a cross-roadmap prerequisite through the node's parentStageId, not its id prefix (scripts/blueprints.py, atlas_layer and layer_of), and check_blueprint.py needs only the roadmap prefix. Keeping ids keeps /5 edit 7's prerequisite PadicHodgeTheory:R06.1/tate-sen-theorem, the FiniteFlat request, and padic-1/20's citation of R06.1/cp-integers-p-adically-complete valid. The new node for the character criterion keeps H4's id, PadicHodgeTheory:R06.1:tate-sen/tate-character-criterion, since nothing cites it yet.
6. /5 edit 3: replace the whole edit with "P7 packet: as RT-AREA-padic-2/20 edit 5. The corollary C(ψ) ≅ C(k) ⇔ ψχ^{-k} finite on inertia is the node PadicHodgeTheory:R06.1:tate-sen/tate-character-criterion there; do not add it to R06.1/tate-sen-theorem." Replace /5 edit 2's stage object with "the stage PadicHodgeTheory:R06.1:tate-sen of RT-AREA-padic-2/20", keeping its two out-edges, "Add R06.1:tate-sen to the requires of R07.1", and the R07.1 Dependencies line.
7. /20 Checked: replace "No edge to R28.2 is added." with "The direct edge R06.1:tate-sen → R28.2 is added under /5, where it records the node link L2."
8. Follow-up, no conflict: PAPER-FARGUES-FONTAINE-18 route 3 brief says "PadicHodgeTheory R06.1 (Tate–Sen theory and semilinear Galois descent)" (once). Its review should read "PadicHodgeTheory R06.1:tate-sen (Tate–Sen theory and semilinear Galois descent)".

### C2. The Faltings gap: one edit rewrites text that another deletes

/20 edit 7 replaces "Theorem 2 (a character whose C-realization is C(+k) is chi_0^k up to finite order)" inside the gap "Tate, p-divisible groups (Driebergen 1966) is absent from the supplied library" of data/decompositions/FaltingsFinitenessAndIsogenyTheorems.json. /5 edit 8 removes that gap. I checked that the gap contains the quoted phrase.

Resolution: apply /5 edit 8 and drop /20 edit 7. The corrected reading of Tate's Theorem 2 survives in /5 edit 8's new first proof step of R28.2/local-differential-computation-for-the-l-divisible-tower and in its links L1–L3. /20 edit 6 (the FaltingsFinitenessAndIsogenyTheorems packet's requests[23]) is a different file and stays.

### C3. PR.7's Kisin sentence is replaced twice, and Kisin's full-faithfulness theorems get two owners

Both /30 edit 2c and /4 edit 4 replace "Compare evaluation on the Breuil–Kisin prism with R07's Kisin functor, including uniformizer dependence and full faithfulness in the source range." with different texts. Beyond wording, H3 has PR.7 prove Bhatt–Scholze Theorem 7.2, Theorem 7.9 and Corollary 7.10, which it identifies as Kisin's Proposition 2.1.12, Corollary 1.3.15 and Corollary 2.1.14. /4 has R07.4 prove the same three results, with Kisin's proofs: full faithfulness of 𝔐 ↦ 𝒪_ℰ ⊗ 𝔐 with the 2008 erratum, the functor to 𝔖-modules of finite E-height, and Corollary 2.1.14. Finding /4's fix (item 4) and the FiniteFlat packet on main (kisin-etale-full-faithfulness, crystalline-restriction-full-faithfulness) put them in R07.4.

Resolution: R07.4 owns the three results. PR.7 identifies the functors and imports the results. Replace the quoted sentence of PR.7 with this, and drop /4 edit 4:

"Identify evaluation on the Breuil–Kisin prism, D_𝔖, with the Kisin lattice functor of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (the 𝔖-lattice of finite E-height attached to a G_{K_∞}-stable lattice in a crystalline representation), which Bhatt–Scholze leave open in Remark 7.11, and prove its independence of the uniformizer (Remark 7.12). Bhatt–Scholze Theorem 7.2, Theorem 7.9 and Corollary 7.10 are Kisin's Proposition 2.1.12 (with his 2008 erratum), Corollary 1.3.15 and Corollary 2.1.14, which R07.4 plans; import them through this identification for full faithfulness in the source range, and do not prove them a second time from the main theorem."

In /30's verdict paragraph, replace the second correction bullet with "Bhatt–Scholze also prove Kisin's full faithfulness results (Theorem 7.9, Corollary 7.10) from their main theorem. They are planned once, in R07.4 (RT-AREA-padic-2/4), and PR.7 imports them through the identification of Remark 7.11." The edge R07.4 → PR.7 is listed once, under /4. If the maintainer prefers Bhatt–Scholze's proofs instead, R07.4's text must drop the three results and the two packet nodes must move to PR.7. That is the larger edit.

### C4. AI.5: one anchor is replaced by another edit, and the BKF sentence is written twice

/11 edit 4 inserts before "Sources: BMS1 §§4,14 and Theorems 1.1,1.8.". /3 edit 5b replaces that sentence. Applied after H4, H1's anchor no longer exists. Both drafts also add a sentence on the BKF property.

Resolution, in this order:
1. /3 edit 5a, without its last sentence "The BKF property uses it with Corollary 4.20.". The inserted paragraph then ends "…including derived p-completion where used."
2. /11 edit 4 as written, before "Sources: BMS1 §§4,14".
3. /3 edit 5b.

The end of AI.5 then reads: "…why a length inequality is not a subquotient theorem. The BKF property uses BMS1 Corollary 4.20 with comparisons (iii) and (iv) and Proposition 13.21, imported from CrystallineCohomology CR.3:Frobenius-isogeny (proof of BMS1 Theorem 14.3, p. 120). Sources: BMS1 §§4,14, Theorem 5.7 and Theorems 1.1,1.8."

### C5. AI.6: two insertions at one anchor, next to a third edit

/14 edit 3 and /3 edit 6 both insert after "algebraically closed and the induced Witt extension.", and /13 edit 2 replaces the sentence that follows. The contents agree; only the order is undefined.

Resolution: apply them in this order. The paragraph then reads:

"Prove derived comparisons with log de Rham, Hyodo–Kato/log crystalline, A_cris and étale cohomology, keeping track of which residue field has been algebraically closed and the induced Witt extension. The A_cris comparison uses the integral quasi-coherent log structures on O_C/p and A_cris/p^n and the log crystalline site of Beilinson §1.12 (CK §§5.2–5.3), imported from CrystallineCohomology CR.5:quasi-coherent. The étale comparison (CK Theorem 2.3) and the perfectness of RΓ_ét(X^ad_C, A_inf) ⊗^L B_dR^+ in the proof of CK Proposition 6.8 use Scholze's primitive comparison. Import it from PadicHodgeTheory P8:primitive, through AI.5's BMS1 Theorem 5.7 (which CK cite as [BMS18, 5.6]). [/13 edit 2's replacement text.] The semistable rational comparison is assembled in CP.4 using these maps."

### C6. The prismatic logarithm has two owners

/28 makes PR.3 the owner of "the prismatic logarithm (Bhatt–Lurie §2)" (edit 2a and its owners entry). /23 edit 4 has PR.4 construct "the prismatic logarithm and G_m-coefficient class (§§7.1–7.2)" and calls PR.4 "their one owner". In Bhatt–Lurie v1, §2 is "Breuil-Kisin Twists and the Prismatic Logarithm". §7.1 is "The Logarithm Sequence" (Theorem 7.1.1, on A_crys) and §7.2 is "Cohomology with G_m-Coefficients". §7 says: "In §7.5, we use the prismatic logarithm of §2 to construct a map c_1^syn".

Resolution: PR.3 owns the prismatic logarithm. In /23 edit 4, replace "the prismatic logarithm and G_m-coefficient class (§§7.1–7.2)" with "the logarithm sequence (§7.1, Theorem 7.1.1) and cohomology with G_m-coefficients (§7.2), using the prismatic logarithm of Bhatt–Lurie §2 imported from PR.3". PR.3 → PR.4 exists, so no edge changes.

### C7. Bhatt–Lurie §§9.1–9.2 have two owners

/6 edit 2 puts "the syntomic calculations of §9" in PR.4's Sources, and /28 edit 5's owners entry gives PR.4 the "syntomic calculations (Bhatt–Lurie Construction 7.4.1, §§8–9; …)". /23 edit 3 makes "the syntomic projective bundle formula and higher Chern classes (Bhatt–Lurie Theorem 9.1.1 and Construction 9.2.1 …)" explicit targets of CP.6. The /23 verdict asks to "retain the BL §9 splitting/projective-bundle work … as explicit targets", and CP.6's text on main already plans higher classes and projective bundle formulas.

Resolution: CP.6 owns §§9.1–9.2.
- In /6 edit 2, replace "Bhatt–Lurie §§7–9 (Construction 7.4.1, §8 with Construction 8.4.1, and the syntomic calculations of §9)" with "Bhatt–Lurie §§7–8 (Construction 7.4.1, §8 with Construction 8.4.1); the projective bundle formula and higher Chern classes of Bhatt–Lurie §§9.1–9.2 are CohomologyComparisons CP.6's".
- In /28 edit 5's third owners entry, replace "their étale comparison and syntomic calculations (Bhatt–Lurie Construction 7.4.1, §§8–9; BS22 §14; BMS2 §7.4)" with "and their étale comparison (Bhatt–Lurie Construction 7.4.1 and §8; BS22 §14; BMS2 §7.4)".
- In /28, change "The Sources change to 'Bhatt–Lurie §§7–9' is /6 edit 2." and "This section only moves §§7–9 into PR.4's sources" to "§§7–8".

§§9.3–9.4 (BGL_m, the blowup formula) are claimed by neither draft and no stage text needs them.

### C8. Kedlaya's theorem, the extended Robba ring and FF Corollaire 11.2.22(1): owners overlap across H1, H3, H4 and H5

- Kedlaya's theorem (SW20 Theorem 13.4.1, "[Ked04]"): /1 edit 3 plans it in VB2:classification, and its owners entry names that stage. The RD packet on main plans the same theorem as RD.1/dieudonne-manin-over-extended-robba-ring (source "kedlaya-monodromy-2003, Theorem 4.16"). /4 edit 5c and /30 ("planned at RD.1/P7") rely on RD.1. H1 itself leaves the choice open ("Record whether Theorem 13.4.1 is derived … or proved as in [Ked04]").
- The extended Robba ring: /31's new RD.0 text constructs "the extended Robba ring" (packet node RD.0/extended-robba-ring, R^alg = Γ^alg_an,con). /1 edit 3 has VB2:classification "Include the extended Robba ring of Definition 13.4.3". /19 edit 5 moves P7/extended-robba-ring-with-galois-action (Berger's B̃†_rig) to R06.3.
- FF Corollaire 11.2.22(1): /1 puts "the translation of FF18 §11.2 (Proposition 11.2.20, Corollaire 11.2.22)" in VB2:classification. /30 says it "has no atlas owner yet", requests it from a VectorBundlesAndIsocrystalsPartII stage, adds an export sentence to FF18 route 3's brief, and adds a placeholder edge to PR.7. SW20 (p. 111) gives this translation as the link between Kedlaya's statement over R̃ and φ-modules over Y_[r,∞), so AI.2:essential-surjectivity and PR.7 need the same statement.

Resolution. RD.1 owns Kedlaya's theorem, RD.0 owns Kedlaya's ring, and VB2:classification owns the §11.2 translation for both consumers.
1. /1 edit 3: replace "First, Kedlaya's theorem: every φ-module over Y_[r,∞) is M ⊗_L O_{Y_[r,∞)} for an isocrystal M over L = W(k)[1/p] (SW20 Theorem 13.4.1, [Ked04]). Include the extended Robba ring of Definition 13.4.3 and the translation of FF18 §11.2 (Proposition 11.2.20, Corollaire 11.2.22). Second, restriction" with "First, form the extended Robba ring R̃ of SW20 Definition 13.4.3 as the colimit of sections on the charts Y_(0,r] of RelativeFarguesFontaine RF0, and prove the translation of FF18 §11.2 (Proposition 11.2.20, Corollaire 11.2.22(1)): φ-modules over R̃ and over Y_[r,∞) are vector bundles on X_FF. Kedlaya's theorem itself (SW20 Theorem 13.4.1, [Ked04] Theorem 4.16) is PadicDifferentialEquationsAndRigidCohomology RD.1's and is not proved here. Second, restriction". Delete "Record whether Theorem 13.4.1 is derived from the classification above through the §11.2 translation or proved as in [Ked04].". Replace "Export these statements to AInfCohomology AI.2:essential-surjectivity." with "Export these statements to AInfCohomology AI.2:essential-surjectivity and PrismaticCohomology PR.7."
2. /1 edit 2a: replace "Import these from VectorBundlesAndIsocrystals VB2:classification, and the isocrystals from VB0" with "Import Theorem 13.2.1, Lemma 13.3.1, Proposition 13.3.2 and the §11.2 translation from VectorBundlesAndIsocrystals VB2:classification, and Kedlaya's theorem from PadicDifferentialEquationsAndRigidCohomology RD.1 (node dieudonne-manin-over-extended-robba-ring). Identify VB2:classification's R̃ with RD.0's R^alg for ℓ = C♭. Import the isocrystals from VB0".
3. /1 edit 7: the owners target becomes "The extension of φ-modules over the crystalline point x_L and the translation to the extended Robba ring (SW20 Theorem 13.2.1, Lemma 13.3.1, Proposition 13.3.2, Definition 13.4.3; FF18 Théorème 11.1.9, Théorème 11.1.12, Corollaire 11.1.13, Proposition 11.2.20, Corollaire 11.2.22(1))".
4. New edge PadicDifferentialEquationsAndRigidCohomology:RD.1 → AInfCohomology:AI.2:essential-surjectivity, under /1. It is acyclic on every graph. It adds RD.0, RD.1 and AdicSpacesPartII:F1 to that stage's ancestors (143 → 146 on base, 174 → 177 with RS). It adds two more on the full graph, L5 and H5 through F1.
5. /30 edit 2b: replace "- the identification of φ-modules over the extended Robba ring with bundles on X_FF (FF Corollaire 11.2.22(1));" with "- the identification of φ-modules over the extended Robba ring with bundles on X_FF (FF Corollaire 11.2.22(1)), from VectorBundlesAndIsocrystals VB2:classification (RT-AREA-padic-2/1);". Replace "The two FF statements have no atlas owner yet." with "FF Proposition 10.5.6 has no atlas owner yet.". Delete the first request in edit 3 (VectorBundlesAndIsocrystalsPartII), the route 3 bullet in edit 4, and the placeholder edge VectorBundlesAndIsocrystalsPartII → PR.7 from the json block. VB2:classification → PR.7 is already in the block.
6. /19 edit 5: add "The node extended-robba-ring-with-galois-action takes the ring from PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring for ℓ = C_K^♭, which it lists as a prerequisite, and keeps only the G_K-action and Berger's notation B̃†_rig." RD.0 is already an ancestor of R06.3. RD.0's node is stated for the completed algebraic closure of k((t)). The RD blueprint job should state it for any complete algebraically closed field of characteristic p, with C^♭ and C_K^♭ as instances.
7. /1 "Not changed / open": add /1084 (Corollaire 11.2.22(1)) to the FF18 items its review should mark planned at VB2:classification. PAPER-FARGUES-FONTAINE-18/74 (Kedlaya's Dieudonné–Manin), planned at [RD.1, P7], should be planned at [RD.1] only once /19 empties P7 of the extended Robba ring.

Strict alternative: one construction of the ring, with VB2:classification importing R^alg from RD.0 through an edge RD.0 → VB2:classification. It is acyclic, but it costs 3 ancestors on base and 62 on the full graph (through RD.0's input F1), inherited by all of VB2:classification's descendants. The recommended form uses no new carrier: R̃ is a colimit of RF0's sections, identified with R^alg in the one stage that uses both.

### C9. Kedlaya's lemma is planned twice inside padic-1, and /30 imports both copies

BMS1 Lemma 4.6 ("all vector bundles on U [= Spec A_inf ∖ {s}] are free") is the case K⁺ = O_{C♭} of SW20 Proposition 14.2.6 (Berkeley Lectures, Remark 14.2.5, p. 119: "In fact, the same proof shows the following slightly more general result"). padic-1/18 plans Proposition 14.2.6 in RF0:crystalline-end, and padic-1/19 edit 1b lists Lemma 4.6 among AI.2's sources (BMS1 uses it for Proposition 4.13). /30 edit 2b imports "BMS1 Lemma 4.6, from AI.2" next to "SW20 Theorem 14.2.1 … from RF0:crystalline-end".

Resolution for the drafts: in /30 edit 2b, replace "- BMS1 Lemma 4.6, from AI.2;" with "- BMS1 Lemma 4.6 (vector bundles on Spec A_inf ∖ {s} are free), the case K⁺ = O_{C♭} of SW20 Proposition 14.2.6, from RelativeFarguesFontaine RF0:crystalline-end;". For padic-1's cross-finding adjustments: AI.2 cannot import from RF0:crystalline-end without undoing /19. That edge adds 30 ancestors to AI.2 on base, 22 with RS and 43 on the full graph. A cheap single owner is AInfCohomology:AI.0:integral, which already precedes AI.2 (AI.0:integral → R06.1 → AI.2). It would own Proposition 14.2.6 with Lemma 4.6 as a case and export it to AI.2 and to RF0:crystalline-end through a new edge AI.0:integral → RF0:crystalline-end. That edge is acyclic and adds 12 ancestors to RF0:crystalline-end on base, 5 with RS and 2 on the full graph.

### C10. padic-1/24's AI.4 edits (already resolved by H4)

/3 withdraws padic-1/24's edge P8:primitive → AI.4 and replaces the AI.4 sentence that padic-1/24 edit 6 uses as its anchor. H4 already says: in /24 edit 2 replace AI.4 by AI.5, AI.6 and CP.4; do not apply /24 edit 6; change /24 edit 8(d) and edit 12. All the padic-1 anchors it quotes occur once in RT-AREA-padic-1.fixes.md. The maintainer must apply these amendments together with PR #4645. Otherwise AI.4 gets both the /24 sentence and H4's replacement.

### Checked, no conflict

- Other shared anchors are disjoint. AI.4: /2 edit 7 (paragraph 1) and /3 edit 4 (paragraph 3). PR.4: /6 edit 1 (paragraph 1), /25 (new paragraph after it), /28 edit 3 (a sentence of paragraph 2), /16 (after "…on every singular input.", which H3 keeps), /23 edit 4 (after "…arithmetic Chern/regulator consumers.") and /6 edit 2 (the Sources sentence). R07.2: /5 edit 5 and padic-1/26. T2: /5 edit 10 and padic-1/22 edits 3–4. R06.1: padic-1/20 edits 1a–1b, /20 edits 2a–2b and /21 edit 1 use different sentences once C1 drops H5's sentence. RF0:crystalline-end and AI.2:essential-surjectivity texts: /30 edit 5 and /1 edits 1–2 quote padic-1 strings that each occur once there.
- Single owners are consistent across the drafts: Koszul complex DD.1 (/15; H2 defers to it), ordinary de Rham complex DD.0 (/2; /15 cites it), classical Cartier DD.3 (/12; /26 imports it), θ-kernel P1 (/17 and /21), B_dR⁺(C) R06.1 (padic-1/20, /17, /21), corrected pro-étale covers A1 (AI.3 uses them in /9; P8:primitive imports them in /3; A1's text on main plans them), BMS1 Proposition 13.21 CR.3:Frobenius-isogeny (/11; cited in /1), SW20 Theorem 14.2.1 RF0:crystalline-end (/1 and /30 edit 5), Kedlaya's slope filtration RD.1 by text, with the node in RD.2 until low finding /44 (/18, /4).

## Order of application

1. padic-1's atlas edits, with /3's amendments to /24 (C10) and /30 edit 5 on /18.
2. /20 before /5 (C1). Then the other new stages: CR.5:quasi-coherent, LP1:stacks.
3. AI.5 in the order of C4. AI.6 in the order of C5. PR.7 with the single text of C3. PR.4 in the order listed under "Checked".
4. Stage edges, including RD.1 → AI.2:essential-surjectivity (C8). Omit the placeholder VectorBundlesAndIsocrystalsPartII → PR.7 and list the three shared edges once.
5. Packets, decompositions and paper routes: C1 item 5 and C2 first, since other edits cite the kept node ids.
