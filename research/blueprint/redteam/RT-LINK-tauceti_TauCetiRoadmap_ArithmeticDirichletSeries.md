# Red team: Arithmetic Dirichlet series link map

**Result:** complete; no additional evidenced finding. This is a clean result for the accepted link map, with the limitations below. It does not close the map's existing requests or certify the analytic endpoints.

**Worker:** Codex — `codex-J6LwjP`, 2026-09-30. **Issue:** [#4353](https://github.com/CBirkbeck/tauceti-explorer/issues/4353). **Input revision:** `155bf2c19ef277a7ec4361ae5b4e51911cf44211`. Neither the original worker (`cgp-a70a276fbaff`) nor the independent reviewer (`codex-hjdg0j`) is this session.

## Input and scope

Read the complete [accepted map](../links/tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.json), [original handoff](../handoff/LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.md), [independent review](../reviews/REV-LINK-tauceti_TauCetiRoadmap_ArithmeticDirichletSeries.md), and the map's `requestReview`. The last supersedes several construction requests in the historical handoff. Read the entire ArithmeticDirichletSeries README, including Layer 4, and the reviewed library-coverage records for all eleven layers. Read every distinct external endpoint description (24) and the owner-document passages supplying evidence.

All 54 evidence strings were checked as literal substrings of the physical files identified by the endpoint roadmap's `sourcePath`, as well as against the atlas descriptions/documents. All passed. This verifies quotations; the mathematical interface checks below are separate.

In this report ADS means ArithmeticDirichletSeries, CH means Chebotarev, GN means GlobalNumberFields, AN means AnalyticNumberTheory and AL means AutomorphicLFunctionsAndLocalFactors. Numbers in the first column are one-based positions in the map's `links` array. Stage numbers are those of the authoritative README, not inferred proof dependencies.

## All links

| # | Edge | Attack and disposition |
|---|---|---|
| 1 | ADS.0 → CH.4 | The finite-order character produces a degree-one unitary weight with zero at excluded primes. Frobenius and multiplicative extension remain the consumer's work; the edge does not put arbitrary Artin coefficients in a completely multiplicative carrier. |
| 2 | ADS.2 → CH.11 | The logarithmic derivative includes prime powers. The consumer filter uses the powered Frobenius class, not membership of the underlying prime in a fixed class at every exponent. The reason preserves this distinction. |
| 3 | ADS.6 → CH.5 | Continuation is conditional on the uniform ideal partial-sum cancellation estimate. Nontrivial characters and the separate trivial-character pole are distinguished. No cancellation proof is imported from Abel summation alone. |
| 4 | ADS.8 → CH.5 | Landau requires the actual finite abscissa and nonnegative coefficients; the generic positivity input does not itself prove the character-family boundary theorem. |
| 5 | ADS.9 → CH.12 | Wiener–Ikehara is applied to the real nonnegative Frobenius coefficient, with a named continuous remainder on the whole closed half-plane. A signed character coefficient or just nonvanishing at one cannot replace this input. |
| 6 | ADS.10 → CH.11 | The all-prime higher-power majorant is valid for the powered filter. The reviewed reason correctly reuses the already implemented comparison and does not identify the two different psi coefficients. |
| 7 | ADS.10 → CH.13 | Only theta-to-count transfer is consumed after the consumer obtains its powered-psi limit and tail comparison. |
| 8 | ADS.10 → CH.14 | The all-prime count follows from CH.12.2 and generic transfers. No reverse use of ADS's externally conditional prime ideal theorem is introduced. |
| 9 | ADS.3 → CH.4 | The cyclotomic degree-one Euler product is used in its proved absolute-convergence region. |
| 10 | ADS.3 → CH.5 | A logarithm requires the chosen simply connected zero-free region. The edge does not extract nonvanishing on the boundary from absolute convergence on its right. |
| 11 | ADS.4 → CH.2 | Finite exceptional primes give finite errors in counts; the reason does not assert equality of unfiltered counts. |
| 12 | ADS.7 → CH.2 | Finite symmetric difference preserves density with the necessary all-prime normalization. |
| 13 | ADS.7 → CH.3 | Logarithmic normalization needs the Euler product and bounded higher-prime-power contribution, in addition to the zeta-pole input. It is not the definition of density. |
| 14 | ADS.7 → CH.9 | Finite union/squeeze transfers are analytic infrastructure. The cyclic-subgroup arithmetic and fibre calculation stay in CH.9. |
| 15 | ADS.7 → CH.10 | Degree-one constant-fibre contraction uses the consumer's arithmetic fibre bound and discarded-prime estimates. |
| 16 | ADS.7 → CH.14 | Natural-to-Dirichlet is one-way and retains its all-prime denominator hypothesis; no converse is asserted. |
| 17 | GN.9 → ADS.0 | GN supplies the finite-order character object. The ideal-weight adapter and its excluded-prime support remain explicit. Arbitrary complex norm twists are not silently unitary. |
| 18 | ADS.3 → AL.1 | Number-field GL1 product/series comparison is a valid common input. Tate integrals, normalization, continuation and functional equation remain with AL.1. |
| 19 | ADS.3 → AL.2 | Higher-degree local polynomials use coprime-multiplicative Euler-product data, not the completely multiplicative degree-one weight. |
| 20 | ADS.3 → AL.4 | Number-field local-factor series need the specified eigenvalue bounds and multiplicativity. Neither a function-field adapter nor continuation follows. |
| 21 | ADS.3 → AL.5 | Finite-factor comparison holds with the stated factors and convergence hypotheses; it is not unrestricted cancellation at their zeros. |
| 22 | ADS.6 → AN.0 | The finite-height Perron kernel and its error are shared. A sharp-cutoff identity without endpoint/error terms is not imported; the additional Mellin theory remains separate. |
| 23 | ADS.10 → AN.2 | Theta-to-count transfer specializes over Q to arithmetic progressions. It supplies no modulus-uniform estimate or zero-free region and does not force the optional contour route through Wiener–Ikehara. |
| 24 | ADS.3 → ER.5 | The CM Hecke Euler product proves nonvanishing at two once the actual coefficient growth and normalization establish convergence there. The regulator formula and character construction do not follow from the generic product theorem. |
| 25 | ADS.3 → B.7 | The S-finite-factor identity is first proved in the convergence half-plane. Meromorphic continuation to the special value at minus one is a separate supplier obligation. |

The own-stage checks also included nonzero ideals and zero extension; finite norm fibres and the failure of regrouping to preserve pointwise products; ideal convolution versus complete multiplicativity; inclusive cutoffs; the finite Perron value `arctan(T/c)/π` at the endpoint; and normalized zero-density limits rather than ratios to the zero function. None produces a new defect in these reasons.

## Overlaps and requests

All seven overlap decisions remain justified at their stated scope:

1. ADS.5/GN.3: a positive total linear bound is weaker than a uniform ray-class main term with a quantitative error. Import the former; retain the latter.
2. ADS.5/EffectiveBounds.1: the explicit quadratic upper bound is distinct from a qualitative positive two-sided linear package. Both exist at the pin.
3. ADS.2/CA.0: integer arithmetic convolution and ideal convolution use different carriers; the existing `normCoeff_convolution` is the comparison, not a second integer convolution.
4. ADS.0–3,6/AN.0: the shared ideal-series/Euler/Perron core should be consumed. Additional Mellin work is not discharged by it.
5. ADS.9–10/AN.2: generic Tauberian/count transfer is separate from the specialized zero-free estimates and optional contour proof.
6. ADS.3/ModularForms.7: Hecke-normalized degree-two local factors are not completely multiplicative ideal weights. Their specialization/migration does not justify merging the owners.
7. ADS.8/DWP.2: positivity for an ordinary power series in the function-field argument is not immediately the number-field Dirichlet-series abscissa theorem. A comparison would need its own exact contract.

R1 is a **reuse** obligation after review: the powered coefficient, inclusive summatory identity, nonnegative tail, domination and little-o estimate are already present. Fresh source reads confirm this. R2's finite-Euler-deletion correction is still substantive: deleting the prime two over Q multiplies the zeta residue by one half, whereas the negative logarithmic derivative keeps residue one. R3 still needs the entire boundary line, not just the point one. R4 explicitly leaves the exact external `primeIdealVonMangoldtBoundary` supplier unresolved. R5 correctly replaces the stale pin-update instruction with existing Mathlib density definitions. R6 preserves the two distinct counting bounds. R7 requires finite-error terms rather than exact unfiltered equalities. R8 requires normalized limits including density zero. These are already recorded in the accepted target, so they are not new red-team findings.

## Independent omission search

The current catalogue contains 221 distinct roadmap records and 2028 stages before build-time refinements. Searched their titles, descriptions and README texts for exact ADS carrier/export names and families covering Dirichlet series/density/convolution, Euler products, ideal counting, Möbius, logarithmic derivatives, Abel/partial summation, Perron, Landau/abscissa, Wiener–Ikehara/Tauberian methods and prime counting. Triaged all 33 roadmap hits. A lexical hit is not a dependency, and a negative result is not a full proof audit of that roadmap.

Beyond the existing endpoints, read the relevant complete descriptions in BorelRegulators R.5, DirichletPadicLFunctions L0, FunctionFieldArithmetic FA.5, GeometryOfNumbersAndQuadraticArithmetic GN.3, MetaplecticAutomorphicForms MP.7, RankZeroOneBSD BSD.0/BSD.9, WeilConjectures WC.1, EllipticCurves Layer 7 and NumberFieldArithmetic Layer 2. The remaining hits concerned unrelated uses of Euler characteristic, divisor counts, Perron's PDE method, Coleman logarithmic derivatives or already inspected owners. In particular:

- BorelRegulators and the p-adic L-function germ comparison explicitly consume AL.1. Adding a shortcut would not supply continuation or a germ from a raw totalized series.
- BSD.0 obtains the actual analytic function through modular/automorphic comparison; MP.7's metaplectic kernels and double-series application are not a generic one-variable ideal-series theorem. BSD.9 needs certified Mellin/modular-symbol estimates.
- Closed-point-degree power series, rationality over finite fields and ordinary Möbius inversion are not automatically the number-field ideal API. The mass-formula Euler product likewise needs its own factor/convergence comparison before an ADS edge is justified.
- The accepted sibling Chebotarev link map already supplies ADS.5 → CH.10. It is not a missing graph connection merely because this map's historical array does not repeat it.
- Screened the six blueprint files containing ADS references. The four partial AL supplier requests match links 18–21. EllipticRegulators' accepted partial packet requests the ideal series/carrier for its two ER.5 nodes; link 24 already supplies the stronger Euler-product interface, so no new consumer stage is uncovered. SpecialValuesBirchTate cites the expected existing series/Euler-factor infrastructure.
- The partial ArithmeticStatistics packet's Wright-theorem gap involves a counting asymptotic with a logarithmic factor and a different pole order/location. Its informal Tauberian reference does not establish applicability of ADS.9's stated simple-pole theorem. It remains a decomposition gap, not evidence for a new unconditional ADS.9 edge.
- The newer, partial and unreviewed AN.4 packet now names Hecke nonvanishing on the line one and Dedekind continuation/residue. These are useful leads for R4. They do not yet export the exact `PrimeBoundaryRemainder` adapter with logarithmic-derivative series identification and continuity at the pole removed. This review does not promote those partial nodes or declare R4 solved.

Also checked the existing ADS-related audit and Chebotarev red-team records as leads, without treating unverified findings as primary evidence. No additional supported missing link was established.

## Fresh pinned statement checks

Read the following seven source files at the immutable pins on 2026-09-30. The scope is the listed definitions/theorem statements and their surrounding hypotheses, not every proof or a complete library inventory.

| Pinned source | Statements and consequence checked |
|---|---|
| [Mathlib DirichletDensity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DirichletDensity.lean) | Lines 51–113: `NumberField.Set.primeIdealZetaSum`, `HasDirichletDensity`, `dirichletDensity`, finite-set bound and junk-value distinction. The predicate is the ratio to the all-prime sum. |
| [Mathlib Ideal/Asymptotics.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean) | `NumberField.Ideal.tendsto_norm_le_div_atTop₀`, lines 125–147, with its number-field hypotheses: the nonzero ideal-count asymptotic and explicit constant, not uniform ray-class cancellation. |
| [Tau Ceti Estimates.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.lean) | Lines 114–190 and 400–435: `TauCeti.IdealCountingLinearBounds`, `idealCount_linearBounds`, `abscissaOfAbsConv_normCoeff_one`, `LSeriesSummable_normCoeff_one_iff`. Both positive constants apply for every x≥1; exact absolute abscissa is one. The count proof uses the ideal-count limit and positivity, not the pole theorem. This does not assert absence of the pole file from the import closure. |
| [Tau Ceti EffectiveBounds/IdealCount/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean) | `NumberField.card_ideal_absNorm_le`, lines 395–413: finiteness and the explicit bound X²·2^[K:Q] for X≥1, not the positive linear lower bound. |
| [Tau Ceti Convolution.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution.lean) | Lines 208–262 and 418–445: ideal convolution, associativity, delta identity, `normCoeff_convolution` and its power version; multiplication on the resulting arithmetic functions is Dirichlet convolution. |
| [Tau Ceti Moebius.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ArithmeticDirichletSeries/Moebius.lean) | Lines 92–112, 133–159 and 277–320: ideal Möbius, vanishing on higher prime powers, coprime multiplicativity and `convolution_one_eq_iff`. Möbius is not a completely multiplicative ideal weight. |
| [Tau Ceti Chebotarev/PrimeCounting/VonMangoldt.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean) | Lines 55–95, 196–247 and 310–367, including number fields and `IsGalois K L`: `frobeniusPrimePowerSet`, the weight/coefficient, nonnegativity, `frobeniusPsi_eq_sum_range`, tail identity, `frobeniusTheta_le_frobeniusPsi`, domination and little-o theorem. These confirm the accepted correction to R1. |

The reviewed library coverage was used to identify other planned versus existing interfaces. Claims beyond the seven fresh reads are not represented here as newly audited declarations. No private source, whole-paper proof or Lean compilation was used to certify the analytic assertions.

## Structural checks and limits

`check_links.py` reports 25 links, seven overlaps, 218 historical examined records, zero errors and zero warnings. Read-only `build.assemble(require_distances=False)` succeeds with 2840 stages and 8007 edges, and contains all 25 links. A scratch union of its edges, declared `requires`, and all 36 research link packets has 8118 distinct edges; none of the 25 target edges has a reverse path. No artificial linear ordering of all ADS stages was added.

The red-team JSON checker, swarm intake `check-files` for these two deliverables, and `git diff --check` pass. Only the assigned report and result are changed. No Lean file is part of this job, and none was compiled.

The clean result means that this attack did not establish an additional error, omission or duplicate beyond the target's own reviewed requests. It does not mean that the whole atlas is closed, the partial AN.4 work is accepted, a raw `LSeries` is its analytic continuation, or the boundary supplier and Chebotarev analytic obligations have been implemented.
