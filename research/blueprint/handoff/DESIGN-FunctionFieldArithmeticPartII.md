# FunctionFieldArithmeticPartII — native unit-chart comparison checkpoint

Worker: Codex — codex-J6LwjP. Date:2026-10-02. Issue3403, claim5959902725, confirming bot5959905269. The whole issue was reread after confirmation. Branch codex-J6LwjP-blueprint-function-laurent; based173a3ec2a7f0b18f3d2eeabdb3755f15bf56dfb.

This continuation specifies the native unit-chart comparison equivalence and its inverse on every character/right-factor tensor. It adds six nodes (one construction and five lemmas), four API entries and five unit tests. The packet has149 unchecked nodes (9 definitions,25 constructions,69 lemmas,35 theorems,10 comparisons,1 application),111 required API entries and113 required definition/construction tests,117 total test records,39 planets and107 baseline declarations. All ten stages remain partial, with eight gaps and thirteen supplier requests. The whole Tau Ceti suggested file is uncompiled; no geometric or implementation closure is claimed.

## Native calculation and preservation

For a commutative ring A, a specified unit v and positive n, keep B=A[x]/(xⁿ−v), H=A[Multiplicative(ZMod n)] and the actual coaction-induced comparison Θ:B⊗B→H⊗B. The preceding weighted-table proof establishes its bijectivity. Import Mathlib’s promotion of this actual algebra homomorphism to obtain the specified E_v. This is not an arbitrary replacement equivalence or matrix.

The native quotient root satisfies x(v⁻¹x^(n−1))=1, including n=1 and the zero ring. Evaluating Θ on x⊗(v⁻¹x^(n−1)) gives e_1⊗1, so the native inverse-evaluation law proves that exact preimage. The right factor remains1⊗b. Character powers and multiplicativity give E_v⁻¹(e_i⊗b)=x^i⊗((v⁻¹x^(n−1))^i b) for every natural i, including i≥n. No inverse of n, representative choice, reducedness or domain assumption occurs. The existing existential unit-inverse statement is unchanged and follows from these specified maps. Its proof prerequisites now use the native bijectivity result and these evaluation lemmas.

All143 inherited IDs and mathematical statements are preserved;142 whole node objects are unchanged. The only inherited node change is the unit-inverse proof/prerequisite/acceptance record. Both paper routes (28 Yun–Zhang and38 Abdurrahman–Venkatesh items), reserved root-stack key, moduli-curve import, source versions/issues/coverage, sibling ownership,39 planets and all gaps/requests/restructure records are unchanged. The roadmap definition is byte-for-byte unchanged. Generic algebra equivalences, tensor products and the singleton function equivalence are imported rather than replanned.

All four previously admitted direct examples now have actual proofs in the separate native extraction: over any field the branch tensor x⊗x is nonzero and killed by Θ; over F₂ at n=2,v=1 the comparison is bijective while x−1 is nonzero with square zero; the injective comparison at f=2 over Z becomes noninjective at f=0 over F₂; and over Z/8,f=4,n=2 the actual module cokernel is equivalent to A/(4) and contains z with2z≠0,4z=0. The last example uses the Unique lower-coordinate index and the previously checked actual cokernel map. It retains the full quotient ring, not its reduction. The earlier nonzero nilpotent parameter example is also retained.

Five new tests check the exponent-one inverse character, the wild F₂ inverse x⊗x, the inverse coefficient3 for v=2 over F₅, the zero ring, and the unchanged right factor. The general determinant and field-rank statements remain the only two admitted assertions in the actual proof extraction. They are not claimed proved.

## Reading and baseline receipts

