# Independent package review: EffectiveClassNumbers

Issue #10395, job `REV-PKG-EffectiveClassNumbers~adv`. Claude (Opus 5.5), session `claude-yu16TT`, 2026-10-18. This session did not write the package (session `claude-57HI2D`, PR #10386), its plan or any earlier review of it.

## Verdict

**Accepted with the fixes in this review.** As the maintainer's identity note directs, the package in `research/blueprint/packages/EffectiveClassNumbers/` was reviewed against the effective-class-number plan in `research/blueprint/packets/AnalyticNumberTheoryPartII.json` (stages ECN.0–ECN.5, accepted by REV-DESIGN-AnalyticNumberTheoryPartII~2), not against the Layers 4–6 split that now owns the name AnalyticNumberTheoryPartII. All 39 plan nodes are present in the README; the author's correspondence table in `handoff/PKG-AnalyticNumberTheoryPartII.md` was spot-checked node by node for every stage. The package's additions beyond the plan's nodes (the radicand bridge, §§0.6–0.7, §§2.9–2.10, §3.1, §4.4, §5.2, §5.5) are the targets that the plan's supplier requests required and that no supplier owns. They close gaps; they do not claim more than the plan supports.

The maintainer's rule that roadmaps state mathematics, not computational certificates or datasets, was applied throughout. Six certificate or dataset targets were rewritten as the mathematical statements they certify (correction 5). ComputationalNumberTheory, a certificate roadmap dropped from the upstream order, is no longer a supplier.

Read: WORKERS.md, PROTOCOL.md §§5, 13, 20, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md, the whole README (1,020 lines before the fixes), the whole Suggested.lean, the packet and the author's handoff.

## Corrections made

