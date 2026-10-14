# Handoff: PKG-ArithmeticDirichletSeriesPartII (issue #9157)

Worker: Claude (Opus 5.5), session `claude-jwhptF`, 14 October 2026. Refs #9157. This is a complete
package, not a checkpoint. I took no part in the design or the review of the plan.

## Deliverables

- `research/blueprint/packages/ArithmeticDirichletSeriesPartII/README.md`: the roadmap, 1,075
  lines. It opens with a `**Summary.**` and a layer table, then Scope and ownership, Conventions (a
  table plus three conventions fixed by computed witnesses), Exact supplier contracts (Mathlib,
  Tau Ceti, the parent roadmap), How to read the build (with a dependency diagram), Layers
  HP.0–HP.5 with `### HP.k.n` subsections, `### Examples` and `### Dependencies`, then Downstream
  consumers and References.
- `research/blueprint/packages/ArithmeticDirichletSeriesPartII/Suggested.lean`: 368 lines, namespace
  `TauCetiRoadmap.ArithmeticDirichletSeriesPartII`, `import Mathlib` and `import TauCeti.Order.Northcott`.
  It contains one Prop instance with a real proof (`Northcott (fun n : ℕ ↦ n)`), four real-bodied
  light definitions (`HasLaplace`, the Prop structure `PoleBoundary`, `squaredSinc`,
  `delangeWeight`), 16 theorems with `sorry` proofs (all 12 theorem targets of the plan plus the
  four HP.1 milestones `squaredSinc_mass`, `squaredSinc_fourier`, `delangeWeight_normalization`
  and `delangeWeight_shift`) and 15 `example`s, each named in its docstring after the README Check it
  encodes. It has no sorry'd data. A closing comment names the API lemmas that live only in the
  README.
- `research/blueprint/packages/ArithmeticDirichletSeriesPartII/metadata.toml`: `topic = "math.NT"`,
  the parent's topic.

## Checks run

