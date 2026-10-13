# PKG-HilbertModularVarietiesAndShimuraCurves~2

Agent: Claude (Opus 5.5), session `claude-bdj3Di`, 2026-10-13/14. Refs #9175. Revision round 2 of the package. This round addresses REV-PKG-HilbertModularVarietiesAndShimuraCurves and rewrites the package to the binding 2026-10-12 shape. `review.json` is left in place for the next reviewer.

## What the previous review raised, and how it is answered

The review returned the package for one reason: geometric definitions, APIs and tests sat in a Lean block comment rather than as elaborated declarations (154 of 206 API names had no Lean declaration). The 2026-10-12 shape (PACKAGE_REVIEW.md, binding since that date) reverses that requirement: a Suggested.lean states only real-bodied light definitions over carriers that exist at the pins, plus milestones and examples, and heavy definitions are README targets. So the answer is:
- **Suggested.lean.** Rewritten from scratch, 706 lines. It has no `sorry`-bodied data, no comment catalogue and no placeholder carriers. The old file had about 40 `def … := by sorry` data definitions; every definition kept now has a real body (lattice, trace forms, unit-square quotients, finite Γ₀ level, adjugate action, height lattice, chart predicate, residual Hecke ideal, weight modules, Taylor–Wiles diamond factor, liftable image, norm twist, component Hecke operators, degeneracy Gram operator). It also carries the layer milestones statable at the pins and discriminating examples.
- **README.** It carries every target with intended Lean names, API lists and Checks. Each target that has Lean declarations names them in an "In Suggested.lean:" line, and the Lean docstrings refer back. All 81 Lean declarations are named in the README.
- **Corrections kept.** The three Lean corrections of the old review are kept: prime/positive-level scope, unique existence in `ResidualHeckeIdeal.actingFactor`, and the zero law of `integralTraceFamily_parameter_add`. Its finite-PEL component-field clarification is kept and sharpened (see below).

## The plan used

The issue text names only the H0 and R18.2 packets. Three further packets of this roadmap were accepted on 2026-10-13, after the first package: R18.3 (12 nodes), R18.4 (27 nodes) and R18.5 (9 nodes). They are part of the plan and are included. Effective plan: 75 + 58 + 12 + 27 + 9 = 181 nodes, plus one target added here (below), so 182 README targets. No packet was edited.

Assembly edits applied while building the effective node set (all prescribed by the accepted parts):
- **R18.3.** All nine `dependencyReplacements` groups and all five `importRefinements` (corrections, API and test additions) are applied to the R18.2-owned R18.3 nodes. One replacement lists `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity` for removal from `R18.4/cohomological-eigenspaces`, but that prerequisite was never there; nothing to remove.
- **R18.4** (review handoff). `R18.4/cohomological-eigenspaces` is routed through ALS.5, AF.3, AF.4 and `R18.4/quaternionic-jacquet-langlands-bridge`. `R18.4/quaternion-purity` is routed through `R18.4/quaternionic-saito-projector` and `R18.4/quaternionic-coefficient-purity`, replacing its R34.5 back-edge. `R18.4/definite-indefinite-comparison` loses its three R17.3 prerequisites and gains `R18.3/quaternion-spectral-transfer` and the bridge; its proof route is rewritten accordingly.
- **R18.5** (handoff instructions). `R18.5/totally-real-uniformisation` gains `R18.5/quaternionic-pel-uniformisation-transfer` (division-prime route). `R18.5/tower-uniformisation` gains `R18.5/drinfeld-level-structure-comparison`. `R18.2/finite-pel-comparison` gets the split-place field reconciliation: level-zero neutral components and unions of level structures descend to F_v^nr, while a selected level-n component lives over F_v^n (Carayol Prop. 4.4.3, §§4.5.1–4.5.5).
- **Old package.** Its upward-tier moves are preserved: the H5 cusp, Hodge-splitting and weight targets, the R18.2 Hodge-line metric and the H6 ordinary Honda–Tate construction no longer cite ShimuraCompactifications, AutomorphicBundles, ArakelovGeometryAndAbelianHeights or AbelianSchemesAndArithmeticModuliPartII. Proof routes that still named those roadmaps (H5.2, H5.3, H5.4, R18.3.15, R18.3.22, R18.4.25, R18.4.26, R18.3.31) were rewritten.

The node-level graph after these edits is acyclic (checked by script).

**Tier check.** HilbertModularVarietiesAndShimuraCurves is tier 14. After the edits every cross-roadmap prerequisite is Mathlib, Tau Ceti, a Tau Ceti roadmap, or an atlas roadmap of tier ≤ 13: ShimuraData, ShimuraVarieties, PELModuli, AutomorphicSpectralTheory and PadicHodgeTheory at tiers 12–13, and everything else lower. No upward citation remains in prerequisites or prose. Higher roadmaps appear only under "Downstream consumers".

