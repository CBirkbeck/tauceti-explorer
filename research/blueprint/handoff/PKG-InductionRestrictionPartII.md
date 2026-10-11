# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-NXYDao`, 11 October 2026.
Branch: `codex-NXYDao-package-induction-restriction`.
Base atlas commit: `df91fe32260d17ef3558ec5fd610ca2a56f047cb`.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6108488021)
for [claim comment 6108486825](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6108486825).
The issue and its complete instructions were reread after confirmation.
None of the manager's priority issues was available. The remaining available
reviews concerned excluded follow-up work, so this available package was the
eligible fallback. Only this job was claimed.

**Blocked; this is a checkpoint, not a finished package.** This continuation
updates only the handoff. The package issue permits three package files and
this note, prohibits packet changes, and directs the worker to report plan
mistakes here. The accepted plan explicitly leaves two prerequisite families
without an owner. Their assignment requires an amendment outside those four
paths. A manager clarification requesting supplying layer IDs or an amended
scope was submitted during this run; no resolution was supplied before this
checkpoint. The obstruction is dependency ownership, not compilation or the
run's time limit.

## The prerequisite amendment needed

The accepted packet has 109 nodes, six planned stages, zero closed stages,
five gaps and one request. Its accepted review retains those gaps. The
rescope proposal requires assigning the general integral homological bridge
once to a continuation of the existing foundations; it supplies no actual
stage ID. Parent InductionRestriction Layer 7 remains the ordinary-cover
owner, and cannot be silently enlarged to supply the general bridge.

| Contract needing an owner | Scope to preserve | Consumers |
| --- | --- | --- |
| Integral degree-two UCT | Native group homology/cohomology; arbitrary abelian coefficients with trivial action; oriented cycle evaluation; natural Ext injection in group and coefficient variables; free-abelianization bijectivity, including infinite groups. | RS.1 homological commutator and reduced-cover comparisons; RS.2 marked pullback splitting and universal comparison. |
| Central-extension homological sequence | Exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0 on specified maps; transgression evaluates the oriented commuting cycle as XYX⁻¹Y⁻¹; independence of section choices. | RS.1 homology image; RS.2 universal kernel; RS.5 compatible covers. |
| Finite integral homology | Finiteness and group-order annihilation in positive degrees, preserving the H₀ exception. | RS.3 finite-level action; RS.5 multiplier primary support and central coprime splitting. |
| Coprime degree-two edge | Native semidirect-product inclusion and projection; multiplier coinvariants; split edge filtration; the potentially incoming d₃ differential. | RS.5 multiplier-kernel primary support; RS.6 odd-index-two reduction. |
| Cyclic complement conjugacy | Finite coprime H,C, C cyclic, H possibly nonabelian; one H-conjugator identifies each actual complement with the standard complement through the projection maps. | RS.5 admissible inertia classes and their class bijection. |

The first four contracts form the unassigned homological bridge. The last is
the separate complement-conjugacy gap. Restricting UCT to finite or injective
coefficients would lose the application to the possibly infinite central
kernel of the universal marked extension.

The README and Suggested.lean already express these contracts, but a typed
signature with a sorry proof does not assign it to an authorized supplying
layer. Making them newly owned targets here would contradict the accepted
plan's boundary; removing them would leave unsupported target arguments.
PROTOCOL §§3, 15 and 20 and the issue's accepted-plan requirement prevent both
shortcuts.

## Fresh supplier checks

The supplied current upstream tree was inspected at
`c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No upstream file was edited or
used to run Lake.

- Read the current InductionRestriction and AlgebraicTopology READMEs in
  full. Parent Layer 7 owns ordinary representation groups and factor-set
  classes, not the general native integral bridge. AlgebraicTopology Stage 6,
  item 1 specifies UCT for singular cohomology of spaces; it does not specify
  the required native group-homology comparison or extension transgression.
- Searched the current upstream roadmap and Completed README/Suggested.lean
  inventory for universal coefficients, extension homology and complement
  conjugacy, then inspected the relevant matches. No matching complete
  supplier assignment emerged. This is a search result, not a proof that no
  possible supplier can be developed.
- Read `TauCeti.ChainComplex.kronecker_bijective` in current
  `TauCeti/Algebra/Homology/Kronecker.lean`, line 177: its coefficient object
  must be injective. It cannot discharge arbitrary-coefficient UCT. Its
  generic evaluation map remains a reuse input.
- Read the exact pinned Mathlib
  `Subgroup.exists_right_complement'_of_coprime` statement in
  `Mathlib/GroupTheory/SchurZassenhaus.lean`, line 277. It asserts existence
  of a complement, not conjugacy of two complements.
