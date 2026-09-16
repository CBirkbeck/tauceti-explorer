# Arithmetic Dirichlet series: link-job handoff

**Job:** `LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries`  
**Issue:** [#23](https://github.com/CBirkbeck/tauceti-explorer/issues/23)  
**Worker:** ChatGPT Pro — cgp-a70a276fbaff  
**Date:** 2026-09-16  
**Packet status:** `complete` for the catalogue-wide link screen; independent review and integration remain pending. No implementation claim is made.

## Deliverables and ownership

Only these two files belong to this submission:

- `research/blueprint/links/tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json`
- `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.md`

The accepted claim is [bot comment 5697532446](https://github.com/CBirkbeck/tauceti-explorer/issues/23#issuecomment-5697532446), responding to this session's claim 5697530611. Both comments and the claimed label were rechecked before submission; no conflicting claim or submission appeared. No git command, default-branch write, queue edit, merge, approval, issue closure or claim release was performed. Submission does not confer approval.

## Revisions and source access

Initial input: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`, tree `99ceb362bb08da148f7882570e0f924ab7886427`. Revalidated input and submission base: `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`, tree `090288d978ad46e4f85b8fecff9ceac4c2b19294`.

The small atlas extracts were accessible. For full-text searching and execution, the authorised GitHub connector downloaded the exact-commit Pages artifacts: run 35096552203 / artifact 10446790411, SHA256 `5485fb2792d05be08a477e7f04f4bae074dc227912cc84e5405cbae11621ceb1`; then run 35099069170 / artifact 10446963221, SHA256 `4e2e1610f490ae2125bc74ea94af72c1930531b80a476ace6928d6b6da4110c9`. Both digests were checked locally. The artifacts supplied the atlas, research inputs, source documents and validator; they are not Lean build environments.

The live commit comparison and local hashes showed the atlas, roadmap documents, protocols, baseline and link validator unchanged between these revisions. The refresh added three link packets and five roadmap definitions; all were incorporated into the final screen/check. The packet records the relevant file hashes. The atlas blob is `37f2add06983c206067d1104e0f40a839cc3961a`; the own-roadmap document blob is `e6e17096aebd5b071d9c96539eb7ab2caff718b8`; the validator blob is `88135efe5a74ef82e088f3fa3189893e27a7867a`.

Library pins, read from `research/blueprint/baseline.json`: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current search results were used only to discover paths; each baseline claim below was checked at its pin.

## Coverage and decisions

All **218** roadmap records were screened: 212 atlas roadmaps plus six distinct definitions under `research/blueprint/roadmaps/`. Every record has an `examined` entry. All summaries were read, including every same-area and upstream `tauceti:` roadmap. The full-text screen covered titles, descriptions and documents, using seven families: exact carrier/export names; ideal arithmetic and norm fibres; Dirichlet/Euler products and abscissae; Abel/Perron/Stieltjes/von Mangoldt; positivity and Tauberian methods; prime density/counts; and Mellin/contour/absolute-convergence tools. Both notation and spelling variants were included. There were 81 roadmap-level lexical hits; these are not 81 mathematical dependencies.

The complete ArithmeticDirichletSeries document and all eleven stages were read. Two nearby upstream documents, **Chebotarev** and **GlobalNumberFields**, were read in full, including all fourteen and twelve stages respectively. EffectiveBounds, AnalyticNumberTheory and AutomorphicLFunctionsAndLocalFactors were also read in full. Each additional plausible endpoint was read in full, including ModularForms Layers 5 and 7, ClassicalArithmeticCompletion CA.0, EllipticRegulators ER.5, SpecialValuesBirchTate B.7, BorelRegulators R.5, DirichletPadicLFunctions L0 and DeligneWeightsAndPurity DWP.2.

Negative catalogue entries mean overview/full-text screening found no exact direct dependency; they do not assert that every full mathematical document, source proof or implementation was independently reviewed. The five new Habiro/analytic-stack/Witt definitions were screened by full-text search, summaries and stage headings; their terminology did not produce a direct analytic ideal-series interface.

There are **25 links: one incoming, 24 outgoing**, with 54 literal evidence excerpts, and **seven overlaps**. GlobalNumberFields supplies the finite-order character objects. Chebotarev is the principal consumer; additional links concern common Euler interfaces in automorphic L-functions, elliptic regulators and S-integer zeta factors, plus summation/count transfer in AnalyticNumberTheory. The only rescope recommendation is **AN.0**, which should import the shared arithmetic/Euler/Perron core and retain its additional Mellin and specialized analytic work. The other six overlaps retain distinct ownership. No whole-roadmap merger is proposed.

Notable exclusions: no direct ray-class-counting prerequisite for the already available total linear bound; no extra link to BorelRegulators R.5 bypassing its automorphic supplier; no link based solely on Chebotarev Layer 6's density predicate, already supplied by Mathlib and normalized through Chebotarev Layer 3; no mandatory Wiener-Ikehara dependency for AN.2's optional contour route. Modular eigenform coefficients and higher-degree Euler factors are not completely multiplicative ideal weights. Function-field power series, p-adic interpolation factors, categorical norm fibres, Mobius transformations, Wiener chaos and Witt prime-power components are not silently identified with this roadmap's carriers.

## Own-stage input/output audit

| Layer | Inputs and exact scope | Outputs and restrictions |
|---|---|---|
| 0 | Nonzero integral ideals, finite bad-prime set, character objects where used. | General ideal arithmetic functions and zero extension; complete multiplicative versus unitary weight carriers. General norm twists need not remain unitary. |
| 1 | Finite norm fibres and absolute ideal-indexed convergence. | `normCoeff`, regrouping into Mathlib `LSeries`, trivial coefficient comparison away from zero. Converse regrouping needs individual no-cancellation hypotheses; no pointwise-product formula. |
| 2 | Finite ideal factorizations and the appropriate Euler/absolute-convergence hypotheses for analytic identities. | Ideal convolution, norm-coefficient comparison, ideal Mobius inversion, prime-power von Mangoldt/logarithmic-derivative identity. Mobius is not completely multiplicative. |
| 3 | Coprime multiplicativity, local prime-power series, finite bad set, proved convergence. | Finite/infinite Euler products and product-to-series comparison; reciprocal-product nonvanishing only where justified. Logarithms need a chosen branch on a simply connected zero-free region. |
| 4 | Canonical nonzero-ideal/height-one-prime carriers and inclusive cutoffs. | Finite cutoff sets, summatory functions, prime counts and theta, finite-change corrections. Finite modification is not exact equality of counts. |
| 5 | Counting/factorization estimates independent of downstream zeta continuation. | Crude counts, positive two-sided linear bounds, exact trivial abscissa, higher-prime-power removal and degree-above-one estimates. A quadratic upper bound is not a substitute for linear bounds. |
| 6 | The norm-indexed summation interfaces; absolute convergence for integral interchange; quantitative `HasCancellation` for continuation. | Abel/Stieltjes, theta-to-count transfers and truncated Perron. At x=1 the finite-height kernel is arctan(T/c)/pi, not 1/2. Conditional continuation does not prove character cancellation. |
| 7 | Mathlib's canonical density definitions; Euler/higher-power and all-prime normalization inputs; Abel summation. | Finite-error, union, squeeze, normalization and fibre-contraction lemmas. Natural-to-Dirichlet retains its all-prime denominator hypothesis; lower/upper predicates are bounds. |
| 8 | Nonnegative coefficients and equality with a finite actual abscissa. | Landau boundary singularity and meromorphic-order corollaries, plus generic 3-4-1 positivity. Character continuation/nonvanishing is not supplied for free. |
| 9 | Nonnegative coefficients, `LSeriesHasSum` throughout Re(s)>1, kappa>=0, separately named continuous boundary remainder on Re(s)>=1. | Wiener-Ikehara limit, including kappa=0; any needed growth bound must be derived or explicitly assumed. Totalized series values outside convergence prove nothing. |
| 10 | Exact standard prime-power coefficient, boundary package, higher-power estimate and summation. | Conditional psi/theta/pi transfers. The prime ideal theorem requires its named external boundary export; a different coefficient needs an adapter. |

These are a link audit's mathematical interfaces, not a declaration-level implementation blueprint.

## Pinned declarations actually inspected

1. [Tau Ceti EffectiveBounds/IdealCount/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean), source ranges 1-160 and 295-430, blob `1a5b1230f5fdd515978f1d58fcac64bac2c0ad53`: `NumberField.card_ideal_absNorm_le` assumes a number field and X>=1, proves finiteness of nonzero ideals of norm <=X and the upper bound X^2 2^[K:Q]. It supplies neither a linear lower bound nor the sharp convergence half-plane.
2. [Mathlib Ideal/Asymptotics.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean), whole file, blob `9a0baefb61f1e9607b483c2cd9f661771e6c7605`: `NumberField.Ideal.tendsto_norm_le_div_atTop₀` is the qualitative normalized nonzero-ideal count limit with the explicit archimedean/class-number/regulator constant. It is not a ray-class uniform power-saving theorem.
3. [Tau Ceti ArithmeticDirichletSeries/Estimates.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.lean), lines 1-210, blob `be299d00a299876de321a1021538e377c7618d13`: the actual `TauCeti.IdealCountingLinearBounds` structure has positive lower/upper constants for every x>=1, and `TauCeti.idealCount_linearBounds` constructs a nonempty such package. Its proof uses the preceding asymptotic, positivity, the unit ideal and monotonicity. Later abscissa declarations were not independently inspected in this check.
4. [Mathlib DirichletDensity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DirichletDensity.lean), lines 1-130, blob `72a3159c170207bd01e093f015bfe6ff2c193d22`: `NumberField.Set.primeIdealZetaSum`, `HasDirichletDensity` and `dirichletDensity` already exist at the pin. The predicate uses the ratio to the all-prime sum; the totalized density takes junk value zero when the limit does not exist. This does not verify every requested extension of that API.

Both Mathlib and Tau Ceti were searched for the relevant names. No library build was run, and the above is not a transitive proof audit of all declarations in those files. `implementationStatus` remains `unchecked`.

No private mathematical library, Bloch scan, Tate thesis or other cited book proof was consulted in this link job. Such references appearing inside endpoint documents are inherited source routes, not passages verified by this worker. The dependency evidence consists of the pinned repository texts and the limited source checks above.

## Cross-roadmap requests and unresolved mathematical work

### R1 — powered-Frobenius coefficients are not fixed-prime-set coefficients

**Owners:** Chebotarev Layers 11-13; ArithmeticDirichletSeries Layer 10 for any generic comparison lemma.

Chebotarev defines Lambda_C by the condition Frob(p)^j in C. The standard prime-set coefficient repeats the condition p in S at every exponent. These differ: in a cyclic group of order four, Frob(p)=g contributes its square to class g^2, not to class g. Preserve the required regression test.

Apply Layer 9's general Wiener-Ikehara theorem directly to the nonnegative Lambda_C. Then prove the declaration-sized comparison

`0 <= psi_C(x) - theta_C(x) <= primePsi K univ x - primeTheta K univ x`

and identify theta_C with the standard theta of the Frobenius prime set. Combine the all-prime tail divided by x tending to zero with psi_C(x)/x tending to delta, obtaining theta_C(x)/x tending to delta, and only then apply `primeCount_asymptotic_of_primeTheta`. This avoids assuming an equality of the two psi functions or constructing an ill-typed `PrimeBoundaryRemainder K S delta`. The proposed links deliberately supply only the exact general theorem or applicable subtransfer. The weighted residue-degree and finite-prime estimates in Chebotarev 11.3 remain separate obligations.

### R2 — finite Euler deletion changes the zeta residue

**Owner:** Chebotarev 12.1.

The text says deleting finitely many nonzero Euler factors leaves the same residue. For

`P_T(s) = product_(p in T) (1 - N(p)^(-s))` and `L_1(s)=zeta_K(s) P_T(s)`,

one has `Res_(s=1) L_1 = P_T(1) Res_(s=1) zeta_K`, generally not the same residue. For example, over Q deleting p=2 multiplies the residue by 1/2. The positive factor preserves the simple pole. What remains equal to one is the residue of the **negative logarithmic derivative**. If zeta_K(s)=h(s)/(s-1), with h analytic and h(1) nonzero, then

`-L_1'/L_1 = 1/(s-1) - h'/h - P_T'/P_T`.

Replace the false residue sentence by these precise identities. This is a local algebraic correction; it does not by itself establish a zero-free boundary line.

### R3 — at-one nonvanishing does not give the required whole-line boundary

**Owner:** Chebotarev Layers 5 and 12.

The global document asks for the whole Re(s)=1 boundary, but Layer 5's named exports highlight `analyticAt_one` and `ne_zero_at_one`; Layer 12 then needs continuity on the whole closed half-plane. Export the actual character-family nonvanishing on every point 1+it and the resulting continuous logarithmic-derivative remainder, including the separate trivial-character pole. An at-one theorem alone is insufficient. The chosen-log and 3-4-1 infrastructure does not remove this consumer obligation.

### R4 — identify the external prime-ideal boundary producer

**Owner:** orchestration and the analytic L-function owner, once assigned.

ArithmeticDirichletSeries 10.4 requests `TauCeti.LFunctions.primeIdealVonMangoldtBoundary : PrimeBoundaryRemainder K Set.univ 1`. No roadmap with the identifier `LFunctions` or `ZerosOfLFunctions` was found in the 218-record catalogue. This is a catalogue/search result, not a proof that the declaration is absent from every repository. Automorphic continuation and a one-sided residue do not supply the requested whole-line logarithmic-derivative boundary. Do not assign that contract to AL.1 merely because it proves continuation. Keep the own prime ideal theorem conditional until an exact producer is agreed. Chebotarev's denominator instead comes from its own 12.2 plus the generic transfers, so no reverse dependency to this conditional theorem is added.

### R5 — the density pin-update instruction is obsolete

**Owner:** ArithmeticDirichletSeries 7.1.

Replace the instruction to update the repository pin for the three density definitions by direct reuse of the already pinned Mathlib definitions listed above. Audit the requested extension lemmas separately. Neither a second density carrier nor a pin change is justified by the current text.

### R6 — reuse counting theorems at their actual strengths

**Owners:** ArithmeticDirichletSeries 5, GlobalNumberFields 3, EffectiveBounds 1.

Reuse the pinned linear-count package and the separate explicit quadratic bound. The uniform ray-class asymptotic and its nontrivial-character cancellation remain genuinely stronger work in GlobalNumberFields. Do not introduce a ray-class or zeta-continuation dependency into the total-bound/exact-abscissa proof.

### R7 — finite changes are corrections, not exact equality

**Owners:** ArithmeticDirichletSeries 4 and affected Chebotarev cutoff comparisons.

For finite symmetric difference T, the absolute difference of prime counts is at most #T. Theta differs by at most the finite sum of log norms. For nonnegative weights on a finite set the eventual correction is a constant, not generally zero. Finite-prime psi contributions are O(log x). State those inequalities and normalized-limit invariance explicitly. In an exact contraction identity, use the filtered prime sets after exclusions; restore unfiltered counts only with the stated finite-error term.

### R8 — include delta=0 using limits

**Owners:** ArithmeticDirichletSeries 6 and 10; consumers using zero-density specializations.

State the general transfer as `theta(x)/x -> delta` implying `pi(x)/(x/log x) -> delta` (and the appropriate Li-normalized version), including delta=0. Do not interpret `theta ~ delta*x` or `pi ~ delta*Li` at delta=0 as a ratio to the zero function. Positive-density ratio-asymptotic notation is a corollary, not the zero-density formulation.

These requests are remaining mathematical/ownership tasks in the endpoint roadmaps, not unfinished catalogue scanning. No files owned by those roadmaps were edited.

## Validation and integration instructions

Executed in the revalidated snapshot:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json
25 links, 7 overlaps, 218 examined
0 error(s), 0 warning(s)
```

A separate Python scratch audit checked exact catalogue coverage, all 54 evidence strings literally against the endpoint descriptions or owner documents, endpoint existence, duplicate pairs against the atlas and all 15 other link packets, and reverse reachability after conservatively adding the numbered internal stage chains for ArithmeticDirichletSeries, Chebotarev and GlobalNumberFields. All passed. The added chains were only a scratch over-approximation for detecting cycles; no atlas edges were edited. Critical-input hashes and both artifact digests were also checked. JSON parsing succeeded.

These checks establish structural consistency, not mathematical correctness. The link packet must still receive the protocol's independent review. Review every inferred automorphic product-to-series edge at its stated number-field scope, preserve R1's coefficient distinction, and apply R2/R3 before treating the weighted analytic branch as a closed proof. No Lean compilation, remote PR check, independent approval or integration is claimed by this handoff; any subsequent CI result belongs in the submission thread.

The screen has no remaining catalogue segment. Re-run the validator against the integration base and any intervening link packets before merging accepted links. Keep this submission's issue associated with the durable PR; do not release it merely to make the worker available.
