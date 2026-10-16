# Blocked checkpoint: BP-AlgebraicModuliForArithmeticGeometry--R09.4~2

Issue [#9301](https://github.com/CBirkbeck/tauceti-explorer/issues/9301).
Latest continuation: **Codex (GPT-6)**, session **codex-Efn3Di**, 16 October
2026. Previous checkpoint: session **codex-K4T4aK**, [PR
#9968](https://github.com/CBirkbeck/tauceti-explorer/pull/9968).
**This revision is unfinished. No mathematical correction is claimed.**

## Current continuation and corrected ownership map

The bot confirmed session codex-Efn3Di's claim in
[comment 6218851034](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6218851034),
responding to [claim comment
6218848298](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6218848298).
The manager's first eligible available issue was still #9301. No second job
was claimed. The previous checkpoint's merge explicitly made the job
available again; it did not resolve the maintainer's upstream-only instruction.

Rechecked the instruction and the upstream pull requests directly. PR #853
is still open at the same head recorded below. Two current supplier READMEs
show that the old checkpoint's broad assignment of all arithmetic targets to
two owners is insufficient:

| Current source, pinned to the inspected head | Boundary that a resumed assignment must respect |
| --- | --- |
| [AlgebraicModuliForArithmeticGeometry #853, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/6f3a90dbb5188375dd083e1df9c87ef2bbf38c6c/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#scope-and-ownership) | Generalized elliptic applications and polarized abelian applications are outside its scope. Its generic representability and gerbe targets do not authorize another arithmetic moduli development here. |
| [ModularCurvesPartII #913, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/139737f36f595d55e3276e952795775255eee643/TauCetiRoadmap/ModularCurvesPartII/README.md#scope-and-ownership), Layer 2 and its AdicSpacesPartIII supplier contract | The generalized elliptic carrier, standard polygons, Tate family and fine compactified moduli on the stated representable range are imported from AdicSpacesPartIII R2.11. ModularCurvesPartII supplies their integral stack applications and polygon operations. The distinction applies already to `arith-standard-ngon` and `arith-generalized-elliptic`, not only to the final stack theorems. |
| [AbelianSchemesAndArithmeticModuli #849, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/7d89041bb709cb2cdb1935f9f1ad23d9c913751f/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#scope-and-ownership), A0–A3 and A6 | This roadmap owns the relative abelian carrier, duality, polarizations, graph bundle, ample cohomology, full levels and polarized automorphism rigidity. It expressly excludes the polarized moduli stacks, their level covers and compactifications, directing those to PELModuli, ShimuraVarieties and ShimuraCompactifications. Its reference to ShimuraVarieties §5.0 is expressly a characteristic-zero interface; it does not by itself supply all the integral `A_{g,d}` targets in this packet. |

These are verified ownership statements in existing roadmap documents, not
proofs of the mathematical targets. In particular #849 A2.4 now explicitly
names ample cohomology, Riemann–Roch and the degree-square formula. A resumed
job must compare that export with G-field-ample before requesting another
copy of the theory. This continuation does not discharge that proof gap or
assert that the full integral stack has an audited supplier.

The read-only upstream main inspected in this run is
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti source tree is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the ModularCurves and
StableReduction introductions and boundaries and the existing field-valued
AbelianVariety carrier. No environment was built or modified. The upstream
PRs are separate existing work, not additions to the packet's pinned
formalization baseline.

Only the first coverage `remaining` entry and this handoff change in this
continuation. The packet was already partial. Every other packet field,
including its independent review, is preserved exactly; the reader and
suggested file are untouched. The numerical frontier below is unchanged.
The eight reader corrections below remain outstanding. No source proof or
pinned baseline citation was newly certified.

**Required disposition:** retire or rescope the obsolete atlas assignment,
or explicitly authorize a historical correction with the upstream ownership
boundary reconciled. WORKERS.md forbids workers to change labels or the
queue; this continuation cannot prevent checkpoint intake from releasing
the same issue again. An available label or another merged checkpoint is
not that disposition. Changes to the authoritative roadmap belong to its
upstream PR, outside this job's permitted files.

Current validation: the packet checker reports **0 errors and 0 warnings**;
the permitted-file and whitespace checks pass. Structural comparison with
the input confirms that only the ownership blocker changes in the packet.
**Lean was not compiled in this continuation**: the file is unchanged and
the assignment remains blocked before mathematical revision. No new source
error is asserted, no private reference was used and no scratch file is
needed to resume. The previous checkpoint's evidence and mathematical
worklist follow for continuity.

## Blocking instruction and current ownership

In the previous checkpoint, the issue had `state:available` and was the first
eligible issue in the manager's ordered list. The bot confirmed that session's claim in its
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
The current continuation above refines this broad source/consumer map using
the suppliers' own explicit boundaries.

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
