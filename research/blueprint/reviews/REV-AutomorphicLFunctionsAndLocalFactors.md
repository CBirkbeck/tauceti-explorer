# Independent review: Automorphic L-functions and local factors

Job `REV-AutomorphicLFunctionsAndLocalFactors`, issue #363. Reviewer: Codex, session `codex-Kwe2i6`. Date: 2026-10-07. This session did none of the blueprint work reviewed here.

**Verdict: needs_changes.** This is a completed independent review, not a checkpoint. Clear errors have been corrected in the permitted packet and suggested file. The reader still contains false mathematical claims and disagrees with those corrections. The issue does not authorize editing the reader, so an explicit reader revision is required before acceptance. Open, honestly recorded proof/supplier refinements do not themselves justify rejection.

## Counts and scope

All **120 nodes** checked: **72 verified, 48 corrected, 0 added, 0 unverifiable**. No node IDs or planet names changed. There are 29 definitions, 2 constructions, 14 lemmas, 67 theorems and 8 comparisons; 137 API entries and 118 unit tests. All31 definition/construction nodes have at least three discriminating planned tests. There are 68 baseline entries, 32 public sources, 31 requests and 15 gaps. All120 implementation statuses remain `unchecked`.

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| AL.0 | 31 | 6 | planned |
| AL.1 | 28 | 6 | planned |
| AL.2 | 15 | 6 | planned |
| AL.3 | 35 | 6 | planned |
| AL.4 | 5 | 2 | planned |
| AL.5 | 6 | 3 | planned |

All six stage targets and routed-source targets have target-level nodes; this review does not split proofs into lemma-level microtasks. The packet remains `complete`, meaning one completed planning pass. No stage is `closed` or `source_decomposed`. G15 is included in the remaining lists for AL.2/AL.3/AL.4. Planet counts stay within six per layer; the selected definitions and named results are central source objects rather than citation fragments.

## Mathematical corrections

1. **Jacquet’s realization space.** Theorem2.6 realizes members of `L(σ⊗σ′)`, defined on pp.5–6: an entire multiple of the L-factor must be bounded on each finite vertical strip after multiplication by a polynomial clearing the L-factor’s poles there. Entire `h` alone is insufficient. Ordered inducing exponents are required. Unequal rank uses one element of the completed projective tensor product; equal rank uses a finite sum with Schwartz functions. Theorem2.7 uses irreducible induced inputs and adjacent/equal ranks for K-finite realization; Remark2.8 does not prove the reducible extension. The packet and full-statement omission now retain all these restrictions. The remaining induction proof leaves stay in G7.
2. **Multiplicative Haar scaling.** With the additive Fourier measure fixed, replacing `d×x` by `c d×x` multiplies both `z` and `z₀=z/L` by `c`. It does not change the fixed Euler factor. The common scalar cancels from epsilon/gamma ratios, not from `z₀`. Standard vectors with normalized value1 must be divided by `c`; equivalently multiply the finite standard vector by `N(d_v)^(1/2)` under Tate’s convention. All duplicated AL.1 hypotheses and the completed-L/global-integral API have been corrected. A new API and native-measure regression check this directly.
3. **Completed tensors.** Finite sums of factorizable functions are dense in the adelic Schwartz space; they do not algebraically span a completed tensor product with several archimedean factors. The global Tate proof now requires continuous extension using Schwartz-seminorm integrable bounds. Pure-tensor Fubini alone cannot establish the general claim.
4. **Archimedean continuation.** The Taylor/subtraction argument precedes local uniqueness and the local functional equation. The optional proof through that later equation was circular and has been removed. For arbitrary test functions in the Weil normal forms, initial convergence is `Re(s)>a` over R and `Re(s)>(a+b)/2` over C. The special Gaussian-polynomial test cancels these exponents and has its own larger convergence region. The corrected parity and derivative orders in the real residue statement are retained.
5. **Finite Fourier inversion.** Removed the edge from finite inversion back to local inversion. Finite period-level decomposition, integrable coset transforms, indicator inversion and self-dual volumes give the finite proof; the local theorem then imports it and the archimedean comparison. The resulting internal prerequisite graph is acyclic.
6. **Arithmetic character inputs.** Trace-dual inverse-different arithmetic belongs to LocalFieldsRamification Layer3; number-field completions and the full adele diagonal belong to GlobalNumberFields Layers0/5. Composition of additive characters does not supply continuity, trace transitivity or the conductor formula. These inputs are now direct prerequisites and an exact supplier request. The self-duality target is restricted to number-field completions; the proof supplied does not cover every positive-characteristic local field.
7. **Actual supplier contracts.** AA.0/local-normalized-haar supplies additive Haar on a completion, not multiplicative Haar on GL_n. AF.3/maass-cusp-forms supplies the Maass input, while AF.2/flath-factorization supplies the restricted tensor decomposition. AF.3’s compact unipotent quotient is used explicitly. SR.4’s Satake carrier still needs Borel’s uniform weight bound for arbitrary `r`. Local diagonal GL_m period multiplicity one is a separate theorem from Whittaker uniqueness. These near misses now have precise requests and G15 rather than a false fine-node import.
8. **Function-field/entire-function boundaries.** GS.6’s finite-order-central-character scope is reached by a unitary degree twist, with the twist undone by rotating the L-variable. FA.5’s tensor cohomology, degree and alternating-duality inputs require extension beyond its finite-Galois Artin scope. Current AN.2 is PNT, so the Hadamard theorem is a requested AnalyticNumberTheory extension, provisionally linked there; it is not an already supplied theorem. G11/G14 retain these boundaries. No second arithmetic, representation, cohomology or Hadamard theory is constructed in AL.

