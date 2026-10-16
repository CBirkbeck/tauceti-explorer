# BP-AutomorphicGaloisRepresentationsPartII

Issue #9924; Codex, session `codex-y94Tyw`; 2026-10-16. This is a complete target-level planning pass, submitted for independent review. It is not a checkpoint, mathematical closure or an implementation claim. Every implementation status is unchecked.

## Deliverables and inventory

The [whole-scope packet](../packets/AutomorphicGaloisRepresentationsPartII.json), [reader](../readmes/AutomorphicGaloisRepresentationsPartII.md) and [suggested file](../suggested/AutomorphicGaloisRepresentationsPartII.lean) agree on the corrected mathematical boundaries. The reader contains the complete statements, hypotheses, proof routes, theorem/section/page citations, APIs, uses, tests, acceptance checks and closure obligations. All ten requested scope ids are retained; AG2.1 is process only.

The effective specification comprises 124 targets: 14 definitions, 24 constructions, 64 theorems, six lemmas and 16 comparisons; 187 API items, 138 unit tests and 46 planets. Each definition/construction has its uses, full API outline and at least three discriminating tests. There are 15 pinned baseline declarations, 49 supplier requests and 18 gaps. No layer exceeds six planets.

The new packet has 16 `nodes`: five definitions, five constructions, four theorems and two comparisons; 59 API items, 43 tests and 13 planets. Seven of those nodes retain the integrated milestone ids; nine are new primitive targets. Its 108 `reusedNodes` refer to the independently accepted AG2.0/AG2.6 part packets. Each reused target has its entire reconciled contract in `importChecks`, using `target` instead of a duplicate `id`, plus its owner packet. Thus full-scope counts include the reused targets exactly once. Five old targets are excluded: the two generic ideal predicates now provided by upstream IHG, and three GSp₄-specific results routed to a dedicated owner.

## Promotion obligation: historical contracts are not silently rewritten

The checker rejects duplicating accepted part-packet node ids in a third packet. This continuation follows the existing R24.5 `reusedNodes`/`importChecks` pattern rather than creating renamed copies. The old part packets are not deliverables of this job and were not edited. Existing independent verdicts on their source findings are preserved as historical provenance; no independent acceptance of this continuation is asserted.

**The atlas promoter does not apply `dependencyReconciliation`, `parentReconciliation`, exclusions or full import contracts as edits to other packets.** Before treating the promoted full-scope graph as corrected, the maintainer must apply the 17 listed prerequisite redirects, four parent/realisation moves, excluded-owner redirects and reconciled statement/API contracts to the historical parts or their promoted decomposition. The full contracts in this packet and reader specify exactly what to apply. This requirement is an explicit gap, not an assertion that the historical live graph has been repaired. Do not drop the imported targets when promoting the 16-node continuation.

The parent moves retain stable ids:

| Historical target suffix | Correct mathematical parent | Reason |
| --- | --- | --- |
| AG2.0/the-normalization-dictionary-fixed-by-the-sources | AG2.5 | Local LLC comparison follows the early integral polynomial and raw geometry. |
| AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris | AG2.3 | Arbitrary regularity uses definite families and descent. |
| AG2.2/cs-discrete-polarization-normalization | AG2.3 | The arbitrary-regular CS application follows that construction. |
| AG2.3/finite-number-field-of-realization | AG2.6 | The simultaneous realization field uses the regular Hodge comparison. |

The reconciled node graph and its layer contraction are both acyclic. The old upward dependencies on IG, R24, R19, ML and HS were removed as inputs. Compact Drinfeld/Newton and Mantovan Igusa models, classical EL local cohomology, the normalized Ext functor, the split HLTT datum, and compatible-family data/strength/operations/purity are owned here. The higher consumers must import these owners. Conditional rank-two comparisons take an independently supplied realization and prove recognition; they do not import an R19 existence theorem. The raw fixed-point theorem uses the precise polarized PEL effectivity request, not the insufficient outside-tier unpolarized Honda–Tate classification.

## Coverage and next mathematical work

Planned means every target is specified and backward-chained to a library declaration, exact imported node, requested owner contract or recorded gap. No stage is closed. The aggregate has no independent mathematical targets.

