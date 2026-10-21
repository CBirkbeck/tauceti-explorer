# PKG-QSeriesPartitionsAndMockModularForms~codex

Claude (Opus), session `claude-nc9e7a`, [issue #11544](https://github.com/CBirkbeck/tauceti-explorer/issues/11544), 21 October 2026. This is a complete package job, not a checkpoint.

## What was done

The roadmap package is in `research/blueprint/packages/QSeriesPartitionsAndMockModularForms/`:

- `README.md`, about 1.08 MB and 6,681 lines. It has seven layers and 64 numbered subsections. Every layer ends with `### Examples` and `### Dependencies`.
- `Suggested.lean`, 351 lines: twelve light real-bodied definitions, 21 theorem signatures proved by `sorry`, and 15 proved `example`s.
- `metadata.toml`, with `topic = "math.NT"`.

**Input.** The input is the accepted plan as it stands on main after the revision-5 review (#11546, merged 03:49Z): `research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`, 537 nodes, review status `accepted`. All 537 targets are represented. The 14 removed as duplicates (below) are cited at their position, and eleven targets are new (ten for the fifth-order identification, plus Ramanujan's ₁ψ₁).

**Size.** The README is far above the issue's old 50–200 KB guide. This follows the binding 2026-10-12 shape rule, under which every target, hypothesis, locator and Check stays; 537 targets at that density need this length. If the maintainer wants it smaller, the natural split is Layers 0–4 (q-series, η/θ/Jacobi, Rademacher, harmonic Maass, mock) against Layers 5–6 (quantum modular forms and moonshine). That split would also break the ArithmeticQuantumTopology cycle noted below.

**Method.**
- The prose was rendered from the packet by script. The scripts handled the subsection grouping, internal-id resolution to `` `leanName` (§k.n) ``, cross-roadmap stage ids, process-language phrases and duplicate Checks.
- The front matter, supplier contracts, layer introductions, worked examples, back matter and all new targets were written by hand.
- Every residual process word (node, packet, request, supplier, gap, errata ids E###) was swept out.
- Every definition has at least three Checks.

## Removed because another roadmap or the library owns them

Each removal is cited in place. The last Scope paragraph lists what is excluded altogether.

| Plan target | Now cited from |
|---|---|
| `q-integer`, `q-factorial`, `q-binomial-coefficient` (definitions), `q-binomial-theorem` (Rothe) | HabiroCyclotomicCompletions §1.1 (`qInteger`, `qFactorial`, `qBinomial`, `finite_qBinomial`), TauCetiRoadmap PR #1314; its package says it exports this toolkit to QSeries Layer 0. The degree, monicity, palindromy and (q;q)_n factorisation of Gaussian polynomials are kept as a lemma paragraph. |
| `jacobi-triple-product` (formal, unit a) | TauCetiRoadmap.ClassicalArithmeticCompletion §4.40 (on main) |
| `jacobi-cube-identity` | ClassicalArithmeticCompletion §4.60 |
| `theta-three-product-identity`, `theta-two-product-identity`, `gauss-theta-four-product-identity`, `euler-odd-distinct-product-identity` | ClassicalArithmeticCompletion §4.61 |
| `jacobi-theta-nonvanishing` | GeometryOfNumbersAndQuadraticArithmetic §4.3 (PR #851): θ ≠ 0 from its product; jacobiTheta τ = θ(τ/2) |
| `weight-k-hyperbolic-laplacian`, `laplacian-slash-equivariance` | AutomorphicSpectralTheory §1.16 `weight_laplacian`, `weight_laplacian_slash` (PR #925). The Wirtinger form, the Mathlib-Laplacian form, harmonicity of holomorphic functions and Zwegers' Casimir comparison are kept as a lemma paragraph. |
| `classical-kloosterman-sum` | AutomorphicSpectralTheory §1.16 `kloosterman_sum` (equal by `kloosterman_sum_symm`) |

These were found by two Sonnet sweeps of all 537 targets against 30 supplier READMEs: TauCetiRoadmap main at 0e8b058 (newer than the local checkout), the relevant open PRs, and the atlas packages. Every SAME finding was checked by reading the supplier text.

## Kept as variants, with a one-clause difference stated

- `qPochhammer` with an arbitrary base and the infinite product in R⟦q⟧, against HabiroCyclotomicCompletions' `pochhammer` and its ℚ(q)⟦t⟧ products.
- The Euler, reciprocal Euler and Cauchy identities in R⟦q⟧ over every commutative ring, against HabiroCyclotomicCompletions §1.1 over a field.
- The two-parameter triple product (β arbitrary), against ClassicalArithmeticCompletion §4.40.
- `coefficient_maps_preserve_products` for a continuous φ, against ClassicalArithmeticCompletion §4.20 (discrete source).
- The Gauss triangular-number identity in quotient form, against ClassicalArithmeticCompletion §4.61(iii).
- `jacobi_triple_product_analytic`, now proved as GeometryOfNumbersAndQuadraticArithmetic's J(a; q) at q = e(τ), a = −e(τ/2 + z). The coordinate change was checked by hand.
- Complex-argument Bessel I_ν, J_ν, against AutomorphicSpectralTheory §0.25 (real argument). Agreement on the positive axis is a stated Check.
- The theta multiplier of the theta group (GeometryOfNumbersAndQuadraticArithmetic and MetaplecticAutomorphicForms §7.1 treat Γ₀(4)).
- The Kontsevich value and Taylor functions, against the Kontsevich element of HabiroCyclotomicCompletions §2.1.
- The Heegner forms, now built on Tau Ceti's `BinaryQuadraticForm.posDef`, `reducedForms` and `hurwitzClassNumber`. These are current library a91d3aaf, not the pin; previously they came from a ModularForms layer-11 request.
- Real-weight Eichler integrals, against ModularForms Layer 8.
- `II11` as IntegralLattices' hyperbolic plane U in Borcherds' coordinates.
- The vertex algebra over a ring, following Mathlib WIP PR 25822's shape, against AffineLieAlgebras A6 and C7 (comparison API kept from revision 5).

## The plan's one gap is closed

The fifth-order Eulerian identification (Andrews 1986, Theorem 9) was the plan's only explicit gap. It is now planned: §0.9 gives ten new targets, and §4.10 gives `fifth_order_eulerian_identification`.

**Source.** Andrews, Trans. AMS 293 (1986), §§2–6, read on page images from the free AMS PDF (SHA-256 `5d91d479…`, matching the plan). The plain URL now returns a bot check; `…S0002-9947-1986-0814916-2.pdf?download=1` with a browser user agent returned the PDF.

**New targets and their sources:**
- `IsBaileyPairIn`: Bailey pairs in a ring with invertible q-factorials, so that Andrews' pairs, with their q^{−n(n−1)/2} entries, live in K((q)).
- `q_pfaff_saalschutz`: Gasper 1995 (3.5.1).
- `bailey_lemma_parameters` (Andrews (2.3)–(2.6)), with the one-parameter form, and `bailey_lemma_limit_one_parameter` (the forms used with ρ₂ = −1 and −q).
- `bailey_inversion` (2.7). The n = 0 case is stated separately, as in revision 5's correction.
- `andrews_terminating_transformation`: the Sears-limit step of Lemma 1, with a new elementary proof (Rothe plus the partial fractions of 1/(c; q)_{m+1}).
- `andrews_lemma_two` (4.3), with a new inductive proof through the truncated functional equation (1 − z)S_n(z) = (1 − bz)S_n(zq) − (b)_{n+1}z^{n+1}/(q)_n. Andrews' own proof is a limit of Watson's transformation; Gasper (4.2.8) at e = aq^{n+1}, c, d → ∞ was also checked.
- `andrews_bailey_pair` (Lemma 1 = Theorem 3, and Theorem 4) and `andrewsA_evaluations` (Lemmas 6–7).

**Verification.** All of these were confirmed by exact rational arithmetic at generic parameters, in scratch and not in the repository:
- the terminating transformation and the partial fractions;
- Lemma 1's pair property, Lemma 2, Theorem 3's two forms and Theorem 4's pair;
- the one- and two-parameter Bailey lemma;
- Lemma 6 and all six evaluations (5.6)–(5.11);
- the q-Pfaff–Saalschütz sum;
- the f₀ Hecke identity to O(q³⁰).

The eight corrected double sums against the Eulerian series to O(q²¹⁹) were already checked in revision 5. The packet's `gaps` entry still exists; the package supersedes it.

## Required in addition from suppliers

- **MetaplecticAutomorphicForms Layer 7** (§§1.2–1.4, 5.2–5.3 here):
  - Petersson's sign cocycle and multiplier systems of weight r ∈ ½ℤ on finite-index Γ ≤ SL(2, ℤ), with holomorphic, cusp and weakly holomorphic spaces;
  - the cocycle law without the −I normalisation (v_η³ takes the value i at −I);
  - exponential decay of transformed cusp expansions.

  These are the plan's MP.7 requests; MP §7.1 has only the Γ₀(4) theta multiplier. The Γ₀(4) Shimura law requested from MP.7 is now taken from GeometryOfNumbersAndQuadraticArithmetic §4.3 instead.
- **Every other request** (ModularForms 10A–10C, Layers 0, 2, 8; FuchsianOrbifolds; LieHighestWeight; CharacterTheory; ModularCurves 5B, 9D; ThetaSeries; IntegralLattices; ContourIntegration; HabiroCyclotomicCompletions; ZerosOfLFunctions; AffineLieAlgebras C7; CFSGBasicProperties; ArithmeticQuantumTopology) is consumed as an existing contract, as the revision-4 and revision-5 reviews established.

## For the maintainer

- **Tier and cycles.**
  - QSeries is outside the 94. It consumes ArithmeticQuantumTopology Layers 3–4 (QM.5) and is consumed by AQT, HabiroNahmSeries and HabiroNumberFields; the AQT package itself says the order must separate QSeries' foundations from its applications. The suggested Layers 0–4 / 5–6 split would do that.
  - QSeries cites MetaplecticAutomorphicForms (PR #1063), which waits on AutomorphicSpectralTheory (#925). AST no longer cites QSeries, since its package owns Bessel J/I, S(m, n; c) and Δ_k, so there is no cycle there.
  - DirichletPadicLFunctions cites QM.5/hurwitz-zeta-at-zero and periodic-l-value-bernoulli. Mathlib's `HurwitzZeta.hurwitzZeta_neg_nat` may let it cite Mathlib directly.
- **HabiroNahmSeries §2.2** defines Dedekind sums itself; it should import §1.1 here.
- **HabiroNumberFields** asks QSeries QM.0–QM.1 for the normal convergence of the bilateral ₁ψ₁ sum on its annulus. The plan had no such target, so this package adds `ramanujan_one_psi_one` (§0.5), with its source and proof route in Gasper 1995 (2.1.3), (2.1.8) and (2.1.9), pp. 8–9 (Ismail's proof). It was checked numerically at three parameter sets, with a relative error of about 2·10⁻¹⁵.
- **Generality.** Layer 3 is scalar, of integral weight, on finite-index subgroups of SL(2, ℤ). The vector-valued Weil-representation theory of Bruinier–Funke §3, the Hejhal Poincaré series and the Gross–Zagier weight-two families are excluded explicitly in Scope, as a Part II direction, together with the other remaining items of the plan. This is the main generality shortfall against the 2026-10-16 rule.

## Adversarial pass

The degenerate instances below were computed. Anything marked "checked" was computed exactly, by hand or in scratch Python with exact rationals or integer power series.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `coeff_qPochhammerInf` | b = 0; b = 1 (no hypothesis); m = n | false without `constantCoeff b = 0` (b = 1 gives (1 − a)ⁿ) and false at m = n for a = 1 ((1;b)₀ = 1 vs coefficient 0) | both hypotheses kept |
| `rogers_ramanujan_first/second` | q = 0 | both sides 1 | — |
| Ramanujan mod 5, 7, 11; `crank_mod_five`, `crank_mod_eleven`, `atkin_swinnerton_dyer_theorem` | n = 0…3 by enumeration of partitions, with the Lean crank/rank definitions | equidistribution exact for 5n+4, 7n+5 (rank and crank), 11n+6 (crank) | — |
| `dedekind_reciprocity` | (h,k) = (1,1), (1,3), (2,3); non-coprime (2,2) | true; (2,2) gives −1/2 vs −1/16 | coprimality kept |
| `etaMultiplier`, `eta_transformation_law` | T, S, −I, c = 0 with d = −1, c < 0 (four matrices), c > 0 (four) | numerical relative error ≤ 2·10⁻¹⁵; v_η(T), v_η(S) proved as `example`s | — |
| `rademacherKloosterman`, `rademacher_exact_formula` | A₁ = 1 (proved example), A₂(n) = (−1)ⁿ; series at n = 1, 5, 10, 20 | 1.0003, 6.9991, 41.9989, 627.0005 with 30 terms | `1 ≤ n` kept (n = 0 makes √(n − 1/24) degenerate) |
| `hardy_ramanujan_asymptotic` | n = 100 | ratio 1.0457 | — |
| `gamma_vertical_decay` | x = 1/2 (|Γ|² = π/cosh πy), x = 1 (|Γ|² = πy/sinh πy) | consistent with √(2π)|y|^{x−1/2}e^{−π|y|/2} | — |
| `kontsevichValue`, `_eq_sum_range` | ξ = 1, −1, i; M = 2, 4 | 1, 3, 8 − 3i; period independence holds | — |
| `fifth_order_f0_andrews` | q-expansion to O(q³⁰) | holds | — |
| `seventh_order_F0_hickerson` | inherited; revision 5 checked to O(q²¹⁹) | — | — |
| `IsBaileyPairIn` | n = 0; unit pair at a = 1 (β₁ = 0); ℚ at q = 1 | pins diagonal; q = 1 excluded | α₀ = β₀ proved as `example` |
| `q_pfaff_saalschutz` | n = 0, 1; generic rationals n ≤ 5 | holds; **my first draft required q⁰ ≠ 1** | hypothesis corrected to 1 ≤ m ≤ n |
| `bailey_lemma_parameters` and one-parameter form | unit pair (gives Andrews (4.3) terms); ρ₁ = ρ₂ → ∞; generic rationals | holds | — |
| `bailey_inversion` | n = 0 at a = 1; n = 1 | the (aq)₋₁ convention fails at a = 1, so n = 0 is stated separately | — |
| `andrews_terminating_transformation` | n = 0, 1; generic n ≤ 6; partial fractions m ≤ 5 | holds | new proof |
| `andrews_lemma_two` | n = 1; a = 1, b → ∞ (Shanks); generic n ≤ 6 | holds | (a)_j/(1 − a) written (aq)_{j−1} |
| `andrews_bailey_pair`, `andrewsA_eq_hecke`, shift, Lemma 6 | generic n ≤ 6; b = 0 | second form undefined at b = 0 | first form used at b = 0 |
| `andrewsA_evaluations` (5.6)–(5.11) | q = 2/9, n ≤ 6 | holds | — |
| Layer Examples (§§0–6) | every computed value: p(6) = 11, RR coefficients, s(1,3) = 1/18, v_η(S), F₀ to q⁹, ξ_k v^{1−k} = 1 − k, ξ₂E₂* = 3/π, crank of partitions of 4, t(3) = −248, t(4) = 492, HR ratio | all recomputed | three of my draft examples were wrong and were replaced: a p(100) first-term claim, a crank example and an R-derivative line |
| `jacobi_triple_product_analytic` | substitution into J(a; q) | exact | proof rewritten |
| `II11` | isometry (m,n) ↦ (m,−n) onto U | exact | — |
| Kept-variant clauses | each read against the supplier text | — | — |

The inherited 537 contracts carry the degenerate-case Checks of five review rounds; REV~3 checked all of them. They were not recomputed here, except for the numeric cross-check described below.

## Checks run

- `lean-check research/blueprint/packages/QSeriesPartitionsAndMockModularForms/Suggested.lean`: **exit 0**, 21 warnings, all `declaration uses sorry`, no other output (Mathlib 082e2d3, Tau Ceti f790474).
- `python3 scripts/check_sorry_data.py` on the Lean file: passes.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- Every Lean declaration name occurs in the README (32 of 32).
- **Numeric cross-check.** A Sonnet subagent recomputed, with its own exact code, the concrete values in the 481 numeric Check bullets of Layers 0, 1, 2 and 5. Results: 362 confirmed, 13 ambiguous, 1 mismatch.
  - The mismatch was a misprinted decimal: π√23/6 ≈ 2.5111, not 2.5109. The stated I_{3/2} value was right; the decimal is fixed.
  - Two of the ambiguous items were bullets that did not restate their identity: the value at τ = 0.2 + 1.3i of `theta_TS_slash`, and s(0, 2) under the pinned Dedekind-sum convention. I recomputed both, confirmed them, and rewrote the bullets to be self-contained.
  - The other eleven ambiguous items are inherited bullets whose quantities are defined elsewhere in their subsection (path parametrisation, remainder constants, erratum remarks). They are left as they are.
- **Zwegers labels.** All 32 theorem, proposition, lemma and corollary labels of Zwegers' thesis cited in Layer 4 occur in arXiv:0807.4834v1 (SHA-256 `ca2b841a…`, matching the plan's record).
- **Duplication sweep.** Two Sonnet agents compared all 537 targets with 30 supplier READMEs. Every SAME verdict was read by hand (table above).

## Sources and access

| Source | Access | Read |
|---|---|---|
| Andrews 1986 | AMS PDF via `?download=1`, SHA-256 `5d91d479a67b8a5e1c10121e8619111592bf5bad238c9f8b736e120c71388998` | pp. 114–127 on page images |
| Gasper 1995 | arXiv:math/9509223v1 | §§3.4–3.5, 4.2 (pp. 18–29) |
| Andrews 1984 | msp.org, `pjm-v114-n2-p02-s.pdf` | §2, pp. 269–272 |
| Garvan 2019 | arXiv:1907.04803v1 (looked at, not cited: it treats χ₀, χ₁ only) | — |
| Upstream READMEs | TauCetiRoadmap main 0e8b058; PRs #851 (01c64f0c), #1201 (1b96abb5), #1124, #1333, #1320, #446, #1168, #253 | read as data |

No restricted book was used. The fetched pages and PR files contained no instructions directed at workers. The scratch directory will be deleted; nothing in this note depends on it.
