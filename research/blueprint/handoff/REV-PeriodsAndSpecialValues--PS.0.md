# REV-PeriodsAndSpecialValues--PS.0 handoff

Completed independent review of #542 by Codex session `codex-9Uy8Fb`,
2026-10-19. Input #1034 was by a different session, `codex-Ha7lES`.
This is a completed review, not a checkpoint. No second job was claimed.

## Delivered

- [Corrected packet](../packets/PeriodsAndSpecialValues--PS.0.json): accepted;
  all 39 nodes checked, 23 verified and 16 corrected, none added or unverifiable.
  All eight stages remain planned, none closed; implementation status remains
  unchecked. There are 16 precise requests, seven gaps and three scope records.
- [Suggested Lean file](../suggested/PeriodsAndSpecialValues--PS.0.lean): four
  comment lines updated to expose the BV orientation and Rankin cycle gates;
  no new mathematical declarations. Final elaboration succeeded.
- [Review report](../reviews/REV-PeriodsAndSpecialValues--PS.0.md): corrections,
  all node verdicts, source evidence and seven confirmed source findings,
  baseline/upstream audit, closure and exact reader synchronization actions.

All 14 baseline declarations were confirmed at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Current read-only upstream was
screened separately at roadmaps `0d144d044dacebca17b654695b6f1ad58f159b27`,
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Existing upstream work is imported.

## Remaining downstream actions

The review itself is finished. Before packaging, synchronize the reader with
all corrections enumerated in the report. The reader was inspected but is
outside this issue's edit allowlist. In particular:

1. Remove the false complex-uniformization attribution to EllipticCurves;
   expose C5's explicit second-kind/path comparison contract.
2. Add the complex gamma test, quotient/evaluation API and distinction between
   finite Deligne values and Laurent leading coefficients; correct source
   versions, pages and E3–E7 source records.
3. Import IHG's norm law and KU's requested finite K₁/boundary comparison, and
   route the missing finite rational norm-image/real-positivity theorem to the
   central-simple-algebra direction. Do not replace it by NE.3's Iwasawa
   quotient statement. AlgebrasWithInvolution is a current upstream boundary,
   not a registered theorem supplier in this checkout.
4. Preserve the NE.7 shifted/dual determinant gate on normalized BV formulas,
   full conditional hypotheses, original FK/Burns–Greither source gap and the
   real dyadic gate. This review does not repair the NE supplier.
5. Correct the LTXZZ derivative-to-cycle direction and retain admissibility,
   actual geometric class, injectivity and routed proof premises. Register
   ArithmeticLevelRaisingAndBipartiteEulerSystems Part II and retarget the
   interim L4 request to its genuine stage identifiers when available.
6. Preserve MC.6's localized formal algebra/torsor ownership and M.8's independent
   determinant inputs. No generic determinant, formal-period, elliptic,
   lattice, regulator, quadrature or BSD-dispatch theory is replanned here.

The packet and report hold all durable evidence and public source locations.
The original French Deligne text and original FK/Burns–Greither proof locators
remain explicitly unverified. No source passages or source files are committed.

## Checks

- Blueprint checker: 0 errors, 0 warnings.
- Source-finding and version validators: no errors.
- Final `lean-check`: exit 0; 31 `sorry` warnings, no others, at the pins above.
- `git diff --check`: passed; only the packet, suggested file, report and this
  handoff changed.

No implementation is claimed. No Lean process remains running. Scratch data
is disposable and is removed when the pull request opens; nothing downstream
requires it. The pull request references #542 without closing it manually.
