# BP-PrismaticCohomology~2 — blocked revision checkpoint

Issue [#10119](https://github.com/CBirkbeck/tauceti-explorer/issues/10119); Codex, session `codex-NLkW3i`; 2026-10-17. The bot confirmed claim comment 6233217614 in comment 6233218714. Branch `codex-NLkW3i-prismatic-revision`. No second job was claimed. This checkpoint saves mathematical progress; it does not complete the revision or independently review any earlier work.

## Blocker requiring a scope decision

[WORKERS.md](../WORKERS.md), “Doing the work”, requires: **“Edit only the files the issue names, plus your own scratch space.”** This issue names only the top packet, reader, suggested Lean file and this handoff. The required assembly preserves the 369 inherited canonical node IDs, but the unmodified checker rejects them against the retained part packets. The checker, retained parts, promotion and submission machinery are outside the authorized four-file scope. A scope extension was requested during this session; no response had arrived when this checkpoint was prepared. Only the four deliverables were edited.

This is a reproducible lifecycle conflict, not a request to rename or omit mathematical targets. `imports` records provenance; the importer does not expand it. `check_blueprint.world()` visits the retained `--PR.0` and `--PR.8` files before the top packet. `check()` then rejects a same-roadmap ID owned by another blueprint filename. Deleting a retained packet is also rejected by the submission workflow. Historical acceptance of the parts does not certify supplier replacements in the new graph.

Fresh reproduction with the final checkpoint:

1. Load `PrismaticCohomology.json`, then `PrismaticCohomology--PR.0.json` and `PrismaticCohomology--PR.8.json` from `research/blueprint/packets/`.
2. In scratch only, union `nodes` by `id`, `sources` by `id`, and `baseline.declarations` by `ref`, retaining top records first. Name the scratch packet `PrismaticCohomology.json`.
3. Import `scripts/check_blueprint.py` and call `check(scratch_path, None, world())`. Its result is `(errors, warnings, summary)`; inspect the complete list, since the CLI truncates the displayed errors.

Result: **379 nodes, 154 baseline declarations, 39 sources and 54 planets; 361 errors, all duplicate IDs, with zero other errors.** Of the duplicates, 282 point to PR.0 and 79 to PR.8. Eight inherited IDs resolve first to integrated decomposition nodes and escape this specific check. There are 408 inherited metadata warnings. This reproduction deliberately does not merge all sourceIssue verdicts, requests, gaps or review history and is not a submission candidate. The earlier nine-node reproduction gave the same 361 errors.

**Maintainer action before another four-file assembly attempt:** authorize a coherent assembly/part lifecycle. An explicit supersession relation should validate the roadmap, parts and ID preservation; checker resolution and promotion/import precedence should agree; historical reviews and source verdicts should remain accessible. Add regression checks for legitimate supersession, unrelated duplicate IDs, foreign-roadmap parts and dependency resolution. Adjust the issue’s deliverables and submission/intake scope for the chosen implementation. Merely permitting deletion does not address promotion or provenance. No such machinery was changed in this checkpoint, and no atlas data was edited.

## Mathematical progress in this run

The completion-ideal ambiguity is now resolved by explicit power bounds. For prime p, t=q−1, J=(p,[p]_q) and K=(p,t), the packet and reader give

- J ⊆ K and K^(p−1) ⊆ J, hence K^((p−1)n) ⊆ J^n ⊆ K^n;
- for q=(1+u)^p and ξ=[p]_(1+u), H=(p,ξ) satisfies K ⊆ H and H^p ⊆ K, hence H^(pn) ⊆ K^n ⊆ H^n.

The proof uses [p]_q=t^(p−1) modulo p, the exact identity t=uξ, and ξ^p=t^(p−1) modulo p. Thus the classical completion topologies agree, while the ideals can differ. For derived completion the reader invokes DD.1’s ordinary-quotient comparison only after checking its hypotheses. In A_inf(O_C), p is regular and the reductions of t and ξ are nonzero in the domain O_C^♭, giving regular generating pairs. This does not prove quotient completeness, a p-only framing, or arbitrary completed ind-étale lifting.

`PR.6/framed-q-automorphisms` now has three topology API entries and three additional tests: the p=2 equality, unequal cyclotomic ideals in Z_p[[u]], and the actual θ-kernel generator ξ rather than u. The suggested file states the two cofinal-power theorems, a representative classical AdicCompletion equivalence and the p=2 test using existing carriers, with admitted proofs. The pinned `Ideal.span` and `AdicCompletion` declarations were read and added to the baseline list; their carriers are imported, not re-planned.

Added `PR.6/completed-q-derivative-summability`, with six API entries and five tests. Its exact hypothesis is: for each f and n, all but finitely many ∇_s(f) lie in I^nE. It forms degree-i completed coordinate modules as the inverse limit of finite-support forms over E/I^nE. Decay makes every quotient differential a finite sum; regular quotient operators commute, wedge signs give d²=0, and compatible quotient maps give the completed complex and coordinate-injective chain maps. No interchange of cohomology with inverse limits or ordinary commutative DGA structure is asserted.

The proof supplies a sufficient uniform colon estimate `(I^(n+c)E : tX_s) ⊆ I^nE` together with eventual smallness of γ_s(f)−f. Standard completed polynomial and Laurent charts over Z[[t]] or Z_p[[t]] satisfy it with c=1, using finite-coordinate approximation and the associated graded ring. The generic commuting-operator carrier remains owned by AI.1; its exact request is extended rather than duplicating generic Koszul theory in PR.6.

The discriminating examples include f=Σ_r t^rX_r, whose derivative belongs to the completed direct sum but not the algebraic direct sum. The counterexample E=Z[Y,X_s^(±1):s∈N][[t]] lets each γ_s scale both X_s and Y by q. Its operators are continuous and satisfy the abstract regular q-data, yet ∇_s(Y)=Y/X_s never tends to zero modulo t. Thus individual continuity and regular divisors do not imply convergence of the family. Verifying decay and quotient completeness for the inherited ind-étale and q-PD-envelope consumers is still an explicit gap; R2 has not been applied.

## Source and library checks

Fresh public-PDF reading was scoped to the following arguments; no source files or passages were committed:

- Bhatt–Scholze, arXiv:1905.08229v4, Constructions 16.19–16.20, Lemma 16.21 and footnote 21, pp.114–115; Notation 17.1, p.117. The source’s completed direct sum motivates the explicit convergence check. The uniform colon criterion and counterexample are this plan’s derivations, not separately numbered source results. PDF SHA-256: `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.
- Scholze, arXiv:1606.01796v1, §3, pp.6–7 and §4, p.9: t-completed frames and the cyclotomic A_inf frame completed at (p,ξ). PDF SHA-256: `ce060b41e28fef16c011d3d3455c53a8bdc11cd8c98dc4dc6c2be178e1567273`.
- Bhatt–Lurie, arXiv:2201.06120v1, Corollaries 3.2.9–3.2.10 and §3.3, pp.42–45: affineness, the bounded transversal flatness condition, the full bounded-prism complete-module comparison and its boundedness warning. This run retains the previous formal-affine proof boundary.
- Bhatt Lecture V, Lemma 5.1, p.6 with its bounded-base convention p.1, and Koshikawa I, Propositions 3.1–3.2, p.13 and 3.6, p.15: general envelope existence versus the stronger regular-kernel conclusions. The transfinite realization and unbounded-base extension remain separate gaps.

Read the relevant reviewed AUDIT-38 coverage; `data/library-coverage.json` has no top-level PrismaticCohomology entry. Inspected current TauCetiRoadmap at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` read-only. AlgebraicVectorBundles already plans ordinary finite-projective/finite-locally-free equivalence; DGAInfinity plans DG/A∞ algebra and module interfaces. Neither supplies the missing formal complete-module equivalence. The current Fargues–Fontaine quotient source does not supply schematic bundle classification. No lake command was run in those trees.

## Preserved obligations and continuation

The 369 inherited targets, 54 planets, 91 sourceIssue verdicts and historical reviews still need preservation in the effective assembly. R1–R7 remain proposals. The historical top-level independent review concerns its previous seven-node version; this run did not rewrite it or mark new work reviewed. All nine coverage entries remain partial and all implementation statuses remain unchecked.

After the scope decision:

1. Serialize the effective graph using the authorized lifecycle, preserving canonical IDs and reconciling source editions, review history, sourceIssue verdicts, supplier requests and gaps. Remove inherited excerpt fields rather than copying them into the assembled artifact. The blocker reproduction’s first-record union is insufficient for this.
2. Establish the general-envelope transfinite delta torsion-removal/completion argument, its terminal discreteness and smallness. General existence gives neither boundedness nor flatness; the unbounded-base prelog target and QRSP regular-presentation reduction remain separate.
3. Refine bounded-prism unbounded formal-QCoh effectivity and coherent complete-module operations. SAG Theorem 8.3.4.4 is connective; do not cite it as the unrestricted statement. BL Corollary 3.2.9 gives affineness and Corollary 3.2.10 gives bounded transversal flatness, in that order.
4. Use the new q-topology bounds and decay criterion, but verify quotient completeness and uniform division/decay for each completed ind-étale and q-PD-envelope consumer before applying R2. Individual regularity alone is insufficient.
5. Apply only justified R1–R7 supplier changes. Retain the trace-defined/prismatic syntomic comparison, integral A_crys/de Rham interface, and Fargues–Fontaine schematic/analytic/Robba construction-matching gaps. AdicSpaces is not the bundle-classification theorem.
6. Recheck the full graph and current compact suggested file, and submit a completed revision only after the effective artifact satisfies the independent review.

## Validation

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**; 10 nodes, 55 API entries, 32 tests, 8 gaps, 7 requests and 9 baseline declarations.
- `lean-check research/blueprint/suggested/PrismaticCohomology.lean`: **exit 0**, 26 warnings, all from `sorry`, and no other warning or error. Memory was checked first: 93 GiB available. The file is 317 lines.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PrismaticCohomology.lean`: exit 0.
- Intake file checks: four deliverables, zero problems. `git diff --check`: passed. No retained part, checker, workflow or promoted data file was edited.

Scratch is deleted after the checkpoint PR is opened. All continuation information needed from this run is recorded here. The blocking condition is scope and lifecycle, not expiration of the eight-hour run allowance.
