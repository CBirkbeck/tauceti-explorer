# RT-RS-12~3 — Galois representations of automorphic forms

Agent: Codex, session `codex-rtOQ9t`. Issue: #5110. Read date:
2026-10-01. Repository base: `7882cb661ace64d038d4ed2ece955a438a088491`.
Target: accepted third-round RS-12 and its review REV-RS-12~3.
I did not author or review that work. Status: **complete**.

There are **three medium findings**, specified in the accompanying result JSON.
The first is an incomplete reconciliation of an inherited dependency when a node
moves. The other two identify outstanding supplier routes already covered by
confirmed area findings and their fixes reports. They should be coordinated with
that work, not treated as requests to construct the mathematics a second time.

The proposal's principal decision survives this audit. Keep both roadmaps: the
general-rank prelude supplies raw cohomology to the local correspondence, while
its later layers reuse the rank-two theorems on their actual domain of overlap.
No linear Part-II extension frontier is required. All sixteen stages retain their
substantive targets. The current assembled stage graph is acyclic.

## Inputs and limits of the audit

Read in full: the family file's ten directed evidence rows, accepted result and
report, third-round handoff and review, both member README files, all sixteen
layer decisions, twenty ownership records and thirty links. Read all fifteen
integrated decomposition nodes, twelve links, sixteen coverage entries and fifteen
explicit gap records. These are still partial decompositions; an accepted
restructuring does not certify their proof closure.

Read the actual external owner contracts AF.4, R01.1/G7, IHG.1/3/4,
R24.5:operations, R34.6 and IG.5. Checked R14.3/R14.6, accepted RS-06's
corresponding ownership, and ET.6's local-construction contract. Read all
twenty-four external consumer contracts listed below. Examined the relevant
normalization, HLTT and geometric-congruence prerequisites in the partial
blueprint packets. The other nodes of those packets were inventoried, not
independently re-reviewed. No unreviewed packet was promoted in the graph test.

Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau
Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the sixteen member
records in `data/library-coverage.json`, and its accepted AUDIT-31 review metadata
(REV-AUDIT-31, 2026-09-17, 160 checks, two corrections). The fifteen mathematical
layers are recorded as not built; AG2.1 is a process record. Those are reviewed
audit observations, not the result of a fresh exhaustive library search.

Directly read Mathlib's `RepresentationTheory/Basic.lean`, lines 35–115, at the
pin: `Representation` is `G →* V →ₗ[k] V`, with algebraic trivial-action and
inverse-action lemmas. It does not package continuity, an automorphic realization
or a compatible family. This confirms the proposal's limited positive library
claim. No new library-absence finding is made.

## Conservation and ownership

Abbreviations in this table refer to the unchanged stage IDs in the two member
roadmaps; suppliers retain their full IDs in the JSON and graph checks.

| Layer | Target retained or imported; audit outcome |
| --- | --- |
| R19.1 | Weight-two realization, higher-weight eigenspace/projector, coefficient data, Frobenius polynomial and separate weight-one branch survive. R14.3 owns the carrier. R14.6's distinct relation handoff remains incomplete: finding 2. |
| R19.2 | Actual Hilbert rank-two construction and its source-qualified parity/auxiliary-place cases stay here. AG2.3 imports exactly the common domain. |
| R19.3 | Generic system carrier/operations come from R24.5:operations and purity application from R34.6. The actual eigenform family and its common polynomials stay here. Forwarding passes. |
| R19.4 | Full rank-two away-from-coefficient-prime WD comparison, monodromy, conductors and bad Euler factors remain. The general nonselfdual bound does not replace them. |
| R19.5 | Rank-two coefficient-prime comparison and the source-specific ordinary, Barsotti–Tate and endpoint applications remain. No universal branch extension is inferred. |
| R19.6 | Generic IHG.1/4 machinery is imported. The geometric Hecke instance, actual local deformation-map conditions, integral specialization and weight-two Tate-module comparison remain. |
| AG2.0 | AF.4, G7/R01 and IHG.3 supply general carriers. Early data are rec-free; later comparison and base-change clauses move as instructed. The outgoing inherited normalization prerequisite needs the additional repair in finding 1. |
| AG2.1a | Early raw compact-unitary cohomology, actions and trace geometry stay before ET.6. Completed polarized representations and their local properties are explicitly split off. |
| AG2.1b | Separation of automorphic constituents remains after the local correspondence. No completed Galois theorem is assumed as its own geometric input. |
| AG2.1 | Aggregate record survives without being an additional independent construction. |
| AG2.2 | Polarized construction, discrete/isobaric interfaces and stable base change remain. The distinction between cuspidal input and the discrete output HLTT needs is preserved. |
| AG2.3 | Imported Hilbert rank-two case is narrowed correctly; general-rank/new-field approximation and descent still have work to do. |
| AG2.4 | Actual HLTT boundary/dagger/congruence construction, extraction and descent remain. The declared generic IHG.4 handoff has no route: finding 3. |
| AG2.5 | Imported R19.4 case, arbitrary-rank comparisons, late normalization and separate polarized/full versus nonselfdual/bounded conclusions survive. |
| AG2.6 | Generic systems and existing rank-two properties are imported; new instances and their source-qualified coefficient-prime properties survive. |
| AG2.7 | Typed characteristic-zero/residual exports, rank-two identification, lattice reduction and exact decomposed-generic predicate survive; IG.5 owns its rational trace application. |

