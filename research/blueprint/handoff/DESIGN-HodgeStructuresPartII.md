# Hodge Structures Part II — affine pullback tower checkpoint

Codex — codex-a71f92; Refs #3371. Claim5970752537; bot confirmation5970753844. The complete issue was reread after confirmation. Governing instructions were read from immutable Git blobs; the shared working tree was never edited. Partial checkpoint, not a claim of implementation.

## Supplied mathematics and retained scope

Fourteen new nodes (two constructions,twelve lemmas), ten consumed API items and thirteen typed tests. Native algebra-tower cancellation identifies actual successive affine pullback with direct pullback as preconnection structures, with forward/inverse horizontality, exterior extension, curvature and flatness equivalence. This compares two connections over T; it does not reflect curvature from T back to R. Neither d₀λ=0 nor basis, projectivity, injectivity or flatness is assumed for the comparison.

The constructed ℤ→ℤ[x]→ℤ[x] test has identity second step. The source unit(2) is zero, while its new polynomial derivative is2 and survives cancellation; the iterated operator is nonzero. Do not call this a ramified second-step example. The incoming x↦x² calculus test remains unchanged.

All321 incoming node objects are preserved exactly. The nine coverage statuses,149 routed items,35 typed omissions, five supplier requests, eleven gaps, six planets and the EG20/E10 source-issue/version envelope are unchanged. H.0 stays partial; H.1–H.8 stay not_read; every node is unchecked.

## Checks and memory

Exact pins: Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174; TauCeti f790474821cf4256814db967cb154e7af3d0c369; Lean4.34.0-rc2 commit6a10ac8c22beadecabdbb0919c2b50214762f91d. A pre-existing Mathlib build was reused. No Lake setup/update/cache/build, TauCeti build or language server was started. No owned compilers overlapped. Each check used a same-process20GiB available-RAM guard,1200-second timeout,-j1 and-M8192 (8GiB managed-memory limit, not an RSS guarantee).

Native.lean:76 examples,118 clean axiom audits,no admissions/errors/warnings; 32.88s,3612824KiB peak RSS,33GiB available before starting. Source SHA256 3c94ea073e3211c39c48461ed9c0a94571a19c5e4a1a8996eb869640111e580d; diagnostics 23be0d93fcc64821dd4fbc790940e15559744c6e736fea997a8e2924db8bd5e0.

Canonical.lean:the complete Mathlib-only admitted planning file,273 examples,632 admission-only warnings and no errors/other warnings; 28.38s,3288196KiB peak RSS,32GiB preflight. Source SHA256 cd971b8a95671edd9584d0e951cfe6d13cb26669e0e1aa12cac25b3666d98783; diagnostics 70fa8512d94e2a101a083b7b8e9da780f0cf2fa738d8c385332a9f7d530fba4a. Its concrete maps/carriers stay concrete; new lemma/test bodies are admitted planning signatures. The final published Suggested.lean includes this exact canonical prefix and an inert authenticated archive. It receives an additional full-file check before the PR.

Actual immutable scripts/check_blueprint.py, intake path/author checks and source-issue/version checks pass without errors or warnings. Packet:335 nodes,224 baseline entries,326 deduplicated API items (334 raw),299 checker-counted tests (314 raw). All37 guarded inputs and the five owned input blobs are unchanged from math to publication base. Full foreign roadmap/stage objects and all stage edges are conserved; no own unresolved prerequisite, skipped link or pending link. All21 required supplier paths hold. The actual stage, own-declaration and scoped DAGs are acyclic. Full exact counts and hashes are in math-validation.json and publication-validation.json.

