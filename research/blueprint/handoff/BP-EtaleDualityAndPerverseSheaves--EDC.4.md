# Handoff: BP-EtaleDualityAndPerverseSheaves--EDC.4

Job: blueprint of EtaleDualityAndPerverseSheaves, part EDC.4 (part 2 of 2): stages EDC.4, EDC.5,
EDC.6, EDC.7, EDC.8. Issue #722. Worker: Claude (session claude-cAjmWk), 6 October 2026.

## Deliverables

- `research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`: status `complete`.
- `research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.4.md`: the reader document,
  rendered from the packet (node sections, requests, gaps, restructuring, sources, coverage), so
  the two agree.
- `research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean`: the suggested file.

## State

- 62 nodes: 5 definitions, 10 constructions, 44 theorems, 2 comparisons, 1 application. By stage:
  EDC.4 13, EDC.5 20, EDC.6 8, EDC.7 11, EDC.8 10.
- 93 API items, 58 unit tests, 19 planets (EDC.4 3, EDC.5 6, EDC.6 1, EDC.7 5, EDC.8 4).
- 11 baseline declarations, each read in the Mathlib source at 082e2d3.
- 13 requests, 5 gaps, 5 restructuring entries, 3 source issues (ids E11–E13, continuing part
  EDC.0's E1–E10).
- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- Every stage in scope is `planned`. None is `closed`: the packet keeps requests and gaps. The
  `remaining` lists name lemma-level refinements and the two unavailable sources.
- The node of the integrated decomposition, `EDC.6/scheme-adic-diamond-operation-comparisons-index`,
  keeps its identifier. It is re-sourced from ECD §27, read for this job, and Huber's theorems are
  now cited through ClassicalAdicEtaleCohomology H5's accepted nodes.

## Suggested Lean file: compiled

`lean-check` elaborated the file in the shared build at Mathlib 082e2d3: exit 0, 255 warnings, all
`declaration uses sorry`. Only Mathlib is imported.

- Every API item and unit test of the packet appears under its packet name. This was checked by a
  script: API items are declarations, and tests are `example`s whose docstring reads "Test `<name>`".
  No name is left as a comment.
- The abstract t-structure material is typed against Mathlib's own carriers: `TStructure`, hearts,
  `AbelianSubcategory`, `IsHomological`, the canonical t-structure on `DerivedCategory`, and opposite
  triangulated categories. t-exactness, `Recollement` and the weight predicates are real definitions,
  with no `sorry` bodies.
- Everything owned elsewhere is a data stand-in with a `sorry` body, labelled with its owner:
  - from part EDC.0 and CohomologicalPointCounting: D^b_c, the six operations, Verdier duality,
    twists, cohomology groups, Gysin and restriction maps;
  - from SchemeAndStackFoundations SF.0: blow-ups, projective bundles and locally free sheaves;
  - from DWP.8: mixed complexes and pointwise weights;
  - Ekedahl's ℓ-adic category, analytic and diamond coefficients, and the stand-ins used by the
    correspondence nodes.
- No condition is replaced by a `Prop`-valued stand-in. HasWeightsLE and HasWeightsGE are
  defined from the imported pointwise-weight data exactly as in BBD 5.1.8.
- Some statements are typed in a simplified form, as the file header says. Examples:
  - constant coefficients instead of local systems;
  - affine complement instead of "hyperplane section";
  - the inductive step of the complete-intersection theorem;
  - one step of the weight filtration;
  - direct-summand forms of the decomposition theorem.

  The packet states them in full.

## How the job's special inputs were handled

- **RS-19** (accepted) keeps every EDC layer; the plan follows its `owners` and links (EDC.5 →
  ET.5, EDC.6 → ET.5, EDC.7 → ET.2b are consistent with the nodes).
- **RT-AREA-etale/3 (stacks).** Scheme-only throughout. The first restructuring entry endorses part
  EDC.0's Part II "Artin and Deligne–Mumford stacks" and names which EDC.5/EDC.7/EDC.8 nodes it
  imports; the first gap lists the stack consumers (GS.1, GS.3, ET.2b, YUN-ZHANG-17/35,
  YUN-ZHANG-19/120, LAFFORGUE-18/48).
- **RT-AREA-etale/16 (perfect schemes).** Zhu's E04, E05 and E06 are sources of
  `EDC.5/perverse-t-structure`, `EDC.5/intersection-complex` and
  `EDC.7/proper-direct-image-decomposition` on finite-type models. E01–E03, E07–E14, the
  equivariant items and characteristic-classes-of-torsors go to the proposed Part II on perfect
  schemes. So do E09 (Braden's hyperbolic localization for schemes) and HKW/091. That is the
  second restructuring entry and the second gap.
  - IC-stalk-parity is specific to Witt Grassmannians and moves to GeometricSatakeAndFusion.
  - Zhu's A.3.1 misprint (IC_X|_U = Q_ℓ[2 dim X](dim X)) is source issue E13, already known as
    PAPER-ZHU-17/E25.
- **RT-AREA-etale/17 (L3 → EDC.6).** EDC.6's nodes request AdicCoefficientsAndComparisons L2, L3,
  L4 and L6 and cite ClassicalAdicEtaleCohomology H5 nodes. This induces the edges L3 → EDC.6,
  L4 → EDC.6 and H5 → EDC.6 (fourth restructuring entry).
- **RT-AREA-geomlanglands/18.** The third restructuring entry handles it:
  - it drops the contentless EDC.4 → GS1 edge;
  - it names the EDC.5 nodes that GS0/GS1 import;
  - it names the EDC.5/EDC.7 nodes for GlobalShtukas GS.1's request, which that packet
    addressed to EDC.4, and proposes the edge EDC.7 → GS.1.
- **Added sources.** Each is now a node:
  - Yu belongs to part EDC.0's pairings and is already handled there.
  - Yun–Zhang II: `EDC.5/perverse-sheaves` and `EDC.5/small-map-intersection-complex` cover the
    small-map half, which the extraction's review flagged as unplanned. The pure decomposition is
    `EDC.7/proper-direct-image-decomposition`.
  - Caraiani–Scholze 164: `EDC.5/generic-degree-concentration`.
  - Liu et al. G52: `EDC.4/pullback-injective-blowup-bundle`.
  - Hansen–Kaletha–Weinstein 090: `EDC.8/local-terms-finite-order`.
  - Deligne Weil II 4.1.6: `EDC.4/weak-lefschetz-integral`.
  - Mirković–Vilonen's Lemma 4.3: `EDC.5/semismall-pushforward-perverse`.
- **Consumers' requests addressed.**
  - DWP.7 and DWP.9 (weak Lefschetz and its Gysin form, ℚ_ℓ).
  - LPV.0: blow-up along a codimension-2 axis and complete intersections. The identification
    of the blow-up with the incidence variety stays with LPV.3, because LPV.3 depends on EDC.4.
  - LPV.7: affine vanishing with the support bound (`EDC.4/affine-vanishing-hypercohomology`),
    and early perversity.
  - WC.0: complete intersections; Betti independence is in EDC.6.
  - WC.0 and WC.6: determinants and reciprocal polynomials.
  - GS0, GS3, GlobalShtukas, R34.4 and ES7.

## Requests made

- SchemeAndStackFoundations:SF.2 (integration owner of CohomologicalPointCounting), six requests:
  - Artin's affine vanishing (SGA 4 XIV 3.1–3.2);
  - proper base change for Rf_* and Rf_!, also requested by part EDC.0;
  - the ℓ-adic formalism (EllAdicRealization);
  - smooth/proper base change in families, with generic base change and spreading out;
  - ComplexComparison: Artin's comparison and the Kummer/exponential compatibility;
  - topological invariance and finiteness.
- SchemeAndStackFoundations:SF.0, three requests:
  - blow-ups along smooth centres;
  - X_s affine for ℒ ample on proper X (Stacks 0EKE), with the Veronese embedding;
  - the parameter scheme of smooth complete intersections.
- AdicCoefficientsAndComparisons L2, L3, L4 and L6: ECD 27.1–27.7.
- Cited by node, with no request: part EDC.0 nodes, DeligneWeightsAndPurity DWP.8/DWP.9 nodes
  (accepted packet DWP.7), ClassicalAdicEtaleCohomology H5 nodes, and EnhancedDerivedSheaves E4
  nodes.

## Gaps recorded

1. Stacks (RT-AREA-etale/3).
2. Perfect schemes, equivariant coefficients and hyperbolic localization (RT-AREA-etale/16).
3. Relative perverse t-structures and ULA, which GlobalShtukas requested from EDC.4. They are not
   in these stages' text: GS1 and VS1 own them on the diamond side, and the scheme version over a
   curve has no owner.
4. Nearby cycles over general bases and the compactification-boundary machinery, which
   GlobalShtukas requested from EDC.5 and EDC.6. LPV owns nearby cycles over a trait; the
   general-base version has no owner.
5. The Euler characteristic χ = deg c_m(T_X) for smooth complete intersections. The explicit
   hypersurface formula b_m^0 needs it.

## Source issues

- E11: BBD 2.2.12 (ii)* prints both inequalities reversed. This was checked on the page image
  against 2.2.2(ii) and (4.0.1)–(4.0.2).
- E12: BBD 4.3.1 (ii) prints ℚ_ℓ for ℚ̄_ℓ.
- E13: Zhu A.3.1 shift, known as PAPER-ZHU-17/E25.

## Sources

Read for this job and recorded with URL and SHA-256 (accessed 2026-10-06):

- BBD, Astérisque 100 (Numdam scan; printed page = PDF page − 1). Its excerpts were checked
  against page images, because the OCR text layer is noisy.
- Deligne, Weil I and Weil II (Numdam).
- Milne, LEC v2.21.
- SGA 4 XIV and XVI (retyped).
- Stacks, Morphisms (0EKE).
- Varshavsky, LV (arXiv v2) and *Local terms* (arXiv v3).
- Hansen–Kaletha–Weinstein (arXiv v4).
- Lu–Zheng (arXiv v4).
- Caraiani–Scholze (arXiv v1).
- Mirković–Vilonen (arXiv v5).
- de Cataldo–Migliorini (arXiv v2).
- Yun–Zhang II (published version).
- Liu–Tian–Xiao–Zhang–Zhu (arXiv v3).
- Zhu (arXiv v3).
- Bhatt–Scholze (arXiv v2).
- Scholze, ECD (2026 manuscript).

Excerpts from the arXiv, Stacks, SGA 4 and Milne texts are exact substrings of their extracted
text, up to whitespace. Excerpts from the Numdam scans of Weil I and Weil II match the OCR with a
fuzzy ratio of at least 0.8. BBD excerpts were transcribed from the page images, because the OCR
is noisy around formulas.

Missing:

- SGA 7 II XVIII (Katz) has no public copy. The blow-up and projective-bundle statements are
  planned from Weil I §7, Milne §§23 and 33, and proper base change.
- SGA 5 III (Illusie) has no public copy. The trace formalism follows Varshavsky and Lu–Zheng.

Varshavsky's LV paper does not define composition of correspondences; Lu–Zheng's Construction
2.6 does, and is the source for `EDC.8/correspondence-composition`.

## What a reviewer should look at first

- `EDC.5/t-structure-heart-abelian` and the abstract EDC.5 nodes. Check that planning BBD
  chapter 1 here is right: Mathlib has the criterion but not the theorem, and no other layer owns
  it. The fifth restructuring entry proposes these nodes as a sub-layer.
- `EDC.5/perverse-t-structure`: the coefficient range (finite fields, O/π^m, E), and the costalk
  condition for torsion rings, where there is no duality characterisation.
- `EDC.8/correspondence-restriction`: invariance as in Varshavsky 1.5.1, c₁(c₂⁻¹(Z)) ⊂ Z. In the
  atlas convention this reads →c⁻¹(Z) ⊆ ←c⁻¹(Z).
- `EDC.8/middle-degree-determinant`: the sign (−1)^{m_−} versus Weil I's multiplicity N of
  +q^{n/2}.
- The simplified Lean forms listed in the file header.
