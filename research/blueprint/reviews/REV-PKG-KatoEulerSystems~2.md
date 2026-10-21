# Fixing package review: KatoEulerSystems, round 2

Verdict: **accepted**. With the corrections below applied, the package is ready for the draft
pull request on TauCetiRoadmap. Its scheduling relative to its suppliers (it lies outside the
94-roadmap order) is a maintainer decision and is noted at the end.

Reviewer: Claude (Opus 5.5), session `claude-Cs69KU`, 2026-10-21, issue #9222. The package
authors were sessions `codex-4ArQBz` (round 1) and `claude-mQcYVT` (round 2); the first review
was by `codex-1pMy97`. This reviewer did none of those jobs. Only the package files, this report
and the review's handoff note change.

## The first review's fourteen rows

The round-2 package rebuilds on `PadicFamilies` §4.0. I read that section at the head of
TauCetiRoadmap PR #1019 (`f9ad8cc`, updated 2026-10-20). §4.0.1 has the theta unit, the
two-index Beilinson symbols with transfers and Chern images, and `modularZeta` with its norm,
trace, moment, Hecke and smoothing relations. §4.0.2 has the modular dual exponential and the
three-branch explicit reciprocity law, proved through the square (10.9.5) over the completed
modular function field. §4.0.3 has the rational cyclotomic bound with the CM case, the
integral bound under the `SL₂(ℤ_p)` image, and the ordinary Selmer bound. That head cites
nothing from KatoEulerSystems, so building on it creates no cycle.

Every row of the first review is now either supplied by an existing section or planned as a
target here. Row by row: (1) big-field reciprocity is PF §4.0.2; (2) the CM case is PF §4.0.3;
(3) the nonsplit image is resolved by admissibility, target 4.1; (4) the open-curve comparison
is ModularCurvesPartII §§14.1–14.12 with target 3.1; (5) the full-level moment is
CompletedCohomologyAndLocalGlobalCompatibility §2.6; (6) the global complex is
SelmerIwasawaCohomology §3.15 with targets 4.2a and 4.4; (7) parabolic injectivity is target
5.5; (8) the twist square is target 4.6; (9) the period dictionary is target 6.3; (10)–(11) the
de Rham and dyadic regulator is target 6.1 with PadicHodgeRegulators §§9.31–9.35; (12) elliptic
control is targets 7.5 and 7.7; (13) finite support is target 4.5; (14) the critical family is
the conditional target 6.5.

A Sonnet cross-check extracted all 155 (roadmap, section) citations and compared each with the
cited section of the live upstream heads. These were SelmerIwasawaCohomology #869,
ArithmeticGaloisDuality #858, EulerSystemsAndKolyvaginSystems #1272, ModularCurvesPartII #913,
SchemeKTheoryOperations #1229, K2SymbolsBrauer #1302, AutomorphicGaloisRepresentations #1007,
ModularSymbolsPadicLFunctions #968 and CompletedCohomologyAndLocalGlobalCompatibility #1270.
It also used TauCetiRoadmap main `0e8b058` for ModularForms, ModularCurves, EllipticCurves and
PadicMeasuresIwasawaAlgebras, and the atlas packages PadicHodgeRegulators (accepted 2026-10-20)
and MotivicEtaleKTheory. No section was missing. I read each of its five partial matches
myself and fixed them (items 9–13 below). There is no `FoundationsAndLibraryIntegration`,
`UPSTREAM:` or other roadmap citation outside the supplier list.

## Corrections applied

1. **Range of the zeta elements (Layer 1).** Kato §2 assumes `M, N ≥ 2` throughout (2.1,
   p. 125), and Proposition 2.3 is stated for `M′, N′ ≥ 2`. At `M = 1` the index `(1/M, 0)` is
   `(0,0)`, where no Siegel unit exists. The layer said `M, N ≥ 1`. It now says `M, N ≥ 2`
   and gives the reason; 1.1 carries the bound.