The twenty owner entries distinguish a generic carrier from its arithmetic
instance. In particular G7's actual polarization pairing is not replaced by a
determinant character, R24.5:operations takes actual systems as input, IHG.1 does
not reconstruct representations without its residual hypotheses, and R34.6 does
not assume unrestricted local weight–monodromy. No narrowed target disappears.

## Findings and counterevidence

### 1. The node move needs an outgoing-edge rewrite

RS-12's AG2.0 reason explicitly moves
`AG2.0/the-normalization-dictionary-fixed-by-the-sources` to AG2.5. The first
integrated Part-II decomposition link sends that node to
`AG2.4/hltt-construction-of-nonselfdual-systems`. The partial AG2.0 packet also
lists it as the HLTT node's prerequisite. The link's existing reviewer annotation
states that it “supplies no further mathematical input”.

This distinction matters. The source convention needed to state the good-prime
construction can be fixed with early AG2.0 data and ET.6. It does not require the
later local-global comparison as an input. Reparenting the whole supplier while
keeping the link gives this parent-stage cycle:

```text
AG2.4 -> AG2.5
AG2.5 [moved normalization node] -> AG2.4 [HLTT node]
```

The raw stage graph checker does not detect that migration defect: it checks the
old node placement. The repair is to replace the inherited prerequisite with the
early convention input and the established ET.6 normalization, while keeping the
later comparison as AG2.5's output. The source statement, including its good-prime
scope, remains intact. Likewise split the completed polarized node's existence
and local conclusions as RS-12 already instructs; moving all its local properties
back into AG2.1a would defeat the accepted frontier.

**Counterevidence considered:** the current graph is acyclic, and the annotation
already warns that the old link is only notational. Those facts reduce the repair
to an explicit migration instruction and prerequisite update. They do not make a
literal backward prerequisite safe to preserve. This is a medium, limited-scope
finding, not a claim that all of RS-12's construction order fails.

### 2. R14.3's carrier does not supply R14.6's relation

The third review corrected the universal elliptic-family/Sym-power carrier to
R14.3. That correction is right. Accepted RS-06 separately keeps the geometric
special-fibre Eichler–Shimura relation in R14.6, and AUDIT-31 explicitly lists
that supplier in R19.1's duplicate records. RS-12's R19.1 keep decision still
retains the geometric polynomial without naming that separate handoff. R14.6
does not reach R19.1 in the freshly assembled graph.

There is already partial work: the R19 blueprint's geometric-congruence node
names `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura` as a prerequisite.
It has no corresponding R14.6 request, and the partial packet has not replaced the
accepted stage graph. The existing `RT-AREA-langlands-2.fixes.md` section /9
describes exactly this remaining work. This report asks for reconciliation of
RS-12 with that repair, not another proof of the same theorem.

Keep R19.1's higher-coefficient congruence and eigenspace deduction. The relation
read in Deligne's page images depends on the Sym-power exponent; one cannot move
all higher-weight mathematics to a weight-two Jacobian interface. Add the agreed
R14.6 route and explicit imported ownership boundary, preserving the packet's
existing prerequisite. The pair of stage/packet edits must be promoted through
review; old fixes-report suggestions to edit the base atlas directly are not
authorization to bypass the current protocol.

