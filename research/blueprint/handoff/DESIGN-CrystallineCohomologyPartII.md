# DESIGN-CrystallineCohomologyPartII

Worker: Claude (Opus), session `claude-PyCp4M`, 2026-10-19. Issue #3444. Branch `claude-PyCp4M-design-crystalline-partii`.

## Deliverables

- `research/blueprint/roadmaps/CrystallineCohomologyPartII.json` — the roadmap definition: "Crystalline cohomology, de Rham–Witt and logarithmic foundations, Part II: Witt vector cohomology of singular varieties", area `padic`, parent `CrystallineCohomology`, seven layers WV.0–WV.6. (The layer keys are `WV`, not `WC`, because `WeilConjectures` already uses `WC.*`.)
- `research/blueprint/packets/CrystallineCohomologyPartII.json` — complete target-level packet: 58 nodes (12 definitions, 9 constructions, 30 theorems, 7 lemmas), 140 API items, 89 unit tests, 15 planets, 19 baseline declarations (Mathlib 082e2d3, read at the pin), 2 requests, 2 gaps, 3 new source findings. Every stage is `planned`.
- `research/blueprint/readmes/CrystallineCohomologyPartII.md` — the roadmap document (introduction, scope and ownership table, conventions, sources, layer prose, every node with statement, hypotheses, proof outline, inputs, API, unit tests, uses, checks and sources, per-layer dependencies and acceptance, requests, gaps, source findings, references). It is generated from the packet, so the two agree field by field.
- `research/blueprint/suggested/CrystallineCohomologyPartII.lean` — compact suggested file in the 2026-10-12 shape: real-bodied light definitions over carriers that exist at the pins (`wittIdeal`, `IsBoundedTorsion`), the affine forms of the nil-invariance and universal-homeomorphism steps, the Serre-class closure of bounded torsion, Ax's congruence modulo q (`card_dvd_card_solutions_of_sum_lt`) with the compatibility example against Mathlib's Chevalley–Warning, and tests. Sheaf-level objects (Witt sheaves on schemes, h-sheaves, rigid and Hodge–Witt cohomology, Chow groups with supports, point counts of schemes) do not exist at the pins and are README targets, as the file's header says.

## Scope decision (split)

The issue combined four Part II routes of CrystallineCohomology. Two share their object and are planned here as one roadmap: Bhatt–Scholze 2017 §11.5 (route `CrystallineCohomologyWittHDescentPartII`: h-descent of Frobenius-inverted Witt cohomology) and Hacon–Witaszek 2023 (route `CrystallineCohomologySingularWittRationality`: rational Witt cohomology of singular schemes). Their common foundation is Berthelot–Bloch–Esnault's Witt vector cohomology of singular varieties and Chatzistamatiou–Rülling's Witt-rational singularities, which this roadmap plans in full. The other two routes are independent directions sharing only CR.1/CR.5/CR.7 and are proposed as roadmaps of their own in the packet's `restructure` (action `split`):

- `CrystallineCohomologyConvergentPartII` — Kisin–Madapusi Pera–Shin 2022, Appendix A (22 items), brief in `PAPER-KISIN-MADAPUSIPERA-SHIN-22.result.json`;
- `CrystallineCohomologyPartIICartierFlows` — Esnault–Groechenig 2020 (63 items), brief in `PAPER-ESNAULT-GROECHENIG-20.result.json`.

Item mapping of the routes planned here: BS17 Q1156 → `WV.1/witt-blowup-excision`; Q1157 → `WV.1/frobenius-inverted-witt-h-descent` (with the E52 correction carried by `WV.1/witt-pushout`); Q1159 → `WV.1/rational-witt-h-descent`. HW23 witt-uh → `WV.0/witt-universal-homeomorphism-invariance`; witt-ideal → `WV.2/witt-ideal-vanishing`, `WV.2/witt-exceptional-reduction`; witt-low-slopes → `WV.3/berthelot-bloch-esnault-comparison`; one-quasi-resolution → `WV.5/wo-rational-singularities`; rcc-witt → `WV.6/esnault-witt-vanishing` (with `WV.6/rcc-chow-zero-triviality`).

