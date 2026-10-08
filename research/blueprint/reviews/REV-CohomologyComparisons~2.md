# REV-CohomologyComparisons~2

Accepted after correction as a complete **target-level planning pass**. All 83 nodes are verified or corrected and justified, and all 16 baseline citations are confirmed. All seven stages remain planned, none closed; the 16 recorded gaps and 48 supplier requests remain implementation obligations. Acceptance does not certify that the current collection of supplier drafts can be promoted together.

Independent reviewer: Codex, session `codex-KJUtkR`, issue #7037, 8 October 2026. This session wrote neither BP-CohomologyComparisons nor BP-CohomologyComparisons~2. The packet now names `independent-review-REV-CohomologyComparisons~2`. Only the four deliverables and this job’s handoff are changed.

## Counts

| Item | Result |
| --- | --- |
| Nodes | 83: 71 verified, 12 corrected; 0 added, removed or unverifiable |
| Definitions / constructions | 2 / 2, with all 24 API items and 13 discriminating tests checked |
| Theorems / applications / comparisons | 55 / 18 / 6 |
| Planets | 32; names and placement retained |
| Baseline declarations | 16 confirmed; none removed or added |
| Public sources | 12; all recorded hashes checked |
| Supplier requests | 48: 6 covered, 41 partly covered, 1 not covered; all precise |
| Imported evidence records | 10; retained with their actual owners |
| Source issues / red-team findings | 7 independently confirmed / 4 checked |
| Stages | 7 planned, 0 closed |
| Gaps | 16 retained, 2 clarified |
| Packet checker | 0 errors, 0 warnings |

## Corrections made

- `CP.2/period-invariants-and-admissibility`: Corrected H⁰ Frobenius: σ on K₀, identity only on the étale Q_p factor.
- `CP.3/infinitesimal-envelope`: Restored finite generation in the completion universal property, matching lift_unique.
- `CP.3/canonical-bdr-cohomology`: Removed unsupported rank-one affinoid H¹ assertion from the Lean test; retained refinement invariance.
- `CP.4/algebraic-beilinson-period-comparison`: Finite-type separated variety hypotheses now explicit and required by Lean, replacing locally finite type.
- `CP.4/algebraic-period-recovery-and-duals`: Finite-type separated variety hypotheses now explicit and required by Lean, replacing locally finite type.
- `CP.4/uniformizer-change-and-monodromy`: Lean exponential now takes a K-linear nilpotent operator; nilpotency is imported from CR.6.
- `CP.4/logarithmic-integral-diagram`: Restored pure-dimensional special fibre in the Lean carrier; the mathematical packet already required it.
- `CP.4/semistable-period-comparison`: Balanced monodromy extension now requires the Leibniz rule, zero on coefficients, and linear HK monodromy.
- `CP.4/proper-rigid-c-period-comparison`: Balanced monodromy extension now requires the Leibniz rule, zero on coefficients, and linear HK monodromy.
- `CP.4/proper-curve-potential-period-interface`: Lean now explicitly assumes a finite Q_p-extension, as the packet and CDN Proposition 3.12 already do; D_pst is scalar-extended before using completed coefficients.
- `CP.5/semistable-normalized-de-rham-torsion-export`: Normalized length codomain changed from ℚ to ℝ to retain the general rank-one valuation convention.
- `CP.6/pan-bounded-torsion-inverse-limit`: Documented the almost-category underlying-module shadow; an exact ordinary integral comparison is not claimed.

The shared helper vocabulary also distinguishes F^{nr} from its completion: HK and D_pst modules are first extended to F̂^{nr}, and tensor associativity gives the B_st shadow after that extension. Original smooth-vector descent remains G-lean-types. Pan’s integral inverse-limit declarations represent almostified modules through the almost category’s right adjoint; they are not ordinary integral comparison isomorphisms. The almost category, topology and enhanced limits remain owner interfaces.

AMMN’s edition is corrected to arXiv v2, 29 September 2021. All twelve inspected public editions now appear in sourceVersions. The reader is synchronized with every changed statement, hypothesis, API, test, gap and validation field. Current supplier reviews replace historical notes which referred to already repaired prerequisites. The previous global-acyclicity claim is replaced by the narrower independently recomputed graph result.

## The preceding review’s requirements

The revision retains all corrected locators and hypotheses from REV-CohomologyComparisons. Its reader now reflects the entire packet. The proposed CP.6 successor lists exactly six members: five Pan adapters and the GR relative filtered agreement, whose actual parent remains CP.6. Seven core CP.6 exports remain distinct from those late consumers. No new atlas id is asserted to exist. The conditional R06.6 return is not a declared link; RT.6’s late character application is kept apart from its early syntomic/TC supplier. The primitive prefix follows local-rational and precedes ordinary CP.3; the proposed log-primitive prefix follows log-sites. Neither proposed prefix is treated as an existing supplier.

