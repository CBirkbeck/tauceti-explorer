# DESIGN-ComplexMultiplicationAndExplicitReciprocityPartII — handoff

Issue: #3405. Worker: Codex, session `codex-jxfcHU`. Date: 19 October 2026.

This is a complete target-level design pass, submitted for independent review. It is not a checkpoint and makes no implementation or proof-closure claim. All 69 nodes remain unchecked. All layers CMH.0–CMH.13 are planned; none is closed.

## Delivered

- A new Part II roadmap, its whole-roadmap packet, a detailed reader document and a compact suggested Lean file.
- 69 targets: 11 definitions, 3 constructions and 55 theorems; 45 API items and 44 discriminating definition/construction checks; 55 planets, at most six per layer; 9 verified pinned baseline declarations.
- All 94 routed items accounted for: Masser–Zannier 1, Tsimerman 21, AGHMP 56 and Yuan–Zhang 16. The packet’s `routeCoverage` identifies the target for each item.
- Both averaged-Colmez proof routes converge on one target. Either verified route suffices mathematically; the prerequisite union inventories both designs.
- The quantitative branch includes individual height bounds, common definition fields and exponent budgets, primitive reciprocity, arbitrary center orders, compact-index losses, period coordinates and bounded-degree CM finiteness.
- 35 source issues are recorded in the packet and reader in our own words, distinguishing corrected statements from unresolved proof comparisons.

## Review priorities

Start with CMH.0 and the newly identified domain discrepancy in AGHMP Theorem 9.1.5, p. 509. Total-height overlaps vanish at c and are inversion-invariant. Their Q-span H_CM is proper in CM⁰: the constant function 1 already distinguishes them. Total-height values therefore cannot uniquely specify a functional on all CM⁰. The design states uniqueness on H_CM, sufficient for its average and total-reflex identities. Colmez’s original Theorem 0.3, p. 631 instead specifies component-period values on a larger generating family. Its full functional requires those extra data and an explicit normalization adapter. The reader includes a second C₆ counterexample. This is a domain/uniqueness issue, not a refutation of the averaged theorem.

Next verify the metrized determinant and trace-one period, the repaired positive conductor/partition signs, and the orthogonal filtered-line comparison. In the quaternionic route, check the erratum’s different-torsion graph and the actual ramified Hodge lattices: raw embedding tensor quotients can contain torsion. A determinant comparison cannot follow from their generic exactness alone.

For the orbit consumer, preserve the distinction between the absolute polarized coarse-point orbit, a relative marked reciprocity orbit, and a field defining the object. Keep the center order index separate from the adelic compact index, and retain both the field-discriminant factor and the bad-prime loss in the quantitative reduction. The existing quadratic ideal count does not supply the required near-linear estimate.

## Open proof gates

The following 21 gaps prevent proof closure; their exact contracts, affected targets and resolutions are in the packet and reader:

- **G-Colmez** — Primary height-linearity theorem.
- **G-AbsoluteHodge** — Absolute-Hodge integral tensor comparison.
- **G-Metric** — Complete metrized determinant isometry.
- **G-IntegralReflex** — Integral total-reflex length identification.
- **G-OrthogonalAdapter** — Repair the orthogonal filtered-line lattice comparison.
- **G-GSpin** — Big-CM orthogonal arithmetic height input.
- **G-Armitage** — Different-character and narrow norm calculation.
- **G-Borcherds** — Support-controlled prime elimination.
- **G-Classical** — Imaginary quadratic period formula.
- **G-CMHodge** — Primary CM Hodge-filtration comparison.
- **G-CMKisin** — All-prime CM Kisin classification proof.
- **G-RamifiedComponent** — Ramified relative/image determinant comparison.
- **G-QuaternionOrders** — Integral maximal-order graph input.
- **G-IntegralKS** — Ramified integral Kodaira–Spencer comparison.
- **G-YZKernels** — Noncuspidal arithmetic kernel comparison.
- **G-Adjunction** — Detailed ramified arithmetic adjunction.
- **G-HeckeUniform** — Uniform quadratic Hecke analytic estimates.
- **G-TorusIndex** — Uniform compact-index local comparison.
- **G-TorusOrbit** — Torus orbit inequality and moduli injectivity.
- **G-PeriodReduction** — Quantitative hermitian and Siegel reduction.
- **G-ErratumEdition** — Journal/author erratum collation.

G-Colmez now records a statement-level reading of Colmez pp. 627–632; the underlying period-relation proofs and the precise sign/conductor/unscaled-metric adapter remain open. G-CMHodge concerns a different local comparison and remains open. No claim is made to have read the entirety of any source outside its recorded reading scope.

The author’s revised Yuan–Zhang erratum dated 18 December 2022 was read in full, including its all-prime comparison and contraction argument. The journal erratum, Annals 198 (2023), pp. 867–878, was identified but not collated with that author version. G-ErratumEdition records this boundary. Vignéras is not in the cleared reference index and was not read from another copy; G-QuaternionOrders retains that input.

## Supplier requests and ownership