## Citations corrected

Every node’s locator and short excerpt was checked against its public source, including image inspection where text extraction was inadequate. The source PDF bytes agree with the packet hashes. Full proof interiors explicitly left unread in G4–G10/G12 are not claimed proved by this review; their statements and source scope were checked, and the missing proof leaves remain named.

- Replaced seven Tate excerpts consisting solely of `0` with the actual character-triviality sentence. The generic bilinear/additive-subgroup statements are routine extensions of the lattice calculation, not Tate’s literal general statements.
- Tate §4.4 physical p.49 now quotes the class conditions or definition, rather than a sentence on p.52. LemmaB quotes the literal factor-group fragment. The epsilon-factor locator includes pp.18–19. Local self-duality and the inverse-different calculation cite §2.2 on physical p.10.
- Humphries’ Godement–Jacquet integral and convergence use §2.3.2, formula(2.3), pp.5–6, rather than the Rankin–Selberg formula(2.1).
- Borel uses the literal `Euler products`, local-factor heading, and §14.4(a) standard-representation passage. Exterior-power compatibility cites §16.1 p.55 and BCGP §1.8.25 p.16; it remains conditional on an established transfer.
- Thorner–Zaman’s order-one wording is on physical p.9, printed p.1141. The CM quadratic root number1 follows from the completed Dedekind-zeta quotient, not a claim that every Hecke root number is1.
- Jacquet’s locator now includes the growth-space definition and Theorems2.6–2.7/Remark2.8. Yu’s scalar-normalization excerpt is the literal `fonction L de paire`. Zhang’s partial Fourier passage is §11.1 p.933. Chenevier–Taïbi uses its actual additivity wording. Cogdell’s mirabolic Poisson locator includes pp.4–5.
- Gross–Zagier’s Bessel–Laplace integral is an unnumbered display in the proof of Proposition(6.2), printed p.299, physical p.76. It is not itself equation(6.2). The positive-real parameter extension is a routine rescaling of the source’s integer case.

## Baseline verification

Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`. All68 declarations’ actual statements were read at these pins, rather than inferred from index hits. Mathlib source bytes in the existing build match the pin. Tau Ceti citations were read from the pinned tree; the suggested file imports Mathlib only, so compilation does not rely on a newer Tau Ceti checkout.

No baseline declaration was removed or replaced. Three module paths gained `.lean`: ParametricIntegral, MellinTransform and MellinInversion. The `MeasureTheory.Measure.IsHaarMeasure` description was corrected: it supplies a predicate, not uniqueness of invariant continuous distributions on the punctured line. G3 now explicitly requires that analytic proof. A repeated `Matrix.charpolyRev` prerequisite was removed.

Important hypothesis/convention checks: native VectorFourier uses the negative kernel; positive source kernels require reflection, and complex trace also requires factor2. `ZMod.toCircle`/injectivity require nonzero modulus. Native compact support concerns the closure of ordinary support. Parametric integration needs domination and derivative hypotheses, not mere formal differentiation. Schwartz Fourier is archimedean, not finite-place Bruhat Fourier. Gamma_C differs from Kudla’s Weil normalization by π. Dedekind’s native residue theorem is real and one-sided, not complex continuation. Meromorphic divisors use local orders, not totalized point values. Tau Ceti’s cusp-form L-series results use the positive-weight classical cusp-form hypotheses; they do not supply general automorphic continuation.

The confirmed baseline entries (module and precise provided statement remain in the packet) are:

| Declaration | Declaration | Declaration |
|---|---|---|
| `mathlib:AddChar` | `mathlib:AddChar.map_zero_eq_one` | `mathlib:AddChar.map_add_eq_mul` |
| `mathlib:AddChar.toAddMonoidHom` | `mathlib:AddChar.compAddMonoidHom` | `mathlib:VectorFourier.fourierIntegral` |
| `mathlib:VectorFourier.fourierIntegral_congr_ae` | `mathlib:VectorFourier.fourierIntegral_const_smul` | `mathlib:VectorFourier.fourierIntegral_comp_add_right` |
| `mathlib:VectorFourier.fourierIntegral_convergent_iff` | `mathlib:VectorFourier.fourierIntegral_continuous` | `mathlib:LinearMap.flip` |
| `mathlib:LinearMap.compl₂` | `mathlib:IsLocallyConstant` | `mathlib:IsLocallyConstant.isOpen_fiber` |
| `mathlib:IsLocallyConstant.iff_exists_open` | `mathlib:generalized_tube_lemma` | `mathlib:isClosed_iInter` |
| `mathlib:isClosed_eq` | `mathlib:MeasureTheory.integral_congr_ae` | `mathlib:MeasureTheory.integral_indicator_const` |
| `mathlib:HasCompactMulSupport` | `mathlib:HasCompactMulSupport.of_mulSupport_subset_isCompact` | `mathlib:ZMod.toCircle` |
| `mathlib:ZMod.injective_toCircle` | `mathlib:ZMod.dft` | `mathlib:ZMod.dft_eq_fourier` |
| `mathlib:Real.fourierChar` | `mathlib:Subgroup.zpowers` | `mathlib:PontryaginDual` |
| `mathlib:Complex.Gammaℂ` | `mathlib:Complex.Gammaℝ` | `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one` |
| `mathlib:Complex.integral_cpow_mul_exp_neg_mul_Ioi` | `mathlib:ContinuousMonoidHom` | `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub` |
| `mathlib:Distribution.dsupport` | `mathlib:MeasureTheory.Measure.IsHaarMeasure` | `mathlib:NumberField.Units.regulator` |
| `mathlib:NumberField.Units.torsionOrder` | `mathlib:NumberField.classNumber` | `mathlib:NumberField.dedekindZeta_residue` |
| `mathlib:NumberField.discr` | `mathlib:Real.tsum_exp_neg_mul_int_sq` | `mathlib:SchwartzMap` |
| `mathlib:SchwartzMap.fourierTransformCLM` | `mathlib:TemperedDistribution` | `mathlib:TemperedDistribution.delta` |
| `mathlib:completedRiemannZeta_eq` | `mathlib:completedRiemannZeta_one_sub` | `mathlib:completedRiemannZeta_residue_one` |
| `mathlib:fourierIntegral_gaussian` | `mathlib:gaussSum` | `mathlib:gaussSum_mul_gaussSum_eq_card` |
| `mathlib:mellin` | `mathlib:tsum_geometric_of_norm_lt_one` | `mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le` |
| `mathlib:mellin_differentiableAt_of_isBigO_rpow` | `mathlib:mellinInv_mellin_eq` | `mathlib:Matrix.charpolyRev` |
| `mathlib:MeromorphicOn.divisor` | `mathlib:MeromorphicOn.divisor_fun_mul` | `mathlib:MeromorphicOn.divisor_fun_inv` |
| `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | `tauceti:CuspForm.abscissaOfAbsConv_qExpansion_coeff_le` | `tauceti:CuspForm.LSeries_qExpansion_coeff_eq` |
| `tauceti:CuspForm.hasEntireExtension_qExpansion_coeff` | `mathlib:meromorphicOrderAt_mul` | |

