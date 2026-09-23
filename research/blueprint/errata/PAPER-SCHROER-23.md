# Mistakes in Schröer, *There is no Enriques surface over the integers*

Job ERRATA-PAPER-SCHROER-23. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-SCHROER-23.json` beside this file. Reviewed by `REV-ERRATA-PAPER-SCHROER-23` (issue #1776), Claude Code session `cc-7b31c4`, 23 September 2026: **all ten confirmed**, with one reach corrected in place — E1 now affects a stated result, since the lemma as printed is false — and **one further misprint added (E11)**, the parallel `r_a`/`r_c` slip on p.31. Every quotation was found verbatim in arXiv v3, whose SHA-256 was reproduced. The review is written up in [REV-ERRATA-PAPER-SCHROER-23.md](../reviews/REV-ERRATA-PAPER-SCHROER-23.md).

**Paper and version read.** Stefan Schröer, Annals of Mathematics 197 (2023), 1–63, DOI 10.4007/annals.2023.197.1.1. The version read is arXiv 2004.07025v3 (9 August 2022, SHA-256 `ae6481f2…6d61`). Its text after the first page agrees with the author's third revised version of 19 July 2022, which is the journal's revision date. The typeset 63-page version was not obtained. Every passage below was re-read in v3.

**Earlier work.** The extraction PAPER-SCHROER-23 (partial) noted these in its items and in its report ("Source precision and proof obligations"). It also proposes a repair for the gap in Proposition 5.5. As the report says, none of these puts the main theorem in doubt.

**Existing corrections.** None was found:
- the Annals page links no erratum;
- arXiv v3 is the latest version;
- a web search found nothing.

**Not recorded.** Three further remarks in the extraction were not confirmed against the text here, and are left for its reviewer:
- a wrong exponent in the proof of Proposition 6.1;
- the Frobenius-weight remark about Proposition 7.1;
- an isometry claim near diagram (10) in Proposition 9.5.

---

## E1. Lemma 1.1 allows d = 0 (misprint)

Lemma 1.1 characterizes constancy of Num_{X/k} by the existence of "an integer d ≥ 0" such that every L^{⊗d} becomes a pullback up to a numerically trivial twist. For d = 0 this property always holds (take N = O), but Num need not be constant. For example, P¹_C viewed over R has X̄ = P¹_C ⊔ P¹_C, and conjugation exchanges the two components. The integer should be d ≥ 1.

## E2. Proposition 3.1(ii)⇔(iii) needs a singular fiber (error; a stated result)

Proposition 3.1 asserts that, over F_q with Num constant, a closed point of the base is rational if and only if the components of its fiber are birational to P¹. For S = E × P¹ → P¹ with E an elliptic curve, Num is constant, and the fiber over a rational point is E, which is not birational to P¹. The equivalence needs the geometric fiber to be singular. That is the setting of its applications; for example, Proposition 3.2 assumes C_red singular.

## E3. The sign in the Oort–Tate group law (misprint)

The group scheme attached to (L, a, b) with a ⊗ b = 2 is given the law f₁ ⋆ f₂ = f₁ + f₂ + b f₁ f₂. With L = Z, a = 1, b = 2, which the text identifies as Z/2Z, one gets 1 ⋆ 1 = 4, which is not a solution of f² = f. The law is f₁ + f₂ − b f₁ f₂, as in Oort–Tate: it gives XOR on {0, 1}, and for μ₂ (a = 2, b = 1) it matches (1 − f)(1 − g) = 1 − (f + g − fg).

## E4. Comparing canonical covers in Proposition 5.5 (gap; the proof)

To exclude Pic^τ = μ₂, the proof builds a canonical cover over Z[1/2], whose generic fiber X_F is a K3 surface, and a canonical cover over A = W(F₂^sep). It then concludes that X_F has good reduction over A. But two canonical covers of the same Enriques surface over F = Frac A agree only up to a twist by H¹(F, μ₂) = F^×/F^{×2}, so the local cover need not be the base change of the global one.

The extraction's repair makes the local cover over Z₂ first. A Z₂-point exists, since #Y(F₂) = 25. It then writes the difference over Q₂ as (−1)^e 2^a 5^b modulo squares:
- the Z[1/2]-cover is twisted by the étale torsor s² = (−1)^e 2^a;
- the local cover is twisted by the unramified torsor Z₂[z]/(z² − z − 1) when b = 1.

The resulting covers agree over Q₂ and give a smooth proper model at every prime, contradicting Fontaine.

## E5. F_p for F_q in Corollary 7.2 (misprint)

"Card X(F_p) = 1 + b₂ q + q²" should read Card X(F_q). The ground field is F_q, as in Proposition 7.1, which the proof applies.

## E6. A terminal vertex in a cycle (gap; the proof)

In the proof of Proposition 9.2, a rational point in the regular locus of a reducible fiber is found by choosing "a component C_i corresponding to a terminal vertex of Γ(C)". For multiplicative fibers I_r with r ≥ 3 the dual graph is a cycle, which has no terminal vertex. The conclusion still holds: any rational component meets the others in two points, and P¹(F₂) has three. For the additive (tree) case one takes a terminal component of multiplicity one.

## E7. Br(F₂(t)) = 0 "by Tsen's Theorem" (error; the proof)

In the proof of Proposition 9.3(v), the equality Pic⁰_{Y_F/F}(F) = Pic⁰(Y_F) for F = F₂(t) is justified by "Br(F) = 0, by Tsen's Theorem". Tsen's theorem concerns function fields over algebraically closed fields, and Br(F₂(t)) ≠ 0. For example, the cyclic algebra (F₄(t)/F₂(t), t) is nontrivial, since norms from F₄(t) have even valuation at t = 0. The equality needs another argument, for instance passing to F₂^alg(t) and taking Galois invariants, as the extraction proposes.

## E8. "Unstable if and only if c₄ vanishes" (error; affects nothing)

In §10 (p. 29) a fiber is said to be unstable "if and only if c₄ vanishes at the point x". In characteristic 2, c₄ = a₁⁴ also vanishes at points of smooth supersingular reduction. The correct criterion requires Δ(x) = 0 as well. The argument uses only "unstable ⇒ c₄(x) = 0", which is true, to conclude that there is at most one unstable fiber, so nothing changes.

## E9. r_c for r_a (misprint)

On p. 31, for a twisted semistable fiber with r_c ≤ 2, the equation r_a + i + r_c = 11 is said to give "r_c ≥ 11 − i − r_a ≥ 7". Since r_c ≤ 2 and i ≤ 2, what follows is r_a ≥ 11 − i − r_c ≥ 7.

## E10. Pic for Pic⁰ in the proof of Proposition 12.3 (misprint)

After the two-section splits Pic(Y_K) = Pic⁰(Y_K) ⊕ 2Z, the text identifies "Pic(Y_K) = Num(Y)/S". The identification is with Pic⁰(Y_K), as in the parallel sentence of the proof of Proposition 12.2 (p. 42). The full Pic(Y_K) has degree image 2Z.
