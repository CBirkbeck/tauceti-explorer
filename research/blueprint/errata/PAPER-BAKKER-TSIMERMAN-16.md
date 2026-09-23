# Reviewed errata: Bakker–Tsimerman (2016)

Original errata: Claude Code `cc-fb70e5`, 22 September 2026. Independent review: Codex `codex-c83e7a`, 23 September 2026, job REV-ERRATA-PAPER-BAKKER-TSIMERMAN-16. Sources: [published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), [author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), [arXiv versions](https://arxiv.org/abs/1403.7168).

**Outcome:** E1–E10 confirmed, with corrections below; E11 rejected because the printed little-o inference is valid. Added E12–E13 as proof gaps in the injectivity-radius argument. The authors’ erratum corrects E1–E3. No additional correction was located for the remaining confirmed entries in the bounded search documented in the review report.

**Limits:** The new E12–E13 gaps are recorded with their missing obligations; their full repairs are not established here. This review does not infer that the main theorems are false, and does not certify that all proof dependencies are closed. The author erratum’s statement that the main result is unaffected is attributed to the authors.

## E1 — confirmed

**Classification:** error; affects a stated result.

**Locator:** Proposition 14, pp.725–727, and Remark 16, p.727, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a); also footnote 4, p.712.

**Printed passage:** Proposition 14: close CM points of the same type with the same projection to X(1)×X(1) lie on a low-degree Hecke curve, stated for Heegner and anti-Heegner CM points alike. Remark 16: "Hecke curves do not pass through anti-Heegner CM points. Thus, …" anti-Heegner CM points repel. Footnote 4: the 2-to-1 ambiguity of [BT13] "can be rectified by using the stronger repulsion statement found in Proposition 14."

**Correction or missing step:** Proposition 14 holds for Heegner CM points (CM⁺) only, with Lemma 15 applied with h₀ = 1 (erratum Proposition 2.1). Close anti-Heegner CM points lie on low-degree conjugate Hecke curves instead. The first clause of Remark 16 (Hecke curves contain no anti-Heegner points) is true; its repulsion claim is false.

**Reason:** The real-analytic involution conjugating the second factor preserves distance and swaps Heegner and anti-Heegner CM points; close pairs on a Hecke curve become close anti-Heegner pairs on its conjugate, contradicting the claimed repulsion. The published proof chooses a fixed integral h₀ representing the other normalizer coset and then conjugates small matrices by it. An arbitrary lift modulo p does not preserve those height bounds. In the nontrivial normalizer action, a fixed integral normalizer would induce complex conjugation on the real elliptic torus and have negative determinant, so the SL₂ lift used uniformly by that argument is unjustified. The author erratum restricts the proposition to Heegner points (h₀=1) and replaces the anti-Heegner argument. Its shorthand about nonexistence of a lift should not be read as denying the surjectivity SL₂(Z)→SL₂(F_p).

**Review:** Confirmed against published pp.725–727 and footnote 4 p.712, the full author erratum, and the Heegner-only v1 Proposition 15 p.14. Conjugation of the second factor is an isometry and reverses the CM type, so the same close pairs become anti-Heegner pairs on conjugate Hecke curves. The repair is the restricted Proposition 2.1 of the erratum. Clarified the normalizer explanation: the original proof needs a fixed or suitably small-height lift; arbitrary reduction lifts exist and do not supply the required uniform estimates. This verdict does not certify all other arguments in the paper.

**Existing correction:** Authors' erratum: B. Bakker and J. Tsimerman, Erratum to "p-torsion monodromy representations of elliptic curves over geometric function fields", https://benjamin-bakker.github.io/P.torsion.erratum.pdf, §§1–2 and Proposition 2.1.

## E2 — confirmed

**Classification:** error; affects the proof.

**Locator:** Proof of Proposition 25, p.736, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** The multiplicity bound mult_CM(C) = O(p^{−δ} Deg(C)) is proved by partitioning CM and applying "Proposition 14" to all CM points, anti-Heegner included.