The 38 requests below are exact contracts recorded in the packet, not claims that their owners have completed them. No other packet was edited and no external message was sent:

- `AbelianSchemesAndArithmeticModuli:A4`.
- `AbelianSchemesAndArithmeticModuli:A5`.
- `AbelianSchemesAndArithmeticModuli:A6`.
- `AnalyticNumberTheory:AN.4`.
- `AutomorphicBundles:B1`.
- `AutomorphicBundles:B2`.
- `AutomorphicBundles:B4`.
- `AutomorphicLFunctionsAndLocalFactors:AL.1`.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0`.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1`.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.
- `GrossZagierAndArithmeticHeights:GZ.0`.
- `GrossZagierAndArithmeticHeights:GZ.2`.
- `GrossZagierAndArithmeticHeights:GZ.6`.
- `GrossZagierAndArithmeticHeights:GZ.7`.
- `HeightsRationalPointsAndObstructions:RP.0`.
- `HilbertModularVarietiesAndShimuraCurves:R18.1`.
- `HilbertModularVarietiesAndShimuraCurves:R18.2`.
- `HilbertModularVarietiesAndShimuraCurves:R18.5`.
- `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.2`.
- `MetaplecticAutomorphicForms:MP.7`.
- `NeronModelsAndSemistableAbelianVarieties:R11.5`.
- `PELModuli:M5`.
- `PELModuli:M6`.
- `ReductiveGroupsPartII:RG2.0a`.
- `ShimuraData:D1`.
- `ShimuraData:D3`.
- `ShimuraVarieties:V4`.
- `ShimuraVarieties:V5`.
- `ShimuraVarieties:V8`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.
- `ArakelovGeometryAndAbelianHeights:R35.4/cm-hodge-filtration-local`.

No existing CM.0–CM.6 targets, stable/component heights, geometric isogeny estimates, integral-lattice foundations, completed EffectiveBounds, orthogonal/Spin groups or integral Kuga–Satake models are replanned here. Current upstream roadmap additions and the current Tau Ceti library were read, separately from verification at the atlas pins. The packet records both current upstream commits.

GSpinSpecialDivisorHeights is a pending paper proposal without an accepted stage or packet. Its arithmetic Hodge-height, Borcherds support and prime-elimination interfaces remain explicit gaps and upstream notes; the design invents no GS.8 stage. Generic quantitative torus and reduction refinements belong to their existing owners or their Part II; the exact new contracts are requests rather than duplicate foundations. No ownership move to a higher-tier roadmap is proposed.

## Source scope

- **Jacob Tsimerman**, Annals 187 (2018), 379–390: Entire article, §§1–6, pp. 379–390.
- **Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera**, Annals 187 (2018), 391–531: Introduction, pp. 391–396; §3, pp. 414–431; §9, pp. 508–526; statements of Theorems 6.4.2 and 8.3.4; local source repairs listed below.
- **Xinyi Yuan; Shou-Wu Zhang**, Annals 187 (2018), 533–638: §1, pp. 534–541; §2.2, pp. 544–550; §5.2–5.3, pp. 573–577; §9.1–9.2 target statements and adjunction setup, pp. 624–631.
- **Xinyi Yuan; Shou-Wu Zhang**, Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated: Entire revised author erratum, §§1–3, pp. 1–11.
- **Jacob Tsimerman**, arXiv:1103.5619v2; use preprint pagination, not JAMS pagination: §7.1–7.2, pp. 15–20.
- **Jonathan Pila; Jacob Tsimerman**, arXiv:1106.4023v1; Compositio 149 (2013), 204–216: §3: CM coordinates and height bounds; preprint pagination.
- **Jonathan Pila; Jacob Tsimerman**, Annals 179 (2014), 659–681: §7, Conjecture 7.1, p. 673 and Lemma 7.4, p. 675.
- **David Masser; Umberto Zannier**, Annals 191 (2020), 635–674, public supplemental article PDF: §5.4, CM-point finiteness consumer.
- **Pierre Colmez**, Annals 138 (1993), 625–683; author-hosted scan: Introduction, definitions and statements, pp. 627–632, especially component generators on p. 630 and Theorem 0.3, p. 631; underlying period-relation proofs remain a gate.

All URLs, editions, read boundaries and source fingerprints are in the packet. Bibliographical references quoted by a paper do not count as primary proofs read. No source excerpt or section-by-section source summary is included in the deliverables.

## Verification and next step

- `scripts/check_blueprint.py` reports zero errors and zero warnings, with all fourteen stages planned and none closed.
- The suggested file elaborated with `lean-check` against the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, fourteen admitted-proof warnings and no other warnings. It uses individual imports, eight representative theorems, seven examples and four checks of existing interfaces. There are no admitted data definitions, invented heavy carriers or axioms.
- File intake validation, route/API/planet consistency checks and whitespace checks are run before submission. Only the five authorized deliverables are changed.

Independent review should assess the mathematical statements and open supplier contracts, beginning with the priorities above. To close layers, resolve their explicitly named gates, verify the full primary proofs and comparisons, and update the corresponding coverage. The next worker needs only these committed deliverables; no scratch files are required.