| Stage | Status | Exact remaining work |
| --- | --- | --- |

| AG2.0 | planned | Close the AF.1/AF.4 algebraicity, finite-part rationality and coefficient-conjugation contracts and the exact global-character/PHT specialization APIs. Source access for the CHT08 polarization lemma is resolved. |

| AG2.1 | source_decomposed | Process aggregate of AG2.1a and AG2.1b; no independent work. |

| AG2.1a | planned | Prove the explicit graded coefficient-projector recipe, compact ramified Drinfeld/Igusa geometry, polarized Kottwitz-triple effectivity and independent early fixed-point theorem. The early trace calculation has no ET.6, R19 or local LLC input. |

| AG2.1b | planned | Close compact EL deformation/cohomology and smooth Ext/almost-product contracts; verify HT01 p.207 weight cancellation and Proposition VII.1.8 divisibility of every irreducible multiplicity, not just the total dimension. |

| AG2.2 | planned | Close exact character, discrete-transfer and solvable base-change APIs. The CHT08 global extension proof is read. The GSp4-specific transfer and ordinary/singular-weight outputs require their dedicated owner. |

| AG2.3 | planned | Close the actual definite-unitary classicality/accumulation, pseudocharacter realization and effective solvable-patching supplier APIs. Chenevier’s public proof is now located; bounded period closedness uses proper realization covers and fixed weights. Close regular-Hodge realization-field descent. |

| AG2.4 | planned | Close ordinary boundary/bundle, dagger-rigid functoriality and weight contracts; derive joint-injective IHG witnesses from Hasse quotient congruences or prove the necessary quotient-descent extension. Supply the generic HLTT factor-separation refinement. Intrinsic compactification independence remains unproved in the source. |

| AG2.5 | planned | Close integral Bernstein and inertia-family specialization, generic WD partition/purity and two-chart nearby-cycle contracts. Keep Liu’s Hypothesis 3.2.10 conditional outside the verified range. Use pure-WD uniqueness, not uniqueness from one rank. |

| AG2.6 | planned | Close the distinct at-p geometric/log-crystalline input and AHTW quantitative cohomology, arbitrary-multiplicity bounded pseudodeformations, non-Siegel boundary and generic maximal-orbit refinements. The family data and strength/purity predicates are specified here independently of R24. |

| AG2.7 | planned | Close residual finite-field descent, polarization through reduction/semisimplification and normalized integral eigencharacter application APIs. Apply existing IHG generic ideal predicates. Do not infer non-Eisensteinness, complete splitting, adequacy or enormousness from local ratio tests. |


## Confirmed red-team obligations

Each assigned finding was read in the two area reports and traced to its source and owner. Their disposition is part of the contracts, not a review verdict on this work.