**Correction or missing step:** Keep the statement; for anti-Heegner points use the relative volume estimate near the conjugate diagonal (erratum Proposition 3.1) and the resulting bound of erratum Proposition 4.1.

**Reason:** The step for anti-Heegner points uses the false part of Proposition 14 (E1). The erratum states that Proposition 25 "is still correct, but the proof as written only" covers Heegner points, and supplies §§3–4.1.

**Review:** Confirmed as the known proof failure. Published Proposition 25 p.736 uses Proposition 14 on the whole complement S in CM, including anti-Heegner points. The erratum §4.1 replaces that part by a conjugate-diagonal volume bound. Read its Proposition 3.1 and the proof of 4.1 in full and checked the exponent saving, with the ratio corrected in E4. The statement of Proposition 25 is not thereby disproved.

**Existing correction:** Authors' erratum: B. Bakker and J. Tsimerman, Erratum to "p-torsion monodromy representations of elliptic curves over geometric function fields", https://benjamin-bakker.github.io/P.torsion.erratum.pdf, §3 (Proposition 3.1) and §4.1 (Proposition 4.1).

## E3 — confirmed

**Classification:** gap; affects the proof.

**Locator:** Proof of Proposition 26 (singular bicusps), p.737, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** The last estimate for T=SBC∩⋃_{m<d}T_m, with d=p^δ, is mult_T(C) ≪ p^(−1+3δ) Deg(C), followed by “combining with equation (8), the result follows.”

**Correction or missing step:** The argument needs mult_SBC(C) ≪ p^{−1−δ} Deg(C). Erratum Proposition 4.2 gives mult_S ≪ p^{−1−2δ₂} Deg C and mult_T ≪ p^{−1−2δ₃+3δ₁} Deg C with 3δ₁ < 2δ₃, by a finer analysis of singular bicusps on low-degree Hecke curves.

**Reason:** The proof of Theorem 29 uses p·|(π_i∘ψ)^{−1}(SBC)| = o(Deg C_i) (pp.741–742), which needs the exponent −1−δ; the printed exponent −1+3δ gives only O(p^{3δ} Deg C_i). The erratum: "The statement of [3, Prop. 26] is correct, but the proof is incomplete."

**Review:** Confirmed. The actual last exponent on published p.737 is −1+3δ, not literally −1+δ; corrected the quotation and locator description. Multiplication by p leaves p^(3δ), which gives no decay. Erratum §4.2 instead gives exponents −1−2δ₂ and −1−2δ₃+3δ₁, with 3δ₁<2δ₃. Those give negative exponents after the ramification factor p in Theorem 29 pp.741–742. This is a known proof gap, repaired by that erratum argument conditional on its other inputs.

**Existing correction:** Authors' erratum: B. Bakker and J. Tsimerman, Erratum to "p-torsion monodromy representations of elliptic curves over geometric function fields", https://benjamin-bakker.github.io/P.torsion.erratum.pdf, §1 and §4.2 (Proposition 4.2).

## E4 — confirmed

**Classification:** misprint; affects nothing.

**Locator:** Proof of Proposition 4.1, p.3, in the authors' erratum (B. Bakker and J. Tsimerman, Erratum, 5 pp., https://benjamin-bakker.github.io/P.torsion.erratum.pdf, SHA-256 db8effa1…acc1).

**Printed passage:** "mult_{CM−∩Δ̄}(T*_m C) ≪ … ≪ vol(T*_m C ∩ B(Δ̄, ε)) ≪ (sinh(ρ_{X(p)}/2)/sinh(ε)) vol(T*_m C)"

**Correction or missing step:** The factor is sinh(ε)/sinh(ρ_{X(p)}/2): Proposition 3.1 gives vol(C ∩ B(Δ̄,ε)) ≤ (sinh ε/sinh R) vol(C ∩ B(Δ̄,R)) for 0 < ε < R < ρ/2, and letting R ↑ ρ_{X(p)}/2 gives the small factor.

