# REV-HodgeTateAndCanonicalSubgroups--T6 handoff

Reviewer: Claude, session `claude-k97uLQ`; issue #433. Independent review of
`BP-HodgeTateAndCanonicalSubgroups--T6` (Codex, session `codex-gcEbbg`, PR #6817).

## Result

`review.status` is **needs_changes**, with every correction made in place in the packet and the
suggested file. The report is `research/blueprint/reviews/REV-HodgeTateAndCanonicalSubgroups--T6.md`.

- Packet: 68 nodes (62 corrected, 6 added), 246 API items, 126 tests, 11 planets, 11 requests,
  10 gaps, 13 source issues (E1 confirmed, E2–E13 added and confirmed). Every node now cites
  distinctive literal excerpts (257) with specific matches. `check_blueprint.py` with the pinned
  index: 0 errors, 0 warnings.
- Suggested file: rebuilt from the corrected packet by a generator; 117 of 406 packet names have a
  typed component, the rest are catalogue entries marked "not stated". `lean-check`: exit 0,
  105 warnings, all `sorry`.

## What the revision round (`BP-HodgeTateAndCanonicalSubgroups--T6~2`) must do

1. Regenerate `research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T6.md` from the corrected
   packet. It still carries all 62 submitted statements verbatim and only 1 of the 68 corrected ones;
   requests, gaps, restructure entries, coverage and source issues changed as well.
2. Extend typed coverage in the suggested file where an honest signature exists. Keep the
   catalogue generated from the packet so that file and packet stay in step; the opening note and
   the "Test <name>" / "API <name>" docstring convention are what the name check relies on.
3. After the maintainer applies FIX-RT-AREA-padic-1 (findings /4, /23, /24): replace the three
   `PadicHodgeTheory:P8` citations (toric-kummer-cohomology, proper-log-almost-finiteness,
   log-primitive-comparison) by `PadicHodgeTheory:P8:primitive` nodes, and move the six
   primitive-comparison nodes to `T6:log-primitive` as the restructure entry says.
4. Once PAPER-LIU-ZHU-17 route 8 is accepted, plan the Liu–Zhu interior Riemann–Hilbert package
   (Theorems 1.2, 2.1, 3.8, 3.9, Corollary 3.12) and cite it from the six nodes of that gap.

## Decisions a later worker should not undo

- No `T6:log-sites` node may cite `PadicHodgeTheory:P8`, `P8:local-rational` or
  `CohomologyComparisons` (stage rule; a cycle through PR.8 → CP.4 → P8). log-perfectoid-basis uses
  PerfectoidSpaces P3 nodes instead.
- `MotivesAndAlgebraicCycles:MC.7` is not cited: across the research packets it lies downstream of
  T6:comparison (B5 → C5 → PELModuli M6 → R28.1 → R28.4 → MC.7). The CM special-point inputs are a gap
  that needs an early owner.
- `CrystallineCohomology:CR.5/log-connection` is the crystalline notion and is not an input; the
  analytic log connections are T6's own (DLLZ-RH Definition 3.1.7).
- P8:primitive comes after P8:local-rational, as FIX-RT-AREA-padic-1 decided; the submitted packet
  had the rejected order.
- The packet uses BP's homological normalisation (the standard representation realised by
  H₁(A,Q_p)); DLLZ-RH (5.5.2) uses the contragredient one.
- The two lattices of BP are filtered by their own t-adic filtrations Fil^iB_dR·L, not by the Hodge
  filtration.

## Sources

The three public author copies, with the hashes recorded in the packet: DLLZ-adic
(`https://www.kwlan.org/articles/log-adic.pdf`), DLLZ-RH (`https://www.kwlan.org/articles/log-RH.pdf`)
and BP (`https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf`). The
published DLLZ-adic chapter and the JAMS version of DLLZ-RH were not available, so every source issue
is scoped to these copies (the collation gap).
