# DESIGN-JacobianChallengePartII — planning pass

Worker: Codex (GPT-6), session codex-rtOQ9t. Refs #3341. Immutable input base: 9b985e57678802ebb9aac4550b50651e1790cadf.

All eight stages JC0–JC7 are **planned**, with the 24 routed requirements covered. The complete planning pass has 48 declarations: 4 definitions, 13 constructions, 10 lemmas, 11 theorems, 8 comparisons and 2 applications; 54 API items, 51 unit tests, 24 planets, 11 pinned baseline declarations, 14 gaps and 12 supplier requests. No stage is closed; every implementation status remains unchecked. Refinement stops here because every target is planned, as required by PROTOCOL section 0. The packet and definitive reader contain the individual hypotheses, proof steps, dependencies and remaining obligations.

## Boundaries and next work

JC0 imports the generic relative Picard sheaf and plans curve-specific degree components, representability and torsors. JC1 plans the section-free relative Jacobian and principal polarization. JC2 plans Abel and difference maps, including degree-one immersion and finiteness only for nonzero degree. JC3 pins the negative Poincaré addition formula, normalized twice-theta and the five field identities. JC4 distinguishes actual Picard classes, relative Picard sheaf sections, algebraic equivalence, two-projection conditions and Brauer obstructions. JC5 plans the canonical shift and Faltings–Zhang morphisms. JC6 uses semi-abelian generalized Jacobians for stable Hodge comparison. JC7 applies the generic construction to the imported fine-level universal curve.

The follow-up must resolve the 14 named gaps and 12 exact requests in the packet. These include Picard representability proof inputs, principal-polarization descent on nonreduced bases, the relative Abel immersion bridge, sign and normalization comparisons for Poincaré bundles, algebraic-equivalence interfaces, two-projection-preserving lifts, stable relative duality, and genuine geometric prototype interfaces. Suppliers are imported from the parent Jacobian roadmap, AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, and the proposed StableReductionPartII fine-level nodes. None of their mathematics is replanned here.

The candidate alone has exactly one pending accepted-atlas link: StableReductionPartII:MC.4 → JacobianChallengePartII:JC7. The supplier stage is proposed, but is not yet in the accepted atlas at this base. A combined proposed assembly, with the supplier created before its consumer, resolves that link and is acyclic: 3,082 stages / 8,821 edges; the prerequisite closure is also acyclic, with 3,551 vertices / 10,287 edges. All 48 required supplier pairs are reachable. No candidate links are skipped, no prerequisite endpoints are unresolved, and foreign mathematical payloads are preserved. Independent acceptance of the fine-level supplier must precede integration of this edge. MC.4 is an application input and never an input to generic JC0–JC5.

## Source and compilation evidence

The source reading receipt names actual passages, versions, hashes and access dates. Read Yuan's author manuscript pp.29–32, 35–39, 43–44, 98–99, 109–111; DGH arXiv v3 §6.1 pp.23–25; Milne §8 pp.27–28; and the BLR public scans listed in the receipt, including the Leray sequence, Picard Lie comparison, relative curve Picard theorem, and generalized Jacobian/canonical-theta statements. Full BLR representability prerequisites, MFK Proposition6.9, Serre's autoduality proof and Zhang's cited cube-law results were not established. Their obligations remain explicit gaps. No full-book, full-paper or published-typeset collation is claimed. The degree-zero finiteness correction is the already confirmed PAPER-YUAN-26/E13, scoped to the author manuscript; no new published erratum is asserted.

The entire published 387-line suggested file was compiled once using an existing build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Lean 4.34.0-rc2. Fresh preflight reported 37 GiB available. Serial compilation used one thread and an 8,192 MB limit, exited zero in 5.10 seconds, used 3,379,752 KiB maximum RSS, and reported only eight intentional admission warnings. It checks **one native represented-point triangular equivalence, four API signatures and three examples**. The 47 geometric nodes are individually omitted under PROTOCOL section 13, with their exact names/statements retained in comments. They are not replaced by arbitrary propositions or synthetic carriers, and their signatures were not compiled. There is no Lean implementation claim and no Tau Ceti import compilation claim.

## Reproduce this pass

