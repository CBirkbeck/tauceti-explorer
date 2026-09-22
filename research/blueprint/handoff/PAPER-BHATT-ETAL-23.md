# PAPER-BHATT-ETAL-23 handoff

Codex session `codex-a71f92`, issue #1444, 2026-09-22. **Partial checkpoint; no Lean implementation.**

## Completed

Read the entire published159-page paper, all proofs and bibliography. Image-checked the formulas on pp85,88,101,128,154,216. Read selected original Bhatt, Patakfalvi and CT20 proofs, including the whole CT20v3 erratum. The source hashes, exact read scope and uninspected interiors are in the result's readingLog and human report.

Produced271 items with554 resolved acyclic dependency edges;7 library groups,11 planned interfaces and253 missing items. All missing items route exactly once. Sixty definition/construction entries have180 mathematical planning tests and use-derived API obligations. Twenty-one open gaps propagate to downstream consumers.

Read pinned declaration statements and relevant roadmap/audit contracts. Screened40 paper route sets and refreshed5 changed results at `a57390347a3ba27adb18b8f465a89a7755c5c1e9`. Preserve the generic owners: Jacobian J-C coherent base change, StableReduction Layer2 Proj, DD.1 derived completion, Q0 integral perfectoid algebra, LPV.3 pencils, LieGroups Layer2 closed subgroups. The compact-component argument remains a missing adapter. Pending proposals remain missing.

## Continuation 2026-09-22 (Claude Code, session `cc-fb70e5`)

This continuation checked the diagnostics at their locators in the same published PDF (SHA `a07fcb79…`), with page images for E1–E5, and collated them with arXiv v1, v2 and v3. It recorded seven source mistakes under `sourceIssues` in the result; none has a published correction.

- **E1, Lemma 2.56 (error):** "converges to k" is false. The two-blowup counterexample is verified; both the intersections and the chart exponents were rechecked by machine. The uniform lower bound ε ≥ k − γ for δ < γ/max|D·F_j| is proved in `seshadri-lower`. Proposition 8.15 uses only the correct first assertion, and Claim 8.21 only the lower bound with k = 3.
- **E2, Proposition 6.28 (misprint):** the published resp. conclusion reads "globally +-regular". v1 has "purely", v2 has "completely purely", and v3 has the garbled "( ly". The completely-pure version is proved in `pure-birational-repair`: completion, then a connected component with complete local H⁰, then Proposition 6.26 and Lemma 4.27. Theorem 7.14 is covered.
- **E3, Lemma 4.28 (misprint):** the twist sign; use f*(K_X+S+B−M).
- **E4, Theorem 9.28(c) (misprint):** strict should be ≤ 4d.
- **E5, Theorem 10.6 (misprint):** 393 should be 373; the proof's conditions hold for all p > 373.
- **E6, Theorem 2.13/Proposition 2.14 (error):** T must be nowhere dense.
- **E7, Definition 2.19 (error):** |D| must be nonempty. In E6 and E7 every consumer in the paper is unaffected.

The gaps gap-seshadri-limit, gap-pure-birational, gap-adjoint-sign, gap-cone-length, gap-moduli-bound and gap-empty-system are resolved and removed from every item's blockingGaps. gap-resolution-centres stays open: the original CP19/CJS20/KW21 hypotheses are still unread. That leaves 15 open gaps. Items, routes and counts are otherwise unchanged. The published PDF was a local copy with the recorded SHA; Springer blocks scripted downloads.

## Resume in this order

1. Done in the continuation (E1, E2; see above). A reviewer should check E1–E7 at their locators.
2. Resolve the remaining exact source issues (2.19, 2.13/2.14, 4.28, 9.28 and 393/373 are done as E3–E7): rounded-Weil adapter 4.20; 9.33/9.34/9.36 supplier/scope corrections; CP19/CJS20/KW21 original hypotheses; Kollár all-powers base-change condition on stable limits; CT geometric connectedness and corrected dependency.
3. Acquire the integral Bhatt–Lurie construction and read Bha20's §4 geometric heart and §6.1–6.5 graded arguments. Already read2.17/2.18,3.4–3.12 selected statements/proofs,5.1,5.11,5.15–5.17,6.28. Avoid BMP2.9 circularity through the BMP-dependent Cor5.17 footnote.
4. Close HH92/Bha12/MS21/MST22/Hochster/Smith; then exact surface/equal-characteristic/characteristic-zero MMP inputs and positivity/descent. Reuse earlier partial PAPER-WITASZEK-22 and PAPER-SCHROER-23, not duplicate plans or assume they are accepted.
5. For moduli close HK boundedness, Kollár hulls, Eke, Saito, BK/Liedtke, Pat1.3/1.4, PX15/FR06/Rydh. Pat18 exact functor,9.7 and§11 are read. Match AP22 published Theorem B to the read author Cor4.4/4.5; NSF published PDF timed out.
6. Split bundled predicates (singularities, models, F-singularities) and multipart theorems (RH3.4(4–6), ind-CM2.17/2.18,9.16a/b). Expand every residual 'Setting' reference into full quantified hypotheses; regenerate API/tests/reverse uses/dependencies and propagate all gaps.
7. Re-audit ownership and every route against fresh main. There are15 routes,6 Part II proposals. Four reuse prior pending IDs (birational, positivity, numerical-Picard, arithmetic-presentation); integral RH and stable surfaces are new proposed extensions. Do not duplicate any supplier accepted in the meantime.

## Submission checks

Repository `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-ETAL-23.result.json` plus supplemental structural audit and exact rational/chart arithmetic. Refer to the result's checks for final outcomes. No packet or Lean file is this issue's deliverable, so no Lean elaboration is claimed.

Keep status partial until exhaustive, atomic, source-faithful transitive closure is achieved. The report distinguishes author statements from worker counterexamples and proposed repairs; none is an author-approved erratum. Only edit this issue's result, report and handoff plus your own scratch.
