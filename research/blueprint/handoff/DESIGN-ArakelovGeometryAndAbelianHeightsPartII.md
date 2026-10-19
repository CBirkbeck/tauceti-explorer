# DESIGN-ArakelovGeometryAndAbelianHeightsPartII: handoff

Issue #3340. Agent: Claude (Opus), session claude-frtZxo, claimed on 2026-10-19 (the bot confirmed comment 6259199301). This is a complete target-level design pass for independent review. It claims no implementation: every node is `unchecked`.

## Delivered

- `research/blueprint/roadmaps/ArakelovGeometryAndAbelianHeightsPartII.json`: a new roadmap in area `arithmeticgeometry` with parent `ArakelovGeometryAndAbelianHeights`, titled "Arakelov geometry and heights of abelian varieties, Part II: adelic bigness on curve families". It has 14 layers, AH.0–AH.13. Each layer's `requires` is derived from its nodes' prerequisites, and there is no stage cycle inside the roadmap.
- `research/blueprint/packets/ArakelovGeometryAndAbelianHeightsPartII.json`: status `complete`, 93 nodes (13 definitions, 31 constructions, 48 theorems, 1 comparison), 224 API items, 161 unit tests, 45 planets (at most 6 per layer), 4 baseline declarations, 8 requests, 7 gaps, 1 new source issue, 4 restructure notes and 1 upstream note. Every stage is `planned`. `routedItems` maps each of the 159 PAPER-YUAN-26 items routed here, plus the 3 Gao–Habegger and 3 DeMarco–Mavraki–Ye items, to the nodes that carry them.
- `research/blueprint/readmes/ArakelovGeometryAndAbelianHeightsPartII.md`: the reader, about 35,000 words. It covers conventions, the proof assembly, the identities checked, sources, corrections, every node in full (statement, hypotheses, proof route, API, unit tests, checks, needs, locators), requests, imported nodes, gaps and boundaries.
- `research/blueprint/suggested/ArakelovGeometryAndAbelianHeightsPartII.lean`: 265 lines, written to the compact shape. It contains the boundary norm on an ordered ℚ-vector space with its API and tests, the coefficient identities behind Yuan's theta formulas, the nefness of ω_a, the triple pairing and Theorem 3.8, the Cinkir t(g) and A(g) numerics, the one-loop graph invariants, the normalization constants (Bost, Theorem 4.14(c)) and the Siu ε-bound. Nothing heavy is sorry'd data; adelic objects are README targets because their carriers are not at the pins.

## Scope decisions

