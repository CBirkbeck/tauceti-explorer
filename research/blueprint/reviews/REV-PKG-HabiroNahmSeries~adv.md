# Independent package review: HabiroNahmSeries

Job REV-PKG-HabiroNahmSeries~adv, issue #11094. Reviewer: Claude (Opus), session claude-SOUboG, 2026-10-19. The package was written by another session, Codex `codex-PPV1ZT` (PKG-HabiroNahmSeries~codex, #10882). This is a completed fixing review.

**Verdict: accepted.** With the corrections below applied, the README and Suggested.lean are ready for the draft pull request on TauCetiRoadmap. The global comparison targets that the README marks as conditional are explicit, named roadmap targets with their own hypotheses, not silent gaps. They are the Gaussian normalisation and mixed regularity, the radial Kummer identities, the full-algebra divisibility transfer, all-order product gluing, and the supplier's finite étale scalar extension.

## What was read

- PACKAGE_REVIEW.md in full, WORKERS.md, PROTOCOL.md §§5, 13 and 20, and UPSTREAM_GUIDE.md.
- The exemplar PadicMeasuresIwasawaAlgebras package.
- The seven plan packets (`HabiroNahmSeries.json` and the HB.3, HB.4, HB.5, HB.8, HB.9 and HB.10 refinements), queried by node and by cited prerequisite.
- The packager's handoff.
- Current upstream: TauCetiRoadmap main read-only (StandardDistributions, FuchsianOrbifolds and IntegralLattices), and the head of the open Theta Series pull request #286.
- Pinned Mathlib 082e2d3 and Tau Ceti f790474, and current Tau Ceti a91d3aaf.
- The supplier packages HabiroNumberFields, HabiroRings, HabiroCohomologyFoundations, K3BlochGroups, Polylogarithms, BorelRegulators, ColemanIntegration and ArithmeticQuantumTopology, read for their layer numbering.

## Corrections applied

1. **Duplication against upstream.** README §2.4 (`shiftedGaussianLattice`) and the supplier contracts planned multivariate Poisson summation by iterating the one-dimensional Mathlib theorem. Upstream IntegralLattices assigns Poisson summation for a full-rank ℤ-lattice, with the Gaussian Fourier transform, to the Theta Series roadmap. Theta Series is TauCetiRoadmap pull request #286, open at head eadeab2; its Layer 1 is the generic Schwartz-function theorem. The README now consumes that layer and keeps only the polynomial-Gaussian estimate. It notes that the coordinate-lattice case also follows from Mathlib's `SchwartzMap.tsum_eq_tsum_fourier`. The Layer 2 Dependencies and the Scope section say the same.
2. **Gauss sums already in Tau Ceti.** §7.5's "quadratic Gauss evaluation" is now supplied by the current Tau Ceti `TauCeti.FiniteQuadraticModule.gaussSum`, with `IsNondegenerate.gaussSum_mul_conj` and `gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical` in `LinearAlgebra/FiniteBilinearModule/GaussSum`. This library postdates the pin, and the README says so. The m ≡ 2 mod 4 vanishing is stated as the one local step.
3. **Wrong supplier layer numbers.** These were checked against each supplier's package headings and against the prerequisites the packets cite.
   - `PadicHodgeRegulators`: "Layers 1, 3 and 4" became stages D.1, D.3 and D.4, which are the stages the packets cite. PHR's L1, L3 and L4 are Bloch–Kato maps, the big logarithm and signed extensions, which this roadmap does not use. This was corrected at all four occurrences.
   - `HabiroNumberFields`: the README used atlas stage numbers ("Layers 1–2 and 6–7") while the package numbers its layers 0–3. The mapping is HB.1→0 (M_K and finite Chern map), HB.2→1 (cyclic dilogarithms), HB.6→2 (Habiro rings and Taylor maps) and HB.7→3 (sections, lines, tensor law and descent). All 14 references were renumbered, and the Scope section records the correspondence.
   - `HabiroCohomologyFoundations`: "Layer 8" for the analytic and crystalline/prismatic comparisons became Layers 7 and 9 (HQ.6 and HQ.8). The Scope section's "Layers 5–6 and 8" became "Layers 5–7 and 9".
   - `HabiroRings` now uses HR.1 and HR.5–HR.6, and `ColemanIntegration` uses L2, matching their packages. `QSeriesPartitionsAndMockModularForms` is cited as QM.0.
   - **Missing contracts added.** The packets cite QSeries QM.1 twelve times for the eta multiplier, the Andrews–Gordon constant and the bounded multiplier, but the README never named it; it is now in the supplier contracts, §2.2, §4.3, §7.5 and the Layer 2, 4 and 7 Dependencies. ArithmeticKTheory N.6 (finite tame kernel) and K3BlochGroups Layer 6 were added to the §7.3 *Needs*.
