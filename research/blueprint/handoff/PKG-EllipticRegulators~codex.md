# PKG-EllipticRegulators~codex

Worker: Claude (Opus 5.5), session `claude-6Ij7Cc`. Issue: #10746. Date: 2026-10-19.

## Delivered

`research/blueprint/packages/EllipticRegulators/` with `README.md` (eight layers, 143 subsections, about 254 KB), `Suggested.lean` (420 lines) and `metadata.toml` (`math.NT`). The README is a specification; nothing is claimed to be formalised.

Inputs used: the accepted parent packet `EllipticRegulators.json` (75 nodes) and the eight accepted follow-up packets `EllipticRegulators--ER.1` … `--ER.8` (76 nodes). All 151 nodes are represented; the mapping is the table at the end of this note, checked by script against the packets and the README headings. The README is larger than the issue's older 50–200 KB guide because the binding 2026-10-12 shape rule keeps every target, hypothesis, locator and Check; recent packages in the same area run 196–312 KB.

The README is written in my own words with theorem/section/page locators. No source passage was copied and no section-by-section summary was written.

## Lean

- `lean-check research/blueprint/packages/EllipticRegulators/Suggested.lean`: exit 0. The only warnings are 26 `declaration uses sorry`; there are no errors. About 75 GB of memory was available. No language server, Lake build, update or cache command was run.
- Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- Headline theorems, stated at the top on Mathlib carriers: Bloch's divisor formula on `ℂ/(ℤ+ℤτ)` (`torusRegulator_eq_half_conj_diamond`), the Gaussian case of Bloch's CM theorem with the corrected scalar (`curve32a2_LSeries_two`, using Mathlib's `WeierstrassCurve.LSeries`), and the Steinberg relation (`torusRegulator_one_sub`). The torsion Fourier identity (`sum_finiteFourier10_mul_ellipticR`) is a Layer 4 milestone.
- The conventions of these statements were checked numerically in scratch scripts (not committed):
  - The Kronecker form of `R_q` gives `D_q(i) ≈ 0.94326` and `(π/2)(Im R(1/4,0) + Im R(3/4,1/2)) ≈ 0.91704` at truncation 300, against `L(32a2, 2) = 0.9170506…`.
  - The torsion Fourier identity agrees to 12 digits for three odd weights.
  - The basis change `ellipticR_S` agrees to 14 digits.
  - The divisor formula, with the exact `torusRegulator`/`torusCoord` definitions, gives −1.22278 + 1.33584i by 300² quadrature against −1.22281 + 1.33590i from the Kronecker side, on the plan's theta-quotient instance.
- All `example`s are proved, with at most two per kept definition. Data definitions all have real bodies; the orientation-changing operations (`rebase`, `conjugate`) are stated as theorems on periods rather than as data definitions with proof obligations.

## Ordering, moved-down notions, replaced citations

- EllipticRegulators and its suppliers are outside the numbered Caraiani–Newton tiers, so no numeric tier is assigned. Suppliers are used in the direction of the atlas stage links, and no consumer (SpecialValuesBirchTate, PeriodsAndSpecialValues) is used as an input. The packaged suppliers that mention EllipticRegulators all list it as a downstream consumer: AdditiveCombinatorics, ComplexComparisonPartII, ColemanIntegration, KatoEulerSystems, ModularCurvesPartII, SchemeKTheoryOperations and ModularSymbolsPadicLFunctions.
- **Moved down:** the follow-up ER.7 nodes `regulator-period-inclusion` and `regulator-nonvanishing-after-level-change` cited `PeriodsAndSpecialValues:PS.1`, a consumer of this roadmap, for Shimura's period algebraicity of twisted central values. That interface is now a target here, §7.30, sourced to Shimura 1977, Theorem 1, p. 212. PeriodsAndSpecialValues PS.1 should import §7.30 rather than export it.
- The atlas stage ER.1 lists `UPSTREAM:EllipticFunctions`. It is replaced by Mathlib's `PeriodPair`/`weierstrassP` together with ModularCurvesPartII R12.1, which owns the uniformisation. The Tau Ceti roadmap EllipticCurves deliberately leaves complex uniformisation out. No `FoundationsAndLibraryIntegration` id occurs in the inputs.
- The newform `L`-function is cited to the Tau Ceti roadmap ModularForms, Layer 7, and modular symbols to its Layer 8. Reduction types and `j`-integrality are cited to EllipticCurves, Layer 4.

## Duplication audit

I checked current TauCetiRoadmap main `0d144d0` (read-only), including the nine roadmaps newer than the atlas snapshot, and current Tau Ceti `a91d3aaf` by object: uniformisation, period lattices, dilogarithms, real-analytic Eisenstein series, Rankin–Selberg integrals, Manin symbols, modular and Siegel units, Kronecker limit formulas, Deligne cohomology, regulators, Bloch groups, Dedekind eta, Γ₁(N) and Abel–Jacobi.

- Current Tau Ceti has holomorphic Eisenstein series (level one and with character), ideal Dirichlet series and the `WeierstrassCurve` division-polynomial and torsion-divisor API. The first is a different object from §7.1's `E_x(z,s)`; the other two are cited.
- No plan node duplicates existing Tau Ceti or upstream material, so no target was removed. The overlap points are cited in Scope and ownership.
- No Lake command was run in the read-only checkouts.

## Sources and what remains unverified

**Re-read for this package** (all public, fetched to scratch):
- Brunault's thesis (arXiv:math/0602186v1): about 60 locators re-checked against the PDF pages. Corrections made: Merel's Théorème A is on p. 144, not p. 143; (1.57)–(1.58) are on p. 24; Définitions 11 and 14 are on p. 18; (2.121)–(2.123) are on p. 68.
- Bull. SMF 2007: printed page = PDF page + 213. Théorème 1.1 and Remarque 1.2 are on p. 217, Théorème 1.4 on p. 218.
- Zagier 1990: p. 616 (`J` and the Bernoulli regularisation) and Theorem 1, p. 619.
- Schappacher–Scholl author copy: all section numbers sampled; the page numbers match.
- Scholl I §1.3.3–1.3.6, pp. 8–9.
- Brunault 2016, Theorem 24, p. 13.
- Besser–de Jeu, Remark 1.10, p. 4.
- Asakura–Chida accepted manuscript: Conjecture 3.3, p. 18.

**Not re-verified:**
- **Bloch, CRM Monograph 11** is not in the cleared library and no free copy exists. Every Bloch locator (Lectures 8–11: Lemmas 8.1.1–8.2.4, 9.1.x–9.2.3, 10.2.2–10.3.5, Theorem 10.2.1, §11.1–11.2, Theorem 11.2.1, Corollary 11.2.3, Conjecture 11.2.4) is inherited from the accepted packets, which read a programme scan, and none was checked here. Wherever possible the README states the mathematics so that a free source carries it:
  - Zagier 1990 for `J(q;·)` and the Kronecker expansion;
  - Brunault for the regulator and the divisor formula;
  - the direct proofs in §§3.5–3.6 and 4.6–4.16.
  A sources job could move the remaining Bloch-only citations (the truncation lemmas of §§3.11–3.15 and the Lecture 11 CM lemmas) to free sources if any exist.
- Also not re-read here: Siegel's Tata lectures (§7.2, proof locators inherited); Shimura 1977, Theorems 1–2 (pp. 212–214); Merel's author manuscript; Deninger–Scholl; Nekovář's author copy; Schneider 1988; Goncharov 2004. Their locators are inherited from the accepted follow-up packets.
- Kept as explicit targets, not claimed as done:
  - the Hurewicz comparison in §1.3;
  - the transfer case of §7.25 (Brunault proves only the Goncharov-function analogue);
  - the continuity reduction in §3.14 (asserted without proof by Bloch);
  - the certified sign of `L(f,χ,1)` in §7.24;
  - the three-point to one-point reduction on 36a1 in §8.4;
  - the unpublished fibre-graph route in §6.6, superseded by §6.7.

## Source corrections carried into the statements

Taken from the accepted packets' confirmed source issues, and stated as mathematics in the README:
- Bloch Theorem 11.2.1: spurious `|μ_κ|`, the sign under the printed kernel (11.1.1), and the index set `W` (E7–E9).
- Bloch Lemma 11.1.3: the factor is `(γτ̄+δ)^{-1}` (E10).
- Bloch Lemma 10.2.3: capital `C` (E11).
- Bloch: "Theorem 10.3.2" means Theorem 10.2.1 (E12).
- Zagier's weight-two constant (E6, E-ER3-1).
- Merel's Théorème D: factor 4 (E15).
- Brunault Théorème 1: `w(E)` should be `ε(E)` (E16).
- Brunault (6) and (8): factors −4 and −1, with π in place of π² (E17).
- Brunault (3.155)–(3.156) (E18).
- Nekovář's author-copy pairing factor `1/(2πi)` (E24–E27).
- Asakura–Chida: the `γ^{-ν}τ(χ)L(E,χ^{-1},1)` convention and the arXiv factor `α^{-ν}` (E28–E29).

Bloch's Remark 11.2.2(i), on bad Euler factors (E13), is not stated in the README: only `L(E,2)` from Mathlib's full Euler product is used.

## Adversarial pass

| Statement | Instances tried | Result / change |
|---|---|---|
| Divisor formula (Lean headline) | `n=0` (constant f) and `n'=0`; multiplicity-zero points; representatives of `Q_j−P_i` outside the fundamental domain; `Im τ ≤ 0` | Both sides 0 for constants (`torusRegulator_const_left`, and the proved example for a constant second entry). `R` is integer-periodic in `(a,b)`. `hτ` required. Incongruence of points is a hypothesis. Numerically confirmed. |
| CM theorem 32a2 (Lean headline) | Bad prime 2 (additive, local factor 1); summability at s=2; printed scalar | Mathlib local polynomial is 1 at additive primes. s=2 lies in absolute convergence by Hasse. The printed scalar gives −4L; the corrected value is matched numerically. |
| Steinberg relation | f constant c: c=0 excluded, c=1 excluded by `hf'`; other c trivially 0 | True as stated |
| `rebase_ratio` | M = I, −I, S, T | −I fixes τ; the S convention gives −1/τ; the denominator is nonzero since τ is non-real |
| `two_re_tau_of_real`, `q_neg_of_re_half` | m=0,1; τ=1/2+iy | 2Re τ = m; q = −e^{−2πy} < 0 |
| `summable_kroneckerTerm` | τ real | Fails without `hτ`; hypothesis kept |
| `ellipticR_neg`, `ellipticR_add_one_right` | arbitrary τ | Termwise identities; true |
| `ellipticR_S` | τ=0.23+1.05i, (a,b)=(0.31,0.17) | Agrees to 14 digits; coordinates of `z/τ` in `(1,−1/τ)` are `(b,−a)` |
| Torsion Fourier identity | C=1, 2 (odd f vanishes); C=3, 4 odd weights; complex weights | Both sides 0 in the degenerate cases; numerically exact otherwise |
| `finiteFourier10` | C=1 identity (proved); 1/C vs 1/C² | Lecture 10 normalisation 1/C² pinned; Parseval check 1/9 in README |
| `diamond` | [1]⋄[3]=[2] in ℤ/5 (proved); opposite convention | Reflection, not negation (`diamond_comm`) |
| `regulatorDet`, witnesses | d=0 (proved =1); ℓ=0 (proved no witness); zero regulator; projection ℚ²→ℚ; irrational slope | Surjectivity without injectivity recorded; ℚ-injectivity ≠ real injectivity |
| `hasDeterminantWitness_atTwo_iff` | d=1, N=32, w=1 (factor 8); d=2, N=16, w=−1 (factor −1); L₂=0 | (2π) not π; both predicates fail at L₂=0 |
| `fixedLevelBeilinson` | cancellation (proved member); vertical non-member (proved) | Span before comap |
| `normalizedUnitReduction` | u=p (proved 1); v(p)=2 (proved ac(u)²); u·p^a | Exponent e_C, not 1 |
| `frobeniusRegulatorScalar` | r=0 (proved 0); B(ω,v)=0; v ↦ 7v; p=5, γ=2 | −9/2; the denominator guard is in every geometric use |
| `WeightTwoBeilinsonRelation` | r_p=0 (proved false); wrong ratio; sign ε=−1 | Zero regulators rejected |
| §2.1, §2.3 dimension | ℚ, ℚ(i), ℚ(√2) | r₁+2r₂ = [F:ℚ], not r₁+r₂ |
| §2.6 factor | theta-quotient pair | r_Beil = 2r_E numerically; no 2π |
| §3.3 J(q;·) | two-sided sum; non-permitted lift | Diverges; the Bernoulli term restores q-invariance |
| §5.15 CM theorem | 32a2, 36a1, 49a1; level 14 with Bloch's index set | Scalars π/2, 2π/3, 4π/7; the level-14 index set is off by a factor of 2 |
| §6.9 leading term | d=2 | wN/(16π⁴), and L″(0)/2! rather than L″(0) |
| §7.5 Hecke separation | p=5, 7 | p−1 > 2√p first holds at p=7 |
| §7.14 explicit theorem | N ≡ 2 mod 4 (N=14) | Empty; recorded |
| §7.22–7.23 Brunault Thms 1–2 | 11a3 | Signs and constants corrected; the printed versions are non-examples |
| §1.8 real cycles | m=1 | Anti-invariant generator (−1,2), index 2, normalised period 2iy |

## Coverage table (plan node → README subsection)

| Plan node | README subsection |
|---|---|
| `EllipticRegulators:ER.1/complex-uniformisation` | §1.2 |
| `EllipticRegulators:ER.1/the-q-parameter-and-the-multiplicative-presentation` | §1.2 |
| `EllipticRegulators:ER.1/periods-and-the-comparison-isomorphism` | §1.3 |
| `EllipticRegulators:ER.1/all-embeddings-and-the-conjugation-action` | §1.6 |
| `EllipticRegulators:ER.2/the-deligne-cohomology-target` | §2.1 |
| `EllipticRegulators:ER.2/the-eta-form-and-its-differential-identity` | §2.4 |
| `EllipticRegulators:ER.2/the-regulator-on-symbols` | §2.5 |
| `EllipticRegulators:ER.2/the-normalisation-factor` | §2.6 |
| `EllipticRegulators:ER.2/torsion-ambiguity-has-zero-regulator` | §2.8 |
| `EllipticRegulators:ER.3/the-elliptic-dilogarithm` | §3.2 |
| `EllipticRegulators:ER.3/the-companion-and-Bloch-convention` | §3.3 |
| `EllipticRegulators:ER.3/the-steinberg-relation-by-truncation` | §3.16 |
| `EllipticRegulators:ER.3/fourier-and-kronecker-eisenstein` | §3.6 |
| `EllipticRegulators:ER.3/bloch-wigner-bounds-at-zero` | §3.1 |
| `EllipticRegulators:ER.3/lattice-basis-change` | §3.7 |
| `EllipticRegulators:ER.3/green-function-of-the-curve` | §3.8 |
| `EllipticRegulators:ER.3/goncharov-function-and-the-regulator` | §3.9 |
| `EllipticRegulators:ER.3/steinberg-relation-on-the-projective-line` | §3.10 |
| `EllipticRegulators:ER.3/truncated-theta-products` | §3.11 |
| `EllipticRegulators:ER.3/zeros-of-truncated-products` | §3.12 |
| `EllipticRegulators:ER.3/companion-truncation-estimates` | §3.13 |
| `EllipticRegulators:ER.3/steinberg-for-the-companion` | §3.14 |
| `EllipticRegulators:ER.3/steinberg-for-the-dilogarithm` | §3.15 |
| `EllipticRegulators:ER.4/the-diamond-convolution` | §4.1 |
| `EllipticRegulators:ER.4/the-divisor-formula` | §4.2 |
| `EllipticRegulators:ER.4/the-regulator-of-the-corrected-classes` | §4.5 |
| `EllipticRegulators:ER.4/transfer-and-the-trace-formula` | §4.18 |
| `EllipticRegulators:ER.4/bloch-lift-formula` | §4.3 |
| `EllipticRegulators:ER.4/finite-fourier-transform` | §4.4 |
| `EllipticRegulators:ER.4/bloch-theorem-10-2-1` | §4.17 |
| `EllipticRegulators:ER.5/the-CM-setup-and-the-hecke-character` | §5.1 |
| `EllipticRegulators:ER.5/the-class-U` | §5.9 |
| `EllipticRegulators:ER.5/the-L-value-theorem` | §5.15 |
| `EllipticRegulators:ER.5/nonvanishing-and-what-is-not-claimed` | §5.16 |
| `EllipticRegulators:ER.5/fourier-transform-on-O-mod-C` | §5.2 |
| `EllipticRegulators:ER.5/lattice-sum-form-of-theorem-10-2-1` | §5.4 |
| `EllipticRegulators:ER.5/cm-twisting-and-distribution` | §5.5 |
| `EllipticRegulators:ER.5/fourier-transform-of-the-character` | §5.6 |
| `EllipticRegulators:ER.6/the-regulator-on-the-integral-part` | §6.1 |
| `EllipticRegulators:ER.6/the-beilinson-statement` | §6.2 |
| `EllipticRegulators:ER.6/three-conclusions-that-are-not-the-same` | §6.3 |
| `EllipticRegulators:ER.6/the-vertical-step-that-is-required` | §6.4 |
| `EllipticRegulators:ER.6/potentially-good-reduction-integrality` | §6.6 |
| `EllipticRegulators:ER.6/beilinson-forms-equivalent` | §6.8 |
| `EllipticRegulators:ER.7/modular-units-and-their-divisors` | §7.6 |
| `EllipticRegulators:ER.7/the-regulator-integral-and-its-evaluation` | §7.14 |
| `EllipticRegulators:ER.7/the-explicit-theorem-for-an-elliptic-curve` | §7.22 |
| `EllipticRegulators:ER.7/the-pushforward-and-its-hypotheses` | §7.26 |
| `EllipticRegulators:ER.7/real-analytic-eisenstein-series` | §7.1 |
| `EllipticRegulators:ER.7/kronecker-limit-formulas` | §7.2 |
| `EllipticRegulators:ER.7/dirichlet-series-convolution` | §7.11 |
| `EllipticRegulators:ER.7/rankin-selberg-integral` | §7.12 |
| `EllipticRegulators:ER.7/manin-drinfeld` | §7.4 |
| `EllipticRegulators:ER.7/harmonicity-of-eisenstein-series` | §7.3 |
| `EllipticRegulators:ER.7/divisors-of-character-units` | §7.7 |
| `EllipticRegulators:ER.7/rationality-of-modular-units` | §7.8 |
| `EllipticRegulators:ER.7/symbols-of-modular-units-in-K2` | §7.9 |
| `EllipticRegulators:ER.7/explicit-beilinson-theorem-degeneracy` | §7.13 |
| `EllipticRegulators:ER.7/real-structure-of-the-regulator` | §7.10 |
| `EllipticRegulators:ER.7/spanning-for-prime-level` | §7.15 |
| `EllipticRegulators:ER.7/eta-form-of-divisors` | §7.16 |
| `EllipticRegulators:ER.7/manin-cycle-and-its-boundary` | §7.17 |
| `EllipticRegulators:ER.7/unfolding-over-the-fundamental-domain` | §7.18 |
| `EllipticRegulators:ER.7/cycle-formula` | §7.19 |
| `EllipticRegulators:ER.7/nonvanishing-of-a-twisted-value` | §7.20 |
| `EllipticRegulators:ER.7/rational-combination-for-L-E-2` | §7.21 |
| `EllipticRegulators:ER.7/prime-level-L-value-formula` | §7.23 |
| `EllipticRegulators:ER.7/the-X1-11-example` | §7.24 |
| `EllipticRegulators:ER.7/regulator-under-finite-pushforward` | §7.25 |
| `EllipticRegulators:ER.8/the-syntomic-comparison` | §8.12 |
| `EllipticRegulators:ER.8/the-normalisation-example` | §8.1 |
| `EllipticRegulators:ER.8/the-CM-worked-example` | §8.2 |
| `EllipticRegulators:ER.8/the-integrality-worked-example` | §8.9 |
| `EllipticRegulators:ER.8/the-nonrational-torsion-example` | §8.5 |
| `EllipticRegulators:ER.8/the-conductor-14-example` | §8.10 |
| `EllipticRegulators:ER.1/oriented-regulator-period-data` | §1.1 |
| `EllipticRegulators:ER.1/oriented-basis-transport` | §1.4 |
| `EllipticRegulators:ER.1/conjugate-oriented-periods` | §1.5 |
| `EllipticRegulators:ER.1/real-period-shape` | §1.7 |
| `EllipticRegulators:ER.1/primitive-real-regulator-cycles` | §1.8 |
| `EllipticRegulators:ER.1/exponential-conjugation-coordinates` | §1.9 |
| `EllipticRegulators:ER.1/regulator-period-handoff` | §1.10 |
| `EllipticRegulators:ER.2/elliptic-deligne-specialisation-contract` | §2.1 |
| `EllipticRegulators:ER.2/archimedean-orbit-equivalence` | §2.2 |
| `EllipticRegulators:ER.2/archimedean-rank-from-orbits` | §2.3 |
| `EllipticRegulators:ER.2/chern-character-symbol-comparison` | §2.7 |
| `EllipticRegulators:ER.2/oriented-period-coordinate-comparison` | §2.9 |
| `EllipticRegulators:ER.3/weight-two-kronecker-kernel` | §3.4 |
| `EllipticRegulators:ER.3/complex-fourier-coefficient-calculation` | §3.5 |
| `EllipticRegulators:ER.3/complex-fourier-reconstruction` | §3.6 |
| `EllipticRegulators:ER.3/relative-projective-line-chow-bridge` | §3.10 |
| `EllipticRegulators:ER.4/direct-series-convergence` | §4.6 |
| `EllipticRegulators:ER.4/weighted-logarithmic-term` | §4.7 |
| `EllipticRegulators:ER.4/weighted-dilogarithmic-term` | §4.8 |
| `EllipticRegulators:ER.4/dilogarithmic-orbit-splitting` | §4.9 |
| `EllipticRegulators:ER.4/torsion-bernoulli-horizontal-term` | §4.10 |
| `EllipticRegulators:ER.4/logarithmic-lattice-evaluation` | §4.11 |
| `EllipticRegulators:ER.4/dilogarithmic-forward-evaluation` | §4.12 |
| `EllipticRegulators:ER.4/dilogarithmic-boundary-evaluation` | §4.13 |
| `EllipticRegulators:ER.4/dilogarithmic-lattice-evaluation` | §4.14 |
| `EllipticRegulators:ER.4/direct-raw-fourier-identity` | §4.15 |
| `EllipticRegulators:ER.4/direct-regularized-fourier-identity` | §4.16 |
| `EllipticRegulators:ER.5/dual-first-fourier-comparison` | §5.3 |
| `EllipticRegulators:ER.5/cm-gauss-coefficient` | §5.7 |
| `EllipticRegulators:ER.5/primitive-gauss-normalization` | §5.8 |
| `EllipticRegulators:ER.5/conductor-fiber-regulator-evaluation` | §5.10 |
| `EllipticRegulators:ER.5/unit-orbit-regulator-count` | §5.11 |
| `EllipticRegulators:ER.5/principal-generator-L-series-comparison` | §5.13 |
| `EllipticRegulators:ER.5/cm-ideal-series-at-two` | §5.12 |
| `EllipticRegulators:ER.5/unit-factor-cancellation-certificate` | §5.14 |
| `EllipticRegulators:ER.5/three-CM-normalization-examples` | §5.17 |
| `EllipticRegulators:ER.5/extra-prime-level-counterexample` | §5.18 |
| `EllipticRegulators:ER.6/regulator-determinant-in-betti-coordinates` | §6.10 |
| `EllipticRegulators:ER.6/constructed-determinant-witness` | §6.10 |
| `EllipticRegulators:ER.6/full-integral-basis-criterion` | §6.11 |
| `EllipticRegulators:ER.6/strictness-and-a-vertical-non-example` | §6.5 |
| `EllipticRegulators:ER.6/modularity-supplied-leading-term-limit` | §6.9 |
| `EllipticRegulators:ER.6/determinant-witnesses-in-the-two-normalisations` | §6.12 |
| `EllipticRegulators:ER.6/potentially-good-integrality-by-local-descent` | §6.7 |
| `EllipticRegulators:ER.6/integral-nonzero-bloch-class` | §6.13 |
| `EllipticRegulators:ER.6/regulator-det-change-betti` | §6.10 |
| `EllipticRegulators:ER.6/determinant-witness-surjective` | §6.10 |
| `EllipticRegulators:ER.6/determinant-witness-rescale-value` | §6.10 |
| `EllipticRegulators:ER.7/fixed-level-beilinson-subspace` | §7.27 |
| `EllipticRegulators:ER.7/beilinson-subspace` | §7.28 |
| `EllipticRegulators:ER.7/cuspidal-hecke-separation` | §7.5 |
| `EllipticRegulators:ER.7/constant-symbol-regulator-correction` | §7.29 |
| `EllipticRegulators:ER.7/regulator-period-inclusion` | §7.31 |
| `EllipticRegulators:ER.7/regulator-nonvanishing-after-level-change` | §7.32 |
| `EllipticRegulators:ER.7/isotypic-regulator-image` | §7.33 |
| `EllipticRegulators:ER.7/beilinson-rational-structure` | §7.33 |
| `EllipticRegulators:ER.7/beilinson-determinant-formula` | §7.34 |
| `EllipticRegulators:ER.7/ordinary-unit-reduction` | §7.35 |
| `EllipticRegulators:ER.7/supersingular-orders-of-modular-units` | §7.36 |
| `EllipticRegulators:ER.7/full-level-modular-symbol-integrality` | §7.37 |
| `EllipticRegulators:ER.7/integral-beilinson-subspace` | §7.38 |
| `EllipticRegulators:ER.7/elliptic-beilinson-subspace` | §7.39 |
| `EllipticRegulators:ER.7/elliptic-regulator-adjointness` | §7.40 |
| `EllipticRegulators:ER.7/modular-elliptic-regulator-line` | §7.41 |
| `EllipticRegulators:ER.8/good-reduction-elliptic-pairing` | §8.13 |
| `EllipticRegulators:ER.8/elliptic-syntomic-etale-factor` | §8.15 |
| `EllipticRegulators:ER.8/frobenius-regulator-scalar` | §8.14 |
| `EllipticRegulators:ER.8/neron-refinement-period-dictionary` | §8.16 |
| `EllipticRegulators:ER.8/weight-two-beilinson-relation` | §8.17 |
| `EllipticRegulators:ER.8/weight-two-padic-beilinson-conjecture` | §8.18 |
| `EllipticRegulators:ER.8/cm36-full-torsion-certificate` | §8.3 |
| `EllipticRegulators:ER.8/cm36-corrected-l-value` | §8.4 |
| `EllipticRegulators:ER.8/quadratic-corrected-symbol` | §8.6 |
| `EllipticRegulators:ER.8/quadratic-transfer-certificate` | §8.7 |
| `EllipticRegulators:ER.8/quadratic-regulator-trace` | §8.8 |
| `EllipticRegulators:ER.8/integral-example-padic-eligibility` | §8.11 |
