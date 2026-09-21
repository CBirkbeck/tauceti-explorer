# Handoff: LINK-tauceti_TauCetiRoadmap_Chebotarev

Worker: **ChatGPT Pro — cgp-780fc5e50f71**. Session: `cgp-780fc5e50f71`. Issue: **#21**. Date: **2026-09-17**.

## Ownership, status and authorised files

Claim comment `5696786549` was accepted by workflow comment `5696801432`, explicitly naming this session. The resumption comment `5696843282` supersedes the earlier stopped-run checkpoint. Ownership was re-fetched before work; no competing claim was found.

Outputs: `research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json` and `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_Chebotarev.md` only. No source README, queue, other packet, reserved ID or integrated data is changed. No git command or Lean implementation was run or added. `implementationStatus` is unchecked.

The packet is **complete as a catalogue-wide link screen**, not as a mathematical proof, implementation, independent review or integration. It proposes **15 links: 6 incoming and 9 outgoing**, and **3 overlaps**. The eight source/interface issues below require follow-through by their owners.

## Input provenance

Input repository commit: `dbafc759460581dbd23999a3c112149fedefe2b5`; tree: `0b949ee9f24604fcf6e5378fab63f6b255cac347`.

The source snapshot was downloaded through the authorised GitHub Actions artifact route: Pages run `35210869629`, artifact `10491219312` (`github-pages`). ZIP SHA-256: `42073dce6a2708590def6f040b6b88fa988a03f7ca5bf1da18b9314b8cbadfb7`. The hash was computed on the downloaded ZIP and matched the artifact metadata. Its `artifact.tar` provided the actual atlas, small extracts, source documents, other packets and unmodified validators.

The canonical input is `data/atlas.json`, not site-build summary metadata: 212 roadmaps, 1,968 stages, 3,508 stage edges. Six additional definitions under `research/blueprint/roadmaps/` bring this screen to 218 roadmaps and 2,007 stages. All six definitions and all 25 other link packets present at the input revision were included in the duplicate/cycle audit.

Baseline pins read from `research/blueprint/baseline.json`: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This is a roadmap-link audit, not an independent declaration-baseline audit. Statements in source READMEs about existing Lean coverage were not adopted as new baseline claims.

Updated BROWSER_AGENTS.md, blueprint PROTOCOL.md (including sections 10 and 11), UPSTREAM_GUIDE.md, expansion PROTOCOL.md and atlas/README.md were read. `FoundationsAndLibraryIntegration` is retired and is never proposed as a supplier.

Pre-submission revalidation: main `66e35f2051d4e49644701ad398112de45095d315`, tree `8cafee097bcb1f523231122fcb97153fe9ae14e0`. The GitHub comparison against the input revision contains only AUDIT-24/AUDIT-25 results, their review reports, queue and ledger changes. No roadmap source, atlas extract, definition, other link packet, validator or authorised output path changed. Those unrelated audit reviews are not newly adopted baseline evidence. The branch is `cgp-780fc5e50f71/link-chebotarev`.

## Target inventory

All fourteen Chebotarev stage descriptions and the full source document were read. This inventory records the interfaces used to screen candidates.

