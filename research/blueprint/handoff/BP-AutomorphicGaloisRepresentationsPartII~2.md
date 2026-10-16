# BP-AutomorphicGaloisRepresentationsPartII~2

Issue #10007; Codex, session `codex-1KTNLb`; 2026-10-16.

This is a **blocked checkpoint**, with packet status `partial`. The required integration repair touches files outside the issue's four deliverables. No scope expansion has been granted. The complete mathematical specification and the preceding independent review's corrections are retained. The review object remains unchanged, with verdict `needs_changes`; this worker has made no independent review decision.

## What changed this round

The [packet](../packets/AutomorphicGaloisRepresentationsPartII.json) now records the blocked revision explicitly, the completed verification, the exact remaining integration work and three downstream consumers requiring six prerequisite redirects. The [reader](../readmes/AutomorphicGaloisRepresentationsPartII.md) distinguishes the partial revision from its complete mathematical planning inventory and includes the new consumer finding in gap 18. The [suggested file](../suggested/AutomorphicGaloisRepresentationsPartII.lean) is unchanged and was freshly elaborated successfully.

No mathematical target, stable id, API, test, request, coverage record, baseline citation, source-issue verdict or independent review object was changed. Nothing was written to application code, historical part packets, consumer packets, promoted data or current upstream work. The [previous handoff](BP-AutomorphicGaloisRepresentationsPartII.md) and [independent review](../reviews/REV-AutomorphicGaloisRepresentationsPartII.md) remain the detailed mathematical provenance. The review's corrected inventory supersedes the previous handoff's older API/test counts.

## Inventory and coverage

The proposed specification has 124 targets: **14 definitions, 24 constructions, 64 theorems, six lemmas and 16 comparisons**. It has **189 API items, 139 discriminating tests, 46 planets and 15 pinned baseline declarations**. There are 26 source records, 16 source issues, 49 supplier requests and 18 gaps: 17 mathematical/supplier gaps and the integration blocker. No source or mathematical gap was closed in this revision.

There are 16 physical packet nodes and 108 complete contracts in `importChecks`; the five excluded historical targets are outside the proposed inventory. Counts of 124 and 46 describe the desired effective specification, not the current production merge.

| Stage | Coverage retained | Remaining work |
| --- | --- | --- |
| AG2.0 | planned | AF algebraicity/rationality, character and period specialization APIs. |
| AG2.1 | source_decomposed | Process aggregate of AG2.1a/AG2.1b, with no mathematical targets. |
| AG2.1a | planned | Coefficient projectors, compact ramified geometry, polarized effectivity and the early fixed-point theorem. |
| AG2.1b | planned | Compact EL cohomology, normalized smooth Ext/Mantovan comparison, weight cancellation and irreducible-multiplicity divisibility. |
| AG2.2 | planned | Character, transfer and solvable-base-change supplier contracts; dedicated ownership of GSp4-specific results. |
| AG2.3 | planned | Definite-unitary family/classicality, representation realization, period closedness, patching and realization-field descent. |
| AG2.4 | planned | Ordinary boundary, functorial dagger/rigid comparison, integral interpolation witnesses and factor separation. |
| AG2.5 | planned | Integral Bernstein/inertia specialization, pure WD comparison and nearby-cycle inputs; Liu's conditional range remains explicit. |
| AG2.6 | planned | Separate coefficient-prime geometry and AHTW quantitative cohomology, arbitrary-multiplicity pseudodeformations, boundary and maximal-orbit extensions. |
| AG2.7 | planned | Residual descent/polarization and automorphic applications of IHG's existing ideal predicates. |

No stage is closed or implemented. Mathematical coverage remains planned because every target's chain ends at a baseline declaration, supplier or precise gap. The revision remains partial because the reviewed contracts still cannot be installed by the permitted files.

## Why this is blocked

[WORKERS.md](../WORKERS.md), “Doing the work”, requires: “Edit only the files the issue names, plus your own scratch space.” The issue repeats the same restriction and specifically excludes application code, data, tests and other packets. Its four permitted files cannot change the production merger/checker or the historical and downstream packets. Approval for a scoped infrastructure repair was requested during this run; no approval was received before this checkpoint.

`scripts/blueprints.py:merge_blueprints` unions physical `nodes` by stable id, in packet order, with later definitions winning. It does not apply `importChecks`, exclusions or reconciliation metadata. `replaced_layers` trims older decompositions, not the two historical blueprint packets. `scripts/promote.py` copies the packet/reader without performing these edits. `scripts/check_blueprint.py` checks physical nodes and rejects duplicate same-roadmap blueprint ids, so merely materializing the 108 contracts would neither pass the ordinary checker nor remove the five obsolete targets.

