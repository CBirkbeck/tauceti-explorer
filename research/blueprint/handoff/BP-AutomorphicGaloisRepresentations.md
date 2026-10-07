# Handoff: BP-AutomorphicGaloisRepresentations — complete target-level pass

Agent: Codex, session `codex-aAjv2v`. Refs #685. This completes the one claimed planning job; it is not a seventh checkpoint. The earlier checkpoints' 40 node identifiers and the integrated decomposition's retained nodes are preserved.

The packet has `status: complete`, `planningLevel: target` and no part suffix. R19.1, R19.2, R19.3, R19.4, R19.5 and R19.6 each have coverage **planned**. None is mathematically closed: the nine exact gaps and 41 grouped supplier requests remain visible. All implementation statuses remain `unchecked`.

Inventory: **61 nodes** (13 constructions, 2 definitions, 43 theorems, 3 lemmas), **85 API items**, **61 definition/construction unit tests**, **25 planets**, and **13 checked baseline declarations**. Each layer has at most six planets. The packet, reader and suggested-file inventory agree.

## What this pass adds and corrects

- R19.1 now plans Scholl's actual finite-group character projector, the rational newform factor and coefficient-field descent. Individual eigenform Chow projectors are not asserted without the relevant motivic hypotheses. The existing parabolic and S-integral premotivic constructions, classical representations and complete Deligne–Serre chain remain.
- R19.2 distinguishes Carayol's geometric subset from Taylor's all-cohomological-Hilbert construction, including even-degree fields without a finite discrete-series place. Uniqueness, determinant, total oddness and irreducibility have a separate contract. The routed CM definition, virtual reducibility criterion, ordinary CM splitting and complex-conjugation line statements are included.
- R19.3 constructs the actual fixed-eigenform family in the early generic carrier supplied by R24.5:operations. It imports purity from R34.6. Dimitrov and Ribet–Momose large-image results and Skinner's density-one/eventual residual properties are planned as properties of this family, with their source hypotheses retained.
- R19.4 retains full Frobenius-semisimplified Weil–Deligne parameters and monodromy, supplies the all-Hilbert extension, and states the local-factor/conductor and normalisation obligations. Cyclic and non-normal cubic base change are both requested.
- R19.5 applies generic comparisons to the actual modular/Hilbert representations: Saito, the full published Kisin theorem, Skinner's unrestricted theorem, ordinary lattice intersections, nonordinary crystalline/Wach data, and endpoint-weight contracts. CDN Proposition 5.2 is the concrete Hyodo–Kato/de Rham multiplicity application, with its globalisation, uniformizer, level, coefficient and archimedean hypotheses.
- R19.6 starts with a geometric rank-two generic Hecke module and constructs its integral law before importing reconstruction. Finite residue fields, continuity, finite quotients, mixed coefficients at characteristic two, nilpotents and local deformation conditions are explicit. Field-valued eigenform points alone do not determine a law over a nonreduced algebra.

The reader gives an architecture and notation discussion, followed by exact declaration contracts, hypotheses, proof outlines, APIs, tests, dependencies and public source anchors. The suggested file uses actual Mathlib representations, linear maps, submodules and matrices. It removes the earlier Boolean Euler-factor and dimension-only Tate-module substitutes. Geometric signatures that cannot be stated at the pinned baseline are honestly omitted, with their names, mathematical contracts and missing imported carriers recorded in the file, as PROTOCOL §13 requires; they are not encoded as fields containing the desired theorem.

## Validation and pinned baseline

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentations.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentations.lean`: **exit 0**, at pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its only warnings are **12 declarations using `sorry`**. Subsequent source-audit changes affect comments and inventories only.
- `git diff --check`, authorized-path checks, preserved-node checks and complete API/test-name checks passed before submission.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` declarations were read from the pinned source objects. The suggested file imports Mathlib only, so it makes no claim to have compiled Tau Ceti at that pin.

