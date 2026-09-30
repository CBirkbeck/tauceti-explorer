# Red team: Semisimple Algebras link map

One medium finding: deduplicating an accepted dependency against an unreviewed research packet removes it from the published graph. The five retained links and three scoped overlaps withstand this audit. No further dependency was established by the catalogue screen.

Issue #4376; **Codex — codex-J6LwjP**, 2026-09-30. I did neither the original work (ChatGPT Pro — cgp-7cf7c77d34d7) nor its review (Codex — codex-hjdg0j). Input: `cc9d0f2a873a9ab218ad1b9474623364271aedb8`. The target packet's SHA-256 is `7012bb7990816fcd08b20a8aa8e94e6fff2d94bcb6ba26a297aa83715f011249`.

SSA below denotes `tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras`. This audit concerns the accepted link map, including its qualifications, rather than treating every stale sentence in the upstream roadmap as a fresh finding against the map.

## Finding 1 — medium, missing dependency

**Location:** the target packet's `alreadyRecorded[0]`, its omission from `links`, and the Quiver row of `reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.md`.

The pair is:

```text
tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras#layer-2-artin-wedderburn-assembled-with-uniqueness
  -> tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra
```

It is a valid dependency with two-sided evidence. The supplier's Layer 2 promises that “the chosen index is in bijection with isomorphism classes of simple `R`-modules (via Layer 1.5)”. The consumer's Layer 3 says that the radical quotient's “Wedderburn decomposition indexes the simple modules” and explicitly says “Consume [semisimple algebras](../SemisimpleAlgebras/README.md) for the Wedderburn side.” These quotations occur in `content/tau-ceti/RepresentationTheory/{SemisimpleAlgebras,QuiverRepresentations}/README.md`, the named layers; the exact line-broken strings remain in the JSON evidence. Apply the supplier to `A/J(A)`, retaining the consumer's simple-module transport, lifting, covers and Morita work.

The review says **“Removing this proposal removes no graph edge”**, while explicitly acknowledging that the Quiver packet has no independent review. That conclusion is false for the production graph:

1. The only research `links` entry with this ordered pair is in `links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json`. Its `review` is absent. The accepted SSA packet preserves the pair only under `alreadyRecorded`.
2. `scripts/promote.py`, `decide`, skips a packet without an accepted review. Its `destinations` copies accepted link packets into `data/links`. A promoted SSA packet exists; a promoted Quiver packet does not.
3. `scripts/build.py`, `assemble`, reads `data/links`, and `scripts/decompositions.py`, `merge_links`, iterates `packet.get("links", [])`. Neither reads `alreadyRecorded` as dependencies.
4. The assembled production atlas has both endpoints but no edge, no corresponding `requires` entry, and **no directed dependency path** from supplier to consumer. This is not merely the absence of a redundant shortcut.

Reproduction from the input checkout, using the actual assembly and merge functions, without writing build output:

```python
import json
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, "scripts")
from build import assemble
from decompositions import merge_links

stem = "tauceti_TauCetiRoadmap_RepresentationTheory_SemisimpleAlgebras.json"
packet = json.loads((Path("research/blueprint/links") / stem).read_text())
link = packet["alreadyRecorded"][0]
pair = link["source"], link["target"]
atlas, _ = assemble(require_distances=False)
edges = {(e["source"], e["target"]) for e in atlas["stageEdges"]}
stages = {s["id"]: s for s in atlas["stages"]}
assert all(s in stages for s in pair)
assert pair not in edges
assert pair[0] not in stages[pair[1]].get("requires", [])
adj = defaultdict(set)
for source, target in edges:
    adj[source].add(target)
seen, todo = {pair[0]}, [pair[0]]
while todo:
    for target in adj[todo.pop()]:
        if target not in seen:
            seen.add(target)
            todo.append(target)
assert pair[1] not in seen
proposal = {**packet, "links": [link]}
restored = merge_links(atlas, [proposal])
assert pair in {(e["source"], e["target"]) for e in restored["stageEdges"]}
assert len(restored["stageEdges"]) == len(edges) + 1
assert len(merge_links(restored, [proposal])["stageEdges"]) == len(edges) + 1
print(len(stages), len(edges), len(restored["stageEdges"]))
```

Observed: **2840, 8007, 8008**. Both merge calls pass the production cycle check. The repeated merge appends evidence to the existing pair rather than creating a second edge. `require_distances=False` permits provisional display distances; it does not disable link validation or cycle checking.

