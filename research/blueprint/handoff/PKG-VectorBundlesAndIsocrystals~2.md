# PKG-VectorBundlesAndIsocrystals~2

Completed by Codex, session `codex-dtS0WV`, on 9 October 2026.
Issue: [#7914](https://github.com/CBirkbeck/tauceti-explorer/issues/7914).
Branch: `codex-dtS0WV-vector-bundles-package-revision`.
Claim confirmation: [bot reply](https://github.com/CBirkbeck/tauceti-explorer/issues/7914#issuecomment-6087104113).

This is a complete package revision. The next action is independent package
review. No mathematical target has been dropped to accommodate an unsupported
Lean type, and elaboration does not claim implementation of admitted results.

## Deliverables and repair ledger

The [README](../packages/VectorBundlesAndIsocrystals/README.md) retains the
accepted 127 targets, 168 API entries and 124 tests, with their mathematical
hypotheses and source locators. Its final size is 195,194 bytes. The previous
review's arithmetic Artin/Lubin–Tate ownership correction and GLX v3 locator
are preserved. The paired finite/free witness, reciprocal-slope signs,
classical sympathetic hypotheses and separate geometric/Robba polygon
semicontinuity conventions remain explicit.

The [Suggested.lean](../packages/VectorBundlesAndIsocrystals/Suggested.lean)
now distinguishes expressible components from full contracts with omitted
signatures. The VB3 index includes the accepted source identifiers and exact
locators at every target. Each new omission states which actual carrier,
comparison or hypothesis is missing. Arbitrary categories, functors, maps,
height functions and slope profiles no longer stand in for geometric
hypotheses that constrain a theorem. The revision adds no arbitrary proposition
field, assumed conclusion or replacement geometric predicate.

| Review concern | Revision |
| --- | --- |
| Arbitrary Lubin–Tate modules and short complexes | Omit `LubinTateUniversalCover`, `FundamentalExactSequence` and `FamiliesOfBanachColmezSpaces`; retain the actual cover, untilt sequence, E∞ and family-slope/locality contracts. |
| Equivalences of arbitrary categories | Omit `SlopeZeroLocalSystems`, the seven `PureComparisons` declarations, `AbstractBC.leBras` and `LeBrasEquivalence`; specify the genuine ring, site, local-system, finite-length and sympathetic categories in the index. |
| Zero-preserving functors mistaken for exact faithful evaluation | Omit `ExactBanachPoints`, arbitrary `BC.baseChange` and the degenerate-complex fixture. Keep actual cohomology, a genuine short-exact input for the long sequence and the functorial algebraic components. |
| Arbitrary presentation dimensions and invariants | Omit `BCPresentation.dimension`, `BCHNInvariants.additive` and `EulerPoincareHeight`. Require `[constant.Additive]` in `BCPresentation.stabilize`; its two short exact complexes and finite rank increments remain explicit. `BCHNInvariants.fromHeart` is a concrete numerical conversion, with its zero flag separately distinguished from a geometric zero-object theorem. |
| Unsupported tilted-heart constructors and splitting | Require zero-object and isomorphism compatibility of the supplied profiles in `BCTiltedHeart.positive`, `.negative` and all four fixtures. The objects are the actual single-degree derived embeddings. Omit `.split`, whose curve-specific Ext² vanishing is unavailable. |
| Pure-model base change and lattice hypotheses | Omit `PureModel.baseChange`. Preserve boundedness by p-power commensurability with a finite R-submodule, without assuming the lattice finite. Add nonzero uniformizer and coefficient-Frobenius fixedness; correct unit/zero fixtures accordingly. Explain that B-span and setwise normalized Frobenius do not supply the missing integral linearization or tensor-identification theorem. |
| Arbitrary curvature targets, heights and period maps | Omit orthogonality, Artinian, height-sign, torsion-subobject, generating-image, nonpositive-extension, torsion Hom-vanishing, morphism-calculus and curvature/HN comparisons. Keep genuine Hom predicates, their isomorphism invariance, mono/epi subquotient consequences and natural-map kernel intersections. Remove fixtures asserting period identities for arbitrary objects. |
| Arbitrary profiles assumed open or semicontinuous | Omit `PointwiseAmple.isOpen`, `PurityOpenness`, `AdicPurityLoci`, both polygon semicontinuity declarations and `BoundedPolygonsDenseLocus`. Keep explicitly numerical positivity, pullback/descent and finite-profile components. |
| Arbitrary ranks, bases, gauge matrices and fibre maps | Omit `AnnularBasisApproximation`, `PureModelTrivialization`, `DiagonalGaugeNormalForm`, `ConstantVertexSubmodule`, `RobbaConstantPolygonFiltration` and `NegativeFrobeniusCohomologyDetection`; retain given-basis, matrix-bound, rank, proper-vertex, strict-gap, negative-slope and canonical-restriction requirements in their contracts. |
| Absolute BC spatiality and projectivized geometry | Omit arbitrary-space spatiality/non-quasiseparation, projectivized properness, divisor comparison and quaternion/SL₂ examples. Keep the explicitly objectwise scalar-orbit quotient and the contracting-action lemma with all its genuine topological hypotheses. |
| Generic categories used for curve resolutions/cohomology | Omit positive/strict-positive resolutions, relative cohomology vanishing, relative HN splitting, étale-at-point resolution, nonnegative extension and geometric positive generation. Keep each full source-level target, including global versus local vanishing and direct-summand alternatives. |
| Empty or tautological flags substituted for classification | Omit `BcHnDecomposition` and the arbitrary Robba/HN filtration prototypes; retain classification and graded-piece contracts. |

In total, 66 formerly executable VB3 declarations and examples became explicit
omissions. The index retains all their names and intended contracts; this count
is not a formalization count. The generic `CurveBundle` reconstruction and its
free/pullback/finite-presentation examples were also removed for the current
supplier reason below.

## Existing upstream ownership

I read current AlgebraicVectorBundles and AdicSpaces READMEs in full, inspected
the relevant AlgebraicVectorBundles suggested interfaces, and checked current
Tau Ceti source files before revising the package. The upstream roadmap
checkout was `de435a569d325b365a30fe83269ce34674eaea80`; the current library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

AlgebraicVectorBundles L0A–L0C owns the generic schematic finite locally free
category and rank/tensor/pullback/dual/determinant infrastructure. Current
`TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`, its free objects and pullback,
`pullbackId`, `pullbackComp`, and
`SheafOfModules.isFiniteLocallyFree_iff_exists_isLocallyFreeData_isFiniteType`
provide the relevant existing interfaces. These modules postdate the executable
pin. The README imports them and leaves only the analytic FF specialization
and schematic/analytic comparison as new obligations here. The VB0 contract
index marks the old generic signatures/examples as supplier omissions rather
than redeclaring those current interfaces under a new structure.

The package issue does not authorize updating the accepted packets. Their
generic `CurveBundle` entries should therefore be reconciled with the current
AlgebraicVectorBundles supplier in a later authorized integration. No upstream
roadmap or library was changed. ClassFieldTheory supplies arithmetic local
reciprocity; it does not supply Lubin–Tate theory, whose R07.1–R07.2 ownership
is unchanged.

## Source checks

I read the hypothesis-sensitive passages in these freely available editions.
The SHA-256 values agree with the recorded editions. No restricted book was
needed and no source passage was copied into the deliverables.

- FS, [Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
  `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`:
  Propositions II.2.2–II.2.4, pp.60–61; Lemma II.2.17, pp.72–74;
  Theorem II.2.19 and Corollary II.2.20, pp.74–75; Proposition II.3.1,
  p.75; Corollary II.3.3, p.78; Proposition II.3.4, p.79; Proposition II.3.5,
  pp.79–81, and the absolute BC examples through p.85.
- KL, [1301.0792v5](https://arxiv.org/pdf/1301.0792v5),
  `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`:
  Lemmas 7.1.1–7.1.2, pp.145–146; Definition 7.3.1, p.147 and Remark 7.3.2,
  p.148; Proposition 7.3.6, pp.149–150; Theorem 7.3.7, p.150 and
  Corollaries 7.3.8–7.3.10, p.151; Lemma 7.4.4, p.152; Theorem 7.4.5,
  p.153; Proposition 7.4.6 and Corollary 7.4.7, pp.153–154; Theorem 7.4.9, p.155;
  Corollary 7.4.11 and Remark 7.4.12, pp.155–156.
- CN, [author copy](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf),
  `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a`:
  §3.1.1, p.12; Remark 3.1 and Proposition 3.2, p.13; §§3.2.4–3.2.5,
  pp.15–16; Corollary 3.18 and curvature definitions, p.18;
  Remark 3.22, Proposition 3.23 and Lemma 3.24, p.19.

These checks confirm which actual hypotheses the omitted prototypes lost.
Other mathematical targets and source locators are transferred from the
accepted plans, not claimed as a new independent review of every source.

## Validation

- Final whole-file `lean-check research/blueprint/packages/VectorBundlesAndIsocrystals/Suggested.lean`:
  **exit 0, no errors, 156 warnings, all declaration-uses-sorry warnings**.
  Available memory before the run was 106 GB. Checks were serial for this
  worker; no language server or library build/update/cache command was used.
- Both unchanged accepted packets passed `python3 scripts/check_blueprint.py`:
  **0 errors and 0 warnings** each (51 VB0 nodes and 76 VB3 nodes).
- Content audit: 127 distinct target anchors, source blocks and prerequisite
  blocks; every accepted node ID occurs in the suggested contract index;
  all 168 API names and all 124 test names occur in both deliverables;
  local target links resolve; README below 200,000 bytes.
- `python3 research/blueprint/intake.py check-files` passed on the three
  changed deliverables: **3 files, 0 problems**; `git diff --check` passed.
- Metadata remains exactly `topic = "math.NT"`. The previous `review.json`
  remains unchanged for the next independent reviewer.
- All 29 recorded baseline declaration statements were inspected at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. The library audit has no dedicated
  row for this roadmap; nearby Bun_G/p-adic Hodge entries do not provide its
  higher-rank classification, FF HN or BC geometry.
- The shared Mathlib build has the exact pinned commit. All seven transitively
  imported Tau Ceti source files were authenticated byte-for-byte against the
  Tau Ceti pin: `AdicSpace.Spa.Basic`, `AdicSpace.Cont.Basic`,
  `AdicSpace.ValuationSpectrum`, `Valuation.Continuous.Basic`,
  `Valuation.Trivial`, `Valuation.ValuativeRel.Basic` and
  `Valuation.ValuativeRel.Comap`. Current finite-locally-free modules are cited
  as later suppliers and are not imported into this pinned executable file.

## What remains

The package revision is complete; its independent reviewer must assess the
repaired components and explicit omissions. All implementation and supplier
obligations recorded in the accepted plans remain mathematical requirements.
In particular, this revision does not supply general-E classification,
independent FF chart coverage, meromorphic trivialization/degree bounds,
the corrected contraction argument, perfected analytic-line comparison,
normalized Lubin–Tate crystalline Hom, uniform untilt contraction/escape,
spatiality criteria, Le Bras full faithfulness, arbitrary-VS bounded-image
comparison, Witt/Robba patching or the integral Tannakian dictionary.
The [original handoff](PKG-VectorBundlesAndIsocrystals.md#inherited-mathematical-obligations-and-plan-observations)
records those inherited proof and supplier boundaries in detail. The README's
early fundamental sequence remains separated from the later VS1 divisor/Weil
comparison. None of these missing implementations is disguised by an assumed
geometric signature in this revision.

Only the package README, Suggested.lean and this handoff changed. Input
packets, component readers/suggested files, metadata, ownership/link files,
review verdict and atlas data were left intact. Disposable sources and logs
are not required for continuation; the commands, versions and results above
are sufficient to reproduce the validation.
