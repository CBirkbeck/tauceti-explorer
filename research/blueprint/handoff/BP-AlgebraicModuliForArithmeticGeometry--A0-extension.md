# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Codex — codex-rtOQ9t; Refs #672. Partial checkpoint. No stage or reserved key is closed.

Claim 5958723720 was confirmed by bot 5958726791; the whole issue was read before and after claiming. Base d3c075d7689eec2439a5bc78e8813551730d72f5 contains PR #5818. The [predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/d3c075d7689eec2439a5bc78e8813551730d72f5/research/blueprint/handoff/BP-AlgebraicModuliForArithmeticGeometry--A0-extension.md) retains earlier full-paper, module/Picard/cohomology and finite-regression receipts, plus its native covering-descent proof archive. Historical receipts belong to their stated agents. The finite regression was not rerun here.

## Concrete delivery

Four new R09.4 nodes: coverAut_naturality, coverAut_inv, coverCenter and coverCenter_unique. The centre-unit construction has seven API items and four tests. All 144 earlier statements and 143 complete earlier node objects remain unchanged; only the central-section sheaf node’s prerequisites/proof outline changes. All 91 baseline entries, ten planets, 68 routes, 21 requests, reserved contracts and source-issue records are preserved.

Counts: 148 nodes (16 definitions, 34 constructions, 67 lemmas, 27 theorems, four comparisons), 171 total API items, 161 total tests; definition/construction-only counts 166 API items and 155 tests. Nine gaps remain. Four scope rows are partial and four not_read; every implementation status remains unchecked.

For a covering matching family, native full faithfulness detects the naturality equation at every fibre morphism. Native descent hom extensionality reduces it to the cover; the local centre unit’s naturality supplies the equation there. This requires only covering/prestack hypotheses. NatIso.ofComponents then supplies the actual identity-functor automorphism, including its inverse naturality; unitsEndEquivAut at that identity functor gives a unit of the existing categorical centre. All-object local uniqueness, identity, inverse and agreement with the (U,id) component of an existing section are checked. No new generic descent or stack carrier is planned.

The four native examples use the actual parameterized carriers: identity, inverse-family agreement, exact existing-section component and empty F(U). The empty-fibre example does not imply the whole central-section group on C/U is trivial. There is no newly instantiated geometric point-site, restriction-chain or root-gerbe fixture.

## Reading and owner boundary

Read all eight current reviewed library-audit rows; all 144 current node statements; all nine applicable RS-27 layer decisions and accepted status; confirmed algebraicgeometry/1,/2,/10,/11,/12,/14,/17,/18 and etale/25 claim/fix records. The earlier required whole upstream StableReduction/JacobianChallenge reads remain continuous-session history, not fresh reads for this checkpoint. D0 owns generic stacks/descent/stackification, SF1 owns ordinary spaces/sites/diagonals, and R09.4 retains the accepted algebraic-stack criteria/elliptic comparison. Generalized elliptic and abelian/PEL applications remain downstream without reverse cycles; stable pointed-curve moduli and coherent duality retain their reserved suppliers.