1. **Contour of the truncated residue (§1.6).** The README put the indented contour Δ on the line Re s = σ > 3/2. In O85 §3.2 (figure, p. 315), Δ follows **Re s = 1**, with a rectangular detour [1 − η, 1] × [−η′, η′] to the left of s = 1, η ≤ 1/4, and η′ small enough that Ψ is holomorphic between Δ and Re s = σ. Corrected, with the observation that Re s ≥ 3/4 on Δ, so no local denominator of C2 vanishes. The residue-theorem step now names the region between Δ and Re s = σ.
2. **Strict lattice inequality (§0.2).** `reducedForm_four_mul_c_sq_ge` claimed 4c² > d for every reduced form with d ≠ 4. That is false for imprimitive forms: d = 16 has the reduced form (2,0,2) with 4c² = 16. The strict inequality now requires the form to be primitive (in particular −d fundamental). The README explains when equality holds and adds d = 16 as a negative control. O85 states the inequality only for field discriminants.
3. **Choice of U in Oesterlé's theorem (§1.8).** The proof said the largest ramified prime exceeds U "unless t = 1". O85 §3.5, Lemma 1 (p. 318) shows that the largest prime divisor of d always exceeds U, since genus theory gives t ≤ 2m and d or d/4 is squarefree. It also shows that at most one prime p ≤ U splits, and that such a p satisfies p ≥ (d/4)^(1/h). Both are restated. The h = 4 Check compared with "m = 2" while computing m = 1. It now explains why m = 3/2 is needed: when h = 4, genus theory allows t = 3, and t ≤ 2m fails for m = 1.
4. **Reflection argument (§1.5).** The proof said the two vertical integrals "are equal and their difference is 0". Restated precisely: the residue theorem gives I(σ) = I(2 − σ), the substitution s ↦ 2 − s gives I(2 − σ) = −I(σ), hence I(σ) = 0. O85's own route through Re s = 1 is noted. The C4 strip-decay condition (§1.2, §3.1) now ranges over the strips of the closed half-plane Re s ≥ 1, as in O85 C4 (p. 314) and as `oesterleTechnical` already states it (hypothesis `1 ≤ A`), instead of over the larger neighbourhood.
5. **Certificates and datasets restated as mathematics (maintainer's rule).**
   - §2.5 `bgzKernel_enclosure_sound` ("a terminating procedure returns a rational interval") was replaced by two theorems. `bgzKernel_series_remainder` is the alternating-series remainder, valid for an integer K ≥ x, with the negative control x = 5, K = 1. `bgzKernel_integral_tail_le` bounds the tail of the defining integral for Y ≥ e^(r−1).
   - §2.6 tail: "beyond a certified threshold … a geometric series" became the explicit bound 4·r!·e^(−α(B+1))/((α(B+1))^r(1 − e^(−α))), from τ(n) ≤ 2√n.
   - §2.7 `centralDerivative_enclosure_sound` and its list of "certificates used below" became five named numerical theorems:
     - `curve5077_deriv_small`: |L′(E₅₀₇₇,1)| < 10⁻¹²;
     - `curve5077_third_deriv_bounds`: 173/100 < L‴/3! < 174/100;
     - `curve5077_twist7_central_bounds`: 4 < L(E₅₀₇₇⊗χ₋₇,1) < 5;
     - `curve139_third_deriv_bounds`: 1842/100 < L‴(E₁₃₉,1)/3! < 1844/100;
     - `curve37_central_bounds`: 72/100 < L(curve37,1) < 73/100.

     The old README stated E₁₃₉ only as "an interval excluding 0" and stated L(curve37,1) ≠ 0 without a value. Both values were computed in this review, and the E₁₃₉ value is cross-checked by BSD (table below). §§2.8, 2.11–2.13 now cite these names.
   - §2.4 `arithmeticRank_certificates` was renamed `mordellWeilRank_eq_three` in README and Lean. "Certified enclosures" became rational bounds giving a positive lower bound for the Gram determinant. The E₁₃₉ descent is now part of the proof, not a "certificate". Its 2-Selmer claim is qualified by the BSD consistency check, with a 3-isogeny descent as fallback.
   - §3.4 "Rational certificate datasets for the constants" (`oesterleCertificate139/5077`) became §3.4 "Oesterlé's constant for the two curves". `oesterleConstant_139` (C = 7000 in every local case) and `oesterleConstant_5077` (C = 55, strictly below 55 on prime d) state the conclusion of `oesterleTechnical` for the explicit data. Their proof sketch lists the quantities c₁, c₂, c₃, c₅, c₇(λ) and how each is bounded. O85 §4.1's expressions for c₁ and c₅ are cited (p. 320). §§3.6–3.7 now cite these names.
   - §5.2 `hardyZ_enclosure_sound` became `hardyTheta_stirling`: ϑ_χ through Im log Γ, with Stirling's remainder from DLMF §5.11(ii). `hardyZ_approximate_functional_equation` is Lavrik's form, MW74 (8), p. 539. §5.3 is retitled, and its primality claims rest on Mathlib's `norm_num` primality extension.
   - §5.5 "Sieve certificates" (`patternSieve_sound`, a certificate format) became `leastInertPrime_43/67/163`, with the predicate "x-inert". The thresholds are the least prime solutions of LLS70 Table III (p. 440). Checks cover the condition at 2, the composite least solution 77683 = 131·593 for the 43-pattern, and the 41-inert prime 222643.
   - §5.7 now proves 165 < 72 log 10 from Mathlib's `Real.exp_one_lt_d9` and an exact rational power, not from EffectiveDiophantineMethods' log enclosures.
   - The intro, the Effectivity convention, the scope bullets, "How to read the build", the Layer 2 standing assumptions, Downstream consumers and every Dependencies list were reworded to match. The ComputationalNumberTheory supplier section, its scope bullet and its reference entry were removed. Primality of explicit numbers is decided by Mathlib's `Nat.Prime` (`Mathlib.Tactic.NormNum.Prime`). The EffectiveDiophantineMethods contract keeps only its mathematical Layer 0/3 statements (§0.11, §§3.2–3.22); its enclosure layers §0.1, §0.7 and §2.1 are no longer consumed.
6. **Suggested.lean.**
   - Renamed `mordellWeilRank_eq_three`.
   - Added `curve139_third_deriv_bounds`.
   - Added the real-bodied predicate `IsInertPrime` with `leastInertPrime_43`, `_67` and `_163` (`IsLeast` statements), plus a proved negative-control `example` (77683 is not prime, so not 43-inert).
   - Removed "certificate formats" from the module docstring and rewrote the closing list of README-only targets.

## Source verification

The author flagged GZ83 p. 87, LLS70 pp. 433–447 and O88 pp. 66–67 as "taken from the accepted plan, not re-read". I read LLS70 Table III (p. 440). O88 sits behind e-periodica's viewer and GZ83 was not opened in this review: their locators are unchanged and still rest on the plan's reading. All downloaded PDFs (O85, GZ86, GZ83, BGZ85, MW74, LLS70, G77) match the SHA-256 values recorded in the packet. Pages were read as rendered images where the text layer drops formulas.

| Locator in the README | Source page read | Result |
| --- | --- | --- |
| O85 Theorem 1, θ(d), factors at 2, 3, 5, 7 | O85 pp. 310–311 | confirmed |
| O85 §1.2–1.3, reduced forms, a ≤ √(d/3), c ≥ √d/2, (1.3.1)–(1.3.2), integrated N_q bound | O85 pp. 311–312 | confirmed; strict c > √d/2 is for field discriminants (correction 2) |
| O85 §1.4 a), b) | O85 p. 312 | confirmed |
| O85 (2.3.1)–(2.3.3) | O85 p. 313 | confirmed; the ζ(s − 1) factor is only at p ∤ N, as the README records |
| O85 C1–C4, (3.1.1) | O85 p. 314 | confirmed; C4 strips are in Re s ≥ 1 (correction 4) |
| O85 §3.2 contour Δ, (3.2.1)–(3.2.2) | O85 p. 315 | **README wrong, corrected** (correction 1) |
| O85 Lemmas 1–3, Examples 1–2 | O85 pp. 315–316 | confirmed: kernel, Mellin transforms μ̂′ = (π/2)(s/(s − 1))(√d/2)^(−s) and s/(s − 1/2) |
| O85 Proposition 1, c₄ = M/96, c₅ = 2π⁴M^(3/2)/3, c₆ = 4π²eM^(3/2)·max(2, log 4M) | O85 pp. 317–318 | confirmed |
| O85 §3.5 choice of U, Lemma 1, (3.5.1)–(3.5.4), Theorem 2 | O85 p. 318 | confirmed; Lemma 1's content restated (correction 3) |
| O85 (3.5.5)–(3.5.6), C = max(λ, (c₅/\|c₁\|)(1 + c₇(λ))) | O85 p. 319 | confirmed |
| O85 §4.1 Proposition 2, G_p at ramified p; c₁, c₅ for M = N/(4π²) | O85 pp. 319–320 | confirmed |
| O85 §4.3 E₀, f₁, the corrected factor at 139, M = 37^α139^β/(4π²) | O85 pp. 320–321 | confirmed |
| O85 §5.1, constants 7000 and 55, MW range | O85 p. 321 | confirmed |
| GZ86 (6.3)–(6.5) | GZ86 p. 230 | confirmed |
| GZ86 Proposition (7.4) | GZ86 p. 231 | confirmed (model −139y² = x³ + 10x² − 20x + 8) |
| GZ86 Theorem (8.1), (8.2), log C(t) ~ 4√(t/log t), C(1) = 55, 5077 vs 714877, h = 3 ⇒ \|D\| ≤ 907 | GZ86 p. 232 | confirmed |
| BGZ85 (2), (7), N₃ = 7, N₅ = 10, height matrix, regulator (8) | BGZ85 pp. 473–476 | confirmed |
| BGZ85 (14), Table 2 | BGZ85 pp. 479–480 | confirmed (and recomputed, below) |
| MW74 Theorem; LLS's range 10¹² | MW74 p. 530 | confirmed |
| MW74 Lemma 1 (T, U, P_k, A) | MW74 p. 531 | confirmed |
| MW74 (3)–(5), Lemmas 2–4 | MW74 pp. 532–533 | confirmed: Lemma 3 gives a ≥ (d/4)^(1/h) for odd h |
| MW74 Table I, γ for k = 17923, 115147, 123204 | MW74 p. 537 | confirmed; the brackets are ±1 in the last place |
| MW74 §4: k = 17923 on 10¹²–10⁵², k = 115147 with windows 10⁸⁵⁰–10⁸⁶⁰ and 10¹⁷⁰⁵–10¹⁷³⁵, k = 123204 | MW74 pp. 537–538 | confirmed |
| MW74 §5, (8) | MW74 p. 539 | confirmed |
| LLS70 Table III, least prime solutions 1333963, 51599563, 1432817816347 | LLS70 p. 440 | confirmed |

