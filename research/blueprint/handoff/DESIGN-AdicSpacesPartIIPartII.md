# Handoff: DESIGN-AdicSpacesPartIIPartII (issue #3421)

Worker: Claude (session claude-3eNeGN), 2026-10-19.

## What was done

Designed the new roadmap **Adic Spaces PartII, Part II: rigid-analytic Zariski geometry, classical points and resolution** (`AdicSpacesPartIIPartII`, area `padic`, parent `AdicSpacesPartII`). It follows the brief of PAPER-HOWE-KLEVDAL-26, route to AdicSpacesPartIIRigidZariskiGeometry (7 items). It is the paper's only route in this direction, so there was nothing to merge or split.

Deliverables:
- `research/blueprint/roadmaps/AdicSpacesPartIIPartII.json`: seven layers RZ.0–RZ.6 with their targets.
- `research/blueprint/packets/AdicSpacesPartIIPartII.json`: target-level plan, status `complete`.
  - 42 nodes: 8 definitions, 7 constructions, 26 theorems, 1 lemma.
  - 111 API items, 69 unit tests, 18 planets, 46 baseline declarations.
  - 4 source issues, 3 gaps, 1 request, 2 restructure proposals, 2 upstream notes.
- `research/blueprint/readmes/AdicSpacesPartIIPartII.md`: the reader document, about 27,000 words. The introduction, scope, conventions and layer introductions are hand-written; the per-target sections are generated from the packet, so the two agree.
- `research/blueprint/suggested/AdicSpacesPartIIPartII.lean`: 208 lines, with only statements whose carriers exist at the pins:
  - the ring-theoretic nowhere-density predicate `Ideal.IsNowhereDense` (real body) and two criteria;
  - the minor criterion for matrix rank;
  - the residue-field fact behind the Gauss point theorem, with a ℤ_p negative control;
  - the analytic inverse function theorem, the constant rank theorem in characteristic 0 (with a Frobenius negative control) and the identity theorem across a closed subfield, on Mathlib model spaces.

  The rigid-space notions are README targets, listed in the file's closing comment.

Layers:
- RZ.0: Zariski closed subsets, local dimension, Conrad's nowhere-density criteria, Zariski-closed images of proper morphisms.
- RZ.1: normalization of rigid spaces (Conrad §1.2, §2.1), its characterization (Theorem 2.1.2), connected and irreducible components (Definition 2.2.2, Theorem 2.2.4, Corollaries 2.2.6–2.2.9), the irreducibility criterion (Lemma 2.2.3), full-dimensional closed subsets (Corollary 2.2.7), and connectedness of dense Zariski opens of irreducible spaces.
- RZ.2: singular locus, smooth = regular in characteristic 0, Zariski tangent spaces, the stratification by smooth strata (HK II p. 57), Zariski-open maximal-rank loci.
- RZ.3: classical points and their density, rigid analytic points of diamonds (HK II Definition 2.2.1(1)), their bijection with classical points (Remark 2.2.2), L-points of polydiscs as O_L^n (a Baire space), and the Gauss point in the closure of rational points when the residue field is infinite.
- RZ.4: Bhatt–Hansen §2.1, covering the specialisation map, Shilov points (Proposition 2.2), weakly Shilov points (Definition 2.5, Lemma 2.8), Abhyankar's bound, the transcendence criterion (Proposition 2.9) and Corollary 2.10.
- RZ.5: Temkin.
  - Blow-up sequences and rigid blow-ups.
  - Functorial desingularization of varieties (Theorem 2.3.5) and of quasi-excellent schemes (Theorem 1.2.1).
  - Regularity of affinoid localizations.
  - Rigid resolution (Theorems 5.2.2, 5.3.2) and the consequences HK II uses: surjectivity, v-cover, passage to the reduction, connectedness over an irreducible base.
