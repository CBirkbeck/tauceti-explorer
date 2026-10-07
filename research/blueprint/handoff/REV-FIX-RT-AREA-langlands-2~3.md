# REV-FIX-RT-AREA-langlands-2~3 handoff

Issue #5871, Codex session `codex-t0EaB3`, 7 October 2026; base `5f858d95`.
Completed independent review of FIX-RT-AREA-langlands-2~3 (#5870, Claude `claude-c9TlsS`, PR #6724),
continuing and rechecking the merged Claude `claude-hd6PQ0` checkpoint PR #7024.
The review report is [REV-FIX-RT-AREA-langlands-2~3](../reviews/REV-FIX-RT-AREA-langlands-2~3.md).
No review work remains for the live issue's authorized scope. Negative packet verdicts are completed review outcomes.

Final packet verdicts:

- CSM R27.3: **accepted** for this fix round. Corrected six test classifications and the positive-level
  Newform parameter in its suggested-file comment.
- Global: **accepted** for this fix round. Explicit Cayley–Hamilton quotient in Chenevier reconstruction,
  exact existing IHG.1 supplier/request, conditional reducible counterexample, thirty test classifications.
- GL2 R22.1: **needs_changes**. Corrected the final dyadic base-change step (allowable, not necessarily split
  above 2), the stale potentially-semistable sketch gap, twenty test classifications and the missing-test count.
  Its never-accepted base review still requires the typed APIs/tests and used-API promotion listed below.

Previous review objects are preserved verbatim in reviewHistory. Node IDs, partial statuses, source-issue
verdicts and unchecked implementation statuses are retained. No source graph or upstream roadmap was edited.

The next GL2 revision resumes at the gap **Typed suggested signatures and tests are incomplete**:

| Definition/construction node suffix | APIs | Tests |
| --- | ---: | ---: |
| R22.1/minimal-level-data | 4 | 3 |
| R22.1/deformation-to-hecke-map | 4 | 3 |
| R22.1/framed-hecke-module | 4 | 3 |
| R22.2/auxiliary-level-groups | 4 | 3 |
| R22.2/auxiliary-hecke-algebra | 5 | 4 |
| R22.2/taylor-wiles-module-system | 3 | 3 |
| R22.2/dyadic-twists-of-forms | 4 | 3 |
| R22.3/arithmetic-patching-data | 3 | 3 |
| R22.4/ihara-avoidance-comparison | 3 | 3 |
| R22.5/strong-residual-modularity | 3 | 3 |
| R22.6/dyadic-patched-ring | 4 | 3 |
| R32.1/lifting-statement-table | 3 | 3 |
| R32.1/dyadic-lifting-proposition | 3 | 3 |
| R32.1/residually-reducible-lifting-proposition | 3 | 3 |
| R32.1/ordinary-three-lifting-proposition | 3 | 3 |
| Total | 53 | 46 |

Give these real typed supplier interfaces or explicitly scoped stand-ins, packet-named API signatures and
meaningful examples under PROTOCOL §13. The corrected total is 46: dyadicDet_smul is inside an unelaborated
block comment. The four typed §8 definitions and p-star are already covered; do not re-add them to this gap.
Under §4 promote API lemmas used elsewhere, including the auxiliary U_v comparison and framed-module
properties consumed by delta-actions/patching. The three recorded bundles identify constructors and
properties needing separation; target-level planning does not require every theorem to be split further.
Retain the existing prescribed-type and Durham source gaps until their exact source hypotheses are supplied.

All forty confirmed findings have a disposition in the report: eleven local repairs, twenty-nine routed
externally. The maintainer's stage/ownership edits remain /1, /12, /20, /22, /37; external CHT suppliers,
R24.4 consumers, other CSM parts and ML.1 are explicitly listed. IHG.1/henselian-irreducible is an existing
planned node whose packet needs changes, so Global imports it as an open request, not an accepted formal theorem.
The separate Global own-fix review #5720 retains its own verdicts. Legacy CSM/Global suggested-interface
omissions predate this fix; this acceptance does not certify a fresh exhaustive base-plan review.

Validation: all three pinned-index packet checks have zero errors/warnings; source-version and test-kind
checks pass; all three final lean-check runs have zero errors and only sorry warnings (CSM 23, GL2 13,
Global 18). Both declaration-graph precedences and trial atlas assemblies are acyclic and skip no links.
The inherited R26.6 → R27.1 stage edge still needs the maintainer's edit; its removal in memory clears the
unwanted R26 ancestors of R33.2–R33.5 while R33.6 retains them. Forty findings covered exactly once;
review-history preservation and final intake/path checks pass. The public source URLs, hashes and locators
are in the report. Scratch is discarded after the PR opens; no subsequent worker needs it.

Automation blocker: queue.json lists 27 outputs (13 packets, 13 suggested files and the report),
while live issue #5871 lists seven (three packets, three suggested files and the report).
The queue completion check is false even after the authorized work is complete; scoped to the
live issue's outputs it is true. This explains PR #7024's checkpoint classification. The maintainer
must reconcile the queue entry; do not edit other jobs' reviews merely to satisfy the stale list.
This PR submits the completed authorized review and identifies this external completion blocker.
