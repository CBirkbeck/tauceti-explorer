# BP-AlgebraicModuliForArithmeticGeometry--A0-extension

Checkpoint by Codex — codex-J6LwjP, 3 October 2026. Refs #672. This is a partial blueprint, with no implementation or stage/key-definition closure.

## Delivered mathematics

The local sheaf H_X is the existing Mathlib `G.sheafHom J y (X_U(x))` on `J.over U`, using the gerbe's inherited IsPrestack instance. Its native pullHom restrictions retain both flexible pseudofunctor composition comparisons. Gerbe invertibility identifies its Hom sections with actual isomorphisms. Native modifications act by postcomposition with their pulled-back components and form an actual functor to slice sheaves; inverse modifications give actual inverse sheaf maps.

Gerbe local isomorphy supplies sections on a covering sieve over every slice object. The prescribed band acts by postcomposition at the pulled-back target. Any two given sections differ by a unique coefficient; sections may be empty. Band pullback and conjugation prove semilinearity for every actual Over-arrow, with the full native restriction formula. Modification maps respect this action. Postcomposition by the inverse strong restriction comparison identifies sections with the preceding transported fibre-Isom carrier and respects its actual modification components.

There are28 new declarations (7constructions,21lemmas),21 API items and22 typed examples. Every new construction has at least3 API items and3 tests; the section action has4 tests. These are parameterized native-carrier checks, including conditional empty sections, local covering sieves, inverse maps, restrictions and modification squares. No new concrete geometric or nonconstant-site instance is claimed.

## Preservation and validation

All482 incoming mathematical contracts remain.480 whole node objects are unchanged; only self-equivalence-torsor and neutral-self-equivalences append5 prerequisites and1 proof-outline step. Every other packet field is unchanged except the prefixed summary, appended source/baseline record, appended R09.4 coverage entry and continuation provenance. All10gaps,22requests,8source issues,10planets, source versions, routed items and eight partial stage statuses remain. The reserved gerbe id and all ownership boundaries remain.

The packet has510nodes,209baseline declarations,469raw API entries and480raw tests. The actual checker counts461 API items and447 required tests, with no errors or warnings. The actual intake path/private-path/JSON checks and source-version/source-issue checks pass. The immutable actual checker/intake/assembler were executed at mathematical base `bfaee0037f9da3fb3e72daae67bc80620d1dce22` and publication base `9d7e0ed5b1ebccd09e773dd07d9a821666ba6c49`.52 input files are hash-guarded unchanged across both bases.

The own declaration DAG has510vertices and1070edges; the scoped DAG has3520vertices and10303edges. Both are acyclic. The stage DAG is unchanged, acyclic with3017vertices and8655edges at both bases.24 required supplier pairs and40 touching accepted-restructuring pairs are reachable. No own skipped/pending link or unresolved prerequisite remains in this structural check. Foreign roadmaps and stages match exactly; unrelated skipped/pending paths and other blueprint parts are preserved. This does not discharge the recorded mathematical gaps.