- RZ.6: analytic inverse function theorem, polydisc neighbourhoods of rational points, analytic manifold of rational points (Mathlib `IsManifold` with smoothness ω), constant rank theorem, submersions from smooth morphisms and orbit maps, identity theorem across a closed subfield.

## Accounting of the route's items

| Item | Where |
| --- | --- |
| 028 (Remark 2.2.2) | RZ.3/classical-point, RZ.3/classical-points-dense, RZ.3/rigid-analytic-point, RZ.3/classical-points-rigid-analytic-points |
| 174 (Temkin resolution) | RZ.5, all seven nodes; consequences in RZ.5/resolution-consequences |
| 175 (Conrad 2.1.4 / 2.2.3) | connected normal case imported (AdicSpacesPartII:R1/rigid-identity-principle); irreducible case RZ.1/irreducibility-criterion; dimension form RZ.0/nowhere-dense-criteria and RZ.1/full-dimensional-closed-subset |
| 176 (weakly Shilov) | RZ.4, all seven nodes |
| 177 (stratification, max-rank locus) | RZ.2/singular-stratification, RZ.2/rank-loci (finite dimension, not quasi-compactness, as the extraction review corrected) |
| 178 (manifolds, constant rank, orbit maps, identity theorem) | RZ.6, all six nodes |
| 179 (Gauss point) | RZ.3/gauss-point-in-closure and RZ.3/polydisc-points-topology (infinite residue field, as corrected) |

## Checks

- `TAUCETI_BASELINE=<pinned index> python3 scripts/check_blueprint.py research/blueprint/packets/AdicSpacesPartIIPartII.json`: 0 errors, 0 warnings. All 46 baseline declarations were found in the pinned index; their modules come from it.
- `python3 scripts/check_sorry_data.py` on the suggested file: passes.
- **The suggested Lean file compiled.** `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 elaborated it with exit 0 and no errors. The only warnings are 14 `sorry` warnings; there is one `#check` info message pinning `TauCeti.ValuationSpectrum.closedPolydisc`.
- A dry atlas assembly (`build.assemble`, nothing written) was run with this packet, document and roadmap definition loaded as if promoted. It adds 25 stage entries (5,703 → 5,728) and 54 stage edges (15,110 → 15,164). There are no skipped (cyclic) links.
- `python3 research/blueprint/intake.py check-files` on the five changed paths: see the pull request.

## Stage coverage

All seven stages are `planned`. RZ.1, RZ.4 and RZ.5 have `remaining` entries that point to the gaps.

## Gaps

- **G1.** Lütkebohmert's Riemann extension theorem (Math. Z. 139, 1974, Theorem 1.6) was not read. RZ.1/dense-open-connected rests on Conrad's quotation of it (p. 17). If no roadmap plans the theorem, it belongs to AdicSpacesPartII's direction.
- **G2.** Poineau 2013 (Lemme 4.4, Corollaire 4.15) was not read. Bhatt–Hansen cite it for Proposition 2.9 (1) ⇔ (2); the node sketches both directions.
- **G3.** The scheme-level desingularization theorems (Bierstone–Milman 2008, Bierstone–Milman–Temkin 2011, Temkin §§3–4) are planned at target level only.

## Ownership decisions and moves (for the maintainer and later jobs)

