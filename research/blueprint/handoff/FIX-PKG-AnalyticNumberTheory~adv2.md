# FIX-PKG-AnalyticNumberTheory~adv2

Issue #10234. Codex, session `codex-5NW8MP`, 17 October 2026. Complete package fix; the explicitly authorized fixing verdict is **accepted**. The four deliverables are the package README, Suggested.lean, review.json and this note. No other roadmap, packet, metadata or atlas data changed.

The inputs were the unsuffixed independent package review, `REV-PKG-AnalyticNumberTheory~2.md`, the previous fixing handoff and the manager's ordering instruction. The requested `REV-PKG-AnalyticNumberTheory~adv.md` does not exist in this clone; the two available package reviews contain the findings addressed here. This verdict records a fix, with the reviewer identity required by the issue.

## Findings and changes

The section numbers in the first column refer to the reviewed input. Sections 0, 1 and 5 have been renumbered consecutively after removing duplicates and moving arithmetic foundations before their consumers. The final package has 236 numbered targets in seven layers; existing explicit anchors of retained targets remain stable.

| Finding | Disposition in the final package |
| --- | --- |
| Round 2: §0.14 `EntireOrderAtMost` | Deleted the definition, its API, proof plan and Lean declarations. Consume ZerosOfLFunctions 0.1 `OrderLE`; the contract explicitly separates entirety from its cobounded growth predicate. |
| §0.15 genus-one factor | Deleted the duplicate definition and analytic foundation chain. Consume 5.3 and its locally uniform product API. The paired-factor calculation remains a normalization Check and Lean example. Higher-genus factors remain §0.15. |
| §0.26 order-one Hadamard | Consume 5.4–5.6. Final §0.22 only removes the finite origin zero, applies the supplier to the nonvanishing quotient and restores `z^m`. Removed the generic good-circle, summability, canonical-product and logarithmic-derivative proof plans. |
| §0.16 xi | Final §0.14 keeps the light pole-cancelled definition and the comparison `2ξ = entireCompletion`. Endpoints and the regular pair 2, −1 pin the normalization. Entire growth is consumed from 3.3–3.4. |
| §0.17 weak zeta convexity | Deleted; consume 3.3–3.4. Removed the theta/Mellin growth proof chain used to rebuild that supplier theorem. |
| §§1.8, 1.11 and Gamma remainder | Deleted generic Stirling, vertical-strip and quotient targets and the Lean signature. Consume 1.2–1.4. Retain only the differentiated Stieltjes remainder for every derivative order j≥1, with an explicit sector constant. Callers needing ordinary Stirling now cite the supplier directly. |
| §1.4 finite zero multiset | Deleted the duplicate carrier and construction. All finite sums restrict the imported analytic divisor with multiplicity and their stated height cutoffs. Ray-family density also consumes that divisor. |
| §0.28 zeta zero-free region | Deleted, including its subsidiary logarithmic-derivative/positivity proof plans and Lean signature. Consume 6.2. The Green–Tao logarithmic/reciprocal bounds remain a quantitative refinement. |
| §0.35 Dirichlet region | Replaced by final §0.30, the single rational Dirichlet/ray dictionary, consuming LFunctions 4–5 and ZerosOfLFunctions 6.2–6.4. It compares conductor, parity, primitive source, continued germs, root-number normalization and deleted Euler factors. |
| §§0.1, 0.21 exceptional zeros | Keep the c-parametrized predicate in §0.1; delete the independent uniqueness/simplicity theorem. The explicit `c≤min(c₁/3, log(3)/2)` comparison places its strict region inside the supplier's closed region. No uniqueness claim is made for arbitrary width c. |
| Family Landau–Page / two-real-zero argument | Retain their extra family generality. The nonnegative coefficients of the four-function product and its two-zero inequality give the separate family contradiction; per-character uniqueness alone is insufficient. The primitive principal case uses the zeta region and the positive eta series on the real interval. |
| §2.22 Hecke convexity | Retain only the Rademacher–Thorner–Zaman bound with an absolute implied constant independent of degree, field and strip parameter; every dependence is displayed. The fixed-degree supplier theorem is consumed. |
| §2.44 Dedekind/Hecke regions | Consume the per-character region. Retain simultaneous uniqueness in the abelian character product, with the sourced numerical constant 0.0875; the trivial extension is its Dedekind specialization. |
| §1.13 Riemann–von Mangoldt | Deleted its target and proof chain; consume 7.4. |
| §§1.9, 1.14 rational explicit formula and PNT remainder | Deleted their targets, subsidiary contour development and Lean PNT signature. Consume 8.2–8.5. Conditional prime-error arguments now name the imported formulas. |
| §1.12 Mestre formula | Retain as final §1.8. Chenevier–Taïbi §2.3, pp.275–276, applies it to general automorphic Rankin–Selberg pairs, beyond the supplier's degree-one families. The symmetric-tail test-function hypotheses and zero-slope Gamma conventions remain explicit. |
| §0.22 uniform character PNT / §2.50 nonabelian Chebotarev | Retain their conductor-uniform or nonabelian generality; the supplier's fixed-character/abelian estimates do not replace them. Final uniform character PNT is §0.18. |
| Uniform rational contour input | Consume strip growth and divisor/count theory. The remaining adapter gives uniform compact-height counts, the specific local logarithmic-derivative expansion and simultaneous safe heights for χ and its conjugate. It introduces no second divisor or generic Jensen/growth theory. |
| Manager: remove ArithmeticStatistics suppliers | Removed its entire supplier block and every ST dependency. It now occurs once, in Downstream consumers. The new ownership destinations are listed below. |
| Exemplar / suggested-file shape | Preserved hypotheses, APIs and Checks. Added real-bodied `cubicDiscriminant` and representative end statements; removed the closing name catalogue. Heavy algebraic and analytic constructions stay README targets. No sorry'd data or auxiliary theory development was added. |