The reviewed library audit does not provide full Tate distributions, finite-place Schwartz Fourier inversion, Bessel order derivatives, general Godement–Jacquet/Rankin–Selberg constructions, global automorphic quotient analysis or general LLC compatibility. Native Fourier, matrices, meromorphic functions, L-series and the existing cusp-form specialization are imported and adapted; their generic theories are not re-planned as new AL results.

## Suggested Lean file and tests

The file elaborated using `lean-check research/blueprint/suggested/AutomorphicLFunctionsAndLocalFactors.lean` at the pinned Mathlib build. Exit status0, **183 warnings, all `declaration uses sorry`; no errors or other warnings**. At least108 GB was available before each compile. No language server, Lake build/update/cache download or new project was started. This is elaboration of suggested statements, not formalization of their proofs.

Changes to the native examples: the rank-two GJ shift evaluates the integral; rank-one/opposite Whittaker characters evaluate the supplied representation action; the two-by-one RS example evaluates the actual local factor; the L-group tensor counterexample evaluates matrix factors; exceptional zeros evaluate the actual finite Euler correction; the scalar pole example evaluates its numerator/denominator pair; the character-scale test compares actual measures. The extra local-zeta measure test detects the normalization error.

Removed the vacuous `P.eval0=1 ⇒ P.eval0=1` general-normalization theorem. A genuine unramified product constant-term theorem is suggested instead, and the full GJ-generator normalization is a named omission. The normalized-period half-plane scalar inequality is not a representation-level convergence test; the full temperedness and continuation tests are now explicitly named omissions, while actual `NormalizedRsPeriod` evaluation is tested on supplied scalar families. Missing conditions are not replaced by dummy Prop fields. Conversely, the native divisor carrier already exists: the finite-polynomial index/divisor comparison now has a genuine Lean signature, replacing its false unavailable-carrier omission.

## Source issues independently adjudicated

All six entries gained their required review object with `by: REV-AutomorphicLFunctionsAndLocalFactors` and verdict `confirmed`:

| Entry | Independent check and version boundary |
|---|---|
| E1 | Published Kudla p.110: induction needs N₀ dividing M, not M dividing N₀. Primitive modulo3 inducing modulo6 is a counterexample to the printed direction. |
| E2 | The public preprint has the corrupted attribution; published p.110 correctly credits Ramakrishnan and Valenza. The finding is restricted to the preprint. |
| E3 | Published p.128 must reference (3.23), Corollary3.7 and Proposition3.8, rather than the printed mismatched local-factor references. |
| E4 | Published pp.121–122: Γ_R(s) has poles at negative even integers; for ω=x^(−a), the residue derivative order is a+r. The printed combination fails for a=1. |
| E5 | Tate 1950 scan p.26 prose contradicts the explicit positive different-norm exponent on p.24 and its own following expression. The 1967 reprint is uncollated. |
| E6 | Published Kudla p.126’s unrestricted tensor-factorization converse fails for a rank-two sum of independent evaluation tensors. It is valid after restricting to the eigenline or assuming decomposability; forward normalized products are unaffected. |

No new mistake in a paper is inferred from a packet’s faulty paraphrase or citation. Earlier source corrections attributed to the Yun–Zhang/Yu extraction jobs retain their provenance and corrected hypotheses.

## Assigned red-team findings and outgoing consumers

| Finding | Review result |
|---|---|
| RT-AREA-automorphic-1/2 | Archimedean GL_n classification/LLC is an explicit AF.1/AF.1b input. General unitarity, residual/isobaric classification and solvable base change are not derived from GL₂ transfer. G9/G13 retain missing proof/supplier scope. |
| RT-AREA-automorphic-1/8 | AL.3 includes global Whittaker coefficients, cuspidal Fourier expansion, mirabolic Eisenstein continuation and unfolding. Cuspidal decay and actual quotient measures are direct imports. Dense archimedean tensors and AF.2 Flath factorization are now explicit. |
| RT-AREA-automorphic-1/10 | Local representation estimates, Schwartz domination, global decay and adelic measures are distinguished from the integral definitions. The additive-versus-GL_n measure near miss is repaired through the G15 request. General growth/source leaves remain G5–G8. |
| RT-AREA-automorphic-1/13 | AL.3/AL.5 period comparisons are conditional on actual rational structures and proved algebraicity. For GL₂/Q the owner is ModularSymbols L1/L2 with primitive/p-level character, Gauss-sum, period-sign and Euler-factor dictionaries. General GL₂/F and higher rank require separate supplier theorems; they are not supplied by a GL₂/Q formula. |

