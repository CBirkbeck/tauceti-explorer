# Handoff: PKG-SpecialValuesBirchTate~codex

Issue #10752; agent Claude (Opus 5.5), session claude-UQZLCr; claim confirmed by the swarm bot on 2026-10-19. This is the complete package submission for independent review (REV-PKG-SpecialValuesBirchTate), not a review of this worker's own work. One Sonnet subagent ran a mechanical cross-check of the plan's 17 supplier requests against the supplier packets; it decided nothing. Every statement, verdict and edit is this worker's.

## Deliverables and checks

- `research/blueprint/packages/SpecialValuesBirchTate/README.md`: about 156 KB, 8 layers, 39 `### k.n` subsections. It has an opening **Summary.**, Scope and ownership with the duplication boundary, Conventions with the two-term sign witness, Exact supplier contracts (Mathlib, Tau Ceti at the pin and current, and 15 roadmap suppliers by layer), How to read the build, per-layer Examples and Dependencies, Worked examples, Downstream consumers and References.
  - Every definition has an API list and at least three discriminating **Checks.**: `BirchTateFormula`, `chiFive`, `sEulerFactor`, `sModifiedZeta`, the 2-adic zeta series, `FedererMainConjecture`, `hInvariant`, `motivicRegulatorCovolume`, the two Lichtenbaum predicates and `TateMotiveETNC`.
  - Every theorem carries hypotheses, a locator and *Needs:*.
- `research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean`: 379 lines in `namespace TauCetiRoadmap.SpecialValuesBirchTate`, importing `Mathlib` plus two Tau Ceti modules at the pin.
  - It contains only statements whose carriers exist at the pins:
    - archimedean factors (§2.1);
    - positivity of `dedekindZeta` on σ > 1 (§2.2);
    - rational reconstruction from valuations (§2.6);
    - the real-bodied definition `chiFive` with its values, its parity and L(−1, χ₅) = −2/5 (§3.2);
    - the real-bodied definition `sEulerFactor` with its seven API theorems (§4.1).
  - It has 24 checks as `example`s, all proved. They pin every sign, twist and normalisation: the ℚ and ℚ(√5) formulas and their wrong variants, the S-integer signs, the Deligne–Ribet denominators, the Kolster/Kurihara 2-adic valuations, and the even-weight and real-place numbers.
  - It has no sorry'd data, no `True` placeholders and no process comments. One closing comment names the README targets that cannot be typed at the pins.
- `research/blueprint/packages/SpecialValuesBirchTate/metadata.toml`: `topic = "math.NT"`.
- `lean-check research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean` ran in the shared pinned build (Mathlib 082e2d37e8, Tau Ceti f790474): exit 0, exactly 20 warnings, every one "declaration uses `sorry`", and no errors. The output also shows the two `#check` info lines that pin `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff` and `TauCeti.LSeriesSummable_dedekindZetaCoeff_iff`. One elaboration at a time; no lake, cache or language-server command was run. A `sorry` build checks types, not truth.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- Mechanical name check: every Mathlib and Tau Ceti name in the README is in the pinned declaration index, except the declarations explicitly marked "current Tau Ceti" (read in the current Tau Ceti checkout at a91d3aaf), supplier-roadmap names (`K2`, `wInvariant`, `dedekindZetaC`, …), and this roadmap's proposed names.

## Route changes against the accepted plan (for the reviewer)

1. **The end theorem no longer rests on the open I.10 dictionary.** The plan proved the 2-part of Birch–Tate for every totally real F as Kurihara ⇒ Federer's conjecture (through the classical–modern module dictionary of IntegralIwasawaTheory I.10, whose parts (b)–(c) are still open under G-I10-REALPLACE) ⇒ Kolster's Theorem 5. The package uses Kolster's own cohomological argument instead (Rognes–Weibel 2000, Appendix A, Theorem A.1, p. 45, proof p. 47):
   - char(X_{F_∞,S}) = ((γ − 1)g), with real places allowed to ramify (I.10's characteristic-ideal form of Kurihara's I.9), together with X having no finite submodules (I.2), gives #X(−n)_Γ ∼₂ (u^n − 1)ζ_{F,S}(1 − n) by coinvariant evaluation (I.4);
   - #X(−n)_Γ = #H²(𝓞_F[1/2], ℤ₂(n)) by descent (I.4(d));
   - #H¹ = w_n^{(2)} by M.2 and N.4;
   - K₂{2} ≅ H² by N.6 and M.3.

   This is §7.1–§7.4. I.4's dyadic statement and I.10's finite Euler-characteristic comparison both state the formula conditionally on the 2-adic main conjecture, and I.10 itself says the implication to K₂/W₂ belongs to this roadmap. Checked over ℚ at n = 2 and n = 4 (X = Λ/(2), (u² − 1)/12 = 2, 624·(−7/120) of valuation 1). Federer's conjecture for every F (the plan's B.6 nodes) is kept in §7.5 as a comparison, and only it depends on I.10's dictionary.
