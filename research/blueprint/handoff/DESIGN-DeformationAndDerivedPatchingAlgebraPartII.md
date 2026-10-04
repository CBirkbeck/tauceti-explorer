# Handoff: DESIGN-DeformationAndDerivedPatchingAlgebraPartII

Agent Codex; session codex-J6LwjP. Refs #3476. Claim comment 5983698924 was confirmed by the bot in comment 5983700238. This is a **partial checkpoint** with a resume list, not a complete planning pass or a closed blueprint. All fifteen accepted route items have target accounting across five layers; K1 is planned, and K0/K2/K3/K4 are partial. The packet remains below the node budget because source-proof and typed-interface work is unfinished.

67 nodes: 4 definition, 39 lemma, 4 comparison, 17 theorem, 2 construction, 1 application. 31 API items, 25 unit tests, 19 planets, 28 pinned baseline declarations, seven gaps and four supplier requests. No stage is closed. The checker reports zero errors and zero warnings.

The suggested file elaborated: exit 0, 47 warnings, all intentional theorem/example admissions; source SHA-256 5f5a47a72093a72377667cce0cf6a695bbabca62621e14ef540f658b5ec17e26. It has **30 typed node signatures and 22 typed examples**. The remaining **37 node signatures and three module-blowup tests are mathematical boundary text, not compiled signatures**. This mismatch with the completed-pass requirement is explicit unfinished work, not hidden by a proposition-valued stand-in. Eight module-blowup API items are among those untyped targets.

The separate native probe elaborated with no warnings: five actual definitions (annihilator product, CM-secant predicate, d-sequence predicate, prefix product, Rees module), three proved elementary computations and five axiom reports without any admission axiom. This checks real carriers and formulas. It does not prove the packet’s mathematical theorems or validate the admitted unit tests.

Canonical run: 38 GiB available, 1.7 seconds, peak RSS 2,888,960 KiB. Native run: 38 GiB available, 1.3 seconds, peak RSS 2,879,544 KiB. Each run was serial, one thread, 8 GiB limit, 20-minute timeout, using the existing Mathlib build at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2. No dependency build, Lake project, cache download or Lean server was started.

## Resume points

- DeformationAndDerivedPatchingAlgebraPartII:K0 (partial): Read Sche82 2.4.2/2.4.6 and Kaw00 2.6 / NTC95 2.4. Bind the R03.3 CM/secant and AS.1 duality comparisons to supplier definitions and elaborate their signatures.
- DeformationAndDerivedPatchingAlgebraPartII:K1 (planned): Split the two inductions of the Goto–Yamagishi intersection proof into separately typed leaves if their implementation exceeds the source-size bound; typed statements and corrected colon condition are present.
- DeformationAndDerivedPatchingAlgebraPartII:K2 (partial): Read and split the corrected Kaw00/Kaw02 induction; type auxiliary secant quantifiers and Proposition 3.11(i)–(iii) and robustness against the owner’s secant predicate.
- DeformationAndDerivedPatchingAlgebraPartII:K3 (partial): Bind module blowing-up, all eight API items and three tests to actual SR4/L5 carriers. Read HIO88 12.14; type the support and projective-prime-chain comparisons.
- DeformationAndDerivedPatchingAlgebraPartII:K4 (partial): Split (3.14.13),(3.14.15),(3.14.16), chart-depth and regular-element comparisons into the recorded proof leaves; type them and the final two theorems. Read HIO88 14.11 and provide an explicit CM ring/non-CM chart counterexample.

Read the packet gaps before refining. In particular, read Schenzel 2.4.2/2.4.6, Kaw00 2.6/2.9/2.10/3.1–3.3 with the A_ij–E_ij corrections and Kaw02 3.6, and HIO88 12.14/14.11. Type the geometric construction and proof leaves using the actual supplier interfaces. Preserve all existing node ids and all fifteen route entries. Bring every stage to planned before declaring a complete pass.

## Sources and boundaries

The full §3 of Česnavičius was read through the formula-preserving ar5iv conversion and checked against the accepted extraction/errata. The arXiv v2 PDF is the edition reference; the conversion’s generated August 2026 date is not an author revision. No Duke-version reading, unread primary-proof reading or full-source closure is claimed. The author’s publications page was consulted to locate Kaw00 and Kaw02; it supplies no Kaw00 PDF. Source URLs, hashes, edition and access date are in the packet. Reviewed corrections E4–E8 are inherited with their original finding ids retained.

