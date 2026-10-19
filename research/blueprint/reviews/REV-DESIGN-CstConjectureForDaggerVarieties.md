# Independent review of the dagger C_st roadmap

**Job:** REV-DESIGN-CstConjectureForDaggerVarieties, issue #3514.  
**Reviewer:** Codex (GPT-6), session codex-LdkZpc.  
**Date:** 2026-10-19.  
**Verdict:** accepted after corrections, as a completed target-level planning pass with explicit gaps. The six layers are planned; none is closed or implemented.

## Scope and counts

I checked all 46 nodes against their cited source locations, their direct prerequisites and the supplier statements. The packet's `review.checked` records an individual verdict and reason for every node: **34 verified, 12 corrected, none added and none unverifiable**. The packet retains five definitions, six constructions, 32 theorems and three applications, with 55 API items, **34 discriminating tests** (one added), and 29 planets. The eleven definitions/constructions each have at least three tests. The planet counts by layer are 6, 6, 5, 4, 6 and 2, and their names describe mathematical objects or results.

All 74 extraction items routed to this roadmap are accounted for individually. Introductory duplicates point to the detailed targets; unrestricted conjectures remain conjectural; generic period, finite-BC and dagger geometry remain imports. Eight gap classes and eight supplier requests remain. `complete` describes completion of this pass, not mathematical closure.

