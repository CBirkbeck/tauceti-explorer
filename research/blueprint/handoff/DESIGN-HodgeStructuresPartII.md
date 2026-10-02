# Hodge Part II: scalar-extension coherence checkpoint — #3371

Codex — codex-J6LwjP, 2 October 2026. Read base 9f4ec81d1839ece8d10129830133db03a6d5d430. Claim [5962082384](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5962082384), winning bot [5962084436](https://github.com/CBirkbeck/tauceti-explorer/issues/3371#issuecomment-5962084436). The full issue was read before and after confirmation. Partial checkpoint: no stage, source route or reserved key is closed; every node remains unchecked.

## Delivered mathematics and boundaries

Five lemma nodes extend the existing canonical affine scalar-extension field. Horizontal module/coefficient maps remain horizontal after scalar extension; coefficient postcomposition commutes with this field construction for arbitrary u. Applying existing ordered naturality over the receiving ring S gives an equation in every degree, including zero. No basis, finite generation, integrability or flatness is required for these equations.

For a faithfully flat R-algebra S, θ_S=0 iff θ=0 even for arbitrary, nonflat E and Q. The proof evaluates on 1⊗e, uses the native tensor distributor's injectivity, then faithful-flat detection on the actual module E⊗_R Q. Native singleton tensor-power equivalences give reflection of degree-one iterate vanishing. This checkpoint does not prove the cross-ring ordered tensor-power comparison in arbitrary degree. It retains the earlier finite-coefficient-basis all-degree contracts unchanged.

Seven new examples check a zero coefficient map from ℤ/2 to ℤ/3, torsion coefficients, a nonzero tensor-unit field on a torsion source, degree-one reflection with both source and coefficients ℤ/2, receiving-ring horizontal restricted vanishing, degree-zero naturality without horizontality, and a nonzero field e↦2e⊗1 erased by scalar extension to ℤ/2. The latter algebra is not asserted flat. Restricted vanishing is never replaced by vanishing on the whole target module. All nine inherited native examples are rerun.

All 107 inherited node contracts, including hypotheses, prerequisites, sources, acceptance and proof routes, remain. Only the existing affine-base-change construction gains five APIs, uses and seven tests; 106 complete inherited node objects are unchanged. All old API/test/use prefixes, 149 routed obligations in eight route records, five requests, eleven gaps, source findings and the 35 global signature omissions remain. All nine stage definitions/dependencies are equal to the base; only the roadmap summary changes.

Totals: 112 nodes (12 definitions, 24 constructions, 57 lemmas, 14 theorems, five comparisons), 147 API items, 139 required definition/construction tests, 141 total tests, 135 baseline declarations and six H.0 planets. H.0 partial; H.1–H.8 not_read; zero closed stages.

## Exact proof and submitted-sketch receipts

The [native proof archive](https://github.com/CBirkbeck/tauceti-explorer/blob/9f179c941d3686eacb96322f20831efef6c2c78c/research/blueprint/suggested/HodgeStructuresPartII.lean) is stored as a comment in an immutable ancestor commit. Extract it without relying on a local Git object, which may be absent after squash merging:

```python
from urllib.request import urlopen
from pathlib import Path
import hashlib
url = 'https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/9f179c941d3686eacb96322f20831efef6c2c78c/research/blueprint/suggested/HodgeStructuresPartII.lean'
text = urlopen(url).read().decode()
proof = text.split('BEGIN ARCHIVED CHECKED HIGGS SCALAR COHERENCE\n', 1)[1].split(
    'END ARCHIVED CHECKED HIGGS SCALAR COHERENCE', 1)[0]
assert hashlib.sha256(proof.encode()).hexdigest() == '6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2'
Path('BaseChange.lean').write_text(proof)
```

Elaborate that exact source only in an already existing pinned Mathlib build. It has 692 lines, 16 examples and 20 named axiom audits; zero errors, admissions or warnings. Only propext, Classical.choice and Quot.sound occur. Source SHA-256 6a23f25f4d8709db044e950a9097754d114071dd5d08b9d000cb34a2c3194fb2; normalized diagnostics SHA-256 04e4ea88b83bf274cf6f8d4b8fba11d1a5f412cc1cd2547499790a49d4c0faec. Runtime 3.80 seconds, peak RSS 2470292 KiB, 56 GiB available beforehand. The two added imports precede the byte-identical 517-line [predecessor actual proof](https://github.com/CBirkbeck/tauceti-explorer/blob/d94ef3bb3b47d21b8308c595f6e23055cd390a3a/research/blueprint/suggested/HodgeStructuresPartII.lean), recovered source SHA-256 b1335d49069b99337ff05089cbfc8658ab2bb0da4e32dd5cedfb64d2d0ad04dc. The new canonical scalar-extension definition is the actual native composition, not an assumed carrier or transport theorem.

The final submitted file has admitted planning bodies under PROTOCOL §13. Its exact SHA-256 is f31c12d0f3c4789c298fb9c1616f48aab96d02a659b2a088a28550ec0356c621; normalized diagnostics SHA-256 6fc6e0157deded986d6fdae3f22d82a634405a121ad1f79014a82860730b0900. All 1632 lines elaborate, with 100 examples, zero errors, 240 admitted-declaration warnings and zero other warnings. Runtime 5.20 seconds, peak RSS 2979404 KiB, 56 GiB available. Lean 4.34.0-rc2, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. This is a complete Mathlib-only file check; it certifies no Tau Ceti import set. Normalize the absolute source path to suggested/BaseChange.lean or suggested/HodgeStructuresPartII.lean respectively and omit the final timing line before hashing diagnostics.

The inherited 1552-line submitted prefix is byte-identical to the read base. All five new declaration headers and seven example types match the actual checked source. The canonical field definition's signature also matches its inherited sketch. The proof archive is separate historical evidence; the final suggested file contains no new proof bodies.

## Structural checks and reproduction

Indexed check_blueprint: zero errors and warnings. Five-file intake: zero problems. The actual read-only assembler with candidate injection gives stage graph 3022 vertices/8663 edges, own prerequisite graph 112/207 and combined stage/reachable prerequisite graph 3129/8908, all acyclic. There are 113 reachable declarations and 51 existing virtual supplier stage endpoints. All references resolve to a native library declaration or an existing declaration/stage plan; resolution is not implementation or closure of the suppliers.

All seven required supplier stage pairs have paths: five are direct, while D3→H.3 and D3→H.8 run through H.2 (the latter chosen path also passes H.3). These are explicitly transitive dependencies, not new direct links. No own skipped/pending links occur; stage edges and other roadmaps' skipped/pending links equal the predecessor control. No site output is written.

Save the following script in scratch, run it from the repository root with the original packet from read base 9f4ec81d1839ece8d10129830133db03a6d5d430 as its first argument. It uses the real assembler and checks prerequisite graphs and all supplier paths. The [read-base packet](https://github.com/CBirkbeck/tauceti-explorer/blob/9f4ec81d1839ece8d10129830133db03a6d5d430/research/blueprint/packets/HodgeStructuresPartII.json) and [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/9f4ec81d1839ece8d10129830133db03a6d5d430/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) retain every earlier proof/source receipt and continuation lead.

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

def owner(ref):
 if ref in own:return own[ref]['parentStageId']
 if ref in world:return world[ref]['parentStageId']
 assert ref in stageids,ref
 return ref
required={(owner(q['supplier']),owner(n)) for q in p['requests'] for n in q['neededBy']}
required|={(owner(q),n['parentStageId']) for n in p['nodes'] for q in n.get('prerequisites',[]) if q in stageids or (q in world and q not in own)}
required={pair for pair in required if pair[0]!=pair[1]}
adj=collections.defaultdict(set)
for a0,b0 in stageedges:adj[a0].add(b0)
paths={}
for a0,b0 in sorted(required):
 queue=collections.deque([(a0,[a0])]);visited={a0}
 while queue:
  x,path=queue.popleft()
  if x==b0:paths[a0+' -> '+b0]=path;break
  for y in sorted(adj[x]):
   if y not in visited:visited.add(y);queue.append((y,path+[y]))
 assert a0+' -> '+b0 in paths,(a0,b0)
report['requiredSupplierStagePairs']={'count':len(required),'allPathsPresent':True,'directPairs':len(required&stageedges),'transitivePaths':{k:v for k,v in paths.items() if len(v)>2},'pairs':sorted(required)}
report['virtualSupplierEndpointsAreStagePlansNotLibraryDeclarations']=True

print(json.dumps(report,ensure_ascii=False,indent=2))
```

All 107 inherited contracts and API/test/use prefixes, JSON validity, exact signatures, proof audits, allowed-path diff and whitespace checks pass. The publication guard confirmed the unchanged live issue body and five main-branch deliverable blobs, plus sixteen instruction/audit/key-definition/source-route inputs. The claim and winning bot are linked above. No private paths or extracted papers are committed. No project/cache/library setup or language server was used. Lean ran one process at a time, each bounded to 20 minutes; no owned background compile remains.

## Reading and continuation

Fresh library reading covers the native scalar-extension definition, ambient semiring/module hypotheses, elementary evaluation, zero/identity/composition laws, tensor-distribution definition and forward/inverse elementary formulas, tensor equivalence and its underlying map, faithfully-flat predicate/self instance and complete unit-tensor zero detection proof. Four newly cited native declarations were checked at the pin and in the declaration index; the 131 inherited citations remain. The reviewed Hodge L0–L3, D3 and E1 audit entries, the reserved key survey and full key node were read. HodgeStructures and SemisimpleAlgebras upstream readers were read earlier in this continuous session for scope/density. Generic tensor/scalar-extension/faithful-flat carriers are reused.

Fresh source scope: [Heuer arXiv v3](https://arxiv.org/html/2307.01303v3), Definition 1.2(1)–(2), selected introduction, complete Theorem 4.8(1)–(3), Remark 4.9 and its displayed proof. Retrieved HTML SHA-256 ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081. The local scalar-extension formula and morphism functoriality motivate the authored affine deductions. This is no certification of analytic chart independence, the full paper or the 149-item inventory. Existing wider readings/source findings remain historical; no new source error is asserted.

Resume with the actual arbitrary-Q cross-ring tensor-power unit/prepend distributor equations and the comparison between scalar extension of I_n(θ) and I_n(θ_S) in all degrees. Prove preservation under arbitrary S and reflection under faithful flatness using that comparison. Do not infer these from receiving-ring naturality or degree-one reflection. Then supply finite-projective chart restriction and E1 sheaf tensor-power comparison, equality detection and gluing. Keep a specified global exponent distinct from locally varying bounds; never identify a sheaf tensor with tensor products of global sections.

Continue all inherited CR.1 ordinary/exterior, E1 tensor/dual/exactness/pullback/descent, DD.1 bounded Rees and D3 common variation supplier contracts. Global determinant/exterior comparison, Tate coefficient equivariance, unbounded Liu–Zhu period-lattice adaptation, rank bounds and all binding paper routes remain. Retain both split reflection for nonflat E and flat-injection reflection, along with exterior-integrability/ordered-nilpotence/symmetrized-vanishing counterexamples. The finite Griffiths carrier does not replace the unbounded period filtration.
