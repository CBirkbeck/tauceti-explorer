# Handoff: BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4

Issue #718. Worker: Claude (Claude Opus 5.5), session claude-d0gQRk, 2026-10-14. Branch `claude-d0gQRk-blueprint-718`.

## Scope decision

The issue lists ET.4, ET.5, ET.6, ET.6a, ET.7, ET.7a and ET.7b. After the issue was written, the queue split ET.6a–ET.7b off into job BP-EndoscopicTransferAndUnitaryTraceComparison--ET.6a (issue #9408), whose packet is complete and submitted. This job therefore plans **ET.4, ET.5 and ET.6**. All seven stage ids are in the packet's `scope`, as the issue asks, but ET.6a–ET.7b have coverage `planned` with a note pointing to the ET.6a packet; this packet adds no node for them. Their `remaining` lists name the repoints the ET.6a packet needs so that it cites this packet's nodes instead of the stage ids ET.4, ET.5 and ET.6.

RS-19 is accepted. It keeps ET.4, ET.5 and ET.6 and drops ET.2a:duality-perversity, so ET.5 imports EDC.5, EDC.6 and LPV.6 directly.

## What is done

The packet is `status: complete` at target granularity with 66 nodes: 8 definitions, 10 constructions, 44 theorems and 4 applications. It has 121 API items, 72 unit tests, 17 planets (6 in ET.4, 5 in ET.5, 6 in ET.6), 1 baseline declaration, 9 requests, 5 gaps and 1 source issue. `check_blueprint.py` reports 0 errors and 0 warnings. ET.4, ET.5 and ET.6 are `planned`, and every target of each stage text is a node; the coverage notes map the targets to the nodes.

- **ET.4** (24 nodes):
  - p-adic characters and twisted characters.
  - Kottwitz's Tamagawa formula, with the values for G_n⃗ and 𝒢_n⃗.
  - ST^H_e and ι(G,H), and Kottwitz's elliptic stabilization.
  - Base-change groups and L-morphisms.
  - Unramified, split-place, bad-place and small-level (N_0) transfers.
  - Archimedean Euler–Poincaré and Lefschetz functions for arbitrary signature.
  - The invariant twisted trace formula, cuspidal subsets and their absence for [F⁺:ℚ] ≥ 2.
  - The twisted geometric and spectral sides, and the stable–twisted identity.
  - The simple trace formula for division-algebra unitary groups.
  - **Proposed sub-layer ET.4b:** local and global cyclic base change, cyclic automorphic induction, and unitary–GL_n base change and descent.
  - The unitary endoscopic classification and GSp_4–GL_4 transfer, each with a dependency gap.
- **ET.5** (14 nodes):
  - Acceptable test functions, and the Fujiwara–Varshavsky application to Igusa correspondences.
  - Kottwitz triples, p-adic types, and fixed points ↔ effective triples.
  - Shin's counting formula, and stabilization away from p.
  - Endoscopy of J_b via M_b, and the transfer at p (with the modulus twist of CS17 erratum E74).
  - The endoscopic test functions φ^H and Shin's stable formula.
  - Density of acceptable functions, and the unitary specialisation for ET.7b.
- **ET.6** (28 nodes):
  - Segments, the Zelevinsky and Langlands classifications, AKY truncation and ladders (plus the constituent theorems), and Tadić's unitary dual.
  - Weil–Deligne blocks σ ⊗ Sp_k and the characterizing properties.
  - Scholze §§2–14 node by node:
    - deformation spaces with Drinfeld level, test functions φ_{τ,h}, norm maps, descent, and the comparison of two functions;
    - division-algebra Shimura varieties and their Drinfeld-level point count;
    - the global Galois input, the characterization theorem, the Lubin–Tate comparison and bijectivity;
    - non-Galois induction and L/ε of pairs.
  - The full Weil–Deligne correspondence with monodromy, and semisimple parameters.
  - Jacquet–Langlands, Badulescu's LJ map, the non-transfer obstruction, and the level-zero case.

The suggested file `research/blueprint/suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.4.lean` **compiled**. `lean-check` at Mathlib 082e2d3 (Tau Ceti f790474 environment) reports `sorry` as the only warning, and `scripts/check_sorry_data.py` passes. Following the WORKERS shape rule, it prototypes only carriers that exist at the pins:
- integer-line segments, linking, truncation and ladders;
- the special Weil–Deligne block Sp_k as matrices, with its covariance;
- acceptability of slope valuations;
- the Kottwitz sign of inner forms, the unitary component count and ι(G,H).

Everything else is a README target.

## Red-team findings handed to this job

Handling is recorded per finding in the packet's `redTeamFindings`:
- **RT-AREA-langlands-1/1:** the cyclic base change, induction and unitary base change needed by Scholze §§10–14 are planned in ET.4 as the proposed ET.4b, before ET.6. Harris's non-Galois induction and Henniart's twisting are explicit ET.6 nodes.
- **1/2:** Fujiwara–Varshavsky is imported from `EDC.8/fujiwara-varshavsky-trace-formula`. ET.5 keeps only the Igusa application.
- **1/5:** Honda–Tate and Tate's theorem come from `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate` and `F0/tate-hom`.
- **1/10:** Kottwitz's Tamagawa formula is an ET.4 node, which ET.5 reuses.
- **1/13:** the "unproved twisted FL" wording is replaced; the route does not need the twisted fundamental lemma.
- **1/15:** the early p-adic character prefix is planned in ET.4 (see restructure proposal 2).
- **padic-1/25:** not an ET.4–ET.6 matter; ET.6 uses only finite-level deformation spaces.
- **geomlanglands/2:** owned by ET.6a in the ET.6a packet.
- **geomlanglands/32:** ET.5 imports J_b and Kottwitz maps from BG0/BG1 (tier issue in restructure proposal 4).

## Moves and ownership changes for the maintainer (`restructure`)

1. **ET.4b** (new sub-layer after ET.4) owns:
   - `ET.4/local-cyclic-base-change`;
   - `ET.4/global-cyclic-base-change`;
   - `ET.4/cyclic-automorphic-induction`;
   - `ET.4/unitary-gl-base-change-descent`.

   Edges ET.4b → ET.6, ET.7a and GL2AutomorphicRepresentationsAndTransfer:R17.4. The ET.6a packet's `ET.7a/cyclic-base-change` and `ET.7a/cyclic-automorphic-induction` should become imports of these nodes. The ET.6a packet proposed the same move.
2. The p-adic character prefix (`ET.4/padic-character-distributions`, `ET.4/twisted-characters`) has one owner, here. When DESIGN-SmoothRepresentationsOfLocalGroupsPartII (#3388) is written, it should import these nodes or take them over, in a tier below this roadmap.
3. `ET.6/drinfeld-level-deformation-spaces` owns the finite-level Lubin–Tate spaces with Drinfeld level. `ET.6a/lubin-tate-tower` should import it.
4. Upward citations in the Caraiani–Newton order:
   - ET.5 imports accepted IG.0–IG.1 nodes (tier 19) and BG0–BG1 nodes (outside the 94). The proposal is an early IG/σ-conjugacy package below ET (the BG0 split of RT-geomlanglands/32, and ET.6a's ET.5a).
   - ET.6 **no longer** imports AutomorphicGaloisRepresentationsPartII:AG2.1a. Scholze's division-algebra Drinfeld-level count is planned here; it is a different datum from AG2.1a's compact Shin instance at good reduction.

## Requests made

- FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 (deformations of p-divisible groups with O-action).
- ClassicalAdicEtaleCohomology:H1:formal-adic-comparison (Berkovich nearby cycles).
- LefschetzPencilsAndVanishingCycles:LPV.6.
- EtaleDualityAndPerverseSheaves:EDC.5 and EDC.6 (the RS-19 splice).
- Tau Ceti ClassFieldTheory layers 7, 9 and 11, and ReductiveGroups layer 7.

## Gaps (what a follow-up must do)

1. **Arthur's classification inputs.** Mok, KMSW and Gee–Taïbi were not read, and the twisted weighted fundamental lemma is still unproved (BCGP §1.6, p. 8).
2. **Harris–Taylor §VI and Kottwitz's simple Shimura varieties** are stated only through Scholze §§8–10 and Shin 2011 §6.2. The HT book is not cleared; this is the same source-access request as the ET.6a packet. Labesse 2011 is the public alternative.
3. **Primary sources cited through secondary statements:** Kottwitz 1986/1988, Arthur 1988, Morel 2010, Labesse 1991, DKV, Badulescu 2007, Henniart, Harris 1998, Drinfeld 1974 and Mieda. A lemma-level pass must read each.
4. **Bushnell–Henniart 2011** level-zero formulas were not read (`ET.6/level-zero-explicit`).
5. **Atobe–Kondo–Yasuda Lemma 6.6** is planned only in its degree-one form. AKY was not reopened; its locators are those of the accepted extraction.

Also not read: Scholze's JAMS 2013 deformation-spaces paper, which the stage text cites. The file fetched under arXiv 1110.0232 is in fact Scholze–Shin, so the plan follows the GL_n paper's own §§2–7.

## Source issue recorded

- **E2** (CSnc §5.5, p. 72): the involution g^♯ lacks the inverse. The correct form is g^♯ = Φ ᵗ(g^c)^{−1} Φ^{−1}, as in Shin 2011 §4.1. The same slip is CS17 erratum E69.

ET.0's E1 already covers n₂ > 0. The nodes use the corrected CS17 statements E66, E69, E71, E72, E74 and E75.

## Sources read (2026-10-14, public copies; hashes in the packet)

- Caraiani–Scholze arXiv:1909.01898v2 §5.
- Caraiani–Scholze 2017 (Annals PDF) §§5.2–5.5.
- Shin 2009, 2010 and 2011 (author copies).
- Scholze arXiv:1010.1540v1 (complete).
- Arthur–Clozel (Clay archive scan) Ch. 1 §§1–6 and Ch. 3.
- Zelevinsky 1980 and Tadić 1986 (Numdam).
- Kottwitz's Clay notes (Introduction, §7).
- Labesse 1999 (Numdam) §§2.5, 3.3, 4.3.
- BCGP arXiv:2502.20645v1 §§1.6, 1.8.22.
- LTXZZ (cleared copy) C.3 and D.2.

Missing: Harris–Taylor, Kottwitz 1992 Invent., Mok, KMSW, Bushnell–Henniart 2011, Badulescu 2007, DKV 1984.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparison--ET.4.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.4.lean`: elaborates, `sorry` warnings only.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: see the pull request.