The AutomorphicPadicLFunctions reader explicitly leaves its L1 target period/rationality proof `not_read` and requires the actual arithmetic/cohomological instantiation. AL’s conditional interfaces do not resolve that gap. G12 is correctly retained; no consumer is promoted by this review. Accepted RS-13 ownership is respected: AL supplies the analytic factors and functional equations; arithmetic/rational structures and their algebraicity proofs remain with their owners.

## Required reader revision and orchestrator decisions

The reader is `research/blueprint/readmes/AutomorphicLFunctionsAndLocalFactors.md`. It is deliberately **unchanged**, because it is absent from issue #363’s deliverables. This is the unresolved contradiction that prevents acceptance. A revision job should include that file and synchronize the corrected sections below with the packet, including their sources, direct inputs and proof routes.

1. At line15, replace cancellation from normalized local distributions by: changing multiplicative Haar by c scales z₀ by c; only epsilon/gamma ratios cancel the common scalar, and standard vectors require inverse scaling. Replace every repeated AL.1 occurrence of the same claim.
2. At the global-zeta proof (line1035), replace algebraic spanning by density plus continuous extension/Schwartz domination. Its standard-test comparison and the completed-Hecke API must specify unit-volume normalization or compensated vectors.
3. At the Jacquet realization statement (lines1657–1663), use the packet’s exact growth-space and finite-sum statement, ordered inducing exponents, and irreducibility/rank restrictions. Merely saying `h entire as in Theorem2.6` is insufficient.
4. At the archimedean local theory proof (around line831), remove the circular functional-equation route and add the general-test convergence thresholds. At local self-duality, restrict to number-field completions.
5. Refresh the inversion/character/supplier direct-input lists, especially finite versus local inversion, inverse different, GL_n Haar, Maass AF.3, Flath AF.2, local period multiplicity one, Satake bounds and function-field degree twisting. Explain AN.2/FA.5 as requested extensions, not existing exact theorem outputs.
6. Refresh the source locators listed above and append G15 to the reader’s gap/remaining discussion. The per-node correction table below is exhaustive for changed packet fields and suggested interfaces.

The orchestrator should assign the reader synchronization with all three artifacts in scope. It should also place the general Hadamard extension in AnalyticNumberTheory’s actual stage structure, and route the precise G15/trace/FA.5 extensions to their owners. Those are recorded planning requests, not reasons to demand that their implementations be completed before accepting an otherwise consistent plan.

## Exhaustive per-node review

Each row corresponds to exactly one `review.checked` entry. A `verified` verdict means the target plan agrees with the checked source and stated supplier boundaries; it does not certify an unread proof leaf or implemented Lean result. A `corrected` verdict includes changes to the suggested interface as well as packet fields. There are no added nodes, so no `addedBy` tags are needed.

