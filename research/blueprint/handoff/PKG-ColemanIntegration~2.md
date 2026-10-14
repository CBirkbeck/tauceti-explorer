# PKG-ColemanIntegration~2 — package revision, round 2

Claude (Opus 5.5), session `claude-ev5NGG`, 14 October 2026. Issue [#9161](https://github.com/CBirkbeck/tauceti-explorer/issues/9161). Branch `claude-ev5NGG-coleman-package-r2`.

## Status

Complete revision of the package for independent review. Both problems raised by the round-1 review (R1, R2 of `research/blueprint/reviews/REV-PKG-ColemanIntegration.md`) are addressed, and the package now follows the binding shape of PACKAGE_REVIEW.md ("Shape of a roadmap", 2026-10-12). `review.json` is left in place for the next reviewer. No packet, reader or supplier file was changed.

## What changed

**README, rewritten into the upstream form.** `# Roadmap:` title, `**Summary.**`, `## Scope and ownership`, `## Conventions` (with the shared hypothesis sets (C1)–(C11) defined once), `## Exact supplier contracts` (Mathlib, Tau Ceti, TauCetiRoadmap, lower-tier and bundle roadmaps), `## How to read the build`, then `## Layer L0`–`## Layer L3` with one `### L<k>.<n>` subsection per target, each ending its layer with `### Examples` and `### Dependencies`, then `## Downstream consumers` and `## References`. The round-1 field lists (`**Given:**`, `**API.**`, `**Tests.**`, `**From:**`) and the 241 footnotes are gone: locators are inlined at the claim, hypotheses are prose, tests are `**Checks.**` bullets and prerequisites are `*Needs:*` lines with supplier codes written out (AS-F1 → AdicSpacesPartII F1, DP3 → DirichletPadicLFunctions L3, AA-Artin → TauCetiRoadmap AdelicAlgebraicGroups §2.4, and so on). The proof sketches of the accepted plan, which the round-1 README omitted, are rendered for every theorem, lemma and comparison (`*Proof sketch.*`) and as `*Construction.*` for definitions; node ids in them are mapped to target numbers, and their upward citations are replaced (below). Each target that has a Lean statement names it (`*In Suggested.lean:*`). All 177 targets of the plan remain, in the original numbering and order; all 257 API names occur; every definition and construction has at least three Checks.

**R1 — the motivic and regulator foundations are now specified as targets.** The paragraphs L3.Fa–L3.Fd are replaced by seventeen targets with statements, API, Checks and locators read from the published Besser–de Jeu (BDJ) and BBdJR v2:

| Target | Content | Main locators |
|---|---|---|
| L3.F | how the foundations are organised | — |
| L3.Fa.1 | rational K-groups with Adams weights as an explicit interface; no low weight K-theory | BDJ Def. 3.2 p. 881; Rem. 3.5–3.6 p. 881; Rem. 1.9 p. 871 |
| L3.Fa.2 | multi-relative K-theory of cubes, relativity isomorphisms with the fixed sign, the spectral sequence | BDJ (3.1) pp. 879–880; (3.7) p. 882; Lem. 3.4, 3.8, 3.13 |
| L3.Fa.3 | universal symbols [S]_n, de Jeu symbols [u]_n, (1 + I)^*, the symbolic part | BDJ (3.10)–(3.12), Def. 3.11 p. 883 |
| L3.Fa.4 | the complexes M•(n), M̃•(n), their differentials, inversion, distribution, maps to K-theory | BDJ Prop. 3.15–3.20, Rem. 3.21–3.25, (3.23) pp. 885–888; Prop. 2.11 p. 879 |
| L3.Fa.5 | Beilinson's cyclotomic elements and their spanning property | BDJ Rem. 1.13 p. 872; BBdJR Ex. 4.10 p. 19, proof of Prop. 4.17 pp. 22–23 |
| L3.Fb.1 | Gros-style modified syntomic cohomology and the normalized identification of Def. 4.6 | BDJ Prop. 4.2, (4.1), (4.4) pp. 890–891; (4.5), Def. 4.6 p. 892 |
| L3.Fb.2 | syntomic Chern character, weight-one formula, cup products, base change | BDJ Lem. 4.7, (4.8) p. 892; App. A pp. 911–922 |
| L3.Fb.3 | relative rigid complexes of cubes and the functional Π | BDJ (5.1), Def. 5.2 pp. 894–895; Lem. 5.5 p. 896; Prop. 5.7 p. 898 |
| L3.Fb.4 | the Frobenius-invariant extension Π̃ and its Coleman realization Π_Col | BDJ Cor. 5.9, Lem. 5.10, Def. 5.11, Lem. 5.12 p. 899; Prop. 5.13 p. 900 |
| L3.Fb.5 | integration down and the regulator of special symbols | BDJ Prop. 7.1–7.2 pp. 903–904; Prop. 7.10 p. 908; Prop. 7.14 and proof of Thms 1.6/1.10 p. 909 |
| L3.Fb.6 | the Gros regulator | BDJ Rem. 1.13 p. 872 |
| L3.Fc.1 | regulator pairings, discriminant and regulator determinants, Borel's theorem as consumed | BBdJR Def. 3.1, (3.2), (3.4), Def. 3.5–3.6, Lem. 3.3, 3.7 pp. 10–11; Thm. 2.2 p. 5 |
| L3.Fc.2 | the rank criterion for an idempotent | BBdJR Prop. 3.8 p. 11; Prop. 3.10, 3.12 p. 12 |
| L3.Fc.3 | Zagier's P_n and the cyclotomic determinants | BBdJR (4.2)–(4.4) pp. 17–18; Thm. 4.7 p. 19; Rem. 4.16 p. 21; proof of Prop. 4.17 p. 22 |
| L3.Fd.1 | Artin L-functions with coefficients, importing TauCetiRoadmap AdelicAlgebraicGroups §2.4 | BBdJR §2 p. 5, §3 p. 13 |
| L3.Fd.2 | p-adic Artin L-functions of totally real fields by Brauer induction, the dyadic Teichmüller character | BBdJR Thm. 2.9 p. 6; (2.10)–(2.14), Rem. 2.12–2.13 p. 7; Lem. 3.15 p. 13 |

L3.15 now has a proof sketch through these targets (including the BDJ p. 910 argument for p-power roots of unity), and its `*Needs:*`, like those of L3.16 and L3.37, cite the new targets. The dyadic case requested by R1 is the explicit part (b) of L3.36: the normalization (ω_2 of conductor 4, the ball of radius 2), the exact input that remains (Coleman's formula at p = 2 and its trivial-character case, which BBdJR quote from Coleman), and the steps of L3.28 that must be redone at p = 2. Algebraic K-theory itself enters only through the interface L3.Fa.1 (Quillen K-theory with λ-operations, assumed with the listed properties): no lower-tier roadmap plans it, and planning Quillen K-theory here would be out of proportion; the reviewer may prefer to route it to a K-theory roadmap once one is upstream.

**R2 — the Lean file follows the 2026-10-12 shape.** Suggested.lean was rewritten from 4,054 to 1,164 lines. It keeps light definitions with real bodies (`PowerSeries.primitive`, `rationalPolylogSeries`, `discAnalytic`, `padicLogBranch`, `iwasawaLog`, `IsLogBranch`, `FrobeniusDatum` with `changeBasis` and `pow`, `WordAlgebra` with the shuffle product, `D` and `depth`, `constantTerm`, `IsPolylogFamily` and `padicPolylog`, `dilogD`, `fiveTermDefect`, `twistedPolylogSum`, `complexPolylog`, the pre-Bloch and Bloch groups with `preBlochMap` and `dilogEvaluation` now given real bodies, `crossRatio`, `geometricTransform`, `rotatedSmoothedTransform`, `rjwThetaTransform`, `padicRegulatorPolylog`), the layer milestones and end theorems statable at the pins, and one or two discriminating `example`s per definition. The eight sorry'd data definitions of round 1 (`modPolylogElement`, `frobeniusSeries`, `geometricMeasure`, `preBlochMap`, `antisymmetricMap`, `blochMap`, `dilogEvaluation`, `branchPair`) are gone: two now have real bodies and the others are README targets (the Frobenius relation is stated existentially, and the geometric measure enters through its Amice transform). R2's requests that are compatible with the shape are met: `FrobeniusDatum.changeBasis` and `FrobeniusDatum.pow` (with `powG` and `hw_changeBasis_iff`) have real bodies, and the complex boundary values of L2.Fa are a real definition `complexPolylog` with continuity, the expZeta identification and the inversion relation, which L3.13 now uses directly instead of an arbitrary `polylogC`. R2's requests for Lean forms of the syntomic regulator, `padicBeilinsonConjecture` and its tests, and the regulator form of Coleman's formula are not met in Lean, because their carriers (K-groups, syntomic cohomology, Artin L-functions with coefficients) are not available at the pins and the shape forbids sorry'd carriers; they are fully specified in the README (L3.Fa.1–L3.Fd.2, L3.15, L3.16, L3.36, L3.37). The same applies to `WordAlgebra.isUnipotent` (it needs connections on modules over dagger algebras). The punctured-line tube prototypes of round 1 (`puncturedTube`, `puncturedDagger`, `colemanFunctions`) and the annulus coefficient space, which duplicated carriers owned by AdicSpacesPartII F1 and PadicHodgeTheory P7, were removed from the Lean; their targets are in the README. A closing comment lists the README-only targets by layer.

**Round-1 corrections preserved.** The tame-puncture hypothesis p ∤ N of L1.27 is the standing hypothesis (C4) in the README (the Lean prototype carrying it was removed with the tube prototypes); the distribution identity of L^mod_n is stated for every m ≥ 1 (`padicRegulatorPolylog_distribution`); the rank characterization of L3.16 is restricted to π ≠ 0, and L3.Fc.2 gives the π = 0 counterexample (k' = ℚ, n even); the RJW and BBdJR page corrections are kept.

## Plan and source issues found (packet unchanged)

1. **BBdJR Example 4.10, p. 19 (arXiv v2):** the basis of K_(2n−1)(ℚ(μ_N))_ℚ is printed as the [ζ^j]_n with 1 < j < N/2, gcd(j, N) = 1, which has φ(N)/2 − 1 elements (N = 5 gives one element for a two-dimensional space); it should read 1 ≤ j < N/2. L3.Fa.5 states the corrected range and notes the misprint. Candidate for the register of mistakes in published sources.
2. The accepted packet's proof step of `L3/syntomic-regulator-of-cyclotomic-elements` cites "Besser–de Jeu Proposition 2.10" for the distribution relation; in the published paper it is Proposition 2.11, p. 879 (the README cites the published numbering).
3. The packet's proof steps cite higher-tier owners (Polylogarithms P.1 and P.4, PadicHodgeRegulators D.2, BorelRegulators R.7, AutomorphicPadicLFunctions L3). In the README these are replaced by L2.Fa, L3.Fa.5, L3.Fb.2, L3.Fc.1 and L3.Fd.2; those higher roadmaps should import the targets of this roadmap instead of planning them again.
4. The packet's gaps "proof of Besser–de Jeu Theorem 1.10(2) not decomposed" and "complex Artin L-functions with coefficients have no owner" are now covered at target level by L3.Fa–L3.Fb and by L3.Fd.1 (importing TauCetiRoadmap AdelicAlgebraicGroups §2.4). The gaps on the general-curve comparison (L1.9 gives the route), non-free differentials (L1.21, L1.22, L1.43 keep their explicit coordinate hypotheses), higher-pole tangential normalization and the field-general projective comparison (L2.Fb) remain as recorded in the plan.

## Validation

- `lean-check research/blueprint/packages/ColemanIntegration/Suggested.lean` (shared build, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, 106 GB available): **exit 0, no errors, 98 warnings, all `declaration uses sorry`.** 1,164 lines.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- README: 177/177 plan targets, 257/257 API names, every definition with at least three Checks, every Lean declaration named in the README, no packet, node, job or review vocabulary, 17/17 reference URLs return HTTP 200.
- Duplication: current TauCetiRoadmap (checkout 0d144d0) and current Tau Ceti (a91d3aaf) have no polylogarithm, p-adic logarithm on ℂ_p, Coleman integration, syntomic regulator, K-theory of schemes or Artin L-function with coefficients. Current Tau Ceti's local-field logarithm, `TauCeti.teichmullerLift` and Riemann–Roch/Serre duality for curves are cited under Scope and supplier contracts.

## Sources read

BDJ, published version (Numdam PDF, SHA-256 `c269f455db5fc0b69452a620d639b3a9d44d56b59ce9d79ec78cd1e5a00fb872`), §§1–5, 7 and the proof of Theorem 1.12; BBdJR arXiv:0707.3682v2 (SHA-256 `609a6f67a0cd5fc8b4ab67d4ec03a229c4a6ed673cc809d4f66c949058967a14`), §§2–4; RJW arXiv:2309.15692v2 for the Coleman-formula normalization. Nothing from the cleared library was used. No source text or PDF is committed.

## Target correspondence

The table of reader targets and plan nodes in `research/blueprint/handoff/PKG-ColemanIntegration.md` is unchanged. The new targets L3.F and L3.Fa.1–L3.Fd.2, like L0.F, L2.Fa and L2.Fb, have no plan node of their own.

## Receipts

- `README.md`: 400,424 bytes, SHA-256 `4a6b6e3c8535fab37ec45e63064e3e02f55c186fbb93d8c17288d211686a8723`.
- `Suggested.lean`: 53,922 bytes, SHA-256 `0fc0328622e25078eb62eee70d2de0d0ff4ebc1de9c0caba3b039cf5758dafc3`.
- `metadata.toml`: unchanged, `topic = "math.NT"`.