**Reason:** Proposition 3.1 says (1/sinh r)·vol(C ∩ B(Δ̄,r)) increases with r, so the small ball has at most the proportion sinh ε/sinh R of the large one. The printed reciprocal is a large factor (ρ_{X(p)} ~ 2 log p) and would not give the p^{−1} saving the next line states, (p^{−2δ₂} + d₃p^{−1}) Deg(C).

**Review:** Confirmed from the erratum p.3 page image and its Proposition 3.1 pp.2–3. Monotonicity of V(r)/sinh(r) directly gives V(ε)≤sinh(ε)V(R)/sinh(R). Taking R up to ρ/2 produces the reciprocal of the printed factor. Fixed ε and ρ=2 log p+O(1) give O(p^(−1)), matching the following line. The earlier v1 p.26 already uses the small reciprocal factor; this is not a later correction to the current erratum.

**Existing correction:** new.

## E5 — confirmed

**Classification:** gap; affects the proof.

**Locator:** Proof of Lemma 15, pp.726–727, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** "Since M′² = −1, it follows that M′ is either equal to t̃ or −t̃" … "Thus g = a + b(0 1; −1 0), … and (x,y) lies on T_m where m = det g = a² + b²."

**Correction or missing step:** For the order-three lift actually printed, t₀=[[0,1],[-1,−1]], use t̃²+t̃+I=0. A conjugate M′ in the centralizer algebra is t̃ or −I−t̃ (exclude scalar roots using conjugacy when the polynomial splits modulo p). Lifting the small-coefficient identities still shows M_x,M_y normalize the same elliptic torus, and their positive determinant forces them into its centralizer. In the concluding degree calculation use g=aI+bt₀ and m=a²−ab+b². Equivalently one may replace t₀ by −t₀ and use the trace +1 relation and a²+ab+b², but that change of lift must be explicit.

**Reason:** The displayed square relation and Gaussian norm apply only to the order-four lift. The separate order-three matrix on p.725 has trace −1 and determinant 1. Its Cayley–Hamilton relation and direct determinant expansion yield the correction above. Its centralizer is the Eisenstein quadratic algebra, and the same positive-determinant normalizer argument works. The earlier errata correction implicitly changed to the negative lift without saying so. The source proof needs this branch; no counterexample to the Heegner-only conclusion is asserted.

**Review:** Confirmed, with a corrected repair and reach. The matrix printed on p.725 is t₀=[[0,1],[-1,−1]], with trace −1, so t₀²+t₀+I=0 and det(aI+bt₀)=a²−ab+b². The prior correction used the trace +1 convention without changing the lift. Rewrote it in the actual convention; its conjugate root is −I−t₀. Conjugacy rules out scalar roots in the split finite-field case. The positive-determinant normalizer argument then continues. Changed affects to the proof because the order-three branch was omitted; the missing branch can be supplied.

**Existing correction:** new.

## E6 — confirmed

**Classification:** error; affects a stated result.

**Locator:** §2.5, Hecke operators, p.717, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** T_n is defined (p.716) as the closure of pairs related by a cyclic isogeny of degree n, and then: "The two projection maps α, β : T_n → X(p) both have degree deg(T_n) = σ₁(n) = Σ_{d|n} d".

**Correction or missing step:** For the cyclic correspondence deg(T_n) = ψ(n) = n∏_{ℓ|n}(1 + 1/ℓ); σ₁(n) is the degree of the full correspondence over all subgroups of order n.

**Reason:** For n = 4 there are six cyclic subgroups of order 4 but σ₁(4) = 7 (the extra subgroup is E[2]). The later estimates use only a polynomial bound such as deg(T_m) = O(m²), which both satisfy. Found by the extraction (item 25).

**Review:** Confirmed. Counted cyclic order-four subgroups of (Z/4Z)²: twelve primitive vectors, two generators per subgroup, hence six, whereas σ₁(4)=7. More generally the count of primitive vectors divided by φ(n) gives ψ(n). Read the cyclic definition p.716 and degree assertion p.717, and polynomial-bound uses pp.737 and erratum pp.3–4. Changed affects to a stated result because the exact degree assertion is false for the correspondence actually defined, despite the coarser downstream estimates remaining valid.