2. **Explicit transfer in 1.2.** "Admit the upper and lower levels of Kato 2.4" is replaced by
   the actual level map `Y(Mℓ, Nℓ) → Y(M, N)` of Kato 2.4 (p. 126, page image checked). This also
   makes 1.1's `(2,3) → (6,9)` control consistent with 1.2.
3. **Fourier normalization of `F^(k)` (3.2).** Kato 3.6 (p. 138, page image) defines
   `F^(k)_(a/N,b/N)` as `N^(−k)` times the twisted sum of the `E^(k)`. The inverse formula
   carries `N^(k−2)`. The README had put `N^(k−2)` in the forward formula; the two powers agree
   only at `k = 1`. The README now states both directions, with a new Check: forward then
   inverse must give the identity, and the wrong power is off by `N^(2k−2)`.
4. **Smoothed-F locator (3.2).** The formula `c-F^(h) = c²F^(h) − c^(2−h)F^(h)_(cα,cβ)` is
   defined after Kato 4.2 (p. 143), not in 3.2–3.3, and the weight-two E-smoothing uses
   `Ẽ^(2)` (3.5, p. 137). The locator and wording are corrected.
5. **False Check in 6.1.** Kato 16.4(ii) has the factor `1 − p^(r−1)φ^(−1)` (confirmed at
   400 dpi). The Check claimed that `1 − p^(−1)φ^(−1)` agrees with it "only at `r = 1`". In
   fact they agree only at `r = 0`, outside the range. The Check now gives the correct
   comparison.
6. **Overstated Check in 6.6.** "The canonical class is nonzero exactly when the L-value is"
   is false for the global class, which can be nonzero when `L(E,1) = 0`. The statement holds
   for its singular localization, through Rubin III.5.3 and the nonvanishing of the removed
   Euler factors. Corrected.
7. **4.2a against `X_∞`.** The text took `Σ ⊇` ramified primes and then `Σ = {p, ∞}` without
   saying how. It now uses Kato's `j_*` convention (SelmerIwasawaCohomology §3.15). The strict
   kernel `H²(T)₀` is compared with Rubin's `X_∞` of EulerSystemsAndKolyvaginSystems §8.3 up
   to finite modules: at `ℓ ≠ p` unramified and finite conditions differ by a quotient of
   `W^(I_ℓ)/(W^(I_ℓ))_div`, and only finitely many places of `ℚ_∞` lie over ℓ. These finite
   modules do not change the height-one lengths that 4.3 uses, and 4.3 now says "up to finite
   modules".
8. **Contained-cyclotomic CM case (4.4).** Kato 15.14 covers every CM field
   `K ⊂ ℚ(ζ_(p^∞))`, which includes `ℚ(√−p)` for `p ≡ 3 mod 4`, not only `ℚ(i)` at `p = 2`.
9. **Fricke pairing.** AutomorphicGaloisRepresentations §1.2 is the parabolic realization
   with its duality pairing. The restricted Fricke pairing and the dual-form twist of the
   newform factor are §1.5. The contract, 2.2, 5.4 and the Layer 5 dependencies now cite §1.5.
10. **Euler-polynomial conventions (2.1).** The convention transport is
    EulerSystemsAndKolyvaginSystems §2.1, which compares Kato's, Rubin's and Mazur–Rubin's
    polynomials. §2.6 changes congruent Euler factors, which Kato's system does not need.
    Kato's Proposition 8.12 (p. 186) is added. The contract drops the unused §2.6, §8.14 and
    §8.25 and adds the used §§8.3 and 8.7.
11. **Δ-components in 4.3.** §8.14 twists only by characters of `Γ = Gal(K_∞/K)`. The
    reduction to the components for characters η of the finite group Δ uses §2.5, twisting by
    finite-order characters, together with Shapiro's lemma (SelmerIwasawaCohomology §3.2). It
    holds integrally for odd p and, at `p = 2`, after localizing away from 2.
