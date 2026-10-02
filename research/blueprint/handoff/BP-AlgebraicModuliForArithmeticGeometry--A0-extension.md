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


## Current continuation — Codex codex-a71f92, issue #672

All preceding continuation receipts and their resume sections are historical. The current frontier is below. Base d7d17eaa67f35fa990fcbbfcc3e1a37108e764e1 includes PR #5832. Seven new declaration-sized leaves preserve all 148 existing statements and 147 complete node objects. The inherited sheaf theorem receives the stronger prestack-sheaf supplier; no earlier statement, reserved id, 68 source route, 21 request, source issue, stage id or planet changes.

### Established sub-obligation

The native centre units over every pullback covering sieve commute with every base restriction. The comparison is checked using the actual native mapComp natural isomorphism and centre naturality, not strict equality of iterated pullback objects. The matching dependent arrow indices are reconciled by base-category associativity and proof irrelevance.

These units form an actual IntrinsicBandSection; its restrictions recover the original matching family. Existing covering separatedness proves uniqueness and recovery of an existing section. Identity and inverse gluing are exact. Finally, a direct Hom(E,-)-valued proof establishes the actual categorical Presheaf.IsSheaf predicate for every prestack, without groupoid fibres, terminal objects or fibre products. Preservation of zero and addition in each assembled abelian-group homomorphism is proved by cover separatedness and local homomorphism laws. The generic stack/descent carrier remains imported, never rebuilt.

The old intrinsic-band gap is not removed: general Hom-gluing/sheafness is now discharged, but abelian-inertia evaluation surjectivity, the locally glued chosen-band inverse and the actual SF1 slice comparison remain unfinished. All eight stages, nine broader gaps and 21 supplier requests remain partial/not_read/open.

### Sources, ownership and finding boundaries

Freshly read the entire printed Stacks Lemma8.11.8 proof and Definition8.4.1; exact HTML hashes are the two new source records. This is the derived completion of the omitted varying-base argument, not a source quotation claiming that proof was printed. The pinned mapComp′, its naturality, Cat.Hom.toNatIso, categorical/type-valued sheaf definitions and epi cancellation were read before adding seven baseline entries. All 91 inherited baseline entries and all historical whole-paper receipts remain credited to their original readings.

The current eight audit rows and accepted RS27 narrowing remain binding. The nine confirmed area finding claim/fix records were rechecked. Their existing handling is preserved: /1 imports spaces/sites/diagonals from SF1 and ordinary stacks/descent from D0; /2 retains the explicit approximation/G-ring/Popescu supplier rather than a backwards Artin cycle; /10 imports anchor descent classes; /11 imports the affine Weil-restriction cases; /12 imports relative Proj/Grassmannian anchors; /14 keeps the non-Noetherian/Tor-amplitude extension; /17 imports StableReductionPartII:key/moduli-curves; /18 and etale/25 import SchemeAndStackFoundations:key/coherent-duality. No new whole-paper, finite-regression or geometric-site fixture receipt is claimed.

### Compilation receipt

The full suggested file is uncompiled: its exact pinned TauCeti cohomology module has no existing compiled artifact. No new Lake project, library build or cache download was made. A single Lean process at a time ran in the existing build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Available memory was at least 64 GiB in these checks, above the 20-GiB threshold, and each invocation had a 20-minute timeout.

The actual native proof block is archived at commit 7ce3625771acbf90d4fb6e6495cd30bc0d867e4c (suggested deliverable path only); the recipe combines it with the two native predecessor archives, avoiding the admitted cover proofs in the final file. The audited extraction has 922 lines, 17 examples and 17 new kernel audits: zero errors, two unused inherited admission warnings and no other warnings. Every new audit depends only on propext, Classical.choice and Quot.sound, never an admission. Its SHA-256 is c537788524541bf1ae88971f6b28f6c807e4cedc2258ce107fafb154e74068ec; normalized Lean-output SHA-256 2ed0ec3f217395efdbb33d242fe6f49f5080bad765ccd67ffee13fea37027bc4. RSS 3353912 KiB, elapsed 3.93 seconds.

The final new signatures and six examples have admitted bodies as required by PROTOCOL §13; the routine pullbackArrow is a reducible indexing alias with actual data. The final Mathlib-only extraction has 1,131 lines and 42 examples: zero errors, 61 admission warnings and no other warnings. SHA-256 ee67893a7278573cee36d9ededbf3bce49ceb5406b0adb364644eb063e615580; normalized output SHA-256 40320048cd4a85c66815cefade444f46a7c7d1b34a6b671234516925ba6a32a0. RSS 3325820 KiB, elapsed 4.65 seconds. Neither extraction validates the inherited module/cohomology blocks or the full file. All implementationStatus values remain unchecked.