4. **Locators.** These were checked against the public PDFs; the printed pages of GSWZ run 3 behind the PDF pages from p. 28 on. Corrections:
   - "GSWZ Definition 1.8, p. 12", which does not exist, became Definition 2.8 and (93), p. 26.
   - "Zagier II.3B, (29), p. 48" became (3.7), p. 48.
   - Zagier in the References became II.1A, pp. 23–24, and II.3A–C, pp. 41–58.
   - "Vlasenko–Zwegers §4, pp. 11–18" became pp. 15–18.
   - Vlasenko–Zwegers Lemma 2.2 and (2.3)–(2.4) became pp. 2–3, in two places.
   - GSWZ page slips: (222) is on p. 46; (259)/(261)–(263) on pp. 52–53; (264)–(275) on pp. 53–54; (34) and (35) on p. 13; (31)–(33) on pp. 12–13; (59) on p. 19; (27)–(28) on pp. 11–12; (60)–(64) on pp. 19–20.
5. **Form.**
   - Title and Layer 1 heading capitalise Nahm and Habiro.
   - Five process phrases were removed: "exact requests", "if it is later needed", "needed later", "Request from" and "requested in".
   - §5.2 now names the definition `formalNahmSeries`, the declaration in Suggested.lean.
   - `rationalGaussTaylor_eq_gaussSum` is named as the §7.5 target.
6. **New discriminating Checks**, for definitions with fewer than three tests:
   - `nonsymmetricFormalRejected` (FormalNahmDatum; also a Lean example).
   - `goldenNondegenerate` (NondegenerateNahmSolution, positive case).
   - `positiveRootLiftChecks`.
   - `gaussRefinement`: the Gauss factor is independent of D, tested at D=4.
   - A root-dependence test of `rootExpansion` at ζ=−1.
   - `mvLogExp`.
7. **Lean.**
   - `/- ## Layer` became `/-! ## Layer`: six module-doc layer headers, in README order.
   - New proved `example`: a nonsymmetric integral matrix is not a `FormalNahmDatum`.
   - New theorem target `rationalGaussTaylor_eq_gaussSum`: for m>0, a_m = (∑_{k<m} e(k²/m))(∑_{k<m} e(−k²/m))/m. Its carriers are at the pins, and it is true by Gauss's evaluation; it is checked at m=1,2,3,4 below.

## Duplication audit (by object)

