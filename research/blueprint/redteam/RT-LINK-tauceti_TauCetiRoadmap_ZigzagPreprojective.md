# Red-team audit: Zigzag, preprojective and Ginzburg link map

Codex — codex-rtOQ9t · 2026-09-30 · issue #4380.
Target: LINK-tauceti_TauCetiRoadmap_ZigzagPreprojective.
Base: `75003a68838084dc3b0cfec12fd5064e3ca21be4`.

**One medium finding:** an acknowledged projective-cover dependency is stranded in an unreviewed research packet. The thirteen executable links and seven overlap recommendations withstand the checks below. This report is independent of author cgp-0d58f52c658d and reviewer codex-7e92bd; its finding still requires independent verification.

## 1. Missing integrated Quiver3 → Zigzag3 dependency

The exact pair is:

- Supplier: `tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations#layer-3-the-structure-of-a-finite-dimensional-algebra`.
- Consumer: `tauceti:TauCetiRoadmap/ZigzagPreprojective#layer-3-projectives-graded-cartan-matrices-and-q-euler-forms`.

The accepted map's `alreadyRecorded[0]` correctly points to an occurrence in
`research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_QuiverRepresentations.json`.
Its summary counts that occurrence toward completeness. However, the sibling is
`partial`, has no independent review, and has no promoted `data/links` copy.
Production assembly consumes promoted packets' `links`, not this bookkeeping field.