12. **Control in 7.7.** SelmerIwasawaCohomology §§3.9–3.11 are general control machinery. The
    local error at p, the p-part of `|Ẽ(𝔽_p)|²`, is computed in this target, and the text now
    says so. The bad-prime errors vanish under the torsion hypothesis: `c_q` divides
    `|E(ℚ_q)/E₁(ℚ_q)|` and `E₁(ℚ_q)` is pro-q.
13. **Elliptic local condition.** The contract now describes SelmerIwasawaCohomology §2.12
    correctly, as the elliptic `p^∞`-Selmer group with Kummer-image conditions.
14. **Parity in 7.4 and 7.6.** The Coleman map of PadicHodgeRegulators §§8.22 and 9.36 is
    constructed for odd p only. The elliptic case of Greenberg's criterion in
    SelmerIwasawaCohomology §3.20 is also odd-p. Rubin III.5.16–5.17 state no parity, but the
    suppliers do, so 7.4 and 7.6 now assume p odd. Nothing downstream in the roadmap uses
    `p = 2` there; 7.7 and 7.8 already assumed p odd. 7.4's pointer to a "dyadic integral
    hypothesis of §8.37", which does not exist, is replaced by the true reason. 7.6 notes that
    its hypothesis gives `E(ℚ)[p] = 0`, since `N > 1`.
15. **Twisted L-functions.** The values `L_S(f,χ,s)` need the twist `f ⊗ χ` with its
    modularity and primitive associate. That is ModularForms Layer 9 (inner-twist sublayer),
    now cited beside Layer 7.
16. **Downstream consumers.** PadicFamilies and EulerSystemsAndKolyvaginSystems were listed as
    consumers, but both are suppliers. EulerSystemsAndKolyvaginSystems says explicitly that it
    imports nothing from its applications. The section now says this.
17. **Lean generality.** `katoEulerPolynomial` and `ordinaryEulerFactor` were defined over ℚ,
    while their README coefficients lie in Hecke fields. Both now take a field `K` and a
    natural-number prime; the examples are instantiated at ℚ. The README statement of
    `finite_of_regular_annihilator` is now as general as its Lean signature, with Λ as Kato's
    case. The closing list names the two API lemmas of `rationalSiegelUnit`.

Minor: the Kato Lemma 2.12 locator is now p. 131.

## Sources checked on the page

Kato 2004 is the Numdam PDF, SHA-256 `3c6e14b1…cec605d`. The printed page is the PDF page plus
115. Page images were read wherever the text layer was garbled.

