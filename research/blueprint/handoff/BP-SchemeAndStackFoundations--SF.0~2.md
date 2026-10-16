# BP-SchemeAndStackFoundations--SF.0~2: upstream ownership checkpoint

Codex (GPT-6), session `codex-cvk0m5`, 16 October 2026. Issue
[#9295](https://github.com/CBirkbeck/tauceti-explorer/issues/9295).

**Checkpoint: the maintainer's scope instruction prevents this atlas revision.**
The bot confirmed [this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6224288221)
at 20:40:49 UTC. This was the first eligible available issue on the manager's
ordered list. Only this issue was claimed. This checkpoint continues
[#10054](https://github.com/CBirkbeck/tauceti-explorer/pull/10054).

## Fresh scope and ownership checks

This session read the full issue and all its comments after claiming. The
maintainer's [13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6147006432)
assigns the authoritative specification to TauCetiRoadmap and says further
atlas blueprint rounds are unnecessary. No subsequent comment withdraws it.
The [latest intake release](https://github.com/CBirkbeck/tauceti-explorer/issues/9295#issuecomment-6224208807)
only reports the previous checkpoint merge; it supplies no new mathematical scope.

A fresh authenticated GitHub GraphQL read confirms that
[upstream PR #779](https://github.com/TauCetiProject/TauCetiRoadmap/pull/779)
merged on 14 October 2026 at 04:47:45 UTC, with merge commit
`d23fdaf388733bd9bcb0dc9b7963cc336f21461d`. The same read resolves current
main to `cc8501ac47d864b56634cb1ba6094197bf60e6b7`. This session fetched and
inspected the individual README and Suggested.lean at that exact commit:

- [Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/cc8501ac47d864b56634cb1ba6094197bf60e6b7/TauCetiRoadmap/SchemeAndStackFoundations/README.md#scope-and-ownership)
  assigns the shared scheme foundations to this upstream roadmap and imports
  quasi-coherent algebras, relative Spec and graded algebras from their existing owners.
- [Layer 0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/cc8501ac47d864b56634cb1ba6094197bf60e6b7/TauCetiRoadmap/SchemeAndStackFoundations/README.md#layer-0-schemes-and-morphisms),
  especially §§0.1–0.3, already owns the small-affine-site comparison, qcqs
  direct-image algebra, relative-Spec morphism-property dictionary and general
  relative Proj. Thus even the genuine extensions distinguished by the historical
  atlas review now have an upstream owner. Layer 0 also owns henselization,
  excellence and perfection.
- [Suggested.lean](https://github.com/TauCetiProject/TauCetiRoadmap/blob/cc8501ac47d864b56634cb1ba6094197bf60e6b7/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean)
  imports AlgebraicVectorBundles and states Layer 0 interfaces, including
  `Proj.isPullback_baseChange` and the `Henselization` strand. Its absence of a
  declaration for a README-only target does not remove that target's owner.

The supplied read-only roadmap checkout remains at
`0d144d044dacebca17b654695b6f1ad58f159b27`, without this newer roadmap.
Its absence there does not supersede the exact current-main evidence above.
This session read the supplied AlgebraicVectorBundles and ModularCurves scope
and relevant owner statements, and the reviewed SF.0 library audit.

The supplied Tau Ceti checkout remains at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This session read the statements
of `QuasicoherentAlgebra`, `AffineSchemeOver` and `relativeSpec` in
`TauCeti/AlgebraicGeometry/RelativeSpec/Functor.lean`. These are current
ownership context, not new citations at the historical packet's older pins.
Neither shared checkout was changed or built; no repository was cloned or copied.

[WORKERS.md](../WORKERS.md) and
[PROTOCOL.md §15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
prohibit replanning an existing Tau Ceti roadmap. The issue authorizes only
its historical atlas packet, reader, suggested file and handoff; it does not
authorize edits to the authoritative upstream roadmap or to the queue.
Completing this historical revision would create a competing specification.

## Preserved mathematics and resumption

Only this handoff changes. Packet status and SF.0 coverage remain `partial`;
the independent review remains `needs_changes`. This checkpoint certifies
neither mathematical repairs nor implementation nor independent acceptance.

The unchanged packet has 139 nodes: 26 definitions, 26 constructions,
75 theorems, six comparisons, three lemmas and three applications. It has
383 API items and 226 tests on definitions/constructions (462 API items and
283 tests across all nodes), six planets, 492 baseline declarations, six
gaps and 11 requests. No node, API item, test, planet, source issue or
ownership transfer was added.

The [independent review](../reviews/REV-SchemeAndStackFoundations--SF.0.md)
and packet retain the exact unresolved contracts:

1. Reconcile relative-Spec and vector-bundle carriers with the existing owners,
   including the small-affine-site comparison adapter.
2. Supply Eakin–Nagata in the noncatenary-domain proof.
3. Close Stacks 07FE and 07FJ field-case desingularization inputs, retaining
   their hypotheses and proving strict growth of the bad-locus ideal.
4. Supply generic flatness with finite-presentation spreading over an arbitrary
   integral base (Stacks 052A).
5. Resolve projective-line, separated Chow and DVR inputs without reverse
   dependencies from SF.0 to its later layers.
6. Address the missing Lean interfaces and discriminating examples inventoried
   by the review, using the actual imported carriers and the current roadmap shape.

These historical findings were not newly reviewed here. Their correction
cannot be inferred from the upstream merge. An authorized follow-up must
compare each specific finding with the authoritative upstream specification.

Confirmed finding `RT-AREA-algebraicgeometry/11` keeps its existing handling:
SF.0 acquires no Weil-restriction construction. ModularCurves 0F owns the
affine finite-presentation case and base change, RG2.0a its assigned affine
finite-étale applications and R09.3 the algebraic-space extension. The current
upstream Layer 0 conventions also import ModularCurves 0F. No other owner's
files or Lawrence–Sawin routing were changed.

## Validation and required disposition

- `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`:
  zero errors and zero warnings on the unchanged packet. This is structural validation.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/BP-SchemeAndStackFoundations--SF.0~2.md`:
  zero problems.
- No Lean file changed or compiled in this session. The review's historical
  successful elaboration is not a new compilation result.
- No book was needed, no source passage was added, and no external source file
  was copied into the repository. The linked evidence suffices to resume;
  no scratch file is needed.

The maintainer must dispose of or explicitly redirect this stale atlas
assignment before another mathematical revision can proceed. Previous
ownership checkpoints merged in #9894, #9951, #9972, #9988, #9995, #10002,
#10029, #10034, #10038, #10044 and #10054: this is the twelfth submission of
the unresolved boundary. Automatic checkpoint intake repeatedly restores
availability without resolving the scope instruction. The queue needs a
maintainer disposition that prevents this repetition; changing its labels or
queue is outside this job's permitted deliverables. A redirected task needs
an explicit scope against the current upstream roadmap. This run submits
this checkpoint and stops without claiming a second issue.