### Immutable-source reconstruction

Read the three commits into the existing shared clone with read-only fetches. The following recipe takes that clone and the submitted suggested text and returns two strings for own-scratch files. Use apply_patch to materialize those strings, then run one existing-build Lean process per file. It creates no repository snapshot and writes nothing to the shared tree. Strip only the own scratch-directory prefix and the resource-timing tail to reproduce the normalized output digests.

```python
"""Read immutable proof sources. Return strings for apply_patch; never edit the shared tree."""
import subprocess
from pathlib import Path
def reconstruct(repo,submitted):
    path="research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
    def read(ref):return subprocess.check_output(["git","show",ref+":"+path],cwd=repo,text=True)
    old=read("f0bb4f284aefaffe97578454ecf9a0588472103e")
    prior=read("61239b522c3a1eb4f4bc646f6b144aaa0d2b3ae7")
    new=read("7ce3625771acbf90d4fb6e6495cd30bc0d867e4c")
    start="/-- R09.4/band-center-cover-naturality"
    stop="/-- R09.4/band-center-sheaf: glue"
    marker="namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
    def head(s):
        imports="\n".join(l for l in s.splitlines() if l.startswith("import Mathlib"))
        prefix=s[s.index("open CategoryTheory Opposite Bicategory"):s.index("variable {A : Sheaf")]
        return imports+"\n"+prefix+"\nend TauCeti.AlgebraicGeometry\n"
    def central(s):return s[s.index(marker,s.index("/-! Intrinsic-band continuation")):]
    oldcentral=central(old)
    nativehead=head(old)+oldcentral[:oldcentral.index(stop)]+prior[prior.index(start):prior.index(stop)]
    firstmarker="/-! Arbitrary-base cover descent continuation, Codex codex-a71f92. -/\n"
    secondmarker="/-! Unique gluing and prestack sheaf descent continuation. -/\n"
    a=new[new.index(firstmarker)+len(firstmarker):new.index(stop)]
    # Each insertion contributes one separator newline after the archived block.
    a=a[:-1]
    b=new[new.index(secondmarker)+len(secondmarker):new.index("variable [hGerbe : IsGerbe F J]")]
    b=b[:-1]
    local=new[new.index("/-- Specific descent of evaluations"):new.index(secondmarker)]
    local=local.rstrip("\n")+"\n\n"
    names=["center_map_comp","centerFamily_congr","coverCenterAt","coverCenterAt_map_hom","coverCenterAt_compatible","coverCenterAt_one","coverCenterAt_inv","coverCenterAt_of_mem","glue","glue_val","glue_restrict","glue_one","glue_inv","coverCenterAt_existing","glue_unique","glue_existing","isSheaf_of_prestack"]
    native=nativehead+"\n\n"+a+"variable (J : GrothendieckTopology C)\n\n"+local+"\n"+b
    native+="\n".join("#print axioms "+n for n in names)+"\nend IntrinsicBandSections\nend TauCeti.AlgebraicGeometry\n"
    sketch=head(submitted)+central(submitted)
    return native,sketch
```

### Current counts and resume

155 nodes: 16 definitions, 36 constructions, 71 lemmas, 28 theorems and four comparisons. 183 total API items and 167 total tests; definition/construction totals 178 API items and 161 tests. Ten planets, 98 baseline declarations, nine gaps and 21 requests. Four coverage rows partial, four not_read. The gerbe reserved key is still partial.

Next prove evaluation surjectivity for abelian-inertia gerbes by local object-isomorphism transport. Then construct the locally glued inverse to the chosen-band comparison and compare with the actual SF1 descended slice sheaf. Instantiate the specified connected/disconnected point sites, terminal-free restriction-chain site, and nonneutral O(1) root gerbes. Continue the source reading and supplier requests of all other branches before claiming stage or reserved-key closure.


### Current atlas and preservation receipt

Publication preflight uses immutable base 09bb3d03b8984582f3e9d686ffaf0fcd4568f9f6. The fourteen targeted instruction, audit, roadmap and deliverable inputs and all eight scoped library-audit rows are unchanged from the mathematical audit base. The reserved-id registry is also unchanged. Both the original 148-node packet and this 155-node candidate were overlaid into the actual assembler while retaining every other promoted part; an unpromoted checkpoint was not treated as an empty baseline.

