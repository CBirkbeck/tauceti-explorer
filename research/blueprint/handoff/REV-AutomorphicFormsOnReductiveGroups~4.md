# REV-AutomorphicFormsOnReductiveGroups~4 handoff

Completed independent review for #10110 by Codex, session `codex-2RmeW7`, 17 October 2026. Branch: `codex-2RmeW7-review-automorphic-r4`. Claim was confirmed by the bot at issue comment 6232117401. The input is blueprint revision 4, commit `e7e31fb6e`, PR #10122. This worker did none of the four blueprint inputs.

Verdict: **accepted at target level**. The current review is `independent-review-REV-AutomorphicFormsOnReductiveGroups~4`, with a complete 100-node ledger. The old round-3 verdict is preserved in `reviewHistory`. This is a finished review, not a checkpoint; no required part of this job remains unfinished.

The packet still has 100 nodes (26 definitions, 25 constructions, 49 theorems), 311 API items, 30 planets and 57 baseline declarations. There are now 213 specified Checks, including a new finite permutation counterexample. All seven stages remain planned, none closed, all implementation statuses unchecked. All 43 requests, 23 gaps, 36 source records and 19 source-finding records remain; no original-proof gap is claimed solved by an admitted signature.

## Corrections and evidence

Five node records were corrected, with matching reader edits:

- Uniform moderate growth: R(y)f(g)=f(gy) transports finite level J to yJy⁻¹. The API had the inverse conjugation. A proved S₃ example distinguishes the two; no extra theory or carrier was constructed in Lean.
- Algebraic weight: restored k≥2 to the GL₂ Sym^{k−2} dimension Check and acceptance clause.
- BHR: fixed c before choosing R in the intended local declaration, matching the mathematical hypotheses. Its arithmetic threshold remains chosen before every weight and representation.
- Ordinary algebraic modular forms: the stabilizer proof now explicitly uses the compact-mod-A_∞ and discrete-rational-centre hypotheses and arithmetic discreteness.
- Central-character algebraic modular forms: class-set finiteness follows from AA's ordinary finite class set by quotienting; effective stabilizer finiteness and coefficient descent remain the separate requested theorem.

The revision's former BHR blocker is resolved under the binding 12 October Suggested-file shape rule. All three complete mathematical contracts belong in the README because their native carriers are absent at the pins. They separately specify arithmetic discrete occurrence, local essential unitarity and arbitrary-irreducible H⁰/tempered classification. The elementary root-wall Lean predicate is not presented as their proof or replacement. The stale reader conclusion that parts (i) and (iii) were missing was corrected.

The full review report records the source and ownership assessment and all 100 individual checks. Fresh direct readings were BCGP21 arXiv v3 §3.10 pp.70,72–73; Pilloni author edition pp.107–108, Theorem 15.2.2.1 and specialization; Pitale–Schmidt arXiv v1 §§2.1–2.4 pp.3–7; Calegari–Geraghty arXiv v1 §§2.0.1–2.0.2 pp.6–9 and §5.3 pp.21–23; Borel–Jacquet Corvallis I §§1.1–1.5 pp.189–191; Flath pp.179–182. Cleared Corvallis/Pilloni files were read in place and never copied. The remaining earlier reading provenance and source-issue verdicts remain attributed to their preceding workers, not represented as fresh original-proof audits. No other copy of an uncleared book was used.

## Libraries and shared ownership

All 57 cited baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The Mathlib source checkout was at its pin; all ten cited Tau Ceti modules in the shared environment matched their pinned Git objects byte for byte. Existing low-degree cohomology, Lie differentiation, compact averaging, highest-weight theory and modular forms retain their actual scope and hypotheses.

The current read-only upstream roadmaps and Tau Ceti were screened for duplication; their inspected heads were respectively `0d144d044dacebca17b654695b6f1ad58f159b27` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No upstream file was edited and no lake command was run there. The relevant current DifferentialGeometry, RealAlgebraicGeometry, OperatorTheory and IntegralLattices interfaces are suppliers, not new AF foundations.

The recorded ALS #871 head still matches `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd`; AS #925 still matches `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2`. Their real-point/cochain/automorphic/weight/Kostant and nested-integration/full-discrete-spectrum contracts were read. AF owns compatibility and its finer API rather than parallel constructions. AS's residual occurrences are included, while its Wallach cuspidality theorem retains separate hypotheses. Local RG models still do not supply global reductive spreading-out, and algebraic integration/descent still requires its exact supplier exports.

No ownership was moved in this review. The four historical restructuring proposals and the revision's newer supplier-contract overrides remain. The internal 100-node graph has 225 edges and is acyclic; the combined supplier stage graph still needs the documented prefix/application splits before an acyclicity claim. The queue already records a later revision round; it was not edited by this worker. The maintainer/intake can reconcile that scheduling with this accepted review.

## Validation and next work

- Packet validator: `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json` — 0 errors, 0 warnings.
- Suggested elaboration: `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean` — exit 0, 30 warnings, all `declaration uses sorry`. The file has 364 lines and no admitted data definition. The new S₃ example is proved. Memory exceeded 20 GiB before each elaboration; no Lean language server, build, update or cache command was used. No compilation remains running.
- Independent packet/reader comparison — every statement, hypothesis, proof route, acceptance clause, API statement, Check and BHR intended contract agrees. Internal DAG and complete unique 100-node review coverage passed.
- `git diff --check` — passed.
- `python3 research/blueprint/intake.py check-files` on the five deliverables including this handoff — passed.

Future work is the retained proof/supplier refinements and upstream packaging/integration under the programme's scheduling. It is not a continuation needed to finish this review. In particular, do not treat acceptance or successful elaboration as closure of BHR's original proof, relative Ext, homogeneous quotients, Harish-Chandra spectral kernels, reductive integration, rational descent or effective stabilizer inputs. The source ledger and report contain the durable locators; scratch downloads and logs are not needed by the next worker and are removed after submission. This run takes no second issue.
