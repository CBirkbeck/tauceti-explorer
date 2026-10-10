# DESIGN-ArithmeticDirichletSeriesPartII — #3451

Worker: Codex, session `codex-W83w7l`. The bot confirmed claim comment 6102179592. The branch is `codex-W83w7l-higher-pole-tauberian`.

The target-level design pass is complete. The roadmap definition, packet, reader and suggested file cover the single routed continuation `ArithmeticDirichletSeriesPartIIHigherPoleTauberian`, including all three routed items: integer-pole counting, the nondecreasing Laplace theorem, and its logarithmic summatory adapter. The parent is `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries`, after Layer 9. No parent material, arithmetic Euler factors or statistics constructions were re-planned.

The packet has 16 nodes: four definitions and twelve theorems, with 23 API items, 16 definition unit tests and 12 planets. Seven additional acceptance examples cover inclusive cutoffs, elementary counting, inserted mass and the positive-abscissa constant. There are 31 exact pinned baseline declarations, no gaps, no supplier requests, no restructure proposals and no source issues. Implementation statuses are all `unchecked`.

| Stage | Planning status | Closed targets |
| --- | --- | --- |
| HP.0 | closed | Convergent ordinary Laplace predicate; analytic boundary germs and pole numerator |
| HP.1 | closed | Normalized squared-sinc kernel; Gamma-normalized polynomial regularizer and API |
| HP.2 | closed | Integer Laplace model; compact L1 boundary regularization; smoothed counting limit |
| HP.3 | closed | Monotone removal of smoothing; integer-pole Delange Laplace theorem |
| HP.4 | closed | Inclusive logarithmic adapter; Dirichlet theorem; positive abscissa; finite and lower-pole errors |
| HP.5 | closed | Divisor coefficients of ζ²; explicit dyadic local-pole rejection |

“Closed” records closure of the target-level prerequisite plan. It does not certify formal proofs. The packet status is `complete`, ready for independent review by another session. No further planning job is needed to finish this scope; review and packaging are the next pipeline steps.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDirichletSeriesPartII.json --index <pinned declaration index>`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticDirichletSeriesPartII.lean`: successful elaboration in the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Its only diagnostics are 58 expected proof-admission warnings. The four definitions have explicit bodies/fields; no analytic estimate or desired counting limit is postulated as a structure field.
- Packet node names, all 23 API names and all 16 definition-test labels occur in both the reader and suggested file. Lean examples carry their packet names in immediately preceding `Test:` comments because Lean examples are anonymous.
- Suggested-file SHA-256: `0c203da0ff703f5f050254cf3d418045aab9c889400c426bfdb4f14eca9d950b`.
- The pinned Mathlib source was read directly. The three Tau Ceti source files supplying summatory calculus, canonical Laurent data and the improper sine integral were also byte-compared with the recorded pinned git objects. The declaration index was used only as a search aid.

## Mathematical interfaces to preserve in review and packaging

Pole order is written `k+1` for `k : ℕ`; main theorems require a positive real leading coefficient. The boundary carrier itself permits zero leading coefficient for stability APIs, and claims exact order only when that coefficient is nonzero. Every extension agrees with the named function on the open half-plane. Total values of LSeries or of the named function on the boundary are never evidence of analytic continuation.

The Laplace transform is ordinary integration of α(t), not Stieltjes integration of dα. For α(t)=S_c(exp t) it equals F(s)/s. Consequently the Dirichlet counting constant at a positive abscissa a is A/(a k!). The coefficient at n=0 is suppressed to match LSeries.term, while the n=1 mass is retained at t=0. Real cutoffs are inclusive.

The proof regularizes the derivative of the remainder with u^k/k!, obtaining at most logarithmic boundary growth. It then uses compact L1 convergence, the triangular Fourier formula for the normalized squared-sinc kernel, Fourier decay and monotonicity. Undamped convolution integrability is derived with positivity and Fatou; the eventual growth bound is derived during unsmoothing. Neither is an assumed version of the desired asymptotic.

The lower-pole export handles a signed perturbation dominated coefficientwise by a nonnegative sequence of strictly smaller pole order. That majorant must supply its own convergent series and full boundary data. ArithmeticStatistics ST.3 owns Wood’s local factors, positivity, lower-rank arithmetic majorants and surjectivity subtraction; the dependency runs from statistics to this generic analytic supplier. The dyadic counterexample has a genuine local pole but extra poles on the boundary, and distinct counting subsequential limits 2 and 4/3.

## Sources and ownership audit

Read Delange (1954), standing hypotheses p.213, the Laplace regularization and smoothing/monotonicity chain §§3–4.1 pp.220–229, Gamma model lemmas §5.1 pp.231–235, Theorem III §5.2.1 pp.235–238, and the local-hypothesis limitation §5.3 p.242. Read Wood (2019), §7 pp.415–417 for the arithmetic use. The packet gives public URLs, hashes and access date 2026-10-10. All repository prose is original mathematical formulation with section/theorem/page locators; it contains no source excerpts. No restricted book was used. There are no missing proof sources; Delange supplies the primary theorem in place of Wood’s unavailable Narkiewicz reference.

Read the current upstream ArithmeticDirichletSeries README and Suggested.lean and the Chebotarev README, at TauCetiRoadmap main `81207c7f16d5abf770f13a7d2bdcdb465c030787`. Audited the newer upstream roadmaps and current Tau Ceti library read-only. No existing higher-pole theorem was located. The current simple-pole WienerIkehara Fourier modules, real-parameter completely-monotone Laplace transforms and the sieve roadmap’s finite-circle Fejér expression have different interfaces and were not duplicated. The reviewed AnalyticNumberTheory AN.0 audit was used for existing LSeries and summation tools.

All persistent review inputs are in the five deliverables. Scratch source downloads and logs are removed after submission.
