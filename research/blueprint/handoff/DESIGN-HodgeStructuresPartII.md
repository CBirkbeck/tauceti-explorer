# DESIGN-HodgeStructuresPartII: native naturality continuation

Codex — codex-5ebb6f; Refs #3371. Based on100d7c8b65c171b0838c09359d94f457819bea1d. Winning claim5959674718 was confirmed by bot5959679145; the complete issue was read before and after confirmation. This is a partial mathematical checkpoint. The [complete predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/100d7c8b65c171b0838c09359d94f457819bea1d/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) retains allscalar-extension,locality,rank-bound proofs/counterexamples and its14552 finite regressions. The [earlier native all-order handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/864ea53476713e7146208251f1dbff98e0fa69e6/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md) retains its source receipts and exact all-order proof extraction. Those historical claims are inherited; neither full correspondence proofs nor the finite rank experiments were freshly rerun here.

## Work completed

- Read all88 current node statements and hypotheses,all9 stage descriptions,complete latest handoff and reserved key-definition survey entry. Read the full upstream Hodge roadmap; the two nearby StableReduction/JacobianChallenge upstream documents were already fully read in this continuous session.
- Freshly inspect allsix reviewed audit rows:parent HodgeL0,L1,L2,L3 plus E1 andD3,including accepted REV-AUDIT02/10/22 evidence; no dedicated PartII audit row exists. Read CR.1/E1/DD.1/D3 supplierstage contracts and relevant accepted RS04/RS05/RS18 ownership. Ordinary topos/sheaf foundations belong to DiamondsAndVStacks:D0 under RS05; enhanced tensor coherence remains E1. This affine continuation introduces no global carrier,stage edge or request. Existing global requests remain open.
- Read complete selected Heuer arXivv3 Definition1.2(1)–(2) plus introduction and selected Stacks01CA tensor/universal-property/associativity passages,Lemmas17.16.1–5 with printed proof text. Selected sources only; no new source-route closure or journal/preprint collation.
- Check exact pinned Mathlib PiTensorProduct map/map_tprod/map_comp/map_id/congr,multiplication,unit,singleton and degree-cast constructions and hypotheses. Reuse allgeneric carriers and functor laws. A bounded exact-pin native TauCeti search found no matching affineOrderedStep/Iterate or ordered/nilpotent Higgs declaration within that search scope; no broad absence claim.
- Prove seven actual native affine lemmas:step and all-order naturality,monotonicity,surjective fixed-bound preservation,two-isomorphism same-bound reflection,and first/second-degree comparisons. Seven actual examples pass. Add exact statements,proof routes,promoted APIs,uses and tests to packet/reader/suggested file.
- Preserve all88 old statements,86 whole node objects,122 inherited APIs,114 inherited tests,149 source-item obligations,five requests,eleven gaps,six planets and35 global signature omissions. Only step/iterate gain new APIs/uses; the iterate gains seven tests. Keep every node unchecked,H.0 partial,H.1–H.8 not_read.

## Mathematical scope and convention

The canonical field is theta:E→E tensor Q. The successor keeps E on the left and inserts the newest coefficient first in the ordered coefficient word. The predecessor mathematical handoff wrote Q tensor E; transporting those formulas requires a tensor flip and cannot identify carriers literally. Our native proofs use the canonical E-left definition verbatim.

For an intertwining f:E→F,u:Q→P,n≥0,naturality says I_n(psi) composed with f=(f tensor T_n(u)) composed with I_n(theta). At degree zero both sides send e to f(e) tensor1_0; Fin0 elimination identifies the empty coefficient maps. For a successor,substitute the recursion and induction hypothesis,then the separately promoted step-naturality identity. The step proof performs native tensor induction; a pure coefficient word becomes (u(q),u(q1),…,u(qn)) in that order. No basis,rank or integrability is needed.

