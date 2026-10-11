# BP-SieveMethodsAndPrimePatterns — completed planning pass

Issue #1036; Codex, GPT-6; session `codex-F8Bvum`. Claim confirmed on 10 October 2026. Branch `codex-F8Bvum-sieve-blueprint`, based on `303b02c8bda26170394f9f96f6c691391a2f8611`.

The target-level pass is complete under PROTOCOL §0, below the 300-node budget. All six stages SV.0–SV.5 are `planned`; no stage is `closed`. Every target terminates in a pinned declaration, an exact supplier request, or a named proof/interface gap. This is a completed blueprint for independent review, not a checkpoint or an implementation claim. All 125 incoming node IDs are retained and 99 nodes added.

The packet, reader and suggested file cover the 40 routed sieve items from Khayutin, Bary-Soroker–Koukoulopoulos–Kozma, Bennett–Siksek, Skorobogatov–Sofos, Koymans–Milovic and Koymans–Pagano. The map is `paperRouteCoverage`; source numbering is reconciled there, including Khayutin’s published §9 and the older §8 route.

**Inventory:** 70 lemma, 110 theorem, 14 construction, 26 definition, 3 comparison, 1 application; 251 API items; 170 definition/construction unit tests and two additional lemma tests; 27 planets, at most six per stage; 206 pinned baseline declarations; 24 sources; 29 gaps; 21 supplier requests.

## Files and native boundary

- Packet: `research/blueprint/packets/SieveMethodsAndPrimePatterns.json`.
- Reader: `research/blueprint/readmes/SieveMethodsAndPrimePatterns.md`.
- Prototype: `research/blueprint/suggested/SieveMethodsAndPrimePatterns.lean`.

