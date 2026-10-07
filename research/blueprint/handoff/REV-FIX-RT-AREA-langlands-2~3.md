# REV-FIX-RT-AREA-langlands-2~3 handoff

Issue #5871. Claude, session `claude-hd6PQ0`, 7 October 2026; base `221b05de`. Independent review of
FIX-RT-AREA-langlands-2~3 (Claude `claude-c9TlsS`, PR #6724). This session did none of the fix rounds, the red team
or its verification. The review is complete; the report is `research/blueprint/reviews/REV-FIX-RT-AREA-langlands-2~3.md`.

Verdicts written into the packets' `review` objects (earlier objects appended verbatim to `reviewHistory`):

- `ClassicalSerreModularity--R27.3`: **accepted**, no correction.
- `GlobalGaloisDeformations`: **accepted**, no correction. This also promotes the five nodes edited by
  FIX-RT-BP-GlobalGaloisDeformations (#5719), which I read without finding an error. Their own review,
  REV-FIX-RT-BP-GlobalGaloisDeformations (#5720), is still to do and keeps the verdict on those findings.
- `GL2ModularityLifting--R22.1`: **needs_changes**. Every round-3 fix is right, after two corrections in place: the
  R23.1 request now says where CHT Lemma 4.1.1's finite-order character comes from, and `R32.1/p-star` left the
  `neededBy` of the typed-signature gap. The packet has never passed its own review (REV-GL2ModularityLifting--R22.1),
  and two of that review's requests are protocol rules still open.

Where the next round resumes (FIX-RT-AREA-langlands-2~4, GL2 packet only):

1. PROTOCOL §13: give typed signatures, API lemma signatures and test examples, under the packet's names, for the
   fifteen definitions and constructions in the `neededBy` of the gap "Typed suggested signatures and tests are
   incomplete" (53 API items, 45 tests). Use stand-ins for suppliers' objects as round 3 did for §8, and let each
   docstring say what cannot be stated.
2. PROTOCOL §4: promote API items that other nodes use to lemma nodes, and split R22.2/auxiliary-hecke-algebra,
   R22.1/framed-hecke-module and R22.2/delta-freeness-at-taylor-wiles-level, as in the gap "Declaration granularity
   and API promotion still required".

Nothing of RT-AREA-langlands-2 remains inside the three packets. The maintainer's stage edits (/1, /12, /20, /22,
/37) and the other jobs' parts (/8 ML.1; /12 R24.4; /26 R23.1; the 29 handed-on findings) are listed in the report.

Checks: `check_blueprint.py` with the pinned index, 0 errors and 0 warnings on all three packets;
`check_errata.versions_checked` clean; `lean-check` on the three suggested files at Mathlib `082e2d3`, no errors and
only `declaration uses sorry` warnings (13, 23, 18); an in-memory atlas assembly with the packets swapped in
assembles, skips no link and has no cycle. No language server was started and no Lake build was run. Scratch files
are discarded; nothing else needs them.