If f is surjective,zero on the right forces I_n(psi)=0 by evaluating preimages. This proves preservation for arbitrary u at the same n. Reflection uses the injective actual TensorProduct.congr of f and PiTensorProduct.congr of the n copies of an isomorphism u. Both isomorphisms are explicit. Monotonicity writes m=n+d and uses the zero successor composition. It does not produce a uniform exponent on an infinite cover.

For degree one the exact comparison map is id_E tensor the native inverse singleton equivalence Q≃Q^(tensor1). For degree two apply the existing tensor congruence of those two singleton equivalences,then native TensorPower.mulEquiv at(1,1). This comparison maps p tensor q to the word(p,q),so the earlier noncommuting E12/E21 square calculation keeps its order. The actual native tensor congruence gives the zero equivalences for degree one and degree two. No symmetric/exterior quotient is used.

Over Z/2,take the unit line field theta(e)=e tensor1,psi=0,f=id,u=0. The field equation intertwines,psi has zero first iterate,and theta does not. The Lean example proves this with native tensor equivalences. Thus invertible f alone cannot reflect a bound after an arbitrary coefficient map. This test also rules out a positive-characteristic coefficient-collapse shortcut.

## Reproducible native evidence

Immutable proof commit:ab19cc58e36f8fe16ff95e0258bb5dd308e2fb5f. [Public source](https://github.com/CBirkbeck/tauceti-explorer/blob/ab19cc58e36f8fe16ff95e0258bb5dd308e2fb5f/research/blueprint/suggested/HodgeStructuresPartII.lean). The archive is a block comment delimited by BEGIN/END ARCHIVED CHECKED HIGGS NATURALITY and contains a complete standalone Mathlib-only source. Extract it verbatim with the recipe below. Source SHA-256:98d24ca7657199269c93f26eaae69b83dfedcd777ea8b0f0a669e5bb437bacc8; compiler-log SHA-256:473915f1a9281af480b4599ff43db2ed51ab49d9423ca197eb7fd0dc15902caf. Public extraction was checked byte-for-byte against the compiled source; no replacement definitions or assumed predicates were injected.

Allseven new lemma axiom audits contain only propext,Classical.choice andQuot.sound; zero errors,warnings or admissions,seven examples,twelve matching actual declaration headers. Lean4.34.0-rc2 with Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; runtime2.20seconds,maxRSS2154116KiB,65GiB available. TauCeti f790474821cf4256814db967cb154e7af3d0c369 remains the packet pin but no compiled TauCeti import is claimed.

Run the extraction in a checkout containing that immutable commit,then use an already existing exact-pin Mathlib build. Check available memory≥20GiB first; one bounded process≤20minutes,no Lake setup/cache/library build/LSP.

```python
from pathlib import Path
import hashlib,subprocess
s = subprocess.check_output(["git","show",
    "ab19cc58e36f8fe16ff95e0258bb5dd308e2fb5f:research/blueprint/suggested/HodgeStructuresPartII.lean"],text=True)
p = s.split("BEGIN ARCHIVED CHECKED HIGGS NATURALITY\n",1)[1]\
     .split("END ARCHIVED CHECKED HIGGS NATURALITY",1)[0]
assert hashlib.sha256(p.encode()).hexdigest()=="98d24ca7657199269c93f26eaae69b83dfedcd777ea8b0f0a669e5bb437bacc8"
Path("higgs-naturality.lean").write_text(p)
```

The final canonical file removes the archive comment and keeps allnew theorem and example bodies admitted under protocol13. Entire exact source SHA-256:87dd584cbe55a71d10bf049f6839f87a83e04c1d73b81b334a685b079b4cfb2b; log SHA-256:a0bff331fa557021ea49a37df2737387a4bf6417dbeeb2a76f629e7640e01a5e. It has80 examples and elaborates with zero errors,198 admitted-declaration warnings and no other warnings. Runtime4.70seconds,maxRSS2933908KiB,65GiB available. This checks types,not implementation or the35 omitted global signatures. Earlier historical receipts apply to their recorded hashes only.

## Sources and checks

[Heuer arXivv3 HTML](https://arxiv.org/html/2307.01303v3),Definition1.2(1)–(2)/intro selected; downloaded SHA-256:ec7742d917b413a52d05e5eeffbab9fdaab3bed13412dc2c9e426ffb8bcb8081. [Stacks01CA](https://stacks.math.columbia.edu/tag/01CA),selected Section17.16 tensor passages; SHA-256:825127394e5828c3a56f5134b8823afba20547d7ba5173f624b2f9556a058e34. These motivate the field/morphism/tensor interfaces. The seven lemmas are authored affine deductions,not source-attributed correspondence results. Fresh source reading does not discharge source-route obligations.

Indexed packet checker:zero errors/warnings. Five-file intake,whitespace,preservation and exact type-header comparisons pass. The actual read-only atlas assembler accepts the candidate as promotion inputs:95 declarations andsix planets,no own skipped/pending links. Stage graph3022vertices/8663edges,own prerequisite DAG95/179,stage plus scoped reachable prerequisite DAG3112/8880,96 reachable declarations,51 existing virtual endpoints; allacyclic andzero unresolved references. Stage edges are unchanged from the same assembler run with the predecessor packet. No extra node-to-realises attachment is added and no atlas/site output is written. The graph recipe below uses the repository's actual assembler and input overlay; it is not a replacement graph builder. For the predecessor-edge comparison,save the packet from the base commit and pass its filename as the script's sole argument. Graph-recipe SHA-256:5a46304116f10354d329e9be99f8a194d5b697da439602b511696642ed3d32d5.

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
report['actualBlueprint']=roadmap['blueprint']
# The original packet is used as a second promotion input to check projection preservation.
p0=json.loads(sys.argv[1] and Path(sys.argv[1]).read_text()) if len(sys.argv)>1 else p
r0=copy.deepcopy(r)
basepackets=[x for x in packets if x[1].get('roadmapId')!=rid]+[(rid,p0)]
build.load_promoted=lambda *args:(copy.deepcopy(basepackets),copy.deepcopy(documents),copy.deepcopy(definitions))
b,*_=build.assemble(require_distances=False)
bedges={(e['source'],e['target']) for e in b['stageEdges']}
assert stageedges==bedges
report['stageEdgesUnchanged']=True
print(json.dumps(report,ensure_ascii=False,indent=2))
```

## Resume work

1. Supply the actual cross-ring scalar-extension comparison with scalar-tower/tensor associativity maps. Preservation keeps the same exponent without flatness;reflection needs faithful zero detection. An R-linear coefficient map is not this scalar-extension functor. Retain the predecessor flat nonfaithful projection counterexample.
2. Construct the Higgs-specific sheaf tensor-power compatibility by importing exact generic ordinary/enhanced supplier contracts. Prove restriction naturality and fixed-bound equality detection/gluing;locally varying bounds need an explicit finite subcover/maximum or suitable rank/reducedness assumptions. Do not replace a sheaf tensor by a tensor of global sections or assume a uniform bound on a disjoint unbounded-rank family.
3. Turn the predecessor field and reduced-scheme rank proofs into native canonical plans only after checking allfibre/local-free/coefficient-module hypotheses. Nonreduced rank-one and coherent non-locally-free coefficient counterexamples stay explicit;nilpotence kernels need not be subbundles.
4. Resume the augmentation same-exponent bridge with the actual source ideal and noncommutative End target;do not infer geometric nilpotence from a symmetric projection. Use an existing exact compiled TauCeti import set if available;never build it for this job.
5. Supply coefficient/Tate equivariance,CR.1 ordinary-connection comparison,DD.1 filtered period-lattice/Rees inputs,global determinant/exterior-power/descent and the remaining149 source-route inventory. Source-decompose H.1–H.8 before changing their status.

Scratch is deleted when the PR opens. The complete immutable native source,extraction hash,public predecessor handoffs and graph recipe above preserve the reviewable work.
