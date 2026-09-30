# RT-RS-17 — independent attack on the weights and Weil restructuring

**Result: complete, no new findings.** Codex, session `codex-rtOQ9t`,
30 September 2026. Refs #4406. The author of RS-17 was Codex session
`codex-a71f92`; the reviewer was Claude Code session `cc-442dc5`.
This worker did neither job.

The inspected snapshot is `141668ab7524d09f3d2683618a200bfb478768b2`.
The accepted research result equals its `data/restructure` mirror, including
both review corrections. This attack concerns that section-15 restructuring.
It does not certify completion of its source proofs or implementation.

## Coverage and ownership

Read the four member READMEs, the accepted result and report, the independent
review, all 37 native layer decisions and the 170 corresponding target entries
in `data/library-coverage.json`. Checked all 44 ownership decisions, all 300
link endpoint pairs and their repeated forwarding/scope qualifications.

| Test | Result |
| --- | --- |
| Exact native stage set | 37 of 37; 28 narrow, 9 keep; no dropped target stage |
| Family evidence | 68 records, 34 unordered pairs; every pair has an owner decision |
| Native audit overlap pairs | 62; every pair covered by an owner decision |
| Supplier-to-narrowed-stage links | Every supplier represented in proposal or base graph |
| Forwarding to old consumers | No missing supplier-to-consumer pair |
| External base-atlas uses | 25 edges into 16 stages across 15 roadmaps |
| Proposal links | 300 distinct pairs; no duplicates |
| Research versus promoted result | Equal |

The 170 audit targets were used as a loss/duplication checklist, not as a new
independent re-audit of every library citation in AUDIT-18/AUDIT-19. The original
README hypotheses and acceptance requirements remain binding under the report's
no-loss rule. The nine `keep` entries retain their full scope.

The following attacks did not produce a new defect:

| Boundary attacked | Why it survives |
| --- | --- |
| Curve seed versus later RH | DWP.1 retains independent Rosati/Frobenius work, H0/H2, all powers, components and base extension. R34.2 imports this early result; there is no Faltings/Tate-isogeny shortcut. |
| Pencil geometry versus weights | LPV.4 constructs the radical quotient; LPV.5 owns open monodromy. DWP.3 proves local-factor rationality and DWP.4 does the weight induction. Zero/radical cases survive. |
| Finite-cover versus compact-group density | FA.5 retains constant-field congruences; DWP.3 still owes the Haar-null exceptional-set argument. Finite-quotient density is not claimed sufficient. |
| Similar analytic/invariant-theory inputs | DWP.2 retains its power-series argument and Q_l coinvariant bridge; the complex symplectic and Dirichlet suppliers do not silently supply these stronger statements. |
| Early versus late LPV.7 | The semistable child retains actual cycle computations; the invariant-cycle child uses DWP.7–8 and precedes DWP.9. The aggregate owns no duplicate proof. |
| Absolute versus relative hard Lefschetz | DWP.9 owns the absolute theorem and both complex support bounds. EDC.7 remains the downstream relative/perverse owner. |
| Projective versus proper | DWP.4 supplies the projective branch. DWP.7 is explicitly linked to RD.7 for its proper nonprojective branch. WC.3 supplies factor separation for an already pure realization. |
| Generic weights versus arithmetic realization | R34.5–6 retain actual projectors, degrees, coefficients and Hecke/Galois comparisons; arbitrary eigensummands do not acquire ell-independence automatically. |
| Independent surface proof | SF.5 owns surface/intersection work; WC's child retains its spectral comparison. Its power-sum converse is a separate early producer, with no RH prerequisite. |
| Infinite-level perversity | LPV.6 still owes the specified filtered-colimit support extension; IG.4 retains boundary, dimension, localization and actual-model work. |
| Huber/trait comparison | LPV supplies the trait object, not arbitrary valuation-base theory; H1 retains that extension and the actual RΨ comparison. |
| Shared examples | DWP.10 retains weight assertions and WC.7 zeta assertions on the same realizations. Neither suite is deleted by identifying the shared construction. |