The prototype elaborates with zero errors, 566 expected admission warnings and zero other warnings. These signatures and examples are admitted; successful elaboration establishes their types, not the mathematical assertions. Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`, using Lean 4.34.0-rc2. The command was `lean-check research/blueprint/suggested/SieveMethodsAndPrimePatterns.lean`; available memory before the final run was 87 GiB. No library build, dependency update, cache download or language server was started. Only the shared compiler wrapper was used.

Suggested-file SHA-256: `9bf64f7729f455823aa537871618341de4a93b78f781de274cdd21076211d1cc`. Compiler-log SHA-256: `f1d2ec3462ccb3539f155db977ef504a4561e9b25b84849700dc902fc36c4200`. Tau Ceti’s source baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. Because this file imports native Mathlib modules, this receipt does not certify a combined Tau Ceti build.

There are 22 explicit omission records: 20 main declarations, 22 API declarations and 13 definition tests cannot yet be stated against the pinned native interfaces. They are specified mathematically in the packet and reader and named in the suggested-file comment. No placeholder proposition field stands in for these conditions. The namespace-aware scan matches that list exactly; the other 204 main declaration entries, 229 API items and 157 definition test labels occur in the file, as do the two additional lemma tests. The native ideal quadratic-symbol adapter is typed; it is not one of the omitted spin interfaces.

| Target | Native omissions |
| --- | --- |
| conic-normal-form-adapter | `SieveConic.conic_normal_form_adapter` |
| quadratic-order-ideal-count-growth | `SieveBinary.quadratic_order_ideal_count_growth` |
| polynomial-farey-coefficients | `SievePolynomialVector.fareyCoefficient_residue` |
| beta-sieve-general-dimension | `SieveWeighted.beta_sieve_general_dimension` |
| joint-spin-setup | `SieveJointSpin.JointSpinData`, `SieveJointSpin.JointSpinData`, `SieveJointSpin.spinSet_no_identity`, `SieveJointSpin.spinSet_order_ge_three`, `SieveJointSpin.classRep_coprime_choice`, `SieveJointSpin.classRep_principal_generator`, `SieveJointSpin.spinModulus_even`, `spin_identity_excluded`, `spin_involution_excluded`, `spin_cubic_singleton`, `spin_bad_representatives` |
| joint-spin-symbol | `SieveJointSpin.jointSpin`, `SieveJointSpin.spin`, `SieveJointSpin.jointSpin`, `SieveJointSpin.spin_unit_square`, `SieveJointSpin.jointSpin_generator_independent`, `SieveJointSpin.jointSpin_real`, `SieveJointSpin.jointSpin_complex`, `SieveJointSpin.jointSpin_abs`, `SieveJointSpin.jointSpin_nonprincipal`, `spin_unit_ideal`, `spin_rational_nonunit`, `spin_square_unit_invariance`, `spin_nonprincipal_zero`, `spin_complex_average` |
| joint-spin-short-character-input | `SieveJointSpin.joint_spin_short_input` |
| spin-squarefull-norm-tail | `SieveJointSpin.spin_squarefull_tail` |
| spin-common-norm-tail | `SieveJointSpin.spin_common_norm_tail` |
| joint-spin-type-i | `SieveJointSpin.joint_spin_typeI` |
| joint-spin-kernel | `SieveJointSpin.spinKernel`, `SieveJointSpin.spinKernel`, `SieveJointSpin.spinKernel_mul_left`, `SieveJointSpin.spinKernel_mul_right`, `SieveJointSpin.spinKernel_reciprocity`, `SieveJointSpin.spinKernel_period`, `SieveJointSpin.spinKernel_complete_zero`, `spin_kernel_unit`, `spin_kernel_zero_numerator`, `spin_kernel_product`, `spin_kernel_period_norm` |
| number-field-kernel-bilinear | `SieveJointSpin.number_field_kernel_bilinear` |
| joint-spin-type-ii | `SieveJointSpin.joint_spin_typeII` |
| fimr-prime-sieve-conversion | `SieveJointSpin.fimr_prime_conversion` |
| joint-spin-prime-oscillation | `SieveJointSpin.joint_spin_prime_oscillation` |
| joint-spin-sign-patterns | `SieveJointSpin.joint_spin_sign_patterns` |
| affine-walk-sieve-data | `SieveAffine.walkDensity_crt` |
| affine-local-densities | `SieveAffine.affine_local_density` |
| affine-escape-subvarieties | `SieveAffine.affine_escape` |
| affine-sieve-saturation | `SieveAffine.affine_saturation` |
| affine-explicit-factor-bound | `SieveAffine.affine_factor_bound` |
| sl2-squarefree-expansion | `SieveAffine.sl2_squarefree_expansion` |

## Ownership and upstream reconciliation

The read-only current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and roadmap environment at `070dc2becd74419e76303ede84b465ed4a69461f` were consulted. The nine post-snapshot roadmaps were screened before assigning targets. IntegralLattices Layer 3 owns integral local quadratic classification; this roadmap owns its conic counting adapters, not that classification.

GlobalNumberFields Layer 3/3C supplies native class representatives, generator domains and unit arithmetic; Layer 11 supplies quadratic orders. ArithmeticDirichletSeries Layer 1 supplies ideal norm fibres and coefficients. ClassFieldTheory Layer 14 supplies Hilbert reciprocity and local character comparisons. Chebotarev Layer 13 supplies a natural prime-count asymptotic in the principal class, through the Hilbert class field. Ideal counting and Dirichlet density alone are not substituted for that asymptotic. The basic ideal symbol assembles Mathlib’s finite-field quadratic character using native ideal factorization and finite residue fields.

Accepted RS-07 retains SV.2 as the Vaughan/large-sieve owner. Its later review withheld the non-atomic graph reversal: retain AN.3→SV.2 and do not install SV.2→AN.3. The confirmed obsolete SV.3→AC.4 edge is a deletion proposal for the maintainer, not a change in this PR. AC.4 has its SV.1 and AN.3 inputs, and AC.5 its distinct SV.2/AN.3 inputs. No other packet, graph or queue was edited.

## Remaining obligations by stage

The full details below are also in `gaps`; `coverage.remaining` names the precise obligations for each stage. They prevent proof closure.

### SV.0 — planned

- SieveMethodsAndPrimePatterns/G-mass: Mass and remainder control in Eratosthenes applications
- SieveMethodsAndPrimePatterns/G-local-normal-form: Integral conic normal-form comparison
- SieveMethodsAndPrimePatterns/G-dyadic-roots: Uniform dyadic conic root bound
- SieveMethodsAndPrimePatterns/G-order-count: Conductor-local invertible-ideal counting

### SV.1 — planned

- SieveMethodsAndPrimePatterns/G-domain: Curvature-uniform lattice discrepancy
- SieveMethodsAndPrimePatterns/G-binary-averages: Uniform binary Euler and smooth-factor estimates
- SieveMethodsAndPrimePatterns/G-binary-r2: Ordinary-density input in the binary main sieve
- SieveMethodsAndPrimePatterns/G-binary-congruence: Corrected congruence transport for the binary sieve
- SieveMethodsAndPrimePatterns/G-selberg-denominator: Uniform Selberg denominator asymptotics
- SieveMethodsAndPrimePatterns/G-ggpy: Restricted Halberstam–Richert input in the Maynard route
- SieveMethodsAndPrimePatterns/G-polynomial-brun: Polynomial Brun uniform law estimates

### SV.2 — planned

- SieveMethodsAndPrimePatterns/G-domain: Curvature-uniform lattice discrepancy
- SieveMethodsAndPrimePatterns/G-sharp: Sharp Hilbert and additive large-sieve proofs
- SieveMethodsAndPrimePatterns/G-quadratic: Heath-Brown quadratic mean-value proof
- SieveMethodsAndPrimePatterns/G-jutila: Jutila auxiliary mean-square input
- SieveMethodsAndPrimePatterns/G-linnik: Multiplicity-safe smooth counts for Linnik
- SieveMethodsAndPrimePatterns/G-farey: Native polynomial Farey residue comparison

### SV.3 — planned

- SieveMethodsAndPrimePatterns/G-vaughan: Conductor reduction and Vaughan hyperbola balancing
- SieveMethodsAndPrimePatterns/G-small-conductor: Small-conductor Siegel–Walfisz estimates
- SieveMethodsAndPrimePatterns/G-variance: Discrepancy variance and weighted transfer losses

### SV.4 — planned

- SieveMethodsAndPrimePatterns/G-ggpy: Restricted Halberstam–Richert input in the Maynard route
- SieveMethodsAndPrimePatterns/G-maynard: Maynard asymptotic uniformity and smooth approximation

### SV.5 — planned

- SieveMethodsAndPrimePatterns/G-beta: Normalized general-dimension beta functions
- SieveMethodsAndPrimePatterns/G-richert: Richert numerical optimization and square exception
- SieveMethodsAndPrimePatterns/G-chen: Chen switching distribution and numerical certificates
- SieveMethodsAndPrimePatterns/G-chen-shift: Fixed even shift version of Chen switching
- SieveMethodsAndPrimePatterns/G-spin-native: Native joint-spin arithmetic interfaces
- SieveMethodsAndPrimePatterns/G-spin-tails: Geometric lattice tails for joint spins
- SieveMethodsAndPrimePatterns/G-spin-conversion: Uniform ideal Type I and FIMR conversion
- SieveMethodsAndPrimePatterns/G-affine-native: Native affine group and quotient interfaces
- SieveMethodsAndPrimePatterns/G-affine-expansion: Affine squarefree expansion and primitive coset reduction

### Exact gap descriptions

- **G-mass — Mass and remainder control in Eratosthenes applications.** The unconditional source example behind E7 needs a relation between approximate mass X, the divisor cutoff and absolute remainder mass. The new conditional theorem requires the concrete inequalities it uses. Establish those inequalities for any proposed application rather than inferring them from a sieve carrier or a level parameter.
- **G-local-normal-form — Integral conic normal-form comparison.** Import IntegralLattices Layer 3 local classification. Supply the rank-two half-norm adapter from q=ax²+bxy+cy², including the dyadic discriminant cases, integral GL₂(Z_p) changes and bijections modulo every p^n. The pinned baseline has no assembled interface for this comparison; the native theorem prototype is omitted.
- **G-dyadic-roots — Uniform dyadic conic root bound.** Prove that a unit-leading quadratic modulo 2^n has at most a fixed constant times 2^(n/2) roots uniformly in its remaining coefficients, including repeated-root valuations. Sum over the second coordinate and track the factor16. Odd-prime finite regressions do not establish this bound.
- **G-order-count — Conductor-local invertible-ideal counting.** GlobalNumberFields Layer 11 and ArithmeticDirichletSeries Layer 1 supply the order-ideal carrier and norm fibres. The missing input is a conductor-prime formula bounding r_Λ(p^k) for all k with fixed-order constants, and its coprime norm multiplicativity. Native order-count prototype omitted until that interface exists.
- **G-domain — Curvature-uniform lattice discrepancy.** GN.4 must supply the scaled and translated planar lattice estimate at every modulus actually used: area A/a²≥1 and error C(R/a)^θ. The sharp Huxley/van der Corput ranges require their own regularity hypotheses. The binary large-sieve proof uses lcm(m,n)≤sqrt(A), hence the conservative z≤A^(1/4) cutoff.
- **G-binary-averages — Uniform binary Euler and smooth-factor estimates.** Complete degree-uniform squarefree Euler lower bounds, the absorption of θ_Q after increasing the growth exponent, and the two smooth-factor savings with constants depending only on the stated growth, density and degree parameters. AN.2 and AN.5 requests specify the prime-product and smooth-number inputs; their existence is not inferred from the finite Rankin lemmas.
- **G-binary-r2 — Ordinary-density input in the binary main sieve.** Theorem9.7 proof equation(47), p.233, bounds an R₂ contribution using ordinary ρ_Q(p^e) at strength O(p^e). Its hypothesis only bounds corrected densities by Cp^{e(2−r)}. Q=x₀² gives ρ_Q(p²)=p³, so the asserted ordinary bound is unavailable. Repair R₂ at the stated generality, or state and propagate a justified additional hypothesis. The intended main conclusion is retained as a planning target, not asserted proved.
- **G-binary-congruence — Corrected congruence transport for the binary sieve.** Reconstruct Propositions9.25–9.26 after scaling. Retain (R/k₀)^θ≤(A/k₀²)^(1−3η), the transformed value bound, and local class Q≡k₀k₁ℓ mod k₁k₂. Show precisely how corrected densities of Q_r/k₀ recombine at primes dividing k₀, and how the coprime unit residue is transported. A formal substitution in the printed formulas is insufficient.
- **G-selberg-denominator — Uniform Selberg denominator asymptotics.** AN.2 supplies prime sums/PNT and the requested Wirsing asymptotic. Prove positivity and the Γ(κ+1) Euler normalization of H_g, and uniformity when progression-modulus primes are removed. Track the log interval and totient factors for the interval, progression and dimension-two applications.
- **G-ggpy — Restricted Halberstam–Richert input in the Maynard route.** GGPY §2 Lemma3 cites Halberstam–Richert Lemmas5.3–5.4. That book is not cleared and was not read. Supply a freely readable proof of the exact dimension-one remainder and uniform L bound, or use a maintainer-cleared copy. GGPY Lemma4 and the Maynard asymptotics must retain this prerequisite.
- **G-sharp — Sharp Hilbert and additive large-sieve proofs.** Kedlaya Chapter15 leaves the separated real-line Hilbert inequality and endpoint improvement as exercises. Prove the π/δ Hilbert constant, the periodic/circular adapter and H−1+δ⁻¹ inequality, including arbitrary interval origin, H≥1 and singleton cases. Squared matrix duality alone supplies no sharp constant.
- **G-quadratic — Heath-Brown quadratic mean-value proof.** Heath-Brown1995 Theorem1 and Corollaries1–4 are read with the §2 outline and §9 bilinear proof. The iterative mean-value estimates in §§3–8 remain a proof input to reconstruct, including odd squarefree support, reciprocity signs and the (MN)^ε loss. The native statements do not prove those estimates.
- **G-jutila — Jutila auxiliary mean-square input.** Jutila1975 Lemma3 is read in its original pp.194–195 proof, which invokes his 1973 Lemma2. That earlier lemma has not been read. Supply its precise real-character mean-square inequality and propagate its uniform constants through the original lemma, Smith Proposition6.6 and the Koymans–Pagano moment consequence. Do not substitute the different Heath-Brown quadratic large sieve.
- **G-linnik — Multiplicity-safe smooth counts for Linnik.** AN.5 must provide a positive-proportion bound for integers with P⁺(n)≤N^ε for fixed ε>0, using a multiplicity-safe argument. Repair the source’s ordered-tuple overcount before using the forbidden-residue large sieve. The least nonresidue excludes p=2, and the vanishing-support hypothesis is explicit.
- **G-farey — Native polynomial Farey residue comparison.** The coefficient adapter reverses a monic denominator and uses a power-series inverse. Prove agreement with the coefficient of T⁻¹ in the native Laurent expansion of a/J, and derive the complete polynomial Farey orthogonality/duality estimate with |M_p(m)|=p^m and the sharp p^m+p^{2ℓ} scale. fareyCoefficient_residue is omitted pending the LaurentSeries interface; FF.1 supplies finite-field counts, not this sieve theorem.
- **G-polynomial-brun — Polynomial Brun uniform law estimates.** Complete the Bonferroni truncation and error bound for arbitrary joint laws, keeping all labelled-coordinate dependencies. FF.1 supplies prime-polynomial harmonic counts. Track exclusion of T separately and do not replace the joint TV discrepancy with independent marginals.
- **G-vaughan — Conductor reduction and Vaughan hyperbola balancing.** Reconstruct the convolution-discrepancy proof with primitive conductor r, coprime cofactor s, small-r supplier estimates and exact hyperbola coverage. Keep the inherited dyadic J loss until a stronger aggregate bound is proved. Repair the partition endpoint and δ-range issues E19–E25, then choose U,V and the mesh to achieve every prescribed logarithmic saving.
- **G-small-conductor — Small-conductor Siegel–Walfisz estimates.** AN.3 must supply uniform estimates for von Mangoldt and the required convolution coefficients, with maximal cutoffs, coprimality cofactors and exceptional-zero treatment. Give the conductor/log ranges that make the small-r contribution negligible. Retain the accepted AN.3→SV.2 stage direction; no reverse edge is installed here.
- **G-variance — Discrepancy variance and weighted transfer losses.** Use AN.2 divisor-moment/totient estimates and character orthogonality to justify the variance with log⁵Q, including the cofactor τ(s)²/φ(s) sum and dyadic loss. For every weight exponent j and saving A choose a new BV log budget, transfer ψ to π by partial summation uniformly in y≤x, and center at li(y)/φ(q); the fixed-x centered variant is separate.
- **G-maynard — Maynard asymptotic uniformity and smooth approximation.** Finish the smooth-simplex approximation, dimension-one diagonal estimates and analytic error budget using the AN.2/AN.3 inputs. Retain exact rational certificates for M₅>2 and M₁₀₅>4 and the admissible105-tuple. The inherited numerical regressions are evidence, not a new proof of the variational or prime-distribution steps.
- **G-beta — Normalized general-dimension beta functions.** Read and reconstruct Iwaniec §§3–5 for existence, uniqueness, delay equations, κ-dependent Aκ,Bκ,βκ and Qκ(s). Only the κ=1 functions have native prototypes here. The general theorem is omitted until actual functions and constants can be stated; no hypothesis is represented by an opaque proposition field.
- **G-richert — Richert numerical optimization and square exception.** Prove the integral criterion and explicit level threshold with certified inequalities for linear sieve functions. Distinct prime factors in the logarithmic weight need the stated square-divisor exceptional mass before concluding a bound on Ω with multiplicity. Preserve γ/4, β=γ/(1+3^(−r)) and the strict positivity margin.
- **G-chen — Chen switching distribution and numerical certificates.** Prove the ordered sifted-triple bound T_N≤3.9404 C_N N/log²N and original-family lower bound≥2.6408 C_N N/log²N using the original 1973 pp.111–128 sequence. Required details include Lemma3 fourth-moment estimates on p.114, switched modulus/discrepancy control, and certified integration ∫_(1/10)^(1/3) log(2−3α)/(α(1−α))dα≤0.49255 and Lemma9 numerical inequalities. Lemma9 cites unread Richert1969 TheoremA. Keep the 0.6706−0.67 margin for the N^0.91 exceptional term; do not count only prime complements in T_N.
- **G-chen-shift — Fixed even shift version of Chen switching.** The original Theorem2 announces the fixed positive even shift variant with a similar proof. Reconstruct its shifted family, local factors and modulus-uniform switching estimates for each h, with constants allowed to depend on h. The Goldbach count does not by itself prove the shifted theorem.
- **G-spin-native — Native joint-spin arithmetic interfaces.** Reuse GlobalNumberFields Layer3/3C generators, embeddings, unit decomposition and ideal arithmetic. Assemble the ideal quadratic symbol from native finite-field characters. Import the Hilbert product formula and local comparisons from ClassFieldTheory, and the principal-class natural prime count from Chebotarev Layer13. Supply generator-independent unit averaging, class representatives and norm-modulus reduction. The native spin setup, averaging and bilinear interfaces not expressible at the pin are individually recorded in prototypeOmissions; the basic ideal-symbol adapter itself is prototyped.
- **G-spin-tails — Geometric lattice tails for joint spins.** GN.4 supplies the covolume/successive-minimum estimate for the squarefull norm tail and the codimension-two geometric sieve for common norm divisors. Track zero-difference loci and the m≥3 condition. Balance Y,Z without losing the claimed 1/18 and TypeI exponents.
- **G-spin-conversion — Uniform ideal Type I and FIMR conversion.** KM TypeI proof begins with m coprime toF and its conjugates. Extend to every integral m, including large norm, before applying FIMR Proposition5.2. Prove the required Λ/τ coefficient bounds and ideal-combinatorial conversion with normalized sup|ψ|/unit averages. Establish the squarefull-tail version of the element-kernel theorem and transfer C_|S|n to each subset for joint sign moments. ES.0 owns the short-character conjecture; Chebotarev Layer13 supplies principal-class prime-ideal normalization. Read the referenced KM2018 Proposition3.6 for the element-kernel proof and DFI Lemma9 for FIMR’s integrable hyperbola-separation kernel; neither proof has been read in this pass.
- **G-affine-native — Native affine group and quotient interfaces.** Import AlgebraicGroups strong approximation and finite reductions, FiniteFields Lang–Weil, and AlgebraicAnalysis rational Zariski closure. Identify polynomial relative density with the native topology. Supply the actual free-word orbit reduction and CRT density theorem; walkDensity_crt and five group/expansion theorem prototypes are omitted until their native interfaces exist.
- **G-affine-expansion — Affine squarefree expansion and primitive coset reduction.** BGS §§2,3.2,4–5 have not been read in full. Reconstruct the free Zariski-dense subgroup/coset reduction preserving simultaneous primitivity, the word-ball spectral recurrence and squarefree SL₂ expansion from sum-product/flattening inputs. Track bad primes, polynomial height and growth r=2k−1. For escape from W choose good primes effectively and prove a power saving; a congruence mixing assumption alone does not give an unproved endpoint saturation bound.

## Exact supplier requests

Each request lists its consuming nodes in the packet. No informal source theorem is treated as already supplied.

- **`AnalyticNumberTheory:AN.2`.** (1) Mertens' first theorem: Σ_{p≤x} log p/p = log x + O(1), hence Σ_{w≤p<z} log p/p = log(z/w) + O(1) uniformly in 2 ≤ w ≤ z, and Σ_{p≤x} 1/p = log log x + O(1) by partial summation. (2) The prime number theorem with error, in the form π(2N) − π(N) = N/log N + O(N/(log N)²). Maynard uses (1) for the hypothesis (Ω₂) of GGPY's lemma, for L ≪ log D₀, and for the (log R)^k bound in (5.9); he uses (2) for X_N in (5.27). Mathlib 082e2d3 has Chebyshev's bounds and Nat.tendsto_primeCounting, but neither statement.
- **`AnalyticNumberTheory:AN.5`.** Generic Rankin smooth-number bound: for N≥0, integer z≥0 and δ>0, #Nat.smoothNumbersUpTo(N,z+1) ≤ N^δ ∏_{p prime,p≤z}(1−p^(−δ))⁻¹, with N=0 handled separately. This is Kedlaya Lemma 11.5 with the native strict smoothness threshold z+1 and positive integers only; provide the finite-geometric/positive Euler-product proof, not the native weaker 2^π(z)√N count. SV.0 defines no competing smooth-number carrier and its finite squarefree weighted Rankin theorems do not depend on this generic-count request.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.4`.** The Khayutin L(C_l,θ_l) planar-domain input: area A, maximal curvature radius R, and |#(a⁻¹(E−x₀)∩Z²)−A/a²|≤C_l(R/a)^θ_l whenever a≥1,A≥a², uniformly in integer translates. Supply van der Corput θ=2/3+ε for C² convex domains and Huxley θ=131/208+ε for ellipses with the required C³ geometry. Davenport’s semialgebraic estimate is not this curvature-uniform estimate.
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`.** Use the existing invertible-order-ideal carrier and give the conductor-local norm count required to bound r_Λ(p^k) uniformly in k for a fixed quadratic order. Proper ideals and invertible ideals must stay distinct.
- **`AnalyticNumberTheory:AN.2`.** For every Q≥2, uniform sums Σ_{s≤Q}τ(s)/φ(s)≪(1+log Q)² and Στ(s)²/φ(s)≪(1+log Q)^4; arbitrary fixed divisor moments for the weighted BV transfer, and a PNT error smaller than any prescribed power of log x. Also the degree-uniform squarefree d^ω/n lower bound and prime-product comparisons required by Khayutin Lemmas 9.8,9.11.
- **`AnalyticNumberTheory:AN.3`.** A uniform small-conductor Siegel–Walfisz estimate for von Mangoldt and the Vaughan-derived coefficient sequences, including coprimality cofactors, maximal cutoffs and exceptional-zero treatment; give exact conductor ranges and log budgets. This is an analytic supplier request; retain the accepted AN.3→SV.2 direction and do not add its reverse.
- **`FiniteFieldsAndCharacterSums:FF.1`.** Exact monic-degree count #M_p(j)=p^j and prime-polynomial harmonic sum Σ_(degJ≤ℓ,monic irreducible) p^(−degJ)≤1+logℓ; supplies the native finite-field algebra to the polynomial Brun/Farey proof. The sieve inequalities themselves belong to SV.1/SV.2.
- **`AnalyticNumberTheory:AN.2`.** Uniform Selberg Euler denominator estimates in dimension one/two with primes dividing the progression modulus removed; general κ Wirsing normalization including positive H_g and Γ(κ+1).
- **`AnalyticNumberTheory:AN.5`.** For every ε>0, # {n≤N:P⁺(n)≤N^ε}≥c_εN for all sufficiently large N, with the exact multiplicity-safe counting proof. Also the extremely-smooth reciprocal/tail estimate used by Khayutin Lemma9.23.
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`.** Native class representatives with prescribed coprimality and squarefree degree-one prime norms, plus the unit decomposition and generator arithmetic of Layer3C. The finite prime-ideal quotients come from native number-field ideal arithmetic. The sieve assembles their quadratic characters; global reciprocity is imported from ClassFieldTheory, not from GlobalNumberFields.
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`.** The reviewed native element-generator fundamental domains, class-principalization and their scaling/translating APIs for the exact TypeI/II cutoffs. If the atlas has a stale Layer3C id, reconcile it with current upstream before packaging.
- **`GeometryOfNumbersAndQuadraticArithmetic:GN.4`.** Widmer-type lattice counts with successive-minimum error on the spin sliced domains and the codimension-two geometric sieve used by KM Lemmas3.1–3.2 (Bhargava Theorem3.3).
- **`ExponentialSumsAndCircleMethod:ES.0`.** Conjecture C_m in the exact q^((1−δ)/m) short-interval normalization, its progression Corollary2.2, and the subset-moment transfer of C_tn to weaker C_|T|n bounds.
- **`tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`.** Native finite norm fibres, number-field ideal divisor/logarithmic coefficient bounds and prime-power removal. The principal-class prime asymptotic is a separate Chebotarev request, not inferred from ideal-counting or generic Tauberian infrastructure.
- **`AdelicAlgebraicGroups:AA.4`.** Strong approximation for a finitely generated Zariski-dense subgroup at almost all squarefree moduli, including the exact reduction-image/CRT statement and the finite bad modulus; not just density of all G(Q).
- **`FiniteFieldsAndCharacterSums:FF.2`.** Uniform Lang–Weil counts for the group and geometric hypersurface zero loci/intersections, and proper-subvariety O(p^(dimG−1)) reduction counts.
- **`AdditiveCombinatorics:AC.1`.** BGS Theorem1.3 squarefree-ring sum-product with every large-divisor projection hypothesis, and the noncommutative Balog–Szemerédi–Gowers/product-growth inputs of the SL₂ flattening argument. Only these general combinatorial results are requested; the affine sieve and its expansion application remain SV.5 targets.
- **`AnalyticNumberTheory:AN.2`.** Convergence and positivity of ∏_(odd prime p)(1−1/(p−1)²), and its role as the dimension-one local factor for Goldbach.
- **`AnalyticNumberTheory:AN.3`.** The zero-free bounds for primitive Dirichlet L-functions and contour estimates used in Chen1973 Lemma6; specify the small-conductor range d≤log¹⁰⁰N, the L′/L line and smoothing before the M₂ bound is used.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.** The native Hilbert product formula, with the local quadratic-character identification at odd primes and the finite dyadic/infinite factors. SV.5 specializes it to (α/(β))(β/(α))=∏_(v|2∞)(α,β)_v for coprime odd elements, and then to the joint-spin kernel residue sign; it does not reconstruct local or global reciprocity.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c`.** Apply the natural prime-count asymptotic to the identity Frobenius class in the Hilbert class field, using ClassFieldTheory’s principal-ideal splitting criterion. This gives #{principal prime ideals with norm≤X}∼li(X)/h_K, with finite bad primes and higher-residue-degree terms removed. Dirichlet density alone is insufficient.

