# Mistakes in Gille–Parimala, *A local-global principle for twisted flag varieties*

Original job: ERRATA-PAPER-GILLE-PARIMALA-26; Claude Code, `cc-fb70e5`, 22 September 2026.
Independent review: REV-ERRATA-PAPER-GILLE-PARIMALA-26; Codex, `codex-7e92bd`, 23 September 2026.
Machine-readable findings: [PAPER-GILLE-PARIMALA-26.json](PAPER-GILLE-PARIMALA-26.json).

The review confirms the eight original findings with corrections to their scope and repair, adds the findings omitted from the later extraction, and records an additional completeness gap. There are 21 version-scoped entries: E4 and E8 have author corrections; E21 is already corrected in HAL; the remaining 18 have no correction found in the listed checks. E18 concerns the author erratum itself, and E19 concerns a cited paper, not GP's text.

## Sources and limits

The paper is [Inventiones mathematicae 244 (2026), 617–641](https://link.springer.com/article/10.1007/s00222-026-01403-x). I downloaded and read the relevant passages of both [arXiv v3](https://arxiv.org/pdf/2301.07572v3) and [HAL v5](https://hal.science/hal-03938963v5/document). HAL was accessible during this review, resolving the original worker's access limitation. All HAL page numbers below are **printed** page numbers; add one for the PDF cover.

The publisher exposes Appendices A and B, so E17 was checked in the published text, including its equation image. The main-body PDF request returned an access page. Accordingly, manuscript findings below are not assertions that every misprint survives in the typeset article. The published numbers Example 5.1(b) and Proposition 6.2 are supplied by the [author erratum](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf); other published numbers are not guessed. The current downloaded erratum is dated **26 May 2026**, despite an older search-engine excerpt dated March 18.

Additional primary sources were the [published loop-torsor paper](https://comptes-rendus.academie-sciences.fr/mathematique/item/10.5802/crmath.545.pdf), the [Chernousov–Gille–Reichstein author manuscript](https://www.math.ualberta.ca/~chernous/ChernousovPublications/RedStructure.pdf), and [HHKP v3](https://arxiv.org/pdf/1903.08007v3). The latter is described as the published version on arXiv; I could not obtain the separate AMS typeset chapter. Public URLs, exact hashes and per-finding searches are in the JSON. Searches checked on 23 September 2026 include the author publications/errata pages, arXiv revision histories, the Springer page and Crossref correction metadata. No absence claim goes beyond those checks.

The corrected point-existence arguments have the repairs described below. E6 and E17 affect literally stated results; this review is not a new exhaustive proof audit of every result in the paper. No Lean file was required or compiled, and no statement is claimed formalised.

## Identifier crosswalk

The original eight errata IDs are stable. The extraction's IDs are a different numbering in a different file.

| Errata ID | Extraction ID | Subject |
| --- | --- | --- |
| E1 | E2 | Unit-ball inequality |
| E2 | E3 | Derivative domains |
| E3 | E9 | Gluing identity |
| E4 | E10 | Completed fraction field |
| E5 | E12 | Two Laurent-series summands |
| E6 | E13 | Tits-index inclusions |
| E7 | E15 | Normalizer quotient |
| E8 | E16 | Henselian ring and valuation completions |
| E9 | E1 | Square-zero kernel and index convention |
| E10 | E4 | Strict-differentiability quantifier |
| E11 | E5 | Ambient group and second variable |
| E12 | E6 | Product neighbourhood and density |
| E13 | E7 | Torus powers and closure |
| E14 | E8 | Normality in a product of groups |
| E15 | E11 | Affine chart and density target |
| E16 | E14 | Properness on a singular component |
| E17 | E17 | Codimension-zero points in purity |
| E18 | E18 | False witness in the author erratum |
| E19 | E19 | Residue fields in the cited HHKP lemma |
| E20 | New in review | Incomplete intersection modules |
| E21 | E2 | Norm calculation already fixed in HAL |

## E1. Unit-ball inequality

**Confirmed — misprint; affects nothing.**

**Locator.** Lemma 3.2(3), arXiv 2301.07572v3, p. 5, and HAL hal-03938963v5, printed p. 8 (PDF p. 9). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** arXiv v3: V = Inf{v ∈ V[1/t] | |v| ≥ 0}. HAL v5: V = {v ∈ V[1/t] | |v| ≥ 0}.

**Correction.** V = {v ∈ V[1/t] : |v| ≤ 1}. Delete the extraneous Inf in arXiv v3. The arXiv proof-of-(2) mistakes formerly grouped here are retained separately as E21, because HAL v5 already fixes them.

**Check.** The induced absolute value is |t| = α^(-1) < 1. Saturation V ∩ tⁿR̂₀ = tⁿV implies that an element of V[1/t] has norm at most 1 exactly when it lies in V. The condition |v| ≥ 0 selects the entire space; for V = R̂₀ it includes t^(-1), which is not in V.

**Prior correction.** new

**Independent review.** Confirmed the surviving unit-ball misprint in both PDFs. Revised the version claim: HAL removes Inf and corrects the proof of (2), but retains ≥ 0. Split that already-corrected proof into E21 rather than classifying it as new.

## E2. Derivative domains

**Confirmed — misprint; affects nothing.**

**Locator.** Proposition 3.3(ii), arXiv v3 p. 6 and HAL v5 printed p. 9. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** "(ii) the differentials Df^a_0 : (F_0)^a → (F_0)^c and Df^b_0 : (F_0)^a → (F_0)^c satisfy Df^a_0(V[1/t]^a) + Df^b_0(V[1/t]^b) = (F_0)^c."

**Correction.** Df^b_0 : (F_0)^b → (F_0)^c, and Df^a_0(V[1/t]^a) + Df^b_0(W[1/t]^b) = (F_0)^c.

**Check.** The conclusion gives v ∈ V^a and w ∈ W^b, and the proof uses the embedding V[1/t]^a × W[1/t]^b → (F_0)^a × (F_0)^b, with differential Df^a_0 + Df^b_0 restricted to it. Taken literally the proposition is false. With V = R̂_0, W = 0 and f(v, w) = w, hypothesis (ii) holds, but every value f(v, w) with w ∈ W is 0. Checked on the page image. Noted by the extraction (gap G1).

**Prior correction.** new

**Independent review.** Confirmed both incorrect domains in both manuscripts. Checked the counterexample with a = b = c = 1, F₁ = F₂ = F₀, V = R̂₀, W = 0, f(v,w) = w: completeness, saturation and V + W = R̂₀ all hold. The intended statement and its proof use W in the second summand; retain misprint/nothing for intended mathematics.

## E3. Gluing identity

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Theorem 3.9, arXiv v3 p. 10; proof of Theorem 3.13, HAL v5 printed p. 15. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** "According to Proposition 3.7.(4), we can write h = h_1 h_2 with h_i ∈ H^+(E ⊗_F F_i) for i = 1, 2. Since x_1 = h.x_2, we obtain h_1^{−1}.x_1 = h_2^{−1}.x_2. This defines a point of X(E) = Z(F)."

**Correction.** h_1^{−1}.x_1 = h_2.x_2.

**Check.** From x_1 = h_1h_2.x_2 one gets h_1^{−1}.x_1 = h_2.x_2. The left side is a point over F_1 ⊗ E and the right side one over F_2 ⊗ E; they agree over F_0 ⊗ E and glue to a point over E. With h_2^{−1} the two sides need not agree. Noted by the extraction.

**Prior correction.** new

**Independent review.** Confirmed in both manuscripts by left-multiplying x₁ = h₁h₂.x₂ by h₁⁻¹. The repaired equality identifies the F₁- and F₂-points over F₀; no inverse on h₂ is possible in that calculation.

## E4. Completed fraction field

**Confirmed — error; affects nothing.**

**Locator.** Example 4.1(b), arXiv v3 p. 10 and HAL v5 printed p. 16; published Example 5.1(b) is the locator supplied by Gille’s erratum, p. 1. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** "The t-adic completion of R_U is R̂_U = k[x][[t]]; we have F_U = Frac(R̂_U) = k(x)((t))."

**Correction.** F_U = Frac(k[x][[t]]) ⊊ k(x)((t)). A witness in the complement is Σ_{n≥1} tⁿ/x^(n!). The incorrect geometric-series witness in the author erratum is a separate finding, E18.

**Check.** If c = a/b ∈ k(x)[[t]] with a,b ∈ k[x][[t]], cancel t-powers so b₀ ≠ 0; since c has nonnegative t-order this leaves a in k[x][[t]]. Put m = ord_x(b₀). Coefficient recursion b₀c_n = a_n − Σ_{i=1}^n b_i c_(n−i) gives ord_x(c_n) ≥ −m(n+1) by induction. The coefficients x^(-n!) violate every such linear bound. The general patching argument uses the fraction field definition, not the false equality.

**Prior correction.** Gille, Errata et compléments, 26 May 2026, https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf, p. 1, corrects published Example 5.1(b). Its proposed witness is wrong; see E18.

**Independent review.** Confirmed the false equality in both manuscripts and the author’s correction. Reproved strict inclusion by the coefficient-valuation bound. Separated the new error in the erratum’s witness from this already-known error, so the two have independent known statuses.

## E5. Two Laurent-series summands

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Lemma 4.3(2), arXiv v3 p. 11; Remark 4.4, HAL v5 printed p. 17. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** arXiv v3: “f₂ belongs to R̂_P so belongs to V” followed by “f₂ belongs to W”. HAL v5: “f₁ belongs to R̂_U and ... f₂ belongs to R̂_P”.

**Correction.** In arXiv v3 replace the first f₂ by f₁. In HAL v5 interchange the two ring subscripts: f₁ ∈ R̂_P and f₂ ∈ R̂_U.

**Check.** The first sum has x-exponents m_i − j ≤ 0, so belongs to k[[x⁻¹,t]] = R̂_P in this equal-characteristic example. Each coefficient of the second sum is a polynomial in positive powers of x, so that sum belongs to k[x][[t]] = R̂_U. The later version reverses both ring labels, a different slip from arXiv v3.

**Prior correction.** new

**Independent review.** Confirmed by checking the exponent ranges in each displayed sum in both versions. Expanded the correction to address HAL’s two reversed ring labels; the old one-word replacement describes only arXiv v3.

## E6. Tits-index inclusions

**Confirmed — error; affects a stated result.**

**Locator.** Theorem 4.4(2) and Corollary 4.5(2), arXiv v3 pp. 11–12; Theorem 4.5(2), Corollaries 4.6(2), 4.7(2), 4.8(2), HAL v5 printed pp. 18–19; type convention HAL §1.1(b), p. 3. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** Theorem 4.4(2): "The Tits index Δ_0(G) is the smallest subset of Δ(G_{F_s}) which is stable under the ⋆-action of Gal(F_s/F) and such that Δ_0(G) ⊂ Δ_0(G_{F_U}) for each U ∈ U and Δ_0(G) ⊂ Δ_0(G_{F_P}) for each P ∈ P." Corollary 4.5(2) is worded the same way. The proof defines Θ by the same condition and uses "Θ ⊂ Δ_0(G_{F_U}) so that Z(F_U) ≠ ∅".

**Correction.** After the stated identifications of simple roots, Δ₀(G) is the smallest ⋆-stable subset Θ containing every relevant local Δ₀(G_L). Use Δ₀(G_L) ⊂ Θ, not Θ ⊂ Δ₀(G_L), to deduce Par_Θ(G)(L) ≠ ∅. Apply this correction to all four HAL statements and their proofs, and to the arXiv counterparts.

**Check.** In the paper’s order-preserving convention, Δ₀(G) is the type of a minimal parabolic. Par_Θ(G)(L) has a point iff Δ₀(G_L) ⊂ Θ (with Θ stable over L); extension of fields can shrink this type. Let Θ be the smallest global ⋆-stable set containing the local types. The global type contains them, so Θ ⊂ Δ₀(G). The corrected local criterion and part (1) give a global Par_Θ point, hence Δ₀(G) ⊂ Θ. The printed smallest set contained in every local type would be empty, including when the group is anisotropic.

**Prior correction.** new

**Independent review.** Confirmed by reading the type convention and following both inclusions in the parabolic-variety proof. Extended the locator/correction to HAL Corollaries 4.7(2) and 4.8(2). This affects a stated Tits-index characterization; the corrected characterization follows from the point-existence part.

## E7. Normalizer quotient

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Proposition 5.2, arXiv v3 p. 15 and HAL v5 printed p. 21 (two occurrences of the quotient); published numbering 6.2 comes from the author erratum. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** "We apply now Theorem 1.1.(b) of [C-G-R] to the Z-group scheme Aut_I(G_0). It provides a finite Z-subgroup S_0 of Aut_I(G_0) … Furthermore the construction of S_0 is explicit in the proof, it is an extension of the finite constant group Aut_I(G_0)/T_0 by a finite subgroup of T_0."

**Correction.** Replace Aut_I(G₀)/T₀ by N_{Aut_I(G₀)}(T₀)/T₀ in the finite-extension description and the ensuing order bound. This finite constant quotient is W ⋊ Aut_I(Dyn(G₀)).

**Check.** For a nontrivial split semisimple group, the maximal torus is not normal in Aut_I(G₀), so the displayed quotient is not even a quotient group; its homogeneous space is positive-dimensional. The finite group in the Chernousov–Gille–Reichstein construction maps instead to the normalizer quotient. Checked Theorem 1.2(b) and the split integral construction, pp. 2 and 9–10, of the public author PDF RedStructure.pdf. Its theorem numbering differs from the citation in GP.

**Prior correction.** new

**Independent review.** Confirmed in both GP PDFs and independently checked the cited construction. Corrected both HAL occurrences and sharpened the reason: lack of normality precedes the finiteness problem. The Weyl/diagram order hypothesis concerns the normalizer quotient.

## E8. Henselian ring and valuation completions

**Confirmed — gap; affects the proof.**

**Locator.** Proof of Proposition 5.2, arXiv v3 p. 15 and HAL v5 printed p. 21; author erratum p. 1 identifies this as published Proposition 6.2. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** "We consider the local ring A = R_P of X at P and denote by A_D its localization at D."

**Correction.** Take A = R̂_P, the completion of the two-dimensional regular local ring R_P. Write L = Frac(R_P) = F and K = Frac(A) = F_P in the paper’s notation. If v and v̂ are their exceptional-divisor (order) valuations, the natural map identifies L_v with K_v̂. Do not use the erratum’s temporary notation F_P = Frac(R_P) as if it were the paper’s definition.

**Check.** Gille’s published loop-torsor paper, §2.1 and Theorem 4 (printed pp. 161 and 163), assumes a henselian regular local ring; R_P need not be henselian, whereas R̂_P is. The completion map gives isomorphisms R_P/m^n ≅ R̂_P/m^nR̂_P, hence the same associated graded ring and a dense embedding for the order valuation. Approximating numerator and denominator shows L dense in K for v̂, so their valuation completions coincide. This is the exceptional divisor of the blow-up at P, a valuation of the original function field covered by the hypothesis. The shared parameter/residue field alone is replaced here by this explicit density argument.

**Prior correction.** Gille, Errata et compléments, 26 May 2026, https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf, p. 1, correction to published Proposition 6.2.

**Independent review.** Confirmed the missing henselian hypothesis against the loop-torsor source and the author erratum. Repaired the original errata entry’s notation: in GP, F_P already means Frac(R̂_P). Henselianity is the cited requirement; completeness is a sufficient replacement. Verified equality of valuation completions by density, not merely by naming their residue fields.

## E9. Square-zero kernel and index convention

**Confirmed — misprint; affects nothing.**

**Locator.** Lemma 2.3 proof, printed p. 7, HAL v5 (26 December 2025); same in arXiv v3, written J_j = I^j/I^(j+1) = I A_j. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** it comes with the ideal m_j = m^j/m^(j+1) = m A_j which satisfies m_j^2 = 0. We have A_j/m_j = A_(j−1) for j = 1, . . . , n − 1

**Correction.** In HAL v5 use m_j = m^j/m^(j+1) = ker(A_j → A_(j−1)); delete “= m A_j”. The displayed quotient relation holds for j = 1,…,n. In arXiv v3 delete “= I A_j”; its convention is I^n = 0 and A_j is indexed only through n−1, so its quotient range 1,…,n−1 is already correct.

**Check.** For A = k[ε]/(ε³), j = 2, m A₂ = (ε) has nonzero square, whereas m²/m³ = (ε²) is square-zero. The dévissage needs the latter kernel. HAL chooses m^(n+1) = 0, while arXiv chooses I^n = 0: their upper indices must not be conflated.

**Prior correction.** new

**Independent review.** Confirmed the square-zero misidentification in HAL p. 7 and arXiv p. 4. Checked the different nilpotence-index conventions; the correction to the quotient range applies only to HAL. The proof needs the actual square-zero kernels.

## E10. Strict-differentiability quantifier

**Confirmed — misprint; affects nothing.**

**Locator.** proof of Claim 3.4, printed p. 9, HAL v5 (26 December 2025); same in arXiv v3. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** it is strictly differentiable [Sc, I.5.6], that is, there exists an open neighborhood Θ of (0, 0) and a positive real number β such that |f(x2) − f(x1) − Df(0,0).(x2 − x1)| ≤ β|x2 − x1| ∀x1, x2 ∈ Θ.

**Correction.** For every β > 0 there is a neighbourhood Θ_β on which the displayed remainder estimate holds. Also justify strict differentiability of the inclusion i by its continuity and K-linearity, not merely by its 1-Lipschitz property.

**Check.** One fixed β only bounds the remainder by a Lipschitz constant; it does not force the remainder/distance ratio to tend to zero. For example the zero function with the incorrectly proposed derivative identity satisfies the β = 1 estimate. The analytic map has the required uniform local remainder estimates, and the inclusion i is continuous K-linear with zero remainder, so the composition has the intended strict derivative. No assertion about a pinned Lean declaration is used here.

**Prior correction.** new

**Independent review.** Confirmed the quantifier slip on HAL p. 9 and arXiv p. 6. The continuous linear inclusion supplies the missing reason in the next sentence. The intended analytic argument survives; removed the extraction’s unneeded unverified Mathlib citation.

## E11. Ambient group and second variable

**Confirmed — misprint; affects nothing.**

**Locator.** Proposition 3.6, printed p. 10, and its proof, p. 12, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** Then G(F0)^+ is an open subgroup of G(F0)^+ and we have the decomposition G(F0)^+ = G(F1)^+ G(F2)^+. … the Claim 3.7 yields that b′♯(v) ∈ G(F1)^+ (resp. b′♯(v) ∈ G(F2)^+)

**Correction.** G(F0)^+ is an open subgroup of G(F0); in the proof, b′♯(w) ∈ G(F2)^+. The same b′♯(v)/b′♯(w) slip recurs in the proof of Proposition 3.9(1), p. 13.

**Check.** The printed openness is a tautology. The proof shows that G(F0)^+ contains the open set b′♯(Υ) of G(F0), and that openness in G(F0) is what Proposition 3.11 and the clopen arguments use.

**Prior correction.** new

**Independent review.** Confirmed the tautological ambient group in the HAL statement and the repeated v/w slips in its proof and Proposition 3.9. The displayed neighbourhood is open in G(F₀), so replacing the ambient group and the second variable repairs exactly what the proof establishes.

## E12. Product neighbourhood and density

**Confirmed — gap; affects the proof.**

**Locator.** proof of Proposition 3.9(1)–(2), printed p. 13, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** We conclude that RG(F1) RG(F2) is an open subgroup of G(F0) and a fortiori an open subgroup of RG(F0). (2) If RG(F1) is furthermore dense in RG(F0), then (1) shows that RG(F1) RG(F2) is a dense open subset of RG(F0). Thus RG(F1) RG(F2) = RG(F0).

**Correction.** Let A = RG(F₁), B = RG(F₂). The proof of (1) establishes an identity neighbourhood N ⊂ AB, without proving AB is a subgroup. For g ∈ RG(F₀), choose a ∈ A ∩ gN⁻¹ by density; then g ∈ aN ⊂ AB. Also insert f(0,x) = f(x,0) = x. Where Υ and Υ_ε are coordinate neighbourhoods, put their images b′♯(Υ), b′♯(Υ_ε) in the group inclusions.

**Check.** Neither subgroup closure of AB nor “dense open implies everything” is justified. The needed conclusion follows from left A-stability of AB and the neighbourhood already obtained. The density argument takes place in RG(F₀), with its subspace topology. The use of b′♯ keeps the coordinate neighbourhood and the group neighbourhood correctly typed.

**Prior correction.** new

**Independent review.** Confirmed the two logical shortcuts on HAL p. 13. Checked the replacement directly: a = gn⁻¹ implies g = an ∈ AB. It uses only the proved identity neighbourhood and density. Also corrected the omitted identity value and the coordinate/group notation in the same passage.

## E13. Torus powers and closure

**Confirmed — misprint; affects nothing.**

**Locator.** proof of Claim 3.12, printed p. 14, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** HAL p. 14 includes T♯(F₁) ⊂ RT♯(F₁), E♯(F₁) dense in E♯(F), and a closure inclusion involving T(F₁); it first requests T♯_(F₀) isomorphic to T and concludes projected unboundedness in T♯(F₀). The first displayed T♯(F₁) has no overbar in the page image.

**Correction.** Choose T♯_(F₀) G(F₀)-conjugate to T as an embedded maximal torus. The lifting gives T♯(F₁)^n ⊂ RT♯(F₁). Use density of E♯(F₁) in E♯(F₀), and conclude T♯(F₀)^n ⊂ closure(RT♯(F₁)). The projections of this closure are unbounded in G_i(F₀).

**Check.** If π:E♯→T♯ and πf = [n], then x^n = πf(x) is R-trivial because E♯ is quasi-trivial; the argument does not make every x R-trivial. Approximate f(x) for x ∈ T♯(F₀) by E♯(F₁)-points to obtain the closure inclusion. Rationality of the maximal-torus variety and openness of the G(F₀)-conjugacy class provide an embedded conjugate torus; an abstract isomorphism alone does not control the factor projections. Each isotropic torus factor has an unbounded cocharacter direction, and taking n-th powers preserves unboundedness.

**Prior correction.** new

**Independent review.** Confirmed the power, base-field and ambient-group slips by reading the HAL page image (including the bars). Corrected the extraction’s inaccurate claim that the first T♯(F₁) was under a bar. Checked the lift/approximation argument; the closure must be of RT♯(F₁), and the chosen embedded torus must be conjugate to the product torus.

## E14. Normality in a product of groups

**Confirmed — gap; affects the proof.**

**Locator.** proof of Proposition 3.11(2), printed p. 15, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** This implies that RG(F1) [under a bar] is a normal subgroup of G(F0)^+ = G1(F0)^+ × · · · × Gc(F0)^+ which maps onto each factor. … Finally Proposition 3.9.(3) enables us to conclude that RG(F1) RG(F2) = RG(F0) = G(F0)^+.

**Correction.** Let H be the closure of RG(F1), an open subgroup by (1) with p_i(H) = G_i(F0)^+. Then H ∩ G_i(F0)^+ is normalized by H, hence by p_i(H) = G_i(F0)^+, and is open, so it is not central; by Tits' theorem it is G_i(F0)^+. So H = G(F0)^+. The last step should cite Proposition 3.9(2): RG(F1) is dense in RG(F0) = G(F0)^+.

**Check.** Surjective projections do not imply normality: the diagonal of S3 × S3 maps onto both factors and is not normal. Proposition 3.9(3) assumes H_(F1 ⊗ E) strictly isotropic, which Proposition 3.11(2) does not. The proposition is not used later in the paper. The repair is item 57.

**Prior correction.** new

**Independent review.** Confirmed the unproved normality step on HAL p. 15: even the diagonal in S₃ × S₃ has surjective projections without normality. With H open, each H ∩ G_i(F₀)^+ is open and is normalized by the surjective projection p_i(H); it contains noncentral root-group elements. The Tits normal-subgroup result already invoked in the source then yields every factor. Checked that the final citation must be Proposition 3.9(2), since (3) has a stronger F₁-isotropy hypothesis.

## E15. Affine chart and density target

**Confirmed — misprint; affects nothing.**

**Locator.** proof of Lemma 4.3, printed p. 17, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** we can assume that f = u/v ∈ R_U mapping to 0 in k((x^(-1))) with u, v ∈ T[x^(-1)] … Then u maps to zero in k[x^(-1)] ⊂ k((x^(-1))), so that u = t u♯ ∈ T[x^(-1)]. … (2) It is enough to show that F1 ∩ R̂0 is dense in F0.

**Correction.** u, v ∈ T[x], u maps to zero in k[x], u = t u♯ with u♯ ∈ T[x]; and in (2), F1 ∩ R̂0 is dense in R̂0.

**Check.** R_U comes from the affine chart Spec(T[x]), so its representatives have numerator/denominator in T[x], with the denominator a unit modulo t; T[x⁻¹] is the wrong chart here. Also R̂₀ is a closed proper subset of F₀ (it omits t⁻¹), so a subset of R̂₀ cannot be dense in F₀. Surjectivity to the residue field and successive approximation prove density in R̂₀; multiplication by powers of t then proves F₁ dense in F₀.

**Prior correction.** new

**Independent review.** Confirmed both slips in HAL Lemma 4.3, p. 17. The density claim as printed is impossible in the t-adic topology; its corrected form is precisely what the successive approximation proof establishes. This is distinct from the incomplete-module choice in E20.

## E16. Properness on a singular component

**Confirmed — gap; affects the proof.**

**Locator.** proof of Corollary 4.7(1), printed p. 19, HAL v5 (26 December 2025). Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** Again Z_k is projective so that Z_k(D) = Z_k(k(D)) is not empty and in particular Z_k(k(P)) is not empty.

**Correction.** First replace the normal model by a regular model with strict-normal-crossing special fibre (Lipman's resolution; the reductive model and its flag scheme pull back). Its components are regular curves, and the valuative criterion then gives Z_k(D) = Z_k(k(D)). Corollary 4.6 is applied to the new model.

**Check.** A component D of the closed fibre of a normal surface need not be regular at P. Properness extends the generic point over the normalization of D, whose points above P may have larger residue fields; it does not give a k(P)-point. For a concrete failure of that implication, D = Spec(R[x,y]/(x²+y²)) is integral with function field C(y) and a real singular point at the origin. The constant projective conic a²+b²+c²=0 has a point over C(y), but no real point at the origin. The local curve occurs as the special fibre of the regular surface x²+y²=t. Resolving the model and its closed-fibre divisor to regular components makes the DVR extension argument valid; local-point hypotheses over all discrete valuations survive the change of model.

**Prior correction.** new

**Independent review.** Confirmed the use of properness across a possibly singular component on HAL p. 19. Checked the explicit real-curve/conic diagnostic and the proposed resolution repair: pull back the reductive group and flag scheme, then use Corollary 4.6 on the new model. This is a proof gap, not a counterexample to the local-global theorem.

## E17. Codimension-zero points in purity

**Confirmed — error; affects a stated result.**

**Locator.** Theorem 7.1, HAL v5 printed p. 23; published Theorem B.1, public publisher HTML at https://link.springer.com/article/10.1007/s00222-026-01403-x, read 23 September 2026, including the displayed restriction map.

**Printed.** Let X be a regular scheme of dimension 2. Let U be an open subcheme of X which contains the subset X^(1) ⊂ X of points x such that the local ring O_X,x is of dimension 1. … then we have the bijection H^1_fppf(X, G) ≅ H^1_fppf(U, G).

**Correction.** Require U to contain every point of codimension at most one. Alternatively, restrict X to be integral, as in the cited CTS79 theorem; these are alternative repairs, not equivalent assumptions.

**Check.** Let X = A²_R ⊔ Spec(R) and U = A²_R. This is a regular scheme of dimension 2, and U contains all codimension-one points. Take G = PGL₂ over X. A trivial torsor and the torsor given by Hamilton’s quaternion algebra on the omitted Spec(R) component restrict to the same torsor over U, although they are different on X. Thus the displayed restriction map need not be injective. Adding the codimension-zero points prevents this omission. The paper applies the theorem to an integral model, so this counterexample does not invalidate that application.

**Prior correction.** new

**Independent review.** Confirmed in the HAL PDF and the published HTML, including its equation image. Verified all hypotheses of the disconnected regular-scheme counterexample. Replaced the extraction’s “equivalently” by “alternatively”: requiring integrality is stronger than merely requiring U to contain the generic points.

## E18. False witness in the author erratum

**Confirmed — error; affects nothing.**

**Locator.** Gille, Errata et compléments, dated 26 May 2026, p. 1, correction to GP published Example 5.1(b); downloaded from https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf on 23 September 2026.

**Printed.** The fraction field of k[x][[t]] is not k(x)((t)); a typical element in the complement is Σ_(n≥1) t^n/x^n.

**Correction.** Replace the proposed complement element by Σ_{n≥1} tⁿ/x^(n!), with the coefficient-valuation proof in E4. Retain the erratum’s correction of the fraction-field equality.

**Check.** The t-adic geometric-series identity Σ_{n≥1}(t/x)^n = t/(x−t) exhibits the proposed witness as a quotient of two elements of k[x][[t]]. The strict inclusion is nevertheless true; E4 proves that factorial pole growth supplies a valid witness.

**Prior correction.** new

**Independent review.** Confirmed directly in the freshly downloaded May 26 erratum. Multiplying the printed series by x−t gives t. Split this out of the original E4 because it is a new mistake in the correction, whereas the underlying field equality is already acknowledged.

## E19. Residue fields in the cited HHKP lemma

**Confirmed — error; affects nothing.**

**Locator.** Harbater–Hartmann–Karemaker–Pop, arXiv 1903.08007v3 (11 June 2020), proof of Lemma 2.4, p. 7, cited for GP Corollary 4.8. The arXiv record labels v3 “published version”; the separately typeset Contemp. Math. 767 (2021), pp. 135–146, was not obtained.

**Printed.** Similarly, since O^h_(X_i,P_i)/m O^h_(X_i,P_i) = O/m for all i, it follows that R/mR = O/m.

**Correction.** Write A_i = O_(X_i,P_i) and m_i for its maximal ideal. Then A_i^h has residue field k(P_i), and the local filtered colimit R = colim A_i^h has residue field colim k(P_i) = O/m. The maximal ideal of R is the union of the images of the m_i A_i^h; there is no need to extend the final ideal m backwards to each A_i^h.

**Check.** Henselization preserves the residue field of each A_i, but that field can change with i. Blow up a k-rational point and choose a closed point on the exceptional P¹_k with residue field a proper finite extension L/k; continue the chain above it. The initial henselization has residue field k, whereas the final O/m contains L. Thus the asserted equality for every i fails. Filtered colimits of these local maps give the required final equality and henselian local ring; the lemma is preserved.

**Prior correction.** new

**Independent review.** Confirmed the residue-field shortcut in the public version designated published by arXiv. Repaired both the residue-field equality and the use of the final maximal ideal at finite stages. Checked the local-colimit argument; no claim is made about unobserved typography in the separate AMS copy.

## E20. Incomplete intersection modules

**Confirmed — gap; affects the proof.**

**Locator.** Proof of Theorem 4.5(1), HAL v5 printed p. 18, referring to Lemma 4.3, p. 17, and the completeness requirement in §3.1, p. 8. Published main-body passage not collated; confirmation is restricted to the named public manuscript(s).

**Printed.** V = F₁ ∩ R̂_p and W = F₂ ∩ R̂_p; the next sentence invokes Lemma 4.3 for these V and W.

**Correction.** Use V = R̂_P and W = R̂_U, exactly as in Lemma 4.3(1), and use Lemma 4.3(2) for density of F₁ in F₀. The intersections need not be complete, so they cannot replace the modules in that lemma.

**Check.** In the case T = k[[t]], write y = x⁻¹. Then F₁ = Frac(k[[y,t]]) and R̂_p = k((y))[[t]]. Each truncation of c = Σ_{n≥1} tⁿ/y^(n!) lies in F₁ ∩ R̂_p; they form a t-adic Cauchy sequence with limit c in R̂_p. But c is not in Frac(k[[y,t]]): the coefficient-recursion argument in E4, now with coefficients in k[[y]], bounds y-pole growth of any such quotient by a linear function of n. Thus V is not complete in the topology required by §3.1. Lemma 4.3 instead proves completeness, saturation and the sum condition for R̂_P and R̂_U. Using those smaller modules repairs the invocation of Theorem 3.13.

**Prior correction.** new

**Independent review.** New finding from this review, confirmed by comparing the two module definitions and the required completeness hypothesis. Reused the independently proved factorial-pole obstruction to give an explicit Cauchy sequence without a limit in the intersection. The correction is supplied by the preceding lemma itself.

## E21. Norm calculation already fixed in HAL

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Lemma 3.2(2), arXiv 2301.07572v3, p. 5; compared with HAL v5 printed pp. 8–9.

**Printed.** For v = t^m v′, arXiv v3 factors the infimum with α^m and later writes |v| = 0.

**Correction.** For v′ ∈ V ∖ tV, saturation gives |v′| = 1, and |t^m v′| = α^(−m). Thus replace α^m by α^(−m) and |v| = 0 by |v′| = 1. HAL rewrites the calculation correctly as v = u/t^n with |u| = 1 and |v| = α^n.

**Check.** The absolute value is defined with |t| = α⁻¹. Taking v = t and v′ = 1 already detects both printed errors. The proof is correct in HAL v5, unlike the surviving unit-ball inequality in E1.

**Prior correction.** HAL hal-03938963v5, 26 December 2025, https://hal.science/hal-03938963v5/document, Lemma 3.2(2) and proof, printed pp. 8–9.

**Independent review.** Confirmed the historical arXiv slips and the complete repair in HAL. This separates the already-corrected portion of the original E1 from its still-new unit-ball mistake; it must not be counted as a new published error.

## Other flagged passages checked

HAL Lemma 2.3, p. 7, justifies triviality of the additive-group torsor by affineness of its base, exactly as needed; the earlier flag about this is not an additional mistake. For the prime-to-residue-characteristic finite torsor in Proposition 5.2, the needed tameness follows using its group structure: after strict henselization the finite étale group is constant of prime-to-p order, so wild inertia has trivial image in its torsor cocycle. Thus the loop-torsor application should use that structure, together with the henselian replacement in E8; no claim that an arbitrary cover of prime-to-p degree is automatically tame is needed. These checks do not add a separate finding against the cited loop paper.