The accepted route.reason corrects its brief: ordinary Noetherian-ring dualizing complexes belong to AnalyticStacks:AS.1, not R03.3. The currently visible supplier descriptions do not provide exact typed ordinary-ring packages; the four requests and seven gaps expose that limitation. R03.3 owns generic secant/depth/CM/local-cohomology/injective-hull inputs, SR Layer 4 owns scheme blowups/charts, and L5 owns module strict transforms. No generic carrier from those owners is replanned here.

Read the reviewed parent R03.3 audit (AUDIT-17); there is no audit row for this new Part II. Both pinned source trees were searched and the 28 cited native statements read. No integrated decomposition, expansion draft, external draft or matching link entry exists for the new id. Reserved ids were checked. JacobianChallenge and Multiquadratic upstream documents had been read in full earlier in this loop; StableReduction’s introduction and exact Layer 4 supplier description were read for this job.

## Actual assembly and reproducibility

The actual read-only atlas assembly, overlaying only this job’s roadmap definition and packet in memory, changes 2956 to 2980 stages and adds 29 stage edges. No edge is removed or skipped. The node DAG and the defined-stage DAG are acyclic. The 76 existing orphan edges remain unchanged; none is introduced by this job. No atlas snapshot, repository copy or generated site was written.

Recover the artifacts with recover.py using this handoff, a scratch output directory and the checkout as arguments. It authenticates four canonical deliverables, embedded artifacts and the accepted extraction at an immutable upstream commit. Run the recovered verify.py with the checkout and the pinned declaration index to replay the packet checker and actual assembly comparison. replay_lean.py accepts a source file, an existing pinned build root, a Lean binary and a scratch output directory. It checks memory and pins before a serial compile; it never builds dependencies. Native.lean is compressed to keep executable Lean source out of this handoff’s prose. All exact logs and receipts below are public; deleting job scratch loses no referenced evidence.

Only the five authorized deliverables change. All implementationStatus values remain unchecked. No implementation, source closure or independent review is claimed.

### artifact: recover.py

```python
"""Recover the handoff artifacts into a caller-selected scratch directory."""
from pathlib import Path
import sys,re,json,hashlib,gzip,base64,urllib.request
handoff=Path(sys.argv[1]);out=Path(sys.argv[2]);repo=Path(sys.argv[3]);out.mkdir(parents=True,exist_ok=True)
blocks={name:(body+'\n').encode() for name,body in re.findall(r'^### artifact: ([A-Za-z0-9_.-]+)\n\n```[^\n]*\n(.*?)\n```',handoff.read_text(),re.M|re.S)}
manifest=json.loads(blocks['Artifacts.json'])
for name,item in manifest.items():
 assert Path(name).name==name and Path(item['output']).name==item['output']
 raw=blocks[name]
 if item['encoding']=='gzip-base64':raw=gzip.decompress(base64.b64decode(raw))
 assert hashlib.sha256(raw).hexdigest()==item['sha256'],name
 (out/item['output']).write_bytes(raw)
proof=json.loads((out/'Inputs.json').read_text())
for item in proof['deliverables']:
 assert hashlib.sha256((repo/item['path']).read_bytes()).hexdigest()==item['sha256'],item['path']
item=proof['acceptedExtraction'];raw=urllib.request.urlopen(item['url'],timeout=30).read()
assert hashlib.sha256(raw).hexdigest()==item['sha256']
(out/'AcceptedExtraction.json').write_bytes(raw)
for name in ['lean','native']:
 receipt=json.loads((out/(name+'-report.json')).read_text())
 for suffix in ['stdout','stderr']:assert hashlib.sha256((out/(name+'.'+suffix)).read_bytes()).hexdigest()==receipt[suffix+'SHA256']
assert hashlib.sha256((out/'Native.lean').read_bytes()).hexdigest()==json.loads((out/'native-report.json').read_text())['sourceSHA256']
print('Recovered hash-checked helpers, exact native audit, compiler receipts/logs and immutable accepted extraction.')
```

### artifact: verify.py

