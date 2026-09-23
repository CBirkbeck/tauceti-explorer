# PAPER-BRESCIANI-24 continuation checkpoint

Codex — `codex-a71f92`, issue #1233, 2026-09-23; continues PR #2032.
**Partial.** Proposed replacement proof, not independently reviewed.
No Lean file or formalization is claimed.

## Completed

- Independently reread the full 22-page published paper.
- Read Stix 1203.3236v3 pp.1–4 (Theorem B and Proposition 1 with proof);
  Schmidt 1503.08108v1 pp.1–2 and §3 pp.7–9 with complete proof.
- Added /169–/179: finite Kummer/Galois baseline imports, p-adic power
  separation, nonsplit local point injectivity, mixed Chebotarev places,
  restricted diagonal unramifiedness, finite-level regularity, valuation parity,
  and a proposed noncircular number-field parabolic repair.
- /177 does not use /81, /96, Proposition 22 or Theorem A. The number-field
  branch of /81 now has an explicit replacement relative to the source inputs.
- Preserved /1–/168, all seven unreviewed source findings and all 14 routes.
  Now 179 items: 12 library, 10 planned and 157 missing, each routed once.
- Reused the existing birational Part II and R02.1. /173 imports the upstream
  Chebotarev layer; /176 takes a support hypothesis so the foundational owner
  does not import its anabelian consumer.
- Normalized /154's inherited test kind `example` to `computation`, unchanged
  statement. Earlier API/test contracts remain attributed to their authors.

## Resume

1. Independently examine the proposed proof /169–/179 and the detailed report.
   Check especially finite-level evaluation of the unramified Kummer class and
   use of local Selmerness only on hyperbolic curves over number fields.
2. Supply a noncircular nonsplit parabolic reduction over **all finitely
   generated fields**, needed by /96 and /112. Do not use Proposition 22 to
   manufacture its own quasi-t-b.l. hypothesis or base-change a birational
   witness through a transcendental completion without justification.
3. Expose the remaining local-field finite-quotient/separatedness, finite
   Kummer torsor comparison, Chebotarev fixed-coset/completion and specializing
   loop functoriality/evaluation interfaces as blueprint leaves.
4. Obtain Stix book Proposition 75/Lemma 259, Tamagawa Proposition 2.8(iv)
   and Koenigsmann original. Finish density/coherence and recursive Schmidt
   Amitsur/Hilbert90/Hochschild–Serre and affine K(π,1) suppliers.
5. Retain the earlier Mattuck and Albanese replacement work; finish the
   supplier leaves beneath /155,/156,/163,/165,/166 and inherited structured
   API/tests and dependency edges. The 77 recorded edges are not the complete
   source graph. Pending Part II proposals are not accepted blueprint stages.

The P1_Q minus V(T²−2) example remains a valid counterexample to the printed
blanket cuspidality sentence, not to Theorem A. E2's older open-proof note is
narrowed by a proposed number-field proof, not a published erratum or verdict.

## Checks

- Paper checker: passed.
- Three-deliverable intake: 3 files, 0 problems.
- Structural ID/route/DAG audit: 179 items, 157 unique missing-item routes,
  77 acyclic recorded edges; no forbidden reverse-theorem dependency for /177.
- Exact finite diagnostics: 10,116 assertions; 673 structural assertions;
  10,789 total. Finite examples are not a proof of the general mathematics.
- Repository regressions: paper 9, paper queue 3, source findings 7, intake 29;
  all 48 passed. Earlier logarithm diagnostics were not rerun.
- No Lean file written or compiled.

Source URLs/hashes/read scopes are in the JSON `continuation`; the preceding
worker's provenance is retained in `continuationHistory` and the report.
Only the three authorized deliverables change. Submit `Refs #1233`; do not
manually merge, close, relabel or unclaim a submitted job.