The independent round-2 review already closed the earlier G1–G7. This fix preserves those repairs:

| Earlier finding | Preserved disposition |
| --- | --- |
| G1 scalar spectrum, heat, Gaussian trace and Weyl | PseudodifferentialOperators P7/P7a supplies realization; the local heat-kernel/Gaussian/Weyl chain and compact determinant normalization remain. |
| G2 Bost–Connes completion, KMS and measured factors | OperatorAlgebraDynamics D1/D2/D7, AmenableGroups and VonNeumannAlgebras remain exact suppliers; only BC instances are local. |
| G3 fixed-degree arithmetic and Zaman exponents | Degree-uniform conductor/residue comparisons, exponents 19/35 and their numerical source obligations remain. |
| G4 prime, character, Hilbert and Gamma proofs | Imported generic zero theory replaces the overlap. Uniform half-interval, mean-square/Hilbert, Siegel and numerical refinements remain. |
| G5 multiplicative means, Sathe, Shiu and Beurling | Their corrected coefficient classes, cutoffs and Tauberian proof contracts remain. |
| G6 cubic local distributions, order one and Fourier | The sourced Igusa/Datskovsky–Wright and Wright-thesis targets remain; the rank-one Fourier constant remains uniform on each fixed strip. |
| G7 complex Hurwitz/Lerch and Barnes | The complex continuation carriers, odd Lerch sign, canonical Barnes product and full-sector remainder remain, including their existing Lean examples. |

## Arithmetic ownership destinations

The order is AnalyticNumberTheory → ArithmeticStatistics. A future ArithmeticStatistics worker should consume these final README sections and stable anchors:

