# DESIGN-HodgeStructuresPartII — source augmentation generator checkpoint

Codex — codex-rtOQ9t. Refs #3371. Branch codex-rtOQ9t/hodge-partii-third-continuation; base bd1f62cf742db0535c6427ef929da93c4becc4b0. Claim comment 5956728121, bot confirmation 5956730802; full issue read before and after confirmation. This remains a partial research checkpoint.

The immediate predecessor's complete handoff is retained at [base commit](https://github.com/CBirkbeck/tauceti-explorer/blob/bd1f62cf742db0535c6427ef929da93c4becc4b0/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md). Its paper proof and finite script were read completely. Historical affine proof bodies remain at [immutable 9a36f4d](https://github.com/CBirkbeck/tauceti-explorer/blob/9a36f4d1d6743c0202f12020c0df603400149faa/research/blueprint/suggested/HodgeStructuresPartII.lean), source SHA-256 af7d537a0dc75975f2081fbd6b143a70b7d63a81b92e032511fd9a20d0ae4b83. Historical receipts apply to their immutable versions.

## Changes

One Higgs-specific lemma, H.0/augmentation-power-generators, equates I^N in the source symmetric algebra with the span of length-N degree-one words for every N≥0. Import the already built Tau Ceti augmentation generator equality and HopfIdeal.augmentation_toIdeal, then SymmetricAlgebra.counitAlgHom_eq. The built Submodule.span_pow and Set.mem_pow supply the generic span/word calculation; the predecessor's proposed private induction should not become another generic roadmap node.

The existing augmentation_pow_iff_words statement and hypotheses are unchanged. Its outline now uses that adapter and Ideal.span_le. Source S is commutative; End(E) is an associative target. At N=0, I⁰=S and the empty word is identity, so annihilation means E is the zero module. Two lemma tests record the zero and one boundaries.

The new E12/E21 regression has the rank-one action u↦X with I²⊆ker α, while YX=E22 is a nonzero idempotent in the ambient left ideal span{X}. That ambient ideal has no vanishing power. Keep the ideal and action kernel in S. This guards a possible implementation mistake; no packet or source erratum is claimed.

PROTOCOL §13 requires admitted suggested bodies. The fifteen previously proved affine bodies and ten proved examples are restored to that format without changing their signatures; actual proofs and receipts remain at the immutable commit above. Concrete input fixtures remain honest formulas. Admissions are not proof claims.

71 unchecked nodes, 112 APIs, 101 required definition/construction tests plus two lemma tests, six planets, 74 baseline references, eleven gaps and five requests. H.0 partial; H.1–H.8 not_read. All 70 prior statements/hypotheses/APIs/source/acceptance records, 100 prior tests, 149 routes, requests, gaps, source issues and restructuring survive. Two inherited node objects change; 68 remain identical.

## Fresh reading and limits

Read the entire issue, handoff and applicable worker/protocol/source-faithfulness instructions. Reviewed Hodge L0–L3 and E1/D3 rows fully read after repairing truncated reads; REV-AUDIT02/10/22 metadata inspected. Built parent carriers are imported. E1/CR.1/DD.1 and D3 ownership boundaries remain explicit.

At exact source pins read complete named statements for the augmentation ideal/span/kernel bridge, symmetric counit, span powers, set powers as words, Ideal.span_le and Matrix.toLin'. The new lemma specializes built facts; no generic augmentation or span-power object is added.