- `lean-check research/blueprint/packages/ArithmeticDirichletSeriesPartII/Suggested.lean` at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`:
  exit 0, **31 warnings, all `declaration uses 'sorry'`**, no errors, no other warnings. Final file
  SHA-256 `4d3cb8e1c7f325b989fe4c189dc5e3beae7343b26f215cffd7007fe8bc1191b9`.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Every one of the 65 names of the plan (16 node names, 26 API names, 16 definition tests and the 7
  named acceptance tests) occurs in the README; every node name occurs in `Suggested.lean`.
- No line of `Suggested.lean` exceeds 100 characters; no process words in the README.
- A Sonnet subagent cross-checked every Lean declaration against the README statement for
  hypothesis, domain and conclusion mismatches (see the end of this note).

## Sources and library, checked afresh

- Both public sources were downloaded to scratch and their SHA-256 match the packet: Delange 1954
  (`4934b4bf…`) and Wood 2019 (`154e700c…`). Every locator in the README was checked against the
  printed page headers: standing hypotheses and footnote 1 p. 213; §3.1–3.2 pp. 220–221; §3.3.1
  p. 221; §3.3.2 pp. 222–224; §3.3.3–3.3.4 p. 224; §3.3.5 p. 226 (limit πA); §3.4.1–3.4.2 pp. 227–228;
  §4.1 pp. 228–229; Lemma 3 pp. 231–232; Lemma 4 p. 233; Theorem III p. 235 (proof to p. 238; the
  choice p = 0, γ ∝ u^(ω−1) and the positivity of g(a) are on p. 237); Theorem IV p. 239; §5.3
  p. 242. Wood §7: pole of order 2^k at s = 1, Tauberian step and lower-rank bound on p. 417.
- Theorem III is stated for real ω not an integer ≤ 0 and assumes only g(a) ≠ 0; the plan's A > 0
  is a harmless strengthening (positivity is derived in the source). Recorded in the README.
- All 33 baseline declarations of the packet exist at the pinned Mathlib/Tau Ceti; I also cite
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `MeasureTheory.integral_comp_mul_left_Ioi`,
  `ArithmeticFunction.pow_zero_eq_zeta`, `TauCeti.summatory_eq_summatory_natFloor`,
  `TauCeti.mem_normLE_natCast` and `TauCeti.Contour.tendsto_integral_sinc_atTop`, all present at
  the pins.
- Mathlib PR #40582 is still open at head `90482cd`. I read its `LaplaceTransform.lean`: its
  `HasLaplace f s m μ` is `LaplaceConvergent f s μ ∧ laplace f s μ = m`, which unfolds to exactly the
  plan's conjunction (same argument order, default measure `volume.restrict (Ioi 0)`, `SMul ℂ E`).
  I kept the plan's single definition and say so in the docstring and README.

## Duplication against current TauCetiRoadmap and Tau Ceti (a91d3aaf)

- **Current Tau Ceti now proves the simple-pole theory**: `TauCeti.LSeries.wienerIkehara`,
  `wienerIkehara_zero` (`WienerIkehara/SharpCutoff.lean`) and `wienerIkehara_of_eventually_nonneg`,
  `wienerIkehara_nat`, `wienerIkehara_rpow` (`WienerIkehara/Variants.lean`, positive abscissa,
  limit κ/σ). None of these is at the pin. No target of this roadmap is removed: every target is
  either a higher-pole statement or an auxiliary object Tau Ceti lacks. The README's Scope section
  states that every `k = 0` counting statement is a special case of these and that the `k = 0`
  instances are consistency checks only; HP.4.3 checks that `A/a` matches `κ/σ`.
- No Laplace transform of functions with complex parameter, squared-sinc kernel on ℝ, Delange weight
  or higher-pole Tauberian theorem exists in current Tau Ceti, Mathlib (pinned) or any current
  TauCetiRoadmap roadmap (searched by object). OneParameterSemigroups (Bernstein: Laplace transforms
  of measures at real arguments) and OperatorTheory/SpectralSubspacePerturbation (one explicit real
  Laplace integral) are different carriers; mentioned in Scope.

## Changes relative to the plan (the packet is unchanged)

- The Lean file keeps only definitions, targets/milestones and examples, as the 2026-10-12 shape
  requires; the 26 API lemmas are stated in the README only.
- Two Lean statements are re-spelled equivalently: the dyadic coefficients use
  `Set.indicator (Set.range (2 ^ ·))` instead of a classical `if ∃ j, …`, and the boundary-value test
  uses `Function.update` instead of `if s = 1 then 37 else …`.
- Added Checks, each derived from the plan's theorems: a `k = 3` factorial witness
  (`counting_test_divisor_fourfold`, `∑ d₄(n) ~ X (log X)³/6`, with `d₄ = σ₀ * σ₀`; it separates
  `k!` from `k`, `(k−1)!` and `(k+1)!`, which `k ≤ 2` does not), an explicit witness that one
  bandwidth does not suffice in HP.3.1 (`J = C + ε cos(3λt)`), the model `α = e^(at)tᵏ` as a check of
  HP.2.3/HP.3.2, a logarithmic boundary-value example for HP.2.2 (`k = 1`), the first values of the
  dyadic counting function, and `PoleBoundary (ζ^m) 1 (m − 1) 1` as an HP.0 example.
- The `Northcott` instance for the identity height on `ℕ` (needed by `TauCeti.summatory (fun n ↦ n)`;
  Mathlib and Tau Ceti have none at the pin) is stated as part of HP.4.

## Notes on the plan (not mistakes in it)

- The standalone reader `research/blueprint/readmes/ArithmeticDirichletSeriesPartII.md` and the
  roadmap definition's stage text lag the plan's review: the reader still has the old real-valued
  `HasLaplace` with API names `congr`, `smul`, `dilate`, and the pre-review page ranges for the kernel
  (pp. 222–224, 225–227) and unsmoothing (pp. 225–227). The packet's corrected locators (pp. 224–226,
  227–228) are the right ones and are used in the package. This package does not edit the reader.
- The packet's HP.4/lower-pole source says Wood bounds the non-surjective homomorphisms by a
  lower-order count; precisely, Wood (p. 417) bounds their number in terms of a constant and the
  asymptotics of the coefficients of the next smaller series. The README states it that way and
  calls the coefficientwise majorant of `lowerPole_perturbation` the generic analytic form of the
  step.
- `dyadicLocalPoleCounterexample` could be strengthened to "no `PoleBoundary F 1 k A` for any `k`, `A`"
  (the failing field is `away`); I kept the plan's statement.

## Adversarial pass (PACKAGE_REVIEW)

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| `HasLaplace` | `s = 0` with `f = 1` (totalised integral `0`); `1 ↦ 1/s`; `t² ↦ 2/s³`; `(0,∞)` vs `[0,∞)` | negative control kept; endpoint is a null set |
| `PoleBoundary` | `A = 0`; boundary value 37; dyadic local-only; `a ≤ 0` in `div_argument` | carrier allows `A = 0` (order ≤ k, stated); `0 < a` needed for `div_argument` (else `s = 0` lies on the line) |
| `squaredSinc` | `λ = 0`, `λ < 0`; value at 0; zero at `π/λ`; wrong kernels | the plan-era claim that `sinc(2λv)` fails the zero test was false (it also vanishes at `π/λ`); the README uses `sinc(λv/2)` (endpoint `λ`) as the wrong kernel |
| `delangeWeight` | `t = 0`, `t < 0`, `k = 0, 1, 2` | identities hold for all real `t`; `2!` witnessed |
| `integerGammaLaplace` | `k = 0, 1`, `a` negative, `Re s = a` | `Re s > a` required, any real `a` allowed |
| `regularizedBoundaryL1` | `k = 0`; model `F`; `k = 1` with `R = c/(s−a)` | `b = 0` for the model; logarithmic singularity at `k = 1` |
| `delangeSmoothedLimit` | model `α = e^(at)tᵏ`; `A < 0` | limit 1 for the model; `A < 0` makes the hypotheses inconsistent |
| `monotoneUnsmoothing` | `C = 0`; a single bandwidth | one bandwidth fails (explicit witness) |
| `logSummatory_hasLaplace` | `Re s ≤ 0` with a finite sequence; `n = 0`; `n = 1` at `t = 0`; Stieltjes | `Re s > 0` needed; `c 0` suppressed; `α(0) = c 1` |
| counting theorems | `c = 1` (`k = 0`); `c_n = n` at `a = 2`; `d`, `d₄`; `k = 0` vs `wienerIkehara_rpow` | constants `1`, `1/2`, `1`, `1/6`, `κ/σ` all agree |
| `finiteChange_asymptotic` | signed coefficients; change at `n = 1` | covered; `a > 0` makes the scale diverge |
| `lowerPole_perturbation` | `l = k` with `d = 2c` | strictness needed; recorded as a Check |
| dyadic | `S_c` at 1, 2, 3, 4, 6, 8, 12; `1/log 2 ≈ 1.4427` | limits 2 and 4/3 bracket `1/log 2` |

## Cross-check of README against Lean

A Sonnet subagent compared all 36 Lean declarations with their README statements (hypotheses,
domains, conclusions, definition bodies). It found one difference, now fixed: the README listed
"`S_c(X)/X` has no limit" as a conclusion of `dyadicLocalPoleCounterexample`, whose last conjunct
only says the ratio does not tend to `1/log 2`; the README now states that conjunct and notes that
"no limit" follows from the two subsequence limits. The instance name `northcott_natId` was added to
the README. Every other pair matched, including the `λ/π`, `1/k!`, `[0, 1]`, `k + 1` and default
measure conventions of the four definitions.

## What remains

Nothing for this job. The next step is the independent package review (REV-PKG-ArithmeticDirichletSeriesPartII).
Scratch (source PDFs, extracted text, the PR's Lean file, lean-check logs) is deleted after submission;
nothing in it is needed by the next worker.