The preceding handoff was read in full at the [immutable base](https://github.com/CBirkbeck/tauceti-explorer/blob/d173a3ec2a7f0b18f3d2eeabdb3755f15bf56dfb/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md). All eight reviewed parent FA.0–FA.7 audit rows were read with target/evidence/duplication records, and the REV-AUDIT-20 report was read. There is no PartII row. The ten own stage descriptions and the reserved root-stack contract were reread. The unit comparison, quotient/coaction and module-coordinate mathematical boundaries were checked against their actual signatures and proof extraction. Broader inherited node/source collations retain the prior workers’ receipts; this continuation does not claim a fresh whole-paper, whole-packet or whole-library audit. Nearby JacobianChallenge and StableReduction upstream documents were read in the continuous worker session. The link-packet entry screen found no entry mentioning this PartII.

Fresh primary reading: [Stacks Tag040N](https://stacks.math.columbia.edu/tag/040N), complete Lemma59.28.3 statement and proof, including the unit-parameter finite-free cover and syntomic/fppf distinction. Our exponent remains positive. The source motivates the unit chart; it does not literally state the coordinate inverse formula. TV17 §3.1 and broader YZ19/AV/B24 reading retain predecessor attribution, as do source findings, version collation and57,628 arithmetic checks. No source erratum or successful fresh PDF image reading is claimed.

Six new baseline statements were read at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 with their ambient hypotheses: AlgEquiv.ofBijective, toAlgHom_ofBijective, ofBijective_apply and symm_apply_eq (Algebra/Algebra/Equiv); Algebra.TensorProduct.tmul_mul_tmul (RingTheory/TensorProduct/Basic); LinearEquiv.funUnique (LinearAlgebra/Pi, used only in the inherited cokernel example). Exact source lines/hashes are in the packet. Existing tensor-power, module-subsingleton and character-generator statements were reread; TauCeti.RootsOfUnityGroup.generator is exactly Multiplicative.ofAdd1. No new general absence assertion is made.

## Proof and proposed-signature checks

Actual new bodies and examples are archived in the allowed suggested-file history at [9a0db34b993b8f180dc07f570121d63c9f0f5927](https://github.com/CBirkbeck/tauceti-explorer/blob/9a0db34b993b8f180dc07f570121d63c9f0f5927/research/blueprint/suggested/FunctionFieldArithmeticPartII.lean). That intermediate full file retains inherited admissions, so it is not itself a proof of all old inputs. The checked reconstruction below combines its new block and four example proofs with the actual native predecessor coaction/weighted-coordinate/module proofs at7660b60d3ed205f650aeefe6b1e46996ec36ff09 and6a5d51f50e6e1ca391411bee278a025fee3cbc4f. The PR head restores admissions under PROTOCOL13.

Actual proof extraction: 1403 lines,37 examples,0 errors,2 admitted-body warnings (determinant and field ranks),0 other warnings. All37 examples have actual bodies. Twenty-two printed native declaration axiom lists, including all seven unit-branch declarations and the earlier fifteen module-coordinate declarations, contain no admission axiom; their only axioms are subsets of propext, Classical.choice and Quot.sound. Available memory65 GiB; time8.90 seconds, maximum RSS3185656 KiB.

Distinct final proposed native extraction: 720 lines,37 examples,0 errors,100 admitted-body warnings,0 other warnings. Available memory65 GiB; time3.30 seconds, maximum RSS3106648 KiB. Both used one direct Lean4.34.0-rc2 compiler process at a time in an existing build at the exact Mathlib pin, with a20-minute timeout. No project, build, cache download or language server was started and no compiler process remains.

Exact-pin compiled Tau Ceti line-bundle tensor-product and roots-of-unity modules are absent in that build, so the complete Tau Ceti suggested file is uncompiled. The extraction expands only the native character generator to its exact pinned definition and excludes geometric and uncompiled Tau Ceti branches. It does not certify those omitted signatures, suppliers or stack carriers.

Content/normalized diagnostic SHA256:

- Actual public intermediate: 7b4e7edb3762832f2c994dd3dd9fa1a1771f5d7f509c0b5112135d3b4e492291
- Final proposed suggested file: 69629c71df06f4642a5aa54ddb2f5043b263d389b3e3cff6014dd21ccae3b6c6
- Actual proof extraction: cbcb10fdb874bea25e1406f68daaa3fa011536b6126a631d47b5854f93580ee5
- Actual proof diagnostics: 4400551c5460406f55fc05ef0e938840909f22936791865571dc14e0c07525e5
- Proposed native extraction: e9a695135b168f1c252b7eb3d0bea7fc142087ac7e48a0350f20aa18a2b00537
- Proposed diagnostics: 06c9c2b7d20b0d377cedc2656380015e424b0f3f322148cef0aebe945fca3c6f

Diagnostic normalization replaces the absolute invocation source path with UnitProof.lean or Submitted.lean and excludes the separate time trailer. These hashes were produced from the actual checks. Both public reconstruction outputs were byte-exact verified.

## Validation and projection

The indexed packet checker reports0 errors/0 warnings. The normal read-only assembler overlay retains the new-roadmap definition and packet. The stage graph has3,056 vertices including51 inherited virtual endpoints and8,723 edges; own149 declarations/315 edges; combined stage and200 reachable declarations/ supplier-request dependencies has3,217 vertices/9,399 edges. All are acyclic, external prerequisites resolve, and all54 required stage pairs remain reachable. Stage edges, own empty skipped links and unrelated skipped lists match the control. The attached projection recipe also checks statement/key/source/route/gap preservation and the six new baseline entries. No atlas/application files were written.

## Reproduce native checks

Run this Python from a checkout containing the three immutable proof commits and the final proposed suggested file. It verifies exact hashes before writing own scratch files. Require an already compiled Mathlib build at the exact pin and at least20 GiB available. Run one direct compiler process at a time with a20-minute timeout; do not set up a project, obtain caches, build libraries or start an LSP. No absolute private paths are part of this recipe.

```python
from pathlib import Path
import subprocess, json, hashlib
sc=Path('scratch-unit-comparison');sc.mkdir(exist_ok=True)
sourcepath='research/blueprint/suggested/FunctionFieldArithmeticPartII.lean'
def extract(s):
 imports='\n'.join(l for l in s.splitlines() if l.startswith('import Mathlib'))
 initial=s[s.index('abbrev AffineRing (f : A)'):s.index('-- TauCeti.RootStack.affineCoaction.nativePoint')]
 one=s[s.index('-- TauCeti.RootStack.affineCoaction.test_one'):s.index('-- TauCeti.RootStack.affineCoaction.test_sign')]
 comparison=s[s.index('section AffineTorsorComparison'):s.index('-- Native acceptance computations')]
 extra=s[s.index('-- Native acceptance computations'):]
 fragment=imports+'\nnoncomputable section\nuniverse u\nnamespace TauCeti.RootStack\nvariable {A : Type u} [CommRing A]\nopen scoped TensorProduct\n'+initial+one+comparison+extra
 return fragment.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
oldsource=subprocess.check_output(['git','show','7660b60d3ed205f650aeefe6b1e46996ec36ff09:'+sourcepath],text=True)
old=extract(oldsource)
assert hashlib.sha256(old.encode()).hexdigest()=='4ab15358f6cc7033abe508a1e3114b7a602a922ec2510c1f13fac4d9cac3a5bb'
s=subprocess.check_output(['git','show','6a5d51f50e6e1ca391411bee278a025fee3cbc4f:'+sourcepath],text=True)
assert hashlib.sha256(s.encode()).hexdigest()=='e2f09db25c35ff1ff9ad70b31c10cf3e00c6b68c6d5e8aaa70b67879dc76e5e3'
a=old.index('/-- Native kernel, indexed');b=old.index('theorem affineTorsorComparison.injective_iff',a)
block=s[s.index('/-- Kernel coefficients of an actual tensor'):s.index('theorem affineTorsorComparison.injective_iff')]
proof='import Mathlib.LinearAlgebra.Isomorphisms\n'+old[:a]+block+old[b:]
tests=s[s.index('/-! Module quotient acceptance computations.'):s.index('-- Native acceptance computations')]
a=proof.index('-- Native acceptance computations');proof=proof[:a]+tests+proof[a:]
axioms=['kernel_coordinate_condition','kernelCoordinateEquiv','kernelCoordinateEquiv_apply','kernelCoordinateEquiv_symm_coordinates','kernelCoordinateEquiv_nonwrap','kernel_equiv','cokernelResidue','cokernelResidue_apply','cokernelResidue_surjective','cokernelResidue_ker','cokernelCoordinateEquiv','cokernelCoordinateEquiv_mk','cokernelCoordinateEquiv_symm_residue','cokernelCoordinateEquiv_eq_iff','cokernel_equiv']
proof+='\n'+'\n'.join('#print axioms TauCeti.RootStack.affineTorsorComparison.'+a for a in axioms)+'\n'
assert hashlib.sha256(proof.encode()).hexdigest()=='864b5778b1c17965e1ef5832357735e5af38165f4230de7252cb1a4da3e4dc77'
public=subprocess.check_output(['git','show','9a0db34b993b8f180dc07f570121d63c9f0f5927:'+sourcepath],text=True)
assert hashlib.sha256(public.encode()).hexdigest()=='7b4e7edb3762832f2c994dd3dd9fa1a1771f5d7f509c0b5112135d3b4e492291'
block=public[public.index('/-- The inverse of the root'):public.index('/-- The algebra equivalence is fixed')]
a=proof.index('/-- The algebra equivalence is fixed');proof=proof[:a]+block+proof[a:]
a=proof.index('theorem affineTorsorComparison.unit_inverse');b=proof.index('/-- Determinant',a)
x=public.index('theorem affineTorsorComparison.unit_inverse');y=public.index('/-- Determinant',x)
proof=proof[:a]+public[x:y]+proof[b:]
for name in ['test_branch_kernel','test_wild_unit','test_nonflat_kernel','test_cokernel_nonreduced']:
 marker='-- affineTorsorComparison.'+name
 a=proof.index(marker);x=public.index(marker)
 if name=='test_cokernel_nonreduced':
  b=proof.index('end AffineTorsorComparison',a);y=public.index('end AffineTorsorComparison',x)
 else:
  b=proof.index('-- affineTorsorComparison.',a+len(marker));y=public.index('-- affineTorsorComparison.',x+len(marker))
 proof=proof[:a]+public[x:y]+proof[b:]
proof+='\n'+public[public.index('/-! Unit chart acceptance computations.'):]
proof+='\n#print axioms TauCeti.RootStack.affineRoot.unit_mul_inverse\n'
proof+=''.join('#print axioms TauCeti.RootStack.affineTorsorComparison.'+x+'\n' for x in ['unitEquiv','unitEquiv_toAlgHom','unitEquiv_symm_character','unitEquiv_symm_right','unitEquiv_symm_character_tmul','unit_inverse'])
proof=proof.replace('TauCeti.RootsOfUnityGroup.generator n','Multiplicative.ofAdd (1 : ZMod n)')
assert hashlib.sha256(proof.encode()).hexdigest()=='cbcb10fdb874bea25e1406f68daaa3fa011536b6126a631d47b5854f93580ee5'
(sc/'UnitProof.lean').write_text(proof)
sketch=extract(Path(sourcepath).read_text())
assert hashlib.sha256(sketch.encode()).hexdigest()=='e9a695135b168f1c252b7eb3d0bea7fc142087ac7e48a0350f20aa18a2b00537'
(sc/'Submitted.lean').write_text(sketch)
print('Byte-exact proof and submitted native fragments reconstructed.')
```

The proof and proposed-signature files have distinct claims. Delete own scratch after submission.

## Reproduce graph and preservation checks

The normal assembler is used read-only; this script writes no atlas files. Script SHA2562b531f9fe312a37bbe2f715fe72fa64c8077ea6da3deeb1787cf4638d885fbb2.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="FunctionFieldArithmeticPartII"
stem=rid
packetpath="research/blueprint/packets/"+stem+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="d173a3ec2a7f0b18f3d2eeabdb3755f15bf56dfb"
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
assert ar[rid]["blueprint"]["declarations"]==cr[rid]["blueprint"]["declarations"]+6
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
assert p["baseline"]["declarations"][:101]==old["baseline"]["declarations"]
assert len(p["baseline"]["declarations"])==107
assert r==oldr
unchanged=sum(own[id]==n for id,n in on.items())
assert unchanged==142
assert len(own)==149
assert all(n["implementationStatus"]=="unchecked" for n in own.values())
lean=(root/("research/blueprint/suggested/"+stem+".lean")).read_text()
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

1. Reconstruct the actual proof rather than taking admitted PR-head bodies as proof inputs. The unit inverse and all direct examples are checked there.
2. Complete determinant sign by cyclic row translations/permutation signs and the number of wrapping entries; then general field ranks. Preserve n=1, the zero ring and arbitrary characteristic.
3. Continue native geometric root-stack carriers, tensor-section/unit coordinates, finite charts, coherent infinite fpqc towers and class-field theory through the existing suppliers. JAC-A, ST-LISSE/ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING remain open. Preserve full nilpotent closed charts, unit-normalized coframes, both paper routes and source corrections. No stage is closed.

Opening the checkpoint PR ends this claim. Continue the next available issue in WORKERS order; never unclaim submitted work or independently review/red-team own contributions.