## Numerical verification (independent exact or floating computation)

| Statement | Computation | Result |
| --- | --- | --- |
| Curves | Δ, c₄, c₆, j of `curve139`, `curve37`, the O88 model, E₀ and `curve5077` | Δ(E₁₃₉) = 37·139⁶, c₄ = 139²·160, c₆ = (−139)³(−2008), j = 4096000/37; O88 model j = j(E₀), Δ = 37³·139⁶; Δ(E₅₀₇₇) = 5077, c₄ = 336 |
| Points | the four integral points of E₁₃₉, P₀, P₁, P₂, (0, −2), 2Q₂ | all as stated; 2Q₂ = (350, −3741) |
| a_p | E₁₃₉ against χ₋₁₃₉·a_p(curve37) at 2–13; #E₅₀₇₇(𝔽₃, 𝔽₅); #E₁₃₉(𝔽₃, 𝔽₇) | as stated |
| Heights (2(O)) | doubling 6–7 times with exact rationals | E₅₀₇₇ Gram matrix and regulator 0.41714 as BGZ85; E₁₃₉ diagonal 4.5802, 1.5515, 2.3720, determinant 15.364 (README said "about 15.37": changed to 15.36); lattice minimum of E₅₀₇₇ is ĥ(P₁) = 0.6682, only ±P₀, ±P₁, ±P₂ below 1 |
| BGZ series | §2.6 with the kernel by quadrature | E₅₀₇₇: r = 1 partial sums 3.8748, 1.2211, total ≈ 10⁻¹³; r = 3 partial sums 4.5335, 2.5635, 1.4644, 1.8080, total 1.73184990 |
| Twisted value | L(E₅₀₇₇⊗χ₋₇,1), 2048 terms, tail bound | 4.47676; α = 0.012597 > 1/80; tail 2·10⁻⁹ |
| E₁₃₉ | L′(1) and L‴(1)/3! with 6000 terms; Ω by the AGM; c₁₃₉ from the roots of the 2-division cubic of curve37 mod 139 | L′ ≈ 7·10⁻¹³; L‴/3! = 18.4294; Ω = 0.29985; c₃₇ = 1, c₁₃₉ = 4; L‴/3!/(Ω·R·c₃₇c₁₃₉) = 1.0001 |
| curve37 | L(1) | 0.72568 |
| Class number three | reduced forms of every negative fundamental discriminant up to 10⁴ | exactly the sixteen listed; reduced forms of 907, 139, 23, 20, 12, 4, 16 as in the Checks |
| Inert patterns | sieve of the primes ≡ 3 mod 8 below 5.2·10⁷ | least 41-, 43- and 67-inert primes 222643, 1333963, 51599563; least integer with the 43-pattern 77683 = 131·593 |
| §§4.1–4.7 | C₅₅(2), θ(84)·C_c(3), κ(1/2), κ(1/4), the κ derivation chain, 2.7182818286¹⁶⁵ < 10⁷² | as stated; the κ chain checked step by step (AM–GM split, log 2 ≥ 1/2, e^x ≤ 4^x, 7000 < 2¹³) |

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `reducedForm_four_mul_c_sq_ge`, strict part | d = 4, 3, 16, 36 | fails for the imprimitive (2,0,2), (3,0,3) | primitivity hypothesis; d = 16 Check |
| §1.6 contour | O85 figure | Δ on Re s = 1, not Re s = σ | corrected |
| §1.8 Lemma 1 | t = 1 (d = 8, p, 4p), h = 4 with t = 3 | largest prime divisor always exceeds U; m = 1 fails at h = 4 | proof and Check corrected |
| §1.5 reflection | F = (s − 1)³e^((s−1)²), F = e^((s−1)²) | the README's values 1/(2√π) and 1/2 recomputed | proof wording corrected |
| C4 strip decay | Lean `1 ≤ A` against README "neighbourhood" | generality mismatch | README matched to O85 and Lean |
| `bgzKernel_series_remainder` | x = 5, r = 1, K = 1 | terms 6.25, 6.94 increase; the bound needs K ≥ x | hypothesis and Check |
| §2.4 E₁₃₉ upper bound | Sha[2] ≠ 0 would make dim Sel₂ > 3 | BSD quotient 1.000 makes this unlikely but does not exclude it | 3-isogeny descent recorded as fallback |
| §1.1 completion | d = 2, M = 3, Ψ ≡ 2, G ≡ 5; d^s in place of d^(s−1); 1/d at s = 1 | values 30, 18 (36), dM | unchanged |
| §0.6, §0.7 | d = 23 values of (1,1,6); Mellin transform of ν at s = 2 | 6, 6, 8, 8, 12, 12; 4π/d with the atom, 2π/d without | unchanged |
| §1.4 | δ₁ against (δ_{1/2} + δ_{3/2})/2; signed −δ_{1/2} | integrated hypothesis holds without pointwise domination; positivity needed | unchanged |
| §1.7 | c₅ for M = N/(4π²) | πN^(3/2)/12 | §3.4 Check against the wrong power M |
| §2.3 root numbers | χ₋₁₃₉(−37), χ₋₇(−5077), nonsplit node at x = 92 | −1, +1·(−1), 1104 a non-residue | unchanged |
| §3.2 sign condition | K = ℚ(√−23), ℚ(√−7) for N = 5077 | applies, does not apply | unchanged |
| §3.6–3.7 split branches | log(d/4) ≤ h·log 37 and h·log 5077 | below 7000h and 55h; strict for prime d | unchanged |
| §5.6 chain | 4·43³, 4·67³, 4·163³ against the least inert primes | each strictly below the next threshold | unchanged |
| `IsInertPrime` | q = p (ramified), 77683 composite | legendreSym 0 excludes q = p; 77683 not prime | new Lean Check |