Fresh source reading is the complete statement and printed proof of [Stacks Lemma 8.11.8](https://stacks.math.columbia.edu/tag/06NY), including the final omitted varying-base conclusion, and the entire printed [Definition 8.4.1](https://stacks.math.columbia.edu/tag/026F). No referenced proof or whole paper is newly claimed. Their fresh downloaded HTML SHA256 values are 784df742e6d6c147f90645bfef73a6ad9fa60cb34e9b2d3006401857ed88a32e and 0024923a8e370df81c72261a9765c15c3e1d3bbb8b59a46ab41605f2f2ae60a0.

At Mathlib 082e2d3, read the actual NatIso.ofComponents, Aut.unitsEndEquivAut, CatCenter/ext/naturality, fully faithful map_injective/preimageIso, IsPrestack/IsPrestackFor/isPrestackFor′ and native DescentData.hom_ext statements/constructions. These declarations are already in the 91-entry baseline and are imported rather than replanned.

## Distinct native proof receipt

The [immutable new proof block](https://github.com/CBirkbeck/tauceti-explorer/blob/61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7/research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean) contains actual proofs for all ten new declarations and four examples. The recipe below combines its exact block with the predecessor’s actual native cover proofs at f0bb4f284aefaffe97578454ecf9a0588472103e. It does not use the predecessor’s admitted final cover declarations.

The resulting 578-line extraction (including ten audits) has eleven examples, zero errors, two unused inherited admission warnings and no other warnings. All ten kernel audits depend only on propext, Classical.choice and Quot.sound, with no admission dependency. It excludes global sheaf/evaluation-surjectivity and earlier TauCeti cohomology/module blocks. Runtime 3.30 seconds; maximum RSS 3264356 KiB; 65 GiB available before the single compiler process.

SHA256:

- Immutable full proof source: af52e5d4cec14f84e1aed2097178e41cae157e27a0afe1a732fbaa2dbf2e2f46.
- Native extraction with audits: 5ba7bf1bae0220dac0747c1a57b6db98b92e0b491de98658cb42ae79e87afe5c.
- Normalized native Lean output (compiler output only, scratch path removed): a25591883e5c4f92f1df636ebac7a909cfb897488bb4ef525b88bb0517a3762a.

## Distinct admitted-sketch receipt

All ten new declaration bodies and four new example bodies in the final suggested file are admitted under PROTOCOL §13. The separate 932-line extraction uses only Mathlib imports, the complete initial gerbe/banding prefix, an explicit namespace closure and the complete intrinsic-band namespace. It includes the unfinished global sheaf/evaluation-surjectivity signatures as admissions; earlier module/cohomology blocks and the TauCeti cohomology import are excluded.

It has 36 examples, zero errors, 38 admission warnings and no other warnings. Runtime 4.30 seconds; maximum RSS 3302744 KiB; 67 GiB available before the single process. The full suggested file remains uncompiled because the exact pinned TauCeti cohomology import has no compiled artifact. Both extractions use Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2. No Lake setup/cache/build/LSP was started. Neither receipt proves arbitrary-base compatibility or global central-section sheaf existence.

SHA256:

- Final suggested source: 6e150287ce6500aaa60bf0f5ded5ddbe458062a99febba8bde4befcbeca4442a.
- Admitted extraction: c29381a1c95b4bef492b358e7fcb7077264dc1e336cfc5ec94b1000a872151f2.
- Normalized admitted-sketch Lean output: 815882eddf1a31b8fc71963214d855ee370d78652f80c454ad43875d30db7f15.

Run this exact extraction recipe from the final submitted checkout containing both immutable commits. Outputs go into its own scratch directory; run each generated file separately with lake env lean from an existing exact-pin Mathlib build, observing WORKERS memory and time limits. Recipe SHA256 32944dbadf423ade7756936ec2f14f880092bfba760086e8173a0749b455852e.

```python
from pathlib import Path
import subprocess
output = Path("scratch-codex-rtOQ9t-center")
output.mkdir(exist_ok=True)
path = "research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
prior = "f0bb4f284aefaffe97578454ecf9a0588472103e"
archive = "61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7"
old = subprocess.check_output(["git", "show", prior + ":" + path], text=True)
new = subprocess.check_output(["git", "show", archive + ":" + path], text=True)
start = "/-- R09.4/band-center-cover-naturality"
stop = "/-- R09.4/band-center-sheaf: glue"
marker = "namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
def imports_prefix_central(s):
    imports = "\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
    prefix = s[s.index("open CategoryTheory Opposite Bicategory"):s.index("variable {A : Sheaf")]
    central = s[s.index(marker, s.index("/-! Intrinsic-band continuation")):]
    return imports + "\n" + prefix + "\nend TauCeti.AlgebraicGeometry\n", central
head, central = imports_prefix_central(old)
fragment = head + central[:central.index(stop)] + new[new.index(start):new.index(stop)]
fragment += "\nend IntrinsicBandSections\nend TauCeti.AlgebraicGeometry\n"
names = ["coverAut_naturality", "coverAut_inv", "coverCenter", "coverCenter_app_hom",
         "coverCenter_app_inv", "coverCenter_map_hom", "coverCenter_one", "coverCenter_inv",
         "coverCenter_unique", "coverCenter_existing"]
audits = "\n".join("#print axioms TauCeti.AlgebraicGeometry.IntrinsicBandSections." + n for n in names)
(output / "center-native.lean").write_text(fragment + "\n" + audits + "\n")
# Run this portion from the final submitted revision, not the intermediate archive.
submitted = Path(path).read_text()
head, central = imports_prefix_central(submitted)
central = central[:central.index("end TauCeti.AlgebraicGeometry") + len("end TauCeti.AlgebraicGeometry")]
(output / "center-admitted.lean").write_text(head + central + "\n")
```

## Packet and actual atlas validation

Indexed check_blueprint passes with zero errors/warnings. Intake file-policy and whitespace checks pass. The actual read-only build.assemble overlay retains all other promoted parts and yields 148 declarations and ten planets, no skipped links for this roadmap, all 24 computed scope/supplier stage paths reachable, and unchanged stage edges and other roadmaps’ skipped links. The stage DAG has 3017 vertices/8655 edges; the own declaration DAG has 148/282; the combined stage/151-reachable-declaration DAG has 3158/9152. All three are acyclic. The three reached external declarations are existing D0 stackification, groupoid quotient/2-fibre-product and Čech/derived-comparison suppliers. No assembled data or application file was written.

The reproducible read-only projection/preservation recipe follows. Run it from the same checkout as the base and final revision; it prints JSON and writes no atlas files. Script SHA256 fd088f8047e306d08b64c5f97fd374dfbf35204805dac1007540cbca85e56949.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="AlgebraicModuliForArithmeticGeometry"
stem=rid+"--A0-extension"
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/atlas/roadmaps/"+rid+".json"
base="d3c075d7689eec2439a5bc78e8813551730d72f5"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
   {**ds,stem:"research/blueprint/readmes/"+stem+".md"},
   defs)
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
assert ar[rid]["blueprint"]["declarations"]==cr[rid]["blueprint"]["declarations"]+4
assert ar[rid]["blueprint"]["planets"]==cr[rid]["blueprint"]["planets"]
assert ar[rid]["blueprint"]["skippedLinks"]==cr[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("sourceIssues","requests","routedItems","keyDefinitions","routedItemAudit"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
 assert all(a in own[id].get("acceptance",[]) for a in n.get("acceptance",[]))
assert p["baseline"]==old["baseline"]
unchanged=sum(own[id]==n for id,n in on.items())
assert unchanged==143
assert len(own)==148
assert all(n["implementationStatus"]=="unchecked" for n in own.values())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
for node in p["nodes"][len(old["nodes"]):]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"][len(old["nodes"]):]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,"research/blueprint/readmes/"+stem+".md","research/blueprint/suggested/"+stem+".lean","research/blueprint/handoff/BP-"+stem+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":ar[rid]["blueprint"]["declarations"],"partDeclarations":len(own),"partPlanets":sum("planet" in n for n in own.values()),"planets":ar[rid]["blueprint"]["planets"],"ownSkippedLinks":ar[rid]["blueprint"]["skippedLinks"],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairs":len(pairs),"requiredStagePairsReachable":len(pairs)-len(missing),"inheritedMissingStagePairs":missing,"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}

print(json.dumps(result,indent=2))
```

## Resume

Next prove compatibility under every g:W→V of the fibre-centre units formed on the pullback covering sieves, comparing on common covering refinements and retaining the native mapId/mapComp transports. Then assemble their family over all a:V→U into an actual IntrinsicBandSection, apply covering separatedness for uniqueness and prove the existing isSheaf statement. The present fibre-centre unit and all-object uniqueness do not discharge arbitrary-base restriction or assembly.

Continue abelian-inertia evaluation surjectivity, the locally glued inverse of the chosen-band comparison and the SF1 descended-slice comparison. Instantiate actual connected/disconnected point-site classifying groupoids, the restriction-chain site without a terminal object and nonneutral O(1) root gerbes. Continue all broader source reading, nine gaps and 21 requests before claiming stage or reserved-key closure.