- **Moved down from AdmissiblePairsAndPadicHodgeStructures** (design job #3419, not yet done):
  - Rigid analytic points of a diamond (HK II Definition 2.2.1(1), extraction item 027 part 1), now `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`, because item 028 here needs it.
  - The Zariski-closedness of images of proper morphisms (the input of HK II Lemma 2.2.3, item 029), now `RZ.0/proper-image-zariski-closed`.

  AdmissiblePairs keeps rigid analytic diamonds and subdiamonds (Definition 2.2.1(2)–(3)) and Lemma 2.2.3, and should import these two nodes. The move is recorded in the packet's `restructure`.
- **Scheme-level resolution.** AlgebraicModuliForArithmeticGeometry R09.7 states its scope as varieties, compatible with local isomorphisms only. No roadmap plans functorial desingularization for regular morphisms or for quasi-excellent schemes. This plan states both as nodes (`RZ.5/functorial-desingularization-varieties`, `RZ.5/functorial-desingularization-qe`) and proposes, in `restructure`, a Part II of AlgebraicModuliForArithmeticGeometry to own them.
- **Normalization and irreducible components of rigid spaces.** These are owned here (RZ.1). The Tau Ceti roadmap RigidAnalyticGeometry §8.1 asks for irreducible-component comparisons under analytification without defining components of a general rigid space; this is noted in `upstreamNotes`.
- **RigidAnalyticGeometry.** The Tau Ceti roadmap is merged on TauCetiRoadmap main but absent from the atlas snapshot. It owns the classical affinoid theory, excellence of affinoid algebras, the constructible density of classical points (§8.2) and the identity principle (§7.3). These are cited through the AdicSpacesPartII nodes that record them and are not restated.
- **Gauss point.** `TauCeti.ValuationSpectrum.gaussPoint` is in the current Tau Ceti library but not at the pinned commit. The Gauss point is therefore described in RZ.3's statements, not planned as a node.
- **Request.** To the Tau Ceti roadmap ReductiveGroups, Layer 3: smoothness of the quotient morphism G → G/H (for orbit maps as submersions). It is also an upstream note, since that layer states G/H only as an fppf quotient.

## Source issues

- E1 and E2 restate PAPER-HOWE-KLEVDAL-26/E44 (only an infinite residue field is needed for the Gauss point step) and E45 (Bhatt–Hansen Definition 2.5, not 2.4).
- E3 is new: HK II asserts without argument that the desingularization of an irreducible Z is connected. The repair is in RZ.1/dense-open-connected and RZ.5/resolution-consequences.
- E4: HK II resolves S̃ ×_S S̃, which may be generically non-reduced. Resolve its reduction instead, which has the same diamond (this was already noted in the extraction's item 174).

## Sources

Read, with SHA-256 recorded in the packet:
- Howe–Klevdal II, arXiv:2308.11064v2: §§1.1, 2.2, 5.3, 9.2–9.3.
- Conrad, *Irreducible components of rigid spaces*, author's copy: §§1.2, 2.1–2.3, 3.3 (Lemma 3.3.1).
- Bhatt–Hansen, arXiv:2101.09759v2: §2.1, and Lemma 2.16 of §2.2.
- Temkin, arXiv:0904.1592v2: §§1.2, 2.2–2.3, 5; §§3–4 skimmed only.
- Schneider, *p-Adic Lie Groups* (cleared library copy): §§5, 6, 9.

Not read:
- Serre, *Lie Algebras and Lie Groups* (the constant rank theorem; not freely available).
- Lütkebohmert 1974 and Poineau 2013 (see G1, G2).
- Bierstone–Milman 2008 and Bierstone–Milman–Temkin 2011 (see G3).

## Where to resume

The review job (REV-DESIGN-AdicSpacesPartIIPartII) checks the plan. The follow-ups are G1–G3, and the restructure proposal for an AlgebraicModuliForArithmeticGeometry Part II on functorial desingularization. When the design of AdmissiblePairsAndPadicHodgeStructures (#3419) runs, it should import RZ.0/proper-image-zariski-closed, RZ.1/irreducibility-criterion, RZ.1/full-dimensional-closed-subset, RZ.2/singular-stratification, RZ.2/rank-loci, RZ.3/rigid-analytic-point, RZ.3/classical-points-rigid-analytic-points, RZ.3/gauss-point-in-closure, RZ.4/weakly-shilov-avoid-nowhere-dense, RZ.5/resolution-consequences, RZ.6/constant-rank-theorem, RZ.6/smooth-morphism-submersion and RZ.6/subfield-identity-theorem.
