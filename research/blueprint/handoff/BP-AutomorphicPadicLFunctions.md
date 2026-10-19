# BP-AutomorphicPadicLFunctions — handoff

Issue #689. Worker: Claude (Opus 5.5), session `claude-YFzskK`. The claim was confirmed by the bot on 2026-10-18 at 23:50Z. This run continues the 2026-09-26 checkpoint (ChatGPT Pro, PR #3100) and completes the target-level pass.

## Status

The packet is `complete`: 105 nodes, every stage in scope `planned`, 0 checker errors and 0 warnings against the pinned declaration index. The title and base follow the accepted RS-14: *Dirichlet p-adic L-functions, special values, and Eisenstein measures, Part II: Ray-class and automorphic interpolation*, extending DirichletPadicLFunctions. KU-hilberteisenstein is not in this job’s scope and gets no nodes.

| Stage | Nodes | Planets |
| --- | --- | --- |
| L0 ray-class limits, avatars, distributions, evaluation principle | 13 | 4 |
| L1 BSW cohomological input for GL₂/F | 10 | 1 |
| L2 overconvergent cohomology, the BSW distribution | 21 | 4 |
| L3 Deligne–Ribet and Katz | 21 | 5 |
| L3h Hsieh, with the proposed sub-layer L3m | 15 | 3 |
| L4 EHLS and Disegni–Liu | 16 | 2 |
| L4e Eischen–Wan | 6 | 2 |
| L5 comparisons and the CPR/Panchishkin proposition | 3 | 1 |

By kind: 19 definitions, 26 constructions, 52 theorems, 2 lemmas and 6 comparisons. The definitions and constructions carry 256 API items and 180 unit tests. There are 22 planets, 16 baseline declarations read at the pins, 13 requests, 4 gaps and 5 source findings.

## What changed from the 2026-09-26 checkpoint

That checkpoint planned 19 lemma-level algebraic nodes in L0/L2. The seven construction and theorem nodes are kept with their ids and rewritten at target level against BSW: `L0/unit-invariance-closure`, `L2/inversion-weight-twist`, `L2/finite-evaluation`, `L2/finite-evaluation-representative`, `L2/refinement-eigenvalue`, `L2/normalised-evaluation` and `L2/normalised-evaluation-common-level`. The twelve small lemmas are folded into API items; the map is in `retiredDraftNodes`. Its three source findings were re-examined against BSW v3:

- **E1 (chart convention).** Confirmed as a convention slip, reclassified as a misprint with no effect on the results: the forward chart makes Propositions 9.3, 9.6, 9.9 and equation (13) consistent.
- **E2 (Lemma 6.7).** Confirmed: the identity is a counterexample to compactness for all of GL₂(F) ∩ Σ₀(p).
- **E3 (Lemma 8.1(iii)).** Confirmed as a missing lattice hypothesis.

Two new findings are recorded:

- **E4.** BSW §9.2.1 divides by the image of the units rather than its closure.
- **E5.** Eischen–Wan Corollary 5.9 cites “Proposition 4.17”, which is Lemma 4.17.

## Red-team findings handed to this job

All eight are handled; each disposition is in `findingsCoverage`.

- **automorphic-1/13.** The GL₂ Whittaker and L-function imports (AL.2, AL.3/whittaker-model, R16.3, R16.5) are now cited.
- **iwasawa-1/7.** The mod-p nonvanishing material is planned as the sub-layer L3m: Hida 2010 Theorem 3.20 and Corollary 3.21, Hida’s density, Hida’s and Hsieh’s µ = 0, Hsieh 2012 Theorems A and B, and Finis Theorem 1.1. A `restructure` split proposes the sub-layer.
- **iwasawa-1/11.** L3h owns the GL₂ BDP square-root distribution through Hsieh and its F = ℚ, n⁻ = 1 specialisation.
- **iwasawa-1/32.** L4e carries the hypotheses that the Satake characters are pairwise distinct and that π is tempered.
- **iwasawa-1/33.** The growth target is split: BSW give only choice-independence for general F; growth and uniqueness come from Williams (imaginary quadratic) and Bergdall–Hansen (totally real, Leopoldt defect zero).
- **iwasawa-1/34.** The ALS and AF imports are cited, and Eichler–Shimura–Harder for GL₂ over F is requested from ALS.4.
- **langlands-1/8.** The Hilbert Igusa inputs come from T5 and HMVSC H2, never from IG.1.
- **ktheory-2/26.** The Leopoldt defect is imported from IntegralIwasawaTheory:L4/leopoldt-defect.

## Paper routes

`routeCoverage` maps every routed item of the following papers:

- **Dasgupta–Kakde 2023 (35 items).** The cusp combinatorics, Eisenstein series, constant terms (Proposition 8.4, checked against the text) and group-ring families are planned. Propositions 8.11–8.12 are the Brumer–Stark construction of IntegralIwasawaTheory:KU-brumerstark, whose inputs this roadmap supplies.
- **Dasgupta–Kakde–Ventullo 2018 (3 items).**
- **Disegni–Liu 2024 (items 1 and 6–19).** All planned in L4.
- **Castella et al. 2022 (item 10).**

## Requests (13)