| Finding | Handling |
| --- | --- |
| RT-AREA-langlands-1/2 | Raw AG2.1a traces require an early Fujiwara/Varshavsky fixed-point theorem. EDC.8 currently supplies trace classes and refers the stronger result to ET.5. The exact owner refinement and gap preserve raw geometry before ET.5 stabilization and ET.6 LLC. |
| RT-AREA-langlands-1/3 | Specify the actual compact EL local tower and alternating smooth Ext Mantovan functor, including the dimension twist (−D), both cohomological signs, actions, and virtual identity. Retain the non-supercuspidal local reduction inputs rather than identifying a virtual class with an actual constituent. |
| RT-AREA-langlands-1/4 | Separate Shin’s compact signature (1,n−1) datum from the split noncompact HLTT hyperbolic rank-2n datum. Compact Igusa geometry is owned here; characteristic-zero ST/END comparison uses ET.7b, with no downstream torsion-concentration input. |
| RT-AREA-langlands-1/5 | Request polarized O_F-linear Kottwitz-triple effectivity, positivity, prescribed p-adic type and α₀=0 from PEL M4. Unpolarized Honda–Tate classification alone is explicitly insufficient. |
| RT-AREA-langlands-1/16 | State AHTW’s arbitrary-regular all-CM de Rham/full-Hodge and semisimplified comparison plus monodromy bound. Record quantitative local-Shimura cohomology, bounded arbitrary-multiplicity pseudodeformations, non-Siegel boundary and maximal-orbit extensions. No inference from residual genericity or a fixed-representation deformation ring. |
| RT-AREA-langlands-1/18 | Consumer exports include arbitrary-regular nonselfdual CM characteristic-zero and coefficient-prime branches. No Shin-regular or finite-slope restriction is silently retained, and totally real nonpolarized coefficient-prime admissibility is not asserted. |
| RT-AREA-langlands-1/19 | Route GSp₄ transfer/similitude, parahoric/inertia and ordinary/singular-weight statements to proposed GSp4LocalLanglandsAndGaloisRepresentations. No fabricated stage id or ML.4 input. The reader retains CG Proposition 6.8, Pilloni Theorem 5.1.7.1, corrected exponent, Hodge and reciprocal-polynomial contracts. |
| RT-AREA-langlands-1/20 | Common family data, Weak/VeryWeak/ExtremelyWeak predicates, operations, purity/strictness and polarization are owned in AG2.6 before R24. Raw data contains no admissibility assumption. Density quantifiers concern rational primes and every member above them. |
| RT-AREA-langlands-1/26 | Import existing upstream IHG polynomial, ideal predicates and determinant gluing. HLTT specialization, generic factor separation and uniform integral congruence witnesses are independent AG2 applications. The Hasse surjection does not automatically give IHG’s jointly injective finite-product witnesses; exact quotient-descent/injection gap retained. |
| RT-AREA-padic-2/22 | PHT owns generic period functors, bounded-family comparisons and descent; AG2 supplies actual automorphic summands. Proper representation-realization covers and stable lattice/blowup are retained for reducible families. No sign relabelling is substituted for filtered comparison. |
| RT-AREA-padic-2/32 | Request GK functoriality from RD.4, finiteness from RD.5 and rigid weights from RD.6; F1 provides carriers rather than duplicating those theorems. Frobenius and Hecke functoriality are explicit. |

## Sources read, recovered access and remaining restrictions

All inherited target statements, hypotheses, proof steps and direct prerequisites were read. Public source copies were fetched with hashes and read at the relevant theorem/section/page locators. The catalog in the packet records editions; the reader records the mathematical use, not source excerpts or section summaries. No source passage, PDF or extracted book text is included in any deliverable.

The public Chenevier chapter was recovered and read by page images where its damaged text encoding prevented reliable extraction: Theorems 3.2–3.5, pp.16–17; classical density and Corollary 3.9, pp.17–18; Proposition 3.11 and Lemmas 3.12/3.14, pp.19–21; Propositions 3.16–3.17, Lemma 3.18 and the realization-cover argument, pp.22–24. This locates the actual definite-unitary interpolation and bounded fixed-weight de Rham argument. It does not supply de Rham admissibility at the weight-varying places merely from Sen weights. The generic Bellaïche–Chenevier realization/specialization contracts remain requested.

CHT08 Lemma 4.1.4 and its complete proof, pp.118–119, and Lemma 4.1.5, p.120, were read in the public Numdam copy. The character extension uses norm idèles, a global extension and a real-place parity obstruction; pointwise square roots are not its proof. These two access gaps from the accepted parts are resolved.

The public proofs consulted also include the relevant BLGGT algebraicity/polarization and family definitions, Patrikis and Bellaïche–Chenevier signs, Shin compact/Igusa trace and multiplicity arguments, Chenevier–Harris construction/descent, HLTT boundary/approximation/factor-separation, Varma local interpolation, Taylor–Yoshida WD purity, Caraiani away-prime and coefficient-prime geometry, Grosse-Klönne comparison, CS discrete/residual applications, Newton–Thorne rationality/conjugation, BCGP purity/normalization and the AHTW coefficient-prime theorem and its prerequisite mechanisms. AHTW uses the July 2026 v1 unrefereed theorem; its quantifiers and limitations are retained. Newton–Thorne’s bibliography is corrected to Annals 203 (2026), pp.283–347, with preprint v2 page locators.