The six compressed artifacts below contain the target worklist, reading receipts, compilation receipt/log and immutable-base validation report; no PDF or extracted source text is included. Four authenticated Python helpers follow. Recover the actual public five deliverables by running recover.py with a fresh on-disk output directory and the published 40-character commit. Inspect the scripts first. Set TAUCETI_REPO to an existing checkout containing the immutable base and TAUCETI_INDEX to the declaration index at the pinned libraries, then run verify.py with the recovered directory. The validator imports the repository's actual checker and atlas builder through a read-only Git-blob adapter and must reproduce Verification.json exactly. It does not execute Lean. A separate serial compile-pass.py accepts the recovered directory, existing pinned Mathlib build, existing Lean executable and Published.lean; it checks pins and fresh available memory before compilation.

The local source PDFs, extraction libraries, intermediate notes and scratch are disposable after publication. All evidence referenced by this handoff is recoverable from its public metadata and the five public deliverables.

<!-- JACOBIAN PLANNING PASS METADATA
{
  "base": "9b985e57678802ebb9aac4550b50651e1790cadf",
  "helpers": {
    "verify.py": "e77107acea32cc40a06ab3531be60c255dbef4d674c6fa73e9df673baea514c7",
    "immutable.py": "f4fe5f25af3bdecd0550e29f4f2905c8f6d591b37803b60a6a7cebb96378358a",
    "compile-pass.py": "38d7e56d08ab81d7db0aa1afc7ef7455e433d88235ab818ca28c75d4cbfda8f9",
    "recover.py": "9587ff025b1aad989ad5bd39c9fc9367a0366b4ebf5ca88ede5e5c57def5cfda"
  },
  "artifacts": {
    "Worklist.json": {
      "bytes": 21508,
      "sha256": "72632c39690d6830002780fb7c5e3bfe59da1589646d6bd3421295b525f689d2",
      "data": "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"
    },
    "SourceReading.json": {
      "bytes": 7245,
      "sha256": "2ea853da8eb21d585cb73fd27e7804b8ce143e42bc0e6ef8bbaa3d348eb65d8b",
      "data": "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"
    },
    "BaselineReading.json": {
      "bytes": 4033,
      "sha256": "6c337f64e1fa7a0fb8e884b1628b2f064ad68188a9dc249c68ae1673be6f4175",
      "data": "eNrtlk1v5EQQhu/5Fdacdz39/RFO2awISESsSAQHhFBVd/WMkT8G2xMRIf47NTMsuwt4peSWEQe3Zbvr7dZT5bfrx4uq+p2vqlqNVFaX1WqGfaK5ubyH/TXf66t2QzhCk25o6GgeH+uv+wca5wZbutsSlNWrU3w35H1LB4m/Qtf/Cl1/0/T0Zt/nltZvYGpS3RL07wWmLSjrDgJgUYOxORdNLgdKRNpEdBAsPzkdpFQePRYkByZ7Ack7mYQ2gjQZ/V5xJMgHPSWUey3Fa2H+3izN2+H47SrNe2iraYaZOurn6hBUwVzNW6p2Td9TrqZhPyaq0tB1zfxFlSm1MMLcDH3V9Jl+O4474qGf20dWmIb2gaajRNm3bdVDR/WKl/7j1TOAf6B23cI0PRP4MXYBOBKgTaB9CEqjizkLobK0QZVobIneURLCMn8VklZYdASPGDwmITWaMwP+jwqvZ+qnYXw3MvA0PxP//ccaC2koLhajiUQJJZhcyBblrMhgHUaTos2ICEqA8QUD5CCtlaFY/ogAIp9ZGu7Slrf2AzXt2+ahYXr1SC0v/0BvaTMSPSUTH6msT7rrk8hCKlzSRjrpnFcJfdJgCT0DdyImLUiEYMEbISGhouJ0zkCyKB8wIURjzjIV9e2R9FRfD9uhG9ph8/iUHHyI+qz728gulFEFF5SUSeXgrM3RFCGLMVZwzaeEQTFlQlOACpuTgRQMm5aX6szQXyG1DfTfw9jQ/CTen0Z+lrlO2dlY+HTVDqXlAziDMpE9X9psQXjnhEIrpXHZJVkoZswuHrCnYsTLYt7BvG0bvFws87Lblftht1Dgt6fw/wB+18w0rb/c/bqEWdkQZQCQqSTlslXGKGu9kfwmOsCcTYkiFuHROJEwe0mgBXc92hYvwrlg7oZh3j6F7O0w7rbN1E3rU+wC30TcNhKxSShCkY2J/mAS0UqAYopXhoyA7AHIM09ubojpOwHRcz0HfJF8r1n9u6bf1O+atMz0MON+SwPD5Hkw5ptx2O8WOEotdFae/3hmJtgJXHIWUB1KsVg+55Q1JKUMwmlIwqvC3XcRLnE1awruZXLkDWyYz4lS/dXQ1ZsDo2Wmn0ZwkfZDk6Hl9yMbAVvv+mZcQpxiJO6uucdmf9Uh8Z9OQiNalD5ITcpSIBHZgg1GiVYAkcLDKciFyhPPATHT+RZ/qXnN3c+5efgf9BNBX/x08SeIUujV"
    },
    "Compilation.json": {
      "bytes": 580,
      "sha256": "30411f5bf07e36ff482d16ab068a08c6e2c599177eca80e895d0cee50fbe3092",
      "data": "eNpFkc2uEzEMhfd9imjWFcp/JpcVPxJCbBB9gsR22kiZSclMSxHi3cncqbhLfz4+so//HBgblnprQKdLkMYOL2wYEcGDDagSeSXcuAErlBQyCZGclV5rlzwYD4r7CEE7LtHa4MnxRMNxcy31/GapolJCobYhaQsjJJ+6i0EQWvjoDSllgKRyFkBhwqhGKZX10iiLUbjdkh55/VSRuiPfQWu1Lf/LX6HNeT5vYHwFAae8roSfCUpoYc11fmvSI0zXQhtQu/oecgmx0Jf8cYNul5VwXQi3K/gLN+8E35eZwuPH6fRtlyrnnZFPvl5Kjq/6UZJE5WiMXFulBQeMRkkSQgBqhSZYK5x+BkZh3qZsEDz0jKSMFJAgRIyRe+FBRsOl0P0ByQvcp6BO11wIT1CvWzBDnYnN/dQ7Mai1Ye4FMfp5y/dQaAY6stQfzj58/8qWfO7dW6PlyNZLo657hvKeacfOVCdaWwY299SX3ryWDHktv1ndgx0Ofw//ADrMpmA="
    },
    "CompilePublished.log": {
      "bytes": 1685,
      "sha256": "3b3313d46af46c8cf9f6295dc1419b95e335ce2376cc3dfdb38223692536db17",
      "data": "eNqlVNtu00AQfU6+YhQVqZWa1LcktXkqUYFKLRQKvCBE1/Yknma96+6umwTEvzPrFIEorZDyEmd3zpk5O7fvg8bgXNKicoMMBhYNCQm4JutILaAhpbCEvCVZDg5hIO4ESZFLfEUvGB9P+a4RxVIs0PL586CRorXEAI8+R6GuUJiimklC5fwd1Y027pURTeWPjdF6vqJygc52AdDqxv95d+t/c+EcS2LnX/ika+Jj2QVijxkoDYWuG5KsUVJuhNlASQYLp83mOZsdkAIkV6GBosJiycCtAiYq7LxKVvkJjSWtfAq8aNi/215AMoqTUTA0RXQI6+PJ10kybNVS6ZUaSlLterhQ7aEXwdJgIsJAFMdFFOUoSixEXuZ5kIZpEeXjIAqT6SSap2F5CO+Ro1o8GPzo713N3p98mL0+umxzSbbCcuQVZWGaJRmshFFciAzYnRRGOC+qtWjh2mpjNteP8qMkm+zEn+7Gj4Md+TvqT4Is2Ikf78hP/4/fm3HzCMVDhn7iHNVYchv6r24dhFEQwN756ckbGN6EMLw4DtMIHgk66Pc+8gh3TmDfIvd4aQ8yCEdR0u9dbazD+oExGKVBv3eJpuARBT2H2eVHcBVZuNE5LLTLIIme9XunUjSW52d/JaSEQupieXDvrMrqOrMWtAH/9U6zYDwK2e8JTxJvB7CVMEx2uHZg6RuTlvnGYYf9jWrVPa4UTjyBs46XzhN2px2vsYf2C7Gmuq3BoKXSP9fiAzlxPE2n4+i3s6fAnc8bfve+wduWjC/h2dHbA2g8cy5a6SznP47ClJGktkhuBao9VMDciBr/gh/H6Xja733SslXO7zQu1TZxK3K8xhgSB9Nk3O+dqbsnQOF4wlVfcdk6oS95T4LdNgGppvWhkkk8Sf1j/zRy322tTLriMvOza7TWL3nOgXL/NPCrkO5873ojLZSQlrte8p25v73sStcl8Ff+kiBljadr3p5cU9d2QX8C68IrbQ=="
    },
    "Verification.json": {
      "bytes": 2112,
      "sha256": "d55abec4902bca5f01cbdbbbd5a5bad09ed4e893920df4fdc5b405cee0e1292d",
      "data": "eNp9Vk1v3DYQvftXCDq1gGGIpChK7sndFIHTpll4cwty4Mdol7VEqRTXHwjy3zPkSvK6qHNZQI/D4fDNm8f9dpFluZIT5NdZ3qim5sBFJeq6oKBUI6UuOS8ULypOgIim0NK0+WXcpQ+g78Hjxm/4icAo8TvERBvpjDUywNU/0+BSOK77QZpejjHgg9SDstJtDrLrwO1hK324vV0ipyDDcYqBeujHDgIsK24wEBfKegburTPTWgMCBlrrbLB4LoZdLnAHfS8RIcUKhQMMHvoIkhXUg5uCP+o5AWFnK/0ovZ0SXq+wHMfOajnH0wR/n4uTo70N0Mf6+FxKfsTiPsMUEjifm4+ddJAgusTFpnTWwTvQnfQp/3RWaj568PDv0U42wCsCIkXZL6o7wuitC7/imlirRWb3sde8unwdHw52yk4djDtqvq4vhUQ6X91uL8dU0VJxLGe+GKEvndzDdOt2ehjhhbcZ33TDBAbh4hW8RTZcwuuL+bgcvB98TP3la/p+lN5Ztz9D/HAMYBa+TzzmQ28Don8vsklM5A7pfIAFTIyejn538/5Fzw/gg9UphBX1ciMw+wTVNV1aIfWzRg0giMqBteTh0cUj3sq5SnjNyH+eb4ocmjdL5KualoSkoLX4ec4kIQ9md4wyBr+V1r8Uh2L1MA3dQ2rGzDNea3dvRyzlL+vuzxqgj96DCzfTBL3qnreAJuD2a1Cq48uiql2QqoM7MKdRO83/9cfNVZmvynvDJa4/bESeYr7i73z20CvU6HqPt4o4Rbc493bvPkq0gB61oGW3lc8d+tO0xQuDP104MnXSCzz+YZKOtTV4xU+ue/48fHp0d6ulrbHRJmy3+MHcp2k4eg27g6S8irZWG6MbXUnDWmgYQb9FoCKMEtoS0oqKNmUp2kbzRrOiUVqWoqCmqmQDomhXO+yG/UtSphgjzJSVbMtK17ptWszDjSYlQWvnwBjXQJmotGamNYrVlLKqoZxVRhGxJIUnGzYo3LO5XKdvAc7Gb5ExMpFm7T+Gtar8SUYrT1JddjxIZApl8N7+HuFFq9Chs6QO5MV1wa9IsZTWy6e73e7PUzgTjeB0XQmHzqq0p6ZADRNQq6KsWEkKbRRnFAgh2pTMcFlVRJQriSBjq/JKkkIib5QqkAa0VEapoiGNpvgAUlJiW9qGmGXfqdOoudnb8sFBdrKWTA+DR+HhE5jFCXuQqF8Nl1mLQshutrfZhPrDRw7VdpmFgweMmwn6DV0q28PQQ/BWZ+nFw8X4ytjQPWezpeXrDNu+P87TJM0WeUi0l+z/F1/0ootacipKYepWgdamFQ1nhlYVKwgVuip02QiCumwLZBH9pSmEVm2rhcZ/A1jB94sfxOtQNA=="
    }
  },
  "publicHashes": {
    "research/blueprint/roadmaps/JacobianChallengePartII.json": "a6ebcf044e1bd1a0aa0e8dac3fc7027a0f50720e16f717d9dcfdb13290c20902",
    "research/blueprint/packets/JacobianChallengePartII.json": "adf8e973a3ed02ad43124c39904928d03b34e559ab834a275a252b45337d00ec",
    "research/blueprint/readmes/JacobianChallengePartII.md": "630fa6d551abfef4d0e916d091f7c82fd89e93f3db947ff3747dc84de0bf821c",
    "research/blueprint/suggested/JacobianChallengePartII.lean": "8ddc9c6ad3fe931788ddc613212f11f7629447f9c59c309bca4702d66a9e70fe"
  }
}
END JACOBIAN PLANNING PASS METADATA -->

