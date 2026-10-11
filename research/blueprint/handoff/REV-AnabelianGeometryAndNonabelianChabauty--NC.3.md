# REV-AnabelianGeometryAndNonabelianChabauty--NC.3

Issue [#6301](https://github.com/CBirkbeck/tauceti-explorer/issues/6301).
Worker: Codex, session `codex-3kESmR`, 2026-10-11.
Branch: `codex-3kESmR-review-nc3`. This is the run's sole claimed job.
The bot confirmed claim comment 6105678818. The author was session
`codex-9XMBCH`; this reviewer did not author the input.

## Completed result

Accepted the finished target-level planning pass after checking all 22 nodes,
their sources, direct suppliers, API/tests, suggested signatures and planets.
The packet has 8 verified and 14 corrected nodes, 18 checked baseline
declarations, 35 API items, 19 tests and 6 planets. No node was added or removed.
All implementation statuses remain unchecked. NC.3 remains planned with
G1–G4 open; this review is complete, not a checkpoint.

Only the issue's packet, suggested file, review report and this handoff change.
The full mathematical reasoning, correction list and per-node verdicts are
in the review report and packet's `review`/`independentReviewAudit` objects.

Corrections distinguish the finite-quotient cocone apex from its IsColimit
certificate; specify locally free filtered pieces and closed point embeddings;
give an explicit all-algebra vector-equation criterion for local closedness;
require all-algebra Selmer actions/differences to prove scheme fibres; and
strengthen the definition tests. Nonzero rational local H1 is derived from
the existing duality supplier, rather than assumed. Trivial-action H1 remains
a conjugacy quotient of continuous homomorphisms.

## Verification and sources

- Blueprint checker: zero errors and warnings, with the pinned declaration index.
- Final `lean-check`: exit zero at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`; 68 warnings, all uses of `sorry`.
  All 19 test signatures elaborate. Fourteen named geometric/inherited theorem
  signatures remain individually omitted under G4 and were not checked by Lean.
- Actual statements of all 18 baseline entries read at the pins; eight unique
  cited modules match the shared build byte for byte.
- All direct parent/NC.2 and external node references resolved; the four
  external stage contracts and eight supplier requests checked.
- Reviewed library audit read, and current read-only TauCetiRoadmap and Tau Ceti
  screened for duplication, including the nine post-snapshot roadmap additions.
- Source-issue and source-version schema checks pass. Sources are public;
  version URLs, exact reading scopes and hashes are preserved in the packet.
  No restricted source or copied source passage is included.

Kim2009 now cites the freely served version of record. Its relevant locators
are introduction pp. 93–95, section 2 pp. 116–119 and section 4 pp. 127–129.
The old section-3 locators were wrong. Compared the original v4, revised v5
and publication: E4 records the inertia-representability error already corrected
in v5 and published p. 127. E5 records the published p. 129 U_DR/U_cr invariant
notation misprint, checked in the page image and against section 2 p. 119.
Both have this independent review's confirmed verdict. Their roadmap ids
use E4/E5 to avoid the existing parts' E1–E3 ids. The parent Kim2005 E1 vector
product correction retains its earlier independent attribution.

## Exact remaining stage work

G1: prove finite-product/polynomial continuity and compact-image finite
coefficient containment for the selected final topologies, including vector
period quotients and cochain scalar extension. Discrete profinite cohomology
does not supply these p-adic results.

G2: prove split-unipotent affine fppf torsor triviality, strict locally free
filtered trivialization and effective descent on every coefficient algebra.
Verify the closed point embeddings and actual naive-coset/effective-quotient
comparison required by the imported connecting map.

G3: construct universal lower-class neutralizations and finite affine-linear
vector defect equations proving represented closed crystalline/unramified
loci. Prove local addition/difference and crystalline invariant lifting on
B_cris⊗R after arbitrary coefficient/residue-field extension. Use U_cr over
K0 before de Rham base change. Neither a morphism image nor a field-point
fibre calculation establishes these all-algebra claims.

G4: assemble the native supplier interfaces and state the fourteen individually
listed omitted signatures. Keep the existing concrete definitions, positive
H2 bridge and comparison squares. Do not substitute arbitrary propositions.

The eight requests retain the original owners: ReductiveGroups layers 0/3/5,
ArithmeticGaloisDuality D7, PadicHodgeTheory R06.1/R06.2 and
SelmerIwasawaCohomology L4. The R06.2 request now explicitly includes the
all-algebra crystalline lifting/difference input and the dimension consumer.
No ownership move or duplicated layer was introduced.

## Assembly coordination

The reader document is outside this review issue's deliverables and was not
edited. Assembly must synchronize its source metadata/locators, cocone
wording, filtered pieces, local closedness criterion, all-algebra fibre
hypotheses and API/test list with the accepted packet. This is already
recorded in the packet and suggested file; it is not an unfinished review.

The scratch source texts and logs are disposable. All evidence needed by the
next worker is summarized here, in the review report and in the packet. No
second issue is claimed by this run.
