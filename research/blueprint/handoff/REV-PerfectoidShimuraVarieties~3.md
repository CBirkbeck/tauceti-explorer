# Handoff: REV-PerfectoidShimuraVarieties~3

Complete independent review by Codex, session `codex-Q4yvOG`, 14 October 2026. Refs #9269. [Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/9269#issuecomment-6159233925). This session did none of the original blueprint, either revision, or the earlier reviews. This is a completed job, not a checkpoint.

The packet is accepted as a complete target-level pass under Protocol §0 and the issue's acceptance rule. All 98 targets have fresh dispositions: 72 verified, 26 corrected, with 50 changed node fields. No node or API is added or removed. The result has 174 API items, 111 discriminating checks, 28 planets, 21 confirmed baseline declarations, seven explicit gaps and thirteen exact supplier requests. All eight stages remain planned, none closed, and every implementation status remains unchecked. Acceptance does not assert that the recorded proof inputs are supplied.

The five deliverables are the packet, synchronized reader, suggested file, [full independent review](../reviews/REV-PerfectoidShimuraVarieties~3.md), and this handoff. The report contains the complete 98-target ledger with locators, every changed field, all 45 source-issue dispositions, a per-target adversarial table, baseline checks and preceding-review reconciliation. It is sufficient to continue without the scratch files.

## Mathematical changes to preserve

- The generic double-coset identity needs `t ∈ P`; the omitted premise has a completely proved native negative control. Both parabolic/opposite-unipotent factorizations remain explicit hypotheses.
- The proposed nonsplit factorization of H is false. For an unramified quadratic L/ℚ_p, G=Res_{L/ℚ_p}GL₂, F=L, K_p=Iw(GL₂(𝒪_L)), m=n=1 and P=B×GL₂, Galois coupling of the two lower-left entries modulo p² prevents H=(H∩P)(H∩opposite U). The packet/reader give the full counterexample. The intended Boxer–Pilloni Lemma 4.6.20 Levi-image equality is not disproved: it is a precise new gap requiring another Galois-compatible argument.
- The ε=0 Hasse-Hartogs argument uses ordinary localization and normal Hartogs, not the positive-radius completion argument. At f=u=1 the u-adic completion is zero. The characteristic-p endpoint also keeps a topologically nilpotent scalar after inverting Hasse.
- Good-triple completeness works on arbitrary opens; trace self-duality does not assert projectivity over a singular base. Finite-étale curve stability is kept separately. Characteristic-p base fields are explicitly completed.
- Finite quotient/torsor arguments on nonproper rigidified spaces are local on invariant qcqs charts. The Siegel compactness step uses quasicompact flag neighbourhoods. The log-site finite-cover argument uses the site's actual cover property, separately from the unresolved openness/density step.
- The finite inverse-limit deck arguments now have a fixed uniform order bound. Fixed-tame finite Δ is distinguished from full adelic profinite Δ. Induction cites the pinned continuous-section theorem directly and uses left cosets for the right action.
- Strict analytic root depth is existential in positive epsilon; at m=n=1 the diagonal congruence over ℚ_p is modulo p². The second-row flag base point is [0:1]. Rational-depth normalization uses finite uniformizer extensions and matrix ideals.
- The finite residue-unit parameter uses a chosen ℤ_p-unit lift. The normalized trace uses the actual extension degree. The elliptic bundle comparison explicitly transports its Tate linearization.

All 43 inherited source findings were independently checked. E7 and E15 remain rejected; the other 41 are confirmed with fresh reasons. New E44 corrects the universal epsilon quantifier in the revised Higher Coleman manuscript, p. 94; E45 records the ε=0 proof failure in published Scholze Lemma 3.2.10, pp. 981–983. There are 45 findings in total, 43 confirmed. E41 is scoped to the proof, not a false geometric conclusion. All version history is preserved, with 19 new exact-hash read records. Cleared texts were read in place; no source files or passages were copied.

## Ownership and outstanding work

Preserve the five S1 Hartogs/good-triple targets moved down by revision 3 from TorsionCohomologyInfrastructure TC.0: perfectoid-hebbarkeitssatz, hasse-locus-hebbarkeitssatz, good-triple, good-triple-stability and hasse-blowup-hartogs. S1 is tier 17 and TC.0 tier 18; TC.0 must import them from S1. No supplier packet was edited here.

T2 owns the open limit-v-sheaf period map and Levi/bundle pullback; S3 owns their analytic incarnation and compactified applications. R09.1/B0 supplies the homogeneous representable flag/torsor interface upstream of T2. T6 supplies finite logarithmic comparison; S6 owns the whole-tower log-to-v passage and general toroidal map. Keep the late PerfectoidQuotients Part II perfectoidization proposal. The three restructuring entries remain proposals for the orchestrator; no live atlas edges were changed.

The seven remaining proof inputs are:

1. Integral-algebra perfectoidization through P8 for genuine minimal Hodge/pre-abelian/abelian towers.
2. General-radius boundary-stratum finite étaleness in Scholze Lemma 3.2.35.
3. Universal openness of completed log affinoid perfectoid charts, needed for fibre-product density.
4. The auxiliary reflex-torus Shimura datum and G^c/Levi fibre-product identities.
5. Torsor descent through ramified toroidal quotients with trivial boundary inertia on pushed-out fibres.
6. The p=2 integral truncated-group estimate for modified formal models.
7. The nonsplit Bruhat-domain Hecke Levi-image identity just described.

The packet and reader state each input and all thirteen requests with consuming nodes. The orchestrator should route those follow-ups while preserving the corrected complete pass. No further revision is requested merely for these honestly recorded gaps.

## Validation and reproducibility

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. All 21 baseline declarations and all 199 exact direct supplier nodes plus ten stage contracts were independently read. Structural traversal visits 2,291 exact nodes, finds no cycle and no direct higher-tier owner; this does not claim independent reading of all transitive nodes.

Current read-only upstream was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing adic, vector-bundle and profinite foundations are reused. Neither checkout was edited or built.

Applied the binding 2026-10-12 roadmap shape: the reader retains all mathematical statements, hypotheses, proof sketches, locators, matches, API and check statements, acceptance examples and supplier contracts. It has 2,736 lines. The Lean file has 988 lines, one outer namespace and matching layer order, 54 light definitions with real data bodies, 58 theorem statements and 51 examples. Missing geometric carriers remain reader targets. No catalogue or process ledger remains in the suggested file.

- `lean-check research/blueprint/suggested/PerfectoidShimuraVarieties.lean`: exit 0 at the shared pinned build; 109 expected `sorry` warnings, no other warnings or errors. Available memory exceeded 100 GiB. No language server, Lake build/update/cache or background compile was used.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PerfectoidShimuraVarieties.lean`: passed.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidShimuraVarieties.json`: zero errors and zero warnings.
- Reader mathematical-field retention, all-source hashes, complete review coverage, all definition/construction test minima and the dependency graph were checked.
- Final submission checks: only the five authorized deliverables, valid JSON, no private paths or source excerpts, and `git diff --check` clean.

The PR is submitted from a `codex-Q4yvOG` branch. Scratch files are deleted after opening it. This process stops after this one job; it takes no second claim.