A second restructure entry (action `rescope`) tells the queued birational-geometry design (`DESIGN-SchemeAndStackFoundationsPartII`, route `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry`) to import WV.0–WV.6 and plan only the minimal model program, the WO-rationality of klt threefolds/fourfolds and the assembly of HW23 Corollary 1.3 from `WV.6/esnault-point-count` (ii).

## Layers and planets

| Layer | Nodes | Planets |
| --- | --- | --- |
| WV.0 Witt vector sheaves and rational Witt cohomology | 8 | Witt vector sheaves |
| WV.1 h-descent | 6 | h-descent for Frobenius-inverted Witt vectors; Rational Witt h-descent |
| WV.2 compact supports | 6 | Witt ideal vanishing theorem; Witt vector cohomology with compact supports |
| WV.3 rigid comparison | 7 | Rigid-to-Witt comparison morphism; Berthelot–Bloch–Esnault comparison theorem |
| WV.4 Hodge–Witt correspondences | 6 | Correspondence action on Hodge–Witt cohomology |
| WV.5 Witt-rational singularities | 12 | Quasi-resolution invariance of Witt cohomology; WO-rational singularities; Witt vanishing for CH₀-trivial fibrations |
| WV.6 point counts | 13 | Ax–Katz congruence modulo q; Serre's theta divisor congruence; Esnault's slope vanishing; Esnault's point-count theorem |

## Requests, gaps and what remains

- Request to `AbelianSchemesAndArithmeticModuli:A2`: Serre's vanishing of Bocksteins on abelian varieties (injectivity of V^i: H^g(A, O) → H^g(A, W_{i+1}O)), needed by `WV.6/theta-divisor-congruence`. Serre's 1958 papers were not read (not freely available).
- Request to `AdicCoefficientsAndComparisonsPartII:PA.6`: de Jong's Galois alterations over a perfect field (de Jong 1997 Cor. 5.15 / 1996 Cor. 7.4), needed for the existence of quasi-resolutions; PA.6 states the theorem over algebraically closed fields. Gap `CrystallineCohomologyPartII/G2`.
- Gap `CrystallineCohomologyPartII/G1`: Kollár's results on rational chain connectedness (base change IV.3.2.5, chains IV.3.6, CH₀ IV.3.13.3) are used through Gongyo–Nakamura–Tanaka Remark 4.6 and Esnault 2003 §1; Kollár's book is not freely available and not in the cleared library.
- Coverage `remaining` (lemma-level refinements, not gaps): BBE leave Proposition 4.6 (compatibilities of a_U) as an exercise; WV.4 uses Ekedahl's duality and Gros's cycle classes through the statements recorded in Chatzistamatiou–Rülling §§1.10 and 3.2 — Ekedahl (Ark. Mat. 22, 1984; Ann. Fac. Sci. Toulouse 1985) and Gros (Mém. SMF 21, 1985) were not read.
- Supplier packets under revision: several SchemeAndStackFoundations follow-up packets (SF.0, SF.2, SF.4) are `needs_changes`; the node ids cited here (e.g. `SF.0/frobenius-factors-through-universal-homeomorphism`, `SF.2/sheafified-grothendieck-duality`, `SF.4/de-jong-alteration-theorem`) are the ones other accepted packets cite. TauCetiRoadmap main now contains SchemeAndStackFoundations; its §0.26 states the Frobenius factorization and the Witt scheme of a perfect scheme (upstream note in the packet: the general Witt scheme W_nX is planned here).

## Source findings