Read all 16 external consumer descriptions, including R19.1, AG2.1a/5, H1,
ET.2a:duality-perversity, EDC.7, ES7:function-field-automorphic, R28.4,
FF.2, FA.5, GS.6, R18.4, IG.4, R13.6, RD.7 and R06.5. Their application
hypotheses remain local work. In particular, a forwarding edge does not prove
an unrestricted weight–monodromy or analytic comparison theorem.

## Graph attack

`assemble(require_distances=False)` produced **2,840 stages and 8,007** distinct
stage edges. RS-17 adds 206 edges at its application point. Its 25 skipped links
are precisely the previously reported external `UPSTREAM:` endpoints; none is
skipped to avoid a cycle.

For a stronger test, unioned the assembled edges, `requires` relations and all
accepted research link/restructuring edges with known endpoints, including
edges the renderer might otherwise decline. This gives **8,252** edges. For
each RS-17 edge `s → t`, searched for `t → … → s`: none exists.

Also tested reachability explicitly. Late DWP.7/8/9 and EDC.7 do not reach
R34.2, R34.3, LPV.6, LPV.7:semistable-curves or DWP.4. DWP.1, DWP.4,
WC.3 and WC.5 do not reach WC.5:surface-alternative. The expected DWP.1 →
R34.2 and DWP.1 → DWP.3 → DWP.4 routes remain. R34.1 has its documented
late suffix imports but no outgoing edge that forces those onto R34.2/3.

This checks cycles involving the target links and the stated forbidden routes;
it does not assert that every unrelated component of the atlas is acyclic.

## Decomposition migration and existing issues

Inspected the 29 stable node IDs, parent assignments, titles and all 39 incident
links in the four integrated decompositions. The proposal names every ID and
preserves all 37 coverage rows and 15 gaps. Its migration distinguishes the early
DWP.5 definitions from DWP.7's theorem and makes the R34 semisimplicity record
the DWP.8 proof record without inventing a second node. The Huber comparison
edge is expressly provenance, not a reversed construction prerequisite.

The following remain **existing recorded work**, not new findings here:

- The 25 upstream links lack drawable atlas stage IDs; REV-RS-17 already raises
  this. The proposal preserves their explicit external contracts.
- The original report counts 302 links, while the corrected accepted JSON has
  300. REV-RS-17 names both deletions and their surviving ET.5 replacement routes.
- The decomposition valuation and pole exponents, LPV stale fields, and the
  R34 Hom-order/status wording already have explicit correction instructions
  in RS-17. Source checks below corroborate the numerical corrections.
- Stable-ID reparenting and source-interior work remain maintainer/blueprint
  obligations. A restructuring application is not evidence that those proofs
  or every textual migration have been completed.

## Primary-source and library spot checks

Downloaded the public originals on 30 September 2026; hashes agree with RS-17:

| Source | SHA-256 | Fresh reading |
| --- | --- | --- |
| [Deligne, Weil I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5` | Printed 284–286, 292–293 and 300: 3.2–3.9, 5.7–5.11 and the non-hard-Lefschetz induction passage |
| [Deligne, Weil II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` | Printed 205–208 and 249–251: integrality/cohomological bounds, geometric semisimplicity, support bounds and absolute hard Lefschetz |

Visually inspected printed Weil I 285 and Weil II 206. The former supports
`|alpha|^(-2k/deg(x))`, the latter the valuation pair with `q^n/alpha`.
The sheaf/monodromy hypotheses and the proper-versus-projective distinction in
these passages agree with the proposed ownership boundaries. These are selected
source checks, not complete readings of either paper or of SGA/BBD/Weyl.

Read [PR196 TraceFormula](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md)
at the exact cited head, focusing on Layers 8, 13 and 14. The geometric
Tate/Jacobian comparison and zeta/L-function constructions are already planned
there. The proposal retains arithmetic enhancements at R01.6, integral/rational
comparison at WC.1 and the stronger surface argument at SF.5. Read the current
SF.5 and R01.6 contracts directly. Upstream plans are not implementations.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
[LinearAlgebra/Charpoly/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean):
`LinearMap.charpoly`, `eval_charpoly`, `charpoly_monic`, `charpoly_natDegree`,
`aeval_self_charpoly` and `minpoly_dvd_charpoly`, with surrounding variables.
The finite/free assumptions, extra rank condition for degree and field assumption
for the stated minimal-polynomial lemma are present. RS-17 does not claim that
these declarations provide weights, sheaves or semisimplicity. Tau Ceti remains
pinned to `f790474821cf4256814db967cb154e7af3d0c369`; this report makes no new
named Tau Ceti implementation claim.

## Reproducing the core checks

Run from the repository root, with no generated files required:

```python
import json
from collections import defaultdict
from pathlib import Path
import sys
sys.path.insert(0, 'scripts')
from build import assemble
from check_links import reaches

p = json.loads(Path('research/blueprint/restructure/RS-17.result.json').read_text())
f = json.loads(Path('research/blueprint/restructure/RS-17.json').read_text())
lib = json.loads(Path('data/library-coverage.json').read_text())
raw = json.loads(Path('data/atlas.json').read_text())
assert set(p['layers']) == {s['id'] for s in raw['stages']
                           if s['owner'] in p['roadmaps']}
groups = [{o['owner'], *o.get('formerly', [])} for o in p['owners']]
pairs = {tuple(sorted((x['layer'], x['other']))) for x in f['evidence']}
pairs |= {tuple(sorted((s, d['layer']))) for s in p['layers']
          for d in lib['layers'][s].get('duplicates', [])}
assert all(any(set(pair) <= group for group in groups) for pair in pairs)
base = {(e['source'], e['target']) for e in raw['stageEdges']}
links = {(e['source'], e['target']) for e in p['links']}
assert len(links) == len(p['links']) == 300
for s, entry in p['layers'].items():
    for supplier in entry.get('suppliedBy', []):
        assert (supplier, s) in base | links
        assert all(supplier == t or (supplier, t) in base | links
                   for source, t in base if source == s)
a = assemble(require_distances=False)[0]
stages = {s['id']: s for s in a['stages']}
edges = defaultdict(set)
for e in a['stageEdges']:
    edges[e['source']].add(e['target'])
for folder, pattern in [('restructure', 'RS-*.result.json'), ('links', '*.json')]:
    for file in Path('research/blueprint', folder).glob(pattern):
        data = json.loads(file.read_text())
        if data.get('review', {}).get('status') == 'accepted':
            for e in data.get('links', []):
                if e['source'] in stages and e['target'] in stages:
                    edges[e['source']].add(e['target'])
for sid, stage in stages.items():
    for dep in stage.get('requires', []):
        if isinstance(dep, str) and dep in stages:
            edges[dep].add(sid)
assert all(not reaches(edges, t, s) for s, t in links
           if s in stages and t in stages)
for target in ['WeightsInEtaleCohomology:R34.2',
               'WeightsInEtaleCohomology:R34.3',
               'LefschetzPencilsAndVanishingCycles:LPV.6',
               'LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves',
               'DeligneWeightsAndPurity:DWP.4']:
    for source in ['DeligneWeightsAndPurity:DWP.7',
                   'DeligneWeightsAndPurity:DWP.8',
                   'DeligneWeightsAndPurity:DWP.9',
                   'EtaleDualityAndPerverseSheaves:EDC.7']:
        assert not reaches(edges, source, target), (source, target)
for source in ['DeligneWeightsAndPurity:DWP.1', 'DeligneWeightsAndPurity:DWP.4',
               'WeilConjectures:WC.3', 'WeilConjectures:WC.5']:
    assert not reaches(edges, source, 'WeilConjectures:WC.5:surface-alternative')
print('RS-17 ownership, forwarding and graph checks pass')
```

Validation: the target passes `scripts/check_restructure.py`. This job passes
`scripts/check_redteam.py`, `research/blueprint/intake.py check-files` and
`git diff --check`. No suggested Lean file is required or produced; no Lean
compilation, language server or library build was run.
