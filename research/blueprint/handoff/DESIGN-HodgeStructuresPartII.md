# Hodge Part II: flat-reflection checkpoint — #3371

Codex — codex-7e92bd, 2 October 2026. Read base c1ce73c82043f8e7f67b701bb7797bf8ebde7ef1. Claim [5961565617](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5961565617), winning bot [5961567770](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5961567770). Complete issue read before and after the confirmed claim; body unchanged at the publication guard. This is a partial checkpoint. No stage, source route or reserved key is closed.

## Delivered mathematics

Two lemma nodes extend the existing ordered-iterate API. For a horizontal pair of injective maps f:E→F and u:Q→P, with F,Q,P flat over the same commutative ring R, I_n(ψ)∘f=0 iff I_n(θ)=0 for every n≥0. E need not be flat. Taking f=id gives coefficient-change reflection when E,Q,P are flat. Neither result needs a coefficient left inverse, a basis, finite generation, integrability or a rank bound.

The proof uses actual native tensor maps. Induction through the native degree-zero unit and prepend equivalence proves Q^⊗n flat and u^⊗n injective. In the successor step, tensor-map injectivity uses P flat and Q^⊗n flat; in the final horizontal step it uses F flat and Q^⊗n flat. The existing naturality equation then reflects zero. These helper deductions are proved locally, not assumed in a structure or replanned as a new generic tensor API.

Four new tests check the nonsplit injection 2:ℤ→ℤ, the native projective-to-flat instance without any basis, restriction of an ambient bound to an arbitrary source module, and a field that is zero on the first summand of ℤ⊕ℤ but nonzero on the second. The last example prevents replacing restricted vanishing by vanishing on all of F. The five inherited native coefficient examples are rerun, including the E=ℤ/2 nonflat counterexample and the nonzero degree-zero unit.

All 105 inherited mathematical contracts, prerequisites and proof routes remain. Two existing constructions gain the new APIs, uses and tests; 103 complete node objects remain unchanged. All inherited API/test entries, 149 routed obligations in eight route records, five requests, eleven gap entries, six planets, source findings and the 35 global signature omissions are preserved. The reserved ringed-site Higgs/parameter-connection key keeps its full generality. The roadmap changes only its stale summary: all nine stages and every dependency remain equal to the base.

Current totals: 107 nodes (12 definitions, 24 constructions, 52 lemmas, 14 theorems, five comparisons), 142 API items, 132 required definition/construction tests, 134 total tests and 131 baseline declarations. H.0 partial; H.1–H.8 not_read; zero closed stages and all nodes unchecked.

## Exact proof and sketch receipts

The [actual native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/d94ef3bb3b47d21b8308c595f6e23055cd390a3a/research/blueprint/suggested/HodgeStructuresPartII.lean) is a comment in an immutable ancestor commit. Extract the bytes between its markers:

```python
import hashlib, subprocess
text = subprocess.check_output([
    'git', 'show', 'd94ef3bb3b47d21b8308c595f6e23055cd390a3a:research/blueprint/suggested/HodgeStructuresPartII.lean'
], text=True)
proof = text.split('BEGIN ARCHIVED CHECKED HIGGS FLAT REFLECTION\n', 1)[1].split(
    'END ARCHIVED CHECKED HIGGS FLAT REFLECTION', 1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == 'b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc'
```

