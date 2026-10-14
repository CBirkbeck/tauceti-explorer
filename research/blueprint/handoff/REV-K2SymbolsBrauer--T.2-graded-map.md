# Handoff: REV-K2SymbolsBrauer--T.2-graded-map

Issue **#9267**. Reviewer: **Claude (Claude Code), session claude-nII9ug**,
14 October 2026. Branch `claude-nII9ug-rev-k2-graded-map`. The reviewed packet
was written by Codex, session codex-XACoi9 (#9309); this session did none of it.

## Verdict

**Accepted after corrections**, as a completed planning pass of
`K2SymbolsBrauer:T.2:graded-map`. The stage stays planned. The full report is
[REV-K2SymbolsBrauer--T.2-graded-map.md](../reviews/REV-K2SymbolsBrauer--T.2-graded-map.md);
the packet's `review.checked` gives a verdict for every node and imported target.

## What changed

- Added `K2SymbolsBrauer:T.2/unit-loop-product-symbol`: the product of two
  unit classes is the classical Steinberg symbol, up to one torus sign
  \(\varepsilon\) defined relative to the Hurewicz normalization of
  `T.1/chosen-k2-comparisons`. Its sources are Loday 1976, Lemma 2.2.1 and
  Proposition 2.2.3, and Weibel III.5.10.1 and IV.1.7.1. Planet:
  "Steinberg symbols as K-theory products".
- Restated the degree-two identification as
  \(\Phi_2=\theta_2^\natural\circ m_F\). Corrected its prerequisites and
  locators.
- Narrowed the K.7 request to the degree-(1,1) comparison of the biexact
  product with Loday's plus product. Replaced the H.3 request by accepted H.3
  nodes. Added requests to Tau Ceti AlgebraicTopology stages 5 and 8.
- Gaps went from 4 to 2: G-product-model (K.7) and G-Matsumoto (the
  T.2:symbols residue). G-graded-quotient and G-cover-Hurewicz are now planned
  elsewhere.
- Added a degree-four non-injectivity test. Confirmed E-tensor-product-rank.
  Added and confirmed E-product-sign.
- Brought the reader into line with all of this, and updated the Lean file's
  README-only target list.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2-graded-map.json`:
  0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three reviewed
  files: 0 problems. `scripts/source_issues.check_issues` and
  `check_errata.versions_checked` on the packet's findings: no errors.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.2-graded-map.lean`,
  at Mathlib 082e2d3 and Tau Ceti f790474: exit 0, with only six
  `declaration uses sorry` warnings. It was run before and after the edit,
  with over 100 GB of memory available.
- The branch was rebased onto main after #9547–#9549 merged during the review.
  The corrections take account of the new T.1 follow-up packets.

## For the next worker or the orchestrator

1. The T.1 follow-ups fix `T.1/k2-pi2` twice: by Hurewicz (\(\beta\), in
   T.1/chosen-k2-comparisons) and by the homotopy-fibre boundary (\(\chi\), in
   T.1:plus/normalised-comparison). By Loday 2.2.3 these may differ by a sign.
   Their reviews, or the assembly, should relate them. This packet uses
   \(\beta\).
2. K.7 should plan the degree-(1,1) model comparison, with a source.
3. At the next assembly, merge the `importedTargets` refinements into the T.1
   packet's `T.2/graded-map` node. Add `T.2/unit-loop-product-symbol` to that
   node's prerequisites.