```python
"""Read-only checker and actual atlas assembly, with only this job overlaid in memory."""
from pathlib import Path
import sys,json,subprocess,hashlib,graphlib,re
R=Path(sys.argv[1]).resolve();index=Path(sys.argv[2]).resolve();S=Path(__file__).resolve().parent
rid='DeformationAndDerivedPatchingAlgebraPartII';base=R/'research/blueprint';rel='research/blueprint/packets/'+rid+'.json'
p=json.loads((R/rel).read_text());definition=json.loads((base/'roadmaps'/f'{rid}.json').read_text())
ids={n['id']:n for n in p['nodes']};assert len(ids)==len(p['nodes'])
graphlib.TopologicalSorter({n['id']:{q for q in n['prerequisites'] if q in ids} for n in p['nodes']}).prepare()
assert len(p['targetInventory'])==15 and all(all(n in ids for n in t['nodes']) for t in p['targetInventory'])
check=subprocess.run([sys.executable,str(R/'scripts/check_blueprint.py'),str(R/rel),'--index',str(index),'--json'],capture_output=True,text=True)
assert check.returncode==0,check.stdout+check.stderr
checked=json.loads(check.stdout)
for row in checked:row['summary']['packet']=rel
lean=(base/'suggested'/f'{rid}.lean').read_text();compiled=lean.split('Supplier-dependent boundary register')[0]
typed={ 'TauCeti.Kawasaki.'+m for m in re.findall(r'^(?:noncomputable )?(?:def|lemma|theorem) (\w+)',compiled,re.M)}
for n in p['nodes']:
 assert n['id'] in (base/'readmes'/f'{rid}.md').read_text()
 assert n['leanName'].split('TauCeti.Kawasaki.')[-1] in lean
 for x in n.get('api',[])+n.get('tests',[]):assert x['name'].split('TauCeti.Kawasaki.')[-1] in lean
sys.path.insert(0,str(R/'scripts'));import build
loader=build.load_promoted
def assemble(candidate):
 def overlay(root,folder=None):
  packets,docs,defs=loader(root,folder)
  assert not any(q.get('roadmapId')==rid for _,q in packets)
  if candidate:
   packets=packets+[(rid,p)];defs=defs+[definition];docs[rid]='research/blueprint/readmes/'+rid+'.md'
  return packets,docs,defs
 build.load_promoted=overlay
 try:return build.assemble(require_distances=False)[0]
 finally:build.load_promoted=loader
before=assemble(False);after=assemble(True)
def edges(a):return {(e['source'],e['target']) for e in a['stageEdges']}
def orphans(a):
 vertices={s['id'] for s in a['stages']};es=edges(a);bad={e for e in es if e[0] not in vertices or e[1] not in vertices}
 g={v:set() for v in vertices}
 for s,t in es-bad:g[t].add(s)
 graphlib.TopologicalSorter(g).prepare();return bad
oldBad=orphans(before);newBad=orphans(after);assert newBad==oldBad
bp=next(r['blueprint'] for r in after['roadmaps'] if r['id']==rid)
assert bp['skippedLinks']==[]
names=[n['leanName'] for n in p['nodes'] if n['leanName'] not in typed]
result={'packetSHA256':hashlib.sha256((R/rel).read_bytes()).hexdigest(),'suggestedSHA256':hashlib.sha256((base/'suggested'/f'{rid}.lean').read_bytes()).hexdigest(),'checker':checked,'targetItems':15,'nodeDAG':'acyclic','typedNodeSignatures':len(typed),'untypedNodeSignatures':len(names),'typedExamples':len(re.findall(r'^example ',compiled,re.M)),'untypedTests':sum(len(n.get('untypedTests',[])) for n in p['nodes']),'untypedNames':names,'actualAssembly':'build.assemble(require_distances=False), overlaying only this job packet and roadmap definition in memory','beforeStages':len(before['stages']),'afterStages':len(after['stages']),'addedEdges':[list(e) for e in sorted(edges(after)-edges(before))],'removedEdges':[list(e) for e in sorted(edges(before)-edges(after))],'inheritedOrphanEdges':len(oldBad),'introducedOrphanEdges':0,'definedStageDAG':'acyclic','skippedLinks':bp['skippedLinks']}
(S/'Verification.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['addedEdges','untypedNames','checker']},ensure_ascii=False,indent=2))
```

### artifact: replay_lean.py