| Source and locator | README use | Result |
| --- | --- | --- |
| Kato 1.3(2), 1.4, 1.7, 1.9, 1.10, pp. 121–125 | 0.1–0.3 | Agree; the missing square in 1.9 is confirmed |
| Kato 2.1–2.4, pp. 125–126 | Layer 1 | Correction 1; K₂ quadratic coefficient ℓ confirmed |
| Kato 2.5–2.7, 2.9–2.10, pp. 127–130 | 3.4 | Operator zeta, Euler factors, `Z(0) = 0`, `2πi(δ)^−` and `η_(f,g)` agree |
| Kato 2.11–2.13, Lemma 2.12, pp. 131–133 | 0.4, 1.1–1.2 | Agree (A roots of β, α fixed) |
| Kato 3.2–3.11, pp. 135–142 | 3.2 | Corrections 3–4; `E^(4)_(0,0) = E₄/120` and `dlog g = −F^(2)` confirmed |
| Kato 4.1–4.4, pp. 142–143 | 3.3 | Zeta forms, exclusions (4.2.3) and exponents (4.2.4) agree |
| Kato 6.3–6.6, pp. 161–163 | 3.3, 3.4 | Theorem 6.6 and the `χ̄(c)`, `χ̄(d)` smoothing factors agree |
| Kato 8.7–8.12, pp. 184–186 | 2.1 | Agree; Proposition 8.12 added |
| Kato 9.2–9.7, pp. 187–189 | 3.1 | Filtration (9.2.2) agrees |
| Kato 12.3–12.10, pp. 221–224 | 4.1, 4.4, 5.1–5.3, 7.2 | Agree; 12.8.2 says "for any λ", as the README reports |
| Kato 13.1–13.7, pp. 224–227 | 2.1, 4.2–4.3 | Hypotheses (i)–(v) and conclusions (1)–(3) of 13.4 agree |
| Kato 13.12–13.14, pp. 231–234 | 4.5, 5.2, 7.2 | Regular μ with `Λ/μΛ` p-torsion-free agrees |
| Kato 15.2, p. 251; 15.12–15.17, pp. 263–265 | 4.4, 7.2 | Agree; the CM rational bound needs only Rubin's condition (a), 𝔭 ∌ p |
| Kato 16.2–16.6, pp. 269–271 | 6.1–6.4 | Agree; 16.4(ii) factor confirmed, correction 5 |
| Rubin draft II §3, pp. 27–28; II.3.7–3.8, p. 29; App. B 3.1, pp. 153–154 | 4.3, 4.6 | Agree |
| Rubin draft III.5.1–5.18, pp. 48–54 | 4.7, 6.6, 7.3–7.8 | Agree, except the parity point of correction 14 |
| Nakamura arXiv:2006.13647v2, Lemma 3.1, Lemma 3.4, Remark 3.5, Corollary 3.6, Theorem 5.2, Theorem A.1, Remark A.2 | 2.2, 5.4–5.6, 7.2 | Statements agree; the unsquared `d` of the conductor-n operator is present in v2 as well |
| Nakamura arXiv:1201.6475v2, Theorem 1.5 | 6.1 | Any p-adic field, `p = 2` allowed (its `Δ_K` has order two) |
| Loeffler arXiv:1411.1789v2, §1 (A)–(C), Theorem 2.2.2, pp. 1, 5–6 | 4.1, 4.7 | Agree |
| Burungale–Tian arXiv:2506.03465v2, Theorems 2.3–2.4, Remark 2.5, pp. 4–5 | 4.4, 7.1 | Agree |
| Weibel, *K-book* III, Corollary 1.7.1, p. 8, and Exercise 5.6, p. 46 | 1.1 | Agree; slot order reconciled by skew-symmetry |

Not re-checked: the published Inventiones page numbers of Nakamura 2023 (the publisher PDF
returned an HTML page; the arXiv v2 statement numbers agree), Serre 1972, Jacquet–Shalika,
Rohrlich, Colmez, Perrin-Riou, Schneider, Greenberg 1999 and Ghate–González-Jiménez–Quer.

## Adversarial pass

