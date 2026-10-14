# REV-PKG-ArithmeticDirichletSeriesPartII

Verdict: **accepted after small corrections**. Reviewer: Claude (Opus 5.5), session
`claude-8246v2`. Date: 2026-10-14. Job: #9200. The package was written for #9157 by session
`claude-jwhptF`; this reviewer took no part in the package, the plan or the plan's review.

## Scope and method

Read the package (`README.md`, `Suggested.lean`, `metadata.toml`) in full against the accepted plan
`research/blueprint/packets/ArithmeticDirichletSeriesPartII.json` and the package handoff, following
PACKAGE_REVIEW.md, PROTOCOL.md sections 5, 13 and 20, and UPSTREAM_GUIDE.md. Form was compared with
the upstream parent `TauCetiRoadmap/ArithmeticDirichletSeries` and `ProfiniteArithmetic`. Every
mathematical statement was checked by hand (computations below); declaration names were checked by
a script against the pinned Mathlib and Tau Ceti sources, and the supplier statements the proofs
rest on were read at the pins. No subagent was used.

## The six criteria

| Criterion | Finding |
| --- | --- |
| 1. Upstream form | Pass. `# Roadmap:` title, `**Summary.**`, layer table, Scope and ownership, Conventions (with three witnessed conventions), Exact supplier contracts per supplier, How to read the build, Layers HP.0–HP.5 with `### HP.k.n` prose subsections, each ending in `### Examples` and `### Dependencies`, Downstream consumers, References. No process language (searched for packet, job, review, node, stage, coverage, catalogue). |
| 2. Fidelity | Pass. All 65 names of the plan (16 nodes, 26 API items, 16 definition tests, 7 named acceptance checks) occur in the README. Each of the 16 statements was compared with the plan node: same hypotheses (`a > 0`, `A > 0`, `0 ≤ c n`, `Re s > 0`, `l < k`, `B > 0`, MonotoneOn on `[0, ∞)`) and conclusions; the README claims nothing the plan lacks except the API and Checks added below. The single upstream prerequisite (ArithmeticDirichletSeries, Layers 4.2, 9.1, 9.2) is correct; no upward citation, `FoundationsAndLibraryIntegration` or `UPSTREAM:` id. |
| 3. Own words, locators | Pass. No source passage and no section-by-section summary; every claim carries a theorem/section/page locator (checks below). |
| 4. No process | Pass. |
| 5. Suggested.lean | Pass. `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: exit 0, 31 warnings, all `declaration uses 'sorry'`, no errors and no other warnings (before and after the edits). 369 lines; four real-bodied light definitions (`HasLaplace`, the Prop structure `PoleBoundary`, `squaredSinc`, `delangeWeight`), one instance with a real proof (`northcott_natId`), 16 theorems by `sorry` (12 targets and 4 HP.1 milestones), 15 `example`s; no sorry'd data, no `True` placeholder, no `#eval`/`#print`. All 16 signatures were compared with the README statements (hypotheses, domains, casts, conclusions): they agree. |
| 6. metadata.toml | Pass: the single line `topic = "math.NT"`, the parent's topic. |

