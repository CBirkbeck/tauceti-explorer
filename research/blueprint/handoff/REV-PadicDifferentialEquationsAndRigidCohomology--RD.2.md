# Handoff: REV-PadicDifferentialEquationsAndRigidCohomology--RD.2

Job: independent review of the RD.2 follow-up packet of *P-adic differential equations, rigid cohomology and p-adic weights* (issue #9752). Reviewer: Claude, session `claude-kAR8ZW`, 14 October 2026. The reviewed work is `BP-PadicDifferentialEquationsAndRigidCohomology--RD.2` (#9744, PR #9791), done by session `claude-VjNCXF`.

## Outcome

The verdict is **accepted, with corrections in place**. The `review` object is in the packet, and the report is `research/blueprint/reviews/REV-PadicDifferentialEquationsAndRigidCohomology--RD.2.md`.

- **Node verdicts:** 17 corrected and 3 verified, out of 20.
- **Baseline:** all 18 declarations confirmed; three `provides` texts corrected.
- **Source issues:** E-RD2-1 to E-RD2-9 confirmed, with two locators fixed. E-RD2-10, E-RD2-11 and E-RD2-12 added; all three are misprints that affect nothing.
- **Restructure:** one ownership proposal added (RD.6 restates two RD.2 theorems), and the completion-lemma proposal extended.
- **Reader:** re-rendered from the corrected packet. Every node section, §9, §10, §11 and §12 is regenerated, so the reader agrees with the packet.
- **Suggested Lean file:** unchanged. `lean-check` at Tau Ceti f790474 and Mathlib 082e2d3 elaborates it with no warning other than those for proofs left open.

The main mathematical corrections:
- The proof of D†(V) for finite local monodromy rested on a finite-group argument for an infinite group. It now descends the unramified part along K̂^unr/K first.
- The connection of Dwork's module had the wrong sign for its Frobenius structure, in four nodes. Kedlaya's Example 17.1.4 has the same slip, now recorded as E-RD2-12.
- Two missing prerequisites were added: quasi-unipotent-implies-overconvergent, and R01.3/conductor-unramified-base-change.
- A misattributed log-convexity citation was replaced.
- Hypotheses were aligned with what the suppliers actually provide: separable residue extensions, and K discretely valued.

## Checks run

- `python3 scripts/check_blueprint.py <packet> --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- `scripts/check_errata.py` on an errata-form copy of the packet's source issues: ok.
- In-memory `merge_blueprints` against `data/atlas.json`, with and without the first-pass packet: no error and no skipped links.
- `lean-check` on the suggested file: elaborates.

## For the next workers

- **Assembly of RD.2.**
  - The layer would show eight planets across the two RD.2 packets. Adopt the sub-layer proposal, or keep six.
  - Apply proposal (1): the first-pass node `tsuzuki-unit-root-finite-monodromy` cites `tsuzuki-equivalence-finite-local-monodromy`.
  - Apply proposal (4): move `RD.1/robba-residue-duality` to RD.2. Its review (#9751) accepted it in RD.1.
- **RD.6 review (#9756) or assembly.** `RD.6/highest-break-equals-ramification-break` and `RD.6/irregularity-equals-swan` restate `RD.2/matsuda-highest-break-theorem` and `RD.2/irregularity-equals-swan-conductor`; RD.6 should cite them.
- **Dwork's module conventions.** The packet now uses ∇v = −π_0 (df/dt) v ⊗ dt with F(v) = E(f)v. The first pass's `RD.1/dwork-exponential-module` is the dual module, with ∇w = −π_0 t^{−2} w and F(w) = E(t^{−1})^{−1} w. Keep the two apart at assembly.

## Sources

All sources were read on 14 October 2026, from the URLs recorded in the packet. The fetched files matched the packet's SHA-256 hashes. The second-edition errata list of Kedlaya's book was added to `sourceVersions`. No passage of any source is copied into the deliverables.
