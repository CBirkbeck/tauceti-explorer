# REV-DESIGN-ZAGIER handoff

Review of DESIGN-ZAGIER (Codex `codex-eztB21`, PR #10356). Reviewer: Claude, session `claude-f556Sk`, issue #78, 18 October 2026. The job is complete: verdict **accepted**, with corrections made in place. The report is `research/blueprint/reviews/REV-DESIGN-ZAGIER.md`.

## What was done

- I downloaded GR v5, G08 v4, G09, M20, G00 and the G93 scan again; all six SHA-256 fingerprints match the packet. I read GR in full and the cited parts of the others, and checked every node at its locator. Every `match` field, which had been a copy of the statement, is rewritten. Several locators are corrected, and the citations of a second source are split into their own entries.
- Corrections of substance:
  - Six analytic prerequisites that were used for algebraic identities are replaced.
  - Request P3-SPEC is added to `Polylogarithms:P.3`, for the inverse of B₃-exp≅L₃.
  - The Z.6 theorems no longer use the circular premise `P.4/weight-four-regulator-input`. The near miss `P.4/period-calibration` is replaced by the Borel R.4/R.5 nodes, and the backwards edge to `P.4/explicit-weight-four-complex` is removed.
  - The pentagon identity in cluster-boundaries is corrected.
  - The degree-eight chain conditions are added to configuration-identities, and the descent of δ to G₄ moved there.
  - The scissors map uses Goncharov's 2000 normalization of a₃.
  - The constant issue in the symbolic b₃ (gap CONST) is closed.
  - MT-2 is retargeted from the TauCetiRoadmap pull request NC.2 to PeriodsAndSpecialValues:PS.9.
- New source issues E05–E08 are recorded. E01–E04 have review verdicts: E01 is reclassified as a misprint that affects nothing, and E04 as an error in GR Theorem 2.1's weight-one component.
- E05 (GR Lemma 7.9 is false; the C₈(3) contributions cancel instead, ratio −9) rests on a numerical check. I evaluated with two Bloch–Wigner functionals at independent random complex configurations of eight vectors in C³, for seeds 1, 3, 7 and 11. The script is not kept. It sums over S₈ with signs, taking D(σ₁x)D(σ₂y)−D(σ₁y)D(σ₂x) for the two wedge factors, with projected cross-ratios computed from 3×3 determinants. Anyone can rebuild it in a few lines. The symbolic certificate is gap C8-SQUARE.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ZagierConjecturePolylogarithms.json --index <pinned declaration index>`: 0 errors, 0 warnings.
- Source issues: `check_issues` (scripts/source_issues.py) and `versions_checked` (scripts/check_errata.py) report nothing.
- `lean-check research/blueprint/suggested/ZagierConjecturePolylogarithms.lean`: elaborates at Mathlib 082e2d3. The only warnings are ten placeholder-proof warnings.

## For the next worker

- A follow-up fix to `Polylogarithms:P.4` should name the Z-targets as the owners of its gap "Explicit weight-four correlator and regulator proof owner" without listing them as prerequisites, so that the stage graph stays acyclic (see the restructure proposal).
- The open leaves are: P3-SPEC, MT-1, MT-2, HODGE, DELIGNE, SCISSORS, HOM and SCALE (requests), and FLAG-SIGNS, C8-SQUARE, LIFT, RES, SUPPLIERS, MT and IND (gaps).