## Script: verify.py

```python
"""Read-only validation of this new roadmap against the immutable publication base."""
from pathlib import Path
import collections,copy,hashlib,json,os,re,sys
S=Path(sys.argv[1]).resolve();R=Path(os.environ['TAUCETI_REPO']).resolve()
RID='JacobianChallengePartII'
BASE='9b985e57678802ebb9aac4550b50651e1790cadf'
os.environ['STABLE_VALIDATE_BASE']=BASE
sys.path.insert(0,str(S));import immutable
immutable.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,blueprints,build
p=json.loads((S/'Candidate.json').read_text());d=json.loads((S/'Candidate-roadmap.json').read_text())
reader=(S/'Candidate-reader.md').read_text();lean=(S/'Published.lean').read_text()
ids={n['id']:n for n in p['nodes']};ownstage={RID+':'+s['key'] for s in d['stages']}
assert len(ids)==48 and len(ownstage)==8
assert p['status']=='complete' and all(c['status']=='planned' and c['remaining'] for c in p['coverage'])
assert len(ids)<check_blueprint.NODE_BUDGET==300
assert all(n['implementationStatus']=='unchecked' for n in ids.values())
assert d['area']=='arithmeticgeometry' and d['parent']=='tauceti:TauCetiRoadmap/JacobianChallenge'
assert p['part'] is None and set(p['scope'])==ownstage
assert all(len(n.get('tests',[]))>=3 and n.get('api') and n.get('uses') for n in ids.values() if n['kind'] in {'definition','construction'})
assert {t['kind'] for n in ids.values() for t in n.get('tests',[])}<={'computation','degenerate','compatibility','characterisation','non-example'}
for n in ids.values():
 assert n['id'] in reader and n['statement'] in reader
 for a in n.get('api',[])+n.get('tests',[]):assert a['name'] in reader and (a['name'] in lean or n['id'] in set(p['prototype']['nativeNodes']) and a['name'].split('.')[-1] in lean)
native=set(p['prototype']['nativeNodes']);omitted={x['nodeId'] for x in p['prototype']['omissions']}
assert native|omitted==set(ids) and not native&omitted and len(native)==1
assert lean.count('OMITTED NATIVE INTERFACE: ')==len(omitted)==47
assert len(re.findall(r'\bexample\b',lean.split('/- OMITTED NATIVE INTERFACE:')[0]))==3
assert not re.search(r'def\s+\S+\s*:\s*Prop|\w+\s*:\s*Prop\s*\n',lean)
for text in [reader,lean,json.dumps(p),json.dumps(d)]:
 assert not re.search(r'/(?:home|tmp|Users)/|file:'+chr(47)*2,text)
routes={}
for fn in ['PAPER-YUAN-26','PAPER-DIMITROV-GAO-HABEGGER-21']:
 for route in json.loads((R/f'research/blueprint/papers/{fn}.result.json').read_text())['routes']:
  if route.get('roadmap')==RID:
   for x in route['items']:routes[x]=True
rc={x['itemId']:x for x in p['routedCoverage']}
assert set(rc)==set(routes) and len(rc)==24
assert all(x['nodes'] and set(x['nodes'])<=set(ids) for x in rc.values())
gapids={x for g in p['gaps'] for x in g['neededBy']}
assert all(g['detail'] and set(g['neededBy'])<=set(ids) for g in p['gaps'])
assert all(q['need'] and q['neededBy'] and set(q['neededBy'])<=set(ids) for q in p['requests'])
context=list(check_blueprint.world())
context[1].update({s:RID for s in ownstage});context[2].add(RID)
context[3].update({n:('blueprint',RID,'Candidate.json') for n in ids})
index=check_blueprint.load_index(os.environ['TAUCETI_INDEX'])
errors,warnings,summary=check_blueprint.check(S/'Candidate.json',index,tuple(context))
assert not errors and not warnings,(errors,warnings)
summary['packet']='Candidate.json'
packets,docs,definitions=blueprints.load_promoted(R)
assert not any(x[1]['roadmapId']==RID for x in packets)
supplierpacket=json.loads((R/'research/blueprint/packets/StableReductionPartII.json').read_text())
supplierdef=json.loads((R/'research/blueprint/roadmaps/StableReductionPartII.json').read_text())
def assembly(candidate,supplier=False):
 build.load_promoted=lambda *args:(copy.deepcopy(packets+([('StableReductionPartII',supplierpacket)] if supplier else [])+([(RID,p)] if candidate else [])),copy.deepcopy({**docs,**({RID:'research/blueprint/readmes/'+RID+'.md'} if candidate else {})}),copy.deepcopy(definitions+([supplierdef] if supplier else [])+([d] if candidate else [])))
 return build.assemble(require_distances=False)[0]
current=assembly(True);currentown=next(r for r in current['roadmaps'] if r['id']==RID)
expectedPending=[['StableReductionPartII:MC.4',RID+':JC7']]
assert currentown['pendingLinks']==expectedPending and not currentown['blueprint']['skippedLinks']
a=assembly(True,True);b=assembly(False,True)
stages={s['id']:s for s in a['stages']};stageids=set(stages)|set(context[1])
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(ids)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks'), (ar[RID]['blueprint']['skippedLinks'],ar[RID].get('pendingLinks'))
# Suppliers gain the new consumer links. Their mathematical fields remain identical.
def payload(x):return {k:v for k,v in x.items() if k not in {'consumers','requires','prerequisites','stages','edges'}}
assert all(payload(ar[x])==payload(br[x]) for x in br)
bs={s['id']:s for s in b['stages']}
assert all(payload(stages[x])==payload(bs[x]) for x in bs)
se={(e['source'],e['target']) for e in a['stageEdges']}
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert oldse<=se and {e for e in se-oldse if not any(v.startswith(RID+':') for v in e)}==set()
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for u,v in edges:
  if v not in out[u]:out[u].add(v);indeg[v]+=1
 todo=[v for v in vertices if not indeg[v]];count=0
 while todo:
  u=todo.pop();count+=1
  for v in out[u]:
   indeg[v]-=1
   if not indeg[v]:todo.append(v)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:12]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(ids)
todo=list(ids);seen=set();edges=set();baseline=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for q in world[n].get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:baseline.add(q);continue
  edges.add((q,n))
  if q in world:todo.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,unresolved
edges|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
edges|={(q['supplier'],n) for q in p['requests'] for n in q['neededBy']}
def stageof(v):
 visited=set()
 while v in world and v not in visited:visited.add(v);v=world[v]['parentStageId']
 return v
required={(q,RID+':'+s['key']) for s in d['stages'] for q in s['requires']}
required|={(stageof(q),stageof(n)) for n in ids for q in ids[n]['prerequisites'] if q in world or q in stageids and not q.startswith(('mathlib:','tauceti:TauCeti.AlgebraicGeometry.'))}
required|={(stageof(q['supplier']),stageof(n)) for q in p['requests'] for n in q['neededBy']}
required={e for e in required if e[0]!=e[1]}
following=collections.defaultdict(set)
for u,v in se:following[u].add(v)
def reachable(u,v):
 todo=[u];seen=set()
 while todo:
  w=todo.pop()
  if w==v:return True
  if w not in seen:seen.add(w);todo.extend(following[w])
 return False
assert all(reachable(*e) for e in required),[e for e in required if not reachable(*e)]
comp=json.loads((S/'Compilation.json').read_text())
assert comp['exitCode']==0 and comp['errors']==0 and comp['warnings']==8
assert comp['sourceSha256']==hashlib.sha256(lean.encode()).hexdigest()
assert comp['logSha256']==hashlib.sha256((S/'CompilePublished.log').read_bytes()).hexdigest()
assert p['prototype']['compiled'] and not p['prototype']['geometricSignaturesCompiled']
assert p['prototype']['compilationReceipt']==comp
report={'base':BASE,'checker':summary,'errors':errors,'warnings':warnings,'routedItems':24,'omittedNodes':47,'nativeNodes':1,'stageDAG':dag(stages,se),'ownNodeDAG':dag(ids,{(q,n) for n in ids for q in ids[n]['prerequisites'] if q in ids}),'scopedDAG':dag(stageids|seen,se|edges),'requiredSupplierPairs':len(required),'unresolved':[],'ownSkippedLinks':[],'currentAssemblyPendingLinks':expectedPending,'combinedSupplierAssemblyPendingLinks':[],'foreignMathematicalPayloadsPreserved':True,'newEdgesIncidentOnlyToOwnRoadmap':True,'compilation':comp,'immutableReadPaths':len(immutable.READS),'immutableReadPathSha256':hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()}
print(json.dumps(report,indent=2))
```