## Gaps, suppliers and boundaries

- Every prerequisite is Mathlib or Tau Ceti at the pins, an earlier layer, or a named supplier layer. All cross-roadmap anchors resolve: AnalyticNumberTheoryPartI §§0.5, 0.9, 0.33, 2.15, 2.18; AutomorphicLFunctionsAndLocalFactors `rs-*` and `local-conductor-test-vector-comparison`; GrossZagierAndArithmeticHeights §§0.1, 8.4, 8.15, 8.19. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id appears.
- EffectiveClassNumbers is outside the Caraiani–Newton order, so there is no upward-citation defect. It goes upstream only after its atlas suppliers. AnalyticNumberTheoryPartI, AutomorphicLFunctionsAndLocalFactors, EllipticCurveModularity and EffectiveDiophantineMethods are at the TauCetiRoadmap pull-request stage. RankZeroOneBSD and GrossZagierAndArithmeticHeights are not yet upstream.
- Duplication sweep against the current Tau Ceti (a91d3aaf) and TauCetiRoadmap main, searching for Oesterlé, Goldfeld, class number three, the conductors, Montgomery–Weinberger, Lehmer, Liouville, reduced forms and effective class-number lower bounds. Tau Ceti's `EffectiveBounds/ClassNumber` has only upper bounds. `BinaryQuadraticForm` has the reduced-form theory the package already cites, and no comparison of the class number of a field with `reducedForms`. Nothing further to remove.
- Open proof obligations, stated honestly as targets rather than gaps in the plan:
  - the E₁₃₉ descent (not printed in the sources);
  - the intermediate values behind the constants 7000 and 55 (reported by O85/O88 without them);
  - MW74 Lemmas 5–9 and the window computations, whose constants this review did not recheck beyond the ranges.

