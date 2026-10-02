# FIX-RT-RS-11 — confirmed findings /1–/3

Codex, session `codex-a71f92`, 2 October 2026. Refs #5709.
All three verifier-confirmed findings are addressed in the restructuring
proposal and its reader. The required new-stage and dependency-removal
actions are explicit authorized-workflow handoffs, not changes to reviewed
base data and not claims that missing arithmetic is built.

## Scope, baseline and review provenance

Only these three deliverables change:

- `research/blueprint/restructure/RS-11.result.json`
- `research/blueprint/restructure/RS-11.md`
- `research/blueprint/redteam/RT-RS-11.fixes.md`

Inputs at immutable tree `07a332c2ac166cd57ac905b4c18b4941cf080f94`:

| Input | Git blob |
| --- | --- |
| RS-11 result before this fix | `7392ac9497f52f90364a72e6fdcccc6072cbb25e` |
| RS-11 reader before this fix | `88ae059641ea5f9498df6d8e8caf39d9504d856f` |
| RT-RS-11 result | `424f6dabd3cae2200f5bfcc671f55c261ca3372b` |
| RT-RS-11 verification | `a28556d287dc22ded54e833a3eb756e4f8baff24` |
| RT-RS-11 report | `468630378d8007c09ad3539dc9c22f0f86d67eab` |

WORKERS, the binding blueprint and expansion protocols and upstream guide
were read in this continuous worker session; the restructuring and
red-team rules were reread for this job. The full issue was read before
claiming and after the bot explicitly confirmed this session's claim.
No other issue was held concurrently. The shared clone remained read-only;
actual source modules and blobs were read at an immutable commit, with only
the three candidate files virtually overlaid in memory. No repository
checkout, snapshot, rebuild, commit or push was performed locally.

The older accepted REV-RS-11 review is copied verbatim into
`reviewHistory`; the amended proposal is `not_reviewed`, with no fixer
acceptance or invented independent reviewer. The original six accepted
link endpoints, both roadmap decisions, all 17 stage IDs/actions and the
three narrowing suppliers remain. Ten layer records are byte-equivalent
as JSON objects, including the complete I.L2 and I.L4 narrowings.
I.L3's original retained contract is an unchanged prefix of its expanded
interface specification. Four pointwise/family/rational/integral owner
records are unchanged; the first combined SU/FW record is split.

Read the reviewed library audit for all 17 members before choosing any
new ownership. Its 16 not-built and one process verdicts remain inherited
evidence, not an independent library-absence certification. No arithmetic
declaration or theorem is newly claimed to exist at the pinned libraries.

## /1 — distinct SU and FW ordinary proof owners

The first owner record is now two records:

- C.L1 owns the SU U(2,2) reverse bound in its source-qualified range.
- C.L2 owns FW section 4.8's ordinary reverse-bound route: GU(3,1)
  Theorem 7.32, Beilinson–Flach, explicit reciprocity, Poitou–Tate,
  the Castella–Wan comparison extended to weight k, twist/factor
  separation and powers-of-p control.

C.L1 no longer imports C.L2 or promises an FW period refinement.
Its SU geometry and downstream descent/CAP input remain. As an alternative
FW endpoint, removal of SU's weight congruence and the canonical/Gross-period
comparison remain explicit gaps; no unrestricted period equality is assumed.
C.L1 → C.L2 is kept. The complete assembled graph proves that adding the
opposite C.L2 → C.L1 would create a cycle.

C.L2's reason now names Castella–Wan Theorems 3.6/3.8, the KLZ
Lambda-adic classes/local maps and the FW weight extension. Its proof
contract does not turn Castella–Wan's p-inverted comparison into an
integral result. It requires the generic-point/unramified-direction
argument of FW section 4.6.3 in the relevant range, including every
period/local correction and any ambiguity that remains.

K.L4 → C.L2 is added **mandatorily**: Kato is needed inside the integral
single-factor reverse-bound proof for the twist/factor and powers-of-p
steps, not just at the final assembly. K.L4 → I.L1's reason is corrected:
C.L2 supplies the FW reverse bound. I.L1 still owns the final two-bound
equality, retains every source hypothesis and formulation comparison,
and still supplies C.L4's matched ordinary seed. No late FW endpoint
is imported backwards. This implements the verified /1 clarification
and coordinates area /22's existing handoff.

## /2 — parallel BCS branches and removal of aggregate blocking

C.L5 and C.L5b now state the parallel proof order:

```text
L5w -> L5a -> {L5b, HE.8b}
K.L4 -> L5b -> I.L3
```