## Script: immutable.py

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('STABLE_VALIDATE_BASE', '4c47f9957d8a4e9776f4890d87e2e802fdc13ee3')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## Script: compile-pass.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs)
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j1','-M8192',str(out/name)],env=env)
sys.exit(result.returncode)
```

## Script: recover.py

```python
"""Authenticate and recover this pass from public HTTP; never execute Lean."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
S=Path(sys.argv[1]).resolve();S.mkdir(parents=True,exist_ok=True);head=sys.argv[2]
assert re.fullmatch('[0-9a-f]{40}',head)
root='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'
sha=lambda b:hashlib.sha256(b).hexdigest()
paths=['research/blueprint/'+d+'/'+('DESIGN-' if d=='handoff' else '')+'JacobianChallengePartII.'+e for d,e in [('roadmaps','json'),('packets','json'),('readmes','md'),('suggested','lean'),('handoff','md')]]
def fetch(path):
 with urllib.request.urlopen(root+head+'/'+path,timeout=30) as r:return r.read()
public={path:fetch(path) for path in paths};handoff=public[paths[-1]].decode()
meta=json.loads(re.search(r'<!-- JACOBIAN PLANNING PASS METADATA\n(.*?)\nEND JACOBIAN PLANNING PASS METADATA -->',handoff,re.S).group(1))
assert meta['base']=='9b985e57678802ebb9aac4550b50651e1790cadf'
assert set(meta['publicHashes'])==set(paths[:-1])
for path,h in meta['publicHashes'].items():assert sha(public[path])==h,path
for name,m in meta['artifacts'].items():
 assert Path(name).name==name and name not in {'.','..'}
 b=zlib.decompress(base64.b64decode(m['data']));assert sha(b)==m['sha256'] and len(b)==m['bytes'],name
 (S/name).write_bytes(b)
f=chr(96)*3
for name,h in meta['helpers'].items():
 assert Path(name).name==name and name not in {'.','..'}
 code=handoff.split('## Script: '+name+'\n\n'+f+'python\n',1)[1].split('\n'+f+'\n',1)[0]+'\n'
 assert sha(code.encode())==h,name
 if name=='recover.py':assert code==Path(__file__).read_text()
 (S/name).write_text(code)
for path,name in zip(paths,['Candidate-roadmap.json','Candidate.json','Candidate-reader.md','Published.lean','Candidate-handoff.md']):
 (S/name).write_bytes(public[path])
receipt=dict(publicHead=head,artifactsAuthenticated=len(meta['artifacts']),helpersAuthenticated=len(meta['helpers']),publicDeliverables={p:sha(b) for p,b in public.items()},base=meta['base'],LeanExecuted=False)
(S/'PublicRecovery.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
```