### 3. IHG.4 is named as owner but does not feed AG2.4

RS-12's IHG.4 owner record includes AG2.4 under `formerly`, and AG2.4's keep
reason tells it to import generic determinant APIs. Yet the link list feeds
IHG.4 only into R19.6. There is no transitive substitute into AG2.4. This is an
omitted handoff under the proposal's own ownership table.

HLTT section 6.1 provides the concrete interface to check: classical data, a
fixed ramification set, finite Hecke-stable modules modulo powers of p, then the
integral limit. The proof uses continuous pseudorepresentations. Applying the
generic determinant API therefore includes proving the coefficient-domain and
trace/determinant bridge; it is not permission to infer integral interpolation
from characteristic-zero density alone.

The interpolation part of confirmed `RT-AREA-langlands-1/26` and its fixes report
already requests this route. Add IHG.4 → AG2.4 and its owning-packet request,
retaining the automorphic congruence and continuity proofs in AG2.4. Its separate
factor-separation request is not settled here: the stronger Laurent-variable
determinant hypotheses need an actual comparison. An edge from the whole TC.3
would not express that separation even though such an edge alone is acyclic.

## Graph and consumer checks

Used `scripts.build.assemble(require_distances=False)[0]` at the stated base,
rather than an older static `data/atlas.json`. The result has **2,907 stage/node
records and 8,322 distinct directed edges**. All **30** RS-12 links are already
present. Thus “26 new links” in the older proposal describes its historical input,
not a missing-link count at this audit base.

There are **28** direct exports from the sixteen member stages to **24** distinct
external consumers:

| Consumer roadmap | Consumer stages checked |
| --- | --- |
| AlgebraicModularFormsAndSerreWeights | R15.6 |
| AutomorphicCongruences | L0, L5 |
| CompletedCohomologyAndLocalGlobalCompatibility | R31.3 |
| ComplexMultiplicationAndExplicitReciprocity | CM.4 |
| EllipticCurveModularity | R29.1, R29.4, R29.5, R29.6 |
| EllipticRegulators | KU-modularparam |
| EndoscopicTransferAndUnitaryTraceComparison | ET.6, ET.6a |
| GL2ModularityLifting | R22.1 |
| HeegnerPointEulerSystems | HE.1 |
| IgusaVarietiesAndTorsionConcentration | IG.5 |
| KatoEulerSystems | L2, L3 |
| OrdinaryAutomorphicFormsAndModularityLifting | R21.3 |
| PadicFamilies | L4 |
| PadicHodgeRegulators | L4 |
| PotentialAutomorphyInfrastructure | PA.0 |
| PotentialModularityAndCompatibleSystems | R24.1 |
| SerreWeightAndLevelOptimisation | R20.1 |
| TorsionCohomologyInfrastructure | TC.4 |

For each narrowed layer, each `suppliedBy` entry and each current direct
consumer, removed the narrowed layer from the path search and tested whether the
supplier still reaches that consumer. All **17** nontrivial checks pass. This
includes newer AG2.6/AG2.7 consumers of R19.3: R34.6 reaches them through the
retained rank-two comparison interface. Reachability is only one part of the
check; the carrier/instance and full/bounded WD distinctions were checked in the
contracts above. No lost export was found.

No late AG2 stage reaches an R19 layer; no R19 layer reaches AG2.0 or AG2.1a.
Even after removing `R16.6 -> R19.1` and `R16.3 -> R16.6`, the witness
`AG2.1a -> ET.6 -> R17.2 -> R17.3 -> R19.2` survives and continues through
R19.3–R19.6. The report's objection to a linear extension remains valid.

The twelve inherited links are parent-compatible before relocation. Projecting
the normalization node to AG2.5 and the polarized existence component to AG2.2
produces precisely the backward edge in finding 1. Replacing that edge as
described, and adding both R14.6 → R19.1 and IHG.4 → AG2.4, passes a joint
topological-sort test. Both missing supplier routes also pass individually.
No Tau Ceti-owned roadmap or Tau Ceti-to-Tau Ceti edge is changed.

The essential reproduction, using full IDs, is:

