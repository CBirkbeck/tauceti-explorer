# REV-ERRATA-PAPER-CARO-PASTEN-23

**Verdict: confirmed with corrections, for the arXiv v2 passages specified in the findings.**

Reviewer: Codex, session `codex-7e92bd`, 23 September 2026. Original errata author: Claude Code, session `cc-fb70e5`. I did not write that errata job or this paper's extraction.

## Evidence and scope

I downloaded [arXiv 2102.01055v2](https://arxiv.org/pdf/2102.01055v2) and read the findings at pp. 10–11, 13–14, 16–18, 23–25, 30–33 and 35–37, including the hypotheses and immediate proof dependencies. I checked the example in Remark 4.7 in a rendered page image. I compared the stated repairs with the actual numerical hypotheses, formal-group series and intersection identities.

I read the [published acknowledgements](https://link.springer.com/article/10.1007/s00222-023-01217-1): they credit a referee with finding a mistake in an earlier Lemma 3.15. I also downloaded [Balakrishnan–Caro v2](https://arxiv.org/pdf/2501.03483v2) and read Theorem 2.1, p. 3, which cites the changed published constant. The publisher's main-body PDF request returned an HTML access page. The public sources therefore confirm an acknowledged earlier-version problem, but do not reveal its exact final repair or settle the publication status of the other slips. Every verdict below is explicitly restricted to the directly read preprint; no unobserved typeset passage is certified.

Correction searches checked arXiv's version history, the publisher page, Crossref update/relation fields, the authors' public/indexed pages and title/erratum searches on 23 September 2026. Pasten's live page failed; its indexed entry points to arXiv. No separate corrigendum or public final main body was obtained. The JSON records exact hashes and the limits of these checks. This finishes the independent review of the recorded version-scoped findings; it does not claim a full final-publication collation.

## Individual verdicts

| Finding | Verdict and evidence |
| --- | --- |
| E1 | **Confirmed.** Confirmed the v2 lemma is false: enumerated the five projective F₃-points, checked the single nonsplit node, and counted six geometric branches against the bound four. Checked the normalization parametrization and the cancelling zeta factor. Strengthened known-status evidence using the published acknowledgements; did not infer an unobserved final repair. The surface constant’s v2 proof is affected, but the example is not a surface counterexample. |
| E2 | **Confirmed.** Confirmed the nonintegral printed jet and the sharpness of the exchanged jet. Added the adjacent missed misprint z in place of z³ in the differential-module presentation; the displayed quotient otherwise contradicts its own last equality. The characteristic exclusions in Remark 4.7 are retained. |
| E3 | **Confirmed.** Confirmed at §5, p. 16. Adding codimensions gives 2n−r₁−r₂ as the codimension, hence r₁+r₂−n as the dimension. For two divisors on a surface the result is a zero-cycle, detecting the printed dimension immediately. |
| E4 | **Confirmed.** Confirmed from the paper’s definitions: the coefficient of t^(2n−1) in ∏(t−γ_i)² is −2Σγ_i; trace is the negative of that coefficient. Equation (5.1) then gives the positive sum required by the arithmetic–geometric mean calculation. |
| E5 | **Confirmed.** Confirmed the arithmetic error and the missing implication in case (a). Checked s=6, p=7 as a counterexample to the numerical implication, not to the geometric lemma. Changed kind to gap and described the stronger bound as a sufficient repair; case (b) still uses p>s. Checked the actual later invocation in Lemma 9.10 and its stronger main-theorem hypotheses. |
| E6 | **Confirmed.** Confirmed the allowed endpoint M=1, yielding λ=0. Since 0<r<1, the remaining inequalities in the proof remain valid at that endpoint; only the strict lower bound needs changing. |
| E7 | **Confirmed.** Confirmed the linear-term contradiction directly and independently proved the finite-difference repair by Newton interpolation in the multiplication parameter. Symbolic degree-four computations agree. Removed the unsupported assertion that Bourbaki was directly collated. Checked the coefficient estimates and Lemma 7.7’s use of the formal inverse identities; the repair supplies those identities and estimates. |
| E8 | **Confirmed.** Confirmed the ambient dimension is arbitrary n in Theorem 9.1(ii), whose denominator is deg(H^n). Specialization preserves that top self-intersection; the displayed cubes only have the intended degree interpretation when n=3. |
| E9 | **Confirmed.** Confirmed the saturation gap using v₁=e₁, v₂=e₁+ϖe₂, both in the kernel of the third-coordinate functional: independent over K, primitive over R, dependent modulo ϖ. Proved the repair from the torsion-free quotient; included the harmless zero-functional case instead of asserting rank n−1 for every linear map. |
| E10 | **Confirmed.** Confirmed the union in §9.4 disagrees with the intersection in Lemma 9.6, p. 31. A one-dimensional analytic subgroup cannot contain the open n-dimensional residue disk for n≥3. The rest of the proof uses exactly the intersection containment. |
| E11 | **Confirmed.** Confirmed by comparing the displayed inequality with Proposition 9.14 on the same page. Translation preserves m and the ramification parameters, so both the leading 1 and the multiplicative factor must remain. The printed m=0 bound would even exclude the chosen point ξ₀. |
| E12 | **Confirmed.** Confirmed that only the residue-disk partition is an equality: summing Proposition 9.14 gives ≤. The final removal of terms outside Z is an equality because Lemma 9.11 gives m(x)=0 there. |
| E13 | **Confirmed.** Confirmed the hyperelliptic genus-three counterexample and the scope of §10.3. Changed affects from nothing to a stated result: the corollary’s literal ampleness claim fails even though its later use survives. Strengthened the repair using the finite pullback proof that V is ample; this also proves ampleness for all curves of genus at least four. |
| E14 | **Confirmed.** Located and confirmed the boundary case flagged but not relocated by the original errata worker. The proof uses z∉(z²), which is true for m≥1 and false for m=0. The separate regular-parameter choice repairs the lemma without changing its statement. |
| E15 | **Confirmed.** New adjacent notation findings from direct reading of p. 11. Checked the root-of-unity sum and P¹ zeta function. Kept these separate from the acknowledged substantive lemma error and explicitly avoided presenting them as a repair of its proof. |

## Changes made

- Preserved all thirteen original identifiers and added a verdict to each. Added E14/E15 and the adjacent differential-module slip to E2.
- E1 now records the primary published acknowledgement and bounds its reach carefully: a false general curve lemma and a missing step in the preprint's surface proof do not themselves disprove the surface theorem. Its exact final repair remains uncollated.
- E5 is classified as a gap and its strengthened hypothesis as a sufficient repair. E13 is classified as affecting a stated result; its corrected ampleness criterion includes all genus-at-least-four curves, justified by the finite pullback of V.
- E7 has a self-contained all-order finite-difference verification. The review does not pretend to have read the inaccessible Bourbaki supplier or rely only on a low-degree experiment.
- E9 handles both nonzero and zero linear functionals. The later extraction and the central register are not edited by this job.

## Verification

Exact scratch diagnostics passed for the five F₃-points and six branches of the nodal cubic; the 2s²/9 threshold; formal Log/Exp through degree four with symbolic coefficients; the jet differential; and primitive independent vectors becoming dependent after reduction. The general repairs are proved in the findings, beyond those finite diagnostics.

Required repository checks:

- `python3 scripts/check_errata.py research/blueprint/errata/PAPER-CARO-PASTEN-23.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/reviews/REV-ERRATA-PAPER-CARO-PASTEN-23.md research/blueprint/errata/PAPER-CARO-PASTEN-23.json research/blueprint/errata/PAPER-CARO-PASTEN-23.md`
- `git diff --check`

No Lean file is required or compiled. Only the three issue deliverables are changed; source PDFs and diagnostics remain in the worker's scratch space.