```python
"""Compile only with an existing pinned Mathlib build; no build or download commands."""
from pathlib import Path
import subprocess,sys,os,time,json,hashlib,re
source=Path(sys.argv[1]).resolve();project=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve();out=Path(sys.argv[4]).resolve();out.mkdir(parents=True,exist_ok=True)
avail=int(subprocess.check_output(['free','-g'],text=True).splitlines()[1].split()[-1]);assert avail>=20
mathlib=project/'.lake/packages/mathlib'
assert subprocess.check_output(['git','-C',str(mathlib),'rev-parse','HEAD'],text=True).strip()=='082e2d37e8b0463410cdb532e111cd43d5a66174'
version=subprocess.check_output([str(lean),'--version'],text=True);assert '4.34.0-rc2' in version
paths=list(project.glob('.lake/packages/*/.lake/build/lib/lean'));assert paths
assert (mathlib/'.lake/build/lib/lean/Mathlib/Algebra/Homology/LocalCohomology.olean').exists()
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(map(str,paths));t=time.monotonic()
p=subprocess.run(['time','-v','timeout','1200',str(lean),'-j1','-M8192',str(source)],env=env,cwd=mathlib,text=True,capture_output=True)
for suffix,raw in [('stdout',p.stdout),('stderr',p.stderr)]:
 raw=raw.replace(str(source),'INPUT.lean').replace(str(project),'BUILD').replace(str(lean),'lean')
 (out/(suffix+'.txt')).write_text(raw)
report={'sourceSHA256':hashlib.sha256(source.read_bytes()).hexdigest(),'exitCode':p.returncode,'availableGiB':avail,'elapsedSeconds':round(time.monotonic()-t,2),'version':version.strip()}
(out/'receipt.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report));sys.exit(p.returncode)
```

### artifact: Inputs.json

```json
{
  "baseCommit": "77deff9da8d8453590b377c80bdc8b90335224b3",
  "deliverables": [
    {
      "path": "research/blueprint/roadmaps/DeformationAndDerivedPatchingAlgebraPartII.json",
      "sha256": "4f6f7b7754ba67590897bbc0f2be679d04ffaee2753375bc4326ddc2ea73e9e2"
    },
    {
      "path": "research/blueprint/packets/DeformationAndDerivedPatchingAlgebraPartII.json",
      "sha256": "b21714dbed4197d3731d3b37fc11ca0763f0385fe16b2004cb816abefeaaebec"
    },
    {
      "path": "research/blueprint/readmes/DeformationAndDerivedPatchingAlgebraPartII.md",
      "sha256": "01407100b0c04f81cd19ee3bb0cd27b347ffd45b183aa2193becff3434f00b3b"
    },
    {
      "path": "research/blueprint/suggested/DeformationAndDerivedPatchingAlgebraPartII.lean",
      "sha256": "5f5a47a72093a72377667cce0cf6a695bbabca62621e14ef540f658b5ec17e26"
    }
  ],
  "acceptedExtraction": {
    "path": "research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json",
    "url": "https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/77deff9da8d8453590b377c80bdc8b90335224b3/research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json",
    "sha256": "bb5f168e47d453257f756054169a96ab43289dc6f861ea56406f3a7154e844c6"
  }
}
```

### artifact: Verification.json

