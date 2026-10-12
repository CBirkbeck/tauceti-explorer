# Handoff: REV-PKG-ArithmeticGaloisDuality

Reviewer: Claude (session claude-2nfoIZ), 12 October 2026, issue #8894. Verdict: **accepted**.
The full report is `research/blueprint/reviews/REV-PKG-ArithmeticGaloisDuality.md`.

## What was done

- Fixing review of the package written by claude-cEOcoh (PR #9333), following PACKAGE_REVIEW.md:
  upstream form, fidelity to the 125-node plan, own words, process residue, Suggested.lean shape and
  lean-check, duplication against current TauCetiRoadmap and Tau Ceti and against the lower-tier
  packages it cites, supplier layer numbers, about 110 locators, and the adversarial mathematics
  pass on every target.
- README corrections in place: a false general claim (no divisible elements in lattice cohomology),
  a sign error in the explicit Poitou–Tate pairing, an incomplete proof for `m`-th roots after base
  change (now BCGNT's prime-`m` argument), a missing perfectness hypothesis (Nakamura comparisons at
  `p = 2`), the `(T/pᵐT)^H` limit step, two duplicate targets removed and cited from
  ArithmeticGaloisRepresentations, further citations to AGR and current Tau Ceti, stale supplier ids,
  ProfiniteCohomology layer numbers, NSW PDF pages and Milne pages; every Lean declaration is named.
- Suggested.lean: `isIndAdmissible_of_isAdmissible` without the `Module.Finite` hypothesis; closing
  comment updated. lean-check before and after: exit 0, 35 warnings, all `declaration uses sorry`.

## Target changes to propagate

- Removed (exist in ArithmeticGaloisRepresentations, tier 7): *Chebotarev density for global
  function fields* (a target the packager had added; now AGR Layer 5 `functionField_chebotarev`) and
  the plan node `R02.6/sl2-adjoint-h1-vanishing`, *H¹(SL₂(F), End⁰) vanishes* (now AGR Layer 7, §7.7
  `ResidualImage.h1_SL2_adZero`). Consumers citing these by their old stage should cite AGR.
- Kept as variants with a one-clause difference: *Tate vanishing for trivial Q/Z coefficients*
  (number fields are AGR `tate_h2_qz_eq_zero`; kept for function fields and the finite form) and
  *Trace-zero adjoint duality without division by n* (AGR §7.2 owns the adjoint and the trace
  pairing; kept for the restricted pairing and the boundary `δ`).
- *Continuous topology on factor-set extensions* is now the class of a factor set in
  `continuousCohomology 2`; the topology lemmas are current Tau Ceti.

## Sources used (public, accessed 2026-10-12; scratch copies deleted)

| Source | SHA-256 |
| --- | --- |
| Milne, *ADT* (jmilne.org ADTnot.pdf) | `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31` |
| NSW 2.3 (mathi.uni-heidelberg.de NSW2.3.pdf) | `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91` |
| Nekovář, *Selmer complexes* (Numdam) | `61c84e5ad3252a2e520747215ac57a282addc2b58c824a3637bcd77bbe02153f` |
| Rubin, *Euler Systems* (author draft) | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| Darmon–Diamond–Taylor (author PDF) | `254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3` |
| Khare–Wintenberger II (proofs.pdf) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| Conrad, *Lifting global representations* | `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd` |
| Jannsen, *Continuous étale cohomology* | `c9d26714c40b14912ea553307062835a05955b0787587429260cfead87bb3d76` |
| BCGNT, arXiv:2309.15880 | `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d` |
| Nakamura, arXiv:2006.13647 | `0d8fa462594a20ef96d755d31a13ba23081f1454bfe9809a5fda54fd30311ba7` |

## What remains

Nothing for this job. Points for the TauCetiRoadmap PR are at the end of the report.