`python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.

## Sources

Both public PDFs were downloaded afresh; their SHA-256 match the packet (Delange `4934b4bf…`, Wood
`154e700c…`). Locators checked against the printed pages:

| Locator in the README | Checked content | Result |
| --- | --- | --- |
| Delange p. 213 and footnote 1 | standing hypotheses (real, nondecreasing, nonnegative `α`; convergent Laplace integral on `Re s > a`, `a > 0`); nonnegativity arranged by subtracting `α(0)` | correct |
| Delange pp. 213–214 (Theorem I, behind the §4.1 and p. 237 citations) | the weight `γ` on `[0, l]` and the normalisation `t^(p+1) β(t) ∫ e^(−tu) γ` | correct |
| §3.1–3.2, pp. 220–221 | `v(t)`, positivity, monotonicity, `v(t + h)/v(t) → 1` | correct |
| §3.3–3.3.1, pp. 221–222 | `h(s) = (−1)^(p+1) ∫₀^l F^(p+1)(s + u) γ(u) du` and its Laplace representation | correct; with `p = 0` this is the README's `H` |
| §3.3.2, pp. 222–224 | the boundary bound of `h` | correct |
| §3.3.5, p. 226 | triangle weight `½(1 − |y|/2λ)`, kernel `sin²(λu)/(λu²)`, limit `πA` | correct; the README's kernel is this one divided by `π` |
| §3.4.1–3.4.2, pp. 227–228 | the monotone two-sided argument, limits in `λ` then in `h` | correct |
| §4.1, pp. 228–229 | Theorem I needs no Lemmas 1–2 | correct |
| Lemma 3, §5.1.1, p. 231 | `l ∈ (0, 1)`, `ρ ≥ 0`, logarithmic asymptotics | correct |
| Lemma 4, §5.1.2, p. 233 | Gamma value times `s^(−ρ−1)` | correct |
| Theorem III, §5.2.1, pp. 235–236 | `ω` real, not an integer `≤ 0`; holomorphy at the other points of the line; local form with `g(a) ≠ 0`; conclusion with `Γ(ω)` | correct |
| p. 237 | `g(a) > 0` derived for `ω ≥ 1`; `p = 0`, `l < 1`, `γ(u) = u^(ω−1)/g(a)` | correct |
| Theorem IV, §5.2.2, p. 239 | named as out of scope | correct |
| §5.3, p. 242 | second remark: local hypothesis alone gives only the order of magnitude | correct |
| Wood §7, pp. 415–417 (Duke pagination, kept in the author version) | pole of order `2^k` at `s = 1`, partial sums `X (log X)^(2^k − 1)`, trivial homomorphism set aside, non-surjective homomorphisms bounded through the series of the next smaller group | correct (the README writes `r` for Wood's `k`) |

No locator needed correction.

## Duplication against current Tau Ceti and TauCetiRoadmap

- Current Tau Ceti (a91d3aaf): `TauCeti/NumberTheory/LSeries/WienerIkehara/` proves the simple-pole
  theorems `wienerIkehara`, `wienerIkehara_zero`, `wienerIkehara_of_eventually_nonneg`,
  `wienerIkehara_nat`, `wienerIkehara_rpow` (continuous boundary remainder, cutoff
  `∑ n ∈ Finset.Icc 1 ⌊x⌋₊`). The README cites them in Scope and uses `k = 0` only as a
  consistency check; the content here is `k ≥ 1`. The library's Laplace objects
  (`Analysis/CompletelyMonotone/Laplace/Representation.lean`: transforms of measures on `ℝ≥0` at
  real arguments; `Probability/Moments/LaplaceDeterminacy.lean`; the Laplace distribution) are
  different carriers. No squared-sinc kernel on `ℝ`, Delange weight or higher-pole theorem exists
  (searched by object: `sinc … ^ 2`, Fejér, Laplace, Delange).
- TauCetiRoadmap main, including the nine newer roadmaps and `Completed/*`: only
  OneParameterSemigroups (Bernstein) and DifferentialGeometry (Laplace–Beltrami) mention Laplace;
  neither overlaps. The parent ArithmeticDirichletSeries is complete (STATUS.md: all layers done)
  and plans no higher-pole theorem.
- Mathlib: neither the pin 082e2d3 nor TauCetiRoadmap's current Mathlib (6b7abb3) has
  `HasLaplace`. The open PR #40582 (head `90482cd`, still open) defines
  `HasLaplace f s m μ := LaplaceConvergent f s μ ∧ laplace f s μ = m` with the same kernel
  `exp((−s)·t)`, default measure and typeclasses; its `HasLaplace.comp_mul_left` has the README's
  form. The package's definition unfolds to it.
- `Northcott (fun n : ℕ ↦ n)`: no instance in either Mathlib or either Tau Ceti.

No target was removed.

## Adversarial mathematics pass

| Statement | Instances computed | Outcome |
| --- | --- | --- |
| `HasLaplace` | `1 ↦ 1/s`, `t² ↦ 2/s³` on `Re s > 0`; `s = 0` for `1` (totalised integral `0`); Stieltjes variant | holds; Stieltjes gives `1`, `2/s²` |
| `PoleBoundary` | model `A/(s − a)^(k+1)` for all real `a, A`; value `37` at the pole; `1/(s − 1)` with `A = 2`; dyadic `1/(1 − 2^(1−s))` (zeros of the denominator at `1 + 2πim/log 2`, derivative `log 2` at `1`); `A = 0` | all as stated |
| API `order_unique`, `div_argument`, `rescale`, `mul` | `k < l` gives `B = 0`; `s = 0` off the disc for `a > 0`; `F(as) = g(as)/(a^(k+1)(s − 1)^(k+1))`; product orders `(k+1) + (l+1)` | hold |
| `squaredSinc` | `∫ = (1/π)∫ sinc² = 1`; triangle transform `2λ sinc(λv)²` (integration by parts); value `λ/π` at `0`; zero at `π/λ`; wrong kernel `sinc(λv/2)` gives `(λ/π)(2/π)²` | hold |
| `delangeWeight` | `w₀ = 1 − e^(−t)`, `t w₁ = 1 − (1 + t)e^(−t)`, `t² w₂ = 1 − (1 + t + t²/2)e^(−t)` for all real `t` (oriented substitution also for `t < 0`); without `1/k!`: `2 − (2 + 2t + t²)e^(−t)`; `w₀ < 0` for `t < 0` | hold; nonnegativity correctly restricted to `t ≥ 0` |
| `integerGammaLaplace` | `k = 0, 1`; `a = 0, k = 2`; negative `a` | holds for every real `a`, `Re s > a` |
| `regularizedBoundaryL1` | `k = 0` (remainder analytic at `a`); `k = 1`, `R = c/(s − a)`: `b(y) = c(log(1 + iy) − log(iy) + iy/(1 + iy) − 1)`; majorant `∫₀^δ uᵏ (u + |y|)^(−j−1) du ≤ C(1 + |log |y||)` for `j ≤ k`; junk value of `∫‖·‖` excluded because `b` and `H(a + ε + i·)` are integrable on `[−L, L]` | holds |
| `delangeSmoothedLimit` | identity `−∫₀¹ R′(s + u) uᵏ/k! du = ∫ e^(−st) w_k (α − β)`; model `α = e^(at)tᵏ`, `A = k!`; `A < 0` | limit `1` for the model; `A < 0` inconsistent with the hypotheses |
| `monotoneUnsmoothing` | windows `[T, T + h]`, `[T − h, T]`; `C = 0`; one bandwidth with `J = C + ε cos(3λt)` and `ε < aC/(a + 3λ)` | holds; one bandwidth fails (witness verified) |
| `logSummatory_hasLaplace` | `c = 1[n = 1]` at `s = 0`; `S_c(1) = c 1`; `S_c(2) = c 1 + c 2` | `Re s > 0` needed; Check added |
| counting theorems | `c = 1` (`ζ`, limit `1`); `c n = n` at `a = 2` (limit `1/2`); `d` (`ζ²`, limit `1`); `d₄` (`ζ⁴`, limit `1/6`); `k = 0` against `wienerIkehara_rpow` (`κ/σ`); `a = 0` with `c n = 1/n` (`ζ(s + 1)`, `S_c ~ log X`) | constants agree; `a = 0` genuinely fails, Check added |
| `finiteChange_asymptotic` | change at `n = 1`; signed changes | holds since `X^a (log X)ᵏ → ∞` for `a > 0` |
| `lowerPole_perturbation` | `l = k`, `d = 2c`, `b = c` | strictness needed (recorded Check) |
| dyadic | `S_c` at `1, 2, 3, 4, 6, 8, 12` = `1, 3, 3, 7, 7, 15, 15`; `S_c(2^j) = 2^(j+1) − 1`, `S_c(3·2^j) = 2^(j+2) − 1`; `4/3 < 1/log 2 ≈ 1.4427 < 2` | holds |

Generality: README and Lean agree on every domain (`E` with `NormedSpace ℝ E` and `SMul ℂ E`; real
`a` in HP.0–HP.2.2, `a > 0` from HP.2.3 on; `c : ℕ → ℝ`). Every denominator is nonzero where used
(`s` in `div_argument` for `a > 0`; `a · k!`; `w_k(t)` for `t > 0`; the counting scales eventually).

## Corrections made in place

1. **API `PoleBoundary.mul`** (README HP.0.2, Scope, Lean closing comment): the README asserted
   `PoleBoundary (ζ^m) 1 (m − 1) 1` and uses `ζ⁴` as a Check without any product lemma. Added
   `PoleBoundary F a k A → PoleBoundary G a l B → PoleBoundary (F · G) a (k + l + 1) (A · B)`
   with its proof sketch; the example now cites it.
2. **API `delangeWeight_shift_uniform`** (HP.1.2, HP.3.1, Lean closing comment): the proof of
   HP.3.1 needs the shift law uniformly for `|h| ≤ H`, which the API only stated pointwise. Named
   the uniform form and cited it in HP.3.1.
3. **Negative control `a = 0`** (HP.4.3 Checks): `c n = 1/n`, series `ζ(s + 1)`, `S_c(X) ~ log X`;
   dividing by `s` raises the pole order at `0`.
4. **Negative control `Re s > 0`** (HP.4.1 Checks): `c = 1[n = 1]` converges at `s = 0`, but
   `α = 1` has no transform there.
5. **Conventions, abscissa row**: "all theorems at `a > 0`" was too broad; HP.0, HP.2.1 and HP.2.2
   hold for every real `a`. Scoped to HP.2.3–HP.4.5.
6. **HP.0.2 example**: `PoleBoundary (ζ^m) 1 (m − 1) 1` now says `m ≥ 1` (at `m = 0` the natural
   subtraction gives a false statement).
7. **`HasLaplace_test_quadratic`**: the wrong definitions it rejects are now stated as definitions
   of the transform (Stieltjes gives `2/s²`); the factorial remark is attributed to the Gamma
   model.
8. **Supplier contract for `TauCeti.summatory`**: added the height's type `ι → ℕ` and `Northcott`
   instance, and that the module is `TauCeti/Order/Northcott/Basic.lean` in the current Tau Ceti.
9. **Downstream consumer (Gamburd–Magee–Ronan)**: stated that the consumer proves its own
   continuation, positivity and uniformity in the starting point, so that HP.3.2 is not presented
   as a uniform theorem. This follows the atlas's routing of that paper.

Lean: only the closing comment changed. Final SHA-256 of `Suggested.lean`:
`8e3aa41b2fa54e6cd3c385817e6ba39c78abc655ecdaa75967ca6b6d96ad9325`.

## Notes for the maintainer (no change made)

- **Port.** TauCetiRoadmap builds against Tau Ceti a91d3aaf, where `TauCeti.Order.Northcott` has
  become `TauCeti.Order.Northcott.Basic` (same declarations). The import must be renamed when the
  file is ported; at the atlas pin the current name is the right one.
- **Counting spelling.** The plan states counts with `TauCeti.summatory (fun n : ℕ ↦ n)` applied to
  the zero-suppressed weight, while Tau Ceti's Wiener–Ikehara theorems use
  `∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n`. The README records the equality of the two; restating the HP.4
  targets in the `Finset.Icc` form would make the `k = 0` case literally comparable with
  `wienerIkehara_rpow`, need no `Northcott` instance and no Tau Ceti import. This is a design
  choice of the accepted plan, so it is left to the maintainer.
- **Wood's majorant.** Wood bounds the non-surjective homomorphisms through the series of the next
  smaller group; `lowerPole_perturbation` asks for a coefficientwise majorant with its own
  `PoleBoundary`. That shape fits a sum over the finitely many maximal subgroups; its construction
  belongs to ArithmeticStatistics, as the README says.

## Questions for the orchestrator

None.