The indexed checker returns zero errors and zero warnings; actual intake and whitespace/private-path checks pass. The own declaration DAG has 155 vertices and 303 edges. The atlas stage DAG has 2966 listed stages and 8655 edges. Including all edge endpoints, all 158 reachable declarations (155 own and three existing suppliers), their parent-stage links, and all 21 request links gives 3165 vertices and 9180 edges. All three DAGs are acyclic. All 24 required stage paths are reachable: roadmap requires, explicit stage prerequisites and request suppliers are included. Own pending/skipped links are empty, other roadmap skips are unchanged, and no stage edge is added. The additional backwards dependency traversal, including baseline references, reaches 270 identifiers without a cycle.

For the historical read-only projection recipe above, use this publication base and the current candidate, change the declaration increment to seven, the unchanged-node assertion to 147, and total own nodes to 155. Replace whole-baseline equality by equality of the first 91 inherited baseline declarations; the seven appended declarations are the new native suppliers. Use endpoint-complete vertex counts as in that recipe's dag function. All requests, source issues, reserved-key mappings and routed-item audits remain equal. These are current receipts, not the old 148-node receipt. The exact own scratch validator SHA256 is 6eb7572f757dd28c08bc3c52c7589c12468d48a3338fdca62f7f3e1d3bf928e9; it executes the immutable-tree checker/intake/assembler and writes no repository or atlas files. The immutable proof-source archive is an additional parent of the final PR commit, so the native reproducer's commit remains reachable.

## Current continuation — Codex codex-5ebb6f, issue #672

All preceding continuation/resume receipts are historical. This continuation starts at immutable main62abfc13962892abfacb792ccb3527b37103aa42, containing the155-node packet from PR#5842. Eight new leaves give163 nodes:16 definitions,39 constructions,75 lemmas,28 theorems and five comparisons. There are198 total API items and178 total tests; the indexed definition/construction counts are190 API items and172 tests. All155 earlier statements and153 complete node objects are preserved. Only the existing choice-independence and evaluation-surjectivity nodes gain native adapters/suppliers and a precise frontier. All98 baseline references,10 planets,68 routed source items,21 requests, nine gaps, eight coverage rows and reserved ids remain unchanged.

### Established sub-obligation and frontier

For a fixed sieve R, objects x,y and arbitrary local isomorphisms e_i between their pulled-back objects, local conjugates of a∈Aut(x) form an actual native descent automorphism of y when inertia is commutative. The isomorphisms e_i need not form descent data. At every common test object, compare e₁ followed by the y transition with the x transition followed by e₂; their conjugation maps agree because the source automorphism group is commutative. The original a supplies the actual x transition equation. Native DescentData.isoMk supplies the inverse equation by its existing cancellation proof.

For a covering R of a prestack, the existing fully faithful canonical descent functor lifts that isomorphism to an actual Aut(y). Every local restriction recovers its prescribed conjugate, and faithfulness proves uniqueness. Replacing the e_i on this same R has no effect. The construction is a native group homomorphism, with exact identity, multiplication and inverse laws. A global x-to-y isomorphism gives precisely the existing Mathlib conjugation; when x=y the resulting map is the identity for arbitrary local choices.

This is a local-conjugation supplier for the existing evaluation-surjectivity route. It does NOT prove independence under changing/refining R or compatibility under arbitrary further base restriction. Next choose the local-isomorphism covers supplied by IsGerbe, prove independence on common refinements and the pullback law retaining native mapComp constraints, then form the actual compatible centre units over every V→U and prove evaluation surjectivity. Continue the chosen-band inverse and actual SF1 descended-slice comparison after that. The existing prestack centre-sheaf proof is retained and is not redone.

The two covering constructions require only native prestack morphism descent, given local isomorphisms and commutative inertia. They require no terminal object, fibre products, object effectivity, chosen coefficient sheaf or global neutrality. No generic stack, sheaf or descent carrier is redefined. Continue the connected/disconnected point-site groupoids, terminal-free restriction-chain site and nonneutral O(1) root-gerbe fixtures; none is claimed instantiated here. All wider source reading and open suppliers remain mandatory before stage/key closure.

### Reading and ownership receipt

