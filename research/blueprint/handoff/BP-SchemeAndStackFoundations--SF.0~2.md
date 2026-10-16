# BP-SchemeAndStackFoundations--SF.0~2: upstream ownership checkpoint

Codex, session `codex-wXyeSU`, 16 October 2026. Issue
[#9295](https://github.com/CBirkbeck/tauceti-explorer/issues/9295).

**Checkpoint; blocked by upstream ownership and the maintainer's scope instruction.**
This was the first eligible available issue on the manager's ordered list. The
bot confirmed [this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6221635574)
at 18:01:48 UTC. Only this job was claimed. This continues the checkpoint
merged in [#10029](https://github.com/CBirkbeck/tauceti-explorer/pull/10029).

## Verified ownership boundary

The maintainer's [13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6147006432)
assigns the authoritative specification to TauCetiRoadmap and directs changes
there; it says further atlas blueprint rounds are unnecessary. This session
re-read the full issue and comments after the claim. No subsequent comment
withdraws that instruction.

A fresh authenticated GraphQL read confirms that upstream
[PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, with merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. A remote-ref read resolves
current main to `f6780b173b0ee486636c58667d191d4814a77f90`. This session fetched
and inspected the individual README and Suggested.lean at that commit:

- [README, scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/README.md#scope-and-ownership)
  assigns the shared scheme foundations to this upstream roadmap and imports
  quasi-coherent algebras, relative Spec and graded algebras from their existing owners.
- [README, Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-0-schemes-and-morphisms)
  contains the schemes-and-morphisms direction assigned to SF.0, including
  direct-image algebras, general relative Proj, henselization, excellence and perfection.
- [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f6780b173b0ee486636c58667d191d4814a77f90/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean)
  imports AlgebraicVectorBundles and provides the upstream Layer 0 interfaces.

The supplied read-only roadmap checkout is still at
`0d144d044dacebca17b654695b6f1ad58f159b27`; it does not contain this newer
roadmap. Its absence there does not remove the upstream owner. This session
also inspected the supplied AlgebraicVectorBundles and ModularCurves scope
and relevant owner statements, and the reviewed SF.0 library audit.

The current Tau Ceti checkout is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its
`RelativeSpec/Functor.lean` supplies `QuasicoherentAlgebra`, `AffineSchemeOver`
and `relativeSpec`; `RelativeSpec/Affine.lean` supplies
`relativeSpecAffineIso`. Their statements were read as current ownership
context, not added as declarations at the historical packet's older pins.
Neither shared checkout was modified or built, and no repository was cloned
or copied.

[WORKERS.md](../WORKERS.md) and
[PROTOCOL.md section 15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
forbid replanning an existing Tau Ceti roadmap. Completing this historical
atlas revision would produce a competing specification. This issue permits
only its packet, reader, suggested file and handoff; it does not authorize
upstream roadmap or queue edits. Automatic checkpoint intake has restored
availability without resolving that boundary.

## Preserved mathematical state and resumption

Only this handoff changes. Packet status and SF.0 coverage remain `partial`;
the independent review remains `needs_changes`. No mathematical repair or
implementation is certified by this checkpoint.

Recounted inventory: 139 nodes (26 definitions, 26 constructions, 75 theorems,
six comparisons, three lemmas and three applications); 383 API items and 226
unit tests on definitions/constructions, or 462 API items and 283 tests across
all nodes; six planets; 492 baseline declarations; six gaps; 11 requests.
No node, API item, test, planet, source issue or ownership transfer was added.

The [independent review](../reviews/REV-SchemeAndStackFoundations--SF.0.md)
and packet retain the exact unresolved contracts:

1. Reconcile relative-Spec and vector-bundle carriers with the existing owners,
   including the genuine small-affine-site comparison adapter.
2. Supply the Eakin–Nagata input in the noncatenary-domain proof.
3. Close the field-case desingularization inputs Stacks 07FE and 07FJ, with
   their hypotheses and the strict bad-locus growth argument.
4. Supply generic flatness with finite-presentation spreading over an arbitrary
   integral base (Stacks 052A).
5. Resolve the projective-line, separated Chow and DVR inputs without reverse
   dependencies from SF.0 to its later layers.
6. Address the review's inventoried missing Lean interfaces and discriminating
   examples on the actual imported carriers.

These historical findings are not newly reviewed here and are not certified
as repaired by the upstream merge. An authorized mathematical follow-up must
compare each particular claim against the current upstream specification.

Confirmed finding `RT-AREA-algebraicgeometry/11` keeps its existing handling:
SF.0 acquires no Weil-restriction construction. ModularCurves 0F owns the
affine finite-presentation case and base change, RG2.0a its assigned affine
finite-etale applications and R09.3 the algebraic-space extension. The current
upstream Layer 0 convention also imports ModularCurves 0F. No other owner's
files or Lawrence–Sawin routing were changed.

## Validation and required disposition

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`:
  zero errors and zero warnings on the unchanged packet. This is structural validation.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/BP-SchemeAndStackFoundations--SF.0~2.md`:
  zero problems.
- No Lean file was changed or compiled in this session. Historical elaboration
  recorded by the review is not a new compilation result.
- No book was needed, no source passage was added, and no external source file
  was copied into the repository. All evidence needed to resume is linked here;
  no scratch file is needed.

The maintainer must dispose of or explicitly redirect the stale atlas
assignment before another mathematical revision can proceed. Previous
ownership checkpoints merged in #9894, #9951, #9972, #9988, #9995, #10002 and
#10029: this is the eighth submission of the same unresolved boundary.
Reissuing the unchanged assignment cannot resolve it. A redirected task needs
an explicit scope against the current upstream roadmap; the old atlas review
remains unapproved. This run submits this checkpoint and stops without
claiming a second issue.