2. **Generality** (maintainer rule of 2026-10-16), each a specialisation the sources support:
   - the sign and rationality of ζ_F(1 − n), and Deligne–Ribet integrality w_nζ_F(1 − n) ∈ ℤ, in every even weight (§2.4, §2.5, §2.8);
   - the Euler-factor values at every 1 − n (§4.1, §4.2);
   - Kolster's Theorem 3.3 for characters χ of order prime to ℓ, not only χ = 1, n = 2 (§5.2);
   - the 2-adic special values in every even weight for every totally real F (§7.2);
   - the even-weight formula ζ_F(1 − n) = (−1)^{k r₁}2^{r₁}#K_{2n−2}/#K_{2n−1} for every totally real F (§8.5; the plan had only abelian F). The K-book's proof of VI.8.8 (book p. 516) uses the abelian hypothesis only through the 2-adic main conjecture, which Kurihara supplies. The abelian case is the specialisation `higherLichtenbaum_of_isAbelianGalois`, with the classical proof described.
   - the cohomological form |ζ_F(1 − n)| = h_n/w_n (§8.3).
3. **Deligne–Ribet integrality (§2.8)** is derived from the smoothed integrality (0.4) that AutomorphicPadicLFunctions L3 actually states, plus abelian Chebotarev (TauCetiRoadmap.Chebotarev, Layer 9) to find a prime 𝔠 with v_p(N𝔠^n − 1) = v_p(w_n). The annihilator form the plan requested is not in L3.

## Duplication removals (against current TauCetiRoadmap main 34dcf0e2, open other-author PRs #248, #253 and #1142, current Tau Ceti a91d3aaf, and the supplier plans)

| Plan node | Now | Reason |
|---|---|---|
| B.2/zeta-via-reciprocal-gamma | removed; §2.3–§2.4 cite BorelRegulators R.5 | R.5 proves the exact vanishing order and the leading-term functional equation by the same gamma-factor argument |
| B.3/dedekind-zeta-of-the-rationals | removed; §3.1 reads ζ_ℚ(−1) off LFunctions' K = ℚ card | LFunctions (#248) Layer 1 mandatory check `completedDedekindZeta ℚ` = `completedRiemannZeta`, Layer 8 comparison cards |
| B.3/sqrt-five-ideal-count, B.3/sqrt-five-zeta-factorisation | removed; §3.2 cites LFunctions Layer 4 at D = 5 | LFunctions owns quadratic factorisation at coefficient, convergent and continued levels |
| B.4/k2-ell-part-unchanged-by-inverting-ell, B.4/k2-ell-part-as-etale-cohomology | removed; §5.3, §7.3 and §8.1 cite ArithmeticKTheory N.6 | N.6/even-groups-at-odd-primes already gives K_{2i}(𝓞_S){ℓ} ≅ H²(𝓞_S[1/ℓ], ℤ_ℓ(i + 1)), including the passage to 𝓞_S[1/ℓ]; at 2, N.6/the-two-primary-corrections row n = 2 |
| B.4/w2-ell-part-as-etale-cohomology | removed; cited | MotivicEtaleKTheory M.2/adic-s-integer-cohomology (c) states H¹_tors ≅ H⁰ = ℤ/w_j^{(ℓ)} for j ≠ 0, every ℓ |
| B.8/real-place-two-correction | kept as §8.4, proved as the 2-adic valuation of N.6/order-ratio-for-totally-real-fields | the full order ratio is ArithmeticKTheory's; only its dyadic reading is stated here |
| B.7/s-modified-dedekind-zeta (half-plane compatibility) | the identity on Re s > 1 cites current Tau Ceti `TauCeti.LSeries_ofBadPrimes` | same product; `sEulerFactor` uses that expression verbatim |
| arithmetic of ℚ(√5) | cited: current Tau Ceti `TauCeti.NumberField.Sqrt5` | discriminant, total reality, units, class number, splitting law, inertia at 2 |

