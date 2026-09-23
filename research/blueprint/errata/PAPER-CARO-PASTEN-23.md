# Mistakes in Caro–Pasten, *A Chabauty–Coleman bound for surfaces*

Original job ERRATA-PAPER-CARO-PASTEN-23: Claude Code, `cc-fb70e5`, 22 September 2026.
Independent review REV-ERRATA-PAPER-CARO-PASTEN-23: Codex, `codex-7e92bd`, 23 September 2026.
Findings and verdicts: [PAPER-CARO-PASTEN-23.json](PAPER-CARO-PASTEN-23.json).

## Version and correction status

All fifteen findings below are confirmed in [arXiv 2102.01055v2](https://arxiv.org/pdf/2102.01055v2), dated 10 February 2021, 39 pages. The [published article](https://link.springer.com/article/10.1007/s00222-023-01217-1), Inventiones mathematicae 234 (2023), 1197–1250, has 54 pages and was revised substantially. Its main body remains inaccessible through the public endpoints tried. **These are preprint findings; they are not claims that the typeset article repeats them.** Exact PDF hashes and bounded correction searches are in the JSON.

The published acknowledgements explicitly credit a referee with finding a mistake in an earlier Lemma 3.15. This makes E1 an acknowledged earlier-version problem. [Balakrishnan–Caro v2](https://arxiv.org/pdf/2501.03483v2), Theorem 2.1, p. 3, also cites the published Corollary 1.15 with p+4√p+5 instead of the preprint's p+4√p+3. Neither source exposes the full final repair, so that repair has not been certified here. A separate counterexample to the surface theorem is not claimed.

The original E1–E13 identifiers are preserved. E2 now also records the incorrect differential-module presentation in the same remark. E14 supplies the omitted m=0 proof case; E15 records adjacent zeta notation slips. E5 is a proof gap, not a demonstrated false geometric lemma. E13 affects the stated corollary, despite leaving its nonhyperelliptic application intact. No Lean compilation or formalisation is claimed.

## E1. Geometric branches over rational points

**Confirmed — error; affects a stated result.**

**Locator.** Lemma 3.15, pp.10–11, and its use in the proof of Theorem 9.1, (9.8), p.35, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Lemma 3.15. With the previous notation, we have Σ_{x∈D(k)} Σ_{j=1}^{r} #{y ∈ C̃_j(k^alg) : ν_j(y) = x} ≤ (q + 1)r + 2q^{1/2} · Σ_{j=1}^{r} g_g(C_j)."

**Correction.** The branch-count lemma is false as stated in v2. For a geometrically integral curve of normalization genus g, add 2(p_a−g): Σ_{x∈C(k)} #ν⁻¹(x) ≤ q+1+2g√q+2(p_a−g). More generally a safe bound for the reduced curve D is r(q+1)+2√q Σ_j g(C_j)+2δ(D), where δ(D) is the total geometric normalization defect, including intersections of conjugate components. The weighted application in (9.8) needs corresponding singularity/intersection accounting. This diagnoses a missing argument for the v2 constant, not a counterexample to the surface theorem itself.

**Reason.** Counterexample. Let D ⊂ P² over k = F_3 be the projective closure of y² = x²(x − 1). It is geometrically integral (r = 1) with normalization P¹, parametrized by x = t² + 1, y = t(t² + 1), so g_g = 0 and the right side is q + 1 = 4. D(F_3) consists of (0,0), (1,0), (2,1), (2,2) and the point at infinity. The origin is an ordinary node with tangent cone y² + x² = 0. Since −1 is not a square in F_3, its two branches t = ±i are defined only over F_9. The left side is therefore 2 + 4 = 6 > 4. The proof's flaw: Lemma 3.17 correctly relates the product of Z*_{D,k}(ζT) over ζ ∈ μ_d to the zeta functions of the C̃_j over k′. But the zeros and poles of Z*_{D,k} cannot be read off from that product. Here Z*_{D,k}(T) = (1 + T)/((1 − T)²(1 − qT)), and the extra factor (1 + T)/(1 − T) disappears under T ↦ −T. The bound with q + 1 + 2g q^{1/2} + 2(p_a − g) follows from Weil's bound for C̃ together with b_x ≤ δ_x + 1 ≤ 2δ_x at singular points, and it is attained in the example. The general reducible, weighted sum in (9.8) needs the analogous count, including intersections of Frobenius-conjugate components. Noted by the extraction (gap G1, items bad-branch-bound and global-sum-source), which checked the page image.

**Prior correction.** The published acknowledgements at https://link.springer.com/article/10.1007/s00222-023-01217-1 explicitly acknowledge a referee finding an error in an earlier Lemma 3.15. Balakrishnan–Caro, https://arxiv.org/pdf/2501.03483v2, Theorem 2.1, p. 3, cite the published Corollary 1.15 with p+4√p+5 rather than v2’s p+4√p+3. Thus this is an acknowledged earlier-version problem; the precise final lemma/proof and whether it fixes this exact counterexample were not collated.

**Independent check.** Confirmed the v2 lemma is false: enumerated the five projective F₃-points, checked the single nonsplit node, and counted six geometric branches against the bound four. Checked the normalization parametrization and the cancelling zeta factor. Strengthened known-status evidence using the published acknowledgements; did not infer an unobserved final repair. The surface constant’s v2 proof is affected, but the example is not a surface counterexample.

## E2. Sharp jet and differential module

**Confirmed — misprint; affects nothing.**

**Locator.** Remark 4.7, p.13, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Let m = 2 and let φ : V^k_2 → A²_k be the map induced by the k-algebra morphism k[s_1, s_2] → E^k_2 = k[z]/(z³), s_1 ↦ z mod z³, s_2 ↦ 0. The map φ is a closed immersion supported at x which is ω_i-integral for i = 1, 2" (with ω_1 = ds_1 + s_1²ds_2, ω_2 = ds_1 + s_2²ds_2). The same remark also prints Ω¹_(E₂/k) = (k[z]/(z,3z²))dz = (k[z]/(z²))dz.

**Correction.** Exchange the coordinates: s₁ ↦ 0 and s₂ ↦ z mod z³. Also correct the differential-module presentation to Ω¹_(E₂/k) = (k[z]/(z³,3z²))dz = (k[z]/(z²))dz, under the stated characteristic restriction char(k) ≠ 2,3. The two pullbacks are 0 and z²dz = 0, and the bound m ≤ 2 is attained.

**Reason.** The printed jet pulls both forms back to dz ≠ 0. The exchanged jet is still a closed immersion and gives the two zero pullbacks in the correct module. On each of the two branches s₁ = ±s₂, the restriction of either form has a nonzero constant coefficient at the origin, so each contributes one to (4.4). The extra printed relation z = 0 in the differential module is also wrong: the relation comes from z³ = 0 and d(z³) = 3z²dz. Both slips were checked in the page image.

**Prior correction.** new

**Independent check.** Confirmed the nonintegral printed jet and the sharpness of the exchanged jet. Added the adjacent missed misprint z in place of z³ in the differential-module presentation; the displayed quotient otherwise contradicts its own last equality. The characteristic exclusions in Remark 4.7 are retained.

## E3. Dimension of an intersection

**Confirmed — misprint; affects nothing.**

**Locator.** §5, conventions on intersections of cycles, p.16, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "If Z_1 and Z_2 are algebraic cycles of dimensions r_1 and r_2, the intersection Z_1.Z_2 is an algebraic cycle of dimension 2n − r_1 − r_2 defined up to algebraic equivalence."

**Correction.** Of dimension r_1 + r_2 − n.

**Reason.** On an n-dimensional abelian variety, cycles of dimensions r_1 and r_2 have codimensions n − r_1 and n − r_2. Their intersection has codimension 2n − r_1 − r_2, that is, dimension r_1 + r_2 − n. The later computations, for example deg(H^{n−2}.3H.X) on p.20, use the correct count. Noted by the extraction.

**Prior correction.** new

**Independent check.** Confirmed at §5, p. 16. Adding codimensions gives 2n−r₁−r₂ as the codimension, hence r₁+r₂−n as the dimension. For two divisors on a surface the result is a zero-cycle, detecting the printed dimension immediately.

## E4. Trace sign

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Lemma 5.4, p.17, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "… where the last equality uses tr(α) = −2(γ_1 + ... + γ_n) and (5.1)."

**Correction.** tr(α) = 2(γ_1 + … + γ_n).

**Reason.** P_α(t) = Q(t)² with Q monic of degree n and roots γ_i, so the coefficient of t^{2n−1} in P_α is −2Σγ_i. The paper defines tr(ψ) as the negative of that coefficient (§5.1), so tr α = 2Σγ_i. Combined with (5.1), tr α_A(C,H) = 2 deg(C.H), this gives Σγ_i = deg(C.H), which is what the arithmetic–geometric mean step uses. With the printed sign, the positive γ_i would have negative sum. Noted by the extraction (gap G3).

**Prior correction.** new

**Independent check.** Confirmed from the paper’s definitions: the coefficient of t^(2n−1) in ∏(t−γ_i)² is −2Σγ_i; trace is the negative of that coefficient. Equation (5.1) then gives the positive sum required by the arithmetic–geometric mean calculation.

## E5. Semi-injectivity threshold

**Confirmed — gap; affects the proof.**

**Locator.** Proof of Lemma 5.5(i), p.18, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "If (i) holds we consider the ample divisor H = X and note that Lemma 5.3 gives deg_H(X) = deg(X³)_A = cdeg(X) = c_1²(X). Thus, condition (5.4) in case (i) simplifies to p > 2c_1²(X)/3, which is implied by (5.3)." (Here (5.3) is p > c_1²(X).)

**Correction.** A sufficient repair of Lemma 5.5(i) is to strengthen its hypothesis to p > max{s,2s²/9}, where s = c₁²(X). Substitution of n=3, H=X in (5.4) gives (3!/3³)s³/s = 2s²/9, not 2s/3. The original hypothesis may still suffice by another argument; no counterexample to the lemma is claimed. The main Theorem 9.1(i) assumes p > (128/9)s², which implies the repaired condition and preserves its invocation in Lemma 9.10.

**Reason.** The substitution gives 2s²/9 with s = c_1²(X), not 2s/3. For s ≥ 5, (5.3) does not imply it; for example s = 6 and p = 7 satisfy p > s but not p > 2s²/9 = 8. So the proof of case (a) under (i), which applies Lemma 5.4, is not justified by (5.3) alone. The lemma may still hold at the printed threshold, but the argument does not show it. The main theorems assume the stronger bound. Checked on the page image. Noted by the extraction (gap G3, item semiinjective-source).

**Prior correction.** new

**Independent check.** Confirmed the arithmetic error and the missing implication in case (a). Checked s=6, p=7 as a counterexample to the numerical implication, not to the geometric lemma. Changed kind to gap and described the stronger bound as a sufficient repair; case (b) still uses p>s. Checked the actual later invocation in Lemma 9.10 and its stronger main-theorem hypotheses.

## E6. Zero endpoint for λ

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Lemma 6.2, p.23, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Let λ = (log M)/log(r^{−1}) and note that 0 < λ < 1."

**Correction.** 0 ≤ λ < 1.

**Reason.** The lemma allows M ≥ 1, and M = 1 gives λ = 0. The argument works unchanged for λ = 0. Noted by the extraction (item multizero).

**Prior correction.** new

**Independent check.** Confirmed the allowed endpoint M=1, yielding λ=0. Since 0<r<1, the remaining inequalities in the proof remain valid at that endpoint; only the strict lower bound needs changing.

## E7. Finite-difference logarithm and exponential

**Confirmed — error; affects the proof.**

**Locator.** §7.1–7.2, the series Ψ^{[m]}, Lemma 7.4 and the definitions of Log^t and Exp^t, pp.23–24, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Given an integer m, let Ψ^{[m]} = (Ψ^{[m]}_1, ..., Ψ^{[m]}_n) be the power series expansion of the morphism [m] : A → A of multiplication by m in terms of t." "From [11] III.5.3 Proposition 2(i) we get Lemma 7.4. The terms of degree less than m in Ψ^{[m]}_j vanish for each j = 1, ..., n." "Log^t_j(y) = Σ_{m≥1} ((−1)^m/m) · Ψ^{[m]}_j(y), Exp^t_j(x) = Σ_{m≥1} (1/m!) · ψ^{[m]}_j(x)", with ψ^{[m]}_j the homogeneous part of degree m of Ψ^{[m]}_j.

**Correction.** Replace the multiplication-map series by the coefficientwise finite differences Δ_m(t) = Σ_{i=0}^m (−1)^(m−i) binom(m,i)[i](t), for m≥1. Use Log(t) = Σ_{m≥1}(−1)^(m−1)Δ_m(t)/m and Exp(t) = Σ_{m≥1}[Δ_m(t)]_m/m!, where [ ]_m means homogeneous degree m. These formulas have identity linear term, are mutual inverses, and satisfy the claimed denominator bounds. This repair is verified here by formal polynomial interpolation; no claim is made to have directly read Bourbaki III.5.3–5.4.

**Reason.** For the printed definition, [m](t) has linear term mt in every characteristic-zero formal group. Thus Lemma 7.4 fails and the proposed logarithm’s linear terms are (−1)^m t, which do not tend to zero. To verify the repair at all orders, let L and E be the normalized formal logarithm and exponential over K. The degree-d part of [z](t)=E(zL(t)) is polynomial in z of degree at most d. Newton interpolation at z=0 gives [z]=Σ_m binom(z,m)Δ_m coefficientwise. Differentiating at zero gives L=Σ_m(−1)^(m−1)Δ_m/m. The leading z^m coefficient in degree m is E_m(t), so [Δ_m]_m=m!E_m and Δ_m has no terms of degree below m. Since Δ_m is an integral linear combination of integral [i], these identities prove the bounds of Lemmas 7.5–7.6. Exact computation through degree four with L(t)=t+at²+bt³+ct⁴ verifies both identities; the printed exponential’s cubic coefficient is 6a²−4b, whereas E has 2a²−b. The all-order interpolation argument, not that finite check alone, establishes the repair.

**Prior correction.** new

**Independent check.** Confirmed the linear-term contradiction directly and independently proved the finite-difference repair by Newton interpolation in the multiplication parameter. Symbolic degree-four computations agree. Removed the unsupported assertion that Bourbaki was directly collated. Checked the coefficient estimates and Lemma 7.7’s use of the formal inverse identities; the repair supplies those identities and estimates.

## E8. Top self-intersection degree

**Confirmed — misprint; affects nothing.**

**Locator.** Lemma 9.3, p.30, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "If assumption (ii) in Theorem 9.1 holds, then there is an ample divisor H′ on A′ such that deg_{H′}(X′) = deg_H(X), cdeg_{H′}(X′) = cdeg_H(X), and deg((H′)³)_{A′} = deg(H³)_A."

**Correction.** deg((H′)^n)_{A′} = deg(H^n)_A.

**Reason.** A has dimension n ≥ 3 in Theorem 9.1(ii), whose threshold involves deg(H^n). The top self-intersection is H^n; H³ is the n = 3 case. Noted by the extraction (gap G5, item good-geometry).

**Prior correction.** new

**Independent check.** Confirmed the ambient dimension is arbitrary n in Theorem 9.1(ii), whose denominator is deg(H^n). Specialization preserves that top self-intersection; the displayed cubes only have the intended degree interpretation when n=3.

## E9. Saturated kernel lattice

**Confirmed — gap; affects the proof.**

**Locator.** Proof of Lemma 9.7, p.31, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Thus, we can take v_1, v_2 ∈ ker(f) ∩ R^n which are K-linearly independent. After scaling, we can assume that v_1, v_2 ∈ R^n are primitive. If there are b_1, b_2 ∈ R^× with b_1v_1 + b_2v_2 ∈ pR^n ⊆ R^n then there are c_1, c_2 ∈ R such that b_1v_1 + b_2v_2 = ϖc_1v_1 + ϖc_2v_2 which is not possible since v_1, v_2 are K-linearly independent. Hence the images of v_1, v_2 in k^n are k-linearly independent."

**Correction.** Let L = ker(f) ∩ R^n and take v₁,v₂ from an R-basis of L. The quotient R^n/L identifies with the image of f and is torsion-free, so L is saturated and a direct summand over the DVR. Its rank is n−1 when f≠0 (as in the hyperplane application), and n when f=0; either way it is at least two. A basis extends to R^n and therefore reduces to linearly independent vectors.

**Reason.** The step from b_1v_1 + b_2v_2 ∈ ϖR^n to b_1v_1 + b_2v_2 ∈ ϖ(Rv_1 + Rv_2) assumes that Rv_1 + Rv_2 is saturated in R^n. For v_1 = e_1 and v_2 = e_1 + ϖe_2 in R³, both are primitive and K-independent, but v_2 − v_1 = ϖe_2 and their reductions coincide. The lemma itself holds by the corrected choice, so nothing later changes. Checked on the page image. Noted by the extraction (gap G5, item primitive-proof-source).

**Prior correction.** new

**Independent check.** Confirmed the saturation gap using v₁=e₁, v₂=e₁+ϖe₂, both in the kernel of the third-coordinate functional: independent over K, primitive over R, dependent modulo ϖ. Proved the repair from the torsion-free quotient; included the harmless zero-functional case instead of asserting rank n−1 for every linear map.

## E10. Intersection with the residue disk

**Confirmed — misprint; affects nothing.**

**Locator.** §9.4, before Proposition 9.14's proof, p.33, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "… let u ∈ K^n with |u| = 1 be such that γ = (t, u) be a 1-parameter subgroup of A with Γ ∪ U_e ⊆ im(γ)."

**Correction.** Γ ∩ U_e ⊆ im(γ).

**Reason.** Lemma 9.6, just before, provides exactly Γ ∩ U_e ⊆ im(γ). The union is not contained in im(γ), since U_e is open in A(K). Noted by the extraction.

**Prior correction.** new

**Independent check.** Confirmed the union in §9.4 disagrees with the intersection in Lemma 9.6, p. 31. A one-dimensional analytic subgroup cannot contain the open n-dimensional residue disk for n≥3. The rest of the proof uses exactly the intersection containment.

## E11. Translation of the local bound

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Lemma 9.15, p.33, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "… then we can in particular apply it to Y obtaining #Γ ∩ X(K) ∩ U_{x_0} = #Γ ∩ Y(K) ∩ U_e ≤ m_{Y′,ω′_1,ω′_2}(e) = m_{X′,ω′_1,ω′_2}(x_0)."

**Correction.** … ≤ 1 + m_{Y′,ω′_1,ω′_2}(e) · (1 − e/(p−1))^{−1} = 1 + m_{X′,ω′_1,ω′_2}(x_0) · (1 − e/(p−1))^{−1}.

**Reason.** Proposition 9.14, which the lemma reduces, bounds the count by 1 + m(x)(1 − e/(p−1))^{−1}. The displayed conclusion drops the leading 1 and the factor, but the translation argument preserves both. Noted by the extraction (item translation-reduction).

**Prior correction.** new

**Independent check.** Confirmed by comparing the displayed inequality with Proposition 9.14 on the same page. Translation preserves m and the ramification parameters, so both the leading 1 and the multiplicative factor must remain. The printed m=0 bound would even exclude the chosen point ξ₀.

## E12. Summing upper bounds

**Confirmed — misprint; affects nothing.**

**Locator.** Proof of Theorem 9.1, (9.5), p.35, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "(9.5) #Γ ∩ X(K) = Σ_{x∈X′(k)} #Γ ∩ X(K) ∩ U_x = #X′(k) + (1 − e/(p−1))^{−1} Σ_{x∈X′(k)} m(x) = #X′(k) + (1 − e/(p−1))^{−1} Σ_{x∈Z(k)} m(x)."

**Correction.** The second relation is ≤: #Γ ∩ X(K) ≤ #X′(k) + (1 − e/(p−1))^{−1} Σ_{x∈Z(k)} m(x).

**Reason.** Proposition 9.14 and Lemma 9.11 give upper bounds for each residue disk, not equalities. The last step uses m(x) = 0 off Z. Noted by the extraction (item global-conditional).

**Prior correction.** new

**Independent check.** Confirmed that only the residue-disk partition is an equality: summing Proposition 9.14 gives ≤. The final removal of terms outside Z is an equality because Lemma 9.11 gives m(x)=0 there.

## E13. Canonical ampleness of a symmetric square

**Confirmed — error; affects a stated result.**

**Locator.** Corollary 10.5, p.37, in arXiv 2102.01055v2 (10 February 2021, the latest arXiv version, 39 pp.; PDF SHA-256 d7398c4b…67f7); the published article, Invent. Math. 234 (2023), 1197–1250 (54 pp., substantially revised), was not accessible and was not collated, so this finding concerns v2

**Printed.** "Corollary 10.5. For every curve C of genus g ≥ 3 we have that C^{(2)} has ample canonical divisor. In particular, C^{(2)} is a surface of general type. Proof. Since θ is ample and all the V_ξ are effective, we get the result from Lemma 10.4."

**Correction.** Under §10.3’s assumptions (smooth projective curve, algebraically closed k, char(k)≠2), C^(2) is of general type for every g≥3. Its canonical divisor is ample for g≥4, and for g=3 when C is nonhyperelliptic. For hyperelliptic g=3 it is nef and big but not ample. In the nonhyperelliptic application in Corollary 1.15 the needed conclusion remains valid.

**Reason.** For a hyperelliptic genus-three curve, the Abel map contracts the pencil E={x+ιx}≅P¹. Hence θ·E=0 and K≡θ has zero intersection with E, contradicting ampleness. To justify the corrected positive statements, π:C×C→C^(2) is finite and π*V is the sum of the two point-fibre divisors, an ample divisor on C×C; thus V is ample. The pullback θ=j*Θ is nef and big because j is generically finite onto its image, and is ample when j is a closed immersion (the nonhyperelliptic case). Now K≡θ+(g−3)V gives all the stated cases. Mere effectivity of V would not justify the original ampleness inference.

**Prior correction.** new

**Independent check.** Confirmed the hyperelliptic genus-three counterexample and the scope of §10.3. Changed affects from nothing to a stated result: the corollary’s literal ampleness claim fails even though its later use survives. Strengthened the repair using the finite pullback proof that V is ample; this also proves ampleness for all curves of genus at least four.

## E14. The order-zero jet

**Confirmed — gap; affects the proof.**

**Locator.** arXiv 2102.01055v2, proof of Lemma 4.8, p. 14; m≥0 is allowed in Theorem 4.4, p. 13. Published counterpart not collated.

**Printed.** After choosing s₁ with φ#(s₁)=z mod z^(m+1), the proof asserts s₁ ∈ m_(S,x) ∖ m_(S,x)² because φ# is local.

**Correction.** Treat m=0 separately by taking any regular system of parameters s₁,s₂; then ker(φ#)=m_(S,x)=(s₁,s₂). For m≥1 the printed construction works: z is nonzero in (z)/(z²), so a preimage cannot lie in m_(S,x)².

**Reason.** When m=0 the target is k[z]/(z)=k and the prescribed image z is zero. The chosen preimage could be s₁=0, or any element of m², so locality alone does not force it to be a parameter. The existence assertion remains true; only this boundary case is missing from the proof. Theorem 4.4’s m=0 inequality is also immediate.

**Prior correction.** new

**Independent check.** Located and confirmed the boundary case flagged but not relocated by the original errata worker. The proof uses z∉(z²), which is true for m≥1 and false for m=0. The separate regular-parameter choice repairs the lemma without changing its statement.

## E15. Zeta exponents and reciprocal moduli

**Confirmed — misprint; affects nothing.**

**Locator.** arXiv 2102.01055v2, proof of Lemma 3.17 and opening sentence of the proof of Lemma 3.15, p. 11. Published counterparts not collated.

**Printed.** The nonzero case in S_n is printed with T^m, before n=md is introduced. The next proof calls the relevant poles of Z*_(D,k)(T) modulus q and zeros modulus q^(1/2).

**Correction.** In the S_n case distinction keep T^n, which becomes T^(md) after n=md. For the zeta variable T, Weil poles have modulus q⁻¹ (and 1), and zeros have modulus q^(−1/2). The moduli q and q^(1/2) describe reciprocal roots/poles. These notational fixes do not repair the cancellation error in E1.

**Reason.** Summing ζ^n over d-th roots of unity multiplies the coefficient of the existing monomial T^n by d; it never changes the exponent. The following sentence correctly has T^(md). For the moduli, even Z_(P¹)(T)=1/((1−T)(1−qT)) has its nontrivial pole at T=1/q, not at q. The earlier proof’s inference about all poles and zeros still fails for the independent reason in E1.

**Prior correction.** new

**Independent check.** New adjacent notation findings from direct reading of p. 11. Checked the root-of-unity sum and P¹ zeta function. Kept these separate from the acknowledged substantive lemma error and explicitly avoided presenting them as a repair of its proof.

## Scope of the mathematical checks

The finite-difference repair in E7 has an all-order proof: apply polynomial Newton interpolation to each homogeneous degree of E(zL(t)). The exact degree-four calculation is a diagnostic for the formula, not a substitute for that proof. The earlier extraction's alternative construction via invariant derivations need not be changed for this errata review.

For E1, normalization and the bound b_x≤δ_x+1≤2δ_x at a singular point justify the added defect term. For a reduced curve over a finite field, its normalization has points only on Frobenius-stable geometric components; applying Weil there and bounding the remaining geometric preimages by twice the total defect gives the stated safe general bound. A sharp weighted surface estimate requires additional accounting. The extraction's proposed weighted replacement proof is outside this errata review; it is not independently certified here.

The original note about a factorial in the exponential is covered by E7: the printed 1/m! is appropriate only after replacing multiplication series by finite differences. It does not require a separate factorial correction. The original note about m=0 is now located precisely in E14.
