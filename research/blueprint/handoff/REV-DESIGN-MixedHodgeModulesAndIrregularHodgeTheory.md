# REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory

Issue #3570. Reviewer: Claude, session claude-LpvqSo. This is a finished independent review, not a checkpoint.

## Done

The packet, roadmap definition, reader and suggested Lean file of `MixedHodgeModulesAndIrregularHodgeTheory` were corrected in place and accepted. The full account is in `research/blueprint/reviews/REV-DESIGN-MixedHodgeModulesAndIrregularHodgeTheory.md`. In outline:

- One stationary-phase step was fixed.
- Two unproved or unnecessary inputs were removed: the nearby-cycle claim in Riemann–Hilbert, and weak factorization in model independence.
- Supplier citations were rewired to exact nodes (R09.7, LPV.1, LPV.3, SF.2, SF.3, E1, HodgeStructuresPartII H.0 and H.2, ComplexComparisonPartII C0 and C5).
- About forty locators were corrected.
- The four new source findings are confirmed, and the two duplicates are moved to `inheritedSourceIssues`.
- A new gap, G5, records the missing stratification input.

## For follow-up jobs

- **G1–G5 are the open proof inputs.**
  - G1: Zucker's weighted L² theory.
  - G2: polarized twistor Fourier strictness, i.e. Sabbah 2005, Theorems 3.3.15 and 6.1.1, and Sabbah 2006, Proposition 4.1(ii) and Corollary 5.9.
  - G3: the kernel proof of Sabbah 2006, Proposition 4.1(ivb).
  - G4: Adolphson–Sperber acyclicity.
  - G5: Verdier stratification and stratified local triviality for complex algebraic maps.
- **Six supplier requests remain:** HodgeStructuresPartII H.6 (rational norm estimates), AnalyticToricGeometry Layer 0 (normal fans and refinements), AnalyticToricGeometryPartII NT.0 (rounded divisor vanishing), Springer H/regular-holonomic (b-functions), AlgebraicModuli R09.7 (the exceptional divisor as a projective bundle), and AlgebraicCurves Layer 9 (existing place expansions).
- **Upstream overlap.** TauCetiRoadmap pull request 1056 (FormalConnectionsOpers, F6) plans the formal normal form of layer D. Once it merges, D/formal-decomposition should cite it.
- **Riemann–Hilbert ownership.** SheafConvolutionOnAbelianVarieties request R8 asks ComplexComparisonPartII for the regular holonomic Riemann–Hilbert correspondence, which B/regular-riemann-hilbert plans here. The restructure entry proposes redirecting it.
- **Regenerating the reader.** The reader is generated from the packet. If the packet changes, regenerate the node, layer, baseline, request, gap, source-issue, ownership and reference blocks rather than editing them by hand.

## Checks

- `check_blueprint.py` with the real declaration index: 0 errors, 0 warnings.
- No dependency cycle passes through this roadmap's nodes.
- `lean-check` of the suggested file at the pinned shared build: 13 placeholder-proof warnings and nothing else.
- `check_sorry_data.py` passes.