ACC+, Liu et al. and Pilloni were read in place from the maintainer-cleared library; no copy or extracted text was retained. Liu’s Hypothesis 3.2.10 is conditional outside Proposition 3.2.11’s proved N≤3 range unless the unpublished Kisin–Shin–Zhu input is supplied. HT01 was not cleared/available: its pp.97–98 projector recipe, p.207 cancellation argument and Proposition VII.1.8 irreducible-multiplicity divisibility proof remain precise gaps. Ramified Drinfeld/Mantovan underlying geometry and the generic inertia-family specialization proof also retain supplier obligations. Nothing is described as proved merely because a source cites it.

The 16 source issues retain separate part-qualified ids and historical independent findings. No new source quotation or `excerpt` field is present.

## Existing work and exact baseline

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
The actual statements and hypotheses of all 15 cited declarations were read at the pins; they provide only their listed algebraic components.

Current upstream roadmap main was read at `0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. IHG README/Suggested provides the integral spherical polynomial, generic residual Galois-type/non-Eisenstein predicates, dual/twist transport and determinant-gluing contract, so these are imported. LocalGaloisGroups, ProfiniteArithmetic, GlobalNumberFields, SemisimpleAlgebras and SchurWeyl were consulted for existing carriers and APIs. Searches in current and pinned libraries found no implementation of the required automorphic, Igusa, Mantovan, Rapoport–Zink, period-comparison or compatible-family carriers. No build was run in the read-only current environment.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicGaloisRepresentationsPartII.json`: zero errors, zero warnings, all ten stages planned. This standard check examines the 16 actual `nodes`; it does not interpret the import metadata.
- A validation-only in-memory assembly of `nodes` plus the 108 `importChecks` (restoring `target` as `id`) was run through the same checker, with the historical same-roadmap packets removed from its duplicate-id context. Result: 124 targets, zero errors and zero warnings. This additional check verifies APIs/tests/uses, source and prerequisite resolution, baseline declarations, target cycles and all planet caps across the complete corrected contract. It is not a new duplicate packet deliverable.
- The contraction by reconciled `parentStageId` is acyclic. Every direct external prerequisite belongs to an existing upstream roadmap or a lower numbered supplier tier; no upward or outside-tier owner remains. Exact older supplier gaps are explicit requests, not claimed implementations.
- Reader rendering was checked against every target statement, hypothesis, API item and unit test in the complete contract. All 124 targets occur once, including historical ids in their corrected layers.
- `lean-check research/blueprint/suggested/AutomorphicGaloisRepresentationsPartII.lean` completed successfully at the pins, exit 0, with 31 declaration-placeholder warnings and no other Lean warnings/errors. Available memory was above 20 GiB. The final 221-line file was checked after correcting the reciprocal-polynomial example to use complex roots, so the Δ polynomial test has realizable hypotheses. No data definition has an omitted body, no language server or build was started, and nothing is left running.
- The intake deliverable-path/private-path check passed for all four paths with zero problems. The whitespace check passed. Only this job’s four authorized paths are changed.

## Exact closure gaps

The following are mathematical or integration obligations, rather than missing target-level planning. Resolve them in the owners named by the packet, then update the relevant contracts; do not reintroduce higher-tier cycles.

1. **Explicit coefficient realization.** TY cites HT01 pp. 97–98 for the recipe ξ↦m_ξ,t_ξ,ε_ξ. Those pages were unavailable. The B2 and Schur–Weyl requests must provide the recipe and verify its parity and Tate twist; no unspecified projector is accepted as a proof.

2. **Polarized Kottwitz-triple effectivity.** The current Honda–Tate node classifies abelian varieties up to isogeny. Raw fixed-point counting additionally needs a polarized O_F-linear realization with prescribed p-adic isocrystal, positivity and trivial Kottwitz obstruction α₀. Request PEL M4 refinement; do not infer it from the unpolarized Honda–Tate node.

3. **Middle-degree cancellation source step.** Shin Corollary 6.5 imports the Harris–Taylor p. 207 argument, beyond just purity of H^k. That unavailable passage must supply the selected-constituent weight bounds under the exact ST/END hypotheses. Geometric purity plus a virtual rank equality alone is not a proof of concentration.

4. **Irreducible multiplicity divisibility.** Shin Corollary 6.8 invokes HT01 Proposition VII.1.8 and explains the adjusted assumptions in Remark 6.9. The book proof was unavailable. The required lemma is divisibility of every irreducible Galois multiplicity by C_G, using the labelled geometric de Rham dimensions and independence of τ. Numerical rank divisibility is expressly insufficient.