C.L5b owns the cyclotomic proof, not a theorem reached after HE.8b.
Its direct Kato bound and every early product, auxiliary-field,
cyclotomic-control, twist/period/Euler/coefficient comparison stay.
BCS p.10 separates four factors; p.11's independent anticyclotomic
proof uses Theorem 4.2.1. The rational p>3, good ordinary and irreducible
branch remains distinct from the integral rank-one-image branch.

`dependencyRemovals` contains two exact cuts:

| Remove | Replacement |
| --- | --- |
| HE.8b → C.L5b | C.L5a and direct K.L4 |
| C.L5 → I.L3 | C.L5b and the seven-interface list below, including that theorem input |

I.L3 names its full replacement prerequisite list:
C.L5b, I.L0, EllipticCurveModularity R29.5/R29.6,
ModularSymbolsPadicLFunctions L1/L2 and
AutomorphicGaloisRepresentations R19.5.
Five direct curve/form/period/analytic/representation links are added;
I.L0 and C.L5b already have direct links.

The parametrization/modularity contract coordinates area /23.
The existing representation input is retained directly.
The ordinary analytic construction uses the modular-symbol period lattice
and bounded ordinary-refinement measure, not APL L3's Katz-only object.
APL L3's aggregate contribution remains upstream of L5w/L5a.
I.L3 retains the chosen isogeny, curve Tate-lattice and differential/
Manin-constant comparison, including nonunit factors, finite errors
and any needed p-integrality proof.

The current checker and builder support additive links, not deletion.
The two cuts therefore have explicit independent-review/authorized
blueprint/link/maintainer instructions. Remove every originating
requires/consumers/edge record to avoid recreating an obsolete link
on the next assembly. This job edits neither the base graph nor other
jobs' packets.

Fresh regression detail: at this tree, the aggregate cut by itself removes
the C.L4 → I.L3 path, but still leaves the independently wrong HE.8b
prerequisite of C.L5b. Cutting HE.8b alone leaves the aggregate path.
Both changes are required to fix the two defects. Additions alone fix
neither obsolete edge. The early L5w/L5a inputs and both branches remain,
as do the Kato, ordinary-seed, FW and signed/BSD consumer paths.

## /3 — one ordinary BSTW supplier, not another copy

The earlier locator correction is retained:
C.L5a's arithmetic output is BCS Proposition 5.2.1, using Theorem 3.2.1,
Lemmas 5.1.1/5.1.2/5.2.3 and Proposition 4.2.2.
The ordinary comparison is Theorem 4.1.3/Corollary 4.1.4, citing BSTW
section 9.3.2. BCS section 5.2's Proposition wording refers to its
Theorem 4.1.3, not a different statement. Theorem 4.2.1 stays HE.8b-owned.

The new `implementationHandoffs.ordinaryBSTW` coordinates area /30's
already proposed **KatoEulerSystems:L5**. It records:

- one exact `ownerRecord` for the ordinary two-variable class, both
  normalized reciprocity laws, ordinary comparison and two-form product;
- six existing inputs (K.L3/K.L4, PadicFamilies L4,
  PadicHodgeRegulators L3, SelmerIwasawaCohomology L3, APL L3);
- all six input links and K.L5 → C.L5a / K.L5 → BSD.6a;
- hypotheses, intrinsic construction, outputs, proof outline, API and
  concrete positive/negative test obligations;
- exact consumer scope and the missing authorized materialization.

K.L5 is absent from the assembled stages and from the inspected roadmap
definitions, packets, decompositions and reserved IDs. Putting it in normal
`owners`/`links` would fail the real checker. It is not disguised as
`UPSTREAM:`, assigned to an unrelated existing stage, or claimed available.
The planned owner/forwarding records are executable handoff data in an
explicitly non-native field. After the authorized stage is created,
move those records to the ordinary section-15 owner/link fields and recheck.
No competing owner or unauthorized roadmap file is created here.

C.L5a now imports that comparison rather than reconstructs it; its
quartic-CM, product-divisibility, auxiliary-field, mu and control proof
remains. BSD.6a's ordinary BSTW construction/comparison must be imported
from the same early owner, while its supersingular section-6 construction,
both signed reciprocity laws, supersingular comparison and other
CLW/JSW/corrected multiplicative/BSD-specific branches remain its own.
An ordinary import does not discharge a signed construction.

The ordinary prefix preserves p∤2N, split/discriminant, stable-lattice,
dual/Tate-twist and local-condition hypotheses. It distinguishes the
completed unramified coefficient ring from p-inverted variants,
requires van_L for integral comparison and nv for cyclotomic comparison.
No unconditional nv follows from the two-variable theorem; no
unrestricted anticyclotomic/signed equivalence is added.

