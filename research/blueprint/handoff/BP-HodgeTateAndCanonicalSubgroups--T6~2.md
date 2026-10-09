# BP-HodgeTateAndCanonicalSubgroups--T6~2

Issue #6972 · Codex · session codex-vcVerU · 2026-10-09.

The revision pass is complete and ready for independent review. The packet has
status `complete`; T6, T6:comparison and T6:log-sites each have coverage `planned`.
None is closed. All implementation statuses remain `unchecked`.

## This round

The reader now reflects the reviewed 68-target packet. It contains every target's
statement, hypotheses, proof route, acceptance checks, API, tests, prerequisites,
source locators with authored matches, uses and library placement. It also carries
all supplier requests, gaps, coverage records, restructuring proposals, source
corrections and the routing ledger. Its eight construction groups follow the
mathematical dependencies; they do not summarize chapters of the sources.

The review's corrected mathematics and all 68 node IDs are retained, including
the six targets added during that review. The top-level review object, per-node
review records and source-issue verdicts are unchanged. The next independent
reviewer must replace the historical `needs_changes` verdict.

The source checks retain the review's analytic specialization, integral chart
condition, normal-crossings convention, complete continuous derivation targets,
Kummer index in O, root-cover boundary points, corrected ordinal covering
condition, all-integer-divisible chart limit, properness conditions and separate
almost/exact acyclicity assertions. For periods they retain the additional
filtration completion, normalized residues, restricted tensor/pullback assertions,
full Gᶜ coefficients, two t-adic lattices, negative homological Tate jump and
central cyclotomic twist. The Hodge-type agreement is on the interior and uses
H₁, dual to DLLZ-RH's R¹f_* normalization.

Two locators were corrected: the BP edition metadata now identifies §4.4.38 and
Remark 4.4.39, pp. 79–80, instead of §4.4.5; DLLZ-RH Lemma 3.6.1 spans pp. 41–42.
Public-copy reading dates and the nine baseline checks were refreshed. The input
packet already contained no excerpt fields. Short quotations outside the
historical review were rephrased; the revision adds no source passage, PDF or
extracted source text.

The suggested file extends the actual component interfaces:

- continuous log derivations now have componentwise additive and scalar
  operations, a B-module instance and a B-linear map to continuous derivations;
  postcomposition gives its derivation and monoid maps explicitly and has a
  composition law;
- the split model M=K⟦t⟧ⁿ in K((t))ⁿ now has reduction modulo t, its quotient
  equivalence, common localization and the lattice-intersection weight flag;
  a coordinate projector supplies a pointwise splitting, and weights (1,0)
  test the homological Siegel indices;
- changes of a Tate generator act through the weight exponent, including a
  nontrivial weight-one example and the inverse scalar at weight −1.

Each interface identifies its omitted geometric conditions. No full geometric
theorem has been replaced by a stalk calculation or an assumed proposition.

## Counts and validation

| Item | Count |
| --- | ---: |
| Definition nodes | 11 |
| Construction nodes | 24 |
| Theorem nodes | 32 |
| Application nodes | 1 |
| API entries | 246 |
| Unit tests | 126 |
| Planets | 11 |
| Baseline declarations | 9 |
| Source locator/match entries | 257 |
| Supplier requests | 11 |
| Recorded gaps | 10 |

The Lean catalogue has 406 distinct packet names: 68 nodes, 212 API names after
excluding names also used for nodes, and 126 tests. The 246 API entries include
34 such node names. Typed components cover 123 distinct names, formerly 117:
20 node names, 49 API-only names and 54 tests. The other 283 names are explicit
signature omissions in the catalogue. No full geometric theorem node has a typed
statement; its supplier carriers are still missing.

`python3 scripts/check_blueprint.py research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T6.json`
reports **0 errors and 0 warnings**. A separate field-by-field synchronization
check finds all 68 statements, hypotheses, proof steps, acceptance checks, APIs,
tests, uses, prerequisites and source locators/matches in the reader; all node,
API and test contracts occur in the Lean catalogue. A local graph traversal finds
no cycle, no comparison/P8/CP.3 ancestor of a log-sites node and no MC.7 citation.
Prerequisite edges are unchanged from the reviewed input, so this revision adds
no cross-roadmap graph edge. Scope, node order, planets, review objects and
implementation statuses were checked against the committed input. Catalogue
regeneration is idempotent. `git diff --check` passes.

`lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups--T6.lean`
exits **0**, with **130 warnings, all declaration uses `sorry`**. The shared build
uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its imported
`TauCeti.RingTheory.Huber.Pair` source is identical to Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, checked by comparing that module between
the pin and the shared checkout. The nine cited baseline declarations were read
at the pins. No library build or update was performed. This is elaboration of
proposals, with no claim of proved results.

## Ownership work outside this issue

The issue permits only these three deliverables and this handoff. The atlas,
source routes, other packets and stage dependency lines therefore still need the
maintainer's separately authorized edits:

1. Apply FIX-RT-AREA-padic-1 findings /4, /23 and /24. Keep BP Theorem 4.4.40
   with PerfectoidShimuraVarieties S6. Route BCGP-25's usual/cuspidal Theorem 4.4.1
   comparisons to TC.2, and its analytic comparisons to higher Hida/Coleman
   route 22. Put P8:primitive **after P8:local-rational**, then retarget the three
   current P8 requests to exact primitive nodes. Split the six log primitive
   targets from T6:comparison into the decided T6:log-primitive stage.
2. Complete the review of PAPER-LIU-ZHU-17 route 8. Its review endorses the
   ordinary prefix of T6:comparison as a direction but has not accepted an
   owner. After acceptance, plan the ordinary RH, de Rham, pullback, tensor
   and rigidity inputs as exact nodes, rather than silently treating P8 as
   their supplier.
3. Assign early CM special-point inputs an owner independent of T6. MC.7
   cannot supply them here without the recorded B5–C5–PEL/M6–R28 cycle.
4. Replace whole-stage T6:comparison citations in B5, S3, O8, CP.6 and S6
   with the exact reviewed exports described in the packet and review.
   B5's compact-support need also requires Lan–Liu–Zhu arXiv:1912.13030 as a
   source at its owner; the three sources here do not establish that result.
5. Apply the dependency-line restructuring and have T1/T2 explicitly use
   the same homological convention. Log-sites stays free of P8 and CP.3
   inputs; the finite-level package exports to S6.

## Resume toward closure

The 11 requests are directed to R0, R3, CR.5:log-algebra, H0, E1, E2, P8, ALS.1,
V8.general, T1 and T2. Their exact needs and consumers are preserved in the packet
and reader. In particular, R0 needs finite normalization across the boundary;
R3 needs coherent étale descent beyond finite projectives; CR.5 must work over
arbitrary ringed sites; H0 needs the precise cohomology/descent generalizations;
E1 needs the projection formula; E2 needs derived-limit vanishing without an
unproved repleteness hypothesis. The latter may transfer to AI.3 only when an
exact sufficiently general node exists. P8 needs the primitive export described
above; ALS.1 needs arithmetic rigidity; V8.general needs the precise Shimura
embeddings; T1/T2 supply Tate conventions and Hodge–Tate/Tannakian compatibility.

The ten gaps remaining are:

1. creation of the decided early ordinary primitive owner and its exact nodes;
2. analytic normalization, punctured-polydisc root extraction, bounded-function
   extension and rigid resolution;
3. general Banach decompletion, Tate–Sen coefficient axioms and gluing;
4. arithmetic-group density, superrigidity and congruence instances;
5. the exact Shimura rigidity embeddings and special-point descent;
6. CM special-point Hodge tensors, potential good reduction and agreement of
   Faltings/Scholze comparison;
7. derived limits on the pro-Kummer site under basis acyclicity;
8. an accepted owner and nodes for Liu–Zhu's ordinary RH package;
9. external proof suppliers for algebraic/analytic étale comparison, log
   purity, regular-singular local freeness, codimension-two extension,
   normalized Gauss–Manin residues and proper smooth relative finiteness;
10. collation of the DLLZ-adic author-copy findings with the published chapter.

A follow-up starts at these exact gaps and requests after independent review,
keeps the 68 IDs, and upgrades catalogue omissions only as the stated geometric
supplier interfaces become available. There is no unfinished editing step from
this revision and no private scratch dependency.

## Sources read and access limits