New (packet `sourceIssues`): E1 — Chatzistamatiou–Rülling Corollary 4.5.1 says "quasi-birational over X" for "over S" (arXiv v1; the Documenta version could not be retrieved); E2 — Hacon–Witaszek's reference [GNH19] names the third author "T. Hiromu" (Hiromu Tanaka); E3 — Gongyo–Nakamura–Tanaka Proposition 2.23 calls an ideal of O_X "an ideal sheaf on Y". Carried from the paper extractions: PAPER-BHATT-SCHOLZE-17/E52 (the pushout Y′ in the proof of Proposition 11.41 is constructed in `WV.1/witt-pushout`), PAPER-HACON-WITASZEK-23/E10, E11, E14 (corrected forms used in WV.2 and WV.6). A correction of my own draft worth recording for reviewers: for a supersingular elliptic curve, H¹(E, WO_E)_K is two-dimensional of slope 1/2, not zero; consequently cones over curves of genus ≥ 1 are never WO-rational. Likewise, Frobenius-inverted Witt sheaves ignore nilpotents only when the nilradical is nilpotent (`WV.0/witt-nil-invariance` (iii), with a counterexample for an unbounded nilradical); Bhatt–Scholze only use noetherian schemes.

## Sources

Read (in scratch, hashes in the packet): BBE07 arXiv:math/0510349v1 (all 42 pages); BS17 arXiv:1507.06490v3 §§2, 11.5; CR12 arXiv:1104.2145v1 (introduction, §§1.1, 1.6–1.10 statements, 2.3–2.4, 3.2–3.7, 4.1–4.8); CR11 arXiv:0911.3599v2 §§1.1–1.3; GNT19 arXiv:1512.05003v3 §§1, 2.5–2.6, 3 (opening), 4 (Definition 4.5, Remark 4.6); NT20 arXiv:1712.07358v2 §§2.1, 2.4; Esnault arXiv:math/0207022v2 (all); HW23 published Forum Math. Pi version (pp. 1–5, 19–20, references) and arXiv v2 for comparison. Not read (cited through the above): Ekedahl, Gros, de Jong 1996/1997, Kollár 1996, Serre 1958, Ax 1964, Bloch–Srinivas 1983; the published versions of BBE07 and CR12.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineCohomologyPartII.json` with the worker declaration index: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- `lean-check research/blueprint/suggested/CrystallineCohomologyPartII.lean` (shared build, Mathlib 082e2d3 + Tau Ceti f790474): elaborates; the only warnings are 15 `declaration uses sorry`.
- Page check (scripted): every theorem/lemma/proposition/corollary label in a node locator occurs on the cited page of the PDF that was read.
- Own-words check (scripted, 12-word runs against the extracted source texts): the only shared runs are paper titles and author lists in the references.
- Citation cross-check of all 110 (node, external supplier) pairs (Sonnet subagent; every non-OK verdict re-read by the worker): 88 matched, 3 mismatched, 19 unclear. Fixed: the derived Künneth step of `WV.1/affine-derived-self-products` is now argued from finite Čech complexes and `E1/presentability-and-derived-tensor` (the weaker `E1/cohomology-base-change-map` was dropped); `WV.3/simplicial-frobenius-embedding` cites `RD.3/frame` instead of a descent spectral sequence, with Tsuzuki's smoothness computation named as part of the proof; the comparison of `WV.4/proper-correspondence-category` with MotivesAndAlgebraicCycles MC.0 is stated after ⊗ℚ. Unclear rows were either removed (`E2/abstract-blowup-squares`, `SF.2/relative-dualizing-module`; `SF.2/proper-hypercover-descent` replaced by `E2/bounded-below-hypercover-descent` with `SF.1/qcoh-fpqc-descent`) or given their explicit role in the proof text. The CH₀ arguments (`WV.6/universal-chow-zero-triviality`, `WV.6/rcc-chow-zero-triviality`, `WV.5/bloch-srinivas-decomposition`) now use only algebraic field extensions (norm argument via `MC.2/chow-groups-under-field-extension` and `SF.5/finite-flat-degree`), so no specialization argument for transcendental extensions is needed.