5. **GSp₄ route and dedicated ownership.** Confirmed RT-AREA-langlands-1/19 routes the regular GSp₄ systems, Calegari–Geraghty Proposition 6.8 GSp₄-valuedness and Sorensen parahoric/inertia bounds, Pilloni Theorem 5.1.7.1 and its normalization and GSp₄ ramified comparisons to the proposed GSp4LocalLanglandsAndGaloisRepresentations owner. No such roadmap/stage exists in the atlas yet, so a fabricated supplier id is not used. The source-route obligation for AG2.2 and AG2.5 is recorded as this explicit ownership gap, pending creation of that owner. The contract must preserve Calegari–Geraghty Proposition 6.8(1)–(2),(5), the Mok/Bellaïche–Chenevier GSp₄-valuedness argument and Sorensen’s Iwahori/Klingen/paraspherical/inertia cases, and Pilloni Theorem 5.1.7.1(2),(5) with its geometric-Frobenius normalization and the routed E27 correction. Coefficient-prime and ordinary-shape clauses go with that owner’s p-adic package, not with this away-prime blueprint. Only the generic GL_n sign theorem is kept in AG2.3; GL₄ polarized construction and generic pure WD theory are imported by the dedicated owner.

6. **Intrinsic boundary-pair independence.** HLTT explicitly says its cohomology should depend only on the intrinsic pair but this is unproved; the plan uses a fixed Σ and the constructed transition-map colimit. A proof of intrinsic compactification/refinement independence is still required for the stronger stage wording; it must not be inferred from Lemma 6.19’s finite-level invariants.

7. **HLTT quotient witness versus injection contract.** The existing upstream IHG Layer 4 joint-injectivity contract is phrased using an injective map into a finite product, whereas the Hasse construction naturally gives a surjective classical Hecke comparison. A generic quotient-descent lemma with continuity and polynomial-law identities, or a construction of the required injective witnesses from these quotients, remains necessary. This contract is requested explicitly; pointwise Hecke congruence is not treated as that lemma.

8. **Inertial family specialization contract.** Chenevier’s public chapter, pp.19–21, now supplies the Bernstein trace interpolation, Weil/inertia partition conversion and application. The generic inertia-isotypic monodromy specialization theorem used there is Bellaïche–Chenevier Proposition 7.8.19; its complete hypotheses and proof are still an IHG.4/SR.3 refinement contract. Do not use Varma’s nonselfdual comparison as the polarized theorem’s own input.

9. **Liu middle-degree identification range.** Liu et al. Hypothesis 3.2.10 identifies the irreducible automorphic representation with Hom_{G(A_f)} in degree N−1 for its specified indefinite unitary group. Proposition 3.2.11 verifies low ranks N≤3 and cites unpublished Kisin–Shin–Zhu for the further F⁺≠Q range. No public proof of that unpublished input was obtained. Keep the identification conditional outside the proved range; no universal geometric realization is used.

10. **Coefficient realization dependency.** CH Proposition 3.2.5 needs the regular Hodge–Tate/de Rham assertion established by its family comparison. The generic p-adic Hodge regular-semisimple criterion is requested here; the automorphic admissibility proof is assigned to AG2.6 and is not used by the early AG2.0 trace-field dictionary. The finite-field target stays planned with this precise dependency, rather than asserting trace-field descent.

11. **Early fixed-point theorem owner refinement.** EDC.8 constructs Lefschetz–Verdier trace classes but explicitly leaves the stronger Fujiwara/Varshavsky fixed-point result to ET.5. The raw compact Hecke–Frobenius identity needs that geometric result before ET.5 stabilization and ET.6 LLC/global comparison. Reconcile one generic owner with the existing ET.5 assignment; do not infer the fixed-point equality from a trace-class construction or import the stabilized automorphic formula into its own raw input.

12. **Generalized two-boundary log-crystalline comparison.** CR.6 and the existing geometric period comparison do not yet specify Caraiani’s full two-boundary weight spectral sequence and the projected-stratum concentration interface. The target node records its exact source and proof; the reusable sequence is requested as a CrystallineCohomology, Part II extension.