The 13 baseline references are `ModularForm`, `CuspForm`, `Matrix.card_GL_field`, `Subgroup.exists_right_complement'_of_coprime`, `nonempty_sections_of_finite_inverse_system`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `riemannZeta_residue_one`, `NumberField.Embeddings.finite_of_norm_le`, `TauCeti.LSeries.landau`, `Representation`, `Submodule.restrictScalars`, `DualNumber.eps` and `Matrix.det_fin_two`. Each actual declaration was read at the recorded pin; the packet records its module and the supplied statement.

The new Lean checks include the finite-group projector and its real linear image, a saturated intersection of a fixed lattice with a vector-space line, the division-free mixed coefficient of a two-by-two determinant, and two matrices over `DualNumber ℚ` whose determinants differ although their reduced specialisations agree. The existing finite-group, polynomial, congruence, density-bound and weight-one arithmetic checks remain. No language server, library build, cache download or private repository copy was used.

## Accepted ownership boundaries and all ten findings

RS-12 is **accepted and binding**. The previous checkpoint's `needs_changes` note is superseded. Supplier packets and upstream roadmaps were not edited.

| Finding | Resolution in this packet and reader |
| --- | --- |
| RT-AREA-langlands-1/25 | IHG.4 owns generic interpolation/descent of determinant laws; IHG.1 owns reconstruction. R19.6 owns the geometric Hecke-law instance and its hypotheses. |
| RT-AREA-langlands-2/2 | Retain the discrete-series-place hypothesis in the stable Carayol node. Add `R19.2/all-cohomological-hilbert-representation`, all-Hilbert away-prime compatibility, and separate Kisin/Skinner coefficient-prime theorems. The even-degree/no-discrete-series case is an acceptance test. |
| RT-AREA-langlands-2/4 | R17.4 requests name cyclic **and non-normal cubic** base change with the restriction/local-parameter compatibility used in Carayol §12.2.2. Cyclic transfer does not supply the cubic step. |
| RT-AREA-langlands-2/5 | Bourbaki 355 Proposition 3.15 is corrected: ordinary characteristic-p fibres have **two** order-p subgroup schemes; supersingular fibres have **one**. E1 and the non-example test retain this correction. |
| RT-AREA-langlands-2/6 | Apply Chenevier Theorem 2.22(i) for a residually split absolutely irreducible determinant over a henselian local ring. A finite residue field is allowed. Remove the false algebraically-closed-residue gap and the Deligne–Serre bridge. |
| RT-AREA-langlands-2/8 | Deligne–Serre has the single owner R19.1. The accepted rescope and reader explicitly make ML.1 and ClassicalSerreModularity R27.6 consumers of its Artin representation; their documents were outside this job's authorized paths. |
| RT-AREA-langlands-2/9 | Use exact `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura` and a precisely stated R14.6 request. R19.1 owns the higher-coefficient/eigenform application, rather than rebuilding weight-two special-fibre geometry. |
| RT-AREA-langlands-2/10 | Use early `R24.5:operations` for the carrier and R34.6 for purity; R19.3 supplies the actual fixed-form family. No dependency on the later potential-modularity existence theorem remains. |
| RT-AREA-langlands-2/14 | Read published Kisin §4.3 for arbitrary totally real fields and cohomological multiweights under residual absolute irreducibility. Request R08.3's quotient for **arbitrary A°**, use its exact semistable-height-quotient node for Theorem 2.5.5, and retain finite-Qp-algebra specialisations including nilpotents. The universal deformation-ring statement alone does not suffice. |
| RT-AREA-padic-2/22 | R06.5 supplies generic proper smooth/semistable comparison, projectors and coefficient functors. R19.5 owns the concrete Scholl/Saito/Kisin/Skinner modular applications; the stable integrated comparison node and its dependencies now follow this boundary. |

## All routed paper items