| Node within this roadmap | Verdict | Check/correction |
|---|---|---|
| `AL.0/pairing-annihilator` | verified | Checked against Tate1950 §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.0/mem-pairing-annihilator` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/closed-annihilator` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/open-annihilator` | verified | Checked against Kudla2004 p.115, local constancy and compact support; p.122, Fourier transforms. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/vanishing-from-period` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/fourier-support` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/indicator-transform` | verified | Checked against Tate1950 §2.5, physical p.24, printed (2.17), compact-subgroup Fourier calculation. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/coset-transform` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/modulation` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/frequency-periods` | corrected | Replaced the one-character Tate excerpt with its actual lattice-character sentence and identified the generic bilinear formulation as a routine extension. |
| `AL.0/locally-constant-transform` | verified | Checked against Kudla2004 p.122, Fourier transforms of Schwartz–Bruhat functions. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/compact-support-transform` | verified | Checked against Kudla2004 p.122, Fourier transforms of Schwartz–Bruhat functions. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/indicator-inversion` | verified | Checked against Kudla2004 p.122, self-dual measure and Fourier inversion. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/local-schwartz-bruhat-space` | verified | Checked against Kudla2004 §3, printed p. 115 (physical p. 7). Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. Recorded G1 remain proof/supplier refinements, not implementation claims. |
| `AL.0/local-fourier-inversion` | corrected | Added finite inversion, self-dual Haar, local topological duality and archimedean comparison as direct inputs; the finite proof no longer depends back on this result. |
| `AL.0/adelic-schwartz-bruhat-space` | corrected | Corrected the Tate p.49 class-definition excerpt; retained completed archimedean tensor/density and finite standard-tail conditions. Recorded G1 remain proof/supplier refinements, not implementation claims. |
| `AL.0/adelic-poisson-summation` | verified | Checked against Tate1950 §4.2, physical pp. 40–43, Lemmas 4.2.1–4.2.4 and Theorem 4.2.1; Kudla2004 §4, printed p. 128 (physical p. 20). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/point-supported-distributions` | verified | Checked against Kudla2004 §3, Lemma 3.3 (ii)–(iii) and footnote 8, printed pp. 116–117 (physical pp. 8–9). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G3 remain proof/supplier refinements, not implementation claims. |
| `AL.1/local-quasicharacter-conductor` | verified | Checked against Kudla2004 §3, "The ramified local theory", printed p. 120 (physical p. 12); Kudla2004 §3, "The archimedean case", printed p. 121 (physical p. 13). Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.1/local-zeta-integral` | corrected | Corrected measure scaling and added its API/regression: doubling multiplicative Haar doubles z/L; epsilon/gamma ratios alone cancel the common scalar. |
| `AL.1/eigendistribution-space` | verified | Checked against Kudla2004 §3, Definition 3.1, printed p. 115 (physical p. 7). Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.1/restriction-to-punctured-line` | verified | Checked against Kudla2004 §3, Lemma 3.2, printed p. 116 (physical p. 8). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/eigendistributions-supported-at-zero` | verified | Checked against Kudla2004 §3, Lemma 3.3, printed pp. 116–117 (physical pp. 8–9). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G3 remain proof/supplier refinements, not implementation claims. |
| `AL.1/unramified-local-theory` | corrected | Corrected the shared multiplicative-measure convention: z/L scales; epsilon and gamma ratios cancel only a common multiplicative scaling with fixed additive Fourier measure. |
| `AL.1/invariant-distributions-exceptional-case` | verified | Checked against Kudla2004 §3, Example, printed pp. 119–120 (physical pp. 11–12), (3.10)–(3.14). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/ramified-local-theory` | corrected | Corrected the shared multiplicative-measure convention: z/L scales; epsilon and gamma ratios cancel only a common multiplicative scaling with fixed additive Fourier measure. |
| `AL.1/archimedean-local-theory` | corrected | Corrected multiplicative-measure scaling and general-input convergence thresholds; removed the circular local-functional-equation proof route. Taylor continuation and the corrected residue orders remain the primary argument. |
| `AL.1/local-uniqueness-theorem` | verified | Checked against Kudla2004 §3, Theorem 3.4, printed p. 117 (physical p. 9); Kudla2004 §3, printed p. 120 (physical p. 12). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/fourier-transform-eigendistribution` | verified | Checked against Kudla2004 §3, Lemma 3.6, printed p. 122 (physical p. 14). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/local-epsilon-gamma-factors` | corrected | Corrected multiplicative-measure scaling and expanded Tate’s locator to pp.18–19, where the functional-equation excerpt actually occurs. |
| `AL.1/local-functional-equation` | verified | Checked against Kudla2004 §3, Corollary 3.7 and (3.24)–(3.25), printed p. 123 (physical p. 15); Tate1950 §2.4, Lemma 2.4.2 and Theorem 2.4.1, physical pp. 17–19. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/local-gauss-sum` | verified | Checked against Kudla2004 §3, Proposition 3.8(ii) and (3.31)–(3.32), printed pp. 124–125 (physical pp. 16–17); Tate1950 §2.5, "k 𝔭-adic", physical pp. 24–26. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.1/explicit-epsilon-factors` | verified | Checked against Kudla2004 §3, Proposition 3.8 and its proof, printed pp. 124–125 (physical pp. 16–17); Tate1950 §2.5, physical pp. 20–27. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/global-eigendistributions` | verified | Checked against Kudla2004 §4, Lemma 4.1 and Theorem 4.2, printed p. 126 (physical p. 18); Kudla2004 §4, printed p. 126 (physical p. 18). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/global-zeta-integral` | corrected | Replaced algebraic spanning by dense tensors plus continuity/domination; synchronized local measure normalization and corrected the Tate p.49 excerpt. |
| `AL.1/completed-hecke-l-function` | corrected | Specified which standard vectors make Λ equal the global integral: unit-volume measure, or compensating vector scaling under Tate’s measure. |
| `AL.1/idele-class-volume` | verified | Checked against Tate1950 §4.3, Lemma 4.3.1, Definition 4.3.2, Theorem 4.3.2 and Corollary 4.3.1, physical pp. 44–48; Tate1950 §4.4, Main Theorem 4.4.1, physical p. 50. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/tate-lemma-a` | verified | Checked against Tate1950 §4.4, Lemma A, physical pp. 50–51. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/tate-lemma-b` | corrected | Corrected Tate’s literal factor-group excerpt; retained compact norm-one quotient and explicit nontrivial-character cancellation. |
| `AL.1/tate-global-functional-equation` | verified | Checked against Tate1950 §4.4, Main Theorem 4.4.1 and its proof, physical pp. 50–52; Kudla2004 §4, Theorem 4.3, printed p. 128 (physical p. 20). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/global-epsilon-factor` | verified | Checked against Kudla2004 §4, (4.6)–(4.7), printed p. 128 (physical p. 20); Kudla2004 §4, printed p. 128 (physical p. 20). Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.1/hecke-l-functional-equation` | verified | Checked against Kudla2004 §4, Corollary 4.4 and (4.8)–(4.9), printed p. 128 (physical p. 20); Tate1950 §4.5, physical pp. 53–59. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/bessel-k` | verified | Checked against Zhang2021 §12.4, p.942, definition preceding Lemma12.3. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.0/bessel-half-order-derivative` | verified | Checked against Zhang2021 §12.4, p.943, last display in proof of Lemma12.3. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G4 remain proof/supplier refinements, not implementation claims. |
| `AL.2/godement-jacquet-integral` | corrected | Corrected Humphries’ formula locator to §2.3.2 (2.3); replaced the additive-Haar fine-node near miss by an exact multiplicative GL_n Haar request; strengthened the rank-two example. Recorded G1, G15 remain proof/supplier refinements, not implementation claims. |
| `AL.2/godement-jacquet-convergence` | corrected | Corrected the source locator from the Rankin–Selberg formula (2.1) to the Godement–Jacquet formula (2.3). Recorded G5 remain proof/supplier refinements, not implementation claims. |
| `AL.2/standard-local-l-factor` | corrected | Removed the h⇒h constant-term signature; stated the genuine unramified polynomial normalization and explicitly omitted the unavailable general GJ-generator construction theorem. Recorded G5 remain proof/supplier refinements, not implementation claims. |
| `AL.2/godement-jacquet-functional-equation` | verified | Checked against HumphriesArch §2.4.4 (2.15). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G5 remain proof/supplier refinements, not implementation claims. |
| `AL.2/godement-jacquet-newform-test` | verified | Checked against HumphriesGJ Theorem1.2, §§4–5. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.2/global-godement-jacquet` | corrected | Corrected Borel’s literal excerpt while retaining the GL_n standard-factor restriction; Borel’s general conjectural r assertions are not imported as theorems. Recorded G5 remain proof/supplier refinements, not implementation claims. |
| `AL.3/whittaker-model` | corrected | Strengthened rank-one and opposite-character examples to use the actual supplied representation action and whittakerFunction; scalar identities alone did not test the interface. Recorded G1 remain proof/supplier refinements, not implementation claims. |
| `AL.3/whittaker-compact-parameter-estimates` | verified | Checked against JacquetArch §3 Lemma3.12 and Proposition3.2. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G7 remain proof/supplier refinements, not implementation claims. |
| `AL.3/rs-local-integrals` | verified | Checked against CogdellFields Lecture6 §1, Lecture8 §1. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.3/rs-local-convergence` | verified | Checked against JacquetArch Theorems2.1–2.3; §§3–5. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/rs-local-factor` | corrected | Strengthened the two-by-one example to evaluate RsLocalFactor with tensor Satake roots10 and15, rather than merely compare two polynomials. Recorded G6, G7 remain proof/supplier refinements, not implementation claims. |
| `AL.3/rs-local-functional-equation` | verified | Checked against CogdellFields Lecture6 §2, Lecture8 §1. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G6 remain proof/supplier refinements, not implementation claims. |
| `AL.3/rs-archimedean-realization` | corrected | Restored Jacquet’s polynomial-cleared vertical-strip boundedness, ordered exponents and equal-rank finite-sum formulation; retained irreducibility/rank restrictions and G7 proof refinement. Recorded G7 remain proof/supplier refinements, not implementation claims. |
| `AL.3/rs-unramified-test` | verified | Checked against HumphriesGJ §3 Theorems3.7,3.9 and formula(3.10). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G6 remain proof/supplier refinements, not implementation claims. |
| `AL.4/l-group-local-factor` | corrected | Corrected the Borel excerpt, removed a duplicate charpolyRev prerequisite and made the tensor-versus-product example evaluate the actual matrix factor. |
| `AL.4/partial-l-product-convergence` | corrected | Added SR.4 with an explicit request for Borel’s uniform unitarizable Satake-weight estimate; a Satake carrier does not itself prove this bound. Recorded G15 remain proof/supplier refinements, not implementation claims. |
| `AL.4/local-parameter-comparison` | corrected | Corrected fields sources. Checked source hypotheses and direct proof inputs. Recorded G13 remain proof/supplier refinements, not implementation claims. |
| `AL.5/finite-euler-correction` | corrected | Strengthened simple/double exceptional-zero examples to use FiniteEulerCorrection on one/two places, including its second derivative. |
| `AL.5/critical-value-period-interface` | verified | Checked against RodriguesJacintoWilliams2025 AppendixB TheoremB.1 pp.207–209. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G12 remain proof/supplier refinements, not implementation claims. |
| `AL.5/central-sign-vanishing` | verified | Checked against CogdellFields Lecture9 §4. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/global-whittaker-factorization` | corrected | Imported AF.2 Flath factorization and AF.3 compact unipotent quotient; completed archimedean extension and global genericity remain explicit requested inputs. Recorded G15 remain proof/supplier refinements, not implementation claims. |
| `AL.3/gln-fourier-expansion` | verified | Checked against CogdellFields Lecture4, Fourier expansion. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/mirabolic-eisenstein-series` | verified | Checked against CogdellIntegrals §1.1.3, pp.4–5. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.3/mirabolic-eisenstein-functional-equation` | corrected | Extended the locator to pp.4–5 so the literal Poisson-summation excerpt is in the cited passage. |
| `AL.3/global-rs-unfolding` | verified | Checked against CogdellIntegrals §1.1.2–§1.1.3 pp.3–5. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/rs-global-poles` | verified | Checked against CogdellFields Lecture9 §3, pp.71–72. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/rs-global-functional-equation` | verified | Checked against CogdellFields Lecture9 §4, p.72. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/rs-vertical-strip-bounds` | verified | Checked against CogdellFields Lecture9 §5, pp.72–73. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G8 remain proof/supplier refinements, not implementation claims. |
| `AL.2/jacquet-shalika-satake-bound` | verified | Checked against CogdellFields Corollary7.1.2 and proof, pp.58–59. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G9 remain proof/supplier refinements, not implementation claims. |
| `AL.3/strong-multiplicity-one` | verified | Checked against CogdellFields Theorem9.3 and proof, pp.74–75. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/isobaric-strong-multiplicity-one` | verified | Checked against CogdellFields Theorem9.4, pp.75–76. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G9 remain proof/supplier refinements, not implementation claims. |
| `AL.3/ramakrishnan-degree-one` | verified | Checked against Ramakrishnan2018 TheoremA, pp.1–2; proof strategy pp.2–4. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G9 remain proof/supplier refinements, not implementation claims. |
| `AL.3/normalized-rs-period` | corrected | Added finite/archimedean diagonal-period multiplicity-one suppliers, distinct from Whittaker uniqueness; removed unrelated scalar convergence tests and named their unavailable full signatures. Recorded G15 remain proof/supplier refinements, not implementation claims. |
| `AL.3/global-central-period` | verified | Checked against Leslie2025 Proposition8.3 and Corollary8.4 pp.59–60. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/standard-additive-character` | corrected | Added completion/adele and LocalFieldsRamification trace-different inputs with an exact trace-compatibility request; arithmetic trace data are not supplied by AddChar composition. |
| `AL.0/fractional-ideal-annihilator` | corrected | Located the actual Tate trace-dual lemma on physical p.10 and imported LocalFieldsRamification Layer3’s inverse-different contract. Recorded G2 remain proof/supplier refinements, not implementation claims. |
| `AL.0/self-dual-haar` | corrected | Strengthened the scaled-character example to compare actual native measures with q^(−1/2), rather than only scalar square roots. Recorded G2 remain proof/supplier refinements, not implementation claims. |
| `AL.0/finite-schwartz-period-level` | verified | Checked against Kudla2004 §3, p.115, finite Schwartz description. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/finite-fourier-inversion` | corrected | Removed the dependency back to local inversion; use finite period-level decomposition and coset calculations with explicit integrability. |
| `AL.0/schwartz-parameter-domination` | verified | Checked against JacquetArch §2 analytic families and §3 compact-parameter estimates. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/canonical-archimedean-factor` | verified | Checked against HumphriesArch §2.4.2–2.4.3 (2.7), (2.10), (2.13). Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.1/cm-quadratic-completion` | corrected | Replaced the nonexistent literal order-one quote with the physical p.9 passage; distinguished general Hecke growth from the CM root-number-one Dedekind-quotient argument. |
| `AL.1/cm-logarithmic-gamma-correction` | verified | Checked against YuanZhang2018 §7.1 p.590, displayed gamma correction. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/function-field-rs-euler-product` | verified | Checked against Yu2023 §5.1.2 p.30, §6.1. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.3/function-field-cuspidal-polynomial` | corrected | Added FA.5’s requested tensor-cohomology extension and the unitary degree-twist reduction needed to reach GS.6’s finite-order-central-character scope. Recorded G11 remain proof/supplier refinements, not implementation claims. |
| `AL.3/function-field-self-pair-reflection` | corrected | Added the separate FA.5 cohomological degree/duality input; GS.6’s correspondence/purity statements alone do not provide the alternating pairing. Recorded G11 remain proof/supplier refinements, not implementation claims. |
| `AL.3/residual-rs-product` | verified | Checked against Yu2023 Lemma6.1.3, pp.43–44. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G9 remain proof/supplier refinements, not implementation claims. |
| `AL.3/residual-rs-telescoping` | verified | Checked against Yu2023 (6.1.5), p.44. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/open-disc-zero-pole-index` | corrected | Added the actual native MeromorphicOn.divisor comparison on the finite union of polynomial roots; removed its unjustified unavailable-carrier omission. |
| `AL.3/residual-rs-index` | verified | Checked against Yu2023 Corollary6.1.2 and proof pp.43–44. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G11 remain proof/supplier refinements, not implementation claims. |
| `AL.3/rs-normalizing-scalar` | corrected | Replaced the nonexistent Yu excerpt and made the pole example evaluate the actual numerator/denominator pair at a genuine pole. |
| `AL.3/self-pair-normalizer-reflection` | verified | Checked against Yu2023 (6.2.5)–(6.2.6), p.46. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/whittaker-conductor-shift` | verified | Checked against Yu2023 Lemma5.3.3 proof pp.37–38. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/bessel-laplace-mellin` | corrected | Located the unnumbered integral in the proof of Gross–Zagier IV(6.2), printed p.299/physical p.76; distinguished the integer source parameter from routine positive rescaling. |
| `AL.0/partial-fourier-transform` | corrected | Replaced the broken literal phrase with Zhang’s second-coordinate description and tightened the passage to §11.1 p.933. |
| `AL.2/godement-jacquet-spherical-test` | verified | Checked against HumphriesGJ §1 (1.1), discussion preceding Theorem1.2. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G5 remain proof/supplier refinements, not implementation claims. |
| `AL.2/unitary-self-dual-real-factors` | verified | Checked against YunZhang2017 Appendix B LemmaB.3 and proof pp.904–905. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.2/standard-order-one` | verified | Checked against YunZhang2017 TheoremB.2 proof p.904; RemarkB.4 p.905. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G8 remain proof/supplier refinements, not implementation claims. |
| `AL.2/standard-superpositivity` | corrected | Made the general Hadamard theorem an explicit requested AnalyticNumberTheory extension: current AN.2 is PNT. Retained corrected order≤1, RH and non-polynomial strict-propagation hypotheses. Recorded G11, G14 remain proof/supplier refinements, not implementation claims. |
| `AL.2/trivial-function-field-pole-clearer` | verified | Checked against YunZhang2017 RemarkB.5 p.906, corrected PAPER-YUN-ZHANG-17/E17. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.2/maass-standard-l-function` | corrected | Replaced AF.0 by the actual AF.3/maass-cusp-forms supplier, retaining its parity/Hecke/2√y normalization. |
| `AL.2/maass-standard-functional-equation` | verified | Checked against DukeImamogluToth2016 §5.2 p.963 (5.9). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/maass-norm-comparison` | corrected | Added the actual AF.3 Maass supplier alongside analytic unfolding; the source normalization ρ(1)=1 remains explicit. |
| `AL.3/rs-boundary-nonvanishing` | verified | Checked against Sarnak2004 §1 p.3 (5), discussion of Shahidi. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G10 remain proof/supplier refinements, not implementation claims. |
| `AL.3/motivic-unitary-shift` | verified | Checked against Liu2022 §1.1 pp.109–112, Rankin–Selberg motive normalization. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G13 remain proof/supplier refinements, not implementation claims. |
| `AL.4/satake-factor-operations` | verified | Checked against Borel1979 §13.1 pp.49–50, local representation factor. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.4/exterior-power-transfer-comparison` | corrected | Moved the conditional Borel lifting comparison to §16.1 p.55 and added BCGP §1.8.25; no arbitrary exterior-power transfer existence is asserted. |
| `AL.5/euler-correction-leading-term` | verified | Checked against CogdellFields Lecture9 finite-factor identities; analytic consequence. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.0/additive-duality-map` | verified | Checked against Tate1950 §2.2 local self-duality. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. |
| `AL.0/local-additive-self-duality` | corrected | Restricted the claim to number-field completions and used Tate’s actual character-group excerpt; positive-characteristic arithmetic remains a separate FA.2 input. Recorded G2 remain proof/supplier refinements, not implementation claims. |
| `AL.0/archimedean-fourier-comparison` | verified | Checked against Kudla2004 §3 archimedean Fourier normalization. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.1/quadratic-orbital-tate-comparison` | verified | Checked against Zhang2021 §12.5 pp.946–947 (12.15)–(12.19). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. |
| `AL.3/rational-period-comparison` | verified | Checked against Raghuram2016 §2.5.2 pp.24–25 (2.37)–(2.39). Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G12 remain proof/supplier refinements, not implementation claims. |
| `AL.5/ordinary-gl2-euler-factor` | verified | Checked against RodriguesJacintoWilliams2025 Appendix B TheoremB.1 p.208, with supplier newform comparison. Hypotheses/conventions and target-level proof outline agree; API and discriminating test requirements checked. Recorded G12 remain proof/supplier refinements, not implementation claims. |
| `AL.5/local-conductor-test-vector-comparison` | verified | Checked against AtobeKondoYasuda2022 Introduction pp.2–3 epsilon conductor; generic-newform application. Hypotheses/conventions and target-level proof outline agree; direct input scope checked. Recorded G13 remain proof/supplier refinements, not implementation claims. |
| `AL.2/archimedean-standard-epsilon` | corrected | Used the actual Chenevier–Taïbi additivity passage, retaining the positive-character sign conversion and Weil-constituent formulas. |