**Existing correction:** new.

## E7 — confirmed

**Classification:** misprint; affects nothing.

**Locator:** §2.5, published pp.716–717, the component-group domains in both ϕ_n:C_pn→C_p and ξ_d:C_p→C_p; also arXiv v2 p.7.

**Printed passage:** Both displayed smooth-locus formulas use (x,a)∈G_m×Z/nZ: ϕ_n(x,a)=(x^n,a) and ξ_d(x,a)=(x^d,a).

**Correction or missing step:** For ξ_d use (x,a)∈G_m×Z/pZ. For ϕ_n use (x,a)∈G_m×Z/(pn)Z and interpret the target component as a mod p. In both cases the target is C_p.

**Reason:** By the n-gon definition on p.714, the number of connected components of C_m^sm is m. Thus neither occurrence of Z/nZ in these formulas has the stated source component group. In the second formula the source is C_p; in the first it is C_pn. This also corrects the inherited errata explanation, which incorrectly assigned Z/nZ to C_pn.

**Review:** Confirmed and extended the same entry to the adjacent formula. Published pp.716–717 and v2 p.7 put Z/nZ in both formulas. The definition of an n-gon p.714 gives C_p component group Z/pZ and C_pn component group Z/(pn)Z. Thus the old reason that Z/nZ belongs to C_pn is itself wrong. Corrected both domains, with reduction modulo p in the latter map’s target.

**Existing correction:** new.

## E8 — confirmed

**Classification:** misprint; affects nothing.

**Locator:** §3.1, p.718, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** "If we now allow X to have cusps, we define ρ_X to be the infimum of the lengths of closed geodesics with respect to h_X that are homotopically nontrivial in the smooth compactification X′."

**Correction or missing step:** "… half the infimum of the lengths …", matching the compact case defined just before (half the length of the shortest closed geodesic).

**Reason:** The compact definition two sentences earlier includes the factor ½, and Lemma 5 and Corollary 8 (ρ_{X(p)} ~ 2 log p) use the cusped radius with that factor. Found by the review REV-PAPER-BAKKER-TSIMERMAN-16. This factor correction does not establish the compactification-homotopy condition for the upper-bound witness; see E12, and see E13 for the distinct length-bound issue in Corollary 8.

**Review:** Confirmed as a missing factor of two in the definition on published p.718 and v2 p.8. The compact convention and trace-length computation use half the translation length: 2 arcosh((p²−2)/2)=4 log p+O(1). This fixes the normalization only. Added E12 for the separate compactification-homotopy defect in the proposed upper-bound witness, and E13 for the separate proof problem in Corollary 8; this verdict does not certify those proofs.

**Existing correction:** new.

## E9 — confirmed

**Classification:** misprint; affects nothing.

**Locator:** Proof in §4, p.731, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** "Thus, since the metric h_{Y(p)} on Y(p) is strictly smaller than the metric h_{X(p)}, by the above and Proposition 7 we have d_{X(p)}(…) ≤ … ≤ O(δρ_{X(p)}) + d_{Y(p)}(…)"

**Correction or missing step:** "since the metric h_{X(p)} on Y(p) is smaller than h_{Y(p)}", i.e. h_{X(p)}|_{Y(p)} ≤ h_{Y(p)} (Proposition 7), which is what the displayed inequality d_X ≤ d_Y uses.

**Reason:** Proposition 7 (p.720) gives h_{X(p)}|_{Y(p)} ≤ h_{Y(p)}; the sentence states the reverse, while the displayed chain uses the correct direction. Found by the extraction.

**Review:** Confirmed. Published Proposition 7 p.720 gives h_X restricted to Y ≤ h_Y by the holomorphic inclusion and the Kobayashi contraction property. The prose on p.731 reverses the comparison, while its displayed distance estimate uses the correct direction. The intended correction is local.

**Existing correction:** new.

## E10 — confirmed

**Classification:** misprint; affects nothing.

