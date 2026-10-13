# Handoff: BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (complete)

Agent: Claude (Opus), session claude-BrsoBP, 2026-10-13. Refs #731. Earlier passes: checkpoints 1–9 by cc-fb70e5 (#3824–#3848).

## State

- Packet status **complete**; 146 nodes (42 new in this pass), 170 API items, 139 unit tests, 32 planets.
- All six stages are **planned**. None is closed: each coverage record lists its remaining refinements, and R07.1 carries one gap.
- `python3 scripts/check_blueprint.py` reports 0 errors, 0 warnings. `intake.py check-files` reports 0 problems on the three deliverables.
- The reader document is regenerated. New node sections are spliced into each stage. The tail (requests, coverage, open inputs, source issues, sources) is rendered from the packet. The intro no longer contains process wording.

## New nodes

- **R07.1 (12):**
  - `truncated-barsotti-tate-groups`, `bt-n-recognition` (Illusie's coLie criterion and the fibrewise criterion);
  - `multiplicative-type-rigidity`, `multiplicative-part-filtration`, `order-p-subgroup-type-decomposition`, `orthogonal-schematic-closure`;
  - `universal-cover`, `universal-cover-rigidity`;
  - `raynaud-abelian-embedding`, `henselian-lifting-p-divisible`, `p-complete-flat-descent`;
  - `raynaud-determinant-tame-different`.
- **R07.2 (11):**
  - `alpha-p-filtration`, `bt1-hasse-invariant`, `bt1-hasse-witt-duality`, `bt-stack-smooth`;
  - `de-jong-dieudonne-equivalence`, `sw-dieudonne-semiperfect`, `berthelot-perfect-valuation-rings`;
  - `witt-frobenius-fixed-constants`, `semilinear-charpoly-descent`, `covariant-dieudonne-module`, `dieudonne-manin-classification`.
- **R07.3 (2):** `fl-finite-flat-dictionary` (FL §9), `fl-residual-weights`.
- **R07.4 (6):**
  - `kummer-field-of-norms`, `etale-phi-modules-cohen-ring`;
  - `bk-module-structure` (BMS Def. 4.1 / Prop. 4.3), `bms-kisin-functor` (BMS Thm. 4.4, Prop. 4.34);
  - `bk-integral-comparisons` (AGHMP Thm. 2.1.1), `wach-breuil-kisin-comparison` (Cais–Lau).
- **R07.5 (6):**
  - `savitt-reduction-principal-series`, `savitt-residual-types`;
  - `crystalline-01-inertia-types`, `peu-ramifie-classes`, `peu-ramifie-integral-lifting`;
  - `serre-weights-compact-induction`.
- **R07.6 (5):** `illusie-obstruction-homomorphisms`, `flat-deformation-tangent-space`, `finite-flat-base-change-twist`, `raynaud-det-tate-module`, `cyclotomic-image-stability`.

## Edits to existing nodes

- **`R07.1/oort-tate-classification`:** adds the p = 2 law f ⋆ g = f + g − bfg, change of trivialisation, the duality (L, a, b) ↦ (L⁻¹, b, a) and the specialisations (Schröer §5; Pilloni p. 92).
- **`R07.4/kummer-etale-phi-modules`:** now uses the new field-of-norms and Cohen-ring nodes instead of PhiGammaModulesAndIwasawaCohomology PG.0/PG.1.
- **`R07.2/isogeny-classification` and `R07.2/dieudonne-slopes`:** now use `R07.2/dieudonne-manin-classification` instead of VectorBundlesAndIsocrystals VB0.
- **`R07.1/p-divisible-group`:** imports AbelianSchemesAndArithmeticModuli A4/p-divisible-group, since §A4.5 `BarsottiTate` already owns the basic interface. This node keeps the general theory.

## Moves down and imports (WORKERS.md "Upstream tiers")

**Moved down into this roadmap.** These citations pointed outside the 94 roadmaps:
- PhiGamma PG.0/PG.1 became `R07.4/kummer-field-of-norms` and `R07.4/etale-phi-modules-cohen-ring`. PhiGammaModulesAndIwasawaCohomology can point its Kummer-tower material here.
- VectorBundlesAndIsocrystals VB0 became `R07.2/dieudonne-manin-classification`, which builds on Mathlib's `WittVector.Isocrystal` and `isocrystal_classification` (the rank-one case).

**Upward citations still in the packet, for the package to move down:** PadicHodgeTheory (tier 13), 23 citations to R06.1/R06.2 (period rings, D_cris, weak admissibility), and PadicDifferentialEquationsAndRigidCohomology RD.1 (tier 12), 1 citation.

**Imported from lower tiers, not planned here:**
- CrystallineCohomology CR.7: `dieudonne-evaluation`, `dieudonne-variance-twist`, `messing-filtration-interface`, `relative-crystalline-direct-image`. This covers the crystalline Dieudonné crystal and Grothendieck–Messing, which the old R07.2 coverage listed as remaining.
- AbelianSchemesAndArithmeticModuli A4.5/A4.7 and A3.
- SchemeAndStackFoundations SF.0/SF.4: topological invariance of the étale site, formal étaleness.
- DerivedDeRhamCohomology DD.0: cotangent complex.
- SmoothRepresentationsOfLocalGroups SR.2: compact induction.
- Tau Ceti ProfiniteCohomology layer 9: Kummer theory, local duality.

**New requests:** SmoothRepresentationsOfLocalGroups:SR.2, ProfiniteCohomology layer 9, CrystallineCohomology:CR.0.

## Red-team findings

- **RT-AREA-langlands-2/7 (Savitt):** planned.
  - `R07.5/savitt-reduction-principal-series`: Theorem 6.11. A residually reducible ρ of tame principal-series type is reducible, i.e. ordinary up to twist.
  - `R07.5/savitt-residual-types`: Corollary 6.15(1),(2), Remark 6.17, and Gee's Theorem 4.6.1. Its `uses` name R27.2, R26.3 and R24.6.
  - Breuil–Mézard Proposition 6.1.1 is not a separate node. Savitt's case analysis gives the ordinarity directly.
  - Breuil–Mézard Proposition 4.1.1, the scalar crystalline case requested by ClassicalSerreModularity, is `R07.3/fl-residual-weights`.
- **RT-AREA-padic-2/4 (Kisin functor):**
  - (1) Kummer field of norms and Fontaine's equivalence: now nodes of this packet.
  - (2)–(4): already planned by checkpoint 8 (`phi-n-nabla-modules`, `weakly-admissible-slope-zero`, `finite-height-lattices`, `crystalline-restriction-full-faithfulness`).
  - All Hodge–Tate weights, with the A_inf and B⁺_cris comparisons: `R07.4/bms-kisin-functor`.
  - The edge R07.4 → PR.7 is an atlas link and was not edited here. PrismaticCohomology's packet already cites these nodes.
- **RT-AREA-padic-2/5 (Tate and Raynaud §4 for Faltings):**
  - Raynaud Théorème 4.1.1: `R07.1/raynaud-determinant-tame-different`.
  - Raynaud Théorème 4.2.1 with Lemme 4.2.3: `R07.6/raynaud-det-tate-module`.
  - Tate's Hodge–Tate decomposition and full faithfulness were already nodes (`hodge-tate-p-divisible`, `tate-generic-fibre-theorem`).
  - **Not checked in this pass:** whether `hodge-tate-p-divisible` and `p-divisible-discriminant` state Tate's Proposition 2 and Theorem 2 in the form Faltings uses.

## Maintainer-added sources

- **Newton–Thorne 2026:** `fl-residual-weights`.
- **Schröer:** `oort-tate-classification` edit. The sign misprint is source issue E15, already recorded in PAPER-SCHROER-23 E5.
- **ACC:** `crystalline-01-inertia-types`, `peu-ramifie-classes`, `peu-ramifie-integral-lifting`.
- **D'Addezio:** `de-jong-dieudonne-equivalence`.
- **AGHMP:** `bk-integral-comparisons`. The twist misprint is E16.
- **Yuan–Zhang:** CM Kisin modules and different-torsion are left in the R07.4/R07.6 remaining lists, because the erratum was not read. The BK classification items are existing nodes.
- **Caraiani–Scholze:** `universal-cover`, `universal-cover-rigidity`, `sw-dieudonne-semiperfect`, `berthelot-perfect-valuation-rings`.
- **Pilloni:**
  - R07.1: `truncated-barsotti-tate-groups`, `bt-n-recognition`, `multiplicative-type-rigidity`, `multiplicative-part-filtration`, `order-p-subgroup-type-decomposition`, `orthogonal-schematic-closure`.
  - R07.2: `bt1-hasse-invariant`, `bt1-hasse-witt-duality`, `bt-stack-smooth`.
  - Oort–Tate: the existing node.
- **Česnavičius:** `alpha-p-filtration`.
- **Lipnowski–Tsimerman:** `witt-frobenius-fixed-constants`, `semilinear-charpoly-descent`, `covariant-dieudonne-module`. Exactness and length: the existing `dieudonne-equivalence-finite`.
- **Anschütz–Le Bras:** `raynaud-abelian-embedding`, `bt-n-recognition`, `henselian-lifting-p-divisible`, `p-complete-flat-descent`.
- **CDN:** `serre-weights-compact-induction`.
  - It states End = F̄_p[T], freeness, and the Barthel–Livné/Breuil irreducibility statements.
  - The "rigidity of proper quotients of I(σ)" was not found in CDN §1.2.1 and is not stated.
- **Li–Zhang:** Tate's theorem is the existing `tate-generic-fibre-theorem`.
- **Newton–Thorne 2021 (Gee 4.6.1):** `savitt-residual-types`.
- **BMS:** `bk-module-structure`, `bms-kisin-functor`. This also answers AInfCohomology AI.6 and CohomologyComparisons CP.5.
- **BCGP 2021:** `multiplicative-type-rigidity`.
- **BCGP 2025:** `cyclotomic-image-stability` (Lemma 6.4.2). §10.3 is in the remaining lists.
- **Scholze 2015:** `illusie-obstruction-homomorphisms`.
- **BCDT 2001:** Tate's theorem is an existing node. §§4.1–4.2 and §5 are not yet nodes (R07.1/R07.4 remaining lists); the paper was not read in this pass.

## Incoming requests answered in this pass

- R07.2 BT₁ Hasse invariant, LF and the BT₁ Hodge–Tate sequence: AlgebraicModularFormsAndSerreWeights R15.3, HodgeTate T0, HilbertModular H0/H2, ShimuraCompactifications C6.
- Covariant Dieudonné isocrystal: HeckeStacks HS3, IgusaVarieties IG.0.
- Scholze–Weinstein Theorem A and universal covers: IgusaVarieties IG.0.
- Illusie's obstruction class: HodgeTate T0 (partly). Fargues' degree function remains.
- Raynaud §4: FaltingsFiniteness R28.5.
- ACC Lemma 7.1.8: HilbertModular H0.
- Savitt and Breuil–Mézard: ClassicalSerreModularity R26.1.
- BMS Proposition 4.3 and Theorem 4.4: AInfCohomology AI.6, CohomologyComparisons CP.5.
- Wach comparison for K = K₀: PadicHodgeTheory P7.
- The CrystallineCohomology request for the Dieudonné crystal and Grothendieck–Messing is answered by CrystallineCohomology's own package (CR.7.2). This roadmap imports it.

## Gaps and source issues

- **Gap:** the fibrewise BT_n criterion for n ≥ 2. Pilloni proves n = 1 and attributes the general case to Fargues without a reference.
- **E15:** Schröer, §5 group-law sign.
- **E16:** AGHMP, Theorem 2.1.1 twist.
- **E17:** Pilloni, Lemma 6.3.3.1. The exactness of the middle row is used without being stated.

## Lean

`lean-check research/blueprint/suggested/FiniteFlatGroupsAndIntegralPadicHodgeTheory.lean` exits 0. Its only warnings are `declaration uses 'sorry'`. The overlapping-instances linter is switched off in the file.

- **Pre-existing errors fixed:** the file had never been compiled and had 27 elaboration errors.
  - Section variables were dropped from `genericPoints`, `tateModule`, `CK`, `hodgeTateInvariants` and `frobeniusTwist`.
  - `F →+* End G` became `F →* End G`, since `End G` is not a ring in this category.
- **New statements:** `padicConstants`, `frobenius_eq_self_iff` and `exists_padic_charpoly`, with tests.
- **Closing comment:** lists by stage the 257 packet API and test names whose carriers the pinned libraries lack.
- **Placeholders:** the file still uses `sorry`-bodied placeholders for objects owned elsewhere, as earlier passes did. The package must replace them following PACKAGE_REVIEW's 2026-10-12 shape.

## Sources

**Read in this pass (all free, or cleared in the maintainer's library):**
- Savitt §§2, 6; Raynaud §4 and the appendix.
- Gee 2011 §4.6; ACC §§7.1–7.2.1; CDN §1.2.1.
- Breuil 2003 §§1–3; Breuil–Mézard §4.1; Breuil 1999 §2; Wintenberger §§1–3 (statements).
- Anschütz–Le Bras §4.6 and App. A; Pilloni §§6.3, 7.4.2, 9.1.1, 10.1–10.2, 14.3.
- Caraiani–Scholze §4.1; Scholze–Weinstein §§1, 3.1–3.3, 4.1.
- Berthelot 1980 §3.4; de Jong 1995 Introduction and §2.3; D'Addezio §5.
- Cais–Lau §§1, 2.4–2.5, 4.5; Česnavičius App. A; Lipnowski–Tsimerman §3.
- BMS §4.1; AGHMP §2.1; Scholze 2015 §III.2.1; Ramakrishna §§1–4.
- FL82 §9; Newton–Thorne 2026 §5 (Lemma 5.7); Schröer §5; Yu §§2.1–2.2; BCGP 2025 §6.4.

**Cited but not read:**
- Illusie, *Déformations de groupes de Barsotti–Tate* (Astérisque 127) and *Complexe cotangent II*.
- Berthelot–Breen–Messing; Messing LNM 264; SGA 3 XVII 4.2.1.
- Fontaine, Astérisque 47–48 (image-only scan) and the Grothendieck Festschrift.
- Harris–Taylor II.1.2; Oort–Zink 1.3; Wedhorn (BT_n truncation smooth); de Jong 1998.
- Barthel–Livné (through CDN and Breuil); Kisin 2010.
- The Yuan–Zhang erratum; BCDT 2001.

## What a follow-up should do

1. **Review:** the independent review (#408) checks the 42 new nodes against the sources above.
2. **Follow-up jobs for each stage's remaining list:**
   - R07.1: BCDT models with descent data, quotients of p-divisible groups, the Faltings complex.
   - R07.2: displays and families.
   - R07.3: coefficients.
   - R07.4: higher weights and descent data.
   - R07.5: general e and p = 2.
   - R07.6: Fargues degree, CM groups, BCGP 2025 §10.3.
3. **Package:** move the PadicHodgeTheory R06.1/R06.2 and RD.1 citations down, replace the Lean placeholders, and keep the CR.7 and A4.5 imports.