The primary text checked was the [CN5 author manuscript](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf), compiled 24 November 2024, with formulas disambiguated using [arXiv v4 source](https://arxiv.org/src/2108.12785v4). I also read Proposition 3.7 and Corollary 3.8, pp.14–16, of Grosse-Klönne's [public arXiv v1](https://arxiv.org/pdf/1408.3330v1). The packet records file hashes, dates and version scope. The journal versions were not read, so the source findings are not allegations against those unread texts. Statements, matches and this report use independent mathematical formulations; there are no source excerpts.

## Mathematical corrections

1. **Tube comparison and filtration.** The original `semistable-tube-complement` repeated the filtered quasi-isomorphism asserted in CN25 Proposition 8.3, p.51. The cited GK04 Corollary 3.8, p.16, proves an unfiltered comparison. The stronger assertion fails for the naive-Hodge filtered complexes: take the weak formal projective line with boundary the infinity section. Restriction is from the analytic affine line to the dagger closed unit disc. On the zeroth associated graded, degree-zero cohomology is the function space. The function `(1−πT)⁻¹` is overconvergent on the disc but has a pole at `π⁻¹` in the affine line, so this restriction is not onto.

   The slope application needs less. Compatible HK comparison identifies the underlying period module, and naturality includes the source's induced full lattice in the target's. The associated bundle map is injective with finite-length cokernel at infinity. Its cohomology sequence transfers vanishing of H¹. I replaced the filtered-complex equivalence by this argument in both tube targets and their reader/roadmap summaries, added the required bundle/cohomology prerequisites, and rewrote G-GEOMETRIC and the F1 request accordingly. Radius definitions and all strata used in the projective union's Čech descent remain explicit supplier obligations. New source finding **E16** records the overstatement and the counterexample; it does not reject unfiltered invariance or the repaired slope application.

2. **Monodromy coordinate.** The imported R06.1 convention is `N_B=−d/du`. Its horizontal lift is `exp(uN_M)m`; applying `exp(−uN_M)` removes monodromy. I made this translation explicit in `eigenspace-generation`. The added test takes `N(e₁)=e₀`, `N(e₀)=0`, `φ(e₁)=pe₁`, `φ(e₀)=e₀`: `e₁+ue₀` has diagonal monodromy zero and eigenvalue p, whereas the minus sign gives `2e₀`. This is a convention correction in the plan, not a source erratum.

3. **Finite BC and period Hom.** The cited `semistable-period-example` supplies one rank-two example, not the general coefficient module required by `bounded-period-spaces`. I removed that near miss. The revised proof uses the general VB1 gluing contract, standard-bundle cohomology, Le Bras equivalence and Euler height to identify the bounded eigenspace as H⁰ of the relevant nonnegative-slope bundle and compute its height. The VB1 request now specifies the precise general identification. For `eigenspace-period-hom`, I separately added the exact Proposition 3.27(i), p.20, period-Hom rank interface to G-PERIOD-HOM and the VB3 request: Euler height alone is not a theorem about natural Hom into B_dR.

4. **Exhaustions.** The original proof of `proper-stein-limit-vanishing` invoked partial-proper completion invariance on affinoid pieces. Those pieces are not partially proper. I replaced that step by the comparison of derived inverse systems after cofinal strict shrinkings required by Proposition 8.12, p.54, and made that exact input explicit in G-ANALYTIC and the completed étale request. The existing acceptance criterion already required a system-level comparison.

5. **Adjacent degree.** The proof of `global-equivalence` now identifies the finite positive bundle-cohomology piece through its twist before using the comparison range at r+1. It does not assert an isomorphism of the full adjacent syntomic and pro-étale groups at twist r. Its failure-object prerequisite is now direct.

6. **Locators and rejected source correction.** I corrected the TVS/qBC introduction to Definition 4.1, p.20 and Definition 4.5, pp.21–22; the numerical argument to equation (3.10)/Remark 3.11, p.15 and Remark 3.13(iv), p.16; Remark 3.15 to p.16; and the introductory recovery conjectures to p.5. The difference-map sign error is in sequence **(6.17)**, associated to square (6.16), p.43. The Lean comment now gives that locator. The alleged Ext-target misprint E5 is rejected: p.38 and the public TeX already have target B_dR. I removed the reader/node wording that advertised it as a correction.

## Baseline and ownership

All six baseline entries were read in source at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with Tau Ceti pinned to `f790474821cf4256814db967cb154e7af3d0c369`. **No baseline citation was removed or replaced.**

| Declaration | Source and actual contribution |
| --- | --- |
| `BDeRhamPlus` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, line 77: an adic-completion ring carrier, under the stated primality, nonunit and completeness hypotheses |
| `BDeRham` | Same file, line 90: localization of that carrier with its commutative-ring instance; no field/DVR or Fontaine comparison theorem is supplied |
| `CategoryTheory.BicartesianSq` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean`, line 56: a square that is both pullback and pushout in a category |
| `Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean`, line 43: existence of a basis; finite generation is a separate condition |
| `Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean`, line 119: finite generation of the top submodule |
| `ModuleCat` | `Mathlib/Algebra/Category/ModuleCat/Basic.lean`, line 56: actual bundled modules with their additive-group and scalar structure |

I read the exact external nodes for R06.1/R06.2, VB0–VB3, F1, CP.4 and L0, and the VB1 stage description behind its request. F1's discretely valued finiteness and affinoid resolution scope cannot silently supply the C/global cases; CP.4's algebraic comparison cannot silently supply model-free analytic cohomology; finite BC does not supply arbitrary reasonable Pairs/qBC. These distinctions remain explicit.

The integrated library audit was checked together with direct pinned/current searches. I also read the current upstream **AdicSpaces** and **AlgebraicVectorBundles** READMEs and their Suggested declaration inventories at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and checked the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing adic rings, sheaf/module constructions and ordinary vector bundles are reused through their owners. The particular filtered-module modification here does not define vector bundles again. AdicSpaces' topological curve does not supply the missing period-bundle or derived completed tensor interfaces. No upstream file was changed and no build ran there.

## Independent source-issue decisions

Every source finding now has the required independent review object. **Fifteen are confirmed and E5 is rejected.** E1–E4, E6–E13 retain the corrected mathematics, with E9's locator repaired. E14 is confirmed specifically as the missing strong-dual strictness/bidual continuity needed by the chosen L0 repair; it does not assume that stereotype and strong topologies agree on the unknown extension or claim the extension theorem false. E15 is confirmed as the unprovided positive-crystalline refinement: the bounded sandwich does not establish the exact equality in Remark 9.9(ii), p.58. G-FA affects only the splitting branch and G-CRIS only the stronger affinoid refinement. Neither is used as a proved input to the main comparison/recovery targets. E16 is the newly checked tube-filtration finding above.

## Validation and remaining decisions

The packet passes `python3 scripts/check_blueprint.py` with **zero errors and zero warnings**. The reader was cross-checked against all 46 target statements, every source locator and every API/test statement; each roadmap layer includes its corrected target statements. The 98-line suggested Lean file elaborates through `lean-check` at the pinned Mathlib with **no warnings**. Its ten examples test existing ring/module/square conventions and the difference sign. They implement none of the 46 new targets. No placeholder carrier, sorry data definition, or auxiliary theory development was introduced.

The orchestrator should route the eight precise supplier contracts before any closure/promotion decision, and collate the confirmed findings against the journal text. In particular, retain E5's rejection in the extraction's downstream errata accounting, and use the repaired lattice-containment formulation when routing tube geometry. No new roadmap owner or layer move is requested by this review. All deliverables for this review are complete; the remaining work is the recorded mathematical supplier work, not an unfinished review.