```json
{
  "packetSHA256": "b21714dbed4197d3731d3b37fc11ca0763f0385fe16b2004cb816abefeaaebec",
  "suggestedSHA256": "5f5a47a72093a72377667cce0cf6a695bbabca62621e14ef540f658b5ec17e26",
  "checker": [
    {
      "summary": {
        "packet": "research/blueprint/packets/DeformationAndDerivedPatchingAlgebraPartII.json",
        "roadmap": "DeformationAndDerivedPatchingAlgebraPartII",
        "status": "partial",
        "nodes": 67,
        "kinds": {
          "definition": 4,
          "lemma": 39,
          "comparison": 4,
          "theorem": 17,
          "construction": 2,
          "application": 1
        },
        "apiItems": 31,
        "unitTests": 25,
        "planets": 19,
        "baselineDeclarations": 28,
        "prerequisites": {
          "baseline": 26,
          "node (this packet)": 86,
          "stage": 48
        },
        "gaps": 7,
        "requests": 4,
        "stagesInScope": 5,
        "stagesClosed": 0,
        "stagesPlanned": 1
      },
      "errors": [],
      "warnings": []
    }
  ],
  "targetItems": 15,
  "nodeDAG": "acyclic",
  "typedNodeSignatures": 30,
  "untypedNodeSignatures": 37,
  "typedExamples": 22,
  "untypedTests": 3,
  "untypedNames": [
    "TauCeti.Kawasaki.cm_secant_owner_comparison",
    "TauCeti.Kawasaki.schenzel_torsion_bound",
    "TauCeti.Kawasaki.cm_secant_extend_parameters",
    "TauCeti.Kawasaki.p_standard_reversal",
    "TauCeti.Kawasaki.matlis_annihilator",
    "TauCeti.Kawasaki.duality_annihilator",
    "TauCeti.Kawasaki.cm_locus_annihilator",
    "TauCeti.Kawasaki.nonequidimensional_defect",
    "TauCeti.Kawasaki.kawasaki_reversed_dseq",
    "TauCeti.Kawasaki.kawasaki_torsion",
    "TauCeti.Kawasaki.kawasaki_aux_regular",
    "TauCeti.Kawasaki.kawasaki_robustness",
    "TauCeti.Kawasaki.module_blowup",
    "TauCeti.Kawasaki.module_blowup_chart",
    "TauCeti.Kawasaki.module_blowup_off_center",
    "TauCeti.Kawasaki.module_blowup_map",
    "TauCeti.Kawasaki.module_blowup_map_id",
    "TauCeti.Kawasaki.module_blowup_map_comp",
    "TauCeti.Kawasaki.module_blowup_zero",
    "TauCeti.Kawasaki.module_blowup_self",
    "TauCeti.Kawasaki.module_blowup_chart_surjection",
    "TauCeti.Kawasaki.module_strict_transform",
    "TauCeti.Kawasaki.module_two_ideal",
    "TauCeti.Kawasaki.blowup_support",
    "TauCeti.Kawasaki.rees_dimension_bound",
    "TauCeti.Kawasaki.proj_prime_chain",
    "TauCeti.Kawasaki.blowup_support_dimension",
    "TauCeti.Kawasaki.regular_terminal_quotient",
    "TauCeti.Kawasaki.principal_stage",
    "TauCeti.Kawasaki.two_generator_chart",
    "TauCeti.Kawasaki.claim_annihilation",
    "TauCeti.Kawasaki.claim_vanishing",
    "TauCeti.Kawasaki.chart_polynomial_annihilation",
    "TauCeti.Kawasaki.chart_depth_induction",
    "TauCeti.Kawasaki.weaker_hypothesis_cm_blowup",
    "TauCeti.Kawasaki.kawasaki_cm_blowup",
    "TauCeti.Kawasaki.arbitrary_blowup_nonexample"
  ],
  "actualAssembly": "build.assemble(require_distances=False), overlaying only this job packet and roadmap definition in memory",
  "beforeStages": 2956,
  "afterStages": 2980,
  "addedEdges": [
    [
      "AdicCoefficientsAndComparisons:L5",
      "DeformationAndDerivedPatchingAlgebraPartII:K3"
    ],
    [
      "DeformationAndDerivedPatchingAlgebra:R03.3",
      "DeformationAndDerivedPatchingAlgebraPartII:K0"
    ],
    [
      "DeformationAndDerivedPatchingAlgebra:R03.3",
      "DeformationAndDerivedPatchingAlgebraPartII:K2"
    ],
    [
      "DeformationAndDerivedPatchingAlgebra:R03.3",
      "DeformationAndDerivedPatchingAlgebraPartII:K3"
    ],
    [
      "DeformationAndDerivedPatchingAlgebra:R03.3",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K0",
      "DeformationAndDerivedPatchingAlgebraPartII:K2"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K0",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product",
      "DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product",
      "DeformationAndDerivedPatchingAlgebraPartII:K0/schenzel-torsion-bound"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K0/duality-annihilator",
      "DeformationAndDerivedPatchingAlgebraPartII:K0/cm-locus-annihilator"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K1",
      "DeformationAndDerivedPatchingAlgebraPartII:K2"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K1",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon",
      "DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-intersection"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence",
      "DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2",
      "DeformationAndDerivedPatchingAlgebraPartII:K3"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-reversed-dseq",
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion",
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product",
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-aux-regular"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product",
      "DeformationAndDerivedPatchingAlgebraPartII:K2/kawasaki-torsion"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K3",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup",
      "DeformationAndDerivedPatchingAlgebraPartII:K3/blowup-support-dimension"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module",
      "DeformationAndDerivedPatchingAlgebraPartII:K3/module-blowup"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation",
      "DeformationAndDerivedPatchingAlgebraPartII:K4/claim-vanishing"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K4/claim-annihilation",
      "DeformationAndDerivedPatchingAlgebraPartII:K4/weaker-hypothesis-cm-blowup"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K4/claim-vanishing",
      "DeformationAndDerivedPatchingAlgebraPartII:K4/weaker-hypothesis-cm-blowup"
    ],
    [
      "DeformationAndDerivedPatchingAlgebraPartII:K4/weaker-hypothesis-cm-blowup",
      "DeformationAndDerivedPatchingAlgebraPartII:K4/kawasaki-cm-blowup"
    ],
    [
      "tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces",
      "DeformationAndDerivedPatchingAlgebraPartII:K3"
    ],
    [
      "tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces",
      "DeformationAndDerivedPatchingAlgebraPartII:K4"
    ]
  ],
  "removedEdges": [],
  "inheritedOrphanEdges": 76,
  "introducedOrphanEdges": 0,
  "definedStageDAG": "acyclic",
  "skippedLinks": []
}
```