The public author copies linked in the reader were read at the target-relevant
locators and reviewed corrections: DLLZ-adic §§2–6; DLLZ-RH §§2–3, §§5.2–5.6 and
Appendix A's decompletion statements; BP §4.0, §4.4.8, §4.4.23, §4.4.38,
Remark 4.4.39 and the Theorem 4.4.40 ownership boundary. Their hashes match the
packet's recorded 100-, 80- and 180-page copies. Definitions/theorem statements
and the needed proof inputs were checked; this is not a reading of every proof
in the papers. Source descriptions and matches are authored prose with locators.

The 13 independently confirmed source findings E1–E13 remain scoped to those
copies. The published DLLZ-adic chapter and DLLZ-RH journal version were not
collated. No restricted book was used; Huber (1996) and other inaccessible proof
inputs remain exact supplier needs or gaps. Nothing in the handoff depends on a
local source file. Access and hash records are in `sourceVersions`.

## Reproducible Lean catalogue synchronization

Run the following Python from the repository root after editing the packet and
hand-written components. It preserves the typed prefix, keeps the manually
checked node/component marks, discovers `API <qualified name>` and
`Test <qualified name>` tags in component docstrings, rebuilds every contract
entry and prints the coverage counts. New typed node marks require manual review
in the old catalogue; the script cannot determine whether a geometric contract
has been fully expressed. Counts refer to typed components, never formalized
contracts. The generated catalogue remains a Lean comment.

The allowed-path restriction prevents adding a separate generator file, so this
complete recipe is retained here for the next reviewer or worker.

```python
import json,re
from pathlib import Path
base=Path('research/blueprint')
p=json.loads((base/'packets/HodgeTateAndCanonicalSubgroups--T6.json').read_text())
f=base/'suggested/HodgeTateAndCanonicalSubgroups--T6.lean'
marker='/-! ## Complete packet contract catalogue'
code,old=f.read_text().split(marker,1)
covered=[set(),set(),set()]
for line in old.splitlines():
 m=re.match(r'(TauCeti\.\S+?)(?: \[([^]]+)\])?: (component(?: example)? above)',line)
 if m:
  name,role,typ=m.groups()
  covered[0 if role is None else 2 if typ=='component example above' else 1].add(name)
covered[1].update(re.findall(r'API (TauCeti\.[\w.]+)',code))
covered[2].update(re.findall(r'Test (TauCeti\.[\w.]+)',code))
sets=[{n['declaration'] for n in p['nodes']},
 {a['name'] for n in p['nodes'] for a in n.get('api',[])},
 {t['name'] for n in p['nodes'] for t in n.get('tests',[])}]
covered=[a&b for a,b in zip(covered,sets)]
allnames=set.union(*sets); typed=set.union(*covered)
api_only=sets[1]-sets[0]
counts={'uniqueNames':len(allnames),'typedUnique':len(typed),
 'nodes':[len(covered[0]),len(sets[0])],
 'apiExcludingNodeNames':[len(covered[1]&api_only),len(api_only)],
 'tests':[len(covered[2]),len(sets[2])],
 'untypedUnique':len(allnames-typed)}
code=re.sub(r'\d+ of the \d+ names',str(len(typed))+' of the '+str(len(allnames))+' names',code)
lines=[marker+'''

This catalogue records the full packet contracts; it is not elaborated Lean.
A component above renders only the part stated in its docstring. A name marked
not stated has no declaration or example for its full geometric contract.
The reproducible synchronization recipe is in the round-2 handoff.
-/\n''']
for n in p['nodes']:
 d=n['declaration']
 status='component above; full geometric signature not stated.' if d in covered[0] else 'not stated; needs the geometric carriers listed below.'
 lines += ['/-','Node '+n['id'],d+': '+status,'',n['statement'],'',
   'Hypotheses: '+' '.join(n['hypotheses']),'',
   'Suppliers and local inputs: '+', '.join(n['prerequisites'])+'.','']
 for a in n.get('api',[]):
  status='component above; full contract follows.' if a['name'] in covered[1] else 'not stated; depends on the full geometric constructor.'
  lines += [a['name']+' ['+a['role']+']: '+status,a['statement'],'']
 for t in n.get('tests',[]):
  status='component example above; full test follows.' if t['name'] in covered[2] else 'not stated as an example; needs the full geometric constructor.'
  lines += [t['name']+' ['+t['kind']+']: '+status,t['statement'],'']
 lines += ['Sources: '+'; '.join(s['sourceId']+' '+s['locator'] for s in n['sources'])+'.','-/','']
f.write_text(code+'\n'.join(lines))
print(json.dumps(counts))
```
