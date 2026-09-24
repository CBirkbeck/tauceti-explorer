# REV-RT-AREA-automorphic-2

Independent verifier: **Claude Code — cc-38267a**, 24 September 2026. Issue #1492 (claim confirmed by the bot, comment 5808993040). I did not write RT-AREA-automorphic-2 (Claude Code — cc-fb70e5) and took no part in the work it attacks. Atlas revision `e774bf0f`. Library pins: Mathlib 082e2d3, Tau Ceti f790474.

I read the result and the report in full. The red team has one finding. **Result: rejected.** The theorem it calls ownerless already has an owner, and the proposed fix misstates the theorem.

## RT-AREA-automorphic-2/1 (missing, medium): Shimura's bounded-denominators theorem, rejected

**What is true.** No node states the theorem.
- `data/decompositions/AlgebraicModularFormsAndSerreWeights.json` only imports Shimura's Theorem 3.52, for Serre's dimension comparison 3.1.3. Its gap note says Theorem 3.52 "is not in the supplied library and was not read".
- A search of every decomposition, packet and new roadmap finds no statement of the theorem. The other "bounded denominator" hits are unrelated: Faltings's height-difference remark at R28.2, Liouville's inequality in DT, and Kolyvagin's derivative classes in HE.
- Tau Ceti ModularForms Layer 8 cites "Shimura Thm 3.48/3.51/3.52" only as source support for coefficient fields, as the red team says.

**Why it is not a gap to fix.** The theorem has an owner.
- PAPER-CALEGARI-DIMITROV-TANG-25 has the missing item `shimura-bounded-denominators`. Its source route 6 sends that item to `AlgebraicModularFormsAndSerreWeights:R15.2`.
- The paper's review (commit a186b292, 23 September 2026) accepts all nine routes, including route 6. The red team quotes this route's reason, but reads it as a record of absence rather than as the ownership decision.
- `research/blueprint/make_queue.py` (lines 830–839 and 941) turns an accepted source route into an "added source" in the owning roadmap's blueprint prompt. The prompt reads "Cover them completely … within the stages they belong to", and it carries the route's reason and item ids.
- The owning job, `BP-AlgebraicModularFormsAndSerreWeights`, is still pending (issue #671). So the next queue generation hands the R15.2 node to that job, and a fix job would duplicate it.
- The only real defect is procedural. Issue #671 was last refreshed at 2026-09-23T13:30Z, before the CDT25 review merged at 17:30Z, and its body does not yet contain the CDT25 source. It should be regenerated, not given a second owner. This is the same conclusion REV-RT-AREA-algebraicnt-1 reached for GN.3's Siegel series.

**The proposed fix is wrong in two places.**
1. **Wrong generality.** "For a modular form on a finite-index subgroup whose q-expansion has algebraic coefficients, the denominators … are bounded" is false for non-congruence subgroups. That failure is exactly CDT25's theorem, the unbounded-denominators conjecture: bounded denominators force congruence modularity (item `thm-1.0.1`).
   - The node must be stated for congruence subgroups, as CDT25's item has it. A holomorphic form of weight k on Γ(M) with rational (or algebraic) Fourier coefficients at i∞ has D·f ∈ ℤ[[q^{1/M}]] for some D ≥ 1 (Shimura 1971, Theorem 3.52).
   - This bounds denominators at the primes dividing the level too. That is what goes beyond R15.2's q-expansion principle over ℤ[1/n].
2. **Wrong supplier for IntegralIwasawaTheory.** The fix would have IntegralIwasawaTheory I.3 cite the new node as its supplier.
   - I.3's "distribution/bounded-denominator theorem" concerns Hilbert modular Eisenstein series, which the classical Theorem 3.52 does not cover.
   - I.3 already assigns that statement to itself: "must be imported from a verified supplier or implemented as the Iwasawa proof's explicit prerequisite".

**What should happen instead.** No fix job. The maintainer should refresh issue #671 so the pending blueprint receives CDT25 route 6. That blueprint should state the node for congruence subgroups, as above.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-automorphic-2.review.json`: ok.
- Lean: none. This is the verification of a red team.