| Input moved down | Owner / destination |
| --- | --- |
| Twisted binary-cubic action, integral discriminant polynomial and covariance | §5.4, `cubic-action-discriminant`. The construction is over arbitrary commutative rings; local characteristic-zero orbit classification belongs to the next target. |
| Locally free cubic algebras on all projective modules; étale orbits, automorphisms, adelic class components and trace dual | §5.5, `proof-cubic-projective-parametrization`. Wood's general-base correspondence replaces an assumption of a global free basis. |
| Order discriminant ideals, finite discriminant fibres, inverse-automorphism weights and trace-divisible coefficients | §5.6, `cubic-coefficient-finiteness`. Trace matrices glue the discriminant ideal for nonmaximal and reducible orders; `relDiscr` is used only where its domain/Dedekind hypotheses hold. |
| Uniform degree-at-most-three extension count | §5.7, `cubic-uniform-field-count`. This includes the relative class-norm torsion bound and regulator-ratio lower bound, with the constants bound before the fields. Qualitative Hermite finiteness is used separately for finite fibres. |
| Quadratic large sieve, unrestricted square-pair correction and primitive-real fourth moment | §5.29, `quadratic-large-sieve`, and the existing `proof-quadratic-fourth-moment` refinement. The two-term norm calculation retains arbitrary complex coefficients. |
| Cubic zeta and double-series analytic consequences | Existing targets, now §§5.8–5.28 and §5.30, consume those foundations. Their stable anchors are retained. |

Current library trace, finite-projective-module, polynomial, matrix, Dirichlet-character, Jacobi-symbol and qualitative Hermite APIs are reused. In particular `NumberField.finite_of_discr_bdd` is not replanned, and current Tau Ceti `relDiscr` is not extended by silently dropping its hypotheses. The current HeightsAndUnits, GlobalNumberFields and Completed/EffectiveBounds contracts were inspected for the new arithmetic inputs; none supplies this uniform relative cubic-count theorem or the projective cubic correspondence.

## Adversarial pass on the changed statements

The following checks also cover the transport of existing statements to imported carriers. Numerical/formula witnesses expressible at the Lean pins appear as examples; heavy projective, divisor and ray-class constructions have their exact Checks in the README.