**Fix:** restore the dependency to this packet's `links` with its existing scoped reason and quotations; remove or rewrite the `alreadyRecorded` entry, summary and incorrect review narrative. Have the correction independently accepted and promoted: the existing accepted-review signature does not automatically republish later research edits. Do not accept all of the other packet merely to obtain this edge. Later promotion of a reviewed Quiver packet is safe because `merge_links` already deduplicates endpoint pairs. Severity is medium: one evidenced prerequisite is hidden, while the underlying mathematics and ownership are already documented.

## Checks of every retained link and overlap

Read the complete SSA source roadmap and the full consumer descriptions used below. Independently checked **18/18 exact stage quotations**: ten in the retained links, six in the overlaps and two in `alreadyRecorded`. Valid quotations alone do not establish a mathematical dependency; the following checks address their scope.

| Entry | Result |
|---|---|
| SSA 2 → CharacterTheory 2 | Valid for the selected block/simple-module indexing reuse route over the split semisimple group algebra, with Maschke's characteristic hypothesis. The target explicitly consumes Wedderburn existence from Mathlib; the packet does not make that existence depend on SSA. |
| SSA 4 → QuadraticFormInvariants 5 | Valid tensor, dimension and opposite-algebra input to Brauer-valued invariants. Quaternion and parity-dependent Clifford central simplicity stay with the consumer. The reason explicitly corrects the source's stale tensor-simplicity build request. |
| SSA 6 → QuadraticFormInvariants 5 | Valid group and quotient operations on the existing Brauer carrier. The reason retains the pinned same-universe restriction for group base change and does not claim the symbol comparison proofs are supplied. |
| SSA 6 → QuadraticFormInvariants 7B | Valid finite separable splitting and base-change input. The pinned splitting field already lies inside `SeparableClosure K`; a Galois enlargement and comparison/naturality maps remain consumer work. |
| SSA 5 → QuadraticFormInvariants 7B | Valid only for the linear residual of semilinear descent, as the reason explicitly states. Inner conjugation fixes scalars; it cannot equal a nontrivial coefficient automorphism. G4 already records this source-prose repair. |
| SSA 0 / Quiver 3 overlap | Valid shared radical convenience API, already in the pin. It does not provide all idempotent lifting, projective covers or Morita reduction for a nonsemisimple algebra. |
| SSA 3 / SchurWeyl 8 overlap | Correctly distinguishes simple-module density from the stronger existing semisimple image theorem. Finite tensor space need not be simple or a faithful module for the whole group algebra. The generic bicommutant result still does not identify the specific tensor-action commutants. |
| SSA 6 / ClassFieldTheory 10 overlap | Correctly distinguishes algebraic Brauer classes from continuous H2 and the real invariant `1/2`. The existing algebraic real calculation does not itself identify those maps. |

The `inferred` labels conservatively describe a mathematical interface match; the explicit SSA layer names in some consumer quotations do not make these links invalid. No self-edge, unknown endpoint, repeated pair or reversed dependency was found among the five links. The union of raw `stageEdges`, all research links and all raw/new stage `requires` is acyclic, with **4501** distinct edges. Unlike the production graph, that union contains the unreviewed Quiver proposal; this distinction explains why the prior review's graph test missed finding 1.

## Pinned library statements

Mathlib baseline: `082e2d37e8b0463410cdb532e111cd43d5a66174`; TauCeti: `f790474821cf4256814db967cb154e7af3d0c369`. Read the following TauCeti statements with their surrounding parameters on 2026-09-30. There is no reviewed SSA entry in `data/library-coverage.json`; audit specifications are not accepted results. These targeted checks establish the packet's named availability claims, not an exhaustive library audit.