| Layer | Required input | Output being mapped |
|---|---|---|
| Layer 1 | Finite Galois number-field extension; NFA Artin symbol and prime-relative tower laws. | Conjugacy-class powers, membership/composition/functoriality; Frobenius transport and splitting-completely comparison. |
| Layer 2 | Artin symbol with unramifiedness; ramified support finiteness; nonzero prime carrier. | Frobenius prime sets, proof independence, finite unramified partition and finite ramified exceptions. |
| Layer 3 | Canonical prime sums, ideal Euler product, convergence of higher prime powers; density calculus. | All-prime/logarithmic denominator dictionary and finite-error, upper/lower-density versions. |
| Layer 4 | Cyclotomic extensions and arithmetic Frobenius; modulus/ray-character carriers; multiplicative ideal weights. | Cyclotomic Frobenius formula, abelian characters, conductor comparison, zero-at-bad-primes weight and Euler/orthogonality identities. |
| Layer 5 | Ray-class-by-class uniform ideal count and nontrivial-character cancellation; Abel summation; positive combinations/Euler logarithm. | Named cyclotomic character-series continuation, trivial-character pole, nontrivial nonvanishing at one. Whole-line nonvanishing needs its explicit argument. |
| Layer 6 | Cyclotomic character orthogonality and Layer 5. | Dirichlet density of each cyclotomic fibre and arithmetic-progression comparison. |
| Layer 7 | Arbitrarily large q=1 mod n, finite ramified set; cyclotomic total ramification and Galois correspondence. | Auxiliary prime with full degree, disjointness/compositum product, tagged cyclotomic fixed fields; tagged singleton use needs abelianity. |
| Layer 8 | Prime-relative Frobenius tower laws; splitting/double-coset arithmetic and cyclic fixed field. | Exact degree-one fibre card(G)/(card(C) * ord(σ)); finite exceptions above base ramified support. |
| Layer 9 | Cyclotomic densities, tagged union, exact fibre contraction, cyclic-group counting and finite-partition squeeze. | Abelian Chebotarev; exact auxiliary-level lower bounds tending to 1/card(G). |
| Layer 10 | Abelian Chebotarev and cyclic-fixed-field fibre count. | General number-field Dirichlet-density Chebotarev, infinitude of each class and finite-exception invariance; non-Galois/splitting/AP corollaries. |
| Layer 11 | Powered conjugacy classes, locally finite norm fibres, standard logarithmic prime-power estimates. | Lambda_C, psi_C, theta_C; nonnegativity/summability; four separate discard estimates and cyclotomic log-derivative identity. |
| Layer 12 | Whole-line regularized boundary, Wiener-Ikehara, degree-one weighted contraction and Layers 7–11. | Cyclotomic, abelian and general psi_C asymptotics; all-prime psi asymptotic. Euler deletion rescales zeta residue, not log-derivative pole coefficient. |
| Layer 13 | theta_C limit from powered-filter tail comparison; canonical prime count/Abel transfer. | pi_C(x)/(x/log x) tends to card(C)/card(G) and equivalent Li form. |
| Layer 14 | General pi_C and independently established all-prime count denominator. | Natural density card(C)/card(G), orientation/power/finite-error agreement tests; not deduced from Dirichlet density alone. |

## New relationships and ownership boundaries

CH-L01–CH-L05 supply Global Number Fields moduli (Layer 2), finite-order/ray-character conductor and carrier theory (Layer 9), ray-class ideal-count cancellation (Layer 3), and prime-conductor cyclotomic ramification (Layer 10) to Chebotarev Layers 4, 5 and 7. The factorization of a cyclotomic Frobenius weight through a ray character remains a consumer proof, not a consequence of naming the carrier.

CH-L06 supplies the Arithmetic Dirichlet Series Layer 5 density-zero estimate for primes of higher residue degree to the Layer 10 fixed-field contraction. It does not supply the weighted estimates used in the prime-counting branch.

CH-L07–CH-L15 send Chebotarev Layer 10 to ArithmeticGaloisRepresentations R01.5, ClassicalSerreModularity R27.1, EllipticCurveModularity R29.4, EndoscopicTransferAndUnitaryTraceComparison ET.3, EulerSystemsAndKolyvaginSystems ES.1, GlobalGaloisDeformations R04.5, HeegnerPointEulerSystems HE.5, IntegralHeckeAndGaloisDeterminants IHG.4 and PotentialAutomorphyInfrastructure PA.4.

These outgoing edges use finite-quotient Frobenius density/infinitude and avoidance of a finite set. They do not supply effective prime bounds, an arbitrary prescribed combination of Frobenius constraints, dual-Selmer annihilation, simultaneous nonzero localization, compatible-system existence, or nonreduced determinant recognition. The packet reasons identify the extra image, continuity, coefficient, semisimplicity and polynomial-law conditions.

CH-O01 recommends rescoping the underspecified AnalyticNumberTheory AN.4 Chebotarev/analytic-interface endpoint. CH-O02 keeps the GlobalNumberFields Layer 10 rational cyclotomic carrier dictionary distinct from the Chebotarev Layer 4 weight specialization. CH-O03 keeps general CharacterTheory Layer 3 column orthogonality distinct from the Chebotarev Layer 11 finite-abelian, powered-Frobenius specialization, with an explicit carrier comparison before a direct import is asserted.

No whole-roadmap merger is recommended. The proposals are ownership clarifications and a rescoping of AN.4, not permission to edit these other roadmaps.

