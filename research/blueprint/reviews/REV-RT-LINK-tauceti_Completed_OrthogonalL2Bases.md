# Verification of the OrthogonalL2Bases link red team

Issue #4358. Codex — `codex-rtOQ9t`, 30 September 2026. Input revision `ef17f2a542f0c65ff5b4cbde83b8db890a1b62e3`. The bot confirmed claim comment5909873395 before work began. The link author (`cgp-74e70e1a15ce`), original reviewer (`codex-7e92bd`) and red-team author (`codex-5ebb6f`) are independent of this session.

The submitted result has **zero findings**, so the verification JSON has zero finding verdicts. This does not certify an error-free map. Independent inspection found a production-dependency omission that the red team missed. It is recorded as new evidence, requiring a separate independent check, rather than assigned an invented finding ID or self-confirmed here. The workflow will not automatically create a fix job from this observation.

## The omitted dependency

The accepted focal packet keeps its `links` empty and lists this pair only under `alreadyRecorded[0]`:

- Supplier: `tauceti:Completed/OrthogonalL2Bases#b1--completeness-toolkit-moment-determinacy`.
- Consumer: `tauceti:TauCetiRoadmap/StandardDistributions#layer-1-complete-the-elementary-theory-of-existing-distributions`.

The target's sole cited sibling is `research/blueprint/links/tauceti_TauCetiRoadmap_StandardDistributions.json`. That sibling has **no accepted review**, and there is no corresponding `data/links` packet. A scan of every `links` entry in both directories finds this pair only in that unreviewed research packet. This contradicts treating the omission as a dependency already secured for the atlas, even though the red team's narrower statement that the sibling text contains the pair is literally true.

The mathematics supports the edge. I read B1, StandardDistributions Layer 1 and its explicit ownership boundary. The latter says “The determinacy theorem belongs to the orthogonal-L²-bases roadmap; use it for uniqueness from moments.” The pinned measure-level theorem supplies uniqueness for two finite real measures with all polynomial moments equal and positive exponential integrability on **both** measures. The existing sibling reason preserves these qualifications and the extra transport/recovery needed for native natural-valued laws. This is library reuse; neither roadmap should reprove determinacy. It is not an unconditional edge for every moment computation or for heavy-tailed laws.

I inspected the actual production code, not just the static atlas snapshot:

- `scripts/promote.py`, `decide` (line46), refuses promotion without an accepted review. Direct evaluation on the sibling returns `('skip', 'no accepted review')`.
- `scripts/build.py`, `assemble` (lines70–75), loads link packets from `data/links`.
- `scripts/decompositions.py`, `merge_links` (line267), iterates `links`, requires an accepted review, deduplicates ordered endpoint pairs, checks cycles, and updates `requires`/`consumers`. It does not consume `alreadyRecorded`.
- Promotion signatures are hashes of the accepted review object (`scripts/promote.py`, line34). Editing a previously promoted research packet without renewed review does not republish it.

At the recorded input revision, executing `assemble(require_distances=False)` in memory gives **2,840 stages and 8,007 stage edges**. Both endpoints exist. The direct edge, the consumer's `requires` entry and any supplier-to-consumer transitive path are absent. Merging the original focal packet again leaves 8,007 edges. Inserting the existing qualified sibling link into an in-memory copy of the accepted focal packet yields 8,008 edges, passes the real cycle check, and adds the prerequisite. Repeating insertion still yields 8,008 edges. No generated data or source packet was changed.

The correction should be independently verified and routed as a medium-severity missing dependency. Put this qualified edge in an accepted, promoted packet; restoring it to the focal packet is a direct route. Replace the misleading `alreadyRecorded` entry and revise the map/review/red-team narrative. Obtain renewed independent acceptance and promotion. Do not approve the entire sibling packet merely to rescue one edge, write directly to generated graph data, or turn an existing library theorem into a new implementation target. Eventual review and promotion of the sibling could also supply the edge; the current graph does not contain it.

## Positive checks and their limits