The [supplier's Layer 3](https://github.com/CBirkbeck/tauceti-explorer/blob/75003a68838084dc3b0cfec12fd5064e3ca21be4/content/tau-ceti/RepresentationTheory/QuiverRepresentations/README.md#layer-3-the-structure-of-a-finite-dimensional-algebra)
exports primitive idempotents, projective covers and ordinary composition-factor Cartan data.
In particular, lines 288–291 ask for a projective cover with superfluous kernel and uniqueness.
The [consumer's Layer 3](https://github.com/CBirkbeck/tauceti-explorer/blob/75003a68838084dc3b0cfec12fd5064e3ca21be4/content/tau-ceti/ZigzagPreprojective/README.md#layer-3-projectives-graded-cartan-matrices-and-q-euler-forms)
asks for the graded projective `Z e_i`, head, radical layers and comparison with the
bound-quiver/module interface. The existing metadata explicitly acknowledges this ordinary input;
the graph should preserve it.

The production assembler gives 2,840 stages and 8,007 directed pairs. All thirteen focal
links appear both as edges and in `requires`. This extra pair appears in neither, and
breadth-first search finds neither a forward dependency path nor a reverse path.
In a local diagnostic, passing only this edge through the production merger yields
8,008 pairs, fills the consumer's `requires`, and passes the cycle check. Repeating
the merge keeps 8,008 pairs. The diagnostic used an in-memory acceptance marker solely
to exercise the merger; it is not a review and was not saved to atlas inputs.

**Fix after verification:** independently record this one justified pair in the focal map,
unless the sibling has already been accepted and integrated by fix time. Keep a single
canonical graph pair. Preserve finite-dimensional split/basic hypotheses, actual graded
projective covers, restriction to relation-annihilating modules, and the Cartan transpose.
Do not promote the surrounding partial sibling packet. Update the metadata and provenance,
then check the assembled edge and `requires` after normal promotion.

This is **medium**, not a claim that projective-cover theory is mathematically unavailable.
The pinned Tau Ceti already contains the relevant generic predicate and existence theorem.
No new definition or redundant construction is requested.

## 2. Exhaustive focal link check

Abbreviations: Q = QuiverRepresentations, R = RootSystems, S = StablePeriodicCurved,
G = GrothendieckEulerForms, D = DGAInfinity, Z = ZigzagPreprojective.

| Links | Interface and boundary checked |
|---|---|
| Q0 → Z0 | Finite vertex set gives the unit; finite paths give finite dimension. Doubled graphs need not be acyclic. Products are later-factor-first. Vertex idempotents must be included among generators. |
| R6 → Z0 | Numbered finite Cartan data supplies the deletion comparison; affine marks and semidefinite forms are distinct. Affine A1 is not a simple-graph Cartan matrix. |
| S0 → Z2 | Package a proved nondegenerate trace in the generic Frobenius interface, with the right/left dual convention. Generic self-injectivity must not depend on the example. |
| Q1 → Z3 | The unbound equivalence needs a relation-annihilator restriction before applying to a quotient. It does not replace Q3's projective-cover input. |
| G4, G6 → Z3 | Split/basic projective and simple bases, entrywise Cartan comparison, shift convention and both cohomological/internal finite support. Completed inverse series are separate from Laurent Euler values. |
| G3, D11 → Z5 | Linear resolutions can be infinite; numerical inverse series do not prove Koszulity. Use the relative dual over `k^I`, explicit opposites and actual relation-annihilator/exactness computations. |
| D9 → Z6 | Smooth inverse-dualizing tensor completion, Pi2/Gamma3 degrees, potential class and any required negative-cyclic lift. Proper/Serre conclusions and length completion require separate hypotheses. |
| D3, D8, D11 → Z7 | Actual contraction and splitting data; unit normalization; braces in arbitrary characteristic; rational exponential gauge only under its hypotheses; named HH grading comparison; augmentation, finiteness and completion boundaries. |
| D6 → Z8 | Transport of an already constructed action through an actual invertible bimodule with coherence. This constructs neither a McKay equivalence nor braid faithfulness or sphericality. |

All **42** quotations, including overlap evidence, occur verbatim in their raw README files
and in the stated line intervals. All **seven** overlap recommendations remain justified:
generic quotient ownership; Cartan transpose; finite/affine diagrams; relative versus graph
duality; generic stable categories versus examples; Hochschild regrading; and abstract CY
completion versus explicit presentation and Serre consequences.

The already documented R-PATH, R-BOUND, R-CARTAN, R-KOSZUL, R-HH, R-CY, R-STABLE and
R-MCKAY obligations are not new findings. For example, the two-isolated-vertex algebra is
`k × k`, whereas the empty-arrow unital subalgebra consists only of diagonal scalars.
For `1 → 2`, the quiver convention gives `[[1,1],[0,1]]` and the projective-column
convention gives its transpose; the symmetric zigzag matrix would hide this distinction.
Dual numbers have Cartan matrix `[2]` and an infinite simple projective resolution.
These checks support the map's qualifications rather than an unconditional Euler or
unimodularity claim.

## 3. Pinned-library and source checks

There are **no accepted library-coverage entries** for the nine focal layers.
`research/blueprint/audit/AUDIT-44.json` is an assignment, not an audit verdict.
Missing coverage must not be read as missing implementations.

Actual statements read at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `Quiver/PathAlgebra/Basic.lean`: `pathAlgebra`, `pathAlgebraBasis`,
  `ofPath_mul_ofPath_of_comp`, left/right vertex-idempotent identities and finite-vertex unit.
- `Algebra/Module/ProjectiveCover/Basic.lean:105–111`:
  `IsProjectiveCover` packages projectivity, surjectivity and superfluous kernel.
- [ProjectiveCover/Existence.lean:194](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Module/ProjectiveCover/Existence.lean#L194):
  `exists_isProjectiveCover_of_finiteDimensional` applies to every module over a
  finite-dimensional algebra, without requiring that module itself finite.
- [Zigzag/Projective/Basic.lean:145](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Quiver/Zigzag/Projective/Basic.lean#L145):
  `zigzagProjective_projective` constructs projectivity of the vertex ideal by a split
  projection. Its carrier is the relation quotient; no-isolated-vertex hypotheses remain
  relevant to the later primitive-idempotent/basis statements.
- `RootSystem/DynkinType.lean`: finite type constructors and Bourbaki Cartan matrix.
  `RootSystem/AffineDynkinType/Basic.lean:359–382`: a separate affine matrix API,
  its A1 double edge and the `IsGraphical` comparison.

Thus the old focal README's blanket claim that affine diagrams are absent is not a
current library inventory. This link-map review does not certify that stale prose:
the accepted map expressly disclaims implementation certification, and its finite/affine
ownership distinction remains sound. Future blueprint work should consume the actual
affine and zigzag APIs.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`RingTheory/TwoSidedIdeal/Operations.lean:329–356`: the left-ideal conversion and its
two-sided instance. No private quotient-closure predicate is needed.

Selected primary sources, fetched on 2026-09-30:

- [Liu–Wang, arXiv:2301.06757v3](https://arxiv.org/pdf/2301.06757v3),
  Theorem 1.1, Corollary 3.4 and §§4.1–4.4. These confirm the finite-tree/bad-characteristic
  boundary, the exceptional small-graph definitions, the Adams regrading and the need for
  completion after forgetting it. Proposition 4.4 and Remark 4.5 distinguish derived
  and classical duality.
- [Huerfano–Khovanov, arXiv:math/0002060v2](https://arxiv.org/pdf/math/0002060v2),
  §6.3, pp. 13–14, Propositions 16–18. The binary-group hypothesis matters; odd cyclic
  groups use the skew relation. Action transport does not construct the equivalence.

These were selected interface checks, not a proof audit of every paper cited by the roadmap.

## 4. Missing-link and duplication search

The raw snapshot has 212 roadmaps and 1,968 stages. The actual assembly has 211 roadmaps
and 2,840 stages after retirements and overlays. Also screened nine new definitions,
143 research packets, 51 decompositions and reserved IDs. A narrower interface search
returned 41 assembled roadmap candidates; this count includes false positives, not 41
fully audited roadmaps.

Freshly checked the closest contracts beyond the recorded endpoints:

- StablePeriodicCurved Layer 2 constructs generic stable and singularity categories.
  Zigzag supplies examples; the generic theorem does not acquire a reverse dependency.
- RootSystems Layer 3's Matsumoto theorem requires braid relations rather than proving
  the bimodule homotopies. GeometricTopology Layer 4's ordinary braid presentations,
  ArithmeticQuantumTopology QT.1's ribbon braidings and inverse-Galois/Belyi branch
  actions do not export the required arbitrary-graph derived action.
- DerivedDeRham DD.1 and EnhancedDerivedSheaves E4 concern commutative ideal-derived
  completion and its sheaf application. RefinedTraceMethods RT.1 supplies cyclic chains;
  that alone is not the normalized Hochschild cochain obstruction interface.
- Arithmetic Frobenius and Hochschild–Serre hits were screened as different notions.
  No integrated McKay definition or consumer stage exists in the searched inputs.

The only additional exact dependency established here is finding 1.
The target still needs the future McKay integration check when a real endpoint lands.

## 5. Validation and fingerprints

`scripts/check_links.py` on the unchanged accepted packet: **0 errors, 0 warnings**.
`scripts/check_redteam.py`, intake `check-files` for these two deliverables, and
`git diff --check`: pass. Production assembly and the one-edge diagnostic passed.
No Lean file is required or compiled; no library build or generated atlas edit occurred.

| Input | SHA-256 |
|---|---|
| Accepted research map and promoted copy | `6c8de93ad421f59bff577fa558047627baa60ea47d152997e43dd24b14d7d78c` |
| Partial QuiverRepresentations map | `91978785257c6264af75b237ec5da4942aaa7d237ff9992b6dc3df06924a2568` |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| `data/library-coverage.json` | `6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a` |
| Liu–Wang PDF | `d2b6f7987aebae2e41659a0d0a4198107951afc36f6f9885b98d785af67390e7` |
| Huerfano–Khovanov PDF | `fa1f2fbb4819ff2a2c8f81a0079ef870e1405c1eec57daa3b92d32b5a05567df` |