### artifact: lean-report.json

```json
{
  "command": [
    "time",
    "timeout",
    "1200",
    "lean",
    "-j1",
    "-M8192",
    "SUGGESTED.lean"
  ],
  "availableGiB": 38,
  "sourceSHA256": "5f5a47a72093a72377667cce0cf6a695bbabca62621e14ef540f658b5ec17e26",
  "exitCode": 0,
  "elapsedSeconds": 1.7,
  "stdoutSHA256": "9fb54b87ed151c68ba9987a2414ff3d196bf939f486226fcc5aac138af0e8564",
  "stderrSHA256": "f7cae1e7a44c510be2187960dd11cd19fb83fda278e8a76aea052b6388d8f57a",
  "warnings": 47,
  "errors": 0
}
```

### artifact: native-report.json

```json
{
  "command": [
    "time",
    "timeout",
    "1200",
    "lean",
    "-j1",
    "-M8192",
    "SUGGESTED.lean"
  ],
  "availableGiB": 38,
  "sourceSHA256": "ef1fa59411049c897a53f30b3a67f369f8f8db75b5a7f9932bcba6bd666e8549",
  "exitCode": 0,
  "elapsedSeconds": 1.3,
  "stdoutSHA256": "dd66cea6eb486bf073f201919331d803520062115eb57288697bd3a9609868c4",
  "stderrSHA256": "cf88711f0c10f69e8e964858bc11d7df645e77ef4cc680194a3a0ed23f0aa2e4",
  "warnings": 0,
  "errors": 0
}
```

### artifact: Native.lean.gz.b64

```text
H4sIAAAAAAAC/7VXXW8bRRR9319xJR5YC2dLeUzpQ5pScBu3kRMJCctY492xd9zZme3MbBzzIVUCRREvICReeUCg/gV+j38JZ8Ybe/2RQClIUbI7c+fec8899+7k3kF0ngtLYyE54a/SjlzOyWiWFawkprKbZX6Zs8o6ccETOm+YZDqtCq6ct8v4WCgRbCJvYx1z3G9astVkwq2jE84UjbUpsKQp1coZMaqcNjYEM/xC8BnHWwo7bF9wM+GkFSlWcBt5GysmirnKcOuRICx+GJ0e9c47RyeU5jx9WWqh3GFIZaQrlTEzh+uJsI4bGnGpZyTxYr1FZKuylIKbg4yXXGU+F8cQFduzXFtObl7yZljK2QUPpMy5gzuuaGaEc1wl9IlkI22YE2oSuRW1F0yKDFyEgD6t1HAHF8xzRaU2TiBFreT8AQkHTvmS9JtzOMbcKoMkeq6JmZFwxidWGl1qK5YuDDFrUZDswC9z4+ZAwGVmcbqULOUBQSGsBULSoylPnU2ig3uRKDwO6jKXSzFKjuSEjwxLPtOFlnoyT050yuSxzuv3bfse/KHm2syTZ6aS8rFA4S0wJV2dVZLfYd/jk0oyc/P3jL+quErvPsFtDfA23KdazpUuBJM1gOQRsyLdNn/MHEu+gMX+7UbMUw1dnnEjoLtOxpmMIoVC6qKsHBuhyBZUIt8ItCuyqfaieSQmL1AF5gUeVQrVNhBUFQU1l74c56w65k4kz9iMWfZSRBfMiOAv7tEhnUN7VLWof6yLwqOh3oDibnPnKMv85qdGVyV1B9Rf5ks9vGxBRIOizZTIhfSQhtBIVqWO4qdwGJKiXoviDG+L739prRfp8GFEtLj+kab4fU1PhLLcJYYpdGfWpprihm+ciWO5qRl6StNWAtEhg3DgmLlEjz3SViuKPDphh2kxBJUMbdjv2OeaQ7BgRN0kj8UgxdV7HfuJHz3LrCnGADmkE3SLz+eQTtELIYV4cf2aTEjB2Hb91HCYFOxSFEyuuFhcv6lPCfhBDJxLJFcTl7fByE3ifoZANxC9z7tLizd/UhycIL+AA5ASx16irCJBW39wvwXnr3+jxQ+/w/FZNSpWVcPOx//Od3B9h99mPtNlkdsU+6fPhcsfYeJgZXH9KwD88+jg+vZEFlc/+1Sw7AeO5A5DalcX8V0lWErGe6Ed3bw1oE0OdmuKze+o1n/7/ykCPVx22DblARYBS18Mgi73deo7B7+T6mzdhRmacDmHb++mWyjs2LNuJetp7lNaXP2xt0LxLsR31fd/6y3UYklJaXC5uVxPzA1OYrt/YvqBKXYHJibPbbPBz4VlQINv3LCGE3ea87kJNDbrTyF1gGT93Vt/Blq4yHDDI1yqDL5fBtjo65K+CQVUbSqTVPPxmFSAGne+VLeVB6x8G9FX3OhhwYv3vaPRnHDZMprUA9yRijIilmWNXQhguV/SK8pLyl+Rwpo3ZVSFa8jfRExqhxTjuEKO3kUrIltUcl8gFMsH8lHSPBAex2Ov2xU1YbIjXtl6m8zhz8yov81wEnAwXCLnA5iEh/VRTI7Cg1yhE1PKxbT2tbj66UYasBnioycywSZaQRxF6Q1RHT0bgoF2w6cP6KP6ePySQY+NeDUrwYDicbK6CIppcr8VSMTTR5BZhLNF6VX0dFNf+ydPF9/vDzG9Ajmh8L6I1N9jPVi5PtwaJt5Nf7BxfsNgfXJ77Gx1YM9PkX1wNu0G0XulAfOEUacLuy+1LYvmFWR3a410a28z7NZmo5kj/I+xe+v7C94lxzmKDQAA
```