## Sources and unresolved reading

All mathematical descriptions are in our own words. No source excerpts, PDF files, book copies or private paths are included. `sources` supplies bibliographic URLs and `sourceVersions` records exact reading versions and hashes; the recent acquisition records are reproduced below so that the deleted scratch directory is not needed. The 35 inherited findings retain their original status. Findings E36–E45 concern the published Khayutin text; E46–E51 concern only Heath-Brown’s acquired arXiv v1; E52–E55 concern only Koymans–Milovic’s acquired arXiv v1. No self-review or independent verdict is claimed.

Fresh bounded correction searches used the exact titles and erratum/correction terms and the primary publication or author pages for the new findings. No correction was identified within that bounded search. This is not an exhaustive novelty claim. The published Heath-Brown Bonner volume and Duke Koymans–Milovic text were not collated. Halberstam–Richert is not cleared in the local library and was not read from another copy.

Missing source/proof inputs are explicit: Heath-Brown 1995 §§3–8; Jutila’s cited 1973 Lemma 2; Halberstam–Richert Lemmas 5.3–5.4; Iwaniec–Rosser §§3–5; Chen p.114 Lemma 3 and Richert 1969 Theorem A; spin lattice-tail and even-numerator-period lemmas, including KM 2018 Proposition 3.6 and DFI Lemma 9; BGS §2, §3.2 and the expansion proofs §§4–5. These are named in the affected gaps and requests. No full-paper reading is claimed for a source whose listed boundary is a section or theorem.

