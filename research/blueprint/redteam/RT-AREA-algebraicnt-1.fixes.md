# RT-AREA-algebraicnt-1: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3960).
- Findings: `RT-AREA-algebraicnt-1.result.json`.
- Verdicts: `RT-AREA-algebraicnt-1.review.json`.
- One finding, confirmed "narrowly". The review corrects the fix, and the corrected contract is followed here.

The finding names `research/blueprint/atlas/roadmaps/GeometryOfNumbersAndQuadraticArithmetic.json`. That file is a generated atlas export, and so are the roadmap-level `prerequisites`/`consumers` fields it asks to edit. The review says not to hand-edit generated exports, `data/atlas.json` or upstream Tau Ceti documents. Instead, record source-backed supplier-stage → consumer-stage links in the maintained link workflow and let assembly derive the roadmap-level relations.

Link packets are the outputs of link jobs and are integrated from `data/links/` after review, not by a fix job. So this report gives the exact link entries **for the maintainer and the link workflow**, and changes no other file.

## /1 (medium, error): GN's source-backed suppliers are missing from the assembled graph

### What was checked

**The consumer stages.**
- GeometryOfNumbersAndQuadraticArithmetic:GN.2, "Quadratic and hermitian local-global theory", says: "Integrate Witt groups, discriminants, Clifford/Hasse invariants, local classification and Hasse-Minkowski; add integral lattices, genera, spinor genera and quaternionic/hermitian variants". Its `requires` is only GN.1 and LI.4.
- GN.3, "Reduction, mass and theta series", says: "Construct reduction domains and arithmetic quotients, local representation densities, mass formulas … Specify Haar measures". Its `requires` is only GN.2.

**Existing link records.**
- `research/blueprint/links/tauceti_TauCetiRoadmap_GlobalQuadraticForms.json` already contains two links with quoted evidence: `GlobalQuadraticForms#layer-5-hasseminkowski-isotropy` → GN.2 and `#layer-6-representation-and-isometry` → GN.2. The packet is `partial` and is not in `data/links/`, so assembly does not yet see them. This is why the review found no such direct prerequisite.
- `research/blueprint/links/tauceti_Completed_IntegralLattices.json` (`partial`, also not in `data/links/`) records the GN.2 relation only as an overlap with Layer 1, with no link.
- No link packet exists for `tauceti:TauCetiRoadmap/QuadraticFormInvariants`.

**The review's corrections.**
- The finding's proposed GN.2 → supplier direction is backwards.
- Every layer of a supplier need not be required; choose exact edges from the contracts.
- Built APIs are imported, not rebuilt.

**Acyclicity.** In `data/atlas.json` (stage `requires` plus `stageEdges`), neither GN.2 nor GN.3 reaches any of the twelve supplier stages below. The review reports the same for the assembled roadmap graph. The stage-level cycle check has to be repeated when the links are integrated.

### Link entries for the maintainer and the link workflow

Each entry is in the link-packet form: `source` → `target`, with the reason and the evidence to quote.

**1. Integrate the existing GlobalQuadraticForms links (no new text).** When `tauceti_TauCetiRoadmap_GlobalQuadraticForms.json` is accepted into `data/links/`, its two GN.2 links carry the Hasse–Minkowski and rational-isometry supply:
- `…/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy` → `GeometryOfNumbersAndQuadraticArithmetic:GN.2`;
- `…#layer-6-representation-and-isometry` → GN.2.

**2. QuadraticFormInvariants → GN.2** (a new link packet for `tauceti:TauCetiRoadmap/QuadraticFormInvariants`, or an addition to its link job). The target evidence for each is GN.2's "Integrate Witt groups, discriminants, Clifford/Hasse invariants, local classification".

| Source stage | Reason |
|---|---|
| `…/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory` | hyperbolic planes, Witt decomposition and cancellation: the Witt theory GN.2 integrates |
| `…#layer-3-the-classical-invariants-that-need-no-brauer-group` | the discriminant and the other classical invariants of a diagonalization (not the Hasse invariant, which is Layer 5) |
| `…#layer-4-the-witt-ring-and-the-fundamental-ideal` | the Witt ring and its fundamental ideal: "Witt groups" |
| `…#layer-5-the-brauer-valued-invariants` | the quaternion symbol and the Brauer-valued Hasse/Clifford invariants |
| `…#6d-the-classification-and-its-corollaries` | the local classification of regular forms over a nonarchimedean local field |

**3. IntegralLattices → GN.2** (additions to `tauceti_Completed_IntegralLattices.json`, keeping its Layer 1 overlap). The target evidence is GN.2's "add integral lattices, genera, spinor genera". The consumer builds genera and spinor genera on these carriers and does not re-plan them.

| Source stage | Reason |
|---|---|
| `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms` | the bundled integral symmetric lattice and its API |
| `…#layer-2-duality-and-the-finite-discriminant-group` | dual lattices and the finite discriminant group A_L, the discriminant input |
| `…#layer-4-overlattices-and-isotropic-subgroups` | overlattices and isotropic subgroups of A_L, the gluing operations the accepted paper routes name |

**4. AdelicAlgebraicGroups → GN.3.** AdelicAlgebraicGroups is a campaign roadmap, so these can be recorded either as links or on GN.3's "Inputs" line in `content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md`; the maintainer chooses. The target evidence is GN.3's "Construct reduction domains … Specify Haar measures and finite stabilizer weights".

| Source stage | Reason | Evidence |
|---|---|---|
| `AdelicAlgebraicGroups:AA.2` | invariant quotient measures (Weil's integral formula) for the mass formula's Haar measures | "Construct invariant quotient measures by Weil's integral formula" |
| `AdelicAlgebraicGroups:AA.3` | Siegel sets and reduction theory for the reduction domains | "Construct minimal rational parabolics, relative positive chambers, Siegel sets" |

Once integrated, assembly derives the roadmap-level prerequisites of GeometryOfNumbersAndQuadraticArithmetic and the reciprocal `consumers` of the four supplier roadmaps.

**Kept.**
- The generated atlas exports, `data/atlas.json` and the upstream Tau Ceti roadmap documents are not edited.
- No supplier layer is required wholesale.
- No construction node is added for built APIs.
- The existing GlobalQuadraticForms links and the IntegralLattices overlap are preserved.
- As the review notes, the finding's "nowhere machine-readable" and ordering claims are too strong: the relations were partly recorded and the suppliers were reached transitively. The correction is only to make the direct, source-backed supplier contracts explicit.
