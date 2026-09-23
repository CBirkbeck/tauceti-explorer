# Independent review: Bakker–Tsimerman errata

Job: REV-ERRATA-PAPER-BAKKER-TSIMERMAN-16. Reviewer: Codex, session `codex-c83e7a`, 23 September 2026.

**Verdict: accept the corrected register.** Confirmed E1–E10, rejected E11, and added E12–E13 as proof gaps. All thirteen entries have individual verdicts: twelve confirmed and one rejected. Three confirmed findings are already addressed by the authors' erratum; nine have no further correction located. The review is complete as an audit of the recorded mistakes. The two new geometric proof obligations are explicitly unresolved; this is not a certification that the paper's proof has been closed.

## Independence and source scope

The extraction was written by Codex `codex-a71f92`; the earlier extraction review and errata were written by Claude Code `cc-fb70e5`. I wrote none of those inputs. Before claiming, I checked their complete current text and my worker log for this session's involvement. The twelve guarded inputs were acquired at commit `ad885796db8cbbb9f0d5ca49414f91aac202bc3d`. Original deliverable blob identities were retained separately.

I read all eleven inherited findings and their report, the prior extraction review, the complete five-page author erratum, and the published source passages listed below. Fresh public downloads on 23 September 2026:

| Source | Pages | SHA-256 |
|---|---:|---|
| [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf), 184 (2016), 709–744 | 36 | `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a` |
| [Author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), undated | 5 | `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1` |
| [arXiv v1](https://arxiv.org/pdf/1403.7168v1), 27 March 2014 | 31 | `6161234b6fedee00e4a5d2bbf4bb1c63d843f974fee8d6830290b186b67f7382` |
| [arXiv v2](https://arxiv.org/pdf/1403.7168v2), 3 May 2016 | 31 | `871ee74881f90405e2e30ae1491dee7a570ecd9da7286f5a486df62f0f80d7c0` |

The published and erratum hashes match the earlier workers' copies. Journal page numbers are used for the published paper; preprint page numbers refer to their PDFs. I read published pp.711–720, 725–727, 731–742; v2 pp.7–11, 16, 24, 30, with the continuation passages needed to locate the formulas; and v1 pp.8, 14, 26–27. I visually checked published pp.713, 716–718, 720, 725–727, 735, 737, 742 and erratum p.3. This was not a new full-paper extraction or an independent proof of every external geometric estimate.

## Verdicts

| Finding | Verdict | Material change or independent check |
|---|---|---|
| E1 | Confirmed, known | Published Proposition 14 incorrectly includes anti-Heegner points. The erratum restricts it to Heegner points and uses conjugate Hecke curves for the other type. Clarified that an arbitrary modular lift does not provide the fixed/small-height lift used in the proof. |
| E2 | Confirmed, known | Proposition 25's proof applies the withdrawn repulsion statement to anti-Heegner points. Checked the replacement in erratum §§3–4.1, subject to E4's ratio correction. |
| E3 | Confirmed, known | The exact printed final exponent is −1+3δ. Corrected the inherited quotation and checked the negative exponents after multiplication by p in erratum Proposition 4.2. |
| E4 | Confirmed | Monotonicity gives the small/large sinh ratio. The current erratum prints its reciprocal. |
| E5 | Confirmed with repair | The printed order-three lift has trace −1. Corrected the relation and norm to t²+t+1 and a²−ab+b². Marked the omitted branch as affecting the proof. |
| E6 | Confirmed | Six cyclic order-four kernels contradict the printed degree seven. Changed reach to a stated result; the later coarse degree bound survives. |
| E7 | Confirmed and extended | Corrected both component-group domains. The inherited explanation also misidentified the component group of C_pn. |
| E8 | Confirmed | The cusped-radius definition omits one-half. This is only a normalization correction; it does not resolve E12 or E13. |
| E9 | Confirmed | The prose reverses the metric comparison. Proposition 7 and the displayed distance calculation have the correct direction. |
| E10 | Confirmed | Direct expansion of the logarithmic potential requires coefficient −1. The paper's d^c convention gives the displayed final smooth term. |
| E11 | Rejected | Riemann–Hurwitz and nonnegativity of 2g(C)−2 imply the printed little-o equality by squeezing. No correction is needed. |
| E12 | Added, confirmed gap | The proposed short matrix is a product of peripheral unipotents, hence trivial after filling cusps. It cannot establish the upper bound under the stated homotopy restriction. |
| E13 | Added, confirmed gap | Corollary 8 confuses the shortest closed-geodesic length with half that length, then uses the stronger bound to reduce to one cusp. The cusp-detour step needs a replacement argument. |

Each locator, correction, reach and reason is recorded in the JSON and its companion explanation. The substantive checks follow.

## Corrections established independently

For **E1**, conjugating the second factor preserves the product metric and interchanges the two CM types. Close Heegner pairs become close anti-Heegner pairs on conjugate Hecke curves. The published Proposition 14 and Remark 16 cannot have the asserted anti-Heegner conclusion. The erratum's Proposition 2.1 restores the Heegner restriction already present in v1 Proposition 15. The lifting explanation needs care: reduction SL₂(Z)→SL₂(F_p) is surjective, so nonexistence of an arbitrary lift is not the obstruction. The published proof chooses h₀ and uses its conjugation in small-height matrix estimates. An element of the other real elliptic-torus normalizer component acts by complex conjugation and has negative determinant; one cannot use a fixed determinant-one lift of that action uniformly in p. The corrected Heegner case uses h₀=1. This clarification supports the erratum's correction without repeating its shorthand as an unrestricted lifting claim.

For **E2–E4**, the anti-Heegner estimate cannot intersect an algebraic curve with a real conjugate Hecke locus as though it were a complex divisor. The erratum instead pulls back along Hecke correspondences and measures volume near the conjugate diagonal. Its Proposition 3.1 says V(r)/sinh(r) is increasing. Thus, for ε<R<ρ/2,

`V(ε) ≤ (sinh ε / sinh R) V(R) ≤ (sinh ε / sinh R) vol(C)`.

This gives the O(p⁻¹) saving at R approaching ρ/2 when the stated radius asymptotic is available. The current erratum's reciprocal is inconsistent with both that monotonicity and its next displayed exponent. Its five pages do not correct that reciprocal. The older v1 p.26 already has a small reciprocal factor; it is evidence for the intended expression, not a later correction of the current erratum.

For singular bicusps, the published final T estimate is p^(−1+3δ)D, whereas the theorem needs p times the multiplicity to be o(D). The erratum separates exponents: after multiplication by p they are −2δ₂ and −2δ₃+3δ₁. Choosing δ₃ first, then 3δ₁<2δ₃ and δ₂ a sufficiently small positive multiple of δ₁, makes both negative. This verifies the repaired exponent mechanism, conditional on its geometric inputs; it does not resolve the separate radius-proof obligations below.

For **E5**, use the matrix actually printed on p.725:

`T = [[0,1],[-1,−1]], T²+T+I=0, det(aI+bT)=a²−ab+b²`.

A conjugate of T inside its two-dimensional centralizer algebra is T or T²=−I−T. If the polynomial splits modulo p, its scalar roots are excluded because the matrix is conjugate to the nonscalar T. The small-coefficient argument therefore still normalizes the same elliptic torus, and its positive-determinant normalizer is the centralizer. This completes the branch missing from the Gaussian calculation. The earlier errata formula a²+ab+b² would be correct after replacing T by −T; that replacement was not stated. The corresponding positive definite norm still supplies the required polynomial degree bound.

For **E6**, in (Z/nZ)² the number of order-n vectors is n²∏(1−ℓ⁻²). Dividing by the φ(n) generators of each cyclic subgroup gives n∏(1+ℓ⁻¹). At n=4 this is 12/2=6. The seventh subgroup counted by σ₁(4) is the noncyclic full 2-torsion. The exact degree assertion for the cyclic correspondence is wrong, although ψ(n)≤σ₁(n)=O(n²) suffices for the estimates inspected here.

For **E7**, the smooth part of C_m has exactly m connected components. The source of ξ_d has component group Z/pZ; the source of ϕ_n has Z/(pn)Z and maps by reduction modulo p to the target. The inherited explanation assigning Z/nZ to C_pn was corrected together with the adjacent source formula.

For **E8–E10**, the hyperbolic translation length associated with trace p²−2 is 2 arcosh((p²−2)/2)=4 log p+O(1), so the intended radius is half that value. The metric inequality follows from the holomorphic inclusion Y(p)→X(p) and is h_X≤h_Y on Y. Finally, with χ=|z−w|²/|1−z w̄|², elementary algebra gives

`log(χ/(1−χ)) = log|z−w|² − log((1−|z|²)(1−|w|²))`.

Applying dd^c introduces no additional coefficient. The convention d^c=(bar∂−∂)/(4π) on p.713 gives the smooth term ω/(4π), and Poincaré–Lelong supplies the diagonal current. The two printed intermediate coefficients, rather than the final line, need correction.

## Why E11 is rejected

Let D=Deg(C) in Theorem 29. Riemann–Hurwitz gives

`2g(C)−2 = −2 deg(α) + Ram(α) ≤ Ram(α) = o(D)`.

The curve C maps nonconstantly to the product, so at least one projection to X(p) is nonconstant. Since X(p) is hyperbolic for p>5, another application of Riemann–Hurwitz gives g(C)≥2. Therefore

`0 ≤ (2g(C)−2)/D ≤ Ram(α)/D → 0`.

The printed equality is valid. In fact these same bounds force deg(α)=o(D) in this hypothetical family. The previous finding's assertion that this term need not be little-o ignored the setting. I retained its original correction and reason in archival fields and marked the finding rejected, so it must not enter the confirmed-error register.

## Additional proof obligations E12–E13

**E12 is independent of the missing one-half.** The definition on p.718 only admits loops whose homotopy class remains nontrivial in the smooth compactification. The proposed upper-bound witness satisfies

`[[1−p²,p],[-p,1]] = [[1,p],[0,1]] · [[1,0],[-p,1]]`.

Both factors are peripheral unipotents in Γ(p); filling the cusps kills them and their product. The second is a conjugate of the inverse of the first cusp generator. Equivalently, both lie in the kernel described at the start of Lemma 5's proof. The matrix is hyperbolic, but its class is excluded from this particular infimum. The trace calculation still supplies the lower bound. To obtain the upper bound, a different compactification-nontrivial witness or geometric argument is required. I have not supplied that argument and do not conclude that the asymptotic statement is false.

**E13 concerns the next proof.** For the shortest closed geodesic γ on X(p), its length is 2ρ_X(p), as the same proof ultimately writes. Even granting its intended upper bound for ρ, the available length bound is 4 log p+O(1). The proof instead uses 2 log p+O(1) to claim that γ approaches at most one cusp. The separation in Lemma 6 and the corrected upper bound do not imply that claim. Merely changing the factor leaves the detour argument unjustified. A proof controlling the number of visited cusp neighborhoods and the total comparison error could replace it; this review does not claim that replacement is complete. These are specific proof gaps, not counterexamples to the main theorem or assertions about the authors' intentions.

The authors' erratum says its two principal corrections preserve the main result. That assertion is attributed to the authors. The additional obligations found here prevent this review from certifying that all dependencies are closed.

## Searches, checks and completion

On 23 September 2026, [Bakker's homepage](https://benjamin-bakker.github.io/) linked the same five-page erratum; the [Annals page](https://annals.math.princeton.edu/2016/184-3/p02) linked no correction. [arXiv history](https://arxiv.org/abs/1403.7168) ended at v2. Title/author searches with erratum and corrigendum found the author erratum but no later repair. Targeted searches for Lemma 5 and Corollary 8 with error, correction and gap found no repair of E12–E13. The erratum is undated; I infer no publication date from its grant acknowledgment. “New” is a bounded search result, not a claim of discovery priority.

Validation:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-BAKKER-TSIMERMAN-16.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-BAKKER-TSIMERMAN-16.md research/blueprint/errata/PAPER-BAKKER-TSIMERMAN-16.json research/blueprint/errata/PAPER-BAKKER-TSIMERMAN-16.md`
- Exact matrix identities and norm calculations; cyclic-subgroup counts at n=4,8,9,12; exponent checks; ratio orientation; stable inherited IDs and complete verdict coverage.

Only the three issue deliverables are changed. No Lean file is involved; no compilation or formalization is claimed. The remaining mathematical work is precisely the source-proof repair identified in E12–E13, not an unperformed verification of the thirteen verdicts.