## Target added here (a request to this roadmap's own layer)

R18.4's packet requests from `HilbertModularVarietiesAndShimuraCurves:R18.3` the definite Ihara lemma over an arbitrary totally real field (Manning–Shotton Theorem 6.8). Four R18.4 nodes cite the bare stage id for it: central-character-exactness, supersingular-cohomology-filtration, patched-degeneracy-surjectivity and quaternionic-jacquet-langlands-bridge. This is this roadmap's own layer, so the package states it as target **§R18.3.8** (`definiteIhara_injective`), read from arXiv:1907.06043v2 §6.2, Theorem 6.8 and its proof, pp.34–35. The four consumers cite it. When the plan is next revised, add this node to the R18.3 packet; its id here is `R18.3/general-field-definite-ihara`.

## Layer map for consumers

README layers carry the stage ids. Three stages are split:
- R18.5 part 1 = §§R18.5.1–14; R18.5 part 2 = §§R18.5.15–21;
- R18.2 part 1 = §§R18.2.1–7; R18.2 part 2 = §§R18.2.8–18;
- R18.3 part 1 = §§R18.3.1–28; R18.3 part 2 = §§R18.3.29–32.

The build order is H0–H6, R18.1, R18.5(1), R18.2(1), R18.5(2), R18.2(2), R18.3(1), R18.4, R18.3(2). R18.6 is prose only.

## Checks run

- `lean-check research/blueprint/packages/HilbertModularVarietiesAndShimuraCurves/Suggested.lean`: elaborates at Mathlib 082e2d3 / Tau Ceti f790474 with no errors; the only warnings are 40 `declaration uses 'sorry'`. Imports: `Mathlib` plus three Tau Ceti modules (TotallyPositive, Quaternion.NormForm, LocalCoefficient). Free memory checked (>100 GB available).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: passes.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note: 0 problems.
- README: 3,652 lines (about 434 KB), generated from the effective node set by a scratch script. Old-package text was used for the 133 reviewed targets and packet text for the 48 new ones, with hand-written scope, conventions, supplier contracts, layer introductions, worked examples, open points and downstream sections. A Sonnet proofreading pass flagged residual process wording, missing spaces inherited from the old text, ASCII math and duplicated construction paragraphs; all flagged items were corrected.
- Script checks on the README:
  - all 182 targets present;
  - every API and test name of the five packets present (0 missing);
  - every definition and construction has an API list and at least three Checks;
  - every internal anchor resolves;
  - every Lean declaration is named;
  - no `sorry`, local paths, packet or job ids.
- A Sonnet sweep of current TauCetiRoadmap main and Tau Ceti a91d3aaf found no planned target already present. Totally positive units, the narrow class group, trace duals, Hecke cosets, local coefficient systems, SU(2) symmetric powers and the AdelicAlgebraicGroups definite example are imported, not replanned.

## Plan mistakes noticed (packets not edited)

- R18.3/R18.4 record the Badulescu–Renard paper as appearing in Duke 154 (2010). The paper is Compositio Mathematica 146 (2010), 1115–1164 (the earlier package had this right). The README uses Compositio.
- The four R18.4 nodes above cite a bare stage id (`…:R18.3`) instead of a node; see the added target.
- The R18.2 packet still carries the superseded upward prerequisites (R17.3, R19.2, R16.2, B2, B4, C5, C6, R35.2, F3) on the nodes the old package moved down. The package does not use them; a future plan revision should drop them so that promotion does not draw upward stage edges.

## What remains

Nothing in this job. The open mathematical obligations are listed in the README section "Points the sources leave open":
- Khare's Duke Lemma 2.2;
- the even-degree congruence argument and the weight-two semistable comparison above p;
- Kisin's potentially semistable deformation ring;
- the KW Lemma 7.2(i) sign case q_v≡−1;
- the algebraic-space status of the global DP model;
- the saturated relative determinant comparison at ramified places (§§R18.2.17–R18.2.18);
- the AdicSpacesPartII and PELModuli extensions.

The lower-tier extensions stated in "Exact supplier contracts" are open requests to those roadmaps:
- SR.3: character distributions; the GL₂(k_q) principal-series model;
- AS.6: quaternion inner-form trace matching;
- R03.3 and R03.5: MS Lemma 5.1–5.3 flatness; weak patching without a domain hypothesis;
- SelmerIwasawaCohomology L2: Taylor–Wiles selection over F;
- PELModuli: basic uniformisation (Boutot–Zink Proposition 6.2) and the open-and-closed embedding;
- AdicSpacesPartII: formal Drinfeld quotients;
- NeronModels R11.4: thickness resolution.