```python
import collections, json, sys
sys.path.insert(0, 'scripts')
from build import assemble
a = assemble(require_distances=False)[0]
E = {(e['source'], e['target']) for e in a['stageEdges']}
def acyclic(edges):
    g, deg = collections.defaultdict(set), collections.Counter()
    for u, v in edges:
        g[u].add(v); deg[v] += 1; deg[u] += 0
    q = collections.deque(v for v in deg if not deg[v]); seen = 0
    while q:
        u = q.popleft(); seen += 1
        for v in g[u]:
            deg[v] -= 1
            if not deg[v]: q.append(v)
    return seen == len(deg)
P = 'AutomorphicGaloisRepresentationsPartII:'
R = 'AutomorphicGaloisRepresentations:'
ds = [json.load(open('data/decompositions/' + n + '.json')) for n in
      ['AutomorphicGaloisRepresentations', 'AutomorphicGaloisRepresentationsPartII']]
parents = {s['id']: s['id'] for s in a['stages']}
parents.update({n['id']: n['parentStageId'] for d in ds for n in d['nodes']})
links = {(e['source'], e['target']) for d in ds for e in d['links']}
def lift(es):
    return {(parents[u], parents[v]) for u, v in es if parents[u] != parents[v]}
assert acyclic(E | lift(links))
normalization = P + 'AG2.0/the-normalization-dictionary-fixed-by-the-sources'
hltt = P + 'AG2.4/hltt-construction-of-nonselfdual-systems'
parents[normalization] = P + 'AG2.5'
parents[P + 'AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris'] = P + 'AG2.2'
assert not acyclic(E | lift(links))
old = {(normalization, hltt)}
repairs = {
    ('ModularCurvesPartII:R14.6', R + 'R19.1'),
    ('IntegralHeckeAndGaloisDeterminants:IHG.4', P + 'AG2.4'),
    (P + 'AG2.0', P + 'AG2.4'),
    ('EndoscopicTransferAndUnitaryTraceComparison:ET.6', P + 'AG2.4'),
}
assert acyclic((E - old) | lift(links - old) | repairs)
```

This models the polarized node's existence component only. Its local-comparison
and coefficient-prime components must still be split to AG2.5/AG2.6 as accepted;
the snippet does not authorize placing the whole theorem at AG2.2.

## Primary-source register

All URLs below were accessed on **2026-10-01**. These were targeted boundary and
proof-interface reads, not full-paper extractions.

| Public source and exact version | Passages read and purpose | SHA-256 |
| --- | --- | --- |
| [HLTT author PDF](https://www.kwlan.org/articles/rigcoh.pdf), 306 pages | Theorem A and introduction pp. 1–3; §6.1 pp. 194–197, Lemma 6.2, Corollaries 6.3–6.4 and Proposition 6.5. Checks good-prime normalization and finite-quotient interpolation inputs. | `abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7` |
| [Deligne, Bourbaki exposé 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf), 35-page Numdam scan | Proposition 4.8 and Theorem 4.9, printed pp. 166–167 (PDF pages 29–30), read as images. Checks the coefficient-dependent relation and geometric Frobenius convention. | `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c` |
| [Varma, arXiv:1411.2520](https://arxiv.org/pdf/1411.2520), 28 pages, v1 stamp and July 31, 2018 internal date | Introduction pp. 1–2, Theorems (1ss) and (1), and the interpolation/patching sketch. Confirms equality after semisimplification and a monodromy bound, without claiming full WD equality in the nonselfdual branch. | `24076dfcc6ca9b9e3168efb0150e75d5200f66e64085625b3e52895cfd1e56ef` |

The short source quotations needed for the findings are in the JSON. The Varma
statement does not produce a strict inequality example at a Steinberg place.
RS-12 already preserves a correction to that inherited acceptance test, and to
the ordinary/supersingular fibre count in Deligne's construction; neither is
reported as new. Likewise the retained coefficient-prime branch is not certified
from HLTT's existence theorem. Older explicit gaps concerning full proofs,
normalization reconciliation, descent and monodromy are still gaps, not hidden
claims of completion by this restructuring.

## Validation

- Fresh assembly, reachability, forwarding, node-placement and joint-repair
  graph checks passed with the outcomes above.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-12~3.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-RS-12~3.result.json research/blueprint/redteam/RT-RS-12~3.md`
- `git diff --cached --check`

No Lean file is a deliverable for this red-team job, and no Lean compilation,
library build, cache download or language server was run. Only the two authorized
report files change.
