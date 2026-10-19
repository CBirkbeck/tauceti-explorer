# REV-MotivesAndAlgebraicCycles--MC.7

Issue #10804; Claude, session `claude-0tXYQo`, 19 October 2026. The bot
confirmed the claim. This is a complete independent review of session
`codex-JD3HRJ`'s plan (#10833, PR #11076), not a checkpoint.

**Verdict: accepted after in-place corrections.** MC.7 remains planned, not
closed or implemented.

## Delivered

- **Report:** `research/blueprint/reviews/REV-MotivesAndAlgebraicCycles--MC.7.md`
  gives the counts, corrections, spot checks and orchestrator questions.
- **Packet:** `research/blueprint/packets/MotivesAndAlgebraicCycles--MC.7.json`.
  - The review object is `independent-review-REV-MotivesAndAlgebraicCycles--MC.7`.
  - It records 50 per-node verdicts: 38 corrected, 12 verified, none added.
  - The packet has 72 API items, 48 tests and four planets, plus the two
    retained ones. There are nine confirmed baseline declarations, 12 gaps and
    13 requests (16 before).
  - Source issue E-MC7-1 has a confirmed verdict.
- **Reader:** `research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.7.md`,
  regenerated from the corrected packet with the plan's own format.
- **Suggested file:**
  `research/blueprint/suggested/MotivesAndAlgebraicCycles--MC.7.lean`.
  - It gains the API theorem `rationalClassesOfType_wrong_weight` and the
    proved simp lemma `mem_rationalClassesOfType`. The latter replaces the
    redundant API item `rationalClassesOfType_ext`.
  - `lean-check` exits 0, with only the three expected admitted-proof warnings.

## Main corrections

- **Li–Liu Theorem 1.5.** The set condition is the printed |R∩V_F^spl|≥2,
  read from the rendered author copy, p.5. The plan's statement carried a
  text-extraction corruption.
- **Li–Liu hypotheses.** Hypothesis 4.5 is quantified over every open compact
  level. Hypothesis 6.6 has its exact condition on π̃∞.
- **Kleiman.**
  - B1 keeps the surface hypothesis dim H¹ = 2 dim Pic⁰.
  - The surface case of the Hodge standard conjecture in every characteristic
    (§5 p.17) is added to the register as Hdg2.
  - The B node is identified with θ(X), equivalent to B(X) by Theorem 4.1(3).
- **Locators.** Seventeen locators were corrected.
- **Suppliers.**
  - Stage citations are replaced by exact supplier nodes, mostly from packets
    merged after the plan was written:
    - MC.0: universal support, diagonal decomposition and vanishing, quartic
      universal support, intermediate index;
    - MC.2: realizations, comparisons, quotients;
    - the base packet's MC.4 nodes;
    - C3 and C5;
    - SF.2–SF.5;
    - DWP.9 hard Lefschetz;
    - the two R28.4 nodes.
  - R-MC0, R-MC4 and R-FALTINGS are withdrawn.
  - R-MC2-EARLY, R-C5, R-SF2, R-SF4 and R-SF5 are narrowed.
  - Request consumer lists now match the prerequisites.

## Checks run

- `TAUCETI_BASELINE=<baseline> python3 scripts/check_blueprint.py` on the
  packet: 0 errors, 0 warnings, after rebasing onto `ecf034611`.
- `lean-check` on the suggested file: exit 0, with only the expected
  admitted-proof warnings.
- An all-packet node-level cycle scan, with and without atlas stage
  `requires`, finds no cycle through MC.7.
- Every prerequisite id resolves. Every bare stage citation is covered by a
  request whose consumers cite it.
- The reader renderer reproduced the original node, request and gap sections
  byte for byte before regeneration.
- Hashes of all fourteen sources matched the packet.

## Remaining work, for the next jobs

The packet's coverage `remaining` list is exact. Closure needs the 13 requests
and 12 gaps. The most structural of them are:

- the unregistered owners behind G-TOPOLOGY, G-QUADRATIC and G-AIP;
- R-MC2-EARLY, the DM_gm realizations. Decide whether MC.2, MC.4 or MC.5 owns
  them; MC.5 has a Betti realization over Q only.
- R-MC6, Deligne's Tannakian criterion for a fibre functor over an extension
  field. Accepted MC.6 still plans only the neutral case.
- the single SF.4 imposed-point Bertini extension, which MC.0 (MC0-R2) and
  MC.7 (R-SF4) both request.

MC.0's gap G1, the varying-support adapter, sits under the MC.0 nodes now cited
by `real-unramified-cycle-defect` and `quartic-threefold-torsion`.

At assembly, follow the packet's `assembly` and `retainedTargets` records
unchanged: six planets, with the old C, D, smash-nilpotence and combined
standard-conjecture planets removed.

## Sources and notes

- All sources are public, and their URLs and hashes are in the packet. No
  restricted copy was used.
- The Kleiman scan was read as rendered page images.
- No source passage was put in the repository.
- No issue comment, pull-request text or fetched page contained instructions,
  and nothing suspicious was encountered.