- [Finite-dimensional radical API](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Jacobson/FiniteDimensional.lean): for a finite-dimensional algebra over a field, `isNilpotent_jacobson`, `isSemisimpleRing_quotient_jacobson`, and `isSemisimpleRing_iff_jacobson_eq_bot` supply the stated package.
- [Schur](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Semisimple/Schur.lean): `endAlgEquivSelfOfIsSimpleModule` identifies `Module.End A S` with the algebraically closed field k for a finite-dimensional simple A-module with the scalar tower. G1 correctly rejects the source's `End_k S` notation.
- [Double centralizer](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean): `ringEquivEndEnd` uses a faithful semisimple R-module finite over its R-endomorphism ring. `centralizer_centralizer_range` uses a semisimple K-algebra acting on a finite K-module, K a commutative ring, and returns the image's double centralizer. It does not require injectivity of the representation. G2's opposite convention and G6's stronger existing image API are appropriate.
- [Tensor product](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/TensorProduct.lean): `IsSimpleRing.tensorProduct` takes a central simple left algebra and simple right algebra over a field; no finite-dimensionality is needed. `tensorProduct_of_isCentral_right` gives the scalar-extension orientation. G3 concerns exposing the already available input early enough in the prose.
- [Skolem–Noether](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/SkolemNoether.lean): `exists_unit_conj_of_algEquiv` takes `e : A ≃ₐ[K] A` for finite-dimensional central simple A/K. This is the linear, not directly semilinear, statement needed after coefficient untwisting.
- [Group](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Group.lean) and [base change](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/BaseChange.lean): `instCommGroup` acts on the existing `BrauerGroup.{u,u} K`; `baseChange` is a monoid homomorphism to `BrauerGroup.{u,u} L` for fields in the same universe, with `baseChange_mk` identifying representatives. The bundled `CSA.baseChange` permits the wider universe parameters recorded in its statement.
- [Finite separable splitting](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/FiniteSeparable.lean): `exists_isSplittingField_finiteDimensional_isSeparable` returns a finite splitting `IntermediateField K (SeparableClosure K)` for finite-dimensional central simple A/K. It does not assert that this chosen field is Galois.
- [Real classification](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/Real.lean) and [real Brauer group](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Real.lean): `nonempty_algEquiv_real_or_quaternion` assumes centrality and finite dimension for a real division algebra. `Quaternion.brauerGroupMulEquiv` identifies the algebraic Brauer group with multiplicative Z/2; its `_mk` theorem sends the Hamilton class to `ofAdd 1`. G5 correctly separates this from cohomological normalization.

G1–G6 are existing qualifications in the target, not six additional discoveries. No missing-library claim is made here, and no Lean compilation was performed or needed for these report-only deliverables.

## Catalogue screen and limits

Screened the summaries and stage descriptions from `data/atlas.json` plus all nine definitions under `research/blueprint/roadmaps`: **221 roadmaps, 220 active, 2028 stages**. The semisimple, Jacobson, Wedderburn, central-simple, Brauer, Skolem–Noether, double-centralizer/bicommutant, isotypic, primitive-idempotent, Morita and division-algebra families yield **149 stage hits**. A supplementary splitting-field search separates polynomial/torsor splitting from central-simple-algebra splitting. These are search coverage counts, not a claim to have read every candidate roadmap in full.

Read the meaningful neighbouring contracts, including Quiver 3, SchurWeyl 8, CharacterTheory 2, InductionRestriction 5, LieHighestWeight 6, GrothendieckEulerForms 4, AbelianSchemesAndArithmeticModuli A6, NoncommutativeAndEquivariantIwasawa NE.3, VectorBundlesAndIsocrystals VB0 and ArithmeticQuantumTopology QT.1. The matching contexts elsewhere did not supply another exact interface:

- Clifford theory needs restriction, multiplicities and character detection beyond SSA's counted isotypic classes. LieHighestWeight explicitly imports the ring-level isotypic machinery and owns the enveloping-algebra dictionary. No second general isotypic construction was inferred.
- Euler/Cartan pairings use Quiver's projective/simple bases and lifting package. Poincaré reducibility and semisimplicity of abelian-variety endomorphisms require geometry; a semisimple-ring hypothesis does not establish them.
- Reduced norms/SK1, local division-algebra invariants and the cyclic-algebra identification for isocrystals are more specific outputs than SSA's general Brauer group or splitting existence. Cohomological and geometric Brauer evaluation in CFT, rational-point obstructions and higher local fields need their respective comparison/arithmetic owners.
- Brauer lifting/induction, Brauer–Nesbitt, Brauer diagram algebras, derived Morita invariance, reductive-group semisimplicity and root-of-unity semisimplification are not interchangeable with central-simple-algebra classification. The SchurWeyl 9 context explicitly separates its invariant-theoretic commutant theorem from generic bicommutant arguments.
- The three definitions absent from the historical 217-entry `examined` list (RiemannianGeometry, SeveralComplexVariablesKahlerGeometry, SymplecticContactGeometry) have geometric/analytic contracts with no matching SSA input. The two new-stage keyword hits are Lawrence–Venkatesh's Galois semisimplicity and period-map criterion, not new SSA consumers. No defect is inferred merely from subsequent catalogue growth.

This screen establishes finding 1 and no other evidenced omission. It does not certify that every use of associative algebra hidden in all papers behind the catalogue has been discovered.

## Validation

- Target `check_links.py`: five links, three overlaps, 217 examined; **zero errors and warnings**.
- Exact quotations, endpoint inclusion, graph reachability, in-memory restoration, duplicate insertion and the independent `requires`-inclusive cycle check passed with the observations above.
- This result passed `scripts/check_redteam.py`; both deliverables passed `research/blueprint/intake.py check-files` and `git diff --check`.
- Only the assigned result and report changed. Source/library checks are reproducible from the pinned paths; scratch downloads are not required by a verifier and are removed when the PR opens.
