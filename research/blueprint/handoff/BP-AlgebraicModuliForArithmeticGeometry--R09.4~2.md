# Blocked checkpoint: BP-AlgebraicModuliForArithmeticGeometry--R09.4~2

Issue [#9301](https://github.com/CBirkbeck/tauceti-explorer/issues/9301).
Agent **Codex (GPT-6)**, session **codex-K4T4aK**, 16 October 2026.
**This revision is unfinished. No mathematical correction is claimed.**

## Blocking instruction and current ownership

The issue had `state:available` and was the first eligible issue in the
manager's ordered list. The bot confirmed this session's claim in its
[reply](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6214958170)
to claim comment 6214955858. No other issue was claimed.

The issue also contains a [maintainer instruction dated 13 October
2026](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6146996689)
that stops further blueprint rounds for this roadmap: the upstream pull
request's README is authoritative and changes belong there. The available
label therefore disagrees with the maintainer's explicit disposition.

Checked [TauCetiProject/TauCetiRoadmap PR
#853](https://github.com/TauCetiProject/TauCetiRoadmap/pull/853), which is still
open, at head **6f3a90dbb5188375dd083e1df9c87ef2bbf38c6c**. The authoritative
[README, Scope and
ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/6f3a90dbb5188375dd083e1df9c87ef2bbf38c6c/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#scope-and-ownership)
assigns generalized elliptic curves and their levels to
**ModularCurvesPartII**, and polarized abelian schemes, their moduli and the
abelian instances of level rigidity to
**AbelianSchemesAndArithmeticModuli**. Those are precisely the arithmetic
applications retained in this packet. Continuing the old assignment would
conflict with both the maintainer's instruction and PROTOCOL section 15.

This checkpoint records that conflict for disposition. It does not modify an
upstream roadmap, propose a competing arithmetic owner or treat the
upstream README as proof that a theorem has been formalized.

## Changes and retained frontier

Only the packet's administrative status and its sole coverage record change.
The revision has `status: partial`; **AlgebraicModuliForArithmeticGeometry:R09.4**
has coverage **partial**, with the exact ownership blocker prepended to
`remaining`. Its historical target-level plan remains intact, but the
unfinished revision is not advertised as complete by the intake.

All 33 node IDs, statements, sources, source findings, proof sketches, APIs,
tests, supplier requests and the independent `needs_changes` review are
preserved. The reader and suggested Lean file are unchanged. No mathematical
target is closed or added. The retained inventory is:

| Item | Count |
| --- | ---: |
| Constructions | 10 |
| Definitions | 3 |
| Theorems | 20 |
| API items | 68 |
| Definition/construction unit tests | 43 |
| Planets | 1 |
| Pinned baseline declarations cited | 12 |
| Mathematical gaps | 14 |
| Supplier requests | 21 |

The accepted A0-extension packet, its gerbe frontier and all other packets
remain untouched. No source proof, baseline declaration or inherited
ownership rewiring was independently recertified in this run.

## Resume only after disposition

The next action is a maintainer decision to retire or rescope this obsolete
atlas assignment, or explicitly authorize a historical reader correction
consistent with the authoritative upstream ownership. Do not infer such a
decision from the available label or from a checkpoint being merged. No
worker should resume the old arithmetic planning solely from this handoff.

If a historical correction is authorized, first reconcile the packet's
ownership with the current upstream READMEs, then follow the eight items in
[the independent review](../reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.4.md):

1. Correct arbitrary-ring polygon points to units and locally constant
   component labels, including the disconnected-base control.
2. Use the cyclic coequalizer construction and etale-local node charts,
   including the irreducible one-gon control.
3. Restrict positive-divisor contraction to Deligne--Rapoport semistable
   genus-one families, including the rational-tail counterexample.
4. Include singular generic polygons in the properness argument.
5. Replace the nonexistent R09.1 Picard supplier by the three exact
   A0-extension nodes already named in the reviewed packet; distinguish
   their output from the open relative-dual theorem.
6. Separate the field square-root torsor from the approximation/effectivity
   needed to extend a chosen polarization representative.
7. Preserve the explicit missing field ample-cohomology, degree and very
   ampleness exports rather than crediting them to an insufficient supplier.
8. Synchronize the corrected source locators, source versions, supplier
   ledger, current-upstream boundary and validation statements.

The review report supplies the exact node suffixes, counterexamples and
locators. It does not require closing all fourteen honest mathematical gaps
as a condition of its reader correction. Its source-verification claims
belong to the reviewing session, not this checkpoint. The confirmed
RT-AREA-algebraicgeometry/1 and /17 ownership findings remain unchanged and
must be reconciled against the current upstream owners when the maintainer
disposes of this job.

## Validation and source boundary

Read WORKERS.md, both protocols, UPSTREAM_GUIDE.md, the full issue and its
comments, the independent review, the previous handoff, packet status and
inventory, and the upstream PR's current introduction and ownership section.
No mathematical source was newly read or copied. No private book, PDF,
extracted source text or machine-specific path enters this checkpoint.

`python3 scripts/check_blueprint.py
research/blueprint/packets/AlgebraicModuliForArithmeticGeometry--R09.4.json`
passes with **0 errors and 0 warnings** after the administrative changes.
The permitted-file and whitespace checks also pass.

**Lean was not compiled in this run:** its file is unchanged and the
assignment is blocked before mathematical work. The 9 October independent
review reports successful pinned elaboration with only admission warnings;
this run makes no new elaboration claim. No library build or language server
was started. The checkpoint needs no scratch files after submission.