### artifact: lean.stdout.gz.b64

```text
H4sIAAAAAAAC/8WYO26EMBgG+5yCEwT8wDy6lTYF1SKSJt16l39ZJGIiGxLl9olygjTR1AjNIOsbSwxP/em5ezkNr3mUJD5e7/ll2eU9zmHL0z5NkjYZ86Pc1vjmt3kNhzAeJc4fMvZ+u97nMB2WSS7R9z5uXfe4iA+trlrXZp8+hp/nbTbKdfHx9/VsT5Kyc1pj/Do/DP/ENwXMtzC/ZvnWtAXKdzC/YfmuZM/fNSy/gr+/1jAf3n8D77+B99/A+1eFpgVKWqCGBZRjN6gUHGGlNS1Q0gJwh5VRtABcYmXoFFs6xZZOsaVTXNIrKOkOOFqgoo+gsrQA/E9E1QU8w9rQAvRlVMOXkS7gDmilaAFLC8Ad0BrugNaGFnC0wB878A161lIkoBcAAA==
```

### artifact: lean.stderr.gz.b64

```text
H4sIAAAAAAAC/32STW8aQQyGz7u/wopUCQ6huySlu3urEhrlEBWJ0vuwa2BgPsjYy0d/fT0LSasScRrJ72OP7dfJg7dWuQbmqN0SWFtsKriJr28Z8mGWgUHl4Hadw+1LkZdDmM6ensbTn+PHQVRu0mRGGLpU6BHW3jXUryAf3BVpMj0So70Qs8FdliYTDDU6Br+Ah8kMeKUJ1n4OS88VlOWnNBkbtSVsoLdXxkBtfL3pn4utKmsrIvAB4huLVlk++Cp1v+0wqCUCrVSQZMYDA+nfkrSZHxk79i/VujPXKFZXOGJVb67o7FmZD/QXddC2tRCQdBPHJbxoZ1gURTn6p9g1uKu5lrl7AV9bHaJxz59/9GEbMxeqNUwnSrsTVRulbcQULIKy+B86KsviS5r88qZ1rMIRxKbT0vaa6xUKkt/nozR5drsrzLAUv/diWPf5d21kZyf7tdu2fBmWC3uPT8VaGdUikbRGMrfjDwWZBvUuXmkU9dIpQ9CgkVg4RyedXd3S3nZ2n5XS//igOfrIbffpH2UXb//9AgAA
```

### artifact: native.stdout.gz.b64