1. **Starting point.** The parent (TauCetiRoadmap PR #1000, head 577b525, atlas stages R35.1–R35.6) stops at ĈH¹ with smooth metrics and heights of points. It explicitly excludes higher arithmetic intersection products and general adelic intersection theory. No atlas roadmap plans top arithmetic intersection numbers, the metrized Deligne pairing or arithmetic volumes on projective arithmetic varieties (searched across all packets). They are planned here as AH.0, the model case that every Yuan–Zhang limit reduces to.
2. **Endpoints.** The endpoints are Yuan's Theorems 1.3/3.1/3.2 (bigness, AH.11), 4.1/4.5 (potential bigness, AH.12) and 1.4/4.11/4.14 (uniform comparison with h_Fal, AH.13), which are what the route assigns here. The uniform Bogomolov and small-points results (Theorems 1.1, 4.2, 4.7, 4.10, 4.17, 4.19) are routed to HeightsRationalPointsAndObstructionsPartII (design #3343, not yet designed). They import AH.4, AH.5, AH.8, AH.12, AH.13 and AH.6 (see `restructure`).
3. **Imports, not re-planning.**
   - JacobianChallengePartII supplies the relative Jacobian, Abel and difference maps, the twice-theta bundle, the Poincaré identities, the actual-Picard torsion cokernels, Faltings–Zhang/universal shift and the curve–Jacobian Hodge comparison (JC1–JC6).
   - StableReductionPartII supplies moduli, the Hodge determinant, the universal Noether formula, the semi-canonical Noether isomorphism, boundary thickness, stable compactifications, maximal variation and Hodge bigness (MC.4–MC.6).
   - TropicalAndBerkovichArithmetic TB.0/TB.2/TB.3/TB.6 supplies Berkovich spectra, skeleta, metric graphs, model measures and graph Green functions.
   - GrossZagierAndArithmeticHeights GZ.2 supplies archimedean admissible metrics and the explicit skeleton measure.
   - HeightsRationalPointsAndObstructions RP.0 supplies the height machine, the Tate limit, Silverman–Tate and the specialization limit.
   - ArithmeticDynamics DY.4 supplies projective equidistribution and the canonical metric of a rational map.
   - SchemeAndStackFoundations SF.5 supplies Chow groups, first Chern operators, degree, nef and big.
   - The parent supplies R35.1–R35.3, R35.5 and R35.6.
4. **Moriwaki heights** (the Gao–Habegger brief) are AH.6, as Yuan–Zhang heights for a Moriwaki polarization. RP.0's generalized global fields do not cover them, since they need archimedean integrals rather than a finite set of archimedean absolute values.
5. **Genus one** is excluded from every target from AH.7 on (PAPER-YUAN-26/E8, E28; gap G7).

## Requests (8)

- ArakelovGeometryAndAbelianHeights R35.1, R35.2, R35.3, R35.5 and R35.6: existing upstream sections, cited as they stand.
- ComplexComparisonPartII C5: currents and Lelong–Poincaré; Bedford–Taylor products are needed as well (gap G2).
- MotivesAndAlgebraicCycles MC.0: homologically trivial cycles, for the Gross–Schoen cycle.
- NeronModelsAndSemistableAbelianVarieties R11.3: semistable reduction after extension, for the function-field Faltings height.

## Gaps (7)

- **G1.** Wazir 2006 was not read; the Moriwaki Silverman–Tate and specialization results rest on the transfer argument.
- **G2.** Bedford–Taylor products on singular complex varieties: no owner has been confirmed.
- **G3.** The arithmetic Noether formula (Faltings 1984, Moret-Bailly 1989) was not read; it is cited through Yuan p. 89.
- **G4.** The Gross–Schoen regular-model height construction was not read in the original.
- **G5.** Yuan Remarks 3.11/4.13 (boundary growth of φ and δ) are asserted there, not proved.
- **G6.** Cinkir's c(3) = 17/288 (Manuscripta 2015) was not read. This is harmless, because Cinkir 2011's t(3) already gives A(3) < 139.
- **G7.** Genus one.

## Source issues

- **New: ArakelovGeometryAndAbelianHeightsPartII/E1.** On p. 78, Yuan quotes Bost's bound as h_Fal ≥ −g log √(2π). That is Bost's bound in Deligne's normalization, but Yuan's h_Fal uses the Faltings metric (pp. 43–44, 73). In that normalization Bost gives only −(g/2)log(2π²). For g = 1 the printed inequality fails for elliptic curves: min h_Fal ≈ −1.321 < −0.919. The proof needs only some constant, so nothing else is affected. The reader also notes, without filing an erratum, that Yuan's "[Cin1, Thm. 2.11]" for φ(Γ) ≥ ℓ(Γ)/39 is Theorem 2.9 in Cinkir's arXiv v2 (the published numbering was not compared).
- The plan uses the corrected statements of PAPER-YUAN-26/E1–E6, E8, E9, E11, E12, E14, E16, E22, E25, E28 and E30. The reader lists them under "Corrections used here".
- Locator fixes relative to the extraction: DeMarco–Mavraki–Ye are cited by arXiv v3 pages (§4 is on pp. 19–21, not pp. 13–15), and Yuan–Zhang by v9 numbering (the height inequality is Theorem 5.3.7, which is 5.3.5 in v6).

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArakelovGeometryAndAbelianHeightsPartII.json --index <pinned declaration index>`: 0 errors, 0 warnings.
- I checked for intra-roadmap stage cycles with a script. There are none, after moving Deligne-pairing positivity and finite-cover bigness from AH.3 to AH.4.
- `lean-check research/blueprint/suggested/ArakelovGeometryAndAbelianHeightsPartII.lean` (Mathlib 082e2d3): it **compiles**, with `declaration uses sorry` as the only warnings. The numeric checks (Cinkir t(4), t(5), A(3), A(4), A(5), the g = 2 coefficient, the coefficient identities, the de Jong identity on the one-loop graph and the Siu bound) are proved, not sorry'd. `scripts/check_sorry_data.py` passes.
- The identities checked while planning are listed in the reader (Theorems 2.9, 2.10, 3.6, 3.8 and 4.14(c), the Cinkir minimum and the one-loop graph values).
- A Sonnet agent cross-checked all 148 locator rows against the source text extractions; the findings and what I changed in response are in the section below.

## Sources read (all freely available; SHA-256 values are in the packet)

Yuan (author manuscript of 21 August 2024): §§1–4 as listed and Appendix A. Yuan–Zhang arXiv:2105.13587v9: the statements of Chapters 2–6 cited. Yuan 2008 (math/0612424v2) §2. Moriwaki 2000 (math/9809016v2) §§3–4. Gao–Habegger (1801.05762v3) Appendix A. DeMarco–Mavraki–Ye (2405.17343v3) §§1, 4. Zhang 2010 (0812.0371v1), Cinkir (0901.3945v2), Baker–Rumely (math/0407427v2), de Jong (1610.01932v2), Wilms 2017 (1605.00847v3), Wilms 2022 (1903.12159v2) and Looper–Silverman–Wilms (2101.11593v3), at the cited statements. Not read: Wazir 2006, Faltings 1984, Moret-Bailly 1989, Gross–Schoen 1995, Cinkir 2015, and Zhang 1993 in the original. No restricted library book was used.

## For the reviewer

- Check the AH.0 boundary against any arithmetic-intersection owner I missed (I searched all packets for Gillet–Soulé, arithmetic Chow, arithmetic volume and Deligne pairing).
- Check AH.7/canonical-metric-pair and AH.8/canonical-admissible-bundles (Yuan Theorem A.1, Theorem 2.3) for the genus restriction.
- Check AH.11/arithmetic-bigness (E6) and AH.13/number-field-comparison(b), where the plan follows Yuan's sketch through the coercive divisor.
- Check AH.10/globalization-scope, which records an impossibility argument only at the level of Yuan's remark.

## Other jobs noticed while choosing this one

#3338 (DESIGN-ModularIwasawaMainConjecturesPartII) and #3339 (DESIGN-RankZeroOneBSDPartII) were skipped. Their routes are already designed as CMAllPrimeMainConjectures and InertAnticyclotomicCMMainConjecture (#3338), and as CMRankZeroConverse and RankOneConverse (#3339). Designing them again would duplicate those roadmaps; the maintainer may want to close or re-scope them.
