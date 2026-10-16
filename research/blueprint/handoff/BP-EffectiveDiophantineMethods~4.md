# BP-EffectiveDiophantineMethods~4 — complete planning revision

Issue: #10051. Worker: Codex (GPT-6), session `codex-Pd8PC1`, 16 October 2026. Branch: `codex-Pd8PC1-effective-diophantine-r4`. This is a finished planning revision, not a checkpoint or an implementation. The claim was confirmed by the bot in [comment 6223550546](https://github.com/CBirkbeck/tauceti-explorer/issues/10051#issuecomment-6223550546). No second issue was claimed.

## What changed

The maintainer’s 16 October instruction is applied throughout the packet, reader and suggested file. All active ComputationalNumberTheory prerequisites, supplier requests and proposed incoming edges are removed. References to that name now describe its retirement, not an active dependency. Nine old supplier requests were removed and one precise principal-unit logarithm comparison request to ColemanIntegration:L0 was added: 40 requests become 32.

All 175 accepted target IDs are retained. Three targets are added:

- `ED.0/exact-algebraic-certificate`: actual algebraic values, nonzero squarefree annihilators, rational isolating intervals/discs, unique containment, exact field-operation semantics and arbitrarily small separating certificates. General real algebraic geometry remains upstream’s work.
- `ED.0/padic-precision-propagation`: absolute precision in actual completions, addition/product/inverse/linear-combination budgets, zero handling, ramification and the extra pivot-division loss.
- `ED.2/padic-logarithm-enclosure`: explicit finite-series tails, deep powers, power-division losses and normalized-log residue precision, importing existing principal-unit logarithm theory.

The existing ED.2 archimedean-log target now gives rational finite sums and explicit logarithm/arctangent remainders, endpoint and branch-cut conditions, outward rounding budgets and existence of every requested precision. ED.0 isolations and local certificates are mathematical existence/soundness statements. None introduces an algorithm, complexity model or generic numerical evaluator.

All other concrete arithmetic data are explicit hypotheses at their consumers: complete unit/class/factorization data, local groups and point-count tables, Hecke/cohomology/Frobenius data, integral/Taylor coefficients with strict tails, model/modular identifications and L-value/derivative enclosures. This audit includes the small descent examples, genus-two/genus-four examples, the three split-Cartan charts, all nine genus-three modular levels, and the S-unit/Thue/Thue–Mahler examples. L-value production is expressly outside ED.2. The former two split-Cartan `.actualProducer` labels are retired in `revision4.retiredProducerNames`; their `.suppliedData` replacements describe inputs, not production targets.

These hypotheses do not assume the final answer list is complete. The mathematical targets still derive initial/reduced bounds, check full branch/residual coverage and prove solution-set equality. In particular S-unit and Thue–Mahler enumeration is not replaced by an assumed exhaustive list. Numerical replay of the 545 S-unit solutions, 72 Thue–Mahler solutions, 1492-case experiment, or complete QC zero tables is not claimed.

## Revision 3 findings

The historic packet `review` object is preserved unchanged, including its `needs_changes` verdict. All 43 existing source-finding verdicts and all 197 pinned baseline records are retained. This author’s new evidence is in `revision4.sourceChecks`, not a self-review acceptance object.

The nine primary-locator obstacles were resolved by reading recovered primary copies whose bytes match the recorded hashes:

| Source | Recovery and inspected scope | SHA-256 |
| --- | --- | --- |
| Fincke–Pohst 1985 | [Archived AMS scan](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/S0025-5718-1985-0777278-8.pdf), §2 pp.464–466, especially Algorithm(2.8), relations(2.6)–(2.7), and discussion after(2.12); rendered p.465 | `c61b81fc0a0e274aa9c43feba6b676be0ac89220cdaf6cb9bb42a88df1e53abe` |
| Matveev 2000 | [English primary text](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng), pp.1217–1220, especially rendered p.1219, Corollary2.3, admissibility(2.4), bound/constant(2.6), and its B* substitution | `e395e4698837950b683362558441e1e75298ad28cb0cc8cf260a556c93093574` |
| Silverman 1990 | [Archived AMS scan](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/S0025-5718-1990-1035944-5.pdf), abstract p.723, rendered Theorem1.1/Remark1.2 p.725, §3 pp.729–730, §6 p.738, §7 pp.739–740 | `aaf0066b8b7f4ef6e8d947cb125ab578306b6ad5ed853272192405b5080b6264` |

Fincke–Pohst’s weak boundary inequality, both signs, homogeneous zero stop and the separate affine-centre extension were checked. Matveev’s nonzero logarithms/form, absolute heights, complete constant, real/complex parameter and B* replacement were checked against the actual formula. Silverman’s absolute half-height, archimedean weights, integral-model hypothesis, b2=0 convention and weak inequalities were checked. The inherited Silverman local/global locator **pp.727–728 is corrected to pp.729–730**. The exact weighted number-field Lean interface remains a target, not implemented by recovering its source.