- Read the relevant reviewed library-audit rows R17.5 and MP.1. They identify
  factor-set/lifting APIs and parent Layer 7 ownership, not the missing
  homological bridge. The audit has no row for this roadmap or its alias.
- Read the accepted packet's review, coverage, requests and rescope proposal.
  No supplying stage for either unassigned family has been added there.

The cleared-library index was read. No restricted source was copied, and no
new paper extraction or source-error assertion is made in this continuation.

## Fresh correspondence and validation checks

A comment-masked scan of Suggested.lean found real named declarations for
**all 109 target names** and **all 124 API names** in the accepted packet.
Each of its **96 test labels** leads to a Lean example, including labels
followed by an intervening include command. All 109 target names also occur
in the README. The file has 555 named declarations in total.

| Layer | Target declarations | API declarations | Test examples |
| --- | ---: | ---: | ---: |
| RS.1 | 14 | 29 | 21 |
| RS.2 | 16 | 29 | 21 |
| RS.3 | 11 | 28 | 24 |
| RS.4 | 19 | 22 | 18 |
| RS.5 | 11 | 4 | 3 |
| RS.6 | 38 | 12 | 9 |
| Total | 109 | 124 | 96 |

This establishes signature presence, not mathematical equivalence of every
prototype to its specification or implementation of the finite certificates.
The arbitrary-coefficient UCT signatures and natural Ext-injection API were
also read directly. They preserve their required coefficient generality and
map variance.

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**, with the five gaps and one request still explicit.
- Fresh `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **exit 0, 696 declaration-uses-sorry warnings, zero errors and zero other
  warnings**. The memory preflight found 85 GiB available. The shared wrapper
  checked against Mathlib `082e2d37e8`; the full source commit was independently
  confirmed as `082e2d37e8b0463410cdb532e111cd43d5a66174`. The check finished,
  and no compiler remains running.
- README: 171,706 bytes, SHA-256
  `2194010224101d49bf7b8b6ae15598bd6231bdc0c10588b09c558d1789a6662a`.
- Suggested.lean: 191,498 bytes, SHA-256
  `32b58343fb5be7e738e1f5a075add4d9ccd3cef8239f1c9a89fc8f4727cb30e7`.
- The package metadata is ready as `topic = "math.GR"`, but is deliberately
  absent. `research/blueprint/issues.py:deliverables_complete` treats a
  package as complete solely when all its outputs exist; it does not inspect
  this blocked handoff. Adding the last file would therefore falsely finish
  the job. No metadata or other package-file change is submitted.

## Where to resume

Assign real supplier roadmap/layer IDs for the two families above and
reconcile those assignments with the accepted packet, roadmap definition,
reader and suggested interfaces. Those ownership files are outside this
package issue's authorized paths. Gate the package on that amendment instead
of releasing the same unresolvable package to another worker. Queue edits and
manual labels are outside this job's scope.

After the amendment, finish the mathematical correspondence audit, retain
parent Layer 7's ordinary-cover boundary, and preserve all 38 RS.6 targets,
including the 31 finite table-row certificate obligations and the order-96
marked cover. These are roadmap targets with admitted prototypes, not claims
of implemented certificates. Add the metadata after the package meets its
completion requirements, and re-elaborate if signatures change.

No mathematical target moved in this continuation. The
[preceding handoff at the immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/df91fe32260d17ef3558ec5fd610ca2a56f047cb/research/blueprint/handoff/PKG-InductionRestrictionPartII.md)
preserves links to earlier source receipts, finite-model checks and mutation
checks. Those are inherited evidence, not fresh checks claimed by this
session. No scratch file is needed to resume.