These cover the GlobalNumberFields, ClassFieldTheory, ModularForms and Chebotarev Tau Ceti layers, PadicMeasuresIwasawaAlgebras L0a/L1, ALS.4, SR.4, ML.3, and one new request to HilbertModularVarietiesAndShimuraCurves:H2. The ALS.4 request is for Eichler–Shimura–Harder for GL₂ over a general F. The H2 request is for the formal and mod-pⁿ ordinary Igusa tower over the Hilbert ordinary locus: T5 has only the generic-fibre tower, and the request follows the red-team routing.

## Consumer requests (`requestLedger`)

There are 22 entries from AutomorphicCongruences, ColemanIntegration, ColemanPowerSeriesPartII, GeneralizedHeegnerCycles, GrossZagierAndArithmeticHeights, HeegnerPointEulerSystems, NoncommutativeAndEquivariantIwasawa, OrdinaryAutomorphic, RankZeroOneBSD, SpecialValuesBirchTate, and the RS-14 links to ModularIwasawaMainConjectures:L5 and IntegralIwasawaTheory. Several are only partly answered because their sources are not routed here:

- Wan 2015’s GU(2,2)/F family;
- Hung’s theorem;
- Skinner–Wiles’ two-character Eisenstein series;
- BSTW’s signed and Hida Rankin functions;
- Greenberg’s p-adic Artin L-functions;
- Colmez’s residue formula;
- the nonordinary CM continuation, which goes to the Part II design (#1689 / #3350).

## Gaps (4)

1. Hida 2004, Theorems 3.2–3.3, was not read; it is stated through Hsieh 2014 §7.
2. Vatsal 2003 was not read.
3. BSW Theorem 4.6 is only sketched in BSW; Williams’ thesis was not read.
4. Hida–Tilouine 1993 and Katz §§5.4–5.6 were read only at the level of their statements, so Katz’s local term is still to be transcribed.

## Checks run

- `python3 scripts/check_blueprint.py` with the pinned index: 0 errors, 0 warnings.
- Cycles: none at node level across all packets, and none inside the roadmap. Every requested stage’s `requires` closure avoids this roadmap. The atlas-wide stage graph already contains long cycles through other roadmaps’ packet edges; none passes through a node of this packet.
- Supplier contracts: a Sonnet cross-check of 159 (citing node, supplier node) pairs found 121 sound, 34 generality issues and 4 mismatches. Every flag was checked against the two statements and fixed: multivariable LAD suppliers, the monoid Hecke action for U_𝔭, Metaplectic’s doubling filtration and local doubling integral, the H2 request, and the removal of four citations that did not supply their use.
- A Sonnet locator sweep of 132 text-source locators against the source texts: 127 were right. Five were corrected after I checked them: Bergdall–Hansen p. 48 is in §6, not §8; Hsieh’s CM points are in §4.6 on p. 748; Castella–Grossi–Lee–Skinner’s L_E is in §2.1.1 (Theorem 2.1.1); Eischen–Wan 4.9 and 4.10 are a remark and a definition; and the F = ℚ reading of Dasgupta–Kakde–Ventullo is now marked as our specialisation.
- Formulas transcribed from retrieval output were re-read on page images: Disegni–Liu Theorem 3.37 and Proposition 3.32 (corrected to γ((1+r)/2, π̲_u ⊗ χ_v)), EHLS Theorem 4.3.10, Katz (5.3.5), and Dasgupta–Kakde Proposition 8.4.

## Suggested Lean file

The file is 391 lines. It prototypes, over carriers that exist at the pins:

- the ray-class tower as compatible families of Tau Ceti `RayClassGroup`s with `classMap`;
- the unit-closure lemma;
- admissible weights and criticality;
- weighted inversion;
- the refined eigenvalue and the level normalisation with the common-level theorem;
- Euler-factor elements in `MonoidAlgebra`;
- the Panchishkin unit-root condition.

Every other API and test name appears in the closing register of README targets. A script confirmed that all 435 packet names occur in the file. **It compiled:** `lean-check` (Mathlib 082e2d3, Tau Ceti f790474) reports `sorry` as the only warning. A `run_cmd` audit found no `sorry` inside any statement and no sorry-bodied `Prop` definition.

## Sources read

All were read on 2026-10-19 and are listed with URLs and SHA-256 in the packet:

- Barrera Salazar–Williams, arXiv v3, the whole paper;
- Deligne–Ribet and Katz 1978, from GDZ scans (rendered pages);
- Hsieh, Doc. Math. 2014;
- Hida, Annals 2010;
- Hsieh 2012 (non-vanishing; µ-invariant);
- Eischen–Harris–Li–Skinner;
- Eischen–Wan v2;
- Disegni–Liu;
- Dasgupta–Kakde;
- Dasgupta–Kakde–Ventullo;
- Castella–Grossi–Lee–Skinner;
- Panchishkin, AIF 1994;
- Finis, Annals 2006;
- Williams (Bianchi);
- Bergdall–Hansen.

Not read: Hida 2004, Vatsal 2003, Hida–Tilouine 1993, Williams’ thesis, the journal versions of BSW and Eischen–Wan (the findings are scoped to the arXiv versions in `sourceVersions`), and Coates–Perrin-Riou 1989.

## For the review and follow-ups

- Check the L3m sub-layer proposal and the H2 request; both follow red-team routings.
- Katz’s local term (5.2.30)–(5.2.38) and the archimedean integrals at complex places in BSW Theorem 4.6 are the main refinements left.
- The DR/Katz scans were read page by page. A reviewer can render GDZ pages with `pdftoppm` (PDF page n is printed page 225 + n for Deligne–Ribet and 197 + n for Katz).