| Statement / interface | Instances tried | Result and change |
| --- | --- | --- |
| `OrderLE` import and finite-order refinement | Constant 1, zero function, exp(z), exp(z²); integer and noninteger ρ | Entirety stays separate from cobounded growth. Hadamard excludes the zero function. The higher-genus exponent floor(ρ)+1 is strictly greater than ρ. |
| Exceptional-width predicate and transport | c=0; N=1; β=1; β at the lower cutoff; N=3 | Zero width and conductor one are rejected; both endpoints are strict. `log(4N)≤3log N` gives the stated direction of width inclusion. Small c also forces β>1/2. |
| Landau–Page and two-character repulsion | One character versus two distinct real primitive characters; equal characters; principal conductor 1; T=2 | The four Euler coefficients are nonnegative; distinctness keeps the product character nonprincipal. The two-pole contradiction is a separate family argument. Equality of characters is outside that hypothesis. |
| Xi completion | s=0,1 and s=2,−1 | Values are 1/2 at both former poles and π/6 at both regular points. This fixes the factor 2, including at the analytic extensions. |
| Origin-zero Hadamard adapter | f=1; z²exp(z); 1−z²; f=0 | The first three have m=0,2,0 respectively. E₁(z)E₁(−z)=1−z². The identically-zero case has no finite vanishing order and is excluded. |
| Higher Gamma remainder derivatives | j=1,2; x=1; Re z<0 in a proper slit sector; z=0 and δ=0 | Derivative signs and factorials agree with kernels −1/4 and 3/8 at 1. The sector bound retains its secant factor; the singular origin and closed negative axis are excluded. |
| Rational ray dictionary | q=1; χ₋₄; principal level 6; quartic character mod 5 | Conductor/parity agree; level 6 retains both deleted factors. With χ(2)=i, its value minus its inverse is 2i, fixing the arithmetic rather than conjugate character. |
| Uniform local count / logarithmic derivative | Height 0; q=3; complex χ; repeated zero; even trivial zero at 0 | Low-height constants retain log q. Conjugation changes the character; multiplicity is retained. The expansion excludes trivial zeros or separates their orders. |
| Half-interval formula and its supplier transport | k=4; T=2; odd/even endpoints; ρ→0; complex χ | Subtraction removes the kernel pole before estimates. The limit is log 2 and the low-zero weight is bounded. Both safe-height bands and endpoint corrections remain. |
| Zeta logarithmic strip / conditional errors | s=1; bounded and high heights; q=1 and a unit class mod 6 | Pole-subtracted ζ and reciprocal ζ use analytic extensions at 1. RH/GRH remain explicit hypotheses; conditional arguments consume the imported explicit formulas. |
| Mestre formula's retained generality | F=0; even compact support; asymmetric one-tail F; zero Gamma slope | General Rankin–Selberg pairs are genuine consumers. Both tails and finite nonzero constant Gamma factors are required; zero-slope Γ(0) is excluded. |
| Explicit Hecke convexity | K=ℚ; r=1/2 and r→0; nonprincipal s=1; principal pole | The degree/width factors remain displayed. Only the principal pole is excluded from the finite-value statement. The implied constant remains absolute. |
| Ray-family density / abelian product | Repeated zero; trivial extension; K=ℚ and discriminant 1; multiple characters | Density uses divisor multiplicity. The product theorem needs simultaneous uniqueness; its large-parameter threshold excludes dividing by log 1. |
| Binary-cubic action | Zero form; uv(u−v); u³−v³; diagonal, unipotent and scalar matrices | P=0,1,−27 respectively. diag(2,1) gives −108, a determinant-square factor. The unipotent case gives −27 and scalar λI gives λ⁴P. |
| General-base cubic construction | Field and DVR; nonprincipal rank-two module; zero form; characteristics 2 and 3 | Rank three is a hypothesis. V=(C/O)∨ retains the inverse ideal class. The zero form gives a square-zero algebra. No division by 2 or 3 is used; u³−v³ has discriminant 1 in F₂ and 0 in F₃, so separability is tested separately. |
| Weighted coefficient fibres and trace dual | O³; zero discriminant; nonmaximal order; place over 3 | The split weight is 1/6. Zero discriminant is excluded from the coefficient series. Tr(1),Tr(ω),Tr(θ)=3,b,−c makes trace divisibility exactly b,c∈3O in a normalized basis. |
| Relative torsion and uniform field count | E=F; ℓ=1; n=0,1; cyclic versus non-Galois cubic; reducible F³ | The identity extension contributes at n=1, its norm kernel has one element and regulator ratio 1. The norm cokernel has order ≤[E:F]; the kernel need not. Reducible algebras are counted in coefficients, separately from fields. |
| Quadratic large sieve | M=1,N=3 with coefficients 1,±1; m=n=3; denominator 1; nonsquarefree coefficients | The two-term values are 0 and 4; the common-factor symbol is 0. Dropping squarefree support requires the square-pair correction, now stated explicitly. Positive cutoffs are hypotheses. |
| Primitive-real fourth moment | Empty family; Q=1; σ=1/2 and 1; t=0 | The conductor-one principal pole is excluded. The endpoints give Q(1+|t|) and Q+1, up to ε powers. The Lean finite-subfamily statement has the same constant quantifiers as the README. |
| Preserved BC / heat conventions | M₂ vector state; imaginary-time factor at 2; genus-two surface | Existing negative control, reciprocal factors 1/2 and 2, and ζ₊(0)=−4/3 remain unchanged. |

## Baselines and source provenance

Read-only current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Actual TauCetiRoadmap main was checked at `350e970ce49f707a327909beac0b7b7c782cc7ee`; the supplied local roadmap checkout is the older feature commit `0d144d044dacebca17b654695b6f1ad58f159b27`. No build ran in either read-only checkout. The representative Lean pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