Fresh in-memory calls of the actual production merger reproduce **129 declarations and 54 planets**, with **35 unapplied semantic contracts**. The comparison fields are `statement`, `hypotheses`, `prerequisites`, `parentStageId`, `realises`, `api` and `tests`; the independent review lists all 35 differences. All five excluded nodes remain. The internal target graph is acyclic, but contraction to owning layers retains **AG2.2 ↔ AG2.3**, because the historical CS discrete-normalization target has not moved to AG2.3.

In-memory historical-packet copies with the five exclusions removed, followed by the complete 124-contract specification, give **124 declarations and 46 planets**. All 124 effective node dictionaries equal their desired contracts, and both the internal target graph and its layer contraction are acyclic. This establishes a reproducible candidate graph, not an installed repair or a certificate for the whole atlas.

The four parent moves retain their historical ids:

| Target suffix | Desired owning layer |
| --- | --- |
| `AG2.0/the-normalization-dictionary-fixed-by-the-sources` | AG2.5 |
| `AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris` | AG2.3 |
| `AG2.2/cs-discrete-polarization-normalization` | AG2.3 |
| `AG2.3/finite-number-field-of-realization` | AG2.6 |

The excluded suffixes are `AG2.7/hecke-maximal-ideal-of-galois-type`, `AG2.7/non-eisenstein-maximal-ideal`, `AG2.6/gsp4-crystalline-hodge-comparison`, `AG2.6/ordinary-gsp4-coefficient-prime-shape` and `AG2.6/pilloni-gsp4-normalization-comparison`. The three GSp4 contracts retain their explicit proposed dedicated owner and source/gap routing; no nonexistent supplier stage has been invented.

## New finding: consumers of excluded generic ideal targets

Each consumer below has **both** obsolete generic-ideal ids as physical prerequisites. This occurs in its research packet and its promoted `data/blueprints` packet: six logical references in each representation of those packets.

| Consumer | Obsolete prerequisite suffixes | Correct existing supplier |
| --- | --- | --- |
| `IgusaVarietiesAndTorsionConcentration:IG.7/cs-generic-maximal-ideal` | Both AG2.7 ideal targets | IHG.3, current upstream Layer 3b |
| `IgusaVarietiesAndTorsionConcentration:IG.7/cohomologically-generic` | Both AG2.7 ideal targets | IHG.3, current upstream Layer 3b |
| `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra` | Both AG2.7 ideal targets | IHG.3, current upstream Layer 3b |

The existing supplier is `IntegralHeckeAndGaloisDeterminants:IHG.3`; its current upstream Layer 3b names `Spherical.IsGaloisType` and `Spherical.IsNonEisenstein`. Their actual definitions were read: continuous semisimple realization of the prescribed residue-field Frobenius polynomials, with absolute irreducibility additionally required for non-Eisensteinness. They supply generic predicates, not automatic geometric existence or concentration. The consumer statements require these predicates, so a second generic definition in AG2 would duplicate existing work.

An executable repair must redirect these references before, or atomically with, removal of the two old nodes. Otherwise a local 124-node count conceals dangling external dependencies. No references to the three excluded GSp4 nodes were found among other roadmaps' physical `nodes[].prerequisites` in either packet directory. This scan does not cover every possible atlas/source representation and is not a global acyclicity claim.

## Review corrections freshly checked

The five source/contract corrections from the independent review were rechecked and retained, without adding targets or source-issue verdicts:

| Correction | Primary-source locator read | Contract checked |
| --- | --- | --- |
| Auxiliary character in the discrete export | Caraiani–Scholze, Theorem 5.5.4, Corollary 5.5.5 and Remark 5.5.6, printed pp.744–746 | The two-block parity twist includes the actual character ϖ composed with the norm and determinant. At block sizes 2 and 1, the first twist includes this auxiliary factor and the second does not. The finite away-ℓ range and transfer hypotheses remain. |
| Splitting field in the earlier discrete normalization | Same CS locators, with the setup in §5.1 | The corrected imaginary quadratic field 𝒦 is used consistently, rather than the undefined printed F₀. The stable id remains assigned to AG2.3 in the desired graph. |
| Family comparison distinct from a memberwise assertion | Chenevier–Harris, Theorem 3.2.3, pp.11–12, Proposition 3.2.5, p.12, and §4, p.13; ACC+ §7.1, Lemmas 7.1.9–7.1.10, pp.1093–1094 | The AG2.6 target assembles conditional memberwise comparisons on the existing family carrier. Common polynomials do not manufacture canonical intertwiners or a strong realization field. Extremely weak versus very weak compatibility, the density-one DGI hypothesis and rank-two specialization stay distinct. |
| Artin reciprocity versus rational normalization | ACC+ Notation, printed pp.906–907; current upstream LocalGaloisGroups character conventions | Geometric Frobenius and the source's terminology for the rationally normalized correspondence are separate choices. Current upstream arithmetic reciprocity needs the explicit inversion dictionary. |
| Shin title and strength of citation | Shin, *Stable trace formula for Igusa varieties*, Definition 4.2, pp.13–14, §4.4/Theorem 4.4, p.15 | This is the stable-Igusa paper; its counting theorem restates [Shi09, Theorem 13.1]. Reading it does not establish the earlier proof or the general early compact fixed-point theorem. The polarized-effectivity and Fujiwara/Varshavsky gaps remain. |

Public PDFs were read directly at the packet's URLs. Their SHA-256 digests agree with the catalog: CS `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`; CH `9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529`; Shin stable Igusa `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0`. ACC+ was read in place from the maintainer-cleared library. No cleared PDF or source passage was copied. This revision does not claim to have reread every historical source; the previous review's version-scoped source-issue decisions remain its own.

HT01 remains unavailable under the permitted access rule. Its precise coefficient-projector recipe, weight-cancellation and multiplicity obligations remain gaps; no unauthorized book copy was used.

## Baseline, ownership and checks

All 15 cited Mathlib declarations and surrounding hypotheses were read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. They provide algebraic CM, characteristic-polynomial, matrix and semisimplicity components, not the missing automorphic/geometric carriers. The reviewed library audit for all ten stages and the accepted RS-12 restrictions were reread. No new target was planned.

Current upstream roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. Relevant README and Suggested statements in IHG and LocalGaloisGroups were read. The former already supplies the generic predicates above; the latter requires the reciprocity dictionary. No builds or edits were performed in that environment.

The 11 assigned confirmed red-team findings and their independent dispositions were reread: langlands-1/2, /3, /4, /5, /16, /18, /19, /20, /26 and padic-2/22, /32. Their accepted boundaries remain unchanged. In particular compact raw geometry precedes stabilization/local comparison; compatible-family primitives remain below R24 under the tier rule; R19 comparisons remain conditional; GSp4 work retains its dedicated proposed owner; and IHG witnesses, log-crystalline comparison and AHTW extensions remain exact supplier obligations. No external consumer was edited.

Validation completed:

- Ordinary packet checker: zero errors, zero warnings; this checks 16 physical nodes, 59 API items, 43 tests and 13 planets. It does not inspect the 108 import overrides as nodes.
- Complete-contract checker probe: zero errors, zero warnings on all 124 contracts, 189 API items, 139 tests and 46 planets. Historical same-roadmap duplicates were removed from its in-memory context only. No declaration index was supplied for this probe; all 15 baseline statements were read directly. Nothing was promoted.
- Production merger probe and complete dictionary comparison: current 129/54 versus desired 124/46; 35 unapplied contracts and five retained exclusions reproduced. Desired internal target and layer DAGs pass. No desired internal prerequisite refers to an excluded target.
- Reader comparison: every one of the 124 effective statements and target ids is present.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII.lean`: **exit 0**, with **31 permitted proof-placeholder warnings** and no errors. Available memory was checked before elaboration. The 221-line file remains unchanged, with no omitted data body; no language server or build/cache/update command was used.
- Submission file checks: four permitted deliverables checked, zero problems; `git diff --check` and the omitted-data-body guard pass. The reproducible Python probe below was extracted from this handoff and executed successfully.

## Reproduce the integration finding

Run from the repository root. Put the following Python probe in the next worker's own scratch directory; it writes no repository or promoted files. The complete-contract checker probe can additionally use a scratch JSON containing `full`, with the standard checker's `world()` context filtered to remove only same-roadmap historical node/packet entries. That filtering models replacement; it is not a checker repair.

```python
import copy
import json
import sys
from collections import defaultdict
from graphlib import TopologicalSorter
from pathlib import Path

root = Path.cwd()
sys.path.insert(0, str(root / 'scripts'))
from blueprints import merge_blueprints

rid = 'AutomorphicGaloisRepresentationsPartII'
p = json.loads((root / 'research/blueprint/packets' / f'{rid}.json').read_text())
parts = [(f.stem, json.loads(f.read_text()))
         for f in sorted((root / 'data/blueprints').glob(f'{rid}--*.json'))]
