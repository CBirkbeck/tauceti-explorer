# Mistakes in Bakker–Tsimerman, *p-torsion monodromy representations of elliptic curves over geometric function fields*

Job ERRATA-PAPER-BAKKER-TSIMERMAN-16. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-BAKKER-TSIMERMAN-16.json` beside this file.

**Paper and versions read.** Benjamin Bakker and Jacob Tsimerman, Annals of Mathematics 184 (2016), 709–744, DOI 10.4007/annals.2016.184.3.2 (publisher PDF, SHA-256 `814976ee…f40a`). The authors' five-page erratum is on Bakker's homepage (https://benjamin-bakker.github.io/P.torsion.erratum.pdf, SHA-256 `db8effa1…acc1`). Both were read in full, and every quoted passage was re-read for this job.

**Earlier work.**
- The extraction PAPER-BAKKER-TSIMERMAN-16, by Codex, applied the erratum and noted further slips (its report §"Corrections and convention obligations").
- The independent review REV-PAPER-BAKKER-TSIMERMAN-16 (PR #1658) confirmed them and added E8 and E10.

**Existing corrections.** The authors' erratum corrects E1–E3. The Annals article page does not link it. arXiv 1403.7168 has v1 (2014) and v2 (May 2016), both before the erratum. A web search found no other correction. E4–E11 are new; E4 is a slip in the erratum itself.

**Effect on the main results.** Theorems 1–3, the function-field Frey–Mazur statement and the Hecke-curve theorem, stand with the erratum's corrected arguments. E1 is a false stated result, repaired in print. E2 and E3 are proof gaps, repaired in print. The rest are local slips.

---

## E1. Repulsion of anti-Heegner CM points (error; a stated result; corrected in the erratum)

Proposition 14 says that close CM points of the same type, with the same image in X(1) × X(1), lie on a low-degree Hecke curve. Remark 16 draws the consequence that anti-Heegner CM points repel, since Hecke curves do not pass through them. Footnote 4 on p. 712 relies on the same "stronger repulsion".

This is false for anti-Heegner points. The real-analytic involution that conjugates the second factor preserves the hyperbolic metric and exchanges Heegner and anti-Heegner points, so close anti-Heegner points exist and lie on conjugate Hecke curves. The proof fails because no h₀ ∈ SL₂(Z) need reduce to the non-identity coset of the stabilizer in its normalizer.

The erratum restates Proposition 14 for Heegner points only (its Proposition 2.1, with h₀ = 1). The first clause of Remark 16 remains true.

## E2. The proof of Proposition 25 at anti-Heegner points (error; the proof; corrected in the erratum)

Proposition 25 bounds mult_CM(C) = O(p^{−δ} Deg C) for non-Hecke curves. Its proof applies Proposition 14 to all CM points. For anti-Heegner points that step uses the false part of E1.

The erratum keeps the statement and gives a new argument: a relative volume estimate near the conjugate diagonal (its Proposition 3.1), leading to its Proposition 4.1.

## E3. The proof of Proposition 26 at singular bicusps (gap; the proof; corrected in the erratum)

The proof ends with mult_SBC(C) ≪ p^{−1+δ} Deg C. The proof of Theorem 29 needs p·|(π_i∘ψ)^{−1}(SBC)| = o(Deg C_i), that is, exponent −1−δ. The erratum calls the statement correct and the proof incomplete. It supplies a finer analysis of singular bicusps on low-degree Hecke curves (its Proposition 4.2): mult_S ≪ p^{−1−2δ₂} Deg C and mult_T ≪ p^{−1−2δ₃+3δ₁} Deg C, with δ₃ chosen first, then 3δ₁ < 2δ₃, and only then p large.

## E4. An inverted ratio in the erratum (misprint; affects nothing)

In the proof of the erratum's Proposition 4.1 (p. 3), the chain ends with "≪ (sinh(ρ_{X(p)}/2)/sinh(ε)) vol(T*_m C)". Proposition 3.1 says (1/sinh r)·vol(C ∩ B(Δ̄, r)) increases with r. So for 0 < ε < R < ρ/2 the small ball carries at most the fraction sinh ε/sinh R of the large one. Letting R ↑ ρ_{X(p)}/2 gives the factor sinh(ε)/sinh(ρ_{X(p)}/2), which is what produces the p^{−1} saving in the next line. The printed reciprocal is a large factor, since ρ_{X(p)} ~ 2 log p.

## E5. Lemma 15 in the order-three case (gap; affects nothing)

The proof notes that H ∩ M₂(Z) is Z[i] or Z[e^{2πi/3}], but then argues only in the first case. It uses "M′² = −1" to get M′ = ±t̃, and ends with g = a + b(0 1; −1 0) and m = det g = a² + b². In the order-three case t̃ satisfies t̃² − t̃ + 1 = 0. Then M′, which satisfies the same relation, lies in {t̃, 1 − t̃}, and g = a + b·t₀ with m = a² + ab + b². The conclusion, that (x, y) lies on T_m with m = p^{O(δ)}, is unchanged. The erratum does not revisit this.

## E6. The degree of the cyclic Hecke correspondence (error; affects nothing)

§2.5 defines T_n through cyclic isogenies of degree n, then says the projections have degree σ₁(n) = Σ_{d|n} d. For the cyclic correspondence the degree is ψ(n) = n∏_{ℓ|n}(1 + 1/ℓ); σ₁(n) belongs to the full correspondence over all subgroups of order n. For n = 4 the counts are 6 and 7, the difference being E[2]. The later estimates use only a polynomial bound such as deg T_m = O(m²), which both satisfy.

## E7. A component group in §2.5 (misprint; affects nothing)

The map ξ_d : C_p → C_p is written as ξ_d(x, a) = (x^d, a) for (x, a) ∈ G_m × Z/nZ. The smooth part of the p-gon C_p has component group Z/pZ, so it should read G_m × Z/pZ. The Z/nZ belongs to C_{pn} in the preceding map ϕ_n.

## E8. The cusped injectivity radius lacks a factor ½ (misprint; affects nothing)

For compact X, §3.1 defines ρ_X as half the length of the shortest closed geodesic. For X with cusps it then defines ρ_X as "the infimum of the lengths" of closed geodesics homotopically nontrivial in the compactification, dropping the ½. Lemma 5 and Corollary 8 (ρ_{X(p)} ~ 2 log p) use the definition with the ½.

## E9. A reversed comparison of metrics (misprint; affects nothing)

On p. 731 the text says "since the metric h_{Y(p)} on Y(p) is strictly smaller than the metric h_{X(p)}". Proposition 7 gives the reverse, h_{X(p)}|_{Y(p)} ≤ h_{Y(p)}. The displayed chain of inequalities, d_{X(p)} ≤ d_{Y(p)}, uses the correct direction.

## E10. A coefficient in the proof of Proposition 23 (misprint; affects nothing)

With f(s) = log(s/(1 − s)) and χ = |z − w|²/|1 − z w̄|², one has f∘χ = log|z − w|² − log(|1 − z w̄|² − |z − w|²). The first term of dd^c(f∘χ) therefore has coefficient −1, not the printed −1/(2π), in the first two lines of the display. The last line, (1/4π) ω_{D×D} + [Δ_D], is correct.

## E11. A dropped term in Riemann–Hurwitz (misprint; affects nothing)

In the proof of Theorem 29, "Riemann–Hurwitz applied to α yields 2g(C) − 2 = o(Deg C)". For α : C → P¹, Riemann–Hurwitz gives 2g(C) − 2 = −2 deg α + Ram(α). With Ram(α) = o(Deg C) this yields 2g(C) − 2 ≤ o(Deg C). That inequality is what contradicts the lower bound 2g(C) − 2 ≫ Deg C obtained next. The equality as printed drops −2 deg α.

## Not recorded

The extraction also lists formalization obligations that are not mistakes in the paper:
- the metric normalizations;
- the need to rule out a quadratic twist when descending from a geometric isogeny, in the reduction of Theorems 1–2 to Theorem 3;
- rigidified moduli for projective level structures;
- the treatment of cusps in cycle multiplicities.

The paper's shorthand is standard in each case.
