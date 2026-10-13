# Handoff: REV-PKG-AInfCohomology, issue #9197

Codex, session `codex-qojvLu`, 2026-10-13. This is a completed independent package review with verdict **needs_changes**, not a checkpoint. I did none of package job #9154 and claimed no second job.

## Delivered

- Corrected `research/blueprint/packages/AInfCohomology/README.md` in place, retaining all 264 targets: 137 accepted AI.0 targets, 60 accepted AI.6 targets, 29 main accepted targets and the package author's 38 supplier targets. Every API-bearing definition/construction block now has at least three discriminating Checks (67 blocks). No packet was edited.
- Updated `Suggested.lean` with seven examples: p=2 periods, identity shifted θ, zero differential divisibility, two-operator Koszul square and ordered basis sign, empty q-integer, and p=2 coefficient Frobenius. Its closing list includes the Sq⁰ operation, absolute bounded PD coefficients and the coefficient normalization. It has 327 lines, 12 light real-bodied definitions/abbreviations, 15 theorems and 18 examples.
- Wrote `review.json` and the detailed report `research/blueprint/reviews/REV-PKG-AInfCohomology.md`. The report records applied fixes, all source-check limits, the reproducible 15-target source sample, every target in a 68-row adversarial table, dependency/coverage checks, current-library removals and Lean validation.
- Metadata remains `topic = "math.AG"`.

## Remaining mathematical work

Resume at **§AI.7.3, Trace and prismatic Breuil–Kisin agreement, clause (b), G1**. Supply the three natural specialization-map squares for the chosen equivalence of clause (a): A_inf, θ-de Rham and Frobenius-normalized crystalline. BS22 §15.2 / Proposition 15.7 give the equivalence and Nygaard computation, but the package's restricted base-change observation does not identify those three arrows. Using BS22 Theorem 18.2 on only smooth O_K-algebras, or on the completed A_inf Čech overlaps, does not meet its hypotheses.

Then resume at **§AI.7.4, Agreement of smooth comparison maps, clause (b), G2**. Compare the θ-de Rham maps via the actual Frobenius/Lη factorizations and the BMS1 crystalline route; compare the crystalline arrows on PD/Koszul generators; use a resolved G1 for trace/Breuil–Kisin; identify the étale/B_dR⁺ maps through the existing canonical-map targets. The supported Hodge–Tate/η statement is retained as clause (a). These are gaps in the proof routes, not demonstrated counterexamples to the intended final statements. The individual comparison theorems remain in the package; their additional mutual compatibility must not be asserted as established before these repairs.

Do not shrink the roadmap, drop its comparison targets, or replace these maps by unnamed isomorphisms. The review report gives the precise source statements and the reason perfect-prism uniqueness is insufficient.

## Ownership and supplier follow-up

Current upstream was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, including Completed and the nine roadmaps newer than the atlas snapshot; current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The pinned baselines are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Removed planned **clauses/API items**, not whole targets: generic Witt adic completeness and the generic residue-map Teichmüller/Frobenius/surjectivity API. These are now cited as library inputs; cyclotomic regularity and residue period values remain targets. Kept variants are explicitly distinguished: commuting-endomorphism cochain Koszul versus sequence chain Koszul, arbitrary valuation-ring module freeness versus PID/DVR freeness, topological inverse-limit coefficients versus discrete profinite coefficients, and boundary neighborhoods versus the existing interior/window construction.

The package author's external closure note still applies: CrystallineCohomology CR.5 and DerivedDeRhamCohomology DD.4/DD.6 have upward citations to this integral prefix. Those lower-tier packet files are outside this issue; the manager must remove/move the notions in those files before their upstream submission. No such outside repair is claimed here. The AInf/PadicHodgeTheory/PerfectoidQuotients/Prismatic bundle requires the interleaving recorded in the report.

For original sources not read directly: the package's Ullrich Theorem 5.3, Kato Toric singularities Theorem 11.6 and Raynaud–Gruson consequences were verified through their cited ČK passages. No uncleared alternative book copy was used; the maintainer-cleared Raynaud–Gruson scan did not provide readable extracted statements. The report distinguishes these indirect checks from the original source statements that were read directly. The README cites the intervening ČK sources, so it does not silently claim original verification.

## Validation

`lean-check` exited 0 at the shared pinned environment with 33 warnings, all `declaration uses sorry`. `scripts/check_sorry_data.py` exited 0. All internal prerequisites point backward; all accepted target titles and normalized API names are accounted for. Intake on the package, review JSON, review report and this handoff reports 0 problems. `git diff --check` is clean. The only changes are the package README/Suggested.lean/review.json, the review report and this handoff. Scratch notes and downloaded public sources are deleted when the run ends; nothing needed to resume is stored only there.