Write that string to a scratch Lean file and elaborate it only in an already existing build at the pinned Mathlib commit. The 517-line standalone file has nine examples and fourteen axiom audits. Zero errors, admissions or other warnings; only propext, Classical.choice and Quot.sound. Source SHA-256 b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc; normalized diagnostics SHA-256 685d3490ea12048f2b24592c953adb26e7f0669a4e120b52ab293a5518fbe209. Runtime 3.30 seconds, peak RSS 2433160 KiB, 58 GiB available beforehand. The actual inherited definitions and proofs are included verbatim from the [coefficient-map archive](https://github.com/CBirkbeck/tauceti-explorer/blob/517750c164630533f84985dd6a8eb6ab541fde6e/research/blueprint/suggested/HodgeStructuresPartII.lean), whose recovered standalone source hash is ab03c5838c6d32dd74603959cd5fa3aace539b2d0c297e50be40f36486cecbbc. There are no assumed iterate axioms or admitted dependencies.

The submitted file has only admitted planning bodies, as PROTOCOL section 13 requires. Its exact SHA-256 is 82a282d7a295d3c678c3fdc9462c64b8c6931ebccd4617053b08dc7662121b29; normalized diagnostics SHA-256 edf8ac99d2d19481735c1bbfb404b5930ce136ec6413a9cef71cab62ba30f54e. All 1552 lines elaborate: 93 examples, zero errors, 228 admitted-declaration warnings and no other warnings. Runtime 5.30 seconds, peak RSS 2965276 KiB, 58 GiB available. Both runs use Lean 4.34.0-rc2 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. These are Mathlib-only checks; no Tau Ceti import set is certified. Normalize each source path in diagnostics to suggested/ followed by its filename before hashing. Timing is stored separately, not included in the diagnostic hash.

The final proposed prefix is byte-identical to the predecessor except for the Flat import. The two new declaration headers and four example types match the actual prototype. Exact archive extraction is byte-identical. The proof archive is historical evidence; the final suggested file does not include its proof bodies.

## Structural checks

Indexed check_blueprint: zero errors and warnings. Actual read-only atlas assembly with candidate injection: stage graph 3022 vertices/8663 edges, own prerequisite graph 107/199, combined stage/reachable prerequisite graph 3124/8900. All acyclic. There are 108 reachable declarations, 51 existing virtual supplier endpoints and zero unresolved references. No own skipped/pending links; stage edges and other roadmaps' skipped/pending links equal the predecessor control. No site output is written.

The reusable graph-check script below is unchanged from the predecessor and takes the predecessor packet as its first argument. The [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/c1ce73c82043f8e7f67b701bb7797bf8ebde7ef1/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) and packet retain every earlier proof/source receipt and continuation lead. Supply its packet from that same commit for the graph control.

```python
"""Read-only actual atlas assembly with the candidate injected as promotion inputs."""
from pathlib import Path
import sys,json,copy,collections
root=Path.cwd();sys.path.insert(0,str(root/'scripts'))
import build,blueprints,check_blueprint
rid='HodgeStructuresPartII'
p=json.loads((root/'research/blueprint/packets'/f'{rid}.json').read_text())
r=json.loads((root/'research/blueprint/roadmaps'/f'{rid}.json').read_text())
a0=json.loads((root/'data/atlas.json').read_text())
packets,documents,definitions=blueprints.load_promoted(root)
packets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p)]
documents[rid]=f'research/blueprint/readmes/{rid}.md'
definitions=[x for x in definitions if x['id']!=rid]
if not any(x['id']==rid for x in a0['roadmaps']):definitions.append(r)
build.load_promoted=lambda *args:(copy.deepcopy(packets),copy.deepcopy(documents),copy.deepcopy(definitions))
a,*rest=build.assemble(require_distances=False)
ctx=check_blueprint.world()
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for path in sorted((root/folder).glob('*.json')):
  q=json.loads(path.read_text())
  for n in q.get('nodes',[]):world.setdefault(n['id'],n)
world.update({n['id']:n for n in p['nodes']})
stages={s['id']:s for s in a['stages']}
stageids=set(stages)|set(ctx[1])
stageedges={(e['source'],e['target']) for e in a['stageEdges']}
virtual={v for e in stageedges for v in e}-set(stages)

def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e}
 out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for s,t in edges:
  if t not in out[s]:out[s].add(t);indeg[t]+=1
 stack=[v for v,k in indeg.items() if k==0];count=0
 while stack:
  x=stack.pop();count+=1
  for y in out[x]:
   indeg[y]-=1
   if indeg[y]==0:stack.append(y)
 assert count==len(vertices),f'cycle: {[v for v,k in indeg.items() if k][:15]}'
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}

own={n['id']:n for n in p['nodes']}
ownedges={(q,n['id']) for n in p['nodes'] for q in n.get('prerequisites',[]) if q in own}
stack=list(own);seen=set();dep=set();unresolved=set()
while stack:
 nid=stack.pop()
 if nid in seen:continue
 seen.add(nid)
 n=world[nid]
 for q in n.get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:continue
  dep.add((q,nid))
  if q in world:stack.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,sorted(unresolved)
report={'stage':dag(stages,stageedges),'own':dag(own,ownedges),'combinedPrerequisites':dag(set(stages)|seen,stageedges|dep),'virtualSupplierEndpoints':len(virtual),'reachableDeclarations':len(seen),'unresolvedReferences':len(unresolved)}
roadmap=next(x for x in a['roadmaps'] if x['id']==rid)
assert roadmap['blueprint']['declarations']==len(own)
assert roadmap['blueprint']['planets']==6
assert not roadmap['blueprint']['skippedLinks'],roadmap['blueprint']['skippedLinks']
assert not roadmap['pendingLinks'],roadmap['pendingLinks']
report['actualBlueprint']={k:roadmap['blueprint'][k] for k in ['declarations','planets','kinds','skippedLinks']}
# The original packet is used as a second promotion input to check projection preservation.
p0=json.loads(sys.argv[1] and Path(sys.argv[1]).read_text()) if len(sys.argv)>1 else p
r0=copy.deepcopy(r)
basepackets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p0)]
build.load_promoted=lambda *args:(copy.deepcopy(basepackets),copy.deepcopy(documents),copy.deepcopy(definitions))
b,*_=build.assemble(require_distances=False)
bedges={(e['source'],e['target']) for e in b['stageEdges']}
assert stageedges==bedges
report['stageEdgesUnchanged']=True
control={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in a['roadmaps'] if x['id']!=rid}
control0={x['id']:(x.get('blueprint',{}).get('skippedLinks',[]),x.get('pendingLinks',[])) for x in b['roadmaps'] if x['id']!=rid}
assert control==control0
report['otherRoadmapSkippedPendingLinksUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2))
```

Five-file intake, JSON validity, all inherited contract/API/test checks, exact signatures, native proof audits, allowed-path diff and whitespace checks pass. The publication guard checks the live issue, claim/bot, all five main-branch deliverable blobs and eleven instruction/library-audit/upstream/key-definition inputs against the read base. The durable sources and receipts above suffice to reproduce the result. No library/cache/project setup or language server was used; Lean ran one process at a time, each bounded to 20 minutes. No owned background compilation remains.

## Reading and where to resume

Fresh reading covers the selected native Flat predicate, injection-preservation proofs, tensor-flat closure instance, projective/free-to-flat instances, linear-equivalence transport, tensor-map injectivity, and tensor-power unit/multiplication/cast/prepend formulas. Reviewed parent Hodge L0–L3 and E1/D3 audit entries and the reserved key-definition survey were read. The complete HodgeStructures and SemisimpleAlgebras upstream readers provide the scope/density models. Generic module, tensor and flatness carriers already exist and are imported.

Fresh source scope: Heuer arXiv v3 Definition 1.2 and selected introductory field/horizontal/symmetric-action setup; Stacks Definition 10.39.1 and complete Lemma 10.39.5 proof. The two Higgs-specific deductions are authored affine algebra. This does not certify complete correspondence proofs or the 149-item source inventory. Broader source/version receipts in the predecessor remain historical; no new source error is asserted.

Resume with actual arbitrary-Q scalar-extension/tensor-power coherence, then finite-projective chart restriction and E1 sheaf tensor-power comparison and equality detection/gluing. The new same-ring injection criterion supplies one exact-bound algebraic input; it does not make a sheaf-locality theorem or identify tensor products of global sections. Keep specified global exponents separate from locally varying bounds. Finite-projective modules are handled here only through their native flatness, not through a newly supplied local trivialization/descent theorem.

Continue the original CR.1 ordinary/exterior comparison, E1 sheaf tensor/dual/exactness/pullback/descent and DD.1 finite split filtration/Rees supplier contracts. Global determinant/exterior comparison, Tate coefficient equivariance, unbounded Liu–Zhu period-lattice adaptation, rank bounds and the seven binding paper routes remain in scope. The finite Griffiths carrier must not be substituted for the unbounded period filtration. Retain the inherited split reflection for nonflat E and the counterexamples that distinguish exterior integrability, ordered nilpotence and symmetrized vanishing.
