# FunctionFieldArithmeticPartII — native zero-section ranks checkpoint

Worker: Codex — codex-5ebb6f. Date:2026-10-02. Issue3403; claim5960931694, confirming bot5960933964. The whole issue was read before and after the winning confirmation. Branch codex-5ebb6f-function-fields-next1; base404db35ccec72b9ceabd108108d2ba8fa0762b2c.

The continuation derives the general zero-section field ranks from the actual native kernel coordinates. Nine additional planning nodes (two constructions and seven lemmas), six API records and fourteen tests give158 unchecked nodes:9 definitions,27 constructions,76 lemmas,35 theorems,10 comparisons and1 application. There are117 required API records,119 required definition/construction tests,131 total tests,39 planets and118 baseline entries. All ten stages remain partial with eight gaps and thirteen requests. This is a research checkpoint; the geometric roadmap and complete suggested file remain unfinished.

## Native mathematics and preservation

Keep B=A[x]/(xⁿ−f) as native AdjoinRoot, H=A[Multiplicative(ZMod n)] and the actual coaction-induced comparison Θ:B⊗_A B→H⊗_A B. The predecessor specifies the source coordinate equivalence Cs, target coordinates and cyclic permutation σ(i,j)=(i,i+j mod n). These maps, including all predecessor proofs, are retained.

The restricted equivalence W≃L uses W={(i,j):n≤i+j} and L={(i,k):k<i}. Both are actual subtypes of Fin n×Fin n. The inverse is the restriction of the existing cyclic subtraction. Import the finite ordered-pair counting theorem to obtain card L=choose n2=n(n−1)/2, then transport that count to W. The counting auxiliary admits n=0; every root construction keeps n≥1.

At f=0, the specified kernel coordinates take values in ker(0·id_A)=A. Compose the preceding actual kernel equivalence with the pointwise native top-submodule equivalence to specify K₀:ker Θ₀≃ₗ[A](W→A). Its forward map extracts Cs coefficients. Its inverse extends wrapping coefficients by zero and synthesizes the actual tensor element. This holds over every commutative A, including nonreduced and zero rings; no replacement carrier, arbitrary vector-space model or assumption of geometric points appears.

Over a field, the finite-function dimension theorem gives dim ker Θ₀=card W and Cs gives dim(B⊗B)=n² for every f. Transfer finite dimensionality through the injective actual coordinate map and import rank-nullity. Evenness of n(n−1) is used before dividing by two, giving dim im Θ₀=n(n+1)/2. The existing simultaneous rank statement follows by pairing those two formulas. No inverse of n or characteristic restriction is used. In particular, over F₃ at n=3 the image has dimension six; over any field at n=2 the image/kernel dimensions are three/one, and over Q at n=4 they are ten/six. The branch algebra remains k[x]/(xⁿ), with its nilpotents.

All149 inherited node IDs, mathematical statements, hypotheses, API, sources and statuses are preserved;148 whole node objects are unchanged. Only the old zero-rank node's proof/prerequisites and two new tests change. Its acceptance conditions are retained. Both source routes (28 Yun–Zhang and38 Abdurrahman–Venkatesh records), reserved root-stack owner, curve/moduli import, source versions/findings/coverage, sibling ownership, gaps, requests, restructurings and39 planets are unchanged. All inherited reader declarations remain. The roadmap definition is byte-for-byte unchanged. Generic dimension, rank-nullity, counting and equivalence infrastructure is imported, not planned again.

The general determinant, including its permutation sign, is the sole remaining admission in the separate native calculation. The actual rank formulas and all51 examples have proved bodies there. That does not close geometric root-stack descent, normalized coframes, quotient algebraicity/coarse properties, coherent infinite fpqc towers, Kummer H¹ or ramified class-field theory.

## Reading and baseline

The whole [incoming handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/404db35ccec72b9ceabd108108d2ba8fa0762b2c/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md), all149 inherited mathematical statements and29 deduplicated hypothesis groups, all eight reviewed parent FA.0–FA.7 audit rows with their target/evidence/duplication records, and REV-AUDIT-20 were freshly read. There is no PartII audit row. The full own ten-stage definition, reserved root-stack contract and SF.1/SF.2/SF.3/R09.4/R09.5 supplier descriptions were read. The incoming three immutable native proof fragments were reconstructed and their exact hashes verified. Nearby StableReduction and JacobianChallenge upstream documents were read earlier in this continuous worker session. The link-entry screen found no packet entry mentioning this PartII. No fresh whole-source, whole-packet metadata or whole-library audit is claimed.