## Existing relationships reused, not duplicated

The following 30 incoming links are already present in other packets. They are an inventory of submitted work, not a new independent approval:

- `tauceti_TauCetiRoadmap_NumberFieldArithmetic.json` (14): NFA Layer 1 → Chebotarev Layers 1, 7, 8, 10; NFA Layer 2 → Chebotarev Layers 1, 2, 4, 6, 7, 8, 11, 12, 13; NFA Layer 4 → Chebotarev Layer 2.

- `tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json` (16): ADS Layer 0 → Chebotarev Layer 4; Layer 2 → Layer 11; Layer 3 → Layers 4, 5; Layer 4 → Layer 2; Layer 6 → Layer 5; Layer 7 → Layers 2, 3, 9, 10, 14; Layer 8 → Layer 5; Layer 9 → Layer 12; Layer 10 → Layers 11, 13, 14.

Existing overlap entries are also retained in their owners: two in NumberFieldArithmetic (ramification support and cyclotomic Frobenius) and one in ClassFieldTheory (cyclotomic crossing). None is copied into the new overlap array.

The new definition `MordellLawrenceVenkatesh.json` already records Chebotarev Layer 10 in `requires` for LV.1, LV.6 and LV.11. These three candidate links were removed from the proposed array after checking the actual definition. LV.1’s Faltings/friendly-prime package, LV.6’s inert-prime application and LV.11’s simultaneous cyclotomic/auxiliary conditions still require their stated compatibility proofs; bare density is not their entire proof.

ES.1 also has an older opaque `UPSTREAM:Chebotarev` prerequisite. CH-L11 identifies an exact registered supplier without editing or silently deleting that placeholder. The orchestrator can reconcile the alias on acceptance.

## Reading ledger and negative decisions

Every stored roadmap summary was read, including all 60 upstream Tau Ceti roadmap records and every same/neighbouring-area record. Eight synonym families were searched over all roadmap titles, summaries, documents, and full stage titles/descriptions. The patterns are retained in the packet. Forty-seven roadmaps had at least one search-family match; 171 did not.

Full upstream documents read: Chebotarev, ArithmeticDirichletSeries, GlobalNumberFields. Their complete stage descriptions were also read. The full-stage reads outside those three documents are:

- `AlgebraicModuliForArithmeticGeometry`: R09.5.

- `AnalyticNumberTheory`: AN.4.

- `ArithmeticGaloisDuality`: R02.5.

- `ArithmeticGaloisRepresentations`: R01.5, R01.6.

- `AutomorphicCongruences`: L1, L2, L2s.

- `AutomorphicGaloisRepresentationsPartII`: AG2.3, AG2.7.

- `ClassicalSerreModularity`: R27.1.

- `ComplexMultiplicationAndExplicitReciprocity`: CM.3, CM.4.

- `DeligneWeightsAndPurity`: DWP.3.

- `EllipticCurveModularity`: R29.4.

- `EndoscopicTransferAndUnitaryTraceComparison`: ET.3.

- `EulerSystemsAndKolyvaginSystems`: ES.1.

- `EulerSystemsCyclotomicMainConjecture`: L1.

- `FiniteFieldsAndCharacterSums`: FF.1.

- `FunctionFieldArithmetic`: FA.5.

- `GL2ModularityLifting`: R22.2.

- `GeneralizedHeegnerCycles`: GH.5.

- `GlobalGaloisDeformations`: R04.5.

- `HeegnerPointEulerSystems`: HE.5.

- `HilbertModularVarietiesAndShimuraCurves`: R18.3.

- `IntegralHeckeAndGaloisDeterminants`: IHG.4.

- `LocalGaloisDeformationRings`: R08.6.

- `ModularCurvesPartII`: R14.6.

- `ModularIwasawaMainConjectures`: L2.

- `MordellLawrenceVenkatesh`: LV.1, LV.11, LV.6.

- `OrdinaryAutomorphicFormsAndModularityLifting`: R21.4.

- `PotentialAutomorphyInfrastructure`: PA.4.

- `PotentialModularityAndCompatibleSystems`: R23.1, R23.5, R24.5, R24.5:operations.

- `RankZeroOneBSD`: BSD.6, BSD.6a.

- `RefinedTraceMethods`: RT.2.