Selected de Weger passages were also read: §2.3 pp.28–29, §2.5 pp.32–34, §3.6 pp.51–53 and §3.13 pp.66–69, with rendered p.52. Other earlier whole-source or primary-reading claims remain dated inherited metadata. No unavailable Prickett source is used as proof provenance; the accepted Siksek1995 route is retained.

The preceding R1–R7 mathematical repairs remain. In particular:

- F1 retains the McCallum–Poonen good-reduction locator at author p.5, with residue parameters at p.6.
- F2 retains the direct two-isogeny-rank-bound dependency for the Mordell–Weil basis certificate.
- F3 retains the distinction between source acceptance examples and actual numerical replays. Box X0(43) and Caraiani–Newton Proposition7.4.5 remain source cases, not ED.6 replays.
- F4 retains the empty complete Thue-covering branch proving no solutions before any representative extrema; the affected full raw contracts and regression are synchronized.

## Upstream reuse and scope

The read-only current upstream roadmap commit was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current library commit was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. RealAlgebraicGeometry’s general Sturm/Thom direction is reused, not re-planned. NumberFieldArithmetic’s prime-degree rank-one criterion is not treated as a general unit-table generator. Current Tau Ceti local-field logarithm convergence/isometry declarations are explicitly recognized as existing work, with only quantitative finite-tail adapters owned here. Those later declarations are not falsely inserted into the pinned baseline.

The pins remain Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed library audit and owner boundaries were read. This revision retains the independent baseline audit rather than claiming a fresh independent read of all 197 declarations. No upstream checkout was edited or built. The single-owner Strassmann proposal and pre-existing global stage-cycle coordination notes remain for the maintainer; local node-graph validation alone does not settle the stage projection.

## Reader and Lean shape

The reader carries every target, hypothesis, direct prerequisite, proof route, source locator, acceptance case, API and test. It includes the full exact supplemental signatures and a missing-name register. The 69 inherited omission contracts are retained with the new input conventions, and 147 records account for full interfaces absent from the streamlined companion: **216 records covering 726 distinct names**. The two retired producer labels are explicitly accounted for separately.

The suggested file follows WORKERS.md’s binding 12 October shape: **284 lines**, eight real-bodied light definitions and 17 named theorem statements over existing carriers, with a few examples. It introduces no heavy record, constructed geometric carrier, data definition with a proof placeholder, or helper-lemma development. Actual geometric statements and raw checker structures remain precise README targets. The Qp tail statement and final finite-box S-unit implication are explicitly narrower than the full ramified/logarithm/enumeration pipeline, rather than being presented as its implementation. Every light definition has an API and at least three discriminating README tests.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json`: **0 errors, one explained baseline-index warning**. The existing index misnames `Finset.mem_filter` as `Finset.Finset.mem_filter`; the correct declaration is retained.
- `source_issues.check_issues` on all 43 findings and `check_errata.versions_checked` on the source versions: **0 errors**.
- Preservation/correspondence checks passed: 175 original IDs retained plus three additions; historic review, baseline and source verdicts unchanged; per-node/top-level omission lists identical; every planned API/proposed name is either in the actual companion or the exact omission register; every API and regression occurs in the reader; at least three tests per definition/construction; at most six planets per stage; no active retired-owner prerequisite/request.
- Recovered-source hashes match all three source records exactly. New exact-rational checks passed for logarithm/arctangent partial sums, the Q3/Q2 p-adic sums, product/inverse/pivot precision, ramified tail budgets and half-height interval width. Sample real-error inequalities were checked numerically as diagnostics; the proof routes use finite geometric identities and integration, not these samples.
- `lean-check research/blueprint/suggested/EffectiveDiophantineMethods.lean`: **compiled successfully**, with only the expected `sorry` warnings. This was the actual deliverable, not a filtered substitute. Memory was checked beforehand; no library build/update/cache command or language server was run. An initial source-level decidability issue in the finite-set notation was corrected before the successful run.
- `git diff --check` and the four-deliverable path check passed before submission.

Counts: **178 targets** = 25 definitions, 33 constructions, 102 theorems, 16 applications and two lemmas; **507 API contracts, 344 tests, 40 planets, 197 baseline declarations, 27 gaps, 32 requests, eight restructuring records**. The structural checker’s definition/construction subset is **480 API entries and 337 tests**. ED.0 through ED.6 are all `planned`; none is `closed`; all implementation statuses are `unchecked`.

## What remains

No additional work is required to submit this planning revision. The next independent reviewer should inspect the nine new primary-source checks, the three new numerical contracts, the conditional-input audit and the streamlined Lean correspondence. A later implementation must construct the missing owner-supplied geometric interfaces, prove the raw checker and comparison theorems, supply each concrete instance’s explicitly hypothesized data and perform the claimed numerical replays before reporting them complete. The existing 27 gaps and 32 requests give the exact boundaries. Source recovery closes the old access obstacle, not those mathematical implementation obligations.

The pull request completes this one job. Scratch source files and temporary checks are removed after the pull request is open; all information a follow-up needs is in these four deliverables and the public source URLs above.
