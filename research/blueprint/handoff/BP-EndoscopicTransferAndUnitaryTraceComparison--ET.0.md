# BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0 — handoff

Refs [#717](https://github.com/CBirkbeck/tauceti-explorer/issues/717). Claude Code (Claude Opus 5.5), session `claude-ilrWNW`, 14 October 2026.

Deliverables:
- `research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparison--ET.0.json` (status `complete`)
- `research/blueprint/readmes/EndoscopicTransferAndUnitaryTraceComparison--ET.0.md`
- `research/blueprint/suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.0.lean`

## What is planned

61 nodes at target level: 10 definitions, 14 constructions, 34 theorems and 3 applications, with 168 API items, 101 unit tests and 16 planets. By layer: ET.0 18, ET.1 15, ET.2b 17, ET.3 11. `check_blueprint.py` (with the pinned declaration index) reports 0 errors and 0 warnings.

| Stage | Coverage | Content |
|---|---|---|
| ET.0 | planned | crossed-module and nonabelian Galois cohomology; abelianized cohomology; Kneser, Hasse principle, abelianization square; degree-zero abelianization; Tate–Nakayama for tori and complexes; Kottwitz's map and ker¹ duality; the Kottwitz sign; inner twists; stable conjugacy; rational classes in a stable class; the global obstruction; unramified cohomology of reductive models; endoscopic and twisted data; z-pairs; images and norms; the unitary similitude data of Shin and Caraiani–Scholze; the unitary Hermitian computations of Leslie; worked examples |
| ET.1 | planned | orbital integrals (single owner); κ- and stable orbital integrals; a-data and χ-data; the Langlands–Shelstad factor with the Kottwitz–Shelstad 2012 conventions Δ′/Δ_D and the Whittaker normalization; transport, descent, central extensions and the product formula; twisted factors; Lie-algebra factors; matching functions and transfer classes; Shalika germs; Fourier transforms; the unitary factor; real characters; real transfer; pseudo-coefficients and Euler–Poincaré functions; their transfer |
| ET.2, ET.2a, ET.2a:duality-perversity, ET.2a:pure-decomposition | closed | dropped by the accepted RS-19; no nodes, with notes naming EDC.0–EDC.7, LPV.6 and ET.2b as suppliers |
| ET.2b | planned | Chevalley quotient; Kostant section; regular centralizer; Hitchin stack, base and map (any twisting line bundle); Schiffmann's boundedness; cameral covers; Picard action; anisotropic locus; affine Springer fibres; product formula; δ-stratification; weak abelian fibrations; κ-decomposition; support theorem; geometric stabilization; point counts; worked examples |
| ET.3 | planned | point counts as κ-orbital integrals; Ngô's Lie-algebra fundamental lemma; Laumon–Ngô; the non-standard fundamental lemma; Waldspurger's change of characteristic; the group fundamental lemma and Hecke algebras; existence of transfer; inner forms of GL_n; stable base change; the twisted fundamental lemma and transfer; the global almost-all-places statement |

## Requests to other roadmaps

Four substantive requests, plus one request entry per upstream Tau Ceti layer cited (20 entries for ReductiveGroups, ProfiniteCohomology, ClassFieldTheory, GlobalNumberFields, AlgebraicCurves and Chebotarev layers):
- **AlgebraicModuliForArithmeticGeometry:R09.4.** Algebraicity of the stack of sections of a coherent sheaf over Bun_G, of Picard stacks of torsors under smooth commutative group schemes over a curve, and the Deligne–Mumford criterion.
- **SchemeAndStackFoundations:SF.2.** The Grothendieck–Lefschetz trace formula for Deligne–Mumford stacks of finite type over 𝔽_q.
- **EtaleDualityAndPerverseSheaves:EDC.7.** Two inputs: the decomposition theorem and relative hard Lefschetz for proper maps from smooth Deligne–Mumford stacks (Ngô, Remarque 7.5.1); and the principle that semisimple mixed perverse sheaves over 𝔽_q are determined by their Frobenius traces.
- **GlobalShtukasAndFunctionFieldLanglands:GS.1.** The affine Grassmannian at a point as the fibre of the Beilinson–Drinfeld Grassmannian, without Satake.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/24.** ET.1/orbital-integral is the single owner of invariant orbital integrals. AutomorphicSpectralTheory AS.6 already requests it from ET.1.
- **RT-AREA-langlands-1/12.** ET.2b imports Bun_G from `GS.0/bun-g-of-the-global-curve` and the affine Grassmannian from `GS.1/beilinson-drinfeld-grassmannian`; ET.3 imports adeles from `FA.2/projective-adeles`. These edges are acyclic in the promoted atlas. With the unpromoted packets included they close a loop (ET.3 → ModularityAndLanglandsExtensions ML.4 → MetaplecticAutomorphicForms MP.3 → MP.6 → FunctionFieldArithmetic FA.6 → GS.0), because FA.6 now cites MP.6. The maintainer should check that loop when those packets are promoted. GlobalShtukas and FunctionFieldArithmetic are outside Caraiani–Newton's 94 roadmaps.
- **RT-AREA-langlands-1/13.** The non-standard fundamental lemma is consumed by `ET.3/twisted-fundamental-lemma-and-transfer` (Waldspurger 2008, Théorèmes 1.8 and 4.11; Lemaire–Mœglin–Waldspurger for Hecke algebras), and its consumer is ModularityAndLanglandsExtensions ML.4. ET.4's cyclic base change needs only the standard lemma (Waldspurger 2008 §§1.9, 4.12; `ET.3/base-change-fundamental-lemma-and-transfer`). **For part 2:** ET.5's sentence calling the twisted fundamental lemma unproved must be corrected (restructure proposal 4).
- **RT-AREA-langlands-1/14.** Kottwitz–Shelstad 2012 is a source of ET.1. Δ′, Δ_D, Δ_I^new and the Whittaker normalizations are planned, and the GL_{2n+1} transpose-inverse case is a unit test.
- **RT-AREA-geomlanglands/10.** z-extensions come from ReductiveGroupsPartII:RG2.1. ET.0 defines only z-pairs and integral z-extensions.

## Decisions the maintainer should see

1. **Nonabelian H¹ moved down.** Nonabelian Galois H¹ with discrete coefficients is planned in ET.0 rather than imported from AnabelianGeometryAndNonabelianChabauty NC.3. NC.3 is tier 16 against ET's tier 14, and it sits downstream of ET.0 in the promoted atlas. Restructure proposal 2 says NC.3 should import it.
2. **Isocrystal invariant rerouted.** HKW 022/023 (inv[b](g, g′) ∈ B(T)) are not planned here. They need BunGAndNewtonStrata BG0–BG1, which import ET.0. Restructure proposal 1 reroutes them to BG1.
3. **Characteristic hypothesis.** The roadmap's ET.3 text says Ngô's theorem needs p > 2h, but the version read (arXiv v3, Théorème 1) assumes p ∤ |W|. The node follows the source; it is recorded as a gap and in restructure proposal 4, and someone with the published Publ. IHÉS version should confirm.
4. **Declared edge ET.0 → ET.2b needed.** ET.2b uses ET.0's endoscopic data (in `ET.2b/endoscopic-comparison`). Promotion does not draw same-roadmap cross-layer edges, so this edge must be declared. ET.1 and ET.2b do not depend on each other: the orbital-integral reading of point counts is `ET.3/orbital-integrals-as-point-counts`.
5. **Pre-existing atlas cycle.** The promoted atlas already contains a cycle through ET.0 that does not involve this packet: ET.0 → AutomorphicSpectralTheory AS.2 → AS.5 → ArithmeticLocallySymmetricSpaces ALS.5 → BorelRegulators … → ArithmeticGaloisRepresentations R01.1 → ArithmeticGaloisDuality R02.1 → ET.0.
6. **AF.4 import.** ET.1/pseudocoefficients imports AF.4 (Wigner's lemma, Vogan–Zuckerman), which is tier 11. Among unpromoted packets, ALS.5 cites AutomorphicGaloisRepresentationsPartII AG2.2, which is an upward citation inside ALS.
7. **For part 2 (ET.4–ET.7).** Kottwitz's Tamagawa formula τ(G) = #π_0(Z(Ĝ)^Γ)/#ker¹(F, Z(Ĝ)) is planned nowhere (gap). The maintainer's sources for ET.4–ET.7 (Newton–Thorne, Jiang–Zhang, Colmez–Dospinescu–Nizioł, Atobe–Kondo–Yasuda, Pan, BCGP, most of LTXZZ and Caraiani–Scholze items 90–102 and 150) belong to part 2 and are not covered here; `routedItemCoverage` in the packet maps every item routed to ET.0–ET.3.

## Sources

Read: Ngô (arXiv:0801.0446v3); Langlands–Shelstad 1987 and Kottwitz 1986 (GDZ scans); Kottwitz 1986, base change (Numdam); Kottwitz–Shelstad 2012; Hales 2003; Laumon–Ngô; Labesse, Astérisque 257 (Numdam); Waldspurger's preprints of his 2006 and 2008 papers; Kottwitz's and Arthur's Clay notes; Shin 2010 and 2011 (author copies); Caraiani–Scholze 2017 (arXiv v1) and the non-compact paper (arXiv v2); Leslie (arXiv v3); Kaletha (arXiv v5); Kisin (author preprint); van Hoften (arXiv v4); Hansen–Kaletha–Weinstein (arXiv v4); Schiffmann (arXiv v2); Yu (arXiv v5); and LTXZZ, read in the cleared copy and cited by its public NSF URL.

Not read (cited through secondary statements, recorded as a gap): Kottwitz 1999 on Lie-algebra transfer factors (the AMS server refused automated access); Waldspurger 1997; Shelstad's real endoscopy; Harish-Chandra 1965; Clozel–Delorme; Hales 1995; Deligne–Kazhdan–Vignéras; Lemaire–Mœglin–Waldspurger; Langlands–Shelstad 1990; Kottwitz 1982, 1984 and 1990; Kottwitz–Shelstad 1999; Borovoi 1998; Serre; Borel–Serre. Two of these are not freely available as far as found: Kottwitz–Shelstad, Astérisque 255 (not on Numdam), and Waldspurger 1997 (Compositio 105, not on Numdam).

Source issue: one new misprint (`EndoscopicTransferAndUnitaryTraceComparison/E1`, the index range n₂ ≥ 0 in Caraiani–Scholze non-compact §5.2). Known issues cited, not re-recorded: PAPER-KISIN-17/E41 and PAPER-LESLIE-25/E1–E2.

## Lean

`lean-check` of the suggested file (Mathlib 082e2d3, in the shared build) gives no errors; the only warnings are 24 `sorry` warnings. `scripts/check_sorry_data.py` passes. The file has 259 lines in the compact shape: light real-bodied definitions over Mathlib carriers and statable milestones. Reductive-group objects have no carriers at the pins and are document targets only.

## What a follow-up must do

- The independent review checks this packet.
- The four supplier requests above need answers.
- Restructure proposals 1–4 need decisions.
- Lemma-level refinement, listed in each stage's `remaining`: the individual Δ terms, Langlands–Shelstad descent, the Néron model of J_a, and the stratification by ψ.
- Read the unread primary sources and replace the secondary locators.
