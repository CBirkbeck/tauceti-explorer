# Handoff: REV-ClassicalArithmeticCompletion--CA.4

Job: independent review of `BP-ClassicalArithmeticCompletion--CA.4` (issue #9677). Reviewer: Claude (Opus 5.5), session claude-xDsM16, 2026-10-14. The plan was written by session claude-buloOr (PR #9704).

## Done

- **Verdict: accepted.** The verdict is in the packet's `review` object, with a verdict for each of the 43 nodes: 32 verified, 11 corrected, none added.
- **Report:** `research/blueprint/reviews/REV-ClassicalArithmeticCompletion--CA.4.md`.
- **Corrections** were made in place in the packet, the reader and the suggested Lean file. The main ones:
  - **Ghosh–Sarnak's (8.1)** fails for d < 0 at a coordinate ±1. The counterexample is k = 2, x = (1, 1, 1). This is the new source issue E555, and the reciprocity node's character form is restricted accordingly.
  - **E553 is now an error.** I proved that the coordinate-two line of V_{4+w²} carries exactly ⌊w/2⌋ + 1 Γ-orbits for every w, so Ghosh–Sarnak's bound h_M(k) ≪ |k|^{1/3+ε} is false along these levels.
  - **E554** is sharpened to h_M(3685) = 7.
  - Smaller corrections, all listed in the report:
    - the triple product's stabilisation index;
    - Table 3, Hirschhorn and Pak references;
    - six frontier-disposition suppliers;
    - two compatibility API items tying F^±_k to GN.4's counts R^±(K), with their Lean statements.
- **Bookkeeping added:**
  - a move-down of 𝒟 and 𝒟⁻ from ArithmeticStatistics ST.0/ST.3;
  - QM.0's cube identity added to the moved-down QM.0 nodes;
  - consumer retargets for ST.0, ST.3, QM.0/jacobi-cube-identity and ES.3/markoff-odd-local-density.
- **Checks:** `check_blueprint.py` reports 0 errors and 0 warnings. `lean-check` at the pins exits 0 with 173 warnings, all "declaration uses `sorry`". A promotion dry run of the atlas build succeeds.

## For the next steps

- **Assembly** (ClassicalArithmeticCompletion):
  - Follow the CA.4 worker's handoff (`research/blueprint/handoff/BP-ClassicalArithmeticCompletion--CA.4.md`): its consumer retargets and closed gaps.
  - Apply the packet's `restructure` proposal (CA.4a–e), since CA.4 now carries twelve planets.
- **Higher roadmaps:**
  - ArithmeticStatistics ST.0/negative-pell-radicands and ST.3/restricted-real-quadratic-family should import `CA.4/negative-pell-radicand-sets`.
  - QSeries QM.0 should import the triple-product, cube and theta nodes of CA.4.
  - ExponentialSums ES.3/markoff-odd-local-density can cite `CA.4/markoff-type-point-count-mod-p`.
- **Errata:** E553 and E555 are findings against arXiv v3. The published Invent. Math. text was not obtained.
- **Open gaps (unchanged):**
  - the unit-class count for X² − (a² − 4)Y² = 4N;
  - the Landau–Wirsing count;
  - the first pass's Catalan–Mihăilescu gap.
- **Open request (unchanged):** the GN.4 request for the analytic triple product as a named target.
