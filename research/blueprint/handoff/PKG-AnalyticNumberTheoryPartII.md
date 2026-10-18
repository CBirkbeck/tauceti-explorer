# PKG-AnalyticNumberTheoryPartII — handoff

Refs #10371. Claude (Opus 5.5), session `claude-57HI2D`, 2026-10-18. The claim bot confirmed this session's claim. Draft pull request: the package is complete, but it is filed under a proposed new identity because the deliverable path is occupied by a different roadmap (below). The maintainer decides the identity.

## The identity collision, and where the package is

`AnalyticNumberTheoryPartII` currently names two different projects:

| Record | Project |
| --- | --- |
| `packets/AnalyticNumberTheoryPartII.json`, `roadmaps/AnalyticNumberTheoryPartII.json`, `readmes/…`, `suggested/…`; DESIGN/REV-DESIGN jobs (#4970, #5051, #8919, #8933) | the effective class-number plan (stages ECN.0–ECN.5, 39 nodes), accepted by REV-DESIGN-AnalyticNumberTheoryPartII~2 on 2026-10-18 |
| `packages/AnalyticNumberTheoryPartII/` (README, Suggested.lean, metadata, review.json); REV-PKG~adv (#10272) and FIX-PKG~adv (#10301, draft PR #10302) | Layers 4–6 of the maintainer-requested split of AnalyticNumberTheory (Lerch/Hurwitz/Barnes, double and cubic zeta functions, Bost–Connes); cited by the ArithmeticStatistics part packages |

This job (#10371, created after the ECN plan was accepted) packages the **accepted ECN plan**. Writing it to the issue's deliverable paths would overwrite the split package, so the package is in **`research/blueprint/packages/EffectiveClassNumbers/`** (README.md, Suggested.lean, metadata.toml), and the Lean namespace is `TauCetiRoadmap.EffectiveClassNumbers` (the plan's own suggested file already used `TauCeti.EffectiveClassNumber`; Codex's FIX checkpoint #10302 proposed `EffectiveClassNumbers` for the ECN project). Nothing under `packages/AnalyticNumberTheoryPartII/` was touched.

To finish the migration (maintainer actions; none of these files were edited here): give the ECN roadmap, packet, reader and suggested file the chosen identity (or keep `AnalyticNumberTheoryPartII` for ECN and move the split package instead); point the queue's PKG/REV-PKG jobs for ECN at the package directory; keep REV-PKG-AnalyticNumberTheoryPartII (#10373) for whichever project keeps the name. If a name other than `EffectiveClassNumbers` is chosen, rename the directory and the Lean namespace (one `namespace`/`end` pair); nothing else in the files depends on the name.

**The same collision affects #10372/#10374 (`ArithmeticStatisticsPartII`)**: `packets/ArithmeticStatisticsPartII.json` is the random Γ-groups / nonabelian Cohen–Lenstra–Martinet design (#10304), while `packages/ArithmeticStatisticsPartII/` is Part II of the ArithmeticStatistics split (#10251).

## What the package contains

- README.md: 148 KB, 1,020 lines, in the exemplar's shape: title and **Summary.**, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eleven supplier roadmaps), How to read the build, Layers 0–5 with 52 `### k.n` subsections, 51 **Checks.** lists, Examples and Dependencies per layer, Downstream consumers, References. Every subsection carries source locators (theorem/section/page) and *Needs:* lines; no process language, packet ids or stage ids of this roadmap.
- Suggested.lean: 621 lines; `import Mathlib` plus six Tau Ceti modules; one module docstring; namespace `TauCetiRoadmap.EffectiveClassNumbers`; 10 real-bodied light definitions (`ramifiedWeight`, `goldfeldCompletion`, `inverseMellinKernel`, `curve139`, `curve37`, `curve5077`, `bgzKernel`, `primeMajorant`, `effectiveKappa`, `classThreeDiscriminants`) and two `IsElliptic` instances proved from the discriminants, the layer milestones and end theorems statable at the pins, and 21 `example`s, all proved (curve points, discriminants, c₄/c₆ twist relation, κ(1/2) = 2⁻³⁰², κ(1/4) = 2⁻⁸¹⁴, C₅₅(2), θ(907) = 1, F(1) = 30, I₀,₂(1/2) = log 2, the non-fundamental −5077 and −243). Seven theorems are proved outright: `goldfeldCompletion_one`, the three discriminant identities, `curve139_c₄_c₆`, `heegnerHeight_gap`, and `exceptional_5077` (from `isFundamentalDiscriminant_discr`). No sorry'd data, no `True` placeholders.
- `lean-check research/blueprint/packages/EffectiveClassNumbers/Suggested.lean`: exit 0, exactly 43 `declaration uses sorry` warnings, no other diagnostics (Mathlib 082e2d3, Tau Ceti f790474; 85 GB available; no language server, no build).
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: exit 0. `python3 research/blueprint/intake.py check-files` on the three files: 0 problems. All internal and relative links resolve (52 anchors).

## Plan targets → README

All 39 nodes of the accepted packet are present:

| Plan node (ECN.k/…) | README | Lean |
| --- | --- | --- |
| 0/ramified-weight, split-prime-size, liouville-agreement | §0.3, §0.4, §0.5 | `ramifiedWeight`, `splitPrime_size`, `liouville_agreement` |
| 1/degree-four-completion, inverse-mellin-kernel | §1.1, §1.3 | defs |
| 1/positive-mellin-comparison, fundamental-contour, truncated-residue | §1.4, §1.5, §1.6 | theorems |
| 1/tail-three-pieces, oesterle-technical-bound | §1.7, §1.8 | `oesterleTechnical` (the plan's Lean form of the tail statement was a tautology and is README-only) |
| 2/curve-139, curve-5077, curve-local-data, arithmetic-rank-certificates | §2.1, §2.2, §2.3, §2.4 | defs, `curve_local_data`, `arithmeticRank_certificates` |
| 2/bgz-kernel, central-derivative-enclosures | §2.5, §§2.6–2.7 | `bgzKernel`, `centralDerivative_series` |
| 2/heegner-height-gap, heegner-trace-139, rank-three-139, rank-three-5077 | §2.8, §2.11, §2.12, §2.13 | theorems |
| 3/liouville-system, ramified-twist-systems, global-7000, coprime-55, exceptional-5077 | §3.2, §3.3, §3.6, §3.7, §3.5 | `global_7000`, `coprime_55`, `primeDiscriminant_55_strict`, `exceptional_5077` |
| 4/prime-majorant, prime-product-bound, explicit-t-bound, asymptotic-constant | §4.1, §4.2, §4.3, §4.5 | defs and theorems |
| 4/effective-kappa, effective-logarithmic-bound, effective-cutoff, siegel-comparison | §4.6, §4.7, §4.8, §4.9 | (§4.9 README-only: Siegel is AnalyticNumberTheoryPartI's theorem) |
| 5/class-three-prime, mw-zero-brackets, mw-phase-exclusion, small-range-sieve, class-three-cutoff, class-three-enumeration | §5.1, §5.3, §5.4, §5.6, §5.7, §5.8 | theorems |

The two recorded certificate gaps are now explicit targets: the E₁₃₉ descent and independence certificate (§2.4) and the rational certificate datasets for 7000 and 55 (§3.4).

## Supplier requests: resolved by citation, or planned here

Each of the plan's twelve supplier requests was checked against the current supplier packages (three Sonnet sweeps; every cited section was then read here).

- Satisfied by suppliers and cited: AN.4's Siegel bound and class-number value (AnalyticNumberTheoryPartI §0.9, §2.15, §2.18) and χ_D (TauCetiRoadmap GlobalNumberFields Layer 10); BSD.0 nodes (RankZeroOneBSD §§0.2, 0.5, 0.6, 0.7, 0.10); R29.4/R29.5/R29.6 (EllipticCurveModularity, named subsections); GZ.8 (GrossZagierAndArithmeticHeights §§0.1, 8.4, 8.15, 8.19, which also supply the Heegner points over H and the Galois action); ED.3 (EffectiveDiophantineMethods §§3.2–3.22, including the complete height search §3.15); CN.1 primality/factorization (ComputationalNumberTheory §§1.1–1.21), CN.2 class-unit completeness (§2.15), CN.4 interval soundness and Dirichlet L boxes (§§4.2, 4.4, 4.20); EllipticCurves Layers 4–6; IntegralLattices B1/B2/B5; AL.3 Rankin–Selberg (`rs-global-poles`, `rs-boundary-nonvanishing`, `rs-vertical-strip-bounds`, `rs-global-functional-equation`).
- Not owned by any supplier, so planned here as consumer-specific targets: the radicand/discriminant/genus bridge for every imaginary quadratic field including ℚ(i) (§0.1); the class number as a count of reduced forms for fundamental discriminants (§0.2); Oesterlé's reduced-form decomposition with nonnegative coefficients (§0.6); the integrated nonaxial lattice estimate (§0.7); kernel enclosures for G_r (§2.5); coefficients by point counts and certified central-derivative evaluation at arbitrary level (§2.7, replacing the level-one-only `cuspLBox`); the modular unit (η(z)/η(37z))² on X₀(37) and its CM values (§§2.9–2.10); the symmetric-square factorization and the C4 properties of the Liouville product from Rankin–Selberg (§3.1); n-th prime and Σp_j^(−1/2) asymptotics (§4.4); Hardy functions of odd real characters with Stirling enclosures (§5.2); complete pattern-sieve certificates (§5.5).
- ComputationalNumberTheory is outside the Caraiani–Newton order (dropped 2026-10-16; `upstream/drops.json`), but it has an accepted package and this roadmap is outside the order too; only CN.1, CN.2 §2.15 and CN.4 §§4.2, 4.4, 4.20 are cited. If the maintainer prefers not to depend on it, those four items would move into §2.7 and §5.5.

## Removed as duplicates of current Tau Ceti

- Gauss reduction of binary forms: the current library (a91d3aaf, after the pin) has `TauCeti.BinaryQuadraticForm`, `TauCeti.IsReducedForm`, `TauCeti.reducedForms` with the same boundary convention, `exists_smul_isReducedForm`, `orbit_mk_injOn_isReducedForm` and `orbit_mk_reducedForms_bijective`. The package cites them; its own reduced-form definition and the uniqueness target were removed, and §0.2 keeps only primitivity for fundamental discriminants and the comparison with `ClassGroup (𝓞 K)`. Because the carrier postdates the pin, `classNumber_eq_card_reducedForms` is README-only.
- No other overlap: searches of the current library and TauCetiRoadmap for Liouville, Stirling, exponential integrals, η-quotients, Heegner points, symmetric squares, n-th prime asymptotics and Oesterlé/Goldfeld/Gross–Zagier bounds found nothing.

## Corrections relative to the plan (checked against the sources)

- O85 (2.3.1), p. 313, *defines* L(Sym² f, s) with the factor of ζ(s − 1) only at p ∤ N, so at p² | N Oesterlé's factor is 1. The package states the symmetric square with the Rankin–Selberg factor at such p (for E₁₃₉ at 139, the factor of the conductor-37 form) and records the comparison with Oesterlé's normalization; the plan's formula is correct for squarefree N.
- O85 §4.3, p. 320, starts from E₀ : y² + y = x³ + x² − 23x − 50 (discriminant 37³). Computation confirms that the O88 model (0, −1, 1, −450823, 112971139) is exactly the −139 twist of E₀, while E₁₃₉ = (0, −1, 1, −64403, −6220110) is the −139 twist of y² + y = x³ + x² − 3x + 1 (discriminant 37); E₀ and that curve have the same a_p (checked at 2, 3, 5, 7, 11, 139).
- Canonical heights: current Tau Ceti's `canonicalHeight` divides by 4ⁿ (2(O)), the pinned one by 2·4ⁿ. The plan's upstream note about the EllipticCurves prose is resolved upstream. The README states every height constant for 2(O) (E₅₀₇₇ gap 1/2) and the Lean file, at the pin, uses 1/4.
- MW74's method was restated from its Lemmas 1–5 (pp. 531–535): the identity for (k√p/2π)^(s−1/2)Γ(s)L(s,χ)L(s,χχ_{−p}) over reduced forms, the amplitude/phase/error of (3)–(5), and the near-linear phase of Lemma 5.

## New data found while packaging (numerical, to be certified by the §2.4 target)

E₁₃₉ has the integral points (−156, 77), (350, 3740), (510, 9660), (1344, 48302); (350, 3740) = −2·(510, 9660) exactly. A floating computation of ĥ (doubling seven times) gives the Gram matrix of Q₁ = (−156, 77), Q₂ = (510, 9660), Q₃ = (1344, 48302) with determinant about 15.37 (2(O) normalization); #E₁₃₉(𝔽₃) = 5 and #E₁₃₉(𝔽₇) = 9 show the torsion is trivial. The complete 2-descent bound remains to be certified.

## Renamed API (plan name → package name)

`ramifiedWeight_support` → `ramifiedWeight_congr_primeFactors`; `ramifiedWeight_prime` → `ramifiedWeight_prime_pow`; `ramifiedWeight_odd_class_number` → `ramifiedWeight_eq_one_of_odd_classNumber`; `goldfeldCompletion_order` → `goldfeldCompletion_analyticOrder`; `inverseMellinKernel_of_pos_le_one`, `…_antitone`, `…_convex`, `…_transform` → `…_of_pos_of_le_one`, `…_antitoneOn`, `…_convexOn`, `…_mellin`; `curve139_coefficients`, `curve5077_coefficients`, `curve139_coordinate_inverse`, `curve5077_generator_coordinates` → the definitions themselves, `curve139_source_equation` (with its inverse) and `curve5077_points`; `bgzKernel_nonpositive`, `…_derivative`, `…_exp_bound`, `…_mellin` → `…_of_nonpos`, `…_hasDerivAt`, `…_le`, `…_mellinInv`; `effectiveKappa_nonpositive`, `…_ge_one`, `…_small` → `…_of_nonpos`, `…_of_one_le`, `…_of_pos_of_lt_one`; `effectiveKappa_computable` (now the prose: exact rational operations only) and `effectiveKappa_lower_bound` (= `effectiveLogarithmic_bound` at ε = q); `primeProduct_bound` → `primeMajorant_log_le`; `asymptotic_constant` → `primeMajorant_log_asymptotic`; `siegel_comparison` → `effective_vs_siegel`; `curveLocalData` → `curve_local_data`.

## Adversarial pass (statements written or changed here)

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| θ(d) | d = 0, 907, 15, 84; factors at 2, 3, 5, 7, 11 | values 1, 1, 1/4, 1/12; factors 1/3, 1/4, 1/3, 3/8, 1/2 (non-monotone; recorded as a Check) |
| split-prime bound d ≤ 4p^h | d = 23 (p = 2), 907 (p ≤ 5 inert), 7 (p = 2), 20 (p = 3) | holds; the factor 4 is needed (d = 7) |
| reduced forms / h | d = 23, 20, 907, 139, 4, 12; full enumeration d < 10⁴ | exactly the sixteen class-three discriminants; (13, −9, 19) kept, (2, −2, 3) excluded; d = 12 imprimitive |
| ζ_K/ζ(2s) coefficients | d = 23: ν₁ = 1, ν₂ = 2 | Σ_{n ≤ √d/2} ν_n = 3 = h (bound attained) |
| nonaxial estimate | q = (1,1,6); counting all (m,n) ≠ 0 | n ≥ 1 is essential (a full count doubles the left side) |
| F = goldfeldCompletion | d = 2, M = 3, constants; d = 0 | F(1) = 30, F(2) = 180; F(1) = MΨ(1)G(1) needs no d > 0 (hypothesis dropped) |
| Mellin comparison | δ₁ vs (δ_{1/2} + δ_{3/2})/2; signed μ = −δ_{1/2} | integrated but not pointwise domination (fails on [1, 3/2)); positivity needed for nonnegativity |
| contour identity | F = (s−1)³e^{(s−1)²} (minus sign), F = e^{(s−1)²} (order 0) | integrals 1/(2√π) and 1/2, not 0: both hypotheses necessary |
| curves | discriminants, c₄/c₆, j, points, a_p | Δ(E₁₃₉) = 37·139⁶, c₄ ratio 139², c₆ ratio −139³, j = 4096000/37; E₅₀₇₇ node at x = 92 with 1104 a non-residue mod 5077 (nonsplit); #E₅₀₇₇(𝔽₃, 𝔽₅) = 7, 10; a₁₃₉(E₃₇) = −4 |
| Fricke relation | Λ(2 − s) = wΛ(s) | pinned as f(i/(√N y)) = w·y²·f(iy/√N), which gives BGZ (10) at w = −1; the Lean hypothesis is this relation at w = −1 |
| kernel series | BGZ Table 2, n = 1, 2 | 1/n factor checked against partial sums 3.8748 → 1.2211; (r − 1)! normalization pinned by G₁′ = −G₀/x |
| twist χ_{−7} for E₅₀₇₇ | 5077 mod 7 = 2; root number | (5077/7) = 1, conductor 248773, root number +1 |
| CM values on X₀(37) | Δ homogeneity; roots of unity in H | u(x)¹² = μ̄¹² for 𝔫 = (μ); ±1 only because [H:K] = 3 is odd |
| sign conditions in §§3.6–3.7 | K = ℚ(√−23), ℚ(√−7) with N = 5077; χ(37) for f₁₃₉ | χ(−5077) = 1 and −1 respectively; for f₁₃₉, χ(−37·139²) = −χ(37), so split 37 → elementary bound, inert or ramified 37 → analytic systems (O85 §4.3) |
| κ(q), cutoffs | q = 0, 1, 1/2, 1/4; e¹⁶⁵ vs 10⁷² | 0, 1/2, 2⁻³⁰², 2⁻⁸¹⁴ (proved in Lean); 165 < 72 log 10 ≈ 165.78 |
| MW characters | −17923, −115147, −123204 | fundamental; values at 2: −1, −1, 0; χ_{−17923}(3) = −1; 10267 and 17923 prime |
| sieve chain | 4·43³, 4·67³, 4·163³ | 318028, 1203052, 17322988, below the next thresholds |
| L(1/2, χ_{−3}) | partial sums to 3·10⁶ | ≈ 0.4809 (the §5.2 Check value) |

## Locators read

O85 pp. 310–315 and 319–321 (page images); GZ86 pp. 230–232 (page images); BGZ85 pp. 475–480 (text layer); MW74 pp. 530–535 (page images). All seven downloaded PDFs have the SHA-256 values recorded in the accepted packet. GZ83 p. 87, LLS70 pp. 433–447 and O88 pp. 66–67 were taken from the accepted plan's verified locators and were not re-read in this run.

## For the reviewer

Check especially: the new consumer-specific targets listed above (they go beyond the plan's nodes, as the plan's supplier requests required); the symmetric-square normalization in §3.1; the root-number bookkeeping of §3.6; the ED height normalization (ED §§3.12–3.15 use (O)); and whether ComputationalNumberTheory may be cited (see above). No scratch file is needed to resume.
