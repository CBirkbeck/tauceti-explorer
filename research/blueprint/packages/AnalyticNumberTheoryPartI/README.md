# Roadmap: analytic number theory, Part I

**Summary.** Quantitative primes, explicit formulas, Hecke and Artin comparisons, multiplicative means, smooth numbers and proved zeta moments.

## Scope and ownership

This part owns Layers0–3. It builds on completed ArithmeticDirichletSeries and the open LFunctions and ZerosOfLFunctions roadmaps, consuming generic order-one, Gamma, degree-one zero, rational explicit-formula and rational PNT interfaces. The new work is quantitative refinement and arithmetic comparison.

### Prerequisites and boundaries

ArithmeticDirichletSeries supplies norm-indexed ideal coefficients, genuine Euler products, partial-sum continuation, Abel and Perron summation, Landau positivity, Wiener–Ikehara and the qualitative transfer from logarithmic derivatives to prime counts. Mathlib supplies arithmetic functions, ordinary Dirichlet-series continuation and functional equations, nonvanishing on the closed right half-plane, the real Dedekind residue limit, and the circle-valued real Hurwitz zeta function. None of these is constructed again here.

Integral Brauer induction and nilpotent monomiality are already in the current Tau Ceti library; their exact combination is specified under [From RepresentationTheory][R128]. The Artin targets add arithmetic Euler-factor and continuation comparisons, rather than another representation-theoretic induction theorem.

The qualitative prime ideal theorem is `TauCeti.primeIdealTheorem`, in `TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.PrimeIdealTheorem`. Its count form is `TauCeti.primeCount_univ_isEquivalent_div_log`. Qualitative Frobenius prime counts are `NumberField.Chebotarev.tendsto_frobeniusPrimeCount`, in `TauCeti.NumberTheory.Chebotarev.PrimeCounting.FrobeniusPrimeCount`. Chebotarev Layers 13–14 supply the rational progression and total-prime specializations. Their comparison with inclusive rational Chebyshev sums uses `NumberField.Chebotarev.frobeniusVonMangoldtCoeff_galEquivZMod_symm_of_coprime`. The all-input identity `frobeniusVonMangoldtCoeff_galEquivZMod_symm` requires `q % 4 ≠ 2`; at a level congruent to 2 modulo 4, discard the finitely many prime-power contributions dividing the level instead. For example, the unramified prime 2 in the conductor-reduced cyclotomic field cannot be treated as a unit modulo 6. The quantitative results below require new error bounds, not another qualitative PNT.

The current generic weight nonvanishing theorems in `TauCeti.NumberTheory.ArithmeticDirichletSeries.Cancellation.Nonvanishing` already cover `Re s > 1`, the square-with-cancellation case on `Re s ≥ 1`, and a quadratic weight away from `s=1`: use `continuedLFunctionOfWeight_ne_zero_of_one_lt_re`, `continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and `continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`. The Hecke boundary comparison below adds the exact ray-character identification and the quadratic endpoint at 1. Its continuation is the canonical Tate continuation; it is not an arbitrary function with a prescribed Euler product.

Completed ContourIntegration and the current contour library supply the general residue theorem and argument principle. Use `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` for a cycle in an open set, a finite singularity set, meromorphic germs at the singularities, an off-singularity trace and null-homology. Use `TauCeti.Contour.argumentPrinciple_nullHomologous` with an off-divisor piecewise C¹ closed path and finite integer meromorphic orders. The contour work here consists of rectangle adapters, branch and phase bounds, safe heights and infinite-height limits.

DifferentialGeometry §§5.3–5.5 supply oriented top-form integration, `integralTopForm_mextDeriv` on smooth half-space manifolds, and abstract-boundary Stokes for corners. §§5.6.2–5.6.3 supply planar Green, finite integer-weighted arc cancellation, and comparison with those manifold orientations; Layer12 supplies Laplace–Beltrami and Green identities. The Nielsen-core targets add finite orbifold-chart descent, boundary multiplicities and noncompact cusp limits.

GeometryOfNumbersAndQuadraticArithmetic owns quadratic classes and their CM/geodesic geometry; the precise normalized period comparisons belong here. The additional Nielsen-core and boundary construction needed for the negative-factor genus period is stated below, from hyperbolic geometry and its class dictionary, rather than assumed from an unnamed Fuchsian-orbifold extension.

## Conventions

All number fields have characteristic zero. A finite Galois representation is finite-dimensional over ℂ and uses **arithmetic** Frobenius. At a ramified prime its local polynomial acts on inertia invariants. Positive real powers mean `exp(s log x)` with the real logarithm and require `x>0`. A complex parameter power uses a specified logarithm branch or a specified covering-space lift. Pole values of totalized Lean functions never stand for meromorphic germs.

The functions ψ and θ use inclusive prime-power and prime cutoffs, respectively. A residue-class sum is defined for every residue, including a nonunit; asymptotics assume a unit class and positive modulus. Explicit formulas use ψ₀ with half weight at an endpoint prime power. The distance term excludes the endpoint prime power itself. Zeros carry analytic multiplicities. Every strict or inclusive height cutoff is stated at its use; changing it requires a local multiplicity bound. A low-zero estimate uses a bounded kernel such as `min(1,1/|ρ|)` and never divides by `Im ρ`.

A character modulus, its primitive conductor and an Artin conductor are distinct. A primitive quadratic character is obtained from a fundamental discriminant, including its 2-adic possibilities; the trivial discriminant 1 is allowed only where expressly stated. Standard Dirichlet and Hecke functional equations retain the conductor, the base discriminant, archimedean parities and the root number. Removing finitely many Euler factors multiplies an ordinary simple-pole residue by their values at 1; it preserves the coefficient of the logarithmic-derivative pole, not the original residue.

Write Γℝ(s)=π^(−s/2)Γ(s/2), and use the Γℂ convention of the consumed Tate integral. Haar measures and trace characters are fixed before comparing completed functions. For an imaginary quadratic discriminant D, `ω_D=|O_Kˣ|/2`; thus ω₋₄=2 and ω₋₃=3. A real quadratic geodesic is divided by the full norm-one unit group; if ε_D>1 is its least positive norm-one generator, its length is `2 log ε_D`. Ordinary and narrow classes are not interchanged without the norm-minus-one unit dichotomy.

For the quadratic genus-period formulas, write Λ_DIT(s,χ_d)=|d|^(s/2)π^(−s/2)Γ((s+α_d)/2)L(s,χ_d), with α_d=(1−sign d)/2, as a meromorphic completion (Duke–İmamoğlu–Tóth (5.13), p.964). Thus Λ_DIT=π^(α_d/2)|d|^(s/2)·DirichletCharacter.completedLFunction(χ_d,s). This differs for odd characters from the completion Λ_std=(|d|/π)^((s+α_d)/2)Γ((s+α_d)/2)L used for the imaginary quadratic endpoint values: Λ_std=(|d|/π)^(α_d/2)Λ_DIT. In particular the two completions agree for d>0; for d=−4, Λ_DIT(0)=Λ_DIT(1)=√π/2 whereas Λ_std(0)=Λ_std(1)=1; for d=−3, the corresponding values are √π/3 and 1/√3. These comparisons use canonical continued values at the endpoints.

Use the supplier’s `OrderLE` predicate for upper order. For an entire function and ρ≥0 its cobounded formulation is equivalent, by compact boundedness, to: for every `b>ρ` there is `C_b>0` with `|f(z)|≤C_b exp(|z|^b)`. Hadamard factorization requires a nonzero function. Strict positivity of every derivative additionally requires nonpolynomiality and the stated parity and real-sign conditions.

A Beurling prime system is an indexed locally finite nondecreasing sequence, with multiplicities; generalized integers are indexed finite prime multisets and can have coincident real values.

## Exact supplier contracts

### From ArithmeticDirichletSeries

Consume [ArithmeticDirichletSeries 6][R1]. Truncated arithmetic Perron for the actual von Mangoldt LSeries, with uniform error, off-endpoint and half-weight endpoint forms; finite-height kernel value at1 is arctan(T/c)/π, not1/2. For Siegel–Walfisz, also use the Layer6 quantitative Abel identity converting coprime-progression θ estimates to π with the Li main term and an explicit lower-endpoint term, retaining uniform constants for q≤(log x)^B; a fixed-modulus asymptotic alone is insufficient.

Consume [ArithmeticDirichletSeries 3][R2]. Ideal Euler-product/series identity under absolute convergence on Re(s)>1, including finite bad-prime omission and norm regrouping. General higher-dimensional Artin factors must not be put into the degree-one completely multiplicative ideal-weight carrier.

Consume [ArithmeticDirichletSeries 8][R3]. Generic meromorphic nonvanishing from nonnegative logarithmic coefficients, with meromorphic order at the distinguished pole ≤0 and the 3-4-1 inequality.

Consume [ArithmeticDirichletSeries 1][R4]. Finite norm fibres and norm regrouping for the restriction to an ordinary/narrow ideal class; zero coefficient set to 0. This layer alone is not the source of the Re s>1 absolute-convergence estimate.

Consume [ArithmeticDirichletSeries 8][R3]. The nonnegative 3-4-1 coefficient inequality for absolutely convergent logarithmic-derivative series.

Consume [ArithmeticDirichletSeries 8][R3]. For nonnegative norm-regrouped coefficients, the finite abscissa of convergence is a singular point. Supply the endpoint positivity/convergence corollary for a function holomorphic across that real abscissa.

Consume [ArithmeticDirichletSeries 9][R5]. For a nonnegative real sequence b with b(0)=0, require LSeriesHasSum b s (F s) on Re s>1 and a separately named G continuous on Re s≥1 with G=F−κ/(s−1) on Re s>1, κ≥0. Conclude the inclusive floor summatory sum divided by x tends to κ; no continuity of junk-valued subtraction at1 is assumed.

Consume [ArithmeticDirichletSeries 10][R6]. Inclusive ψ to θ to π transfer, including higher prime powers and Li(x)∼x/log x, specialized to ordinary primes or a fixed coprime class.

Consume [ArithmeticDirichletSeries 5][R7]. Total ideal-count bounds implying absolute convergence on Re s>1 for each class restriction by domination; combine with Layer1 norm regrouping.

Consume [ArithmeticDirichletSeries 4][R8]. Canonical locally finite inclusive counts of nonzero prime ideals via HeightOneSpectrum, including norm cutoffs; supply the carrier/local finiteness only, not the degree-uniform analytic lower bound.

Consume [ArithmeticDirichletSeries 6][R1]. Specialize the existing absolute-convergence/Perron and Abel infrastructure to the quadratic Hecke logarithmic-derivative coefficients and the smoothing1−N𝔞/Y. The kernel isY^s/(s(s+1)); zero-height contour shifts and quantitative residues are proved in Layers 1 and 4; they are not supplier outputs.

Consume [ArithmeticDirichletSeries 5][R7]. Canonical inclusive prime counts, ideal von Mangoldt coefficients, higher-prime-power and finite ramification-discard estimates for quadratic splitting. Match the exact degree/discriminant-dependent errors needed in LOW Lemma4.3; qualitative PNT asymptotics alone do not supply these errors.


### From LFunctions and ZerosOfLFunctions

Consume the open upstream roadmaps [LFunctions #248][R9] (head e632e3a4) and [ZerosOfLFunctions #253][R10] (head cce2e041). These are planned supplier interfaces, not declarations at the historical Lean pin. The following contracts use the same completed-function records and meromorphic germs. The [§0.30][R129] below identifies Mathlib's Dirichlet functions with the K=ℚ records once, including conductor, parity and deleted factors.

| Supplier | Exact contract consumed here |
| --- | --- |
| [0.1–0.2][R11] | `OrderLE f A` is cobounded big-O of exp(‖z‖^b) for every b>A; entirety is a separate hypothesis. `entireCompletion` is the unique analytic extension of the pole-cleared completion, with exact divisor and no zero at a former pole. For ζ its normalization is s(s−1)Λ, without 1/2. |
| [1.2–1.4][R12] | Analytic logΓ on slit sectors, Stirling remainder, vertical-strip modulus and phase, digamma and balanced Gamma-quotient estimates. Branches are analytic logarithms, not pointwise principal logs of Gamma values. Higher derivatives of the remainder are the local refinement below. |
| [3.3–3.4][R13] | Pole-cleared convexity uniformly in conductor at fixed degree and shift bounds, and order at most one for the actual ζ and primitive Hecke entire completions. Finite order alone does not imply order one. |
| [Layer 4][R14] | The locally finite analytic zero divisor, multiplicity-weighted restrictions and finite zero counts; local O(log analyticQ) counts at high height. A strict symmetric band means restriction of this divisor, not a second zero-multiset carrier. The local bounded-height quantitative refinement below retains conductor uniformity. |
| [5.2–5.7][R15] | Summability and tails for the zero divisor, E₁(w)=(1−w)exp(w), its API, locally uniform unordered canonical products, Hadamard for order≤1 with f(0)≠0, and its logarithmic derivative. The origin-zero adapter below is the only extension of this factorization. |
| [6.2–6.4][R16] | Fixed-degree conductor-uniform zero-free regions, including ζ; at most one simple real exception for a real character. `IsExceptionalZero`, `.unique`, `.divisor_eq_one`, `.sq_eq_one` are used with their supplied width. The c-parametrized predicate here inherits them only after the explicit width comparison below. This does not supply a family Landau–Page theorem. |
| [7.4][R17] | Multiplicity-sensitive Riemann–von Mangoldt formula, including its Gamma phase and safe-height argument. |
| [8.2–8.8][R18] | Truncated explicit formulas with the supplier's endpoint and admissible-height conventions; rational PNT remainder; fixed-character and fixed-field abelian effective estimates. The conductor-uniform character PNT and nonabelian Chebotarev estimates below go beyond those fixed-family contracts. |

For finite symmetric zero sums use the supplier divisor restricted by |Im ρ|<T and the critical strip. Endpoints at |Im ρ|=T are excluded explicitly; safe-height limits avoid endpoint zeros. General complex characters pair with their conjugates, rather than having a real-character conjugation symmetry. Completed/ArithmeticDirichletSeries supplies Perron kernels and half-weight endpoints; ZerosOfLFunctions owns their application to ζ, not this package.

### From GlobalNumberFields

Consume [GlobalNumberFields 9][R19]. Canonical HeckeCharacter and unitaryPart, local components, finite conductor, finite-order/ray-class dictionary, and ideal-character coefficients with the exact arithmetic normalization used by Tate §4.5.

Consume [GlobalNumberFields 10][R20]. Match finite-order real local sign characters to the odd gamma branch for the canonical character of a CM quadratic extension; global Artin at a real place sends a negative element to conjugation.

Consume [GlobalNumberFields 2][R21]. Use the ray-class carriers from that layer and the current Layer11 **orders and Picard groups** for `NumberFieldOrder.narrowToPic`, its surjectivity and the exact sequence of unit signatures, signs, narrow and ordinary classes. The maximal-order specialization is `narrowClassToClass`. These are existing exports, not a request for a new class group. Partition nonzero ideals into ordinary or narrow classes explicitly before forming partial series; the geometric reduced-quadratic-form identification remains the local adapter specified in Layer2.

Consume [GlobalNumberFields 10][R20]. For every nonzero squarefree integer d≠1, export the primitive quadratic field character χ_d modulo |D(d)| with D(d)=d if d≡1 mod4 and4d otherwise. For positive n, χ_d(n)=(D(d)/n), including the Kronecker factor at2; χ_d(0)=0. Prove primitivity, parity and conductor=|D(d)|.

Consume [GlobalNumberFields 10][R20]. Import the finite cyclotomic Galois identifications and their compatible transition maps from GlobalNumberFields layer 10. Construct the inverse-limit identification Gal(Qcycl/Q)=Ẑ× by compatible finite restrictions. That layer explicitly supplies arithmetic Frobenius and no global Artin map; do not assume a class-field existence or reciprocity theorem from it.

Consume [GlobalNumberFields 4][R22]. Import the current finite-adèle arithmetic contract, with the actual restricted-product carrier and the integral compact-open subgroup; normalized additive Haar is supplied by AdelicAlgebraicGroups AA.0.


### From AutomorphicLFunctionsAndLocalFactors

Consume its AL.0 **Bessel transforms** contract at [PR924, head ab4ea5c][AL-Bessel]: for complex ν and positive real x, K_ν(x)=(1/2)∫_0^∞exp(−x(u+u⁻¹)/2)exp(νlog u)du/u, absolutely convergent, equal to its cosh-kernel presentation, entire in ν, even in ν, and K_(1/2)(x)=√(π/(2x))e^(−x). This is a lower-tier planned supplier, not an import from the historical pins. The positive-axis asymptotic remainders and the divisor transform below extend that supplied function; they do not define K again.

Consume [AutomorphicLFunctionsAndLocalFactors AL.0, Vector-space Poisson comparison and compact-uniform estimates][R23], read at the head of upstream PR924. Its admissible class 𝔷 already includes continuity/integrability of f and f̂, joint compact-uniform absolute translated/dilated sums for both, and weighted idele integrability for every σ>1. Consume `SchwartzBruhat.AdelicSpace.tateClass` and the completed archimedean tensor carrier; this extension is not new work here.

Consume AutomorphicLFunctionsAndLocalFactors AL.1. Local and global Tate zeta integrals on the imported admissible class, Euler factorization with different and measure factors, meromorphic continuation, local gamma factors and global functional equation retaining the trivial-character residues. This does not by itself assert nonvanishing on Re(s)=1. Consume its global zeta integral, completed Hecke function, Tate functional equation, idele-class volume and global epsilon factor.

Consume AutomorphicLFunctionsAndLocalFactors AL.3. For the actual Π_alg representation carrier and its canonical completed Rankin–Selberg Λ(s,π×π′), the predicate GRH means every nontrivial zero has real part 1/2. Do not assert this predicate as a theorem.

### From NumberFieldArithmetic

Consume [NumberFieldArithmetic 2][R24]. Arithmetic Frobenius at a chosen nonzero prime, conjugacy independence across primes above an unramified base prime and uniqueness modulo inertia at ramified primes; for K/ℚ the residue action is x↦x^p on O_K/P.

Consume [NumberFieldArithmetic 2][R24]. Decomposition/inertia groups at all nonzero primes, arithmetic Frobenius on residue extensions and conjugacy/tower compatibility on the inertia-invariant representation. Unramified Frobenius alone does not supply the ramified polynomial.

Consume [NumberFieldArithmetic 1][R25]. Use the existing1.4 doubleCosetEquiv between H\G/D and primes of F=L^H above p, with e,f and norm powers; adapt to the inertia-orbit blocks in the ramified local determinant identity.

Consume [NumberFieldArithmetic 7][R26]. For a degree-2g CM field E and its actual normal closure L/Q, identify Gal(L/Q) with its faithful permutation action on the 2g embeddings and deduce [L:Q]≤(2g)!. The stronger quantitative discriminant comparison D_L≤D_E^A_g is a required refinement, with A_g depending only on g; it is not asserted to be an existing Layer7 export. Combine it with the separately assigned general Artin-conductor comparison, not a ray-modulus bound.


### From ArithmeticGaloisRepresentations

Consume [ArithmeticGaloisRepresentations Layer3, §§3.2–3.5][R94] for a finite-dimensional complex representation inflated from Gal(L/F), with no excluded finite places. Use `artinConductor_eq_lowerSum`, `artinConductor_finiteGroup_integral`, `artinConductor_independent` and `globalConductor` with Σ=∅. Thus a_v=Σ_(i≥0)(|G_i|/|G_0|)codim V^(G_i) is a nonnegative integer, independent of the chosen prime, and N(ρ)=∏v^(a_v) is the existing `artinConductorIdeal` interface. `globalConductor_add`, `globalInduction_conductor` applied to Ind1, and irreducible decomposition supply direct-sum multiplicativity and Disc(L/F)=∏_ρN(ρ)^(dimρ). `artinConductor_eq_characterConductorExp` identifies linear characters with the ClassFieldTheory conductor. Zero, trivial, tame and dyadic examples below test this imported interface. Its lower filtration and different come from LocalFieldsRamification Layers3–4, not LocalGaloisGroups. These are planned lower-tier contracts, not theorems already at the Lean pin.

### From ClassFieldTheory

Consume [ClassFieldTheory 11][R27]. Global reciprocity identification of one-dimensional finite Galois characters with ray-class characters, compatible with the existing ideal Artin map and arithmetic-Frobenius normalization; no second reciprocity carrier.

Consume [ClassFieldTheory 13][R28]. Specialize the abelian conductor–discriminant formula to a quadratic extension: f_η is its relative discriminant and D_F N(f_η)=D_E/D_F. Use the canonical character from global reciprocity, not an imprimitive modulus.

Consume [ClassFieldTheory 7][R29]. Use characterConductorExp and the unramified criterion: local conductor exponent0 iff the Galois character is trivial on inertia, compatible with CFT11 globalArtinMap_local and arithmetic Frobenius. This fixes both full local factors in the linear Artin/Hecke comparison.

Consume [ClassFieldTheory 11][R27]. Global Artin reciprocity identifying the characters of Gal(L/E) for abelian L/E with Hecke characters of E of finite order, with conductors; used to write ζ_L as a product of Hecke L-functions.


### From RepresentationTheory

Consume [RepresentationTheory/InductionRestriction 6][R30] for rational Artin induction. For integral Brauer induction use the current library's `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` in `TauCeti.RepresentationTheory.Induction.Brauer.Induction`: over an algebraically closed characteristic-zero field, a finite-group character is an integer combination of characters induced from irreducibles of elementary subgroups. Such subgroups are nilpotent by `TauCeti.IsElementary.isNilpotent` (`TauCeti.GroupTheory.Elementary`). Their irreducibles are induced from linear characters by `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (`TauCeti.RepresentationTheory.Induction.Monomial`). Combine these existing results with `TauCeti.indClassFun_indClassFun_subgroupOf` (`TauCeti.RepresentationTheory.Induction.ClassFunction`) to obtain χ_ρ=Σ n_j Ind_{H_j}^G χ_j with n_j∈ℤ and χ_j one-dimensional. The proof of `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` in `TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField` already performs this reduction. These declarations belong to the current library rather than the historical pin. No new monomiality theorem is required here; rational induction alone still gives only a meromorphic power.

For the Colmez finite-family estimates, the remaining uniformity step is finite: transport each group of order m≤(2g)! to a group law on `Fin m`. There are finitely many such laws and finitely many irreducible characters for each. Choose one integral induced-linear expression for each irreducible and take the maximum of its number of terms and sum of absolute coefficients, enlarged to at least one. This defines a bound B_g independent of the CM field. Transporting the chosen character identities along group isomorphisms preserves those bounds. The discriminant and analytic-conductor estimates are separate Layer 2 inputs.

Consume [RepresentationTheory/InductionRestriction 3][R31]. Use the existing representation-level Mackey3a isomorphism for restriction to D of Ind_H^Gσ, with exact conjugated intersection maps. Add the inertia-fixed cyclic-orbit determinant adapter in AN; do not claim character induction alone gives a ramified local determinant.


### From AutomorphicSpectralTheory

Consume §0.25 at [PR925, head d2a1dbd][AS-Bessel]: J_ν is the principal-power first-kind Bessel function, with its absolutely convergent reciprocal-Gamma series, positive-axis differential equation and recurrences, half-order formula and integral-order reflection. Current Mathlib `Analysis/SpecialFunctions/Bessel.lean` supplies `Complex.besselJ` and `Complex.besselJ_neg_int`; they are absent from the historical Mathlib pin. The supplier adds the analytic API. No first-kind carrier is planned here or introduced into the pinned Suggested file. The second-kind integral/connection and its error estimates are the local extension in §3.23b.

Consume AutomorphicSpectralTheory AS.2. The normalized level-one Eisenstein theory supplies the exact level-one half-sum, completion, Fourier expansion, meromorphic continuation and functional equation. Supply only the differentiated cusp bounds and critical-line boundary limit used in DIT (7.10), matching the oriented geodesic/core conventions. This refinement is required for Stokes; no second Eisenstein continuation is planned.

### From DifferentialGeometry

Consume [DifferentialGeometry Layer 12][R32]: the existing Riemannian volume, `laplaceBeltrami` and Green identity `integral_mul_laplaceBeltrami`. Its sign is div grad; the positive scalar operator here is its negative.

### From GeometryOfNumbersAndQuadraticArithmetic

Consume [GlobalNumberFields GN11, orders and Picard groups][R35]: `NumberFieldOrder.narrowToPic`, its surjectivity and the exact unit-sign sequence Oˣ→{±1}^r₁→NarrowPic O→Pic O→1, with maximal-order specialization `narrowClassToClass`. Only invertible proper ideals enter these groups; noninvertible proper ideals belong to its separate class monoid. Consume GeometryOfNumbersAndQuadraticArithmetic for the underlying lattice/form dictionary. The extra CM-point/full-norm-one-stabilizer/oriented-geodesic comparison is owned by the Layer2 quadratic dictionary and Nielsen-core targets below, with arc length2 log ε_D. Those local adapters use the imported ordinary/narrow map rather than asking GN.3 to construct it again.


### From tauceti

Consume `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`. Consume the completed contour theory and its current-library corollaries: TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous for off-pole cycles and TauCeti.Contour.argumentPrinciple_nullHomologous for the logarithmic derivative. These are proved in Analysis/Contour/Cycle/Residue and Analysis/Contour/Argument/Cycle. Match a finite zero-avoiding rectangle to the native piecewise-C1 closed curve/cycle, open neighborhood, finite singularity set, null-homology, order and winding conventions. This is an adapter request; do not plan the general residue theorem, argument principle or homological Cauchy theorem again. The zeta phase estimates and symmetric infinite-contour limits are constructed here.


### From Chebotarev

Consume [Chebotarev 13][R43]. Consumed as written (Tau Ceti roadmap, done at current main): for L = ℚ(ζ_q), K = ℚ and the class of a unit a mod q, ϑ_C(x)/x → 1/φ(q) and π_C(x) ~ (1/φ(q)) x/log x, through frobeniusTheta and frobeniusPrimeCount, with the arithmetic-progression identification of the Frobenius prime set.

Consume [Chebotarev 14][R44]. Consumed as written: the all-prime denominator ψ_K(x) ~ x (prime ideal theorem) and the consistency theorems, at K = ℚ.

Consume [Chebotarev 11][R45]. Consumed as written: frobeniusVonMangoldtCoeff, frobeniusPsi and frobeniusTheta for L/F and C, with the o(x) discard estimates of 11.3, as the carriers on which the effective error terms are stated.

Consume [Chebotarev 8][R46]. Consumed as written: the cyclic fixed-field fibre count used in the Deuring reduction from L/F and C to L/L^⟨g⟩ and g.


## How to read the build

Targets retain their original layer and subsection numbers. Named prerequisite links give the order within each layer; every prerequisite is in this part or an earlier supplier. A source and locator apply to the numbered topic and its subsidiary ingredients unless a nearer citation is supplied. Constants are uniform only in the stated parameters. A source's external proof input remains a target requiring proof, never an assumption that the result is formalized.

### Prerequisite abbreviations

Each abbreviation expands to the exact prerequisite list below; these are shared lists, not additional mathematical targets.

- **B1:** [§2.11][R195]; [NumberFieldArithmetic 1][R25]; [NumberFieldArithmetic 2][R24]; [RepresentationTheory/InductionRestriction 3][R31]; [§2.19][R207]; [§2.5][R190]; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2]; [§2.3][R188]; [ClassFieldTheory 11][R27]; [ClassFieldTheory 7][R29]; [GlobalNumberFields 9][R19]; [§2.29a][R208]; [§2.29b][R209]; [§2.29c][R210]; [§2.29d][R211]; [§2.29e][R212].
- **B2:** GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1; AutomorphicSpectralTheory AS.2.
- **B3:** [§2.5][R190]; [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27].
- **B4:** `B3`; [§2.7][R192]; AutomorphicLFunctionsAndLocalFactors AL.1; [§2.18a][R194].

<a id="layer-0"></a>

## Layer 0: Entire functions and quantitative prime estimates

Start with genuine entire-function factorization and the pole-cancelled ξ-function. The arithmetic results then specify the zero-free regions, exceptional-zero alternatives and numerical ranges needed for effective prime estimates. Constants described as effective must include the finite threshold certification; an ineffective Siegel constant is never silently used as an effective one.

<a id="s0-1"></a>

### 0.1 Exceptional real zero

For c>0 define the c-exceptional predicate for a nontrivial primitive quadratic character χ of conductor N>1 by L(β,χ)=0 and 1−c/log N<β<1, with β real. The exceptional zero used in Proposition 7.1 is this predicate specialized to its effective absolute c_star>0; its conductor is called exceptional. The general parameter does not assert the existence of any zero. The representative predicate is `IsExceptionalRealZero`; `IsExceptionalRealZero.mono` increases the positive width parameter.

Use the actual continued primitive quadratic Dirichlet L-function; this predicate does not assert existence of a zero.

- `ExceptionalRealZero.iff`: For c>0 and N>1, the predicate holds exactly when χ is primitive, nonprincipal and quadratic, L(β,χ)=0, and 1−c/log N<β<1. Equivalently, for arbitrary c,N it is the conjunction of all these conditions, including c>0 and N>1.
- `ExceptionalRealZero.bounds`: An exceptional β lies strictly below 1 and strictly above the specified logarithmic cutoff.
- `ExceptionalRealZero.mono`: For 0<c≤c′ the c-exceptional predicate implies the c′-exceptional predicate, with N>1.

**Checks.**

- β=1 is excluded even if a chosen totalized function vanishes there.
- β=1−c/log N is excluded by the strict inequality.
- The principal character and N=1 are outside the domain; log 1 is never used as a denominator.
- Given c>0, N>1, a primitive nonprincipal quadratic χ, a real β with L(β,χ)=0 and 1−c/log N<β<1, the c-exceptional predicate holds. This is conditional and makes no existence assertion.

See [47][R47], Section 7, Proposition 7.1 and following paragraph, pp. 373-374.

The comparison API is `ExceptionalRealZero.to_supplier`: let c₁>0 be the degree-one zero-free constant from [6.3–6.4][R16]. For 0<c≤min(c₁/3, (log 3)/2), every c-exceptional β satisfies the supplier's `IsExceptionalZero` predicate after the rational dictionary. Indeed primitive nonprincipal quadratic conductors have N≥3, β>1/2, and log analyticQ(χ,0)≤log(4N)≤3log N. Thus c/log N≤c₁/log analyticQ(χ,0), so the strict local cutoff lies inside the supplier's closed region. Conversely membership is the supplier predicate together with the stricter cutoff and the primitive nonprincipal quadratic conditions. Import uniqueness and simplicity only under this width restriction; arbitrary c>0 does not imply them. Reducing c preserves any exclusion statement, but need not preserve existence of an exceptional zero.

*Needs:* `DirichletCharacter.LFunction`; [§0.30][R129]; [6.3–6.4][R16].

<a id="s0-2"></a>

### 0.2 Chebyshev sum in a residue class

For q≥1 and a∈ZMod q, θ(x;a,q)=Σ_{p prime, p≤x, p≡a mod q} log p. Inclusive real cutoff, empty for x<2. This specializes the Chebyshev sum; a coprimality hypothesis is required by asymptotic theorems, not by the finite sum. The representative sums are `thetaAP`, `psiAP` and `primeCountAP`; `thetaAP_one` identifies level one and `sum_thetaAP` sums over the full residue system.

- `theta_ap.sum`: Evaluation is the finite filtered prime sum just displayed.
- `theta_ap.level_one`: θ(x;0,1)=Chebyshev.theta x.
- `theta_ap.sum_classes`: For q≥1, summing over all residue classes modulo q gives Chebyshev.theta x. The finite sum is not specified at q=0, where ZMod 0 is infinite.

**Checks.**

- θ(1;a,q)=0.
- θ(5;3,8)=log 3 and θ(5;5,8)=log 5.
- θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

θ(1;a,q)=0.

See [47][R47], §§6–9, especially p. 369.

*Needs:* `Chebyshev.theta`.

<a id="s0-3"></a>

### 0.3 Schoenfeld explicit Chebyshev bound

For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x. The representative signature is `theta_lt`.

Use the stated unconditional published theta upper bound, not an RH conditional table. Supply a certified finite-range check below its analytic threshold.

See [47][R47], Equation (10), p. 362; Schoenfeld 1976, concluding note p. 360.

*Needs:* `Chebyshev.theta`.

<a id="s0-4"></a>

### 0.4 Prime powers do not erase the character-sum margin

Put ε=0.002811. For real k≥2*10^10, the prime-power mass M=psi(k)−theta(k)−psi(k/2)+theta(k/2) is smaller than (((1−3*ε)/8)−0.1239)*k. For b:ℕ→ℂ with |b(n)|≤1 whenever k/2<n≤k, put P=Σ_{k/2<p≤k, p prime}b(p)log p and V=Σ_{k/2<n≤k}b(n)Λ(n). Then |V−P|≤M, so |P|≥(1−3*ε)*k/8 implies |V|>0.1239*k.

Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating. Insert the certified constants from the source; retain the strict inequality. On prime terms Λ(p)=log p, and on higher prime powers use |b(p^j)|≤1. The triangle inequality gives |V−P|≤M and |V|≥|P|−M.

For a direct certificate, M≤ψ(k)−θ(k)≤1.000081(√k+(log k/log2)k^(1/3)). After division by k both terms decrease for k≥k₀=2·10^10: for the second use log k>3/2. At k₀, √k₀>140000, k₀^(1/3)>2700 and log k₀/log2<35. Therefore M/k≤(1000081/1000000)(1/140000+35/7290000)<367/8000000=((1−3ε)/8)−0.1239, an exact rational inequality. The prime-power sum has at most log k/log2 terms with exponent≥3; no rounding of k is needed. The weighted implication requires the same coefficient sequence in both sums and the bound |b(n)|≤1 at higher prime powers, not only at primes.

See [47][R47], §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*).

*Needs:* `Chebyshev.psi`; `Chebyshev.theta`.

<a id="s0-5"></a>

### 0.5 Rosser–Schoenfeld explicit prime-count bounds

For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)). The representative real-cutoff signature is `rosser_schoenfeld_primeCounting`.

Use the original two inequalities on the exact real range x≥59. Certify the finite threshold region with rational enclosures for logarithms.

See [47][R47], §9 proof, p. 382; Rosser–Schoenfeld Theorem 1.

*Needs:* `Nat.primeCounting`.

<a id="s0-6"></a>

### 0.6 Bounded-height Landau–Page theorem

There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

Apply ZerosOfLFunctions 6.2–6.4 through the [§0.30][R129]. For q,|t|≤T, log(q(|t|+2))≤3log T+O(1): shrink one effective width to make every exception real, simple and attached to a real character. For distinct primitive real characters, ζLχ₁Lχ₂L(χ₁χ₂) has nonnegative Euler logarithmic coefficients; its product conductor≤T² permits the [§0.17][R133] at the same smaller width. Include bounded T by shrinking again, and require the cutoff>1/2 at T=2. The principal character contributes no exception: the imported ζ region excludes nonreal zeros, while η(s)>0 gives ζ(s)=η(s)/(1−2^(1−s))<0 for0<s<1. Count multiplicities throughout.

See [47][R47], §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26.

*Needs:* `DirichletCharacter.LFunction`; `DirichletCharacter.conductor`; [§0.30][R129]; [§0.17][R133].

<a id="s0-7"></a>

### 0.7 Quadratic real-zero separation from one

For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

For primitive q≥400000, BMOR Lemmas6.3–6.5 give L(1,χ)≥12/√q and |L′(σ,χ)|<0.27356log²q on1−1/(4√q)≤σ≤1. Mean value gives the stronger constant12/0.27356>40 for a zero in this interval; farther left use log²q>160. The derivative proof uses partial summation, explicit Pólya–Vinogradov and cutoff q^0.655; the value proof uses the quadratic class-number formula, negative-discriminant class numbers, and positive-discriminant regulators with finite verification. Supply checked certificates for these computations and §6.1's q<400000 zero verification. For imprimitive characters, deleted factors have no positive real zeros and √qlog²q increases for q≥3.

See [48][R48], Proposition1.11, printed p.436; §6.1, Lemmas6.3–6.5 and proof of Proposition1.11, printed pp.491–494. Bennett–Siksek §12 p.387 uses this estimate.

*Needs:* `DirichletCharacter.LFunction`.

<a id="s0-8"></a>

### 0.8 Weighted-prime sum input to the factorial estimate

There exists an absolute real constant E such that, for every real x≥319, log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x). The same E applies at both endpoints of every interval subtraction.

Use the published two-sided estimate with a single constant E, on x≥319. The interval corollary is a separate subtraction lemma below.

See [47][R47], §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* `Chebyshev.theta`.

<a id="s0-9"></a>

### 0.9 Siegel's theorem

For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.

Use the following Goldfeld positivity argument in the primitive quadratic normalization. For any small η>0, if no real primitive L-function has a zero in [1−η,1), the zero-gap-to-residue argument gives an effective lower bound depending on η. Otherwise fix one such χ₁ of least conductor q₁ and its rightmost real zero β₁. For any other primitive real χ with conductor q≥q₁, put f=1∗χ∗χ₁∗χχ₁. Its Euler logarithmic coefficients are nonnegative because (1+χ(p)^j)(1+χ₁(p)^j)≥0, so f(n)≥0 and f(1)=1. For a fixed smooth cutoff φ equal1 on[0,1], supported in[0,2], Mellin inversion evaluates Σ f(n)n^(−β₁)φ(n/x). It is≥1. Shift its contour to Re s=−1: F(s+β₁)=ζ Lχ Lχ₁ Lχχ₁ cancels the Mellin pole at0 because L(β₁,χ₁)=0, and the sole pole crossed is at1−β₁. The primitive functional equations and Gamma remainder give a uniform polynomial conductor-height bound |F(β₁−1+it)|≤C(q(|t|+2))^C; repeated integration by parts in φ bounds its Mellin transform by every inverse height power. Choose x=C′q^C so the left integral is≤1/2. The residue comparison then gives
`1/2 ≤ x^(1−β₁)L(1,χ₁)L(1,χ)L(1,χχ₁)Φ(1−β₁)`.
Here |Φ(1−β₁)|≤2/(1−β₁), |L(1,χχ₁)|≤C log(q q₁), and the [§0.31a][R134] gives L(1,χ₁)≤C(1−β₁)q₁^((1−β₁)/2)log²q₁. Since q₁≤q, these imply L(1,χ)≥c_η q^(−C₀η)/log³q. Choose η small relative to ε and absorb the logarithms. Characters of conductor<q₁ and χ₁ itself form a fixed finite set whose positive L(1) values have a positive minimum, by native nonvanishing and reality/positivity. That minimum is the precise ineffective step. No estimate makes q₁ effectively bounded.

The case with no near-one zero uses the same elementary log-derivative integration as the zero-gap-to-residue step: on [1,1+1/log q], isolate a possible real zero and bound the other zero/gamma contributions by O(log q); at the right endpoint the Euler product bounds L from below. This gives L(1,χ)≥c min(1/log q,1−β), and a fixed gapη is sufficient. The cutoffs, contours and conductor powers use the specified suppliers.

See [49][R49], Theorem12.9 and its Goldfeld proof pp.125–127. The proof just described uses its contour/positivity argument and retains all character and conductor factors. The theorem here is the L-value form; the zero-separation form follows with the derivative adapter specified below.

*Needs:* `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; [§0.31a][R134]; [§0.30a][R135]; [§0.30][R129]; native Mellin inversion and finite contour shift.

<a id="s0-10"></a>

### 0.10 Prime-number input

For all sufficiently large x, the number of primes in (x,3x] lies between 4+x/log x and 3x/log x.

Apply the rational PNT at x and 3x, subtract, and choose the threshold to absorb the constant 4.

See [50][R50], §3.5, proof of Theorem2, p.25.

*Needs:* [qualitative prime asymptotics][R136].

<a id="s0-11"></a>

### 0.11 Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)

For X≥2, Σ_{p<X}(log p)/p=log X+O(1), with an absolute implied constant.

Sum log n=Σ_(d|n)Λ(d) to get Σ_(n≤x)log n=Σ_(d≤x)Λ(d)floor(x/d). Chebyshev ψ(x)=O(x) controls floor replacement. Insert xlog x−x+O(log x), divide by x, and remove higher powers with the convergent majorant Σ_(m≥2)log m/[m(m−1)]. The layer's Mertens note specifies both elementary inputs. Changing p≤x to p<x costs at most log x/x for x≥2.

See [49][R49], Theorem3.4(a) and proof, printed p.40.

*Needs:* `ArithmeticFunction.vonMangoldt_sum`; `Chebyshev.psi_le_const_mul_self`; `sum_mul_eq_sub_sub_integral_mul`.

<a id="s0-12"></a>

### 0.12 Effective distance of a quadratic real zero from one

For every ε>0 there is an effectively computable c_ε>0, fixed before D and β, such that for every nonzero squarefree integer D≠1 and real zero β∈(1/2,1) of the canonical continued primitive field-character L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε). The conductor is Q_D=|Disc(Q(√D))|, with |D|≤Q_D≤4|D|; conductor/radicand conversion only changes c_ε effectively.

The effective quadratic class-number formulas give L(1,χ)≥c/√Q: imaginary fields use h≥1,w≤6; real fields use h≥1 and ε≥(1+√5)/2, from integral trace and norm±1. The [§0.31b][R137] gives |L′|≤Clog²Q on1−1/log Q≤σ≤1. Mean value handles a zero there; otherwise the gap is already≥1/log Q. Use Q_D≤4|D| and absorb logarithms in |D|^ε effectively. This proves the effective exponent1/2 bound; KP supplies its application locator, not an ineffective Siegel replacement.

Only real zeros in(1/2,1) are used; trivial negative zeros are outside the interface. No ineffective Siegel constant can discharge the effective c_ε contract. At D=−1 or2 the positive conductor is4 or8, respectively; the finite small-conductor range is included effectively.

See [51][R51], §7.2 proof of Proposition7.6, p.62, immediately after(7.7).

*Needs:* `DirichletCharacter.LFunction`; `NumberField.classNumber`.

<a id="s0-13"></a>

### 0.13 Exceptional quadratic squareclasses

For 0<c<1/2 let S(c) consist of nonzero squarefree d≠1 such that the primitive quadratic character of Q(√d) has a real zero β∈[1−c/log(|d|+4),1]. The conductor is |d| or 4|d| as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing |d|; an infinite enumeration requires infinitude, which is not asserted.

Import the canonical quadratic-field character, with D(d)=d for d≡1 mod4 and4d otherwise, conductor|D(d)| and values (D(d)/n). Separate n's2-primary factor before the odd-denominator Jacobi symbol. Primitivity and all values constrain the construction; arbitrary character data are insufficient. Use the continued LFunction and real zeros in[1−c/log(|d|+4),1], not LSeries outside convergence. Height-bounded selections are finite; neither zero existence nor an infinite enumeration follows.

- `exceptional_squareclasses.membership`: Membership is the stated near-one zero condition for the primitive field character.
- `exceptional_squareclasses.mono`: If 0<c≤c′<1/2 then S(c)⊆S(c′).
- `exceptional_squareclasses.finite_height`: For each B there are finitely many d∈S(c) with |d|≤B.
- `exceptional_squareclasses.conductor`: Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

**Checks.**

- d=1 is excluded, so a principal pole cannot be called an exceptional zero.
- d=−1 has conductor 4, not conductor 1.
- d=2 has conductor 8, not 2.
- The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.


See [51][R51], §7.2 Definition7.5 and its enumeration paragraph, p.61.

*Needs:* [GlobalNumberFields 10][R20]; `DirichletCharacter.LFunction`.

<a id="s0-14"></a>

### 0.14 Pole-cancelled Riemann xi

ξ(s)=1/2+(1/2)s(s−1)completedRiemannZeta₀(s). This is the entire extension of (1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s) away from the completed poles, not the pointwise pole-multiplication convention at s=0,1. Use `riemannXi` for the pole-cancelled entire function, `riemannXi_eq` for the identity off 0 and 1, and `riemannXi_one_sub` for its reflection.

The comparison is `2 * riemannXi = entireCompletion (dirichletData 1)`, using [LFunctions 4][R52] and [0.2][R11]. This equality is of analytic extensions, including 0 and 1. Entirety, symmetry and order one are inherited from that completion. In particular ξ(0)=ξ(1)=1/2 and ξ(2)=ξ(−1)=π/6; omitting the factor 2 would fail both pairs of values.

Define ξ=1/2+s(s−1)completedRiemannZeta0(s)/2. Entirety, reflection and endpoint1/2 follow from completed0 and finite algebra. Off0,1, completedRiemannZeta_eq gives the regular completed comparison; comparison with Γ·ζ additionally requires Gamma nonvanishing.

- `riemann_xi.entire`: ξ is entire by differentiability of the pole-subtracted completion.
- `riemann_xi.reflection`: ξ(1−s)=ξ(s) for all complex s.
- `riemann_xi.comparison`: For s≠0,1, ξ(s)=(1/2)s(s−1)completedRiemannZeta(s).
- `riemann_xi.endpoints`: ξ(0)=ξ(1)=1/2.

**Checks.**

- ξ(0)=1/2, not0.
- ξ(1)=1/2, not0.
- ξ(2)=ξ(−1)=π/6, fixing both the centre 1/2 and the factor 2 against the supplier completion.

ξ(0)=1/2, not0. ξ(1)=1/2, not0. ξ(2)=ξ(−1), checking the centre1/2.

See [53][R53], §5.1 (5.1.4), xi definition and reflection, printed pp.34–35; Lemma8.3 p.47.

*Needs:* `completedRiemannZeta₀`; `differentiable_completedZeta₀`; `completedRiemannZeta₀_one_sub`; `completedRiemannZeta_eq`.

<a id="s0-15"></a>

### 0.15 Elementary canonical factors of every genus

For n≥0 define E_n(w)=(1−w)exp(Σ_(j=1)^n w^j/j), with an empty sum for n=0. This is an entire function with a simple zero exactly at1. Genus1 agrees with the existing E₁.

Use the finite polynomial sum and exponential. On |w|≤1/2 cancel the first n Taylor coefficients of log(1−w); the remaining series is O_n(|w|^(n+1)).

- `canonical_factor.zero_genus`: E₀(w)=1−w.
- `canonical_factor.one_genus`: E₁(w)=(1−w)e^w agrees with ZerosOfLFunctions 5.3 on the nose.
- `canonical_factor.entire`: E_n is entire for every n.
- `canonical_factor.zeros`: E_n(w)=0 iff w=1, and its vanishing order there is1.
- `canonical_factor.log_tail`: There is C_n>0 with |log(1−w)+Σ_(j=1)^n w^j/j|≤C_n|w|^(n+1) for |w|≤1/2, using the principal analytic log.

**Checks.**

- E_n(0)=1 for every n.
- E_n(1)=0 for every n.
- E₀(w)=1−w, with no exponential factor.
- E₁(w)E₁(−w)=1−w².

See [54][R54], AppendixB.1, definition preceding(B.1), printed p.901.

*Needs:* `Complex.exp`.

<a id="s0-16"></a>

### 0.16 Mod-eight prime mass

With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

Subtract the same published residue-class theta error bound at k and k/2, both within its range. Retain a=3 or 5, q=8 and k≥2·10^10.

See [47][R47], §6, pp. 369,372, Ramaré–Rumely input.

*Needs:* [§0.2](#s0-2).

<a id="s0-17"></a>

### 0.17 Two-real-zero inequality

There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

Present χ₁,χ₂ and χ₁χ₂ at their common level dividing N₁N₂. At each good prime, the coefficients of the negative logarithmic derivative of ζLχ₁Lχ₂Lχ₁χ₂ have the nonnegative factor (1+χ₁(p)^k)(1+χ₂(p)^k). The two distinct primitive quadratic characters have nonprincipal product. Use ZerosOfLFunctions 6.4b–6.4d for primitive-source corrections, Gamma terms and the real-part logarithmic-derivative bound. Discard every zero term except the two assumed near-one real zeros; for 1<σ≤2 this gives
`1/(σ−β₁)+1/(σ−β₂) ≤ 1/(σ−1)+C log(N₁N₂)`
with one effective absolute C≥0. Set ℒ=log(N₁N₂), a=1/(4(C+1)), b=a/4 and σ=1+a/ℒ. If both β_j≥1−b/ℒ, the left side is at least 2ℒ/(a+b)=1.6ℒ/a, larger than ℒ/a+Cℒ, a contradiction. Choose 3c_star≤b, and shrink it for the exceptional-predicate width comparison. This proves the strict minimum inequality, including zeros exactly on the proposed lower boundary; it is stronger than uniqueness for one character. The two-real-zero proof also supplies the family step of Landau–Page.

See [47][R47], Proposition 7.1(i), (23), p. 373.

*Needs:* [§0.1](#s0-1); `DirichletCharacter.LFunction`.

<a id="s0-18"></a>

### 0.18 Effective character prime-number estimate

For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros. Optimize the height using the conductor-uniform region; preserve log N and the effective constants.

See [47][R47], Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27.

*Needs:* [§0.1](#s0-1).

<a id="s0-19"></a>

### 0.19 Explicit reciprocal-prime estimate

There is the prime Mertens constant B=0.26149.. such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

Use the original reciprocal-prime theorem and its common prime Mertens constant. Keep x≥286; the rounded decimal is a label, not the definition of B.

See [47][R47], §9 proof, p. 382; Rosser–Schoenfeld Theorem 5.

*Needs:* [§0.8](#s0-8).

<a id="s0-20"></a>

### 0.20 Weighted prime sum on an interval

For x≥y≥319, Σ_{y<p≤x}(log p)/p>log(x/y)−1/(2 log x)−1/(2 log y).

Subtract the lower bound at x and the upper bound at y; the same E cancels. Use the log quotient identity for positive x,y.

See [47][R47], §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* [§0.8](#s0-8).

<a id="s0-21"></a>

### 0.21 Mertens's second theorem: the reciprocal-prime sum

There is a real B such that Σ_{p≤x}1/p=log log x+B+O(1/log x) for real x≥2, with an absolute implied constant.

Pass to inclusive primes at cost≤log x/x. For bounded R(t)=Σ_(p≤t)log p/p−log t, Abel summation with1/log t gives Σ_(p≤x)1/p=log log x+B+R(x)/log x−∫_x^∞R(t)/[t(log t)²]dt. The defining integral for B converges absolutely; the remaining tail≤sup|R|/log x, for x≥2.

One B and one absolute error constant work for every real x≥2. At x=2 the prime 2 is included; changing the endpoint convention only changes the bounded remainder.

See [49][R49], Theorem3.4(b) and its proof, printed pp.40–41.

*Needs:* [§0.11](#s0-11); `sum_mul_eq_sub_sub_integral_mul`.

<a id="s0-22"></a>

### 0.22 Origin-zero adapter for Hadamard factorization

Let f be entire, not identically zero, with `OrderLE f 1`, and let m be its finite analytic order at 0. Extend f(z)/z^m analytically across 0 to g. Then g(0)≠0 and `OrderLE g 1`. Apply [ZerosOfLFunctions 5.4–5.6][R15] to g and multiply by z^m. The resulting product has precisely the nonzero divisor of f, with multiplicities and the supplier's locally uniform unordered convergence. Only removal of the origin zero belongs here; the canonical product, zero estimates and affine logarithm are imported.

Use the finite analytic-order factorization near 0 and the quotient elsewhere. They agree on the punctured neighbourhood. At infinity |z|≥1 implies |g(z)|≤|f(z)|, which preserves the supplier's cobounded growth predicate. No assertion is made for identically zero f.

**Checks.**

- For f(z)=z²exp(z), m=2 and g=exp, so the nonzero-zero product is empty.
- For f(z)=1−z², m=0 and E₁(z)E₁(−z)=1−z², fixing the pairing sign.
- For f=1 the divisor and m are zero; for f=0 the finite-order-at-origin hypothesis fails.

See [53][R53], Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, p.52. This adapter extends the supplier's f(0)≠0 hypothesis.

*Needs:* `AnalyticAt.analyticOrderAt_eq_natCast`; analytic factorization at a finite-order zero; [ZerosOfLFunctions 0.1 (OrderLE)][R11]; [ZerosOfLFunctions 5.4–5.6][R15].

<a id="s0-23"></a>

### 0.23 Finite-order Hadamard factorization

For nonzero entire f of finite order at most ρ≥0, set n=floor ρ. Its nonzero zeros α with multiplicity satisfy Σ|α|^(−n−1)<∞ and f(z)=z^m exp(h(z))∏E_n(z/α), where E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h is a polynomial of degree≤n and the product converges locally uniformly. Finite/empty zero sets are allowed.

Extend the zero-count/product estimates to n=floorρ. For ρ<σ<s<n+1, Jensen gives N(r)=O(r^σ), hence summability at n+1. For the genus-n product P, prove `canonicalProduct.good_circles`: there are R_j→∞ and C>0 with |P(z)|≥exp(−C R_j^s) on |z|=R_j. Split zeros at 2|z|; exclude discs of radii |α|^(−n−1), whose tail radii are summable, and absorb N(2|z|)log|z| into |z|^s. On these circles the entire logarithm of f/(z^m P) has real part O(R_j^s). Borel–Carathéodory and Cauchy force its derivatives of order≥n+1 to vanish. Finite zero sets use the same estimates with finite products.

See [54][R54], Appendix B.1, (B.1)–(B.3), pp.901–902; [Kupers][R95], Theorem14.1.1 and proof, Lemmas14.1.4–14.1.5 and Corollary14.1.6, pp.89–93. Use the strict upper endpoint ρ<n+1 required by that proof.

*Needs:* [Entire order at most ρ][R11]; `AnalyticOnNhd.sum_divisor_le`; `Complex.borelCaratheodory`; [§0.15](#s0-15).

<a id="s0-23a"></a>

**§0.23a Higher derivatives of the Gamma remainder.** Consume the analytic logΓ branch and its remainder R from [1.2–1.4][R12]. With Q(t)=({t}−{t}²)/2, for every integer j≥1 and z off the nonpositive real axis,
`R^(j)(z)=(-1)^j (j+1)! ∫₀^∞ Q(t)/(z+t)^(j+2) dt`,
`|R^(j)(z)|≤j! sec^(j+2)(arg(z)/2)/(8|z|^(j+1))`.
This is the derivative refinement; the j=0 Stirling theorem and the digamma expansion belong to the supplier. Fix δ>0 before taking a uniform constant on |arg z|≤π−δ.

Differentiate the Stieltjes integral under the integral sign: every compact subset of the slit plane has |z+t|≥c_K(1+t). Use 0≤Q≤1/8 and |z+t|≥cos(arg(z)/2)(|z|+t), then integrate the resulting power. API: `gammaRemainder.iteratedDeriv_integral`, `.iteratedDeriv_sector_bound`. **Checks:** R′(x)<0 for x>0; at x=1, R′(1)=1/2−EulerGamma; the kernel (z+1)⁻² has first derivative −1/4 and second derivative 3/8 at z=1, fixing the sign and factorial; δ=0 and z=0 are excluded. The geometric estimate remains valid when Re z<0 inside the slit sector.

See [Nemes, Gamma error bounds][R55], (2.5) and Lemma 2.1, §2 p.6; the displayed derivative formula follows by dominated differentiation. *Needs:* [1.2–1.4][R12]; dominated differentiation of parameter integrals.

<a id="s0-24"></a>

### 0.24 Repulsion of exceptional conductors

With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

Apply the two-real-zero inequality at the same effective c_star. If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs.

See [47][R47], Proposition 7.1 and equation (25), pp. 373-374.

*Needs:* [§0.1](#s0-1); [§0.17][R133].

<a id="s0-25"></a>

### 0.25 Explicit prime Euler-product bound

For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8. Certify the finite threshold calculations required for the literal constant 2.

See [47][R47], §5 proof of Lemma 5.1, p.365; alternate direct input from Rosser–Schoenfeld Theorem 8 (3.29), p.70.

*Needs:* [§0.19](#s0-19).

<a id="s0-26"></a>

### 0.26 Mertens's third theorem: the Euler product

For real x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1), with γ Euler’s constant and an absolute implied constant.

From reciprocal-prime Mertens and −log(1−u)−u=O(u²), 0≤u≤1/2, obtain log∏_(p≤x)(1−1/p)^−1=log log x+κ+O(1/log x); the square-power tail is O(1/x). Identify κ=γ through the real Euler product at1+ε/log x and Exercise5.4(c)–(d)'s corrected integral. The tilted-product, prime-tail and Euler-constant comparisons remain required named inputs. Exponentiating after identifying κ gives the additive O(1); a two-sided comparison alone cannot identify it.

See [49][R49], Theorem3.4(c), (3.6), printed pp.40–41; Exercise5.4, printed p.61.

*Needs:* [§0.21](#s0-21).

<a id="s0-27"></a>

### 0.27 Landau repulsion for exceptional squareclasses

There is an effective absolute0<c_Landau<1/2 such that distinct d,e∈S(c_Landau) with |d|≤|e| satisfy |d|²≤|e|. This pairwise form applies to every existing finite ordered segment; no infinitude of S(c_Landau) is asserted.

Distinct squareclasses give distinct primitive characters, with |d|≤Q_d≤4|d| even when absolute radicands agree. If |d|≤|e|<|d|², then Q_dQ_e<16|d|³ and log(Q_dQ_e)≤5log(|d|+4), using16a³≤(a+4)^5. Both zeros are≥1−c_Landau/log(|d|+4). Choose0<c_Landau≤3c_star/5, also<1/2, and contradict §0.17's two-real-zero theorem. This conductor/log deduction adds no analytic theorem.

The conclusion is pairwise and vacuous for an empty/singleton exceptional set. Retain Q_−1=4 and Q_2=8; replacing conductor by |d| breaks the cited analytic input. Use the explicit slack c_Landau≤3c_star/5 and log(Q_d Q_e)≤5log(|d|+4). This keeps the factor4 and the+4 height convention.

See [51][R51], §7.2 Definition7.5 and following paragraph, p.61.

*Needs:* [§0.13](#s0-13); [§0.17][R133].

<a id="s0-28"></a>

### 0.28 Quadratic prime-character interval estimate

There are positive absolute effective constants c,C such that for every nonzero squarefree integer D≠1, its primitive field character χ_D of conductor Q_D=|Disc(Q(√D))|, and real2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C[E_D(v)+v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴]. Here E_D(v)=v^β if the conductor-uniform zero-free region singles out a simple real exceptional zero β∈(1/2,1), and E_D(v)=0 otherwise. Equivalently extend χ_D by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.

Apply conductor-uniform character_weighted_pnt at Q_D, remove higher prime powers and Abel-sum to strict prime counts. Since β>1/2, the exceptional term is O(x^β). Subtract the initial-interval formulas; bound the u error by an increasing v-envelope, decreasing c and enlarging C for bounded heights. Keep both strict endpoints. From |D|≤Q_D≤4|D| recover printed(7.7), using log(v|D|)≥log2 even for D=−1. The original character-PNT proof, higher-power estimate and uniform Abel/envelope adapters remain obligations.

If(u,v) contains no unramified prime the sum is0; no unproved prime-existence claim is hidden in this bound. For D=−1 use χ_−4 and conductor4; p=2 is excluded or contributes0. Both constants are independent of D,u,v; the exceptional term is omitted only under the exact same zero-free-region convention as its supplier.

See [51][R51], §7.2 proof of Proposition7.6, (7.7), p.62.

*Needs:* [§0.18](#s0-18).

<a id="s0-29"></a>

### 0.29 Strict derivative positivity requires nonpolynomiality

Let f be a nonzero entire function of order at most 1, let m be its vanishing order at 0, and suppose f(−z)=(−1)^m f(z), every zero of f is purely imaginary, and f(x)>0 for all sufficiently large positive real x. If f is not a polynomial, every derivative f^(k)(x) with k≡m mod2 is strictly positive for x>0, and the same-parity Taylor coefficients from degree m onward are positive.

Nonpolynomiality forces infinitely many pairs, so for every coefficient beyond m choose sufficiently many positive factors. The nonnegative convergent derivative series gives strict positivity for x>0.

cosh(z) has infinitely many purely imaginary zero pairs and strictly positive same-parity Taylor coefficients. The polynomial 1+z² satisfies the pairing hypotheses but its fourth derivative is zero; nonpolynomiality is essential. Coefficients of degree below m vanish, including same-parity ones; positivity starts at degree m. Negating cosh preserves its zero locations and parity but makes its even derivatives negative; eventual positivity is essential.

See [54][R54], Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

*Needs:* `TendstoLocallyUniformlyOn.deriv`; [ZerosOfLFunctions 5.4–5.6][R15]; [Genus-one canonical factor][R15]; [§0.29a](#s0-29a); [§0.29b](#s0-29b); [Paired genus-one factors][R15].

<a id="s0-29a"></a>

**§0.29a Pairing imaginary zeros.** Under these hypotheses, there is c>0 and a locally finite positive-real family λ_j, with one index per positive-imaginary zero occurrence, such that f(z)=c z^m∏_j(1+z²/λ_j²). The products converge locally uniformly over finite subsets; finite and empty families are included.

Here f entire and not identically zero; m is its finite analytic order at zero; `OrderLE f 1`; f(−z)=(−1)^m f(z); every zero is purely imaginary; f(x) is positive real for all sufficiently large positive real x.

Parity gives equal zero multiplicities at ±iλ. Pair the imported genus-one factors using E₁(w)E₁(−w)=1−w²; reciprocal-square summability makes this reindexing valid. The paired product is even and has value 1 at zero. Comparing f(−z) and (−1)^m f(z) near zero gives exp(−2bz)=1 for all sufficiently small z, forcing b=0. For positive x every paired factor and x^m is positive, so eventual positive reality of f forces c=exp(a)>0.


<a id="s0-29b"></a>

**§0.29b Nonnegative coefficients of the paired product.** For the preceding paired product, every Taylor coefficient of parity m is nonnegative, and all coefficients of the other parity are zero.

Finite products have nonnegative coefficients in z². Use locally uniform derivative convergence at0 to pass to every fixed coefficient.


<a id="s0-30"></a>

### 0.30 Rational Dirichlet-to-ray-class dictionary

For q≥1, the narrow ray class group of ℚ of finite modulus (q) and the real place identifies with (ℤ/qℤ)ˣ: an ideal prime to q maps to the residue of its positive rational generator. For an integral ideal (n), n>0, evaluate the corresponding ray character as χ(n), with no inverse or conjugation. Its primitive finite conductor is the Dirichlet conductor f; its infinite conductor contains the real place exactly when χ(−1)=−1. The narrow presentation is allowed for even characters, but is then imprimitive at infinity.

The adapter `dirichletRayEquiv` uses GlobalNumberFields' ray-class carrier; `dirichletData_eq_rayData` compares [LFunctions 4–5][R52]. The primitive continued functions agree on Re s>1 by their Euler series, hence as meromorphic germs everywhere. Their finite conductor is f, the gamma factor is Γ_R(s+a), a=0 or 1 according to parity, and the completion is f^(s/2)Γ_R(s+a)L(s,χ). Compare root numbers in that normalization. At level q retain exactly ∏_{p|q, p∤f}(1−χ*(p)p^(−s)); their zeros lie on Re s=0. Equality at a pole always means equality of germs, not equality of totalized values.

API: `.ideal_nat`, `.conductor`, `.parity`, `.primitive_source`, `.continued_eq`, `.completion_eq`, `.deleted_factors`, and transport of the supplier divisor and zero counts. Construct the group equivalence by clearing denominators prime to q and using positive generators; its kernel is the narrow ray principal subgroup. Character transport and the absolutely convergent Euler products determine the analytic comparison uniquely.

**Checks.**

- At q=1 the functions are ζ and its normalization-1 entire completion is 2ξ.
- At χ₋₄ the conductor is 4 and a=1, giving Γ_R(s+1).
- For the principal character of level 6 the primitive conductor is 1 and L=(1−2^(−s))(1−3^(−s))ζ; the two factors cannot be discarded.
- For the quartic character modulo 5 with χ(2)=i, the ideal (2) has value i and χ(2)−χ(2)⁻¹=2i; replacing it by its inverse changes the sign. Thus the comparison fixes conjugation as well as parity.

Use [6.2–6.4][R16] through this dictionary for the conductor-uniform Dirichlet region and its exceptional-zero API. Those results are not targets here.

See [56][R56], V §1, Example 1.4 and Theorem 1.7, pp.149–151 (ray classes over ℚ), and LFunctions 4–5 for the analytic records. *Needs:* GlobalNumberFields Layers 2 and 9; [LFunctions 4–5][R57]; Mathlib `DirichletCharacter.LFunction_changeLevel` and the primitive completed functional equation.

<a id="s0-30a"></a>

**§0.30a Conductor-uniform rational logarithmic-derivative adapter.** For primitive nonprincipal χ of conductor q≥3, combine the imported divisor, fixed-degree conductor-uniform strip growth and high-height count from [ZerosOfLFunctions Layers 3–4][R14] with the following compact-height specialization. The local contour interface has absolute constants before χ,q, rather than constants after fixing a character.

For |u|≤2 and |s−(2+iu)|≤12, the imported wide-strip bound gives |L(s,χ)|≤Cq^B with absolute C,B; there is no pole for nonprincipal χ. The Euler-product lower bound at 2+iu is ≥1/ζ(2), through LFunctions' absolutely convergent product. Apply the supplier's Jensen disc bound (4.5) to these two bounds, with radii 6 and 12. This gives O(log q) zeros in the radius-6 disc, including the compact-height range. A compact bound after fixing q would not suffice.

The local logarithmic-derivative refinement is
`L′/L(s,χ)=Σ_{nontrivial ρ, |Imρ−Im s|≤1} mρ/(s−ρ)+O(log(q(|s|+2)))`
for −1≤Re s≤2, away from all zeros and at distance≥1/2 from trivial zeros. At compact height, remove the finitely many disc zeros from g(z)=L(2+iu+z,χ), normalize the remaining analytic logarithm at 0, and apply the finite Blaschke-factor maximum principle and Borel–Carathéodory derivative bound on the nested discs. Terms outside the unit height window have distance≥1 and there are O(log q) of them; the finitely many trivial zeros in the disc contribute O(1) under the distance condition. At high height use the imported conductor-uniform strip growth and count in the identical finite-disc argument. For Re s≥2 the Euler series gives the needed bound directly; farther left the functional equation and imported digamma estimate give the contour version. Near the even-character zero at 0 separate its exact analytic order first. This refines the imported count to the particular logarithmic-derivative interface; it does not construct a second divisor, Jensen theorem or growth theory.

API: `primitiveL.bounded_height_count`, `.local_log_derivative`, `.safe_height_both_characters`. For a safe height in [T,T+1], T≥2, remove intervals of radius c/log(q(T+2)) around the imported O(log(q(T+2))) ordinates, for χ and its conjugate together. Choose one absolute c so their total length is <1/2. The local expansion is then O(log²(q(T+2))) on the fixed contour strip. This is a simultaneous two-character choice, as required for the positive and negative contour edges of a complex character.

**Checks.**

- u=0 retains O(log q), rather than an unspecified constant depending on χ.
- Conjugation reflects zeros of χ to those of its conjugate, generally a different character; both families enter the safe-height choice.
- A zero of analytic multiplicity 2 contributes 2/(s−ρ), not one copy.
- Imprimitive deleted factors have zeros on Re s=0 and are outside this primitive signature; a trivial zero at 0 must be separated before dividing.

See [49][R49], Lemma11.2 p.113, Lemma11.4 pp.114–115 and Lemmas8.5–8.6 pp.89–91. *Needs:* [§0.30][R129]; ZerosOfLFunctions 3.3–3.4 and 4.5–4.8; its Gamma bounds; native finite analytic orders, maximum modulus and Cauchy estimates.

<a id="s0-31"></a>

### 0.31 Mertens product input

For y≥2, ∏_{p≤y}(1−1/p) is comparable to 1/log y, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

Use the reciprocal Mertens product asymptotic and positivity. Extend the two-sided comparison over the compact starting range y≥2.

For y=2 the product is 1/2; extend the eventual comparison to y≥2 using its finitely many values below any fixed threshold. Removing a fixed finite set of primes multiplies the product by finitely many positive inverse factors; the resulting constants may depend on that set.

See [49][R49], Theorem3.4(c), printed pp.40–41; [58][R58], Lemma4.9 and proof pp.713–714; Lemma4.11 and proof pp.715–716.

*Needs:* [§0.26](#s0-26).

<a id="s0-31a"></a>

**§0.31a Near-one Dirichlet derivative bounds.** Uniformly for nonprincipal χ modulo q≥3 and real σ∈[1−1/log q,1], `|L′(σ,χ)|≤C log²q` with an effective absolute C. To prove it without a zero-free hypothesis, split −Σχ(n)log n/n^σ at N=q. The finite part is at most eΣ_{n≤q}log n/n≤C log²q. Partial summation of the tail with |Σ_{q<n≤v}χ(n)|≤2q gives at most `2q∫_q^∞(σ log v+1)v^(−σ−1)dv≤C log q`; for q≥3, σ≥1−1/log3>0, so its denominators are uniformly bounded. The differentiated series and this integral agree by locally uniform Abel convergence on Re s>0.

For a primitive nonprincipal χ of conductor Q≥3 and the fixed-width interval1−η≤σ≤1,0<η<1/4, the primitive functional equation, the sector Gamma bound and three-lines on a slightly enlarged strip give |L(σ+it,χ)|≪_η Q^((1−σ)/2)log(Q(|t|+2)) for |t|≤1. Cauchy on a circle of radius1/log Q, and the bound on the right of1 from the split character sum, give |L′(σ,χ)|≪_η Q^((1−σ)/2)log²Q. This separate `quadratic_fixed_width_derivative` is the bound used at β₁ in the Goldfeld argument; the narrower elementary derivative bound is sufficient for the effective and Siegel zero-gap consequences.

API: `dirichletL.near_one_derivative`, `.fixed_width_derivative`. Checks: the principal character is excluded; q=3 keeps a positive lower bound for σ; the fixed-width estimate retains its conductor power. Source: Koukoulopoulos Lemma11.2, p.113, and (12.11)–(12.12), p.124. *Needs:* native character partial sums and Abel summation; primitive functional equation; [ZerosOfLFunctions 1.2–1.4][R12]; native three-lines and Cauchy bounds.

<a id="s0-31b"></a>

**§0.31b Quadratic zero separation from an L-value.** Let χ be a primitive real nonprincipal character of conductor q≥3. If β is a real zero in[1−1/log q,1), the real mean-value theorem gives `1−β≥L(1,χ)/(C log²q)`; if it is farther left the same desired weaker power bound is immediate. Thus Siegel with exponentε/2 yields `1−β≥c_ε q^(−ε)`, with ineffective c_ε. The effective quadratic class-number/regulator lower bound L(1,χ_D)≥c/√Q_D gives the effective exponent1/2+ε result, using h≥1, the explicit imaginary roots-of-unity factor and the elementary real unit lower bound `(sqrt(D+4)+sqrt D)/2` for the positive norm-one generator. No ineffective Siegel constant enters this latter deduction.

API: `dirichletL.near_one_derivative`, `.gap_of_lvalue`, `.siegel_gap`, `.effective_quadratic_gap`. Checks: a zero left of1−1/log q uses the distance alternative, not the derivative interval; q=3 is included; the principal character is excluded; Q_D≤4|D| is applied before absorbing logarithms. Source: [49][R49], Lemma11.2 p.113 and (12.11)–(12.12) p.124; [48][R48], Lemma6.3 pp.491–492 for the effective unit and class-number normalization.

*Needs:* [§0.31a][R134]; [§0.9](#s0-9); native partial summation; native quadratic class-number formula and unit carriers; [Quadratic field-character dictionary](#from-globalnumberfields).

<a id="s0-32"></a>

### 0.32 Siegel–Walfisz theorem

For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective. The representative inclusive ψ signature is `siegel_walfisz`.

Use conductor-uniform character PNT, imprimitive corrections and finite progression orthogonality. Siegel plus the near-one derivative adapter gives1−β≥c_εq^(−ε), uniformly in primitive real characters. For q≤(log x)^B choose ε=1/[2(B+1)]<1/B when B>0; then x^(β−1)≤exp(−c_ε(log x)^(1−Bε)), absorbing every logarithmic power. Averaging preserves the uniform bound. Remove ψ−θ and use ADS Abel transfer. Choose the possibly ineffective constants and threshold depending on A,B before q,a,x.

For B=1 one may take ε=1/4; the exceptional relative term is ≤exp(−c(log x)^(3/4)). The assertion is restricted to reduced classes and logarithmic modulus growth; it is not an effective uniform theorem for every modulus.

See [53][R53], §10.5 Theorem10.9 pp.62–63 and Theorem10.11 p.63; corrected coprimality, range and ineffectivity.

*Needs:* [§0.30][R129]; [§0.9](#s0-9); [§0.18](#s0-18); `DirichletCharacter.sum_char_inv_mul_char_eq`; `DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`; `Chebyshev.isBigO_psi_sub_theta_sqrt`; [ArithmeticDirichletSeries 6][R1]; [§0.31b][R137].

<a id="s0-33"></a>

### 0.33 Zero-free zeta strip and logarithmic bounds

There exist0<β<1 and C>0 such that for Z={s:1−β/log(|Im s|+2)≤Re s≤10}, ζ is meromorphic with its only pole in Z a simple pole at1 of residue1 and no zeros away from1. The functions G(s)=ζ(s)−1/(s−1) and R(s)=1/ζ(s), initially defined off1, have analytic extensions to a neighbourhood of Z, with R(1)=0 and |G(s)|,|R(s)|≤C log(|Im s|+2) throughout Z. Values at1 refer to these extensions, not to totalized ζ(1).

Join the imported high-height zero-free region to bounded-height real-line nonvanishing and the pole germ by shrinking β. Bound ζ after pole subtraction and1/ζ logarithmically at high height; compact bounds enter C. These quantitative proofs remain required: nonvanishing alone gives no logarithmic bound.

See [59][R59], AppendixA LemmaA.1, printed p.541.

*Needs:* [ZerosOfLFunctions 6.2][R16]; [its local logarithmic derivative and zero counts][R14]; [its Gamma estimates][R12]; native right-half-plane nonvanishing and the pole germ at 1; compact continuity.

### Proof-route checks

- **Finite order / Gamma:** §0.23 requires reciprocal-power summability at floor(ρ)+1, a compact-normal product and the polynomial logarithm bound (Yun–Zhang Appendix B.1, pp.901–902; Kupers §§14.1.1–14.1.2, pp.90–93). §0.23a adds explicit higher-derivative sector constants to the imported Stirling theory; §0.33 separately needs quantitative reciprocal bounds.
- **Primitive formulas:** [§0.30a][R135] uses imported strip growth, Euler product and divisor to obtain conductor-uniform compact-height counts and simultaneous safe heights with multiplicities. [§1.4a](#s1-4a) includes parity, both safe heights and endpoint corrections. Full unsubtracted formulas and imprimitive deleted factors remain separate. Low zeros use min(1,1/|ρ|), never1/|Imρ|. Consumers: [§0.30][R129], [§1.4](#s1-4), [classical PNT remainder][R18].
- **Exceptional families:** supplier6.3–6.4 gives per-character uniqueness/simplicity. Local family repulsion still requires the two-character positivity proof, conductor-product width and numerical constants. Siegel–Walfisz uses Siegel plus the uniform near-one derivative adapter and logarithmic-modulus optimization.
- **Numerical certificates:** retain rational logarithm enclosures and analytic tails for conductor24; k≥2·10^10 in progression subtraction at k,k/2; the strict higher-power bound; reciprocal-prime threshold286, weighted-prime threshold319 and sharp tail10^8; constant40's class-number/derivative comparison; and unconditional rather than RH theta tables. Consumers: [§3.2](#s3-2), [§0.3](#s0-3), [§0.16](#s0-16), [§0.4](#s0-4), [§0.5](#s0-5), [§0.19](#s0-19), [§0.7](#s0-7), [§0.8](#s0-8), [§0.25](#s0-25).
- **Siegel / Mertens:** §0.9's Goldfeld positivity and smooth-contour proof leaves the least exceptional conductor and finite positive endpoint minimum ineffective. §0.11 uses only Σ_(n≤x)log n=xlog x−x+O(log x) and convergence of Σlog m/[m(m−1)], without quantitative PNT. §0.26 additionally needs the tilted finite product, prime-tail integral, positive-real Euler product/pole adapter and κ=∫(1_[0,1](u)−exp(−u))/u du=γ; reversing this integrand changes the sign.
- **KP contracts:** [§3.12a][R163] and §3.41 cover every fixed A. Keep Q_d≤4|d|, log(Q_dQ_e)≤5log(|d|+4), c_Landau≤3c_star/5, and higher-power/Abel/envelope prime-interval transfer. [§2.32f][R164] supplies Aramata, integral orders, cyclic restriction and subgroup averages without general Artin holomorphy. Exact repulsion constants and original density proofs remain requirements. Consumers: [§3.32](#s3-32), [§3.41](#s3-41), [§0.27](#s0-27), [§0.28](#s0-28), [§0.12](#s0-12), [§2.40](#s2-40).
- **Green–Tao:** high-height logarithmic/reciprocal bounds, bounded-height completion and weak convexity are required. Before applying Siegel–Walfisz to growing W(N), prove W(N)≤(log N)^B; fixed-modulus PNT is insufficient. Consumers: [region][R16], [§0.30][R129], [§0.32][R171], [§0.33](#s0-33), [convexity][R13].

### Examples

At modulus 1 the progression sums recover the ordinary Chebyshev sums. At modulus 2 the nonunit class 0 contains the prime 2 but no other prime, so θ(x;0,2)=log 2 for x≥2. A conjectured exceptional zero is not an example of an existing zero: β=1 and the lower cutoff are excluded by definition. The constant function 1 satisfies every upper-order bound but cannot satisfy strict derivative positivity; this explains the nonpolynomiality hypothesis.

### Dependencies

Mathlib complex analysis, arithmetic functions, Chebyshev sums, Dirichlet continuation and nonvanishing; ArithmeticDirichletSeries Layers 3, 6 and 8; LFunctions Layers 4–5 and ZerosOfLFunctions Layers 0–6; the local higher-genus and ξ adapters. Qualitative prime theorems are consumed only through the boundary contracts.

<a id="layer-1"></a>

## Layer 1: Explicit formulas, mean values and conditional prime estimates

Use finite analytic-order zero data and half-weight arithmetic sums to state exact contour formulas. Uniform Gamma estimates are independent analytic inputs. Primitive-character and ray-class density results retain conductor and field-degree dependence. The RH and GRH propositions form an explicit conditional interface; no unconditional proof consumes them.

<a id="s1-1"></a>

### 1.1 Reciprocal zeta on the line one

Let Zinv be the meromorphic reciprocal of the continued ζ, extended at s=1 by zero. For all real t, |Zinv(1+2it)|≤C log(2+|t|), and Zinv(1+2it)→0 as t→0.

Use the zero-free region and pole-cleared reciprocal estimates away from t=0. Extend 1/ζ through the pole by the removable value 0; no totalized value of 1/riemannZeta 1 is used.

See [60][R60], Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'); [60][R60], Proof of Proposition2, printed p.969, sentence preceding (6.7).

*Needs:* [Classical high-height zero-free region][R16].

<a id="s1-2"></a>

### 1.2 Davenport uniform Möbius exponential cancellation

For every A>0 there is C_A such that for y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}. The constant may be ineffective through Siegel separation. The additive normalization e^{irα} is obtained from e(rθ)=exp(2πirθ) by θ=α/(2π).

Apply the following exact convolution identity, the type-I/type-II estimates proved in Koukoulopoulos §23, and a reciprocal-L major-arc contour estimate. These contracts establish the full uniform result; they do not use a fixed-modulus qualitative prime theorem as a substitute.

See [58][R58], Lemma3.2 and proof reference, published p.690.

<a id="s1-2a"></a>

**§1.2a Uniform Möbius major/minor arcs.** Use the authorized [49][R49], §23 pp.237–249, especially the proofs of Theorems23.5–23.6, pp.242–246, and Exercise23.4, pp.248–249. Fix A>0, choose D>2(A+5), then C>D+A+6. Dirichlet approximation with Q=x/(log x)^C gives coprime a,q with q≤Q and |θ−a/q|≤1/(qQ)≤1/q². All subsequent estimates are eventual in x; the remaining bounded range is absorbed in C_A.

For (log x)^C≤q≤x/(log x)^C, put U=V=(log x)^D and use the exact identity
μ=−μ_(≤U)∗μ_(≤V)∗1+μ_(>U)∗μ_(>V)∗1+μ_(≤U)+μ_(≤V).
Expand μ∗1=δ to prove it, retaining n=1 and real cutoffs. The two short terms cost O(U). The type-I coefficient c=μ_(≤U)∗μ_(≤V) is supported on [1,U²] and |c(k)|≤τ(k)≤2√k≤2U. Theorem23.5 with v=0 therefore gives
|Σ_(n≤x)(c∗1)(n)e(nθ)|≪U(U²+x/q+q)log x.
Its proof opens the inner geometric sum, partitions k into blocks of length floor(q/2), uses spacing1/(2q), and sums the resulting harmonic bounds; this proves the displayed uniform estimate for the actual coefficients, without an uncontrolled x^ε factor.

For the long convolution set f=μ_(>U) and g=μ_(>V)∗1. Both supports begin beyond U. Decompose each variable into dyadic intervals with upper endpoints Y,Z and YZ≤4x; terms with YZ>4x vanish after a finer endpoint split. Then Y,Z≤2x/U, |f|≤1 and |g|≤τ. Theorem23.6, with its retained hyperbolic cutoff, gives
|Σ_(k≤Y,l≤Z,kl≤x)f(k)g(l)e(θkl)|≪[Y+Z+YZ/q+q]^(1/2)(log(2q))^(1/2)||f||₂||g||₂.
Use Σ_(n≤Z)τ(n)²≪Z log³(2Z), since τ²≤τ₄ and three harmonic sums bound Στ₄. Summing O(log²x) dyadic pieces yields the sufficient bound
|Σ_(n≤x)(f∗g)(n)e(nθ)|≪(x/√U+x/√q+√(xq))log⁴(2x).
The type-I bound is O(log^(3D+1)x+x log^(D+1−C)x), and the type-II bound is O(x log^(4−D/2)x+x log^(4−C/2)x). The choices of D,C make each O_A(x/log^A x). In particular a pointwise divisor estimate with a fixed x^ε loss is not used on the x/√q or √(xq) terms.

For q<(log x)^C, use `mobius_small_modulus_progressions`: for every B,C>0, uniformly over q≤(log x)^C and every residue b, Σ_(n≤y,n≡b mod q)μ(n)≪_(B,C)x/log^B x for0≤y≤x. For unit classes apply character orthogonality to 1/L(s,χ). Here is a sufficient precise contour estimate. Put L=log x, T=exp(L^(1/3)), δ=c/log²(q(T+2)). The conductor-height zero-free region excludes ordinary zeros from the wider rectangle Re s≥1−c₀/log(q(T+2)); Siegel separation with exponent1/(4C) puts the possible exceptional real zero to the left as well, eventually. On |Im s|≤T and |Re s−1|≤δ, the local zero-count/log-derivative formula gives |L′/L|≪log²(q(T+2)), since the distance to every zero in the local window is ≫1/log(q(T+2)). Starting at1+δ, the Euler product gives |1/L|≤ζ(1+δ)≪1/δ; integration over a horizontal segment of length≤2δ preserves this bound up to an absolute factor. A principal character uses the holomorphic reciprocal with its zero at1, separating the pole term before integration. Thus the reciprocal is bounded by a fixed log power throughout the narrow rectangle, rather than by T to an uncontrolled power.

Finite Perron on the half-integer nearest y avoids endpoint singularities. Shift to1−δ; its vertical contribution is ≪y exp(−c′L^(1/3)) times a fixed log power. The horizontal and truncation contributions are ≪x/T times a fixed log power. For y≥x/log^E x the same rectangle works, since log y∼log x; smaller y is bounded trivially by choosing E>B. Deleted Euler factors cost a further log power in the modulus range. For a nonunit class put d=(b,q), n=dm. Nonsquarefree d contributes0; otherwise μ(dm)=μ(d)μ(m)1_((m,d)=1), and character orthogonality modulo q/d with the extra finite prime exclusions gives the same contour bound. There are only polylogarithmically many residues and divisor factors. Choose B after A,C to absorb them. Abel summation of e((θ−a/q)n) costs at most1+x|θ−a/q|≤1+(log x)^C. This completes all major arcs uniformly. Constants inherit the stated Siegel ineffectivity.

The named interfaces are `mobius_vaughan_identity`, `mobius_type_I_bound`, `mobius_type_II_bound`, `mobius_reciprocal_narrow_rectangle`, `mobius_small_modulus_progressions` and `mobius_major_minor_uniform`. The source's elementary type-I/type-II proofs and its exercise supply the decomposition route; the explicit polylogarithmic cutoffs and narrow reciprocal contour above provide the quantitative adapters. At θ=0 choose q=1, so the major-arc branch is indispensable. At n=1 the identity reads−1+0+1+1=1. A fixed rational denominator cannot be declared a minor arc.

*Needs:* `ArithmeticFunction.moebius`; [§0.30][R129]; [§0.31b][R137]; [§0.30a][R135]; ADS.6 finite Perron and Abel summation.

<a id="s1-3"></a>

### 1.3 Admissible Weil test function

For c≥0 and F:R→R, weil_test_function(c,F) means that some ε>0 makes G(x)=F(x)exp((1/2+c+ε)|x|) Lebesgue integrable and of bounded variation on R, that F(x)=(F(x−)+F(x+))/2 at every x, and that the difference quotient q(x)=(F(x)−F(0))/x for x≠0, set to0 at x=0, has bounded variation on R. The quotient may have distinct finite one-sided limits at0; no differentiability at0 is imposed. These symmetric-tail hypotheses are a strengthening of Mestre’s printed one-signed weight. They supply both F and its reflection in the contour proof.

Use the real bounded-variation and strict one-sided-limit notions, not a replacement variation or limit carrier. Finite weighted variation implies local finite variation of F and genuine one-sided limits. Use ordinary real division at x=0 to choose q(0)=0; changing this single finite value does not affect integrability or finite variation. Bound q near0 to obtain F(x)−F(0)=O(|x|). For the transform on −c≤Re s≤1+c, dominate its norm by |G(x)|exp(−ε|x|). Reflection and real linear combinations retain the conditions after decreasing ε.

- `weil_test_function.transform`: Define Φ_F(s)=∫_R F(x)exp((s−1/2)x)dx with the complex exponential. For an admissible F, the integrand is absolutely integrable whenever −c≤Re s≤1+c; totalized integration is never a convergence claim.
- `weil_test_function.reflection`: x↦F(−x) is admissible with the same c,ε.
- `weil_test_function.add`: Real linear combinations of admissible functions are admissible, after decreasing ε if needed.
- `weil_test_function.normalization`: F equals the mean of its two one-sided limits, fixing boundary values in the summation formula.
- `weil_test_function.mono`: If F is admissible for c and 0≤c′≤c then F is admissible for c′, using ε′=ε+c−c′.
- `weil_test_function.continuous_at_zero`: Admissibility implies a finite constant C≥0 with |F(x)−F(0)|≤C|x| for all x, hence continuity at0; the one-sided derivatives need not agree.

**Checks.**

- F=0 is admissible and Φ=0.
- For c≥0, F(x)=exp(−x²) is admissible and Φ_F(1/2)=√π.
- F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected.
- F(x)=exp(−|x|) is admissible for c=0, although (F(x)−F(0))/x has one-sided limits1 and−1 at0. A removable-continuous-quotient requirement would wrongly reject it.
- F(x)=exp(x/4) for x<0 and exp(−2x) for x≥0 satisfies Mestre’s one-signed weighted integrability/BV conditions at c=0, ε=1/4 and the difference-quotient condition, but is not admissible here and its ordinary transform integral at s=0 diverges.


See [61][R61], §I.2, pp.212–214.

*Needs:* `BoundedVariationOn`; `Function.leftLim`; `Function.rightLim`; `MeasureTheory.Integrable`; `MeasureTheory.integral`.

<a id="s1-4"></a>

### 1.4 Half-interval explicit formula and low-zero-safe bound

There are absolute C>0 and k₀≥2 such that for every primitive nonprincipal Dirichlet characterχ of conductor q, integer k≥k₀ and real2≤T≤k, Σ_(k/2<m≤k)χ(m)Λ(m)=−Σ_(nontrivial zeros |Imρ|≤T)mρ(k^ρ−(k/2)^ρ)/ρ+E, with |E|≤C[k log²(qk)/T+log²(qk)]. Endpoint sums are over positive integers; powers use exp(ρ log x).

Use k₀=4 and the direct subtracted Perron contour below. Its entire kernel removes the character constant before any estimate; the only parity contribution is bounded by log2. This proves the stated uniform error without requiring an absolute bound on the individual constant b(χ), or on a reciprocal of a zero near0. Imprimitive characters require separate deleted local Euler factors and are not included in this signature.

For odd k, k/2 is a half integer; for even k both integer endpoint corrections are included. The constant is independent of q,k,T; nonprincipal and primitive are actual hypotheses. An arbitrarily small real zero has a bounded half-interval kernel; no absolute1/|ρ| bound is assumed.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya §§10.1–10.2 pp.59–60, parity corrected the normalization convention; [53][R53], §10.2 Lemma10.3 p.60, uniform local count used in the explicit-formula route.

*Needs:* [§0.30][R129]; [ZerosOfLFunctions Layer 4 divisor and high-height estimates][R14]; [its Gamma estimates][R12]; Completed/ArithmeticDirichletSeries Layer 6 finite Perron; [§0.30a][R135]; [§1.4a](#s1-4a); [§1.4c](#s1-4c); [§1.4d](#s1-4d).

<a id="s1-4a"></a>

**§1.4a Primitive-character subtracted Perron contour.** For a primitive nonprincipal χ modulo q≥3, k≥4 an integer and2≤T≤k, put K_k(s)=(k^s−(k/2)^s)/s, extended by K_k(0)=log2. Finite Perron on c=1+1/log k expresses the half-weighted interval sum as the integral of −(L′/L)(s,χ)K_k(s) over[c−iT,c+iT], divided by2πi, with error O(k log²(qk)/T+log k). All constants here are absolute.

Apply the imported finite Perron remainder separately at the integer or half-integer endpoints, using their distance≥1/2 from every other integer and |χ(n)Λ(n)|≤log n. The two main vertical integrals have the same c and subtract to this kernel; the bound permits T up to k although the smaller endpoint is k/2. The dyadic remainder estimate at that endpoint uses T≤2(k/2), changing only its absolute constant. Choose T′∈[T,T+1] avoiding the union of zero ordinates near both +T and−T by c₁/log(q(T+2)); for complex χ these two bands need not be conjugate. The local count makes this possible. The local logarithmic-derivative expansion then gives O(log²(qk)) on the two horizontal edges for−1≤Re s≤c.

Move the left edge to Re s=−N−1/2, so it stays≥1/2 from every trivial zero. For Re s≤−1 the functional equation, Gamma reflection and the absolutely convergent right-half-plane L-series give |L′/L|≪log(q(|s|+2)) away from those trivial zeros. The horizontal kernel bound is (k^σ+(k/2)^σ)/T′. Its integral from−∞ to c is O(k/T), since log(k/2)≥log2. The distant vertical integral tends to0 as N→∞, by exponential decay (k/2)^(−N). Hence the only nontrivial residues are −mρK_k(ρ). For even χ the simple trivial zero at0 contributes −log2; for odd χ it is absent. All negative trivial-zero contributions sum absolutely to O(1), since |K_k(−j)|≤2(2/k)^j/j. There is no pole of the kernel at0 and no residual character constant. These facts are the reason for subtracting before shifting.

Removing zeros with T<|Imρ|≤T′ costs O(k log(q(T+2))/T), by the local count and |K_k(ρ)|≤2k/T there. Converting the half weights at the two endpoints costs O(log k). This yields §1.4, including its inclusive cutoff and parity conventions. The primary contour model is Koukoulopoulos, *The Distribution of Prime Numbers*, Chapter8 proof of Theorem5.1, pp.85–86; its conductor-uniform local expansion is Lemma11.4, pp.114–115, preceding Theorem11.3. The modification here replaces x^s/s by the entire difference K_k, rather than quoting the unspecified b(χ) in another explicit formula.

Checks: K_k(0)=log2 while the separate k^s/s terms have poles; at k=4 the negative-trivial-zero tail is bounded by2Σ2^(−j)/j; a complex character requires safe heights in both bands, not just the positive one. The near-zero kernel Check in §1.4 applies unchanged. *Needs:* ArithmeticDirichletSeries Layer6 finite Perron and its endpoint remainder; [§0.30a][R135]; [ZerosOfLFunctions 1.2–1.4][R12]; native finite residue theorem.

<a id="s1-4b"></a>

**§1.4b Bounded right-edge logarithmic derivative.** For every complex s with Re s≥2, |ζ′(s)/ζ(s)|≤Σ_(n≥1)Λ(n)n^−2<∞, with the same absolute constant for every imaginary part.

Import the absolute summability and identity of the complex von-Mangoldt L-series for Re s>1. Use Λ(n)≥0 and the complex-power norm formula; for n≥1 and Re s≥2, n^(−Re s)≤n^−2. Sum the termwise norm bound. Absolute convergence at s=2 is already the summability theorem; do not re-plan its log n integral comparison.

See [53][R53], §8.3 negative log-derivative series, p.50; LSeries_vonMangoldt_eq_deriv_riemannZeta_div.

<a id="s1-4c"></a>

**§1.4c Low-zero-safe interval kernel.** For every real x≥2 and complex ρ with0<Reρ<1, |(x^ρ−(x/2)^ρ)/ρ|≤2x^(Reρ)min(1,1/|ρ|). Positive-real powers use exp(ρ log x); the bound remains finite as ρ approaches0.

Since Reρ>0,ρ≠0. Integrate the derivative of t↦t^ρ on[x/2,x] to write the quotient as∫ t^(ρ−1)dt. For t in that interval, t^(Reρ)≤x^(Reρ), so the integral norm is at most x^(Reρ)∫dt/t=x^(Reρ)log2. The direct numerator bound is at most2x^(Reρ)/|ρ|. If |ρ|≤1 use log2≤2; if |ρ|≥1 use the second bound, yielding the explicit constant2. The limit asρ→0 is log2, not a divergent reciprocal. The subtraction must precede absolute values.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387, repaired half-interval deduction.

<a id="s1-4d"></a>

**§1.4d Logarithmic-square sum of zero weights.** There is an absolute C>0 such that for every primitive Dirichlet characterχ of conductor q≥1 and every T≥2, Σ_(nontrivial zeros |Imρ|≤T)mρ min(1,1/|ρ|)≤C log²(q(T+2)). Nontrivial means0<Reρ<1, and multiplicity is analytic order.

For a primitive nonprincipal character, invoke the new conductor-uniform local count, including |Imρ|≤1; the weight there is at most1, so an arbitrarily low exceptional zero does not introduce1/|ρ|. For each unit band m≤|Imρ|<m+1 with m≥1, the weight is at most1/m and the count is at most C0 log(q(m+2)). Sum C0 log(q(m+2))/m for1≤m≤ceil T; the harmonic/log-harmonic bound is O(log q log(T+2)+log²(T+2)), at most O(log²(q(T+2))). The primitive principal conductor1 case is the zeta local count from ZerosOfLFunctions Layer 4 and the same band argument. The local proof is the explicit conductor-uniform disk contract in Layer0; this summation deduction does not license the false unweighted1/|ρ| estimate at tiny zeros.

See [47][R47], Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya Lemma10.3 p.60.

<a id="s1-5"></a>

### 1.5 Mean square of a Dirichlet polynomial

For every integer N≥0, real T≥0 and complex a₁,…,a_N, the absolute difference between ∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt and 2TΣ|a_n|² is at most 6πΣn|a_n|². Empty sums are zero. The representative signature is `dirichlet_polynomial_mean_square`.

Use the weighted Hilbert inequality below with frequencies log n, rather than a bound for a Λ-supported polynomial. Expand the finite squared norm and integrate each exponential. The diagonal is exactly 2TΣ|a_n|². The off-diagonal is the difference of the Hilbert forms with coefficient vectors a_n exp(iT log n) and a_n exp(−iT log n), divided by i. Since log(1+1/n)≥1/(n+1), the nearest frequency spacing is at least1/(2n). Thus 6πΣn|a_n|² is an admissible absolute error bound, for every T≥0. Empty and singleton polynomials are treated before taking a nearest spacing.

The quantitative proof and the normalization comparisons are required separately.

See [62][R62], Theorem2 and Corollary2 pp.74–75, Corollary3 p.75, proof §4 p.82. The source was read through its proof, including the weighted inequality's lemmas; GHS Lemma2.6 is used only for the separate Λ-supported estimate.

*Needs:* `intervalIntegral`; [§1.5a](#s1-5a).

<a id="s1-5a"></a>

**§1.5a Weighted finite Hilbert inequality.** For a finite set I of cardinality≥2, distinct real λ_r, δ_r=min_{s≠r}|λ_r−λ_s|>0 and arbitrary complex u_r,
`|Σ_{r≠s} u_r conjugate(u_s)/(λ_r−λ_s)| ≤ (3π/2)Σ_r |u_r|²/δ_r`.
The cardinality0 and1 forms are zero without defining a minimum over an empty set. This statement has no coefficient support restriction.

The finite-dimensional spectral theorem applies to the skew-Hermitian cosecant matrix after conjugating by the square roots of the positive weights. At an extremizing unit eigenvector, expand the squared eigenvalue and use the cosecant–cotangent identity to cancel the two triple sums (Montgomery–Vaughan §3, (3.10)–(3.17), pp.80–81). The remaining diagonal and mixed sums are bounded by their Lemmas2,4,5: these follow by convex integral comparison on the disjoint half-spacing intervals, the partial-fraction expansion of cotangent, and the upper-half-plane semicircle integral, respectively (§2 pp.76–78). Lemma3 bounds the endpoint fourth-power integral by pairing its positive partial-fraction terms and taking their largest endpoint. The resulting weighted cosecant estimate is (1.3). The doubled-point identities on p.81 remove the temporary small-spacing restriction; they preserve positive admissible spacings. Substitute ελ_r in (1.3), multiply by πε, and let ε↓0; finiteness permits termwise limits and `πε csc(πε(λ_r−λ_s))→1/(λ_r−λ_s)` (§4 p.82). This gives (1.7), the displayed constant3π/2. Every intermediate sum is finite; an infinite-matrix theorem is unnecessary. As a two-term sign check, λ=(0,1), u=(1,i) gives the off-diagonal sum2i: each term is i. Replacing the conjugation or denominator orientation changes this value; the Lean example computes it directly.

API: `weightedHilbert.finite`, `.empty`, `.singleton`, `.frequency_shift`, `.frequency_scale`, `.log_frequency_spacing`, `.mean_square_error`. Checks: a singleton has zero error for every T; translating all λ leaves the form and δ unchanged; scaling λ by c≠0 scales both bounds by1/|c|; two coefficients1 at frequencies0,1 have an off-diagonal integral bounded independently of T, whereas replacing δ_r by a fixed spacing for log n would fail at large n. These use the existing finite matrix and real/complex trigonometric carriers.

*Needs:* pinned Mathlib finite-dimensional Hermitian spectral theorem; `Complex.cot`; `Complex.sin`; finite sums; completed ContourIntegration residue theorem for the semicircle computation.

<a id="s1-6"></a>

### 1.6 Riemann and generalized Riemann hypotheses as statements

For a Dirichlet character χ modulo N ≥ 1, DirichletGRH χ is the proposition: for every s ∈ ℂ with Re s > 0, (χ ≠ 1 or s ≠ 1) and L(s,χ) = 0 imply Re s = 1/2, where L(s,χ) is DirichletCharacter.LFunction χ s. GRH is the proposition that DirichletGRH χ holds for every N ≥ 1 and every χ modulo N. The Riemann hypothesis is Mathlib’s RiemannHypothesis. These are statements, never assumptions of an unconditional theorem; a theorem that uses one carries it as an explicit hypothesis.

Definition. The restriction Re s > 0 removes the trivial zeros (Re s ≤ 0) and, for imprimitive χ, the zeros of the missing Euler factors 1 − χ*(p)p^{−s}, which lie on Re s = 0; the clause (χ ≠ 1 or s ≠ 1) removes the junk value at the pole of the principal character. By Mathlib’s nonvanishing on Re s ≥ 1 (DirichletCharacter.LFunction_ne_zero_of_one_le_re), only zeros in the open critical strip are constrained.

- `DirichletGRH`: The proposition defined above, for one character.
- `GRH`: For all N ≥ 1 and all χ modulo N, DirichletGRH χ.
- `DirichletGRH.re_eq_half`: If DirichletGRH χ, 0 < Re s, (χ ≠ 1 or s ≠ 1) and L(s,χ) = 0, then Re s = 1/2.
- `dirichletGRH_one_iff_riemannHypothesis`: For the trivial character modulo 1, DirichletGRH holds if and only if RiemannHypothesis holds: L(s,1) = ζ(s), and ζ has no zeros with Re s ≤ 0 other than the trivial zeros −2, −4, ….
- `DirichletGRH.of_primitive`: DirichletGRH χ holds if and only if DirichletGRH holds for the primitive character inducing χ: the two L-functions differ by finitely many Euler factors, whose zeros lie on Re s = 0.
- `GRH.riemannHypothesis`: GRH implies RiemannHypothesis.

**Checks.**

- For the trivial character modulo 1, the trivial zero s = −2 of ζ does not contradict DirichletGRH: Re(−2) ≤ 0 is outside the constrained region.
- For the principal character modulo 2, L(s,χ) = (1 − 2^{−s})ζ(s) vanishes at s = 2πi/log 2; this zero has real part 0 and is not constrained, so a definition over Re s ≥ 0 would be wrong.
- For χ = 1 the value of the totalized LFunction at s = 1 is not constrained.
- DirichletGRH (1 : DirichletCharacter ℂ 1) ↔ RiemannHypothesis.

The predicate is used only as a hypothesis: no result of this roadmap proves it or depends on it unconditionally.

See [53][R53], §7.3, Conjecture 7.8, p. 45; §10.3, Conjecture 10.4 and Remark 10.5, pp. 60–61.

*Needs:* `RiemannHypothesis`; `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; `riemannZeta`.

<a id="s1-7"></a>

### 1.7 Selberg zero-density input

For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.

Use the primitive-character counting function and the stated effective density theorem. Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it.

See [47][R47], §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40.

*Needs:* [§1.5](#s1-5); `DirichletCharacter.LFunction`.

<a id="s1-8"></a>

### 1.8 Weil's explicit formula (Mestre's formalism)

The consumer is Chenevier–Taïbi §2.3, pp.275–276, (2.3.5), applied to automorphic Rankin–Selberg pairs in the classical-group multiplicity programme. Their gamma factors and paired functional equations are not confined to the degree-one Dedekind/Hecke families of [8.2–8.4][R18]. This target retains that generality and its test-function carrier; the degree-one specializations use the supplier.

Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F satisfy weil_test_function(c,F). For every zero gamma slope a_i=0 (respectively a′_i=0), assume b_i≠0 (respectively b′_i≠0), so its constant gamma factor is finite and nonzero. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). For a>0 the displayed I,J are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For a=0 set I(0,b)=J(0,b)=0 after removing its constant gamma factor; this is not0 times an undefined integral.

Remove finite nonzero constant gamma factors (zero slopes); their logarithmic derivatives are0 and rescaling the dual functions changes only w. Preserve A,B and the equal positive gamma-slope sums. Use pole-clearing and vertical-strip bounds to obtain polynomial strip growth, locally finite zeros and safe heights with a logarithmic-derivative bound. The needed general strip may be wider than the −1<σ<2 printed in Remark1.1.3. Integrate Φ_F(s)Λ′_1(s)/Λ_1(s) on a rectangle and count orders of zeros/poles. The functional equation converts the left edge to the reflected F term; symmetric-tail hypotheses justify both edges. Fourier inversion yields each prime-power term. For a>0 the combined gamma integral uses Lemma1.2.1 and the Poitou pairing Lemma1.2.2; near0 use the bounded difference quotient for cancellation before integrating. Pass to the symmetric zero-sum limit with the exact multiplicities. The Poitou good-height and uniform Fourier-limit inputs are steps of this target, not routine algebra.

For F=0 every term vanishes. For the completed Riemann zeta take c=0, a=a′=1/2, b=b′=0, A=B=π^(−1/2), α=β=1. Its two pole terms are Φ_F(0)+Φ_F(1), and the prime side has both ±k log p contributions. Adding a finite nonzero constant gamma factor with slope0 changes no explicit-formula term; a zero-slope Γ(0) is excluded. The asymmetric F in test weil_test_function.asymmetric_tail is excluded: Φ_F(0) in the Riemann pole term would diverge under the printed one-signed conditions.

See [61][R61], §I.1–I.2, pp.211–215; Remark1.1.3, Lemmas1.2.1–1.2.2; [63][R63], §2.3 pp.275–276, (2.3.5).

*Needs:* [§1.3](#s1-3); `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`.

<a id="s1-9"></a>

### 1.9 Prime error terms under RH and GRH

(i) If RiemannHypothesis holds, then for every ε > 0, ψ(x) − x = O_ε(x^{1/2+ε}) as x → ∞. (ii) Fix q ≥ 1. If DirichletGRH χ holds for every character χ modulo q, then for every ε > 0 and every a with gcd(a,q) = 1, ψ(x;a,q) − x/φ(q) = O_{q,ε}(x^{1/2+ε}), where ψ(x;a,q) = Σ_{n≤x, n≡a mod q} Λ(n). The hypotheses are explicit; neither conclusion is used by an unconditional target. The fixed-modulus representative signatures are `psi_sub_self_isBigO_of_riemannHypothesis` and `psiAP_isBigO_of_dirichletGRH`.

(i) Insert Re ρ = 1/2 into the imported ZerosOfLFunctions 8.2–8.4 truncated formula, bound Σ_{|γ|<T} 1/|ρ| by O(log² T) using the Riemann–von Mangoldt count, and take T = x. (ii) Expand ψ(x;a,q) by orthogonality of characters modulo q into φ(q)^{−1} Σ_χ χ̄(a) ψ(x,χ); the principal character gives ψ(x) up to O(log q · log x), and each nonprincipal χ is handled by the fixed-character explicit formula from ZerosOfLFunctions 8.6, transported by the rational dictionary with its zeros on Re s = 1/2.

The hypothesis appears in the statement; dropping it leaves only the de la Vallée Poussin error of Layer 0. (ii) fixes q: the implied constant may depend on q, and no Bombieri–Vinogradov-type average is claimed (that is SieveMethodsAndPrimePatterns:SV.3).

See [53][R53], §7.3, equation (7.3.1), p. 46; §10.3, equation (10.3.1), p. 61.

*Needs:* [§1.6](#s1-6); [Truncated von Mangoldt formula][R18]; [Riemann–von Mangoldt zero count][R17]; [§1.4](#s1-4); `Chebyshev.psi`; `DirichletCharacter.sum_char_inv_mul_char_eq`.

### Proof-route checks

- The half-interval contour keeps multiplicities and the low-zero-safe kernel. ZerosOfLFunctions8 supplies the general rational truncated formula and residues.
- [§1.5a](#s1-5a) uses Montgomery–Vaughan's cosecant matrix, finite spectral theorem, spacing, doubling and ε-limit to give6πΣn|a_n|² for every T≥0. Check empty/singleton polynomials and two-term conjugation ([§1.5](#s1-5)).
- Reciprocal ζ on line1 needs a quantitative small-value proof, beyond imported Stirling/Gamma quotient rates; higher Gamma derivatives are local.
- [§1.2a](#s1-2a) requires the exact convolution, polylogarithmic cutoffs, hyperbolic type-II bound and narrow reciprocal-L rectangle, including nonunit residues. The distinct coprime Möbius estimates for q≤T^4 need prime-exclusion proofs; shifted q≤√T uses U=T/q and one extra logarithm. Long-divisor/bilinear Fourier cancellation retains positive truncation and the separate zero term, the latter from ordinary Möbius cancellation plus Abel. Consumers: [§1.2](#s1-2), [§3.9](#s3-9), [§3.30](#s3-30), [§3.44](#s3-44), [§3.12](#s3-12).
- Mestre's infinite contour needs polynomial growth, local zero counts, safe-height logarithmic derivatives, transform decay/Fourier inversion and Poitou pairing. Combine Gamma integrals before their limit. Remove finite nonzero zero-slope constants before assigning derivative0. Require both reflected tails; the even Chenevier–Taïbi specialization qualifies ([§1.8](#s1-8)).

### Examples

For ψ₀(4), the contribution at 4 is (log 2)/2, whereas ψ(4) includes log 2. The residue of −ζ′(s)/ζ(s) at a trivial zero −2n is −1; hence the summed trivial-zero contribution is −(1/2)log(1−x⁻²). Its constant term is −ζ′(0)/ζ(0), whose denominator is ζ(0)=−1/2. In the Gamma quotient with α=β=1 the remaining height exponent is 1/2; with α=β=0 it is −1/2. For the real Weil test F(x)=exp(−a|x|), a>1/2+c, the difference quotient has two different one-sided limits at zero and is still admissible.

### Dependencies

Mathlib analytic orders, bounded variation, one-sided limits and integration; completed ContourIntegration via its exact boundary contracts; Layer 0 higher-genus and origin-zero adapters. ZerosOfLFunctions Layers 1, 4–8 supply the Gamma estimates, zero-free regions, the divisor, zero-count phase, rational explicit formula and PNT remainder.

<a id="layer-2"></a>

## Layer 2: Hecke and Artin comparisons and quantitative number-field estimates

Identify ideal Euler series with canonical Tate continuations before taking values or derivatives. Normalize all primitive completions and deleted factors. Construct the all-prime Artin local polynomial on inertia invariants, use integral Brauer induction for global meromorphy, and keep Artin holomorphy as a proposition. The fixed-degree estimates require uniform arithmetic conductor bounds, not merely continuation for each fixed field.

### 2.1 Nielsen cores and their oriented boundary maps

For a real quadratic field of positive fundamental discriminant D and a narrow class A, take a reduced representative wℤ+ℤ and its cyclic minus-continued-fraction period (n₁,…,n_ℓ). Put m=Σn_j, let T(z)=z+1 and S(z)=−1/z, and generate Γ_A by T^m and T^(n₁+⋯+n_k)ST^(−n₁−⋯−n_k). Define `quadraticNielsenCore A` as the closure of the Nielsen region modulo Γ_A, with its hyperbolic orbifold measure, cusp exhaustion and geodesic boundary. Construct the local isometry to PSL₂(ℤ)\ℍ from subgroup inclusion. It retains the parameter and orientation on boundary arcs, including overlapping or retraced projected arcs; its image set alone is insufficient for integration. Changing the reduced representative gives a conjugate subgroup and an isometric core compatible with this projection.

Prove that the signature is (0; 2,…,2; 1 cusp; 1 boundary), with ℓ order-two elliptic points, area πℓ and boundary length 2 log ε_D. Here ε_D>1 generates the full norm-one unit group. The boundary projects, with its oriented parametrization and multiplicity, onto C_A. For a Γ_A-invariant C² eigenfunction satisfying ΔF=s(1−s)F, integrable on the core and with the upper truncation boundary integral tending to zero, prove `core_stokes`: the integral of i∂_z F dz on the boundary is s(1−s)/2 times the area integral. For the Eisenstein application verify integrability and the differentiated cusp bound at Re s=1/2 before using this identity.

The intended interface is:

- `quadraticNielsenCore.conjugacy_equiv`: cyclic change of reduced period induces a measure-preserving isometry compatible with the modular projection.
- `quadraticNielsenCore.boundary_period`: integration on the boundary equals integration on the full oriented geodesic C_A, counting its arcs with their multiplicities.
- `quadraticNielsenCore.area_length`: area is πℓ and boundary length is 2 log ε_D.
- `quadraticNielsenCore.stokes`: the eigenfunction identity holds under the integrability and vanishing-cusp conditions above.

**Checks.**

- For D=28 and the principal period (3,6), obtain area 2π and boundary length 2 log(8+3√7).
- For its other narrow class, with period (3,3,2,2,2), obtain area 5π and the same boundary length. Their projections have the same geodesic image with opposite orientations; signed boundary periods must therefore distinguish them.
- For the sign convention Δ=−y²(∂ₓ²+∂ᵧ²), take F=log y on 0≤x≤1, 1≤y≤2. Then i∂F dz=dz/(2y), its counterclockwise boundary integral is 1/2−1/4=1/4, and (1/2)∫ΔF dμ=1/4. Reversing the boundary orientation reverses this value.
- The projected modular fundamental domain has area π/3, so replacing either core by that domain or by its unweighted projected image gives the wrong area. Identified polygon sides do not contribute to the intrinsic boundary.
- A nondecaying constant term proportional to y^s with Re s>1 fails the cusp and area-integrability conditions. It cannot justify the initial Eisenstein area integral on that half-plane.

See Duke–İmamoğlu–Tóth, [60][R60], §2 (2.1), (2.8)–(2.10), §3 (3.1)–(3.3) and Theorem 1, pp.951–958; §7 Lemma 2, (7.10)–(7.11), p.972. The polygon theorem and the finite-orbifold-chart and cusp-limit adapters to DifferentialGeometry Layer 5 are required proofs here. General manifold Stokes is consumed through its existing oriented integration interface.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic's quadratic class/continued-fraction dictionary; hyperbolic quotient geometry; DifferentialGeometry Layers 5 and 12; measure and differential-form integration; AutomorphicSpectralTheory's differentiated cusp estimates for the Eisenstein specialization.

### 2.2 Artin analytic conductor normalization

For a finite Galois extension L/F and a d-dimensional complex representation ρ, define `artinAnalyticConductor` by f_ρ=|Disc F|^d·Norm(N(ρ))>0, using the imported finite Artin conductor ideal. This adds the base-discriminant normalization required by the completed analytic function.

- `artinAnalyticConductor.pos`: f_ρ is positive, including dimension zero.
- `artinAnalyticConductor.directSum`: f_(ρ⊕σ)=f_ρ f_σ; the zero representation gives1.
- `artinAnalyticConductor.regular`: for the regular representation, f_ρ=|Disc L|, by transitivity of discriminants.
- `artinAnalyticConductor.linear`: over ℚ, a primitive character gives its positive conductor; over F retain |Disc F|.

**Checks.**

- The trivial representation has every exponent zero and conductor ideal one, including at ramified primes.
- For a tame one-dimensional ramified character, only G₀ contributes and its exponent is one. For an unramified character it is zero.
- For ℚ(i)/ℚ the nontrivial quadratic character has conductor 4, not the tame guess 2; the ramification filtration must retain the wild contribution at 2.
- The regular representation of that quadratic group gives discriminant ideal (4), whereas its trivial summand alone gives (1).

- The trivial one-dimensional representation over F has f=|Disc F|, although its conductor ideal is one. For F=ℚ(i), this gives4; omitting the base discriminant gives the wrong value1.
- The zero-dimensional representation has f=1 over every F, rather than |Disc F|.

See Tsimerman, [64][R64], proof of Corollary3.3, pp.383–384, for this analytic normalization and its conductor application. The quantitative normal-closure and conductor budgets are proved in [§2.32e](#s2-32e).

*Needs:* the finite Artin conductor supplier contract; the number-field discriminant tower formula; `Ideal.absNorm`.

<a id="s2-3"></a>

### 2.3 Hecke series and Tate integral comparison

Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

Assume K a number field; c unitary and trivial on K×; S finite containing infinity and all ramification of c; f admissible in Tate's Z1–Z3 class with the stated local factors; Re(s)>1.

Use GNF9's canonical local/ideal dictionary. At v∉S, Z_v=N(d_v)^−1/2Σ_(j≥0)χ(v)^jN(v)^−js. Multiply via AL.1 factorization with AL.0 measures/Fourier conventions; ADS3 identifies the absolutely convergent ideal Euler product and norm-regrouped series. Admissibility and regrouping are exact imports. AL.1 supplies the completed meromorphic Hecke equation, with no cancellation at a local factor's zeros.

For K=ℚ and trivial c, the unramified arithmetic series is ζ with exactly the S Euler factors removed. Ramified different factors N(d_v)^(−1/2) are retained. The character is an imported idele-class character, not an arbitrary list of local factors.

See [65][R65], §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.0; AutomorphicLFunctionsAndLocalFactors AL.1; [GlobalNumberFields 9][R19]; [ArithmeticDirichletSeries 3][R2].

<a id="s2-4"></a>

### 2.4 Hecke boundary adapter for Landau positivity

For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.

Assume Coefficients a_n real and nonnegative; the Dirichlet series may be indexed by ideals after regrouping by norm.

Verify ADS8's Landau/3–4–1 pole-order and logarithmic-coefficient hypotheses using ray-class orthogonality. Order0 at a regular point means nonvanishing; at1 permit a pole, or use the positive real limit if removable.

A simple pole at 1 is allowed; no value F(1) is asserted there. A removable value at 1 is at least 1 in the logarithmic normalization. No new generic Landau theorem is owned here.

See [53][R53], §3.3, Lemma 3.6 and Exercise 3.6.1, printed pp. 19 and 21.

*Needs:* [ArithmeticDirichletSeries 8][R3].

<a id="s2-5"></a>

### 2.5 Dedekind continuation and real-side comparison

The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.

Assume K a number field with r₁ real and r₂ complex places.

Import the trivial-character continuation from AL.1 and use the ideal Euler-product comparison on Re s>1. Multiply the continued function by s−1 and remove the simple singularity. Take its real right-hand limit using the Dedekind residue theorem; uniqueness of the continuous extension identifies the complex residue.

No evaluation of the totalized LSeries at −2 is used. For Q(i), the positive residue expression is π/4. The completed functional equation and trivial zeros are separate declarations.

See [65][R65], §4.4 Main Theorem 4.4.1 and §4.5, physical pp. 50–58.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.1; `NumberField.dedekindZeta`; `NumberField.dedekindZeta_residue`; `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; `Complex.Gammaℝ`; `Complex.Gammaℂ`.

<a id="s2-6"></a>

### 2.6 Sufficient conductor-discriminant estimate

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. There exists C_g>0 such that log f_ρ≤C_g(1+log D_E).

Here E is CM of degree2g, L its normal closure and ρ nontrivial odd irreducible. Use the imported finite conductor and §2.2 analytic normalization.

Use the imported integral conductor–discriminant comparison and lower filtration. Combine the finite-group dimension bound, D_L≤D_E^A_g and the normal-closure/different budget f_ρ≤D_L^(2dimρ/|G|). The resulting degree-dependent power suffices; f_ρ≤D_E is unnecessary.

See [64][R64], Proof of Corollary 3.3, p. 384; [64][R64], Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* [NumberFieldArithmetic 7][R26]; `Representation.IsIrreducible`; `NumberField.IsCMField.complexConj`; [§2.32e][R186].

<a id="s2-7"></a>

### 2.7 Quadratic zeta factorization and the residue quotient

For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.

Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1. Extend the identity to the canonical continuations; the residue quotient is a separate result.

See [64][R64], Euler-factor adapter for Tsimerman, Corollary 3.3, p.384; compare Thorner–Zaman §2.1 (2-1)–(2-7), pp.1140–1141.

*Needs:* [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27].

<a id="s2-8"></a>

### 2.8 Partial ideal zeta series

For a number field K, choose its ordinary or narrow ideal class group, and a class A. Let a_A(n) count nonzero integral ideals of norm n in A, with a_A(0)=0. Define ζ_A(s)=LSeries a_A s on Re s>1, using the imported norm-indexed ideal arithmetic function and finite norm fibres. Quadratic period applications use narrow classes for real quadratic K and ordinary classes for imaginary quadratic K. Index ideals, not their generators. The finite class sum agrees with NumberField.dedekindZeta as an LSeries: the latter may have a different zeroth coefficient, which LSeries ignores. The representative ordinary-class series is `partialIdealZeta`; `sum_partialIdealZeta` sums its finite class partition.

Apply normCoeff to the class indicator on the ordinary ClassGroup or NumberField.NarrowClassGroup via the canonical nonzero-ideal homomorphism; set coefficient0 to0. Regroup finite norm fibres and the finite class sum. Characters take values in complex units and have finite order, hence unit norm. Quadratic conjugation preserves norms and inverts narrow classes, then ordinary classes through their quotient. The general adapter assumes this class-inversion identity; the canonical quadratic specialization proves it.

- `partial_ideal_zeta.coeff`: a_A(n) is the finite cardinality of integral ideals of positive norm n in A; a_A(0)=0.
- `partial_ideal_zeta.sum_classes`: The sum of ζ_A over all ideal classes is the Dedekind series on Re s>1.
- `partial_ideal_zeta.character_sum`: For a class character χ, Σ_A χ(A)ζ_A(s) is its ideal-character LSeries on Re s>1.
- `partial_ideal_zeta.conjugation`: For a ring-of-integers automorphism τ whose induced map on the selected class group is inversion, norm preservation gives ζ_A(s)=ζ_(A⁻¹)(s) on Re s>1. The quadratic specialization uses the canonical quadratic conjugation; its narrow-class inversion is already available.

**Checks.**

- For K=Q, the unique partial series equals the Riemann series on Re s>1.
- a_A(1)=1 for the principal class and 0 otherwise.
- The unit ideal contributes once, even when the unit group is infinite.
- The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

The ℚ test is in the domain of this general coefficient definition; a real/imaginary quadratic restriction applies only to the subsequent period identities. Class-sum coefficient agreement is required for n≥1; do not infer equality of the zeroth coefficients from equality of LSeries.

See [60][R60], §7, p970.

*Needs:* `NumberField.dedekindZeta`; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 5][R7]; [GlobalNumberFields 2][R21]; `TauCeti.IdealArithmeticFunction`; `TauCeti.normCoeff`; `ClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv`.

<a id="s2-9"></a>

### 2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals)

For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.

Assume Fix n=[k:ℚ]≥1; D_k is the absolute discriminant; one absolute effective threshold D₀≥2 and an effective c_n>0 precede all k,Y; Y≥D_k^35.; π_k counts nonzero prime ideals of norm≤Y. The caseD_k=1 is outside the discriminant threshold, not a counterexample.

Use the [§2.9a](#s2-9a) below, including the exponent 35 in place of the printed 40 and the integer-rounding margin. Retain the absolute discriminant threshold and Y≥D^35.

See [66][R66], Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19; [66][R66], §4, Lemma4.4 and ensuing discussion, printed p.22; [67][R67], Theorem1.3.1, pp.11–12; conventions §1.5 p.26; selected §7.2.1 pp.159–160 and §7.2.4 pp.166–169.

*Needs:* [ArithmeticDirichletSeries 4][R8].

<a id="s2-9a"></a>

**§2.9a The exact 35/19 prime-ideal adapter.** The primary source is [67][R67], Theorem1.3.1, pp.11–12, with proof §7.2, pp.159–169. Its Lemma7.2.3, pp.159–160, still prints 40 in both its premise and conclusion. The proof of that lemma uses no inequality specific to 40: it converts any verified range B≥B₀ into x≥D_L^(B₀). The following contract makes the substitution B₀=35 explicit and also leaves room for the rounding of ℓ in the final case.

Put ℒ=log D_L and x=exp(Bℒ). For ℓ≥2,A>0,B>2ℓA let f be the translate of the convolution of 2ℓ probability densities A^(−1)1_[−A/2,A/2], supported on [B−2ℓA,B], with 0≤f≤A^(−1). Its Laplace transform is
F(z)=exp(−(B−2ℓA)z)((1−exp(−Az))/(Az))^(2ℓ), F(0)=1.
Use removable values at z=0. Define S=Σ_𝔭 (log N𝔭)/(N𝔭) f(log N𝔭/ℒ), over unramified degree-one primes of F with Frobenius in C, and T=|G|S/(|C|ℒ). Lemmas7.1.1–7.1.5, pp.153–158, give
π_C(x)≥A exp(−2ℓAℒ)S x/log x.
The error from ramification, prime powers and higher-degree primes in the weighted explicit formula is O(A^(−1)ℒ² exp(−(B−2ℓA)ℒ/2)) after normalizing by |G|/|C|. This uses log of the relative discriminant, the at-most-[F:Q] primes over a rational prime, and Minkowski [L:Q]≪ℒ, with absolute constants.

The local analytic contracts, taken in this order, are:

- `dedekind_weighted_zero_formula`: Lemma7.2.4, pp.160–161, writes |T−1|≤Σ_(|Imρ|<T*)|F((1−ρ)ℒ)| plus the four errors in (7.9): O(ℒ(2/(AT*ℒ))^(2ℓ)+ℒ² A^(−1)e^(−(B−2ℓA)ℒ/2)+ℒ(Aℒ)^(−2ℓ)e^(−(B−2ℓA)ℒ)+ℒ(2/(Aℒ))^(2ℓ)e^(−3(B−2ℓA)ℒ/2)). Zeros retain multiplicities. Deuring's cyclic reduction makes every continued factor a Hecke function; shift to Re s=−1/2 at zero-avoiding heights, use the Gamma logarithmic derivative there and sum the unit-height zero counts. Thus this does not assume Artin holomorphy.
- `dedekind_weighted_zero_partition`: Lemma7.2.5, pp.161–163, for 2≤R_j≤ℒ individually and 0=T₀<T₁≤…≤T_J=T*, removes the zeros outside β>1−R_j/ℒ, T_(j−1)≤|γ|<T_j with error at most a constant times min((2/A)^(2ℓ),ℒ)e^(−(B−2ℓA)R₁)+Σ_(j≥2)ℒ(2/(AT_(j−1)ℒ))^(2ℓ)e^(−(B−2ℓA)R_j). Its first error uses small rectangles of side 1/ℒ, not just an O(ℒ) count. The printed lemma also assumes the R_j increase, but its proof estimates each height band separately and never uses that assumption. The local contract omits it, as required by the decreasing R_j used on p.168.
- `dedekind_low_zero_weight`: Lemma7.2.6, pp.163–165, bounds Σ′|((1−e^(−Az))/(Az))^(2ℓ)|, z=(1−ρ)ℒ, by
((1−e^(−Aλ))/(Aλ))^(2ℓ−2) [φ(1−e^(−2Aλ))/(A²λ)+(2Aλ−1+e^(−2Aλ))/(2A²λ²)+η],
where φ=(1−1/√5)/2, all zeros have β<1−λ/ℒ at |γ|≤1, and the restricted sum has β≥1−R/ℒ. The λ=0 value is its limit 2φ/A+1+η. Its proof uses the positive-real-part Laplace transform of A^(−2)sinh((A−t)λ)1_[0,A]. Piecewise smooth tests are obtained by smoothing and dominated limits. The original smooth explicit formula and its positivity hypotheses are [Kadiri–Ng][R68], Theorem3 and proof §4, pp.3,15–18; real-zero repulsion is Theorem4 and proof §5, pp.3–4,19–24. These pages supply the test conditions, rather than an appeal to an unspecified zero-density result.
- `dedekind_repulsion_table` and `dedekind_real_zero_gap`: Zaman Theorems6.1.2–6.1.3 and Corollary6.1.4, pp.139–140, with proofs §§6.2–6.3, pp.141–152. The power-sum lemma finds 1≤k≤(12+ε)M with Re Σ z_j^k≥ε|z₁|^k/(48+5ε). Its proof uses the nonnegative Fejér weights and the split |z_j/z₁|≥1/3. The completed logarithmic derivative controls M by the explicit digamma quantities (6.7), (6.25); compare the zero-gap upper bound with this power-sum lower bound. For real secondary zeros the missing translated copy halves M, giving 24·0.6881<16.6 and 1−β₁≫D_L^(−16.6). For height T, use the (T,α,C) entries of p.151, not an optimized decimal with no witness. The signature includes an effective threshold and positive c(T), with β′≤1−log(c(T)/λ₁)/(C(T)ℒ).

The discriminant input in the last contract is unconditional: [Odlyzko][R69], Theorem1(4), p.210, proves log D≥r₁log60.1+2r₂log22.2−254, since its f₁≥0. This implies r₁log60+2r₂log22≤log D at sufficiently large D (for bounded degree absorb the fixed left side; for growing degree absorb 254 with the positive logarithmic gaps). The proof, pp.212–215 and the rational table on p.215, reduces to positivity of a rational function of y on x=1 by the harmonic maximum principle. A formal certificate may clear its positive denominators, use exact polynomial sign isolation on y²∈[0,1600], and the leading-term tail for y≥40. Gamma/digamma values in Zaman's finite table are enclosed by their convergent reciprocal series and integral tails. This gives a finite rational-verification route with the actual inputs and margins, and does not invoke ERH.

Here is the final range deduction, using those contracts. Let ρ₁ have maximal real part among |γ|≤1 and λ₁=(1−Reρ₁)ℒ. The one-zero region is [Kadiri][R70], Theorem1.1(1.8), p.3, proof §§2–3: λ₁<0.0784 implies a simple real zero. For every B≥35 choose parameters as follows.

| Range | (ℓ,A), zero estimates and resulting bound |
| --- | --- |
| λ₁≥0.0784 | (2,1.5); B−2ℓA≥29, hence also≥1.41. The low-zero bound at λ=0.0784 is <1.1166, and e^(−1.41·0.0784)1.1166<1. Choose the partition cutoff R large and errors small; T≫1. |
| η≤λ₁<0.0784 | (2,0.1); retain the weaker B−2ℓA≥2.23. Kadiri–Ng gives λ′≥0.6546log(1/λ₁). The normalized lower bound is 1−e^(−2.23λ₁)−6.5279λ₁^(1.4597)−ε≥0.0097λ₁−ε. Choose ε≤10^(−6)η. |
| ℒ^(−200)≤λ₁<η | (101,1/404), with B−2ℓA≥34.5 and in particular≥31.5. Repulsion at T*=1 and C=31.4 empties the remaining zero sum. The error is O(ℒ^(−201)+λ₁^(31.5/31.4)); fix η small after its constants. Thus T≫λ₁. |
| 0<λ₁<ℒ^(−200) | (⌈ℒ⌉,0.88/ℒ). For ℒ≥176, B−2ℓA≥33.23 and ℓA≤1. Use the ten bands below; remove β₁ and 1−β₁ explicitly. Their reflected term is O(e^(−33ℒ)). The errors are o(λ₁), giving T≫λ₁. |

The ten (T_j,C_j) pairs are (3.5,32.7),(8.7,35),(22,38.4),(54,42),(134,45.9),(332,49.7),(825,53.6),(2048,57.4),(5089,61.2),(12646,65). Put R_j=log(c_j/λ₁)/C_j. These cutoffs need not increase; use the bandwise partition contract just stated. The real-zero gap gives R_j≤ℒ and λ₁→0 gives R_j≥2 after one absolute threshold. In the last row the partition errors are
O(ℒλ₁^(33.23/32.7)+Σ_(j=2)^10 ℒe^[2log(2/(0.88T_(j−1)))ℒ]λ₁^(33.23/C_j)+ℒ³e^(−16.615ℒ)).
Here 33.23/32.7−1/200>1.011 and, for all nine j, 2log(2/(0.88T_(j−1)))+16.6(1−33.23/C_j)<−0.02. Combine λ₁≫ℒe^(−16.6ℒ) with λ₁<ℒ^(−200) to obtain o(λ₁). The rounding margin 33.23 replaces the literal p.168 inequality 35−2⌈ℒ⌉·0.88/ℒ≥33.24, which is not valid for noninteger ℒ. All inequalities needed by p.169 survive this weakening.

Finally T≫1 with A≥0.01,ℓA≤3 gives π_C(x)≫D_L^(−6)(|C|/|G|)x/log x. In the other case T≫λ₁ with A≫1/ℒ,ℓA≤1 gives π_C(x)≫D_L^(−2)λ₁(|C|/|G|)x/log x≫D_L^(−19)(|C|/|G|)x/log x. All thresholds are absolute and effective, fixed before L,F,C,B. This is Lemma7.2.3's proof with B≥35; the printed constant 40 is not used. Apply L=F=k and C={1}; counting all prime ideals only increases this degree-one lower count. This gives the deduction of §2.9 once the explicit finite numerical certificates in the stated contracts are supplied.

Required final interfaces are `zaman_weight_to_prime_count`, `zaman_weight_positive_ge_thirtyfive`, and `primeIdeal_lower_thirtyfive_nineteen` with the displayed quantifier order. These are arithmetic/analytic adapters owned here.

**Checks.**

- D=1 is outside the absolute threshold; log D is never divided by in that case.
- At B=35 all four parameter rows remain valid. Replacing the final row's ceil by an exact real parameter would invalidate its integer convolution definition.
- The secondary zero 1−β₁ is retained even when other zeros are repelled; symmetry alone does not eliminate it.
- A least-prime existence theorem does not imply this counting lower bound; the explicit weight-to-count inequality supplies the multiplicity of primes.

<a id="s2-10"></a>

### 2.10 Imaginary quadratic genus-character classification

For an imaginary quadratic field K of fundamental discriminant D<0, genus characters are homomorphisms Cl_K→{±1}, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations{D₁,D₂}, D=D₁D₂, one positive and one negative; permit the trivial discriminant1 with ε_1=1. For an integral ideal a prime to D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a). This comparison is the arithmetic classification/compatibility dictionary. The analytic equality L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂}) is supplied by the existing genus_lseries_factorization comparison, not proved again here.

Apply genusCharFunNarrowClassGroupHom to a chosen quadratic generator, squarefree radicand, distinct prime discriminants (at most one even), their total fundamentalDiscriminant, and a subset. Under IsTotallyComplex K transport via toClassGroupEquiv; the equivalence creates no such instance. The quadratic arithmetic owner proves subset/complement classification onto all quadratic ordinary-class characters, identified with unordered{D₁,D₂}. Match prime-to-D ideal values to Kronecker characters, ε₁=1. The analytic genus-factorization theorem is separate; the two existing constructors alone prove no classification.

For D=−4 only{1,−4} occurs and the genus character is trivial. For D=−15 the pairs{1,−15} and{5,−3} give the two genus characters. An ideal of norm2 (prime to15) has value ε_5(2)=ε_−3(2)=−1 in the nontrivial case. The prime-to-D condition is essential: extending a Dirichlet character by0 at ramified primes cannot define a{±1}-valued class character there.

See [71][R71], ChapterIV introduction after(0.3), p.268.

*Needs:* `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`; `NumberField.NarrowClassGroup.toClassGroupEquiv`.

<a id="s2-11"></a>

### 2.11 Artin local polynomial

For a finite Galois extension L/K, a finite-dimensional complex representation ρ of G=Gal(L/K), and a nonzero prime ideal p of K, choose P above p, its decomposition/inertia groups D_P,I_P and arithmetic Frobenius in D_P/I_P. On V^(I_P), Frobenius acts canonically. Define P_p(T)=det(1−T·Frob_P|V^(I_P)) in C[T]. The determinant is independent of P and of a Frobenius lift.

For the actual Gal(L/K)-representation restrict to I_P invariants. Normality in D_P preserves this subspace; two arithmetic Frobenius lifts agree there by IsArithFrobAt.mul_inv_mem_inertia, including ramified primes. Conjugating P transports throughρ(g); use LinearEquiv.charpoly_conj. Define A.charpoly.reverse, identified with det(1−TA) by Matrix.reverse_charpoly. Invertibility gives degree dim V^I; finite order puts eigenvalues and reciprocal polynomial roots on the unit circle. NFA2's unramified-only artinSymbol cannot define all these factors.

- `artin_local_polynomial.independence`: Changing P conjugates the invariant-space endomorphism and leaves P_p unchanged.
- `artin_local_polynomial.constant`: P_p(0)=1.
- `artin_local_polynomial.unramified`: For unramified p, P_p(T)=det(1−Tρ(Frob_p)) on all of V.
- `artin_local_polynomial.degree`: natDegree P_p=dim_C(V^I)≤dim_C V; the Frobenius endomorphism on V^I has eigenvalues of modulus1 and every root of P_p has modulus1. The degree-zero polynomial1 has no roots.
- `artin_local_polynomial.basis`: Changing the finite-dimensional basis does not change the polynomial.

**Checks.**

- For the one-dimensional trivial representation, P_p=1−T at every prime.
- For the zero representation, P_p=1.
- For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.


See [53][R53], §22.2 p.128 ramified-prime paragraph.

*Needs:* [NumberFieldArithmetic 2][R24]; `Representation.invariants`; `Representation.mem_invariants`; `IsArithFrobAt.mul_inv_mem_inertia`; `IsArithFrobAt.conj`; `LinearEquiv.charpoly_conj`; `Matrix.charpolyRev`; `Matrix.reverse_charpoly`; `NumberField.exists_isArithFrobAt`.

<a id="s2-12"></a>

### 2.12 Primitive Hecke functional-equation normalization

For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

Assume K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.; χ primitive of conductor 𝔣 for the functional equation.

Import the Hecke functional equation of AutomorphicLFunctionsAndLocalFactors Layer 1 on its canonical completed carrier. Use the Re s>1 comparison to identify the finite Euler product, retaining the different and Haar constants. Transport the identity using the identity theorem; do not claim a new Tate functional-equation proof.

For K = ℚ and a primitive Dirichlet character χ of positive conductor N, distinguish the conductor-completed meromorphic function Λ(s,χ)=N^(s/2)·DirichletCharacter.completedLFunction χ s from Mathlib’s completedLFunction, which omits that conductor power. Mathlib states completedLFunction χ (1−s)=N^(s−1/2)·rootNumber χ·completedLFunction χ⁻¹ s. Multiplying by N^((1−s)/2) gives Λ(1−s,χ)=rootNumber χ·Λ(s,χ⁻¹); compare orientations before identifying ε(χ). At poles use meromorphic identities, not a product of totalized point values. Check that an imprimitive character's L-function acquires zeros on Re s = 0 from the removed Euler factors, which is why the functional equation is stated only for the primitive function.

See [65][R65], §4.5, physical pp. 57–59.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.1; [§2.3][R188]; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

<a id="s2-13"></a>

### 2.13 Ideal-character Hecke L-function

For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.

Regroup the canonical ideal-character series by its finite class values. Apply ADS Euler products with χ(p) retained in every local factor.

See [60][R60], §7, p970.

*Needs:* [§2.8](#s2-8); [§2.3][R188].

<a id="s2-14"></a>

### 2.14 Siegel lower bound for real quadratic class number times regulator

For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for fundamental D>1, with an ineffective c_ε>0 and the narrow regulator convention of the quadratic regulator dictionary.

Import the narrow/ordinary class-number and norm-minus-one unit dichotomy. Apply Siegel and the positive real-quadratic residue formula with the specified fundamental unit.

The nontrivial real quadratic field has fundamental discriminant D>1; its fundamental unit and narrow regulator retain the DIT convention.

See [60][R60], §6, pp967–968.

*Needs:* [§0.9](#s0-9); [§2.5][R190].

<a id="s2-15"></a>

### 2.15 Siegel lower bound for imaginary quadratic class numbers

For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.

Use the imaginary-quadratic residue formula and the degree-two uniform roots-of-unity bound. Insert Siegel’s primitive quadratic L-value lower bound.

See [60][R60], §6, pp967–968.

*Needs:* [§0.9](#s0-9); [§2.5][R190].

<a id="s2-16"></a>

### 2.16 Explicit residue bound for Dedekind zeta functions (Louboutin)

For every number field K of degree d>1 and absolute discriminant D_K, the residue κ_K of the continued Dedekind zeta function satisfies κ_K≤(e log D_K/(2(d−1)))^(d−1).

Assume K is a number field; d=[K:ℚ]>1; D_K is the positive absolute discriminant; κ_K is the residue of the complex continuation at1, matched to the real residue limit.

The original proof is the positive Mellin comparison below. Optimize its parameter at s=1+2(d−1)/log D_K; its Gamma-factor endpoint inequalities retain the constant e/2. Keep d>1 and the exact degree-dependent exponent; this upper bound alone does not prove a lower bound.

See [72][R72], Theorem1(1), p.1195; proof §6.1, pp.1214–1215, using Theorem21, pp.1209–1210 and Lemmas24–26, pp.1212–1214.

*Needs:* [§2.5][R190]; [§2.16a](#s2-16a).

<a id="s2-16a"></a>

**§2.16a Positive Mellin comparison with the sharp residue constant.** Write d=r₁+2r₂>1, A=√D_K/(2^r₂π^(d/2)), Γ_K(s)=Γ(s/2)^r₁Γ(s)^r₂ and F_K(s)=A^sΓ_K(s)ζ_K(s). If λ=AΓ_K(1)κ_K, the Mellin functional equation split at1 gives
`F_K(s)=λ/[s(s−1)]+∫₁^∞S_K(x)(x^(s−1)+x^(−s))dx`.
Here S_K(x)=Σ_(n≥1)a_K(n)H_K(nx/A), where H_K is the multiplicative convolution of r₁ copies of2exp(−x²) and r₂ copies of exp(−x); those kernels have Mellin transforms Γ(s/2) and Γ(s). Thus H_K,S_K are nonnegative, and the split formula follows by Mellin inversion, the functional equation and the two residues, with normal tail convergence. For real s>1 it implies λ/[s(s−1)]≤F_K(s). At each rational prime the map (x_i)↦(f_ix_i) injects the ideal norm fibre Σf_ix_i=k into compositions of k into at most d parts. Consequently0≤a_K(n)≤d_d(n), including ramified primes, and ζ_K(s)≤ζ(s)^d.

The duplication formula now yields
`κ_K≤D_K^((s−1)/2)(s−1)^(1−d)g(s)`,
where g(s)=s^(−(r₁+r₂−1))Λ(s)^dG(s)^r₂,
Λ(s)=s(s−1)π^(−s/2)Γ(s/2)ζ(s), G(s)=√πΓ((s+1)/2)/(sΓ(s/2)). Both factors are positive and log-convex for real s>0. For G this follows directly from the positive integral G(s)=(1/2)∫₀¹t^((s−1)/2)(1−t)^(−1/2)dt and Hölder. For Λ a theta proof also supplies the step cited externally in Louboutin Lemma24: put f(x)=Σ_(n≥1)e^(−πn²x) and P(x)=(4(x∂x)²+2x∂x)f(x). Termwise P(x)=Σ(4π²n⁴x²−6πn²x)e^(−πn²x)>0 for x≥1. Theta inversion gives P(x)=x^(−1/2)P(1/x), so P is positive everywhere and decreases exponentially at both endpoints after that change of variable. Twice integrating by parts gives Λ(s)=∫₀^∞P(x)x^(s/2−1)dx, first for Re s>1 then by normal continuation. Hölder proves the stated real log-convexity. The cancelled endpoint is Λ(1)=G(1)=1.

Minkowski gives D_K≥(d^d/d!)²(π/4)^d≥π^d/4≥exp(2(d−1)/5), for d≥2; the middle inequality follows by the consecutive-degree ratio≥π. Hence s*=1+2(d−1)/log D_K≤6. The function log g is convex. For all signatures except(r₁,r₂)=(0,1),
`g(6)=6(2π³/189)^r₁(5π⁷/47628)^r₂≤1`,
because r₁+r₂≥2,2π³/189<0.329,5π⁷/47628<0.318 and6·0.329²<1. For the imaginary quadratic signature D_K≥3 gives s*<3, and g(3)=6ζ(3)²/π²<0.88<1. These strict rational bounds follow, for example, from3.14159<π<3.14160 and Σ_(n≤100)n^(−3)+∫₁₀₀^∞t^(−3)dt<1.203. Convexity bounds g(s*)≤1 in both cases. Substitution gives D_K^((s*−1)/2)=e^(d−1), proving exactly §2.16. No imaginary-quadratic discriminant is assumed≥5.

Checks: degree1 is excluded and would divide by0; the signature(0,1) uses endpoint3 rather than the false assertion g(6)≤1; D=3 lies in that branch. The ramified prime norm-fibre injection needs no unramified hypothesis. *Needs:* [§2.5](#s2-5) and [§2.17a](#s2-17a) for the continued Dedekind functional equation; Mellin inversion and the positive-kernel split specified here; GlobalNumberFields discriminant and signature, GeometryOfNumbersAndQuadraticArithmetic Minkowski bound; native Gamma duplication and Hölder; finite compositions. This is Louboutin §6.1(1) with the log-convexity step made explicit, not a restatement of its application in Lipnowski–Tsimerman.

<a id="s2-17"></a>

### 2.17 Imaginary quadratic completion and root number

For negative fundamental D, put δ=|D| and let ε_D be the canonical primitive odd Dirichlet character of Q(√D), of conductorδ. On Re s>1, Λ_std(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D). Its canonical entire continuation is δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s). The new quadratic normalization assertion is that the root number is+1 and Λ_std(1−s,ε_D)=Λ_std(s,ε_D). Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.

Multiply Mathlib's nontrivial primitive completedLFunction by δ^((s+1)/2), using logδ forδ>0. Compare ζ_K=ζ_QLε_D on Re s>1 and then meromorphically. The number-field completion and Gamma duplication give Γ_C/Γ_R=Γ_R(s+1), after the canonical odd-character/conductor identification. Cancel on a nonzero open half-plane to force root+1 and continue. Neither |root|=1 nor totalized Γ·L at a cancelled pole fixes this sign.

At D=−4 the conductor is4, the character is odd and Λ_std(0)=Λ_std(1)=1; at D=−3 both endpoints are1/√3. Mathlib’s unnormalized completed function alone has the conductor factorδ^(s−1/2) in its functional equation; that factor cancels only after multiplying by the specified conductor power. The completion is its canonical entire continuation. At negative odd integers, a divergent gamma factor times a vanishing L-value must not be assigned the naive product value0.

See [71][R71], ChapterIV§4, p.282, proof of(4.1), and§5 p.290 after(5.4).

*Needs:* `DirichletCharacter.differentiable_completedLFunction`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; [§2.7][R192]; [§2.5][R190]; AutomorphicLFunctionsAndLocalFactors AL.1; [§2.17a](#s2-17a).

<a id="s2-17a"></a>

**§2.17a Dedekind completed-functional-equation comparison.** For a number field K with absolute discriminant D_K, r₁ real places and r₂ conjugate pairs of complex places, let Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s), the Complex.Gammaℝ and Complex.Gammaℂ. The canonical continuation supplied by Tate has Λ_K(s)=|D_K|^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s), and Λ_K(1−s)=Λ_K(s) as meromorphic functions. No equality of totalized values at poles is asserted.

Import AL.1 global Tate functional equation, archimedean local factors and unramified finite factors, using the standard trace additive character and its self-dual measure. At finite places the inverse different supplies |D_K|^(s/2); the conductor of the trivial character is the unit ideal. Compare Tate’s local constants with the displayed gamma convention; s-independent constants cancel from the functional equation. Use the Dedekind convergence-half-plane comparison to identify the continuation. The measure/different adapter is part of this target; the global integral equation alone does not supply it.

See [65][R65], §4.5, scan pp.56–59, especially (4.24) on scan p.58; local factors tabulated in §2.5.

<a id="s2-18"></a>

### 2.18 Imaginary quadratic class-number value at one

For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).

Use L(1,ε_D)=κ_K/κ_Q withκ_Q=1 and the continued/norm-series comparison. The residue2^r₁(2π)^r₂R_Kh_K/(w_K√δ), at r₁=0,r₂=1,R_K=1,w_K=2u, isπh/(u√δ). The regulator/embedding dictionaries and continuation adapter are required beyond the library's one-sided real residue limit.

D=−4 gives L(1,ε_−4)=π/4 (h=1,u=2). D=−3 gives L(1,ε_−3)=π/(3√3) (h=1,u=3). For h,u>0 this value is positive; confusing roots of unity w with half-units u loses a factor2.

See [71][R71], ChapterIV§4 pp.283–284, Propositions(4.4)–(4.5), implicit class-number substitution.

*Needs:* `B4`; `NumberField.dedekindZeta_residue`.

<a id="s2-18a"></a>

**§2.18a Quadratic Hecke value as residue quotient.** For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function. Here η is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.

Multiply the continued quadratic factorization by s−1 and take the limit at 1. Cancel the positive κ_F and use holomorphy of the nonprincipal Hecke factor.

See [64][R64], Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

<a id="s2-19"></a>

### 2.19 Artin Euler series

For a finite Galois extension L/K of number fields and a finite-dimensional complex representation ρ of Gal(L/K), and Re s>1, L_K(s,ρ)=∏_p P_p((Np)^−s)^−1, over all nonzero prime ideals of K, with complex powers using the positive real norm logarithm. Coefficients are the norm-regrouped reciprocal local-polynomial coefficients, not a completely multiplicative degree-one ideal weight.

For P(0)=1 recursively set a₀=1, a_(n+1)=−Σ_(j=0)^nP_(j+1)a_(n−j), and extend by unique ideal factorization multiplicatively, not completely multiplicatively. Expanding each reciprocal polynomial into m=dim V^I≤d geometric factors bounds its absolute coefficients by(1−Np^−σ)^−d. The d-fold Dedekind majorant proves ideal-indexed absolute convergence in artin-absolute-convergence. ADS1 regroupByNorm and ADS3 EulerProductData identify the canonical normCoeff LSeries and unordered all-prime product on Re s>1. Trivialρ recovers all Dedekind factors, including ramified primes; zeroρ gives1.

- `artin_euler_series.local`: Every local factor is the reciprocal of the inertia-invariant polynomial.
- `artin_euler_series.series`: The absolutely convergent Euler product equals the norm-regrouped coefficient LSeries on Re s>1.
- `artin_euler_series.nonzero`: The convergent Euler product is nonzero on Re s>1.
- `artin_euler_series.direct_sum`: On Re s>1, L_K(s,ρ₁⊕ρ₂)=L_K(s,ρ₁)L_K(s,ρ₂), including all ramified local factors; see Layer 2/artin-direct-sum-factor.
- `artin_euler_series.deleted`: Omitting a finite bad-prime set multiplies L_K by exactly ∏_{p bad}P_p((Np)^−s).

**Checks.**

- The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.
- The zero representation gives1.
- A one-dimensional character ramified at p contributes local factor1 there.


See [53][R53], §22.2 pp.127–128 incomplete Euler product and ramified-factor prescription.

*Needs:* [§2.11][R195]; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2].

<a id="s2-20"></a>

### 2.20 Negative even zeros of the continuation

For a number field K and every integer n≥1, the canonical holomorphic Dedekind continuation at −2n has a zero of exact order r₁+r₂, where r₁ and r₂ are its real-place and complex-pair counts. In particular ζ_K^cont(−2n)=0, since r₁+r₂≥1. This evaluates the continuation, not the totalized ideal LSeries.

At1+2n the convergent positive ideal series is≥1, from the unit ideal; all completed factors are finite and nonzero. Reflect the meromorphic functional equation. Each Γ_R,Γ_C has a simple pole at−2n with nonzero residue, giving total order−(r₁+r₂). Add orders to get ζ_K's exact order r₁+r₂≥1. Totalized Gamma values cannot replace this germ calculation.

For Q the order is 1, agreeing with the already implemented negative-even Riemann zeros. For a real quadratic field the order is 2, whereas for an imaginary quadratic field it is 1.

See [65][R65], §4.5 equation on scan p.58, with §2.5 archimedean factors; derived negative-even specialization.

*Needs:* [§2.5][R190]; AutomorphicLFunctionsAndLocalFactors AL.1; [§2.17a](#s2-17a).

<a id="s2-21"></a>

### 2.21 Canonical ray-character comparison and the quadratic endpoint

For a nonprincipal quadratic character χ of a finite ray class quotient, identify its canonical Tate continuation with the continued norm-regrouped ideal-weight function, including finite omitted Euler factors. Prove L(1,χ)≠0. Combined with the nonreal endpoint argument and the imported weight nonvanishing away from 1, this gives the full ray-character boundary comparison.

Assume K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

Identify the canonical continuations on Re s>1 using their absolutely convergent ideal series, then use uniqueness on the connected holomorphy domain. For a quadratic character use the positive auxiliary function L(s,χ)ζ_K(s)/ζ_K(2s), whose hypothetical zero at 1/2 contradicts Landau positivity. The nonreal endpoint follows from the separate ray-product order argument.

Check K = ℚ against Mathlib: DirichletCharacter.LFunction_ne_zero_of_one_le_re. Check the need for a separate argument at s = 1 for real χ: χ = χ̄ gives only one zero against the pole, so the product argument alone does not decide it.

See [53][R53], §3.3–§3.4, Theorems 3.8, 3.10 and 3.11, printed pp. 19–20; [53][R53], §22.5, Theorem 22.4, printed p. 129.

*Needs:* [§2.4](#s2-4); [§2.12][R197]; [§2.5][R190]; [GlobalNumberFields 9][R19]; [ArithmeticDirichletSeries 3][R2]; `LSeries.positive`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; [§2.3][R188]; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 8][R3]; [§2.21a](#s2-21a); [§2.21b](#s2-21b); [§2.21c](#s2-21c); [§2.21d](#s2-21d); [§2.21e](#s2-21e); [§2.21f](#s2-21f).

<a id="s2-21a"></a>

**§2.21a Ray-class product has no boundary zeros.** For the finite character group of a ray class quotient, the product of the continued Hecke L-functions has no zeros at regular points of Re s≥1. At s=1 it has meromorphic order ≤0, permitting the principal-character pole. Each Euler logarithmic coefficient is nonnegative by finite-character orthogonality, with bad-prime factors treated separately.

Here K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

Expand the logarithm of the convergent Euler products on Re s>1. Use finite-character orthogonality, separately planned below, to obtain nonnegative coefficients. Apply the Hecke boundary adapter with the single principal-character pole and holomorphy of every other factor.

See [53][R53], §3.3, Theorem 3.7 and (3.3.1), printed p. 19.

<a id="s2-21b"></a>

**§2.21b Nonnegative ray-character logarithmic coefficients.** For a finite abelian ray-class quotient H and its full complex character group Ĥ, for h∈H and an integer k≥1, Σ_{χ∈Ĥ}χ(h^k) is #H if h^k=1 and 0 otherwise. On Re s>1 the contribution of an allowed prime ideal 𝔭 to log ∏_χL(s,χ) is Σ_{k≥1}(Σ_χχ([𝔭]^k))/k · N𝔭^(−ks). Thus these logarithmic coefficients are nonnegative after norm regrouping, with bad primes omitted consistently.

Use the actual finite abelian ray quotient and its complete dual: sum χ(h^k)=#H when h^k=1 and0 otherwise. This orthogonality is an explicit GNF9 supplier requirement, not an inference from the special Dirichlet-character theorem. Choose the Euler logarithm that tends to0 as Re s→∞. Its prime-power expansion is absolutely locally uniformly convergent on Re s>1, includes1/k and may be interchanged with the finite character sum. Regroup nonnegative real coefficients by the positive integer norm (with coefficient0 at norm0); ideals sharing the same norm are added. A common finite modulus removes the same bad prime set for every character, including the principal one.

See [53][R53], §3.3 Theorem3.7 p.19 equation(3.3.1), corrected by the normalization convention.

<a id="s2-21c"></a>

**§2.21c Nonreal Hecke characters are nonzero at one.** For a finite-order ray character χ with χ≠χ̄, its canonical L(1,χ) is nonzero.

Match conjugation of the continued Hecke functions at real s=1; the distinct χ and χ̄ factors have the same positive zero order if either vanishes. All nonprincipal factors are holomorphic at1 and the principal incomplete factor has exactly one pole of order1 (its deleted local polynomials are nonzero at1). Thus the full ray product would have total order≥1. The existing ray-product Landau corollary prohibits a zero at1 and therefore prohibits that positive total order. This argument does not require Artin holomorphy.

See [53][R53], §3.4 Theorem3.10 p.19 full proof.

<a id="s2-21d"></a>

**§2.21d Positive quadratic auxiliary Euler factors.** For a nonprincipal quadratic Hecke character χ, Ψ(s)=L(s,χ)ζ_K(s)/ζ_K(2s) has, on Re s>1, local factors (1+x)/(1−x) when χ(p)=1, 1 when χ(p)=−1, and1+x at omitted character primes, x=(Np)^−s. Hence its norm-regrouped Dirichlet coefficients are nonnegative.

At every p put x=(Np)^−s. The ζ_K(s)/ζ_K(2s) factor is1+x. Multiply by1/(1−χ(p)x), taking χ(p)=0 at character-conductor primes. This gives (1+x)/(1−x),1,1+x in the split/inert/conductor cases. The respective power series have coefficients1+2Σ_{k≥1}x^k,1,1+x. Every coefficient is real nonnegative and the unit-ideal coefficient is1. Multiply finite products using unique ideal factorization, then pass to absolute convergence and sum the finite norm fibres. The construction uses the full ζ_K quotient; the source instead deletes the common level primes in its principal L-functions. Retaining1+x at omitted character primes is the correct full-zeta generalization.

See [53][R53], §3.4 Theorem3.11 p.20 displayed quadratic auxiliary product.

<a id="s2-21e"></a>

**§2.21e Auxiliary holomorphy under vanishing at one.** If L(1,χ)=0 for the preceding quadratic character, Ψ extends holomorphically to Re s>1/2. Indeed ζ_K(2s) is nonzero there because Re(2s)>1, and the numerator’s zero cancels ζ_K’s pole at1. At s=1/2, Ψ extends with a zero of order at least1.

L(s,χ) is entire for nonprincipal finite-order χ; ζ_K has only its simple pole at1. Under L(1,χ)=0 the numerator therefore extends holomorphically there. For Re s>1/2 the denominator ζ_K(2s) is nonzero by its convergent Euler product, so the quotient is holomorphic. The reciprocal of ζ_K(2s) has a simple zero at s=1/2 with leading coefficient2/Res_{u=1}ζ_K(u). The numerator is holomorphic at1/2, hence the quotient is holomorphic there and vanishes, with order≥1 unless it is locally identically zero. The original Euler product shows it is not identically zero. No nonzero numerator value or simple quotient zero is presumed.

See [53][R53], §3.4 Theorem3.11 p.20 pole-cancellation paragraph.

<a id="s2-21f"></a>

**§2.21f Landau contradiction for a quadratic character.** For a nonprincipal quadratic Hecke character χ, L(1,χ)≠0. If it vanished, the nonnegative Dirichlet series of Ψ from Layer 2/quadratic-auxiliary-positive-factors would have abscissa≤1/2 by ADS8 Landau and Layer 2/quadratic-auxiliary-holomorphy holomorphy. For every real σ>1/2 its value would then satisfy Ψ(σ)≥1, while Layer 2/quadratic-auxiliary-holomorphy gives lim_{σ↓1/2}Ψ(σ)=0, a contradiction. No convergence or sum identity at σ=1/2 is required.

The series converges for Re s>1, so its abscissa is not +∞. If its finite abscissa a were>1/2, Landau would force a singularity at the real point a, contradicting Layer 2/quadratic-auxiliary-holomorphy. An abscissa of −∞ already supplies all these real convergence points. Hence the abscissa is≤1/2. For each real σ>1/2, use the canonical continued-series identity on the connected half-plane and nonnegative coefficients with unit coefficient1 to prove Ψ(σ)≥1. Continuity of the holomorphic extension at1/2 gives its right limit0. For σ sufficiently close to1/2 this contradicts Ψ(σ)≥1. The proof never uses a boundary series sum or an unjustified boundary-convergence claim.

See [53][R53], §3.4 Theorem3.11 p.20 complete proof and §2.1 Theorem2.4 p.12 proof.

<a id="s2-22"></a>

### 2.22 Explicit degree-uniform Hecke convexity

This is the Rademacher–Thorner–Zaman refinement of [3.3][R13]: its one implied constant is absolute, independent of K, n and r. All degree and strip-width dependence remains in the displayed ζ(1+r)^n, (2π)^n and height factors. The supplier’s generic fixed-degree, ε-dependent convexity estimate is consumed, not restated as a target.

Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it with chi nontrivial or s≠1, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. Define the pole factor to be |(1+s)/(1-s)| for the trivial character, and 1 for every nontrivial character (including at s=1); zeta_Q means the Riemann zeta function.

Use the primitive completed functional equation and the absolutely convergent right-edge bound. Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor.

The trivial character at s=1 is outside this finite-value inequality; do not interpret its meromorphic pole via totalized division. Nontrivial characters may be evaluated at s=1.

See [73][R73], Lemma2.3 [Rademacher 1959], unnumbered bound, printed p.1142.

*Needs:* [§2.12][R197].

<a id="s2-23"></a>

### 2.23 Logarithmic functional equation at zero and one

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0. Each real local component of η is the sign character, so the conductor-normalized completion is Q^(s/2) Γ_R(s+1)^g L_f(s,η), with Γ_R(s)=π^(−s/2)Γ(s/2). This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.

Here η is the canonical character obtained through global Artin reciprocity.

Consume AL.1's CM completion and cm-logarithmic-gamma-correction. After endpoint nonvanishing differentiate at0,1 and use Gamma logarithmic derivatives at1,2. Keep Q distinct from D_E until arithmetic identification; export the finite Hecke endpoint sum.

For E=ℚ(i), F=ℚ, Q=4: L_f(0,η)=1/2 and L_f(1,η)=π/4; the claimed sum becomes γ+log(π/2). Exclude E=ℚ(√2), F=ℚ: its even primitive character χ_8 has L_f(0,χ_8)=0, so the displayed logarithmic quotient at 0 is undefined.

See [64][R64], Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors; [73][R73], (2-3)–(2-7), printed pp.1140–1141; specialized using CM sign characters.

*Needs:* `B4`; [§2.12][R197]; [ClassFieldTheory 13][R28]; [GlobalNumberFields 10][R20].

<a id="s2-24"></a>

### 2.24 Hecke CM partial-zeta identity

For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation. Here K=ℚ(√D), A is an ordinary ideal class, z_A is its associated CM lattice point in the upper half-plane, and ω_D=|O_K^×|/2 (thus ω_−4=2 and ω_−3=3). Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s).

Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer. Match E* and the gamma/discriminant normalization on Re s>1.

For D=−4 use ω_D=2, not the full unit count 4; for D=−3 use ω_D=3. Match the primitive Eisenstein half-sum convention before comparing constants.

See [60][R60], §7 (7.1), printed p.970; the half-unit convention is ω_D=|O_Kˣ|/2.

*Needs:* `B2`; [§2.8](#s2-8); [§2.13][R204].

<a id="s2-25"></a>

### 2.25 Hecke positive-sign real quadratic formula

For fundamental D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The integration measure denoted ds in the displayed formula is hyperbolic arc length y^(−1)|dz|, not the complex variable s.

Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action. Sum the A and JA branches; match arc length and the even gamma factor.

See [60][R60], (7.2), p.970 (Hecke; a cited result, 'He showed').

*Needs:* `B2`; [§2.8](#s2-8); [§2.13][R204].

<a id="s2-26"></a>

### 2.26 Genus Hecke factorization

(p.971.) Let D = d'd ≠ 1 be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). Either factor may be the trivial discriminant 1. For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ_DIT(s,χ) = Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d), with the genus completion as in (7.4)–(7.5) and the Dirichlet completion fixed in the conventions by (5.13).

Reuse the genus character on the narrow class group and its coprime-ideal evaluation. Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity.

The field discriminant excludes D=1; this does not exclude a factor discriminant equal to1 in a genus decomposition.

See [60][R60], §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8).

*Needs:* [§2.13][R204]; `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`.

<a id="s2-27"></a>

### 2.27 Hecke negative-sign real quadratic formula

For fundamental D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.

Unfold the oriented differential i∂_zE* dz over the full norm-one unit quotient. Take the A−JA difference and retain Γ((s+1)/2)^2, rather than the even gamma factor.

See [60][R60], §7 (7.3), printed p.970; full norm-one-unit geodesic convention.

*Needs:* `B2`; [§2.8](#s2-8); [§2.13][R204].

<a id="s2-28"></a>

### 2.28 Imaginary quadratic class-number value at zero

With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.

Use the canonical root-number-one continuation from imaginary_quadratic_root_number_one, not a pointwise product at a gamma pole. At0 and1 the gamma factors are regular; Γ(1/2)=√π andΓ(1)=1 give Λ_std(0)=√δ L(0) andΛ_std(1)=(δ/π)L(1). Insert L(1)=πh/(u√δ) from imaginary_quadratic_lvalue_one, obtaining L(0)=h/u. Both gamma values are library declarations.

D=−4 gives L(0,ε_−4)=1/2; D=−3 gives L(0,ε_−3)=1/3. For D=−15, h=2,u=1, hence L(0,ε_−15)=2. This is for odd characters from negative fundamental discriminants. An even nontrivial quadratic character has a trivial zero at0 and cannot satisfy this formula.

See [71][R71], ChapterIV§4 pp.283–284, implicit special-value substitution.

*Needs:* [§2.17](#s2-17); [§2.18](#s2-18); `Complex.Gamma_one`; `Complex.Gamma_one_half_eq`.

<a id="s2-29"></a>

### 2.29 Global meromorphic Artin continuation

Every finite-image complex Artin Euler series has a meromorphic continuation to C obtained from an integral Brauer expression as a finite product of integer powers of canonical Hecke continuations. This asserts global meromorphy, not Artin holomorphy.

The existing integral Brauer/elementary-nilpotent/monomial/transitivity chain in [From RepresentationTheory][R128] gives χ_ρ=Σn_jInd_(H_j)^Gχ_j with integral n_j and linearχ_j. Apply artin-direct-sum-factor, artin-induction-factor and artin-linear-hecke-comparison on Re s>1. The finite product of integral powers of canonical meromorphic Hecke functions is meromorphic: denominator factors are not identically zero, by right-half-plane nonvanishing. Identity uniqueness removes dependence on the Brauer expression. Negative n_j permit poles; rational induction would give only a meromorphic power, not this continuation or Artin holomorphy.

See [53][R53], §22.5 boundary result; integral monomial induction is supplied by the current Tau Ceti declarations listed in the boundary section; [56][R56], ChapterVIII§10 Artin L-series, pp.261–262.

*Needs:* `B1`; [RepresentationTheory/InductionRestriction 6][R30]; [§2.12][R197].

<a id="s2-29a"></a>

**§2.29a Absolute convergence of Artin factors.** For fixed dimension d and ε>0, uniformly on Re s≥1+ε, the local factors satisfy |P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s. Their product converges absolutely and locally uniformly and is nonzero there.

Apply artin-local-reciprocal-bound with θ=2^(−1−ε) and t=(Np)^−Re s. Since Np≥2, all local factors and their reciprocal partial products stay nonzero and their deviations from1 have a common summable majorant C_{d,ε}(Np)^−1−ε. Prime ideals are a subset of the nonzero ideals; the full Dedekind series converges at1+ε. For the coefficient series, use the d-fold convolution majorant described in Layer 2/plan/artin-euler-series, whose ideal sum is ζ_K(1+ε)^d, including d=0. ADS3 supplies the absolute/unordered product-to-series limit after these hypotheses. Summability of deviations gives a locally uniform product and summability for the reciprocal factors; the limit is nonzero. Dependence of the global bound on K is allowed, while the displayed local constant depends only on d,ε.

See [53][R53], §22.2 p.128 absolute convergence paragraph.

<a id="s2-29b"></a>

**§2.29b Induction identity including ramification.** For H⊆G and a complex finite-dimensional representation σ of H, with F=L^H, L_K(s,Ind_H^G σ)=L_F(s,σ) on Re s>1, including all ramified local factors.

Apply the ramified local induction polynomial identity at every prime p of K. The residue norm identity Nq=(Np)^f(q/p) matches every right-hand norm variable exactly. Evaluate the finite local determinant identity at T=(Np)^−s, then rearrange the absolutely convergent prime products from Layer 2/artin-absolute-convergence. This is representation induction on H=Gal(L/F), including nonnormal F/K.

See [53][R53], §22.5 Theorem22.4 sketch p.129.

<a id="s2-29c"></a>

**§2.29c Linear Artin factors are Hecke factors.** For L/K finite Galois and a one-dimensional finite-order character χ:Gal(L/K)→C×, composition with the arithmetic global Artin map gives the canonical primitive finite-order Hecke character η. On Re s>1, the full Artin Euler series equals its full Hecke L-function. At p where χ is trivial on inertia both factors are (1−χ(Frob_p)(Np)^−s)^−1; otherwise both are1. The conductor and archimedean signs come from the same local/global reciprocity dictionary.

Compose χ with the existing globalArtinMap, using its principal-ideles triviality and local compatibility; obtain the existing GNF9 finite-order primitive character, with its real-place sign from CFT11. CFT7 characterConductorExp and its unramified criterion identify local conductor exponent0 exactly with inertia-triviality. Compare the arithmetic Frobenius local value at those primes; at positive conductor exponent both local factors are1. Evaluate absolutely convergent products and use the existing Hecke Euler comparison. Do not use an arbitrary imprimitive modulus to erase extra primes or invert the arithmetic Artin normalization.


<a id="s2-29d"></a>

**§2.29d Uniform finite Artin factor bound.** For d∈N,0≤m≤d,0≤t≤θ<1 and α₁,…,α_m∈C with |α_j|=1, put A(z)=∏_{j=1}^m(1−α_j z). For |z|=t, A(z)≠0, |A(z)^−1|≤(1−θ)^−d and |A(z)^−1−1|≤d t(1−θ)^−d. The assertion includes d=m=0.

Each |1−α_j z|≥1−t≥1−θ>0, so every reciprocal factor exists and has norm≤(1−θ)^−1. Telescope the reciprocal finite product: the jth term has one factor difference α_j z/(1−α_j z) and at most m−1 preceding factors. Each term is bounded by t(1−θ)^−m, and summing gives m t(1−θ)^−m≤d t(1−θ)^−d. For a finite-order invariant-space automorphism, every characteristic root satisfies α^N=1 for a positive group exponent N, so |α|=1. The polynomial splits over C. This supplies the local factor hypotheses without choosing a new representation carrier.

See [53][R53], §22.2 p.128 local O(p^−s) estimate.

<a id="s2-29e"></a>

**§2.29e Ramified local Artin induction identity.** For L/K finite Galois with group G,H≤G,F=L^H and σ a finite-dimensional complex representation of H, at every nonzero prime p of K, P_{p,Ind_H^Gσ}(T)=∏_{q|p in F}P_{q,σ}(T^{f(q/p)}). The right polynomials are defined from Gal(L/F)=H, their own inertia invariants and arithmetic Frobenius modulo inertia.

Fix P of L above p and its groups I⊲D. Match the primes q of F above p with H\G/D by NumberFieldArithmetic1.4, and use Mackey3a to split the induced representation restricted to D. In each Mackey summand, take I-invariants. Frobenius permutes the inertia-orbit blocks in cycles of length f(q/p). The cycle return map is the relative Frobenius on the appropriate conjugated σ-invariant space, with independence only modulo inertia at a ramified prime. The determinant of I−T times a cyclic block with return map A and cycle length f is det(I−T^f A). Multiply these blocks. The ramified Frobenius/invariant-space and cyclic-block adapters are steps of this target; unramified automorphism equality is insufficient.

See [53][R53], §22.5 Theorem22.4 sketch p.129; full ramified local identity is a required expansion.

<a id="s2-30"></a>

### 2.30 Imprimitive Hecke deleted factors

Let χ be the ray ideal character modulo a modulus m induced from a primitive finite-order Hecke character χ₀ of conductor f₀ dividing m. If m_fin is the finite part, then L_m^cont(s,χ)=L^cont(s,χ₀)∏_{p|m_fin, p∤f₀_fin}(1−χ₀(p)exp(−s log Np)). Each prime occurs once even if its exponent in m grows; real-place conditions enter the conductor dictionary but do not delete finite Euler factors. Equality is meromorphic.

Use GNF's ray-character/conductor dictionary and primitive Euler comparison on Re s>1. Delete one factor per prime dividing m but not f₀; continue meromorphically by uniqueness, retaining the trivial pole and correction's removable zeros.

For K=Q and primitive trivial character, agree with Mathlib’s principal-character finite Euler correction. Changing a finite modulus p to p² deletes the same single factor; an added real place creates no new finite prime factor.

See [65][R65], §4.5, scan p.57, Euler product over finite primes outside S.

*Needs:* [§2.12][R197]; [GlobalNumberFields 9][R19]; [§2.3][R188].

<a id="s2-31"></a>

### 2.31 Sign of the quadratic Gauss sum from the Dedekind functional equation

Let D ≠ 1 be a fundamental discriminant, δ = |D|, ε_D the primitive quadratic Dirichlet character of conductor δ attached to ℚ(√D), and κ(D) = 1 if D > 0, κ(D) = i if D < 0. Then (i) DirichletCharacter.rootNumber ε_D = 1; equivalently (ii) the Gauss sum Σ_{n mod δ} ε_D(n) e(n/δ) equals κ(D) δ^{1/2}, and for every integer r, Σ_{n mod δ} ε_D(n) e(rn/δ) = ε_D(r) κ(D) δ^{1/2} (zero when gcd(r,δ) > 1); (iii) if D is odd and gcd(R,δ) = 1, then Σ_{n mod δ} e(Rn²/δ) = κ(D) δ^{1/2} ε_D(R). The representative root-number signature is `rootNumber_eq_one_of_isPrimitive_of_sq_eq_one`.

Continue ζ_K=ζLε_D for K=Q(√D). The root-one Dedekind and Riemann completed equations, with Γ_R(s+a), give reflection for the quotient. Compare Mathlib IsPrimitive.completedLFunction_one_sub and use ε_D⁻¹=ε_D and a nonzero function to force rootNumber=1 (the imaginary case is §2.17). Its definition gaussSumχ/(I^a√N) gives(i); gaussSum_mulShift_of_isPrimitive gives shifted sums for every residue, including nonunits. For squarefree oddδ, expand the root count∏_(p|δ)(1+(m/p)); only the full product survives, yielding the shifted ε_D Gauss sum at R.

D = −4: Σ_{n mod 4} ε_{−4}(n) e(n/4) = i − (−i) = 2i = κ(−4)·4^{1/2}. D = 5: the Gauss sum is √5 (positive), not −√5. D = −3, R = 1: Σ_{n mod 3} e(n²/3) = 1 + 2e(1/3) = i√3. The sign is the content: Tau Ceti and Mathlib give only the square of the Gauss sum or its modulus.

See [71][R71], Chapter IV, §2, proof of (2.3), p. 275; §3, proof of (3.2), p. 278.

*Needs:* [§2.7][R192]; [§2.5][R190]; [§2.17](#s2-17); `DirichletCharacter.rootNumber`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `gaussSum_mulShift_of_isPrimitive`; `completedRiemannZeta_one_sub`.

<a id="s2-32"></a>

### 2.32 Artin continuation near the line one

Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

Assume Finite Galois K/ℚ; finite-dimensional complex representation; arithmetic Frobenius at unramified primes; omitted-prime set fixed.

Use NFA2 arithmetic Frobenius/conjugacy and this layer's determinant direct-sum/induction comparisons. Rational Artin induction expresses mρ as a virtual sum of induced linear characters. CFT11/GNF9 identify their canonical finite-order Hecke functions; this layer supplies their completed equation, boundary nonvanishing and the trivial factor's pole. The mth-root-gluing target selects the root agreeing with the Euler product on Re s>1 on small boundary discs. Separate trivial summands for the pole order. Integral Brauer proves global meromorphy; this rational-root route does not prove global Artin holomorphy.

For the trivial representation recover ζ times the omitted local factors and a simple pole at1. For a nontrivial one-dimensional character recover the Hecke near-line result. At ramified primes the complete local factor would act on inertia invariants; an arbitrary Frobenius lift on the whole representation is invalid. No natural-density conclusion is included; that theorem belongs to Chebotarev.

See [53][R53], Chapter22, §§22.2–22.5, Theorems22.3–22.4, printed pp.128–129.

*Needs:* `B1`; [§2.21][R213]; `Complex.exp`; `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; `analyticAt_clog`; `Complex.exp_eq_one_iff`; `Complex.exists_continuousOn_eqOn_exp_comp`; [RepresentationTheory/InductionRestriction 6][R30]; `LinearMap.charpoly_prodMap`; [§2.32a](#s2-32a); [Analyticity of a continuous logarithm][R15]; [§2.32b](#s2-32b); [§2.32c](#s2-32c); [§2.32d](#s2-32d).

<a id="s2-32a"></a>

**§2.32a Gluing m-th roots across the line Re s = 1.** Let f be holomorphic and zero-free on {Re s > 1}, m ≥ 1, and U an open set containing {Re s = 1} ∖ {1} on which a holomorphic, zero-free g is given with g = f^m on U ∩ {Re s > 1}. Then f extends holomorphically (and zero-free) to {Re s > 1} ∪ U′ for an open U′ ⊇ {Re s = 1} ∖ {1}: on each disc D ⊆ U centred on the line there is a unique holomorphic h_D with h_D^m = g agreeing with f on the connected set D ∩ {Re s > 1}, and the h_D agree on overlaps.

Here Discs D centred at points of Re s = 1 with D ⊆ U; D ∩ {Re s > 1} is a nonempty half-disc, hence connected.

On the simply connected D, g has m holomorphic m-th roots, differing by m-th roots of unity; exactly one agrees with f at a point of D ∩ {Re s > 1}, hence on all of it (identity theorem on the connected half-disc). On D ∩ D′ ∩ {Re s > 1} ≠ ∅ both roots equal f, so they agree on the connected D ∩ D′ (a lens, connected) by the identity theorem.

See [53][R53], §22.5, proof of Theorem 22.4, printed p. 129.

<a id="s2-32b"></a>

**§2.32b Direct sums of Artin local factors.** For ρ₁,ρ₂, P_p(ρ₁⊕ρ₂,T)=P_p(ρ₁,T)P_p(ρ₂,T) at every prime, including ramified primes. Hence L(ρ₁⊕ρ₂)=L(ρ₁)L(ρ₂) on Re s>1.

The inertia-fixed subspace of the direct sum is the direct sum of fixed subspaces by the existing invariants membership formula. Transport Frobenius to the block diagonal map. Apply LinearMap.charpoly_prodMap to the two finite endomorphisms and transport through polynomial reversal, or use the corresponding determinant block identity. Use Layer 2/artin-absolute-convergence absolute local uniform convergence to multiply the finite local identities in the directed limit of prime sets; no statement about arbitrary totalized products is used.

See [53][R53], §22.2 p.128 displayed direct-sum identity.

<a id="s2-32c"></a>

**§2.32c Analytic root on a nonvanishing disc.** Let D=Metric.ball(a,r)⊆C with r>0,F analytic on D and F(z)≠0 there,m∈N with m≥1,z₀∈D and w₀^m=F(z₀). There exists an analytic R on D with R(z)^m=F(z) for every z∈D and R(z₀)=w₀. Any analytic S with the same powers and value at z₀ equals R throughout D.

The nonempty open disc is simply connected. Apply the existing Complex.exists_continuousOn_eqOn_exp_comp to F and upgrade its continuous logarithm L to analytic using Layer 0/continuous-log-analytic-upgrade. Put R₀=exp(L/m). Since R₀ never vanishes and R₀(z₀)^m=F(z₀), c=w₀/R₀(z₀) has c^m=1. Define R=c R₀; it has the desired power and value without assuming an arbitrary principal-root branch. The quotient S/R is continuous and lies in the finite set of mth roots of unity. Connectedness of D makes it constant; its value1 at z₀ proves uniqueness. The finite-root/discrete-image adapter remains formal work, not a newly formalized canonical root carrier.

See [53][R53], §22.5 Theorem22.4 p.129 root-gluing sketch.

<a id="s2-32d"></a>

**§2.32d Overlaps of boundary-centred discs.** If two open complex discs centred on Re s=1 intersect, their intersection is connected and contains a point with Re s>1.

Each open disc is convex as a real subset of C; their intersection is convex, hence preconnected and connected when nonempty. Take z in the intersection. If Re z>1 it is the required point. If Re z<1, use z′=2−conj z; centres on Re=1 make both distances unchanged and Re z′>1. If Re z=1, choose a positive real shift smaller than min(r−|z−a|,q−|z−b|). The triangle inequality preserves both strict ball inequalities and puts the shifted point to the right.

See [53][R53], §22.5 Theorem22.4 p.129 patching sentence; expanded geometric input.

<a id="s2-32e"></a>

**§2.32e Normal-closure discriminants and conductor budgets.** If E/Q has degree d and L is its normal closure, m=[L:Q]≤d! and D_L≤D_E^m≤D_E^(d!). For any intermediate K, D_K≤D_L^(1/[L:K]). For a complex representation χ of H=Gal(L/K), its analytic conductor is Q_χ=D_K^(χ(1))N(f_χ) and satisfies Q_χ≤D_L^(2χ(1)/|H|). These are all-prime conductors. For a quadratic E/F, Q_η=D_F N(f_η)=D_E/D_F.

The discriminant argument is local before taking norms. Under compositum base change the extended different of K₁K₂/K₁ divides the extended different of K₂/Q. Iterating and applying the different tower formula gives D_(K₁…K_r)≤∏D_(K_i)^(m/[K_i:Q]). Take the at most d conjugates of E; every factor is D_E and the exponent sum is at most m. This is [Stark][R74], Lemmas6–7 and their proofs, printed p.143. The intermediate-field inequality follows directly from D_L=D_K^[L:K]N(D_(L/K)).

For the conductor, on each lower ramification group H_i, the codimension of χ-invariants is at most χ(1) and is zero if H_i=1. Compare Σ_i |H_i|codim(V^(H_i))/|H_0| with |H|Σ_i(|H_i|−1)/|H_0|, the regular-representation discriminant exponent. The inequality |H_i|≤2(|H_i|−1) for nontrivial H_i gives the displayed factor 2. Include D_K^(χ(1)) and the discriminant tower formula. This is the proof of [Cho–Lemke Oliver–Zaman, v2][R75], Lemma4.2, pp.9–10. For quadratic characters the regular character is 1+η, so conductor–discriminant gives the sharper equality, not the factor-2 bound. No tameness restriction is introduced.

Required interfaces are `normalClosure_discriminant_le`, `subfield_discriminant_le`, `artin_analyticConductor_le` and `quadratic_analyticConductor_eq`. They use the arithmetic conductor/different carriers of the cited arithmetic owners; their inequalities are local adapters here.

**Checks.**

- For d=1,E=Q the normal closure has D=1; every inequality is equality.
- For a quadratic E/Q, L=E and the exact conductor of η is D_E. The coarse inequality D_L≤D_E² is permitted but is not used as an equality.
- A wildly ramified prime contributes through every H_i. Keeping only H_0 would fail the different comparison, including at 2 and 3.
- The normal-closure hypothesis matters: adjoining unrelated ramification to an arbitrary Galois overfield gives no bound in terms of D_E.

<a id="s2-32f"></a>

**§2.32f Fixed-degree residue lower bound, including nonnormal fields.** For n≥1 and a>0 there is c_(n,a)>0 such that κ_K≥c_(n,a)D_K^(−a) for every degree-n number field K. The constant is allowed to be ineffective. For the upper bound κ_K≤C_(n,a)D_K^a, use the pole-aware convexity estimate of Thorner–Zaman Lemma2.3, pp.1142–1143, on |s−1|=r with0<r≤min(a,1/4). It gives sup|(s−1)ζ_K(s)|≤C_(n,r)D_K^r; the maximum principle bounds its value κ_K at the centre. This subpower upper bound uses neither the sharper Louboutin constant nor an unproved lower bound.

For K≠Q, [Stark][R74], Lemmas2–4, pp.137–141, gives κ_K≥c min(1/log D_K,1−β_K), with β_K the possible real zero in the one-zero rectangle. Its proof integrates the completed logarithmic derivative from σ₀=1+1/(4log D_K) to 1, isolates the single zero and uses ζ_K(σ₀)≥1; the Gamma logarithmic derivatives on this fixed real interval are bounded. Thus no product of unknown signed Artin values is used.

If 1−β_K≥1/(4n!log D_K), this already gives the required bound. Otherwise Stark Lemma8, pp.145–146, places β_K in a quadratic subfield F⊂K, without assuming K normal. Here is its finite-character step. Pass to the normal closure B; the Aramata quotient first makes β_K a zero of ζ_B. Since log D_B≤n! log D_K, it lies in B's one-zero rectangle; Stark Lemma1, pp.136–137, then makes it simple. Entirety of the quotient alone would not prove simplicity. Put Θ_H=Σ_χ ord_β L(s,χ)χ for every subgroup H≤Gal(B/Q). Artin induction and Frobenius reciprocity give Θ_G restricted to H equal to Θ_H. On a cyclic H, all factors are one-dimensional Hecke functions, holomorphic there, and their nonnegative orders sum to ord_β ζ_B=1. Consequently Θ_H is a single linear character and |Θ_G(g)|=1 for every g. Orthogonality gives Σ_χ ord_β(L_χ)²=1; Θ_G(1)=1 forces exactly one coefficient +1 and all others zero. Since β is real this character is real, hence trivial or quadratic. The trivial option is excluded by ζ_Q(β)≠0. Its quadratic fixed field F lies in K because the order of ζ_K is the average of Θ_G on Gal(B/K). This is Stark Theorem3 and its proof, pp.144–145; it also proves §2.40 directly and avoids an unnamed Möbius/determinant argument.

For this quadratic F, Siegel's primitive real-character bound in §0.9 and the conductor-controlled derivative estimate in the zero-separation adapter give 1−β_K≥c_b D_F^(−b) for each b>0. The different tower formula gives D_F≤D_K, so take b=a. The complementary fixed discriminant range is finite and has positive residues; K=Q has κ=1. This proves the stated uniformity and explains precisely where ineffectivity enters. Combining κ_K with the real class-number formula and the bounded archimedean factor (n fixed) proves §2.33 and §2.47. The number of roots of unity is bounded in degree n: if w-th roots occur then φ(w)≤n, giving a finite set of w.

Required interfaces are `dedekind_residue_lower_of_zero_gap`, `simple_dedekind_zero_linear_character`, `near_one_dedekind_zero_quadratic_subfield`, and `dedekind_residue_subpower_lower`. Their prerequisites are the [§2.40b](#s2-40b), [§2.32e][R186], meromorphic Artin/Hecke comparison, finite cyclic character orthogonality and the Layer0 Siegel/zero-separation estimates.

**Checks.**

- K=Q uses κ=1 and does not invoke log D_K=0 in a denominator.
- A nonnormal cubic field is included: the closure has degree at most 6, and no normality premise is added to the residue result.
- The near-zero character argument begins with possibly negative Artin orders. Nonnegativity is used only after restriction to cyclic groups, where Hecke holomorphy proves it.
- The conclusion permits an exceptional zero and ineffective constants; it does not assert a computable D^(−a) bound for every a.

<a id="s2-32g"></a>

**§2.32g Uniform regularized finite-order Hecke endpoints.** Fix n,m≥1. Let K have degree≤n, let ψ be a primitive finite-order Hecke character of order≤m, Q=D_K N(f_ψ), δ=1 for the trivial character and 0 otherwise, and let H extend (s−1)^δ L(s,ψ) holomorphically at 1. For every a>0,
|H(1)|+|H(1)|^(−1)+|H′(1)|≤C_(n,m,a)max(1,Q)^a.
All endpoints are nonzero. Constants may be ineffective. The derivative and upper-value bounds are effective; ineffectivity occurs only in the lower bound.

For the upper bounds use Thorner–Zaman Lemma2.3, printed p.1142, on a circle |s−1|=r≤1/4, with its strip parameter η=r. Multiplication by (s−1)^δ removes the explicit principal pole; the remaining elementary factor |1+s|^δ is bounded on the circle. The convexity exponent (1+η−Re s)/2 is ≤r, and height is bounded, so sup|H(s)|≤C_(n,r)Q^r. Cauchy gives |H′(1)|≤C_(n,r)Q^r/r. No zero-free disk is assumed. Choose r≤a; small Q is absorbed in the constant.

For a nontrivial ψ of order h≤m, global reciprocity defines a cyclic extension N/K of degree h with ζ_N=∏_(j=0)^(h−1)L(s,ψ^j), every factor taken primitively with all local factors. Thus ∏_(j=1)^(h−1)L(1,ψ^j)=κ_N/κ_K. Conductor–discriminant and f_(ψ^j)|f_ψ imply D_N≤Q^h, while [N:Q]≤nm. The preceding residue lower bound controls κ_N from below, the residue upper bound controls κ_K, and the circle estimate controls every other factor from above. Taking absolute values of this finite product isolates |L(1,ψ)| from below. Use exponent a/(4m) for the individual bounds and absorb their fixed number; repeated characters or conjugate pairs need no special choice of logarithm. For ψ trivial, H(1)=κ_K and both residue bounds apply directly. This proves the missing reciprocal-value input independently of the derivative estimate.

For the CM normal-closure family of §§2.34,2.46, Q≤D_E^(2M_g) by the conductor budget. The existing finite-carrier Brauer bound gives Σ|n_j|≤B_g. Frobenius reciprocity yields Σ n_jδ_j=⟨χ_ρ,1⟩=0 for a nontrivial irreducible ρ. The germ identity is therefore L_ρ=∏H_j^(n_j), with no remaining pole. Applying the displayed endpoint estimate with exponents divided by 2M_g and B_g proves both bounds in §2.34. For logarithmic derivatives use H′_j(1)/H_j(1), taking exponent a/2 in each factor, before summing n_jH′_j/H_j. This supplies §2.46 and the factorwise input of §2.45 without an Artin-holomorphy conjecture. For §2.52 only the single quadratic factor is needed; its positive endpoint is κ_E/κ_F.

Required interfaces are `regularizedHecke_circle_bound`, `regularizedHecke_value_subpower`, `regularizedHecke_inverse_subpower`, `regularizedHecke_deriv_subpower`, and `regularizedHecke_logDeriv_subpower`. The source for the convexity bound and its proof is [73][R73], Lemma2.3, pp.1142–1143; the lower bound is the residue/product argument above, not a consequence of Cauchy alone.

**Checks.**

- For the trivial character over Q, H=(s−1)ζ has H(1)=1; L(1) itself is not a finite value.
- For h=2 the product has one nontrivial factor, giving exactly L(1,ψ)=κ_N/κ_K>0.
- For h=3 the two conjugate factors have product |L(1,ψ)|². Taking an absolute value before isolating one factor is consistent with this positive product.
- A holomorphic function with a tiny nonzero endpoint may have a large logarithmic derivative even if its derivative is bounded. The separate reciprocal estimate is essential.

<a id="s2-33"></a>

### 2.33 Bounded-degree Brauer-Siegel

For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit. The representative hR comparison is `bounded_degree_brauer_siegel`.

Use the [§2.32f][R164], which includes nonnormal fields, and the explicit residue upper bound. Apply the real analytic class-number formula; bounded degree bounds the roots-of-unity and archimedean factors, and finite adjustment handles bounded discriminants.

See [64][R64], 2.2, p. 382; proof of Corollary 3.3, p. 384; [4].

*Needs:* [§2.5][R190]; [§2.16](#s2-16); [§2.29][R220]; `NumberField.dedekindZeta_residue`; `NumberField.classNumber`; `NumberField.Units.regulator`; [§2.32f][R164].

<a id="s2-34"></a>

### 2.34 Two-sided subpolynomial values at one

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there is C_(g,ε)>0 such that |L(1,ρ)|≤C_(g,ε)D_E^ε and |L(1,ρ)|⁻¹≤C_(g,ε)D_E^ε. The constants may be ineffective. Continued L-functions are required to match the all-prime Euler series on Re s>1 and be analytic, nonzero at1.

Use the stated finite family and no general Artin-holomorphy assumption. The [§2.32g][R221] supplies both directions, including positive residues of trivial factors; its reciprocal bound is independent of Cauchy.

Use χ_ρ=Σ_(j∈J)n_jInd_(H_j)^Gψ_j with |J|,Σ|n_j|≤B_g and base degrees≤M_g. Bound each full Hecke analytic conductor by D_E^C_g. Regularize H_j=(s−1)^δ_jL_j, δ_j=1 for trivialψ_j, and prove Σn_jδ_j=0 and Lρ=∏H_j^n_j as nonzero holomorphic germs at1. Fixed-degree upper/reciprocal subpower estimates with exponent ε/(C_gB_g) give both signed-product bounds; never take the absolute value of a trivial pole separately.

See [64][R64], Proof of Corollary 3.3, p. 384; [64][R64], Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* `B1`; [§2.21][R213]; [§2.6][R222]; [RepresentationTheory/InductionRestriction 6][R30]; [§2.32e][R186]; [§2.32g][R221].

<a id="s2-35"></a>

### 2.35 A fixed small circle gives a subpolynomial derivative

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

Here η is the canonical character obtained through global Artin reciprocity.

Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r. Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed.

See [64][R64], Cauchy-circle adapter for Tsimerman, Corollary 3.3, p.384; Thorner–Zaman Lemma 2.3, p.1142, supplies the required pole-aware convexity statement.

*Needs:* [§2.22](#s2-22); [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27]; [ClassFieldTheory 13][R28]; AutomorphicLFunctionsAndLocalFactors AL.1; [§2.32g][R221].

<a id="s2-36"></a>

### 2.36 Theorem3 negative factors

For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.

Apply the odd compact-boundary Hecke identity and the genus Euler factorization. Continue this identity to the critical line before applying Stokes; never start from the divergent Re s>1 core integral.

See [60][R60], §5 Theorem 3, first branch, p.964; §7 (7.8), Lemma 2 (7.10)–(7.11), p.972.

*Needs:* `B2`; [§2.27](#s2-27); [§2.26][R225].

<a id="s2-37"></a>

### 2.37 Theorem3 positive factors

Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.

Sum the even compact-geodesic identity against χ and use genus factorization. Identify geodesic and boundary arcs on the critical line with the imported oriented geometric conventions.

See [60][R60], Theorem 3, second case, p.964; for all s by (7.8), p.972.

*Needs:* `B2`; [§2.25](#s2-25); [§2.26][R225].

<a id="s2-38"></a>

### 2.38 Theorem3 CM factors

For coprime fundamental d,d′ of opposite sign, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity. Here D=dd′<0, the sum is over ordinary ideal classes of ℚ(√D), χ is the genus character, and ω_D=|O_K^×|/2 as in the CM partial-zeta comparison; use the same E* normalization.

Sum the CM point partial-zeta identity against the genus character. Match the two Dirichlet gamma factors and the unit factor 2√π/ω_D.

See [60][R60], Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971.

*Needs:* `B2`; [§2.24](#s2-24); [§2.26][R225].

<a id="s2-39"></a>

### 2.39 Ray-class L-function zero-density estimate

There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.

Assume k is a number field of fixed degree n; D_k is its absolute discriminant; Q,T>1; 1/2≤σ<1; ε>0.; Count nontrivial zeros with analytic multiplicity and strict σ<Reρ<1, inclusive |Imρ|≤T. Sum once over each primitive finite-order ray class character of exact conductor ideal𝔮, including its infinity component.

Use canonical finite-order ray-class functions and [ZerosOfLFunctions Layer4][R14]'s multiplicity-weighted divisor. Specialize the original family-density theorem to trivial GL1 base, retaining ε, LOW Theorem4.2's degree dependence and full conductor/character family. The Pasten appendix/Thorner–Zaman density proof is local; constructing another zero divisor is unnecessary.

See [66][R66], Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19; [66][R66], §4, Theorem4.2, printed p.20.

*Needs:* [§2.12][R197]; [§2.21][R213].

<a id="s2-40"></a>

### 2.40 Heilbronn's theorem on real zeros of Dedekind zeta functions

If K/Q is finite Galois and the canonical continued ζ_K has a simple real zero β with0<β<1, then a quadratic subfield k⊆K satisfies ζ_k(β)=0. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.

Heilbronn Theorem1 first puts the simple real zero in the compositum K₂ of all quadratic subfields. Meromorphic Artin continuation gives integral orders m_χ, possibly negative, for irreducible characters. The Aramata–Brauer theorem says ζ_K/ζ_E is entire for every intermediate E (K/E remains Galois). Thus ζ_E has zero order0 or1 at β. This stronger holomorphy-of-a-quotient input is supplied by the two local Aramata targets below; meromorphic Artin continuation alone does not give it. Form the virtual character φ=Σ m_χχ. The subgroup averages S(H) are the intermediate zeta orders. If the maximal abelian subfield’s zeta is nonzero, choose a minimal subgroup H* of the commutator subgroup with S(H*)=0; proper subgroups have average1. Möbius inversion over cyclic subgroups forces H* cyclic. Odd-prime cyclic quotients are ruled out by conjugate pairs of nonreal degree-one Hecke factors; hence H* is a nontrivial2-group. Write the real virtual character as φ_+−φ_− with real genuine characters. Every determinant character is trivial on the commutator subgroup, so the multiplicities of eigenvalue−1 on a generator are both even. The subgroup-average difference forces their difference to be1, a contradiction. In the maximal abelian extension, nonreal Hecke factors occur in conjugate pairs and cannot contribute a simple real zero. Over Q, ζ_Q is nonzero on(0,1), so the real factor is a nontrivial quadratic character; its quadratic field zeta vanishes. The positive cyclic-character decomposition and entire quotient are stated below. The [§2.32f][R164] above gives a shorter complete finite-character route, following Stark Theorem3, pp.144–145. It proves the assertion directly, so the longer Möbius/determinant route is optional.

K=Q cannot satisfy the premise: ζ_Q has no zero on(0,1). For K quadratic over Q the conclusion is its own field, by ζ_K=ζ_Q L(s,χ_K). An Artin factor may have a pole: nonnegative m_χ are never assumed in the virtual-character argument.

See [76][R76], Theorem1 p.870; complete proof pp.871–873; postscript p.873; [51][R51], §8.3 p.92, proof following Theorem8.13.

*Needs:* `B1`; [§2.40b](#s2-40b); [§2.29][R220]; `LinearMap.charpoly_prodMap`; [§2.7][R192]; [§2.32b](#s2-32b).

<a id="s2-40a"></a>

**§2.40a Positive cyclic decomposition of the augmentation character.** For a finite group G, there exist a positive integer N and finitely many cyclic subgroups C_j≤G, nontrivial one-dimensional complex characters ψ_j of C_j and nonnegative integers n_j such that N(Reg_G−1_G)=Σ_j n_j Ind_(C_j)^G ψ_j. The trivial group permits the empty sum. This positive rational decomposition is stronger than the signed integral Brauer expression used for meromorphic continuation; no claim of nonnegative coefficients for arbitrary irreducible characters is made.

Group elements by conjugacy of the cyclic subgroups they generate. For each nonidentity class of this relation, Aramata's Satz5 constructs a class function supported on that class and the identity. Its expression in cyclic induced characters has coefficients proportional to φ(k)−μ(k), which vanish for k=1 and are positive for k>1. Satz6 sums these functions to Reg_G−1_G. Clear the finitely many positive rational denominators to obtain N and n_j.

See [77][R77], Sätze4–6 and proof of the main theorem, printed pp.32–34; divisor identities Sätze1–3, p.31.

*Needs:* [From RepresentationTheory][R128], for finite-group class functions, linear characters, induction and their character formulas; finite cyclic character orthogonality and Möbius divisor inversion.

<a id="s2-40b"></a>

**§2.40b Aramata entire quotient.** For a finite Galois extension K/E of number fields, the meromorphic quotient ζ_K/ζ_E extends to an entire function, agreeing with the quotient on Re s>1. For K=E this is the constant1. This assertion includes removal of the apparent singularities at zeros of ζ_E.

Apply the positive cyclic decomposition to Gal(K/E). Artin induction and the ramified local-factor identity identify the N-th power of the quotient with a product of nonnegative integer powers of finite-order Hecke L-functions attached to the nontrivial ψ_j. Each factor is entire. The quotient is already meromorphic; a pole of order m would give a pole of order Nm in its N-th power, so it has no poles. This argument does not assume general Artin holomorphy.

See [77][R77], main theorem p.31 and proof p.34.

*Needs:* [§2.40a](#s2-40a); [§2.29][R220]; [§2.29b][R209]; [§2.29c][R210]; [§2.12][R197].

<a id="s2-41"></a>

### 2.41 Eisenstein series at a CM point equals a partial zeta function

Let D<0 be a fundamental discriminant, K=Q(√D), u=#O_K^×/2 and A an ordinary ideal class. Choose its CM lattice point τ_A in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant D. Let E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s), the uncompleted level-one Eisenstein series. For Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s), equivalently2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s). All positive-base powers use the real logarithm. Changing A to A^(−1) leaves its partial zeta unchanged.

Substitute E*=π^−sΓ(s)ζ(2s)E andω_D=u in hecke_cm_partial_zeta_identity. On Re s>1 cancel nonzeroπ^−sΓ(s), retainingζ(2s), the primitive half-sum and u=#units/2. Use the supplier's lattice/ordinary-class choice; inverse classes agree only through the conjugation/partial-zeta adapter. Nonfundamental order discriminants are excluded. This is a normalization comparison, not a second CM-period construction.

For D=−4, τ=i, u=2 and the single class, ζ_Q(i)(s)=2^s ζ(2s)E(i,s)/(2·4^(s/2))=ζ(2s)E(i,s). For D=−3 the unit factor is u=3, not1. A primitive form with nonfundamental discriminant−16 represents a nonmaximal order in Q(i); it cannot be substituted into this field-discriminant formula.

See [71][R71], ChapterII§4, p.248, immediately after(4.1).

*Needs:* [§2.24](#s2-24).

<a id="s2-42"></a>

### 2.42 Artin holomorphy as a hypothesis

For a finite Galois extension L/K of number fields and a finite-dimensional complex representation ρ of Gal(L/K), ArtinHolomorphy ρ is the proposition: the meromorphic continuation of the Artin Euler series L_K(s,ρ) of this layer (Brauer continuation) has no poles in ℂ ∖ {1}, and its order at s = 1 is minus the multiplicity of the trivial representation in ρ. The Artin conjecture is the proposition that ArtinHolomorphy ρ holds for every such ρ. Both are used only as hypotheses.

Define the predicate on the unique Brauer meromorphic continuation, including inertia-invariant ramified factors. Uniqueness removes expression dependence. Finite Euler deletion multiplies by entire factors, so complete holomorphy implies incomplete holomorphy; the converse fails.

- `ArtinHolomorphy`: The proposition defined above.
- `ArtinConjecture`: ArtinHolomorphy ρ for all L/K and all ρ.
- `ArtinHolomorphy.add`: ArtinHolomorphy ρ₁ and ArtinHolomorphy ρ₂ imply ArtinHolomorphy (ρ₁ ⊕ ρ₂), since the Euler series multiply and the multiplicities of the trivial representation add.
- `ArtinHolomorphy.of_dim_one`: A one-dimensional ρ satisfies ArtinHolomorphy, because its Euler series is a Hecke L-function (class field theory) with continuation from AL.1.
- `ArtinHolomorphy.induced`: ArtinHolomorphy is invariant under induction: L_K(s, Ind_{L/M}^{L/K} σ) = L_M(s,σ), so ρ induced from a one-dimensional character satisfies it.

**Checks.**

- For the trivial representation of Gal(L/K), the Euler series is ζ_K, which has a simple pole at 1, matching multiplicity one; ArtinHolomorphy holds.
- For the regular representation, L_K(s,ρ) = ζ_L(s), with a simple pole at 1, and the trivial representation occurs once.
- Brauer meromorphy alone does not give ArtinHolomorphy: a virtual combination with negative coefficients may have poles, so the predicate is not a consequence of the continuation target.
- For the incomplete series with a ramified factor deleted, holomorphy away from 1 does not imply holomorphy of the complete series, whose extra local factor can have poles on Re s = 0.

No unconditional target of this roadmap uses the predicate; it records the requirement that general continuation statements stay visible hypotheses.

See [53][R53], §22.2–22.3, Conjecture 22.2, p. 128.

*Needs:* [§2.19][R207]; [§2.29][R220].

<a id="s2-43"></a>

### 2.43 Extended Riemann hypothesis for Dedekind and Hecke L-functions

For a number field K, DedekindERH K is the proposition: every zero s of the continued Dedekind zeta function ζ_K (the Tate continuation identified with NumberField.dedekindZeta on Re s > 1 by this layer) with 0 < Re s < 1 has Re s = 1/2. For a primitive finite-order Hecke character χ of K, HeckeGRH χ is the same proposition for the continued L(s,χ). Both are hypotheses only; they extend the Layer 1 register from Dirichlet characters to number fields.

Definition on the continued functions of this layer. The strip condition removes the trivial zeros (Re s ≤ 0) and the pole at 1; zeros with Re s ≥ 1 are excluded by line-one nonvanishing.

- `DedekindERH`: The proposition defined above.
- `HeckeGRH`: The proposition for one primitive Hecke character.
- `dedekindERH_rat_iff`: DedekindERH ℚ is equivalent to RiemannHypothesis, since ζ_ℚ = ζ.
- `DedekindERH.of_abelian`: For K/ℚ abelian, ζ_K is the product of the Dirichlet L-functions of the primitive characters of its conductor, so GRH for those characters implies DedekindERH K.
- `HeckeGRH.trivial`: HeckeGRH of the trivial character of K is DedekindERH K.

**Checks.**

- DedekindERH ℚ ↔ RiemannHypothesis.
- For K = ℚ(i), ζ_K = ζ · L(·,χ₋₄), so DedekindERH ℚ(i) is equivalent to RiemannHypothesis together with DirichletGRH χ₋₄.
- For a real quadratic K, ζ_K vanishes at s = 0 to order 1 (r₁ + r₂ − 1 = 1); this zero is outside the strip and does not contradict the predicate.

No unconditional target uses it; effective Chebotarev bounds under ERH are not claimed here.

See [53][R53], §10.3, Remark 10.5, p. 61.

*Needs:* [§1.6](#s1-6); [§2.5][R190]; [§2.12][R197]; [§2.21][R213].

<a id="s2-44"></a>

### 2.44 Explicit exceptional-zero region for an abelian character product

Consume per-character zero-free regions and simplicity from [6.2–6.4][R16]. The additional target is simultaneous uniqueness over all characters of an abelian extension, with the numerical constant 0.0875. Per-character uniqueness alone cannot give uniqueness for the product. The trivial-extension case below is a check of this product theorem.

(i) Let L/K be an abelian extension of number fields, Q = Q(L/K) the maximum of the norms of the conductors of the Hecke characters χ of K attached to L/K, n_K = [K:ℚ] and D_K = |disc(K/ℚ)|. If D_K Q n_K^{n_K} is sufficiently large, the product Π_χ L(s,χ,K) of these continued Hecke L-functions has at most one zero, counted with multiplicity, in σ ≥ 1 − 0.0875/log(D_K Q n_K^{n_K}), |t| ≤ 1 (s = σ + it); if it exists it is a simple real zero and its character is real. (ii) In particular, if D_K n_K^{n_K} is sufficiently large, ζ_K has at most one zero in σ ≥ 1 − 0.0875/log(D_K n_K^{n_K}), |t| ≤ 1, and such a zero is real. The possible zero is the exceptional zero β₁ of the effective Chebotarev theorem.

Assume L/K abelian; “sufficiently large” is an absolute threshold.; The L-functions are the continuations identified with the ideal series in this layer.

Apply Zaman Theorem4.1.1 to the congruence-character product of orders≥r. Its positivity/trigonometric-polynomial proof uses each completed Hadamard product and explicit Gamma bounds; for r=1 retain c₀=.0875 and denominator logD_K+(3/4)logQ+n_Kν(n_K), |t|≤T⋆. CFT identifies the L/K character family. The trivial extension givesζ_K and Q=1 for(ii).

K = ℚ, L = ℚ(ζ_q): (i) is the classical statement that Π_{χ mod q} L(s,χ) has at most one zero near 1, a simple real zero of a real character (compare the conductor-uniform Dirichlet region of Layer 0). The region contains at most one zero; it is not claimed zero-free, so no unconditional statement may drop β₁.

See [67][R67], §1.3.2, Theorem 1.3.5 and Corollary 1.3.6, p. 16; §4.1, Theorem 4.1.1, p. 69.

*Needs:* `B3`; [§2.12][R197]; [§2.30](#s2-30); [§2.21][R213]; [ZerosOfLFunctions 5.4–5.6][R15].

<a id="s2-45"></a>

### 2.45 Logarithmic functional equation

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. Write Γ_R(s)=π^(−s/2)Γ(s/2), d=dimρ and Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^d L(s,ρ). Import Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s), |w_ρ|=1. Odd parity makes the gamma factors finite and nonzero at0 and1; boundary nonvanishing and the equation make L_ρ(0), L_(ρ̄)(1) finite and nonzero. Then L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d((Γ_R′/Γ_R)(1)+(Γ_R′/Γ_R)(2)). A general even factor would instead require a regularized derivative at0.

Assume Same CM normal-closure/odd-irreducible family as the conductor bound.; Continuation agrees with the genuine all-prime Artin Euler series on Re s>1. Nonzero endpoint germs and conjugation are part of the contract.

Integral Brauer and finite-order Hecke equations give the completed Artin identity with its arithmetic conductor and odd infinity type. Verify nonzero analytic endpoints, then differentiate. The Lean calculus adapter keeps the arithmetic conductor identification separate.

See [64][R64], Proof of Corollary 3.3, p. 384; [64][R64], Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* `B3`; [§2.6][R222]; [§2.32](#s2-32); [§2.19][R207]; [§2.3][R188]; [§2.11][R195]; [ArithmeticDirichletSeries 1][R4]; [ArithmeticDirichletSeries 3][R2]; [ClassFieldTheory 7][R29]; `Complex.Gammaℝ`; [§2.29a][R208]; [§2.29c][R210]; [§2.29d][R211]; [§2.32e][R186]; [§2.32g][R221].

<a id="s2-46"></a>

### 2.46 Factorwise logarithmic derivative at one

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there exists C_(g,ε)>0 with |L′(1,ρ)/L(1,ρ)|≤C_(g,ε)D_E^ε. Use the exact identity L′(1,ρ)/L(1,ρ)=Σ_j n_j H_j′(1)/H_j(1) and fixed-degree subpower bounds for these regularized Hecke logarithmic derivatives. The [§2.32g][R221] supplies these bounds: Cauchy controls H′, and a separate cyclic product/residue argument controls 1/H(1).

Assume Same finite family and continuation normalization.; Hecke logarithmic-derivative bounds must be uniform in the stated analytic-conductor range; poles have been removed and their total order cancels. Constants may be ineffective.

Differentiate the regularized Brauer product at1. The nonzero-factor condition permits division and removes all principal parts by Σ n_jδ_j=0. Sum the individual Hecke logarithmic-derivative estimates using Σ|n_j|≤B_g, choosing the exponent to absorb the conductor comparison. This route supplies the ratio itself; general Artin holomorphy in a fixed-radius disc is not assumed.

See [64][R64], Proof of Corollary 3.3, p. 384; [10], (5.2); [64][R64], Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* `B1`; [§2.34][R231]; [RepresentationTheory/InductionRestriction 6][R30]; [§2.32e][R186]; [§2.32g][R221].

<a id="s2-47"></a>

### 2.47 Uniform subpolynomial Dedekind residues

For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

Use bounded-degree Brauer–Siegel and the explicit positive residue formula. Uniformly bound roots of unity by degree and absorb the finite small-discriminant range.

See [64][R64], Tsimerman §§2–3, pp.380–384, uses the Brauer–Siegel input; the [§2.32f][R164] above supplies the uniform result without normality.

*Needs:* [§2.33](#s2-33); [§2.5][R190]; [§2.32f][R164].

<a id="s2-48"></a>

### 2.48 Eisenstein Weyl sums bounded by Dirichlet L-values

There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd ≠ 1 with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.

Assume d,d′ are coprime fundamental discriminants with fundamental product D≠1, and s=1/2+it for t∈ℝ.; Weyl is the three-branch class sum of DIT (5.12): twice the core-area integral for negative factors, the boundary arc-length integral over ∂F_A for positive factors (compared separately to C_A), and the CM point sum weighted by 1/ω_D for mixed signs. All branches retain the genus character and multiplicities.; The implied constant depends only on ε; the height exponent C is absolute.

Apply the appropriate one of the three genus-period identities. Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and |D|^(1/4+ε) remain visible.

The field discriminant excludes D=1; this does not exclude a factor discriminant equal to1 in a genus decomposition.

See [60][R60], (6.7), proof of Proposition 2, p.969.

*Needs:* `B2`; [§2.36](#s2-36); [§2.37](#s2-37); [§2.38](#s2-38); [Critical-line gamma quotient][R12]; [§1.1](#s1-1).

<a id="s2-49"></a>

### 2.49 Many split primes outside a small quadratic exception set

For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.

Assume k is a number field of fixed degree n, D_k its absolute discriminant; quadratic F/k have relative discriminant norm≤X; ε₁>0 and X≥2.; Take one positive degree-dependent c from the density theorem and σ₁=max(1−ε₁/(4c),1/2). E is fixed before Y ranges over4≤Y≤X, and a single constant C_{n,ε₁} works for all eligible k,F,X,Y. All prime-ideal counts include the norm endpoint.

Select exceptional quadratic fields through the canonical primitive ray characters' zeros σ₁<Reρ<1, |Imρ|≤√X. Density at Q=X,T=√X, with exponent small relative toε₁ and degree-bounded infinity types, gives #E≪_(n,ε₁)D_k^ε₁X^ε₁. Outside E, (1+χ(𝔭))/2 selects unramified split primes. Apply smoothed ideal Perron with weight1−N𝔞/Y and kernelY^s/[s(s+1)]. Shift at safe heights, retaining all zeros and double-pole residues at0,−1; LOW Lemma4.1 supplies the unit-height count/local logarithmic derivative, not integrability on every vertical line. At T=√X, high/low zeros cost O_n(Ylog(XD_kT)/T) and O_(n,ε₁)(Y^σ₁log(XD_kT)), using Y≤X. Supply the Iwaniec–Kowalski estimates, safe heights and residue calculations. Quantitatively discard ramification/higher powers and partially sum off logN𝔭, giving1/8 with one uniform error constant beyond qualitative PNT transfer.

The same set E and one degree/ε₁-dependent constant work simultaneously for every4≤Y≤X; allowing Y-dependent constants would make the target empty. When X<4 there are no eligible Y, but the exceptional-set cardinality assertion is still required. The source weights all prime powers before transferring to split unramified primes; its1/8 main factor cannot be replaced by1/2 without a separate argument.

See [66][R66], Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19; [66][R66], §4, Lemma4.3 and full proof, printed pp.20–22.

*Needs:* [§2.39](#s2-39); [§2.7][R192]; [§2.12][R197]; [ArithmeticDirichletSeries 4][R8]; [ArithmeticDirichletSeries 6][R1]; [ArithmeticDirichletSeries 5][R7]; [§2.21][R213].

<a id="s2-50"></a>

### 2.50 Effective Chebotarev density theorem

Let L/F be a finite Galois extension, G its group, n=[L:ℚ]>1, D=|Disc L| and C one conjugacy class. Count unramified prime ideals of F with norm≤x and arithmetic Frobenius in C by π_C(x). There is at most one ζ_L zero in Re s≥1−1/(4 log D), |Im s|≤1/(4 log D); if present it is a simple real β₀. For x≥exp(10n(log D)²), prove |π_C(x)−(|C|/|G|)Li(x)|≤(|C|/|G|)Li(x^β₀)+C₁x exp(−C₂ sqrt(log x/n)), omitting the Li term when there is no exceptional zero; C₁,C₂>0 are effective absolute constants. A bound with this Li term absorbed requires a separate zero-separation estimate and an enlarged range; no field-uniform absorption at the displayed threshold is asserted. Under DedekindERH L the error is O(x^(1/2)log(Dx^n)) for x≫(log D)². Some unramified degree-one prime in C has norm≪D^B with effective absolute B>0; under DedekindERH it has norm≪(log D)². The degree-one field L=F=ℚ is covered separately by the rational prime estimates, with the conditional least-prime bound written using max(1,log D)².

Assume L/F finite Galois; C a conjugacy class of Gal(L/F).; (ii) and the conditional part of (iii) assume DedekindERH L.; Ineffective and effective constants are distinguished in (i).

For g∈C, H=⟨g⟩ and E=L^H, use Chebotarev8,11–12's cyclic fixed-field fibre count and contraction/ramified/higher-degree errors. The remaining degree-one count is the abelian L/E problem at g. Express it as a Hecke-character average of−L′/L, apply ADS6 truncated Perron and shift. Useζ_L=∏χLχ, N(T)≪Tlog(D_LT^n_L) and this layer's region, retaining β₁; optimize T for(i), or insert Reρ=1/2 for(ii). For(iii) additionally prove near-one density and Lagarias–Montgomery–Odlyzko power-sum repulsion. Absorb Li(x^β₀) only after a quantitative gap enlarges the x-range. Separate D=1 before dividing by logD.

F = ℚ, L = ℚ(ζ_q): (i) is a prime number theorem in progressions with error x exp(−c (log x/φ(q))^{1/2}) for x ≥ exp(10 φ(q) (log D_L)²), much weaker in q than Siegel–Walfisz, as Zaman notes after (1.18). Dropping the error terms recovers Tau Ceti’s tendsto_frobeniusPrimeCount; no qualitative statement is restated. The exceptional zero is named, never assumed absent.

See [67][R67], §1.2, equations (1.18), (1.20), (1.21), pp. 7–8; [78][R78], §1.1, Theorems A and B, printed p.2 of arXiv:1709.09637; Theorem B (1.3)–(1.4) retains the exceptional-zero term.

*Needs:* `B3`; [§2.44](#s2-44); [§2.43](#s2-43); [§2.21][R213]; [Chebotarev 8][R46]; [Chebotarev 11][R45]; [Chebotarev 13][R43]; [ArithmeticDirichletSeries 6][R1].

<a id="s2-51"></a>

### 2.51 Two-sided quadratic Hecke value bound

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.

Here η is the canonical character obtained through global Artin reciprocity.

Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3. Use D_F≤D_E^(1/2) to keep the total exponent ≤ε.

See [64][R64], Derived residue-quotient adapter for Tsimerman, Corollary 3.3, p.384; positivity and the conductor comparison are separate inputs.

*Needs:* `B4`; [§2.47](#s2-47); [ClassFieldTheory 13][R28]; [§2.32g][R221].

<a id="s2-52"></a>

### 2.52 Subpolynomial logarithmic derivative at one

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.

Here η is the canonical character obtained through global Artin reciprocity.

Apply the derivative estimate with ε/2. Multiply by the reciprocal positive-value estimate with ε/2.

See [64][R64], Derived quotient adapter for Tsimerman, Corollary 3.3, p.384; use both the derivative bound and the separately proved positive value lower bound.

*Needs:* [§2.35](#s2-35); [§2.51](#s2-51); [GlobalNumberFields 9][R19]; [ClassFieldTheory 11][R27]; [§2.32g][R221].

### Proof-route checks

- **Artin algebra:** inertia-conjugacy transport, finite-order spectrum, coefficient-convolution convergence, ramified relative Frobenius and Mackey cyclic-block determinants remain local. Integral induced-linear Brauer reduction is already supplied ([RepresentationTheory][R128]). Consumers: [§2.11][R195], [§2.19][R207], [§2.32](#s2-32), [§2.40](#s2-40), [§2.46](#s2-46), [§2.45][R244], [§2.34][R231], [§2.29][R220].
- **Fixed degree:** [§2.32e][R186], [§2.32f][R164], [§2.32g][R221] give residues, Brauer–Siegel and CM value/reciprocal/derivative estimates. The lower endpoint uses κ_N/κ_K, not Cauchy. §3.3–3.4 supplies divisor domination. In a quadratic CM extension retain D_F≤√D_E, Q=D_E/D_F, odd parity, positivity, a full Cauchy circle and cancellation of trivial-factor orders. Consumers: [§2.33](#s2-33), [§3.27](#s3-27), [§2.6][R222], [§2.45][R244], [§2.34][R231], [§2.46](#s2-46), [§2.7][R192], [§2.47](#s2-47), [§2.51](#s2-51), [§2.22](#s2-22), [§2.35](#s2-35), [§2.52](#s2-52), [§2.23](#s2-23), [§3.3](#s3-3), [§3.4](#s3-4).
- **Quadratic periods:** complete the prime-discriminant/genus dictionary, half-unit CM weights, full norm-one geodesics and differentiated Eisenstein cusp estimates. Build the Nielsen core and multiplicity-preserving boundary map before the negative-factor period; its critical-line boundary integral differs from the divergent Re s>1 area integral. Retain the Gross–Zagier normalization source boundary. Consumers: [§2.24](#s2-24), [§2.25](#s2-25), [§2.26][R225], [§2.36](#s2-36), [§2.37](#s2-37), [§2.38](#s2-38), [§2.27](#s2-27), [§2.48](#s2-48), [§2.41](#s2-41). For §2.14 first prove the regulator/norm-minus-one dichotomy before narrow/ordinary conversion.
- **Residues / primes:** [§2.16a](#s2-16a) includes Louboutin's imaginary-quadratic exception and log-convexity; convexity independently gives the weaker subpower upper bound in the lower-residue chain. [§2.9a](#s2-9a) retains all four Zaman cases, integer ℓ rounding and35/19 loss with rational numerical certificates. Family Hecke density and the multiplicity-sensitive local logarithmic derivative down to Re s=−3/2 remain source boundaries. Smoothed Perron uses Y^s/[s(s+1)], safe contours, all residues and low/high zeros; discard ramification/higher powers before split-prime counting. Consumers: [§2.16](#s2-16), [§2.39](#s2-39), [§2.49](#s2-49), [§2.9](#s2-9).
- **Genus / completion:** the quadratic generator, squarefree radicand, total complexity, subset/complement classification and prime-to-D Kronecker norm dictionary precede analytic genus products (§2.10). For §2.17, identify the canonical odd character/conductor and compare Dedekind completion by Gamma duplication to force root+1; |root|=1 is insufficient. Specialize regulator, embeddings and unit weights before residue evaluation.
- **Canonical characters:** ray/idele and Tate-continuation identification precedes comparisons; the imported Artin conductor is matched to the analytic normalization. CM reciprocity at real places, relative conductor and canonical entire continuation must be matched. Fixed-field equations alone give no family-uniform convexity. Consumers: [§2.6][R222], [§2.45][R244], [§2.21][R213], [§2.12][R197], [§2.13][R204], [§2.51](#s2-51), [§2.35](#s2-35), [§2.52](#s2-52), [§2.23](#s2-23).
- **Gamma / deleted factors:** compare Tate's trace character, self-dual measure and inverse different to Γ_C. Gamma orders and positivity on Re s>1 give exact negative-even order r₁+r₂. Compare deleted factors in the convergence half-plane and continue as germs ([§2.20](#s2-20), [§2.17](#s2-17), [§2.30](#s2-30)).
- **Finite CM family:** imported integral monomial induction and B_g bound combine with [§2.32e][R186]'s degrees/dimensions/conductors≤D_E^(2M_g), M_g=(2g)!. [§2.32g][R221] regularizes H_j=(s−1)^δ_jL_j and uses Frobenius reciprocity for Σn_jδ_j=0 before values or logarithmic derivatives. The CM owner proves family membership and bounded rational coefficients; no higher CM theorem is an analytic input ([§2.6][R222], [§2.45][R244], [§2.34][R231], [§2.46](#s2-46)).
- **Effective Chebotarev:** prove the abelian Hecke explicit formula, uniform Dedekind zero count and Deuring–Heilbronn least-prime repulsion. Retain Li(x^β₀) until quantitative separation permits absorption on its enlarged range. Zaman's weighted route supplies least-prime zero-count/power-sum/repulsion contracts; it does not prove the field-uniform counting estimate's separate explicit-formula contract ([§2.50](#s2-50)).

### Examples

For ℚ(i), the Dedekind residue is π/4, the quadratic character has conductor 4, its root number is 1, and its values are L(1)=π/4 and L(0)=1/2. The corresponding CM unit factor is ω₋₄=2. For ℚ(√−3), ω₋₃=3. In a totally real field the negative-even trivial-zero order is its degree; in an imaginary quadratic field it is one. A trivial Artin representation has local polynomial 1−T and a simple pole at 1; the zero-dimensional representation has local polynomial 1 and L-function 1.

### Dependencies

AutomorphicLFunctionsAndLocalFactors Layers 0–1; GlobalNumberFields Layers 2, 9 and 10; ClassFieldTheory Layers 7, 11 and 13; NumberFieldArithmetic Layers 1, 2 and 7; InductionRestriction Layers 3 and 6; ArithmeticGaloisRepresentations Layer3 (finite conductors), using LocalFieldsRamification Layers3–4; DifferentialGeometry Layers 5 and 12; GeometryOfNumbersAndQuadraticArithmetic Layer 3; AutomorphicSpectralTheory Layers 1–2. Analytic inputs are the Gamma and explicit-formula targets of Layer 1 and the zero-free estimates of Layer 0.

<a id="layer-3"></a>

## Layer 3: Multiplicative means, smooth numbers and moments

Separate arithmetic coefficient bounds from mean-value theorems. The logarithmic-derivative coefficient class is not the class of all bounded multiplicative functions. The smooth-number and Beurling theories use actual indexed counting functions. Proven second and fourth moments are distinct from the general moment conjecture and its model constants.

<a id="s3-1"></a>

### 3.1 Explicit divisor subpower bound

For ε>0 and any natural B≥exp(1/ε), all positive integers n satisfy τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε. Thus the displayed constant is at least 1 and independent of n.

Set D=max(1,(ε log 2)⁻¹). Apply the local uniform bound to each prime p≤B. For p>B, the assumed cutoff implies exp(1/ε)≤p; apply the large-prime bound. Apply divisor-bound-from-local-bounds. A certified upper integer B is a permitted input: no exact ceiling evaluation is required.

n=1 is covered. B may be increased without invalidating the estimate. The constant depends only on ε and the chosen certified B, never on n.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* `Real.log_pos`; `Real.log_le_log`; `Real.add_one_le_exp`; `Real.rpow_def_of_pos`; `Real.le_log_iff_exp_le`; `Nat.card_divisors`; `Nat.prod_primeFactors_pow_factorization`; `Nat.prime_of_mem_primeFactors`; `Finset.prod_le_prod`; `Real.mul_rpow`; `Real.rpow_mul`; `Real.rpow_natCast`; [§3.1a](#s3-1a); [§3.1b](#s3-1b); [§3.1c](#s3-1c).

<a id="s3-1a"></a>

**§3.1a Uniform prime-power divisor bound.** For ε>0, integers p≥2 and a≥0, put D=max(1,(ε log 2)⁻¹). Then a+1≤D p^(aε). D is notation for a real expression, not a new carrier.

Here ε>0; p,a natural; p≥2.

Logarithm monotonicity gives log p≥log 2>0. Thus D≥1 and D ε log p≥1. Multiply the latter inequality by a≥0 and add 1≤D to obtain a+1≤D(1+aε log p). Use 1+t≤exp t and p^(aε)=exp(aε log p).


<a id="s3-1b"></a>

**§3.1b Large-prime divisor factor bound.** For ε>0, positive integer p and a≥0, exp(1/ε)≤p implies a+1≤p^(aε).

Here ε>0; p>0; a natural; exp(1/ε)≤p.

Apply the exponential/logarithm equivalence to get ε log p≥1. Multiply by a, add 1 and apply 1+t≤exp t; identify the real power.


<a id="s3-1c"></a>

**§3.1c Divisor bounds from local factors.** Let ε∈ℝ, D≥1 and B∈ℕ. Suppose for every prime p and a∈ℕ that a+1≤D p^(aε) if p≤B, and a+1≤p^(aε) if p>B. For every n>0, τ(n)≤D^B n^ε, with τ(n)=card(n.divisors).

Here D≥1; B natural; two uniform prime-power hypotheses; n>0.

Use Nat.card_divisors to write τ(n)=∏p|n(a_p+1); use Nat.prod_primeFactors_pow_factorization to write n=∏p|n p^a_p. Split the finite prime-factor set at p≤B. Multiply the respective nonnegative local bounds using Finset.prod_le_prod. Repeated Real.mul_rpow and Real.rpow_mul identify the prime-power product with n^ε. At most B small prime divisors occur, since they inject into {1,…,B}. Hence τ(n)≤D^r n^ε with r≤B; D≥1 gives D^r≤D^B.


<a id="s3-2"></a>

### 3.2 Largest prime factor of a quadratic conductor

If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities. Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included.

See [47][R47], Lemma 7.3, p. 375.

*Needs:* `DirichletCharacter.conductor`; [§0.3](#s0-3); `Chebyshev.theta`.

<a id="s3-3"></a>

### 3.3 Uniform coefficient bound by a divisor function

For a degree-n number field K, n>=1, let a_K(m) count nonzero integral ideals of norm m. For every m>=1, a_K(m)<=d_n(m), where d_n counts ordered n-tuples of positive integers with product m. At each rational prime the Euler factor product over p-adic prime ideals (1-T^f_i)^(-1) is coefficientwise bounded by (1-T)^(-n), since f_i>=1 and the number of factors is <=n; multiply over primes.

For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n. Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons.

See [64][R64], Elementary Euler-factor adapter for Tsimerman §2.2, pp.380–381; count split prime-power exponents and compare with d_n.

*Needs:* `Ideal.absNorm`; `Nat.factorization`.

<a id="s3-4"></a>

### 3.4 Subpolynomial fixed-order divisor function

For each integer n>=1 and epsilon>0 there is C_(n,epsilon) with d_n(m)<=C_(n,epsilon)*m^epsilon for every m>=1. Use d_n(p^a)=binomial(a+n-1,n-1). For large p this is <=n^a<=p^(epsilon*a); for the finitely many smaller primes the supremum of the polynomial in a divided by p^(epsilon*a) is finite. The product of those finitely many constants is independent of m.

Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0. Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded. Multiply the finitely many small-prime constants, independently of m.

See [64][R64], Elementary fixed-degree adapter for Tsimerman §2.2, pp.380–381, using the small/large-prime split of the divisor bound.

*Needs:* `Nat.factorization`.

<a id="s3-5"></a>

### 3.5 Products of distinct medium primes

For x≥2 and m≥0, N_m(x) is the finite set of natural products over m-element subsets of {p prime:x/2≤p≤x}. N_0(x)={1}; subsets are unordered and primes are distinct.

Form the finite prime set P_x={p∈ℕ: p prime, x/2≤p≤x} using the inclusive floor cutoff, and take the image of its m-element subsets under their natural product. Use Nat.primeFactors_prod to recover a subset from its product, hence prove injection. Library finite-image and powersetCard cardinality theorems supply the card API; no second factorization theory is needed. The product over an empty subset is 1. The support and squarefree APIs follow from the same finite prime product and its recovered factor set.

- `medium_prime_products.membership`: n∈N_m(x) iff n is a product of an m-element subset of primes in [x/2,x].
- `medium_prime_products.card`: Unique factorization gives #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).
- `medium_prime_products.squarefree`: Every element is squarefree with exactly m prime factors.
- `medium_prime_products.support`: Every prime factor lies in the closed interval [x/2,x].
- `medium_prime_products.zero`: For every x≥2, N_0(x)={1}.
- `medium_prime_products.size_bounds`: For x≥2, m≥0 and n∈N_m(x), (x/2)^m≤n≤x^m, with the natural n cast to the reals.

**Checks.**

- N_0(10)={1}.
- N_1(10)={5,7}.
- N_2(10)={35} and N_3(10)=∅.
- 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity.
- N_1(4)={2,3}; the prime 2 at the lower endpoint is included.

N_0(10)={1}. N_1(10)={5,7}. N_1(4)={2,3}; an open lower cutoff would omit 2 and fails this test.

See [50][R50], §3.6, definition immediately preceding (3.4), p.26.

*Needs:* `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`.

<a id="s3-6"></a>

### 3.6 Inverse-totient counting input

For real x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x), with an absolute constant.

Use the original inverse-totient counting theorem, with positive integers and φ(d)≤x. No implication is made from a pointwise lower bound on φ alone.

See [80][R80], Introduction pp.143–145; stated effective theorem p.145.

*Needs:* `Nat.totient`.

<a id="s3-7"></a>

### 3.7 Maximal-order divisor upper bound

For every real ε>0 there is a natural K>e such that for every natural n≥K, τ(n)≤exp((log 2+ε)log n/log log n). This is the upper bound; no matching lower-order limit is asserted here.

Choose δ=ε/(4 log 2+2ε). Then 0<δ<1 and (log 2)/(1−δ)≤log 2+ε/2. Put L=log n and y=L^(1−δ). Increase the natural threshold until L≥e, y≥2 and the small-prime loss lemma holds with η=ε/2. By Nat.card_divisors and Real.log_prod, log τ(n)=Σ_{p|n}log(v_p(n)+1). Partition the finite set at y. The small-prime logarithm is at most (ε/2)L/log L by the first and third lemmas. The large-prime logarithm is at most (log 2)L/((1−δ)log L) by the second lemma and Real.log_rpow. Add the inequalities and exponentiate to obtain the exact stated ε bound. The independently planned uniform subpower theorem is not used in this proof.

See [49][R49], Exercise2.9(b),(e),(f), printed pp.33–34, k=2; [50][R50], arXiv v3, proof of Lemma 3.1, p. 18, citing [18, §18.1, Theorem 317] (Hardy–Wright, sixth edition); subpower use in the proof of Lemma 12.3, p. 60.

*Needs:* `Nat.prime_of_mem_primeFactors`; `Nat.prod_primeFactors_pow_factorization`; `Real.log_pow`; `Real.log_le_log`; `Real.log_prod`; `isLittleO_log_rpow_rpow_atTop`; `Real.log_rpow`; `Nat.card_divisors`; `exists_nat_ge`; [§3.7a](#s3-7a); [§3.7b](#s3-7b); [§3.7c](#s3-7c).

<a id="s3-7a"></a>

**§3.7a Small-prime divisor logarithm.** For a natural n≥2 and real y≥2, Σ_{p∈primeFactors(n), p≤y} log(v_p(n)+1) ≤ y log(1+log n/log 2).

Here The ranges and positivity assumptions are explicit in the statement.

For each p dividing n, p≥2 and p^v_p(n) divides n. Monotonicity of log and log_pow give v_p(n)≤log n/log 2. Bound each nonnegative summand by log(1+log n/log 2). There are at most floor y distinct positive integers ≤y; cast this cardinality bound to R and multiply.

See [49][R49], Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="s3-7b"></a>

**§3.7b Large-prime divisor logarithm.** For a natural n≥2 and real y>1, Σ_{p∈primeFactors(n), y<p} log(v_p(n)+1) ≤ (log 2)log n/log y.

Here The ranges and positivity assumptions are explicit in the statement.

Induction on a gives a+1≤2^a, hence log(a+1)≤a log 2. The factorization identity and log_prod/log_pow give Σ_{p|n}v_p(n)log p=log n. All terms are nonnegative. On the large-prime part, log y Σ v_p(n)≤log n; divide by the positive log y and multiply by log 2.


<a id="s3-7c"></a>

**§3.7c Vanishing small-prime contribution.** For real 0<δ<1 and η>0 there is L₀≥e such that for every real L≥L₀, L^(1−δ)log(1+L/log 2) ≤ η L/log L.

Here The ranges and positivity assumptions are explicit in the statement.

For large L, log(1+L/log 2)≤C log L for an absolute C, by monotonicity and splitting off a fixed multiplicative constant. After dividing by the positive L/log L, the ratio is at most C(log L)^2/L^δ. The isLittleO_log_rpow_rpow_atTop with r=2 and s=δ makes this eventually at most η. Increase the threshold to e.


<a id="s3-8"></a>

### 3.8 Even von Mangoldt function

Λ_even(n)=ArithmeticFunction.vonMangoldt(|n|) for n∈Z, including Λ_even(0)=0.

- `even_von_mangoldt.nat`: For positive n this is the von Mangoldt value.
- `even_von_mangoldt.neg`: Λ_even(−n)=Λ_even(n).
- `even_von_mangoldt.zero`: Λ_even(0)=0.

**Checks.**

- Λ_even(0)=0.
- Λ_even(−2)=log 2.
- Λ_even(−8)=log 2; Λ_even(−6)=0.

Λ_even(0)=0.

See [58][R58], §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* `ArithmeticFunction.vonMangoldt`.

<a id="s3-9"></a>

### 3.9 Coprime Möbius sums weighted by log t/t

For every A>0, uniformly in positive integers q≤T^4 and real T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A).

Use a coprimality Euler factor and a conductor-uniform Möbius PNT. Prove q≤T^4 uniformity with a sufficiently large logarithmic power before replacing it by A.

See [58][R58], Equation(3.6), proof of Lemma3.11, published p.699.

*Needs:* `ArithmeticFunction.moebius`.

<a id="s3-10"></a>

### 3.10 Gamma Euler-product truncation

For fixed n∈ℕ and real x≥e², define γ_n(p)=1−1/p+(1+1/(p−1))^n/p for each rational prime p. The convergent product over p>log x is 1+O_n(1/log x), uniformly after retaining any subset of those primes. In particular γ_0(p)=1; the equivalent expression p^(n−1)/(p−1)^n uses an integer exponent n−1, never truncated natural subtraction.

For p>log x≥2, use 0<1/(p−1)<1 and the finite binomial expansion to obtain 1≤γ_n(p)≤1+K_n/(p(p−1)); n=0 gives equality 1 directly. For any finite prime subset in this range, 0≤Σlog γ_n(p)≤K_nΣ_{k>log x}1/(k(k−1))≤2K_n/log x. Exponentiation bounds the finite product minus 1 by a constant depending only on n divided by log x. Pass from finite products to the convergent product using the summable nonnegative logarithms. The infinite-product API and local bound are stated in the squarefree-mean note at the end of this layer; the finite bound is uniform in the retained subset.

n=0 gives product 1; n=1 has local factor 1+1/(p(p−1)). For any retained subset, the product is at least 1 and obeys the same upper error bound, with no subset-dependent constant. At x=e² the tail excludes the prime 2; no strict inequality is applied at 1/(2−1)=1.

See [58][R58], Lemma4.5 and full proof, published pp.708–709.

*Needs:* `Nat.Prime`.

<a id="s3-11"></a>

### 3.11 Size of 1/φ(n) and of the divisor function (3.7)

For n≥3, 1/φ(n)≤C log log n/n, with an absolute C>0.

Use Nat.totient_eq_mul_prod_factors, transfer the rational product equality to ℝ, and divide only at n≥3, where φ(n)>0. Thus n/φ(n)=∏_{p|n}(1−1/p)^−1. For sufficiently large n split at y=log n. The small-prime factor is at most the full reciprocal Mertens product through y, hence O(log log n). If r distinct prime divisors exceed y, then y^r≤n, so r≤log n/log y. Since −log(1−1/p)≤2/p for p≥2, their log product is at most 2r/y≤2/log y, hence uniformly bounded. Absorb the finitely many integers 3≤n below the chosen threshold into the positive constant C. No estimate at log log1 or log log2 is used.

See [58][R58], Equation(3.7), published p.699; cited Montgomery–Vaughan Theorem2.9.

*Needs:* [§0.26](#s0-26); `Nat.totient_eq_mul_prod_factors`.

<a id="s3-12"></a>

### 3.12 Coprime Möbius sums weighted by 1/t

For every A>0, uniformly in positive integers q≤T^4 and T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A).

Use the same uniform coprimality Euler factor argument as the logarithmic sum, with one extra partial summation.

See [58][R58], Equation(3.6), proof of Lemma3.11, published p.699.

*Needs:* `ArithmeticFunction.moebius`.

<a id="s3-12a"></a>

**§3.12a Compact-parameter multiplicative transfer.** Fix a compact parameter set Z, an integer k≥1 and a family of coprime-multiplicative functions f_z with |f_z(n)|≤τ_k(n). Suppose α(z) is bounded and, for every A>0, Σ_{p≤x}f_z(p)log p=α(z)x+O_A(x/log^A x), uniformly in z∈Z. Put Q_z(s)=(s−1)^{α(z)}Σ_n f_z(n)n^(−s), with the logarithm real on s>1. For every J≥1,
Σ_{n≤x}f_z(n)=x Σ_{j<J} q_j(z)(log x)^{α(z)−j−1}/Γ(α(z)−j)+O_(Z,k,J)(x(log x)^{Re α(z)−J−1}),
where q_j are the Taylor coefficients of Q_z(s)/s at1, understood through its smooth right-half-plane extension. All constants are fixed before z and x. If f_z is analytic in z on a neighbourhood of a closed disk and has the same uniform bounds there, q_j are analytic on its interior; the remainder is analytic in z for each fixed x. A weaker error O(x/log^B x), for any prescribed B, also suffices for the coefficient application below.

Use Granville–Koukoulopoulos, [Beyond the LSD method][R81], Theorem1 pp.2–3, §2 Lemmas2–3 pp.3–7 and §3 pp.7–10, or Koukoulopoulos, [49][R49], Theorem13.2 pp.134–139 with Q=2. The former §3 already proves the weaker error with arbitrarily many terms when the prime estimate holds for every A. Its constants depend only on the divisor bound, the chosen number of derivatives and the prime-error constants, so the proof is uniform on Z. The proof interfaces are: factor off the square-full Euler remainder, whose series converges normally for Re s>1/2; integrate the prime error to extend Q and its derivatives to Re s≥1; use Cauchy bounds for the differentiated Taylor remainder; smooth the cutoff at relative width1/T with |ψ^(j)|≤C_j T^j; integrate the absolutely convergent Mellin formula repeatedly; estimate |t|≥1 by the prime-error derivative bound and |t|≤1 by the Taylor polynomial; evaluate its terms by the twice-integrated Perron kernel and the complex Gamma–Laplace identity; remove smoothing with the divisor majorant in the short interval; integrate by parts to remove the logarithmic weight. Choose the available prime-error exponent larger than every derivative index used. This is the local transfer adapter, rather than a new generic Dirichlet-series carrier.

For the families here, f_z(p^a) is either bounded by a fixed power of a+1, or is zero for a≥2 and has |f_z(p)|≤R. Taking k≥max(1,R) proves the required divisor domination at every prime power. Uniform convergence of the residual higher-power logarithms follows from Σ_p p^(−2σ)<∞, locally for σ>1/2 after finitely many small primes are separated. No logarithm of a small-prime factor with a zero is required: keep it as a finite analytic factor. Fixed-modulus character nonvanishing determines the remaining branches near s=1.

API: `multiplicative_transfer.uniform_expansion`, `.residual_coefficients`, `.analytic_parameter`, `.positive_residue` (positive real Euler factors), `.strict_cutoff` (one endpoint has weight O(τ_k(floor x)) and is absorbed). Checks: f=1 gives x+O(1); f=μ has α=−1 and every displayed main term vanishes; a squarefree indicator has local factor1+p^(−s), distinct from the unrestricted factor; α=0 is permitted and uses reciprocal Gamma's zero, not division by its totalized value.

*Needs:* [§0.32][R171]; `Complex.Gamma_integral`; the fixed-parameter Gamma–Laplace change of variables in Granville–Koukoulopoulos Lemma3 p.7; [ArithmeticDirichletSeries layer6][R1]; [§3.1](#s3-1).

<a id="s3-12b"></a>

**§3.12b Eisenstein norm criterion.** For a positive integer m, there exist a,b∈Z with m=a²−ab+b² iff every prime p≡2 mod3 has even valuation in m. The criterion includes p=2. This is a local arithmetic adapter for the exceptional-family counts, not the Gaussian criterion or a new general quadratic-field roadmap.

Here is a direct proof route over the complex subring E={a+bω:a,b∈Z}, ω²+ω+1=0, Im ω>0. Its norm is |a+bω|²=a²−ab+b², a nonnegative integer vanishing only at0, and is multiplicative. Round the two real coordinates of any complex quotient to integers: the remainder coordinates u,v satisfy |u|,|v|≤1/2, hence u²−uv+v²≤3/4<1. Division with this remainder makes E Euclidean; consume the existing generic Euclidean-domain/PID/UFD results. For p≡2 mod3, T²+T+1 has no root in F_p: a root other than1 would have order3, while at p=2 it can also be checked directly and p=3 is excluded. Thus E/(p) is a field and p is prime in E. Repeated division by p in a norm factorization shows its rational norm valuation is even. For p≡1 mod3, cyclicity of F_p^× supplies a nontrivial cube root r. The Euclidean gcd of p and r−ω is a proper nonunit divisor of p: reduction at ω=r proves nonunitness; divisibility by p would force p to divide the coefficient−1. Its norm divides p² and is neither1 nor p², so is p. Finally N(1−ω)=3, and N(p)=p² for inert primes. Multiply the factors associated to the rational prime factorization of m. The proof includes both directions and the bad rational prime3.

API: `eisensteinNorm.mul`, `.euclidean_remainder`, `.inert_prime`, `.split_prime_norm`, `.represented_iff_even_inert_valuation`, `.shifted_witness_iff`. Checks: 2 is excluded; 3=2²−2·1+1² is represented; 7=3²−3·1+1² is represented; 4=2² is represented despite its inert prime; m=0 is a separate represented value and is excluded from the valuation iff. This derivation supplies the arithmetic input used in Ghosh–Sarnak, [82][R82], exceptional families p.3 and §4.1 pp.12–13; it does not attribute the Euclidean proof to that application.

*Needs:* `Complex`; `EuclideanDomain`; `Nat.factorization`; finite-field multiplicative-group cyclicity.

<a id="s3-13"></a>

### 3.13 Landau–Ramanujan count of sums of two squares

For K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K with the positive Landau–Ramanujan constant C_L.

Assume K tends to infinity through positive real cutoffs; u,v are integers and represented integers are counted once, not by representation multiplicity.

Convert integer-square witnesses to natural-square witnesses and use the Nat.eq_sq_add_sq_iff; no new arithmetic representation criterion is planned. For the 0/1 indicator b, the Euler factors are (1−p^(−s))^(−1) for p=2 or p≡1 mod4, and (1−p^(−2s))^(−1) for p≡3 mod4. Thus B(s)²=ζ(s)L(s,χ_−4)(1−2^(−s))^(−1)∏_{p≡3 mod4}(1−p^(−2s))^(−1) on Re s>1. Use fixed-modulus Siegel–Walfisz to verify the weighted-prime input (13.1) with κ=1/2; b≤1 satisfies (13.2). Apply the missing Selberg–Delange interface of Theorem13.2 and evaluate c₀/Γ(1/2). The compact-parameter transfer above gives this specialization. At s=1 the residual value is positive; absolute summability of p^(−2) and the positive logarithmic branch give the displayed convergent product.

C_L=(1/√2)∏_{p≡3 mod4}(1−p^(−2))^(−1/2), with a convergent positive product; using L(1,χ_−4)=π/4 and Γ(1/2)=√π. At K=1 the count is1; at K=5 it is4 (1,2,4,5). The count at K=3 is2, so3 is excluded. 9=0²+3² is counted: the forbidden prime3 may occur to an even power. Counting only integers supported on p=2 or p≡1 mod4 would fail this test.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [49][R49], Chapter13, (13.1)–(13.2), Theorem13.2 pp.130–134 and Exercise13.4 p.140; [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* `Nat.eq_sq_add_sq_iff`; [§0.32][R171]; [§3.12a][R163].

<a id="s3-14"></a>

### 3.14 Landau upper bound for shifted Eisenstein norms

For real K≥2, the count of positive integers k≤K with 4(k−1)=u²+3v² for some integers u,v is at most C K/√log K for one absolute C>0; the k=1 norm-zero case is counted once.

Put m=k−1≥0. The equation forces u and v to have the same parity. The integral change a=(u+v)/2, b=v gives m=a²−ab+b², and conversely u=2a−b, v=b. For positive m use the exact Eisenstein-norm criterion: every prime p≡2 mod3 has even valuation, including p=2. Use the separate Eisenstein criterion above. Apply the fixed-modulus multiplicative-mean theorem with κ=1/2, supplied prime distribution, and the positive residual Euler factor. More precisely, the positive-norm count is asymptotic C_E X/√log X, where C_E=(2√3)^(−1/2)∏_{p≡2(3)}(1−p^(−2))^(−1/2). Its squared Euler series is ζ(s)L(s,χ_−3)(1−3^(−s))^(−1)∏_{p≡2(3)}(1−p^(−2s))^(−1); L(1,χ_−3)=π/(3√3) evaluates the constant. The norm-zero case contributes1 and the shift by1 preserves this asymptotic and the stated upper bound.

k=1 and2 are counted (norms0,1). k=3 is excluded because2 has odd valuation at the inert prime2. k=4 is counted (u,v)=(3,1), although k−1=3 is not a sum of two integer squares. k=5 is counted (u,v)=(4,0), exercising the even exponent of2.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* [§0.32][R171]; [§3.12b](#s3-12b); [§3.12a][R163].

<a id="s3-15"></a>

### 3.15 Elementary shifted-square count

#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0), for K≥1.

For K<4 the set is empty. For K≥4, replace each integer square witness by its nonnegative absolute value; k↦u is inverse to the injective map u↦u²+4. For an integer cutoff N≥4, Nat.le_sqrt' identifies the witness interval 0≤u≤Nat.sqrt(N−4); Set.InjOn.ncard_image and Set.ncard_Iic_nat give its exact cardinality Nat.sqrt(N−4)+1. For a real cutoff use N=floor K and the real square-root comparison to get the displayed upper bound. The finite/real floor adapter is routine; the k=4, u=0 point must be retained.

For integer N, the count is0 when N<4 and Nat.sqrt(N−4)+1 when N≥4. At K=3 the count is0; at K=4 it is1; at K=5 it is2; at K=13 it is4 (4,5,8,13). At K=4 the bound is exactly1, so the square-zero case is included.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* `Nat.le_sqrt'`; `Set.InjOn.ncard_image`; `Set.ncard_Iic_nat`.

<a id="s3-16"></a>

### 3.16 Counts supported on half the reduced prime classes

Fix a positive modulus M and R⊆(ZMod M)^× with 2#R=φ(M); primes dividing M are excluded. Let H be the subgroup generated by R. For each fixed a∈H there are C₁,C₂>0 and X₀≥2, depending only on M,R,a, such that for all X≥X₀ the count of positive ν≤X with every prime factor lying in R modulo M and ν≡a mod M lies between C₁ X/√log X and C₂ X/√log X. If a∉H, that count is0. The empty factorization ofν=1 is included only in the identity class.

Assume M,R,a are fixed before X tends to infinity; the exact half-cardinality condition is2#R=φ(M), with no rounded integer division.; All prime factors are tested, including repeated factors and the primes dividing M, which are forbidden; ν≥1.

Use the unrestricted-power0/1 indicator with Euler factors(1−p^−s)⁻¹ at allowed primes, not a squarefree indicator. Orthogonality selectsν≡a modM; fixed-modulus Siegel–Walfisz gives κ_χ=Σ_(r∈R)χ(r)/φ(M). Reκ_χ=1/2 exactly whenχ|H=1. Those twists agree on support and add for a∈H; all others have a strict gap for fixed M,R. Apply compact-parameter transfer to this finite family. Dirichlet nonvanishing and convergent higher powers give the untwisted positive residual: integrate the real prime discrepancy against1/(tlog t), then exponentiate its finite logarithmic constant. There areφ(M)/#H maximal twists, giving the positive coefficient/#H. Supported products lie in H, includingν=1; outside H the count is0.

For M=4, R={1}, H={1}; class3 has count0. Allowing arbitrary reduced classes would give a false positive count. For M=4, R={3}, H={1,3}; both classes have positive asymptotic-sized counts; the identity class includesν=1 and products of an even number of3 mod4 primes. 9 is allowed when M=4,R={3}, whereas3 is forbidden for R={1}; this distinguishes the unrestricted-support and squarefree indicators. The exact half-cardinality condition has no solution for M=1 or2, sinceφ(M)=1; roundingφ(M)/2 would falsely admit the empty prime family.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [82][R82], §8, Proposition8.1 and ensuing density discussion, pp.22–24; [49][R49], Chapter13 (13.1)–(13.2), Theorem13.2 pp.130–134.

*Needs:* [§0.32][R171]; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; [§3.12a][R163].

<a id="s3-17"></a>

### 3.17 Logarithmic weight of prime divisors

For every integer N≥2, Σ_{p|N}(log p)/p≤log log N+C for one absolute real C.

For N≥e² split the distinct primes at X=log N≥2. Apply Mertens’s first theorem to p<X; primes at the endpoint belong to the large-prime group. Nat.prod_primeFactors_dvd gives a positive squarefree kernel at mostN. Apply Real.log_prod and Real.log_le_log to get Σ_{p|N}log p≤log N; no divisor-product equality withN is assumed. For p≥X use1/p≤1/X, so that Σ_{p|N,p≥X}log p/p≤1. Combine the groups; for2≤N<e² absorb the finite many values intoC, retaining possible negative log logN.

N=2 is included even though log log2<0; the constant must absorb that value. For N=2^a witha≥1, the left side islog2/2, independent ofa; primes must be counted distinctly. A prime at p=log N is assigned to the large-prime group by the half-open split, so no endpoint is lost.

See [83][R83], Proof of Proposition 5.2, p.27.

*Needs:* [§0.11](#s0-11); `Nat.prod_primeFactors_dvd`; `Real.log_prod`; `Real.log_le_log`.

<a id="s3-18"></a>

### 3.18 Pretentious distance

For complex-valued f,g on positive integers and x≥1, D(f,g;x)=sqrt(Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p), used under |f(p)|,|g(p)|≤1. This is a distance on prime data, not a metric on all multiplicative functions: D(f,f;x) can be positive if |f(p)|<1. The representative prime-data distance is `pretentiousDist`, with multiplicative triangle inequality `pretentiousDist_mul_le` for disk-valued functions.

Take the finite prime set p≤floor x and the real square root of the displayed sum. Under unit-disc prime values each summand is nonnegative. All evaluation, symmetry, prime-data and cutoff API statements follow from finite sums and the real square-root laws; use the separately promoted square-nonnegative lemma when it is a prerequisite.

- `pretentious_distance.square`: D² is the displayed nonnegative finite prime sum under the unit-disc hypotheses.
- `pretentious_distance.symmetric`: D(f,g;x)=D(g,f;x).
- `pretentious_distance.cutoff`: For 1≤x≤y the squared distance is nondecreasing.
- `pretentious_distance.unit_diagonal`: If |f(p)|=1 for p≤x, then D(f,f;x)=0.
- `pretentious_distance.prime_data`: Equal values on all primes≤x give equal distances.
- `pretentious_distance.triangle`: If |f_j(p)|, |g_j(p)| ≤ 1 at every prime, then D(f₁f₂, g₁g₂; x) ≤ D(f₁, g₁; x) + D(f₂, g₂; x) (proof ingredient pretentious-product-triangle, from the unit-disc inequality √(1 − Re(zw)) ≤ √(1 − Re z) + √(1 − Re w)).

**Checks.**

- D(1,1;x)=0.
- D(1,−1;x)²=2Σ_{p≤x}1/p.
- D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom.
- D(f,g;1)=0.

D(1,1;x)=0. D(f,g;1)=0.

See [84][R84], pp.2–4: M(x,T) on p.2 and weighted unit-disc product norm on pp.3–4.

*Needs:* `Nat.Prime`; `Real.sqrt`; [§3.18a](#s3-18a); [§3.18b](#s3-18b); [§3.18c](#s3-18c).

<a id="s3-18a"></a>

**§3.18a Triangle inequality for pretentious products.** For |f_j(p)|,|g_j(p)|≤1, D(f₁f₂,g₁g₂;x)≤D(f₁,g₁;x)+D(f₂,g₂;x). If all g_j have unit modulus on the primes, this gives the usual triangle inequality for prime data.

Apply unit-disc-product-distance to z=f₁(p)conj(g₁(p)), w=f₂(p)conj(g₂(p)) for each prime p≤x. Multiply by sqrt(1/p), sum the squares, and apply finite Cauchy–Schwarz to obtain the weighted Euclidean product triangle. For D(f,h)≤D(f,g)+D(g,h), the intermediate g must have |g(p)|=1 so f(p)conj(g(p))g(p)conj(h(p))=f(p)conj(h(p)). Do not impose a zero diagonal on arbitrary unit-disc functions.

See [84][R84], pp.3–4, inequality(5) and the unit-disc weight example.

<a id="s3-18b"></a>

**§3.18b Squared pretentious-distance formula.** Under the prime unit-disc hypotheses, D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [84][R84], Weighted norm discussion pp3–4.

<a id="s3-18c"></a>

**§3.18c Unit-disc product distance inequality.** For complex z,w with |z|,|w|≤1, sqrt(1−Re(zw))≤sqrt(1−Re z)+sqrt(1−Re w).

Put a=1−Re z and b=1−Re w, so a,b≥0 and (Im z)²≤2a, (Im w)²≤2b by the unit-disc assumptions. Then 1−Re(zw)=a+b−ab+(Im z)(Im w)≤a+b+2sqrt(ab)=(sqrt a+sqrt b)². Both sides are nonnegative, so take square roots. This proves the extension from the unit circle without assuming it.

See [84][R84], p.4 first paragraph, extension of the η product inequality to the closed unit disc.

<a id="s3-19"></a>

### 3.19 Logarithmic-derivative coefficient class

For κ>0, C(κ) is a predicate on the ArithmeticFunction C, with its fixed value f(0)=0 and ordinary coprime multiplicativity f(1)=1. Membership is witnessed by an ArithmeticFunction C coefficient b=Λ_f with |b(n)|≤κΛ(n) for every n, including0,1. For every Re s>1 the three series F(s)=LSeries f s, LSeries b s and H(s)=LSeries (n↦b(n)/log n) s are absolutely convergent, F(s)=exp(H(s)), and −F′(s)/F(s)=LSeries b s. Division at n=0,1 is totalized to0, since b(0)=b(1)=0. This exponential identity fixes the Euler logarithm branch; it is not an arbitrary Prop field or an unrelated logarithm. Coefficient uniqueness follows from the logarithmic derivative and LSeries uniqueness, including the normalized zero coefficient.

Use the existing arithmetic-function carrier and coprime-multiplicative predicate. Require a concrete zero-extended b and the stated inequalities and three summability/analytic identities on the genuine convergence half-plane. Use choice to expose b through the data API; apply LSeries.eq_of_LSeries_eventually_eq to prove witness uniqueness at positive n and zero extension at0. The logarithmic series has coefficients b(n)/log n; no new generic Dirichlet-series theory is planned. Derive nonvanishing from F=exp(H), monotonicity in κ from the coefficient bound, and extensionality from the underlying arithmetic functions. The unit, Möbius, norm-twist and growth rejection tests compare exact coefficients.

- `halasz_coefficient_class.log_coeff`: Given h:f∈C(κ), expose the uniquely determined zero-extended arithmetic function Λ_f together with its summability and logarithmic-derivative identity. Any two membership witnesses choose the same Λ_f.
- `halasz_coefficient_class.majorant`: |Λ_f(n)|≤κΛ(n) for every n, hence they vanish away from prime powers.
- `halasz_coefficient_class.nonzero`: The Euler-compatible exponential identity gives F(s)≠0 on Re s>1.
- `halasz_coefficient_class.mono`: If κ≤κ′, C(κ)⊆C(κ′).
- `halasz_coefficient_class.log_coeff_unique`: If a zero-extended b has an absolutely convergent LSeries on Re s>1 equal there to −F′/F, it equals the exposed Λ_f. The zero coefficient is fixed; LSeries itself ignores it.
- `halasz_coefficient_class.constructor`: Coprime-multiplicative f and a coefficient b with the stated majorant, three summability conditions, exponential identity and logarithmic-derivative identity produce membership in C(κ), for κ>0.

**Checks.**

- The arithmetic function with f(0)=0 and f(n)=1 for n≥1 belongs to C(1), with Λ_f=Λ.
- μ belongs to C(1), with Λ_f=−Λ.
- The arithmetic function with f(0)=0 and f(n)=n^(it) for n≥1 belongs to C(1), with Λ_f(n)=n^(it)Λ(n).
- f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.


See [85][R85], §1 p.1, first three displayed series and definition of C(κ).

*Needs:* `ArithmeticFunction.IsMultiplicative`; `LSeries.eq_of_LSeries_eventually_eq`; `LSeriesSummable`.

<a id="s3-20"></a>

### 3.20 Smooth-number counting function

For x≥1,y≥2, Ψ(x,y)=#{1≤n≤floor x:every prime factor of n is≤y}. Express the set using Nat.smoothNumbers(floor y+1); the carrier uses prime factors strictly below its cutoff. The representative inclusive count is `smoothCount`; `smoothCount_eq` compares it with the library’s strict prime cutoff.

Define Ψ for all real x,y using Nat.smoothNumbersUpTo(floor x)(floor y+1), then restrict analytic statements to x≥1,y≥2. Nonnegative floor converts the strict natural-prime cutoff to p≤y on this domain. Use the membership lemma for positivity and x cutoff; monotonicity follows from floor monotonicity and finite-set inclusion. If y≥x≥2 every positive n≤floor x has all prime divisors≤n≤y. Check the two finite examples and exclusion of0 against the native finite set; the value at x<1 is0 because floor x=0.

- `smooth_count.floor`: Ψ(x,y) counts the positive naturals≤floor x in Nat.smoothNumbers(floor y+1).
- `smooth_count.mono`: Ψ is nondecreasing in each real parameter.
- `smooth_count.large_y`: For y≥x≥2, Ψ(x,y)=floor x.
- `smooth_count.unit`: For x≥1 the integer1 contributes once.

**Checks.**

- Ψ(8,2)=4, counting1,2,4,8.
- Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included.
- 0 is never counted.
- Ψ(0,2)=0.

Ψ(0,2)=0; the real extension has no nonpositive integers.

See [86][R86], Introduction, printed p.411 (terminology); Introduction p.412 and §1 p.414 formula(1.3).

*Needs:* `Nat.smoothNumbers`; `Nat.smoothNumbersUpTo`; `Nat.mem_smoothNumbersUpTo`.

<a id="s3-21"></a>

### 3.21 Dickman function

ρ:R→R is0 for u<0, equals1 for0≤u≤1, is continuous on[0,∞), and satisfies uρ′(u)=−ρ(u−1) on u>1. Construct it recursively on intervals[k,k+1] by integration; the value at0 is1, so no continuity across negative u is claimed.

Setρ=0 below0 andρ=1 on[0,1]; on[k,k+1], k≥1, defineρ(u)=ρ(k)−∫_k^uρ(t−1)/t dt. Continuous integrands and matching endpoints glue; FTC givesρ′(u)=−ρ(u−1)/u for u>1. At1 the one-sided derivatives are0,−1, so differentiability fails. Telescope for the global recursion and induct on unit intervals for uniqueness (the negative convention is needed below0). Check uρ(u)=∫_(u−1)^uρ(v)dv directly for u≤1, then differentiate/match at1 for u>1. First-zero contradiction gives positivity, hence strict decrease above1 and antitonicity on[0,∞), as in Hildebrand–Tenenbaum Lemma2.5.

- `dickman_function.initial`: ρ(u)=1 on[0,1].
- `dickman_function.recursion`: For u≥1, ρ(u)=1−∫_1^u ρ(t−1)/t dt.
- `dickman_function.unique`: These initial values and the delay equation determine ρ uniquely on[0,∞).
- `dickman_function.positive`: ρ(u)>0 for every finite u≥0, and ρ is nonincreasing on[0,∞).
- `dickman_function.negative`: ρ(u)=0 for u<0; no continuity across0 is asserted.
- `dickman_function.continuous`: ContinuousOn ρ[0,∞).
- `dickman_function.delay`: For u>1, HasDerivAt ρ(−ρ(u−1)/u) u; do not claim differentiability at1.
- `dickman_function.interval_identity`: For every real u, uρ(u)=∫_{u−1}^uρ(v)dv, with the fixed negative extension.

**Checks.**

- ρ(0)=ρ(1)=1.
- ρ(2)=1−log2.
- ρ(−1)=0; extending1 to negative u would violate the convention.

ρ(0)=ρ(1)=1. ρ(2)=1−log2. The delay derivative holds at integers≥2, but not at1.

See [86][R86], Introduction, printed p.411 (terminology); p.414 equation(1.5); §2 Lemma2.5 and complete proof p.426.

*Needs:* `intervalIntegral`.

<a id="s3-22"></a>

### 3.22 Dirichlet divisor average

For x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x), with an absolute constant and inclusive real cutoff.

Apply the exact symmetric hyperbola identity with M=floor(sqrt x)≥1. Replace each floor(x/a) by x/a with an error of absolute value<1, for a total O(M). Use H_M=log M+γ+O(1/M). With δ=sqrt x−M∈[0,1), expand 2x log M−M² around M=sqrt x; the discrepancy from x log x−x is O(1), while x/M=O(sqrt x) for x≥2. Combine the errors with an absolute constant. This proof uses no subpower divisor bound.

The exact divisor sums at x=1 and x=4 are1 and8; the asymptotic is asserted on x≥2 with a single absolute constant. A perfect-square endpoint is included once. The error O(sqrt x) requires the harmonic remainder rate, not merely existence of the Euler-constant limit.

See [49][R49], Theorem3.3 and complete hyperbola proof, printed pp.38–39; Theorem1.11 pp.15–16.

*Needs:* `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`; `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`; `Real.log_le_sub_one_of_pos`; [§3.22a](#s3-22a); [§3.22b](#s3-22b).

<a id="s3-22a"></a>

**§3.22a Harmonic sum remainder.** For every integer N≥1, 0<H_N−log N−γ<log(1+1/N)≤1/N, where H_N=Σ_{1≤n≤N}1/n and γ is the Euler–Mascheroni constant.

Unfold the two Euler-sequence inequalities at N>0; subtract to trap H_N−log N−γ between0 and log(N+1)−log N. Use log(N+1)−log N=log(1+1/N) and the positive-real log inequality. No new Euler constant is defined.

See [49][R49], Theorem1.11 and complete proof, printed pp.15–16; Euler-sequence inequalities.

<a id="s3-22b"></a>

**§3.22b Divisor hyperbola identity.** For real x≥1 and M=floor(sqrt x), Σ_{1≤n≤floor x}τ(n)+M²=2Σ_{1≤a≤M}floor(x/a). The equality is exact, including x at a perfect square.

Count positive ordered pairs(a,b) with ab≤x. A pair has a≤M or b≤M because (M+1)²>x. Transpose to equate the two strips; their intersection is precisely1≤a,b≤M, containing M² pairs. Regroup pairs by ab and use the existing divisor carrier.

See [49][R49], Hyperbola discussion, printed pp.37–39, (3.4)–(3.5) and Theorem3.3 proof.

<a id="s3-23"></a>

### 3.23 Second moment of zeta

As T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T), with an absolute constant.

Define `zetaSecondMoment.error` by E(T)=∫_0^T|ζ(1/2+it)|²dt−T log(T/(2π))−(2γ−1)T, using the existing `riemannZeta` and Euler constant. The sufficient quantitative target is `zetaSecondMoment.atkinson_bound`: |E(T)|≤110√T log T for T≥10^30. The proof uses the endpoint divisor remainder, the Voronoi transform and the two saddle families below, followed by Atkinson's finite sums. It requires no smoothed second-moment theorem.

- `zetaSecondMoment.error_zero`: E(0)=0 with the native interval-integral and real-log conventions.
- `zetaSecondMoment.error_continuous`: E is continuous on [0,∞); the factor T log T has its continuous value zero at0.
- `zetaSecondMoment.error_increment`: for 0<S≤T, E(T)−E(S)=∫_S^T|ζ(1/2+it)|²dt−[T log(T/(2π))−S log(S/(2π))]−(2γ−1)(T−S).
- `zetaSecondMoment.mean_square`: the displayed absolute-constant asymptotic follows from `atkinson_bound`, absorbing the compact initial interval.

**Checks.**

- E(0)=0. This tests the endpoint extension, without applying an asymptotic at0.
- If the main term is instead written T log T+cT, its linear coefficient is c=2γ−1−log(2π), not 2γ−1. At T=2π the first logarithmic term is zero.
- On [S,S] the increment identity gives0. On [S,T] and [T,U], its two integral and main-term increments add to the [S,U] increment; reversing an endpoint changes the sign.

See [87][R87], (1) p.1, Theorem2 p.4 and §7 (109) p.35; [88][R88] gives the historical attribution.

*Needs:* [§3.23a](#s3-23a)–[§3.23g](#s3-23g); Layer1 zeta functional equation, Stirling and contour adapters; `riemannZeta`; `Real.eulerMascheroniConstant`; `intervalIntegral`.

<a id="s3-23a"></a>

**§3.23a Endpoint divisor remainder and explicit summation estimates.** Put d(n)=#n.divisors for positive integers. Give the inclusive sum of §3.22 the light name `divisorSummatory`, D(x)=Σ_(1≤n≤x)d(n), and define `divisorError`, Δ(x)=D(x)−x(log x+2γ−1). The real cutoff is inclusive. Define

Δ*(x)=D(x)−(if x is a positive integer m then d(m)/2 else0)−x(log x+2γ−1)−1/4.

Call this function `divisorErrorStar`. The half-weight at an integer is part of the definition. For x>0 it is the average of the left and right limits of D, minus the smooth main term and1/4. At x=0 use the displayed totalized formula, so Δ*(0)=−1/4; no Voronoi identity is asserted there.

- `divisorSummatory.floor`, `divisorSummatory.jump`: D(x)=D(floor x) for x≥0; D=0 on [0,1), and its jump at m≥1 is d(m). The hyperbola identity is §3.22b.
- `divisorRemainder.midpoint`: Δ*(m)=(Δ*(m−)+Δ*(m+))/2 for m≥1; its right minus left jump is d(m).
- `divisorRemainder.off_integer`: Δ*(x)=Δ(x)−1/4 off positive integers; at m≥1, Δ*(m)=Δ(m)−d(m)/2−1/4.
- `divisorRemainder.sqrt_bound`: |Δ(x)|≤√x for x≥1. Strengthen the qualitative hyperbola estimate of §3.22 quantitatively; [BBR], Theorem1.1 p.1025 proves the stronger coefficient0.961.
- `divisorRemainder.cubic_bound`: |Δ(x)|≤0.764 x^(1/3)log x for x≥9995 ([BBR], Theorem1.2 p.1026, inequality(10.2) and Lemma10.7 p.1043). Consequently |Δ*(x)|≤x^(1/3)log(ex) for x≥9995, using one-sided limits and their average at integers. For 1≤x<9995 boundedness follows from the finite hyperbola formula; the analytic continuation argument needs only the eventual bound. All later numerical uses have x≥0.9·10^30.
- `divisorRemainder.weighted_sums`: for Y≥5, Σ_(n≤Y)d(n)/√n≤2√Y log Y; for Y≥2, Σ_(n≤Y)d(n)n^(−3/4)≤4Y^(1/4)log Y; for X≥1, Σ_(n>X)d(n)n^(−5/4)≤X^(−1/4)(4log X+8(γ+2))+(8/3)X^(−3/4). These include exactly the stated endpoints ([87][R87], Lemmas7–9 pp.30–31).
- `divisorRemainder.transition_sum`: define c(u)=1/max(1,|u|), including c(0)=1. For Z≥5,

  Σ_(n≥1)d(n)n^(−3/4)c(2√n−2√Z) ≤ Z^(−1/4)(1.445log²Z+15.35log Z+50.276)+2.71Z^(−3/4).

  The series here is absolutely convergent. Split it at Z/2, Z−√Z, Z+√Z,2Z. Abel summation gives the two gap sums bounded respectively by (1/2)log²Z−(log2−γ)log Z+2.365 and (1/2)log²Z+γlog Z+3.721 for Z>4; the central band is bounded by Z^(−1/4)(2^(7/4)log Z+12.21). The weighted-sum bounds handle the two tails ([87][R87], Lemma6 pp.29–30, (96)–(98) pp.30–31 and pp.33–34). The cap prevents any singularity when Z is an integer.

The explicit cubic estimate is new work, not a consequence of the O(√x) estimate. Its proof uses finite hyperbola arithmetic and the elementary triangular subdivision estimate of [BBR], Lemma5.1 p.1031. For a positive integer D₀ the latter uses the finite coefficient Σ_(uv=n,gcd(u,v,D₀)=1)1. Möbius inversion expresses its summatory error as Σ_(δ|D₀)μ(δ)Δ(t/δ²), so there is no new divisor carrier. Abel summation (4.1), (4.6)–(4.7) pp.1029–1030 reduces the weighted sums in that estimate to this error and its integrals with weights t^(−3/2), t^(−7/4). Prove the integrated-error estimates in [BBR], §§8–10 pp.1037–1043 by Mellin continuation of ζ(s)², the hyperbola remainder and finite interval certificates; use D₀=1 for the first bound, then D₀=6 for (10.2). Every finite certificate uses the exact integer hyperbola sum and rational enclosures of log and γ, checking both one-sided endpoints and enclosing the smooth terms throughout each subdivided unit interval; a floating-point scan is not a proof. This is the proof of the two named explicit remainder targets, rather than an extra imported divisor estimate.

The cap API is `endpointCap.nonneg`, `endpointCap.le_one`, `endpointCap.even`, and `endpointCap.eq_inv_abs` for |u|≥1; it is continuous everywhere. Real reciprocal totalization must not replace its value at zero.

**Checks of the divisor remainders.**

- At x=0, D=Δ=0 and Δ*=−1/4; the positive-argument transform is inapplicable.
- At x=1, D=1, Δ=2−2γ and Δ*=5/4−2γ. The integer midpoint differs from the inclusive remainder by3/4.
- At x=4, D=8, Δ=12−4log4−8γ and Δ*=41/4−4log4−8γ. The right and left values differ by d(4)=3 and are each3/2 from the midpoint. At x=3/2, Δ*=9/4−(3/2)log(3/2)−3γ, with no endpoint half-weight.

**Checks of the endpoint cap.**

- c(0)=1, whereas `min 1 |0|⁻¹` in a totalized field is0.
- c(1/2)=c(−1/2)=1.
- c(2)=c(−2)=1/2; replacing the cap by the constant1 would lose the summable tail.

*Needs:* [§3.22](#s3-22), its harmonic remainder and exact hyperbola identity; finite Möbius inversion and Abel summation; Layer1 Mellin/contour adapters and ζ²; [BBR], Lemma5.1 and §§8–10 as the proof route of the named explicit bounds.

<a id="s3-23b"></a>

**§3.23b Second-kind Bessel function and positive-axis remainders.** Use the supplied K_ν and J_ν from the exact supplier contracts. Define `besselY : ℂ → ℂ → ℂ` for arbitrary complex order ν and Re z>0 by

Y_ν(z)=π⁻¹∫_0^π sin(z sinθ−νθ)dθ−π⁻¹∫_0^∞[exp(νt)+cos(πν)exp(−νt)]exp(−z sinh t)dt.

Both integrals are absolutely convergent on this domain, locally uniformly in (ν,z). Outside it the native totalized integral is only a value, with no asserted analytic identity. This representation avoids division by sin(πν) at integral orders.

- `besselY.integrable`, `besselY.holomorphic`: prove the stated convergence, entire dependence on ν, and holomorphy in z on Re z>0, by super-exponential domination at∞ and differentiation under the integral.
- `besselY.connection`: if sin(πν)≠0 and Re z>0, Y_ν(z)=[cos(πν)J_ν(z)−J_(−ν)(z)]/sin(πν). The limits at integral orders agree with the integral definition. Derive the identity using the supplied J series and its Schläfli integral comparison, or its equivalent Hankel contour obtained by deforming the same convergent integral.
- `besselY.ode`, `besselY.recurrence`: on Re z>0, z²Y″+zY′+(z²−ν²)Y=0 and Y_(ν−1)+Y_(ν+1)=(2ν/z)Y_ν. In particular Y_(−m)=(−1)^mY_m for integers m. Integration by parts includes the boundary contributions from both integrals.
- `besselY.half`: for real x>0, Y_(1/2)(x)=−√(2/(πx))cos x and Y_(−1/2)(x)=√(2/(πx))sin x; values are real for real ν and x>0.

See [DLMF-Bessel], 10.9.7 (integral), 10.2.3, 10.4.1, 10.6.1 and10.16.1. The integral/series comparison is local work; the first-kind function is not constructed again.

For real ν define `besselAsymptoticCoeff(ν,j)` by a_j(ν)=∏_(1≤r≤j)(4ν²−(2r−1)²)/(8^j j!), with empty product1. The API is the empty value, the recurrence a_(j+1)=a_j(4ν²−(2j+1)²)/(8(j+1)), and the following actual remainder estimates. For x>0 and integer m≥1 with |ν|<m+1/2,

K_ν(x)=√(π/(2x))e^(−x)[Σ_(j<m)a_j(ν)x^(−j)+R_m],  |R_m|≤|a_m(ν)|x^(−m).

For integers r,s≥1 with |ν|<min(2r+1/2,2s+3/2), set ω=x−πν/2−π/4. Then

Y_ν(x)=√(2/(πx)){sinω[Σ_(j<r)(−1)^j a_(2j)(ν)x^(−2j)+U]+cosω[Σ_(j<s)(−1)^j a_(2j+1)(ν)x^(−2j−1)+V]},

where |U|≤|a_(2r)(ν)|x^(−2r) and |V|≤|a_(2s+1)(ν)|x^(−2s−1). At half-integral orders use the exact terminating expressions: a remainder is zero once its cutoff is beyond the last nonzero coefficient. This does not assert a first-omitted-term bound for a truncation outside the displayed order restrictions. Prove `besselKY.positive_axis_remainders` from the convergent integral definitions, contour deformation and integration by parts, retaining the integral remainders; no merely formal asymptotic series is used. [Nemes], (1.9), (1.14) pp.2–3, (1.22)–(1.23) p.5, Theorem1.5 and (1.30) p.6, AppendixA (A.3) p.25 supply this route. The positive-axis specialization needs no incomplete-Gamma or terminant carrier.

The proof of these positive-axis bounds can stay entirely with positive-axis K values. For integer N≥1 and real |ν|<N+1/2, prove `besselKY.remainder_integrals`: with C_ν=√(2/π)cos(πν)/π,

R_N^K(x)=(−1)^N C_ν x^(−N)∫_0^∞t^(N−1/2)e^(−t)K_ν(t)/(1+t/x)dt,
R_N^J(x)=(−1)^floor(N/2) C_ν x^(−N)∫_0^∞t^(N−1/2)e^(−t)K_ν(t)/(1+(t/x)²)dt,
a_N(ν)=(−1)^N C_ν∫_0^∞t^(N−1/2)e^(−t)K_ν(t)dt.

Here R_N^J is the scalar remainder appearing in the even/odd expansion, not a new first-kind function: U=R_(2r)^J and V=−R_(2s+1)^J. Each displayed integral is absolutely convergent in this domain. Obtain the comparisons by finite geometric expansion of the transformed K and Y integrals, and evaluate the coefficient moment using the supplied cosh integral, Gamma/Beta integration and reflection. For real ν the cosh integral makes K_ν(t)>0; each rational denominator is at least1. The moment identity therefore gives both first-omitted-term bounds directly. This is the positive-axis content of [Nemes], (1.22)–(1.23), p.5, and (A.3), p.25; it introduces neither a general terminant nor a hypergeometric-function supplier.

In particular, for u>0, `besselKY.order_one` gives

K₁(u)=√(π/(2u))e^(−u)R₁(u),  |R₁(u)|≤1+3/(8u),

Y₁(u)=−√(2/(πu))[cos(u−π/4)−(3/(8u))sin(u−π/4)]+R₂(u),

|R₂(u)|≤(15/128)√(2/π)(1+7/(8u))u^(−5/2).

These are the one-order adapters of [87][R87], proof of Lemma1 p.8; u=0 is excluded from every displayed estimate.

**Checks of Y.**

- Y_(1/2)(π/2)=0 and Y_(−1/2)(π/2)=2/π.
- Y_(1/2)(π)=√2/π. The first two values alone would not detect the wrong overall cosine sign.
- For x>0, Y_(−1)(x)=−Y₁(x), whereas the supplied K has K_(−1)=K₁. A naive quotient at integral order has denominator zero and fails this check.

**Checks of the coefficients and remainders.**

- a₀(1)=1 and a₁(1)=3/8.
- a₂(1)=−15/128 and a₃(1)=105/1024; these fix the sign and the ratio7/8 in the order-one error.
- At ν=±1/2 all a_j with j≥1 vanish and the K expansion is exact. In the Y₁ bracket, the phase u−π/4=π/2 gives the positive correction +√(2/(πu))3/(8u); the leading cosine alone is zero there.

*Needs:* supplied K integral and J API; `Complex.exp`, `Complex.sin`, `Complex.cos`, `Complex.Gamma`; complex Cauchy/contour theory of Layer1; differentiation under a dominated integral and the native real/complex Gaussian integrals.

<a id="s3-23c"></a>

**§3.23c Quantitative saddle deformation with endpoint terms.** Prove `saddlePoint.quantitative` for real a<b,k and complex functions f,φ holomorphic on a neighborhood of the closed discs |z−x|≤μ(x), a≤x≤b. Here μ is positive C¹, Φ,F are positive continuous functions, f is real on [a,b], f″(x)>0 there, f″(z)≠0 throughout these discs, and A₁,A₂,A₃>0 satisfy, throughout each closed disc,

|φ(z)|≤A₁Φ(x),  |f′(z)|≤A₂F(x)/μ(x),  1/|f″(z)|≤A₃μ(x)²/F(x).

For 0<η<min{1/((1+2A₂A₃/3)√2), A₃(1+2A₂)/2, (48A₃³/π³)^(1/6)}, put β=2η√2 A₂A₃/[3(1−η√2)]<1 and

B₁=(1−β)⁻¹+π⁻¹exp(−π/(2(1−β))),
B₂=2πη²(1−β)/(A₃(1+2A₂)),
B₃=48√2(1+(1−β)^(−4))/(π⁴η⁷).

For the last constant put

w₁=πη³A₂[4√2/3+27η/(128(1−η√2))],
w₂=exp(w₁)(4πA₂/3)²[1+3η/(√2−2η)(1+3√2η/(8(1−η√2)))],
w₃=4π√2 A₂/3+2πηA₂/(1−η√2)+η³w₂,

B₄=(1+η³w₃)/[(2π/A₃)(1−η√2)]+3[(2πA₂)/(1−η√2)+√2w₃]/(4π/A₃)²+15w₂/(4π/A₃)³.

The light tuple `saddleConstants(A₂,A₃,η)` consists of (β,B₁,B₂,B₃,B₄). These are explicit numerical functions, not unspecified constants. Their API is positivity, continuity on the displayed open parameter domain, β<1 and the following error inequalities. If f′(x₀)+k=0 for x₀∈[a,b], this zero is unique and

∫_a^b φ(x)e^(2πi(f(x)+kx))dx=φ(x₀)e^(2πi(f(x₀)+kx₀+1/8))/√f″(x₀)+R_end+R_far+R_loc,

|R_end|≤A₁B₁[Φ(a)/(|f′(a)+k|+√f″(a))+Φ(b)/(|f′(b)+k|+√f″(b))],

|R_far|≤A₁∫_a^b Φ(x)exp(−B₂(|k|μ(x)+F(x)))(1+η√2|μ′(x)|)dx,

|R_loc|≤A₁(A₃⁴B₃+√A₃B₄)Φ(x₀)μ(x₀)F(x₀)^(−3/2).

If there is no such zero, omit both the main term and R_loc. A saddle at a or b is allowed with these endpoint errors; there is no claim that its full Gaussian main term is an asymptotic without a boundary correction. For the less restrictive domain holomorphic on the open union of discs, first shrink the discs and pass to the limit while retaining the same bounds.

Deform the real segment along x±η(1+i)μ(x), choose the sign away from the saddle, and retain both connecting endpoint segments. Cauchy estimates through order4 control the local Taylor remainder; the odd terms cancel on the symmetric central segment. Integrate the remaining quadratic Gaussian exactly and bound its tails. This proves all three estimates, including the no-saddle case, from existing contour and Gaussian theory. See [87][R87], Proposition1 pp.9–10, (27)–(36), Lemmas2–3 p.10–11 and proof pp.11–15, particularly (41), (43), (45) for w₁,w₂,w₃. No qualitative stationary-phase theorem is used in place of these quantitative bounds.

**Checks.**

- For f(x)=λx²/2, φ=1, k=0 and λ>0, the full-line improper Gaussian main term is exp(πi/4)/√λ; λ=1 and4 give the ratio2. Reversing the contour phase conjugates it. A Bochner integral of the undamped full-line phase is not asserted.
- On [−1,1] the same phase with k=3λ has no saddle, so there is no Gaussian main term. With k=λ the saddle is the left endpoint and R_end cannot be discarded.
- With A₂=1/π,A₃=27π, η=129/(3800√2), β=2322/3671<1, 2.72570<B₁<2.72571, 9.58·10^(−6)<B₂<9.59·10^(−6), 8.47·10^12<B₃<8.48·10^12 and 9310<B₄<9311. All strict parameter conditions hold. This pins the denominator inside B₁'s exponential as well as the large local-error constant.
- With A₂=1/π,A₃=80/9+9π, η=1/20, 2.50674<B₁<2.50675, 0.00010328<B₂<0.00010329, 3.576·10^10<B₃<3.577·10^10 and 907<B₄<908. These are the final moving-saddle constants used below.
- With A₂=1/π,A₃=1, η=1/100, 1.06890<B₁<1.06891, 0.00038274<B₂<0.00038275, 1.4023·10^14<B₃<1.4024·10^14 and 0.26491<B₄<0.26492. This third admissible parameter set tests the formulas independently of the two applications. Setting η=0 makes the quantitative theorem inapplicable.

*Needs:* Layer1 contour/Cauchy estimates; real and complex Gaussian integration (including `integral_gaussian_complex`); finite-segment integration by parts; positive real powers and elementary exponential bounds. The parameter functions are numerical formulas, not extra analytic carriers.

<a id="s3-23d"></a>

**§3.23d Logarithmic saddle family.** For positive α,β,γ with α≠1, T≥T₀≥1, k≥1, 0<a≤min(1,T/(8πk)) and b≥T, put `atkinson.logRatio(y)=L(y)=log((1+y)/y)` for y>0 and `atkinson.logarithmicWeight(α,β,γ,y)=y^(−α)(1+y)^(−β)L(y)^(−γ)`. Their API is positivity and smoothness on y>0, L′(y)=−1/(y(1+y)), and the weight comparison Φ and derivative estimates below. Prove `atkinson.logarithmic_saddle` for

I_±=∫_a^b y^(−α)(1+y)^(−β)L(y)^(−γ)exp(i[TL(y)±2πky])dy.

For the plus sign the unique saddle is y₀=√(T/(2πk)+1/4)−1/2∈[a,b], and the main term is

y₀^(−α)(1+y₀)^(−β)L(y₀)^(−γ)√(2π/ψ″(y₀))exp(i[ψ(y₀)+π/4]),  ψ(y)=TL(y)+2πky.

For the minus sign there is no saddle and no main term. Both remainders are bounded by the three quantities R_end,R_far,R_loc of §3.23c, with R_loc omitted for minus, using

f(z)=T log((1+z)/z)/(2π), φ(z)=z^(−α)(1+z)^(−β)(log((1+z)/z))^(−γ),
μ(x)=x/2, F(x)=T/(1+x), Φ(x)=x^(−α)(1+x)^(γ−β),
A₁=2^(α+β−γ)3^γ, A₂=1/π, A₃=27π, η=129/(3800√2).

All complex logarithms and powers are principal on these discs, which avoid the cut. `atkinson.logarithmic_saddle_uniform` bounds these explicit remainder expressions uniformly in either range 1≤k≤A″T or k≥A′T, for fixed positive A′,A″. The respective local-error scales are

T^((γ−α−β)/2−1/4)k^(−(γ−α−β)/2−5/4),  and  T^(−1/2−α)k^(α−1).

The endpoint scales are a^(1−α)/T and b^(γ−α−β)/k. The far error retains its exponentially decreasing integral, not an O-constant depending on k or T. Bounding that integral after splitting at1,√(T/k),T gives the explicit refinement of [87][R87], Proposition2 (47)–(55) pp.15–17, with proof pp.17–20. These refinements are targets of the same theorem and supply the numerical budgets of §3.23g. For β=1/2,γ=1, the individual complex integrals converge conditionally at∞ when α>1/2, but generally have no ordinary improper limit at α=1/2 because their amplitudes tend to1. In the E₁ application first pair their imaginary parts, obtaining 2sin(TL(y))cos(2πky). Its extra O(T/y) factor permits a uniform integration-by-parts tail estimate for α in [1/2,3/4]. Take a↓0 and b→∞ while α>1/2, then α↓1/2 only in that paired expression. This proves the boundary formula without asserting convergence of either unpaired complex integral there.

**Checks.**

- With T=4π,k=1, y₀=1 and ψ′(1)=0; the minus-phase derivative there is−4π, so it must have no main term.
- Here ψ(1)=4πlog2+2π and ψ″(1)=3π. The Gaussian phase has +π/4 and scale√(2/3), fixing both the 2π convention and orientation.
- For the first moment-sum parameters α=β=1/2,γ=1, the amplitude behaves like1 at∞. Each unpaired complex improper integral fails to converge at this boundary. In the paired imaginary parts the sine supplies decay; with α>1/2 the endpoint b^(1/2−α) first vanishes in the required order of limits.

**Checks of the log ratio and weight.**

- At y=1, L=log2 and the weight with α=β=1/2,γ=1 is 1/(√2 log2).
- At y=1/2, L=log3 and that weight is 2/(√3 log3).
- At y=2, L=log(3/2) and that weight is 1/(√6 log(3/2)). The analytic domain excludes y=0 even though the light Lean formulas totalize there.

*Needs:* §3.23c, elementary log/arcsinh identities, dominated convergence on finite intervals, and integration-by-parts control of the oscillatory tails.

<a id="s3-23e"></a>

**§3.23e Moving-cutoff saddle family.** For α,A,A′>0,T≥1,n≥1 and A√T≤a≤A′√T, put

`atkinson.movingWeight(T,x)=Q_T(x)={asinh(x√(π/(2T)))[√(T/(2πx²)+1/4)+1/2](T/(2πx²)+1/4)^(1/4)}⁻¹`,

`atkinson.movingPhase(T,x)=h_T(x)=−2T asinh(x√(π/(2T)))−√(2πx²T+π²x⁴)+πx²`.

Their API is positivity of Q for T,x>0, smoothness in both positive parameters, Q_(c²T)(cx)=Q_T(x) and h_(c²T)(cx)=c²h_T(x) for c>0, and h′_T(x)=2πx−2√(π²x²+2πT). Every denominator in Q is strictly positive on this domain.

Prove `atkinson.moving_saddle` for the improper integral ∫_a^∞x^(−α)Q_T(x)exp(i[4πx√n+h_T(x)])dx. There is a saddle in [a,∞) exactly when n<T/(2π) and (T/(2π)−n)²/n≥a². Its position is x₀=(T/(2π)−n)/√n and its main term is

(4π/T)n^((α−1)/2)(log(T/(2πn)))⁻¹(T/(2π)−n)^(3/2−α)exp(i[T−Tlog(T/(2πn))−2πn+π/4]).

With c from §3.23a, the remainder satisfies

|R|≤V₁T^(−α/2)c(2√n+a−√(a²+2T/π))
+V₂T^(−3/2)n^((α−1)/2)(T/(2π)−n)^(1−α)
+V₃T^(−α/2)n^(−1/2)exp(−B₂(T+A√T)).

For η satisfying §3.23c with A₂=1/π,A₃=8/A²+9π, use its B_j and put

A₁=2^(α+1/2)/asinh((A/2)√(π/2)),
V₁=A₁B₁A^(−α)[1−(1+1/(2π(A′)²))^(−1/2)]^(−1/2),
V₂=(1/2)A₁(A₃⁴B₃+√A₃B₄),
V₃=(A₁/B₂)A^(−α)(1+η/√2).

If the saddle condition fails, omit the main term and the entire second error term, so its possibly nonpositive base is never used. Replacing √n by−√n gives the no-saddle version; its first endpoint cap has argument −2√n+a−√(a²+2T/π). The exponential tail is unchanged. These statements hold for every α>0; the Voronoi application uses3/2 and5/2.

Apply §3.23c to f=h_T/(2π), k=2√n, μ=x/2,F=T,Φ=x^(−α). Its real second derivative is 1−(1+2T/(πx²))^(−1/2)>0. Verify the complex disc bounds with the displayed A_j, then let the finite upper endpoint tend to∞; its connecting endpoint contribution tends to zero. This proves the explicit V_j without concealing the distance from the lower endpoint. See [87][R87], Proposition3 (67)–(78), Lemma5 and proof pp.21–23.

Define `atkinson.cutoff(T,b)=(√(b+2T/π)−√b)²/4` for T,b>0. Its API is positivity, strict inequality cutoff<T/(2π), continuity, strict decrease in b and the equivalence

n≤cutoff(T,b) ↔ n<T/(2π) and (T/(2π)−n)²/n≥b,  n>0.

Thus for b=N+1/2, a=√b, the finite main-sum cutoff includes n exactly at the saddle endpoint. Also 2√cutoff=√(b+2T/π)−√b, so its endpoint error is precisely c(2√n−2√cutoff). For proportional b/T these formulas give compact positive lower and upper multiples of T for cutoff and for T/(2π)−cutoff; the explicit inequalities are [87][R87], (100)–(102) p.32.

**Checks of the saddle family.**

- T=4π,n=1,a=1 gives x₀=1, an endpoint saddle. Its capped endpoint factor is1, not the totalized value of1/0.
- For the same T,n with a=2 the saddle lies outside the interval and the main term and V₂ term disappear. Replacing √n by−√n also removes them even at a=1.
- At T=4π,n=1, the main phase is4π−4πlog2−2π+π/4, with positive Gaussian shiftπ/4. At n=T/(2π) the logarithmic denominator is zero; that n is excluded from the saddle branch.

**Checks of the moving weight and phase.**

- At T=4π,x=1, Q=√(2/3)/log2 and h=−4πlog2−2π. Adding 4πx makes the phase at the n=1 endpoint saddle equal2π−4πlog2, before the positive Gaussian shift.
- At T=16π,x=2, Q has the same value while h=−16πlog2−8π. This distinguishes the quadratic scaling of h from a linear scaling.
- At x=0, the native totalized real formulas give Q=h=0. The analytic statements exclude this input: Q's arcsinh denominator is zero there.

**Checks of the cutoff.**

- cutoff(4π,1)=1 and T/(2π)=2, so n=1 is included and n=2 is excluded.
- cutoff(12π,1)=4; doubling both T and b doubles cutoff, giving cutoff(8π,2)=2.
- At T=0 the displayed algebraic expression is0, but none of its positive-domain denominator or saddle consequences applies. Increasing b strictly decreases cutoff when T>0.

*Needs:* §§3.23a,c; log/arcsinh differentiation; integration by parts at∞; real square-root algebra. §3.23f's integrated exchange uses these estimates after this theorem has been proved, so the two theorems do not depend circularly on one another.

<a id="s3-23f"></a>

**§3.23f Divisor Voronoi identity, convergence and integrated exchange.** For every x>0, prove `divisorVoronoi.endpoint_identity` as the limit of partial sums in increasing positive integer n:

Δ*(x)=−(2√x/π) Σ_(n≥1)d(n)n^(−1/2)[K₁(4π√(nx))+(π/2)Y₁(4π√(nx))].

The partial sums are uniformly bounded on every compact interval in (0,∞), and converge uniformly on every compact interval avoiding the positive integers. At an integer the limit is the midpoint value in §3.23a. The oscillatory series is conditional; it is not a `tsum` justified by absolute summability, and it does not converge uniformly across a divisor jump.

A proof from earlier inputs is the damped Poisson argument of [Meurman], theorem p.265 and §§2–8 pp.266–274. Insert exp(−v(u+nx/u)), v>0, into ∫_0^∞cos(2πu)sin(2πnx/u)du; finite truncation, Poisson summation and Abel summation identify the v↓0 limit with the half-endpoint divisor sum. The undamped integral is an improper limit, not an absolutely integrable Bochner integral. The identity

∫_0^∞cos(2πu)sin(2πt/u)du=−√t[K₁(4π√t)+(π/2)Y₁(4π√t)],  t>0,

is `divisorVoronoi.kernel_comparison`. Obtain it by substituting u=√t exp v in the damped integral, separating its two exponential phases and deforming to the supplied K integral and the Y integral of §3.23b; take the damping limit only after the integration-by-parts tail estimate. This also fixes the factor4π and the minus sign. Prove `divisorVoronoi.bounded_convergence` using the same finite Poisson formula and the uniformly summable damped remainder. Meurman's p.266 records the comparison, while pp.267–274 give the damping, stationary-phase and convergence arguments (convergence is §8, (8.1)–(8.3), pp.272–274); the estimate needed in his proof follows from §3.23c's Gaussian deformation, not an extra Bessel supplier.

From §3.23b derive `divisorVoronoi.two_term`: for x≥x₀≥1,

Δ*(x)=x^(1/4)/(π√2) Σ_(n≥1)d(n)n^(−3/4)[cos(4π√(nx)−π/4)−3/(32π√(nx))sin(4π√(nx)−π/4)]+x^(−3/4)V(x),

|V(x)|≤15ζ(7/4)²/(2^11π³√2)+105ζ(9/4)²x₀^(−1/2)/(2^16π⁴√2)+ζ(11/4)²(1+3/(32π√x₀))x₀^(−1)/(π√2).

The leading series has the same ordered convergence convention; the correction series and both discarded Bessel tails are absolutely summable. Use Σd(n)n^(−s)=ζ(s)² for real s>1 and e^(−4πu)≤u^(−4) for u≥1. This is [87][R87], Lemma1 and proof pp.8–9, including its uniform dependence on x₀.

`divisorVoronoi.integrated_exchange` permits this expansion in the two x-integrals of §3.23e with α=3/2,5/2 and weight d(n)n^(−3/4) or d(n)n^(−5/4), respectively. First integrate on a compact [a,b], splitting at the finitely many divisor jumps and using bounded convergence. Then take b→∞: beyond b>T+1 the phase derivative has absolute value bounded below by a fixed multiple of √n, so integration by parts bounds the nth integrated tail by C(T,a)b^(−α)n^(−1/2). The resulting divisor series is summable, starting with n^(−5/4). The finite saddle range n≤Z and the capped endpoint error are controlled by §3.23e and the transition sum of §3.23a. This proves the exchange; applying Fubini directly to the conditional leading series is not a valid substitute.

**Checks.**

- The transform at x=1 equals5/4−2γ, not the inclusive value2−2γ or the right-limit value7/4−2γ.
- At x=4 the transform equals41/4−4log4−8γ and averages a jump of3. Uniform convergence across4 would force a continuous limit and is false.
- For the n=1 and n=2 terms the arguments are4π√x and4π√(2x); the coefficients in the leading series are1 and2^(1/4), both positive. The next terms have the negative sine coefficient3/(32π√(nx)). In contrast, the first two Atkinson coefficients in §3.23g have opposite signs.

*Needs:* §§3.23a–b and §3.23c; supplied Poisson summation with its actual decay hypotheses (apply it while v>0); finite hyperbola/Abel summation; real s>1 divisor Dirichlet series; dominated convergence on compact intervals; §3.23e for the unbounded integrated exchange.

<a id="s3-23g"></a>

**§3.23g Atkinson sums, error budget and the quantitative endpoint.** For T>0,n>0 put

e(T,n)=(1+πn/(2T))^(−1/4)√(πn/(2T))/asinh√(πn/(2T)),
f(T,n)=2T asinh√(πn/(2T))+√((πn)²+2πnT)−π/4,
g(T,n)=Tlog(T/(2πn))−T+π/4.

Extend e(T,0)=1 for T>0 by its continuous right limit; f(T,0)=−π/4. Define the finite sums

S₁(T,N)=√2(T/(2π))^(1/4)Σ_(1≤n≤N)(−1)^n d(n)n^(−3/4)e(T,n)cos f(T,n),
S₂(T,Z)=−2Σ_(1≤n≤Z)d(n)n^(−1/2)(log(T/(2πn)))⁻¹cos g(T,n).

The light Lean names for e,f,g,S₁,S₂ are respectively `atkinson.amplitude`, `atkinson.phase₁`, `atkinson.phase₂`, `atkinson.firstSum`, `atkinson.secondSum`. Here N is a natural number, Z is a real cutoff, and the analytic domain of S₂ is 0≤Z<T/(2π); it is not defined analytically by a sum containing a zero logarithmic denominator. The light totalized Lean formula outside this domain asserts no analytic identity. The API is continuous extension of e at0, 0<e(T,n)<1 for 0<πn/(2T)≤50, homogeneous scaling e(cT,cn)=e(T,n) for c>0, finite-sum cutoff and jump identities, and the phase evaluations below. See [87][R87], (5)–(10) p.2 and the beginning of §7 p.35.

`atkinson.formula`: for any fixed 0<A′≤A″, uniformly for positive integers N with A′T≤N≤A″T as T→∞,

E(T)=S₁(T,N)+S₂(T,cutoff(T,N+1/2))+O_(A′,A″)(log²T).

For the explicit specialization T≥10^30, (9/10)T≤N≤(11/10)T, prove `atkinson.remainder_budget` with the actual remainder ℛ=E−S₁−S₂:

|ℛ|≤95log²T+275log T+7.3·10^18.

Here is the proof chain and the quantitative accounting. For b=N+1/2, apply the zeta functional equation to the two-variable off-diagonal Dirichlet series, subtract the Gamma main term, and use finite Poisson/Stieltjes summation. Continue the divisor tail from Re u<1/2 to Re u<2/3 using §3.23a's cubic estimate. It yields the contour decomposition `atkinson.contour_decomposition`, E=E₁−E₂+E₃−E₄+R, with

E₁=4Σ_(n≤N)d(n)∫_0^∞sin(TL(y))cos(2πny)/[√(y(1+y))L(y)]dy,
E₂=4Δ*(b)∫_0^∞sin(TL(y))cos(2πby)/[√(y(1+y))L(y)]dy,
E₃=−(2/π)(log b+2γ)∫_0^∞sin(TL(y))sin(2πby)/[y√(y(1+y))L(y)]dy
+1/(πi)∫_0^∞[sin(2πby)/y]∫_(1/2−iT)^(1/2+iT)((1+y)/y)^u du/u dy,
E₄=4∫_b^∞[Δ*(x)/x]∫_0^∞{cos(2πxy)/[(1+y)√(y(1+y))L(y)]}{Tcos(TL(y))−(1/2+1/L(y))sin(TL(y))}dy dx,

|R|≤(T/2)log(1+1/(4T²))+1/(12T)+1/(90T³).

Integrals over an unbounded interval are successive improper limits in the displayed order. First perform the finite truncations and avoid poles, then prove convergence by the saddle/tail estimates before passing to these limits. The derivation is [87][R87], §2 (16)–(21) pp.5–7; the exact b=N+1/2 removes the divisor endpoint from the Stieltjes cutoff. The residue at u=0 and the Gamma remainder give the displayed E₃ and R; they are not suppressed in an O-term.

The named budget milestones are `atkinson.E1_budget` (E₁−S₁ via §3.23d, α↓1/2), `atkinson.E2_budget` (E₂ via the cubic divisor bound), `atkinson.E3_budget` (split at y=1/(2N+1) and1, residue u=0, then §3.23d with α=3/2), and `atkinson.E4_budget`. For the last, split its bracket into Tcos, −sin/2 and −sin/L. Apply §3.23d to the inner integrals; apply §3.23f's two-term expansion and integrated exchange only to the first resulting outer integral. The α=3/2 saddle of §3.23e gives E₄'s main term −S₂, its α=5/2 version controls the correction, and §3.23a's capped transition sum controls the near-endpoint errors. The absolute Voronoi remainder and the cubic divisor bound control all other outer tails. Thus the sign in E=E₁−E₂+E₃−E₄+R produces +S₂.

Quantitatively retain the explicit R_end,R_far,R_loc of §3.23c and V_j of §3.23e throughout. The error inequalities for these four milestones are [87][R87], (81), (86), (93), (94)–(95), (104) and (106), pp.24–35. Collect the log²T, log T and remaining terms separately, with A′=9/10,A″=11/10,T₀=10^30 and final saddle η=1/20 (A=√(9/10), A′ in §3.23e=√(11/10+1/(2T₀))). The resulting coefficients b₁,b₂,b₃ satisfy b₁≤95, b₂≤275, b₃(T)≤7.3·10^18. In fact 94.38860<b₁<94.38861 and 274.80674<b₂<274.80675; the smaller margin for b₂ must survive outward rounding. These inequalities, including the monotonicity of the exponentially decreasing terms on T≥T₀, are `atkinson.budget_certificate`; prove them by rational outward bounds for π,γ, log, exp, square roots, arcsinh and ζ(s), s>1. For the latter, sum finitely and bound the tail by the integral test. This numerical certificate is a target to prove, not a reliance on the source's Mathematica computation (Theorem2/Table1 p.4, end of §6 pp.34–35). The preceding displayed identities, cap and error formulas specify all analytic inputs to it.

For explicit statements of the four budget milestones at these fixed parameters, set u=1+√(1+20/(9π)), v=1+√(1+20/(11π)), H=V₁(3/2)/√π·(11/10+1/(2T₀))^(1/4)√v, with V₁ evaluated at the preceding A,A′,η. Then b₁=1.445H and b₂=H[15.35−2.89log((9/10)π²u²)]. For every T≥T₀=10^30 and integer (9/10)T≤N≤(11/10)T, the named contracts are

- `atkinson.E1_budget`: |E₁−S₁(T,N)|≤4.3·10^15.
- `atkinson.E2_budget`: |E₂|≤10^(−3).
- `atkinson.E3_budget`: |E₃|≤4.
- `atkinson.E4_budget`: |E₄+S₂(T,cutoff(T,N+1/2))|≤b₁log²T+b₂log T+3.1·10^17.

These deliberately loose residual constants suffice: together with |R|≤1 their sum is below7.3·10^18. The first three follow from (81)–(84), (86), (88)–(93); the fourth combines (94)–(95), (104), (106)–(108). Their proof keeps the already displayed quantitative saddle errors, bounds the positive elementary coefficients in those inequalities by outward intervals, and then uses their decreasing dependence on T≥T₀. Thus each milestone has an actual inequality rather than an unspecified estimate. The numerical certificate also proves the displayed b₁,b₂ bounds; it is not an extra analytic assumption.

Finally set N=floor T. Then 0.9T≤N≤1.1T and Z=cutoff(T,N+1/2) is between positive fixed multiples of T and strictly below T/(2π). Use e≤1 and §3.23a's weighted sums to prove `atkinson.main_sum_bound`, |S₁|+|S₂|≤3.87√T log T−1.1√T for T≥10^30; (100)–(102) keep S₂'s logarithmic denominator uniformly positive. For an elementary certificate, set z₊=(√(0.9+2/π)−√0.9)²/4, C₁=4√2/(2π)^(1/4), C₂=4√z₊/log(1/(2πz₊)). Then Z≤z₊T, C₁+C₂<3.862 and C₂log z₊<−1.111. Monotonicity in Z of √Z log Z/log(T/(2πZ)) gives the stated bound. Combining it with the remainder budget gives |E(T)|≤110√T log T, as in [87][R87], §7 (109) p.35. For this last deduction discard the negative term −1.1√T. The resulting normalized bound is 3.87+95log T/√T+275/√T+7.3·10^18/(√T log T), less than109.55 at T₀; every nonconstant term decreases thereafter. Thus the numerical endpoint is part of the proof, not only an eventual asymptotic.

**Checks of e.**

- e(T,0)=1 for T>0; the unextended quotient would give0/0 in Lean.
- e(π/2,1)=2^(−1/4)/asinh1.
- e(π/2,4)=2·5^(−1/4)/asinh2. These values distinguish the factor2T and the fourth-root amplitude.

**Checks of the phases.**

- f(T,0)=−π/4, whereas g(2π,1)=−7π/4.
- f(π/2,1)=π asinh1+π√2−π/4; f(π/2,4)=π asinh2+2π√5−π/4.
- g(4π,1)=4πlog2−15π/4 and g(4π,2)=−15π/4. Thus the two logarithmic frequencies cannot be identified.

**Checks of the finite sums.**

- S₁(T,0)=0 and S₂(T,0)=0. They have no n=0 term.
- S₁(T,1)=−√2(T/(2π))^(1/4)e(T,1)cos f(T,1); its next term at N=2 has positive coefficient2·2^(−3/4). This pins the alternating sign and the divisor multiplicity.
- For T>4π, S₂(T,1)=−2cos g(T,1)/log(T/(2π)); increasing Z from1 to2 adds −2√2 cos g(T,2)/log(T/(4π)). Its integer endpoint is included in full. The divisor transform's midpoint convention does not halve these finite sums.

*Needs:* §§3.23a,b,c; §3.23f’s transform and §§3.23d,e; §3.23f’s integrated exchange after §3.23e; Layer1 zeta functional equation, Gamma/Stirling remainder, finite contour and Poisson adapters; real s>1 Euler products; exact finite arithmetic and certified elementary real inequalities. All quantitative constants refer to these explicit targets, rather than to an unnamed mean-value or stationary-phase supplier.

<a id="s3-24"></a>

### 3.24 Fourth moment of zeta

As T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3), with an absolute constant.

Use the unshifted specialization of [Kösters][R96], §3 pp.9–15, keeping the error rates in its proof, rather than only the limit in Theorem1.3. Put A(t)=Σ_(n≤t/(2π))τ(n)n^(−1/2−it) and S(t)=χ(1/2+it)^(-1)A(t), where χ is the actual zeta functional-equation multiplier, of modulus1. The auxiliary targets are:

- `zetaFourthMoment.approximateFE`: ζ(1/2+it)²=A(t)+χ(1/2+it)²·conj(A(t))+O(log t), uniformly for t≥2 (p.9). Construct the two truncated Perron contours, apply the zeta functional equation and Stirling, and bound their tails; the pole and cutoff endpoint terms belong to this estimate.
- `zetaFourthMoment.divisorDiagonal`: Σ_(n≤X)τ(n)²=X(log X)³/π²+O(X(log X)²), and Σ_(n≤X)τ(n)²/n=(log X)^4/(4π²)+O((log X)³), X≥2 (AppendixA, LemmasA.5–A.6, p.20). The Euler identity Στ(n)²n^(−s)=ζ(s)^4/ζ(2s), finite divisor hyperbola summation and Abel summation give these estimates; the coefficient is (1/3!)/ζ(2)=1/π².
- `zetaFourthMoment.divisorOffDiagonal`: Σ_(1≤m<n≤X)τ(m)τ(n)/(√(mn)log(n/m))=O(X(log X)³), X≥2 (LemmaA.4 p.20). For n≥2m, use the divisor average. For comparable m,n on a dyadic interval of size Y, put h=n−m; the denominator is ≫h. Splitting each divisor at its square root and applying CRT gives Σ_(n≍Y)τ(n)τ(n+h)≪Y(log Y)²Σ_(d|h)1/d+Y for 1≤h≤2Y. Sum with weight1/h, using Σ_(h≤2Y)(1/h)Σ_(d|h)1/d≪log Y, then sum dyadic intervals.
- `zetaFourthMoment.oscillation`: on a compact interval, a real C² phase with monotone derivative |F′|≥λ>0 has |∫exp(iF)|≤4/λ; if |F″|≥λ>0, the bound is8/√λ (LemmasA.1–A.2 p.20). Integration by parts gives the first; split at |F′|=√λ for the second.

The functional equation gives |ζ|²=2 Re S+O(log t). On [T,2T], the diagonal in ∫|S|² contributes T(log T)^4/(4π²)+O(T(log T)³); the moving-cutoff correction has size O(T(log T)³). The off-diagonal bound controls both ∫|S|² off the diagonal and ∫S² off the diagonal, while the latter's diagonal is O(√T(log T)^4) by the second-derivative estimate. Thus ∫(2 Re S)² has coefficient1/(2π²); Cauchy–Schwarz bounds the approximate-equation error by O(T(log T)³). Sum dyadic intervals, absorbing the bounded initial interval. Independently [89][R89], p.1 gives the same coefficient 2/(4!ζ(2)); its stronger Heath-Brown error is unnecessary here.

*Needs:* [§3.22](#s3-22); [§3.26](#s3-26); zeta functional equation and imported Stirling theory; truncated Perron and contour adapters; finite divisor hyperbola/CRT and Abel summation; the four auxiliary targets above.

<a id="s3-25"></a>

### 3.25 Beurling prime system

A discrete Beurling prime system is a nondecreasing sequence of real numbers1<p₁≤p₂≤… tending to∞. Generalized integers are finite-support exponent vectors a:N→N, with norm∏p_j^(a_j); coincident real values are counted with multiplicity. N(x) counts these vectors of norm≤x, and π_P(x) counts the prime indices with p_j≤x. The representative structure is `BeurlingPrimeSystem`, with indexed count `BeurlingPrimeSystem.primeCount`; `exists_beurlingPrimeSystem_nth_prime` gives the ordinary prime sequence.

Use a monotone real sequence p:N→R with p(0)>1 and p→∞. Generalized integers are N→₀N, not the set of real norm values. Define their norm by the finite product and counts by finite subtype cardinality. For x≥1, only finitely many indices satisfy p(i)≤x, by escape to∞; every contributing exponent is≤log x/log p(0). Every positive exponent forces its prime≤x. Embed contributing vectors into the product of these finite exponent intervals. For x<1 there are none, since every norm≥1. Coordinatewise addition gives norm(a+b)=norm(a)norm(b); the zero vector has norm1. Unique factorization of ordinary positive naturals supplies the ordinary-prime compatibility, preserving repeated norms for a general system.

- `beurling_prime_system.norm`: The norm is the finite product with exponent multiplicities.
- `beurling_prime_system.finite`: Only finitely many exponent vectors have norm≤x, because only finitely many primes≤x occur and p₁>1 bounds every exponent.
- `beurling_prime_system.unit`: The zero exponent vector has norm1 and is counted once.
- `beurling_prime_system.multiplicity`: Equal real products from different vectors contribute separately to N.
- `beurling_prime_system.ordinary`: Taking the increasing ordinary prime sequence recovers the ordinary positive integers and prime count.
- `beurling_prime_system.ext`: Two systems with identical indexed prime sequences are equal; proof fields do not change the carrier.
- `beurling_prime_system.norm_pos`: For every exponent vector a,1≤norm(a), in particular norm(a)>0.
- `beurling_prime_system.norm_add`: For exponent vectors a,b, norm(a+b)=norm(a)norm(b).
- `beurling_prime_system.prime_finite`: For every real x the prime indices i with p(i)≤x form a finite set.

**Checks.**

- The ordinary primes give N(10)=10.
- If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors.
- For1≤x<p₁, N(x)=1 and π_P(x)=0.
- A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.
- For x=0 both N(x) and π_P(x) are0; the unit appears at x=1.


See [90][R90], Introduction p.1, definition and counting functions (1); §2.1 p.3.

*Needs:* `Nat.primeCounting`.

<a id="s3-26"></a>

### 3.26 Uniform divisor subpower bound

For every ε>0 there exists a real C≥1 such that τ(n)≤C n^ε for every positive integer n. One choice is C=max(1,(ε log 2)⁻¹)^B for any natural B≥exp(1/ε). The representative signature is `card_divisors_le`.

Choose B by the Archimedean theorem exists_nat_ge applied to exp(1/ε). Take the explicit constant and use D≥1 to verify C≥1; invoke explicit-divisor-subpower-bound for every n>0. For an effectively presented positive ε, certified bounds for exponential and logarithm produce an effective upper constant. For an arbitrary abstract real ε, this is a mathematical existence assertion, not a uniform executable real-number algorithm.

ε=1/(64c), c>0, supplies the exact ES.0 request for every M>0. C is retained at small inputs; setting C=1 for all n fails at n=2, ε=1/2. No squarefreeness, primitivity or coprimality hypothesis appears.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* [§3.1](#s3-1); `exists_nat_ge`.

<a id="s3-27"></a>

### 3.27 Uniform bounded-norm ideal count

For every fixed g≥1 and ε>0 there is C(g,ε)>0 such that for every number field E of degree 2g and every integer n≥1, the number of nonzero integral ideals of norm n is at most C(g,ε)n^ε. Consequently, for every real X≥1 the number of such ideals of norm at most X is O_(g,ε)(X^(1+ε)). Both constants are uniform in E.

Combine the coefficient divisor majorant and the fixed-order divisor bound. Sum m^ε for m≤X; no field-dependent constant is introduced.

See [64][R64], 2.2, p. 382.

*Needs:* [§3.3](#s3-3); [§3.4](#s3-4).

<a id="s3-28"></a>

### 3.28 Cardinality of medium-prime products

For fixed integer m≥0, #N_m(x)∼(x/log x)^m/(2^m m!) as x→∞; m is fixed, not uniform in m.

Apply the rational PNT at x and x/2 to obtain k(x)=#P_x∼x/(2log x); the closed lower endpoint differs from π(x)−π(x/2) by at most one prime. In particular k(x)→∞. Use the distinct-product cardinality result and compose isEquivalent_choose(m) with k(x)→∞. This includes m=0 exactly, and yields (x/log x)^m/(2^m m!).

See [50][R50], §3.6 (3.4), p.26.

*Needs:* [§3.5](#s3-5); [qualitative prime asymptotics][R136]; `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`; `isEquivalent_choose`; [§3.28a](#s3-28a).

<a id="s3-28a"></a>

**§3.28a Distinct-product cardinality.** For x≥2,m≥0, #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).

For two m-element subsets s,t of P_x with the same product, apply Nat.primeFactors_prod to both sides to get s=t. Apply Finset.card_image_of_injOn and Finset.card_powersetCard to the image defining N_m(x).

See [50][R50], §3.6, definition and (3.4), p.26.

<a id="s3-29"></a>

### 3.29 Truncated von Mangoldt function

For real z≥1 and n∈Z, Λ_z(n)=−Σ_{d∈N,1≤d≤z,d|n} μ(d)log d. Divisibility of zero includes every positive d; the sum is finite by its cutoff.

Take the finite sum over positive naturals d≤floor z whose integer cast divides n; retain all positive d at n=0 rather than substituting the empty native divisors(0). For n≠0 and z≥|n|, identify this finite set with Nat.divisors(n.natAbs). Apply ArithmeticFunction.sum_moebius_mul_log_eq at n.natAbs and negate. Divisibility is invariant under n↦−n. Evaluate z=1, the prime cutoff and z=2,n=0 directly; these require no analytic cancellation theorem.

- `truncated_von_mangoldt.sum`: Evaluation is the cutoff positive-divisor sum.
- `truncated_von_mangoldt.neg`: Λ_z(−n)=Λ_z(n).
- `truncated_von_mangoldt.zero`: Λ_z(0)=−Σ_{1≤d≤z} μ(d)log d.
- `truncated_von_mangoldt.large_cutoff`: For n≠0 and z≥|n|, Λ_z(n)=Λ_even(n).

**Checks.**

- Λ_2(0)=log 2, so truncation is not zero at zero.
- For a prime p, Λ_z(p)=0 when z<p and log p when p≤z.
- Λ_1(n)=0 for all n.


See [58][R58], §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* [§3.8](#s3-8); `ArithmeticFunction.moebius`; `ArithmeticFunction.sum_moebius_mul_log_eq`.

<a id="s3-30"></a>

### 3.30 Shifted coprime Möbius sum

For every A>0 there are constants C_A>0 and T_A≥2 such that for every real T≥T_A and every positive integer 1≤q≤√T, |Σ_{1≤t≤T/q,(t,q)=1}μ(t)log(qt)/t+q/φ(q)|≤C_A(log T)^(−A). The constants are independent of q.

Set U=T/q≥√T. Then q≤U, hence q≤U^4, so the two coprime Möbius supplier statements apply at U, with logarithmic exponent A+1. Expand log(qt)=log q+log t. Bound log q≤(log T)/2 and log U≥(log T)/2 to absorb the first sum into O_A((log T)^−A).

See [58][R58], Lemma3.11 and proof, published p.699.

*Needs:* [§3.9](#s3-9); [§3.12](#s3-12).

<a id="s3-31"></a>

### 3.31 Asymptotic count of the three exceptional families

The union of k=u²+v², 4(k−1)=u²+3v² and k−4=u², with k positive and ≤K, has cardinality ∼C′ K/√log K for a positive C′.

The constant is C′=C_L+C_E, with C_E specified in §3.14. Apply the two norm asymptotics, the intersection estimate below and finite inclusion-exclusion. Every intersection involving the shifted-square family is O(√K). The only remaining pair has size O(K/log K), hence is o(K/√log K). The zero-norm and shifted endpoints change the counts by O(1).

<a id="s3-31a"></a>

**§3.31a Shifted norm intersection sieve.** Let A(k) say k is a sum of two squares and B(k) say k−1 is an Eisenstein norm. For each rational prime p, exclude the classes ap mod p², 1≤a<p, if p≡3 mod4, and the classes1+ap mod p² if p≡2 mod3. The two lists are disjoint because their reductions modulo p are0 and1. A(k)∧B(k) avoids their union Ω_p. Put ω(p)=#Ω_p=(p−1)(1_{p≡3(4)}+1_{p≡2(3)}) and g(p)=ω(p)/p²<1. This retains p=2 and3. For squarefree d, CRT gives exactly ω(d)=∏_{p|d}ω(p) forbidden joint classes mod d², and their count up to X is Xg(d)+O(ω(d)).

Here is the finite upper-bound sieve needed, including its remainder. Use real weights λ_d supported on squarefree d≤z with λ_1=1; zero-density primes are omitted. For an integer avoiding every Ω_p, the square of the corresponding divisor sum is1. Expanding the square gives count≤XQ(λ)+Σ_{d,e≤z}|λ_dλ_e|ω([d,e]), Q=Σ λ_dλ_e g([d,e]). Set h(p)=g(p)/(1−g(p)) and y_r=Σ_{r|d}λ_d g(d). Multiplicativity gives Q=Σ_r y_r²/h(r), and finite Möbius inversion gives λ_1=Σ_r μ(r)y_r. Thus the minimizing choice is y_r=μ(r)h(r)/G(z), G(z)=Σ_{r≤z}μ²(r)h(r), with Q=1/G(z). Inverting gives |λ_d|≤∏_{p|d}(1−g(p))^(−1)≤d². Since ω([d,e])≤[d,e]²≤d²e², the full remainder is O(z^10).

For completeness G(z)≫log z does not require the correlation being estimated. Fixed-modulus prime distribution modulo12 gives Σ_{p≤y}g(p)=log log y+O(1) and Σ_{p≤y}g(p)log p≤C log y, with C≥1. Hence W(y)=∏_{p≤y}(1+h(p))≍log y. On squarefree divisors of the primorial, give d probability h(d)/W(y). Its expected log d is exactly Σ_{p≤y}g(p)log p. Taking y=z^(1/(2C)), Markov gives probability(d≤z)≥1/2, so G(z)≥W(y)/2≫log z. Take z=X^(1/40); then X/G(z)+O(z^10)≪X/log X. This uses exact-valuation-one exclusions, which are necessary conditions for the norms; it does not replace even valuation by absence of the prime.

API: `shiftedNorm.forbidden_card`, `.crt_count`, `.selberg_quadratic_diagonal`, `.weights_remainder`, `.intersection_bound`, `.union_constant`. Checks: for p=2 the forbidden set is {3 mod4}, of size1; for p=3 it is {3,6 mod9}, of size2; for p=11 both families contribute and #Ω_11=20, not10 or121; k=9 is allowed in A because v_3(9)=2; no unsupported independence of the two norm indicators is assumed. The finite quadratic-form proof is the local Selberg adapter, with the standard square-majorant method as in Koukoulopoulos, [49][R49], Chapter21 §§21.1–21.2 pp.213–218. The particular mod-p² sets and the primorial probability lower bound are derived here for this application.

The source asymptotic must be proved independently of the elementary upper/lower comparison; no positive limit is inferred solely from those bounds. At integer cutoff13, the union is {1,2,4,5,8,9,10,13}, of cardinality8; overlaps must be subtracted. Removing k=0 changes a count by at most1, with no effect on the asymptotic.

See [82][R82], §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [82][R82], Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* [§3.13](#s3-13); [§3.14](#s3-14); [§3.15](#s3-15).

<a id="s3-32"></a>

### 3.32 Restricted squarefree Landau asymptotic

For D(X)={n∈N:1≤n<X, n squarefree, every odd prime factor p satisfies p≡1 mod4}, there is a positive absolute C_D such that #D(X)=C_D X/√log X·(1+O(1/log X)) as X→∞. The cutoff is strict, as in KP§1. C_D=(3/(4√2))∏_{p≡1(4)}(1−p^(−2))∏_{p≡3(4)}(1−p^(−2))^(1/2), with positive convergent products.

For Re s>1 the squarefree indicator has Euler series D(s)=(1+2^(−s))∏_{p≡1(4)}(1+p^(−s)). Factor D(s)=ζ(s)^(1/2)L(s,χ_−4)^(1/2)H(s), choosing the positive branch on real s>1. Here H(s)=(1+2^(−s))(1−2^(−s))^(1/2)∏_{p≡1(4)}(1−p^(−2s))∏_{p≡3(4)}(1−p^(−2s))^(1/2). Use a quantitative Selberg–Delange transfer with leading coefficient L(1,χ_−4)^(1/2)H(1)/Γ(1/2); insert L(1,χ_−4)=π/4 and Γ(1/2)=√π. The compact-parameter transfer gives this expansion with J=2. Absolute summability of p^(−2) proves positive product convergence. A strict versus inclusive height changes the count by at most1, which fits this error as X→∞.

D(2)={1}; D(14)={1,2,5,10,13}. The integer9 is excluded despite being a sum of two squares. The p=2 Euler factor is1+2^(−s), not(1−2^(−s))^(−1); n=4 is excluded by squarefreeness. Every factor in C_D is positive; the logarithmic series is absolutely convergent.

See [51][R51], §1 pp.2–3, D(X) and classical asymptotic.

*Needs:* [§3.16](#s3-16); `Squarefree`; `DirichletCharacter.LFunction`; `riemannZeta`; [§3.12a][R163].

<a id="s3-33"></a>

### 3.33 Pretentious Halász mean bound

For multiplicative |f(n)|≤1, x≥2,T≥1, let M(x,T)=min_{|t|≤2T}D(f,n^(it);x)². Then |Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2), with an absolute C; increasing C handles bounded x.

First take a completely multiplicative g with |g|≤1. It lies in C(1), since Λ_g(p^j)=g(p)^j log p. The GHS triple-convolution Perron identity, its Shiu bound and its Plancherel estimate give Theorem1.1 and Corollary1.2 on pp.7–13. More explicitly, writing F(s)=Σg(n)n^(−s), that corollary bounds the normalized mean by (1+M_F)e^(−M_F)+log log x/log x, where e^(−M_F)log x=max_(|t|≤log x)|F(1+1/log x+it)/(1+1/log x+it)|. The maximum-principle rectangle in its proof bounds each interior vertical maximum by its left-edge maximum plus O(1); combining this with |F(1+σ+it)|≤ζ(1+σ), integrate min(e^(−M_F)log x,1/σ)dσ/σ. Splitting at σ=e^(M_F)/log x gives the factor1+M_F, with the case of bounded or negative M_F absorbed by an absolute constant.

The Euler logarithm and Chebyshev partial summation give
|F(1+1/log x+it)|≤C log x exp(−D(g,n^(it);x)²), uniformly in t.
Indeed the prime powers contribute O(1); replacing p^(−1−1/log x) by p^(−1) on p≤x and discarding p>x costs O(1) in the logarithm. For |t|≤2T this bounds the maximum by C e^(−M)log x. For |t|>2T the denominator gives C log x/T. If T≤log x, then e^(−M_F)≤C(e^(−M)+1/T), giving the desired first term plus O((1+log T)/T); also log log x/log x≪T^(−1/2). If T>log x, there is no second range. GHS Lemma2.7 supplies a positive absolute lower bound for the same maximum, so M≤log log x+O(1); this absorbs log log x/log x into (1+M)e^(−M). Bounded x and T are handled by the trivial mean bound. The phase is Re(g(p)p^(−it)), as required by the distance convention.

For general multiplicative f, let g be completely multiplicative with g(p)=f(p) and write f=g∗h. The actual Euler factors give h(p)=0 and h(p^j)=f(p^j)−f(p)f(p^(j−1)) for j≥2. Thus |h(p^j)|≤2 and Σ|h(d)|/d^σ is bounded absolutely, uniformly in f, for each fixed σ>1/2. Apply the preceding theorem to g at y=x/d for d≤√x. Since Σ_(√x<p≤x)1/p=O(1), M(y,T)≥M(x,T)−O(1), uniformly on this range. Sum with weight |h(d)|/d. For d>√x, the trivial inner bound contributes O(x^(−1/8)) after normalization, using σ=3/4. This error is absorbed by T^(−1/2) if T≤log x, and by (1+M)e^(−M) otherwise, by the preceding lower-maximum bound. This proves the full multiplicative statement without assuming |Λ_f|≤Λ.

The local theorem interfaces are `halasz_complete_euler_comparison`, `halasz_complete_height_split` and `halasz_prime_power_convolution`. Shiu and its sieve input are specified separately below, and use no Halász theorem. The convolution step retains all prime-power values of f; replacing f by g without h would be false.

For f(n)=n^(it₀), |t₀|≤2T, the twist minimum M is0, so the bound allows a nonzero mean. For f identically0 on primes the distance diagonal is not assumed to vanish; no completely-multiplicative hypothesis is imposed on general f.

See [85][R85], Theorem1.1 and Corollary1.2 p.2; full §2, especially Lemmas2.1–2.2 pp.7–9, Lemma2.6 pp.11–12, Lemma2.7 and the Corollary1.2 proof p.13. Their C(1) theorem applies directly to g; the Euler convolution above supplies general f. The classical twist convention is also stated in [84][R84], p.2.

*Needs:* [§3.18](#s3-18); [§3.45](#s3-45); the local complete-Euler, height-splitting and prime-power-convolution adapters stated here.

<a id="s3-34"></a>

### 3.34 Dickman fixed-u asymptotic

For each fixed u>0, Ψ(x,x^(1/u))/x→ρ(u) as x→∞. This statement is not uniform for u tending to infinity.

Prove the stronger milestone `dickman_compact_limit`: for fixed 0<a≤U, convergence is uniform for u∈[a,U]. Set Q(x,u)=Ψ(x,x^(1/u))/x. For u≤1, Q=floor(x)/x. Induct over U in unit steps using §3.34a. The prime-sum adapter is `prime_harmonic_rescaling`: for continuous h on [b,c]⊂(0,1), Σ_(x^b<p≤x^c)h(log p/log x)/p→∫_b^c h(t)dt/t; §0.21 gives uniform interval-mass errors O(1/log x), and step-function approximation proves the claim. In the recursion discard p>x^(1−η), 0<η<1/2, at cost at most Σ1/p=−log(1−η)+o(1), since 0≤Q≤1. On the remaining range x/p≥x^η and the recursive parameter v=log(x/p)/log p lies in [η/(1−η),U−1]. Compact-uniform induction therefore applies. The limit is 1−∫_(1/u)^1ρ(1/t−1)dt/t=1−∫_0^(u−1)ρ(v)/(v+1)dv=ρ(u). First send x→∞, then η↓0; continuity handles u=1 and the moving lower endpoint uniformly. This proves compact uniformity, with no growing-U assertion.

The specialization u=1 has exact Ψ(x,x)=floor x for x≥2. At u=2 the limit is1−log2. Constants may depend on a fixed compact u range; this yields no growing-u uniformity.

See [86][R86], Introduction p.411 (terminology); unnumbered fixed-u limit preceding (1.5)–(1.6), p.414. Equations (1.5)–(1.6) specify the delay equation and initial data.

*Needs:* [§3.20](#s3-20); [§3.21](#s3-21); [§0.21](#s0-21); `Nat.mem_smoothNumbersUpTo`; [§3.34a](#s3-34a); the compact-limit and prime-rescaling adapters above.

<a id="s3-34a"></a>

**§3.34a Largest-prime-factor smooth decomposition.** For x≥1,y≥2, Ψ(x,y)+∑_{y<p≤x, p prime}Ψ(x/p,p)=floor x. Each positive non-y-smooth integer has a unique largest prime divisor p>y, and dividing by one copy of p leaves a p-smooth integer. Repeated largest primes are permitted.

Partition the finite set of positive n≤floor x into y-smooth integers and those whose largest prime factor is p>y. The latter p satisfies p≤x. For each p use n↦n/p and m↦p*m to identify its fibre with positive p-smooth m≤floor(x/p). Repeated p in m is allowed; a p-rough or strict-p-smooth fibre would be wrong. Sum disjoint fibre cardinalities and account for1 in the smooth fibre.

See [86][R86], Introduction, printed p.411 (terminology); p.414 unnumbered fixed-u limit preceding (1.5)–(1.6); elementary largest-prime partition used for its limiting recursion.

<a id="s3-35"></a>

### 3.35 Rankin smooth-number upper bound

For x≥1,y≥2 and σ>0, Ψ(x,y)≤x^σ∏_{p≤y}(1−p^−σ)^−1. The finite-prime Euler product is finite and each geometric series converges.

For each counted positive n≤x and σ>0,1≤(x/n)^σ. Bound the finite count by x^σ times its finite n^(−σ) sum. Enlarge to the summable nonnegative series over all positive y-smooth integers, using the separately named finite-prime Euler-series lemma. Apply the geometric factorization. For x=1, Ψ=1 and all Euler factors exceed1, so the bound includes the endpoint.

The bound is valid for every σ>0, includingσ≤1; only finitely many primes occur. For x=1 the count is1; σ=0 is excluded because the geometric factors are not summable.

See [86][R86], Introduction, printed p.411 (terminology); p.414 equation(1.3), page image.

*Needs:* [§3.20](#s3-20); `Nat.equivProdNatFactoredNumbers`; [§3.35a](#s3-35a).

<a id="s3-35a"></a>

**§3.35a Finite-prime smooth Dirichlet series.** For y≥2 and σ>0, the nonnegative real series ∑_{n≥1, n y-smooth}n^(−σ) is summable and equals ∏_{p≤y}(1−p^(−σ))^(−1). This is a finite-prime identity valid for every positive σ, even σ≤1.

Use Nat.equivProdNatFactoredNumbers inductively on the finite set of primes≤y to index smooth positive integers by their independent nonnegative prime exponents. Each p≥2 has0<p^(−σ)<1. Its geometric series is summable; finite products/Tonelli and rpow multiplication factor the sum. The zero integer is excluded by the existing carrier. Identify the finite prime set with primes strictly below floor y+1. No infinite-prime Euler product on Re s>1 is substituted for this stronger finite-prime statement.

See [86][R86], Introduction, printed p.411 (terminology); p.414 equation(1.3), finite-prime geometric factorization.

<a id="s3-36"></a>

### 3.36 Zeta function of an indexed Beurling system

For an indexed Beurling prime system P and Re s>1 with Σ_(a∈N^(N))norm_P(a)^−σ summable for every real σ>1, define ζ_P(s)=Σ_a exp(−s log(norm_P(a))) over finitely supported exponent vectors. Repeated prime values remain different indices. The totalized sum outside this domain is not its analytic continuation.

Compact subsets of Re s>1 admit a fixed summable real majorant from a smaller real exponent σ₀>1. Independent geometric sums on finite prime-index sets converge to the vector series. Summable logarithmic factors give a nonzero limit.

- `beurling_zeta.summable`: The exponent-vector complex series is absolutely summable on Re s>1 under the stated real convergence hypothesis.
- `beurling_zeta.nonzero`: ζ_P(s)≠0 on Re s>1 under the same hypothesis.
- `beurling_zeta.analytic`: ζ_P is analytic on a neighbourhood of every point of Re s>1.

**Checks.**

- For the indexed ordinary primes, ζ_P(s)=ζ(s) on Re s>1.
- On Re s>1, if every ordinary prime appears at two consecutive indices, ζ_P(s)=ζ(s)².
- The zero exponent vector contributes exactly1 for every s.

See [90][R90], §2.1, (5)–(7) and discrete Euler product, printed pp.2–3.

*Needs:* [§3.25](#s3-25); [§3.36a](#s3-36a).

<a id="s3-36a"></a>

**§3.36a Beurling counting growth from summability.** For a Beurling system P, real σ>0 and S=Σ_a norm(a)^−σ with summable nonnegative summands, N(x)≤S x^σ for x≥1, and π_P(x)≤N(x). Thus convergence for every σ>1 gives N(x),π_P(x)=O_ε(x^(1+ε)) for every ε>0.

Each counted vector satisfies1≤x^σ norm(a)^−σ. Bound its finite sum by the full summable nonnegative sum. Map each counted prime index injectively to its unit exponent vector. Repeated equal real primes remain distinct vectors.

See [90][R90], §2.1 p.3, growth deduction after (6).

<a id="s3-36b"></a>

**§3.36b Rough progression sieve with its remainder.** For integers q≥1, (a,q)=1, real X≥H>q and z≥2, the count of X−H<n≤X, n≡a mod q, with no prime divisor≤z is at most C H/(φ(q)log z)+Cz², with an absolute C. Modulus one is included. This supplies Shiu Lemma2 p.164, whose printed proof refers to a sieve book.

Write n=a+qt. For p∤q the excluded condition p|n is one residue of t mod p; for p|q it never occurs. CRT gives a density1/d and an error≤1 for every squarefree d coprime to q. Apply the same finite square-majorant diagonalization used for the norm intersection, now g(p)=1/p, h(p)=1/(p−1), and weights supported on d≤z, (d,q)=1. It gives Q=1/G_q(z), where G_q(z)=Σ_{d≤z,(d,q)=1}μ²(d)/φ(d). The explicit inversion bounds |λ_d|≤d/φ(d), so Σ_{d≤z}|λ_d|≤Cz: expand d/φ(d)=Σ_{e|d}μ²(e)/φ(e) and use convergence of Σ_e μ²(e)/(eφ(e)). Thus the complete CRT error is at most C z². Also G_1(z)≤(q/φ(q))G_q(z), by splitting each squarefree integer into its q-part and coprime part and increasing each remaining cutoff to z. Finally G_1(z)≥Σ_{d≤z}μ²(d)/d≫log z; the squarefree density lower bound follows by the union bound over square divisors (Σ_{m≥2}m^(−2)<1), followed by partial summation. Combine these inequalities with the interval length H/q. No level-of-distribution assumption is used.

API: `roughProgression.crt_density`, `.selberg_weights`, `.weight_l1_bound`, `.uniform_modulus`, `.upper_bound`. Checks: q=1 uses the same proof; a not coprime to q is rejected (a progression divisible by a small p has a different density); z>H is allowed because the z² term is retained; replacing the local density by1/φ(d) would already fail at p=2. Source: Shiu, [91][R91], Lemma2 p.164 and its uses pp.167–169; the finite weight computation here supplies the previously external step.

*Needs:* [§3.31a](#s3-31a); `Nat.chineseRemainder`; finite Möbius inversion; [ArithmeticDirichletSeries layer6][R1].

<a id="s3-37"></a>

### 3.37 Shiu bound for the Halász coefficient class

For fixed κ>0 and 0<ε<1 there are C(κ,ε)>0 and X(κ,ε)>1 such that for every f∈C(κ), x≥X, x^ε≤z≤x, positive integer q≤z^(1−ε), and integer a coprime to q, the sum of |f(n)| over positive integers x−z≤n≤x with n≡a mod q is at most C z/(φ(q) log x) exp(Σ_{p≤x, p∤q}|f(p)|/p). The constants are independent of f,a,q,z. Modulus one is included.

Assume The coefficient class uses ordinary coprime multiplicativity and zero extension at n=0.

Apply the Euler logarithmic coefficient majorant to obtain |f(p^j)|≤dκ(p^j). For the integer r=ceil(max(1,κ)), generalized-binomial coefficient monotonicity gives dκ(p^j)≤d_r(p^j)≤(j+1)^r and dκ(p^j)≤r^j. Multiply at coprime prime powers to obtain |f(n)|≤τ(n)^r; the existing explicit divisor bound supplies every n^δ bound, with constants depending only on κ,δ. Thus the nonnegative multiplicative function |f| satisfies Shiu’s two growth conditions with uniform constants. Follow the four classes in the proof of Theorem 1: small-prime factor b≤z^(α/10), rough cofactor, excessive prime-power factor, very smooth factor, and the remaining Rankin tail. Lemmas 1,3,4 control the smooth and reciprocal sums; the rough progression estimate is Lemma 2. The rough progression sieve above supplies Lemma2, including its z² remainder and uniform q dependence. In Shiu’s notation its sieve cutoff is y^(α/10); keep it distinct from this theorem’s interval length z. The factorization is by increasing primes with full prime powers, so the two factors are coprime. Classes I and IV use the sieve after fixing b. Classes II and III have count O((y/q)z₀^(−1/4)), and uniform subpower growth raises this to a weighted bound O((y/q)z₀^(−1/8)), where z₀=y^(α/10). Class IV sums (r+1)A₅^r exp(−r log r/10), a convergent series for fixed κ,α,β. These estimates absorb the sieve remainders because q<y^(1−α). To include endpoints q≤z^(1−ε) and z≥x^ε, choose smaller positive α,β<min(ε,1/2). The proof also works for q=1; changing the lower endpoint adds at most one term. Choose its subpower exponent smaller than ε²/2; the right-hand side is at least a constant times z/(q log x)≥x^(ε²)/log x, so it absorbs that term uniformly.

Retain the reduced-residue hypothesis and the uniform dependence on κ,ε. For q=1 and z=x this gives the usual multiplicative mean majorant. The function n↦2^Ω(n) fails the subpower condition: its values at powers of 2 prevent applying Shiu’s theorem.

See [91][R91], Theorem 1, pp.162–163; Lemmas 1–4 and proof §§4–5, pp.164–169; [85][R85], Lemma 2.3 and its application, pp.9–11.

*Needs:* [§3.19][R287]; [§3.1](#s3-1); `ArithmeticFunction.IsMultiplicative`; `Chebyshev.psi_le_const_mul_self`; [§3.36b](#s3-36b).

<a id="s3-38"></a>

### 3.38 Eventual unit-constant divisor bound

For each δ>0 there exists a natural N≥1 such that every natural n≥N satisfies τ(n)≤n^δ. If C≥1 is the uniform constant at ε=δ/2, any natural N≥max(1,C^(2/δ)) suffices.

Use uniform-divisor-subpower-bound with ε=δ/2. Choose natural N≥max(1,C^(2/δ)) using exists_nat_ge. For n≥N, monotonicity of positive real powers and Real.rpow_mul give C≤n^(δ/2). Apply absorb-divisor-bound-constant.

N≥1 excludes the library's totalized zero input. Replacing δ by 2ε gives the equivalent eventual form used in the divisor estimate. The result makes no universal claim at n=2.

See [79][R79], Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* [§3.26](#s3-26); `Real.rpow_add`; `Real.rpow_nonneg`; `exists_nat_ge`; `Real.rpow_le_rpow`; `Real.rpow_mul`; [§3.38a](#s3-38a).

<a id="s3-38a"></a>

**§3.38a Absorption of the divisor-bound constant.** For n>0 and ε,δ,C∈ℝ, if τ(n)≤C n^ε and C≤n^(δ−ε), then τ(n)≤n^δ.

Here n>0; the two displayed inequalities.

Multiply C≤n^(δ−ε) by n^ε≥0 and compose with the first inequality. Apply Real.rpow_add at positive n and simplify (δ−ε)+ε=δ.


<a id="s3-39"></a>

### 3.39 Von Mangoldt truncation error

E_z(n)=Λ_even(n)−Λ_z(n), for n∈Z and z≥1.

Subtract the two real-valued functions on ℤ. Their evenness yields evenness of E_z. At n=0 use vonMangoldt(0)=0 and the finite cutoff sum, giving E_z(0)=Σ_{1≤d≤z}μ(d)log d. At n≠0 and z≥|n| use the divisor identity through truncated_von_mangoldt.large_cutoff, giving E_z(n)=0.

- `mangoldt_truncation_error.sub`: E_z is the displayed difference.
- `mangoldt_truncation_error.neg`: E_z(−n)=E_z(n).
- `mangoldt_truncation_error.zero`: E_z(0)=Σ_{1≤d≤z} μ(d)log d.

**Checks.**

- E_2(0)=−log 2.
- For p>z, E_z(p)=log p.
- For n≠0 and z≥|n|, E_z(n)=0.

E_2(0)=−log 2.

See [58][R58], §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* [§3.8](#s3-8); [§3.29](#s3-29).

<a id="s3-40"></a>

### 3.40 Wintner-type mean over prime divisors

For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.

Set g(1)=1, g(d)=|μ(d)|∏_(p|d)((1+f(p))^n−1) for d>0 and g(0)=0. Finite expansion gives a=1∗g. Binomial bounds give |g(p)|≤K_(n,c)/p, K≥1; for squarefree d, |g(d)|≤K^ω(d)/d≤τ(d)^α/d, α=max(1,logK/log2). Divisor subpower at1/(4α) gives |g(d)|≤B_(n,c)d⁻³ᐟ⁴, so M=Σ|g(d)|/√d<∞ uniformly after n,c. The squarefree-mean note identifies C=Σg(d)/d with its Euler product. In Σ_(t≤x)a(t)=Σ_(d≤x)g(d)floor(x/d), floor replacement and the C-tail each cost≤√xM. No new generic Wintner supplier is needed.

For n=0, a(t)=1 and C=1; the discrepancy is floor(x)−x, of absolute value at most 1. For n=1 with f(2)=1/2 and f(p)=0 for all odd primes, C=5/4 and the exact sum is floor(x)+(1/2)floor(x/2). For complex f(p), all error estimates use absolute values and the constant depends only on n,c, not on the particular function f.

See [58][R58], Lemma4.3 and full proof, published pp.705–706, equations(4.2)–(4.3).

*Needs:* `ArithmeticFunction.mul_apply`; `ArithmeticFunction.moebius`; [§3.26](#s3-26); [§3.40a](#s3-40a).

<a id="s3-40a"></a>

**§3.40a Integrated prime-divisor mean.** With a,C as in the prime-divisor mean lemma, ∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1.

For every t≥1 integrate its indicator over 0≤x≤T: the integral is T−t when t≤T and zero otherwise. Interchange only the finitely many nonzero terms. Integrate the mean estimate on [1,T]; on [0,1) the count is zero and the integral of Cx is bounded by a constant depending only on n,c. The remainder integral is at most a fixed multiple of T^(3/2).

See [58][R58], Lemma4.3, published pp.705–706.

<a id="s3-41"></a>

### 3.41 Restricted squarefree Sathe–Selberg bounds

Let D_r(N)={n∈D(N):ω(n)=r}, with D(N) the strict-cutoff squarefree family defined in restricted_squarefree_landau_count and ω(n) the number of distinct prime divisors. For every fixed A>0 there are C₁,C₂>0 and N₀≥3, depending only on A, such that for every real N≥N₀ and integer1≤r≤A log log N, C₁(N/log N)(½ log log N)^(r−1)/(r−1)!≤#D_r(N)≤C₂(N/log N)(½ log log N)^(r−1)/(r−1)!. No r=0 or varying-A uniformity is asserted.

Mark each distinct prime divisor by z in D(s,z)=(1+z2^(−s))∏_{p≡1(4)}(1+zp^(−s)); extract the z^r coefficient. The half-density prime set gives singular exponent z/2. Apply the compact-parameter transfer on |z|≤R with R>2A+2, using the squarefree prime-power bound |f_z|≤τ_k for k≥R. For λ=(log log N)/2, its leading term is (N/log N) z A_0(z)e^{λz}, where A_0(z)=Q_z(1)/(2Γ(1+z/2)). This is analytic on every fixed disk and strictly positive for real z≥0: Q_z(1) is the positive real Euler residual. In particular A_0(0)=1/2. Every lower-order term is likewise z times an analytic bounded function on that disk, divided by an additional power of log N. Take enough terms to make the remaining uniform absolute error N(log N)^(−B), for any chosen B.

The coefficient step is elementary and uniform up to r=A log log N. If A_0(z)=Σ a_j z^j, m=r−1 and m≤2Aλ, then
[z^m](A_0(z)e^{λz})/(λ^m/m!)=Σ_{j≤m}a_j (m)_j/λ^j=A_0(m/λ)+O_A(1/λ).
Cauchy gives |a_j|≤C R^(−j). For j≤m compare (m)_j with m^j, with error at most j(j−1)m^(j−1)/2; the remaining j>m geometric tail obeys the same O_A(1/λ) bound (m=0 is exact). Thus the positive minimum and finite maximum of A_0 on [0,2A] give the two constants. Apply the same coefficient estimate to the finitely many analytic lower-order terms. For the absolute remainder use the Cauchy circle |z|=r/λ (or 1/λ when r=1); Stirling bounds show its ratio to the asserted main scale is O_A((log N)^{−B+1+A}√(r+1)λ), so B>A+3 suffices. The endpoint difference between n≤N and n<N has weight at most R^ω(n)≤τ_k(n); its subpower bound makes its coefficient contribution negligible uniformly in this range. This independently proves the full fixed-A range. CKMP p.13 is used only for its smaller displayed range, not as the coefficient-transfer supplier.

For r=1 the family counts2 and primes≡1 mod4 below N, and has size asymptotic N/(2 log N). D_0(N)={1} for N>1 and is outside the theorem; at N=14 the r=1 and r=2 counts are3 and1 respectively. Constants are fixed after A, before N and r; a fixed-r theorem alone cannot justify r of order log log N.

See [51][R51], §7.1 Theorem7.2, (7.3), p.60; proof citing[8] p.13; [92][R92], §4 opening, p.13.

*Needs:* [§3.32](#s3-32); [§3.12a][R163].

<a id="s3-42"></a>

### 3.42 Beurling PNT with all logarithmic remainders

For a discrete Beurling system whose ζ converges on Re s>1, π_P(x)=Li(x)+O_m(x/log^m x) for every m≥1 iff N(x)=ax+O_m(x/log^m x) for every m≥1 for some a>0. Each error constant may depend on m and the system.

Replace π by Π using the separate higher-prime-power correction. Fix Li(x)=∫_2^x dt/log t for x≥2; any additive constant is swallowed by every stated error. Each m has its own constant and eventual threshold. For S(u)=N(exp u), T(u)=a exp u, use Theorem3(i)⇔(ii)⇔(iii). G(s)=ζ_P(s)−a/(s−1) is represented by its smooth closed-half-plane extension, not a junk-valued subtraction at1. Condition(ii) has one fixedε>0 controlling every derivative (with derivative-dependent constants); condition(iii) is uniform onσ>1 for eachε>0 and each derivative. Proposition1 provides the Abelian direction by integration by parts and X=|t|^(1/γ). Theorem2 gives the reverse direction from a C∞ Laplace boundary with bounds G^(n)(1+it)=O(|t|^β_n), β_n/n→0, using monotonicity and T′≤A exp u. Its normalized Δ(u)=exp(−u)(S−T)(u), one-sided bump/Fourier smoothing and n-fold integration by parts produce Δ(h)=O(h^(−n/(β_n+1))). The exact local interfaces and smoothing estimate are specified below. Theorem3 Lemma1 uses the3–4–1 inequality and derivative bounds to prove (s−1)ζ_P nonzero on the closed half-plane and1/ζ_P=O_ε((1+|t|)^ε). Use the Euler-series logarithm and its continuous extension, normalized on realσ>1. Apply the same Tauberian/Abelian pair to S₁(u)=Π(exp u), T₁(u)=∫_1^(exp u)(1−1/y)/log y dy. Its transform is log((s−1)ζ_P(s))−log s on the matched analytic branch. The stronger Proposition1 bound o(log|t|) controls exponentiation in the reverse implication; a=exp G₁(1)>0 and smooth division by s−1 removes the apparent pole.

The density a>0 is quantified once, before all m. Error constants and eventual cutoffs may depend on P and m. Taking each ordinary prime twice gives N(x)∼x log x andπ_P(x)∼2Li(x), so neither side holds. Convergence alone does not force density1. The residue-subtracted boundary at1 is the extension value; no equality with the totalized series value there is asserted.

See [90][R90], Theorem1 p.2; entire §§3–4 pp.4–11, Theorem2, Proposition1, Theorem3, Lemma1.

*Needs:* [§3.25](#s3-25); [§3.36](#s3-36); [§3.42b](#s3-42b); [§3.36a](#s3-36a); [§3.42c](#s3-42c).
<a id="s3-42a"></a>

**§3.42a Smooth Laplace boundary and one-sided remainder.** Use Debruyne–Vindas, [On general prime number theorems with remainder][R93], Theorem2 and its proof pp.4–5, Proposition1 pp.6–7, Theorem3 and Lemma1 pp.7–11, with their Fourier convention \hat f(t)=∫e^(−itu)f(u)du. The input is a nondecreasing, right-continuous S supported on [0,∞), a locally bounded-variation T, eventually absolutely continuous with T′≤Ae^u, and convergence of L(dS−dT) for Re s>1. The boundary is a C∞ extension of this transform, with |G^(n)(1+it)|≤C_n(1+|t|)^{β_n} and β_n/n→0. No ordinary prime spacing or density hypothesis is added.

The remainder contract is S(u)−T(u)=O_m(e^u/u^m) for every m. To prove it, modify T on a bounded interval and split its positive/negative variation, so 0≤T′≤Ae^u. Set Δ(u)=e^(−u)(S−T)(u), zero on negative u. Integration by parts gives LΔ(s)=G(s+1)/(s+1). The boundary/Fourier adapter identifies its distributional Fourier transform with G(1+it)/(1+it); its n-th derivative is O_n((1+|t|)^{β_n−1}) after making β_n nondecreasing. It is this polynomially controlled boundary, obtained by limits of the damped Laplace transforms tested against Schwartz functions, that licenses the Fourier pairing. One does not presume Δ is integrable or begin by Fourier-transforming an uncontrolled pointwise error.

Monotonicity gives a one-sided persistence interval: if Δ(h)>0 and 0≤v≤min(Δ(h)/(2A),log(4/3)), then Δ(h+v)≥Δ(h)/4; for Δ(h)<0 use the backward interval and the analogous negative bound. The A=0 case uses the fixed interval directly. Choose a nonnegative smooth unit-mass bump supported in (0,1), or (−1,0), and rescale it to width δ. Fourier inversion of the smoothed error, followed by n integrations by parts, gives
|Δ(h)|≤C_n h^(−n) δ^(−β_n).
The estimate follows by the product rule and the Schwartz seminorms of the bump transform, uniformly for 0<δ≤log(4/3); all boundary terms vanish. First the fixed-width alternative forces Δ(h)→0. Then δ=|Δ(h)|/(2A) yields |Δ(h)|≤C_n h^{−n/(β_n+1)}. For any required m choose n with n/(β_n+1)>m. This retains the derivative-index dependence needed for every logarithmic remainder.

For the converse, assume all m remainders with one fixed T. Split the Stieltjes integral at X and integrate its tail by parts. For γ>n+1, differentiating n times bounds the compact piece by C_n X^(n+1), and the tail by C_(n,γ)(1+|t|)X^(n−γ+1), uniformly 1≤σ≤2. Set X=|t|^(1/γ). Let γ be arbitrarily large to get O_(n,ε)((1+|t|)^ε); σ≥2 is directly absolutely convergent. When T′≤Be^u/u, the compact piece is O(log X) for n=0; making γ arbitrarily large gives G=o(log|t|). The smooth extension follows from absolute convergence of each differentiated remainder integral, choosing m after n. Uniform bounds for all interior derivatives also imply a smooth boundary extension by the fundamental theorem of calculus on compact rectangles; this supplies Theorem3(iii)→(ii) without a new unquantified boundary-value assumption.

For the reciprocal step, the Euler logarithm gives |ζ(η)^3ζ(η+it)^4ζ(η+2it)|≥1, η>1. Since ζ(η)∼a/(η−1), a hypothetical zero at1+it would give (η−1)^3=O((η−1)^4), using the bounded first derivative locally. For |t| large the derivative estimate gives |ζ(σ+it)−ζ(η+it)|≤C(η−1)|t|^ε. Take η−1=c|t|^(−5ε); the 3–4–1 lower bound then gives |ζ(σ+it)|≥c′|t|^(−4ε), both for σ≤η and, directly, for η≤σ≤2. Compact heights use nonvanishing of (s−1)ζ; σ≥2 uses the Euler product. Relabel ε to obtain the required subpower bound for 1/ζ and, by differentiation, for the logarithmic boundary derivatives.

The logarithm in G_1=log((s−1)ζ(s))−Log s is the analytic branch continued from the real half-line; a pointwise principal logarithm of ζ(s) would be unjustified. Its boundary derivatives have subpower growth by the reciprocal estimate. Conversely G_1=o(log|t|) implies exp(G_1)=O_ε(|t|^ε). At1 its real value fixes a=exp(G_1(1))>0 once, before all error exponents. Smooth pole division is explicit: for a smooth boundary extension F with F(1)=a, (F(s)−a)/(s−1)=∫_0^1 F′(1+v(s−1))dv on the closed right half-plane. Apply the preceding all-derivative domination to this integral. The transform identity for S_1=Π(e^u) and T_1=∫_1^{e^u}(1−1/y)/log y dy then closes both implications.

API: `beurlingBoundary.laplace_fourier`, `.one_sided_persistence`, `.smoothed_remainder`, `.all_remainders`, `.abelian_derivatives`, `.sublogarithmic_bound`, `.reciprocal`, `.pole_division`. Checks: a is unchanged when m changes; doubled ordinary primes fail the simple-pole hypothesis; ζ_P's totalized value at1 is never used; β_n=n would not yield all m and is rejected; additive constants in Li are absorbed in all eventual remainders.


<a id="s3-42b"></a>

**§3.42b Beurling zeta and Euler product.** If Σ_n n^−σ (with generalized-integer multiplicities) converges for every real σ>1, then ζ_P(s)=Σ_n n^−s=∏_j(1−p_j^−s)^−1 on Re s>1, absolutely and locally uniformly. The convergence hypothesis is additional to the prime-system axioms.

Define ζ_P(s) by the summable exponent-vector series exp(−s log norm(a)); keep the additional summability assumption for every realσ>1. For the first M indexed primes, independent geometric summation gives the finite Euler product, with ratio p_j^(−s) of norm<1. Exhaust all finite-support vectors with the first M indices. On a compact K⊂{Re s>1}, choose1<σ₀<inf_K Re s; norm(a)≥1 makes the summable norm(a)^−σ₀ series a uniform majorant. The finite-prime tails converge uniformly to the full series. For a nonzero Euler product, additionally sum the logarithmic local factors using |p_j^(−s)|≤p_j^−σ₀ and the prime-index-to-vector injection. The normalized analytic logarithm is this convergent sum, not an arbitrary pointwise principal logarithm of ζ_P.

See [90][R90], §2.1 pp.2–3, (5)–(7) and displayed discrete Euler product.

<a id="s3-42c"></a>

**§3.42c Beurling higher-prime-power correction.** For x≥1, J=floor(log x/log p₁) and Π_P(x)=Σ_{1≤j≤J}π_P(x^(1/j))/j, all later terms are0. For x≥p₁, 0≤Π_P(x)−π_P(x)≤π_P(sqrt x)+π_P(x^(1/3))log x/log p₁. Under convergence for every σ>1, the difference is O_ε(x^(1/2+ε)) for every ε>0.

Use p₁>1 to bound j for any prime power≤x. Isolate j=1 and j=2; for3≤j≤J use x^(1/j)≤x^(1/3) and bound1/j≤1. Apply the counting-growth lemma at exponent1+η with0<η<2ε. Absorb the logarithm in the strictly smaller exponent for the j≥3 contribution. The finite low-x range changes only the constant.

See [90][R90], §2.1 p.3, (7) and subsequent prime-power bounds.

<a id="s3-43"></a>

### 3.43 Mangoldt weight in a Fourier window

For each fixed c₀>0 there is C(c₀)>0 such that for every real T≥1 and m≥T², Σ_{n≥1, |log(n/m)|≤c₀/T}Λ(n)≤C(c₀)m/T. The sum includes all prime powers, with Λ(1)=0.

Put X=mexp(c₀/T), H=m(exp(c₀/T)−exp(−c₀/T))≈_(c₀)m/T. If H≈X use Chebyshev; absorb bounded m in C(c₀). Otherwise large-window primes exceed m^1/4. The rough indicator (all prime factors>m^1/4) belongs to C(1), with logarithmic coefficientsΛ at allowed powers. Apply uniform Shiu at q=1 and fixedε<1/2; H≳√m ensures its range. Chebyshev/partial summation bounds Σ_(m^1/4<p≤X)1/p=O_(c₀)(1), giving O_(c₀)(H/log m) primes and Λ-mass O(H). Higher powers cost Σ_(j≥2)θ(X^1/j)≤C√X: the j≥3 sum≤X^1/3log₂X=O(√X). Since m≥T², √X≲_(c₀)m/T. Add both contributions.

The Fourier support radius is c₀ and its contribution to C is explicit in the quantifiers. The proof includes prime squares and higher powers; a prime-count estimate alone does not establish the statement. The condition m≥T² is retained. A window with m=2^j and T arbitrarily large would contain weight log 2 while m/T tends to zero.

See [85][R85], Lemma 2.6, p.11, last paragraph of its proof; [91][R91], Theorem 1, pp.162–163.

*Needs:* [§3.37](#s3-37); [§3.19][R287]; `Chebyshev.psi_le_const_mul_self`; [ArithmeticDirichletSeries 6][R1].

<a id="s3-44"></a>

### 3.44 Uniform cancellation of the truncation error E_z (Corollary 3.3)

For A>0 and y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A.

Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff. Keep y,z≥2 so no negative power of log1 occurs.

See [58][R58], Corollary3.3 and proof reference, published p.691.

*Needs:* [§3.39](#s3-39); [§1.2](#s1-2); [§3.44a](#s3-44a).

<a id="s3-44a"></a>

**§3.44a Two-sided error and the zero term.** For y,z≥2 and A>0 the two-sided sum Σ_{|r|≤y}E_z(r)e^(irα) has absolute value ≤2C_A y(log y)(log z)^−A+|E_z(0)|. The zero term is bounded separately by O_A(z(log z)^−A).

Pair the positive and negative summands using evenness; apply the positive estimate to α and −α. Use Möbius cancellation and partial summation for the finite zero sum.

See [58][R58], §3.1 definitions and Corollary3.3, published p.691.

<a id="s3-45"></a>

### 3.45 Halász integral mean bound

For fixed κ>0, f∈C(κ) and sufficiently large x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x. The constant is uniform in f.

Use the small/large-prime convolution split, the exact double-integral identity Lemma2.2, Shiu upper bound Lemma2.3, errors Lemmas2.4–2.5 and Proposition2.1. The locally owned Shiu target supplies the short-interval estimate; its rough-progression weight estimate is specified above. Take T=(log x)^(κ+1), y=T²=(log x)^(2κ+2), η=1/log y; for sufficiently large x these satisfy the Proposition2.1 range1≤T≤x^(9/10),10≤y≤sqrt x. Apply the separate single-Λ weighted mean-square lemma to the two large-prime polynomials, then Cauchy–Schwarz and Chebyshev weighted summation(2.6). The ordinary unweighted mean-square result cannot replace this step. After integrating α, set σ=β+1/log x. Restrict the t maximum from T to(log x)^κ using |F(1+σ+it)|≤ζ(1+σ)^κ and its denominator; the tail contributes O_κ(x/log x). Enlarge the σ interval to1 and combine O_κ(x(log log x)^κ/log x) errors.

Constants and the sufficiently-large-x threshold depend only on κ, before quantifying over f∈C(κ). The maximum is of |F(s)/s|, not |F(s)|; the final t range is (log x)^κ, while the proof uses the larger auxiliary T.

See [85][R85], Theorem1.1 p.2; §2 pp.7–12, Lemmas2.2–2.6, Proposition2.1 and final proof.

*Needs:* [§3.37](#s3-37); [§3.43](#s3-43); [§3.19][R287]; [ArithmeticDirichletSeries 6][R1]; `Chebyshev.psi_le_const_mul_self`; [§3.45a](#s3-45a).

<a id="s3-45a"></a>

**§3.45a Prime-weighted Dirichlet-polynomial mean bound.** There is an absolute C>0 such that for T≥1, x≥1 and any complex coefficients a(n), the integral from −T to T of |∑_{T²≤n≤x}a(n)Λ(n)exp(−it log n)|² is at most C∑_{T²≤n≤x}n|a(n)|²Λ(n). The finite sums use inclusive real cutoffs. If x<T² they are empty.

Use the nonnegative even majorant Φ(t)=(sin(t)/t)²/(sin1)², continuously extended at0, whose Fourier transform has fixed compact support; enlarge the integration interval and expand the finite square. The off-diagonal kernel is supported where |log(n/m)|≪1/T. Use 2|a(m)a(n)|≤|a(m)|²+|a(n)|² and symmetry. Apply the local Mangoldt short-window bound of Layer 3 to each n-centered window; use the diagonal/coefficient majorant and preserve the stated κ, T and y dependence. Under the angular Fourier convention above, the exact transform is π(2−|u|)_+/(2 sin²1), so its support is [−2,2]; use c₀=2 in the window estimate. This avoids importing a numerical support radius from a different Fourier convention. The rough-number indicator has logarithmic coefficient Λ(n) on prime powers of primes above the cutoff and zero elsewhere, giving its concrete C(1) witness. Absolute convergence follows from the ordinary ζ majorant.

See [85][R85], §2.3 Lemma2.6 and its complete proof, p.11.

### Proof-route checks

- §3.33 deduces Halász's distance form through complete Euler products, height splitting and prime-power convolution from the GHS integral theorem. [§3.36b](#s3-36b) supplies Shiu's finite-remainder sieve, including q=1. Keep generalized-binomial/divisor domination, exact double-integral Perron, weighted Plancherel and the rough-number C(1) witness. The Fourier window has angular support[−2,2] and all prime powers ([§3.19][R287], [§3.45](#s3-45), [§3.33](#s3-33), [§3.37](#s3-37), [§3.43](#s3-43)).
- Dickman construction glues consecutive intervals with the negative-argument convention. Its fixed-u limit needs quantitative prime partial summation in the largest-prime recursion, terminal control and compact-u convergence; it gives no growing-u asymptotic ([§3.21](#s3-21), [§3.34](#s3-34), [§3.35](#s3-35)).
- §3.22 uses the finite divisor-pair bijection and Euler harmonic bounds, without PNT. The quantitative second moment uses the half-endpoint divisor remainder, positive-axis Bessel remainders, conditional Voronoi convergence, both quantitative saddle families and the explicit Atkinson budget (§§3.23a–g). Their build order is a,b,c,d,e,f,g; in particular the moving-saddle estimates precede the Voronoi integrated exchange. The fourth moment uses the four explicit auxiliary estimates and diagonal/off-diagonal decomposition of §3.24; no Heath-Brown error estimate is assumed.
- [§3.42a](#s3-42a) requires Laplace–Stieltjes integration by parts, tempered Fourier boundary, one-sided bump and β_n/n→0 optimization. Conversely retain all-derivative Abelian bounds, o(log|t|), weak-boundary upgrade,3–4–1 reciprocal bounds and smooth pole division. Ordinary Wiener–Ikehara cannot replace these measure adapters ([§3.42](#s3-42)).
- §3.6 needs a complete inverse-totient O(x) proof; Smati's stronger statement and finite computation alone are insufficient.
- [§3.12a][R163] retains every truncation order, divisor bound, branch, residual derivatives and compact-parameter constants. [§3.12b](#s3-12b) and §3.14 give positivity; [§3.31a](#s3-31a)'s O(K/log K) intersection suffices for C_L+C_E. Retain residue-character expansion, maximal exponent, positive residual and outside-subgroup zero counts, without varying-modulus uniformity ([§3.13](#s3-13), [§3.14](#s3-14), [§3.31](#s3-31), [§3.16](#s3-16)).
- §3.40 needs a=1∗g, uniform Σ|g(d)|/√d<∞ and C=Σg(d)/d. §3.10 passes from finite positive Gamma-tail subproducts to every retained infinite subset by local binomial bounds and summable logarithms.

### Examples

The divisor bounds include n=1, where τ(1)=1, and exclude n=0. With the inclusive smooth cutoff, Ψ(8,2)=4, from 1,2,4,8; Ψ(6,3)=5, excluding 5. The strict-cutoff Mathlib parameter is ⌊y⌋+1. Pretentious distance from 1 to itself is zero; the completely multiplicative function taking −1 at each prime has positive distance from 1 once the range contains a prime. A finite reciprocal sum over y-smooth integers up to x is bounded by the full finite-prime Euler product, and is generally smaller: at x=y=2 the values are 3/2 and 2.

### Dependencies

Mathlib prime factorization, divisors, convolution, Möbius and von Mangoldt functions; ArithmeticDirichletSeries Euler products, Abel and Perron summation; Layer 0 prime estimates; Layer 1 Dirichlet-polynomial means and Fourier estimates. The second moment also consumes the lower-tier K and J supplier contracts above; its Y function, divisor transform and quantitative saddle adapters are local. The short-interval and Mangoldt-window estimates are owned here, so no later sieve or circle-method roadmap is a prerequisite.

## Downstream consumers

Quantitative arithmetic consumers import the prime-error, Hecke/Artin, class-number and multiplicative-mean interfaces above.

## References

- **47.** [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums][R47].
- **48.** [Michael A. Bennett, Greg Martin, Kevin O'Bryant and Andrew Rechnitzer — Explicit bounds for primes in arithmetic progressions][R48].
- **49.** [Dimitris Koukoulopoulos — The Distribution of Prime Numbers][R49].
- **50.** [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures][R50].
- **51.** [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture][R51].
- **53.** [Kiran S. Kedlaya — Notes on analytic number theory][R53].
- **54.** [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions][R54].
- **56.** [J.S. Milne — Class Field Theory][R56].
- **58.** [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points][R58].
- **59.** [Ben Green and Terence Tao — The primes contain arbitrarily long arithmetic progressions][R59].
- **60.** [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields][R60].
- **61.** [Jean-François Mestre — Formules explicites et minorations de conducteurs de variétés algébriques][R61].
- **62.** [H. L. Montgomery and R. C. Vaughan — Hilbert’s inequality][R62].
- **63.** [Gaëtan Chenevier, Olivier Taïbi — Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms][R63].
- **64.** [Jacob Tsimerman — The André–Oort conjecture for A_g][R64].
- **65.** [John Tate — Fourier analysis in number fields and Hecke's zeta-functions][R65].
- **66.** [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions][R66].
- **67.** [Asif Ali Zaman — Analytic estimates for the Chebotarev Density Theorem and their applications][R67].
- **71.** [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series][R71].
- **72.** [Stéphane Louboutin — Explicit upper bounds for residues of Dedekind zeta functions and values of L-functions at s=1, and explicit lower bounds for relative class numbers of CM-fields][R72].
- **73.** [Jesse Thorner and Asif Zaman — An explicit bound for the least prime ideal in the Chebotarev density theorem][R73].
- **76.** [Hans Heilbronn — On real zeros of Dedekind ζ-functions][R76].
- **77.** [Hideo Aramata — Über die Teilbarkeit der Dedekindschen Zetafunktionen][R77].
- **78.** [Lillian B. Pierce, Caroline L. Turnage-Butterbaugh and Melanie Matchett Wood — An effective Chebotarev density theorem for families of number fields, with an application to ℓ-torsion in class groups][R78].
- **79.** [Terence Tao — The divisor bound][R79].
- **80.** [A. Smati — Evaluation effective du nombre d’entiers n tels que φ(n) ≤ x][R80].
- **82.** [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces][R82].
- **83.** [Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou — Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields][R83].
- **84.** [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function][R84].
- **85.** [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences][R85].
- **86.** [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors][R86].
- **87.** [Aleksander Simonič and Valeriia V. Starichkova — Atkinson’s formula for the mean square of ζ(s) with an explicit error term][R87].
- **88.** [A. E. Ingham — Mean-value theorems in the theory of the Riemann zeta-function][R88].
- **89.** [J. B. Conrey — A note on the fourth power moment of the Riemann zeta-function][R89].
- **90.** [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder][R90].
- **91.** [P. Shiu — A Brun–Titchmarsh theorem for multiplicative functions][R91].
- **92.** [Stephanie Chan, Peter Koymans, Djordjo Milovic, Carlo Pagano — On the negative Pell equation][R92].

- [94][R94] TauCetiRoadmap, *Arithmetic Galois Representations*, Layer3 §§3.2–3.5 (planned supplier).
- [95][R95] A. Kupers, *Lectures on complex analysis*, 30 April 2020, §14.1 pp.89–93.
- [96][R96] H. Kösters, *The Riemann Zeta-Function and the Sine Kernel*, arXiv:0803.1141v1, §3 pp.9–15 and AppendixA p.20.

- **Bessel functions.** [NIST Digital Library of Mathematical Functions, Chapter10][DLMF-Bessel], particularly §§10.2,10.4,10.6,10.9,10.16; equation numbers are the locators in this unpaginated reference.
- **Nemes.** [Gergő Nemes — Error bounds for the large-argument asymptotic expansions of the Hankel and Bessel functions][Nemes], arXiv:1606.07961v2, 2017; positive-axis remainder theory and AppendixA.
- **Meurman.** [Tom Meurman — A simple proof of Voronoi’s identity][Meurman], Astérisque209 (1992), pp.265–274; endpoint identity, damping and convergence.
- **BBR.** [Djamel Berkane, Olivier Bordellès and Olivier Ramaré — Explicit upper bounds for the remainder term in the divisor problem][BBR], Mathematics of Computation81 (2012), pp.1025–1051; explicit divisor inputs and their proofs.

[R1]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation
[R2]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products
[R3]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-8-landau-type-positivity
[R4]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries
[R5]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-9-wienerikehara
[R6]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer
[R7]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates
[R8]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness
[R9]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md
[R10]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md
[R11]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-0-growth-predicates-and-the-entire-completion
[R12]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-1-gamma-factor-asymptotics-and-the-continued-l-function
[R13]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-3-convexity-in-vertical-strips
[R14]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-4-zero-counting
[R15]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-5-hadamard-factorization
[R16]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-6-zero-free-regions
[R17]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-7-the-riemannvon-mangoldt-formula
[R18]: https://github.com/roed-math/TauCetiRoadmap/blob/cce2e04188a559be9a16037d0d65e00a815fcecc/TauCetiRoadmap/ZerosOfLFunctions/README.md#layer-8-the-explicit-formula
[R19]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters
[R20]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic
[R21]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers
[R22]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles
[R23]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/657d3cc7b7c7af56b43c493af20051cff69acdd5/TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md#adelic-poisson-summation
[R24]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol
[R25]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary
[R26]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units
[R27]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity
[R28]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields
[R29]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors
[R30]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction
[R31]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula
[R32]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/DifferentialGeometry#layer-12-riemannian-metrics-and-the-laplacebeltrami-operator
[R35]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups
[R43]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c
[R44]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-14-natural-density-and-consistency-theorems
[R45]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions
[R46]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-8-the-cyclic-fixed-field-fibre
[R47]: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf
[R48]: https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf
[R49]: https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf
[R50]: https://arxiv.org/pdf/2007.14567v3
[R51]: https://arxiv.org/pdf/2201.13424v1
[R52]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md#layer-4-dirichlet-l-functions-and-factorizations
[R53]: https://kskedlaya.org/papers/ant-ptx.pdf
[R54]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf
[R55]: https://arxiv.org/pdf/1310.0166v2
[R56]: https://www.jmilne.org/math/CourseNotes/CFT.pdf
[R57]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/README.md#layer-5-finite-order-hecke-l-functions
[R58]: https://eprints.gla.ac.uk/292484/1/292484.pdf
[R59]: https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf
[R60]: https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf
[R61]: https://www.numdam.org/item/CM_1986__58_2_209_0.pdf
[R62]: https://personal.science.psu.edu/rcv4/personal/Publications/s2-8-1-73.pdf
[R63]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf
[R64]: https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf
[R65]: https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf
[R66]: https://doi.org/10.1017/S2050508625000009
[R67]: https://www.math.toronto.edu/zaman/files/thesis.pdf
[R68]: https://arxiv.org/pdf/1201.3932v1
[R69]: https://www.jstage.jst.go.jp/article/tmj1949/29/2/29_2_209/_pdf/-char/ja
[R70]: https://www.cs.uleth.ca/~kadiri/articles/zero-free-region-Dedekind-June07-2011.pdf
[R71]: https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf
[R72]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2672D419BA7EA98C5C7C757259F2DA83/S0008414X00028418a.pdf/explicit-upper-bounds-for-residues-of-dedekind-zeta-functions-and-values-of-l-functions-at-s-1-and-explicit-lower-bounds-for-relative-class-numbers-of-cm-fields.pdf
[R73]: https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf
[R74]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0023/LOG_0016.pdf
[R75]: https://arxiv.org/pdf/2510.02309v2
[R76]: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf
[R77]: https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf
[R78]: https://arxiv.org/pdf/1709.09637
[R79]: https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/
[R80]: https://www.impan.pl/shop/publication/transaction/download/product/107486
[R81]: https://arxiv.org/pdf/1710.01389v2
[R82]: https://arxiv.org/pdf/1706.06712v3
[R83]: https://doi.org/10.1017/fmp.2022.14
[R84]: https://arxiv.org/pdf/math/0608407
[R85]: https://arxiv.org/pdf/1706.03749v1
[R86]: https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf
[R87]: https://arxiv.org/pdf/2105.06821v3
[R88]: https://doi.org/10.1112/plms/s2-27.1.273
[R89]: https://arxiv.org/pdf/math/9509224
[R90]: https://arxiv.org/pdf/1601.05324
[R91]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf
[R92]: https://arxiv.org/pdf/1908.01752
[R93]: https://arxiv.org/pdf/1601.05324v2
[R128]: #from-representationtheory
[R129]: #s0-30
[R133]: #s0-17
[R134]: #s0-31a
[R135]: #s0-30a
[R136]: #prerequisites-and-boundaries
[R137]: #s0-31b
[R163]: #s3-12a
[R164]: #s2-32f
[R171]: #s0-32
[R186]: #s2-32e
[R188]: #s2-3
[R190]: #s2-5
[R192]: #s2-7
[R194]: #s2-18a
[R195]: #s2-11
[R197]: #s2-12
[R204]: #s2-13
[R207]: #s2-19
[R208]: #s2-29a
[R209]: #s2-29b
[R210]: #s2-29c
[R211]: #s2-29d
[R212]: #s2-29e
[R213]: #s2-21
[R220]: #s2-29
[R221]: #s2-32g
[R222]: #s2-6
[R225]: #s2-26
[R231]: #s2-34
[R244]: #s2-45
[R287]: #s3-19

[R94]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/856

[R95]: https://www.utsc.utoronto.ca/people/kupers/wp-content/uploads/sites/50/2020/12/complex-analysis-2019.pdf
[R96]: https://arxiv.org/pdf/0803.1141v1

[AL-Bessel]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/ab4ea5c9ff2c4053af6e0d50fef0c8d19fed2ed0/TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md#bessel-transforms
[AS-Bessel]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/d2a1dbdbd97ef6fa88cfae28aa574a1a116f62f9/TauCetiRoadmap/AutomorphicSpectralTheory/README.md#025-bessel-functions-j_ν-and-i_ν
[DLMF-Bessel]: https://dlmf.nist.gov/10
[Nemes]: https://arxiv.org/pdf/1606.07961v2
[Meurman]: https://numdam.org/item/AST_1992__209__265_0.pdf
[BBR]: https://ramare-olivier.github.io/Maths/Divisors-mcom2535.pdf
