# FIX-RT-AREA-finitefields~2 — completed

Issue #6208. Codex — `codex-pwZxBT`, 19 October 2026. The claim was confirmed by the bot at 12:13:46 UTC. This is a complete submission for the issue's editable scope, awaiting `REV-FIX-RT-AREA-finitefields~2`; it is not a checkpoint or an independent acceptance verdict.

## Delivered

- Revised both allowed parent packets, readers and suggested Lean files, and wrote `research/blueprint/redteam/RT-AREA-finitefields.fixes-2.md`, with a disposition for every assigned finding (/1–/14, /17 and /18).
- Moved sixteen elementary census targets and seven shared linearized-polynomial targets to FF.0, preserving their legacy identifiers and reader anchors. Added the native intermediate-field/divisor correspondence, its source/proof route, four API statements and four tests. Recorded eight additional verified library declarations.
- Removed nine misrouted BKK targets from FF.1 and documented their exact PM.0, AC.0 and FA.2 owners. Kept the elementary census and modulus-T special case in FF.0.
- Made multiplicative degeneracy require a nonzero scalar times an exact-order power over the algebraic closure, with concrete cubic-character controls over F₇. Strengthened the all-extension curve-bound supplier contract.
- Made CN.1's existing finite-field factorization transport contract explicit about checked presentation maps, nonzero input, constants, multiplicity and the separate zero case. Named the exact FF.3 suppliers and retained all 108 CN targets in the reader.
- Put the CN suggested file into the required statement-only shape: light definitions with actual bodies and milestones on existing carriers; heavy data/certificate/algorithm constructions remain detailed reader targets. It is 249 lines; the FF suggested file is 824 lines.

The FF parent now has 346 targets. Its four unchanged accepted follow-ups add 98, giving 444 unique reader targets. The accepted review objects and inherited reading receipts remain attributed to their original authors; both changed parents carry an explicit new `fixAudit` awaiting independent review. No stage is claimed mathematically closed.

## What remains outside this issue

The report's “Atlas and owner handoffs” section supplies the exact transactions and old-to-current target map. The maintainer or the authorized owner jobs must:

1. Register the elementary/bound refinements of FF.3 and FF.4, rebind their consumers and FF.5's direct suppliers, then replace the coarse atlas edges and recompute depths. Exact target prerequisites have been corrected; the registered atlas graph has not been changed.
2. Move the existing follow-up `FF.4/frobenius-ore-polynomial-comparison` to FF.0 before binding the shared export to DM.0. That follow-up packet was outside the deliverables and is unchanged.
3. Register the single GOS Part II owner after EDC.2, including the coefficient passage and geometric equal-characteristic Swan prerequisites. Preserve the separate Weil I compactification/local-constancy/resolution obligations.
4. Reconcile the authored EXT-08 packets, decisions, queue and promoted decompositions through the supported pipeline, preserving `integrated_partial`, genuine gaps and deferred links. Do not replace the finer finished blueprint by the old coarse extraction.
5. Correct FA.7's historical factorization ownership, retaining its function-field services and the qualified zeta-numerator assembly. Update the BKK extraction routes and source registry using the report's item/owner/locator table.

These are explicit scope handoffs, not undocumented completed edits or newly available stages. No foreign packet, atlas data, source registry, queue or upstream repository was edited.

## Evidence boundaries

Fresh primary-source receipts in the FF parent cover Shoup v2 Theorem 19.4 and Theorems 19.10–19.14 with the relevant exercise; Weil I 8.4–8.13; Wu–Liu v2 §2.1; and the specified BKK v3 ownership passages. Each receipt records its URL, reading scope and date, with a fresh PDF hash where obtained. Other source receipts are inherited, not a fresh proof audit of the whole roadmap. No private library source was used. New text states results in our own words.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the cited declarations were read at those pins. The current upstream roadmap checkout at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected as well, including coding, local Galois groups and finite-field theory. No build ran in either current checkout.

## Validation

- `python3 scripts/check_blueprint.py` on both changed packets and all four unchanged FF follow-ups: every packet reports **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean`: **exit 0**, 86 warnings, all declaration-uses-`sorry` warnings.
- `lean-check research/blueprint/suggested/ComputationalNumberTheory.lean`: **exit 0**, 66 warnings, all declaration-uses-`sorry` warnings. The two files were checked sequentially after memory checks.
- `python3 scripts/check_sorry_data.py` on both suggested files: **exit 0**; no admitted data definitions.
- `git diff --check`: **exit 0**.
- `python3 research/blueprint/intake.py check-files` on all eight submitted paths: **0 problems**.
- Additional structural checks: the joint 552-target FF/CN internal prerequisite graph is acyclic; every FF.0 target avoids FF.2 ancestors; factorization soundness/completeness, certified factorization, Hensel and Rabin-generation closures avoid FF.2/DWP/EDC/WC suppliers; all named CN finite-field providers resolve. All 444 FF reader IDs match the five FF packets, anchors are unique, local fragment links resolve, and removed targets have no remaining FF/CN prerequisite consumers. Every CN target remains in its reader. Each assembled FF layer has at most six planets.
- Exact arithmetic over F₇ checks the added cubic-character exponent counts `(2,2,2)` for X² and `(0,6,0)` for 3X³, and verifies that 3 is not a cube.

No standalone link map, restructuring-result JSON or paper-result JSON changed, so their dedicated checkers are inapplicable. The embedded restructuring proposals were checked with their parent packet. Lean elaboration establishes type correctness of admitted planning statements, not their proofs.

Resume at the independent fix review, using the report and these validation boundaries. This worker stops after its one pull request.