The retained B2/Peter–Weyl rescope is sound at the checked declarations. Both evidence quotations are exact substrings of the current source documents. B2's real, natural-number-indexed input family does not directly accept the arbitrary complex matrix coefficients and irreducible-skeleton index of CompactGroups Layer5. Generic Hilbert-basis assembly is already available in Mathlib. The map appropriately keeps Schur orthogonality, skeleton data, density and the element identity with their owners.

I reopened the following public primary sources at the prescribed commits, including surrounding assumptions:

| Source | What was checked |
|---|---|
| [Mathlib l2Space](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/l2Space.lean#L533) | `HilbertBasis.mkOfOrthogonalEqBot` and its coercion theorem take an arbitrary-index orthonormal family, trivial orthogonal complement, `RCLike` scalars and a complete inner-product space. |
| [Tau Ceti WeightedOrthogonalBasis](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean#L169) | Arbitrary measurable domain but `f : ℕ → α → ℝ`. Weighted-measure assembly needs nonnegative measurable weight and supplied orthogonality, membership and completeness; transport onto the reference space requires a.e. positive weight. Both element-level identities were read. |
| [Tau Ceti Determinacy](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Probability/Moments/Determinacy.lean#L148) | `Measure.ext_of_forall_integral_pow_eq` and its positive-exponential-integrability variant require two finite real measures, the near-zero integrability condition on each, and every moment including degree zero. |
| [Tau Ceti EigenspaceRepresentation](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/EigenspaceRepresentation.lean#L225) | Finite algebraic eigenspace sums give representative membership; arbitrary inputs with symmetric kernel give membership in the uniform closure. Compact topological-group and Borel-space assumptions were read. |
| [Tau Ceti RepresentativeDensity](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/RepresentativeDensity.lean#L117) | The approximate-identity argument supplies uniform density. The proof installs the Borel structure internally; point separation is a subsequent corollary. |

The finite-sum sentence in CompactGroups still overstates arbitrary convolution. The accepted map already acknowledges its uniform-closure correction, so this review does not repackage it as a new omission. Similarly, a zero weight on one point of a two-point counting space prevents the square-root-weight map from being onto reference L²; this independently explains the positive/nonnegative distinction preserved by the accepted map.

I read the red-team report and checked inventory, the accepted target excluding no mathematical decision fields, the relevant reviewed B1/B2/B3 library-audit records, and the endpoint passages above. I did not repeat the entire catalogue screen, audit all product-basis or Hermite implementation proofs, or validate the unrelated sibling packet as a whole. No additional absence claim is inferred from this limited verification.

## Reproduction and validation

The essential graph check can be repeated from this input revision without writing build outputs:

```python
import copy, json, sys
sys.path.insert(0, 'scripts')
from build import assemble
from decompositions import merge_links
from promote import decide
p = 'research/blueprint/links/'
focal = json.load(open(p + 'tauceti_Completed_OrthogonalL2Bases.json'))
other = p + 'tauceti_TauCetiRoadmap_StandardDistributions.json'
sibling = json.load(open(other))
edge = next(e for e in sibling['links'] if 'OrthogonalL2Bases' in e['source'])
atlas = assemble(require_distances=False)[0]
pair = (edge['source'], edge['target'])
assert pair not in {(e['source'], e['target']) for e in atlas['stageEdges']}
assert decide(other, sibling, [], {}) == ('skip', 'no accepted review')
probe = copy.deepcopy(focal)
probe['links'] = [edge]
after = merge_links(atlas, [probe])
assert len(after['stageEdges']) == len(atlas['stageEdges']) + 1
assert len(merge_links(after, [probe])['stageEdges']) == len(after['stageEdges'])
```

The companion JSON records input hashes and counts. The full original link checker reports zero errors and warnings, illustrating that structural validation alone does not catch this promotion gap. The red-team verification checker, intake validation for the assigned files and handoff, and whitespace checks pass. No Lean file was required or compiled; no library build or language server was started.