- **HB-SIEVES**: https://arxiv.org/pdf/math/0209360v1. Fresh acquired bytes SHA-256 `0623b40e07a8b69630f6aa753246f01c5a36ed5257a627d7416d127b39830122`. Full 50-page arXiv v1 text read for this pass, especially §§1–4, Rosser§5pp.30–38, Richert/Chen§6pp.39–48, Vaughan§7pp.48–50; no claim of collation with the Bonner volume.
- **KED-ANT-11**: https://kskedlaya.org/ant/chap-eratosthenes.html. Fresh acquired bytes SHA-256 `22aa9faaeeddc83be43cd8eb339c7c1655711e0b9f522429e741b709192e05b9`. Complete live Chapter11, §§11.1–11.6 including exercises, read again; finite Rankin adapters and the corrected conditional mass-cutoff bound are planned. E7 remains a source-application gap.
- **BOMBIERI-1971**: https://www.impan.pl/shop/en/publication/transaction/download/product/97707. Inherited reading evidence; not freshly reacquired. Full published pp.401–404 read in prior checkpoints; native Gram inequality, taper, packing and additive H+2/δ bound retained. The published volume errata p.450 does not correct these findings; no new independent review or fresh download is claimed.
- **BENNETT-SIKSEK-2020**: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf. Inherited reading evidence; not freshly reacquired. This sieve slice: §8.2 Theorem 7 and application, printed pp.379–380, text and rendered pages. Routed extraction item 45 checked. No complete-paper reading claim for this packet.
- **KED-ANT-16**: https://kskedlaya.org/ant/chap-largesieve2.html. Fresh acquired bytes SHA-256 `e67fd81c6d07ccac764a83eba8bf0b1c132739a716d3ae657b0172d5071cce67`. Complete live Chapter16, §§16.1–16.4 including exercises; native character transfer, primitive large sieve, forbidden-residue estimate and Linnik target are planned. Multiplicity-safe smooth counting remains an AN.5 request.
- **KED-ANT-18**: https://kskedlaya.org/ant/chap-bombieri2.html. Fresh acquired bytes SHA-256 `9bd73d12d648dc61a5c09804bbee04992cb8108b15858146688ac7ae9b69f523`. Complete live Chapter18, §§18.1–18.4 including exercises; discrepancy, Vaughan, convolution mean, maximal BV, variance and congruence correlation are planned. E19–E26 and explicit analytic gaps constrain proof closure; the historical five-page 2007 handout collation is retained in sourceVersions.
- **MAYNARD-2015**: https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p07-p.pdf. Inherited reading evidence; not freshly reacquired. 2026-09-29 (cc-39fac3): the whole paper, §§1–8 and footnotes, read in arXiv v3 and in the published text. Every node of SV.4 cites the published pages. Findings E27–E32 were checked on rendered page images of the published PDF (pp. 389, 391, 393, 407, 409, 411) and are present in arXiv v1, v2 and v3. Section 8's numerical claims were recomputed in exact rational arithmetic: (8.17) exactly, and (8.15) as an eigenvalue plus an exact rational certificate. Engelsma's 105-tuple was recomputed as admissible with diameter 600.
- **GGPY-2009**: https://arxiv.org/pdf/math/0609615v1. Inherited reading evidence; not freshly reacquired. 2026-09-29 (cc-39fac3): §2, Lemmas 1–4 with (2.1)–(2.6), pp. 9–10, read. Lemma 3 is cited there to Halberstam–Richert, Lemmas 5.3–5.4, which was not read (gap).
- **KED-ANT-12**: https://kskedlaya.org/ant/chap-brun.html. Fresh acquired bytes SHA-256 `4393be46bef6d62296c05f07358ee0cec6581130c434a0579c6b21a749087ad3`. Complete live Chapter12, §§12.1–12.6 including exercises; Brun coefficients, support, brackets, main terms and fundamental estimate are planned with corrected endpoint/lower-sign conventions.
- **SS-23**: https://eprints.gla.ac.uk/292484/1/292484.pdf. Fresh acquired bytes SHA-256 `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1`. §1, pp.674–675, Bouniakowsky and Schinzel tuple definitions and conjectural context; §6, Lemma 6.3 and proof, pp.725–726.
- **JUTILA-ORIGINAL**: https://matwbn.icm.edu.pl/ksiazki/aa/aa27116.pdf. Fresh acquired bytes SHA-256 `a2bb1b4b57ad60f569f0ae55a6c92c5abfb5c2e235df4654c67a7c798f0fb4c3`. Complete pp.191–198 visually read; the adjacent Szemerédi paper is excluded. Lemma 3 and its proof, pp.194–195, are the input used here.
- **HB-REAL-95**: https://matwbn.icm.edu.pl/ksiazki/aa/aa72/aa7234.pdf. Fresh acquired bytes SHA-256 `50e42d8ec3a7a57f60e6d2d68f4a9af2e4576d25a4bf22bab281f9ca88d2e590`. Theorem 1 and Corollaries 1–4, pp.237–238; proof outline §2, pp.240–242; proof of Corollary 4, §9, pp.274–275. Detailed iterative estimates in §§3–8 have not yet been independently closed.
- **SMITH-17**: https://arxiv.org/pdf/1702.02325. Fresh acquired bytes SHA-256 `e768b5ada1b9854b00692f0e60770b27b3346d7a041432eca3eb7b4bfa08a59e`. Proposition 6.6 and proof, printed p.62; reference [14], printed p.79.
- **KED-chap-largesieve**: https://kskedlaya.org/ant/chap-largesieve.html. Fresh acquired bytes SHA-256 `03dd4a42de057f972680dc28693c5dec690e1e387cf966d73d9a713a6dcbaa70`. §§15.1–15.4 including Lemma 15.1, Lemma 15.4, Theorem 15.5 and exercises. The Hilbert estimate and endpoint improvement are exercises rather than supplied proofs.
- **KHAYUTIN-19**: https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf. Fresh acquired bytes SHA-256 `f22691429c27058fabd47fe12c6a901e7feffffad7a0c52e1a936da645166d6f`. §9, pp.220–237, all sieve statements and proofs; §10.3 Proposition 10.10, pp.242–243; Appendix B, pp.265–271. Published numbering is §9, not §8 in the earlier routing brief.
- **KED-chap-bombieri**: https://kskedlaya.org/ant/chap-bombieri.html. Fresh acquired bytes SHA-256 `8c4d311857785ab5f5b282f272d99cb3c35e0a36ed443807a03cfb3f6318fcda`. Chapter 17, all statements and exercises; no unpublished proof assumed.
- **BSKK-23**: https://arxiv.org/pdf/2007.14567v3. Fresh acquired bytes SHA-256 `adb1359df46f92d608009b32f45939672e08b1e3fe052587b035431e70d5d3e1`. §6.1–6.2 pp.31–33; §8 pp.38–42, read in full; §3 additive large-sieve statement; introductory definitions pp.1–5. Routed sieve targets only, not the full irreducibility proof.
- **KED-ANT-14**: https://kskedlaya.org/ant/chap-selberg2.html. Fresh rendered HTML reading; no local byte hash. Entire chapter: dimension hypotheses, Wirsing mean value, denominator normalization, applications and exercises; official HTML read through web renderer after HTTP406 from local requests.
- **IWA-ROSSER**: https://matwbn.icm.edu.pl/ksiazki/aa/aa36/aa36210.pdf. Fresh acquired bytes SHA-256 `6b799768bafdea2952ce84c82b944ef9e320195631e3bbdc6b95be7b8607f91a`. Theorem1 and dimension condition pp.171–174; delay equations and κ=1 normalization pp.174–176; fundamental lemma pp.176–177. Combinatorial proof §§3–5 not read; exact proof gap recorded.
- **CHEN-73-CN**: https://raw.githubusercontent.com/lixiang90/chen_theorem/main/pdf/大偶数表为一个素数及一个不超过二个素数的乘积之和.pdf. Fresh acquired bytes SHA-256 `965413185962830608bcdfe8172584b9d593f87a3dedd53d1efca91c949301fd`. Original pp.111–113,115–128 read visually; Theorems1–2, Lemmas4–9, numerical inequalities(24),(27), final inequality(28). p.114 Lemma3 proof requires a separate reread; Richert1969 input cited in Lemma9 has not been read.
- **KM-21**: https://arxiv.org/pdf/1809.09597v1. Fresh acquired bytes SHA-256 `d56a738ae1b1487dd01b92b7084dd6bd4b9a041a85efdd2fac66b86afd8af433`. All §§1–5,pp.1–23, read. Owned: setup and joint-spin data§2, TypeI§3, TypeII§4, Theorems1–2. Governing-field application§5 belongs to its algebraic consumer.
- **FIMR-13**: https://arxiv.org/pdf/1110.6331v2. Fresh acquired bytes SHA-256 `b51c25e1d9e7aea35e3d7a92d8f7e80eb8237775daef98e30740115767e71b44`. Entire §5, pp.20–24, Propositions5.1–5.2 and their proof. Earlier arithmetic lemmas outside the additional §2 reading below remain unread; general reciprocity is imported from ClassFieldTheory. §2 definition of the ideal quadratic symbol, Lemma2.1 and Lemma2.3, pp.5–7; reciprocity is cited to the existing ClassFieldTheory roadmap. The even-numerator period proof beyond this boundary is not claimed read.
- **BGS-10**: https://link.springer.com/content/pdf/10.1007/s00222-009-0225-3.pdf. Fresh acquired bytes SHA-256 `9f3ca353e7a5d0720a4e6f7f652564a12457ac71f3489f0404b4b402dc459d2b`. Introductionpp.559–567; §3.1pp.573–574 and §3.3pp.577–584 sieve analysis. Algebraic preliminaries§2 and expansion proof§§4–5 not read in full; the exact required strong-approximation, finite-field and expansion inputs are recorded separately.
- **KP-22**: https://arxiv.org/pdf/2201.13424v1. Fresh acquired bytes SHA-256 `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd`. §7.2, Proposition7.6 and its proof, pp.60–63, especially assumptions(ii),(iii) and equation(7.11). This is the routed sieve consequence; other arithmetic-statistics targets are imported by their consumers.