## Unit tests

Every definition has at least three discriminating Checks: `ramifiedWeight`, `goldfeldCompletion`, `inverseMellinKernel`, the three curves, `bgzKernel` (now five), `primeMajorant`, `effectiveKappa`, `classThreeDiscriminants`, the Liouville twist and symmetric square, the η-quotient, the Hardy function, the nonaxial count and the new x-inert predicate. The key ones are `example`s in Suggested.lean.

## Lean

- `lean-check …/EffectiveClassNumbers/Suggested.lean` before the fixes: exit 0, 43 `declaration uses sorry` warnings, no other output.
- After the fixes: exit 0, 47 `sorry` warnings (the four new theorems), no other output. The file has 653 lines.
- `scripts/check_sorry_data.py`: exit 0. No sorry'd data, no `True` placeholders, no theory developed.
- Fourteen signatures were spot-checked against the README: `isFundamentalDiscriminant_discr`, `two_pow_sub_one_dvd_classNumber`, `splitPrime_size`, `liouville_agreement`, `positiveMellin_comparison`, `fundamentalContour`, `truncatedResidue`, `oesterleTechnical` (C1–C4 hypothesis by hypothesis), `centralDerivative_series` (Fricke relation at w = −1; a 0 forced to 0 by the coefficient bound), `curve5077_height_gap`, `global_7000`, `effectiveLogarithmic_bound`, `effective_cutoff` and `mwZero_brackets` (the Legendre and χ₈ hypotheses determine χ₋ₖ). They agree.

## Own words and form

All added text is new prose with locators; no source passage is quoted. `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems. No local paths.