```text
H4sIAAAAAAAC/7XQsQ7CMAwE0J2vyJalygewdmRCYkMoshyjWiR2iBO1n093Ruh80rvT+RuMmTqHC6xg8OIAIrxwhq4t1qZpYPcuUSVJ5lQcbKzFzu6+h5W2Prk5gxkj5ICLMtLkrkN7MB2SHif/1cAWsUQjBDmATrv8HiRIf7ZroydvB33SiCyWXc6/zf4AAg9RmNABAAA=
```

### artifact: native.stderr.gz.b64

```text
H4sIAAAAAAAC/32STW/aQBCGz/avGEWqBIdQ40KIfatSGuUQFckl98UeYGE/6M6Yj/76zhqqqA3itNK8z3y+mzx5a5VrYIHarYC1xaaEu/j6lmGYZxkYVA7uN0O4f30cFjlU8+fnafVz+m0Qlbs0mROGLhV6hLV3DfVLyAbFKE2qEzHaK2JepMkMQ42OwS/haTYHXmuCjV/AynMJxfhTmkyN2hE20DsoY6A2vt72L8XWpbUlEfgA8Y1Fy2w4+JKlydc9BrVCoLUKksx4ZCD9W5K2ixNjx75TrbtwjWJ1gyNW9faGzp6VuaK/qqO2rYWApJu4LuGHcfLHSTEejd6L3YK7mhvZuxfwV6tDNO7l848+7GLmUrWGqYQHobQ7U7VR2kZMwTIoi/+hkyyb5Gny5k3rWIUTiE3nox0012uMyFi6vrj9DWQsJaqD+NVN+F0bOdnZfe12beyTP4z+FeSLnRVJqMRb2dUikcxGsrjjq4Ksg3ofv2kU9copQ9CgkVi4RGedX93V/h5tlBVykelRczSS267pH1kKalD+AgAA
```

### artifact: Artifacts.json

```json
{
  "recover.py": {
    "encoding": "text",
    "output": "recover.py",
    "sha256": "21aa7d60e0cfd852a00598c0e0c9375276b51f7d1cee2b75c666940d85177b0b"
  },
  "verify.py": {
    "encoding": "text",
    "output": "verify.py",
    "sha256": "3f569696319e94a572008e1c6f9718b526424d1bd9dcb4302241a0e9c34d58f1"
  },
  "replay_lean.py": {
    "encoding": "text",
    "output": "replay_lean.py",
    "sha256": "2a1fb0221d420485907ed0606b71d72b917501051819e26cb077fd4901268982"
  },
  "Inputs.json": {
    "encoding": "text",
    "output": "Inputs.json",
    "sha256": "63b69b9673b67809e4559c65cd162055e5dd3fd58479454eb44683d484604804"
  },
  "Verification.json": {
    "encoding": "text",
    "output": "Verification.json",
    "sha256": "be66a9d540d44daff59448797b695d8387eb099733056d2e78912d755cd984a9"
  },
  "lean-report.json": {
    "encoding": "text",
    "output": "lean-report.json",
    "sha256": "d511573489b7b961618e0d4dc77bd531289d0a94de62ddd70588c44d5016069d"
  },
  "native-report.json": {
    "encoding": "text",
    "output": "native-report.json",
    "sha256": "ac4fd0ee2ad5b58ed1f57d73737f4e247591cd481bef5eb30d4b38c11e545728"
  },
  "Native.lean.gz.b64": {
    "encoding": "gzip-base64",
    "output": "Native.lean",
    "sha256": "ef1fa59411049c897a53f30b3a67f369f8f8db75b5a7f9932bcba6bd666e8549"
  },
  "lean.stdout.gz.b64": {
    "encoding": "gzip-base64",
    "output": "lean.stdout",
    "sha256": "9fb54b87ed151c68ba9987a2414ff3d196bf939f486226fcc5aac138af0e8564"
  },
  "lean.stderr.gz.b64": {
    "encoding": "gzip-base64",
    "output": "lean.stderr",
    "sha256": "f7cae1e7a44c510be2187960dd11cd19fb83fda278e8a76aea052b6388d8f57a"
  },
  "native.stdout.gz.b64": {
    "encoding": "gzip-base64",
    "output": "native.stdout",
    "sha256": "dd66cea6eb486bf073f201919331d803520062115eb57288697bd3a9609868c4"
  },
  "native.stderr.gz.b64": {
    "encoding": "gzip-base64",
    "output": "native.stderr",
    "sha256": "cf88711f0c10f69e8e964858bc11d7df645e77ef4cc680194a3a0ed23f0aa2e4"
  }
}
```