## Verification and reproduction

- Official blueprint checker: zero errors and warnings; 224 nodes; six planned stages; zero closed stages. The pinned declaration index was used.
- Official errata checker: zero errors on a scratch-only `errata-v1` envelope containing the packet’s unchanged `roadmapId`, `sourceIssues` and `sourceVersions`; no separate errata job was claimed.
- Declaration/test-label inventory: exact agreement with the 22 prototype omissions. All inherited IDs remain present; implementation status is `unchecked` throughout.
- The reader is generated from this packet’s statements, hypotheses, APIs, tests, direct prerequisites, supplier requests and gaps. No source passage was copied.

The fresh exact integer regression enumerates residue pairs and checks four families:

- **108 singular recursions:** p∈{3,5,7}, forms x²±y², n∈{1,2,3}, target pᵐ for m=0,…,5. Count all pairs modulo pⁿ; for m≥1 compare the smooth contribution (p−1)(1+χ)pⁿ⁻¹ with the singular rescaling p²ρ(pⁿ⁻²), where that term applies.
- **318 regular unit-target counts:** p∈{2,3,5,7}, forms x²+y², x²+xy+y², x²−y² and 2x²+xy+3y²; n∈{1,2}; retain p∤discriminant and every unit target. Compare with pⁿ⁻¹(p−χ), using the Kronecker discriminant value at 2.
- **594 ramified rescalings:** p∈{3,5}; unit u,u_A,ω∈{−1,1,2}; ℓ∈{1,2,3}; 1≤n≤min(ℓ+2,4). Count ux²+p^ℓu_Ay²=−4ωuu_Ap^ℓ. For n≤ℓ compare p^(n+floor(n/2)); above ℓ compare p^(ℓ+floor(ℓ/2)) times the reduced form with x² coefficient up^(ℓ mod2).
- **324 genus counts:** p∈{3,5,7}, the same unit parameters, ε∈{−1,1}, k∈{0,1}; sum the counts modulo p² for targets pᵏa−4ωuu_Ap with Legendre(a)=ε. For k=1 compare p²[p−1−ε Legendre(u_A)−Legendre(−ωu)]/2; for k=0 compare p³(p−1) exactly when Legendre(u)=ε, else zero.