The incoming peer PR[#6002](https://github.com/CBirkbeck/tauceti-explorer/pull/6002), full head `32901dc32d53431b9376153bf115cce36e9a454f`, was recovered over public HTTP:38 authenticated artifacts and4deliverables. Its actual verifier was executed, and its publication-base output equals the archived report. The recovered sources were read at the bounded native frontier; no fresh complete proof audit of482declarations is claimed.

## Lean evidence and its limits

Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`; Lean is4.34.0-rc2, commit6a10ac8c22beadecabdbb0919c2b50214762f91d. Only an existing build was used, serially after immediate memory checks, each with a1200-second timeout. No Lake setup, build, cache download or language server was run; no process is left running.

The independent `Native.lean` proof prototype contains74examples and103axiom audits, with0errors,0warnings and0admissions; every audit has only propext, Classical.choice and Quot.sound as applicable. Source SHA256: `83cfd4a825fca5cb84bea88dd7a18349a07566f2aecffdbcca7c998038aee46b`. Normalized diagnostic SHA256: `aee80d1d4d77c9021f5b5829d8b0fa92e8cf2175ca5d5deda433ed255768ef1d`. Its immediate available memory was35GiB.

The whole inherited `MathlibCanonical.lean` projection contains335examples and elaborates with exactly739admission warnings and no other diagnostic. Source SHA256: `8632a59113ebc4d8ffcd9ddb7bca9e6d77f07e53cad91fd4b95a45d4b6ae05d2`. Diagnostic SHA256: `2fe8690af5a075f480921a832a99f7b2d4482cda10c44a312e8786e27e036f2d`. Immediate available memory was36GiB. `projection.py` retains actual carriers/maps and admits lemma/example proofs; all28 new native and suggested declaration headers are checked for equality.

The **full Tau Ceti suggested file is UNCOMPILED**. The existing Tau Ceti build has commitcf386627e9176a3827c1a5fe804989fd94a4d216 instead of the required f790474821cf4256814db967cb154e7af3d0c369 and lacks the imported LongExactSequence artifact. The Mathlib receipts do not claim a full Tau Ceti build. Every implementationStatus remains unchecked.

## Reading and boundaries

Fresh primary-source mathematical text: [Olsson, printed122–123 through Remark31.5](https://stacky.net/files/written/Stacks/Stacks.pdf), and [GWZ20 Definition2.6 and §2.2.1, printed514–515](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf). Read using the public PDF text tool; no rendered-page inspection or successful local GWZ PDF fetch is claimed. The visible incomplete Lemma31.6 warning and all inherited source corrections remain. Exact new formulas/proofs are authored deductions, not printed formulas or a completed classification proof.

Fresh pinned statements include the entire presheafHom/pullHom/sheafHom and overMapCompPresheafHomIso branch, the IsStack-to-IsPrestack inheritance, and mapComp' with hom/inv naturality. Positive prior art is retained: generic Hom sheaf descent already exists. The open [effectiveness-of-descent PR24434](https://github.com/leanprover-community/mathlib4/pull/24434) body and dependency list and the bounded [Formalizing stacks discussion](https://leanprover-community.github.io/archive/stream/116395-maths/topic/Formalizing.20stacks.html) were read as design context; no unpinned code was adopted. Bounded open-PR gerbe search returned no result; this is not an exhaustive library-absence claim.

The issue was read before claiming and entirely reread after the exact bot confirmation of comment5970390717. All12 own reviewed audit rows, REV-AUDIT01, reserved gerbe node/survey/API, nine prescribed red-team claim/verdict records, accepted RS27 owned decisions,28owners and26touching links, its accepted repair review and all34 touching link records were read. Earlier complete session reading of AlgebraicCurves/JacobianChallenge is retained with unchanged guards; no fresh whole-source/audit reread is claimed. Generic stackification, quotient/torsor/classifying carriers remain D0's; SF1's algebraic-space/atlas/descended-band obligations remain external; coherent duality retains its reserved owner. No foreign owner, stage or anchor document is changed.

## Resume

The local Isom sheaf is now constructed using the existing Mathlib sheafHom carrier, with the actual functor on modifications, inverse sheaf maps, covering-sieve local sections, a locally simply transitive band action, semilinear restriction and comparison to the earlier transported Isom sections. No new general sheaf descent theorem is required for this local construction. Package the data into D0's actual torsor groupoid and glue the choice-independent local objects for a nonneutral gerbe; then prove full faithfulness and the coherent inverse/unit/counit. Instantiate the22 parameterized checks on the existing nonconstant fixtures as further validation. Every inherited gap,22requests,8sourceIssues, SF1 descended-band comparison, nonneutral O(1) root example, derived H2, compatible fpqc limits and other stage obligations remains open.

Use `NewProofs.lean` and `Tests.lean` for the native local construction, and `IncomingNative.lean` for its actual preceding carriers. The new sheaf construction avoids an SF1 assumption of the Hom-sheaf conclusion. For a neutral object take F=G and y=x. The next step is to package the established sheaf/action/local-section data into the actual D0 torsor carrier, then glue on local gerbe objects with the earlier choice-independent natural transport. Do not replace full faithfulness or a coherent inverse strong transformation by a proposition field or pointwise family. Instantiate the existing nonconstant fixtures before claiming concrete site validation. No complete root-gerbe, H2 or profinite-limit proof is claimed.

## Public recovery and replay

The final suggested file contains the canonical sketch, not this payload.40 authenticated text artifacts are stored in its inert historical archive ancestor `88f47760c97bbdfcb5bf63a81bf32ff3d5a1e510`. Manifest SHA256: `fa3b2803cc6d8e9e35ae8b5d91e05042999470c260025c229329685dd426f2b3`. The script below fetches that public immutable blob, authenticates each artifact's exact bytes/line count and fetches the4 current deliverables at a supplied full40-character PR head. It checks that the recovery script being executed is exactly the one in the current public handoff. No private path or later scratch access is needed.

Save the exact fenced script as recover.py in disk scratch. Run `python3 recover.py RECOVERY_DIRECTORY FULL_PR_HEAD`. In an existing clone, run `PYTHONDONTWRITEBYTECODE=1 python3 RECOVERY_DIRECTORY/verify.py RECOVERY_DIRECTORY DECLARATION_INDEX`. Set `MODULI_VALIDATE_BASE=bfaee0037f9da3fb3e72daae67bc80620d1dce22` for the mathematical-base replay; omit it for the recorded publication base. Compare the JSON outputs exactly to verify-math.json and verify-pub.json. Recovery authenticates evidence; this verifier actually runs the immutable checker, intake and assembler but does not execute Lean. Optional serial Lean replay uses `run-lean.py Native.lean EXISTING_EXACT_MATHLIB_BUILD native-replay` and the analogous MathlibCanonical command; honor the20GiB floor and1200-second timeout, never create/build a project.

The manifest authenticates these six replay helpers:

- verify.py: `7ca8ca087a2baec4270ca89d2f9f42e2a3674d4fecaf968a4f24bae03076e0a7`.
- graph.py: `2678ea587d981137eeffb36f7e1d825d82f8d004ec28197e76a7f986443e0820`.
- projection.py: `e85ce32978cb840adb6bb8024942f10b9adb43a04d683e60cd25c117b096a13a`.
- immutable_view.py: `3f54d96cb030713615be9fc7662ff206f56638fd02ec7f2bd067886d9941d7e3`.
- run-lean.py: `76e439c62960e9c32f553e550b9e7dbc0826cf0c7e8d178f1c75d24adbdb78c8`.
- make_packet.py: `57fa490bc41a6cd33317d52be2faf5c5f262f9393fab84e9e89f6b1b890b2269`.

The archive also includes incoming recovery/executed-verifier receipts, old/new native and canonical sources, input guards, the complete incoming packet/reader/sketch/handoff, new plan, typed tests, source reading receipt and raw checker/graph reports. There is no claim that merely authenticating an artifact re-executes its proof or validates every historical mathematical conclusion.

## Script: recover.py

```python
"""Recover public, hash-authenticated evidence. This does not execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True)
HEAD=sys.argv[2];assert re.fullmatch('[0-9a-f]{40}',HEAD)
ROOT='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
STEM='AlgebraicModuliForArithmeticGeometry--A0-extension'
ARCHIVE='88f47760c97bbdfcb5bf63a81bf32ff3d5a1e510'
MANIFEST_SHA='fa3b2803cc6d8e9e35ae8b5d91e05042999470c260025c229329685dd426f2b3'
EXPECTED={'packets': 'bada4c4e2ba2a20eae3cde75b6604e60d124c599196ce393ce817dc6f2a1d725', 'readmes': '4acb79e22473f77304f6f9bf7df8abe6430e3c8f870df91b7b84507ebdfd6171', 'suggested': '2951c5bde1aef713ab01e9b3f9b86b262b745b931e4cbe661adabddd958e5b64'}
sha=lambda b:hashlib.sha256(b).hexdigest()
def fetch(ref,path):
 with urllib.request.urlopen(ROOT+ref+'/'+path,timeout=60)as r:return r.read()
raw=fetch(ARCHIVE,'research/blueprint/suggested/'+STEM+'.lean').decode()
payload=json.loads(raw.split('/- BEGIN ARCHIVED GERBE SHEAF ASSEMBLY PAYLOAD\n',1)[1].split('\nEND ARCHIVED GERBE SHEAF ASSEMBLY PAYLOAD -/',1)[0])
def unpack(name):
 b=zlib.decompress(base64.b64decode(payload[name]['data']));assert sha(b)==payload[name]['sha256'],name
 return b
mb=unpack('artifact-manifest.json');assert sha(mb)==MANIFEST_SHA;meta=json.loads(mb)
assert set(payload)==set(meta)|{'artifact-manifest.json'}
for name,m in meta.items():
 assert Path(name).name==name
 b=unpack(name);assert sha(b)==m['sha256']and len(b)==m['bytes']and len(b.splitlines())==m['lines'],name
 (S/name).write_bytes(b)
(S/'artifact-manifest.json').write_bytes(mb)
public={}
for folder,ext,name in [('packets','json','Candidate.json'),('readmes','md','Reader.md'),('suggested','lean','Suggested.lean'),('handoff','md','Handoff.md')]:
 path='research/blueprint/'+folder+'/'+('BP-'if folder=='handoff'else'')+STEM+'.'+ext
 b=fetch(HEAD,path)
 if folder in EXPECTED:assert sha(b)==EXPECTED[folder],path
 (S/name).write_bytes(b);public[path]=sha(b)
assert (S/'Suggested.lean').read_bytes()==(S/'Canonical.lean').read_bytes()
fence=chr(96)*3;handoff=(S/'Handoff.md').read_text()
code=handoff.split('## Script: recover.py\n\n'+fence+'python\n',1)[1].split('\n'+fence+'\n',1)[0]+'\n'
assert code==Path(__file__).read_text(),'Executed recovery script differs from current public handoff.'
(S/'recover.py').write_text(code)
receipt=dict(head=HEAD,archive=ARCHIVE,artifactsVerified=len(meta),helperHashesVerified=6,publicDeliverables=public,recoverySha256=sha(code.encode()),LeanExecuted=False)
(S/'public-recovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
