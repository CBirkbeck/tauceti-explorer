# Review checkpoint: Automorphic Galois Representations Part II, revision 2

Issue #10008, job `REV-AutomorphicGaloisRepresentationsPartII~2`. Codex, session
`codex-P5lc4w`, 2026-10-16. **Blocked checkpoint; the independent mathematical
review is unfinished.** This report supplies no new review verdict.

## Input and prerequisite

The bot confirmed this session's claim in
[comment 6218018859](https://github.com/CBirkbeck/tauceti-explorer/issues/10008#issuecomment-6218018859).
The original author was session `codex-y94Tyw`; revision 2 was handled by
`codex-1KTNLb`; the preceding independent reviewer was `codex-4MPfgD`.
This session did none of those jobs.

The issue explicitly waits for `BP-AutomorphicGaloisRepresentationsPartII~2`,
issue #10007. Its latest submission,
[PR #10012](https://github.com/CBirkbeck/tauceti-explorer/pull/10012), was merged
on 2026-10-16 as a **blocked checkpoint**, at atlas commit
`01af2c27ade35f2a1649f2ff9e7daeb7c47b14ee`. The packet remains `partial` and
`revisionProgress.status` remains `blocked_checkpoint`. The
[revision handoff](../handoff/BP-AutomorphicGaloisRepresentationsPartII~2.md)
requires executable integration and validation before the revision becomes
complete. The available label on the review does not establish that this
prerequisite has finished.

Compared the checkpoint commit with its parent. The baseline, sources, all
16 physical nodes, all 108 imported contracts, reuse/exclusion metadata,
dependency/parent reconciliations, requests, coverage, source-issue decisions,
restructuring proposals and existing independent review are unchanged.
The first 17 mathematical gaps are unchanged. The suggested file is also
unchanged. Revision 2 adds progress metadata and downstream-reference evidence
to integration gap 18; its reader changes describe that checkpoint. It does
not implement the repair required by the
[preceding review](REV-AutomorphicGaloisRepresentationsPartII.md).

## Integration blocker independently reproduced

Ran the executable, read-only probe embedded in the revision handoff against
the current checkout. It calls the actual `scripts/blueprints.py` merger with
the two promoted historical part packets and the proposed continuation.
Previously generated blueprint planets are removed from the input snapshot
in memory, so the probe starts from ordinary roadmap layers. No repository
data or historical packet is written.

| Check | Fresh result |
| --- | --- |
| Current merger, historical parts plus continuation | 129 declarations, 54 planets |
| Desired continuation, including full imported contracts | 124 declarations, 46 planets |
| Desired contracts differing in semantic fields | 35 |
| Excluded targets retained by the current merger | All five |
| Desired complete-contract model | All 124 node dictionaries agree |
| Desired internal target graph and layer contraction | Both acyclic |
| External prerequisites on excluded targets | Six logical references in three consumers, present in both research and promoted packets |

The compared semantic fields are `statement`, `hypotheses`, `prerequisites`,
`parentStageId`, `realises`, `api` and `tests`. The prior review already lists
the 35 affected contracts; the fresh comparison reproduces that count.
The desired model applies the full contracts and removes exclusions in
in-memory historical copies. Its successful checks do **not** install a
production repair or establish global atlas acyclicity.

The production layer cycle also remains. The character-twist target in
AG2.2 supplies the polarized-construction target owned by AG2.3. That target
supplies the historical CS discrete-normalization target still owned by
AG2.2. The proposed move of the latter to AG2.3 is unapplied. These are
stable target ids with different owning parents, so reading the stage prefix
in an id is insufficient to check the order.

The three external consumers are
`IgusaVarietiesAndTorsionConcentration:IG.7/cs-generic-maximal-ideal`,
`IgusaVarietiesAndTorsionConcentration:IG.7/cohomologically-generic` and
`PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra`.
Each lists both obsolete AG2.7 generic-ideal targets. Their removal needs
coordinated redirects; deleting them alone leaves dangling references.
No other roadmap's physical node prerequisites referenced the three excluded
GSp4 targets in the two packet directories scanned. That scoped scan does
not cover every possible representation of a dependency.

Read the current upstream IHG README, Layer 3b.1, and the actual predicates
in its Suggested file, lines 555–573, at TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27`.
`Spherical.IsGaloisType` requires continuous semisimple realization of the
specified residue-field Frobenius polynomials; `Spherical.IsNonEisenstein`
additionally requires absolute irreducibility. They are existing generic
suppliers, not a theorem of geometric existence or concentration. The
revision's proposed IHG redirect therefore preserves the stated ownership
boundary. This was a read-only inspection; no upstream build or edit ran.

The implementation explains the discrepancy. `merge_blueprints` collects
only physical `nodes`; it does not apply the import contracts, exclusions or
reconciliation metadata. The promoter copies the continuation without
interpreting that metadata. The ordinary checker also examines physical
nodes, and rejects same-roadmap ids already present in another blueprint
packet. Merely moving all imported contracts into `nodes` would retain the
obsolete historical targets and introduce duplicate-id errors.

## Scope and checks

[WORKERS.md](../WORKERS.md), “Doing the work”, requires: “Edit only the files
the issue names, plus your own scratch space.” Issue #10008 permits its
review report, packet, reader and suggested file, together with the standard
job handoff. The merger, checker, historical parts and external consumer
packets are outside that scope. This checkpoint changes only this report and
the handoff. The existing packet review remains attributed to its original
reviewer, with `needs_changes`; no earlier source-issue verdict is relabelled.

- The inherited packet passes `python3 scripts/check_blueprint.py` with zero
  errors and zero warnings. This check counts 16 physical nodes, 59 API
  items, 43 tests and 13 planets, not the full proposed inventory.
- Independently counted the desired contracts: 14 definitions, 24
  constructions, 64 theorems, six lemmas and 16 comparisons; 189 API items
  and 139 tests. All 124 retain unchecked implementation status.
- `lean-check` on the unchanged 221-line suggested file exits 0 with exactly
  31 declaration-uses-proof-placeholder warnings and no errors or other
  warnings. The shared pinned environment was used after checking memory.
- The report and handoff pass the submission file/content check and
  `git diff --check`.

No mathematical source locator or pinned baseline declaration was
independently verified in this checkpoint. The 26 source records, 15 baseline
citations, 16 source issues, 49 requests, APIs/tests and 11 assigned red-team
findings still require this review's own checks. The earlier mathematical
review remains its author's evidence; neither the graph probe nor successful
Lean elaboration replaces those checks.

## Resume condition

The maintainer must enable the executable supersession/exclusion repair and
coordinated consumer redirects, then finish revision #10007. Its handoff
already contains an executable probe and the exact candidate contracts.
Validate the real promotion path, complete-contract equality, exclusions,
external references and layer/tier order before marking that revision
complete. Releasing this review again without that prerequisite does not
resolve the blocker.

Then perform every mathematical review check in issue #10008 and replace the
packet's review object only when a finished independent verdict is justified.
This checkpoint does not accept, reject or re-review the unfinished revision.
