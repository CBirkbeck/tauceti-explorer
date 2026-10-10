# REV-PKG-ErdosProgressionPowers — complete

Agent: Codex, session `codex-SWwog8`, 2026-10-10. Refs #7603.
The [claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7603#issuecomment-6098502216) identifies this session. The issue was reread after confirmation. This session did none of PKG-ErdosProgressionPowers and claimed no other job.

## Result

The independent package review is **accepted**. The report is `research/blueprint/reviews/REV-PKG-ErdosProgressionPowers.md`; the machine-readable verdict is `research/blueprint/packages/ErdosProgressionPowers/review.json`.

The package preserves every accepted target: 49 targets, 56 named API contracts and 59 discriminating tests across EP.0–EP.7. Each definition/construction with an API has at least three tests. The README is 104,442 bytes and has hypotheses, prerequisites and printed-page source locators for every target. It contains mathematical specifications without packet/job/review history. Metadata remains exactly `topic = "math.NT"`.

Two clear package defects were corrected:

- `case_partition_mem` previously stated only Case I membership, although its contract promised both cases. Its signature now gives both equivalences; each requires membership in `ap_triples k`. The README contract states the same guards.
- The coefficient-prime bridge's citation lacked printed pages. It now identifies BS20 §2, Theorem 4, p. 360; §3.1, Lemmas 3.2–3.3, pp. 361–362; and §5, Lemma 5.1, p. 365, explicitly describing the comparison as an adapter.

The accepted packet and reader document were not edited. No generic supplier target was moved or replanned.

## Verification

- Final `lean-check research/blueprint/packages/ErdosProgressionPowers/Suggested.lean` exited successfully: zero errors, 140 `declaration uses sorry` warnings, no other warnings. Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. These are admitted signatures/examples, not implemented mathematical tests.
- An auxiliary scratch file used the actual triple-set and partition definitions and proved the corrected conjunction with `classical`, `simp [case_partition]` and `tauto`, without admissions. Its final `lean-check` passed without warnings. No scratch artifact is required for the next worker.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ErdosProgressionPowers.json`: zero errors and warnings.
- Target/API/test inventory, every target's hypothesis/prerequisite/page-locator blocks, JSON, metadata and whitespace checks pass. The only named API omitted from Lean remains the explicitly described generic-Frey compatibility.
- Read the 24 cited declarations at Mathlib's pin and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including the nonzero-factor hypotheses of integer valuation additivity, native character conductor and elliptic j/trace conventions. Checked current TauCetiRoadmap main and Tau Ceti for overlap, including the newer roadmaps; used ArithmeticDirichletSeries and JacobianChallenge as upstream form examples. Checked the generic/progression boundary against the named supplier contracts, particularly LG.0–LG.5 of EllipticLegendreCharacterInterfaces. No direct ErdosProgressionPowers row occurs in the reviewed library audit.
- Checked the critical BS20 arithmetic/modular, character, sieve and addendum passages and DG95 Corollary 2.1 and its proof, pp. 520–521. The public PDF hashes match the accepted sources: BS20 `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf`; DG95 `2a77462524aebdce6a34c540e99afb3913c2c6113b597af9792bed6c82376aca`. The package links the publisher/author versions. No source file or passage is committed.

Final Suggested.lean SHA-256: `011603de7236466b14a5129718b16ebd4eaa320a3e939b11e257a2b3d7bb661a`.
Final README SHA-256: `d5e3a65dae8af7d6db1217aeb79dc270baa16c550f08a93fc7edacc021976e38`.

## Remaining implementation obligations

No package-review work remains. The package can proceed through intake; the maintainer controls upstream submission and dependency readiness.

Acceptance does not close the plan's proof obligations. Ten geometric target signatures, generic-Frey compatibility and the local/conductor clauses are deliberately omitted from the native prototype under the prototyping rule, with their full mathematical contracts retained in the README. Implement them using the actual supplier APIs. Primary quantitative analytic certificates, the precise quantitative Roth proof, signed diagonal-curve smoothness/connectedness and primitive-lift finiteness, and the computable cutoff ledger remain required. The conjecture and smooth-multiplier announcement are not asserted theorems; fixed-length finiteness does not promise effective enumeration of Faltings points.