The ordinary CP.0 site package uses A1/H1/H0 rather than a late whole-T6 return. The logarithmic analytic projection is supplied to the late Pan adapter by the exact log-site projection node. All 16 baseline entries, including the two added in the previous review, were checked anew. The Habiro/trace export and AMMN triangle now have typed interfaces; no implementation is inferred from them.

## Sources and node checks

Every node’s recorded locator was read in the public edition below, including its hypotheses and the argument used by its proof sketch. The ten imported evidence records were checked as supplier evidence rather than counted as CP-owned nodes. Stronger coherence, agreement, h-descent and product assertions are identified as packet targets with exact owner gaps, not as statements proved by a cited theorem. No source excerpt is added: the packet and reader use mathematical paraphrases and result/section/page locators.

| Source | Edition inspected |
| --- | --- |
| [bms1-2019](https://arxiv.org/pdf/1602.03148v3) | arXiv:1602.03148v3 (2019), printed pagination |
| [ck](https://arxiv.org/pdf/1710.06145v3) | arXiv:1710.06145v3, printed pagination |
| [gr](https://arxiv.org/pdf/2203.09490v3) | arXiv:2203.09490v3 (2023); source of published 2024 paper |
| [guo](https://arxiv.org/pdf/2112.14304v1) | arXiv:2112.14304v1 (2021) |
| [cn](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf) | Author manuscript CN5, 24 November 2024, published 2025 |
| [bs](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf) | Author manuscript 29 April 2022, source of 2025 paper |
| [pan](https://arxiv.org/pdf/2209.06366v1) | arXiv:2209.06366v1 (2022), source of published 2026 paper |
| [cdn](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) | Author manuscript GPW5, source of 2020 paper |
| [bs22](https://arxiv.org/pdf/1905.08229v4) | arXiv:1905.08229v4, 12 January 2022, printed pagination |
| [sch13](https://arxiv.org/pdf/1205.3463v2) | Public arXiv:1205.3463 PDF, read together with official erratum |
| [sch13-erratum](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf) | Official author PDF, 3 pages |
| [ammn](https://arxiv.org/pdf/2003.12541v2) | arXiv:2003.12541v2 (29 September 2021), printed preprint pagination |

The especially sensitive checks retain: BMS1 13.7’s enlargement of Σ; completion along the entire embedding ideal; the continuous K-lift’s perfect residue field; the adjacent-degree hypotheses in torsion-free lattice recovery; CK’s varying nonzero nonunit chart parameter and pure-dimensional special fibre; CN’s h-derived arbitrary-variety realization and filtered cohomology-image filtration; GR’s base-compatible relative thickenings and p-completely flat perfect prism; BS22’s Frobenius pullback and uniqueness of pairs with the Hodge–Tate structure map; Pan’s k>i and positive analytic character parameter. AMMN 7.13 uses τ≤i before RΓ, a derived Frobenius fibre before rationalization, and the tensor-convolution Hodge filtration; Remark 7.9 only compares maps over C_p. Its classical-map transport remains G-ammn-transport.

| Node | Verdict | Checked source locator(s) |
| --- | --- | --- |
| `CP.0/ainf-specialization-dictionary` | verified | bms1-2019: Example 3.16, p.25; Definition 3.22, p.27; §4.3, p.40 |
| `CP.0/formal-algebraic-analytic-dictionary` | verified | bms1-2019: Theorem 1.1 and Remarks 1.2–1.3, pp.2–4; §13.4, p.116 |
| `CP.0/site-and-geometric-point-compatibility` | verified | sch13-erratum: Erratum (1)–(3), pp.1–2 |
| `CP.0/twist-frobenius-filtration-normalization` | verified | bms1-2019: Example 4.24, p.41; §4.4, pp.43–44; introduction p.4 |
| `CP.0/no-c-section-and-choice-transport` | verified | bms1-2019: Lemmas 13.11–13.13, pp.109–112; Remark 13.20, p.114; Remark 13.22, p.116 |
| `CP.1/proper-ainf-input-package` | verified | bms1-2019: Theorems 14.1 and 14.3, pp.118–120 |
| `CP.1/theta-de-rham-specialization` | verified | bms1-2019: Theorem 14.1(ii), p.118; Theorem 14.3(ii), p.120 |
| `CP.1/hodge-tate-specialization` | verified | bms1-2019: Theorem 8.3, p.61; Theorem 9.2(i), p.69; Proposition 6.12, p.52; Theorem 14.1 proof, p.118 |
| `CP.1/witt-crystalline-specialization` | verified | bms1-2019: Theorem 14.1(i), p.118; Theorem 14.3(i), p.120 |
| `CP.1/acris-specialization` | verified | bms1-2019: Theorem 12.1, p.96; Theorem 14.3(iii), p.120 |
| `CP.1/mu-inverted-etale-specialization` | verified | bms1-2019: Theorem 14.3(iv), p.120; Lemma 4.26, p.41 |
| `CP.1/prismatic-frobenius-pullback-comparison` | verified | bs22: Theorem 17.2, p.117 (proof pp.117–121); Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.122–123 |
| `CP.1/crystalline-de-rham-overlap-square` | verified | bms1-2019: Theorem 14.1 proof, pp.118–119; §12.2 |
| `CP.1/multiplicative-bockstein-coherence` | verified | bms1-2019: Theorem 14.1 opening and proof, pp.118–119 |
| `CP.1/singular-and-completed-boundary` | verified | bms1-2019: Lemma 4.16, p.38; Theorems 14.1–14.3 |
| `CP.2/rational-crystalline-comparison-over-C` | verified | bms1-2019: Theorem 14.5(i), pp.120–121 |
| `CP.2/crystalline-comparison-over-discretely-valued-base` | verified | bms1-2019: Theorem 14.6(i), pp.121–122 |
| `CP.2/residue-section-descent-adapter` | verified | bms1-2019: Proposition 13.21 and Remark 13.22, p.116; Theorem 14.6 proof, p.122 |
| `CP.2/rational-degreewise-comparison` | verified | bms1-2019: Theorems 14.3–14.5, pp.119–121; §1.2, p.6 |
| `CP.2/period-invariants-and-admissibility` | corrected | bms1-2019: Theorem 14.6(i), p.121 |
| `CP.2/crystalline-geometric-examples` | verified | bms1-2019: Theorem 14.6, p.121 |
| `CP.3/very-small-affinoid-embedding` | verified | bms1-2019: Definition 13.5 and Construction 13.6, p.106 |
| `CP.3/infinitesimal-envelope` | corrected | bms1-2019: Construction 13.6, p.106; Lemma 13.4, pp.105–106 |
| `CP.3/noetherian-approximation-interface` | verified | bms1-2019: Lemmas 13.7–13.10, pp.106–109 |
| `CP.3/completed-smooth-lift` | verified | bms1-2019: Lemma 13.11, pp.109–110 |
| `CP.3/envelope-normal-form` | verified | bms1-2019: Lemma 13.12, pp.110–111 |
| `CP.3/embedding-independence-and-reduction` | verified | bms1-2019: Lemma 13.13 and Definition 13.14, pp.111–112 |
| `CP.3/proper-formal-spreading` | verified | bms1-2019: Proposition 13.15 and Corollary 13.16, pp.112–113 |
| `CP.3/canonical-bdr-cohomology` | corrected | bms1-2019: Definition 13.18, p.114 |
| `CP.3/bdr-cohomology-finite-freeness` | verified | bms1-2019: Theorem 13.19, p.114 |
| `CP.3/local-bdr-etale-map` | verified | bms1-2019: Theorem 13.1 proof, p.115; Proposition 12.9 |
| `CP.3/canonical-bdr-etale-comparison` | verified | bms1-2019: Theorem 13.1 and proof, pp.104,115 |
| `CP.3/descended-de-rham-lattice` | verified | bms1-2019: Remark 13.20, p.114; Theorem 13.1 proof diagram, p.115 |
| `CP.3/filtered-de-rham-comparison` | verified | sch13: Theorem 8.4, p.48, and its proof, pp.47–48; BMS1 Theorem 5.1 and Theorem 13.1 proof |
| `CP.3/hodge-de-rham-degeneration` | verified | bms1-2019: Theorem 13.3(i) and proof, pp.104,116 |
| `CP.3/hodge-tate-degeneration` | verified | bms1-2019: Theorem 13.3(ii) and proof, pp.105,116 |
| `CP.3/good-reduction-bdr-lattice-identification` | verified | bms1-2019: Proposition 13.23, p.117 |
| `CP.3/integral-rational-bdr-map-agreement` | verified | bms1-2019: Theorem 14.5(i) proof, p.121; Theorem 13.1 proof, p.115 |
| `CP.3/relative-infinitesimal-site` | verified | gr: Definition 10.1, p.94 |
| `CP.3/relative-cech-de-rham-comparison` | verified | gr: Construction 10.6 and Theorem 10.7, pp.95–96; Corollary 10.8, p.97 |
| `CP.3/relative-infinitesimal-perfectness` | verified | gr: Corollaries 10.8–10.9, p.97 |
| `CP.3/crystalline-to-infinitesimal-coefficients` | verified | gr: Proposition 10.10 and proof, pp.97–98 |
| `CP.3/relative-crystalline-infinitesimal-base-change` | verified | gr: Proposition 10.11, pp.98–99, equation (36) |
| `CP.3/relative-filtered-prismatic-agreement` | verified | gr: Theorem 10.13 and Remark 10.14, pp.99–100 |
| `CP.3/absolute-relative-infinitesimal-agreement` | verified | guo: Theorem 1.2.7 and Corollary 1.2.11, pp.5–6; guo: Definition 2.2.1, Remarks 2.2.2–2.2.4, pp.12–13; Lemma 4.1.10, p.31 |
| `CP.4/logarithmic-integral-diagram` | corrected | ck: §7.1–7.2, pp.68–69; Corollary 5.43, pp.58–59; Theorem 2.3, p.9 |
| `CP.4/hyodo-kato-log-base-adapter` | verified | ck: Proposition 9.2 and Remark 9.3, pp.75–76 |
| `CP.4/semistable-period-comparison` | corrected | ck: Theorem 9.5, p.76 |
| `CP.4/semistable-filtered-bdr-agreement` | verified | ck: Remark 9.6, p.77; Proposition 6.8, pp.66–68 |
| `CP.4/uniformizer-change-and-monodromy` | corrected | ck: §9.1, p.75 |
| `CP.4/log-prismatic-agreement` | verified | ck: §9 introduction and Theorem 9.5, pp.75–76 |
| `CP.4/semistable-geometric-examples` | verified | ck: §9 introduction, p.75; Theorem 9.5, p.76; §9.1, p.75 |
| `CP.4/algebraic-beilinson-period-comparison` | corrected | cn: Theorem 6.2 and footnote 17, p.40 |
| `CP.4/algebraic-period-recovery-and-duals` | corrected | cn: Theorem 6.2, equation (6.3), p.40; Remark 6.7, p.41 |
| `CP.4/proper-rigid-potential-semistable-comparison` | verified | cn: Theorem 6.4 and proof, pp.40–41 |
| `CP.4/proper-rigid-c-period-comparison` | corrected | cn: Theorem 6.8 and Remark 6.10, p.42 |
| `CP.5/crystalline-de-rham-torsionfreeness-equivalence` | verified | bms1-2019: Remarks 14.4 and 14.7, pp.120,122; supplier Lemma 4.18 |
| `CP.5/integral-torsion-length-inequality-over-C` | verified | bms1-2019: Theorem 14.5(ii), pp.120–121 |
| `CP.5/lattice-recovery-over-C` | verified | bms1-2019: Theorem 14.5(iii), pp.120–121 |
| `CP.5/dvr-lattice-recovery-via-breuil-kisin` | verified | bms1-2019: Theorem 14.6(iii) and proof, pp.121–122 |
| `CP.5/dvr-torsion-length-inequality` | verified | bms1-2019: Theorem 14.6(ii), pp.121–122 |
| `CP.5/mod-p-de-rham-dimension-bound` | verified | bms1-2019: Theorem 1.1 and inequality (1), pp.2–3 |
| `CP.5/semistable-crystalline-torsion-export` | verified | ck: Theorem 7.9 and proof, p.70 |
| `CP.5/semistable-normalized-de-rham-torsion-export` | corrected | ck: §7.10, Lemma 7.11 and Theorem 7.12, p.71 |
| `CP.5/functorial-log-de-rham-lattice-export` | verified | ck: §8.5–8.6, p.73; Theorem 8.7 and Remark 8.8, p.74 |
| `CP.5/small-weight-integral-interface` | verified | bms1-2019: §4.4, pp.43–44; Theorem 14.6(iii), pp.121–122 |
| `CP.5/enriques-torsion-counterexample` | verified | bms1-2019: Theorem 2.1 and Proposition 2.2 with proofs, pp.13–15 |
| `CP.5/degenerating-group-torsion-counterexample` | verified | bms1-2019: Lemmas 2.5,2.7,2.9 and Theorem 2.10 proof, pp.15–17 |
| `CP.5/special-fibre-does-not-determine-integral-etale` | verified | bms1-2019: Remark 2.4, p.15 |
| `CP.4/proper-curve-potential-period-interface` | corrected | cdn: §3.3, Proposition 3.12 and first proof paragraph, p.36 |
| `CP.6/naturality-base-change-and-cup-products` | verified | bs: Proposition 3.19, p.27 |
| `CP.6/trace-normalized-tate-period` | verified | bs: Proposition 3.20(5) and proof; Remark 3.21, pp.27–28 |
| `CP.6/duality-and-cycle-class-compatibility` | verified | bs: Proposition 3.20(6)–(7) and proof, pp.27–28 |
| `CP.6/first-chern-class-comparison` | verified | bs: Proposition 3.20(8), final proof paragraph, p.28 |
| `CP.6/higher-chern-and-projective-bundle-comparison` | verified | bs: Proposition 3.20(8) and proof, p.28 |
| `CP.6/geometric-arithmetic-export` | verified | cn: Theorems 6.4, 6.8 and proof, pp.40–42 |
| `CP.6/habiro-and-trace-specialization-export` | verified | bms1-2019: Theorem 14.1, p.118; specialization picture §1.2, p.6 |
| `CP.6/pan-graded-analytic-decompletion` | verified | pan: Proposition 6.3.9 and preceding paragraphs (§6.3.8), pp.100–101 |
| `CP.6/pan-bounded-torsion-inverse-limit` | corrected | pan: Lemma 7.2.5 and proof, p.119 |
| `CP.6/pan-completed-coefficient-and-flag-descent` | verified | pan: Lemma 7.2.6 and proof, p.120 |
| `CP.6/pan-etale-site-truncated-comparison-map` | verified | pan: Lemma 7.2.4 and proof, pp.118–120 |
| `CP.6/pan-truncated-period-isomorphism` | verified | pan: Proposition 7.2.3 and proof, p.118 |
| `CP.2/nearby-cycle-crystalline-de-rham-pullback` | verified | ammn: Definition 7.10 and Theorem 7.11, p.52; Construction 7.12, Theorem 7.13 and proof, pp.53–54; Theorem 6.17, pp.44–45 |

The packet’s 83-entry review.checked list records the individual statement/prerequisite/acceptance check and the corrections. No node needs lemma-level subdivision at this target-level budget. Every planned target has a node in targetCoverage; actual parentStageId determines its order, while realises records target coverage only. The four object APIs cover access, compatibility and functoriality without unfolding. The tests distinguish θ from Witt reduction, a completed coordinate from its level-one quotient, the point/P¹ cohomology from a wrong construction, and relative base-compatible thickenings from an absolute-site carrier.

## Pinned baseline and library audit

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All statements were inspected at those exact commits, not inferred from name searches. The shared Mathlib checkout is at the exact pin. The reviewed AUDIT-35 marks the CP stages not built; its pending aggregate intake does not turn those targets into library declarations. The two upstream roadmap readers, HodgeStructures and AdicSpaces, were checked for ownership and existing infrastructure. No upstream roadmap is replanned.

| Baseline declaration | Pin location and provision checked |
| --- | --- |
| `WittVector` | Defs.lean:52; coefficient-sequence carrier |
| `WittVector.fontaineTheta` | FontaineTheta.lean:165; p-prime, p-complete Fontaine ring map |
| `BDeRhamPlus` | BDeRham.lean:77; kernel-adic completion after p-inversion, no field/DVR theorem |
| `BDeRham` | BDeRham.lean:90; localization at the submonoid generated by principal kernel generators |
| `PadicInt` | PadicIntegers.lean:62; norm-at-most-one subtype |
| `Module.length` | Length.lean:32; extended-natural module length |
| `Module.finrank` | Finrank.lean:62; cardinal rank converted to a natural, with finiteness needed for dimension use |
| `DerivedCategory` | DerivedCategory/Basic.lean:87; ordinary derived category of an abelian category |
| `TensorProduct` | TensorProduct/Defs.lean:71; balanced module tensor product |
| `IsAdicComplete` | AdicCompletion/Basic.lean:55; Hausdorff and precomplete |
| `AdicCompletion` | AdicCompletion/Basic.lean:171; compatible finite-quotient system |
| `AdicCompletion.isAdicComplete` | Completeness.lean:184; finite generation required |
| `AdicCompletion.eval_of` | Basic.lean:387; projection of the canonical completed element |
| `AdicCompletion.ext` | Basic.lean:314; equality detected by finite projections |
| `WittVector.frobeniusEquiv` | Frobenius.lean:286; perfect characteristic-p ring and prime p |
| `cyclotomicCharacter` | CyclotomicCharacter.lean:307; automorphisms to p-adic units, with roots needed for the intended nontrivial character |

No baseline citation was removed or replaced. These declarations supply carriers and ordinary algebra only. Derived/completed/filtered enhancement, Fontaine field properties and the geometric realizations remain supplier outputs. Finite generation is now explicit in the envelope lifting API and agrees with the suggested lift_unique statement.

## Supplier and graph checks

All exact external prerequisite declarations and all 48 broader supplier statements were read. A request is not marked covered merely because its stage exists. The scope classifications below retain the supplier’s actual range and distinguish required extensions; none claims a supplier proof is implemented.

| Supplier | Scope | Boundary checked |
| --- | --- | --- |
| `AInfCohomology:AI.0:integral` | partly | Integral coefficient maps and twist normalization belong here. Witt coherence is the §3 owner evidence; W(C♭) flatness additionally uses AI.2, and rational composites use the separate period prefix. |
| `AInfCohomology:AI.0:period-comparison` | partly | The coefficient-to-period composites use this prefix and R06.1. The μ-inverted geometric étale map comes from AI.4/AI.5, not the coefficient-ring identification alone; completed topologies stay explicit. |
| `AInfCohomology:AI.1` | partly | Bockstein reduction and generic Koszul/Lη operations are supplied. All-coordinate logarithmic normalization uses AI.4; coherent multiplicative enhancement is still requested from the enhanced owners. |
| `AInfCohomology:AI.2` | partly | Finite-free Fargues pairs and full faithfulness are in scope. The torsion decomposition remains AI.2 evidence; it is not assigned to CP or inferred for arbitrary torsion BKF modules. |
| `AInfCohomology:AI.3` | partly | The smooth formal pro-étale sheaves are supplied. The modular-curve infinite-level and finite-Witt analytic/étale almost adapters are extensions, retained in G-pan. |
| `AInfCohomology:AI.4` | covered | Sheaf-level comparison maps and explicit-coordinate complexes are in scope. Additional Frobenius/product agreement is a target with its enhancement gap, not quoted from Theorem 14.1. |
| `AInfCohomology:AI.5` | partly | Properness and the transferred generic §4.2 linear algebra are in scope; §3 coherence and AI.2 decompositions remain imports. Inline length monotonicity, normalized semistable valuation lengths and removing the draft CP.1 back edge remain owner work. |
| `AdicEtaleGeometry:A1` | partly | Corrected ordinary/pro-étale sites and geometric points are supplied; existence of the site alone does not prove a cohomological acyclicity theorem. |
| `AdicSpacesPartII:R0` | partly | Completed analytic products and presentations are supplied. BMS1 Lemma 13.4 for ξ-complete Tate algebras, noetherianity and ideal-closedness require the precise B_dR extension recorded in G-spreading-inputs. |
| `AdicSpacesPartII:R3` | partly | Proper coherent finiteness is supplied. Continuous GAGA, finite-projective base change and derived Nakayama in the B_dR setting remain precise extensions; they do not imply cohomology freeness alone. |
| `AlgebraicModuliForArithmeticGeometry:R09.3` | partly | Quotient/descent infrastructure is in scope. The projective BG approximation, particular supersingular torsor and singular Enriques lift still need their source-specific existence proofs. |
| `AlgebraicModuliForArithmeticGeometry:R09.6` | partly | Formal algebraization is in scope. The complete filtered noetherian-system spreading used in BMS1 13.15–13.16 is stronger and remains G-spreading-inputs. |
| `AlgebraicModuliForArithmeticGeometry:R09.7` | partly | Characteristic-zero resolution is supplied. Smooth h-hypercovers, domination in the needed cycle range and proof of h-descent for HK/de Rham require the separately requested realization adapters. |
| `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison` | partly | The formal specialization morphism is supplied in its stated type-(S) and torsion ranges. Algebraic/analytic proper comparison is H5; the ordinary site prefix must avoid the whole CR.5 late dependency closure. |
| `ClassicalAdicEtaleCohomology:H5` | partly | Proper analytic/étale finiteness and cohomology comparison are supplied. Pan almost analytic/étale O⁺/p and truncated-Witt comparisons are additional exact requests, not global site identifications. |
| `CompletedCohomologyPartII:CC.2` | partly | Derived limits and ML/lim¹ infrastructure are supplied. Pan’s multiplication-p adjacent torsion transition and completeness/vanishing argument remain a modular-tower extension. |
| `CompletedCohomologyPartII:CC.4` | partly | Finite chain models are supplied in the stated finite-cell range. Pan’s p-complete torsion-free complex with both integral and mod-p^m cohomology, and coefficient interchange, are still requested explicitly. |
| `CompletedCohomologyPartII:CC.8` | partly | Generic tower adapters are in scope. Pan 4.4.3 and flag-preimage comparisons need the S3 input and the named early modular-curve extension; CC.8’s title alone is insufficient. |
| `CrystallineCohomology:CR.0` | partly | The common θ PD envelope and its completion are supplied by CR.0; R06.1 identifies its Fontaine presentation and rational maps. CP imports these constructions. |
| `CrystallineCohomology:CR.1` | partly | Crystalline sites and finite locally free crystals are supplied in their source conventions. Transfer to the analytic infinitesimal site additionally needs continuous evaluation on the specified thickenings. |
| `CrystallineCohomology:CR.2` | partly | PD Čech–Alexander/de Rham computation and embedding independence are supplied. Analytic infinitesimal coefficient evaluation and completed base change keep their explicit topological hypotheses. |
| `CrystallineCohomology:CR.3` | partly | Proper crystalline finiteness/base change is supplied. BMS1 13.21 in smooth qcqs range, residue-section descent, the exact weak-Lefschetz range and counterexample crystalline calculations are extensions, not implied by proper finiteness. |
| `CrystallineCohomology:CR.3:Frobenius-isogeny` | partly | Frobenius-isogeny is the early crystalline supplier. The smooth affine and qcqs range needed by 13.21 must be proved here rather than using CP.2 as its own input. |
| `CrystallineCohomology:CR.3:duality` | partly | Trace/duality has its separate successor. Its source gate and Gysin normalization remain owner obligations; no finite-dimensional vector-space duality substitutes for the geometric trace. |
| `CrystallineCohomology:CR.4` | covered | The actual de Rham–Witt crystalline comparison and degree-scaled Frobenius are supplied; the Witt specialization is not merely an isomorphism of graded form modules. |
| `CrystallineCohomology:CR.6` | partly | Proper semistable HK and nilpotent monodromy are in scope. Algebraic h-derived and overconvergent rigid HK, F^{nr} smooth-vector descent, and the signed convention translation are explicit extensions. |
| `EnhancedDerivedSheaves:E4` | partly | DD.1 completion reexports and sheaf/enhanced operations are supplied with finite-generation/regular-sequence hypotheses. Stronger symmetric monoidal coherent comparison data are requested explicitly. |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings` | covered | Proper smooth étale Poincaré pairings in the prime-to-characteristic range are supplied; finite/derived integral duals are distinguished from rational perfect pairings. |
| `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity` | partly | The smooth trace and purity prefix supplies degree and P¹ normalization. Adic/rational passage uses its finite-type finiteness inputs. |
| `EtaleDualityAndPerverseSheaves:EDC.3` | partly | Kummer c₁, cycle classes, smooth-pair Gysin and self-intersection are supplied. The proper P(O⊕L) repair of Betts–Stix uses these exact interfaces, with de Rham counterparts requested separately. |
| `EtaleDualityAndPerverseSheaves:EDC.4` | partly | Projective-bundle decomposition and injective pullback are supplied in their qcqs finite-coefficient/finite-type adic ranges. The full flag and matched de Rham/prismatic Chern diagrams are still explicit extensions. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` | partly | Finite-flat closure and quotient constructions are in scope. The specified degenerating groups and supersingular p²-point closure need actual source-specific existence, including the dyadic restrictions. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` | covered | FL exactness and full faithfulness use e=1 and the safe shifted [0,p−2] interval; restricted [0,p−1] endpoints and p=2 are explicit. No all-weight result is inferred. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4` | partly | All-weight Kisin classification and BMS1 4.34 are outside the present finite-flat/p-divisible stage statement. Keep G-kisin and the exact Frobenius-twisted S-specializations; rational admissibility is insufficient. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison` | partly | Log structural periods and Poincaré theory are the late supplier for Pan’s graded analytic adapter. Ordinary truncated B_dR coefficients in §7.2 use the separate local-rational prefix. |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites` | covered | The exact log-site projection node supplies analytic log projections. Its use stays in the late Pan adapter; an early prefix is proposed, and no whole T6:log-sites return to CP.0 is declared. |
| `PadicHodgeTheory:P8:local-rational` | partly | The local-rational period sheaves, corrected integral completion order, rational acyclicity and filtered Poincaré lemma are supplied. Primitive finiteness and the proper-global comparison are separate; Pan’s flag pushforward is still an adapter. |
| `PadicHodgeTheory:R06.1` | partly | B_st torsor, field/DVR/flatness and period embeddings are owned here. The balanced monodromy adapter now explicitly requires Leibniz and zero on coefficient images; pinned BDeRham supplies no field theorem. |
| `PadicHodgeTheory:R06.2` | partly | Rational invariant/admissibility statements are supplied in their finite-K range. Arbitrary perfect residue fields, D_pst/smooth-vector descent and geometric Tate-curve identification require the scoped extensions recorded in G-analytic-cst. |
| `PadicHodgeTheory:R06.4` | partly | FL sign/covariance translation is supplied. Kisin S-specialization and BK twists use R07.4/AI.2 rather than R06.4 as an early CP.0 prerequisite; CP.0 has no such late edge. |
| `PerfectoidSpaces:P3` | partly | Generic étale almost acyclicity is supplied. Finite-Witt induction, transition to the perfectoid limit and the modular π_HT preimages use AI.3, P7 and S3 respectively; these are late CP.6 inputs. |
| `PrismaticCohomology:PR.4` | partly | The syntomic fibre is supplied. AMMN 7.11 truncation before RΓ, Lemma 6.19 reduction invariance, Frobenius eigenspace realization and the full Chern/flag diagram are additional exact outputs, retained as gaps. |
| `PrismaticCohomology:PR.5` | covered | The relative-site comparison has its bounded-prism and Tor-amplitude restrictions; no unconditional comparison for every singular animated scheme is inferred. |
| `PrismaticCohomology:PR.6` | partly | BS22 17.2’s Frobenius pullback and §18 uniqueness with the HT structure map are supplied. Agreement of all crystalline/étale realizations and singular extensions are separately requested, not automatic consequences of uniqueness. |
| `PrismaticCohomology:PR.7` | not covered | The GR relative crystalline-local-system/analytic-F-crystal equivalence and 9.15 proper pushforward are absent from present PR.7, which classifies over Spf O_K. The B_dR agreement consumer has actual parent CP.6 and remains an extension target. |
| `ClassicalAdicEtaleCohomology:H0` | partly | Derived site functoriality is supplied; the smooth model, geometric point and coefficient realization are separate required inputs. |
| `EnhancedDerivedSheaves:E2` | partly | Bounded-below hypercover descent is supplied with a uniform lower bound. It neither constructs smooth h-hypercovers nor proves HK/de Rham to be h-sheaves. |
| `DerivedDeRhamCohomology:DD.2` | partly | Derived filtered de Rham and Hodge completion are supplied. AMMN’s smooth-proper filtered Künneth and rational coefficient identification with B_dR⁺ are exact additional requests; p-completion, Hodge completion and rationalization remain distinct. |

The exact graph check collected atlas requires, the integrated/current blueprint declarations and current drafts, with draft declarations replacing older declarations of the same id, then followed prerequisites from all 83 CP nodes. No strongly connected component is cyclic among the 4,754 reachable references. The stage stress check starts with all 1,968 atlas stages and 3,508 edges, adds accepted data/restructure links, and maps declaration prerequisites to their actual parent stages. It finds cycles through CP.0–CP.4. Stage aggregation and unrelated unaccepted drafts produce a larger closure; the test is not a simulation asserting that every draft is eligible for promotion.

The relevant explicit obstructions are the unaccepted AI.0 draft’s CP.1 prerequisite for AI.5/proper-perfectness, and the CR.5:log-algebra import of LPV.5 carried into the ordinary H1 formal-site dependency. The former must instead use upstream crystalline Frobenius-isogeny, and the latter needs independent ordinary-site/elementary-log prefixes. The review removes an unreproduced historical outgoing-cycle count. It retains G-supplier-stage-order and makes no global acyclicity or promotion-readiness claim. Proposed cuts and conditional returns are not graph edges.

## Source issues and confirmed red-team findings

Each source issue was independently checked at its locator and now names REV-CohomologyComparisons~2 as its confirmer. These concern the listed public versions; there is no claim to have checked an inaccessible published proof.

| Issue | Independent reason |
| --- | --- | --- |
| E1 | Scholze official erratum (1)–(2), pp.1–2 replaces the invalid general profinite splitting argument by finite-surjection transfinite covers and deletes the old point claims. |
| E2 | Erratum (3), pp.1–2 requires integral p-completion before p-inversion and kernel completion of the structural period construction. |
| E3 | Betts–Stix 3.20(8), p.28 uses a nonproper line-bundle total space with a preceding proper-only cycle comparison. The zero section in smooth proper P(O⊕L), with normal bundle L, supplies the self-intersection repair. |
| E4 | CK 9.2 proof, p.76 names the wrong special-fibre model in the left-hand monodromy complex; that side is the chosen descent Y, before the later O_K model is introduced. |
| E5 | Pan 6.3.9, p.101 needs k>i: at i≥k the truncated source graded piece is zero. The following paragraph states the stable range. |
| E6 | CN 6.4 display (6.5), p.40 needs the K-de Rham structure’s dual, not the C-valued de Rham space, for its filtered K-module assertion. |
| E7 | BMS1 §4.4, p.43 has an endomorphism of W(k)[[u]]; u↦u^p cannot be surjective. The uses require no automorphism of this power-series ring. |

- RT-AREA-padic-1/24: absolute and DLLZ log primitive finiteness have named early owners and the exact consumers; the proposed primitive stages remain absent, so G-primitive stays open.
- RT-AREA-padic-2/3: corrected covers and the finite-F_p, absolute/relative and A_inf almost comparisons remain precise supplier inputs; no rational acyclicity theorem is substituted for primitive comparison.
- RT-AREA-padic-2/4: all-weight integral Kisin lattices, Kummer restriction, twisted S-specializations and BMS1 4.34 remain an R07.4 extension. Rational admissibility and finite-flat height-one theory cannot close it.
- RT-AREA-padic-2/23: PR.8→CP.4, R07.3/R06.4→CP.5 and PR.4/EDC→CP.6 are scoped direct inputs. CP.0 has no late FL input. The CP.6 core return to R06.6 remains conditional on the six-node structural split, and the RT character suffix is kept separate.

## Validation and questions for the orchestrator

Packet validation passes with zero errors and zero warnings. `lean-check` exits 0 at the exact Mathlib pin with 423 warnings, all admitted proofs, and no errors. The final allowed-path and reader-field checks pass. The finite-type variety signature uses the pinned classes LocallyOfFiniteType and QuasiCompact, with IsSeparated. The suggested file is a signature prototype with admitted proofs; compiling it is not formalization of a comparison theorem.

Before promotion, the orchestrator should route the external AI.5/CP.1 and CR.5/LPV.5 stage repairs to their owners, arrange review of the precisely listed CP.6 successor and primitive/log-site prefixes, and keep the core R06.6 and RT character returns conditional until the global graph is checked. None requires changing this target-level mathematical plan or duplicating owner constructions. PR.7’s GR extension, the all-weight Kisin/4.34 input, AMMN classical-map transport, primitive almost comparison, and the source-qualified spreading/counterexample/trace inputs remain the precise follow-up work already listed in the gaps.
