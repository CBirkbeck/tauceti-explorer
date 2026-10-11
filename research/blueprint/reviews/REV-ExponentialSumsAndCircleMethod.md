# Independent review: Exponential sums, decoupling and the circle method

**Verdict: accepted.** Job REV-ExponentialSumsAndCircleMethod (#547), reviewed by Codex, session codex-cbKWTk, on 11 October 2026. This session did not write the input blueprint. All 205 incoming nodes were checked; the corrected packet has 206 individually justified review entries. Acceptance concerns a target-level plan, not completed proofs.

The packet remains `complete`: every target of ES.0–ES.5 has a contract whose dependencies end in native declarations, supplier contracts/requests or explicit gaps. All six stages are `planned`, none `closed`. This is the distinction in PROTOCOL §0: recorded missing proof inputs do not by themselves make a target unplanned. The 26 gaps and four requests remain open; no node is claimed formalised and every implementation status is `unchecked`.

## Counts and coverage

| Item | Reviewed result |
| --- | ---: |
| Nodes | 206: 53 definitions, 38 lemmas, 114 theorems, one application |
| Individual verdicts | 190 verified, 15 corrected, one added |
| Definition API items / tests | 242 / 182 |
| All API items / tests | 263 / 224 |
| Baseline citations | 175 confirmed |
| Planets | 32, within the per-stage limits |
| Gaps / supplier requests | 26 / 4 |
| Source findings | 30: 29 confirmed, one rejected |

The incoming target-coverage table was checked against the roadmap document, including the real oscillation, completion, routed character sums, weighted torus identities, decoupling inputs, optimized Waring, quadratic and Markoff endpoints, and determinant/statistics targets. Definitions have at least three discriminating tests. Their APIs and suggested signatures preserve interval, character, Haar, local-density and weight conventions. The proof sketches were checked at target granularity; unresolved analytic or arithmetic-geometric interfaces remain named gaps rather than being hidden in conclusion-bearing premise structures.

## Corrections to nodes

1. **ES.0/stationary-phase-leading:** uniqueness now ranges over the closed topological support, both in the contract and native signature. Pointwise support misses a degenerate critical point where the amplitude vanishes. For example, take φ(x)=x⁴−(2/5)x⁵, x₀=2 and a smooth compact amplitude equal to x² near zero, supported in a small neighborhood of zero. The old uniqueness condition is vacuous there although zero contributes at order λ^(−3/4), larger than the asserted λ^(−3/2) remainder; φ″(2)=−16. Closed support excludes this example. Tao's stationary-phase notes, Lemmas 2.7–2.8, pp.7–8, provide the source route; the existing current Tau Ceti Morse chart is reused and quantitative Jacobian/remainder work remains a gap.
2. **ES.0/short-jacobi-progression:** with d=gcd(|k|,q), the vanishing case is gcd(d,l)>1 and the surviving reduction requires gcd(d,l)=1. Merely testing d∤l misses partial common factors such as d=15, l=3. The source is Koymans–Milovic §2.5 and Corollary 2.2, pp.6–7.
3. **ES.2/perturbed-plate-kakeya:** BBFL Theorem 1.2 is on PDF p.5, not p.4. Its nearby-kernel and epsilon-loss hypotheses are retained.
4. **ES.2/linear-multilinear-conversion:** the displayed supremum requires 0<δ<1. Handle δ=1 separately using V_p(1)=1. The source endpoint defect is E37, BDG Theorem 7.6, equation (21), printed p.652.
5. **ES.3/quadratic-local-stability:** SSTT Lemma 4.4 assumes a maximal lattice and Lemma 4.5 a good prime (§4, pp.14–20). The arbitrary fixed-form target is retained as an extension, with a new precise gap for nonmaximal, bad-prime and dyadic lifting, including uniformity in the nonzero target.
6. **ES.4/heath-brown-quadratic-asymptotic:** distinguish that general fixed-Q weighted target from SSTT's maximal-lattice application. The complete Heath–Brown 1996 δ-method proof and general local lifting remain explicit inputs to acquire and match; SSTT §4.9 does not supply them on its own.
7. **ES.3/maximal-lattice-local-positivity:** add nondegeneracy and correct the claimed upstream supply. Current native local carriers and odd-prime diagonalization exist, but no exact maximal-integrality/splitting declaration was located in the inspected material. Request the extension from IntegralLattices, Part II, including p=2 and the matching half-norm convention.
8. **ES.3/markoff-pair-local-density:** remove the false absolute pair-uniform O(2^(−B)) two-adic tail. Keep fixed-pair convergence and the valuation growth δ₂=θ+O(1), together with the corrected local-table frontier. E36 identifies the defect in Ghosh–Sarnak Corollary B.15, p.53.
9. **ES.4/markoff-sector-first-moment:** the locator is Corollary 9.4 and equation (9.5), printed p.27, rather than a Lemma 9.4 on p.28. The harmonic endpoint and errors are retained.
10. **ES.4/markoff-pair-truncation:** remove the unsupported sharp intermediate bad-pair estimate. The averaged endpoint remains a goal. Its gap now requires valuation-dependent tails, an averaged comparison, control of the other local product factors and the logarithmic losses at the specified B and Φ(A). No proposed cutoff is asserted to prove that goal.
11. **ES.1/summable-torus-counting:** add the native infinite-sum/Summable companions to the baseline product references. The countable identity is an absolute-convergence extension of the finite source identity, not a theorem quoted directly from Tao's finite counting lemma.
12. **ES.4/waring-optimized-minor-arcs:** replace the fixed-width major domain in the native restricted integral by the denominator-dependent domain, and add that definition as a direct prerequisite. Assing §9.1 p.83 and §9.2 p.89 use a bound on |qα−a|, hence radius proportional to 1/q.
13. **ES.3/waring-refined-major-arcs:** use the same denominator-dependent domain and direct prerequisite so that the two optimized branches have matching complementary domains. Native Gauss/Fourier proof interfaces remain gaps.
14. **ES.3/ternary-prime-singular-series:** replace the irrelevant integral-only prerequisite by tprod/Multipliable and describe absolute factor-deviation summability, with the exceptional dyadic zero factor isolated. The normalized ternary series calculation is in Tao's 30 March 2015 post, §3.
15. **ES.4/niedermowwe-gaussian-asymptotic:** the weight is equation (1), printed p.92, not equation (2). Theorem 2.8, p.101, and the fixed-form/target normalization were checked visually.

**Added ES.1/denominator-major-arcs**, marked `addedBy: REV-ExponentialSumsAndCircleMethod`. It reuses reduced arc indices and the existing single-arc definition, and takes radius η/q at reduced denominator q≤Q. Six API entries cover membership, Q=0, Q=1, monotonicity, negative width and closedness/measurability. Four native examples distinguish empty cutoff, wraparound, denominator-two width and exact center. At Q=2, η=1/10, the point 23/40 is excluded: its distance from 1/2 is 3/40>1/20. A fixed-width mutation includes it. No additional planet was needed.

## Baseline, ownership and current upstream

All 175 cited baseline statements were opened in the actual pinned source and their hypotheses/conventions checked, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All cited names resolve at that pin. No baseline citation was removed or renamed. The indexed multiplicative Finset/product declarations deliberately supply additive companions via `Multiplicative ℂ`; generated sum, tsum and Summable names were also checked. No index modification or invented baseline entry is needed.

The reviewed ES library-audit rows were read. Exact supplier contracts were checked for CA.1's binary character arithmetic, FF.1's Gauss/power conventions, DT.1's Roth bound, SV.2's finite identities, AN's prime progression/divisor bounds and SF.5's isolated Bézout statement. They do not silently supply FF.2 correlation moments, Λ-weighted interval Siegel–Walfisz or degree-controlled projection/Fano loci; the four requests accurately state the larger needs. Composite two-adic calculations remain ES work.

The current upstream screen used TauCetiRoadmap `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine newer roadmaps and four completed roadmaps named in WORKERS were screened, with targeted declaration reads. This is a bounded screen, not an exhaustive absence claim. Four durable `upstreamNotes` record the consequences:

- Reuse `TauCeti.IsNondegenerateCriticalPoint.exists_normal_form` / `.exists_morse_chart`; only the quantitative stationary-phase adapter belongs here.
- Reuse `TauCeti.IntegralLattice.LocalCarrier`, `localIntegralForm` and the odd-prime orthogonal-basis/unit-times-prime-power theorems. Exact maximal local splitting was not located; its Part II extension belongs to IntegralLattices.
- Reuse `TauCeti.exists_contDiff_hasCompactSupport_fourier_nonneg` where applicable. This seed does not itself give BDG's quantitatively localized positive Schwartz function with prescribed square-root Fourier support.
- Equidimensional degree/fiber statements do not give the codimension-one coarea adapter. Group/stabilizer mass and representation density are different contracts and retain distinct owners.

## Source findings and provenance

All 27 inherited findings were checked at their locators. Twenty-six are confirmed. **E14 is rejected:** visual inspection of the identified author-hosted Iwaniec–Kowalski extract, printed p.271, shows fixed-field units F* already. The alleged extension-field subscript was a misreading. No collation with the published book is claimed.

Three additional findings are recorded with independent verdicts:

- **E36:** Ghosh–Sarnak arXiv v3, Corollary B.15 p.53, incorrectly gives a valuation-uniform pair tail. For a=2+2^L and b=2+2^(L+1), L≥3, the common discriminant valuation is θ=L+2. At any fixed B<L the coefficients have fixed residues modulo 2^B, while the limiting mass grows with θ. The truncated mass therefore cannot have the asserted absolute uniform error. The finite initial increments also show the growing contribution; fixed-pair convergence is preserved.
- **E37:** the BDG conversion endpoint has an empty supremum at δ=1 although its least linear constant is 1. Restrict the displayed conversion to δ<1 and handle the endpoint separately.
- **E38:** Tao's 2007 stationary-phase notes, Lemma 2.7 p.7, omit 4^n in the nth Fresnel coefficient denominator. An amplitude equal to x² near zero gives coefficient i exp(πi/4)√π/2 at order λ^(−3/2), whereas the printed rule gives four times that coefficient. The n=0 leading term used here is unaffected.

The findings identify the actual public versions read; bounded public searches found no correction to these particular new assertions, without claiming an exhaustive errata search. All source prose is in the reviewer's own words, and no excerpt field or source passage is retained. No restricted book was newly acquired or used. The 23 public mathematical source entries record the freshly read sections in `reviewReading`; inherited whole-paper or external-proof readings remain earlier-worker provenance, not fresh claims. Niedermowwe's full pp.91–110 were read visually because extracted text is corrupted. Duke–Imamoğlu–Tóth Proposition 2, pp.968–969, is a Burgess L-function application, not a replacement for the short-interval proof. The nondegenerate-curve source Theorem 1.4, PDF p.3, gives p≤4n−2 and does not settle the critical sparse-curve transfer gap.

The Tao prime-circle URL, title and date are corrected to the public 30 March 2015 post. Public PDF identities were checked by hashes; SSTT's previously absent hash and the relevant source-version metadata are recorded. No source files or extracted passages are included in this submission.

## Validation and orchestrator questions

`python3 scripts/check_blueprint.py research/blueprint/packets/ExponentialSumsAndCircleMethod.json` passes with zero errors and zero warnings. Source-issue and version checks pass. The entire revised suggested file elaborates through `lean-check` at the pins, exit 0, with exactly 624 `sorry` warnings and no other diagnostics. These are unproved signatures and examples, not completed formalisation. Exact rational arithmetic checked the four new arc tests, rejection of the fixed-width mutation, and negative-width emptiness for finite cutoffs; these finite regressions are not general proofs.

There is no unresolved contradiction in an accepted contract. Before proof closure, route the IntegralLattices Part II maximal splitting request, obtain the complete quadratic δ-method and restriction/critical-curve inputs, and repair the Markoff averaged tail at its recorded uniformity. The packet's 26 gaps give the exact affected nodes and remaining obligations. No maintainer decision is needed to accept this review; these are follow-up inputs. Package work should preserve these honest boundaries and current native imports. No upstream file, atlas output, queue or supplier packet was edited.