| Target | Instances and conventions tried | Outcome |
| --- | --- | --- |
| Conventions | `c = 5`: coefficient 0 vs 24 at a 2-torsion point; upper shear on `(1/5,0)`; twists `k − r` at `(2,1)`, `(4,1)`; signs at `(2,1)`, `(4,2)` | Agree |
| 0.1 | `c ≡ 1` mod the order gives `(c²−1)g`; 24 and 48; `48·24g = 24·48g` | Agree |
| 0.2 | Row action `(α,β)σ`; lower shear fixes `(1/5,0)`; `A = 1`; `A = 0` excluded | Agree |
| 0.3 | `B₂/2` at 0, 1/2, 2/5 gives 1/12, −1/24, −11/300; missing square gives −23/300 | Agree |
| 0.4 | Product over A roots: `∏(1 − xζ_A^j) = 1 − x^A` gives exponent `A(n+α)` and leading power `A·B₂(α)/2` | Agree |
| 1.1 | `M = 1` (undefined unit); `(2,3) → (6,9)`; `N(2+i) = 5` vs trace 4 | Correction 1 |
| 1.2 | `ℓ | N` branch; K₂ coefficient ℓ vs cohomological `ℓ^(k−1−2r)` | Correction 2 |
| 2.1 | `det(1 − Fr_ℓ t | V(k−r))` recomputed from the Fr⁻¹ eigenvalues; `ℓ = 3`, `a = 2` gives `1 − (2/3)X + (1/3)X²` | Agree |
| 2.2 | Antidiagonal `(−2,1,−2)` determinant −4; `S′` prefactor `ℓ^(2(k−2))` (Nakamura Lemma 3.1) | Agree |
| 2.3 | Identity operators at `ℓ = 3` give 3 (1 without ℓ); `σ = 0` gives 1 | Agree |
| 3.1 | `k = 4`: `F¹ = F²`, `F⁴ = 0`; `k = 2, i = 1` | Agree; `modularFiltration` is antitone for every k |
| 3.2 | `F = N^(−k)FT(E)` with `FT∘FT = N²`; `E^(4)_(0,0)` constant term `ζ(−3)`; `dlog g` constant term `−ζ(a/N,−1) = B₂/2` | Corrections 3–4 |
| 3.3 | `(u,v)` at `k = 2, r = 1` is `(1,1)`, giving 20 and 42 at `c = 5`, `d = 7` | Agree |
| 3.4 | `η_(2,z) = log 2 · i dθ`, integral `2πi log 2`; `Z(0) = 0` | Agree |
| 4.1 | Division algebra: `d ≠ 1` makes `d − 1` invertible, so no fixed vector; an open subgroup of `SL₂(ℤ_p)` meets `ρ(H)` in an open subgroup containing `[[1,p^m],[0,1]]` | The 12.8.2 scope claim is correct |
| 4.2 | `k = 4, r = 3` absolutely convergent; `k = 3, r = 2` on the edge line | Agree |
| 4.2a | `Σ = {p,∞}` with ramification at N | Correction 7 |
| 4.3 | Pro-p orbit on 1, 2 or `q+1` lines (p odd); swap at `p = 2`; `upperUnipotent p` cokernel `ℤ/p ⊕ ℤ_p` | Correction 11 |
| 4.4 | CM torsion-freeness from Hodge–Tate weights `(0, k−1)`; `K ⊂ ℚ(ζ_(p^∞))` cases | Correction 8 |
| 4.5 | Regular μ avoids minimal primes; `μ = p` counterexample; dimension-one `ℤ/p` | Agree; Lean statements are true as written |
| 4.6 | `κ(γ) = 4` over `ℚ_3`, so `φ₁(γx) = γφ₁(x)/4` | Agree |
| 5.1–5.3 | Zero vector; minus conjugation; sign `(−1)^(k−r−1)χ(−1)` | Agree |
| 5.5 | Torsion-free source plus injectivity at height-zero primes in the reduced, CM `Λ_n` implies injectivity; the `Λ ⊕ Λ/(T)` control | Agree |
| 6.1 | Quadratic χ mod 3: `G = i√3`, `G⁻¹ = −i/√3`; (16.4.1) for `ℚ_p(1)` versus `ℚ_p` | Correction 5 |
| 6.2–6.4 | `a⁻¹b` scaling (3/2); split `α = 1` gives 0; nonsplit `α = −1` gives 2; `p = 3, α = 2` gives 1/4 | Agree |
| 6.5 | Critical slope: `log^[k−1]` vanishes at every `κ^r χ`, `1 ≤ r ≤ k−1` | Agree |
| 6.6 | `y² + xy = x³ + 1` has `Δ = −433`; `log(2u) = 2u + 2u² + 4ℤ₂`, with `u(1+u)` even; Rubin's `[E(ℚ_p):E₁+tors]p⁻¹ℤ_p` | Correction 6 |
| 7.4–7.8 | Coleman values `(1−α⁻¹)(1−β⁻¹)⁻¹`; `|Ẽ(𝔽_p)| = (1−α)(1−β)`; supersingular `|Ẽ(𝔽_3)| ∈ {4,1,7}`; `p | c_q` forces p-torsion | Corrections 12–14 |