**Locator:** Proof of Proposition 23, p.735, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** "dd^c(f∘χ) = −(1/2π) dd^c log(|1 − z w̄|² − |z − w|²) + dd^c log|z − w|² = −(1/2π) dd^c log[(1 − |z|²)(1 − |w|²)] + [Δ_D] = (1/4π) ω_{D×D} + [Δ_D]."

**Correction or missing step:** The coefficient in the first two lines is −1: f∘χ = log|z − w|² − log(|1 − z w̄|² − |z − w|²), so dd^c(f∘χ) = −dd^c log[(1 − |z|²)(1 − |w|²)] + [Δ_D] = (1/4π) ω_{D×D} + [Δ_D].

**Reason:** With f(s) = log(s/(1 − s)) and χ = |z − w|²/|1 − z w̄|², f∘χ is the stated difference of logarithms with coefficient 1; the final line is consistent with the paper's d^c normalization only with coefficient −1 in front of the first term. Found by the review REV-PAPER-BAKKER-TSIMERMAN-16 (item 117).

**Review:** Confirmed. Read the d^c convention on published p.713, χ on p.732 and the page image of the display p.735, and compared v2 p.24. Algebraically f(χ)=log|z−w|²−log((1−|z|²)(1−|w|²)); applying dd^c leaves coefficient −1, not −1/(2π). With d^c=(bar∂−∂)/(4π), the smooth term is ω/(4π), and Poincaré–Lelong gives the diagonal term as printed. The final line and subsequent argument use the intended normalization.

**Existing correction:** new.

## E11 — rejected

**Classification:** misprint; affects nothing.

**Locator:** Proof of Theorem 29, p.742, in the published version, Annals of Mathematics 184 (2016), 709–744 (publisher PDF, SHA-256 814976ee…f40a).

**Printed passage:** "Thus, Ram(α) = o(Deg C), and Riemann–Hurwitz applied to α yields 2g(C) − 2 = o(Deg C)."

**Correction or missing step:** No correction is required. The Riemann–Hurwitz inequality plus g(C)≥2 in this setting gives the asserted little-o equality by squeezing. The previously proposed inequality may be used as an expanded intermediate line.

**Reason:** Rejected. The equality is justified in this setting, so the entry’s earlier claim that the dropped term need not be little-o was inapplicable. Let D=Deg C. Riemann–Hurwitz gives 2g(C)−2≤Ram(α)=o(D). A nonconstant projection C→X(p) exists, and X(p) is hyperbolic for p>5; hence g(C)≥2 and 0≤2g(C)−2. The squeeze gives 2g(C)−2=o(D), exactly the printed assertion. Alternatively use −2≤2g−2 and D→∞. Both published p.742 and v2 p.30 therefore contain a legitimate compressed inference, not a misprint. The inequality is a useful expanded proof line but is not a required correction.

**Review:** Rejected. The equality is justified in this setting, so the entry’s earlier claim that the dropped term need not be little-o was inapplicable. Let D=Deg C. Riemann–Hurwitz gives 2g(C)−2≤Ram(α)=o(D). A nonconstant projection C→X(p) exists, and X(p) is hyperbolic for p>5; hence g(C)≥2 and 0≤2g(C)−2. The squeeze gives 2g(C)−2=o(D), exactly the printed assertion. Alternatively use −2≤2g−2 and D→∞. Both published p.742 and v2 p.30 therefore contain a legitimate compressed inference, not a misprint. The inequality is a useful expanded proof line but is not a required correction.

**Existing correction:** Not an error: rejected by independent review REV-ERRATA-PAPER-BAKKER-TSIMERMAN-16..

## E12 — confirmed

**Classification:** gap; affects the proof.

**Locator:** Published Lemma 5 proof, p.718, its upper-bound matrix witness; arXiv v2 Lemma 5 p.9, with the compactification condition on p.8.

**Printed passage:** The trace bound is attained by γ=[[1−p²,p],[-p,1]], and “The result then follows.”