- `tauceti:TauCetiRoadmap/AlgebraicCodingTheory`: Layer 3.

- `tauceti:TauCetiRoadmap/ClassFieldTheory`: Layer 10, Layer 11.

- `tauceti:TauCetiRoadmap/Multiquadratic`: Layer 1.

- `tauceti:TauCetiRoadmap/PolynomialGaloisGroups`: Layer 5, Layer 6.

- `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory`: Layer 3.

The `examined` array contains exactly one record for each of the 218 roadmaps and distinguishes full endpoint reads, contextual inspection and negative summary/search screens. It does not claim all 218 full documents or proofs were read.

Important negative decisions: function-field/geometric Chebotarev (FA.5 and DWP.3) needs constant-field/degree or geometric conditions not supplied here; PolynomialGaloisGroups Layers 5–6 explicitly ask for certificate soundness, not certificate existence or a terminating search; multiquadratic and CM splitting laws at given primes are not prime-existence requests; a given split auxiliary prime in a cohomology theorem is not automatically a new prime-selection target; cyclotomic Frobenius in trace methods is not number-field Frobenius.

Transitive consumers preserve their existing owners: GL2ModularityLifting and ordinary modularity use R04.5; EulerSystemsCyclotomicMainConjecture uses ES.1; integral determinant consumers use IHG.4. Shared “Taylor–Wiles”, “orthogonality” or “positive density” vocabulary alone was rejected.

## Source corrections and unresolved contracts

### CH-S01 — source-correction

Locations: `content/tau-ceti/Chebotarev/README.md`, Layer 12.1, ramified Euler correction.

The assertion that deleting finite Euler factors preserves the same zeta residue is false. Write P(s)=product over bad primes of (1-Np^(-s)). Then L_1(s)=P(s) zeta_K(s), so Res_1 L_1=P(1) Res_1 zeta_K. For K=Q and bad set {2}, the residue is 1/2 rather than 1. The needed conclusion survives: -L_1′/L_1=-zeta_K′/zeta_K-P′/P has pole coefficient 1 because P is analytic and nonzero near 1.

**Required follow-through:** Correct the source residue sentence and record the multiplicative Euler factor; retain pole coefficient one only for the logarithmic derivative. No source file is edited by this link job.

### CH-S02 — proof-interface

Locations: `content/tau-ceti/Chebotarev/README.md`, Layers 5 and 12.1; final analytic-boundary ownership paragraph.

The end-of-document ownership contract assigns whole-line nonvanishing to this roadmap, but Layer 5’s explicit exports only give analyticity and nonvanishing at s=1. These do not prove a continuous regularized boundary function on the whole line Re(s)=1 as consumed by Wiener–Ikehara.

**Required follow-through:** Make the theorem and proof on the entire boundary line explicit, including agreement and summability on the open half-plane, before claiming the Layer 12 analytic input is established.

### CH-S03 — hypothesis-precision

Locations: `content/tau-ceti/Chebotarev/README.md`, Layer 7.5 tagged fibres and Layer 12.4 weighted crossing.

Layer 7 initially allows general finite Galois L/K, but the description later calls Gal(M/K) abelian and treats singleton tagged fibres as such. The product-group and tagged fixed-field constructions may be used more generally, but the singleton-fibre disjointness explanation and abelian squeeze must explicitly carry the abelian L/K hypothesis used in Layers 9 and 12.4.

**Required follow-through:** State the abelian hypothesis at the tagged-fibre and weighted-crossing consumers. Keep the general conjugacy-class theorem downstream of the cyclic fixed-field reduction.

### CH-S04 — coefficient-adapter

Locations: `content/tau-ceti/Chebotarev/README.md`, Layers 11.1, 11.3(1), and 13; `content/tau-ceti/ArithmeticDirichletSeries/README.md`, Layer 10.

Lambda_C filters Frob(p)^m, not a fixed set of unpowered Frobenius primes. Thus psi_C is not definitionally the standard primePsi of frobeniusPrimeSet. The correct route is the Layer 11.3(1) termwise majorization by the all-prime higher-power tail, followed by the elementary limit comparison and the generic theta-to-count theorem.

**Required follow-through:** Expose that adapter instead of claiming the standard fixed-prime-set psi-to-theta theorem applies verbatim. Coordinate with the existing ArithmeticDirichletSeries link handoff rather than duplicating its generic API.