Fresh full reading: all155 current statements/hypotheses, the303-line incoming handoff, all eight reviewed audit rows, accepted RS27 nine scoped decisions and the relevant R09.4 owner/link records, the gerbe reserved contract and nine confirmed finding records. Fresh pinned native reading covers Aut multiplication/conjugation, Functor.mapAut, native DescentData/isoMk/ofObj/toDescentData and their transition equations, prestack full faithfulness, FullyFaithful.preimageIso/map_preimage/map_injective, and the Hom presheaf/pullHom interface. Native searches find no IsGerbe, IntrinsicBandSection, AbelianBanding or GerbeAutTransport declaration in pinned TauCeti, and no choice-independence or functorial-conjugation theorem alongside Mathlib's existing autMulEquivOfIso definition. These searches are scoped absence checks, not assertions about every library notion.

The entire printed Stacks Lemma8.11.8 statement/proof at https://stacks.math.columbia.edu/tag/0CJY was freshly read, including the empty-fibre construction and explicitly omitted varying-base conclusion. HTML SHA25641dd0c0a1e20dfe2fd60212274a30f259ae0875225b1540b069adf3f89f27a9e; accessed2026-10-02. The native overlap/descent adapter is derived from its local-conjugation argument. No new whole-paper read is claimed. Prior paper receipts retain their original authors/readings.

RS27 keeps ordinary stacks/descent at D0 and spaces/sites/diagonals/atlases at SF1; specialized generalized-elliptic and PEL applications remain downstream. The confirmed finding handling is unchanged: algebraicgeometry/1 imports SF1/D0; /2 retains approximation/G-ring/Popescu suppliers without a backwards Artin cycle; /10 imports anchor descent; /11 imports affine Weil restriction; /12 imports Proj/Grassmannian anchors; /14 keeps non-Noetherian/Tor-amplitude extensions; /17 imports StableReductionPartII:key/moduli-curves; /18 and etale/25 import the SF coherent-duality reserved key. There is no new stage edge or ownership change.

### Native and submitted compilation boundaries

The full suggested file is uncompiled because the exact pinned TauCeti cohomology import has no available existing compiled artifact. No library build, Lake-project setup, cache download or language server was used. A single existing-build Lean process ran at a time with a1200-second timeout, after free-memory checks of at least61GiB, exceeding WORKERS'20GiB floor.

The actual proof is archived in the suggested deliverable at immutable commit57332e8119e7f8e152f41484583d1291bfc2f92d, between BEGIN/END ARCHIVED CHECKED GERBE CONJUGATE DESCENT. This complete standalone342-line source uses only two Mathlib imports and the native carriers; no earlier proof archive or admitted intrinsic-band prototype is a dependency. Eleven examples and19 kernel audits pass with zero errors or warnings. Every audit has only propext, Classical.choice and Quot.sound, with no admission dependency. Source SHA2569af35ace261858f92b9980584627d8803adf5c06281a64948e3ed7b52e1227ac; normalized output SHA2569ee57dbbc75193069c8a87aaeb1e01d8b55b52769aa0cd3f5325d19eb5f1cca3. Elapsed2.00s, RSS2051672KiB, available memory63GiB.

The final canonical new bodies are all admissions as PROTOCOL§13 requires; all implementationStatus fields stay unchecked. The admitted Mathlib extraction has1363 lines and53 examples: zero errors,91 admission warnings, no other warnings. Source SHA25678a1c04f52ef3274ce1b068753e2f122a66420350aad7cc7ff713643d25ffaa9; normalized output SHA256d409dd1dab9ba1af7a182d3bab9fd7d83c105d38877d02944e7cc2b9924b4fca. Elapsed6.10s, RSS3306732KiB, available memory61GiB. This extraction does not certify inherited TauCeti module/cohomology blocks or the whole file. The19 new canonical headers match the actual native archive; the inherited pointwise banding_iso_independent header is also audited in its native form.

The archive remains an ancestor of the submitted commit. Read it with git show from the shared clone. The following function returns the two exact strings for own-scratch files; it copies no repository snapshot and edits no atlas or shared file. Materialize them in your own disk scratch, then run one existing-build lake env lean process per file. Normalize output by removing only the scratch-path prefix and resource-timing tail.