Math input: 9d7e0ed5b1ebccd09e773dd07d9a821666ba6c49. Publication input: b67b5c5f3621c15263b9f2a9c800cc9982fc70ae. Prior native proof recovery: [PR6005](https://github.com/CBirkbeck/tauceti-explorer/pull/6005), headf3f72b13b470917a1e1ebe08f58c38cf75b1e1fd; its exact evidence ancestor191e40325102922ad0c8a7057de6e38967b34885 was decoded and checked against its manifest. All recovered predecessor artifacts are retained under Previous- names; their proof and reading claims remain attributed to their original worker.

Fresh main-agent reading:complete parent Hodge and JacobianChallenge readers, four reviewed Hodge audit rows and REV-AUDIT-02, full reserved key/survey/ownership record, all nine current stage descriptions and five supplier stages/requests, and all pinned cancellation/tower/map statements used. Source convention:Esnault–Groechenig author copy printed pp23–24 including full Lemma4.9 printed proof; Stacks07J5 complete section and Lemma60.15.1 proof. Exact fetched hashes are in source-fetch.json. No full-paper audit, rendered-PDF inspection or new published-version collation was performed. New tower results are explicitly authored deductions, not source-attributed theorems. Bounded current open-PR and Zulip searches found no adoptable replacement; no exhaustive absence claim is made.

## Required next frontier

Actual affine iterated scalar extension agrees with direct pullback under native AlgebraTensorModule.cancelBaseChange as preconnection structures, in both horizontal directions and on extended differentials, curvature and flatness. This works for arbitrary λ and arbitrary modules over every compatible commutative algebra tower, with no basis, projectivity, flatness or injectivity hypothesis. It compares two T-connections and does not reflect curvature back to R. Still supply monoidal common-λ and universal exterior-power base-change comparisons, identity and three-step categorical pullback coherence, and genuine E1 sheaf tensor/restriction, equality detection and effective gluing. The reserved general finite-locally-free ringed-site key, all149 routed source obligations, five supplier requests, determinant/Tate/period adapters, arbitrary-Q tensor-valued shuffle and H.1–H.8 retain their open status. Previous frontier prose is checkpoint history.

## Exact public recovery

Artifact manifest SHA256: 2e7012d5df3ad6554c08d8456183ae64e6a8d2d418ae65bd6491cfe108f33249

The inert Suggested.lean archive stores 74 exact UTF-8 evidence artifacts plus the manifest. Source-text extracts are not redistributed. Current five deliverables are recovered from the exact public PR head; no clone or repository snapshot is created. Run from an existing checkout, with a new owned disk scratch directory below1GB. Save recover.py below with apply_patch, then:

```sh
PUBLIC_RECOVERY=1 python3 recover.py OWNED_SCRATCH EXACT_PUBLIC_HEAD_SHA
python3 OWNED_SCRATCH/verify.py OWNED_SCRATCH PINNED_DECLARATIONS_TSV
# This optional serial check requires an existing exact Mathlib build and the RAM guard:
python3 OWNED_SCRATCH/runcheck.py OWNED_SCRATCH EXISTING_MATHLIB EXISTING_LEAN Native.lean
python3 OWNED_SCRATCH/runcheck.py OWNED_SCRATCH EXISTING_MATHLIB EXISTING_LEAN Canonical.lean
```

For immutable validation the existing checkout must contain the recorded math/publication Git objects; fetch only those objects if needed. verify.py reads actual Git blobs through immutable.py, never a mutable working-tree world. graph.py assembles the actual atlas and compares foreign objects/edges. runcheck.py stores normalized diagnostics and receipts through apply_patch. It never sets up or builds any library. Capture/replay does not imply independent review.

### recover.py

```python
"""Recover exact public-head files and authenticated inert evidence; writes use apply_patch."""
from pathlib import Path
import base64,hashlib,json,os,re,subprocess,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();head=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',head)
S.mkdir(parents=True,exist_ok=True);RID='HodgeStructuresPartII'
def read(path):
 if os.environ.get('PUBLIC_RECOVERY')=='1':
  return urllib.request.urlopen('https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+head+'/'+path,timeout=60).read()
 return subprocess.check_output(['git','show',head+':'+path])
def put(n,b):
 assert Path(n).name==n and n not in {'.','..'};p=S/n
 if p.exists():assert p.read_bytes()==b,n;return
 t=b.decode();subprocess.run(['apply_patch'],input='*** Begin Patch\n*** Add File: '+str(p)+'\n'+''.join('+'+x+'\n'for x in t.splitlines())+'*** End Patch\n',text=True,check=True,capture_output=True)
 assert p.read_bytes()==b,n
paths=['research/blueprint/'+f+'/'+('DESIGN-'if f=='handoff'else'')+RID+'.'+e for f,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
current={p:read(p)for p in paths};published=current[paths[3]].decode()
m=re.search(r'/\- BEGIN HODGE TOWER PAYLOAD N26\n(.*?)\nEND HODGE TOWER PAYLOAD N26 -/',published,re.S);assert m
items=json.loads(m.group(1));meta_bytes=zlib.decompress(base64.b64decode(items['artifact-manifest.json']['data']))
assert hashlib.sha256(meta_bytes).hexdigest()==items['artifact-manifest.json']['sha256']
meta=json.loads(meta_bytes);assert set(items)==set(meta)|{'artifact-manifest.json'}
handoff=current[paths[4]].decode()
assert 'Artifact manifest SHA256: '+hashlib.sha256(meta_bytes).hexdigest() in handoff
for n,item in items.items():
 b=zlib.decompress(base64.b64decode(item['data']));assert hashlib.sha256(b).hexdigest()==item['sha256'],n
 if n in meta:assert meta[n]=={'sha256':item['sha256'],'bytes':len(b),'lines':len(b.splitlines())},n
 put(n,b)
assert published==(S/'Canonical.lean').read_text()+'\n'+m.group(0)+'\n'
for p,n in zip(paths,['Candidate-roadmap.json','Candidate.json','Reader.md','Suggested.lean','Handoff.md']):put(n,current[p])
put('Published.lean',current[paths[3]]);put(RID+'.json',current[paths[1]])
# The full published-file compilation cannot be inside its own archive. Its independent
# diagnostics and receipt therefore live in the handoff and are recovered here.
for n in ['Published.receipt.json','Published.log']:
 x=re.search(r'### '+re.escape(n)+r'\n\n'+chr(96)*3+r'json\n(.*?)\n'+chr(96)*3+r'\n',handoff,re.S)
 if x:
  obj=json.loads(x.group(1))
  b=(json.dumps(obj,indent=2)+'\n').encode()if n.endswith('.json')else zlib.decompress(base64.b64decode(obj['data']))
  if n.endswith('.log'):assert hashlib.sha256(b).hexdigest()==obj['sha256']
  put(n,b)
print(json.dumps({'publicHead':head,'verifiedArtifacts':len(items),'currentDeliverables':5,'allHashesMatch':True,'anonymousPublicReads':os.environ.get('PUBLIC_RECOVERY')=='1'},indent=2))
```

## Full published-file elaboration

The exact published file also elaborates, with632 admission-only warnings,no errors/other warnings; 3285560KiB peak RSS and32GiB preflight. Its receipt and compressed normalized diagnostics are outside the file archive to avoid a self-reference; recover.py retrieves them from this handoff.

### Published.receipt.json

```json
{
  "sourceSha256": "a248c4a988f6b65629cfe2cacd7bdd9e03894b03fb7d3c5954877ed20bc2ccd2",
  "logSha256": "4db1e2cb62aebc12c47fbd9be9baeeafe3fff67845bdc1efc8edf66a61950928",
  "availableGiBBefore": 32,
  "elapsedSeconds": 29.58,
  "maxRssKiB": 3285560,
  "exitStatus": 0,
  "errors": 0,
  "warnings": 632,
  "admissionWarnings": 632,
  "axiomAudits": 0,
  "sorryAxReferences": 0,
  "leanVersion": "Lean (version 4.34.0-rc2, x86_64-unknown-linux-gnu, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d, Release)"
}
```
### Published.log

```json
{
  "data": "eNqtnW2PG7cRgD/f/YrFAQVswHbImeGbGgRwjTQJkLRu3ORLUTQrae9uc9JK2V357Bb97+XeuehLUqPAoy8+S1o9Gs7wZUgOh3+7Oo7d9a6/uZ2vVs3V1I19u2u6d/0098NNc+yHods261O/2149a67at22/a9e77ov+N/V5lfresd3ctTfdVF//6eq4a09TXx9Ynv66a4c3XTtubl/t+m6Yl/f6/fEwzl+M7fF2eXkcD4fr+357083Tww900+G4/OcPPy3/rtt5riJV+J/rq8O+ry+3Dz9UiatmODSbw/7Y76qMu349tuP7ZtuP3WY+jO9/XT+em35oun6+7cZmc9tt7uqDjxLULw7dA3VXpfy+G6f+MCwqWIRunrx9fKOxF2ov3PNxU0v6Lse/RHt+Gu6Gw/3wfNcPp3fPb4bTs0WIKloTW+/aTd6IrLt2223a9Xa9dsWXjayDE28pynXx22fNt1391al7evX3y0/fvPr25R9fffnZJ69P610/3XbbF4tIK+9kZavmvh2HaopVU4G7dmznRazT1E3ND9NhHN//8DGCYkLAhLjKkJApwTtMsJWDhIgJmRIkUT1IoQT1mIBtodgWWijBcNs0o5o03DYNt83gqSaDYgKuD1EoIeF2kRQTAibgPio7TMC2yLhWF6Otu2BbFNzbF6oHcbR1i1NMCJTgPbSmeKGa9BETsDUFW1OwNYX21aLUrxalPa0otqZST0yM9pNiuGUZHS8kUD9KAvWjJGBrBtw2Ix03BfswEg0TMrVmonM9wX6UJFwfsBckGfe0Gfe0BduiYE1iH0adwwRqC3W0n1SPZRAH26YKbVkqtD4oXn9QDZhAx241rMmAa3Wgo78GuoqieMzSmCghYWtmbM2MZcA9rTnqR5nReZYZl6FQGQKd61mgM3eLWA+JE3ApMu2rrdC5nhWsh5KwDLR1B7yXFHDrDo769gHv4wSvmECtGQSXAvtRQejIG1QwwTCBjt3BHCYoJkRMwNbEuzAB78IE7E+GQGdJIVI9FE/9hyJ01CsSMIGO3UVpyyqqmED7h2K0ry4WVp4isDHwZK/gRdIScbXGU7WScKVMhgm0kypFcZWqsz2MwKEgzilH4E1O5/FOq8NddkXwOCkeWuPUOIJbxHBMiMNOVUXgGB/HQ1Nc4FLw4BQXuToTD0ZMZ4gldBzBpSi8XhQcaVNrOEfg2ulxSID3vMvxeEHd+8CjTLGPVBEJqzN5juAxu5kutPgzxFAtAUwUwaOPxeNmxuNmvOAln4rA9UL4yC68mUmtnZGGUgeKWDaWMSJjhDeMEMcRESPOEBeOlwMrAo/sGoQjuC6466qRq7MORZ6eOMj80EIOHIE7Ty3KEXjez3eKvXkcJm78TI/xcdmES2HCj5LgscgMDyQWPEcYR/CCRC5F5FIk3Hkue/gUwY9jWOZSFNzMlt1naJEgZ0Akfl6K6wLHjvsQuBRJsDpTwYiMG3soyhF4QhIdNmrEcao+ei6FP8N5Ps8RXBd8QhLrVKBqFDIidTBiwO0sRuEI3kj4MnZMXIrsOYJLUbgUfBEk8TXo5ANGCD8BzIf2hGMmKoKrky+CJL4IkvgiSEr0yENFYO8gZccRZ5AC9+Cp4DlNdrggWbCzlfUMCK4L47rA8W4VgXutzCeq+QxpAzLu+Ao+6OULX9haQu8iRWDnoPDaWfgUsUSOSBzB10BK4fWi4OPaS6CTUQTtO8XhrR5xKhyRMMK4FMZ1EXBCBIeXXSuCqzN6jggcUTAiZYzIvF4UXjsLlsLjVSlZctDhDDCeI7gU4jjCOAIn7fB4nio8BZt4nr+EJx+rCK5O7IOLT7xeJG4RnDdLPF4IF3GOI4wj8CCwpJ3CCDyaCff4RLhRuccn3OMT47owbhHe5ZwhW5DgoHIRfKCnIvAgcIZsPZKNI3D3K3yGqDioXJT7WiqF53jD/YXiNT5R8xyBe60lGJAi+NxMI5cicV1kXi8yrxcF+xfGM2uaw36neS4FjsITE16QiJfGjC8+GF98sMSlSFyKjPM6Gt7hFuNLIEvyFogIDnd8S+ITjOAFEdzxBT4sh4DdNR68JjzVREVgBzokLgWf9oeM/c5QeO5Rnqw6Ch6Wo3KEcUTAzSxyjy8mxxG474zc44vc44t8XSvxuVnC29MVgfuLpFwKxUsgybg6+VCU8EEt4TFKFYGdg8TbSMLRhJKdcATWRfa4sWc+FGXhBVHc/Waepz7j9GYVkXk+bezl5MR1kXhB8HkcyXylsTjcdxbBjb3wNrIkGcMILgWPvyiRI/jiQ8l4qlvweRx1Z8j5jn0tdTgqvSJw6nmnOFM4TwmlPBmT8kxK6jKvWthRUocnE+rxDrd6vD2tXjhCPUYYR2DnQHneHuUhHOrxtSHqi3BE4ddd4JsBeN4eFd798ow5Wift+O4PPMlUwQdhKiJgROH3oHD/QvBZGlXegy9b9RjBC4IPPFQEbuzKXRTFAYmqgUsRuC4il4JfzKL42IWaw/2FcS/H8NabGt56U8On3iqCS2Fcnbx2Gg48qwg8LC8XpGAE9i/43nJFBI5IHIGbWeDzkYAXbjUI14XRSGwN+GiSBuMWCdwigddOnFRKA95P1RC5RRKXInEpuAMdCjcqX0WJOAldRSSOOMNFfPwmPpyitiJ4QZQXRHlBlBcEZ+GoCF61Aldn4Oo8w02TZ7hqki/cRhyQWBF4TE2OJoTS5LgU3O9MfPEhieeIwBFcnTjwTJfcQRTB/c6EDzzoEpeDEdjLSdzjS5FXrcSbWfH8kt3AEXgQyHxXN+PD6JrxAamKwNP+JajGKAL3F5m3kRxxBc84K6DmzAuCs3xpcZ4jziAFrhfFcylwtl4tfGTn2ZwqAg9Fha+6FpwgXAsfzQpevzCHA88qwjgiYwQeRyqCF8TzguDFh4pIGIGTmlQE14VxixiXInCLBG4RPFs2j3e4KyJhhHEp8JSmIgJGRF4QfDOCeRyLYj5zdZYzILBFBB94MMGrrib4TgITfJd7ReAuR3CUaUVwdeJoQhN81KAiuDozV2fh9aLggih3lBTvj5jiCH1TfOmG8SwcpjixoBmep5rhK2HMcHIsMxzAbDyoxizwgkRuVF61gsN9Z+ATq4B3dS3gm3WrTXlB+LAc8E3cFvhkIkSOyFwXhVsEXx1t/3fYwsWrw37fDttm3dUHm7nfd9tVc7X8PZzmxotzzadff/7yd581z39sfPP8myb7Is3/+umry4vvpm58ADVPpm5zGLbT01Uj6UV2lxdv3k9zt//Zp/5FlMuL19246Ya5OVw3r15/18y3/dT8eFg3N4d51ZTyq8uLz3ftceq2zZP7drdrNrvD5u7pB9jtar9fTVNzGJvlb4W6lZQXwV9evHzbje1N10y37Vi/PHfv5mbq/1q/dLd+P3cPz/7rqdPw4bltO7cfeW6a283dRz6fD3O7+4XPv2nf9fvTvhm7qd8uxZ26n4mzhMGH+G+wjz38wPyxlvvJ2P106sfFjl998vunzXH55nV72s3T41P98PhUrQv9fnmsba7Hdt/916M+56Dp8uL7w+40zO34vql2etTafT9vbrv6jFoyu7z4anj7kYe8S1X9b+6r0R4E+G2/q3p7rAL9cDwtP5b/8+1a6R7fXypLNW8t7r6bpireVMs+zL/4QS1R179dKu7yYX8ztLupVvldfW/88O7rB5M9KO6fejNXYq1S7/p5seV8evjRfwAIdrDW",
  "sha256": "4db1e2cb62aebc12c47fbd9be9baeeafe3fff67845bdc1efc8edf66a61950928"
}
```