### CH-S05 — conductor-adapter

Locations: `content/tau-ceti/Chebotarev/README.md`, Layers 4–5; `content/tau-ceti/GlobalNumberFields/README.md`, Layers 2, 3, 9–10.

The modulus and ray-character carriers, least conductor of the supplied finite-order character, and ray-class cancellation are genuine suppliers. They do not themselves prove the cyclotomic Frobenius weight factors through that character. Extension conductors and individual character conductors must also be distinguished.

**Required follow-through:** Specify the cyclotomic factorization, its conductor convention and the carrier comparison; prove the comparison and any least-conductor/lcm statement actually needed. Do not introduce global reciprocity as a prerequisite of this proof route.

### CH-U01 — unregistered-consumer

Locations: `content/tau-ceti/Chebotarev/README.md`, Final neighbouring-roadmap boundary paragraph: ZerosOfLFunctions Layer 8.7.

The document names ZerosOfLFunctions Layer 8.7 as an effective Chebotarev consumer of Layers 2, 11 and 13. Neither ZerosOfLFunctions nor LFunctions is a registered roadmap ID among the 212 atlas records and six additional definitions in this snapshot.

**Required follow-through:** Register or identify the exact intended roadmap/stage. Do not invent an endpoint or infer an effective estimate from this qualitative density theorem.

### CH-U02 — consumer-allocation

Locations: `content/campaign/PotentialModularityAndCompatibleSystems/README.md`, Introductory owner contract; R23.1, R23.5, R24.5 and R24.5:operations.

The introduction names Chebotarev, but the inspected stages do not locate the exact prime-selection finite extension and compatible conjugacy class. The representation-recognition operation already imports ArithmeticGaloisRepresentations R01.5.

**Required follow-through:** Allocate the genuine direct prime-existence application to a specific registered stage or retain the transitive R01.5 route. No speculative edge is added.

### CH-U03 — consumer-import

Locations: `content/campaign/GeneralizedHeegnerCycles/README.md`, GH.5.

GH.5 mentions auxiliary-prime existence alongside imports from ES.2–ES.5, while the generic simultaneous-localization and prime-selection contract is located at ES.1.

**Required follow-through:** Make the precise ES.1 import or another proved supplier explicit, including compatibility and residual-image hypotheses. Do not identify the entire simultaneous selection statement with bare Chebotarev.

These source corrections are mathematical checks of the displayed identities and interface hypotheses, not claims that the full underlying source proofs or cited external literature have been independently re-proved. No external textbook locator or pinned Lean declaration was invented.

## Validation actually run

From the snapshot root:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json
```

Result: exit code 0; 15 links, 3 overlaps, 218 examined records; **0 errors, 0 warnings**.

The supplemental check was run as:

```text
python3 check_link_supplement.py --root ../input --packet research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json
```

It loaded the original atlas, every new-definition `requires` edge, and all other link packets. It checked exact (not merely whitespace-normalized) evidence substrings, endpoint ownership, duplicates, retired endpoints, examined-record coverage and acyclicity before/after insertion.

Result: **PASS**. Input union: 4,378 edges; with the 15 proposals: 4,393. Both graphs acyclic; zero new duplicate edges; 37 literal evidence quotes verified across links and overlaps. All 218 reading records are unique and cover the catalogue.

This matters because `check_links.py` loads new-definition stage IDs but omits their `requires` from its cycle graph. The supplemental audit included all 238 of those prerequisite edges. Fifty-one pre-existing opaque `UPSTREAM:*` endpoints were retained as vertices, not certified as valid registered supplier contracts; none is a new proposed endpoint. Acyclicity with opaque vertices does not validate their unresolved meanings.

Neither check proves mathematical correctness, completeness of external proofs, Lean implementation, or reviewer independence. An independent link review remains necessary.

## Submission and continuation

Submit only the packet and this handoff through the session branch and a pull request referring to #21. Do not close the issue or mark the work done. The packet’s complete status is limited to the catalogue screen. The next reviewer should check all 15 new relationships and three overlaps against the input revision, resolve CH-S01–CH-S05 with the mathematical owners, and allocate CH-U01–CH-U03 before integrating any additional endpoint.

The existing 30 other-packet links and three Lawrence–Venkatesh definition edges are not resubmitted. Recheck source revisions and other packets before integration. No continuing background execution is implied by this handoff.

## Supplemental check source

The following is the exact Python check used above. It is a graph/text audit, not Lean code or an implementation of the mathematics.

```python
"""Requires-aware, exact-quote link checks; not a mathematical proof checker."""
import argparse
from collections import defaultdict, deque
import json
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('--root', type=Path, required=True)
p.add_argument('--packet', required=True)
a = p.parse_args()
root = a.root.resolve()
packet_path = root / a.packet
packet = json.loads(packet_path.read_text())
atlas = json.loads((root / 'data/atlas.json').read_text())
roads = {r['id']: r for r in atlas['roadmaps']}
stages = {s['id']: s for s in atlas['stages']}
new_ids = set()
for path in sorted((root / 'research/blueprint/roadmaps').glob('*.json')):
    r = json.loads(path.read_text())
    roads[r['id']] = r
    new_ids.add(r['id'])
    for s in r.get('stages', []):
        sid = s.get('id', r['id'] + ':' + s['key'])
        stages[sid] = {**s, 'id': sid, 'owner': r['id']}