13. **AHTW quantitative cohomology and arbitrary-multiplicity pseudodeformations.** The source theorem is fully stated, but the supplier chain is not already closed by the atlas: AHTW Theorem 2.5.7 uses quantitative local Shimura cohomology annihilators (FS/HKW, Mantovan/HL25, Harris–Viehmann cases), not the later generic-only torsion-concentration theorem; Theorem 3.3.6 constructs reduced p-torsion-free bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities using Wake–Wang Erickson stable conditions and the bounded stable-condition algebraization/comparison results of WE15/WWE19. AHTW explains why it avoids assuming general formal GAGA; no general quotient-stack GAGA theorem is asserted as a prerequisite. Existing BunG/Newton and fixed-representation R08.3 foundations do not contain these full extensions. Precise Part II supplier extensions must be designed without a torsion-concentration→AG2.6 cycle.

14. **Polarization through residual semisimplification.** BLGGT §2.1, p.34 states the residual CM 𝒢_n-extension, but the previously cited deformation-problem node assumes it. ArithmeticGaloisRepresentations G7 owns the generic pairing/conjugation API; its exact reduction-and-semisimplification extension is requested here, including the coefficient-characteristic boundary, without importing Schur hypotheses. No self-dual lattice is asserted.

15. **Compact ramified local geometry and almost-product proof.** Shin §5.2, pp.33–34 explicitly extends the one-dimensional compact Drinfeld setting to ramified F_w and cites Drinfeld/HT01 and Mantovan. Its source-level recipe is read. A complete formal proof of the ramified deformation, finite Igusa descent and almost-product/coefficient comparison is still required. No general unramified PEL theorem or generic local-shtuka layer closes it; the precise PEL/cohomology requests are recorded.

16. **Coefficient-prime tensor-square realization and log sequence.** The at-p Caraiani realization has two distinguished places and projected closed strata. Its exact realization, multiplicity/projector/Tate dictionary and two-boundary log-crystalline concentration are not supplied merely by the away-prime tensor-square node. CrystallineCohomology CR.6 and the raw geometric supplier requests must supply this extension before purity is inferred.

17. **AHTW maximal-orbit and non-Siegel boundary extensions.** The arbitrary-regular all-CM theorem needs quantitative cohomological annihilators, non-Siegel boundary induction and bounded arbitrary-multiplicity pseudodeformations; HLTT’s characteristic-zero boundary package does not provide them. The monodromy corollary additionally needs the characteristic-zero generic maximal-orbit theorem (AHTW §6), not just the definition of Varma dominance. The source locators specify the required extensions, without using a downstream residual-genericity theorem.

18. **Historical part dependency redirects.** The two independently accepted part packets are immutable deliverables of other jobs. Their ids are reused here, not duplicated in nodes. importChecks gives the reconciled full contract, and dependencyReconciliation enumerates every old/new prerequisite list. The atlas promoter does not interpret those metadata as edits: the maintainer must redirect the historical consumer edges when promoting this full-scope plan. Until that happens, the old graph retains upward tier edges and the old generic ideal duplicates; this packet does not claim that the historical live graph is already repaired.


## Requests and review entry point

The packet’s 49 `requests` are merged by exact supplier. Each gives its precise mathematical need and affected target ids; the reader’s supplier appendix reproduces them. They cover AF algebraicity/rationality, generic Galois/WD/lattice APIs, PEL and coefficient projectors, étale/rigid/adic cohomology and traces, smooth Ext/Bernstein machinery, transfer/base change, eigenvarieties, determinant/family interpolation, p-adic Hodge/weights and the explicit AHTW extensions. Requests are records in the authorized deliverables; no other workers or roadmap files were edited or messaged.

Independent review should start with the continuation/import architecture and promotion obligations, then the early raw-geometry ownership, the determinant quotient-versus-injection gap, and the distinct polarized/nonselfdual coefficient-prime contracts. The reader is the definitive specification for heavy objects absent at the pins. Follow-up work must close the source/supplier gaps above and arrange the dedicated GSp₄ design and historical graph redirects. It must not replace the compact suggested file with invented carriers or a declaration-level implementation ledger.
