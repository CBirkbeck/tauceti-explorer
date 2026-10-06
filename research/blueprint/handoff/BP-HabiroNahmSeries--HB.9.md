# BP-HabiroNahmSeries--HB.9 handoff

Job #6510, Codex (GPT-6), session codex-gEEAjx, 6 October 2026. The planning pass is complete under PROTOCOL §0: packet status complete, coverage HabiroNahmSeries:HB.9 planned. No stage is closed and no declaration is claimed implemented. All seventeen accepted HB.9 IDs are imported from the base packet; the eighteen new IDs begin with followup- and do not overlap them.

## Deliverables and checks

The packet, reader and suggested file cover exactly HB.9. The packet has four lemmas, one application, one definition, six theorems, two constructions and four comparisons: eighteen nodes, thirteen API items, thirteen unit tests and eleven baseline declarations. Two new planets join three imported planets, for five in the layer. Five gaps and six requests remain.

The packet checker reports zero errors and zero warnings. The source-issue validator and source-version checks also pass. Every API/test name appears in the reader and suggested file; all node implementationStatus values are unchecked. Node IDs are distinct from the accepted base.

The suggested file elaborated through lean-check with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. There were 32 warnings, all “declaration uses sorry”, and no errors or other warnings. Memory was checked before both compiles and exceeded 100 GB available. Only the suggested file was elaborated; no language server or library build was started. The shared Tau Ceti build's HEAD differs from the audit pin, but the file imports only the exact pinned Mathlib. Tau Ceti source claims were separately searched at f790474821cf4256814db967cb154e7af3d0c369. Unavailable Gaussian, completed coefficient, Coleman and indexed-module carriers have explicit named signature omissions, rather than private structures with proposition fields.

Independent exact arithmetic checks passed:

- Gaussian first coefficient for A=(3), m=1 agrees identically with the polynomial coefficient in corrected (242), after adding the Euler 1/24. Use inherited E41's exp(V/log(1+x)) prefactor.
- The A=(5), p=5 square-root relation has both mod-5 branches; T−z² vanishes on only the normalized branch.
- Enumeration of the three fourth-moment and fifteen sixth-moment pairings verifies every displayed diagonal-vertex Wick contraction on two rational covariance matrices.
- Every equation for both powered and unpowered products holds through total t-degree four at q=2, γ=2, nonzero shifts μ=((1,−1),(0,2)), ν=(−2,1), and A=((2,−1),(−1,3)), ((0,1),(1,−2)), ((1,1),(1,1)).
- An independent finite Nahm-series computation at A=0, γ=2 gives powered t coefficient q/(q−1), with a pole, and unpowered t coefficient (q+2)/(q+1), regular at q=1.

The arithmetic scripts used exact rational polynomial multiplication and fractions, with no symbolic algebra dependency. Scratch sources and scripts are removed after submission. The formulas, test inputs and reconstruction instructions below preserve everything needed to reproduce their conclusions.

## Findings for independent review

Review E64 and E65 first. They are new findings against GSWZ arXiv v2 and the checked author-copy displays; the packet records sourceVersions and correction searches. They do not carry the author's own review verdict.

E64: (114) must subtract Li₂(θ^m)/(m²h), Li₁(θ^m)w/(mh), Li₀(θ^m)w²/(2h), and the constant −Σ B₁(s_a)log(1−ζ_m^{k+1+a}θ). The printed linear/quadratic denominators and constant sign are wrong. The residual is in the Gaussian weight completion, retaining w and w³/h vertices; the printed ordinary 1+x normalization is not used.

E65: corrected Definition 2.11 still needs exp(Nh/24), from the inverse Euler denominator in (112). The accepted HB.4 Euler expansion supplies it. Reproduce the rank-one check over Q(z) with t=(z−1)/z³, δ=(3−2z)/z³,
C=−(1−z)/(3−2z), b=3/2+z/(2(1−z)), Q=z/(2(1−z)²), T=z/(1−z)², U=z(1+z)/(1−z)³ and c=z/(12(1−z)).
The displayed finite J plus 1/24 equals
((308t³−74t²)z²+(234t³−74t²)z+216t³−382t²+74t)/(24δ³).
Clearing denominators gives the zero polynomial. This comparison uses inherited E41; it is not an exp(V/x) calculation.

Two further findings refine accepted proof repairs, rather than duplicating existing source issues:

