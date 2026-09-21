# PAPER-BHARGAVA-25 handoff

Issue #1059. ChatGPT Pro — `astra-20260921-f6b2d8`. 2026-09-21.

## Saved work

The paper-v1 JSON and human report contain 107 items (6 library, 10 planned,
91 missing), with all missing items routed exactly once. All 31 numbered
results and Remarks 14, 15 and 23 are inventoried. Six routes propose two
Part II extensions of the existing PolynomialGaloisGroups roadmap and
source additions to ST.2, ST.3, CA.3 and the early SF.5 Bezout prefix.
Nothing is integrated into the atlas or claimed formalized.

The source actually read is arXiv:2111.06507v3, Sections 1–8 and references,
with PDF checks of important formulas. The Annals 201 (2025), 339–377
metadata is verified, but the journal text has not been obtained. The
packet therefore remains **partial**. Treat this PR as a checkpoint,
not a completed-paper/review verdict.

## Resume here

1. Acquire the journal text and compare all `sourceGates` V1–V8. In particular
   retain n>=3 for the monic E_n theorem, correct the tame (e-1)f calculation,
   and resolve the printed Corollaries 6 and 8 before accepting their scope.
2. Corollary 6: the original EV Proposition 2.8 needs |G|>4; even at n=8 the
   advertised substitution leaves H^5. Find the additional proof or corrected
   statement; do not delete the additive term of Theorem 2.
3. Corollary 8: certify the natural M_11 action/index and an original-source
   Q-realization, then check the fixed S_9-factor obstruction. Preserve the
   +epsilon in the field exponent and its small positive numerical margin.
4. Expand Section 6's higher-index elimination on strata with nonzero leading
   coefficients, including exceptional prefixes; dimension alone is not the
   missing proof. Prove the refined log tail and the a<=u summation endpoints.
5. Follow the source prerequisite list for group minimal degrees, field counts,
   per-field polynomial multiplicity, geometric sieve, Zarhin and the exact
   finite-fiber Bezout theorem. Their reference listing is not full acquisition.
6. The Part II designs use the immutable PolynomialGaloisGroups anchor. Keep
   generic ramification at NumberFieldArithmetic/LocalFieldsRamification,
   generic counts at the existing Northcott API, and fields in ST.3 independent
   of the final coefficient-box theorem. Do not review this work as its author.

## Validation boundary

Local schema/status/routing checks passed on the inspected stage map, with
all 91 missing items singly routed. Exact rational exponent regressions,
the degree-two family, dyadic jump negative control, tame boundary, and
strong-versus-weak divisibility checks passed. A small exhaustive numerical
Fourier regression passed for primes 3,5,7,11. It is not a general proof.
The repository's official whole-atlas paper check is delegated to PR CI.
No Lean file is required or submitted; Lean was not compiled.

The mathematical input snapshot is
`6eb690f8bea11dfc057110a2b84009844bf1d005`. Library pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