New supplier links pin the open PRs [ZerosOfLFunctions #253](https://github.com/TauCetiProject/TauCetiRoadmap/pull/253), head `cce2e04188a559be9a16037d0d65e00a815fcecc`, and [LFunctions #248](https://github.com/TauCetiProject/TauCetiRoadmap/pull/248), head `e632e3a41fc257fce7b0d9938d48507b962f4fbb`. Both heads and main were rechecked on 17 October. Consuming #253 adds no sequencing constraint beyond the existing AL supplier's dependency on it. The previous review's PseudodifferentialOperators #952, VonNeumannAlgebras #889 and AmenableGroups #821 dependencies remain.

The primary locations newly read or rechecked for this repair are below. SHA-256 identifies each public PDF read on 17 October 2026; sources are described in our own words in the package.

| Source | Locations | SHA-256 |
| --- | --- | --- |
| [Heath-Brown](https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf) | Theorem 1, Corollary 1 p.237; Corollary 2, Theorem 2 p.238; proofs §§2–10 pp.239–269 | `50e42d8ec3a7a57f60e6d2d68f4a9af2e4576d25a4bf22bab281f9ca88d2e590` |
| [Lemke Oliver–Wang–Wood](https://arxiv.org/pdf/2110.07712) | Lemma 2.5 and proof p.8; Lemma 3.5 p.11; cubic-order definition pp.11–12, Lemmas 3.9–3.10 pp.13–14 | `fad655111b4d5864f54fbc1a94f3319ca57fb92c7adc6741bbec01d08732d935` |
| [Wood](https://msp.org/ant/2011/5-8/ant-v5-n8-p05-p.pdf) | §2, Theorem 2.1 and local multiplication, pp.1073–1074 | `a8dd1475785b428fe27a75d8aad56f3b90ab3936616c9d3b386f7dd3c28af95b` |
| [Nemes](https://arxiv.org/pdf/1310.0166v2) | §2, (2.5), Lemma 2.1 p.6; higher derivatives follow by dominated differentiation of that representation | `662a87447064822b163d34c67fa5c9ec5fee83c47c38bffa443f95bab25b7665` |
| [Thorner–Zaman](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf) | Lemma 2.3 p.1142, absolute implied constant in the displayed convexity bound | `504512d24db46f933d52f277d2ad3a14da5ed66e0efcda0407c8aceadd008d4c` |
| [Chenevier–Taïbi](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf) | §2.3 pp.275–276, Rankin–Selberg consumer and (2.3.5) | `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de` |

[Milne's Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), Chapter V §1, Example 1.4 and Theorem 1.7, pp.149–151, was read for the rational ray dictionary. [Chenevier–Taïbi](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §2.3 pp.275–276, was read for the Rankin–Selberg consumer and (2.3.5). The relative regulator bound is sourced through LOWW's proof of Lemma 2.5, which explicitly identifies the Friedman–Skoruppa input. The previously reviewed Igusa/Wright-thesis proof-source restrictions remain as recorded in round 2; their publicly stated targets were preserved. No restricted source file or source passage was copied into a deliverable.

## Validation and continuation

- Final `lean-check` on the package Suggested.lean: exit 0, 574 lines, exactly 59 `declaration uses sorry` warnings and no other diagnostics. Memory was checked before each invocation. The new rational-character, discriminant and sieve numerical examples are proved; the file remains a roadmap with theorem placeholders.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/AnalyticNumberTheory/Suggested.lean`: passed.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticNumberTheory.json`: 0 errors, 0 warnings. This is the unchanged historical packet, whose 58 gap and 52 request entries were outside the four authorized deliverables.
- Navigation and prerequisites: 497 explicit anchors, 1,331 internal links and 1,102 explicit prerequisite edges; no duplicate anchors, unresolved links or directed prerequisite cycles. All layers number consecutively. All eight new ZerosOfLFunctions anchors and both LFunctions anchors resolve at the pinned supplier heads.
- ArithmeticStatistics: exactly one occurrence, in Downstream consumers; no ST supplier references.
- `git diff --check`: passed. `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems.

No finding is left for a continuation worker on this issue. The maintainer can port the accepted package with the existing upstream dependencies. ArithmeticStatistics should import the ownership destinations above when its package is next repaired.
