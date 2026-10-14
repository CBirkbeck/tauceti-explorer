# REV-TorsionCohomologyInfrastructure handoff

Completed independent review for issue #498 by Codex, session `codex-DnNNA5`, 2026-10-14. The author session was `codex-bMkPh3` (PR #9689). This is a complete review submission, not a checkpoint. No second job was claimed.

**Verdict: needs_changes.** All 38 packet nodes were checked: 17 verified and 21 corrected. All 11 baseline declarations were read at Mathlib 082e2d3 / Tau Ceti f790474 and confirmed. The packet remains a complete target-level pass with five planned stages, zero closed stages, 17 precise supplier requests/adapters and no hidden closed-proof claim. It now has 37 API items, 27 definition/construction checks and 23 planets. All 53 assigned extraction items are routed. Its 18 source findings have independent verdicts: 17 confirmed, one rejected.

The review report gives the mathematical reasons and all required follow-up edits. The only remaining acceptance blocker is the reader, which issue #498 excludes from its editable deliverables. It still has the wrong cyclotomic tower/ramification set and determinant factorization input, compact Laurent gluing, premature deletion of the weight-zero factor, an unjustified map to the full boundary action ring, an incomplete integral surjectivity argument, and reconstruction over the full local Hecke ring instead of its nilpotent quotient. It also needs the corrected chart example, APIs, locators and source verdicts. Do not promote the packet with that reader. Route the twelve reconciliation steps in the report to an issue allowed to edit the reader, then check agreement before acceptance.

The corrected packet supplies the exact replacements. No supplier implementations or upstream modifications are needed to finish that reconciliation. Supplier requests remain future implementation work; they are not grounds to implement another roadmap during this review. The new IHG.1 request is Chenevier Lemma 3.8, §3.1, p.43: continuous determinant deformation over a profinite local coefficient algebra factors through the quotient with pro-p residual kernel. The IHG.5 adapter imports current upstream's arbitrary-family common-exponent nilpotence theorem; it must not be planned again. The older atlas finite-family node is insufficient for the infinite product.

Two source findings were added. E17 is the already-known overlap-condition reference slip in Scholze p.954, replacing the rejected E1 localization allegation. E18 is a neat-level Heisenberg-lattice counterexample to the exterior-power identification in the CLH author PDF, Remark 3.1, p.8. The latter is scoped to the hashed author version: the publisher returned access HTML and no journal collation is claimed. All source URLs, read dates and SHA256s survive in the packet. No verbatim source passages were added.

Current roadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti main a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were read without edits or Lake operations. Existing upstream IHG, bundle and pro-p work stays imported. The five assigned red-team constraints were verified and retained. The construction order puts the early TC.2 ideal-colimit before TC.1 approximation; all 58 internal edges respect it. Recursive concrete-supplier traversal found no cycle among 2,966 reachable nodes; stage references are still planning boundaries. Early TC.3 algebra has no reachable TC.2/AG2 edge.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/TorsionCohomologyInfrastructure.json`: zero errors, zero warnings. Baseline source inspection supplements the checker's form-only validation because no declaration index was supplied.
- `lean-check research/blueprint/suggested/TorsionCohomologyInfrastructure.lean`: exit zero at the pinned shared build, 122 lines, 13 proof-placeholder warnings and no other warnings/errors. One light real-bodied definition; no placeholder data. Added only factor-swap compatibility and the Z/9 nonunit diagnostic. Elaboration checks types, not proofs.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/TorsionCohomologyInfrastructure.lean`: exit zero.
- Source-issue shape and source-version validation: exit zero.
- `python3 research/blueprint/intake.py check-files` on the packet, suggested file, review report and this handoff: zero problems.
- `git diff --check`: clean. The reader and all other roadmaps remain untouched.

Only the issue's three named deliverables and this own handoff are submitted. The review report and packet retain every finding and continuation instruction needed after the source downloads and scratch notes are deleted at PR opening.
