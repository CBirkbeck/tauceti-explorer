# Handoff: PKG-AdditiveCombinatorics~2 (package revision, round 2, complete)

Agent: Claude (Opus 5.5), session claude-s8UGLs, 2026-10-20. Refs #10755.

## What changed

The round-1 review (REV-PKG-AdditiveCombinatorics) left one supplier-order defect and seven groups of
missing intermediate contracts. All eight are addressed in `README.md`; no "Gap" paragraph remains.
`review.json` is left in place. The packet is unchanged.

### 1. Supplier closure and order

A Sonnet cross-check of every "From other roadmaps" item against the supplier packages, which I then
re-read myself, found that only four were actually stated by their owners:
AnalyticNumberTheoryPartI §0.32 (Siegel–Walfisz), §0.33 (zero-free region with log bounds) and §1.2
(`mobius_small_modulus_progressions`), FiniteFieldsAndCharacterSums FF.2 `weil-bound-multiplicative`,
and GeometryOfNumbers 1.5 `minkowski_second_upper`. ExponentialSumsAndCircleMethod states the Waring
asymptotics used only by AC.5.1. Everything else is now owned here:

| Former citation | Now |
| --- | --- |
| SV.1 smooth and sharp truncated divisor sums | owned in AC.4.11 and AC.4.14 (they were already defined in the Lean) |
| CA.2 maximal order of `d(n)` (not in upstream ClassicalArithmeticCompletion) | `card_divisors_le_exp` in AC.4.14 (Tao's divisor-bound argument; Green–Tao use it for equal shifts in Prop. 9.10) |
| ES.0 simultaneous recurrence and Weyl | `simultaneous_monomial_recurrence`, `polynomial_progression_partition`, `polynomial_weyl` in AC.2.3 (LSS Szemerédi §2; LSS five-term Prop. 3.7 and App. B; Green–Tao orbits Prop. 4.3) |
| SV.2 Type I/II dichotomy for `μ` | `mobius_type_I_II` in AC.5.2 (GT Möbius Prop. 3.1; GT quadratic uniformity Prop. 4.2) |
| AN.3 Möbius twisted by characters or periodic functions | derived in AC.5.3 from AnalyticNumberTheoryPartI §1.2 |
| ES.3 affine singular products | owned in AC.5.5 (inclusion–exclusion, `β_p = 1 + O(p^{−2})`) |
| AN.4, SV.1 (Kai), SV.2 (Kai), ES.3 (Kai) | new target AC.5.8: norm-length compatible bases, `Λ_K^𝔞`, Cramér and Siegel models, Siegel-zero dichotomy, Mitsui PNT, Cramér local count with the ideal sieve, divisor moments, ideal Vaughan decomposition (Kai §§3, 5, 6, 8; App. B) |
| ES.4 Waring bound | AC.5.1 keeps ExponentialSums Layers 4–5 (bundle supplier) and owns the uniform singular-series bound for `t ≥ 5` squares; AC.5.2 no longer needs AC.5.1 (it uses Green–Tao orbits Lemma 4.5) |
| AN.2 zero-free region, AN.3 Siegel–Walfisz | AnalyticNumberTheoryPartI §0.33 (AC.4.14) and §0.32 (AC.5.15) |

New upstream citations: TauCetiRoadmap **Regularity** (now on main; Layer 4 rectangle discrepancy, for
the counting step of AC.2.11) alongside RepresentationTheory/LieGroups.

Order (README, "Order relative to other roadmaps"): after GeometryOfNumbers (tier 3), AnalyticNumberTheory
(tier 14), ExponentialSumsAndCircleMethod and FiniteFieldsAndCharacterSums. FF.1 cites AC.0's
`fourier`/`fourier_parseval` while AC.5.9 uses FF.2, so AdditiveCombinatorics and
FiniteFieldsAndCharacterSums must go up as a bundle (or FF.1 takes over AC.0's finite transform).
**For the maintainer:** SieveMethodsAndPrimePatterns (accepted package) requests from AC.1 a
squarefree-ring sum-product theorem and a noncommutative Balog–Szemerédi–Gowers theorem (its §5,
affine sieve, lines 68 and 3245–3247 of its README); AdditiveCombinatorics does not plan them. That
request is unmet and should be routed (a Part II of this roadmap, or SieveMethods owns it).

### 2–7. Proof contracts (old gap paragraphs)

- **AC.1.22–1.23 regular Bohr sets:** explicit pigeonhole proofs of both volume bounds (`4^d` half-scale,
  `2^{−d}|G|∏ε` lower bound; Schoen–Shkredov state them unproved); the regular-scale lemma by a
  one-dimensional covering argument with `K = 24(d+1)`, regular at `r ∈ [2^{−3/4}, 2^{−1/4}]`, constants
  checked (`e^x ≤ 1 + 1.29x` on `[0, 0.485]`). No faithfulness used.
- **AC.1.28 cyclic Bohr progression:** lattice `ℤ^{d+1} + ℤ(1/N, ξ/N)` of covolume `1/N`, box
  `[−1/4,1/4]×[−ρ/2,ρ/2]^d`, Minkowski II; proper by construction, `c_d = 2^{−(d+2)}(d+1)^{−(d+1)}`.
- **AC.1.29 properisation:** Tao's Proposition 8.4 induction spelled out (no change of statement).
- **New AC.1.32 quasi-polynomial Bogolyubov** (Sanders Thm 1.1 + Milićević Cor. 28 = LSS Lemma A.4):
  a hidden supplier of LSS Appendix A, needed for the quasi-polynomial inverse theorem.
- **AC.2.10 Rahman:** Rahman's note is unobtainable (the Semantic Scholar PDF link in Bennett–Siksek [31]
  is dead; no archive copy; not in the cleared library). Replaced by a complete explicit route of my
  own: `roth_density_increment` (increment `α²/64`, length `≥ α√N/100`, valid for `N ≥ 9700/α²`) and
  an iteration bounding the number of steps by `(4096/63)/δ < 66/δ` via `1/α`. It proves the stated
  `exp(exp(132 log 2/δ))` threshold with a large margin, so ErdosProgressionPowers' use
  (`132 log 2 · 10^5 < 10^7`) is unaffected. Locator corrected: Bennett–Siksek Theorem 8 is in §9.
- **AC.2.2 / AC.5.7 convex cutoff and enlarged box:** four named lemmas (embedding, cutoff Fourier
  expansion, phase absorption — this is where `k ≥ 3` enters — and the enlarged-box comparison via
  `intervalGowersNorm_independent_modulus`); AC.5.7 adds Kai's normal form D.2 and D.5–D.12.
- **AC.3.9, 3.13, 3.16, 3.17, 3.18, 3.20:** Host–Kra/Lazard–Leibman and GTZ Lemma B.9 Taylor
  expansion; coordinate and metric comparison lemmas (GT orbits App. A, Leng App. B); Leng §§2–4 and
  App. A–B; LSS Lemmas 6.2–6.3, 7.5, 8.3, 9.1, §§10–12 and App. A–C with each parameter tracked; the
  Kronecker substitution as a Freiman 2-isomorphism plus "cubes are determined by parallelogram
  relations"; GT orbits Thm 2.9 → Prop. 9.2 → iteration.
- **AC.4.9 densification:** CFZ exposition Prop. 6.1, Lemmas 6.3–6.4, Theorem 6.2 (13)–(19), 6.5;
  CFZ relative Szemerédi §6.3.
- **AC.4.12–4.13 smooth moments:** CFZ §9 (box-to-residues, Fourier representation (30), Euler factors
  (33)–(34), zeta factorisation (35)/(39), `c_χ` identity (38), error bounds) and the bad-box count of
  Prop. 8.4's proof.
- **AC.4.14 sharp route:** Green–Tao Props 9.5, 9.6, 9.10, Lemma 9.9, Lemmas 10.1–10.6, Lemma 10.4/App. A,
  plus the divisor bound.
- **AC.5.9 (Kai Type I/II):** Kai §§9.1–9.6, §10 (with Lemma 10.2), §11; the two sign misprints of §9.4
  are recorded as such.

## Lean

`Suggested.lean` follows the 2026-10-19 rules: `import Mathlib` plus `TauCeti.RepresentationTheory.Compact.Haar`;
every `example` is now proved (32, at most two per kept definition); the review's negative controls and
boundary checks that are not yet provable are named theorems (listed in the README, "How to read the
build"). Proved theorems: `fourier_eq_wInner`, `measureEntropy_dirac`,
`DegreeFiltration.subsingleton_of_degree_zero`. New milestone statements: `cyclic_bohr_contains_proper_gap`,
`simultaneous_monomial_recurrence`, `roth_density_increment`, `card_divisors_le_exp`. The stale
`#check` of `ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux` is gone.

## Checks run

- `lean-check …/Suggested.lean` (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0; the only warnings
  are 67 `declaration uses 'sorry'`. 1,091 lines.
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: no offenders.
- `python3 research/blueprint/intake.py check-files` on the three package files and this note: 0 problems.
- Scripted README checks: every `AC.k.n` reference resolves to a heading; every `*Needs:*` reference
  points to an earlier target; no process vocabulary.

## Numbering

Two targets were added: AC.1.32 (quasi-polynomial Bogolyubov, at the end of AC.1, so the old AC.1
numbers are unchanged) and AC.5.8 (Kai's arithmetic inputs), which shifts old AC.5.8–AC.5.14 to
AC.5.9–AC.5.15.

## Sources read this run (public; SHA-256 prefixes)

Schoen–Shkredov 1106.1601v1 (d59e641b), LSS inverse 2402.17994v3 (12439e0b), LSS Szemerédi 2402.17995
(522373d9), LSS five-term 2312.10776 (51f2e4e3), Leng 2312.10772v5 (779c3233), Kai 2306.16983v5
(c5e9e91f), Green–Tao primes math/0404188v6 (d03dd615), GT orbits 0709.3562v4 (37f15cf4), erratum
1311.6170v3 (0930ad0e), GT Möbius 0807.1736 (1983964e), GTZ 1009.3998 (24b5b74b), CFZ exposition
1403.2957v4 (a5664e46), CFZ relative 1305.5440 (653a46b8), Zhao 1307.4959v2 (7a034817), Sanders
1011.0107 (11c8c48f), Tao 254A notes (CMU compilation, 961b3332), Bennett–Siksek (author copy), Tao's blog post *The divisor bound* (read 2026-10-20).
Not obtainable: Rahman's note (Bennett–Siksek [31]); Milićević 2109.03093 and GT quadratic uniformity
were cited from the statements in LSS and GT Möbius, not re-read.

No suspicious instructions were found in any fetched text.