| Routed extraction items | Node or imported owner |
| --- | --- |
| PAPER-NEWTON-THORNE-26/dimitrov-large-image | `R19.3/dimitrov-large-image`, with the fixed family and exact non-CM/large-characteristic hypotheses. |
| PAPER-NEWTON-THORNE-21/148; PAPER-NEWTON-THORNE-21-B/56 | `R19.3/ribet-momose-classical-large-image`; generic group inputs from R01.4, modular inner-twist application here. |
| PAPER-DASGUPTA-KAKDE-23/258 | All-Hilbert construction and arithmetic properties in R19.2; ordinary local shape imported from R21.3. |
| PAPER-DASGUPTA-KAKDE-23/265 | `R19.2/cm-hilbert-eigenform`, with induction from a quadratic extension and its associated self-twist. |
| PAPER-DASGUPTA-KAKDE-23/266, /267 | `R19.2/virtual-reducibility-implies-cm`, with Ribet's infinite-projective-image hypothesis and BGV's regular real-place argument. |
| PAPER-DASGUPTA-KAKDE-23/269 | `R19.2/ordinary-cm-primes-split`; the source's CM/infinity-type hypotheses are retained. The companion ordinary-line/conjugation theorem supplies Lemma 9.2. |
| PAPER-DASGUPTA-KAKDE-23/270 | `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; Skinner's p. 256 irreducibility argument is read independently. |
| PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/5.2-prop-5-2 | `R19.5/shimura-curve-hk-dR-multiplicity`, realising both R19.4 and R19.5; the local p-adic Langlands theory is not replanned here. |
| PAPER-SKINNER-20/54, /55, /56, /70 | `R19.3/skinner-density-one-ordinary-primes` and Ribet–Momose residual irreducibility. Residual ramification uses the exact R20.2 level-lowering request. The weight-two, squarefree-level, trivial-character hypotheses are retained. |

## Public sources and reading depth

The packet records **24 sources**, with public URLs, edition/version, access dates, SHA-256 hashes and read ranges. Fourteen source records are added. Source hashes for the existing public copies were checked; earlier reading ranges remain attributed to the earlier worker/reviewer rather than represented as new full-paper reads.

New passages read for this pass:

- Scholl 1990 §1.0–1.3: the explicit projector, the realisations, Theorems 1.2.1/1.2.4 and the deduction; the desingularisation proofs in §§2–3 remain a refinement.
- Published Kisin 2008 introduction, Theorem 2.5.5, §2.7.5–2.7.7 and **all of §4.1–4.3's interpolation proof**. This is stronger than quoting a weight-two special case from KW.
- Skinner 2009 introduction and Theorem 1, plus §2.4.2 pp. 255–256, including the complete irreducibility remark. The earlier analytic continuation argument has not been fully read.
- Dimitrov 2005 Propositions 3.1, 3.5 and 3.8, their proof arguments and the surrounding strong-irreducibility statements; the precise tame-inertia inputs of §3.2 remain an import/refinement.
- Dasgupta–Kakde §9.1 with Lemmas 9.1–9.2 and their cited sources; BGV's introduction and the regular real-place CM obstruction; Hara–Ochiai §2.1's ordinarity condition and **Appendix A Proposition A.3 with its complete proof**.
- Ribet 1975 Theorems 2.1/2.3 and the complete group-theoretic proof on page scans; Ribet 1985 pp. 185–192 including Theorems 2.1/3.1 and their proofs. The original Momose proof is still a refinement, not claimed read.
- CDN §5.2.1's setup, Proposition 5.2 and its complete proof, including the period module, level and globalisation caveats.
- Newton–Thorne's three routed large-image/strong-irreducibility uses and the 2026 paper's Proposition 5.4 proof. Their symmetric-power automorphy proofs are outside this packet's targets.
- Skinner's published 2020 §3 p. 350: density-one ordinarity, eventual residual irreducibility and residual ramification by level lowering.
- Chenevier §2.18–2.22 and Theorem 2.22(i)'s proof for the finite-residue-field reconstruction correction.

The earlier Deligne–Serre, Deligne Bourbaki 355, Carayol, Saito, DFG, DDT, KW and Skinner–Wiles sources and their detailed read ranges remain in the source inventory. The three inherited source issues E1–E3 are retained: ordinary subgroup count, KW's Saito bibliography mismatch, and DFG arXiv's complementary excluded-prime sets. The WD sign issue is already owned by PadicHodgeTheory/E50 and remains an explicit conversion obligation here. No new source error is asserted.

For density/style comparison, the full upstream HodgeStructures document and RepresentationTheory/InductionRestriction document were read. The upstream RepresentationTheory index was also read. Upstream ModularForms and neighboring source/dependency files were inspected for their supplier interfaces; this does not claim those whole documents were read.

## Precise work for independent review and follow-ups

Independent review should first check the all-Hilbert scope, the geometric/arithmetic dual and Frobenius conventions, and descent over the **whole** generic Hecke algebra with nilpotents. The law is first attached to geometric cohomology; dualise before using the arithmetic determinant convention in a universal deformation ring. O-flatness and closedness, together with integral mixed coefficients, are essential; reduced field points are insufficient.

The following nine gaps are explicit proof refinements or missing exact imported interfaces. They do not leave an unplanned stage target. No follow-up should reconstruct the generic compatible-system, WD, period-ring, modular-geometry or determinant carriers in this roadmap.

1. **Geometric coefficient projector and minimal coefficient-field descent.** Scholl §1.0–1.3 supplies the explicit ε-projector and its homological newform realisation. The desingularisation and boundary proofs in §§2–3 and the exact minimal coefficient-field descent across the DFG realisation categories need further source-proof transcription. GH.0/R14.3 supply the geometry; do not add an unconditional individual Chow projector or assume trace-field descent.

2. **Taylor auxiliary-new congruence theorem in the all-Hilbert case.** Kisin §4.3 states and uses Taylor’s factorisation through auxiliary-new Hecke quotients modulo every p^s, and its proof was read. The original Taylor 1989 proof and the precise coefficient-model descent were not obtained/read. The target statement and proof chain are planned, but this source input is not claimed independently verified in the original paper. Irreducibility instead has the independently read Skinner p. 256 proof.

3. **Shimura-curve bad reduction and vanishing-cycle geometric imports.** Carayol’s Galois paper §1, §§2–6 and 10–12 were read in the earlier pass; its companion bad-reduction proofs, §§7–9/appendix and the Picard–Lefschetz calculation §§11.5–11.10 remain supplied by R18.2/R18.5 and LPV.7:semistable-curves. The exact requests name the special-fibre, Drinfeld-level and monodromy statements; these imports are not replanned.

4. **All-Hilbert local compatibility and Skinner analytic proof refinement.** Skinner pp. 241–244 states both full away-p compatibility and Theorem 1 without a residual or auxiliary-place hypothesis. The reduced affinoid construction/irreducibility argument pp. 255–256 was read, but the earlier GL₃ transfer, quadratic descent and analytic continuation/eigenline proof was not fully read. Refine its exact supplier declarations before lemma-level execution; do not replace the theorem by Kisin’s residual-irreducible special case.

5. **Cross-source WD normalisation and Saito printed sign.** Use FNF⁻¹=q⁻¹N for geometric Frobenius, so the exponential inertia reconstruction is a homomorphism. Saito’s printed inverse relation is already recorded as PadicHodgeTheory/E50. Carayol σ, Saito σ̌_h, Skinner Rec(π⊗|·|⁻¹/²), CDN ρ(−1) and the arithmetic dual are named separately. A complete functorial dual/twist comparison in the supplied R01.2/R06.3 carriers is still needed; it is not settled by agreeing spherical polynomials alone.

6. **Endpoint residual inertial type and modular-symbol/Wach integral comparison.** The characteristic-zero crystalline statement and the failure of the [0,p−2] Fontaine–Laffaille range at k=p+1 are explicit. The exact residual endpoint-weight/weight-two-lift criterion remains requested from R20.6/R07.4. For Iwasawa consumers the ordinary lattice intersection is specified, but the coefficient/period-line and semilinear Wach lattice comparisons still require the imported P7 and upstream modular-symbol APIs; no arbitrary numerical period normalisation is asserted.

7. **Geometric generic rank-two module beyond the weight-two model.** DDT gives the weight-two generic rank-two module over the full Hecke algebra, including its oldspace nilpotents. For higher-weight/Hilbert completed local Hecke algebras, extracting the faithful rank-two generic multiplicity module, with generalised eigenspaces and correct lattice/topology, remains an exact R14/R18 geometric import. The integral descent argument is planned under this input and O-flatness. Torsion/non-flat Hecke algebras require an integral cohomological determinant construction; reduced eigenform points do not supply it.

8. **Integral local conditions and the DDT type-Σ exercise.** DDT Lemma 3.27 leaves the type-Σ checks to the reader. The previous claim that all Artinian quotients embed in a product of eigenform quotients is removed. Prove the exact flat/ordinary/minimal local functor conditions on finite quotients, or annihilation of the local-condition ideal on the whole generic algebra plus O-flatness. Kisin’s arbitrary-A° finite-algebra quotient supplies the relevant generic family input; dense field points alone cannot detect nilpotents.

9. **Large-image source refinements.** Dimitrov Propositions 3.1/3.5/3.8 and Ribet 1985 Theorems 2.1/3.1 were read, with the original Ribet 1975 group theorem read on scans. Dimitrov §3.2 tame-inertia exclusions and the original Momose inner-twist openness proof remain refinements. Skinner’s trace-zero density theorem is cited to Serre and requested as the exact R01.5 analytic Chebotarev input, not claimed proved here.

The 41 requests are grouped by canonical supplier in the packet, with exact statements and consuming node IDs. Their owners are:

- `ModularCurvesPartII:R14.3`
- `ArithmeticGaloisRepresentations:R01.6`
- `ArithmeticGaloisRepresentations:R01.1`
- `ArithmeticGaloisRepresentations:R01.2`
- `GL2AutomorphicRepresentationsAndTransfer:R16.3`
- `HilbertModularVarietiesAndShimuraCurves:R18.4`
- `HilbertModularVarietiesAndShimuraCurves:R18.2`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`
- `WeightsInEtaleCohomology:R34.6`
- `AlgebraicModularFormsAndSerreWeights:R15.5`
- `IntegralHeckeAndGaloisDeterminants:IHG.1`
- `GL2AutomorphicRepresentationsAndTransfer:R17.3`
- `ModularCurvesPartII:R14.2`
- `GlobalGaloisDeformations:R04.3`
- `SerreWeightAndLevelOptimisation:R20.6`
- `AlgebraicModularFormsAndSerreWeights:R15.2`
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`
- `HilbertModularVarietiesAndShimuraCurves:R18.5`
- `LefschetzPencilsAndVanishingCycles:LPV.0`
- `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`
- `GL2AutomorphicRepresentationsAndTransfer:R17.4`
- `GL2AutomorphicRepresentationsAndTransfer:R17.5`
- `ArithmeticGaloisRepresentations:R01.4`
- `ArithmeticGaloisRepresentations:R01.5`
- `AutomorphicLFunctionsAndLocalFactors:AL.3`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`
- `tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization`
- `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`
- `ModularCurvesPartII:R14.6`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`
- `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`
- `GeneralizedHeegnerCycles:GH.0`
- `LocalGaloisDeformationRings:R08.3`
- `PadicHodgeTheory:R06.3`
- `PadicHodgeTheory:R06.5`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`
- `PadicHodgeTheory:P7`
- `GL2AutomorphicRepresentationsAndTransfer:R16.6`
- `SerreWeightAndLevelOptimisation:R20.2`
- `IntegralHeckeAndGaloisDeterminants:IHG.4`
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

The next work is the independent review of this complete pass, then refinement of the precise gaps above in the owning roadmap. Start from the stage coverage records and the named consumers in each gap; all needed contracts and source locators are committed in the packet and reader. No private source file or scratch script is required to resume.