## Public versions used

URLs below identify the public versions checked. SHA-256/version provenance remains in `sourceVersions`; no PDFs or source copies are committed.

- [Tate1950](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf)
- [Kudla2004](https://platoeinsyu.github.io/assets/pdf/Articles/Tate/TatesThesis.pdf)
- [KudlaPreprint](https://u.cs.biu.ac.il/~reznikov/courses/kudla-1.pdf)
- [Zhang2021](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf)
- [Leslie2025](https://arxiv.org/pdf/1911.07907v3)
- [Ramakrishnan2018](https://arxiv.org/pdf/1806.08429v1)
- [Yu2023](https://arxiv.org/pdf/1807.04659v5)
- [YunZhang2017](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf)
- [ThornerZaman2017](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf)
- [GrossZagier1986](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf)
- [YuanZhang2018](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf)
- [DukeImamogluToth2016](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf)
- [HumphriesNordentoft](https://arxiv.org/pdf/2211.05890v2)
- [Sarnak2004](https://web.math.princeton.edu/sarnak/ShalikaBday2002.pdf)
- [Raghuram2016](https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf)
- [RodriguesJacintoWilliams2025](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf)
- [AtobeKondoYasuda2022](https://arxiv.org/pdf/2110.09070v4)
- [Liu2022](https://par.nsf.gov/servlets/purl/10323568)
- [ChenevierTaibi2020](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf)
- [Tsimerman2018](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf)
- [GanIchino2018](https://arxiv.org/pdf/1705.10106v3)
- [CaraianiScholze2017](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf)
- [AllenEtAl2023](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf)
- [CalegariGeraghty2020](https://math.uchicago.edu/~fcale/papers/Siegel.pdf)
- [BeuzartPlessisChaudouardZydor2022](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf)
- [BCGP2025](https://math.uchicago.edu/~fcale/papers/Modular.pdf)
- [CogdellFields](https://people.math.osu.edu/cogdell.1/fields-www.pdf)
- [CogdellIntegrals](https://people.math.osu.edu/cogdell.1/columbia-www.pdf)
- [HumphriesArch](https://arxiv.org/pdf/2008.12406v2)
- [HumphriesGJ](https://arxiv.org/pdf/1903.02031v2)
- [JacquetArch](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf)
- [Borel1979](https://www.math.utah.edu/~ptrapa/math-library/borel/borel-automorphic-L-functions.pdf)

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicLFunctionsAndLocalFactors.json`: 0 errors, 0 warnings.
- Suggested Lean elaboration: exit0, only the183 expected `sorry` warnings.
- Internal prerequisite traversal: no cycles, no dangling internal node IDs.
- `git diff --check`: clean.
- All baseline modules readable at their exact pins; Mathlib build source bytes identical to the pin. Public PDFs match recorded hashes.

All changes are confined to the packet, suggested file, this review and this job’s handoff. No implementation status, upstream roadmap, consumer file, atlas data, labels or issue state was manually promoted.
