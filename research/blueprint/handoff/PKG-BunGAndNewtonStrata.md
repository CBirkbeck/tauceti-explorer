# PKG-BunGAndNewtonStrata — roadmap package

Issue #10759. Agent: Claude (Opus), session `claude-9nCqNi`, 19 October 2026. Branch `claude-9nCqNi-pkg-bung`. One job claimed; no second job.

## Deliverables

- `research/blueprint/packages/BunGAndNewtonStrata/README.md` (about 232 KB): the roadmap in TauCetiRoadmap form, built from the accepted plan (`packets/BunGAndNewtonStrata.json`, revision 3, accepted by REV-BunGAndNewtonStrata~3).
- `research/blueprint/packages/BunGAndNewtonStrata/Suggested.lean` (369 lines): the accepted plan's compact file, re-headed and re-sectioned to the README's layers.
- `research/blueprint/packages/BunGAndNewtonStrata/metadata.toml`: `topic = "math.NT"`.

## Coverage

All 98 plan nodes are targets of the README, each under an anchor equal to its node slug (so the stage-id citations in HeckeStacksAndLocalShtukas, VStackSheavesAndLisseCategories and RelativeFarguesFontaine resolve as `#<slug>`). All 191 API items appear by name (prefix `TauCeti.BunG.` dropped) and all 119 tests appear as **Checks** bullets (test names dropped). Every definition keeps at least three Checks. Five targets were added (below), each with three Checks. Internal links were checked: no broken anchors.

## Structural decisions

- **Layers.** The plan's stages became Layers 0–4. Ten BG0 nodes depend on the BG1 Newton invariants (J_b, decency, defect, Morita, basic inner forms, finite norm centralizer, central Newton on J_b), so a max-layer fixpoint over prerequisites moved them into Layer 1; `BG1/family-kottwitz-local-constancy` and `BG0/isocrystal-family-v-descent` moved into Layer 2 (they use the bundle κ-constancy). The three `BG2:smooth-Artin` nodes are placed at the end of Layer 3, after the stratum results their proofs use. Within each layer targets are in topological order; there are no forward references.
- **Gaps turned into targets.** No gap or request remains as such. G01, G02 and G03 became standalone targets: §1.2 *Torus resolutions, invariant lattices and choice of maximal torus* (G01), §0.2 *Relative tensor torsors and filtered automorphism groups* and §1.7 *Rational Levi descent, elliptic tori and transfer of maximal tori* (G02), §1.3 *Weil cohomology of crossed modules with L^sep coefficients* (G03). G02's highest-weight detection is part of *Representations detect Newton dominance*. G04, G05, G06, G07, G09, G10 and G12 are stated as parts of their consuming targets (sentences "… is part of this target"). G08 (Lean boundary) and G11 (edition collation) are process items: the README states the Lean scope in "How to read the build", and the References give the edition of each locator.
- **Source corrections.** E01–E10 are a numbered "Source corrections" section in own words, each linked to the target it affects.

## Supplier citations and boundaries (for the port)

- Suppliers are cited by package layer and section: VectorBundlesAndIsocrystals VB0–VB4 (by target title), RelativeFarguesFontaine Layer 1, §4.7, §§4.12–4.13, §§7.2/7.7; DiamondsAndVStacks §§0.25–0.26, 1.4, 1.9, Layers 2–4, §§3.10, 4.7, 5.12, 6.5; DiamondEtaleCohomology C1; VStackSheavesAndLisseCategories VS0, §VS1.3; GeometricSatakeAndFusion GS0; EndoscopicTransferAndUnitaryTraceComparison Layer 1 (§§1.1, 1.5, 1.11); IgusaVarietiesAndTorsionConcentration §§IG.0.3, IG.0.12; AlgebraicModuliForArithmeticGeometry §3.1; Tau Ceti ReductiveGroups Layers 1, 7; ReductiveGroupsPartII §§RG2.0.4, RG2.1.5, RG2.3, RG2.4 (incl. §RG2.4.2).
- **RelativeFarguesFontaine.** The VectorBundlesAndIsocrystals port (TauCetiRoadmap PR #1205) absorbed RF0–RF3 as its Layer VB−1, so at port time the RF Layer 1 and §4.x citations map to VB−1 (*Relative annuli*, *Marked untilt Cartier divisors and effective divisor moduli*, *Completed local period rings*). The Beauville–Laszlo gluing of G-bundles (RF §§7.2, 7.7) is not in that port; it needs either an RF port or a move into this roadmap's Layer 2.
- **Overlaps to settle at port.** IgusaVarietiesAndTorsionConcentration (PR #1090) states B(G), ν, κ, the order and B(G, μ) over ℚ_p in §§IG.0.1–IG.0.2, and its Layer IG.F (§§IG.F.6, IG.F.9, IG.F.11–IG.F.12a) restates G-bundles, Bun_G, the classification of points, Newton strata with J̃_b and the charts M_b. EndoscopicTransferAndUnitaryTraceComparison (PR #999) §§7.2–7.5 restates G-isocrystals, B(G), the invariants, decency and J_b over ℚ_p. These were moved down into those tier-14/19 roadmaps because this roadmap is outside the 94. The README states the general theory and records, in "Scope and ownership", that those statements are its E = ℚ_p cases. The maintainer should decide whether those roadmaps import from here once this one is upstream.
- No overlap with current TauCetiRoadmap main (checked at `34dcf0e2`: NewtonPolygons excludes isocrystal polygons; SchubertGeometry is the classical flag theory) or with the current Tau Ceti library at `a91d3aaf` (only the topological Fargues–Fontaine curve, already cited by VectorBundlesAndIsocrystals; the "twisted conjugation" hits are Clifford-group adjoints).

## Checks run

- `lean-check …/packages/BunGAndNewtonStrata/Suggested.lean`: exit 0, 51 `declaration uses sorry` warnings and no other warnings or errors (Mathlib `082e2d37e8`, Tau Ceti `f790474`, shared build). Free memory at compile time: 78 GB.
- `python3 scripts/check_sorry_data.py` on the Lean file: passes (no sorry'd data).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems; no local paths.
- Scripted checks: every node anchor and API name present, no broken internal links, no process words (packet, reader, request, gap ids, stage ids BG0–BG4, "native", "supplier" outside the section heading).

## Remaining

Nothing for this job. For the review: the five added targets (§§0.2, 1.2, 1.3, 1.7 and the in-target obligations) are restatements of the plan's gap records, with locators taken from the plan's consumers; the existence of elliptic maximal tori in §1.7 has no locator of its own in the plan.