assert len(parts) == 2
atlas = json.loads((root / 'data/atlas.json').read_text())
generated = {s['id'] for s in atlas['stages']
             if (s.get('expansion') or {}).get('blueprint')}
atlas['stages'] = [s for s in atlas['stages'] if s['id'] not in generated]
atlas['stageEdges'] = [e for e in atlas['stageEdges']
                       if not {e['source'], e['target']} & generated]
for r in atlas['roadmaps']:
    r['stages'] = [s for s in r['stages'] if s not in generated]

def union(packets):
    return {n['id']: n for _, q in packets for n in q['nodes']}

def counts(packets):
    merged = merge_blueprints(atlas, packets, {})
    b = next(r['blueprint'] for r in merged['roadmaps'] if r['id'] == rid)
    return b['declarations'], b['planets']

desired = {n['id']: copy.deepcopy(n) for n in p['nodes']}
for c in p['importChecks']:
    n = {k: copy.deepcopy(v) for k, v in c.items()
         if k not in ('target', 'ownerPacket', 'contractStatus')}
    n['id'] = c['target']
    assert n['id'] not in desired
    desired[n['id']] = n
excluded = {e['nodeId'] for e in p['excludedReusedNodes']}
physical = union(parts + [(rid, p)])
fields = ['statement', 'hypotheses', 'prerequisites', 'parentStageId',
          'realises', 'api', 'tests']
assert sum(any(physical[i].get(k) != n.get(k) for k in fields)
           for i, n in desired.items()) == 35
assert set(physical) - set(desired) == excluded
assert counts(parts + [(rid, p)]) == (129, 54)

full = copy.deepcopy(p)
full['nodes'] = list(desired.values())
model = [(s, {**q, 'nodes': [n for n in q['nodes'] if n['id'] not in excluded]})
         for s, q in parts] + [(rid, full)]
assert union(model) == desired
assert counts(model) == (124, 46)
graph = {i: set(n['prerequisites']) & desired.keys() for i, n in desired.items()}
list(TopologicalSorter(graph).static_order())
layers = defaultdict(set)
for i, n in desired.items():
    assert not excluded & set(n['prerequisites'])
    for dep in graph[i]:
        a, b = n['parentStageId'], desired[dep]['parentStageId']
        if a != b:
            layers[a].add(b)
list(TopologicalSorter(layers).static_order())

for directory in ('research/blueprint/packets', 'data/blueprints'):
    refs = []
    for f in sorted((root / directory).glob('*.json')):
        q = json.loads(f.read_text())
        if q.get('roadmapId') == rid:
            continue
        for n in q.get('nodes', []):
            refs.extend((n['id'], ref)
                        for ref in sorted(excluded & set(n.get('prerequisites', []))))
    assert len(refs) == 6
    print(directory, refs)
print('Current 129/54; proposed model 124/46; internal DAG checks passed.')
```

## Where to resume

1. Resolve the file-scope blocker with the maintainer. The executable path needs scoped infrastructure support, or coordinated historical/consumer updates authorized to their owners. Likely infrastructure touchpoints are `scripts/blueprints.py`, `scripts/check_blueprint.py` and focused regression tests; promoter behavior must also be checked. These files were not edited here.
2. Define and validate one effective contract per stable id. Install the complete import overrides and all four parent placements, exclude exactly the five obsolete targets, and preserve historical independent-review provenance. Do not rename targets to evade duplicate checking or add generic predicate aliases owned by IHG.
3. Resolve the six external references to the two generic ideal targets in the same execution. Use the existing IHG supplier; do not fabricate a missing atlas node id. Preserve the dedicated GSp4 routing and its gap.
4. Run the real promotion/merge path with historical parts and consumers. Check full dictionary equality for all 124 contracts, counts 124/46, all exclusions absent, no dangling references, and internal/global graph and tier order. Add meaningful regression coverage for replacement, invalid ownership/imports and external redirects. The scratch simulation above is evidence for the desired contract, not a substitute for this step.
5. Run the ordinary packet/submission checks and retain the successful Lean result unless the suggested file changes. Update packet/reader/handoff to describe the installed behavior, then set status to `complete` for a different worker's independent review. Keep the existing review object until that reviewer replaces it.

The mathematical pass does not need restarting. Its open requests and precise source/proof gaps are already enumerated in the packet and reader. This checkpoint stops at the integration authorization boundary and claims no second job.