Fresh [Heuer25](https://link.springer.com/article/10.1007/s00222-025-01321-4) reading: Definition 1.2(2), complete Definition 4.1 and Remark 4.2. Fresh [Liu–Zhu v3](https://arxiv.org/pdf/1602.06282v3) reading: complete Lemma 2.15 and its short proof, printed pp.18–19. No full correspondence proof, spectral/coherent-image/twisting consumer or later-source closure is claimed.

## Verification and reproduction

Current entire Mathlib-only sketch: Lean v4.34.0-rc2, Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, 0 errors, 156 admitted warnings only, 62 examples. Existing exact artifacts reused, at least 70 GB available before checks, one Lean process. No Lake setup/update/cache, library build or language server. No matching Tau Ceti compiled import set certified or created; its pinned primary source was read, not imported.

The separate experiment proves the generic word span and kernel criterion from an explicit supplied ideal-generation equality. That equality is local to this experiment and is not an extra public hypothesis. Both declarations check with no errors/warnings; both axiom audits contain only propext, Classical.choice and Quot.sound. This is not a compiled proof of the canonical Tau Ceti augmentation bridge or of global sheaf statements.

The exact experiment text and its axiom commands are archived in the [first submitted version](https://github.com/CBirkbeck/tauceti-explorer/blob/b386baf/research/blueprint/handoff/DESIGN-HodgeStructuresPartII.md). Use the displayed source SHA-256 to identify it. Lean code is kept out of the current handoff under the issue’s file-format rule. An existing exact pinned Mathlib build and the worker memory/process restrictions still apply.


The predecessor's exact Python regression was freshly rerun: 88 commuting F₂ pairs, N=0,…,4, 440 cases, and all ambient-ideal, characteristic-two, Z/4 and noncommuting fixtures passed. Finite computations are not general proofs. Save the next block in your own scratch and run with Python 3.

```python
from itertools import product

def mat(n, m):
    return tuple((n >> i) & 1 for i in range(m*m))

def mul(A, B, modulus):
    n = int(len(A)**0.5)
    assert n*n == len(A) == len(B)
    return tuple(sum(A[n*i+k]*B[n*k+j] for k in range(n)) % modulus
                 for i in range(n) for j in range(n))

mats = [mat(i, 2) for i in range(16)]
idx = {A:i for i,A in enumerate(mats)}
mt = [[idx[mul(A,B,2)] for B in mats] for A in mats]

def span(S):
    ans={0}
    for v in S:
        ans |= {a ^ v for a in tuple(ans)}
    return ans

def ideal_product(I,J):
    return span(mt[a][b] for a in I for b in J)

identity = idx[(1,0,0,1)]
cases=pairs=0
for a,b in product(range(16), repeat=2):
    if mt[a][b] != mt[b][a]:
        continue
    pairs += 1
    # B is the commutative image algebra; do not form an ideal in all End(E).
    B=span([identity])
    while True:
        C=span(list(B)+[mt[g][x] for g in (a,b) for x in B])
        if C == B:
            break
        B=C
    J=span(mt[g][x] for g in (a,b) for x in B)
    power=B
    words={identity}
    for n in range(5):
        assert (power=={0}) == (words=={0}), (a,b,n,power,words)
        cases += 1
        power=ideal_product(J,power)
        words={mt[g][w] for g in (a,b) for w in words}
assert pairs == 88 and cases == 440

# The exact four-basis witnesses used in the suggested Lean file.
basis=list(product(range(2), repeat=2))
X=tuple(int(i[0]==1 and j[0]==0 and i[1]==j[1]) for i in basis for j in basis)
Y=tuple(int(i[1]==1 and j[1]==0 and i[0]==j[0]) for i in basis for j in basis)
Z=(0,)*16
I=tuple(int(i==j) for i in range(4) for j in range(4))
XX,YY,XY,YX=(mul(A,B,2) for A,B in [(X,X),(Y,Y),(X,Y),(Y,X)])
assert XX==YY==Z and XY==YX and XY!=Z
assert tuple((a+b)%2 for a,b in zip(XY,YX))==Z
for w in product([X,Y], repeat=3):
    value=I
    for A in w:
        value=mul(value,A,2)
    assert value==Z
# Ordered degree-two coefficients have nonzero mixed entries even though
# commutative projection adds the two entries and gives zero in characteristic 2.
assert (XX,XY,YX,YY) != (Z,Z,Z,Z)

# Rank-one nonreduced regression; a rank-one nilpotent need not have bound one.
assert 2 % 4 != 0 and (2*2) % 4 == 0
# E12 and E21 do not give an action of a commutative symmetric algebra.
assert mul((0,1,0,0),(0,0,1,0),2) != mul((0,0,1,0),(0,1,0,0),2)
# Generating an ideal in all End(E) destroys the nilpotence criterion.
X2,Y2=(0,1,0,0),(0,0,1,0)
E22=mul(Y2,X2,2)
assert mul(X2,X2,2)==(0,0,0,0)
assert E22!=(0,0,0,0) and mul(E22,E22,2)==E22
print('ambient End ideal counterexample: passed')
print('commuting pairs over F2:', pairs)
print('same-exponent tests N=0,...,4:', cases)
print('four-basis characteristic-two witness: all six assertions passed')
print('Z/4 rank-one and noncommuting-pair regressions: passed')
```

## Atlas, preservation and intake

Indexed packet checker: 0 errors/warnings. Actual read-only assembler with normal retirement/restructuring/link overlays and replaced-decomposition trimming: stage DAG 3,022 vertices/8,663 edges; own declaration DAG 71/138; stages plus 72 reachable declarations and supplier requests 3,088/8,916. All acyclic. All 21 computed stage prerequisite pairs reachable, no own skipped links, stage edges and other-roadmap skips identical to the unmodified packet overlay. The sole external declaration is ColemanPowerSeries:L1/derivation-determinant-unit. Five-file intake, private-path/whitespace checks and prior mathematical signature/test/metadata preservation pass.

Save the following read-only projection script in your own scratch and run from the repository with the named base commit available. It writes only its result next to itself; no site build.

```python
import json,sys,subprocess,hashlib,re
from pathlib import Path
from collections import defaultdict,deque
root=Path.cwd();sys.path.insert(0,str(root/"scripts"));import build
rid="HodgeStructuresPartII"
packetpath="research/blueprint/packets/"+rid+".json"
roadmappath="research/blueprint/roadmaps/"+rid+".json"
base="bd1f62cf742db0535c6427ef929da93c4becc4b0"
p=json.loads((root/packetpath).read_text());r=json.loads((root/roadmappath).read_text())
old=json.loads(subprocess.check_output(["git","show",base+":"+packetpath],text=True))
oldr=json.loads(subprocess.check_output(["git","show",base+":"+roadmappath],text=True))
load=build.load_promoted
def assemble(packet,definition):
 def overlay(*a,**k):
  ps,ds,defs=load(*a,**k)
  return ([(n,v) for n,v in ps if v.get("roadmapId")!=rid]+[(rid,packet)],
   {**ds,rid:"research/blueprint/readmes/"+rid+".md"},
   [x for x in defs if x.get("id")!=rid]+[definition])
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
assert not missing,missing
ar={x["id"]:x for x in a["roadmaps"]};cr={x["id"]:x for x in control["roadmaps"]}
assert ar[rid]["blueprint"]["declarations"]==71
assert ar[rid]["blueprint"]["planets"]==6
assert not ar[rid]["blueprint"]["skippedLinks"]
assert all(ar[x].get("blueprint",{}).get("skippedLinks")==cr[x].get("blueprint",{}).get("skippedLinks") for x in cr)
for key in ("requests","gaps","sources","sourceIssues","routeManifest","restructure","upstreamNotes"):
 assert p[key]==old[key],key
on={n["id"]:n for n in old["nodes"]}
for id,n in on.items():
 for key in ("id","kind","statement","hypotheses","api","acceptance","sources","implementationStatus","uses"):
  assert own[id].get(key)==n.get(key),(id,key)
 assert all(t in own[id].get("tests",[]) for t in n.get("tests",[]))
assert p["baseline"]["declarations"][:len(old["baseline"]["declarations"])]==old["baseline"]["declarations"]
unchanged=sum(own[id]==n for id,n in on.items())
lean=(root/"research/blueprint/suggested/HodgeStructuresPartII.lean").read_text()
for node in p["nodes"]:
 for test in node.get("tests",[]):assert test["name"] in lean,test["name"]
for node in p["nodes"]:
 for api in node.get("api",[]):assert api["name"].split(".")[-1] in lean,api["name"]
allowed={packetpath,roadmappath,"research/blueprint/readmes/"+rid+".md","research/blueprint/suggested/"+rid+".lean","research/blueprint/handoff/DESIGN-"+rid+".md"}
changed=set(subprocess.check_output(["git","diff","--name-only",base],text=True).splitlines())
assert changed<=allowed,changed
for path in changed:
 assert not re.search(r"/(?:home|tmp|Users)/|file"+"://",(root/path).read_text()),path
result={"actualAssembler":True,"declarations":71,"planets":6,"ownSkippedLinks":[],
 "stageDAG":stageDAG,"ownDeclarationDAG":ownDAG,"stagesAndReachableDeclarations":combined,
 "reachableDeclarations":len(used),"externalDeclarations":sorted(used-set(own)),
 "requiredStagePairsReachable":len(pairs),"stageEdgesUnchanged":True,
 "otherSkipsMatchOriginal":True,"unchangedNodeObjects":unchanged,
 "scriptSha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
Path(__file__).with_suffix(".json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
```

Exact SHA-256 receipts:

- Current native: e7c84108653b8d910a49fb6aebe50ca9880572f206b2e0348ba36e625665af4b
- native.log: 2c8ff8fa3cfb9ca4ba9deef0bc48a0fdb6436a483149be1da355a8281715482f
- words.lean: f992d8964bf0d0537ccd3650eaaafd5701de75631319a06160dc993c874956a2
- words.log: 302b28803b85c8f8c140865854ebec97f21481fe83a0c14664d2b13d0f879326
- finite.py: 1d51a023fbcd294545fde2255cebff86f5d47945083ba2f6585e82d96ce366c1
- projection.py: 171b894b6c4ab30417c9c1b19d49443332b8d3ca7bb84a19d245ded8914dfe74
- Heuer25.html: b3162f810c5064726cd951511bbdb036227e6c2a30b7b682cb4548cb13500fed
- LZ17-v3.pdf: 8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79

## Resume

1. Instantiate the canonical augmentation bridge when an existing exact Tau Ceti compiled import set is available. Do not set up or build one. Keep proof experiments distinct from admitted suggested bodies.
2. Supply E1 sheaf symmetric/endomorphism/augmentation quotient and ordered tensor-power interfaces; prove chart coefficient extraction and restriction/gluing. Local word calculations do not discharge global nilpotence.
3. Continue field/reduced-base rank bounds with genuine hypotheses; the Z/4 rank-one fixture rules out an unconditional rank shortcut.
4. Discharge CR.1 ordinary/exterior comparison, DD.1 finite Griffiths/Rees interfaces, global determinant/descent and the unbounded filtered-period/Tate adapter. Heuer spectral/coherent-image/twisting results stay with their p-adic consumer.
5. Read/decompose every remaining routed source definition and complete proof input before advancing H.1–H.8.

Own scratch is removed after the PR opens; all referenced reproduction code and receipts survive here or at immutable commits.
