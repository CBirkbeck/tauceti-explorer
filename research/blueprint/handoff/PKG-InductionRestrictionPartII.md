# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-YqdEV6`, 11 October 2026.
Branch: `codex-YqdEV6-induction-restriction-checkpoint`.
Base atlas commit: `517d1829d0fc041f39f5b88fd54e5ba8459ba55c`.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6107970551)
against claim comment 6107969213; the full issue was reread after confirmation.
None of the manager's forty priority issues appeared in the available swarm
inventory. No eligible finished-plan or package review was available; this
was the available fallback package. Only this job was claimed.

**Blocked; the package remains unfinished.** This continuation updates only
the handoff. The accepted plan requires prerequisite ownership assignments
that this package job cannot make: the issue permits only the three package
files and this handoff, and explicitly prohibits packet edits. This is an
ownership and scope obstruction, not a time limit or compilation failure.

## What prevents completion

The issue describes an accepted complete plan, but `complete` means one
finished planning pass under PROTOCOL §0, not dependency closure. The packet
has 109 nodes, six planned stages, zero closed stages, five gaps and one
ordinary-cover request. Its accepted review explicitly preserves these gaps.
Its rescope proposal requires assigning the generic integral homological
package once, with no supplier edge until a stage with that scope exists.

Two gaps still require ownership decisions:

| Required supplier contract | Scope that must survive the amendment | Consuming targets |
| --- | --- | --- |
| Integral degree-two UCT | Native group homology/cohomology; arbitrary abelian coefficients with trivial action; cycle evaluation; natural Ext injection in group and coefficient variables; free-abelianization bijectivity, including infinite groups. | RS.1 homological commutator and reduced-cover comparisons; RS.2 marked pullback splitting and universal comparison. |
| Central-extension homological sequence | Exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0 on the specified maps; transgression evaluates the oriented cycle as XYX⁻¹Y⁻¹; independence of section choices. | RS.1 homology image; RS.2 universal kernel; RS.5 compatible covers. |
| Finite integral homology | Positive-degree finiteness and annihilation by the group order; reuse native transfer and preserve the H₀ exception. | RS.3 finite-level action; RS.5 multiplier primary support and central coprime splitting. |
| Coprime degree-two edge | Native semidirect-product inclusion and projection; multiplier coinvariants; split edge filtration; treatment of the potentially incoming d₃ differential. | RS.5 multiplier-kernel primary support; RS.6 odd-index-two reduction. |
| Cyclic complement conjugacy | Finite coprime H,C with C cyclic and H possibly nonabelian; one H-conjugator identifies each actual complement with the standard complement through the projection maps. | RS.5 admissible inertia classes and their class bijection. |

The first four contracts constitute the packet's unassigned homological bridge.
The last is its separately recorded complement-conjugacy gap. Ordinary Schur
covers retain their owner: parent InductionRestriction Layer 7. Neither that
parent citation nor H²(G,kˣ) can replace the general integral homological
bridge. Restricting UCT to finite or injective coefficients would lose the
RS.2 pullback application to the infinite kernel of the universal extension.

The existing package prototypes state these input contracts, but that does
not assign them to an authorized supplying layer. PROTOCOL §§3, 15 and 20
require real dependency ownership and agreement with the accepted plan.
Packaging them as newly owned targets would contradict the plan's rescope
boundary; deleting them would leave unsupported target proofs. A successful
signature compilation resolves neither issue.

## Fresh checks in this continuation

- Rechecked the packet, its accepted review, rescope proposal, roadmap
  definition and inherited handoff. The packet remains SHA-256
  `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5`.
- Checked the supplied current read-only upstream tree at
  `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and current Tau Ceti at
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the parent Layer 7
  boundary, related upstream documentation and the relevant library-audit
  entries at R17.5 and MP.1. No upstream files were changed or used to run Lake.
- Read `TauCeti.ChainComplex.kronecker_naturality` and
  `kronecker_bijective` with their hypotheses in
  `TauCeti/Algebra/Homology/Kronecker.lean`. They supply generic evaluation
  naturality and bijectivity for an injective coefficient object, respectively;
  the latter is insufficient for arbitrary abelian coefficients.
- Read `TauCeti.homCokernelEquivExt`, its representative formula and coefficient
  naturality in `TauCeti/Algebra/Homology/Ext/Presentation.lean`. They compute
  Ext¹ from a short exact sequence with projective middle term. The native
  group-bar comparison and full two-variable UCT still need their assigned
  supplier. These current declarations are reuse evidence beyond the old pin,
  not an assertion that the pinned suggested file imports them.
- Read `TauCeti.groupHomology.transfer_comp_map_subtype_id` in
  `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`.
  It gives transfer followed by inclusion as the subgroup index times the
  identity in every degree; the supplier must reuse this API.
- Read pinned Mathlib `Subgroup.exists_right_complement'_of_coprime` and its
  left-complement corollary in `Mathlib/GroupTheory/SchurZassenhaus.lean`.
  They conclude existence of a complement, not conjugacy. Rechecked the
  RS.5 `admissible-inertia-classes` node's exact missing use.
- Targeted checks of roadmap definitions, reserved IDs and key-definition
  owners did not find a replacement ownership assignment for the specified
  contracts. This is a scoped search result, not a catalogue-wide absence
  theorem. The supplied upstream/library commits match the preceding handoff.
- Read the cleared-library index. This continuation makes no new source
  extraction or source-error claim and copies no restricted source material.

## Validation and retained work

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**, with 109 nodes, 124 API items, 96 tests,
  30 planets and 30 baseline declarations. The five gaps and one request
  remain explicit; structural validation does not close them.
- Fresh `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **exit 0; 696 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. Memory preflight found 94 GiB available. The wrapper used the
  shared pinned build and reported Mathlib `082e2d37e8`. The check completed;
  no compiler remains running.
- README remains 171,706 bytes, SHA-256
  `2194010224101d49bf7b8b6ae15598bd6231bdc0c10588b09c558d1789a6662a`.
  Suggested.lean remains 191,498 bytes, SHA-256
  `32b58343fb5be7e738e1f5a075add4d9ccd3cef8239f1c9a89fc8f4727cb30e7`.
  Metadata is still absent; this checkpoint does not mark the package complete.
- `git diff --check` and the intake file check pass for the handoff.

## Where to resume

The maintainer must assign genuine supplier roadmap/layer IDs and reconcile
this roadmap's accepted packet, definition, reader and suggested interfaces.
The package worker's authorized four paths do not include those ownership
files. No mathematical target has moved in this continuation.

After that amendment, finish the correspondence audit against all 109 targets,
keep parent Layer 7's cover boundary, and preserve all 38 RS.6 targets,
including the 31 finite table-row certificate obligations and the order-96
marked cover. The certificate obligations are roadmap targets; this handoff
does not claim their implementation. Re-elaborate after signature changes and
add `topic = "math.GR"` when the package is complete.

The queue entry still has `after: []` and state `pending`; handoff-only merges
release this package again without resolving its blocker. Gate the package on
the ownership amendment and its suppliers, instead of asking another package
worker to repeat the same check. Queue edits and manual relabelling are outside
this job's scope.

The [preceding handoff at this immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/517d1829d0fc041f39f5b88fd54e5ba8459ba55c/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
preserves source receipts and links to earlier finite-model, mutation and
boundary-proof evidence. Those results are inherited, not new work by this
session. No scratch file is needed to resume.
