# Review: RT-RS-30 (red team of RS-30, rank-zero and rank-one Birch–Swinnerton-Dyer theory)

Job `REV-RT-RS-30` (issue #1628), by Claude Code, session `cc-72825f`, 24 September 2026. The red team RT-RS-30 (issue #1629) was done by Codex, session `codex-c83e7a`. RS-30 was written by session `gpt-20260921-c74f2a` and reviewed by `codex-a71f92`. This session did none of RS-30, REV-RS-30 or RT-RS-30.

**Verdicts.** The red team recorded no findings, so `research/blueprint/redteam/RT-RS-30.review.json` has an empty findings list and no fix job follows from it. Its clean result is **not complete**, however. Checking what it says it checked, and attacking RS-30 again independently, found six problems that it missed, each confirmed by a second, independent check: two of medium and four of low severity. They are listed below for the maintainer, who may queue them as a fix to RS-30 or as a new red team.

## What was read

- The red team's result (`research/blueprint/redteam/RT-RS-30.result.json`, with its `checked` list) and report (`RT-RS-30.md`).
- The restructuring: `research/blueprint/restructure/RS-30.json`, the accepted decision `RS-30.result.json` (twelve layers, eleven owner rows, 86 links), its report `RS-30.md` and the review `research/blueprint/reviews/REV-RS-30.md`.
- `content/campaign/RankZeroOneBSD/README.md`, the Tau Ceti anchor `content/tau-ceti/EllipticCurves/README.md`, the ModularForms, GrossZagierAndArithmeticHeights, ComputationalNumberTheory, EffectiveDiophantineMethods, NeronModelsAndSemistableAbelianVarieties and ArakelovGeometryAndAbelianHeights documents, and `data/atlas.json` with its stage `requires`, the accepted link packets and the other accepted restructurings.
- The Tau Ceti declarations the red team cites, at the pinned commit f790474: `FinitelyGenerated.lean`, `Regulator.lean`, `CanonicalHeight.lean` and `QuadraticTwist.lean`.

## Checking the red team's claims

Nineteen of the twenty concrete claims in the red team's `checked` list and report hold:
- all twelve RankZeroOneBSD stages are kept (narrowed for BSD.0, BSD.1, BSD.5 and BSD.9), none moved or dropped;
- the eleven owner rows name live stages, and every (owner, former stage) pair is linked;
- the 86 links have distinct live endpoints, and no RS-30 edge closes a cycle, either in the union of the atlas, the draft roadmaps and the accepted link packets (4,501 pairs) or after adding every other accepted restructuring (7,053 pairs; its two cycles avoid RankZeroOneBSD);
- the graph counts, the consumer handoffs, the four external exports (to HE.8b, MIMC:L6 and PS.6), the Part II title and the unchanged anchor blob are as stated;
- the supplier contracts of R29.3, R29.6 and GZ.0 say what RS-30 attributes to them;
- the cited declarations exist and say what the red team says: `finite_torsion`, `fg_point`, `fg_point_of_variableChange` and `fg_point_of_numberField`; the Gram-matrix basis change and `regulator` (no sublattice-index result); `Point.canonicalHeight` as lim h(2^nP)/(2·4^n) with `neronTatePairing` its halved polar form.

The twentieth does not hold: the red team says every link citing "the README's … prerequisite" has a basis in the README, but link 28 does not (problem 1 below).

## Problems the red team missed

Each was found by an independent re-attack and confirmed by a separate check that tried to show it wrong. Severities are the confirming check's.

1. **Link 28 misstates its source (low).** The link BSD.1 → BSD.6a gives as its reason "Make the README's BSD.1 prerequisite explicit for BSD.6a", and REV-RS-30 repeats that the README requires BSD.1 in BSD.6a. The README's BSD.6/BSD.6a text (lines 78–102) names only BSD.5, BSD.2 and "BSD.2–BSD.5". The edge is harmless, since BSD.1 → BSD.3/BSD.4 → BSD.5 → BSD.6a already exists through README-backed links, but the recorded justification is wrong, and the handoff links 60–64 into BSD.6a cite it. *Fix:* remove link 28 as transitively redundant, or state that it is implied by BSD.5; re-base links 62–64 on the narrowing of BSD.5, and drop or re-justify links 60–61 (Layer 5 → BSD.6a is already in the accepted EllipticCurves link packet; Layer 4 reaches BSD.6a through HE.8).
2. **BSD.0 keeps the analytic rank that ModularForms Layer 7 owns (medium).** BSD.0 still keeps the definition of analytic rank as the finite order of vanishing of L(E, s) at s = 1. Tau Ceti's ModularForms Layer 7 already plans the analytic rank of a newform as the order of vanishing of its entire continuation at s = k/2, with independence of the continuation and nonvanishing as stated lemmas, and Layers 6–7 own the signed functional equation. RS-30 has no owner row for this. (The later accepted RS-06 already added the links ModularForms Layer 7 → BSD.0 and Mathlib's `WeierstrassCurve.LFunction` → BSD.0, so only the ownership record and BSD.0's wording are missing.) *Fix:* add an owner row giving the analytic rank, its finiteness and the signed functional equation to ModularForms Layer 7 (with Layer 6 for the sign ε_N), formerly BSD.0; reword BSD.0 so that it transports the newform's analytic rank to E through R29.6, checks compatibility with the EllipticCurves Layer 7 statement of BSD, and keeps only the zero/derivative criteria, the parity corollary and the quadratic-twist and base-change comparisons.
3. **BSD.9 has no supplier for certified L-value enclosures (medium).** BSD.9 keeps "rigorous enclosures for actual L-values/derivatives", but no link or path runs from ComputationalNumberTheory CN.4, which plans "interval/ball arithmetic, precision propagation, certified roots, L-value approximations and analytic continuation". A BSD.9 worker would rebuild them; the sibling stage PeriodsAndSpecialValues PS.7 already takes CN.4 as an input. *Fix:* add the link CN.4 → BSD.9 (no cycle, since BSD.9 has no consumers) and an owner row for the generic validated numerics, formerly BSD.9; BSD.9 keeps only the series and tail bounds for its test curves and the certified enclosures computed with CN.4.
4. **BSD.8 has no supplier for certified descent and saturation (low).** BSD.8's exceptional-prime certificates must prove "finiteness and index claims", and the acceptance test needs a rank-one index-square calculation. The accepted RS-03 makes EffectiveDiophantineMethods ED.3 the only owner of certified local-image, saturation and descent procedures, but no path runs from ED.3 to BSD.8 or BSD.9. *Fix:* add the link ED.3 → BSD.8 (no cycle), optionally ED.3 → BSD.9, and say in BSD.8 that it assembles BSD-specific prime-part certificates from ED.3's outputs and the anchor's 2-descent.
5. **The height-pairing comparison has two owners (low).** The owner row gives the comparison of the pinned Néron–Tate pairing with each source's pairing to GrossZagierAndArithmeticHeights GZ.0, but BSD.5's keeps also say "Compare the pinned halved-polar pairing with the source pairing". Separately, GZ.0's sentence that the existing height is "twice one common convention" is wrong about the pinned height, which is lim h(2^nP)/(2·4^n), the common convention itself. *Fix:* keep GZ.0 as sole owner; reword BSD.5 to apply GZ.0's comparison; record in the GZ.0 → BSD.1, BSD.5 and BSD.9 link reasons the pinned normalisation and the resulting 2^r factor in a rank-r Gram determinant; flag GZ.0's sentence for correction.
6. **An owner row credits EllipticCurves Layer 4 with minimal differentials (low).** The row "Local elliptic reduction, minimal-differential and Tamagawa-factor package", the Layer 4 → BSD.1 link reason and seven handoff reasons attribute differentials to Layer 4, which plans local minimal equations, the local minimal discriminant and c_p but no differential; the anchor puts the invariant differential in Layer 1 and the global minimal-discriminant and defect ideals in Layer 4.5a. BSD.1's ramified-place comparisons still have a supplier through NeronModels R11.1 via the retained R11.4 → BSD.1 edge. *Fix:* rename the row to local reduction, local minimal equations and discriminants and c_p; correct the eight reasons; add links from EllipticCurves Layer 1 and Layer 4.5a to BSD.1.

One further suggestion was **rejected** on checking. It was that BSD.1's complex-place period comparisons had no owner for complex uniformisation. They do: BSD.1 depends on GZ.0, which depends on ArakelovGeometryAndAbelianHeights R35.2 (the metric at complex places), which ModularCurvesPartII R12.1 supplies with E(C) ≅ C/Λ, as the accepted RS-06 records. Only the wording of RS-30.md line 82 could be clearer.

## For the maintainer

No fix job is generated from an empty findings list. The six problems above are confirmed and stated so that a worker can apply them; problems 2 and 3 change what gets built. They can be queued as a fix to RS-30, or the red team can be reopened.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-30.review.json` reports no errors.
- The graph claims were recomputed from `data/atlas.json`, the draft roadmaps, the accepted link packets and the accepted restructurings; the declarations were read at Tau Ceti f790474.