```python
import subprocess
def reconstruct(repo,submitted):
    path="research/blueprint/suggested/AlgebraicModuliForArithmeticGeometry--A0-extension.lean"
    archived=subprocess.check_output(["git","show","57332e8119e7f8e152f41484583d1291bfc2f92d:"+path],cwd=repo,text=True)
    native=archived.split("BEGIN ARCHIVED CHECKED GERBE CONJUGATE DESCENT\n",1)[1].split("END ARCHIVED CHECKED GERBE CONJUGATE DESCENT",1)[0]
    imports="\n".join(l for l in submitted.splitlines() if l.startswith("import Mathlib"))
    prefix=submitted[submitted.index("open CategoryTheory Opposite Bicategory"):submitted.index("variable {A : Sheaf")]
    marker="namespace TauCeti.AlgebraicGeometry\n\nopen CategoryTheory Opposite Bicategory\n\nvariable {C"
    central=submitted[submitted.index(marker,submitted.index("/-! Intrinsic-band continuation")):]
    sketch=imports+"\n"+prefix+"\nend TauCeti.AlgebraicGeometry\n"+central
    return native,sketch
```

### Actual atlas and preservation receipt

Publication preflight uses immutable main44c8eda3f52da4d734be74ccac5a73f15dc58a94. All fourteen targeted rule/audit/owner/roadmap/deliverable/checker inputs are unchanged from the mathematical base; concurrent changes in other roadmaps are retained in this branch and the actual assembler. The indexed packet checker has zero errors/warnings. Actual intake, four-deliverable, JSON, private-path and whitespace checks pass. The actual build.assemble overlay retains every other promoted part, comparing this candidate with the incoming155-node packet. Own pending/skipped links are empty, other roadmap skips and all stage edges are unchanged, and all24 scope/supplier stage paths are reachable. The own declaration DAG is163 vertices/319 edges; endpoint-complete stage DAG3017/8655; stage-plus166 reachable declarations graph3173/9204. All are acyclic. Three reached external declarations are existing D0 suppliers. No synthetic stage attachment or application/atlas file was written.

The following read-only script reproduces the assembler and preservation checks from the stated base and candidate. Its SHA256204f1cff78a0c208ce634b8a7cf6819f1bdbc3658906c9ff5a9fbbae892beeac. Counts include actual endpoint vertices, even when a stage endpoint is not a listed stage object.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque,Counter
root=Path.cwd();sys.path.insert(0,str(root/'scripts'));import build
rid='AlgebraicModuliForArithmeticGeometry';stem=rid+'--A0-extension'
packetpath='research/blueprint/packets/'+stem+'.json'
base='44c8eda3f52da4d734be74ccac5a73f15dc58a94'
p=json.loads((root/packetpath).read_text())
old=json.loads(subprocess.check_output(['git','show',base+':'+packetpath],text=True))
r=json.loads((root/('research/blueprint/atlas/roadmaps/'+rid+'.json')).read_text())
load=build.load_promoted
def assemble(packet):
    def overlay(*a,**k):
        ps,ds,defs=load(*a,**k)
        return ([(n,v) for n,v in ps if n!=stem]+[(stem,packet)],
            {**ds,stem:'research/blueprint/readmes/'+stem+'.md'},defs)
    build.load_promoted=overlay
    return build.assemble(require_distances=False)[0]
a=assemble(p);control=assemble(old)
def dag(vertices,edges):
    edges=set(edges);vertices=set(vertices)|{x for e in edges for x in e}
    following=defaultdict(set);indegree=dict.fromkeys(vertices,0)
    for s,t in edges:following[s].add(t);indegree[t]+=1
    q=deque(v for v in vertices if not indegree[v]);seen=[]
    while q:
        v=q.popleft();seen.append(v)
        for w in following[v]:
            indegree[w]-=1
            if not indegree[w]:q.append(w)
    assert len(seen)==len(vertices),('cycle',sorted(v for v in vertices if indegree[v])[:10])
    return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
se={(e['source'],e['target']) for e in a['stageEdges']}
ce={(e['source'],e['target']) for e in control['stageEdges']}
assert se==ce
stageids={s['id'] for s in a['stages']}
own={n['id']:n for n in p['nodes']}
oe={(dep,n['id']) for n in own.values() for dep in n.get('prerequisites',[]) if dep in own}
stageDAG=dag(stageids,se);ownDAG=dag(own,oe)
allnodes=dict(own)
for folder in ('data/decompositions','data/blueprints','research/blueprint/packets'):
    for path in sorted((root/folder).glob('*.json')):
        for n in json.loads(path.read_text()).get('nodes',[]):allnodes.setdefault(n['id'],n)