base = {(e['source'], e['target']) for e in atlas['stageEdges']}
other = set()
for path in sorted((root / 'research/blueprint/links').glob('*.json')):
    if path.resolve() == packet_path.resolve():
        continue
    for e in json.loads(path.read_text()).get('links', []):
        other.add((e['source'], e['target']))
requires = {(x, s['id']) for s in stages.values() for x in s.get('requires', [])}
new_requires = {(x, s['id']) for s in stages.values() if s['owner'] in new_ids for x in s.get('requires', [])}
recorded = base | other | requires
graph = defaultdict(set)
for u, v in recorded:
    graph[u].add(v)

def acyclic(g):
    vertices = set(g) | {v for vs in g.values() for v in vs}
    degree = dict.fromkeys(vertices, 0)
    for vs in g.values():
        for v in vs:
            degree[v] += 1
    queue = deque(v for v in vertices if degree[v] == 0)
    seen = 0
    while queue:
        u = queue.popleft()
        seen += 1
        for v in g.get(u, ()):
            degree[v] -= 1
            if degree[v] == 0:
                queue.append(v)
    return seen == len(vertices)

assert acyclic(graph), 'Inherited graph contains a cycle'
seen_pairs = set()
quotes = 0
for e in packet['links']:
    u, v = e['source'], e['target']
    assert u in stages and v in stages
    assert stages[u]['owner'] != stages[v]['owner']
    assert packet['roadmapId'] in {stages[u]['owner'], stages[v]['owner']}
    assert 'FoundationsAndLibraryIntegration' not in {stages[u]['owner'], stages[v]['owner']}
    assert (u, v) not in recorded and (u, v) not in seen_pairs, 'Duplicate relationship'
    seen_pairs.add((u, v))
    assert {q['stageId'] for q in e['evidence']} == {u, v}
    graph[u].add(v)
for e in packet['links'] + packet['overlaps']:
    for q in e.get('evidence', []):
        s = stages[q['stageId']]
        assert q['quote'] in s.get('description', '') or q['quote'] in roads[s['owner']].get('readme', '')
        quotes += 1
assert acyclic(graph), 'Proposed links introduce a cycle'
assert len(packet['examined']) == len(roads)
assert {e['roadmapId'] for e in packet['examined']} == set(roads)
opaque = sorted(({u for u, v in recorded} | {v for u, v in recorded}) - set(stages))
assert not any(u not in stages or v not in stages for u, v in seen_pairs)
print(json.dumps({'result': 'PASS', 'roadmaps': len(roads), 'stages': len(stages),
    'atlasStageEdges': len(base), 'otherPacketPairs': len(other), 'requiresPairs': len(requires),
    'newDefinitionRequiresPairs': len(new_requires), 'unionEdgesBefore': len(recorded),
    'unionEdgesAfter': len(recorded) + len(seen_pairs), 'newLinks': len(seen_pairs),
    'literalQuotesChecked': quotes, 'acyclicBeforeAndAfter': True,
    'opaquePreexistingEndpoints': len(opaque), 'newOpaqueEndpoints': 0}, ensure_ascii=False))
```