## Suggested.lean

`lean-check`: exit 0. The only warnings are 8 `declaration uses sorry`; the file has 292 lines
and `import Mathlib` only. It holds 10 real-bodied light definitions with at most two proved
examples each, and 8 milestone statements. Each statement was checked to be true as written:
`upperUnipotent_hasOneDimFixedSpace_iff`, `diag_hasOneDimFixedSpace`,
`ker_sub_one_eq_bot_of_division`, `finite_of_pseudoNull` and `finite_of_regular_annihilator`
(proofs sketched above), `modularFiltration_antitone`, `siegelLeadingExponent_eq_bernoulli`
and `katoEulerPolynomial_eval_zero`. It has no sorry'd data, no `True` placeholders and no
process comments (`scripts/check_sorry_data.py`: clean). Every README target named
"Define/Prove `…`" is a declaration or appears in the closing list. `metadata.toml` is
`topic = "math.NT"`.

## Duplication against current Tau Ceti

TauCetiRoadmap main `0e8b058` was searched by object: Siegel units, Beilinson elements, Kato
classes, Euler systems, explicit reciprocity, dual exponential and Perrin-Riou maps. The search
covered ModularForms, ModularCurves, EllipticCurves, ClassFieldTheory, ThetaSeries,
HeightsAndUnits, ProfiniteCohomology, LocalGaloisGroups, EtaleCohomologyFoundations and the
other arithmetic roadmaps. It found only the ClassFieldTheory Hilbert-symbol reciprocity law
and EllipticCurves' Rubin-style Selmer API, neither of which this package restates. In the Tau
Ceti library (`a91d3aaf`), the field-level Kummer and Steinberg symbols
(`TauCeti.FieldTheory.GaloisCohomology.Steinberg`) are already treated in the README as
consistency checks only. No target was removed.

## Own words, process, form

No source passage and no section-by-section summary appear, and every new sentence above is a
paraphrase with a locator. A grep for process vocabulary (round, review, packet, job, PR
numbers, coverage, owner decision) finds nothing in the README. The README has the upstream
shape: Summary, scope, conventions, supplier contracts, how to read, eight layers with Checks,
Examples and Dependencies, downstream consumers and references.
`python3 research/blueprint/intake.py check-files` on the package files reports 0 problems.

## Notes for the maintainer (upstream, not defects of this package)

- `PadicFamilies` §4.0.1 (PR #1019) states the two-index Beilinson symbol for `M, N ≥ 1`.
  Kato §2 needs `M, N ≥ 2` (2.1, p. 125); at `M = 1` the unit `g_(1/M,0)` is not defined.
- `PadicFamilies` §4.0.3 asserts the rational bound for every classical eigenform and every
  coefficient place. For non-CM forms at places over a ramified place of Momose's algebra,
  Kato's proof rests on 12.8.2 (p. 223, stated for every λ), which fails there. I confirm the
  round-2 author's note, with the obstruction argument in the adversarial table (4.1).
- KatoEulerSystems is outside the 94-roadmap order. It cites the atlas packages
  PadicHodgeRegulators (accepted) and MotivicEtaleKTheory, which still needs changes and is
  cited only for the sign convention and the Deligne-regulator remark in 3.4. Both must go
  upstream before this roadmap, after the open supplier PRs listed in the round-2 handoff.
- The dyadic elliptic statements (7.4, 7.6 at `p = 2`) wait for a dyadic Coleman map and a
  dyadic Greenberg criterion; neither has an owner. RankZeroOneBSD's four "KatoEulerSystems
  extension" contracts, noted by the round-2 author, still need an owner decision.