Searched by object (K₂, tame kernel, Birch–Tate, Lichtenbaum, Dedekind zeta values, Iwasawa main conjecture, Euler factors, quadratic characters) in all 98 roadmaps and the Completed roadmaps on TauCetiRoadmap main 34dcf0e2 (downloaded through `gh api`; the local checkout is a feature branch), and in current Tau Ceti. Results:
- Only the items above overlap.
- NumberFieldArithmetic and GlobalNumberFields have the class-number residue only.
- Completed ArithmeticDirichletSeries defers continuation to LFunctions.
- AlgebraicKTheory (#1142) A5 also defines K₂ of a ring as the Steinberg kernel. That is an overlap between K2SymbolsBrauer T.1 and an upstream PR, outside this package; noted for the maintainer.

## Notions planned here because the supplier does not plan them (the request cross-check found them missing)

- Galois codescent for extensions of degree prime to ℓ (Kolster 2009 Prop. 2.3): §5.1. ArithmeticKTheory N.6 does not state it.
- Kolster's exact sequence for the 2-Sylow subgroup of K₂ (Kolster, K-Theory 1 (1987), Thm. 3.7, as stated in Kolster 1989, p. 249): §6.2. No ArithmeticKTheory node mentions it.
- The second-kind twist in Greither's variable, with multiplier ρ(γ′)^{−1}: §6.5. DirichletPadicLFunctions L2 has nothing of it. The multiplier comes from the integral representation ⟨x⟩^{−s}ρ(x); Rognes–Weibel A.2 works in u^{1−s}.
- The norm-kernel minus module against the quotient by 1 + j, with explicit maps (inclusion and 1 − j, composites = 2) and finite kernel and cokernel under μ = 0: §6.5. IntegralIwasawaTheory I.2 states the comparison only qualitatively.
- The untruncated Deligne–Ribet bound w_n(F)ζ_F(1 − n) ∈ ℤ: §2.8.
- The motivic regulator covolume R_n^M and its power-of-two comparison with the Borel covolume: §8.2. PeriodsAndSpecialValues PS.3 has no normalised motivic lattice.
- The Tate-motive specialisation of the ETNC, with lattice invariance proved from Burns–Flach Lemmas 5–6: §8.6. PS.4 lacks Lemma 6; PS.5 has no Tate-motive interface.
- The Chern-class form of the residue square follows from M.8's c_{2,2} = −h and M.3's ∂h = −κ∘tame: §4.6.

Upward citations: none. No packet lists a SpecialValuesBirchTate node as a prerequisite, so every cited roadmap sits below this one in the K-theory dependency graph. The K-theory roadmaps are outside the Caraiani–Newton tier list, and no tier or bundle was invented. The plan cited AutomorphicPadicLFunctions L3, which is dropped from the CN order with its notion moved to PadicFamilies L5. The cross-check found that PadicFamilies L5 contains no Deligne–Ribet content, so L3 stays the supplier.

## What the README could not support from a read source

- Kolster 1987 (K-Theory 1), Iwasawa 1983 (Amer. J. Math. 105), Federer 1982, Wiles 1990, Deligne–Ribet 1980 and Tate 1976 are not freely obtainable and were not read. They are cited as stated in Kolster 1989 (published Cambridge PDF, SHA-256 ce649cf4…, printed pp. 248–251 read) or through the supplier layers that own them.
- The second-kind multiplier ρ(γ′)^{−1} is derived, not quoted. Washington's book, the standard reference, is not cleared.
- The Check X_{ℚ_∞,{2,∞}} = Λ/(2) uses the structure of the maximal pro-2 extension of ℚ unramified outside {2, ∞} (a free pro-2 product of ℤ/2 and ℤ₂). It is consistent with G_ℚ ∼₂ 2, but its source was not read here.
- Federer's conjecture for every totally real field (§7.5) depends on IntegralIwasawaTheory I.10's module dictionary, which that roadmap still records as an open target (G-I10-REALPLACE). The end theorem does not depend on it.
- IntegralIwasawaTheory's packet for I.1–I.7 and I.10 is under review (needs_changes), as is GeneralAlgebraicKTheory K.1/K.6; their statements cited here may move.
- Two inherited plan gaps are closed by their suppliers: the K₂(ℤ) upper bound (K2SymbolsBrauer T.5/integer-kernel-upper-generation) and the ℚ(√5) tame-kernel upper bound (ArithmeticKTheory N.8/real-quadratic-upper-generation).

Sources re-downloaded on 2026-10-19 into scratch; their hashes match the plan's source register:
- K-book a04f53c9…;
- Kolster 2009 5772ace9…;
- Kolster 1989 ce649cf4…;
- Kurihara 22ebb98e…;
- Rognes–Weibel 9d770c07…

Locators re-read on 2026-10-19:
- K-book VI.8.6–VI.8.8 (book pp. 515–516) and V.6.8 (pp. 411–412);
- Kolster 2009 pp. 9–16;
- Kolster 1989 pp. 248–250;
- Kurihara §4.1–§4.2 (pp. 22–27);
- Rognes–Weibel Appendix A (pp. 45–48).

## Plan nodes and where they are in the README

| Plan node | README |
|---|---|
| B.1/birch-tate-formula, birch-tate-iff-mul, formula-implies-zeta-nonzero | §1.1, §1.2 |
| B.2/gamma-factor-values | §2.1 (all negative odd / positive even integers) |
| B.2/dedekind-zeta-real-positive | §2.2 |
| B.2/zeta-via-reciprocal-gamma | removed (R.5) |
| B.2/zeta-minus-one-sign | §2.4 (every even weight) |
| B.2/formula-fails-with-complex-place | §2.3 |
| B.2/positive-rational-from-valuations | §2.6 |
| B.2/birch-tate-iff-absolute-value, birch-tate-iff-valuations | §2.7 |
| B.2/denominator-consequence | §2.9 |
| B.2/zeta-minus-one-rationality | §2.5 (every even weight) |
| B.2/independent-denominator-integrality | §2.8 (every even weight) |
| B.3/dedekind-zeta-of-the-rationals | removed (LFunctions) |
| B.3/zeta-of-the-rationals-at-minus-one, k2-of-the-rationals-ring-of-integers, birch-tate-for-the-rationals | §3.1 |
| B.3/sqrt-five-ideal-count, sqrt-five-zeta-factorisation | removed (LFunctions Layer 4) |
| B.3/sqrt-five-zeta-at-minus-one, sqrt-five-w2, sqrt-five-birch-tate-check | §3.2 (with `chiFive`, L(−1, χ₅)) |
| B.7/s-modified-dedekind-zeta, euler-factors-at-minus-one | §4.1, §4.2 |
| B.7/k2-order-of-s-integers, birch-tate-for-s-integers, enlarging-s, localisation-comparison-naturality | §4.3–§4.6 |
| B.4/k2-ell-part-unchanged-by-inverting-ell, k2-ell-part-as-etale-cohomology, w2-ell-part-as-etale-cohomology | removed (N.6, M.2), used in §5.3 |
| B.4/etale-euler-characteristic-and-zeta | §5.2 (general χ, every weight) with §5.1 codescent |
| B.4/odd-primary-birch-tate | §5.3 |
| B.5/federer-main-conjecture | §6.1 |
| B.5/tame-kernel-two-part-via-iwasawa | §6.2 |
| B.5/minus-module-coinvariant-order | §6.3 |
| B.5/federer-implies-two-primary-birch-tate | §6.4 |
| B.5/federer-conjecture-for-abelian-fields | §6.5 |
| B.5/two-part-birch-tate-abelian, birch-tate-for-real-abelian-fields | §6.6 |
| B.6/kurihara-main-conjecture-over-f | §7.1 |
| (new route) | §7.2, §7.3 |
| B.6/birch-tate-all-totally-real | §7.4 |
| B.6/kurihara-kolster-series-dictionary, kolster-kurihara-comparison-table, federer-conjecture-all-totally-real | §7.5 |
| B.8/cohomological-h2-model, h-invariant-primary-valuation | §8.1 (the latter as API) |
| B.8/lichtenbaum-formula-statements | §8.2 |
| B.8/odd-primary-even-weight-euler-characteristic | §5.2 (general weight) |
| B.8/odd-primary-lichtenbaum-totally-real | §8.3 |
| B.8/real-place-two-correction | §8.4 |
| B.8/higher-values-real-abelian | §8.5 (as the abelian specialisation of the all-totally-real theorem) |
| B.8/integral-equivariant-tate-statement | §8.6 |

## Adversarial pass (every statement; the instances that were computed)

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `BirchTateFormula` (§1.1) | ℚ; w₁ for w₂; no sign; K₂ of the field; ℚ(i) | ℚ holds; the four variants fail (−1, +1/12, 0, 0 ≠ 1/24) | Checks and Lean example |
| multiplicative form, nonvanishing (§1.2) | ℚ, ℚ(√5), ℚ(i) | 24·(−1/12) = −2; 120·(1/30) = 4; ℚ(i) 0 ≠ 1 | none |
| Γ_ℝ values (§2.1) | −1, 2, −3; pole −2 | −2π, 1/π, (4/3)π² (sign +); totalised 0 at −2 | general sign (−1)^k added; non-example proved in Lean |
| positivity (§2.2) | ℚ, σ = 2; σ = 1/2 | π²/6 ≥ 1; junk outside convergence | hypothesis σ > 1 kept |
| vanishing with complex place (§2.3) | ℚ(i) n = 2; ℚ n = 2, 3 | 0; −1/12; ζ(−2) = 0 | "pole" in K-book read as zero |
| sign formula (§2.4) | ℚ n = 2, 4; ℚ(√5) n = 2 | −1/12; 1/120; 1/30 ⇒ ζ_{ℚ(√5)}(2) = 2π⁴/(75√5) | generalised to all even n via R.5 |
| rationality (§2.5) | ℚ n = 2, 4, 6; ℚ n = 3 | −1/12, 1/120, −1/252; 0 for odd n | evenness hypothesis |
| rational reconstruction (§2.6) | −1 vs 1; 2/24 vs 1/12; q = 0 | positivity and q ≠ 0 necessary | q ≠ 0 hypothesis added to the primewise form; both non-examples proved in Lean |
| primewise form (§2.7) | ℚ at 2, 3; ℚ(√5) at 2, 3, 5; sign | all hold; blind to sign | Check that the sign is a separate input |
| Deligne–Ribet (§2.8) | ℚ n = 2, 4, 6; ℚ(√5); p = 2 with 𝔠 = (3); truncated value | 24/12, 240/120, 504/252 integral; v₂(8) = v₂(24) | route via (0.4) + Chebotarev; m = 0 case covered |
| χ₅ (§3.2) | values at 0, 2, 3, 4, 11; parity; trivial character | 0, −1, −1, 1, 1; even | parity non-example (odd L(−1, χ) = 0) |
| L(−1, χ₅) | Bernoulli sum | 4/25 ⇒ −2/5 | Lean example proved |
| w₂(ℚ(√5)) | ℓ = 2, 3, 5, ≥ 7 | 8·3·5 = 120 | ℓ = 3 argument rewritten (unique quadratic subfield ℚ(√−3) of ℚ(μ₉)) |
| `sEulerFactor` (§4.1) | S = ∅; s = 0 with S ≠ ∅; s = −1 for {2, 3}; inverse factor | 1; 0 (so n ≥ 2 needed); 2; 1/24 ≠ 1/6 | hypothesis 1 ≤ n on the natCast form (n = 0 gives ℕ-subtraction junk); s = 0 example proved in Lean |
| K₂ of S-integers (§4.3) | ℚ with {2}, {3}, {2, 3}; residues outside S | 2, 4, 4; wrong sequence gives an infinite sum | none |
| S-integral formula (§4.4) | ℚ with {2}, {3}, {2, 3}; unmodified sign; ℚ(√5) with {2} | 1/12, 1/6, −1/6; −1/12 fails; −1/10 = −12/120 | Lean example |
| enlarging S (§4.5) | S = T; {3} ⊂ {2, 3} | identity; sign flips, ℓ-part kept | none |
| naturality (§4.6) | 𝔽₇, m = 3 residue sign; prime with ℓ ∣ q − 1 | −κ ≠ κ; ℓ-part grows | Chern form derived from c_{2,2} = −h |
| codescent (§5.1) | G trivial; ℚ(μ₃)/ℚ at 3; ℚ(μ₉)^+/ℚ at 3 | identity; 0; fails (Ĥ⁰ = ℤ/3) | ℓ ∤ #G hypothesis kept |
| Kolster Thm 3.3 (§5.2) | ℚ ℓ = 3 n = 2; ℚ(√5) ℓ = 5; ℚ n = 4 ℓ = 5; odd χ | −1 = 0 − 1 in each; parity needed | general χ form stated |
| odd Birch–Tate (§5.3) | ℚ, ℚ(√5) at odd ℓ | 0 = 1 − 1 | none |
| 2-adic zeta series (§6.1) | ℚ u = 5; ℚ(√2) u = 9; no pole factor | v₂ = 1, 2; not a power series | Lean example proved |
| Federer predicate | ℚ, ℚ(√2); no 2^{[F:ℚ]} | (2) = (2), (4) = (4); (2) ≠ (1) | none |
| Kolster Thm 1 (§6.2) | ℚ, ℚ(√2); no unit factor | 2, 4; 1 contradicts {−1, −1} ≠ 1 | Kolster's free ℰ treated as torsion-free (enough for Tor = 0) |
| Lemma 2 (§6.3) | ℚ; contragredient instead of covariant; Λ/(2, T) | f = 1; wrong evaluation point; finite module breaks evaluation | E2: dual, not the direct limit |
| Theorem 5 (§6.4) | ℚ u = 5; identity 1 − (1 + 2^eε)² | v₂ = 1; parity of 1 + 2^{e−1}ε for e ≥ 2 | Lean `ring` example |
| Federer for abelian F (§6.5) | ℚ(√2) (F′ = ℚ, b = 1); ρ of order 2 vs 4 | 2·2/2 = 2; multiplier error invisible at order 2 | multiplier ρ(γ′)^{−1} fixed; norm-kernel comparison with maps |
| abelian Birch–Tate (§6.6) | ℚ(√2), ℚ(√5), ℚ(i) | v₂ = 2; 4 = 120/30; abelian but not real fails | none |
| Kurihara over F (§7.1) | ℚ; Λ/(2, T); real places unramified | char (2) = (u² − 1)/12; finite ≠ order; X = 0 | real ramification required |
| 2-adic values (§7.2) | ℚ n = 2, 4; K₃ for H¹ | 1 − 3 = −2, 1 − 4 = −3; 16 ≠ 8 | route change (see above); Lean example |
| 2-part (§7.3) | ℚ, ℚ(√5), ℚ(√2) | 1 + 2 = 3, 2 + 1 = 3, 2 + 2 = 4 | Lean example proved |
| dictionary (§7.5) | ℚ u = 5; ι_u vs inverse twist | −2/5 both sides; wrong pole point | none |
| comparison theorem (§7.5) | ℚ; Λ/(2, T); eigenspace vs norm kernel at 2 | (2) = (2·1); finite term kept; eigenspace wrong | (a), (g) attributed to I.10 |
| `hInvariant` (§8.1) | h₂(ℚ) = 2; H¹ rank for ℚ n = 2; H¹ torsion 24 vs K₃ 48 | Kolster p. 11 ranks interchanged (E6) | ranks corrected |
| Lichtenbaum predicates (§8.2) | ℚ n = 2 at 3; with 2; motivic; n = 4; ℚ(i) | holds; 1/24 false; 2/24; odd part of K₆ = 1; value vs leading term | predicates kept apart |
| odd part, totally real even n (§8.3) | ℚ n = 4, 6 | odd part of K₆, K₁₀ trivial; h₆(ℚ) = 2 | cohomological form added |
| real-place correction (§8.4) | ℚ n = 2, 4; ℚ(√5) n = 2 | 2/8 = 2·2/16; 2/16 = 2·1/16; 4/8 = 4·4/32 | stated as v₂ of N.6's ratio |
| higher values (§8.5) | ℚ n = 2, 4; ℚ(√5) n = 2; no 2^{r₁}; no sign | −1/12, 1/120, 1/30; −1/24, +1/12 fail | generalised to all totally real F |
| Tate ETNC (§8.6) | G trivial ℚ n = 2; ℚ(i)/ℚ center orders; index-2 section | 1/12 both images; (0, 1); rational proportionality too weak | lattice invariance from BF Lemmas 5–6 |

No statement in the README or the Lean file quantifies over arbitrary data without a hypothesis tying it to the construction. The README's generality equals the Lean signatures': the Lean file states only the declarations named in §2.1, §2.2, §2.6, §3.2 and §4.1, at the same generality.

## Where to resume

Nothing is left in this job. The independent review should do three things:
- re-check §7.2's use of I.4(d) at p = 2 against Rognes–Weibel p. 47;
- confirm the second-kind multiplier in §6.5 against a read source;
- decide whether IntegralIwasawaTheory's I.10 should be pointed at §7.2 as the consumer of its conditional dyadic statement.