Reproduction needs only integer loops over the stated finite domains; the tests do not import any admitted Lean theorem. Witnesses: the split B.4 count at p=3 is 5 rather than 1; the odd-ramified B.5 count of x²+3y²=−12 modulo9 is 0 rather than18; B.8 with p=3,u=u_A=ω=1,ε=−1,k=1 is18 rather than9. At the B.7 boundary n=ℓ=1 all three roots of x²+3y²=−12 modulo3 are singular and nonlifting, contradicting the printed zero branch. The ordinary density of x²=0 modulo9 is27, showing why an ordinary R₂ input does not follow from the corrected density bound9.

These finite checks detect local formula errors; they do not establish a uniform dyadic theorem, the full analytic binary sieve, numerical Chen optimization or a conditional spin estimate. Older Brun, character, Fourier, dyadic and Maynard exact-certificate checks are retained under `checks.historical`, and were not rerun.

## Where to resume

Independent review should first compare the corrected source statements, the supplier ownership and the exact prototype-omission list. Proof refinements start from the 29 gap IDs above; they need no rediscovery of the target inventory. In particular, resolve the binary ordinary-density R₂ estimate, uniform analytic supplier constants, Chen’s switching/numerical inputs, and the native spin/affine interfaces before describing any stage as closed or packaging those omitted signatures. All 40 routed target items already have owners.

The four deliverables are self-contained. Scratch source downloads, scripts and logs are removed once the PR is open; the source hashes, finite domains, receipt and mathematical limitations needed by a successor are recorded here and in the packet.