1. E59's proposed reduction injection for the full S into one t=0 branch fails at A=5, p=5. In characteristic five, δ=z^{-4} and T²=z⁴. Sending T to ±z² gives two maps. T−z² is zero on the selected branch and a nonzero unit on the other. A coefficient-transfer proof must keep all components or a jointly faithful reduction family. The p-adically completed Laurent target must also allow unbounded negative exponents with coefficients tending to zero.
2. E47's powered auxiliary family has valid recurrences and uniqueness, but not universal volume cancellation. Its volume is (V(t^γ)−V(t))/(m²h). Therefore the accepted base's universal x-integrality assertion for that repair cannot be consumed. Retain the source's unpowered product and repair its covariance to t_j↦q^γt_j, μ↦μ+1⊗e_j, ν↦ν−γe_j. The positive recurrence then has t_j, and total-degree uniqueness uses q^{γα_j}−1. This preserves the cancelling common volume. Both families have real, tested prototypes so their conventions cannot be conflated.

## Proof progress and boundaries

The finite first-coefficient proof accounts for the Wick cross terms, finite Pochhammer factors and Euler scalar. It normalizes an individual principal-part-free refined piece before coefficient specialization, not a possibly zero sum. Its first x coefficient is ζ_m^{-1}J, integral at p∤Δ. Identifying its constant with the fixed ε_m torsor remains a separate signed comparison.

The potential defect is given by an explicit convergent pS_p-valued expression
W_p=pΣℓ₂(y)+pΣβℓ₁(y)−pηᵗAη/2−Σ_jΣ_{r≥2}p^{r−1}β_j^r Li_{2−r}(y_j^p)/r!,
where y=1−z, φ(z)=z^p exp(pη) and β=Aη. This uses only principal-unit logarithms and integral modified polylogarithms on the full coefficient algebra. At t=1 the good Coleman disc identity and positive potential sign give specOne(W_p)=φ(D_pξ)/p−pD_pξ, conditional on the actual regulator suppliers. It avoids evaluating a divergent formal V(t) at t=1.

Descendants use t_j^{1/m}=q^{ν_j}, hence t_j=q^{mν_j}, with the unique étale lift at the prescribed solution. Their first logarithmic derivative is Λ^{-1}(mν/ζ_m). The reader records zero, level-two and negative-shift tests. Full principal-part and gluing transport is still required.

No blanket general-rank identification, all-order Gaussian integrality, signed Kummer comparison or effective global descent is claimed from these calculations. The inherited torsion converse retains nonzero constants at infinitely many allowed prime orders.

## Resume the mathematical follow-up

Five gaps precisely describe the work:

1. G-coefficient-transfer: prove the coefficient defect on every component or a jointly faithful integral model with reduction saturation. Only then apply saturation_transfer to clear p denominators. A single formal branch cannot justify all solution specializations.
2. G-HB8-identification: reconcile E64/E65 with HB.8's existing Gaussian construction and prove its corrected coefficient ring, periodicity, q-difference identities and arbitrary-rank identification at all orders. Keep m′ coprime to m; HB.9 uses only m′=1.
3. G-kummer-orientation: compare the complete U_m(1), including inverse cyclic prefactor, monomials, k-sum and δ^{-1/2}, with the fixed exported ε_m=c_ζ². Individual constants are units in a torsor; the sum may vanish.
4. G-all-order-gluing: prove integral coefficients and full coefficient-Frobenius reexpansion for the unpowered auxiliary family, then Kummer descent and actual HB.7 effective global descent over B=R[T]/(δT²−1), including split algebras. Uniqueness and volume cancellation alone are insufficient.
5. G-descendant-transport: prove the all-order formal étale pullback, varying principal part and prefactors, and its local/product gluing with the correct transported indices.

The six supplier requests are HB.8 corrected all-order construction/identification; HB.2 signed finite-Chern orientation; HB.7 full étale indexed-module/effective descent; and PadicHodgeRegulators D.1 normalization, D.3 unramified integral regulator, D.4 global localization/Frobenius compatibility. Existing ColemanIntegration:L2 nodes are imported individually. General Habiro rings, Frobenius lifts and modules are not replanned.

## Reading retained for review

GSWZ v2 was read at Definitions 1.3–1.4, §§1.6–1.7, the Bernoulli/root expansion, §§2.4–2.7 and §§3.1–3.3 through Remark 3.11, plus (222)/(242). CGZ v3 was read in the introductory finite-Chern comparison, §2.2 and the stated restriction/comparison passages of §§2.4–2.5. Exact URLs, hashes and reading scopes are in the packet and reader. The Scholze author PDF was opened and the relevant (114)/(118) displays compared. No correction was found in the recorded arXiv/author-page/title searches. No version of record was identified on the inspected publication pages; findings stay scoped to the versions read.

The ArithmeticDirichletSeries and AlgebraicCodingTheory upstream documents were read completely. The source statements of all eleven baseline declarations were read at the pins. Accepted HB.8, HB.2, HB.7 and Coleman interfaces and the relevant stage links were inspected. No missing source is claimed as read: the remaining items are missing mathematical supplier proofs, explicitly represented by gaps and requests.

This run submits one completed planning job for independent review. It does not take a second issue.