used=set(own);todo=list(own)
while todo:
    v=todo.pop()
    for d in allnodes[v].get('prerequisites',[]):
        if d in allnodes and d not in used:used.add(d);todo.append(d)
edges=set(se)
for v in used:
    n=allnodes[v];parent=n.get('parentStageId')
    if parent:edges.add((parent,v))
    for d in n.get('prerequisites',[]):
        if d in stageids or d in used:edges.add((d,v))
for request in p['requests']:
    for v in request['neededBy']:edges.add((request['supplier'],v))
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
    for d in n.get('prerequisites',[]):
        if d in stageids and d not in allnodes and d!=stage_of(n['id']):pairs.add((d,stage_of(n['id'])))
for req in p['requests']:
    for v in req['neededBy']:
        source=stage_of(req['supplier']);target=stage_of(v)
        if source!=target:pairs.add((source,target))
missing=[(s,t) for s,t in sorted(pairs) if not reachable(s,t)]
assert not missing,missing
ar={r['id']:r for r in a['roadmaps']};cr={r['id']:r for r in control['roadmaps']}
assert ar[rid]['blueprint']['declarations']==cr[rid]['blueprint']['declarations']+8
assert ar[rid]['blueprint']['planets']==cr[rid]['blueprint']['planets']
assert ar[rid]['blueprint']['skippedLinks']==cr[rid]['blueprint']['skippedLinks']
assert not ar[rid]['blueprint'].get('pendingLinks')
assert all(ar[x].get('blueprint',{}).get('skippedLinks')==cr[x].get('blueprint',{}).get('skippedLinks') for x in cr)
for key in ('sourceIssues','requests','routedItems','keyDefinitions','routedItemAudit','baseline','coverage','gaps'):
    assert p[key]==old[key],key
on={n['id']:n for n in old['nodes']}
for id,n in on.items():
    for key in ('id','kind','statement','hypotheses','sources','implementationStatus','uses'):
        assert own[id].get(key)==n.get(key),(id,key)
    assert all(t in own[id].get('tests',[]) for t in n.get('tests',[]))
    assert all(x in own[id].get('api',[]) for x in n.get('api',[]))
    assert all(x in own[id].get('acceptance',[]) for x in n.get('acceptance',[]))
assert sum(own[id]==n for id,n in on.items())==153
assert len(own)==163
assert all(n['implementationStatus']=='unchecked' for n in own.values())
lean=(root/('research/blueprint/suggested/'+stem+'.lean')).read_text()
for node in p['nodes'][len(old['nodes']):]:
    assert node['declarationName'].split('.')[-1] in lean
    for test in node.get('tests',[]):assert test['name'] in lean,test['name']
    for api in node.get('api',[]):assert api['name'].split('.')[-1] in lean,api['name']
allowed={packetpath,'research/blueprint/readmes/'+stem+'.md','research/blueprint/suggested/'+stem+'.lean','research/blueprint/handoff/BP-'+stem+'.md'}
changed=set(subprocess.check_output(['git','diff','--name-only',base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
    assert not re.search(r'/(?:home|tmp|Users)/|file'+'://',(root/path).read_text()),path
result={'actualAssembler':True,'base':base,'declarations':ar[rid]['blueprint']['declarations'],'ownDeclarations':len(own),
    'kinds':dict(Counter(n['kind'] for n in own.values())),
    'apiTotal':sum(len(n.get('api',[])) for n in own.values()),'testsTotal':sum(len(n.get('tests',[])) for n in own.values()),
    'baseline':len(p['baseline']['declarations']),'planets':ar[rid]['blueprint']['planets'],'gaps':len(p['gaps']),'requests':len(p['requests']),
    'ownSkippedLinks':ar[rid]['blueprint']['skippedLinks'],'ownPendingLinks':ar[rid]['blueprint'].get('pendingLinks',[]),
    'stageDAG':stageDAG,'ownDeclarationDAG':ownDAG,'stagesAndReachableDeclarations':combined,
    'reachableDeclarations':len(used),'externalDeclarations':sorted(used-set(own)),
    'requiredStagePairs':len(pairs),'requiredStagePairsReachable':len(pairs)-len(missing),'stageEdgesUnchanged':True,
    'otherSkipsMatchOriginal':True,'unchangedNodeObjects':153,'preservedStatements':155,'addedNodes':8,
    'scriptSha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
print(json.dumps(result,indent=2))
```