Fresh primary reading: [Talpo–Vistoli v2](https://arxiv.org/pdf/1410.1164v2), complete printed pp.12–16, from the root-object construction through Corollary3.13 and the beginning of3.14, including the proofs of3.5,3.7,3.12 and3.10. Fresh downloaded SHA25692a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2 matches the inherited receipt. [Stacks040N](https://stacks.math.columbia.edu/tag/040N), complete Lemma59.28.3 statement and proof, was also reread. The latter concerns unit parameters. Our zero-parameter dimension formulas are explicit root-chart derivations, not quoted paper or Stacks theorems. Broader YZ19/AGV/B24/AV primary reading, paper route collations, source findings, image checks and arithmetic sweeps retain the preceding workers' receipts; no fresh erratum or new image/sweep result is asserted.

Eleven new Mathlib baseline statements were read with their ambient hypotheses at082e2d37e8b0463410cdb532e111cd43d5a66174: the ordered-pair/subtype cardinality and choice formulas; equivalence of subtypes; cardinality invariance; divisibility of n(n−1) by2; finite-function dimension; pointwise linear equivalences; the top-submodule linear equivalence; injective transfer of finite dimensionality; and linear-equivalence dimension invariance. Their exact files, lines and file hashes are in the packet. The existing rank-nullity statement was freshly read in FiniteDimensional/Lemmas. The native Tau Ceti character generator is expanded only to its exact pinned definition. The F₃ example imports the pinned field structure with its primality instance; it does not derive a field structure from a commutative ring assumption.

## Native proof and admitted signatures

The complete separate native calculation is archived in the allowed suggested-file history at [proof commitfdc057a53800a1937f36f157aa7636a94611b5a9](https://github.com/CBirkbeck/tauceti-explorer/blob/fdc057a53800a1937f36f157aa7636a94611b5a9/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean), between BEGIN/END ARCHIVED CHECKED ROOT ZERO RANK. It combines the actual predecessor coaction/weighted table/module coordinates/unit inverse and their examples with this continuation's proved bodies. The public archive contains one admission, exclusively the still-open determinant. It is not a proof of the whole roadmap. The PR head restores the proposed bodies under PROTOCOL13.

Actual extraction: 1586 lines,51 examples,0 errors,1 admitted-body warning (determinant),0 other warnings. All36 printed declaration axiom lists, including the14 new/updated exports and22 inherited module/unit exports, contain only subsets of propext, Classical.choice and Quot.sound. The rank computation has no admitted dependency. Available memory60 GiB; time11.30 seconds, maximum RSS3185264 KiB.

Final proposed native extraction: 845 lines,51 examples,0 errors,126 admitted-body warnings,0 other warnings. Available memory60 GiB; time4.27 seconds, maximum RSS3107284 KiB. Thirteen new native/canonical declaration headers are identical; the existing rank header is preserved. Every inherited reader declaration and all new packet API/test names occur in the submitted deliverables.

Both runs used a single direct Lean4.34.0-rc2 process at a time in an existing exact-pin Mathlib build, with a20-minute timeout. No project, build, cache download or LSP was started and no compiler process remains. The complete Tau Ceti suggested file is uncompiled: the exact-pin line-bundle/roots-of-unity compiled imports are absent in the available build. Native extraction excludes those geometric/Tau Ceti branches and does not certify their signatures or suppliers.

SHA256 receipts:

- Actual extraction: 806e853b6b28b5608f6631c48523d66ac16a63bac60964c69601fe51359b1525
- Actual normalized diagnostics: 2b929a47164388b41564da68dc8d1dc5027ff6bff7314853752919c0fe6571c6
- Proposed native extraction: 0b58f3062788163a1ad4e2b53a5d5f370c9f93fa2ff2ad36bbfbfe6af4754759
- Proposed normalized diagnostics: 558fff11a24827f05b7bd4e25a14c55ccb4b94cff9c8ae6a461152e3b5b57028

Diagnostics replace the invocation source path with RankProof.lean or Submitted.lean and exclude the separate TIME/RSS trailer. Public reconstruction verifies both source hashes byte for byte.

## Validation and actual atlas projection

The indexed packet checker reports0 errors/0 warnings. The normal read-only assembler overlay uses the actual packet and roadmap definition, retaining other parts. Stage graph:3056 vertices including51 inherited virtual endpoints/8723 edges. Own graph:158 declarations/327 edges. Combined stage graph and209 reachable declarations:3226 vertices/9420 edges. All are acyclic; external prerequisites resolve; all54 required stage pairs are reachable. Stage edges, own empty skipped links, all unrelated skipped lists, the reserved key and all source/supplier boundaries match the control. No synthetic prerequisite, attachment or atlas/application file was added. The public script also checks148 unchanged whole nodes and149 preserved statements, all eleven new baseline entries and reader/API/test retention.

## Reproduce the native extraction

Save the following Python script and run it from a checkout containing the immutable proof commit and final proposed suggested file. It writes only its own scratch directory. Use an already compiled Mathlib build at the exact pin; require at least20 GiB available and one direct compiler process with a20-minute timeout. Do not set up a project, build libraries, download caches or start an LSP.

```python
from pathlib import Path
import subprocess,hashlib,re
sc=Path('scratch-zero-rank');sc.mkdir(exist_ok=True)
sourcepath='research/blueprint/suggested/FunctionFieldArithmeticPartII.lean'
archived=subprocess.check_output(['git','show','fdc057a53800a1937f36f157aa7636a94611b5a9:'+sourcepath],text=True)
proof=archived.split('/- BEGIN ARCHIVED CHECKED ROOT ZERO RANK\n',1)[1].split('END ARCHIVED CHECKED ROOT ZERO RANK -/',1)[0]
assert hashlib.sha256(proof.encode()).hexdigest()=='806e853b6b28b5608f6631c48523d66ac16a63bac60964c69601fe51359b1525'
s=Path(sourcepath).read_text()
imports='\n'.join(l for l in s.splitlines()if l.startswith('import Mathlib'))
initial=s[s.index('abbrev AffineRing (f : A)'):s.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
one=s[s.index('-- TauCeti.RootStack.affineCoaction.test_one'):s.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
comparison=s[s.index('section AffineTorsorComparison'):s.index('-- Native acceptance computations')]
extra=s[s.index('-- Native acceptance computations'):]
sketch=imports+'\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'+initial+one+comparison+extra
sketch=sketch.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
assert hashlib.sha256(sketch.encode()).hexdigest()=='0b58f3062788163a1ad4e2b53a5d5f370c9f93fa2ff2ad36bbfbfe6af4754759'
(sc/'RankProof.lean').write_text(proof)
(sc/'Submitted.lean').write_text(sketch)
print('Both public native extractions verified byte for byte.')
```

Delete own scratch after submission. The unchanged predecessor statement-level source findings and routes remain review obligations.

## Reproduce projection and preservation

Save and run this script from the checkout; it imports the normal assembler read-only and writes no atlas files. Script SHA256a765c35a8a9669d55932dcb6aaffbf05a61dbd0d592ff1667c146ed91ebffa0e.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="FunctionFieldArithmeticPartII"
stem=rid
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="404db35ccec72b9ceabd108108d2ba8fa0762b2c"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
   {**ds,stem:"research/blueprint/readmes/"+stem+".md"},
   [d for d in defs if d["id"]!=rid]+[definition])
 build.load_promoted=overlay
 return build.assemble(require_distances=False)[0]
a=assemble(p,r);control=assemble(old,oldr)
def dag(vertices,edges):
 vertices=set(vertices)|{x for e in edges for x in e};following=defaultdict(set);indegree=dict.fromkeys(vertices,0)
 for s,t in set(edges):
  following[s].add(t);indegree[t]+=1
 q=deque(v for v in vertices if not indegree[v]);seen=[]
 while q:
  v=q.popleft();seen.append(v)
  for w in following[v]:
   indegree[w]-=1
   if not indegree[w]:q.append(w)
 assert len(seen)==len(vertices),("cycle",sorted(v for v in vertices if indegree[v])[:10])
 return {"vertices":len(vertices),"edges":len(set(edges)),"acyclic":True}
se={(e["source"],e["target"]) for e in a["stageEdges"]}
ce={(e["source"],e["target"]) for e in control["stageEdges"]}
assert se==ce
stageids={s["id"] for s in a["stages"]}
own={n["id"]:n for n in p["nodes"]}
oe={(dep,n["id"]) for n in own.values() for dep in n.get("prerequisites",[]) if dep in own}
stageDAG=dag(stageids,se);ownDAG=dag(own,oe)
allnodes=dict(own)
for folder in ("data/decompositions","data/blueprints","research/blueprint/packets"):
 for path in sorted((root/folder).glob("*.json")):
  for n in json.loads(path.read_text()).get("nodes",[]):allnodes.setdefault(n["id"],n)
used=set(own);todo=list(own)
while todo:
 v=todo.pop()
 for d in allnodes[v].get("prerequisites",[]):
  if d in allnodes and d not in used:used.add(d);todo.append(d)
stagevertices=stageids|{x for e in se for x in e}
unresolved=[(v,d) for v in used for d in allnodes[v].get("prerequisites",[]) if not d.startswith(("mathlib:","tauceti:")) and d not in allnodes and d not in stagevertices]
assert not unresolved,unresolved
edges=set(se)
for v in used:
 n=allnodes[v]
 parent=n.get("parentStageId")
 if parent:edges.add((parent,v))
 for d in n.get("prerequisites",[]):
  if d in stageids or d in used:edges.add((d,v))
for request in p["requests"]:
 for v in request["neededBy"]:edges.add((request["supplier"],v))
combined=dag(stageids|used,edges)
following=defaultdict(set)
for s,t in se:following[s].add(t)
def reachable(s,t):
 todo=[s];seen=set()
 while todo:
  x=todo.pop()
  if x==t:return True
  if x not in seen:seen.add(x);todo+=list(following[x])
 return False
pairs=set()
for stage in r['stages']:
 for dep in stage.get('requires',[]):pairs.add((dep,rid+':'+stage['key']))
def stage_of(v):
 seen=set()
 while v in allnodes and v not in seen:
  seen.add(v);v=allnodes[v].get('parentStageId')
 return v
for n in own.values():
 for d in n.get("prerequisites",[]):
  if d in stageids and d not in allnodes and d!=stage_of(n['id']):pairs.add((d,stage_of(n['id'])))
for req in p["requests"]:
 for v in req["neededBy"]:
  target=stage_of(v)
  if req["supplier"]!=target:pairs.add((req["supplier"],target))
missing=[(s,t) for s,t in pairs if not reachable(s,t)]
inheritedMissing=[]
assert missing==inheritedMissing,missing
assert p["requests"]==old["requests"]
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==cr[rid]["blueprint"]["declarations"]+9
assert ar[rid]["blueprint"]["planets"]==cr[rid]["blueprint"]["planets"]
assert ar[rid]["blueprint"]["skippedLinks"]==cr[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("sourceIssues","requests","sourceCoverage","sourceVersions","restructure","gaps"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(a in own[id].get("acceptance",[]) for a in n.get("acceptance",[]))
assert p["baseline"]["declarations"][:107]==old["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==118
assert r==oldr
unchanged=sum(own[id]==n for id,n in on.items())
assert unchanged==148
assert len(own)==158
assert all(n["implementationStatus"]=="unchecked" for n in own.values())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
reader=(root/("research/blueprint/readmes/"+stem+".md")).read_text()
for node in old["nodes"]:
 assert node["id"] in reader,node["id"]
public=subprocess.check_output(["git","show","fdc057a53800a1937f36f157aa7636a94611b5a9:research/blueprint/suggested/FunctionFieldArithmeticPartII.lean"],text=True)
proof=public.split("/- BEGIN ARCHIVED CHECKED ROOT ZERO RANK\n",1)[1].split("END ARCHIVED CHECKED ROOT ZERO RANK -/",1)[0]
names={node["declarationName"] for node in p["nodes"][len(old["nodes"]):]}
names|={api["name"] for node in p["nodes"][len(old["nodes"]):] for api in node.get("api",[])}
names.add("TauCeti.RootStack.affineTorsorComparison.zero_rank")
for name in names:
 localname=name.removeprefix("TauCeti.RootStack.")
 def header(s):
  match=re.search(r"^(?:noncomputable )?(?:def|lemma|theorem) "+re.escape(localname)+r"\b.*?:=",s,re.M|re.S)
  assert match,name
  return re.sub(r"\s+"," ",match[0])
 assert header(proof)==header(lean),name
assert len(names)==14,len(names)
for node in p["nodes"][len(old["nodes"]):]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"][len(old["nodes"]):]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,"research/blueprint/readmes/"+stem+".md","research/blueprint/suggested/"+stem+".lean","research/blueprint/handoff/DESIGN-"+stem+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":ar[rid]["blueprint"]["declarations"],"partDeclarations":len(own),"partPlanets":sum("planet" in n for n in own.values()),"planets":ar[rid]["blueprint"]["planets"],"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "virtualStageEndpoints":len(stagevertices-stageids),"unresolvedPrerequisites":unresolved,"reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}

print(json.dumps(result,indent=2))
```

## Resume

1. Reconstruct the actual archived native proof, rather than using admitted PR-head bodies as proof inputs. The general field ranks are checked there. Complete the determinant sign using rowwise cyclic translations and the wrapping-cardinality theorem; keep n=1, the zero ring and arbitrary characteristic.
2. Continue root-stack carriers and the actual tensor-section/unit-coordinate, geometric finite chart, coherent infinite fpqc tower and ramified class-field contracts through their existing suppliers. JAC-A, ST-LISSE/ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING remain open. Preserve normalized coframes, full nilpotent closed charts, both paper routes and all source corrections. No stage is closed.

Opening the checkpoint PR ends this claim. Continue with the next available issue in WORKERS order; never unclaim submitted work or independently review/red-team own contributions.