**Fresh source correction to the earlier handoff.**
BSTW Theorem 1.14's printed prime labels are Col_v(loc_v Z)=L_p
and Log_vbar(loc_vbar Z)=L_Gr; the ordinary local condition is at vbar.
Area /30's written stage paragraph swaps those labels.
The proposal preserves that handoff's owner and source scope but corrects
its local-map labels, verified visually on BSTW p.7 and against p.83's
exact sequences. A consumer using the opposite convention owes the
explicit conjugation and lattice/function dictionary.

The ordinary comparison retains both four-term sequence corrections:
ch(H/ΛZ)·ch(X_Gr)=(L_Gr)·ch(X_st) and
ch(H/ΛZ)·ch(X_ord)=(L_PR)·ch(X_st), after justified scalar extension.
Prove rank/nonvanishing/torsion before canceling; neither H/ΛZ nor X_st
is assumed trivial. Their common comparison yields both containment
orientations and the direct-sum product version.

`implementationHandoffs.analyticFunctions` is a separate open request,
coordinated with area /26's proposed APL L3r, for the actual
CM-family Rankin–Selberg/Greenberg construction, exact interpolation/
normalization maps, coefficients, denominators, integrality and tests.
APL L3's Katz function alone and a structure containing predicted
reciprocity images are not that construction. The missing analytic
source statements, full prerequisite contract and CM-family specialization
remain authorized design/blueprint work. The eight-edge graph check
does not certify that arithmetic closure or those additional analytic edges.

## Primary-source evidence and boundaries

Fresh reads: 2 October 2026. The reader lists the exact passages.
PDF hashes:

| Source | SHA-256 |
| --- | --- |
| [FW 2107.13726v3](https://arxiv.org/pdf/2107.13726v3) | `39cee6cec8a5d56baf5c0b19dd892a571bc7945eab281d6ec9a9c14fa70294ee` |
| [Castella–Wan 2001.03878v1](https://arxiv.org/pdf/2001.03878v1) | `9bb85193d1b7591bd1abc5b7b5bbcee2164559733c5da6714f000f64761b0f5b` |
| [BCS 2405.00270v2](https://arxiv.org/pdf/2405.00270v2) | `bf87592cdbaabb5c57004bfd44dd5b4d712cb306bbbdc36520a3daf92fa416f3` |
| [BSTW 2409.01350v2](https://arxiv.org/pdf/2409.01350v2) | `18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf` |

No reference PDF, extracted paper text or scratch asset is submitted.
The source checks verify the findings' route/hypothesis/ownership boundary,
not the entire arithmetic proof or all cited sources. In particular BSTW
sections 3–5, every original Hida/Tilouine theorem, the complete FW
descent and SU construction remain future source decomposition.
There is no new formalization or library-absence claim.

## Validation

Final publication preflight reran all checks at parent
`207b3db2863d559061ef5ee4e89b0a34ada3f798`, with the same graph counts and results.
All 31 inspected target/supporting blobs, the expansion protocol, upstream
guide and integrated library audit were unchanged from the reading tree;
the issue body was unchanged and this session's claim remained confirmed.

Actual repository `scripts/check_restructure.py`: pass against its normal
world and the actual assembled stage world.
Actual intake file/path/private-content/JSON checks: pass on all three
deliverables. No Lean file is required, authored or compiled.

Complete read-only actual `scripts/build.py` assembly, not a hand-written
member cut:

| Graph | Stages | Distinct stage edges | Result |
| --- | ---: | ---: | --- |
| Recorded baseline | 2956 | 8639 | acyclic |
| Native candidate proposal overlay | 2956 | 8645 | acyclic, zero skipped links, obsolete path still present |
| Existing-stage projection after both authorized cuts | 2956 | 8643 | acyclic, FW-to-I.L3 path absent |
| Projection plus proposed K.L5 and eight prefix/forwarding links | 2957 | 8651 | jointly acyclic |

The last two rows are deliberate in-memory workflow projections, **not**
the live atlas. The separate analytic stage and its full prerequisite
edges are not included. The real native overlay was exercised and
confirmed to ignore both cuts and the pending-stage contracts; the report
does not confuse a checker pass with a completed graph repair.

Preservation and negative checks are reproducible below.
Regression-program SHA-256:
`1e889639d5558872ec64a1bccf26321acfcffc23c187f2323c50cd6cb0ca09ce`.

To reproduce, use the recorded repository tree as the read-only REPO
argument, save this fenced program as `regressions.py`, and provide the
original and candidate RS-11 result files. The program uses the actual
repository assembly without invoking a rebuilding/writing CLI.
The fixer ran its `check` function on immutable-blob-loaded actual
assembly. A fresh tree should be checked before application; counts and
obsolete originating records may change.

```python
"""RS-11 ownership and complete assembled-stage graph regressions (standard library).
Run: python3 regressions.py REPO ORIGINAL_RESULT CANDIDATE_RESULT
The checkout supplied as REPO must be the report's recorded validation tree.
This script reads the repository and does not rebuild or write the atlas.
"""
import json, sys
from pathlib import Path
from collections import defaultdict, deque

C="AutomorphicCongruences:"
I="ModularIwasawaMainConjectures:"
K="KatoEulerSystems:"
H="HeegnerPointEulerSystems:HE.8b"
B="RankZeroOneBSD:BSD.6a"

def reaches(edges, start, goal):
    following=defaultdict(set)
    for source,target in edges:
        following[source].add(target)
    queue=deque([start]); seen={start}
    while queue:
        for target in following[queue.popleft()]:
            if target == goal:
                return True
            if target not in seen:
                seen.add(target); queue.append(target)
    return False

def acyclic(edges):
    following=defaultdict(set); degree=defaultdict(int); vertices=set()
    for source,target in edges:
        following[source].add(target); degree[target]+=1
        vertices.update((source,target))
    queue=deque(v for v in vertices if not degree[v]); visited=0
    while queue:
        vertex=queue.popleft(); visited+=1
        for target in following[vertex]:
            degree[target]-=1
            if degree[target] == 0:
                queue.append(target)
    return visited == len(vertices)

def check(original, proposal, atlas):
    vertices={stage["id"] for stage in atlas["stages"]}
    edges={(edge["source"],edge["target"]) for edge in atlas["stageEdges"]}
    assert set(proposal["roadmaps"]) == set(original["roadmaps"])
    assert proposal["roadmaps"] == original["roadmaps"]
    assert set(proposal["layers"]) == set(original["layers"])
    assert len(proposal["layers"]) == 17
    changed={sid for sid in original["layers"] if proposal["layers"][sid] != original["layers"][sid]}
    assert changed == {C+"L1",C+"L2",C+"L5",C+"L5a",C+"L5b",I+"L1",I+"L3"}
    for sid in proposal["layers"]:
        assert proposal["layers"][sid]["action"] == original["layers"][sid]["action"]
        assert proposal["layers"][sid].get("suppliedBy") == original["layers"][sid].get("suppliedBy")
    for sid in (I+"L2",I+"L4"):
        assert proposal["layers"][sid] == original["layers"][sid]
    assert proposal["layers"][I+"L3"]["keeps"].startswith(original["layers"][I+"L3"]["keeps"])
    assert proposal["owners"][2:] == original["owners"][1:]
    assert [row["owner"] for row in proposal["owners"][:2]] == [C+"L1",C+"L2"]
    assert len(proposal["owners"]) == 6
    assert proposal["reviewHistory"][-1] == original["review"]
    assert proposal["review"]["status"] == "not_reviewed"
    assert not proposal["review"].get("reviewer")
    oldlinks={(row["source"],row["target"]) for row in original["links"]}
    links={(row["source"],row["target"]) for row in proposal["links"]}
    assert len(links) == len(proposal["links"]) == 12
    assert oldlinks <= links
    assert all(source in vertices and target in vertices and source != target for source,target in links)
    assert (K+"L4",C+"L2") in links
    assert (I+"L1",C+"L4") in links
    assert (C+"L2",C+"L1") not in links
    assert not acyclic(edges | {(C+"L2",C+"L1")})
    assert acyclic(edges)
    cuts={(row["source"],row["target"]) for row in proposal["dependencyRemovals"]}
    assert cuts == {(H,C+"L5b"),(C+"L5",I+"L3")}
    assert cuts <= edges
    interfaces={I+"L0","EllipticCurveModularity:R29.5","EllipticCurveModularity:R29.6",
                "ModularSymbolsPadicLFunctions:L1","ModularSymbolsPadicLFunctions:L2",
                "AutomorphicGaloisRepresentations:R19.5",C+"L5b"}
    aggregate_cut=next(row for row in proposal["dependencyRemovals"] if row["source"] == C+"L5")
    assert set(aggregate_cut["replacementPrerequisites"]) == interfaces
    assert {(source,I+"L3") for source in interfaces} <= edges | links
    assert reaches(edges,C+"L4",I+"L3")
    assert reaches(edges | links,C+"L4",I+"L3")  # additions alone cannot fix the defect
    assert reaches(edges - {(H,C+"L5b")},C+"L4",I+"L3")
    assert reaches(edges - {(C+"L5",I+"L3")},H,C+"L5b")
    repaired=(edges | links) - cuts
    assert not reaches(repaired,C+"L4",I+"L3")
    assert not reaches(repaired,H,C+"L5b")
    assert acyclic(repaired)
    required_paths={(C+"L5w",C+"L5a"),(C+"L5a",C+"L5b"),(C+"L5a",H),
                    (K+"L4",C+"L5b"),(C+"L5b",I+"L3"),(I+"L1",C+"L4"),
                    (C+"L4",I+"L2"),(C+"L4",I+"L4"),(I+"L4",B)}
    assert all(reaches(repaired,source,target) for source,target in required_paths)
    handoff=proposal["implementationHandoffs"]["ordinaryBSTW"]
    assert handoff["stage"] == K+"L5" and K+"L5" not in vertices
    assert handoff["status"] == "proposed_stage_not_materialized"
    assert handoff["ownerRecord"]["owner"] == K+"L5"
    assert handoff["ownerRecord"]["formerly"] == [C+"L5a",B]
    inputs={K+"L3",K+"L4","PadicFamilies:L4","PadicHodgeRegulators:L3",
            "SelmerIwasawaCohomology:L3","AutomorphicPadicLFunctions:L3"}
    assert set(handoff["requires"]) == inputs
    future={(row["source"],row["target"]) for row in handoff["links"]}
    assert future == {(source,K+"L5") for source in inputs} | {(K+"L5",C+"L5a"),(K+"L5",B)}
    assert len(future) == 8 and acyclic(repaired | future)
    assert all(source in vertices | {K+"L5"} and target in vertices | {K+"L5"} for source,target in future)
    for consumer in (C+"L5a",B):
        assert reaches(repaired | future,K+"L5",consumer)
    hypotheses=" ".join(handoff["hypotheses"])
    assert all(term in hypotheses for term in ("2N","van_L","nv","unramified","inverting p"))
    analytic=proposal["implementationHandoffs"]["analyticFunctions"]
    assert analytic["status"] == "open_authorized_supplier_request"
    assert set(analytic["neededBy"]) == {K+"L5",C+"L5a"}
    assert "not an existing stage" in analytic["proposedSupplier"]
    assert len(handoff["api"]) >= 3 and len(handoff["tests"]) >= 6
    assert len(analytic["api"]) >= 3 and len(analytic["tests"]) >= 4
    return {"baselineStages":len(vertices),"baselineEdges":len(edges),
            "existingLinksAdded":len(links-edges),"cuts":len(cuts),
            "existingStageRepairEdges":len(repaired),"plannedPrefixInputs":6,"plannedPrefixOutputs":2,
            "plannedStageGraphVertices":len(vertices)+1,"plannedStageGraphEdges":len(repaired | future),
            "acyclic":True,"additionsAloneStillBlocked":True,
            "FWToBCSCyclotomicPathAfterBothCuts":False,
            "FWPathAfterOnlyAnticyclotomicCut":reaches(edges-{(H,C+"L5b")},C+"L4",I+"L3"),
            "FWPathAfterOnlyAggregateCut":reaches(edges-{(C+"L5",I+"L3")},C+"L4",I+"L3"),
            "BCSBranchesRetained":True,"signedBoundaryRetained":True,
            "pendingStageAndAnalyticContractNotAvailable":True,
            "unchangedLayerRecords":17-len(changed),"previousReviewPreserved":True}

if __name__ == "__main__":
    root=Path(sys.argv[1]).resolve()
    sys.path.insert(0,str(root/"scripts"))
    import build
    atlas,_=build.assemble(require_distances=False)
    original=json.loads(Path(sys.argv[2]).read_text())
    proposal=json.loads(Path(sys.argv[3]).read_text())
    print(json.dumps(check(original,proposal,atlas),indent=2))
```

## Independent-review and application handoff

REV-FIX-RT-RS-11 should check the amended ordinary owner and integral
Kato input first, then both dependency removals with every retained I.L3
interface, then the single planned ordinary owner and signed boundary.
The earlier accepted review is historical only.

After acceptance, the maintainer/authorized owning jobs must materialize
K.L5 and the full analytic contract, implement both cuts and update the
associated imports/ownership without editing Tau Ceti roadmaps. Existing
stage reasons alone do not rewrite kept layers' base descriptions; the
blueprint/authorized application must carry the stated mathematics into
those contracts. Recheck all new interfaces and the full then-current DAG
before declaring the repaired ownership graph applied. Arithmetic
construction/API tests and Lean proofs remain implementation work.