**Correction or missing step:** The upper bound for the radius defined using loops nontrivial in the compactification requires a short element of Γ(p) whose image in π₁(X(p)) is nontrivial. The displayed element cannot supply it. Keep the trace lower bound, but supply a different upper-bound witness or a separate geometric argument compatible with that homotopy condition. This review has not supplied that missing argument.

**Reason:** The displayed γ factors exactly as [[1,p],[0,1]]·[[1,0],[-p,1]]. Both factors are peripheral unipotents in Γ(p), killed when cusps are filled: the first is a p-th power of the standard cusp generator and the second a conjugate of its inverse. Therefore their product also maps to the identity in the compactified fundamental group. Although γ is hyperbolic with |tr γ|=p²−2, its geodesic is excluded by the definition immediately above Lemma 5. The published proof itself identifies the kernel with the group generated by these unipotents. Thus the exhibited matrix proves an upper bound for the ordinary nonperipheral systole, not the compactification-nontrivial systole being used. The defect remains after inserting E8’s factor one-half. No counterexample to the eventual asymptotic theorem is asserted; the missing upper-bound argument remains open in this review.

**Review:** Added by this independent review. The displayed γ factors exactly as [[1,p],[0,1]]·[[1,0],[-p,1]]. Both factors are peripheral unipotents in Γ(p), killed when cusps are filled: the first is a p-th power of the standard cusp generator and the second a conjugate of its inverse. Therefore their product also maps to the identity in the compactified fundamental group. Although γ is hyperbolic with |tr γ|=p²−2, its geodesic is excluded by the definition immediately above Lemma 5. The published proof itself identifies the kernel with the group generated by these unipotents. Thus the exhibited matrix proves an upper bound for the ordinary nonperipheral systole, not the compactification-nontrivial systole being used. The defect remains after inserting E8’s factor one-half. No counterexample to the eventual asymptotic theorem is asserted; the missing upper-bound argument remains open in this review.

**Existing correction:** new.

## E13 — confirmed

**Classification:** gap; affects the proof.

**Locator:** Published proof of Corollary 8, p.720; arXiv v2 pp.10–11.

**Printed passage:** “γ can be within (log p)/2 of at most one cusp, as ℓ_X(p)(γ) ≤ 2 log p + O(1).”

**Correction or missing step:** Distinguish the closed-geodesic length ℓ(γ)=2ρ_X(p) from the injectivity radius. Even granting the intended upper bound ρ_X(p)≤2 log p+O(1), the available length bound is 4 log p+O(1). Rework the cusp-avoidance argument to control all cusp neighborhoods visited, with a total O(1) length-comparison error; replacing 2 by 4 alone does not justify the asserted one-cusp claim. This review does not claim to close that geometric step.

**Reason:** The compact definition p.718 sets ρ to half the shortest closed-geodesic length, and the last line of this same proof explicitly uses ℓ(γ)=2ρ_X(p). Its preliminary upper-bound argument therefore provides only ℓ(γ)≤4 log p+O(1), not the quoted estimate. The proof then uses the stronger estimate to reduce its detour and integration to one cusp. Lemma 6’s separation >2 log p−O(1), together with the corrected length bound, does not imply this one-cusp assertion. A bounded-number-of-cusps replacement may repair the strategy but needs a proof controlling visits and detours. The claim confirmed here is the missing justification in this step, not a counterexample to Corollary 8. It is separate from the inadmissible witness in E12.

**Review:** Added by this independent review. The compact definition p.718 sets ρ to half the shortest closed-geodesic length, and the last line of this same proof explicitly uses ℓ(γ)=2ρ_X(p). Its preliminary upper-bound argument therefore provides only ℓ(γ)≤4 log p+O(1), not the quoted estimate. The proof then uses the stronger estimate to reduce its detour and integration to one cusp. Lemma 6’s separation >2 log p−O(1), together with the corrected length bound, does not imply this one-cusp assertion. A bounded-number-of-cusps replacement may repair the strategy but needs a proof controlling visits and detours. The claim confirmed here is the missing justification in this step, not a counterexample to Corollary 8. It is separate from the inadmissible witness in E12.

**Existing correction:** new.