| Object | Where searched | Result |
| --- | --- | --- |
| Nahm sums, Nahm equations, Bloch classes of solutions, Rogers dilogarithm, Dedekind sums, Euler–Maclaurin remainder, plethystic coefficients, q-Pochhammer, Andrews–Gordon | Mathlib pin, Tau Ceti pin and current, TauCetiRoadmap main | Absent. Tau Ceti's "Pochhammer" files are the ascending factorial. |
| Multivariate Poisson summation and the lattice Gaussian Fourier transform | Mathlib (one-dimensional only), Tau Ceti current (none), upstream | Owned by Theta Series Layer 1 (PR #286). Fixed: now consumed. |
| Quadratic Gauss sums | Tau Ceti current `FiniteQuadraticModule.gaussSum` | Cited for §7.5 (fix 2). |
| Gaussian moments, covariance, densities | Tau Ceti pin and StandardDistributions L1 and L5 | Already consumed. Wick's pairing formula is not upstream, so the local formalGaussian stays. |
| Cusps, widths, meromorphic descent | Mathlib cusp API, Tau Ceti `cuspTranslationOrbitWidth`, FuchsianOrbifolds L3–L5 | Already consumed. Layer 3 adds only scalar growth. |
| Eta function and its transformation | Mathlib `ModularForm.eta` (no S-law at the pin) | The multiplier comes from QSeries QM.1 (fix 3). |

Every Mathlib and Tau Ceti name in the supplier contracts was confirmed at the pins, including:
- `Matrix.PosDef.add_posSemidef` (a protected lemma);
- `Matrix.posDef_iff_dotProduct_mulVec`;
- `IntermediateField.fg_adjoin_of_finite` and `essFiniteType_iff`;
- `KaehlerDifferential.span_range_derivation`;
- `Algebra.FormallyUnramified.finite_of_free`, with hypotheses [FormallyUnramified] [EssFiniteType] [Module.Free], as the README states;
- `ModularForm.eta`, `multipliableLocallyUniformlyOn_eta` and `eta_ne_zero`;
- `SchwartzMap.tsum_eq_tsum_fourier`;
- `Subgroup.isArithmetic_iff_finiteIndex`, `isCusp_SL2Z_iff`, `OnePoint.exists_mem_SL2`, `CuspOrbits` and `strictWidthInfty`;
- `HenselianRing.is_henselian` (a structure field) and `IsAdicComplete.henselianRing`;
- `MvPowerSeries.rescale`, which is f(aX), the direction `formalNahmSeries_qDifference` needs;
- `TauCeti.ModularForm.cuspTranslationOrbitWidth`, `TauCeti.multivariateGaussianPDFReal`, `TauCeti.multivariateGaussian_eq_withDensity`, `TauCeti.integrable_pow_gaussianReal` and `TauCeti.integrable_eval_mul_gaussianEnvelope`.

## Source checks

Locators were checked against the public texts, read on 2026-10-19: GSWZ arXiv:2412.04241v2, CGZ arXiv:1712.04887v3, GZ arXiv:1812.07690v1, Vlasenko–Zwegers arXiv:1104.4008, GW arXiv:2505.19885v1, Zagier's dilogarithm notes (Durham copy) and Wagner's thesis.

| Source | Locators confirmed |
| --- | --- |
| CGZ | Def. 2.1, Lemma 2.2 (pp. 8–9); (7)–(8) p. 3; (20)–(21) p. 10; (40) p. 34; (41) p. 35; (42) p. 36, with the complementary Rogers normalisation and the values π²/6, 0 and −π²/6 at 0, 1 and ∞; Thm 7.1 and (43)–(44) p. 36; Cor. 7.2 p. 36; Rem. 7.3 p. 37; Thm 7.4 and (45)–(52) pp. 37–39, including the phase n/24−1/8+1/(12n)−1/(4n²) in (49); Thm 7.5 and (53) p. 40; Remarks 7.6–7.7 pp. 40–41 |
| GZ | Lemma 2.1 and (4)–(5) p. 3, matching §2.2 term by term; Prop. 2.2 and (10)–(11) p. 4; (12)–(14) p. 4; (16) p. 5; Thm 3.1 and (18)–(20) p. 5; (21) p. 6; (23) p. 7; (24) p. 7 and (25) p. 8; Claims 1–4 pp. 8–9; (34)–(37) pp. 9–10; Prop. 7.1 and (50)–(54) pp. 13–14 |
| GSWZ | Defs 1.3–1.4 pp. 9–10; Def. 1.7 p. 11; Thms 4–5 p. 14; Cor. 1.11 p. 15; Lemma 2.3 and (65)–(73) pp. 20–21; Lemma 2.5 p. 22; Thm 6 pp. 24–25; Lemma 2.7 and (92) p. 25; Def. 2.8 and (93) p. 26; Lemma 2.10 p. 28; (110)–(114) pp. 28–29; Lemmas 2.12–2.13 pp. 30–31; Lemma 2.15 p. 32; Lemma 2.16 and Cor. 2.17 pp. 34–35; Thm 8 and (163)–(168) pp. 35–36; (169)–(170) p. 36; (174) p. 37; Lemma 3.1 p. 38; Thm 9 and (183) p. 39; Remark 3.11 p. 44; Thm 11 p. 46; (231) p. 47, whose coefficients match §7.2; (242) p. 49; (257) p. 51, with v = (−9u³−6u²−25u+37)/5; (279)–(280) p. 56; Examples 4.4–4.5 p. 57 |
| Vlasenko–Zwegers | Lemma 2.1 p. 2 (real positive definite symmetric A); Lemma 2.2 pp. 2–3; Thm 2.3 p. 4; §4 pp. 15–18 |
| GW | Def. 1.2 p. 5; (13)–(14) p. 5; Thm 1.13, Prop. 1.14 and (47) p. 11; Thm 1.18 and (50)–(53) p. 12; (173) p. 30; (182) p. 31 |
| Zagier | II.1A p. 23 (Rogers dilogarithm); II.3A and (3.3) p. 43; (3.7) p. 48 (the constant K) |
| Wagner | Corollary 2.13 p. 33; Corollary 3.13 p. 41 |

The README's corrections of printed formulas were each re-derived independently:
- **GSWZ (67).** The source prints −(m−1)/(2m). Expanding log(T;q)_∞ at q=−1+x directly gives U₂=(1+T)^(−1/2) only with +(m−1)/(2m), under the source's own convention f = e^{V/(m²h)}δ^(−1/2)U from (68).
- **GSWZ (280).** −24α²+32α−26 = −2(2α²−2α+3)² modulo α³−α²+1. The printed simplification 1/(√2(2α²−2α+3)) drops the factor (−6α²+10α−4)^(−1/2).
- **GSWZ (290).** (i/m)(∑ζ^{k²})² equals −2 at m=4, whereas ½(1+i^m)² equals 2.
- **GW (182).** At m=2, A=3 the printed sum gives (1+T)/δ. The q=−1 coefficients of Proposition 1.14, computed by q-Lucas, are 1,1,4,5,21,28, which equal (z⁻¹+T)/δ.
- **GZ (15) and (18).** The B sign must be negative: at A=2, B=1 only the negative sign gives the modular first coefficient +11/60; the printed sign gives 0.0597. The covolume factor is m^(−N/2), not m^(N/2), and the printed binomial phase fails at a=2, m=3 (numerics below).

## Adversarial pass

The scripts were plain Python with exact `Fraction` arithmetic or double-precision complex numerics. They were written for this review and are not kept in the repository; every value is reproducible from the README's formulas.

| Statement (README §) | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Dedekind phase χ_{a,m}=m^(−1/2)exp((1/m)∑ r Log(1−ζ^r))=exp(πi s(a,m)) (§2.2) | (a,m)=(1,1),(1,2),(1,3),(2,3),(1,4),(3,4),(1,5),(2,5),(3,7),(5,12) | Equal to 1e−15. s(1,3)=1/18 and s(2,5)=0 confirmed. | none |
| Euler asymptotic (q;q)_∞ ∼ χ⁻¹(2π/ε)^(1/2)exp(−π²/(6mε)+ε/(24m)) (§2.2) | m=1,3,4,5; ε=0.2, 0.1, 0.05 | Ratio 1 to 1e−13, so the remainder is flat. | none |
| Radial expansion constant χ^N m^(−N/2) c(Q) G S(0) (§2.5) | A=2, B=C=0 at a/m = 1/1, 1/3, 2/3, 1/5, 1/7; ε → 0 | Ratio → 1 linearly, first coefficient −1/(60m). The m^(−N/2) normalisation and the cyclic product prefactor are confirmed; GZ's printed m^(N/2) fails. | none |
| First relative coefficient (§2.3 Checks) | A=2, B=0; A=2, B=1; without the Euler term | −1/60, +11/60 (B sign negative), +1/40 | none |
| Finite Euler block lower bound, c_m>0 (§4.1) | m=1…6, t ∈ [0.005, 1], n ≤ 4000 | Minimum ratio 1, 1, 1.007, 1.015, 0.95, 0.87. c₂=1 also checked by hand. | none |
| Cusp formulas σ⁻¹(a/c+iy) and the λ-phase sign ε=dh/(1−ich/(2π)) (§§3.2, 4.3) | Symbolic; σ=((2,1),(5,3)); Γ₀(p); Γ(3) | Correct, including e(−3v/5), the 25y scale and Γ(3)'s index 12 with four cusps of width 3. | none |
| Majorant split Q(mℓ+s) and its values (§4.1) | A=2, B=1, C=11/60, m=2; rank 0, C=7, t=log 2 | B shifts 1/2 and 3/2; prefactors e^(−11t/60) and e^(−131t/60); value 1/128 | none |
| Unbounded good orders ((1,Lk),(L,1+L²k)) (§4.3) | Matrix product in both orders | The product order lower·T^{Lk} gives d=1+L²k, as stated | none |
| Clearing polynomial and Jacobian, including the sign (−1)^N (§1.3) | Rank one, general d,M; d=1, M=2, where it agrees with −1−2y at a root; M=−1 | Correct | none |
| Signed and unsigned equations and discriminant (§§1.2, 5.2) | A=3 discriminants −31 and −23; the 𝔽₅ roots 2 and 3; A=1 at t=1; the all-ones matrix (2−z)/z; A=2, z=2 over 𝔽₅; t=4/27, z=3/2 | All correct | Added `goldenNondegenerate` |
| Denominators and strong periods (§1.1, Lean `isStrongDenominator_two_mul`) | N=0; Q=n²/4; Q=n/2; nonsymmetric A | True as stated (symmetry is not even needed); the README's counterexample holds | Added `nonsymmetricFormalRejected` |
| `formalNahmSeries_qDifference` (Lean) | Coefficient identity for general symmetric A; rescale direction | e(n)−e(n−e_j)=(An)_j by symmetry, so the statement holds | none |
| A=3 series z, δ, V, the s_n, and V₋₁ (§§5.2–5.3, 7.2) | Exact to t⁸ | 1,1,3,12,55,273; δ=1−5t−3t²−10t³−42t⁴; V₃=t+5t²/4+28t³/9+165t⁴/16; s=1,1,3,10,40,171; V₋₁ as stated | none |
| Plethystic L_n (§§5.1, 5.4) | A=3 for n ≤ 4; the A=((2,1),(1,1)) mixed term; the wrong-sign series; (T;q^(−1))_∞ | L₁=q³, L₂=q⁷, L₃=q¹⁰+q¹¹+q¹³; L₄ has support 13–21 and sum 10; L_(1,1)=−q³; [t₁t₂]G₁=−q³; q²/(1+q) | none |
| Root expansion and U₂ (§5.1) | (T;q)_∞ at q=−1+x | U₂=(1+T)^(−1/2); the (m−1)/(2m) sign confirmed | Added a ζ=−1 root-dependence check |
| Order-m congruence system with sign (−1)^(mA_jj) (§5.5) | Rank-one coefficient identity; n=k<m | Holds; the initial term is killed | none |
| Restricted Adams coefficients (§5.5) | F=1+t₁t₂ at m=1,2; A=0, m=2 degree two; (t;q^m)_∞ | −(1−q^m); (1−q²)/2; 1−q; −(q³+2q−1)/(2(q−1)³(1+q²)(1+q+q²)) to q³⁰; 1/(2(1+q²)) | none |
| `regularisationJet` and the Wick coefficient (§6.2, Lean examples) | Rank one: T only; b and T; U only; b only; the A=3, m=1 jet at five rational z | 5/24, 29/24, 1/8, 1/2; the jet equals −(z−1)(28z²−99z+108)/(12(2z−3)³) exactly; all order-h contractions accounted for | none |
| Gluing coefficients (§6.5) | γ=5 at A=0 and A=3; Ψ and P toy values | 3−2x+x²+x³/5 and 3224/5; 16t⁴, 16t², 256t⁴, t/2 and 2t₁+t₂/2 | none |
| A=5, p=5 square-root components (§6.1) | δ mod 5 | T²=z⁴, components ±z², and T−z² = −2z² on the second | none |
| Quartic certificates (§7.3) | Exact arithmetic modulo u⁴+u³+3u²−3u−1 | Nahm equations, δ and δ⁻¹, e²−3e+1=0, Gram determinant −475, polynomial discriminant −11875, norms −1,1,1,−1,9025, v=−9e−3u²−5u+11, D₄ resolvent root 4, real root u=0.8848 with v=0.7894 and a₁=−0.0316353 | none |
| Second quartic factor (§7.3) | u⁴−u³+3u²−3u+1 with v=u³+3u | Nahm equations hold; discriminant 229 (prime, so maximal); irreducible resolvent (S₄); totally complex | none |
| Cubic, knots and Bloch–Wigner (§§1.5, 7.2, 7.4) | z³−z+1; 5₂; figure-eight; x³+x−1 | δ⁻¹=(2z²+3z−9)/23; disc −23 twice; δ=−√−3; 2D(ζ₆)=2.0298832128; D=±0.79158 at the complex roots; L_CGZ(golden)=π²/15; 2a₂−a₁²=−1/27 | none |
| Gauss families (§7.5) | m=1,…,24 numerically, both families; the m≡2 mod 4 shift | a_m=1,0,1,2 and the square family i,0,−i,−2, by m mod 4, for every m ≤ 24. G vanishes for m≡2 mod 4 by k↦k+m/2. a_{pm}=a_m for odd p. | New theorem `rationalGaussTaylor_eq_gaussSum` |
| Rogers–Ramanujan residues (§7.5) | m=1 residue of J(z,1)/z at both roots of ξ²+ξ−1 | F₁=−1/2−√5/10 exactly for ξ=(−1−√5)/2, matching GSWZ (294); −5F²−5F=1 | none |
| Lean signatures against README generality | All 11 theorems | Real PosDef A for existence; rational square systems in ℂ; NahmDatum sums on ℍ; f.g. ℤ-modules; symmetric integral A over RatFunc ℚ; m>0. These match the README. No hypothesis contains its conclusion, and none quantifies over unrelated data. | none |

## Lean

`lean-check research/blueprint/packages/HabiroNahmSeries/Suggested.lean` exits 0 at Mathlib 082e2d3 and the pinned Tau Ceti. The only diagnostics are 11 `declaration uses sorry` warnings, one per theorem target.

The file has 342 lines and imports only `Mathlib`. It contains one module docstring, `namespace TauCetiRoadmap.HabiroNahmSeries`, six `/-!` layer headers, 14 real-bodied light definitions and structures, and 21 proved examples (at most two per definition). It has no sorry'd data, no `lemma`, no `True` placeholders and no `#print`. Layer 3 has no statement typable at the pins and has no header.

`python3 research/blueprint/intake.py check-files` on the package files reports 0 problems, and the package contains no private paths.

## What remains

Nothing blocks the draft pull request. Two points need attention later:
- Theta Series is cited as an open upstream pull request, #286. If it lands under another name or layer number, update the two citations in the supplier contracts and §2.4.
- The HabiroNumberFields package is under its own review (#11070). If that review renumbers its layers, the Layer 0–3 references here follow it.
